
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
--  Generated date: Thu Sep 16 12:53:43 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v6;

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
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
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
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_core_fsm;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_core_fsm IS
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
      COMP_LOOP_C_17, STAGE_LOOP_C_1, main_C_1, main_C_2);

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
      COMP_LOOP_C_16_tr0, COMP_LOOP_16_VEC_LOOP_C_8_tr0, COMP_LOOP_C_17_tr0, STAGE_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
      WHEN COMP_LOOP_1_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_1;
      WHEN COMP_LOOP_1_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_2;
      WHEN COMP_LOOP_1_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_3;
      WHEN COMP_LOOP_1_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_4;
      WHEN COMP_LOOP_1_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_5;
      WHEN COMP_LOOP_1_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_6;
      WHEN COMP_LOOP_1_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_7;
      WHEN COMP_LOOP_1_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_8;
      WHEN COMP_LOOP_1_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        IF ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        IF ( COMP_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_2_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_1;
      WHEN COMP_LOOP_2_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_2;
      WHEN COMP_LOOP_2_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_3;
      WHEN COMP_LOOP_2_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_4;
      WHEN COMP_LOOP_2_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_5;
      WHEN COMP_LOOP_2_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_6;
      WHEN COMP_LOOP_2_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_7;
      WHEN COMP_LOOP_2_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_8;
      WHEN COMP_LOOP_2_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        IF ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_3;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        IF ( COMP_LOOP_C_3_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_3_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_1;
      WHEN COMP_LOOP_3_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_2;
      WHEN COMP_LOOP_3_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_3;
      WHEN COMP_LOOP_3_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_4;
      WHEN COMP_LOOP_3_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_5;
      WHEN COMP_LOOP_3_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_6;
      WHEN COMP_LOOP_3_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_7;
      WHEN COMP_LOOP_3_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_8;
      WHEN COMP_LOOP_3_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        IF ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_4;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        IF ( COMP_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_4_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_1;
      WHEN COMP_LOOP_4_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_2;
      WHEN COMP_LOOP_4_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_3;
      WHEN COMP_LOOP_4_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_4;
      WHEN COMP_LOOP_4_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_5;
      WHEN COMP_LOOP_4_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_6;
      WHEN COMP_LOOP_4_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_7;
      WHEN COMP_LOOP_4_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_8;
      WHEN COMP_LOOP_4_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        IF ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_5;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        IF ( COMP_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_5_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_1;
      WHEN COMP_LOOP_5_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_2;
      WHEN COMP_LOOP_5_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_3;
      WHEN COMP_LOOP_5_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_4;
      WHEN COMP_LOOP_5_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_5;
      WHEN COMP_LOOP_5_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_6;
      WHEN COMP_LOOP_5_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_7;
      WHEN COMP_LOOP_5_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_8;
      WHEN COMP_LOOP_5_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        IF ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        IF ( COMP_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_6_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_1;
      WHEN COMP_LOOP_6_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_2;
      WHEN COMP_LOOP_6_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_3;
      WHEN COMP_LOOP_6_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_4;
      WHEN COMP_LOOP_6_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_5;
      WHEN COMP_LOOP_6_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_6;
      WHEN COMP_LOOP_6_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_7;
      WHEN COMP_LOOP_6_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_8;
      WHEN COMP_LOOP_6_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        IF ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_7;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        IF ( COMP_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_7_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_1;
      WHEN COMP_LOOP_7_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_2;
      WHEN COMP_LOOP_7_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_3;
      WHEN COMP_LOOP_7_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_4;
      WHEN COMP_LOOP_7_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_5;
      WHEN COMP_LOOP_7_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_6;
      WHEN COMP_LOOP_7_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_7;
      WHEN COMP_LOOP_7_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_8;
      WHEN COMP_LOOP_7_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        IF ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        IF ( COMP_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_8_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_1;
      WHEN COMP_LOOP_8_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_2;
      WHEN COMP_LOOP_8_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_3;
      WHEN COMP_LOOP_8_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_4;
      WHEN COMP_LOOP_8_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_5;
      WHEN COMP_LOOP_8_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_6;
      WHEN COMP_LOOP_8_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_7;
      WHEN COMP_LOOP_8_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_8;
      WHEN COMP_LOOP_8_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        IF ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        IF ( COMP_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_9_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_1;
      WHEN COMP_LOOP_9_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_2;
      WHEN COMP_LOOP_9_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_3;
      WHEN COMP_LOOP_9_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_4;
      WHEN COMP_LOOP_9_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_5;
      WHEN COMP_LOOP_9_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_6;
      WHEN COMP_LOOP_9_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_7;
      WHEN COMP_LOOP_9_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_8;
      WHEN COMP_LOOP_9_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        IF ( COMP_LOOP_9_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_10;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        IF ( COMP_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_10_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_1;
      WHEN COMP_LOOP_10_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_2;
      WHEN COMP_LOOP_10_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_3;
      WHEN COMP_LOOP_10_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_4;
      WHEN COMP_LOOP_10_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_5;
      WHEN COMP_LOOP_10_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_6;
      WHEN COMP_LOOP_10_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_7;
      WHEN COMP_LOOP_10_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_8;
      WHEN COMP_LOOP_10_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        IF ( COMP_LOOP_10_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        IF ( COMP_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_11_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_1;
      WHEN COMP_LOOP_11_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_2;
      WHEN COMP_LOOP_11_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_3;
      WHEN COMP_LOOP_11_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_4;
      WHEN COMP_LOOP_11_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_5;
      WHEN COMP_LOOP_11_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_6;
      WHEN COMP_LOOP_11_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_7;
      WHEN COMP_LOOP_11_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_8;
      WHEN COMP_LOOP_11_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        IF ( COMP_LOOP_11_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_12;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        IF ( COMP_LOOP_C_12_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_12_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_1;
      WHEN COMP_LOOP_12_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_2;
      WHEN COMP_LOOP_12_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_3;
      WHEN COMP_LOOP_12_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_4;
      WHEN COMP_LOOP_12_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_5;
      WHEN COMP_LOOP_12_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_6;
      WHEN COMP_LOOP_12_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_7;
      WHEN COMP_LOOP_12_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_8;
      WHEN COMP_LOOP_12_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        IF ( COMP_LOOP_12_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_13;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        IF ( COMP_LOOP_C_13_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_13_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_1;
      WHEN COMP_LOOP_13_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_2;
      WHEN COMP_LOOP_13_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_3;
      WHEN COMP_LOOP_13_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_4;
      WHEN COMP_LOOP_13_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_5;
      WHEN COMP_LOOP_13_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_6;
      WHEN COMP_LOOP_13_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_7;
      WHEN COMP_LOOP_13_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_8;
      WHEN COMP_LOOP_13_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        IF ( COMP_LOOP_13_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_14;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        IF ( COMP_LOOP_C_14_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_14_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_1;
      WHEN COMP_LOOP_14_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_2;
      WHEN COMP_LOOP_14_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_3;
      WHEN COMP_LOOP_14_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_4;
      WHEN COMP_LOOP_14_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_5;
      WHEN COMP_LOOP_14_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_6;
      WHEN COMP_LOOP_14_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_7;
      WHEN COMP_LOOP_14_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_8;
      WHEN COMP_LOOP_14_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        IF ( COMP_LOOP_14_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_15;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        IF ( COMP_LOOP_C_15_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_15_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_1;
      WHEN COMP_LOOP_15_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_2;
      WHEN COMP_LOOP_15_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_3;
      WHEN COMP_LOOP_15_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_4;
      WHEN COMP_LOOP_15_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_5;
      WHEN COMP_LOOP_15_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_6;
      WHEN COMP_LOOP_15_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_7;
      WHEN COMP_LOOP_15_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_8;
      WHEN COMP_LOOP_15_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        IF ( COMP_LOOP_15_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_16;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        IF ( COMP_LOOP_C_16_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_16_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_1;
      WHEN COMP_LOOP_16_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_2;
      WHEN COMP_LOOP_16_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_3;
      WHEN COMP_LOOP_16_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_4;
      WHEN COMP_LOOP_16_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_5;
      WHEN COMP_LOOP_16_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_6;
      WHEN COMP_LOOP_16_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_7;
      WHEN COMP_LOOP_16_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_8;
      WHEN COMP_LOOP_16_VEC_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        IF ( COMP_LOOP_16_VEC_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        IF ( COMP_LOOP_C_17_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
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

END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_staller IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_ogwt : STD_LOGIC;

BEGIN
  complete_rsci_bdwt <= complete_rsci_oswt AND core_wen;
  complete_rsci_biwt <= complete_rsci_ogwt AND complete_rsci_irdy;
  complete_rsci_ogwt <= complete_rsci_oswt AND (NOT complete_rsci_bcwt);
  complete_rsci_ivld_core_sct <= complete_rsci_ogwt;
END v6;

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
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC;
    twiddle_h_rsci_biwt_1 : IN STD_LOGIC;
    twiddle_h_rsci_bdwt_2 : IN STD_LOGIC;
    twiddle_h_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_h_rsci_adra_d_core_sct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
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
  twiddle_h_rsci_adra_d <= (twiddle_h_rsci_adra_d_core_pff(23 DOWNTO 14)) & (NOT
      (twiddle_h_rsci_adra_d_core_sct_pff(1))) & (NOT (twiddle_h_rsci_adra_d_core_sct_pff(1)))
      & (twiddle_h_rsci_adra_d_core_pff(11 DOWNTO 0));
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
END v6;

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
    twiddle_h_rsci_adra_d_core_sct_pff : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_h_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_dswt_1_pff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_dswt_pff : STD_LOGIC;

BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= (NOT core_wten) AND twiddle_h_rsci_oswt;
  twiddle_h_rsci_bdwt_2 <= twiddle_h_rsci_oswt_1 AND core_wen;
  twiddle_h_rsci_biwt_1 <= (NOT core_wten) AND twiddle_h_rsci_oswt_1;
  twiddle_h_rsci_adra_d_core_sct_pff <= twiddle_h_rsci_adra_d_core_psct_pff AND STD_LOGIC_VECTOR'(
      twiddle_h_rsci_dswt_1_pff & twiddle_h_rsci_dswt_pff);
  twiddle_h_rsci_dswt_1_pff <= (NOT core_wten_pff) AND twiddle_h_rsci_oswt_1_pff;
  twiddle_h_rsci_dswt_pff <= (NOT core_wten_pff) AND twiddle_h_rsci_oswt_pff;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      AND STD_LOGIC_VECTOR'( twiddle_h_rsci_dswt_1_pff & twiddle_h_rsci_dswt_pff);
END v6;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC;
    twiddle_rsci_biwt_1 : IN STD_LOGIC;
    twiddle_rsci_bdwt_2 : IN STD_LOGIC;
    twiddle_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_rsci_adra_d_core_sct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
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
  twiddle_rsci_adra_d <= (twiddle_rsci_adra_d_core_pff(23 DOWNTO 14)) & (NOT (twiddle_rsci_adra_d_core_sct_pff(1)))
      & (NOT (twiddle_rsci_adra_d_core_sct_pff(1))) & (twiddle_rsci_adra_d_core_pff(11
      DOWNTO 0));
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
END v6;

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
    twiddle_rsci_adra_d_core_sct_pff : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_dswt_1_pff : STD_LOGIC;
  SIGNAL twiddle_rsci_dswt_pff : STD_LOGIC;

BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= (NOT core_wten) AND twiddle_rsci_oswt;
  twiddle_rsci_bdwt_2 <= twiddle_rsci_oswt_1 AND core_wen;
  twiddle_rsci_biwt_1 <= (NOT core_wten) AND twiddle_rsci_oswt_1;
  twiddle_rsci_adra_d_core_sct_pff <= twiddle_rsci_adra_d_core_psct_pff AND STD_LOGIC_VECTOR'(
      twiddle_rsci_dswt_1_pff & twiddle_rsci_dswt_pff);
  twiddle_rsci_dswt_1_pff <= (NOT core_wten_pff) AND twiddle_rsci_oswt_1_pff;
  twiddle_rsci_dswt_pff <= (NOT core_wten_pff) AND twiddle_rsci_oswt_pff;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      AND STD_LOGIC_VECTOR'( twiddle_rsci_dswt_1_pff & twiddle_rsci_dswt_pff);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  COMP_LOOP_1_mult_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo_2 OR ensig_cgo_iro_2);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_complete_rsci IS
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
END v6;

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
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
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
    twiddle_h_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_h_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_biwt_1 : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_core_sct_iff : STD_LOGIC_VECTOR (1 DOWNTO 0);

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
      twiddle_h_rsci_adra_d_core_sct_pff : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_h_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_sct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_psct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC;
      twiddle_h_rsci_biwt_1 : IN STD_LOGIC;
      twiddle_h_rsci_bdwt_2 : IN STD_LOGIC;
      twiddle_h_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_h_rsci_adra_d_core_sct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_sct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

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
      twiddle_h_rsci_adra_d_core_sct_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_sct_pff,
      twiddle_h_rsci_adra_d_core_psct_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_psct_pff,
      core_wten_pff => core_wten_pff,
      twiddle_h_rsci_oswt_1_pff => twiddle_h_rsci_oswt_1_pff,
      twiddle_h_rsci_oswt_pff => twiddle_h_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_h_rsci_adra_d_core_sct_iff <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_sct_pff;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_adra_d_core_psct_pff
      <= twiddle_h_rsci_adra_d_core_psct_pff;

  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d,
      twiddle_h_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_biwt_1 => twiddle_h_rsci_biwt_1,
      twiddle_h_rsci_bdwt_2 => twiddle_h_rsci_bdwt_2,
      twiddle_h_rsci_adra_d_core_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff,
      twiddle_h_rsci_adra_d_core_sct_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_sct_pff
    );
  twiddle_h_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d
      <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff
      <= (twiddle_h_rsci_adra_d_core_pff(23 DOWNTO 14)) & STD_LOGIC_VECTOR'( "00")
      & (twiddle_h_rsci_adra_d_core_pff(11 DOWNTO 0));
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_sct_pff
      <= twiddle_h_rsci_adra_d_core_sct_iff;

  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v6;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
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
    twiddle_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    core_wten_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIT_precomp_core_twiddle_rsci_1;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_biwt_1 : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_core_sct_iff : STD_LOGIC_VECTOR (1 DOWNTO 0);

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
      twiddle_rsci_adra_d_core_sct_pff : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      twiddle_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_sct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_psct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_qa_d_mxwt : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC;
      twiddle_rsci_biwt_1 : IN STD_LOGIC;
      twiddle_rsci_bdwt_2 : IN STD_LOGIC;
      twiddle_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_rsci_adra_d_core_sct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_sct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

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
      twiddle_rsci_adra_d_core_sct_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_sct_pff,
      twiddle_rsci_adra_d_core_psct_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_psct_pff,
      core_wten_pff => core_wten_pff,
      twiddle_rsci_oswt_1_pff => twiddle_rsci_oswt_1_pff,
      twiddle_rsci_oswt_pff => twiddle_rsci_oswt_pff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  twiddle_rsci_adra_d_core_sct_iff <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_sct_pff;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_adra_d_core_psct_pff
      <= twiddle_rsci_adra_d_core_psct_pff;

  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst : inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_adra_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d,
      twiddle_rsci_qa_d => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_biwt_1 => twiddle_rsci_biwt_1,
      twiddle_rsci_bdwt_2 => twiddle_rsci_bdwt_2,
      twiddle_rsci_adra_d_core_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff,
      twiddle_rsci_adra_d_core_sct_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_sct_pff
    );
  twiddle_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d
      <= twiddle_rsci_qa_d;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff
      <= (twiddle_rsci_adra_d_core_pff(23 DOWNTO 14)) & STD_LOGIC_VECTOR'( "00")
      & (twiddle_rsci_adra_d_core_pff(11 DOWNTO 0));
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_sct_pff
      <= twiddle_rsci_adra_d_core_sct_iff;

  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core_run_rsci IS
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
END v6;

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
    vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0)
  );
END inPlaceNTT_DIT_precomp_core;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp_core IS
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
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL nor_tmp_25 : STD_LOGIC;
  SIGNAL or_dcpl_81 : STD_LOGIC;
  SIGNAL or_tmp_95 : STD_LOGIC;
  SIGNAL mux_tmp_128 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL or_tmp_97 : STD_LOGIC;
  SIGNAL mux_tmp_130 : STD_LOGIC;
  SIGNAL or_tmp_98 : STD_LOGIC;
  SIGNAL mux_tmp_148 : STD_LOGIC;
  SIGNAL mux_tmp_149 : STD_LOGIC;
  SIGNAL mux_tmp_150 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL mux_tmp_157 : STD_LOGIC;
  SIGNAL or_tmp_115 : STD_LOGIC;
  SIGNAL or_tmp_118 : STD_LOGIC;
  SIGNAL mux_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL nor_tmp_31 : STD_LOGIC;
  SIGNAL mux_tmp_169 : STD_LOGIC;
  SIGNAL or_tmp_125 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL or_tmp_138 : STD_LOGIC;
  SIGNAL or_tmp_149 : STD_LOGIC;
  SIGNAL or_tmp_151 : STD_LOGIC;
  SIGNAL or_tmp_153 : STD_LOGIC;
  SIGNAL or_tmp_169 : STD_LOGIC;
  SIGNAL not_tmp_100 : STD_LOGIC;
  SIGNAL or_tmp_170 : STD_LOGIC;
  SIGNAL mux_tmp_212 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL not_tmp_102 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL nor_tmp_34 : STD_LOGIC;
  SIGNAL or_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_224 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL mux_tmp_235 : STD_LOGIC;
  SIGNAL and_dcpl_102 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL or_tmp_203 : STD_LOGIC;
  SIGNAL mux_tmp_242 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL or_tmp_231 : STD_LOGIC;
  SIGNAL mux_tmp_273 : STD_LOGIC;
  SIGNAL mux_tmp_276 : STD_LOGIC;
  SIGNAL mux_tmp_277 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL or_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL or_tmp_255 : STD_LOGIC;
  SIGNAL mux_tmp_299 : STD_LOGIC;
  SIGNAL mux_tmp_305 : STD_LOGIC;
  SIGNAL mux_tmp_306 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL mux_tmp_309 : STD_LOGIC;
  SIGNAL or_tmp_261 : STD_LOGIC;
  SIGNAL mux_tmp_317 : STD_LOGIC;
  SIGNAL mux_tmp_318 : STD_LOGIC;
  SIGNAL nor_tmp_42 : STD_LOGIC;
  SIGNAL mux_tmp_321 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_354 : STD_LOGIC;
  SIGNAL mux_tmp_359 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL or_tmp_282 : STD_LOGIC;
  SIGNAL or_tmp_283 : STD_LOGIC;
  SIGNAL or_tmp_294 : STD_LOGIC;
  SIGNAL mux_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL or_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_422 : STD_LOGIC;
  SIGNAL mux_tmp_429 : STD_LOGIC;
  SIGNAL or_tmp_322 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL or_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_466 : STD_LOGIC;
  SIGNAL mux_tmp_467 : STD_LOGIC;
  SIGNAL not_tmp_195 : STD_LOGIC;
  SIGNAL mux_tmp_475 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL VEC_LOOP_j_10_12_0_sva_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL or_229_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_2_cse : STD_LOGIC;
  SIGNAL or_169_cse : STD_LOGIC;
  SIGNAL or_166_cse : STD_LOGIC;
  SIGNAL or_164_cse : STD_LOGIC;
  SIGNAL or_222_cse : STD_LOGIC;
  SIGNAL or_223_cse : STD_LOGIC;
  SIGNAL or_476_cse : STD_LOGIC;
  SIGNAL or_249_cse : STD_LOGIC;
  SIGNAL or_54_cse : STD_LOGIC;
  SIGNAL mux_119_cse : STD_LOGIC;
  SIGNAL or_435_cse : STD_LOGIC;
  SIGNAL or_243_cse : STD_LOGIC;
  SIGNAL or_319_cse : STD_LOGIC;
  SIGNAL or_463_cse : STD_LOGIC;
  SIGNAL or_136_cse : STD_LOGIC;
  SIGNAL or_473_cse : STD_LOGIC;
  SIGNAL or_308_cse : STD_LOGIC;
  SIGNAL or_309_cse : STD_LOGIC;
  SIGNAL nor_70_cse : STD_LOGIC;
  SIGNAL or_256_cse : STD_LOGIC;
  SIGNAL or_254_cse : STD_LOGIC;
  SIGNAL or_224_cse : STD_LOGIC;
  SIGNAL mux_142_cse : STD_LOGIC;
  SIGNAL mux_485_cse : STD_LOGIC;
  SIGNAL mux_484_cse : STD_LOGIC;
  SIGNAL mux_158_cse : STD_LOGIC;
  SIGNAL or_322_cse : STD_LOGIC;
  SIGNAL or_485_cse : STD_LOGIC;
  SIGNAL or_482_cse : STD_LOGIC;
  SIGNAL mux_152_cse : STD_LOGIC;
  SIGNAL mux_162_cse : STD_LOGIC;
  SIGNAL nand_3_cse : STD_LOGIC;
  SIGNAL or_195_cse : STD_LOGIC;
  SIGNAL or_204_cse : STD_LOGIC;
  SIGNAL mux_259_cse : STD_LOGIC;
  SIGNAL mux_163_cse : STD_LOGIC;
  SIGNAL mux_257_cse : STD_LOGIC;
  SIGNAL nor_118_cse : STD_LOGIC;
  SIGNAL mux_260_cse : STD_LOGIC;
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_adra_d_reg : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_44_rmff : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_29_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_57_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_66_rmff : STD_LOGIC;
  SIGNAL and_101_rmff : STD_LOGIC;
  SIGNAL nor_114_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_reg : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL and_138_rmff : STD_LOGIC;
  SIGNAL factor1_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_mult_vec_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_9_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_9_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_mul_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_147_itm : STD_LOGIC;
  SIGNAL mux_261_itm : STD_LOGIC;
  SIGNAL mux_285_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_lshift_itm : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_219_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_169 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_172 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_174 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL and_dcpl_177 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_189 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_196 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_210 : STD_LOGIC;
  SIGNAL and_dcpl_213 : STD_LOGIC;
  SIGNAL and_dcpl_215 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL and_dcpl_217 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_224 : STD_LOGIC;
  SIGNAL and_dcpl_228 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL and_dcpl_230 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL or_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_497 : STD_LOGIC;
  SIGNAL not_tmp_233 : STD_LOGIC;
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_237 : STD_LOGIC;
  SIGNAL and_dcpl_238 : STD_LOGIC;
  SIGNAL and_dcpl_241 : STD_LOGIC;
  SIGNAL and_dcpl_242 : STD_LOGIC;
  SIGNAL and_dcpl_243 : STD_LOGIC;
  SIGNAL and_dcpl_247 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_257 : STD_LOGIC;
  SIGNAL and_dcpl_259 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_264 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_268 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_282 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL and_dcpl_305 : STD_LOGIC;
  SIGNAL and_dcpl_306 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_dcpl_311 : STD_LOGIC;
  SIGNAL and_dcpl_312 : STD_LOGIC;
  SIGNAL and_dcpl_314 : STD_LOGIC;
  SIGNAL and_dcpl_316 : STD_LOGIC;
  SIGNAL and_dcpl_321 : STD_LOGIC;
  SIGNAL and_dcpl_323 : STD_LOGIC;
  SIGNAL and_dcpl_325 : STD_LOGIC;
  SIGNAL and_dcpl_331 : STD_LOGIC;
  SIGNAL and_dcpl_334 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL or_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_507 : STD_LOGIC;
  SIGNAL mux_tmp_508 : STD_LOGIC;
  SIGNAL mux_tmp_509 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_465 : STD_LOGIC;
  SIGNAL and_dcpl_469 : STD_LOGIC;
  SIGNAL and_dcpl_473 : STD_LOGIC;
  SIGNAL and_dcpl_478 : STD_LOGIC;
  SIGNAL and_dcpl_481 : STD_LOGIC;
  SIGNAL and_dcpl_483 : STD_LOGIC;
  SIGNAL and_dcpl_486 : STD_LOGIC;
  SIGNAL and_dcpl_488 : STD_LOGIC;
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_505 : STD_LOGIC;
  SIGNAL and_dcpl_509 : STD_LOGIC;
  SIGNAL and_dcpl_515 : STD_LOGIC;
  SIGNAL and_dcpl_518 : STD_LOGIC;
  SIGNAL and_dcpl_521 : STD_LOGIC;
  SIGNAL and_dcpl_523 : STD_LOGIC;
  SIGNAL and_dcpl_526 : STD_LOGIC;
  SIGNAL and_dcpl_528 : STD_LOGIC;
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_k_12_4_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c0 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c2 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_6_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_11_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_15_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_9_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_10_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_11_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_50_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_51_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_52_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_53_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_54_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_55_cse : STD_LOGIC;
  SIGNAL and_172_cse : STD_LOGIC;
  SIGNAL and_193_cse : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL not_tmp : STD_LOGIC;
  SIGNAL nor_tmp_55 : STD_LOGIC;
  SIGNAL or_tmp_403 : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_2_rgt : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_11_psp_sva_10 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_11_psp_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL nor_62_cse : STD_LOGIC;
  SIGNAL nor_55_cse_1 : STD_LOGIC;
  SIGNAL or_526_cse : STD_LOGIC;
  SIGNAL or_512_cse : STD_LOGIC;
  SIGNAL nor_182_cse : STD_LOGIC;
  SIGNAL nor_178_cse : STD_LOGIC;
  SIGNAL and_169_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_18_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_5_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_20_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_1_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_62_itm : STD_LOGIC;
  SIGNAL and_354_itm : STD_LOGIC;
  SIGNAL and_371_itm : STD_LOGIC;
  SIGNAL and_380_itm : STD_LOGIC;
  SIGNAL and_388_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_59_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_68_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_71_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_10_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL z_out_4_20_12 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL acc_4_cse_12_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_or_83_cse : STD_LOGIC;

  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL or_186_nl : STD_LOGIC;
  SIGNAL or_185_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL or_177_nl : STD_LOGIC;
  SIGNAL nand_2_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL nor_84_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL or_275_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL nor_72_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL or_272_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL nand_31_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_14_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL nor_69_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL or_280_nl : STD_LOGIC;
  SIGNAL or_278_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_29_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_twiddle_f_mul_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_123_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_57_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL or_288_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL or_286_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL nand_30_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL nor_65_nl : STD_LOGIC;
  SIGNAL nor_66_nl : STD_LOGIC;
  SIGNAL or_489_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL or_481_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL or_312_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL or_311_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL or_310_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL nand_24_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL nand_22_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL mux_517_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL or_492_nl : STD_LOGIC;
  SIGNAL or_493_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL or_353_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL or_487_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL or_350_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL or_368_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL or_363_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL or_361_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL or_360_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL or_359_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL or_355_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_10_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL nor_141_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_not_1_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL or_380_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL or_378_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL or_376_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL and_171_nl : STD_LOGIC;
  SIGNAL or_371_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL or_516_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_48_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_49_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL mux_410_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL and_160_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_3_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_not_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL or_453_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL or_452_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL or_451_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL mux_477_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL nor_57_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL and_164_nl : STD_LOGIC;
  SIGNAL nor_56_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL or_527_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL or_522_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL nor_177_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL or_190_nl : STD_LOGIC;
  SIGNAL or_438_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL or_213_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_211_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL nand_32_nl : STD_LOGIC;
  SIGNAL or_88_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL or_494_nl : STD_LOGIC;
  SIGNAL or_495_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL or_260_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL or_259_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL or_257_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL nor_75_nl : STD_LOGIC;
  SIGNAL nor_73_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL nor_71_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL or_305_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL or_366_nl : STD_LOGIC;
  SIGNAL nand_29_nl : STD_LOGIC;
  SIGNAL or_403_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL or_469_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL or_7_nl : STD_LOGIC;
  SIGNAL or_24_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL or_429_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_8_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL and_84_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL and_82_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_29_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL nor_117_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL or_227_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL or_219_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL or_239_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL or_238_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL or_233_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_7_nl : STD_LOGIC;
  SIGNAL nor_115_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL or_251_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL or_245_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL mux_515_nl : STD_LOGIC;
  SIGNAL or_498_nl : STD_LOGIC;
  SIGNAL or_497_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL or_502_nl : STD_LOGIC;
  SIGNAL or_505_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL or_506_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL or_508_nl : STD_LOGIC;
  SIGNAL or_513_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_166_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_30_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_16_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_nor_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_167_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_31_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_32_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_168_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_169_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_33_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_9_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_or_75_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL or_534_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL nand_41_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL or_535_nl : STD_LOGIC;
  SIGNAL mux_543_nl : STD_LOGIC;
  SIGNAL and_593_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_10_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_17_nl : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL VEC_LOOP_or_76_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_18_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_19_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_or_77_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_33_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_594_nl : STD_LOGIC;
  SIGNAL and_595_nl : STD_LOGIC;
  SIGNAL and_596_nl : STD_LOGIC;
  SIGNAL and_597_nl : STD_LOGIC;
  SIGNAL and_598_nl : STD_LOGIC;
  SIGNAL and_599_nl : STD_LOGIC;
  SIGNAL and_600_nl : STD_LOGIC;
  SIGNAL and_601_nl : STD_LOGIC;
  SIGNAL and_602_nl : STD_LOGIC;
  SIGNAL and_603_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_78_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL VEC_LOOP_nor_18_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_34_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_604_nl : STD_LOGIC;
  SIGNAL and_605_nl : STD_LOGIC;
  SIGNAL and_606_nl : STD_LOGIC;
  SIGNAL and_607_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_20_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_36_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_608_nl : STD_LOGIC;
  SIGNAL acc_12_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_21_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_79_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_22_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_13_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_35_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_80_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_20_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_11_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_36_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL VEC_LOOP_or_81_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_23_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_24_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL acc_15_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_19_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_12_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_or_82_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_23_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_13_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_20_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_21_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_22_nl : STD_LOGIC;
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

  SIGNAL STAGE_LOOP_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_z : STD_LOGIC_VECTOR (12 DOWNTO 0);

  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (11 DOWNTO 0);

  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

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
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
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
      twiddle_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d : STD_LOGIC_VECTOR
      (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
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
      twiddle_h_rsci_adra_d_core_pff : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_h_rsci_adra_d_core_psct_pff : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      core_wten_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_1_pff : IN STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d :
      STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt
      : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff
      : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff
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
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
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
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
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

  FUNCTION MUX1HOT_v_10_5_2(input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_3_2(input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_12_3_2(input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(11 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_12_4_2(input_3 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(11 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_3_6_2(input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_4_13_2(input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(12 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_8_11_2(input_10 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(10 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_8_7_2(input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
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

  FUNCTION MUX_v_12_2_2(input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);

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

  FUNCTION READSLICE_1_13(input_val:STD_LOGIC_VECTOR(12 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 12);
  BEGIN
    RETURN input_val(sat_index);
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
      ccs_ccore_start_rsc_dat => and_138_rmff,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= z_out_15;
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => and_138_rmff,
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
  COMP_LOOP_1_mult_cmp_y_rsc_dat <= MUX_v_32_2_2(COMP_LOOP_twiddle_f_1_sva, COMP_LOOP_twiddle_f_9_sva,
      and_dcpl_136);
  COMP_LOOP_1_mult_cmp_y_rsc_dat_1 <= MUX_v_32_2_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_9_sva, and_dcpl_136);
  COMP_LOOP_1_mult_cmp_p_rsc_dat <= p_sva;
  COMP_LOOP_1_mult_cmp_return_rsc_z <= COMP_LOOP_1_mult_cmp_return_rsc_z_1;
  COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat <= NOT((MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_288,
      (MUX_s_1_2_2((MUX_s_1_2_2(((NOT (fsm_output(6))) OR (NOT (fsm_output(2))) OR
      (fsm_output(4))), ((fsm_output(6)) OR (NOT mux_tmp_148)), fsm_output(7))),
      or_tmp_243, fsm_output(5))), fsm_output(3))), (MUX_s_1_2_2(((fsm_output(5))
      OR (MUX_s_1_2_2((NOT mux_tmp_149), ((fsm_output(6)) OR (fsm_output(2)) OR (NOT
      (fsm_output(4)))), fsm_output(7)))), mux_tmp_288, fsm_output(3))), fsm_output(1)))
      OR (fsm_output(0)));

  STAGE_LOOP_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 13
      )
    PORT MAP(
      a => STAGE_LOOP_lshift_rg_a,
      s => STAGE_LOOP_lshift_rg_s,
      z => STAGE_LOOP_lshift_rg_z
    );
  STAGE_LOOP_lshift_rg_a(0) <= '1';
  STAGE_LOOP_lshift_rg_s <= STAGE_LOOP_i_3_0_sva;
  STAGE_LOOP_lshift_itm <= STAGE_LOOP_lshift_rg_z;

  COMP_LOOP_9_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 9
      )
    PORT MAP(
      a => COMP_LOOP_9_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_9_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_9_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_9_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_9_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
  COMP_LOOP_9_twiddle_f_lshift_itm <= COMP_LOOP_9_twiddle_f_lshift_rg_z;

  COMP_LOOP_2_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 12
      )
    PORT MAP(
      a => COMP_LOOP_2_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_2_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_2_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_2_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_2_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva;
  COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1 <= COMP_LOOP_2_twiddle_f_lshift_rg_z;

  COMP_LOOP_3_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_3_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_3_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_3_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_3_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_3_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva;
  COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 <= COMP_LOOP_3_twiddle_f_lshift_rg_z;

  COMP_LOOP_1_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => COMP_LOOP_1_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_1_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_1_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_1_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0,
      COMP_LOOP_1_twiddle_f_acc_cse_sva, CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("00100000")));
  z_out <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

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
      vec_rsci_oswt_1_pff => nor_118_cse
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000000000000000000000") & (MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_9_sva, VEC_LOOP_mult_vec_1_sva, COMP_LOOP_twiddle_f_1_sva,
      STD_LOGIC_VECTOR'( (NOT(mux_260_cse OR (fsm_output(0)))) & ((NOT mux_219_itm)
      AND (fsm_output(0))) & (not_tmp_102 AND and_dcpl_89) & (and_dcpl_59 AND and_dcpl_92))));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct <= STD_LOGIC_VECTOR'(
      '0' & (NOT mux_260_cse));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( nor_118_cse & nor_118_cse);
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (NOT mux_260_cse));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff <= NOT mux_147_itm;

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
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_261_itm;
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 <= NOT mux_285_itm;

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
      twiddle_rsci_oswt_1 => reg_twiddle_rsci_oswt_1_cse,
      twiddle_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsci_adra_d_core_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff,
      twiddle_rsci_adra_d_core_psct_pff => inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff,
      core_wten_pff => core_wten_iff,
      twiddle_rsci_oswt_1_pff => and_101_rmff,
      twiddle_rsci_oswt_pff => nor_114_rmff
    );
  twiddle_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_101_rmff & nor_114_rmff);
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff <=
      (z_out_1(9 DOWNTO 0)) & STD_LOGIC_VECTOR'( "00") & COMP_LOOP_twiddle_f_mux1h_44_rmff
      & COMP_LOOP_twiddle_f_and_rmff & COMP_LOOP_twiddle_f_mux1h_29_rmff & COMP_LOOP_twiddle_f_mux1h_57_rmff
      & COMP_LOOP_twiddle_f_mux1h_66_rmff;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff
      <= STD_LOGIC_VECTOR'( and_101_rmff & nor_114_rmff);

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
      twiddle_h_rsci_oswt_1 => reg_twiddle_rsci_oswt_1_cse,
      twiddle_h_rsci_qa_d_mxwt => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsci_adra_d_core_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff,
      twiddle_h_rsci_adra_d_core_psct_pff => inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff,
      core_wten_pff => core_wten_iff,
      twiddle_h_rsci_oswt_1_pff => and_101_rmff,
      twiddle_h_rsci_oswt_pff => nor_114_rmff
    );
  twiddle_h_rsci_adra_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_101_rmff & nor_114_rmff);
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff
      <= (z_out_1(9 DOWNTO 0)) & STD_LOGIC_VECTOR'( "00") & COMP_LOOP_twiddle_f_mux1h_44_rmff
      & COMP_LOOP_twiddle_f_and_rmff & COMP_LOOP_twiddle_f_mux1h_29_rmff & COMP_LOOP_twiddle_f_mux1h_57_rmff
      & COMP_LOOP_twiddle_f_mux1h_66_rmff;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff
      <= STD_LOGIC_VECTOR'( and_101_rmff & nor_114_rmff);

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
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIT_precomp_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_18(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (READSLICE_1_13(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1'
      & (NOT (STAGE_LOOP_lshift_psp_sva(12 DOWNTO 1)))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_12_4_sva_7_0
      & STD_LOGIC_VECTOR'( "0101")), 12), 13) + SIGNED'( "0000000000001"), 13)),
      12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT (z_out_16(9));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT (z_out_18(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 <= NOT (z_out_3(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT (z_out_16(8));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_12_0_sva_1(12);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 <= NOT (z_out_4_20_12(0));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  mux_142_cse <= MUX_s_1_2_2(or_243_cse, or_54_cse, fsm_output(2));
  or_186_nl <= (fsm_output(0)) OR (NOT (fsm_output(6))) OR (fsm_output(7));
  mux_143_nl <= MUX_s_1_2_2(or_186_nl, or_tmp_97, fsm_output(2));
  mux_144_nl <= MUX_s_1_2_2(mux_143_nl, mux_tmp_129, fsm_output(4));
  or_185_nl <= (fsm_output(4)) OR mux_142_cse;
  mux_145_nl <= MUX_s_1_2_2(mux_144_nl, or_185_nl, fsm_output(5));
  mux_140_nl <= MUX_s_1_2_2(or_435_cse, or_tmp_98, fsm_output(4));
  mux_138_nl <= MUX_s_1_2_2(or_54_cse, or_tmp_95, fsm_output(2));
  mux_139_nl <= MUX_s_1_2_2(mux_tmp_130, mux_138_nl, fsm_output(4));
  mux_141_nl <= MUX_s_1_2_2(mux_140_nl, mux_139_nl, fsm_output(5));
  mux_146_nl <= MUX_s_1_2_2(mux_145_nl, mux_141_nl, fsm_output(3));
  mux_134_nl <= MUX_s_1_2_2(or_243_cse, mux_tmp_128, fsm_output(2));
  mux_135_nl <= MUX_s_1_2_2(mux_134_nl, or_435_cse, fsm_output(4));
  mux_133_nl <= MUX_s_1_2_2(or_tmp_98, mux_tmp_130, fsm_output(4));
  mux_136_nl <= MUX_s_1_2_2(mux_135_nl, mux_133_nl, fsm_output(5));
  mux_131_nl <= MUX_s_1_2_2(mux_tmp_130, mux_tmp_129, fsm_output(4));
  or_177_nl <= (fsm_output(4)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(6)))
      OR (fsm_output(7));
  mux_132_nl <= MUX_s_1_2_2(mux_131_nl, or_177_nl, fsm_output(5));
  mux_137_nl <= MUX_s_1_2_2(mux_136_nl, mux_132_nl, fsm_output(3));
  mux_147_itm <= MUX_s_1_2_2(mux_146_nl, mux_137_nl, fsm_output(1));
  nor_84_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(4))));
  mux_151_nl <= MUX_s_1_2_2(mux_tmp_148, nor_84_nl, fsm_output(6));
  nand_2_nl <= NOT((fsm_output(5)) AND mux_151_nl);
  or_191_nl <= (fsm_output(5)) OR (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(4));
  mux_152_cse <= MUX_s_1_2_2(nand_2_nl, or_191_nl, fsm_output(7));
  nor_83_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(4))));
  mux_154_nl <= MUX_s_1_2_2(nor_83_nl, mux_tmp_149, fsm_output(5));
  or_195_cse <= (fsm_output(7)) OR (NOT mux_154_nl);
  mux_155_nl <= MUX_s_1_2_2(mux_tmp_150, or_195_cse, fsm_output(3));
  mux_153_nl <= MUX_s_1_2_2(mux_152_cse, mux_tmp_150, fsm_output(3));
  mux_156_nl <= MUX_s_1_2_2(mux_155_nl, mux_153_nl, fsm_output(1));
  nor_118_cse <= NOT(mux_156_nl OR (fsm_output(0)));
  or_222_cse <= (NOT (fsm_output(6))) OR (fsm_output(7)) OR (fsm_output(4));
  or_223_cse <= (fsm_output(7)) OR (NOT (fsm_output(4)));
  or_224_cse <= (fsm_output(7)) OR (fsm_output(4));
  or_229_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0101"));
  or_249_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_243_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  nor_72_nl <= NOT((NOT (fsm_output(2))) OR COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm
      OR (fsm_output(4)));
  mux_229_nl <= MUX_s_1_2_2(nor_72_nl, mux_tmp_222, fsm_output(6));
  or_275_nl <= (fsm_output(7)) OR (fsm_output(5)) OR (NOT mux_229_nl);
  mux_230_nl <= MUX_s_1_2_2(mux_tmp_224, or_275_nl, fsm_output(3));
  mux_225_nl <= MUX_s_1_2_2((fsm_output(4)), (NOT nor_tmp_34), fsm_output(2));
  mux_226_nl <= MUX_s_1_2_2(mux_225_nl, or_tmp_185, fsm_output(6));
  nand_31_nl <= NOT((fsm_output(6)) AND (fsm_output(2)) AND (NOT (fsm_output(4)))
      AND (VEC_LOOP_j_10_12_0_sva_1(12)));
  mux_227_nl <= MUX_s_1_2_2(mux_226_nl, nand_31_nl, fsm_output(5));
  or_272_nl <= (fsm_output(7)) OR mux_227_nl;
  mux_228_nl <= MUX_s_1_2_2(or_272_nl, mux_tmp_224, fsm_output(3));
  mux_231_nl <= MUX_s_1_2_2(mux_230_nl, mux_228_nl, fsm_output(1));
  nor_114_rmff <= NOT(mux_231_nl OR (fsm_output(0)));
  and_101_rmff <= and_dcpl_99 AND (fsm_output(3)) AND (NOT (fsm_output(2))) AND (NOT
      (fsm_output(7))) AND (fsm_output(1)) AND (NOT (fsm_output(0))) AND (VEC_LOOP_j_10_12_0_sva_1(12));
  COMP_LOOP_twiddle_f_or_6_cse <= and_dcpl_102 OR (and_dcpl_41 AND and_dcpl_34) OR
      and_dcpl_106 OR (and_dcpl_55 AND and_dcpl_34) OR (and_dcpl_66 AND and_dcpl_26);
  COMP_LOOP_twiddle_f_or_11_cse <= ((NOT or_tmp_125) AND and_dcpl_35 AND and_dcpl_31)
      OR (and_dcpl_59 AND and_dcpl_19) OR (and_dcpl_22 AND and_dcpl_116);
  COMP_LOOP_twiddle_f_or_15_cse <= (and_dcpl_57 AND and_dcpl_26) OR (nor_tmp_31 AND
      nor_182_cse AND and_dcpl_31) OR (and_dcpl_28 AND and_dcpl_69);
  COMP_LOOP_twiddle_f_mux1h_14_nl <= MUX1HOT_s_1_6_2((z_out_1(3)), (z_out_1(2)),
      (COMP_LOOP_9_twiddle_f_mul_psp_sva(0)), (z_out_2(2)), (z_out_2(3)), (z_out_1(1)),
      STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_6_cse & and_dcpl_103 & and_dcpl_105
      & COMP_LOOP_twiddle_f_or_11_cse & COMP_LOOP_twiddle_f_or_15_cse & and_dcpl_114));
  nor_69_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")) OR
      (NOT mux_tmp_232));
  mux_237_nl <= MUX_s_1_2_2(nor_69_nl, mux_tmp_235, fsm_output(6));
  or_280_nl <= (NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(3)));
  or_278_nl <= (fsm_output(4)) OR (NOT (fsm_output(1))) OR (fsm_output(3));
  mux_233_nl <= MUX_s_1_2_2(or_280_nl, or_278_nl, fsm_output(5));
  mux_236_nl <= MUX_s_1_2_2((NOT mux_tmp_235), mux_233_nl, fsm_output(6));
  mux_238_nl <= MUX_s_1_2_2((NOT mux_237_nl), mux_236_nl, fsm_output(2));
  or_277_nl <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR (fsm_output(5)) OR (fsm_output(4))
      OR (NOT mux_tmp_232);
  mux_239_nl <= MUX_s_1_2_2(mux_238_nl, or_277_nl, fsm_output(7));
  COMP_LOOP_twiddle_f_and_rmff <= COMP_LOOP_twiddle_f_mux1h_14_nl AND (NOT(mux_239_nl
      OR (fsm_output(0))));
  COMP_LOOP_twiddle_f_mux1h_29_nl <= MUX1HOT_s_1_5_2((z_out_1(2)), (z_out_1(1)),
      (z_out_2(1)), (z_out_2(2)), (z_out_1(0)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_6_cse
      & and_dcpl_103 & COMP_LOOP_twiddle_f_or_11_cse & COMP_LOOP_twiddle_f_or_15_cse
      & and_dcpl_114));
  COMP_LOOP_twiddle_f_mux1h_29_rmff <= COMP_LOOP_twiddle_f_mux1h_29_nl AND (NOT((NOT
      (fsm_output(6))) AND (NOT (fsm_output(4))) AND (NOT((fsm_output(5)) XOR (fsm_output(3))))
      AND and_dcpl_26));
  COMP_LOOP_1_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out(7
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_12_4_sva_7_0)), 8));
  and_123_nl <= and_dcpl_22 AND and_dcpl_26;
  COMP_LOOP_twiddle_f_mux1h_44_rmff <= MUX1HOT_v_8_7_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_twiddle_f_mul_nl),
      8)), (z_out_1(11 DOWNTO 4)), (z_out_1(10 DOWNTO 3)), (COMP_LOOP_9_twiddle_f_mul_psp_sva(8
      DOWNTO 1)), (z_out_2(10 DOWNTO 3)), (z_out_2(11 DOWNTO 4)), (z_out_1(9 DOWNTO
      2)), STD_LOGIC_VECTOR'( and_123_nl & COMP_LOOP_twiddle_f_or_6_cse & and_dcpl_103
      & and_dcpl_105 & COMP_LOOP_twiddle_f_or_11_cse & COMP_LOOP_twiddle_f_or_15_cse
      & and_dcpl_114));
  COMP_LOOP_twiddle_f_mux1h_57_nl <= MUX1HOT_s_1_4_2((z_out_1(1)), (z_out_1(0)),
      (z_out_2(0)), (z_out_2(1)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_6_cse
      & and_dcpl_103 & COMP_LOOP_twiddle_f_or_11_cse & COMP_LOOP_twiddle_f_or_15_cse));
  or_288_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("1110"));
  or_286_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"));
  mux_240_nl <= MUX_s_1_2_2(or_tmp_203, or_286_nl, fsm_output(3));
  mux_241_nl <= MUX_s_1_2_2(or_288_nl, mux_240_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux1h_57_rmff <= COMP_LOOP_twiddle_f_mux1h_57_nl AND (NOT((NOT
      mux_241_nl) AND and_dcpl_25 AND (NOT (fsm_output(0)))));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl <= MUX_s_1_2_2((z_out_1(0)), (z_out_2(0)),
      COMP_LOOP_twiddle_f_or_15_cse);
  nor_65_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_66_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_244_nl <= MUX_s_1_2_2(nor_65_nl, nor_66_nl, fsm_output(2));
  nand_30_nl <= NOT((fsm_output(6)) AND (fsm_output(4)) AND mux_244_nl);
  or_481_nl <= (fsm_output(2)) OR (NOT mux_tmp_242);
  nand_25_nl <= NOT((fsm_output(2)) AND mux_tmp_242);
  mux_243_nl <= MUX_s_1_2_2(or_481_nl, nand_25_nl, fsm_output(4));
  or_489_nl <= (fsm_output(6)) OR mux_243_nl;
  mux_245_nl <= MUX_s_1_2_2(nand_30_nl, or_489_nl, fsm_output(1));
  or_490_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000010"));
  mux_246_nl <= MUX_s_1_2_2(mux_245_nl, or_490_nl, fsm_output(7));
  COMP_LOOP_twiddle_f_mux1h_66_rmff <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl
      AND (mux_246_nl OR (fsm_output(0)));
  mux_257_cse <= MUX_s_1_2_2(mux_tmp_160, nand_3_cse, fsm_output(4));
  nand_9_nl <= NOT((fsm_output(5)) AND (NOT mux_142_cse));
  mux_258_nl <= MUX_s_1_2_2(nand_9_nl, or_tmp_115, fsm_output(4));
  mux_259_cse <= MUX_s_1_2_2(mux_258_nl, mux_257_cse, fsm_output(3));
  mux_260_cse <= MUX_s_1_2_2(mux_259_cse, mux_163_cse, fsm_output(1));
  mux_252_nl <= MUX_s_1_2_2(nand_3_cse, mux_158_cse, fsm_output(4));
  mux_253_nl <= MUX_s_1_2_2(mux_252_nl, mux_162_cse, fsm_output(3));
  mux_256_nl <= MUX_s_1_2_2(mux_163_cse, mux_253_nl, fsm_output(1));
  mux_261_itm <= MUX_s_1_2_2(mux_260_cse, mux_256_nl, fsm_output(0));
  or_311_nl <= (fsm_output(5)) OR (NOT mux_tmp_148);
  mux_268_nl <= MUX_s_1_2_2(or_311_nl, mux_tmp_265, fsm_output(6));
  or_312_nl <= (fsm_output(7)) OR mux_268_nl;
  mux_269_nl <= MUX_s_1_2_2(mux_tmp_264, or_312_nl, fsm_output(3));
  nand_24_nl <= NOT((fsm_output(5)) AND mux_tmp_148);
  mux_266_nl <= MUX_s_1_2_2(mux_tmp_265, nand_24_nl, fsm_output(6));
  or_310_nl <= (fsm_output(7)) OR mux_266_nl;
  mux_267_nl <= MUX_s_1_2_2(or_310_nl, mux_tmp_264, fsm_output(3));
  mux_270_nl <= MUX_s_1_2_2(mux_269_nl, mux_267_nl, fsm_output(1));
  and_138_rmff <= (NOT mux_270_nl) AND (fsm_output(0));
  or_322_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      mux_tmp_148);
  or_323_nl <= (fsm_output(0)) OR (NOT mux_tmp_148);
  mux_281_nl <= MUX_s_1_2_2(or_323_nl, or_309_cse, fsm_output(5));
  mux_282_nl <= MUX_s_1_2_2(mux_281_nl, mux_tmp_277, fsm_output(6));
  mux_283_nl <= MUX_s_1_2_2(mux_282_nl, or_322_cse, fsm_output(7));
  mux_284_nl <= MUX_s_1_2_2(mux_tmp_276, mux_283_nl, fsm_output(3));
  nand_22_nl <= NOT((NOT((fsm_output(5)) AND (fsm_output(0)))) AND mux_tmp_148);
  mux_278_nl <= MUX_s_1_2_2(mux_tmp_277, nand_22_nl, fsm_output(6));
  mux_279_nl <= MUX_s_1_2_2(mux_278_nl, or_319_cse, fsm_output(7));
  mux_280_nl <= MUX_s_1_2_2(mux_279_nl, mux_tmp_276, fsm_output(3));
  mux_285_itm <= MUX_s_1_2_2(mux_284_nl, mux_280_nl, fsm_output(1));
  or_169_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_166_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_164_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  or_482_cse <= (or_169_cse AND (fsm_output(5))) OR (fsm_output(6));
  or_512_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  nor_62_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000")));
  mux_349_nl <= MUX_s_1_2_2((NOT or_476_cse), (fsm_output(7)), fsm_output(6));
  mux_350_nl <= MUX_s_1_2_2(mux_349_nl, mux_tmp_321, fsm_output(3));
  mux_347_nl <= MUX_s_1_2_2(mux_tmp_321, mux_tmp_328, fsm_output(3));
  mux_344_nl <= MUX_s_1_2_2((fsm_output(7)), or_tmp_7, fsm_output(6));
  mux_345_nl <= MUX_s_1_2_2(mux_tmp_337, mux_344_nl, fsm_output(3));
  or_353_nl <= (fsm_output(6)) OR nor_tmp_42;
  mux_343_nl <= MUX_s_1_2_2(mux_tmp_321, or_353_nl, fsm_output(3));
  mux_346_nl <= MUX_s_1_2_2(mux_345_nl, mux_343_nl, fsm_output(1));
  mux_348_nl <= MUX_s_1_2_2(mux_347_nl, mux_346_nl, VEC_LOOP_j_10_12_0_sva_1(12));
  mux_351_nl <= MUX_s_1_2_2(mux_350_nl, mux_348_nl, fsm_output(4));
  or_487_nl <= (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_339_nl <= MUX_s_1_2_2(nor_tmp_42, (fsm_output(7)), or_487_nl);
  mux_338_nl <= MUX_s_1_2_2(mux_tmp_337, (fsm_output(7)), fsm_output(3));
  mux_340_nl <= MUX_s_1_2_2(mux_339_nl, mux_338_nl, fsm_output(1));
  mux_341_nl <= MUX_s_1_2_2(mux_tmp_321, mux_340_nl, VEC_LOOP_j_10_12_0_sva_1(12));
  mux_336_nl <= MUX_s_1_2_2(mux_tmp_328, mux_tmp_321, and_172_cse);
  mux_342_nl <= MUX_s_1_2_2(mux_341_nl, mux_336_nl, fsm_output(4));
  mux_352_nl <= MUX_s_1_2_2(mux_351_nl, mux_342_nl, fsm_output(2));
  mux_332_nl <= MUX_s_1_2_2(mux_119_cse, mux_tmp_328, fsm_output(3));
  mux_330_nl <= MUX_s_1_2_2(mux_tmp_325, mux_tmp_317, fsm_output(3));
  mux_333_nl <= MUX_s_1_2_2(mux_332_nl, mux_330_nl, fsm_output(1));
  or_350_nl <= (fsm_output(1)) OR (fsm_output(3));
  mux_329_nl <= MUX_s_1_2_2(mux_tmp_321, mux_tmp_328, or_350_nl);
  mux_334_nl <= MUX_s_1_2_2(mux_333_nl, mux_329_nl, fsm_output(4));
  mux_326_nl <= MUX_s_1_2_2(mux_tmp_321, mux_tmp_325, nor_70_cse);
  mux_322_nl <= MUX_s_1_2_2((fsm_output(5)), or_tmp_7, fsm_output(6));
  mux_323_nl <= MUX_s_1_2_2(mux_322_nl, mux_tmp_321, fsm_output(3));
  mux_319_nl <= MUX_s_1_2_2(mux_tmp_318, or_tmp_7, fsm_output(6));
  mux_320_nl <= MUX_s_1_2_2(mux_319_nl, mux_tmp_317, fsm_output(3));
  mux_324_nl <= MUX_s_1_2_2(mux_323_nl, mux_320_nl, fsm_output(1));
  mux_327_nl <= MUX_s_1_2_2(mux_326_nl, mux_324_nl, fsm_output(4));
  mux_335_nl <= MUX_s_1_2_2(mux_334_nl, mux_327_nl, fsm_output(2));
  mux_353_nl <= MUX_s_1_2_2(mux_352_nl, mux_335_nl, fsm_output(0));
  COMP_LOOP_twiddle_help_and_itm <= complete_rsci_wen_comp AND mux_353_nl;
  nor_182_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  or_476_cse <= (fsm_output(7)) OR (fsm_output(5));
  VEC_LOOP_or_50_cse <= and_dcpl_37 OR and_dcpl_74;
  VEC_LOOP_or_51_cse <= and_dcpl_42 OR and_dcpl_76;
  VEC_LOOP_or_52_cse <= and_dcpl_44 OR and_dcpl_58;
  VEC_LOOP_or_53_cse <= and_dcpl_51 OR and_dcpl_70;
  VEC_LOOP_or_54_cse <= and_dcpl_54 OR and_dcpl_63;
  VEC_LOOP_or_55_cse <= and_dcpl_56 OR and_dcpl_65;
  or_435_cse <= (NOT (fsm_output(2))) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  or_136_cse <= (fsm_output(4)) OR (NOT (fsm_output(7)));
  nor_55_cse_1 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  or_463_cse <= (fsm_output(6)) OR (fsm_output(4)) OR (NOT (fsm_output(7)));
  or_473_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100"));
  mux_485_cse <= MUX_s_1_2_2(or_tmp_138, or_222_cse, fsm_output(5));
  mux_484_cse <= MUX_s_1_2_2(or_463_cse, or_tmp_138, fsm_output(5));
  and_164_nl <= (fsm_output(3)) AND mux_tmp_171;
  mux_480_nl <= MUX_s_1_2_2(and_dcpl_50, and_164_nl, fsm_output(2));
  mux_481_nl <= MUX_s_1_2_2(mux_480_nl, (NOT or_tmp_255), fsm_output(7));
  nor_56_nl <= NOT((fsm_output(7)) OR (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND mux_tmp_171)));
  mux_482_nl <= MUX_s_1_2_2(mux_481_nl, nor_56_nl, fsm_output(1));
  VEC_LOOP_VEC_LOOP_mux_2_rgt <= MUX_v_11_2_2(z_out_18, ('0' & z_out_16), mux_482_nl);
  or_526_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"));
  nor_178_cse <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00100")));
  or_319_cse <= (fsm_output(6)) OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(NOT
      STAGE_LOOP_i_3_0_sva) + UNSIGNED'( "1101"), 4));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT STAGE_LOOP_i_3_0_sva_2))
      + SIGNED'( "01101"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  or_tmp_7 <= (fsm_output(7)) OR (NOT (fsm_output(5)));
  or_54_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_485_cse <= (or_164_cse AND (fsm_output(5))) OR (fsm_output(6));
  nor_tmp_25 <= or_485_cse AND (fsm_output(7));
  mux_119_cse <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  or_dcpl_81 <= or_512_cse OR or_169_cse;
  or_tmp_95 <= ((fsm_output(0)) AND (fsm_output(6))) OR (fsm_output(7));
  mux_tmp_128 <= MUX_s_1_2_2(mux_119_cse, or_54_cse, fsm_output(0));
  mux_tmp_129 <= MUX_s_1_2_2(mux_tmp_128, or_tmp_95, fsm_output(2));
  or_tmp_97 <= (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(7));
  mux_tmp_130 <= MUX_s_1_2_2(or_tmp_95, or_tmp_97, fsm_output(2));
  or_tmp_98 <= (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(7));
  mux_tmp_148 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(2));
  nor_85_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)));
  mux_tmp_149 <= MUX_s_1_2_2(nor_85_nl, mux_tmp_148, fsm_output(6));
  or_190_nl <= (fsm_output(5)) OR (NOT mux_tmp_149);
  mux_tmp_150 <= MUX_s_1_2_2(or_190_nl, or_319_cse, fsm_output(7));
  and_dcpl_18 <= (fsm_output(2)) AND (NOT (fsm_output(7)));
  and_dcpl_19 <= and_dcpl_18 AND nor_55_cse_1;
  and_dcpl_21 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_22 <= and_dcpl_21 AND nor_182_cse;
  and_dcpl_23 <= and_dcpl_22 AND and_dcpl_19;
  and_dcpl_24 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_25 <= NOT((fsm_output(2)) OR (fsm_output(7)));
  and_dcpl_26 <= and_dcpl_25 AND and_dcpl_24;
  and_dcpl_27 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_28 <= and_dcpl_21 AND and_dcpl_27;
  mux_tmp_157 <= MUX_s_1_2_2(or_54_cse, or_249_cse, fsm_output(2));
  or_tmp_115 <= (fsm_output(5)) OR mux_tmp_157;
  or_tmp_118 <= (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(6));
  mux_tmp_160 <= MUX_s_1_2_2(or_435_cse, or_tmp_118, fsm_output(5));
  or_438_nl <= (NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_158_cse <= MUX_s_1_2_2(or_tmp_118, or_438_nl, fsm_output(5));
  or_204_cse <= (fsm_output(5)) OR mux_142_cse;
  mux_162_cse <= MUX_s_1_2_2(or_204_cse, mux_tmp_160, fsm_output(4));
  nand_3_cse <= NOT((fsm_output(5)) AND (NOT mux_tmp_157));
  mux_159_nl <= MUX_s_1_2_2(mux_158_cse, or_tmp_115, fsm_output(4));
  mux_163_cse <= MUX_s_1_2_2(mux_162_cse, mux_159_nl, fsm_output(3));
  and_dcpl_30 <= (NOT mux_260_cse) AND (fsm_output(0));
  and_dcpl_31 <= and_dcpl_18 AND and_dcpl_24;
  and_dcpl_32 <= and_dcpl_28 AND and_dcpl_31;
  nor_tmp_31 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_169 <= MUX_s_1_2_2((NOT nor_tmp_31), or_512_cse, fsm_output(4));
  or_tmp_125 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_171 <= MUX_s_1_2_2((NOT or_tmp_125), nor_tmp_31, fsm_output(4));
  nor_82_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("101")));
  mux_tmp_172 <= MUX_s_1_2_2(nor_82_nl, mux_tmp_171, fsm_output(3));
  or_207_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("011"));
  mux_170_nl <= MUX_s_1_2_2(mux_tmp_169, or_207_nl, fsm_output(3));
  mux_173_nl <= MUX_s_1_2_2(mux_tmp_172, (NOT mux_170_nl), fsm_output(2));
  nor_80_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0100")));
  nor_81_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0001")));
  mux_168_nl <= MUX_s_1_2_2(nor_80_nl, nor_81_nl, fsm_output(2));
  mux_174_nl <= MUX_s_1_2_2(mux_173_nl, mux_168_nl, fsm_output(7));
  and_dcpl_33 <= mux_174_nl AND nor_55_cse_1;
  and_dcpl_34 <= and_dcpl_25 AND nor_55_cse_1;
  and_dcpl_35 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_36 <= and_dcpl_21 AND and_dcpl_35;
  and_dcpl_37 <= and_dcpl_36 AND and_dcpl_34;
  or_213_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("100"));
  mux_tmp_175 <= MUX_s_1_2_2(or_213_nl, mux_tmp_169, fsm_output(3));
  or_211_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0010"));
  mux_176_nl <= MUX_s_1_2_2(mux_tmp_175, or_211_nl, fsm_output(7));
  and_dcpl_40 <= (NOT mux_176_nl) AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
  and_dcpl_41 <= (NOT or_tmp_125) AND nor_182_cse;
  and_dcpl_42 <= and_dcpl_41 AND and_dcpl_26;
  and_dcpl_43 <= (NOT or_tmp_125) AND and_dcpl_27;
  and_dcpl_44 <= and_dcpl_43 AND and_dcpl_19;
  nand_32_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  or_88_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  mux_177_nl <= MUX_s_1_2_2(nand_32_nl, or_88_nl, fsm_output(7));
  and_dcpl_48 <= NOT(mux_177_nl OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(2))
      OR (NOT and_dcpl_24));
  and_dcpl_49 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_50 <= (NOT or_tmp_125) AND and_dcpl_49;
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl_31;
  and_dcpl_52 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_54 <= and_dcpl_52 AND nor_182_cse AND and_dcpl_34;
  and_dcpl_55 <= and_dcpl_52 AND and_dcpl_27;
  and_dcpl_56 <= and_dcpl_55 AND and_dcpl_26;
  and_dcpl_57 <= and_dcpl_52 AND and_dcpl_49;
  and_dcpl_58 <= and_dcpl_57 AND and_dcpl_19;
  and_dcpl_59 <= and_dcpl_52 AND and_dcpl_35;
  and_dcpl_60 <= and_dcpl_59 AND and_dcpl_26;
  and_dcpl_61 <= and_dcpl_59 AND and_dcpl_31;
  and_dcpl_63 <= nor_tmp_31 AND and_dcpl_27 AND and_dcpl_34;
  and_dcpl_64 <= nor_tmp_31 AND and_dcpl_49;
  and_dcpl_65 <= and_dcpl_64 AND and_dcpl_26;
  and_dcpl_66 <= nor_tmp_31 AND and_dcpl_35;
  and_dcpl_67 <= and_dcpl_66 AND and_dcpl_19;
  and_dcpl_68 <= (fsm_output(2)) AND (fsm_output(7));
  and_dcpl_69 <= and_dcpl_68 AND and_dcpl_24;
  and_dcpl_70 <= and_dcpl_22 AND and_dcpl_69;
  and_dcpl_71 <= (NOT (fsm_output(2))) AND (fsm_output(7));
  and_dcpl_73 <= and_dcpl_21 AND and_dcpl_49;
  and_dcpl_74 <= and_dcpl_73 AND and_dcpl_71 AND nor_55_cse_1;
  and_dcpl_76 <= and_dcpl_36 AND and_dcpl_71 AND and_dcpl_24;
  and_dcpl_77 <= NOT((fsm_output(7)) OR (fsm_output(0)));
  or_494_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_495_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  mux_178_nl <= MUX_s_1_2_2(or_494_nl, or_495_nl, fsm_output(1));
  and_dcpl_81 <= NOT(mux_178_nl OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_77));
  or_tmp_138 <= (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_189_nl <= MUX_s_1_2_2(or_136_cse, or_223_cse, fsm_output(5));
  or_tmp_149 <= (fsm_output(6)) OR mux_189_nl;
  or_tmp_151 <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(4));
  or_tmp_153 <= (fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  or_tmp_169 <= (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(6));
  not_tmp_100 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")));
  or_tmp_170 <= (fsm_output(7)) OR not_tmp_100;
  or_256_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_212 <= MUX_s_1_2_2(or_256_cse, or_473_cse, fsm_output(2));
  or_254_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  or_260_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("101"));
  mux_216_nl <= MUX_s_1_2_2(or_260_nl, or_tmp_170, fsm_output(2));
  mux_217_nl <= MUX_s_1_2_2(mux_216_nl, or_tmp_169, fsm_output(4));
  or_259_nl <= (fsm_output(2)) OR (fsm_output(7)) OR not_tmp_100;
  mux_215_nl <= MUX_s_1_2_2(mux_tmp_212, or_259_nl, fsm_output(4));
  mux_218_nl <= MUX_s_1_2_2(mux_217_nl, mux_215_nl, fsm_output(3));
  or_257_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(6));
  mux_213_nl <= MUX_s_1_2_2(or_257_nl, mux_tmp_212, fsm_output(4));
  mux_210_nl <= MUX_s_1_2_2(or_254_cse, or_tmp_170, fsm_output(2));
  mux_211_nl <= MUX_s_1_2_2(mux_210_nl, or_tmp_169, fsm_output(4));
  mux_214_nl <= MUX_s_1_2_2(mux_213_nl, mux_211_nl, fsm_output(3));
  mux_219_itm <= MUX_s_1_2_2(mux_218_nl, mux_214_nl, fsm_output(1));
  and_dcpl_89 <= (NOT (fsm_output(7))) AND (fsm_output(0));
  nor_74_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("1010")));
  and_179_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)=STD_LOGIC_VECTOR'("0111"));
  mux_220_nl <= MUX_s_1_2_2(nor_74_nl, and_179_nl, fsm_output(2));
  nor_75_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("10001")));
  not_tmp_102 <= MUX_s_1_2_2(mux_220_nl, nor_75_nl, fsm_output(1));
  and_dcpl_92 <= and_dcpl_25 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nor_tmp_34 <= (fsm_output(4)) AND (VEC_LOOP_j_10_12_0_sva_1(12));
  or_tmp_185 <= (fsm_output(2)) OR (NOT nor_tmp_34);
  nor_73_nl <= NOT((fsm_output(4)) OR (NOT (VEC_LOOP_j_10_12_0_sva_1(12))));
  mux_tmp_222 <= MUX_s_1_2_2(nor_73_nl, nor_tmp_34, fsm_output(2));
  mux_223_nl <= MUX_s_1_2_2(mux_tmp_222, (NOT or_tmp_185), fsm_output(6));
  nand_6_nl <= NOT((fsm_output(5)) AND mux_223_nl);
  or_267_nl <= (fsm_output(5)) OR (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(4))
      OR (NOT (VEC_LOOP_j_10_12_0_sva_1(12)));
  mux_tmp_224 <= MUX_s_1_2_2(nand_6_nl, or_267_nl, fsm_output(7));
  and_dcpl_99 <= NOT(or_tmp_125 OR (fsm_output(4)));
  mux_tmp_232 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(1));
  nor_70_cse <= NOT((fsm_output(1)) OR (NOT (fsm_output(3))));
  nor_71_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(3)));
  mux_234_nl <= MUX_s_1_2_2(nor_70_cse, nor_71_nl, fsm_output(4));
  and_102_nl <= (fsm_output(4)) AND mux_tmp_232;
  mux_tmp_235 <= MUX_s_1_2_2(mux_234_nl, and_102_nl, fsm_output(5));
  and_dcpl_102 <= and_dcpl_28 AND and_dcpl_19;
  and_dcpl_103 <= and_dcpl_73 AND and_dcpl_31;
  and_dcpl_105 <= and_dcpl_43 AND and_dcpl_26;
  and_dcpl_106 <= and_dcpl_50 AND and_dcpl_19;
  and_dcpl_114 <= and_dcpl_64 AND and_dcpl_34;
  and_dcpl_116 <= and_dcpl_68 AND nor_55_cse_1;
  or_tmp_203 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_242 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(3));
  and_dcpl_134 <= and_dcpl_41 AND and_dcpl_68 AND CONV_SL_1_1(fsm_output(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("01"));
  or_307_nl <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  or_305_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(4));
  mux_263_nl <= MUX_s_1_2_2(or_307_nl, or_305_nl, fsm_output(6));
  mux_tmp_264 <= MUX_s_1_2_2(mux_263_nl, or_322_cse, fsm_output(7));
  or_308_cse <= (NOT (fsm_output(2))) OR (fsm_output(4));
  or_309_cse <= (fsm_output(2)) OR (NOT (fsm_output(4)));
  mux_tmp_265 <= MUX_s_1_2_2(or_309_cse, or_308_cse, fsm_output(5));
  or_tmp_231 <= (fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(4));
  mux_tmp_273 <= MUX_s_1_2_2(mux_tmp_148, or_308_cse, fsm_output(0));
  mux_274_nl <= MUX_s_1_2_2(or_309_cse, mux_tmp_273, fsm_output(5));
  mux_272_nl <= MUX_s_1_2_2(or_tmp_231, (NOT mux_tmp_148), fsm_output(5));
  mux_275_nl <= MUX_s_1_2_2(mux_274_nl, mux_272_nl, fsm_output(6));
  or_314_nl <= (fsm_output(6)) OR (fsm_output(5)) OR (fsm_output(0)) OR (NOT mux_tmp_148);
  mux_tmp_276 <= MUX_s_1_2_2(mux_275_nl, or_314_nl, fsm_output(7));
  mux_tmp_277 <= MUX_s_1_2_2(mux_tmp_273, or_tmp_231, fsm_output(5));
  and_dcpl_136 <= and_dcpl_57 AND and_dcpl_31;
  or_tmp_243 <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  or_325_nl <= (fsm_output(7)) OR (NOT mux_tmp_149);
  mux_tmp_288 <= MUX_s_1_2_2(or_tmp_243, or_325_nl, fsm_output(5));
  or_tmp_255 <= CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000"));
  mux_298_nl <= MUX_s_1_2_2((NOT or_tmp_255), or_485_cse, fsm_output(7));
  mux_tmp_299 <= MUX_s_1_2_2(mux_298_nl, nor_tmp_25, fsm_output(1));
  mux_tmp_305 <= MUX_s_1_2_2((fsm_output(6)), (fsm_output(5)), fsm_output(4));
  mux_tmp_306 <= MUX_s_1_2_2(mux_tmp_305, or_512_cse, fsm_output(3));
  mux_tmp_308 <= MUX_s_1_2_2(or_tmp_125, or_512_cse, fsm_output(4));
  mux_tmp_309 <= MUX_s_1_2_2(mux_tmp_308, mux_tmp_305, fsm_output(3));
  and_193_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  or_tmp_261 <= and_193_cse OR (fsm_output(6));
  mux_tmp_317 <= MUX_s_1_2_2((fsm_output(5)), (fsm_output(7)), fsm_output(6));
  mux_tmp_318 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(7));
  nor_tmp_42 <= (fsm_output(7)) AND (fsm_output(5));
  mux_tmp_321 <= MUX_s_1_2_2(nor_tmp_42, (fsm_output(7)), fsm_output(6));
  mux_tmp_325 <= MUX_s_1_2_2(mux_tmp_318, (fsm_output(7)), fsm_output(6));
  mux_tmp_328 <= MUX_s_1_2_2(nor_tmp_42, or_tmp_7, fsm_output(6));
  mux_tmp_337 <= MUX_s_1_2_2(nor_tmp_42, or_476_cse, fsm_output(6));
  and_172_cse <= (fsm_output(1)) AND (fsm_output(3));
  mux_tmp_354 <= MUX_s_1_2_2(or_256_cse, or_254_cse, fsm_output(1));
  or_366_nl <= (fsm_output(6)) OR (NOT (VEC_LOOP_j_10_12_0_sva_1(12))) OR (NOT (fsm_output(7)))
      OR (fsm_output(5));
  nand_29_nl <= NOT((fsm_output(6)) AND (VEC_LOOP_j_10_12_0_sva_1(12)) AND (NOT (fsm_output(7)))
      AND (fsm_output(5)));
  mux_tmp_359 <= MUX_s_1_2_2(or_366_nl, nand_29_nl, fsm_output(1));
  and_dcpl_145 <= and_dcpl_43 AND and_dcpl_92;
  or_tmp_282 <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(4));
  or_tmp_283 <= (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(4));
  or_tmp_294 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_386 <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(5));
  mux_tmp_387 <= MUX_s_1_2_2((fsm_output(5)), mux_tmp_386, fsm_output(4));
  mux_tmp_391 <= MUX_s_1_2_2(or_tmp_294, mux_tmp_387, fsm_output(3));
  and_dcpl_152 <= and_dcpl_21 AND (NOT((fsm_output(1)) XOR (fsm_output(3)))) AND
      (NOT (fsm_output(4))) AND (fsm_output(2)) AND and_dcpl_89;
  or_403_nl <= (fsm_output(5)) OR (NOT((fsm_output(6)) AND mux_tmp_148));
  mux_tmp_413 <= MUX_s_1_2_2(or_403_nl, or_319_cse, fsm_output(7));
  mux_419_nl <= MUX_s_1_2_2(mux_tmp_413, or_195_cse, fsm_output(3));
  mux_416_nl <= MUX_s_1_2_2(mux_152_cse, mux_tmp_413, fsm_output(3));
  mux_420_nl <= MUX_s_1_2_2(mux_419_nl, mux_416_nl, fsm_output(1));
  and_dcpl_153 <= (NOT mux_420_nl) AND (fsm_output(0));
  and_169_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  or_tmp_315 <= and_169_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_422 <= MUX_s_1_2_2((NOT or_tmp_315), or_tmp_203, fsm_output(7));
  or_469_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("011"));
  mux_427_nl <= MUX_s_1_2_2(or_469_nl, or_256_cse, fsm_output(2));
  mux_tmp_429 <= MUX_s_1_2_2(mux_tmp_212, mux_427_nl, fsm_output(4));
  or_tmp_322 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_430 <= MUX_s_1_2_2(or_tmp_322, or_254_cse, fsm_output(2));
  or_tmp_352 <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT
      (fsm_output(5)));
  mux_3_nl <= MUX_s_1_2_2(or_476_cse, or_tmp_7, fsm_output(3));
  or_7_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(5));
  mux_465_nl <= MUX_s_1_2_2(mux_3_nl, or_7_nl, fsm_output(1));
  mux_tmp_466 <= MUX_s_1_2_2(or_tmp_352, mux_465_nl, fsm_output(6));
  or_24_nl <= (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_tmp_467 <= MUX_s_1_2_2(or_24_nl, or_476_cse, fsm_output(3));
  not_tmp_195 <= NOT(and_dcpl_35 OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  mux_tmp_475 <= MUX_s_1_2_2(not_tmp_195, or_tmp_255, fsm_output(7));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_41 AND and_dcpl_116;
  mux_433_nl <= MUX_s_1_2_2(or_473_cse, or_tmp_322, fsm_output(2));
  mux_434_nl <= MUX_s_1_2_2(mux_tmp_430, mux_433_nl, fsm_output(4));
  mux_435_nl <= MUX_s_1_2_2(mux_tmp_429, mux_434_nl, fsm_output(3));
  nand_nl <= NOT((fsm_output(2)) AND (fsm_output(6)) AND (NOT (fsm_output(7))) AND
      (fsm_output(5)));
  mux_431_nl <= MUX_s_1_2_2(nand_nl, mux_tmp_430, fsm_output(4));
  mux_432_nl <= MUX_s_1_2_2(mux_431_nl, mux_tmp_429, fsm_output(3));
  mux_436_nl <= MUX_s_1_2_2(mux_435_nl, mux_432_nl, fsm_output(1));
  VEC_LOOP_acc_1_cse_10_sva_mx0c0 <= (NOT mux_436_nl) AND (fsm_output(0));
  or_429_nl <= (fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_443_nl <= MUX_s_1_2_2(or_429_nl, or_204_cse, fsm_output(4));
  mux_444_nl <= MUX_s_1_2_2(mux_257_cse, mux_443_nl, fsm_output(3));
  mux_445_nl <= MUX_s_1_2_2(mux_444_nl, mux_259_cse, fsm_output(1));
  VEC_LOOP_acc_1_cse_10_sva_mx0c2 <= NOT(mux_445_nl OR (fsm_output(0)));
  VEC_LOOP_or_9_cse <= and_dcpl_37 OR and_dcpl_54 OR and_dcpl_63 OR and_dcpl_74;
  VEC_LOOP_or_10_cse <= and_dcpl_42 OR and_dcpl_51 OR and_dcpl_56 OR and_dcpl_61
      OR and_dcpl_65 OR and_dcpl_70 OR and_dcpl_76;
  VEC_LOOP_or_11_cse <= and_dcpl_44 OR and_dcpl_67;
  VEC_LOOP_or_83_cse <= VEC_LOOP_or_50_cse OR and_dcpl_61 OR VEC_LOOP_or_51_cse OR
      VEC_LOOP_or_55_cse OR VEC_LOOP_or_54_cse OR VEC_LOOP_or_53_cse;
  VEC_LOOP_mux1h_8_nl <= MUX1HOT_v_9_6_2((z_out_5(11 DOWNTO 3)), (acc_4_cse_12_1(11
      DOWNTO 3)), (z_out_18(10 DOWNTO 2)), (z_out_10(11 DOWNTO 3)), (z_out_16(9 DOWNTO
      1)), (z_out_16(8 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_23 & and_dcpl_32 &
      VEC_LOOP_or_9_cse & VEC_LOOP_or_10_cse & VEC_LOOP_or_11_cse & and_dcpl_58));
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_s_1_6_2((z_out_5(2)), (acc_4_cse_12_1(2)), (z_out_18(1)),
      (z_out_10(2)), (z_out_16(0)), (VEC_LOOP_acc_1_cse_10_sva(2)), STD_LOGIC_VECTOR'(
      and_dcpl_23 & and_dcpl_32 & VEC_LOOP_or_9_cse & VEC_LOOP_or_10_cse & VEC_LOOP_or_11_cse
      & and_dcpl_58));
  and_84_nl <= mux_tmp_172 AND and_dcpl_19;
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_5_2((z_out_5(1)), (acc_4_cse_12_1(1)), (z_out_18(0)),
      (z_out_10(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), STD_LOGIC_VECTOR'( and_dcpl_23
      & and_dcpl_32 & VEC_LOOP_or_9_cse & VEC_LOOP_or_10_cse & and_84_nl));
  mux_179_nl <= MUX_s_1_2_2((NOT mux_tmp_175), mux_tmp_172, fsm_output(2));
  mux_180_nl <= MUX_s_1_2_2(mux_179_nl, nor_178_cse, fsm_output(7));
  and_82_nl <= mux_180_nl AND nor_55_cse_1;
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_4_2((z_out_5(0)), (acc_4_cse_12_1(0)), (VEC_LOOP_acc_1_cse_10_sva(0)),
      (z_out_10(0)), STD_LOGIC_VECTOR'( and_dcpl_23 & and_dcpl_32 & and_82_nl & VEC_LOOP_or_10_cse));
  and_29_nl <= and_dcpl_28 AND and_dcpl_26;
  VEC_LOOP_mux1h_nl <= MUX1HOT_v_8_11_2((z_out_16(7 DOWNTO 0)), VEC_LOOP_acc_psp_sva,
      (VEC_LOOP_acc_10_cse_1_sva(11 DOWNTO 4)), (z_out_10(11 DOWNTO 4)), (VEC_LOOP_acc_1_cse_10_sva(11
      DOWNTO 4)), (acc_4_cse_12_1(11 DOWNTO 4)), (VEC_LOOP_acc_11_psp_sva_10 & (VEC_LOOP_acc_11_psp_sva_9_0(9
      DOWNTO 3))), (z_out_11(11 DOWNTO 4)), (VEC_LOOP_acc_11_psp_sva_9_0(9 DOWNTO
      2)), (COMP_LOOP_9_twiddle_f_mul_psp_sva(8 DOWNTO 1)), (z_out_5(11 DOWNTO 4)),
      STD_LOGIC_VECTOR'( and_dcpl_23 & and_29_nl & and_dcpl_30 & and_dcpl_32 & and_dcpl_33
      & VEC_LOOP_or_83_cse & and_dcpl_40 & VEC_LOOP_or_52_cse & and_dcpl_48 & and_dcpl_60
      & and_dcpl_67));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_10_2((COMP_LOOP_twiddle_f_9_sva(3)), (VEC_LOOP_acc_10_cse_1_sva(3)),
      (z_out_10(3)), (VEC_LOOP_acc_1_cse_10_sva(3)), (acc_4_cse_12_1(3)), (VEC_LOOP_acc_11_psp_sva_9_0(2)),
      (z_out_11(3)), (VEC_LOOP_acc_11_psp_sva_9_0(1)), (COMP_LOOP_9_twiddle_f_mul_psp_sva(0)),
      (z_out_5(3)), STD_LOGIC_VECTOR'( and_dcpl_81 & and_dcpl_30 & and_dcpl_32 &
      and_dcpl_33 & VEC_LOOP_or_83_cse & and_dcpl_40 & VEC_LOOP_or_52_cse & and_dcpl_48
      & and_dcpl_60 & and_dcpl_67));
  or_227_nl <= (fsm_output(3)) OR (NOT (fsm_output(6))) OR (fsm_output(7)) OR (NOT
      (fsm_output(4)));
  mux_185_nl <= MUX_s_1_2_2(or_tmp_138, or_463_cse, fsm_output(3));
  mux_186_nl <= MUX_s_1_2_2(or_227_nl, mux_185_nl, fsm_output(2));
  mux_182_nl <= MUX_s_1_2_2(or_224_cse, or_223_cse, fsm_output(6));
  mux_183_nl <= MUX_s_1_2_2(or_463_cse, mux_182_nl, fsm_output(3));
  mux_181_nl <= MUX_s_1_2_2(or_222_cse, or_tmp_138, fsm_output(3));
  mux_184_nl <= MUX_s_1_2_2(mux_183_nl, mux_181_nl, fsm_output(2));
  mux_187_nl <= MUX_s_1_2_2(mux_186_nl, mux_184_nl, fsm_output(5));
  or_219_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("010110"));
  mux_188_nl <= MUX_s_1_2_2(mux_187_nl, or_219_nl, fsm_output(1));
  nor_117_nl <= NOT(mux_188_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_9_2((COMP_LOOP_twiddle_f_9_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (z_out_10(2)), (VEC_LOOP_acc_1_cse_10_sva(2)), (acc_4_cse_12_1(2)), (VEC_LOOP_acc_11_psp_sva_9_0(1)),
      (z_out_11(2)), (VEC_LOOP_acc_11_psp_sva_9_0(0)), (z_out_5(2)), STD_LOGIC_VECTOR'(
      and_dcpl_81 & and_dcpl_30 & and_dcpl_32 & nor_117_nl & VEC_LOOP_or_83_cse &
      and_dcpl_40 & VEC_LOOP_or_52_cse & and_dcpl_48 & and_dcpl_67));
  or_239_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(7))) OR (fsm_output(4));
  mux_194_nl <= MUX_s_1_2_2(or_239_nl, or_tmp_153, fsm_output(6));
  or_238_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_193_nl <= MUX_s_1_2_2(or_tmp_151, or_238_nl, fsm_output(6));
  mux_195_nl <= MUX_s_1_2_2(mux_194_nl, mux_193_nl, fsm_output(3));
  mux_191_nl <= MUX_s_1_2_2(or_tmp_153, or_tmp_151, fsm_output(6));
  mux_192_nl <= MUX_s_1_2_2(mux_191_nl, or_tmp_149, fsm_output(3));
  mux_196_nl <= MUX_s_1_2_2(mux_195_nl, mux_192_nl, fsm_output(2));
  mux_190_nl <= MUX_s_1_2_2(or_tmp_149, or_229_cse, fsm_output(3));
  or_233_nl <= (fsm_output(2)) OR mux_190_nl;
  mux_197_nl <= MUX_s_1_2_2(mux_196_nl, or_233_nl, fsm_output(1));
  nor_116_nl <= NOT(mux_197_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_s_1_8_2((COMP_LOOP_twiddle_f_9_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (z_out_10(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), (acc_4_cse_12_1(1)), (VEC_LOOP_acc_11_psp_sva_9_0(0)),
      (z_out_11(1)), (z_out_5(1)), STD_LOGIC_VECTOR'( and_dcpl_81 & and_dcpl_30 &
      and_dcpl_32 & nor_116_nl & VEC_LOOP_or_83_cse & and_dcpl_40 & VEC_LOOP_or_52_cse
      & and_dcpl_67));
  or_251_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_206_nl <= MUX_s_1_2_2(or_251_nl, or_463_cse, fsm_output(5));
  mux_205_nl <= MUX_s_1_2_2(or_249_cse, or_54_cse, fsm_output(4));
  nand_5_nl <= NOT((fsm_output(5)) AND (NOT mux_205_nl));
  mux_207_nl <= MUX_s_1_2_2(mux_206_nl, nand_5_nl, fsm_output(3));
  mux_204_nl <= MUX_s_1_2_2(mux_485_cse, mux_484_cse, fsm_output(3));
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, mux_204_nl, fsm_output(2));
  mux_202_nl <= MUX_s_1_2_2(mux_484_cse, or_229_cse, fsm_output(3));
  mux_199_nl <= MUX_s_1_2_2(or_54_cse, or_243_cse, fsm_output(4));
  or_245_nl <= (fsm_output(5)) OR mux_199_nl;
  mux_200_nl <= MUX_s_1_2_2(or_245_nl, mux_485_cse, fsm_output(3));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, mux_200_nl, fsm_output(2));
  mux_209_nl <= MUX_s_1_2_2(mux_208_nl, mux_203_nl, fsm_output(1));
  nor_115_nl <= NOT(mux_209_nl OR (fsm_output(0)));
  VEC_LOOP_mux1h_7_nl <= MUX1HOT_s_1_7_2((COMP_LOOP_twiddle_f_9_sva(0)), (VEC_LOOP_acc_10_cse_1_sva(0)),
      (z_out_10(0)), (VEC_LOOP_acc_1_cse_10_sva(0)), (acc_4_cse_12_1(0)), (z_out_11(0)),
      (z_out_5(0)), STD_LOGIC_VECTOR'( and_dcpl_81 & and_dcpl_30 & and_dcpl_32 &
      nor_115_nl & VEC_LOOP_or_83_cse & VEC_LOOP_or_52_cse & and_dcpl_67));
  vec_rsci_adra_d <= VEC_LOOP_mux1h_8_nl & VEC_LOOP_mux1h_6_nl & VEC_LOOP_mux1h_4_nl
      & VEC_LOOP_mux1h_2_nl & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_1_nl & VEC_LOOP_mux1h_3_nl
      & VEC_LOOP_mux1h_5_nl & VEC_LOOP_mux1h_7_nl;
  vec_rsci_wea_d <= vec_rsci_wea_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  twiddle_rsci_adra_d <= twiddle_rsci_adra_d_reg;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_adra_d <= twiddle_h_rsci_adra_d_reg;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
  and_dcpl_169 <= NOT((fsm_output(2)) OR (fsm_output(0)));
  and_dcpl_171 <= (fsm_output(3)) AND (fsm_output(1)) AND and_dcpl_169;
  and_dcpl_172 <= NOT((fsm_output(7)) OR (fsm_output(4)));
  and_dcpl_173 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_174 <= and_dcpl_173 AND and_dcpl_172;
  and_dcpl_175 <= and_dcpl_174 AND and_dcpl_171;
  and_dcpl_176 <= (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_177 <= (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_181 <= and_dcpl_21 AND and_dcpl_172 AND and_dcpl_177 AND and_dcpl_176;
  and_dcpl_184 <= (NOT (fsm_output(7))) AND (fsm_output(4));
  and_dcpl_186 <= and_dcpl_21 AND and_dcpl_184 AND (NOT (fsm_output(3))) AND (fsm_output(1))
      AND and_dcpl_176;
  and_dcpl_187 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_188 <= and_dcpl_187 AND and_dcpl_169;
  and_dcpl_189 <= and_dcpl_174 AND and_dcpl_188;
  and_dcpl_192 <= and_dcpl_173 AND and_dcpl_184 AND and_dcpl_187 AND and_dcpl_176;
  and_dcpl_196 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_172 AND and_dcpl_177 AND and_dcpl_169;
  and_dcpl_198 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_184;
  and_dcpl_199 <= and_dcpl_198 AND and_dcpl_188;
  and_dcpl_200 <= and_dcpl_198 AND and_dcpl_171;
  and_dcpl_202 <= (NOT (fsm_output(3))) AND (fsm_output(1));
  and_dcpl_203 <= and_dcpl_202 AND (NOT (fsm_output(2))) AND (NOT (fsm_output(0)));
  and_dcpl_204 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_205 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_207 <= and_dcpl_205 AND and_dcpl_204 AND and_dcpl_203;
  and_dcpl_210 <= (fsm_output(3)) AND (fsm_output(1)) AND and_dcpl_176;
  and_dcpl_213 <= and_dcpl_205 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_210;
  and_dcpl_215 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_216 <= and_dcpl_215 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_217 <= and_dcpl_216 AND and_dcpl_203;
  and_dcpl_220 <= and_dcpl_216 AND (fsm_output(3)) AND (NOT (fsm_output(1))) AND
      and_dcpl_176;
  and_dcpl_224 <= and_dcpl_215 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_202 AND and_dcpl_176;
  and_dcpl_228 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_204;
  and_dcpl_229 <= and_dcpl_228 AND (NOT (fsm_output(3))) AND (NOT (fsm_output(1)))
      AND and_dcpl_176;
  and_dcpl_230 <= and_dcpl_228 AND and_dcpl_210;
  or_tmp_379 <= (fsm_output(1)) OR (fsm_output(7)) OR (NOT (fsm_output(3)));
  or_498_nl <= (fsm_output(7)) OR (fsm_output(3));
  or_497_nl <= (fsm_output(7)) OR (NOT (fsm_output(3)));
  mux_515_nl <= MUX_s_1_2_2(or_498_nl, or_497_nl, fsm_output(1));
  mux_496_nl <= MUX_s_1_2_2(mux_515_nl, or_tmp_379, fsm_output(5));
  mux_tmp_497 <= MUX_s_1_2_2(or_tmp_352, mux_496_nl, fsm_output(6));
  not_tmp_233 <= MUX_s_1_2_2((fsm_output(3)), (NOT (fsm_output(3))), fsm_output(7));
  and_dcpl_232 <= (fsm_output(2)) AND (fsm_output(0));
  and_dcpl_234 <= and_172_cse AND and_dcpl_232;
  and_dcpl_237 <= and_dcpl_21 AND (fsm_output(7)) AND (NOT (fsm_output(4)));
  and_dcpl_238 <= and_dcpl_237 AND and_dcpl_234;
  and_dcpl_241 <= and_dcpl_237 AND (NOT (fsm_output(3))) AND (NOT (fsm_output(1)))
      AND and_dcpl_232;
  and_dcpl_242 <= (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_243 <= and_172_cse AND and_dcpl_242;
  and_dcpl_247 <= nor_tmp_31 AND and_dcpl_184 AND and_dcpl_243;
  and_dcpl_249 <= (fsm_output(3)) AND (NOT (fsm_output(1))) AND and_dcpl_232;
  and_dcpl_251 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_184;
  and_dcpl_252 <= and_dcpl_251 AND and_dcpl_249;
  and_dcpl_254 <= and_dcpl_202 AND and_dcpl_232;
  and_dcpl_257 <= nor_tmp_31 AND and_dcpl_172 AND and_dcpl_254;
  and_dcpl_259 <= and_dcpl_251 AND and_dcpl_202 AND and_dcpl_242;
  and_dcpl_262 <= and_dcpl_173 AND and_dcpl_184 AND and_dcpl_234;
  and_dcpl_264 <= and_dcpl_21 AND and_dcpl_184 AND and_dcpl_254;
  and_dcpl_266 <= and_dcpl_173 AND and_dcpl_172 AND and_dcpl_243;
  and_dcpl_268 <= and_dcpl_21 AND and_dcpl_172 AND and_dcpl_249;
  and_dcpl_282 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("10100011"));
  and_dcpl_295 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("01111100"));
  and_dcpl_298 <= and_172_cse AND and_dcpl_176;
  and_dcpl_305 <= and_dcpl_177 AND and_dcpl_169;
  and_dcpl_306 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_310 <= and_dcpl_202 AND and_dcpl_169;
  and_dcpl_311 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_312 <= and_dcpl_205 AND and_dcpl_311;
  and_dcpl_314 <= and_dcpl_177 AND and_dcpl_176;
  and_dcpl_316 <= and_dcpl_202 AND and_dcpl_176;
  and_dcpl_321 <= (NOT (fsm_output(3))) AND (NOT (fsm_output(1))) AND and_dcpl_169;
  and_dcpl_323 <= and_dcpl_215 AND and_dcpl_204;
  and_dcpl_325 <= and_172_cse AND and_dcpl_169;
  and_dcpl_331 <= and_dcpl_215 AND and_193_cse;
  and_dcpl_334 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_337 <= and_dcpl_334 AND and_dcpl_306;
  or_tmp_386 <= (NOT (fsm_output(4))) OR (fsm_output(2)) OR (fsm_output(7));
  or_nl <= (fsm_output(2)) OR (NOT (fsm_output(7)));
  nand_36_nl <= NOT((fsm_output(2)) AND (fsm_output(7)));
  mux_505_nl <= MUX_s_1_2_2(or_nl, nand_36_nl, fsm_output(4));
  mux_506_nl <= MUX_s_1_2_2(mux_505_nl, or_tmp_386, fsm_output(5));
  or_502_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(7));
  mux_tmp_507 <= MUX_s_1_2_2(mux_506_nl, or_502_nl, fsm_output(6));
  or_505_nl <= (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(7));
  mux_tmp_508 <= MUX_s_1_2_2(or_tmp_386, or_505_nl, fsm_output(5));
  or_507_nl <= (fsm_output(2)) OR (fsm_output(7));
  or_506_nl <= (NOT (fsm_output(2))) OR (fsm_output(7));
  mux_tmp_509 <= MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output(4));
  nand_34_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_509));
  mux_512_nl <= MUX_s_1_2_2(mux_tmp_508, nand_34_nl, fsm_output(6));
  mux_513_nl <= MUX_s_1_2_2(mux_tmp_507, mux_512_nl, fsm_output(1));
  or_508_nl <= (fsm_output(5)) OR mux_tmp_509;
  mux_510_nl <= MUX_s_1_2_2(or_508_nl, mux_tmp_508, fsm_output(6));
  mux_511_nl <= MUX_s_1_2_2(mux_510_nl, mux_tmp_507, fsm_output(1));
  mux_514_nl <= MUX_s_1_2_2(mux_513_nl, mux_511_nl, fsm_output(3));
  and_dcpl_462 <= (NOT mux_514_nl) AND (fsm_output(0));
  and_dcpl_465 <= (NOT (fsm_output(3))) AND (NOT (fsm_output(1))) AND and_dcpl_176;
  and_dcpl_469 <= and_dcpl_205 AND and_dcpl_204 AND and_dcpl_465;
  and_dcpl_473 <= and_dcpl_215 AND and_dcpl_306 AND and_dcpl_465;
  and_dcpl_478 <= and_dcpl_205 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_314;
  and_dcpl_481 <= and_dcpl_215 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_314;
  and_dcpl_483 <= and_dcpl_177 AND (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_486 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_306 AND and_dcpl_483;
  and_dcpl_488 <= and_dcpl_215 AND and_dcpl_204 AND and_dcpl_483;
  and_dcpl_505 <= (fsm_output(3)) AND (NOT (fsm_output(1))) AND and_dcpl_169;
  and_dcpl_509 <= and_dcpl_205 AND and_dcpl_306 AND and_dcpl_505;
  and_dcpl_515 <= and_dcpl_215 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_188;
  and_dcpl_518 <= and_dcpl_215 AND and_dcpl_311 AND and_dcpl_505;
  and_dcpl_521 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_306 AND and_dcpl_188;
  and_dcpl_523 <= and_dcpl_187 AND (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_526 <= and_dcpl_215 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_523;
  and_dcpl_528 <= and_dcpl_205 AND and_dcpl_311 AND and_dcpl_523;
  or_513_nl <= (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4));
  mux_tmp <= MUX_s_1_2_2((fsm_output(6)), or_513_nl, fsm_output(5));
  not_tmp <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000000")));
  nor_tmp_55 <= (fsm_output(5)) AND (fsm_output(3)) AND (fsm_output(2));
  or_tmp_403 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"));
  COMP_LOOP_twiddle_f_or_18_itm <= and_dcpl_175 OR and_dcpl_199;
  COMP_LOOP_twiddle_f_nor_5_itm <= NOT(and_dcpl_207 OR and_dcpl_213 OR and_dcpl_220
      OR and_dcpl_229);
  COMP_LOOP_twiddle_f_or_20_itm <= and_dcpl_213 OR and_dcpl_220 OR and_dcpl_229;
  COMP_LOOP_twiddle_f_or_1_itm <= and_dcpl_217 OR and_dcpl_224 OR and_dcpl_230;
  VEC_LOOP_or_62_itm <= and_dcpl_238 OR and_dcpl_241 OR and_dcpl_247 OR and_dcpl_252
      OR and_dcpl_257 OR and_dcpl_259 OR and_dcpl_262 OR and_dcpl_264 OR and_dcpl_266
      OR and_dcpl_268;
  and_354_itm <= and_dcpl_205 AND and_dcpl_204 AND and_dcpl_298;
  and_371_itm <= and_dcpl_205 AND and_193_cse AND and_dcpl_316;
  and_380_itm <= and_dcpl_215 AND and_dcpl_306 AND and_dcpl_298;
  and_388_itm <= and_dcpl_334 AND and_dcpl_204 AND and_dcpl_316;
  VEC_LOOP_or_59_itm <= and_dcpl_478 OR and_dcpl_481;
  VEC_LOOP_or_68_itm <= and_dcpl_473 OR and_dcpl_488;
  VEC_LOOP_or_71_itm <= and_dcpl_526 OR and_dcpl_528;
  VEC_LOOP_nor_10_itm <= NOT(and_dcpl_526 OR and_dcpl_528);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        VEC_LOOP_mult_vec_1_sva <= MUX1HOT_v_32_3_2((vec_rsci_qa_d_mxwt(63 DOWNTO
            32)), (vec_rsci_qa_d_mxwt(31 DOWNTO 0)), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
            STD_LOGIC_VECTOR'( and_dcpl_152 & and_dcpl_153 & and_160_nl));
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
        reg_run_rsci_oswt_cse <= NOT(or_dcpl_81 OR (fsm_output(2)) OR (fsm_output(7))
            OR or_166_cse);
        reg_vec_rsci_oswt_cse <= NOT mux_147_itm;
        reg_vec_rsci_oswt_1_cse <= nor_118_cse;
        reg_twiddle_rsci_oswt_cse <= nor_114_rmff;
        reg_twiddle_rsci_oswt_1_cse <= and_101_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_99 AND (NOT (fsm_output(3))) AND (fsm_output(2))
            AND (fsm_output(7)) AND (NOT (fsm_output(1))) AND (NOT (fsm_output(0)))
            AND STAGE_LOOP_acc_itm_4_1;
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_134;
        reg_ensig_cgo_cse <= NOT mux_261_itm;
        reg_ensig_cgo_2_cse <= NOT mux_285_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_22 AND and_dcpl_34) OR STAGE_LOOP_i_3_0_sva_mx0c1))
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_297_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_299) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_519_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_12_4_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_17(7
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_304_nl OR CONV_SL_1_1(fsm_output(7 DOWNTO
          6)/=STD_LOGIC_VECTOR'("00")))) = '1' ) THEN
        COMP_LOOP_1_twiddle_f_acc_cse_sva <= COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_316_nl OR (fsm_output(7)))) = '1' ) THEN
        COMP_LOOP_9_twiddle_f_mul_psp_sva <= MUX_v_9_2_2((z_out_2(8 DOWNTO 0)), (z_out_16(8
            DOWNTO 0)), and_dcpl_58);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_twiddle_help_and_itm = '1' ) THEN
        COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt(31
            DOWNTO 0)), (twiddle_h_rsci_qa_d_mxwt(63 DOWNTO 32)), and_dcpl_145);
        COMP_LOOP_twiddle_f_1_sva <= MUX1HOT_v_32_3_2((twiddle_rsci_qa_d_mxwt(31
            DOWNTO 0)), (twiddle_rsci_qa_d_mxwt(63 DOWNTO 32)), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
            STD_LOGIC_VECTOR'( (NOT mux_364_nl) & and_dcpl_145 & and_dcpl_60));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((mux_525_nl OR (fsm_output(7))) AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_twiddle_f_9_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            VEC_LOOP_mux1h_10_nl, COMP_LOOP_twiddle_f_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (and_dcpl_23 OR and_dcpl_134)) = '1' )
          THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= MUX_s_1_2_2((z_out_4_20_12(8)),
            run_rsci_ivld_mxwt, and_dcpl_134);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_23 OR and_dcpl_32 OR and_dcpl_37
          OR and_dcpl_42 OR and_dcpl_44 OR and_dcpl_51 OR and_dcpl_54 OR and_dcpl_56
          OR and_dcpl_58 OR and_dcpl_61 OR and_dcpl_63 OR and_dcpl_65 OR and_dcpl_67
          OR and_dcpl_70 OR and_dcpl_74 OR and_dcpl_76)) = '1' ) THEN
        VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_12_3_2(z_out_5, acc_4_cse_12_1, z_out_11,
            STD_LOGIC_VECTOR'( VEC_LOOP_or_48_nl & VEC_LOOP_or_49_nl & VEC_LOOP_or_52_cse));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(or_dcpl_81 OR (NOT (fsm_output(2))) OR
          (fsm_output(7)) OR or_166_cse))) = '1' ) THEN
        VEC_LOOP_acc_psp_sva <= z_out_16(7 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_411_nl OR (fsm_output(7)))) = '1' ) THEN
        COMP_LOOP_twiddle_help_9_sva <= MUX_v_32_2_2(z_out_15, (twiddle_h_rsci_qa_d_mxwt(31
            DOWNTO 0)), and_dcpl_106);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_152 OR and_dcpl_153)) = '1' ) THEN
        factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(31 DOWNTO 0)), (vec_rsci_qa_d_mxwt(63
            DOWNTO 32)), and_dcpl_153);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_426_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (VEC_LOOP_acc_1_cse_10_sva_mx0c0 OR and_dcpl_32
          OR VEC_LOOP_acc_1_cse_10_sva_mx0c2 OR and_dcpl_42 OR and_dcpl_51 OR and_dcpl_56
          OR and_dcpl_61 OR and_dcpl_65 OR and_dcpl_70 OR and_dcpl_76)) = '1' ) THEN
        VEC_LOOP_acc_1_cse_10_sva <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"),
            VEC_LOOP_VEC_LOOP_mux_3_nl, VEC_LOOP_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_12_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000");
      ELSIF ( (complete_rsci_wen_comp AND (NOT(mux_473_nl OR (fsm_output(0))))) =
          '1' ) THEN
        VEC_LOOP_j_10_12_0_sva_1 <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_479_nl) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_532_nl AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_10 <= VEC_LOOP_VEC_LOOP_mux_2_rgt(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_537_nl AND nor_55_cse_1 AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_9_0 <= VEC_LOOP_VEC_LOOP_mux_2_rgt(9 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(mux_492_nl AND (NOT (fsm_output(7))))))
          = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  and_160_nl <= not_tmp_102 AND and_dcpl_77;
  mux_296_nl <= MUX_s_1_2_2((NOT or_tmp_255), or_482_cse, fsm_output(7));
  mux_297_nl <= MUX_s_1_2_2(mux_296_nl, nor_tmp_25, or_166_cse);
  COMP_LOOP_k_not_nl <= NOT mux_tmp_299;
  mux_518_nl <= MUX_s_1_2_2(not_tmp, mux_tmp, fsm_output(7));
  mux_516_nl <= MUX_s_1_2_2(mux_tmp, or_512_cse, fsm_output(1));
  mux_517_nl <= MUX_s_1_2_2(not_tmp, mux_516_nl, fsm_output(7));
  mux_519_nl <= MUX_s_1_2_2(mux_518_nl, mux_517_nl, fsm_output(0));
  mux_302_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_164_cse);
  or_492_nl <= nor_62_cse OR (fsm_output(5));
  mux_303_nl <= MUX_s_1_2_2(mux_302_nl, or_492_nl, fsm_output(1));
  or_493_nl <= (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"))))
      OR (fsm_output(5));
  mux_304_nl <= MUX_s_1_2_2(mux_303_nl, or_493_nl, fsm_output(0));
  mux_314_nl <= MUX_s_1_2_2(mux_tmp_309, or_482_cse, fsm_output(2));
  mux_312_nl <= MUX_s_1_2_2(mux_tmp_308, or_tmp_261, fsm_output(3));
  mux_313_nl <= MUX_s_1_2_2(mux_312_nl, mux_tmp_306, fsm_output(2));
  mux_315_nl <= MUX_s_1_2_2(mux_314_nl, mux_313_nl, fsm_output(1));
  mux_310_nl <= MUX_s_1_2_2(mux_tmp_309, mux_tmp_306, fsm_output(2));
  mux_307_nl <= MUX_s_1_2_2(or_482_cse, mux_tmp_306, fsm_output(2));
  mux_311_nl <= MUX_s_1_2_2(mux_310_nl, mux_307_nl, fsm_output(1));
  mux_316_nl <= MUX_s_1_2_2(mux_315_nl, mux_311_nl, fsm_output(0));
  or_368_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (NOT (VEC_LOOP_j_10_12_0_sva_1(12)))
      OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_362_nl <= MUX_s_1_2_2(or_368_nl, mux_tmp_359, fsm_output(3));
  nand_10_nl <= NOT((fsm_output(4)) AND (NOT mux_362_nl));
  or_363_nl <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR (NOT (VEC_LOOP_j_10_12_0_sva_1(12)))
      OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_360_nl <= MUX_s_1_2_2(mux_tmp_359, or_363_nl, fsm_output(3));
  or_362_nl <= (NOT (fsm_output(3))) OR (fsm_output(1)) OR (NOT (fsm_output(6)))
      OR (fsm_output(7)) OR (fsm_output(5));
  mux_361_nl <= MUX_s_1_2_2(mux_360_nl, or_362_nl, fsm_output(4));
  mux_363_nl <= MUX_s_1_2_2(nand_10_nl, mux_361_nl, fsm_output(2));
  or_360_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(7)) OR (fsm_output(5));
  mux_357_nl <= MUX_s_1_2_2(mux_tmp_354, or_360_nl, fsm_output(3));
  or_361_nl <= (fsm_output(4)) OR mux_357_nl;
  or_359_nl <= (NOT (fsm_output(3))) OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(7))
      OR (fsm_output(5));
  or_355_nl <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR (fsm_output(7)) OR (NOT
      (fsm_output(5)));
  mux_355_nl <= MUX_s_1_2_2(mux_tmp_354, or_355_nl, fsm_output(3));
  mux_356_nl <= MUX_s_1_2_2(or_359_nl, mux_355_nl, fsm_output(4));
  mux_358_nl <= MUX_s_1_2_2(or_361_nl, mux_356_nl, fsm_output(2));
  mux_364_nl <= MUX_s_1_2_2(mux_363_nl, mux_358_nl, fsm_output(0));
  nor_141_nl <= NOT(mux_219_itm OR (fsm_output(0)));
  VEC_LOOP_mux1h_10_nl <= MUX1HOT_v_32_3_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_help_9_sva, (twiddle_rsci_qa_d_mxwt(31 DOWNTO 0)), STD_LOGIC_VECTOR'(
      nor_141_nl & and_dcpl_102 & and_dcpl_106));
  mux_379_nl <= MUX_s_1_2_2(or_136_cse, or_224_cse, fsm_output(3));
  mux_380_nl <= MUX_s_1_2_2(or_tmp_282, mux_379_nl, fsm_output(1));
  or_380_nl <= (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(4));
  mux_381_nl <= MUX_s_1_2_2(mux_380_nl, or_380_nl, fsm_output(0));
  mux_376_nl <= MUX_s_1_2_2(or_136_cse, (fsm_output(7)), fsm_output(3));
  mux_377_nl <= MUX_s_1_2_2(mux_376_nl, or_223_cse, fsm_output(1));
  or_378_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_378_nl <= MUX_s_1_2_2(mux_377_nl, or_378_nl, fsm_output(0));
  mux_382_nl <= MUX_s_1_2_2(mux_381_nl, mux_378_nl, fsm_output(5));
  or_376_nl <= (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(7))
      OR (NOT (fsm_output(4)));
  mux_375_nl <= MUX_s_1_2_2((fsm_output(7)), or_376_nl, fsm_output(5));
  mux_383_nl <= MUX_s_1_2_2(mux_382_nl, mux_375_nl, fsm_output(6));
  mux_370_nl <= MUX_s_1_2_2((fsm_output(7)), (fsm_output(4)), fsm_output(3));
  mux_368_nl <= MUX_s_1_2_2((fsm_output(4)), (NOT (fsm_output(4))), fsm_output(7));
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, or_223_cse, fsm_output(3));
  mux_371_nl <= MUX_s_1_2_2(mux_370_nl, mux_369_nl, fsm_output(1));
  mux_372_nl <= MUX_s_1_2_2(mux_371_nl, or_tmp_283, fsm_output(0));
  mux_373_nl <= MUX_s_1_2_2(mux_372_nl, or_223_cse, fsm_output(5));
  and_171_nl <= or_166_cse AND (fsm_output(3));
  mux_366_nl <= MUX_s_1_2_2((fsm_output(7)), or_224_cse, and_171_nl);
  mux_365_nl <= MUX_s_1_2_2(or_tmp_283, or_tmp_282, fsm_output(1));
  or_371_nl <= (fsm_output(0)) OR mux_365_nl;
  mux_367_nl <= MUX_s_1_2_2(mux_366_nl, or_371_nl, fsm_output(5));
  mux_374_nl <= MUX_s_1_2_2(mux_373_nl, mux_367_nl, fsm_output(6));
  mux_384_nl <= MUX_s_1_2_2(mux_383_nl, mux_374_nl, fsm_output(2));
  COMP_LOOP_twiddle_f_not_1_nl <= NOT mux_384_nl;
  nor_181_nl <= NOT((fsm_output(1)) OR (fsm_output(4)) OR (NOT (fsm_output(3))));
  mux_523_nl <= MUX_s_1_2_2(nor_181_nl, and_dcpl_35, fsm_output(5));
  mux_524_nl <= MUX_s_1_2_2((NOT mux_523_nl), (fsm_output(5)), fsm_output(6));
  mux_520_nl <= MUX_s_1_2_2(and_dcpl_35, (fsm_output(4)), or_166_cse);
  mux_521_nl <= MUX_s_1_2_2(nor_182_cse, mux_520_nl, fsm_output(5));
  or_516_nl <= (fsm_output(5)) OR (or_166_cse AND CONV_SL_1_1(fsm_output(4 DOWNTO
      3)=STD_LOGIC_VECTOR'("11")));
  mux_522_nl <= MUX_s_1_2_2((NOT mux_521_nl), or_516_nl, fsm_output(6));
  mux_525_nl <= MUX_s_1_2_2(mux_524_nl, mux_522_nl, fsm_output(2));
  VEC_LOOP_or_48_nl <= and_dcpl_23 OR and_dcpl_67;
  VEC_LOOP_or_49_nl <= and_dcpl_32 OR and_dcpl_61 OR VEC_LOOP_or_50_cse OR VEC_LOOP_or_51_cse
      OR VEC_LOOP_or_55_cse OR VEC_LOOP_or_54_cse OR VEC_LOOP_or_53_cse;
  mux_389_nl <= MUX_s_1_2_2(or_tmp_294, mux_tmp_386, and_dcpl_35);
  mux_410_nl <= MUX_s_1_2_2(mux_tmp_391, mux_389_nl, fsm_output(2));
  mux_385_nl <= MUX_s_1_2_2(or_tmp_294, or_tmp_125, fsm_output(4));
  mux_388_nl <= MUX_s_1_2_2(mux_tmp_387, mux_385_nl, fsm_output(3));
  mux_392_nl <= MUX_s_1_2_2(mux_tmp_391, mux_388_nl, fsm_output(2));
  mux_411_nl <= MUX_s_1_2_2(mux_410_nl, mux_392_nl, or_166_cse);
  mux_424_nl <= MUX_s_1_2_2((NOT or_tmp_203), or_tmp_203, fsm_output(7));
  mux_425_nl <= MUX_s_1_2_2(mux_424_nl, mux_tmp_422, fsm_output(1));
  mux_421_nl <= MUX_s_1_2_2((NOT or_tmp_315), or_tmp_315, fsm_output(7));
  mux_423_nl <= MUX_s_1_2_2(mux_tmp_422, mux_421_nl, fsm_output(1));
  mux_426_nl <= MUX_s_1_2_2(mux_425_nl, mux_423_nl, fsm_output(0));
  VEC_LOOP_VEC_LOOP_mux_3_nl <= MUX_v_12_2_2(z_out_10, (VEC_LOOP_j_10_12_0_sva_1(11
      DOWNTO 0)), VEC_LOOP_acc_1_cse_10_sva_mx0c2);
  VEC_LOOP_not_nl <= NOT VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  or_453_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_470_nl <= MUX_s_1_2_2(mux_tmp_467, or_453_nl, fsm_output(1));
  mux_471_nl <= MUX_s_1_2_2(mux_470_nl, or_tmp_352, fsm_output(6));
  mux_472_nl <= MUX_s_1_2_2(mux_tmp_466, mux_471_nl, fsm_output(4));
  or_451_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_468_nl <= MUX_s_1_2_2(or_451_nl, mux_tmp_467, fsm_output(1));
  or_452_nl <= (fsm_output(6)) OR mux_468_nl;
  mux_469_nl <= MUX_s_1_2_2(or_452_nl, mux_tmp_466, fsm_output(4));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output(2));
  mux_477_nl <= MUX_s_1_2_2(not_tmp_195, or_dcpl_81, fsm_output(7));
  mux_478_nl <= MUX_s_1_2_2(mux_477_nl, mux_tmp_475, fsm_output(1));
  nor_57_nl <= NOT(((CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")))
      AND (fsm_output(4))) OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  mux_474_nl <= MUX_s_1_2_2(nor_57_nl, or_tmp_255, fsm_output(7));
  mux_476_nl <= MUX_s_1_2_2(mux_tmp_475, mux_474_nl, fsm_output(1));
  mux_479_nl <= MUX_s_1_2_2(mux_478_nl, mux_476_nl, fsm_output(0));
  or_527_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  mux_529_nl <= MUX_s_1_2_2(or_tmp_403, or_527_nl, fsm_output(5));
  mux_530_nl <= MUX_s_1_2_2(nor_tmp_55, (NOT mux_529_nl), fsm_output(4));
  mux_527_nl <= MUX_s_1_2_2(or_526_cse, or_tmp_403, fsm_output(5));
  mux_528_nl <= MUX_s_1_2_2((NOT mux_527_nl), nor_tmp_55, fsm_output(4));
  mux_531_nl <= MUX_s_1_2_2(mux_530_nl, mux_528_nl, fsm_output(6));
  or_523_nl <= (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(2));
  or_522_nl <= (fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(1))
      OR (fsm_output(2));
  mux_526_nl <= MUX_s_1_2_2(or_523_nl, or_522_nl, fsm_output(4));
  nor_180_nl <= NOT((fsm_output(6)) OR mux_526_nl);
  mux_532_nl <= MUX_s_1_2_2(mux_531_nl, nor_180_nl, fsm_output(7));
  nor_174_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("110")));
  mux_535_nl <= MUX_s_1_2_2(nor_174_nl, nor_62_cse, fsm_output(6));
  nor_176_nl <= NOT((fsm_output(4)) OR (NOT and_169_cse));
  nor_177_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")));
  mux_533_nl <= MUX_s_1_2_2(nor_177_nl, and_169_cse, fsm_output(4));
  mux_534_nl <= MUX_s_1_2_2(nor_176_nl, mux_533_nl, fsm_output(6));
  mux_536_nl <= MUX_s_1_2_2(mux_535_nl, mux_534_nl, fsm_output(5));
  mux_537_nl <= MUX_s_1_2_2(mux_536_nl, nor_178_cse, fsm_output(7));
  mux_491_nl <= MUX_s_1_2_2(and_dcpl_21, mux_tmp_386, fsm_output(4));
  mux_492_nl <= MUX_s_1_2_2(or_tmp_261, (NOT mux_491_nl), or_526_cse);
  COMP_LOOP_twiddle_f_or_30_nl <= and_dcpl_189 OR and_dcpl_192 OR and_dcpl_196 OR
      and_dcpl_200;
  COMP_LOOP_twiddle_f_mux1h_166_nl <= MUX1HOT_v_12_4_2((STD_LOGIC_VECTOR'( "00")
      & COMP_LOOP_5_twiddle_f_lshift_ncse_sva), COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1,
      ('0' & COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1), COMP_LOOP_2_twiddle_f_lshift_ncse_sva,
      STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_18_itm & and_dcpl_181 & and_dcpl_186
      & COMP_LOOP_twiddle_f_or_30_nl));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl <= MUX_v_2_2_2((COMP_LOOP_k_12_4_sva_7_0(7
      DOWNTO 6)), STD_LOGIC_VECTOR'( '0' & (COMP_LOOP_k_12_4_sva_7_0(7))), and_dcpl_186);
  COMP_LOOP_twiddle_f_nor_9_nl <= NOT(and_dcpl_175 OR and_dcpl_199);
  COMP_LOOP_twiddle_f_and_16_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl,
      COMP_LOOP_twiddle_f_nor_9_nl);
  COMP_LOOP_twiddle_f_or_31_nl <= and_dcpl_181 OR and_dcpl_189 OR and_dcpl_192 OR
      and_dcpl_196 OR and_dcpl_200;
  COMP_LOOP_twiddle_f_mux1h_167_nl <= MUX1HOT_v_6_3_2((COMP_LOOP_k_12_4_sva_7_0(7
      DOWNTO 2)), (COMP_LOOP_k_12_4_sva_7_0(5 DOWNTO 0)), (COMP_LOOP_k_12_4_sva_7_0(6
      DOWNTO 1)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_18_itm & COMP_LOOP_twiddle_f_or_31_nl
      & and_dcpl_186));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl <= MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0(1)),
      (COMP_LOOP_k_12_4_sva_7_0(0)), and_dcpl_186);
  COMP_LOOP_twiddle_f_or_32_nl <= (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl
      AND (NOT(and_dcpl_181 OR and_dcpl_189 OR and_dcpl_192 OR and_dcpl_196))) OR
      and_dcpl_200;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl <= ((COMP_LOOP_k_12_4_sva_7_0(0))
      AND (NOT(and_dcpl_181 OR and_dcpl_186 OR and_dcpl_189))) OR and_dcpl_192 OR
      and_dcpl_196 OR and_dcpl_200;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl <= (NOT(and_dcpl_175 OR and_dcpl_181
      OR and_dcpl_186 OR and_dcpl_192 OR and_dcpl_200)) OR and_dcpl_189 OR and_dcpl_196
      OR and_dcpl_199;
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_mux1h_166_nl)
      * UNSIGNED(COMP_LOOP_twiddle_f_and_16_nl & COMP_LOOP_twiddle_f_mux1h_167_nl
      & COMP_LOOP_twiddle_f_or_32_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl & '1')), 12));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl <= (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(11))
      AND COMP_LOOP_twiddle_f_nor_5_itm;
  COMP_LOOP_twiddle_f_mux1h_168_nl <= MUX1HOT_v_11_3_2((STD_LOGIC_VECTOR'( "00")
      & COMP_LOOP_9_twiddle_f_lshift_itm), COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(10 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_207
      & COMP_LOOP_twiddle_f_or_20_itm & COMP_LOOP_twiddle_f_or_1_itm));
  COMP_LOOP_twiddle_f_and_19_nl <= (COMP_LOOP_k_12_4_sva_7_0(7)) AND COMP_LOOP_twiddle_f_nor_5_itm;
  COMP_LOOP_twiddle_f_mux1h_169_nl <= MUX1HOT_v_7_3_2((STD_LOGIC_VECTOR'( "00") &
      (COMP_LOOP_k_12_4_sva_7_0(7 DOWNTO 3))), (COMP_LOOP_k_12_4_sva_7_0(7 DOWNTO
      1)), (COMP_LOOP_k_12_4_sva_7_0(6 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_207
      & COMP_LOOP_twiddle_f_or_20_itm & COMP_LOOP_twiddle_f_or_1_itm));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl <= MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0(2)),
      (COMP_LOOP_k_12_4_sva_7_0(0)), COMP_LOOP_twiddle_f_or_20_itm);
  COMP_LOOP_twiddle_f_or_33_nl <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl
      OR and_dcpl_217 OR and_dcpl_224 OR and_dcpl_230;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl <= ((COMP_LOOP_k_12_4_sva_7_0(1))
      AND (NOT(and_dcpl_213 OR and_dcpl_217 OR and_dcpl_224))) OR and_dcpl_220 OR
      and_dcpl_229 OR and_dcpl_230;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl <= ((COMP_LOOP_k_12_4_sva_7_0(0))
      AND (NOT(and_dcpl_217 OR and_dcpl_220))) OR and_dcpl_213 OR and_dcpl_224 OR
      and_dcpl_229 OR and_dcpl_230;
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl
      & COMP_LOOP_twiddle_f_mux1h_168_nl) * UNSIGNED(COMP_LOOP_twiddle_f_and_19_nl
      & COMP_LOOP_twiddle_f_mux1h_169_nl & COMP_LOOP_twiddle_f_or_33_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl & '1')), 12));
  VEC_LOOP_VEC_LOOP_or_12_nl <= (STAGE_LOOP_lshift_psp_sva(12)) OR and_dcpl_238 OR
      and_dcpl_241 OR and_dcpl_247 OR and_dcpl_252 OR and_dcpl_257 OR and_dcpl_259
      OR and_dcpl_262 OR and_dcpl_264 OR and_dcpl_266 OR and_dcpl_268;
  VEC_LOOP_VEC_LOOP_mux_9_nl <= MUX_v_12_2_2((STAGE_LOOP_lshift_psp_sva(11 DOWNTO
      0)), (NOT (STAGE_LOOP_lshift_psp_sva(12 DOWNTO 1))), VEC_LOOP_or_62_itm);
  nand_41_nl <= NOT((fsm_output(1)) AND not_tmp_233);
  mux_540_nl <= MUX_s_1_2_2(nand_41_nl, or_tmp_379, fsm_output(5));
  or_534_nl <= (fsm_output(6)) OR mux_540_nl;
  mux_539_nl <= MUX_s_1_2_2(mux_tmp_497, or_534_nl, fsm_output(2));
  and_593_nl <= (fsm_output(7)) AND (fsm_output(3));
  mux_543_nl <= MUX_s_1_2_2(not_tmp_233, and_593_nl, fsm_output(1));
  or_535_nl <= (fsm_output(5)) OR (NOT mux_543_nl);
  mux_542_nl <= MUX_s_1_2_2(or_535_nl, or_tmp_352, fsm_output(6));
  mux_541_nl <= MUX_s_1_2_2(mux_542_nl, mux_tmp_497, fsm_output(2));
  mux_538_nl <= MUX_s_1_2_2(mux_539_nl, mux_541_nl, fsm_output(4));
  VEC_LOOP_or_75_nl <= mux_538_nl OR (fsm_output(0)) OR and_dcpl_238 OR and_dcpl_241
      OR and_dcpl_247 OR and_dcpl_252 OR and_dcpl_257 OR and_dcpl_259 OR and_dcpl_262
      OR and_dcpl_264 OR and_dcpl_266 OR and_dcpl_268;
  VEC_LOOP_VEC_LOOP_mux_10_nl <= MUX_v_8_2_2((VEC_LOOP_acc_1_cse_10_sva(11 DOWNTO
      4)), COMP_LOOP_k_12_4_sva_7_0, VEC_LOOP_or_62_itm);
  VEC_LOOP_VEC_LOOP_or_13_nl <= ((VEC_LOOP_acc_1_cse_10_sva(3)) AND (NOT(and_dcpl_262
      OR and_dcpl_264 OR and_dcpl_266 OR and_dcpl_268))) OR and_dcpl_238 OR and_dcpl_241
      OR and_dcpl_247 OR and_dcpl_252 OR and_dcpl_257 OR and_dcpl_259;
  VEC_LOOP_VEC_LOOP_or_14_nl <= ((VEC_LOOP_acc_1_cse_10_sva(2)) AND (NOT(and_dcpl_252
      OR and_dcpl_257 OR and_dcpl_259 OR and_dcpl_264 OR and_dcpl_268))) OR and_dcpl_238
      OR and_dcpl_241 OR and_dcpl_247 OR and_dcpl_262 OR and_dcpl_266;
  VEC_LOOP_VEC_LOOP_or_15_nl <= ((VEC_LOOP_acc_1_cse_10_sva(1)) AND (NOT(and_dcpl_241
      OR and_dcpl_247 OR and_dcpl_252 OR and_dcpl_259 OR and_dcpl_266 OR and_dcpl_268)))
      OR and_dcpl_238 OR and_dcpl_257 OR and_dcpl_262 OR and_dcpl_264;
  VEC_LOOP_VEC_LOOP_or_16_nl <= ((VEC_LOOP_acc_1_cse_10_sva(0)) AND (NOT(and_dcpl_238
      OR and_dcpl_247 OR and_dcpl_257 OR and_dcpl_259 OR and_dcpl_262 OR and_dcpl_264
      OR and_dcpl_266))) OR and_dcpl_241 OR and_dcpl_252 OR and_dcpl_268;
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_12_nl &
      VEC_LOOP_VEC_LOOP_mux_9_nl & VEC_LOOP_or_75_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_10_nl
      & VEC_LOOP_VEC_LOOP_or_13_nl & VEC_LOOP_VEC_LOOP_or_14_nl & VEC_LOOP_VEC_LOOP_or_15_nl
      & VEC_LOOP_VEC_LOOP_or_16_nl & '1'), 13), 14), 14));
  z_out_3 <= acc_nl(13 DOWNTO 1);
  VEC_LOOP_mux_17_nl <= MUX_v_20_2_2((z_out_15(31 DOWNTO 12)), (STD_LOGIC_VECTOR'(
      "0000000") & z_out_17 & STD_LOGIC_VECTOR'( "0000")), and_dcpl_282);
  VEC_LOOP_or_76_nl <= (NOT(and_dcpl_205 AND and_dcpl_204 AND and_dcpl_187 AND (fsm_output(2))
      AND (NOT (fsm_output(0))))) OR and_dcpl_282;
  VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl <= NOT(MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"),
      (STAGE_LOOP_lshift_psp_sva(12 DOWNTO 1)), and_dcpl_282));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_17_nl
      & VEC_LOOP_or_76_nl), 21), 22) + CONV_UNSIGNED(CONV_SIGNED(SIGNED('1' & VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl
      & '1'), 14), 22), 22));
  z_out_4_20_12 <= acc_1_nl(21 DOWNTO 13);
  VEC_LOOP_mux_18_nl <= MUX_v_12_2_2(((z_out_17(7 DOWNTO 0)) & (STAGE_LOOP_lshift_psp_sva(4
      DOWNTO 1))), z_out_6, and_dcpl_295);
  VEC_LOOP_mux_19_nl <= MUX_v_12_2_2((COMP_LOOP_twiddle_f_9_sva(11 DOWNTO 0)), VEC_LOOP_acc_1_cse_10_sva,
      and_dcpl_295);
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_18_nl) + UNSIGNED(VEC_LOOP_mux_19_nl),
      12));
  and_594_nl <= and_dcpl_205 AND and_dcpl_306 AND and_dcpl_305;
  and_595_nl <= and_dcpl_312 AND and_dcpl_310;
  and_596_nl <= and_dcpl_312 AND and_dcpl_314;
  and_597_nl <= and_dcpl_323 AND and_dcpl_321;
  and_598_nl <= and_dcpl_323 AND and_dcpl_325;
  and_599_nl <= and_dcpl_215 AND and_dcpl_311 AND and_dcpl_305;
  and_600_nl <= and_dcpl_331 AND and_dcpl_310;
  and_601_nl <= and_dcpl_331 AND and_dcpl_314;
  and_602_nl <= and_dcpl_337 AND and_dcpl_321;
  VEC_LOOP_mux1h_33_nl <= MUX1HOT_v_4_13_2(STD_LOGIC_VECTOR'( "0001"), STD_LOGIC_VECTOR'(
      "0010"), STD_LOGIC_VECTOR'( "0011"), STD_LOGIC_VECTOR'( "0100"), STD_LOGIC_VECTOR'(
      "0101"), STD_LOGIC_VECTOR'( "0110"), STD_LOGIC_VECTOR'( "0111"), STD_LOGIC_VECTOR'(
      "1001"), STD_LOGIC_VECTOR'( "1010"), STD_LOGIC_VECTOR'( "1011"), STD_LOGIC_VECTOR'(
      "1100"), STD_LOGIC_VECTOR'( "1101"), STD_LOGIC_VECTOR'( "1110"), STD_LOGIC_VECTOR'(
      and_354_itm & and_594_nl & and_595_nl & and_596_nl & and_371_itm & and_597_nl
      & and_598_nl & and_380_itm & and_599_nl & and_600_nl & and_601_nl & and_388_itm
      & and_602_nl));
  and_603_nl <= and_dcpl_337 AND and_dcpl_325;
  VEC_LOOP_or_77_nl <= MUX_v_4_2_2(VEC_LOOP_mux1h_33_nl, STD_LOGIC_VECTOR'("1111"),
      and_603_nl);
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_12_4_sva_7_0 & VEC_LOOP_or_77_nl)
      + UNSIGNED(STAGE_LOOP_lshift_psp_sva(12 DOWNTO 1)), 12));
  acc_4_cse_12_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_6) + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva),
      12));
  and_604_nl <= and_dcpl_205 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_310;
  and_605_nl <= and_dcpl_215 AND and_dcpl_204 AND and_dcpl_325;
  and_606_nl <= and_dcpl_215 AND and_193_cse AND and_dcpl_310;
  VEC_LOOP_mux1h_34_nl <= MUX1HOT_v_3_6_2(STD_LOGIC_VECTOR'( "110"), STD_LOGIC_VECTOR'(
      "101"), STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'( "011"), STD_LOGIC_VECTOR'(
      "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( and_604_nl & and_371_itm
      & and_605_nl & and_380_itm & and_606_nl & and_388_itm));
  VEC_LOOP_nor_18_nl <= NOT(MUX_v_3_2_2(VEC_LOOP_mux1h_34_nl, STD_LOGIC_VECTOR'("111"),
      and_354_itm));
  and_607_nl <= and_dcpl_334 AND and_dcpl_306 AND and_dcpl_325;
  VEC_LOOP_or_78_nl <= MUX_v_3_2_2(VEC_LOOP_nor_18_nl, STD_LOGIC_VECTOR'("111"),
      and_607_nl);
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_1_cse_10_sva)
      + UNSIGNED(COMP_LOOP_k_12_4_sva_7_0 & VEC_LOOP_or_78_nl & '1'), 12));
  VEC_LOOP_acc_36_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_12_4_sva_7_0
      & '1') + UNSIGNED(STAGE_LOOP_lshift_psp_sva(12 DOWNTO 4)), 9));
  and_608_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)=STD_LOGIC_VECTOR'("0101")) AND
      and_dcpl_187 AND (fsm_output(2)) AND (NOT (fsm_output(0)));
  VEC_LOOP_mux_20_nl <= MUX_v_12_2_2(z_out_6, (STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_36_nl),
      9)) & (STAGE_LOOP_lshift_psp_sva(3 DOWNTO 1))), and_608_nl);
  z_out_11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_20_nl) + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva),
      12));
  VEC_LOOP_mux_21_nl <= MUX_v_32_2_2(COMP_LOOP_twiddle_f_9_sva, factor1_1_sva, and_dcpl_462);
  VEC_LOOP_or_79_nl <= (NOT(and_dcpl_21 AND and_dcpl_172 AND and_dcpl_187 AND (fsm_output(2))
      AND (NOT (fsm_output(0))))) OR and_dcpl_462;
  VEC_LOOP_mux_22_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "0000000000000000000") &
      STAGE_LOOP_lshift_psp_sva), (NOT COMP_LOOP_1_mult_cmp_return_rsc_z), and_dcpl_462);
  acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_21_nl & VEC_LOOP_or_79_nl)
      + UNSIGNED(VEC_LOOP_mux_22_nl & '1'), 33));
  z_out_15 <= acc_12_nl(32 DOWNTO 1);
  VEC_LOOP_mux1h_35_nl <= MUX1HOT_v_10_5_2((STD_LOGIC_VECTOR'( "00") & (COMP_LOOP_twiddle_f_9_sva(11
      DOWNTO 4))), ('0' & (VEC_LOOP_acc_1_cse_10_sva(11 DOWNTO 3))), (VEC_LOOP_acc_1_cse_10_sva(11
      DOWNTO 2)), (STD_LOGIC_VECTOR'( "01") & (NOT (STAGE_LOOP_lshift_psp_sva(12
      DOWNTO 5)))), ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(12 DOWNTO 4)))), STD_LOGIC_VECTOR'(
      and_dcpl_469 & and_dcpl_473 & VEC_LOOP_or_59_itm & and_dcpl_486 & and_dcpl_488));
  VEC_LOOP_or_80_nl <= (NOT(and_dcpl_469 OR and_dcpl_473 OR and_dcpl_478 OR and_dcpl_481))
      OR and_dcpl_486 OR and_dcpl_488;
  VEC_LOOP_VEC_LOOP_and_1_nl <= (COMP_LOOP_k_12_4_sva_7_0(7)) AND (NOT(and_dcpl_469
      OR and_dcpl_473 OR and_dcpl_486 OR and_dcpl_488));
  VEC_LOOP_VEC_LOOP_mux_11_nl <= MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0(7)), (COMP_LOOP_k_12_4_sva_7_0(6)),
      VEC_LOOP_or_59_itm);
  VEC_LOOP_and_20_nl <= VEC_LOOP_VEC_LOOP_mux_11_nl AND (NOT(and_dcpl_469 OR and_dcpl_486));
  VEC_LOOP_or_81_nl <= and_dcpl_469 OR and_dcpl_486;
  VEC_LOOP_mux1h_36_nl <= MUX1HOT_v_6_3_2((COMP_LOOP_k_12_4_sva_7_0(7 DOWNTO 2)),
      (COMP_LOOP_k_12_4_sva_7_0(6 DOWNTO 1)), (COMP_LOOP_k_12_4_sva_7_0(5 DOWNTO
      0)), STD_LOGIC_VECTOR'( VEC_LOOP_or_81_nl & VEC_LOOP_or_68_itm & VEC_LOOP_or_59_itm));
  VEC_LOOP_mux_23_nl <= MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0(1)), (COMP_LOOP_k_12_4_sva_7_0(0)),
      VEC_LOOP_or_68_itm);
  VEC_LOOP_VEC_LOOP_or_17_nl <= (VEC_LOOP_mux_23_nl AND (NOT and_dcpl_478)) OR and_dcpl_481;
  VEC_LOOP_VEC_LOOP_or_18_nl <= ((COMP_LOOP_k_12_4_sva_7_0(0)) AND (NOT and_dcpl_488))
      OR and_dcpl_473 OR and_dcpl_478 OR and_dcpl_481;
  acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_35_nl & VEC_LOOP_or_80_nl)
      + UNSIGNED(VEC_LOOP_VEC_LOOP_and_1_nl & VEC_LOOP_and_20_nl & VEC_LOOP_mux1h_36_nl
      & VEC_LOOP_VEC_LOOP_or_17_nl & VEC_LOOP_VEC_LOOP_or_18_nl & '1'), 11));
  z_out_16 <= acc_13_nl(10 DOWNTO 1);
  VEC_LOOP_mux_24_nl <= MUX_v_8_2_2((STAGE_LOOP_lshift_psp_sva(12 DOWNTO 5)), STD_LOGIC_VECTOR'(
      "00000001"), and_dcpl_282);
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_12_4_sva_7_0),
      8), 9) + CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_24_nl), 9), 9));
  VEC_LOOP_VEC_LOOP_or_19_nl <= (VEC_LOOP_acc_1_cse_10_sva(11)) OR and_dcpl_526 OR
      and_dcpl_528;
  VEC_LOOP_VEC_LOOP_mux_12_nl <= MUX_v_10_2_2((VEC_LOOP_acc_1_cse_10_sva(10 DOWNTO
      1)), (NOT (STAGE_LOOP_lshift_psp_sva(12 DOWNTO 3))), VEC_LOOP_or_71_itm);
  VEC_LOOP_or_82_nl <= (NOT(and_dcpl_509 OR and_dcpl_515 OR and_dcpl_518 OR and_dcpl_521))
      OR and_dcpl_526 OR and_dcpl_528;
  VEC_LOOP_and_23_nl <= (COMP_LOOP_k_12_4_sva_7_0(7)) AND VEC_LOOP_nor_10_itm;
  VEC_LOOP_VEC_LOOP_mux_13_nl <= MUX_v_7_2_2((COMP_LOOP_k_12_4_sva_7_0(6 DOWNTO 0)),
      (COMP_LOOP_k_12_4_sva_7_0(7 DOWNTO 1)), VEC_LOOP_or_71_itm);
  VEC_LOOP_VEC_LOOP_or_20_nl <= ((COMP_LOOP_k_12_4_sva_7_0(0)) AND (NOT(and_dcpl_509
      OR and_dcpl_515))) OR and_dcpl_518 OR and_dcpl_521;
  VEC_LOOP_VEC_LOOP_or_21_nl <= (NOT(and_dcpl_509 OR and_dcpl_518 OR and_dcpl_528))
      OR and_dcpl_515 OR and_dcpl_521 OR and_dcpl_526;
  VEC_LOOP_VEC_LOOP_or_22_nl <= VEC_LOOP_nor_10_itm OR and_dcpl_509 OR and_dcpl_515
      OR and_dcpl_518 OR and_dcpl_521;
  acc_15_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_19_nl
      & VEC_LOOP_VEC_LOOP_mux_12_nl & VEC_LOOP_or_82_nl) + UNSIGNED(VEC_LOOP_and_23_nl
      & VEC_LOOP_VEC_LOOP_mux_13_nl & VEC_LOOP_VEC_LOOP_or_20_nl & VEC_LOOP_VEC_LOOP_or_21_nl
      & VEC_LOOP_VEC_LOOP_or_22_nl & '1'), 12));
  z_out_18 <= acc_15_nl(11 DOWNTO 1);
END v6;

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
    vec_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_wea : OUT STD_LOGIC;
    vec_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_web : OUT STD_LOGIC;
    vec_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_wea : OUT STD_LOGIC;
    twiddle_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_web : OUT STD_LOGIC;
    twiddle_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_wea : OUT STD_LOGIC;
    twiddle_h_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_web : OUT STD_LOGIC;
    twiddle_h_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_precomp;

ARCHITECTURE v6 OF inPlaceNTT_DIT_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
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
  SIGNAL vec_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL vec_rsci_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
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
  SIGNAL twiddle_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
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
  SIGNAL twiddle_h_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
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
      vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_vec_rsci_adra_d : STD_LOGIC_VECTOR (23
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
      (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR
      (23 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  vec_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
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

  twiddle_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
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

  twiddle_h_rsci : inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
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

END v6;



