
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

--------> ../td_ccore_solutions/mult_a1e233277d0d5c0cfe721a9995382bef70e4_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Mon Sep 13 21:49:27 2021
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
      rscid => 7,
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
      rscid => 8,
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
      rscid => 9,
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
      rscid => 10,
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
      rscid => 11,
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
      rscid => 19,
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




--------> ../td_ccore_solutions/modulo_sub_221cc38820a0941d4772a0cf032267436375_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Mon Sep 13 21:49:28 2021
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




--------> ../td_ccore_solutions/modulo_add_8b3f96d27942dd35d77cd1e313d6ead560ec_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Mon Sep 13 21:49:29 2021
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
  SIGNAL acc_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
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
            32)), acc_nl(33));
      END IF;
    END IF;
  END PROCESS;
  qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(base_rsci_idat) - UNSIGNED(m_rsci_idat),
      32));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(m_rsci_idat),
      32), 34) - CONV_UNSIGNED(CONV_SIGNED(SIGNED(base_rsci_idat), 32), 34), 34));
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
--  Generated date: Thu Sep 16 00:07:54 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    clkr : IN STD_LOGIC;
    clkr_en : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_core_fsm
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


ENTITY inPlaceNTT_DIF_precomp_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    main_C_0_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
    COMP_LOOP_5_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_6_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
    COMP_LOOP_7_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
    COMP_LOOP_8_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
    COMP_LOOP_9_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_10_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
    COMP_LOOP_11_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
    COMP_LOOP_12_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
    COMP_LOOP_13_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
    COMP_LOOP_14_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
    COMP_LOOP_15_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
    COMP_LOOP_16_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
    COMP_LOOP_17_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
    COMP_LOOP_18_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
    COMP_LOOP_19_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
    COMP_LOOP_20_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
    COMP_LOOP_21_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
    COMP_LOOP_22_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_23_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
    COMP_LOOP_24_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
    COMP_LOOP_25_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
    COMP_LOOP_26_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
    COMP_LOOP_27_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
    COMP_LOOP_28_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
    COMP_LOOP_29_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
    COMP_LOOP_30_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
    COMP_LOOP_31_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
    COMP_LOOP_32_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_34_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_core_fsm;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIF_precomp_core_core_fsm_1
  TYPE inPlaceNTT_DIF_precomp_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_1_VEC_LOOP_C_0, COMP_LOOP_1_VEC_LOOP_C_1,
      COMP_LOOP_1_VEC_LOOP_C_2, COMP_LOOP_1_VEC_LOOP_C_3, COMP_LOOP_1_VEC_LOOP_C_4,
      COMP_LOOP_1_VEC_LOOP_C_5, COMP_LOOP_1_VEC_LOOP_C_6, COMP_LOOP_1_VEC_LOOP_C_7,
      COMP_LOOP_C_3, COMP_LOOP_2_VEC_LOOP_C_0, COMP_LOOP_2_VEC_LOOP_C_1, COMP_LOOP_2_VEC_LOOP_C_2,
      COMP_LOOP_2_VEC_LOOP_C_3, COMP_LOOP_2_VEC_LOOP_C_4, COMP_LOOP_2_VEC_LOOP_C_5,
      COMP_LOOP_2_VEC_LOOP_C_6, COMP_LOOP_2_VEC_LOOP_C_7, COMP_LOOP_C_4, COMP_LOOP_3_VEC_LOOP_C_0,
      COMP_LOOP_3_VEC_LOOP_C_1, COMP_LOOP_3_VEC_LOOP_C_2, COMP_LOOP_3_VEC_LOOP_C_3,
      COMP_LOOP_3_VEC_LOOP_C_4, COMP_LOOP_3_VEC_LOOP_C_5, COMP_LOOP_3_VEC_LOOP_C_6,
      COMP_LOOP_3_VEC_LOOP_C_7, COMP_LOOP_C_5, COMP_LOOP_4_VEC_LOOP_C_0, COMP_LOOP_4_VEC_LOOP_C_1,
      COMP_LOOP_4_VEC_LOOP_C_2, COMP_LOOP_4_VEC_LOOP_C_3, COMP_LOOP_4_VEC_LOOP_C_4,
      COMP_LOOP_4_VEC_LOOP_C_5, COMP_LOOP_4_VEC_LOOP_C_6, COMP_LOOP_4_VEC_LOOP_C_7,
      COMP_LOOP_C_6, COMP_LOOP_5_VEC_LOOP_C_0, COMP_LOOP_5_VEC_LOOP_C_1, COMP_LOOP_5_VEC_LOOP_C_2,
      COMP_LOOP_5_VEC_LOOP_C_3, COMP_LOOP_5_VEC_LOOP_C_4, COMP_LOOP_5_VEC_LOOP_C_5,
      COMP_LOOP_5_VEC_LOOP_C_6, COMP_LOOP_5_VEC_LOOP_C_7, COMP_LOOP_C_7, COMP_LOOP_6_VEC_LOOP_C_0,
      COMP_LOOP_6_VEC_LOOP_C_1, COMP_LOOP_6_VEC_LOOP_C_2, COMP_LOOP_6_VEC_LOOP_C_3,
      COMP_LOOP_6_VEC_LOOP_C_4, COMP_LOOP_6_VEC_LOOP_C_5, COMP_LOOP_6_VEC_LOOP_C_6,
      COMP_LOOP_6_VEC_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_7_VEC_LOOP_C_0, COMP_LOOP_7_VEC_LOOP_C_1,
      COMP_LOOP_7_VEC_LOOP_C_2, COMP_LOOP_7_VEC_LOOP_C_3, COMP_LOOP_7_VEC_LOOP_C_4,
      COMP_LOOP_7_VEC_LOOP_C_5, COMP_LOOP_7_VEC_LOOP_C_6, COMP_LOOP_7_VEC_LOOP_C_7,
      COMP_LOOP_C_9, COMP_LOOP_8_VEC_LOOP_C_0, COMP_LOOP_8_VEC_LOOP_C_1, COMP_LOOP_8_VEC_LOOP_C_2,
      COMP_LOOP_8_VEC_LOOP_C_3, COMP_LOOP_8_VEC_LOOP_C_4, COMP_LOOP_8_VEC_LOOP_C_5,
      COMP_LOOP_8_VEC_LOOP_C_6, COMP_LOOP_8_VEC_LOOP_C_7, COMP_LOOP_C_10, COMP_LOOP_9_VEC_LOOP_C_0,
      COMP_LOOP_9_VEC_LOOP_C_1, COMP_LOOP_9_VEC_LOOP_C_2, COMP_LOOP_9_VEC_LOOP_C_3,
      COMP_LOOP_9_VEC_LOOP_C_4, COMP_LOOP_9_VEC_LOOP_C_5, COMP_LOOP_9_VEC_LOOP_C_6,
      COMP_LOOP_9_VEC_LOOP_C_7, COMP_LOOP_C_11, COMP_LOOP_10_VEC_LOOP_C_0, COMP_LOOP_10_VEC_LOOP_C_1,
      COMP_LOOP_10_VEC_LOOP_C_2, COMP_LOOP_10_VEC_LOOP_C_3, COMP_LOOP_10_VEC_LOOP_C_4,
      COMP_LOOP_10_VEC_LOOP_C_5, COMP_LOOP_10_VEC_LOOP_C_6, COMP_LOOP_10_VEC_LOOP_C_7,
      COMP_LOOP_C_12, COMP_LOOP_11_VEC_LOOP_C_0, COMP_LOOP_11_VEC_LOOP_C_1, COMP_LOOP_11_VEC_LOOP_C_2,
      COMP_LOOP_11_VEC_LOOP_C_3, COMP_LOOP_11_VEC_LOOP_C_4, COMP_LOOP_11_VEC_LOOP_C_5,
      COMP_LOOP_11_VEC_LOOP_C_6, COMP_LOOP_11_VEC_LOOP_C_7, COMP_LOOP_C_13, COMP_LOOP_12_VEC_LOOP_C_0,
      COMP_LOOP_12_VEC_LOOP_C_1, COMP_LOOP_12_VEC_LOOP_C_2, COMP_LOOP_12_VEC_LOOP_C_3,
      COMP_LOOP_12_VEC_LOOP_C_4, COMP_LOOP_12_VEC_LOOP_C_5, COMP_LOOP_12_VEC_LOOP_C_6,
      COMP_LOOP_12_VEC_LOOP_C_7, COMP_LOOP_C_14, COMP_LOOP_13_VEC_LOOP_C_0, COMP_LOOP_13_VEC_LOOP_C_1,
      COMP_LOOP_13_VEC_LOOP_C_2, COMP_LOOP_13_VEC_LOOP_C_3, COMP_LOOP_13_VEC_LOOP_C_4,
      COMP_LOOP_13_VEC_LOOP_C_5, COMP_LOOP_13_VEC_LOOP_C_6, COMP_LOOP_13_VEC_LOOP_C_7,
      COMP_LOOP_C_15, COMP_LOOP_14_VEC_LOOP_C_0, COMP_LOOP_14_VEC_LOOP_C_1, COMP_LOOP_14_VEC_LOOP_C_2,
      COMP_LOOP_14_VEC_LOOP_C_3, COMP_LOOP_14_VEC_LOOP_C_4, COMP_LOOP_14_VEC_LOOP_C_5,
      COMP_LOOP_14_VEC_LOOP_C_6, COMP_LOOP_14_VEC_LOOP_C_7, COMP_LOOP_C_16, COMP_LOOP_15_VEC_LOOP_C_0,
      COMP_LOOP_15_VEC_LOOP_C_1, COMP_LOOP_15_VEC_LOOP_C_2, COMP_LOOP_15_VEC_LOOP_C_3,
      COMP_LOOP_15_VEC_LOOP_C_4, COMP_LOOP_15_VEC_LOOP_C_5, COMP_LOOP_15_VEC_LOOP_C_6,
      COMP_LOOP_15_VEC_LOOP_C_7, COMP_LOOP_C_17, COMP_LOOP_16_VEC_LOOP_C_0, COMP_LOOP_16_VEC_LOOP_C_1,
      COMP_LOOP_16_VEC_LOOP_C_2, COMP_LOOP_16_VEC_LOOP_C_3, COMP_LOOP_16_VEC_LOOP_C_4,
      COMP_LOOP_16_VEC_LOOP_C_5, COMP_LOOP_16_VEC_LOOP_C_6, COMP_LOOP_16_VEC_LOOP_C_7,
      COMP_LOOP_C_18, COMP_LOOP_17_VEC_LOOP_C_0, COMP_LOOP_17_VEC_LOOP_C_1, COMP_LOOP_17_VEC_LOOP_C_2,
      COMP_LOOP_17_VEC_LOOP_C_3, COMP_LOOP_17_VEC_LOOP_C_4, COMP_LOOP_17_VEC_LOOP_C_5,
      COMP_LOOP_17_VEC_LOOP_C_6, COMP_LOOP_17_VEC_LOOP_C_7, COMP_LOOP_C_19, COMP_LOOP_18_VEC_LOOP_C_0,
      COMP_LOOP_18_VEC_LOOP_C_1, COMP_LOOP_18_VEC_LOOP_C_2, COMP_LOOP_18_VEC_LOOP_C_3,
      COMP_LOOP_18_VEC_LOOP_C_4, COMP_LOOP_18_VEC_LOOP_C_5, COMP_LOOP_18_VEC_LOOP_C_6,
      COMP_LOOP_18_VEC_LOOP_C_7, COMP_LOOP_C_20, COMP_LOOP_19_VEC_LOOP_C_0, COMP_LOOP_19_VEC_LOOP_C_1,
      COMP_LOOP_19_VEC_LOOP_C_2, COMP_LOOP_19_VEC_LOOP_C_3, COMP_LOOP_19_VEC_LOOP_C_4,
      COMP_LOOP_19_VEC_LOOP_C_5, COMP_LOOP_19_VEC_LOOP_C_6, COMP_LOOP_19_VEC_LOOP_C_7,
      COMP_LOOP_C_21, COMP_LOOP_20_VEC_LOOP_C_0, COMP_LOOP_20_VEC_LOOP_C_1, COMP_LOOP_20_VEC_LOOP_C_2,
      COMP_LOOP_20_VEC_LOOP_C_3, COMP_LOOP_20_VEC_LOOP_C_4, COMP_LOOP_20_VEC_LOOP_C_5,
      COMP_LOOP_20_VEC_LOOP_C_6, COMP_LOOP_20_VEC_LOOP_C_7, COMP_LOOP_C_22, COMP_LOOP_21_VEC_LOOP_C_0,
      COMP_LOOP_21_VEC_LOOP_C_1, COMP_LOOP_21_VEC_LOOP_C_2, COMP_LOOP_21_VEC_LOOP_C_3,
      COMP_LOOP_21_VEC_LOOP_C_4, COMP_LOOP_21_VEC_LOOP_C_5, COMP_LOOP_21_VEC_LOOP_C_6,
      COMP_LOOP_21_VEC_LOOP_C_7, COMP_LOOP_C_23, COMP_LOOP_22_VEC_LOOP_C_0, COMP_LOOP_22_VEC_LOOP_C_1,
      COMP_LOOP_22_VEC_LOOP_C_2, COMP_LOOP_22_VEC_LOOP_C_3, COMP_LOOP_22_VEC_LOOP_C_4,
      COMP_LOOP_22_VEC_LOOP_C_5, COMP_LOOP_22_VEC_LOOP_C_6, COMP_LOOP_22_VEC_LOOP_C_7,
      COMP_LOOP_C_24, COMP_LOOP_23_VEC_LOOP_C_0, COMP_LOOP_23_VEC_LOOP_C_1, COMP_LOOP_23_VEC_LOOP_C_2,
      COMP_LOOP_23_VEC_LOOP_C_3, COMP_LOOP_23_VEC_LOOP_C_4, COMP_LOOP_23_VEC_LOOP_C_5,
      COMP_LOOP_23_VEC_LOOP_C_6, COMP_LOOP_23_VEC_LOOP_C_7, COMP_LOOP_C_25, COMP_LOOP_24_VEC_LOOP_C_0,
      COMP_LOOP_24_VEC_LOOP_C_1, COMP_LOOP_24_VEC_LOOP_C_2, COMP_LOOP_24_VEC_LOOP_C_3,
      COMP_LOOP_24_VEC_LOOP_C_4, COMP_LOOP_24_VEC_LOOP_C_5, COMP_LOOP_24_VEC_LOOP_C_6,
      COMP_LOOP_24_VEC_LOOP_C_7, COMP_LOOP_C_26, COMP_LOOP_25_VEC_LOOP_C_0, COMP_LOOP_25_VEC_LOOP_C_1,
      COMP_LOOP_25_VEC_LOOP_C_2, COMP_LOOP_25_VEC_LOOP_C_3, COMP_LOOP_25_VEC_LOOP_C_4,
      COMP_LOOP_25_VEC_LOOP_C_5, COMP_LOOP_25_VEC_LOOP_C_6, COMP_LOOP_25_VEC_LOOP_C_7,
      COMP_LOOP_C_27, COMP_LOOP_26_VEC_LOOP_C_0, COMP_LOOP_26_VEC_LOOP_C_1, COMP_LOOP_26_VEC_LOOP_C_2,
      COMP_LOOP_26_VEC_LOOP_C_3, COMP_LOOP_26_VEC_LOOP_C_4, COMP_LOOP_26_VEC_LOOP_C_5,
      COMP_LOOP_26_VEC_LOOP_C_6, COMP_LOOP_26_VEC_LOOP_C_7, COMP_LOOP_C_28, COMP_LOOP_27_VEC_LOOP_C_0,
      COMP_LOOP_27_VEC_LOOP_C_1, COMP_LOOP_27_VEC_LOOP_C_2, COMP_LOOP_27_VEC_LOOP_C_3,
      COMP_LOOP_27_VEC_LOOP_C_4, COMP_LOOP_27_VEC_LOOP_C_5, COMP_LOOP_27_VEC_LOOP_C_6,
      COMP_LOOP_27_VEC_LOOP_C_7, COMP_LOOP_C_29, COMP_LOOP_28_VEC_LOOP_C_0, COMP_LOOP_28_VEC_LOOP_C_1,
      COMP_LOOP_28_VEC_LOOP_C_2, COMP_LOOP_28_VEC_LOOP_C_3, COMP_LOOP_28_VEC_LOOP_C_4,
      COMP_LOOP_28_VEC_LOOP_C_5, COMP_LOOP_28_VEC_LOOP_C_6, COMP_LOOP_28_VEC_LOOP_C_7,
      COMP_LOOP_C_30, COMP_LOOP_29_VEC_LOOP_C_0, COMP_LOOP_29_VEC_LOOP_C_1, COMP_LOOP_29_VEC_LOOP_C_2,
      COMP_LOOP_29_VEC_LOOP_C_3, COMP_LOOP_29_VEC_LOOP_C_4, COMP_LOOP_29_VEC_LOOP_C_5,
      COMP_LOOP_29_VEC_LOOP_C_6, COMP_LOOP_29_VEC_LOOP_C_7, COMP_LOOP_C_31, COMP_LOOP_30_VEC_LOOP_C_0,
      COMP_LOOP_30_VEC_LOOP_C_1, COMP_LOOP_30_VEC_LOOP_C_2, COMP_LOOP_30_VEC_LOOP_C_3,
      COMP_LOOP_30_VEC_LOOP_C_4, COMP_LOOP_30_VEC_LOOP_C_5, COMP_LOOP_30_VEC_LOOP_C_6,
      COMP_LOOP_30_VEC_LOOP_C_7, COMP_LOOP_C_32, COMP_LOOP_31_VEC_LOOP_C_0, COMP_LOOP_31_VEC_LOOP_C_1,
      COMP_LOOP_31_VEC_LOOP_C_2, COMP_LOOP_31_VEC_LOOP_C_3, COMP_LOOP_31_VEC_LOOP_C_4,
      COMP_LOOP_31_VEC_LOOP_C_5, COMP_LOOP_31_VEC_LOOP_C_6, COMP_LOOP_31_VEC_LOOP_C_7,
      COMP_LOOP_C_33, COMP_LOOP_32_VEC_LOOP_C_0, COMP_LOOP_32_VEC_LOOP_C_1, COMP_LOOP_32_VEC_LOOP_C_2,
      COMP_LOOP_32_VEC_LOOP_C_3, COMP_LOOP_32_VEC_LOOP_C_4, COMP_LOOP_32_VEC_LOOP_C_5,
      COMP_LOOP_32_VEC_LOOP_C_6, COMP_LOOP_32_VEC_LOOP_C_7, COMP_LOOP_C_34, STAGE_LOOP_C_1,
      main_C_1, main_C_2);

  SIGNAL state_var : inPlaceNTT_DIF_precomp_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIF_precomp_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIF_precomp_core_core_fsm_1 : PROCESS (main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_3_tr0, COMP_LOOP_2_VEC_LOOP_C_7_tr0, COMP_LOOP_C_4_tr0, COMP_LOOP_3_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_5_tr0, COMP_LOOP_4_VEC_LOOP_C_7_tr0, COMP_LOOP_C_6_tr0, COMP_LOOP_5_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_7_tr0, COMP_LOOP_6_VEC_LOOP_C_7_tr0, COMP_LOOP_C_8_tr0, COMP_LOOP_7_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_9_tr0, COMP_LOOP_8_VEC_LOOP_C_7_tr0, COMP_LOOP_C_10_tr0, COMP_LOOP_9_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_11_tr0, COMP_LOOP_10_VEC_LOOP_C_7_tr0, COMP_LOOP_C_12_tr0, COMP_LOOP_11_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_13_tr0, COMP_LOOP_12_VEC_LOOP_C_7_tr0, COMP_LOOP_C_14_tr0, COMP_LOOP_13_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_15_tr0, COMP_LOOP_14_VEC_LOOP_C_7_tr0, COMP_LOOP_C_16_tr0, COMP_LOOP_15_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_17_tr0, COMP_LOOP_16_VEC_LOOP_C_7_tr0, COMP_LOOP_C_18_tr0, COMP_LOOP_17_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_19_tr0, COMP_LOOP_18_VEC_LOOP_C_7_tr0, COMP_LOOP_C_20_tr0, COMP_LOOP_19_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_21_tr0, COMP_LOOP_20_VEC_LOOP_C_7_tr0, COMP_LOOP_C_22_tr0, COMP_LOOP_21_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_23_tr0, COMP_LOOP_22_VEC_LOOP_C_7_tr0, COMP_LOOP_C_24_tr0, COMP_LOOP_23_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_25_tr0, COMP_LOOP_24_VEC_LOOP_C_7_tr0, COMP_LOOP_C_26_tr0, COMP_LOOP_25_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_27_tr0, COMP_LOOP_26_VEC_LOOP_C_7_tr0, COMP_LOOP_C_28_tr0, COMP_LOOP_27_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_29_tr0, COMP_LOOP_28_VEC_LOOP_C_7_tr0, COMP_LOOP_C_30_tr0, COMP_LOOP_29_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_31_tr0, COMP_LOOP_30_VEC_LOOP_C_7_tr0, COMP_LOOP_C_32_tr0, COMP_LOOP_31_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_33_tr0, COMP_LOOP_32_VEC_LOOP_C_7_tr0, COMP_LOOP_C_34_tr0, STAGE_LOOP_C_1_tr0,
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
        IF ( COMP_LOOP_1_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_3;
        ELSE
          state_var_NS <= COMP_LOOP_1_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        IF ( COMP_LOOP_C_3_tr0 = '1' ) THEN
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
        IF ( COMP_LOOP_2_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_4;
        ELSE
          state_var_NS <= COMP_LOOP_2_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        IF ( COMP_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_3_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_1;
      WHEN COMP_LOOP_3_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_2;
      WHEN COMP_LOOP_3_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_3;
      WHEN COMP_LOOP_3_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_4;
      WHEN COMP_LOOP_3_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_5;
      WHEN COMP_LOOP_3_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_6;
      WHEN COMP_LOOP_3_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_7;
      WHEN COMP_LOOP_3_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        IF ( COMP_LOOP_3_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_5;
        ELSE
          state_var_NS <= COMP_LOOP_3_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        IF ( COMP_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_4_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_1;
      WHEN COMP_LOOP_4_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_2;
      WHEN COMP_LOOP_4_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_3;
      WHEN COMP_LOOP_4_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_4;
      WHEN COMP_LOOP_4_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_5;
      WHEN COMP_LOOP_4_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_6;
      WHEN COMP_LOOP_4_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_7;
      WHEN COMP_LOOP_4_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        IF ( COMP_LOOP_4_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_4_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        IF ( COMP_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_5_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_1;
      WHEN COMP_LOOP_5_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_2;
      WHEN COMP_LOOP_5_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_3;
      WHEN COMP_LOOP_5_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_4;
      WHEN COMP_LOOP_5_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_5;
      WHEN COMP_LOOP_5_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_6;
      WHEN COMP_LOOP_5_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_7;
      WHEN COMP_LOOP_5_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        IF ( COMP_LOOP_5_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_7;
        ELSE
          state_var_NS <= COMP_LOOP_5_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        IF ( COMP_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_6_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_1;
      WHEN COMP_LOOP_6_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_2;
      WHEN COMP_LOOP_6_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_3;
      WHEN COMP_LOOP_6_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_4;
      WHEN COMP_LOOP_6_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_5;
      WHEN COMP_LOOP_6_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_6;
      WHEN COMP_LOOP_6_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_7;
      WHEN COMP_LOOP_6_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        IF ( COMP_LOOP_6_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_6_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        IF ( COMP_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_7_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_1;
      WHEN COMP_LOOP_7_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_2;
      WHEN COMP_LOOP_7_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_3;
      WHEN COMP_LOOP_7_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_4;
      WHEN COMP_LOOP_7_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_5;
      WHEN COMP_LOOP_7_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_6;
      WHEN COMP_LOOP_7_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_7;
      WHEN COMP_LOOP_7_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        IF ( COMP_LOOP_7_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_7_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        IF ( COMP_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_8_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_1;
      WHEN COMP_LOOP_8_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_2;
      WHEN COMP_LOOP_8_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_3;
      WHEN COMP_LOOP_8_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_4;
      WHEN COMP_LOOP_8_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_5;
      WHEN COMP_LOOP_8_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_6;
      WHEN COMP_LOOP_8_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_7;
      WHEN COMP_LOOP_8_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        IF ( COMP_LOOP_8_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_10;
        ELSE
          state_var_NS <= COMP_LOOP_8_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        IF ( COMP_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_9_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_1;
      WHEN COMP_LOOP_9_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_2;
      WHEN COMP_LOOP_9_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_3;
      WHEN COMP_LOOP_9_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_4;
      WHEN COMP_LOOP_9_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_5;
      WHEN COMP_LOOP_9_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_6;
      WHEN COMP_LOOP_9_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_7;
      WHEN COMP_LOOP_9_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        IF ( COMP_LOOP_9_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_9_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        IF ( COMP_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_10_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_1;
      WHEN COMP_LOOP_10_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_2;
      WHEN COMP_LOOP_10_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_3;
      WHEN COMP_LOOP_10_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_4;
      WHEN COMP_LOOP_10_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_5;
      WHEN COMP_LOOP_10_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_6;
      WHEN COMP_LOOP_10_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_7;
      WHEN COMP_LOOP_10_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        IF ( COMP_LOOP_10_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_12;
        ELSE
          state_var_NS <= COMP_LOOP_10_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        IF ( COMP_LOOP_C_12_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_11_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_1;
      WHEN COMP_LOOP_11_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_2;
      WHEN COMP_LOOP_11_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_3;
      WHEN COMP_LOOP_11_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_4;
      WHEN COMP_LOOP_11_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_5;
      WHEN COMP_LOOP_11_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_6;
      WHEN COMP_LOOP_11_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_7;
      WHEN COMP_LOOP_11_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        IF ( COMP_LOOP_11_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_13;
        ELSE
          state_var_NS <= COMP_LOOP_11_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        IF ( COMP_LOOP_C_13_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_12_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_1;
      WHEN COMP_LOOP_12_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_2;
      WHEN COMP_LOOP_12_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_3;
      WHEN COMP_LOOP_12_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_4;
      WHEN COMP_LOOP_12_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_5;
      WHEN COMP_LOOP_12_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_6;
      WHEN COMP_LOOP_12_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_7;
      WHEN COMP_LOOP_12_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        IF ( COMP_LOOP_12_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_14;
        ELSE
          state_var_NS <= COMP_LOOP_12_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        IF ( COMP_LOOP_C_14_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_13_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_1;
      WHEN COMP_LOOP_13_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_2;
      WHEN COMP_LOOP_13_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_3;
      WHEN COMP_LOOP_13_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_4;
      WHEN COMP_LOOP_13_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_5;
      WHEN COMP_LOOP_13_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_6;
      WHEN COMP_LOOP_13_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_7;
      WHEN COMP_LOOP_13_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        IF ( COMP_LOOP_13_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_15;
        ELSE
          state_var_NS <= COMP_LOOP_13_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        IF ( COMP_LOOP_C_15_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_14_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_1;
      WHEN COMP_LOOP_14_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_2;
      WHEN COMP_LOOP_14_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_3;
      WHEN COMP_LOOP_14_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_4;
      WHEN COMP_LOOP_14_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_5;
      WHEN COMP_LOOP_14_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_6;
      WHEN COMP_LOOP_14_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_7;
      WHEN COMP_LOOP_14_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        IF ( COMP_LOOP_14_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_16;
        ELSE
          state_var_NS <= COMP_LOOP_14_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        IF ( COMP_LOOP_C_16_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_15_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_1;
      WHEN COMP_LOOP_15_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_2;
      WHEN COMP_LOOP_15_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_3;
      WHEN COMP_LOOP_15_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_4;
      WHEN COMP_LOOP_15_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_5;
      WHEN COMP_LOOP_15_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_6;
      WHEN COMP_LOOP_15_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_7;
      WHEN COMP_LOOP_15_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        IF ( COMP_LOOP_15_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_15_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        IF ( COMP_LOOP_C_17_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_16_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_1;
      WHEN COMP_LOOP_16_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_2;
      WHEN COMP_LOOP_16_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_3;
      WHEN COMP_LOOP_16_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_4;
      WHEN COMP_LOOP_16_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_5;
      WHEN COMP_LOOP_16_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_6;
      WHEN COMP_LOOP_16_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_7;
      WHEN COMP_LOOP_16_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        IF ( COMP_LOOP_16_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_18;
        ELSE
          state_var_NS <= COMP_LOOP_16_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        IF ( COMP_LOOP_C_18_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_17_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_1;
      WHEN COMP_LOOP_17_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_2;
      WHEN COMP_LOOP_17_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_3;
      WHEN COMP_LOOP_17_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_4;
      WHEN COMP_LOOP_17_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_5;
      WHEN COMP_LOOP_17_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_6;
      WHEN COMP_LOOP_17_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_7;
      WHEN COMP_LOOP_17_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        IF ( COMP_LOOP_17_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_19;
        ELSE
          state_var_NS <= COMP_LOOP_17_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        IF ( COMP_LOOP_C_19_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_18_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_1;
      WHEN COMP_LOOP_18_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_2;
      WHEN COMP_LOOP_18_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_3;
      WHEN COMP_LOOP_18_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_4;
      WHEN COMP_LOOP_18_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_5;
      WHEN COMP_LOOP_18_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_6;
      WHEN COMP_LOOP_18_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_7;
      WHEN COMP_LOOP_18_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        IF ( COMP_LOOP_18_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_20;
        ELSE
          state_var_NS <= COMP_LOOP_18_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        IF ( COMP_LOOP_C_20_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_19_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_1;
      WHEN COMP_LOOP_19_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_2;
      WHEN COMP_LOOP_19_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_3;
      WHEN COMP_LOOP_19_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_4;
      WHEN COMP_LOOP_19_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_5;
      WHEN COMP_LOOP_19_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_6;
      WHEN COMP_LOOP_19_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_7;
      WHEN COMP_LOOP_19_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        IF ( COMP_LOOP_19_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_21;
        ELSE
          state_var_NS <= COMP_LOOP_19_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        IF ( COMP_LOOP_C_21_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_20_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_1;
      WHEN COMP_LOOP_20_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_2;
      WHEN COMP_LOOP_20_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_3;
      WHEN COMP_LOOP_20_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_4;
      WHEN COMP_LOOP_20_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_5;
      WHEN COMP_LOOP_20_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_6;
      WHEN COMP_LOOP_20_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_7;
      WHEN COMP_LOOP_20_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        IF ( COMP_LOOP_20_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_22;
        ELSE
          state_var_NS <= COMP_LOOP_20_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        IF ( COMP_LOOP_C_22_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_21_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_1;
      WHEN COMP_LOOP_21_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_2;
      WHEN COMP_LOOP_21_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_3;
      WHEN COMP_LOOP_21_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_4;
      WHEN COMP_LOOP_21_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_5;
      WHEN COMP_LOOP_21_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_6;
      WHEN COMP_LOOP_21_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_7;
      WHEN COMP_LOOP_21_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        IF ( COMP_LOOP_21_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_23;
        ELSE
          state_var_NS <= COMP_LOOP_21_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        IF ( COMP_LOOP_C_23_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_22_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_1;
      WHEN COMP_LOOP_22_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_2;
      WHEN COMP_LOOP_22_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_3;
      WHEN COMP_LOOP_22_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_4;
      WHEN COMP_LOOP_22_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_5;
      WHEN COMP_LOOP_22_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_6;
      WHEN COMP_LOOP_22_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_7;
      WHEN COMP_LOOP_22_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        IF ( COMP_LOOP_22_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_24;
        ELSE
          state_var_NS <= COMP_LOOP_22_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        IF ( COMP_LOOP_C_24_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_23_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_1;
      WHEN COMP_LOOP_23_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_2;
      WHEN COMP_LOOP_23_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_3;
      WHEN COMP_LOOP_23_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_4;
      WHEN COMP_LOOP_23_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_5;
      WHEN COMP_LOOP_23_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_6;
      WHEN COMP_LOOP_23_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_7;
      WHEN COMP_LOOP_23_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        IF ( COMP_LOOP_23_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_25;
        ELSE
          state_var_NS <= COMP_LOOP_23_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        IF ( COMP_LOOP_C_25_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_24_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_1;
      WHEN COMP_LOOP_24_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_2;
      WHEN COMP_LOOP_24_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_3;
      WHEN COMP_LOOP_24_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_4;
      WHEN COMP_LOOP_24_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_5;
      WHEN COMP_LOOP_24_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_6;
      WHEN COMP_LOOP_24_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_7;
      WHEN COMP_LOOP_24_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        IF ( COMP_LOOP_24_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_26;
        ELSE
          state_var_NS <= COMP_LOOP_24_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        IF ( COMP_LOOP_C_26_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_25_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_1;
      WHEN COMP_LOOP_25_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_2;
      WHEN COMP_LOOP_25_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_3;
      WHEN COMP_LOOP_25_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_4;
      WHEN COMP_LOOP_25_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_5;
      WHEN COMP_LOOP_25_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_6;
      WHEN COMP_LOOP_25_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_7;
      WHEN COMP_LOOP_25_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        IF ( COMP_LOOP_25_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_27;
        ELSE
          state_var_NS <= COMP_LOOP_25_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        IF ( COMP_LOOP_C_27_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_26_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_1;
      WHEN COMP_LOOP_26_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_2;
      WHEN COMP_LOOP_26_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_3;
      WHEN COMP_LOOP_26_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_4;
      WHEN COMP_LOOP_26_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_5;
      WHEN COMP_LOOP_26_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_6;
      WHEN COMP_LOOP_26_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_7;
      WHEN COMP_LOOP_26_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        IF ( COMP_LOOP_26_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_28;
        ELSE
          state_var_NS <= COMP_LOOP_26_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        IF ( COMP_LOOP_C_28_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_27_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_1;
      WHEN COMP_LOOP_27_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_2;
      WHEN COMP_LOOP_27_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_3;
      WHEN COMP_LOOP_27_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_4;
      WHEN COMP_LOOP_27_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_5;
      WHEN COMP_LOOP_27_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_6;
      WHEN COMP_LOOP_27_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_7;
      WHEN COMP_LOOP_27_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        IF ( COMP_LOOP_27_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_29;
        ELSE
          state_var_NS <= COMP_LOOP_27_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        IF ( COMP_LOOP_C_29_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_28_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_1;
      WHEN COMP_LOOP_28_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_2;
      WHEN COMP_LOOP_28_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_3;
      WHEN COMP_LOOP_28_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_4;
      WHEN COMP_LOOP_28_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_5;
      WHEN COMP_LOOP_28_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_6;
      WHEN COMP_LOOP_28_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_7;
      WHEN COMP_LOOP_28_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        IF ( COMP_LOOP_28_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_30;
        ELSE
          state_var_NS <= COMP_LOOP_28_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        IF ( COMP_LOOP_C_30_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_29_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_1;
      WHEN COMP_LOOP_29_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_2;
      WHEN COMP_LOOP_29_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_3;
      WHEN COMP_LOOP_29_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_4;
      WHEN COMP_LOOP_29_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_5;
      WHEN COMP_LOOP_29_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_6;
      WHEN COMP_LOOP_29_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_7;
      WHEN COMP_LOOP_29_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        IF ( COMP_LOOP_29_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_31;
        ELSE
          state_var_NS <= COMP_LOOP_29_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        IF ( COMP_LOOP_C_31_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_30_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_1;
      WHEN COMP_LOOP_30_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_2;
      WHEN COMP_LOOP_30_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_3;
      WHEN COMP_LOOP_30_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_4;
      WHEN COMP_LOOP_30_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_5;
      WHEN COMP_LOOP_30_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_6;
      WHEN COMP_LOOP_30_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_7;
      WHEN COMP_LOOP_30_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        IF ( COMP_LOOP_30_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_32;
        ELSE
          state_var_NS <= COMP_LOOP_30_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        IF ( COMP_LOOP_C_32_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_31_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_1;
      WHEN COMP_LOOP_31_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_2;
      WHEN COMP_LOOP_31_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_3;
      WHEN COMP_LOOP_31_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_4;
      WHEN COMP_LOOP_31_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_5;
      WHEN COMP_LOOP_31_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_6;
      WHEN COMP_LOOP_31_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_7;
      WHEN COMP_LOOP_31_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        IF ( COMP_LOOP_31_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_33;
        ELSE
          state_var_NS <= COMP_LOOP_31_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        IF ( COMP_LOOP_C_33_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_32_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_1;
      WHEN COMP_LOOP_32_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_2;
      WHEN COMP_LOOP_32_VEC_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_3;
      WHEN COMP_LOOP_32_VEC_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_4;
      WHEN COMP_LOOP_32_VEC_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_5;
      WHEN COMP_LOOP_32_VEC_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_6;
      WHEN COMP_LOOP_32_VEC_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_7;
      WHEN COMP_LOOP_32_VEC_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        IF ( COMP_LOOP_32_VEC_LOOP_C_7_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_34;
        ELSE
          state_var_NS <= COMP_LOOP_32_VEC_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        IF ( COMP_LOOP_C_34_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
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
  END PROCESS inPlaceNTT_DIF_precomp_core_core_fsm_1;

  inPlaceNTT_DIF_precomp_core_core_fsm_1_REG : PROCESS (clk)
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
  END PROCESS inPlaceNTT_DIF_precomp_core_core_fsm_1_REG;

END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    core_wten : OUT STD_LOGIC;
    complete_rsci_wen_comp : IN STD_LOGIC;
    core_wten_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_staller;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_staller IS
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsc_triosy_obj_ld_core_sct <= twiddle_h_rsc_triosy_obj_iswt0 AND (NOT
      core_wten);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  PORT(
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsc_triosy_obj_ld_core_sct <= twiddle_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    r_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    r_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  r_rsc_triosy_obj_ld_core_sct <= r_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    p_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    p_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  p_rsc_triosy_obj_ld_core_sct <= p_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl IS
  PORT(
    core_wten : IN STD_LOGIC;
    vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC;
    vec_rsc_triosy_obj_ld_core_sct : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    IS
  -- Default Constants

BEGIN
  vec_rsc_triosy_obj_ld_core_sct <= vec_rsc_triosy_obj_iswt0 AND (NOT core_wten);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC;
    complete_rsci_biwt : IN STD_LOGIC;
    complete_rsci_bdwt : IN STD_LOGIC;
    complete_rsci_bcwt : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp IS
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_biwt : OUT STD_LOGIC;
    complete_rsci_bdwt : OUT STD_LOGIC;
    complete_rsci_bcwt : IN STD_LOGIC;
    complete_rsci_ivld_core_sct : OUT STD_LOGIC;
    complete_rsci_irdy : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl IS
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_biwt : IN STD_LOGIC;
    twiddle_h_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_q_d_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  twiddle_h_rsci_q_d_mxwt <= MUX_v_32_2_2(twiddle_h_rsci_q_d, twiddle_h_rsci_q_d_bfwt,
      twiddle_h_rsci_bcwt);
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
        twiddle_h_rsci_q_d_bfwt <= twiddle_h_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_biwt : OUT STD_LOGIC;
    twiddle_h_rsci_bdwt : OUT STD_LOGIC;
    twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_h_rsci_bdwt <= twiddle_h_rsci_oswt AND core_wen;
  twiddle_h_rsci_biwt <= (NOT core_wten) AND twiddle_h_rsci_oswt;
  twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_h_rsci_oswt_pff
      AND (NOT core_wten_pff);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_biwt : IN STD_LOGIC;
    twiddle_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_bcwt : STD_LOGIC;
  SIGNAL twiddle_rsci_q_d_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  twiddle_rsci_q_d_mxwt <= MUX_v_32_2_2(twiddle_rsci_q_d, twiddle_rsci_q_d_bfwt,
      twiddle_rsci_bcwt);
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
        twiddle_rsci_q_d_bfwt <= twiddle_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_biwt : OUT STD_LOGIC;
    twiddle_rsci_bdwt : OUT STD_LOGIC;
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    twiddle_rsci_oswt_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    IS
  -- Default Constants

BEGIN
  twiddle_rsci_bdwt <= twiddle_rsci_oswt AND core_wen;
  twiddle_rsci_biwt <= (NOT core_wten) AND twiddle_rsci_oswt;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct <= twiddle_rsci_oswt_pff
      AND (NOT core_wten_pff);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_biwt_1 : IN STD_LOGIC;
    vec_rsci_bdwt_2 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsci_bcwt_1 : STD_LOGIC;
  SIGNAL vec_rsci_q_d_bfwt : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  vec_rsci_q_d_mxwt <= MUX_v_32_2_2(vec_rsci_q_d, vec_rsci_q_d_bfwt, vec_rsci_bcwt_1);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        vec_rsci_bcwt_1 <= '0';
      ELSE
        vec_rsci_bcwt_1 <= NOT((NOT(vec_rsci_bcwt_1 OR vec_rsci_biwt_1)) OR vec_rsci_bdwt_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( vec_rsci_biwt_1 = '1' ) THEN
        vec_rsci_q_d_bfwt <= vec_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsci_oswt_1 : IN STD_LOGIC;
    vec_rsci_biwt_1 : OUT STD_LOGIC;
    vec_rsci_bdwt_2 : OUT STD_LOGIC;
    vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
    vec_rsci_we_d_core_sct_pff : OUT STD_LOGIC;
    vec_rsci_iswt0_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC;
    vec_rsci_oswt_1_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl IS
  -- Default Constants

BEGIN
  vec_rsci_bdwt_2 <= vec_rsci_oswt_1 AND core_wen;
  vec_rsci_biwt_1 <= (NOT core_wten) AND vec_rsci_oswt_1;
  vec_rsci_we_d_core_sct_pff <= vec_rsci_iswt0_pff AND (NOT core_wten_pff);
  vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct <= vec_rsci_oswt_1_pff AND
      (NOT core_wten_pff);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    ensig_cgo_iro_1 : IN STD_LOGIC;
    core_wen : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_1_mult_cmp_ccs_ccore_en : OUT STD_LOGIC;
    ensig_cgo_1 : IN STD_LOGIC;
    COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_mult_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo OR ensig_cgo_iro);
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en <= core_wen AND (ensig_cgo_1 OR ensig_cgo_iro_1);
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsci_ivld_mxwt : OUT STD_LOGIC;
    run_rsci_ivld : IN STD_LOGIC;
    run_rsci_biwt : IN STD_LOGIC;
    run_rsci_bdwt : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp IS
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl IS
  PORT(
    core_wen : IN STD_LOGIC;
    run_rsci_oswt : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    run_rsci_biwt : OUT STD_LOGIC;
    run_rsci_bdwt : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl IS
  -- Default Constants

BEGIN
  run_rsci_bdwt <= run_rsci_oswt AND core_wen;
  run_rsci_biwt <= (NOT core_wten) AND run_rsci_oswt;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj IS
  PORT(
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
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
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      : inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => twiddle_h_rsc_triosy_obj_iswt0,
      twiddle_h_rsc_triosy_obj_ld_core_sct => twiddle_h_rsc_triosy_obj_ld_core_sct
    );
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj IS
  PORT(
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
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
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      : inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => twiddle_rsc_triosy_obj_iswt0,
      twiddle_rsc_triosy_obj_ld_core_sct => twiddle_rsc_triosy_obj_ld_core_sct
    );
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj IS
  PORT(
    r_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    r_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL r_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
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
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      r_rsc_triosy_obj_iswt0 => r_rsc_triosy_obj_iswt0,
      r_rsc_triosy_obj_ld_core_sct => r_rsc_triosy_obj_ld_core_sct
    );
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj IS
  PORT(
    p_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    p_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
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
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      p_rsc_triosy_obj_iswt0 => p_rsc_triosy_obj_iswt0,
      p_rsc_triosy_obj_ld_core_sct => p_rsc_triosy_obj_ld_core_sct
    );
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj IS
  PORT(
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsc_triosy_obj_ld_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
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
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst :
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
    PORT MAP(
      core_wten => core_wten,
      vec_rsc_triosy_obj_iswt0 => vec_rsc_triosy_obj_iswt0,
      vec_rsc_triosy_obj_ld_core_sct => vec_rsc_triosy_obj_ld_core_sct
    );
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_complete_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    complete_rsci_oswt : IN STD_LOGIC;
    complete_rsci_wen_comp : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_complete_rsci;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_complete_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL complete_rsci_biwt : STD_LOGIC;
  SIGNAL complete_rsci_bdwt : STD_LOGIC;
  SIGNAL complete_rsci_bcwt : STD_LOGIC;
  SIGNAL complete_rsci_ivld_core_sct : STD_LOGIC;
  SIGNAL complete_rsci_irdy : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl
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
  COMPONENT inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp
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
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      complete_rsci_oswt => complete_rsci_oswt,
      complete_rsci_biwt => complete_rsci_biwt,
      complete_rsci_bdwt => complete_rsci_bdwt,
      complete_rsci_bcwt => complete_rsci_bcwt,
      complete_rsci_ivld_core_sct => complete_rsci_ivld_core_sct,
      complete_rsci_irdy => complete_rsci_irdy
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp_inst : inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_h_rsci_oswt : IN STD_LOGIC;
    twiddle_h_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_oswt_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_h_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_biwt : OUT STD_LOGIC;
      twiddle_h_rsci_bdwt : OUT STD_LOGIC;
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_biwt : IN STD_LOGIC;
      twiddle_h_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => twiddle_h_rsci_oswt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt,
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct => twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct,
      twiddle_h_rsci_oswt_pff => twiddle_h_rsci_oswt_pff,
      core_wten_pff => core_wten_pff
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst : inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_q_d => inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d,
      twiddle_h_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d_mxwt,
      twiddle_h_rsci_biwt => twiddle_h_rsci_biwt,
      twiddle_h_rsci_bdwt => twiddle_h_rsci_bdwt
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d
      <= twiddle_h_rsci_q_d;
  twiddle_h_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_q_d_mxwt;

  twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    twiddle_rsci_oswt : IN STD_LOGIC;
    twiddle_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_oswt_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_twiddle_rsci_1;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_biwt : STD_LOGIC;
  SIGNAL twiddle_rsci_bdwt : STD_LOGIC;
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_biwt : OUT STD_LOGIC;
      twiddle_rsci_bdwt : OUT STD_LOGIC;
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      twiddle_rsci_oswt_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_biwt : IN STD_LOGIC;
      twiddle_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      twiddle_rsci_oswt => twiddle_rsci_oswt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct,
      twiddle_rsci_oswt_pff => twiddle_rsci_oswt_pff,
      core_wten_pff => core_wten_pff
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst : inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_q_d => inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d,
      twiddle_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d_mxwt,
      twiddle_rsci_biwt => twiddle_rsci_biwt,
      twiddle_rsci_bdwt => twiddle_rsci_bdwt
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d
      <= twiddle_rsci_q_d;
  twiddle_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_q_d_mxwt;

  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_vec_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    core_wen : IN STD_LOGIC;
    core_wten : IN STD_LOGIC;
    vec_rsci_oswt_1 : IN STD_LOGIC;
    vec_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_we_d_pff : OUT STD_LOGIC;
    vec_rsci_iswt0_pff : IN STD_LOGIC;
    core_wten_pff : IN STD_LOGIC;
    vec_rsci_oswt_1_pff : IN STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core_vec_rsci_1;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_vec_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsci_biwt_1 : STD_LOGIC;
  SIGNAL vec_rsci_bdwt_2 : STD_LOGIC;
  SIGNAL vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : STD_LOGIC;
  SIGNAL vec_rsci_we_d_core_sct_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsci_oswt_1 : IN STD_LOGIC;
      vec_rsci_biwt_1 : OUT STD_LOGIC;
      vec_rsci_bdwt_2 : OUT STD_LOGIC;
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct : OUT STD_LOGIC;
      vec_rsci_we_d_core_sct_pff : OUT STD_LOGIC;
      vec_rsci_iswt0_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC;
      vec_rsci_oswt_1_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_biwt_1 : IN STD_LOGIC;
      vec_rsci_bdwt_2 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      core_wten => core_wten,
      vec_rsci_oswt_1 => vec_rsci_oswt_1,
      vec_rsci_biwt_1 => vec_rsci_biwt_1,
      vec_rsci_bdwt_2 => vec_rsci_bdwt_2,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsci_we_d_core_sct_pff => vec_rsci_we_d_core_sct_iff,
      vec_rsci_iswt0_pff => vec_rsci_iswt0_pff,
      core_wten_pff => core_wten_pff,
      vec_rsci_oswt_1_pff => vec_rsci_oswt_1_pff
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst : inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsci_q_d => inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d,
      vec_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d_mxwt,
      vec_rsci_biwt_1 => vec_rsci_biwt_1,
      vec_rsci_bdwt_2 => vec_rsci_bdwt_2
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d <= vec_rsci_q_d;
  vec_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_q_d_mxwt;

  vec_rsci_we_d_pff <= vec_rsci_we_d_core_sct_iff;
  vec_rsci_readA_r_ram_ir_internal_RMASK_B_d <= vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core_run_rsci IS
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
END inPlaceNTT_DIF_precomp_core_run_rsci;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core_run_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_rsci_ivld : STD_LOGIC;
  SIGNAL run_rsci_biwt : STD_LOGIC;
  SIGNAL run_rsci_bdwt : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl
    PORT(
      core_wen : IN STD_LOGIC;
      run_rsci_oswt : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      run_rsci_biwt : OUT STD_LOGIC;
      run_rsci_bdwt : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
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
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl_inst : inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl
    PORT MAP(
      core_wen => core_wen,
      run_rsci_oswt => run_rsci_oswt,
      core_wten => core_wten,
      run_rsci_biwt => run_rsci_biwt,
      run_rsci_bdwt => run_rsci_bdwt
    );
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst : inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
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
--  Design Unit:    inPlaceNTT_DIF_precomp_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp_core IS
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
    vec_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsci_wadr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsci_we_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp_core;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL core_wten : STD_LOGIC;
  SIGNAL run_rsci_ivld_mxwt : STD_LOGIC;
  SIGNAL vec_rsci_q_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d_mxwt : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL complete_rsci_wen_comp : STD_LOGIC;
  SIGNAL COMP_LOOP_1_mult_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mult_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modulo_add_cmp_return_rsc_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL or_tmp_17 : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL nor_tmp_15 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL not_tmp_138 : STD_LOGIC;
  SIGNAL or_dcpl_153 : STD_LOGIC;
  SIGNAL or_tmp_116 : STD_LOGIC;
  SIGNAL or_tmp_119 : STD_LOGIC;
  SIGNAL mux_tmp_216 : STD_LOGIC;
  SIGNAL or_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_218 : STD_LOGIC;
  SIGNAL mux_tmp_219 : STD_LOGIC;
  SIGNAL or_tmp_122 : STD_LOGIC;
  SIGNAL mux_tmp_221 : STD_LOGIC;
  SIGNAL nand_tmp_7 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_224 : STD_LOGIC;
  SIGNAL or_tmp_124 : STD_LOGIC;
  SIGNAL mux_tmp_225 : STD_LOGIC;
  SIGNAL mux_tmp_226 : STD_LOGIC;
  SIGNAL mux_tmp_228 : STD_LOGIC;
  SIGNAL or_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_235 : STD_LOGIC;
  SIGNAL mux_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_246 : STD_LOGIC;
  SIGNAL and_tmp_16 : STD_LOGIC;
  SIGNAL or_tmp_140 : STD_LOGIC;
  SIGNAL nand_tmp_9 : STD_LOGIC;
  SIGNAL or_tmp_151 : STD_LOGIC;
  SIGNAL or_tmp_155 : STD_LOGIC;
  SIGNAL mux_tmp_261 : STD_LOGIC;
  SIGNAL mux_tmp_262 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL or_tmp_174 : STD_LOGIC;
  SIGNAL mux_tmp_281 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL or_tmp_179 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL not_tmp_192 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL mux_tmp_299 : STD_LOGIC;
  SIGNAL or_tmp_197 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL or_tmp_202 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL nand_tmp_17 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL mux_tmp_335 : STD_LOGIC;
  SIGNAL or_tmp_237 : STD_LOGIC;
  SIGNAL or_tmp_239 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL or_tmp_248 : STD_LOGIC;
  SIGNAL or_tmp_258 : STD_LOGIC;
  SIGNAL mux_tmp_361 : STD_LOGIC;
  SIGNAL or_tmp_260 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL or_tmp_262 : STD_LOGIC;
  SIGNAL or_tmp_264 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL mux_tmp_377 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL mux_tmp_385 : STD_LOGIC;
  SIGNAL mux_tmp_388 : STD_LOGIC;
  SIGNAL nand_tmp_23 : STD_LOGIC;
  SIGNAL mux_tmp_392 : STD_LOGIC;
  SIGNAL or_tmp_295 : STD_LOGIC;
  SIGNAL and_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL mux_tmp_411 : STD_LOGIC;
  SIGNAL or_tmp_321 : STD_LOGIC;
  SIGNAL or_tmp_324 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL mux_tmp_420 : STD_LOGIC;
  SIGNAL and_tmp_20 : STD_LOGIC;
  SIGNAL mux_tmp_421 : STD_LOGIC;
  SIGNAL mux_tmp_423 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_435 : STD_LOGIC;
  SIGNAL or_tmp_342 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL mux_tmp_443 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL xor_dcpl_1 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL or_tmp_357 : STD_LOGIC;
  SIGNAL mux_tmp_448 : STD_LOGIC;
  SIGNAL mux_tmp_449 : STD_LOGIC;
  SIGNAL mux_tmp_450 : STD_LOGIC;
  SIGNAL or_tmp_363 : STD_LOGIC;
  SIGNAL mux_tmp_452 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL or_tmp_371 : STD_LOGIC;
  SIGNAL mux_tmp_462 : STD_LOGIC;
  SIGNAL nand_tmp_26 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL mux_tmp_468 : STD_LOGIC;
  SIGNAL mux_tmp_469 : STD_LOGIC;
  SIGNAL or_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_470 : STD_LOGIC;
  SIGNAL mux_tmp_471 : STD_LOGIC;
  SIGNAL or_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_472 : STD_LOGIC;
  SIGNAL or_tmp_381 : STD_LOGIC;
  SIGNAL mux_tmp_474 : STD_LOGIC;
  SIGNAL mux_tmp_478 : STD_LOGIC;
  SIGNAL nor_tmp_30 : STD_LOGIC;
  SIGNAL mux_tmp_479 : STD_LOGIC;
  SIGNAL mux_tmp_481 : STD_LOGIC;
  SIGNAL mux_tmp_485 : STD_LOGIC;
  SIGNAL mux_tmp_488 : STD_LOGIC;
  SIGNAL mux_tmp_502 : STD_LOGIC;
  SIGNAL mux_tmp_504 : STD_LOGIC;
  SIGNAL or_tmp_401 : STD_LOGIC;
  SIGNAL mux_tmp_515 : STD_LOGIC;
  SIGNAL or_tmp_409 : STD_LOGIC;
  SIGNAL mux_tmp_537 : STD_LOGIC;
  SIGNAL mux_tmp_538 : STD_LOGIC;
  SIGNAL mux_tmp_555 : STD_LOGIC;
  SIGNAL not_tmp_313 : STD_LOGIC;
  SIGNAL mux_tmp_587 : STD_LOGIC;
  SIGNAL mux_tmp_593 : STD_LOGIC;
  SIGNAL mux_tmp_594 : STD_LOGIC;
  SIGNAL mux_tmp_609 : STD_LOGIC;
  SIGNAL mux_tmp_611 : STD_LOGIC;
  SIGNAL or_tmp_489 : STD_LOGIC;
  SIGNAL or_tmp_493 : STD_LOGIC;
  SIGNAL mux_tmp_623 : STD_LOGIC;
  SIGNAL mux_tmp_664 : STD_LOGIC;
  SIGNAL VEC_LOOP_acc_1_cse_10_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL VEC_LOOP_j_14_0_1_sva_1 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL run_ac_sync_tmp_dobj_sva : STD_LOGIC;
  SIGNAL reg_run_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsci_oswt_1_cse : STD_LOGIC;
  SIGNAL or_354_cse : STD_LOGIC;
  SIGNAL or_380_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_complete_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_474_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_1_cse : STD_LOGIC;
  SIGNAL or_720_cse : STD_LOGIC;
  SIGNAL or_406_cse : STD_LOGIC;
  SIGNAL or_317_cse : STD_LOGIC;
  SIGNAL or_434_cse : STD_LOGIC;
  SIGNAL or_408_cse : STD_LOGIC;
  SIGNAL or_365_cse : STD_LOGIC;
  SIGNAL nor_91_cse : STD_LOGIC;
  SIGNAL or_260_cse : STD_LOGIC;
  SIGNAL or_730_cse : STD_LOGIC;
  SIGNAL nor_32_cse : STD_LOGIC;
  SIGNAL or_529_cse : STD_LOGIC;
  SIGNAL and_295_cse : STD_LOGIC;
  SIGNAL or_277_cse : STD_LOGIC;
  SIGNAL or_289_cse : STD_LOGIC;
  SIGNAL or_299_cse : STD_LOGIC;
  SIGNAL or_364_cse : STD_LOGIC;
  SIGNAL or_341_cse : STD_LOGIC;
  SIGNAL or_342_cse : STD_LOGIC;
  SIGNAL mux_289_cse : STD_LOGIC;
  SIGNAL or_471_cse : STD_LOGIC;
  SIGNAL or_410_cse : STD_LOGIC;
  SIGNAL mux_303_cse : STD_LOGIC;
  SIGNAL mux_329_cse : STD_LOGIC;
  SIGNAL mux_413_cse : STD_LOGIC;
  SIGNAL mux_18_cse : STD_LOGIC;
  SIGNAL and_33_cse : STD_LOGIC;
  SIGNAL or_473_cse : STD_LOGIC;
  SIGNAL nand_46_cse : STD_LOGIC;
  SIGNAL mux_328_cse : STD_LOGIC;
  SIGNAL mux_304_cse : STD_LOGIC;
  SIGNAL mux_379_cse : STD_LOGIC;
  SIGNAL mux_508_cse : STD_LOGIC;
  SIGNAL mux_539_cse : STD_LOGIC;
  SIGNAL mux_245_cse : STD_LOGIC;
  SIGNAL mux_375_cse : STD_LOGIC;
  SIGNAL mux_249_cse : STD_LOGIC;
  SIGNAL or_544_cse : STD_LOGIC;
  SIGNAL nand_10_cse : STD_LOGIC;
  SIGNAL or_578_cse : STD_LOGIC;
  SIGNAL mux_543_cse : STD_LOGIC;
  SIGNAL vec_rsci_we_d_iff : STD_LOGIC;
  SIGNAL core_wten_iff : STD_LOGIC;
  SIGNAL vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_26_rmff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_10_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_5_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_13_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_rmff : STD_LOGIC;
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL mux_431_rmff : STD_LOGIC;
  SIGNAL twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg : STD_LOGIC;
  SIGNAL mux_498_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_help_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL factor2_1_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_2_sva_mx0w1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL VEC_LOOP_acc_10_cse_20_sva_mx0w19 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_21_sva_mx0w20 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_22_sva_mx0w21 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_23_sva_mx0w22 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_24_sva_mx0w23 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_25_sva_mx0w24 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_26_sva_mx0w25 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_27_sva_mx0w26 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_28_sva_mx0w27 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_29_sva_mx0w28 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_30_sva_mx0w29 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_31_sva_mx0w30 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_sva_mx0w31 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_10_cse_1_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_276_itm : STD_LOGIC;
  SIGNAL mux_533_itm : STD_LOGIC;
  SIGNAL mux_548_itm : STD_LOGIC;
  SIGNAL mux_257_itm : STD_LOGIC;
  SIGNAL mux_295_itm : STD_LOGIC;
  SIGNAL mux_617_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_300 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL and_dcpl_304 : STD_LOGIC;
  SIGNAL and_dcpl_305 : STD_LOGIC;
  SIGNAL and_dcpl_308 : STD_LOGIC;
  SIGNAL and_dcpl_309 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_dcpl_314 : STD_LOGIC;
  SIGNAL and_dcpl_315 : STD_LOGIC;
  SIGNAL and_dcpl_319 : STD_LOGIC;
  SIGNAL and_dcpl_320 : STD_LOGIC;
  SIGNAL and_dcpl_321 : STD_LOGIC;
  SIGNAL and_dcpl_323 : STD_LOGIC;
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_dcpl_326 : STD_LOGIC;
  SIGNAL and_dcpl_329 : STD_LOGIC;
  SIGNAL and_dcpl_332 : STD_LOGIC;
  SIGNAL and_dcpl_334 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL and_dcpl_339 : STD_LOGIC;
  SIGNAL and_dcpl_341 : STD_LOGIC;
  SIGNAL and_dcpl_343 : STD_LOGIC;
  SIGNAL and_dcpl_345 : STD_LOGIC;
  SIGNAL and_dcpl_348 : STD_LOGIC;
  SIGNAL and_dcpl_350 : STD_LOGIC;
  SIGNAL and_dcpl_353 : STD_LOGIC;
  SIGNAL and_dcpl_355 : STD_LOGIC;
  SIGNAL and_dcpl_357 : STD_LOGIC;
  SIGNAL and_dcpl_359 : STD_LOGIC;
  SIGNAL and_dcpl_361 : STD_LOGIC;
  SIGNAL and_dcpl_365 : STD_LOGIC;
  SIGNAL and_dcpl_367 : STD_LOGIC;
  SIGNAL and_dcpl_369 : STD_LOGIC;
  SIGNAL and_dcpl_371 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_394 : STD_LOGIC;
  SIGNAL and_dcpl_401 : STD_LOGIC;
  SIGNAL and_dcpl_406 : STD_LOGIC;
  SIGNAL and_dcpl_412 : STD_LOGIC;
  SIGNAL and_dcpl_444 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL and_dcpl_962 : STD_LOGIC;
  SIGNAL and_dcpl_964 : STD_LOGIC;
  SIGNAL and_dcpl_969 : STD_LOGIC;
  SIGNAL and_dcpl_975 : STD_LOGIC;
  SIGNAL z_out_26 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_981 : STD_LOGIC;
  SIGNAL and_dcpl_982 : STD_LOGIC;
  SIGNAL and_dcpl_983 : STD_LOGIC;
  SIGNAL and_dcpl_988 : STD_LOGIC;
  SIGNAL and_dcpl_990 : STD_LOGIC;
  SIGNAL and_dcpl_993 : STD_LOGIC;
  SIGNAL and_dcpl_994 : STD_LOGIC;
  SIGNAL and_dcpl_998 : STD_LOGIC;
  SIGNAL and_dcpl_999 : STD_LOGIC;
  SIGNAL and_dcpl_1001 : STD_LOGIC;
  SIGNAL and_dcpl_1002 : STD_LOGIC;
  SIGNAL and_dcpl_1007 : STD_LOGIC;
  SIGNAL and_dcpl_1009 : STD_LOGIC;
  SIGNAL and_dcpl_1010 : STD_LOGIC;
  SIGNAL and_dcpl_1013 : STD_LOGIC;
  SIGNAL and_dcpl_1014 : STD_LOGIC;
  SIGNAL and_dcpl_1016 : STD_LOGIC;
  SIGNAL and_dcpl_1018 : STD_LOGIC;
  SIGNAL and_dcpl_1021 : STD_LOGIC;
  SIGNAL and_dcpl_1023 : STD_LOGIC;
  SIGNAL and_dcpl_1025 : STD_LOGIC;
  SIGNAL and_dcpl_1026 : STD_LOGIC;
  SIGNAL and_dcpl_1027 : STD_LOGIC;
  SIGNAL and_dcpl_1028 : STD_LOGIC;
  SIGNAL and_dcpl_1029 : STD_LOGIC;
  SIGNAL and_dcpl_1030 : STD_LOGIC;
  SIGNAL and_dcpl_1031 : STD_LOGIC;
  SIGNAL z_out_27 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out_28 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux_tmp_699 : STD_LOGIC;
  SIGNAL mux_tmp_700 : STD_LOGIC;
  SIGNAL or_tmp_551 : STD_LOGIC;
  SIGNAL mux_tmp_703 : STD_LOGIC;
  SIGNAL mux_tmp_704 : STD_LOGIC;
  SIGNAL and_dcpl_1053 : STD_LOGIC;
  SIGNAL and_dcpl_1058 : STD_LOGIC;
  SIGNAL and_dcpl_1062 : STD_LOGIC;
  SIGNAL and_dcpl_1069 : STD_LOGIC;
  SIGNAL and_dcpl_1073 : STD_LOGIC;
  SIGNAL and_dcpl_1077 : STD_LOGIC;
  SIGNAL and_dcpl_1081 : STD_LOGIC;
  SIGNAL and_dcpl_1083 : STD_LOGIC;
  SIGNAL and_dcpl_1085 : STD_LOGIC;
  SIGNAL and_dcpl_1087 : STD_LOGIC;
  SIGNAL and_dcpl_1089 : STD_LOGIC;
  SIGNAL and_dcpl_1093 : STD_LOGIC;
  SIGNAL and_dcpl_1096 : STD_LOGIC;
  SIGNAL and_dcpl_1099 : STD_LOGIC;
  SIGNAL and_dcpl_1101 : STD_LOGIC;
  SIGNAL and_dcpl_1103 : STD_LOGIC;
  SIGNAL z_out_29 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL and_dcpl_1106 : STD_LOGIC;
  SIGNAL and_dcpl_1111 : STD_LOGIC;
  SIGNAL and_dcpl_1116 : STD_LOGIC;
  SIGNAL and_dcpl_1119 : STD_LOGIC;
  SIGNAL and_dcpl_1122 : STD_LOGIC;
  SIGNAL and_dcpl_1126 : STD_LOGIC;
  SIGNAL and_dcpl_1131 : STD_LOGIC;
  SIGNAL and_dcpl_1133 : STD_LOGIC;
  SIGNAL and_dcpl_1137 : STD_LOGIC;
  SIGNAL and_dcpl_1141 : STD_LOGIC;
  SIGNAL and_dcpl_1143 : STD_LOGIC;
  SIGNAL and_dcpl_1148 : STD_LOGIC;
  SIGNAL and_dcpl_1150 : STD_LOGIC;
  SIGNAL z_out_30 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL and_dcpl_1158 : STD_LOGIC;
  SIGNAL and_dcpl_1163 : STD_LOGIC;
  SIGNAL and_dcpl_1168 : STD_LOGIC;
  SIGNAL z_out_31 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_5_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_9_twiddle_f_lshift_ncse_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_mul_cse_10_sva : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_k_14_5_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_1_ssc : STD_LOGIC;
  SIGNAL VEC_LOOP_or_13_cse : STD_LOGIC;
  SIGNAL nor_144_cse : STD_LOGIC;
  SIGNAL and_618_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_help_and_cse : STD_LOGIC;
  SIGNAL and_335_cse : STD_LOGIC;
  SIGNAL mux_tmp_717 : STD_LOGIC;
  SIGNAL mux_tmp_719 : STD_LOGIC;
  SIGNAL or_tmp_567 : STD_LOGIC;
  SIGNAL or_tmp_575 : STD_LOGIC;
  SIGNAL mux_tmp_728 : STD_LOGIC;
  SIGNAL or_tmp_578 : STD_LOGIC;
  SIGNAL or_tmp_579 : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_40_rgt : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL or_tmp_595 : STD_LOGIC;
  SIGNAL or_tmp_605 : STD_LOGIC;
  SIGNAL mux_tmp_752 : STD_LOGIC;
  SIGNAL mux_tmp_754 : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_65_rgt : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_13_twiddle_f_mul_psp_sva_11 : STD_LOGIC;
  SIGNAL COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL nor_201_cse : STD_LOGIC;
  SIGNAL or_799_cse : STD_LOGIC;
  SIGNAL nor_207_cse : STD_LOGIC;
  SIGNAL nand_63_cse : STD_LOGIC;
  SIGNAL or_785_cse : STD_LOGIC;
  SIGNAL or_713_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_11_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_nor_1_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_18_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_48_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_49_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_59_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_61_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_64_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_70_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_72_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_or_53_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;

  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL or_309_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL or_308_nl : STD_LOGIC;
  SIGNAL or_306_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL or_379_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_70_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL and_300_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL nor_71_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL or_487_nl : STD_LOGIC;
  SIGNAL nor_72_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL or_478_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_19_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL mux_455_nl : STD_LOGIC;
  SIGNAL or_522_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL or_521_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL or_531_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL or_530_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL or_528_nl : STD_LOGIC;
  SIGNAL and_184_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL mux_495_nl : STD_LOGIC;
  SIGNAL mux_494_nl : STD_LOGIC;
  SIGNAL nand_27_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL nor_66_nl : STD_LOGIC;
  SIGNAL mux_486_nl : STD_LOGIC;
  SIGNAL nor_67_nl : STD_LOGIC;
  SIGNAL nor_68_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL mux_483_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL nor_65_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL or_581_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL or_724_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL nor_63_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL or_589_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_not_nl : STD_LOGIC;
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL and_1246_nl : STD_LOGIC;
  SIGNAL or_747_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL or_722_nl : STD_LOGIC;
  SIGNAL nand_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_17_twiddle_f_mul_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL nor_121_nl : STD_LOGIC;
  SIGNAL or_731_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_twiddle_f_mul_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_233_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_7_nl : STD_LOGIC;
  SIGNAL mux_727_nl : STD_LOGIC;
  SIGNAL mux_726_nl : STD_LOGIC;
  SIGNAL or_763_nl : STD_LOGIC;
  SIGNAL mux_725_nl : STD_LOGIC;
  SIGNAL or_762_nl : STD_LOGIC;
  SIGNAL mux_724_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC;
  SIGNAL mux_722_nl : STD_LOGIC;
  SIGNAL mux_721_nl : STD_LOGIC;
  SIGNAL or_758_nl : STD_LOGIC;
  SIGNAL mux_720_nl : STD_LOGIC;
  SIGNAL or_754_nl : STD_LOGIC;
  SIGNAL or_752_nl : STD_LOGIC;
  SIGNAL mux_718_nl : STD_LOGIC;
  SIGNAL or_802_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL mux_739_nl : STD_LOGIC;
  SIGNAL mux_738_nl : STD_LOGIC;
  SIGNAL or_774_nl : STD_LOGIC;
  SIGNAL mux_737_nl : STD_LOGIC;
  SIGNAL or_773_nl : STD_LOGIC;
  SIGNAL mux_736_nl : STD_LOGIC;
  SIGNAL or_772_nl : STD_LOGIC;
  SIGNAL or_771_nl : STD_LOGIC;
  SIGNAL mux_735_nl : STD_LOGIC;
  SIGNAL mux_734_nl : STD_LOGIC;
  SIGNAL mux_733_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL mux_732_nl : STD_LOGIC;
  SIGNAL and_1244_nl : STD_LOGIC;
  SIGNAL nor_206_nl : STD_LOGIC;
  SIGNAL or_769_nl : STD_LOGIC;
  SIGNAL mux_731_nl : STD_LOGIC;
  SIGNAL mux_730_nl : STD_LOGIC;
  SIGNAL mux_729_nl : STD_LOGIC;
  SIGNAL or_766_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL nor_56_nl : STD_LOGIC;
  SIGNAL or_617_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL or_616_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL mux_602_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL nand_57_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL nand_58_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL nand_59_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL or_634_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL or_633_nl : STD_LOGIC;
  SIGNAL mux_590_nl : STD_LOGIC;
  SIGNAL or_632_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL or_631_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL or_629_nl : STD_LOGIC;
  SIGNAL nor_53_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL nor_54_nl : STD_LOGIC;
  SIGNAL and_294_nl : STD_LOGIC;
  SIGNAL or_620_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_13_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_acc_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_74_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_nor_19_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_48_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_1248_nl : STD_LOGIC;
  SIGNAL and_1249_nl : STD_LOGIC;
  SIGNAL and_1250_nl : STD_LOGIC;
  SIGNAL and_1251_nl : STD_LOGIC;
  SIGNAL and_1252_nl : STD_LOGIC;
  SIGNAL and_1253_nl : STD_LOGIC;
  SIGNAL and_1254_nl : STD_LOGIC;
  SIGNAL and_1255_nl : STD_LOGIC;
  SIGNAL and_1256_nl : STD_LOGIC;
  SIGNAL and_1257_nl : STD_LOGIC;
  SIGNAL and_1258_nl : STD_LOGIC;
  SIGNAL and_1259_nl : STD_LOGIC;
  SIGNAL and_1260_nl : STD_LOGIC;
  SIGNAL and_1261_nl : STD_LOGIC;
  SIGNAL and_1262_nl : STD_LOGIC;
  SIGNAL and_1263_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_nl : STD_LOGIC;
  SIGNAL mux_631_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL or_665_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL or_663_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL or_662_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL mux_674_nl : STD_LOGIC;
  SIGNAL mux_670_nl : STD_LOGIC;
  SIGNAL mux_669_nl : STD_LOGIC;
  SIGNAL mux_668_nl : STD_LOGIC;
  SIGNAL mux_667_nl : STD_LOGIC;
  SIGNAL mux_678_nl : STD_LOGIC;
  SIGNAL nor_119_nl : STD_LOGIC;
  SIGNAL mux_677_nl : STD_LOGIC;
  SIGNAL and_290_nl : STD_LOGIC;
  SIGNAL and_320_nl : STD_LOGIC;
  SIGNAL mux_676_nl : STD_LOGIC;
  SIGNAL or_608_nl : STD_LOGIC;
  SIGNAL mux_681_nl : STD_LOGIC;
  SIGNAL nor_51_nl : STD_LOGIC;
  SIGNAL mux_680_nl : STD_LOGIC;
  SIGNAL and_278_nl : STD_LOGIC;
  SIGNAL mux_679_nl : STD_LOGIC;
  SIGNAL or_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL mul_1_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_1247_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_5_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL nor_209_nl : STD_LOGIC;
  SIGNAL nor_210_nl : STD_LOGIC;
  SIGNAL mux_692_nl : STD_LOGIC;
  SIGNAL mux_691_nl : STD_LOGIC;
  SIGNAL mux_751_nl : STD_LOGIC;
  SIGNAL mux_750_nl : STD_LOGIC;
  SIGNAL mux_749_nl : STD_LOGIC;
  SIGNAL and_1243_nl : STD_LOGIC;
  SIGNAL mux_748_nl : STD_LOGIC;
  SIGNAL or_789_nl : STD_LOGIC;
  SIGNAL mux_747_nl : STD_LOGIC;
  SIGNAL mux_746_nl : STD_LOGIC;
  SIGNAL nor_200_nl : STD_LOGIC;
  SIGNAL mux_745_nl : STD_LOGIC;
  SIGNAL mux_744_nl : STD_LOGIC;
  SIGNAL or_784_nl : STD_LOGIC;
  SIGNAL mux_743_nl : STD_LOGIC;
  SIGNAL mux_742_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL mux_741_nl : STD_LOGIC;
  SIGNAL mux_740_nl : STD_LOGIC;
  SIGNAL and_1239_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL mux_760_nl : STD_LOGIC;
  SIGNAL and_1242_nl : STD_LOGIC;
  SIGNAL mux_759_nl : STD_LOGIC;
  SIGNAL mux_758_nl : STD_LOGIC;
  SIGNAL mux_757_nl : STD_LOGIC;
  SIGNAL or_801_nl : STD_LOGIC;
  SIGNAL or_798_nl : STD_LOGIC;
  SIGNAL mux_756_nl : STD_LOGIC;
  SIGNAL or_797_nl : STD_LOGIC;
  SIGNAL mux_755_nl : STD_LOGIC;
  SIGNAL nor_199_nl : STD_LOGIC;
  SIGNAL mux_753_nl : STD_LOGIC;
  SIGNAL or_794_nl : STD_LOGIC;
  SIGNAL or_791_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL or_273_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL or_297_nl : STD_LOGIC;
  SIGNAL or_293_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL or_294_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL or_291_nl : STD_LOGIC;
  SIGNAL or_287_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL or_285_nl : STD_LOGIC;
  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL or_315_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL or_326_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL or_332_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL or_338_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL or_337_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL and_302_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL nor_87_nl : STD_LOGIC;
  SIGNAL nor_88_nl : STD_LOGIC;
  SIGNAL nor_89_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL or_361_nl : STD_LOGIC;
  SIGNAL or_372_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL or_415_nl : STD_LOGIC;
  SIGNAL or_432_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL or_427_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_76_nl : STD_LOGIC;
  SIGNAL nor_77_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL or_449_nl : STD_LOGIC;
  SIGNAL or_457_nl : STD_LOGIC;
  SIGNAL nand_24_nl : STD_LOGIC;
  SIGNAL or_455_nl : STD_LOGIC;
  SIGNAL or_466_nl : STD_LOGIC;
  SIGNAL or_8_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL or_495_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL or_197_nl : STD_LOGIC;
  SIGNAL or_201_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL or_202_nl : STD_LOGIC;
  SIGNAL or_199_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL or_502_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL or_499_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL or_504_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL or_509_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL or_508_nl : STD_LOGIC;
  SIGNAL or_503_nl : STD_LOGIC;
  SIGNAL or_511_nl : STD_LOGIC;
  SIGNAL or_516_nl : STD_LOGIC;
  SIGNAL or_514_nl : STD_LOGIC;
  SIGNAL or_517_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL or_525_nl : STD_LOGIC;
  SIGNAL or_38_nl : STD_LOGIC;
  SIGNAL or_41_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL or_543_nl : STD_LOGIC;
  SIGNAL or_575_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL or_725_nl : STD_LOGIC;
  SIGNAL mux_554_nl : STD_LOGIC;
  SIGNAL nor_62_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL or_598_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL or_635_nl : STD_LOGIC;
  SIGNAL nor_55_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL or_645_nl : STD_LOGIC;
  SIGNAL or_641_nl : STD_LOGIC;
  SIGNAL mux_616_nl : STD_LOGIC;
  SIGNAL or_653_nl : STD_LOGIC;
  SIGNAL mux_615_nl : STD_LOGIC;
  SIGNAL mux_614_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL or_651_nl : STD_LOGIC;
  SIGNAL mux_612_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL or_718_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL mux_663_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_5_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_142_nl : STD_LOGIC;
  SIGNAL and_143_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL or_409_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_3_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL nor_79_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL and_301_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL nor_84_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_1_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL or_728_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL or_357_nl : STD_LOGIC;
  SIGNAL or_356_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL nand_15_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL nand_14_nl : STD_LOGIC;
  SIGNAL or_349_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL or_729_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL or_333_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL or_331_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL or_327_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL or_322_nl : STD_LOGIC;
  SIGNAL or_320_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_2_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL or_370_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL or_367_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_4_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL or_401_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL or_400_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL or_398_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL or_397_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_153_nl : STD_LOGIC;
  SIGNAL and_155_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL or_465_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_9_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL or_463_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL or_462_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL or_461_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL nor_75_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_7_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL or_732_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL or_437_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL or_436_nl : STD_LOGIC;
  SIGNAL nand_21_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_6_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL or_426_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL or_425_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL or_422_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_8_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL or_454_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL or_453_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL or_447_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL or_443_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_4_nl : STD_LOGIC;
  SIGNAL or_735_nl : STD_LOGIC;
  SIGNAL mux_701_nl : STD_LOGIC;
  SIGNAL mux_700_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL or_765_nl : STD_LOGIC;
  SIGNAL or_792_nl : STD_LOGIC;
  SIGNAL or_796_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_18_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_126_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_127_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_and_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_and_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_mux1h_128_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_or_25_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_26_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_or_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_75_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_49_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL and_1264_nl : STD_LOGIC;
  SIGNAL and_1265_nl : STD_LOGIC;
  SIGNAL and_1266_nl : STD_LOGIC;
  SIGNAL and_1267_nl : STD_LOGIC;
  SIGNAL and_1268_nl : STD_LOGIC;
  SIGNAL and_1269_nl : STD_LOGIC;
  SIGNAL and_1270_nl : STD_LOGIC;
  SIGNAL and_1271_nl : STD_LOGIC;
  SIGNAL and_1272_nl : STD_LOGIC;
  SIGNAL and_1273_nl : STD_LOGIC;
  SIGNAL and_1274_nl : STD_LOGIC;
  SIGNAL and_1275_nl : STD_LOGIC;
  SIGNAL and_1276_nl : STD_LOGIC;
  SIGNAL and_1277_nl : STD_LOGIC;
  SIGNAL and_1278_nl : STD_LOGIC;
  SIGNAL and_1279_nl : STD_LOGIC;
  SIGNAL and_1280_nl : STD_LOGIC;
  SIGNAL and_1281_nl : STD_LOGIC;
  SIGNAL and_1282_nl : STD_LOGIC;
  SIGNAL and_1283_nl : STD_LOGIC;
  SIGNAL and_1284_nl : STD_LOGIC;
  SIGNAL and_1285_nl : STD_LOGIC;
  SIGNAL and_1286_nl : STD_LOGIC;
  SIGNAL and_1287_nl : STD_LOGIC;
  SIGNAL and_1288_nl : STD_LOGIC;
  SIGNAL and_1289_nl : STD_LOGIC;
  SIGNAL and_1290_nl : STD_LOGIC;
  SIGNAL and_1291_nl : STD_LOGIC;
  SIGNAL and_1292_nl : STD_LOGIC;
  SIGNAL and_1293_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_16_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_17_nl : STD_LOGIC;
  SIGNAL acc_22_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_mux_7_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_or_76_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_8_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL acc_23_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_or_77_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_50_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_51_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_or_78_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_and_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_9_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_52_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL VEC_LOOP_or_79_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_10_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_17_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_18_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_19_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_mux_3_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_1294_nl : STD_LOGIC;
  SIGNAL acc_25_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_20_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_11_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_80_nl : STD_LOGIC;
  SIGNAL mux_761_nl : STD_LOGIC;
  SIGNAL mux_762_nl : STD_LOGIC;
  SIGNAL mux_763_nl : STD_LOGIC;
  SIGNAL mux_764_nl : STD_LOGIC;
  SIGNAL mux_765_nl : STD_LOGIC;
  SIGNAL mux_766_nl : STD_LOGIC;
  SIGNAL or_803_nl : STD_LOGIC;
  SIGNAL mux_767_nl : STD_LOGIC;
  SIGNAL mux_768_nl : STD_LOGIC;
  SIGNAL or_804_nl : STD_LOGIC;
  SIGNAL mux_769_nl : STD_LOGIC;
  SIGNAL mux_770_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_12_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_21_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_22_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_23_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_24_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_25_nl : STD_LOGIC;
  SIGNAL acc_26_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL VEC_LOOP_VEC_LOOP_or_26_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_53_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL VEC_LOOP_or_81_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux1h_54_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_and_26_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_55_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL VEC_LOOP_or_82_nl : STD_LOGIC;
  SIGNAL not_1368_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_and_2_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_VEC_LOOP_mux_13_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_mux1h_56_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

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
  SIGNAL COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

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
  SIGNAL COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_2_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (13 DOWNTO 0);

  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_3_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (12 DOWNTO 0);

  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_17_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (14 DOWNTO 0);

  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (11 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_core_run_rsci
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
  COMPONENT inPlaceNTT_DIF_precomp_core_wait_dp
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      ensig_cgo_iro_1 : IN STD_LOGIC;
      core_wen : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      COMP_LOOP_1_mult_cmp_ccs_ccore_en : OUT STD_LOGIC;
      ensig_cgo_1 : IN STD_LOGIC;
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1 : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_vec_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsci_oswt_1 : IN STD_LOGIC;
      vec_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_we_d_pff : OUT STD_LOGIC;
      vec_rsci_iswt0_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC;
      vec_rsci_oswt_1_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d_mxwt : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsci_oswt : IN STD_LOGIC;
      twiddle_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_oswt_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d_mxwt :
      STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      core_wen : IN STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsci_oswt : IN STD_LOGIC;
      twiddle_h_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_oswt_pff : IN STD_LOGIC;
      core_wten_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d_mxwt
      : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_core_complete_rsci
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
  COMPONENT inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj
    PORT(
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      vec_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj
    PORT(
      p_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      p_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj
    PORT(
      r_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      r_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj
    PORT(
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj
    PORT(
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      core_wten : IN STD_LOGIC;
      twiddle_h_rsc_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      core_wten : OUT STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      core_wten_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_precomp_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      complete_rsci_wen_comp : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      main_C_0_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_3_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_4_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_6_tr0 : IN STD_LOGIC;
      COMP_LOOP_5_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_6_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_8_tr0 : IN STD_LOGIC;
      COMP_LOOP_7_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_9_tr0 : IN STD_LOGIC;
      COMP_LOOP_8_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_10_tr0 : IN STD_LOGIC;
      COMP_LOOP_9_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_10_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
      COMP_LOOP_11_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_13_tr0 : IN STD_LOGIC;
      COMP_LOOP_12_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_14_tr0 : IN STD_LOGIC;
      COMP_LOOP_13_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_15_tr0 : IN STD_LOGIC;
      COMP_LOOP_14_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
      COMP_LOOP_15_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_17_tr0 : IN STD_LOGIC;
      COMP_LOOP_16_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_18_tr0 : IN STD_LOGIC;
      COMP_LOOP_17_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_19_tr0 : IN STD_LOGIC;
      COMP_LOOP_18_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_20_tr0 : IN STD_LOGIC;
      COMP_LOOP_19_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_21_tr0 : IN STD_LOGIC;
      COMP_LOOP_20_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_22_tr0 : IN STD_LOGIC;
      COMP_LOOP_21_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_23_tr0 : IN STD_LOGIC;
      COMP_LOOP_22_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_23_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_25_tr0 : IN STD_LOGIC;
      COMP_LOOP_24_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_26_tr0 : IN STD_LOGIC;
      COMP_LOOP_25_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_27_tr0 : IN STD_LOGIC;
      COMP_LOOP_26_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
      COMP_LOOP_27_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_29_tr0 : IN STD_LOGIC;
      COMP_LOOP_28_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_30_tr0 : IN STD_LOGIC;
      COMP_LOOP_29_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_31_tr0 : IN STD_LOGIC;
      COMP_LOOP_30_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_32_tr0 : IN STD_LOGIC;
      COMP_LOOP_31_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_33_tr0 : IN STD_LOGIC;
      COMP_LOOP_32_VEC_LOOP_C_7_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_34_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR
      (8 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_12_5_2(input_4 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_13_3_2(input_2 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(12 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(12 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_14_31_2(input_30 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(13 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(30 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_4_8_2(input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_5_29_2(input_28 : STD_LOGIC_VECTOR(4 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(28 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_9_37_2(input_36 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_35 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_34 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_33 : STD_LOGIC_VECTOR(8 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(36 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 34));
      result := result or ( input_34 and tmp);
      tmp := (OTHERS=>sel( 35));
      result := result or ( input_35 and tmp);
      tmp := (OTHERS=>sel( 36));
      result := result or ( input_36 and tmp);
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

  FUNCTION MUX1HOT_v_9_7_2(input_6 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
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

  FUNCTION READSLICE_1_15(input_val:STD_LOGIC_VECTOR(14 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 14);
  BEGIN
    RETURN input_val(sat_index);
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
      rscid => 14,
      width => 32
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

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
  COMP_LOOP_1_mult_cmp_x_rsc_dat <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z;
  COMP_LOOP_1_mult_cmp_y_rsc_dat <= COMP_LOOP_twiddle_f_1_sva;
  COMP_LOOP_1_mult_cmp_y_rsc_dat_1 <= COMP_LOOP_twiddle_help_1_sva;
  COMP_LOOP_1_mult_cmp_p_rsc_dat <= p_sva;
  COMP_LOOP_1_mult_cmp_return_rsc_z <= COMP_LOOP_1_mult_cmp_return_rsc_z_1;
  COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat <= NOT (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_504,
      ((fsm_output(8)) OR (MUX_s_1_2_2((MUX_s_1_2_2((NOT mux_508_cse), mux_245_cse,
      fsm_output(7))), or_471_cse, fsm_output(6)))), fsm_output(3))), (MUX_s_1_2_2(((fsm_output(8))
      OR (MUX_s_1_2_2(mux_tmp_502, mux_413_cse, fsm_output(6)))), mux_tmp_504, fsm_output(3))),
      fsm_output(0)));

  COMP_LOOP_1_modulo_sub_cmp : modulo_sub
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat <= READSLICE_32_33(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(vec_rsci_q_d_mxwt
      & '1') + UNSIGNED((NOT factor2_1_sva) & '1'), 33)), 1);
  COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_sub_cmp_return_rsc_z <= COMP_LOOP_1_modulo_sub_cmp_return_rsc_z_1;
  COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat <= NOT mux_548_itm;

  COMP_LOOP_1_modulo_add_cmp : modulo_add
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_add_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_add_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_add_cmp_base_rsc_dat <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(vec_rsci_q_d_mxwt)
      + UNSIGNED(factor2_1_sva), 32));
  COMP_LOOP_1_modulo_add_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_add_cmp_return_rsc_z <= COMP_LOOP_1_modulo_add_cmp_return_rsc_z_1;
  COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat <= NOT mux_548_itm;

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
  COMP_LOOP_17_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_28,
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
  COMP_LOOP_1_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(z_out_28, COMP_LOOP_1_twiddle_f_acc_cse_sva,
      (CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("10101")) AND and_335_cse)
      OR (CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11110")) AND and_335_cse));
  z_out_1 <= COMP_LOOP_1_twiddle_f_lshift_rg_z;

  inPlaceNTT_DIF_precomp_core_run_rsci_inst : inPlaceNTT_DIF_precomp_core_run_rsci
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
  inPlaceNTT_DIF_precomp_core_wait_dp_inst : inPlaceNTT_DIF_precomp_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => mux_498_rmff,
      ensig_cgo_iro_1 => inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1,
      core_wen => complete_rsci_wen_comp,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_1_mult_cmp_ccs_ccore_en => COMP_LOOP_1_mult_cmp_ccs_ccore_en,
      ensig_cgo_1 => reg_ensig_cgo_1_cse,
      COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en => COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1 <= NOT mux_533_itm;

  inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst : inPlaceNTT_DIF_precomp_core_vec_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsci_q_d => inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      vec_rsci_oswt_1 => reg_vec_rsci_oswt_1_cse,
      vec_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d_mxwt,
      vec_rsci_we_d_pff => vec_rsci_we_d_iff,
      vec_rsci_iswt0_pff => inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff,
      core_wten_pff => core_wten_iff,
      vec_rsci_oswt_1_pff => inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d <= vec_rsci_q_d;
  vec_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_q_d_mxwt;
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff <= NOT (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_224,
      (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_235, (MUX_s_1_2_2(mux_tmp_225, mux_tmp_218,
      fsm_output(2))), fsm_output(3))), (MUX_s_1_2_2(mux_tmp_222, mux_tmp_235, fsm_output(3))),
      fsm_output(0))), fsm_output(4))), (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(5))
      AND (NOT mux_tmp_228))), mux_tmp_225, fsm_output(2))), mux_tmp_219, fsm_output(3))),
      (MUX_s_1_2_2((MUX_s_1_2_2(nand_tmp_7, or_tmp_126, fsm_output(2))), (MUX_s_1_2_2(mux_tmp_226,
      mux_tmp_225, fsm_output(2))), fsm_output(3))), fsm_output(0))), mux_tmp_224,
      fsm_output(4))), fsm_output(1)));
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff <= NOT mux_276_itm;

  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst : inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_rsci_q_d => inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d_mxwt,
      twiddle_rsci_oswt_pff => mux_431_rmff,
      core_wten_pff => core_wten_iff
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_q_d_mxwt;

  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst : inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      twiddle_h_rsci_q_d => inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d,
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg,
      core_wen => complete_rsci_wen_comp,
      core_wten => core_wten,
      twiddle_h_rsci_oswt => reg_twiddle_rsci_oswt_cse,
      twiddle_h_rsci_q_d_mxwt => inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d_mxwt,
      twiddle_h_rsci_oswt_pff => mux_431_rmff,
      core_wten_pff => core_wten_iff
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d <= twiddle_h_rsci_q_d;
  twiddle_h_rsci_q_d_mxwt <= inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_q_d_mxwt;

  inPlaceNTT_DIF_precomp_core_complete_rsci_inst : inPlaceNTT_DIF_precomp_core_complete_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      core_wen => complete_rsci_wen_comp,
      complete_rsci_oswt => reg_complete_rsci_oswt_cse,
      complete_rsci_wen_comp => complete_rsci_wen_comp
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_inst : inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj
    PORT MAP(
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      core_wten => core_wten,
      vec_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_inst : inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj
    PORT MAP(
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      core_wten => core_wten,
      p_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_inst : inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj
    PORT MAP(
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      core_wten => core_wten,
      r_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_inst : inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj
    PORT MAP(
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_inst : inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj
    PORT MAP(
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      core_wten => core_wten,
      twiddle_h_rsc_triosy_obj_iswt0 => reg_vec_rsc_triosy_obj_iswt0_cse
    );
  inPlaceNTT_DIF_precomp_core_staller_inst : inPlaceNTT_DIF_precomp_core_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      core_wten => core_wten,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      core_wten_pff => core_wten_iff
    );
  inPlaceNTT_DIF_precomp_core_core_fsm_inst : inPlaceNTT_DIF_precomp_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      complete_rsci_wen_comp => complete_rsci_wen_comp,
      fsm_output => inPlaceNTT_DIF_precomp_core_core_fsm_inst_fsm_output,
      main_C_0_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0,
      COMP_LOOP_1_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_3_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0,
      COMP_LOOP_2_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_4_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0,
      COMP_LOOP_3_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_5_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0,
      COMP_LOOP_4_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_6_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0,
      COMP_LOOP_5_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0,
      COMP_LOOP_6_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_8_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0,
      COMP_LOOP_7_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_9_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0,
      COMP_LOOP_8_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_10_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0,
      COMP_LOOP_9_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_11_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0,
      COMP_LOOP_10_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_12_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0,
      COMP_LOOP_11_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_13_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0,
      COMP_LOOP_12_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_14_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0,
      COMP_LOOP_13_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_15_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0,
      COMP_LOOP_14_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_16_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0,
      COMP_LOOP_15_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_17_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0,
      COMP_LOOP_16_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_18_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0,
      COMP_LOOP_17_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_19_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0,
      COMP_LOOP_18_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_20_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0,
      COMP_LOOP_19_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_21_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0,
      COMP_LOOP_20_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_22_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0,
      COMP_LOOP_21_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_23_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0,
      COMP_LOOP_22_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_24_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0,
      COMP_LOOP_23_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_25_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0,
      COMP_LOOP_24_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_26_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0,
      COMP_LOOP_25_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_27_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0,
      COMP_LOOP_26_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_28_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0,
      COMP_LOOP_27_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_29_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0,
      COMP_LOOP_28_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_30_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0,
      COMP_LOOP_29_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_31_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0,
      COMP_LOOP_30_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_32_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0,
      COMP_LOOP_31_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_33_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0,
      COMP_LOOP_32_VEC_LOOP_C_7_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_34_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIF_precomp_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 <= NOT run_ac_sync_tmp_dobj_sva;
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 <= NOT (z_out_27(12));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 <= NOT (z_out_27(11));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 <= NOT (z_out_27(12));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 <= NOT (z_out_26(10));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 <= NOT (z_out_30(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 <= NOT (z_out_27(12));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 <= NOT (z_out_27(11));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 <= NOT (z_out_27(12));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 <= NOT (z_out_29(14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 <= NOT (z_out_30(9));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0 <= VEC_LOOP_j_14_0_1_sva_1(14);
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 <= NOT (READSLICE_1_15(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_31
      & STD_LOGIC_VECTOR'( "00000")) + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(14
      DOWNTO 1)))) + SIGNED'( "000000000000001"), 15)), 14));
  inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= NOT STAGE_LOOP_acc_itm_4_1;

  mux_273_nl <= MUX_s_1_2_2(mux_tmp_267, mux_tmp_265, fsm_output(5));
  mux_271_nl <= MUX_s_1_2_2(or_406_cse, mux_tmp_262, or_317_cse);
  mux_272_nl <= MUX_s_1_2_2(or_tmp_155, mux_271_nl, fsm_output(5));
  mux_274_nl <= MUX_s_1_2_2(mux_273_nl, mux_272_nl, fsm_output(6));
  mux_268_nl <= MUX_s_1_2_2(mux_tmp_262, (NOT mux_tmp_263), or_317_cse);
  mux_269_nl <= MUX_s_1_2_2(mux_268_nl, mux_tmp_267, fsm_output(5));
  mux_266_nl <= MUX_s_1_2_2(mux_tmp_265, or_tmp_155, fsm_output(5));
  mux_270_nl <= MUX_s_1_2_2(mux_269_nl, mux_266_nl, fsm_output(6));
  mux_275_nl <= MUX_s_1_2_2(mux_274_nl, mux_270_nl, fsm_output(2));
  or_308_nl <= (fsm_output(4)) OR (fsm_output(7));
  mux_258_nl <= MUX_s_1_2_2(or_308_nl, or_tmp_151, fsm_output(1));
  or_306_nl <= (NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(7));
  mux_259_nl <= MUX_s_1_2_2(mux_258_nl, or_306_nl, or_317_cse);
  or_309_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_259_nl;
  or_303_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR nor_91_cse
      OR (fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(7));
  mux_260_nl <= MUX_s_1_2_2(or_309_nl, or_303_nl, fsm_output(2));
  mux_276_itm <= MUX_s_1_2_2(mux_275_nl, mux_260_nl, fsm_output(8));
  or_354_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_303_cse <= MUX_s_1_2_2(or_277_cse, or_354_cse, fsm_output(4));
  mux_304_cse <= MUX_s_1_2_2(mux_303_cse, mux_tmp_299, fsm_output(1));
  or_365_cse <= (NOT (fsm_output(4))) OR (fsm_output(8)) OR (fsm_output(7));
  or_364_cse <= (fsm_output(4)) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  or_380_cse <= (fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(1)))
      OR (fsm_output(4));
  nor_81_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(4)));
  mux_329_cse <= MUX_s_1_2_2(nor_81_nl, mux_tmp_246, fsm_output(7));
  or_379_nl <= (fsm_output(8)) OR mux_tmp_325;
  mux_328_cse <= MUX_s_1_2_2(or_380_cse, or_379_nl, fsm_output(2));
  or_406_cse <= (fsm_output(7)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  or_408_cse <= (NOT (fsm_output(8))) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (fsm_output(4));
  or_410_cse <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (NOT (fsm_output(1))) OR (fsm_output(4));
  or_434_cse <= (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_379_cse <= MUX_s_1_2_2(or_434_cse, mux_303_cse, fsm_output(1));
  or_474_cse <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT (fsm_output(1)))
      OR (fsm_output(4));
  or_471_cse <= (NOT (fsm_output(7))) OR (NOT (fsm_output(2))) OR (fsm_output(5))
      OR (NOT (fsm_output(1))) OR (fsm_output(4));
  or_473_cse <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT mux_tmp_246);
  mux_413_cse <= MUX_s_1_2_2(or_474_cse, or_473_cse, fsm_output(7));
  nor_70_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR
      (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR (fsm_output(3)));
  mux_426_nl <= MUX_s_1_2_2(or_tmp_324, mux_tmp_421, fsm_output(4));
  mux_427_nl <= MUX_s_1_2_2(mux_426_nl, or_tmp_321, fsm_output(1));
  mux_428_nl <= MUX_s_1_2_2(mux_tmp_423, (NOT mux_427_nl), fsm_output(2));
  mux_429_nl <= MUX_s_1_2_2(nor_70_nl, mux_428_nl, VEC_LOOP_j_14_0_1_sva_1(14));
  or_487_nl <= (fsm_output(0)) OR (NOT (fsm_output(3)));
  mux_424_nl <= MUX_s_1_2_2((NOT mux_tmp_419), or_487_nl, fsm_output(6));
  nor_71_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR
      mux_424_nl);
  mux_425_nl <= MUX_s_1_2_2(nor_71_nl, mux_tmp_423, fsm_output(2));
  and_300_nl <= (VEC_LOOP_j_14_0_1_sva_1(14)) AND mux_425_nl;
  mux_430_nl <= MUX_s_1_2_2(mux_429_nl, and_300_nl, fsm_output(5));
  or_478_nl <= (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR (fsm_output(3));
  mux_417_nl <= MUX_s_1_2_2(or_tmp_324, or_478_nl, fsm_output(4));
  mux_418_nl <= MUX_s_1_2_2(mux_417_nl, or_tmp_321, fsm_output(1));
  nor_72_nl <= NOT((fsm_output(5)) OR (NOT (VEC_LOOP_j_14_0_1_sva_1(14))) OR (fsm_output(2))
      OR mux_418_nl);
  mux_431_rmff <= MUX_s_1_2_2(mux_430_nl, nor_72_nl, fsm_output(8));
  COMP_LOOP_twiddle_f_mux1h_5_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_twiddle_f_mul_cse_10_sva(2)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(1)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)),
      STD_LOGIC_VECTOR'( and_dcpl_136 & and_dcpl_138 & and_dcpl_144));
  COMP_LOOP_twiddle_f_mux1h_5_rmff <= COMP_LOOP_twiddle_f_mux1h_5_nl AND (NOT(xor_dcpl_1
      AND (NOT (fsm_output(2))) AND and_dcpl_118 AND and_dcpl_140));
  COMP_LOOP_twiddle_f_mux1h_10_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_twiddle_f_mul_cse_10_sva(3)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(2)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)), STD_LOGIC_VECTOR'( and_dcpl_136
      & and_dcpl_138 & and_dcpl_144 & and_dcpl_151));
  COMP_LOOP_twiddle_f_mux1h_10_rmff <= COMP_LOOP_twiddle_f_mux1h_10_nl AND (NOT((NOT
      (fsm_output(2))) AND (NOT (fsm_output(3))) AND (NOT (fsm_output(6))) AND and_dcpl_118
      AND and_dcpl_140));
  COMP_LOOP_twiddle_f_mux_nl <= MUX_s_1_2_2((COMP_LOOP_twiddle_f_mul_cse_10_sva(1)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(0)), and_dcpl_138);
  COMP_LOOP_twiddle_f_mux1h_13_rmff <= COMP_LOOP_twiddle_f_mux_nl AND (NOT(xor_dcpl_1
      AND (NOT((fsm_output(2)) XOR (fsm_output(5)))) AND (NOT (fsm_output(8))) AND
      and_dcpl_140));
  COMP_LOOP_twiddle_f_mux1h_19_nl <= MUX1HOT_s_1_5_2((COMP_LOOP_twiddle_f_mul_cse_10_sva(4)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(3)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(2)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(0)),
      STD_LOGIC_VECTOR'( and_dcpl_136 & and_dcpl_138 & and_dcpl_144 & and_dcpl_151
      & and_dcpl_159));
  or_523_nl <= (fsm_output(5)) OR (NOT((fsm_output(8)) AND mux_tmp_246));
  mux_456_nl <= MUX_s_1_2_2(or_523_nl, or_tmp_357, fsm_output(2));
  mux_457_nl <= MUX_s_1_2_2(mux_456_nl, mux_tmp_450, fsm_output(7));
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, or_tmp_363, fsm_output(6));
  mux_459_nl <= MUX_s_1_2_2(mux_tmp_452, mux_458_nl, fsm_output(3));
  or_521_nl <= (fsm_output(5)) OR (NOT (fsm_output(8))) OR (fsm_output(1)) OR (NOT
      (fsm_output(4)));
  mux_453_nl <= MUX_s_1_2_2(or_521_nl, mux_tmp_449, fsm_output(2));
  mux_454_nl <= MUX_s_1_2_2(mux_453_nl, mux_tmp_448, fsm_output(7));
  or_522_nl <= (fsm_output(6)) OR mux_454_nl;
  mux_455_nl <= MUX_s_1_2_2(or_522_nl, mux_tmp_452, fsm_output(3));
  mux_460_nl <= MUX_s_1_2_2(mux_459_nl, mux_455_nl, fsm_output(0));
  COMP_LOOP_twiddle_f_and_rmff <= COMP_LOOP_twiddle_f_mux1h_19_nl AND (NOT mux_460_nl);
  or_530_nl <= (NOT (fsm_output(8))) OR (fsm_output(3)) OR (fsm_output(6));
  mux_464_nl <= MUX_s_1_2_2(or_530_nl, or_529_cse, fsm_output(5));
  mux_465_nl <= MUX_s_1_2_2(mux_464_nl, or_tmp_371, fsm_output(2));
  or_531_nl <= (fsm_output(7)) OR mux_465_nl;
  mux_466_nl <= MUX_s_1_2_2(nand_tmp_26, or_531_nl, fsm_output(4));
  or_528_nl <= (fsm_output(7)) OR mux_tmp_462;
  mux_463_nl <= MUX_s_1_2_2(or_528_nl, nand_tmp_26, fsm_output(4));
  mux_467_nl <= MUX_s_1_2_2(mux_466_nl, mux_463_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux_rmff <= (COMP_LOOP_twiddle_f_mul_cse_10_sva(0)) AND (NOT((NOT
      mux_467_nl) AND (fsm_output(0))));
  and_184_nl <= and_dcpl_75 AND and_dcpl_20;
  COMP_LOOP_twiddle_f_mux1h_26_rmff <= MUX1HOT_v_9_6_2(COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (COMP_LOOP_twiddle_f_mul_cse_10_sva(13 DOWNTO 5)), (COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9
      & (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(8 DOWNTO 4))), (COMP_LOOP_13_twiddle_f_mul_psp_sva_11
      & (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10 DOWNTO 3))), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10
      DOWNTO 2)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(9 DOWNTO 1)), STD_LOGIC_VECTOR'(
      and_184_nl & and_dcpl_136 & and_dcpl_138 & and_dcpl_144 & and_dcpl_151 & and_dcpl_159));
  nand_27_nl <= NOT((fsm_output(4)) AND (NOT or_tmp_378));
  mux_494_nl <= MUX_s_1_2_2(nand_27_nl, mux_tmp_472, fsm_output(3));
  mux_492_nl <= MUX_s_1_2_2(or_tmp_17, or_tmp_378, fsm_output(4));
  mux_493_nl <= MUX_s_1_2_2(mux_tmp_481, mux_492_nl, fsm_output(3));
  mux_495_nl <= MUX_s_1_2_2(mux_494_nl, mux_493_nl, fsm_output(6));
  mux_490_nl <= MUX_s_1_2_2(mux_tmp_488, mux_tmp_485, fsm_output(3));
  mux_489_nl <= MUX_s_1_2_2((NOT mux_tmp_474), mux_tmp_488, fsm_output(3));
  mux_491_nl <= MUX_s_1_2_2(mux_490_nl, mux_489_nl, fsm_output(6));
  mux_496_nl <= MUX_s_1_2_2((NOT mux_495_nl), mux_491_nl, fsm_output(5));
  mux_486_nl <= MUX_s_1_2_2(mux_tmp_485, mux_tmp_479, fsm_output(3));
  nor_66_nl <= NOT((fsm_output(6)) OR (NOT mux_486_nl));
  nor_67_nl <= NOT((fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(1))
      OR (fsm_output(2)));
  mux_487_nl <= MUX_s_1_2_2(nor_66_nl, nor_67_nl, fsm_output(5));
  mux_497_nl <= MUX_s_1_2_2(mux_496_nl, mux_487_nl, fsm_output(8));
  mux_482_nl <= MUX_s_1_2_2(mux_18_cse, mux_tmp_481, fsm_output(3));
  mux_480_nl <= MUX_s_1_2_2((NOT mux_tmp_479), mux_18_cse, fsm_output(3));
  mux_483_nl <= MUX_s_1_2_2(mux_482_nl, mux_480_nl, fsm_output(6));
  mux_475_nl <= MUX_s_1_2_2(mux_tmp_470, mux_tmp_474, fsm_output(3));
  mux_473_nl <= MUX_s_1_2_2(mux_tmp_472, mux_tmp_470, fsm_output(3));
  mux_476_nl <= MUX_s_1_2_2(mux_475_nl, mux_473_nl, fsm_output(6));
  mux_484_nl <= MUX_s_1_2_2(mux_483_nl, mux_476_nl, fsm_output(5));
  nor_68_nl <= NOT((fsm_output(8)) OR mux_484_nl);
  mux_498_rmff <= MUX_s_1_2_2(mux_497_nl, nor_68_nl, fsm_output(7));
  nor_65_nl <= NOT((fsm_output(5)) OR (NOT mux_tmp_246));
  mux_508_cse <= MUX_s_1_2_2(nor_65_nl, and_33_cse, fsm_output(2));
  mux_529_nl <= MUX_s_1_2_2(or_tmp_409, mux_539_cse, fsm_output(3));
  mux_527_nl <= MUX_s_1_2_2(or_365_cse, or_434_cse, fsm_output(1));
  mux_528_nl <= MUX_s_1_2_2(mux_527_nl, or_tmp_409, fsm_output(3));
  mux_530_nl <= MUX_s_1_2_2(mux_529_nl, mux_528_nl, fsm_output(0));
  mux_531_nl <= MUX_s_1_2_2(mux_530_nl, mux_tmp_515, fsm_output(5));
  mux_525_nl <= MUX_s_1_2_2(mux_539_cse, mux_375_cse, or_317_cse);
  mux_526_nl <= MUX_s_1_2_2(or_tmp_401, mux_525_nl, fsm_output(5));
  mux_532_nl <= MUX_s_1_2_2(mux_531_nl, mux_526_nl, fsm_output(6));
  mux_522_nl <= MUX_s_1_2_2(mux_304_cse, mux_379_cse, or_317_cse);
  mux_518_nl <= MUX_s_1_2_2(or_tmp_409, mux_539_cse, nor_32_cse);
  mux_523_nl <= MUX_s_1_2_2(mux_522_nl, mux_518_nl, fsm_output(5));
  mux_516_nl <= MUX_s_1_2_2(mux_tmp_515, or_tmp_401, fsm_output(5));
  mux_524_nl <= MUX_s_1_2_2(mux_523_nl, mux_516_nl, fsm_output(6));
  mux_533_itm <= MUX_s_1_2_2(mux_532_nl, mux_524_nl, fsm_output(2));
  mux_539_cse <= MUX_s_1_2_2(mux_tmp_299, or_365_cse, fsm_output(1));
  or_578_cse <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR mux_539_cse;
  mux_542_nl <= MUX_s_1_2_2(or_408_cse, mux_304_cse, fsm_output(2));
  or_581_nl <= (fsm_output(5)) OR mux_542_nl;
  mux_543_cse <= MUX_s_1_2_2(or_581_nl, or_578_cse, fsm_output(6));
  or_724_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR mux_379_cse;
  mux_546_nl <= MUX_s_1_2_2(or_724_nl, mux_tmp_537, fsm_output(6));
  mux_547_nl <= MUX_s_1_2_2(mux_tmp_538, mux_546_nl, fsm_output(3));
  mux_544_nl <= MUX_s_1_2_2(mux_543_cse, mux_tmp_538, fsm_output(3));
  mux_548_itm <= MUX_s_1_2_2(mux_547_nl, mux_544_nl, fsm_output(0));
  or_260_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  COMP_LOOP_1_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out_1(8
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0)), 9));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_twiddle_f_mul_nl),
      9)), (z_out_30(8 DOWNTO 0)), and_dcpl_25);
  mux_562_nl <= MUX_s_1_2_2((fsm_output(1)), (fsm_output(2)), fsm_output(0));
  and_233_nl <= mux_562_nl AND and_dcpl_21 AND and_dcpl_20;
  COMP_LOOP_twiddle_f_or_6_nl <= (and_dcpl_77 AND and_dcpl_20) OR (and_dcpl_86 AND
      and_dcpl_38) OR (and_dcpl_95 AND and_dcpl_55) OR (and_dcpl_104 AND and_dcpl_66)
      OR and_dcpl_159 OR (and_dcpl_33 AND and_dcpl_83) OR (and_dcpl_52 AND and_dcpl_90)
      OR (and_dcpl_63 AND and_dcpl_99);
  COMP_LOOP_twiddle_f_or_7_nl <= and_dcpl_34 OR and_dcpl_53 OR and_dcpl_64 OR and_dcpl_76
      OR and_dcpl_85 OR and_dcpl_94 OR and_dcpl_103 OR and_dcpl_113;
  COMP_LOOP_twiddle_f_mux1h_40_rgt <= MUX1HOT_v_13_3_2((STD_LOGIC_VECTOR'( "0000")
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl), (z_out_2(12 DOWNTO 0)),
      z_out_27, STD_LOGIC_VECTOR'( and_233_nl & COMP_LOOP_twiddle_f_or_6_nl & COMP_LOOP_twiddle_f_or_7_nl));
  nor_207_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  or_720_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_295_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_twiddle_help_and_cse <= complete_rsci_wen_comp AND (NOT mux_617_itm);
  VEC_LOOP_or_13_cse <= and_dcpl_25 OR and_dcpl_80;
  or_713_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"));
  and_1247_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("01001")) AND
      and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  mul_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_9_twiddle_f_lshift_ncse_sva)
      * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & and_1247_nl & '1')), 11));
  COMP_LOOP_twiddle_f_or_3_nl <= and_dcpl_60 OR and_dcpl_98;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl <= MUX_v_11_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mul_1_nl),
      11)), z_out_26, COMP_LOOP_twiddle_f_or_3_nl);
  COMP_LOOP_twiddle_f_or_4_nl <= (and_dcpl_81 AND and_dcpl_20) OR (and_dcpl_100 AND
      and_dcpl_66) OR (and_dcpl_24 AND and_dcpl_83) OR (and_dcpl_59 AND and_dcpl_99);
  COMP_LOOP_twiddle_f_or_5_nl <= and_dcpl_45 OR and_dcpl_70 OR and_dcpl_89 OR and_dcpl_109;
  nor_209_nl <= NOT((fsm_output(4)) OR nor_201_cse);
  nor_210_nl <= NOT((fsm_output(4)) OR and_dcpl_56);
  mux_693_nl <= MUX_s_1_2_2(nor_209_nl, nor_210_nl, fsm_output(3));
  mux_691_nl <= MUX_s_1_2_2(or_dcpl_153, or_713_cse, fsm_output(4));
  mux_692_nl <= MUX_s_1_2_2((fsm_output(4)), mux_691_nl, fsm_output(3));
  mux_694_nl <= MUX_s_1_2_2(mux_693_nl, mux_692_nl, fsm_output(7));
  and_283_nl <= mux_694_nl AND and_dcpl_54 AND (NOT (fsm_output(8)));
  COMP_LOOP_twiddle_f_mux1h_65_rgt <= MUX1HOT_v_12_3_2((z_out_2(11 DOWNTO 0)), (z_out_27(11
      DOWNTO 0)), ('0' & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl), STD_LOGIC_VECTOR'(
      COMP_LOOP_twiddle_f_or_4_nl & COMP_LOOP_twiddle_f_or_5_nl & and_283_nl));
  nor_201_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  or_785_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  or_799_cse <= (fsm_output(2)) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(5)))
      OR (fsm_output(8));
  or_317_cse <= (NOT (fsm_output(0))) OR (fsm_output(3));
  nor_91_cse <= NOT((NOT (fsm_output(0))) OR (fsm_output(3)));
  or_529_cse <= (fsm_output(8)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  nor_32_cse <= NOT((fsm_output(0)) OR (NOT (fsm_output(3))));
  VEC_LOOP_acc_10_cse_2_sva_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_3_sva_mx0w2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_4_sva_mx0w3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_5_sva_mx0w4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_6_sva_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_7_sva_mx0w6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_8_sva_mx0w7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_9_sva_mx0w8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_10_sva_mx0w9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_11_sva_mx0w10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_12_sva_mx0w11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_13_sva_mx0w12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_14_sva_mx0w13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_15_sva_mx0w14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_16_sva_mx0w15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_18_sva_mx0w17 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_19_sva_mx0w18 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_20_sva_mx0w19 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_21_sva_mx0w20 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_22_sva_mx0w21 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_23_sva_mx0w22 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_24_sva_mx0w23 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_25_sva_mx0w24 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_26_sva_mx0w25 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_27_sva_mx0w26 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_28_sva_mx0w27 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_29_sva_mx0w28 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_30_sva_mx0w29 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_31_sva_mx0w30 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  VEC_LOOP_acc_10_cse_sva_mx0w31 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_5)
      + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva), 14));
  nor_tmp <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_tmp_17 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_18_cse <= MUX_s_1_2_2((NOT nor_tmp), or_tmp_17, fsm_output(4));
  or_730_cse <= (NOT (fsm_output(4))) OR (fsm_output(1));
  and_dcpl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  nor_tmp_15 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_136 <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(3));
  not_tmp_138 <= MUX_s_1_2_2((fsm_output(6)), (NOT (fsm_output(6))), fsm_output(3));
  or_dcpl_153 <= or_tmp_17 OR (fsm_output(0));
  or_tmp_116 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  or_tmp_119 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  mux_215_nl <= MUX_s_1_2_2(or_tmp_116, or_tmp_119, fsm_output(5));
  or_273_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_214_nl <= MUX_s_1_2_2(or_273_nl, or_tmp_116, fsm_output(5));
  mux_tmp_216 <= MUX_s_1_2_2(mux_215_nl, mux_214_nl, fsm_output(2));
  or_tmp_120 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_218 <= MUX_s_1_2_2(or_tmp_120, or_tmp_116, fsm_output(5));
  mux_217_nl <= MUX_s_1_2_2(or_tmp_119, or_tmp_120, fsm_output(5));
  mux_tmp_219 <= MUX_s_1_2_2(mux_tmp_218, mux_217_nl, fsm_output(2));
  or_tmp_122 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_277_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_221 <= MUX_s_1_2_2(or_tmp_122, or_277_cse, fsm_output(6));
  nand_tmp_7 <= NOT((fsm_output(5)) AND (NOT mux_tmp_221));
  or_279_nl <= (fsm_output(5)) OR mux_tmp_221;
  mux_tmp_222 <= MUX_s_1_2_2(or_279_nl, nand_tmp_7, fsm_output(2));
  mux_223_nl <= MUX_s_1_2_2(mux_tmp_216, mux_tmp_222, fsm_output(3));
  mux_220_nl <= MUX_s_1_2_2(mux_tmp_219, mux_tmp_216, fsm_output(3));
  mux_tmp_224 <= MUX_s_1_2_2(mux_223_nl, mux_220_nl, fsm_output(0));
  or_tmp_124 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_225 <= MUX_s_1_2_2(or_tmp_116, or_tmp_124, fsm_output(5));
  mux_tmp_226 <= MUX_s_1_2_2(or_tmp_124, or_tmp_120, fsm_output(5));
  mux_tmp_228 <= MUX_s_1_2_2(or_354_cse, or_tmp_122, fsm_output(6));
  or_tmp_126 <= (fsm_output(5)) OR mux_tmp_228;
  mux_tmp_235 <= MUX_s_1_2_2(or_tmp_126, mux_tmp_226, fsm_output(2));
  or_289_cse <= (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_tmp_243 <= MUX_s_1_2_2(or_730_cse, or_289_cse, fsm_output(5));
  mux_tmp_246 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(1));
  and_33_cse <= (fsm_output(5)) AND mux_tmp_246;
  and_tmp_16 <= (fsm_output(3)) AND mux_508_cse;
  or_tmp_140 <= (fsm_output(3)) OR (NOT mux_508_cse);
  or_297_nl <= (fsm_output(5)) OR (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_249_cse <= MUX_s_1_2_2(or_297_nl, mux_tmp_243, fsm_output(2));
  nand_tmp_9 <= NOT((fsm_output(3)) AND (NOT mux_249_cse));
  or_299_cse <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(1)) OR (NOT
      (fsm_output(4)));
  or_293_nl <= (NOT (fsm_output(5))) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_245_cse <= MUX_s_1_2_2(mux_tmp_243, or_293_nl, fsm_output(2));
  nand_10_cse <= NOT((fsm_output(2)) AND (NOT mux_tmp_243));
  mux_253_nl <= MUX_s_1_2_2(nand_10_cse, or_299_cse, fsm_output(3));
  mux_254_nl <= MUX_s_1_2_2(mux_253_nl, nand_tmp_9, fsm_output(6));
  mux_252_nl <= MUX_s_1_2_2(or_tmp_140, (NOT and_tmp_16), fsm_output(6));
  mux_255_nl <= MUX_s_1_2_2(mux_254_nl, mux_252_nl, fsm_output(7));
  mux_250_nl <= MUX_s_1_2_2(nand_tmp_9, or_tmp_140, fsm_output(6));
  or_294_nl <= (fsm_output(3)) OR mux_245_cse;
  mux_248_nl <= MUX_s_1_2_2((NOT and_tmp_16), or_294_nl, fsm_output(6));
  mux_251_nl <= MUX_s_1_2_2(mux_250_nl, mux_248_nl, fsm_output(7));
  mux_256_nl <= MUX_s_1_2_2(mux_255_nl, mux_251_nl, fsm_output(0));
  or_291_nl <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(2))
      OR mux_tmp_243;
  or_285_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_242_nl <= MUX_s_1_2_2(or_474_cse, or_285_nl, fsm_output(3));
  or_287_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_242_nl;
  mux_244_nl <= MUX_s_1_2_2(or_291_nl, or_287_nl, fsm_output(0));
  mux_257_itm <= MUX_s_1_2_2(mux_256_nl, mux_244_nl, fsm_output(8));
  or_tmp_151 <= (NOT (fsm_output(4))) OR (fsm_output(7));
  or_tmp_155 <= nor_32_cse OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR (NOT (fsm_output(7)));
  mux_tmp_261 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(4));
  mux_tmp_262 <= MUX_s_1_2_2((NOT mux_tmp_261), or_tmp_151, fsm_output(1));
  nor_92_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(7))));
  mux_tmp_263 <= MUX_s_1_2_2(nor_92_nl, mux_tmp_261, fsm_output(1));
  mux_264_nl <= MUX_s_1_2_2(mux_tmp_262, (NOT mux_tmp_263), fsm_output(3));
  mux_tmp_265 <= MUX_s_1_2_2(mux_264_nl, mux_tmp_262, fsm_output(0));
  or_315_nl <= (NOT (fsm_output(3))) OR (fsm_output(1)) OR (NOT (fsm_output(4)))
      OR (fsm_output(7));
  or_314_nl <= (fsm_output(3)) OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR (NOT
      (fsm_output(7)));
  mux_tmp_267 <= MUX_s_1_2_2(or_315_nl, or_314_nl, fsm_output(0));
  and_dcpl_19 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_20 <= and_dcpl_19 AND and_dcpl;
  and_dcpl_21 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_22 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_23 <= and_dcpl_22 AND (fsm_output(0));
  and_dcpl_24 <= and_dcpl_23 AND and_dcpl_21;
  and_dcpl_25 <= and_dcpl_24 AND and_dcpl_20;
  or_326_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")) OR not_tmp_138;
  or_324_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_138;
  mux_tmp_279 <= MUX_s_1_2_2(or_326_nl, or_324_nl, fsm_output(4));
  or_tmp_174 <= (fsm_output(8)) OR (fsm_output(3)) OR (NOT (fsm_output(6)));
  mux_tmp_281 <= MUX_s_1_2_2(or_tmp_174, or_529_cse, fsm_output(7));
  or_332_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_tmp_283 <= MUX_s_1_2_2(or_332_nl, or_tmp_174, fsm_output(7));
  and_dcpl_26 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_28 <= nor_tmp AND (NOT (fsm_output(0)));
  and_dcpl_30 <= and_dcpl_28 AND and_dcpl_26 AND and_dcpl_20;
  and_dcpl_31 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_32 <= nor_tmp AND (fsm_output(0));
  and_dcpl_33 <= and_dcpl_32 AND and_dcpl_31;
  and_dcpl_34 <= and_dcpl_33 AND and_dcpl_20;
  or_tmp_179 <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (fsm_output(8)) OR (fsm_output(2))
      OR (NOT (fsm_output(5)));
  or_341_cse <= (fsm_output(8)) OR (fsm_output(2)) OR (NOT (fsm_output(5)));
  or_342_cse <= (fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(5));
  mux_289_cse <= MUX_s_1_2_2((fsm_output(5)), (NOT (fsm_output(5))), fsm_output(2));
  mux_292_nl <= MUX_s_1_2_2(or_342_cse, or_341_cse, fsm_output(3));
  or_339_nl <= (NOT (fsm_output(3))) OR (fsm_output(8)) OR (NOT (fsm_output(2)))
      OR (fsm_output(5));
  mux_293_nl <= MUX_s_1_2_2(mux_292_nl, or_339_nl, fsm_output(6));
  mux_294_nl <= MUX_s_1_2_2(or_tmp_179, mux_293_nl, fsm_output(7));
  or_337_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(2))) OR (fsm_output(5));
  or_336_nl <= (fsm_output(8)) OR mux_289_cse;
  mux_290_nl <= MUX_s_1_2_2(or_337_nl, or_336_nl, fsm_output(3));
  or_338_nl <= (fsm_output(6)) OR mux_290_nl;
  mux_291_nl <= MUX_s_1_2_2(or_338_nl, or_tmp_179, fsm_output(7));
  mux_295_itm <= MUX_s_1_2_2(mux_294_nl, mux_291_nl, fsm_output(4));
  and_dcpl_36 <= NOT(mux_295_itm OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_37 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_38 <= and_dcpl_37 AND and_dcpl;
  and_dcpl_40 <= nor_201_cse AND (NOT (fsm_output(0)));
  and_dcpl_41 <= and_dcpl_40 AND and_dcpl_21;
  and_dcpl_42 <= and_dcpl_41 AND and_dcpl_38;
  and_dcpl_43 <= nor_201_cse AND (fsm_output(0));
  and_dcpl_45 <= and_dcpl_43 AND and_dcpl_26 AND and_dcpl_38;
  and_dcpl_46 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_47 <= and_dcpl_46 AND (NOT (fsm_output(0)));
  nor_87_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01")));
  nor_88_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10")));
  mux_296_nl <= MUX_s_1_2_2(nor_87_nl, nor_88_nl, fsm_output(6));
  and_302_nl <= (fsm_output(5)) AND mux_296_nl;
  nor_89_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000")));
  mux_297_nl <= MUX_s_1_2_2(and_302_nl, nor_89_nl, fsm_output(8));
  nor_90_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(5))) OR (fsm_output(6)) OR
      (NOT and_295_cse));
  not_tmp_192 <= MUX_s_1_2_2(mux_297_nl, nor_90_nl, fsm_output(7));
  and_dcpl_48 <= not_tmp_192 AND and_dcpl_47;
  and_dcpl_50 <= and_dcpl_47 AND and_dcpl_31 AND and_dcpl_38;
  and_dcpl_51 <= and_dcpl_46 AND (fsm_output(0));
  and_dcpl_52 <= and_dcpl_51 AND and_295_cse;
  and_dcpl_53 <= and_dcpl_52 AND and_dcpl_38;
  and_dcpl_54 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_55 <= and_dcpl_54 AND and_dcpl;
  and_dcpl_56 <= and_dcpl_22 AND (NOT (fsm_output(0)));
  and_dcpl_58 <= and_dcpl_56 AND and_dcpl_21 AND and_dcpl_55;
  and_dcpl_59 <= and_dcpl_23 AND and_dcpl_26;
  and_dcpl_60 <= and_dcpl_59 AND and_dcpl_55;
  and_dcpl_61 <= and_dcpl_28 AND and_dcpl_31;
  and_dcpl_62 <= and_dcpl_61 AND and_dcpl_55;
  and_dcpl_63 <= and_dcpl_32 AND and_295_cse;
  and_dcpl_64 <= and_dcpl_63 AND and_dcpl_55;
  and_dcpl_66 <= nor_tmp_15 AND and_dcpl;
  and_dcpl_67 <= and_dcpl_40 AND and_dcpl_26;
  and_dcpl_68 <= and_dcpl_67 AND and_dcpl_66;
  and_dcpl_70 <= and_dcpl_43 AND and_dcpl_31 AND and_dcpl_66;
  and_dcpl_72 <= and_dcpl_47 AND and_295_cse AND and_dcpl_66;
  and_dcpl_73 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_74 <= and_dcpl_19 AND and_dcpl_73;
  and_dcpl_75 <= and_dcpl_51 AND and_dcpl_21;
  and_dcpl_76 <= and_dcpl_75 AND and_dcpl_74;
  and_dcpl_77 <= and_dcpl_56 AND and_dcpl_26;
  and_dcpl_78 <= and_dcpl_77 AND and_dcpl_74;
  and_dcpl_80 <= and_dcpl_23 AND and_dcpl_31 AND and_dcpl_74;
  and_dcpl_81 <= and_dcpl_28 AND and_295_cse;
  and_dcpl_82 <= and_dcpl_81 AND and_dcpl_74;
  and_dcpl_83 <= and_dcpl_37 AND and_dcpl_73;
  and_dcpl_85 <= and_dcpl_32 AND and_dcpl_21 AND and_dcpl_83;
  and_dcpl_86 <= and_dcpl_40 AND and_dcpl_31;
  and_dcpl_87 <= and_dcpl_86 AND and_dcpl_83;
  and_dcpl_89 <= and_dcpl_43 AND and_295_cse AND and_dcpl_83;
  and_dcpl_90 <= and_dcpl_54 AND and_dcpl_73;
  and_dcpl_92 <= and_dcpl_47 AND and_dcpl_21 AND and_dcpl_90;
  and_dcpl_94 <= and_dcpl_51 AND and_dcpl_26 AND and_dcpl_90;
  and_dcpl_95 <= and_dcpl_56 AND and_dcpl_31;
  and_dcpl_96 <= and_dcpl_95 AND and_dcpl_90;
  and_dcpl_98 <= and_dcpl_23 AND and_295_cse AND and_dcpl_90;
  and_dcpl_99 <= nor_tmp_15 AND and_dcpl_73;
  and_dcpl_100 <= and_dcpl_28 AND and_dcpl_21;
  and_dcpl_101 <= and_dcpl_100 AND and_dcpl_99;
  and_dcpl_103 <= and_dcpl_32 AND and_dcpl_26 AND and_dcpl_99;
  and_dcpl_104 <= and_dcpl_40 AND and_295_cse;
  and_dcpl_105 <= and_dcpl_104 AND and_dcpl_99;
  and_dcpl_106 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_107 <= and_dcpl_19 AND and_dcpl_106;
  and_dcpl_109 <= and_dcpl_43 AND and_dcpl_21 AND and_dcpl_107;
  and_dcpl_111 <= and_dcpl_47 AND and_dcpl_26 AND and_dcpl_107;
  and_dcpl_112 <= and_dcpl_51 AND and_dcpl_31;
  and_dcpl_113 <= and_dcpl_112 AND and_dcpl_107;
  and_dcpl_115 <= and_dcpl_56 AND and_295_cse AND and_dcpl_107;
  mux_tmp_299 <= MUX_s_1_2_2(or_tmp_122, or_277_cse, fsm_output(4));
  or_tmp_197 <= (fsm_output(3)) OR mux_539_cse;
  and_dcpl_116 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_118 <= NOT((fsm_output(5)) OR (fsm_output(8)));
  and_dcpl_119 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_122 <= and_dcpl_119 AND (fsm_output(6)) AND and_dcpl_118 AND and_dcpl_116
      AND xor_dcpl;
  or_tmp_202 <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(4)))
      OR (fsm_output(8)) OR (fsm_output(7));
  or_362_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  or_361_nl <= (fsm_output(5)) OR mux_tmp_299;
  mux_311_nl <= MUX_s_1_2_2(or_362_nl, or_361_nl, fsm_output(2));
  mux_tmp_312 <= MUX_s_1_2_2(mux_311_nl, or_tmp_202, fsm_output(6));
  nand_tmp_17 <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR mux_tmp_299;
  or_372_nl <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR mux_tmp_299;
  mux_tmp_319 <= MUX_s_1_2_2(nand_tmp_17, or_372_nl, fsm_output(6));
  mux_tmp_325 <= MUX_s_1_2_2((NOT mux_tmp_246), or_730_cse, fsm_output(7));
  and_dcpl_123 <= and_dcpl_61 AND and_dcpl_74;
  mux_tmp_335 <= MUX_s_1_2_2(or_289_cse, or_730_cse, fsm_output(2));
  or_tmp_237 <= (fsm_output(5)) OR (NOT((fsm_output(2)) AND mux_tmp_246));
  or_tmp_239 <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (NOT mux_tmp_246);
  mux_338_nl <= MUX_s_1_2_2(or_474_cse, or_tmp_239, fsm_output(6));
  mux_337_nl <= MUX_s_1_2_2(or_tmp_237, or_299_cse, fsm_output(6));
  mux_339_nl <= MUX_s_1_2_2(mux_338_nl, mux_337_nl, fsm_output(7));
  or_390_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000")) OR mux_tmp_335;
  mux_tmp_340 <= MUX_s_1_2_2(mux_339_nl, or_390_nl, fsm_output(8));
  mux_tmp_343 <= MUX_s_1_2_2(or_tmp_239, or_tmp_237, fsm_output(6));
  or_tmp_248 <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(8)) OR mux_tmp_325;
  or_tmp_258 <= (fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(3)) OR (NOT (fsm_output(6)));
  or_415_nl <= (fsm_output(5)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(3)))
      OR (fsm_output(6));
  mux_tmp_361 <= MUX_s_1_2_2(or_415_nl, or_tmp_258, fsm_output(7));
  or_tmp_260 <= (fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_tmp_362 <= MUX_s_1_2_2(or_tmp_258, or_tmp_260, fsm_output(7));
  or_tmp_262 <= (fsm_output(7)) OR (NOT (fsm_output(5))) OR (fsm_output(8)) OR not_tmp_138;
  or_tmp_264 <= (NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR (fsm_output(8))
      OR not_tmp_138;
  and_dcpl_126 <= (NOT mux_295_itm) AND and_dcpl_116;
  and_dcpl_127 <= not_tmp_192 AND and_dcpl_56;
  mux_375_cse <= MUX_s_1_2_2(or_364_cse, mux_tmp_299, fsm_output(1));
  or_432_nl <= (fsm_output(2)) OR (NOT (fsm_output(0))) OR (fsm_output(1)) OR (NOT
      (fsm_output(4))) OR (fsm_output(8)) OR (fsm_output(7));
  nand_20_nl <= NOT((fsm_output(0)) AND (NOT mux_375_cse));
  or_427_nl <= (NOT (fsm_output(0))) OR (fsm_output(1)) OR (NOT (fsm_output(4)))
      OR (fsm_output(8)) OR (fsm_output(7));
  mux_376_nl <= MUX_s_1_2_2(nand_20_nl, or_427_nl, fsm_output(2));
  mux_tmp_377 <= MUX_s_1_2_2(or_432_nl, mux_376_nl, fsm_output(5));
  nor_76_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")));
  nor_77_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")));
  mux_384_nl <= MUX_s_1_2_2(nor_76_nl, nor_77_nl, fsm_output(7));
  and_dcpl_132 <= mux_384_nl AND nor_201_cse AND (NOT (fsm_output(0))) AND (NOT (fsm_output(3)))
      AND (fsm_output(6)) AND (NOT (fsm_output(8)));
  or_442_nl <= (fsm_output(6)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(2)))
      OR (fsm_output(5));
  mux_tmp_385 <= MUX_s_1_2_2(or_442_nl, or_799_cse, fsm_output(7));
  mux_tmp_388 <= MUX_s_1_2_2(or_341_cse, or_342_cse, fsm_output(6));
  nand_tmp_23 <= NOT((fsm_output(7)) AND (NOT mux_tmp_388));
  or_449_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001")) OR mux_289_cse;
  mux_tmp_392 <= MUX_s_1_2_2(mux_tmp_385, or_449_nl, fsm_output(4));
  or_tmp_295 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")) OR
      mux_289_cse;
  and_tmp_18 <= (fsm_output(5)) AND mux_tmp_136;
  or_457_nl <= (fsm_output(5)) OR (fsm_output(3)) OR (NOT (fsm_output(6)));
  mux_tmp_400 <= MUX_s_1_2_2((NOT and_tmp_18), or_457_nl, fsm_output(2));
  nand_24_nl <= NOT((fsm_output(7)) AND (NOT mux_tmp_400));
  or_455_nl <= (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT
      (fsm_output(3))) OR (fsm_output(6));
  mux_tmp_401 <= MUX_s_1_2_2(nand_24_nl, or_455_nl, fsm_output(8));
  and_dcpl_133 <= and_dcpl_104 AND and_dcpl_74;
  nand_46_cse <= NOT((fsm_output(5)) AND mux_tmp_246);
  or_466_nl <= (fsm_output(2)) OR nand_46_cse;
  mux_tmp_411 <= MUX_s_1_2_2(mux_245_cse, or_466_nl, fsm_output(7));
  or_tmp_321 <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (NOT (fsm_output(3)));
  or_tmp_324 <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(0)) OR (NOT (fsm_output(3)));
  mux_tmp_419 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(0));
  mux_tmp_420 <= MUX_s_1_2_2(nor_91_cse, mux_tmp_419, fsm_output(6));
  and_tmp_20 <= (fsm_output(7)) AND mux_tmp_420;
  or_8_nl <= (fsm_output(6)) OR (fsm_output(0)) OR (NOT (fsm_output(3)));
  mux_tmp_421 <= MUX_s_1_2_2((NOT mux_tmp_420), or_8_nl, fsm_output(7));
  nor_74_nl <= NOT((fsm_output(4)) OR (NOT and_tmp_20));
  mux_422_nl <= MUX_s_1_2_2((NOT mux_tmp_421), and_tmp_20, fsm_output(4));
  mux_tmp_423 <= MUX_s_1_2_2(nor_74_nl, mux_422_nl, fsm_output(1));
  or_495_nl <= (fsm_output(5)) OR (NOT (fsm_output(7))) OR (fsm_output(3)) OR (NOT
      (fsm_output(6)));
  or_197_nl <= (fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  or_201_nl <= (NOT (fsm_output(7))) OR (fsm_output(3)) OR (NOT (fsm_output(6)));
  mux_432_nl <= MUX_s_1_2_2(or_197_nl, or_201_nl, fsm_output(5));
  mux_433_nl <= MUX_s_1_2_2(or_495_nl, mux_432_nl, fsm_output(2));
  or_490_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(7)) OR (NOT (fsm_output(3)))
      OR (fsm_output(6));
  mux_tmp_434 <= MUX_s_1_2_2(mux_433_nl, or_490_nl, fsm_output(8));
  or_202_nl <= (fsm_output(3)) OR (NOT (fsm_output(6)));
  or_199_nl <= (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_tmp_435 <= MUX_s_1_2_2(or_202_nl, or_199_nl, fsm_output(7));
  or_tmp_342 <= (fsm_output(5)) OR mux_tmp_435;
  or_501_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR not_tmp_138;
  mux_439_nl <= MUX_s_1_2_2(or_501_nl, or_tmp_342, fsm_output(2));
  or_502_nl <= (fsm_output(8)) OR mux_439_nl;
  mux_440_nl <= MUX_s_1_2_2(mux_tmp_434, or_502_nl, fsm_output(4));
  nand_25_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_435));
  mux_436_nl <= MUX_s_1_2_2(or_tmp_342, nand_25_nl, fsm_output(2));
  or_499_nl <= (fsm_output(8)) OR mux_436_nl;
  mux_437_nl <= MUX_s_1_2_2(or_499_nl, mux_tmp_434, fsm_output(4));
  mux_441_nl <= MUX_s_1_2_2(mux_440_nl, mux_437_nl, fsm_output(1));
  and_dcpl_136 <= NOT(mux_441_nl OR (fsm_output(0)));
  or_507_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(7)));
  or_504_nl <= (fsm_output(4)) OR (NOT (fsm_output(7)));
  mux_442_nl <= MUX_s_1_2_2(or_tmp_151, or_504_nl, fsm_output(5));
  mux_tmp_443 <= MUX_s_1_2_2(or_507_nl, mux_442_nl, fsm_output(2));
  or_509_nl <= (fsm_output(6)) OR mux_tmp_443;
  or_508_nl <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(4)))
      OR (fsm_output(7));
  mux_444_nl <= MUX_s_1_2_2(or_508_nl, mux_tmp_443, fsm_output(6));
  mux_445_nl <= MUX_s_1_2_2(or_509_nl, mux_444_nl, fsm_output(3));
  or_503_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("000100"));
  mux_446_nl <= MUX_s_1_2_2(mux_445_nl, or_503_nl, fsm_output(8));
  and_dcpl_138 <= (NOT mux_446_nl) AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_140 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      xor_dcpl;
  and_dcpl_144 <= xor_dcpl_1 AND (fsm_output(2)) AND (fsm_output(5)) AND (NOT (fsm_output(8)))
      AND and_dcpl_140;
  and_dcpl_151 <= (NOT (fsm_output(2))) AND (fsm_output(3)) AND (fsm_output(6)) AND
      and_dcpl_118 AND and_dcpl_140;
  or_tmp_357 <= (fsm_output(5)) OR (fsm_output(8)) OR (NOT mux_tmp_246);
  or_511_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (NOT mux_tmp_246);
  mux_tmp_448 <= MUX_s_1_2_2(or_tmp_357, or_511_nl, fsm_output(2));
  or_516_nl <= (fsm_output(8)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  or_514_nl <= (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_tmp_449 <= MUX_s_1_2_2(or_516_nl, or_514_nl, fsm_output(5));
  or_517_nl <= (fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_tmp_450 <= MUX_s_1_2_2(or_517_nl, mux_tmp_449, fsm_output(2));
  or_tmp_363 <= (fsm_output(7)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(8))
      OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_451_nl <= MUX_s_1_2_2(mux_tmp_450, mux_tmp_448, fsm_output(7));
  mux_tmp_452 <= MUX_s_1_2_2(or_tmp_363, mux_451_nl, fsm_output(6));
  and_dcpl_159 <= and_dcpl_112 AND and_dcpl_74;
  or_tmp_371 <= (fsm_output(5)) OR (fsm_output(8)) OR not_tmp_138;
  or_525_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR not_tmp_138;
  mux_tmp_462 <= MUX_s_1_2_2(or_tmp_371, or_525_nl, fsm_output(2));
  nand_tmp_26 <= NOT((fsm_output(7)) AND (NOT mux_tmp_462));
  and_dcpl_166 <= and_dcpl_37 AND and_dcpl_106;
  mux_tmp_468 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(1));
  or_38_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_469 <= MUX_s_1_2_2(or_38_nl, mux_tmp_468, fsm_output(0));
  or_tmp_378 <= nor_207_cse OR (fsm_output(2));
  mux_tmp_470 <= MUX_s_1_2_2(or_tmp_378, mux_tmp_469, fsm_output(4));
  or_41_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_471 <= MUX_s_1_2_2(mux_tmp_468, or_41_nl, fsm_output(0));
  or_tmp_380 <= (CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))) OR
      (fsm_output(2));
  mux_tmp_472 <= MUX_s_1_2_2(or_tmp_380, mux_tmp_471, fsm_output(4));
  nand_63_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_tmp_381 <= NOT(nand_63_cse AND (fsm_output(2)));
  mux_tmp_474 <= MUX_s_1_2_2(mux_tmp_471, or_tmp_381, fsm_output(4));
  mux_tmp_478 <= MUX_s_1_2_2(nor_201_cse, nor_tmp, fsm_output(0));
  nor_tmp_30 <= or_720_cse AND (fsm_output(2));
  mux_tmp_479 <= MUX_s_1_2_2(nor_tmp_30, mux_tmp_478, fsm_output(4));
  mux_tmp_481 <= MUX_s_1_2_2((NOT mux_tmp_478), or_tmp_380, fsm_output(4));
  mux_tmp_485 <= MUX_s_1_2_2((NOT or_tmp_381), nor_tmp, fsm_output(4));
  mux_tmp_488 <= MUX_s_1_2_2((NOT mux_tmp_469), nor_tmp_30, fsm_output(4));
  or_544_cse <= (fsm_output(2)) OR (NOT and_33_cse);
  mux_tmp_502 <= MUX_s_1_2_2(mux_245_cse, or_544_cse, fsm_output(7));
  mux_503_nl <= MUX_s_1_2_2(or_471_cse, mux_tmp_502, fsm_output(6));
  or_543_nl <= (fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(5))
      OR (NOT mux_tmp_246);
  mux_tmp_504 <= MUX_s_1_2_2(mux_503_nl, or_543_nl, fsm_output(8));
  or_tmp_401 <= nor_91_cse OR (fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_tmp_515 <= MUX_s_1_2_2(mux_375_cse, or_380_cse, nor_32_cse);
  or_tmp_409 <= (fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(8)) OR (fsm_output(7));
  or_575_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(8))
      OR (fsm_output(7));
  mux_536_nl <= MUX_s_1_2_2(mux_375_cse, or_tmp_409, fsm_output(2));
  mux_tmp_537 <= MUX_s_1_2_2(or_575_nl, mux_536_nl, fsm_output(5));
  or_725_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR mux_375_cse;
  mux_tmp_538 <= MUX_s_1_2_2(mux_tmp_537, or_725_nl, fsm_output(6));
  nor_62_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000000")));
  or_598_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(4)) OR nor_tmp_30;
  mux_553_nl <= MUX_s_1_2_2((fsm_output(6)), or_598_nl, fsm_output(5));
  mux_554_nl <= MUX_s_1_2_2(nor_62_nl, mux_553_nl, fsm_output(8));
  mux_tmp_555 <= MUX_s_1_2_2(mux_554_nl, (fsm_output(8)), fsm_output(7));
  not_tmp_313 <= NOT((VEC_LOOP_j_14_0_1_sva_1(14)) AND (fsm_output(3)));
  or_627_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      (VEC_LOOP_j_14_0_1_sva_1(14))) OR (fsm_output(3));
  or_626_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      (VEC_LOOP_j_14_0_1_sva_1(14))) OR (fsm_output(3));
  mux_tmp_587 <= MUX_s_1_2_2(or_627_nl, or_626_nl, fsm_output(4));
  or_635_nl <= (NOT((fsm_output(4)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(0)))))
      OR (fsm_output(3));
  mux_tmp_593 <= MUX_s_1_2_2((NOT (fsm_output(3))), or_635_nl, fsm_output(6));
  nor_55_nl <= NOT((fsm_output(0)) OR (fsm_output(3)));
  mux_tmp_594 <= MUX_s_1_2_2(nor_55_nl, (fsm_output(3)), or_730_cse);
  mux_607_nl <= MUX_s_1_2_2(or_473_cse, or_299_cse, fsm_output(6));
  or_645_nl <= (fsm_output(6)) OR mux_249_cse;
  mux_608_nl <= MUX_s_1_2_2(mux_607_nl, or_645_nl, fsm_output(7));
  or_641_nl <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(5))
      OR (NOT mux_tmp_246);
  mux_tmp_609 <= MUX_s_1_2_2(mux_608_nl, or_641_nl, fsm_output(8));
  mux_tmp_611 <= MUX_s_1_2_2(or_299_cse, mux_249_cse, fsm_output(6));
  mux_614_nl <= MUX_s_1_2_2(or_544_cse, or_473_cse, fsm_output(6));
  mux_615_nl <= MUX_s_1_2_2(mux_614_nl, mux_tmp_611, fsm_output(7));
  or_653_nl <= (fsm_output(8)) OR mux_615_nl;
  mux_616_nl <= MUX_s_1_2_2(mux_tmp_609, or_653_nl, fsm_output(3));
  nand_40_nl <= NOT((fsm_output(6)) AND mux_508_cse);
  mux_612_nl <= MUX_s_1_2_2(mux_tmp_611, nand_40_nl, fsm_output(7));
  or_651_nl <= (fsm_output(8)) OR mux_612_nl;
  mux_613_nl <= MUX_s_1_2_2(or_651_nl, mux_tmp_609, fsm_output(3));
  mux_617_itm <= MUX_s_1_2_2(mux_616_nl, mux_613_nl, fsm_output(0));
  or_718_nl <= (fsm_output(5)) OR (NOT mux_tmp_246);
  mux_619_nl <= MUX_s_1_2_2(or_718_nl, nand_46_cse, fsm_output(2));
  or_tmp_489 <= (fsm_output(8)) OR mux_619_nl;
  or_tmp_493 <= (fsm_output(8)) OR mux_249_cse;
  mux_622_nl <= MUX_s_1_2_2(or_tmp_493, or_tmp_489, fsm_output(7));
  mux_tmp_623 <= MUX_s_1_2_2(or_tmp_363, mux_622_nl, fsm_output(6));
  mux_662_nl <= MUX_s_1_2_2(or_380_cse, mux_539_cse, fsm_output(2));
  mux_663_nl <= MUX_s_1_2_2(mux_662_nl, or_410_cse, fsm_output(5));
  mux_tmp_664 <= MUX_s_1_2_2(or_578_cse, mux_663_nl, fsm_output(6));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_24 AND and_dcpl_166;
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT z_out_28))
      + SIGNED'( "00001"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  xor_dcpl <= NOT((fsm_output(4)) XOR (fsm_output(7)));
  xor_dcpl_1 <= NOT((fsm_output(3)) XOR (fsm_output(6)));
  vec_rsci_d_d <= MUX_v_32_2_2(COMP_LOOP_1_mult_cmp_return_rsc_z, COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      mux_257_itm);
  and_142_nl <= and_dcpl_100 AND and_dcpl_20;
  mux_358_nl <= MUX_s_1_2_2(mux_328_cse, or_410_cse, fsm_output(5));
  mux_359_nl <= MUX_s_1_2_2(or_tmp_248, mux_358_nl, fsm_output(6));
  mux_354_nl <= MUX_s_1_2_2((NOT mux_329_cse), or_406_cse, fsm_output(8));
  mux_355_nl <= MUX_s_1_2_2(or_408_cse, mux_354_nl, fsm_output(2));
  or_409_nl <= (fsm_output(5)) OR mux_355_nl;
  mux_356_nl <= MUX_s_1_2_2(or_409_nl, or_tmp_248, fsm_output(6));
  mux_360_nl <= MUX_s_1_2_2(mux_359_nl, mux_356_nl, fsm_output(3));
  and_143_nl <= (NOT mux_360_nl) AND (fsm_output(0));
  VEC_LOOP_mux1h_5_nl <= MUX1HOT_v_9_37_2((z_out_6(13 DOWNTO 5)), COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(13 DOWNTO 5)), (VEC_LOOP_acc_1_cse_10_sva(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(13 DOWNTO 5)), (COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9
      & (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(8 DOWNTO 4))), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(13 DOWNTO 5)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_11
      & (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10 DOWNTO 3))), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_8_sva_mx0w7(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(13 DOWNTO 5)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10
      DOWNTO 2)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(13 DOWNTO 5)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(9
      DOWNTO 1)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(13 DOWNTO 5)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(13
      DOWNTO 5)), (VEC_LOOP_acc_10_cse_sva_mx0w31(13 DOWNTO 5)), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_13_cse & and_142_nl & and_dcpl_30 & and_143_nl & and_dcpl_34 &
      and_dcpl_36 & and_dcpl_42 & and_dcpl_45 & and_dcpl_48 & and_dcpl_50 & and_dcpl_53
      & and_dcpl_58 & and_dcpl_60 & and_dcpl_122 & and_dcpl_62 & and_dcpl_64 & and_dcpl_68
      & and_dcpl_70 & and_dcpl_72 & and_dcpl_76 & and_dcpl_78 & and_dcpl_123 & and_dcpl_82
      & and_dcpl_85 & and_dcpl_87 & and_dcpl_89 & and_dcpl_92 & and_dcpl_94 & and_dcpl_96
      & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 &
      and_dcpl_111 & and_dcpl_113 & and_dcpl_115));
  nor_79_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000011")));
  nor_80_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (fsm_output(4)));
  nor_82_nl <= NOT((fsm_output(7)) OR (fsm_output(1)) OR (NOT (fsm_output(4))));
  mux_330_nl <= MUX_s_1_2_2(mux_329_cse, nor_82_nl, fsm_output(8));
  mux_331_nl <= MUX_s_1_2_2(nor_80_nl, mux_330_nl, fsm_output(2));
  and_301_nl <= (fsm_output(3)) AND mux_331_nl;
  nor_83_nl <= NOT((fsm_output(3)) OR mux_328_cse);
  mux_332_nl <= MUX_s_1_2_2(and_301_nl, nor_83_nl, fsm_output(6));
  nor_84_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(8)) OR mux_tmp_325);
  nor_85_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (NOT (fsm_output(1))) OR (fsm_output(4)));
  nor_86_nl <= NOT((fsm_output(2)) OR (fsm_output(8)) OR mux_tmp_325);
  mux_326_nl <= MUX_s_1_2_2(nor_85_nl, nor_86_nl, fsm_output(3));
  mux_327_nl <= MUX_s_1_2_2(nor_84_nl, mux_326_nl, fsm_output(6));
  mux_333_nl <= MUX_s_1_2_2(mux_332_nl, mux_327_nl, fsm_output(5));
  mux_334_nl <= MUX_s_1_2_2(nor_79_nl, mux_333_nl, fsm_output(0));
  VEC_LOOP_mux1h_3_nl <= MUX1HOT_s_1_36_2((z_out_6(4)), (VEC_LOOP_acc_1_cse_10_sva(4)),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(4)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(4)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(3)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(4)),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4(4)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(2)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(4)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(4)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(4)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(4)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(4)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(4)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(4)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(4)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(4)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(4)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(4)),
      (COMP_LOOP_17_twiddle_f_mul_psp_sva(0)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(4)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(4)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(4)),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20(4)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(4)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(4)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(4)),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24(4)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(4)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(4)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(4)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(4)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(4)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(4)), (VEC_LOOP_acc_10_cse_sva_mx0w31(4)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_13_cse & mux_334_nl & and_dcpl_30 & and_dcpl_34
      & and_dcpl_36 & and_dcpl_42 & and_dcpl_45 & and_dcpl_48 & and_dcpl_50 & and_dcpl_53
      & and_dcpl_58 & and_dcpl_60 & and_dcpl_122 & and_dcpl_62 & and_dcpl_64 & and_dcpl_68
      & and_dcpl_70 & and_dcpl_72 & and_dcpl_76 & and_dcpl_78 & and_dcpl_123 & and_dcpl_82
      & and_dcpl_85 & and_dcpl_87 & and_dcpl_89 & and_dcpl_92 & and_dcpl_94 & and_dcpl_96
      & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 &
      and_dcpl_111 & and_dcpl_113 & and_dcpl_115));
  or_728_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(6)) OR (fsm_output(3))
      OR (NOT (fsm_output(1))) OR mux_tmp_299;
  or_357_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(1))) OR (fsm_output(4))
      OR (NOT (fsm_output(8))) OR (fsm_output(7));
  or_356_nl <= (fsm_output(3)) OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(8))
      OR (NOT (fsm_output(7)));
  mux_306_nl <= MUX_s_1_2_2(or_357_nl, or_356_nl, fsm_output(6));
  nand_15_nl <= NOT((fsm_output(3)) AND (NOT mux_304_cse));
  mux_305_nl <= MUX_s_1_2_2(nand_15_nl, or_tmp_197, fsm_output(6));
  mux_307_nl <= MUX_s_1_2_2(mux_306_nl, mux_305_nl, fsm_output(2));
  nand_14_nl <= NOT((fsm_output(3)) AND (NOT mux_539_cse));
  mux_301_nl <= MUX_s_1_2_2(or_tmp_197, nand_14_nl, fsm_output(6));
  or_349_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(1)))
      OR (fsm_output(4)) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_302_nl <= MUX_s_1_2_2(mux_301_nl, or_349_nl, fsm_output(2));
  mux_308_nl <= MUX_s_1_2_2(mux_307_nl, mux_302_nl, fsm_output(5));
  mux_309_nl <= MUX_s_1_2_2(or_728_nl, mux_308_nl, fsm_output(0));
  VEC_LOOP_mux1h_1_nl <= MUX1HOT_s_1_35_2((z_out_6(3)), (VEC_LOOP_acc_1_cse_10_sva(3)),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(3)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(3)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(2)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(3)),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4(3)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(3)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(3)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(3)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(3)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(3)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(3)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(3)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(3)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(3)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(3)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(3)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(3)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(3)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(3)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(3)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(3)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(3)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(3)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(3)),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25(3)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(3)),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27(3)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(3)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(3)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(3)),
      (VEC_LOOP_acc_10_cse_sva_mx0w31(3)), STD_LOGIC_VECTOR'( VEC_LOOP_or_13_cse
      & (NOT mux_309_nl) & and_dcpl_30 & and_dcpl_34 & and_dcpl_36 & and_dcpl_42
      & and_dcpl_45 & and_dcpl_48 & and_dcpl_50 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60
      & and_dcpl_122 & and_dcpl_62 & and_dcpl_64 & and_dcpl_68 & and_dcpl_70 & and_dcpl_72
      & and_dcpl_76 & and_dcpl_78 & and_dcpl_82 & and_dcpl_85 & and_dcpl_87 & and_dcpl_89
      & and_dcpl_92 & and_dcpl_94 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103
      & and_dcpl_105 & and_dcpl_109 & and_dcpl_111 & and_dcpl_113 & and_dcpl_115));
  or_729_nl <= (fsm_output(5)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR mux_tmp_279;
  mux_285_nl <= MUX_s_1_2_2(mux_tmp_281, mux_tmp_283, fsm_output(4));
  nand_11_nl <= NOT((fsm_output(2)) AND (NOT mux_285_nl));
  or_333_nl <= (fsm_output(4)) OR mux_tmp_283;
  or_331_nl <= (fsm_output(7)) OR (fsm_output(8)) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  mux_282_nl <= MUX_s_1_2_2(or_331_nl, mux_tmp_281, fsm_output(4));
  mux_284_nl <= MUX_s_1_2_2(or_333_nl, mux_282_nl, fsm_output(2));
  mux_286_nl <= MUX_s_1_2_2(nand_11_nl, mux_284_nl, fsm_output(1));
  or_327_nl <= (fsm_output(2)) OR mux_tmp_279;
  or_322_nl <= (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(8)) OR not_tmp_138;
  or_320_nl <= (fsm_output(4)) OR (NOT (fsm_output(7))) OR (fsm_output(8)) OR (fsm_output(3))
      OR (NOT (fsm_output(6)));
  mux_278_nl <= MUX_s_1_2_2(or_322_nl, or_320_nl, fsm_output(2));
  mux_280_nl <= MUX_s_1_2_2(or_327_nl, mux_278_nl, fsm_output(1));
  mux_287_nl <= MUX_s_1_2_2(mux_286_nl, mux_280_nl, fsm_output(5));
  mux_288_nl <= MUX_s_1_2_2(or_729_nl, mux_287_nl, fsm_output(0));
  VEC_LOOP_mux1h_nl <= MUX1HOT_s_1_34_2((z_out_6(2)), (VEC_LOOP_acc_1_cse_10_sva(2)),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(2)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(2)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(1)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(2)),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4(2)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(2)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(2)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(2)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(2)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(2)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(2)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(2)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(2)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(2)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(2)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(2)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(2)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(2)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(2)),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20(2)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(2)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(2)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(2)),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24(2)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(2)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(2)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(2)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(2)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(2)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(2)), (VEC_LOOP_acc_10_cse_sva_mx0w31(2)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_13_cse & (NOT mux_288_nl) & and_dcpl_30 & and_dcpl_34
      & and_dcpl_36 & and_dcpl_42 & and_dcpl_45 & and_dcpl_48 & and_dcpl_50 & and_dcpl_53
      & and_dcpl_58 & and_dcpl_60 & and_dcpl_62 & and_dcpl_64 & and_dcpl_68 & and_dcpl_70
      & and_dcpl_72 & and_dcpl_76 & and_dcpl_78 & and_dcpl_82 & and_dcpl_85 & and_dcpl_87
      & and_dcpl_89 & and_dcpl_92 & and_dcpl_94 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101
      & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 & and_dcpl_111 & and_dcpl_113
      & and_dcpl_115));
  mux_322_nl <= MUX_s_1_2_2(mux_tmp_312, mux_tmp_319, fsm_output(3));
  nand_18_nl <= NOT((fsm_output(1)) AND (NOT mux_322_nl));
  or_370_nl <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR mux_303_cse;
  mux_318_nl <= MUX_s_1_2_2(or_370_nl, nand_tmp_17, fsm_output(6));
  mux_320_nl <= MUX_s_1_2_2(mux_tmp_319, mux_318_nl, fsm_output(3));
  or_367_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_313_nl <= MUX_s_1_2_2(or_365_cse, or_364_cse, fsm_output(5));
  mux_314_nl <= MUX_s_1_2_2(or_367_nl, mux_313_nl, fsm_output(2));
  mux_315_nl <= MUX_s_1_2_2(or_tmp_202, mux_314_nl, fsm_output(6));
  mux_316_nl <= MUX_s_1_2_2(mux_315_nl, mux_tmp_312, fsm_output(3));
  mux_321_nl <= MUX_s_1_2_2(mux_320_nl, mux_316_nl, fsm_output(1));
  mux_323_nl <= MUX_s_1_2_2(nand_18_nl, mux_321_nl, fsm_output(0));
  VEC_LOOP_mux1h_2_nl <= MUX1HOT_s_1_33_2((z_out_6(1)), (VEC_LOOP_acc_1_cse_10_sva(1)),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(1)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(1)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(0)), (VEC_LOOP_acc_10_cse_4_sva_mx0w3(1)),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4(1)), (VEC_LOOP_acc_10_cse_6_sva_mx0w5(1)),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6(1)), (VEC_LOOP_acc_10_cse_8_sva_mx0w7(1)),
      (VEC_LOOP_acc_10_cse_9_sva_mx0w8(1)), (VEC_LOOP_acc_10_cse_10_sva_mx0w9(1)),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10(1)), (VEC_LOOP_acc_10_cse_12_sva_mx0w11(1)),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12(1)), (VEC_LOOP_acc_10_cse_14_sva_mx0w13(1)),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14(1)), (VEC_LOOP_acc_10_cse_16_sva_mx0w15(1)),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17(1)), (VEC_LOOP_acc_10_cse_19_sva_mx0w18(1)),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19(1)), (VEC_LOOP_acc_10_cse_21_sva_mx0w20(1)),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21(1)), (VEC_LOOP_acc_10_cse_23_sva_mx0w22(1)),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23(1)), (VEC_LOOP_acc_10_cse_25_sva_mx0w24(1)),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25(1)), (VEC_LOOP_acc_10_cse_27_sva_mx0w26(1)),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27(1)), (VEC_LOOP_acc_10_cse_29_sva_mx0w28(1)),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29(1)), (VEC_LOOP_acc_10_cse_31_sva_mx0w30(1)),
      (VEC_LOOP_acc_10_cse_sva_mx0w31(1)), STD_LOGIC_VECTOR'( VEC_LOOP_or_13_cse
      & (NOT mux_323_nl) & and_dcpl_30 & and_dcpl_34 & and_dcpl_36 & and_dcpl_42
      & and_dcpl_45 & and_dcpl_50 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60 & and_dcpl_62
      & and_dcpl_64 & and_dcpl_68 & and_dcpl_70 & and_dcpl_72 & and_dcpl_76 & and_dcpl_78
      & and_dcpl_82 & and_dcpl_85 & and_dcpl_87 & and_dcpl_89 & and_dcpl_92 & and_dcpl_94
      & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105 &
      and_dcpl_109 & and_dcpl_111 & and_dcpl_113 & and_dcpl_115));
  or_400_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_346_nl <= MUX_s_1_2_2(or_400_nl, mux_tmp_335, fsm_output(5));
  mux_347_nl <= MUX_s_1_2_2(mux_346_nl, or_474_cse, fsm_output(6));
  mux_348_nl <= MUX_s_1_2_2(mux_347_nl, mux_tmp_343, fsm_output(7));
  or_401_nl <= (fsm_output(8)) OR mux_348_nl;
  mux_349_nl <= MUX_s_1_2_2(mux_tmp_340, or_401_nl, fsm_output(3));
  or_397_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_341_nl <= MUX_s_1_2_2(mux_tmp_335, or_397_nl, fsm_output(5));
  mux_342_nl <= MUX_s_1_2_2(or_299_cse, mux_341_nl, fsm_output(6));
  mux_344_nl <= MUX_s_1_2_2(mux_tmp_343, mux_342_nl, fsm_output(7));
  or_398_nl <= (fsm_output(8)) OR mux_344_nl;
  mux_345_nl <= MUX_s_1_2_2(or_398_nl, mux_tmp_340, fsm_output(3));
  mux_350_nl <= MUX_s_1_2_2(mux_349_nl, mux_345_nl, fsm_output(0));
  VEC_LOOP_mux1h_4_nl <= MUX1HOT_s_1_32_2((z_out_6(0)), (VEC_LOOP_acc_1_cse_10_sva(0)),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1(0)), (VEC_LOOP_acc_10_cse_3_sva_mx0w2(0)),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3(0)), (VEC_LOOP_acc_10_cse_5_sva_mx0w4(0)),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5(0)), (VEC_LOOP_acc_10_cse_7_sva_mx0w6(0)),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7(0)), (VEC_LOOP_acc_10_cse_9_sva_mx0w8(0)),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9(0)), (VEC_LOOP_acc_10_cse_11_sva_mx0w10(0)),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11(0)), (VEC_LOOP_acc_10_cse_13_sva_mx0w12(0)),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13(0)), (VEC_LOOP_acc_10_cse_15_sva_mx0w14(0)),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15(0)), (VEC_LOOP_acc_10_cse_18_sva_mx0w17(0)),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18(0)), (VEC_LOOP_acc_10_cse_20_sva_mx0w19(0)),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20(0)), (VEC_LOOP_acc_10_cse_22_sva_mx0w21(0)),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22(0)), (VEC_LOOP_acc_10_cse_24_sva_mx0w23(0)),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24(0)), (VEC_LOOP_acc_10_cse_26_sva_mx0w25(0)),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26(0)), (VEC_LOOP_acc_10_cse_28_sva_mx0w27(0)),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28(0)), (VEC_LOOP_acc_10_cse_30_sva_mx0w29(0)),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30(0)), (VEC_LOOP_acc_10_cse_sva_mx0w31(0)),
      STD_LOGIC_VECTOR'( VEC_LOOP_or_13_cse & (NOT mux_350_nl) & and_dcpl_30 & and_dcpl_34
      & and_dcpl_42 & and_dcpl_45 & and_dcpl_50 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60
      & and_dcpl_62 & and_dcpl_64 & and_dcpl_68 & and_dcpl_70 & and_dcpl_72 & and_dcpl_76
      & and_dcpl_78 & and_dcpl_82 & and_dcpl_85 & and_dcpl_87 & and_dcpl_89 & and_dcpl_92
      & and_dcpl_94 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101 & and_dcpl_103 & and_dcpl_105
      & and_dcpl_109 & and_dcpl_111 & and_dcpl_113 & and_dcpl_115));
  vec_rsci_radr_d <= VEC_LOOP_mux1h_5_nl & VEC_LOOP_mux1h_3_nl & VEC_LOOP_mux1h_1_nl
      & VEC_LOOP_mux1h_nl & VEC_LOOP_mux1h_2_nl & VEC_LOOP_mux1h_4_nl;
  and_153_nl <= and_dcpl_67 AND and_dcpl_20;
  mux_414_nl <= MUX_s_1_2_2(mux_tmp_411, mux_413_cse, fsm_output(6));
  mux_412_nl <= MUX_s_1_2_2(or_471_cse, mux_tmp_411, fsm_output(6));
  mux_415_nl <= MUX_s_1_2_2(mux_414_nl, mux_412_nl, fsm_output(3));
  or_465_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(7)) OR (NOT
      (fsm_output(2))) OR (fsm_output(5)) OR (NOT mux_tmp_246);
  mux_416_nl <= MUX_s_1_2_2(mux_415_nl, or_465_nl, fsm_output(8));
  and_155_nl <= (NOT mux_416_nl) AND (fsm_output(0));
  COMP_LOOP_twiddle_f_mux1h_nl <= MUX1HOT_v_9_7_2(COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (VEC_LOOP_acc_10_cse_1_sva(13 DOWNTO 5)), (VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO
      5)), (COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9 & (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(8
      DOWNTO 4))), (COMP_LOOP_13_twiddle_f_mul_psp_sva_11 & (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10
      DOWNTO 3))), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(10 DOWNTO 2)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(9
      DOWNTO 1)), STD_LOGIC_VECTOR'( and_153_nl & (NOT mux_257_itm) & and_155_nl
      & and_dcpl_126 & and_dcpl_127 & and_dcpl_132 & and_dcpl_133));
  or_463_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000100"));
  or_461_nl <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(6));
  mux_404_nl <= MUX_s_1_2_2(mux_tmp_400, or_461_nl, fsm_output(7));
  or_462_nl <= (fsm_output(8)) OR mux_404_nl;
  mux_405_nl <= MUX_s_1_2_2(mux_tmp_401, or_462_nl, fsm_output(1));
  nor_75_nl <= NOT((fsm_output(5)) OR (NOT mux_tmp_136));
  mux_402_nl <= MUX_s_1_2_2(nor_75_nl, and_tmp_18, fsm_output(2));
  or_460_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      mux_402_nl);
  mux_403_nl <= MUX_s_1_2_2(or_460_nl, mux_tmp_401, fsm_output(1));
  mux_406_nl <= MUX_s_1_2_2(mux_405_nl, mux_403_nl, fsm_output(4));
  mux_407_nl <= MUX_s_1_2_2(or_463_nl, mux_406_nl, fsm_output(0));
  VEC_LOOP_mux1h_9_nl <= MUX1HOT_s_1_6_2((VEC_LOOP_acc_1_cse_10_sva(4)), (VEC_LOOP_acc_10_cse_1_sva(4)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(3)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(2)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)), (COMP_LOOP_17_twiddle_f_mul_psp_sva(0)),
      STD_LOGIC_VECTOR'( (NOT mux_407_nl) & (NOT mux_257_itm) & and_dcpl_126 & and_dcpl_127
      & and_dcpl_132 & and_dcpl_133));
  or_732_nl <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(0)))
      OR mux_375_cse;
  mux_382_nl <= MUX_s_1_2_2(mux_tmp_377, or_732_nl, fsm_output(6));
  or_436_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR mux_tmp_299;
  nand_21_nl <= NOT((fsm_output(0)) AND (NOT mux_379_cse));
  mux_380_nl <= MUX_s_1_2_2(or_436_nl, nand_21_nl, fsm_output(2));
  or_437_nl <= (fsm_output(5)) OR mux_380_nl;
  mux_381_nl <= MUX_s_1_2_2(or_437_nl, mux_tmp_377, fsm_output(6));
  mux_383_nl <= MUX_s_1_2_2(mux_382_nl, mux_381_nl, fsm_output(3));
  VEC_LOOP_mux1h_7_nl <= MUX1HOT_s_1_5_2((VEC_LOOP_acc_1_cse_10_sva(3)), (VEC_LOOP_acc_10_cse_1_sva(3)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(2)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(1)),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)), STD_LOGIC_VECTOR'( (NOT mux_383_nl)
      & (NOT mux_257_itm) & and_dcpl_126 & and_dcpl_127 & and_dcpl_132));
  or_425_nl <= (NOT (fsm_output(5))) OR (fsm_output(8)) OR (fsm_output(3)) OR (NOT
      (fsm_output(6)));
  mux_371_nl <= MUX_s_1_2_2(or_tmp_260, or_425_nl, fsm_output(7));
  mux_372_nl <= MUX_s_1_2_2(mux_371_nl, mux_tmp_362, fsm_output(4));
  or_426_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR mux_372_nl;
  or_422_nl <= (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(8)) OR not_tmp_138;
  mux_368_nl <= MUX_s_1_2_2(or_tmp_264, or_422_nl, fsm_output(4));
  mux_367_nl <= MUX_s_1_2_2(or_tmp_262, or_tmp_264, fsm_output(4));
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, mux_367_nl, fsm_output(1));
  mux_365_nl <= MUX_s_1_2_2(mux_tmp_361, or_tmp_262, fsm_output(4));
  mux_363_nl <= MUX_s_1_2_2(mux_tmp_362, mux_tmp_361, fsm_output(4));
  mux_366_nl <= MUX_s_1_2_2(mux_365_nl, mux_363_nl, fsm_output(1));
  mux_370_nl <= MUX_s_1_2_2(mux_369_nl, mux_366_nl, fsm_output(2));
  mux_373_nl <= MUX_s_1_2_2(or_426_nl, mux_370_nl, fsm_output(0));
  VEC_LOOP_mux1h_6_nl <= MUX1HOT_s_1_4_2((VEC_LOOP_acc_1_cse_10_sva(2)), (VEC_LOOP_acc_10_cse_1_sva(2)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(1)), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0(0)),
      STD_LOGIC_VECTOR'( (NOT mux_373_nl) & (NOT mux_257_itm) & and_dcpl_126 & and_dcpl_127));
  or_453_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010")) OR mux_289_cse;
  mux_396_nl <= MUX_s_1_2_2(or_tmp_295, or_453_nl, fsm_output(4));
  mux_397_nl <= MUX_s_1_2_2(mux_tmp_392, mux_396_nl, fsm_output(3));
  or_454_nl <= (fsm_output(1)) OR mux_397_nl;
  mux_393_nl <= MUX_s_1_2_2(nand_tmp_23, or_tmp_295, fsm_output(4));
  mux_394_nl <= MUX_s_1_2_2(mux_393_nl, mux_tmp_392, fsm_output(3));
  or_447_nl <= (fsm_output(7)) OR mux_tmp_388;
  mux_389_nl <= MUX_s_1_2_2(or_447_nl, nand_tmp_23, fsm_output(4));
  or_443_nl <= (fsm_output(6)) OR (fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(5));
  mux_386_nl <= MUX_s_1_2_2(or_799_cse, or_443_nl, fsm_output(7));
  mux_387_nl <= MUX_s_1_2_2(mux_386_nl, mux_tmp_385, fsm_output(4));
  mux_390_nl <= MUX_s_1_2_2(mux_389_nl, mux_387_nl, fsm_output(3));
  mux_395_nl <= MUX_s_1_2_2(mux_394_nl, mux_390_nl, fsm_output(1));
  mux_398_nl <= MUX_s_1_2_2(or_454_nl, mux_395_nl, fsm_output(0));
  VEC_LOOP_mux1h_8_nl <= MUX1HOT_s_1_3_2((VEC_LOOP_acc_1_cse_10_sva(1)), (VEC_LOOP_acc_10_cse_1_sva(1)),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0(0)), STD_LOGIC_VECTOR'( (NOT mux_398_nl)
      & (NOT mux_257_itm) & and_dcpl_126));
  VEC_LOOP_mux_4_nl <= MUX_s_1_2_2((VEC_LOOP_acc_10_cse_1_sva(0)), (VEC_LOOP_acc_1_cse_10_sva(0)),
      mux_257_itm);
  vec_rsci_wadr_d <= COMP_LOOP_twiddle_f_mux1h_nl & VEC_LOOP_mux1h_9_nl & VEC_LOOP_mux1h_7_nl
      & VEC_LOOP_mux1h_6_nl & VEC_LOOP_mux1h_8_nl & VEC_LOOP_mux_4_nl;
  vec_rsci_we_d_pff <= vec_rsci_we_d_iff;
  vec_rsci_readA_r_ram_ir_internal_RMASK_B_d <= vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  twiddle_rsci_radr_d <= COMP_LOOP_twiddle_f_mux1h_26_rmff & COMP_LOOP_twiddle_f_and_rmff
      & COMP_LOOP_twiddle_f_mux1h_10_rmff & COMP_LOOP_twiddle_f_mux1h_5_rmff & COMP_LOOP_twiddle_f_mux1h_13_rmff
      & COMP_LOOP_twiddle_f_mux_rmff;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  twiddle_h_rsci_radr_d <= COMP_LOOP_twiddle_f_mux1h_26_rmff & COMP_LOOP_twiddle_f_and_rmff
      & COMP_LOOP_twiddle_f_mux1h_10_rmff & COMP_LOOP_twiddle_f_mux1h_5_rmff & COMP_LOOP_twiddle_f_mux1h_13_rmff
      & COMP_LOOP_twiddle_f_mux_rmff;
  twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d <= twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  nor_144_cse <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  and_335_cse <= and_dcpl_118 AND nor_144_cse;
  and_dcpl_293 <= and_dcpl_56 AND and_dcpl_26 AND and_335_cse;
  and_dcpl_294 <= (NOT (fsm_output(8))) AND (fsm_output(5));
  and_dcpl_295 <= and_dcpl_294 AND nor_144_cse;
  and_dcpl_300 <= and_dcpl_40 AND and_dcpl_31 AND and_dcpl_295;
  and_dcpl_301 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_302 <= and_dcpl_118 AND and_dcpl_301;
  and_dcpl_304 <= and_dcpl_56 AND and_dcpl_31 AND and_dcpl_302;
  and_dcpl_305 <= and_dcpl_294 AND and_dcpl_301;
  and_dcpl_308 <= and_dcpl_40 AND and_295_cse AND and_dcpl_305;
  and_dcpl_309 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_310 <= and_dcpl_118 AND and_dcpl_309;
  and_dcpl_314 <= and_dcpl_51 AND and_dcpl_31 AND and_dcpl_310;
  and_dcpl_315 <= and_dcpl_294 AND and_dcpl_309;
  and_dcpl_319 <= and_dcpl_32 AND and_dcpl_31 AND and_dcpl_315;
  and_dcpl_320 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_321 <= and_dcpl_118 AND and_dcpl_320;
  and_dcpl_323 <= and_dcpl_51 AND and_295_cse AND and_dcpl_321;
  and_dcpl_324 <= and_dcpl_294 AND and_dcpl_320;
  and_dcpl_326 <= and_dcpl_32 AND and_295_cse AND and_dcpl_324;
  and_dcpl_329 <= and_dcpl_51 AND and_dcpl_21 AND and_335_cse;
  and_dcpl_332 <= and_dcpl_23 AND and_dcpl_31 AND and_335_cse;
  and_dcpl_334 <= and_dcpl_32 AND and_dcpl_21 AND and_dcpl_295;
  and_dcpl_337 <= and_dcpl_43 AND and_295_cse AND and_dcpl_295;
  and_dcpl_339 <= and_dcpl_51 AND and_dcpl_26 AND and_dcpl_302;
  and_dcpl_341 <= and_dcpl_23 AND and_295_cse AND and_dcpl_302;
  and_dcpl_343 <= and_dcpl_32 AND and_dcpl_26 AND and_dcpl_305;
  and_dcpl_345 <= and_dcpl_43 AND and_dcpl_21 AND and_dcpl_310;
  and_dcpl_348 <= and_dcpl_47 AND and_dcpl_26 AND and_dcpl_310;
  and_dcpl_350 <= and_dcpl_56 AND and_295_cse AND and_dcpl_310;
  and_dcpl_353 <= and_dcpl_28 AND and_dcpl_26 AND and_dcpl_315;
  and_dcpl_355 <= and_dcpl_40 AND and_dcpl_21 AND and_dcpl_321;
  and_dcpl_357 <= and_dcpl_47 AND and_dcpl_31 AND and_dcpl_321;
  and_dcpl_359 <= and_dcpl_56 AND and_dcpl_21 AND and_dcpl_324;
  and_dcpl_361 <= and_dcpl_28 AND and_dcpl_31 AND and_dcpl_324;
  and_dcpl_365 <= and_dcpl_40 AND and_dcpl_26 AND (fsm_output(8)) AND (NOT (fsm_output(5)))
      AND nor_144_cse;
  and_dcpl_367 <= and_dcpl_28 AND and_295_cse AND and_335_cse;
  and_dcpl_369 <= and_dcpl_28 AND and_dcpl_21 AND and_dcpl_305;
  and_dcpl_371 <= and_dcpl_23 AND and_dcpl_21 AND and_dcpl_315;
  and_dcpl_373 <= and_dcpl_23 AND and_dcpl_26 AND and_dcpl_324;
  and_dcpl_394 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
  and_dcpl_401 <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_406 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("010"));
  and_dcpl_412 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("100"));
  and_dcpl_444 <= (fsm_output(8)) AND (NOT (fsm_output(5))) AND nor_144_cse;
  and_dcpl_962 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
  and_dcpl_964 <= and_dcpl_962 AND and_dcpl_26 AND and_dcpl_118 AND CONV_SL_1_1(fsm_output(7
      DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_969 <= and_dcpl_962 AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_975 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011")) AND
      and_dcpl_26 AND and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_981 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  and_dcpl_982 <= and_dcpl_981 AND and_dcpl_31;
  and_dcpl_983 <= and_dcpl_982 AND and_335_cse;
  and_dcpl_988 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
  and_dcpl_990 <= and_dcpl_988 AND and_295_cse AND and_dcpl_295;
  and_dcpl_993 <= and_dcpl_981 AND and_295_cse;
  and_dcpl_994 <= and_dcpl_993 AND and_dcpl_302;
  and_dcpl_998 <= and_dcpl_988 AND and_dcpl_21;
  and_dcpl_999 <= and_dcpl_998 AND and_dcpl_118 AND and_dcpl_309;
  and_dcpl_1001 <= and_dcpl_981 AND and_dcpl_21;
  and_dcpl_1002 <= and_dcpl_1001 AND and_dcpl_315;
  and_dcpl_1007 <= and_dcpl_988 AND and_dcpl_26 AND and_dcpl_321;
  and_dcpl_1009 <= and_dcpl_981 AND and_dcpl_26;
  and_dcpl_1010 <= and_dcpl_1009 AND and_dcpl_324;
  and_dcpl_1013 <= and_dcpl_988 AND and_dcpl_31;
  and_dcpl_1014 <= and_dcpl_1013 AND and_dcpl_444;
  and_dcpl_1016 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("001"));
  and_dcpl_1018 <= and_dcpl_1016 AND and_dcpl_26 AND and_dcpl_295;
  and_dcpl_1021 <= and_dcpl_1016 AND and_dcpl_31 AND and_dcpl_305;
  and_dcpl_1023 <= and_dcpl_1016 AND and_295_cse AND and_dcpl_315;
  and_dcpl_1025 <= and_dcpl_1016 AND and_dcpl_21 AND and_dcpl_444;
  and_dcpl_1026 <= and_dcpl_1009 AND and_dcpl_315;
  and_dcpl_1027 <= and_dcpl_982 AND and_dcpl_324;
  and_dcpl_1028 <= and_dcpl_1013 AND and_dcpl_321;
  and_dcpl_1029 <= and_dcpl_1001 AND and_dcpl_305;
  and_dcpl_1030 <= and_dcpl_998 AND and_dcpl_302;
  and_dcpl_1031 <= and_dcpl_993 AND and_335_cse;
  mux_tmp_699 <= MUX_s_1_2_2(or_277_cse, or_tmp_122, fsm_output(1));
  or_735_nl <= (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(8));
  mux_tmp_700 <= MUX_s_1_2_2(or_735_nl, mux_tmp_699, fsm_output(4));
  or_tmp_551 <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR mux_tmp_700;
  mux_700_nl <= MUX_s_1_2_2(or_380_cse, mux_tmp_700, fsm_output(2));
  mux_701_nl <= MUX_s_1_2_2(mux_700_nl, or_410_cse, fsm_output(5));
  mux_tmp_703 <= MUX_s_1_2_2(or_tmp_551, mux_701_nl, fsm_output(6));
  mux_tmp_704 <= MUX_s_1_2_2(or_354_cse, or_277_cse, fsm_output(1));
  and_dcpl_1053 <= and_dcpl_406 AND and_dcpl_31 AND and_dcpl_444;
  and_dcpl_1058 <= and_dcpl_43 AND and_dcpl_26 AND and_dcpl_444;
  and_dcpl_1062 <= and_dcpl_40 AND and_dcpl_21 AND and_dcpl_444;
  and_dcpl_1069 <= and_dcpl_394 AND and_dcpl_26 AND and_dcpl_324;
  and_dcpl_1073 <= and_dcpl_406 AND and_dcpl_26 AND and_dcpl_321;
  and_dcpl_1077 <= and_dcpl_23 AND and_dcpl_21 AND and_dcpl_324;
  and_dcpl_1081 <= and_dcpl_22 AND (NOT (fsm_output(0))) AND and_295_cse AND and_dcpl_321;
  and_dcpl_1083 <= and_dcpl_294 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_1085 <= and_dcpl_394 AND and_dcpl_21 AND and_dcpl_1083;
  and_dcpl_1087 <= and_dcpl_43 AND and_dcpl_21 AND and_dcpl_321;
  and_dcpl_1089 <= and_dcpl_40 AND and_295_cse AND and_dcpl_1083;
  and_dcpl_1093 <= and_dcpl_394 AND and_295_cse AND and_dcpl_302;
  and_dcpl_1096 <= and_dcpl_40 AND and_dcpl_31 AND and_dcpl_305;
  and_dcpl_1099 <= and_dcpl_43 AND and_dcpl_31 AND and_dcpl_294 AND nor_144_cse;
  and_dcpl_1101 <= and_dcpl_43 AND and_295_cse AND and_dcpl_305;
  and_dcpl_1103 <= and_dcpl_23 AND and_dcpl_31 AND and_dcpl_302;
  and_dcpl_1106 <= and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_1111 <= and_dcpl_23 AND and_dcpl_31 AND and_dcpl_1106;
  and_dcpl_1116 <= and_dcpl_23 AND and_dcpl_21 AND and_335_cse;
  and_dcpl_1119 <= and_dcpl_23 AND and_295_cse AND and_dcpl_1106;
  and_dcpl_1122 <= and_dcpl_56 AND and_dcpl_31 AND and_dcpl_1106;
  and_dcpl_1126 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110")) AND
      and_dcpl_31 AND and_335_cse;
  and_dcpl_1131 <= and_dcpl_56 AND and_dcpl_26 AND and_dcpl_118 AND CONV_SL_1_1(fsm_output(7
      DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_1133 <= (NOT (fsm_output(8))) AND (fsm_output(5)) AND nor_144_cse;
  and_dcpl_1137 <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("000")) AND
      and_dcpl_26 AND and_dcpl_1133;
  and_dcpl_1141 <= and_dcpl_47 AND and_295_cse AND and_dcpl_1133;
  and_dcpl_1143 <= and_dcpl_47 AND and_dcpl_21 AND and_dcpl_1106;
  and_dcpl_1148 <= and_dcpl_46 AND (fsm_output(0)) AND and_295_cse AND (fsm_output(8))
      AND (NOT (fsm_output(5))) AND nor_144_cse;
  and_dcpl_1150 <= and_dcpl_23 AND and_dcpl_26 AND and_335_cse;
  and_dcpl_1158 <= and_dcpl_23 AND and_dcpl_21 AND and_dcpl_118 AND nor_144_cse;
  and_dcpl_1163 <= and_dcpl_23 AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_1168 <= and_dcpl_22 AND (NOT (fsm_output(0))) AND and_dcpl_21 AND (fsm_output(8))
      AND (fsm_output(5)) AND nor_144_cse;
  COMP_LOOP_twiddle_f_or_1_ssc <= and_dcpl_332 OR and_dcpl_334 OR and_dcpl_337 OR
      and_dcpl_339 OR and_dcpl_341 OR and_dcpl_343 OR and_dcpl_345 OR and_dcpl_348
      OR and_dcpl_350 OR and_dcpl_353 OR and_dcpl_355 OR and_dcpl_357 OR and_dcpl_359
      OR and_dcpl_361 OR and_dcpl_365;
  and_618_ssc <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("10101")) AND
      and_dcpl_118 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  nor_208_nl <= NOT((fsm_output(2)) OR nand_63_cse);
  mux_tmp_717 <= MUX_s_1_2_2(nor_208_nl, and_dcpl_981, fsm_output(5));
  mux_tmp_719 <= MUX_s_1_2_2((NOT and_dcpl_981), or_785_cse, fsm_output(5));
  or_tmp_567 <= (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(0)) OR (fsm_output(1));
  or_tmp_575 <= NOT((fsm_output(0)) AND (fsm_output(2)) AND (fsm_output(1)) AND (NOT
      (fsm_output(8))));
  or_765_nl <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT (fsm_output(1)))
      OR (fsm_output(8));
  mux_tmp_728 <= MUX_s_1_2_2(or_765_nl, or_tmp_575, fsm_output(5));
  or_tmp_578 <= (fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(8));
  or_tmp_579 <= (fsm_output(5)) OR (fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(1))
      OR (fsm_output(8));
  or_tmp_595 <= (NOT (fsm_output(7))) OR (fsm_output(1)) OR (NOT((fsm_output(2))
      AND (fsm_output(0))));
  or_tmp_605 <= (NOT (fsm_output(6))) OR (fsm_output(5)) OR (fsm_output(8));
  or_792_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_tmp_752 <= MUX_s_1_2_2(or_tmp_605, or_792_nl, fsm_output(2));
  or_796_nl <= (fsm_output(6)) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_tmp_754 <= MUX_s_1_2_2(or_796_nl, or_tmp_605, fsm_output(2));
  COMP_LOOP_twiddle_f_nor_itm <= NOT(and_dcpl_293 OR and_dcpl_300 OR and_dcpl_304
      OR and_dcpl_308 OR and_dcpl_314 OR and_dcpl_319 OR and_dcpl_323 OR and_dcpl_326
      OR and_dcpl_367 OR and_dcpl_369 OR and_dcpl_371 OR and_dcpl_373);
  COMP_LOOP_twiddle_f_or_11_itm <= and_dcpl_300 OR and_dcpl_304 OR and_dcpl_308 OR
      and_dcpl_314 OR and_dcpl_319 OR and_dcpl_323 OR and_dcpl_326;
  COMP_LOOP_twiddle_f_nor_1_itm <= NOT(and_dcpl_367 OR and_dcpl_369 OR and_dcpl_371
      OR and_dcpl_373);
  COMP_LOOP_twiddle_f_or_13_itm <= and_dcpl_367 OR and_dcpl_369 OR and_dcpl_371 OR
      and_dcpl_373;
  COMP_LOOP_twiddle_f_or_18_itm <= and_dcpl_329 OR and_dcpl_332 OR and_dcpl_334 OR
      and_dcpl_337 OR and_dcpl_339 OR and_dcpl_341 OR and_dcpl_343 OR and_dcpl_345
      OR and_dcpl_348 OR and_dcpl_350 OR and_dcpl_353 OR and_dcpl_355 OR and_dcpl_357
      OR and_dcpl_359 OR and_dcpl_361 OR and_dcpl_365;
  VEC_LOOP_or_48_itm <= and_dcpl_983 OR and_dcpl_990 OR and_dcpl_994 OR and_dcpl_999
      OR and_dcpl_1002 OR and_dcpl_1007 OR and_dcpl_1010 OR and_dcpl_1014;
  VEC_LOOP_or_49_itm <= and_dcpl_1018 OR and_dcpl_1021 OR and_dcpl_1023 OR and_dcpl_1025;
  VEC_LOOP_or_59_itm <= and_dcpl_1026 OR and_dcpl_1027 OR and_dcpl_1029 OR and_dcpl_1031;
  VEC_LOOP_or_61_itm <= and_dcpl_1028 OR and_dcpl_1030;
  VEC_LOOP_or_64_itm <= and_dcpl_1018 OR and_dcpl_1021 OR and_dcpl_1023 OR and_dcpl_1025
      OR and_dcpl_1026 OR and_dcpl_1027 OR and_dcpl_1029 OR and_dcpl_1031;
  VEC_LOOP_or_70_itm <= and_dcpl_1053 OR and_dcpl_1058 OR and_dcpl_1062 OR and_dcpl_1069
      OR and_dcpl_1073 OR and_dcpl_1077 OR and_dcpl_1081 OR and_dcpl_1085 OR and_dcpl_1087
      OR and_dcpl_1089 OR and_dcpl_1093 OR and_dcpl_1096 OR and_dcpl_1099 OR and_dcpl_1101
      OR and_dcpl_1103;
  VEC_LOOP_or_72_itm <= and_dcpl_1119 OR and_dcpl_1122 OR and_dcpl_1126 OR and_dcpl_1131
      OR and_dcpl_1137 OR and_dcpl_1141 OR and_dcpl_1143 OR and_dcpl_1150;
  VEC_LOOP_or_53_itm <= and_dcpl_1116 OR and_dcpl_1148;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( complete_rsci_wen_comp = '1' ) THEN
        factor2_1_sva <= vec_rsci_q_d_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_run_rsci_oswt_cse <= '0';
        reg_vec_rsci_oswt_1_cse <= '0';
        reg_twiddle_rsci_oswt_cse <= '0';
        reg_complete_rsci_oswt_cse <= '0';
        reg_vec_rsc_triosy_obj_iswt0_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        reg_ensig_cgo_1_cse <= '0';
      ELSIF ( complete_rsci_wen_comp = '1' ) THEN
        reg_run_rsci_oswt_cse <= NOT(or_dcpl_153 OR or_260_cse OR CONV_SL_1_1(fsm_output(8
            DOWNTO 5)/=STD_LOGIC_VECTOR'("0000")));
        reg_vec_rsci_oswt_1_cse <= NOT mux_276_itm;
        reg_twiddle_rsci_oswt_cse <= mux_431_rmff;
        reg_complete_rsci_oswt_cse <= and_dcpl_24 AND and_dcpl_37 AND CONV_SL_1_1(fsm_output(8
            DOWNTO 7)=STD_LOGIC_VECTOR'("10")) AND (NOT STAGE_LOOP_acc_itm_4_1);
        reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_100 AND and_dcpl_166;
        reg_ensig_cgo_cse <= mux_498_rmff;
        reg_ensig_cgo_1_cse <= NOT mux_533_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((and_dcpl_41 AND and_dcpl_20) OR STAGE_LOOP_i_3_0_sva_mx0c1))
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1110"), z_out_28,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_552_nl) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_ac_sync_tmp_dobj_sva <= '0';
      ELSIF ( (complete_rsci_wen_comp AND (NOT((NOT nor_tmp) OR (fsm_output(0)) OR
          or_260_cse OR CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("1001")))))
          = '1' ) THEN
        run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_tmp_555) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_716_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_k_14_5_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (z_out_31(8
            DOWNTO 0)), COMP_LOOP_k_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT(mux_559_nl AND and_dcpl_20))) = '1' )
          THEN
        COMP_LOOP_1_twiddle_f_acc_cse_sva <= z_out_28;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_561_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_17_twiddle_f_mul_psp_sva <= MUX_v_10_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_17_twiddle_f_mul_nl),
            10)), (z_out_30(9 DOWNTO 0)), and_dcpl_80);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_727_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9 <= COMP_LOOP_twiddle_f_mux1h_40_rgt(12
            DOWNTO 9);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT mux_739_nl) AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0 <= COMP_LOOP_twiddle_f_mux1h_40_rgt(8
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND mux_584_nl) = '1' ) THEN
        COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (NOT mux_603_nl)) = '1' ) THEN
        COMP_LOOP_twiddle_f_mul_cse_10_sva <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_twiddle_help_and_cse = '1' ) THEN
        COMP_LOOP_twiddle_help_1_sva <= twiddle_h_rsci_q_d_mxwt;
        COMP_LOOP_twiddle_f_1_sva <= twiddle_rsci_q_d_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((NOT mux_631_nl) OR (NOT mux_617_itm) OR
          and_dcpl_30 OR and_dcpl_42 OR and_dcpl_50 OR and_dcpl_58 OR and_dcpl_62
          OR and_dcpl_68 OR and_dcpl_72 OR and_dcpl_78 OR and_dcpl_82 OR and_dcpl_87
          OR and_dcpl_92 OR and_dcpl_96 OR and_dcpl_101 OR and_dcpl_105 OR and_dcpl_111
          OR and_dcpl_115)) = '1' ) THEN
        VEC_LOOP_acc_1_cse_10_sva <= MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"),
            VEC_LOOP_mux_13_nl, mux_617_itm);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_14_0_1_sva_1 <= STD_LOGIC_VECTOR'( "000000000000000");
      ELSIF ( (complete_rsci_wen_comp AND (NOT mux_675_nl)) = '1' ) THEN
        VEC_LOOP_j_14_0_1_sva_1 <= z_out_29;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (and_dcpl_25 OR and_dcpl_30 OR and_dcpl_34
          OR and_dcpl_42 OR and_dcpl_45 OR and_dcpl_50 OR and_dcpl_53 OR and_dcpl_58
          OR and_dcpl_60 OR and_dcpl_62 OR and_dcpl_64 OR and_dcpl_68 OR and_dcpl_70
          OR and_dcpl_72 OR and_dcpl_76 OR and_dcpl_78 OR and_dcpl_80 OR and_dcpl_82
          OR and_dcpl_85 OR and_dcpl_87 OR and_dcpl_89 OR and_dcpl_92 OR and_dcpl_94
          OR and_dcpl_96 OR and_dcpl_98 OR and_dcpl_101 OR and_dcpl_103 OR and_dcpl_105
          OR and_dcpl_109 OR and_dcpl_111 OR and_dcpl_113 OR and_dcpl_115)) = '1'
          ) THEN
        VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_14_31_2(z_out_6, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
            VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
            VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
            VEC_LOOP_acc_10_cse_9_sva_mx0w8, VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10,
            VEC_LOOP_acc_10_cse_12_sva_mx0w11, VEC_LOOP_acc_10_cse_13_sva_mx0w12,
            VEC_LOOP_acc_10_cse_14_sva_mx0w13, VEC_LOOP_acc_10_cse_15_sva_mx0w14,
            VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17,
            VEC_LOOP_acc_10_cse_19_sva_mx0w18, VEC_LOOP_acc_10_cse_20_sva_mx0w19,
            VEC_LOOP_acc_10_cse_21_sva_mx0w20, VEC_LOOP_acc_10_cse_22_sva_mx0w21,
            VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_24_sva_mx0w23,
            VEC_LOOP_acc_10_cse_25_sva_mx0w24, VEC_LOOP_acc_10_cse_26_sva_mx0w25,
            VEC_LOOP_acc_10_cse_27_sva_mx0w26, VEC_LOOP_acc_10_cse_28_sva_mx0w27,
            VEC_LOOP_acc_10_cse_29_sva_mx0w28, VEC_LOOP_acc_10_cse_30_sva_mx0w29,
            VEC_LOOP_acc_10_cse_31_sva_mx0w30, VEC_LOOP_acc_10_cse_sva_mx0w31, STD_LOGIC_VECTOR'(
            VEC_LOOP_or_13_cse & and_dcpl_30 & and_dcpl_34 & and_dcpl_42 & and_dcpl_45
            & and_dcpl_50 & and_dcpl_53 & and_dcpl_58 & and_dcpl_60 & and_dcpl_62
            & and_dcpl_64 & and_dcpl_68 & and_dcpl_70 & and_dcpl_72 & and_dcpl_76
            & and_dcpl_78 & and_dcpl_82 & and_dcpl_85 & and_dcpl_87 & and_dcpl_89
            & and_dcpl_92 & and_dcpl_94 & and_dcpl_96 & and_dcpl_98 & and_dcpl_101
            & and_dcpl_103 & and_dcpl_105 & and_dcpl_109 & and_dcpl_111 & and_dcpl_113
            & and_dcpl_115));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND ((NOT((or_720_cse AND and_dcpl_119) OR CONV_SL_1_1(fsm_output(7
          DOWNTO 4)/=STD_LOGIC_VECTOR'("0000")))) OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_678_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (complete_rsci_wen_comp AND (mux_681_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_1(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_751_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_13_twiddle_f_mul_psp_sva_11 <= COMP_LOOP_twiddle_f_mux1h_65_rgt(11);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_760_nl AND complete_rsci_wen_comp) = '1' ) THEN
        COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0 <= COMP_LOOP_twiddle_f_mux1h_65_rgt(10
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  nor_63_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000000")));
  or_589_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(4)) OR nor_tmp;
  mux_550_nl <= MUX_s_1_2_2((fsm_output(6)), or_589_nl, fsm_output(5));
  mux_551_nl <= MUX_s_1_2_2(nor_63_nl, mux_550_nl, fsm_output(8));
  mux_552_nl <= MUX_s_1_2_2(mux_551_nl, (fsm_output(8)), fsm_output(7));
  COMP_LOOP_k_not_nl <= NOT mux_tmp_555;
  nor_nl <= NOT((fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(1)));
  and_nl <= (fsm_output(5)) AND or_260_cse;
  mux_nl <= MUX_s_1_2_2(nor_nl, and_nl, fsm_output(8));
  and_1246_nl <= (fsm_output(8)) AND (fsm_output(5));
  mux_715_nl <= MUX_s_1_2_2(mux_nl, and_1246_nl, fsm_output(2));
  or_747_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  mux_716_nl <= MUX_s_1_2_2(mux_715_nl, (fsm_output(8)), or_747_nl);
  or_722_nl <= (fsm_output(4)) OR or_tmp_380;
  nand_43_nl <= NOT((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(2)));
  mux_559_nl <= MUX_s_1_2_2(or_722_nl, nand_43_nl, fsm_output(3));
  COMP_LOOP_17_twiddle_f_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(z_out(9
      DOWNTO 0)) * UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & '1')), 10));
  nor_121_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000"))
      OR or_tmp_380);
  nor_61_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(2))));
  mux_560_nl <= MUX_s_1_2_2(nor_61_nl, (fsm_output(4)), fsm_output(3));
  or_731_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_560_nl;
  mux_561_nl <= MUX_s_1_2_2(nor_121_nl, or_731_nl, fsm_output(7));
  or_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  mux_724_nl <= MUX_s_1_2_2(or_nl, nor_207_cse, fsm_output(2));
  or_762_nl <= (fsm_output(5)) OR mux_724_nl;
  mux_725_nl <= MUX_s_1_2_2(or_762_nl, or_tmp_567, fsm_output(3));
  or_763_nl <= (fsm_output(8)) OR (fsm_output(6)) OR mux_725_nl;
  or_758_nl <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR nand_63_cse;
  mux_721_nl <= MUX_s_1_2_2(mux_tmp_719, or_758_nl, fsm_output(3));
  mux_720_nl <= MUX_s_1_2_2(or_tmp_567, mux_tmp_719, fsm_output(3));
  mux_722_nl <= MUX_s_1_2_2(mux_721_nl, mux_720_nl, fsm_output(6));
  or_754_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(2))
      OR nand_63_cse;
  mux_723_nl <= MUX_s_1_2_2(mux_722_nl, or_754_nl, fsm_output(8));
  mux_726_nl <= MUX_s_1_2_2(or_763_nl, mux_723_nl, fsm_output(4));
  or_802_nl <= (fsm_output(3)) OR (NOT mux_tmp_717);
  nand_72_nl <= NOT((fsm_output(3)) AND mux_tmp_717);
  mux_718_nl <= MUX_s_1_2_2(or_802_nl, nand_72_nl, fsm_output(6));
  or_752_nl <= (fsm_output(8)) OR mux_718_nl;
  mux_727_nl <= MUX_s_1_2_2(mux_726_nl, or_752_nl, fsm_output(7));
  or_772_nl <= (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(8));
  or_771_nl <= (NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(8));
  mux_736_nl <= MUX_s_1_2_2(or_772_nl, or_771_nl, fsm_output(0));
  or_773_nl <= (fsm_output(5)) OR mux_736_nl;
  mux_737_nl <= MUX_s_1_2_2(or_773_nl, or_tmp_579, fsm_output(3));
  or_774_nl <= (fsm_output(6)) OR mux_737_nl;
  and_1244_nl <= (fsm_output(1)) AND (fsm_output(8));
  nor_206_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(8)));
  mux_732_nl <= MUX_s_1_2_2(and_1244_nl, nor_206_nl, fsm_output(2));
  nand_67_nl <= NOT((fsm_output(0)) AND mux_732_nl);
  mux_733_nl <= MUX_s_1_2_2(nand_67_nl, or_tmp_578, fsm_output(5));
  or_769_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(0))) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(8));
  mux_734_nl <= MUX_s_1_2_2(mux_733_nl, or_769_nl, fsm_output(3));
  mux_730_nl <= MUX_s_1_2_2(or_tmp_575, or_tmp_578, fsm_output(5));
  mux_731_nl <= MUX_s_1_2_2(or_tmp_579, mux_730_nl, fsm_output(3));
  mux_735_nl <= MUX_s_1_2_2(mux_734_nl, mux_731_nl, fsm_output(6));
  mux_738_nl <= MUX_s_1_2_2(or_774_nl, mux_735_nl, fsm_output(4));
  or_766_nl <= (fsm_output(3)) OR mux_tmp_728;
  nand_66_nl <= NOT((fsm_output(3)) AND (NOT mux_tmp_728));
  mux_729_nl <= MUX_s_1_2_2(or_766_nl, nand_66_nl, fsm_output(6));
  mux_739_nl <= MUX_s_1_2_2(mux_738_nl, mux_729_nl, fsm_output(7));
  nor_56_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000")));
  or_616_nl <= (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2));
  mux_582_nl <= MUX_s_1_2_2((fsm_output(4)), or_616_nl, fsm_output(3));
  or_617_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_582_nl;
  mux_583_nl <= MUX_s_1_2_2(nor_56_nl, or_617_nl, fsm_output(8));
  mux_584_nl <= MUX_s_1_2_2(mux_583_nl, (fsm_output(8)), fsm_output(7));
  nand_57_nl <= NOT(((NOT (fsm_output(4))) OR (fsm_output(1)) OR (fsm_output(0)))
      AND (fsm_output(3)));
  mux_599_nl <= MUX_s_1_2_2(mux_tmp_594, nand_57_nl, fsm_output(6));
  mux_600_nl <= MUX_s_1_2_2((NOT mux_tmp_593), mux_599_nl, fsm_output(5));
  nand_58_nl <= NOT(or_720_cse AND (fsm_output(3)));
  nand_59_nl <= NOT((fsm_output(0)) AND (fsm_output(3)));
  mux_595_nl <= MUX_s_1_2_2((fsm_output(3)), nand_59_nl, fsm_output(1));
  mux_596_nl <= MUX_s_1_2_2(nand_58_nl, mux_595_nl, fsm_output(4));
  mux_597_nl <= MUX_s_1_2_2(mux_596_nl, mux_tmp_594, fsm_output(6));
  mux_598_nl <= MUX_s_1_2_2(mux_597_nl, (NOT mux_tmp_593), fsm_output(5));
  mux_601_nl <= MUX_s_1_2_2(mux_600_nl, mux_598_nl, fsm_output(2));
  or_632_nl <= (fsm_output(0)) OR not_tmp_313;
  mux_590_nl <= MUX_s_1_2_2((fsm_output(3)), or_632_nl, fsm_output(1));
  or_633_nl <= (fsm_output(4)) OR mux_590_nl;
  mux_591_nl <= MUX_s_1_2_2(or_633_nl, mux_tmp_587, fsm_output(6));
  or_634_nl <= (fsm_output(5)) OR mux_591_nl;
  or_631_nl <= (fsm_output(6)) OR (NOT (fsm_output(4))) OR (fsm_output(1)) OR (fsm_output(0))
      OR not_tmp_313;
  or_629_nl <= (fsm_output(4)) OR (NOT (fsm_output(1))) OR (fsm_output(0)) OR not_tmp_313;
  mux_588_nl <= MUX_s_1_2_2(or_629_nl, mux_tmp_587, fsm_output(6));
  mux_589_nl <= MUX_s_1_2_2(or_631_nl, mux_588_nl, fsm_output(5));
  mux_592_nl <= MUX_s_1_2_2(or_634_nl, mux_589_nl, fsm_output(2));
  mux_602_nl <= MUX_s_1_2_2(mux_601_nl, mux_592_nl, fsm_output(7));
  nor_54_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR
      not_tmp_313);
  and_294_nl <= (fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(3));
  mux_585_nl <= MUX_s_1_2_2(nor_54_nl, and_294_nl, fsm_output(4));
  or_624_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_585_nl;
  or_620_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR and_295_cse;
  mux_586_nl <= MUX_s_1_2_2(or_624_nl, or_620_nl, fsm_output(2));
  nor_53_nl <= NOT((fsm_output(7)) OR mux_586_nl);
  mux_603_nl <= MUX_s_1_2_2(mux_602_nl, nor_53_nl, fsm_output(8));
  and_1248_nl <= and_dcpl_401 AND and_dcpl_21 AND and_dcpl_295;
  and_1249_nl <= and_dcpl_406 AND and_dcpl_31 AND and_dcpl_295;
  and_1250_nl <= and_dcpl_412 AND and_dcpl_21 AND and_dcpl_302;
  and_1251_nl <= and_dcpl_394 AND and_dcpl_31 AND and_dcpl_302;
  and_1252_nl <= and_dcpl_401 AND and_dcpl_26 AND and_dcpl_305;
  and_1253_nl <= and_dcpl_406 AND and_295_cse AND and_dcpl_305;
  and_1254_nl <= and_dcpl_412 AND and_dcpl_26 AND and_dcpl_310;
  and_1255_nl <= and_dcpl_394 AND and_295_cse AND and_dcpl_310;
  and_1256_nl <= and_dcpl_401 AND and_dcpl_31 AND and_dcpl_294 AND and_dcpl_309;
  and_1257_nl <= and_dcpl_406 AND and_dcpl_21 AND and_dcpl_321;
  and_1258_nl <= and_dcpl_412 AND and_dcpl_31 AND and_dcpl_321;
  and_1259_nl <= and_dcpl_394 AND and_dcpl_21 AND and_dcpl_324;
  and_1260_nl <= and_dcpl_401 AND and_295_cse AND and_dcpl_324;
  and_1261_nl <= and_dcpl_406 AND and_dcpl_26 AND and_dcpl_444;
  VEC_LOOP_mux1h_48_nl <= MUX1HOT_v_4_14_2(STD_LOGIC_VECTOR'( "1110"), STD_LOGIC_VECTOR'(
      "1101"), STD_LOGIC_VECTOR'( "1100"), STD_LOGIC_VECTOR'( "1011"), STD_LOGIC_VECTOR'(
      "1010"), STD_LOGIC_VECTOR'( "1001"), STD_LOGIC_VECTOR'( "1000"), STD_LOGIC_VECTOR'(
      "0111"), STD_LOGIC_VECTOR'( "0110"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'(
      "0100"), STD_LOGIC_VECTOR'( "0011"), STD_LOGIC_VECTOR'( "0010"), STD_LOGIC_VECTOR'(
      "0001"), STD_LOGIC_VECTOR'( and_1248_nl & and_1249_nl & and_1250_nl & and_1251_nl
      & and_1252_nl & and_1253_nl & and_1254_nl & and_1255_nl & and_1256_nl & and_1257_nl
      & and_1258_nl & and_1259_nl & and_1260_nl & and_1261_nl));
  and_1262_nl <= and_dcpl_394 AND and_dcpl_26 AND and_dcpl_118 AND nor_144_cse;
  VEC_LOOP_nor_19_nl <= NOT(MUX_v_4_2_2(VEC_LOOP_mux1h_48_nl, STD_LOGIC_VECTOR'("1111"),
      and_1262_nl));
  and_1263_nl <= and_dcpl_412 AND and_295_cse AND and_dcpl_444;
  VEC_LOOP_or_74_nl <= MUX_v_4_2_2(VEC_LOOP_nor_19_nl, STD_LOGIC_VECTOR'("1111"),
      and_1263_nl);
  VEC_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_1_cse_10_sva)
      + UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & VEC_LOOP_or_74_nl & '1'), 14));
  VEC_LOOP_or_nl <= and_dcpl_30 OR and_dcpl_42 OR and_dcpl_50 OR and_dcpl_58 OR and_dcpl_62
      OR and_dcpl_68 OR and_dcpl_72 OR and_dcpl_78 OR and_dcpl_82 OR and_dcpl_87
      OR and_dcpl_92 OR and_dcpl_96 OR and_dcpl_101 OR and_dcpl_105 OR and_dcpl_111
      OR and_dcpl_115;
  VEC_LOOP_mux_13_nl <= MUX_v_14_2_2((VEC_LOOP_j_14_0_1_sva_1(13 DOWNTO 0)), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_acc_nl),
      14)), VEC_LOOP_or_nl);
  or_665_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (NOT mux_tmp_246);
  mux_627_nl <= MUX_s_1_2_2(or_473_cse, or_665_nl, fsm_output(8));
  mux_628_nl <= MUX_s_1_2_2(mux_627_nl, or_tmp_493, fsm_output(7));
  mux_629_nl <= MUX_s_1_2_2(mux_628_nl, or_tmp_363, fsm_output(6));
  mux_630_nl <= MUX_s_1_2_2(mux_tmp_623, mux_629_nl, fsm_output(3));
  or_662_nl <= (fsm_output(2)) OR mux_tmp_243;
  mux_624_nl <= MUX_s_1_2_2(nand_10_cse, or_662_nl, fsm_output(8));
  mux_625_nl <= MUX_s_1_2_2(mux_624_nl, or_tmp_489, fsm_output(7));
  or_663_nl <= (fsm_output(6)) OR mux_625_nl;
  mux_626_nl <= MUX_s_1_2_2(or_663_nl, mux_tmp_623, fsm_output(3));
  mux_631_nl <= MUX_s_1_2_2(mux_630_nl, mux_626_nl, fsm_output(0));
  mux_674_nl <= MUX_s_1_2_2(mux_tmp_664, mux_543_cse, fsm_output(3));
  mux_667_nl <= MUX_s_1_2_2(mux_379_cse, mux_539_cse, fsm_output(2));
  mux_668_nl <= MUX_s_1_2_2(mux_667_nl, or_410_cse, fsm_output(5));
  mux_669_nl <= MUX_s_1_2_2(mux_668_nl, or_tmp_363, fsm_output(6));
  mux_670_nl <= MUX_s_1_2_2(mux_669_nl, mux_tmp_664, fsm_output(3));
  mux_675_nl <= MUX_s_1_2_2(mux_674_nl, mux_670_nl, fsm_output(0));
  and_290_nl <= (fsm_output(4)) AND (fsm_output(1)) AND (fsm_output(2));
  mux_677_nl <= MUX_s_1_2_2(and_290_nl, (fsm_output(4)), fsm_output(3));
  nor_119_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))
      OR mux_677_nl);
  or_608_nl <= (fsm_output(4)) OR nor_tmp;
  mux_676_nl <= MUX_s_1_2_2((fsm_output(4)), or_608_nl, fsm_output(3));
  and_320_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND mux_676_nl;
  mux_678_nl <= MUX_s_1_2_2(nor_119_nl, and_320_nl, fsm_output(7));
  nor_51_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR
      and_dcpl_63);
  or_43_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(2));
  mux_679_nl <= MUX_s_1_2_2((fsm_output(4)), or_43_nl, fsm_output(3));
  and_278_nl <= (fsm_output(6)) AND mux_679_nl;
  mux_680_nl <= MUX_s_1_2_2(and_278_nl, (fsm_output(6)), fsm_output(5));
  mux_681_nl <= MUX_s_1_2_2(nor_51_nl, mux_680_nl, fsm_output(7));
  or_789_nl <= (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(0)));
  mux_748_nl <= MUX_s_1_2_2(or_tmp_595, or_789_nl, fsm_output(3));
  and_1243_nl <= (fsm_output(5)) AND (NOT mux_748_nl);
  nor_200_nl <= NOT((fsm_output(7)) OR nor_201_cse);
  mux_745_nl <= MUX_s_1_2_2(or_713_cse, or_785_cse, fsm_output(7));
  mux_746_nl <= MUX_s_1_2_2(nor_200_nl, mux_745_nl, fsm_output(3));
  or_784_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR (fsm_output(0));
  mux_744_nl <= MUX_s_1_2_2(or_784_nl, or_tmp_595, fsm_output(3));
  mux_747_nl <= MUX_s_1_2_2(mux_746_nl, (NOT mux_744_nl), fsm_output(5));
  mux_749_nl <= MUX_s_1_2_2(and_1243_nl, mux_747_nl, fsm_output(6));
  nor_202_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (NOT (fsm_output(2))) OR (fsm_output(0)));
  nor_203_nl <= NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(1))
      OR (fsm_output(2)) OR (NOT (fsm_output(0))));
  mux_742_nl <= MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output(5));
  and_1239_nl <= (fsm_output(7)) AND or_713_cse;
  mux_740_nl <= MUX_s_1_2_2((fsm_output(7)), and_1239_nl, fsm_output(3));
  nor_204_nl <= NOT((fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (NOT (fsm_output(0))));
  mux_741_nl <= MUX_s_1_2_2(mux_740_nl, nor_204_nl, fsm_output(5));
  mux_743_nl <= MUX_s_1_2_2(mux_742_nl, mux_741_nl, fsm_output(6));
  mux_750_nl <= MUX_s_1_2_2(mux_749_nl, mux_743_nl, fsm_output(4));
  nor_205_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000001")));
  mux_751_nl <= MUX_s_1_2_2(mux_750_nl, nor_205_nl, fsm_output(8));
  or_801_nl <= (fsm_output(2)) OR (fsm_output(6)) OR (fsm_output(5)) OR (NOT (fsm_output(8)));
  mux_757_nl <= MUX_s_1_2_2(or_801_nl, or_799_cse, fsm_output(4));
  or_798_nl <= (fsm_output(4)) OR mux_tmp_754;
  mux_758_nl <= MUX_s_1_2_2(mux_757_nl, or_798_nl, fsm_output(3));
  or_797_nl <= (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT
      (fsm_output(5))) OR (fsm_output(8));
  mux_755_nl <= MUX_s_1_2_2(mux_tmp_752, mux_tmp_754, fsm_output(4));
  mux_756_nl <= MUX_s_1_2_2(or_797_nl, mux_755_nl, fsm_output(3));
  mux_759_nl <= MUX_s_1_2_2(mux_758_nl, mux_756_nl, fsm_output(7));
  and_1242_nl <= (fsm_output(0)) AND (NOT mux_759_nl);
  or_794_nl <= (fsm_output(4)) OR mux_tmp_752;
  or_791_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(2))) OR (fsm_output(6))
      OR (fsm_output(5)) OR (fsm_output(8));
  mux_753_nl <= MUX_s_1_2_2(or_794_nl, or_791_nl, fsm_output(3));
  nor_199_nl <= NOT((fsm_output(0)) OR (fsm_output(7)) OR mux_753_nl);
  mux_760_nl <= MUX_s_1_2_2(and_1242_nl, nor_199_nl, fsm_output(1));
  COMP_LOOP_twiddle_f_mux_11_nl <= MUX_s_1_2_2((COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1(13)),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(13)), COMP_LOOP_twiddle_f_or_1_ssc);
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl <= COMP_LOOP_twiddle_f_mux_11_nl
      AND COMP_LOOP_twiddle_f_nor_itm;
  COMP_LOOP_twiddle_f_mux1h_126_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1(12)),
      (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(12)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1(12)),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(12)), STD_LOGIC_VECTOR'( and_dcpl_293
      & COMP_LOOP_twiddle_f_or_11_itm & and_dcpl_329 & COMP_LOOP_twiddle_f_or_1_ssc));
  COMP_LOOP_twiddle_f_and_18_nl <= COMP_LOOP_twiddle_f_mux1h_126_nl AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_mux1h_127_nl <= MUX1HOT_v_12_5_2((COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1(11
      DOWNTO 0)), (COMP_LOOP_3_twiddle_f_lshift_ncse_sva(11 DOWNTO 0)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1(11
      DOWNTO 0)), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva(11 DOWNTO 0)), COMP_LOOP_5_twiddle_f_lshift_ncse_sva,
      STD_LOGIC_VECTOR'( and_dcpl_293 & COMP_LOOP_twiddle_f_or_11_itm & and_dcpl_329
      & COMP_LOOP_twiddle_f_or_1_ssc & COMP_LOOP_twiddle_f_or_13_itm));
  COMP_LOOP_twiddle_f_and_19_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND COMP_LOOP_twiddle_f_nor_itm;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(8)),
      (COMP_LOOP_k_14_5_sva_8_0(7)), COMP_LOOP_twiddle_f_or_18_itm);
  COMP_LOOP_twiddle_f_and_20_nl <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl
      AND COMP_LOOP_twiddle_f_nor_1_itm;
  COMP_LOOP_twiddle_f_or_25_nl <= and_dcpl_293 OR and_dcpl_300 OR and_dcpl_304 OR
      and_dcpl_308 OR and_dcpl_314 OR and_dcpl_319 OR and_dcpl_323 OR and_dcpl_326;
  COMP_LOOP_twiddle_f_mux1h_128_nl <= MUX1HOT_v_7_3_2((COMP_LOOP_k_14_5_sva_8_0(7
      DOWNTO 1)), (COMP_LOOP_k_14_5_sva_8_0(6 DOWNTO 0)), (COMP_LOOP_k_14_5_sva_8_0(8
      DOWNTO 2)), STD_LOGIC_VECTOR'( COMP_LOOP_twiddle_f_or_25_nl & COMP_LOOP_twiddle_f_or_18_itm
      & COMP_LOOP_twiddle_f_or_13_itm));
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(0)),
      (COMP_LOOP_k_14_5_sva_8_0(1)), COMP_LOOP_twiddle_f_or_13_itm);
  COMP_LOOP_twiddle_f_or_26_nl <= (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl
      AND (NOT(and_dcpl_329 OR and_dcpl_332 OR and_dcpl_334 OR and_dcpl_337 OR and_dcpl_339
      OR and_dcpl_341 OR and_dcpl_343 OR and_dcpl_345))) OR and_dcpl_348 OR and_dcpl_350
      OR and_dcpl_353 OR and_dcpl_355 OR and_dcpl_357 OR and_dcpl_359 OR and_dcpl_361
      OR and_dcpl_365;
  COMP_LOOP_twiddle_f_or_27_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_293
      OR and_dcpl_300 OR and_dcpl_304 OR and_dcpl_308 OR and_dcpl_329 OR and_dcpl_332
      OR and_dcpl_334 OR and_dcpl_337 OR and_dcpl_348 OR and_dcpl_350 OR and_dcpl_353
      OR and_dcpl_355))) OR and_dcpl_314 OR and_dcpl_319 OR and_dcpl_323 OR and_dcpl_326
      OR and_dcpl_339 OR and_dcpl_341 OR and_dcpl_343 OR and_dcpl_345 OR and_dcpl_357
      OR and_dcpl_359 OR and_dcpl_361 OR and_dcpl_365;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl <= (NOT(and_dcpl_293 OR and_dcpl_300
      OR and_dcpl_314 OR and_dcpl_319 OR and_dcpl_329 OR and_dcpl_332 OR and_dcpl_339
      OR and_dcpl_341 OR and_dcpl_348 OR and_dcpl_350 OR and_dcpl_357 OR and_dcpl_359
      OR and_dcpl_367 OR and_dcpl_369)) OR and_dcpl_304 OR and_dcpl_308 OR and_dcpl_323
      OR and_dcpl_326 OR and_dcpl_334 OR and_dcpl_337 OR and_dcpl_343 OR and_dcpl_345
      OR and_dcpl_353 OR and_dcpl_355 OR and_dcpl_361 OR and_dcpl_365 OR and_dcpl_371
      OR and_dcpl_373;
  COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl <= (NOT(and_dcpl_293 OR and_dcpl_304
      OR and_dcpl_314 OR and_dcpl_323 OR and_dcpl_329 OR and_dcpl_334 OR and_dcpl_339
      OR and_dcpl_343 OR and_dcpl_348 OR and_dcpl_353 OR and_dcpl_357 OR and_dcpl_361
      OR and_dcpl_367 OR and_dcpl_371)) OR and_dcpl_300 OR and_dcpl_308 OR and_dcpl_319
      OR and_dcpl_326 OR and_dcpl_332 OR and_dcpl_337 OR and_dcpl_341 OR and_dcpl_345
      OR and_dcpl_350 OR and_dcpl_355 OR and_dcpl_359 OR and_dcpl_365 OR and_dcpl_369
      OR and_dcpl_373;
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl
      & COMP_LOOP_twiddle_f_and_18_nl & COMP_LOOP_twiddle_f_mux1h_127_nl) * UNSIGNED(COMP_LOOP_twiddle_f_and_19_nl
      & COMP_LOOP_twiddle_f_and_20_nl & COMP_LOOP_twiddle_f_mux1h_128_nl & COMP_LOOP_twiddle_f_or_26_nl
      & COMP_LOOP_twiddle_f_or_27_nl & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl
      & COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl & '1')), 14));
  and_1264_nl <= and_dcpl_28 AND and_dcpl_26 AND and_335_cse;
  and_1265_nl <= and_dcpl_32 AND and_dcpl_31 AND and_335_cse;
  and_1266_nl <= and_dcpl_40 AND and_dcpl_21 AND and_dcpl_295;
  and_1267_nl <= and_dcpl_43 AND and_dcpl_26 AND and_dcpl_295;
  and_1268_nl <= and_dcpl_47 AND and_dcpl_31 AND and_dcpl_295;
  and_1269_nl <= and_dcpl_51 AND and_295_cse AND and_dcpl_295;
  and_1270_nl <= and_dcpl_56 AND and_dcpl_21 AND and_dcpl_302;
  and_1271_nl <= and_dcpl_23 AND and_dcpl_26 AND and_dcpl_302;
  and_1272_nl <= and_dcpl_28 AND and_dcpl_31 AND and_dcpl_302;
  and_1273_nl <= and_dcpl_32 AND and_295_cse AND and_dcpl_302;
  and_1274_nl <= and_dcpl_40 AND and_dcpl_26 AND and_dcpl_305;
  and_1275_nl <= and_dcpl_43 AND and_dcpl_31 AND and_dcpl_305;
  and_1276_nl <= and_dcpl_47 AND and_295_cse AND and_dcpl_305;
  and_1277_nl <= and_dcpl_51 AND and_dcpl_21 AND and_dcpl_310;
  and_1278_nl <= and_dcpl_56 AND and_dcpl_26 AND and_dcpl_310;
  and_1279_nl <= and_dcpl_28 AND and_295_cse AND and_dcpl_310;
  and_1280_nl <= and_dcpl_32 AND and_dcpl_21 AND and_dcpl_315;
  and_1281_nl <= and_dcpl_40 AND and_dcpl_31 AND and_dcpl_315;
  and_1282_nl <= and_dcpl_43 AND and_295_cse AND and_dcpl_315;
  and_1283_nl <= and_dcpl_47 AND and_dcpl_21 AND and_dcpl_321;
  and_1284_nl <= and_dcpl_51 AND and_dcpl_26 AND and_dcpl_321;
  and_1285_nl <= and_dcpl_56 AND and_dcpl_31 AND and_dcpl_321;
  and_1286_nl <= and_dcpl_23 AND and_295_cse AND and_dcpl_321;
  and_1287_nl <= and_dcpl_28 AND and_dcpl_21 AND and_dcpl_324;
  and_1288_nl <= and_dcpl_32 AND and_dcpl_26 AND and_dcpl_324;
  and_1289_nl <= and_dcpl_40 AND and_295_cse AND and_dcpl_324;
  and_1290_nl <= and_dcpl_43 AND and_dcpl_21 AND and_dcpl_444;
  and_1291_nl <= and_dcpl_47 AND and_dcpl_26 AND and_dcpl_444;
  and_1292_nl <= and_dcpl_51 AND and_dcpl_31 AND and_dcpl_444;
  VEC_LOOP_mux1h_49_nl <= MUX1HOT_v_5_29_2(STD_LOGIC_VECTOR'( "00001"), STD_LOGIC_VECTOR'(
      "00010"), STD_LOGIC_VECTOR'( "00011"), STD_LOGIC_VECTOR'( "00100"), STD_LOGIC_VECTOR'(
      "00101"), STD_LOGIC_VECTOR'( "00110"), STD_LOGIC_VECTOR'( "00111"), STD_LOGIC_VECTOR'(
      "01000"), STD_LOGIC_VECTOR'( "01001"), STD_LOGIC_VECTOR'( "01010"), STD_LOGIC_VECTOR'(
      "01011"), STD_LOGIC_VECTOR'( "01100"), STD_LOGIC_VECTOR'( "01101"), STD_LOGIC_VECTOR'(
      "01110"), STD_LOGIC_VECTOR'( "01111"), STD_LOGIC_VECTOR'( "10001"), STD_LOGIC_VECTOR'(
      "10010"), STD_LOGIC_VECTOR'( "10011"), STD_LOGIC_VECTOR'( "10100"), STD_LOGIC_VECTOR'(
      "10101"), STD_LOGIC_VECTOR'( "10110"), STD_LOGIC_VECTOR'( "10111"), STD_LOGIC_VECTOR'(
      "11000"), STD_LOGIC_VECTOR'( "11001"), STD_LOGIC_VECTOR'( "11010"), STD_LOGIC_VECTOR'(
      "11011"), STD_LOGIC_VECTOR'( "11100"), STD_LOGIC_VECTOR'( "11101"), STD_LOGIC_VECTOR'(
      "11110"), STD_LOGIC_VECTOR'( and_1264_nl & and_1265_nl & and_1266_nl & and_1267_nl
      & and_1268_nl & and_1269_nl & and_1270_nl & and_1271_nl & and_1272_nl & and_1273_nl
      & and_1274_nl & and_1275_nl & and_1276_nl & and_1277_nl & and_1278_nl & and_1279_nl
      & and_1280_nl & and_1281_nl & and_1282_nl & and_1283_nl & and_1284_nl & and_1285_nl
      & and_1286_nl & and_1287_nl & and_1288_nl & and_1289_nl & and_1290_nl & and_1291_nl
      & and_1292_nl));
  and_1293_nl <= and_dcpl_56 AND and_295_cse AND and_dcpl_444;
  VEC_LOOP_or_75_nl <= MUX_v_5_2_2(VEC_LOOP_mux1h_49_nl, STD_LOGIC_VECTOR'("11111"),
      and_1293_nl);
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_14_5_sva_8_0 & VEC_LOOP_or_75_nl)
      + UNSIGNED(STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1)), 14));
  VEC_LOOP_mux_16_nl <= MUX_v_9_2_2((z_out_31(8 DOWNTO 0)), (z_out_31(9 DOWNTO 1)),
      and_618_ssc);
  VEC_LOOP_mux_17_nl <= MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva(5)), (z_out_31(0)),
      and_618_ssc);
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_16_nl & VEC_LOOP_mux_17_nl
      & (STAGE_LOOP_lshift_psp_sva(4 DOWNTO 1))) + UNSIGNED(VEC_LOOP_acc_1_cse_10_sva),
      14));
  VEC_LOOP_VEC_LOOP_mux_7_nl <= MUX_v_11_2_2((VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO
      3)), ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 5)))), and_dcpl_975);
  VEC_LOOP_or_76_nl <= (NOT(and_dcpl_964 OR and_dcpl_969)) OR and_dcpl_975;
  VEC_LOOP_VEC_LOOP_mux_8_nl <= MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ('0' & (COMP_LOOP_k_14_5_sva_8_0(8
      DOWNTO 1))), and_dcpl_975);
  VEC_LOOP_VEC_LOOP_or_14_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT and_dcpl_964))
      OR and_dcpl_969;
  VEC_LOOP_VEC_LOOP_or_15_nl <= (NOT and_dcpl_975) OR and_dcpl_964 OR and_dcpl_969;
  acc_22_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_7_nl
      & VEC_LOOP_or_76_nl) + UNSIGNED(VEC_LOOP_VEC_LOOP_mux_8_nl & VEC_LOOP_VEC_LOOP_or_14_nl
      & VEC_LOOP_VEC_LOOP_or_15_nl & '1'), 12));
  z_out_26 <= acc_22_nl(11 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_or_16_nl <= ((VEC_LOOP_acc_1_cse_10_sva(13)) AND (NOT(and_dcpl_1018
      OR and_dcpl_1021 OR and_dcpl_1023 OR and_dcpl_1025 OR and_dcpl_1028 OR and_dcpl_1030)))
      OR and_dcpl_1026 OR and_dcpl_1027 OR and_dcpl_1029 OR and_dcpl_1031;
  VEC_LOOP_mux1h_50_nl <= MUX1HOT_s_1_3_2((VEC_LOOP_acc_1_cse_10_sva(12)), (VEC_LOOP_acc_1_cse_10_sva(13)),
      (NOT (STAGE_LOOP_lshift_psp_sva(14))), STD_LOGIC_VECTOR'( VEC_LOOP_or_48_itm
      & VEC_LOOP_or_49_itm & VEC_LOOP_or_59_itm));
  VEC_LOOP_or_77_nl <= VEC_LOOP_mux1h_50_nl OR and_dcpl_1028 OR and_dcpl_1030;
  VEC_LOOP_mux1h_51_nl <= MUX1HOT_v_11_4_2((VEC_LOOP_acc_1_cse_10_sva(11 DOWNTO 1)),
      (VEC_LOOP_acc_1_cse_10_sva(12 DOWNTO 2)), (NOT (STAGE_LOOP_lshift_psp_sva(13
      DOWNTO 3))), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 4))), STD_LOGIC_VECTOR'(
      VEC_LOOP_or_48_itm & VEC_LOOP_or_49_itm & VEC_LOOP_or_59_itm & VEC_LOOP_or_61_itm));
  VEC_LOOP_or_78_nl <= (NOT(and_dcpl_983 OR and_dcpl_990 OR and_dcpl_994 OR and_dcpl_999
      OR and_dcpl_1002 OR and_dcpl_1007 OR and_dcpl_1010 OR and_dcpl_1014 OR and_dcpl_1018
      OR and_dcpl_1021 OR and_dcpl_1023 OR and_dcpl_1025)) OR and_dcpl_1026 OR and_dcpl_1027
      OR and_dcpl_1028 OR and_dcpl_1029 OR and_dcpl_1030 OR and_dcpl_1031;
  VEC_LOOP_and_17_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND (NOT(and_dcpl_1018 OR and_dcpl_1021
      OR and_dcpl_1023 OR and_dcpl_1025 OR and_dcpl_1026 OR and_dcpl_1027 OR and_dcpl_1028
      OR and_dcpl_1029 OR and_dcpl_1030 OR and_dcpl_1031));
  VEC_LOOP_VEC_LOOP_mux_9_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(7)), (COMP_LOOP_k_14_5_sva_8_0(8)),
      VEC_LOOP_or_64_itm);
  VEC_LOOP_and_18_nl <= VEC_LOOP_VEC_LOOP_mux_9_nl AND (NOT(and_dcpl_1028 OR and_dcpl_1030));
  VEC_LOOP_mux1h_52_nl <= MUX1HOT_v_7_3_2((COMP_LOOP_k_14_5_sva_8_0(6 DOWNTO 0)),
      (COMP_LOOP_k_14_5_sva_8_0(7 DOWNTO 1)), (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO
      2)), STD_LOGIC_VECTOR'( VEC_LOOP_or_48_itm & VEC_LOOP_or_64_itm & VEC_LOOP_or_61_itm));
  VEC_LOOP_VEC_LOOP_mux_10_nl <= MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0(0)), (COMP_LOOP_k_14_5_sva_8_0(1)),
      VEC_LOOP_or_61_itm);
  VEC_LOOP_or_79_nl <= (VEC_LOOP_VEC_LOOP_mux_10_nl AND (NOT(and_dcpl_983 OR and_dcpl_990
      OR and_dcpl_994 OR and_dcpl_999))) OR and_dcpl_1002 OR and_dcpl_1007 OR and_dcpl_1010
      OR and_dcpl_1014;
  VEC_LOOP_VEC_LOOP_or_17_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_983
      OR and_dcpl_990 OR and_dcpl_1002 OR and_dcpl_1007 OR and_dcpl_1018 OR and_dcpl_1021
      OR and_dcpl_1029 OR and_dcpl_1031))) OR and_dcpl_994 OR and_dcpl_999 OR and_dcpl_1010
      OR and_dcpl_1014 OR and_dcpl_1023 OR and_dcpl_1025 OR and_dcpl_1026 OR and_dcpl_1027;
  VEC_LOOP_VEC_LOOP_or_18_nl <= (NOT(and_dcpl_983 OR and_dcpl_994 OR and_dcpl_1002
      OR and_dcpl_1010 OR and_dcpl_1018 OR and_dcpl_1023 OR and_dcpl_1026 OR and_dcpl_1030
      OR and_dcpl_1031)) OR and_dcpl_990 OR and_dcpl_999 OR and_dcpl_1007 OR and_dcpl_1014
      OR and_dcpl_1021 OR and_dcpl_1025 OR and_dcpl_1027 OR and_dcpl_1028 OR and_dcpl_1029;
  VEC_LOOP_VEC_LOOP_or_19_nl <= (NOT(and_dcpl_1026 OR and_dcpl_1027 OR and_dcpl_1028
      OR and_dcpl_1029 OR and_dcpl_1030 OR and_dcpl_1031)) OR and_dcpl_983 OR and_dcpl_990
      OR and_dcpl_994 OR and_dcpl_999 OR and_dcpl_1002 OR and_dcpl_1007 OR and_dcpl_1010
      OR and_dcpl_1014 OR and_dcpl_1018 OR and_dcpl_1021 OR and_dcpl_1023 OR and_dcpl_1025;
  acc_23_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_16_nl
      & VEC_LOOP_or_77_nl & VEC_LOOP_mux1h_51_nl & VEC_LOOP_or_78_nl) + UNSIGNED(VEC_LOOP_and_17_nl
      & VEC_LOOP_and_18_nl & VEC_LOOP_mux1h_52_nl & VEC_LOOP_or_79_nl & VEC_LOOP_VEC_LOOP_or_17_nl
      & VEC_LOOP_VEC_LOOP_or_18_nl & VEC_LOOP_VEC_LOOP_or_19_nl & '1'), 14));
  z_out_27 <= acc_23_nl(13 DOWNTO 1);
  and_1294_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("010")) AND
      and_dcpl_21 AND and_dcpl_118 AND nor_144_cse;
  STAGE_LOOP_mux_3_nl <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (NOT STAGE_LOOP_i_3_0_sva),
      and_1294_nl);
  z_out_28 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_3_nl) + UNSIGNED'(
      "1111"), 4));
  VEC_LOOP_VEC_LOOP_or_20_nl <= (STAGE_LOOP_lshift_psp_sva(14)) OR and_dcpl_1053
      OR and_dcpl_1058 OR and_dcpl_1062 OR and_dcpl_1069 OR and_dcpl_1073 OR and_dcpl_1077
      OR and_dcpl_1081 OR and_dcpl_1085 OR and_dcpl_1087 OR and_dcpl_1089 OR and_dcpl_1093
      OR and_dcpl_1096 OR and_dcpl_1099 OR and_dcpl_1101 OR and_dcpl_1103;
  VEC_LOOP_VEC_LOOP_mux_11_nl <= MUX_v_14_2_2((STAGE_LOOP_lshift_psp_sva(13 DOWNTO
      0)), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1))), VEC_LOOP_or_70_itm);
  or_803_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(8)));
  mux_766_nl <= MUX_s_1_2_2(mux_tmp_704, or_803_nl, fsm_output(4));
  mux_765_nl <= MUX_s_1_2_2(mux_766_nl, mux_tmp_700, fsm_output(2));
  mux_764_nl <= MUX_s_1_2_2(mux_765_nl, or_410_cse, fsm_output(5));
  mux_763_nl <= MUX_s_1_2_2(mux_764_nl, or_tmp_363, fsm_output(6));
  mux_762_nl <= MUX_s_1_2_2(mux_tmp_703, mux_763_nl, fsm_output(0));
  mux_770_nl <= MUX_s_1_2_2(mux_tmp_699, mux_tmp_704, fsm_output(4));
  mux_769_nl <= MUX_s_1_2_2(or_408_cse, mux_770_nl, fsm_output(2));
  or_804_nl <= (fsm_output(5)) OR mux_769_nl;
  mux_768_nl <= MUX_s_1_2_2(or_804_nl, or_tmp_551, fsm_output(6));
  mux_767_nl <= MUX_s_1_2_2(mux_768_nl, mux_tmp_703, fsm_output(0));
  mux_761_nl <= MUX_s_1_2_2(mux_762_nl, mux_767_nl, fsm_output(3));
  VEC_LOOP_or_80_nl <= mux_761_nl OR and_dcpl_1053 OR and_dcpl_1058 OR and_dcpl_1062
      OR and_dcpl_1069 OR and_dcpl_1073 OR and_dcpl_1077 OR and_dcpl_1081 OR and_dcpl_1085
      OR and_dcpl_1087 OR and_dcpl_1089 OR and_dcpl_1093 OR and_dcpl_1096 OR and_dcpl_1099
      OR and_dcpl_1101 OR and_dcpl_1103;
  VEC_LOOP_VEC_LOOP_mux_12_nl <= MUX_v_9_2_2((VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO
      5)), COMP_LOOP_k_14_5_sva_8_0, VEC_LOOP_or_70_itm);
  VEC_LOOP_VEC_LOOP_or_21_nl <= ((VEC_LOOP_acc_1_cse_10_sva(4)) AND (NOT(and_dcpl_1093
      OR and_dcpl_1096 OR and_dcpl_1099 OR and_dcpl_1101 OR and_dcpl_1103))) OR and_dcpl_1053
      OR and_dcpl_1058 OR and_dcpl_1062 OR and_dcpl_1069 OR and_dcpl_1073 OR and_dcpl_1077
      OR and_dcpl_1081 OR and_dcpl_1085 OR and_dcpl_1087 OR and_dcpl_1089;
  VEC_LOOP_VEC_LOOP_or_22_nl <= ((VEC_LOOP_acc_1_cse_10_sva(3)) AND (NOT(and_dcpl_1073
      OR and_dcpl_1085 OR and_dcpl_1087 OR and_dcpl_1089 OR and_dcpl_1099))) OR and_dcpl_1053
      OR and_dcpl_1058 OR and_dcpl_1062 OR and_dcpl_1069 OR and_dcpl_1077 OR and_dcpl_1081
      OR and_dcpl_1093 OR and_dcpl_1096 OR and_dcpl_1101 OR and_dcpl_1103;
  VEC_LOOP_VEC_LOOP_or_23_nl <= ((VEC_LOOP_acc_1_cse_10_sva(2)) AND (NOT(and_dcpl_1069
      OR and_dcpl_1077 OR and_dcpl_1081 OR and_dcpl_1085 OR and_dcpl_1093 OR and_dcpl_1103)))
      OR and_dcpl_1053 OR and_dcpl_1058 OR and_dcpl_1062 OR and_dcpl_1073 OR and_dcpl_1087
      OR and_dcpl_1089 OR and_dcpl_1096 OR and_dcpl_1099 OR and_dcpl_1101;
  VEC_LOOP_VEC_LOOP_or_24_nl <= ((VEC_LOOP_acc_1_cse_10_sva(1)) AND (NOT(and_dcpl_1058
      OR and_dcpl_1062 OR and_dcpl_1077 OR and_dcpl_1081 OR and_dcpl_1087 OR and_dcpl_1089
      OR and_dcpl_1096 OR and_dcpl_1099 OR and_dcpl_1101 OR and_dcpl_1103))) OR and_dcpl_1053
      OR and_dcpl_1069 OR and_dcpl_1073 OR and_dcpl_1085 OR and_dcpl_1093;
  VEC_LOOP_VEC_LOOP_or_25_nl <= ((VEC_LOOP_acc_1_cse_10_sva(0)) AND (NOT(and_dcpl_1053
      OR and_dcpl_1062 OR and_dcpl_1069 OR and_dcpl_1073 OR and_dcpl_1081 OR and_dcpl_1085
      OR and_dcpl_1089 OR and_dcpl_1093 OR and_dcpl_1096))) OR and_dcpl_1058 OR and_dcpl_1077
      OR and_dcpl_1087 OR and_dcpl_1099 OR and_dcpl_1101 OR and_dcpl_1103;
  acc_25_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_20_nl
      & VEC_LOOP_VEC_LOOP_mux_11_nl & VEC_LOOP_or_80_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_mux_12_nl
      & VEC_LOOP_VEC_LOOP_or_21_nl & VEC_LOOP_VEC_LOOP_or_22_nl & VEC_LOOP_VEC_LOOP_or_23_nl
      & VEC_LOOP_VEC_LOOP_or_24_nl & VEC_LOOP_VEC_LOOP_or_25_nl & '1'), 15), 16),
      16));
  z_out_29 <= acc_25_nl(15 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_or_26_nl <= (NOT(and_dcpl_1111 OR and_dcpl_1116 OR and_dcpl_1148))
      OR and_dcpl_1119 OR and_dcpl_1122 OR and_dcpl_1126 OR and_dcpl_1131 OR and_dcpl_1137
      OR and_dcpl_1141 OR and_dcpl_1143 OR and_dcpl_1150;
  VEC_LOOP_mux1h_53_nl <= MUX1HOT_v_14_4_2((STD_LOGIC_VECTOR'( "0000") & (VEC_LOOP_acc_1_cse_10_sva(13
      DOWNTO 4))), (STD_LOGIC_VECTOR'( "00000") & (VEC_LOOP_acc_1_cse_10_sva(13 DOWNTO
      5))), (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 1))), (STD_LOGIC_VECTOR'( "00001")
      & (NOT (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 6)))), STD_LOGIC_VECTOR'( and_dcpl_1111
      & and_dcpl_1116 & VEC_LOOP_or_72_itm & and_dcpl_1148));
  VEC_LOOP_or_81_nl <= (NOT(and_dcpl_1111 OR and_dcpl_1116)) OR and_dcpl_1119 OR
      and_dcpl_1122 OR and_dcpl_1126 OR and_dcpl_1131 OR and_dcpl_1137 OR and_dcpl_1141
      OR and_dcpl_1143 OR and_dcpl_1148 OR and_dcpl_1150;
  VEC_LOOP_mux1h_54_nl <= MUX1HOT_v_9_3_2((STD_LOGIC_VECTOR'( "0000") & (COMP_LOOP_k_14_5_sva_8_0(8
      DOWNTO 4))), (STD_LOGIC_VECTOR'( "00000") & (COMP_LOOP_k_14_5_sva_8_0(8 DOWNTO
      5))), COMP_LOOP_k_14_5_sva_8_0, STD_LOGIC_VECTOR'( and_dcpl_1111 & VEC_LOOP_or_53_itm
      & VEC_LOOP_or_72_itm));
  VEC_LOOP_or_82_nl <= and_dcpl_1119 OR and_dcpl_1122;
  VEC_LOOP_mux1h_55_nl <= MUX1HOT_v_4_8_2((COMP_LOOP_k_14_5_sva_8_0(3 DOWNTO 0)),
      (COMP_LOOP_k_14_5_sva_8_0(4 DOWNTO 1)), STD_LOGIC_VECTOR'( "1000"), STD_LOGIC_VECTOR'(
      "0001"), STD_LOGIC_VECTOR'( "0100"), STD_LOGIC_VECTOR'( "0010"), STD_LOGIC_VECTOR'(
      "0011"), STD_LOGIC_VECTOR'( "0111"), STD_LOGIC_VECTOR'( and_dcpl_1111 & VEC_LOOP_or_53_itm
      & VEC_LOOP_or_82_nl & and_dcpl_1126 & and_dcpl_1131 & and_dcpl_1137 & and_dcpl_1141
      & and_dcpl_1143));
  not_1368_nl <= NOT and_dcpl_1150;
  VEC_LOOP_and_26_nl <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), VEC_LOOP_mux1h_55_nl,
      not_1368_nl);
  VEC_LOOP_VEC_LOOP_or_27_nl <= ((COMP_LOOP_k_14_5_sva_8_0(0)) AND (NOT(and_dcpl_1122
      OR and_dcpl_1126 OR and_dcpl_1131 OR and_dcpl_1137 OR and_dcpl_1141 OR and_dcpl_1143)))
      OR and_dcpl_1111 OR and_dcpl_1119 OR and_dcpl_1150;
  acc_26_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_or_26_nl
      & VEC_LOOP_mux1h_53_nl & VEC_LOOP_or_81_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux1h_54_nl
      & VEC_LOOP_and_26_nl & VEC_LOOP_VEC_LOOP_or_27_nl & '1'), 15), 16), 16));
  z_out_30 <= acc_26_nl(15 DOWNTO 1);
  VEC_LOOP_VEC_LOOP_and_2_nl <= (COMP_LOOP_k_14_5_sva_8_0(8)) AND (NOT(and_dcpl_1158
      OR and_dcpl_1168));
  VEC_LOOP_VEC_LOOP_mux_13_nl <= MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ((COMP_LOOP_k_14_5_sva_8_0(7
      DOWNTO 0)) & '1'), and_dcpl_1163);
  VEC_LOOP_mux1h_56_nl <= MUX1HOT_v_10_3_2(('0' & (STAGE_LOOP_lshift_psp_sva(14 DOWNTO
      6))), (STAGE_LOOP_lshift_psp_sva(14 DOWNTO 5)), STD_LOGIC_VECTOR'( "0000000001"),
      STD_LOGIC_VECTOR'( and_dcpl_1158 & and_dcpl_1163 & and_dcpl_1168));
  z_out_31 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_VEC_LOOP_and_2_nl
      & VEC_LOOP_VEC_LOOP_mux_13_nl) + UNSIGNED(VEC_LOOP_mux1h_56_nl), 10));
END v8;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_precomp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_sync_in_wait_pkg_v1.ALL;
USE work.ccs_sync_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_precomp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_rsc_rdy : OUT STD_LOGIC;
    run_rsc_vld : IN STD_LOGIC;
    vec_rsc_wadr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsc_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_we : OUT STD_LOGIC;
    vec_rsc_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    vec_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    complete_rsc_rdy : IN STD_LOGIC;
    complete_rsc_vld : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_precomp;

ARCHITECTURE v8 OF inPlaceNTT_DIF_precomp IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_wadr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsci_we_d_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      clkr : IN STD_LOGIC;
      clkr_en : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_wadr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_d_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL vec_rsci_wadr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_precomp_core
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
      vec_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      vec_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      vec_rsci_wadr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_vec_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_vec_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_vec_rsci_radr_d : STD_LOGIC_VECTOR (13
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_vec_rsci_wadr_d : STD_LOGIC_VECTOR (13
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_radr_d : STD_LOGIC_VECTOR
      (13 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_radr_d : STD_LOGIC_VECTOR
      (13 DOWNTO 0);

BEGIN
  vec_rsci : inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => vec_rsci_q,
      radr => vec_rsci_radr,
      we => vec_rsc_we,
      d => vec_rsci_d,
      wadr => vec_rsci_wadr,
      clkr => clk,
      clkr_en => '1',
      d_d => vec_rsci_d_d_1,
      q_d => vec_rsci_q_d_1,
      radr_d => vec_rsci_radr_d_1,
      wadr_d => vec_rsci_wadr_d_1,
      we_d => vec_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsci_q <= vec_rsc_q;
  vec_rsc_radr <= vec_rsci_radr;
  vec_rsc_d <= vec_rsci_d;
  vec_rsc_wadr <= vec_rsci_wadr;
  vec_rsci_d_d_1 <= vec_rsci_d_d;
  vec_rsci_q_d <= vec_rsci_q_d_1;
  vec_rsci_radr_d_1 <= vec_rsci_radr_d;
  vec_rsci_wadr_d_1 <= vec_rsci_wadr_d;

  twiddle_rsci : inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_rsci_q,
      radr => twiddle_rsci_radr,
      q_d => twiddle_rsci_q_d_1,
      radr_d => twiddle_rsci_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsci_q <= twiddle_rsc_q;
  twiddle_rsc_radr <= twiddle_rsci_radr;
  twiddle_rsci_q_d <= twiddle_rsci_q_d_1;
  twiddle_rsci_radr_d_1 <= twiddle_rsci_radr_d;

  twiddle_h_rsci : inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_h_rsci_q,
      radr => twiddle_h_rsci_radr,
      q_d => twiddle_h_rsci_q_d_1,
      radr_d => twiddle_h_rsci_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_h_rsci_q <= twiddle_h_rsc_q;
  twiddle_h_rsc_radr <= twiddle_h_rsci_radr;
  twiddle_h_rsci_q_d <= twiddle_h_rsci_q_d_1;
  twiddle_h_rsci_radr_d_1 <= twiddle_h_rsci_radr_d;

  inPlaceNTT_DIF_precomp_core_inst : inPlaceNTT_DIF_precomp_core
    PORT MAP(
      clk => clk,
      rst => rst,
      run_rsc_rdy => run_rsc_rdy,
      run_rsc_vld => run_rsc_vld,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => inPlaceNTT_DIF_precomp_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      complete_rsc_rdy => complete_rsc_rdy,
      complete_rsc_vld => complete_rsc_vld,
      vec_rsci_d_d => inPlaceNTT_DIF_precomp_core_inst_vec_rsci_d_d,
      vec_rsci_q_d => inPlaceNTT_DIF_precomp_core_inst_vec_rsci_q_d,
      vec_rsci_radr_d => inPlaceNTT_DIF_precomp_core_inst_vec_rsci_radr_d,
      vec_rsci_wadr_d => inPlaceNTT_DIF_precomp_core_inst_vec_rsci_wadr_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_q_d => inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_q_d,
      twiddle_rsci_radr_d => inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_radr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_q_d => inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_q_d,
      twiddle_h_rsci_radr_d => inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_radr_d,
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsci_we_d_pff => vec_rsci_we_d_iff
    );
  inPlaceNTT_DIF_precomp_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsci_d_d <= inPlaceNTT_DIF_precomp_core_inst_vec_rsci_d_d;
  inPlaceNTT_DIF_precomp_core_inst_vec_rsci_q_d <= vec_rsci_q_d;
  vec_rsci_radr_d <= inPlaceNTT_DIF_precomp_core_inst_vec_rsci_radr_d;
  vec_rsci_wadr_d <= inPlaceNTT_DIF_precomp_core_inst_vec_rsci_wadr_d;
  inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_radr_d <= inPlaceNTT_DIF_precomp_core_inst_twiddle_rsci_radr_d;
  inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_q_d <= twiddle_h_rsci_q_d;
  twiddle_h_rsci_radr_d <= inPlaceNTT_DIF_precomp_core_inst_twiddle_h_rsci_radr_d;

END v8;



