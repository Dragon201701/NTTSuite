
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
--  Generated date: Thu Sep 16 13:31:01 2021
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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_14_32_16384_16384_32_1_gen
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_14_32_16384_16384_32_1_gen
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_core_fsm IS
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

END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_staller IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp IS
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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl IS
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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  COMP_LOOP_1_mult_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo_2 OR ensig_cgo_iro_2);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_complete_rsci IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_vec_rsci_1 IS
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
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core_run_rsci IS
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
END v7;

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
    twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0)
  );
END inPlaceNTT_DIT_precomp_core;

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp_core IS
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
  SIGNAL or_tmp_25 : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL nor_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_36 : STD_LOGIC;
  SIGNAL or_tmp_37 : STD_LOGIC;
  SIGNAL or_tmp_62 : STD_LOGIC;
  SIGNAL or_tmp_63 : STD_LOGIC;
  SIGNAL nor_tmp_16 : STD_LOGIC;
  SIGNAL nor_tmp_36 : STD_LOGIC;
  SIGNAL or_dcpl_161 : STD_LOGIC;
  SIGNAL or_tmp_134 : STD_LOGIC;
  SIGNAL mux_tmp_274 : STD_LOGIC;
  SIGNAL mux_tmp_276 : STD_LOGIC;
  SIGNAL or_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_277 : STD_LOGIC;
  SIGNAL mux_tmp_278 : STD_LOGIC;
  SIGNAL or_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_281 : STD_LOGIC;
  SIGNAL mux_tmp_282 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL mux_tmp_284 : STD_LOGIC;
  SIGNAL mux_tmp_286 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL mux_tmp_293 : STD_LOGIC;
  SIGNAL mux_tmp_294 : STD_LOGIC;
  SIGNAL or_tmp_145 : STD_LOGIC;
  SIGNAL or_tmp_146 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL or_tmp_149 : STD_LOGIC;
  SIGNAL mux_tmp_310 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL mux_tmp_314 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL mux_tmp_339 : STD_LOGIC;
  SIGNAL or_tmp_161 : STD_LOGIC;
  SIGNAL or_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_342 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL mux_tmp_351 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_354 : STD_LOGIC;
  SIGNAL mux_tmp_356 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL mux_tmp_357 : STD_LOGIC;
  SIGNAL mux_tmp_358 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
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
  SIGNAL and_dcpl_102 : STD_LOGIC;
  SIGNAL or_tmp_173 : STD_LOGIC;
  SIGNAL or_tmp_174 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL mux_tmp_363 : STD_LOGIC;
  SIGNAL mux_tmp_382 : STD_LOGIC;
  SIGNAL mux_tmp_383 : STD_LOGIC;
  SIGNAL mux_tmp_389 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL mux_tmp_412 : STD_LOGIC;
  SIGNAL or_tmp_210 : STD_LOGIC;
  SIGNAL or_tmp_218 : STD_LOGIC;
  SIGNAL or_tmp_225 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_441 : STD_LOGIC;
  SIGNAL mux_tmp_446 : STD_LOGIC;
  SIGNAL or_tmp_235 : STD_LOGIC;
  SIGNAL or_tmp_236 : STD_LOGIC;
  SIGNAL mux_tmp_453 : STD_LOGIC;
  SIGNAL or_tmp_237 : STD_LOGIC;
  SIGNAL or_tmp_238 : STD_LOGIC;
  SIGNAL not_tmp_151 : STD_LOGIC;
  SIGNAL or_tmp_241 : STD_LOGIC;
  SIGNAL mux_tmp_459 : STD_LOGIC;
  SIGNAL mux_tmp_460 : STD_LOGIC;
  SIGNAL mux_tmp_478 : STD_LOGIC;
  SIGNAL or_tmp_254 : STD_LOGIC;
  SIGNAL mux_tmp_483 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL mux_tmp_502 : STD_LOGIC;
  SIGNAL mux_tmp_506 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL not_tmp_164 : STD_LOGIC;
  SIGNAL or_tmp_282 : STD_LOGIC;
  SIGNAL or_tmp_284 : STD_LOGIC;
  SIGNAL mux_tmp_514 : STD_LOGIC;
  SIGNAL mux_tmp_516 : STD_LOGIC;
  SIGNAL mux_tmp_517 : STD_LOGIC;
  SIGNAL mux_tmp_518 : STD_LOGIC;
  SIGNAL mux_tmp_519 : STD_LOGIC;
  SIGNAL mux_tmp_520 : STD_LOGIC;
  SIGNAL mux_tmp_521 : STD_LOGIC;
  SIGNAL mux_tmp_523 : STD_LOGIC;
  SIGNAL mux_tmp_524 : STD_LOGIC;
  SIGNAL mux_tmp_525 : STD_LOGIC;
  SIGNAL or_tmp_289 : STD_LOGIC;
  SIGNAL mux_tmp_533 : STD_LOGIC;
  SIGNAL or_tmp_293 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL mux_tmp_564 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL mux_tmp_570 : STD_LOGIC;
  SIGNAL or_tmp_316 : STD_LOGIC;
  SIGNAL mux_tmp_574 : STD_LOGIC;
  SIGNAL mux_tmp_575 : STD_LOGIC;
  SIGNAL mux_tmp_579 : STD_LOGIC;
  SIGNAL mux_tmp_580 : STD_LOGIC;
  SIGNAL nor_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_595 : STD_LOGIC;
  SIGNAL and_dcpl_190 : STD_LOGIC;
  SIGNAL mux_tmp_619 : STD_LOGIC;
  SIGNAL mux_tmp_620 : STD_LOGIC;
  SIGNAL mux_tmp_621 : STD_LOGIC;
  SIGNAL mux_tmp_624 : STD_LOGIC;
  SIGNAL mux_tmp_625 : STD_LOGIC;
  SIGNAL mux_tmp_631 : STD_LOGIC;
  SIGNAL mux_tmp_633 : STD_LOGIC;
  SIGNAL mux_tmp_638 : STD_LOGIC;
  SIGNAL mux_tmp_643 : STD_LOGIC;
  SIGNAL mux_tmp_648 : STD_LOGIC;
  SIGNAL or_tmp_351 : STD_LOGIC;
  SIGNAL or_tmp_352 : STD_LOGIC;
  SIGNAL or_tmp_354 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL or_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_719 : STD_LOGIC;
  SIGNAL mux_tmp_721 : STD_LOGIC;
  SIGNAL mux_tmp_722 : STD_LOGIC;
  SIGNAL mux_tmp_724 : STD_LOGIC;
  SIGNAL mux_tmp_735 : STD_LOGIC;
  SIGNAL or_tmp_387 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL mux_tmp_753 : STD_LOGIC;
  SIGNAL mux_tmp_755 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL or_tmp_426 : STD_LOGIC;
  SIGNAL mux_tmp_808 : STD_LOGIC;
  SIGNAL mux_tmp_813 : STD_LOGIC;
  SIGNAL mux_tmp_814 : STD_LOGIC;
  SIGNAL nand_tmp_12 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL VEC_LOOP_j_10_14_0_sva_1 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_2_cse : STD_LOGIC;
  SIGNAL or_483_cse : STD_LOGIC;
  SIGNAL or_499_cse : STD_LOGIC;
  SIGNAL and_242_cse : STD_LOGIC;
  SIGNAL and_265_cse : STD_LOGIC;
  SIGNAL or_480_cse : STD_LOGIC;
  SIGNAL or_285_cse : STD_LOGIC;
  SIGNAL or_140_cse : STD_LOGIC;
  SIGNAL or_558_cse : STD_LOGIC;
  SIGNAL or_445_cse : STD_LOGIC;
  SIGNAL or_420_cse : STD_LOGIC;
  SIGNAL or_322_cse : STD_LOGIC;
  SIGNAL nor_125_cse : STD_LOGIC;
  SIGNAL mux_266_cse : STD_LOGIC;
  SIGNAL and_232_cse : STD_LOGIC;
  SIGNAL or_559_cse : STD_LOGIC;
  SIGNAL or_659_cse : STD_LOGIC;
  SIGNAL mux_307_cse : STD_LOGIC;
  SIGNAL mux_311_cse : STD_LOGIC;
  SIGNAL mux_375_cse : STD_LOGIC;
  SIGNAL mux_489_cse : STD_LOGIC;
  SIGNAL mux_331_cse : STD_LOGIC;
  SIGNAL mux_350_cse : STD_LOGIC;
  SIGNAL mux_267_cse : STD_LOGIC;
  SIGNAL mux_594_cse : STD_LOGIC;
  SIGNAL mux_360_cse : STD_LOGIC;
  SIGNAL mux_361_cse : STD_LOGIC;
  SIGNAL mux_366_cse : STD_LOGIC;
  SIGNAL mux_908_cse : STD_LOGIC;
  SIGNAL mux_318_cse : STD_LOGIC;
  SIGNAL mux_551_cse : STD_LOGIC;
  SIGNAL mux_548_cse : STD_LOGIC;
  SIGNAL mux_428_cse : STD_LOGIC;
  SIGNAL mux_364_cse : STD_LOGIC;
  SIGNAL nand_4_cse : STD_LOGIC;
  SIGNAL nand_3_cse : STD_LOGIC;
  SIGNAL or_358_cse : STD_LOGIC;
  SIGNAL mux_426_cse : STD_LOGIC;
  SIGNAL mux_420_cse : STD_LOGIC;
  SIGNAL mux_367_cse : STD_LOGIC;
  SIGNAL or_656_cse : STD_LOGIC;
  SIGNAL mux_910_cse : STD_LOGIC;
  SIGNAL mux_319_cse : STD_LOGIC;
  SIGNAL mux_316_cse : STD_LOGIC;
  SIGNAL mux_549_cse : STD_LOGIC;
  SIGNAL mux_789_cse : STD_LOGIC;
  SIGNAL mux_372_cse : STD_LOGIC;
  SIGNAL mux_377_cse : STD_LOGIC;
  SIGNAL mux_373_cse : STD_LOGIC;
  SIGNAL mux_378_cse : STD_LOGIC;
  SIGNAL mux_271_cse : STD_LOGIC;
  SIGNAL mux_797_cse : STD_LOGIC;
  SIGNAL mux_320_cse : STD_LOGIC;
  SIGNAL mux_317_cse : STD_LOGIC;
  SIGNAL mux_427_cse : STD_LOGIC;
  SIGNAL mux_877_cse : STD_LOGIC;
  SIGNAL vec_rsci_da_d_reg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL and_14_rmff : STD_LOGIC;
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_help_mux_1_rmff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_mux_rmff : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_87_rmff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_and_rmff : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mux1h_57_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_111_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_128_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL and_128_rmff : STD_LOGIC;
  SIGNAL and_123_rmff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL factor1_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_mult_vec_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_17_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_17_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_2_sva_mx0w1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_3_sva_mx0w2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_4_sva_mx0w3 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_5_sva_mx0w4 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_6_sva_mx0w5 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_7_sva_mx0w6 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_8_sva_mx0w7 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_9_sva_mx0w8 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_10_sva_mx0w9 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_11_sva_mx0w10 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_12_sva_mx0w11 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_13_sva_mx0w12 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_14_sva_mx0w13 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_15_sva_mx0w14 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_16_sva_mx0w15 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_mul_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_18_sva_mx0w17 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_19_sva_mx0w18 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_21_sva_mx0w20 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_23_sva_mx0w22 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_25_sva_mx0w24 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_27_sva_mx0w26 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_29_sva_mx0w28 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_30_sva_mx0w29 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_31_sva_mx0w30 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_306_itm : STD_LOGIC;
  SIGNAL mux_452_itm : STD_LOGIC;
  SIGNAL mux_532_itm : STD_LOGIC;
  SIGNAL mux_411_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_265 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_289 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL and_dcpl_300 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_303 : STD_LOGIC;
  SIGNAL and_dcpl_308 : STD_LOGIC;
  SIGNAL and_dcpl_313 : STD_LOGIC;
  SIGNAL and_dcpl_316 : STD_LOGIC;
  SIGNAL and_dcpl_320 : STD_LOGIC;
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_351 : STD_LOGIC;
  SIGNAL and_dcpl_356 : STD_LOGIC;
  SIGNAL and_dcpl_363 : STD_LOGIC;
  SIGNAL and_dcpl_368 : STD_LOGIC;
  SIGNAL and_dcpl_374 : STD_LOGIC;
  SIGNAL and_dcpl_377 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL and_dcpl_387 : STD_LOGIC;
  SIGNAL and_dcpl_392 : STD_LOGIC;
  SIGNAL and_dcpl_423 : STD_LOGIC;
  SIGNAL and_dcpl_429 : STD_LOGIC;
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_433 : STD_LOGIC;
  SIGNAL and_dcpl_436 : STD_LOGIC;
  SIGNAL and_dcpl_438 : STD_LOGIC;
  SIGNAL and_dcpl_441 : STD_LOGIC;
  SIGNAL and_dcpl_444 : STD_LOGIC;
  SIGNAL and_dcpl_446 : STD_LOGIC;
  SIGNAL and_dcpl_449 : STD_LOGIC;
  SIGNAL and_dcpl_451 : STD_LOGIC;
  SIGNAL and_dcpl_454 : STD_LOGIC;
  SIGNAL and_dcpl_455 : STD_LOGIC;
  SIGNAL and_dcpl_458 : STD_LOGIC;
  SIGNAL and_dcpl_459 : STD_LOGIC;
  SIGNAL and_dcpl_461 : STD_LOGIC;
  SIGNAL and_dcpl_463 : STD_LOGIC;
  SIGNAL and_dcpl_467 : STD_LOGIC;
  SIGNAL and_dcpl_468 : STD_LOGIC;
  SIGNAL and_dcpl_470 : STD_LOGIC;
  SIGNAL and_dcpl_472 : STD_LOGIC;
  SIGNAL and_dcpl_473 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL and_dcpl_476 : STD_LOGIC;
  SIGNAL and_dcpl_478 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL and_dcpl_481 : STD_LOGIC;
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL and_dcpl_547 : STD_LOGIC;
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_550 : STD_LOGIC;
  SIGNAL and_dcpl_568 : STD_LOGIC;
  SIGNAL and_dcpl_574 : STD_LOGIC;
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_635 : STD_LOGIC;
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_646 : STD_LOGIC;
  SIGNAL and_dcpl_653 : STD_LOGIC;
  SIGNAL and_dcpl_658 : STD_LOGIC;
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_19 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_752 : STD_LOGIC;
  SIGNAL and_dcpl_757 : STD_LOGIC;
  SIGNAL and_dcpl_761 : STD_LOGIC;
  SIGNAL and_dcpl_766 : STD_LOGIC;
  SIGNAL and_dcpl_771 : STD_LOGIC;
  SIGNAL and_dcpl_775 : STD_LOGIC;
  SIGNAL and_dcpl_777 : STD_LOGIC;
  SIGNAL and_dcpl_780 : STD_LOGIC;
  SIGNAL and_dcpl_782 : STD_LOGIC;
  SIGNAL and_dcpl_785 : STD_LOGIC;
  SIGNAL and_dcpl_787 : STD_LOGIC;
  SIGNAL z_out_20 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_21 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_dcpl_804 : STD_LOGIC;
  SIGNAL and_dcpl_817 : STD_LOGIC;
  SIGNAL z_out_22 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_820 : STD_LOGIC;
  SIGNAL and_dcpl_825 : STD_LOGIC;
  SIGNAL and_dcpl_830 : STD_LOGIC;
  SIGNAL z_out_23 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_839 : STD_LOGIC;
  SIGNAL and_dcpl_844 : STD_LOGIC;
  SIGNAL and_dcpl_850 : STD_LOGIC;
  SIGNAL and_dcpl_853 : STD_LOGIC;
  SIGNAL and_dcpl_857 : STD_LOGIC;
  SIGNAL and_dcpl_860 : STD_LOGIC;
  SIGNAL and_dcpl_867 : STD_LOGIC;
  SIGNAL and_dcpl_871 : STD_LOGIC;
  SIGNAL and_dcpl_873 : STD_LOGIC;
  SIGNAL and_dcpl_875 : STD_LOGIC;
  SIGNAL and_dcpl_877 : STD_LOGIC;
  SIGNAL and_dcpl_879 : STD_LOGIC;
  SIGNAL z_out_24 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_k_14_5_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c0 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva_mx0c2 : STD_LOGIC;
  SIGNAL COMP_LOOP_or_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_2_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_4_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_3_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_6_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_37_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_12_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_13_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_38_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_36_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_23_cse : STD_LOGIC;
  SIGNAL nor_175_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_42_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_cse : STD_LOGIC;
  SIGNAL and_634_cse : STD_LOGIC;
  SIGNAL and_606_cse : STD_LOGIC;
  SIGNAL nor_179_cse : STD_LOGIC;
  SIGNAL or_tmp_510 : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt : STD_LOGIC_VECTOR (12
      DOWNTO 0);
  SIGNAL or_tmp_517 : STD_LOGIC;
  SIGNAL mux_tmp_957 : STD_LOGIC;
  SIGNAL not_tmp_446 : STD_LOGIC;
  SIGNAL or_tmp_523 : STD_LOGIC;
  SIGNAL or_tmp_524 : STD_LOGIC;
  SIGNAL mux_tmp_974 : STD_LOGIC;
  SIGNAL nand_tmp_21 : STD_LOGIC;
  SIGNAL mux_tmp_975 : STD_LOGIC;
  SIGNAL or_tmp_537 : STD_LOGIC;
  SIGNAL mux_tmp_976 : STD_LOGIC;
  SIGNAL mux_tmp_978 : STD_LOGIC;
  SIGNAL mux_tmp_979 : STD_LOGIC;
  SIGNAL mux_tmp_980 : STD_LOGIC;
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL mux_tmp_990 : STD_LOGIC;
  SIGNAL or_tmp_549 : STD_LOGIC;
  SIGNAL mux_tmp_993 : STD_LOGIC;
  SIGNAL mux_tmp_999 : STD_LOGIC;
  SIGNAL or_tmp_556 : STD_LOGIC;
  SIGNAL or_tmp_558 : STD_LOGIC;
  SIGNAL and_tmp_4 : STD_LOGIC;
  SIGNAL or_tmp_560 : STD_LOGIC;
  SIGNAL or_tmp_562 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_12_9 : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_11_psp_sva_12 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_11_psp_sva_11 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_11_psp_sva_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_885_ssc : STD_LOGIC;
  SIGNAL or_714_cse : STD_LOGIC;
  SIGNAL and_237_cse_1 : STD_LOGIC;
  SIGNAL or_717_cse : STD_LOGIC;
  SIGNAL and_257_cse : STD_LOGIC;
  SIGNAL or_743_cse : STD_LOGIC;
  SIGNAL and_973_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_or_51_itm : STD_LOGIC;
  SIGNAL and_767_itm : STD_LOGIC;
  SIGNAL and_771_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_46_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_61_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_nor_17_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL and_937_cse : STD_LOGIC;
  SIGNAL and_943_cse : STD_LOGIC;
  SIGNAL z_out_5_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_7_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out_8_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out_9_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_12_14 : STD_LOGIC;
  SIGNAL z_out_13_18_14 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL or_356_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL or_410_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL or_408_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL mux_455_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL nor_121_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_nor_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL mux_488_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL mux_486_nl : STD_LOGIC;
  SIGNAL mux_485_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_57_nl : STD_LOGIC;
  SIGNAL mux_495_nl : STD_LOGIC;
  SIGNAL nor_119_nl : STD_LOGIC;
  SIGNAL mux_494_nl : STD_LOGIC;
  SIGNAL nor_120_nl : STD_LOGIC;
  SIGNAL and_254_nl : STD_LOGIC;
  SIGNAL and_161_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_111_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL or_432_nl : STD_LOGIC;
  SIGNAL or_431_nl : STD_LOGIC;
  SIGNAL or_429_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL nor_115_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL nor_117_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL not_1027_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_128_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL or_446_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL or_444_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL or_441_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL or_440_nl : STD_LOGIC;
  SIGNAL or_439_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL or_438_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL and_260_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL and_255_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_951_nl : STD_LOGIC;
  SIGNAL mux_950_nl : STD_LOGIC;
  SIGNAL mux_949_nl : STD_LOGIC;
  SIGNAL mux_948_nl : STD_LOGIC;
  SIGNAL mux_947_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL or_482_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_17_twiddle_f_mul_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL mux_581_nl : STD_LOGIC;
  SIGNAL mux_576_nl : STD_LOGIC;
  SIGNAL or_488_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_twiddle_f_mul_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_954_nl : STD_LOGIC;
  SIGNAL mux_953_nl : STD_LOGIC;
  SIGNAL mux_952_nl : STD_LOGIC;
  SIGNAL nor_223_nl : STD_LOGIC;
  SIGNAL mux_956_nl : STD_LOGIC;
  SIGNAL mux_955_nl : STD_LOGIC;
  SIGNAL or_769_nl : STD_LOGIC;
  SIGNAL or_770_nl : STD_LOGIC;
  SIGNAL or_771_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL and_235_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL mux_657_nl : STD_LOGIC;
  SIGNAL mux_656_nl : STD_LOGIC;
  SIGNAL mux_655_nl : STD_LOGIC;
  SIGNAL mux_654_nl : STD_LOGIC;
  SIGNAL mux_653_nl : STD_LOGIC;
  SIGNAL or_518_nl : STD_LOGIC;
  SIGNAL or_517_nl : STD_LOGIC;
  SIGNAL mux_652_nl : STD_LOGIC;
  SIGNAL mux_651_nl : STD_LOGIC;
  SIGNAL mux_650_nl : STD_LOGIC;
  SIGNAL mux_649_nl : STD_LOGIC;
  SIGNAL mux_647_nl : STD_LOGIC;
  SIGNAL mux_646_nl : STD_LOGIC;
  SIGNAL mux_645_nl : STD_LOGIC;
  SIGNAL mux_644_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL mux_640_nl : STD_LOGIC;
  SIGNAL mux_639_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL mux_634_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL mux_623_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL or_513_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_12_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_197_nl : STD_LOGIC;
  SIGNAL mux_666_nl : STD_LOGIC;
  SIGNAL mux_665_nl : STD_LOGIC;
  SIGNAL mux_664_nl : STD_LOGIC;
  SIGNAL mux_663_nl : STD_LOGIC;
  SIGNAL or_526_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL or_127_nl : STD_LOGIC;
  SIGNAL mux_661_nl : STD_LOGIC;
  SIGNAL mux_660_nl : STD_LOGIC;
  SIGNAL mux_659_nl : STD_LOGIC;
  SIGNAL or_522_nl : STD_LOGIC;
  SIGNAL mux_658_nl : STD_LOGIC;
  SIGNAL or_519_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nand_nl : STD_LOGIC;
  SIGNAL mux_973_nl : STD_LOGIC;
  SIGNAL mux_972_nl : STD_LOGIC;
  SIGNAL mux_971_nl : STD_LOGIC;
  SIGNAL mux_970_nl : STD_LOGIC;
  SIGNAL mux_969_nl : STD_LOGIC;
  SIGNAL nand_49_nl : STD_LOGIC;
  SIGNAL mux_968_nl : STD_LOGIC;
  SIGNAL or_740_nl : STD_LOGIC;
  SIGNAL mux_967_nl : STD_LOGIC;
  SIGNAL or_739_nl : STD_LOGIC;
  SIGNAL or_768_nl : STD_LOGIC;
  SIGNAL or_737_nl : STD_LOGIC;
  SIGNAL mux_966_nl : STD_LOGIC;
  SIGNAL mux_965_nl : STD_LOGIC;
  SIGNAL or_736_nl : STD_LOGIC;
  SIGNAL or_734_nl : STD_LOGIC;
  SIGNAL or_732_nl : STD_LOGIC;
  SIGNAL or_730_nl : STD_LOGIC;
  SIGNAL mux_964_nl : STD_LOGIC;
  SIGNAL mux_963_nl : STD_LOGIC;
  SIGNAL mux_962_nl : STD_LOGIC;
  SIGNAL mux_961_nl : STD_LOGIC;
  SIGNAL mux_960_nl : STD_LOGIC;
  SIGNAL mux_959_nl : STD_LOGIC;
  SIGNAL or_727_nl : STD_LOGIC;
  SIGNAL nand_47_nl : STD_LOGIC;
  SIGNAL mux_958_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL and_970_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_35_nl : STD_LOGIC;
  SIGNAL mux_746_nl : STD_LOGIC;
  SIGNAL mux_745_nl : STD_LOGIC;
  SIGNAL mux_744_nl : STD_LOGIC;
  SIGNAL mux_743_nl : STD_LOGIC;
  SIGNAL mux_742_nl : STD_LOGIC;
  SIGNAL mux_741_nl : STD_LOGIC;
  SIGNAL or_561_nl : STD_LOGIC;
  SIGNAL mux_740_nl : STD_LOGIC;
  SIGNAL mux_739_nl : STD_LOGIC;
  SIGNAL mux_738_nl : STD_LOGIC;
  SIGNAL mux_737_nl : STD_LOGIC;
  SIGNAL nor_87_nl : STD_LOGIC;
  SIGNAL mux_736_nl : STD_LOGIC;
  SIGNAL mux_734_nl : STD_LOGIC;
  SIGNAL mux_733_nl : STD_LOGIC;
  SIGNAL mux_732_nl : STD_LOGIC;
  SIGNAL mux_731_nl : STD_LOGIC;
  SIGNAL mux_730_nl : STD_LOGIC;
  SIGNAL mux_729_nl : STD_LOGIC;
  SIGNAL mux_728_nl : STD_LOGIC;
  SIGNAL mux_727_nl : STD_LOGIC;
  SIGNAL mux_726_nl : STD_LOGIC;
  SIGNAL mux_725_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC;
  SIGNAL mux_720_nl : STD_LOGIC;
  SIGNAL mux_717_nl : STD_LOGIC;
  SIGNAL mux_788_nl : STD_LOGIC;
  SIGNAL and_205_nl : STD_LOGIC;
  SIGNAL mux_791_nl : STD_LOGIC;
  SIGNAL mux_787_nl : STD_LOGIC;
  SIGNAL mux_786_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_2_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_not_nl : STD_LOGIC;
  SIGNAL mux_876_nl : STD_LOGIC;
  SIGNAL mux_875_nl : STD_LOGIC;
  SIGNAL mux_874_nl : STD_LOGIC;
  SIGNAL mux_873_nl : STD_LOGIC;
  SIGNAL mux_872_nl : STD_LOGIC;
  SIGNAL mux_879_nl : STD_LOGIC;
  SIGNAL mux_878_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL or_637_nl : STD_LOGIC;
  SIGNAL or_635_nl : STD_LOGIC;
  SIGNAL mux_809_nl : STD_LOGIC;
  SIGNAL nor_94_nl : STD_LOGIC;
  SIGNAL mux_912_nl : STD_LOGIC;
  SIGNAL or_664_nl : STD_LOGIC;
  SIGNAL mux_911_nl : STD_LOGIC;
  SIGNAL or_663_nl : STD_LOGIC;
  SIGNAL or_662_nl : STD_LOGIC;
  SIGNAL and_219_nl : STD_LOGIC;
  SIGNAL mux_987_nl : STD_LOGIC;
  SIGNAL mux_986_nl : STD_LOGIC;
  SIGNAL mux_985_nl : STD_LOGIC;
  SIGNAL mux_984_nl : STD_LOGIC;
  SIGNAL mux_983_nl : STD_LOGIC;
  SIGNAL or_749_nl : STD_LOGIC;
  SIGNAL or_748_nl : STD_LOGIC;
  SIGNAL or_746_nl : STD_LOGIC;
  SIGNAL mux_982_nl : STD_LOGIC;
  SIGNAL mux_981_nl : STD_LOGIC;
  SIGNAL or_745_nl : STD_LOGIC;
  SIGNAL mux_998_nl : STD_LOGIC;
  SIGNAL mux_997_nl : STD_LOGIC;
  SIGNAL mux_996_nl : STD_LOGIC;
  SIGNAL mux_995_nl : STD_LOGIC;
  SIGNAL mux_994_nl : STD_LOGIC;
  SIGNAL or_760_nl : STD_LOGIC;
  SIGNAL or_757_nl : STD_LOGIC;
  SIGNAL or_756_nl : STD_LOGIC;
  SIGNAL mux_992_nl : STD_LOGIC;
  SIGNAL mux_991_nl : STD_LOGIC;
  SIGNAL or_755_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_66_nl : STD_LOGIC;
  SIGNAL mux_886_nl : STD_LOGIC;
  SIGNAL mux_571_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL mux_1008_nl : STD_LOGIC;
  SIGNAL mux_1007_nl : STD_LOGIC;
  SIGNAL mux_1006_nl : STD_LOGIC;
  SIGNAL mux_1005_nl : STD_LOGIC;
  SIGNAL mux_1004_nl : STD_LOGIC;
  SIGNAL or_766_nl : STD_LOGIC;
  SIGNAL mux_1003_nl : STD_LOGIC;
  SIGNAL or_764_nl : STD_LOGIC;
  SIGNAL mux_1002_nl : STD_LOGIC;
  SIGNAL mux_1001_nl : STD_LOGIC;
  SIGNAL mux_1000_nl : STD_LOGIC;
  SIGNAL mux_907_nl : STD_LOGIC;
  SIGNAL mux_906_nl : STD_LOGIC;
  SIGNAL mux_905_nl : STD_LOGIC;
  SIGNAL mux_904_nl : STD_LOGIC;
  SIGNAL and_217_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL or_306_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL or_329_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL mux_410_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL or_373_nl : STD_LOGIC;
  SIGNAL or_372_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL or_404_nl : STD_LOGIC;
  SIGNAL or_403_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL mux_515_nl : STD_LOGIC;
  SIGNAL or_451_nl : STD_LOGIC;
  SIGNAL or_452_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL mux_573_nl : STD_LOGIC;
  SIGNAL mux_578_nl : STD_LOGIC;
  SIGNAL mux_577_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL or_489_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL or_516_nl : STD_LOGIC;
  SIGNAL mux_642_nl : STD_LOGIC;
  SIGNAL mux_699_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL or_539_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL mux_696_nl : STD_LOGIC;
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL mux_747_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL nor_106_nl : STD_LOGIC;
  SIGNAL mux_752_nl : STD_LOGIC;
  SIGNAL mux_750_nl : STD_LOGIC;
  SIGNAL mux_763_nl : STD_LOGIC;
  SIGNAL mux_762_nl : STD_LOGIC;
  SIGNAL mux_761_nl : STD_LOGIC;
  SIGNAL mux_760_nl : STD_LOGIC;
  SIGNAL mux_758_nl : STD_LOGIC;
  SIGNAL mux_757_nl : STD_LOGIC;
  SIGNAL mux_756_nl : STD_LOGIC;
  SIGNAL mux_794_nl : STD_LOGIC;
  SIGNAL mux_792_nl : STD_LOGIC;
  SIGNAL or_599_nl : STD_LOGIC;
  SIGNAL mux_900_nl : STD_LOGIC;
  SIGNAL mux_824_nl : STD_LOGIC;
  SIGNAL mux_823_nl : STD_LOGIC;
  SIGNAL mux_822_nl : STD_LOGIC;
  SIGNAL mux_821_nl : STD_LOGIC;
  SIGNAL mux_820_nl : STD_LOGIC;
  SIGNAL mux_819_nl : STD_LOGIC;
  SIGNAL mux_818_nl : STD_LOGIC;
  SIGNAL mux_817_nl : STD_LOGIC;
  SIGNAL mux_816_nl : STD_LOGIC;
  SIGNAL or_608_nl : STD_LOGIC;
  SIGNAL mux_815_nl : STD_LOGIC;
  SIGNAL or_606_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_10_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_8_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC;
  SIGNAL and_116_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL and_114_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL and_110_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_26_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL or_349_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC;
  SIGNAL and_115_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL or_694_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_7_nl : STD_LOGIC;
  SIGNAL and_117_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_9_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL or_724_nl : STD_LOGIC;
  SIGNAL or_741_nl : STD_LOGIC;
  SIGNAL mux_977_nl : STD_LOGIC;
  SIGNAL or_744_nl : STD_LOGIC;
  SIGNAL mux_989_nl : STD_LOGIC;
  SIGNAL or_752_nl : STD_LOGIC;
  SIGNAL mux_988_nl : STD_LOGIC;
  SIGNAL nand_51_nl : STD_LOGIC;
  SIGNAL or_751_nl : STD_LOGIC;
  SIGNAL or_759_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_11_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_12_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_40_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_or_41_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_42_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL COMP_LOOP_twiddle_f_mux_13_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_296_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_977_nl : STD_LOGIC;
  SIGNAL and_978_nl : STD_LOGIC;
  SIGNAL and_979_nl : STD_LOGIC;
  SIGNAL and_980_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl : STD_LOGIC;
  SIGNAL and_981_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_14_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_67_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_15_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_19_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_20_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_5_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_983_nl : STD_LOGIC;
  SIGNAL and_984_nl : STD_LOGIC;
  SIGNAL and_985_nl : STD_LOGIC;
  SIGNAL and_986_nl : STD_LOGIC;
  SIGNAL and_987_nl : STD_LOGIC;
  SIGNAL and_988_nl : STD_LOGIC;
  SIGNAL and_989_nl : STD_LOGIC;
  SIGNAL and_990_nl : STD_LOGIC;
  SIGNAL and_991_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_5_nl : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL VEC_LOOP_or_68_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL STAGE_LOOP_mux_4_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_47_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_992_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_16_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_6_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_69_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_48_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_993_nl : STD_LOGIC;
  SIGNAL and_994_nl : STD_LOGIC;
  SIGNAL and_995_nl : STD_LOGIC;
  SIGNAL and_996_nl : STD_LOGIC;
  SIGNAL and_997_nl : STD_LOGIC;
  SIGNAL and_998_nl : STD_LOGIC;
  SIGNAL and_999_nl : STD_LOGIC;
  SIGNAL and_1000_nl : STD_LOGIC;
  SIGNAL and_1001_nl : STD_LOGIC;
  SIGNAL and_1002_nl : STD_LOGIC;
  SIGNAL and_1003_nl : STD_LOGIC;
  SIGNAL and_1004_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_70_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_nor_27_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_49_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_1005_nl : STD_LOGIC;
  SIGNAL and_1006_nl : STD_LOGIC;
  SIGNAL and_1007_nl : STD_LOGIC;
  SIGNAL and_1008_nl : STD_LOGIC;
  SIGNAL and_1009_nl : STD_LOGIC;
  SIGNAL and_1010_nl : STD_LOGIC;
  SIGNAL and_1011_nl : STD_LOGIC;
  SIGNAL and_1012_nl : STD_LOGIC;
  SIGNAL and_1013_nl : STD_LOGIC;
  SIGNAL and_1014_nl : STD_LOGIC;
  SIGNAL and_1015_nl : STD_LOGIC;
  SIGNAL and_1016_nl : STD_LOGIC;
  SIGNAL and_1017_nl : STD_LOGIC;
  SIGNAL and_1018_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_71_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_50_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_1019_nl : STD_LOGIC;
  SIGNAL and_1020_nl : STD_LOGIC;
  SIGNAL and_1021_nl : STD_LOGIC;
  SIGNAL and_1022_nl : STD_LOGIC;
  SIGNAL acc_9_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_21_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_51_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_or_72_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_73_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_74_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_24_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_52_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_or_75_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_76_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_22_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_23_nl : STD_LOGIC;
  SIGNAL acc_10_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_or_77_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_8_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_11_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_24_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_53_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_or_78_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_and_2_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_18_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_and_3_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_19_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_54_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL acc_13_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_25_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_20_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_or_79_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_28_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_21_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_or_80_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_26_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_28_nl : STD_LOGIC;
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

  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (12 DOWNTO 0);

  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (14 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (11 DOWNTO 0);

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

  FUNCTION MUX1HOT_s_1_29_2(input_28 : STD_LOGIC;
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
  sel : STD_LOGIC_VECTOR(28 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_30_2(input_29 : STD_LOGIC;
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
  sel : STD_LOGIC_VECTOR(29 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_31_2(input_30 : STD_LOGIC;
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
  sel : STD_LOGIC_VECTOR(30 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_10_7_2(input_6 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_4_2(input_3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_14_26_2(input_25 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(25 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_9_2(input_8 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
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

  FUNCTION MUX1HOT_v_3_5_2(input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_4_14_2(input_13 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(13 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
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

  FUNCTION MUX1HOT_v_5_24_2(input_23 : STD_LOGIC_VECTOR(4 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(23 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_9_2(input_8 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_9_34_2(input_33 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_32 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(33 DOWNTO 0))
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

  FUNCTION MUX_v_18_2_2(input_0 : STD_LOGIC_VECTOR(17 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(17 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(17 DOWNTO 0);

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
      ccs_ccore_start_rsc_dat => nor_179_cse,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= z_out_21;
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => nor_179_cse,
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
  COMP_LOOP_1_mult_cmp_y_rsc_dat <= MUX_v_32_2_2(COMP_LOOP_twiddle_f_1_sva, COMP_LOOP_twiddle_f_17_sva,
      and_dcpl_170);
  COMP_LOOP_1_mult_cmp_y_rsc_dat_1 <= MUX_v_32_2_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_17_sva, and_dcpl_170);
  COMP_LOOP_1_mult_cmp_p_rsc_dat <= p_sva;
  COMP_LOOP_1_mult_cmp_return_rsc_z <= COMP_LOOP_1_mult_cmp_return_rsc_z_1;
  COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat <= (NOT (MUX_s_1_2_2((MUX_s_1_2_2(mux_319_cse,
      (MUX_s_1_2_2(mux_551_cse, mux_318_cse, fsm_output(5))), fsm_output(3))), mux_320_cse,
      fsm_output(1)))) AND (fsm_output(0));

  COMP_LOOP_3_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 13
      )
    PORT MAP(
      a => COMP_LOOP_3_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_3_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_3_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_3_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_3_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva;
  COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 <= COMP_LOOP_3_twiddle_f_lshift_rg_z;

  COMP_LOOP_2_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 14
      )
    PORT MAP(
      a => COMP_LOOP_2_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_2_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_2_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_2_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_2_twiddle_f_lshift_rg_s <= COMP_LOOP_1_twiddle_f_acc_cse_sva;
  COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1 <= COMP_LOOP_2_twiddle_f_lshift_rg_z;

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
  COMP_LOOP_17_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_14,
      CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("000000010")));
  z_out <= COMP_LOOP_17_twiddle_f_lshift_rg_z;

  COMP_LOOP_1_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 12
      )
    PORT MAP(
      a => COMP_LOOP_1_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_1_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_1_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_1_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(z_out_14, COMP_LOOP_1_twiddle_f_acc_cse_sva,
      (nor_175_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("010111")))
      OR (nor_175_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("100001"))));
  z_out_1 <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

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
      vec_rsci_oswt_1_pff => and_14_rmff
    );
  vec_rsci_da_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_wea_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core <= STD_LOGIC_VECTOR'(
      "00000000000000000000000000000000") & (MUX1HOT_v_32_3_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_17_sva, VEC_LOOP_mult_vec_1_sva, STD_LOGIC_VECTOR'( ((NOT
      mux_411_itm) AND (fsm_output(0))) & (NOT((MUX_s_1_2_2((MUX_s_1_2_2(or_tmp_210,
      ((fsm_output(5)) OR (MUX_s_1_2_2(((NOT (fsm_output(2))) OR (fsm_output(8))
      OR (fsm_output(4))), mux_tmp_412, fsm_output(6)))), fsm_output(3))), (MUX_s_1_2_2(((fsm_output(5))
      OR (MUX_s_1_2_2(((NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(4)))),
      ((fsm_output(2)) OR (MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(8)))),
      fsm_output(6)))), or_tmp_210, fsm_output(3))), fsm_output(1))) OR (fsm_output(7))
      OR (fsm_output(0)))) & (NOT((MUX_s_1_2_2((MUX_s_1_2_2(mux_789_cse, (MUX_s_1_2_2(mux_428_cse,
      mux_tmp_425, fsm_output(2))), fsm_output(3))), mux_427_cse, fsm_output(1)))
      OR (fsm_output(0)))))));
  vec_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct <= STD_LOGIC_VECTOR'(
      '0' & (NOT mux_452_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_14_rmff & and_14_rmff);
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( '0' & (NOT mux_452_itm));
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff <= NOT mux_306_itm;

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
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro <= NOT mux_411_itm;
  inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 <= NOT mux_532_itm;

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
      twiddle_rsci_oswt_1_pff => and_128_rmff,
      twiddle_rsci_oswt_pff => and_123_rmff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_128_rmff & and_123_rmff);

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
      twiddle_h_rsci_oswt_1_pff => and_128_rmff,
      twiddle_h_rsci_oswt_pff => and_123_rmff
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_qa_d_mxwt <= inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_qa_d_mxwt;
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      <= STD_LOGIC_VECTOR'( and_128_rmff & and_123_rmff);

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
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0 <= NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_24(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_20(11));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 <= NOT (z_out_24(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 <= NOT (z_out_20(10));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 <= NOT (z_out_24(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 <= NOT z_out_12_14;
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 <= NOT (z_out_20(11));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 <= NOT (z_out_24(12));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 <= NOT (z_out_11(14));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 <= NOT (z_out_22(9));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0 <= VEC_LOOP_j_10_14_0_sva_1(14);
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 <= NOT (z_out_13_18_14(0));
  inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  nand_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_276));
  mux_301_nl <= MUX_s_1_2_2(mux_tmp_284, or_tmp_134, fsm_output(5));
  mux_302_nl <= MUX_s_1_2_2(nand_nl, mux_301_nl, fsm_output(6));
  mux_299_nl <= MUX_s_1_2_2(or_tmp_134, mux_tmp_284, fsm_output(5));
  or_307_nl <= (fsm_output(5)) OR mux_tmp_283;
  mux_300_nl <= MUX_s_1_2_2(mux_299_nl, or_307_nl, fsm_output(6));
  mux_303_nl <= MUX_s_1_2_2(mux_302_nl, mux_300_nl, fsm_output(1));
  mux_298_nl <= MUX_s_1_2_2(mux_tmp_293, mux_tmp_281, fsm_output(1));
  mux_304_nl <= MUX_s_1_2_2(mux_303_nl, mux_298_nl, fsm_output(4));
  mux_297_nl <= MUX_s_1_2_2(mux_tmp_282, mux_tmp_294, fsm_output(4));
  mux_305_nl <= MUX_s_1_2_2(mux_304_nl, mux_297_nl, fsm_output(3));
  mux_291_nl <= MUX_s_1_2_2(mux_tmp_278, mux_tmp_288, fsm_output(1));
  mux_295_nl <= MUX_s_1_2_2(mux_tmp_294, mux_291_nl, fsm_output(4));
  mux_289_nl <= MUX_s_1_2_2(mux_tmp_288, mux_tmp_286, fsm_output(1));
  mux_290_nl <= MUX_s_1_2_2(mux_289_nl, mux_tmp_282, fsm_output(4));
  mux_296_nl <= MUX_s_1_2_2(mux_295_nl, mux_290_nl, fsm_output(3));
  mux_306_itm <= MUX_s_1_2_2(mux_305_nl, mux_296_nl, fsm_output(2));
  mux_318_cse <= MUX_s_1_2_2(mux_tmp_314, mux_tmp_308, fsm_output(2));
  mux_319_cse <= MUX_s_1_2_2(mux_318_cse, mux_tmp_312, fsm_output(5));
  mux_315_nl <= MUX_s_1_2_2(mux_tmp_310, mux_tmp_314, fsm_output(2));
  mux_316_cse <= MUX_s_1_2_2(mux_548_cse, mux_315_nl, fsm_output(5));
  mux_320_cse <= MUX_s_1_2_2(mux_549_cse, mux_319_cse, fsm_output(3));
  mux_317_cse <= MUX_s_1_2_2(mux_316_cse, mux_549_cse, fsm_output(3));
  mux_321_nl <= MUX_s_1_2_2(mux_320_cse, mux_317_cse, fsm_output(1));
  and_14_rmff <= (NOT mux_321_nl) AND (fsm_output(0));
  mux_366_cse <= MUX_s_1_2_2(or_445_cse, or_tmp_146, fsm_output(3));
  nand_33_nl <= NOT((fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(8)))
      AND (fsm_output(6)));
  mux_364_cse <= MUX_s_1_2_2(nand_33_nl, mux_tmp_363, fsm_output(5));
  mux_367_cse <= MUX_s_1_2_2(mux_tmp_363, mux_366_cse, fsm_output(5));
  or_356_nl <= (NOT (fsm_output(3))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_375_cse <= MUX_s_1_2_2(or_tmp_164, or_356_nl, fsm_output(6));
  nand_4_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_343));
  nand_3_cse <= NOT((fsm_output(6)) AND (NOT mux_tmp_339));
  or_358_cse <= (fsm_output(6)) OR mux_tmp_343;
  mux_372_cse <= MUX_s_1_2_2(mux_tmp_342, or_tmp_161, fsm_output(4));
  mux_377_cse <= MUX_s_1_2_2(or_358_cse, mux_375_cse, fsm_output(4));
  mux_373_cse <= MUX_s_1_2_2(or_tmp_161, nand_3_cse, fsm_output(4));
  mux_378_cse <= MUX_s_1_2_2(nand_4_cse, mux_tmp_342, fsm_output(4));
  mux_428_cse <= MUX_s_1_2_2(or_tmp_225, mux_489_cse, fsm_output(4));
  mux_424_nl <= MUX_s_1_2_2(mux_tmp_351, or_420_cse, fsm_output(4));
  mux_426_cse <= MUX_s_1_2_2(mux_tmp_425, mux_424_nl, fsm_output(2));
  mux_427_cse <= MUX_s_1_2_2(mux_426_cse, mux_789_cse, fsm_output(3));
  mux_448_nl <= MUX_s_1_2_2(mux_375_cse, mux_tmp_342, fsm_output(4));
  mux_449_nl <= MUX_s_1_2_2(mux_tmp_434, mux_448_nl, fsm_output(5));
  mux_450_nl <= MUX_s_1_2_2(mux_449_nl, mux_tmp_441, fsm_output(2));
  mux_451_nl <= MUX_s_1_2_2(mux_450_nl, mux_tmp_446, fsm_output(1));
  mux_437_nl <= MUX_s_1_2_2(mux_372_cse, mux_tmp_434, fsm_output(5));
  mux_442_nl <= MUX_s_1_2_2(mux_tmp_441, mux_437_nl, fsm_output(2));
  mux_447_nl <= MUX_s_1_2_2(mux_tmp_446, mux_442_nl, fsm_output(1));
  mux_452_itm <= MUX_s_1_2_2(mux_451_nl, mux_447_nl, fsm_output(0));
  mux_470_nl <= MUX_s_1_2_2(mux_tmp_460, or_tmp_237, fsm_output(4));
  mux_471_nl <= MUX_s_1_2_2(mux_tmp_459, mux_470_nl, fsm_output(3));
  or_410_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_151;
  mux_467_nl <= MUX_s_1_2_2(or_410_nl, or_tmp_238, fsm_output(7));
  mux_468_nl <= MUX_s_1_2_2(mux_467_nl, mux_tmp_453, fsm_output(4));
  or_408_nl <= COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm OR (fsm_output(5)) OR
      (fsm_output(6)) OR (fsm_output(8));
  mux_465_nl <= MUX_s_1_2_2(or_408_nl, or_tmp_236, fsm_output(7));
  mux_466_nl <= MUX_s_1_2_2(mux_465_nl, mux_tmp_460, fsm_output(4));
  mux_469_nl <= MUX_s_1_2_2(mux_468_nl, mux_466_nl, fsm_output(3));
  mux_472_nl <= MUX_s_1_2_2(mux_471_nl, mux_469_nl, fsm_output(2));
  or_407_nl <= (fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(8));
  mux_461_nl <= MUX_s_1_2_2(or_407_nl, or_tmp_236, fsm_output(7));
  mux_462_nl <= MUX_s_1_2_2(mux_461_nl, mux_tmp_460, fsm_output(4));
  mux_463_nl <= MUX_s_1_2_2(mux_462_nl, mux_tmp_459, fsm_output(3));
  mux_455_nl <= MUX_s_1_2_2(or_tmp_238, or_tmp_236, fsm_output(7));
  mux_457_nl <= MUX_s_1_2_2(or_tmp_241, mux_455_nl, fsm_output(4));
  mux_454_nl <= MUX_s_1_2_2(or_tmp_237, mux_tmp_453, fsm_output(4));
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, mux_454_nl, fsm_output(3));
  mux_464_nl <= MUX_s_1_2_2(mux_463_nl, mux_458_nl, fsm_output(2));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_464_nl, fsm_output(1));
  and_123_rmff <= (NOT mux_473_nl) AND (fsm_output(0));
  nor_121_nl <= NOT((fsm_output(4)) OR (fsm_output(6)));
  mux_15_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(4));
  mux_475_nl <= MUX_s_1_2_2(nor_121_nl, mux_15_nl, VEC_LOOP_j_10_14_0_sva_1(14));
  and_128_rmff <= mux_475_nl AND and_dcpl_15 AND (NOT (fsm_output(5))) AND (NOT (fsm_output(3)))
      AND (NOT (fsm_output(2))) AND and_265_cse;
  mux_489_cse <= MUX_s_1_2_2(or_tmp_146, or_445_cse, fsm_output(5));
  COMP_LOOP_or_cse <= (and_dcpl_30 AND and_dcpl_43) OR (and_dcpl_38 AND and_dcpl_21)
      OR (and_dcpl_45 AND and_dcpl_25) OR (and_dcpl_81 AND and_dcpl_13);
  COMP_LOOP_or_2_cse <= (and_dcpl_38 AND and_dcpl_47) OR (and_dcpl_61 AND and_dcpl_47)
      OR (and_dcpl_75 AND and_dcpl_43) OR (and_dcpl_91 AND and_dcpl_43);
  COMP_LOOP_or_1_cse <= (and_dcpl_45 AND and_dcpl_13) OR and_dcpl_133 OR (and_dcpl_66
      AND and_dcpl_13) OR (and_dcpl_71 AND and_dcpl_36);
  COMP_LOOP_or_5_cse <= and_dcpl_132 OR (and_dcpl_78 AND and_dcpl_47) OR (and_dcpl_86
      AND and_dcpl_40) OR (and_dcpl_93 AND and_dcpl_47);
  COMP_LOOP_or_4_cse <= (and_dcpl_59 AND and_dcpl_43) OR (and_dcpl_68 AND and_dcpl_28)
      OR (and_dcpl_71 AND and_dcpl_40) OR (and_dcpl_96 AND and_dcpl_13);
  COMP_LOOP_or_3_cse <= (and_dcpl_61 AND and_dcpl_21) OR (and_dcpl_66 AND and_dcpl_25)
      OR (and_dcpl_83 AND and_dcpl_28);
  COMP_LOOP_or_7_cse <= (and_dcpl_78 AND and_dcpl_21) OR (and_dcpl_86 AND and_dcpl_36)
      OR (and_dcpl_93 AND and_dcpl_21);
  COMP_LOOP_or_6_cse <= (and_dcpl_49 AND and_dcpl_28) OR (and_dcpl_81 AND and_dcpl_25);
  COMP_LOOP_mux1h_nl <= MUX1HOT_v_2_9_2((z_out_2(3 DOWNTO 2)), (z_out_4(4 DOWNTO
      3)), (z_out_5_11_0(2 DOWNTO 1)), (z_out_7_12_0(3 DOWNTO 2)), (z_out_9_10_0(1
      DOWNTO 0)), (z_out_6(4 DOWNTO 3)), (z_out_3(4 DOWNTO 3)), (z_out_10(4 DOWNTO
      3)), (z_out_8_12_0(3 DOWNTO 2)), STD_LOGIC_VECTOR'( and_dcpl_125 & COMP_LOOP_or_cse
      & COMP_LOOP_or_2_cse & COMP_LOOP_or_1_cse & COMP_LOOP_or_6_cse & COMP_LOOP_or_5_cse
      & COMP_LOOP_or_4_cse & COMP_LOOP_or_3_cse & COMP_LOOP_or_7_cse));
  mux_490_nl <= MUX_s_1_2_2(mux_tmp_357, mux_489_cse, fsm_output(2));
  mux_491_nl <= MUX_s_1_2_2(mux_490_nl, mux_tmp_478, fsm_output(4));
  mux_487_nl <= MUX_s_1_2_2(or_tmp_254, mux_tmp_354, fsm_output(2));
  mux_488_nl <= MUX_s_1_2_2(mux_tmp_483, mux_487_nl, fsm_output(4));
  mux_492_nl <= MUX_s_1_2_2(mux_491_nl, mux_488_nl, fsm_output(3));
  mux_484_nl <= MUX_s_1_2_2(or_420_cse, mux_tmp_351, fsm_output(2));
  mux_485_nl <= MUX_s_1_2_2(mux_484_nl, mux_tmp_483, fsm_output(4));
  mux_479_nl <= MUX_s_1_2_2(mux_tmp_357, or_tmp_254, fsm_output(2));
  mux_480_nl <= MUX_s_1_2_2(mux_479_nl, mux_tmp_478, fsm_output(4));
  mux_486_nl <= MUX_s_1_2_2(mux_485_nl, mux_480_nl, fsm_output(3));
  mux_493_nl <= MUX_s_1_2_2(mux_492_nl, mux_486_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_nor_nl <= NOT(mux_493_nl OR (NOT (fsm_output(0))));
  COMP_LOOP_and_rmff <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_nl,
      COMP_LOOP_twiddle_f_nor_nl);
  COMP_LOOP_twiddle_f_mux1h_57_nl <= MUX1HOT_s_1_8_2((z_out_2(1)), (z_out_4(2)),
      (z_out_5_11_0(0)), (z_out_7_12_0(1)), (z_out_6(2)), (z_out_3(2)), (z_out_10(2)),
      (z_out_8_12_0(1)), STD_LOGIC_VECTOR'( and_dcpl_125 & COMP_LOOP_or_cse & COMP_LOOP_or_2_cse
      & COMP_LOOP_or_1_cse & COMP_LOOP_or_5_cse & COMP_LOOP_or_4_cse & COMP_LOOP_or_3_cse
      & COMP_LOOP_or_7_cse));
  nor_119_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR
      (NOT (fsm_output(6))) OR (fsm_output(7)));
  nor_120_nl <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)));
  and_254_nl <= (fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(7));
  mux_494_nl <= MUX_s_1_2_2(nor_120_nl, and_254_nl, fsm_output(2));
  mux_495_nl <= MUX_s_1_2_2(nor_119_nl, mux_494_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux1h_57_rmff <= COMP_LOOP_twiddle_f_mux1h_57_nl AND (NOT(mux_495_nl
      AND (NOT (fsm_output(8))) AND (NOT (fsm_output(5))) AND (fsm_output(0))));
  and_161_nl <= and_dcpl_17 AND and_dcpl_36;
  COMP_LOOP_twiddle_f_mux1h_87_rmff <= MUX1HOT_v_9_10_2(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0,
      (z_out_2(12 DOWNTO 4)), (z_out_4(13 DOWNTO 5)), (z_out_5_11_0(11 DOWNTO 3)),
      (z_out_7_12_0(12 DOWNTO 4)), (z_out_9_10_0(10 DOWNTO 2)), (z_out_6(13 DOWNTO
      5)), (z_out_3(13 DOWNTO 5)), (z_out_10(13 DOWNTO 5)), (z_out_8_12_0(12 DOWNTO
      4)), STD_LOGIC_VECTOR'( and_161_nl & and_dcpl_125 & COMP_LOOP_or_cse & COMP_LOOP_or_2_cse
      & COMP_LOOP_or_1_cse & COMP_LOOP_or_6_cse & COMP_LOOP_or_5_cse & COMP_LOOP_or_4_cse
      & COMP_LOOP_or_3_cse & COMP_LOOP_or_7_cse));
  COMP_LOOP_twiddle_f_mux1h_111_nl <= MUX1HOT_s_1_7_2((z_out_2(0)), (z_out_4(1)),
      (z_out_7_12_0(0)), (z_out_6(1)), (z_out_3(1)), (z_out_10(1)), (z_out_8_12_0(0)),
      STD_LOGIC_VECTOR'( and_dcpl_125 & COMP_LOOP_or_cse & COMP_LOOP_or_1_cse & COMP_LOOP_or_5_cse
      & COMP_LOOP_or_4_cse & COMP_LOOP_or_3_cse & COMP_LOOP_or_7_cse));
  or_432_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(4));
  or_431_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_498_nl <= MUX_s_1_2_2(or_432_nl, or_431_nl, fsm_output(6));
  or_429_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0100"));
  mux_499_nl <= MUX_s_1_2_2(mux_498_nl, or_429_nl, fsm_output(3));
  nor_114_nl <= NOT((fsm_output(2)) OR mux_499_nl);
  nor_115_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 3)/=STD_LOGIC_VECTOR'("00000")));
  nor_116_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1011")));
  nor_117_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1101")));
  mux_496_nl <= MUX_s_1_2_2(nor_116_nl, nor_117_nl, fsm_output(3));
  mux_497_nl <= MUX_s_1_2_2(nor_115_nl, mux_496_nl, fsm_output(2));
  mux_500_nl <= MUX_s_1_2_2(nor_114_nl, mux_497_nl, fsm_output(1));
  nor_118_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000011")));
  mux_501_nl <= MUX_s_1_2_2(mux_500_nl, nor_118_nl, fsm_output(8));
  COMP_LOOP_twiddle_f_mux1h_111_rmff <= COMP_LOOP_twiddle_f_mux1h_111_nl AND (NOT(mux_501_nl
      AND (fsm_output(0))));
  not_1027_nl <= NOT and_dcpl_132;
  COMP_LOOP_twiddle_help_mux_rmff <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (z_out_2(3
      DOWNTO 0)), not_1027_nl);
  COMP_LOOP_twiddle_f_mux1h_128_nl <= MUX1HOT_s_1_4_2((z_out_4(0)), (z_out_6(0)),
      (z_out_3(0)), (z_out_10(0)), STD_LOGIC_VECTOR'( COMP_LOOP_or_cse & COMP_LOOP_or_5_cse
      & COMP_LOOP_or_4_cse & COMP_LOOP_or_3_cse));
  or_446_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(6));
  mux_508_nl <= MUX_s_1_2_2(or_tmp_146, or_445_cse, fsm_output(1));
  mux_509_nl <= MUX_s_1_2_2(or_446_nl, mux_508_nl, fsm_output(2));
  or_444_nl <= (fsm_output(2)) OR mux_tmp_506;
  mux_510_nl <= MUX_s_1_2_2(mux_509_nl, or_444_nl, fsm_output(5));
  mux_507_nl <= MUX_s_1_2_2(mux_tmp_502, mux_tmp_506, fsm_output(2));
  nand_8_nl <= NOT((fsm_output(5)) AND (NOT mux_507_nl));
  mux_511_nl <= MUX_s_1_2_2(mux_510_nl, nand_8_nl, fsm_output(4));
  or_440_nl <= (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(6));
  mux_504_nl <= MUX_s_1_2_2(mux_tmp_502, or_440_nl, fsm_output(2));
  or_441_nl <= (fsm_output(5)) OR mux_504_nl;
  or_438_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(8)))
      OR (fsm_output(6));
  mux_503_nl <= MUX_s_1_2_2(or_438_nl, mux_tmp_502, fsm_output(2));
  or_439_nl <= (fsm_output(5)) OR mux_503_nl;
  mux_505_nl <= MUX_s_1_2_2(or_441_nl, or_439_nl, fsm_output(4));
  mux_512_nl <= MUX_s_1_2_2(mux_511_nl, mux_505_nl, fsm_output(3));
  COMP_LOOP_twiddle_f_mux1h_128_rmff <= COMP_LOOP_twiddle_f_mux1h_128_nl AND (NOT((NOT
      mux_512_nl) AND (fsm_output(0))));
  COMP_LOOP_twiddle_help_mux_1_rmff <= MUX_v_10_2_2((z_out_2(13 DOWNTO 4)), COMP_LOOP_17_twiddle_f_mul_psp_sva,
      and_dcpl_132);
  nor_179_cse <= NOT(mux_411_itm OR (fsm_output(0)));
  mux_529_nl <= MUX_s_1_2_2(mux_tmp_525, mux_tmp_517, fsm_output(2));
  mux_530_nl <= MUX_s_1_2_2(mux_529_nl, mux_tmp_523, fsm_output(5));
  mux_531_nl <= MUX_s_1_2_2(mux_tmp_524, mux_530_nl, fsm_output(3));
  mux_526_nl <= MUX_s_1_2_2(mux_tmp_521, mux_tmp_525, fsm_output(2));
  mux_527_nl <= MUX_s_1_2_2(mux_tmp_518, mux_526_nl, fsm_output(5));
  mux_528_nl <= MUX_s_1_2_2(mux_527_nl, mux_tmp_524, fsm_output(3));
  mux_532_itm <= MUX_s_1_2_2(mux_531_nl, mux_528_nl, fsm_output(1));
  mux_551_cse <= MUX_s_1_2_2(mux_307_cse, mux_311_cse, fsm_output(2));
  mux_548_cse <= MUX_s_1_2_2(mux_tmp_308, mux_307_cse, fsm_output(2));
  mux_549_cse <= MUX_s_1_2_2(mux_tmp_312, mux_548_cse, fsm_output(5));
  mux_268_nl <= MUX_s_1_2_2(mux_267_cse, and_tmp_2, or_285_cse);
  and_260_nl <= ((or_285_cse AND (fsm_output(6))) OR (fsm_output(7))) AND (fsm_output(8));
  mux_269_nl <= MUX_s_1_2_2(mux_268_nl, and_260_nl, fsm_output(2));
  mux_271_cse <= MUX_s_1_2_2(mux_269_nl, nor_tmp_36, fsm_output(1));
  and_257_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_714_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"));
  and_973_cse <= or_714_cse AND (fsm_output(6));
  or_483_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  or_480_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"));
  or_140_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  and_242_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_237_cse_1 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_1_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out_1(8
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0)), 9));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_twiddle_f_mul_nl),
      9)), (z_out_22(8 DOWNTO 0)), and_dcpl_18);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt <= MUX_v_13_2_2((STD_LOGIC_VECTOR'(
      "0000") & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl), COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1,
      and_dcpl_125);
  or_717_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  or_499_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_654_nl <= MUX_s_1_2_2(mux_tmp_648, mux_tmp_620, fsm_output(4));
  or_518_nl <= (fsm_output(4)) OR (fsm_output(1));
  mux_653_nl <= MUX_s_1_2_2(mux_tmp_619, mux_tmp_620, or_518_nl);
  mux_655_nl <= MUX_s_1_2_2(mux_654_nl, mux_653_nl, fsm_output(2));
  or_517_nl <= (fsm_output(3)) OR (fsm_output(5));
  mux_656_nl <= MUX_s_1_2_2(mux_655_nl, mux_tmp_620, or_517_nl);
  mux_649_nl <= MUX_s_1_2_2(mux_tmp_648, mux_tmp_625, fsm_output(4));
  mux_647_nl <= MUX_s_1_2_2(mux_tmp_638, mux_tmp_621, fsm_output(4));
  mux_650_nl <= MUX_s_1_2_2(mux_649_nl, mux_647_nl, fsm_output(2));
  mux_645_nl <= MUX_s_1_2_2(mux_tmp_643, mux_tmp_631, fsm_output(4));
  mux_644_nl <= MUX_s_1_2_2(mux_tmp_625, mux_tmp_643, fsm_output(4));
  mux_646_nl <= MUX_s_1_2_2(mux_645_nl, mux_644_nl, fsm_output(2));
  mux_651_nl <= MUX_s_1_2_2(mux_650_nl, mux_646_nl, fsm_output(5));
  mux_639_nl <= MUX_s_1_2_2(mux_tmp_631, mux_tmp_638, fsm_output(4));
  mux_634_nl <= MUX_s_1_2_2(mux_tmp_619, mux_tmp_620, COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm);
  mux_635_nl <= MUX_s_1_2_2(mux_634_nl, mux_tmp_633, fsm_output(1));
  mux_636_nl <= MUX_s_1_2_2(mux_635_nl, mux_tmp_631, fsm_output(4));
  mux_640_nl <= MUX_s_1_2_2(mux_639_nl, mux_636_nl, fsm_output(2));
  mux_626_nl <= MUX_s_1_2_2(mux_tmp_621, mux_tmp_625, fsm_output(4));
  or_513_nl <= and_232_cse OR (fsm_output(7));
  mux_622_nl <= MUX_s_1_2_2(nor_tmp_16, (fsm_output(8)), or_513_nl);
  mux_623_nl <= MUX_s_1_2_2(mux_622_nl, mux_tmp_621, fsm_output(4));
  mux_627_nl <= MUX_s_1_2_2(mux_626_nl, mux_623_nl, fsm_output(2));
  mux_641_nl <= MUX_s_1_2_2(mux_640_nl, mux_627_nl, fsm_output(5));
  mux_652_nl <= MUX_s_1_2_2(mux_651_nl, mux_641_nl, fsm_output(3));
  mux_657_nl <= MUX_s_1_2_2(mux_656_nl, mux_652_nl, fsm_output(0));
  COMP_LOOP_twiddle_help_and_cse <= complete_rsci_wen_comp AND mux_657_nl;
  and_265_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nor_125_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  VEC_LOOP_or_36_cse <= and_dcpl_79 OR and_dcpl_82 OR and_dcpl_85 OR and_dcpl_100;
  or_558_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_559_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"));
  mux_788_nl <= MUX_s_1_2_2(or_tmp_218, mux_tmp_351, fsm_output(4));
  mux_789_cse <= MUX_s_1_2_2(mux_788_nl, mux_420_cse, fsm_output(2));
  mux_874_nl <= MUX_s_1_2_2(mux_366_cse, mux_361_cse, fsm_output(5));
  mux_875_nl <= MUX_s_1_2_2(mux_367_cse, mux_874_nl, fsm_output(1));
  mux_876_nl <= MUX_s_1_2_2(mux_797_cse, mux_875_nl, fsm_output(4));
  mux_872_nl <= MUX_s_1_2_2(mux_364_cse, mux_367_cse, fsm_output(1));
  mux_873_nl <= MUX_s_1_2_2(mux_872_nl, mux_797_cse, fsm_output(4));
  mux_877_cse <= MUX_s_1_2_2(mux_876_nl, mux_873_nl, fsm_output(2));
  or_659_cse <= (NOT (fsm_output(8))) OR (fsm_output(5)) OR (fsm_output(7));
  mux_908_cse <= MUX_s_1_2_2(or_659_cse, or_tmp_426, fsm_output(6));
  mux_809_nl <= MUX_s_1_2_2(or_tmp_37, or_558_cse, fsm_output(5));
  or_656_cse <= (fsm_output(6)) OR mux_809_nl;
  mux_910_cse <= MUX_s_1_2_2(mux_tmp_808, mux_908_cse, fsm_output(4));
  VEC_LOOP_or_37_cse <= and_dcpl_31 OR and_dcpl_50 OR and_dcpl_60 OR and_dcpl_69
      OR and_dcpl_76 OR and_dcpl_84 OR and_dcpl_92 OR and_dcpl_99;
  or_663_nl <= (fsm_output(5)) OR (NOT (fsm_output(7)));
  or_662_nl <= (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_911_nl <= MUX_s_1_2_2(or_663_nl, or_662_nl, fsm_output(8));
  or_664_nl <= (fsm_output(6)) OR mux_911_nl;
  mux_912_nl <= MUX_s_1_2_2(or_664_nl, mux_tmp_808, fsm_output(4));
  nor_94_nl <= NOT((fsm_output(3)) OR and_265_cse OR mux_912_nl);
  and_219_nl <= (fsm_output(3)) AND (NOT(nor_125_cse OR mux_910_cse));
  mux_885_ssc <= MUX_s_1_2_2(nor_94_nl, and_219_nl, fsm_output(2));
  or_420_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0101"));
  or_445_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  VEC_LOOP_acc_10_cse_2_sva_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_3_sva_mx0w2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_4_sva_mx0w3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_5_sva_mx0w4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_6_sva_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_7_sva_mx0w6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_8_sva_mx0w7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_9_sva_mx0w8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_10_sva_mx0w9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_11_sva_mx0w10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_12_sva_mx0w11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_13_sva_mx0w12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_14_sva_mx0w13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_15_sva_mx0w14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_16_sva_mx0w15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_18_sva_mx0w17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_19_sva_mx0w18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_21_sva_mx0w20 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_23_sva_mx0w22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_25_sva_mx0w24 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_27_sva_mx0w26 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_29_sva_mx0w28 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_30_sva_mx0w29 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_31_sva_mx0w30 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_16)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT z_out_14))
      + SIGNED'( "01111"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  or_tmp_25 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  and_tmp_2 <= (fsm_output(8)) AND or_tmp_25;
  nor_tmp_7 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  or_tmp_36 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_37 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_62 <= (fsm_output(8)) OR (fsm_output(6));
  or_tmp_63 <= (fsm_output(8)) OR (NOT (fsm_output(6)));
  nor_tmp_16 <= (fsm_output(8)) AND (fsm_output(6));
  nor_tmp_36 <= (and_973_cse OR (fsm_output(7))) AND (fsm_output(8));
  or_285_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  mux_266_cse <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), fsm_output(7));
  mux_267_cse <= MUX_s_1_2_2(mux_266_cse, nor_tmp_7, fsm_output(6));
  or_dcpl_161 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  or_tmp_134 <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_tmp_274 <= MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output(0));
  mux_tmp_276 <= MUX_s_1_2_2(or_tmp_36, or_tmp_37, fsm_output(0));
  or_tmp_137 <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(7));
  mux_tmp_277 <= MUX_s_1_2_2(or_tmp_137, mux_tmp_276, fsm_output(5));
  mux_275_nl <= MUX_s_1_2_2(mux_tmp_274, or_tmp_134, fsm_output(5));
  mux_tmp_278 <= MUX_s_1_2_2(mux_tmp_277, mux_275_nl, fsm_output(6));
  or_tmp_138 <= (NOT (fsm_output(0))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_280_nl <= MUX_s_1_2_2(or_tmp_138, or_tmp_137, fsm_output(5));
  mux_279_nl <= MUX_s_1_2_2(mux_tmp_276, mux_tmp_274, fsm_output(5));
  mux_tmp_281 <= MUX_s_1_2_2(mux_280_nl, mux_279_nl, fsm_output(6));
  mux_tmp_282 <= MUX_s_1_2_2(mux_tmp_281, mux_tmp_278, fsm_output(1));
  mux_tmp_283 <= MUX_s_1_2_2(or_558_cse, or_tmp_37, fsm_output(0));
  mux_tmp_284 <= MUX_s_1_2_2(or_tmp_37, (fsm_output(7)), fsm_output(0));
  mux_285_nl <= MUX_s_1_2_2(mux_tmp_284, mux_tmp_283, fsm_output(5));
  or_303_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(0))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_tmp_286 <= MUX_s_1_2_2(mux_285_nl, or_303_nl, fsm_output(6));
  mux_287_nl <= MUX_s_1_2_2(mux_tmp_276, mux_tmp_284, fsm_output(5));
  or_306_nl <= (fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT
      (fsm_output(7)));
  mux_tmp_288 <= MUX_s_1_2_2(mux_287_nl, or_306_nl, fsm_output(6));
  mux_292_nl <= MUX_s_1_2_2(mux_tmp_283, or_tmp_138, fsm_output(5));
  mux_tmp_293 <= MUX_s_1_2_2(mux_292_nl, mux_tmp_277, fsm_output(6));
  mux_tmp_294 <= MUX_s_1_2_2(mux_tmp_286, mux_tmp_293, fsm_output(1));
  or_tmp_145 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  or_tmp_146 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_308 <= MUX_s_1_2_2(or_tmp_145, or_445_cse, fsm_output(4));
  mux_307_cse <= MUX_s_1_2_2(or_tmp_146, or_tmp_145, fsm_output(4));
  or_tmp_149 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_310 <= MUX_s_1_2_2(or_dcpl_161, or_tmp_149, fsm_output(4));
  mux_311_cse <= MUX_s_1_2_2(or_tmp_149, or_tmp_146, fsm_output(4));
  mux_tmp_312 <= MUX_s_1_2_2(mux_311_cse, mux_tmp_310, fsm_output(2));
  mux_tmp_314 <= MUX_s_1_2_2(or_445_cse, or_dcpl_161, fsm_output(4));
  and_dcpl_11 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_12 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_13 <= and_dcpl_12 AND and_dcpl_11;
  and_dcpl_14 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_15 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_16 <= and_dcpl_15 AND (NOT (fsm_output(6)));
  and_dcpl_17 <= and_dcpl_16 AND and_dcpl_14;
  and_dcpl_18 <= and_dcpl_17 AND and_dcpl_13;
  and_dcpl_20 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_21 <= and_dcpl_20 AND and_265_cse;
  or_322_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("101"));
  mux_331_cse <= MUX_s_1_2_2(or_322_cse, or_tmp_149, fsm_output(4));
  mux_332_nl <= MUX_s_1_2_2(mux_331_cse, mux_tmp_314, fsm_output(2));
  mux_333_nl <= MUX_s_1_2_2(mux_332_nl, mux_551_cse, fsm_output(5));
  mux_334_nl <= MUX_s_1_2_2(mux_333_nl, mux_316_cse, fsm_output(3));
  mux_338_nl <= MUX_s_1_2_2(mux_317_cse, mux_334_nl, fsm_output(1));
  and_dcpl_23 <= NOT(mux_338_nl OR (fsm_output(0)));
  and_dcpl_25 <= and_237_cse_1 AND and_265_cse;
  and_dcpl_26 <= and_dcpl_17 AND and_dcpl_25;
  mux_tmp_339 <= MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output(3));
  or_tmp_161 <= (fsm_output(6)) OR mux_tmp_339;
  or_tmp_164 <= (fsm_output(3)) OR (fsm_output(8)) OR (fsm_output(7));
  or_329_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_tmp_342 <= MUX_s_1_2_2(or_329_nl, or_tmp_164, fsm_output(6));
  mux_tmp_343 <= MUX_s_1_2_2(or_558_cse, or_tmp_37, fsm_output(3));
  mux_347_nl <= MUX_s_1_2_2(nand_4_cse, or_tmp_161, fsm_output(5));
  mux_346_nl <= MUX_s_1_2_2(mux_tmp_342, nand_3_cse, fsm_output(5));
  mux_348_nl <= MUX_s_1_2_2(mux_347_nl, mux_346_nl, fsm_output(4));
  mux_344_nl <= MUX_s_1_2_2(or_358_cse, mux_tmp_342, fsm_output(5));
  mux_341_nl <= MUX_s_1_2_2(mux_375_cse, or_tmp_161, fsm_output(5));
  mux_345_nl <= MUX_s_1_2_2(mux_344_nl, mux_341_nl, fsm_output(4));
  mux_349_nl <= MUX_s_1_2_2(mux_348_nl, mux_345_nl, fsm_output(2));
  and_dcpl_27 <= (NOT mux_349_nl) AND and_dcpl_11;
  and_dcpl_28 <= and_dcpl_20 AND and_dcpl_11;
  and_dcpl_29 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_30 <= and_dcpl_16 AND and_dcpl_29;
  and_dcpl_31 <= and_dcpl_30 AND and_dcpl_28;
  mux_tmp_351 <= MUX_s_1_2_2(or_445_cse, or_tmp_149, fsm_output(5));
  mux_350_cse <= MUX_s_1_2_2(or_dcpl_161, or_tmp_146, fsm_output(5));
  mux_tmp_352 <= MUX_s_1_2_2(mux_tmp_351, mux_350_cse, fsm_output(4));
  mux_tmp_354 <= MUX_s_1_2_2(or_tmp_149, or_tmp_145, fsm_output(5));
  mux_355_nl <= MUX_s_1_2_2(mux_tmp_354, mux_489_cse, fsm_output(4));
  mux_tmp_356 <= MUX_s_1_2_2(mux_355_nl, mux_tmp_352, fsm_output(3));
  and_dcpl_34 <= (NOT mux_tmp_356) AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  and_dcpl_35 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_36 <= and_dcpl_35 AND and_265_cse;
  and_dcpl_37 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_38 <= and_dcpl_16 AND and_dcpl_37;
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_36;
  and_dcpl_40 <= and_237_cse_1 AND and_dcpl_11;
  and_dcpl_41 <= and_dcpl_38 AND and_dcpl_40;
  mux_tmp_357 <= MUX_s_1_2_2(or_tmp_145, or_dcpl_161, fsm_output(5));
  mux_tmp_358 <= MUX_s_1_2_2(mux_489_cse, mux_tmp_357, fsm_output(4));
  and_dcpl_42 <= (NOT mux_tmp_358) AND and_dcpl_36;
  and_dcpl_43 <= and_dcpl_12 AND and_265_cse;
  and_dcpl_44 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_45 <= and_dcpl_16 AND and_dcpl_44;
  and_dcpl_46 <= and_dcpl_45 AND and_dcpl_43;
  and_dcpl_47 <= and_dcpl_35 AND and_dcpl_11;
  and_dcpl_48 <= and_dcpl_15 AND (fsm_output(6));
  and_dcpl_49 <= and_dcpl_48 AND and_dcpl_14;
  and_dcpl_50 <= and_dcpl_49 AND and_dcpl_47;
  and_dcpl_51 <= and_dcpl_49 AND and_dcpl_21;
  and_dcpl_52 <= and_dcpl_48 AND and_dcpl_29;
  and_dcpl_53 <= and_dcpl_52 AND and_dcpl_13;
  and_dcpl_57 <= xor_dcpl AND (NOT (fsm_output(8))) AND (fsm_output(6)) AND (fsm_output(4))
      AND and_dcpl_21;
  and_dcpl_58 <= and_dcpl_52 AND and_dcpl_25;
  and_dcpl_59 <= and_dcpl_48 AND and_dcpl_37;
  and_dcpl_60 <= and_dcpl_59 AND and_dcpl_28;
  and_dcpl_61 <= and_dcpl_48 AND and_dcpl_44;
  and_dcpl_62 <= and_dcpl_61 AND and_dcpl_36;
  and_dcpl_63 <= and_dcpl_61 AND and_dcpl_40;
  and_dcpl_64 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_65 <= and_dcpl_64 AND (NOT (fsm_output(6)));
  and_dcpl_66 <= and_dcpl_65 AND and_dcpl_14;
  and_dcpl_67 <= and_dcpl_66 AND and_dcpl_43;
  and_dcpl_68 <= and_dcpl_65 AND and_dcpl_29;
  and_dcpl_69 <= and_dcpl_68 AND and_dcpl_47;
  and_dcpl_70 <= and_dcpl_68 AND and_dcpl_21;
  and_dcpl_71 <= and_dcpl_65 AND and_dcpl_37;
  and_dcpl_72 <= and_dcpl_71 AND and_dcpl_13;
  and_dcpl_73 <= and_dcpl_71 AND and_dcpl_21;
  and_dcpl_74 <= and_dcpl_71 AND and_dcpl_25;
  and_dcpl_75 <= and_dcpl_65 AND and_dcpl_44;
  and_dcpl_76 <= and_dcpl_75 AND and_dcpl_28;
  and_dcpl_77 <= and_dcpl_64 AND (fsm_output(6));
  and_dcpl_78 <= and_dcpl_77 AND and_dcpl_14;
  and_dcpl_79 <= and_dcpl_78 AND and_dcpl_36;
  and_dcpl_80 <= and_dcpl_78 AND and_dcpl_40;
  and_dcpl_81 <= and_dcpl_77 AND and_dcpl_29;
  and_dcpl_82 <= and_dcpl_81 AND and_dcpl_43;
  and_dcpl_83 <= and_dcpl_77 AND and_dcpl_37;
  and_dcpl_84 <= and_dcpl_83 AND and_dcpl_47;
  and_dcpl_85 <= and_dcpl_83 AND and_dcpl_21;
  and_dcpl_86 <= and_dcpl_77 AND and_dcpl_44;
  and_dcpl_87 <= and_dcpl_86 AND and_dcpl_13;
  and_dcpl_88 <= and_dcpl_86 AND and_dcpl_25;
  and_dcpl_89 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_90 <= and_dcpl_89 AND (NOT (fsm_output(6)));
  and_dcpl_91 <= and_dcpl_90 AND and_dcpl_14;
  and_dcpl_92 <= and_dcpl_91 AND and_dcpl_28;
  and_dcpl_93 <= and_dcpl_90 AND and_dcpl_29;
  and_dcpl_94 <= and_dcpl_93 AND and_dcpl_36;
  and_dcpl_95 <= and_dcpl_93 AND and_dcpl_40;
  and_dcpl_96 <= and_dcpl_90 AND and_dcpl_37;
  and_dcpl_97 <= and_dcpl_96 AND and_dcpl_43;
  and_dcpl_98 <= and_dcpl_90 AND and_dcpl_44;
  and_dcpl_99 <= and_dcpl_98 AND and_dcpl_47;
  and_dcpl_100 <= and_dcpl_98 AND and_dcpl_21;
  and_dcpl_102 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_173 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  or_tmp_174 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  mux_359_nl <= MUX_s_1_2_2(or_tmp_174, or_tmp_173, fsm_output(1));
  and_dcpl_105 <= (NOT mux_359_nl) AND and_dcpl_15 AND and_dcpl_102 AND (NOT (fsm_output(4)))
      AND (fsm_output(0));
  mux_360_cse <= MUX_s_1_2_2(or_tmp_145, or_tmp_149, fsm_output(3));
  mux_361_cse <= MUX_s_1_2_2(or_tmp_149, or_445_cse, fsm_output(3));
  mux_tmp_362 <= MUX_s_1_2_2(mux_361_cse, mux_360_cse, fsm_output(5));
  mux_tmp_363 <= MUX_s_1_2_2(or_tmp_146, or_dcpl_161, fsm_output(3));
  mux_tmp_382 <= MUX_s_1_2_2(mux_tmp_357, mux_tmp_351, fsm_output(4));
  mux_tmp_383 <= MUX_s_1_2_2(or_420_cse, mux_tmp_354, fsm_output(4));
  mux_386_nl <= MUX_s_1_2_2(or_322_cse, or_tmp_146, fsm_output(5));
  mux_387_nl <= MUX_s_1_2_2(mux_386_nl, mux_tmp_354, fsm_output(4));
  mux_388_nl <= MUX_s_1_2_2(mux_387_nl, mux_tmp_382, fsm_output(3));
  mux_385_nl <= MUX_s_1_2_2(mux_tmp_352, mux_tmp_358, fsm_output(3));
  mux_tmp_389 <= MUX_s_1_2_2(mux_388_nl, mux_385_nl, fsm_output(2));
  mux_tmp_391 <= MUX_s_1_2_2(mux_tmp_358, mux_tmp_383, fsm_output(3));
  mux_tmp_400 <= MUX_s_1_2_2(mux_tmp_314, mux_307_cse, fsm_output(3));
  mux_404_nl <= MUX_s_1_2_2(mux_307_cse, mux_tmp_310, fsm_output(3));
  mux_402_nl <= MUX_s_1_2_2(mux_311_cse, mux_tmp_314, fsm_output(3));
  mux_tmp_405 <= MUX_s_1_2_2(mux_404_nl, mux_402_nl, fsm_output(2));
  mux_408_nl <= MUX_s_1_2_2(mux_331_cse, mux_tmp_308, fsm_output(3));
  mux_409_nl <= MUX_s_1_2_2(mux_408_nl, mux_tmp_400, fsm_output(2));
  mux_410_nl <= MUX_s_1_2_2(mux_409_nl, mux_tmp_405, fsm_output(5));
  mux_397_nl <= MUX_s_1_2_2(mux_tmp_308, mux_311_cse, fsm_output(3));
  mux_401_nl <= MUX_s_1_2_2(mux_tmp_400, mux_397_nl, fsm_output(2));
  mux_406_nl <= MUX_s_1_2_2(mux_tmp_405, mux_401_nl, fsm_output(5));
  mux_411_itm <= MUX_s_1_2_2(mux_410_nl, mux_406_nl, fsm_output(1));
  or_373_nl <= (fsm_output(8)) OR (fsm_output(4));
  or_372_nl <= (fsm_output(8)) OR (NOT (fsm_output(4)));
  mux_tmp_412 <= MUX_s_1_2_2(or_373_nl, or_372_nl, fsm_output(2));
  or_tmp_210 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR mux_tmp_412;
  or_tmp_218 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0110"));
  mux_420_cse <= MUX_s_1_2_2(mux_489_cse, or_tmp_218, fsm_output(4));
  or_tmp_225 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 5)=STD_LOGIC_VECTOR'("0111")));
  mux_tmp_425 <= MUX_s_1_2_2(or_420_cse, or_tmp_225, fsm_output(4));
  mux_tmp_434 <= MUX_s_1_2_2(nand_3_cse, or_358_cse, fsm_output(4));
  mux_tmp_441 <= MUX_s_1_2_2(mux_373_cse, mux_377_cse, fsm_output(5));
  mux_445_nl <= MUX_s_1_2_2(mux_378_cse, mux_373_cse, fsm_output(5));
  mux_443_nl <= MUX_s_1_2_2(mux_377_cse, mux_372_cse, fsm_output(5));
  mux_tmp_446 <= MUX_s_1_2_2(mux_445_nl, mux_443_nl, fsm_output(2));
  or_tmp_235 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  or_tmp_236 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01")) OR (NOT
      (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  mux_tmp_453 <= MUX_s_1_2_2(or_tmp_236, or_tmp_235, fsm_output(7));
  or_tmp_237 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100")) OR
      (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  or_tmp_238 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  not_tmp_151 <= NOT((VEC_LOOP_j_10_14_0_sva_1(14)) AND (fsm_output(8)));
  or_404_nl <= (fsm_output(6)) OR not_tmp_151;
  or_403_nl <= (NOT (fsm_output(6))) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(8));
  mux_456_nl <= MUX_s_1_2_2(or_404_nl, or_403_nl, fsm_output(5));
  or_tmp_241 <= (fsm_output(7)) OR mux_456_nl;
  mux_tmp_459 <= MUX_s_1_2_2(mux_tmp_453, or_tmp_241, fsm_output(4));
  nand_25_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND
      (VEC_LOOP_j_10_14_0_sva_1(14)) AND (NOT (fsm_output(8))));
  mux_tmp_460 <= MUX_s_1_2_2(or_tmp_235, nand_25_nl, fsm_output(7));
  mux_tmp_478 <= MUX_s_1_2_2(mux_tmp_351, mux_tmp_357, fsm_output(2));
  or_tmp_254 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_483 <= MUX_s_1_2_2(mux_tmp_354, mux_350_cse, fsm_output(2));
  and_dcpl_125 <= and_dcpl_17 AND and_dcpl_40;
  and_dcpl_132 <= and_dcpl_52 AND and_dcpl_36;
  and_dcpl_133 <= and_dcpl_52 AND and_dcpl_40;
  mux_tmp_502 <= MUX_s_1_2_2(or_tmp_149, or_tmp_145, fsm_output(1));
  mux_tmp_506 <= MUX_s_1_2_2(or_dcpl_161, or_tmp_146, fsm_output(1));
  and_dcpl_164 <= and_dcpl_89 AND (fsm_output(6)) AND and_dcpl_14;
  and_dcpl_166 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_168 <= and_dcpl_164 AND and_dcpl_12 AND and_dcpl_166;
  not_tmp_164 <= NOT((fsm_output(0)) AND (fsm_output(6)));
  mux_513_nl <= MUX_s_1_2_2(not_tmp_164, (fsm_output(6)), fsm_output(8));
  or_tmp_282 <= (fsm_output(7)) OR mux_513_nl;
  or_tmp_284 <= (fsm_output(8)) OR (NOT (fsm_output(0))) OR (fsm_output(6));
  mux_tmp_514 <= MUX_s_1_2_2(or_tmp_284, or_tmp_63, fsm_output(7));
  mux_tmp_516 <= MUX_s_1_2_2(or_tmp_62, or_tmp_284, fsm_output(7));
  mux_tmp_517 <= MUX_s_1_2_2(or_tmp_282, mux_tmp_516, fsm_output(4));
  mux_515_nl <= MUX_s_1_2_2(mux_tmp_514, or_tmp_282, fsm_output(4));
  mux_tmp_518 <= MUX_s_1_2_2(mux_tmp_517, mux_515_nl, fsm_output(2));
  or_451_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(0))) OR (fsm_output(6));
  mux_tmp_519 <= MUX_s_1_2_2(or_451_nl, or_tmp_62, fsm_output(7));
  or_452_nl <= (fsm_output(8)) OR not_tmp_164;
  mux_tmp_520 <= MUX_s_1_2_2(or_tmp_63, or_452_nl, fsm_output(7));
  mux_tmp_521 <= MUX_s_1_2_2(mux_tmp_520, mux_tmp_519, fsm_output(4));
  mux_522_nl <= MUX_s_1_2_2(mux_tmp_519, mux_tmp_514, fsm_output(4));
  mux_tmp_523 <= MUX_s_1_2_2(mux_522_nl, mux_tmp_521, fsm_output(2));
  mux_tmp_524 <= MUX_s_1_2_2(mux_tmp_523, mux_tmp_518, fsm_output(5));
  mux_tmp_525 <= MUX_s_1_2_2(mux_tmp_516, mux_tmp_520, fsm_output(4));
  or_tmp_289 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("1000"));
  mux_tmp_533 <= MUX_s_1_2_2(or_tmp_218, or_tmp_289, fsm_output(4));
  or_tmp_293 <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("1001"));
  mux_537_nl <= MUX_s_1_2_2(or_tmp_225, or_tmp_293, fsm_output(4));
  mux_536_nl <= MUX_s_1_2_2(or_tmp_289, or_420_cse, fsm_output(4));
  mux_538_nl <= MUX_s_1_2_2(mux_537_nl, mux_536_nl, fsm_output(3));
  mux_535_nl <= MUX_s_1_2_2(mux_tmp_425, mux_tmp_533, fsm_output(3));
  mux_539_nl <= MUX_s_1_2_2(mux_538_nl, mux_535_nl, fsm_output(2));
  and_dcpl_170 <= (NOT mux_539_nl) AND and_265_cse;
  mux_562_nl <= MUX_s_1_2_2(mux_267_cse, and_tmp_2, or_714_cse);
  mux_563_nl <= MUX_s_1_2_2(mux_562_nl, nor_tmp_36, fsm_output(1));
  mux_tmp_564 <= MUX_s_1_2_2(mux_271_cse, mux_563_nl, fsm_output(0));
  and_dcpl_176 <= and_dcpl_12 AND nor_125_cse;
  and_dcpl_181 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  mux_tmp_570 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(2));
  or_tmp_316 <= (or_140_cse AND (fsm_output(6))) OR (fsm_output(7));
  mux_573_nl <= MUX_s_1_2_2((fsm_output(7)), (fsm_output(6)), fsm_output(5));
  mux_tmp_574 <= MUX_s_1_2_2(mux_573_nl, or_tmp_25, fsm_output(4));
  mux_tmp_575 <= MUX_s_1_2_2(mux_tmp_574, or_tmp_316, fsm_output(3));
  or_490_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_577_nl <= MUX_s_1_2_2(or_490_nl, or_tmp_25, fsm_output(5));
  or_489_nl <= (CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"))) OR (fsm_output(7));
  mux_578_nl <= MUX_s_1_2_2(mux_577_nl, or_489_nl, fsm_output(4));
  mux_tmp_579 <= MUX_s_1_2_2(mux_578_nl, mux_tmp_574, fsm_output(3));
  mux_tmp_580 <= MUX_s_1_2_2(mux_tmp_579, or_tmp_316, fsm_output(2));
  nor_tmp_66 <= or_717_cse AND (fsm_output(8));
  mux_594_cse <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), or_tmp_25);
  mux_tmp_595 <= MUX_s_1_2_2(mux_594_cse, and_tmp_2, fsm_output(5));
  and_dcpl_190 <= and_dcpl_17 AND and_237_cse_1 AND (NOT COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm)
      AND and_dcpl_11;
  mux_136_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(8));
  mux_tmp_619 <= MUX_s_1_2_2(mux_136_nl, (fsm_output(8)), fsm_output(7));
  mux_tmp_620 <= MUX_s_1_2_2(nor_tmp_16, (fsm_output(8)), fsm_output(7));
  and_232_cse <= (fsm_output(1)) AND (VEC_LOOP_j_10_14_0_sva_1(14));
  mux_tmp_621 <= MUX_s_1_2_2(mux_tmp_620, mux_tmp_619, and_232_cse);
  mux_tmp_624 <= MUX_s_1_2_2((fsm_output(6)), (fsm_output(8)), fsm_output(7));
  mux_tmp_625 <= MUX_s_1_2_2(mux_tmp_620, mux_tmp_624, and_232_cse);
  mux_630_nl <= MUX_s_1_2_2(mux_tmp_620, mux_tmp_624, VEC_LOOP_j_10_14_0_sva_1(14));
  mux_628_nl <= MUX_s_1_2_2(nor_tmp_16, or_tmp_62, fsm_output(7));
  mux_629_nl <= MUX_s_1_2_2(mux_tmp_620, mux_628_nl, VEC_LOOP_j_10_14_0_sva_1(14));
  mux_tmp_631 <= MUX_s_1_2_2(mux_630_nl, mux_629_nl, fsm_output(1));
  mux_632_nl <= MUX_s_1_2_2(nor_tmp_16, or_tmp_63, fsm_output(7));
  mux_tmp_633 <= MUX_s_1_2_2(mux_tmp_620, mux_632_nl, VEC_LOOP_j_10_14_0_sva_1(14));
  or_516_nl <= (VEC_LOOP_j_10_14_0_sva_1(14)) OR (fsm_output(7));
  mux_637_nl <= MUX_s_1_2_2(nor_tmp_16, (fsm_output(8)), or_516_nl);
  mux_tmp_638 <= MUX_s_1_2_2(mux_tmp_633, mux_637_nl, fsm_output(1));
  mux_642_nl <= MUX_s_1_2_2(mux_tmp_620, mux_tmp_619, VEC_LOOP_j_10_14_0_sva_1(14));
  mux_tmp_643 <= MUX_s_1_2_2(mux_642_nl, mux_tmp_633, fsm_output(1));
  mux_tmp_648 <= MUX_s_1_2_2((NOT or_tmp_62), (fsm_output(8)), fsm_output(7));
  or_tmp_351 <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(5));
  or_tmp_352 <= (fsm_output(3)) OR (NOT (fsm_output(6))) OR (fsm_output(5));
  or_tmp_354 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_539_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)/=STD_LOGIC_VECTOR'("01110"));
  mux_698_nl <= MUX_s_1_2_2(mux_tmp_533, or_539_nl, fsm_output(3));
  mux_696_nl <= MUX_s_1_2_2(or_tmp_293, or_tmp_218, fsm_output(4));
  mux_697_nl <= MUX_s_1_2_2(mux_696_nl, mux_tmp_425, fsm_output(3));
  mux_699_nl <= MUX_s_1_2_2(mux_698_nl, mux_697_nl, fsm_output(2));
  and_dcpl_195 <= (NOT mux_699_nl) AND and_dcpl_11 AND (VEC_LOOP_j_10_14_0_sva_1(14));
  or_tmp_380 <= and_dcpl_181 OR (fsm_output(8));
  mux_tmp_719 <= MUX_s_1_2_2(mux_266_cse, or_tmp_37, fsm_output(6));
  mux_tmp_721 <= MUX_s_1_2_2(nor_tmp_7, or_tmp_37, fsm_output(6));
  mux_tmp_722 <= MUX_s_1_2_2(mux_tmp_721, mux_tmp_719, fsm_output(4));
  mux_tmp_724 <= MUX_s_1_2_2(mux_tmp_721, mux_tmp_719, or_559_cse);
  and_221_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_tmp_735 <= MUX_s_1_2_2(mux_594_cse, or_tmp_380, and_221_nl);
  or_tmp_387 <= (fsm_output(6)) OR mux_266_cse;
  nor_100_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(4))));
  nor_106_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)));
  mux_747_nl <= MUX_s_1_2_2(nor_100_nl, nor_106_nl, fsm_output(1));
  and_dcpl_199 <= mux_747_nl AND and_dcpl_15 AND and_dcpl_102 AND (NOT (fsm_output(3)))
      AND (NOT (fsm_output(0)));
  mux_752_nl <= MUX_s_1_2_2(mux_tmp_351, mux_489_cse, fsm_output(3));
  mux_750_nl <= MUX_s_1_2_2(mux_tmp_354, mux_tmp_351, fsm_output(3));
  mux_tmp_753 <= MUX_s_1_2_2(mux_752_nl, mux_750_nl, fsm_output(1));
  mux_tmp_755 <= MUX_s_1_2_2(or_420_cse, mux_tmp_357, fsm_output(3));
  mux_760_nl <= MUX_s_1_2_2(mux_489_cse, mux_350_cse, fsm_output(3));
  mux_761_nl <= MUX_s_1_2_2(mux_tmp_755, mux_760_nl, fsm_output(1));
  mux_762_nl <= MUX_s_1_2_2(mux_tmp_753, mux_761_nl, fsm_output(4));
  mux_756_nl <= MUX_s_1_2_2(mux_tmp_357, mux_tmp_354, fsm_output(3));
  mux_757_nl <= MUX_s_1_2_2(mux_756_nl, mux_tmp_755, fsm_output(1));
  mux_758_nl <= MUX_s_1_2_2(mux_757_nl, mux_tmp_753, fsm_output(4));
  mux_763_nl <= MUX_s_1_2_2(mux_762_nl, mux_758_nl, fsm_output(2));
  and_dcpl_200 <= NOT(mux_763_nl OR (fsm_output(0)));
  mux_792_nl <= MUX_s_1_2_2(or_dcpl_161, or_tmp_145, fsm_output(3));
  mux_794_nl <= MUX_s_1_2_2(mux_360_cse, mux_792_nl, fsm_output(5));
  mux_797_cse <= MUX_s_1_2_2(mux_tmp_362, mux_794_nl, fsm_output(1));
  or_tmp_426 <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (fsm_output(7));
  or_599_nl <= (fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_tmp_808 <= MUX_s_1_2_2(or_tmp_426, or_599_nl, fsm_output(6));
  mux_900_nl <= MUX_s_1_2_2(or_656_cse, mux_tmp_808, fsm_output(4));
  mux_tmp_813 <= MUX_s_1_2_2(mux_910_cse, mux_900_nl, fsm_output(2));
  mux_tmp_814 <= MUX_s_1_2_2(or_tmp_36, or_tmp_37, fsm_output(5));
  nand_tmp_12 <= NOT((fsm_output(6)) AND (NOT mux_tmp_814));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_164 AND and_dcpl_13;
  VEC_LOOP_acc_1_cse_10_sva_mx0c0 <= NOT(mux_877_cse OR (fsm_output(0)));
  mux_821_nl <= MUX_s_1_2_2(nand_tmp_12, or_656_cse, fsm_output(4));
  mux_820_nl <= MUX_s_1_2_2(or_420_cse, nand_tmp_12, fsm_output(4));
  mux_822_nl <= MUX_s_1_2_2(mux_821_nl, mux_820_nl, fsm_output(2));
  mux_823_nl <= MUX_s_1_2_2(mux_tmp_813, mux_822_nl, fsm_output(3));
  or_608_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_816_nl <= MUX_s_1_2_2(or_608_nl, or_659_cse, fsm_output(6));
  mux_817_nl <= MUX_s_1_2_2(mux_816_nl, nand_tmp_12, fsm_output(4));
  or_606_nl <= (fsm_output(6)) OR mux_tmp_814;
  mux_815_nl <= MUX_s_1_2_2(mux_908_cse, or_606_nl, fsm_output(4));
  mux_818_nl <= MUX_s_1_2_2(mux_817_nl, mux_815_nl, fsm_output(2));
  mux_819_nl <= MUX_s_1_2_2(mux_818_nl, mux_tmp_813, fsm_output(3));
  mux_824_nl <= MUX_s_1_2_2(mux_823_nl, mux_819_nl, fsm_output(1));
  VEC_LOOP_acc_1_cse_10_sva_mx0c2 <= (NOT mux_824_nl) AND (fsm_output(0));
  xor_dcpl <= NOT((fsm_output(7)) XOR (fsm_output(5)));
  VEC_LOOP_or_12_cse <= and_dcpl_39 OR and_dcpl_46 OR and_dcpl_51 OR and_dcpl_58
      OR and_dcpl_62 OR and_dcpl_67 OR and_dcpl_70 OR and_dcpl_74 OR and_dcpl_79
      OR and_dcpl_82 OR and_dcpl_85 OR and_dcpl_88 OR and_dcpl_94 OR and_dcpl_97
      OR and_dcpl_100;
  VEC_LOOP_or_13_cse <= and_dcpl_41 OR and_dcpl_63 OR and_dcpl_80 OR and_dcpl_95;
  VEC_LOOP_or_38_cse <= and_dcpl_53 OR and_dcpl_87;
  VEC_LOOP_or_23_cse <= and_dcpl_72 OR and_dcpl_88 OR and_dcpl_94;
  VEC_LOOP_mux1h_10_nl <= MUX1HOT_v_10_7_2((z_out_15(13 DOWNTO 4)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(13
      DOWNTO 4)), (z_out_24(12 DOWNTO 3)), (z_out_17(13 DOWNTO 4)), (z_out_20(11
      DOWNTO 2)), (z_out_20(10 DOWNTO 1)), z_out_22, STD_LOGIC_VECTOR'( and_dcpl_18
      & and_dcpl_26 & VEC_LOOP_or_37_cse & VEC_LOOP_or_12_cse & VEC_LOOP_or_13_cse
      & VEC_LOOP_or_38_cse & and_dcpl_72));
  VEC_LOOP_mux1h_8_nl <= MUX1HOT_s_1_7_2((z_out_15(3)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(3)),
      (z_out_24(2)), (z_out_17(3)), (z_out_20(1)), (z_out_20(0)), (VEC_LOOP_acc_1_cse_10_sva(3)),
      STD_LOGIC_VECTOR'( and_dcpl_18 & and_dcpl_26 & VEC_LOOP_or_37_cse & VEC_LOOP_or_12_cse
      & VEC_LOOP_or_13_cse & VEC_LOOP_or_38_cse & and_dcpl_72));
  and_116_nl <= (NOT mux_tmp_383) AND and_dcpl_13;
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_s_1_6_2((z_out_15(2)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(2)),
      (z_out_24(1)), (z_out_17(2)), (z_out_20(0)), (VEC_LOOP_acc_1_cse_10_sva(2)),
      STD_LOGIC_VECTOR'( and_dcpl_18 & and_dcpl_26 & VEC_LOOP_or_37_cse & VEC_LOOP_or_12_cse
      & VEC_LOOP_or_13_cse & and_116_nl));
  mux_384_nl <= MUX_s_1_2_2(mux_tmp_383, mux_tmp_382, fsm_output(3));
  and_114_nl <= (NOT mux_384_nl) AND CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_5_2((z_out_15(1)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(1)),
      (z_out_24(0)), (z_out_17(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), STD_LOGIC_VECTOR'(
      and_dcpl_18 & and_dcpl_26 & VEC_LOOP_or_37_cse & VEC_LOOP_or_12_cse & and_114_nl));
  mux_368_nl <= MUX_s_1_2_2(mux_tmp_362, mux_367_cse, fsm_output(4));
  mux_365_nl <= MUX_s_1_2_2(mux_364_cse, mux_tmp_362, fsm_output(4));
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, mux_365_nl, fsm_output(2));
  and_110_nl <= (NOT mux_369_nl) AND and_dcpl_11;
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_4_2((z_out_15(0)), (VEC_LOOP_acc_10_cse_2_sva_mx0w1(0)),
      (VEC_LOOP_acc_1_cse_10_sva(0)), (z_out_17(0)), STD_LOGIC_VECTOR'( and_dcpl_18
      & and_dcpl_26 & and_110_nl & VEC_LOOP_or_12_cse));
  and_26_nl <= and_dcpl_17 AND and_dcpl_21;
  VEC_LOOP_mux1h_nl <= MUX1HOT_v_9_34_2((z_out_22(8 DOWNTO 0)), COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0,
      (VEC_LOOP_acc_10_cse_1_sva(13 DOWNTO 5)), (z_out_17(13 DOWNTO 5)), (VEC_LOOP_acc_1_cse_10_sva(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(13 DOWNTO 5)), (VEC_LOOP_acc_11_psp_sva_12
      & VEC_LOOP_acc_11_psp_sva_11 & (VEC_LOOP_acc_11_psp_sva_10_0(10 DOWNTO 4))),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(13
      DOWNTO 5)), (VEC_LOOP_acc_11_psp_sva_11 & (VEC_LOOP_acc_11_psp_sva_10_0(10
      DOWNTO 3))), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_8_sva_mx0w7(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(13
      DOWNTO 5)), (VEC_LOOP_acc_11_psp_sva_10_0(10 DOWNTO 2)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(13
      DOWNTO 5)), (z_out_15(13 DOWNTO 5)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(9
      DOWNTO 1)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(13
      DOWNTO 5)), (z_out_18(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(13
      DOWNTO 5)), STD_LOGIC_VECTOR'( and_dcpl_18 & and_26_nl & and_dcpl_23 & and_dcpl_26
      & and_dcpl_27 & and_dcpl_31 & and_dcpl_34 & and_dcpl_39 & and_dcpl_41 & and_dcpl_42
      & and_dcpl_46 & and_dcpl_50 & and_dcpl_51 & and_dcpl_53 & and_dcpl_57 & and_dcpl_58
      & and_dcpl_60 & and_dcpl_62 & and_dcpl_63 & and_dcpl_67 & and_dcpl_69 & and_dcpl_70
      & VEC_LOOP_or_23_cse & and_dcpl_73 & and_dcpl_74 & and_dcpl_76 & VEC_LOOP_or_36_cse
      & and_dcpl_80 & and_dcpl_84 & and_dcpl_87 & and_dcpl_92 & and_dcpl_95 & and_dcpl_97
      & and_dcpl_99));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_33_2((COMP_LOOP_twiddle_f_17_sva(4)), (VEC_LOOP_acc_10_cse_1_sva(4)),
      (z_out_17(4)), (VEC_LOOP_acc_1_cse_10_sva(4)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(4)),
      (VEC_LOOP_acc_11_psp_sva_10_0(3)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(4)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(4)),
      (VEC_LOOP_acc_11_psp_sva_10_0(2)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(4)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(4)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(4)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(4)),
      (VEC_LOOP_acc_11_psp_sva_10_0(1)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(4)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(4)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(4)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(4)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(4)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(4)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(4)), (z_out_15(4)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(0)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(4)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(4)),
      (z_out_18(4)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(4)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(4)),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24(4)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(4)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(4)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(4)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(4)), STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_23
      & and_dcpl_26 & and_dcpl_27 & and_dcpl_31 & and_dcpl_34 & and_dcpl_39 & and_dcpl_41
      & and_dcpl_42 & and_dcpl_46 & and_dcpl_50 & and_dcpl_51 & and_dcpl_53 & and_dcpl_57
      & and_dcpl_58 & and_dcpl_60 & and_dcpl_62 & and_dcpl_63 & and_dcpl_67 & and_dcpl_69
      & and_dcpl_70 & VEC_LOOP_or_23_cse & and_dcpl_73 & and_dcpl_74 & and_dcpl_76
      & VEC_LOOP_or_36_cse & and_dcpl_80 & and_dcpl_84 & and_dcpl_87 & and_dcpl_92
      & and_dcpl_95 & and_dcpl_97 & and_dcpl_99));
  mux_379_nl <= MUX_s_1_2_2(mux_378_cse, mux_377_cse, fsm_output(2));
  mux_374_nl <= MUX_s_1_2_2(mux_373_cse, mux_372_cse, fsm_output(2));
  mux_380_nl <= MUX_s_1_2_2(mux_379_nl, mux_374_nl, fsm_output(5));
  or_349_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)/=STD_LOGIC_VECTOR'("0101010"));
  mux_381_nl <= MUX_s_1_2_2(mux_380_nl, or_349_nl, fsm_output(1));
  and_111_nl <= (NOT mux_381_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_32_2((COMP_LOOP_twiddle_f_17_sva(3)), (VEC_LOOP_acc_10_cse_1_sva(3)),
      (z_out_17(3)), (VEC_LOOP_acc_1_cse_10_sva(3)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(3)),
      (VEC_LOOP_acc_11_psp_sva_10_0(2)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(3)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(3)),
      (VEC_LOOP_acc_11_psp_sva_10_0(1)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(3)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(3)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(3)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(3)),
      (VEC_LOOP_acc_11_psp_sva_10_0(0)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(3)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(3)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(3)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(3)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(3)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(3)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(3)), (z_out_15(3)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(3)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(3)), (z_out_18(3)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(3)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(3)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(3)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(3)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(3)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(3)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(3)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_23 & and_dcpl_26 & and_111_nl &
      and_dcpl_31 & and_dcpl_34 & and_dcpl_39 & and_dcpl_41 & and_dcpl_42 & and_dcpl_46
      & and_dcpl_50 & and_dcpl_51 & and_dcpl_53 & and_dcpl_57 & and_dcpl_58 & and_dcpl_60
      & and_dcpl_62 & and_dcpl_63 & and_dcpl_67 & and_dcpl_69 & and_dcpl_70 & VEC_LOOP_or_23_cse
      & and_dcpl_74 & and_dcpl_76 & VEC_LOOP_or_36_cse & and_dcpl_80 & and_dcpl_84
      & and_dcpl_87 & and_dcpl_92 & and_dcpl_95 & and_dcpl_97 & and_dcpl_99));
  or_694_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR mux_tmp_383;
  mux_390_nl <= MUX_s_1_2_2(mux_tmp_389, or_694_nl, fsm_output(1));
  and_115_nl <= (NOT mux_390_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_s_1_31_2((COMP_LOOP_twiddle_f_17_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (z_out_17(2)), (VEC_LOOP_acc_1_cse_10_sva(2)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(2)),
      (VEC_LOOP_acc_11_psp_sva_10_0(1)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(2)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(2)),
      (VEC_LOOP_acc_11_psp_sva_10_0(0)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(2)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(2)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(2)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(2)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(2)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(2)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(2)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(2)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(2)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(2)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(2)), (z_out_15(2)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(2)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(2)), (z_out_18(2)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(2)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(2)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(2)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(2)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(2)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(2)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(2)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_23 & and_dcpl_26 & and_115_nl &
      and_dcpl_31 & and_dcpl_34 & and_dcpl_39 & and_dcpl_41 & and_dcpl_42 & and_dcpl_46
      & and_dcpl_50 & and_dcpl_51 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60 & and_dcpl_62
      & and_dcpl_63 & and_dcpl_67 & and_dcpl_69 & and_dcpl_70 & VEC_LOOP_or_23_cse
      & and_dcpl_74 & and_dcpl_76 & VEC_LOOP_or_36_cse & and_dcpl_80 & and_dcpl_84
      & and_dcpl_87 & and_dcpl_92 & and_dcpl_95 & and_dcpl_97 & and_dcpl_99));
  or_362_nl <= (fsm_output(2)) OR mux_tmp_391;
  mux_392_nl <= MUX_s_1_2_2(mux_tmp_389, or_362_nl, fsm_output(1));
  and_117_nl <= (NOT mux_392_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_7_nl <= MUX1HOT_s_1_30_2((COMP_LOOP_twiddle_f_17_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (z_out_17(1)), (VEC_LOOP_acc_1_cse_10_sva(1)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(1)),
      (VEC_LOOP_acc_11_psp_sva_10_0(0)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(1)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(1)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(1)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(1)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(1)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(1)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(1)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(1)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(1)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(1)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(1)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(1)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(1)), (z_out_15(1)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(1)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(1)), (z_out_18(1)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(1)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(1)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(1)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(1)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(1)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(1)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(1)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_23 & and_dcpl_26 & and_117_nl &
      and_dcpl_31 & and_dcpl_34 & and_dcpl_39 & and_dcpl_41 & and_dcpl_46 & and_dcpl_50
      & and_dcpl_51 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60 & and_dcpl_62 & and_dcpl_63
      & and_dcpl_67 & and_dcpl_69 & and_dcpl_70 & VEC_LOOP_or_23_cse & and_dcpl_74
      & and_dcpl_76 & VEC_LOOP_or_36_cse & and_dcpl_80 & and_dcpl_84 & and_dcpl_87
      & and_dcpl_92 & and_dcpl_95 & and_dcpl_97 & and_dcpl_99));
  mux_393_nl <= MUX_s_1_2_2(mux_tmp_391, mux_tmp_356, fsm_output(2));
  mux_394_nl <= MUX_s_1_2_2(mux_tmp_389, mux_393_nl, fsm_output(1));
  and_118_nl <= (NOT mux_394_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_9_nl <= MUX1HOT_s_1_29_2((COMP_LOOP_twiddle_f_17_sva(0)), (VEC_LOOP_acc_10_cse_1_sva(0)),
      (z_out_17(0)), (VEC_LOOP_acc_1_cse_10_sva(0)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(0)),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3(0)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(0)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(0)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(0)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(0)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(0)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(0)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(0)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(0)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(0)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(0)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(0)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(0)), (z_out_15(0)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(0)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(0)), (z_out_18(0)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(0)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(0)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(0)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(0)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(0)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(0)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(0)),
      STD_LOGIC_VECTOR'( and_dcpl_105 & and_dcpl_23 & and_dcpl_26 & and_118_nl &
      and_dcpl_31 & and_dcpl_39 & and_dcpl_41 & and_dcpl_46 & and_dcpl_50 & and_dcpl_51
      & and_dcpl_53 & and_dcpl_58 & and_dcpl_60 & and_dcpl_62 & and_dcpl_63 & and_dcpl_67
      & and_dcpl_69 & and_dcpl_70 & VEC_LOOP_or_23_cse & and_dcpl_74 & and_dcpl_76
      & VEC_LOOP_or_36_cse & and_dcpl_80 & and_dcpl_84 & and_dcpl_87 & and_dcpl_92
      & and_dcpl_95 & and_dcpl_97 & and_dcpl_99));
  vec_rsci_adra_d <= VEC_LOOP_mux1h_10_nl & VEC_LOOP_mux1h_8_nl & VEC_LOOP_mux1h_6_nl
      & VEC_LOOP_mux1h_4_nl & VEC_LOOP_mux1h_2_nl & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_1_nl
      & VEC_LOOP_mux1h_3_nl & VEC_LOOP_mux1h_5_nl & VEC_LOOP_mux1h_7_nl & VEC_LOOP_mux1h_9_nl;
  vec_rsci_wea_d <= vec_rsci_wea_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  twiddle_rsci_adra_d <= COMP_LOOP_twiddle_help_mux_1_rmff & COMP_LOOP_twiddle_help_mux_rmff
      & COMP_LOOP_twiddle_f_mux1h_87_rmff & COMP_LOOP_and_rmff & COMP_LOOP_twiddle_f_mux1h_57_rmff
      & COMP_LOOP_twiddle_f_mux1h_111_rmff & COMP_LOOP_twiddle_f_mux1h_128_rmff;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_adra_d <= COMP_LOOP_twiddle_help_mux_1_rmff & COMP_LOOP_twiddle_help_mux_rmff
      & COMP_LOOP_twiddle_f_mux1h_87_rmff & COMP_LOOP_and_rmff & COMP_LOOP_twiddle_f_mux1h_57_rmff
      & COMP_LOOP_twiddle_f_mux1h_111_rmff & COMP_LOOP_twiddle_f_mux1h_128_rmff;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  vec_rsci_da_d <= vec_rsci_da_d_reg;
  nor_175_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_251 <= nor_175_cse AND and_dcpl_14 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1101"));
  and_dcpl_265 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("010"));
  and_dcpl_267 <= and_dcpl_265 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("0110"))
      AND and_dcpl_11;
  and_dcpl_271 <= and_dcpl_265 AND and_dcpl_37 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("11")) AND and_dcpl_11;
  and_dcpl_276 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_37 AND and_dcpl_12 AND and_dcpl_11;
  and_dcpl_289 <= nor_175_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1010"))
      AND and_265_cse;
  and_dcpl_294 <= nor_175_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"))
      AND and_265_cse;
  and_dcpl_300 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011")) AND
      and_dcpl_29 AND and_dcpl_12 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_303 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001")));
  and_dcpl_308 <= and_dcpl_181 AND (NOT (fsm_output(8))) AND (fsm_output(5)) AND
      (NOT (fsm_output(4))) AND and_dcpl_303;
  and_dcpl_313 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001")) AND
      and_dcpl_44 AND and_dcpl_303;
  and_dcpl_316 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
  and_dcpl_320 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("010")) AND
      and_dcpl_44 AND and_dcpl_316;
  and_dcpl_324 <= and_dcpl_181 AND (fsm_output(8)) AND (NOT (fsm_output(5))) AND
      (NOT (fsm_output(4))) AND and_dcpl_316;
  and_dcpl_337 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011"));
  and_dcpl_351 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01")) AND
      and_dcpl_11;
  and_dcpl_356 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("00011"))
      AND and_dcpl_351;
  and_dcpl_363 <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)=STD_LOGIC_VECTOR'("0010111"))
      AND and_dcpl_11;
  and_dcpl_368 <= and_dcpl_265 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_351;
  and_dcpl_374 <= and_dcpl_265 AND CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("100011"));
  and_dcpl_377 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      and_265_cse;
  and_dcpl_382 <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_377;
  and_dcpl_387 <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1100"))
      AND and_265_cse;
  and_dcpl_392 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("10001"))
      AND and_dcpl_377;
  and_dcpl_423 <= and_dcpl_64 AND CONV_SL_1_1(fsm_output(6 DOWNTO 2)=STD_LOGIC_VECTOR'("00011"))
      AND and_265_cse;
  and_dcpl_429 <= and_dcpl_64 AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("110"))
      AND and_dcpl_20 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_433 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")) AND
      nor_125_cse;
  and_dcpl_436 <= and_dcpl_181 AND (fsm_output(8));
  and_dcpl_438 <= and_dcpl_436 AND and_dcpl_44 AND and_dcpl_433;
  and_dcpl_441 <= and_dcpl_12 AND and_dcpl_166;
  and_dcpl_444 <= and_dcpl_436 AND and_dcpl_37 AND and_dcpl_441;
  and_dcpl_446 <= and_237_cse_1 AND nor_125_cse;
  and_dcpl_449 <= and_dcpl_436 AND and_dcpl_29 AND and_dcpl_446;
  and_dcpl_451 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      nor_125_cse;
  and_dcpl_454 <= and_dcpl_436 AND and_dcpl_14 AND and_dcpl_451;
  and_dcpl_455 <= and_237_cse_1 AND and_dcpl_166;
  and_dcpl_458 <= and_dcpl_337 AND and_dcpl_44;
  and_dcpl_459 <= and_dcpl_458 AND and_dcpl_455;
  and_dcpl_461 <= and_dcpl_337 AND and_dcpl_37 AND and_dcpl_433;
  and_dcpl_463 <= and_dcpl_458 AND and_dcpl_176;
  and_dcpl_467 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("010")) AND
      and_dcpl_29 AND and_dcpl_433;
  and_dcpl_468 <= and_dcpl_181 AND (NOT (fsm_output(8)));
  and_dcpl_470 <= and_dcpl_468 AND and_dcpl_29 AND and_dcpl_451;
  and_dcpl_472 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001"));
  and_dcpl_473 <= and_dcpl_472 AND and_dcpl_29;
  and_dcpl_474 <= and_dcpl_473 AND and_dcpl_176;
  and_dcpl_476 <= and_dcpl_468 AND and_dcpl_37 AND and_dcpl_446;
  and_dcpl_478 <= and_dcpl_472 AND and_dcpl_14 AND and_dcpl_433;
  and_dcpl_480 <= and_dcpl_468 AND and_dcpl_44 AND and_dcpl_441;
  and_dcpl_481 <= and_dcpl_473 AND and_dcpl_455;
  and_606_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("101")) AND
      and_dcpl_14 AND and_dcpl_12 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"));
  and_dcpl_547 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("000000010")));
  and_dcpl_550 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
  and_634_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("01010")) AND
      and_dcpl_550;
  and_dcpl_568 <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)=STD_LOGIC_VECTOR'("0111111"))
      AND and_265_cse;
  and_dcpl_574 <= and_dcpl_181 AND (fsm_output(8)) AND (NOT (fsm_output(5))) AND
      (fsm_output(4)) AND (NOT (fsm_output(3))) AND (NOT (fsm_output(2))) AND and_265_cse;
  and_dcpl_635 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100"));
  and_dcpl_646 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      and_265_cse;
  and_dcpl_653 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")) AND
      and_265_cse;
  and_dcpl_658 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01")) AND
      and_265_cse;
  and_dcpl_752 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_11;
  and_dcpl_757 <= and_dcpl_15 AND (NOT (fsm_output(6))) AND and_dcpl_37 AND and_dcpl_752;
  and_dcpl_761 <= and_dcpl_48 AND and_dcpl_44 AND and_dcpl_752;
  and_dcpl_766 <= and_dcpl_77 AND and_dcpl_14 AND and_dcpl_752;
  and_dcpl_771 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_29 AND and_dcpl_752;
  and_dcpl_775 <= and_dcpl_48 AND and_dcpl_29 AND and_dcpl_351;
  and_dcpl_777 <= and_dcpl_77 AND and_dcpl_44 AND and_dcpl_351;
  and_dcpl_780 <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
  and_dcpl_782 <= and_dcpl_77 AND and_dcpl_37 AND and_dcpl_780;
  and_dcpl_785 <= and_dcpl_64 AND (NOT (fsm_output(6))) AND and_dcpl_29 AND and_dcpl_780;
  and_dcpl_787 <= and_dcpl_48 AND and_dcpl_14 AND and_dcpl_780;
  and_dcpl_804 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 4)/=STD_LOGIC_VECTOR'("00000"))
      OR (NOT and_dcpl_550));
  and_dcpl_817 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("100111010"));
  and_dcpl_820 <= and_dcpl_12 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_825 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("000")) AND
      and_dcpl_14 AND and_dcpl_820;
  and_dcpl_830 <= CONV_SL_1_1(fsm_output(8 DOWNTO 4)=STD_LOGIC_VECTOR'("01010"))
      AND and_dcpl_820;
  and_dcpl_839 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_11;
  and_dcpl_844 <= and_dcpl_16 AND and_dcpl_29 AND and_dcpl_839;
  and_dcpl_850 <= and_dcpl_48 AND and_dcpl_14 AND and_dcpl_47;
  and_dcpl_853 <= and_dcpl_48 AND and_dcpl_37 AND and_dcpl_839;
  and_dcpl_857 <= and_dcpl_65 AND and_dcpl_29 AND and_dcpl_47;
  and_dcpl_860 <= and_dcpl_65 AND and_dcpl_44 AND and_dcpl_839;
  and_937_cse <= and_dcpl_77 AND and_dcpl_37 AND and_dcpl_47;
  and_dcpl_867 <= and_dcpl_635 AND and_dcpl_14 AND and_dcpl_839;
  and_943_cse <= and_dcpl_635 AND and_dcpl_44 AND and_dcpl_47;
  and_dcpl_871 <= and_dcpl_35 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_873 <= and_dcpl_635 AND and_dcpl_29 AND and_dcpl_871;
  and_dcpl_875 <= and_dcpl_77 AND and_dcpl_14 AND and_dcpl_871;
  and_dcpl_877 <= and_dcpl_48 AND and_dcpl_44 AND and_dcpl_871;
  and_dcpl_879 <= and_dcpl_16 AND and_dcpl_37 AND and_dcpl_871;
  VEC_LOOP_or_42_ssc <= and_dcpl_568 OR and_dcpl_574;
  or_tmp_510 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"));
  or_tmp_517 <= (NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(0)));
  or_724_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0)));
  mux_tmp_957 <= MUX_s_1_2_2(or_724_nl, or_tmp_517, fsm_output(2));
  not_tmp_446 <= NOT((fsm_output(4)) AND (fsm_output(1)) AND (fsm_output(0)));
  or_tmp_523 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_524 <= (fsm_output(4)) OR (NOT and_265_cse);
  or_741_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_974 <= MUX_s_1_2_2((fsm_output(2)), or_741_nl, fsm_output(0));
  nand_tmp_21 <= NOT((fsm_output(4)) AND (NOT mux_tmp_974));
  mux_tmp_975 <= MUX_s_1_2_2(and_257_cse, (fsm_output(2)), fsm_output(0));
  or_tmp_537 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_976 <= MUX_s_1_2_2((NOT or_tmp_537), mux_tmp_975, fsm_output(4));
  or_743_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("11001"));
  mux_977_nl <= MUX_s_1_2_2((NOT mux_tmp_976), nand_tmp_21, fsm_output(3));
  mux_tmp_978 <= MUX_s_1_2_2(or_743_cse, mux_977_nl, fsm_output(6));
  or_744_nl <= (fsm_output(4)) OR (NOT mux_tmp_975);
  mux_tmp_979 <= MUX_s_1_2_2(nand_tmp_21, or_744_nl, fsm_output(3));
  mux_tmp_980 <= MUX_s_1_2_2(mux_tmp_974, or_tmp_537, fsm_output(4));
  and_tmp <= (fsm_output(3)) AND mux_tmp_976;
  or_752_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"));
  nand_51_nl <= NOT((fsm_output(3)) AND (NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")))));
  or_751_nl <= (fsm_output(3)) OR nor_125_cse;
  mux_988_nl <= MUX_s_1_2_2(nand_51_nl, or_751_nl, fsm_output(2));
  mux_989_nl <= MUX_s_1_2_2(or_752_nl, mux_988_nl, fsm_output(4));
  mux_tmp_990 <= MUX_s_1_2_2(or_743_cse, mux_989_nl, fsm_output(6));
  or_tmp_549 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("01101"));
  or_759_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"));
  nand_52_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1101")));
  mux_tmp_993 <= MUX_s_1_2_2(or_759_nl, nand_52_nl, fsm_output(4));
  mux_tmp_999 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(4));
  or_tmp_556 <= (fsm_output(3)) OR (NOT mux_tmp_999);
  or_tmp_558 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("011"));
  and_tmp_4 <= (fsm_output(3)) AND mux_tmp_999;
  or_tmp_560 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("100"));
  or_tmp_562 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("110"));
  VEC_LOOP_or_51_itm <= and_dcpl_438 OR and_dcpl_444 OR and_dcpl_449 OR and_dcpl_454
      OR and_dcpl_459 OR and_dcpl_461 OR and_dcpl_463 OR and_dcpl_467 OR and_dcpl_470
      OR and_dcpl_474 OR and_dcpl_476 OR and_dcpl_478 OR and_dcpl_480 OR and_dcpl_481;
  and_767_itm <= and_dcpl_436 AND and_dcpl_29 AND and_dcpl_653;
  and_771_itm <= and_dcpl_436 AND and_dcpl_44 AND and_dcpl_377;
  VEC_LOOP_or_46_itm <= and_dcpl_757 OR and_dcpl_761 OR and_dcpl_766 OR and_dcpl_771;
  VEC_LOOP_or_61_itm <= and_dcpl_873 OR and_dcpl_875 OR and_dcpl_877 OR and_dcpl_879;
  VEC_LOOP_nor_17_itm <= NOT(and_dcpl_873 OR and_dcpl_875 OR and_dcpl_877 OR and_dcpl_879);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        VEC_LOOP_mult_vec_1_sva <= MUX1HOT_v_32_3_2((vec_rsci_qa_d_mxwt(63 DOWNTO
            32)), (vec_rsci_qa_d_mxwt(31 DOWNTO 0)), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
            STD_LOGIC_VECTOR'( and_dcpl_199 & and_dcpl_200 & and_205_nl));
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
        reg_run_rsci_oswt_cse <= NOT(or_dcpl_161 OR or_140_cse OR CONV_SL_1_1(fsm_output(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
        reg_vec_rsci_oswt_cse <= NOT mux_306_itm;
        reg_vec_rsci_oswt_1_cse <= and_14_rmff;
        reg_twiddle_rsci_oswt_cse <= and_123_rmff;
        reg_twiddle_rsci_oswt_1_cse <= and_128_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_164 AND and_dcpl_12 AND CONV_SL_1_1(fsm_output(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND STAGE_LOOP_acc_itm_4_1;
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_168;
        reg_ensig_cgo_cse <= NOT mux_411_itm;
        reg_ensig_cgo_2_cse <= NOT mux_532_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_17 AND and_dcpl_35 AND nor_125_cse)
          OR STAGE_LOOP_i_3_0_sva_mx0c1)) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), z_out_14,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_272_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_564) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_951_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_14_5_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (z_out_23(8
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT((NOT mux_568_nl) AND and_dcpl_16))) =
          '1' ) THEN
        COMP_LOOP_1_twiddle_f_acc_cse_sva <= z_out_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_584_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_17_twiddle_f_mul_psp_sva <= MUX_v_10_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_17_twiddle_f_mul_nl),
            10)), z_out_22, and_dcpl_72);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_954_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva_12_9 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt(12
            DOWNTO 9);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(mux_956_nl OR (fsm_output(7)))) AND (NOT(CONV_SL_1_1(fsm_output(6
          DOWNTO 4)/=STD_LOGIC_VECTOR'("000")))) AND (NOT (fsm_output(8))) AND complete_rsci_wen_comp)
          = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt(8
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_599_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_twiddle_help_and_cse = '1' ) THEN
        COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt(31
            DOWNTO 0)), (twiddle_h_rsci_qa_d_mxwt(63 DOWNTO 32)), and_dcpl_190);
        COMP_LOOP_twiddle_f_1_sva <= MUX_v_32_2_2((twiddle_rsci_qa_d_mxwt(31 DOWNTO
            0)), (twiddle_rsci_qa_d_mxwt(63 DOWNTO 32)), and_dcpl_190);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_973_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_twiddle_f_17_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            VEC_LOOP_mux1h_12_nl, COMP_LOOP_twiddle_f_nand_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (and_dcpl_18 OR and_dcpl_168)) = '1' )
          THEN
        COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_18_itm <= MUX_s_1_2_2((z_out_13_18_14(4)),
            run_rsci_ivld_mxwt, and_dcpl_168);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_18 OR and_dcpl_26 OR and_dcpl_31
          OR and_dcpl_39 OR and_dcpl_41 OR and_dcpl_46 OR and_dcpl_50 OR and_dcpl_51
          OR and_dcpl_53 OR and_dcpl_58 OR and_dcpl_60 OR and_dcpl_62 OR and_dcpl_63
          OR and_dcpl_67 OR and_dcpl_69 OR and_dcpl_70 OR and_dcpl_72 OR and_dcpl_74
          OR and_dcpl_76 OR and_dcpl_79 OR and_dcpl_80 OR and_dcpl_82 OR and_dcpl_84
          OR and_dcpl_85 OR and_dcpl_87 OR and_dcpl_88 OR and_dcpl_92 OR and_dcpl_94
          OR and_dcpl_95 OR and_dcpl_97 OR and_dcpl_99 OR and_dcpl_100)) = '1' )
          THEN
        VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_14_26_2(z_out_15, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
            VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
            VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
            VEC_LOOP_acc_10_cse_9_sva_mx0w8, VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10,
            VEC_LOOP_acc_10_cse_12_sva_mx0w11, VEC_LOOP_acc_10_cse_13_sva_mx0w12,
            VEC_LOOP_acc_10_cse_14_sva_mx0w13, VEC_LOOP_acc_10_cse_15_sva_mx0w14,
            VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17,
            VEC_LOOP_acc_10_cse_19_sva_mx0w18, z_out_18, VEC_LOOP_acc_10_cse_21_sva_mx0w20,
            VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_25_sva_mx0w24,
            VEC_LOOP_acc_10_cse_27_sva_mx0w26, VEC_LOOP_acc_10_cse_29_sva_mx0w28,
            VEC_LOOP_acc_10_cse_30_sva_mx0w29, VEC_LOOP_acc_10_cse_31_sva_mx0w30,
            STD_LOGIC_VECTOR'( VEC_LOOP_or_35_nl & and_dcpl_26 & and_dcpl_31 & and_dcpl_39
            & and_dcpl_41 & and_dcpl_46 & and_dcpl_50 & and_dcpl_51 & and_dcpl_53
            & and_dcpl_58 & and_dcpl_60 & and_dcpl_62 & and_dcpl_63 & and_dcpl_67
            & and_dcpl_69 & and_dcpl_70 & and_dcpl_74 & and_dcpl_76 & VEC_LOOP_or_36_cse
            & and_dcpl_80 & and_dcpl_84 & and_dcpl_87 & and_dcpl_92 & and_dcpl_95
            & and_dcpl_97 & and_dcpl_99));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_746_nl) = '1' ) THEN
        COMP_LOOP_twiddle_help_17_sva <= MUX1HOT_v_32_3_2(z_out_21, (twiddle_h_rsci_qa_d_mxwt(63
            DOWNTO 32)), (twiddle_h_rsci_qa_d_mxwt(31 DOWNTO 0)), STD_LOGIC_VECTOR'(
            and_dcpl_18 & and_dcpl_133 & and_dcpl_195));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_199 OR and_dcpl_200)) = '1' ) THEN
        factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt(31 DOWNTO 0)), (vec_rsci_qa_d_mxwt(63
            DOWNTO 32)), and_dcpl_200);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (VEC_LOOP_acc_1_cse_10_sva_mx0c0 OR and_dcpl_26
          OR VEC_LOOP_acc_1_cse_10_sva_mx0c2 OR and_dcpl_39 OR and_dcpl_46 OR and_dcpl_51
          OR and_dcpl_58 OR and_dcpl_62 OR and_dcpl_67 OR and_dcpl_70 OR and_dcpl_74
          OR and_dcpl_79 OR and_dcpl_82 OR and_dcpl_85 OR and_dcpl_88 OR and_dcpl_94
          OR and_dcpl_97 OR and_dcpl_100)) = '1' ) THEN
        VEC_LOOP_acc_1_cse_10_sva <= MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"),
            VEC_LOOP_VEC_LOOP_mux_2_nl, VEC_LOOP_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_14_0_sva_1 <= STD_LOGIC_VECTOR'( "000000000000000");
      ELSIF ( (complete_rsci_wen_comp AND (NOT(mux_877_cse OR (NOT (fsm_output(0))))))
          = '1' ) THEN
        VEC_LOOP_j_10_14_0_sva_1 <= z_out_11;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_879_nl) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_987_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_12 <= z_out_24(12);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_998_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_11 <= MUX_s_1_2_2((z_out_24(11)), (z_out_20(11)),
            mux_885_ssc);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_1008_nl) AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
          AND complete_rsci_wen_comp) = '1' ) THEN
        VEC_LOOP_acc_11_psp_sva_10_0 <= MUX_v_11_2_2((z_out_24(10 DOWNTO 0)), (z_out_20(10
            DOWNTO 0)), VEC_LOOP_or_66_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_907_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_1(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  mux_786_nl <= MUX_s_1_2_2(mux_420_cse, mux_428_cse, fsm_output(2));
  mux_787_nl <= MUX_s_1_2_2(mux_786_nl, mux_426_cse, fsm_output(3));
  mux_791_nl <= MUX_s_1_2_2(mux_427_cse, mux_787_nl, fsm_output(1));
  and_205_nl <= (NOT mux_791_nl) AND (fsm_output(0));
  and_255_nl <= (((and_257_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")))
      AND (fsm_output(6))) OR (fsm_output(7))) AND (fsm_output(8));
  mux_272_nl <= MUX_s_1_2_2(mux_271_cse, and_255_nl, fsm_output(0));
  COMP_LOOP_k_not_nl <= NOT mux_tmp_564;
  mux_948_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(8));
  mux_949_nl <= MUX_s_1_2_2(mux_948_nl, nor_tmp_7, fsm_output(6));
  mux_947_nl <= MUX_s_1_2_2(nor_tmp_7, (fsm_output(8)), fsm_output(6));
  mux_950_nl <= MUX_s_1_2_2(mux_949_nl, mux_947_nl, or_714_cse);
  mux_nl <= MUX_s_1_2_2(nor_tmp_7, (fsm_output(8)), and_973_cse);
  mux_951_nl <= MUX_s_1_2_2(mux_950_nl, mux_nl, fsm_output(1));
  mux_566_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_483_cse);
  or_482_nl <= (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"))))
      OR (fsm_output(5));
  mux_567_nl <= MUX_s_1_2_2(mux_566_nl, or_482_nl, fsm_output(1));
  mux_565_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_480_cse);
  mux_568_nl <= MUX_s_1_2_2(mux_567_nl, mux_565_nl, fsm_output(0));
  COMP_LOOP_17_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out(9
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & '1')), 10));
  mux_582_nl <= MUX_s_1_2_2(mux_tmp_579, mux_tmp_575, fsm_output(2));
  mux_583_nl <= MUX_s_1_2_2(mux_tmp_580, mux_582_nl, fsm_output(1));
  or_488_nl <= ((and_242_cse OR (fsm_output(5))) AND (fsm_output(6))) OR (fsm_output(7));
  mux_576_nl <= MUX_s_1_2_2(or_488_nl, mux_tmp_575, fsm_output(2));
  mux_581_nl <= MUX_s_1_2_2(mux_tmp_580, mux_576_nl, fsm_output(1));
  mux_584_nl <= MUX_s_1_2_2(mux_583_nl, mux_581_nl, fsm_output(0));
  mux_953_nl <= MUX_s_1_2_2((NOT or_tmp_510), or_717_cse, fsm_output(8));
  nor_223_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(5)) OR (fsm_output(6))
      OR (fsm_output(7)));
  mux_952_nl <= MUX_s_1_2_2(nor_223_nl, or_tmp_510, fsm_output(8));
  mux_954_nl <= MUX_s_1_2_2(mux_953_nl, mux_952_nl, and_237_cse_1);
  or_769_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_770_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_955_nl <= MUX_s_1_2_2(or_769_nl, or_770_nl, fsm_output(0));
  or_771_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"));
  mux_956_nl <= MUX_s_1_2_2(mux_955_nl, or_771_nl, fsm_output(3));
  mux_597_nl <= MUX_s_1_2_2(mux_tmp_595, nor_tmp_66, or_499_cse);
  and_235_nl <= ((or_499_cse AND (fsm_output(5))) OR CONV_SL_1_1(fsm_output(7 DOWNTO
      6)/=STD_LOGIC_VECTOR'("00"))) AND (fsm_output(8));
  mux_598_nl <= MUX_s_1_2_2(mux_597_nl, and_235_nl, fsm_output(2));
  mux_596_nl <= MUX_s_1_2_2(mux_tmp_595, nor_tmp_66, or_483_cse);
  mux_599_nl <= MUX_s_1_2_2(mux_598_nl, mux_596_nl, fsm_output(1));
  or_526_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (NOT (fsm_output(5)));
  mux_663_nl <= MUX_s_1_2_2(or_526_nl, or_tmp_352, fsm_output(4));
  or_127_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  mux_662_nl <= MUX_s_1_2_2(or_127_nl, or_tmp_354, fsm_output(3));
  nand_11_nl <= NOT((fsm_output(4)) AND (NOT mux_662_nl));
  mux_664_nl <= MUX_s_1_2_2(mux_663_nl, nand_11_nl, fsm_output(2));
  or_522_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  mux_659_nl <= MUX_s_1_2_2(or_tmp_354, or_522_nl, fsm_output(3));
  mux_660_nl <= MUX_s_1_2_2(or_tmp_351, mux_659_nl, fsm_output(4));
  mux_658_nl <= MUX_s_1_2_2(or_tmp_352, or_tmp_351, fsm_output(4));
  mux_661_nl <= MUX_s_1_2_2(mux_660_nl, mux_658_nl, fsm_output(2));
  mux_665_nl <= MUX_s_1_2_2(mux_664_nl, mux_661_nl, fsm_output(1));
  or_519_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("100000"));
  mux_666_nl <= MUX_s_1_2_2(mux_665_nl, or_519_nl, fsm_output(8));
  and_197_nl <= (NOT mux_666_nl) AND (NOT (fsm_output(7))) AND (fsm_output(0));
  VEC_LOOP_mux1h_12_nl <= MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_help_17_sva, (twiddle_rsci_qa_d_mxwt(63 DOWNTO 32)), (twiddle_rsci_qa_d_mxwt(31
      DOWNTO 0)), STD_LOGIC_VECTOR'( and_197_nl & and_dcpl_125 & and_dcpl_133 & and_dcpl_195));
  COMP_LOOP_twiddle_f_nand_nl <= NOT(and_dcpl_17 AND and_dcpl_176);
  or_740_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_968_nl <= MUX_s_1_2_2(or_740_nl, or_tmp_523, fsm_output(4));
  nand_49_nl <= NOT((fsm_output(2)) AND (NOT mux_968_nl));
  mux_967_nl <= MUX_s_1_2_2(or_tmp_517, or_tmp_524, fsm_output(2));
  mux_969_nl <= MUX_s_1_2_2(nand_49_nl, mux_967_nl, fsm_output(6));
  or_739_nl <= (fsm_output(6)) OR (fsm_output(2)) OR not_tmp_446;
  mux_970_nl <= MUX_s_1_2_2(mux_969_nl, or_739_nl, fsm_output(5));
  or_768_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      (VEC_LOOP_j_10_14_0_sva_1(14))) OR mux_tmp_957;
  mux_971_nl <= MUX_s_1_2_2(mux_970_nl, or_768_nl, fsm_output(7));
  or_736_nl <= (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR (fsm_output(1)) OR (NOT (fsm_output(0)));
  or_734_nl <= (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0)));
  mux_965_nl <= MUX_s_1_2_2(or_736_nl, or_734_nl, fsm_output(6));
  or_732_nl <= (fsm_output(6)) OR (NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (NOT (fsm_output(2)))
      OR (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0)));
  mux_966_nl <= MUX_s_1_2_2(mux_965_nl, or_732_nl, fsm_output(5));
  or_737_nl <= (fsm_output(7)) OR mux_966_nl;
  mux_972_nl <= MUX_s_1_2_2(mux_971_nl, or_737_nl, fsm_output(8));
  mux_960_nl <= MUX_s_1_2_2(or_tmp_523, (NOT and_265_cse), fsm_output(4));
  mux_961_nl <= MUX_s_1_2_2(or_tmp_524, mux_960_nl, fsm_output(2));
  mux_959_nl <= MUX_s_1_2_2(not_tmp_446, or_tmp_517, fsm_output(2));
  mux_962_nl <= MUX_s_1_2_2(mux_961_nl, mux_959_nl, fsm_output(6));
  or_727_nl <= (fsm_output(6)) OR mux_tmp_957;
  mux_963_nl <= MUX_s_1_2_2(mux_962_nl, or_727_nl, fsm_output(5));
  nor_220_nl <= NOT((NOT (VEC_LOOP_j_10_14_0_sva_1(14))) OR (NOT (fsm_output(2)))
      OR (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0))));
  and_970_nl <= (VEC_LOOP_j_10_14_0_sva_1(14)) AND (NOT mux_tmp_957);
  mux_958_nl <= MUX_s_1_2_2(nor_220_nl, and_970_nl, fsm_output(6));
  nand_47_nl <= NOT((fsm_output(5)) AND mux_958_nl);
  mux_964_nl <= MUX_s_1_2_2(mux_963_nl, nand_47_nl, fsm_output(7));
  or_730_nl <= (fsm_output(8)) OR mux_964_nl;
  mux_973_nl <= MUX_s_1_2_2(mux_972_nl, or_730_nl, fsm_output(3));
  VEC_LOOP_or_35_nl <= and_dcpl_18 OR and_dcpl_72 OR and_dcpl_88 OR and_dcpl_94;
  mux_744_nl <= MUX_s_1_2_2(mux_tmp_724, mux_tmp_735, fsm_output(5));
  or_561_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("010"));
  mux_741_nl <= MUX_s_1_2_2(mux_tmp_721, mux_tmp_719, or_561_nl);
  mux_738_nl <= MUX_s_1_2_2(or_tmp_387, or_tmp_37, fsm_output(4));
  mux_739_nl <= MUX_s_1_2_2(mux_738_nl, mux_tmp_722, fsm_output(3));
  nor_87_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10")));
  mux_737_nl <= MUX_s_1_2_2(mux_tmp_719, or_tmp_387, nor_87_nl);
  mux_740_nl <= MUX_s_1_2_2(mux_739_nl, mux_737_nl, fsm_output(2));
  mux_742_nl <= MUX_s_1_2_2(mux_741_nl, mux_740_nl, VEC_LOOP_j_10_14_0_sva_1(14));
  mux_732_nl <= MUX_s_1_2_2(mux_266_cse, or_tmp_36, fsm_output(6));
  mux_733_nl <= MUX_s_1_2_2(mux_732_nl, mux_594_cse, or_559_cse);
  mux_730_nl <= MUX_s_1_2_2(or_tmp_380, mux_594_cse, fsm_output(4));
  mux_728_nl <= MUX_s_1_2_2(or_558_cse, (fsm_output(8)), fsm_output(6));
  mux_727_nl <= MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output(6));
  mux_729_nl <= MUX_s_1_2_2(mux_728_nl, mux_727_nl, fsm_output(4));
  mux_731_nl <= MUX_s_1_2_2(mux_730_nl, mux_729_nl, fsm_output(3));
  mux_734_nl <= MUX_s_1_2_2(mux_733_nl, mux_731_nl, fsm_output(2));
  mux_736_nl <= MUX_s_1_2_2(mux_tmp_735, mux_734_nl, VEC_LOOP_j_10_14_0_sva_1(14));
  mux_743_nl <= MUX_s_1_2_2(mux_742_nl, mux_736_nl, fsm_output(5));
  mux_745_nl <= MUX_s_1_2_2(mux_744_nl, mux_743_nl, fsm_output(0));
  mux_720_nl <= MUX_s_1_2_2(mux_tmp_719, mux_594_cse, fsm_output(4));
  mux_723_nl <= MUX_s_1_2_2(mux_tmp_722, mux_720_nl, fsm_output(3));
  mux_725_nl <= MUX_s_1_2_2(mux_tmp_724, mux_723_nl, fsm_output(2));
  mux_717_nl <= MUX_s_1_2_2(mux_594_cse, or_tmp_380, and_242_cse);
  mux_726_nl <= MUX_s_1_2_2(mux_725_nl, mux_717_nl, fsm_output(5));
  mux_746_nl <= MUX_s_1_2_2(mux_745_nl, mux_726_nl, fsm_output(1));
  VEC_LOOP_VEC_LOOP_mux_2_nl <= MUX_v_14_2_2(z_out_17, (VEC_LOOP_j_10_14_0_sva_1(13
      DOWNTO 0)), VEC_LOOP_acc_1_cse_10_sva_mx0c2);
  VEC_LOOP_not_nl <= NOT VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  mux_588_nl <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), or_717_cse);
  or_637_nl <= (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"))))
      OR (fsm_output(8));
  mux_878_nl <= MUX_s_1_2_2(mux_588_nl, or_637_nl, fsm_output(4));
  or_635_nl <= (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"))))
      OR (fsm_output(8));
  mux_879_nl <= MUX_s_1_2_2(mux_878_nl, or_635_nl, fsm_output(3));
  mux_984_nl <= MUX_s_1_2_2(mux_tmp_979, (NOT and_tmp), fsm_output(6));
  mux_985_nl <= MUX_s_1_2_2(mux_tmp_978, mux_984_nl, fsm_output(5));
  or_749_nl <= (fsm_output(6)) OR (NOT and_tmp);
  or_748_nl <= (fsm_output(6)) OR (fsm_output(3)) OR mux_tmp_980;
  mux_983_nl <= MUX_s_1_2_2(or_749_nl, or_748_nl, fsm_output(5));
  mux_986_nl <= MUX_s_1_2_2(mux_985_nl, mux_983_nl, fsm_output(8));
  or_745_nl <= (fsm_output(3)) OR mux_tmp_980;
  mux_981_nl <= MUX_s_1_2_2(or_745_nl, mux_tmp_979, fsm_output(6));
  mux_982_nl <= MUX_s_1_2_2(mux_981_nl, mux_tmp_978, fsm_output(5));
  or_746_nl <= (fsm_output(8)) OR mux_982_nl;
  mux_987_nl <= MUX_s_1_2_2(mux_986_nl, or_746_nl, fsm_output(7));
  mux_995_nl <= MUX_s_1_2_2(or_tmp_549, mux_tmp_993, fsm_output(6));
  mux_996_nl <= MUX_s_1_2_2(mux_tmp_990, mux_995_nl, fsm_output(5));
  or_760_nl <= (fsm_output(6)) OR mux_tmp_993;
  or_757_nl <= (fsm_output(6)) OR (NOT (fsm_output(4))) OR (fsm_output(2)) OR (fsm_output(3))
      OR (NOT (fsm_output(0))) OR (fsm_output(1));
  mux_994_nl <= MUX_s_1_2_2(or_760_nl, or_757_nl, fsm_output(5));
  mux_997_nl <= MUX_s_1_2_2(mux_996_nl, mux_994_nl, fsm_output(8));
  or_755_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("10001"));
  mux_991_nl <= MUX_s_1_2_2(or_755_nl, or_tmp_549, fsm_output(6));
  mux_992_nl <= MUX_s_1_2_2(mux_991_nl, mux_tmp_990, fsm_output(5));
  or_756_nl <= (fsm_output(8)) OR mux_992_nl;
  mux_998_nl <= MUX_s_1_2_2(mux_997_nl, or_756_nl, fsm_output(7));
  mux_571_nl <= MUX_s_1_2_2(or_tmp_173, mux_tmp_570, fsm_output(1));
  mux_585_nl <= MUX_s_1_2_2(mux_tmp_570, or_tmp_174, fsm_output(1));
  mux_886_nl <= MUX_s_1_2_2(mux_571_nl, mux_585_nl, fsm_output(0));
  VEC_LOOP_or_66_nl <= mux_885_ssc OR ((NOT mux_886_nl) AND xor_dcpl AND (NOT (fsm_output(8)))
      AND (fsm_output(6)) AND (fsm_output(4)));
  mux_1005_nl <= MUX_s_1_2_2(or_tmp_562, or_tmp_558, fsm_output(5));
  mux_1004_nl <= MUX_s_1_2_2(or_tmp_560, or_tmp_562, fsm_output(5));
  mux_1006_nl <= MUX_s_1_2_2(mux_1005_nl, mux_1004_nl, fsm_output(7));
  mux_1003_nl <= MUX_s_1_2_2((NOT and_tmp_4), or_tmp_560, fsm_output(5));
  or_766_nl <= (fsm_output(7)) OR mux_1003_nl;
  mux_1007_nl <= MUX_s_1_2_2(mux_1006_nl, or_766_nl, fsm_output(8));
  mux_1001_nl <= MUX_s_1_2_2(or_tmp_556, (NOT and_tmp_4), fsm_output(5));
  mux_1000_nl <= MUX_s_1_2_2(or_tmp_558, or_tmp_556, fsm_output(5));
  mux_1002_nl <= MUX_s_1_2_2(mux_1001_nl, mux_1000_nl, fsm_output(7));
  or_764_nl <= (fsm_output(8)) OR mux_1002_nl;
  mux_1008_nl <= MUX_s_1_2_2(mux_1007_nl, or_764_nl, fsm_output(6));
  mux_905_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  mux_906_nl <= MUX_s_1_2_2(and_dcpl_181, mux_905_nl, fsm_output(5));
  and_217_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  mux_904_nl <= MUX_s_1_2_2(and_dcpl_181, and_217_nl, fsm_output(5));
  mux_907_nl <= MUX_s_1_2_2(mux_906_nl, mux_904_nl, or_480_cse);
  COMP_LOOP_twiddle_f_mux_11_nl <= MUX_v_14_2_2(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1,
      ('0' & COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1), and_dcpl_251);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_2_nl <= (COMP_LOOP_k_14_5_sva_8_0(8))
      AND (NOT and_dcpl_251);
  COMP_LOOP_twiddle_f_mux_12_nl <= MUX_v_8_2_2((COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO
      0)), (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 1)), and_dcpl_251);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl <= (COMP_LOOP_k_14_5_sva_8_0(0))
      AND and_dcpl_251;
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_mux_11_nl)
      * UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_2_nl & COMP_LOOP_twiddle_f_mux_12_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl & STD_LOGIC_VECTOR'( "0001"))),
      14));
  COMP_LOOP_twiddle_f_or_41_nl <= and_dcpl_267 OR and_dcpl_271;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'(
      "01"), STD_LOGIC_VECTOR'( "10"), COMP_LOOP_twiddle_f_or_41_nl);
  COMP_LOOP_twiddle_f_or_40_nl <= MUX_v_2_2_2(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl,
      STD_LOGIC_VECTOR'("11"), and_dcpl_276);
  COMP_LOOP_twiddle_f_or_42_nl <= (NOT and_dcpl_267) OR (CONV_SL_1_1(fsm_output(8
      DOWNTO 6)=STD_LOGIC_VECTOR'("001")) AND and_dcpl_37 AND and_dcpl_12 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"))) OR and_dcpl_271 OR and_dcpl_276;
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & COMP_LOOP_twiddle_f_or_40_nl & and_dcpl_276
      & COMP_LOOP_twiddle_f_or_42_nl & '1')), 14));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl <= (NOT((nor_175_cse AND and_dcpl_29
      AND and_dcpl_12 AND and_265_cse) OR and_dcpl_289 OR and_dcpl_294)) OR and_dcpl_300;
  COMP_LOOP_twiddle_f_mux_13_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'(
      "10"), and_dcpl_289);
  COMP_LOOP_twiddle_f_or_43_nl <= and_dcpl_294 OR and_dcpl_300;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl <= MUX_v_2_2_2(COMP_LOOP_twiddle_f_mux_13_nl,
      STD_LOGIC_VECTOR'("11"), COMP_LOOP_twiddle_f_or_43_nl);
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl
      & '0' & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl & '1')), 14));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl <= (NOT(and_dcpl_308 OR and_dcpl_313))
      OR and_dcpl_320 OR and_dcpl_324;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl <= (NOT(and_dcpl_308 OR and_dcpl_320))
      OR and_dcpl_313 OR and_dcpl_324;
  z_out_5_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_5_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl & '1')), 12));
  and_977_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001")) AND
      and_dcpl_29 AND and_dcpl_35 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_978_nl <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_47;
  and_979_nl <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"))
      AND and_dcpl_11;
  and_980_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_29 AND and_dcpl_47;
  COMP_LOOP_twiddle_f_mux1h_296_nl <= MUX1HOT_v_4_4_2(STD_LOGIC_VECTOR'( "0100"),
      STD_LOGIC_VECTOR'( "1010"), STD_LOGIC_VECTOR'( "1101"), STD_LOGIC_VECTOR'(
      "1110"), STD_LOGIC_VECTOR'( and_977_nl & and_978_nl & and_979_nl & and_980_nl));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & COMP_LOOP_twiddle_f_mux1h_296_nl & '1')),
      14));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl <= (NOT(and_dcpl_356 OR and_dcpl_363
      OR and_dcpl_368)) OR and_dcpl_374;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl <= (NOT(and_dcpl_356 OR and_dcpl_374))
      OR and_dcpl_363 OR and_dcpl_368;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl <= (NOT(and_dcpl_363 OR and_dcpl_374))
      OR and_dcpl_356 OR and_dcpl_368;
  z_out_7_12_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_12_9
      & COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl & '1')), 13));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl <= (NOT and_dcpl_382) OR and_dcpl_387
      OR and_dcpl_392;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl <= (NOT and_dcpl_387) OR and_dcpl_382
      OR and_dcpl_392;
  z_out_8_12_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_12_9
      & COMP_LOOP_3_twiddle_f_lshift_ncse_sva_8_0) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0
      & '1' & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl
      & '1')), 13));
  and_981_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("011011111"));
  z_out_9_10_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_9_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & and_981_nl & '1')), 11));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl <= (NOT((CONV_SL_1_1(fsm_output(8
      DOWNTO 4)=STD_LOGIC_VECTOR'("00111")) AND and_dcpl_20 AND and_265_cse) OR and_dcpl_423))
      OR and_dcpl_429;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl <= (NOT and_dcpl_429) OR and_dcpl_423;
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_2_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl
      & '1' & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl & and_dcpl_423 & '1')),
      14));
  VEC_LOOP_VEC_LOOP_or_15_nl <= (STAGE_LOOP_lshift_psp_sva(14)) OR and_dcpl_438 OR
      and_dcpl_444 OR and_dcpl_449 OR and_dcpl_454 OR and_dcpl_459 OR and_dcpl_461
      OR and_dcpl_463 OR and_dcpl_467 OR and_dcpl_470 OR and_dcpl_474 OR and_dcpl_476
      OR and_dcpl_478 OR and_dcpl_480 OR and_dcpl_481;
  VEC_LOOP_VEC_LOOP_mux_14_nl <= MUX_v_14_2_2((STAGE_LOOP_lshift_psp_sva(13 DOWNTO
      0)), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1))), VEC_LOOP_or_51_itm);
  VEC_LOOP_or_67_nl <= (NOT((NOT mux_877_cse) AND (fsm_output(0)))) OR and_dcpl_438
      OR and_dcpl_444 OR and_dcpl_449 OR and_dcpl_454 OR and_dcpl_459 OR and_dcpl_461
      OR and_dcpl_463 OR and_dcpl_467 OR and_dcpl_470 OR and_dcpl_474 OR and_dcpl_476
      OR and_dcpl_478 OR and_dcpl_480 OR and_dcpl_481;
  VEC_LOOP_VEC_LOOP_mux_15_nl <= MUX_v_9_2_2((VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO
      5)), COMP_LOOP_k_14_5_sva_8_0, VEC_LOOP_or_51_itm);
  VEC_LOOP_VEC_LOOP_or_16_nl <= ((VEC_LOOP_acc_1_cse_10_sva(4)) AND (NOT(and_dcpl_467
      OR and_dcpl_470 OR and_dcpl_474 OR and_dcpl_476 OR and_dcpl_478 OR and_dcpl_480
      OR and_dcpl_481))) OR and_dcpl_438 OR and_dcpl_444 OR and_dcpl_449 OR and_dcpl_454
      OR and_dcpl_459 OR and_dcpl_461 OR and_dcpl_463;
  VEC_LOOP_VEC_LOOP_or_17_nl <= ((VEC_LOOP_acc_1_cse_10_sva(3)) AND (NOT(and_dcpl_461
      OR and_dcpl_470 OR and_dcpl_476 OR and_dcpl_478 OR and_dcpl_480))) OR and_dcpl_438
      OR and_dcpl_444 OR and_dcpl_449 OR and_dcpl_454 OR and_dcpl_459 OR and_dcpl_463
      OR and_dcpl_467 OR and_dcpl_474 OR and_dcpl_481;
  VEC_LOOP_VEC_LOOP_or_18_nl <= ((VEC_LOOP_acc_1_cse_10_sva(2)) AND (NOT(and_dcpl_454
      OR and_dcpl_459 OR and_dcpl_463 OR and_dcpl_470 OR and_dcpl_474 OR and_dcpl_481)))
      OR and_dcpl_438 OR and_dcpl_444 OR and_dcpl_449 OR and_dcpl_461 OR and_dcpl_467
      OR and_dcpl_476 OR and_dcpl_478 OR and_dcpl_480;
  VEC_LOOP_VEC_LOOP_or_19_nl <= ((VEC_LOOP_acc_1_cse_10_sva(1)) AND (NOT(and_dcpl_444
      OR and_dcpl_449 OR and_dcpl_459 OR and_dcpl_463 OR and_dcpl_474 OR and_dcpl_476
      OR and_dcpl_480 OR and_dcpl_481))) OR and_dcpl_438 OR and_dcpl_454 OR and_dcpl_461
      OR and_dcpl_467 OR and_dcpl_470 OR and_dcpl_478;
  VEC_LOOP_VEC_LOOP_or_20_nl <= ((VEC_LOOP_acc_1_cse_10_sva(0)) AND (NOT(and_dcpl_438
      OR and_dcpl_449 OR and_dcpl_454 OR and_dcpl_461 OR and_dcpl_463 OR and_dcpl_467
      OR and_dcpl_470 OR and_dcpl_474 OR and_dcpl_476 OR and_dcpl_478))) OR and_dcpl_444
      OR and_dcpl_459 OR and_dcpl_480 OR and_dcpl_481;
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_15_nl &
      VEC_LOOP_VEC_LOOP_mux_14_nl & VEC_LOOP_or_67_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_15_nl
      & VEC_LOOP_VEC_LOOP_or_16_nl & VEC_LOOP_VEC_LOOP_or_17_nl & VEC_LOOP_VEC_LOOP_or_18_nl
      & VEC_LOOP_VEC_LOOP_or_19_nl & VEC_LOOP_VEC_LOOP_or_20_nl & '1'), 15), 16),
      16));
  z_out_11 <= acc_nl(15 DOWNTO 1);
  and_983_nl <= and_dcpl_65 AND and_dcpl_44 AND and_dcpl_451;
  and_984_nl <= and_dcpl_71 AND and_dcpl_455;
  and_985_nl <= and_dcpl_71 AND and_dcpl_12 AND nor_125_cse;
  and_986_nl <= and_dcpl_48 AND and_dcpl_44 AND and_dcpl_446;
  and_987_nl <= and_dcpl_77 AND and_dcpl_14 AND and_dcpl_446;
  and_988_nl <= and_dcpl_65 AND and_dcpl_14 AND and_dcpl_441;
  and_989_nl <= and_dcpl_77 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_441;
  and_990_nl <= and_dcpl_48 AND and_dcpl_37 AND and_dcpl_451;
  and_991_nl <= and_dcpl_15 AND (NOT (fsm_output(6))) AND and_dcpl_14 AND and_dcpl_455;
  COMP_LOOP_mux1h_5_nl <= MUX1HOT_v_5_9_2(STD_LOGIC_VECTOR'( "10010"), STD_LOGIC_VECTOR'(
      "10001"), STD_LOGIC_VECTOR'( "10000"), STD_LOGIC_VECTOR'( "01100"), STD_LOGIC_VECTOR'(
      "10100"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'( "10101"), STD_LOGIC_VECTOR'(
      "01010"), STD_LOGIC_VECTOR'( "00001"), STD_LOGIC_VECTOR'( and_983_nl & and_984_nl
      & and_985_nl & and_986_nl & and_987_nl & and_988_nl & and_989_nl & and_990_nl
      & and_991_nl));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(14
      DOWNTO 1))) & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_14_5_sva_8_0
      & COMP_LOOP_mux1h_5_nl & '1'), 15), 16), 16));
  z_out_12_14 <= acc_1_nl(15);
  VEC_LOOP_mux_5_nl <= MUX_v_18_2_2((z_out_21(31 DOWNTO 14)), (STD_LOGIC_VECTOR'(
      "000") & z_out_23 & STD_LOGIC_VECTOR'( "00000")), and_606_cse);
  VEC_LOOP_or_68_nl <= (NOT(nor_175_cse AND and_dcpl_14 AND and_dcpl_12 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")))) OR and_606_cse;
  VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl <= NOT(MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"),
      (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1)), and_606_cse));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_5_nl
      & VEC_LOOP_or_68_nl), 19), 20) + CONV_UNSIGNED(CONV_SIGNED(SIGNED('1' & VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl
      & '1'), 16), 20), 20));
  z_out_13_18_14 <= acc_2_nl(19 DOWNTO 15);
  STAGE_LOOP_mux_4_nl <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (NOT STAGE_LOOP_i_3_0_sva),
      and_dcpl_547);
  z_out_14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_4_nl) + CONV_UNSIGNED(CONV_SIGNED(SIGNED'(
      and_dcpl_547 & '1'), 2), 4), 4));
  and_992_nl <= and_dcpl_181 AND (NOT (fsm_output(8))) AND and_dcpl_14 AND and_dcpl_550;
  VEC_LOOP_mux1h_47_nl <= MUX1HOT_v_10_3_2(((z_out_23(8 DOWNTO 0)) & (STAGE_LOOP_lshift_psp_sva(5))),
      z_out_23, (z_out_19(13 DOWNTO 4)), STD_LOGIC_VECTOR'( and_992_nl & and_634_cse
      & VEC_LOOP_or_42_ssc));
  VEC_LOOP_VEC_LOOP_mux_16_nl <= MUX_v_4_2_2((STAGE_LOOP_lshift_psp_sva(4 DOWNTO
      1)), (z_out_19(3 DOWNTO 0)), VEC_LOOP_or_42_ssc);
  VEC_LOOP_or_69_nl <= and_634_cse OR and_dcpl_568 OR and_dcpl_574;
  VEC_LOOP_mux_6_nl <= MUX_v_14_2_2((COMP_LOOP_twiddle_f_17_sva(13 DOWNTO 0)), VEC_LOOP_acc_1_cse_10_sva,
      VEC_LOOP_or_69_nl);
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_47_nl & VEC_LOOP_VEC_LOOP_mux_16_nl)
      + UNSIGNED(VEC_LOOP_mux_6_nl), 14));
  and_993_nl <= and_dcpl_16 AND and_dcpl_14 AND and_dcpl_25;
  and_994_nl <= and_dcpl_16 AND and_dcpl_29 AND and_dcpl_28;
  and_995_nl <= and_dcpl_16 AND and_dcpl_44 AND and_dcpl_43;
  and_996_nl <= and_dcpl_48 AND and_dcpl_37 AND and_dcpl_28;
  and_997_nl <= and_dcpl_65 AND and_dcpl_14 AND and_dcpl_43;
  and_998_nl <= and_dcpl_65 AND and_dcpl_37 AND and_dcpl_25;
  and_999_nl <= and_dcpl_65 AND and_dcpl_44 AND and_dcpl_28;
  and_1000_nl <= and_dcpl_77 AND and_dcpl_14 AND and_dcpl_40;
  and_1001_nl <= and_dcpl_77 AND and_dcpl_44 AND and_dcpl_13;
  and_1002_nl <= and_dcpl_635 AND and_dcpl_14 AND and_dcpl_28;
  and_1003_nl <= and_dcpl_635 AND and_dcpl_29 AND and_dcpl_40;
  and_1004_nl <= and_dcpl_635 AND and_dcpl_37 AND and_dcpl_43;
  VEC_LOOP_mux1h_48_nl <= MUX1HOT_v_5_24_2(STD_LOGIC_VECTOR'( "00001"), STD_LOGIC_VECTOR'(
      "00010"), STD_LOGIC_VECTOR'( "00011"), STD_LOGIC_VECTOR'( "00100"), STD_LOGIC_VECTOR'(
      "00101"), STD_LOGIC_VECTOR'( "00110"), STD_LOGIC_VECTOR'( "00111"), STD_LOGIC_VECTOR'(
      "01000"), STD_LOGIC_VECTOR'( "01001"), STD_LOGIC_VECTOR'( "01010"), STD_LOGIC_VECTOR'(
      "01011"), STD_LOGIC_VECTOR'( "01100"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'(
      "01110"), STD_LOGIC_VECTOR'( "01111"), STD_LOGIC_VECTOR'( "10001"), STD_LOGIC_VECTOR'(
      "10010"), STD_LOGIC_VECTOR'( "10100"), STD_LOGIC_VECTOR'( "10110"), STD_LOGIC_VECTOR'(
      "11000"), STD_LOGIC_VECTOR'( "11010"), STD_LOGIC_VECTOR'( "11100"), STD_LOGIC_VECTOR'(
      "11101"), STD_LOGIC_VECTOR'( "11110"), STD_LOGIC_VECTOR'( and_993_nl & and_994_nl
      & and_dcpl_39 & and_dcpl_41 & and_995_nl & and_dcpl_50 & and_dcpl_51 & and_dcpl_53
      & and_dcpl_58 & and_996_nl & and_dcpl_62 & and_dcpl_63 & and_997_nl & and_dcpl_69
      & and_dcpl_70 & and_998_nl & and_999_nl & and_1000_nl & and_937_cse & and_1001_nl
      & and_1002_nl & and_1003_nl & and_1004_nl & and_943_cse));
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 &
      VEC_LOOP_mux1h_48_nl) + UNSIGNED(STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1)), 14));
  and_1005_nl <= and_dcpl_468 AND and_dcpl_37 AND and_dcpl_653;
  and_1006_nl <= and_dcpl_468 AND and_dcpl_44 AND and_dcpl_658;
  and_1007_nl <= and_dcpl_472 AND and_dcpl_14 AND and_dcpl_377;
  and_1008_nl <= and_dcpl_472 AND and_dcpl_29 AND and_dcpl_646;
  and_1009_nl <= and_dcpl_472 AND and_dcpl_44 AND and_dcpl_653;
  and_1010_nl <= and_dcpl_265 AND and_dcpl_14 AND and_dcpl_658;
  and_1011_nl <= and_dcpl_265 AND and_dcpl_29 AND and_dcpl_377;
  and_1012_nl <= and_dcpl_265 AND and_dcpl_37 AND and_dcpl_646;
  and_1013_nl <= and_dcpl_337 AND and_dcpl_14 AND and_dcpl_653;
  and_1014_nl <= and_dcpl_337 AND and_dcpl_29 AND and_dcpl_658;
  and_1015_nl <= and_dcpl_337 AND and_dcpl_37 AND and_dcpl_377;
  and_1016_nl <= and_dcpl_337 AND and_dcpl_44 AND and_dcpl_646;
  and_1017_nl <= and_dcpl_436 AND and_dcpl_37 AND and_dcpl_658;
  VEC_LOOP_mux1h_49_nl <= MUX1HOT_v_4_14_2(STD_LOGIC_VECTOR'( "1110"), STD_LOGIC_VECTOR'(
      "1101"), STD_LOGIC_VECTOR'( "1100"), STD_LOGIC_VECTOR'( "1011"), STD_LOGIC_VECTOR'(
      "1010"), STD_LOGIC_VECTOR'( "1001"), STD_LOGIC_VECTOR'( "1000"), STD_LOGIC_VECTOR'(
      "0111"), STD_LOGIC_VECTOR'( "0110"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'(
      "0100"), STD_LOGIC_VECTOR'( "0011"), STD_LOGIC_VECTOR'( "0010"), STD_LOGIC_VECTOR'(
      "0001"), STD_LOGIC_VECTOR'( and_1005_nl & and_1006_nl & and_1007_nl & and_1008_nl
      & and_1009_nl & and_1010_nl & and_1011_nl & and_1012_nl & and_1013_nl & and_1014_nl
      & and_1015_nl & and_1016_nl & and_767_itm & and_1017_nl));
  and_1018_nl <= and_dcpl_468 AND and_dcpl_14 AND and_dcpl_646;
  VEC_LOOP_nor_27_nl <= NOT(MUX_v_4_2_2(VEC_LOOP_mux1h_49_nl, STD_LOGIC_VECTOR'("1111"),
      and_1018_nl));
  VEC_LOOP_or_70_nl <= MUX_v_4_2_2(VEC_LOOP_nor_27_nl, STD_LOGIC_VECTOR'("1111"),
      and_771_itm);
  z_out_17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_1_cse_10_sva)
      + UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & VEC_LOOP_or_70_nl & '1'), 14));
  z_out_18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_19) + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva),
      14));
  and_1019_nl <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_653;
  and_1020_nl <= and_dcpl_337 AND and_dcpl_29 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("01")) AND and_265_cse;
  and_1021_nl <= and_dcpl_337 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_377;
  and_1022_nl <= and_dcpl_337 AND and_dcpl_44 AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("11")) AND and_265_cse;
  VEC_LOOP_mux1h_50_nl <= MUX1HOT_v_3_5_2(STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
      "010"), STD_LOGIC_VECTOR'( "011"), STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'(
      "101"), STD_LOGIC_VECTOR'( and_1019_nl & and_1020_nl & and_1021_nl & and_1022_nl
      & and_767_itm));
  VEC_LOOP_or_71_nl <= MUX_v_3_2_2(VEC_LOOP_mux1h_50_nl, STD_LOGIC_VECTOR'("111"),
      and_771_itm);
  z_out_19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 &
      '1' & VEC_LOOP_or_71_nl & '1') + UNSIGNED(STAGE_LOOP_lshift_psp_sva(14 DOWNTO
      1)), 14));
  VEC_LOOP_VEC_LOOP_or_21_nl <= ((VEC_LOOP_acc_1_cse_10_sva(13)) AND (NOT(and_dcpl_775
      OR and_dcpl_777 OR and_dcpl_785))) OR and_dcpl_782 OR and_dcpl_787;
  VEC_LOOP_or_72_nl <= and_dcpl_775 OR and_dcpl_777;
  VEC_LOOP_or_73_nl <= and_dcpl_782 OR and_dcpl_787;
  VEC_LOOP_mux1h_51_nl <= MUX1HOT_v_11_4_2((VEC_LOOP_acc_1_cse_10_sva(12 DOWNTO 2)),
      (VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO 3)), (NOT (STAGE_LOOP_lshift_psp_sva(14
      DOWNTO 4))), ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 5)))), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_46_itm & VEC_LOOP_or_72_nl & VEC_LOOP_or_73_nl & and_dcpl_785));
  VEC_LOOP_or_74_nl <= (NOT(and_dcpl_757 OR and_dcpl_761 OR and_dcpl_766 OR and_dcpl_771
      OR and_dcpl_775 OR and_dcpl_777)) OR and_dcpl_782 OR and_dcpl_785 OR and_dcpl_787;
  VEC_LOOP_and_24_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND (NOT(and_dcpl_775 OR and_dcpl_777
      OR and_dcpl_782 OR and_dcpl_785 OR and_dcpl_787));
  VEC_LOOP_or_75_nl <= and_dcpl_775 OR and_dcpl_777 OR and_dcpl_782 OR and_dcpl_787;
  VEC_LOOP_mux1h_52_nl <= MUX1HOT_v_8_3_2((COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO 0)),
      (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 1)), ('0' & (COMP_LOOP_k_14_5_sva_8_0(8
      DOWNTO 2))), STD_LOGIC_VECTOR'( VEC_LOOP_or_46_itm & VEC_LOOP_or_75_nl & and_dcpl_785));
  VEC_LOOP_VEC_LOOP_mux_17_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)),
      and_dcpl_785);
  VEC_LOOP_or_76_nl <= (VEC_LOOP_VEC_LOOP_mux_17_nl AND (NOT(and_dcpl_757 OR and_dcpl_761)))
      OR and_dcpl_766 OR and_dcpl_771;
  VEC_LOOP_VEC_LOOP_or_22_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_757
      OR and_dcpl_766 OR and_dcpl_775 OR and_dcpl_787))) OR and_dcpl_761 OR and_dcpl_771
      OR and_dcpl_777 OR and_dcpl_782;
  VEC_LOOP_VEC_LOOP_or_23_nl <= (NOT(and_dcpl_782 OR and_dcpl_787 OR and_dcpl_785))
      OR and_dcpl_757 OR and_dcpl_761 OR and_dcpl_766 OR and_dcpl_771 OR and_dcpl_775
      OR and_dcpl_777;
  acc_9_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_21_nl
      & VEC_LOOP_mux1h_51_nl & VEC_LOOP_or_74_nl) + UNSIGNED(VEC_LOOP_and_24_nl &
      VEC_LOOP_mux1h_52_nl & VEC_LOOP_or_76_nl & VEC_LOOP_VEC_LOOP_or_22_nl & VEC_LOOP_VEC_LOOP_or_23_nl
      & '1'), 13));
  z_out_20 <= acc_9_nl(12 DOWNTO 1);
  VEC_LOOP_mux_7_nl <= MUX_v_32_2_2(COMP_LOOP_twiddle_f_17_sva, factor1_1_sva, nor_179_cse);
  VEC_LOOP_or_77_nl <= (NOT(nor_175_cse AND and_dcpl_14 AND CONV_SL_1_1(fsm_output(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("0101")))) OR nor_179_cse;
  VEC_LOOP_mux_8_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "00000000000000000") & STAGE_LOOP_lshift_psp_sva),
      (NOT COMP_LOOP_1_mult_cmp_return_rsc_z), nor_179_cse);
  acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_7_nl & VEC_LOOP_or_77_nl)
      + UNSIGNED(VEC_LOOP_mux_8_nl & '1'), 33));
  z_out_21 <= acc_10_nl(32 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_or_24_nl <= ((VEC_LOOP_acc_1_cse_10_sva(13)) AND (NOT and_dcpl_804))
      OR and_dcpl_817;
  VEC_LOOP_mux1h_53_nl <= MUX1HOT_v_9_3_2((COMP_LOOP_twiddle_f_17_sva(13 DOWNTO 5)),
      (VEC_LOOP_acc_1_cse_10_sva(12 DOWNTO 4)), (NOT (STAGE_LOOP_lshift_psp_sva(14
      DOWNTO 6))), STD_LOGIC_VECTOR'( and_dcpl_804 & and_634_cse & and_dcpl_817));
  VEC_LOOP_or_78_nl <= (NOT(and_dcpl_804 OR and_634_cse)) OR and_dcpl_817;
  VEC_LOOP_VEC_LOOP_and_2_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND (NOT(and_dcpl_804
      OR and_dcpl_817));
  VEC_LOOP_VEC_LOOP_mux_18_nl <= MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ((COMP_LOOP_k_14_5_sva_8_0(7
      DOWNTO 0)) & '1'), and_634_cse);
  acc_11_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_24_nl
      & VEC_LOOP_mux1h_53_nl & VEC_LOOP_or_78_nl) + UNSIGNED(VEC_LOOP_VEC_LOOP_and_2_nl
      & VEC_LOOP_VEC_LOOP_mux_18_nl & '1'), 11));
  z_out_22 <= acc_11_nl(10 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_and_3_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND (NOT(and_dcpl_825
      OR and_606_cse));
  VEC_LOOP_VEC_LOOP_mux_19_nl <= MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ((COMP_LOOP_k_14_5_sva_8_0(7
      DOWNTO 0)) & '1'), and_dcpl_830);
  VEC_LOOP_mux1h_54_nl <= MUX1HOT_v_10_3_2(('0' & (STAGE_LOOP_lshift_psp_sva(14 DOWNTO
      6))), (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 5)), STD_LOGIC_VECTOR'( "0000000001"),
      STD_LOGIC_VECTOR'( and_dcpl_825 & and_dcpl_830 & and_606_cse));
  z_out_23 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_and_3_nl
      & VEC_LOOP_VEC_LOOP_mux_19_nl) + UNSIGNED(VEC_LOOP_mux1h_54_nl), 10));
  VEC_LOOP_VEC_LOOP_or_25_nl <= (VEC_LOOP_acc_1_cse_10_sva(13)) OR and_dcpl_873 OR
      and_dcpl_875 OR and_dcpl_877 OR and_dcpl_879;
  VEC_LOOP_VEC_LOOP_mux_20_nl <= MUX_v_12_2_2((VEC_LOOP_acc_1_cse_10_sva(12 DOWNTO
      1)), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 3))), VEC_LOOP_or_61_itm);
  VEC_LOOP_or_79_nl <= (NOT(and_dcpl_844 OR and_dcpl_850 OR and_dcpl_853 OR and_dcpl_857
      OR and_dcpl_860 OR and_937_cse OR and_dcpl_867 OR and_943_cse)) OR and_dcpl_873
      OR and_dcpl_875 OR and_dcpl_877 OR and_dcpl_879;
  VEC_LOOP_and_28_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND VEC_LOOP_nor_17_itm;
  VEC_LOOP_VEC_LOOP_mux_21_nl <= MUX_v_8_2_2((COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO 0)),
      (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO 1)), VEC_LOOP_or_61_itm);
  VEC_LOOP_or_80_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_844 OR and_dcpl_850
      OR and_dcpl_853 OR and_dcpl_857))) OR and_dcpl_860 OR and_937_cse OR and_dcpl_867
      OR and_943_cse;
  VEC_LOOP_VEC_LOOP_or_26_nl <= (NOT(and_dcpl_844 OR and_dcpl_850 OR and_dcpl_860
      OR and_937_cse OR and_dcpl_877 OR and_dcpl_879)) OR and_dcpl_853 OR and_dcpl_857
      OR and_dcpl_867 OR and_943_cse OR and_dcpl_873 OR and_dcpl_875;
  VEC_LOOP_VEC_LOOP_or_27_nl <= (NOT(and_dcpl_844 OR and_dcpl_853 OR and_dcpl_860
      OR and_dcpl_867 OR and_dcpl_875 OR and_dcpl_879)) OR and_dcpl_850 OR and_dcpl_857
      OR and_937_cse OR and_943_cse OR and_dcpl_873 OR and_dcpl_877;
  VEC_LOOP_VEC_LOOP_or_28_nl <= VEC_LOOP_nor_17_itm OR and_dcpl_844 OR and_dcpl_850
      OR and_dcpl_853 OR and_dcpl_857 OR and_dcpl_860 OR and_937_cse OR and_dcpl_867
      OR and_943_cse;
  acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_25_nl
      & VEC_LOOP_VEC_LOOP_mux_20_nl & VEC_LOOP_or_79_nl) + UNSIGNED(VEC_LOOP_and_28_nl
      & VEC_LOOP_VEC_LOOP_mux_21_nl & VEC_LOOP_or_80_nl & VEC_LOOP_VEC_LOOP_or_26_nl
      & VEC_LOOP_VEC_LOOP_or_27_nl & VEC_LOOP_VEC_LOOP_or_28_nl & '1'), 14));
  z_out_24 <= acc_13_nl(13 DOWNTO 1);
END v7;

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

ARCHITECTURE v7 OF inPlaceNTT_DIT_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      twiddle_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
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
      (27 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_precomp_core_inst_twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR
      (27 DOWNTO 0);
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
  twiddle_rsci_adra_d_1 <= twiddle_rsci_adra_d;
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

END v7;



