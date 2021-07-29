
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_comps.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;

PACKAGE mgc_comps IS
 
FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
FUNCTION ceil_log2(size : NATURAL) return NATURAL;
 

COMPONENT mgc_not
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_and
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nand
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_or
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xnor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux
  GENERIC (
    width  :  NATURAL;
    ctrlw  :  NATURAL;
    p2ctrlw : NATURAL := 0
  );
  PORT (
    a: in  std_logic_vector(width*(2**ctrlw) - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw            - 1 DOWNTO 0);
    z: out std_logic_vector(width            - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux1hot
  GENERIC (
    width  : NATURAL;
    ctrlw  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ctrlw - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw       - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_reg_pos
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;  -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL  -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_reg_neg
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;   -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_generic_reg
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_equal
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a : in  std_logic_vector(width-1 DOWNTO 0);
    b : in  std_logic_vector(width-1 DOWNTO 0);
    eq: out std_logic;
    ne: out std_logic
  );
END COMPONENT;

COMPONENT mgc_shift_l
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

COMPONENT mgc_shift_r
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

COMPONENT mgc_shift_bl
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

COMPONENT mgc_shift_br
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

COMPONENT mgc_rot
  GENERIC (
    width  : NATURAL;
    width_s: NATURAL;
    signd_s: NATURAL;      -- 0:unsigned 1:signed
    sleft  : NATURAL;      -- 0:right 1:left;
    log2w  : NATURAL := 0; -- LOG2(width)
    l2wp2  : NATURAL := 0  --2**LOG2(width)
  );
  PORT (
    a : in  std_logic_vector(width  -1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width  -1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_ci
  GENERIC (
    width_a : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width_a, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width_a, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width_a,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width_a,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_addc
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add3
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_c : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_c : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(ifeqsel(width_c,0,width,width_c)-1 DOWNTO 0);
    d: in  std_logic_vector(0 DOWNTO 0);
    e: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_sub_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addc_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     c: in std_logic_vector(0 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addsub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    add: in  std_logic;
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_accu
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_abs
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_fast
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_pipe
  GENERIC (
    width_a       : NATURAL;
    signd_a       : NATURAL;
    width_b       : NATURAL;
    signd_b       : NATURAL;
    width_z       : NATURAL; -- <= width_a + width_b
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 

  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2add1
  GENERIC (
    gentype : NATURAL;
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_b2 : NATURAL;
    signd_b2 : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_d2 : NATURAL;
    signd_d2 : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;   -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   : NATURAL;
    add_b2  : NATURAL;
    add_d2  : NATURAL
  );
  PORT (
    a   : in  std_logic_vector(width_a-1 DOWNTO 0);
    b   : in  std_logic_vector(width_b-1 DOWNTO 0);
    b2  : in  std_logic_vector(width_b2-1 DOWNTO 0);
    c   : in  std_logic_vector(width_c-1 DOWNTO 0);
    d   : in  std_logic_vector(width_d-1 DOWNTO 0);
    d2  : in  std_logic_vector(width_d2-1 DOWNTO 0);
    cst : in  std_logic_vector(width_e-1 DOWNTO 0);
    z   : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2add1_pipe
  GENERIC (
    gentype : NATURAL;
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_b2 : NATURAL;
    signd_b2 : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_d2 : NATURAL;
    signd_d2 : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   : NATURAL;
    add_b2   : NATURAL;
    add_d2   : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    b2     : in  std_logic_vector(width_b2-1 DOWNTO 0);
    c     : in  std_logic_vector(width_c-1 DOWNTO 0);
    d     : in  std_logic_vector(width_d-1 DOWNTO 0);
    d2     : in  std_logic_vector(width_d2-1 DOWNTO 0);
    cst   : in  std_logic_vector(width_e-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_muladd1
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_cst : NATURAL;
    signd_cst : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb : NATURAL;
    add_c   : NATURAL;
    add_d   : NATURAL
  );
  PORT (
    a:   in  std_logic_vector(width_a-1 DOWNTO 0);
    b:   in  std_logic_vector(width_b-1 DOWNTO 0);
    c:   in  std_logic_vector(width_c-1 DOWNTO 0);
    cst: in  std_logic_vector(width_cst-1 DOWNTO 0);
    d:   in  std_logic_vector(width_d-1 DOWNTO 0);
    z:   out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_muladd1_pipe
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_cst : NATURAL;
    signd_cst : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb : NATURAL;
    add_c   : NATURAL;
    add_d   : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    c     : in  std_logic_vector(width_c-1 DOWNTO 0);
    cst   : in  std_logic_vector(width_cst-1 DOWNTO 0);
    d     : in  std_logic_vector(width_d-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mulacc_pipe
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c)+1
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a         : in  std_logic_vector(width_a-1 DOWNTO 0);
    b         : in  std_logic_vector(width_b-1 DOWNTO 0);
    c         : in  std_logic_vector(width_c-1 DOWNTO 0);
    load      : in  std_logic;
    datavalid : in  std_logic;
    clk       : in  std_logic;
    en        : in  std_logic;
    a_rst     : in  std_logic;
    s_rst     : in  std_logic;
    z         : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul2acc_pipe
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_c : NATURAL;
    signd_c : NATURAL;
    width_d : NATURAL;
    signd_d : NATURAL;
    width_e : NATURAL;
    signd_e : NATURAL;
    width_z : NATURAL;    -- <= max(width_a + width_b, width_c)+1
    add_cxd : NATURAL;
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 
  );
  PORT (
    a         : in  std_logic_vector(width_a-1 DOWNTO 0);
    b         : in  std_logic_vector(width_b-1 DOWNTO 0);
    c         : in  std_logic_vector(width_c-1 DOWNTO 0);
    d         : in  std_logic_vector(width_d-1 DOWNTO 0);
    e         : in  std_logic_vector(width_e-1 DOWNTO 0);
    load      : in  std_logic;
    datavalid : in  std_logic;
    clk       : in  std_logic;
    en        : in  std_logic;
    a_rst     : in  std_logic;
    s_rst     : in  std_logic;
    z         : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_div
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mod
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rem
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_csa
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     c: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_csha
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_rom
    GENERIC (
      rom_id : natural := 1;
      size : natural := 33;
      width : natural := 32
      );
    PORT (
      data_in : std_logic_vector((size*width)-1 downto 0);
      addr : std_logic_vector(ceil_log2(size)-1 downto 0);
      data_out : out std_logic_vector(width-1 downto 0)
    );
END COMPONENT;

END mgc_comps;

PACKAGE BODY mgc_comps IS
 
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

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;
 
END mgc_comps;

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_rem_beh.vhd 

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_rem IS
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END mgc_rem;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

USE work.funcs.all;

ARCHITECTURE beh OF mgc_rem IS
BEGIN
  z <= std_logic_vector(unsigned(a) rem unsigned(b)) WHEN signd = 0 ELSE
       std_logic_vector(  signed(a) rem   signed(b));
END beh;

--------> ../td_ccore_solutions/modulo_dev_bb61c76201db0c9669a47462bb7d006361ff_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Tue Jul 20 15:24:30 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    modulo_dev_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;
USE work.mgc_comps.ALL;


ENTITY modulo_dev_core IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_dev_core;

ARCHITECTURE v1 OF modulo_dev_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL base_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat : STD_LOGIC;
  SIGNAL rem_13_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_1_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_2_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_3_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_4_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_5_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_6_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_7_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_8_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_9_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_10_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_11_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_1_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_2_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_3_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_4_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_5_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_6_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_7_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_8_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_9_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_10_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_11_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL acc_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL acc_1_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_1 : STD_LOGIC;
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL and_dcpl_117 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_141 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL and_dcpl_190 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_217 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_219 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_222 : STD_LOGIC;
  SIGNAL and_dcpl_224 : STD_LOGIC;
  SIGNAL and_dcpl_225 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_245 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_247 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_280 : STD_LOGIC;
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL and_dcpl_291 : STD_LOGIC;
  SIGNAL and_dcpl_292 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_296 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL not_tmp_54 : STD_LOGIC;
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_300 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL and_dcpl_304 : STD_LOGIC;
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL and_dcpl_306 : STD_LOGIC;
  SIGNAL and_dcpl_307 : STD_LOGIC;
  SIGNAL and_dcpl_308 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_312 : STD_LOGIC;
  SIGNAL and_dcpl_313 : STD_LOGIC;
  SIGNAL and_dcpl_314 : STD_LOGIC;
  SIGNAL and_dcpl_316 : STD_LOGIC;
  SIGNAL and_tmp_5 : STD_LOGIC;
  SIGNAL and_dcpl_318 : STD_LOGIC;
  SIGNAL and_tmp_9 : STD_LOGIC;
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_330 : STD_LOGIC;
  SIGNAL mux_tmp_19 : STD_LOGIC;
  SIGNAL and_tmp_17 : STD_LOGIC;
  SIGNAL and_dcpl_336 : STD_LOGIC;
  SIGNAL mux_tmp_22 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL and_tmp_21 : STD_LOGIC;
  SIGNAL and_dcpl_342 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL mux_tmp_27 : STD_LOGIC;
  SIGNAL mux_tmp_28 : STD_LOGIC;
  SIGNAL and_tmp_25 : STD_LOGIC;
  SIGNAL and_dcpl_348 : STD_LOGIC;
  SIGNAL and_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_355 : STD_LOGIC;
  SIGNAL and_dcpl_356 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL or_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_360 : STD_LOGIC;
  SIGNAL and_dcpl_362 : STD_LOGIC;
  SIGNAL mux_tmp_32 : STD_LOGIC;
  SIGNAL and_dcpl_364 : STD_LOGIC;
  SIGNAL and_dcpl_366 : STD_LOGIC;
  SIGNAL mux_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_368 : STD_LOGIC;
  SIGNAL and_dcpl_370 : STD_LOGIC;
  SIGNAL mux_tmp_37 : STD_LOGIC;
  SIGNAL mux_tmp_38 : STD_LOGIC;
  SIGNAL mux_tmp_39 : STD_LOGIC;
  SIGNAL and_dcpl_372 : STD_LOGIC;
  SIGNAL mux_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_42 : STD_LOGIC;
  SIGNAL mux_tmp_43 : STD_LOGIC;
  SIGNAL mux_tmp_44 : STD_LOGIC;
  SIGNAL and_dcpl_376 : STD_LOGIC;
  SIGNAL mux_tmp_46 : STD_LOGIC;
  SIGNAL mux_tmp_47 : STD_LOGIC;
  SIGNAL mux_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_49 : STD_LOGIC;
  SIGNAL mux_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_379 : STD_LOGIC;
  SIGNAL mux_tmp_52 : STD_LOGIC;
  SIGNAL mux_tmp_53 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_56 : STD_LOGIC;
  SIGNAL mux_tmp_57 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL mux_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_60 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_62 : STD_LOGIC;
  SIGNAL mux_tmp_63 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL mux_tmp_65 : STD_LOGIC;
  SIGNAL and_dcpl_385 : STD_LOGIC;
  SIGNAL mux_tmp_67 : STD_LOGIC;
  SIGNAL mux_tmp_68 : STD_LOGIC;
  SIGNAL mux_tmp_69 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL mux_tmp_71 : STD_LOGIC;
  SIGNAL mux_tmp_72 : STD_LOGIC;
  SIGNAL mux_tmp_73 : STD_LOGIC;
  SIGNAL mux_tmp_74 : STD_LOGIC;
  SIGNAL and_dcpl_388 : STD_LOGIC;
  SIGNAL and_tmp_44 : STD_LOGIC;
  SIGNAL mux_tmp_76 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL and_dcpl_394 : STD_LOGIC;
  SIGNAL and_dcpl_395 : STD_LOGIC;
  SIGNAL or_tmp_185 : STD_LOGIC;
  SIGNAL and_dcpl_397 : STD_LOGIC;
  SIGNAL and_dcpl_398 : STD_LOGIC;
  SIGNAL and_tmp_45 : STD_LOGIC;
  SIGNAL and_dcpl_400 : STD_LOGIC;
  SIGNAL and_dcpl_401 : STD_LOGIC;
  SIGNAL and_tmp_47 : STD_LOGIC;
  SIGNAL and_dcpl_403 : STD_LOGIC;
  SIGNAL and_dcpl_404 : STD_LOGIC;
  SIGNAL and_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_406 : STD_LOGIC;
  SIGNAL and_tmp_54 : STD_LOGIC;
  SIGNAL and_dcpl_409 : STD_LOGIC;
  SIGNAL and_tmp_58 : STD_LOGIC;
  SIGNAL and_dcpl_413 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL and_tmp_62 : STD_LOGIC;
  SIGNAL and_dcpl_417 : STD_LOGIC;
  SIGNAL mux_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_88 : STD_LOGIC;
  SIGNAL and_tmp_66 : STD_LOGIC;
  SIGNAL and_dcpl_421 : STD_LOGIC;
  SIGNAL mux_tmp_91 : STD_LOGIC;
  SIGNAL mux_tmp_92 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL and_tmp_70 : STD_LOGIC;
  SIGNAL and_dcpl_425 : STD_LOGIC;
  SIGNAL and_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_430 : STD_LOGIC;
  SIGNAL and_dcpl_431 : STD_LOGIC;
  SIGNAL or_tmp_263 : STD_LOGIC;
  SIGNAL and_dcpl_433 : STD_LOGIC;
  SIGNAL mux_tmp_97 : STD_LOGIC;
  SIGNAL and_dcpl_435 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL and_dcpl_437 : STD_LOGIC;
  SIGNAL mux_tmp_102 : STD_LOGIC;
  SIGNAL mux_tmp_103 : STD_LOGIC;
  SIGNAL mux_tmp_104 : STD_LOGIC;
  SIGNAL and_dcpl_439 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_107 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL mux_tmp_109 : STD_LOGIC;
  SIGNAL and_dcpl_442 : STD_LOGIC;
  SIGNAL mux_tmp_111 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL mux_tmp_114 : STD_LOGIC;
  SIGNAL mux_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_445 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL mux_tmp_118 : STD_LOGIC;
  SIGNAL mux_tmp_119 : STD_LOGIC;
  SIGNAL mux_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL mux_tmp_122 : STD_LOGIC;
  SIGNAL and_dcpl_448 : STD_LOGIC;
  SIGNAL mux_tmp_124 : STD_LOGIC;
  SIGNAL mux_tmp_125 : STD_LOGIC;
  SIGNAL mux_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_127 : STD_LOGIC;
  SIGNAL mux_tmp_128 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL mux_tmp_130 : STD_LOGIC;
  SIGNAL and_dcpl_451 : STD_LOGIC;
  SIGNAL mux_tmp_132 : STD_LOGIC;
  SIGNAL mux_tmp_133 : STD_LOGIC;
  SIGNAL mux_tmp_134 : STD_LOGIC;
  SIGNAL mux_tmp_135 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_139 : STD_LOGIC;
  SIGNAL and_dcpl_454 : STD_LOGIC;
  SIGNAL and_tmp_89 : STD_LOGIC;
  SIGNAL mux_tmp_141 : STD_LOGIC;
  SIGNAL and_dcpl_460 : STD_LOGIC;
  SIGNAL and_dcpl_461 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL and_dcpl_463 : STD_LOGIC;
  SIGNAL not_tmp_332 : STD_LOGIC;
  SIGNAL or_tmp_368 : STD_LOGIC;
  SIGNAL and_dcpl_465 : STD_LOGIC;
  SIGNAL and_dcpl_466 : STD_LOGIC;
  SIGNAL and_dcpl_467 : STD_LOGIC;
  SIGNAL and_tmp_90 : STD_LOGIC;
  SIGNAL and_dcpl_469 : STD_LOGIC;
  SIGNAL and_dcpl_470 : STD_LOGIC;
  SIGNAL and_dcpl_471 : STD_LOGIC;
  SIGNAL and_tmp_92 : STD_LOGIC;
  SIGNAL and_dcpl_473 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL and_dcpl_475 : STD_LOGIC;
  SIGNAL and_tmp_95 : STD_LOGIC;
  SIGNAL and_dcpl_477 : STD_LOGIC;
  SIGNAL and_tmp_99 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL and_tmp_103 : STD_LOGIC;
  SIGNAL and_dcpl_483 : STD_LOGIC;
  SIGNAL mux_tmp_149 : STD_LOGIC;
  SIGNAL and_tmp_107 : STD_LOGIC;
  SIGNAL and_dcpl_486 : STD_LOGIC;
  SIGNAL mux_tmp_152 : STD_LOGIC;
  SIGNAL mux_tmp_153 : STD_LOGIC;
  SIGNAL and_tmp_111 : STD_LOGIC;
  SIGNAL and_dcpl_489 : STD_LOGIC;
  SIGNAL mux_tmp_156 : STD_LOGIC;
  SIGNAL mux_tmp_157 : STD_LOGIC;
  SIGNAL mux_tmp_158 : STD_LOGIC;
  SIGNAL and_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_492 : STD_LOGIC;
  SIGNAL and_tmp_125 : STD_LOGIC;
  SIGNAL and_dcpl_498 : STD_LOGIC;
  SIGNAL or_tmp_446 : STD_LOGIC;
  SIGNAL and_dcpl_500 : STD_LOGIC;
  SIGNAL mux_tmp_162 : STD_LOGIC;
  SIGNAL and_dcpl_502 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL and_dcpl_504 : STD_LOGIC;
  SIGNAL mux_tmp_167 : STD_LOGIC;
  SIGNAL mux_tmp_168 : STD_LOGIC;
  SIGNAL mux_tmp_169 : STD_LOGIC;
  SIGNAL and_dcpl_506 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL mux_tmp_174 : STD_LOGIC;
  SIGNAL and_dcpl_508 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL mux_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_178 : STD_LOGIC;
  SIGNAL mux_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL and_dcpl_510 : STD_LOGIC;
  SIGNAL mux_tmp_182 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_186 : STD_LOGIC;
  SIGNAL mux_tmp_187 : STD_LOGIC;
  SIGNAL and_dcpl_512 : STD_LOGIC;
  SIGNAL mux_tmp_189 : STD_LOGIC;
  SIGNAL mux_tmp_190 : STD_LOGIC;
  SIGNAL mux_tmp_191 : STD_LOGIC;
  SIGNAL mux_tmp_192 : STD_LOGIC;
  SIGNAL mux_tmp_193 : STD_LOGIC;
  SIGNAL mux_tmp_194 : STD_LOGIC;
  SIGNAL mux_tmp_195 : STD_LOGIC;
  SIGNAL and_dcpl_514 : STD_LOGIC;
  SIGNAL mux_tmp_197 : STD_LOGIC;
  SIGNAL mux_tmp_198 : STD_LOGIC;
  SIGNAL mux_tmp_199 : STD_LOGIC;
  SIGNAL mux_tmp_200 : STD_LOGIC;
  SIGNAL mux_tmp_201 : STD_LOGIC;
  SIGNAL mux_tmp_202 : STD_LOGIC;
  SIGNAL mux_tmp_203 : STD_LOGIC;
  SIGNAL mux_tmp_204 : STD_LOGIC;
  SIGNAL and_dcpl_516 : STD_LOGIC;
  SIGNAL and_tmp_134 : STD_LOGIC;
  SIGNAL mux_tmp_206 : STD_LOGIC;
  SIGNAL and_dcpl_520 : STD_LOGIC;
  SIGNAL and_dcpl_521 : STD_LOGIC;
  SIGNAL or_tmp_551 : STD_LOGIC;
  SIGNAL and_dcpl_523 : STD_LOGIC;
  SIGNAL and_dcpl_524 : STD_LOGIC;
  SIGNAL and_tmp_135 : STD_LOGIC;
  SIGNAL and_dcpl_526 : STD_LOGIC;
  SIGNAL and_dcpl_527 : STD_LOGIC;
  SIGNAL and_tmp_137 : STD_LOGIC;
  SIGNAL and_dcpl_529 : STD_LOGIC;
  SIGNAL and_dcpl_530 : STD_LOGIC;
  SIGNAL and_tmp_140 : STD_LOGIC;
  SIGNAL and_dcpl_532 : STD_LOGIC;
  SIGNAL and_tmp_144 : STD_LOGIC;
  SIGNAL and_dcpl_534 : STD_LOGIC;
  SIGNAL and_tmp_148 : STD_LOGIC;
  SIGNAL and_dcpl_536 : STD_LOGIC;
  SIGNAL mux_tmp_214 : STD_LOGIC;
  SIGNAL and_tmp_152 : STD_LOGIC;
  SIGNAL and_dcpl_538 : STD_LOGIC;
  SIGNAL mux_tmp_217 : STD_LOGIC;
  SIGNAL mux_tmp_218 : STD_LOGIC;
  SIGNAL and_tmp_156 : STD_LOGIC;
  SIGNAL and_dcpl_540 : STD_LOGIC;
  SIGNAL mux_tmp_221 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_223 : STD_LOGIC;
  SIGNAL and_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_542 : STD_LOGIC;
  SIGNAL and_tmp_170 : STD_LOGIC;
  SIGNAL and_dcpl_546 : STD_LOGIC;
  SIGNAL or_tmp_629 : STD_LOGIC;
  SIGNAL and_dcpl_548 : STD_LOGIC;
  SIGNAL mux_tmp_227 : STD_LOGIC;
  SIGNAL and_dcpl_550 : STD_LOGIC;
  SIGNAL mux_tmp_229 : STD_LOGIC;
  SIGNAL mux_tmp_230 : STD_LOGIC;
  SIGNAL and_dcpl_552 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL mux_tmp_233 : STD_LOGIC;
  SIGNAL mux_tmp_234 : STD_LOGIC;
  SIGNAL and_dcpl_554 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL mux_tmp_237 : STD_LOGIC;
  SIGNAL mux_tmp_238 : STD_LOGIC;
  SIGNAL mux_tmp_239 : STD_LOGIC;
  SIGNAL and_dcpl_556 : STD_LOGIC;
  SIGNAL mux_tmp_241 : STD_LOGIC;
  SIGNAL mux_tmp_242 : STD_LOGIC;
  SIGNAL mux_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_244 : STD_LOGIC;
  SIGNAL mux_tmp_245 : STD_LOGIC;
  SIGNAL and_dcpl_558 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL mux_tmp_248 : STD_LOGIC;
  SIGNAL mux_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_250 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL mux_tmp_252 : STD_LOGIC;
  SIGNAL and_dcpl_560 : STD_LOGIC;
  SIGNAL mux_tmp_254 : STD_LOGIC;
  SIGNAL mux_tmp_255 : STD_LOGIC;
  SIGNAL mux_tmp_256 : STD_LOGIC;
  SIGNAL mux_tmp_257 : STD_LOGIC;
  SIGNAL mux_tmp_258 : STD_LOGIC;
  SIGNAL mux_tmp_259 : STD_LOGIC;
  SIGNAL mux_tmp_260 : STD_LOGIC;
  SIGNAL and_dcpl_562 : STD_LOGIC;
  SIGNAL mux_tmp_262 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL mux_tmp_266 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL mux_tmp_268 : STD_LOGIC;
  SIGNAL mux_tmp_269 : STD_LOGIC;
  SIGNAL and_dcpl_564 : STD_LOGIC;
  SIGNAL and_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_271 : STD_LOGIC;
  SIGNAL and_dcpl_568 : STD_LOGIC;
  SIGNAL and_dcpl_569 : STD_LOGIC;
  SIGNAL and_dcpl_570 : STD_LOGIC;
  SIGNAL and_dcpl_571 : STD_LOGIC;
  SIGNAL or_tmp_733 : STD_LOGIC;
  SIGNAL and_dcpl_573 : STD_LOGIC;
  SIGNAL and_dcpl_574 : STD_LOGIC;
  SIGNAL and_dcpl_575 : STD_LOGIC;
  SIGNAL and_tmp_180 : STD_LOGIC;
  SIGNAL and_dcpl_577 : STD_LOGIC;
  SIGNAL and_dcpl_578 : STD_LOGIC;
  SIGNAL and_dcpl_579 : STD_LOGIC;
  SIGNAL and_tmp_182 : STD_LOGIC;
  SIGNAL and_dcpl_581 : STD_LOGIC;
  SIGNAL and_dcpl_582 : STD_LOGIC;
  SIGNAL and_dcpl_583 : STD_LOGIC;
  SIGNAL and_tmp_185 : STD_LOGIC;
  SIGNAL and_dcpl_585 : STD_LOGIC;
  SIGNAL and_tmp_189 : STD_LOGIC;
  SIGNAL and_dcpl_589 : STD_LOGIC;
  SIGNAL and_tmp_193 : STD_LOGIC;
  SIGNAL and_dcpl_593 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL and_tmp_197 : STD_LOGIC;
  SIGNAL and_dcpl_597 : STD_LOGIC;
  SIGNAL mux_tmp_282 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL and_tmp_201 : STD_LOGIC;
  SIGNAL and_dcpl_601 : STD_LOGIC;
  SIGNAL mux_tmp_286 : STD_LOGIC;
  SIGNAL mux_tmp_287 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL and_tmp_205 : STD_LOGIC;
  SIGNAL and_dcpl_605 : STD_LOGIC;
  SIGNAL or_tmp_808 : STD_LOGIC;
  SIGNAL mux_tmp_291 : STD_LOGIC;
  SIGNAL mux_tmp_292 : STD_LOGIC;
  SIGNAL mux_tmp_293 : STD_LOGIC;
  SIGNAL mux_tmp_294 : STD_LOGIC;
  SIGNAL mux_tmp_295 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL mux_tmp_297 : STD_LOGIC;
  SIGNAL mux_tmp_298 : STD_LOGIC;
  SIGNAL and_tmp_206 : STD_LOGIC;
  SIGNAL and_dcpl_610 : STD_LOGIC;
  SIGNAL or_tmp_820 : STD_LOGIC;
  SIGNAL and_dcpl_612 : STD_LOGIC;
  SIGNAL mux_tmp_301 : STD_LOGIC;
  SIGNAL and_dcpl_614 : STD_LOGIC;
  SIGNAL mux_tmp_303 : STD_LOGIC;
  SIGNAL mux_tmp_304 : STD_LOGIC;
  SIGNAL and_dcpl_616 : STD_LOGIC;
  SIGNAL mux_tmp_306 : STD_LOGIC;
  SIGNAL mux_tmp_307 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL and_dcpl_618 : STD_LOGIC;
  SIGNAL mux_tmp_310 : STD_LOGIC;
  SIGNAL mux_tmp_311 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL mux_tmp_313 : STD_LOGIC;
  SIGNAL and_dcpl_622 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_316 : STD_LOGIC;
  SIGNAL mux_tmp_317 : STD_LOGIC;
  SIGNAL mux_tmp_318 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL and_dcpl_625 : STD_LOGIC;
  SIGNAL mux_tmp_321 : STD_LOGIC;
  SIGNAL mux_tmp_322 : STD_LOGIC;
  SIGNAL mux_tmp_323 : STD_LOGIC;
  SIGNAL mux_tmp_324 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL and_dcpl_628 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_329 : STD_LOGIC;
  SIGNAL mux_tmp_330 : STD_LOGIC;
  SIGNAL mux_tmp_331 : STD_LOGIC;
  SIGNAL mux_tmp_332 : STD_LOGIC;
  SIGNAL mux_tmp_333 : STD_LOGIC;
  SIGNAL mux_tmp_334 : STD_LOGIC;
  SIGNAL and_dcpl_631 : STD_LOGIC;
  SIGNAL mux_tmp_336 : STD_LOGIC;
  SIGNAL mux_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL mux_tmp_339 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL mux_tmp_341 : STD_LOGIC;
  SIGNAL mux_tmp_342 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL and_dcpl_634 : STD_LOGIC;
  SIGNAL or_tmp_921 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_347 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL mux_tmp_349 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL mux_tmp_351 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_353 : STD_LOGIC;
  SIGNAL mux_tmp_354 : STD_LOGIC;
  SIGNAL and_dcpl_638 : STD_LOGIC;
  SIGNAL and_dcpl_639 : STD_LOGIC;
  SIGNAL or_tmp_934 : STD_LOGIC;
  SIGNAL and_dcpl_641 : STD_LOGIC;
  SIGNAL and_dcpl_642 : STD_LOGIC;
  SIGNAL and_tmp_207 : STD_LOGIC;
  SIGNAL and_dcpl_644 : STD_LOGIC;
  SIGNAL and_dcpl_645 : STD_LOGIC;
  SIGNAL and_tmp_209 : STD_LOGIC;
  SIGNAL and_dcpl_647 : STD_LOGIC;
  SIGNAL and_dcpl_648 : STD_LOGIC;
  SIGNAL and_tmp_212 : STD_LOGIC;
  SIGNAL and_dcpl_650 : STD_LOGIC;
  SIGNAL and_tmp_216 : STD_LOGIC;
  SIGNAL and_dcpl_653 : STD_LOGIC;
  SIGNAL and_tmp_220 : STD_LOGIC;
  SIGNAL and_dcpl_657 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL and_tmp_224 : STD_LOGIC;
  SIGNAL and_dcpl_661 : STD_LOGIC;
  SIGNAL mux_tmp_365 : STD_LOGIC;
  SIGNAL mux_tmp_366 : STD_LOGIC;
  SIGNAL and_tmp_228 : STD_LOGIC;
  SIGNAL and_dcpl_665 : STD_LOGIC;
  SIGNAL mux_tmp_369 : STD_LOGIC;
  SIGNAL mux_tmp_370 : STD_LOGIC;
  SIGNAL mux_tmp_371 : STD_LOGIC;
  SIGNAL and_tmp_232 : STD_LOGIC;
  SIGNAL and_dcpl_669 : STD_LOGIC;
  SIGNAL or_tmp_1009 : STD_LOGIC;
  SIGNAL mux_tmp_374 : STD_LOGIC;
  SIGNAL mux_tmp_375 : STD_LOGIC;
  SIGNAL mux_tmp_376 : STD_LOGIC;
  SIGNAL mux_tmp_377 : STD_LOGIC;
  SIGNAL mux_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_381 : STD_LOGIC;
  SIGNAL and_tmp_233 : STD_LOGIC;
  SIGNAL and_dcpl_673 : STD_LOGIC;
  SIGNAL or_tmp_1021 : STD_LOGIC;
  SIGNAL and_dcpl_675 : STD_LOGIC;
  SIGNAL mux_tmp_384 : STD_LOGIC;
  SIGNAL and_dcpl_677 : STD_LOGIC;
  SIGNAL mux_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL and_dcpl_679 : STD_LOGIC;
  SIGNAL mux_tmp_389 : STD_LOGIC;
  SIGNAL mux_tmp_390 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL and_dcpl_681 : STD_LOGIC;
  SIGNAL mux_tmp_393 : STD_LOGIC;
  SIGNAL mux_tmp_394 : STD_LOGIC;
  SIGNAL mux_tmp_395 : STD_LOGIC;
  SIGNAL mux_tmp_396 : STD_LOGIC;
  SIGNAL and_dcpl_684 : STD_LOGIC;
  SIGNAL mux_tmp_398 : STD_LOGIC;
  SIGNAL mux_tmp_399 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL mux_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_687 : STD_LOGIC;
  SIGNAL mux_tmp_404 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL mux_tmp_406 : STD_LOGIC;
  SIGNAL mux_tmp_407 : STD_LOGIC;
  SIGNAL mux_tmp_408 : STD_LOGIC;
  SIGNAL mux_tmp_409 : STD_LOGIC;
  SIGNAL and_dcpl_690 : STD_LOGIC;
  SIGNAL mux_tmp_411 : STD_LOGIC;
  SIGNAL mux_tmp_412 : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL mux_tmp_414 : STD_LOGIC;
  SIGNAL mux_tmp_415 : STD_LOGIC;
  SIGNAL mux_tmp_416 : STD_LOGIC;
  SIGNAL mux_tmp_417 : STD_LOGIC;
  SIGNAL and_dcpl_693 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL mux_tmp_420 : STD_LOGIC;
  SIGNAL mux_tmp_421 : STD_LOGIC;
  SIGNAL mux_tmp_422 : STD_LOGIC;
  SIGNAL mux_tmp_423 : STD_LOGIC;
  SIGNAL mux_tmp_424 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_426 : STD_LOGIC;
  SIGNAL and_dcpl_696 : STD_LOGIC;
  SIGNAL or_tmp_1122 : STD_LOGIC;
  SIGNAL mux_tmp_428 : STD_LOGIC;
  SIGNAL mux_tmp_429 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL mux_tmp_431 : STD_LOGIC;
  SIGNAL mux_tmp_432 : STD_LOGIC;
  SIGNAL mux_tmp_433 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_435 : STD_LOGIC;
  SIGNAL mux_tmp_436 : STD_LOGIC;
  SIGNAL mux_tmp_437 : STD_LOGIC;
  SIGNAL rem_12cyc_st_10_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_10_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_9_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_9_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_8_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_8_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_7_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_7_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_6_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_6_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_5_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_5_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_4_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_4_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_3_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_3_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_2_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_2_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_12_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_sva_duc : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_12cyc_st_12_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL asn_itm_12 : STD_LOGIC;
  SIGNAL main_stage_0_13 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL asn_itm_2 : STD_LOGIC;
  SIGNAL main_stage_0_5 : STD_LOGIC;
  SIGNAL asn_itm_3 : STD_LOGIC;
  SIGNAL main_stage_0_6 : STD_LOGIC;
  SIGNAL asn_itm_4 : STD_LOGIC;
  SIGNAL asn_itm_5 : STD_LOGIC;
  SIGNAL main_stage_0_8 : STD_LOGIC;
  SIGNAL asn_itm_7 : STD_LOGIC;
  SIGNAL main_stage_0_9 : STD_LOGIC;
  SIGNAL asn_itm_8 : STD_LOGIC;
  SIGNAL main_stage_0_10 : STD_LOGIC;
  SIGNAL asn_itm_9 : STD_LOGIC;
  SIGNAL main_stage_0_7 : STD_LOGIC;
  SIGNAL asn_itm_6 : STD_LOGIC;
  SIGNAL main_stage_0_11 : STD_LOGIC;
  SIGNAL asn_itm_10 : STD_LOGIC;
  SIGNAL and_1173_cse : STD_LOGIC;
  SIGNAL and_1175_cse : STD_LOGIC;
  SIGNAL and_1177_cse : STD_LOGIC;
  SIGNAL and_1179_cse : STD_LOGIC;
  SIGNAL and_1181_cse : STD_LOGIC;
  SIGNAL and_1183_cse : STD_LOGIC;
  SIGNAL and_1185_cse : STD_LOGIC;
  SIGNAL and_1187_cse : STD_LOGIC;
  SIGNAL and_1189_cse : STD_LOGIC;
  SIGNAL and_1191_cse : STD_LOGIC;
  SIGNAL and_1193_cse : STD_LOGIC;
  SIGNAL and_1195_cse : STD_LOGIC;
  SIGNAL and_1197_cse : STD_LOGIC;
  SIGNAL or_1_cse : STD_LOGIC;
  SIGNAL or_6_cse : STD_LOGIC;
  SIGNAL or_10_cse : STD_LOGIC;
  SIGNAL or_15_cse : STD_LOGIC;
  SIGNAL or_21_cse : STD_LOGIC;
  SIGNAL or_28_cse : STD_LOGIC;
  SIGNAL or_37_cse : STD_LOGIC;
  SIGNAL or_48_cse : STD_LOGIC;
  SIGNAL or_83_cse : STD_LOGIC;
  SIGNAL nand_276_cse : STD_LOGIC;
  SIGNAL or_88_cse : STD_LOGIC;
  SIGNAL nand_274_cse : STD_LOGIC;
  SIGNAL or_93_cse : STD_LOGIC;
  SIGNAL nand_271_cse : STD_LOGIC;
  SIGNAL or_100_cse : STD_LOGIC;
  SIGNAL nand_267_cse : STD_LOGIC;
  SIGNAL or_109_cse : STD_LOGIC;
  SIGNAL or_120_cse : STD_LOGIC;
  SIGNAL or_133_cse : STD_LOGIC;
  SIGNAL or_148_cse : STD_LOGIC;
  SIGNAL or_190_cse : STD_LOGIC;
  SIGNAL or_195_cse : STD_LOGIC;
  SIGNAL or_199_cse : STD_LOGIC;
  SIGNAL or_204_cse : STD_LOGIC;
  SIGNAL or_210_cse : STD_LOGIC;
  SIGNAL or_217_cse : STD_LOGIC;
  SIGNAL or_226_cse : STD_LOGIC;
  SIGNAL or_237_cse : STD_LOGIC;
  SIGNAL or_270_cse : STD_LOGIC;
  SIGNAL or_275_cse : STD_LOGIC;
  SIGNAL or_280_cse : STD_LOGIC;
  SIGNAL or_287_cse : STD_LOGIC;
  SIGNAL or_296_cse : STD_LOGIC;
  SIGNAL or_307_cse : STD_LOGIC;
  SIGNAL or_320_cse : STD_LOGIC;
  SIGNAL or_335_cse : STD_LOGIC;
  SIGNAL nand_281_cse : STD_LOGIC;
  SIGNAL or_377_cse : STD_LOGIC;
  SIGNAL or_382_cse : STD_LOGIC;
  SIGNAL or_386_cse : STD_LOGIC;
  SIGNAL or_391_cse : STD_LOGIC;
  SIGNAL or_397_cse : STD_LOGIC;
  SIGNAL nand_215_cse : STD_LOGIC;
  SIGNAL or_404_cse : STD_LOGIC;
  SIGNAL nand_212_cse : STD_LOGIC;
  SIGNAL or_413_cse : STD_LOGIC;
  SIGNAL nand_208_cse : STD_LOGIC;
  SIGNAL or_424_cse : STD_LOGIC;
  SIGNAL or_458_cse : STD_LOGIC;
  SIGNAL or_463_cse : STD_LOGIC;
  SIGNAL nand_198_cse : STD_LOGIC;
  SIGNAL or_468_cse : STD_LOGIC;
  SIGNAL or_475_cse : STD_LOGIC;
  SIGNAL nand_189_cse : STD_LOGIC;
  SIGNAL or_484_cse : STD_LOGIC;
  SIGNAL or_495_cse : STD_LOGIC;
  SIGNAL or_508_cse : STD_LOGIC;
  SIGNAL nand_203_cse : STD_LOGIC;
  SIGNAL or_523_cse : STD_LOGIC;
  SIGNAL nand_250_cse : STD_LOGIC;
  SIGNAL or_564_cse : STD_LOGIC;
  SIGNAL or_569_cse : STD_LOGIC;
  SIGNAL or_573_cse : STD_LOGIC;
  SIGNAL or_578_cse : STD_LOGIC;
  SIGNAL or_584_cse : STD_LOGIC;
  SIGNAL or_591_cse : STD_LOGIC;
  SIGNAL or_600_cse : STD_LOGIC;
  SIGNAL or_611_cse : STD_LOGIC;
  SIGNAL or_643_cse : STD_LOGIC;
  SIGNAL or_648_cse : STD_LOGIC;
  SIGNAL or_653_cse : STD_LOGIC;
  SIGNAL or_660_cse : STD_LOGIC;
  SIGNAL or_669_cse : STD_LOGIC;
  SIGNAL or_680_cse : STD_LOGIC;
  SIGNAL or_693_cse : STD_LOGIC;
  SIGNAL or_708_cse : STD_LOGIC;
  SIGNAL or_748_cse : STD_LOGIC;
  SIGNAL or_753_cse : STD_LOGIC;
  SIGNAL or_757_cse : STD_LOGIC;
  SIGNAL or_762_cse : STD_LOGIC;
  SIGNAL or_768_cse : STD_LOGIC;
  SIGNAL or_775_cse : STD_LOGIC;
  SIGNAL or_784_cse : STD_LOGIC;
  SIGNAL or_795_cse : STD_LOGIC;
  SIGNAL or_837_cse : STD_LOGIC;
  SIGNAL nand_84_cse : STD_LOGIC;
  SIGNAL or_842_cse : STD_LOGIC;
  SIGNAL or_847_cse : STD_LOGIC;
  SIGNAL nand_79_cse : STD_LOGIC;
  SIGNAL or_854_cse : STD_LOGIC;
  SIGNAL or_863_cse : STD_LOGIC;
  SIGNAL or_874_cse : STD_LOGIC;
  SIGNAL or_887_cse : STD_LOGIC;
  SIGNAL or_902_cse : STD_LOGIC;
  SIGNAL or_952_cse : STD_LOGIC;
  SIGNAL or_957_cse : STD_LOGIC;
  SIGNAL or_961_cse : STD_LOGIC;
  SIGNAL or_966_cse : STD_LOGIC;
  SIGNAL or_972_cse : STD_LOGIC;
  SIGNAL or_979_cse : STD_LOGIC;
  SIGNAL or_988_cse : STD_LOGIC;
  SIGNAL or_999_cse : STD_LOGIC;
  SIGNAL nand_57_cse : STD_LOGIC;
  SIGNAL or_1045_cse : STD_LOGIC;
  SIGNAL or_1050_cse : STD_LOGIC;
  SIGNAL or_1057_cse : STD_LOGIC;
  SIGNAL or_1066_cse : STD_LOGIC;
  SIGNAL nand_36_cse : STD_LOGIC;
  SIGNAL nand_29_cse : STD_LOGIC;
  SIGNAL nand_21_cse : STD_LOGIC;
  SIGNAL nand_222_cse : STD_LOGIC;
  SIGNAL nand_223_cse : STD_LOGIC;
  SIGNAL main_stage_0_12 : STD_LOGIC;
  SIGNAL m_buf_sva_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_11 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_12 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL asn_itm_11 : STD_LOGIC;
  SIGNAL mut_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_12cyc_st_11_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_11_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_sva_duc_mx0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_1203_cse : STD_LOGIC;
  SIGNAL and_1205_cse : STD_LOGIC;
  SIGNAL and_1207_cse : STD_LOGIC;
  SIGNAL and_1209_cse : STD_LOGIC;
  SIGNAL and_1211_cse : STD_LOGIC;
  SIGNAL and_1213_cse : STD_LOGIC;
  SIGNAL and_1215_cse : STD_LOGIC;
  SIGNAL and_1217_cse : STD_LOGIC;
  SIGNAL and_1219_cse : STD_LOGIC;
  SIGNAL and_1221_cse : STD_LOGIC;
  SIGNAL and_1223_cse : STD_LOGIC;
  SIGNAL and_1225_cse : STD_LOGIC;
  SIGNAL and_1227_cse : STD_LOGIC;
  SIGNAL and_1229_cse : STD_LOGIC;
  SIGNAL and_1231_cse : STD_LOGIC;
  SIGNAL and_1233_cse : STD_LOGIC;
  SIGNAL and_1235_cse : STD_LOGIC;
  SIGNAL and_1237_cse : STD_LOGIC;
  SIGNAL and_1239_cse : STD_LOGIC;
  SIGNAL and_1241_cse : STD_LOGIC;
  SIGNAL and_1243_cse : STD_LOGIC;
  SIGNAL and_1245_cse : STD_LOGIC;
  SIGNAL and_1247_cse : STD_LOGIC;
  SIGNAL and_1249_cse : STD_LOGIC;
  SIGNAL and_1251_cse : STD_LOGIC;
  SIGNAL and_1253_cse : STD_LOGIC;
  SIGNAL and_1255_cse : STD_LOGIC;
  SIGNAL and_1257_cse : STD_LOGIC;
  SIGNAL and_1259_cse : STD_LOGIC;
  SIGNAL and_1261_cse : STD_LOGIC;
  SIGNAL and_1263_cse : STD_LOGIC;
  SIGNAL and_1265_cse : STD_LOGIC;
  SIGNAL and_1267_cse : STD_LOGIC;
  SIGNAL and_1269_cse : STD_LOGIC;
  SIGNAL and_1271_cse : STD_LOGIC;
  SIGNAL and_1273_cse : STD_LOGIC;
  SIGNAL and_1275_cse : STD_LOGIC;
  SIGNAL and_1277_cse : STD_LOGIC;
  SIGNAL and_1279_cse : STD_LOGIC;
  SIGNAL and_1281_cse : STD_LOGIC;
  SIGNAL and_1283_cse : STD_LOGIC;
  SIGNAL and_1285_cse : STD_LOGIC;
  SIGNAL and_1287_cse : STD_LOGIC;
  SIGNAL and_1289_cse : STD_LOGIC;
  SIGNAL and_1291_cse : STD_LOGIC;
  SIGNAL and_1293_cse : STD_LOGIC;
  SIGNAL and_1295_cse : STD_LOGIC;
  SIGNAL and_1297_cse : STD_LOGIC;
  SIGNAL and_1299_cse : STD_LOGIC;
  SIGNAL and_1301_cse : STD_LOGIC;
  SIGNAL and_1303_cse : STD_LOGIC;
  SIGNAL and_1305_cse : STD_LOGIC;
  SIGNAL and_1307_cse : STD_LOGIC;
  SIGNAL and_1309_cse : STD_LOGIC;
  SIGNAL and_1311_cse : STD_LOGIC;
  SIGNAL and_1313_cse : STD_LOGIC;
  SIGNAL and_1315_cse : STD_LOGIC;
  SIGNAL and_1317_cse : STD_LOGIC;
  SIGNAL and_1319_cse : STD_LOGIC;
  SIGNAL and_1321_cse : STD_LOGIC;
  SIGNAL and_1323_cse : STD_LOGIC;
  SIGNAL and_1325_cse : STD_LOGIC;
  SIGNAL and_1327_cse : STD_LOGIC;
  SIGNAL and_1329_cse : STD_LOGIC;
  SIGNAL and_1331_cse : STD_LOGIC;
  SIGNAL and_1333_cse : STD_LOGIC;
  SIGNAL and_1335_cse : STD_LOGIC;
  SIGNAL and_1337_cse : STD_LOGIC;
  SIGNAL and_1339_cse : STD_LOGIC;
  SIGNAL and_1341_cse : STD_LOGIC;
  SIGNAL and_1343_cse : STD_LOGIC;
  SIGNAL and_1345_cse : STD_LOGIC;
  SIGNAL and_1347_cse : STD_LOGIC;
  SIGNAL and_1349_cse : STD_LOGIC;
  SIGNAL and_1351_cse : STD_LOGIC;
  SIGNAL and_1353_cse : STD_LOGIC;
  SIGNAL and_1355_cse : STD_LOGIC;
  SIGNAL and_1357_cse : STD_LOGIC;
  SIGNAL and_1359_cse : STD_LOGIC;
  SIGNAL and_1361_cse : STD_LOGIC;
  SIGNAL and_1363_cse : STD_LOGIC;
  SIGNAL and_1365_cse : STD_LOGIC;
  SIGNAL and_1367_cse : STD_LOGIC;
  SIGNAL and_1369_cse : STD_LOGIC;
  SIGNAL and_1371_cse : STD_LOGIC;
  SIGNAL and_1373_cse : STD_LOGIC;
  SIGNAL and_1375_cse : STD_LOGIC;
  SIGNAL and_1377_cse : STD_LOGIC;
  SIGNAL and_1379_cse : STD_LOGIC;
  SIGNAL and_1381_cse : STD_LOGIC;
  SIGNAL and_1383_cse : STD_LOGIC;
  SIGNAL and_1385_cse : STD_LOGIC;
  SIGNAL and_1387_cse : STD_LOGIC;
  SIGNAL and_1389_cse : STD_LOGIC;
  SIGNAL and_1391_cse : STD_LOGIC;
  SIGNAL and_1393_cse : STD_LOGIC;
  SIGNAL and_1395_cse : STD_LOGIC;
  SIGNAL and_1397_cse : STD_LOGIC;
  SIGNAL and_1399_cse : STD_LOGIC;
  SIGNAL and_1401_cse : STD_LOGIC;
  SIGNAL and_1403_cse : STD_LOGIC;
  SIGNAL and_1405_cse : STD_LOGIC;
  SIGNAL and_1407_cse : STD_LOGIC;
  SIGNAL and_1409_cse : STD_LOGIC;
  SIGNAL and_1411_cse : STD_LOGIC;
  SIGNAL and_1413_cse : STD_LOGIC;
  SIGNAL and_1415_cse : STD_LOGIC;
  SIGNAL and_1417_cse : STD_LOGIC;
  SIGNAL and_1419_cse : STD_LOGIC;
  SIGNAL and_1421_cse : STD_LOGIC;
  SIGNAL and_1423_cse : STD_LOGIC;
  SIGNAL and_1425_cse : STD_LOGIC;
  SIGNAL and_1427_cse : STD_LOGIC;
  SIGNAL and_1429_cse : STD_LOGIC;
  SIGNAL and_1431_cse : STD_LOGIC;
  SIGNAL and_1433_cse : STD_LOGIC;
  SIGNAL and_1435_cse : STD_LOGIC;
  SIGNAL and_1437_cse : STD_LOGIC;
  SIGNAL and_1439_cse : STD_LOGIC;
  SIGNAL and_1441_cse : STD_LOGIC;
  SIGNAL and_1443_cse : STD_LOGIC;
  SIGNAL and_1445_cse : STD_LOGIC;
  SIGNAL and_1447_cse : STD_LOGIC;
  SIGNAL and_1449_cse : STD_LOGIC;
  SIGNAL and_1451_cse : STD_LOGIC;
  SIGNAL and_1453_cse : STD_LOGIC;
  SIGNAL and_1455_cse : STD_LOGIC;
  SIGNAL and_1457_cse : STD_LOGIC;
  SIGNAL and_1459_cse : STD_LOGIC;
  SIGNAL and_1461_cse : STD_LOGIC;
  SIGNAL and_1463_cse : STD_LOGIC;

  SIGNAL qelse_acc_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL mux_6_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL mux_4_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL and_273_nl : STD_LOGIC;
  SIGNAL and_275_nl : STD_LOGIC;
  SIGNAL and_277_nl : STD_LOGIC;
  SIGNAL and_279_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL and_282_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL and_286_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL and_288_nl : STD_LOGIC;
  SIGNAL and_289_nl : STD_LOGIC;
  SIGNAL and_290_nl : STD_LOGIC;
  SIGNAL xor_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL nor_518_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL nor_517_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL nor_516_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL nor_515_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL mux_19_nl : STD_LOGIC;
  SIGNAL nor_512_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL nor_513_nl : STD_LOGIC;
  SIGNAL nor_509_nl : STD_LOGIC;
  SIGNAL mux_22_nl : STD_LOGIC;
  SIGNAL nor_510_nl : STD_LOGIC;
  SIGNAL mux_23_nl : STD_LOGIC;
  SIGNAL nor_511_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL nor_507_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL nor_508_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL or_61_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL mux_31_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL and_1168_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL and_1166_nl : STD_LOGIC;
  SIGNAL and_1167_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL nor_497_nl : STD_LOGIC;
  SIGNAL and_1163_nl : STD_LOGIC;
  SIGNAL and_1164_nl : STD_LOGIC;
  SIGNAL and_1165_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL nor_496_nl : STD_LOGIC;
  SIGNAL and_1159_nl : STD_LOGIC;
  SIGNAL and_1160_nl : STD_LOGIC;
  SIGNAL and_1161_nl : STD_LOGIC;
  SIGNAL and_1162_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL nor_495_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL and_1155_nl : STD_LOGIC;
  SIGNAL and_1156_nl : STD_LOGIC;
  SIGNAL and_1157_nl : STD_LOGIC;
  SIGNAL and_1158_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL nor_494_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL and_1151_nl : STD_LOGIC;
  SIGNAL and_1152_nl : STD_LOGIC;
  SIGNAL and_1153_nl : STD_LOGIC;
  SIGNAL and_1154_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL nor_492_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL nor_487_nl : STD_LOGIC;
  SIGNAL nor_488_nl : STD_LOGIC;
  SIGNAL and_1147_nl : STD_LOGIC;
  SIGNAL and_1148_nl : STD_LOGIC;
  SIGNAL and_1149_nl : STD_LOGIC;
  SIGNAL and_1150_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL or_165_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL and_1143_nl : STD_LOGIC;
  SIGNAL and_1144_nl : STD_LOGIC;
  SIGNAL and_1145_nl : STD_LOGIC;
  SIGNAL and_1146_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL nor_478_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL nor_476_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL nor_475_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL nor_474_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL nor_465_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL nor_460_nl : STD_LOGIC;
  SIGNAL and_1142_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL nor_459_nl : STD_LOGIC;
  SIGNAL and_1140_nl : STD_LOGIC;
  SIGNAL and_1141_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL nor_458_nl : STD_LOGIC;
  SIGNAL and_1137_nl : STD_LOGIC;
  SIGNAL and_1138_nl : STD_LOGIC;
  SIGNAL and_1139_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL nor_457_nl : STD_LOGIC;
  SIGNAL and_1133_nl : STD_LOGIC;
  SIGNAL and_1134_nl : STD_LOGIC;
  SIGNAL and_1135_nl : STD_LOGIC;
  SIGNAL and_1136_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL nor_456_nl : STD_LOGIC;
  SIGNAL nor_454_nl : STD_LOGIC;
  SIGNAL and_1129_nl : STD_LOGIC;
  SIGNAL and_1130_nl : STD_LOGIC;
  SIGNAL and_1131_nl : STD_LOGIC;
  SIGNAL and_1132_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL nor_455_nl : STD_LOGIC;
  SIGNAL nor_451_nl : STD_LOGIC;
  SIGNAL nor_452_nl : STD_LOGIC;
  SIGNAL and_1125_nl : STD_LOGIC;
  SIGNAL and_1126_nl : STD_LOGIC;
  SIGNAL and_1127_nl : STD_LOGIC;
  SIGNAL and_1128_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL nor_453_nl : STD_LOGIC;
  SIGNAL nor_447_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL nor_449_nl : STD_LOGIC;
  SIGNAL and_1121_nl : STD_LOGIC;
  SIGNAL and_1122_nl : STD_LOGIC;
  SIGNAL and_1123_nl : STD_LOGIC;
  SIGNAL and_1124_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nor_450_nl : STD_LOGIC;
  SIGNAL nor_442_nl : STD_LOGIC;
  SIGNAL or_352_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL and_1117_nl : STD_LOGIC;
  SIGNAL and_1118_nl : STD_LOGIC;
  SIGNAL and_1119_nl : STD_LOGIC;
  SIGNAL and_1120_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nor_446_nl : STD_LOGIC;
  SIGNAL and_1116_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL and_1172_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL and_1114_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL and_1113_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL and_1112_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL and_1111_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL and_1109_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL and_1110_nl : STD_LOGIC;
  SIGNAL and_1106_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL and_1107_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL and_1108_nl : STD_LOGIC;
  SIGNAL and_1102_nl : STD_LOGIC;
  SIGNAL and_1103_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL and_1104_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_1105_nl : STD_LOGIC;
  SIGNAL and_1097_nl : STD_LOGIC;
  SIGNAL or_437_nl : STD_LOGIC;
  SIGNAL and_1098_nl : STD_LOGIC;
  SIGNAL and_1099_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL and_1100_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL and_1101_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL and_1171_nl : STD_LOGIC;
  SIGNAL and_1094_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL and_1095_nl : STD_LOGIC;
  SIGNAL and_1091_nl : STD_LOGIC;
  SIGNAL and_1092_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL and_1093_nl : STD_LOGIC;
  SIGNAL and_1087_nl : STD_LOGIC;
  SIGNAL and_1088_nl : STD_LOGIC;
  SIGNAL and_1089_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_1090_nl : STD_LOGIC;
  SIGNAL and_1082_nl : STD_LOGIC;
  SIGNAL and_1083_nl : STD_LOGIC;
  SIGNAL and_1084_nl : STD_LOGIC;
  SIGNAL and_1085_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL and_1086_nl : STD_LOGIC;
  SIGNAL and_1076_nl : STD_LOGIC;
  SIGNAL and_1077_nl : STD_LOGIC;
  SIGNAL and_1078_nl : STD_LOGIC;
  SIGNAL and_1079_nl : STD_LOGIC;
  SIGNAL and_1080_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL and_1081_nl : STD_LOGIC;
  SIGNAL and_1069_nl : STD_LOGIC;
  SIGNAL and_1070_nl : STD_LOGIC;
  SIGNAL and_1071_nl : STD_LOGIC;
  SIGNAL and_1072_nl : STD_LOGIC;
  SIGNAL and_1073_nl : STD_LOGIC;
  SIGNAL and_1074_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL and_1075_nl : STD_LOGIC;
  SIGNAL and_1061_nl : STD_LOGIC;
  SIGNAL and_1062_nl : STD_LOGIC;
  SIGNAL and_1063_nl : STD_LOGIC;
  SIGNAL and_1064_nl : STD_LOGIC;
  SIGNAL and_1065_nl : STD_LOGIC;
  SIGNAL and_1066_nl : STD_LOGIC;
  SIGNAL and_1067_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL and_1068_nl : STD_LOGIC;
  SIGNAL and_1052_nl : STD_LOGIC;
  SIGNAL or_540_nl : STD_LOGIC;
  SIGNAL and_1053_nl : STD_LOGIC;
  SIGNAL and_1054_nl : STD_LOGIC;
  SIGNAL and_1055_nl : STD_LOGIC;
  SIGNAL and_1056_nl : STD_LOGIC;
  SIGNAL and_1057_nl : STD_LOGIC;
  SIGNAL and_1058_nl : STD_LOGIC;
  SIGNAL and_1059_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL and_1060_nl : STD_LOGIC;
  SIGNAL nor_439_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL and_1170_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_1050_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL and_1049_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL and_1048_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL and_1047_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL and_1045_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL and_1046_nl : STD_LOGIC;
  SIGNAL and_1042_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL and_1043_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL and_1044_nl : STD_LOGIC;
  SIGNAL and_1038_nl : STD_LOGIC;
  SIGNAL and_1039_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL and_1040_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL and_1041_nl : STD_LOGIC;
  SIGNAL and_1033_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL and_1034_nl : STD_LOGIC;
  SIGNAL and_1035_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL and_1036_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL and_1037_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL and_1169_nl : STD_LOGIC;
  SIGNAL and_1030_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL and_1031_nl : STD_LOGIC;
  SIGNAL and_1027_nl : STD_LOGIC;
  SIGNAL and_1028_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL and_1029_nl : STD_LOGIC;
  SIGNAL and_1023_nl : STD_LOGIC;
  SIGNAL and_1024_nl : STD_LOGIC;
  SIGNAL and_1025_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL and_1026_nl : STD_LOGIC;
  SIGNAL and_1018_nl : STD_LOGIC;
  SIGNAL and_1019_nl : STD_LOGIC;
  SIGNAL and_1020_nl : STD_LOGIC;
  SIGNAL and_1021_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL and_1022_nl : STD_LOGIC;
  SIGNAL and_1012_nl : STD_LOGIC;
  SIGNAL and_1013_nl : STD_LOGIC;
  SIGNAL and_1014_nl : STD_LOGIC;
  SIGNAL and_1015_nl : STD_LOGIC;
  SIGNAL and_1016_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL and_1017_nl : STD_LOGIC;
  SIGNAL and_1005_nl : STD_LOGIC;
  SIGNAL and_1006_nl : STD_LOGIC;
  SIGNAL and_1007_nl : STD_LOGIC;
  SIGNAL and_1008_nl : STD_LOGIC;
  SIGNAL and_1009_nl : STD_LOGIC;
  SIGNAL and_1010_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL and_1011_nl : STD_LOGIC;
  SIGNAL and_997_nl : STD_LOGIC;
  SIGNAL and_998_nl : STD_LOGIC;
  SIGNAL and_999_nl : STD_LOGIC;
  SIGNAL and_1000_nl : STD_LOGIC;
  SIGNAL and_1001_nl : STD_LOGIC;
  SIGNAL and_1002_nl : STD_LOGIC;
  SIGNAL and_1003_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL and_1004_nl : STD_LOGIC;
  SIGNAL and_988_nl : STD_LOGIC;
  SIGNAL or_725_nl : STD_LOGIC;
  SIGNAL and_989_nl : STD_LOGIC;
  SIGNAL and_990_nl : STD_LOGIC;
  SIGNAL and_991_nl : STD_LOGIC;
  SIGNAL and_992_nl : STD_LOGIC;
  SIGNAL and_993_nl : STD_LOGIC;
  SIGNAL and_994_nl : STD_LOGIC;
  SIGNAL and_995_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL and_996_nl : STD_LOGIC;
  SIGNAL and_987_nl : STD_LOGIC;
  SIGNAL or_735_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL nor_424_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL or_808_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL or_823_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL or_822_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL or_821_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL or_820_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL or_819_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL or_818_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL or_817_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL or_816_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL or_815_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL and_986_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL and_984_nl : STD_LOGIC;
  SIGNAL and_985_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL and_981_nl : STD_LOGIC;
  SIGNAL and_982_nl : STD_LOGIC;
  SIGNAL and_983_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL and_977_nl : STD_LOGIC;
  SIGNAL and_978_nl : STD_LOGIC;
  SIGNAL and_979_nl : STD_LOGIC;
  SIGNAL and_980_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL and_973_nl : STD_LOGIC;
  SIGNAL and_974_nl : STD_LOGIC;
  SIGNAL and_975_nl : STD_LOGIC;
  SIGNAL and_976_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL and_969_nl : STD_LOGIC;
  SIGNAL and_970_nl : STD_LOGIC;
  SIGNAL and_971_nl : STD_LOGIC;
  SIGNAL and_972_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL and_965_nl : STD_LOGIC;
  SIGNAL and_966_nl : STD_LOGIC;
  SIGNAL and_967_nl : STD_LOGIC;
  SIGNAL and_968_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL or_919_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL and_961_nl : STD_LOGIC;
  SIGNAL and_962_nl : STD_LOGIC;
  SIGNAL and_963_nl : STD_LOGIC;
  SIGNAL and_964_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL or_938_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL or_937_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL or_936_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL or_935_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL or_934_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL or_933_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL or_932_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL or_931_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL or_930_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL or_929_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_361_nl : STD_LOGIC;
  SIGNAL or_1012_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL nor_352_nl : STD_LOGIC;
  SIGNAL or_1027_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL or_1026_nl : STD_LOGIC;
  SIGNAL nor_354_nl : STD_LOGIC;
  SIGNAL or_1025_nl : STD_LOGIC;
  SIGNAL nor_355_nl : STD_LOGIC;
  SIGNAL or_1024_nl : STD_LOGIC;
  SIGNAL nor_356_nl : STD_LOGIC;
  SIGNAL or_1023_nl : STD_LOGIC;
  SIGNAL nor_357_nl : STD_LOGIC;
  SIGNAL or_1022_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL or_1021_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL or_1020_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL or_1019_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL nor_351_nl : STD_LOGIC;
  SIGNAL and_960_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL nor_350_nl : STD_LOGIC;
  SIGNAL and_958_nl : STD_LOGIC;
  SIGNAL and_959_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL nor_349_nl : STD_LOGIC;
  SIGNAL and_955_nl : STD_LOGIC;
  SIGNAL and_956_nl : STD_LOGIC;
  SIGNAL and_957_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL nor_348_nl : STD_LOGIC;
  SIGNAL and_951_nl : STD_LOGIC;
  SIGNAL and_952_nl : STD_LOGIC;
  SIGNAL and_953_nl : STD_LOGIC;
  SIGNAL and_954_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_347_nl : STD_LOGIC;
  SIGNAL nor_345_nl : STD_LOGIC;
  SIGNAL and_947_nl : STD_LOGIC;
  SIGNAL and_948_nl : STD_LOGIC;
  SIGNAL and_949_nl : STD_LOGIC;
  SIGNAL and_950_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL nor_346_nl : STD_LOGIC;
  SIGNAL nor_342_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL and_943_nl : STD_LOGIC;
  SIGNAL and_944_nl : STD_LOGIC;
  SIGNAL and_945_nl : STD_LOGIC;
  SIGNAL and_946_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL nor_338_nl : STD_LOGIC;
  SIGNAL nor_339_nl : STD_LOGIC;
  SIGNAL nor_340_nl : STD_LOGIC;
  SIGNAL and_939_nl : STD_LOGIC;
  SIGNAL and_940_nl : STD_LOGIC;
  SIGNAL and_941_nl : STD_LOGIC;
  SIGNAL and_942_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL nor_341_nl : STD_LOGIC;
  SIGNAL nor_333_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL nor_334_nl : STD_LOGIC;
  SIGNAL nor_335_nl : STD_LOGIC;
  SIGNAL nor_336_nl : STD_LOGIC;
  SIGNAL and_935_nl : STD_LOGIC;
  SIGNAL and_936_nl : STD_LOGIC;
  SIGNAL and_937_nl : STD_LOGIC;
  SIGNAL and_938_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_337_nl : STD_LOGIC;
  SIGNAL nor_324_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL nand_2_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL nand_3_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL nor_329_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL nor_330_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL nor_331_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL nor_332_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL and_934_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL rem_13_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_1_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_2_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_3_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_4_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_5_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_6_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_7_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_8_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_9_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_10_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_11_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_64_11_2(input_10 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(10 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_64_13_2(input_12 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(12 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

  FUNCTION MUX_v_64_2_2(input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);

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
      width => 64
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
      width => 64
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
      width => 64
      )
    PORT MAP(
      d => return_rsci_d_1,
      z => return_rsci_z
    );
  return_rsci_d_1 <= return_rsci_d;
  return_rsc_z <= return_rsci_z;

  ccs_ccore_start_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 7,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  rem_13_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_a,
      b => rem_13_cmp_b,
      z => rem_13_cmp_z_1
    );
  rem_13_cmp_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_a_63_0),65));
  rem_13_cmp_b <= '0' & rem_13_cmp_b_63_0;
  rem_13_cmp_z <= rem_13_cmp_z_1;

  rem_13_cmp_1 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_1_a,
      b => rem_13_cmp_1_b,
      z => rem_13_cmp_1_z_1
    );
  rem_13_cmp_1_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_1_a_63_0),65));
  rem_13_cmp_1_b <= '0' & rem_13_cmp_1_b_63_0;
  rem_13_cmp_1_z <= rem_13_cmp_1_z_1;

  rem_13_cmp_2 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_2_a,
      b => rem_13_cmp_2_b,
      z => rem_13_cmp_2_z_1
    );
  rem_13_cmp_2_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_2_a_63_0),65));
  rem_13_cmp_2_b <= '0' & rem_13_cmp_2_b_63_0;
  rem_13_cmp_2_z <= rem_13_cmp_2_z_1;

  rem_13_cmp_3 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_3_a,
      b => rem_13_cmp_3_b,
      z => rem_13_cmp_3_z_1
    );
  rem_13_cmp_3_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_3_a_63_0),65));
  rem_13_cmp_3_b <= '0' & rem_13_cmp_3_b_63_0;
  rem_13_cmp_3_z <= rem_13_cmp_3_z_1;

  rem_13_cmp_4 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_4_a,
      b => rem_13_cmp_4_b,
      z => rem_13_cmp_4_z_1
    );
  rem_13_cmp_4_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_4_a_63_0),65));
  rem_13_cmp_4_b <= '0' & rem_13_cmp_4_b_63_0;
  rem_13_cmp_4_z <= rem_13_cmp_4_z_1;

  rem_13_cmp_5 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_5_a,
      b => rem_13_cmp_5_b,
      z => rem_13_cmp_5_z_1
    );
  rem_13_cmp_5_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_5_a_63_0),65));
  rem_13_cmp_5_b <= '0' & rem_13_cmp_5_b_63_0;
  rem_13_cmp_5_z <= rem_13_cmp_5_z_1;

  rem_13_cmp_6 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_6_a,
      b => rem_13_cmp_6_b,
      z => rem_13_cmp_6_z_1
    );
  rem_13_cmp_6_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_6_a_63_0),65));
  rem_13_cmp_6_b <= '0' & rem_13_cmp_6_b_63_0;
  rem_13_cmp_6_z <= rem_13_cmp_6_z_1;

  rem_13_cmp_7 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_7_a,
      b => rem_13_cmp_7_b,
      z => rem_13_cmp_7_z_1
    );
  rem_13_cmp_7_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_7_a_63_0),65));
  rem_13_cmp_7_b <= '0' & rem_13_cmp_7_b_63_0;
  rem_13_cmp_7_z <= rem_13_cmp_7_z_1;

  rem_13_cmp_8 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_8_a,
      b => rem_13_cmp_8_b,
      z => rem_13_cmp_8_z_1
    );
  rem_13_cmp_8_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_8_a_63_0),65));
  rem_13_cmp_8_b <= '0' & rem_13_cmp_8_b_63_0;
  rem_13_cmp_8_z <= rem_13_cmp_8_z_1;

  rem_13_cmp_9 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_9_a,
      b => rem_13_cmp_9_b,
      z => rem_13_cmp_9_z_1
    );
  rem_13_cmp_9_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_9_a_63_0),65));
  rem_13_cmp_9_b <= '0' & rem_13_cmp_9_b_63_0;
  rem_13_cmp_9_z <= rem_13_cmp_9_z_1;

  rem_13_cmp_10 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_10_a,
      b => rem_13_cmp_10_b,
      z => rem_13_cmp_10_z_1
    );
  rem_13_cmp_10_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_10_a_63_0),65));
  rem_13_cmp_10_b <= '0' & rem_13_cmp_10_b_63_0;
  rem_13_cmp_10_z <= rem_13_cmp_10_z_1;

  rem_13_cmp_11 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_11_a,
      b => rem_13_cmp_11_b,
      z => rem_13_cmp_11_z_1
    );
  rem_13_cmp_11_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_11_a_63_0),65));
  rem_13_cmp_11_b <= '0' & rem_13_cmp_11_b_63_0;
  rem_13_cmp_11_z <= rem_13_cmp_11_z_1;

  and_1203_cse <= ccs_ccore_en AND main_stage_0_12 AND asn_itm_11;
  and_1173_cse <= ccs_ccore_en AND (and_dcpl_294 OR and_dcpl_300 OR and_dcpl_306
      OR and_dcpl_312 OR and_dcpl_318 OR and_dcpl_324 OR and_dcpl_330 OR and_dcpl_336
      OR and_dcpl_342 OR and_dcpl_348 OR and_tmp_35);
  and_1175_cse <= ccs_ccore_en AND (and_dcpl_356 OR and_dcpl_360 OR and_dcpl_364
      OR and_dcpl_368 OR and_dcpl_372 OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_382
      OR and_dcpl_385 OR and_dcpl_388 OR mux_tmp_76);
  and_1177_cse <= ccs_ccore_en AND (and_dcpl_394 OR and_dcpl_397 OR and_dcpl_400
      OR and_dcpl_403 OR and_dcpl_406 OR and_dcpl_409 OR and_dcpl_413 OR and_dcpl_417
      OR and_dcpl_421 OR and_dcpl_425 OR and_tmp_80);
  and_1179_cse <= ccs_ccore_en AND (and_dcpl_431 OR and_dcpl_433 OR and_dcpl_435
      OR and_dcpl_437 OR and_dcpl_439 OR and_dcpl_442 OR and_dcpl_445 OR and_dcpl_448
      OR and_dcpl_451 OR and_dcpl_454 OR mux_tmp_141);
  and_1181_cse <= ccs_ccore_en AND (and_dcpl_461 OR and_dcpl_465 OR and_dcpl_469
      OR and_dcpl_473 OR and_dcpl_477 OR and_dcpl_480 OR and_dcpl_483 OR and_dcpl_486
      OR and_dcpl_489 OR and_dcpl_492 OR and_tmp_125);
  and_1183_cse <= ccs_ccore_en AND (and_dcpl_498 OR and_dcpl_500 OR and_dcpl_502
      OR and_dcpl_504 OR and_dcpl_506 OR and_dcpl_508 OR and_dcpl_510 OR and_dcpl_512
      OR and_dcpl_514 OR and_dcpl_516 OR mux_tmp_206);
  and_1185_cse <= ccs_ccore_en AND (and_dcpl_520 OR and_dcpl_523 OR and_dcpl_526
      OR and_dcpl_529 OR and_dcpl_532 OR and_dcpl_534 OR and_dcpl_536 OR and_dcpl_538
      OR and_dcpl_540 OR and_dcpl_542 OR and_tmp_170);
  and_1187_cse <= ccs_ccore_en AND (and_dcpl_546 OR and_dcpl_548 OR and_dcpl_550
      OR and_dcpl_552 OR and_dcpl_554 OR and_dcpl_556 OR and_dcpl_558 OR and_dcpl_560
      OR and_dcpl_562 OR and_dcpl_564 OR mux_tmp_271);
  and_1189_cse <= ccs_ccore_en AND (and_dcpl_569 OR and_dcpl_573 OR and_dcpl_577
      OR and_dcpl_581 OR and_dcpl_585 OR and_dcpl_589 OR and_dcpl_593 OR and_dcpl_597
      OR and_dcpl_601 OR and_dcpl_605 OR and_tmp_206);
  and_1191_cse <= ccs_ccore_en AND (and_dcpl_610 OR and_dcpl_612 OR and_dcpl_614
      OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_622 OR and_dcpl_625 OR and_dcpl_628
      OR and_dcpl_631 OR and_dcpl_634 OR mux_tmp_354);
  and_1193_cse <= ccs_ccore_en AND (and_dcpl_638 OR and_dcpl_641 OR and_dcpl_644
      OR and_dcpl_647 OR and_dcpl_650 OR and_dcpl_653 OR and_dcpl_657 OR and_dcpl_661
      OR and_dcpl_665 OR and_dcpl_669 OR and_tmp_233);
  and_1195_cse <= ccs_ccore_en AND (and_dcpl_673 OR and_dcpl_675 OR and_dcpl_677
      OR and_dcpl_679 OR and_dcpl_681 OR and_dcpl_684 OR and_dcpl_687 OR and_dcpl_690
      OR and_dcpl_693 OR and_dcpl_696 OR mux_tmp_437);
  and_1205_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_2;
  and_1207_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_6;
  and_1209_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_9;
  and_1211_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_11;
  and_1213_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_2;
  and_1215_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_6;
  and_1217_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_9;
  and_1219_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_11;
  and_1221_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_1223_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (rem_12cyc_st_10_1_0(0));
  and_1225_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_23 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_1227_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_23 AND (rem_12cyc_st_10_1_0(0));
  and_1229_cse <= ccs_ccore_en AND and_dcpl_3;
  and_1231_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_29;
  and_1233_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_33;
  and_1235_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_36;
  and_1237_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_38;
  and_1239_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_29;
  and_1241_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_33;
  and_1243_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_36;
  and_1245_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_38;
  and_1247_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_45 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_1249_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_45 AND (rem_12cyc_st_9_1_0(0));
  and_1251_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_50 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_1253_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_50 AND (rem_12cyc_st_9_1_0(0));
  and_1255_cse <= ccs_ccore_en AND and_dcpl_30;
  and_1257_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_56;
  and_1259_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_60;
  and_1261_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_63;
  and_1263_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_65;
  and_1265_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_56;
  and_1267_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_60;
  and_1269_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_63;
  and_1271_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_65;
  and_1273_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_72 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_1275_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_72 AND (rem_12cyc_st_8_1_0(0));
  and_1277_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_77 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_1279_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_77 AND (rem_12cyc_st_8_1_0(0));
  and_1281_cse <= ccs_ccore_en AND and_dcpl_57;
  and_1283_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_83;
  and_1285_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_87;
  and_1287_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_90;
  and_1289_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_92;
  and_1291_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_83;
  and_1293_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_87;
  and_1295_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_90;
  and_1297_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_92;
  and_1299_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_99 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_1301_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_99 AND (rem_12cyc_st_7_1_0(0));
  and_1303_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_104 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_1305_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_104 AND (rem_12cyc_st_7_1_0(0));
  and_1307_cse <= ccs_ccore_en AND and_dcpl_84;
  and_1309_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_110;
  and_1311_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_115;
  and_1313_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_117;
  and_1315_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_119;
  and_1317_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_110;
  and_1319_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_115;
  and_1321_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_117;
  and_1323_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_119;
  and_1325_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_126 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_1327_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_129 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_1329_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_126 AND (rem_12cyc_st_6_1_0(1));
  and_1331_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_129 AND (rem_12cyc_st_6_1_0(1));
  and_1333_cse <= ccs_ccore_en AND and_dcpl_111;
  and_1335_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_137;
  and_1337_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_141;
  and_1339_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_144;
  and_1341_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_146;
  and_1343_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_137;
  and_1345_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_141;
  and_1347_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_144;
  and_1349_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_146;
  and_1351_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_153 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_1353_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_153 AND (rem_12cyc_st_5_1_0(0));
  and_1355_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_158 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_1357_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_158 AND (rem_12cyc_st_5_1_0(0));
  and_1359_cse <= ccs_ccore_en AND and_dcpl_138;
  and_1361_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_164;
  and_1363_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_168;
  and_1365_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_171;
  and_1367_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_173;
  and_1369_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_175 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_1371_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_175 AND (rem_12cyc_st_4_1_0(0));
  and_1373_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_180 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_1375_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_180 AND (rem_12cyc_st_4_1_0(0));
  and_1377_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_164;
  and_1379_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_168;
  and_1381_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_171;
  and_1383_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_173;
  and_1385_cse <= ccs_ccore_en AND and_dcpl_165;
  and_1387_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_191;
  and_1389_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_195;
  and_1391_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_198;
  and_1393_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_200;
  and_1395_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_191;
  and_1397_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_195;
  and_1399_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_198;
  and_1401_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_200;
  and_1403_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_207 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_1405_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_207 AND (rem_12cyc_st_3_1_0(0));
  and_1407_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_212 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_1409_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_212 AND (rem_12cyc_st_3_1_0(0));
  and_1411_cse <= ccs_ccore_en AND and_dcpl_192;
  and_1413_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_218;
  and_1415_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_222;
  and_1417_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_225;
  and_1419_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_227;
  and_1421_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_229 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_1423_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_229 AND (rem_12cyc_st_2_1_0(0));
  and_1425_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_234 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_1427_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_234 AND (rem_12cyc_st_2_1_0(0));
  and_1429_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_218;
  and_1431_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_222;
  and_1433_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_225;
  and_1435_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_227;
  and_1437_cse <= ccs_ccore_en AND and_dcpl_219;
  and_1439_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_245;
  and_1441_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_249;
  and_1443_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_252;
  and_1445_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_254;
  and_1447_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_245;
  and_1449_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_249;
  and_1451_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_252;
  and_1453_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_254;
  and_1455_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_261 AND (NOT (rem_12cyc_1_0(0)));
  and_1457_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_261 AND (rem_12cyc_1_0(0));
  and_1459_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_266 AND (NOT (rem_12cyc_1_0(0)));
  and_1461_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_266 AND (rem_12cyc_1_0(0));
  and_1463_cse <= ccs_ccore_en AND and_dcpl_246;
  and_1197_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  and_273_nl <= and_dcpl_272 AND and_dcpl_271;
  and_275_nl <= and_dcpl_272 AND and_dcpl_274;
  and_277_nl <= and_dcpl_272 AND and_dcpl_276;
  and_279_nl <= and_dcpl_272 AND and_dcpl_278;
  and_281_nl <= and_dcpl_280 AND and_dcpl_271;
  and_282_nl <= and_dcpl_280 AND and_dcpl_274;
  and_283_nl <= and_dcpl_280 AND and_dcpl_276;
  and_284_nl <= and_dcpl_280 AND and_dcpl_278;
  and_286_nl <= and_dcpl_285 AND and_dcpl_271;
  and_287_nl <= and_dcpl_285 AND and_dcpl_274;
  and_288_nl <= and_dcpl_285 AND and_dcpl_276;
  and_289_nl <= and_dcpl_285 AND and_dcpl_278;
  and_290_nl <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("11"));
  result_sva_duc_mx0 <= MUX1HOT_v_64_13_2((rem_13_cmp_1_z(63 DOWNTO 0)), (rem_13_cmp_2_z(63
      DOWNTO 0)), (rem_13_cmp_3_z(63 DOWNTO 0)), (rem_13_cmp_4_z(63 DOWNTO 0)), (rem_13_cmp_5_z(63
      DOWNTO 0)), (rem_13_cmp_6_z(63 DOWNTO 0)), (rem_13_cmp_7_z(63 DOWNTO 0)), (rem_13_cmp_8_z(63
      DOWNTO 0)), (rem_13_cmp_9_z(63 DOWNTO 0)), (rem_13_cmp_10_z(63 DOWNTO 0)),
      (rem_13_cmp_11_z(63 DOWNTO 0)), (rem_13_cmp_z(63 DOWNTO 0)), result_sva_duc,
      STD_LOGIC_VECTOR'( and_273_nl & and_275_nl & and_277_nl & and_279_nl & and_281_nl
      & and_282_nl & and_283_nl & and_284_nl & and_286_nl & and_287_nl & and_288_nl
      & and_289_nl & and_290_nl));
  acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(rem_12cyc_3_2 & rem_12cyc_1_0)
      + UNSIGNED'( "0001"), 4));
  xor_nl <= (acc_1_tmp(2)) XOR (acc_1_tmp(3));
  nor_nl <= NOT(CONV_SL_1_1(acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")));
  acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(xor_nl, 1),
      2) + CONV_UNSIGNED(CONV_UNSIGNED(nor_nl, 1), 2), 2));
  and_dcpl_1 <= NOT((rem_12cyc_st_10_3_2(1)) OR (rem_12cyc_st_10_1_0(1)));
  and_dcpl_2 <= and_dcpl_1 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_dcpl_3 <= main_stage_0_11 AND asn_itm_10;
  and_dcpl_4 <= and_dcpl_3 AND (NOT (rem_12cyc_st_10_3_2(0)));
  and_dcpl_6 <= and_dcpl_1 AND (rem_12cyc_st_10_1_0(0));
  and_dcpl_8 <= (NOT (rem_12cyc_st_10_3_2(1))) AND (rem_12cyc_st_10_1_0(1));
  and_dcpl_9 <= and_dcpl_8 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_dcpl_11 <= and_dcpl_8 AND (rem_12cyc_st_10_1_0(0));
  and_dcpl_13 <= and_dcpl_3 AND (rem_12cyc_st_10_3_2(0));
  and_dcpl_18 <= (rem_12cyc_st_10_3_2(1)) AND (NOT (rem_12cyc_st_10_1_0(1)));
  and_dcpl_23 <= (rem_12cyc_st_10_3_2(1)) AND (rem_12cyc_st_10_1_0(1));
  and_dcpl_28 <= NOT((rem_12cyc_st_9_3_2(1)) OR (rem_12cyc_st_9_1_0(1)));
  and_dcpl_29 <= and_dcpl_28 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_dcpl_30 <= main_stage_0_10 AND asn_itm_9;
  and_dcpl_31 <= and_dcpl_30 AND (NOT (rem_12cyc_st_9_3_2(0)));
  and_dcpl_33 <= and_dcpl_28 AND (rem_12cyc_st_9_1_0(0));
  and_dcpl_35 <= (NOT (rem_12cyc_st_9_3_2(1))) AND (rem_12cyc_st_9_1_0(1));
  and_dcpl_36 <= and_dcpl_35 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_dcpl_38 <= and_dcpl_35 AND (rem_12cyc_st_9_1_0(0));
  and_dcpl_40 <= and_dcpl_30 AND (rem_12cyc_st_9_3_2(0));
  and_dcpl_45 <= (rem_12cyc_st_9_3_2(1)) AND (NOT (rem_12cyc_st_9_1_0(1)));
  and_dcpl_50 <= (rem_12cyc_st_9_3_2(1)) AND (rem_12cyc_st_9_1_0(1));
  and_dcpl_55 <= NOT((rem_12cyc_st_8_3_2(1)) OR (rem_12cyc_st_8_1_0(1)));
  and_dcpl_56 <= and_dcpl_55 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_dcpl_57 <= main_stage_0_9 AND asn_itm_8;
  and_dcpl_58 <= and_dcpl_57 AND (NOT (rem_12cyc_st_8_3_2(0)));
  and_dcpl_60 <= and_dcpl_55 AND (rem_12cyc_st_8_1_0(0));
  and_dcpl_62 <= (NOT (rem_12cyc_st_8_3_2(1))) AND (rem_12cyc_st_8_1_0(1));
  and_dcpl_63 <= and_dcpl_62 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_dcpl_65 <= and_dcpl_62 AND (rem_12cyc_st_8_1_0(0));
  and_dcpl_67 <= and_dcpl_57 AND (rem_12cyc_st_8_3_2(0));
  and_dcpl_72 <= (rem_12cyc_st_8_3_2(1)) AND (NOT (rem_12cyc_st_8_1_0(1)));
  and_dcpl_77 <= (rem_12cyc_st_8_3_2(1)) AND (rem_12cyc_st_8_1_0(1));
  and_dcpl_82 <= NOT((rem_12cyc_st_7_3_2(1)) OR (rem_12cyc_st_7_1_0(1)));
  and_dcpl_83 <= and_dcpl_82 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_dcpl_84 <= main_stage_0_8 AND asn_itm_7;
  and_dcpl_85 <= and_dcpl_84 AND (NOT (rem_12cyc_st_7_3_2(0)));
  and_dcpl_87 <= and_dcpl_82 AND (rem_12cyc_st_7_1_0(0));
  and_dcpl_89 <= (NOT (rem_12cyc_st_7_3_2(1))) AND (rem_12cyc_st_7_1_0(1));
  and_dcpl_90 <= and_dcpl_89 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_dcpl_92 <= and_dcpl_89 AND (rem_12cyc_st_7_1_0(0));
  and_dcpl_94 <= and_dcpl_84 AND (rem_12cyc_st_7_3_2(0));
  and_dcpl_99 <= (rem_12cyc_st_7_3_2(1)) AND (NOT (rem_12cyc_st_7_1_0(1)));
  and_dcpl_104 <= (rem_12cyc_st_7_3_2(1)) AND (rem_12cyc_st_7_1_0(1));
  and_dcpl_109 <= NOT((rem_12cyc_st_6_3_2(1)) OR (rem_12cyc_st_6_1_0(0)));
  and_dcpl_110 <= and_dcpl_109 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_dcpl_111 <= main_stage_0_7 AND asn_itm_6;
  and_dcpl_112 <= and_dcpl_111 AND (NOT (rem_12cyc_st_6_3_2(0)));
  and_dcpl_114 <= (NOT (rem_12cyc_st_6_3_2(1))) AND (rem_12cyc_st_6_1_0(0));
  and_dcpl_115 <= and_dcpl_114 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_dcpl_117 <= and_dcpl_109 AND (rem_12cyc_st_6_1_0(1));
  and_dcpl_119 <= and_dcpl_114 AND (rem_12cyc_st_6_1_0(1));
  and_dcpl_121 <= and_dcpl_111 AND (rem_12cyc_st_6_3_2(0));
  and_dcpl_126 <= (rem_12cyc_st_6_3_2(1)) AND (NOT (rem_12cyc_st_6_1_0(0)));
  and_dcpl_129 <= (rem_12cyc_st_6_3_2(1)) AND (rem_12cyc_st_6_1_0(0));
  and_dcpl_136 <= NOT((rem_12cyc_st_5_3_2(1)) OR (rem_12cyc_st_5_1_0(1)));
  and_dcpl_137 <= and_dcpl_136 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_dcpl_138 <= main_stage_0_6 AND asn_itm_5;
  and_dcpl_139 <= and_dcpl_138 AND (NOT (rem_12cyc_st_5_3_2(0)));
  and_dcpl_141 <= and_dcpl_136 AND (rem_12cyc_st_5_1_0(0));
  and_dcpl_143 <= (NOT (rem_12cyc_st_5_3_2(1))) AND (rem_12cyc_st_5_1_0(1));
  and_dcpl_144 <= and_dcpl_143 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_dcpl_146 <= and_dcpl_143 AND (rem_12cyc_st_5_1_0(0));
  and_dcpl_148 <= and_dcpl_138 AND (rem_12cyc_st_5_3_2(0));
  and_dcpl_153 <= (rem_12cyc_st_5_3_2(1)) AND (NOT (rem_12cyc_st_5_1_0(1)));
  and_dcpl_158 <= (rem_12cyc_st_5_3_2(1)) AND (rem_12cyc_st_5_1_0(1));
  and_dcpl_163 <= NOT((rem_12cyc_st_4_3_2(0)) OR (rem_12cyc_st_4_1_0(1)));
  and_dcpl_164 <= and_dcpl_163 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_dcpl_165 <= main_stage_0_5 AND asn_itm_4;
  and_dcpl_166 <= and_dcpl_165 AND (NOT (rem_12cyc_st_4_3_2(1)));
  and_dcpl_168 <= and_dcpl_163 AND (rem_12cyc_st_4_1_0(0));
  and_dcpl_170 <= (NOT (rem_12cyc_st_4_3_2(0))) AND (rem_12cyc_st_4_1_0(1));
  and_dcpl_171 <= and_dcpl_170 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_dcpl_173 <= and_dcpl_170 AND (rem_12cyc_st_4_1_0(0));
  and_dcpl_175 <= (rem_12cyc_st_4_3_2(0)) AND (NOT (rem_12cyc_st_4_1_0(1)));
  and_dcpl_180 <= (rem_12cyc_st_4_3_2(0)) AND (rem_12cyc_st_4_1_0(1));
  and_dcpl_185 <= and_dcpl_165 AND (rem_12cyc_st_4_3_2(1));
  and_dcpl_190 <= NOT((rem_12cyc_st_3_3_2(1)) OR (rem_12cyc_st_3_1_0(1)));
  and_dcpl_191 <= and_dcpl_190 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_dcpl_192 <= main_stage_0_4 AND asn_itm_3;
  and_dcpl_193 <= and_dcpl_192 AND (NOT (rem_12cyc_st_3_3_2(0)));
  and_dcpl_195 <= and_dcpl_190 AND (rem_12cyc_st_3_1_0(0));
  and_dcpl_197 <= (NOT (rem_12cyc_st_3_3_2(1))) AND (rem_12cyc_st_3_1_0(1));
  and_dcpl_198 <= and_dcpl_197 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_dcpl_200 <= and_dcpl_197 AND (rem_12cyc_st_3_1_0(0));
  and_dcpl_202 <= and_dcpl_192 AND (rem_12cyc_st_3_3_2(0));
  and_dcpl_207 <= (rem_12cyc_st_3_3_2(1)) AND (NOT (rem_12cyc_st_3_1_0(1)));
  and_dcpl_212 <= (rem_12cyc_st_3_3_2(1)) AND (rem_12cyc_st_3_1_0(1));
  and_dcpl_217 <= NOT((rem_12cyc_st_2_3_2(0)) OR (rem_12cyc_st_2_1_0(1)));
  and_dcpl_218 <= and_dcpl_217 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_dcpl_219 <= main_stage_0_3 AND asn_itm_2;
  and_dcpl_220 <= and_dcpl_219 AND (NOT (rem_12cyc_st_2_3_2(1)));
  and_dcpl_222 <= and_dcpl_217 AND (rem_12cyc_st_2_1_0(0));
  and_dcpl_224 <= (NOT (rem_12cyc_st_2_3_2(0))) AND (rem_12cyc_st_2_1_0(1));
  and_dcpl_225 <= and_dcpl_224 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_dcpl_227 <= and_dcpl_224 AND (rem_12cyc_st_2_1_0(0));
  and_dcpl_229 <= (rem_12cyc_st_2_3_2(0)) AND (NOT (rem_12cyc_st_2_1_0(1)));
  and_dcpl_234 <= (rem_12cyc_st_2_3_2(0)) AND (rem_12cyc_st_2_1_0(1));
  and_dcpl_239 <= and_dcpl_219 AND (rem_12cyc_st_2_3_2(1));
  and_dcpl_244 <= NOT((rem_12cyc_3_2(1)) OR (rem_12cyc_1_0(1)));
  and_dcpl_245 <= and_dcpl_244 AND (NOT (rem_12cyc_1_0(0)));
  and_dcpl_246 <= main_stage_0_2 AND asn_itm_1;
  and_dcpl_247 <= and_dcpl_246 AND (NOT (rem_12cyc_3_2(0)));
  and_dcpl_249 <= and_dcpl_244 AND (rem_12cyc_1_0(0));
  and_dcpl_251 <= (NOT (rem_12cyc_3_2(1))) AND (rem_12cyc_1_0(1));
  and_dcpl_252 <= and_dcpl_251 AND (NOT (rem_12cyc_1_0(0)));
  and_dcpl_254 <= and_dcpl_251 AND (rem_12cyc_1_0(0));
  and_dcpl_256 <= and_dcpl_246 AND (rem_12cyc_3_2(0));
  and_dcpl_261 <= (rem_12cyc_3_2(1)) AND (NOT (rem_12cyc_1_0(1)));
  and_dcpl_266 <= (rem_12cyc_3_2(1)) AND (rem_12cyc_1_0(1));
  and_dcpl_271 <= NOT(CONV_SL_1_1(rem_12cyc_st_12_1_0/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_272 <= NOT(CONV_SL_1_1(rem_12cyc_st_12_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_274 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("01"));
  and_dcpl_276 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("10"));
  and_dcpl_278 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("11"));
  and_dcpl_280 <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_285 <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_291 <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_292 <= ccs_ccore_start_rsci_idat AND (NOT (acc_tmp(0)));
  and_dcpl_293 <= and_dcpl_292 AND (NOT (acc_tmp(1)));
  and_dcpl_294 <= and_dcpl_293 AND and_dcpl_291;
  and_dcpl_295 <= NOT(CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_296 <= and_dcpl_295 AND (NOT (rem_12cyc_st_2_1_0(1)));
  and_dcpl_298 <= (NOT (rem_12cyc_st_2_1_0(0))) AND main_stage_0_3 AND asn_itm_2;
  not_tmp_54 <= NOT(asn_itm_1 AND main_stage_0_2);
  or_tmp_2 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_1_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_518_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_2));
  mux_14_nl <= MUX_s_1_2_2(nor_518_nl, or_tmp_2, or_1_cse);
  and_dcpl_300 <= mux_14_nl AND and_dcpl_298 AND and_dcpl_296;
  and_dcpl_301 <= NOT(CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_302 <= and_dcpl_301 AND (NOT (rem_12cyc_st_3_1_0(1)));
  and_dcpl_304 <= (NOT (rem_12cyc_st_3_1_0(0))) AND main_stage_0_4 AND asn_itm_3;
  or_6_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp <= or_6_cse AND or_tmp_2;
  nor_517_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp));
  mux_15_nl <= MUX_s_1_2_2(nor_517_nl, and_tmp, or_1_cse);
  and_dcpl_306 <= mux_15_nl AND and_dcpl_304 AND and_dcpl_302;
  and_dcpl_307 <= NOT(CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_308 <= and_dcpl_307 AND (NOT (rem_12cyc_st_4_1_0(1)));
  and_dcpl_310 <= (NOT (rem_12cyc_st_4_1_0(0))) AND main_stage_0_5 AND asn_itm_4;
  or_10_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_2 <= or_6_cse AND or_10_cse AND or_tmp_2;
  nor_516_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_2));
  mux_16_nl <= MUX_s_1_2_2(nor_516_nl, and_tmp_2, or_1_cse);
  and_dcpl_312 <= mux_16_nl AND and_dcpl_310 AND and_dcpl_308;
  and_dcpl_313 <= NOT(CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_314 <= and_dcpl_313 AND (NOT (rem_12cyc_st_5_1_0(1)));
  and_dcpl_316 <= (NOT (rem_12cyc_st_5_1_0(0))) AND main_stage_0_6 AND asn_itm_5;
  or_15_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_5 <= or_6_cse AND or_10_cse AND or_15_cse AND or_tmp_2;
  nor_515_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_5));
  mux_17_nl <= MUX_s_1_2_2(nor_515_nl, and_tmp_5, or_1_cse);
  and_dcpl_318 <= mux_17_nl AND and_dcpl_316 AND and_dcpl_314;
  or_21_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_9 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND or_tmp_2;
  nor_514_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_9));
  mux_18_nl <= MUX_s_1_2_2(nor_514_nl, and_tmp_9, or_1_cse);
  and_dcpl_324 <= mux_18_nl AND and_dcpl_112 AND and_dcpl_110;
  or_28_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_512_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_2));
  mux_19_nl <= MUX_s_1_2_2(nor_512_nl, or_tmp_2, or_28_cse);
  and_tmp_13 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_19_nl;
  nor_513_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_13));
  mux_20_nl <= MUX_s_1_2_2(nor_513_nl, and_tmp_13, or_1_cse);
  and_dcpl_330 <= mux_20_nl AND and_dcpl_85 AND and_dcpl_83;
  or_37_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_509_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_2));
  mux_tmp_19 <= MUX_s_1_2_2(nor_509_nl, or_tmp_2, or_37_cse);
  nor_510_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_19));
  mux_22_nl <= MUX_s_1_2_2(nor_510_nl, mux_tmp_19, or_28_cse);
  and_tmp_17 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_22_nl;
  nor_511_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_17));
  mux_23_nl <= MUX_s_1_2_2(nor_511_nl, and_tmp_17, or_1_cse);
  and_dcpl_336 <= mux_23_nl AND and_dcpl_58 AND and_dcpl_56;
  or_48_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_505_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_2));
  mux_tmp_22 <= MUX_s_1_2_2(nor_505_nl, or_tmp_2, or_48_cse);
  nor_506_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_22));
  mux_tmp_23 <= MUX_s_1_2_2(nor_506_nl, mux_tmp_22, or_37_cse);
  nor_507_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_23));
  mux_26_nl <= MUX_s_1_2_2(nor_507_nl, mux_tmp_23, or_28_cse);
  and_tmp_21 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_26_nl;
  nor_508_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_21));
  mux_27_nl <= MUX_s_1_2_2(nor_508_nl, and_tmp_21, or_1_cse);
  and_dcpl_342 <= mux_27_nl AND and_dcpl_31 AND and_dcpl_29;
  nor_500_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_2));
  or_61_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_26 <= MUX_s_1_2_2(nor_500_nl, or_tmp_2, or_61_nl);
  nor_501_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_26));
  mux_tmp_27 <= MUX_s_1_2_2(nor_501_nl, mux_tmp_26, or_48_cse);
  nor_502_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_27));
  mux_tmp_28 <= MUX_s_1_2_2(nor_502_nl, mux_tmp_27, or_37_cse);
  nor_503_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_28));
  mux_31_nl <= MUX_s_1_2_2(nor_503_nl, mux_tmp_28, or_28_cse);
  and_tmp_25 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_31_nl;
  nor_504_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_25));
  mux_32_nl <= MUX_s_1_2_2(nor_504_nl, and_tmp_25, or_1_cse);
  and_dcpl_348 <= mux_32_nl AND and_dcpl_4 AND and_dcpl_2;
  and_tmp_35 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND or_6_cse AND
      or_10_cse AND or_15_cse AND or_21_cse AND ((NOT main_stage_0_7) OR (NOT asn_itm_6)
      OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_355 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_356 <= and_dcpl_293 AND and_dcpl_355;
  and_dcpl_358 <= (rem_12cyc_st_2_1_0(0)) AND main_stage_0_3 AND asn_itm_2;
  or_tmp_80 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_83_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_499_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_80));
  mux_33_nl <= MUX_s_1_2_2(nor_499_nl, or_tmp_80, or_83_cse);
  and_dcpl_360 <= mux_33_nl AND and_dcpl_358 AND and_dcpl_296;
  and_dcpl_362 <= (rem_12cyc_st_3_1_0(0)) AND main_stage_0_4 AND asn_itm_3;
  nand_276_cse <= NOT(asn_itm_2 AND main_stage_0_3 AND (rem_12cyc_st_2_1_0(0)));
  or_88_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1168_nl <= nand_276_cse AND or_tmp_80;
  mux_tmp_32 <= MUX_s_1_2_2(and_1168_nl, or_tmp_80, or_88_cse);
  nor_498_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_32));
  mux_35_nl <= MUX_s_1_2_2(nor_498_nl, mux_tmp_32, or_83_cse);
  and_dcpl_364 <= mux_35_nl AND and_dcpl_362 AND and_dcpl_302;
  and_dcpl_366 <= (rem_12cyc_st_4_1_0(0)) AND main_stage_0_5 AND asn_itm_4;
  nand_274_cse <= NOT(asn_itm_3 AND main_stage_0_4 AND (rem_12cyc_st_3_1_0(0)));
  or_93_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1166_nl <= nand_274_cse AND or_tmp_80;
  mux_tmp_34 <= MUX_s_1_2_2(and_1166_nl, or_tmp_80, or_93_cse);
  and_1167_nl <= nand_276_cse AND mux_tmp_34;
  mux_tmp_35 <= MUX_s_1_2_2(and_1167_nl, mux_tmp_34, or_88_cse);
  nor_497_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_35));
  mux_38_nl <= MUX_s_1_2_2(nor_497_nl, mux_tmp_35, or_83_cse);
  and_dcpl_368 <= mux_38_nl AND and_dcpl_366 AND and_dcpl_308;
  and_dcpl_370 <= (rem_12cyc_st_5_1_0(0)) AND main_stage_0_6 AND asn_itm_5;
  nand_271_cse <= NOT(asn_itm_4 AND main_stage_0_5 AND (rem_12cyc_st_4_1_0(0)));
  or_100_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1163_nl <= nand_271_cse AND or_tmp_80;
  mux_tmp_37 <= MUX_s_1_2_2(and_1163_nl, or_tmp_80, or_100_cse);
  and_1164_nl <= nand_274_cse AND mux_tmp_37;
  mux_tmp_38 <= MUX_s_1_2_2(and_1164_nl, mux_tmp_37, or_93_cse);
  and_1165_nl <= nand_276_cse AND mux_tmp_38;
  mux_tmp_39 <= MUX_s_1_2_2(and_1165_nl, mux_tmp_38, or_88_cse);
  nor_496_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_39));
  mux_42_nl <= MUX_s_1_2_2(nor_496_nl, mux_tmp_39, or_83_cse);
  and_dcpl_372 <= mux_42_nl AND and_dcpl_370 AND and_dcpl_314;
  nand_267_cse <= NOT(asn_itm_5 AND main_stage_0_6 AND (rem_12cyc_st_5_1_0(0)));
  or_109_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1159_nl <= nand_267_cse AND or_tmp_80;
  mux_tmp_41 <= MUX_s_1_2_2(and_1159_nl, or_tmp_80, or_109_cse);
  and_1160_nl <= nand_271_cse AND mux_tmp_41;
  mux_tmp_42 <= MUX_s_1_2_2(and_1160_nl, mux_tmp_41, or_100_cse);
  and_1161_nl <= nand_274_cse AND mux_tmp_42;
  mux_tmp_43 <= MUX_s_1_2_2(and_1161_nl, mux_tmp_42, or_93_cse);
  and_1162_nl <= nand_276_cse AND mux_tmp_43;
  mux_tmp_44 <= MUX_s_1_2_2(and_1162_nl, mux_tmp_43, or_88_cse);
  nor_495_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_44));
  mux_47_nl <= MUX_s_1_2_2(nor_495_nl, mux_tmp_44, or_83_cse);
  and_dcpl_376 <= mux_47_nl AND and_dcpl_112 AND and_dcpl_115;
  or_120_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_493_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_80));
  mux_tmp_46 <= MUX_s_1_2_2(nor_493_nl, or_tmp_80, or_120_cse);
  and_1155_nl <= nand_267_cse AND mux_tmp_46;
  mux_tmp_47 <= MUX_s_1_2_2(and_1155_nl, mux_tmp_46, or_109_cse);
  and_1156_nl <= nand_271_cse AND mux_tmp_47;
  mux_tmp_48 <= MUX_s_1_2_2(and_1156_nl, mux_tmp_47, or_100_cse);
  and_1157_nl <= nand_274_cse AND mux_tmp_48;
  mux_tmp_49 <= MUX_s_1_2_2(and_1157_nl, mux_tmp_48, or_93_cse);
  and_1158_nl <= nand_276_cse AND mux_tmp_49;
  mux_tmp_50 <= MUX_s_1_2_2(and_1158_nl, mux_tmp_49, or_88_cse);
  nor_494_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_50));
  mux_53_nl <= MUX_s_1_2_2(nor_494_nl, mux_tmp_50, or_83_cse);
  and_dcpl_379 <= mux_53_nl AND and_dcpl_85 AND and_dcpl_87;
  or_133_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_490_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_80));
  mux_tmp_52 <= MUX_s_1_2_2(nor_490_nl, or_tmp_80, or_133_cse);
  nor_491_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_52));
  mux_tmp_53 <= MUX_s_1_2_2(nor_491_nl, mux_tmp_52, or_120_cse);
  and_1151_nl <= nand_267_cse AND mux_tmp_53;
  mux_tmp_54 <= MUX_s_1_2_2(and_1151_nl, mux_tmp_53, or_109_cse);
  and_1152_nl <= nand_271_cse AND mux_tmp_54;
  mux_tmp_55 <= MUX_s_1_2_2(and_1152_nl, mux_tmp_54, or_100_cse);
  and_1153_nl <= nand_274_cse AND mux_tmp_55;
  mux_tmp_56 <= MUX_s_1_2_2(and_1153_nl, mux_tmp_55, or_93_cse);
  and_1154_nl <= nand_276_cse AND mux_tmp_56;
  mux_tmp_57 <= MUX_s_1_2_2(and_1154_nl, mux_tmp_56, or_88_cse);
  nor_492_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_57));
  mux_60_nl <= MUX_s_1_2_2(nor_492_nl, mux_tmp_57, or_83_cse);
  and_dcpl_382 <= mux_60_nl AND and_dcpl_58 AND and_dcpl_60;
  or_148_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_486_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_80));
  mux_tmp_59 <= MUX_s_1_2_2(nor_486_nl, or_tmp_80, or_148_cse);
  nor_487_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_59));
  mux_tmp_60 <= MUX_s_1_2_2(nor_487_nl, mux_tmp_59, or_133_cse);
  nor_488_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_60));
  mux_tmp_61 <= MUX_s_1_2_2(nor_488_nl, mux_tmp_60, or_120_cse);
  and_1147_nl <= nand_267_cse AND mux_tmp_61;
  mux_tmp_62 <= MUX_s_1_2_2(and_1147_nl, mux_tmp_61, or_109_cse);
  and_1148_nl <= nand_271_cse AND mux_tmp_62;
  mux_tmp_63 <= MUX_s_1_2_2(and_1148_nl, mux_tmp_62, or_100_cse);
  and_1149_nl <= nand_274_cse AND mux_tmp_63;
  mux_tmp_64 <= MUX_s_1_2_2(and_1149_nl, mux_tmp_63, or_93_cse);
  and_1150_nl <= nand_276_cse AND mux_tmp_64;
  mux_tmp_65 <= MUX_s_1_2_2(and_1150_nl, mux_tmp_64, or_88_cse);
  nor_489_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_65));
  mux_68_nl <= MUX_s_1_2_2(nor_489_nl, mux_tmp_65, or_83_cse);
  and_dcpl_385 <= mux_68_nl AND and_dcpl_31 AND and_dcpl_33;
  nor_481_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_80));
  or_165_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_67 <= MUX_s_1_2_2(nor_481_nl, or_tmp_80, or_165_nl);
  nor_482_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_67));
  mux_tmp_68 <= MUX_s_1_2_2(nor_482_nl, mux_tmp_67, or_148_cse);
  nor_483_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_68));
  mux_tmp_69 <= MUX_s_1_2_2(nor_483_nl, mux_tmp_68, or_133_cse);
  nor_484_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_69));
  mux_tmp_70 <= MUX_s_1_2_2(nor_484_nl, mux_tmp_69, or_120_cse);
  and_1143_nl <= nand_267_cse AND mux_tmp_70;
  mux_tmp_71 <= MUX_s_1_2_2(and_1143_nl, mux_tmp_70, or_109_cse);
  and_1144_nl <= nand_271_cse AND mux_tmp_71;
  mux_tmp_72 <= MUX_s_1_2_2(and_1144_nl, mux_tmp_71, or_100_cse);
  and_1145_nl <= nand_274_cse AND mux_tmp_72;
  mux_tmp_73 <= MUX_s_1_2_2(and_1145_nl, mux_tmp_72, or_93_cse);
  and_1146_nl <= nand_276_cse AND mux_tmp_73;
  mux_tmp_74 <= MUX_s_1_2_2(and_1146_nl, mux_tmp_73, or_88_cse);
  nor_485_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_74));
  mux_77_nl <= MUX_s_1_2_2(nor_485_nl, mux_tmp_74, or_83_cse);
  and_dcpl_388 <= mux_77_nl AND and_dcpl_4 AND and_dcpl_6;
  nand_250_cse <= NOT((acc_1_tmp(0)) AND ccs_ccore_start_rsci_idat);
  and_tmp_44 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR (acc_1_tmp(1)) OR nand_250_cse);
  nor_480_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT and_tmp_44));
  or_175_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_76 <= MUX_s_1_2_2(nor_480_nl, and_tmp_44, or_175_nl);
  and_dcpl_393 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_394 <= and_dcpl_293 AND and_dcpl_393;
  and_dcpl_395 <= and_dcpl_295 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_185 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_190_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_479_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_185));
  mux_79_nl <= MUX_s_1_2_2(nor_479_nl, or_tmp_185, or_190_cse);
  and_dcpl_397 <= mux_79_nl AND and_dcpl_298 AND and_dcpl_395;
  and_dcpl_398 <= and_dcpl_301 AND (rem_12cyc_st_3_1_0(1));
  or_195_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_45 <= or_195_cse AND or_tmp_185;
  nor_478_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_45));
  mux_80_nl <= MUX_s_1_2_2(nor_478_nl, and_tmp_45, or_190_cse);
  and_dcpl_400 <= mux_80_nl AND and_dcpl_304 AND and_dcpl_398;
  and_dcpl_401 <= and_dcpl_307 AND (rem_12cyc_st_4_1_0(1));
  or_199_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_47 <= or_195_cse AND or_199_cse AND or_tmp_185;
  nor_477_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_47));
  mux_81_nl <= MUX_s_1_2_2(nor_477_nl, and_tmp_47, or_190_cse);
  and_dcpl_403 <= mux_81_nl AND and_dcpl_310 AND and_dcpl_401;
  and_dcpl_404 <= and_dcpl_313 AND (rem_12cyc_st_5_1_0(1));
  or_204_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_50 <= or_195_cse AND or_199_cse AND or_204_cse AND or_tmp_185;
  nor_476_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_50));
  mux_82_nl <= MUX_s_1_2_2(nor_476_nl, and_tmp_50, or_190_cse);
  and_dcpl_406 <= mux_82_nl AND and_dcpl_316 AND and_dcpl_404;
  or_210_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_54 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND or_tmp_185;
  nor_475_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_54));
  mux_83_nl <= MUX_s_1_2_2(nor_475_nl, and_tmp_54, or_190_cse);
  and_dcpl_409 <= mux_83_nl AND and_dcpl_112 AND and_dcpl_117;
  or_217_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_473_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_185));
  mux_84_nl <= MUX_s_1_2_2(nor_473_nl, or_tmp_185, or_217_cse);
  and_tmp_58 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_84_nl;
  nor_474_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_58));
  mux_85_nl <= MUX_s_1_2_2(nor_474_nl, and_tmp_58, or_190_cse);
  and_dcpl_413 <= mux_85_nl AND and_dcpl_85 AND and_dcpl_90;
  or_226_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_470_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_185));
  mux_tmp_84 <= MUX_s_1_2_2(nor_470_nl, or_tmp_185, or_226_cse);
  nor_471_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_84));
  mux_87_nl <= MUX_s_1_2_2(nor_471_nl, mux_tmp_84, or_217_cse);
  and_tmp_62 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_87_nl;
  nor_472_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_62));
  mux_88_nl <= MUX_s_1_2_2(nor_472_nl, and_tmp_62, or_190_cse);
  and_dcpl_417 <= mux_88_nl AND and_dcpl_58 AND and_dcpl_63;
  or_237_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_466_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_185));
  mux_tmp_87 <= MUX_s_1_2_2(nor_466_nl, or_tmp_185, or_237_cse);
  nor_467_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_87));
  mux_tmp_88 <= MUX_s_1_2_2(nor_467_nl, mux_tmp_87, or_226_cse);
  nor_468_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_88));
  mux_91_nl <= MUX_s_1_2_2(nor_468_nl, mux_tmp_88, or_217_cse);
  and_tmp_66 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_91_nl;
  nor_469_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_66));
  mux_92_nl <= MUX_s_1_2_2(nor_469_nl, and_tmp_66, or_190_cse);
  and_dcpl_421 <= mux_92_nl AND and_dcpl_31 AND and_dcpl_36;
  nor_461_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_185));
  or_250_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_91 <= MUX_s_1_2_2(nor_461_nl, or_tmp_185, or_250_nl);
  nor_462_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_91));
  mux_tmp_92 <= MUX_s_1_2_2(nor_462_nl, mux_tmp_91, or_237_cse);
  nor_463_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_92));
  mux_tmp_93 <= MUX_s_1_2_2(nor_463_nl, mux_tmp_92, or_226_cse);
  nor_464_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_93));
  mux_96_nl <= MUX_s_1_2_2(nor_464_nl, mux_tmp_93, or_217_cse);
  and_tmp_70 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_96_nl;
  nor_465_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_70));
  mux_97_nl <= MUX_s_1_2_2(nor_465_nl, and_tmp_70, or_190_cse);
  and_dcpl_425 <= mux_97_nl AND and_dcpl_4 AND and_dcpl_9;
  and_tmp_80 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND or_195_cse
      AND or_199_cse AND or_204_cse AND or_210_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_430 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_431 <= and_dcpl_293 AND and_dcpl_430;
  or_tmp_263 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_270_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_460_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_263));
  mux_98_nl <= MUX_s_1_2_2(nor_460_nl, or_tmp_263, or_270_cse);
  and_dcpl_433 <= mux_98_nl AND and_dcpl_358 AND and_dcpl_395;
  or_275_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1142_nl <= nand_276_cse AND or_tmp_263;
  mux_tmp_97 <= MUX_s_1_2_2(and_1142_nl, or_tmp_263, or_275_cse);
  nor_459_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_97));
  mux_100_nl <= MUX_s_1_2_2(nor_459_nl, mux_tmp_97, or_270_cse);
  and_dcpl_435 <= mux_100_nl AND and_dcpl_362 AND and_dcpl_398;
  or_280_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1140_nl <= nand_274_cse AND or_tmp_263;
  mux_tmp_99 <= MUX_s_1_2_2(and_1140_nl, or_tmp_263, or_280_cse);
  and_1141_nl <= nand_276_cse AND mux_tmp_99;
  mux_tmp_100 <= MUX_s_1_2_2(and_1141_nl, mux_tmp_99, or_275_cse);
  nor_458_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_100));
  mux_103_nl <= MUX_s_1_2_2(nor_458_nl, mux_tmp_100, or_270_cse);
  and_dcpl_437 <= mux_103_nl AND and_dcpl_366 AND and_dcpl_401;
  or_287_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1137_nl <= nand_271_cse AND or_tmp_263;
  mux_tmp_102 <= MUX_s_1_2_2(and_1137_nl, or_tmp_263, or_287_cse);
  and_1138_nl <= nand_274_cse AND mux_tmp_102;
  mux_tmp_103 <= MUX_s_1_2_2(and_1138_nl, mux_tmp_102, or_280_cse);
  and_1139_nl <= nand_276_cse AND mux_tmp_103;
  mux_tmp_104 <= MUX_s_1_2_2(and_1139_nl, mux_tmp_103, or_275_cse);
  nor_457_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_104));
  mux_107_nl <= MUX_s_1_2_2(nor_457_nl, mux_tmp_104, or_270_cse);
  and_dcpl_439 <= mux_107_nl AND and_dcpl_370 AND and_dcpl_404;
  or_296_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1133_nl <= nand_267_cse AND or_tmp_263;
  mux_tmp_106 <= MUX_s_1_2_2(and_1133_nl, or_tmp_263, or_296_cse);
  and_1134_nl <= nand_271_cse AND mux_tmp_106;
  mux_tmp_107 <= MUX_s_1_2_2(and_1134_nl, mux_tmp_106, or_287_cse);
  and_1135_nl <= nand_274_cse AND mux_tmp_107;
  mux_tmp_108 <= MUX_s_1_2_2(and_1135_nl, mux_tmp_107, or_280_cse);
  and_1136_nl <= nand_276_cse AND mux_tmp_108;
  mux_tmp_109 <= MUX_s_1_2_2(and_1136_nl, mux_tmp_108, or_275_cse);
  nor_456_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_109));
  mux_112_nl <= MUX_s_1_2_2(nor_456_nl, mux_tmp_109, or_270_cse);
  and_dcpl_442 <= mux_112_nl AND and_dcpl_112 AND and_dcpl_119;
  or_307_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_454_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_263));
  mux_tmp_111 <= MUX_s_1_2_2(nor_454_nl, or_tmp_263, or_307_cse);
  and_1129_nl <= nand_267_cse AND mux_tmp_111;
  mux_tmp_112 <= MUX_s_1_2_2(and_1129_nl, mux_tmp_111, or_296_cse);
  and_1130_nl <= nand_271_cse AND mux_tmp_112;
  mux_tmp_113 <= MUX_s_1_2_2(and_1130_nl, mux_tmp_112, or_287_cse);
  and_1131_nl <= nand_274_cse AND mux_tmp_113;
  mux_tmp_114 <= MUX_s_1_2_2(and_1131_nl, mux_tmp_113, or_280_cse);
  and_1132_nl <= nand_276_cse AND mux_tmp_114;
  mux_tmp_115 <= MUX_s_1_2_2(and_1132_nl, mux_tmp_114, or_275_cse);
  nor_455_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_115));
  mux_118_nl <= MUX_s_1_2_2(nor_455_nl, mux_tmp_115, or_270_cse);
  and_dcpl_445 <= mux_118_nl AND and_dcpl_85 AND and_dcpl_92;
  or_320_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_451_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_263));
  mux_tmp_117 <= MUX_s_1_2_2(nor_451_nl, or_tmp_263, or_320_cse);
  nor_452_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_117));
  mux_tmp_118 <= MUX_s_1_2_2(nor_452_nl, mux_tmp_117, or_307_cse);
  and_1125_nl <= nand_267_cse AND mux_tmp_118;
  mux_tmp_119 <= MUX_s_1_2_2(and_1125_nl, mux_tmp_118, or_296_cse);
  and_1126_nl <= nand_271_cse AND mux_tmp_119;
  mux_tmp_120 <= MUX_s_1_2_2(and_1126_nl, mux_tmp_119, or_287_cse);
  and_1127_nl <= nand_274_cse AND mux_tmp_120;
  mux_tmp_121 <= MUX_s_1_2_2(and_1127_nl, mux_tmp_120, or_280_cse);
  and_1128_nl <= nand_276_cse AND mux_tmp_121;
  mux_tmp_122 <= MUX_s_1_2_2(and_1128_nl, mux_tmp_121, or_275_cse);
  nor_453_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_122));
  mux_125_nl <= MUX_s_1_2_2(nor_453_nl, mux_tmp_122, or_270_cse);
  and_dcpl_448 <= mux_125_nl AND and_dcpl_58 AND and_dcpl_65;
  or_335_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_447_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_263));
  mux_tmp_124 <= MUX_s_1_2_2(nor_447_nl, or_tmp_263, or_335_cse);
  nor_448_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_124));
  mux_tmp_125 <= MUX_s_1_2_2(nor_448_nl, mux_tmp_124, or_320_cse);
  nor_449_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_125));
  mux_tmp_126 <= MUX_s_1_2_2(nor_449_nl, mux_tmp_125, or_307_cse);
  and_1121_nl <= nand_267_cse AND mux_tmp_126;
  mux_tmp_127 <= MUX_s_1_2_2(and_1121_nl, mux_tmp_126, or_296_cse);
  and_1122_nl <= nand_271_cse AND mux_tmp_127;
  mux_tmp_128 <= MUX_s_1_2_2(and_1122_nl, mux_tmp_127, or_287_cse);
  and_1123_nl <= nand_274_cse AND mux_tmp_128;
  mux_tmp_129 <= MUX_s_1_2_2(and_1123_nl, mux_tmp_128, or_280_cse);
  and_1124_nl <= nand_276_cse AND mux_tmp_129;
  mux_tmp_130 <= MUX_s_1_2_2(and_1124_nl, mux_tmp_129, or_275_cse);
  nor_450_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_130));
  mux_133_nl <= MUX_s_1_2_2(nor_450_nl, mux_tmp_130, or_270_cse);
  and_dcpl_451 <= mux_133_nl AND and_dcpl_31 AND and_dcpl_38;
  nor_442_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_263));
  or_352_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_132 <= MUX_s_1_2_2(nor_442_nl, or_tmp_263, or_352_nl);
  nor_443_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_132));
  mux_tmp_133 <= MUX_s_1_2_2(nor_443_nl, mux_tmp_132, or_335_cse);
  nor_444_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_133));
  mux_tmp_134 <= MUX_s_1_2_2(nor_444_nl, mux_tmp_133, or_320_cse);
  nor_445_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_134));
  mux_tmp_135 <= MUX_s_1_2_2(nor_445_nl, mux_tmp_134, or_307_cse);
  and_1117_nl <= nand_267_cse AND mux_tmp_135;
  mux_tmp_136 <= MUX_s_1_2_2(and_1117_nl, mux_tmp_135, or_296_cse);
  and_1118_nl <= nand_271_cse AND mux_tmp_136;
  mux_tmp_137 <= MUX_s_1_2_2(and_1118_nl, mux_tmp_136, or_287_cse);
  and_1119_nl <= nand_274_cse AND mux_tmp_137;
  mux_tmp_138 <= MUX_s_1_2_2(and_1119_nl, mux_tmp_137, or_280_cse);
  and_1120_nl <= nand_276_cse AND mux_tmp_138;
  mux_tmp_139 <= MUX_s_1_2_2(and_1120_nl, mux_tmp_138, or_275_cse);
  nor_446_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_139));
  mux_142_nl <= MUX_s_1_2_2(nor_446_nl, mux_tmp_139, or_270_cse);
  and_dcpl_454 <= mux_142_nl AND and_dcpl_4 AND and_dcpl_11;
  nand_222_cse <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat);
  and_tmp_89 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR nand_222_cse);
  nand_223_cse <= NOT(CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11")));
  and_1116_nl <= nand_223_cse AND and_tmp_89;
  or_362_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_141 <= MUX_s_1_2_2(and_1116_nl, and_tmp_89, or_362_nl);
  and_dcpl_460 <= ccs_ccore_start_rsci_idat AND CONV_SL_1_1(acc_tmp=STD_LOGIC_VECTOR'("01"));
  and_dcpl_461 <= and_dcpl_460 AND and_dcpl_291;
  and_dcpl_462 <= CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_463 <= and_dcpl_462 AND (NOT (rem_12cyc_st_2_1_0(1)));
  not_tmp_332 <= NOT((rem_12cyc_3_2(0)) AND asn_itm_1 AND main_stage_0_2);
  or_tmp_368 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  nand_281_cse <= NOT((acc_tmp(0)) AND ccs_ccore_start_rsci_idat);
  or_377_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (acc_tmp(1));
  and_1172_nl <= nand_281_cse AND or_tmp_368;
  mux_144_nl <= MUX_s_1_2_2(and_1172_nl, or_tmp_368, or_377_cse);
  and_dcpl_465 <= mux_144_nl AND and_dcpl_298 AND and_dcpl_463;
  and_dcpl_466 <= CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_467 <= and_dcpl_466 AND (NOT (rem_12cyc_st_3_1_0(1)));
  or_382_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_90 <= or_382_cse AND or_tmp_368;
  and_1114_nl <= nand_281_cse AND and_tmp_90;
  mux_145_nl <= MUX_s_1_2_2(and_1114_nl, and_tmp_90, or_377_cse);
  and_dcpl_469 <= mux_145_nl AND and_dcpl_304 AND and_dcpl_467;
  and_dcpl_470 <= CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_471 <= and_dcpl_470 AND (NOT (rem_12cyc_st_4_1_0(1)));
  or_386_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_92 <= or_382_cse AND or_386_cse AND or_tmp_368;
  and_1113_nl <= nand_281_cse AND and_tmp_92;
  mux_146_nl <= MUX_s_1_2_2(and_1113_nl, and_tmp_92, or_377_cse);
  and_dcpl_473 <= mux_146_nl AND and_dcpl_310 AND and_dcpl_471;
  and_dcpl_474 <= CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_475 <= and_dcpl_474 AND (NOT (rem_12cyc_st_5_1_0(1)));
  or_391_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_95 <= or_382_cse AND or_386_cse AND or_391_cse AND or_tmp_368;
  and_1112_nl <= nand_281_cse AND and_tmp_95;
  mux_147_nl <= MUX_s_1_2_2(and_1112_nl, and_tmp_95, or_377_cse);
  and_dcpl_477 <= mux_147_nl AND and_dcpl_316 AND and_dcpl_475;
  or_397_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_99 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND or_tmp_368;
  and_1111_nl <= nand_281_cse AND and_tmp_99;
  mux_148_nl <= MUX_s_1_2_2(and_1111_nl, and_tmp_99, or_377_cse);
  and_dcpl_480 <= mux_148_nl AND and_dcpl_121 AND and_dcpl_110;
  nand_215_cse <= NOT((rem_12cyc_st_6_3_2(0)) AND asn_itm_6 AND main_stage_0_7);
  or_404_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_6_3_2(1));
  and_1109_nl <= nand_215_cse AND or_tmp_368;
  mux_149_nl <= MUX_s_1_2_2(and_1109_nl, or_tmp_368, or_404_cse);
  and_tmp_103 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_149_nl;
  and_1110_nl <= nand_281_cse AND and_tmp_103;
  mux_150_nl <= MUX_s_1_2_2(and_1110_nl, and_tmp_103, or_377_cse);
  and_dcpl_483 <= mux_150_nl AND and_dcpl_94 AND and_dcpl_83;
  nand_212_cse <= NOT((rem_12cyc_st_7_3_2(0)) AND asn_itm_7 AND main_stage_0_8);
  or_413_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_7_3_2(1));
  and_1106_nl <= nand_212_cse AND or_tmp_368;
  mux_tmp_149 <= MUX_s_1_2_2(and_1106_nl, or_tmp_368, or_413_cse);
  and_1107_nl <= nand_215_cse AND mux_tmp_149;
  mux_152_nl <= MUX_s_1_2_2(and_1107_nl, mux_tmp_149, or_404_cse);
  and_tmp_107 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_152_nl;
  and_1108_nl <= nand_281_cse AND and_tmp_107;
  mux_153_nl <= MUX_s_1_2_2(and_1108_nl, and_tmp_107, or_377_cse);
  and_dcpl_486 <= mux_153_nl AND and_dcpl_67 AND and_dcpl_56;
  nand_208_cse <= NOT((rem_12cyc_st_8_3_2(0)) AND asn_itm_8 AND main_stage_0_9);
  or_424_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_8_3_2(1));
  and_1102_nl <= nand_208_cse AND or_tmp_368;
  mux_tmp_152 <= MUX_s_1_2_2(and_1102_nl, or_tmp_368, or_424_cse);
  and_1103_nl <= nand_212_cse AND mux_tmp_152;
  mux_tmp_153 <= MUX_s_1_2_2(and_1103_nl, mux_tmp_152, or_413_cse);
  and_1104_nl <= nand_215_cse AND mux_tmp_153;
  mux_156_nl <= MUX_s_1_2_2(and_1104_nl, mux_tmp_153, or_404_cse);
  and_tmp_111 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_156_nl;
  and_1105_nl <= nand_281_cse AND and_tmp_111;
  mux_157_nl <= MUX_s_1_2_2(and_1105_nl, and_tmp_111, or_377_cse);
  and_dcpl_489 <= mux_157_nl AND and_dcpl_40 AND and_dcpl_29;
  nand_203_cse <= NOT((rem_12cyc_st_9_3_2(0)) AND asn_itm_9 AND main_stage_0_10);
  and_1097_nl <= nand_203_cse AND or_tmp_368;
  or_437_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_156 <= MUX_s_1_2_2(and_1097_nl, or_tmp_368, or_437_nl);
  and_1098_nl <= nand_208_cse AND mux_tmp_156;
  mux_tmp_157 <= MUX_s_1_2_2(and_1098_nl, mux_tmp_156, or_424_cse);
  and_1099_nl <= nand_212_cse AND mux_tmp_157;
  mux_tmp_158 <= MUX_s_1_2_2(and_1099_nl, mux_tmp_157, or_413_cse);
  and_1100_nl <= nand_215_cse AND mux_tmp_158;
  mux_161_nl <= MUX_s_1_2_2(and_1100_nl, mux_tmp_158, or_404_cse);
  and_tmp_115 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_161_nl;
  and_1101_nl <= nand_281_cse AND and_tmp_115;
  mux_162_nl <= MUX_s_1_2_2(and_1101_nl, and_tmp_115, or_377_cse);
  and_dcpl_492 <= mux_162_nl AND and_dcpl_13 AND and_dcpl_2;
  and_tmp_125 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND or_382_cse
      AND or_386_cse AND or_391_cse AND or_397_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_498 <= and_dcpl_460 AND and_dcpl_355;
  or_tmp_446 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_458_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (acc_tmp(1));
  and_1171_nl <= nand_281_cse AND or_tmp_446;
  mux_163_nl <= MUX_s_1_2_2(and_1171_nl, or_tmp_446, or_458_cse);
  and_dcpl_500 <= mux_163_nl AND and_dcpl_358 AND and_dcpl_463;
  or_463_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1094_nl <= nand_276_cse AND or_tmp_446;
  mux_tmp_162 <= MUX_s_1_2_2(and_1094_nl, or_tmp_446, or_463_cse);
  and_1095_nl <= nand_281_cse AND mux_tmp_162;
  mux_165_nl <= MUX_s_1_2_2(and_1095_nl, mux_tmp_162, or_458_cse);
  and_dcpl_502 <= mux_165_nl AND and_dcpl_362 AND and_dcpl_467;
  nand_198_cse <= NOT((rem_12cyc_st_3_3_2(0)) AND asn_itm_3 AND main_stage_0_4 AND
      (rem_12cyc_st_3_1_0(0)));
  or_468_cse <= (rem_12cyc_st_3_1_0(1)) OR (rem_12cyc_st_3_3_2(1));
  and_1091_nl <= nand_198_cse AND or_tmp_446;
  mux_tmp_164 <= MUX_s_1_2_2(and_1091_nl, or_tmp_446, or_468_cse);
  and_1092_nl <= nand_276_cse AND mux_tmp_164;
  mux_tmp_165 <= MUX_s_1_2_2(and_1092_nl, mux_tmp_164, or_463_cse);
  and_1093_nl <= nand_281_cse AND mux_tmp_165;
  mux_168_nl <= MUX_s_1_2_2(and_1093_nl, mux_tmp_165, or_458_cse);
  and_dcpl_504 <= mux_168_nl AND and_dcpl_366 AND and_dcpl_471;
  or_475_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1087_nl <= nand_271_cse AND or_tmp_446;
  mux_tmp_167 <= MUX_s_1_2_2(and_1087_nl, or_tmp_446, or_475_cse);
  and_1088_nl <= nand_198_cse AND mux_tmp_167;
  mux_tmp_168 <= MUX_s_1_2_2(and_1088_nl, mux_tmp_167, or_468_cse);
  and_1089_nl <= nand_276_cse AND mux_tmp_168;
  mux_tmp_169 <= MUX_s_1_2_2(and_1089_nl, mux_tmp_168, or_463_cse);
  and_1090_nl <= nand_281_cse AND mux_tmp_169;
  mux_172_nl <= MUX_s_1_2_2(and_1090_nl, mux_tmp_169, or_458_cse);
  and_dcpl_506 <= mux_172_nl AND and_dcpl_370 AND and_dcpl_475;
  nand_189_cse <= NOT((rem_12cyc_st_5_3_2(0)) AND asn_itm_5 AND main_stage_0_6 AND
      (rem_12cyc_st_5_1_0(0)));
  or_484_cse <= (rem_12cyc_st_5_1_0(1)) OR (rem_12cyc_st_5_3_2(1));
  and_1082_nl <= nand_189_cse AND or_tmp_446;
  mux_tmp_171 <= MUX_s_1_2_2(and_1082_nl, or_tmp_446, or_484_cse);
  and_1083_nl <= nand_271_cse AND mux_tmp_171;
  mux_tmp_172 <= MUX_s_1_2_2(and_1083_nl, mux_tmp_171, or_475_cse);
  and_1084_nl <= nand_198_cse AND mux_tmp_172;
  mux_tmp_173 <= MUX_s_1_2_2(and_1084_nl, mux_tmp_172, or_468_cse);
  and_1085_nl <= nand_276_cse AND mux_tmp_173;
  mux_tmp_174 <= MUX_s_1_2_2(and_1085_nl, mux_tmp_173, or_463_cse);
  and_1086_nl <= nand_281_cse AND mux_tmp_174;
  mux_177_nl <= MUX_s_1_2_2(and_1086_nl, mux_tmp_174, or_458_cse);
  and_dcpl_508 <= mux_177_nl AND and_dcpl_121 AND and_dcpl_115;
  or_495_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_6_3_2(1));
  and_1076_nl <= nand_215_cse AND or_tmp_446;
  mux_tmp_176 <= MUX_s_1_2_2(and_1076_nl, or_tmp_446, or_495_cse);
  and_1077_nl <= nand_189_cse AND mux_tmp_176;
  mux_tmp_177 <= MUX_s_1_2_2(and_1077_nl, mux_tmp_176, or_484_cse);
  and_1078_nl <= nand_271_cse AND mux_tmp_177;
  mux_tmp_178 <= MUX_s_1_2_2(and_1078_nl, mux_tmp_177, or_475_cse);
  and_1079_nl <= nand_198_cse AND mux_tmp_178;
  mux_tmp_179 <= MUX_s_1_2_2(and_1079_nl, mux_tmp_178, or_468_cse);
  and_1080_nl <= nand_276_cse AND mux_tmp_179;
  mux_tmp_180 <= MUX_s_1_2_2(and_1080_nl, mux_tmp_179, or_463_cse);
  and_1081_nl <= nand_281_cse AND mux_tmp_180;
  mux_183_nl <= MUX_s_1_2_2(and_1081_nl, mux_tmp_180, or_458_cse);
  and_dcpl_510 <= mux_183_nl AND and_dcpl_94 AND and_dcpl_87;
  or_508_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_7_3_2(1));
  and_1069_nl <= nand_212_cse AND or_tmp_446;
  mux_tmp_182 <= MUX_s_1_2_2(and_1069_nl, or_tmp_446, or_508_cse);
  and_1070_nl <= nand_215_cse AND mux_tmp_182;
  mux_tmp_183 <= MUX_s_1_2_2(and_1070_nl, mux_tmp_182, or_495_cse);
  and_1071_nl <= nand_189_cse AND mux_tmp_183;
  mux_tmp_184 <= MUX_s_1_2_2(and_1071_nl, mux_tmp_183, or_484_cse);
  and_1072_nl <= nand_271_cse AND mux_tmp_184;
  mux_tmp_185 <= MUX_s_1_2_2(and_1072_nl, mux_tmp_184, or_475_cse);
  and_1073_nl <= nand_198_cse AND mux_tmp_185;
  mux_tmp_186 <= MUX_s_1_2_2(and_1073_nl, mux_tmp_185, or_468_cse);
  and_1074_nl <= nand_276_cse AND mux_tmp_186;
  mux_tmp_187 <= MUX_s_1_2_2(and_1074_nl, mux_tmp_186, or_463_cse);
  and_1075_nl <= nand_281_cse AND mux_tmp_187;
  mux_190_nl <= MUX_s_1_2_2(and_1075_nl, mux_tmp_187, or_458_cse);
  and_dcpl_512 <= mux_190_nl AND and_dcpl_67 AND and_dcpl_60;
  or_523_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_8_3_2(1));
  and_1061_nl <= nand_208_cse AND or_tmp_446;
  mux_tmp_189 <= MUX_s_1_2_2(and_1061_nl, or_tmp_446, or_523_cse);
  and_1062_nl <= nand_212_cse AND mux_tmp_189;
  mux_tmp_190 <= MUX_s_1_2_2(and_1062_nl, mux_tmp_189, or_508_cse);
  and_1063_nl <= nand_215_cse AND mux_tmp_190;
  mux_tmp_191 <= MUX_s_1_2_2(and_1063_nl, mux_tmp_190, or_495_cse);
  and_1064_nl <= nand_189_cse AND mux_tmp_191;
  mux_tmp_192 <= MUX_s_1_2_2(and_1064_nl, mux_tmp_191, or_484_cse);
  and_1065_nl <= nand_271_cse AND mux_tmp_192;
  mux_tmp_193 <= MUX_s_1_2_2(and_1065_nl, mux_tmp_192, or_475_cse);
  and_1066_nl <= nand_198_cse AND mux_tmp_193;
  mux_tmp_194 <= MUX_s_1_2_2(and_1066_nl, mux_tmp_193, or_468_cse);
  and_1067_nl <= nand_276_cse AND mux_tmp_194;
  mux_tmp_195 <= MUX_s_1_2_2(and_1067_nl, mux_tmp_194, or_463_cse);
  and_1068_nl <= nand_281_cse AND mux_tmp_195;
  mux_198_nl <= MUX_s_1_2_2(and_1068_nl, mux_tmp_195, or_458_cse);
  and_dcpl_514 <= mux_198_nl AND and_dcpl_40 AND and_dcpl_33;
  and_1052_nl <= nand_203_cse AND or_tmp_446;
  or_540_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_197 <= MUX_s_1_2_2(and_1052_nl, or_tmp_446, or_540_nl);
  and_1053_nl <= nand_208_cse AND mux_tmp_197;
  mux_tmp_198 <= MUX_s_1_2_2(and_1053_nl, mux_tmp_197, or_523_cse);
  and_1054_nl <= nand_212_cse AND mux_tmp_198;
  mux_tmp_199 <= MUX_s_1_2_2(and_1054_nl, mux_tmp_198, or_508_cse);
  and_1055_nl <= nand_215_cse AND mux_tmp_199;
  mux_tmp_200 <= MUX_s_1_2_2(and_1055_nl, mux_tmp_199, or_495_cse);
  and_1056_nl <= nand_189_cse AND mux_tmp_200;
  mux_tmp_201 <= MUX_s_1_2_2(and_1056_nl, mux_tmp_200, or_484_cse);
  and_1057_nl <= nand_271_cse AND mux_tmp_201;
  mux_tmp_202 <= MUX_s_1_2_2(and_1057_nl, mux_tmp_201, or_475_cse);
  and_1058_nl <= nand_198_cse AND mux_tmp_202;
  mux_tmp_203 <= MUX_s_1_2_2(and_1058_nl, mux_tmp_202, or_468_cse);
  and_1059_nl <= nand_276_cse AND mux_tmp_203;
  mux_tmp_204 <= MUX_s_1_2_2(and_1059_nl, mux_tmp_203, or_463_cse);
  and_1060_nl <= nand_281_cse AND mux_tmp_204;
  mux_207_nl <= MUX_s_1_2_2(and_1060_nl, mux_tmp_204, or_458_cse);
  and_dcpl_516 <= mux_207_nl AND and_dcpl_13 AND and_dcpl_6;
  and_tmp_134 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR (acc_1_tmp(1)) OR nand_250_cse);
  nor_439_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT and_tmp_134));
  or_550_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_206 <= MUX_s_1_2_2(nor_439_nl, and_tmp_134, or_550_nl);
  and_dcpl_520 <= and_dcpl_460 AND and_dcpl_393;
  and_dcpl_521 <= and_dcpl_462 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_551 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_564_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (acc_tmp(1));
  and_1170_nl <= nand_281_cse AND or_tmp_551;
  mux_209_nl <= MUX_s_1_2_2(and_1170_nl, or_tmp_551, or_564_cse);
  and_dcpl_523 <= mux_209_nl AND and_dcpl_298 AND and_dcpl_521;
  and_dcpl_524 <= and_dcpl_466 AND (rem_12cyc_st_3_1_0(1));
  or_569_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_135 <= or_569_cse AND or_tmp_551;
  and_1050_nl <= nand_281_cse AND and_tmp_135;
  mux_210_nl <= MUX_s_1_2_2(and_1050_nl, and_tmp_135, or_564_cse);
  and_dcpl_526 <= mux_210_nl AND and_dcpl_304 AND and_dcpl_524;
  and_dcpl_527 <= and_dcpl_470 AND (rem_12cyc_st_4_1_0(1));
  or_573_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_137 <= or_569_cse AND or_573_cse AND or_tmp_551;
  and_1049_nl <= nand_281_cse AND and_tmp_137;
  mux_211_nl <= MUX_s_1_2_2(and_1049_nl, and_tmp_137, or_564_cse);
  and_dcpl_529 <= mux_211_nl AND and_dcpl_310 AND and_dcpl_527;
  and_dcpl_530 <= and_dcpl_474 AND (rem_12cyc_st_5_1_0(1));
  or_578_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_140 <= or_569_cse AND or_573_cse AND or_578_cse AND or_tmp_551;
  and_1048_nl <= nand_281_cse AND and_tmp_140;
  mux_212_nl <= MUX_s_1_2_2(and_1048_nl, and_tmp_140, or_564_cse);
  and_dcpl_532 <= mux_212_nl AND and_dcpl_316 AND and_dcpl_530;
  or_584_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_144 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND or_tmp_551;
  and_1047_nl <= nand_281_cse AND and_tmp_144;
  mux_213_nl <= MUX_s_1_2_2(and_1047_nl, and_tmp_144, or_564_cse);
  and_dcpl_534 <= mux_213_nl AND and_dcpl_121 AND and_dcpl_117;
  or_591_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_6_3_2(1));
  and_1045_nl <= nand_215_cse AND or_tmp_551;
  mux_214_nl <= MUX_s_1_2_2(and_1045_nl, or_tmp_551, or_591_cse);
  and_tmp_148 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_214_nl;
  and_1046_nl <= nand_281_cse AND and_tmp_148;
  mux_215_nl <= MUX_s_1_2_2(and_1046_nl, and_tmp_148, or_564_cse);
  and_dcpl_536 <= mux_215_nl AND and_dcpl_94 AND and_dcpl_90;
  or_600_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_7_3_2(1));
  and_1042_nl <= nand_212_cse AND or_tmp_551;
  mux_tmp_214 <= MUX_s_1_2_2(and_1042_nl, or_tmp_551, or_600_cse);
  and_1043_nl <= nand_215_cse AND mux_tmp_214;
  mux_217_nl <= MUX_s_1_2_2(and_1043_nl, mux_tmp_214, or_591_cse);
  and_tmp_152 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_217_nl;
  and_1044_nl <= nand_281_cse AND and_tmp_152;
  mux_218_nl <= MUX_s_1_2_2(and_1044_nl, and_tmp_152, or_564_cse);
  and_dcpl_538 <= mux_218_nl AND and_dcpl_67 AND and_dcpl_63;
  or_611_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_8_3_2(1));
  and_1038_nl <= nand_208_cse AND or_tmp_551;
  mux_tmp_217 <= MUX_s_1_2_2(and_1038_nl, or_tmp_551, or_611_cse);
  and_1039_nl <= nand_212_cse AND mux_tmp_217;
  mux_tmp_218 <= MUX_s_1_2_2(and_1039_nl, mux_tmp_217, or_600_cse);
  and_1040_nl <= nand_215_cse AND mux_tmp_218;
  mux_221_nl <= MUX_s_1_2_2(and_1040_nl, mux_tmp_218, or_591_cse);
  and_tmp_156 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_221_nl;
  and_1041_nl <= nand_281_cse AND and_tmp_156;
  mux_222_nl <= MUX_s_1_2_2(and_1041_nl, and_tmp_156, or_564_cse);
  and_dcpl_540 <= mux_222_nl AND and_dcpl_40 AND and_dcpl_36;
  and_1033_nl <= nand_203_cse AND or_tmp_551;
  or_624_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_221 <= MUX_s_1_2_2(and_1033_nl, or_tmp_551, or_624_nl);
  and_1034_nl <= nand_208_cse AND mux_tmp_221;
  mux_tmp_222 <= MUX_s_1_2_2(and_1034_nl, mux_tmp_221, or_611_cse);
  and_1035_nl <= nand_212_cse AND mux_tmp_222;
  mux_tmp_223 <= MUX_s_1_2_2(and_1035_nl, mux_tmp_222, or_600_cse);
  and_1036_nl <= nand_215_cse AND mux_tmp_223;
  mux_226_nl <= MUX_s_1_2_2(and_1036_nl, mux_tmp_223, or_591_cse);
  and_tmp_160 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_226_nl;
  and_1037_nl <= nand_281_cse AND and_tmp_160;
  mux_227_nl <= MUX_s_1_2_2(and_1037_nl, and_tmp_160, or_564_cse);
  and_dcpl_542 <= mux_227_nl AND and_dcpl_13 AND and_dcpl_9;
  and_tmp_170 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND or_569_cse
      AND or_573_cse AND or_578_cse AND or_584_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_546 <= and_dcpl_460 AND and_dcpl_430;
  or_tmp_629 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_643_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR (acc_tmp(1));
  and_1169_nl <= nand_281_cse AND or_tmp_629;
  mux_228_nl <= MUX_s_1_2_2(and_1169_nl, or_tmp_629, or_643_cse);
  and_dcpl_548 <= mux_228_nl AND and_dcpl_358 AND and_dcpl_521;
  or_648_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1030_nl <= nand_276_cse AND or_tmp_629;
  mux_tmp_227 <= MUX_s_1_2_2(and_1030_nl, or_tmp_629, or_648_cse);
  and_1031_nl <= nand_281_cse AND mux_tmp_227;
  mux_230_nl <= MUX_s_1_2_2(and_1031_nl, mux_tmp_227, or_643_cse);
  and_dcpl_550 <= mux_230_nl AND and_dcpl_362 AND and_dcpl_524;
  or_653_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR (rem_12cyc_st_3_3_2(1));
  and_1027_nl <= nand_198_cse AND or_tmp_629;
  mux_tmp_229 <= MUX_s_1_2_2(and_1027_nl, or_tmp_629, or_653_cse);
  and_1028_nl <= nand_276_cse AND mux_tmp_229;
  mux_tmp_230 <= MUX_s_1_2_2(and_1028_nl, mux_tmp_229, or_648_cse);
  and_1029_nl <= nand_281_cse AND mux_tmp_230;
  mux_233_nl <= MUX_s_1_2_2(and_1029_nl, mux_tmp_230, or_643_cse);
  and_dcpl_552 <= mux_233_nl AND and_dcpl_366 AND and_dcpl_527;
  or_660_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1023_nl <= nand_271_cse AND or_tmp_629;
  mux_tmp_232 <= MUX_s_1_2_2(and_1023_nl, or_tmp_629, or_660_cse);
  and_1024_nl <= nand_198_cse AND mux_tmp_232;
  mux_tmp_233 <= MUX_s_1_2_2(and_1024_nl, mux_tmp_232, or_653_cse);
  and_1025_nl <= nand_276_cse AND mux_tmp_233;
  mux_tmp_234 <= MUX_s_1_2_2(and_1025_nl, mux_tmp_233, or_648_cse);
  and_1026_nl <= nand_281_cse AND mux_tmp_234;
  mux_237_nl <= MUX_s_1_2_2(and_1026_nl, mux_tmp_234, or_643_cse);
  and_dcpl_554 <= mux_237_nl AND and_dcpl_370 AND and_dcpl_530;
  or_669_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR (rem_12cyc_st_5_3_2(1));
  and_1018_nl <= nand_189_cse AND or_tmp_629;
  mux_tmp_236 <= MUX_s_1_2_2(and_1018_nl, or_tmp_629, or_669_cse);
  and_1019_nl <= nand_271_cse AND mux_tmp_236;
  mux_tmp_237 <= MUX_s_1_2_2(and_1019_nl, mux_tmp_236, or_660_cse);
  and_1020_nl <= nand_198_cse AND mux_tmp_237;
  mux_tmp_238 <= MUX_s_1_2_2(and_1020_nl, mux_tmp_237, or_653_cse);
  and_1021_nl <= nand_276_cse AND mux_tmp_238;
  mux_tmp_239 <= MUX_s_1_2_2(and_1021_nl, mux_tmp_238, or_648_cse);
  and_1022_nl <= nand_281_cse AND mux_tmp_239;
  mux_242_nl <= MUX_s_1_2_2(and_1022_nl, mux_tmp_239, or_643_cse);
  and_dcpl_556 <= mux_242_nl AND and_dcpl_121 AND and_dcpl_119;
  or_680_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_6_3_2(1));
  and_1012_nl <= nand_215_cse AND or_tmp_629;
  mux_tmp_241 <= MUX_s_1_2_2(and_1012_nl, or_tmp_629, or_680_cse);
  and_1013_nl <= nand_189_cse AND mux_tmp_241;
  mux_tmp_242 <= MUX_s_1_2_2(and_1013_nl, mux_tmp_241, or_669_cse);
  and_1014_nl <= nand_271_cse AND mux_tmp_242;
  mux_tmp_243 <= MUX_s_1_2_2(and_1014_nl, mux_tmp_242, or_660_cse);
  and_1015_nl <= nand_198_cse AND mux_tmp_243;
  mux_tmp_244 <= MUX_s_1_2_2(and_1015_nl, mux_tmp_243, or_653_cse);
  and_1016_nl <= nand_276_cse AND mux_tmp_244;
  mux_tmp_245 <= MUX_s_1_2_2(and_1016_nl, mux_tmp_244, or_648_cse);
  and_1017_nl <= nand_281_cse AND mux_tmp_245;
  mux_248_nl <= MUX_s_1_2_2(and_1017_nl, mux_tmp_245, or_643_cse);
  and_dcpl_558 <= mux_248_nl AND and_dcpl_94 AND and_dcpl_92;
  or_693_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_7_3_2(1));
  and_1005_nl <= nand_212_cse AND or_tmp_629;
  mux_tmp_247 <= MUX_s_1_2_2(and_1005_nl, or_tmp_629, or_693_cse);
  and_1006_nl <= nand_215_cse AND mux_tmp_247;
  mux_tmp_248 <= MUX_s_1_2_2(and_1006_nl, mux_tmp_247, or_680_cse);
  and_1007_nl <= nand_189_cse AND mux_tmp_248;
  mux_tmp_249 <= MUX_s_1_2_2(and_1007_nl, mux_tmp_248, or_669_cse);
  and_1008_nl <= nand_271_cse AND mux_tmp_249;
  mux_tmp_250 <= MUX_s_1_2_2(and_1008_nl, mux_tmp_249, or_660_cse);
  and_1009_nl <= nand_198_cse AND mux_tmp_250;
  mux_tmp_251 <= MUX_s_1_2_2(and_1009_nl, mux_tmp_250, or_653_cse);
  and_1010_nl <= nand_276_cse AND mux_tmp_251;
  mux_tmp_252 <= MUX_s_1_2_2(and_1010_nl, mux_tmp_251, or_648_cse);
  and_1011_nl <= nand_281_cse AND mux_tmp_252;
  mux_255_nl <= MUX_s_1_2_2(and_1011_nl, mux_tmp_252, or_643_cse);
  and_dcpl_560 <= mux_255_nl AND and_dcpl_67 AND and_dcpl_65;
  or_708_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_8_3_2(1));
  and_997_nl <= nand_208_cse AND or_tmp_629;
  mux_tmp_254 <= MUX_s_1_2_2(and_997_nl, or_tmp_629, or_708_cse);
  and_998_nl <= nand_212_cse AND mux_tmp_254;
  mux_tmp_255 <= MUX_s_1_2_2(and_998_nl, mux_tmp_254, or_693_cse);
  and_999_nl <= nand_215_cse AND mux_tmp_255;
  mux_tmp_256 <= MUX_s_1_2_2(and_999_nl, mux_tmp_255, or_680_cse);
  and_1000_nl <= nand_189_cse AND mux_tmp_256;
  mux_tmp_257 <= MUX_s_1_2_2(and_1000_nl, mux_tmp_256, or_669_cse);
  and_1001_nl <= nand_271_cse AND mux_tmp_257;
  mux_tmp_258 <= MUX_s_1_2_2(and_1001_nl, mux_tmp_257, or_660_cse);
  and_1002_nl <= nand_198_cse AND mux_tmp_258;
  mux_tmp_259 <= MUX_s_1_2_2(and_1002_nl, mux_tmp_258, or_653_cse);
  and_1003_nl <= nand_276_cse AND mux_tmp_259;
  mux_tmp_260 <= MUX_s_1_2_2(and_1003_nl, mux_tmp_259, or_648_cse);
  and_1004_nl <= nand_281_cse AND mux_tmp_260;
  mux_263_nl <= MUX_s_1_2_2(and_1004_nl, mux_tmp_260, or_643_cse);
  and_dcpl_562 <= mux_263_nl AND and_dcpl_40 AND and_dcpl_38;
  and_988_nl <= nand_203_cse AND or_tmp_629;
  or_725_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_262 <= MUX_s_1_2_2(and_988_nl, or_tmp_629, or_725_nl);
  and_989_nl <= nand_208_cse AND mux_tmp_262;
  mux_tmp_263 <= MUX_s_1_2_2(and_989_nl, mux_tmp_262, or_708_cse);
  and_990_nl <= nand_212_cse AND mux_tmp_263;
  mux_tmp_264 <= MUX_s_1_2_2(and_990_nl, mux_tmp_263, or_693_cse);
  and_991_nl <= nand_215_cse AND mux_tmp_264;
  mux_tmp_265 <= MUX_s_1_2_2(and_991_nl, mux_tmp_264, or_680_cse);
  and_992_nl <= nand_189_cse AND mux_tmp_265;
  mux_tmp_266 <= MUX_s_1_2_2(and_992_nl, mux_tmp_265, or_669_cse);
  and_993_nl <= nand_271_cse AND mux_tmp_266;
  mux_tmp_267 <= MUX_s_1_2_2(and_993_nl, mux_tmp_266, or_660_cse);
  and_994_nl <= nand_198_cse AND mux_tmp_267;
  mux_tmp_268 <= MUX_s_1_2_2(and_994_nl, mux_tmp_267, or_653_cse);
  and_995_nl <= nand_276_cse AND mux_tmp_268;
  mux_tmp_269 <= MUX_s_1_2_2(and_995_nl, mux_tmp_268, or_648_cse);
  and_996_nl <= nand_281_cse AND mux_tmp_269;
  mux_272_nl <= MUX_s_1_2_2(and_996_nl, mux_tmp_269, or_643_cse);
  and_dcpl_564 <= mux_272_nl AND and_dcpl_13 AND and_dcpl_11;
  and_tmp_179 <= (NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11"))
      AND CONV_SL_1_1(rem_12cyc_st_7_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_9
      AND asn_itm_8 AND CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_8_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_10
      AND asn_itm_9 AND CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_9_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_3
      AND asn_itm_2 AND CONV_SL_1_1(rem_12cyc_st_2_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_4
      AND asn_itm_3 AND CONV_SL_1_1(rem_12cyc_st_3_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_5
      AND asn_itm_4 AND CONV_SL_1_1(rem_12cyc_st_4_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_6
      AND asn_itm_5 AND CONV_SL_1_1(rem_12cyc_st_5_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_7
      AND asn_itm_6 AND CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_6_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_11
      AND asn_itm_10 AND CONV_SL_1_1(rem_12cyc_st_10_1_0=STD_LOGIC_VECTOR'("11"))
      AND CONV_SL_1_1(rem_12cyc_st_10_3_2=STD_LOGIC_VECTOR'("01")))) AND ((acc_tmp(1))
      OR (NOT((acc_tmp(0)) AND CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat)));
  and_987_nl <= (NOT((rem_12cyc_3_2(0)) AND CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11"))))
      AND and_tmp_179;
  or_735_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR (rem_12cyc_3_2(1));
  mux_tmp_271 <= MUX_s_1_2_2(and_987_nl, and_tmp_179, or_735_nl);
  and_dcpl_568 <= and_dcpl_292 AND (acc_tmp(1));
  and_dcpl_569 <= and_dcpl_568 AND and_dcpl_291;
  and_dcpl_570 <= CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_571 <= and_dcpl_570 AND (NOT (rem_12cyc_st_2_1_0(1)));
  or_tmp_733 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_748_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_436_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_733));
  mux_274_nl <= MUX_s_1_2_2(nor_436_nl, or_tmp_733, or_748_cse);
  and_dcpl_573 <= mux_274_nl AND and_dcpl_298 AND and_dcpl_571;
  and_dcpl_574 <= CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_575 <= and_dcpl_574 AND (NOT (rem_12cyc_st_3_1_0(1)));
  or_753_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_180 <= or_753_cse AND or_tmp_733;
  nor_435_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_180));
  mux_275_nl <= MUX_s_1_2_2(nor_435_nl, and_tmp_180, or_748_cse);
  and_dcpl_577 <= mux_275_nl AND and_dcpl_304 AND and_dcpl_575;
  and_dcpl_578 <= CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_579 <= and_dcpl_578 AND (NOT (rem_12cyc_st_4_1_0(1)));
  or_757_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_182 <= or_753_cse AND or_757_cse AND or_tmp_733;
  nor_434_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_182));
  mux_276_nl <= MUX_s_1_2_2(nor_434_nl, and_tmp_182, or_748_cse);
  and_dcpl_581 <= mux_276_nl AND and_dcpl_310 AND and_dcpl_579;
  and_dcpl_582 <= CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_583 <= and_dcpl_582 AND (NOT (rem_12cyc_st_5_1_0(1)));
  or_762_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_185 <= or_753_cse AND or_757_cse AND or_762_cse AND or_tmp_733;
  nor_433_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_185));
  mux_277_nl <= MUX_s_1_2_2(nor_433_nl, and_tmp_185, or_748_cse);
  and_dcpl_585 <= mux_277_nl AND and_dcpl_316 AND and_dcpl_583;
  or_768_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_189 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND or_tmp_733;
  nor_432_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_189));
  mux_278_nl <= MUX_s_1_2_2(nor_432_nl, and_tmp_189, or_748_cse);
  and_dcpl_589 <= mux_278_nl AND and_dcpl_112 AND and_dcpl_126 AND (NOT (rem_12cyc_st_6_1_0(1)));
  or_775_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_430_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_733));
  mux_279_nl <= MUX_s_1_2_2(nor_430_nl, or_tmp_733, or_775_cse);
  and_tmp_193 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_279_nl;
  nor_431_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_193));
  mux_280_nl <= MUX_s_1_2_2(nor_431_nl, and_tmp_193, or_748_cse);
  and_dcpl_593 <= mux_280_nl AND and_dcpl_85 AND and_dcpl_99 AND (NOT (rem_12cyc_st_7_1_0(0)));
  or_784_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_427_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_733));
  mux_tmp_279 <= MUX_s_1_2_2(nor_427_nl, or_tmp_733, or_784_cse);
  nor_428_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_279));
  mux_282_nl <= MUX_s_1_2_2(nor_428_nl, mux_tmp_279, or_775_cse);
  and_tmp_197 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_282_nl;
  nor_429_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_197));
  mux_283_nl <= MUX_s_1_2_2(nor_429_nl, and_tmp_197, or_748_cse);
  and_dcpl_597 <= mux_283_nl AND and_dcpl_58 AND and_dcpl_72 AND (NOT (rem_12cyc_st_8_1_0(0)));
  or_795_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_423_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_733));
  mux_tmp_282 <= MUX_s_1_2_2(nor_423_nl, or_tmp_733, or_795_cse);
  nor_424_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_282));
  mux_tmp_283 <= MUX_s_1_2_2(nor_424_nl, mux_tmp_282, or_784_cse);
  nor_425_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_283));
  mux_286_nl <= MUX_s_1_2_2(nor_425_nl, mux_tmp_283, or_775_cse);
  and_tmp_201 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_286_nl;
  nor_426_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_201));
  mux_287_nl <= MUX_s_1_2_2(nor_426_nl, and_tmp_201, or_748_cse);
  and_dcpl_601 <= mux_287_nl AND and_dcpl_31 AND and_dcpl_45 AND (NOT (rem_12cyc_st_9_1_0(0)));
  nor_418_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_733));
  or_808_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_286 <= MUX_s_1_2_2(nor_418_nl, or_tmp_733, or_808_nl);
  nor_419_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_286));
  mux_tmp_287 <= MUX_s_1_2_2(nor_419_nl, mux_tmp_286, or_795_cse);
  nor_420_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_287));
  mux_tmp_288 <= MUX_s_1_2_2(nor_420_nl, mux_tmp_287, or_784_cse);
  nor_421_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_288));
  mux_291_nl <= MUX_s_1_2_2(nor_421_nl, mux_tmp_288, or_775_cse);
  and_tmp_205 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_291_nl;
  nor_422_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_205));
  mux_292_nl <= MUX_s_1_2_2(nor_422_nl, and_tmp_205, or_748_cse);
  and_dcpl_605 <= mux_292_nl AND and_dcpl_4 AND and_dcpl_18 AND (NOT (rem_12cyc_st_10_1_0(0)));
  or_tmp_808 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_1_tmp(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat);
  nor_409_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_808));
  or_823_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_291 <= MUX_s_1_2_2(nor_409_nl, or_tmp_808, or_823_nl);
  nor_410_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_291));
  or_822_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_292 <= MUX_s_1_2_2(nor_410_nl, mux_tmp_291, or_822_nl);
  nor_411_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_292));
  or_821_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_293 <= MUX_s_1_2_2(nor_411_nl, mux_tmp_292, or_821_nl);
  nor_412_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_293));
  or_820_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_294 <= MUX_s_1_2_2(nor_412_nl, mux_tmp_293, or_820_nl);
  nor_413_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_294));
  or_819_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_295 <= MUX_s_1_2_2(nor_413_nl, mux_tmp_294, or_819_nl);
  nor_414_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_295));
  or_818_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_296 <= MUX_s_1_2_2(nor_414_nl, mux_tmp_295, or_818_nl);
  nor_415_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_296));
  or_817_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_297 <= MUX_s_1_2_2(nor_415_nl, mux_tmp_296, or_817_nl);
  nor_416_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_297));
  or_816_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_298 <= MUX_s_1_2_2(nor_416_nl, mux_tmp_297, or_816_nl);
  nor_417_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_298));
  or_815_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_301_nl <= MUX_s_1_2_2(nor_417_nl, mux_tmp_298, or_815_nl);
  and_tmp_206 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND mux_301_nl;
  and_dcpl_610 <= and_dcpl_568 AND and_dcpl_355;
  or_tmp_820 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_837_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_408_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_820));
  mux_302_nl <= MUX_s_1_2_2(nor_408_nl, or_tmp_820, or_837_cse);
  and_dcpl_612 <= mux_302_nl AND and_dcpl_358 AND and_dcpl_571;
  nand_84_cse <= NOT((rem_12cyc_st_2_3_2(1)) AND asn_itm_2 AND main_stage_0_3 AND
      (rem_12cyc_st_2_1_0(0)));
  or_842_cse <= (rem_12cyc_st_2_1_0(1)) OR (rem_12cyc_st_2_3_2(0));
  and_986_nl <= nand_84_cse AND or_tmp_820;
  mux_tmp_301 <= MUX_s_1_2_2(and_986_nl, or_tmp_820, or_842_cse);
  nor_407_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_301));
  mux_304_nl <= MUX_s_1_2_2(nor_407_nl, mux_tmp_301, or_837_cse);
  and_dcpl_614 <= mux_304_nl AND and_dcpl_362 AND and_dcpl_575;
  or_847_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"));
  and_984_nl <= nand_274_cse AND or_tmp_820;
  mux_tmp_303 <= MUX_s_1_2_2(and_984_nl, or_tmp_820, or_847_cse);
  and_985_nl <= nand_84_cse AND mux_tmp_303;
  mux_tmp_304 <= MUX_s_1_2_2(and_985_nl, mux_tmp_303, or_842_cse);
  nor_406_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_304));
  mux_307_nl <= MUX_s_1_2_2(nor_406_nl, mux_tmp_304, or_837_cse);
  and_dcpl_616 <= mux_307_nl AND and_dcpl_366 AND and_dcpl_579;
  nand_79_cse <= NOT((rem_12cyc_st_4_3_2(1)) AND asn_itm_4 AND main_stage_0_5 AND
      (rem_12cyc_st_4_1_0(0)));
  or_854_cse <= (rem_12cyc_st_4_1_0(1)) OR (rem_12cyc_st_4_3_2(0));
  and_981_nl <= nand_79_cse AND or_tmp_820;
  mux_tmp_306 <= MUX_s_1_2_2(and_981_nl, or_tmp_820, or_854_cse);
  and_982_nl <= nand_274_cse AND mux_tmp_306;
  mux_tmp_307 <= MUX_s_1_2_2(and_982_nl, mux_tmp_306, or_847_cse);
  and_983_nl <= nand_84_cse AND mux_tmp_307;
  mux_tmp_308 <= MUX_s_1_2_2(and_983_nl, mux_tmp_307, or_842_cse);
  nor_405_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_308));
  mux_311_nl <= MUX_s_1_2_2(nor_405_nl, mux_tmp_308, or_837_cse);
  and_dcpl_618 <= mux_311_nl AND and_dcpl_370 AND and_dcpl_583;
  or_863_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"));
  and_977_nl <= nand_267_cse AND or_tmp_820;
  mux_tmp_310 <= MUX_s_1_2_2(and_977_nl, or_tmp_820, or_863_cse);
  and_978_nl <= nand_79_cse AND mux_tmp_310;
  mux_tmp_311 <= MUX_s_1_2_2(and_978_nl, mux_tmp_310, or_854_cse);
  and_979_nl <= nand_274_cse AND mux_tmp_311;
  mux_tmp_312 <= MUX_s_1_2_2(and_979_nl, mux_tmp_311, or_847_cse);
  and_980_nl <= nand_84_cse AND mux_tmp_312;
  mux_tmp_313 <= MUX_s_1_2_2(and_980_nl, mux_tmp_312, or_842_cse);
  nor_404_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_313));
  mux_316_nl <= MUX_s_1_2_2(nor_404_nl, mux_tmp_313, or_837_cse);
  and_dcpl_622 <= mux_316_nl AND and_dcpl_112 AND and_dcpl_129 AND (NOT (rem_12cyc_st_6_1_0(1)));
  or_874_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_402_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_820));
  mux_tmp_315 <= MUX_s_1_2_2(nor_402_nl, or_tmp_820, or_874_cse);
  and_973_nl <= nand_267_cse AND mux_tmp_315;
  mux_tmp_316 <= MUX_s_1_2_2(and_973_nl, mux_tmp_315, or_863_cse);
  and_974_nl <= nand_79_cse AND mux_tmp_316;
  mux_tmp_317 <= MUX_s_1_2_2(and_974_nl, mux_tmp_316, or_854_cse);
  and_975_nl <= nand_274_cse AND mux_tmp_317;
  mux_tmp_318 <= MUX_s_1_2_2(and_975_nl, mux_tmp_317, or_847_cse);
  and_976_nl <= nand_84_cse AND mux_tmp_318;
  mux_tmp_319 <= MUX_s_1_2_2(and_976_nl, mux_tmp_318, or_842_cse);
  nor_403_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_319));
  mux_322_nl <= MUX_s_1_2_2(nor_403_nl, mux_tmp_319, or_837_cse);
  and_dcpl_625 <= mux_322_nl AND and_dcpl_85 AND and_dcpl_99 AND (rem_12cyc_st_7_1_0(0));
  or_887_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_399_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_820));
  mux_tmp_321 <= MUX_s_1_2_2(nor_399_nl, or_tmp_820, or_887_cse);
  nor_400_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_321));
  mux_tmp_322 <= MUX_s_1_2_2(nor_400_nl, mux_tmp_321, or_874_cse);
  and_969_nl <= nand_267_cse AND mux_tmp_322;
  mux_tmp_323 <= MUX_s_1_2_2(and_969_nl, mux_tmp_322, or_863_cse);
  and_970_nl <= nand_79_cse AND mux_tmp_323;
  mux_tmp_324 <= MUX_s_1_2_2(and_970_nl, mux_tmp_323, or_854_cse);
  and_971_nl <= nand_274_cse AND mux_tmp_324;
  mux_tmp_325 <= MUX_s_1_2_2(and_971_nl, mux_tmp_324, or_847_cse);
  and_972_nl <= nand_84_cse AND mux_tmp_325;
  mux_tmp_326 <= MUX_s_1_2_2(and_972_nl, mux_tmp_325, or_842_cse);
  nor_401_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_326));
  mux_329_nl <= MUX_s_1_2_2(nor_401_nl, mux_tmp_326, or_837_cse);
  and_dcpl_628 <= mux_329_nl AND and_dcpl_58 AND and_dcpl_72 AND (rem_12cyc_st_8_1_0(0));
  or_902_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_395_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_820));
  mux_tmp_328 <= MUX_s_1_2_2(nor_395_nl, or_tmp_820, or_902_cse);
  nor_396_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_328));
  mux_tmp_329 <= MUX_s_1_2_2(nor_396_nl, mux_tmp_328, or_887_cse);
  nor_397_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_329));
  mux_tmp_330 <= MUX_s_1_2_2(nor_397_nl, mux_tmp_329, or_874_cse);
  and_965_nl <= nand_267_cse AND mux_tmp_330;
  mux_tmp_331 <= MUX_s_1_2_2(and_965_nl, mux_tmp_330, or_863_cse);
  and_966_nl <= nand_79_cse AND mux_tmp_331;
  mux_tmp_332 <= MUX_s_1_2_2(and_966_nl, mux_tmp_331, or_854_cse);
  and_967_nl <= nand_274_cse AND mux_tmp_332;
  mux_tmp_333 <= MUX_s_1_2_2(and_967_nl, mux_tmp_332, or_847_cse);
  and_968_nl <= nand_84_cse AND mux_tmp_333;
  mux_tmp_334 <= MUX_s_1_2_2(and_968_nl, mux_tmp_333, or_842_cse);
  nor_398_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_334));
  mux_337_nl <= MUX_s_1_2_2(nor_398_nl, mux_tmp_334, or_837_cse);
  and_dcpl_631 <= mux_337_nl AND and_dcpl_31 AND and_dcpl_45 AND (rem_12cyc_st_9_1_0(0));
  nor_390_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_820));
  or_919_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_336 <= MUX_s_1_2_2(nor_390_nl, or_tmp_820, or_919_nl);
  nor_391_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_336));
  mux_tmp_337 <= MUX_s_1_2_2(nor_391_nl, mux_tmp_336, or_902_cse);
  nor_392_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_337));
  mux_tmp_338 <= MUX_s_1_2_2(nor_392_nl, mux_tmp_337, or_887_cse);
  nor_393_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_338));
  mux_tmp_339 <= MUX_s_1_2_2(nor_393_nl, mux_tmp_338, or_874_cse);
  and_961_nl <= nand_267_cse AND mux_tmp_339;
  mux_tmp_340 <= MUX_s_1_2_2(and_961_nl, mux_tmp_339, or_863_cse);
  and_962_nl <= nand_79_cse AND mux_tmp_340;
  mux_tmp_341 <= MUX_s_1_2_2(and_962_nl, mux_tmp_340, or_854_cse);
  and_963_nl <= nand_274_cse AND mux_tmp_341;
  mux_tmp_342 <= MUX_s_1_2_2(and_963_nl, mux_tmp_341, or_847_cse);
  and_964_nl <= nand_84_cse AND mux_tmp_342;
  mux_tmp_343 <= MUX_s_1_2_2(and_964_nl, mux_tmp_342, or_842_cse);
  nor_394_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_343));
  mux_346_nl <= MUX_s_1_2_2(nor_394_nl, mux_tmp_343, or_837_cse);
  and_dcpl_634 <= mux_346_nl AND and_dcpl_4 AND and_dcpl_18 AND (rem_12cyc_st_10_1_0(0));
  or_tmp_921 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR (acc_1_tmp(1)) OR
      nand_250_cse;
  nor_380_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_921));
  or_938_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_345 <= MUX_s_1_2_2(nor_380_nl, or_tmp_921, or_938_nl);
  nor_381_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_345));
  or_937_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_346 <= MUX_s_1_2_2(nor_381_nl, mux_tmp_345, or_937_nl);
  nor_382_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_346));
  or_936_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_347 <= MUX_s_1_2_2(nor_382_nl, mux_tmp_346, or_936_nl);
  nor_383_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_347));
  or_935_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_348 <= MUX_s_1_2_2(nor_383_nl, mux_tmp_347, or_935_nl);
  nor_384_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_348));
  or_934_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_349 <= MUX_s_1_2_2(nor_384_nl, mux_tmp_348, or_934_nl);
  nor_385_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_349));
  or_933_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_350 <= MUX_s_1_2_2(nor_385_nl, mux_tmp_349, or_933_nl);
  nor_386_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_350));
  or_932_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_351 <= MUX_s_1_2_2(nor_386_nl, mux_tmp_350, or_932_nl);
  nor_387_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_351));
  or_931_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_352 <= MUX_s_1_2_2(nor_387_nl, mux_tmp_351, or_931_nl);
  nor_388_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_352));
  or_930_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_tmp_353 <= MUX_s_1_2_2(nor_388_nl, mux_tmp_352, or_930_nl);
  nor_389_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT mux_tmp_353));
  or_929_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_354 <= MUX_s_1_2_2(nor_389_nl, mux_tmp_353, or_929_nl);
  and_dcpl_638 <= and_dcpl_568 AND and_dcpl_393;
  and_dcpl_639 <= and_dcpl_570 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_934 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_952_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_379_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_934));
  mux_357_nl <= MUX_s_1_2_2(nor_379_nl, or_tmp_934, or_952_cse);
  and_dcpl_641 <= mux_357_nl AND and_dcpl_298 AND and_dcpl_639;
  and_dcpl_642 <= and_dcpl_574 AND (rem_12cyc_st_3_1_0(1));
  or_957_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_207 <= or_957_cse AND or_tmp_934;
  nor_378_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_207));
  mux_358_nl <= MUX_s_1_2_2(nor_378_nl, and_tmp_207, or_952_cse);
  and_dcpl_644 <= mux_358_nl AND and_dcpl_304 AND and_dcpl_642;
  and_dcpl_645 <= and_dcpl_578 AND (rem_12cyc_st_4_1_0(1));
  or_961_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_209 <= or_957_cse AND or_961_cse AND or_tmp_934;
  nor_377_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_209));
  mux_359_nl <= MUX_s_1_2_2(nor_377_nl, and_tmp_209, or_952_cse);
  and_dcpl_647 <= mux_359_nl AND and_dcpl_310 AND and_dcpl_645;
  and_dcpl_648 <= and_dcpl_582 AND (rem_12cyc_st_5_1_0(1));
  or_966_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_212 <= or_957_cse AND or_961_cse AND or_966_cse AND or_tmp_934;
  nor_376_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_212));
  mux_360_nl <= MUX_s_1_2_2(nor_376_nl, and_tmp_212, or_952_cse);
  and_dcpl_650 <= mux_360_nl AND and_dcpl_316 AND and_dcpl_648;
  or_972_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_216 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND or_tmp_934;
  nor_375_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_216));
  mux_361_nl <= MUX_s_1_2_2(nor_375_nl, and_tmp_216, or_952_cse);
  and_dcpl_653 <= mux_361_nl AND and_dcpl_112 AND and_dcpl_126 AND (rem_12cyc_st_6_1_0(1));
  or_979_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_373_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_934));
  mux_362_nl <= MUX_s_1_2_2(nor_373_nl, or_tmp_934, or_979_cse);
  and_tmp_220 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_362_nl;
  nor_374_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_220));
  mux_363_nl <= MUX_s_1_2_2(nor_374_nl, and_tmp_220, or_952_cse);
  and_dcpl_657 <= mux_363_nl AND and_dcpl_85 AND and_dcpl_104 AND (NOT (rem_12cyc_st_7_1_0(0)));
  or_988_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_370_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_934));
  mux_tmp_362 <= MUX_s_1_2_2(nor_370_nl, or_tmp_934, or_988_cse);
  nor_371_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_362));
  mux_365_nl <= MUX_s_1_2_2(nor_371_nl, mux_tmp_362, or_979_cse);
  and_tmp_224 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_365_nl;
  nor_372_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_224));
  mux_366_nl <= MUX_s_1_2_2(nor_372_nl, and_tmp_224, or_952_cse);
  and_dcpl_661 <= mux_366_nl AND and_dcpl_58 AND and_dcpl_77 AND (NOT (rem_12cyc_st_8_1_0(0)));
  or_999_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_366_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_934));
  mux_tmp_365 <= MUX_s_1_2_2(nor_366_nl, or_tmp_934, or_999_cse);
  nor_367_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_365));
  mux_tmp_366 <= MUX_s_1_2_2(nor_367_nl, mux_tmp_365, or_988_cse);
  nor_368_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_366));
  mux_369_nl <= MUX_s_1_2_2(nor_368_nl, mux_tmp_366, or_979_cse);
  and_tmp_228 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_369_nl;
  nor_369_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_228));
  mux_370_nl <= MUX_s_1_2_2(nor_369_nl, and_tmp_228, or_952_cse);
  and_dcpl_665 <= mux_370_nl AND and_dcpl_31 AND and_dcpl_50 AND (NOT (rem_12cyc_st_9_1_0(0)));
  nor_361_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_934));
  or_1012_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_369 <= MUX_s_1_2_2(nor_361_nl, or_tmp_934, or_1012_nl);
  nor_362_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_369));
  mux_tmp_370 <= MUX_s_1_2_2(nor_362_nl, mux_tmp_369, or_999_cse);
  nor_363_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_370));
  mux_tmp_371 <= MUX_s_1_2_2(nor_363_nl, mux_tmp_370, or_988_cse);
  nor_364_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_371));
  mux_374_nl <= MUX_s_1_2_2(nor_364_nl, mux_tmp_371, or_979_cse);
  and_tmp_232 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_374_nl;
  nor_365_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_232));
  mux_375_nl <= MUX_s_1_2_2(nor_365_nl, and_tmp_232, or_952_cse);
  and_dcpl_669 <= mux_375_nl AND and_dcpl_4 AND and_dcpl_23 AND (NOT (rem_12cyc_st_10_1_0(0)));
  or_tmp_1009 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_1_tmp(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat);
  nor_352_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_1009));
  or_1027_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_374 <= MUX_s_1_2_2(nor_352_nl, or_tmp_1009, or_1027_nl);
  nor_353_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_374));
  or_1026_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_375 <= MUX_s_1_2_2(nor_353_nl, mux_tmp_374, or_1026_nl);
  nor_354_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_375));
  or_1025_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_376 <= MUX_s_1_2_2(nor_354_nl, mux_tmp_375, or_1025_nl);
  nor_355_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_376));
  or_1024_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_377 <= MUX_s_1_2_2(nor_355_nl, mux_tmp_376, or_1024_nl);
  nor_356_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_377));
  or_1023_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_378 <= MUX_s_1_2_2(nor_356_nl, mux_tmp_377, or_1023_nl);
  nor_357_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_378));
  or_1022_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_379 <= MUX_s_1_2_2(nor_357_nl, mux_tmp_378, or_1022_nl);
  nor_358_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_379));
  or_1021_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_380 <= MUX_s_1_2_2(nor_358_nl, mux_tmp_379, or_1021_nl);
  nor_359_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_380));
  or_1020_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_381 <= MUX_s_1_2_2(nor_359_nl, mux_tmp_380, or_1020_nl);
  nor_360_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_381));
  or_1019_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_384_nl <= MUX_s_1_2_2(nor_360_nl, mux_tmp_381, or_1019_nl);
  and_tmp_233 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND mux_384_nl;
  and_dcpl_673 <= and_dcpl_568 AND and_dcpl_430;
  or_tmp_1021 <= (NOT(CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(rem_12cyc_3_2=STD_LOGIC_VECTOR'("10"))))
      OR not_tmp_54;
  nand_57_cse <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(acc_tmp=STD_LOGIC_VECTOR'("10")));
  nor_351_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_1021));
  mux_385_nl <= MUX_s_1_2_2(nor_351_nl, or_tmp_1021, nand_57_cse);
  and_dcpl_675 <= mux_385_nl AND and_dcpl_358 AND and_dcpl_639;
  or_1045_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR (rem_12cyc_st_2_3_2(0));
  and_960_nl <= nand_84_cse AND or_tmp_1021;
  mux_tmp_384 <= MUX_s_1_2_2(and_960_nl, or_tmp_1021, or_1045_cse);
  nor_350_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_384));
  mux_387_nl <= MUX_s_1_2_2(nor_350_nl, mux_tmp_384, nand_57_cse);
  and_dcpl_677 <= mux_387_nl AND and_dcpl_362 AND and_dcpl_642;
  or_1050_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"));
  and_958_nl <= nand_274_cse AND or_tmp_1021;
  mux_tmp_386 <= MUX_s_1_2_2(and_958_nl, or_tmp_1021, or_1050_cse);
  and_959_nl <= nand_84_cse AND mux_tmp_386;
  mux_tmp_387 <= MUX_s_1_2_2(and_959_nl, mux_tmp_386, or_1045_cse);
  nor_349_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_387));
  mux_390_nl <= MUX_s_1_2_2(nor_349_nl, mux_tmp_387, nand_57_cse);
  and_dcpl_679 <= mux_390_nl AND and_dcpl_366 AND and_dcpl_645;
  or_1057_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR (rem_12cyc_st_4_3_2(0));
  and_955_nl <= nand_79_cse AND or_tmp_1021;
  mux_tmp_389 <= MUX_s_1_2_2(and_955_nl, or_tmp_1021, or_1057_cse);
  and_956_nl <= nand_274_cse AND mux_tmp_389;
  mux_tmp_390 <= MUX_s_1_2_2(and_956_nl, mux_tmp_389, or_1050_cse);
  and_957_nl <= nand_84_cse AND mux_tmp_390;
  mux_tmp_391 <= MUX_s_1_2_2(and_957_nl, mux_tmp_390, or_1045_cse);
  nor_348_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_391));
  mux_394_nl <= MUX_s_1_2_2(nor_348_nl, mux_tmp_391, nand_57_cse);
  and_dcpl_681 <= mux_394_nl AND and_dcpl_370 AND and_dcpl_648;
  or_1066_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"));
  and_951_nl <= nand_267_cse AND or_tmp_1021;
  mux_tmp_393 <= MUX_s_1_2_2(and_951_nl, or_tmp_1021, or_1066_cse);
  and_952_nl <= nand_79_cse AND mux_tmp_393;
  mux_tmp_394 <= MUX_s_1_2_2(and_952_nl, mux_tmp_393, or_1057_cse);
  and_953_nl <= nand_274_cse AND mux_tmp_394;
  mux_tmp_395 <= MUX_s_1_2_2(and_953_nl, mux_tmp_394, or_1050_cse);
  and_954_nl <= nand_84_cse AND mux_tmp_395;
  mux_tmp_396 <= MUX_s_1_2_2(and_954_nl, mux_tmp_395, or_1045_cse);
  nor_347_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_396));
  mux_399_nl <= MUX_s_1_2_2(nor_347_nl, mux_tmp_396, nand_57_cse);
  and_dcpl_684 <= mux_399_nl AND and_dcpl_112 AND and_dcpl_129 AND (rem_12cyc_st_6_1_0(1));
  nand_36_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_6_3_2=STD_LOGIC_VECTOR'("10")));
  nor_345_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_1021));
  mux_tmp_398 <= MUX_s_1_2_2(nor_345_nl, or_tmp_1021, nand_36_cse);
  and_947_nl <= nand_267_cse AND mux_tmp_398;
  mux_tmp_399 <= MUX_s_1_2_2(and_947_nl, mux_tmp_398, or_1066_cse);
  and_948_nl <= nand_79_cse AND mux_tmp_399;
  mux_tmp_400 <= MUX_s_1_2_2(and_948_nl, mux_tmp_399, or_1057_cse);
  and_949_nl <= nand_274_cse AND mux_tmp_400;
  mux_tmp_401 <= MUX_s_1_2_2(and_949_nl, mux_tmp_400, or_1050_cse);
  and_950_nl <= nand_84_cse AND mux_tmp_401;
  mux_tmp_402 <= MUX_s_1_2_2(and_950_nl, mux_tmp_401, or_1045_cse);
  nor_346_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_402));
  mux_405_nl <= MUX_s_1_2_2(nor_346_nl, mux_tmp_402, nand_57_cse);
  and_dcpl_687 <= mux_405_nl AND and_dcpl_85 AND and_dcpl_104 AND (rem_12cyc_st_7_1_0(0));
  nand_29_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_7_3_2=STD_LOGIC_VECTOR'("10")));
  nor_342_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_1021));
  mux_tmp_404 <= MUX_s_1_2_2(nor_342_nl, or_tmp_1021, nand_29_cse);
  nor_343_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_404));
  mux_tmp_405 <= MUX_s_1_2_2(nor_343_nl, mux_tmp_404, nand_36_cse);
  and_943_nl <= nand_267_cse AND mux_tmp_405;
  mux_tmp_406 <= MUX_s_1_2_2(and_943_nl, mux_tmp_405, or_1066_cse);
  and_944_nl <= nand_79_cse AND mux_tmp_406;
  mux_tmp_407 <= MUX_s_1_2_2(and_944_nl, mux_tmp_406, or_1057_cse);
  and_945_nl <= nand_274_cse AND mux_tmp_407;
  mux_tmp_408 <= MUX_s_1_2_2(and_945_nl, mux_tmp_407, or_1050_cse);
  and_946_nl <= nand_84_cse AND mux_tmp_408;
  mux_tmp_409 <= MUX_s_1_2_2(and_946_nl, mux_tmp_408, or_1045_cse);
  nor_344_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_409));
  mux_412_nl <= MUX_s_1_2_2(nor_344_nl, mux_tmp_409, nand_57_cse);
  and_dcpl_690 <= mux_412_nl AND and_dcpl_58 AND and_dcpl_77 AND (rem_12cyc_st_8_1_0(0));
  nand_21_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_8_3_2=STD_LOGIC_VECTOR'("10")));
  nor_338_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_1021));
  mux_tmp_411 <= MUX_s_1_2_2(nor_338_nl, or_tmp_1021, nand_21_cse);
  nor_339_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_411));
  mux_tmp_412 <= MUX_s_1_2_2(nor_339_nl, mux_tmp_411, nand_29_cse);
  nor_340_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_412));
  mux_tmp_413 <= MUX_s_1_2_2(nor_340_nl, mux_tmp_412, nand_36_cse);
  and_939_nl <= nand_267_cse AND mux_tmp_413;
  mux_tmp_414 <= MUX_s_1_2_2(and_939_nl, mux_tmp_413, or_1066_cse);
  and_940_nl <= nand_79_cse AND mux_tmp_414;
  mux_tmp_415 <= MUX_s_1_2_2(and_940_nl, mux_tmp_414, or_1057_cse);
  and_941_nl <= nand_274_cse AND mux_tmp_415;
  mux_tmp_416 <= MUX_s_1_2_2(and_941_nl, mux_tmp_415, or_1050_cse);
  and_942_nl <= nand_84_cse AND mux_tmp_416;
  mux_tmp_417 <= MUX_s_1_2_2(and_942_nl, mux_tmp_416, or_1045_cse);
  nor_341_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_417));
  mux_420_nl <= MUX_s_1_2_2(nor_341_nl, mux_tmp_417, nand_57_cse);
  and_dcpl_693 <= mux_420_nl AND and_dcpl_31 AND and_dcpl_50 AND (rem_12cyc_st_9_1_0(0));
  nor_333_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_1021));
  nand_12_nl <= NOT(CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(rem_12cyc_st_9_3_2=STD_LOGIC_VECTOR'("10")));
  mux_tmp_419 <= MUX_s_1_2_2(nor_333_nl, or_tmp_1021, nand_12_nl);
  nor_334_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_419));
  mux_tmp_420 <= MUX_s_1_2_2(nor_334_nl, mux_tmp_419, nand_21_cse);
  nor_335_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_420));
  mux_tmp_421 <= MUX_s_1_2_2(nor_335_nl, mux_tmp_420, nand_29_cse);
  nor_336_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_421));
  mux_tmp_422 <= MUX_s_1_2_2(nor_336_nl, mux_tmp_421, nand_36_cse);
  and_935_nl <= nand_267_cse AND mux_tmp_422;
  mux_tmp_423 <= MUX_s_1_2_2(and_935_nl, mux_tmp_422, or_1066_cse);
  and_936_nl <= nand_79_cse AND mux_tmp_423;
  mux_tmp_424 <= MUX_s_1_2_2(and_936_nl, mux_tmp_423, or_1057_cse);
  and_937_nl <= nand_274_cse AND mux_tmp_424;
  mux_tmp_425 <= MUX_s_1_2_2(and_937_nl, mux_tmp_424, or_1050_cse);
  and_938_nl <= nand_84_cse AND mux_tmp_425;
  mux_tmp_426 <= MUX_s_1_2_2(and_938_nl, mux_tmp_425, or_1045_cse);
  nor_337_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_426));
  mux_429_nl <= MUX_s_1_2_2(nor_337_nl, mux_tmp_426, nand_57_cse);
  and_dcpl_696 <= mux_429_nl AND and_dcpl_4 AND and_dcpl_23 AND (rem_12cyc_st_10_1_0(0));
  or_tmp_1122 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR nand_222_cse;
  nor_324_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_1122));
  nand_1_nl <= NOT(main_stage_0_11 AND asn_itm_10 AND CONV_SL_1_1(rem_12cyc_st_10_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_10_3_2(0))));
  mux_tmp_428 <= MUX_s_1_2_2(nor_324_nl, or_tmp_1122, nand_1_nl);
  nor_325_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_428));
  nand_2_nl <= NOT(main_stage_0_7 AND asn_itm_6 AND CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_6_3_2(0))));
  mux_tmp_429 <= MUX_s_1_2_2(nor_325_nl, mux_tmp_428, nand_2_nl);
  nor_326_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_429));
  nand_3_nl <= NOT(main_stage_0_6 AND asn_itm_5 AND CONV_SL_1_1(rem_12cyc_st_5_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_5_3_2(0))));
  mux_tmp_430 <= MUX_s_1_2_2(nor_326_nl, mux_tmp_429, nand_3_nl);
  nor_327_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_430));
  nand_4_nl <= NOT(main_stage_0_5 AND asn_itm_4 AND CONV_SL_1_1(rem_12cyc_st_4_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_4_3_2(0))));
  mux_tmp_431 <= MUX_s_1_2_2(nor_327_nl, mux_tmp_430, nand_4_nl);
  nor_328_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_431));
  nand_5_nl <= NOT(main_stage_0_4 AND asn_itm_3 AND CONV_SL_1_1(rem_12cyc_st_3_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_3_3_2(0))));
  mux_tmp_432 <= MUX_s_1_2_2(nor_328_nl, mux_tmp_431, nand_5_nl);
  nor_329_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_432));
  nand_6_nl <= NOT(main_stage_0_3 AND asn_itm_2 AND CONV_SL_1_1(rem_12cyc_st_2_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_2_3_2(0))));
  mux_tmp_433 <= MUX_s_1_2_2(nor_329_nl, mux_tmp_432, nand_6_nl);
  nor_330_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_433));
  nand_7_nl <= NOT(main_stage_0_10 AND asn_itm_9 AND CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_9_3_2(0))));
  mux_tmp_434 <= MUX_s_1_2_2(nor_330_nl, mux_tmp_433, nand_7_nl);
  nor_331_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_434));
  nand_8_nl <= NOT(main_stage_0_9 AND asn_itm_8 AND CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_8_3_2(0))));
  mux_tmp_435 <= MUX_s_1_2_2(nor_331_nl, mux_tmp_434, nand_8_nl);
  nor_332_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_435));
  nand_9_nl <= NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_7_3_2(0))));
  mux_tmp_436 <= MUX_s_1_2_2(nor_332_nl, mux_tmp_435, nand_9_nl);
  and_934_nl <= nand_223_cse AND mux_tmp_436;
  nand_11_nl <= NOT(main_stage_0_2 AND asn_itm_1 AND CONV_SL_1_1(rem_12cyc_3_2=STD_LOGIC_VECTOR'("10")));
  mux_tmp_437 <= MUX_s_1_2_2(and_934_nl, mux_tmp_436, nand_11_nl);
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_64_2_2(result_sva_duc_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(qelse_acc_nl),
            64)), mux_13_nl);
        m_buf_sva_12 <= m_buf_sva_11;
        m_buf_sva_11 <= m_buf_sva_10;
        m_buf_sva_10 <= m_buf_sva_9;
        m_buf_sva_9 <= m_buf_sva_8;
        m_buf_sva_8 <= m_buf_sva_7;
        m_buf_sva_7 <= m_buf_sva_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        asn_itm_12 <= '0';
        asn_itm_11 <= '0';
        asn_itm_10 <= '0';
        asn_itm_9 <= '0';
        asn_itm_8 <= '0';
        asn_itm_7 <= '0';
        asn_itm_6 <= '0';
        asn_itm_5 <= '0';
        asn_itm_4 <= '0';
        asn_itm_3 <= '0';
        asn_itm_2 <= '0';
        asn_itm_1 <= '0';
        main_stage_0_2 <= '0';
        main_stage_0_3 <= '0';
        main_stage_0_4 <= '0';
        main_stage_0_5 <= '0';
        main_stage_0_6 <= '0';
        main_stage_0_7 <= '0';
        main_stage_0_8 <= '0';
        main_stage_0_9 <= '0';
        main_stage_0_10 <= '0';
        main_stage_0_11 <= '0';
        main_stage_0_12 <= '0';
        main_stage_0_13 <= '0';
      ELSIF ( ccs_ccore_en = '1' ) THEN
        asn_itm_12 <= asn_itm_11;
        asn_itm_11 <= asn_itm_10;
        asn_itm_10 <= asn_itm_9;
        asn_itm_9 <= asn_itm_8;
        asn_itm_8 <= asn_itm_7;
        asn_itm_7 <= asn_itm_6;
        asn_itm_6 <= asn_itm_5;
        asn_itm_5 <= asn_itm_4;
        asn_itm_4 <= asn_itm_3;
        asn_itm_3 <= asn_itm_2;
        asn_itm_2 <= asn_itm_1;
        asn_itm_1 <= ccs_ccore_start_rsci_idat;
        main_stage_0_2 <= '1';
        main_stage_0_3 <= main_stage_0_2;
        main_stage_0_4 <= main_stage_0_3;
        main_stage_0_5 <= main_stage_0_4;
        main_stage_0_6 <= main_stage_0_5;
        main_stage_0_7 <= main_stage_0_6;
        main_stage_0_8 <= main_stage_0_7;
        main_stage_0_9 <= main_stage_0_8;
        main_stage_0_10 <= main_stage_0_9;
        main_stage_0_11 <= main_stage_0_10;
        main_stage_0_12 <= main_stage_0_11;
        main_stage_0_13 <= main_stage_0_12;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_sva_duc <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (asn_itm_12 AND main_stage_0_13 AND ccs_ccore_en AND (NOT(CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("11")))))
          = '1' ) THEN
        result_sva_duc <= result_sva_duc_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_12_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_12_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1203_cse = '1' ) THEN
        rem_12cyc_st_12_3_2 <= rem_12cyc_st_11_3_2;
        rem_12cyc_st_12_1_0 <= rem_12cyc_st_11_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1173_cse = '1' ) THEN
        rem_13_cmp_1_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_3_2_63_0, mut_3_3_63_0,
            mut_3_4_63_0, mut_3_5_63_0, mut_3_6_63_0, mut_3_7_63_0, mut_3_8_63_0,
            mut_3_9_63_0, mut_3_10_63_0, mut_3_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_294
            & and_dcpl_300 & and_dcpl_306 & and_dcpl_312 & and_dcpl_318 & and_dcpl_324
            & and_dcpl_330 & and_dcpl_336 & and_dcpl_342 & and_dcpl_348 & and_tmp_35));
        rem_13_cmp_1_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_2_63_0, mut_2_3_63_0,
            mut_2_4_63_0, mut_2_5_63_0, mut_2_6_63_0, mut_2_7_63_0, mut_2_8_63_0,
            mut_2_9_63_0, mut_2_10_63_0, mut_2_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_294
            & and_dcpl_300 & and_dcpl_306 & and_dcpl_312 & and_dcpl_318 & and_dcpl_324
            & and_dcpl_330 & and_dcpl_336 & and_dcpl_342 & and_dcpl_348 & and_tmp_35));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1175_cse = '1' ) THEN
        rem_13_cmp_2_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_5_2_63_0, mut_5_3_63_0,
            mut_5_4_63_0, mut_5_5_63_0, mut_5_6_63_0, mut_5_7_63_0, mut_5_8_63_0,
            mut_5_9_63_0, mut_5_10_63_0, mut_5_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_356
            & and_dcpl_360 & and_dcpl_364 & and_dcpl_368 & and_dcpl_372 & and_dcpl_376
            & and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_388 & mux_tmp_76));
        rem_13_cmp_2_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_4_2_63_0, mut_4_3_63_0,
            mut_4_4_63_0, mut_4_5_63_0, mut_4_6_63_0, mut_4_7_63_0, mut_4_8_63_0,
            mut_4_9_63_0, mut_4_10_63_0, mut_4_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_356
            & and_dcpl_360 & and_dcpl_364 & and_dcpl_368 & and_dcpl_372 & and_dcpl_376
            & and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_388 & mux_tmp_76));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1177_cse = '1' ) THEN
        rem_13_cmp_3_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_7_2_63_0, mut_7_3_63_0,
            mut_7_4_63_0, mut_7_5_63_0, mut_7_6_63_0, mut_7_7_63_0, mut_7_8_63_0,
            mut_7_9_63_0, mut_7_10_63_0, mut_7_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_394
            & and_dcpl_397 & and_dcpl_400 & and_dcpl_403 & and_dcpl_406 & and_dcpl_409
            & and_dcpl_413 & and_dcpl_417 & and_dcpl_421 & and_dcpl_425 & and_tmp_80));
        rem_13_cmp_3_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_6_2_63_0, mut_6_3_63_0,
            mut_6_4_63_0, mut_6_5_63_0, mut_6_6_63_0, mut_6_7_63_0, mut_6_8_63_0,
            mut_6_9_63_0, mut_6_10_63_0, mut_6_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_394
            & and_dcpl_397 & and_dcpl_400 & and_dcpl_403 & and_dcpl_406 & and_dcpl_409
            & and_dcpl_413 & and_dcpl_417 & and_dcpl_421 & and_dcpl_425 & and_tmp_80));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1179_cse = '1' ) THEN
        rem_13_cmp_4_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_9_2_63_0, mut_9_3_63_0,
            mut_9_4_63_0, mut_9_5_63_0, mut_9_6_63_0, mut_9_7_63_0, mut_9_8_63_0,
            mut_9_9_63_0, mut_9_10_63_0, mut_9_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_431
            & and_dcpl_433 & and_dcpl_435 & and_dcpl_437 & and_dcpl_439 & and_dcpl_442
            & and_dcpl_445 & and_dcpl_448 & and_dcpl_451 & and_dcpl_454 & mux_tmp_141));
        rem_13_cmp_4_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_8_2_63_0, mut_8_3_63_0,
            mut_8_4_63_0, mut_8_5_63_0, mut_8_6_63_0, mut_8_7_63_0, mut_8_8_63_0,
            mut_8_9_63_0, mut_8_10_63_0, mut_8_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_431
            & and_dcpl_433 & and_dcpl_435 & and_dcpl_437 & and_dcpl_439 & and_dcpl_442
            & and_dcpl_445 & and_dcpl_448 & and_dcpl_451 & and_dcpl_454 & mux_tmp_141));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1181_cse = '1' ) THEN
        rem_13_cmp_5_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_11_2_63_0, mut_11_3_63_0,
            mut_11_4_63_0, mut_11_5_63_0, mut_11_6_63_0, mut_11_7_63_0, mut_11_8_63_0,
            mut_11_9_63_0, mut_11_10_63_0, mut_11_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_461
            & and_dcpl_465 & and_dcpl_469 & and_dcpl_473 & and_dcpl_477 & and_dcpl_480
            & and_dcpl_483 & and_dcpl_486 & and_dcpl_489 & and_dcpl_492 & and_tmp_125));
        rem_13_cmp_5_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_10_2_63_0, mut_10_3_63_0,
            mut_10_4_63_0, mut_10_5_63_0, mut_10_6_63_0, mut_10_7_63_0, mut_10_8_63_0,
            mut_10_9_63_0, mut_10_10_63_0, mut_10_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_461
            & and_dcpl_465 & and_dcpl_469 & and_dcpl_473 & and_dcpl_477 & and_dcpl_480
            & and_dcpl_483 & and_dcpl_486 & and_dcpl_489 & and_dcpl_492 & and_tmp_125));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1183_cse = '1' ) THEN
        rem_13_cmp_6_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_13_2_63_0, mut_13_3_63_0,
            mut_13_4_63_0, mut_13_5_63_0, mut_13_6_63_0, mut_13_7_63_0, mut_13_8_63_0,
            mut_13_9_63_0, mut_13_10_63_0, mut_13_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_498
            & and_dcpl_500 & and_dcpl_502 & and_dcpl_504 & and_dcpl_506 & and_dcpl_508
            & and_dcpl_510 & and_dcpl_512 & and_dcpl_514 & and_dcpl_516 & mux_tmp_206));
        rem_13_cmp_6_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_12_2_63_0, mut_12_3_63_0,
            mut_12_4_63_0, mut_12_5_63_0, mut_12_6_63_0, mut_12_7_63_0, mut_12_8_63_0,
            mut_12_9_63_0, mut_12_10_63_0, mut_12_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_498
            & and_dcpl_500 & and_dcpl_502 & and_dcpl_504 & and_dcpl_506 & and_dcpl_508
            & and_dcpl_510 & and_dcpl_512 & and_dcpl_514 & and_dcpl_516 & mux_tmp_206));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1185_cse = '1' ) THEN
        rem_13_cmp_7_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_15_2_63_0, mut_15_3_63_0,
            mut_15_4_63_0, mut_15_5_63_0, mut_15_6_63_0, mut_15_7_63_0, mut_15_8_63_0,
            mut_15_9_63_0, mut_15_10_63_0, mut_15_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_520
            & and_dcpl_523 & and_dcpl_526 & and_dcpl_529 & and_dcpl_532 & and_dcpl_534
            & and_dcpl_536 & and_dcpl_538 & and_dcpl_540 & and_dcpl_542 & and_tmp_170));
        rem_13_cmp_7_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_14_2_63_0, mut_14_3_63_0,
            mut_14_4_63_0, mut_14_5_63_0, mut_14_6_63_0, mut_14_7_63_0, mut_14_8_63_0,
            mut_14_9_63_0, mut_14_10_63_0, mut_14_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_520
            & and_dcpl_523 & and_dcpl_526 & and_dcpl_529 & and_dcpl_532 & and_dcpl_534
            & and_dcpl_536 & and_dcpl_538 & and_dcpl_540 & and_dcpl_542 & and_tmp_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1187_cse = '1' ) THEN
        rem_13_cmp_8_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_17_2_63_0, mut_17_3_63_0,
            mut_17_4_63_0, mut_17_5_63_0, mut_17_6_63_0, mut_17_7_63_0, mut_17_8_63_0,
            mut_17_9_63_0, mut_17_10_63_0, mut_17_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_546
            & and_dcpl_548 & and_dcpl_550 & and_dcpl_552 & and_dcpl_554 & and_dcpl_556
            & and_dcpl_558 & and_dcpl_560 & and_dcpl_562 & and_dcpl_564 & mux_tmp_271));
        rem_13_cmp_8_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_16_2_63_0, mut_16_3_63_0,
            mut_16_4_63_0, mut_16_5_63_0, mut_16_6_63_0, mut_16_7_63_0, mut_16_8_63_0,
            mut_16_9_63_0, mut_16_10_63_0, mut_16_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_546
            & and_dcpl_548 & and_dcpl_550 & and_dcpl_552 & and_dcpl_554 & and_dcpl_556
            & and_dcpl_558 & and_dcpl_560 & and_dcpl_562 & and_dcpl_564 & mux_tmp_271));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1189_cse = '1' ) THEN
        rem_13_cmp_9_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_19_2_63_0, mut_19_3_63_0,
            mut_19_4_63_0, mut_19_5_63_0, mut_19_6_63_0, mut_19_7_63_0, mut_19_8_63_0,
            mut_19_9_63_0, mut_19_10_63_0, mut_19_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_569
            & and_dcpl_573 & and_dcpl_577 & and_dcpl_581 & and_dcpl_585 & and_dcpl_589
            & and_dcpl_593 & and_dcpl_597 & and_dcpl_601 & and_dcpl_605 & and_tmp_206));
        rem_13_cmp_9_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_18_2_63_0, mut_18_3_63_0,
            mut_18_4_63_0, mut_18_5_63_0, mut_18_6_63_0, mut_18_7_63_0, mut_18_8_63_0,
            mut_18_9_63_0, mut_18_10_63_0, mut_18_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_569
            & and_dcpl_573 & and_dcpl_577 & and_dcpl_581 & and_dcpl_585 & and_dcpl_589
            & and_dcpl_593 & and_dcpl_597 & and_dcpl_601 & and_dcpl_605 & and_tmp_206));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1191_cse = '1' ) THEN
        rem_13_cmp_10_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_21_2_63_0, mut_21_3_63_0,
            mut_21_4_63_0, mut_21_5_63_0, mut_21_6_63_0, mut_21_7_63_0, mut_21_8_63_0,
            mut_21_9_63_0, mut_21_10_63_0, mut_21_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_610
            & and_dcpl_612 & and_dcpl_614 & and_dcpl_616 & and_dcpl_618 & and_dcpl_622
            & and_dcpl_625 & and_dcpl_628 & and_dcpl_631 & and_dcpl_634 & mux_tmp_354));
        rem_13_cmp_10_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_20_2_63_0,
            mut_20_3_63_0, mut_20_4_63_0, mut_20_5_63_0, mut_20_6_63_0, mut_20_7_63_0,
            mut_20_8_63_0, mut_20_9_63_0, mut_20_10_63_0, mut_20_11_63_0, STD_LOGIC_VECTOR'(
            and_dcpl_610 & and_dcpl_612 & and_dcpl_614 & and_dcpl_616 & and_dcpl_618
            & and_dcpl_622 & and_dcpl_625 & and_dcpl_628 & and_dcpl_631 & and_dcpl_634
            & mux_tmp_354));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1193_cse = '1' ) THEN
        rem_13_cmp_11_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_23_2_63_0, mut_23_3_63_0,
            mut_23_4_63_0, mut_23_5_63_0, mut_23_6_63_0, mut_23_7_63_0, mut_23_8_63_0,
            mut_23_9_63_0, mut_23_10_63_0, mut_23_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_638
            & and_dcpl_641 & and_dcpl_644 & and_dcpl_647 & and_dcpl_650 & and_dcpl_653
            & and_dcpl_657 & and_dcpl_661 & and_dcpl_665 & and_dcpl_669 & and_tmp_233));
        rem_13_cmp_11_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_22_2_63_0,
            mut_22_3_63_0, mut_22_4_63_0, mut_22_5_63_0, mut_22_6_63_0, mut_22_7_63_0,
            mut_22_8_63_0, mut_22_9_63_0, mut_22_10_63_0, mut_22_11_63_0, STD_LOGIC_VECTOR'(
            and_dcpl_638 & and_dcpl_641 & and_dcpl_644 & and_dcpl_647 & and_dcpl_650
            & and_dcpl_653 & and_dcpl_657 & and_dcpl_661 & and_dcpl_665 & and_dcpl_669
            & and_tmp_233));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1195_cse = '1' ) THEN
        rem_13_cmp_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_1_2_63_0, mut_1_3_63_0,
            mut_1_4_63_0, mut_1_5_63_0, mut_1_6_63_0, mut_1_7_63_0, mut_1_8_63_0,
            mut_1_9_63_0, mut_1_10_63_0, mut_1_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_673
            & and_dcpl_675 & and_dcpl_677 & and_dcpl_679 & and_dcpl_681 & and_dcpl_684
            & and_dcpl_687 & and_dcpl_690 & and_dcpl_693 & and_dcpl_696 & mux_tmp_437));
        rem_13_cmp_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_63_0, mut_3_63_0,
            mut_4_63_0, mut_5_63_0, mut_6_63_0, mut_7_63_0, mut_8_63_0, mut_9_63_0,
            mut_10_63_0, mut_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_673 & and_dcpl_675
            & and_dcpl_677 & and_dcpl_679 & and_dcpl_681 & and_dcpl_684 & and_dcpl_687
            & and_dcpl_690 & and_dcpl_693 & and_dcpl_696 & mux_tmp_437));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1205_cse = '1' ) THEN
        mut_3_11_63_0 <= mut_3_10_63_0;
        mut_2_11_63_0 <= mut_2_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1207_cse = '1' ) THEN
        mut_5_11_63_0 <= mut_5_10_63_0;
        mut_4_11_63_0 <= mut_4_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1209_cse = '1' ) THEN
        mut_7_11_63_0 <= mut_7_10_63_0;
        mut_6_11_63_0 <= mut_6_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1211_cse = '1' ) THEN
        mut_9_11_63_0 <= mut_9_10_63_0;
        mut_8_11_63_0 <= mut_8_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1213_cse = '1' ) THEN
        mut_11_11_63_0 <= mut_11_10_63_0;
        mut_10_11_63_0 <= mut_10_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1215_cse = '1' ) THEN
        mut_13_11_63_0 <= mut_13_10_63_0;
        mut_12_11_63_0 <= mut_12_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1217_cse = '1' ) THEN
        mut_15_11_63_0 <= mut_15_10_63_0;
        mut_14_11_63_0 <= mut_14_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1219_cse = '1' ) THEN
        mut_17_11_63_0 <= mut_17_10_63_0;
        mut_16_11_63_0 <= mut_16_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1221_cse = '1' ) THEN
        mut_19_11_63_0 <= mut_19_10_63_0;
        mut_18_11_63_0 <= mut_18_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1223_cse = '1' ) THEN
        mut_21_11_63_0 <= mut_21_10_63_0;
        mut_20_11_63_0 <= mut_20_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1225_cse = '1' ) THEN
        mut_23_11_63_0 <= mut_23_10_63_0;
        mut_22_11_63_0 <= mut_22_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1227_cse = '1' ) THEN
        mut_1_11_63_0 <= mut_1_10_63_0;
        mut_11_63_0 <= mut_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_11_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_11_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1229_cse = '1' ) THEN
        rem_12cyc_st_11_3_2 <= rem_12cyc_st_10_3_2;
        rem_12cyc_st_11_1_0 <= rem_12cyc_st_10_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1231_cse = '1' ) THEN
        mut_3_10_63_0 <= mut_3_9_63_0;
        mut_2_10_63_0 <= mut_2_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1233_cse = '1' ) THEN
        mut_5_10_63_0 <= mut_5_9_63_0;
        mut_4_10_63_0 <= mut_4_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1235_cse = '1' ) THEN
        mut_7_10_63_0 <= mut_7_9_63_0;
        mut_6_10_63_0 <= mut_6_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1237_cse = '1' ) THEN
        mut_9_10_63_0 <= mut_9_9_63_0;
        mut_8_10_63_0 <= mut_8_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1239_cse = '1' ) THEN
        mut_11_10_63_0 <= mut_11_9_63_0;
        mut_10_10_63_0 <= mut_10_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1241_cse = '1' ) THEN
        mut_13_10_63_0 <= mut_13_9_63_0;
        mut_12_10_63_0 <= mut_12_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1243_cse = '1' ) THEN
        mut_15_10_63_0 <= mut_15_9_63_0;
        mut_14_10_63_0 <= mut_14_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1245_cse = '1' ) THEN
        mut_17_10_63_0 <= mut_17_9_63_0;
        mut_16_10_63_0 <= mut_16_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1247_cse = '1' ) THEN
        mut_19_10_63_0 <= mut_19_9_63_0;
        mut_18_10_63_0 <= mut_18_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1249_cse = '1' ) THEN
        mut_21_10_63_0 <= mut_21_9_63_0;
        mut_20_10_63_0 <= mut_20_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1251_cse = '1' ) THEN
        mut_23_10_63_0 <= mut_23_9_63_0;
        mut_22_10_63_0 <= mut_22_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1253_cse = '1' ) THEN
        mut_1_10_63_0 <= mut_1_9_63_0;
        mut_10_63_0 <= mut_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_10_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_10_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1255_cse = '1' ) THEN
        rem_12cyc_st_10_3_2 <= rem_12cyc_st_9_3_2;
        rem_12cyc_st_10_1_0 <= rem_12cyc_st_9_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1257_cse = '1' ) THEN
        mut_3_9_63_0 <= mut_3_8_63_0;
        mut_2_9_63_0 <= mut_2_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1259_cse = '1' ) THEN
        mut_5_9_63_0 <= mut_5_8_63_0;
        mut_4_9_63_0 <= mut_4_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1261_cse = '1' ) THEN
        mut_7_9_63_0 <= mut_7_8_63_0;
        mut_6_9_63_0 <= mut_6_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1263_cse = '1' ) THEN
        mut_9_9_63_0 <= mut_9_8_63_0;
        mut_8_9_63_0 <= mut_8_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1265_cse = '1' ) THEN
        mut_11_9_63_0 <= mut_11_8_63_0;
        mut_10_9_63_0 <= mut_10_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1267_cse = '1' ) THEN
        mut_13_9_63_0 <= mut_13_8_63_0;
        mut_12_9_63_0 <= mut_12_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1269_cse = '1' ) THEN
        mut_15_9_63_0 <= mut_15_8_63_0;
        mut_14_9_63_0 <= mut_14_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1271_cse = '1' ) THEN
        mut_17_9_63_0 <= mut_17_8_63_0;
        mut_16_9_63_0 <= mut_16_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1273_cse = '1' ) THEN
        mut_19_9_63_0 <= mut_19_8_63_0;
        mut_18_9_63_0 <= mut_18_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1275_cse = '1' ) THEN
        mut_21_9_63_0 <= mut_21_8_63_0;
        mut_20_9_63_0 <= mut_20_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1277_cse = '1' ) THEN
        mut_23_9_63_0 <= mut_23_8_63_0;
        mut_22_9_63_0 <= mut_22_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1279_cse = '1' ) THEN
        mut_1_9_63_0 <= mut_1_8_63_0;
        mut_9_63_0 <= mut_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_9_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_9_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1281_cse = '1' ) THEN
        rem_12cyc_st_9_3_2 <= rem_12cyc_st_8_3_2;
        rem_12cyc_st_9_1_0 <= rem_12cyc_st_8_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1283_cse = '1' ) THEN
        mut_3_8_63_0 <= mut_3_7_63_0;
        mut_2_8_63_0 <= mut_2_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1285_cse = '1' ) THEN
        mut_5_8_63_0 <= mut_5_7_63_0;
        mut_4_8_63_0 <= mut_4_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1287_cse = '1' ) THEN
        mut_7_8_63_0 <= mut_7_7_63_0;
        mut_6_8_63_0 <= mut_6_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1289_cse = '1' ) THEN
        mut_9_8_63_0 <= mut_9_7_63_0;
        mut_8_8_63_0 <= mut_8_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1291_cse = '1' ) THEN
        mut_11_8_63_0 <= mut_11_7_63_0;
        mut_10_8_63_0 <= mut_10_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1293_cse = '1' ) THEN
        mut_13_8_63_0 <= mut_13_7_63_0;
        mut_12_8_63_0 <= mut_12_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1295_cse = '1' ) THEN
        mut_15_8_63_0 <= mut_15_7_63_0;
        mut_14_8_63_0 <= mut_14_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1297_cse = '1' ) THEN
        mut_17_8_63_0 <= mut_17_7_63_0;
        mut_16_8_63_0 <= mut_16_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1299_cse = '1' ) THEN
        mut_19_8_63_0 <= mut_19_7_63_0;
        mut_18_8_63_0 <= mut_18_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1301_cse = '1' ) THEN
        mut_21_8_63_0 <= mut_21_7_63_0;
        mut_20_8_63_0 <= mut_20_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1303_cse = '1' ) THEN
        mut_23_8_63_0 <= mut_23_7_63_0;
        mut_22_8_63_0 <= mut_22_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1305_cse = '1' ) THEN
        mut_1_8_63_0 <= mut_1_7_63_0;
        mut_8_63_0 <= mut_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_8_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_8_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1307_cse = '1' ) THEN
        rem_12cyc_st_8_3_2 <= rem_12cyc_st_7_3_2;
        rem_12cyc_st_8_1_0 <= rem_12cyc_st_7_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1309_cse = '1' ) THEN
        mut_3_7_63_0 <= mut_3_6_63_0;
        mut_2_7_63_0 <= mut_2_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1311_cse = '1' ) THEN
        mut_5_7_63_0 <= mut_5_6_63_0;
        mut_4_7_63_0 <= mut_4_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1313_cse = '1' ) THEN
        mut_7_7_63_0 <= mut_7_6_63_0;
        mut_6_7_63_0 <= mut_6_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1315_cse = '1' ) THEN
        mut_9_7_63_0 <= mut_9_6_63_0;
        mut_8_7_63_0 <= mut_8_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1317_cse = '1' ) THEN
        mut_11_7_63_0 <= mut_11_6_63_0;
        mut_10_7_63_0 <= mut_10_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1319_cse = '1' ) THEN
        mut_13_7_63_0 <= mut_13_6_63_0;
        mut_12_7_63_0 <= mut_12_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1321_cse = '1' ) THEN
        mut_15_7_63_0 <= mut_15_6_63_0;
        mut_14_7_63_0 <= mut_14_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1323_cse = '1' ) THEN
        mut_17_7_63_0 <= mut_17_6_63_0;
        mut_16_7_63_0 <= mut_16_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1325_cse = '1' ) THEN
        mut_19_7_63_0 <= mut_19_6_63_0;
        mut_18_7_63_0 <= mut_18_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1327_cse = '1' ) THEN
        mut_21_7_63_0 <= mut_21_6_63_0;
        mut_20_7_63_0 <= mut_20_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1329_cse = '1' ) THEN
        mut_23_7_63_0 <= mut_23_6_63_0;
        mut_22_7_63_0 <= mut_22_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1331_cse = '1' ) THEN
        mut_1_7_63_0 <= mut_1_6_63_0;
        mut_7_63_0 <= mut_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_7_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_7_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1333_cse = '1' ) THEN
        rem_12cyc_st_7_3_2 <= rem_12cyc_st_6_3_2;
        rem_12cyc_st_7_1_0 <= rem_12cyc_st_6_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1335_cse = '1' ) THEN
        mut_3_6_63_0 <= mut_3_5_63_0;
        mut_2_6_63_0 <= mut_2_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1337_cse = '1' ) THEN
        mut_5_6_63_0 <= mut_5_5_63_0;
        mut_4_6_63_0 <= mut_4_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1339_cse = '1' ) THEN
        mut_7_6_63_0 <= mut_7_5_63_0;
        mut_6_6_63_0 <= mut_6_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1341_cse = '1' ) THEN
        mut_9_6_63_0 <= mut_9_5_63_0;
        mut_8_6_63_0 <= mut_8_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1343_cse = '1' ) THEN
        mut_11_6_63_0 <= mut_11_5_63_0;
        mut_10_6_63_0 <= mut_10_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1345_cse = '1' ) THEN
        mut_13_6_63_0 <= mut_13_5_63_0;
        mut_12_6_63_0 <= mut_12_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1347_cse = '1' ) THEN
        mut_15_6_63_0 <= mut_15_5_63_0;
        mut_14_6_63_0 <= mut_14_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1349_cse = '1' ) THEN
        mut_17_6_63_0 <= mut_17_5_63_0;
        mut_16_6_63_0 <= mut_16_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1351_cse = '1' ) THEN
        mut_19_6_63_0 <= mut_19_5_63_0;
        mut_18_6_63_0 <= mut_18_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1353_cse = '1' ) THEN
        mut_21_6_63_0 <= mut_21_5_63_0;
        mut_20_6_63_0 <= mut_20_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1355_cse = '1' ) THEN
        mut_23_6_63_0 <= mut_23_5_63_0;
        mut_22_6_63_0 <= mut_22_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1357_cse = '1' ) THEN
        mut_1_6_63_0 <= mut_1_5_63_0;
        mut_6_63_0 <= mut_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1359_cse = '1' ) THEN
        m_buf_sva_6 <= m_buf_sva_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_6_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_6_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1359_cse = '1' ) THEN
        rem_12cyc_st_6_3_2 <= rem_12cyc_st_5_3_2;
        rem_12cyc_st_6_1_0 <= rem_12cyc_st_5_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1361_cse = '1' ) THEN
        mut_3_5_63_0 <= mut_3_4_63_0;
        mut_2_5_63_0 <= mut_2_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1363_cse = '1' ) THEN
        mut_5_5_63_0 <= mut_5_4_63_0;
        mut_4_5_63_0 <= mut_4_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1365_cse = '1' ) THEN
        mut_7_5_63_0 <= mut_7_4_63_0;
        mut_6_5_63_0 <= mut_6_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1367_cse = '1' ) THEN
        mut_9_5_63_0 <= mut_9_4_63_0;
        mut_8_5_63_0 <= mut_8_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1369_cse = '1' ) THEN
        mut_11_5_63_0 <= mut_11_4_63_0;
        mut_10_5_63_0 <= mut_10_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1371_cse = '1' ) THEN
        mut_13_5_63_0 <= mut_13_4_63_0;
        mut_12_5_63_0 <= mut_12_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1373_cse = '1' ) THEN
        mut_15_5_63_0 <= mut_15_4_63_0;
        mut_14_5_63_0 <= mut_14_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1375_cse = '1' ) THEN
        mut_17_5_63_0 <= mut_17_4_63_0;
        mut_16_5_63_0 <= mut_16_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1377_cse = '1' ) THEN
        mut_19_5_63_0 <= mut_19_4_63_0;
        mut_18_5_63_0 <= mut_18_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1379_cse = '1' ) THEN
        mut_21_5_63_0 <= mut_21_4_63_0;
        mut_20_5_63_0 <= mut_20_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1381_cse = '1' ) THEN
        mut_23_5_63_0 <= mut_23_4_63_0;
        mut_22_5_63_0 <= mut_22_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1383_cse = '1' ) THEN
        mut_1_5_63_0 <= mut_1_4_63_0;
        mut_5_63_0 <= mut_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1385_cse = '1' ) THEN
        m_buf_sva_5 <= m_buf_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_5_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_5_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1385_cse = '1' ) THEN
        rem_12cyc_st_5_3_2 <= rem_12cyc_st_4_3_2;
        rem_12cyc_st_5_1_0 <= rem_12cyc_st_4_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1387_cse = '1' ) THEN
        mut_3_4_63_0 <= mut_3_3_63_0;
        mut_2_4_63_0 <= mut_2_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1389_cse = '1' ) THEN
        mut_5_4_63_0 <= mut_5_3_63_0;
        mut_4_4_63_0 <= mut_4_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1391_cse = '1' ) THEN
        mut_7_4_63_0 <= mut_7_3_63_0;
        mut_6_4_63_0 <= mut_6_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1393_cse = '1' ) THEN
        mut_9_4_63_0 <= mut_9_3_63_0;
        mut_8_4_63_0 <= mut_8_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1395_cse = '1' ) THEN
        mut_11_4_63_0 <= mut_11_3_63_0;
        mut_10_4_63_0 <= mut_10_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1397_cse = '1' ) THEN
        mut_13_4_63_0 <= mut_13_3_63_0;
        mut_12_4_63_0 <= mut_12_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1399_cse = '1' ) THEN
        mut_15_4_63_0 <= mut_15_3_63_0;
        mut_14_4_63_0 <= mut_14_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1401_cse = '1' ) THEN
        mut_17_4_63_0 <= mut_17_3_63_0;
        mut_16_4_63_0 <= mut_16_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1403_cse = '1' ) THEN
        mut_19_4_63_0 <= mut_19_3_63_0;
        mut_18_4_63_0 <= mut_18_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1405_cse = '1' ) THEN
        mut_21_4_63_0 <= mut_21_3_63_0;
        mut_20_4_63_0 <= mut_20_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1407_cse = '1' ) THEN
        mut_23_4_63_0 <= mut_23_3_63_0;
        mut_22_4_63_0 <= mut_22_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1409_cse = '1' ) THEN
        mut_1_4_63_0 <= mut_1_3_63_0;
        mut_4_63_0 <= mut_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1411_cse = '1' ) THEN
        m_buf_sva_4 <= m_buf_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_4_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_4_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1411_cse = '1' ) THEN
        rem_12cyc_st_4_3_2 <= rem_12cyc_st_3_3_2;
        rem_12cyc_st_4_1_0 <= rem_12cyc_st_3_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1413_cse = '1' ) THEN
        mut_3_3_63_0 <= mut_3_2_63_0;
        mut_2_3_63_0 <= mut_2_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1415_cse = '1' ) THEN
        mut_5_3_63_0 <= mut_5_2_63_0;
        mut_4_3_63_0 <= mut_4_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1417_cse = '1' ) THEN
        mut_7_3_63_0 <= mut_7_2_63_0;
        mut_6_3_63_0 <= mut_6_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1419_cse = '1' ) THEN
        mut_9_3_63_0 <= mut_9_2_63_0;
        mut_8_3_63_0 <= mut_8_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1421_cse = '1' ) THEN
        mut_11_3_63_0 <= mut_11_2_63_0;
        mut_10_3_63_0 <= mut_10_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1423_cse = '1' ) THEN
        mut_13_3_63_0 <= mut_13_2_63_0;
        mut_12_3_63_0 <= mut_12_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1425_cse = '1' ) THEN
        mut_15_3_63_0 <= mut_15_2_63_0;
        mut_14_3_63_0 <= mut_14_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1427_cse = '1' ) THEN
        mut_17_3_63_0 <= mut_17_2_63_0;
        mut_16_3_63_0 <= mut_16_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1429_cse = '1' ) THEN
        mut_19_3_63_0 <= mut_19_2_63_0;
        mut_18_3_63_0 <= mut_18_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1431_cse = '1' ) THEN
        mut_21_3_63_0 <= mut_21_2_63_0;
        mut_20_3_63_0 <= mut_20_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1433_cse = '1' ) THEN
        mut_23_3_63_0 <= mut_23_2_63_0;
        mut_22_3_63_0 <= mut_22_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1435_cse = '1' ) THEN
        mut_1_3_63_0 <= mut_1_2_63_0;
        mut_3_63_0 <= mut_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1437_cse = '1' ) THEN
        m_buf_sva_3 <= m_buf_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_3_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_3_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1437_cse = '1' ) THEN
        rem_12cyc_st_3_3_2 <= rem_12cyc_st_2_3_2;
        rem_12cyc_st_3_1_0 <= rem_12cyc_st_2_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1439_cse = '1' ) THEN
        mut_3_2_63_0 <= rem_13_cmp_1_b_63_0;
        mut_2_2_63_0 <= rem_13_cmp_1_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1441_cse = '1' ) THEN
        mut_5_2_63_0 <= rem_13_cmp_2_b_63_0;
        mut_4_2_63_0 <= rem_13_cmp_2_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1443_cse = '1' ) THEN
        mut_7_2_63_0 <= rem_13_cmp_3_b_63_0;
        mut_6_2_63_0 <= rem_13_cmp_3_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1445_cse = '1' ) THEN
        mut_9_2_63_0 <= rem_13_cmp_4_b_63_0;
        mut_8_2_63_0 <= rem_13_cmp_4_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1447_cse = '1' ) THEN
        mut_11_2_63_0 <= rem_13_cmp_5_b_63_0;
        mut_10_2_63_0 <= rem_13_cmp_5_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1449_cse = '1' ) THEN
        mut_13_2_63_0 <= rem_13_cmp_6_b_63_0;
        mut_12_2_63_0 <= rem_13_cmp_6_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1451_cse = '1' ) THEN
        mut_15_2_63_0 <= rem_13_cmp_7_b_63_0;
        mut_14_2_63_0 <= rem_13_cmp_7_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1453_cse = '1' ) THEN
        mut_17_2_63_0 <= rem_13_cmp_8_b_63_0;
        mut_16_2_63_0 <= rem_13_cmp_8_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1455_cse = '1' ) THEN
        mut_19_2_63_0 <= rem_13_cmp_9_b_63_0;
        mut_18_2_63_0 <= rem_13_cmp_9_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1457_cse = '1' ) THEN
        mut_21_2_63_0 <= rem_13_cmp_10_b_63_0;
        mut_20_2_63_0 <= rem_13_cmp_10_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1459_cse = '1' ) THEN
        mut_23_2_63_0 <= rem_13_cmp_11_b_63_0;
        mut_22_2_63_0 <= rem_13_cmp_11_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1461_cse = '1' ) THEN
        mut_1_2_63_0 <= rem_13_cmp_b_63_0;
        mut_2_63_0 <= rem_13_cmp_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1463_cse = '1' ) THEN
        m_buf_sva_2 <= m_buf_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_2_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_2_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1463_cse = '1' ) THEN
        rem_12cyc_st_2_3_2 <= rem_12cyc_3_2;
        rem_12cyc_st_2_1_0 <= rem_12cyc_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1197_cse = '1' ) THEN
        m_buf_sva_1 <= m_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1197_cse = '1' ) THEN
        rem_12cyc_3_2 <= acc_tmp;
        rem_12cyc_1_0 <= acc_1_tmp(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  qelse_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(result_sva_duc_mx0) + UNSIGNED(m_buf_sva_12),
      64));
  mux_10_nl <= MUX_s_1_2_2((rem_13_cmp_1_z(63)), (rem_13_cmp_3_z(63)), rem_12cyc_st_12_1_0(1));
  mux_9_nl <= MUX_s_1_2_2((rem_13_cmp_2_z(63)), (rem_13_cmp_4_z(63)), rem_12cyc_st_12_1_0(1));
  mux_11_nl <= MUX_s_1_2_2(mux_10_nl, mux_9_nl, rem_12cyc_st_12_1_0(0));
  mux_7_nl <= MUX_s_1_2_2((rem_13_cmp_9_z(63)), (rem_13_cmp_11_z(63)), rem_12cyc_st_12_1_0(1));
  mux_6_nl <= MUX_s_1_2_2((rem_13_cmp_10_z(63)), (rem_13_cmp_z(63)), rem_12cyc_st_12_1_0(1));
  mux_8_nl <= MUX_s_1_2_2(mux_7_nl, mux_6_nl, rem_12cyc_st_12_1_0(0));
  mux_12_nl <= MUX_s_1_2_2(mux_11_nl, mux_8_nl, rem_12cyc_st_12_3_2(1));
  mux_3_nl <= MUX_s_1_2_2((rem_13_cmp_5_z(63)), (rem_13_cmp_7_z(63)), rem_12cyc_st_12_1_0(1));
  mux_2_nl <= MUX_s_1_2_2((rem_13_cmp_6_z(63)), (rem_13_cmp_8_z(63)), rem_12cyc_st_12_1_0(1));
  mux_4_nl <= MUX_s_1_2_2(mux_3_nl, mux_2_nl, rem_12cyc_st_12_1_0(0));
  mux_5_nl <= MUX_s_1_2_2(mux_4_nl, (result_sva_duc(63)), rem_12cyc_st_12_3_2(1));
  mux_13_nl <= MUX_s_1_2_2(mux_12_nl, mux_5_nl, rem_12cyc_st_12_3_2(0));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    modulo_dev
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;
USE work.mgc_comps.ALL;


ENTITY modulo_dev IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_dev;

ARCHITECTURE v1 OF modulo_dev IS
  -- Default Constants

  COMPONENT modulo_dev_core
    PORT(
      base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL modulo_dev_core_inst_base_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_core_inst_m_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_core_inst_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
  modulo_dev_core_inst : modulo_dev_core
    PORT MAP(
      base_rsc_dat => modulo_dev_core_inst_base_rsc_dat,
      m_rsc_dat => modulo_dev_core_inst_m_rsc_dat,
      return_rsc_z => modulo_dev_core_inst_return_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  modulo_dev_core_inst_base_rsc_dat <= base_rsc_dat;
  modulo_dev_core_inst_m_rsc_dat <= m_rsc_dat;
  return_rsc_z <= modulo_dev_core_inst_return_rsc_z;

END v1;




--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_div_beh.vhd 

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_div IS
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END mgc_div;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

USE work.funcs.all;

ARCHITECTURE beh OF mgc_div IS
BEGIN
  z <= std_logic_vector(unsigned(a) / unsigned(b)) WHEN signd = 0 ELSE
       std_logic_vector(  signed(a) /   signed(b));
END beh;

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
--  Generated date: Tue Jul 20 15:40:07 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    STAGE_MAIN_LOOP_C_3_tr0 : IN STD_LOGIC;
    modExp_dev_while_C_11_tr0 : IN STD_LOGIC;
    STAGE_VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_45_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_90_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_135_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_180_tr0 : IN STD_LOGIC;
    COMP_LOOP_5_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_225_tr0 : IN STD_LOGIC;
    COMP_LOOP_6_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_270_tr0 : IN STD_LOGIC;
    COMP_LOOP_7_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_315_tr0 : IN STD_LOGIC;
    COMP_LOOP_8_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_360_tr0 : IN STD_LOGIC;
    STAGE_VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
    STAGE_MAIN_LOOP_C_4_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_core_core_fsm;

ARCHITECTURE v6 OF inPlaceNTT_DIF_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  TYPE inPlaceNTT_DIF_core_core_fsm_1_ST IS (main_C_0, STAGE_MAIN_LOOP_C_0, STAGE_MAIN_LOOP_C_1,
      STAGE_MAIN_LOOP_C_2, STAGE_MAIN_LOOP_C_3, modExp_dev_while_C_0, modExp_dev_while_C_1,
      modExp_dev_while_C_2, modExp_dev_while_C_3, modExp_dev_while_C_4, modExp_dev_while_C_5,
      modExp_dev_while_C_6, modExp_dev_while_C_7, modExp_dev_while_C_8, modExp_dev_while_C_9,
      modExp_dev_while_C_10, modExp_dev_while_C_11, STAGE_VEC_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5,
      COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10,
      COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15,
      COMP_LOOP_C_16, COMP_LOOP_1_modExp_dev_1_while_C_0, COMP_LOOP_1_modExp_dev_1_while_C_1,
      COMP_LOOP_1_modExp_dev_1_while_C_2, COMP_LOOP_1_modExp_dev_1_while_C_3, COMP_LOOP_1_modExp_dev_1_while_C_4,
      COMP_LOOP_1_modExp_dev_1_while_C_5, COMP_LOOP_1_modExp_dev_1_while_C_6, COMP_LOOP_1_modExp_dev_1_while_C_7,
      COMP_LOOP_1_modExp_dev_1_while_C_8, COMP_LOOP_1_modExp_dev_1_while_C_9, COMP_LOOP_1_modExp_dev_1_while_C_10,
      COMP_LOOP_1_modExp_dev_1_while_C_11, COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19,
      COMP_LOOP_C_20, COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24,
      COMP_LOOP_C_25, COMP_LOOP_C_26, COMP_LOOP_C_27, COMP_LOOP_C_28, COMP_LOOP_C_29,
      COMP_LOOP_C_30, COMP_LOOP_C_31, COMP_LOOP_C_32, COMP_LOOP_C_33, COMP_LOOP_C_34,
      COMP_LOOP_C_35, COMP_LOOP_C_36, COMP_LOOP_C_37, COMP_LOOP_C_38, COMP_LOOP_C_39,
      COMP_LOOP_C_40, COMP_LOOP_C_41, COMP_LOOP_C_42, COMP_LOOP_C_43, COMP_LOOP_C_44,
      COMP_LOOP_C_45, COMP_LOOP_C_46, COMP_LOOP_C_47, COMP_LOOP_C_48, COMP_LOOP_C_49,
      COMP_LOOP_C_50, COMP_LOOP_C_51, COMP_LOOP_C_52, COMP_LOOP_C_53, COMP_LOOP_C_54,
      COMP_LOOP_C_55, COMP_LOOP_C_56, COMP_LOOP_C_57, COMP_LOOP_C_58, COMP_LOOP_C_59,
      COMP_LOOP_C_60, COMP_LOOP_C_61, COMP_LOOP_2_modExp_dev_1_while_C_0, COMP_LOOP_2_modExp_dev_1_while_C_1,
      COMP_LOOP_2_modExp_dev_1_while_C_2, COMP_LOOP_2_modExp_dev_1_while_C_3, COMP_LOOP_2_modExp_dev_1_while_C_4,
      COMP_LOOP_2_modExp_dev_1_while_C_5, COMP_LOOP_2_modExp_dev_1_while_C_6, COMP_LOOP_2_modExp_dev_1_while_C_7,
      COMP_LOOP_2_modExp_dev_1_while_C_8, COMP_LOOP_2_modExp_dev_1_while_C_9, COMP_LOOP_2_modExp_dev_1_while_C_10,
      COMP_LOOP_2_modExp_dev_1_while_C_11, COMP_LOOP_C_62, COMP_LOOP_C_63, COMP_LOOP_C_64,
      COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_C_68, COMP_LOOP_C_69,
      COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72, COMP_LOOP_C_73, COMP_LOOP_C_74,
      COMP_LOOP_C_75, COMP_LOOP_C_76, COMP_LOOP_C_77, COMP_LOOP_C_78, COMP_LOOP_C_79,
      COMP_LOOP_C_80, COMP_LOOP_C_81, COMP_LOOP_C_82, COMP_LOOP_C_83, COMP_LOOP_C_84,
      COMP_LOOP_C_85, COMP_LOOP_C_86, COMP_LOOP_C_87, COMP_LOOP_C_88, COMP_LOOP_C_89,
      COMP_LOOP_C_90, COMP_LOOP_C_91, COMP_LOOP_C_92, COMP_LOOP_C_93, COMP_LOOP_C_94,
      COMP_LOOP_C_95, COMP_LOOP_C_96, COMP_LOOP_C_97, COMP_LOOP_C_98, COMP_LOOP_C_99,
      COMP_LOOP_C_100, COMP_LOOP_C_101, COMP_LOOP_C_102, COMP_LOOP_C_103, COMP_LOOP_C_104,
      COMP_LOOP_C_105, COMP_LOOP_C_106, COMP_LOOP_3_modExp_dev_1_while_C_0, COMP_LOOP_3_modExp_dev_1_while_C_1,
      COMP_LOOP_3_modExp_dev_1_while_C_2, COMP_LOOP_3_modExp_dev_1_while_C_3, COMP_LOOP_3_modExp_dev_1_while_C_4,
      COMP_LOOP_3_modExp_dev_1_while_C_5, COMP_LOOP_3_modExp_dev_1_while_C_6, COMP_LOOP_3_modExp_dev_1_while_C_7,
      COMP_LOOP_3_modExp_dev_1_while_C_8, COMP_LOOP_3_modExp_dev_1_while_C_9, COMP_LOOP_3_modExp_dev_1_while_C_10,
      COMP_LOOP_3_modExp_dev_1_while_C_11, COMP_LOOP_C_107, COMP_LOOP_C_108, COMP_LOOP_C_109,
      COMP_LOOP_C_110, COMP_LOOP_C_111, COMP_LOOP_C_112, COMP_LOOP_C_113, COMP_LOOP_C_114,
      COMP_LOOP_C_115, COMP_LOOP_C_116, COMP_LOOP_C_117, COMP_LOOP_C_118, COMP_LOOP_C_119,
      COMP_LOOP_C_120, COMP_LOOP_C_121, COMP_LOOP_C_122, COMP_LOOP_C_123, COMP_LOOP_C_124,
      COMP_LOOP_C_125, COMP_LOOP_C_126, COMP_LOOP_C_127, COMP_LOOP_C_128, COMP_LOOP_C_129,
      COMP_LOOP_C_130, COMP_LOOP_C_131, COMP_LOOP_C_132, COMP_LOOP_C_133, COMP_LOOP_C_134,
      COMP_LOOP_C_135, COMP_LOOP_C_136, COMP_LOOP_C_137, COMP_LOOP_C_138, COMP_LOOP_C_139,
      COMP_LOOP_C_140, COMP_LOOP_C_141, COMP_LOOP_C_142, COMP_LOOP_C_143, COMP_LOOP_C_144,
      COMP_LOOP_C_145, COMP_LOOP_C_146, COMP_LOOP_C_147, COMP_LOOP_C_148, COMP_LOOP_C_149,
      COMP_LOOP_C_150, COMP_LOOP_C_151, COMP_LOOP_4_modExp_dev_1_while_C_0, COMP_LOOP_4_modExp_dev_1_while_C_1,
      COMP_LOOP_4_modExp_dev_1_while_C_2, COMP_LOOP_4_modExp_dev_1_while_C_3, COMP_LOOP_4_modExp_dev_1_while_C_4,
      COMP_LOOP_4_modExp_dev_1_while_C_5, COMP_LOOP_4_modExp_dev_1_while_C_6, COMP_LOOP_4_modExp_dev_1_while_C_7,
      COMP_LOOP_4_modExp_dev_1_while_C_8, COMP_LOOP_4_modExp_dev_1_while_C_9, COMP_LOOP_4_modExp_dev_1_while_C_10,
      COMP_LOOP_4_modExp_dev_1_while_C_11, COMP_LOOP_C_152, COMP_LOOP_C_153, COMP_LOOP_C_154,
      COMP_LOOP_C_155, COMP_LOOP_C_156, COMP_LOOP_C_157, COMP_LOOP_C_158, COMP_LOOP_C_159,
      COMP_LOOP_C_160, COMP_LOOP_C_161, COMP_LOOP_C_162, COMP_LOOP_C_163, COMP_LOOP_C_164,
      COMP_LOOP_C_165, COMP_LOOP_C_166, COMP_LOOP_C_167, COMP_LOOP_C_168, COMP_LOOP_C_169,
      COMP_LOOP_C_170, COMP_LOOP_C_171, COMP_LOOP_C_172, COMP_LOOP_C_173, COMP_LOOP_C_174,
      COMP_LOOP_C_175, COMP_LOOP_C_176, COMP_LOOP_C_177, COMP_LOOP_C_178, COMP_LOOP_C_179,
      COMP_LOOP_C_180, COMP_LOOP_C_181, COMP_LOOP_C_182, COMP_LOOP_C_183, COMP_LOOP_C_184,
      COMP_LOOP_C_185, COMP_LOOP_C_186, COMP_LOOP_C_187, COMP_LOOP_C_188, COMP_LOOP_C_189,
      COMP_LOOP_C_190, COMP_LOOP_C_191, COMP_LOOP_C_192, COMP_LOOP_C_193, COMP_LOOP_C_194,
      COMP_LOOP_C_195, COMP_LOOP_C_196, COMP_LOOP_5_modExp_dev_1_while_C_0, COMP_LOOP_5_modExp_dev_1_while_C_1,
      COMP_LOOP_5_modExp_dev_1_while_C_2, COMP_LOOP_5_modExp_dev_1_while_C_3, COMP_LOOP_5_modExp_dev_1_while_C_4,
      COMP_LOOP_5_modExp_dev_1_while_C_5, COMP_LOOP_5_modExp_dev_1_while_C_6, COMP_LOOP_5_modExp_dev_1_while_C_7,
      COMP_LOOP_5_modExp_dev_1_while_C_8, COMP_LOOP_5_modExp_dev_1_while_C_9, COMP_LOOP_5_modExp_dev_1_while_C_10,
      COMP_LOOP_5_modExp_dev_1_while_C_11, COMP_LOOP_C_197, COMP_LOOP_C_198, COMP_LOOP_C_199,
      COMP_LOOP_C_200, COMP_LOOP_C_201, COMP_LOOP_C_202, COMP_LOOP_C_203, COMP_LOOP_C_204,
      COMP_LOOP_C_205, COMP_LOOP_C_206, COMP_LOOP_C_207, COMP_LOOP_C_208, COMP_LOOP_C_209,
      COMP_LOOP_C_210, COMP_LOOP_C_211, COMP_LOOP_C_212, COMP_LOOP_C_213, COMP_LOOP_C_214,
      COMP_LOOP_C_215, COMP_LOOP_C_216, COMP_LOOP_C_217, COMP_LOOP_C_218, COMP_LOOP_C_219,
      COMP_LOOP_C_220, COMP_LOOP_C_221, COMP_LOOP_C_222, COMP_LOOP_C_223, COMP_LOOP_C_224,
      COMP_LOOP_C_225, COMP_LOOP_C_226, COMP_LOOP_C_227, COMP_LOOP_C_228, COMP_LOOP_C_229,
      COMP_LOOP_C_230, COMP_LOOP_C_231, COMP_LOOP_C_232, COMP_LOOP_C_233, COMP_LOOP_C_234,
      COMP_LOOP_C_235, COMP_LOOP_C_236, COMP_LOOP_C_237, COMP_LOOP_C_238, COMP_LOOP_C_239,
      COMP_LOOP_C_240, COMP_LOOP_C_241, COMP_LOOP_6_modExp_dev_1_while_C_0, COMP_LOOP_6_modExp_dev_1_while_C_1,
      COMP_LOOP_6_modExp_dev_1_while_C_2, COMP_LOOP_6_modExp_dev_1_while_C_3, COMP_LOOP_6_modExp_dev_1_while_C_4,
      COMP_LOOP_6_modExp_dev_1_while_C_5, COMP_LOOP_6_modExp_dev_1_while_C_6, COMP_LOOP_6_modExp_dev_1_while_C_7,
      COMP_LOOP_6_modExp_dev_1_while_C_8, COMP_LOOP_6_modExp_dev_1_while_C_9, COMP_LOOP_6_modExp_dev_1_while_C_10,
      COMP_LOOP_6_modExp_dev_1_while_C_11, COMP_LOOP_C_242, COMP_LOOP_C_243, COMP_LOOP_C_244,
      COMP_LOOP_C_245, COMP_LOOP_C_246, COMP_LOOP_C_247, COMP_LOOP_C_248, COMP_LOOP_C_249,
      COMP_LOOP_C_250, COMP_LOOP_C_251, COMP_LOOP_C_252, COMP_LOOP_C_253, COMP_LOOP_C_254,
      COMP_LOOP_C_255, COMP_LOOP_C_256, COMP_LOOP_C_257, COMP_LOOP_C_258, COMP_LOOP_C_259,
      COMP_LOOP_C_260, COMP_LOOP_C_261, COMP_LOOP_C_262, COMP_LOOP_C_263, COMP_LOOP_C_264,
      COMP_LOOP_C_265, COMP_LOOP_C_266, COMP_LOOP_C_267, COMP_LOOP_C_268, COMP_LOOP_C_269,
      COMP_LOOP_C_270, COMP_LOOP_C_271, COMP_LOOP_C_272, COMP_LOOP_C_273, COMP_LOOP_C_274,
      COMP_LOOP_C_275, COMP_LOOP_C_276, COMP_LOOP_C_277, COMP_LOOP_C_278, COMP_LOOP_C_279,
      COMP_LOOP_C_280, COMP_LOOP_C_281, COMP_LOOP_C_282, COMP_LOOP_C_283, COMP_LOOP_C_284,
      COMP_LOOP_C_285, COMP_LOOP_C_286, COMP_LOOP_7_modExp_dev_1_while_C_0, COMP_LOOP_7_modExp_dev_1_while_C_1,
      COMP_LOOP_7_modExp_dev_1_while_C_2, COMP_LOOP_7_modExp_dev_1_while_C_3, COMP_LOOP_7_modExp_dev_1_while_C_4,
      COMP_LOOP_7_modExp_dev_1_while_C_5, COMP_LOOP_7_modExp_dev_1_while_C_6, COMP_LOOP_7_modExp_dev_1_while_C_7,
      COMP_LOOP_7_modExp_dev_1_while_C_8, COMP_LOOP_7_modExp_dev_1_while_C_9, COMP_LOOP_7_modExp_dev_1_while_C_10,
      COMP_LOOP_7_modExp_dev_1_while_C_11, COMP_LOOP_C_287, COMP_LOOP_C_288, COMP_LOOP_C_289,
      COMP_LOOP_C_290, COMP_LOOP_C_291, COMP_LOOP_C_292, COMP_LOOP_C_293, COMP_LOOP_C_294,
      COMP_LOOP_C_295, COMP_LOOP_C_296, COMP_LOOP_C_297, COMP_LOOP_C_298, COMP_LOOP_C_299,
      COMP_LOOP_C_300, COMP_LOOP_C_301, COMP_LOOP_C_302, COMP_LOOP_C_303, COMP_LOOP_C_304,
      COMP_LOOP_C_305, COMP_LOOP_C_306, COMP_LOOP_C_307, COMP_LOOP_C_308, COMP_LOOP_C_309,
      COMP_LOOP_C_310, COMP_LOOP_C_311, COMP_LOOP_C_312, COMP_LOOP_C_313, COMP_LOOP_C_314,
      COMP_LOOP_C_315, COMP_LOOP_C_316, COMP_LOOP_C_317, COMP_LOOP_C_318, COMP_LOOP_C_319,
      COMP_LOOP_C_320, COMP_LOOP_C_321, COMP_LOOP_C_322, COMP_LOOP_C_323, COMP_LOOP_C_324,
      COMP_LOOP_C_325, COMP_LOOP_C_326, COMP_LOOP_C_327, COMP_LOOP_C_328, COMP_LOOP_C_329,
      COMP_LOOP_C_330, COMP_LOOP_C_331, COMP_LOOP_8_modExp_dev_1_while_C_0, COMP_LOOP_8_modExp_dev_1_while_C_1,
      COMP_LOOP_8_modExp_dev_1_while_C_2, COMP_LOOP_8_modExp_dev_1_while_C_3, COMP_LOOP_8_modExp_dev_1_while_C_4,
      COMP_LOOP_8_modExp_dev_1_while_C_5, COMP_LOOP_8_modExp_dev_1_while_C_6, COMP_LOOP_8_modExp_dev_1_while_C_7,
      COMP_LOOP_8_modExp_dev_1_while_C_8, COMP_LOOP_8_modExp_dev_1_while_C_9, COMP_LOOP_8_modExp_dev_1_while_C_10,
      COMP_LOOP_8_modExp_dev_1_while_C_11, COMP_LOOP_C_332, COMP_LOOP_C_333, COMP_LOOP_C_334,
      COMP_LOOP_C_335, COMP_LOOP_C_336, COMP_LOOP_C_337, COMP_LOOP_C_338, COMP_LOOP_C_339,
      COMP_LOOP_C_340, COMP_LOOP_C_341, COMP_LOOP_C_342, COMP_LOOP_C_343, COMP_LOOP_C_344,
      COMP_LOOP_C_345, COMP_LOOP_C_346, COMP_LOOP_C_347, COMP_LOOP_C_348, COMP_LOOP_C_349,
      COMP_LOOP_C_350, COMP_LOOP_C_351, COMP_LOOP_C_352, COMP_LOOP_C_353, COMP_LOOP_C_354,
      COMP_LOOP_C_355, COMP_LOOP_C_356, COMP_LOOP_C_357, COMP_LOOP_C_358, COMP_LOOP_C_359,
      COMP_LOOP_C_360, STAGE_VEC_LOOP_C_1, STAGE_MAIN_LOOP_C_4, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIF_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIF_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIF_core_core_fsm_1 : PROCESS (STAGE_MAIN_LOOP_C_3_tr0, modExp_dev_while_C_11_tr0,
      STAGE_VEC_LOOP_C_0_tr0, COMP_LOOP_C_16_tr0, COMP_LOOP_1_modExp_dev_1_while_C_11_tr0,
      COMP_LOOP_C_45_tr0, COMP_LOOP_2_modExp_dev_1_while_C_11_tr0, COMP_LOOP_C_90_tr0,
      COMP_LOOP_3_modExp_dev_1_while_C_11_tr0, COMP_LOOP_C_135_tr0, COMP_LOOP_4_modExp_dev_1_while_C_11_tr0,
      COMP_LOOP_C_180_tr0, COMP_LOOP_5_modExp_dev_1_while_C_11_tr0, COMP_LOOP_C_225_tr0,
      COMP_LOOP_6_modExp_dev_1_while_C_11_tr0, COMP_LOOP_C_270_tr0, COMP_LOOP_7_modExp_dev_1_while_C_11_tr0,
      COMP_LOOP_C_315_tr0, COMP_LOOP_8_modExp_dev_1_while_C_11_tr0, COMP_LOOP_C_360_tr0,
      STAGE_VEC_LOOP_C_1_tr0, STAGE_MAIN_LOOP_C_4_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_MAIN_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001");
        state_var_NS <= STAGE_MAIN_LOOP_C_1;
      WHEN STAGE_MAIN_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010");
        state_var_NS <= STAGE_MAIN_LOOP_C_2;
      WHEN STAGE_MAIN_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000011");
        state_var_NS <= STAGE_MAIN_LOOP_C_3;
      WHEN STAGE_MAIN_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        IF ( STAGE_MAIN_LOOP_C_3_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_dev_while_C_0;
        END IF;
      WHEN modExp_dev_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000101");
        state_var_NS <= modExp_dev_while_C_1;
      WHEN modExp_dev_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000110");
        state_var_NS <= modExp_dev_while_C_2;
      WHEN modExp_dev_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= modExp_dev_while_C_3;
      WHEN modExp_dev_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= modExp_dev_while_C_4;
      WHEN modExp_dev_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= modExp_dev_while_C_5;
      WHEN modExp_dev_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= modExp_dev_while_C_6;
      WHEN modExp_dev_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= modExp_dev_while_C_7;
      WHEN modExp_dev_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= modExp_dev_while_C_8;
      WHEN modExp_dev_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= modExp_dev_while_C_9;
      WHEN modExp_dev_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= modExp_dev_while_C_10;
      WHEN modExp_dev_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= modExp_dev_while_C_11;
      WHEN modExp_dev_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        IF ( modExp_dev_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_dev_while_C_0;
        END IF;
      WHEN STAGE_VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        IF ( STAGE_VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        IF ( COMP_LOOP_C_16_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        IF ( COMP_LOOP_1_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_17;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        IF ( COMP_LOOP_C_45_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_46;
        END IF;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        IF ( COMP_LOOP_2_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_62;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        IF ( COMP_LOOP_C_90_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_91;
        END IF;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_3_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        IF ( COMP_LOOP_3_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_107;
        ELSE
          state_var_NS <= COMP_LOOP_3_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        IF ( COMP_LOOP_C_135_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_136;
        END IF;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_4_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        IF ( COMP_LOOP_4_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_152;
        ELSE
          state_var_NS <= COMP_LOOP_4_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_C_169;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        IF ( COMP_LOOP_C_180_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_181;
        END IF;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_C_186;
      WHEN COMP_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_C_187;
      WHEN COMP_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_C_188;
      WHEN COMP_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_189;
      WHEN COMP_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_190;
      WHEN COMP_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_191;
      WHEN COMP_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_192;
      WHEN COMP_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_193;
      WHEN COMP_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_194;
      WHEN COMP_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_195;
      WHEN COMP_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_196;
      WHEN COMP_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_5_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        IF ( COMP_LOOP_5_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_197;
        ELSE
          state_var_NS <= COMP_LOOP_5_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_C_198;
      WHEN COMP_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_C_199;
      WHEN COMP_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_C_200;
      WHEN COMP_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_C_201;
      WHEN COMP_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_C_202;
      WHEN COMP_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_C_203;
      WHEN COMP_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_C_204;
      WHEN COMP_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_C_205;
      WHEN COMP_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_C_206;
      WHEN COMP_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_C_207;
      WHEN COMP_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_C_208;
      WHEN COMP_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_C_209;
      WHEN COMP_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_C_210;
      WHEN COMP_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_C_211;
      WHEN COMP_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_C_212;
      WHEN COMP_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_C_213;
      WHEN COMP_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_C_214;
      WHEN COMP_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_C_215;
      WHEN COMP_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        state_var_NS <= COMP_LOOP_C_216;
      WHEN COMP_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_C_217;
      WHEN COMP_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_C_218;
      WHEN COMP_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_C_219;
      WHEN COMP_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_C_220;
      WHEN COMP_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_C_221;
      WHEN COMP_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_C_222;
      WHEN COMP_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_C_223;
      WHEN COMP_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_C_224;
      WHEN COMP_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_C_225;
      WHEN COMP_LOOP_C_225 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        IF ( COMP_LOOP_C_225_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_226;
        END IF;
      WHEN COMP_LOOP_C_226 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_C_227;
      WHEN COMP_LOOP_C_227 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_C_228;
      WHEN COMP_LOOP_C_228 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_C_229;
      WHEN COMP_LOOP_C_229 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_C_230;
      WHEN COMP_LOOP_C_230 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= COMP_LOOP_C_231;
      WHEN COMP_LOOP_C_231 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_C_232;
      WHEN COMP_LOOP_C_232 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_C_233;
      WHEN COMP_LOOP_C_233 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_C_234;
      WHEN COMP_LOOP_C_234 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= COMP_LOOP_C_235;
      WHEN COMP_LOOP_C_235 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        state_var_NS <= COMP_LOOP_C_236;
      WHEN COMP_LOOP_C_236 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= COMP_LOOP_C_237;
      WHEN COMP_LOOP_C_237 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_C_238;
      WHEN COMP_LOOP_C_238 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_C_239;
      WHEN COMP_LOOP_C_239 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_C_240;
      WHEN COMP_LOOP_C_240 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_C_241;
      WHEN COMP_LOOP_C_241 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001000");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001001");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001010");
        state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_6_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001011");
        IF ( COMP_LOOP_6_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_242;
        ELSE
          state_var_NS <= COMP_LOOP_6_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_242 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001100");
        state_var_NS <= COMP_LOOP_C_243;
      WHEN COMP_LOOP_C_243 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001101");
        state_var_NS <= COMP_LOOP_C_244;
      WHEN COMP_LOOP_C_244 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001110");
        state_var_NS <= COMP_LOOP_C_245;
      WHEN COMP_LOOP_C_245 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001111");
        state_var_NS <= COMP_LOOP_C_246;
      WHEN COMP_LOOP_C_246 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010000");
        state_var_NS <= COMP_LOOP_C_247;
      WHEN COMP_LOOP_C_247 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010001");
        state_var_NS <= COMP_LOOP_C_248;
      WHEN COMP_LOOP_C_248 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010010");
        state_var_NS <= COMP_LOOP_C_249;
      WHEN COMP_LOOP_C_249 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010011");
        state_var_NS <= COMP_LOOP_C_250;
      WHEN COMP_LOOP_C_250 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010100");
        state_var_NS <= COMP_LOOP_C_251;
      WHEN COMP_LOOP_C_251 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010101");
        state_var_NS <= COMP_LOOP_C_252;
      WHEN COMP_LOOP_C_252 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010110");
        state_var_NS <= COMP_LOOP_C_253;
      WHEN COMP_LOOP_C_253 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010111");
        state_var_NS <= COMP_LOOP_C_254;
      WHEN COMP_LOOP_C_254 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011000");
        state_var_NS <= COMP_LOOP_C_255;
      WHEN COMP_LOOP_C_255 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011001");
        state_var_NS <= COMP_LOOP_C_256;
      WHEN COMP_LOOP_C_256 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011010");
        state_var_NS <= COMP_LOOP_C_257;
      WHEN COMP_LOOP_C_257 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011011");
        state_var_NS <= COMP_LOOP_C_258;
      WHEN COMP_LOOP_C_258 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011100");
        state_var_NS <= COMP_LOOP_C_259;
      WHEN COMP_LOOP_C_259 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011101");
        state_var_NS <= COMP_LOOP_C_260;
      WHEN COMP_LOOP_C_260 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011110");
        state_var_NS <= COMP_LOOP_C_261;
      WHEN COMP_LOOP_C_261 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011111");
        state_var_NS <= COMP_LOOP_C_262;
      WHEN COMP_LOOP_C_262 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100000");
        state_var_NS <= COMP_LOOP_C_263;
      WHEN COMP_LOOP_C_263 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100001");
        state_var_NS <= COMP_LOOP_C_264;
      WHEN COMP_LOOP_C_264 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100010");
        state_var_NS <= COMP_LOOP_C_265;
      WHEN COMP_LOOP_C_265 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100011");
        state_var_NS <= COMP_LOOP_C_266;
      WHEN COMP_LOOP_C_266 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100100");
        state_var_NS <= COMP_LOOP_C_267;
      WHEN COMP_LOOP_C_267 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100101");
        state_var_NS <= COMP_LOOP_C_268;
      WHEN COMP_LOOP_C_268 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100110");
        state_var_NS <= COMP_LOOP_C_269;
      WHEN COMP_LOOP_C_269 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100111");
        state_var_NS <= COMP_LOOP_C_270;
      WHEN COMP_LOOP_C_270 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101000");
        IF ( COMP_LOOP_C_270_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_271;
        END IF;
      WHEN COMP_LOOP_C_271 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101001");
        state_var_NS <= COMP_LOOP_C_272;
      WHEN COMP_LOOP_C_272 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101010");
        state_var_NS <= COMP_LOOP_C_273;
      WHEN COMP_LOOP_C_273 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101011");
        state_var_NS <= COMP_LOOP_C_274;
      WHEN COMP_LOOP_C_274 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101100");
        state_var_NS <= COMP_LOOP_C_275;
      WHEN COMP_LOOP_C_275 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101101");
        state_var_NS <= COMP_LOOP_C_276;
      WHEN COMP_LOOP_C_276 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101110");
        state_var_NS <= COMP_LOOP_C_277;
      WHEN COMP_LOOP_C_277 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101111");
        state_var_NS <= COMP_LOOP_C_278;
      WHEN COMP_LOOP_C_278 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110000");
        state_var_NS <= COMP_LOOP_C_279;
      WHEN COMP_LOOP_C_279 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110001");
        state_var_NS <= COMP_LOOP_C_280;
      WHEN COMP_LOOP_C_280 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110010");
        state_var_NS <= COMP_LOOP_C_281;
      WHEN COMP_LOOP_C_281 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110011");
        state_var_NS <= COMP_LOOP_C_282;
      WHEN COMP_LOOP_C_282 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110100");
        state_var_NS <= COMP_LOOP_C_283;
      WHEN COMP_LOOP_C_283 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110101");
        state_var_NS <= COMP_LOOP_C_284;
      WHEN COMP_LOOP_C_284 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110110");
        state_var_NS <= COMP_LOOP_C_285;
      WHEN COMP_LOOP_C_285 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110111");
        state_var_NS <= COMP_LOOP_C_286;
      WHEN COMP_LOOP_C_286 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111000");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111001");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111010");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111011");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111100");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111101");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111110");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111111");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000000");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000001");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000010");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000011");
        state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_7_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000100");
        IF ( COMP_LOOP_7_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_287;
        ELSE
          state_var_NS <= COMP_LOOP_7_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_287 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000101");
        state_var_NS <= COMP_LOOP_C_288;
      WHEN COMP_LOOP_C_288 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000110");
        state_var_NS <= COMP_LOOP_C_289;
      WHEN COMP_LOOP_C_289 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000111");
        state_var_NS <= COMP_LOOP_C_290;
      WHEN COMP_LOOP_C_290 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001000");
        state_var_NS <= COMP_LOOP_C_291;
      WHEN COMP_LOOP_C_291 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001001");
        state_var_NS <= COMP_LOOP_C_292;
      WHEN COMP_LOOP_C_292 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001010");
        state_var_NS <= COMP_LOOP_C_293;
      WHEN COMP_LOOP_C_293 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001011");
        state_var_NS <= COMP_LOOP_C_294;
      WHEN COMP_LOOP_C_294 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001100");
        state_var_NS <= COMP_LOOP_C_295;
      WHEN COMP_LOOP_C_295 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001101");
        state_var_NS <= COMP_LOOP_C_296;
      WHEN COMP_LOOP_C_296 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001110");
        state_var_NS <= COMP_LOOP_C_297;
      WHEN COMP_LOOP_C_297 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001111");
        state_var_NS <= COMP_LOOP_C_298;
      WHEN COMP_LOOP_C_298 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010000");
        state_var_NS <= COMP_LOOP_C_299;
      WHEN COMP_LOOP_C_299 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010001");
        state_var_NS <= COMP_LOOP_C_300;
      WHEN COMP_LOOP_C_300 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010010");
        state_var_NS <= COMP_LOOP_C_301;
      WHEN COMP_LOOP_C_301 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010011");
        state_var_NS <= COMP_LOOP_C_302;
      WHEN COMP_LOOP_C_302 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010100");
        state_var_NS <= COMP_LOOP_C_303;
      WHEN COMP_LOOP_C_303 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010101");
        state_var_NS <= COMP_LOOP_C_304;
      WHEN COMP_LOOP_C_304 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010110");
        state_var_NS <= COMP_LOOP_C_305;
      WHEN COMP_LOOP_C_305 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010111");
        state_var_NS <= COMP_LOOP_C_306;
      WHEN COMP_LOOP_C_306 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011000");
        state_var_NS <= COMP_LOOP_C_307;
      WHEN COMP_LOOP_C_307 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011001");
        state_var_NS <= COMP_LOOP_C_308;
      WHEN COMP_LOOP_C_308 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011010");
        state_var_NS <= COMP_LOOP_C_309;
      WHEN COMP_LOOP_C_309 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011011");
        state_var_NS <= COMP_LOOP_C_310;
      WHEN COMP_LOOP_C_310 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011100");
        state_var_NS <= COMP_LOOP_C_311;
      WHEN COMP_LOOP_C_311 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011101");
        state_var_NS <= COMP_LOOP_C_312;
      WHEN COMP_LOOP_C_312 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011110");
        state_var_NS <= COMP_LOOP_C_313;
      WHEN COMP_LOOP_C_313 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011111");
        state_var_NS <= COMP_LOOP_C_314;
      WHEN COMP_LOOP_C_314 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100000");
        state_var_NS <= COMP_LOOP_C_315;
      WHEN COMP_LOOP_C_315 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100001");
        IF ( COMP_LOOP_C_315_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_316;
        END IF;
      WHEN COMP_LOOP_C_316 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100010");
        state_var_NS <= COMP_LOOP_C_317;
      WHEN COMP_LOOP_C_317 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100011");
        state_var_NS <= COMP_LOOP_C_318;
      WHEN COMP_LOOP_C_318 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100100");
        state_var_NS <= COMP_LOOP_C_319;
      WHEN COMP_LOOP_C_319 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100101");
        state_var_NS <= COMP_LOOP_C_320;
      WHEN COMP_LOOP_C_320 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100110");
        state_var_NS <= COMP_LOOP_C_321;
      WHEN COMP_LOOP_C_321 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100111");
        state_var_NS <= COMP_LOOP_C_322;
      WHEN COMP_LOOP_C_322 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101000");
        state_var_NS <= COMP_LOOP_C_323;
      WHEN COMP_LOOP_C_323 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101001");
        state_var_NS <= COMP_LOOP_C_324;
      WHEN COMP_LOOP_C_324 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101010");
        state_var_NS <= COMP_LOOP_C_325;
      WHEN COMP_LOOP_C_325 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101011");
        state_var_NS <= COMP_LOOP_C_326;
      WHEN COMP_LOOP_C_326 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101100");
        state_var_NS <= COMP_LOOP_C_327;
      WHEN COMP_LOOP_C_327 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101101");
        state_var_NS <= COMP_LOOP_C_328;
      WHEN COMP_LOOP_C_328 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101110");
        state_var_NS <= COMP_LOOP_C_329;
      WHEN COMP_LOOP_C_329 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101111");
        state_var_NS <= COMP_LOOP_C_330;
      WHEN COMP_LOOP_C_330 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110000");
        state_var_NS <= COMP_LOOP_C_331;
      WHEN COMP_LOOP_C_331 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110001");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_0;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110010");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_1;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110011");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_2;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110100");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_3;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110101");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_4;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110110");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_5;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110111");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_6;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111000");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_7;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111001");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_8;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111010");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_9;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111011");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_10;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111100");
        state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_11;
      WHEN COMP_LOOP_8_modExp_dev_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111101");
        IF ( COMP_LOOP_8_modExp_dev_1_while_C_11_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_332;
        ELSE
          state_var_NS <= COMP_LOOP_8_modExp_dev_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_332 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111110");
        state_var_NS <= COMP_LOOP_C_333;
      WHEN COMP_LOOP_C_333 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111111");
        state_var_NS <= COMP_LOOP_C_334;
      WHEN COMP_LOOP_C_334 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000000");
        state_var_NS <= COMP_LOOP_C_335;
      WHEN COMP_LOOP_C_335 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000001");
        state_var_NS <= COMP_LOOP_C_336;
      WHEN COMP_LOOP_C_336 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000010");
        state_var_NS <= COMP_LOOP_C_337;
      WHEN COMP_LOOP_C_337 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000011");
        state_var_NS <= COMP_LOOP_C_338;
      WHEN COMP_LOOP_C_338 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000100");
        state_var_NS <= COMP_LOOP_C_339;
      WHEN COMP_LOOP_C_339 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000101");
        state_var_NS <= COMP_LOOP_C_340;
      WHEN COMP_LOOP_C_340 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000110");
        state_var_NS <= COMP_LOOP_C_341;
      WHEN COMP_LOOP_C_341 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000111");
        state_var_NS <= COMP_LOOP_C_342;
      WHEN COMP_LOOP_C_342 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001000");
        state_var_NS <= COMP_LOOP_C_343;
      WHEN COMP_LOOP_C_343 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001001");
        state_var_NS <= COMP_LOOP_C_344;
      WHEN COMP_LOOP_C_344 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001010");
        state_var_NS <= COMP_LOOP_C_345;
      WHEN COMP_LOOP_C_345 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001011");
        state_var_NS <= COMP_LOOP_C_346;
      WHEN COMP_LOOP_C_346 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001100");
        state_var_NS <= COMP_LOOP_C_347;
      WHEN COMP_LOOP_C_347 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001101");
        state_var_NS <= COMP_LOOP_C_348;
      WHEN COMP_LOOP_C_348 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001110");
        state_var_NS <= COMP_LOOP_C_349;
      WHEN COMP_LOOP_C_349 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001111");
        state_var_NS <= COMP_LOOP_C_350;
      WHEN COMP_LOOP_C_350 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010000");
        state_var_NS <= COMP_LOOP_C_351;
      WHEN COMP_LOOP_C_351 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010001");
        state_var_NS <= COMP_LOOP_C_352;
      WHEN COMP_LOOP_C_352 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010010");
        state_var_NS <= COMP_LOOP_C_353;
      WHEN COMP_LOOP_C_353 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010011");
        state_var_NS <= COMP_LOOP_C_354;
      WHEN COMP_LOOP_C_354 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010100");
        state_var_NS <= COMP_LOOP_C_355;
      WHEN COMP_LOOP_C_355 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010101");
        state_var_NS <= COMP_LOOP_C_356;
      WHEN COMP_LOOP_C_356 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010110");
        state_var_NS <= COMP_LOOP_C_357;
      WHEN COMP_LOOP_C_357 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010111");
        state_var_NS <= COMP_LOOP_C_358;
      WHEN COMP_LOOP_C_358 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011000");
        state_var_NS <= COMP_LOOP_C_359;
      WHEN COMP_LOOP_C_359 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011001");
        state_var_NS <= COMP_LOOP_C_360;
      WHEN COMP_LOOP_C_360 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011010");
        IF ( COMP_LOOP_C_360_tr0 = '1' ) THEN
          state_var_NS <= STAGE_VEC_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011011");
        IF ( STAGE_VEC_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= STAGE_MAIN_LOOP_C_4;
        ELSE
          state_var_NS <= STAGE_VEC_LOOP_C_0;
        END IF;
      WHEN STAGE_MAIN_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011100");
        IF ( STAGE_MAIN_LOOP_C_4_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_MAIN_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011101");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000");
        state_var_NS <= STAGE_MAIN_LOOP_C_0;
    END CASE;
  END PROCESS inPlaceNTT_DIF_core_core_fsm_1;

  inPlaceNTT_DIF_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS inPlaceNTT_DIF_core_core_fsm_1_REG;

END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core_wait_dp;

ARCHITECTURE v6 OF inPlaceNTT_DIF_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_2_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_3_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_4_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_5_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_6_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_7_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core;

ARCHITECTURE v6 OF inPlaceNTT_DIF_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL modExp_dev_while_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_while_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_div_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_div_cmp_b : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_div_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_1_operator_64_false_acc_tmp : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL or_tmp : STD_LOGIC;
  SIGNAL or_tmp_1 : STD_LOGIC;
  SIGNAL nor_tmp_2 : STD_LOGIC;
  SIGNAL nor_tmp_3 : STD_LOGIC;
  SIGNAL and_dcpl_1 : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL mux_tmp_86 : STD_LOGIC;
  SIGNAL nor_tmp_45 : STD_LOGIC;
  SIGNAL or_tmp_152 : STD_LOGIC;
  SIGNAL or_tmp_168 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL mux_tmp_323 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL not_tmp_184 : STD_LOGIC;
  SIGNAL not_tmp_212 : STD_LOGIC;
  SIGNAL not_tmp_217 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL nor_tmp_169 : STD_LOGIC;
  SIGNAL or_tmp_720 : STD_LOGIC;
  SIGNAL or_tmp_721 : STD_LOGIC;
  SIGNAL mux_tmp_587 : STD_LOGIC;
  SIGNAL mux_tmp_588 : STD_LOGIC;
  SIGNAL or_tmp_722 : STD_LOGIC;
  SIGNAL or_tmp_723 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL or_tmp_737 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL and_dcpl_141 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL or_tmp_751 : STD_LOGIC;
  SIGNAL mux_tmp_634 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL mux_tmp_647 : STD_LOGIC;
  SIGNAL mux_tmp_648 : STD_LOGIC;
  SIGNAL or_tmp_767 : STD_LOGIC;
  SIGNAL mux_tmp_650 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL or_tmp_770 : STD_LOGIC;
  SIGNAL or_tmp_772 : STD_LOGIC;
  SIGNAL or_tmp_775 : STD_LOGIC;
  SIGNAL or_tmp_779 : STD_LOGIC;
  SIGNAL or_tmp_784 : STD_LOGIC;
  SIGNAL and_dcpl_160 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL and_tmp_14 : STD_LOGIC;
  SIGNAL not_tmp_324 : STD_LOGIC;
  SIGNAL or_tmp_823 : STD_LOGIC;
  SIGNAL mux_tmp_693 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL mux_tmp_729 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL or_tmp_896 : STD_LOGIC;
  SIGNAL or_tmp_897 : STD_LOGIC;
  SIGNAL mux_tmp_834 : STD_LOGIC;
  SIGNAL mux_tmp_836 : STD_LOGIC;
  SIGNAL not_tmp_377 : STD_LOGIC;
  SIGNAL or_tmp_920 : STD_LOGIC;
  SIGNAL or_tmp_921 : STD_LOGIC;
  SIGNAL or_tmp_923 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL mux_tmp_856 : STD_LOGIC;
  SIGNAL or_tmp_967 : STD_LOGIC;
  SIGNAL or_tmp_969 : STD_LOGIC;
  SIGNAL mux_tmp_891 : STD_LOGIC;
  SIGNAL or_tmp_970 : STD_LOGIC;
  SIGNAL mux_tmp_893 : STD_LOGIC;
  SIGNAL mux_tmp_895 : STD_LOGIC;
  SIGNAL or_tmp_973 : STD_LOGIC;
  SIGNAL or_tmp_976 : STD_LOGIC;
  SIGNAL mux_tmp_902 : STD_LOGIC;
  SIGNAL mux_tmp_903 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_cse_6_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_VEC_LOOP_j_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_4_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_7_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_3_sva_5_0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_slc_operator_64_false_acc_1_60_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_9_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_6_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_6_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_5_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_4_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_3_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_8_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_4_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_7_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_7_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_lshift_psp_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_cse_2_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_2_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_3_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_4_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_5_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_6_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_7_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_cse_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_188_m1c : STD_LOGIC;
  SIGNAL and_189_m1c : STD_LOGIC;
  SIGNAL and_190_m1c : STD_LOGIC;
  SIGNAL and_193_m1c : STD_LOGIC;
  SIGNAL and_195_m1c : STD_LOGIC;
  SIGNAL and_198_m1c : STD_LOGIC;
  SIGNAL and_200_m1c : STD_LOGIC;
  SIGNAL nand_135_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_7_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_772_cse : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL nand_93_cse : STD_LOGIC;
  SIGNAL and_378_cse : STD_LOGIC;
  SIGNAL or_953_cse : STD_LOGIC;
  SIGNAL or_1035_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_16_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_28_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_40_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_52_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_64_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_76_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_88_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_17_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_29_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_41_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_53_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_65_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_77_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_89_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_18_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_30_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_42_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_54_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_66_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_78_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_90_cse : STD_LOGIC;
  SIGNAL and_257_cse : STD_LOGIC;
  SIGNAL nor_449_cse : STD_LOGIC;
  SIGNAL or_1027_cse : STD_LOGIC;
  SIGNAL and_327_cse : STD_LOGIC;
  SIGNAL and_354_cse : STD_LOGIC;
  SIGNAL nand_142_cse : STD_LOGIC;
  SIGNAL nor_121_cse : STD_LOGIC;
  SIGNAL nor_127_cse : STD_LOGIC;
  SIGNAL mux_812_cse : STD_LOGIC;
  SIGNAL and_250_cse : STD_LOGIC;
  SIGNAL nor_227_cse : STD_LOGIC;
  SIGNAL mux_816_cse : STD_LOGIC;
  SIGNAL mux_820_cse : STD_LOGIC;
  SIGNAL mux_821_cse : STD_LOGIC;
  SIGNAL mux_644_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_86_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_145_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_30_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_60_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_32_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_33_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_34_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_4_itm : STD_LOGIC;
  SIGNAL tmp_1_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_10_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_dev_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_5_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_37_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_39_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_40_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_41_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_9_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_65_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_67_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_68_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_69_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_93_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_95_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_96_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_97_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_17_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_121_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_123_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_124_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_125_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_21_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_149_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_151_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_152_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_153_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_25_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_177_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_179_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_180_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_181_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_29_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_205_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_207_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_208_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_209_itm : STD_LOGIC;
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_702_itm : STD_LOGIC;
  SIGNAL mux_864_itm : STD_LOGIC;
  SIGNAL mux_893_itm : STD_LOGIC;
  SIGNAL mux_900_itm : STD_LOGIC;
  SIGNAL mux_908_itm : STD_LOGIC;
  SIGNAL or_tmp_984 : STD_LOGIC;
  SIGNAL mux_tmp_920 : STD_LOGIC;
  SIGNAL or_tmp_988 : STD_LOGIC;
  SIGNAL and_dcpl_222 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_237 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_241 : STD_LOGIC;
  SIGNAL and_dcpl_245 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_250 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_257 : STD_LOGIC;
  SIGNAL and_dcpl_258 : STD_LOGIC;
  SIGNAL and_dcpl_259 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_264 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_268 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_275 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_279 : STD_LOGIC;
  SIGNAL and_dcpl_282 : STD_LOGIC;
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL and_dcpl_290 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_297 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL and_dcpl_299 : STD_LOGIC;
  SIGNAL and_dcpl_300 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL not_tmp_465 : STD_LOGIC;
  SIGNAL not_tmp_468 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_dcpl_311 : STD_LOGIC;
  SIGNAL and_dcpl_319 : STD_LOGIC;
  SIGNAL and_dcpl_327 : STD_LOGIC;
  SIGNAL and_dcpl_329 : STD_LOGIC;
  SIGNAL and_dcpl_331 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_346 : STD_LOGIC;
  SIGNAL and_dcpl_353 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL and_dcpl_365 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (60 DOWNTO 0);
  SIGNAL and_dcpl_379 : STD_LOGIC;
  SIGNAL and_dcpl_401 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_acc_1_psp_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL modExp_dev_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_1_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_9_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_12_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_13_itm : STD_LOGIC;
  SIGNAL modExp_dev_exp_1_sva_63_9 : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL modExp_dev_exp_1_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_lshift_psp_1_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c4 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c5 : STD_LOGIC;
  SIGNAL STAGE_VEC_LOOP_j_sva_9_0_mx0c1 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c3 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c4 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c5 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c6 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c7 : STD_LOGIC;
  SIGNAL operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c1 : STD_LOGIC;
  SIGNAL operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c2 : STD_LOGIC;
  SIGNAL tmp_1_lpi_4_dfm_mx0c0 : STD_LOGIC;
  SIGNAL and_186_rgt : STD_LOGIC;
  SIGNAL nand_86_cse : STD_LOGIC;
  SIGNAL nor_263_cse : STD_LOGIC;
  SIGNAL mux_965_cse : STD_LOGIC;
  SIGNAL mux_645_cse : STD_LOGIC;
  SIGNAL and_503_cse : STD_LOGIC;
  SIGNAL and_512_cse : STD_LOGIC;
  SIGNAL and_519_cse : STD_LOGIC;
  SIGNAL and_522_cse : STD_LOGIC;
  SIGNAL and_530_cse : STD_LOGIC;
  SIGNAL and_534_cse : STD_LOGIC;
  SIGNAL nor_tmp_234 : STD_LOGIC;
  SIGNAL nand_tmp_75 : STD_LOGIC;
  SIGNAL mux_tmp_958 : STD_LOGIC;
  SIGNAL or_tmp_1051 : STD_LOGIC;
  SIGNAL mux_tmp_962 : STD_LOGIC;
  SIGNAL or_tmp_1054 : STD_LOGIC;
  SIGNAL nor_tmp_237 : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_mux_rgt : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_6 : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_psp_sva_5_0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL or_952_cse : STD_LOGIC;
  SIGNAL nand_177_cse : STD_LOGIC;
  SIGNAL and_348_cse : STD_LOGIC;
  SIGNAL or_1183_cse : STD_LOGIC;
  SIGNAL nand_205_cse : STD_LOGIC;
  SIGNAL nand_203_cse : STD_LOGIC;
  SIGNAL nor_607_cse : STD_LOGIC;
  SIGNAL nor_603_cse : STD_LOGIC;
  SIGNAL operator_64_false_or_4_itm : STD_LOGIC;
  SIGNAL operator_64_false_or_9_itm : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_or_1_cse : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_or_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_slc_acc_12_1_slc : STD_LOGIC_VECTOR (11 DOWNTO 0);

  SIGNAL mux_643_nl : STD_LOGIC;
  SIGNAL mux_642_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL mux_640_nl : STD_LOGIC;
  SIGNAL nand_176_nl : STD_LOGIC;
  SIGNAL mux_639_nl : STD_LOGIC;
  SIGNAL or_69_nl : STD_LOGIC;
  SIGNAL mux_638_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL mux_634_nl : STD_LOGIC;
  SIGNAL mux_633_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL mux_631_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL or_757_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL mux_623_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL mux_621_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL mux_617_nl : STD_LOGIC;
  SIGNAL mux_616_nl : STD_LOGIC;
  SIGNAL mux_612_nl : STD_LOGIC;
  SIGNAL mux_611_nl : STD_LOGIC;
  SIGNAL mux_610_nl : STD_LOGIC;
  SIGNAL mux_609_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL mux_695_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL or_816_nl : STD_LOGIC;
  SIGNAL mux_692_nl : STD_LOGIC;
  SIGNAL mux_691_nl : STD_LOGIC;
  SIGNAL mux_690_nl : STD_LOGIC;
  SIGNAL or_815_nl : STD_LOGIC;
  SIGNAL mux_689_nl : STD_LOGIC;
  SIGNAL nand_58_nl : STD_LOGIC;
  SIGNAL or_814_nl : STD_LOGIC;
  SIGNAL mux_688_nl : STD_LOGIC;
  SIGNAL or_813_nl : STD_LOGIC;
  SIGNAL mux_687_nl : STD_LOGIC;
  SIGNAL or_810_nl : STD_LOGIC;
  SIGNAL mux_686_nl : STD_LOGIC;
  SIGNAL or_807_nl : STD_LOGIC;
  SIGNAL mux_685_nl : STD_LOGIC;
  SIGNAL mux_684_nl : STD_LOGIC;
  SIGNAL mux_683_nl : STD_LOGIC;
  SIGNAL or_806_nl : STD_LOGIC;
  SIGNAL mux_682_nl : STD_LOGIC;
  SIGNAL mux_681_nl : STD_LOGIC;
  SIGNAL nor_258_nl : STD_LOGIC;
  SIGNAL mux_680_nl : STD_LOGIC;
  SIGNAL or_801_nl : STD_LOGIC;
  SIGNAL mux_679_nl : STD_LOGIC;
  SIGNAL mux_678_nl : STD_LOGIC;
  SIGNAL nand_57_nl : STD_LOGIC;
  SIGNAL mux_676_nl : STD_LOGIC;
  SIGNAL nand_56_nl : STD_LOGIC;
  SIGNAL nor_255_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_2_nl : STD_LOGIC;
  SIGNAL mux_752_nl : STD_LOGIC;
  SIGNAL nor_243_nl : STD_LOGIC;
  SIGNAL and_187_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL mux_787_nl : STD_LOGIC;
  SIGNAL mux_786_nl : STD_LOGIC;
  SIGNAL mux_785_nl : STD_LOGIC;
  SIGNAL mux_784_nl : STD_LOGIC;
  SIGNAL mux_783_nl : STD_LOGIC;
  SIGNAL nor_239_nl : STD_LOGIC;
  SIGNAL or_901_nl : STD_LOGIC;
  SIGNAL mux_782_nl : STD_LOGIC;
  SIGNAL or_900_nl : STD_LOGIC;
  SIGNAL mux_781_nl : STD_LOGIC;
  SIGNAL mux_780_nl : STD_LOGIC;
  SIGNAL or_899_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL mux_774_nl : STD_LOGIC;
  SIGNAL mux_773_nl : STD_LOGIC;
  SIGNAL mux_772_nl : STD_LOGIC;
  SIGNAL mux_771_nl : STD_LOGIC;
  SIGNAL mux_770_nl : STD_LOGIC;
  SIGNAL nor_240_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL mux_767_nl : STD_LOGIC;
  SIGNAL mux_766_nl : STD_LOGIC;
  SIGNAL mux_765_nl : STD_LOGIC;
  SIGNAL mux_764_nl : STD_LOGIC;
  SIGNAL mux_763_nl : STD_LOGIC;
  SIGNAL or_897_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL nor_241_nl : STD_LOGIC;
  SIGNAL mux_760_nl : STD_LOGIC;
  SIGNAL mux_759_nl : STD_LOGIC;
  SIGNAL mux_758_nl : STD_LOGIC;
  SIGNAL mux_757_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_11_nl : STD_LOGIC;
  SIGNAL modExp_dev_while_or_nl : STD_LOGIC;
  SIGNAL modExp_dev_while_or_1_nl : STD_LOGIC;
  SIGNAL nand_192_nl : STD_LOGIC;
  SIGNAL mux_979_nl : STD_LOGIC;
  SIGNAL nor_616_nl : STD_LOGIC;
  SIGNAL nor_617_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_k_COMP_LOOP_k_mux_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux_835_nl : STD_LOGIC;
  SIGNAL mux_834_nl : STD_LOGIC;
  SIGNAL mux_833_nl : STD_LOGIC;
  SIGNAL mux_832_nl : STD_LOGIC;
  SIGNAL mux_856_nl : STD_LOGIC;
  SIGNAL mux_855_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL mux_854_nl : STD_LOGIC;
  SIGNAL mux_828_nl : STD_LOGIC;
  SIGNAL mux_827_nl : STD_LOGIC;
  SIGNAL or_944_nl : STD_LOGIC;
  SIGNAL mux_851_nl : STD_LOGIC;
  SIGNAL and_210_nl : STD_LOGIC;
  SIGNAL mux_850_nl : STD_LOGIC;
  SIGNAL mux_849_nl : STD_LOGIC;
  SIGNAL mux_848_nl : STD_LOGIC;
  SIGNAL mux_847_nl : STD_LOGIC;
  SIGNAL or_951_nl : STD_LOGIC;
  SIGNAL mux_844_nl : STD_LOGIC;
  SIGNAL mux_843_nl : STD_LOGIC;
  SIGNAL mux_842_nl : STD_LOGIC;
  SIGNAL mux_840_nl : STD_LOGIC;
  SIGNAL or_950_nl : STD_LOGIC;
  SIGNAL mux_839_nl : STD_LOGIC;
  SIGNAL or_949_nl : STD_LOGIC;
  SIGNAL mux_838_nl : STD_LOGIC;
  SIGNAL mux_836_nl : STD_LOGIC;
  SIGNAL or_945_nl : STD_LOGIC;
  SIGNAL mux_1001_nl : STD_LOGIC;
  SIGNAL mux_1000_nl : STD_LOGIC;
  SIGNAL mux_999_nl : STD_LOGIC;
  SIGNAL mux_998_nl : STD_LOGIC;
  SIGNAL mux_997_nl : STD_LOGIC;
  SIGNAL or_1146_nl : STD_LOGIC;
  SIGNAL mux_996_nl : STD_LOGIC;
  SIGNAL mux_995_nl : STD_LOGIC;
  SIGNAL mux_994_nl : STD_LOGIC;
  SIGNAL mux_993_nl : STD_LOGIC;
  SIGNAL mux_992_nl : STD_LOGIC;
  SIGNAL nand_201_nl : STD_LOGIC;
  SIGNAL mux_990_nl : STD_LOGIC;
  SIGNAL mux_988_nl : STD_LOGIC;
  SIGNAL or_1143_nl : STD_LOGIC;
  SIGNAL mux_987_nl : STD_LOGIC;
  SIGNAL mux_986_nl : STD_LOGIC;
  SIGNAL mux_984_nl : STD_LOGIC;
  SIGNAL mux_983_nl : STD_LOGIC;
  SIGNAL or_1139_nl : STD_LOGIC;
  SIGNAL mux_981_nl : STD_LOGIC;
  SIGNAL mux_980_nl : STD_LOGIC;
  SIGNAL or_1136_nl : STD_LOGIC;
  SIGNAL mux_1013_nl : STD_LOGIC;
  SIGNAL nor_605_nl : STD_LOGIC;
  SIGNAL mux_1012_nl : STD_LOGIC;
  SIGNAL nand_200_nl : STD_LOGIC;
  SIGNAL or_1160_nl : STD_LOGIC;
  SIGNAL mux_1011_nl : STD_LOGIC;
  SIGNAL mux_1010_nl : STD_LOGIC;
  SIGNAL mux_1009_nl : STD_LOGIC;
  SIGNAL mux_1008_nl : STD_LOGIC;
  SIGNAL mux_1007_nl : STD_LOGIC;
  SIGNAL nor_606_nl : STD_LOGIC;
  SIGNAL nor_608_nl : STD_LOGIC;
  SIGNAL nor_609_nl : STD_LOGIC;
  SIGNAL and_627_nl : STD_LOGIC;
  SIGNAL mux_1006_nl : STD_LOGIC;
  SIGNAL mux_1005_nl : STD_LOGIC;
  SIGNAL nor_610_nl : STD_LOGIC;
  SIGNAL mux_1004_nl : STD_LOGIC;
  SIGNAL nor_611_nl : STD_LOGIC;
  SIGNAL mux_1003_nl : STD_LOGIC;
  SIGNAL nor_612_nl : STD_LOGIC;
  SIGNAL nor_613_nl : STD_LOGIC;
  SIGNAL and_628_nl : STD_LOGIC;
  SIGNAL mux_1002_nl : STD_LOGIC;
  SIGNAL nor_614_nl : STD_LOGIC;
  SIGNAL nor_615_nl : STD_LOGIC;
  SIGNAL or_959_nl : STD_LOGIC;
  SIGNAL mux_866_nl : STD_LOGIC;
  SIGNAL nand_168_nl : STD_LOGIC;
  SIGNAL mux_868_nl : STD_LOGIC;
  SIGNAL mux_867_nl : STD_LOGIC;
  SIGNAL mux_870_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL mux_869_nl : STD_LOGIC;
  SIGNAL or_963_nl : STD_LOGIC;
  SIGNAL mux_873_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL mux_876_nl : STD_LOGIC;
  SIGNAL nand_76_nl : STD_LOGIC;
  SIGNAL mux_875_nl : STD_LOGIC;
  SIGNAL and_222_nl : STD_LOGIC;
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL or_975_nl : STD_LOGIC;
  SIGNAL mux_878_nl : STD_LOGIC;
  SIGNAL or_974_nl : STD_LOGIC;
  SIGNAL or_977_nl : STD_LOGIC;
  SIGNAL mux_880_nl : STD_LOGIC;
  SIGNAL and_254_nl : STD_LOGIC;
  SIGNAL mux_890_nl : STD_LOGIC;
  SIGNAL mux_889_nl : STD_LOGIC;
  SIGNAL mux_888_nl : STD_LOGIC;
  SIGNAL mux_887_nl : STD_LOGIC;
  SIGNAL mux_886_nl : STD_LOGIC;
  SIGNAL mux_885_nl : STD_LOGIC;
  SIGNAL mux_884_nl : STD_LOGIC;
  SIGNAL mux_896_nl : STD_LOGIC;
  SIGNAL mux_895_nl : STD_LOGIC;
  SIGNAL mux_894_nl : STD_LOGIC;
  SIGNAL nor_228_nl : STD_LOGIC;
  SIGNAL and_248_nl : STD_LOGIC;
  SIGNAL and_228_nl : STD_LOGIC;
  SIGNAL and_230_nl : STD_LOGIC;
  SIGNAL mux_905_nl : STD_LOGIC;
  SIGNAL mux_904_nl : STD_LOGIC;
  SIGNAL mux_903_nl : STD_LOGIC;
  SIGNAL mux_902_nl : STD_LOGIC;
  SIGNAL or_1026_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL nand_150_nl : STD_LOGIC;
  SIGNAL nand_148_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_18_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_104_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_161_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mux_946_nl : STD_LOGIC;
  SIGNAL mux_945_nl : STD_LOGIC;
  SIGNAL mux_944_nl : STD_LOGIC;
  SIGNAL mux_943_nl : STD_LOGIC;
  SIGNAL mux_942_nl : STD_LOGIC;
  SIGNAL mux_941_nl : STD_LOGIC;
  SIGNAL or_1024_nl : STD_LOGIC;
  SIGNAL mux_940_nl : STD_LOGIC;
  SIGNAL mux_939_nl : STD_LOGIC;
  SIGNAL mux_938_nl : STD_LOGIC;
  SIGNAL mux_937_nl : STD_LOGIC;
  SIGNAL mux_936_nl : STD_LOGIC;
  SIGNAL mux_935_nl : STD_LOGIC;
  SIGNAL mux_934_nl : STD_LOGIC;
  SIGNAL mux_933_nl : STD_LOGIC;
  SIGNAL mux_932_nl : STD_LOGIC;
  SIGNAL mux_931_nl : STD_LOGIC;
  SIGNAL mux_928_nl : STD_LOGIC;
  SIGNAL mux_927_nl : STD_LOGIC;
  SIGNAL mux_926_nl : STD_LOGIC;
  SIGNAL or_1018_nl : STD_LOGIC;
  SIGNAL mux_924_nl : STD_LOGIC;
  SIGNAL mux_923_nl : STD_LOGIC;
  SIGNAL mux_921_nl : STD_LOGIC;
  SIGNAL mux_919_nl : STD_LOGIC;
  SIGNAL and_238_nl : STD_LOGIC;
  SIGNAL and_239_nl : STD_LOGIC;
  SIGNAL and_240_nl : STD_LOGIC;
  SIGNAL and_241_nl : STD_LOGIC;
  SIGNAL and_242_nl : STD_LOGIC;
  SIGNAL and_243_nl : STD_LOGIC;
  SIGNAL nand_191_nl : STD_LOGIC;
  SIGNAL and_244_nl : STD_LOGIC;
  SIGNAL not_2187_nl : STD_LOGIC;
  SIGNAL mux_1033_nl : STD_LOGIC;
  SIGNAL mux_1032_nl : STD_LOGIC;
  SIGNAL mux_1031_nl : STD_LOGIC;
  SIGNAL or_1182_nl : STD_LOGIC;
  SIGNAL mux_1030_nl : STD_LOGIC;
  SIGNAL mux_1029_nl : STD_LOGIC;
  SIGNAL mux_1028_nl : STD_LOGIC;
  SIGNAL mux_1027_nl : STD_LOGIC;
  SIGNAL or_1180_nl : STD_LOGIC;
  SIGNAL mux_1026_nl : STD_LOGIC;
  SIGNAL mux_1025_nl : STD_LOGIC;
  SIGNAL or_1178_nl : STD_LOGIC;
  SIGNAL mux_1024_nl : STD_LOGIC;
  SIGNAL or_1175_nl : STD_LOGIC;
  SIGNAL mux_1023_nl : STD_LOGIC;
  SIGNAL mux_1022_nl : STD_LOGIC;
  SIGNAL or_1171_nl : STD_LOGIC;
  SIGNAL or_1169_nl : STD_LOGIC;
  SIGNAL mux_1021_nl : STD_LOGIC;
  SIGNAL mux_1020_nl : STD_LOGIC;
  SIGNAL mux_1019_nl : STD_LOGIC;
  SIGNAL or_1168_nl : STD_LOGIC;
  SIGNAL or_1167_nl : STD_LOGIC;
  SIGNAL mux_1018_nl : STD_LOGIC;
  SIGNAL mux_1017_nl : STD_LOGIC;
  SIGNAL mux_1016_nl : STD_LOGIC;
  SIGNAL nor_604_nl : STD_LOGIC;
  SIGNAL and_624_nl : STD_LOGIC;
  SIGNAL nand_204_nl : STD_LOGIC;
  SIGNAL or_1164_nl : STD_LOGIC;
  SIGNAL mux_1015_nl : STD_LOGIC;
  SIGNAL nand_199_nl : STD_LOGIC;
  SIGNAL or_228_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL and_60_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL or_229_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL mux_618_nl : STD_LOGIC;
  SIGNAL or_765_nl : STD_LOGIC;
  SIGNAL or_763_nl : STD_LOGIC;
  SIGNAL or_789_nl : STD_LOGIC;
  SIGNAL mux_701_nl : STD_LOGIC;
  SIGNAL or_828_nl : STD_LOGIC;
  SIGNAL mux_700_nl : STD_LOGIC;
  SIGNAL mux_699_nl : STD_LOGIC;
  SIGNAL or_826_nl : STD_LOGIC;
  SIGNAL or_824_nl : STD_LOGIC;
  SIGNAL or_823_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL nand_59_nl : STD_LOGIC;
  SIGNAL mux_696_nl : STD_LOGIC;
  SIGNAL nor_256_nl : STD_LOGIC;
  SIGNAL nor_257_nl : STD_LOGIC;
  SIGNAL or_819_nl : STD_LOGIC;
  SIGNAL mux_710_nl : STD_LOGIC;
  SIGNAL mux_709_nl : STD_LOGIC;
  SIGNAL nor_252_nl : STD_LOGIC;
  SIGNAL mux_708_nl : STD_LOGIC;
  SIGNAL nand_169_nl : STD_LOGIC;
  SIGNAL or_839_nl : STD_LOGIC;
  SIGNAL and_267_nl : STD_LOGIC;
  SIGNAL and_268_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL mux_706_nl : STD_LOGIC;
  SIGNAL nor_253_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL or_193_nl : STD_LOGIC;
  SIGNAL nor_254_nl : STD_LOGIC;
  SIGNAL or_859_nl : STD_LOGIC;
  SIGNAL or_857_nl : STD_LOGIC;
  SIGNAL and_211_nl : STD_LOGIC;
  SIGNAL mux_862_nl : STD_LOGIC;
  SIGNAL mux_753_nl : STD_LOGIC;
  SIGNAL and_212_nl : STD_LOGIC;
  SIGNAL mux_872_nl : STD_LOGIC;
  SIGNAL mux_871_nl : STD_LOGIC;
  SIGNAL or_967_nl : STD_LOGIC;
  SIGNAL mux_874_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL mux_877_nl : STD_LOGIC;
  SIGNAL nor_231_nl : STD_LOGIC;
  SIGNAL mux_882_nl : STD_LOGIC;
  SIGNAL nand_75_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL and_396_nl : STD_LOGIC;
  SIGNAL or_981_nl : STD_LOGIC;
  SIGNAL mux_892_nl : STD_LOGIC;
  SIGNAL and_227_nl : STD_LOGIC;
  SIGNAL or_985_nl : STD_LOGIC;
  SIGNAL mux_899_nl : STD_LOGIC;
  SIGNAL and_232_nl : STD_LOGIC;
  SIGNAL mux_907_nl : STD_LOGIC;
  SIGNAL mux_906_nl : STD_LOGIC;
  SIGNAL and_231_nl : STD_LOGIC;
  SIGNAL or_1015_nl : STD_LOGIC;
  SIGNAL mux_925_nl : STD_LOGIC;
  SIGNAL or_1021_nl : STD_LOGIC;
  SIGNAL mux_717_nl : STD_LOGIC;
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL nor_245_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL nand_172_nl : STD_LOGIC;
  SIGNAL or_850_nl : STD_LOGIC;
  SIGNAL nor_246_nl : STD_LOGIC;
  SIGNAL nor_247_nl : STD_LOGIC;
  SIGNAL mux_714_nl : STD_LOGIC;
  SIGNAL mux_713_nl : STD_LOGIC;
  SIGNAL nor_248_nl : STD_LOGIC;
  SIGNAL nor_249_nl : STD_LOGIC;
  SIGNAL and_266_nl : STD_LOGIC;
  SIGNAL mux_712_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL nor_251_nl : STD_LOGIC;
  SIGNAL nor_244_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC;
  SIGNAL mux_722_nl : STD_LOGIC;
  SIGNAL or_860_nl : STD_LOGIC;
  SIGNAL and_265_nl : STD_LOGIC;
  SIGNAL mux_721_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL or_854_nl : STD_LOGIC;
  SIGNAL and_72_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL and_79_nl : STD_LOGIC;
  SIGNAL and_83_nl : STD_LOGIC;
  SIGNAL and_85_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL nor_441_nl : STD_LOGIC;
  SIGNAL nor_442_nl : STD_LOGIC;
  SIGNAL nor_534_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL or_1071_nl : STD_LOGIC;
  SIGNAL or_1072_nl : STD_LOGIC;
  SIGNAL and_94_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL and_321_nl : STD_LOGIC;
  SIGNAL nor_438_nl : STD_LOGIC;
  SIGNAL and_98_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL and_320_nl : STD_LOGIC;
  SIGNAL nor_437_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL and_104_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL and_319_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL and_112_nl : STD_LOGIC;
  SIGNAL and_115_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL and_318_nl : STD_LOGIC;
  SIGNAL and_123_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL and_317_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL and_128_nl : STD_LOGIC;
  SIGNAL and_131_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL or_285_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL or_282_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL or_276_nl : STD_LOGIC;
  SIGNAL or_275_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL or_272_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL and_316_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL nor_424_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL or_265_nl : STD_LOGIC;
  SIGNAL or_264_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL or_263_nl : STD_LOGIC;
  SIGNAL or_261_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL or_317_nl : STD_LOGIC;
  SIGNAL or_316_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL or_313_nl : STD_LOGIC;
  SIGNAL or_311_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL and_313_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL and_314_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL or_301_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL and_315_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL or_295_nl : STD_LOGIC;
  SIGNAL or_293_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL and_310_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL and_311_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL or_341_nl : STD_LOGIC;
  SIGNAL or_340_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL and_312_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL or_328_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL or_326_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL nand_19_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL or_379_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL or_378_nl : STD_LOGIC;
  SIGNAL or_377_nl : STD_LOGIC;
  SIGNAL or_375_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL or_374_nl : STD_LOGIC;
  SIGNAL or_372_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL and_307_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL and_308_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL or_364_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL and_309_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL or_356_nl : STD_LOGIC;
  SIGNAL or_354_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL nand_21_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL or_410_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL or_409_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL or_404_nl : STD_LOGIC;
  SIGNAL or_402_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL or_401_nl : STD_LOGIC;
  SIGNAL or_400_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL or_397_nl : STD_LOGIC;
  SIGNAL or_396_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL and_306_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL or_389_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL or_388_nl : STD_LOGIC;
  SIGNAL or_386_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL mux_452_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL or_443_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL or_440_nl : STD_LOGIC;
  SIGNAL or_437_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL or_436_nl : STD_LOGIC;
  SIGNAL or_435_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL and_303_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL and_304_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL or_428_nl : STD_LOGIC;
  SIGNAL or_426_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL and_305_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL or_419_nl : STD_LOGIC;
  SIGNAL or_418_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL nor_354_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL or_473_nl : STD_LOGIC;
  SIGNAL or_471_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL or_469_nl : STD_LOGIC;
  SIGNAL or_468_nl : STD_LOGIC;
  SIGNAL nor_355_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL or_466_nl : STD_LOGIC;
  SIGNAL or_464_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL or_463_nl : STD_LOGIC;
  SIGNAL or_462_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL nor_356_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL or_459_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL nor_357_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL nand_133_nl : STD_LOGIC;
  SIGNAL or_455_nl : STD_LOGIC;
  SIGNAL and_302_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL nor_361_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL mux_483_nl : STD_LOGIC;
  SIGNAL and_301_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL nor_345_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL nor_346_nl : STD_LOGIC;
  SIGNAL nor_347_nl : STD_LOGIC;
  SIGNAL nor_348_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL or_500_nl : STD_LOGIC;
  SIGNAL or_498_nl : STD_LOGIC;
  SIGNAL or_496_nl : STD_LOGIC;
  SIGNAL mux_477_nl : STD_LOGIC;
  SIGNAL nor_349_nl : STD_LOGIC;
  SIGNAL nor_350_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL or_492_nl : STD_LOGIC;
  SIGNAL nand_128_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL nor_351_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL or_487_nl : STD_LOGIC;
  SIGNAL or_485_nl : STD_LOGIC;
  SIGNAL nor_352_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL or_482_nl : STD_LOGIC;
  SIGNAL or_481_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL or_479_nl : STD_LOGIC;
  SIGNAL or_478_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL nor_335_nl : STD_LOGIC;
  SIGNAL nor_336_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL nand_29_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL nor_337_nl : STD_LOGIC;
  SIGNAL nor_338_nl : STD_LOGIC;
  SIGNAL or_533_nl : STD_LOGIC;
  SIGNAL mux_495_nl : STD_LOGIC;
  SIGNAL or_532_nl : STD_LOGIC;
  SIGNAL or_530_nl : STD_LOGIC;
  SIGNAL nor_339_nl : STD_LOGIC;
  SIGNAL mux_494_nl : STD_LOGIC;
  SIGNAL or_527_nl : STD_LOGIC;
  SIGNAL or_525_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL or_524_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL nor_340_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL or_520_nl : STD_LOGIC;
  SIGNAL or_519_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL and_300_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL nor_341_nl : STD_LOGIC;
  SIGNAL nor_342_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL mux_488_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL or_513_nl : STD_LOGIC;
  SIGNAL or_512_nl : STD_LOGIC;
  SIGNAL mux_486_nl : STD_LOGIC;
  SIGNAL or_511_nl : STD_LOGIC;
  SIGNAL or_509_nl : STD_LOGIC;
  SIGNAL nor_324_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL or_566_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL or_565_nl : STD_LOGIC;
  SIGNAL or_563_nl : STD_LOGIC;
  SIGNAL or_560_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL or_559_nl : STD_LOGIC;
  SIGNAL or_558_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL and_297_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL and_298_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL nor_329_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL or_551_nl : STD_LOGIC;
  SIGNAL or_549_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL and_299_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL nor_330_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL nor_331_nl : STD_LOGIC;
  SIGNAL nor_332_nl : STD_LOGIC;
  SIGNAL nor_333_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL or_542_nl : STD_LOGIC;
  SIGNAL or_541_nl : STD_LOGIC;
  SIGNAL nor_334_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL nor_312_nl : STD_LOGIC;
  SIGNAL and_293_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL nor_313_nl : STD_LOGIC;
  SIGNAL nor_314_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL and_294_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL nor_315_nl : STD_LOGIC;
  SIGNAL nor_316_nl : STD_LOGIC;
  SIGNAL and_295_nl : STD_LOGIC;
  SIGNAL nor_317_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL or_589_nl : STD_LOGIC;
  SIGNAL or_588_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL nor_318_nl : STD_LOGIC;
  SIGNAL and_296_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL nor_319_nl : STD_LOGIC;
  SIGNAL nor_320_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL nor_321_nl : STD_LOGIC;
  SIGNAL nor_322_nl : STD_LOGIC;
  SIGNAL nor_323_nl : STD_LOGIC;
  SIGNAL mux_517_nl : STD_LOGIC;
  SIGNAL or_576_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL or_574_nl : STD_LOGIC;
  SIGNAL or_573_nl : STD_LOGIC;
  SIGNAL nor_301_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL mux_543_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL nor_302_nl : STD_LOGIC;
  SIGNAL nor_303_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL or_621_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL or_620_nl : STD_LOGIC;
  SIGNAL or_619_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL and_290_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL and_291_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL nor_304_nl : STD_LOGIC;
  SIGNAL nor_305_nl : STD_LOGIC;
  SIGNAL nor_306_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL or_612_nl : STD_LOGIC;
  SIGNAL or_610_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL and_292_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL nor_307_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL nor_308_nl : STD_LOGIC;
  SIGNAL nor_309_nl : STD_LOGIC;
  SIGNAL nor_310_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL or_603_nl : STD_LOGIC;
  SIGNAL or_602_nl : STD_LOGIC;
  SIGNAL nor_311_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL nor_292_nl : STD_LOGIC;
  SIGNAL nor_293_nl : STD_LOGIC;
  SIGNAL mux_557_nl : STD_LOGIC;
  SIGNAL nand_42_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL nor_294_nl : STD_LOGIC;
  SIGNAL nor_295_nl : STD_LOGIC;
  SIGNAL or_658_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL or_657_nl : STD_LOGIC;
  SIGNAL or_655_nl : STD_LOGIC;
  SIGNAL nor_296_nl : STD_LOGIC;
  SIGNAL mux_554_nl : STD_LOGIC;
  SIGNAL or_652_nl : STD_LOGIC;
  SIGNAL or_650_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL or_649_nl : STD_LOGIC;
  SIGNAL or_648_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL nor_297_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL or_645_nl : STD_LOGIC;
  SIGNAL or_644_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL and_289_nl : STD_LOGIC;
  SIGNAL mux_549_nl : STD_LOGIC;
  SIGNAL nor_298_nl : STD_LOGIC;
  SIGNAL nor_299_nl : STD_LOGIC;
  SIGNAL nor_300_nl : STD_LOGIC;
  SIGNAL mux_548_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL or_638_nl : STD_LOGIC;
  SIGNAL or_637_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL or_636_nl : STD_LOGIC;
  SIGNAL or_634_nl : STD_LOGIC;
  SIGNAL nor_281_nl : STD_LOGIC;
  SIGNAL mux_574_nl : STD_LOGIC;
  SIGNAL mux_573_nl : STD_LOGIC;
  SIGNAL nand_46_nl : STD_LOGIC;
  SIGNAL mux_572_nl : STD_LOGIC;
  SIGNAL nor_282_nl : STD_LOGIC;
  SIGNAL nor_283_nl : STD_LOGIC;
  SIGNAL or_690_nl : STD_LOGIC;
  SIGNAL mux_571_nl : STD_LOGIC;
  SIGNAL or_689_nl : STD_LOGIC;
  SIGNAL or_687_nl : STD_LOGIC;
  SIGNAL or_684_nl : STD_LOGIC;
  SIGNAL mux_570_nl : STD_LOGIC;
  SIGNAL or_683_nl : STD_LOGIC;
  SIGNAL or_682_nl : STD_LOGIC;
  SIGNAL mux_569_nl : STD_LOGIC;
  SIGNAL and_286_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL nor_284_nl : STD_LOGIC;
  SIGNAL nor_285_nl : STD_LOGIC;
  SIGNAL nor_286_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL or_675_nl : STD_LOGIC;
  SIGNAL or_674_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL and_288_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL nor_287_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL nor_288_nl : STD_LOGIC;
  SIGNAL nor_289_nl : STD_LOGIC;
  SIGNAL nor_290_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL or_667_nl : STD_LOGIC;
  SIGNAL or_666_nl : STD_LOGIC;
  SIGNAL nor_291_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL nor_273_nl : STD_LOGIC;
  SIGNAL mux_587_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL or_720_nl : STD_LOGIC;
  SIGNAL or_718_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL or_716_nl : STD_LOGIC;
  SIGNAL or_715_nl : STD_LOGIC;
  SIGNAL nor_274_nl : STD_LOGIC;
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL or_713_nl : STD_LOGIC;
  SIGNAL or_711_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL or_710_nl : STD_LOGIC;
  SIGNAL or_709_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL nor_275_nl : STD_LOGIC;
  SIGNAL mux_581_nl : STD_LOGIC;
  SIGNAL nand_109_nl : STD_LOGIC;
  SIGNAL or_706_nl : STD_LOGIC;
  SIGNAL mux_580_nl : STD_LOGIC;
  SIGNAL nor_276_nl : STD_LOGIC;
  SIGNAL mux_579_nl : STD_LOGIC;
  SIGNAL nand_110_nl : STD_LOGIC;
  SIGNAL or_702_nl : STD_LOGIC;
  SIGNAL and_285_nl : STD_LOGIC;
  SIGNAL mux_578_nl : STD_LOGIC;
  SIGNAL mux_577_nl : STD_LOGIC;
  SIGNAL nor_277_nl : STD_LOGIC;
  SIGNAL nor_278_nl : STD_LOGIC;
  SIGNAL mux_576_nl : STD_LOGIC;
  SIGNAL nor_279_nl : STD_LOGIC;
  SIGNAL nor_280_nl : STD_LOGIC;
  SIGNAL nor_264_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL mux_602_nl : STD_LOGIC;
  SIGNAL and_407_nl : STD_LOGIC;
  SIGNAL and_279_nl : STD_LOGIC;
  SIGNAL or_745_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL nand_178_nl : STD_LOGIC;
  SIGNAL nand_173_nl : STD_LOGIC;
  SIGNAL or_739_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL nand_99_nl : STD_LOGIC;
  SIGNAL nand_100_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL and_280_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL mux_597_nl : STD_LOGIC;
  SIGNAL nor_266_nl : STD_LOGIC;
  SIGNAL and_282_nl : STD_LOGIC;
  SIGNAL nor_267_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL nand_102_nl : STD_LOGIC;
  SIGNAL nand_166_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL mux_594_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL mux_593_nl : STD_LOGIC;
  SIGNAL nor_268_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL nor_269_nl : STD_LOGIC;
  SIGNAL nor_270_nl : STD_LOGIC;
  SIGNAL nor_271_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL nand_105_nl : STD_LOGIC;
  SIGNAL or_724_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL nor_557_nl : STD_LOGIC;
  SIGNAL mux_964_nl : STD_LOGIC;
  SIGNAL or_1107_nl : STD_LOGIC;
  SIGNAL mux_963_nl : STD_LOGIC;
  SIGNAL nand_182_nl : STD_LOGIC;
  SIGNAL mux_962_nl : STD_LOGIC;
  SIGNAL nor_558_nl : STD_LOGIC;
  SIGNAL nor_559_nl : STD_LOGIC;
  SIGNAL or_1102_nl : STD_LOGIC;
  SIGNAL mux_961_nl : STD_LOGIC;
  SIGNAL nor_560_nl : STD_LOGIC;
  SIGNAL mux_960_nl : STD_LOGIC;
  SIGNAL nor_561_nl : STD_LOGIC;
  SIGNAL mux_959_nl : STD_LOGIC;
  SIGNAL or_1099_nl : STD_LOGIC;
  SIGNAL or_1098_nl : STD_LOGIC;
  SIGNAL nor_562_nl : STD_LOGIC;
  SIGNAL mux_977_nl : STD_LOGIC;
  SIGNAL and_615_nl : STD_LOGIC;
  SIGNAL and_616_nl : STD_LOGIC;
  SIGNAL mux_976_nl : STD_LOGIC;
  SIGNAL or_1131_nl : STD_LOGIC;
  SIGNAL nor_550_nl : STD_LOGIC;
  SIGNAL mux_975_nl : STD_LOGIC;
  SIGNAL mux_974_nl : STD_LOGIC;
  SIGNAL or_1128_nl : STD_LOGIC;
  SIGNAL or_1124_nl : STD_LOGIC;
  SIGNAL mux_982_nl : STD_LOGIC;
  SIGNAL nor_618_nl : STD_LOGIC;
  SIGNAL mux_991_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_61_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_256_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_1035_nl : STD_LOGIC;
  SIGNAL and_633_nl : STD_LOGIC;
  SIGNAL mux_1036_nl : STD_LOGIC;
  SIGNAL nor_619_nl : STD_LOGIC;
  SIGNAL mux_1037_nl : STD_LOGIC;
  SIGNAL and_634_nl : STD_LOGIC;
  SIGNAL mux_1038_nl : STD_LOGIC;
  SIGNAL or_1186_nl : STD_LOGIC;
  SIGNAL nor_620_nl : STD_LOGIC;
  SIGNAL mux_1039_nl : STD_LOGIC;
  SIGNAL or_1187_nl : STD_LOGIC;
  SIGNAL or_1188_nl : STD_LOGIC;
  SIGNAL mux_1040_nl : STD_LOGIC;
  SIGNAL mux_1041_nl : STD_LOGIC;
  SIGNAL mux_1042_nl : STD_LOGIC;
  SIGNAL nor_621_nl : STD_LOGIC;
  SIGNAL and_635_nl : STD_LOGIC;
  SIGNAL mux_1043_nl : STD_LOGIC;
  SIGNAL nor_622_nl : STD_LOGIC;
  SIGNAL nor_623_nl : STD_LOGIC;
  SIGNAL nor_624_nl : STD_LOGIC;
  SIGNAL mux_1044_nl : STD_LOGIC;
  SIGNAL or_1189_nl : STD_LOGIC;
  SIGNAL or_1190_nl : STD_LOGIC;
  SIGNAL mux_1045_nl : STD_LOGIC;
  SIGNAL nor_625_nl : STD_LOGIC;
  SIGNAL nor_626_nl : STD_LOGIC;
  SIGNAL mux_1046_nl : STD_LOGIC;
  SIGNAL or_1191_nl : STD_LOGIC;
  SIGNAL or_1192_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_2_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_62_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_or_22_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_232_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL not_2348_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_63_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_3_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL not_2349_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL operator_64_false_operator_64_false_or_59_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_13_nl : STD_LOGIC_VECTOR (53 DOWNTO 0);
  SIGNAL operator_64_false_operator_64_false_nor_1_nl : STD_LOGIC_VECTOR (53 DOWNTO
      0);
  SIGNAL operator_64_false_operator_64_false_mux_1_nl : STD_LOGIC_VECTOR (53 DOWNTO
      0);
  SIGNAL operator_64_false_or_14_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_4_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_5_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_or_16_nl : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_or_60_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux_4_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_17_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_and_9_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_mux1h_6_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_or_18_nl : STD_LOGIC;
  SIGNAL operator_64_false_nor_67_nl : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_or_61_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux_5_nl : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_or_62_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux_6_nl : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_or_63_nl : STD_LOGIC;
  SIGNAL operator_64_false_mux_7_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_64_false_mux1h_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_or_6_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_7_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_mux1h_4_nl_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_or_9_nl : STD_LOGIC;
  SIGNAL operator_64_false_or_10_nl : STD_LOGIC;
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (61 DOWNTO 0);
  SIGNAL operator_64_false_1_operator_64_false_1_or_55_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_nand_1_nl : STD_LOGIC_VECTOR (5
      DOWNTO 0);
  SIGNAL operator_64_false_1_mux1h_3_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_1_not_3_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_3_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_4_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_64_false_1_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_257_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_258_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_233_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_234_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_235_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_236_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_237_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_238_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_239_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_259_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_240_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_241_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_242_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_243_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_244_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_245_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_246_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_260_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_261_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_247_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_248_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_249_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_250_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_251_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_252_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_253_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_262_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_263_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_264_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL r_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT modulo_dev
    PORT (
      base_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

  SIGNAL modExp_dev_while_rem_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_while_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_while_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL STAGE_MAIN_LOOP_div_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_div_cmp_b_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_div_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL STAGE_MAIN_LOOP_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_MAIN_LOOP_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_core_wait_dp
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      STAGE_MAIN_LOOP_C_3_tr0 : IN STD_LOGIC;
      modExp_dev_while_C_11_tr0 : IN STD_LOGIC;
      STAGE_VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_16_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_45_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_90_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_135_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_180_tr0 : IN STD_LOGIC;
      COMP_LOOP_5_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_225_tr0 : IN STD_LOGIC;
      COMP_LOOP_6_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_270_tr0 : IN STD_LOGIC;
      COMP_LOOP_7_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_315_tr0 : IN STD_LOGIC;
      COMP_LOOP_8_modExp_dev_1_while_C_11_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_360_tr0 : IN STD_LOGIC;
      STAGE_VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
      STAGE_MAIN_LOOP_C_4_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_3_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_16_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_90_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_135_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_180_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_225_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_270_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_315_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_4_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_3_8_2(input_7 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_64_10_2(input_9 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(9 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_64_3_2(input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_64_4_2(input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_64_8_2(input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_6_4_2(input_3 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_17_2(input_16 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(16 DOWNTO 0))
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

  FUNCTION MUX_v_54_2_2(input_0 : STD_LOGIC_VECTOR(53 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(53 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(53 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_55_2_2(input_0 : STD_LOGIC_VECTOR(54 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(54 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(54 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_64_2_2(input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(63 DOWNTO 0);

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

BEGIN
  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 5,
      width => 64
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  r_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 6,
      width => 64
      )
    PORT MAP(
      dat => r_rsci_dat,
      idat => r_rsci_idat_1
    );
  r_rsci_dat <= r_rsc_dat;
  r_rsci_idat <= r_rsci_idat_1;

  vec_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_7_lz
    );
  vec_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_6_lz
    );
  vec_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_5_lz
    );
  vec_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_4_lz
    );
  vec_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_3_lz
    );
  vec_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_2_lz
    );
  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_7_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  COMP_LOOP_1_modulo_dev_cmp : modulo_dev
    PORT MAP(
      base_rsc_dat => COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat,
      m_rsc_dat => COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat,
      return_rsc_z => COMP_LOOP_1_modulo_dev_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en
    );
  COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat <= MUX_v_64_2_2(z_out_3, COMP_LOOP_1_modExp_dev_1_while_mul_mut,
      MUX_s_1_2_2(((fsm_output(6)) AND (MUX_s_1_2_2(((fsm_output(3)) AND (NOT (MUX_s_1_2_2(or_tmp_737,
      ((fsm_output(7)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(8))) OR (fsm_output(5))),
      fsm_output(1))))), (MUX_s_1_2_2((NOT((NOT (fsm_output(1))) OR (fsm_output(7))
      OR (NOT (fsm_output(4))) OR (fsm_output(8)) OR (NOT (fsm_output(5))))), (NOT((fsm_output(1))
      OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(5)))),
      fsm_output(3))), fsm_output(2)))), (NOT((fsm_output(6)) OR (MUX_s_1_2_2(((fsm_output(3))
      OR (MUX_s_1_2_2(((fsm_output(7)) OR (fsm_output(4)) OR nand_93_cse), (NOT((fsm_output(7))
      AND (fsm_output(4)) AND (fsm_output(8)) AND (NOT (fsm_output(5))))), fsm_output(1)))),
      (NOT((fsm_output(3)) AND (NOT (MUX_s_1_2_2(or_772_cse, or_tmp_737, fsm_output(1)))))),
      fsm_output(2))))), fsm_output(0)));
  COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_dev_cmp_return_rsc_z <= COMP_LOOP_1_modulo_dev_cmp_return_rsc_z_1;
  COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat <= NOT (MUX_s_1_2_2((MUX_s_1_2_2((NOT((fsm_output(3))
      AND (fsm_output(6)) AND (NOT (MUX_s_1_2_2(or_tmp_751, (MUX_s_1_2_2(mux_tmp_634,
      ((NOT (fsm_output(4))) OR (fsm_output(8)) OR (fsm_output(5))), fsm_output(7))),
      fsm_output(1)))))), (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(7))
      OR (NOT (fsm_output(4))) OR (fsm_output(8)) OR (fsm_output(5))), ((NOT (fsm_output(7)))
      OR (fsm_output(4)) OR (fsm_output(8)) OR (fsm_output(5))), fsm_output(1))),
      ((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8))
      OR (NOT (fsm_output(5)))), fsm_output(6))), (MUX_s_1_2_2((NOT((fsm_output(1))
      AND (fsm_output(7)) AND (fsm_output(4)) AND (fsm_output(8)) AND (fsm_output(5)))),
      ((fsm_output(1)) OR (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(5))),
      fsm_output(6))), fsm_output(3))), fsm_output(2))), (MUX_s_1_2_2(((fsm_output(3))
      OR (fsm_output(6)) OR (MUX_s_1_2_2((MUX_s_1_2_2(nand_93_cse, ((fsm_output(4))
      OR (fsm_output(8)) OR (NOT (fsm_output(5)))), fsm_output(7))), (MUX_s_1_2_2(((NOT
      (fsm_output(4))) OR (NOT (fsm_output(8))) OR (fsm_output(5))), mux_tmp_634,
      fsm_output(7))), fsm_output(1)))), (MUX_s_1_2_2(((fsm_output(6)) OR (fsm_output(1))
      OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(5))),
      (MUX_s_1_2_2((MUX_s_1_2_2(or_772_cse, or_tmp_751, fsm_output(1))), ((fsm_output(1))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (fsm_output(8)) OR (fsm_output(5))),
      fsm_output(6))), fsm_output(3))), fsm_output(2))), fsm_output(0)));

  modExp_dev_while_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => modExp_dev_while_rem_cmp_a_1,
      b => modExp_dev_while_rem_cmp_b,
      z => modExp_dev_while_rem_cmp_z_1
    );
  modExp_dev_while_rem_cmp_a_1 <= modExp_dev_while_rem_cmp_a;
  modExp_dev_while_rem_cmp_b <= reg_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse;
  modExp_dev_while_rem_cmp_z <= modExp_dev_while_rem_cmp_z_1;

  STAGE_MAIN_LOOP_div_cmp : work.mgc_comps.mgc_div
    GENERIC MAP(
      width_a => 64,
      width_b => 10,
      signd => 0
      )
    PORT MAP(
      a => STAGE_MAIN_LOOP_div_cmp_a_1,
      b => STAGE_MAIN_LOOP_div_cmp_b_1,
      z => STAGE_MAIN_LOOP_div_cmp_z_1
    );
  STAGE_MAIN_LOOP_div_cmp_a_1 <= STAGE_MAIN_LOOP_div_cmp_a;
  STAGE_MAIN_LOOP_div_cmp_b_1 <= STAGE_MAIN_LOOP_div_cmp_b;
  STAGE_MAIN_LOOP_div_cmp_z <= STAGE_MAIN_LOOP_div_cmp_z_1;

  STAGE_MAIN_LOOP_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => STAGE_MAIN_LOOP_lshift_rg_a,
      s => STAGE_MAIN_LOOP_lshift_rg_s,
      z => STAGE_MAIN_LOOP_lshift_rg_z
    );
  STAGE_MAIN_LOOP_lshift_rg_a(0) <= '1';
  STAGE_MAIN_LOOP_lshift_rg_s <= z_out_4(3 DOWNTO 0);
  STAGE_MAIN_LOOP_lshift_psp_1_sva_mx0w0 <= STAGE_MAIN_LOOP_lshift_rg_z;

  inPlaceNTT_DIF_core_wait_dp_inst : inPlaceNTT_DIF_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => mux_644_rmff,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en => COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIF_core_core_fsm_inst : inPlaceNTT_DIF_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIF_core_core_fsm_inst_fsm_output,
      STAGE_MAIN_LOOP_C_3_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_3_tr0,
      modExp_dev_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      STAGE_VEC_LOOP_C_0_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0,
      COMP_LOOP_C_16_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_16_tr0,
      COMP_LOOP_1_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_45_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0,
      COMP_LOOP_2_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_90_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_90_tr0,
      COMP_LOOP_3_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_135_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_135_tr0,
      COMP_LOOP_4_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_180_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_180_tr0,
      COMP_LOOP_5_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_225_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_225_tr0,
      COMP_LOOP_6_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_270_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_270_tr0,
      COMP_LOOP_7_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_315_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_315_tr0,
      COMP_LOOP_8_modExp_dev_1_while_C_11_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      COMP_LOOP_C_360_tr0 => COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm,
      STAGE_VEC_LOOP_C_1_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0,
      STAGE_MAIN_LOOP_C_4_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_4_tr0
    );
  fsm_output <= inPlaceNTT_DIF_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_3_tr0 <= NOT (z_out_2(64));
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_0_tr0 <= NOT (z_out_2(63));
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_16_tr0 <= NOT operator_64_false_slc_operator_64_false_acc_1_60_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_45_tr0 <= NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_90_tr0 <= NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_135_tr0 <= NOT operator_64_false_slc_operator_64_false_acc_1_60_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_180_tr0 <= NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_225_tr0 <= NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_270_tr0 <= NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_315_tr0 <= NOT operator_64_false_slc_operator_64_false_acc_1_60_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_VEC_LOOP_C_1_tr0 <= z_out_2(10);
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_MAIN_LOOP_C_4_tr0 <= z_out_2(4);

  nand_135_cse <= NOT((operator_64_false_acc_cse_5_sva(1)) AND CONV_SL_1_1(fsm_output(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  nor_263_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nand_177_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  and_348_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  nand_176_nl <= NOT(nand_177_cse AND (fsm_output(7)));
  or_69_nl <= (NOT (fsm_output(4))) OR (fsm_output(7));
  mux_639_nl <= MUX_s_1_2_2(or_69_nl, mux_tmp_86, fsm_output(1));
  mux_640_nl <= MUX_s_1_2_2(nand_176_nl, mux_639_nl, fsm_output(2));
  mux_641_nl <= MUX_s_1_2_2(mux_640_nl, mux_tmp_86, fsm_output(3));
  mux_636_nl <= MUX_s_1_2_2((NOT nor_tmp_169), (fsm_output(7)), fsm_output(1));
  mux_634_nl <= MUX_s_1_2_2((NOT or_tmp_721), (fsm_output(7)), fsm_output(4));
  mux_635_nl <= MUX_s_1_2_2(mux_634_nl, mux_tmp_86, fsm_output(1));
  mux_637_nl <= MUX_s_1_2_2(mux_636_nl, mux_635_nl, fsm_output(2));
  mux_638_nl <= MUX_s_1_2_2((NOT nor_tmp_169), mux_637_nl, fsm_output(3));
  mux_642_nl <= MUX_s_1_2_2((NOT mux_641_nl), mux_638_nl, fsm_output(6));
  mux_631_nl <= MUX_s_1_2_2(or_tmp_723, or_tmp_722, or_953_cse);
  mux_628_nl <= MUX_s_1_2_2((fsm_output(7)), (NOT or_tmp_721), fsm_output(4));
  mux_627_nl <= MUX_s_1_2_2((fsm_output(0)), or_tmp_720, fsm_output(4));
  mux_629_nl <= MUX_s_1_2_2(mux_628_nl, mux_627_nl, fsm_output(1));
  mux_630_nl <= MUX_s_1_2_2(or_tmp_722, mux_629_nl, fsm_output(2));
  mux_632_nl <= MUX_s_1_2_2(mux_631_nl, mux_630_nl, fsm_output(3));
  mux_626_nl <= MUX_s_1_2_2(or_tmp_722, (NOT mux_tmp_588), fsm_output(2));
  or_757_nl <= (fsm_output(3)) OR mux_626_nl;
  mux_633_nl <= MUX_s_1_2_2(mux_632_nl, or_757_nl, fsm_output(6));
  mux_643_nl <= MUX_s_1_2_2(mux_642_nl, mux_633_nl, fsm_output(5));
  mux_621_nl <= MUX_s_1_2_2(mux_tmp_86, mux_tmp_587, fsm_output(1));
  mux_619_nl <= MUX_s_1_2_2(or_tmp_723, or_tmp_722, fsm_output(1));
  mux_622_nl <= MUX_s_1_2_2(mux_621_nl, mux_619_nl, fsm_output(2));
  mux_623_nl <= MUX_s_1_2_2(mux_622_nl, or_tmp_722, fsm_output(3));
  mux_616_nl <= MUX_s_1_2_2(mux_tmp_588, nor_tmp_169, fsm_output(2));
  mux_617_nl <= MUX_s_1_2_2(or_tmp_722, (NOT mux_616_nl), fsm_output(3));
  mux_624_nl <= MUX_s_1_2_2(mux_623_nl, mux_617_nl, fsm_output(6));
  mux_608_nl <= MUX_s_1_2_2((NOT or_tmp_720), (fsm_output(7)), fsm_output(4));
  mux_609_nl <= MUX_s_1_2_2(or_tmp_721, mux_608_nl, fsm_output(1));
  mux_610_nl <= MUX_s_1_2_2(mux_609_nl, nor_tmp_169, fsm_output(2));
  mux_607_nl <= MUX_s_1_2_2((NOT nor_tmp_169), (fsm_output(7)), and_257_cse);
  mux_611_nl <= MUX_s_1_2_2((NOT mux_610_nl), mux_607_nl, fsm_output(3));
  nor_nl <= NOT(and_348_cse OR (fsm_output(7)));
  nor_514_nl <= NOT(nor_263_cse OR (fsm_output(4)) OR (fsm_output(7)));
  mux_606_nl <= MUX_s_1_2_2(nor_nl, nor_514_nl, fsm_output(3));
  mux_612_nl <= MUX_s_1_2_2(mux_611_nl, mux_606_nl, fsm_output(6));
  mux_625_nl <= MUX_s_1_2_2(mux_624_nl, mux_612_nl, fsm_output(5));
  mux_644_rmff <= MUX_s_1_2_2(mux_643_nl, mux_625_nl, fsm_output(8));
  or_772_cse <= (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)) OR (NOT
      (fsm_output(5)));
  nand_93_cse <= NOT((fsm_output(8)) AND (fsm_output(5)));
  COMP_LOOP_nor_16_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_28_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_40_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_52_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_64_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_76_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_88_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_17_cse <= NOT((operator_64_false_acc_cse_2_sva(2)) OR (operator_64_false_acc_cse_2_sva(0)));
  COMP_LOOP_nor_29_cse <= NOT((operator_64_false_acc_cse_3_sva(2)) OR (operator_64_false_acc_cse_3_sva(0)));
  COMP_LOOP_nor_41_cse <= NOT((operator_64_false_acc_cse_4_sva(2)) OR (operator_64_false_acc_cse_4_sva(0)));
  COMP_LOOP_nor_53_cse <= NOT((operator_64_false_acc_cse_5_sva(2)) OR (operator_64_false_acc_cse_5_sva(0)));
  COMP_LOOP_nor_65_cse <= NOT((operator_64_false_acc_cse_6_sva(2)) OR (operator_64_false_acc_cse_6_sva(0)));
  COMP_LOOP_nor_77_cse <= NOT((operator_64_false_acc_cse_7_sva(2)) OR (operator_64_false_acc_cse_7_sva(0)));
  COMP_LOOP_nor_89_cse <= NOT((operator_64_false_acc_cse_sva(2)) OR (operator_64_false_acc_cse_sva(0)));
  COMP_LOOP_nor_18_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_30_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_42_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_54_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_66_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_78_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_nor_90_cse <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  or_1035_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  and_186_rgt <= and_dcpl_170 AND and_dcpl_51;
  nand_203_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")));
  or_953_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  and_257_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_952_cse <= (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(4));
  COMP_LOOP_k_COMP_LOOP_k_mux_nl <= MUX_v_6_2_2((z_out_3(8 DOWNTO 3)), COMP_LOOP_k_9_3_sva_5_0,
      mux_702_itm);
  mux_855_nl <= MUX_s_1_2_2((NOT nor_tmp_45), or_tmp_897, fsm_output(7));
  mux_854_nl <= MUX_s_1_2_2(mux_812_cse, or_tmp_896, fsm_output(0));
  nand_66_nl <= NOT((fsm_output(7)) AND (NOT mux_854_nl));
  mux_856_nl <= MUX_s_1_2_2(mux_855_nl, nand_66_nl, fsm_output(2));
  or_944_nl <= (fsm_output(0)) OR (NOT nor_tmp_45);
  mux_827_nl <= MUX_s_1_2_2(or_944_nl, or_tmp_897, fsm_output(7));
  mux_828_nl <= MUX_s_1_2_2(mux_827_nl, mux_816_cse, fsm_output(2));
  mux_832_nl <= MUX_s_1_2_2(mux_856_nl, mux_828_nl, fsm_output(1));
  and_210_nl <= (fsm_output(7)) AND mux_820_cse;
  mux_851_nl <= MUX_s_1_2_2(and_210_nl, mux_821_cse, or_953_cse);
  mux_833_nl <= MUX_s_1_2_2(mux_832_nl, (NOT mux_851_nl), fsm_output(5));
  mux_850_nl <= MUX_s_1_2_2(mux_816_cse, or_952_cse, fsm_output(5));
  mux_834_nl <= MUX_s_1_2_2(mux_833_nl, mux_850_nl, fsm_output(6));
  or_951_nl <= (fsm_output(7)) OR (NOT mux_820_cse);
  mux_847_nl <= MUX_s_1_2_2((NOT mux_821_cse), or_951_nl, and_257_cse);
  mux_848_nl <= MUX_s_1_2_2(mux_816_cse, mux_847_nl, fsm_output(5));
  or_950_nl <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(4));
  mux_840_nl <= MUX_s_1_2_2(or_tmp_896, or_950_nl, fsm_output(7));
  mux_842_nl <= MUX_s_1_2_2(mux_816_cse, mux_840_nl, fsm_output(2));
  mux_838_nl <= MUX_s_1_2_2(or_tmp_897, mux_812_cse, fsm_output(0));
  or_949_nl <= (fsm_output(7)) OR mux_838_nl;
  mux_836_nl <= MUX_s_1_2_2(or_tmp_896, or_1183_cse, fsm_output(7));
  mux_839_nl <= MUX_s_1_2_2(or_949_nl, mux_836_nl, fsm_output(2));
  mux_843_nl <= MUX_s_1_2_2(mux_842_nl, mux_839_nl, fsm_output(1));
  or_945_nl <= (fsm_output(7)) OR (NOT nor_tmp_45);
  mux_844_nl <= MUX_s_1_2_2(mux_843_nl, or_945_nl, fsm_output(5));
  mux_849_nl <= MUX_s_1_2_2(mux_848_nl, mux_844_nl, fsm_output(6));
  mux_835_nl <= MUX_s_1_2_2(mux_834_nl, mux_849_nl, fsm_output(3));
  COMP_LOOP_COMP_LOOP_mux_rgt <= MUX_v_7_2_2(('0' & COMP_LOOP_k_COMP_LOOP_k_mux_nl),
      (z_out_2(6 DOWNTO 0)), mux_835_nl);
  nor_607_cse <= NOT((fsm_output(8)) OR (fsm_output(5)));
  and_378_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_250_cse <= (fsm_output(5)) AND (fsm_output(6)) AND (fsm_output(8));
  nor_227_cse <= NOT((fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(8)));
  nor_449_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  or_1027_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_327_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  or_1183_cse <= (fsm_output(8)) OR (fsm_output(4));
  nand_205_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  nor_603_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_1_operator_64_false_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "000")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  COMP_LOOP_acc_cse_6_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "101")), 9), 10), 10));
  COMP_LOOP_acc_cse_4_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "011")), 9), 10), 10));
  COMP_LOOP_acc_7_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0(9
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 &
      STD_LOGIC_VECTOR'( "01")), 8), 9), 9));
  COMP_LOOP_acc_cse_2_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "001")), 9), 10), 10));
  operator_64_false_acc_cse_2_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "001")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_3_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "010")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_4_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "011")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_5_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "100")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_6_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "101")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_7_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "110")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  operator_64_false_acc_cse_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0 & STD_LOGIC_VECTOR'(
      "111")), 9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1)), 9), 10), 10));
  nor_tmp <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111"));
  nand_tmp <= NOT((fsm_output(5)) AND (NOT nor_tmp));
  or_tmp <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  or_tmp_1 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  nor_tmp_2 <= or_953_cse AND (fsm_output(3));
  nor_tmp_3 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_1 <= (NOT (fsm_output(0))) AND (fsm_output(6));
  and_dcpl_3 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  mux_tmp_86 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(4));
  nor_tmp_45 <= (fsm_output(4)) AND (fsm_output(8));
  and_354_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  or_tmp_152 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_168 <= (NOT (fsm_output(5))) OR (fsm_output(1)) OR (fsm_output(2)) OR (NOT
      (fsm_output(8)));
  and_dcpl_18 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_19 <= (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_dcpl_25 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_29 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_31 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_35 <= NOT((fsm_output(0)) OR (fsm_output(6)));
  or_228_nl <= (fsm_output(5)) OR nor_tmp_3;
  mux_tmp_323 <= MUX_s_1_2_2((fsm_output(5)), or_228_nl, fsm_output(4));
  nor_445_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000")));
  or_229_nl <= (fsm_output(5)) OR nor_tmp;
  mux_351_nl <= MUX_s_1_2_2((fsm_output(5)), or_229_nl, fsm_output(4));
  mux_352_nl <= MUX_s_1_2_2(mux_351_nl, mux_tmp_323, fsm_output(0));
  and_60_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11")) AND mux_352_nl;
  mux_tmp_326 <= MUX_s_1_2_2(nor_445_nl, and_60_nl, fsm_output(8));
  and_dcpl_51 <= and_dcpl_35 AND nor_449_cse;
  and_dcpl_53 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_54 <= and_dcpl_53 AND (fsm_output(1));
  and_dcpl_55 <= and_dcpl_54 AND and_dcpl_3;
  and_dcpl_56 <= and_dcpl_55 AND and_dcpl_51;
  and_dcpl_58 <= and_dcpl_19 AND nor_449_cse;
  and_dcpl_62 <= and_dcpl_1 AND nor_449_cse;
  and_dcpl_64 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_65 <= and_dcpl_64 AND (fsm_output(1));
  xor_dcpl <= (fsm_output(4)) XOR (fsm_output(0));
  and_dcpl_97 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_114 <= and_dcpl_53 AND (NOT (fsm_output(1)));
  nand_142_cse <= NOT((fsm_output(6)) AND (fsm_output(4)) AND (fsm_output(3)) AND
      (fsm_output(0)));
  nor_121_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  not_tmp_184 <= NOT((fsm_output(3)) AND (fsm_output(5)));
  nor_127_cse <= NOT((fsm_output(8)) OR (NOT (fsm_output(6))));
  not_tmp_212 <= NOT((fsm_output(7)) AND (fsm_output(0)));
  not_tmp_217 <= NOT((fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(1)));
  and_dcpl_123 <= nor_tmp_3 AND (NOT (fsm_output(1)));
  nor_tmp_169 <= (fsm_output(4)) AND (fsm_output(7));
  or_tmp_720 <= (fsm_output(0)) OR (NOT (fsm_output(7)));
  or_tmp_721 <= (NOT (fsm_output(0))) OR (fsm_output(7));
  mux_tmp_587 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(0)), fsm_output(4));
  mux_613_nl <= MUX_s_1_2_2(or_tmp_720, (fsm_output(7)), fsm_output(4));
  mux_tmp_588 <= MUX_s_1_2_2(mux_tmp_587, mux_613_nl, fsm_output(1));
  or_tmp_722 <= (fsm_output(4)) OR (fsm_output(7));
  mux_618_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(0));
  or_tmp_723 <= (fsm_output(4)) OR mux_618_nl;
  and_dcpl_126 <= and_dcpl_31 AND (NOT (fsm_output(1)));
  and_dcpl_127 <= and_dcpl_126 AND and_dcpl_3;
  and_dcpl_128 <= and_dcpl_127 AND and_dcpl_51;
  or_765_nl <= (fsm_output(1)) OR (fsm_output(4)) OR (fsm_output(2)) OR (NOT (fsm_output(5)));
  or_763_nl <= (fsm_output(1)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(5));
  mux_645_cse <= MUX_s_1_2_2(or_765_nl, or_763_nl, fsm_output(8));
  or_tmp_737 <= (NOT (fsm_output(7))) OR (fsm_output(4)) OR (fsm_output(8)) OR (NOT
      (fsm_output(5)));
  and_dcpl_129 <= (fsm_output(0)) AND (fsm_output(6));
  and_dcpl_130 <= and_dcpl_129 AND nor_449_cse;
  and_dcpl_131 <= and_dcpl_123 AND and_dcpl_25;
  and_dcpl_132 <= and_dcpl_131 AND and_dcpl_130;
  and_dcpl_133 <= and_dcpl_35 AND and_dcpl_18;
  and_dcpl_134 <= and_dcpl_31 AND (fsm_output(1));
  and_dcpl_135 <= and_dcpl_134 AND and_dcpl_25;
  and_dcpl_136 <= and_dcpl_135 AND and_dcpl_133;
  and_dcpl_137 <= and_dcpl_19 AND and_dcpl_18;
  and_dcpl_138 <= nor_tmp AND and_354_cse;
  and_dcpl_139 <= and_dcpl_138 AND and_dcpl_137;
  and_dcpl_140 <= and_dcpl_1 AND and_dcpl_18;
  and_dcpl_141 <= and_dcpl_64 AND (NOT (fsm_output(1)));
  and_dcpl_142 <= and_dcpl_141 AND and_354_cse;
  and_dcpl_143 <= and_dcpl_142 AND and_dcpl_140;
  and_dcpl_144 <= and_dcpl_19 AND and_dcpl_29;
  and_dcpl_145 <= and_dcpl_114 AND and_354_cse;
  and_dcpl_146 <= and_dcpl_145 AND and_dcpl_144;
  and_dcpl_147 <= and_dcpl_1 AND and_dcpl_29;
  and_dcpl_148 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_150 <= and_dcpl_65 AND and_dcpl_148 AND and_dcpl_147;
  and_dcpl_151 <= and_dcpl_19 AND and_327_cse;
  and_dcpl_152 <= and_dcpl_54 AND and_dcpl_148;
  and_dcpl_153 <= and_dcpl_152 AND and_dcpl_151;
  or_tmp_751 <= (NOT((fsm_output(7)) OR (NOT (fsm_output(4))))) OR (fsm_output(8))
      OR (NOT (fsm_output(5)));
  or_789_nl <= (NOT (fsm_output(8))) OR (fsm_output(5));
  mux_tmp_634 <= MUX_s_1_2_2(nand_93_cse, or_789_nl, fsm_output(4));
  and_dcpl_154 <= and_dcpl_126 AND and_dcpl_25;
  and_dcpl_155 <= and_dcpl_154 AND and_dcpl_58;
  mux_tmp_647 <= MUX_s_1_2_2((NOT (fsm_output(3))), (fsm_output(3)), fsm_output(2));
  mux_tmp_648 <= MUX_s_1_2_2(mux_tmp_647, nor_tmp_3, fsm_output(1));
  or_tmp_767 <= (fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(3));
  mux_tmp_650 <= MUX_s_1_2_2(and_dcpl_53, mux_tmp_647, fsm_output(1));
  and_tmp_13 <= (fsm_output(5)) AND nor_tmp_2;
  or_tmp_770 <= (fsm_output(5)) OR nor_tmp_2;
  or_tmp_772 <= (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3));
  or_tmp_775 <= (fsm_output(5)) OR (NOT nor_tmp);
  or_tmp_779 <= and_257_cse OR (fsm_output(3));
  or_tmp_784 <= (NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(7))
      OR (NOT (fsm_output(0))) OR (fsm_output(6));
  or_828_nl <= (NOT (fsm_output(8))) OR (fsm_output(1)) OR (fsm_output(4)) OR (fsm_output(3))
      OR (fsm_output(7)) OR (fsm_output(0)) OR (NOT (fsm_output(6)));
  or_826_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(7))
      OR (NOT((fsm_output(0)) AND (fsm_output(6))));
  or_824_nl <= (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(7)))
      OR (fsm_output(0)) OR (fsm_output(6));
  mux_699_nl <= MUX_s_1_2_2(or_826_nl, or_824_nl, fsm_output(1));
  mux_700_nl <= MUX_s_1_2_2(or_tmp_784, mux_699_nl, fsm_output(8));
  mux_701_nl <= MUX_s_1_2_2(or_828_nl, mux_700_nl, fsm_output(5));
  nor_256_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(0))) OR (fsm_output(6)));
  nor_257_nl <= NOT((fsm_output(7)) OR (fsm_output(0)) OR (NOT (fsm_output(6))));
  mux_696_nl <= MUX_s_1_2_2(nor_256_nl, nor_257_nl, fsm_output(3));
  nand_59_nl <= NOT((fsm_output(4)) AND mux_696_nl);
  or_819_nl <= (fsm_output(4)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(7)))
      OR (fsm_output(0)) OR (NOT (fsm_output(6)));
  mux_697_nl <= MUX_s_1_2_2(nand_59_nl, or_819_nl, fsm_output(1));
  mux_698_nl <= MUX_s_1_2_2(mux_697_nl, or_tmp_784, fsm_output(8));
  or_823_nl <= (fsm_output(5)) OR mux_698_nl;
  mux_702_itm <= MUX_s_1_2_2(mux_701_nl, or_823_nl, fsm_output(2));
  and_dcpl_160 <= and_dcpl_53 AND (fsm_output(1)) AND (NOT (fsm_output(5))) AND (NOT
      (fsm_output(4))) AND (NOT (fsm_output(6))) AND nor_449_cse;
  and_dcpl_162 <= and_dcpl_114 AND and_dcpl_25 AND and_dcpl_58;
  and_tmp_14 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11")) AND mux_tmp_323;
  nand_169_nl <= NOT((fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(8)));
  or_839_nl <= (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(2));
  mux_708_nl <= MUX_s_1_2_2(nand_169_nl, or_839_nl, fsm_output(5));
  nor_252_nl <= NOT((fsm_output(3)) OR (fsm_output(0)) OR mux_708_nl);
  and_267_nl <= (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(5)) AND (fsm_output(8))
      AND (fsm_output(1)) AND (fsm_output(2));
  mux_709_nl <= MUX_s_1_2_2(nor_252_nl, and_267_nl, fsm_output(4));
  or_195_nl <= (fsm_output(5)) OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(8));
  mux_285_nl <= MUX_s_1_2_2(or_tmp_168, or_195_nl, fsm_output(0));
  and_268_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")) AND (NOT
      mux_285_nl);
  mux_710_nl <= MUX_s_1_2_2(mux_709_nl, and_268_nl, fsm_output(6));
  or_193_nl <= (fsm_output(5)) OR (fsm_output(1)) OR (NOT (fsm_output(2))) OR (fsm_output(8));
  mux_282_nl <= MUX_s_1_2_2(or_193_nl, or_tmp_168, fsm_output(0));
  nor_253_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10"))
      OR mux_282_nl);
  nor_254_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(0)))
      OR (fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(1)) OR (NOT (fsm_output(2))));
  mux_706_nl <= MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output(6));
  not_tmp_324 <= MUX_s_1_2_2(mux_710_nl, mux_706_nl, fsm_output(7));
  or_tmp_823 <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (fsm_output(5)) OR (NOT((fsm_output(1))
      AND (fsm_output(7))));
  nand_86_cse <= NOT((fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(7)));
  or_859_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR nand_86_cse;
  or_857_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(5)))
      OR (fsm_output(1)) OR (fsm_output(7));
  mux_tmp_693 <= MUX_s_1_2_2(or_859_nl, or_857_nl, fsm_output(4));
  and_dcpl_168 <= and_dcpl_65 AND and_dcpl_3;
  and_dcpl_170 <= and_dcpl_114 AND and_dcpl_3;
  mux_tmp_729 <= MUX_s_1_2_2(and_dcpl_53, or_tmp, fsm_output(5));
  and_dcpl_176 <= and_dcpl_129 AND and_dcpl_18;
  and_dcpl_179 <= and_dcpl_35 AND and_dcpl_29;
  and_dcpl_182 <= and_dcpl_141 AND and_dcpl_148;
  and_dcpl_184 <= and_dcpl_35 AND and_327_cse;
  and_dcpl_192 <= and_dcpl_138 AND and_dcpl_184;
  or_tmp_896 <= (fsm_output(8)) OR (NOT (fsm_output(4)));
  mux_812_cse <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(8));
  or_tmp_897 <= (NOT (fsm_output(8))) OR (fsm_output(4));
  mux_816_cse <= MUX_s_1_2_2(or_tmp_897, or_tmp_896, fsm_output(7));
  mux_820_cse <= MUX_s_1_2_2((NOT or_1183_cse), nor_tmp_45, fsm_output(0));
  mux_821_cse <= MUX_s_1_2_2((NOT or_1183_cse), nor_tmp_45, fsm_output(7));
  and_211_nl <= (fsm_output(5)) AND or_tmp;
  mux_tmp_834 <= MUX_s_1_2_2(and_211_nl, (fsm_output(5)), fsm_output(4));
  mux_862_nl <= MUX_s_1_2_2((fsm_output(5)), or_tmp_767, fsm_output(4));
  mux_753_nl <= MUX_s_1_2_2((fsm_output(5)), or_tmp_772, fsm_output(4));
  mux_tmp_836 <= MUX_s_1_2_2(mux_862_nl, mux_753_nl, fsm_output(0));
  not_tmp_377 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))
      OR mux_tmp_836);
  and_212_nl <= (fsm_output(7)) AND ((fsm_output(6)) OR mux_tmp_834);
  mux_864_itm <= MUX_s_1_2_2(not_tmp_377, and_212_nl, fsm_output(8));
  or_tmp_920 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR nor_tmp_3;
  or_tmp_921 <= (fsm_output(6)) OR mux_tmp_836;
  or_tmp_923 <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"));
  or_967_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR nor_tmp;
  mux_871_nl <= MUX_s_1_2_2(or_967_nl, or_tmp_920, fsm_output(0));
  mux_872_nl <= MUX_s_1_2_2(mux_tmp_836, (NOT mux_871_nl), fsm_output(6));
  and_dcpl_198 <= mux_872_nl AND nor_449_cse;
  nor_232_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"))
      OR or_tmp_779);
  mux_874_nl <= MUX_s_1_2_2(or_tmp_921, nor_232_nl, fsm_output(7));
  and_dcpl_200 <= mux_874_nl AND (NOT (fsm_output(8)));
  nor_231_nl <= NOT((fsm_output(6)) OR (CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("111111"))));
  mux_877_nl <= MUX_s_1_2_2(or_tmp_921, nor_231_nl, fsm_output(7));
  and_dcpl_202 <= mux_877_nl AND (NOT (fsm_output(8)));
  nand_75_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)=STD_LOGIC_VECTOR'("1111")));
  mux_882_nl <= MUX_s_1_2_2(or_tmp_921, nand_75_nl, fsm_output(7));
  and_dcpl_203 <= mux_882_nl AND (NOT (fsm_output(8)));
  nor_448_nl <= NOT((fsm_output(8)) OR (fsm_output(6)));
  and_396_nl <= (fsm_output(8)) AND (fsm_output(6));
  mux_tmp_856 <= MUX_s_1_2_2(nor_448_nl, and_396_nl, fsm_output(5));
  and_227_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND or_tmp;
  mux_892_nl <= MUX_s_1_2_2(and_227_nl, and_354_cse, fsm_output(0));
  or_981_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_892_nl;
  mux_893_itm <= MUX_s_1_2_2(not_tmp_377, or_981_nl, fsm_output(8));
  mux_899_nl <= MUX_s_1_2_2(and_tmp_13, (fsm_output(5)), fsm_output(4));
  or_985_nl <= (fsm_output(7)) OR ((fsm_output(6)) AND mux_899_nl);
  mux_900_itm <= MUX_s_1_2_2(not_tmp_377, or_985_nl, fsm_output(8));
  and_231_nl <= (fsm_output(5)) AND or_tmp_1;
  mux_906_nl <= MUX_s_1_2_2(and_231_nl, (fsm_output(5)), fsm_output(4));
  mux_907_nl <= MUX_s_1_2_2(mux_906_nl, mux_tmp_834, fsm_output(0));
  and_232_nl <= (fsm_output(7)) AND ((fsm_output(6)) OR mux_907_nl);
  mux_908_itm <= MUX_s_1_2_2(not_tmp_377, and_232_nl, fsm_output(8));
  or_tmp_967 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("101"));
  or_tmp_969 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_891 <= MUX_s_1_2_2(or_tmp_969, or_tmp_152, fsm_output(6));
  or_tmp_970 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_893 <= MUX_s_1_2_2(nand_203_cse, or_tmp_970, fsm_output(6));
  or_1015_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_895 <= MUX_s_1_2_2(or_1015_nl, mux_tmp_893, fsm_output(5));
  mux_925_nl <= MUX_s_1_2_2(or_tmp_970, or_tmp_969, fsm_output(6));
  or_tmp_973 <= (fsm_output(5)) OR mux_925_nl;
  or_tmp_976 <= (fsm_output(6)) OR nand_203_cse;
  mux_tmp_902 <= MUX_s_1_2_2(or_tmp_969, or_tmp_976, fsm_output(5));
  or_1021_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  mux_tmp_903 <= MUX_s_1_2_2(or_1021_nl, or_tmp_976, fsm_output(5));
  nand_172_nl <= NOT((fsm_output(8)) AND (fsm_output(2)) AND (NOT (fsm_output(1)))
      AND (fsm_output(7)));
  or_850_nl <= (fsm_output(8)) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  mux_715_nl <= MUX_s_1_2_2(nand_172_nl, or_850_nl, fsm_output(5));
  nor_245_nl <= NOT((fsm_output(6)) OR mux_715_nl);
  nor_246_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(5))) OR (fsm_output(8)) OR
      (NOT (fsm_output(2))) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  mux_716_nl <= MUX_s_1_2_2(nor_245_nl, nor_246_nl, fsm_output(3));
  nor_247_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(5)) OR (NOT
      (fsm_output(8))) OR (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  mux_717_nl <= MUX_s_1_2_2(mux_716_nl, nor_247_nl, fsm_output(4));
  nor_248_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(5))) OR (fsm_output(8))
      OR (NOT (fsm_output(2))) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_249_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(5)) OR (NOT (fsm_output(8)))
      OR (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  mux_713_nl <= MUX_s_1_2_2(nor_248_nl, nor_249_nl, fsm_output(3));
  and_nl <= (fsm_output(5)) AND (fsm_output(8)) AND (fsm_output(2)) AND (NOT (fsm_output(1)))
      AND (fsm_output(7));
  nor_251_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(2)) OR (fsm_output(1))
      OR (NOT (fsm_output(7))));
  mux_712_nl <= MUX_s_1_2_2(and_nl, nor_251_nl, fsm_output(6));
  and_266_nl <= (fsm_output(3)) AND mux_712_nl;
  mux_714_nl <= MUX_s_1_2_2(mux_713_nl, and_266_nl, fsm_output(4));
  COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c4 <= MUX_s_1_2_2(mux_717_nl, mux_714_nl,
      fsm_output(0));
  or_860_nl <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(5)))
      OR (fsm_output(1)) OR (fsm_output(7));
  mux_722_nl <= MUX_s_1_2_2(or_860_nl, or_tmp_823, fsm_output(4));
  mux_723_nl <= MUX_s_1_2_2(mux_722_nl, mux_tmp_693, fsm_output(3));
  nor_244_nl <= NOT((fsm_output(6)) OR mux_723_nl);
  or_854_nl <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (fsm_output(5)) OR (fsm_output(1))
      OR (fsm_output(7));
  mux_719_nl <= MUX_s_1_2_2(or_tmp_823, or_854_nl, fsm_output(4));
  mux_721_nl <= MUX_s_1_2_2(mux_tmp_693, mux_719_nl, fsm_output(3));
  and_265_nl <= (fsm_output(6)) AND (NOT mux_721_nl);
  COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c5 <= MUX_s_1_2_2(nor_244_nl, and_265_nl,
      fsm_output(0));
  STAGE_VEC_LOOP_j_sva_9_0_mx0c1 <= and_dcpl_168 AND and_dcpl_129 AND and_327_cse;
  COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c3 <= nor_tmp
      AND and_dcpl_148 AND and_dcpl_58;
  COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c4 <= and_dcpl_182
      AND and_dcpl_62;
  COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c5 <= and_dcpl_168
      AND and_dcpl_140;
  COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c6 <= and_dcpl_55
      AND and_dcpl_144;
  COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c7 <= and_dcpl_131
      AND and_dcpl_147;
  operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c1 <= and_dcpl_114 AND
      and_dcpl_148 AND and_dcpl_137;
  operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c2 <= and_dcpl_154 AND
      and_dcpl_151;
  tmp_1_lpi_4_dfm_mx0c0 <= and_dcpl_55 AND and_dcpl_58;
  and_188_m1c <= and_dcpl_131 AND and_dcpl_62;
  and_189_m1c <= and_dcpl_154 AND and_dcpl_137;
  and_190_m1c <= and_dcpl_138 AND and_dcpl_133;
  and_193_m1c <= and_dcpl_134 AND and_354_cse AND and_dcpl_176;
  and_195_m1c <= and_dcpl_145 AND and_dcpl_179;
  and_198_m1c <= and_dcpl_182 AND and_dcpl_129 AND and_dcpl_29;
  and_200_m1c <= and_dcpl_152 AND and_dcpl_184;
  nor_443_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(1)));
  nor_444_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(1))));
  mux_354_nl <= MUX_s_1_2_2(nor_443_nl, nor_444_nl, fsm_output(4));
  and_72_nl <= mux_354_nl AND and_dcpl_53 AND and_dcpl_58;
  and_79_nl <= and_dcpl_65 AND and_dcpl_25 AND and_dcpl_62;
  and_83_nl <= and_dcpl_65 AND xor_dcpl AND CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"))
      AND nor_449_cse;
  nor_441_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(0)) OR (fsm_output(1)) OR
      (NOT nor_tmp_3));
  nor_442_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(1)))
      OR (fsm_output(2)) OR (fsm_output(3)));
  mux_355_nl <= MUX_s_1_2_2(nor_441_nl, nor_442_nl, fsm_output(7));
  and_85_nl <= mux_355_nl AND and_dcpl_25 AND (NOT (fsm_output(8)));
  or_1071_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(2)));
  or_1072_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(2));
  mux_356_nl <= MUX_s_1_2_2(or_1071_nl, or_1072_nl, fsm_output(0));
  nor_534_nl <= NOT(mux_356_nl OR (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(6))
      OR (NOT and_dcpl_18));
  and_321_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  nor_438_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  mux_357_nl <= MUX_s_1_2_2(and_321_nl, nor_438_nl, fsm_output(0));
  and_94_nl <= mux_357_nl AND (fsm_output(2)) AND (NOT (fsm_output(1))) AND (NOT
      (fsm_output(6))) AND and_dcpl_18;
  and_320_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(5));
  nor_437_nl <= NOT((fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(5)));
  mux_358_nl <= MUX_s_1_2_2(and_320_nl, nor_437_nl, fsm_output(6));
  and_98_nl <= mux_358_nl AND CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("110"))
      AND and_dcpl_18;
  nor_435_nl <= NOT((fsm_output(0)) OR (NOT((fsm_output(1)) AND (fsm_output(3)))));
  nor_436_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(1)) OR (fsm_output(3)));
  mux_359_nl <= MUX_s_1_2_2(nor_435_nl, nor_436_nl, fsm_output(6));
  and_102_nl <= mux_359_nl AND (fsm_output(2)) AND and_354_cse AND and_dcpl_18;
  nor_433_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (fsm_output(0))
      OR (NOT((fsm_output(4)) AND (fsm_output(5)) AND (fsm_output(1)))));
  nor_434_nl <= NOT((fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR
      (fsm_output(4)) OR (fsm_output(5)) OR (fsm_output(1)));
  mux_360_nl <= MUX_s_1_2_2(nor_433_nl, nor_434_nl, fsm_output(8));
  and_104_nl <= mux_360_nl AND and_dcpl_31;
  and_319_nl <= (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(0)) AND (fsm_output(4))
      AND (NOT (fsm_output(3)));
  nor_432_nl <= NOT((fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(4))
      OR (NOT (fsm_output(3))));
  mux_361_nl <= MUX_s_1_2_2(and_319_nl, nor_432_nl, fsm_output(8));
  and_107_nl <= mux_361_nl AND and_257_cse AND (fsm_output(5));
  and_112_nl <= nor_tmp AND xor_dcpl AND and_dcpl_97 AND and_dcpl_29;
  nor_430_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(1)) OR
      (fsm_output(2)));
  nor_431_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(4)) OR (NOT and_257_cse));
  mux_362_nl <= MUX_s_1_2_2(nor_430_nl, nor_431_nl, fsm_output(6));
  and_115_nl <= mux_362_nl AND (NOT (fsm_output(3))) AND (fsm_output(5)) AND and_dcpl_29;
  nor_429_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0100")));
  and_318_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1011"));
  mux_363_nl <= MUX_s_1_2_2(nor_429_nl, and_318_nl, fsm_output(0));
  and_118_nl <= mux_363_nl AND CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_29;
  and_317_nl <= (fsm_output(6)) AND (fsm_output(0)) AND (fsm_output(3));
  nor_428_nl <= NOT((fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(3)));
  mux_364_nl <= MUX_s_1_2_2(and_317_nl, nor_428_nl, fsm_output(7));
  and_123_nl <= mux_364_nl AND (NOT (fsm_output(2))) AND (NOT (fsm_output(1))) AND
      (fsm_output(5)) AND (NOT (fsm_output(4))) AND (fsm_output(8));
  and_128_nl <= and_dcpl_114 AND xor_dcpl AND and_dcpl_97 AND and_327_cse;
  nor_426_nl <= NOT((fsm_output(0)) OR (fsm_output(4)) OR (NOT (fsm_output(5))) OR
      (NOT (fsm_output(1))) OR (fsm_output(3)));
  nor_427_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (fsm_output(5))
      OR (fsm_output(1)) OR (NOT (fsm_output(3))));
  mux_365_nl <= MUX_s_1_2_2(nor_426_nl, nor_427_nl, fsm_output(6));
  and_131_nl <= mux_365_nl AND (NOT (fsm_output(2))) AND (fsm_output(7)) AND (fsm_output(8));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_7_17_2((COMP_LOOP_1_operator_64_false_acc_tmp(9
      DOWNTO 3)), (COMP_LOOP_acc_psp_sva_6 & COMP_LOOP_acc_psp_sva_5_0), (operator_64_false_acc_cse_1_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_cse_2_sva(9 DOWNTO 3)), (operator_64_false_acc_cse_2_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_7_psp_sva(8 DOWNTO 2)), (operator_64_false_acc_cse_3_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_cse_4_sva(9 DOWNTO 3)), (operator_64_false_acc_cse_4_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_8_psp_sva(7 DOWNTO 1)), (operator_64_false_acc_cse_5_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_cse_6_sva(9 DOWNTO 3)), (operator_64_false_acc_cse_6_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_9_psp_sva(8 DOWNTO 2)), (operator_64_false_acc_cse_7_sva(9
      DOWNTO 3)), (COMP_LOOP_acc_cse_sva(9 DOWNTO 3)), (operator_64_false_acc_cse_sva(9
      DOWNTO 3)), STD_LOGIC_VECTOR'( and_dcpl_56 & and_72_nl & and_79_nl & and_83_nl
      & and_85_nl & nor_534_nl & and_94_nl & and_98_nl & and_102_nl & and_104_nl
      & and_107_nl & and_112_nl & and_115_nl & and_118_nl & and_123_nl & and_128_nl
      & and_131_nl));
  vec_rsc_0_0_i_da_d_pff <= COMP_LOOP_1_modulo_dev_cmp_return_rsc_z;
  nor_417_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR nand_142_cse);
  nor_419_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_420_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  mux_376_nl <= MUX_s_1_2_2(nor_419_nl, nor_420_nl, fsm_output(4));
  nand_8_nl <= NOT((fsm_output(6)) AND mux_376_nl);
  or_284_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_282_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_375_nl <= MUX_s_1_2_2(or_284_nl, or_282_nl, fsm_output(4));
  or_285_nl <= (fsm_output(6)) OR mux_375_nl;
  mux_377_nl <= MUX_s_1_2_2(nand_8_nl, or_285_nl, fsm_output(7));
  nor_418_nl <= NOT((fsm_output(8)) OR mux_377_nl);
  mux_378_nl <= MUX_s_1_2_2(nor_417_nl, nor_418_nl, fsm_output(1));
  or_279_nl <= (fsm_output(7)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  or_276_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (fsm_output(3)) OR (fsm_output(0));
  or_275_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (fsm_output(3)) OR (fsm_output(0));
  mux_373_nl <= MUX_s_1_2_2(or_276_nl, or_275_nl, fsm_output(4));
  or_277_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")) OR mux_373_nl;
  mux_374_nl <= MUX_s_1_2_2(or_279_nl, or_277_nl, fsm_output(8));
  nor_421_nl <= NOT((fsm_output(1)) OR mux_374_nl);
  mux_379_nl <= MUX_s_1_2_2(mux_378_nl, nor_421_nl, fsm_output(5));
  or_272_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3))) OR (fsm_output(0));
  or_271_nl <= (fsm_output(7)) OR (COMP_LOOP_acc_8_psp_sva(0)) OR (STAGE_VEC_LOOP_j_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  mux_371_nl <= MUX_s_1_2_2(or_272_nl, or_271_nl, fsm_output(8));
  nor_422_nl <= NOT((fsm_output(1)) OR mux_371_nl);
  nor_423_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_424_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(0))));
  mux_369_nl <= MUX_s_1_2_2(nor_423_nl, nor_424_nl, fsm_output(6));
  and_316_nl <= nor_121_cse AND mux_369_nl;
  or_265_nl <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  or_264_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  mux_367_nl <= MUX_s_1_2_2(or_265_nl, or_264_nl, fsm_output(4));
  or_263_nl <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_261_nl <= CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_366_nl <= MUX_s_1_2_2(or_263_nl, or_261_nl, fsm_output(4));
  mux_368_nl <= MUX_s_1_2_2(mux_367_nl, mux_366_nl, fsm_output(6));
  nor_425_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"))
      OR mux_368_nl);
  mux_370_nl <= MUX_s_1_2_2(and_316_nl, nor_425_nl, fsm_output(1));
  mux_372_nl <= MUX_s_1_2_2(nor_422_nl, mux_370_nl, fsm_output(5));
  vec_rsc_0_0_i_wea_d_pff <= MUX_s_1_2_2(mux_379_nl, mux_372_nl, fsm_output(2));
  nor_407_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_408_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm) OR
      CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  mux_392_nl <= MUX_s_1_2_2(nor_407_nl, nor_408_nl, fsm_output(0));
  nand_12_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_392_nl);
  or_317_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_316_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_391_nl <= MUX_s_1_2_2(or_317_nl, or_316_nl, fsm_output(0));
  or_318_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_391_nl;
  mux_393_nl <= MUX_s_1_2_2(nand_12_nl, or_318_nl, fsm_output(7));
  or_313_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_311_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_390_nl <= MUX_s_1_2_2(or_313_nl, or_311_nl, fsm_output(0));
  or_314_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_390_nl;
  mux_394_nl <= MUX_s_1_2_2(mux_393_nl, or_314_nl, fsm_output(4));
  nor_406_nl <= NOT((fsm_output(8)) OR mux_394_nl);
  nor_409_nl <= NOT((COMP_LOOP_acc_8_psp_sva(0)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_410_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR nand_205_cse);
  mux_387_nl <= MUX_s_1_2_2(nor_409_nl, nor_410_nl, fsm_output(0));
  and_314_nl <= (fsm_output(6)) AND mux_387_nl;
  or_303_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR nand_205_cse;
  or_301_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_386_nl <= MUX_s_1_2_2(or_303_nl, or_301_nl, fsm_output(0));
  nor_411_nl <= NOT((fsm_output(6)) OR mux_386_nl);
  mux_388_nl <= MUX_s_1_2_2(and_314_nl, nor_411_nl, fsm_output(3));
  and_313_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_388_nl;
  nor_412_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_413_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_414_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_382_nl <= MUX_s_1_2_2(nor_413_nl, nor_414_nl, fsm_output(0));
  mux_383_nl <= MUX_s_1_2_2(nor_412_nl, mux_382_nl, fsm_output(6));
  and_315_nl <= (fsm_output(3)) AND mux_383_nl;
  or_295_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_293_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_381_nl <= MUX_s_1_2_2(or_295_nl, or_293_nl, fsm_output(0));
  nor_415_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_381_nl);
  mux_384_nl <= MUX_s_1_2_2(and_315_nl, nor_415_nl, fsm_output(7));
  nor_416_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(2)) OR (fsm_output(1)));
  mux_385_nl <= MUX_s_1_2_2(mux_384_nl, nor_416_nl, fsm_output(4));
  mux_389_nl <= MUX_s_1_2_2(and_313_nl, mux_385_nl, fsm_output(8));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_406_nl, mux_389_nl,
      fsm_output(5));
  nor_393_nl <= NOT((fsm_output(8)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(6)) OR (fsm_output(4)) OR (NOT
      (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  nor_394_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  nor_395_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_407_nl <= MUX_s_1_2_2(nor_394_nl, nor_395_nl, fsm_output(4));
  and_310_nl <= nor_127_cse AND mux_407_nl;
  mux_408_nl <= MUX_s_1_2_2(nor_393_nl, and_310_nl, fsm_output(1));
  nor_396_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_397_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  mux_404_nl <= MUX_s_1_2_2(nor_396_nl, nor_397_nl, fsm_output(4));
  nor_398_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)));
  mux_405_nl <= MUX_s_1_2_2(mux_404_nl, nor_398_nl, fsm_output(6));
  and_311_nl <= (fsm_output(8)) AND mux_405_nl;
  or_341_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (fsm_output(5));
  or_340_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (fsm_output(5));
  mux_403_nl <= MUX_s_1_2_2(or_341_nl, or_340_nl, fsm_output(4));
  nor_399_nl <= NOT((fsm_output(8)) OR (fsm_output(6)) OR mux_403_nl);
  mux_406_nl <= MUX_s_1_2_2(and_311_nl, nor_399_nl, fsm_output(1));
  mux_409_nl <= MUX_s_1_2_2(mux_408_nl, mux_406_nl, fsm_output(7));
  nor_400_nl <= NOT((NOT (fsm_output(8))) OR (COMP_LOOP_acc_8_psp_sva(0)) OR (STAGE_VEC_LOOP_j_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0)))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (fsm_output(5)));
  nor_401_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR not_tmp_184);
  nor_402_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR not_tmp_184);
  mux_399_nl <= MUX_s_1_2_2(nor_401_nl, nor_402_nl, fsm_output(4));
  nor_403_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_404_nl <= NOT((NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  mux_398_nl <= MUX_s_1_2_2(nor_403_nl, nor_404_nl, fsm_output(4));
  mux_400_nl <= MUX_s_1_2_2(mux_399_nl, mux_398_nl, fsm_output(6));
  and_312_nl <= (fsm_output(8)) AND mux_400_nl;
  mux_401_nl <= MUX_s_1_2_2(nor_400_nl, and_312_nl, fsm_output(1));
  or_328_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(4))) OR (fsm_output(0)) OR not_tmp_184;
  or_326_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  or_325_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  mux_396_nl <= MUX_s_1_2_2(or_326_nl, or_325_nl, fsm_output(4));
  mux_397_nl <= MUX_s_1_2_2(or_328_nl, mux_396_nl, fsm_output(6));
  nor_405_nl <= NOT((fsm_output(1)) OR (fsm_output(8)) OR mux_397_nl);
  mux_402_nl <= MUX_s_1_2_2(mux_401_nl, nor_405_nl, fsm_output(7));
  vec_rsc_0_1_i_wea_d_pff <= MUX_s_1_2_2(mux_409_nl, mux_402_nl, fsm_output(2));
  nor_383_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_384_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm) OR
      CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  mux_422_nl <= MUX_s_1_2_2(nor_383_nl, nor_384_nl, fsm_output(0));
  nand_19_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_422_nl);
  or_378_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_377_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_421_nl <= MUX_s_1_2_2(or_378_nl, or_377_nl, fsm_output(0));
  or_379_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_421_nl;
  mux_423_nl <= MUX_s_1_2_2(nand_19_nl, or_379_nl, fsm_output(7));
  or_374_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_372_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_420_nl <= MUX_s_1_2_2(or_374_nl, or_372_nl, fsm_output(0));
  or_375_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_420_nl;
  mux_424_nl <= MUX_s_1_2_2(mux_423_nl, or_375_nl, fsm_output(4));
  nor_382_nl <= NOT((fsm_output(8)) OR mux_424_nl);
  nor_385_nl <= NOT((COMP_LOOP_acc_8_psp_sva(0)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_386_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR nand_205_cse);
  mux_417_nl <= MUX_s_1_2_2(nor_385_nl, nor_386_nl, fsm_output(0));
  and_308_nl <= (fsm_output(6)) AND mux_417_nl;
  or_364_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR nand_205_cse;
  or_362_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_416_nl <= MUX_s_1_2_2(or_364_nl, or_362_nl, fsm_output(0));
  nor_387_nl <= NOT((fsm_output(6)) OR mux_416_nl);
  mux_418_nl <= MUX_s_1_2_2(and_308_nl, nor_387_nl, fsm_output(3));
  and_307_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_418_nl;
  nor_388_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_389_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_390_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_412_nl <= MUX_s_1_2_2(nor_389_nl, nor_390_nl, fsm_output(0));
  mux_413_nl <= MUX_s_1_2_2(nor_388_nl, mux_412_nl, fsm_output(6));
  and_309_nl <= (fsm_output(3)) AND mux_413_nl;
  or_356_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_354_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_411_nl <= MUX_s_1_2_2(or_356_nl, or_354_nl, fsm_output(0));
  nor_391_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_411_nl);
  mux_414_nl <= MUX_s_1_2_2(and_309_nl, nor_391_nl, fsm_output(7));
  nor_392_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(2)) OR (fsm_output(1)));
  mux_415_nl <= MUX_s_1_2_2(mux_414_nl, nor_392_nl, fsm_output(4));
  mux_419_nl <= MUX_s_1_2_2(and_307_nl, mux_415_nl, fsm_output(8));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_382_nl, mux_419_nl,
      fsm_output(5));
  nor_373_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR nand_142_cse);
  nor_375_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_376_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  mux_436_nl <= MUX_s_1_2_2(nor_375_nl, nor_376_nl, fsm_output(4));
  nand_21_nl <= NOT((fsm_output(6)) AND mux_436_nl);
  or_409_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_407_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_435_nl <= MUX_s_1_2_2(or_409_nl, or_407_nl, fsm_output(4));
  or_410_nl <= (fsm_output(6)) OR mux_435_nl;
  mux_437_nl <= MUX_s_1_2_2(nand_21_nl, or_410_nl, fsm_output(7));
  nor_374_nl <= NOT((fsm_output(8)) OR mux_437_nl);
  mux_438_nl <= MUX_s_1_2_2(nor_373_nl, nor_374_nl, fsm_output(1));
  or_404_nl <= (fsm_output(7)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  or_401_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(3)) OR (fsm_output(0));
  or_400_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(3)) OR (fsm_output(0));
  mux_433_nl <= MUX_s_1_2_2(or_401_nl, or_400_nl, fsm_output(4));
  or_402_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")) OR mux_433_nl;
  mux_434_nl <= MUX_s_1_2_2(or_404_nl, or_402_nl, fsm_output(8));
  nor_377_nl <= NOT((fsm_output(1)) OR mux_434_nl);
  mux_439_nl <= MUX_s_1_2_2(mux_438_nl, nor_377_nl, fsm_output(5));
  or_397_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3))) OR (fsm_output(0));
  or_396_nl <= (fsm_output(7)) OR (COMP_LOOP_acc_8_psp_sva(0)) OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  mux_431_nl <= MUX_s_1_2_2(or_397_nl, or_396_nl, fsm_output(8));
  nor_378_nl <= NOT((fsm_output(1)) OR mux_431_nl);
  nor_379_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_380_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(0))));
  mux_429_nl <= MUX_s_1_2_2(nor_379_nl, nor_380_nl, fsm_output(6));
  and_306_nl <= nor_121_cse AND mux_429_nl;
  or_390_nl <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  or_389_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  mux_427_nl <= MUX_s_1_2_2(or_390_nl, or_389_nl, fsm_output(4));
  or_388_nl <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_386_nl <= CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_426_nl <= MUX_s_1_2_2(or_388_nl, or_386_nl, fsm_output(4));
  mux_428_nl <= MUX_s_1_2_2(mux_427_nl, mux_426_nl, fsm_output(6));
  nor_381_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"))
      OR mux_428_nl);
  mux_430_nl <= MUX_s_1_2_2(and_306_nl, nor_381_nl, fsm_output(1));
  mux_432_nl <= MUX_s_1_2_2(nor_378_nl, mux_430_nl, fsm_output(5));
  vec_rsc_0_2_i_wea_d_pff <= MUX_s_1_2_2(mux_439_nl, mux_432_nl, fsm_output(2));
  nor_363_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_364_nl <= NOT((NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (NOT (fsm_output(1))) OR CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(2)));
  mux_452_nl <= MUX_s_1_2_2(nor_363_nl, nor_364_nl, fsm_output(0));
  nand_25_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_452_nl);
  or_442_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_440_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_451_nl <= MUX_s_1_2_2(or_442_nl, or_440_nl, fsm_output(0));
  or_443_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_451_nl;
  mux_453_nl <= MUX_s_1_2_2(nand_25_nl, or_443_nl, fsm_output(7));
  or_436_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_435_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_450_nl <= MUX_s_1_2_2(or_436_nl, or_435_nl, fsm_output(0));
  or_437_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_450_nl;
  mux_454_nl <= MUX_s_1_2_2(mux_453_nl, or_437_nl, fsm_output(4));
  nor_362_nl <= NOT((fsm_output(8)) OR mux_454_nl);
  nor_365_nl <= NOT((COMP_LOOP_acc_8_psp_sva(0)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_366_nl <= NOT((operator_64_false_acc_cse_5_sva(2)) OR (operator_64_false_acc_cse_5_sva(0))
      OR nand_135_cse);
  mux_447_nl <= MUX_s_1_2_2(nor_365_nl, nor_366_nl, fsm_output(0));
  and_304_nl <= (fsm_output(6)) AND mux_447_nl;
  or_428_nl <= (operator_64_false_acc_cse_4_sva(0)) OR (operator_64_false_acc_cse_4_sva(2))
      OR (NOT((operator_64_false_acc_cse_4_sva(1)) AND CONV_SL_1_1(fsm_output(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11"))));
  or_426_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_446_nl <= MUX_s_1_2_2(or_428_nl, or_426_nl, fsm_output(0));
  nor_367_nl <= NOT((fsm_output(6)) OR mux_446_nl);
  mux_448_nl <= MUX_s_1_2_2(and_304_nl, nor_367_nl, fsm_output(3));
  and_303_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_448_nl;
  nor_368_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_369_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_370_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_442_nl <= MUX_s_1_2_2(nor_369_nl, nor_370_nl, fsm_output(0));
  mux_443_nl <= MUX_s_1_2_2(nor_368_nl, mux_442_nl, fsm_output(6));
  and_305_nl <= (fsm_output(3)) AND mux_443_nl;
  or_419_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_418_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_441_nl <= MUX_s_1_2_2(or_419_nl, or_418_nl, fsm_output(0));
  nor_371_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_441_nl);
  mux_444_nl <= MUX_s_1_2_2(and_305_nl, nor_371_nl, fsm_output(7));
  nor_372_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)));
  mux_445_nl <= MUX_s_1_2_2(mux_444_nl, nor_372_nl, fsm_output(4));
  mux_449_nl <= MUX_s_1_2_2(and_303_nl, mux_445_nl, fsm_output(8));
  vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_362_nl, mux_449_nl,
      fsm_output(5));
  nor_353_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT((operator_64_false_acc_cse_sva(0)) AND (fsm_output(8)) AND (fsm_output(6))
      AND (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(7)) AND (fsm_output(0)))));
  or_473_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(3)) OR not_tmp_212;
  or_471_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (fsm_output(3)) OR not_tmp_212;
  mux_466_nl <= MUX_s_1_2_2(or_473_nl, or_471_nl, fsm_output(4));
  or_469_nl <= CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0));
  or_468_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0));
  mux_465_nl <= MUX_s_1_2_2(or_469_nl, or_468_nl, fsm_output(4));
  mux_467_nl <= MUX_s_1_2_2(mux_466_nl, mux_465_nl, fsm_output(6));
  nor_354_nl <= NOT((fsm_output(8)) OR mux_467_nl);
  mux_468_nl <= MUX_s_1_2_2(nor_353_nl, nor_354_nl, fsm_output(1));
  or_466_nl <= (STAGE_VEC_LOOP_j_sva_9_0(2)) OR (fsm_output(6)) OR (fsm_output(4))
      OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0)));
  or_463_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(0));
  or_462_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(0));
  mux_463_nl <= MUX_s_1_2_2(or_463_nl, or_462_nl, fsm_output(4));
  or_464_nl <= (fsm_output(6)) OR mux_463_nl;
  mux_464_nl <= MUX_s_1_2_2(or_466_nl, or_464_nl, fsm_output(8));
  nor_355_nl <= NOT((fsm_output(1)) OR mux_464_nl);
  mux_469_nl <= MUX_s_1_2_2(mux_468_nl, nor_355_nl, fsm_output(5));
  or_460_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT (fsm_output(3))) OR (NOT
      (fsm_output(7))) OR (fsm_output(0));
  or_459_nl <= (COMP_LOOP_acc_8_psp_sva(0)) OR (fsm_output(6)) OR (fsm_output(4))
      OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0)));
  mux_461_nl <= MUX_s_1_2_2(or_460_nl, or_459_nl, fsm_output(8));
  nor_356_nl <= NOT((fsm_output(1)) OR mux_461_nl);
  nand_133_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011"))
      AND (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(0))));
  or_455_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10")) OR not_tmp_212;
  mux_459_nl <= MUX_s_1_2_2(nand_133_nl, or_455_nl, fsm_output(6));
  nor_357_nl <= NOT((fsm_output(8)) OR mux_459_nl);
  nor_358_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0)));
  nor_359_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0)));
  mux_457_nl <= MUX_s_1_2_2(nor_358_nl, nor_359_nl, fsm_output(4));
  nor_360_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0))));
  nor_361_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (fsm_output(3)) OR (fsm_output(7))
      OR (NOT (fsm_output(0))));
  mux_456_nl <= MUX_s_1_2_2(nor_360_nl, nor_361_nl, fsm_output(4));
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, mux_456_nl, fsm_output(6));
  and_302_nl <= (fsm_output(8)) AND mux_458_nl;
  mux_460_nl <= MUX_s_1_2_2(nor_357_nl, and_302_nl, fsm_output(1));
  mux_462_nl <= MUX_s_1_2_2(nor_356_nl, mux_460_nl, fsm_output(5));
  vec_rsc_0_3_i_wea_d_pff <= MUX_s_1_2_2(mux_469_nl, mux_462_nl, fsm_output(2));
  nor_344_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(1)));
  nor_345_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(1)));
  mux_481_nl <= MUX_s_1_2_2(nor_344_nl, nor_345_nl, fsm_output(0));
  nor_346_nl <= NOT((NOT (fsm_output(5))) OR CONV_SL_1_1(operator_64_false_acc_cse_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("011")) OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  nor_347_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR (NOT (fsm_output(5)))
      OR (fsm_output(2)) OR (fsm_output(1)));
  mux_480_nl <= MUX_s_1_2_2(nor_346_nl, nor_347_nl, fsm_output(0));
  mux_482_nl <= MUX_s_1_2_2(mux_481_nl, mux_480_nl, fsm_output(8));
  and_301_nl <= (fsm_output(7)) AND mux_482_nl;
  or_500_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT (fsm_output(1)));
  or_498_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT (fsm_output(1)));
  mux_478_nl <= MUX_s_1_2_2(or_500_nl, or_498_nl, fsm_output(0));
  or_496_nl <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(0)) OR (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(1));
  mux_479_nl <= MUX_s_1_2_2(mux_478_nl, or_496_nl, fsm_output(8));
  nor_348_nl <= NOT((fsm_output(7)) OR mux_479_nl);
  mux_483_nl <= MUX_s_1_2_2(and_301_nl, nor_348_nl, fsm_output(4));
  nor_349_nl <= NOT((NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011"))
      AND (NOT (fsm_output(7))) AND (fsm_output(8)) AND (fsm_output(0)) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR not_tmp_217);
  or_492_nl <= (NOT (operator_64_false_acc_cse_4_sva(0))) OR (operator_64_false_acc_cse_4_sva(2))
      OR (NOT((operator_64_false_acc_cse_4_sva(1)) AND (fsm_output(5)) AND (fsm_output(2))
      AND (fsm_output(1))));
  nand_128_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011"))
      AND operator_64_false_slc_operator_64_false_acc_1_60_itm AND (fsm_output(5))
      AND (fsm_output(2)) AND (NOT (fsm_output(1))));
  mux_476_nl <= MUX_s_1_2_2(or_492_nl, nand_128_nl, fsm_output(0));
  nor_350_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"))
      OR mux_476_nl);
  mux_477_nl <= MUX_s_1_2_2(nor_349_nl, nor_350_nl, fsm_output(4));
  mux_484_nl <= MUX_s_1_2_2(mux_483_nl, mux_477_nl, fsm_output(3));
  or_487_nl <= (NOT((NOT (COMP_LOOP_acc_8_psp_sva(0))) AND CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR not_tmp_217;
  or_485_nl <= (operator_64_false_acc_cse_5_sva(2)) OR (NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(5)) AND (fsm_output(2))
      AND (fsm_output(1))));
  mux_474_nl <= MUX_s_1_2_2(or_487_nl, or_485_nl, fsm_output(0));
  nor_351_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(7))) OR (fsm_output(8))
      OR mux_474_nl);
  or_482_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(1));
  or_481_nl <= (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT (fsm_output(1)));
  mux_472_nl <= MUX_s_1_2_2(or_482_nl, or_481_nl, fsm_output(0));
  or_479_nl <= CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(1));
  or_478_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(1));
  mux_471_nl <= MUX_s_1_2_2(or_479_nl, or_478_nl, fsm_output(0));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_471_nl, fsm_output(8));
  nor_352_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR mux_473_nl);
  mux_475_nl <= MUX_s_1_2_2(nor_351_nl, nor_352_nl, fsm_output(3));
  vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_484_nl, mux_475_nl,
      fsm_output(6));
  nor_335_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR nand_142_cse);
  nor_337_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_338_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  mux_496_nl <= MUX_s_1_2_2(nor_337_nl, nor_338_nl, fsm_output(4));
  nand_29_nl <= NOT((fsm_output(6)) AND mux_496_nl);
  or_532_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_530_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_495_nl <= MUX_s_1_2_2(or_532_nl, or_530_nl, fsm_output(4));
  or_533_nl <= (fsm_output(6)) OR mux_495_nl;
  mux_497_nl <= MUX_s_1_2_2(nand_29_nl, or_533_nl, fsm_output(7));
  nor_336_nl <= NOT((fsm_output(8)) OR mux_497_nl);
  mux_498_nl <= MUX_s_1_2_2(nor_335_nl, nor_336_nl, fsm_output(1));
  or_527_nl <= (fsm_output(7)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  or_524_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(3)) OR (fsm_output(0));
  or_523_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(3)) OR (fsm_output(0));
  mux_493_nl <= MUX_s_1_2_2(or_524_nl, or_523_nl, fsm_output(4));
  or_525_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")) OR mux_493_nl;
  mux_494_nl <= MUX_s_1_2_2(or_527_nl, or_525_nl, fsm_output(8));
  nor_339_nl <= NOT((fsm_output(1)) OR mux_494_nl);
  mux_499_nl <= MUX_s_1_2_2(mux_498_nl, nor_339_nl, fsm_output(5));
  or_520_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3))) OR (fsm_output(0));
  or_519_nl <= (fsm_output(7)) OR (NOT (COMP_LOOP_acc_8_psp_sva(0))) OR (STAGE_VEC_LOOP_j_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  mux_491_nl <= MUX_s_1_2_2(or_520_nl, or_519_nl, fsm_output(8));
  nor_340_nl <= NOT((fsm_output(1)) OR mux_491_nl);
  nor_341_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_342_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(0))));
  mux_489_nl <= MUX_s_1_2_2(nor_341_nl, nor_342_nl, fsm_output(6));
  and_300_nl <= nor_121_cse AND mux_489_nl;
  or_513_nl <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  or_512_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  mux_487_nl <= MUX_s_1_2_2(or_513_nl, or_512_nl, fsm_output(4));
  or_511_nl <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_509_nl <= CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_486_nl <= MUX_s_1_2_2(or_511_nl, or_509_nl, fsm_output(4));
  mux_488_nl <= MUX_s_1_2_2(mux_487_nl, mux_486_nl, fsm_output(6));
  nor_343_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"))
      OR mux_488_nl);
  mux_490_nl <= MUX_s_1_2_2(and_300_nl, nor_343_nl, fsm_output(1));
  mux_492_nl <= MUX_s_1_2_2(nor_340_nl, mux_490_nl, fsm_output(5));
  vec_rsc_0_4_i_wea_d_pff <= MUX_s_1_2_2(mux_499_nl, mux_492_nl, fsm_output(2));
  nor_325_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_326_nl <= NOT((NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (NOT (fsm_output(1))) OR CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(2)));
  mux_512_nl <= MUX_s_1_2_2(nor_325_nl, nor_326_nl, fsm_output(0));
  nand_33_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_512_nl);
  or_565_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_563_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_511_nl <= MUX_s_1_2_2(or_565_nl, or_563_nl, fsm_output(0));
  or_566_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_511_nl;
  mux_513_nl <= MUX_s_1_2_2(nand_33_nl, or_566_nl, fsm_output(7));
  or_559_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_558_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_510_nl <= MUX_s_1_2_2(or_559_nl, or_558_nl, fsm_output(0));
  or_560_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_510_nl;
  mux_514_nl <= MUX_s_1_2_2(mux_513_nl, or_560_nl, fsm_output(4));
  nor_324_nl <= NOT((fsm_output(8)) OR mux_514_nl);
  nor_327_nl <= NOT((NOT (COMP_LOOP_acc_8_psp_sva(0))) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_328_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR nand_205_cse);
  mux_507_nl <= MUX_s_1_2_2(nor_327_nl, nor_328_nl, fsm_output(0));
  and_298_nl <= (fsm_output(6)) AND mux_507_nl;
  or_551_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR nand_205_cse;
  or_549_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_506_nl <= MUX_s_1_2_2(or_551_nl, or_549_nl, fsm_output(0));
  nor_329_nl <= NOT((fsm_output(6)) OR mux_506_nl);
  mux_508_nl <= MUX_s_1_2_2(and_298_nl, nor_329_nl, fsm_output(3));
  and_297_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_508_nl;
  nor_330_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR nand_205_cse);
  nor_331_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_332_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_502_nl <= MUX_s_1_2_2(nor_331_nl, nor_332_nl, fsm_output(0));
  mux_503_nl <= MUX_s_1_2_2(nor_330_nl, mux_502_nl, fsm_output(6));
  and_299_nl <= (fsm_output(3)) AND mux_503_nl;
  or_542_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_541_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_501_nl <= MUX_s_1_2_2(or_542_nl, or_541_nl, fsm_output(0));
  nor_333_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_501_nl);
  mux_504_nl <= MUX_s_1_2_2(and_299_nl, nor_333_nl, fsm_output(7));
  nor_334_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)));
  mux_505_nl <= MUX_s_1_2_2(mux_504_nl, nor_334_nl, fsm_output(4));
  mux_509_nl <= MUX_s_1_2_2(and_297_nl, mux_505_nl, fsm_output(8));
  vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_324_nl, mux_509_nl,
      fsm_output(5));
  nor_312_nl <= NOT((fsm_output(8)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(6)) OR (fsm_output(4)) OR (NOT
      (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  nor_313_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  nor_314_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_527_nl <= MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output(4));
  and_293_nl <= nor_127_cse AND mux_527_nl;
  mux_528_nl <= MUX_s_1_2_2(nor_312_nl, and_293_nl, fsm_output(1));
  nor_315_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_316_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  mux_524_nl <= MUX_s_1_2_2(nor_315_nl, nor_316_nl, fsm_output(4));
  and_295_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"))
      AND (fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(3)) AND (NOT (fsm_output(5)));
  mux_525_nl <= MUX_s_1_2_2(mux_524_nl, and_295_nl, fsm_output(6));
  and_294_nl <= (fsm_output(8)) AND mux_525_nl;
  or_589_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (fsm_output(5));
  or_588_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (fsm_output(5));
  mux_523_nl <= MUX_s_1_2_2(or_589_nl, or_588_nl, fsm_output(4));
  nor_317_nl <= NOT((fsm_output(8)) OR (fsm_output(6)) OR mux_523_nl);
  mux_526_nl <= MUX_s_1_2_2(and_294_nl, nor_317_nl, fsm_output(1));
  mux_529_nl <= MUX_s_1_2_2(mux_528_nl, mux_526_nl, fsm_output(7));
  nor_318_nl <= NOT((NOT (fsm_output(8))) OR (NOT (COMP_LOOP_acc_8_psp_sva(0))) OR
      (STAGE_VEC_LOOP_j_sva_9_0(1)) OR (fsm_output(6)) OR (fsm_output(4)) OR (NOT
      (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (fsm_output(5)));
  nor_319_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR not_tmp_184);
  nor_320_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR not_tmp_184);
  mux_519_nl <= MUX_s_1_2_2(nor_319_nl, nor_320_nl, fsm_output(4));
  nor_321_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_322_nl <= NOT((NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT (fsm_output(0))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  mux_518_nl <= MUX_s_1_2_2(nor_321_nl, nor_322_nl, fsm_output(4));
  mux_520_nl <= MUX_s_1_2_2(mux_519_nl, mux_518_nl, fsm_output(6));
  and_296_nl <= (fsm_output(8)) AND mux_520_nl;
  mux_521_nl <= MUX_s_1_2_2(nor_318_nl, and_296_nl, fsm_output(1));
  or_576_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT (fsm_output(4))) OR (fsm_output(0)) OR not_tmp_184;
  or_574_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  or_573_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  mux_516_nl <= MUX_s_1_2_2(or_574_nl, or_573_nl, fsm_output(4));
  mux_517_nl <= MUX_s_1_2_2(or_576_nl, mux_516_nl, fsm_output(6));
  nor_323_nl <= NOT((fsm_output(1)) OR (fsm_output(8)) OR mux_517_nl);
  mux_522_nl <= MUX_s_1_2_2(mux_521_nl, nor_323_nl, fsm_output(7));
  vec_rsc_0_5_i_wea_d_pff <= MUX_s_1_2_2(mux_529_nl, mux_522_nl, fsm_output(2));
  nor_302_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_303_nl <= NOT((NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (NOT (fsm_output(1))) OR CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(2)));
  mux_542_nl <= MUX_s_1_2_2(nor_302_nl, nor_303_nl, fsm_output(0));
  nand_40_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_542_nl);
  or_626_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_624_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_541_nl <= MUX_s_1_2_2(or_626_nl, or_624_nl, fsm_output(0));
  or_627_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_541_nl;
  mux_543_nl <= MUX_s_1_2_2(nand_40_nl, or_627_nl, fsm_output(7));
  or_620_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_619_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_540_nl <= MUX_s_1_2_2(or_620_nl, or_619_nl, fsm_output(0));
  or_621_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_540_nl;
  mux_544_nl <= MUX_s_1_2_2(mux_543_nl, or_621_nl, fsm_output(4));
  nor_301_nl <= NOT((fsm_output(8)) OR mux_544_nl);
  nor_304_nl <= NOT((NOT((COMP_LOOP_acc_8_psp_sva(0)) AND CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  nor_305_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR nand_205_cse);
  mux_537_nl <= MUX_s_1_2_2(nor_304_nl, nor_305_nl, fsm_output(0));
  and_291_nl <= (fsm_output(6)) AND mux_537_nl;
  or_612_nl <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR nand_205_cse;
  or_610_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_536_nl <= MUX_s_1_2_2(or_612_nl, or_610_nl, fsm_output(0));
  nor_306_nl <= NOT((fsm_output(6)) OR mux_536_nl);
  mux_538_nl <= MUX_s_1_2_2(and_291_nl, nor_306_nl, fsm_output(3));
  and_290_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_538_nl;
  nor_307_nl <= NOT((NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"))
      AND (fsm_output(0)) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  nor_308_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_309_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_532_nl <= MUX_s_1_2_2(nor_308_nl, nor_309_nl, fsm_output(0));
  mux_533_nl <= MUX_s_1_2_2(nor_307_nl, mux_532_nl, fsm_output(6));
  and_292_nl <= (fsm_output(3)) AND mux_533_nl;
  or_603_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_602_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_531_nl <= MUX_s_1_2_2(or_603_nl, or_602_nl, fsm_output(0));
  nor_310_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_531_nl);
  mux_534_nl <= MUX_s_1_2_2(and_292_nl, nor_310_nl, fsm_output(7));
  nor_311_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)));
  mux_535_nl <= MUX_s_1_2_2(mux_534_nl, nor_311_nl, fsm_output(4));
  mux_539_nl <= MUX_s_1_2_2(and_290_nl, mux_535_nl, fsm_output(8));
  vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_301_nl, mux_539_nl,
      fsm_output(5));
  nor_292_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"))
      AND CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"))))
      OR nand_142_cse);
  nor_294_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_295_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  mux_556_nl <= MUX_s_1_2_2(nor_294_nl, nor_295_nl, fsm_output(4));
  nand_42_nl <= NOT((fsm_output(6)) AND mux_556_nl);
  or_657_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_655_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_555_nl <= MUX_s_1_2_2(or_657_nl, or_655_nl, fsm_output(4));
  or_658_nl <= (fsm_output(6)) OR mux_555_nl;
  mux_557_nl <= MUX_s_1_2_2(nand_42_nl, or_658_nl, fsm_output(7));
  nor_293_nl <= NOT((fsm_output(8)) OR mux_557_nl);
  mux_558_nl <= MUX_s_1_2_2(nor_292_nl, nor_293_nl, fsm_output(1));
  or_652_nl <= (fsm_output(7)) OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  or_649_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(3)) OR (fsm_output(0));
  or_648_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(3)) OR (fsm_output(0));
  mux_553_nl <= MUX_s_1_2_2(or_649_nl, or_648_nl, fsm_output(4));
  or_650_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")) OR mux_553_nl;
  mux_554_nl <= MUX_s_1_2_2(or_652_nl, or_650_nl, fsm_output(8));
  nor_296_nl <= NOT((fsm_output(1)) OR mux_554_nl);
  mux_559_nl <= MUX_s_1_2_2(mux_558_nl, nor_296_nl, fsm_output(5));
  or_645_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3))) OR (fsm_output(0));
  or_644_nl <= (fsm_output(7)) OR (NOT (COMP_LOOP_acc_8_psp_sva(0))) OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4)) OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3))
      OR (NOT (fsm_output(0)));
  mux_551_nl <= MUX_s_1_2_2(or_645_nl, or_644_nl, fsm_output(8));
  nor_297_nl <= NOT((fsm_output(1)) OR mux_551_nl);
  nor_298_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(0)));
  nor_299_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(0))));
  mux_549_nl <= MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output(6));
  and_289_nl <= nor_121_cse AND mux_549_nl;
  or_638_nl <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  or_637_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(0));
  mux_547_nl <= MUX_s_1_2_2(or_638_nl, or_637_nl, fsm_output(4));
  or_636_nl <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  or_634_nl <= CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (fsm_output(0)));
  mux_546_nl <= MUX_s_1_2_2(or_636_nl, or_634_nl, fsm_output(4));
  mux_548_nl <= MUX_s_1_2_2(mux_547_nl, mux_546_nl, fsm_output(6));
  nor_300_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"))
      OR mux_548_nl);
  mux_550_nl <= MUX_s_1_2_2(and_289_nl, nor_300_nl, fsm_output(1));
  mux_552_nl <= MUX_s_1_2_2(nor_297_nl, mux_550_nl, fsm_output(5));
  vec_rsc_0_6_i_wea_d_pff <= MUX_s_1_2_2(mux_559_nl, mux_552_nl, fsm_output(2));
  nor_282_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")));
  nor_283_nl <= NOT((NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR (NOT (fsm_output(1))) OR CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(2)));
  mux_572_nl <= MUX_s_1_2_2(nor_282_nl, nor_283_nl, fsm_output(0));
  nand_46_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_572_nl);
  or_689_nl <= CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_687_nl <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_571_nl <= MUX_s_1_2_2(or_689_nl, or_687_nl, fsm_output(0));
  or_690_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_571_nl;
  mux_573_nl <= MUX_s_1_2_2(nand_46_nl, or_690_nl, fsm_output(7));
  or_683_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_682_nl <= CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  mux_570_nl <= MUX_s_1_2_2(or_683_nl, or_682_nl, fsm_output(0));
  or_684_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_570_nl;
  mux_574_nl <= MUX_s_1_2_2(mux_573_nl, or_684_nl, fsm_output(4));
  nor_281_nl <= NOT((fsm_output(8)) OR mux_574_nl);
  nor_284_nl <= NOT((NOT((COMP_LOOP_acc_8_psp_sva(0)) AND CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  nor_285_nl <= NOT((NOT (operator_64_false_acc_cse_5_sva(2))) OR (operator_64_false_acc_cse_5_sva(0))
      OR nand_135_cse);
  mux_567_nl <= MUX_s_1_2_2(nor_284_nl, nor_285_nl, fsm_output(0));
  and_287_nl <= (fsm_output(6)) AND mux_567_nl;
  or_675_nl <= (operator_64_false_acc_cse_4_sva(0)) OR (NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))));
  or_674_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_566_nl <= MUX_s_1_2_2(or_675_nl, or_674_nl, fsm_output(0));
  nor_286_nl <= NOT((fsm_output(6)) OR mux_566_nl);
  mux_568_nl <= MUX_s_1_2_2(and_287_nl, nor_286_nl, fsm_output(3));
  and_286_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_568_nl;
  nor_287_nl <= NOT((NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"))
      AND (fsm_output(0)) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  nor_288_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (STAGE_VEC_LOOP_j_sva_9_0(0)) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_289_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_562_nl <= MUX_s_1_2_2(nor_288_nl, nor_289_nl, fsm_output(0));
  mux_563_nl <= MUX_s_1_2_2(nor_287_nl, mux_562_nl, fsm_output(6));
  and_288_nl <= (fsm_output(3)) AND mux_563_nl;
  or_667_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_666_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_561_nl <= MUX_s_1_2_2(or_667_nl, or_666_nl, fsm_output(0));
  nor_290_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_561_nl);
  mux_564_nl <= MUX_s_1_2_2(and_288_nl, nor_290_nl, fsm_output(7));
  nor_291_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)));
  mux_565_nl <= MUX_s_1_2_2(mux_564_nl, nor_291_nl, fsm_output(4));
  mux_569_nl <= MUX_s_1_2_2(and_286_nl, mux_565_nl, fsm_output(8));
  vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_281_nl, mux_569_nl,
      fsm_output(5));
  and_284_nl <= CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (fsm_output(8)) AND (fsm_output(6)) AND (fsm_output(4)) AND (fsm_output(3))
      AND (fsm_output(7)) AND (fsm_output(0));
  or_720_nl <= (NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (NOT (fsm_output(3))))) OR not_tmp_212;
  or_718_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (STAGE_VEC_LOOP_j_sva_9_0(0)) AND (NOT (fsm_output(3))))) OR not_tmp_212;
  mux_586_nl <= MUX_s_1_2_2(or_720_nl, or_718_nl, fsm_output(4));
  or_716_nl <= CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0));
  or_715_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0));
  mux_585_nl <= MUX_s_1_2_2(or_716_nl, or_715_nl, fsm_output(4));
  mux_587_nl <= MUX_s_1_2_2(mux_586_nl, mux_585_nl, fsm_output(6));
  nor_273_nl <= NOT((fsm_output(8)) OR mux_587_nl);
  mux_588_nl <= MUX_s_1_2_2(and_284_nl, nor_273_nl, fsm_output(1));
  or_713_nl <= (NOT (STAGE_VEC_LOOP_j_sva_9_0(2))) OR (fsm_output(6)) OR (fsm_output(4))
      OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0)));
  or_710_nl <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(0));
  or_709_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (fsm_output(3)) OR (NOT (fsm_output(7))) OR (fsm_output(0));
  mux_583_nl <= MUX_s_1_2_2(or_710_nl, or_709_nl, fsm_output(4));
  or_711_nl <= (fsm_output(6)) OR mux_583_nl;
  mux_584_nl <= MUX_s_1_2_2(or_713_nl, or_711_nl, fsm_output(8));
  nor_274_nl <= NOT((fsm_output(1)) OR mux_584_nl);
  mux_589_nl <= MUX_s_1_2_2(mux_588_nl, nor_274_nl, fsm_output(5));
  nand_109_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (fsm_output(6)) AND (NOT (fsm_output(4))) AND (fsm_output(3)) AND (fsm_output(7))
      AND (NOT (fsm_output(0))));
  or_706_nl <= (NOT (COMP_LOOP_acc_8_psp_sva(0))) OR (fsm_output(6)) OR (fsm_output(4))
      OR CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0)));
  mux_581_nl <= MUX_s_1_2_2(nand_109_nl, or_706_nl, fsm_output(8));
  nor_275_nl <= NOT((fsm_output(1)) OR mux_581_nl);
  nand_110_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(0))));
  or_702_nl <= (NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10")))) OR not_tmp_212;
  mux_579_nl <= MUX_s_1_2_2(nand_110_nl, or_702_nl, fsm_output(6));
  nor_276_nl <= NOT((fsm_output(8)) OR mux_579_nl);
  nor_277_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0)));
  nor_278_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(0)));
  mux_577_nl <= MUX_s_1_2_2(nor_277_nl, nor_278_nl, fsm_output(4));
  nor_279_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(0))));
  nor_280_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (fsm_output(3)) OR (fsm_output(7))
      OR (NOT (fsm_output(0))));
  mux_576_nl <= MUX_s_1_2_2(nor_279_nl, nor_280_nl, fsm_output(4));
  mux_578_nl <= MUX_s_1_2_2(mux_577_nl, mux_576_nl, fsm_output(6));
  and_285_nl <= (fsm_output(8)) AND mux_578_nl;
  mux_580_nl <= MUX_s_1_2_2(nor_276_nl, and_285_nl, fsm_output(1));
  mux_582_nl <= MUX_s_1_2_2(nor_275_nl, mux_580_nl, fsm_output(5));
  vec_rsc_0_7_i_wea_d_pff <= MUX_s_1_2_2(mux_589_nl, mux_582_nl, fsm_output(2));
  and_407_nl <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_279_nl <= COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm AND
      (fsm_output(1)) AND CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (NOT (fsm_output(2)));
  mux_602_nl <= MUX_s_1_2_2(and_407_nl, and_279_nl, fsm_output(0));
  nand_50_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND mux_602_nl);
  nand_178_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_7_psp_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (STAGE_VEC_LOOP_j_sva_9_0(0)) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")));
  nand_173_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")));
  mux_601_nl <= MUX_s_1_2_2(nand_178_nl, nand_173_nl, fsm_output(0));
  or_745_nl <= (fsm_output(3)) OR (fsm_output(6)) OR mux_601_nl;
  mux_603_nl <= MUX_s_1_2_2(nand_50_nl, or_745_nl, fsm_output(7));
  nand_99_nl <= NOT(CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")));
  nand_100_nl <= NOT(CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")));
  mux_600_nl <= MUX_s_1_2_2(nand_99_nl, nand_100_nl, fsm_output(0));
  or_739_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_600_nl;
  mux_604_nl <= MUX_s_1_2_2(mux_603_nl, or_739_nl, fsm_output(4));
  nor_264_nl <= NOT((fsm_output(8)) OR mux_604_nl);
  nor_266_nl <= NOT((NOT((COMP_LOOP_acc_8_psp_sva(0)) AND CONV_SL_1_1(STAGE_VEC_LOOP_j_sva_9_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  and_282_nl <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  mux_597_nl <= MUX_s_1_2_2(nor_266_nl, and_282_nl, fsm_output(0));
  and_281_nl <= (fsm_output(6)) AND mux_597_nl;
  nand_102_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  nand_166_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND operator_64_false_slc_operator_64_false_acc_1_60_itm AND CONV_SL_1_1(fsm_output(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("10")));
  mux_596_nl <= MUX_s_1_2_2(nand_102_nl, nand_166_nl, fsm_output(0));
  nor_267_nl <= NOT((fsm_output(6)) OR mux_596_nl);
  mux_598_nl <= MUX_s_1_2_2(and_281_nl, nor_267_nl, fsm_output(3));
  and_280_nl <= (fsm_output(4)) AND (fsm_output(7)) AND mux_598_nl;
  nor_268_nl <= NOT((NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (fsm_output(0)) AND COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm))
      OR nand_205_cse);
  nor_269_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_9_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (NOT (STAGE_VEC_LOOP_j_sva_9_0(0))) OR (NOT COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm)
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  nor_270_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  mux_592_nl <= MUX_s_1_2_2(nor_269_nl, nor_270_nl, fsm_output(0));
  mux_593_nl <= MUX_s_1_2_2(nor_268_nl, mux_592_nl, fsm_output(6));
  and_283_nl <= (fsm_output(3)) AND mux_593_nl;
  nand_105_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")));
  or_724_nl <= CONV_SL_1_1(COMP_LOOP_acc_cse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (NOT operator_64_false_slc_operator_64_false_acc_1_60_itm) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_591_nl <= MUX_s_1_2_2(nand_105_nl, or_724_nl, fsm_output(0));
  nor_271_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR mux_591_nl);
  mux_594_nl <= MUX_s_1_2_2(and_283_nl, nor_271_nl, fsm_output(7));
  nor_272_nl <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("111"))
      OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)));
  mux_595_nl <= MUX_s_1_2_2(mux_594_nl, nor_272_nl, fsm_output(4));
  mux_599_nl <= MUX_s_1_2_2(and_280_nl, mux_595_nl, fsm_output(8));
  vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(nor_264_nl, mux_599_nl,
      fsm_output(5));
  or_tmp_984 <= (fsm_output(1)) OR (fsm_output(7)) OR (NOT (fsm_output(5)));
  mux_tmp_920 <= MUX_s_1_2_2(nand_86_cse, or_tmp_984, fsm_output(4));
  or_tmp_988 <= (NOT (fsm_output(1))) OR (NOT (fsm_output(7))) OR (fsm_output(5));
  and_dcpl_222 <= (NOT (fsm_output(7))) AND (NOT (fsm_output(6))) AND (fsm_output(0))
      AND (NOT((fsm_output(1)) OR (fsm_output(3)))) AND (fsm_output(2)) AND (NOT
      (fsm_output(4))) AND nor_607_cse;
  and_dcpl_237 <= (NOT (fsm_output(6))) AND (fsm_output(0)) AND (NOT (fsm_output(1)))
      AND and_dcpl_53 AND (fsm_output(7)) AND (NOT (fsm_output(4))) AND (NOT (fsm_output(8)))
      AND (fsm_output(5));
  and_dcpl_239 <= NOT((fsm_output(7)) OR (fsm_output(4)));
  and_dcpl_240 <= and_dcpl_239 AND (NOT (fsm_output(8))) AND (fsm_output(5));
  and_dcpl_241 <= (fsm_output(3)) AND (NOT (fsm_output(6)));
  and_dcpl_245 <= and_378_cse AND (fsm_output(2)) AND and_dcpl_241 AND and_dcpl_240;
  and_dcpl_246 <= (fsm_output(3)) AND (fsm_output(6));
  and_dcpl_250 <= nor_603_cse AND (NOT (fsm_output(2))) AND and_dcpl_246 AND and_dcpl_240;
  and_dcpl_254 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_255 <= and_dcpl_254 AND (NOT (fsm_output(2)));
  and_dcpl_257 <= and_dcpl_255 AND and_dcpl_246 AND nor_tmp_169 AND nor_607_cse;
  and_dcpl_258 <= (fsm_output(8)) AND (NOT (fsm_output(5)));
  and_dcpl_259 <= (NOT (fsm_output(7))) AND (fsm_output(4));
  and_dcpl_261 <= NOT((fsm_output(3)) OR (fsm_output(6)));
  and_dcpl_262 <= and_378_cse AND (NOT (fsm_output(2)));
  and_dcpl_264 <= and_dcpl_262 AND and_dcpl_261 AND and_dcpl_259 AND and_dcpl_258;
  and_dcpl_266 <= nor_603_cse AND (fsm_output(2));
  and_dcpl_267 <= and_dcpl_266 AND and_dcpl_246;
  and_dcpl_268 <= and_dcpl_267 AND and_dcpl_239 AND and_dcpl_258;
  and_dcpl_269 <= and_dcpl_259 AND nor_607_cse;
  and_dcpl_271 <= and_dcpl_255 AND and_dcpl_261 AND and_dcpl_269;
  and_dcpl_272 <= nor_tmp_169 AND and_dcpl_258;
  and_dcpl_274 <= and_dcpl_262 AND and_dcpl_246 AND and_dcpl_272;
  or_1107_nl <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (NOT((fsm_output(8))
      AND (fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(4))));
  nor_558_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(1)) OR (NOT (fsm_output(4))));
  nor_559_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(1))) OR (fsm_output(4)));
  mux_962_nl <= MUX_s_1_2_2(nor_558_nl, nor_559_nl, fsm_output(8));
  nand_182_nl <= NOT((fsm_output(2)) AND mux_962_nl);
  or_1102_nl <= (fsm_output(2)) OR (fsm_output(8)) OR (fsm_output(7)) OR (NOT (fsm_output(1)))
      OR (fsm_output(4));
  mux_963_nl <= MUX_s_1_2_2(nand_182_nl, or_1102_nl, fsm_output(5));
  mux_964_nl <= MUX_s_1_2_2(or_1107_nl, mux_963_nl, fsm_output(0));
  nor_557_nl <= NOT((fsm_output(3)) OR mux_964_nl);
  nor_560_nl <= NOT((fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT
      (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(4)));
  or_1099_nl <= (fsm_output(1)) OR (NOT (fsm_output(4)));
  or_1098_nl <= (NOT (fsm_output(1))) OR (fsm_output(4));
  mux_959_nl <= MUX_s_1_2_2(or_1099_nl, or_1098_nl, fsm_output(7));
  nor_561_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(8)) OR
      mux_959_nl);
  nor_562_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(2)) OR (NOT (fsm_output(8)))
      OR (fsm_output(7)) OR (fsm_output(1)) OR (NOT (fsm_output(4))));
  mux_960_nl <= MUX_s_1_2_2(nor_561_nl, nor_562_nl, fsm_output(0));
  mux_961_nl <= MUX_s_1_2_2(nor_560_nl, mux_960_nl, fsm_output(3));
  mux_965_cse <= MUX_s_1_2_2(nor_557_nl, mux_961_nl, fsm_output(6));
  and_dcpl_275 <= and_dcpl_267 AND and_dcpl_272;
  and_dcpl_276 <= and_dcpl_239 AND nor_607_cse;
  and_dcpl_278 <= and_dcpl_266 AND and_dcpl_261 AND and_dcpl_276;
  and_dcpl_279 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_282 <= and_dcpl_279 AND (fsm_output(2)) AND and_dcpl_261 AND and_dcpl_276;
  and_dcpl_285 <= and_dcpl_279 AND (NOT (fsm_output(2))) AND and_dcpl_261 AND and_dcpl_269;
  and_dcpl_290 <= and_dcpl_254 AND (fsm_output(2)) AND and_dcpl_241 AND nor_tmp_169
      AND (fsm_output(8)) AND (fsm_output(5));
  and_dcpl_297 <= nor_263_cse AND (fsm_output(0)) AND and_dcpl_261;
  and_dcpl_298 <= and_dcpl_297 AND and_dcpl_276;
  and_dcpl_299 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_300 <= and_dcpl_299 AND (fsm_output(0));
  and_dcpl_302 <= and_dcpl_300 AND and_dcpl_261 AND and_dcpl_276;
  and_503_cse <= and_dcpl_299 AND (NOT (fsm_output(0))) AND and_dcpl_261 AND and_dcpl_259
      AND nor_607_cse;
  not_tmp_465 <= NOT((fsm_output(4)) AND (fsm_output(1)));
  and_615_nl <= (fsm_output(3)) AND (fsm_output(7)) AND (fsm_output(8)) AND (fsm_output(5))
      AND (fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(1));
  or_1131_nl <= (fsm_output(8)) OR (fsm_output(5)) OR (fsm_output(2)) OR not_tmp_465;
  mux_976_nl <= MUX_s_1_2_2(mux_645_cse, or_1131_nl, fsm_output(7));
  and_616_nl <= (fsm_output(3)) AND (NOT mux_976_nl);
  mux_977_nl <= MUX_s_1_2_2(and_615_nl, and_616_nl, fsm_output(6));
  or_1128_nl <= (NOT (fsm_output(8))) OR (fsm_output(5)) OR (fsm_output(2)) OR not_tmp_465;
  mux_974_nl <= MUX_s_1_2_2(or_1128_nl, mux_645_cse, fsm_output(7));
  or_1124_nl <= (fsm_output(7)) OR (fsm_output(8)) OR (NOT (fsm_output(5))) OR (NOT
      (fsm_output(2))) OR (fsm_output(4)) OR (NOT (fsm_output(1)));
  mux_975_nl <= MUX_s_1_2_2(mux_974_nl, or_1124_nl, fsm_output(3));
  nor_550_nl <= NOT((fsm_output(6)) OR mux_975_nl);
  not_tmp_468 <= MUX_s_1_2_2(mux_977_nl, nor_550_nl, fsm_output(0));
  and_dcpl_310 <= and_dcpl_300 AND and_dcpl_246 AND and_dcpl_276;
  and_dcpl_311 <= (fsm_output(7)) AND (NOT (fsm_output(4)));
  and_512_cse <= and_257_cse AND (NOT (fsm_output(0))) AND and_dcpl_261 AND and_dcpl_311
      AND nor_607_cse;
  and_dcpl_319 <= (fsm_output(7)) AND (fsm_output(4)) AND (NOT (fsm_output(8))) AND
      (fsm_output(5));
  and_519_cse <= and_257_cse AND (fsm_output(0)) AND (fsm_output(3)) AND (NOT (fsm_output(6)))
      AND and_dcpl_319;
  and_522_cse <= nor_263_cse AND (NOT (fsm_output(0))) AND and_dcpl_246 AND and_dcpl_319;
  and_dcpl_327 <= (fsm_output(8)) AND (fsm_output(5));
  and_dcpl_329 <= and_dcpl_297 AND and_dcpl_259 AND and_dcpl_327;
  and_dcpl_331 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_530_cse <= and_dcpl_331 AND (NOT (fsm_output(0))) AND and_dcpl_246 AND and_dcpl_239
      AND and_dcpl_327;
  and_534_cse <= and_dcpl_331 AND (fsm_output(0)) AND and_dcpl_261 AND and_dcpl_311
      AND and_dcpl_327;
  and_dcpl_346 <= and_dcpl_254 AND (NOT (fsm_output(2))) AND and_dcpl_261 AND (NOT
      (fsm_output(7))) AND (fsm_output(4)) AND nor_607_cse;
  and_dcpl_353 <= and_dcpl_279 AND (fsm_output(2)) AND and_dcpl_261 AND (fsm_output(7))
      AND (NOT (fsm_output(4))) AND (fsm_output(8)) AND (NOT (fsm_output(5)));
  and_dcpl_358 <= and_dcpl_279 AND (NOT (fsm_output(2))) AND and_dcpl_261 AND (NOT
      (fsm_output(7))) AND (NOT (fsm_output(4))) AND nor_607_cse;
  and_dcpl_365 <= and_dcpl_254 AND CONV_SL_1_1(fsm_output(8 DOWNTO 2)=STD_LOGIC_VECTOR'("1101111"));
  and_dcpl_379 <= and_dcpl_299 AND (fsm_output(0)) AND and_dcpl_246 AND and_dcpl_239
      AND nor_607_cse;
  and_dcpl_401 <= nor_263_cse AND (fsm_output(0)) AND and_dcpl_261 AND and_dcpl_259
      AND and_dcpl_327;
  nor_tmp_234 <= or_1027_cse AND (fsm_output(7));
  nor_618_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(7)));
  mux_982_nl <= MUX_s_1_2_2((fsm_output(7)), nor_618_nl, fsm_output(1));
  nand_tmp_75 <= NOT((fsm_output(4)) AND mux_982_nl);
  mux_tmp_958 <= MUX_s_1_2_2((NOT nor_tmp_169), or_tmp_722, fsm_output(8));
  or_tmp_1051 <= and_378_cse OR (fsm_output(7));
  mux_tmp_962 <= MUX_s_1_2_2((NOT or_tmp_722), nor_tmp_169, fsm_output(8));
  mux_991_nl <= MUX_s_1_2_2(or_tmp_720, (fsm_output(7)), fsm_output(1));
  or_tmp_1054 <= (fsm_output(4)) OR mux_991_nl;
  nor_tmp_237 <= (fsm_output(4)) AND (fsm_output(8)) AND (fsm_output(5));
  operator_64_false_or_4_itm <= and_dcpl_245 OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264
      OR and_dcpl_268 OR and_dcpl_285 OR and_dcpl_290;
  operator_64_false_or_9_itm <= mux_965_cse OR and_dcpl_282;
  operator_64_false_operator_64_false_or_1_cse <= (NOT(and_dcpl_245 OR and_dcpl_250
      OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_268 OR and_dcpl_271 OR and_dcpl_274
      OR mux_965_cse OR and_dcpl_278 OR and_dcpl_282 OR and_dcpl_285 OR and_dcpl_290))
      OR and_dcpl_275;
  operator_64_false_1_operator_64_false_1_or_cse <= (NOT(and_dcpl_346 OR and_dcpl_365))
      OR and_dcpl_353 OR and_dcpl_358;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_tmp_326 = '1' ) THEN
        p_sva <= p_rsci_idat;
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_7_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        COMP_LOOP_COMP_LOOP_nor_1_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_9_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_12_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_13_itm <= '0';
      ELSE
        reg_vec_rsc_triosy_0_7_obj_ld_cse <= and_dcpl_123 AND and_dcpl_3 AND and_dcpl_1
            AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")) AND (z_out_2(4));
        reg_ensig_cgo_cse <= mux_644_rmff;
        COMP_LOOP_COMP_LOOP_nor_1_itm <= NOT(CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_9_itm <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_12_itm <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_13_itm <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      reg_COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
      modExp_dev_while_rem_cmp_a <= MUX_v_64_2_2(COMP_LOOP_1_modExp_dev_1_while_mul_mut,
          z_out, mux_695_nl);
      STAGE_MAIN_LOOP_div_cmp_a <= MUX_v_64_2_2(z_out_3, COMP_LOOP_1_modExp_dev_1_while_mul_mut,
          and_dcpl_160);
      STAGE_MAIN_LOOP_div_cmp_b <= MUX_v_10_2_2(STAGE_MAIN_LOOP_lshift_psp_1_sva_mx0w0,
          STAGE_MAIN_LOOP_lshift_psp_1_sva, and_dcpl_160);
      modExp_dev_exp_1_sva_2_0 <= MUX_v_3_2_2(COMP_LOOP_and_104_nl, STD_LOGIC_VECTOR'("111"),
          and_244_nl);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_tmp_326 OR and_dcpl_162) = '1' ) THEN
        STAGE_MAIN_LOOP_acc_1_psp_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"),
            (z_out_4(3 DOWNTO 0)), and_dcpl_162);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_255_nl, and_tmp_14, fsm_output(8))) = '1' ) THEN
        STAGE_MAIN_LOOP_lshift_psp_1_sva <= STAGE_MAIN_LOOP_lshift_psp_1_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_162 OR and_dcpl_155 OR not_tmp_324 OR (NOT mux_702_itm) OR COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c4
          OR COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c5) = '1' ) THEN
        COMP_LOOP_1_modExp_dev_1_while_mul_mut <= MUX1HOT_v_64_4_2(z_out_3, z_out,
            STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modExp_dev_while_rem_cmp_z, STD_LOGIC_VECTOR'( and_dcpl_162 & operator_64_false_or_2_nl
            & not_tmp_324 & COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_VEC_LOOP_j_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( ((NOT((fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(5)) OR (NOT((fsm_output(2))
          XOR (fsm_output(4)))) OR (NOT and_dcpl_51))) OR STAGE_VEC_LOOP_j_sva_9_0_mx0c1)
          = '1' ) THEN
        STAGE_VEC_LOOP_j_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out_2(9 DOWNTO 0)), STAGE_VEC_LOOP_j_sva_9_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_752_nl OR and_186_rgt) = '1' ) THEN
        modExp_dev_result_sva <= MUX_v_64_2_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modExp_dev_while_rem_cmp_z, and_186_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_787_nl = '0' ) THEN
        tmp_10_lpi_4_dfm <= MUX1HOT_v_64_10_2(STAGE_MAIN_LOOP_div_cmp_z, z_out_3,
            vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d,
            vec_rsc_0_4_i_qa_d, vec_rsc_0_5_i_qa_d, vec_rsc_0_6_i_qa_d, vec_rsc_0_7_i_qa_d,
            STD_LOGIC_VECTOR'( and_187_nl & and_dcpl_155 & COMP_LOOP_or_3_nl & COMP_LOOP_or_4_nl
            & COMP_LOOP_or_5_nl & COMP_LOOP_or_6_nl & COMP_LOOP_or_7_nl & COMP_LOOP_or_8_nl
            & COMP_LOOP_or_9_nl & COMP_LOOP_or_10_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm <= '0';
      ELSIF ( (and_dcpl_155 OR and_dcpl_56 OR (NOT mux_702_itm) OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c3
          OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c4
          OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c5
          OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c6
          OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c7
          OR and_dcpl_192) = '1' ) THEN
        COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm <= MUX1HOT_s_1_4_2((NOT
            (z_out_2(64))), COMP_LOOP_COMP_LOOP_and_11_nl, (z_out_2(63)), (NOT (z_out_2(63))),
            STD_LOGIC_VECTOR'( modExp_dev_while_or_nl & and_dcpl_56 & modExp_dev_while_or_1_nl
            & and_dcpl_192));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_979_nl AND (NOT (fsm_output(6))) AND (fsm_output(4))) = '1' ) THEN
        COMP_LOOP_k_9_3_sva_5_0 <= MUX_v_6_2_2(STD_LOGIC_VECTOR'("000000"), (z_out_4(5
            DOWNTO 0)), nand_192_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(or_tmp_1 OR (NOT (fsm_output(1))) OR (fsm_output(5)) OR (NOT (fsm_output(4)))
          OR (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8))))
          = '1' ) THEN
        operator_64_false_acc_cse_1_sva <= COMP_LOOP_1_operator_64_false_acc_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_1001_nl = '0' ) THEN
        COMP_LOOP_acc_psp_sva_6 <= COMP_LOOP_COMP_LOOP_mux_rgt(6);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_1013_nl, mux_1006_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_acc_psp_sva_5_0 <= COMP_LOOP_COMP_LOOP_mux_rgt(5 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_86_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_145_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_30_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_60_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_32_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_33_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_34_itm <= '0';
        COMP_LOOP_COMP_LOOP_nor_4_itm <= '0';
      ELSIF ( mux_864_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_and_86_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_4_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_145_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_6_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_30_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_60_itm <= (COMP_LOOP_acc_7_psp_sva_1(1)) AND (STAGE_VEC_LOOP_j_sva_9_0(0))
            AND (NOT (COMP_LOOP_acc_7_psp_sva_1(0)));
        COMP_LOOP_COMP_LOOP_and_32_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_COMP_LOOP_and_33_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_34_itm <= CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva_1(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
        COMP_LOOP_COMP_LOOP_nor_4_itm <= NOT(CONV_SL_1_1(COMP_LOOP_acc_cse_2_sva_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_cse_6_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_377, or_959_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_cse_6_sva <= COMP_LOOP_acc_cse_6_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_cse_4_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_866_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        COMP_LOOP_acc_cse_4_sva <= COMP_LOOP_acc_cse_4_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_7_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( ((NOT(or_tmp_921 XOR (fsm_output(7)))) OR (fsm_output(8))) = '1' )
          THEN
        COMP_LOOP_acc_7_psp_sva <= COMP_LOOP_acc_7_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_cse_2_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_868_nl AND nor_449_cse)) = '1' ) THEN
        COMP_LOOP_acc_cse_2_sva <= COMP_LOOP_acc_cse_2_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_2_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_870_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        operator_64_false_acc_cse_2_sva <= operator_64_false_acc_cse_2_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_5_itm <= '0';
      ELSIF ( and_dcpl_198 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_5_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_2_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_37_itm <= '0';
      ELSIF ( and_dcpl_198 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_37_itm <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_39_itm <= '0';
      ELSIF ( and_dcpl_198 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_39_itm <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_40_itm <= '0';
      ELSIF ( and_dcpl_198 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_40_itm <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_41_itm <= '0';
      ELSIF ( and_dcpl_198 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_41_itm <= CONV_SL_1_1(operator_64_false_acc_cse_2_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_3_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_873_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        operator_64_false_acc_cse_3_sva <= operator_64_false_acc_cse_3_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_9_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_9_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_3_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_65_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_65_itm <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_67_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_67_itm <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_68_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_68_itm <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_69_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_69_itm <= CONV_SL_1_1(operator_64_false_acc_cse_3_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_4_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_876_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        operator_64_false_acc_cse_4_sva <= operator_64_false_acc_cse_4_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_13_itm <= '0';
      ELSIF ( and_dcpl_202 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_13_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_4_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_93_itm <= '0';
      ELSIF ( and_dcpl_202 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_93_itm <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_95_itm <= '0';
      ELSIF ( and_dcpl_202 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_95_itm <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_96_itm <= '0';
      ELSIF ( and_dcpl_202 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_96_itm <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_97_itm <= '0';
      ELSIF ( and_dcpl_202 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_97_itm <= CONV_SL_1_1(operator_64_false_acc_cse_4_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_8_psp_sva <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_377, or_975_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_8_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0(9
            DOWNTO 2)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0
            & '1'), 7), 8), 8));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_5_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_377, or_977_nl, fsm_output(8))) = '1' ) THEN
        operator_64_false_acc_cse_5_sva <= operator_64_false_acc_cse_5_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_17_itm <= '0';
      ELSIF ( and_dcpl_203 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_17_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_5_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_121_itm <= '0';
      ELSIF ( and_dcpl_203 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_121_itm <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_123_itm <= '0';
      ELSIF ( and_dcpl_203 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_123_itm <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_124_itm <= '0';
      ELSIF ( and_dcpl_203 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_124_itm <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_125_itm <= '0';
      ELSIF ( and_dcpl_203 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_125_itm <= CONV_SL_1_1(operator_64_false_acc_cse_5_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_6_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_890_nl, (fsm_output(8)), fsm_output(7))) = '1' ) THEN
        operator_64_false_acc_cse_6_sva <= operator_64_false_acc_cse_6_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_21_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_149_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_151_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_152_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_153_itm <= '0';
      ELSIF ( mux_893_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_21_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_6_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_149_itm <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_151_itm <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_COMP_LOOP_and_152_itm <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_153_itm <= CONV_SL_1_1(operator_64_false_acc_cse_6_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_9_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_896_nl, (fsm_output(8)), fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_9_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_VEC_LOOP_j_sva_9_0(9
            DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_3_sva_5_0
            & STD_LOGIC_VECTOR'( "11")), 8), 9), 9));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_7_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_377, and_228_nl, fsm_output(8))) = '1' ) THEN
        operator_64_false_acc_cse_7_sva <= operator_64_false_acc_cse_7_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_25_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_177_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_179_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_180_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_181_itm <= '0';
      ELSIF ( mux_900_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_25_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_7_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_177_itm <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_179_itm <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_COMP_LOOP_and_180_itm <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_181_itm <= CONV_SL_1_1(operator_64_false_acc_cse_7_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_cse_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_377, and_230_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_cse_sva <= COMP_LOOP_slc_acc_12_1_slc(9 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_cse_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( mux_905_nl = '0' ) THEN
        operator_64_false_acc_cse_sva <= operator_64_false_acc_cse_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_29_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_205_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_207_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_208_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_209_itm <= '0';
      ELSIF ( mux_908_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_29_itm <= NOT(CONV_SL_1_1(operator_64_false_acc_cse_sva_mx0w0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_205_itm <= CONV_SL_1_1(operator_64_false_acc_cse_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_207_itm <= CONV_SL_1_1(operator_64_false_acc_cse_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_COMP_LOOP_and_208_itm <= CONV_SL_1_1(operator_64_false_acc_cse_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_209_itm <= CONV_SL_1_1(operator_64_false_acc_cse_sva_mx0w0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_56 OR operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c1
          OR operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c2) = '1' )
          THEN
        operator_64_false_slc_operator_64_false_acc_1_60_itm <= MUX1HOT_s_1_3_2((z_out_4(6)),
            (COMP_LOOP_slc_acc_12_1_slc(11)), (z_out_4(60)), STD_LOGIC_VECTOR'( and_dcpl_56
            & operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c1 & operator_64_false_slc_operator_64_false_acc_1_60_itm_mx0c2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (tmp_1_lpi_4_dfm_mx0c0 OR and_dcpl_132 OR and_dcpl_136 OR and_dcpl_139
          OR and_dcpl_143 OR and_dcpl_146 OR and_dcpl_150 OR and_dcpl_153) = '1'
          ) THEN
        tmp_1_lpi_4_dfm <= MUX1HOT_v_64_8_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
            vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, vec_rsc_0_4_i_qa_d, vec_rsc_0_5_i_qa_d,
            vec_rsc_0_6_i_qa_d, vec_rsc_0_7_i_qa_d, STD_LOGIC_VECTOR'( COMP_LOOP_or_11_nl
            & COMP_LOOP_or_12_nl & COMP_LOOP_or_13_nl & COMP_LOOP_or_14_nl & COMP_LOOP_or_15_nl
            & COMP_LOOP_or_16_nl & COMP_LOOP_or_17_nl & COMP_LOOP_or_18_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_1033_nl, mux_1021_nl, fsm_output(5))) = '1' ) THEN
        modExp_dev_exp_1_sva_63_9 <= MUX_v_55_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000"),
            (z_out_3(63 DOWNTO 9)), not_2187_nl);
      END IF;
    END IF;
  END PROCESS;
  mux_692_nl <= MUX_s_1_2_2((NOT or_tmp_779), mux_tmp_650, fsm_output(5));
  or_816_nl <= (fsm_output(4)) OR mux_692_nl;
  or_815_nl <= (NOT (fsm_output(5))) OR (fsm_output(3));
  mux_690_nl <= MUX_s_1_2_2(or_815_nl, or_tmp_775, fsm_output(4));
  nand_58_nl <= NOT((fsm_output(5)) AND (NOT or_tmp_779));
  or_814_nl <= (fsm_output(5)) OR (NOT nor_tmp_3);
  mux_689_nl <= MUX_s_1_2_2(nand_58_nl, or_814_nl, fsm_output(4));
  mux_691_nl <= MUX_s_1_2_2(mux_690_nl, mux_689_nl, fsm_output(0));
  mux_693_nl <= MUX_s_1_2_2(or_816_nl, mux_691_nl, fsm_output(6));
  or_813_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")) OR (NOT
      or_tmp_779);
  or_810_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")) OR nor_tmp_2;
  or_807_nl <= (fsm_output(5)) OR (fsm_output(3));
  mux_686_nl <= MUX_s_1_2_2(or_tmp_775, or_807_nl, fsm_output(4));
  mux_687_nl <= MUX_s_1_2_2(or_810_nl, mux_686_nl, fsm_output(0));
  mux_688_nl <= MUX_s_1_2_2(or_813_nl, mux_687_nl, fsm_output(6));
  mux_694_nl <= MUX_s_1_2_2(mux_693_nl, mux_688_nl, fsm_output(7));
  or_806_nl <= (fsm_output(5)) OR (NOT (fsm_output(3)));
  mux_683_nl <= MUX_s_1_2_2(or_806_nl, or_tmp_772, fsm_output(4));
  nor_258_nl <= NOT((fsm_output(5)) OR mux_tmp_648);
  mux_681_nl <= MUX_s_1_2_2(nor_258_nl, and_tmp_13, fsm_output(4));
  mux_680_nl <= MUX_s_1_2_2((NOT or_tmp_770), and_tmp_13, fsm_output(4));
  mux_682_nl <= MUX_s_1_2_2(mux_681_nl, mux_680_nl, fsm_output(0));
  mux_684_nl <= MUX_s_1_2_2(mux_683_nl, (NOT mux_682_nl), fsm_output(6));
  nand_57_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_650));
  mux_678_nl <= MUX_s_1_2_2(or_tmp_767, nand_57_nl, fsm_output(4));
  nand_56_nl <= NOT((fsm_output(5)) AND (NOT mux_tmp_648));
  mux_676_nl <= MUX_s_1_2_2(or_tmp_767, nand_56_nl, fsm_output(4));
  mux_679_nl <= MUX_s_1_2_2(mux_678_nl, mux_676_nl, fsm_output(0));
  or_801_nl <= (fsm_output(6)) OR mux_679_nl;
  mux_685_nl <= MUX_s_1_2_2(mux_684_nl, or_801_nl, fsm_output(7));
  mux_695_nl <= MUX_s_1_2_2(mux_694_nl, mux_685_nl, fsm_output(8));
  mux_942_nl <= MUX_s_1_2_2(or_tmp_976, mux_tmp_891, fsm_output(5));
  or_1024_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  mux_941_nl <= MUX_s_1_2_2(mux_tmp_893, or_1024_nl, fsm_output(5));
  mux_943_nl <= MUX_s_1_2_2(mux_942_nl, mux_941_nl, or_1027_cse);
  mux_940_nl <= MUX_s_1_2_2(or_tmp_973, mux_tmp_903, and_378_cse);
  mux_944_nl <= MUX_s_1_2_2(mux_943_nl, mux_940_nl, fsm_output(4));
  mux_938_nl <= MUX_s_1_2_2(or_tmp_970, or_1035_cse, fsm_output(5));
  mux_937_nl <= MUX_s_1_2_2(mux_tmp_902, mux_tmp_895, fsm_output(1));
  mux_939_nl <= MUX_s_1_2_2(mux_938_nl, mux_937_nl, fsm_output(4));
  mux_945_nl <= MUX_s_1_2_2(mux_944_nl, mux_939_nl, fsm_output(3));
  mux_933_nl <= MUX_s_1_2_2(mux_tmp_893, or_tmp_152, fsm_output(5));
  mux_932_nl <= MUX_s_1_2_2(or_tmp_967, or_tmp_152, fsm_output(5));
  mux_934_nl <= MUX_s_1_2_2(mux_933_nl, mux_932_nl, or_1027_cse);
  mux_931_nl <= MUX_s_1_2_2(mux_tmp_903, mux_tmp_902, fsm_output(1));
  mux_935_nl <= MUX_s_1_2_2(mux_934_nl, mux_931_nl, fsm_output(4));
  or_1018_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_926_nl <= MUX_s_1_2_2(or_1018_nl, or_1035_cse, fsm_output(5));
  mux_927_nl <= MUX_s_1_2_2(mux_926_nl, or_tmp_973, and_378_cse);
  mux_921_nl <= MUX_s_1_2_2(mux_tmp_891, mux_tmp_893, fsm_output(5));
  mux_923_nl <= MUX_s_1_2_2(mux_tmp_895, mux_921_nl, fsm_output(0));
  mux_919_nl <= MUX_s_1_2_2(mux_tmp_891, or_tmp_967, fsm_output(5));
  mux_924_nl <= MUX_s_1_2_2(mux_923_nl, mux_919_nl, fsm_output(1));
  mux_928_nl <= MUX_s_1_2_2(mux_927_nl, mux_924_nl, fsm_output(4));
  mux_936_nl <= MUX_s_1_2_2(mux_935_nl, mux_928_nl, fsm_output(3));
  mux_946_nl <= MUX_s_1_2_2(mux_945_nl, mux_936_nl, fsm_output(2));
  and_238_nl <= and_dcpl_168 AND and_dcpl_130;
  and_239_nl <= and_dcpl_127 AND and_dcpl_133;
  and_240_nl <= and_dcpl_131 AND and_dcpl_176;
  and_241_nl <= and_dcpl_135 AND and_dcpl_179;
  and_242_nl <= and_dcpl_138 AND and_dcpl_144;
  and_243_nl <= and_dcpl_142 AND and_dcpl_147;
  COMP_LOOP_mux1h_161_nl <= MUX1HOT_v_3_8_2((z_out_3(2 DOWNTO 0)), modExp_dev_exp_1_sva_2_0,
      STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'( "011"),
      STD_LOGIC_VECTOR'( "100"), STD_LOGIC_VECTOR'( "101"), STD_LOGIC_VECTOR'( "110"),
      STD_LOGIC_VECTOR'( (NOT mux_702_itm) & (NOT mux_946_nl) & and_238_nl & and_239_nl
      & and_240_nl & and_241_nl & and_242_nl & and_243_nl));
  nand_191_nl <= NOT(and_dcpl_152 AND and_dcpl_51);
  COMP_LOOP_and_104_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), COMP_LOOP_mux1h_161_nl,
      nand_191_nl);
  and_244_nl <= and_dcpl_145 AND and_dcpl_151;
  nor_255_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  operator_64_false_or_2_nl <= and_dcpl_155 OR COMP_LOOP_1_modExp_dev_1_while_mul_mut_mx0c5
      OR (NOT mux_702_itm);
  nor_243_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000")));
  mux_752_nl <= MUX_s_1_2_2(nor_243_nl, and_tmp_14, fsm_output(8));
  and_187_nl <= and_dcpl_154 AND and_dcpl_51;
  COMP_LOOP_or_3_nl <= (COMP_LOOP_COMP_LOOP_and_86_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_nor_4_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm
      AND and_200_m1c);
  COMP_LOOP_or_4_nl <= (COMP_LOOP_COMP_LOOP_and_145_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_86_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm
      AND and_200_m1c);
  COMP_LOOP_or_5_nl <= (COMP_LOOP_COMP_LOOP_and_30_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_145_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm
      AND and_200_m1c);
  COMP_LOOP_or_6_nl <= (COMP_LOOP_COMP_LOOP_and_60_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_30_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm
      AND and_200_m1c);
  COMP_LOOP_or_7_nl <= (COMP_LOOP_COMP_LOOP_and_32_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_60_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm
      AND and_200_m1c);
  COMP_LOOP_or_8_nl <= (COMP_LOOP_COMP_LOOP_and_33_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_32_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_34_itm
      AND and_200_m1c);
  COMP_LOOP_or_9_nl <= (COMP_LOOP_COMP_LOOP_and_34_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_33_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_nor_4_itm
      AND and_200_m1c);
  COMP_LOOP_or_10_nl <= (COMP_LOOP_COMP_LOOP_nor_4_itm AND and_dcpl_128) OR (COMP_LOOP_COMP_LOOP_and_34_itm
      AND and_188_m1c) OR (COMP_LOOP_COMP_LOOP_and_33_itm AND and_189_m1c) OR (COMP_LOOP_COMP_LOOP_and_32_itm
      AND and_190_m1c) OR (COMP_LOOP_COMP_LOOP_and_60_itm AND and_193_m1c) OR (COMP_LOOP_COMP_LOOP_and_30_itm
      AND and_195_m1c) OR (COMP_LOOP_COMP_LOOP_and_145_itm AND and_198_m1c) OR (COMP_LOOP_COMP_LOOP_and_86_itm
      AND and_200_m1c);
  nor_239_nl <= NOT((fsm_output(5)) OR or_tmp_779);
  or_900_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  mux_782_nl <= MUX_s_1_2_2(or_900_nl, or_tmp_1, fsm_output(1));
  or_901_nl <= (fsm_output(5)) OR (NOT mux_782_nl);
  mux_783_nl <= MUX_s_1_2_2(nor_239_nl, or_901_nl, fsm_output(4));
  mux_780_nl <= MUX_s_1_2_2((NOT or_tmp_779), nor_tmp, fsm_output(5));
  or_899_nl <= (fsm_output(5)) OR and_dcpl_53;
  mux_781_nl <= MUX_s_1_2_2(mux_780_nl, or_899_nl, fsm_output(4));
  mux_784_nl <= MUX_s_1_2_2(mux_783_nl, mux_781_nl, fsm_output(0));
  mux_48_nl <= MUX_s_1_2_2((NOT nor_tmp), (fsm_output(3)), fsm_output(5));
  mux_49_nl <= MUX_s_1_2_2(mux_48_nl, (fsm_output(5)), fsm_output(4));
  mux_46_nl <= MUX_s_1_2_2((NOT nor_tmp_3), (fsm_output(3)), fsm_output(5));
  mux_47_nl <= MUX_s_1_2_2(mux_46_nl, (fsm_output(5)), fsm_output(4));
  mux_50_nl <= MUX_s_1_2_2(mux_49_nl, mux_47_nl, fsm_output(0));
  mux_785_nl <= MUX_s_1_2_2(mux_784_nl, mux_50_nl, fsm_output(6));
  mux_771_nl <= MUX_s_1_2_2((NOT or_tmp_779), or_tmp, fsm_output(5));
  mux_772_nl <= MUX_s_1_2_2(mux_771_nl, (fsm_output(5)), fsm_output(4));
  nor_240_nl <= NOT((fsm_output(5)) OR (NOT or_tmp_779));
  mux_770_nl <= MUX_s_1_2_2(nor_240_nl, nand_tmp, fsm_output(4));
  mux_773_nl <= MUX_s_1_2_2((NOT mux_772_nl), mux_770_nl, fsm_output(0));
  mux_39_nl <= MUX_s_1_2_2((NOT nor_tmp_2), (fsm_output(3)), fsm_output(5));
  mux_40_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), mux_39_nl, fsm_output(4));
  mux_774_nl <= MUX_s_1_2_2(mux_773_nl, mux_40_nl, fsm_output(6));
  mux_786_nl <= MUX_s_1_2_2((NOT mux_785_nl), mux_774_nl, fsm_output(7));
  mux_764_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), mux_tmp_729, fsm_output(4));
  or_897_nl <= (fsm_output(5)) OR and_dcpl_114;
  mux_763_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), or_897_nl, fsm_output(4));
  mux_765_nl <= MUX_s_1_2_2(mux_764_nl, mux_763_nl, fsm_output(0));
  mux_32_nl <= MUX_s_1_2_2((NOT nor_tmp_3), nor_tmp_2, fsm_output(5));
  mux_33_nl <= MUX_s_1_2_2(mux_32_nl, (fsm_output(5)), fsm_output(4));
  mux_766_nl <= MUX_s_1_2_2(mux_765_nl, mux_33_nl, fsm_output(6));
  mux_758_nl <= MUX_s_1_2_2(or_tmp_779, (NOT or_tmp_1), fsm_output(5));
  mux_759_nl <= MUX_s_1_2_2(mux_758_nl, nand_tmp, fsm_output(4));
  mux_757_nl <= MUX_s_1_2_2((NOT mux_tmp_729), nand_tmp, fsm_output(4));
  mux_760_nl <= MUX_s_1_2_2(mux_759_nl, mux_757_nl, fsm_output(0));
  nor_241_nl <= NOT((fsm_output(6)) OR mux_760_nl);
  mux_767_nl <= MUX_s_1_2_2(mux_766_nl, nor_241_nl, fsm_output(7));
  mux_787_nl <= MUX_s_1_2_2(mux_786_nl, mux_767_nl, fsm_output(8));
  COMP_LOOP_COMP_LOOP_and_11_nl <= CONV_SL_1_1(COMP_LOOP_1_operator_64_false_acc_tmp(2
      DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
  modExp_dev_while_or_nl <= and_dcpl_155 OR (NOT mux_702_itm);
  modExp_dev_while_or_1_nl <= COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c3
      OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c4 OR
      COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c5 OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c6
      OR COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm_mx0c7;
  nand_192_nl <= NOT(and_dcpl_170 AND and_dcpl_58);
  nor_616_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(5)) OR (NOT
      (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(7)));
  nor_617_nl <= NOT((NOT((fsm_output(3)) AND (fsm_output(2)) AND (fsm_output(5))
      AND (NOT (fsm_output(0))))) OR nand_203_cse);
  mux_979_nl <= MUX_s_1_2_2(nor_616_nl, nor_617_nl, fsm_output(1));
  or_1146_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(0))
      OR (fsm_output(7));
  mux_996_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_tmp_1051, fsm_output(4));
  mux_997_nl <= MUX_s_1_2_2(or_1146_nl, mux_996_nl, fsm_output(8));
  mux_995_nl <= MUX_s_1_2_2((NOT nor_tmp_169), or_tmp_1054, fsm_output(8));
  mux_998_nl <= MUX_s_1_2_2(mux_997_nl, mux_995_nl, fsm_output(2));
  mux_999_nl <= MUX_s_1_2_2(mux_998_nl, mux_tmp_958, fsm_output(3));
  nand_201_nl <= NOT((fsm_output(4)) AND nor_tmp_234);
  mux_992_nl <= MUX_s_1_2_2(or_tmp_1054, nand_201_nl, fsm_output(8));
  mux_993_nl <= MUX_s_1_2_2(mux_992_nl, (NOT mux_tmp_962), fsm_output(2));
  or_1143_nl <= (fsm_output(4)) OR or_tmp_1051;
  mux_988_nl <= MUX_s_1_2_2(or_1143_nl, nand_tmp_75, fsm_output(8));
  mux_990_nl <= MUX_s_1_2_2((NOT mux_tmp_962), mux_988_nl, fsm_output(2));
  mux_994_nl <= MUX_s_1_2_2(mux_993_nl, mux_990_nl, fsm_output(3));
  mux_1000_nl <= MUX_s_1_2_2(mux_999_nl, mux_994_nl, fsm_output(5));
  mux_983_nl <= MUX_s_1_2_2(nand_tmp_75, or_tmp_722, fsm_output(8));
  mux_981_nl <= MUX_s_1_2_2((NOT nor_tmp_234), (fsm_output(7)), fsm_output(4));
  or_1139_nl <= (fsm_output(8)) OR mux_981_nl;
  mux_984_nl <= MUX_s_1_2_2(mux_983_nl, or_1139_nl, fsm_output(2));
  mux_986_nl <= MUX_s_1_2_2(mux_tmp_958, mux_984_nl, fsm_output(3));
  or_1136_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(4))) OR (fsm_output(7));
  mux_980_nl <= MUX_s_1_2_2(or_952_cse, or_1136_nl, fsm_output(3));
  mux_987_nl <= MUX_s_1_2_2(mux_986_nl, mux_980_nl, fsm_output(5));
  mux_1001_nl <= MUX_s_1_2_2(mux_1000_nl, mux_987_nl, fsm_output(6));
  nand_200_nl <= NOT((fsm_output(0)) AND (fsm_output(7)) AND (fsm_output(4)) AND
      (fsm_output(8)) AND (fsm_output(5)));
  or_1160_nl <= (NOT (fsm_output(7))) OR (NOT (fsm_output(4))) OR (fsm_output(8))
      OR (fsm_output(5));
  mux_1012_nl <= MUX_s_1_2_2(nand_200_nl, or_1160_nl, fsm_output(2));
  nor_605_nl <= NOT((fsm_output(3)) OR mux_1012_nl);
  nor_606_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(5))));
  mux_1007_nl <= MUX_s_1_2_2(nor_606_nl, nor_607_cse, fsm_output(4));
  mux_1008_nl <= MUX_s_1_2_2(mux_1007_nl, nor_tmp_237, fsm_output(7));
  nor_608_nl <= NOT((fsm_output(7)) OR (fsm_output(4)) OR (fsm_output(8)) OR (NOT
      (fsm_output(5))));
  mux_1009_nl <= MUX_s_1_2_2(mux_1008_nl, nor_608_nl, fsm_output(0));
  nor_609_nl <= NOT((fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))) OR
      (fsm_output(5)));
  mux_1010_nl <= MUX_s_1_2_2(mux_1009_nl, nor_609_nl, fsm_output(2));
  and_627_nl <= (fsm_output(2)) AND (fsm_output(0)) AND (NOT (fsm_output(7))) AND
      nor_tmp_237;
  mux_1011_nl <= MUX_s_1_2_2(mux_1010_nl, and_627_nl, fsm_output(3));
  mux_1013_nl <= MUX_s_1_2_2(nor_605_nl, mux_1011_nl, fsm_output(1));
  nor_610_nl <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(4))
      OR (NOT (fsm_output(8))) OR (fsm_output(5)));
  nor_611_nl <= NOT((fsm_output(7)) OR (NOT nor_tmp_237));
  nor_612_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)) OR
      (fsm_output(5)));
  nor_613_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(4)) OR (fsm_output(8)) OR
      (fsm_output(5)));
  mux_1003_nl <= MUX_s_1_2_2(nor_612_nl, nor_613_nl, fsm_output(0));
  mux_1004_nl <= MUX_s_1_2_2(nor_611_nl, mux_1003_nl, fsm_output(2));
  mux_1005_nl <= MUX_s_1_2_2(nor_610_nl, mux_1004_nl, fsm_output(3));
  nor_614_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(7)) OR (NOT (fsm_output(4)))
      OR (fsm_output(8)) OR (fsm_output(5)));
  nor_615_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR
      (fsm_output(8)) OR (fsm_output(5)));
  mux_1002_nl <= MUX_s_1_2_2(nor_614_nl, nor_615_nl, fsm_output(2));
  and_628_nl <= (fsm_output(3)) AND mux_1002_nl;
  mux_1006_nl <= MUX_s_1_2_2(mux_1005_nl, and_628_nl, fsm_output(1));
  or_959_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR and_dcpl_138;
  nand_168_nl <= NOT((fsm_output(6)) AND or_tmp_920);
  mux_866_nl <= MUX_s_1_2_2(or_tmp_921, nand_168_nl, fsm_output(7));
  mux_867_nl <= MUX_s_1_2_2((fsm_output(5)), or_tmp_770, fsm_output(4));
  mux_868_nl <= MUX_s_1_2_2(mux_tmp_836, (NOT mux_867_nl), fsm_output(6));
  or_963_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000"));
  mux_869_nl <= MUX_s_1_2_2(or_tmp_923, or_963_nl, fsm_output(0));
  nor_234_nl <= NOT((fsm_output(6)) OR mux_869_nl);
  mux_870_nl <= MUX_s_1_2_2(or_tmp_921, nor_234_nl, fsm_output(7));
  nor_233_nl <= NOT((fsm_output(6)) OR (CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"))));
  mux_873_nl <= MUX_s_1_2_2(or_tmp_921, nor_233_nl, fsm_output(7));
  and_222_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND or_tmp_779;
  and_221_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND or_tmp_1;
  mux_875_nl <= MUX_s_1_2_2(and_222_nl, and_221_nl, fsm_output(0));
  nand_76_nl <= NOT((fsm_output(6)) AND mux_875_nl);
  mux_876_nl <= MUX_s_1_2_2(or_tmp_921, nand_76_nl, fsm_output(7));
  or_974_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR or_tmp_779;
  mux_878_nl <= MUX_s_1_2_2(or_974_nl, or_tmp_923, fsm_output(0));
  or_975_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_878_nl;
  and_254_nl <= (fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(3));
  mux_880_nl <= MUX_s_1_2_2(and_254_nl, (fsm_output(5)), fsm_output(4));
  or_977_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_880_nl;
  mux_887_nl <= MUX_s_1_2_2(mux_tmp_856, and_250_cse, fsm_output(2));
  mux_888_nl <= MUX_s_1_2_2(nor_227_cse, mux_887_nl, fsm_output(4));
  mux_885_nl <= MUX_s_1_2_2(nor_227_cse, mux_tmp_856, fsm_output(2));
  mux_886_nl <= MUX_s_1_2_2(mux_885_nl, and_250_cse, fsm_output(4));
  mux_889_nl <= MUX_s_1_2_2(mux_888_nl, mux_886_nl, and_378_cse);
  mux_884_nl <= MUX_s_1_2_2(mux_tmp_856, and_250_cse, fsm_output(4));
  mux_890_nl <= MUX_s_1_2_2(mux_889_nl, mux_884_nl, fsm_output(3));
  nor_228_nl <= NOT((fsm_output(2)) OR (fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(8)));
  and_248_nl <= (fsm_output(2)) AND (fsm_output(5)) AND (fsm_output(6)) AND (fsm_output(8));
  mux_894_nl <= MUX_s_1_2_2(nor_228_nl, and_248_nl, and_378_cse);
  mux_895_nl <= MUX_s_1_2_2(mux_894_nl, and_250_cse, fsm_output(3));
  mux_896_nl <= MUX_s_1_2_2(nor_227_cse, mux_895_nl, fsm_output(4));
  and_228_nl <= (fsm_output(7)) AND (CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_230_nl <= (fsm_output(7)) AND ((fsm_output(6)) OR and_354_cse);
  or_1026_nl <= and_378_cse OR CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  nand_72_nl <= NOT(or_1027_cse AND CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111")));
  mux_902_nl <= MUX_s_1_2_2(or_1026_nl, nand_72_nl, fsm_output(3));
  nand_150_nl <= NOT((fsm_output(3)) AND (fsm_output(6)) AND (fsm_output(7)) AND
      (fsm_output(8)));
  mux_903_nl <= MUX_s_1_2_2(mux_902_nl, nand_150_nl, fsm_output(2));
  mux_904_nl <= MUX_s_1_2_2(or_1035_cse, mux_903_nl, fsm_output(4));
  nand_148_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111")));
  mux_905_nl <= MUX_s_1_2_2(mux_904_nl, nand_148_nl, fsm_output(5));
  COMP_LOOP_or_11_nl <= (COMP_LOOP_COMP_LOOP_nor_1_itm AND tmp_1_lpi_4_dfm_mx0c0)
      OR (COMP_LOOP_COMP_LOOP_nor_5_itm AND and_dcpl_132) OR (COMP_LOOP_COMP_LOOP_nor_9_itm
      AND and_dcpl_136) OR (COMP_LOOP_COMP_LOOP_nor_13_itm AND and_dcpl_139) OR (COMP_LOOP_COMP_LOOP_nor_17_itm
      AND and_dcpl_143) OR (COMP_LOOP_COMP_LOOP_nor_21_itm AND and_dcpl_146) OR (COMP_LOOP_COMP_LOOP_nor_25_itm
      AND and_dcpl_150) OR (COMP_LOOP_COMP_LOOP_nor_29_itm AND and_dcpl_153);
  COMP_LOOP_or_12_nl <= (CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("001"))
      AND tmp_1_lpi_4_dfm_mx0c0) OR ((operator_64_false_acc_cse_2_sva(0)) AND COMP_LOOP_nor_16_cse
      AND and_dcpl_132) OR ((operator_64_false_acc_cse_3_sva(0)) AND COMP_LOOP_nor_28_cse
      AND and_dcpl_136) OR ((operator_64_false_acc_cse_4_sva(0)) AND COMP_LOOP_nor_40_cse
      AND and_dcpl_139) OR ((operator_64_false_acc_cse_5_sva(0)) AND COMP_LOOP_nor_52_cse
      AND and_dcpl_143) OR ((operator_64_false_acc_cse_6_sva(0)) AND COMP_LOOP_nor_64_cse
      AND and_dcpl_146) OR ((operator_64_false_acc_cse_7_sva(0)) AND COMP_LOOP_nor_76_cse
      AND and_dcpl_150) OR ((operator_64_false_acc_cse_sva(0)) AND COMP_LOOP_nor_88_cse
      AND and_dcpl_153);
  COMP_LOOP_or_13_nl <= (CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("010"))
      AND tmp_1_lpi_4_dfm_mx0c0) OR ((operator_64_false_acc_cse_2_sva(1)) AND COMP_LOOP_nor_17_cse
      AND and_dcpl_132) OR ((operator_64_false_acc_cse_3_sva(1)) AND COMP_LOOP_nor_29_cse
      AND and_dcpl_136) OR ((operator_64_false_acc_cse_4_sva(1)) AND COMP_LOOP_nor_41_cse
      AND and_dcpl_139) OR ((operator_64_false_acc_cse_5_sva(1)) AND COMP_LOOP_nor_53_cse
      AND and_dcpl_143) OR ((operator_64_false_acc_cse_6_sva(1)) AND COMP_LOOP_nor_65_cse
      AND and_dcpl_146) OR ((operator_64_false_acc_cse_7_sva(1)) AND COMP_LOOP_nor_77_cse
      AND and_dcpl_150) OR ((operator_64_false_acc_cse_sva(1)) AND COMP_LOOP_nor_89_cse
      AND and_dcpl_153);
  COMP_LOOP_or_14_nl <= (COMP_LOOP_COMP_LOOP_and_9_itm AND tmp_1_lpi_4_dfm_mx0c0)
      OR (COMP_LOOP_COMP_LOOP_and_37_itm AND and_dcpl_132) OR (COMP_LOOP_COMP_LOOP_and_65_itm
      AND and_dcpl_136) OR (COMP_LOOP_COMP_LOOP_and_93_itm AND and_dcpl_139) OR (COMP_LOOP_COMP_LOOP_and_121_itm
      AND and_dcpl_143) OR (COMP_LOOP_COMP_LOOP_and_149_itm AND and_dcpl_146) OR
      (COMP_LOOP_COMP_LOOP_and_177_itm AND and_dcpl_150) OR (COMP_LOOP_COMP_LOOP_and_205_itm
      AND and_dcpl_153);
  COMP_LOOP_or_15_nl <= (CONV_SL_1_1(operator_64_false_acc_cse_1_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("100"))
      AND tmp_1_lpi_4_dfm_mx0c0) OR ((operator_64_false_acc_cse_2_sva(2)) AND COMP_LOOP_nor_18_cse
      AND and_dcpl_132) OR ((operator_64_false_acc_cse_3_sva(2)) AND COMP_LOOP_nor_30_cse
      AND and_dcpl_136) OR ((operator_64_false_acc_cse_4_sva(2)) AND COMP_LOOP_nor_42_cse
      AND and_dcpl_139) OR ((operator_64_false_acc_cse_5_sva(2)) AND COMP_LOOP_nor_54_cse
      AND and_dcpl_143) OR ((operator_64_false_acc_cse_6_sva(2)) AND COMP_LOOP_nor_66_cse
      AND and_dcpl_146) OR ((operator_64_false_acc_cse_7_sva(2)) AND COMP_LOOP_nor_78_cse
      AND and_dcpl_150) OR ((operator_64_false_acc_cse_sva(2)) AND COMP_LOOP_nor_90_cse
      AND and_dcpl_153);
  COMP_LOOP_or_16_nl <= (COMP_LOOP_2_operator_64_false_slc_operator_64_false_acc_63_itm
      AND tmp_1_lpi_4_dfm_mx0c0) OR (COMP_LOOP_COMP_LOOP_and_39_itm AND and_dcpl_132)
      OR (COMP_LOOP_COMP_LOOP_and_67_itm AND and_dcpl_136) OR (COMP_LOOP_COMP_LOOP_and_95_itm
      AND and_dcpl_139) OR (COMP_LOOP_COMP_LOOP_and_123_itm AND and_dcpl_143) OR
      (COMP_LOOP_COMP_LOOP_and_151_itm AND and_dcpl_146) OR (COMP_LOOP_COMP_LOOP_and_179_itm
      AND and_dcpl_150) OR (COMP_LOOP_COMP_LOOP_and_207_itm AND and_dcpl_153);
  COMP_LOOP_or_17_nl <= (COMP_LOOP_COMP_LOOP_and_12_itm AND tmp_1_lpi_4_dfm_mx0c0)
      OR (COMP_LOOP_COMP_LOOP_and_40_itm AND and_dcpl_132) OR (COMP_LOOP_COMP_LOOP_and_68_itm
      AND and_dcpl_136) OR (COMP_LOOP_COMP_LOOP_and_96_itm AND and_dcpl_139) OR (COMP_LOOP_COMP_LOOP_and_124_itm
      AND and_dcpl_143) OR (COMP_LOOP_COMP_LOOP_and_152_itm AND and_dcpl_146) OR
      (COMP_LOOP_COMP_LOOP_and_180_itm AND and_dcpl_150) OR (COMP_LOOP_COMP_LOOP_and_208_itm
      AND and_dcpl_153);
  COMP_LOOP_or_18_nl <= (COMP_LOOP_COMP_LOOP_and_13_itm AND tmp_1_lpi_4_dfm_mx0c0)
      OR (COMP_LOOP_COMP_LOOP_and_41_itm AND and_dcpl_132) OR (COMP_LOOP_COMP_LOOP_and_69_itm
      AND and_dcpl_136) OR (COMP_LOOP_COMP_LOOP_and_97_itm AND and_dcpl_139) OR (COMP_LOOP_COMP_LOOP_and_125_itm
      AND and_dcpl_143) OR (COMP_LOOP_COMP_LOOP_and_153_itm AND and_dcpl_146) OR
      (COMP_LOOP_COMP_LOOP_and_181_itm AND and_dcpl_150) OR (COMP_LOOP_COMP_LOOP_and_209_itm
      AND and_dcpl_153);
  not_2187_nl <= NOT not_tmp_324;
  or_1182_nl <= (fsm_output(2)) OR (NOT(nand_177_cse AND nor_tmp_45));
  mux_1031_nl <= MUX_s_1_2_2(or_1182_nl, or_tmp_897, fsm_output(3));
  mux_1027_nl <= MUX_s_1_2_2(or_tmp_897, or_tmp_896, fsm_output(1));
  or_1180_nl <= (NOT (fsm_output(1))) OR (fsm_output(8)) OR (NOT (fsm_output(4)));
  mux_1028_nl <= MUX_s_1_2_2(mux_1027_nl, or_1180_nl, fsm_output(0));
  mux_1029_nl <= MUX_s_1_2_2(or_tmp_897, mux_1028_nl, fsm_output(2));
  mux_1030_nl <= MUX_s_1_2_2(mux_1029_nl, or_tmp_896, fsm_output(3));
  mux_1032_nl <= MUX_s_1_2_2(mux_1031_nl, mux_1030_nl, fsm_output(7));
  or_1178_nl <= (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))))
      OR (NOT (fsm_output(8))) OR (fsm_output(4));
  or_1175_nl <= nor_603_cse OR (fsm_output(8)) OR (NOT (fsm_output(4)));
  mux_1024_nl <= MUX_s_1_2_2(or_tmp_897, or_1175_nl, fsm_output(2));
  mux_1025_nl <= MUX_s_1_2_2(or_1178_nl, mux_1024_nl, fsm_output(3));
  or_1171_nl <= (fsm_output(1)) OR (fsm_output(8)) OR (NOT (fsm_output(4)));
  or_1169_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(8))
      OR (fsm_output(4));
  mux_1022_nl <= MUX_s_1_2_2(or_1171_nl, or_1169_nl, fsm_output(2));
  mux_1023_nl <= MUX_s_1_2_2(or_tmp_896, mux_1022_nl, fsm_output(3));
  mux_1026_nl <= MUX_s_1_2_2(mux_1025_nl, mux_1023_nl, fsm_output(7));
  mux_1033_nl <= MUX_s_1_2_2(mux_1032_nl, mux_1026_nl, fsm_output(6));
  or_1168_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR (fsm_output(4));
  or_1167_nl <= and_348_cse OR (fsm_output(8)) OR (fsm_output(4));
  mux_1019_nl <= MUX_s_1_2_2(or_1168_nl, or_1167_nl, fsm_output(3));
  nor_604_nl <= NOT((fsm_output(1)) OR (fsm_output(8)) OR (fsm_output(4)));
  and_624_nl <= (fsm_output(1)) AND (fsm_output(8)) AND (fsm_output(4));
  mux_1016_nl <= MUX_s_1_2_2(nor_604_nl, and_624_nl, fsm_output(0));
  mux_1017_nl <= MUX_s_1_2_2(mux_1016_nl, nor_tmp_45, fsm_output(2));
  nand_204_nl <= NOT(nand_205_cse AND nor_tmp_45);
  mux_1018_nl <= MUX_s_1_2_2((NOT mux_1017_nl), nand_204_nl, fsm_output(3));
  mux_1020_nl <= MUX_s_1_2_2(mux_1019_nl, mux_1018_nl, fsm_output(7));
  nand_199_nl <= NOT(or_953_cse AND (fsm_output(8)) AND (fsm_output(4)));
  mux_1015_nl <= MUX_s_1_2_2(or_1183_cse, nand_199_nl, fsm_output(3));
  or_1164_nl <= (fsm_output(7)) OR mux_1015_nl;
  mux_1021_nl <= MUX_s_1_2_2(mux_1020_nl, or_1164_nl, fsm_output(6));
  COMP_LOOP_mux_61_nl <= MUX_v_64_2_2(COMP_LOOP_1_modExp_dev_1_while_mul_mut, modExp_dev_result_sva,
      and_dcpl_222);
  mux_1037_nl <= MUX_s_1_2_2(or_tmp_984, or_tmp_988, fsm_output(4));
  nor_619_nl <= NOT((fsm_output(6)) OR (fsm_output(3)) OR mux_1037_nl);
  or_1186_nl <= (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(5));
  mux_1038_nl <= MUX_s_1_2_2(or_tmp_988, or_1186_nl, fsm_output(4));
  and_634_nl <= (fsm_output(6)) AND (fsm_output(3)) AND (NOT mux_1038_nl);
  mux_1036_nl <= MUX_s_1_2_2(nor_619_nl, and_634_nl, fsm_output(0));
  and_633_nl <= (fsm_output(8)) AND mux_1036_nl;
  or_1187_nl <= (fsm_output(6)) OR (NOT (fsm_output(3))) OR mux_tmp_920;
  or_1188_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR mux_tmp_920;
  mux_1039_nl <= MUX_s_1_2_2(or_1187_nl, or_1188_nl, fsm_output(0));
  nor_620_nl <= NOT((fsm_output(8)) OR mux_1039_nl);
  mux_1035_nl <= MUX_s_1_2_2(and_633_nl, nor_620_nl, fsm_output(2));
  nor_621_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("11")));
  nor_622_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR
      (NOT (fsm_output(7))));
  nor_623_nl <= NOT((fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(6))) OR
      (fsm_output(7)));
  mux_1043_nl <= MUX_s_1_2_2(nor_622_nl, nor_623_nl, fsm_output(3));
  and_635_nl <= (fsm_output(2)) AND mux_1043_nl;
  mux_1042_nl <= MUX_s_1_2_2(nor_621_nl, and_635_nl, fsm_output(4));
  or_1189_nl <= (fsm_output(3)) OR (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(6)))
      OR (fsm_output(7));
  or_1190_nl <= (fsm_output(3)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(0)))
      OR (fsm_output(6)) OR (fsm_output(7));
  mux_1044_nl <= MUX_s_1_2_2(or_1189_nl, or_1190_nl, fsm_output(2));
  nor_624_nl <= NOT((fsm_output(4)) OR mux_1044_nl);
  mux_1041_nl <= MUX_s_1_2_2(mux_1042_nl, nor_624_nl, fsm_output(8));
  nor_625_nl <= NOT((fsm_output(4)) OR (fsm_output(2)) OR (fsm_output(3)) OR (NOT
      (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7)));
  or_1191_nl <= (NOT (fsm_output(1))) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT
      (fsm_output(7)));
  or_1192_nl <= (fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(6)))
      OR (fsm_output(7));
  mux_1046_nl <= MUX_s_1_2_2(or_1191_nl, or_1192_nl, fsm_output(3));
  nor_626_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(2)) OR mux_1046_nl);
  mux_1045_nl <= MUX_s_1_2_2(nor_625_nl, nor_626_nl, fsm_output(8));
  mux_1040_nl <= MUX_s_1_2_2(mux_1041_nl, mux_1045_nl, fsm_output(5));
  COMP_LOOP_mux1h_256_nl <= MUX1HOT_v_64_3_2(COMP_LOOP_1_modulo_dev_cmp_return_rsc_z,
      r_sva, modExp_dev_result_sva, STD_LOGIC_VECTOR'( mux_1035_nl & and_dcpl_222
      & mux_1040_nl));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_mux_61_nl)
      * UNSIGNED(COMP_LOOP_mux1h_256_nl)), 64));
  COMP_LOOP_COMP_LOOP_or_2_nl <= MUX_v_3_2_2((STAGE_VEC_LOOP_j_sva_9_0(9 DOWNTO 7)),
      STD_LOGIC_VECTOR'("111"), and_dcpl_237);
  COMP_LOOP_mux_62_nl <= MUX_v_7_2_2((STAGE_VEC_LOOP_j_sva_9_0(6 DOWNTO 0)), (NOT
      (STAGE_MAIN_LOOP_lshift_psp_1_sva(9 DOWNTO 3))), and_dcpl_237);
  COMP_LOOP_or_22_nl <= (NOT(and_dcpl_35 AND (fsm_output(1)) AND and_dcpl_53 AND
      (NOT (fsm_output(7))) AND (fsm_output(4)) AND nor_607_cse)) OR and_dcpl_237;
  not_2348_nl <= NOT and_dcpl_237;
  COMP_LOOP_COMP_LOOP_and_232_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), (COMP_LOOP_k_9_3_sva_5_0(5
      DOWNTO 4)), not_2348_nl);
  COMP_LOOP_mux_63_nl <= MUX_v_4_2_2((COMP_LOOP_k_9_3_sva_5_0(3 DOWNTO 0)), (COMP_LOOP_k_9_3_sva_5_0(5
      DOWNTO 2)), and_dcpl_237);
  not_2349_nl <= NOT and_dcpl_237;
  COMP_LOOP_COMP_LOOP_or_3_nl <= MUX_v_2_2_2((COMP_LOOP_k_9_3_sva_5_0(1 DOWNTO 0)),
      STD_LOGIC_VECTOR'("11"), not_2349_nl);
  acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(SIGNED(and_dcpl_237
      & COMP_LOOP_COMP_LOOP_or_2_nl & COMP_LOOP_mux_62_nl & COMP_LOOP_or_22_nl),
      12), 13) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_and_232_nl
      & COMP_LOOP_mux_63_nl & COMP_LOOP_COMP_LOOP_or_3_nl & (NOT and_dcpl_237) &
      '1'), 10), 13), 13));
  COMP_LOOP_slc_acc_12_1_slc <= acc_nl(12 DOWNTO 1);
  operator_64_false_operator_64_false_or_59_nl <= (NOT(and_dcpl_245 OR and_dcpl_250
      OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_268 OR and_dcpl_271 OR and_dcpl_274
      OR and_dcpl_275 OR and_dcpl_285 OR and_dcpl_290)) OR mux_965_cse OR and_dcpl_278
      OR and_dcpl_282;
  operator_64_false_operator_64_false_mux_1_nl <= MUX_v_54_2_2((z_out_3(63 DOWNTO
      10)), (STAGE_MAIN_LOOP_div_cmp_z(63 DOWNTO 10)), and_dcpl_278);
  operator_64_false_or_14_nl <= and_dcpl_271 OR and_dcpl_274 OR and_dcpl_275;
  operator_64_false_operator_64_false_nor_1_nl <= NOT(MUX_v_54_2_2(operator_64_false_operator_64_false_mux_1_nl,
      STD_LOGIC_VECTOR'("111111111111111111111111111111111111111111111111111111"),
      operator_64_false_or_14_nl));
  operator_64_false_or_13_nl <= MUX_v_54_2_2(operator_64_false_operator_64_false_nor_1_nl,
      STD_LOGIC_VECTOR'("111111111111111111111111111111111111111111111111111111"),
      operator_64_false_or_4_itm);
  operator_64_false_mux1h_4_nl <= MUX1HOT_s_1_3_2((STAGE_VEC_LOOP_j_sva_9_0(9)),
      (NOT (z_out_3(9))), (NOT (STAGE_MAIN_LOOP_div_cmp_z(9))), STD_LOGIC_VECTOR'(
      and_dcpl_274 & operator_64_false_or_9_itm & and_dcpl_278));
  operator_64_false_or_15_nl <= (operator_64_false_mux1h_4_nl AND (NOT(and_dcpl_271
      OR and_dcpl_275))) OR and_dcpl_245 OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264
      OR and_dcpl_268 OR and_dcpl_285 OR and_dcpl_290;
  operator_64_false_mux1h_5_nl <= MUX1HOT_v_9_6_2((NOT (STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 1))), (STD_LOGIC_VECTOR'( "00") & (STAGE_VEC_LOOP_j_sva_9_0(9 DOWNTO
      3))), (STAGE_VEC_LOOP_j_sva_9_0(8 DOWNTO 0)), (NOT (z_out_3(8 DOWNTO 0))),
      (STD_LOGIC_VECTOR'( "00000") & STAGE_MAIN_LOOP_acc_1_psp_sva), (NOT (STAGE_MAIN_LOOP_div_cmp_z(8
      DOWNTO 0))), STD_LOGIC_VECTOR'( operator_64_false_or_4_itm & and_dcpl_271 &
      and_dcpl_274 & operator_64_false_or_9_itm & and_dcpl_275 & and_dcpl_278));
  operator_64_false_or_16_nl <= (NOT(and_dcpl_271 OR and_dcpl_274 OR mux_965_cse
      OR and_dcpl_275 OR and_dcpl_278 OR and_dcpl_282 OR and_dcpl_285)) OR and_dcpl_245
      OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_268 OR and_dcpl_290;
  operator_64_false_mux_4_nl <= MUX_s_1_2_2((STAGE_MAIN_LOOP_lshift_psp_1_sva(9)),
      (z_out_4(6)), and_dcpl_290);
  operator_64_false_operator_64_false_or_60_nl <= (operator_64_false_mux_4_nl AND
      (NOT(and_dcpl_245 OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_268
      OR and_dcpl_271 OR mux_965_cse OR and_dcpl_278 OR and_dcpl_282 OR and_dcpl_285)))
      OR and_dcpl_275;
  operator_64_false_or_18_nl <= and_dcpl_245 OR and_dcpl_250 OR and_dcpl_257 OR and_dcpl_264
      OR and_dcpl_268;
  operator_64_false_mux1h_6_nl <= MUX1HOT_v_6_4_2(COMP_LOOP_k_9_3_sva_5_0, (STD_LOGIC_VECTOR'(
      "000") & (COMP_LOOP_k_9_3_sva_5_0(5 DOWNTO 3))), (STAGE_MAIN_LOOP_lshift_psp_1_sva(8
      DOWNTO 3)), (z_out_4(5 DOWNTO 0)), STD_LOGIC_VECTOR'( operator_64_false_or_18_nl
      & and_dcpl_271 & and_dcpl_274 & and_dcpl_290));
  operator_64_false_nor_67_nl <= NOT(mux_965_cse OR and_dcpl_278 OR and_dcpl_282
      OR and_dcpl_285);
  operator_64_false_and_9_nl <= MUX_v_6_2_2(STD_LOGIC_VECTOR'("000000"), operator_64_false_mux1h_6_nl,
      operator_64_false_nor_67_nl);
  operator_64_false_or_17_nl <= MUX_v_6_2_2(operator_64_false_and_9_nl, STD_LOGIC_VECTOR'("111111"),
      and_dcpl_275);
  operator_64_false_mux_5_nl <= MUX_s_1_2_2((COMP_LOOP_k_9_3_sva_5_0(2)), (STAGE_MAIN_LOOP_lshift_psp_1_sva(2)),
      and_dcpl_274);
  operator_64_false_operator_64_false_or_61_nl <= (operator_64_false_mux_5_nl AND
      (NOT(and_dcpl_245 OR and_dcpl_250 OR mux_965_cse OR and_dcpl_278 OR and_dcpl_282
      OR and_dcpl_285 OR and_dcpl_290))) OR and_dcpl_257 OR and_dcpl_264 OR and_dcpl_268
      OR and_dcpl_275;
  operator_64_false_mux_6_nl <= MUX_s_1_2_2((COMP_LOOP_k_9_3_sva_5_0(1)), (STAGE_MAIN_LOOP_lshift_psp_1_sva(1)),
      and_dcpl_274);
  operator_64_false_operator_64_false_or_62_nl <= (operator_64_false_mux_6_nl AND
      (NOT(and_dcpl_245 OR and_dcpl_257 OR and_dcpl_264 OR mux_965_cse OR and_dcpl_278
      OR and_dcpl_282 OR and_dcpl_285 OR and_dcpl_290))) OR and_dcpl_250 OR and_dcpl_268
      OR and_dcpl_275;
  operator_64_false_mux_7_nl <= MUX_s_1_2_2((COMP_LOOP_k_9_3_sva_5_0(0)), (STAGE_MAIN_LOOP_lshift_psp_1_sva(0)),
      and_dcpl_274);
  operator_64_false_operator_64_false_or_63_nl <= (operator_64_false_mux_7_nl AND
      (NOT(and_dcpl_250 OR and_dcpl_257 OR and_dcpl_268 OR and_dcpl_290))) OR and_dcpl_245
      OR and_dcpl_264 OR mux_965_cse OR and_dcpl_275 OR and_dcpl_278 OR and_dcpl_282
      OR and_dcpl_285;
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_64_false_operator_64_false_or_59_nl
      & operator_64_false_or_13_nl & operator_64_false_or_15_nl & operator_64_false_mux1h_5_nl
      & operator_64_false_or_16_nl) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_1_cse
      & operator_64_false_operator_64_false_or_1_cse & operator_64_false_operator_64_false_or_60_nl
      & operator_64_false_or_17_nl & operator_64_false_operator_64_false_or_61_nl
      & operator_64_false_operator_64_false_or_62_nl & operator_64_false_operator_64_false_or_63_nl
      & '1'), 65), 66), 66));
  z_out_2 <= acc_1_nl(65 DOWNTO 1);
  operator_64_false_or_6_nl <= and_dcpl_302 OR not_tmp_468 OR and_dcpl_310 OR and_512_cse
      OR and_519_cse OR and_522_cse OR and_dcpl_329 OR and_530_cse OR and_534_cse;
  operator_64_false_mux1h_3_nl <= MUX1HOT_v_64_4_2(p_sva, tmp_10_lpi_4_dfm, (modExp_dev_exp_1_sva_63_9
      & COMP_LOOP_acc_psp_sva_5_0 & modExp_dev_exp_1_sva_2_0), z_out_5, STD_LOGIC_VECTOR'(
      and_dcpl_298 & operator_64_false_or_6_nl & mux_965_cse & and_503_cse));
  operator_64_false_or_7_nl <= (NOT(and_dcpl_298 OR and_dcpl_302 OR mux_965_cse OR
      and_503_cse OR and_dcpl_310 OR and_512_cse OR and_519_cse OR and_522_cse OR
      and_dcpl_329 OR and_530_cse OR and_534_cse)) OR not_tmp_468;
  operator_64_false_or_9_nl <= and_dcpl_310 OR and_512_cse OR and_519_cse OR and_522_cse
      OR and_dcpl_329 OR and_530_cse OR and_534_cse;
  operator_64_false_mux1h_4_nl_1 <= MUX1HOT_v_64_3_2(tmp_1_lpi_4_dfm, (NOT tmp_1_lpi_4_dfm),
      z_out_5, STD_LOGIC_VECTOR'( and_503_cse & not_tmp_468 & operator_64_false_or_9_nl));
  operator_64_false_or_10_nl <= and_dcpl_298 OR and_dcpl_302 OR mux_965_cse;
  operator_64_false_or_8_nl <= MUX_v_64_2_2(operator_64_false_mux1h_4_nl_1, STD_LOGIC_VECTOR'("1111111111111111111111111111111111111111111111111111111111111111"),
      operator_64_false_or_10_nl);
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_64_false_mux1h_3_nl
      & operator_64_false_or_7_nl) + UNSIGNED(operator_64_false_or_8_nl & '1'), 65));
  z_out_3 <= acc_2_nl(64 DOWNTO 1);
  operator_64_false_1_operator_64_false_1_or_55_nl <= (NOT and_dcpl_365) OR and_dcpl_346
      OR and_dcpl_353 OR and_dcpl_358;
  operator_64_false_1_mux1h_3_nl <= MUX1HOT_v_6_3_2(COMP_LOOP_k_9_3_sva_5_0, (STAGE_MAIN_LOOP_lshift_psp_1_sva(9
      DOWNTO 4)), (NOT COMP_LOOP_k_9_3_sva_5_0), STD_LOGIC_VECTOR'( and_dcpl_346
      & and_dcpl_353 & and_dcpl_365));
  operator_64_false_1_not_3_nl <= NOT and_dcpl_358;
  operator_64_false_1_operator_64_false_1_nand_1_nl <= NOT(MUX_v_6_2_2(STD_LOGIC_VECTOR'("000000"),
      operator_64_false_1_mux1h_3_nl, operator_64_false_1_not_3_nl));
  operator_64_false_1_or_3_nl <= (NOT(and_dcpl_346 OR and_dcpl_358 OR and_dcpl_365))
      OR and_dcpl_353;
  operator_64_false_1_or_4_nl <= and_dcpl_346 OR and_dcpl_365;
  operator_64_false_1_mux1h_4_nl <= MUX1HOT_v_6_3_2(STD_LOGIC_VECTOR'( "000001"),
      COMP_LOOP_k_9_3_sva_5_0, (STD_LOGIC_VECTOR'( "00") & STAGE_MAIN_LOOP_acc_1_psp_sva),
      STD_LOGIC_VECTOR'( operator_64_false_1_or_4_nl & and_dcpl_353 & and_dcpl_358));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_cse
      & operator_64_false_1_operator_64_false_1_or_cse & operator_64_false_1_operator_64_false_1_or_55_nl
      & operator_64_false_1_operator_64_false_1_nand_1_nl & operator_64_false_1_or_3_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux1h_4_nl & '1'),
      7), 62), 62));
  z_out_4 <= acc_3_nl(61 DOWNTO 1);
  COMP_LOOP_mux1h_257_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_86_itm, COMP_LOOP_COMP_LOOP_nor_5_itm,
      COMP_LOOP_COMP_LOOP_nor_9_itm, COMP_LOOP_COMP_LOOP_nor_13_itm, COMP_LOOP_COMP_LOOP_nor_17_itm,
      COMP_LOOP_COMP_LOOP_nor_21_itm, COMP_LOOP_COMP_LOOP_nor_25_itm, COMP_LOOP_COMP_LOOP_nor_29_itm,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_COMP_LOOP_and_233_nl <= (operator_64_false_acc_cse_2_sva(0)) AND COMP_LOOP_nor_16_cse;
  COMP_LOOP_COMP_LOOP_and_234_nl <= (operator_64_false_acc_cse_3_sva(0)) AND COMP_LOOP_nor_28_cse;
  COMP_LOOP_COMP_LOOP_and_235_nl <= (operator_64_false_acc_cse_4_sva(0)) AND COMP_LOOP_nor_40_cse;
  COMP_LOOP_COMP_LOOP_and_236_nl <= (operator_64_false_acc_cse_5_sva(0)) AND COMP_LOOP_nor_52_cse;
  COMP_LOOP_COMP_LOOP_and_237_nl <= (operator_64_false_acc_cse_6_sva(0)) AND COMP_LOOP_nor_64_cse;
  COMP_LOOP_COMP_LOOP_and_238_nl <= (operator_64_false_acc_cse_7_sva(0)) AND COMP_LOOP_nor_76_cse;
  COMP_LOOP_COMP_LOOP_and_239_nl <= (operator_64_false_acc_cse_sva(0)) AND COMP_LOOP_nor_88_cse;
  COMP_LOOP_mux1h_258_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_145_itm, COMP_LOOP_COMP_LOOP_and_233_nl,
      COMP_LOOP_COMP_LOOP_and_234_nl, COMP_LOOP_COMP_LOOP_and_235_nl, COMP_LOOP_COMP_LOOP_and_236_nl,
      COMP_LOOP_COMP_LOOP_and_237_nl, COMP_LOOP_COMP_LOOP_and_238_nl, COMP_LOOP_COMP_LOOP_and_239_nl,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_COMP_LOOP_and_240_nl <= (operator_64_false_acc_cse_2_sva(1)) AND COMP_LOOP_nor_17_cse;
  COMP_LOOP_COMP_LOOP_and_241_nl <= (operator_64_false_acc_cse_3_sva(1)) AND COMP_LOOP_nor_29_cse;
  COMP_LOOP_COMP_LOOP_and_242_nl <= (operator_64_false_acc_cse_4_sva(1)) AND COMP_LOOP_nor_41_cse;
  COMP_LOOP_COMP_LOOP_and_243_nl <= (operator_64_false_acc_cse_5_sva(1)) AND COMP_LOOP_nor_53_cse;
  COMP_LOOP_COMP_LOOP_and_244_nl <= (operator_64_false_acc_cse_6_sva(1)) AND COMP_LOOP_nor_65_cse;
  COMP_LOOP_COMP_LOOP_and_245_nl <= (operator_64_false_acc_cse_7_sva(1)) AND COMP_LOOP_nor_77_cse;
  COMP_LOOP_COMP_LOOP_and_246_nl <= (operator_64_false_acc_cse_sva(1)) AND COMP_LOOP_nor_89_cse;
  COMP_LOOP_mux1h_259_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_30_itm, COMP_LOOP_COMP_LOOP_and_240_nl,
      COMP_LOOP_COMP_LOOP_and_241_nl, COMP_LOOP_COMP_LOOP_and_242_nl, COMP_LOOP_COMP_LOOP_and_243_nl,
      COMP_LOOP_COMP_LOOP_and_244_nl, COMP_LOOP_COMP_LOOP_and_245_nl, COMP_LOOP_COMP_LOOP_and_246_nl,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_mux1h_260_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_60_itm, COMP_LOOP_COMP_LOOP_and_37_itm,
      COMP_LOOP_COMP_LOOP_and_65_itm, COMP_LOOP_COMP_LOOP_and_93_itm, COMP_LOOP_COMP_LOOP_and_121_itm,
      COMP_LOOP_COMP_LOOP_and_149_itm, COMP_LOOP_COMP_LOOP_and_177_itm, COMP_LOOP_COMP_LOOP_and_205_itm,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_COMP_LOOP_and_247_nl <= (operator_64_false_acc_cse_2_sva(2)) AND COMP_LOOP_nor_18_cse;
  COMP_LOOP_COMP_LOOP_and_248_nl <= (operator_64_false_acc_cse_3_sva(2)) AND COMP_LOOP_nor_30_cse;
  COMP_LOOP_COMP_LOOP_and_249_nl <= (operator_64_false_acc_cse_4_sva(2)) AND COMP_LOOP_nor_42_cse;
  COMP_LOOP_COMP_LOOP_and_250_nl <= (operator_64_false_acc_cse_5_sva(2)) AND COMP_LOOP_nor_54_cse;
  COMP_LOOP_COMP_LOOP_and_251_nl <= (operator_64_false_acc_cse_6_sva(2)) AND COMP_LOOP_nor_66_cse;
  COMP_LOOP_COMP_LOOP_and_252_nl <= (operator_64_false_acc_cse_7_sva(2)) AND COMP_LOOP_nor_78_cse;
  COMP_LOOP_COMP_LOOP_and_253_nl <= (operator_64_false_acc_cse_sva(2)) AND COMP_LOOP_nor_90_cse;
  COMP_LOOP_mux1h_261_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_32_itm, COMP_LOOP_COMP_LOOP_and_247_nl,
      COMP_LOOP_COMP_LOOP_and_248_nl, COMP_LOOP_COMP_LOOP_and_249_nl, COMP_LOOP_COMP_LOOP_and_250_nl,
      COMP_LOOP_COMP_LOOP_and_251_nl, COMP_LOOP_COMP_LOOP_and_252_nl, COMP_LOOP_COMP_LOOP_and_253_nl,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_mux1h_262_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_33_itm, COMP_LOOP_COMP_LOOP_and_39_itm,
      COMP_LOOP_COMP_LOOP_and_67_itm, COMP_LOOP_COMP_LOOP_and_95_itm, COMP_LOOP_COMP_LOOP_and_123_itm,
      COMP_LOOP_COMP_LOOP_and_151_itm, COMP_LOOP_COMP_LOOP_and_179_itm, COMP_LOOP_COMP_LOOP_and_207_itm,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_mux1h_263_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_34_itm, COMP_LOOP_COMP_LOOP_and_40_itm,
      COMP_LOOP_COMP_LOOP_and_68_itm, COMP_LOOP_COMP_LOOP_and_96_itm, COMP_LOOP_COMP_LOOP_and_124_itm,
      COMP_LOOP_COMP_LOOP_and_152_itm, COMP_LOOP_COMP_LOOP_and_180_itm, COMP_LOOP_COMP_LOOP_and_208_itm,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  COMP_LOOP_mux1h_264_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_nor_4_itm, COMP_LOOP_COMP_LOOP_and_41_itm,
      COMP_LOOP_COMP_LOOP_and_69_itm, COMP_LOOP_COMP_LOOP_and_97_itm, COMP_LOOP_COMP_LOOP_and_125_itm,
      COMP_LOOP_COMP_LOOP_and_153_itm, COMP_LOOP_COMP_LOOP_and_181_itm, COMP_LOOP_COMP_LOOP_and_209_itm,
      STD_LOGIC_VECTOR'( and_503_cse & and_dcpl_379 & and_512_cse & and_519_cse &
      and_522_cse & and_dcpl_401 & and_530_cse & and_534_cse));
  z_out_5 <= MUX1HOT_v_64_8_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d,
      vec_rsc_0_3_i_qa_d, vec_rsc_0_4_i_qa_d, vec_rsc_0_5_i_qa_d, vec_rsc_0_6_i_qa_d,
      vec_rsc_0_7_i_qa_d, STD_LOGIC_VECTOR'( COMP_LOOP_mux1h_257_nl & COMP_LOOP_mux1h_258_nl
      & COMP_LOOP_mux1h_259_nl & COMP_LOOP_mux1h_260_nl & COMP_LOOP_mux1h_261_nl
      & COMP_LOOP_mux1h_262_nl & COMP_LOOP_mux1h_263_nl & COMP_LOOP_mux1h_264_nl));
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_0_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wea : OUT STD_LOGIC;
    vec_rsc_0_0_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_1_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wea : OUT STD_LOGIC;
    vec_rsc_0_1_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_2_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_2_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_wea : OUT STD_LOGIC;
    vec_rsc_0_2_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_0_3_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_3_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_wea : OUT STD_LOGIC;
    vec_rsc_0_3_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    vec_rsc_0_4_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_4_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_4_wea : OUT STD_LOGIC;
    vec_rsc_0_4_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    vec_rsc_0_5_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_5_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_5_wea : OUT STD_LOGIC;
    vec_rsc_0_5_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    vec_rsc_0_6_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_6_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_6_wea : OUT STD_LOGIC;
    vec_rsc_0_6_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    vec_rsc_0_7_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    vec_rsc_0_7_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_7_wea : OUT STD_LOGIC;
    vec_rsc_0_7_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIF;

ARCHITECTURE v6 OF inPlaceNTT_DIF IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_adra_d_iff : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_4_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_5_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_6_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_7_i_wea_d_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_2_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_3_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_4_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_5_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_6_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_7_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_5_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_7_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      r_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_2_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_3_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_4_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_5_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_6_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_7_i_wea_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_r_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_adra_d_pff : STD_LOGIC_VECTOR (6
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  vec_rsc_0_0_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_8_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_0_i_qa,
      wea => vec_rsc_0_0_wea,
      da => vec_rsc_0_0_i_da,
      adra => vec_rsc_0_0_i_adra,
      adra_d => vec_rsc_0_0_i_adra_d,
      da_d => vec_rsc_0_0_i_da_d,
      qa_d => vec_rsc_0_0_i_qa_d_1,
      wea_d => vec_rsc_0_0_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_0_i_wea_d_iff
    );
  vec_rsc_0_0_i_qa <= vec_rsc_0_0_qa;
  vec_rsc_0_0_da <= vec_rsc_0_0_i_da;
  vec_rsc_0_0_adra <= vec_rsc_0_0_i_adra;
  vec_rsc_0_0_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_0_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d_1;

  vec_rsc_0_1_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_9_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_1_i_qa,
      wea => vec_rsc_0_1_wea,
      da => vec_rsc_0_1_i_da,
      adra => vec_rsc_0_1_i_adra,
      adra_d => vec_rsc_0_1_i_adra_d,
      da_d => vec_rsc_0_1_i_da_d,
      qa_d => vec_rsc_0_1_i_qa_d_1,
      wea_d => vec_rsc_0_1_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_1_i_wea_d_iff
    );
  vec_rsc_0_1_i_qa <= vec_rsc_0_1_qa;
  vec_rsc_0_1_da <= vec_rsc_0_1_i_da;
  vec_rsc_0_1_adra <= vec_rsc_0_1_i_adra;
  vec_rsc_0_1_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_1_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d_1;

  vec_rsc_0_2_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_10_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_2_i_qa,
      wea => vec_rsc_0_2_wea,
      da => vec_rsc_0_2_i_da,
      adra => vec_rsc_0_2_i_adra,
      adra_d => vec_rsc_0_2_i_adra_d,
      da_d => vec_rsc_0_2_i_da_d,
      qa_d => vec_rsc_0_2_i_qa_d_1,
      wea_d => vec_rsc_0_2_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_2_i_wea_d_iff
    );
  vec_rsc_0_2_i_qa <= vec_rsc_0_2_qa;
  vec_rsc_0_2_da <= vec_rsc_0_2_i_da;
  vec_rsc_0_2_adra <= vec_rsc_0_2_i_adra;
  vec_rsc_0_2_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_2_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_2_i_qa_d <= vec_rsc_0_2_i_qa_d_1;

  vec_rsc_0_3_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_11_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_3_i_qa,
      wea => vec_rsc_0_3_wea,
      da => vec_rsc_0_3_i_da,
      adra => vec_rsc_0_3_i_adra,
      adra_d => vec_rsc_0_3_i_adra_d,
      da_d => vec_rsc_0_3_i_da_d,
      qa_d => vec_rsc_0_3_i_qa_d_1,
      wea_d => vec_rsc_0_3_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_3_i_wea_d_iff
    );
  vec_rsc_0_3_i_qa <= vec_rsc_0_3_qa;
  vec_rsc_0_3_da <= vec_rsc_0_3_i_da;
  vec_rsc_0_3_adra <= vec_rsc_0_3_i_adra;
  vec_rsc_0_3_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_3_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_3_i_qa_d <= vec_rsc_0_3_i_qa_d_1;

  vec_rsc_0_4_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_12_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_4_i_qa,
      wea => vec_rsc_0_4_wea,
      da => vec_rsc_0_4_i_da,
      adra => vec_rsc_0_4_i_adra,
      adra_d => vec_rsc_0_4_i_adra_d,
      da_d => vec_rsc_0_4_i_da_d,
      qa_d => vec_rsc_0_4_i_qa_d_1,
      wea_d => vec_rsc_0_4_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_4_i_wea_d_iff
    );
  vec_rsc_0_4_i_qa <= vec_rsc_0_4_qa;
  vec_rsc_0_4_da <= vec_rsc_0_4_i_da;
  vec_rsc_0_4_adra <= vec_rsc_0_4_i_adra;
  vec_rsc_0_4_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_4_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_4_i_qa_d <= vec_rsc_0_4_i_qa_d_1;

  vec_rsc_0_5_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_13_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_5_i_qa,
      wea => vec_rsc_0_5_wea,
      da => vec_rsc_0_5_i_da,
      adra => vec_rsc_0_5_i_adra,
      adra_d => vec_rsc_0_5_i_adra_d,
      da_d => vec_rsc_0_5_i_da_d,
      qa_d => vec_rsc_0_5_i_qa_d_1,
      wea_d => vec_rsc_0_5_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_5_i_wea_d_iff
    );
  vec_rsc_0_5_i_qa <= vec_rsc_0_5_qa;
  vec_rsc_0_5_da <= vec_rsc_0_5_i_da;
  vec_rsc_0_5_adra <= vec_rsc_0_5_i_adra;
  vec_rsc_0_5_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_5_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_5_i_qa_d <= vec_rsc_0_5_i_qa_d_1;

  vec_rsc_0_6_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_14_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_6_i_qa,
      wea => vec_rsc_0_6_wea,
      da => vec_rsc_0_6_i_da,
      adra => vec_rsc_0_6_i_adra,
      adra_d => vec_rsc_0_6_i_adra_d,
      da_d => vec_rsc_0_6_i_da_d,
      qa_d => vec_rsc_0_6_i_qa_d_1,
      wea_d => vec_rsc_0_6_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_6_i_wea_d_iff
    );
  vec_rsc_0_6_i_qa <= vec_rsc_0_6_qa;
  vec_rsc_0_6_da <= vec_rsc_0_6_i_da;
  vec_rsc_0_6_adra <= vec_rsc_0_6_i_adra;
  vec_rsc_0_6_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_6_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_6_i_qa_d <= vec_rsc_0_6_i_qa_d_1;

  vec_rsc_0_7_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_15_7_64_128_128_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_7_i_qa,
      wea => vec_rsc_0_7_wea,
      da => vec_rsc_0_7_i_da,
      adra => vec_rsc_0_7_i_adra,
      adra_d => vec_rsc_0_7_i_adra_d,
      da_d => vec_rsc_0_7_i_da_d,
      qa_d => vec_rsc_0_7_i_qa_d_1,
      wea_d => vec_rsc_0_7_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_7_i_wea_d_iff
    );
  vec_rsc_0_7_i_qa <= vec_rsc_0_7_qa;
  vec_rsc_0_7_da <= vec_rsc_0_7_i_da;
  vec_rsc_0_7_adra <= vec_rsc_0_7_i_adra;
  vec_rsc_0_7_i_adra_d <= vec_rsc_0_0_i_adra_d_iff;
  vec_rsc_0_7_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_7_i_qa_d <= vec_rsc_0_7_i_qa_d_1;

  inPlaceNTT_DIF_core_inst : inPlaceNTT_DIF_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      vec_rsc_triosy_0_2_lz => vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz => vec_rsc_triosy_0_3_lz,
      vec_rsc_triosy_0_4_lz => vec_rsc_triosy_0_4_lz,
      vec_rsc_triosy_0_5_lz => vec_rsc_triosy_0_5_lz,
      vec_rsc_triosy_0_6_lz => vec_rsc_triosy_0_6_lz,
      vec_rsc_triosy_0_7_lz => vec_rsc_triosy_0_7_lz,
      p_rsc_dat => inPlaceNTT_DIF_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_dat => inPlaceNTT_DIF_core_inst_r_rsc_dat,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      vec_rsc_0_0_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_qa_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_qa_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_2_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_qa_d,
      vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_qa_d,
      vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_4_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_qa_d,
      vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_5_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_qa_d,
      vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_6_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_qa_d,
      vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_7_i_qa_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_qa_d,
      vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_adra_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff,
      vec_rsc_0_2_i_wea_d_pff => vec_rsc_0_2_i_wea_d_iff,
      vec_rsc_0_3_i_wea_d_pff => vec_rsc_0_3_i_wea_d_iff,
      vec_rsc_0_4_i_wea_d_pff => vec_rsc_0_4_i_wea_d_iff,
      vec_rsc_0_5_i_wea_d_pff => vec_rsc_0_5_i_wea_d_iff,
      vec_rsc_0_6_i_wea_d_pff => vec_rsc_0_6_i_wea_d_iff,
      vec_rsc_0_7_i_wea_d_pff => vec_rsc_0_7_i_wea_d_iff
    );
  inPlaceNTT_DIF_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIF_core_inst_r_rsc_dat <= r_rsc_dat;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_qa_d <= vec_rsc_0_2_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_qa_d <= vec_rsc_0_3_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_qa_d <= vec_rsc_0_4_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_qa_d <= vec_rsc_0_5_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_qa_d <= vec_rsc_0_6_i_qa_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_qa_d <= vec_rsc_0_7_i_qa_d;
  vec_rsc_0_0_i_adra_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_adra_d_pff;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_da_d_pff;

END v6;



