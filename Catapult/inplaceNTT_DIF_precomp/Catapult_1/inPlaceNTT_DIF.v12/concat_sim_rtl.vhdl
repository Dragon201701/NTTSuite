
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

--------> ../td_ccore_solutions/modulo_dev_d3e65941ee7586d7daaa2e36d0d005555a5b_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Aug 26 01:37:25 2021
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
  SIGNAL result_rem_12_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_result_acc_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
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
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
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
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_102 : STD_LOGIC;
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
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL and_dcpl_157 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_160 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL and_dcpl_177 : STD_LOGIC;
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_183 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_189 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_196 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_221 : STD_LOGIC;
  SIGNAL and_dcpl_228 : STD_LOGIC;
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL and_dcpl_233 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_235 : STD_LOGIC;
  SIGNAL and_dcpl_237 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_260 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_263 : STD_LOGIC;
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL mux_tmp_1 : STD_LOGIC;
  SIGNAL and_dcpl_275 : STD_LOGIC;
  SIGNAL mux_tmp_3 : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL and_dcpl_281 : STD_LOGIC;
  SIGNAL mux_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_7 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL and_dcpl_287 : STD_LOGIC;
  SIGNAL mux_tmp_10 : STD_LOGIC;
  SIGNAL mux_tmp_11 : STD_LOGIC;
  SIGNAL mux_tmp_12 : STD_LOGIC;
  SIGNAL mux_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL mux_tmp_15 : STD_LOGIC;
  SIGNAL mux_tmp_16 : STD_LOGIC;
  SIGNAL mux_tmp_17 : STD_LOGIC;
  SIGNAL mux_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_19 : STD_LOGIC;
  SIGNAL and_dcpl_299 : STD_LOGIC;
  SIGNAL mux_tmp_21 : STD_LOGIC;
  SIGNAL mux_tmp_22 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL mux_tmp_24 : STD_LOGIC;
  SIGNAL mux_tmp_25 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL and_dcpl_305 : STD_LOGIC;
  SIGNAL mux_tmp_28 : STD_LOGIC;
  SIGNAL mux_tmp_29 : STD_LOGIC;
  SIGNAL mux_tmp_30 : STD_LOGIC;
  SIGNAL mux_tmp_31 : STD_LOGIC;
  SIGNAL mux_tmp_32 : STD_LOGIC;
  SIGNAL mux_tmp_33 : STD_LOGIC;
  SIGNAL mux_tmp_34 : STD_LOGIC;
  SIGNAL and_dcpl_311 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_36 : STD_LOGIC;
  SIGNAL mux_tmp_37 : STD_LOGIC;
  SIGNAL and_dcpl_318 : STD_LOGIC;
  SIGNAL and_dcpl_319 : STD_LOGIC;
  SIGNAL or_tmp_102 : STD_LOGIC;
  SIGNAL and_dcpl_322 : STD_LOGIC;
  SIGNAL mux_tmp_39 : STD_LOGIC;
  SIGNAL and_dcpl_325 : STD_LOGIC;
  SIGNAL mux_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_42 : STD_LOGIC;
  SIGNAL and_dcpl_329 : STD_LOGIC;
  SIGNAL mux_tmp_44 : STD_LOGIC;
  SIGNAL mux_tmp_45 : STD_LOGIC;
  SIGNAL mux_tmp_46 : STD_LOGIC;
  SIGNAL and_dcpl_333 : STD_LOGIC;
  SIGNAL mux_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_49 : STD_LOGIC;
  SIGNAL mux_tmp_50 : STD_LOGIC;
  SIGNAL mux_tmp_51 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL mux_tmp_53 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_56 : STD_LOGIC;
  SIGNAL mux_tmp_57 : STD_LOGIC;
  SIGNAL and_dcpl_341 : STD_LOGIC;
  SIGNAL mux_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_60 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_62 : STD_LOGIC;
  SIGNAL mux_tmp_63 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL and_dcpl_344 : STD_LOGIC;
  SIGNAL mux_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_67 : STD_LOGIC;
  SIGNAL mux_tmp_68 : STD_LOGIC;
  SIGNAL mux_tmp_69 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL mux_tmp_71 : STD_LOGIC;
  SIGNAL mux_tmp_72 : STD_LOGIC;
  SIGNAL and_dcpl_347 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL mux_tmp_74 : STD_LOGIC;
  SIGNAL mux_tmp_75 : STD_LOGIC;
  SIGNAL and_dcpl_352 : STD_LOGIC;
  SIGNAL and_dcpl_353 : STD_LOGIC;
  SIGNAL or_tmp_202 : STD_LOGIC;
  SIGNAL and_dcpl_357 : STD_LOGIC;
  SIGNAL mux_tmp_77 : STD_LOGIC;
  SIGNAL and_dcpl_361 : STD_LOGIC;
  SIGNAL mux_tmp_79 : STD_LOGIC;
  SIGNAL mux_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_364 : STD_LOGIC;
  SIGNAL mux_tmp_82 : STD_LOGIC;
  SIGNAL mux_tmp_83 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL and_dcpl_367 : STD_LOGIC;
  SIGNAL mux_tmp_86 : STD_LOGIC;
  SIGNAL mux_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_88 : STD_LOGIC;
  SIGNAL mux_tmp_89 : STD_LOGIC;
  SIGNAL and_dcpl_370 : STD_LOGIC;
  SIGNAL mux_tmp_91 : STD_LOGIC;
  SIGNAL mux_tmp_92 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL mux_tmp_94 : STD_LOGIC;
  SIGNAL mux_tmp_95 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL mux_tmp_97 : STD_LOGIC;
  SIGNAL mux_tmp_98 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL mux_tmp_101 : STD_LOGIC;
  SIGNAL mux_tmp_102 : STD_LOGIC;
  SIGNAL and_dcpl_377 : STD_LOGIC;
  SIGNAL mux_tmp_104 : STD_LOGIC;
  SIGNAL mux_tmp_105 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_107 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL mux_tmp_109 : STD_LOGIC;
  SIGNAL mux_tmp_110 : STD_LOGIC;
  SIGNAL and_dcpl_381 : STD_LOGIC;
  SIGNAL and_tmp_20 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL and_dcpl_386 : STD_LOGIC;
  SIGNAL and_dcpl_387 : STD_LOGIC;
  SIGNAL or_tmp_302 : STD_LOGIC;
  SIGNAL and_dcpl_390 : STD_LOGIC;
  SIGNAL mux_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL mux_tmp_118 : STD_LOGIC;
  SIGNAL and_dcpl_396 : STD_LOGIC;
  SIGNAL mux_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL mux_tmp_122 : STD_LOGIC;
  SIGNAL and_dcpl_399 : STD_LOGIC;
  SIGNAL mux_tmp_124 : STD_LOGIC;
  SIGNAL mux_tmp_125 : STD_LOGIC;
  SIGNAL mux_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_127 : STD_LOGIC;
  SIGNAL and_dcpl_402 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL mux_tmp_130 : STD_LOGIC;
  SIGNAL mux_tmp_131 : STD_LOGIC;
  SIGNAL mux_tmp_132 : STD_LOGIC;
  SIGNAL mux_tmp_133 : STD_LOGIC;
  SIGNAL and_dcpl_405 : STD_LOGIC;
  SIGNAL mux_tmp_135 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_139 : STD_LOGIC;
  SIGNAL mux_tmp_140 : STD_LOGIC;
  SIGNAL and_dcpl_408 : STD_LOGIC;
  SIGNAL mux_tmp_142 : STD_LOGIC;
  SIGNAL mux_tmp_143 : STD_LOGIC;
  SIGNAL mux_tmp_144 : STD_LOGIC;
  SIGNAL mux_tmp_145 : STD_LOGIC;
  SIGNAL mux_tmp_146 : STD_LOGIC;
  SIGNAL mux_tmp_147 : STD_LOGIC;
  SIGNAL mux_tmp_148 : STD_LOGIC;
  SIGNAL and_dcpl_411 : STD_LOGIC;
  SIGNAL and_tmp_27 : STD_LOGIC;
  SIGNAL mux_tmp_150 : STD_LOGIC;
  SIGNAL mux_tmp_151 : STD_LOGIC;
  SIGNAL and_dcpl_417 : STD_LOGIC;
  SIGNAL and_dcpl_418 : STD_LOGIC;
  SIGNAL or_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_422 : STD_LOGIC;
  SIGNAL mux_tmp_153 : STD_LOGIC;
  SIGNAL and_dcpl_426 : STD_LOGIC;
  SIGNAL mux_tmp_155 : STD_LOGIC;
  SIGNAL mux_tmp_156 : STD_LOGIC;
  SIGNAL and_dcpl_430 : STD_LOGIC;
  SIGNAL mux_tmp_158 : STD_LOGIC;
  SIGNAL mux_tmp_159 : STD_LOGIC;
  SIGNAL mux_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_433 : STD_LOGIC;
  SIGNAL mux_tmp_162 : STD_LOGIC;
  SIGNAL mux_tmp_163 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL and_dcpl_437 : STD_LOGIC;
  SIGNAL mux_tmp_167 : STD_LOGIC;
  SIGNAL mux_tmp_168 : STD_LOGIC;
  SIGNAL mux_tmp_169 : STD_LOGIC;
  SIGNAL mux_tmp_170 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL and_dcpl_441 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL mux_tmp_174 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL mux_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_178 : STD_LOGIC;
  SIGNAL and_dcpl_444 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL mux_tmp_181 : STD_LOGIC;
  SIGNAL mux_tmp_182 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_186 : STD_LOGIC;
  SIGNAL and_dcpl_447 : STD_LOGIC;
  SIGNAL and_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_188 : STD_LOGIC;
  SIGNAL mux_tmp_189 : STD_LOGIC;
  SIGNAL and_dcpl_452 : STD_LOGIC;
  SIGNAL or_tmp_502 : STD_LOGIC;
  SIGNAL and_dcpl_455 : STD_LOGIC;
  SIGNAL mux_tmp_191 : STD_LOGIC;
  SIGNAL and_dcpl_458 : STD_LOGIC;
  SIGNAL mux_tmp_193 : STD_LOGIC;
  SIGNAL mux_tmp_194 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL mux_tmp_196 : STD_LOGIC;
  SIGNAL mux_tmp_197 : STD_LOGIC;
  SIGNAL mux_tmp_198 : STD_LOGIC;
  SIGNAL and_dcpl_464 : STD_LOGIC;
  SIGNAL mux_tmp_200 : STD_LOGIC;
  SIGNAL mux_tmp_201 : STD_LOGIC;
  SIGNAL mux_tmp_202 : STD_LOGIC;
  SIGNAL mux_tmp_203 : STD_LOGIC;
  SIGNAL and_dcpl_468 : STD_LOGIC;
  SIGNAL mux_tmp_205 : STD_LOGIC;
  SIGNAL mux_tmp_206 : STD_LOGIC;
  SIGNAL mux_tmp_207 : STD_LOGIC;
  SIGNAL mux_tmp_208 : STD_LOGIC;
  SIGNAL mux_tmp_209 : STD_LOGIC;
  SIGNAL and_dcpl_472 : STD_LOGIC;
  SIGNAL mux_tmp_211 : STD_LOGIC;
  SIGNAL mux_tmp_212 : STD_LOGIC;
  SIGNAL mux_tmp_213 : STD_LOGIC;
  SIGNAL mux_tmp_214 : STD_LOGIC;
  SIGNAL mux_tmp_215 : STD_LOGIC;
  SIGNAL mux_tmp_216 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL mux_tmp_218 : STD_LOGIC;
  SIGNAL mux_tmp_219 : STD_LOGIC;
  SIGNAL mux_tmp_220 : STD_LOGIC;
  SIGNAL mux_tmp_221 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_223 : STD_LOGIC;
  SIGNAL mux_tmp_224 : STD_LOGIC;
  SIGNAL and_dcpl_476 : STD_LOGIC;
  SIGNAL and_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_226 : STD_LOGIC;
  SIGNAL mux_tmp_227 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL or_tmp_602 : STD_LOGIC;
  SIGNAL and_dcpl_484 : STD_LOGIC;
  SIGNAL mux_tmp_229 : STD_LOGIC;
  SIGNAL and_dcpl_488 : STD_LOGIC;
  SIGNAL mux_tmp_231 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL and_dcpl_491 : STD_LOGIC;
  SIGNAL mux_tmp_234 : STD_LOGIC;
  SIGNAL mux_tmp_235 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL and_dcpl_493 : STD_LOGIC;
  SIGNAL mux_tmp_238 : STD_LOGIC;
  SIGNAL mux_tmp_239 : STD_LOGIC;
  SIGNAL mux_tmp_240 : STD_LOGIC;
  SIGNAL mux_tmp_241 : STD_LOGIC;
  SIGNAL and_dcpl_496 : STD_LOGIC;
  SIGNAL mux_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_244 : STD_LOGIC;
  SIGNAL mux_tmp_245 : STD_LOGIC;
  SIGNAL mux_tmp_246 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL and_dcpl_499 : STD_LOGIC;
  SIGNAL mux_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_250 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL mux_tmp_252 : STD_LOGIC;
  SIGNAL mux_tmp_253 : STD_LOGIC;
  SIGNAL mux_tmp_254 : STD_LOGIC;
  SIGNAL and_dcpl_501 : STD_LOGIC;
  SIGNAL mux_tmp_256 : STD_LOGIC;
  SIGNAL mux_tmp_257 : STD_LOGIC;
  SIGNAL mux_tmp_258 : STD_LOGIC;
  SIGNAL mux_tmp_259 : STD_LOGIC;
  SIGNAL mux_tmp_260 : STD_LOGIC;
  SIGNAL mux_tmp_261 : STD_LOGIC;
  SIGNAL mux_tmp_262 : STD_LOGIC;
  SIGNAL and_dcpl_503 : STD_LOGIC;
  SIGNAL and_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL and_dcpl_507 : STD_LOGIC;
  SIGNAL or_tmp_702 : STD_LOGIC;
  SIGNAL and_dcpl_510 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL and_dcpl_513 : STD_LOGIC;
  SIGNAL mux_tmp_269 : STD_LOGIC;
  SIGNAL mux_tmp_270 : STD_LOGIC;
  SIGNAL and_dcpl_516 : STD_LOGIC;
  SIGNAL mux_tmp_272 : STD_LOGIC;
  SIGNAL mux_tmp_273 : STD_LOGIC;
  SIGNAL mux_tmp_274 : STD_LOGIC;
  SIGNAL and_dcpl_518 : STD_LOGIC;
  SIGNAL mux_tmp_276 : STD_LOGIC;
  SIGNAL mux_tmp_277 : STD_LOGIC;
  SIGNAL mux_tmp_278 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL and_dcpl_521 : STD_LOGIC;
  SIGNAL mux_tmp_281 : STD_LOGIC;
  SIGNAL mux_tmp_282 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL mux_tmp_284 : STD_LOGIC;
  SIGNAL mux_tmp_285 : STD_LOGIC;
  SIGNAL and_dcpl_524 : STD_LOGIC;
  SIGNAL mux_tmp_287 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL mux_tmp_289 : STD_LOGIC;
  SIGNAL mux_tmp_290 : STD_LOGIC;
  SIGNAL mux_tmp_291 : STD_LOGIC;
  SIGNAL mux_tmp_292 : STD_LOGIC;
  SIGNAL and_dcpl_526 : STD_LOGIC;
  SIGNAL mux_tmp_294 : STD_LOGIC;
  SIGNAL mux_tmp_295 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL mux_tmp_297 : STD_LOGIC;
  SIGNAL mux_tmp_298 : STD_LOGIC;
  SIGNAL mux_tmp_299 : STD_LOGIC;
  SIGNAL mux_tmp_300 : STD_LOGIC;
  SIGNAL and_dcpl_528 : STD_LOGIC;
  SIGNAL and_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_302 : STD_LOGIC;
  SIGNAL mux_tmp_303 : STD_LOGIC;
  SIGNAL and_dcpl_532 : STD_LOGIC;
  SIGNAL and_dcpl_533 : STD_LOGIC;
  SIGNAL not_tmp_645 : STD_LOGIC;
  SIGNAL or_tmp_801 : STD_LOGIC;
  SIGNAL and_dcpl_536 : STD_LOGIC;
  SIGNAL mux_tmp_305 : STD_LOGIC;
  SIGNAL and_dcpl_539 : STD_LOGIC;
  SIGNAL mux_tmp_307 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL and_dcpl_542 : STD_LOGIC;
  SIGNAL mux_tmp_310 : STD_LOGIC;
  SIGNAL mux_tmp_311 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL and_dcpl_546 : STD_LOGIC;
  SIGNAL mux_tmp_314 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_316 : STD_LOGIC;
  SIGNAL mux_tmp_317 : STD_LOGIC;
  SIGNAL and_dcpl_549 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL mux_tmp_320 : STD_LOGIC;
  SIGNAL mux_tmp_321 : STD_LOGIC;
  SIGNAL mux_tmp_322 : STD_LOGIC;
  SIGNAL mux_tmp_323 : STD_LOGIC;
  SIGNAL and_dcpl_552 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL mux_tmp_327 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_329 : STD_LOGIC;
  SIGNAL mux_tmp_330 : STD_LOGIC;
  SIGNAL and_dcpl_556 : STD_LOGIC;
  SIGNAL mux_tmp_332 : STD_LOGIC;
  SIGNAL mux_tmp_333 : STD_LOGIC;
  SIGNAL mux_tmp_334 : STD_LOGIC;
  SIGNAL mux_tmp_335 : STD_LOGIC;
  SIGNAL mux_tmp_336 : STD_LOGIC;
  SIGNAL mux_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL and_dcpl_560 : STD_LOGIC;
  SIGNAL or_tmp_897 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL mux_tmp_341 : STD_LOGIC;
  SIGNAL mux_tmp_342 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL mux_tmp_344 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_347 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL and_dcpl_566 : STD_LOGIC;
  SIGNAL or_tmp_909 : STD_LOGIC;
  SIGNAL and_dcpl_568 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL and_dcpl_570 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_353 : STD_LOGIC;
  SIGNAL and_dcpl_572 : STD_LOGIC;
  SIGNAL mux_tmp_355 : STD_LOGIC;
  SIGNAL mux_tmp_356 : STD_LOGIC;
  SIGNAL mux_tmp_357 : STD_LOGIC;
  SIGNAL and_dcpl_576 : STD_LOGIC;
  SIGNAL mux_tmp_359 : STD_LOGIC;
  SIGNAL mux_tmp_360 : STD_LOGIC;
  SIGNAL mux_tmp_361 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL and_dcpl_578 : STD_LOGIC;
  SIGNAL mux_tmp_364 : STD_LOGIC;
  SIGNAL mux_tmp_365 : STD_LOGIC;
  SIGNAL mux_tmp_366 : STD_LOGIC;
  SIGNAL mux_tmp_367 : STD_LOGIC;
  SIGNAL mux_tmp_368 : STD_LOGIC;
  SIGNAL and_dcpl_580 : STD_LOGIC;
  SIGNAL mux_tmp_370 : STD_LOGIC;
  SIGNAL mux_tmp_371 : STD_LOGIC;
  SIGNAL mux_tmp_372 : STD_LOGIC;
  SIGNAL mux_tmp_373 : STD_LOGIC;
  SIGNAL mux_tmp_374 : STD_LOGIC;
  SIGNAL mux_tmp_375 : STD_LOGIC;
  SIGNAL and_dcpl_583 : STD_LOGIC;
  SIGNAL mux_tmp_377 : STD_LOGIC;
  SIGNAL mux_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_381 : STD_LOGIC;
  SIGNAL mux_tmp_382 : STD_LOGIC;
  SIGNAL mux_tmp_383 : STD_LOGIC;
  SIGNAL and_dcpl_586 : STD_LOGIC;
  SIGNAL or_tmp_1005 : STD_LOGIC;
  SIGNAL mux_tmp_385 : STD_LOGIC;
  SIGNAL mux_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL mux_tmp_388 : STD_LOGIC;
  SIGNAL mux_tmp_389 : STD_LOGIC;
  SIGNAL mux_tmp_390 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL mux_tmp_392 : STD_LOGIC;
  SIGNAL mux_tmp_393 : STD_LOGIC;
  SIGNAL and_dcpl_590 : STD_LOGIC;
  SIGNAL or_tmp_1017 : STD_LOGIC;
  SIGNAL and_dcpl_592 : STD_LOGIC;
  SIGNAL mux_tmp_395 : STD_LOGIC;
  SIGNAL and_dcpl_594 : STD_LOGIC;
  SIGNAL mux_tmp_397 : STD_LOGIC;
  SIGNAL mux_tmp_398 : STD_LOGIC;
  SIGNAL and_dcpl_596 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL mux_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_599 : STD_LOGIC;
  SIGNAL mux_tmp_404 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL mux_tmp_406 : STD_LOGIC;
  SIGNAL mux_tmp_407 : STD_LOGIC;
  SIGNAL and_dcpl_601 : STD_LOGIC;
  SIGNAL mux_tmp_409 : STD_LOGIC;
  SIGNAL mux_tmp_410 : STD_LOGIC;
  SIGNAL mux_tmp_411 : STD_LOGIC;
  SIGNAL mux_tmp_412 : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL and_dcpl_603 : STD_LOGIC;
  SIGNAL mux_tmp_415 : STD_LOGIC;
  SIGNAL mux_tmp_416 : STD_LOGIC;
  SIGNAL mux_tmp_417 : STD_LOGIC;
  SIGNAL mux_tmp_418 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL mux_tmp_420 : STD_LOGIC;
  SIGNAL and_dcpl_607 : STD_LOGIC;
  SIGNAL mux_tmp_422 : STD_LOGIC;
  SIGNAL mux_tmp_423 : STD_LOGIC;
  SIGNAL mux_tmp_424 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_426 : STD_LOGIC;
  SIGNAL mux_tmp_427 : STD_LOGIC;
  SIGNAL mux_tmp_428 : STD_LOGIC;
  SIGNAL and_dcpl_611 : STD_LOGIC;
  SIGNAL or_tmp_1113 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL mux_tmp_431 : STD_LOGIC;
  SIGNAL mux_tmp_432 : STD_LOGIC;
  SIGNAL mux_tmp_433 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_435 : STD_LOGIC;
  SIGNAL mux_tmp_436 : STD_LOGIC;
  SIGNAL mux_tmp_437 : STD_LOGIC;
  SIGNAL mux_tmp_438 : STD_LOGIC;
  SIGNAL main_stage_0_11 : STD_LOGIC;
  SIGNAL asn_itm_10 : STD_LOGIC;
  SIGNAL result_rem_11cyc_st_9 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_8 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_7 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_11 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL asn_itm_11 : STD_LOGIC;
  SIGNAL main_stage_0_12 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL asn_itm_2 : STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL asn_itm_3 : STD_LOGIC;
  SIGNAL main_stage_0_5 : STD_LOGIC;
  SIGNAL asn_itm_4 : STD_LOGIC;
  SIGNAL main_stage_0_6 : STD_LOGIC;
  SIGNAL asn_itm_5 : STD_LOGIC;
  SIGNAL main_stage_0_7 : STD_LOGIC;
  SIGNAL asn_itm_6 : STD_LOGIC;
  SIGNAL main_stage_0_8 : STD_LOGIC;
  SIGNAL asn_itm_7 : STD_LOGIC;
  SIGNAL main_stage_0_9 : STD_LOGIC;
  SIGNAL asn_itm_8 : STD_LOGIC;
  SIGNAL main_stage_0_10 : STD_LOGIC;
  SIGNAL asn_itm_9 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL result_and_1_cse : STD_LOGIC;
  SIGNAL result_and_3_cse : STD_LOGIC;
  SIGNAL result_and_5_cse : STD_LOGIC;
  SIGNAL result_and_7_cse : STD_LOGIC;
  SIGNAL result_and_9_cse : STD_LOGIC;
  SIGNAL result_and_11_cse : STD_LOGIC;
  SIGNAL result_and_13_cse : STD_LOGIC;
  SIGNAL result_and_15_cse : STD_LOGIC;
  SIGNAL result_and_17_cse : STD_LOGIC;
  SIGNAL result_and_19_cse : STD_LOGIC;
  SIGNAL result_and_21_cse : STD_LOGIC;
  SIGNAL or_3_cse : STD_LOGIC;
  SIGNAL or_8_cse : STD_LOGIC;
  SIGNAL or_15_cse : STD_LOGIC;
  SIGNAL or_24_cse : STD_LOGIC;
  SIGNAL or_35_cse : STD_LOGIC;
  SIGNAL or_48_cse : STD_LOGIC;
  SIGNAL or_63_cse : STD_LOGIC;
  SIGNAL or_107_cse : STD_LOGIC;
  SIGNAL or_112_cse : STD_LOGIC;
  SIGNAL or_119_cse : STD_LOGIC;
  SIGNAL or_128_cse : STD_LOGIC;
  SIGNAL or_139_cse : STD_LOGIC;
  SIGNAL or_152_cse : STD_LOGIC;
  SIGNAL or_167_cse : STD_LOGIC;
  SIGNAL or_209_cse : STD_LOGIC;
  SIGNAL or_214_cse : STD_LOGIC;
  SIGNAL or_221_cse : STD_LOGIC;
  SIGNAL or_230_cse : STD_LOGIC;
  SIGNAL or_241_cse : STD_LOGIC;
  SIGNAL or_254_cse : STD_LOGIC;
  SIGNAL or_269_cse : STD_LOGIC;
  SIGNAL or_311_cse : STD_LOGIC;
  SIGNAL or_316_cse : STD_LOGIC;
  SIGNAL or_323_cse : STD_LOGIC;
  SIGNAL or_332_cse : STD_LOGIC;
  SIGNAL or_343_cse : STD_LOGIC;
  SIGNAL or_356_cse : STD_LOGIC;
  SIGNAL or_371_cse : STD_LOGIC;
  SIGNAL nand_144_cse : STD_LOGIC;
  SIGNAL or_413_cse : STD_LOGIC;
  SIGNAL or_418_cse : STD_LOGIC;
  SIGNAL or_425_cse : STD_LOGIC;
  SIGNAL or_434_cse : STD_LOGIC;
  SIGNAL or_445_cse : STD_LOGIC;
  SIGNAL or_458_cse : STD_LOGIC;
  SIGNAL or_473_cse : STD_LOGIC;
  SIGNAL nand_138_cse : STD_LOGIC;
  SIGNAL or_516_cse : STD_LOGIC;
  SIGNAL or_521_cse : STD_LOGIC;
  SIGNAL or_528_cse : STD_LOGIC;
  SIGNAL or_537_cse : STD_LOGIC;
  SIGNAL and_790_cse : STD_LOGIC;
  SIGNAL or_548_cse : STD_LOGIC;
  SIGNAL or_561_cse : STD_LOGIC;
  SIGNAL or_576_cse : STD_LOGIC;
  SIGNAL nand_146_cse : STD_LOGIC;
  SIGNAL or_617_cse : STD_LOGIC;
  SIGNAL or_622_cse : STD_LOGIC;
  SIGNAL or_629_cse : STD_LOGIC;
  SIGNAL or_638_cse : STD_LOGIC;
  SIGNAL or_649_cse : STD_LOGIC;
  SIGNAL or_662_cse : STD_LOGIC;
  SIGNAL or_677_cse : STD_LOGIC;
  SIGNAL or_718_cse : STD_LOGIC;
  SIGNAL nand_112_cse : STD_LOGIC;
  SIGNAL nand_108_cse : STD_LOGIC;
  SIGNAL nand_103_cse : STD_LOGIC;
  SIGNAL nand_97_cse : STD_LOGIC;
  SIGNAL or_763_cse : STD_LOGIC;
  SIGNAL nand_83_cse : STD_LOGIC;
  SIGNAL or_818_cse : STD_LOGIC;
  SIGNAL or_823_cse : STD_LOGIC;
  SIGNAL or_830_cse : STD_LOGIC;
  SIGNAL or_839_cse : STD_LOGIC;
  SIGNAL nand_58_cse : STD_LOGIC;
  SIGNAL or_850_cse : STD_LOGIC;
  SIGNAL nand_55_cse : STD_LOGIC;
  SIGNAL or_863_cse : STD_LOGIC;
  SIGNAL nand_51_cse : STD_LOGIC;
  SIGNAL or_878_cse : STD_LOGIC;
  SIGNAL and_749_cse : STD_LOGIC;
  SIGNAL or_928_cse : STD_LOGIC;
  SIGNAL and_747_cse : STD_LOGIC;
  SIGNAL or_933_cse : STD_LOGIC;
  SIGNAL and_744_cse : STD_LOGIC;
  SIGNAL or_940_cse : STD_LOGIC;
  SIGNAL and_740_cse : STD_LOGIC;
  SIGNAL or_949_cse : STD_LOGIC;
  SIGNAL or_960_cse : STD_LOGIC;
  SIGNAL and_731_cse : STD_LOGIC;
  SIGNAL or_973_cse : STD_LOGIC;
  SIGNAL and_725_cse : STD_LOGIC;
  SIGNAL nand_42_cse : STD_LOGIC;
  SIGNAL or_988_cse : STD_LOGIC;
  SIGNAL or_1037_cse : STD_LOGIC;
  SIGNAL or_1042_cse : STD_LOGIC;
  SIGNAL or_1049_cse : STD_LOGIC;
  SIGNAL or_1058_cse : STD_LOGIC;
  SIGNAL or_1069_cse : STD_LOGIC;
  SIGNAL or_1082_cse : STD_LOGIC;
  SIGNAL or_1097_cse : STD_LOGIC;
  SIGNAL base_buf_sva_mut_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_10 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL return_rsci_d_mx0c0 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c1 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c2 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c3 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c4 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c5 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c6 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c7 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c8 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c9 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c10 : STD_LOGIC;
  SIGNAL result_acc_imod_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_acc_idiv_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL m_and_cse : STD_LOGIC;
  SIGNAL m_and_1_cse : STD_LOGIC;
  SIGNAL m_and_2_cse : STD_LOGIC;
  SIGNAL m_and_3_cse : STD_LOGIC;
  SIGNAL m_and_4_cse : STD_LOGIC;
  SIGNAL m_and_5_cse : STD_LOGIC;
  SIGNAL m_and_6_cse : STD_LOGIC;
  SIGNAL m_and_7_cse : STD_LOGIC;
  SIGNAL m_and_8_cse : STD_LOGIC;
  SIGNAL m_and_9_cse : STD_LOGIC;
  SIGNAL m_and_10_cse : STD_LOGIC;
  SIGNAL m_and_11_cse : STD_LOGIC;
  SIGNAL m_and_12_cse : STD_LOGIC;
  SIGNAL m_and_13_cse : STD_LOGIC;
  SIGNAL m_and_14_cse : STD_LOGIC;
  SIGNAL m_and_15_cse : STD_LOGIC;
  SIGNAL m_and_16_cse : STD_LOGIC;
  SIGNAL m_and_17_cse : STD_LOGIC;
  SIGNAL m_and_18_cse : STD_LOGIC;
  SIGNAL m_and_19_cse : STD_LOGIC;
  SIGNAL m_and_20_cse : STD_LOGIC;
  SIGNAL m_and_21_cse : STD_LOGIC;
  SIGNAL m_and_22_cse : STD_LOGIC;
  SIGNAL m_and_23_cse : STD_LOGIC;
  SIGNAL m_and_24_cse : STD_LOGIC;
  SIGNAL m_and_25_cse : STD_LOGIC;
  SIGNAL m_and_26_cse : STD_LOGIC;
  SIGNAL m_and_27_cse : STD_LOGIC;
  SIGNAL m_and_28_cse : STD_LOGIC;
  SIGNAL m_and_29_cse : STD_LOGIC;
  SIGNAL m_and_30_cse : STD_LOGIC;
  SIGNAL m_and_31_cse : STD_LOGIC;
  SIGNAL m_and_32_cse : STD_LOGIC;
  SIGNAL m_and_33_cse : STD_LOGIC;
  SIGNAL m_and_34_cse : STD_LOGIC;
  SIGNAL m_and_35_cse : STD_LOGIC;
  SIGNAL m_and_36_cse : STD_LOGIC;
  SIGNAL m_and_37_cse : STD_LOGIC;
  SIGNAL m_and_38_cse : STD_LOGIC;
  SIGNAL m_and_39_cse : STD_LOGIC;
  SIGNAL m_and_40_cse : STD_LOGIC;
  SIGNAL m_and_41_cse : STD_LOGIC;
  SIGNAL m_and_42_cse : STD_LOGIC;
  SIGNAL m_and_43_cse : STD_LOGIC;
  SIGNAL m_and_44_cse : STD_LOGIC;
  SIGNAL m_and_45_cse : STD_LOGIC;
  SIGNAL m_and_46_cse : STD_LOGIC;
  SIGNAL m_and_47_cse : STD_LOGIC;
  SIGNAL m_and_48_cse : STD_LOGIC;
  SIGNAL m_and_49_cse : STD_LOGIC;
  SIGNAL m_and_50_cse : STD_LOGIC;
  SIGNAL m_and_51_cse : STD_LOGIC;
  SIGNAL m_and_52_cse : STD_LOGIC;
  SIGNAL m_and_53_cse : STD_LOGIC;
  SIGNAL m_and_54_cse : STD_LOGIC;
  SIGNAL m_and_55_cse : STD_LOGIC;
  SIGNAL m_and_56_cse : STD_LOGIC;
  SIGNAL m_and_57_cse : STD_LOGIC;
  SIGNAL m_and_58_cse : STD_LOGIC;
  SIGNAL m_and_59_cse : STD_LOGIC;
  SIGNAL m_and_60_cse : STD_LOGIC;
  SIGNAL m_and_61_cse : STD_LOGIC;
  SIGNAL m_and_62_cse : STD_LOGIC;
  SIGNAL m_and_63_cse : STD_LOGIC;
  SIGNAL m_and_64_cse : STD_LOGIC;
  SIGNAL m_and_65_cse : STD_LOGIC;
  SIGNAL m_and_66_cse : STD_LOGIC;
  SIGNAL m_and_67_cse : STD_LOGIC;
  SIGNAL m_and_68_cse : STD_LOGIC;
  SIGNAL m_and_69_cse : STD_LOGIC;
  SIGNAL m_and_70_cse : STD_LOGIC;
  SIGNAL m_and_71_cse : STD_LOGIC;
  SIGNAL m_and_72_cse : STD_LOGIC;
  SIGNAL m_and_73_cse : STD_LOGIC;
  SIGNAL m_and_74_cse : STD_LOGIC;
  SIGNAL m_and_75_cse : STD_LOGIC;
  SIGNAL m_and_76_cse : STD_LOGIC;
  SIGNAL m_and_77_cse : STD_LOGIC;
  SIGNAL m_and_78_cse : STD_LOGIC;
  SIGNAL m_and_79_cse : STD_LOGIC;
  SIGNAL m_and_80_cse : STD_LOGIC;
  SIGNAL m_and_81_cse : STD_LOGIC;
  SIGNAL m_and_82_cse : STD_LOGIC;
  SIGNAL m_and_83_cse : STD_LOGIC;
  SIGNAL m_and_84_cse : STD_LOGIC;
  SIGNAL m_and_85_cse : STD_LOGIC;
  SIGNAL m_and_86_cse : STD_LOGIC;
  SIGNAL m_and_87_cse : STD_LOGIC;
  SIGNAL m_and_88_cse : STD_LOGIC;
  SIGNAL m_and_89_cse : STD_LOGIC;
  SIGNAL m_and_90_cse : STD_LOGIC;
  SIGNAL m_and_91_cse : STD_LOGIC;
  SIGNAL m_and_92_cse : STD_LOGIC;
  SIGNAL m_and_93_cse : STD_LOGIC;
  SIGNAL m_and_94_cse : STD_LOGIC;
  SIGNAL m_and_95_cse : STD_LOGIC;
  SIGNAL m_and_96_cse : STD_LOGIC;
  SIGNAL m_and_97_cse : STD_LOGIC;
  SIGNAL m_and_98_cse : STD_LOGIC;

  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_691_nl : STD_LOGIC;
  SIGNAL nor_690_nl : STD_LOGIC;
  SIGNAL or_10_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL nor_689_nl : STD_LOGIC;
  SIGNAL nor_687_nl : STD_LOGIC;
  SIGNAL or_17_nl : STD_LOGIC;
  SIGNAL nor_688_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL nor_686_nl : STD_LOGIC;
  SIGNAL nor_683_nl : STD_LOGIC;
  SIGNAL or_26_nl : STD_LOGIC;
  SIGNAL nor_684_nl : STD_LOGIC;
  SIGNAL nor_685_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL nor_682_nl : STD_LOGIC;
  SIGNAL nor_678_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL nor_679_nl : STD_LOGIC;
  SIGNAL nor_680_nl : STD_LOGIC;
  SIGNAL nor_681_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL nor_677_nl : STD_LOGIC;
  SIGNAL nor_672_nl : STD_LOGIC;
  SIGNAL or_50_nl : STD_LOGIC;
  SIGNAL nor_673_nl : STD_LOGIC;
  SIGNAL nor_674_nl : STD_LOGIC;
  SIGNAL nor_675_nl : STD_LOGIC;
  SIGNAL nor_676_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL nor_671_nl : STD_LOGIC;
  SIGNAL nor_665_nl : STD_LOGIC;
  SIGNAL or_65_nl : STD_LOGIC;
  SIGNAL nor_666_nl : STD_LOGIC;
  SIGNAL nor_667_nl : STD_LOGIC;
  SIGNAL nor_668_nl : STD_LOGIC;
  SIGNAL nor_669_nl : STD_LOGIC;
  SIGNAL nor_670_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL nor_664_nl : STD_LOGIC;
  SIGNAL nor_656_nl : STD_LOGIC;
  SIGNAL or_82_nl : STD_LOGIC;
  SIGNAL or_80_nl : STD_LOGIC;
  SIGNAL nor_657_nl : STD_LOGIC;
  SIGNAL nor_658_nl : STD_LOGIC;
  SIGNAL nor_659_nl : STD_LOGIC;
  SIGNAL nor_660_nl : STD_LOGIC;
  SIGNAL nor_661_nl : STD_LOGIC;
  SIGNAL nor_662_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL nor_663_nl : STD_LOGIC;
  SIGNAL nor_654_nl : STD_LOGIC;
  SIGNAL nor_655_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL nor_653_nl : STD_LOGIC;
  SIGNAL nor_652_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL nor_651_nl : STD_LOGIC;
  SIGNAL nor_649_nl : STD_LOGIC;
  SIGNAL or_121_nl : STD_LOGIC;
  SIGNAL nor_650_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL nor_648_nl : STD_LOGIC;
  SIGNAL nor_645_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL nor_646_nl : STD_LOGIC;
  SIGNAL nor_647_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL nor_644_nl : STD_LOGIC;
  SIGNAL nor_640_nl : STD_LOGIC;
  SIGNAL or_141_nl : STD_LOGIC;
  SIGNAL nor_641_nl : STD_LOGIC;
  SIGNAL nor_642_nl : STD_LOGIC;
  SIGNAL nor_643_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL nor_639_nl : STD_LOGIC;
  SIGNAL nor_634_nl : STD_LOGIC;
  SIGNAL or_154_nl : STD_LOGIC;
  SIGNAL nor_635_nl : STD_LOGIC;
  SIGNAL nor_636_nl : STD_LOGIC;
  SIGNAL nor_637_nl : STD_LOGIC;
  SIGNAL nor_638_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nor_633_nl : STD_LOGIC;
  SIGNAL nor_627_nl : STD_LOGIC;
  SIGNAL or_169_nl : STD_LOGIC;
  SIGNAL nor_628_nl : STD_LOGIC;
  SIGNAL nor_629_nl : STD_LOGIC;
  SIGNAL nor_630_nl : STD_LOGIC;
  SIGNAL nor_631_nl : STD_LOGIC;
  SIGNAL nor_632_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL nor_626_nl : STD_LOGIC;
  SIGNAL nor_618_nl : STD_LOGIC;
  SIGNAL or_186_nl : STD_LOGIC;
  SIGNAL or_184_nl : STD_LOGIC;
  SIGNAL nor_619_nl : STD_LOGIC;
  SIGNAL nor_620_nl : STD_LOGIC;
  SIGNAL nor_621_nl : STD_LOGIC;
  SIGNAL nor_622_nl : STD_LOGIC;
  SIGNAL nor_623_nl : STD_LOGIC;
  SIGNAL nor_624_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL nor_625_nl : STD_LOGIC;
  SIGNAL nor_617_nl : STD_LOGIC;
  SIGNAL and_797_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL nor_616_nl : STD_LOGIC;
  SIGNAL nor_615_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL nor_614_nl : STD_LOGIC;
  SIGNAL nor_612_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL nor_613_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nor_611_nl : STD_LOGIC;
  SIGNAL nor_608_nl : STD_LOGIC;
  SIGNAL or_232_nl : STD_LOGIC;
  SIGNAL nor_609_nl : STD_LOGIC;
  SIGNAL nor_610_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL nor_607_nl : STD_LOGIC;
  SIGNAL nor_603_nl : STD_LOGIC;
  SIGNAL or_243_nl : STD_LOGIC;
  SIGNAL nor_604_nl : STD_LOGIC;
  SIGNAL nor_605_nl : STD_LOGIC;
  SIGNAL nor_606_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL nor_602_nl : STD_LOGIC;
  SIGNAL nor_597_nl : STD_LOGIC;
  SIGNAL or_256_nl : STD_LOGIC;
  SIGNAL nor_598_nl : STD_LOGIC;
  SIGNAL nor_599_nl : STD_LOGIC;
  SIGNAL nor_600_nl : STD_LOGIC;
  SIGNAL nor_601_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nor_596_nl : STD_LOGIC;
  SIGNAL nor_590_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL nor_591_nl : STD_LOGIC;
  SIGNAL nor_592_nl : STD_LOGIC;
  SIGNAL nor_593_nl : STD_LOGIC;
  SIGNAL nor_594_nl : STD_LOGIC;
  SIGNAL nor_595_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL nor_589_nl : STD_LOGIC;
  SIGNAL nor_581_nl : STD_LOGIC;
  SIGNAL or_288_nl : STD_LOGIC;
  SIGNAL or_286_nl : STD_LOGIC;
  SIGNAL nor_582_nl : STD_LOGIC;
  SIGNAL nor_583_nl : STD_LOGIC;
  SIGNAL nor_584_nl : STD_LOGIC;
  SIGNAL nor_585_nl : STD_LOGIC;
  SIGNAL nor_586_nl : STD_LOGIC;
  SIGNAL nor_587_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL nor_588_nl : STD_LOGIC;
  SIGNAL nor_579_nl : STD_LOGIC;
  SIGNAL nor_580_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nor_578_nl : STD_LOGIC;
  SIGNAL nor_577_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL nor_576_nl : STD_LOGIC;
  SIGNAL nor_574_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL nor_575_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL nor_573_nl : STD_LOGIC;
  SIGNAL nor_570_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL nor_571_nl : STD_LOGIC;
  SIGNAL nor_572_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL nor_569_nl : STD_LOGIC;
  SIGNAL nor_565_nl : STD_LOGIC;
  SIGNAL or_345_nl : STD_LOGIC;
  SIGNAL nor_566_nl : STD_LOGIC;
  SIGNAL nor_567_nl : STD_LOGIC;
  SIGNAL nor_568_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL nor_564_nl : STD_LOGIC;
  SIGNAL nor_559_nl : STD_LOGIC;
  SIGNAL or_358_nl : STD_LOGIC;
  SIGNAL nor_560_nl : STD_LOGIC;
  SIGNAL nor_561_nl : STD_LOGIC;
  SIGNAL nor_562_nl : STD_LOGIC;
  SIGNAL nor_563_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL nor_558_nl : STD_LOGIC;
  SIGNAL nor_552_nl : STD_LOGIC;
  SIGNAL or_373_nl : STD_LOGIC;
  SIGNAL nor_553_nl : STD_LOGIC;
  SIGNAL nor_554_nl : STD_LOGIC;
  SIGNAL nor_555_nl : STD_LOGIC;
  SIGNAL nor_556_nl : STD_LOGIC;
  SIGNAL nor_557_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL nor_551_nl : STD_LOGIC;
  SIGNAL nor_543_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL or_388_nl : STD_LOGIC;
  SIGNAL nor_544_nl : STD_LOGIC;
  SIGNAL nor_545_nl : STD_LOGIC;
  SIGNAL nor_546_nl : STD_LOGIC;
  SIGNAL nor_547_nl : STD_LOGIC;
  SIGNAL nor_548_nl : STD_LOGIC;
  SIGNAL nor_549_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL nor_550_nl : STD_LOGIC;
  SIGNAL nor_542_nl : STD_LOGIC;
  SIGNAL and_796_nl : STD_LOGIC;
  SIGNAL or_399_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL and_795_nl : STD_LOGIC;
  SIGNAL nor_541_nl : STD_LOGIC;
  SIGNAL or_420_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL and_794_nl : STD_LOGIC;
  SIGNAL nor_539_nl : STD_LOGIC;
  SIGNAL or_427_nl : STD_LOGIC;
  SIGNAL nor_540_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_793_nl : STD_LOGIC;
  SIGNAL nor_536_nl : STD_LOGIC;
  SIGNAL or_436_nl : STD_LOGIC;
  SIGNAL nor_537_nl : STD_LOGIC;
  SIGNAL nor_538_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL and_792_nl : STD_LOGIC;
  SIGNAL nor_532_nl : STD_LOGIC;
  SIGNAL or_447_nl : STD_LOGIC;
  SIGNAL nor_533_nl : STD_LOGIC;
  SIGNAL nor_534_nl : STD_LOGIC;
  SIGNAL nor_535_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL and_791_nl : STD_LOGIC;
  SIGNAL nor_527_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL nor_528_nl : STD_LOGIC;
  SIGNAL nor_529_nl : STD_LOGIC;
  SIGNAL nor_530_nl : STD_LOGIC;
  SIGNAL nor_531_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_789_nl : STD_LOGIC;
  SIGNAL nor_522_nl : STD_LOGIC;
  SIGNAL or_475_nl : STD_LOGIC;
  SIGNAL and_788_nl : STD_LOGIC;
  SIGNAL nor_523_nl : STD_LOGIC;
  SIGNAL nor_524_nl : STD_LOGIC;
  SIGNAL nor_525_nl : STD_LOGIC;
  SIGNAL nor_526_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL and_787_nl : STD_LOGIC;
  SIGNAL nor_516_nl : STD_LOGIC;
  SIGNAL or_492_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL nor_517_nl : STD_LOGIC;
  SIGNAL and_785_nl : STD_LOGIC;
  SIGNAL nor_518_nl : STD_LOGIC;
  SIGNAL nor_519_nl : STD_LOGIC;
  SIGNAL nor_520_nl : STD_LOGIC;
  SIGNAL nor_521_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL and_786_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL nor_515_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL and_784_nl : STD_LOGIC;
  SIGNAL nor_513_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL and_783_nl : STD_LOGIC;
  SIGNAL nor_511_nl : STD_LOGIC;
  SIGNAL or_530_nl : STD_LOGIC;
  SIGNAL nor_512_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL and_782_nl : STD_LOGIC;
  SIGNAL nor_508_nl : STD_LOGIC;
  SIGNAL or_539_nl : STD_LOGIC;
  SIGNAL nor_509_nl : STD_LOGIC;
  SIGNAL nor_510_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL and_781_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL nor_507_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL and_780_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL or_563_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_778_nl : STD_LOGIC;
  SIGNAL nor_494_nl : STD_LOGIC;
  SIGNAL or_578_nl : STD_LOGIC;
  SIGNAL and_777_nl : STD_LOGIC;
  SIGNAL nor_495_nl : STD_LOGIC;
  SIGNAL nor_496_nl : STD_LOGIC;
  SIGNAL nor_497_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL and_776_nl : STD_LOGIC;
  SIGNAL nor_488_nl : STD_LOGIC;
  SIGNAL or_595_nl : STD_LOGIC;
  SIGNAL or_593_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL and_774_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL nor_492_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL and_775_nl : STD_LOGIC;
  SIGNAL nor_487_nl : STD_LOGIC;
  SIGNAL and_773_nl : STD_LOGIC;
  SIGNAL or_604_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL and_772_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL and_771_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL or_631_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL and_770_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL or_640_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL and_769_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL or_651_nl : STD_LOGIC;
  SIGNAL nor_478_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL and_768_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL or_664_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL nor_474_nl : STD_LOGIC;
  SIGNAL nor_475_nl : STD_LOGIC;
  SIGNAL nor_476_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL and_766_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL or_679_nl : STD_LOGIC;
  SIGNAL and_765_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL and_764_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL or_696_nl : STD_LOGIC;
  SIGNAL or_694_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL and_762_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL nor_465_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL and_763_nl : STD_LOGIC;
  SIGNAL nor_459_nl : STD_LOGIC;
  SIGNAL nor_460_nl : STD_LOGIC;
  SIGNAL or_705_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL and_761_nl : STD_LOGIC;
  SIGNAL nor_458_nl : STD_LOGIC;
  SIGNAL nand_153_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL and_760_nl : STD_LOGIC;
  SIGNAL nor_456_nl : STD_LOGIC;
  SIGNAL nand_152_nl : STD_LOGIC;
  SIGNAL nor_457_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL and_759_nl : STD_LOGIC;
  SIGNAL nor_453_nl : STD_LOGIC;
  SIGNAL nand_151_nl : STD_LOGIC;
  SIGNAL nor_454_nl : STD_LOGIC;
  SIGNAL nor_455_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL and_758_nl : STD_LOGIC;
  SIGNAL nor_449_nl : STD_LOGIC;
  SIGNAL nand_96_nl : STD_LOGIC;
  SIGNAL nor_450_nl : STD_LOGIC;
  SIGNAL nor_451_nl : STD_LOGIC;
  SIGNAL nor_452_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL and_757_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL nand_150_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL nor_446_nl : STD_LOGIC;
  SIGNAL nor_447_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL and_755_nl : STD_LOGIC;
  SIGNAL nor_439_nl : STD_LOGIC;
  SIGNAL nand_149_nl : STD_LOGIC;
  SIGNAL and_754_nl : STD_LOGIC;
  SIGNAL nor_440_nl : STD_LOGIC;
  SIGNAL nor_441_nl : STD_LOGIC;
  SIGNAL nor_442_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL and_753_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL nand_73_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL and_751_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL nor_437_nl : STD_LOGIC;
  SIGNAL nor_438_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL and_752_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL and_750_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL or_825_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL or_832_nl : STD_LOGIC;
  SIGNAL and_748_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL or_841_nl : STD_LOGIC;
  SIGNAL and_745_nl : STD_LOGIC;
  SIGNAL and_746_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL nor_424_nl : STD_LOGIC;
  SIGNAL or_852_nl : STD_LOGIC;
  SIGNAL and_741_nl : STD_LOGIC;
  SIGNAL and_742_nl : STD_LOGIC;
  SIGNAL and_743_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL or_865_nl : STD_LOGIC;
  SIGNAL and_736_nl : STD_LOGIC;
  SIGNAL and_737_nl : STD_LOGIC;
  SIGNAL and_738_nl : STD_LOGIC;
  SIGNAL and_739_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL or_880_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL and_732_nl : STD_LOGIC;
  SIGNAL and_733_nl : STD_LOGIC;
  SIGNAL and_734_nl : STD_LOGIC;
  SIGNAL and_735_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL or_897_nl : STD_LOGIC;
  SIGNAL or_895_nl : STD_LOGIC;
  SIGNAL and_726_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL and_727_nl : STD_LOGIC;
  SIGNAL and_728_nl : STD_LOGIC;
  SIGNAL and_729_nl : STD_LOGIC;
  SIGNAL and_730_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL or_914_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL or_913_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL or_912_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL or_911_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL or_910_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL or_909_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL or_908_nl : STD_LOGIC;
  SIGNAL and_724_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL or_935_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL or_942_nl : STD_LOGIC;
  SIGNAL and_722_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL or_951_nl : STD_LOGIC;
  SIGNAL and_719_nl : STD_LOGIC;
  SIGNAL and_720_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL or_962_nl : STD_LOGIC;
  SIGNAL and_715_nl : STD_LOGIC;
  SIGNAL and_716_nl : STD_LOGIC;
  SIGNAL and_717_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL or_975_nl : STD_LOGIC;
  SIGNAL and_710_nl : STD_LOGIC;
  SIGNAL and_711_nl : STD_LOGIC;
  SIGNAL and_712_nl : STD_LOGIC;
  SIGNAL and_713_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL or_990_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL and_706_nl : STD_LOGIC;
  SIGNAL and_707_nl : STD_LOGIC;
  SIGNAL and_708_nl : STD_LOGIC;
  SIGNAL and_709_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL or_1007_nl : STD_LOGIC;
  SIGNAL or_1005_nl : STD_LOGIC;
  SIGNAL and_700_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL and_701_nl : STD_LOGIC;
  SIGNAL and_702_nl : STD_LOGIC;
  SIGNAL and_703_nl : STD_LOGIC;
  SIGNAL and_704_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL or_1024_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL or_1023_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL or_1022_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL or_1021_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL or_1020_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL or_1019_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL or_1018_nl : STD_LOGIC;
  SIGNAL and_697_nl : STD_LOGIC;
  SIGNAL and_698_nl : STD_LOGIC;
  SIGNAL or_1016_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL or_1044_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL or_1051_nl : STD_LOGIC;
  SIGNAL and_695_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL or_1060_nl : STD_LOGIC;
  SIGNAL and_692_nl : STD_LOGIC;
  SIGNAL and_693_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL or_1071_nl : STD_LOGIC;
  SIGNAL and_688_nl : STD_LOGIC;
  SIGNAL and_689_nl : STD_LOGIC;
  SIGNAL and_690_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL or_1084_nl : STD_LOGIC;
  SIGNAL and_683_nl : STD_LOGIC;
  SIGNAL and_684_nl : STD_LOGIC;
  SIGNAL and_685_nl : STD_LOGIC;
  SIGNAL and_686_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL or_1099_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL and_679_nl : STD_LOGIC;
  SIGNAL and_680_nl : STD_LOGIC;
  SIGNAL and_681_nl : STD_LOGIC;
  SIGNAL and_682_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL or_1116_nl : STD_LOGIC;
  SIGNAL or_1114_nl : STD_LOGIC;
  SIGNAL and_673_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL and_674_nl : STD_LOGIC;
  SIGNAL and_675_nl : STD_LOGIC;
  SIGNAL and_676_nl : STD_LOGIC;
  SIGNAL and_677_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL or_1133_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL or_1132_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL or_1131_nl : STD_LOGIC;
  SIGNAL nor_361_nl : STD_LOGIC;
  SIGNAL or_1130_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL or_1129_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL or_1128_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL or_1127_nl : STD_LOGIC;
  SIGNAL and_671_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL result_rem_12_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_1_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_2_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_3_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_4_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_5_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_6_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_7_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_8_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_9_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_10_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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
      rscid => 8,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  result_rem_12_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_a_1,
      b => result_rem_12_cmp_b_1,
      z => result_rem_12_cmp_z_1
    );
  result_rem_12_cmp_a_1 <= result_rem_12_cmp_a;
  result_rem_12_cmp_b_1 <= result_rem_12_cmp_b;
  result_rem_12_cmp_z <= result_rem_12_cmp_z_1;

  result_rem_12_cmp_1 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_1_a_1,
      b => result_rem_12_cmp_1_b_1,
      z => result_rem_12_cmp_1_z_1
    );
  result_rem_12_cmp_1_a_1 <= result_rem_12_cmp_1_a;
  result_rem_12_cmp_1_b_1 <= result_rem_12_cmp_1_b;
  result_rem_12_cmp_1_z <= result_rem_12_cmp_1_z_1;

  result_rem_12_cmp_2 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_2_a_1,
      b => result_rem_12_cmp_2_b_1,
      z => result_rem_12_cmp_2_z_1
    );
  result_rem_12_cmp_2_a_1 <= result_rem_12_cmp_2_a;
  result_rem_12_cmp_2_b_1 <= result_rem_12_cmp_2_b;
  result_rem_12_cmp_2_z <= result_rem_12_cmp_2_z_1;

  result_rem_12_cmp_3 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_3_a_1,
      b => result_rem_12_cmp_3_b_1,
      z => result_rem_12_cmp_3_z_1
    );
  result_rem_12_cmp_3_a_1 <= result_rem_12_cmp_3_a;
  result_rem_12_cmp_3_b_1 <= result_rem_12_cmp_3_b;
  result_rem_12_cmp_3_z <= result_rem_12_cmp_3_z_1;

  result_rem_12_cmp_4 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_4_a_1,
      b => result_rem_12_cmp_4_b_1,
      z => result_rem_12_cmp_4_z_1
    );
  result_rem_12_cmp_4_a_1 <= result_rem_12_cmp_4_a;
  result_rem_12_cmp_4_b_1 <= result_rem_12_cmp_4_b;
  result_rem_12_cmp_4_z <= result_rem_12_cmp_4_z_1;

  result_rem_12_cmp_5 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_5_a_1,
      b => result_rem_12_cmp_5_b_1,
      z => result_rem_12_cmp_5_z_1
    );
  result_rem_12_cmp_5_a_1 <= result_rem_12_cmp_5_a;
  result_rem_12_cmp_5_b_1 <= result_rem_12_cmp_5_b;
  result_rem_12_cmp_5_z <= result_rem_12_cmp_5_z_1;

  result_rem_12_cmp_6 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_6_a_1,
      b => result_rem_12_cmp_6_b_1,
      z => result_rem_12_cmp_6_z_1
    );
  result_rem_12_cmp_6_a_1 <= result_rem_12_cmp_6_a;
  result_rem_12_cmp_6_b_1 <= result_rem_12_cmp_6_b;
  result_rem_12_cmp_6_z <= result_rem_12_cmp_6_z_1;

  result_rem_12_cmp_7 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_7_a_1,
      b => result_rem_12_cmp_7_b_1,
      z => result_rem_12_cmp_7_z_1
    );
  result_rem_12_cmp_7_a_1 <= result_rem_12_cmp_7_a;
  result_rem_12_cmp_7_b_1 <= result_rem_12_cmp_7_b;
  result_rem_12_cmp_7_z <= result_rem_12_cmp_7_z_1;

  result_rem_12_cmp_8 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_8_a_1,
      b => result_rem_12_cmp_8_b_1,
      z => result_rem_12_cmp_8_z_1
    );
  result_rem_12_cmp_8_a_1 <= result_rem_12_cmp_8_a;
  result_rem_12_cmp_8_b_1 <= result_rem_12_cmp_8_b;
  result_rem_12_cmp_8_z <= result_rem_12_cmp_8_z_1;

  result_rem_12_cmp_9 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_9_a_1,
      b => result_rem_12_cmp_9_b_1,
      z => result_rem_12_cmp_9_z_1
    );
  result_rem_12_cmp_9_a_1 <= result_rem_12_cmp_9_a;
  result_rem_12_cmp_9_b_1 <= result_rem_12_cmp_9_b;
  result_rem_12_cmp_9_z <= result_rem_12_cmp_9_z_1;

  result_rem_12_cmp_10 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_10_a_1,
      b => result_rem_12_cmp_10_b_1,
      z => result_rem_12_cmp_10_z_1
    );
  result_rem_12_cmp_10_a_1 <= result_rem_12_cmp_10_a;
  result_rem_12_cmp_10_b_1 <= result_rem_12_cmp_10_b;
  result_rem_12_cmp_10_z <= result_rem_12_cmp_10_z_1;

  result_and_1_cse <= ccs_ccore_en AND (and_dcpl_263 OR and_dcpl_269 OR and_dcpl_275
      OR and_dcpl_281 OR and_dcpl_287 OR and_dcpl_293 OR and_dcpl_299 OR and_dcpl_305
      OR and_dcpl_311 OR mux_tmp_37);
  result_and_3_cse <= ccs_ccore_en AND (and_dcpl_319 OR and_dcpl_322 OR and_dcpl_325
      OR and_dcpl_329 OR and_dcpl_333 OR and_dcpl_337 OR and_dcpl_341 OR and_dcpl_344
      OR and_dcpl_347 OR mux_tmp_75);
  result_and_5_cse <= ccs_ccore_en AND (and_dcpl_353 OR and_dcpl_357 OR and_dcpl_361
      OR and_dcpl_364 OR and_dcpl_367 OR and_dcpl_370 OR and_dcpl_373 OR and_dcpl_377
      OR and_dcpl_381 OR mux_tmp_113);
  result_and_7_cse <= ccs_ccore_en AND (and_dcpl_387 OR and_dcpl_390 OR and_dcpl_393
      OR and_dcpl_396 OR and_dcpl_399 OR and_dcpl_402 OR and_dcpl_405 OR and_dcpl_408
      OR and_dcpl_411 OR mux_tmp_151);
  result_and_9_cse <= ccs_ccore_en AND (and_dcpl_418 OR and_dcpl_422 OR and_dcpl_426
      OR and_dcpl_430 OR and_dcpl_433 OR and_dcpl_437 OR and_dcpl_441 OR and_dcpl_444
      OR and_dcpl_447 OR mux_tmp_189);
  result_and_11_cse <= ccs_ccore_en AND (and_dcpl_452 OR and_dcpl_455 OR and_dcpl_458
      OR and_dcpl_462 OR and_dcpl_464 OR and_dcpl_468 OR and_dcpl_472 OR and_dcpl_474
      OR and_dcpl_476 OR mux_tmp_227);
  result_and_13_cse <= ccs_ccore_en AND (and_dcpl_480 OR and_dcpl_484 OR and_dcpl_488
      OR and_dcpl_491 OR and_dcpl_493 OR and_dcpl_496 OR and_dcpl_499 OR and_dcpl_501
      OR and_dcpl_503 OR mux_tmp_265);
  result_and_15_cse <= ccs_ccore_en AND (and_dcpl_507 OR and_dcpl_510 OR and_dcpl_513
      OR and_dcpl_516 OR and_dcpl_518 OR and_dcpl_521 OR and_dcpl_524 OR and_dcpl_526
      OR and_dcpl_528 OR mux_tmp_303);
  result_and_17_cse <= ccs_ccore_en AND (and_dcpl_533 OR and_dcpl_536 OR and_dcpl_539
      OR and_dcpl_542 OR and_dcpl_546 OR and_dcpl_549 OR and_dcpl_552 OR and_dcpl_556
      OR and_dcpl_560 OR mux_tmp_348);
  result_and_19_cse <= ccs_ccore_en AND (and_dcpl_566 OR and_dcpl_568 OR and_dcpl_570
      OR and_dcpl_572 OR and_dcpl_576 OR and_dcpl_578 OR and_dcpl_580 OR and_dcpl_583
      OR and_dcpl_586 OR mux_tmp_393);
  result_and_21_cse <= ccs_ccore_en AND (and_dcpl_590 OR and_dcpl_592 OR and_dcpl_594
      OR and_dcpl_596 OR and_dcpl_599 OR and_dcpl_601 OR and_dcpl_603 OR and_dcpl_607
      OR and_dcpl_611 OR mux_tmp_438);
  m_and_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_2;
  m_and_1_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_6;
  m_and_2_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_9;
  m_and_3_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_11;
  m_and_4_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_2;
  m_and_5_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_6;
  m_and_6_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_9;
  m_and_7_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_11;
  m_and_8_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (NOT (result_rem_11cyc_st_9(0)));
  m_and_9_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (result_rem_11cyc_st_9(0));
  m_and_10_cse <= ccs_ccore_en AND and_dcpl_4 AND (result_rem_11cyc_st_9(3)) AND
      (result_rem_11cyc_st_9(1)) AND (NOT (result_rem_11cyc_st_9(0)));
  m_and_11_cse <= ccs_ccore_en AND and_dcpl_30;
  m_and_12_cse <= ccs_ccore_en AND and_dcpl_32;
  m_and_13_cse <= ccs_ccore_en AND and_dcpl_35;
  m_and_14_cse <= ccs_ccore_en AND and_dcpl_37;
  m_and_15_cse <= ccs_ccore_en AND and_dcpl_39;
  m_and_16_cse <= ccs_ccore_en AND and_dcpl_40;
  m_and_17_cse <= ccs_ccore_en AND and_dcpl_41;
  m_and_18_cse <= ccs_ccore_en AND and_dcpl_42;
  m_and_19_cse <= ccs_ccore_en AND and_dcpl_45;
  m_and_20_cse <= ccs_ccore_en AND and_dcpl_47;
  m_and_21_cse <= ccs_ccore_en AND and_dcpl_50;
  m_and_22_cse <= ccs_ccore_en AND and_dcpl_55;
  m_and_23_cse <= ccs_ccore_en AND and_dcpl_58;
  m_and_24_cse <= ccs_ccore_en AND and_dcpl_60;
  m_and_25_cse <= ccs_ccore_en AND and_dcpl_62;
  m_and_26_cse <= ccs_ccore_en AND and_dcpl_65;
  m_and_27_cse <= ccs_ccore_en AND and_dcpl_68;
  m_and_28_cse <= ccs_ccore_en AND and_dcpl_70;
  m_and_29_cse <= ccs_ccore_en AND and_dcpl_72;
  m_and_30_cse <= ccs_ccore_en AND and_dcpl_74;
  m_and_31_cse <= ccs_ccore_en AND and_dcpl_75;
  m_and_32_cse <= ccs_ccore_en AND and_dcpl_76;
  m_and_33_cse <= ccs_ccore_en AND and_dcpl_81;
  m_and_34_cse <= ccs_ccore_en AND and_dcpl_84;
  m_and_35_cse <= ccs_ccore_en AND and_dcpl_86;
  m_and_36_cse <= ccs_ccore_en AND and_dcpl_88;
  m_and_37_cse <= ccs_ccore_en AND and_dcpl_91;
  m_and_38_cse <= ccs_ccore_en AND and_dcpl_94;
  m_and_39_cse <= ccs_ccore_en AND and_dcpl_96;
  m_and_40_cse <= ccs_ccore_en AND and_dcpl_98;
  m_and_41_cse <= ccs_ccore_en AND and_dcpl_100;
  m_and_42_cse <= ccs_ccore_en AND and_dcpl_101;
  m_and_43_cse <= ccs_ccore_en AND and_dcpl_102;
  m_and_44_cse <= ccs_ccore_en AND and_dcpl_107;
  m_and_45_cse <= ccs_ccore_en AND and_dcpl_110;
  m_and_46_cse <= ccs_ccore_en AND and_dcpl_112;
  m_and_47_cse <= ccs_ccore_en AND and_dcpl_114;
  m_and_48_cse <= ccs_ccore_en AND and_dcpl_116;
  m_and_49_cse <= ccs_ccore_en AND and_dcpl_117;
  m_and_50_cse <= ccs_ccore_en AND and_dcpl_118;
  m_and_51_cse <= ccs_ccore_en AND and_dcpl_119;
  m_and_52_cse <= ccs_ccore_en AND and_dcpl_122;
  m_and_53_cse <= ccs_ccore_en AND and_dcpl_125;
  m_and_54_cse <= ccs_ccore_en AND and_dcpl_127;
  m_and_55_cse <= ccs_ccore_en AND and_dcpl_132;
  m_and_56_cse <= ccs_ccore_en AND and_dcpl_135;
  m_and_57_cse <= ccs_ccore_en AND and_dcpl_137;
  m_and_58_cse <= ccs_ccore_en AND and_dcpl_139;
  m_and_59_cse <= ccs_ccore_en AND and_dcpl_142;
  m_and_60_cse <= ccs_ccore_en AND and_dcpl_145;
  m_and_61_cse <= ccs_ccore_en AND and_dcpl_147;
  m_and_62_cse <= ccs_ccore_en AND and_dcpl_149;
  m_and_63_cse <= ccs_ccore_en AND and_dcpl_151;
  m_and_64_cse <= ccs_ccore_en AND and_dcpl_152;
  m_and_65_cse <= ccs_ccore_en AND and_dcpl_153;
  m_and_66_cse <= ccs_ccore_en AND and_dcpl_158;
  m_and_67_cse <= ccs_ccore_en AND and_dcpl_160;
  m_and_68_cse <= ccs_ccore_en AND and_dcpl_163;
  m_and_69_cse <= ccs_ccore_en AND and_dcpl_165;
  m_and_70_cse <= ccs_ccore_en AND and_dcpl_168;
  m_and_71_cse <= ccs_ccore_en AND and_dcpl_170;
  m_and_72_cse <= ccs_ccore_en AND and_dcpl_173;
  m_and_73_cse <= ccs_ccore_en AND and_dcpl_175;
  m_and_74_cse <= ccs_ccore_en AND and_dcpl_177;
  m_and_75_cse <= ccs_ccore_en AND and_dcpl_178;
  m_and_76_cse <= ccs_ccore_en AND and_dcpl_179;
  m_and_77_cse <= ccs_ccore_en AND and_dcpl_184;
  m_and_78_cse <= ccs_ccore_en AND and_dcpl_186;
  m_and_79_cse <= ccs_ccore_en AND and_dcpl_189;
  m_and_80_cse <= ccs_ccore_en AND and_dcpl_191;
  m_and_81_cse <= ccs_ccore_en AND and_dcpl_194;
  m_and_82_cse <= ccs_ccore_en AND and_dcpl_196;
  m_and_83_cse <= ccs_ccore_en AND and_dcpl_199;
  m_and_84_cse <= ccs_ccore_en AND and_dcpl_201;
  m_and_85_cse <= ccs_ccore_en AND and_dcpl_203;
  m_and_86_cse <= ccs_ccore_en AND and_dcpl_204;
  m_and_87_cse <= ccs_ccore_en AND and_dcpl_205;
  m_and_88_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_207;
  m_and_89_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_212;
  m_and_90_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_214;
  m_and_91_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_211 AND (result_rem_11cyc(1));
  m_and_92_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_218 AND (NOT (result_rem_11cyc(1)));
  m_and_93_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_221 AND (NOT (result_rem_11cyc(1)));
  m_and_94_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_218 AND (result_rem_11cyc(1));
  m_and_95_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_221 AND (result_rem_11cyc(1));
  m_and_96_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_207;
  m_and_97_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_212;
  m_and_98_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_214;
  result_result_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_SIGNED(CONV_SIGNED(result_acc_imod_1(3),
      1),2)), 2), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(result_acc_imod_1(2 DOWNTO
      0)), 3), 4), 4));
  result_acc_imod_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(result_acc_idiv_1(2
      DOWNTO 0)), 3), 4) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED((NOT (result_acc_idiv_1(3)))
      & STD_LOGIC_VECTOR'( "00")), 3), 4) + CONV_SIGNED(CONV_SIGNED(SIGNED(STD_LOGIC_VECTOR'(
      "10") & (result_acc_idiv_1(3))), 3), 4), 4));
  result_acc_idiv_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(result_rem_11cyc)
      + UNSIGNED'( "0001"), 4));
  and_dcpl_1 <= NOT((result_rem_11cyc_st_9(3)) OR (result_rem_11cyc_st_9(1)));
  and_dcpl_2 <= and_dcpl_1 AND (NOT (result_rem_11cyc_st_9(0)));
  and_dcpl_3 <= main_stage_0_10 AND asn_itm_9;
  and_dcpl_4 <= and_dcpl_3 AND (NOT (result_rem_11cyc_st_9(2)));
  and_dcpl_6 <= and_dcpl_1 AND (result_rem_11cyc_st_9(0));
  and_dcpl_8 <= (NOT (result_rem_11cyc_st_9(3))) AND (result_rem_11cyc_st_9(1));
  and_dcpl_9 <= and_dcpl_8 AND (NOT (result_rem_11cyc_st_9(0)));
  and_dcpl_11 <= and_dcpl_8 AND (result_rem_11cyc_st_9(0));
  and_dcpl_13 <= and_dcpl_3 AND (result_rem_11cyc_st_9(2));
  and_dcpl_18 <= (result_rem_11cyc_st_9(3)) AND (NOT (result_rem_11cyc_st_9(1)));
  and_dcpl_26 <= NOT((result_rem_11cyc_st_8(3)) OR (result_rem_11cyc_st_8(1)));
  and_dcpl_27 <= and_dcpl_26 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_28 <= main_stage_0_9 AND asn_itm_8;
  and_dcpl_29 <= and_dcpl_28 AND (NOT (result_rem_11cyc_st_8(2)));
  and_dcpl_30 <= and_dcpl_29 AND and_dcpl_27;
  and_dcpl_31 <= and_dcpl_26 AND (result_rem_11cyc_st_8(0));
  and_dcpl_32 <= and_dcpl_29 AND and_dcpl_31;
  and_dcpl_33 <= (NOT (result_rem_11cyc_st_8(3))) AND (result_rem_11cyc_st_8(1));
  and_dcpl_34 <= and_dcpl_33 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_35 <= and_dcpl_29 AND and_dcpl_34;
  and_dcpl_36 <= and_dcpl_33 AND (result_rem_11cyc_st_8(0));
  and_dcpl_37 <= and_dcpl_29 AND and_dcpl_36;
  and_dcpl_38 <= and_dcpl_28 AND (result_rem_11cyc_st_8(2));
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_27;
  and_dcpl_40 <= and_dcpl_38 AND and_dcpl_31;
  and_dcpl_41 <= and_dcpl_38 AND and_dcpl_34;
  and_dcpl_42 <= and_dcpl_38 AND and_dcpl_36;
  and_dcpl_43 <= (result_rem_11cyc_st_8(3)) AND (NOT (result_rem_11cyc_st_8(1)));
  and_dcpl_45 <= and_dcpl_29 AND and_dcpl_43 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_47 <= and_dcpl_29 AND and_dcpl_43 AND (result_rem_11cyc_st_8(0));
  and_dcpl_50 <= and_dcpl_29 AND (result_rem_11cyc_st_8(3)) AND (result_rem_11cyc_st_8(1))
      AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_51 <= NOT((result_rem_11cyc_st_7(2)) OR (result_rem_11cyc_st_7(0)));
  and_dcpl_52 <= and_dcpl_51 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_53 <= main_stage_0_8 AND asn_itm_7;
  and_dcpl_54 <= and_dcpl_53 AND (NOT (result_rem_11cyc_st_7(3)));
  and_dcpl_55 <= and_dcpl_54 AND and_dcpl_52;
  and_dcpl_56 <= (NOT (result_rem_11cyc_st_7(2))) AND (result_rem_11cyc_st_7(0));
  and_dcpl_57 <= and_dcpl_56 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_58 <= and_dcpl_54 AND and_dcpl_57;
  and_dcpl_59 <= and_dcpl_51 AND (result_rem_11cyc_st_7(1));
  and_dcpl_60 <= and_dcpl_54 AND and_dcpl_59;
  and_dcpl_62 <= and_dcpl_54 AND and_dcpl_56 AND (result_rem_11cyc_st_7(1));
  and_dcpl_63 <= (result_rem_11cyc_st_7(2)) AND (NOT (result_rem_11cyc_st_7(0)));
  and_dcpl_65 <= and_dcpl_54 AND and_dcpl_63 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_66 <= (result_rem_11cyc_st_7(2)) AND (result_rem_11cyc_st_7(0));
  and_dcpl_68 <= and_dcpl_54 AND and_dcpl_66 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_70 <= and_dcpl_54 AND and_dcpl_63 AND (result_rem_11cyc_st_7(1));
  and_dcpl_72 <= and_dcpl_54 AND and_dcpl_66 AND (result_rem_11cyc_st_7(1));
  and_dcpl_73 <= and_dcpl_53 AND (result_rem_11cyc_st_7(3));
  and_dcpl_74 <= and_dcpl_73 AND and_dcpl_52;
  and_dcpl_75 <= and_dcpl_73 AND and_dcpl_57;
  and_dcpl_76 <= and_dcpl_73 AND and_dcpl_59;
  and_dcpl_77 <= NOT((result_rem_11cyc_st_6(2)) OR (result_rem_11cyc_st_6(0)));
  and_dcpl_78 <= and_dcpl_77 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_79 <= main_stage_0_7 AND asn_itm_6;
  and_dcpl_80 <= and_dcpl_79 AND (NOT (result_rem_11cyc_st_6(3)));
  and_dcpl_81 <= and_dcpl_80 AND and_dcpl_78;
  and_dcpl_82 <= (NOT (result_rem_11cyc_st_6(2))) AND (result_rem_11cyc_st_6(0));
  and_dcpl_83 <= and_dcpl_82 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_84 <= and_dcpl_80 AND and_dcpl_83;
  and_dcpl_85 <= and_dcpl_77 AND (result_rem_11cyc_st_6(1));
  and_dcpl_86 <= and_dcpl_80 AND and_dcpl_85;
  and_dcpl_88 <= and_dcpl_80 AND and_dcpl_82 AND (result_rem_11cyc_st_6(1));
  and_dcpl_89 <= (result_rem_11cyc_st_6(2)) AND (NOT (result_rem_11cyc_st_6(0)));
  and_dcpl_91 <= and_dcpl_80 AND and_dcpl_89 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_92 <= (result_rem_11cyc_st_6(2)) AND (result_rem_11cyc_st_6(0));
  and_dcpl_94 <= and_dcpl_80 AND and_dcpl_92 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_96 <= and_dcpl_80 AND and_dcpl_89 AND (result_rem_11cyc_st_6(1));
  and_dcpl_98 <= and_dcpl_80 AND and_dcpl_92 AND (result_rem_11cyc_st_6(1));
  and_dcpl_99 <= and_dcpl_79 AND (result_rem_11cyc_st_6(3));
  and_dcpl_100 <= and_dcpl_99 AND and_dcpl_78;
  and_dcpl_101 <= and_dcpl_99 AND and_dcpl_83;
  and_dcpl_102 <= and_dcpl_99 AND and_dcpl_85;
  and_dcpl_103 <= NOT((result_rem_11cyc_st_5(3)) OR (result_rem_11cyc_st_5(0)));
  and_dcpl_104 <= and_dcpl_103 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_105 <= main_stage_0_6 AND asn_itm_5;
  and_dcpl_106 <= and_dcpl_105 AND (NOT (result_rem_11cyc_st_5(2)));
  and_dcpl_107 <= and_dcpl_106 AND and_dcpl_104;
  and_dcpl_108 <= (NOT (result_rem_11cyc_st_5(3))) AND (result_rem_11cyc_st_5(0));
  and_dcpl_109 <= and_dcpl_108 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_110 <= and_dcpl_106 AND and_dcpl_109;
  and_dcpl_111 <= and_dcpl_103 AND (result_rem_11cyc_st_5(1));
  and_dcpl_112 <= and_dcpl_106 AND and_dcpl_111;
  and_dcpl_113 <= and_dcpl_108 AND (result_rem_11cyc_st_5(1));
  and_dcpl_114 <= and_dcpl_106 AND and_dcpl_113;
  and_dcpl_115 <= and_dcpl_105 AND (result_rem_11cyc_st_5(2));
  and_dcpl_116 <= and_dcpl_115 AND and_dcpl_104;
  and_dcpl_117 <= and_dcpl_115 AND and_dcpl_109;
  and_dcpl_118 <= and_dcpl_115 AND and_dcpl_111;
  and_dcpl_119 <= and_dcpl_115 AND and_dcpl_113;
  and_dcpl_120 <= (result_rem_11cyc_st_5(3)) AND (NOT (result_rem_11cyc_st_5(0)));
  and_dcpl_122 <= and_dcpl_106 AND and_dcpl_120 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_125 <= and_dcpl_106 AND (result_rem_11cyc_st_5(3)) AND (result_rem_11cyc_st_5(0))
      AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_127 <= and_dcpl_106 AND and_dcpl_120 AND (result_rem_11cyc_st_5(1));
  and_dcpl_128 <= NOT((result_rem_11cyc_st_4(2)) OR (result_rem_11cyc_st_4(0)));
  and_dcpl_129 <= and_dcpl_128 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_130 <= main_stage_0_5 AND asn_itm_4;
  and_dcpl_131 <= and_dcpl_130 AND (NOT (result_rem_11cyc_st_4(3)));
  and_dcpl_132 <= and_dcpl_131 AND and_dcpl_129;
  and_dcpl_133 <= (NOT (result_rem_11cyc_st_4(2))) AND (result_rem_11cyc_st_4(0));
  and_dcpl_134 <= and_dcpl_133 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_135 <= and_dcpl_131 AND and_dcpl_134;
  and_dcpl_136 <= and_dcpl_128 AND (result_rem_11cyc_st_4(1));
  and_dcpl_137 <= and_dcpl_131 AND and_dcpl_136;
  and_dcpl_139 <= and_dcpl_131 AND and_dcpl_133 AND (result_rem_11cyc_st_4(1));
  and_dcpl_140 <= (result_rem_11cyc_st_4(2)) AND (NOT (result_rem_11cyc_st_4(0)));
  and_dcpl_142 <= and_dcpl_131 AND and_dcpl_140 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_143 <= (result_rem_11cyc_st_4(2)) AND (result_rem_11cyc_st_4(0));
  and_dcpl_145 <= and_dcpl_131 AND and_dcpl_143 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_147 <= and_dcpl_131 AND and_dcpl_140 AND (result_rem_11cyc_st_4(1));
  and_dcpl_149 <= and_dcpl_131 AND and_dcpl_143 AND (result_rem_11cyc_st_4(1));
  and_dcpl_150 <= and_dcpl_130 AND (result_rem_11cyc_st_4(3));
  and_dcpl_151 <= and_dcpl_150 AND and_dcpl_129;
  and_dcpl_152 <= and_dcpl_150 AND and_dcpl_134;
  and_dcpl_153 <= and_dcpl_150 AND and_dcpl_136;
  and_dcpl_154 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_155 <= and_dcpl_154 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_156 <= main_stage_0_4 AND asn_itm_3;
  and_dcpl_157 <= and_dcpl_156 AND (NOT (result_rem_11cyc_st_3(3)));
  and_dcpl_158 <= and_dcpl_157 AND and_dcpl_155;
  and_dcpl_159 <= and_dcpl_154 AND (result_rem_11cyc_st_3(0));
  and_dcpl_160 <= and_dcpl_157 AND and_dcpl_159;
  and_dcpl_161 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_162 <= and_dcpl_161 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_163 <= and_dcpl_157 AND and_dcpl_162;
  and_dcpl_165 <= and_dcpl_157 AND and_dcpl_161 AND (result_rem_11cyc_st_3(0));
  and_dcpl_166 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_168 <= and_dcpl_157 AND and_dcpl_166 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_170 <= and_dcpl_157 AND and_dcpl_166 AND (result_rem_11cyc_st_3(0));
  and_dcpl_171 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_173 <= and_dcpl_157 AND and_dcpl_171 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_175 <= and_dcpl_157 AND and_dcpl_171 AND (result_rem_11cyc_st_3(0));
  and_dcpl_176 <= and_dcpl_156 AND (result_rem_11cyc_st_3(3));
  and_dcpl_177 <= and_dcpl_176 AND and_dcpl_155;
  and_dcpl_178 <= and_dcpl_176 AND and_dcpl_159;
  and_dcpl_179 <= and_dcpl_176 AND and_dcpl_162;
  and_dcpl_180 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_181 <= and_dcpl_180 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_182 <= main_stage_0_3 AND asn_itm_2;
  and_dcpl_183 <= and_dcpl_182 AND (NOT (result_rem_11cyc_st_2(3)));
  and_dcpl_184 <= and_dcpl_183 AND and_dcpl_181;
  and_dcpl_185 <= and_dcpl_180 AND (result_rem_11cyc_st_2(0));
  and_dcpl_186 <= and_dcpl_183 AND and_dcpl_185;
  and_dcpl_187 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_188 <= and_dcpl_187 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_189 <= and_dcpl_183 AND and_dcpl_188;
  and_dcpl_191 <= and_dcpl_183 AND and_dcpl_187 AND (result_rem_11cyc_st_2(0));
  and_dcpl_192 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_194 <= and_dcpl_183 AND and_dcpl_192 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_196 <= and_dcpl_183 AND and_dcpl_192 AND (result_rem_11cyc_st_2(0));
  and_dcpl_197 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_199 <= and_dcpl_183 AND and_dcpl_197 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_201 <= and_dcpl_183 AND and_dcpl_197 AND (result_rem_11cyc_st_2(0));
  and_dcpl_202 <= and_dcpl_182 AND (result_rem_11cyc_st_2(3));
  and_dcpl_203 <= and_dcpl_202 AND and_dcpl_181;
  and_dcpl_204 <= and_dcpl_202 AND and_dcpl_185;
  and_dcpl_205 <= and_dcpl_202 AND and_dcpl_188;
  and_dcpl_206 <= NOT((result_rem_11cyc(2)) OR (result_rem_11cyc(0)));
  and_dcpl_207 <= and_dcpl_206 AND (NOT (result_rem_11cyc(1)));
  and_dcpl_208 <= main_stage_0_2 AND asn_itm_1;
  and_dcpl_209 <= and_dcpl_208 AND (NOT (result_rem_11cyc(3)));
  and_dcpl_211 <= (NOT (result_rem_11cyc(2))) AND (result_rem_11cyc(0));
  and_dcpl_212 <= and_dcpl_211 AND (NOT (result_rem_11cyc(1)));
  and_dcpl_214 <= and_dcpl_206 AND (result_rem_11cyc(1));
  and_dcpl_218 <= (result_rem_11cyc(2)) AND (NOT (result_rem_11cyc(0)));
  and_dcpl_221 <= (result_rem_11cyc(2)) AND (result_rem_11cyc(0));
  and_dcpl_228 <= and_dcpl_208 AND (result_rem_11cyc(3));
  and_dcpl_232 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_233 <= and_dcpl_232 AND (NOT (result_rem_11cyc_st_11(0)));
  and_dcpl_234 <= main_stage_0_12 AND asn_itm_11;
  and_dcpl_235 <= and_dcpl_234 AND (NOT (result_rem_11cyc_st_11(3)));
  and_dcpl_237 <= and_dcpl_232 AND (result_rem_11cyc_st_11(0));
  and_dcpl_239 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_240 <= and_dcpl_239 AND (NOT (result_rem_11cyc_st_11(0)));
  and_dcpl_244 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_249 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_254 <= and_dcpl_234 AND (result_rem_11cyc_st_11(3));
  and_dcpl_260 <= NOT(CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_261 <= ccs_ccore_start_rsci_idat AND (NOT (result_result_acc_tmp(2)));
  and_dcpl_262 <= and_dcpl_261 AND (NOT (result_result_acc_tmp(3)));
  and_dcpl_263 <= and_dcpl_262 AND and_dcpl_260;
  or_tmp_2 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0000")) OR (NOT and_dcpl_208);
  or_3_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0000"));
  nor_691_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_2));
  mux_nl <= MUX_s_1_2_2(nor_691_nl, or_tmp_2, or_3_cse);
  and_dcpl_269 <= mux_nl AND and_dcpl_184;
  or_8_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0000"));
  nor_690_nl <= NOT(and_dcpl_208 OR and_dcpl_184);
  or_10_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_182);
  mux_tmp_1 <= MUX_s_1_2_2(nor_690_nl, or_10_nl, or_8_cse);
  nor_689_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_1));
  mux_2_nl <= MUX_s_1_2_2(nor_689_nl, mux_tmp_1, or_3_cse);
  and_dcpl_275 <= mux_2_nl AND and_dcpl_158;
  or_15_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000"));
  nor_687_nl <= NOT(and_dcpl_182 OR and_dcpl_158);
  or_17_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_156);
  mux_tmp_3 <= MUX_s_1_2_2(nor_687_nl, or_17_nl, or_15_cse);
  nor_688_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_3));
  mux_tmp_4 <= MUX_s_1_2_2(nor_688_nl, mux_tmp_3, or_8_cse);
  nor_686_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_4));
  mux_5_nl <= MUX_s_1_2_2(nor_686_nl, mux_tmp_4, or_3_cse);
  and_dcpl_281 <= mux_5_nl AND and_dcpl_132;
  or_24_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000"));
  nor_683_nl <= NOT(and_dcpl_156 OR and_dcpl_132);
  or_26_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_130);
  mux_tmp_6 <= MUX_s_1_2_2(nor_683_nl, or_26_nl, or_24_cse);
  nor_684_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_6));
  mux_tmp_7 <= MUX_s_1_2_2(nor_684_nl, mux_tmp_6, or_15_cse);
  nor_685_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_7));
  mux_tmp_8 <= MUX_s_1_2_2(nor_685_nl, mux_tmp_7, or_8_cse);
  nor_682_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_8));
  mux_9_nl <= MUX_s_1_2_2(nor_682_nl, mux_tmp_8, or_3_cse);
  and_dcpl_287 <= mux_9_nl AND and_dcpl_107;
  or_35_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000"));
  nor_678_nl <= NOT(and_dcpl_130 OR and_dcpl_107);
  or_37_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_105);
  mux_tmp_10 <= MUX_s_1_2_2(nor_678_nl, or_37_nl, or_35_cse);
  nor_679_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_10));
  mux_tmp_11 <= MUX_s_1_2_2(nor_679_nl, mux_tmp_10, or_24_cse);
  nor_680_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_11));
  mux_tmp_12 <= MUX_s_1_2_2(nor_680_nl, mux_tmp_11, or_15_cse);
  nor_681_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_12));
  mux_tmp_13 <= MUX_s_1_2_2(nor_681_nl, mux_tmp_12, or_8_cse);
  nor_677_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_13));
  mux_14_nl <= MUX_s_1_2_2(nor_677_nl, mux_tmp_13, or_3_cse);
  and_dcpl_293 <= mux_14_nl AND and_dcpl_81;
  or_48_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000"));
  nor_672_nl <= NOT(and_dcpl_105 OR and_dcpl_81);
  or_50_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_79);
  mux_tmp_15 <= MUX_s_1_2_2(nor_672_nl, or_50_nl, or_48_cse);
  nor_673_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_15));
  mux_tmp_16 <= MUX_s_1_2_2(nor_673_nl, mux_tmp_15, or_35_cse);
  nor_674_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_16));
  mux_tmp_17 <= MUX_s_1_2_2(nor_674_nl, mux_tmp_16, or_24_cse);
  nor_675_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_17));
  mux_tmp_18 <= MUX_s_1_2_2(nor_675_nl, mux_tmp_17, or_15_cse);
  nor_676_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_18));
  mux_tmp_19 <= MUX_s_1_2_2(nor_676_nl, mux_tmp_18, or_8_cse);
  nor_671_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_19));
  mux_20_nl <= MUX_s_1_2_2(nor_671_nl, mux_tmp_19, or_3_cse);
  and_dcpl_299 <= mux_20_nl AND and_dcpl_55;
  or_63_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000"));
  nor_665_nl <= NOT(and_dcpl_79 OR and_dcpl_55);
  or_65_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_53);
  mux_tmp_21 <= MUX_s_1_2_2(nor_665_nl, or_65_nl, or_63_cse);
  nor_666_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_21));
  mux_tmp_22 <= MUX_s_1_2_2(nor_666_nl, mux_tmp_21, or_48_cse);
  nor_667_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_22));
  mux_tmp_23 <= MUX_s_1_2_2(nor_667_nl, mux_tmp_22, or_35_cse);
  nor_668_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_23));
  mux_tmp_24 <= MUX_s_1_2_2(nor_668_nl, mux_tmp_23, or_24_cse);
  nor_669_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_24));
  mux_tmp_25 <= MUX_s_1_2_2(nor_669_nl, mux_tmp_24, or_15_cse);
  nor_670_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_25));
  mux_tmp_26 <= MUX_s_1_2_2(nor_670_nl, mux_tmp_25, or_8_cse);
  nor_664_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_26));
  mux_27_nl <= MUX_s_1_2_2(nor_664_nl, mux_tmp_26, or_3_cse);
  and_dcpl_305 <= mux_27_nl AND and_dcpl_30;
  nor_656_nl <= NOT(and_dcpl_53 OR and_dcpl_30);
  or_82_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_28);
  or_80_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000"));
  mux_tmp_28 <= MUX_s_1_2_2(nor_656_nl, or_82_nl, or_80_nl);
  nor_657_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_28));
  mux_tmp_29 <= MUX_s_1_2_2(nor_657_nl, mux_tmp_28, or_63_cse);
  nor_658_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_29));
  mux_tmp_30 <= MUX_s_1_2_2(nor_658_nl, mux_tmp_29, or_48_cse);
  nor_659_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_30));
  mux_tmp_31 <= MUX_s_1_2_2(nor_659_nl, mux_tmp_30, or_35_cse);
  nor_660_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_31));
  mux_tmp_32 <= MUX_s_1_2_2(nor_660_nl, mux_tmp_31, or_24_cse);
  nor_661_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_32));
  mux_tmp_33 <= MUX_s_1_2_2(nor_661_nl, mux_tmp_32, or_15_cse);
  nor_662_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_33));
  mux_tmp_34 <= MUX_s_1_2_2(nor_662_nl, mux_tmp_33, or_8_cse);
  nor_663_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_34));
  mux_35_nl <= MUX_s_1_2_2(nor_663_nl, mux_tmp_34, or_3_cse);
  and_dcpl_311 <= mux_35_nl AND and_dcpl_4 AND and_dcpl_2;
  and_tmp_6 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0000")));
  nor_654_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_6));
  mux_tmp_36 <= MUX_s_1_2_2(nor_654_nl, and_tmp_6, or_8_cse);
  nor_655_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_36));
  mux_tmp_37 <= MUX_s_1_2_2(nor_655_nl, mux_tmp_36, or_3_cse);
  and_dcpl_318 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_319 <= and_dcpl_262 AND and_dcpl_318;
  or_tmp_102 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_208);
  or_107_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0001"));
  nor_653_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_102));
  mux_38_nl <= MUX_s_1_2_2(nor_653_nl, or_tmp_102, or_107_cse);
  and_dcpl_322 <= mux_38_nl AND and_dcpl_186;
  or_112_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0001"));
  nor_652_nl <= NOT(and_dcpl_208 OR and_dcpl_186);
  or_114_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_182);
  mux_tmp_39 <= MUX_s_1_2_2(nor_652_nl, or_114_nl, or_112_cse);
  nor_651_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_39));
  mux_40_nl <= MUX_s_1_2_2(nor_651_nl, mux_tmp_39, or_107_cse);
  and_dcpl_325 <= mux_40_nl AND and_dcpl_160;
  or_119_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001"));
  nor_649_nl <= NOT(and_dcpl_182 OR and_dcpl_160);
  or_121_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_156);
  mux_tmp_41 <= MUX_s_1_2_2(nor_649_nl, or_121_nl, or_119_cse);
  nor_650_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_41));
  mux_tmp_42 <= MUX_s_1_2_2(nor_650_nl, mux_tmp_41, or_112_cse);
  nor_648_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_42));
  mux_43_nl <= MUX_s_1_2_2(nor_648_nl, mux_tmp_42, or_107_cse);
  and_dcpl_329 <= mux_43_nl AND and_dcpl_135;
  or_128_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001"));
  nor_645_nl <= NOT(and_dcpl_156 OR and_dcpl_135);
  or_130_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_130);
  mux_tmp_44 <= MUX_s_1_2_2(nor_645_nl, or_130_nl, or_128_cse);
  nor_646_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_44));
  mux_tmp_45 <= MUX_s_1_2_2(nor_646_nl, mux_tmp_44, or_119_cse);
  nor_647_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_45));
  mux_tmp_46 <= MUX_s_1_2_2(nor_647_nl, mux_tmp_45, or_112_cse);
  nor_644_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_46));
  mux_47_nl <= MUX_s_1_2_2(nor_644_nl, mux_tmp_46, or_107_cse);
  and_dcpl_333 <= mux_47_nl AND and_dcpl_110;
  or_139_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001"));
  nor_640_nl <= NOT(and_dcpl_130 OR and_dcpl_110);
  or_141_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_105);
  mux_tmp_48 <= MUX_s_1_2_2(nor_640_nl, or_141_nl, or_139_cse);
  nor_641_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_48));
  mux_tmp_49 <= MUX_s_1_2_2(nor_641_nl, mux_tmp_48, or_128_cse);
  nor_642_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_49));
  mux_tmp_50 <= MUX_s_1_2_2(nor_642_nl, mux_tmp_49, or_119_cse);
  nor_643_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_50));
  mux_tmp_51 <= MUX_s_1_2_2(nor_643_nl, mux_tmp_50, or_112_cse);
  nor_639_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_51));
  mux_52_nl <= MUX_s_1_2_2(nor_639_nl, mux_tmp_51, or_107_cse);
  and_dcpl_337 <= mux_52_nl AND and_dcpl_84;
  or_152_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001"));
  nor_634_nl <= NOT(and_dcpl_105 OR and_dcpl_84);
  or_154_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_79);
  mux_tmp_53 <= MUX_s_1_2_2(nor_634_nl, or_154_nl, or_152_cse);
  nor_635_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_53));
  mux_tmp_54 <= MUX_s_1_2_2(nor_635_nl, mux_tmp_53, or_139_cse);
  nor_636_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_54));
  mux_tmp_55 <= MUX_s_1_2_2(nor_636_nl, mux_tmp_54, or_128_cse);
  nor_637_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_55));
  mux_tmp_56 <= MUX_s_1_2_2(nor_637_nl, mux_tmp_55, or_119_cse);
  nor_638_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_56));
  mux_tmp_57 <= MUX_s_1_2_2(nor_638_nl, mux_tmp_56, or_112_cse);
  nor_633_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_57));
  mux_58_nl <= MUX_s_1_2_2(nor_633_nl, mux_tmp_57, or_107_cse);
  and_dcpl_341 <= mux_58_nl AND and_dcpl_58;
  or_167_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001"));
  nor_627_nl <= NOT(and_dcpl_79 OR and_dcpl_58);
  or_169_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_53);
  mux_tmp_59 <= MUX_s_1_2_2(nor_627_nl, or_169_nl, or_167_cse);
  nor_628_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_59));
  mux_tmp_60 <= MUX_s_1_2_2(nor_628_nl, mux_tmp_59, or_152_cse);
  nor_629_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_60));
  mux_tmp_61 <= MUX_s_1_2_2(nor_629_nl, mux_tmp_60, or_139_cse);
  nor_630_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_61));
  mux_tmp_62 <= MUX_s_1_2_2(nor_630_nl, mux_tmp_61, or_128_cse);
  nor_631_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_62));
  mux_tmp_63 <= MUX_s_1_2_2(nor_631_nl, mux_tmp_62, or_119_cse);
  nor_632_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_63));
  mux_tmp_64 <= MUX_s_1_2_2(nor_632_nl, mux_tmp_63, or_112_cse);
  nor_626_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_64));
  mux_65_nl <= MUX_s_1_2_2(nor_626_nl, mux_tmp_64, or_107_cse);
  and_dcpl_344 <= mux_65_nl AND and_dcpl_32;
  nor_618_nl <= NOT(and_dcpl_53 OR and_dcpl_32);
  or_186_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_28);
  or_184_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001"));
  mux_tmp_66 <= MUX_s_1_2_2(nor_618_nl, or_186_nl, or_184_nl);
  nor_619_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_66));
  mux_tmp_67 <= MUX_s_1_2_2(nor_619_nl, mux_tmp_66, or_167_cse);
  nor_620_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_67));
  mux_tmp_68 <= MUX_s_1_2_2(nor_620_nl, mux_tmp_67, or_152_cse);
  nor_621_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_68));
  mux_tmp_69 <= MUX_s_1_2_2(nor_621_nl, mux_tmp_68, or_139_cse);
  nor_622_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_69));
  mux_tmp_70 <= MUX_s_1_2_2(nor_622_nl, mux_tmp_69, or_128_cse);
  nor_623_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_70));
  mux_tmp_71 <= MUX_s_1_2_2(nor_623_nl, mux_tmp_70, or_119_cse);
  nor_624_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_71));
  mux_tmp_72 <= MUX_s_1_2_2(nor_624_nl, mux_tmp_71, or_112_cse);
  nor_625_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_72));
  mux_73_nl <= MUX_s_1_2_2(nor_625_nl, mux_tmp_72, or_107_cse);
  and_dcpl_347 <= mux_73_nl AND and_dcpl_4 AND and_dcpl_6;
  and_tmp_13 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0001")));
  nor_617_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_13));
  mux_tmp_74 <= MUX_s_1_2_2(nor_617_nl, and_tmp_13, or_112_cse);
  nand_146_cse <= NOT((result_result_acc_tmp(0)) AND ccs_ccore_start_rsci_idat);
  and_797_nl <= nand_146_cse AND mux_tmp_74;
  or_195_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_75 <= MUX_s_1_2_2(and_797_nl, mux_tmp_74, or_195_nl);
  and_dcpl_352 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_353 <= and_dcpl_262 AND and_dcpl_352;
  or_tmp_202 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_208);
  or_209_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0010"));
  nor_616_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_202));
  mux_76_nl <= MUX_s_1_2_2(nor_616_nl, or_tmp_202, or_209_cse);
  and_dcpl_357 <= mux_76_nl AND and_dcpl_189;
  or_214_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0010"));
  nor_615_nl <= NOT(and_dcpl_208 OR and_dcpl_189);
  or_216_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_182);
  mux_tmp_77 <= MUX_s_1_2_2(nor_615_nl, or_216_nl, or_214_cse);
  nor_614_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_77));
  mux_78_nl <= MUX_s_1_2_2(nor_614_nl, mux_tmp_77, or_209_cse);
  and_dcpl_361 <= mux_78_nl AND and_dcpl_163;
  or_221_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010"));
  nor_612_nl <= NOT(and_dcpl_182 OR and_dcpl_163);
  or_223_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_156);
  mux_tmp_79 <= MUX_s_1_2_2(nor_612_nl, or_223_nl, or_221_cse);
  nor_613_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_79));
  mux_tmp_80 <= MUX_s_1_2_2(nor_613_nl, mux_tmp_79, or_214_cse);
  nor_611_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_80));
  mux_81_nl <= MUX_s_1_2_2(nor_611_nl, mux_tmp_80, or_209_cse);
  and_dcpl_364 <= mux_81_nl AND and_dcpl_137;
  or_230_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010"));
  nor_608_nl <= NOT(and_dcpl_156 OR and_dcpl_137);
  or_232_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_130);
  mux_tmp_82 <= MUX_s_1_2_2(nor_608_nl, or_232_nl, or_230_cse);
  nor_609_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_82));
  mux_tmp_83 <= MUX_s_1_2_2(nor_609_nl, mux_tmp_82, or_221_cse);
  nor_610_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_83));
  mux_tmp_84 <= MUX_s_1_2_2(nor_610_nl, mux_tmp_83, or_214_cse);
  nor_607_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_84));
  mux_85_nl <= MUX_s_1_2_2(nor_607_nl, mux_tmp_84, or_209_cse);
  and_dcpl_367 <= mux_85_nl AND and_dcpl_112;
  or_241_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010"));
  nor_603_nl <= NOT(and_dcpl_130 OR and_dcpl_112);
  or_243_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_105);
  mux_tmp_86 <= MUX_s_1_2_2(nor_603_nl, or_243_nl, or_241_cse);
  nor_604_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_86));
  mux_tmp_87 <= MUX_s_1_2_2(nor_604_nl, mux_tmp_86, or_230_cse);
  nor_605_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_87));
  mux_tmp_88 <= MUX_s_1_2_2(nor_605_nl, mux_tmp_87, or_221_cse);
  nor_606_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_88));
  mux_tmp_89 <= MUX_s_1_2_2(nor_606_nl, mux_tmp_88, or_214_cse);
  nor_602_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_89));
  mux_90_nl <= MUX_s_1_2_2(nor_602_nl, mux_tmp_89, or_209_cse);
  and_dcpl_370 <= mux_90_nl AND and_dcpl_86;
  or_254_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010"));
  nor_597_nl <= NOT(and_dcpl_105 OR and_dcpl_86);
  or_256_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_79);
  mux_tmp_91 <= MUX_s_1_2_2(nor_597_nl, or_256_nl, or_254_cse);
  nor_598_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_91));
  mux_tmp_92 <= MUX_s_1_2_2(nor_598_nl, mux_tmp_91, or_241_cse);
  nor_599_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_92));
  mux_tmp_93 <= MUX_s_1_2_2(nor_599_nl, mux_tmp_92, or_230_cse);
  nor_600_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_93));
  mux_tmp_94 <= MUX_s_1_2_2(nor_600_nl, mux_tmp_93, or_221_cse);
  nor_601_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_94));
  mux_tmp_95 <= MUX_s_1_2_2(nor_601_nl, mux_tmp_94, or_214_cse);
  nor_596_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_95));
  mux_96_nl <= MUX_s_1_2_2(nor_596_nl, mux_tmp_95, or_209_cse);
  and_dcpl_373 <= mux_96_nl AND and_dcpl_60;
  or_269_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010"));
  nor_590_nl <= NOT(and_dcpl_79 OR and_dcpl_60);
  or_271_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_53);
  mux_tmp_97 <= MUX_s_1_2_2(nor_590_nl, or_271_nl, or_269_cse);
  nor_591_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_97));
  mux_tmp_98 <= MUX_s_1_2_2(nor_591_nl, mux_tmp_97, or_254_cse);
  nor_592_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_98));
  mux_tmp_99 <= MUX_s_1_2_2(nor_592_nl, mux_tmp_98, or_241_cse);
  nor_593_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_99));
  mux_tmp_100 <= MUX_s_1_2_2(nor_593_nl, mux_tmp_99, or_230_cse);
  nor_594_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_100));
  mux_tmp_101 <= MUX_s_1_2_2(nor_594_nl, mux_tmp_100, or_221_cse);
  nor_595_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_101));
  mux_tmp_102 <= MUX_s_1_2_2(nor_595_nl, mux_tmp_101, or_214_cse);
  nor_589_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_102));
  mux_103_nl <= MUX_s_1_2_2(nor_589_nl, mux_tmp_102, or_209_cse);
  and_dcpl_377 <= mux_103_nl AND and_dcpl_35;
  nor_581_nl <= NOT(and_dcpl_53 OR and_dcpl_35);
  or_288_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_28);
  or_286_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010"));
  mux_tmp_104 <= MUX_s_1_2_2(nor_581_nl, or_288_nl, or_286_nl);
  nor_582_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_104));
  mux_tmp_105 <= MUX_s_1_2_2(nor_582_nl, mux_tmp_104, or_269_cse);
  nor_583_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_105));
  mux_tmp_106 <= MUX_s_1_2_2(nor_583_nl, mux_tmp_105, or_254_cse);
  nor_584_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_106));
  mux_tmp_107 <= MUX_s_1_2_2(nor_584_nl, mux_tmp_106, or_241_cse);
  nor_585_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_107));
  mux_tmp_108 <= MUX_s_1_2_2(nor_585_nl, mux_tmp_107, or_230_cse);
  nor_586_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_108));
  mux_tmp_109 <= MUX_s_1_2_2(nor_586_nl, mux_tmp_108, or_221_cse);
  nor_587_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_109));
  mux_tmp_110 <= MUX_s_1_2_2(nor_587_nl, mux_tmp_109, or_214_cse);
  nor_588_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_110));
  mux_111_nl <= MUX_s_1_2_2(nor_588_nl, mux_tmp_110, or_209_cse);
  and_dcpl_381 <= mux_111_nl AND and_dcpl_4 AND and_dcpl_9;
  and_tmp_20 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0010")));
  nor_579_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_20));
  mux_tmp_112 <= MUX_s_1_2_2(nor_579_nl, and_tmp_20, or_214_cse);
  nor_580_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_112));
  mux_tmp_113 <= MUX_s_1_2_2(nor_580_nl, mux_tmp_112, or_209_cse);
  and_dcpl_386 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_387 <= and_dcpl_262 AND and_dcpl_386;
  or_tmp_302 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_208);
  or_311_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0011"));
  nor_578_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_302));
  mux_114_nl <= MUX_s_1_2_2(nor_578_nl, or_tmp_302, or_311_cse);
  and_dcpl_390 <= mux_114_nl AND and_dcpl_191;
  or_316_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0011"));
  nor_577_nl <= NOT(and_dcpl_208 OR and_dcpl_191);
  or_318_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_182);
  mux_tmp_115 <= MUX_s_1_2_2(nor_577_nl, or_318_nl, or_316_cse);
  nor_576_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_115));
  mux_116_nl <= MUX_s_1_2_2(nor_576_nl, mux_tmp_115, or_311_cse);
  and_dcpl_393 <= mux_116_nl AND and_dcpl_165;
  or_323_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011"));
  nor_574_nl <= NOT(and_dcpl_182 OR and_dcpl_165);
  or_325_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_156);
  mux_tmp_117 <= MUX_s_1_2_2(nor_574_nl, or_325_nl, or_323_cse);
  nor_575_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_117));
  mux_tmp_118 <= MUX_s_1_2_2(nor_575_nl, mux_tmp_117, or_316_cse);
  nor_573_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_118));
  mux_119_nl <= MUX_s_1_2_2(nor_573_nl, mux_tmp_118, or_311_cse);
  and_dcpl_396 <= mux_119_nl AND and_dcpl_139;
  or_332_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011"));
  nor_570_nl <= NOT(and_dcpl_156 OR and_dcpl_139);
  or_334_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_130);
  mux_tmp_120 <= MUX_s_1_2_2(nor_570_nl, or_334_nl, or_332_cse);
  nor_571_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_120));
  mux_tmp_121 <= MUX_s_1_2_2(nor_571_nl, mux_tmp_120, or_323_cse);
  nor_572_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_121));
  mux_tmp_122 <= MUX_s_1_2_2(nor_572_nl, mux_tmp_121, or_316_cse);
  nor_569_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_122));
  mux_123_nl <= MUX_s_1_2_2(nor_569_nl, mux_tmp_122, or_311_cse);
  and_dcpl_399 <= mux_123_nl AND and_dcpl_114;
  or_343_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011"));
  nor_565_nl <= NOT(and_dcpl_130 OR and_dcpl_114);
  or_345_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_105);
  mux_tmp_124 <= MUX_s_1_2_2(nor_565_nl, or_345_nl, or_343_cse);
  nor_566_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_124));
  mux_tmp_125 <= MUX_s_1_2_2(nor_566_nl, mux_tmp_124, or_332_cse);
  nor_567_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_125));
  mux_tmp_126 <= MUX_s_1_2_2(nor_567_nl, mux_tmp_125, or_323_cse);
  nor_568_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_126));
  mux_tmp_127 <= MUX_s_1_2_2(nor_568_nl, mux_tmp_126, or_316_cse);
  nor_564_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_127));
  mux_128_nl <= MUX_s_1_2_2(nor_564_nl, mux_tmp_127, or_311_cse);
  and_dcpl_402 <= mux_128_nl AND and_dcpl_88;
  or_356_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011"));
  nor_559_nl <= NOT(and_dcpl_105 OR and_dcpl_88);
  or_358_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_79);
  mux_tmp_129 <= MUX_s_1_2_2(nor_559_nl, or_358_nl, or_356_cse);
  nor_560_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_129));
  mux_tmp_130 <= MUX_s_1_2_2(nor_560_nl, mux_tmp_129, or_343_cse);
  nor_561_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_130));
  mux_tmp_131 <= MUX_s_1_2_2(nor_561_nl, mux_tmp_130, or_332_cse);
  nor_562_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_131));
  mux_tmp_132 <= MUX_s_1_2_2(nor_562_nl, mux_tmp_131, or_323_cse);
  nor_563_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_132));
  mux_tmp_133 <= MUX_s_1_2_2(nor_563_nl, mux_tmp_132, or_316_cse);
  nor_558_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_133));
  mux_134_nl <= MUX_s_1_2_2(nor_558_nl, mux_tmp_133, or_311_cse);
  and_dcpl_405 <= mux_134_nl AND and_dcpl_62;
  or_371_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011"));
  nor_552_nl <= NOT(and_dcpl_79 OR and_dcpl_62);
  or_373_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_53);
  mux_tmp_135 <= MUX_s_1_2_2(nor_552_nl, or_373_nl, or_371_cse);
  nor_553_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_135));
  mux_tmp_136 <= MUX_s_1_2_2(nor_553_nl, mux_tmp_135, or_356_cse);
  nor_554_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_136));
  mux_tmp_137 <= MUX_s_1_2_2(nor_554_nl, mux_tmp_136, or_343_cse);
  nor_555_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_137));
  mux_tmp_138 <= MUX_s_1_2_2(nor_555_nl, mux_tmp_137, or_332_cse);
  nor_556_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_138));
  mux_tmp_139 <= MUX_s_1_2_2(nor_556_nl, mux_tmp_138, or_323_cse);
  nor_557_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_139));
  mux_tmp_140 <= MUX_s_1_2_2(nor_557_nl, mux_tmp_139, or_316_cse);
  nor_551_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_140));
  mux_141_nl <= MUX_s_1_2_2(nor_551_nl, mux_tmp_140, or_311_cse);
  and_dcpl_408 <= mux_141_nl AND and_dcpl_37;
  nor_543_nl <= NOT(and_dcpl_53 OR and_dcpl_37);
  or_390_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_28);
  or_388_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011"));
  mux_tmp_142 <= MUX_s_1_2_2(nor_543_nl, or_390_nl, or_388_nl);
  nor_544_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_142));
  mux_tmp_143 <= MUX_s_1_2_2(nor_544_nl, mux_tmp_142, or_371_cse);
  nor_545_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_143));
  mux_tmp_144 <= MUX_s_1_2_2(nor_545_nl, mux_tmp_143, or_356_cse);
  nor_546_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_144));
  mux_tmp_145 <= MUX_s_1_2_2(nor_546_nl, mux_tmp_144, or_343_cse);
  nor_547_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_145));
  mux_tmp_146 <= MUX_s_1_2_2(nor_547_nl, mux_tmp_145, or_332_cse);
  nor_548_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_146));
  mux_tmp_147 <= MUX_s_1_2_2(nor_548_nl, mux_tmp_146, or_323_cse);
  nor_549_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_147));
  mux_tmp_148 <= MUX_s_1_2_2(nor_549_nl, mux_tmp_147, or_316_cse);
  nor_550_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_148));
  mux_149_nl <= MUX_s_1_2_2(nor_550_nl, mux_tmp_148, or_311_cse);
  and_dcpl_411 <= mux_149_nl AND and_dcpl_4 AND and_dcpl_11;
  and_tmp_27 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0011")));
  nor_542_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_27));
  mux_tmp_150 <= MUX_s_1_2_2(nor_542_nl, and_tmp_27, or_316_cse);
  and_796_nl <= (NOT(CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat)) AND mux_tmp_150;
  or_399_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_151 <= MUX_s_1_2_2(and_796_nl, mux_tmp_150, or_399_nl);
  and_dcpl_417 <= ccs_ccore_start_rsci_idat AND CONV_SL_1_1(result_result_acc_tmp(3
      DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_418 <= and_dcpl_417 AND and_dcpl_260;
  or_tmp_402 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_208);
  nand_144_cse <= NOT((result_result_acc_tmp(2)) AND ccs_ccore_start_rsci_idat);
  or_413_cse <= (result_result_acc_tmp(1)) OR (result_result_acc_tmp(0)) OR (result_result_acc_tmp(3));
  and_795_nl <= nand_144_cse AND or_tmp_402;
  mux_152_nl <= MUX_s_1_2_2(and_795_nl, or_tmp_402, or_413_cse);
  and_dcpl_422 <= mux_152_nl AND and_dcpl_194;
  or_418_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0100"));
  nor_541_nl <= NOT(and_dcpl_208 OR and_dcpl_194);
  or_420_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_182);
  mux_tmp_153 <= MUX_s_1_2_2(nor_541_nl, or_420_nl, or_418_cse);
  and_794_nl <= nand_144_cse AND mux_tmp_153;
  mux_154_nl <= MUX_s_1_2_2(and_794_nl, mux_tmp_153, or_413_cse);
  and_dcpl_426 <= mux_154_nl AND and_dcpl_168;
  or_425_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100"));
  nor_539_nl <= NOT(and_dcpl_182 OR and_dcpl_168);
  or_427_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_156);
  mux_tmp_155 <= MUX_s_1_2_2(nor_539_nl, or_427_nl, or_425_cse);
  nor_540_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_155));
  mux_tmp_156 <= MUX_s_1_2_2(nor_540_nl, mux_tmp_155, or_418_cse);
  and_793_nl <= nand_144_cse AND mux_tmp_156;
  mux_157_nl <= MUX_s_1_2_2(and_793_nl, mux_tmp_156, or_413_cse);
  and_dcpl_430 <= mux_157_nl AND and_dcpl_142;
  or_434_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100"));
  nor_536_nl <= NOT(and_dcpl_156 OR and_dcpl_142);
  or_436_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_130);
  mux_tmp_158 <= MUX_s_1_2_2(nor_536_nl, or_436_nl, or_434_cse);
  nor_537_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_158));
  mux_tmp_159 <= MUX_s_1_2_2(nor_537_nl, mux_tmp_158, or_425_cse);
  nor_538_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_159));
  mux_tmp_160 <= MUX_s_1_2_2(nor_538_nl, mux_tmp_159, or_418_cse);
  and_792_nl <= nand_144_cse AND mux_tmp_160;
  mux_161_nl <= MUX_s_1_2_2(and_792_nl, mux_tmp_160, or_413_cse);
  and_dcpl_433 <= mux_161_nl AND and_dcpl_116;
  or_445_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100"));
  nor_532_nl <= NOT(and_dcpl_130 OR and_dcpl_116);
  or_447_nl <= (result_rem_11cyc_st_5(1)) OR (result_rem_11cyc_st_5(0)) OR (result_rem_11cyc_st_5(3))
      OR (NOT and_dcpl_115);
  mux_tmp_162 <= MUX_s_1_2_2(nor_532_nl, or_447_nl, or_445_cse);
  nor_533_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_162));
  mux_tmp_163 <= MUX_s_1_2_2(nor_533_nl, mux_tmp_162, or_434_cse);
  nor_534_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_163));
  mux_tmp_164 <= MUX_s_1_2_2(nor_534_nl, mux_tmp_163, or_425_cse);
  nor_535_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_164));
  mux_tmp_165 <= MUX_s_1_2_2(nor_535_nl, mux_tmp_164, or_418_cse);
  and_791_nl <= nand_144_cse AND mux_tmp_165;
  mux_166_nl <= MUX_s_1_2_2(and_791_nl, mux_tmp_165, or_413_cse);
  and_dcpl_437 <= mux_166_nl AND and_dcpl_91;
  or_458_cse <= (result_rem_11cyc_st_5(1)) OR (result_rem_11cyc_st_5(0)) OR (result_rem_11cyc_st_5(3));
  and_790_cse <= (result_rem_11cyc_st_5(2)) AND asn_itm_5 AND main_stage_0_6;
  nor_527_nl <= NOT(and_790_cse OR and_dcpl_91);
  or_460_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_79);
  mux_tmp_167 <= MUX_s_1_2_2(nor_527_nl, or_460_nl, or_458_cse);
  nor_528_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_167));
  mux_tmp_168 <= MUX_s_1_2_2(nor_528_nl, mux_tmp_167, or_445_cse);
  nor_529_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_168));
  mux_tmp_169 <= MUX_s_1_2_2(nor_529_nl, mux_tmp_168, or_434_cse);
  nor_530_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_169));
  mux_tmp_170 <= MUX_s_1_2_2(nor_530_nl, mux_tmp_169, or_425_cse);
  nor_531_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_170));
  mux_tmp_171 <= MUX_s_1_2_2(nor_531_nl, mux_tmp_170, or_418_cse);
  and_789_nl <= nand_144_cse AND mux_tmp_171;
  mux_172_nl <= MUX_s_1_2_2(and_789_nl, mux_tmp_171, or_413_cse);
  and_dcpl_441 <= mux_172_nl AND and_dcpl_65;
  or_473_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100"));
  nor_522_nl <= NOT(and_dcpl_79 OR and_dcpl_65);
  or_475_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_53);
  mux_tmp_173 <= MUX_s_1_2_2(nor_522_nl, or_475_nl, or_473_cse);
  nand_138_cse <= NOT((result_rem_11cyc_st_5(2)) AND asn_itm_5 AND main_stage_0_6);
  and_788_nl <= nand_138_cse AND mux_tmp_173;
  mux_tmp_174 <= MUX_s_1_2_2(and_788_nl, mux_tmp_173, or_458_cse);
  nor_523_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_174));
  mux_tmp_175 <= MUX_s_1_2_2(nor_523_nl, mux_tmp_174, or_445_cse);
  nor_524_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_175));
  mux_tmp_176 <= MUX_s_1_2_2(nor_524_nl, mux_tmp_175, or_434_cse);
  nor_525_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_176));
  mux_tmp_177 <= MUX_s_1_2_2(nor_525_nl, mux_tmp_176, or_425_cse);
  nor_526_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_177));
  mux_tmp_178 <= MUX_s_1_2_2(nor_526_nl, mux_tmp_177, or_418_cse);
  and_787_nl <= nand_144_cse AND mux_tmp_178;
  mux_179_nl <= MUX_s_1_2_2(and_787_nl, mux_tmp_178, or_413_cse);
  and_dcpl_444 <= mux_179_nl AND and_dcpl_39;
  nor_516_nl <= NOT(and_dcpl_53 OR and_dcpl_39);
  or_492_nl <= (result_rem_11cyc_st_8(0)) OR (result_rem_11cyc_st_8(1)) OR (result_rem_11cyc_st_8(3))
      OR (NOT and_dcpl_38);
  or_490_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_180 <= MUX_s_1_2_2(nor_516_nl, or_492_nl, or_490_nl);
  nor_517_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_180));
  mux_tmp_181 <= MUX_s_1_2_2(nor_517_nl, mux_tmp_180, or_473_cse);
  and_785_nl <= nand_138_cse AND mux_tmp_181;
  mux_tmp_182 <= MUX_s_1_2_2(and_785_nl, mux_tmp_181, or_458_cse);
  nor_518_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_182));
  mux_tmp_183 <= MUX_s_1_2_2(nor_518_nl, mux_tmp_182, or_445_cse);
  nor_519_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_183));
  mux_tmp_184 <= MUX_s_1_2_2(nor_519_nl, mux_tmp_183, or_434_cse);
  nor_520_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_184));
  mux_tmp_185 <= MUX_s_1_2_2(nor_520_nl, mux_tmp_184, or_425_cse);
  nor_521_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_185));
  mux_tmp_186 <= MUX_s_1_2_2(nor_521_nl, mux_tmp_185, or_418_cse);
  and_786_nl <= nand_144_cse AND mux_tmp_186;
  mux_187_nl <= MUX_s_1_2_2(and_786_nl, mux_tmp_186, or_413_cse);
  and_dcpl_447 <= mux_187_nl AND and_dcpl_13 AND and_dcpl_2;
  and_tmp_34 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0100")));
  nor_514_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_34));
  mux_tmp_188 <= MUX_s_1_2_2(nor_514_nl, and_tmp_34, or_418_cse);
  nor_515_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_188));
  or_501_nl <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_189 <= MUX_s_1_2_2(nor_515_nl, mux_tmp_188, or_501_nl);
  and_dcpl_452 <= and_dcpl_417 AND and_dcpl_318;
  or_tmp_502 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_208);
  or_516_cse <= (result_result_acc_tmp(1)) OR (NOT (result_result_acc_tmp(0))) OR
      (result_result_acc_tmp(3));
  and_784_nl <= nand_144_cse AND or_tmp_502;
  mux_190_nl <= MUX_s_1_2_2(and_784_nl, or_tmp_502, or_516_cse);
  and_dcpl_455 <= mux_190_nl AND and_dcpl_196;
  or_521_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0101"));
  nor_513_nl <= NOT(and_dcpl_208 OR and_dcpl_196);
  or_523_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_182);
  mux_tmp_191 <= MUX_s_1_2_2(nor_513_nl, or_523_nl, or_521_cse);
  and_783_nl <= nand_144_cse AND mux_tmp_191;
  mux_192_nl <= MUX_s_1_2_2(and_783_nl, mux_tmp_191, or_516_cse);
  and_dcpl_458 <= mux_192_nl AND and_dcpl_170;
  or_528_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101"));
  nor_511_nl <= NOT(and_dcpl_182 OR and_dcpl_170);
  or_530_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_156);
  mux_tmp_193 <= MUX_s_1_2_2(nor_511_nl, or_530_nl, or_528_cse);
  nor_512_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_193));
  mux_tmp_194 <= MUX_s_1_2_2(nor_512_nl, mux_tmp_193, or_521_cse);
  and_782_nl <= nand_144_cse AND mux_tmp_194;
  mux_195_nl <= MUX_s_1_2_2(and_782_nl, mux_tmp_194, or_516_cse);
  and_dcpl_462 <= mux_195_nl AND and_dcpl_145;
  or_537_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101"));
  nor_508_nl <= NOT(and_dcpl_156 OR and_dcpl_145);
  or_539_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_130);
  mux_tmp_196 <= MUX_s_1_2_2(nor_508_nl, or_539_nl, or_537_cse);
  nor_509_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_196));
  mux_tmp_197 <= MUX_s_1_2_2(nor_509_nl, mux_tmp_196, or_528_cse);
  nor_510_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_197));
  mux_tmp_198 <= MUX_s_1_2_2(nor_510_nl, mux_tmp_197, or_521_cse);
  and_781_nl <= nand_144_cse AND mux_tmp_198;
  mux_199_nl <= MUX_s_1_2_2(and_781_nl, mux_tmp_198, or_516_cse);
  and_dcpl_464 <= mux_199_nl AND and_dcpl_117;
  or_548_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101"));
  nor_504_nl <= NOT(and_dcpl_130 OR and_dcpl_117);
  or_550_nl <= (result_rem_11cyc_st_5(1)) OR (NOT (result_rem_11cyc_st_5(0))) OR
      (result_rem_11cyc_st_5(3)) OR (NOT and_dcpl_115);
  mux_tmp_200 <= MUX_s_1_2_2(nor_504_nl, or_550_nl, or_548_cse);
  nor_505_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_200));
  mux_tmp_201 <= MUX_s_1_2_2(nor_505_nl, mux_tmp_200, or_537_cse);
  nor_506_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_201));
  mux_tmp_202 <= MUX_s_1_2_2(nor_506_nl, mux_tmp_201, or_528_cse);
  nor_507_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_202));
  mux_tmp_203 <= MUX_s_1_2_2(nor_507_nl, mux_tmp_202, or_521_cse);
  and_780_nl <= nand_144_cse AND mux_tmp_203;
  mux_204_nl <= MUX_s_1_2_2(and_780_nl, mux_tmp_203, or_516_cse);
  and_dcpl_468 <= mux_204_nl AND and_dcpl_94;
  or_561_cse <= (result_rem_11cyc_st_5(1)) OR (NOT (result_rem_11cyc_st_5(0))) OR
      (result_rem_11cyc_st_5(3));
  nor_499_nl <= NOT(and_790_cse OR and_dcpl_94);
  or_563_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_79);
  mux_tmp_205 <= MUX_s_1_2_2(nor_499_nl, or_563_nl, or_561_cse);
  nor_500_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_205));
  mux_tmp_206 <= MUX_s_1_2_2(nor_500_nl, mux_tmp_205, or_548_cse);
  nor_501_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_206));
  mux_tmp_207 <= MUX_s_1_2_2(nor_501_nl, mux_tmp_206, or_537_cse);
  nor_502_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_207));
  mux_tmp_208 <= MUX_s_1_2_2(nor_502_nl, mux_tmp_207, or_528_cse);
  nor_503_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_208));
  mux_tmp_209 <= MUX_s_1_2_2(nor_503_nl, mux_tmp_208, or_521_cse);
  and_778_nl <= nand_144_cse AND mux_tmp_209;
  mux_210_nl <= MUX_s_1_2_2(and_778_nl, mux_tmp_209, or_516_cse);
  and_dcpl_472 <= mux_210_nl AND and_dcpl_68;
  or_576_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101"));
  nor_494_nl <= NOT(and_dcpl_79 OR and_dcpl_68);
  or_578_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_53);
  mux_tmp_211 <= MUX_s_1_2_2(nor_494_nl, or_578_nl, or_576_cse);
  and_777_nl <= nand_138_cse AND mux_tmp_211;
  mux_tmp_212 <= MUX_s_1_2_2(and_777_nl, mux_tmp_211, or_561_cse);
  nor_495_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_212));
  mux_tmp_213 <= MUX_s_1_2_2(nor_495_nl, mux_tmp_212, or_548_cse);
  nor_496_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_213));
  mux_tmp_214 <= MUX_s_1_2_2(nor_496_nl, mux_tmp_213, or_537_cse);
  nor_497_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_214));
  mux_tmp_215 <= MUX_s_1_2_2(nor_497_nl, mux_tmp_214, or_528_cse);
  nor_498_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_215));
  mux_tmp_216 <= MUX_s_1_2_2(nor_498_nl, mux_tmp_215, or_521_cse);
  and_776_nl <= nand_144_cse AND mux_tmp_216;
  mux_217_nl <= MUX_s_1_2_2(and_776_nl, mux_tmp_216, or_516_cse);
  and_dcpl_474 <= mux_217_nl AND and_dcpl_40;
  nor_488_nl <= NOT(and_dcpl_53 OR and_dcpl_40);
  or_595_nl <= (NOT (result_rem_11cyc_st_8(0))) OR (result_rem_11cyc_st_8(1)) OR
      (result_rem_11cyc_st_8(3)) OR (NOT and_dcpl_38);
  or_593_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101"));
  mux_tmp_218 <= MUX_s_1_2_2(nor_488_nl, or_595_nl, or_593_nl);
  nor_489_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_218));
  mux_tmp_219 <= MUX_s_1_2_2(nor_489_nl, mux_tmp_218, or_576_cse);
  and_774_nl <= nand_138_cse AND mux_tmp_219;
  mux_tmp_220 <= MUX_s_1_2_2(and_774_nl, mux_tmp_219, or_561_cse);
  nor_490_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_220));
  mux_tmp_221 <= MUX_s_1_2_2(nor_490_nl, mux_tmp_220, or_548_cse);
  nor_491_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_221));
  mux_tmp_222 <= MUX_s_1_2_2(nor_491_nl, mux_tmp_221, or_537_cse);
  nor_492_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_222));
  mux_tmp_223 <= MUX_s_1_2_2(nor_492_nl, mux_tmp_222, or_528_cse);
  nor_493_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_223));
  mux_tmp_224 <= MUX_s_1_2_2(nor_493_nl, mux_tmp_223, or_521_cse);
  and_775_nl <= nand_144_cse AND mux_tmp_224;
  mux_225_nl <= MUX_s_1_2_2(and_775_nl, mux_tmp_224, or_516_cse);
  and_dcpl_476 <= mux_225_nl AND and_dcpl_13 AND and_dcpl_6;
  and_tmp_41 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0101")));
  nor_487_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_41));
  mux_tmp_226 <= MUX_s_1_2_2(nor_487_nl, and_tmp_41, or_521_cse);
  and_773_nl <= nand_146_cse AND mux_tmp_226;
  or_604_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_227 <= MUX_s_1_2_2(and_773_nl, mux_tmp_226, or_604_nl);
  and_dcpl_480 <= and_dcpl_417 AND and_dcpl_352;
  or_tmp_602 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_208);
  or_617_cse <= (NOT (result_result_acc_tmp(1))) OR (result_result_acc_tmp(0)) OR
      (result_result_acc_tmp(3));
  and_772_nl <= nand_144_cse AND or_tmp_602;
  mux_228_nl <= MUX_s_1_2_2(and_772_nl, or_tmp_602, or_617_cse);
  and_dcpl_484 <= mux_228_nl AND and_dcpl_199;
  or_622_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0110"));
  nor_486_nl <= NOT(and_dcpl_208 OR and_dcpl_199);
  or_624_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_182);
  mux_tmp_229 <= MUX_s_1_2_2(nor_486_nl, or_624_nl, or_622_cse);
  and_771_nl <= nand_144_cse AND mux_tmp_229;
  mux_230_nl <= MUX_s_1_2_2(and_771_nl, mux_tmp_229, or_617_cse);
  and_dcpl_488 <= mux_230_nl AND and_dcpl_173;
  or_629_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110"));
  nor_484_nl <= NOT(and_dcpl_182 OR and_dcpl_173);
  or_631_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_156);
  mux_tmp_231 <= MUX_s_1_2_2(nor_484_nl, or_631_nl, or_629_cse);
  nor_485_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_231));
  mux_tmp_232 <= MUX_s_1_2_2(nor_485_nl, mux_tmp_231, or_622_cse);
  and_770_nl <= nand_144_cse AND mux_tmp_232;
  mux_233_nl <= MUX_s_1_2_2(and_770_nl, mux_tmp_232, or_617_cse);
  and_dcpl_491 <= mux_233_nl AND and_dcpl_147;
  or_638_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110"));
  nor_481_nl <= NOT(and_dcpl_156 OR and_dcpl_147);
  or_640_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_130);
  mux_tmp_234 <= MUX_s_1_2_2(nor_481_nl, or_640_nl, or_638_cse);
  nor_482_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_234));
  mux_tmp_235 <= MUX_s_1_2_2(nor_482_nl, mux_tmp_234, or_629_cse);
  nor_483_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_235));
  mux_tmp_236 <= MUX_s_1_2_2(nor_483_nl, mux_tmp_235, or_622_cse);
  and_769_nl <= nand_144_cse AND mux_tmp_236;
  mux_237_nl <= MUX_s_1_2_2(and_769_nl, mux_tmp_236, or_617_cse);
  and_dcpl_493 <= mux_237_nl AND and_dcpl_118;
  or_649_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110"));
  nor_477_nl <= NOT(and_dcpl_130 OR and_dcpl_118);
  or_651_nl <= (NOT (result_rem_11cyc_st_5(1))) OR (result_rem_11cyc_st_5(0)) OR
      (result_rem_11cyc_st_5(3)) OR (NOT and_dcpl_115);
  mux_tmp_238 <= MUX_s_1_2_2(nor_477_nl, or_651_nl, or_649_cse);
  nor_478_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_238));
  mux_tmp_239 <= MUX_s_1_2_2(nor_478_nl, mux_tmp_238, or_638_cse);
  nor_479_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_239));
  mux_tmp_240 <= MUX_s_1_2_2(nor_479_nl, mux_tmp_239, or_629_cse);
  nor_480_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_240));
  mux_tmp_241 <= MUX_s_1_2_2(nor_480_nl, mux_tmp_240, or_622_cse);
  and_768_nl <= nand_144_cse AND mux_tmp_241;
  mux_242_nl <= MUX_s_1_2_2(and_768_nl, mux_tmp_241, or_617_cse);
  and_dcpl_496 <= mux_242_nl AND and_dcpl_96;
  or_662_cse <= (NOT (result_rem_11cyc_st_5(1))) OR (result_rem_11cyc_st_5(0)) OR
      (result_rem_11cyc_st_5(3));
  nor_472_nl <= NOT(and_790_cse OR and_dcpl_96);
  or_664_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_79);
  mux_tmp_243 <= MUX_s_1_2_2(nor_472_nl, or_664_nl, or_662_cse);
  nor_473_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_243));
  mux_tmp_244 <= MUX_s_1_2_2(nor_473_nl, mux_tmp_243, or_649_cse);
  nor_474_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_244));
  mux_tmp_245 <= MUX_s_1_2_2(nor_474_nl, mux_tmp_244, or_638_cse);
  nor_475_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_245));
  mux_tmp_246 <= MUX_s_1_2_2(nor_475_nl, mux_tmp_245, or_629_cse);
  nor_476_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_246));
  mux_tmp_247 <= MUX_s_1_2_2(nor_476_nl, mux_tmp_246, or_622_cse);
  and_766_nl <= nand_144_cse AND mux_tmp_247;
  mux_248_nl <= MUX_s_1_2_2(and_766_nl, mux_tmp_247, or_617_cse);
  and_dcpl_499 <= mux_248_nl AND and_dcpl_70;
  or_677_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110"));
  nor_467_nl <= NOT(and_dcpl_79 OR and_dcpl_70);
  or_679_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_53);
  mux_tmp_249 <= MUX_s_1_2_2(nor_467_nl, or_679_nl, or_677_cse);
  and_765_nl <= nand_138_cse AND mux_tmp_249;
  mux_tmp_250 <= MUX_s_1_2_2(and_765_nl, mux_tmp_249, or_662_cse);
  nor_468_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_250));
  mux_tmp_251 <= MUX_s_1_2_2(nor_468_nl, mux_tmp_250, or_649_cse);
  nor_469_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_251));
  mux_tmp_252 <= MUX_s_1_2_2(nor_469_nl, mux_tmp_251, or_638_cse);
  nor_470_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_252));
  mux_tmp_253 <= MUX_s_1_2_2(nor_470_nl, mux_tmp_252, or_629_cse);
  nor_471_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_253));
  mux_tmp_254 <= MUX_s_1_2_2(nor_471_nl, mux_tmp_253, or_622_cse);
  and_764_nl <= nand_144_cse AND mux_tmp_254;
  mux_255_nl <= MUX_s_1_2_2(and_764_nl, mux_tmp_254, or_617_cse);
  and_dcpl_501 <= mux_255_nl AND and_dcpl_41;
  nor_461_nl <= NOT(and_dcpl_53 OR and_dcpl_41);
  or_696_nl <= (result_rem_11cyc_st_8(0)) OR (NOT (result_rem_11cyc_st_8(1))) OR
      (result_rem_11cyc_st_8(3)) OR (NOT and_dcpl_38);
  or_694_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110"));
  mux_tmp_256 <= MUX_s_1_2_2(nor_461_nl, or_696_nl, or_694_nl);
  nor_462_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_256));
  mux_tmp_257 <= MUX_s_1_2_2(nor_462_nl, mux_tmp_256, or_677_cse);
  and_762_nl <= nand_138_cse AND mux_tmp_257;
  mux_tmp_258 <= MUX_s_1_2_2(and_762_nl, mux_tmp_257, or_662_cse);
  nor_463_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_258));
  mux_tmp_259 <= MUX_s_1_2_2(nor_463_nl, mux_tmp_258, or_649_cse);
  nor_464_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_259));
  mux_tmp_260 <= MUX_s_1_2_2(nor_464_nl, mux_tmp_259, or_638_cse);
  nor_465_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_260));
  mux_tmp_261 <= MUX_s_1_2_2(nor_465_nl, mux_tmp_260, or_629_cse);
  nor_466_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_261));
  mux_tmp_262 <= MUX_s_1_2_2(nor_466_nl, mux_tmp_261, or_622_cse);
  and_763_nl <= nand_144_cse AND mux_tmp_262;
  mux_263_nl <= MUX_s_1_2_2(and_763_nl, mux_tmp_262, or_617_cse);
  and_dcpl_503 <= mux_263_nl AND and_dcpl_13 AND and_dcpl_9;
  and_tmp_48 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0110")));
  nor_459_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_48));
  mux_tmp_264 <= MUX_s_1_2_2(nor_459_nl, and_tmp_48, or_622_cse);
  nor_460_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_264));
  or_705_nl <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0110"));
  mux_tmp_265 <= MUX_s_1_2_2(nor_460_nl, mux_tmp_264, or_705_nl);
  and_dcpl_507 <= and_dcpl_417 AND and_dcpl_386;
  or_tmp_702 <= NOT(CONV_SL_1_1(result_rem_11cyc=STD_LOGIC_VECTOR'("0111")) AND and_dcpl_208);
  or_718_cse <= (NOT (result_result_acc_tmp(1))) OR (NOT (result_result_acc_tmp(0)))
      OR (result_result_acc_tmp(3));
  and_761_nl <= nand_144_cse AND or_tmp_702;
  mux_266_nl <= MUX_s_1_2_2(and_761_nl, or_tmp_702, or_718_cse);
  and_dcpl_510 <= mux_266_nl AND and_dcpl_201;
  nand_112_cse <= NOT(CONV_SL_1_1(result_rem_11cyc=STD_LOGIC_VECTOR'("0111")));
  nor_458_nl <= NOT(and_dcpl_208 OR and_dcpl_201);
  nand_153_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_182);
  mux_tmp_267 <= MUX_s_1_2_2(nor_458_nl, nand_153_nl, nand_112_cse);
  and_760_nl <= nand_144_cse AND mux_tmp_267;
  mux_268_nl <= MUX_s_1_2_2(and_760_nl, mux_tmp_267, or_718_cse);
  and_dcpl_513 <= mux_268_nl AND and_dcpl_175;
  nand_108_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111")));
  nor_456_nl <= NOT(and_dcpl_182 OR and_dcpl_175);
  nand_152_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_156);
  mux_tmp_269 <= MUX_s_1_2_2(nor_456_nl, nand_152_nl, nand_108_cse);
  nor_457_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_269));
  mux_tmp_270 <= MUX_s_1_2_2(nor_457_nl, mux_tmp_269, nand_112_cse);
  and_759_nl <= nand_144_cse AND mux_tmp_270;
  mux_271_nl <= MUX_s_1_2_2(and_759_nl, mux_tmp_270, or_718_cse);
  and_dcpl_516 <= mux_271_nl AND and_dcpl_149;
  nand_103_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111")));
  nor_453_nl <= NOT(and_dcpl_156 OR and_dcpl_149);
  nand_151_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_130);
  mux_tmp_272 <= MUX_s_1_2_2(nor_453_nl, nand_151_nl, nand_103_cse);
  nor_454_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_272));
  mux_tmp_273 <= MUX_s_1_2_2(nor_454_nl, mux_tmp_272, nand_108_cse);
  nor_455_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_273));
  mux_tmp_274 <= MUX_s_1_2_2(nor_455_nl, mux_tmp_273, nand_112_cse);
  and_758_nl <= nand_144_cse AND mux_tmp_274;
  mux_275_nl <= MUX_s_1_2_2(and_758_nl, mux_tmp_274, or_718_cse);
  and_dcpl_518 <= mux_275_nl AND and_dcpl_119;
  nand_97_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111")));
  nor_449_nl <= NOT(and_dcpl_130 OR and_dcpl_119);
  nand_96_nl <= NOT((result_rem_11cyc_st_5(1)) AND (result_rem_11cyc_st_5(0)) AND
      (NOT (result_rem_11cyc_st_5(3))) AND and_dcpl_115);
  mux_tmp_276 <= MUX_s_1_2_2(nor_449_nl, nand_96_nl, nand_97_cse);
  nor_450_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_276));
  mux_tmp_277 <= MUX_s_1_2_2(nor_450_nl, mux_tmp_276, nand_103_cse);
  nor_451_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_277));
  mux_tmp_278 <= MUX_s_1_2_2(nor_451_nl, mux_tmp_277, nand_108_cse);
  nor_452_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_278));
  mux_tmp_279 <= MUX_s_1_2_2(nor_452_nl, mux_tmp_278, nand_112_cse);
  and_757_nl <= nand_144_cse AND mux_tmp_279;
  mux_280_nl <= MUX_s_1_2_2(and_757_nl, mux_tmp_279, or_718_cse);
  and_dcpl_521 <= mux_280_nl AND and_dcpl_98;
  or_763_cse <= (NOT (result_rem_11cyc_st_5(1))) OR (NOT (result_rem_11cyc_st_5(0)))
      OR (result_rem_11cyc_st_5(3));
  nor_444_nl <= NOT(and_790_cse OR and_dcpl_98);
  nand_150_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_79);
  mux_tmp_281 <= MUX_s_1_2_2(nor_444_nl, nand_150_nl, or_763_cse);
  nor_445_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_281));
  mux_tmp_282 <= MUX_s_1_2_2(nor_445_nl, mux_tmp_281, nand_97_cse);
  nor_446_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_282));
  mux_tmp_283 <= MUX_s_1_2_2(nor_446_nl, mux_tmp_282, nand_103_cse);
  nor_447_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_283));
  mux_tmp_284 <= MUX_s_1_2_2(nor_447_nl, mux_tmp_283, nand_108_cse);
  nor_448_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_284));
  mux_tmp_285 <= MUX_s_1_2_2(nor_448_nl, mux_tmp_284, nand_112_cse);
  and_755_nl <= nand_144_cse AND mux_tmp_285;
  mux_286_nl <= MUX_s_1_2_2(and_755_nl, mux_tmp_285, or_718_cse);
  and_dcpl_524 <= mux_286_nl AND and_dcpl_72;
  nand_83_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111")));
  nor_439_nl <= NOT(and_dcpl_79 OR and_dcpl_72);
  nand_149_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_53);
  mux_tmp_287 <= MUX_s_1_2_2(nor_439_nl, nand_149_nl, nand_83_cse);
  and_754_nl <= nand_138_cse AND mux_tmp_287;
  mux_tmp_288 <= MUX_s_1_2_2(and_754_nl, mux_tmp_287, or_763_cse);
  nor_440_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_288));
  mux_tmp_289 <= MUX_s_1_2_2(nor_440_nl, mux_tmp_288, nand_97_cse);
  nor_441_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_289));
  mux_tmp_290 <= MUX_s_1_2_2(nor_441_nl, mux_tmp_289, nand_103_cse);
  nor_442_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_290));
  mux_tmp_291 <= MUX_s_1_2_2(nor_442_nl, mux_tmp_290, nand_108_cse);
  nor_443_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_291));
  mux_tmp_292 <= MUX_s_1_2_2(nor_443_nl, mux_tmp_291, nand_112_cse);
  and_753_nl <= nand_144_cse AND mux_tmp_292;
  mux_293_nl <= MUX_s_1_2_2(and_753_nl, mux_tmp_292, or_718_cse);
  and_dcpl_526 <= mux_293_nl AND and_dcpl_42;
  nor_433_nl <= NOT(and_dcpl_53 OR and_dcpl_42);
  nand_72_nl <= NOT((result_rem_11cyc_st_8(0)) AND (result_rem_11cyc_st_8(1)) AND
      (NOT (result_rem_11cyc_st_8(3))) AND and_dcpl_38);
  nand_73_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111")));
  mux_tmp_294 <= MUX_s_1_2_2(nor_433_nl, nand_72_nl, nand_73_nl);
  nor_434_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_294));
  mux_tmp_295 <= MUX_s_1_2_2(nor_434_nl, mux_tmp_294, nand_83_cse);
  and_751_nl <= nand_138_cse AND mux_tmp_295;
  mux_tmp_296 <= MUX_s_1_2_2(and_751_nl, mux_tmp_295, or_763_cse);
  nor_435_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_296));
  mux_tmp_297 <= MUX_s_1_2_2(nor_435_nl, mux_tmp_296, nand_97_cse);
  nor_436_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_297));
  mux_tmp_298 <= MUX_s_1_2_2(nor_436_nl, mux_tmp_297, nand_103_cse);
  nor_437_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_298));
  mux_tmp_299 <= MUX_s_1_2_2(nor_437_nl, mux_tmp_298, nand_108_cse);
  nor_438_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_299));
  mux_tmp_300 <= MUX_s_1_2_2(nor_438_nl, mux_tmp_299, nand_112_cse);
  and_752_nl <= nand_144_cse AND mux_tmp_300;
  mux_301_nl <= MUX_s_1_2_2(and_752_nl, mux_tmp_300, or_718_cse);
  and_dcpl_528 <= mux_301_nl AND and_dcpl_13 AND and_dcpl_11;
  and_tmp_55 <= (NOT(main_stage_0_3 AND asn_itm_2 AND CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_4 AND asn_itm_3 AND CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_5 AND asn_itm_4 AND CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_6 AND asn_itm_5 AND CONV_SL_1_1(result_rem_11cyc_st_5=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_7 AND asn_itm_6 AND CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_9 AND asn_itm_8 AND CONV_SL_1_1(result_rem_11cyc_st_8=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_10 AND asn_itm_9 AND CONV_SL_1_1(result_rem_11cyc_st_9=STD_LOGIC_VECTOR'("0111"))));
  nor_432_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_55));
  mux_tmp_302 <= MUX_s_1_2_2(nor_432_nl, and_tmp_55, nand_112_cse);
  and_750_nl <= (NOT(CONV_SL_1_1(result_result_acc_tmp(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND ccs_ccore_start_rsci_idat)) AND mux_tmp_302;
  mux_tmp_303 <= MUX_s_1_2_2(and_750_nl, mux_tmp_302, result_result_acc_tmp(3));
  and_dcpl_532 <= and_dcpl_261 AND (result_result_acc_tmp(3));
  and_dcpl_533 <= and_dcpl_532 AND and_dcpl_260;
  not_tmp_645 <= NOT((result_rem_11cyc(3)) AND asn_itm_1 AND main_stage_0_2);
  or_tmp_801 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_645;
  or_818_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1000"));
  nor_431_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_801));
  mux_304_nl <= MUX_s_1_2_2(nor_431_nl, or_tmp_801, or_818_cse);
  and_dcpl_536 <= mux_304_nl AND and_dcpl_203;
  or_823_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_749_cse <= (result_rem_11cyc(3)) AND asn_itm_1 AND main_stage_0_2;
  nor_430_nl <= NOT(and_749_cse OR and_dcpl_203);
  or_825_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_202);
  mux_tmp_305 <= MUX_s_1_2_2(nor_430_nl, or_825_nl, or_823_cse);
  nor_429_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_305));
  mux_306_nl <= MUX_s_1_2_2(nor_429_nl, mux_tmp_305, or_818_cse);
  and_dcpl_539 <= mux_306_nl AND and_dcpl_177;
  or_830_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_747_cse <= (result_rem_11cyc_st_2(3)) AND asn_itm_2 AND main_stage_0_3;
  nor_428_nl <= NOT(and_747_cse OR and_dcpl_177);
  or_832_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_176);
  mux_tmp_307 <= MUX_s_1_2_2(nor_428_nl, or_832_nl, or_830_cse);
  and_748_nl <= not_tmp_645 AND mux_tmp_307;
  mux_tmp_308 <= MUX_s_1_2_2(and_748_nl, mux_tmp_307, or_823_cse);
  nor_427_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_308));
  mux_309_nl <= MUX_s_1_2_2(nor_427_nl, mux_tmp_308, or_818_cse);
  and_dcpl_542 <= mux_309_nl AND and_dcpl_151;
  or_839_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_744_cse <= (result_rem_11cyc_st_3(3)) AND asn_itm_3 AND main_stage_0_4;
  nor_426_nl <= NOT(and_744_cse OR and_dcpl_151);
  or_841_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_150);
  mux_tmp_310 <= MUX_s_1_2_2(nor_426_nl, or_841_nl, or_839_cse);
  nand_58_cse <= NOT((result_rem_11cyc_st_2(3)) AND asn_itm_2 AND main_stage_0_3);
  and_745_nl <= nand_58_cse AND mux_tmp_310;
  mux_tmp_311 <= MUX_s_1_2_2(and_745_nl, mux_tmp_310, or_830_cse);
  and_746_nl <= not_tmp_645 AND mux_tmp_311;
  mux_tmp_312 <= MUX_s_1_2_2(and_746_nl, mux_tmp_311, or_823_cse);
  nor_425_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_312));
  mux_313_nl <= MUX_s_1_2_2(nor_425_nl, mux_tmp_312, or_818_cse);
  and_dcpl_546 <= mux_313_nl AND and_dcpl_122;
  or_850_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_740_cse <= (result_rem_11cyc_st_4(3)) AND asn_itm_4 AND main_stage_0_5;
  nor_424_nl <= NOT(and_740_cse OR and_dcpl_122);
  or_852_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1000")) OR (NOT
      and_dcpl_105);
  mux_tmp_314 <= MUX_s_1_2_2(nor_424_nl, or_852_nl, or_850_cse);
  nand_55_cse <= NOT((result_rem_11cyc_st_3(3)) AND asn_itm_3 AND main_stage_0_4);
  and_741_nl <= nand_55_cse AND mux_tmp_314;
  mux_tmp_315 <= MUX_s_1_2_2(and_741_nl, mux_tmp_314, or_839_cse);
  and_742_nl <= nand_58_cse AND mux_tmp_315;
  mux_tmp_316 <= MUX_s_1_2_2(and_742_nl, mux_tmp_315, or_830_cse);
  and_743_nl <= not_tmp_645 AND mux_tmp_316;
  mux_tmp_317 <= MUX_s_1_2_2(and_743_nl, mux_tmp_316, or_823_cse);
  nor_423_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_317));
  mux_318_nl <= MUX_s_1_2_2(nor_423_nl, mux_tmp_317, or_818_cse);
  and_dcpl_549 <= mux_318_nl AND and_dcpl_100;
  or_863_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1000"));
  nor_422_nl <= NOT(and_dcpl_105 OR and_dcpl_100);
  or_865_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_99);
  mux_tmp_319 <= MUX_s_1_2_2(nor_422_nl, or_865_nl, or_863_cse);
  nand_51_cse <= NOT((result_rem_11cyc_st_4(3)) AND asn_itm_4 AND main_stage_0_5);
  and_736_nl <= nand_51_cse AND mux_tmp_319;
  mux_tmp_320 <= MUX_s_1_2_2(and_736_nl, mux_tmp_319, or_850_cse);
  and_737_nl <= nand_55_cse AND mux_tmp_320;
  mux_tmp_321 <= MUX_s_1_2_2(and_737_nl, mux_tmp_320, or_839_cse);
  and_738_nl <= nand_58_cse AND mux_tmp_321;
  mux_tmp_322 <= MUX_s_1_2_2(and_738_nl, mux_tmp_321, or_830_cse);
  and_739_nl <= not_tmp_645 AND mux_tmp_322;
  mux_tmp_323 <= MUX_s_1_2_2(and_739_nl, mux_tmp_322, or_823_cse);
  nor_421_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_323));
  mux_324_nl <= MUX_s_1_2_2(nor_421_nl, mux_tmp_323, or_818_cse);
  and_dcpl_552 <= mux_324_nl AND and_dcpl_74;
  or_878_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_731_cse <= (result_rem_11cyc_st_6(3)) AND asn_itm_6 AND main_stage_0_7;
  nor_419_nl <= NOT(and_731_cse OR and_dcpl_74);
  or_880_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_73);
  mux_tmp_325 <= MUX_s_1_2_2(nor_419_nl, or_880_nl, or_878_cse);
  nor_420_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_325));
  mux_tmp_326 <= MUX_s_1_2_2(nor_420_nl, mux_tmp_325, or_863_cse);
  and_732_nl <= nand_51_cse AND mux_tmp_326;
  mux_tmp_327 <= MUX_s_1_2_2(and_732_nl, mux_tmp_326, or_850_cse);
  and_733_nl <= nand_55_cse AND mux_tmp_327;
  mux_tmp_328 <= MUX_s_1_2_2(and_733_nl, mux_tmp_327, or_839_cse);
  and_734_nl <= nand_58_cse AND mux_tmp_328;
  mux_tmp_329 <= MUX_s_1_2_2(and_734_nl, mux_tmp_328, or_830_cse);
  and_735_nl <= not_tmp_645 AND mux_tmp_329;
  mux_tmp_330 <= MUX_s_1_2_2(and_735_nl, mux_tmp_329, or_823_cse);
  nor_418_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_330));
  mux_331_nl <= MUX_s_1_2_2(nor_418_nl, mux_tmp_330, or_818_cse);
  and_dcpl_556 <= mux_331_nl AND and_dcpl_45;
  and_725_cse <= (result_rem_11cyc_st_7(3)) AND asn_itm_7 AND main_stage_0_8;
  nor_415_nl <= NOT(and_725_cse OR and_dcpl_45);
  or_897_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1000")) OR (NOT
      and_dcpl_28);
  or_895_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_332 <= MUX_s_1_2_2(nor_415_nl, or_897_nl, or_895_nl);
  nand_42_cse <= NOT((result_rem_11cyc_st_6(3)) AND asn_itm_6 AND main_stage_0_7);
  and_726_nl <= nand_42_cse AND mux_tmp_332;
  mux_tmp_333 <= MUX_s_1_2_2(and_726_nl, mux_tmp_332, or_878_cse);
  nor_416_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_333));
  mux_tmp_334 <= MUX_s_1_2_2(nor_416_nl, mux_tmp_333, or_863_cse);
  and_727_nl <= nand_51_cse AND mux_tmp_334;
  mux_tmp_335 <= MUX_s_1_2_2(and_727_nl, mux_tmp_334, or_850_cse);
  and_728_nl <= nand_55_cse AND mux_tmp_335;
  mux_tmp_336 <= MUX_s_1_2_2(and_728_nl, mux_tmp_335, or_839_cse);
  and_729_nl <= nand_58_cse AND mux_tmp_336;
  mux_tmp_337 <= MUX_s_1_2_2(and_729_nl, mux_tmp_336, or_830_cse);
  and_730_nl <= not_tmp_645 AND mux_tmp_337;
  mux_tmp_338 <= MUX_s_1_2_2(and_730_nl, mux_tmp_337, or_823_cse);
  nor_417_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_338));
  mux_339_nl <= MUX_s_1_2_2(nor_417_nl, mux_tmp_338, or_818_cse);
  and_dcpl_560 <= mux_339_nl AND and_dcpl_4 AND and_dcpl_18 AND (NOT (result_rem_11cyc_st_9(0)));
  or_tmp_897 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1000"));
  nor_407_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_897));
  or_914_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_340 <= MUX_s_1_2_2(nor_407_nl, or_tmp_897, or_914_nl);
  nor_408_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_340));
  or_913_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_341 <= MUX_s_1_2_2(nor_408_nl, mux_tmp_340, or_913_nl);
  nor_409_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_341));
  or_912_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_342 <= MUX_s_1_2_2(nor_409_nl, mux_tmp_341, or_912_nl);
  nor_410_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_342));
  or_911_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_343 <= MUX_s_1_2_2(nor_410_nl, mux_tmp_342, or_911_nl);
  nor_411_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_343));
  or_910_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_344 <= MUX_s_1_2_2(nor_411_nl, mux_tmp_343, or_910_nl);
  nor_412_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_344));
  or_909_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_345 <= MUX_s_1_2_2(nor_412_nl, mux_tmp_344, or_909_nl);
  nor_413_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_345));
  or_908_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_346 <= MUX_s_1_2_2(nor_413_nl, mux_tmp_345, or_908_nl);
  and_724_nl <= not_tmp_645 AND mux_tmp_346;
  mux_tmp_347 <= MUX_s_1_2_2(and_724_nl, mux_tmp_346, or_823_cse);
  nor_414_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_347));
  mux_tmp_348 <= MUX_s_1_2_2(nor_414_nl, mux_tmp_347, or_818_cse);
  and_dcpl_566 <= and_dcpl_532 AND and_dcpl_318;
  or_tmp_909 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR not_tmp_645;
  or_928_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1001"));
  nor_406_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_909));
  mux_349_nl <= MUX_s_1_2_2(nor_406_nl, or_tmp_909, or_928_cse);
  and_dcpl_568 <= mux_349_nl AND and_dcpl_204;
  or_933_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_405_nl <= NOT(and_749_cse OR and_dcpl_204);
  or_935_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_202);
  mux_tmp_350 <= MUX_s_1_2_2(nor_405_nl, or_935_nl, or_933_cse);
  nor_404_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_350));
  mux_351_nl <= MUX_s_1_2_2(nor_404_nl, mux_tmp_350, or_928_cse);
  and_dcpl_570 <= mux_351_nl AND and_dcpl_178;
  or_940_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_403_nl <= NOT(and_747_cse OR and_dcpl_178);
  or_942_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_176);
  mux_tmp_352 <= MUX_s_1_2_2(nor_403_nl, or_942_nl, or_940_cse);
  and_722_nl <= not_tmp_645 AND mux_tmp_352;
  mux_tmp_353 <= MUX_s_1_2_2(and_722_nl, mux_tmp_352, or_933_cse);
  nor_402_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_353));
  mux_354_nl <= MUX_s_1_2_2(nor_402_nl, mux_tmp_353, or_928_cse);
  and_dcpl_572 <= mux_354_nl AND and_dcpl_152;
  or_949_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_401_nl <= NOT(and_744_cse OR and_dcpl_152);
  or_951_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_150);
  mux_tmp_355 <= MUX_s_1_2_2(nor_401_nl, or_951_nl, or_949_cse);
  and_719_nl <= nand_58_cse AND mux_tmp_355;
  mux_tmp_356 <= MUX_s_1_2_2(and_719_nl, mux_tmp_355, or_940_cse);
  and_720_nl <= not_tmp_645 AND mux_tmp_356;
  mux_tmp_357 <= MUX_s_1_2_2(and_720_nl, mux_tmp_356, or_933_cse);
  nor_400_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_357));
  mux_358_nl <= MUX_s_1_2_2(nor_400_nl, mux_tmp_357, or_928_cse);
  and_dcpl_576 <= mux_358_nl AND and_dcpl_125;
  or_960_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_399_nl <= NOT(and_740_cse OR and_dcpl_125);
  or_962_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1001")) OR (NOT
      and_dcpl_105);
  mux_tmp_359 <= MUX_s_1_2_2(nor_399_nl, or_962_nl, or_960_cse);
  and_715_nl <= nand_55_cse AND mux_tmp_359;
  mux_tmp_360 <= MUX_s_1_2_2(and_715_nl, mux_tmp_359, or_949_cse);
  and_716_nl <= nand_58_cse AND mux_tmp_360;
  mux_tmp_361 <= MUX_s_1_2_2(and_716_nl, mux_tmp_360, or_940_cse);
  and_717_nl <= not_tmp_645 AND mux_tmp_361;
  mux_tmp_362 <= MUX_s_1_2_2(and_717_nl, mux_tmp_361, or_933_cse);
  nor_398_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_362));
  mux_363_nl <= MUX_s_1_2_2(nor_398_nl, mux_tmp_362, or_928_cse);
  and_dcpl_578 <= mux_363_nl AND and_dcpl_101;
  or_973_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1001"));
  nor_397_nl <= NOT(and_dcpl_105 OR and_dcpl_101);
  or_975_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_99);
  mux_tmp_364 <= MUX_s_1_2_2(nor_397_nl, or_975_nl, or_973_cse);
  and_710_nl <= nand_51_cse AND mux_tmp_364;
  mux_tmp_365 <= MUX_s_1_2_2(and_710_nl, mux_tmp_364, or_960_cse);
  and_711_nl <= nand_55_cse AND mux_tmp_365;
  mux_tmp_366 <= MUX_s_1_2_2(and_711_nl, mux_tmp_365, or_949_cse);
  and_712_nl <= nand_58_cse AND mux_tmp_366;
  mux_tmp_367 <= MUX_s_1_2_2(and_712_nl, mux_tmp_366, or_940_cse);
  and_713_nl <= not_tmp_645 AND mux_tmp_367;
  mux_tmp_368 <= MUX_s_1_2_2(and_713_nl, mux_tmp_367, or_933_cse);
  nor_396_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_368));
  mux_369_nl <= MUX_s_1_2_2(nor_396_nl, mux_tmp_368, or_928_cse);
  and_dcpl_580 <= mux_369_nl AND and_dcpl_75;
  or_988_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_394_nl <= NOT(and_731_cse OR and_dcpl_75);
  or_990_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_73);
  mux_tmp_370 <= MUX_s_1_2_2(nor_394_nl, or_990_nl, or_988_cse);
  nor_395_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_370));
  mux_tmp_371 <= MUX_s_1_2_2(nor_395_nl, mux_tmp_370, or_973_cse);
  and_706_nl <= nand_51_cse AND mux_tmp_371;
  mux_tmp_372 <= MUX_s_1_2_2(and_706_nl, mux_tmp_371, or_960_cse);
  and_707_nl <= nand_55_cse AND mux_tmp_372;
  mux_tmp_373 <= MUX_s_1_2_2(and_707_nl, mux_tmp_372, or_949_cse);
  and_708_nl <= nand_58_cse AND mux_tmp_373;
  mux_tmp_374 <= MUX_s_1_2_2(and_708_nl, mux_tmp_373, or_940_cse);
  and_709_nl <= not_tmp_645 AND mux_tmp_374;
  mux_tmp_375 <= MUX_s_1_2_2(and_709_nl, mux_tmp_374, or_933_cse);
  nor_393_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_375));
  mux_376_nl <= MUX_s_1_2_2(nor_393_nl, mux_tmp_375, or_928_cse);
  and_dcpl_583 <= mux_376_nl AND and_dcpl_47;
  nor_390_nl <= NOT(and_725_cse OR and_dcpl_47);
  or_1007_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1001")) OR
      (NOT and_dcpl_28);
  or_1005_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_377 <= MUX_s_1_2_2(nor_390_nl, or_1007_nl, or_1005_nl);
  and_700_nl <= nand_42_cse AND mux_tmp_377;
  mux_tmp_378 <= MUX_s_1_2_2(and_700_nl, mux_tmp_377, or_988_cse);
  nor_391_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_378));
  mux_tmp_379 <= MUX_s_1_2_2(nor_391_nl, mux_tmp_378, or_973_cse);
  and_701_nl <= nand_51_cse AND mux_tmp_379;
  mux_tmp_380 <= MUX_s_1_2_2(and_701_nl, mux_tmp_379, or_960_cse);
  and_702_nl <= nand_55_cse AND mux_tmp_380;
  mux_tmp_381 <= MUX_s_1_2_2(and_702_nl, mux_tmp_380, or_949_cse);
  and_703_nl <= nand_58_cse AND mux_tmp_381;
  mux_tmp_382 <= MUX_s_1_2_2(and_703_nl, mux_tmp_381, or_940_cse);
  and_704_nl <= not_tmp_645 AND mux_tmp_382;
  mux_tmp_383 <= MUX_s_1_2_2(and_704_nl, mux_tmp_382, or_933_cse);
  nor_392_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_383));
  mux_384_nl <= MUX_s_1_2_2(nor_392_nl, mux_tmp_383, or_928_cse);
  and_dcpl_586 <= mux_384_nl AND and_dcpl_4 AND and_dcpl_18 AND (result_rem_11cyc_st_9(0));
  or_tmp_1005 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1001"));
  nor_383_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_1005));
  or_1024_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_385 <= MUX_s_1_2_2(nor_383_nl, or_tmp_1005, or_1024_nl);
  nor_384_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_385));
  or_1023_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_386 <= MUX_s_1_2_2(nor_384_nl, mux_tmp_385, or_1023_nl);
  nor_385_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_386));
  or_1022_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_387 <= MUX_s_1_2_2(nor_385_nl, mux_tmp_386, or_1022_nl);
  nor_386_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_387));
  or_1021_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_388 <= MUX_s_1_2_2(nor_386_nl, mux_tmp_387, or_1021_nl);
  nor_387_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_388));
  or_1020_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_389 <= MUX_s_1_2_2(nor_387_nl, mux_tmp_388, or_1020_nl);
  nor_388_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_389));
  or_1019_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_390 <= MUX_s_1_2_2(nor_388_nl, mux_tmp_389, or_1019_nl);
  nor_389_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_390));
  or_1018_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_391 <= MUX_s_1_2_2(nor_389_nl, mux_tmp_390, or_1018_nl);
  and_697_nl <= not_tmp_645 AND mux_tmp_391;
  mux_tmp_392 <= MUX_s_1_2_2(and_697_nl, mux_tmp_391, or_933_cse);
  and_698_nl <= nand_146_cse AND mux_tmp_392;
  or_1016_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"));
  mux_tmp_393 <= MUX_s_1_2_2(and_698_nl, mux_tmp_392, or_1016_nl);
  and_dcpl_590 <= and_dcpl_532 AND and_dcpl_352;
  or_tmp_1017 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_645;
  or_1037_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1010"));
  nor_382_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_1017));
  mux_394_nl <= MUX_s_1_2_2(nor_382_nl, or_tmp_1017, or_1037_cse);
  and_dcpl_592 <= mux_394_nl AND and_dcpl_205;
  or_1042_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_381_nl <= NOT(and_749_cse OR and_dcpl_205);
  or_1044_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_202);
  mux_tmp_395 <= MUX_s_1_2_2(nor_381_nl, or_1044_nl, or_1042_cse);
  nor_380_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_395));
  mux_396_nl <= MUX_s_1_2_2(nor_380_nl, mux_tmp_395, or_1037_cse);
  and_dcpl_594 <= mux_396_nl AND and_dcpl_179;
  or_1049_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_379_nl <= NOT(and_747_cse OR and_dcpl_179);
  or_1051_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_176);
  mux_tmp_397 <= MUX_s_1_2_2(nor_379_nl, or_1051_nl, or_1049_cse);
  and_695_nl <= not_tmp_645 AND mux_tmp_397;
  mux_tmp_398 <= MUX_s_1_2_2(and_695_nl, mux_tmp_397, or_1042_cse);
  nor_378_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_398));
  mux_399_nl <= MUX_s_1_2_2(nor_378_nl, mux_tmp_398, or_1037_cse);
  and_dcpl_596 <= mux_399_nl AND and_dcpl_153;
  or_1058_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_377_nl <= NOT(and_744_cse OR and_dcpl_153);
  or_1060_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_150);
  mux_tmp_400 <= MUX_s_1_2_2(nor_377_nl, or_1060_nl, or_1058_cse);
  and_692_nl <= nand_58_cse AND mux_tmp_400;
  mux_tmp_401 <= MUX_s_1_2_2(and_692_nl, mux_tmp_400, or_1049_cse);
  and_693_nl <= not_tmp_645 AND mux_tmp_401;
  mux_tmp_402 <= MUX_s_1_2_2(and_693_nl, mux_tmp_401, or_1042_cse);
  nor_376_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_402));
  mux_403_nl <= MUX_s_1_2_2(nor_376_nl, mux_tmp_402, or_1037_cse);
  and_dcpl_599 <= mux_403_nl AND and_dcpl_127;
  or_1069_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_375_nl <= NOT(and_740_cse OR and_dcpl_127);
  or_1071_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1010")) OR
      (NOT and_dcpl_105);
  mux_tmp_404 <= MUX_s_1_2_2(nor_375_nl, or_1071_nl, or_1069_cse);
  and_688_nl <= nand_55_cse AND mux_tmp_404;
  mux_tmp_405 <= MUX_s_1_2_2(and_688_nl, mux_tmp_404, or_1058_cse);
  and_689_nl <= nand_58_cse AND mux_tmp_405;
  mux_tmp_406 <= MUX_s_1_2_2(and_689_nl, mux_tmp_405, or_1049_cse);
  and_690_nl <= not_tmp_645 AND mux_tmp_406;
  mux_tmp_407 <= MUX_s_1_2_2(and_690_nl, mux_tmp_406, or_1042_cse);
  nor_374_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_407));
  mux_408_nl <= MUX_s_1_2_2(nor_374_nl, mux_tmp_407, or_1037_cse);
  and_dcpl_601 <= mux_408_nl AND and_dcpl_102;
  or_1082_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1010"));
  nor_373_nl <= NOT(and_dcpl_105 OR and_dcpl_102);
  or_1084_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_99);
  mux_tmp_409 <= MUX_s_1_2_2(nor_373_nl, or_1084_nl, or_1082_cse);
  and_683_nl <= nand_51_cse AND mux_tmp_409;
  mux_tmp_410 <= MUX_s_1_2_2(and_683_nl, mux_tmp_409, or_1069_cse);
  and_684_nl <= nand_55_cse AND mux_tmp_410;
  mux_tmp_411 <= MUX_s_1_2_2(and_684_nl, mux_tmp_410, or_1058_cse);
  and_685_nl <= nand_58_cse AND mux_tmp_411;
  mux_tmp_412 <= MUX_s_1_2_2(and_685_nl, mux_tmp_411, or_1049_cse);
  and_686_nl <= not_tmp_645 AND mux_tmp_412;
  mux_tmp_413 <= MUX_s_1_2_2(and_686_nl, mux_tmp_412, or_1042_cse);
  nor_372_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_413));
  mux_414_nl <= MUX_s_1_2_2(nor_372_nl, mux_tmp_413, or_1037_cse);
  and_dcpl_603 <= mux_414_nl AND and_dcpl_76;
  or_1097_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_370_nl <= NOT(and_731_cse OR and_dcpl_76);
  or_1099_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_73);
  mux_tmp_415 <= MUX_s_1_2_2(nor_370_nl, or_1099_nl, or_1097_cse);
  nor_371_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_415));
  mux_tmp_416 <= MUX_s_1_2_2(nor_371_nl, mux_tmp_415, or_1082_cse);
  and_679_nl <= nand_51_cse AND mux_tmp_416;
  mux_tmp_417 <= MUX_s_1_2_2(and_679_nl, mux_tmp_416, or_1069_cse);
  and_680_nl <= nand_55_cse AND mux_tmp_417;
  mux_tmp_418 <= MUX_s_1_2_2(and_680_nl, mux_tmp_417, or_1058_cse);
  and_681_nl <= nand_58_cse AND mux_tmp_418;
  mux_tmp_419 <= MUX_s_1_2_2(and_681_nl, mux_tmp_418, or_1049_cse);
  and_682_nl <= not_tmp_645 AND mux_tmp_419;
  mux_tmp_420 <= MUX_s_1_2_2(and_682_nl, mux_tmp_419, or_1042_cse);
  nor_369_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_420));
  mux_421_nl <= MUX_s_1_2_2(nor_369_nl, mux_tmp_420, or_1037_cse);
  and_dcpl_607 <= mux_421_nl AND and_dcpl_50;
  nor_366_nl <= NOT(and_725_cse OR and_dcpl_50);
  or_1116_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1010")) OR
      (NOT and_dcpl_28);
  or_1114_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_422 <= MUX_s_1_2_2(nor_366_nl, or_1116_nl, or_1114_nl);
  and_673_nl <= nand_42_cse AND mux_tmp_422;
  mux_tmp_423 <= MUX_s_1_2_2(and_673_nl, mux_tmp_422, or_1097_cse);
  nor_367_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_423));
  mux_tmp_424 <= MUX_s_1_2_2(nor_367_nl, mux_tmp_423, or_1082_cse);
  and_674_nl <= nand_51_cse AND mux_tmp_424;
  mux_tmp_425 <= MUX_s_1_2_2(and_674_nl, mux_tmp_424, or_1069_cse);
  and_675_nl <= nand_55_cse AND mux_tmp_425;
  mux_tmp_426 <= MUX_s_1_2_2(and_675_nl, mux_tmp_425, or_1058_cse);
  and_676_nl <= nand_58_cse AND mux_tmp_426;
  mux_tmp_427 <= MUX_s_1_2_2(and_676_nl, mux_tmp_426, or_1049_cse);
  and_677_nl <= not_tmp_645 AND mux_tmp_427;
  mux_tmp_428 <= MUX_s_1_2_2(and_677_nl, mux_tmp_427, or_1042_cse);
  nor_368_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_428));
  mux_429_nl <= MUX_s_1_2_2(nor_368_nl, mux_tmp_428, or_1037_cse);
  and_dcpl_611 <= mux_429_nl AND and_dcpl_4 AND (result_rem_11cyc_st_9(3)) AND (result_rem_11cyc_st_9(1))
      AND (NOT (result_rem_11cyc_st_9(0)));
  or_tmp_1113 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1010"));
  nor_358_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_1113));
  or_1133_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_430 <= MUX_s_1_2_2(nor_358_nl, or_tmp_1113, or_1133_nl);
  nor_359_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_430));
  or_1132_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_431 <= MUX_s_1_2_2(nor_359_nl, mux_tmp_430, or_1132_nl);
  nor_360_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_431));
  or_1131_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_432 <= MUX_s_1_2_2(nor_360_nl, mux_tmp_431, or_1131_nl);
  nor_361_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_432));
  or_1130_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_433 <= MUX_s_1_2_2(nor_361_nl, mux_tmp_432, or_1130_nl);
  nor_362_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_433));
  or_1129_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_434 <= MUX_s_1_2_2(nor_362_nl, mux_tmp_433, or_1129_nl);
  nor_363_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_434));
  or_1128_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_435 <= MUX_s_1_2_2(nor_363_nl, mux_tmp_434, or_1128_nl);
  nor_364_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_435));
  or_1127_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_436 <= MUX_s_1_2_2(nor_364_nl, mux_tmp_435, or_1127_nl);
  and_671_nl <= not_tmp_645 AND mux_tmp_436;
  mux_tmp_437 <= MUX_s_1_2_2(and_671_nl, mux_tmp_436, or_1042_cse);
  nor_365_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_437));
  mux_tmp_438 <= MUX_s_1_2_2(nor_365_nl, mux_tmp_437, or_1037_cse);
  return_rsci_d_mx0c0 <= and_dcpl_235 AND and_dcpl_233;
  return_rsci_d_mx0c1 <= and_dcpl_235 AND and_dcpl_237;
  return_rsci_d_mx0c2 <= and_dcpl_235 AND and_dcpl_240;
  return_rsci_d_mx0c3 <= and_dcpl_235 AND and_dcpl_239 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c4 <= and_dcpl_235 AND and_dcpl_244 AND (NOT (result_rem_11cyc_st_11(0)));
  return_rsci_d_mx0c5 <= and_dcpl_235 AND and_dcpl_244 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c6 <= and_dcpl_235 AND and_dcpl_249 AND (NOT (result_rem_11cyc_st_11(0)));
  return_rsci_d_mx0c7 <= and_dcpl_235 AND and_dcpl_249 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c8 <= and_dcpl_254 AND and_dcpl_233;
  return_rsci_d_mx0c9 <= and_dcpl_254 AND and_dcpl_237;
  return_rsci_d_mx0c10 <= and_dcpl_254 AND and_dcpl_240;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( (ccs_ccore_en AND (return_rsci_d_mx0c0 OR return_rsci_d_mx0c1 OR return_rsci_d_mx0c2
          OR return_rsci_d_mx0c3 OR return_rsci_d_mx0c4 OR return_rsci_d_mx0c5 OR
          return_rsci_d_mx0c6 OR return_rsci_d_mx0c7 OR return_rsci_d_mx0c8 OR return_rsci_d_mx0c9
          OR return_rsci_d_mx0c10)) = '1' ) THEN
        return_rsci_d <= MUX1HOT_v_64_11_2(result_rem_12_cmp_1_z, result_rem_12_cmp_2_z,
            result_rem_12_cmp_3_z, result_rem_12_cmp_4_z, result_rem_12_cmp_5_z,
            result_rem_12_cmp_6_z, result_rem_12_cmp_7_z, result_rem_12_cmp_8_z,
            result_rem_12_cmp_9_z, result_rem_12_cmp_10_z, result_rem_12_cmp_z, STD_LOGIC_VECTOR'(
            return_rsci_d_mx0c0 & return_rsci_d_mx0c1 & return_rsci_d_mx0c2 & return_rsci_d_mx0c3
            & return_rsci_d_mx0c4 & return_rsci_d_mx0c5 & return_rsci_d_mx0c6 & return_rsci_d_mx0c7
            & return_rsci_d_mx0c8 & return_rsci_d_mx0c9 & return_rsci_d_mx0c10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_11 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND main_stage_0_11 AND asn_itm_10) = '1' ) THEN
        result_rem_11cyc_st_11 <= result_rem_11cyc_st_10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
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
      ELSIF ( ccs_ccore_en = '1' ) THEN
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
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_1_cse = '1' ) THEN
        result_rem_12_cmp_1_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_1_2,
            m_buf_sva_mut_1_3, m_buf_sva_mut_1_4, m_buf_sva_mut_1_5, m_buf_sva_mut_1_6,
            m_buf_sva_mut_1_7, m_buf_sva_mut_1_8, m_buf_sva_mut_1_9, m_buf_sva_mut_1_10,
            STD_LOGIC_VECTOR'( and_dcpl_263 & and_dcpl_269 & and_dcpl_275 & and_dcpl_281
            & and_dcpl_287 & and_dcpl_293 & and_dcpl_299 & and_dcpl_305 & and_dcpl_311
            & mux_tmp_37));
        result_rem_12_cmp_1_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_1_2,
            base_buf_sva_mut_1_3, base_buf_sva_mut_1_4, base_buf_sva_mut_1_5, base_buf_sva_mut_1_6,
            base_buf_sva_mut_1_7, base_buf_sva_mut_1_8, base_buf_sva_mut_1_9, base_buf_sva_mut_1_10,
            STD_LOGIC_VECTOR'( and_dcpl_263 & and_dcpl_269 & and_dcpl_275 & and_dcpl_281
            & and_dcpl_287 & and_dcpl_293 & and_dcpl_299 & and_dcpl_305 & and_dcpl_311
            & mux_tmp_37));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_3_cse = '1' ) THEN
        result_rem_12_cmp_2_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2_2,
            m_buf_sva_mut_2_3, m_buf_sva_mut_2_4, m_buf_sva_mut_2_5, m_buf_sva_mut_2_6,
            m_buf_sva_mut_2_7, m_buf_sva_mut_2_8, m_buf_sva_mut_2_9, m_buf_sva_mut_2_10,
            STD_LOGIC_VECTOR'( and_dcpl_319 & and_dcpl_322 & and_dcpl_325 & and_dcpl_329
            & and_dcpl_333 & and_dcpl_337 & and_dcpl_341 & and_dcpl_344 & and_dcpl_347
            & mux_tmp_75));
        result_rem_12_cmp_2_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2_2,
            base_buf_sva_mut_2_3, base_buf_sva_mut_2_4, base_buf_sva_mut_2_5, base_buf_sva_mut_2_6,
            base_buf_sva_mut_2_7, base_buf_sva_mut_2_8, base_buf_sva_mut_2_9, base_buf_sva_mut_2_10,
            STD_LOGIC_VECTOR'( and_dcpl_319 & and_dcpl_322 & and_dcpl_325 & and_dcpl_329
            & and_dcpl_333 & and_dcpl_337 & and_dcpl_341 & and_dcpl_344 & and_dcpl_347
            & mux_tmp_75));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_5_cse = '1' ) THEN
        result_rem_12_cmp_3_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_3_2,
            m_buf_sva_mut_3_3, m_buf_sva_mut_3_4, m_buf_sva_mut_3_5, m_buf_sva_mut_3_6,
            m_buf_sva_mut_3_7, m_buf_sva_mut_3_8, m_buf_sva_mut_3_9, m_buf_sva_mut_3_10,
            STD_LOGIC_VECTOR'( and_dcpl_353 & and_dcpl_357 & and_dcpl_361 & and_dcpl_364
            & and_dcpl_367 & and_dcpl_370 & and_dcpl_373 & and_dcpl_377 & and_dcpl_381
            & mux_tmp_113));
        result_rem_12_cmp_3_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_3_2,
            base_buf_sva_mut_3_3, base_buf_sva_mut_3_4, base_buf_sva_mut_3_5, base_buf_sva_mut_3_6,
            base_buf_sva_mut_3_7, base_buf_sva_mut_3_8, base_buf_sva_mut_3_9, base_buf_sva_mut_3_10,
            STD_LOGIC_VECTOR'( and_dcpl_353 & and_dcpl_357 & and_dcpl_361 & and_dcpl_364
            & and_dcpl_367 & and_dcpl_370 & and_dcpl_373 & and_dcpl_377 & and_dcpl_381
            & mux_tmp_113));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_7_cse = '1' ) THEN
        result_rem_12_cmp_4_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_4_2,
            m_buf_sva_mut_4_3, m_buf_sva_mut_4_4, m_buf_sva_mut_4_5, m_buf_sva_mut_4_6,
            m_buf_sva_mut_4_7, m_buf_sva_mut_4_8, m_buf_sva_mut_4_9, m_buf_sva_mut_4_10,
            STD_LOGIC_VECTOR'( and_dcpl_387 & and_dcpl_390 & and_dcpl_393 & and_dcpl_396
            & and_dcpl_399 & and_dcpl_402 & and_dcpl_405 & and_dcpl_408 & and_dcpl_411
            & mux_tmp_151));
        result_rem_12_cmp_4_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_4_2,
            base_buf_sva_mut_4_3, base_buf_sva_mut_4_4, base_buf_sva_mut_4_5, base_buf_sva_mut_4_6,
            base_buf_sva_mut_4_7, base_buf_sva_mut_4_8, base_buf_sva_mut_4_9, base_buf_sva_mut_4_10,
            STD_LOGIC_VECTOR'( and_dcpl_387 & and_dcpl_390 & and_dcpl_393 & and_dcpl_396
            & and_dcpl_399 & and_dcpl_402 & and_dcpl_405 & and_dcpl_408 & and_dcpl_411
            & mux_tmp_151));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_9_cse = '1' ) THEN
        result_rem_12_cmp_5_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_5_2,
            m_buf_sva_mut_5_3, m_buf_sva_mut_5_4, m_buf_sva_mut_5_5, m_buf_sva_mut_5_6,
            m_buf_sva_mut_5_7, m_buf_sva_mut_5_8, m_buf_sva_mut_5_9, m_buf_sva_mut_5_10,
            STD_LOGIC_VECTOR'( and_dcpl_418 & and_dcpl_422 & and_dcpl_426 & and_dcpl_430
            & and_dcpl_433 & and_dcpl_437 & and_dcpl_441 & and_dcpl_444 & and_dcpl_447
            & mux_tmp_189));
        result_rem_12_cmp_5_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_5_2,
            base_buf_sva_mut_5_3, base_buf_sva_mut_5_4, base_buf_sva_mut_5_5, base_buf_sva_mut_5_6,
            base_buf_sva_mut_5_7, base_buf_sva_mut_5_8, base_buf_sva_mut_5_9, base_buf_sva_mut_5_10,
            STD_LOGIC_VECTOR'( and_dcpl_418 & and_dcpl_422 & and_dcpl_426 & and_dcpl_430
            & and_dcpl_433 & and_dcpl_437 & and_dcpl_441 & and_dcpl_444 & and_dcpl_447
            & mux_tmp_189));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_11_cse = '1' ) THEN
        result_rem_12_cmp_6_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_6_2,
            m_buf_sva_mut_6_3, m_buf_sva_mut_6_4, m_buf_sva_mut_6_5, m_buf_sva_mut_6_6,
            m_buf_sva_mut_6_7, m_buf_sva_mut_6_8, m_buf_sva_mut_6_9, m_buf_sva_mut_6_10,
            STD_LOGIC_VECTOR'( and_dcpl_452 & and_dcpl_455 & and_dcpl_458 & and_dcpl_462
            & and_dcpl_464 & and_dcpl_468 & and_dcpl_472 & and_dcpl_474 & and_dcpl_476
            & mux_tmp_227));
        result_rem_12_cmp_6_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_6_2,
            base_buf_sva_mut_6_3, base_buf_sva_mut_6_4, base_buf_sva_mut_6_5, base_buf_sva_mut_6_6,
            base_buf_sva_mut_6_7, base_buf_sva_mut_6_8, base_buf_sva_mut_6_9, base_buf_sva_mut_6_10,
            STD_LOGIC_VECTOR'( and_dcpl_452 & and_dcpl_455 & and_dcpl_458 & and_dcpl_462
            & and_dcpl_464 & and_dcpl_468 & and_dcpl_472 & and_dcpl_474 & and_dcpl_476
            & mux_tmp_227));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_13_cse = '1' ) THEN
        result_rem_12_cmp_7_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_7_2,
            m_buf_sva_mut_7_3, m_buf_sva_mut_7_4, m_buf_sva_mut_7_5, m_buf_sva_mut_7_6,
            m_buf_sva_mut_7_7, m_buf_sva_mut_7_8, m_buf_sva_mut_7_9, m_buf_sva_mut_7_10,
            STD_LOGIC_VECTOR'( and_dcpl_480 & and_dcpl_484 & and_dcpl_488 & and_dcpl_491
            & and_dcpl_493 & and_dcpl_496 & and_dcpl_499 & and_dcpl_501 & and_dcpl_503
            & mux_tmp_265));
        result_rem_12_cmp_7_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_7_2,
            base_buf_sva_mut_7_3, base_buf_sva_mut_7_4, base_buf_sva_mut_7_5, base_buf_sva_mut_7_6,
            base_buf_sva_mut_7_7, base_buf_sva_mut_7_8, base_buf_sva_mut_7_9, base_buf_sva_mut_7_10,
            STD_LOGIC_VECTOR'( and_dcpl_480 & and_dcpl_484 & and_dcpl_488 & and_dcpl_491
            & and_dcpl_493 & and_dcpl_496 & and_dcpl_499 & and_dcpl_501 & and_dcpl_503
            & mux_tmp_265));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_15_cse = '1' ) THEN
        result_rem_12_cmp_8_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_8_2,
            m_buf_sva_mut_8_3, m_buf_sva_mut_8_4, m_buf_sva_mut_8_5, m_buf_sva_mut_8_6,
            m_buf_sva_mut_8_7, m_buf_sva_mut_8_8, m_buf_sva_mut_8_9, m_buf_sva_mut_8_10,
            STD_LOGIC_VECTOR'( and_dcpl_507 & and_dcpl_510 & and_dcpl_513 & and_dcpl_516
            & and_dcpl_518 & and_dcpl_521 & and_dcpl_524 & and_dcpl_526 & and_dcpl_528
            & mux_tmp_303));
        result_rem_12_cmp_8_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_8_2,
            base_buf_sva_mut_8_3, base_buf_sva_mut_8_4, base_buf_sva_mut_8_5, base_buf_sva_mut_8_6,
            base_buf_sva_mut_8_7, base_buf_sva_mut_8_8, base_buf_sva_mut_8_9, base_buf_sva_mut_8_10,
            STD_LOGIC_VECTOR'( and_dcpl_507 & and_dcpl_510 & and_dcpl_513 & and_dcpl_516
            & and_dcpl_518 & and_dcpl_521 & and_dcpl_524 & and_dcpl_526 & and_dcpl_528
            & mux_tmp_303));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_17_cse = '1' ) THEN
        result_rem_12_cmp_9_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_9_2,
            m_buf_sva_mut_9_3, m_buf_sva_mut_9_4, m_buf_sva_mut_9_5, m_buf_sva_mut_9_6,
            m_buf_sva_mut_9_7, m_buf_sva_mut_9_8, m_buf_sva_mut_9_9, m_buf_sva_mut_9_10,
            STD_LOGIC_VECTOR'( and_dcpl_533 & and_dcpl_536 & and_dcpl_539 & and_dcpl_542
            & and_dcpl_546 & and_dcpl_549 & and_dcpl_552 & and_dcpl_556 & and_dcpl_560
            & mux_tmp_348));
        result_rem_12_cmp_9_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_9_2,
            base_buf_sva_mut_9_3, base_buf_sva_mut_9_4, base_buf_sva_mut_9_5, base_buf_sva_mut_9_6,
            base_buf_sva_mut_9_7, base_buf_sva_mut_9_8, base_buf_sva_mut_9_9, base_buf_sva_mut_9_10,
            STD_LOGIC_VECTOR'( and_dcpl_533 & and_dcpl_536 & and_dcpl_539 & and_dcpl_542
            & and_dcpl_546 & and_dcpl_549 & and_dcpl_552 & and_dcpl_556 & and_dcpl_560
            & mux_tmp_348));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_19_cse = '1' ) THEN
        result_rem_12_cmp_10_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_10_2,
            m_buf_sva_mut_10_3, m_buf_sva_mut_10_4, m_buf_sva_mut_10_5, m_buf_sva_mut_10_6,
            m_buf_sva_mut_10_7, m_buf_sva_mut_10_8, m_buf_sva_mut_10_9, m_buf_sva_mut_10_10,
            STD_LOGIC_VECTOR'( and_dcpl_566 & and_dcpl_568 & and_dcpl_570 & and_dcpl_572
            & and_dcpl_576 & and_dcpl_578 & and_dcpl_580 & and_dcpl_583 & and_dcpl_586
            & mux_tmp_393));
        result_rem_12_cmp_10_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_10_2,
            base_buf_sva_mut_10_3, base_buf_sva_mut_10_4, base_buf_sva_mut_10_5,
            base_buf_sva_mut_10_6, base_buf_sva_mut_10_7, base_buf_sva_mut_10_8,
            base_buf_sva_mut_10_9, base_buf_sva_mut_10_10, STD_LOGIC_VECTOR'( and_dcpl_566
            & and_dcpl_568 & and_dcpl_570 & and_dcpl_572 & and_dcpl_576 & and_dcpl_578
            & and_dcpl_580 & and_dcpl_583 & and_dcpl_586 & mux_tmp_393));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_21_cse = '1' ) THEN
        result_rem_12_cmp_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2, m_buf_sva_mut_3,
            m_buf_sva_mut_4, m_buf_sva_mut_5, m_buf_sva_mut_6, m_buf_sva_mut_7, m_buf_sva_mut_8,
            m_buf_sva_mut_9, m_buf_sva_mut_10, STD_LOGIC_VECTOR'( and_dcpl_590 &
            and_dcpl_592 & and_dcpl_594 & and_dcpl_596 & and_dcpl_599 & and_dcpl_601
            & and_dcpl_603 & and_dcpl_607 & and_dcpl_611 & mux_tmp_438));
        result_rem_12_cmp_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2,
            base_buf_sva_mut_3, base_buf_sva_mut_4, base_buf_sva_mut_5, base_buf_sva_mut_6,
            base_buf_sva_mut_7, base_buf_sva_mut_8, base_buf_sva_mut_9, base_buf_sva_mut_10,
            STD_LOGIC_VECTOR'( and_dcpl_590 & and_dcpl_592 & and_dcpl_594 & and_dcpl_596
            & and_dcpl_599 & and_dcpl_601 & and_dcpl_603 & and_dcpl_607 & and_dcpl_611
            & mux_tmp_438));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_cse = '1' ) THEN
        m_buf_sva_mut_1_10 <= m_buf_sva_mut_1_9;
        base_buf_sva_mut_1_10 <= base_buf_sva_mut_1_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_1_cse = '1' ) THEN
        m_buf_sva_mut_2_10 <= m_buf_sva_mut_2_9;
        base_buf_sva_mut_2_10 <= base_buf_sva_mut_2_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_2_cse = '1' ) THEN
        m_buf_sva_mut_3_10 <= m_buf_sva_mut_3_9;
        base_buf_sva_mut_3_10 <= base_buf_sva_mut_3_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_3_cse = '1' ) THEN
        m_buf_sva_mut_4_10 <= m_buf_sva_mut_4_9;
        base_buf_sva_mut_4_10 <= base_buf_sva_mut_4_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_4_cse = '1' ) THEN
        m_buf_sva_mut_5_10 <= m_buf_sva_mut_5_9;
        base_buf_sva_mut_5_10 <= base_buf_sva_mut_5_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_5_cse = '1' ) THEN
        m_buf_sva_mut_6_10 <= m_buf_sva_mut_6_9;
        base_buf_sva_mut_6_10 <= base_buf_sva_mut_6_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_6_cse = '1' ) THEN
        m_buf_sva_mut_7_10 <= m_buf_sva_mut_7_9;
        base_buf_sva_mut_7_10 <= base_buf_sva_mut_7_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_7_cse = '1' ) THEN
        m_buf_sva_mut_8_10 <= m_buf_sva_mut_8_9;
        base_buf_sva_mut_8_10 <= base_buf_sva_mut_8_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_8_cse = '1' ) THEN
        m_buf_sva_mut_9_10 <= m_buf_sva_mut_9_9;
        base_buf_sva_mut_9_10 <= base_buf_sva_mut_9_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_9_cse = '1' ) THEN
        m_buf_sva_mut_10_10 <= m_buf_sva_mut_10_9;
        base_buf_sva_mut_10_10 <= base_buf_sva_mut_10_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_10_cse = '1' ) THEN
        m_buf_sva_mut_10 <= m_buf_sva_mut_9;
        base_buf_sva_mut_10 <= base_buf_sva_mut_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_10 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_3) = '1' ) THEN
        result_rem_11cyc_st_10 <= result_rem_11cyc_st_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_11_cse = '1' ) THEN
        m_buf_sva_mut_1_9 <= m_buf_sva_mut_1_8;
        base_buf_sva_mut_1_9 <= base_buf_sva_mut_1_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_12_cse = '1' ) THEN
        m_buf_sva_mut_2_9 <= m_buf_sva_mut_2_8;
        base_buf_sva_mut_2_9 <= base_buf_sva_mut_2_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_13_cse = '1' ) THEN
        m_buf_sva_mut_3_9 <= m_buf_sva_mut_3_8;
        base_buf_sva_mut_3_9 <= base_buf_sva_mut_3_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_14_cse = '1' ) THEN
        m_buf_sva_mut_4_9 <= m_buf_sva_mut_4_8;
        base_buf_sva_mut_4_9 <= base_buf_sva_mut_4_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_15_cse = '1' ) THEN
        m_buf_sva_mut_5_9 <= m_buf_sva_mut_5_8;
        base_buf_sva_mut_5_9 <= base_buf_sva_mut_5_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_16_cse = '1' ) THEN
        m_buf_sva_mut_6_9 <= m_buf_sva_mut_6_8;
        base_buf_sva_mut_6_9 <= base_buf_sva_mut_6_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_17_cse = '1' ) THEN
        m_buf_sva_mut_7_9 <= m_buf_sva_mut_7_8;
        base_buf_sva_mut_7_9 <= base_buf_sva_mut_7_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_18_cse = '1' ) THEN
        m_buf_sva_mut_8_9 <= m_buf_sva_mut_8_8;
        base_buf_sva_mut_8_9 <= base_buf_sva_mut_8_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_19_cse = '1' ) THEN
        m_buf_sva_mut_9_9 <= m_buf_sva_mut_9_8;
        base_buf_sva_mut_9_9 <= base_buf_sva_mut_9_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_20_cse = '1' ) THEN
        m_buf_sva_mut_10_9 <= m_buf_sva_mut_10_8;
        base_buf_sva_mut_10_9 <= base_buf_sva_mut_10_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_21_cse = '1' ) THEN
        m_buf_sva_mut_9 <= m_buf_sva_mut_8;
        base_buf_sva_mut_9 <= base_buf_sva_mut_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_9 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_28) = '1' ) THEN
        result_rem_11cyc_st_9 <= result_rem_11cyc_st_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_22_cse = '1' ) THEN
        m_buf_sva_mut_1_8 <= m_buf_sva_mut_1_7;
        base_buf_sva_mut_1_8 <= base_buf_sva_mut_1_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_23_cse = '1' ) THEN
        m_buf_sva_mut_2_8 <= m_buf_sva_mut_2_7;
        base_buf_sva_mut_2_8 <= base_buf_sva_mut_2_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_24_cse = '1' ) THEN
        m_buf_sva_mut_3_8 <= m_buf_sva_mut_3_7;
        base_buf_sva_mut_3_8 <= base_buf_sva_mut_3_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_25_cse = '1' ) THEN
        m_buf_sva_mut_4_8 <= m_buf_sva_mut_4_7;
        base_buf_sva_mut_4_8 <= base_buf_sva_mut_4_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_26_cse = '1' ) THEN
        m_buf_sva_mut_5_8 <= m_buf_sva_mut_5_7;
        base_buf_sva_mut_5_8 <= base_buf_sva_mut_5_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_27_cse = '1' ) THEN
        m_buf_sva_mut_6_8 <= m_buf_sva_mut_6_7;
        base_buf_sva_mut_6_8 <= base_buf_sva_mut_6_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_28_cse = '1' ) THEN
        m_buf_sva_mut_7_8 <= m_buf_sva_mut_7_7;
        base_buf_sva_mut_7_8 <= base_buf_sva_mut_7_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_29_cse = '1' ) THEN
        m_buf_sva_mut_8_8 <= m_buf_sva_mut_8_7;
        base_buf_sva_mut_8_8 <= base_buf_sva_mut_8_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_30_cse = '1' ) THEN
        m_buf_sva_mut_9_8 <= m_buf_sva_mut_9_7;
        base_buf_sva_mut_9_8 <= base_buf_sva_mut_9_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_31_cse = '1' ) THEN
        m_buf_sva_mut_10_8 <= m_buf_sva_mut_10_7;
        base_buf_sva_mut_10_8 <= base_buf_sva_mut_10_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_32_cse = '1' ) THEN
        m_buf_sva_mut_8 <= m_buf_sva_mut_7;
        base_buf_sva_mut_8 <= base_buf_sva_mut_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_8 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_53) = '1' ) THEN
        result_rem_11cyc_st_8 <= result_rem_11cyc_st_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_33_cse = '1' ) THEN
        m_buf_sva_mut_1_7 <= m_buf_sva_mut_1_6;
        base_buf_sva_mut_1_7 <= base_buf_sva_mut_1_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_34_cse = '1' ) THEN
        m_buf_sva_mut_2_7 <= m_buf_sva_mut_2_6;
        base_buf_sva_mut_2_7 <= base_buf_sva_mut_2_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_35_cse = '1' ) THEN
        m_buf_sva_mut_3_7 <= m_buf_sva_mut_3_6;
        base_buf_sva_mut_3_7 <= base_buf_sva_mut_3_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_36_cse = '1' ) THEN
        m_buf_sva_mut_4_7 <= m_buf_sva_mut_4_6;
        base_buf_sva_mut_4_7 <= base_buf_sva_mut_4_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_37_cse = '1' ) THEN
        m_buf_sva_mut_5_7 <= m_buf_sva_mut_5_6;
        base_buf_sva_mut_5_7 <= base_buf_sva_mut_5_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_38_cse = '1' ) THEN
        m_buf_sva_mut_6_7 <= m_buf_sva_mut_6_6;
        base_buf_sva_mut_6_7 <= base_buf_sva_mut_6_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_39_cse = '1' ) THEN
        m_buf_sva_mut_7_7 <= m_buf_sva_mut_7_6;
        base_buf_sva_mut_7_7 <= base_buf_sva_mut_7_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_40_cse = '1' ) THEN
        m_buf_sva_mut_8_7 <= m_buf_sva_mut_8_6;
        base_buf_sva_mut_8_7 <= base_buf_sva_mut_8_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_41_cse = '1' ) THEN
        m_buf_sva_mut_9_7 <= m_buf_sva_mut_9_6;
        base_buf_sva_mut_9_7 <= base_buf_sva_mut_9_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_42_cse = '1' ) THEN
        m_buf_sva_mut_10_7 <= m_buf_sva_mut_10_6;
        base_buf_sva_mut_10_7 <= base_buf_sva_mut_10_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_43_cse = '1' ) THEN
        m_buf_sva_mut_7 <= m_buf_sva_mut_6;
        base_buf_sva_mut_7 <= base_buf_sva_mut_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_7 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_79) = '1' ) THEN
        result_rem_11cyc_st_7 <= result_rem_11cyc_st_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_44_cse = '1' ) THEN
        m_buf_sva_mut_1_6 <= m_buf_sva_mut_1_5;
        base_buf_sva_mut_1_6 <= base_buf_sva_mut_1_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_45_cse = '1' ) THEN
        m_buf_sva_mut_2_6 <= m_buf_sva_mut_2_5;
        base_buf_sva_mut_2_6 <= base_buf_sva_mut_2_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_46_cse = '1' ) THEN
        m_buf_sva_mut_3_6 <= m_buf_sva_mut_3_5;
        base_buf_sva_mut_3_6 <= base_buf_sva_mut_3_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_47_cse = '1' ) THEN
        m_buf_sva_mut_4_6 <= m_buf_sva_mut_4_5;
        base_buf_sva_mut_4_6 <= base_buf_sva_mut_4_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_48_cse = '1' ) THEN
        m_buf_sva_mut_5_6 <= m_buf_sva_mut_5_5;
        base_buf_sva_mut_5_6 <= base_buf_sva_mut_5_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_49_cse = '1' ) THEN
        m_buf_sva_mut_6_6 <= m_buf_sva_mut_6_5;
        base_buf_sva_mut_6_6 <= base_buf_sva_mut_6_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_50_cse = '1' ) THEN
        m_buf_sva_mut_7_6 <= m_buf_sva_mut_7_5;
        base_buf_sva_mut_7_6 <= base_buf_sva_mut_7_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_51_cse = '1' ) THEN
        m_buf_sva_mut_8_6 <= m_buf_sva_mut_8_5;
        base_buf_sva_mut_8_6 <= base_buf_sva_mut_8_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_52_cse = '1' ) THEN
        m_buf_sva_mut_9_6 <= m_buf_sva_mut_9_5;
        base_buf_sva_mut_9_6 <= base_buf_sva_mut_9_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_53_cse = '1' ) THEN
        m_buf_sva_mut_10_6 <= m_buf_sva_mut_10_5;
        base_buf_sva_mut_10_6 <= base_buf_sva_mut_10_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_54_cse = '1' ) THEN
        m_buf_sva_mut_6 <= m_buf_sva_mut_5;
        base_buf_sva_mut_6 <= base_buf_sva_mut_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_6 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_105) = '1' ) THEN
        result_rem_11cyc_st_6 <= result_rem_11cyc_st_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_55_cse = '1' ) THEN
        m_buf_sva_mut_1_5 <= m_buf_sva_mut_1_4;
        base_buf_sva_mut_1_5 <= base_buf_sva_mut_1_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_56_cse = '1' ) THEN
        m_buf_sva_mut_2_5 <= m_buf_sva_mut_2_4;
        base_buf_sva_mut_2_5 <= base_buf_sva_mut_2_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_57_cse = '1' ) THEN
        m_buf_sva_mut_3_5 <= m_buf_sva_mut_3_4;
        base_buf_sva_mut_3_5 <= base_buf_sva_mut_3_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_58_cse = '1' ) THEN
        m_buf_sva_mut_4_5 <= m_buf_sva_mut_4_4;
        base_buf_sva_mut_4_5 <= base_buf_sva_mut_4_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_59_cse = '1' ) THEN
        m_buf_sva_mut_5_5 <= m_buf_sva_mut_5_4;
        base_buf_sva_mut_5_5 <= base_buf_sva_mut_5_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_60_cse = '1' ) THEN
        m_buf_sva_mut_6_5 <= m_buf_sva_mut_6_4;
        base_buf_sva_mut_6_5 <= base_buf_sva_mut_6_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_61_cse = '1' ) THEN
        m_buf_sva_mut_7_5 <= m_buf_sva_mut_7_4;
        base_buf_sva_mut_7_5 <= base_buf_sva_mut_7_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_62_cse = '1' ) THEN
        m_buf_sva_mut_8_5 <= m_buf_sva_mut_8_4;
        base_buf_sva_mut_8_5 <= base_buf_sva_mut_8_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_63_cse = '1' ) THEN
        m_buf_sva_mut_9_5 <= m_buf_sva_mut_9_4;
        base_buf_sva_mut_9_5 <= base_buf_sva_mut_9_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_64_cse = '1' ) THEN
        m_buf_sva_mut_10_5 <= m_buf_sva_mut_10_4;
        base_buf_sva_mut_10_5 <= base_buf_sva_mut_10_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_65_cse = '1' ) THEN
        m_buf_sva_mut_5 <= m_buf_sva_mut_4;
        base_buf_sva_mut_5 <= base_buf_sva_mut_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_5 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_130) = '1' ) THEN
        result_rem_11cyc_st_5 <= result_rem_11cyc_st_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_66_cse = '1' ) THEN
        m_buf_sva_mut_1_4 <= m_buf_sva_mut_1_3;
        base_buf_sva_mut_1_4 <= base_buf_sva_mut_1_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_67_cse = '1' ) THEN
        m_buf_sva_mut_2_4 <= m_buf_sva_mut_2_3;
        base_buf_sva_mut_2_4 <= base_buf_sva_mut_2_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_68_cse = '1' ) THEN
        m_buf_sva_mut_3_4 <= m_buf_sva_mut_3_3;
        base_buf_sva_mut_3_4 <= base_buf_sva_mut_3_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_69_cse = '1' ) THEN
        m_buf_sva_mut_4_4 <= m_buf_sva_mut_4_3;
        base_buf_sva_mut_4_4 <= base_buf_sva_mut_4_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_70_cse = '1' ) THEN
        m_buf_sva_mut_5_4 <= m_buf_sva_mut_5_3;
        base_buf_sva_mut_5_4 <= base_buf_sva_mut_5_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_71_cse = '1' ) THEN
        m_buf_sva_mut_6_4 <= m_buf_sva_mut_6_3;
        base_buf_sva_mut_6_4 <= base_buf_sva_mut_6_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_72_cse = '1' ) THEN
        m_buf_sva_mut_7_4 <= m_buf_sva_mut_7_3;
        base_buf_sva_mut_7_4 <= base_buf_sva_mut_7_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_73_cse = '1' ) THEN
        m_buf_sva_mut_8_4 <= m_buf_sva_mut_8_3;
        base_buf_sva_mut_8_4 <= base_buf_sva_mut_8_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_74_cse = '1' ) THEN
        m_buf_sva_mut_9_4 <= m_buf_sva_mut_9_3;
        base_buf_sva_mut_9_4 <= base_buf_sva_mut_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_75_cse = '1' ) THEN
        m_buf_sva_mut_10_4 <= m_buf_sva_mut_10_3;
        base_buf_sva_mut_10_4 <= base_buf_sva_mut_10_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_76_cse = '1' ) THEN
        m_buf_sva_mut_4 <= m_buf_sva_mut_3;
        base_buf_sva_mut_4 <= base_buf_sva_mut_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_4 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_156) = '1' ) THEN
        result_rem_11cyc_st_4 <= result_rem_11cyc_st_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_77_cse = '1' ) THEN
        m_buf_sva_mut_1_3 <= m_buf_sva_mut_1_2;
        base_buf_sva_mut_1_3 <= base_buf_sva_mut_1_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_78_cse = '1' ) THEN
        m_buf_sva_mut_2_3 <= m_buf_sva_mut_2_2;
        base_buf_sva_mut_2_3 <= base_buf_sva_mut_2_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_79_cse = '1' ) THEN
        m_buf_sva_mut_3_3 <= m_buf_sva_mut_3_2;
        base_buf_sva_mut_3_3 <= base_buf_sva_mut_3_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_80_cse = '1' ) THEN
        m_buf_sva_mut_4_3 <= m_buf_sva_mut_4_2;
        base_buf_sva_mut_4_3 <= base_buf_sva_mut_4_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_81_cse = '1' ) THEN
        m_buf_sva_mut_5_3 <= m_buf_sva_mut_5_2;
        base_buf_sva_mut_5_3 <= base_buf_sva_mut_5_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_82_cse = '1' ) THEN
        m_buf_sva_mut_6_3 <= m_buf_sva_mut_6_2;
        base_buf_sva_mut_6_3 <= base_buf_sva_mut_6_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_83_cse = '1' ) THEN
        m_buf_sva_mut_7_3 <= m_buf_sva_mut_7_2;
        base_buf_sva_mut_7_3 <= base_buf_sva_mut_7_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_84_cse = '1' ) THEN
        m_buf_sva_mut_8_3 <= m_buf_sva_mut_8_2;
        base_buf_sva_mut_8_3 <= base_buf_sva_mut_8_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_85_cse = '1' ) THEN
        m_buf_sva_mut_9_3 <= m_buf_sva_mut_9_2;
        base_buf_sva_mut_9_3 <= base_buf_sva_mut_9_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_86_cse = '1' ) THEN
        m_buf_sva_mut_10_3 <= m_buf_sva_mut_10_2;
        base_buf_sva_mut_10_3 <= base_buf_sva_mut_10_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_87_cse = '1' ) THEN
        m_buf_sva_mut_3 <= m_buf_sva_mut_2;
        base_buf_sva_mut_3 <= base_buf_sva_mut_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_3 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_182) = '1' ) THEN
        result_rem_11cyc_st_3 <= result_rem_11cyc_st_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_88_cse = '1' ) THEN
        m_buf_sva_mut_1_2 <= result_rem_12_cmp_1_b;
        base_buf_sva_mut_1_2 <= result_rem_12_cmp_1_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_89_cse = '1' ) THEN
        m_buf_sva_mut_2_2 <= result_rem_12_cmp_2_b;
        base_buf_sva_mut_2_2 <= result_rem_12_cmp_2_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_90_cse = '1' ) THEN
        m_buf_sva_mut_3_2 <= result_rem_12_cmp_3_b;
        base_buf_sva_mut_3_2 <= result_rem_12_cmp_3_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_91_cse = '1' ) THEN
        m_buf_sva_mut_4_2 <= result_rem_12_cmp_4_b;
        base_buf_sva_mut_4_2 <= result_rem_12_cmp_4_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_92_cse = '1' ) THEN
        m_buf_sva_mut_5_2 <= result_rem_12_cmp_5_b;
        base_buf_sva_mut_5_2 <= result_rem_12_cmp_5_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_93_cse = '1' ) THEN
        m_buf_sva_mut_6_2 <= result_rem_12_cmp_6_b;
        base_buf_sva_mut_6_2 <= result_rem_12_cmp_6_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_94_cse = '1' ) THEN
        m_buf_sva_mut_7_2 <= result_rem_12_cmp_7_b;
        base_buf_sva_mut_7_2 <= result_rem_12_cmp_7_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_95_cse = '1' ) THEN
        m_buf_sva_mut_8_2 <= result_rem_12_cmp_8_b;
        base_buf_sva_mut_8_2 <= result_rem_12_cmp_8_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_96_cse = '1' ) THEN
        m_buf_sva_mut_9_2 <= result_rem_12_cmp_9_b;
        base_buf_sva_mut_9_2 <= result_rem_12_cmp_9_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_97_cse = '1' ) THEN
        m_buf_sva_mut_10_2 <= result_rem_12_cmp_10_b;
        base_buf_sva_mut_10_2 <= result_rem_12_cmp_10_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_98_cse = '1' ) THEN
        m_buf_sva_mut_2 <= result_rem_12_cmp_b;
        base_buf_sva_mut_2 <= result_rem_12_cmp_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_2 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_208) = '1' ) THEN
        result_rem_11cyc_st_2 <= result_rem_11cyc;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND ccs_ccore_start_rsci_idat) = '1' ) THEN
        result_rem_11cyc <= result_result_acc_tmp;
      END IF;
    END IF;
  END PROCESS;
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
--  Generated date: Thu Aug 26 02:01:31 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen;

ARCHITECTURE v12 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_56_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_84_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_112_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_140_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_168_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_196_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_224_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_core_core_fsm;

ARCHITECTURE v12 OF inPlaceNTT_DIF_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  TYPE inPlaceNTT_DIF_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5,
      COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10,
      COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15,
      COMP_LOOP_C_16, COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19, COMP_LOOP_C_20,
      COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24, COMP_LOOP_C_25,
      COMP_LOOP_C_26, COMP_LOOP_C_27, COMP_LOOP_C_28, COMP_LOOP_C_29, COMP_LOOP_C_30,
      COMP_LOOP_C_31, COMP_LOOP_C_32, COMP_LOOP_C_33, COMP_LOOP_C_34, COMP_LOOP_C_35,
      COMP_LOOP_C_36, COMP_LOOP_C_37, COMP_LOOP_C_38, COMP_LOOP_C_39, COMP_LOOP_C_40,
      COMP_LOOP_C_41, COMP_LOOP_C_42, COMP_LOOP_C_43, COMP_LOOP_C_44, COMP_LOOP_C_45,
      COMP_LOOP_C_46, COMP_LOOP_C_47, COMP_LOOP_C_48, COMP_LOOP_C_49, COMP_LOOP_C_50,
      COMP_LOOP_C_51, COMP_LOOP_C_52, COMP_LOOP_C_53, COMP_LOOP_C_54, COMP_LOOP_C_55,
      COMP_LOOP_C_56, COMP_LOOP_C_57, COMP_LOOP_C_58, COMP_LOOP_C_59, COMP_LOOP_C_60,
      COMP_LOOP_C_61, COMP_LOOP_C_62, COMP_LOOP_C_63, COMP_LOOP_C_64, COMP_LOOP_C_65,
      COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_C_68, COMP_LOOP_C_69, COMP_LOOP_C_70,
      COMP_LOOP_C_71, COMP_LOOP_C_72, COMP_LOOP_C_73, COMP_LOOP_C_74, COMP_LOOP_C_75,
      COMP_LOOP_C_76, COMP_LOOP_C_77, COMP_LOOP_C_78, COMP_LOOP_C_79, COMP_LOOP_C_80,
      COMP_LOOP_C_81, COMP_LOOP_C_82, COMP_LOOP_C_83, COMP_LOOP_C_84, COMP_LOOP_C_85,
      COMP_LOOP_C_86, COMP_LOOP_C_87, COMP_LOOP_C_88, COMP_LOOP_C_89, COMP_LOOP_C_90,
      COMP_LOOP_C_91, COMP_LOOP_C_92, COMP_LOOP_C_93, COMP_LOOP_C_94, COMP_LOOP_C_95,
      COMP_LOOP_C_96, COMP_LOOP_C_97, COMP_LOOP_C_98, COMP_LOOP_C_99, COMP_LOOP_C_100,
      COMP_LOOP_C_101, COMP_LOOP_C_102, COMP_LOOP_C_103, COMP_LOOP_C_104, COMP_LOOP_C_105,
      COMP_LOOP_C_106, COMP_LOOP_C_107, COMP_LOOP_C_108, COMP_LOOP_C_109, COMP_LOOP_C_110,
      COMP_LOOP_C_111, COMP_LOOP_C_112, COMP_LOOP_C_113, COMP_LOOP_C_114, COMP_LOOP_C_115,
      COMP_LOOP_C_116, COMP_LOOP_C_117, COMP_LOOP_C_118, COMP_LOOP_C_119, COMP_LOOP_C_120,
      COMP_LOOP_C_121, COMP_LOOP_C_122, COMP_LOOP_C_123, COMP_LOOP_C_124, COMP_LOOP_C_125,
      COMP_LOOP_C_126, COMP_LOOP_C_127, COMP_LOOP_C_128, COMP_LOOP_C_129, COMP_LOOP_C_130,
      COMP_LOOP_C_131, COMP_LOOP_C_132, COMP_LOOP_C_133, COMP_LOOP_C_134, COMP_LOOP_C_135,
      COMP_LOOP_C_136, COMP_LOOP_C_137, COMP_LOOP_C_138, COMP_LOOP_C_139, COMP_LOOP_C_140,
      COMP_LOOP_C_141, COMP_LOOP_C_142, COMP_LOOP_C_143, COMP_LOOP_C_144, COMP_LOOP_C_145,
      COMP_LOOP_C_146, COMP_LOOP_C_147, COMP_LOOP_C_148, COMP_LOOP_C_149, COMP_LOOP_C_150,
      COMP_LOOP_C_151, COMP_LOOP_C_152, COMP_LOOP_C_153, COMP_LOOP_C_154, COMP_LOOP_C_155,
      COMP_LOOP_C_156, COMP_LOOP_C_157, COMP_LOOP_C_158, COMP_LOOP_C_159, COMP_LOOP_C_160,
      COMP_LOOP_C_161, COMP_LOOP_C_162, COMP_LOOP_C_163, COMP_LOOP_C_164, COMP_LOOP_C_165,
      COMP_LOOP_C_166, COMP_LOOP_C_167, COMP_LOOP_C_168, COMP_LOOP_C_169, COMP_LOOP_C_170,
      COMP_LOOP_C_171, COMP_LOOP_C_172, COMP_LOOP_C_173, COMP_LOOP_C_174, COMP_LOOP_C_175,
      COMP_LOOP_C_176, COMP_LOOP_C_177, COMP_LOOP_C_178, COMP_LOOP_C_179, COMP_LOOP_C_180,
      COMP_LOOP_C_181, COMP_LOOP_C_182, COMP_LOOP_C_183, COMP_LOOP_C_184, COMP_LOOP_C_185,
      COMP_LOOP_C_186, COMP_LOOP_C_187, COMP_LOOP_C_188, COMP_LOOP_C_189, COMP_LOOP_C_190,
      COMP_LOOP_C_191, COMP_LOOP_C_192, COMP_LOOP_C_193, COMP_LOOP_C_194, COMP_LOOP_C_195,
      COMP_LOOP_C_196, COMP_LOOP_C_197, COMP_LOOP_C_198, COMP_LOOP_C_199, COMP_LOOP_C_200,
      COMP_LOOP_C_201, COMP_LOOP_C_202, COMP_LOOP_C_203, COMP_LOOP_C_204, COMP_LOOP_C_205,
      COMP_LOOP_C_206, COMP_LOOP_C_207, COMP_LOOP_C_208, COMP_LOOP_C_209, COMP_LOOP_C_210,
      COMP_LOOP_C_211, COMP_LOOP_C_212, COMP_LOOP_C_213, COMP_LOOP_C_214, COMP_LOOP_C_215,
      COMP_LOOP_C_216, COMP_LOOP_C_217, COMP_LOOP_C_218, COMP_LOOP_C_219, COMP_LOOP_C_220,
      COMP_LOOP_C_221, COMP_LOOP_C_222, COMP_LOOP_C_223, COMP_LOOP_C_224, VEC_LOOP_C_0,
      STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIF_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIF_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIF_core_core_fsm_1 : PROCESS (COMP_LOOP_C_28_tr0, COMP_LOOP_C_56_tr0,
      COMP_LOOP_C_84_tr0, COMP_LOOP_C_112_tr0, COMP_LOOP_C_140_tr0, COMP_LOOP_C_168_tr0,
      COMP_LOOP_C_196_tr0, COMP_LOOP_C_224_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0,
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
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        IF ( COMP_LOOP_C_28_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_29;
        END IF;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        IF ( COMP_LOOP_C_56_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_57;
        END IF;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        IF ( COMP_LOOP_C_84_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_85;
        END IF;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        IF ( COMP_LOOP_C_112_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_113;
        END IF;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        IF ( COMP_LOOP_C_140_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_141;
        END IF;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        IF ( COMP_LOOP_C_168_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_169;
        END IF;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= COMP_LOOP_C_181;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= COMP_LOOP_C_186;
      WHEN COMP_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        state_var_NS <= COMP_LOOP_C_187;
      WHEN COMP_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        state_var_NS <= COMP_LOOP_C_188;
      WHEN COMP_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
        state_var_NS <= COMP_LOOP_C_189;
      WHEN COMP_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111111");
        state_var_NS <= COMP_LOOP_C_190;
      WHEN COMP_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000000");
        state_var_NS <= COMP_LOOP_C_191;
      WHEN COMP_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000001");
        state_var_NS <= COMP_LOOP_C_192;
      WHEN COMP_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000010");
        state_var_NS <= COMP_LOOP_C_193;
      WHEN COMP_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000011");
        state_var_NS <= COMP_LOOP_C_194;
      WHEN COMP_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000100");
        state_var_NS <= COMP_LOOP_C_195;
      WHEN COMP_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000101");
        state_var_NS <= COMP_LOOP_C_196;
      WHEN COMP_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000110");
        IF ( COMP_LOOP_C_196_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_197;
        END IF;
      WHEN COMP_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000111");
        state_var_NS <= COMP_LOOP_C_198;
      WHEN COMP_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001000");
        state_var_NS <= COMP_LOOP_C_199;
      WHEN COMP_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001001");
        state_var_NS <= COMP_LOOP_C_200;
      WHEN COMP_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001010");
        state_var_NS <= COMP_LOOP_C_201;
      WHEN COMP_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001011");
        state_var_NS <= COMP_LOOP_C_202;
      WHEN COMP_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001100");
        state_var_NS <= COMP_LOOP_C_203;
      WHEN COMP_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001101");
        state_var_NS <= COMP_LOOP_C_204;
      WHEN COMP_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001110");
        state_var_NS <= COMP_LOOP_C_205;
      WHEN COMP_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001111");
        state_var_NS <= COMP_LOOP_C_206;
      WHEN COMP_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010000");
        state_var_NS <= COMP_LOOP_C_207;
      WHEN COMP_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010001");
        state_var_NS <= COMP_LOOP_C_208;
      WHEN COMP_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010010");
        state_var_NS <= COMP_LOOP_C_209;
      WHEN COMP_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010011");
        state_var_NS <= COMP_LOOP_C_210;
      WHEN COMP_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010100");
        state_var_NS <= COMP_LOOP_C_211;
      WHEN COMP_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010101");
        state_var_NS <= COMP_LOOP_C_212;
      WHEN COMP_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010110");
        state_var_NS <= COMP_LOOP_C_213;
      WHEN COMP_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010111");
        state_var_NS <= COMP_LOOP_C_214;
      WHEN COMP_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011000");
        state_var_NS <= COMP_LOOP_C_215;
      WHEN COMP_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011001");
        state_var_NS <= COMP_LOOP_C_216;
      WHEN COMP_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011010");
        state_var_NS <= COMP_LOOP_C_217;
      WHEN COMP_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011011");
        state_var_NS <= COMP_LOOP_C_218;
      WHEN COMP_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011100");
        state_var_NS <= COMP_LOOP_C_219;
      WHEN COMP_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011101");
        state_var_NS <= COMP_LOOP_C_220;
      WHEN COMP_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011110");
        state_var_NS <= COMP_LOOP_C_221;
      WHEN COMP_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011111");
        state_var_NS <= COMP_LOOP_C_222;
      WHEN COMP_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100000");
        state_var_NS <= COMP_LOOP_C_223;
      WHEN COMP_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100001");
        state_var_NS <= COMP_LOOP_C_224;
      WHEN COMP_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100010");
        IF ( COMP_LOOP_C_224_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100011");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100100");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100101");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
        state_var_NS <= STAGE_LOOP_C_0;
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

END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core_wait_dp;

ARCHITECTURE v12 OF inPlaceNTT_DIF_core_wait_dp IS
  -- Default Constants

BEGIN
  COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
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
    vec_rsc_triosy_0_8_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_9_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_10_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_11_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_12_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_13_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_14_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_15_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_8_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_9_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_10_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_11_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_12_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_13_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_14_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_15_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_8_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_9_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_10_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_11_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_12_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_13_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_14_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_15_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_8_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_9_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_10_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_11_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_12_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_13_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_14_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_15_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_5_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_7_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_8_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_9_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_10_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_11_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_12_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_13_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_14_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_15_i_we_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_1_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_2_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_4_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
  );
END inPlaceNTT_DIF_core;

ARCHITECTURE v12 OF inPlaceNTT_DIF_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL mux_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL nor_tmp_13 : STD_LOGIC;
  SIGNAL nor_tmp_15 : STD_LOGIC;
  SIGNAL nor_tmp_16 : STD_LOGIC;
  SIGNAL nor_tmp_17 : STD_LOGIC;
  SIGNAL not_tmp_39 : STD_LOGIC;
  SIGNAL nor_tmp_42 : STD_LOGIC;
  SIGNAL not_tmp_64 : STD_LOGIC;
  SIGNAL not_tmp_68 : STD_LOGIC;
  SIGNAL nor_tmp_57 : STD_LOGIC;
  SIGNAL not_tmp_120 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_tmp_12 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL xor_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL or_tmp_160 : STD_LOGIC;
  SIGNAL mux_tmp_278 : STD_LOGIC;
  SIGNAL or_tmp_170 : STD_LOGIC;
  SIGNAL not_tmp_143 : STD_LOGIC;
  SIGNAL not_tmp_144 : STD_LOGIC;
  SIGNAL not_tmp_146 : STD_LOGIC;
  SIGNAL or_tmp_220 : STD_LOGIC;
  SIGNAL not_tmp_160 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL or_tmp_278 : STD_LOGIC;
  SIGNAL not_tmp_168 : STD_LOGIC;
  SIGNAL not_tmp_170 : STD_LOGIC;
  SIGNAL not_tmp_173 : STD_LOGIC;
  SIGNAL not_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_398 : STD_LOGIC;
  SIGNAL mux_tmp_458 : STD_LOGIC;
  SIGNAL not_tmp_226 : STD_LOGIC;
  SIGNAL mux_tmp_518 : STD_LOGIC;
  SIGNAL not_tmp_229 : STD_LOGIC;
  SIGNAL not_tmp_237 : STD_LOGIC;
  SIGNAL mux_tmp_578 : STD_LOGIC;
  SIGNAL not_tmp_273 : STD_LOGIC;
  SIGNAL mux_tmp_638 : STD_LOGIC;
  SIGNAL not_tmp_277 : STD_LOGIC;
  SIGNAL mux_tmp_698 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL nand_tmp_99 : STD_LOGIC;
  SIGNAL or_tmp_1059 : STD_LOGIC;
  SIGNAL mux_tmp_826 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_167 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_174 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL or_tmp_1063 : STD_LOGIC;
  SIGNAL nand_tmp_100 : STD_LOGIC;
  SIGNAL mux_tmp_832 : STD_LOGIC;
  SIGNAL not_tmp_371 : STD_LOGIC;
  SIGNAL mux_tmp_840 : STD_LOGIC;
  SIGNAL or_tmp_1076 : STD_LOGIC;
  SIGNAL or_dcpl_55 : STD_LOGIC;
  SIGNAL mux_tmp_847 : STD_LOGIC;
  SIGNAL mux_tmp_848 : STD_LOGIC;
  SIGNAL mux_tmp_849 : STD_LOGIC;
  SIGNAL mux_tmp_853 : STD_LOGIC;
  SIGNAL mux_tmp_855 : STD_LOGIC;
  SIGNAL mux_tmp_856 : STD_LOGIC;
  SIGNAL mux_tmp_857 : STD_LOGIC;
  SIGNAL mux_tmp_859 : STD_LOGIC;
  SIGNAL not_tmp_382 : STD_LOGIC;
  SIGNAL mux_tmp_862 : STD_LOGIC;
  SIGNAL not_tmp_385 : STD_LOGIC;
  SIGNAL mux_tmp_866 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL mux_tmp_873 : STD_LOGIC;
  SIGNAL mux_tmp_876 : STD_LOGIC;
  SIGNAL mux_tmp_885 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL mux_tmp_897 : STD_LOGIC;
  SIGNAL mux_tmp_900 : STD_LOGIC;
  SIGNAL mux_tmp_909 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
  SIGNAL mux_tmp_916 : STD_LOGIC;
  SIGNAL mux_tmp_921 : STD_LOGIC;
  SIGNAL mux_tmp_930 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL or_tmp_1101 : STD_LOGIC;
  SIGNAL nor_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_982 : STD_LOGIC;
  SIGNAL mux_tmp_984 : STD_LOGIC;
  SIGNAL mux_tmp_991 : STD_LOGIC;
  SIGNAL mux_tmp_994 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_1_cse_6_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_4_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_k_10_3_sva_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_2_tmp_lshift_ncse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_2_tmp_mul_idiv_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_nor_1_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_3_tmp_lshift_ncse_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_nor_14_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_1_cse_6_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_4_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_6_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_4_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_14_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_13_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_11_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_7_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_5_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_3_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_5_tmp_mul_idiv_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_mul_idiv_sva_0 : STD_LOGIC;
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_mx0w0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt : STD_LOGIC;
  SIGNAL mux_1017_tmp : STD_LOGIC;
  SIGNAL and_245_m1c : STD_LOGIC;
  SIGNAL and_240_tmp : STD_LOGIC;
  SIGNAL nor_tmp_180 : STD_LOGIC;
  SIGNAL nor_568_tmp : STD_LOGIC;
  SIGNAL and_237_tmp : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_k_10_3_ftd : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_334_cse : STD_LOGIC;
  SIGNAL nand_199_cse : STD_LOGIC;
  SIGNAL nand_186_cse : STD_LOGIC;
  SIGNAL nand_172_cse : STD_LOGIC;
  SIGNAL nand_165_cse : STD_LOGIC;
  SIGNAL nand_153_cse : STD_LOGIC;
  SIGNAL nand_168_cse : STD_LOGIC;
  SIGNAL nand_154_cse : STD_LOGIC;
  SIGNAL nand_132_cse : STD_LOGIC;
  SIGNAL nand_114_cse : STD_LOGIC;
  SIGNAL nand_113_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_15_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_93_cse : STD_LOGIC;
  SIGNAL or_60_cse : STD_LOGIC;
  SIGNAL or_41_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_or_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_or_3_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_or_5_cse : STD_LOGIC;
  SIGNAL or_1233_cse : STD_LOGIC;
  SIGNAL and_344_cse : STD_LOGIC;
  SIGNAL or_139_cse : STD_LOGIC;
  SIGNAL or_1226_cse : STD_LOGIC;
  SIGNAL nor_543_cse : STD_LOGIC;
  SIGNAL or_215_cse : STD_LOGIC;
  SIGNAL or_206_cse : STD_LOGIC;
  SIGNAL nor_101_cse : STD_LOGIC;
  SIGNAL nor_99_cse : STD_LOGIC;
  SIGNAL or_632_cse : STD_LOGIC;
  SIGNAL or_624_cse : STD_LOGIC;
  SIGNAL and_292_cse : STD_LOGIC;
  SIGNAL and_293_cse : STD_LOGIC;
  SIGNAL mux_120_cse : STD_LOGIC;
  SIGNAL and_363_cse : STD_LOGIC;
  SIGNAL and_393_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm : STD_LOGIC;
  SIGNAL and_364_cse : STD_LOGIC;
  SIGNAL mux_84_cse : STD_LOGIC;
  SIGNAL or_1220_cse : STD_LOGIC;
  SIGNAL mux_85_cse : STD_LOGIC;
  SIGNAL mux_205_cse : STD_LOGIC;
  SIGNAL mux_842_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_2_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_3_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_4_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux1h_5_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_873_itm : STD_LOGIC;
  SIGNAL mux_939_itm : STD_LOGIC;
  SIGNAL mux_946_itm : STD_LOGIC;
  SIGNAL mux_948_itm : STD_LOGIC;
  SIGNAL mux_958_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_257 : STD_LOGIC;
  SIGNAL and_dcpl_258 : STD_LOGIC;
  SIGNAL and_dcpl_260 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_263 : STD_LOGIC;
  SIGNAL and_dcpl_264 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_273 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_283 : STD_LOGIC;
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL and_dcpl_286 : STD_LOGIC;
  SIGNAL and_dcpl_288 : STD_LOGIC;
  SIGNAL and_dcpl_289 : STD_LOGIC;
  SIGNAL and_dcpl_292 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL and_dcpl_299 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL and_dcpl_303 : STD_LOGIC;
  SIGNAL and_dcpl_304 : STD_LOGIC;
  SIGNAL and_dcpl_307 : STD_LOGIC;
  SIGNAL and_dcpl_309 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_dcpl_335 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_348 : STD_LOGIC;
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_356 : STD_LOGIC;
  SIGNAL and_dcpl_360 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL and_dcpl_421 : STD_LOGIC;
  SIGNAL and_dcpl_425 : STD_LOGIC;
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tmp_21_sva_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_11 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_13 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_14 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_21_sva_15 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_6_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_12_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_14_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_62_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_64_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_65_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_66_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_68_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_69_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_70_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_72_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_5_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_51_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_52_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_77_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_54_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_79_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_80_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_81_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_57_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_83_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_84_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_85_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_86_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_87_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_88_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_89_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_9_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_91_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_92_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_137_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_94_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_139_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_140_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_141_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_97_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_143_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_144_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_145_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_146_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_147_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_148_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_149_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_185_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_131_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_132_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_197_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_134_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_199_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_200_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_201_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_137_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_203_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_204_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_205_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_206_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_207_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_208_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_209_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_16_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_19_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_17_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_171_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_172_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_257_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_174_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_259_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_260_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_261_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_177_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_263_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_264_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_265_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_266_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_267_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_268_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_269_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_305_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_21_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_211_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_212_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_317_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_214_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_319_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_320_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_321_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_217_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_323_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_324_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_325_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_326_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_327_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_328_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_329_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_25_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_251_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_252_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_377_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_254_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_379_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_380_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_381_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_257_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_383_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_384_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_385_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_386_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_387_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_388_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_389_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_29_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_291_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_292_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_437_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_294_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_439_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_440_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_441_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_297_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_443_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_444_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_445_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_446_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_447_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_448_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_449_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_10_0_sva_9_0_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux_itm_mx0c1 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c2 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c3 : STD_LOGIC;
  SIGNAL tmp_21_sva_1_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_tmp_mul_idiv_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL COMP_LOOP_or_35_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_34_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_1_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_24_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_3_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_13_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_25_cse : STD_LOGIC;
  SIGNAL nor_267_cse : STD_LOGIC;
  SIGNAL nor_261_cse : STD_LOGIC;
  SIGNAL nor_257_cse : STD_LOGIC;
  SIGNAL nor_256_cse : STD_LOGIC;
  SIGNAL nor_251_cse : STD_LOGIC;
  SIGNAL nor_240_cse : STD_LOGIC;
  SIGNAL nor_236_cse : STD_LOGIC;
  SIGNAL nor_235_cse : STD_LOGIC;
  SIGNAL nor_230_cse : STD_LOGIC;
  SIGNAL nor_224_cse : STD_LOGIC;
  SIGNAL nor_218_cse : STD_LOGIC;
  SIGNAL nor_214_cse : STD_LOGIC;
  SIGNAL nor_213_cse : STD_LOGIC;
  SIGNAL nor_208_cse : STD_LOGIC;
  SIGNAL nor_197_cse : STD_LOGIC;
  SIGNAL nor_194_cse : STD_LOGIC;
  SIGNAL and_263_cse : STD_LOGIC;
  SIGNAL and_261_cse : STD_LOGIC;
  SIGNAL nor_625_cse : STD_LOGIC;
  SIGNAL and_545_cse : STD_LOGIC;
  SIGNAL and_556_cse : STD_LOGIC;
  SIGNAL and_541_cse : STD_LOGIC;
  SIGNAL and_548_cse : STD_LOGIC;
  SIGNAL and_552_cse : STD_LOGIC;
  SIGNAL and_558_cse : STD_LOGIC;
  SIGNAL or_170_cse_1 : STD_LOGIC;
  SIGNAL nor_652_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_20_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_or_45_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_17_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_2_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_3_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_4_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_5_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_6_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_7_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_8_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_or_28_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_nor_59_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_209_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL mux_841_nl : STD_LOGIC;
  SIGNAL mux_840_nl : STD_LOGIC;
  SIGNAL or_1107_nl : STD_LOGIC;
  SIGNAL mux_838_nl : STD_LOGIC;
  SIGNAL mux_837_nl : STD_LOGIC;
  SIGNAL nor_189_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL nand_240_nl : STD_LOGIC;
  SIGNAL mux_858_nl : STD_LOGIC;
  SIGNAL and_335_nl : STD_LOGIC;
  SIGNAL or_1265_nl : STD_LOGIC;
  SIGNAL nand_241_nl : STD_LOGIC;
  SIGNAL mux_1023_nl : STD_LOGIC;
  SIGNAL mux_1022_nl : STD_LOGIC;
  SIGNAL nor_653_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL or_1266_nl : STD_LOGIC;
  SIGNAL nor_654_nl : STD_LOGIC;
  SIGNAL mux_879_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_884_nl : STD_LOGIC;
  SIGNAL mux_883_nl : STD_LOGIC;
  SIGNAL mux_882_nl : STD_LOGIC;
  SIGNAL mux_887_nl : STD_LOGIC;
  SIGNAL mux_21_nl : STD_LOGIC;
  SIGNAL nand_232_nl : STD_LOGIC;
  SIGNAL mux_889_nl : STD_LOGIC;
  SIGNAL mux_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_3_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_891_nl : STD_LOGIC;
  SIGNAL mux_899_nl : STD_LOGIC;
  SIGNAL mux_898_nl : STD_LOGIC;
  SIGNAL mux_897_nl : STD_LOGIC;
  SIGNAL mux_896_nl : STD_LOGIC;
  SIGNAL mux_902_nl : STD_LOGIC;
  SIGNAL mux_901_nl : STD_LOGIC;
  SIGNAL mux_900_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_12_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_905_nl : STD_LOGIC;
  SIGNAL mux_909_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_5_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_912_nl : STD_LOGIC;
  SIGNAL mux_922_nl : STD_LOGIC;
  SIGNAL mux_921_nl : STD_LOGIC;
  SIGNAL mux_920_nl : STD_LOGIC;
  SIGNAL mux_925_nl : STD_LOGIC;
  SIGNAL mux_924_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_6_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_932_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_7_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_942_nl : STD_LOGIC;
  SIGNAL mux_941_nl : STD_LOGIC;
  SIGNAL mux_944_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_15_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_951_nl : STD_LOGIC;
  SIGNAL mux_950_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_and_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_21_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_24_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_25_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_26_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_29_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_17_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_63_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_67_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_69_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_70_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_71_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_72_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_73_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_74_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_58_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_59_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_60_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_62_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_42_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_44_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_45_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_46_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_47_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_48_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_49_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_50_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_51_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_52_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_53_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_54_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_55_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_56_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_57_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_38_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_39_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_40_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_41_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_24_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_25_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_26_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_29_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_30_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_31_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_32_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_33_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_34_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_35_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_36_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_37_nl : STD_LOGIC;
  SIGNAL mux_1009_nl : STD_LOGIC;
  SIGNAL mux_1008_nl : STD_LOGIC;
  SIGNAL mux_1007_nl : STD_LOGIC;
  SIGNAL mux_1006_nl : STD_LOGIC;
  SIGNAL mux_1005_nl : STD_LOGIC;
  SIGNAL mux_1004_nl : STD_LOGIC;
  SIGNAL mux_1002_nl : STD_LOGIC;
  SIGNAL mux_1016_nl : STD_LOGIC;
  SIGNAL mux_1015_nl : STD_LOGIC;
  SIGNAL mux_1014_nl : STD_LOGIC;
  SIGNAL mux_1012_nl : STD_LOGIC;
  SIGNAL mux_1011_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_17_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_18_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_21_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_22_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_6_nl : STD_LOGIC;
  SIGNAL mux_1021_nl : STD_LOGIC;
  SIGNAL mux_1020_nl : STD_LOGIC;
  SIGNAL mux_1019_nl : STD_LOGIC;
  SIGNAL mux_1018_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_2_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_3_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_4_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_5_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_6_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_7_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_8_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL nor_531_nl : STD_LOGIC;
  SIGNAL nor_532_nl : STD_LOGIC;
  SIGNAL or_210_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL or_208_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL nand_24_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL nor_497_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL or_317_nl : STD_LOGIC;
  SIGNAL or_316_nl : STD_LOGIC;
  SIGNAL nand_35_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL or_424_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL or_423_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL or_422_nl : STD_LOGIC;
  SIGNAL nand_46_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL or_526_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL or_525_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL or_524_nl : STD_LOGIC;
  SIGNAL nand_57_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL or_625_nl : STD_LOGIC;
  SIGNAL nand_68_nl : STD_LOGIC;
  SIGNAL mux_596_nl : STD_LOGIC;
  SIGNAL and_395_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL or_732_nl : STD_LOGIC;
  SIGNAL mux_595_nl : STD_LOGIC;
  SIGNAL mux_594_nl : STD_LOGIC;
  SIGNAL or_731_nl : STD_LOGIC;
  SIGNAL or_730_nl : STD_LOGIC;
  SIGNAL nand_79_nl : STD_LOGIC;
  SIGNAL mux_656_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL or_835_nl : STD_LOGIC;
  SIGNAL mux_655_nl : STD_LOGIC;
  SIGNAL or_834_nl : STD_LOGIC;
  SIGNAL mux_654_nl : STD_LOGIC;
  SIGNAL or_833_nl : STD_LOGIC;
  SIGNAL nand_90_nl : STD_LOGIC;
  SIGNAL mux_716_nl : STD_LOGIC;
  SIGNAL and_282_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL or_934_nl : STD_LOGIC;
  SIGNAL mux_715_nl : STD_LOGIC;
  SIGNAL nand_144_nl : STD_LOGIC;
  SIGNAL mux_714_nl : STD_LOGIC;
  SIGNAL nand_145_nl : STD_LOGIC;
  SIGNAL mux_849_nl : STD_LOGIC;
  SIGNAL or_1221_nl : STD_LOGIC;
  SIGNAL or_1117_nl : STD_LOGIC;
  SIGNAL mux_871_nl : STD_LOGIC;
  SIGNAL mux_870_nl : STD_LOGIC;
  SIGNAL mux_869_nl : STD_LOGIC;
  SIGNAL mux_894_nl : STD_LOGIC;
  SIGNAL mux_893_nl : STD_LOGIC;
  SIGNAL mux_903_nl : STD_LOGIC;
  SIGNAL mux_907_nl : STD_LOGIC;
  SIGNAL mux_906_nl : STD_LOGIC;
  SIGNAL mux_915_nl : STD_LOGIC;
  SIGNAL mux_914_nl : STD_LOGIC;
  SIGNAL mux_913_nl : STD_LOGIC;
  SIGNAL mux_918_nl : STD_LOGIC;
  SIGNAL mux_917_nl : STD_LOGIC;
  SIGNAL mux_927_nl : STD_LOGIC;
  SIGNAL mux_931_nl : STD_LOGIC;
  SIGNAL mux_930_nl : STD_LOGIC;
  SIGNAL mux_938_nl : STD_LOGIC;
  SIGNAL mux_937_nl : STD_LOGIC;
  SIGNAL mux_947_nl : STD_LOGIC;
  SIGNAL mux_957_nl : STD_LOGIC;
  SIGNAL mux_956_nl : STD_LOGIC;
  SIGNAL mux_966_nl : STD_LOGIC;
  SIGNAL or_1174_nl : STD_LOGIC;
  SIGNAL mux_970_nl : STD_LOGIC;
  SIGNAL mux_969_nl : STD_LOGIC;
  SIGNAL mux_968_nl : STD_LOGIC;
  SIGNAL nand_102_nl : STD_LOGIC;
  SIGNAL mux_967_nl : STD_LOGIC;
  SIGNAL nand_104_nl : STD_LOGIC;
  SIGNAL or_1177_nl : STD_LOGIC;
  SIGNAL mux_1000_nl : STD_LOGIC;
  SIGNAL or_1197_nl : STD_LOGIC;
  SIGNAL mux_991_nl : STD_LOGIC;
  SIGNAL mux_30_nl : STD_LOGIC;
  SIGNAL nor_567_nl : STD_LOGIC;
  SIGNAL mux_989_nl : STD_LOGIC;
  SIGNAL mux_996_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL or_36_nl : STD_LOGIC;
  SIGNAL mux_994_nl : STD_LOGIC;
  SIGNAL mux_993_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_999_nl : STD_LOGIC;
  SIGNAL mux_998_nl : STD_LOGIC;
  SIGNAL mux_997_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL and_58_nl : STD_LOGIC;
  SIGNAL and_69_nl : STD_LOGIC;
  SIGNAL and_75_nl : STD_LOGIC;
  SIGNAL and_79_nl : STD_LOGIC;
  SIGNAL and_81_nl : STD_LOGIC;
  SIGNAL and_84_nl : STD_LOGIC;
  SIGNAL and_86_nl : STD_LOGIC;
  SIGNAL and_88_nl : STD_LOGIC;
  SIGNAL and_91_nl : STD_LOGIC;
  SIGNAL and_93_nl : STD_LOGIC;
  SIGNAL and_95_nl : STD_LOGIC;
  SIGNAL and_97_nl : STD_LOGIC;
  SIGNAL and_98_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL and_100_nl : STD_LOGIC;
  SIGNAL and_101_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL and_103_nl : STD_LOGIC;
  SIGNAL and_104_nl : STD_LOGIC;
  SIGNAL and_105_nl : STD_LOGIC;
  SIGNAL and_106_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL and_108_nl : STD_LOGIC;
  SIGNAL and_109_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL nand_231_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL and_329_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL nor_522_nl : STD_LOGIC;
  SIGNAL nor_523_nl : STD_LOGIC;
  SIGNAL nor_524_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL or_217_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL nor_525_nl : STD_LOGIC;
  SIGNAL or_1256_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL nor_527_nl : STD_LOGIC;
  SIGNAL nor_528_nl : STD_LOGIC;
  SIGNAL or_201_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL or_200_nl : STD_LOGIC;
  SIGNAL or_198_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL nor_529_nl : STD_LOGIC;
  SIGNAL nor_530_nl : STD_LOGIC;
  SIGNAL or_194_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL or_193_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL nor_515_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL or_249_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL nor_516_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL or_246_nl : STD_LOGIC;
  SIGNAL or_244_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL nor_517_nl : STD_LOGIC;
  SIGNAL nor_518_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL nor_519_nl : STD_LOGIC;
  SIGNAL nor_520_nl : STD_LOGIC;
  SIGNAL nor_521_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL or_235_nl : STD_LOGIC;
  SIGNAL or_233_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL or_231_nl : STD_LOGIC;
  SIGNAL or_229_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL or_227_nl : STD_LOGIC;
  SIGNAL or_226_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL or_225_nl : STD_LOGIC;
  SIGNAL or_224_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL nand_230_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL and_326_nl : STD_LOGIC;
  SIGNAL mux_328_nl : STD_LOGIC;
  SIGNAL nor_507_nl : STD_LOGIC;
  SIGNAL nor_508_nl : STD_LOGIC;
  SIGNAL nor_509_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL or_268_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL and_327_nl : STD_LOGIC;
  SIGNAL or_1255_nl : STD_LOGIC;
  SIGNAL mux_325_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL nor_511_nl : STD_LOGIC;
  SIGNAL nor_512_nl : STD_LOGIC;
  SIGNAL or_261_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL or_260_nl : STD_LOGIC;
  SIGNAL or_258_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL nand_16_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL nor_513_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL or_254_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL or_253_nl : STD_LOGIC;
  SIGNAL or_251_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL or_298_nl : STD_LOGIC;
  SIGNAL or_297_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL and_324_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL or_285_nl : STD_LOGIC;
  SIGNAL or_283_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL or_281_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL or_276_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL or_275_nl : STD_LOGIC;
  SIGNAL or_274_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nand_229_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL and_323_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL nor_488_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL or_1254_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL nor_494_nl : STD_LOGIC;
  SIGNAL or_310_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL or_309_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nand_22_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL nor_495_nl : STD_LOGIC;
  SIGNAL nor_496_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL or_302_nl : STD_LOGIC;
  SIGNAL or_300_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL or_357_nl : STD_LOGIC;
  SIGNAL or_356_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL or_354_nl : STD_LOGIC;
  SIGNAL or_352_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL nor_487_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL or_343_nl : STD_LOGIC;
  SIGNAL or_341_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL or_337_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL or_335_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL or_333_nl : STD_LOGIC;
  SIGNAL or_332_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL nand_228_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL and_320_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL nor_474_nl : STD_LOGIC;
  SIGNAL nor_475_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL or_376_nl : STD_LOGIC;
  SIGNAL or_375_nl : STD_LOGIC;
  SIGNAL and_321_nl : STD_LOGIC;
  SIGNAL or_1253_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nand_28_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL nor_478_nl : STD_LOGIC;
  SIGNAL or_369_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL or_368_nl : STD_LOGIC;
  SIGNAL or_366_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL nand_27_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL or_361_nl : STD_LOGIC;
  SIGNAL or_359_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL nor_465_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL or_405_nl : STD_LOGIC;
  SIGNAL or_404_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL and_318_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL or_392_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL or_388_nl : STD_LOGIC;
  SIGNAL or_386_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL or_384_nl : STD_LOGIC;
  SIGNAL or_383_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL or_382_nl : STD_LOGIC;
  SIGNAL or_381_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL nand_227_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL and_317_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL nor_454_nl : STD_LOGIC;
  SIGNAL nor_455_nl : STD_LOGIC;
  SIGNAL nor_456_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL or_430_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL or_429_nl : STD_LOGIC;
  SIGNAL nor_457_nl : STD_LOGIC;
  SIGNAL or_1252_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL nor_459_nl : STD_LOGIC;
  SIGNAL nor_460_nl : STD_LOGIC;
  SIGNAL or_417_nl : STD_LOGIC;
  SIGNAL mux_410_nl : STD_LOGIC;
  SIGNAL or_416_nl : STD_LOGIC;
  SIGNAL or_414_nl : STD_LOGIC;
  SIGNAL mux_409_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL or_410_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL or_409_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL nor_447_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL or_459_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL or_457_nl : STD_LOGIC;
  SIGNAL or_455_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL nor_449_nl : STD_LOGIC;
  SIGNAL nor_450_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL nor_451_nl : STD_LOGIC;
  SIGNAL nor_452_nl : STD_LOGIC;
  SIGNAL nor_453_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL or_446_nl : STD_LOGIC;
  SIGNAL or_444_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL or_440_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL or_438_nl : STD_LOGIC;
  SIGNAL or_437_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL or_436_nl : STD_LOGIC;
  SIGNAL or_435_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL nand_226_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL and_314_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL nor_439_nl : STD_LOGIC;
  SIGNAL nor_440_nl : STD_LOGIC;
  SIGNAL nor_441_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL or_478_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL or_477_nl : STD_LOGIC;
  SIGNAL and_315_nl : STD_LOGIC;
  SIGNAL or_1251_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL nand_39_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL or_472_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL or_471_nl : STD_LOGIC;
  SIGNAL or_469_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL nand_38_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL nor_446_nl : STD_LOGIC;
  SIGNAL or_465_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL or_464_nl : STD_LOGIC;
  SIGNAL or_462_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL or_506_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL and_312_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL nor_437_nl : STD_LOGIC;
  SIGNAL nor_438_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL or_494_nl : STD_LOGIC;
  SIGNAL or_492_nl : STD_LOGIC;
  SIGNAL mux_455_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL or_488_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL or_486_nl : STD_LOGIC;
  SIGNAL or_485_nl : STD_LOGIC;
  SIGNAL mux_452_nl : STD_LOGIC;
  SIGNAL or_484_nl : STD_LOGIC;
  SIGNAL or_483_nl : STD_LOGIC;
  SIGNAL mux_483_nl : STD_LOGIC;
  SIGNAL nand_225_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL and_311_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL or_532_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL or_531_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL or_1250_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL or_519_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL or_518_nl : STD_LOGIC;
  SIGNAL or_516_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL nand_44_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL or_512_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL or_511_nl : STD_LOGIC;
  SIGNAL or_509_nl : STD_LOGIC;
  SIGNAL mux_498_nl : STD_LOGIC;
  SIGNAL mux_497_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL mux_496_nl : STD_LOGIC;
  SIGNAL or_562_nl : STD_LOGIC;
  SIGNAL or_561_nl : STD_LOGIC;
  SIGNAL mux_495_nl : STD_LOGIC;
  SIGNAL mux_494_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL or_559_nl : STD_LOGIC;
  SIGNAL or_557_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL mux_488_nl : STD_LOGIC;
  SIGNAL or_548_nl : STD_LOGIC;
  SIGNAL or_546_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL or_544_nl : STD_LOGIC;
  SIGNAL or_542_nl : STD_LOGIC;
  SIGNAL mux_486_nl : STD_LOGIC;
  SIGNAL mux_485_nl : STD_LOGIC;
  SIGNAL or_540_nl : STD_LOGIC;
  SIGNAL or_539_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL or_538_nl : STD_LOGIC;
  SIGNAL or_537_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL nand_224_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL and_308_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL and_402_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL or_578_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL or_577_nl : STD_LOGIC;
  SIGNAL and_309_nl : STD_LOGIC;
  SIGNAL or_1249_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL and_405_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL or_572_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL or_571_nl : STD_LOGIC;
  SIGNAL or_570_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL nand_49_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL or_566_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL or_565_nl : STD_LOGIC;
  SIGNAL or_564_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL or_607_nl : STD_LOGIC;
  SIGNAL or_606_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL and_306_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL mux_517_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL or_594_nl : STD_LOGIC;
  SIGNAL nand_236_nl : STD_LOGIC;
  SIGNAL mux_515_nl : STD_LOGIC;
  SIGNAL or_590_nl : STD_LOGIC;
  SIGNAL or_588_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL nand_180_nl : STD_LOGIC;
  SIGNAL or_585_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL or_584_nl : STD_LOGIC;
  SIGNAL or_583_nl : STD_LOGIC;
  SIGNAL mux_543_nl : STD_LOGIC;
  SIGNAL nand_223_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL and_305_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL or_634_nl : STD_LOGIC;
  SIGNAL or_633_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL or_1248_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL nand_56_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL or_619_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL or_618_nl : STD_LOGIC;
  SIGNAL or_616_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL nand_55_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL or_612_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL or_611_nl : STD_LOGIC;
  SIGNAL or_609_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL mux_557_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL or_664_nl : STD_LOGIC;
  SIGNAL or_663_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL mux_554_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL mux_553_nl : STD_LOGIC;
  SIGNAL or_661_nl : STD_LOGIC;
  SIGNAL or_659_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL mux_550_nl : STD_LOGIC;
  SIGNAL mux_549_nl : STD_LOGIC;
  SIGNAL mux_548_nl : STD_LOGIC;
  SIGNAL or_650_nl : STD_LOGIC;
  SIGNAL or_648_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL or_646_nl : STD_LOGIC;
  SIGNAL or_644_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL mux_545_nl : STD_LOGIC;
  SIGNAL or_642_nl : STD_LOGIC;
  SIGNAL or_641_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL or_640_nl : STD_LOGIC;
  SIGNAL or_639_nl : STD_LOGIC;
  SIGNAL mux_571_nl : STD_LOGIC;
  SIGNAL nand_222_nl : STD_LOGIC;
  SIGNAL mux_570_nl : STD_LOGIC;
  SIGNAL mux_569_nl : STD_LOGIC;
  SIGNAL and_302_nl : STD_LOGIC;
  SIGNAL mux_568_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL mux_567_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL or_683_nl : STD_LOGIC;
  SIGNAL or_682_nl : STD_LOGIC;
  SIGNAL and_303_nl : STD_LOGIC;
  SIGNAL or_1247_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL nand_61_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL or_676_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL or_675_nl : STD_LOGIC;
  SIGNAL or_673_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL nand_60_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL or_669_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL or_668_nl : STD_LOGIC;
  SIGNAL or_666_nl : STD_LOGIC;
  SIGNAL mux_586_nl : STD_LOGIC;
  SIGNAL mux_585_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL mux_584_nl : STD_LOGIC;
  SIGNAL or_712_nl : STD_LOGIC;
  SIGNAL or_711_nl : STD_LOGIC;
  SIGNAL mux_583_nl : STD_LOGIC;
  SIGNAL mux_582_nl : STD_LOGIC;
  SIGNAL and_300_nl : STD_LOGIC;
  SIGNAL mux_581_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL mux_580_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL mux_579_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL mux_578_nl : STD_LOGIC;
  SIGNAL mux_577_nl : STD_LOGIC;
  SIGNAL mux_576_nl : STD_LOGIC;
  SIGNAL or_699_nl : STD_LOGIC;
  SIGNAL or_697_nl : STD_LOGIC;
  SIGNAL mux_575_nl : STD_LOGIC;
  SIGNAL or_695_nl : STD_LOGIC;
  SIGNAL or_693_nl : STD_LOGIC;
  SIGNAL mux_574_nl : STD_LOGIC;
  SIGNAL mux_573_nl : STD_LOGIC;
  SIGNAL or_691_nl : STD_LOGIC;
  SIGNAL or_690_nl : STD_LOGIC;
  SIGNAL mux_572_nl : STD_LOGIC;
  SIGNAL or_689_nl : STD_LOGIC;
  SIGNAL or_688_nl : STD_LOGIC;
  SIGNAL mux_603_nl : STD_LOGIC;
  SIGNAL nand_221_nl : STD_LOGIC;
  SIGNAL mux_602_nl : STD_LOGIC;
  SIGNAL mux_601_nl : STD_LOGIC;
  SIGNAL and_299_nl : STD_LOGIC;
  SIGNAL mux_600_nl : STD_LOGIC;
  SIGNAL nor_352_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL nor_354_nl : STD_LOGIC;
  SIGNAL mux_599_nl : STD_LOGIC;
  SIGNAL mux_598_nl : STD_LOGIC;
  SIGNAL or_739_nl : STD_LOGIC;
  SIGNAL or_738_nl : STD_LOGIC;
  SIGNAL nor_355_nl : STD_LOGIC;
  SIGNAL or_1246_nl : STD_LOGIC;
  SIGNAL mux_593_nl : STD_LOGIC;
  SIGNAL mux_592_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL mux_591_nl : STD_LOGIC;
  SIGNAL nor_357_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL or_724_nl : STD_LOGIC;
  SIGNAL mux_590_nl : STD_LOGIC;
  SIGNAL or_723_nl : STD_LOGIC;
  SIGNAL or_721_nl : STD_LOGIC;
  SIGNAL mux_589_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL mux_588_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL or_717_nl : STD_LOGIC;
  SIGNAL mux_587_nl : STD_LOGIC;
  SIGNAL or_716_nl : STD_LOGIC;
  SIGNAL or_714_nl : STD_LOGIC;
  SIGNAL mux_618_nl : STD_LOGIC;
  SIGNAL mux_617_nl : STD_LOGIC;
  SIGNAL nor_345_nl : STD_LOGIC;
  SIGNAL mux_616_nl : STD_LOGIC;
  SIGNAL or_769_nl : STD_LOGIC;
  SIGNAL or_768_nl : STD_LOGIC;
  SIGNAL mux_615_nl : STD_LOGIC;
  SIGNAL mux_614_nl : STD_LOGIC;
  SIGNAL nor_346_nl : STD_LOGIC;
  SIGNAL mux_613_nl : STD_LOGIC;
  SIGNAL or_766_nl : STD_LOGIC;
  SIGNAL or_764_nl : STD_LOGIC;
  SIGNAL mux_612_nl : STD_LOGIC;
  SIGNAL nor_347_nl : STD_LOGIC;
  SIGNAL nor_348_nl : STD_LOGIC;
  SIGNAL mux_611_nl : STD_LOGIC;
  SIGNAL nor_349_nl : STD_LOGIC;
  SIGNAL nor_350_nl : STD_LOGIC;
  SIGNAL nor_351_nl : STD_LOGIC;
  SIGNAL mux_610_nl : STD_LOGIC;
  SIGNAL mux_609_nl : STD_LOGIC;
  SIGNAL mux_608_nl : STD_LOGIC;
  SIGNAL or_755_nl : STD_LOGIC;
  SIGNAL or_753_nl : STD_LOGIC;
  SIGNAL mux_607_nl : STD_LOGIC;
  SIGNAL or_751_nl : STD_LOGIC;
  SIGNAL or_749_nl : STD_LOGIC;
  SIGNAL mux_606_nl : STD_LOGIC;
  SIGNAL mux_605_nl : STD_LOGIC;
  SIGNAL or_747_nl : STD_LOGIC;
  SIGNAL or_746_nl : STD_LOGIC;
  SIGNAL mux_604_nl : STD_LOGIC;
  SIGNAL or_745_nl : STD_LOGIC;
  SIGNAL or_744_nl : STD_LOGIC;
  SIGNAL mux_631_nl : STD_LOGIC;
  SIGNAL nand_220_nl : STD_LOGIC;
  SIGNAL mux_630_nl : STD_LOGIC;
  SIGNAL mux_629_nl : STD_LOGIC;
  SIGNAL and_296_nl : STD_LOGIC;
  SIGNAL mux_628_nl : STD_LOGIC;
  SIGNAL nor_337_nl : STD_LOGIC;
  SIGNAL nor_338_nl : STD_LOGIC;
  SIGNAL nor_339_nl : STD_LOGIC;
  SIGNAL mux_627_nl : STD_LOGIC;
  SIGNAL mux_626_nl : STD_LOGIC;
  SIGNAL or_788_nl : STD_LOGIC;
  SIGNAL or_787_nl : STD_LOGIC;
  SIGNAL and_297_nl : STD_LOGIC;
  SIGNAL or_1245_nl : STD_LOGIC;
  SIGNAL mux_625_nl : STD_LOGIC;
  SIGNAL mux_624_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL mux_623_nl : STD_LOGIC;
  SIGNAL nor_341_nl : STD_LOGIC;
  SIGNAL nor_342_nl : STD_LOGIC;
  SIGNAL or_781_nl : STD_LOGIC;
  SIGNAL mux_622_nl : STD_LOGIC;
  SIGNAL or_780_nl : STD_LOGIC;
  SIGNAL or_778_nl : STD_LOGIC;
  SIGNAL mux_621_nl : STD_LOGIC;
  SIGNAL nand_71_nl : STD_LOGIC;
  SIGNAL mux_620_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL or_774_nl : STD_LOGIC;
  SIGNAL mux_619_nl : STD_LOGIC;
  SIGNAL or_773_nl : STD_LOGIC;
  SIGNAL or_771_nl : STD_LOGIC;
  SIGNAL mux_646_nl : STD_LOGIC;
  SIGNAL mux_645_nl : STD_LOGIC;
  SIGNAL nor_329_nl : STD_LOGIC;
  SIGNAL mux_644_nl : STD_LOGIC;
  SIGNAL or_816_nl : STD_LOGIC;
  SIGNAL or_815_nl : STD_LOGIC;
  SIGNAL mux_643_nl : STD_LOGIC;
  SIGNAL mux_642_nl : STD_LOGIC;
  SIGNAL and_294_nl : STD_LOGIC;
  SIGNAL mux_641_nl : STD_LOGIC;
  SIGNAL nor_330_nl : STD_LOGIC;
  SIGNAL nor_331_nl : STD_LOGIC;
  SIGNAL mux_640_nl : STD_LOGIC;
  SIGNAL nor_332_nl : STD_LOGIC;
  SIGNAL nor_333_nl : STD_LOGIC;
  SIGNAL mux_639_nl : STD_LOGIC;
  SIGNAL nor_334_nl : STD_LOGIC;
  SIGNAL nor_335_nl : STD_LOGIC;
  SIGNAL nor_336_nl : STD_LOGIC;
  SIGNAL mux_638_nl : STD_LOGIC;
  SIGNAL mux_637_nl : STD_LOGIC;
  SIGNAL mux_636_nl : STD_LOGIC;
  SIGNAL or_804_nl : STD_LOGIC;
  SIGNAL nand_235_nl : STD_LOGIC;
  SIGNAL mux_635_nl : STD_LOGIC;
  SIGNAL or_800_nl : STD_LOGIC;
  SIGNAL or_798_nl : STD_LOGIC;
  SIGNAL mux_634_nl : STD_LOGIC;
  SIGNAL mux_633_nl : STD_LOGIC;
  SIGNAL nand_163_nl : STD_LOGIC;
  SIGNAL or_795_nl : STD_LOGIC;
  SIGNAL mux_632_nl : STD_LOGIC;
  SIGNAL or_794_nl : STD_LOGIC;
  SIGNAL or_793_nl : STD_LOGIC;
  SIGNAL mux_663_nl : STD_LOGIC;
  SIGNAL nand_219_nl : STD_LOGIC;
  SIGNAL mux_662_nl : STD_LOGIC;
  SIGNAL mux_661_nl : STD_LOGIC;
  SIGNAL and_291_nl : STD_LOGIC;
  SIGNAL mux_660_nl : STD_LOGIC;
  SIGNAL nor_318_nl : STD_LOGIC;
  SIGNAL nor_319_nl : STD_LOGIC;
  SIGNAL nor_320_nl : STD_LOGIC;
  SIGNAL mux_659_nl : STD_LOGIC;
  SIGNAL or_840_nl : STD_LOGIC;
  SIGNAL mux_658_nl : STD_LOGIC;
  SIGNAL or_839_nl : STD_LOGIC;
  SIGNAL nor_321_nl : STD_LOGIC;
  SIGNAL or_1244_nl : STD_LOGIC;
  SIGNAL mux_653_nl : STD_LOGIC;
  SIGNAL mux_652_nl : STD_LOGIC;
  SIGNAL nand_78_nl : STD_LOGIC;
  SIGNAL mux_651_nl : STD_LOGIC;
  SIGNAL nor_323_nl : STD_LOGIC;
  SIGNAL nor_324_nl : STD_LOGIC;
  SIGNAL or_828_nl : STD_LOGIC;
  SIGNAL mux_650_nl : STD_LOGIC;
  SIGNAL or_827_nl : STD_LOGIC;
  SIGNAL or_825_nl : STD_LOGIC;
  SIGNAL mux_649_nl : STD_LOGIC;
  SIGNAL nand_77_nl : STD_LOGIC;
  SIGNAL mux_648_nl : STD_LOGIC;
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL or_821_nl : STD_LOGIC;
  SIGNAL mux_647_nl : STD_LOGIC;
  SIGNAL or_820_nl : STD_LOGIC;
  SIGNAL or_818_nl : STD_LOGIC;
  SIGNAL mux_678_nl : STD_LOGIC;
  SIGNAL mux_677_nl : STD_LOGIC;
  SIGNAL nor_311_nl : STD_LOGIC;
  SIGNAL mux_676_nl : STD_LOGIC;
  SIGNAL or_870_nl : STD_LOGIC;
  SIGNAL or_869_nl : STD_LOGIC;
  SIGNAL mux_675_nl : STD_LOGIC;
  SIGNAL mux_674_nl : STD_LOGIC;
  SIGNAL nor_312_nl : STD_LOGIC;
  SIGNAL mux_673_nl : STD_LOGIC;
  SIGNAL or_867_nl : STD_LOGIC;
  SIGNAL or_865_nl : STD_LOGIC;
  SIGNAL mux_672_nl : STD_LOGIC;
  SIGNAL nor_313_nl : STD_LOGIC;
  SIGNAL nor_314_nl : STD_LOGIC;
  SIGNAL mux_671_nl : STD_LOGIC;
  SIGNAL nor_315_nl : STD_LOGIC;
  SIGNAL nor_316_nl : STD_LOGIC;
  SIGNAL nor_317_nl : STD_LOGIC;
  SIGNAL mux_670_nl : STD_LOGIC;
  SIGNAL mux_669_nl : STD_LOGIC;
  SIGNAL mux_668_nl : STD_LOGIC;
  SIGNAL or_856_nl : STD_LOGIC;
  SIGNAL or_854_nl : STD_LOGIC;
  SIGNAL mux_667_nl : STD_LOGIC;
  SIGNAL or_852_nl : STD_LOGIC;
  SIGNAL or_850_nl : STD_LOGIC;
  SIGNAL mux_666_nl : STD_LOGIC;
  SIGNAL mux_665_nl : STD_LOGIC;
  SIGNAL or_848_nl : STD_LOGIC;
  SIGNAL or_847_nl : STD_LOGIC;
  SIGNAL mux_664_nl : STD_LOGIC;
  SIGNAL or_846_nl : STD_LOGIC;
  SIGNAL or_845_nl : STD_LOGIC;
  SIGNAL mux_691_nl : STD_LOGIC;
  SIGNAL nand_218_nl : STD_LOGIC;
  SIGNAL mux_690_nl : STD_LOGIC;
  SIGNAL mux_689_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL mux_688_nl : STD_LOGIC;
  SIGNAL nor_303_nl : STD_LOGIC;
  SIGNAL nor_304_nl : STD_LOGIC;
  SIGNAL nor_305_nl : STD_LOGIC;
  SIGNAL mux_687_nl : STD_LOGIC;
  SIGNAL or_887_nl : STD_LOGIC;
  SIGNAL mux_686_nl : STD_LOGIC;
  SIGNAL or_886_nl : STD_LOGIC;
  SIGNAL and_289_nl : STD_LOGIC;
  SIGNAL or_1243_nl : STD_LOGIC;
  SIGNAL mux_685_nl : STD_LOGIC;
  SIGNAL mux_684_nl : STD_LOGIC;
  SIGNAL nand_83_nl : STD_LOGIC;
  SIGNAL mux_683_nl : STD_LOGIC;
  SIGNAL nor_307_nl : STD_LOGIC;
  SIGNAL nor_308_nl : STD_LOGIC;
  SIGNAL or_881_nl : STD_LOGIC;
  SIGNAL mux_682_nl : STD_LOGIC;
  SIGNAL or_880_nl : STD_LOGIC;
  SIGNAL or_878_nl : STD_LOGIC;
  SIGNAL mux_681_nl : STD_LOGIC;
  SIGNAL nand_82_nl : STD_LOGIC;
  SIGNAL mux_680_nl : STD_LOGIC;
  SIGNAL nor_309_nl : STD_LOGIC;
  SIGNAL nor_310_nl : STD_LOGIC;
  SIGNAL or_875_nl : STD_LOGIC;
  SIGNAL mux_679_nl : STD_LOGIC;
  SIGNAL or_874_nl : STD_LOGIC;
  SIGNAL or_872_nl : STD_LOGIC;
  SIGNAL mux_706_nl : STD_LOGIC;
  SIGNAL mux_705_nl : STD_LOGIC;
  SIGNAL nor_295_nl : STD_LOGIC;
  SIGNAL mux_704_nl : STD_LOGIC;
  SIGNAL or_916_nl : STD_LOGIC;
  SIGNAL or_915_nl : STD_LOGIC;
  SIGNAL mux_703_nl : STD_LOGIC;
  SIGNAL mux_702_nl : STD_LOGIC;
  SIGNAL and_285_nl : STD_LOGIC;
  SIGNAL mux_701_nl : STD_LOGIC;
  SIGNAL nor_296_nl : STD_LOGIC;
  SIGNAL nor_297_nl : STD_LOGIC;
  SIGNAL mux_700_nl : STD_LOGIC;
  SIGNAL nor_298_nl : STD_LOGIC;
  SIGNAL nor_299_nl : STD_LOGIC;
  SIGNAL mux_699_nl : STD_LOGIC;
  SIGNAL nor_300_nl : STD_LOGIC;
  SIGNAL nor_301_nl : STD_LOGIC;
  SIGNAL nor_302_nl : STD_LOGIC;
  SIGNAL mux_698_nl : STD_LOGIC;
  SIGNAL mux_697_nl : STD_LOGIC;
  SIGNAL mux_696_nl : STD_LOGIC;
  SIGNAL or_903_nl : STD_LOGIC;
  SIGNAL nand_234_nl : STD_LOGIC;
  SIGNAL mux_695_nl : STD_LOGIC;
  SIGNAL or_899_nl : STD_LOGIC;
  SIGNAL or_897_nl : STD_LOGIC;
  SIGNAL mux_694_nl : STD_LOGIC;
  SIGNAL mux_693_nl : STD_LOGIC;
  SIGNAL nand_150_nl : STD_LOGIC;
  SIGNAL or_894_nl : STD_LOGIC;
  SIGNAL mux_692_nl : STD_LOGIC;
  SIGNAL or_893_nl : STD_LOGIC;
  SIGNAL or_892_nl : STD_LOGIC;
  SIGNAL mux_723_nl : STD_LOGIC;
  SIGNAL nand_217_nl : STD_LOGIC;
  SIGNAL mux_722_nl : STD_LOGIC;
  SIGNAL mux_721_nl : STD_LOGIC;
  SIGNAL and_280_nl : STD_LOGIC;
  SIGNAL mux_720_nl : STD_LOGIC;
  SIGNAL nor_286_nl : STD_LOGIC;
  SIGNAL nor_287_nl : STD_LOGIC;
  SIGNAL nor_288_nl : STD_LOGIC;
  SIGNAL mux_719_nl : STD_LOGIC;
  SIGNAL or_938_nl : STD_LOGIC;
  SIGNAL mux_718_nl : STD_LOGIC;
  SIGNAL or_937_nl : STD_LOGIC;
  SIGNAL nor_289_nl : STD_LOGIC;
  SIGNAL or_1242_nl : STD_LOGIC;
  SIGNAL mux_713_nl : STD_LOGIC;
  SIGNAL mux_712_nl : STD_LOGIC;
  SIGNAL nand_89_nl : STD_LOGIC;
  SIGNAL mux_711_nl : STD_LOGIC;
  SIGNAL nor_291_nl : STD_LOGIC;
  SIGNAL nor_292_nl : STD_LOGIC;
  SIGNAL or_928_nl : STD_LOGIC;
  SIGNAL mux_710_nl : STD_LOGIC;
  SIGNAL nand_239_nl : STD_LOGIC;
  SIGNAL or_925_nl : STD_LOGIC;
  SIGNAL mux_709_nl : STD_LOGIC;
  SIGNAL nand_88_nl : STD_LOGIC;
  SIGNAL mux_708_nl : STD_LOGIC;
  SIGNAL and_406_nl : STD_LOGIC;
  SIGNAL nor_294_nl : STD_LOGIC;
  SIGNAL or_921_nl : STD_LOGIC;
  SIGNAL mux_707_nl : STD_LOGIC;
  SIGNAL nand_237_nl : STD_LOGIC;
  SIGNAL or_918_nl : STD_LOGIC;
  SIGNAL mux_738_nl : STD_LOGIC;
  SIGNAL mux_737_nl : STD_LOGIC;
  SIGNAL nor_279_nl : STD_LOGIC;
  SIGNAL mux_736_nl : STD_LOGIC;
  SIGNAL or_966_nl : STD_LOGIC;
  SIGNAL or_965_nl : STD_LOGIC;
  SIGNAL mux_735_nl : STD_LOGIC;
  SIGNAL mux_734_nl : STD_LOGIC;
  SIGNAL nor_280_nl : STD_LOGIC;
  SIGNAL mux_733_nl : STD_LOGIC;
  SIGNAL or_963_nl : STD_LOGIC;
  SIGNAL nand_238_nl : STD_LOGIC;
  SIGNAL mux_732_nl : STD_LOGIC;
  SIGNAL nor_281_nl : STD_LOGIC;
  SIGNAL nor_282_nl : STD_LOGIC;
  SIGNAL mux_731_nl : STD_LOGIC;
  SIGNAL nor_283_nl : STD_LOGIC;
  SIGNAL nor_284_nl : STD_LOGIC;
  SIGNAL nor_285_nl : STD_LOGIC;
  SIGNAL mux_730_nl : STD_LOGIC;
  SIGNAL mux_729_nl : STD_LOGIC;
  SIGNAL mux_728_nl : STD_LOGIC;
  SIGNAL or_952_nl : STD_LOGIC;
  SIGNAL nand_233_nl : STD_LOGIC;
  SIGNAL mux_727_nl : STD_LOGIC;
  SIGNAL or_948_nl : STD_LOGIC;
  SIGNAL or_947_nl : STD_LOGIC;
  SIGNAL mux_726_nl : STD_LOGIC;
  SIGNAL mux_725_nl : STD_LOGIC;
  SIGNAL nand_137_nl : STD_LOGIC;
  SIGNAL or_944_nl : STD_LOGIC;
  SIGNAL mux_724_nl : STD_LOGIC;
  SIGNAL or_943_nl : STD_LOGIC;
  SIGNAL or_942_nl : STD_LOGIC;
  SIGNAL mux_751_nl : STD_LOGIC;
  SIGNAL nand_216_nl : STD_LOGIC;
  SIGNAL mux_750_nl : STD_LOGIC;
  SIGNAL mux_749_nl : STD_LOGIC;
  SIGNAL and_270_nl : STD_LOGIC;
  SIGNAL mux_748_nl : STD_LOGIC;
  SIGNAL and_271_nl : STD_LOGIC;
  SIGNAL and_272_nl : STD_LOGIC;
  SIGNAL nor_277_nl : STD_LOGIC;
  SIGNAL mux_747_nl : STD_LOGIC;
  SIGNAL nand_126_nl : STD_LOGIC;
  SIGNAL mux_746_nl : STD_LOGIC;
  SIGNAL nand_127_nl : STD_LOGIC;
  SIGNAL and_274_nl : STD_LOGIC;
  SIGNAL or_1241_nl : STD_LOGIC;
  SIGNAL mux_745_nl : STD_LOGIC;
  SIGNAL mux_744_nl : STD_LOGIC;
  SIGNAL nand_94_nl : STD_LOGIC;
  SIGNAL mux_743_nl : STD_LOGIC;
  SIGNAL and_275_nl : STD_LOGIC;
  SIGNAL and_276_nl : STD_LOGIC;
  SIGNAL or_972_nl : STD_LOGIC;
  SIGNAL mux_742_nl : STD_LOGIC;
  SIGNAL nand_128_nl : STD_LOGIC;
  SIGNAL nand_129_nl : STD_LOGIC;
  SIGNAL mux_741_nl : STD_LOGIC;
  SIGNAL nand_93_nl : STD_LOGIC;
  SIGNAL mux_740_nl : STD_LOGIC;
  SIGNAL and_277_nl : STD_LOGIC;
  SIGNAL and_278_nl : STD_LOGIC;
  SIGNAL or_969_nl : STD_LOGIC;
  SIGNAL mux_739_nl : STD_LOGIC;
  SIGNAL nand_130_nl : STD_LOGIC;
  SIGNAL nand_131_nl : STD_LOGIC;
  SIGNAL mux_766_nl : STD_LOGIC;
  SIGNAL mux_765_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL mux_764_nl : STD_LOGIC;
  SIGNAL or_999_nl : STD_LOGIC;
  SIGNAL or_998_nl : STD_LOGIC;
  SIGNAL mux_763_nl : STD_LOGIC;
  SIGNAL mux_762_nl : STD_LOGIC;
  SIGNAL and_265_nl : STD_LOGIC;
  SIGNAL mux_761_nl : STD_LOGIC;
  SIGNAL nor_273_nl : STD_LOGIC;
  SIGNAL and_403_nl : STD_LOGIC;
  SIGNAL mux_760_nl : STD_LOGIC;
  SIGNAL and_266_nl : STD_LOGIC;
  SIGNAL and_404_nl : STD_LOGIC;
  SIGNAL mux_759_nl : STD_LOGIC;
  SIGNAL and_267_nl : STD_LOGIC;
  SIGNAL and_268_nl : STD_LOGIC;
  SIGNAL nor_276_nl : STD_LOGIC;
  SIGNAL mux_758_nl : STD_LOGIC;
  SIGNAL mux_757_nl : STD_LOGIC;
  SIGNAL mux_756_nl : STD_LOGIC;
  SIGNAL or_988_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_755_nl : STD_LOGIC;
  SIGNAL nand_120_nl : STD_LOGIC;
  SIGNAL nand_215_nl : STD_LOGIC;
  SIGNAL mux_754_nl : STD_LOGIC;
  SIGNAL mux_753_nl : STD_LOGIC;
  SIGNAL nand_122_nl : STD_LOGIC;
  SIGNAL nand_123_nl : STD_LOGIC;
  SIGNAL mux_752_nl : STD_LOGIC;
  SIGNAL nand_124_nl : STD_LOGIC;
  SIGNAL or_979_nl : STD_LOGIC;
  SIGNAL mux_773_nl : STD_LOGIC;
  SIGNAL mux_772_nl : STD_LOGIC;
  SIGNAL mux_771_nl : STD_LOGIC;
  SIGNAL nor_264_nl : STD_LOGIC;
  SIGNAL nor_265_nl : STD_LOGIC;
  SIGNAL mux_770_nl : STD_LOGIC;
  SIGNAL nor_266_nl : STD_LOGIC;
  SIGNAL mux_769_nl : STD_LOGIC;
  SIGNAL mux_768_nl : STD_LOGIC;
  SIGNAL nor_268_nl : STD_LOGIC;
  SIGNAL mux_767_nl : STD_LOGIC;
  SIGNAL nor_270_nl : STD_LOGIC;
  SIGNAL nor_271_nl : STD_LOGIC;
  SIGNAL mux_776_nl : STD_LOGIC;
  SIGNAL mux_775_nl : STD_LOGIC;
  SIGNAL nor_260_nl : STD_LOGIC;
  SIGNAL mux_774_nl : STD_LOGIC;
  SIGNAL nor_263_nl : STD_LOGIC;
  SIGNAL mux_781_nl : STD_LOGIC;
  SIGNAL mux_780_nl : STD_LOGIC;
  SIGNAL nor_254_nl : STD_LOGIC;
  SIGNAL nor_255_nl : STD_LOGIC;
  SIGNAL mux_779_nl : STD_LOGIC;
  SIGNAL mux_778_nl : STD_LOGIC;
  SIGNAL mux_777_nl : STD_LOGIC;
  SIGNAL mux_784_nl : STD_LOGIC;
  SIGNAL mux_783_nl : STD_LOGIC;
  SIGNAL nor_250_nl : STD_LOGIC;
  SIGNAL mux_782_nl : STD_LOGIC;
  SIGNAL nor_253_nl : STD_LOGIC;
  SIGNAL mux_790_nl : STD_LOGIC;
  SIGNAL mux_789_nl : STD_LOGIC;
  SIGNAL mux_788_nl : STD_LOGIC;
  SIGNAL nor_243_nl : STD_LOGIC;
  SIGNAL nor_244_nl : STD_LOGIC;
  SIGNAL mux_787_nl : STD_LOGIC;
  SIGNAL nor_245_nl : STD_LOGIC;
  SIGNAL nor_246_nl : STD_LOGIC;
  SIGNAL mux_786_nl : STD_LOGIC;
  SIGNAL nor_247_nl : STD_LOGIC;
  SIGNAL mux_785_nl : STD_LOGIC;
  SIGNAL nor_248_nl : STD_LOGIC;
  SIGNAL nor_249_nl : STD_LOGIC;
  SIGNAL mux_793_nl : STD_LOGIC;
  SIGNAL mux_792_nl : STD_LOGIC;
  SIGNAL nor_239_nl : STD_LOGIC;
  SIGNAL mux_791_nl : STD_LOGIC;
  SIGNAL nor_242_nl : STD_LOGIC;
  SIGNAL mux_798_nl : STD_LOGIC;
  SIGNAL mux_797_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL mux_796_nl : STD_LOGIC;
  SIGNAL mux_795_nl : STD_LOGIC;
  SIGNAL mux_794_nl : STD_LOGIC;
  SIGNAL mux_801_nl : STD_LOGIC;
  SIGNAL mux_800_nl : STD_LOGIC;
  SIGNAL nor_229_nl : STD_LOGIC;
  SIGNAL mux_799_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL mux_808_nl : STD_LOGIC;
  SIGNAL mux_807_nl : STD_LOGIC;
  SIGNAL mux_806_nl : STD_LOGIC;
  SIGNAL nor_221_nl : STD_LOGIC;
  SIGNAL nor_222_nl : STD_LOGIC;
  SIGNAL mux_805_nl : STD_LOGIC;
  SIGNAL nor_223_nl : STD_LOGIC;
  SIGNAL mux_804_nl : STD_LOGIC;
  SIGNAL mux_803_nl : STD_LOGIC;
  SIGNAL nor_225_nl : STD_LOGIC;
  SIGNAL mux_802_nl : STD_LOGIC;
  SIGNAL nor_227_nl : STD_LOGIC;
  SIGNAL nor_228_nl : STD_LOGIC;
  SIGNAL mux_811_nl : STD_LOGIC;
  SIGNAL mux_810_nl : STD_LOGIC;
  SIGNAL nor_217_nl : STD_LOGIC;
  SIGNAL mux_809_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL mux_816_nl : STD_LOGIC;
  SIGNAL mux_815_nl : STD_LOGIC;
  SIGNAL nor_211_nl : STD_LOGIC;
  SIGNAL nor_212_nl : STD_LOGIC;
  SIGNAL mux_814_nl : STD_LOGIC;
  SIGNAL mux_813_nl : STD_LOGIC;
  SIGNAL mux_812_nl : STD_LOGIC;
  SIGNAL mux_819_nl : STD_LOGIC;
  SIGNAL mux_818_nl : STD_LOGIC;
  SIGNAL nor_207_nl : STD_LOGIC;
  SIGNAL mux_817_nl : STD_LOGIC;
  SIGNAL nor_210_nl : STD_LOGIC;
  SIGNAL mux_825_nl : STD_LOGIC;
  SIGNAL mux_824_nl : STD_LOGIC;
  SIGNAL mux_823_nl : STD_LOGIC;
  SIGNAL and_396_nl : STD_LOGIC;
  SIGNAL nor_201_nl : STD_LOGIC;
  SIGNAL mux_822_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL mux_821_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL mux_820_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL nor_206_nl : STD_LOGIC;
  SIGNAL mux_828_nl : STD_LOGIC;
  SIGNAL mux_827_nl : STD_LOGIC;
  SIGNAL nor_196_nl : STD_LOGIC;
  SIGNAL mux_826_nl : STD_LOGIC;
  SIGNAL nor_199_nl : STD_LOGIC;
  SIGNAL mux_833_nl : STD_LOGIC;
  SIGNAL mux_832_nl : STD_LOGIC;
  SIGNAL nor_192_nl : STD_LOGIC;
  SIGNAL nor_193_nl : STD_LOGIC;
  SIGNAL mux_831_nl : STD_LOGIC;
  SIGNAL mux_830_nl : STD_LOGIC;
  SIGNAL mux_829_nl : STD_LOGIC;
  SIGNAL mux_836_nl : STD_LOGIC;
  SIGNAL mux_835_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL mux_834_nl : STD_LOGIC;
  SIGNAL nor_191_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux1h_62_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_or_50_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_and_80_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux1h_63_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_or_51_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_or_52_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux1h_64_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_626_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_tmp_mux_12_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_or_53_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_206_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_627_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_207_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_208_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_mux_4_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_367_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_368_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_450_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_451_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_452_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_453_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_454_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_455_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_456_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_369_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_457_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_458_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_459_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_460_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_461_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_462_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_463_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_370_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_371_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_464_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_465_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_466_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_467_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_468_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_469_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_470_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_372_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_373_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_374_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_375_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_471_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_472_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_473_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_474_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_475_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_476_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_477_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_376_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_377_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_378_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_379_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_380_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_381_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_382_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

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

  SIGNAL COMP_LOOP_5_tmp_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_5_tmp_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_5_tmp_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL COMP_LOOP_1_tmp_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

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
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_56_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_84_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_112_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_140_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_168_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_196_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_224_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_64_16_2(input_15 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(15 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_64_17_2(input_16 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(16 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_64_19_2(input_18 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(18 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_64_9_2(input_8 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_6_16_2(input_15 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(15 DOWNTO 0))
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

  FUNCTION MUX1HOT_v_9_4_2(input_3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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

  FUNCTION READSLICE_64_65(input_val:STD_LOGIC_VECTOR(64 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC_VECTOR IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 1);
  BEGIN
    RETURN input_val(sat_index+63 DOWNTO sat_index);
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

  vec_rsc_triosy_0_15_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_15_lz
    );
  vec_rsc_triosy_0_14_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_14_lz
    );
  vec_rsc_triosy_0_13_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_13_lz
    );
  vec_rsc_triosy_0_12_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_12_lz
    );
  vec_rsc_triosy_0_11_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_11_lz
    );
  vec_rsc_triosy_0_10_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_10_lz
    );
  vec_rsc_triosy_0_9_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_9_lz
    );
  vec_rsc_triosy_0_8_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_8_lz
    );
  vec_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_7_lz
    );
  vec_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_6_lz
    );
  vec_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_5_lz
    );
  vec_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_4_lz
    );
  vec_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_3_lz
    );
  vec_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_2_lz
    );
  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  twiddle_rsc_triosy_0_15_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_15_lz
    );
  twiddle_rsc_triosy_0_14_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_14_lz
    );
  twiddle_rsc_triosy_0_13_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_13_lz
    );
  twiddle_rsc_triosy_0_12_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_12_lz
    );
  twiddle_rsc_triosy_0_11_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_11_lz
    );
  twiddle_rsc_triosy_0_10_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_10_lz
    );
  twiddle_rsc_triosy_0_9_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_9_lz
    );
  twiddle_rsc_triosy_0_8_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_8_lz
    );
  twiddle_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_7_lz
    );
  twiddle_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_6_lz
    );
  twiddle_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_5_lz
    );
  twiddle_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_4_lz
    );
  twiddle_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_3_lz
    );
  twiddle_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_2_lz
    );
  twiddle_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_1_lz
    );
  twiddle_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_15_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_0_lz
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
  COMP_LOOP_1_modulo_dev_cmp_base_rsc_dat <= MUX1HOT_v_64_3_2((READSLICE_64_65(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_209_cse
      & '1') + UNSIGNED((MUX_v_64_2_2((NOT COMP_LOOP_1_acc_8_itm), (NOT z_out_9),
      COMP_LOOP_or_17_itm)) & '1'), 65)), 1)), COMP_LOOP_1_acc_8_itm, z_out_3, STD_LOGIC_VECTOR'(
      COMP_LOOP_or_20_itm & ((NOT (MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2((NOT nor_tmp_15),
      mux_tmp_826, fsm_output(7))), or_tmp_1059, fsm_output(2))), (MUX_s_1_2_2(or_tmp_1059,
      (MUX_s_1_2_2(nand_tmp_99, ((fsm_output(4)) OR (NOT (fsm_output(3))) OR (fsm_output(6))),
      fsm_output(7))), fsm_output(2))), fsm_output(5)))) AND and_dcpl_41) & ((and_dcpl_31
      AND and_dcpl_52 AND and_dcpl_29) OR (and_dcpl_132 AND and_dcpl_36) OR (nor_tmp_16
      AND not_tmp_64 AND and_dcpl_29) OR (and_dcpl_38 AND not_tmp_64 AND and_dcpl_36)
      OR (and_dcpl_31 AND and_dcpl_37 AND and_dcpl_29) OR (and_dcpl_180 AND and_dcpl_76)
      OR (and_dcpl_180 AND and_dcpl_80) OR (and_dcpl_38 AND and_363_cse AND and_dcpl_76))));
  COMP_LOOP_1_modulo_dev_cmp_m_rsc_dat <= p_sva;
  COMP_LOOP_1_modulo_dev_cmp_return_rsc_z <= COMP_LOOP_1_modulo_dev_cmp_return_rsc_z_1;
  COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat <= NOT((MUX_s_1_2_2((MUX_s_1_2_2((MUX_s_1_2_2(((fsm_output(3))
      OR (NOT (MUX_s_1_2_2((NOT((fsm_output(0)) OR (NOT (fsm_output(4))))), or_tmp_1063,
      fsm_output(7))))), nand_tmp_100, fsm_output(6))), ((fsm_output(6)) OR mux_tmp_832),
      fsm_output(5))), (MUX_s_1_2_2((MUX_s_1_2_2(mux_tmp_832, ((fsm_output(3)) OR
      (NOT (fsm_output(7))) OR (fsm_output(0)) OR (NOT (fsm_output(4)))), fsm_output(6))),
      (MUX_s_1_2_2(nand_tmp_100, ((fsm_output(3)) OR (fsm_output(7)) OR (NOT or_tmp_1063)),
      fsm_output(6))), fsm_output(5))), fsm_output(2))) OR (fsm_output(1)));

  COMP_LOOP_5_tmp_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_5_tmp_lshift_rg_a,
      s => COMP_LOOP_5_tmp_lshift_rg_s,
      z => COMP_LOOP_5_tmp_lshift_rg_z
    );
  COMP_LOOP_5_tmp_lshift_rg_a(0) <= '1';
  COMP_LOOP_5_tmp_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_6, CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("00000010")));
  z_out <= COMP_LOOP_5_tmp_lshift_rg_z;

  COMP_LOOP_1_tmp_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => COMP_LOOP_1_tmp_lshift_rg_a,
      s => COMP_LOOP_1_tmp_lshift_rg_s,
      z => COMP_LOOP_1_tmp_lshift_rg_z
    );
  COMP_LOOP_1_tmp_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_tmp_lshift_rg_s <= MUX_v_4_2_2(z_out_6, COMP_LOOP_1_tmp_acc_cse_sva,
      (and_dcpl_31 AND (NOT (fsm_output(4))) AND (fsm_output(0)) AND (fsm_output(1))
      AND (NOT (fsm_output(2))) AND nor_625_cse) OR (and_dcpl_31 AND (NOT (fsm_output(4)))
      AND (NOT (fsm_output(0))) AND (NOT (fsm_output(1))) AND (fsm_output(2)) AND
      nor_625_cse));
  z_out_1 <= COMP_LOOP_1_tmp_lshift_rg_z;

  inPlaceNTT_DIF_core_wait_dp_inst : inPlaceNTT_DIF_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => mux_842_rmff,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en => COMP_LOOP_1_modulo_dev_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIF_core_core_fsm_inst : inPlaceNTT_DIF_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIF_core_core_fsm_inst_fsm_output,
      COMP_LOOP_C_28_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0,
      COMP_LOOP_C_56_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0,
      COMP_LOOP_C_84_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0,
      COMP_LOOP_C_112_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0,
      COMP_LOOP_C_140_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0,
      COMP_LOOP_C_168_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0,
      COMP_LOOP_C_196_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0,
      COMP_LOOP_C_224_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIF_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_28_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_56_tr0 <= NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_84_tr0 <= NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_112_tr0 <= NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_140_tr0 <= NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_168_tr0 <= NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_196_tr0 <= NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_224_tr0 <= NOT COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_5(10);
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= NOT (z_out_4(4));

  and_334_cse <= (fsm_output(2)) AND (fsm_output(0));
  nand_199_cse <= NOT((COMP_LOOP_acc_10_cse_10_1_5_sva(0)) AND (fsm_output(6)) AND
      (fsm_output(4)));
  nand_186_cse <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) AND CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  nand_172_cse <= NOT((COMP_LOOP_acc_10_cse_10_1_4_sva(3)) AND (fsm_output(6)) AND
      (fsm_output(4)));
  nand_168_cse <= NOT((COMP_LOOP_acc_10_cse_10_1_5_sva(3)) AND (COMP_LOOP_acc_10_cse_10_1_5_sva(0))
      AND (fsm_output(6)) AND (fsm_output(4)));
  nand_165_cse <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) AND CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  nand_153_cse <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(1))) AND CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  nand_154_cse <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)) AND (fsm_output(4)));
  nand_132_cse <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) AND CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm);
  nand_114_cse <= NOT((z_out_2(0)) AND (fsm_output(3)));
  nand_113_cse <= NOT(CONV_SL_1_1(z_out_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      (fsm_output(3)));
  or_1107_nl <= (fsm_output(4)) OR mux_120_cse;
  mux_840_nl <= MUX_s_1_2_2(nand_tmp_99, or_1107_nl, fsm_output(7));
  mux_841_nl <= MUX_s_1_2_2(or_tmp_1059, mux_840_nl, fsm_output(2));
  nor_189_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"))))
      OR (fsm_output(6)));
  mux_837_nl <= MUX_s_1_2_2(nand_tmp_99, nor_189_nl, fsm_output(7));
  mux_838_nl <= MUX_s_1_2_2(mux_837_nl, (NOT and_344_cse), fsm_output(2));
  mux_842_rmff <= MUX_s_1_2_2(mux_841_nl, mux_838_nl, fsm_output(5));
  or_170_cse_1 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  nor_652_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  or_93_cse <= (fsm_output(2)) OR (fsm_output(0));
  or_41_cse <= (fsm_output(2)) OR (fsm_output(5));
  mux_84_cse <= MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, fsm_output(2));
  mux_85_cse <= MUX_s_1_2_2(not_tmp_39, mux_84_cse, fsm_output(5));
  or_60_cse <= (fsm_output(6)) OR (fsm_output(4));
  or_1226_cse <= (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(3));
  and_364_cse <= or_1226_cse AND (fsm_output(7));
  nor_543_cse <= NOT((fsm_output(2)) OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(4))
      OR (fsm_output(7)));
  and_344_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_tmp_or_cse <= and_dcpl_47 OR and_dcpl_50 OR and_dcpl_128 OR and_dcpl_129
      OR and_dcpl_130 OR and_dcpl_131;
  COMP_LOOP_or_35_cse <= and_dcpl_128 OR and_dcpl_131;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
  COMP_LOOP_tmp_or_3_cse <= and_dcpl_47 OR and_dcpl_50 OR and_dcpl_128 OR and_dcpl_129
      OR and_dcpl_130 OR and_dcpl_133;
  COMP_LOOP_or_34_cse <= and_dcpl_130 OR and_dcpl_133;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse <= CONV_SL_1_1(z_out_2(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
  COMP_LOOP_tmp_or_5_cse <= and_dcpl_47 OR and_dcpl_50 OR and_dcpl_129 OR and_dcpl_130
      OR and_dcpl_133;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
  COMP_LOOP_or_25_cse <= and_dcpl_50 OR and_dcpl_129;
  COMP_LOOP_tmp_nor_1_cse <= NOT((z_out_2(3)) OR (z_out_2(2)) OR (z_out_2(0)));
  COMP_LOOP_or_24_cse <= and_dcpl_129 OR and_dcpl_130 OR and_dcpl_133;
  COMP_LOOP_tmp_nor_13_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  COMP_LOOP_tmp_nor_3_cse <= NOT((z_out_2(3)) OR (z_out_2(1)) OR (z_out_2(0)));
  COMP_LOOP_or_20_itm <= and_dcpl_128 OR and_dcpl_165 OR and_dcpl_167 OR and_dcpl_171
      OR and_dcpl_174 OR and_dcpl_179 OR and_dcpl_182 OR and_dcpl_185;
  or_1233_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  mux_120_cse <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(3));
  and_245_m1c <= and_dcpl_132 AND and_dcpl_46;
  mux_1014_nl <= MUX_s_1_2_2(mux_tmp_994, mux_tmp_855, fsm_output(0));
  mux_1015_nl <= MUX_s_1_2_2(mux_1014_nl, mux_tmp_991, fsm_output(2));
  mux_1016_nl <= MUX_s_1_2_2(mux_1015_nl, (fsm_output(7)), fsm_output(5));
  mux_1011_nl <= MUX_s_1_2_2(mux_tmp_855, mux_tmp_991, fsm_output(2));
  mux_1012_nl <= MUX_s_1_2_2(mux_1011_nl, (fsm_output(7)), fsm_output(5));
  mux_1017_tmp <= MUX_s_1_2_2(mux_1016_nl, mux_1012_nl, fsm_output(1));
  and_363_cse <= (fsm_output(4)) AND (fsm_output(7));
  or_139_cse <= (fsm_output(3)) OR (fsm_output(6));
  COMP_LOOP_1_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "000")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_1_acc_10_itm_10_1_1 <= COMP_LOOP_1_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_acc_psp_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0(9
      DOWNTO 3)) + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0), 7));
  COMP_LOOP_acc_1_cse_6_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
      + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "101")), 10));
  COMP_LOOP_acc_1_cse_4_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
      + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "011")), 10));
  COMP_LOOP_acc_1_cse_2_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
      + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "001")), 10));
  COMP_LOOP_2_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "001")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_2_acc_10_itm_10_1_1 <= COMP_LOOP_2_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_3_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "010")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_3_acc_10_itm_10_1_1 <= COMP_LOOP_3_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_4_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "011")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_4_acc_10_itm_10_1_1 <= COMP_LOOP_4_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_5_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "100")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_5_acc_10_itm_10_1_1 <= COMP_LOOP_5_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_6_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "101")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_6_acc_10_itm_10_1_1 <= COMP_LOOP_6_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_7_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "110")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_7_acc_10_itm_10_1_1 <= COMP_LOOP_7_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_8_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 &
      STD_LOGIC_VECTOR'( "111")), 10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva),
      11));
  COMP_LOOP_8_acc_10_itm_10_1_1 <= COMP_LOOP_8_acc_10_nl(10 DOWNTO 1);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt <= (COMP_LOOP_2_tmp_lshift_ncse_sva(1))
      AND COMP_LOOP_tmp_nor_14_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt <= (COMP_LOOP_2_tmp_lshift_ncse_sva(2))
      AND COMP_LOOP_tmp_nor_16_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt <= (COMP_LOOP_2_tmp_lshift_ncse_sva(3))
      AND COMP_LOOP_tmp_nor_19_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 <= (COMP_LOOP_2_tmp_mul_idiv_sva(0)) AND COMP_LOOP_tmp_nor_1_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 <= (COMP_LOOP_2_tmp_mul_idiv_sva(1)) AND COMP_LOOP_tmp_nor_14_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 <= (COMP_LOOP_2_tmp_mul_idiv_sva(2)) AND COMP_LOOP_tmp_nor_16_itm;
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 <= (COMP_LOOP_2_tmp_mul_idiv_sva(3)) AND COMP_LOOP_tmp_nor_19_itm;
  and_dcpl_4 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_tmp <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_393_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_tmp_6 <= MUX_s_1_2_2((NOT or_1233_cse), and_393_cse, fsm_output(5));
  mux_tmp_8 <= MUX_s_1_2_2((fsm_output(4)), or_170_cse_1, fsm_output(2));
  nor_tmp_13 <= (fsm_output(4)) AND (fsm_output(6));
  nor_tmp_15 <= (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(6));
  nor_tmp_16 <= (fsm_output(3)) AND (fsm_output(6));
  nor_tmp_17 <= or_170_cse_1 AND (fsm_output(6));
  not_tmp_39 <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)));
  nor_tmp_42 <= or_60_cse AND (fsm_output(7));
  not_tmp_64 <= NOT((fsm_output(4)) OR (fsm_output(7)));
  not_tmp_68 <= NOT((fsm_output(6)) AND (fsm_output(4)));
  or_1220_cse <= nor_tmp OR (fsm_output(6));
  nor_tmp_57 <= or_1220_cse AND (fsm_output(7));
  mux_205_cse <= MUX_s_1_2_2(nor_tmp_42, and_364_cse, fsm_output(2));
  not_tmp_120 <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(3))
      OR (fsm_output(6)) OR (fsm_output(7)));
  and_dcpl_27 <= NOT((fsm_output(5)) OR (fsm_output(1)));
  and_dcpl_28 <= NOT((fsm_output(0)) OR (fsm_output(2)));
  and_dcpl_29 <= and_dcpl_28 AND and_dcpl_27;
  and_dcpl_31 <= NOT((fsm_output(6)) OR (fsm_output(3)));
  and_dcpl_32 <= and_dcpl_31 AND not_tmp_64;
  and_dcpl_34 <= (fsm_output(5)) AND (NOT (fsm_output(1)));
  and_dcpl_35 <= (NOT (fsm_output(0))) AND (fsm_output(2));
  and_dcpl_36 <= and_dcpl_35 AND and_dcpl_34;
  and_dcpl_37 <= (NOT (fsm_output(4))) AND (fsm_output(7));
  and_dcpl_38 <= (fsm_output(6)) AND (NOT (fsm_output(3)));
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_37;
  and_tmp_12 <= (fsm_output(7)) AND nor_tmp_17;
  mux_tmp_264 <= MUX_s_1_2_2(and_tmp_12, and_344_cse, fsm_output(2));
  and_tmp_13 <= (fsm_output(5)) AND mux_tmp_264;
  and_dcpl_41 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  xor_dcpl_2 <= (fsm_output(6)) XOR (fsm_output(3));
  and_dcpl_45 <= (NOT (fsm_output(5))) AND (fsm_output(1));
  and_dcpl_46 <= and_dcpl_28 AND and_dcpl_45;
  and_dcpl_47 <= and_dcpl_32 AND and_dcpl_46;
  and_dcpl_48 <= (fsm_output(0)) AND (NOT (fsm_output(2)));
  and_dcpl_50 <= and_dcpl_32 AND and_dcpl_48 AND and_dcpl_45;
  and_dcpl_51 <= and_dcpl_35 AND and_dcpl_45;
  and_dcpl_52 <= (fsm_output(4)) AND (NOT (fsm_output(7)));
  and_dcpl_53 <= (NOT (fsm_output(6))) AND (fsm_output(3));
  and_dcpl_54 <= and_dcpl_53 AND and_dcpl_52;
  and_dcpl_57 <= and_334_cse AND and_dcpl_45;
  and_dcpl_58 <= and_dcpl_54 AND and_dcpl_57;
  and_dcpl_59 <= (fsm_output(5)) AND (fsm_output(1));
  and_dcpl_60 <= and_dcpl_28 AND and_dcpl_59;
  and_dcpl_62 <= and_dcpl_48 AND and_dcpl_59;
  and_dcpl_63 <= and_dcpl_54 AND and_dcpl_62;
  and_dcpl_64 <= and_dcpl_38 AND and_dcpl_52;
  and_dcpl_66 <= and_dcpl_64 AND and_dcpl_57;
  and_dcpl_68 <= and_dcpl_64 AND and_dcpl_62;
  and_dcpl_69 <= and_dcpl_53 AND and_dcpl_37;
  and_dcpl_71 <= and_dcpl_69 AND and_dcpl_57;
  and_dcpl_73 <= and_dcpl_69 AND and_dcpl_62;
  and_dcpl_75 <= and_dcpl_39 AND and_dcpl_57;
  and_dcpl_76 <= and_dcpl_35 AND and_dcpl_27;
  and_dcpl_78 <= and_334_cse AND and_dcpl_27;
  and_dcpl_80 <= and_dcpl_28 AND and_dcpl_34;
  and_dcpl_82 <= and_dcpl_48 AND and_dcpl_34;
  or_tmp_160 <= (COMP_LOOP_acc_14_psp_sva(0)) OR (NOT (fsm_output(6)));
  or_206_cse <= CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  nor_531_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(6))));
  nor_532_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6)));
  mux_296_nl <= MUX_s_1_2_2(nor_531_nl, nor_532_nl, fsm_output(3));
  nand_13_nl <= NOT((fsm_output(4)) AND mux_296_nl);
  or_208_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_294_nl <= MUX_s_1_2_2(or_tmp_160, or_208_nl, fsm_output(3));
  or_207_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")) OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_295_nl <= MUX_s_1_2_2(mux_294_nl, or_207_nl, or_206_cse);
  or_210_nl <= (fsm_output(4)) OR mux_295_nl;
  mux_tmp_278 <= MUX_s_1_2_2(nand_13_nl, or_210_nl, fsm_output(7));
  or_tmp_170 <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(6)));
  or_215_cse <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  not_tmp_143 <= NOT((COMP_LOOP_acc_1_cse_sva(0)) AND (fsm_output(6)));
  not_tmp_144 <= NOT((COMP_LOOP_acc_1_cse_4_sva(0)) AND (fsm_output(6)));
  not_tmp_146 <= NOT((COMP_LOOP_acc_10_cse_10_1_sva(0)) AND (fsm_output(6)));
  or_tmp_220 <= (COMP_LOOP_acc_10_cse_10_1_7_sva(1)) OR (NOT((COMP_LOOP_acc_10_cse_10_1_7_sva(0))
      AND (fsm_output(6))));
  not_tmp_160 <= NOT((COMP_LOOP_acc_14_psp_sva(0)) AND (fsm_output(6)));
  nor_497_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT (fsm_output(6))));
  nor_498_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6)));
  mux_356_nl <= MUX_s_1_2_2(nor_497_nl, nor_498_nl, fsm_output(3));
  nand_24_nl <= NOT((fsm_output(4)) AND mux_356_nl);
  or_317_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  mux_354_nl <= MUX_s_1_2_2(not_tmp_160, or_317_nl, fsm_output(3));
  or_316_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  mux_355_nl <= MUX_s_1_2_2(mux_354_nl, or_316_nl, or_206_cse);
  or_318_nl <= (fsm_output(4)) OR mux_355_nl;
  mux_tmp_338 <= MUX_s_1_2_2(nand_24_nl, or_318_nl, fsm_output(7));
  or_tmp_278 <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(6)));
  not_tmp_168 <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)));
  not_tmp_170 <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)));
  not_tmp_173 <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)));
  not_tmp_184 <= NOT((COMP_LOOP_acc_11_psp_sva(1)) AND (fsm_output(6)));
  nor_99_cse <= NOT(CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")));
  nor_463_nl <= NOT((COMP_LOOP_acc_11_psp_sva(0)) OR (COMP_LOOP_acc_11_psp_sva(2))
      OR not_tmp_184);
  nor_464_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6)));
  mux_416_nl <= MUX_s_1_2_2(nor_463_nl, nor_464_nl, fsm_output(3));
  nand_35_nl <= NOT((fsm_output(4)) AND mux_416_nl);
  or_423_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01")) OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  or_422_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_414_nl <= MUX_s_1_2_2(or_tmp_160, or_422_nl, fsm_output(3));
  mux_415_nl <= MUX_s_1_2_2(or_423_nl, mux_414_nl, nor_99_cse);
  or_424_nl <= (fsm_output(4)) OR mux_415_nl;
  mux_tmp_398 <= MUX_s_1_2_2(nand_35_nl, or_424_nl, fsm_output(7));
  nor_101_cse <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_429_nl <= NOT((NOT (COMP_LOOP_acc_11_psp_sva(0))) OR (COMP_LOOP_acc_11_psp_sva(2))
      OR not_tmp_184);
  nor_430_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6)));
  mux_476_nl <= MUX_s_1_2_2(nor_429_nl, nor_430_nl, fsm_output(3));
  nand_46_nl <= NOT((fsm_output(4)) AND mux_476_nl);
  or_525_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01")) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  or_524_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  mux_474_nl <= MUX_s_1_2_2(not_tmp_160, or_524_nl, fsm_output(3));
  mux_475_nl <= MUX_s_1_2_2(or_525_nl, mux_474_nl, nor_99_cse);
  or_526_nl <= (fsm_output(4)) OR mux_475_nl;
  mux_tmp_458 <= MUX_s_1_2_2(nand_46_nl, or_526_nl, fsm_output(7));
  not_tmp_226 <= NOT((COMP_LOOP_acc_10_cse_10_1_4_sva(3)) AND (fsm_output(6)));
  or_624_cse <= CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  nor_395_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT (fsm_output(6))));
  nor_396_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6)));
  mux_536_nl <= MUX_s_1_2_2(nor_395_nl, nor_396_nl, fsm_output(3));
  nand_57_nl <= NOT((fsm_output(4)) AND mux_536_nl);
  or_626_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_534_nl <= MUX_s_1_2_2(or_tmp_160, or_626_nl, fsm_output(3));
  or_625_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10")) OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_535_nl <= MUX_s_1_2_2(mux_534_nl, or_625_nl, or_624_cse);
  or_627_nl <= (fsm_output(4)) OR mux_535_nl;
  mux_tmp_518 <= MUX_s_1_2_2(nand_57_nl, or_627_nl, fsm_output(7));
  not_tmp_229 <= NOT((COMP_LOOP_acc_10_cse_10_1_3_sva(3)) AND (fsm_output(6)));
  or_632_cse <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  not_tmp_237 <= NOT((COMP_LOOP_acc_1_cse_4_sva(3)) AND (COMP_LOOP_acc_1_cse_4_sva(0))
      AND (fsm_output(6)));
  and_395_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"))
      AND (fsm_output(6));
  nor_362_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6)));
  mux_596_nl <= MUX_s_1_2_2(and_395_nl, nor_362_nl, fsm_output(3));
  nand_68_nl <= NOT((fsm_output(4)) AND mux_596_nl);
  or_731_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  mux_594_nl <= MUX_s_1_2_2(not_tmp_160, or_731_nl, fsm_output(3));
  or_730_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10")) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6));
  mux_595_nl <= MUX_s_1_2_2(mux_594_nl, or_730_nl, or_624_cse);
  or_732_nl <= (fsm_output(4)) OR mux_595_nl;
  mux_tmp_578 <= MUX_s_1_2_2(nand_68_nl, or_732_nl, fsm_output(7));
  not_tmp_273 <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)));
  and_293_cse <= CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  nor_327_nl <= NOT((COMP_LOOP_acc_11_psp_sva(0)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(6)))));
  nor_328_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6)));
  mux_656_nl <= MUX_s_1_2_2(nor_327_nl, nor_328_nl, fsm_output(3));
  nand_79_nl <= NOT((fsm_output(4)) AND mux_656_nl);
  or_834_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("11")) OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  or_833_nl <= CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6));
  mux_654_nl <= MUX_s_1_2_2(or_tmp_160, or_833_nl, fsm_output(3));
  mux_655_nl <= MUX_s_1_2_2(or_834_nl, mux_654_nl, and_293_cse);
  or_835_nl <= (fsm_output(4)) OR mux_655_nl;
  mux_tmp_638 <= MUX_s_1_2_2(nand_79_nl, or_835_nl, fsm_output(7));
  not_tmp_277 <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(6)));
  and_292_cse <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_282_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND (fsm_output(6));
  and_283_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) AND (COMP_LOOP_acc_psp_sva(0)) AND (VEC_LOOP_j_10_0_sva_9_0(1))
      AND (NOT (fsm_output(6)));
  mux_716_nl <= MUX_s_1_2_2(and_282_nl, and_283_nl, fsm_output(3));
  nand_90_nl <= NOT((fsm_output(4)) AND mux_716_nl);
  nand_144_nl <= NOT((fsm_output(3)) AND CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11")) AND (VEC_LOOP_j_10_0_sva_9_0(1)) AND (NOT (fsm_output(6))));
  nand_145_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (VEC_LOOP_j_10_0_sva_9_0(1)) AND (NOT (fsm_output(6))));
  mux_714_nl <= MUX_s_1_2_2(not_tmp_160, nand_145_nl, fsm_output(3));
  mux_715_nl <= MUX_s_1_2_2(nand_144_nl, mux_714_nl, and_293_cse);
  or_934_nl <= (fsm_output(4)) OR mux_715_nl;
  mux_tmp_698 <= MUX_s_1_2_2(nand_90_nl, or_934_nl, fsm_output(7));
  and_dcpl_128 <= and_dcpl_32 AND and_dcpl_76;
  and_dcpl_129 <= and_dcpl_32 AND and_dcpl_78;
  and_dcpl_130 <= and_dcpl_32 AND and_dcpl_51;
  and_dcpl_131 <= and_dcpl_32 AND and_dcpl_57;
  and_dcpl_132 <= and_dcpl_53 AND not_tmp_64;
  and_dcpl_133 <= and_dcpl_132 AND and_dcpl_29;
  and_dcpl_134 <= and_dcpl_48 AND and_dcpl_27;
  and_dcpl_135 <= and_dcpl_132 AND and_dcpl_134;
  and_dcpl_137 <= NOT((fsm_output(6)) OR (fsm_output(4)));
  and_dcpl_138 <= and_dcpl_137 AND (NOT (fsm_output(7))) AND (NOT (fsm_output(5)));
  nand_tmp_99 <= NOT((fsm_output(4)) AND xor_dcpl_2);
  or_tmp_1059 <= (fsm_output(7)) OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6));
  mux_tmp_826 <= MUX_s_1_2_2((NOT nor_tmp_16), or_139_cse, fsm_output(4));
  and_dcpl_165 <= and_dcpl_32 AND and_dcpl_80;
  and_dcpl_167 <= and_dcpl_54 AND and_dcpl_36;
  and_dcpl_171 <= nor_tmp_16 AND and_dcpl_52 AND and_dcpl_29;
  and_dcpl_174 <= and_dcpl_64 AND and_dcpl_36;
  and_dcpl_179 <= and_dcpl_31 AND and_363_cse AND and_dcpl_29;
  and_dcpl_180 <= and_dcpl_53 AND and_363_cse;
  and_dcpl_182 <= and_dcpl_69 AND and_dcpl_36;
  and_dcpl_185 <= nor_tmp_16 AND and_dcpl_37 AND and_dcpl_29;
  or_tmp_1063 <= (NOT (fsm_output(0))) OR (fsm_output(4));
  mux_849_nl <= MUX_s_1_2_2(or_tmp_1063, (NOT (fsm_output(4))), fsm_output(7));
  nand_tmp_100 <= NOT((fsm_output(3)) AND mux_849_nl);
  or_1221_nl <= (fsm_output(4)) OR (fsm_output(7));
  or_1117_nl <= (NOT (fsm_output(7))) OR (fsm_output(0)) OR (NOT (fsm_output(4)));
  mux_tmp_832 <= MUX_s_1_2_2(or_1221_nl, or_1117_nl, fsm_output(3));
  not_tmp_371 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000")));
  mux_tmp_840 <= MUX_s_1_2_2(nor_543_cse, mux_tmp_264, fsm_output(5));
  or_tmp_1076 <= (fsm_output(5)) OR (NOT (fsm_output(1)));
  or_dcpl_55 <= or_tmp_1059 OR (fsm_output(0)) OR (fsm_output(2)) OR or_tmp_1076;
  mux_tmp_847 <= MUX_s_1_2_2(and_tmp_12, and_344_cse, fsm_output(0));
  mux_tmp_848 <= MUX_s_1_2_2((NOT or_1226_cse), nor_tmp_17, fsm_output(7));
  mux_tmp_849 <= MUX_s_1_2_2(mux_tmp_848, and_tmp_12, fsm_output(0));
  mux_871_nl <= MUX_s_1_2_2(mux_tmp_848, and_tmp_12, fsm_output(2));
  mux_tmp_853 <= MUX_s_1_2_2(mux_871_nl, and_344_cse, fsm_output(5));
  mux_869_nl <= MUX_s_1_2_2(mux_tmp_849, mux_tmp_847, fsm_output(2));
  mux_870_nl <= MUX_s_1_2_2(mux_869_nl, and_344_cse, fsm_output(5));
  mux_873_itm <= MUX_s_1_2_2(mux_tmp_853, mux_870_nl, fsm_output(1));
  mux_tmp_855 <= MUX_s_1_2_2((NOT or_1226_cse), (fsm_output(6)), fsm_output(7));
  mux_tmp_856 <= MUX_s_1_2_2(mux_tmp_855, and_344_cse, or_93_cse);
  mux_tmp_857 <= MUX_s_1_2_2(mux_tmp_856, and_364_cse, fsm_output(5));
  mux_tmp_859 <= MUX_s_1_2_2(mux_tmp_855, and_344_cse, fsm_output(2));
  not_tmp_382 <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(3))
      OR (fsm_output(6)));
  mux_tmp_862 <= MUX_s_1_2_2(not_tmp_382, nor_tmp_13, fsm_output(5));
  not_tmp_385 <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(3)));
  mux_tmp_866 <= MUX_s_1_2_2(not_tmp_385, nor_tmp, fsm_output(5));
  and_dcpl_200 <= (or_1233_cse OR (CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))))
      AND not_tmp_371;
  mux_tmp_873 <= MUX_s_1_2_2(and_dcpl_31, nor_tmp_16, fsm_output(4));
  mux_893_nl <= MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, fsm_output(0));
  mux_894_nl <= MUX_s_1_2_2(mux_893_nl, nor_tmp_13, fsm_output(2));
  mux_tmp_876 <= MUX_s_1_2_2(mux_894_nl, (fsm_output(6)), fsm_output(5));
  mux_903_nl <= MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, fsm_output(2));
  mux_tmp_885 <= MUX_s_1_2_2(mux_903_nl, (fsm_output(6)), fsm_output(5));
  mux_906_nl <= MUX_s_1_2_2(not_tmp_385, and_393_cse, fsm_output(5));
  mux_907_nl <= MUX_s_1_2_2(mux_tmp_6, mux_906_nl, fsm_output(1));
  and_dcpl_204 <= (NOT mux_907_nl) AND and_dcpl_4;
  mux_913_nl <= MUX_s_1_2_2(mux_tmp_873, nor_tmp_15, or_93_cse);
  mux_914_nl <= MUX_s_1_2_2(mux_913_nl, (fsm_output(6)), fsm_output(5));
  mux_915_nl <= MUX_s_1_2_2(mux_tmp_885, mux_914_nl, fsm_output(1));
  and_dcpl_207 <= NOT(mux_915_nl OR (fsm_output(7)));
  mux_tmp_897 <= MUX_s_1_2_2((NOT or_1226_cse), or_60_cse, fsm_output(7));
  mux_917_nl <= MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, fsm_output(0));
  mux_918_nl <= MUX_s_1_2_2(mux_917_nl, and_364_cse, fsm_output(2));
  mux_tmp_900 <= MUX_s_1_2_2(mux_918_nl, (fsm_output(7)), fsm_output(5));
  mux_927_nl <= MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, fsm_output(2));
  mux_tmp_909 <= MUX_s_1_2_2(mux_927_nl, (fsm_output(7)), fsm_output(5));
  mux_930_nl <= MUX_s_1_2_2(not_tmp_382, mux_84_cse, fsm_output(5));
  mux_931_nl <= MUX_s_1_2_2(mux_85_cse, mux_930_nl, fsm_output(1));
  and_dcpl_208 <= NOT(mux_931_nl OR (fsm_output(7)));
  mux_tmp_916 <= MUX_s_1_2_2(mux_tmp_859, mux_205_cse, fsm_output(5));
  mux_937_nl <= MUX_s_1_2_2(mux_tmp_897, nor_tmp_42, or_93_cse);
  mux_938_nl <= MUX_s_1_2_2(mux_937_nl, (fsm_output(7)), fsm_output(5));
  mux_939_itm <= MUX_s_1_2_2(mux_tmp_909, mux_938_nl, fsm_output(1));
  mux_tmp_921 <= MUX_s_1_2_2(mux_tmp_849, and_344_cse, or_41_cse);
  mux_946_itm <= MUX_s_1_2_2(mux_tmp_853, mux_tmp_921, fsm_output(1));
  mux_947_nl <= MUX_s_1_2_2(mux_tmp_856, mux_205_cse, fsm_output(5));
  mux_948_itm <= MUX_s_1_2_2(mux_tmp_916, mux_947_nl, fsm_output(1));
  mux_tmp_930 <= MUX_s_1_2_2(not_tmp_120, and_344_cse, fsm_output(5));
  mux_956_nl <= MUX_s_1_2_2(mux_tmp_848, and_tmp_12, or_93_cse);
  mux_957_nl <= MUX_s_1_2_2(mux_956_nl, and_344_cse, fsm_output(5));
  mux_958_itm <= MUX_s_1_2_2(mux_tmp_853, mux_957_nl, fsm_output(1));
  and_dcpl_211 <= NOT((fsm_output(2)) OR (fsm_output(5)));
  and_dcpl_214 <= (NOT or_1226_cse) AND (NOT (fsm_output(7))) AND (fsm_output(0));
  or_tmp_1101 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  nor_tmp_177 <= or_1233_cse AND (fsm_output(6));
  mux_tmp_982 <= MUX_s_1_2_2((NOT or_1226_cse), nor_tmp_13, fsm_output(7));
  mux_tmp_984 <= MUX_s_1_2_2(and_dcpl_137, nor_tmp_15, fsm_output(7));
  mux_tmp_991 <= MUX_s_1_2_2((NOT or_1226_cse), or_1220_cse, fsm_output(7));
  mux_tmp_994 <= MUX_s_1_2_2(and_dcpl_137, (fsm_output(6)), fsm_output(7));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_39 AND and_dcpl_36;
  VEC_LOOP_j_10_0_sva_9_0_mx0c0 <= and_dcpl_32 AND and_dcpl_134;
  COMP_LOOP_tmp_mux_itm_mx0c1 <= and_dcpl_214 AND and_dcpl_211 AND (fsm_output(1))
      AND COMP_LOOP_1_tmp_mul_idiv_sva_0;
  or_1174_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(0))) OR (fsm_output(3));
  mux_966_nl <= MUX_s_1_2_2(or_tmp_1101, or_1174_nl, fsm_output(1));
  COMP_LOOP_1_acc_8_itm_mx0c2 <= (NOT mux_966_nl) AND and_dcpl_138;
  mux_968_nl <= MUX_s_1_2_2(mux_tmp_826, or_1226_cse, fsm_output(7));
  nand_102_nl <= NOT((fsm_output(7)) AND (fsm_output(4)) AND xor_dcpl_2);
  mux_969_nl <= MUX_s_1_2_2(mux_968_nl, nand_102_nl, fsm_output(2));
  nand_104_nl <= NOT((fsm_output(7)) AND (fsm_output(4)) AND (fsm_output(3)) AND
      (NOT (fsm_output(6))));
  or_1177_nl <= (fsm_output(7)) OR (fsm_output(4)) OR mux_120_cse;
  mux_967_nl <= MUX_s_1_2_2(nand_104_nl, or_1177_nl, fsm_output(2));
  mux_970_nl <= MUX_s_1_2_2(mux_969_nl, mux_967_nl, fsm_output(5));
  COMP_LOOP_1_acc_8_itm_mx0c3 <= (NOT mux_970_nl) AND and_dcpl_41;
  or_1197_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  mux_1000_nl <= MUX_s_1_2_2(or_tmp_1101, or_1197_nl, fsm_output(1));
  tmp_21_sva_1_mx0c0 <= (NOT mux_1000_nl) AND (NOT (fsm_output(6))) AND not_tmp_64
      AND (fsm_output(0)) AND (NOT (fsm_output(5)));
  nor_567_nl <= NOT(and_334_cse OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  mux_30_nl <= MUX_s_1_2_2(nor_567_nl, mux_tmp_8, fsm_output(5));
  mux_989_nl <= MUX_s_1_2_2((NOT or_1233_cse), mux_tmp_8, fsm_output(5));
  mux_991_nl <= MUX_s_1_2_2(mux_30_nl, mux_989_nl, fsm_output(1));
  and_237_tmp <= (NOT mux_991_nl) AND and_dcpl_4;
  or_36_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  mux_67_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), or_36_nl);
  mux_64_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), or_170_cse_1);
  mux_993_nl <= MUX_s_1_2_2(mux_64_nl, nor_tmp_17, fsm_output(2));
  mux_994_nl <= MUX_s_1_2_2(mux_993_nl, (fsm_output(6)), fsm_output(5));
  mux_996_nl <= MUX_s_1_2_2(mux_67_nl, mux_994_nl, fsm_output(1));
  nor_568_tmp <= NOT(mux_996_nl OR (fsm_output(7)));
  mux_998_nl <= MUX_s_1_2_2((NOT or_1226_cse), nor_tmp_177, fsm_output(5));
  nor_180_nl <= NOT(and_334_cse OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)));
  mux_997_nl <= MUX_s_1_2_2(nor_180_nl, nor_tmp_177, fsm_output(5));
  mux_999_nl <= MUX_s_1_2_2(mux_998_nl, mux_997_nl, fsm_output(1));
  nor_tmp_180 <= NOT(mux_999_nl OR (fsm_output(7)));
  and_240_tmp <= NOT((NOT(or_139_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(7)));
  and_58_nl <= xor_dcpl_2 AND ((fsm_output(4)) XOR (fsm_output(7))) AND ((fsm_output(2))
      XOR (fsm_output(5))) AND and_dcpl_41;
  vec_rsc_0_0_i_d_d_pff <= MUX_v_64_2_2(COMP_LOOP_1_modulo_dev_cmp_return_rsc_z,
      COMP_LOOP_1_acc_8_itm, and_58_nl);
  and_69_nl <= and_dcpl_54 AND and_dcpl_51;
  and_75_nl <= and_dcpl_54 AND and_dcpl_60;
  and_79_nl <= and_dcpl_64 AND and_dcpl_51;
  and_81_nl <= and_dcpl_64 AND and_dcpl_60;
  and_84_nl <= and_dcpl_69 AND and_dcpl_51;
  and_86_nl <= and_dcpl_69 AND and_dcpl_60;
  and_88_nl <= and_dcpl_39 AND and_dcpl_51;
  vec_rsc_0_0_i_radr_d_pff <= MUX1HOT_v_6_16_2((COMP_LOOP_1_acc_10_itm_10_1_1(9 DOWNTO
      4)), (COMP_LOOP_acc_psp_sva(6 DOWNTO 1)), (COMP_LOOP_acc_1_cse_2_sva(9 DOWNTO
      4)), (COMP_LOOP_acc_10_cse_10_1_2_sva(9 DOWNTO 4)), (COMP_LOOP_acc_11_psp_sva(8
      DOWNTO 3)), (COMP_LOOP_acc_10_cse_10_1_3_sva(9 DOWNTO 4)), (COMP_LOOP_acc_1_cse_4_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_4_sva(9 DOWNTO 4)), (COMP_LOOP_acc_13_psp_sva(7
      DOWNTO 2)), (COMP_LOOP_acc_10_cse_10_1_5_sva(9 DOWNTO 4)), (COMP_LOOP_acc_1_cse_6_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_6_sva(9 DOWNTO 4)), (COMP_LOOP_acc_14_psp_sva(8
      DOWNTO 3)), (COMP_LOOP_acc_10_cse_10_1_7_sva(9 DOWNTO 4)), (COMP_LOOP_acc_1_cse_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_sva(9 DOWNTO 4)), STD_LOGIC_VECTOR'(
      and_dcpl_47 & and_dcpl_50 & and_69_nl & and_dcpl_58 & and_75_nl & and_dcpl_63
      & and_79_nl & and_dcpl_66 & and_81_nl & and_dcpl_68 & and_84_nl & and_dcpl_71
      & and_86_nl & and_dcpl_73 & and_88_nl & and_dcpl_75));
  and_91_nl <= and_dcpl_54 AND and_dcpl_76;
  and_93_nl <= and_dcpl_54 AND and_dcpl_78;
  and_95_nl <= and_dcpl_54 AND and_dcpl_80;
  and_97_nl <= and_dcpl_54 AND and_dcpl_82;
  and_98_nl <= and_dcpl_64 AND and_dcpl_76;
  and_99_nl <= and_dcpl_64 AND and_dcpl_78;
  and_100_nl <= and_dcpl_64 AND and_dcpl_80;
  and_101_nl <= and_dcpl_64 AND and_dcpl_82;
  and_102_nl <= and_dcpl_69 AND and_dcpl_76;
  and_103_nl <= and_dcpl_69 AND and_dcpl_78;
  and_104_nl <= and_dcpl_69 AND and_dcpl_80;
  and_105_nl <= and_dcpl_69 AND and_dcpl_82;
  and_106_nl <= and_dcpl_39 AND and_dcpl_76;
  and_107_nl <= and_dcpl_39 AND and_dcpl_78;
  and_108_nl <= and_dcpl_39 AND and_dcpl_80;
  and_109_nl <= and_dcpl_39 AND and_dcpl_82;
  vec_rsc_0_0_i_wadr_d_pff <= MUX1HOT_v_6_16_2((COMP_LOOP_acc_10_cse_10_1_1_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_psp_sva(6 DOWNTO 1)), (COMP_LOOP_acc_10_cse_10_1_2_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_1_cse_2_sva(9 DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_3_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_11_psp_sva(8 DOWNTO 3)), (COMP_LOOP_acc_10_cse_10_1_4_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_1_cse_4_sva(9 DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_5_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_13_psp_sva(7 DOWNTO 2)), (COMP_LOOP_acc_10_cse_10_1_6_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_1_cse_6_sva(9 DOWNTO 4)), (COMP_LOOP_acc_10_cse_10_1_7_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_14_psp_sva(8 DOWNTO 3)), (COMP_LOOP_acc_10_cse_10_1_sva(9
      DOWNTO 4)), (COMP_LOOP_acc_1_cse_sva(9 DOWNTO 4)), STD_LOGIC_VECTOR'( and_91_nl
      & and_93_nl & and_95_nl & and_97_nl & and_98_nl & and_99_nl & and_100_nl &
      and_101_nl & and_102_nl & and_103_nl & and_104_nl & and_105_nl & and_106_nl
      & and_107_nl & and_108_nl & and_109_nl));
  nor_522_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6))));
  nor_523_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)));
  mux_300_nl <= MUX_s_1_2_2(nor_522_nl, nor_523_nl, fsm_output(3));
  and_329_nl <= (fsm_output(4)) AND mux_300_nl;
  or_217_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6));
  mux_298_nl <= MUX_s_1_2_2(or_tmp_170, or_217_nl, fsm_output(3));
  or_216_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")) OR (fsm_output(6));
  mux_299_nl <= MUX_s_1_2_2(mux_298_nl, or_216_nl, or_215_cse);
  nor_524_nl <= NOT((fsm_output(4)) OR mux_299_nl);
  mux_301_nl <= MUX_s_1_2_2(and_329_nl, nor_524_nl, fsm_output(7));
  nor_525_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_278);
  mux_302_nl <= MUX_s_1_2_2(mux_301_nl, nor_525_nl, fsm_output(0));
  nand_231_nl <= NOT((fsm_output(2)) AND mux_302_nl);
  nor_527_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6))));
  nor_528_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)));
  mux_291_nl <= MUX_s_1_2_2(nor_527_nl, nor_528_nl, fsm_output(3));
  nand_12_nl <= NOT((fsm_output(4)) AND mux_291_nl);
  or_200_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6)));
  or_198_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6));
  mux_290_nl <= MUX_s_1_2_2(or_200_nl, or_198_nl, fsm_output(3));
  or_201_nl <= (fsm_output(4)) OR mux_290_nl;
  mux_292_nl <= MUX_s_1_2_2(nand_12_nl, or_201_nl, fsm_output(7));
  nor_529_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6))));
  nor_530_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)));
  mux_288_nl <= MUX_s_1_2_2(nor_529_nl, nor_530_nl, fsm_output(3));
  nand_11_nl <= NOT((fsm_output(4)) AND mux_288_nl);
  or_193_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6)));
  or_191_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6));
  mux_287_nl <= MUX_s_1_2_2(or_193_nl, or_191_nl, fsm_output(3));
  or_194_nl <= (fsm_output(4)) OR mux_287_nl;
  mux_289_nl <= MUX_s_1_2_2(nand_11_nl, or_194_nl, fsm_output(7));
  mux_293_nl <= MUX_s_1_2_2(mux_292_nl, mux_289_nl, fsm_output(0));
  or_1256_nl <= (fsm_output(2)) OR mux_293_nl;
  mux_303_nl <= MUX_s_1_2_2(nand_231_nl, or_1256_nl, fsm_output(5));
  vec_rsc_0_0_i_we_d_pff <= NOT(mux_303_nl OR (fsm_output(1)));
  or_249_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_248_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR (VEC_LOOP_j_10_0_sva_9_0(0))
      OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1)) OR (fsm_output(6)) OR (fsm_output(4));
  mux_316_nl <= MUX_s_1_2_2(or_249_nl, or_248_nl, fsm_output(0));
  nor_515_nl <= NOT((fsm_output(7)) OR mux_316_nl);
  or_246_nl <= (VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68;
  or_244_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_313_nl <= MUX_s_1_2_2(or_246_nl, or_244_nl, fsm_output(3));
  nor_516_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_313_nl);
  nor_517_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_68);
  nor_518_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_312_nl <= MUX_s_1_2_2(nor_517_nl, nor_518_nl, fsm_output(3));
  mux_314_nl <= MUX_s_1_2_2(nor_516_nl, mux_312_nl, fsm_output(0));
  nor_519_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_520_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_311_nl <= MUX_s_1_2_2(nor_519_nl, nor_520_nl, fsm_output(0));
  mux_315_nl <= MUX_s_1_2_2(mux_314_nl, mux_311_nl, fsm_output(7));
  mux_317_nl <= MUX_s_1_2_2(nor_515_nl, mux_315_nl, fsm_output(5));
  or_235_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_233_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_308_nl <= MUX_s_1_2_2(or_235_nl, or_233_nl, fsm_output(3));
  or_231_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR not_tmp_68;
  or_229_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_307_nl <= MUX_s_1_2_2(or_231_nl, or_229_nl, fsm_output(3));
  mux_309_nl <= MUX_s_1_2_2(mux_308_nl, mux_307_nl, fsm_output(0));
  or_227_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_226_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_305_nl <= MUX_s_1_2_2(or_227_nl, or_226_nl, fsm_output(3));
  or_225_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_224_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_304_nl <= MUX_s_1_2_2(or_225_nl, or_224_nl, fsm_output(3));
  mux_306_nl <= MUX_s_1_2_2(mux_305_nl, mux_304_nl, fsm_output(0));
  mux_310_nl <= MUX_s_1_2_2(mux_309_nl, mux_306_nl, fsm_output(7));
  nor_521_nl <= NOT((fsm_output(5)) OR mux_310_nl);
  mux_318_nl <= MUX_s_1_2_2(mux_317_nl, nor_521_nl, fsm_output(2));
  vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_318_nl AND (fsm_output(1));
  nor_507_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT (fsm_output(6))));
  nor_508_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)));
  mux_328_nl <= MUX_s_1_2_2(nor_507_nl, nor_508_nl, fsm_output(3));
  and_326_nl <= (fsm_output(4)) AND mux_328_nl;
  or_268_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6));
  mux_326_nl <= MUX_s_1_2_2(or_tmp_220, or_268_nl, fsm_output(3));
  or_267_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0001")) OR (fsm_output(6));
  mux_327_nl <= MUX_s_1_2_2(mux_326_nl, or_267_nl, or_215_cse);
  nor_509_nl <= NOT((fsm_output(4)) OR mux_327_nl);
  mux_329_nl <= MUX_s_1_2_2(and_326_nl, nor_509_nl, fsm_output(7));
  and_327_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_278);
  mux_330_nl <= MUX_s_1_2_2(mux_329_nl, and_327_nl, fsm_output(0));
  nand_230_nl <= NOT((fsm_output(2)) AND mux_330_nl);
  nor_511_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT (fsm_output(6))));
  nor_512_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)));
  mux_323_nl <= MUX_s_1_2_2(nor_511_nl, nor_512_nl, fsm_output(3));
  nand_17_nl <= NOT((fsm_output(4)) AND mux_323_nl);
  or_260_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_146;
  or_258_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6));
  mux_322_nl <= MUX_s_1_2_2(or_260_nl, or_258_nl, fsm_output(3));
  or_261_nl <= (fsm_output(4)) OR mux_322_nl;
  mux_324_nl <= MUX_s_1_2_2(nand_17_nl, or_261_nl, fsm_output(7));
  nor_513_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_144);
  nor_514_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)));
  mux_320_nl <= MUX_s_1_2_2(nor_513_nl, nor_514_nl, fsm_output(3));
  nand_16_nl <= NOT((fsm_output(4)) AND mux_320_nl);
  or_253_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_143;
  or_251_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6));
  mux_319_nl <= MUX_s_1_2_2(or_253_nl, or_251_nl, fsm_output(3));
  or_254_nl <= (fsm_output(4)) OR mux_319_nl;
  mux_321_nl <= MUX_s_1_2_2(nand_16_nl, or_254_nl, fsm_output(7));
  mux_325_nl <= MUX_s_1_2_2(mux_324_nl, mux_321_nl, fsm_output(0));
  or_1255_nl <= (fsm_output(2)) OR mux_325_nl;
  mux_331_nl <= MUX_s_1_2_2(nand_230_nl, or_1255_nl, fsm_output(5));
  vec_rsc_0_1_i_we_d_pff <= NOT(mux_331_nl OR (fsm_output(1)));
  or_298_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_297_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR (NOT
      (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_344_nl <= MUX_s_1_2_2(or_298_nl, or_297_nl, fsm_output(0));
  nor_499_nl <= NOT((fsm_output(7)) OR mux_344_nl);
  nor_500_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68);
  nor_501_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_341_nl <= MUX_s_1_2_2(nor_500_nl, nor_501_nl, fsm_output(3));
  and_324_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_341_nl;
  nor_502_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))
      OR nand_199_cse);
  nor_503_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_340_nl <= MUX_s_1_2_2(nor_502_nl, nor_503_nl, fsm_output(3));
  mux_342_nl <= MUX_s_1_2_2(and_324_nl, mux_340_nl, fsm_output(0));
  nor_504_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_505_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_339_nl <= MUX_s_1_2_2(nor_504_nl, nor_505_nl, fsm_output(0));
  mux_343_nl <= MUX_s_1_2_2(mux_342_nl, mux_339_nl, fsm_output(7));
  mux_345_nl <= MUX_s_1_2_2(nor_499_nl, mux_343_nl, fsm_output(5));
  or_285_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_283_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0001")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_336_nl <= MUX_s_1_2_2(or_285_nl, or_283_nl, fsm_output(3));
  or_281_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR not_tmp_68;
  or_279_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_335_nl <= MUX_s_1_2_2(or_281_nl, or_279_nl, fsm_output(3));
  mux_337_nl <= MUX_s_1_2_2(mux_336_nl, mux_335_nl, fsm_output(0));
  or_277_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0001")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_276_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0001")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_333_nl <= MUX_s_1_2_2(or_277_nl, or_276_nl, fsm_output(3));
  or_275_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_274_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_332_nl <= MUX_s_1_2_2(or_275_nl, or_274_nl, fsm_output(3));
  mux_334_nl <= MUX_s_1_2_2(mux_333_nl, mux_332_nl, fsm_output(0));
  mux_338_nl <= MUX_s_1_2_2(mux_337_nl, mux_334_nl, fsm_output(7));
  nor_506_nl <= NOT((fsm_output(5)) OR mux_338_nl);
  mux_346_nl <= MUX_s_1_2_2(mux_345_nl, nor_506_nl, fsm_output(2));
  vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_346_nl AND (fsm_output(1));
  nor_488_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6))));
  nor_489_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)));
  mux_360_nl <= MUX_s_1_2_2(nor_488_nl, nor_489_nl, fsm_output(3));
  and_323_nl <= (fsm_output(4)) AND mux_360_nl;
  or_325_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6));
  mux_358_nl <= MUX_s_1_2_2(or_tmp_278, or_325_nl, fsm_output(3));
  or_324_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0010")) OR (fsm_output(6));
  mux_359_nl <= MUX_s_1_2_2(mux_358_nl, or_324_nl, or_215_cse);
  nor_490_nl <= NOT((fsm_output(4)) OR mux_359_nl);
  mux_361_nl <= MUX_s_1_2_2(and_323_nl, nor_490_nl, fsm_output(7));
  nor_491_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_338);
  mux_362_nl <= MUX_s_1_2_2(mux_361_nl, nor_491_nl, fsm_output(0));
  nand_229_nl <= NOT((fsm_output(2)) AND mux_362_nl);
  nor_493_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6))));
  nor_494_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)));
  mux_351_nl <= MUX_s_1_2_2(nor_493_nl, nor_494_nl, fsm_output(3));
  nand_23_nl <= NOT((fsm_output(4)) AND mux_351_nl);
  or_309_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6)));
  or_307_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6));
  mux_350_nl <= MUX_s_1_2_2(or_309_nl, or_307_nl, fsm_output(3));
  or_310_nl <= (fsm_output(4)) OR mux_350_nl;
  mux_352_nl <= MUX_s_1_2_2(nand_23_nl, or_310_nl, fsm_output(7));
  nor_495_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6))));
  nor_496_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)));
  mux_348_nl <= MUX_s_1_2_2(nor_495_nl, nor_496_nl, fsm_output(3));
  nand_22_nl <= NOT((fsm_output(4)) AND mux_348_nl);
  or_302_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6)));
  or_300_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6));
  mux_347_nl <= MUX_s_1_2_2(or_302_nl, or_300_nl, fsm_output(3));
  or_303_nl <= (fsm_output(4)) OR mux_347_nl;
  mux_349_nl <= MUX_s_1_2_2(nand_22_nl, or_303_nl, fsm_output(7));
  mux_353_nl <= MUX_s_1_2_2(mux_352_nl, mux_349_nl, fsm_output(0));
  or_1254_nl <= (fsm_output(2)) OR mux_353_nl;
  mux_363_nl <= MUX_s_1_2_2(nand_229_nl, or_1254_nl, fsm_output(5));
  vec_rsc_0_2_i_we_d_pff <= NOT(mux_363_nl OR (fsm_output(1)));
  or_357_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_356_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR (VEC_LOOP_j_10_0_sva_9_0(0))
      OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR (fsm_output(6))
      OR (fsm_output(4));
  mux_376_nl <= MUX_s_1_2_2(or_357_nl, or_356_nl, fsm_output(0));
  nor_481_nl <= NOT((fsm_output(7)) OR mux_376_nl);
  or_354_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68;
  or_352_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_373_nl <= MUX_s_1_2_2(or_354_nl, or_352_nl, fsm_output(3));
  nor_482_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_373_nl);
  nor_483_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR not_tmp_68);
  nor_484_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_372_nl <= MUX_s_1_2_2(nor_483_nl, nor_484_nl, fsm_output(3));
  mux_374_nl <= MUX_s_1_2_2(nor_482_nl, mux_372_nl, fsm_output(0));
  nor_485_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_486_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_371_nl <= MUX_s_1_2_2(nor_485_nl, nor_486_nl, fsm_output(0));
  mux_375_nl <= MUX_s_1_2_2(mux_374_nl, mux_371_nl, fsm_output(7));
  mux_377_nl <= MUX_s_1_2_2(nor_481_nl, mux_375_nl, fsm_output(5));
  or_343_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_341_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0010")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_368_nl <= MUX_s_1_2_2(or_343_nl, or_341_nl, fsm_output(3));
  or_339_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR not_tmp_68;
  or_337_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_367_nl <= MUX_s_1_2_2(or_339_nl, or_337_nl, fsm_output(3));
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, mux_367_nl, fsm_output(0));
  or_335_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0010")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_334_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0010")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_365_nl <= MUX_s_1_2_2(or_335_nl, or_334_nl, fsm_output(3));
  or_333_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_332_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_364_nl <= MUX_s_1_2_2(or_333_nl, or_332_nl, fsm_output(3));
  mux_366_nl <= MUX_s_1_2_2(mux_365_nl, mux_364_nl, fsm_output(0));
  mux_370_nl <= MUX_s_1_2_2(mux_369_nl, mux_366_nl, fsm_output(7));
  nor_487_nl <= NOT((fsm_output(5)) OR mux_370_nl);
  mux_378_nl <= MUX_s_1_2_2(mux_377_nl, nor_487_nl, fsm_output(2));
  vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_378_nl AND (fsm_output(1));
  nor_473_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (NOT (fsm_output(6))));
  nor_474_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)));
  mux_388_nl <= MUX_s_1_2_2(nor_473_nl, nor_474_nl, fsm_output(3));
  and_320_nl <= (fsm_output(4)) AND mux_388_nl;
  or_376_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6));
  mux_386_nl <= MUX_s_1_2_2(not_tmp_173, or_376_nl, fsm_output(3));
  or_375_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0011")) OR (fsm_output(6));
  mux_387_nl <= MUX_s_1_2_2(mux_386_nl, or_375_nl, or_215_cse);
  nor_475_nl <= NOT((fsm_output(4)) OR mux_387_nl);
  mux_389_nl <= MUX_s_1_2_2(and_320_nl, nor_475_nl, fsm_output(7));
  and_321_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_338);
  mux_390_nl <= MUX_s_1_2_2(mux_389_nl, and_321_nl, fsm_output(0));
  nand_228_nl <= NOT((fsm_output(2)) AND mux_390_nl);
  nor_477_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (NOT (fsm_output(6))));
  nor_478_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)));
  mux_383_nl <= MUX_s_1_2_2(nor_477_nl, nor_478_nl, fsm_output(3));
  nand_28_nl <= NOT((fsm_output(4)) AND mux_383_nl);
  or_368_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_170;
  or_366_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6));
  mux_382_nl <= MUX_s_1_2_2(or_368_nl, or_366_nl, fsm_output(3));
  or_369_nl <= (fsm_output(4)) OR mux_382_nl;
  mux_384_nl <= MUX_s_1_2_2(nand_28_nl, or_369_nl, fsm_output(7));
  nor_479_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001"))
      OR not_tmp_144);
  nor_480_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)));
  mux_380_nl <= MUX_s_1_2_2(nor_479_nl, nor_480_nl, fsm_output(3));
  nand_27_nl <= NOT((fsm_output(4)) AND mux_380_nl);
  or_361_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_168;
  or_359_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6));
  mux_379_nl <= MUX_s_1_2_2(or_361_nl, or_359_nl, fsm_output(3));
  or_362_nl <= (fsm_output(4)) OR mux_379_nl;
  mux_381_nl <= MUX_s_1_2_2(nand_27_nl, or_362_nl, fsm_output(7));
  mux_385_nl <= MUX_s_1_2_2(mux_384_nl, mux_381_nl, fsm_output(0));
  or_1253_nl <= (fsm_output(2)) OR mux_385_nl;
  mux_391_nl <= MUX_s_1_2_2(nand_228_nl, or_1253_nl, fsm_output(5));
  vec_rsc_0_3_i_we_d_pff <= NOT(mux_391_nl OR (fsm_output(1)));
  or_405_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_404_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (COMP_LOOP_acc_psp_sva(0)) OR (NOT
      (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_404_nl <= MUX_s_1_2_2(or_405_nl, or_404_nl, fsm_output(0));
  nor_465_nl <= NOT((fsm_output(7)) OR mux_404_nl);
  nor_466_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(1))) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68);
  nor_467_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_401_nl <= MUX_s_1_2_2(nor_466_nl, nor_467_nl, fsm_output(3));
  and_318_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_401_nl;
  nor_468_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001"))
      OR nand_199_cse);
  nor_469_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_400_nl <= MUX_s_1_2_2(nor_468_nl, nor_469_nl, fsm_output(3));
  mux_402_nl <= MUX_s_1_2_2(and_318_nl, mux_400_nl, fsm_output(0));
  nor_470_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_471_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_399_nl <= MUX_s_1_2_2(nor_470_nl, nor_471_nl, fsm_output(0));
  mux_403_nl <= MUX_s_1_2_2(mux_402_nl, mux_399_nl, fsm_output(7));
  mux_405_nl <= MUX_s_1_2_2(nor_465_nl, mux_403_nl, fsm_output(5));
  or_392_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_390_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0011")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_396_nl <= MUX_s_1_2_2(or_392_nl, or_390_nl, fsm_output(3));
  or_388_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR not_tmp_68;
  or_386_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_395_nl <= MUX_s_1_2_2(or_388_nl, or_386_nl, fsm_output(3));
  mux_397_nl <= MUX_s_1_2_2(mux_396_nl, mux_395_nl, fsm_output(0));
  or_384_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0011")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_383_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0011")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_393_nl <= MUX_s_1_2_2(or_384_nl, or_383_nl, fsm_output(3));
  or_382_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_381_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_392_nl <= MUX_s_1_2_2(or_382_nl, or_381_nl, fsm_output(3));
  mux_394_nl <= MUX_s_1_2_2(mux_393_nl, mux_392_nl, fsm_output(0));
  mux_398_nl <= MUX_s_1_2_2(mux_397_nl, mux_394_nl, fsm_output(7));
  nor_472_nl <= NOT((fsm_output(5)) OR mux_398_nl);
  mux_406_nl <= MUX_s_1_2_2(mux_405_nl, nor_472_nl, fsm_output(2));
  vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_406_nl AND (fsm_output(1));
  nor_454_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6))));
  nor_455_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)));
  mux_420_nl <= MUX_s_1_2_2(nor_454_nl, nor_455_nl, fsm_output(3));
  and_317_nl <= (fsm_output(4)) AND mux_420_nl;
  or_430_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR (fsm_output(6));
  or_429_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6));
  mux_418_nl <= MUX_s_1_2_2(or_tmp_170, or_429_nl, fsm_output(3));
  mux_419_nl <= MUX_s_1_2_2(or_430_nl, mux_418_nl, nor_101_cse);
  nor_456_nl <= NOT((fsm_output(4)) OR mux_419_nl);
  mux_421_nl <= MUX_s_1_2_2(and_317_nl, nor_456_nl, fsm_output(7));
  nor_457_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_398);
  mux_422_nl <= MUX_s_1_2_2(mux_421_nl, nor_457_nl, fsm_output(0));
  nand_227_nl <= NOT((fsm_output(2)) AND mux_422_nl);
  nor_459_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6))));
  nor_460_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)));
  mux_411_nl <= MUX_s_1_2_2(nor_459_nl, nor_460_nl, fsm_output(3));
  nand_34_nl <= NOT((fsm_output(4)) AND mux_411_nl);
  or_416_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6)));
  or_414_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6));
  mux_410_nl <= MUX_s_1_2_2(or_416_nl, or_414_nl, fsm_output(3));
  or_417_nl <= (fsm_output(4)) OR mux_410_nl;
  mux_412_nl <= MUX_s_1_2_2(nand_34_nl, or_417_nl, fsm_output(7));
  nor_461_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6))));
  nor_462_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)));
  mux_408_nl <= MUX_s_1_2_2(nor_461_nl, nor_462_nl, fsm_output(3));
  nand_33_nl <= NOT((fsm_output(4)) AND mux_408_nl);
  or_409_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6)));
  or_407_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6));
  mux_407_nl <= MUX_s_1_2_2(or_409_nl, or_407_nl, fsm_output(3));
  or_410_nl <= (fsm_output(4)) OR mux_407_nl;
  mux_409_nl <= MUX_s_1_2_2(nand_33_nl, or_410_nl, fsm_output(7));
  mux_413_nl <= MUX_s_1_2_2(mux_412_nl, mux_409_nl, fsm_output(0));
  or_1252_nl <= (fsm_output(2)) OR mux_413_nl;
  mux_423_nl <= MUX_s_1_2_2(nand_227_nl, or_1252_nl, fsm_output(5));
  vec_rsc_0_4_i_we_d_pff <= NOT(mux_423_nl OR (fsm_output(1)));
  or_460_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_459_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_436_nl <= MUX_s_1_2_2(or_460_nl, or_459_nl, fsm_output(0));
  nor_447_nl <= NOT((fsm_output(7)) OR mux_436_nl);
  or_457_nl <= (VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68;
  or_455_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_433_nl <= MUX_s_1_2_2(or_457_nl, or_455_nl, fsm_output(3));
  nor_448_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_433_nl);
  nor_449_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR not_tmp_68);
  nor_450_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_432_nl <= MUX_s_1_2_2(nor_449_nl, nor_450_nl, fsm_output(3));
  mux_434_nl <= MUX_s_1_2_2(nor_448_nl, mux_432_nl, fsm_output(0));
  nor_451_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_452_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_431_nl <= MUX_s_1_2_2(nor_451_nl, nor_452_nl, fsm_output(0));
  mux_435_nl <= MUX_s_1_2_2(mux_434_nl, mux_431_nl, fsm_output(7));
  mux_437_nl <= MUX_s_1_2_2(nor_447_nl, mux_435_nl, fsm_output(5));
  or_446_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_444_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_428_nl <= MUX_s_1_2_2(or_446_nl, or_444_nl, fsm_output(3));
  or_442_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR not_tmp_68;
  or_440_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_427_nl <= MUX_s_1_2_2(or_442_nl, or_440_nl, fsm_output(3));
  mux_429_nl <= MUX_s_1_2_2(mux_428_nl, mux_427_nl, fsm_output(0));
  or_438_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_437_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_425_nl <= MUX_s_1_2_2(or_438_nl, or_437_nl, fsm_output(3));
  or_436_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_435_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_424_nl <= MUX_s_1_2_2(or_436_nl, or_435_nl, fsm_output(3));
  mux_426_nl <= MUX_s_1_2_2(mux_425_nl, mux_424_nl, fsm_output(0));
  mux_430_nl <= MUX_s_1_2_2(mux_429_nl, mux_426_nl, fsm_output(7));
  nor_453_nl <= NOT((fsm_output(5)) OR mux_430_nl);
  mux_438_nl <= MUX_s_1_2_2(mux_437_nl, nor_453_nl, fsm_output(2));
  vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_438_nl AND (fsm_output(1));
  nor_439_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (NOT (fsm_output(6))));
  nor_440_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)));
  mux_448_nl <= MUX_s_1_2_2(nor_439_nl, nor_440_nl, fsm_output(3));
  and_314_nl <= (fsm_output(4)) AND mux_448_nl;
  or_478_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0101")) OR (fsm_output(6));
  or_477_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6));
  mux_446_nl <= MUX_s_1_2_2(or_tmp_220, or_477_nl, fsm_output(3));
  mux_447_nl <= MUX_s_1_2_2(or_478_nl, mux_446_nl, nor_101_cse);
  nor_441_nl <= NOT((fsm_output(4)) OR mux_447_nl);
  mux_449_nl <= MUX_s_1_2_2(and_314_nl, nor_441_nl, fsm_output(7));
  and_315_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_398);
  mux_450_nl <= MUX_s_1_2_2(mux_449_nl, and_315_nl, fsm_output(0));
  nand_226_nl <= NOT((fsm_output(2)) AND mux_450_nl);
  nor_443_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (NOT (fsm_output(6))));
  nor_444_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)));
  mux_443_nl <= MUX_s_1_2_2(nor_443_nl, nor_444_nl, fsm_output(3));
  nand_39_nl <= NOT((fsm_output(4)) AND mux_443_nl);
  or_471_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_146;
  or_469_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6));
  mux_442_nl <= MUX_s_1_2_2(or_471_nl, or_469_nl, fsm_output(3));
  or_472_nl <= (fsm_output(4)) OR mux_442_nl;
  mux_444_nl <= MUX_s_1_2_2(nand_39_nl, or_472_nl, fsm_output(7));
  nor_445_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_144);
  nor_446_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)));
  mux_440_nl <= MUX_s_1_2_2(nor_445_nl, nor_446_nl, fsm_output(3));
  nand_38_nl <= NOT((fsm_output(4)) AND mux_440_nl);
  or_464_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_143;
  or_462_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6));
  mux_439_nl <= MUX_s_1_2_2(or_464_nl, or_462_nl, fsm_output(3));
  or_465_nl <= (fsm_output(4)) OR mux_439_nl;
  mux_441_nl <= MUX_s_1_2_2(nand_38_nl, or_465_nl, fsm_output(7));
  mux_445_nl <= MUX_s_1_2_2(mux_444_nl, mux_441_nl, fsm_output(0));
  or_1251_nl <= (fsm_output(2)) OR mux_445_nl;
  mux_451_nl <= MUX_s_1_2_2(nand_226_nl, or_1251_nl, fsm_output(5));
  vec_rsc_0_5_i_we_d_pff <= NOT(mux_451_nl OR (fsm_output(1)));
  or_507_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_506_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_464_nl <= MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output(0));
  nor_431_nl <= NOT((fsm_output(7)) OR mux_464_nl);
  nor_432_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68);
  nor_433_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_461_nl <= MUX_s_1_2_2(nor_432_nl, nor_433_nl, fsm_output(3));
  and_312_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_461_nl;
  nor_434_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"))
      OR nand_199_cse);
  nor_435_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_460_nl <= MUX_s_1_2_2(nor_434_nl, nor_435_nl, fsm_output(3));
  mux_462_nl <= MUX_s_1_2_2(and_312_nl, mux_460_nl, fsm_output(0));
  nor_436_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_437_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_459_nl <= MUX_s_1_2_2(nor_436_nl, nor_437_nl, fsm_output(0));
  mux_463_nl <= MUX_s_1_2_2(mux_462_nl, mux_459_nl, fsm_output(7));
  mux_465_nl <= MUX_s_1_2_2(nor_431_nl, mux_463_nl, fsm_output(5));
  or_494_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_492_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0101")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_456_nl <= MUX_s_1_2_2(or_494_nl, or_492_nl, fsm_output(3));
  or_490_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR not_tmp_68;
  or_488_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_455_nl <= MUX_s_1_2_2(or_490_nl, or_488_nl, fsm_output(3));
  mux_457_nl <= MUX_s_1_2_2(mux_456_nl, mux_455_nl, fsm_output(0));
  or_486_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0101")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_485_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0101")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_453_nl <= MUX_s_1_2_2(or_486_nl, or_485_nl, fsm_output(3));
  or_484_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_483_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_452_nl <= MUX_s_1_2_2(or_484_nl, or_483_nl, fsm_output(3));
  mux_454_nl <= MUX_s_1_2_2(mux_453_nl, mux_452_nl, fsm_output(0));
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, mux_454_nl, fsm_output(7));
  nor_438_nl <= NOT((fsm_output(5)) OR mux_458_nl);
  mux_466_nl <= MUX_s_1_2_2(mux_465_nl, nor_438_nl, fsm_output(2));
  vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_466_nl AND (fsm_output(1));
  nor_420_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6))));
  nor_421_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)));
  mux_480_nl <= MUX_s_1_2_2(nor_420_nl, nor_421_nl, fsm_output(3));
  and_311_nl <= (fsm_output(4)) AND mux_480_nl;
  or_532_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0110")) OR (fsm_output(6));
  or_531_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6));
  mux_478_nl <= MUX_s_1_2_2(or_tmp_278, or_531_nl, fsm_output(3));
  mux_479_nl <= MUX_s_1_2_2(or_532_nl, mux_478_nl, nor_101_cse);
  nor_422_nl <= NOT((fsm_output(4)) OR mux_479_nl);
  mux_481_nl <= MUX_s_1_2_2(and_311_nl, nor_422_nl, fsm_output(7));
  nor_423_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_458);
  mux_482_nl <= MUX_s_1_2_2(mux_481_nl, nor_423_nl, fsm_output(0));
  nand_225_nl <= NOT((fsm_output(2)) AND mux_482_nl);
  nor_425_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6))));
  nor_426_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)));
  mux_471_nl <= MUX_s_1_2_2(nor_425_nl, nor_426_nl, fsm_output(3));
  nand_45_nl <= NOT((fsm_output(4)) AND mux_471_nl);
  or_518_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6)));
  or_516_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6));
  mux_470_nl <= MUX_s_1_2_2(or_518_nl, or_516_nl, fsm_output(3));
  or_519_nl <= (fsm_output(4)) OR mux_470_nl;
  mux_472_nl <= MUX_s_1_2_2(nand_45_nl, or_519_nl, fsm_output(7));
  nor_427_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6))));
  nor_428_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)));
  mux_468_nl <= MUX_s_1_2_2(nor_427_nl, nor_428_nl, fsm_output(3));
  nand_44_nl <= NOT((fsm_output(4)) AND mux_468_nl);
  or_511_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6)));
  or_509_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6));
  mux_467_nl <= MUX_s_1_2_2(or_511_nl, or_509_nl, fsm_output(3));
  or_512_nl <= (fsm_output(4)) OR mux_467_nl;
  mux_469_nl <= MUX_s_1_2_2(nand_44_nl, or_512_nl, fsm_output(7));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output(0));
  or_1250_nl <= (fsm_output(2)) OR mux_473_nl;
  mux_483_nl <= MUX_s_1_2_2(nand_225_nl, or_1250_nl, fsm_output(5));
  vec_rsc_0_6_i_we_d_pff <= NOT(mux_483_nl OR (fsm_output(1)));
  or_562_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_561_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_496_nl <= MUX_s_1_2_2(or_562_nl, or_561_nl, fsm_output(0));
  nor_413_nl <= NOT((fsm_output(7)) OR mux_496_nl);
  or_559_nl <= nand_186_cse OR not_tmp_68;
  or_557_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_493_nl <= MUX_s_1_2_2(or_559_nl, or_557_nl, fsm_output(3));
  nor_414_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_493_nl);
  nor_415_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR not_tmp_68);
  nor_416_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_492_nl <= MUX_s_1_2_2(nor_415_nl, nor_416_nl, fsm_output(3));
  mux_494_nl <= MUX_s_1_2_2(nor_414_nl, mux_492_nl, fsm_output(0));
  nor_417_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("011")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_418_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_491_nl <= MUX_s_1_2_2(nor_417_nl, nor_418_nl, fsm_output(0));
  mux_495_nl <= MUX_s_1_2_2(mux_494_nl, mux_491_nl, fsm_output(7));
  mux_497_nl <= MUX_s_1_2_2(nor_413_nl, mux_495_nl, fsm_output(5));
  or_548_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_546_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0110")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_488_nl <= MUX_s_1_2_2(or_548_nl, or_546_nl, fsm_output(3));
  or_544_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR not_tmp_68;
  or_542_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_487_nl <= MUX_s_1_2_2(or_544_nl, or_542_nl, fsm_output(3));
  mux_489_nl <= MUX_s_1_2_2(mux_488_nl, mux_487_nl, fsm_output(0));
  or_540_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0110")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_539_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0110")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_485_nl <= MUX_s_1_2_2(or_540_nl, or_539_nl, fsm_output(3));
  or_538_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_537_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_484_nl <= MUX_s_1_2_2(or_538_nl, or_537_nl, fsm_output(3));
  mux_486_nl <= MUX_s_1_2_2(mux_485_nl, mux_484_nl, fsm_output(0));
  mux_490_nl <= MUX_s_1_2_2(mux_489_nl, mux_486_nl, fsm_output(7));
  nor_419_nl <= NOT((fsm_output(5)) OR mux_490_nl);
  mux_498_nl <= MUX_s_1_2_2(mux_497_nl, nor_419_nl, fsm_output(2));
  vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_498_nl AND (fsm_output(1));
  and_402_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"))
      AND (fsm_output(6));
  nor_406_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)));
  mux_508_nl <= MUX_s_1_2_2(and_402_nl, nor_406_nl, fsm_output(3));
  and_308_nl <= (fsm_output(4)) AND mux_508_nl;
  or_578_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0111")) OR (fsm_output(6));
  or_577_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6));
  mux_506_nl <= MUX_s_1_2_2(not_tmp_173, or_577_nl, fsm_output(3));
  mux_507_nl <= MUX_s_1_2_2(or_578_nl, mux_506_nl, nor_101_cse);
  nor_407_nl <= NOT((fsm_output(4)) OR mux_507_nl);
  mux_509_nl <= MUX_s_1_2_2(and_308_nl, nor_407_nl, fsm_output(7));
  and_309_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_458);
  mux_510_nl <= MUX_s_1_2_2(mux_509_nl, and_309_nl, fsm_output(0));
  nand_224_nl <= NOT((fsm_output(2)) AND mux_510_nl);
  and_405_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"))
      AND (fsm_output(6));
  nor_410_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)));
  mux_503_nl <= MUX_s_1_2_2(and_405_nl, nor_410_nl, fsm_output(3));
  nand_50_nl <= NOT((fsm_output(4)) AND mux_503_nl);
  or_571_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(3)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(2
      DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(6))));
  or_570_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6));
  mux_502_nl <= MUX_s_1_2_2(or_571_nl, or_570_nl, fsm_output(3));
  or_572_nl <= (fsm_output(4)) OR mux_502_nl;
  mux_504_nl <= MUX_s_1_2_2(nand_50_nl, or_572_nl, fsm_output(7));
  nor_411_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("011"))
      OR not_tmp_144);
  nor_412_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)));
  mux_500_nl <= MUX_s_1_2_2(nor_411_nl, nor_412_nl, fsm_output(3));
  nand_49_nl <= NOT((fsm_output(4)) AND mux_500_nl);
  or_565_nl <= (COMP_LOOP_acc_1_cse_sva(3)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(2
      DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(6))));
  or_564_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6));
  mux_499_nl <= MUX_s_1_2_2(or_565_nl, or_564_nl, fsm_output(3));
  or_566_nl <= (fsm_output(4)) OR mux_499_nl;
  mux_501_nl <= MUX_s_1_2_2(nand_49_nl, or_566_nl, fsm_output(7));
  mux_505_nl <= MUX_s_1_2_2(mux_504_nl, mux_501_nl, fsm_output(0));
  or_1249_nl <= (fsm_output(2)) OR mux_505_nl;
  mux_511_nl <= MUX_s_1_2_2(nand_224_nl, or_1249_nl, fsm_output(5));
  vec_rsc_0_7_i_we_d_pff <= NOT(mux_511_nl OR (fsm_output(1)));
  or_607_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_606_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (COMP_LOOP_acc_psp_sva(0)) OR
      (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_524_nl <= MUX_s_1_2_2(or_607_nl, or_606_nl, fsm_output(0));
  nor_397_nl <= NOT((fsm_output(7)) OR mux_524_nl);
  nor_398_nl <= NOT(nand_186_cse OR not_tmp_68);
  nor_399_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_521_nl <= MUX_s_1_2_2(nor_398_nl, nor_399_nl, fsm_output(3));
  and_306_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_521_nl;
  nor_400_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("011"))
      OR nand_199_cse);
  nor_401_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_520_nl <= MUX_s_1_2_2(nor_400_nl, nor_401_nl, fsm_output(3));
  mux_522_nl <= MUX_s_1_2_2(and_306_nl, mux_520_nl, fsm_output(0));
  nor_402_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_403_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_519_nl <= MUX_s_1_2_2(nor_402_nl, nor_403_nl, fsm_output(0));
  mux_523_nl <= MUX_s_1_2_2(mux_522_nl, mux_519_nl, fsm_output(7));
  mux_525_nl <= MUX_s_1_2_2(nor_397_nl, mux_523_nl, fsm_output(5));
  or_594_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"))
      AND COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) OR not_tmp_68;
  nand_236_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("0111")) AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_516_nl <= MUX_s_1_2_2(or_594_nl, nand_236_nl, fsm_output(3));
  or_590_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"))))
      OR not_tmp_68;
  or_588_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_515_nl <= MUX_s_1_2_2(or_590_nl, or_588_nl, fsm_output(3));
  mux_517_nl <= MUX_s_1_2_2(mux_516_nl, mux_515_nl, fsm_output(0));
  nand_180_nl <= NOT(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("0111")) AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  or_585_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0111")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_513_nl <= MUX_s_1_2_2(nand_180_nl, or_585_nl, fsm_output(3));
  or_584_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_583_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_512_nl <= MUX_s_1_2_2(or_584_nl, or_583_nl, fsm_output(3));
  mux_514_nl <= MUX_s_1_2_2(mux_513_nl, mux_512_nl, fsm_output(0));
  mux_518_nl <= MUX_s_1_2_2(mux_517_nl, mux_514_nl, fsm_output(7));
  nor_404_nl <= NOT((fsm_output(5)) OR mux_518_nl);
  mux_526_nl <= MUX_s_1_2_2(mux_525_nl, nor_404_nl, fsm_output(2));
  vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_526_nl AND (fsm_output(1));
  nor_386_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_229);
  nor_387_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)));
  mux_540_nl <= MUX_s_1_2_2(nor_386_nl, nor_387_nl, fsm_output(3));
  and_305_nl <= (fsm_output(4)) AND mux_540_nl;
  or_634_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6));
  mux_538_nl <= MUX_s_1_2_2(or_tmp_170, or_634_nl, fsm_output(3));
  or_633_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1000")) OR (fsm_output(6));
  mux_539_nl <= MUX_s_1_2_2(mux_538_nl, or_633_nl, or_632_cse);
  nor_388_nl <= NOT((fsm_output(4)) OR mux_539_nl);
  mux_541_nl <= MUX_s_1_2_2(and_305_nl, nor_388_nl, fsm_output(7));
  nor_389_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_518);
  mux_542_nl <= MUX_s_1_2_2(mux_541_nl, nor_389_nl, fsm_output(0));
  nand_223_nl <= NOT((fsm_output(2)) AND mux_542_nl);
  nor_391_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_226);
  nor_392_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)));
  mux_531_nl <= MUX_s_1_2_2(nor_391_nl, nor_392_nl, fsm_output(3));
  nand_56_nl <= NOT((fsm_output(4)) AND mux_531_nl);
  or_618_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT (fsm_output(6)));
  or_616_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6));
  mux_530_nl <= MUX_s_1_2_2(or_618_nl, or_616_nl, fsm_output(3));
  or_619_nl <= (fsm_output(4)) OR mux_530_nl;
  mux_532_nl <= MUX_s_1_2_2(nand_56_nl, or_619_nl, fsm_output(7));
  nor_393_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT (fsm_output(6))));
  nor_394_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)));
  mux_528_nl <= MUX_s_1_2_2(nor_393_nl, nor_394_nl, fsm_output(3));
  nand_55_nl <= NOT((fsm_output(4)) AND mux_528_nl);
  or_611_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT (fsm_output(6)));
  or_609_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6));
  mux_527_nl <= MUX_s_1_2_2(or_611_nl, or_609_nl, fsm_output(3));
  or_612_nl <= (fsm_output(4)) OR mux_527_nl;
  mux_529_nl <= MUX_s_1_2_2(nand_55_nl, or_612_nl, fsm_output(7));
  mux_533_nl <= MUX_s_1_2_2(mux_532_nl, mux_529_nl, fsm_output(0));
  or_1248_nl <= (fsm_output(2)) OR mux_533_nl;
  mux_543_nl <= MUX_s_1_2_2(nand_223_nl, or_1248_nl, fsm_output(5));
  vec_rsc_0_8_i_we_d_pff <= NOT(mux_543_nl OR (fsm_output(1)));
  or_664_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_663_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0))) OR
      (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_556_nl <= MUX_s_1_2_2(or_664_nl, or_663_nl, fsm_output(0));
  nor_379_nl <= NOT((fsm_output(7)) OR mux_556_nl);
  or_661_nl <= (VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68;
  or_659_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_553_nl <= MUX_s_1_2_2(or_661_nl, or_659_nl, fsm_output(3));
  nor_380_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_553_nl);
  nor_381_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR not_tmp_68);
  nor_382_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_552_nl <= MUX_s_1_2_2(nor_381_nl, nor_382_nl, fsm_output(3));
  mux_554_nl <= MUX_s_1_2_2(nor_380_nl, mux_552_nl, fsm_output(0));
  nor_383_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("100")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_384_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_551_nl <= MUX_s_1_2_2(nor_383_nl, nor_384_nl, fsm_output(0));
  mux_555_nl <= MUX_s_1_2_2(mux_554_nl, mux_551_nl, fsm_output(7));
  mux_557_nl <= MUX_s_1_2_2(nor_379_nl, mux_555_nl, fsm_output(5));
  or_650_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_648_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1000")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_548_nl <= MUX_s_1_2_2(or_650_nl, or_648_nl, fsm_output(3));
  or_646_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR nand_172_cse;
  or_644_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_547_nl <= MUX_s_1_2_2(or_646_nl, or_644_nl, fsm_output(3));
  mux_549_nl <= MUX_s_1_2_2(mux_548_nl, mux_547_nl, fsm_output(0));
  or_642_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1000")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_641_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1000")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_545_nl <= MUX_s_1_2_2(or_642_nl, or_641_nl, fsm_output(3));
  or_640_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_639_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_544_nl <= MUX_s_1_2_2(or_640_nl, or_639_nl, fsm_output(3));
  mux_546_nl <= MUX_s_1_2_2(mux_545_nl, mux_544_nl, fsm_output(0));
  mux_550_nl <= MUX_s_1_2_2(mux_549_nl, mux_546_nl, fsm_output(7));
  nor_385_nl <= NOT((fsm_output(5)) OR mux_550_nl);
  mux_558_nl <= MUX_s_1_2_2(mux_557_nl, nor_385_nl, fsm_output(2));
  vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_558_nl AND (fsm_output(1));
  nor_371_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR not_tmp_229);
  nor_372_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)));
  mux_568_nl <= MUX_s_1_2_2(nor_371_nl, nor_372_nl, fsm_output(3));
  and_302_nl <= (fsm_output(4)) AND mux_568_nl;
  or_683_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6));
  mux_566_nl <= MUX_s_1_2_2(or_tmp_220, or_683_nl, fsm_output(3));
  or_682_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1001")) OR (fsm_output(6));
  mux_567_nl <= MUX_s_1_2_2(mux_566_nl, or_682_nl, or_632_cse);
  nor_373_nl <= NOT((fsm_output(4)) OR mux_567_nl);
  mux_569_nl <= MUX_s_1_2_2(and_302_nl, nor_373_nl, fsm_output(7));
  and_303_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_518);
  mux_570_nl <= MUX_s_1_2_2(mux_569_nl, and_303_nl, fsm_output(0));
  nand_222_nl <= NOT((fsm_output(2)) AND mux_570_nl);
  nor_375_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR not_tmp_226);
  nor_376_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)));
  mux_563_nl <= MUX_s_1_2_2(nor_375_nl, nor_376_nl, fsm_output(3));
  nand_61_nl <= NOT((fsm_output(4)) AND mux_563_nl);
  or_675_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"))
      OR not_tmp_146;
  or_673_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6));
  mux_562_nl <= MUX_s_1_2_2(or_675_nl, or_673_nl, fsm_output(3));
  or_676_nl <= (fsm_output(4)) OR mux_562_nl;
  mux_564_nl <= MUX_s_1_2_2(nand_61_nl, or_676_nl, fsm_output(7));
  nor_377_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_237);
  nor_378_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)));
  mux_560_nl <= MUX_s_1_2_2(nor_377_nl, nor_378_nl, fsm_output(3));
  nand_60_nl <= NOT((fsm_output(4)) AND mux_560_nl);
  or_668_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"))
      OR not_tmp_143;
  or_666_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6));
  mux_559_nl <= MUX_s_1_2_2(or_668_nl, or_666_nl, fsm_output(3));
  or_669_nl <= (fsm_output(4)) OR mux_559_nl;
  mux_561_nl <= MUX_s_1_2_2(nand_60_nl, or_669_nl, fsm_output(7));
  mux_565_nl <= MUX_s_1_2_2(mux_564_nl, mux_561_nl, fsm_output(0));
  or_1247_nl <= (fsm_output(2)) OR mux_565_nl;
  mux_571_nl <= MUX_s_1_2_2(nand_222_nl, or_1247_nl, fsm_output(5));
  vec_rsc_0_9_i_we_d_pff <= NOT(mux_571_nl OR (fsm_output(1)));
  or_712_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_711_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0))) OR
      (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_584_nl <= MUX_s_1_2_2(or_712_nl, or_711_nl, fsm_output(0));
  nor_363_nl <= NOT((fsm_output(7)) OR mux_584_nl);
  nor_364_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(1)) OR CONV_SL_1_1(COMP_LOOP_acc_13_psp_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm)
      OR not_tmp_68);
  nor_365_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_581_nl <= MUX_s_1_2_2(nor_364_nl, nor_365_nl, fsm_output(3));
  and_300_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_581_nl;
  nor_366_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR nand_168_cse);
  nor_367_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_580_nl <= MUX_s_1_2_2(nor_366_nl, nor_367_nl, fsm_output(3));
  mux_582_nl <= MUX_s_1_2_2(and_300_nl, mux_580_nl, fsm_output(0));
  nor_368_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_369_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_579_nl <= MUX_s_1_2_2(nor_368_nl, nor_369_nl, fsm_output(0));
  mux_583_nl <= MUX_s_1_2_2(mux_582_nl, mux_579_nl, fsm_output(7));
  mux_585_nl <= MUX_s_1_2_2(nor_363_nl, mux_583_nl, fsm_output(5));
  or_699_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_697_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1001")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_576_nl <= MUX_s_1_2_2(or_699_nl, or_697_nl, fsm_output(3));
  or_695_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR nand_172_cse;
  or_693_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_575_nl <= MUX_s_1_2_2(or_695_nl, or_693_nl, fsm_output(3));
  mux_577_nl <= MUX_s_1_2_2(mux_576_nl, mux_575_nl, fsm_output(0));
  or_691_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1001")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_690_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1001")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_573_nl <= MUX_s_1_2_2(or_691_nl, or_690_nl, fsm_output(3));
  or_689_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_688_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_572_nl <= MUX_s_1_2_2(or_689_nl, or_688_nl, fsm_output(3));
  mux_574_nl <= MUX_s_1_2_2(mux_573_nl, mux_572_nl, fsm_output(0));
  mux_578_nl <= MUX_s_1_2_2(mux_577_nl, mux_574_nl, fsm_output(7));
  nor_370_nl <= NOT((fsm_output(5)) OR mux_578_nl);
  mux_586_nl <= MUX_s_1_2_2(mux_585_nl, nor_370_nl, fsm_output(2));
  vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_586_nl AND (fsm_output(1));
  nor_352_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_229);
  nor_353_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)));
  mux_600_nl <= MUX_s_1_2_2(nor_352_nl, nor_353_nl, fsm_output(3));
  and_299_nl <= (fsm_output(4)) AND mux_600_nl;
  or_739_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6));
  mux_598_nl <= MUX_s_1_2_2(or_tmp_278, or_739_nl, fsm_output(3));
  or_738_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1010")) OR (fsm_output(6));
  mux_599_nl <= MUX_s_1_2_2(mux_598_nl, or_738_nl, or_632_cse);
  nor_354_nl <= NOT((fsm_output(4)) OR mux_599_nl);
  mux_601_nl <= MUX_s_1_2_2(and_299_nl, nor_354_nl, fsm_output(7));
  nor_355_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_578);
  mux_602_nl <= MUX_s_1_2_2(mux_601_nl, nor_355_nl, fsm_output(0));
  nand_221_nl <= NOT((fsm_output(2)) AND mux_602_nl);
  nor_357_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_226);
  nor_358_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)));
  mux_591_nl <= MUX_s_1_2_2(nor_357_nl, nor_358_nl, fsm_output(3));
  nand_67_nl <= NOT((fsm_output(4)) AND mux_591_nl);
  or_723_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(6)));
  or_721_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6));
  mux_590_nl <= MUX_s_1_2_2(or_723_nl, or_721_nl, fsm_output(3));
  or_724_nl <= (fsm_output(4)) OR mux_590_nl;
  mux_592_nl <= MUX_s_1_2_2(nand_67_nl, or_724_nl, fsm_output(7));
  nor_359_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(6))));
  nor_360_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)));
  mux_588_nl <= MUX_s_1_2_2(nor_359_nl, nor_360_nl, fsm_output(3));
  nand_66_nl <= NOT((fsm_output(4)) AND mux_588_nl);
  or_716_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(6)));
  or_714_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6));
  mux_587_nl <= MUX_s_1_2_2(or_716_nl, or_714_nl, fsm_output(3));
  or_717_nl <= (fsm_output(4)) OR mux_587_nl;
  mux_589_nl <= MUX_s_1_2_2(nand_66_nl, or_717_nl, fsm_output(7));
  mux_593_nl <= MUX_s_1_2_2(mux_592_nl, mux_589_nl, fsm_output(0));
  or_1246_nl <= (fsm_output(2)) OR mux_593_nl;
  mux_603_nl <= MUX_s_1_2_2(nand_221_nl, or_1246_nl, fsm_output(5));
  vec_rsc_0_10_i_we_d_pff <= NOT(mux_603_nl OR (fsm_output(1)));
  or_769_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_768_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0))) OR
      (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_616_nl <= MUX_s_1_2_2(or_769_nl, or_768_nl, fsm_output(0));
  nor_345_nl <= NOT((fsm_output(7)) OR mux_616_nl);
  or_766_nl <= nand_165_cse OR not_tmp_68;
  or_764_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_613_nl <= MUX_s_1_2_2(or_766_nl, or_764_nl, fsm_output(3));
  nor_346_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_613_nl);
  nor_347_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR not_tmp_68);
  nor_348_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_612_nl <= MUX_s_1_2_2(nor_347_nl, nor_348_nl, fsm_output(3));
  mux_614_nl <= MUX_s_1_2_2(nor_346_nl, mux_612_nl, fsm_output(0));
  nor_349_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("101")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_350_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_611_nl <= MUX_s_1_2_2(nor_349_nl, nor_350_nl, fsm_output(0));
  mux_615_nl <= MUX_s_1_2_2(mux_614_nl, mux_611_nl, fsm_output(7));
  mux_617_nl <= MUX_s_1_2_2(nor_345_nl, mux_615_nl, fsm_output(5));
  or_755_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_753_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1010")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_608_nl <= MUX_s_1_2_2(or_755_nl, or_753_nl, fsm_output(3));
  or_751_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR nand_172_cse;
  or_749_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_607_nl <= MUX_s_1_2_2(or_751_nl, or_749_nl, fsm_output(3));
  mux_609_nl <= MUX_s_1_2_2(mux_608_nl, mux_607_nl, fsm_output(0));
  or_747_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1010")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_746_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1010")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_605_nl <= MUX_s_1_2_2(or_747_nl, or_746_nl, fsm_output(3));
  or_745_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_744_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_604_nl <= MUX_s_1_2_2(or_745_nl, or_744_nl, fsm_output(3));
  mux_606_nl <= MUX_s_1_2_2(mux_605_nl, mux_604_nl, fsm_output(0));
  mux_610_nl <= MUX_s_1_2_2(mux_609_nl, mux_606_nl, fsm_output(7));
  nor_351_nl <= NOT((fsm_output(5)) OR mux_610_nl);
  mux_618_nl <= MUX_s_1_2_2(mux_617_nl, nor_351_nl, fsm_output(2));
  vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_618_nl AND (fsm_output(1));
  nor_337_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR not_tmp_229);
  nor_338_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)));
  mux_628_nl <= MUX_s_1_2_2(nor_337_nl, nor_338_nl, fsm_output(3));
  and_296_nl <= (fsm_output(4)) AND mux_628_nl;
  or_788_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6));
  mux_626_nl <= MUX_s_1_2_2(not_tmp_173, or_788_nl, fsm_output(3));
  or_787_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1011")) OR (fsm_output(6));
  mux_627_nl <= MUX_s_1_2_2(mux_626_nl, or_787_nl, or_632_cse);
  nor_339_nl <= NOT((fsm_output(4)) OR mux_627_nl);
  mux_629_nl <= MUX_s_1_2_2(and_296_nl, nor_339_nl, fsm_output(7));
  and_297_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_578);
  mux_630_nl <= MUX_s_1_2_2(mux_629_nl, and_297_nl, fsm_output(0));
  nand_220_nl <= NOT((fsm_output(2)) AND mux_630_nl);
  nor_341_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR not_tmp_226);
  nor_342_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)));
  mux_623_nl <= MUX_s_1_2_2(nor_341_nl, nor_342_nl, fsm_output(3));
  nand_72_nl <= NOT((fsm_output(4)) AND mux_623_nl);
  or_780_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_170;
  or_778_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6));
  mux_622_nl <= MUX_s_1_2_2(or_780_nl, or_778_nl, fsm_output(3));
  or_781_nl <= (fsm_output(4)) OR mux_622_nl;
  mux_624_nl <= MUX_s_1_2_2(nand_72_nl, or_781_nl, fsm_output(7));
  nor_343_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"))
      OR not_tmp_237);
  nor_344_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)));
  mux_620_nl <= MUX_s_1_2_2(nor_343_nl, nor_344_nl, fsm_output(3));
  nand_71_nl <= NOT((fsm_output(4)) AND mux_620_nl);
  or_773_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_168;
  or_771_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6));
  mux_619_nl <= MUX_s_1_2_2(or_773_nl, or_771_nl, fsm_output(3));
  or_774_nl <= (fsm_output(4)) OR mux_619_nl;
  mux_621_nl <= MUX_s_1_2_2(nand_71_nl, or_774_nl, fsm_output(7));
  mux_625_nl <= MUX_s_1_2_2(mux_624_nl, mux_621_nl, fsm_output(0));
  or_1245_nl <= (fsm_output(2)) OR mux_625_nl;
  mux_631_nl <= MUX_s_1_2_2(nand_220_nl, or_1245_nl, fsm_output(5));
  vec_rsc_0_11_i_we_d_pff <= NOT(mux_631_nl OR (fsm_output(1)));
  or_816_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_815_nl <= (VEC_LOOP_j_10_0_sva_9_0(2)) OR (NOT (COMP_LOOP_acc_psp_sva(0))) OR
      (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_644_nl <= MUX_s_1_2_2(or_816_nl, or_815_nl, fsm_output(0));
  nor_329_nl <= NOT((fsm_output(7)) OR mux_644_nl);
  nor_330_nl <= NOT(nand_165_cse OR not_tmp_68);
  nor_331_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_641_nl <= MUX_s_1_2_2(nor_330_nl, nor_331_nl, fsm_output(3));
  and_294_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_641_nl;
  nor_332_nl <= NOT((COMP_LOOP_acc_10_cse_10_1_5_sva(2)) OR (NOT((COMP_LOOP_acc_10_cse_10_1_5_sva(1))
      AND (COMP_LOOP_acc_10_cse_10_1_5_sva(3)) AND (COMP_LOOP_acc_10_cse_10_1_5_sva(0))
      AND (fsm_output(6)) AND (fsm_output(4)))));
  nor_333_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_640_nl <= MUX_s_1_2_2(nor_332_nl, nor_333_nl, fsm_output(3));
  mux_642_nl <= MUX_s_1_2_2(and_294_nl, mux_640_nl, fsm_output(0));
  nor_334_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_335_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_639_nl <= MUX_s_1_2_2(nor_334_nl, nor_335_nl, fsm_output(0));
  mux_643_nl <= MUX_s_1_2_2(mux_642_nl, mux_639_nl, fsm_output(7));
  mux_645_nl <= MUX_s_1_2_2(nor_329_nl, mux_643_nl, fsm_output(5));
  or_804_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1011"))
      AND COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) OR not_tmp_68;
  nand_235_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1011")) AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_636_nl <= MUX_s_1_2_2(or_804_nl, nand_235_nl, fsm_output(3));
  or_800_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))
      OR nand_172_cse;
  or_798_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_635_nl <= MUX_s_1_2_2(or_800_nl, or_798_nl, fsm_output(3));
  mux_637_nl <= MUX_s_1_2_2(mux_636_nl, mux_635_nl, fsm_output(0));
  nand_163_nl <= NOT(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1011")) AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  or_795_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1011")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_633_nl <= MUX_s_1_2_2(nand_163_nl, or_795_nl, fsm_output(3));
  or_794_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_793_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_632_nl <= MUX_s_1_2_2(or_794_nl, or_793_nl, fsm_output(3));
  mux_634_nl <= MUX_s_1_2_2(mux_633_nl, mux_632_nl, fsm_output(0));
  mux_638_nl <= MUX_s_1_2_2(mux_637_nl, mux_634_nl, fsm_output(7));
  nor_336_nl <= NOT((fsm_output(5)) OR mux_638_nl);
  mux_646_nl <= MUX_s_1_2_2(mux_645_nl, nor_336_nl, fsm_output(2));
  vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_646_nl AND (fsm_output(1));
  nor_318_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_277);
  nor_319_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)));
  mux_660_nl <= MUX_s_1_2_2(nor_318_nl, nor_319_nl, fsm_output(3));
  and_291_nl <= (fsm_output(4)) AND mux_660_nl;
  or_840_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR (fsm_output(6));
  or_839_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6));
  mux_658_nl <= MUX_s_1_2_2(or_tmp_170, or_839_nl, fsm_output(3));
  mux_659_nl <= MUX_s_1_2_2(or_840_nl, mux_658_nl, and_292_cse);
  nor_320_nl <= NOT((fsm_output(4)) OR mux_659_nl);
  mux_661_nl <= MUX_s_1_2_2(and_291_nl, nor_320_nl, fsm_output(7));
  nor_321_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_638);
  mux_662_nl <= MUX_s_1_2_2(mux_661_nl, nor_321_nl, fsm_output(0));
  nand_219_nl <= NOT((fsm_output(2)) AND mux_662_nl);
  nor_323_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_273);
  nor_324_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)));
  mux_651_nl <= MUX_s_1_2_2(nor_323_nl, nor_324_nl, fsm_output(3));
  nand_78_nl <= NOT((fsm_output(4)) AND mux_651_nl);
  or_827_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(6)));
  or_825_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6));
  mux_650_nl <= MUX_s_1_2_2(or_827_nl, or_825_nl, fsm_output(3));
  or_828_nl <= (fsm_output(4)) OR mux_650_nl;
  mux_652_nl <= MUX_s_1_2_2(nand_78_nl, or_828_nl, fsm_output(7));
  nor_325_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(6))));
  nor_326_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)));
  mux_648_nl <= MUX_s_1_2_2(nor_325_nl, nor_326_nl, fsm_output(3));
  nand_77_nl <= NOT((fsm_output(4)) AND mux_648_nl);
  or_820_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(6)));
  or_818_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6));
  mux_647_nl <= MUX_s_1_2_2(or_820_nl, or_818_nl, fsm_output(3));
  or_821_nl <= (fsm_output(4)) OR mux_647_nl;
  mux_649_nl <= MUX_s_1_2_2(nand_77_nl, or_821_nl, fsm_output(7));
  mux_653_nl <= MUX_s_1_2_2(mux_652_nl, mux_649_nl, fsm_output(0));
  or_1244_nl <= (fsm_output(2)) OR mux_653_nl;
  mux_663_nl <= MUX_s_1_2_2(nand_219_nl, or_1244_nl, fsm_output(5));
  vec_rsc_0_12_i_we_d_pff <= NOT(mux_663_nl OR (fsm_output(1)));
  or_870_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_869_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_676_nl <= MUX_s_1_2_2(or_870_nl, or_869_nl, fsm_output(0));
  nor_311_nl <= NOT((fsm_output(7)) OR mux_676_nl);
  or_867_nl <= nand_153_cse OR not_tmp_68;
  or_865_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_673_nl <= MUX_s_1_2_2(or_867_nl, or_865_nl, fsm_output(3));
  nor_312_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_673_nl);
  nor_313_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR not_tmp_68);
  nor_314_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_672_nl <= MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output(3));
  mux_674_nl <= MUX_s_1_2_2(nor_312_nl, mux_672_nl, fsm_output(0));
  nor_315_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("110")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_316_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_671_nl <= MUX_s_1_2_2(nor_315_nl, nor_316_nl, fsm_output(0));
  mux_675_nl <= MUX_s_1_2_2(mux_674_nl, mux_671_nl, fsm_output(7));
  mux_677_nl <= MUX_s_1_2_2(nor_311_nl, mux_675_nl, fsm_output(5));
  or_856_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm) OR not_tmp_68;
  or_854_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_668_nl <= MUX_s_1_2_2(or_856_nl, or_854_nl, fsm_output(3));
  or_852_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR nand_154_cse;
  or_850_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_667_nl <= MUX_s_1_2_2(or_852_nl, or_850_nl, fsm_output(3));
  mux_669_nl <= MUX_s_1_2_2(mux_668_nl, mux_667_nl, fsm_output(0));
  or_848_nl <= (NOT COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_847_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_665_nl <= MUX_s_1_2_2(or_848_nl, or_847_nl, fsm_output(3));
  or_846_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_845_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_664_nl <= MUX_s_1_2_2(or_846_nl, or_845_nl, fsm_output(3));
  mux_666_nl <= MUX_s_1_2_2(mux_665_nl, mux_664_nl, fsm_output(0));
  mux_670_nl <= MUX_s_1_2_2(mux_669_nl, mux_666_nl, fsm_output(7));
  nor_317_nl <= NOT((fsm_output(5)) OR mux_670_nl);
  mux_678_nl <= MUX_s_1_2_2(mux_677_nl, nor_317_nl, fsm_output(2));
  vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_678_nl AND (fsm_output(1));
  nor_303_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR not_tmp_277);
  nor_304_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)));
  mux_688_nl <= MUX_s_1_2_2(nor_303_nl, nor_304_nl, fsm_output(3));
  and_287_nl <= (fsm_output(4)) AND mux_688_nl;
  or_887_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1101")) OR (fsm_output(6));
  or_886_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6));
  mux_686_nl <= MUX_s_1_2_2(or_tmp_220, or_886_nl, fsm_output(3));
  mux_687_nl <= MUX_s_1_2_2(or_887_nl, mux_686_nl, and_292_cse);
  nor_305_nl <= NOT((fsm_output(4)) OR mux_687_nl);
  mux_689_nl <= MUX_s_1_2_2(and_287_nl, nor_305_nl, fsm_output(7));
  and_289_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_638);
  mux_690_nl <= MUX_s_1_2_2(mux_689_nl, and_289_nl, fsm_output(0));
  nand_218_nl <= NOT((fsm_output(2)) AND mux_690_nl);
  nor_307_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR not_tmp_273);
  nor_308_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)));
  mux_683_nl <= MUX_s_1_2_2(nor_307_nl, nor_308_nl, fsm_output(3));
  nand_83_nl <= NOT((fsm_output(4)) AND mux_683_nl);
  or_880_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110"))
      OR not_tmp_146;
  or_878_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6));
  mux_682_nl <= MUX_s_1_2_2(or_880_nl, or_878_nl, fsm_output(3));
  or_881_nl <= (fsm_output(4)) OR mux_682_nl;
  mux_684_nl <= MUX_s_1_2_2(nand_83_nl, or_881_nl, fsm_output(7));
  nor_309_nl <= NOT((COMP_LOOP_acc_1_cse_4_sva(1)) OR (NOT((COMP_LOOP_acc_1_cse_4_sva(2))
      AND (COMP_LOOP_acc_1_cse_4_sva(3)) AND (COMP_LOOP_acc_1_cse_4_sva(0)) AND (fsm_output(6)))));
  nor_310_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)));
  mux_680_nl <= MUX_s_1_2_2(nor_309_nl, nor_310_nl, fsm_output(3));
  nand_82_nl <= NOT((fsm_output(4)) AND mux_680_nl);
  or_874_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110"))
      OR not_tmp_143;
  or_872_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6));
  mux_679_nl <= MUX_s_1_2_2(or_874_nl, or_872_nl, fsm_output(3));
  or_875_nl <= (fsm_output(4)) OR mux_679_nl;
  mux_681_nl <= MUX_s_1_2_2(nand_82_nl, or_875_nl, fsm_output(7));
  mux_685_nl <= MUX_s_1_2_2(mux_684_nl, mux_681_nl, fsm_output(0));
  or_1243_nl <= (fsm_output(2)) OR mux_685_nl;
  mux_691_nl <= MUX_s_1_2_2(nand_218_nl, or_1243_nl, fsm_output(5));
  vec_rsc_0_13_i_we_d_pff <= NOT(mux_691_nl OR (fsm_output(1)));
  or_916_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_915_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (VEC_LOOP_j_10_0_sva_9_0(1))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_704_nl <= MUX_s_1_2_2(or_916_nl, or_915_nl, fsm_output(0));
  nor_295_nl <= NOT((fsm_output(7)) OR mux_704_nl);
  nor_296_nl <= NOT(nand_153_cse OR not_tmp_68);
  nor_297_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_701_nl <= MUX_s_1_2_2(nor_296_nl, nor_297_nl, fsm_output(3));
  and_285_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_701_nl;
  nor_298_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR nand_168_cse);
  nor_299_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_700_nl <= MUX_s_1_2_2(nor_298_nl, nor_299_nl, fsm_output(3));
  mux_702_nl <= MUX_s_1_2_2(and_285_nl, mux_700_nl, fsm_output(0));
  nor_300_nl <= NOT((NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (NOT (fsm_output(3))) OR
      CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))
      OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm) OR (fsm_output(6)) OR (fsm_output(4)));
  nor_301_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_699_nl <= MUX_s_1_2_2(nor_300_nl, nor_301_nl, fsm_output(0));
  mux_703_nl <= MUX_s_1_2_2(mux_702_nl, mux_699_nl, fsm_output(7));
  mux_705_nl <= MUX_s_1_2_2(nor_295_nl, mux_703_nl, fsm_output(5));
  or_903_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1101"))
      AND COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) OR not_tmp_68;
  nand_234_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1101")) AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_696_nl <= MUX_s_1_2_2(or_903_nl, nand_234_nl, fsm_output(3));
  or_899_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR nand_154_cse;
  or_897_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_695_nl <= MUX_s_1_2_2(or_899_nl, or_897_nl, fsm_output(3));
  mux_697_nl <= MUX_s_1_2_2(mux_696_nl, mux_695_nl, fsm_output(0));
  nand_150_nl <= NOT(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1101")) AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  or_894_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1101")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_693_nl <= MUX_s_1_2_2(nand_150_nl, or_894_nl, fsm_output(3));
  or_893_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_892_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_692_nl <= MUX_s_1_2_2(or_893_nl, or_892_nl, fsm_output(3));
  mux_694_nl <= MUX_s_1_2_2(mux_693_nl, mux_692_nl, fsm_output(0));
  mux_698_nl <= MUX_s_1_2_2(mux_697_nl, mux_694_nl, fsm_output(7));
  nor_302_nl <= NOT((fsm_output(5)) OR mux_698_nl);
  mux_706_nl <= MUX_s_1_2_2(mux_705_nl, nor_302_nl, fsm_output(2));
  vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_706_nl AND (fsm_output(1));
  nor_286_nl <= NOT((COMP_LOOP_acc_10_cse_10_1_3_sva(0)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3
      DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(6)))));
  nor_287_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)));
  mux_720_nl <= MUX_s_1_2_2(nor_286_nl, nor_287_nl, fsm_output(3));
  and_280_nl <= (fsm_output(4)) AND mux_720_nl;
  or_938_nl <= (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1110")) OR (fsm_output(6));
  or_937_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6));
  mux_718_nl <= MUX_s_1_2_2(or_tmp_278, or_937_nl, fsm_output(3));
  mux_719_nl <= MUX_s_1_2_2(or_938_nl, mux_718_nl, and_292_cse);
  nor_288_nl <= NOT((fsm_output(4)) OR mux_719_nl);
  mux_721_nl <= MUX_s_1_2_2(and_280_nl, nor_288_nl, fsm_output(7));
  nor_289_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_tmp_698);
  mux_722_nl <= MUX_s_1_2_2(mux_721_nl, nor_289_nl, fsm_output(0));
  nand_217_nl <= NOT((fsm_output(2)) AND mux_722_nl);
  nor_291_nl <= NOT((COMP_LOOP_acc_10_cse_10_1_4_sva(0)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3
      DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(6)))));
  nor_292_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)));
  mux_711_nl <= MUX_s_1_2_2(nor_291_nl, nor_292_nl, fsm_output(3));
  nand_89_nl <= NOT((fsm_output(4)) AND mux_711_nl);
  nand_239_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))
      AND (fsm_output(6)));
  or_925_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6));
  mux_710_nl <= MUX_s_1_2_2(nand_239_nl, or_925_nl, fsm_output(3));
  or_928_nl <= (fsm_output(4)) OR mux_710_nl;
  mux_712_nl <= MUX_s_1_2_2(nand_89_nl, or_928_nl, fsm_output(7));
  and_406_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))
      AND (fsm_output(6));
  nor_294_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)));
  mux_708_nl <= MUX_s_1_2_2(and_406_nl, nor_294_nl, fsm_output(3));
  nand_88_nl <= NOT((fsm_output(4)) AND mux_708_nl);
  nand_237_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))
      AND (fsm_output(6)));
  or_918_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6));
  mux_707_nl <= MUX_s_1_2_2(nand_237_nl, or_918_nl, fsm_output(3));
  or_921_nl <= (fsm_output(4)) OR mux_707_nl;
  mux_709_nl <= MUX_s_1_2_2(nand_88_nl, or_921_nl, fsm_output(7));
  mux_713_nl <= MUX_s_1_2_2(mux_712_nl, mux_709_nl, fsm_output(0));
  or_1242_nl <= (fsm_output(2)) OR mux_713_nl;
  mux_723_nl <= MUX_s_1_2_2(nand_217_nl, or_1242_nl, fsm_output(5));
  vec_rsc_0_14_i_we_d_pff <= NOT(mux_723_nl OR (fsm_output(1)));
  or_966_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_965_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (VEC_LOOP_j_10_0_sva_9_0(0)) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_736_nl <= MUX_s_1_2_2(or_966_nl, or_965_nl, fsm_output(0));
  nor_279_nl <= NOT((fsm_output(7)) OR mux_736_nl);
  or_963_nl <= nand_132_cse OR not_tmp_68;
  nand_238_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_733_nl <= MUX_s_1_2_2(or_963_nl, nand_238_nl, fsm_output(3));
  nor_280_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR mux_733_nl);
  nor_281_nl <= NOT((NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))))
      OR not_tmp_68);
  nor_282_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4))));
  mux_732_nl <= MUX_s_1_2_2(nor_281_nl, nor_282_nl, fsm_output(3));
  mux_734_nl <= MUX_s_1_2_2(nor_280_nl, mux_732_nl, fsm_output(0));
  nor_283_nl <= NOT((VEC_LOOP_j_10_0_sva_9_0(0)) OR (NOT (fsm_output(3))) OR CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("111")) OR (NOT COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm)
      OR (fsm_output(6)) OR (fsm_output(4)));
  nor_284_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(4)));
  mux_731_nl <= MUX_s_1_2_2(nor_283_nl, nor_284_nl, fsm_output(0));
  mux_735_nl <= MUX_s_1_2_2(mux_734_nl, mux_731_nl, fsm_output(7));
  mux_737_nl <= MUX_s_1_2_2(nor_279_nl, mux_735_nl, fsm_output(5));
  or_952_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1110"))
      AND COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) OR not_tmp_68;
  nand_233_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1110")) AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_728_nl <= MUX_s_1_2_2(or_952_nl, nand_233_nl, fsm_output(3));
  or_948_nl <= (COMP_LOOP_acc_10_cse_10_1_4_sva(0)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3
      DOWNTO 1)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(6)) AND (fsm_output(4))));
  or_947_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)) OR (NOT (fsm_output(4)));
  mux_727_nl <= MUX_s_1_2_2(or_948_nl, or_947_nl, fsm_output(3));
  mux_729_nl <= MUX_s_1_2_2(mux_728_nl, mux_727_nl, fsm_output(0));
  nand_137_nl <= NOT(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1110")) AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  or_944_nl <= (NOT COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("1110")) OR (fsm_output(6)) OR (fsm_output(4));
  mux_725_nl <= MUX_s_1_2_2(nand_137_nl, or_944_nl, fsm_output(3));
  or_943_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (NOT (fsm_output(6))) OR (fsm_output(4));
  or_942_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_724_nl <= MUX_s_1_2_2(or_943_nl, or_942_nl, fsm_output(3));
  mux_726_nl <= MUX_s_1_2_2(mux_725_nl, mux_724_nl, fsm_output(0));
  mux_730_nl <= MUX_s_1_2_2(mux_729_nl, mux_726_nl, fsm_output(7));
  nor_285_nl <= NOT((fsm_output(5)) OR mux_730_nl);
  mux_738_nl <= MUX_s_1_2_2(mux_737_nl, nor_285_nl, fsm_output(2));
  vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_738_nl AND (fsm_output(1));
  and_271_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6));
  and_272_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_1_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6)));
  mux_748_nl <= MUX_s_1_2_2(and_271_nl, and_272_nl, fsm_output(3));
  and_270_nl <= (fsm_output(4)) AND mux_748_nl;
  nand_126_nl <= NOT((fsm_output(3)) AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1111")) AND (NOT (fsm_output(6))));
  nand_127_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6))));
  mux_746_nl <= MUX_s_1_2_2(not_tmp_173, nand_127_nl, fsm_output(3));
  mux_747_nl <= MUX_s_1_2_2(nand_126_nl, mux_746_nl, and_292_cse);
  nor_277_nl <= NOT((fsm_output(4)) OR mux_747_nl);
  mux_749_nl <= MUX_s_1_2_2(and_270_nl, nor_277_nl, fsm_output(7));
  and_274_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (NOT mux_tmp_698);
  mux_750_nl <= MUX_s_1_2_2(mux_749_nl, and_274_nl, fsm_output(0));
  nand_216_nl <= NOT((fsm_output(2)) AND mux_750_nl);
  and_275_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6));
  and_276_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6)));
  mux_743_nl <= MUX_s_1_2_2(and_275_nl, and_276_nl, fsm_output(3));
  nand_94_nl <= NOT((fsm_output(4)) AND mux_743_nl);
  nand_128_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6)));
  nand_129_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6))));
  mux_742_nl <= MUX_s_1_2_2(nand_128_nl, nand_129_nl, fsm_output(3));
  or_972_nl <= (fsm_output(4)) OR mux_742_nl;
  mux_744_nl <= MUX_s_1_2_2(nand_94_nl, or_972_nl, fsm_output(7));
  and_277_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6));
  and_278_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6)));
  mux_740_nl <= MUX_s_1_2_2(and_277_nl, and_278_nl, fsm_output(3));
  nand_93_nl <= NOT((fsm_output(4)) AND mux_740_nl);
  nand_130_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6)));
  nand_131_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6))));
  mux_739_nl <= MUX_s_1_2_2(nand_130_nl, nand_131_nl, fsm_output(3));
  or_969_nl <= (fsm_output(4)) OR mux_739_nl;
  mux_741_nl <= MUX_s_1_2_2(nand_93_nl, or_969_nl, fsm_output(7));
  mux_745_nl <= MUX_s_1_2_2(mux_744_nl, mux_741_nl, fsm_output(0));
  or_1241_nl <= (fsm_output(2)) OR mux_745_nl;
  mux_751_nl <= MUX_s_1_2_2(nand_216_nl, or_1241_nl, fsm_output(5));
  vec_rsc_0_15_i_we_d_pff <= NOT(mux_751_nl OR (fsm_output(1)));
  or_999_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1111"))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(4));
  or_998_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(2))) OR (NOT (COMP_LOOP_acc_psp_sva(0)))
      OR (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) OR (fsm_output(3)) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(1)))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_764_nl <= MUX_s_1_2_2(or_999_nl, or_998_nl, fsm_output(0));
  nor_272_nl <= NOT((fsm_output(7)) OR mux_764_nl);
  nor_273_nl <= NOT(nand_132_cse OR not_tmp_68);
  and_403_nl <= CONV_SL_1_1(COMP_LOOP_acc_11_psp_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm AND (NOT (fsm_output(6))) AND (fsm_output(4));
  mux_761_nl <= MUX_s_1_2_2(nor_273_nl, and_403_nl, fsm_output(3));
  and_265_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND mux_761_nl;
  and_266_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_5_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6)) AND (fsm_output(4));
  and_404_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_3_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6))) AND (fsm_output(4));
  mux_760_nl <= MUX_s_1_2_2(and_266_nl, and_404_nl, fsm_output(3));
  mux_762_nl <= MUX_s_1_2_2(and_265_nl, mux_760_nl, fsm_output(0));
  and_267_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND (fsm_output(3)) AND CONV_SL_1_1(COMP_LOOP_acc_14_psp_sva(2
      DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm
      AND (NOT (fsm_output(6))) AND (NOT (fsm_output(4)));
  and_268_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_7_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(3)) AND (NOT (fsm_output(6))) AND (NOT (fsm_output(4)));
  mux_759_nl <= MUX_s_1_2_2(and_267_nl, and_268_nl, fsm_output(0));
  mux_763_nl <= MUX_s_1_2_2(mux_762_nl, mux_759_nl, fsm_output(7));
  mux_765_nl <= MUX_s_1_2_2(nor_272_nl, mux_763_nl, fsm_output(5));
  or_988_nl <= (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm)) OR not_tmp_68;
  nand_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1111")) AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_756_nl <= MUX_s_1_2_2(or_988_nl, nand_nl, fsm_output(3));
  nand_120_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_4_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6)) AND (fsm_output(4)));
  nand_215_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_2_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (NOT (fsm_output(6))) AND (fsm_output(4)));
  mux_755_nl <= MUX_s_1_2_2(nand_120_nl, nand_215_nl, fsm_output(3));
  mux_757_nl <= MUX_s_1_2_2(mux_756_nl, mux_755_nl, fsm_output(0));
  nand_122_nl <= NOT(COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1111")) AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  nand_123_nl <= NOT(COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva(3
      DOWNTO 0)=STD_LOGIC_VECTOR'("1111")) AND (NOT (fsm_output(6))) AND (NOT (fsm_output(4))));
  mux_753_nl <= MUX_s_1_2_2(nand_122_nl, nand_123_nl, fsm_output(3));
  nand_124_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_sva(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(6)) AND (NOT (fsm_output(4))));
  or_979_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_10_1_6_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1111"))
      OR (fsm_output(6)) OR (fsm_output(4));
  mux_752_nl <= MUX_s_1_2_2(nand_124_nl, or_979_nl, fsm_output(3));
  mux_754_nl <= MUX_s_1_2_2(mux_753_nl, mux_752_nl, fsm_output(0));
  mux_758_nl <= MUX_s_1_2_2(mux_757_nl, mux_754_nl, fsm_output(7));
  nor_276_nl <= NOT((fsm_output(5)) OR mux_758_nl);
  mux_766_nl <= MUX_s_1_2_2(mux_765_nl, nor_276_nl, fsm_output(2));
  vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_766_nl AND (fsm_output(1));
  twiddle_rsc_0_0_i_radr_d_pff <= MUX1HOT_v_6_7_2((z_out_3(6 DOWNTO 1)), (z_out_2(9
      DOWNTO 4)), (z_out_2(8 DOWNTO 3)), (COMP_LOOP_5_tmp_mul_idiv_sva(7 DOWNTO 2)),
      (COMP_LOOP_2_tmp_mul_idiv_sva(9 DOWNTO 4)), (COMP_LOOP_3_tmp_lshift_ncse_sva(8
      DOWNTO 3)), (COMP_LOOP_2_tmp_lshift_ncse_sva(9 DOWNTO 4)), STD_LOGIC_VECTOR'(
      and_dcpl_47 & COMP_LOOP_or_25_cse & and_dcpl_128 & and_dcpl_130 & and_dcpl_131
      & and_dcpl_133 & and_dcpl_135));
  nor_267_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(3)));
  nor_264_nl <= NOT(CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (fsm_output(3))));
  nor_265_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_lshift_ncse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (NOT (fsm_output(3))));
  mux_771_nl <= MUX_s_1_2_2(nor_264_nl, nor_265_nl, fsm_output(0));
  nor_266_nl <= NOT((z_out_3(0)) OR (fsm_output(3)));
  mux_770_nl <= MUX_s_1_2_2(nor_266_nl, nor_267_cse, fsm_output(0));
  mux_772_nl <= MUX_s_1_2_2(mux_771_nl, mux_770_nl, fsm_output(1));
  nor_268_nl <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000")) OR
      (fsm_output(3)));
  mux_768_nl <= MUX_s_1_2_2(nor_268_nl, nor_267_cse, fsm_output(0));
  nor_270_nl <= NOT(CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(3)));
  nor_271_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_mul_idiv_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))
      OR (fsm_output(3)));
  mux_767_nl <= MUX_s_1_2_2(nor_270_nl, nor_271_nl, fsm_output(0));
  mux_769_nl <= MUX_s_1_2_2(mux_768_nl, mux_767_nl, fsm_output(1));
  mux_773_nl <= MUX_s_1_2_2(mux_772_nl, mux_769_nl, fsm_output(2));
  twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_773_nl AND and_dcpl_138;
  twiddle_rsc_0_1_i_radr_d_pff <= z_out_2(9 DOWNTO 4);
  nor_261_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_260_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))
      OR nand_114_cse);
  mux_775_nl <= MUX_s_1_2_2(nor_260_nl, nor_261_cse, fsm_output(0));
  nor_263_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (fsm_output(3)));
  mux_774_nl <= MUX_s_1_2_2(nor_261_cse, nor_263_nl, fsm_output(0));
  mux_776_nl <= MUX_s_1_2_2(mux_775_nl, mux_774_nl, fsm_output(1));
  twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_776_nl AND and_dcpl_138;
  twiddle_rsc_0_2_i_radr_d_pff <= MUX_v_6_2_2((z_out_2(9 DOWNTO 4)), (z_out_2(8 DOWNTO
      3)), COMP_LOOP_or_35_cse);
  nor_257_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(3)));
  nor_256_cse <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001")) OR
      (fsm_output(3)));
  nor_254_nl <= NOT((fsm_output(0)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (NOT (fsm_output(3))));
  nor_255_nl <= NOT((NOT (fsm_output(0))) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0010"))
      OR (fsm_output(3)));
  mux_780_nl <= MUX_s_1_2_2(nor_254_nl, nor_255_nl, fsm_output(1));
  mux_778_nl <= MUX_s_1_2_2(nor_256_cse, nor_257_cse, fsm_output(0));
  mux_777_nl <= MUX_s_1_2_2(nor_257_cse, nor_256_cse, fsm_output(0));
  mux_779_nl <= MUX_s_1_2_2(mux_778_nl, mux_777_nl, fsm_output(1));
  mux_781_nl <= MUX_s_1_2_2(mux_780_nl, mux_779_nl, fsm_output(2));
  twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_781_nl AND and_dcpl_138;
  nor_251_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_250_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))
      OR nand_113_cse);
  mux_783_nl <= MUX_s_1_2_2(nor_250_nl, nor_251_cse, fsm_output(0));
  nor_253_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0011"))
      OR (fsm_output(3)));
  mux_782_nl <= MUX_s_1_2_2(nor_251_cse, nor_253_nl, fsm_output(0));
  mux_784_nl <= MUX_s_1_2_2(mux_783_nl, mux_782_nl, fsm_output(1));
  twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_784_nl AND and_dcpl_138;
  twiddle_rsc_0_4_i_radr_d_pff <= MUX1HOT_v_6_6_2((z_out_2(9 DOWNTO 4)), (z_out_2(8
      DOWNTO 3)), (COMP_LOOP_5_tmp_mul_idiv_sva(7 DOWNTO 2)), (COMP_LOOP_2_tmp_mul_idiv_sva(9
      DOWNTO 4)), (COMP_LOOP_3_tmp_lshift_ncse_sva(8 DOWNTO 3)), (COMP_LOOP_2_tmp_lshift_ncse_sva(9
      DOWNTO 4)), STD_LOGIC_VECTOR'( COMP_LOOP_or_25_cse & and_dcpl_128 & and_dcpl_130
      & and_dcpl_131 & and_dcpl_133 & and_dcpl_135));
  nor_243_nl <= NOT(CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT (fsm_output(3))));
  nor_244_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_lshift_ncse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (NOT (fsm_output(3))));
  mux_788_nl <= MUX_s_1_2_2(nor_243_nl, nor_244_nl, fsm_output(0));
  nor_245_nl <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010")) OR
      (fsm_output(3)));
  nor_246_nl <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR
      (fsm_output(3)));
  mux_787_nl <= MUX_s_1_2_2(nor_245_nl, nor_246_nl, fsm_output(0));
  mux_789_nl <= MUX_s_1_2_2(mux_788_nl, mux_787_nl, fsm_output(2));
  nor_247_nl <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100")) OR
      (NOT (fsm_output(0))) OR (fsm_output(3)));
  nor_248_nl <= NOT(CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(3)));
  nor_249_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_mul_idiv_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0100"))
      OR (fsm_output(3)));
  mux_785_nl <= MUX_s_1_2_2(nor_248_nl, nor_249_nl, fsm_output(0));
  mux_786_nl <= MUX_s_1_2_2(nor_247_nl, mux_785_nl, fsm_output(2));
  mux_790_nl <= MUX_s_1_2_2(mux_789_nl, mux_786_nl, fsm_output(1));
  twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_790_nl AND and_dcpl_138;
  nor_240_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_239_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"))
      OR nand_114_cse);
  mux_792_nl <= MUX_s_1_2_2(nor_239_nl, nor_240_cse, fsm_output(0));
  nor_242_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0101"))
      OR (fsm_output(3)));
  mux_791_nl <= MUX_s_1_2_2(nor_240_cse, nor_242_nl, fsm_output(0));
  mux_793_nl <= MUX_s_1_2_2(mux_792_nl, mux_791_nl, fsm_output(1));
  twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_793_nl AND and_dcpl_138;
  nor_236_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(3)));
  nor_235_cse <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011")) OR
      (fsm_output(3)));
  nor_233_nl <= NOT((fsm_output(0)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (NOT (fsm_output(3))));
  nor_234_nl <= NOT((NOT (fsm_output(0))) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0110"))
      OR (fsm_output(3)));
  mux_797_nl <= MUX_s_1_2_2(nor_233_nl, nor_234_nl, fsm_output(1));
  mux_795_nl <= MUX_s_1_2_2(nor_235_cse, nor_236_cse, fsm_output(0));
  mux_794_nl <= MUX_s_1_2_2(nor_236_cse, nor_235_cse, fsm_output(0));
  mux_796_nl <= MUX_s_1_2_2(mux_795_nl, mux_794_nl, fsm_output(1));
  mux_798_nl <= MUX_s_1_2_2(mux_797_nl, mux_796_nl, fsm_output(2));
  twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_798_nl AND and_dcpl_138;
  nor_230_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_229_nl <= NOT((fsm_output(2)) OR (z_out_2(3)) OR (NOT(CONV_SL_1_1(z_out_2(2
      DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND (fsm_output(3)))));
  mux_800_nl <= MUX_s_1_2_2(nor_229_nl, nor_230_cse, fsm_output(0));
  nor_232_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (fsm_output(3)));
  mux_799_nl <= MUX_s_1_2_2(nor_230_cse, nor_232_nl, fsm_output(0));
  mux_801_nl <= MUX_s_1_2_2(mux_800_nl, mux_799_nl, fsm_output(1));
  twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_801_nl AND and_dcpl_138;
  nor_224_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(3)));
  nor_221_nl <= NOT(CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT((COMP_LOOP_3_tmp_lshift_ncse_sva(2)) AND (fsm_output(3)))));
  nor_222_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_lshift_ncse_sva(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT((COMP_LOOP_2_tmp_lshift_ncse_sva(3)) AND (fsm_output(3)))));
  mux_806_nl <= MUX_s_1_2_2(nor_221_nl, nor_222_nl, fsm_output(0));
  nor_223_nl <= NOT((NOT (z_out_3(0))) OR (fsm_output(3)));
  mux_805_nl <= MUX_s_1_2_2(nor_223_nl, nor_224_cse, fsm_output(0));
  mux_807_nl <= MUX_s_1_2_2(mux_806_nl, mux_805_nl, fsm_output(1));
  nor_225_nl <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("100")) OR
      (fsm_output(3)));
  mux_803_nl <= MUX_s_1_2_2(nor_225_nl, nor_224_cse, fsm_output(0));
  nor_227_nl <= NOT(CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(3)));
  nor_228_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_mul_idiv_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1000"))
      OR (fsm_output(3)));
  mux_802_nl <= MUX_s_1_2_2(nor_227_nl, nor_228_nl, fsm_output(0));
  mux_804_nl <= MUX_s_1_2_2(mux_803_nl, mux_802_nl, fsm_output(1));
  mux_808_nl <= MUX_s_1_2_2(mux_807_nl, mux_804_nl, fsm_output(2));
  twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_808_nl AND and_dcpl_138;
  nor_218_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_217_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"))
      OR nand_114_cse);
  mux_810_nl <= MUX_s_1_2_2(nor_217_nl, nor_218_cse, fsm_output(0));
  nor_220_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1001"))
      OR (fsm_output(3)));
  mux_809_nl <= MUX_s_1_2_2(nor_218_cse, nor_220_nl, fsm_output(0));
  mux_811_nl <= MUX_s_1_2_2(mux_810_nl, mux_809_nl, fsm_output(1));
  twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_811_nl AND and_dcpl_138;
  nor_214_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(3)));
  nor_213_cse <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("101")) OR
      (fsm_output(3)));
  nor_211_nl <= NOT((fsm_output(0)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (NOT (fsm_output(3))));
  nor_212_nl <= NOT((NOT (fsm_output(0))) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1010"))
      OR (fsm_output(3)));
  mux_815_nl <= MUX_s_1_2_2(nor_211_nl, nor_212_nl, fsm_output(1));
  mux_813_nl <= MUX_s_1_2_2(nor_213_cse, nor_214_cse, fsm_output(0));
  mux_812_nl <= MUX_s_1_2_2(nor_214_cse, nor_213_cse, fsm_output(0));
  mux_814_nl <= MUX_s_1_2_2(mux_813_nl, mux_812_nl, fsm_output(1));
  mux_816_nl <= MUX_s_1_2_2(mux_815_nl, mux_814_nl, fsm_output(2));
  twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_816_nl AND and_dcpl_138;
  nor_208_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_207_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"))
      OR nand_113_cse);
  mux_818_nl <= MUX_s_1_2_2(nor_207_nl, nor_208_cse, fsm_output(0));
  nor_210_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1011"))
      OR (fsm_output(3)));
  mux_817_nl <= MUX_s_1_2_2(nor_208_cse, nor_210_nl, fsm_output(0));
  mux_819_nl <= MUX_s_1_2_2(mux_818_nl, mux_817_nl, fsm_output(1));
  twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_819_nl AND and_dcpl_138;
  and_396_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"))
      AND (fsm_output(3));
  nor_201_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_lshift_ncse_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (NOT (fsm_output(3))));
  mux_823_nl <= MUX_s_1_2_2(and_396_nl, nor_201_nl, fsm_output(0));
  nor_202_nl <= NOT(CONV_SL_1_1(z_out_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110")) OR
      (fsm_output(3)));
  nor_203_nl <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR
      (fsm_output(3)));
  mux_822_nl <= MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output(0));
  mux_824_nl <= MUX_s_1_2_2(mux_823_nl, mux_822_nl, fsm_output(2));
  nor_204_nl <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100")) OR
      (NOT (fsm_output(0))) OR (fsm_output(3)));
  nor_205_nl <= NOT(CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)));
  nor_206_nl <= NOT(CONV_SL_1_1(COMP_LOOP_2_tmp_mul_idiv_sva(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1100"))
      OR (fsm_output(3)));
  mux_820_nl <= MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output(0));
  mux_821_nl <= MUX_s_1_2_2(nor_204_nl, mux_820_nl, fsm_output(2));
  mux_825_nl <= MUX_s_1_2_2(mux_824_nl, mux_821_nl, fsm_output(1));
  twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_825_nl AND and_dcpl_138;
  nor_197_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")));
  nor_196_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110"))
      OR nand_114_cse);
  mux_827_nl <= MUX_s_1_2_2(nor_196_nl, nor_197_cse, fsm_output(0));
  nor_199_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1101"))
      OR (fsm_output(3)));
  mux_826_nl <= MUX_s_1_2_2(nor_197_cse, nor_199_nl, fsm_output(0));
  mux_828_nl <= MUX_s_1_2_2(mux_827_nl, mux_826_nl, fsm_output(1));
  twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_828_nl AND and_dcpl_138;
  nor_194_cse <= NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(3)));
  and_263_cse <= CONV_SL_1_1(z_out_2(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND (NOT
      (fsm_output(3)));
  nor_192_nl <= NOT((fsm_output(0)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (NOT (fsm_output(3))));
  nor_193_nl <= NOT((NOT (fsm_output(0))) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1110"))
      OR (fsm_output(3)));
  mux_832_nl <= MUX_s_1_2_2(nor_192_nl, nor_193_nl, fsm_output(1));
  mux_830_nl <= MUX_s_1_2_2(and_263_cse, nor_194_cse, fsm_output(0));
  mux_829_nl <= MUX_s_1_2_2(nor_194_cse, and_263_cse, fsm_output(0));
  mux_831_nl <= MUX_s_1_2_2(mux_830_nl, mux_829_nl, fsm_output(1));
  mux_833_nl <= MUX_s_1_2_2(mux_832_nl, mux_831_nl, fsm_output(2));
  twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_833_nl AND and_dcpl_138;
  and_261_cse <= CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111")) AND CONV_SL_1_1(fsm_output(3
      DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  nor_190_nl <= NOT((fsm_output(2)) OR (NOT(CONV_SL_1_1(z_out_2(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))
      AND (fsm_output(3)))));
  mux_835_nl <= MUX_s_1_2_2(nor_190_nl, and_261_cse, fsm_output(0));
  nor_191_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_2(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("1111"))
      OR (fsm_output(3)));
  mux_834_nl <= MUX_s_1_2_2(and_261_cse, nor_191_nl, fsm_output(0));
  mux_836_nl <= MUX_s_1_2_2(mux_835_nl, mux_834_nl, fsm_output(1));
  twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d <= mux_836_nl AND and_dcpl_138;
  nor_625_cse <= NOT((fsm_output(7)) OR (fsm_output(5)));
  and_dcpl_254 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01")) AND
      nor_625_cse;
  and_dcpl_255 <= NOT((fsm_output(4)) OR (fsm_output(0)));
  and_dcpl_257 <= and_dcpl_31 AND and_dcpl_255;
  and_dcpl_258 <= and_dcpl_257 AND and_dcpl_254;
  and_dcpl_260 <= and_dcpl_31 AND (NOT (fsm_output(4))) AND (fsm_output(0));
  and_dcpl_261 <= and_dcpl_260 AND and_dcpl_254;
  and_dcpl_263 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")) AND
      nor_625_cse;
  and_dcpl_264 <= and_dcpl_260 AND and_dcpl_263;
  and_dcpl_266 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND
      nor_625_cse;
  and_dcpl_267 <= and_dcpl_257 AND and_dcpl_266;
  and_dcpl_272 <= (fsm_output(3)) AND (NOT (fsm_output(6))) AND and_dcpl_255 AND
      CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("00")) AND nor_625_cse;
  and_dcpl_273 <= and_dcpl_257 AND and_dcpl_263;
  and_dcpl_274 <= and_dcpl_260 AND and_dcpl_266;
  and_dcpl_283 <= nor_652_cse AND nor_625_cse;
  and_dcpl_284 <= (fsm_output(4)) AND (NOT (fsm_output(0)));
  and_dcpl_286 <= and_dcpl_31 AND and_dcpl_284 AND and_dcpl_283;
  and_dcpl_288 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_289 <= and_dcpl_288 AND (NOT (fsm_output(7))) AND (fsm_output(5));
  and_dcpl_292 <= and_dcpl_53 AND and_dcpl_255 AND and_dcpl_289;
  and_dcpl_295 <= (fsm_output(6)) AND (fsm_output(3)) AND and_dcpl_255 AND and_dcpl_283;
  and_dcpl_298 <= and_dcpl_38 AND and_dcpl_255 AND and_dcpl_289;
  and_dcpl_299 <= (fsm_output(7)) AND (NOT (fsm_output(5)));
  and_dcpl_301 <= and_dcpl_257 AND nor_652_cse AND and_dcpl_299;
  and_dcpl_302 <= and_dcpl_288 AND and_dcpl_299;
  and_dcpl_303 <= and_dcpl_53 AND and_dcpl_284;
  and_dcpl_304 <= and_dcpl_303 AND and_dcpl_302;
  and_dcpl_307 <= and_dcpl_303 AND nor_652_cse AND (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_309 <= and_dcpl_38 AND and_dcpl_284 AND and_dcpl_302;
  and_dcpl_324 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_335 <= (fsm_output(6)) AND (NOT (fsm_output(3))) AND (NOT (fsm_output(4)))
      AND (fsm_output(0)) AND and_dcpl_324 AND (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_348 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("00000010")));
  and_dcpl_356 <= (NOT (fsm_output(7))) AND (fsm_output(5));
  and_dcpl_360 <= and_dcpl_288 AND and_dcpl_356;
  and_541_cse <= and_dcpl_53 AND and_dcpl_284 AND and_dcpl_360;
  and_545_cse <= nor_tmp_16 AND and_dcpl_284 AND nor_652_cse AND nor_625_cse;
  and_548_cse <= (fsm_output(6)) AND (NOT (fsm_output(3))) AND and_dcpl_284 AND and_dcpl_360;
  and_dcpl_373 <= nor_652_cse AND (fsm_output(7)) AND (NOT (fsm_output(5)));
  and_552_cse <= and_dcpl_31 AND and_dcpl_284 AND and_dcpl_373;
  and_556_cse <= and_dcpl_53 AND and_dcpl_255 AND and_dcpl_288 AND (fsm_output(7))
      AND (fsm_output(5));
  and_558_cse <= nor_tmp_16 AND and_dcpl_255 AND and_dcpl_373;
  and_dcpl_421 <= and_dcpl_257 AND and_dcpl_288 AND nor_625_cse;
  and_dcpl_425 <= and_dcpl_257 AND nor_652_cse AND and_dcpl_356;
  COMP_LOOP_tmp_or_45_itm <= and_dcpl_273 OR and_dcpl_274;
  COMP_LOOP_or_17_itm <= (and_dcpl_31 AND and_dcpl_255 AND nor_652_cse AND and_dcpl_356)
      OR and_541_cse OR and_545_cse OR and_548_cse OR and_552_cse OR and_556_cse
      OR and_558_cse;
  COMP_LOOP_tmp_or_28_ssc <= and_dcpl_264 OR and_dcpl_267 OR and_dcpl_272;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_32 AND and_dcpl_29) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
          THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"), z_out_6,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_285_nl, and_tmp_13, fsm_output(1))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_15_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        COMP_LOOP_1_tmp_mul_idiv_sva_0 <= '0';
        COMP_LOOP_3_tmp_mul_idiv_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
      ELSE
        reg_vec_rsc_triosy_0_15_obj_ld_cse <= and_dcpl_38 AND (NOT (fsm_output(4)))
            AND (fsm_output(7)) AND (NOT (fsm_output(0))) AND (fsm_output(2)) AND
            (fsm_output(5)) AND (NOT (fsm_output(1))) AND (NOT (z_out_4(4)));
        reg_ensig_cgo_cse <= mux_842_rmff;
        COMP_LOOP_1_tmp_mul_idiv_sva_0 <= z_out_3(0);
        COMP_LOOP_3_tmp_mul_idiv_sva_2_0 <= z_out_2(2 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      tmp_21_sva_2 <= twiddle_rsc_0_2_i_q_d;
      tmp_21_sva_6 <= twiddle_rsc_0_6_i_q_d;
      tmp_21_sva_11 <= MUX_v_64_2_2(twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_14_i_q_d,
          and_dcpl_133);
      tmp_21_sva_14 <= twiddle_rsc_0_14_i_q_d;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_0_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (VEC_LOOP_j_10_0_sva_9_0_mx0c0 OR (and_dcpl_39 AND and_dcpl_62)) =
          '1' ) THEN
        VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out_5(9 DOWNTO 0)), VEC_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_840, and_tmp_13, fsm_output(1))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(or_1265_nl, nand_241_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_k_10_3_sva_6_0 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), reg_COMP_LOOP_k_10_3_ftd,
            nand_240_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( or_dcpl_55 = '0' ) THEN
        COMP_LOOP_acc_10_cse_10_1_1_sva <= COMP_LOOP_1_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_psp_sva <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( or_dcpl_55 = '0' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_5_tmp_mul_idiv_sva <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( or_dcpl_55 = '0' ) THEN
        COMP_LOOP_5_tmp_mul_idiv_sva <= z_out_2(7 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_55 = '0' ) THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= z_out_5(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_55 = '0' ) THEN
        COMP_LOOP_1_tmp_acc_cse_sva <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_305_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_62_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_185_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_64_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_65_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_66_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_6_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_68_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_69_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_70_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_10_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_72_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_12_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_13_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_14_itm <= '0';
      ELSIF ( mux_873_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_itm <= NOT((COMP_LOOP_acc_psp_sva_mx0w0(0)) OR CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_305_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_6_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_62_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
        COMP_LOOP_COMP_LOOP_and_185_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_4_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_64_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
        COMP_LOOP_COMP_LOOP_and_65_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_66_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
        COMP_LOOP_COMP_LOOP_and_6_itm <= CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2 DOWNTO
            0)=STD_LOGIC_VECTOR'("111")) AND (NOT (COMP_LOOP_acc_psp_sva_mx0w0(0)));
        COMP_LOOP_COMP_LOOP_and_68_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
        COMP_LOOP_COMP_LOOP_and_69_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
        COMP_LOOP_COMP_LOOP_and_70_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
        COMP_LOOP_COMP_LOOP_and_10_itm <= (COMP_LOOP_acc_psp_sva_mx0w0(0)) AND CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_COMP_LOOP_and_72_itm <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
        COMP_LOOP_COMP_LOOP_and_12_itm <= (COMP_LOOP_acc_psp_sva_mx0w0(0)) AND CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_COMP_LOOP_and_13_itm <= (COMP_LOOP_acc_psp_sva_mx0w0(0)) AND CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_COMP_LOOP_and_14_itm <= (COMP_LOOP_acc_psp_sva_mx0w0(0)) AND CONV_SL_1_1(VEC_LOOP_j_10_0_sva_9_0(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_6_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_879_nl, mux_tmp_857, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_6_sva <= COMP_LOOP_acc_1_cse_6_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_4_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (mux_884_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_4_sva <= COMP_LOOP_acc_1_cse_4_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_887_nl AND and_dcpl_4)) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= COMP_LOOP_acc_1_cse_2_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_2_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT((NOT mux_889_nl) AND and_dcpl_4)) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_2_sva <= COMP_LOOP_2_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_891_nl) AND and_dcpl_4)) = '1' ) THEN
        COMP_LOOP_3_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_3_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_5_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_5_itm <= NOT(CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_51_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_nor_51_itm <= NOT(CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3 DOWNTO
            1)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_52_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_nor_52_itm <= NOT((COMP_LOOP_2_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_2_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_2_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_77_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_77_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_54_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_nor_54_itm <= NOT((COMP_LOOP_2_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_2_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_2_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_79_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_79_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_80_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_80_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_81_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_81_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_57_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_nor_57_itm <= NOT(CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(2 DOWNTO
            0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_83_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_83_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_84_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_84_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_85_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_85_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_86_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_86_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_87_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_87_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_88_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_88_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_89_itm <= '0';
      ELSIF ( and_dcpl_200 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_89_itm <= CONV_SL_1_1(COMP_LOOP_2_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_11_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (mux_899_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_11_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0(9
            DOWNTO 1)) + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "01")),
            9));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_3_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (mux_902_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_3_sva <= COMP_LOOP_3_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_905_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_slc_COMP_LOOP_acc_12_8_itm <= COMP_LOOP_acc_12_nl(8);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_9_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_9_itm <= NOT(CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_91_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_nor_91_itm <= NOT(CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3 DOWNTO
            1)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_92_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_nor_92_itm <= NOT((COMP_LOOP_3_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_3_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_3_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_137_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_137_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_94_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_nor_94_itm <= NOT((COMP_LOOP_3_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_3_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_3_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_139_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_139_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_140_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_140_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_141_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_141_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_97_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_nor_97_itm <= NOT(CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(2 DOWNTO
            0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_143_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_143_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_144_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_144_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_145_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_145_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_146_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_146_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_147_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_147_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_148_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_148_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_149_itm <= '0';
      ELSIF ( and_dcpl_204 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_149_itm <= CONV_SL_1_1(COMP_LOOP_3_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_4_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (mux_909_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_4_sva <= COMP_LOOP_4_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_912_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_5_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_5_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_13_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_13_itm <= NOT(CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_131_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_nor_131_itm <= NOT(CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_132_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_nor_132_itm <= NOT((COMP_LOOP_4_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_4_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_4_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_197_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_197_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_134_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_nor_134_itm <= NOT((COMP_LOOP_4_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_4_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_4_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_199_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_199_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_200_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_200_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_201_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_201_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_137_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_nor_137_itm <= NOT(CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_203_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_203_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_204_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_204_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_205_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_205_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_206_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_206_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_207_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_207_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_208_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_208_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_209_itm <= '0';
      ELSIF ( and_dcpl_207 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_209_itm <= CONV_SL_1_1(COMP_LOOP_4_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_13_psp_sva <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (MUX_s_1_2_2(mux_922_nl, mux_tmp_900, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_13_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0(9
            DOWNTO 2)) + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & '1'), 8));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_5_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_925_nl, mux_tmp_900, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_5_sva <= COMP_LOOP_5_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_909, mux_tmp_900, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_6_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_6_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_17_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_nor_17_itm <= NOT(CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_171_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_nor_171_itm <= NOT(CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_172_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_nor_172_itm <= NOT((COMP_LOOP_5_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_5_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_5_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_257_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_257_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_174_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_nor_174_itm <= NOT((COMP_LOOP_5_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_5_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_5_acc_10_itm_10_1_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_259_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_259_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_260_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_260_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_261_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_261_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_nor_177_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_nor_177_itm <= NOT(CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_263_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_263_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_264_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_264_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_265_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_265_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_266_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_266_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_267_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_267_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_268_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_268_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_and_269_itm <= '0';
      ELSIF ( and_dcpl_208 = '0' ) THEN
        COMP_LOOP_COMP_LOOP_and_269_itm <= CONV_SL_1_1(COMP_LOOP_5_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_6_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_932_nl, mux_tmp_857, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_6_sva <= COMP_LOOP_6_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_916, mux_tmp_857, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_7_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_7_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_21_itm <= '0';
        COMP_LOOP_nor_211_itm <= '0';
        COMP_LOOP_nor_212_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_317_itm <= '0';
        COMP_LOOP_nor_214_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_319_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_320_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_321_itm <= '0';
        COMP_LOOP_nor_217_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_323_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_324_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_325_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_326_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_327_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_328_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_329_itm <= '0';
      ELSIF ( mux_939_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_21_itm <= NOT(CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
        COMP_LOOP_nor_211_itm <= NOT(CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_nor_212_itm <= NOT((COMP_LOOP_6_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_6_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_6_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_317_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
        COMP_LOOP_nor_214_itm <= NOT((COMP_LOOP_6_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_6_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_6_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_319_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
        COMP_LOOP_COMP_LOOP_and_320_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_321_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
        COMP_LOOP_nor_217_itm <= NOT(CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_323_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
        COMP_LOOP_COMP_LOOP_and_324_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
        COMP_LOOP_COMP_LOOP_and_325_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
        COMP_LOOP_COMP_LOOP_and_326_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
        COMP_LOOP_COMP_LOOP_and_327_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
        COMP_LOOP_COMP_LOOP_and_328_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
        COMP_LOOP_COMP_LOOP_and_329_itm <= CONV_SL_1_1(COMP_LOOP_6_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_14_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_942_nl, mux_tmp_921, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_14_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0(9
            DOWNTO 1)) + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "11")),
            9));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_7_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_944_nl, mux_tmp_921, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_7_sva <= COMP_LOOP_7_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_946_itm = '1' ) THEN
        COMP_LOOP_slc_COMP_LOOP_acc_15_7_itm <= COMP_LOOP_acc_15_nl(7);
        reg_COMP_LOOP_k_10_3_ftd <= z_out_4(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_25_itm <= '0';
        COMP_LOOP_nor_251_itm <= '0';
        COMP_LOOP_nor_252_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_377_itm <= '0';
        COMP_LOOP_nor_254_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_379_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_380_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_381_itm <= '0';
        COMP_LOOP_nor_257_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_383_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_384_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_385_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_386_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_387_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_388_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_389_itm <= '0';
      ELSIF ( mux_948_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_25_itm <= NOT(CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
        COMP_LOOP_nor_251_itm <= NOT(CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_nor_252_itm <= NOT((COMP_LOOP_7_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_7_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_7_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_377_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
        COMP_LOOP_nor_254_itm <= NOT((COMP_LOOP_7_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_7_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_7_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_379_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
        COMP_LOOP_COMP_LOOP_and_380_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_381_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
        COMP_LOOP_nor_257_itm <= NOT(CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_383_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
        COMP_LOOP_COMP_LOOP_and_384_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
        COMP_LOOP_COMP_LOOP_and_385_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
        COMP_LOOP_COMP_LOOP_and_386_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
        COMP_LOOP_COMP_LOOP_and_387_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
        COMP_LOOP_COMP_LOOP_and_388_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
        COMP_LOOP_COMP_LOOP_and_389_itm <= CONV_SL_1_1(COMP_LOOP_7_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_951_nl, mux_tmp_930, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
            + UNSIGNED(COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'( "111")), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_225_nl, mux_tmp_930, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_8_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_840, mux_tmp_930, fsm_output(1))) = '1' ) THEN
        COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_1_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_COMP_LOOP_nor_29_itm <= '0';
        COMP_LOOP_nor_291_itm <= '0';
        COMP_LOOP_nor_292_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_437_itm <= '0';
        COMP_LOOP_nor_294_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_439_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_440_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_441_itm <= '0';
        COMP_LOOP_nor_297_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_443_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_444_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_445_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_446_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_447_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_448_itm <= '0';
        COMP_LOOP_COMP_LOOP_and_449_itm <= '0';
      ELSIF ( mux_958_itm = '1' ) THEN
        COMP_LOOP_COMP_LOOP_nor_29_itm <= NOT(CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
        COMP_LOOP_nor_291_itm <= NOT(CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_nor_292_itm <= NOT((COMP_LOOP_8_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_8_acc_10_itm_10_1_1(2))
            OR (COMP_LOOP_8_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_437_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0011"));
        COMP_LOOP_nor_294_itm <= NOT((COMP_LOOP_8_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_8_acc_10_itm_10_1_1(1))
            OR (COMP_LOOP_8_acc_10_itm_10_1_1(0)));
        COMP_LOOP_COMP_LOOP_and_439_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0101"));
        COMP_LOOP_COMP_LOOP_and_440_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0110"));
        COMP_LOOP_COMP_LOOP_and_441_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("0111"));
        COMP_LOOP_nor_297_itm <= NOT(CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_COMP_LOOP_and_443_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1001"));
        COMP_LOOP_COMP_LOOP_and_444_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1010"));
        COMP_LOOP_COMP_LOOP_and_445_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1011"));
        COMP_LOOP_COMP_LOOP_and_446_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1100"));
        COMP_LOOP_COMP_LOOP_and_447_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
        COMP_LOOP_COMP_LOOP_and_448_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1110"));
        COMP_LOOP_COMP_LOOP_and_449_itm <= CONV_SL_1_1(COMP_LOOP_8_acc_10_itm_10_1_1(3
            DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= '0';
      ELSIF ( COMP_LOOP_tmp_or_cse = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_17_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl,
            STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50 & COMP_LOOP_or_35_cse &
            and_dcpl_129 & and_dcpl_130));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_19_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl,
            STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50 & COMP_LOOP_or_35_cse &
            and_dcpl_129 & and_dcpl_130));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_20_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl,
            STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50 & COMP_LOOP_or_35_cse &
            and_dcpl_129 & and_dcpl_130));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= '0';
      ELSIF ( COMP_LOOP_tmp_or_3_cse = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_21_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse,
            STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50 & and_dcpl_128 & and_dcpl_129
            & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm <= MUX1HOT_s_1_5_2(COMP_LOOP_COMP_LOOP_and_23_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse,
            STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50 & and_dcpl_128 & and_dcpl_129
            & COMP_LOOP_or_34_cse));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm <= '0';
        COMP_LOOP_tmp_nor_1_itm <= '0';
        COMP_LOOP_tmp_nor_14_itm <= '0';
        COMP_LOOP_tmp_nor_16_itm <= '0';
        COMP_LOOP_tmp_nor_19_itm <= '0';
      ELSIF ( COMP_LOOP_tmp_or_5_cse = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_24_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_24_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_25_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_26_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_26_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_27_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_27_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_28_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_28_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_30_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm <= MUX1HOT_s_1_4_2(COMP_LOOP_COMP_LOOP_and_29_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_31_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & and_dcpl_129 & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_COMP_LOOP_nor_1_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse, COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_cse,
            STD_LOGIC_VECTOR'( and_dcpl_47 & COMP_LOOP_or_25_cse & COMP_LOOP_or_34_cse));
        COMP_LOOP_tmp_nor_1_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_11_nl, COMP_LOOP_tmp_nor_1_cse,
            COMP_LOOP_tmp_nor_13_cse, STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50
            & COMP_LOOP_or_24_cse));
        COMP_LOOP_tmp_nor_14_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_12_nl, COMP_LOOP_tmp_nor_3_cse,
            COMP_LOOP_tmp_nor_1_cse, STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50
            & COMP_LOOP_or_24_cse));
        COMP_LOOP_tmp_nor_16_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_14_nl, COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse,
            COMP_LOOP_tmp_nor_3_cse, STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_50
            & COMP_LOOP_or_24_cse));
        COMP_LOOP_tmp_nor_19_itm <= MUX1HOT_s_1_3_2(COMP_LOOP_nor_17_nl, COMP_LOOP_tmp_nor_13_cse,
            COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse, STD_LOGIC_VECTOR'( and_dcpl_47
            & and_dcpl_50 & COMP_LOOP_or_24_cse));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_214 AND and_dcpl_211 AND (fsm_output(1)) AND (NOT COMP_LOOP_1_tmp_mul_idiv_sva_0))
          OR COMP_LOOP_tmp_mux_itm_mx0c1) = '1' ) THEN
        COMP_LOOP_tmp_mux_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_8_i_q_d,
            COMP_LOOP_tmp_mux_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_2_tmp_mul_idiv_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (and_dcpl_50 OR and_dcpl_129 OR and_dcpl_130) = '1' ) THEN
        COMP_LOOP_2_tmp_mul_idiv_sva <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_2_tmp_lshift_ncse_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (and_dcpl_50 OR and_dcpl_133) = '1' ) THEN
        COMP_LOOP_2_tmp_lshift_ncse_sva <= MUX_v_10_2_2(z_out_1, z_out_2, and_dcpl_133);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_50 OR and_dcpl_128 OR COMP_LOOP_1_acc_8_itm_mx0c2 OR COMP_LOOP_1_acc_8_itm_mx0c3
          OR and_dcpl_58 OR and_dcpl_165 OR and_dcpl_63 OR and_dcpl_167 OR and_dcpl_66
          OR and_dcpl_171 OR and_dcpl_68 OR and_dcpl_174 OR and_dcpl_71 OR and_dcpl_179
          OR and_dcpl_73 OR and_dcpl_182 OR and_dcpl_75 OR and_dcpl_185) = '1' )
          THEN
        COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_19_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
            vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d,
            vec_rsc_0_6_i_q_d, vec_rsc_0_7_i_q_d, vec_rsc_0_8_i_q_d, vec_rsc_0_9_i_q_d,
            vec_rsc_0_10_i_q_d, vec_rsc_0_11_i_q_d, vec_rsc_0_12_i_q_d, vec_rsc_0_13_i_q_d,
            vec_rsc_0_14_i_q_d, vec_rsc_0_15_i_q_d, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_17_nl),
            64)), twiddle_rsc_0_10_i_q_d, COMP_LOOP_1_modulo_dev_cmp_return_rsc_z,
            STD_LOGIC_VECTOR'( COMP_LOOP_or_nl & COMP_LOOP_or_1_nl & COMP_LOOP_or_2_nl
            & COMP_LOOP_or_3_nl & COMP_LOOP_or_4_nl & COMP_LOOP_or_5_nl & COMP_LOOP_or_6_nl
            & COMP_LOOP_or_7_nl & COMP_LOOP_or_8_nl & COMP_LOOP_or_9_nl & COMP_LOOP_or_10_nl
            & COMP_LOOP_or_11_nl & COMP_LOOP_or_12_nl & COMP_LOOP_or_13_nl & COMP_LOOP_or_14_nl
            & COMP_LOOP_or_15_nl & COMP_LOOP_or_20_itm & COMP_LOOP_1_acc_8_itm_mx0c2
            & COMP_LOOP_1_acc_8_itm_mx0c3));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_3_tmp_lshift_ncse_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( COMP_LOOP_or_35_cse = '1' ) THEN
        COMP_LOOP_3_tmp_lshift_ncse_sva <= MUX_v_9_2_2((z_out_1(8 DOWNTO 0)), (z_out_2(8
            DOWNTO 0)), and_dcpl_131);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( and_237_tmp = '0' ) THEN
        COMP_LOOP_tmp_mux1h_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d,
            twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d,
            twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_9_i_q_d, twiddle_rsc_0_10_i_q_d,
            twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_12_i_q_d, twiddle_rsc_0_13_i_q_d,
            twiddle_rsc_0_14_i_q_d, twiddle_rsc_0_15_i_q_d, STD_LOGIC_VECTOR'( COMP_LOOP_tmp_and_63_nl
            & COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl
            & COMP_LOOP_tmp_and_64_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl & COMP_LOOP_tmp_and_65_nl
            & COMP_LOOP_tmp_and_66_nl & COMP_LOOP_tmp_and_67_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl
            & COMP_LOOP_tmp_and_68_nl & COMP_LOOP_tmp_and_69_nl & COMP_LOOP_tmp_and_70_nl
            & COMP_LOOP_tmp_and_71_nl & COMP_LOOP_tmp_and_72_nl & COMP_LOOP_tmp_and_73_nl
            & COMP_LOOP_tmp_and_74_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( nor_568_tmp = '0' ) THEN
        COMP_LOOP_tmp_mux1h_1_itm <= MUX1HOT_v_64_8_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
            twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_8_i_q_d,
            twiddle_rsc_0_10_i_q_d, twiddle_rsc_0_12_i_q_d, twiddle_rsc_0_14_i_q_d,
            STD_LOGIC_VECTOR'( COMP_LOOP_tmp_and_58_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl
            & COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl & COMP_LOOP_tmp_and_59_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl
            & COMP_LOOP_tmp_and_60_nl & COMP_LOOP_tmp_and_61_nl & COMP_LOOP_tmp_and_62_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( nor_tmp_180 = '0' ) THEN
        COMP_LOOP_tmp_mux1h_2_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d,
            twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d,
            twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_9_i_q_d, twiddle_rsc_0_10_i_q_d,
            twiddle_rsc_0_11_i_q_d, twiddle_rsc_0_12_i_q_d, twiddle_rsc_0_13_i_q_d,
            twiddle_rsc_0_14_i_q_d, twiddle_rsc_0_15_i_q_d, STD_LOGIC_VECTOR'( COMP_LOOP_tmp_and_42_nl
            & COMP_LOOP_tmp_and_43_nl & COMP_LOOP_tmp_and_44_nl & COMP_LOOP_tmp_and_45_nl
            & COMP_LOOP_tmp_and_46_nl & COMP_LOOP_tmp_and_47_nl & COMP_LOOP_tmp_and_48_nl
            & COMP_LOOP_tmp_and_49_nl & COMP_LOOP_tmp_and_50_nl & COMP_LOOP_tmp_and_51_nl
            & COMP_LOOP_tmp_and_52_nl & COMP_LOOP_tmp_and_53_nl & COMP_LOOP_tmp_and_54_nl
            & COMP_LOOP_tmp_and_55_nl & COMP_LOOP_tmp_and_56_nl & COMP_LOOP_tmp_and_57_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm <= '0';
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm <= '0';
      ELSIF ( COMP_LOOP_or_34_cse = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_cse;
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_cse;
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm <= '0';
      ELSIF ( (and_dcpl_130 OR and_dcpl_131) = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm <= MUX_s_1_2_2(COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl,
            COMP_LOOP_tmp_COMP_LOOP_tmp_and_21_cse, and_dcpl_131);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( and_240_tmp = '0' ) THEN
        COMP_LOOP_tmp_mux1h_3_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_4_i_q_d,
            twiddle_rsc_0_8_i_q_d, twiddle_rsc_0_12_i_q_d, STD_LOGIC_VECTOR'( COMP_LOOP_tmp_and_38_nl
            & COMP_LOOP_tmp_and_39_nl & COMP_LOOP_tmp_and_40_nl & COMP_LOOP_tmp_and_41_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT((COMP_LOOP_2_tmp_lshift_ncse_sva(0)) AND COMP_LOOP_tmp_nor_1_itm))
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm OR tmp_21_sva_1_mx0c0 OR and_dcpl_133)
          AND mux_1009_nl) = '1' ) THEN
        tmp_21_sva_1 <= MUX1HOT_v_64_17_2(twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_6_i_q_d,
            twiddle_rsc_0_0_i_q_d, tmp_21_sva_2, tmp_21_sva_3, twiddle_rsc_0_4_i_q_d,
            tmp_21_sva_5, tmp_21_sva_6, tmp_21_sva_7, twiddle_rsc_0_8_i_q_d, tmp_21_sva_9,
            COMP_LOOP_1_acc_8_itm, tmp_21_sva_11, twiddle_rsc_0_12_i_q_d, tmp_21_sva_13,
            tmp_21_sva_14, tmp_21_sva_15, STD_LOGIC_VECTOR'( tmp_21_sva_1_mx0c0 &
            and_dcpl_133 & COMP_LOOP_tmp_and_23_nl & COMP_LOOP_tmp_and_24_nl & COMP_LOOP_tmp_and_25_nl
            & COMP_LOOP_tmp_and_26_nl & COMP_LOOP_tmp_and_27_nl & COMP_LOOP_tmp_and_28_nl
            & COMP_LOOP_tmp_and_29_nl & COMP_LOOP_tmp_and_30_nl & COMP_LOOP_tmp_and_31_nl
            & COMP_LOOP_tmp_and_32_nl & COMP_LOOP_tmp_and_33_nl & COMP_LOOP_tmp_and_34_nl
            & COMP_LOOP_tmp_and_35_nl & COMP_LOOP_tmp_and_36_nl & COMP_LOOP_tmp_and_37_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm = '1' ) THEN
        tmp_21_sva_3 <= twiddle_rsc_0_3_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm = '1' ) THEN
        tmp_21_sva_5 <= twiddle_rsc_0_5_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm = '1' ) THEN
        tmp_21_sva_7 <= twiddle_rsc_0_7_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm = '1' ) THEN
        tmp_21_sva_9 <= twiddle_rsc_0_9_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm = '1' ) THEN
        tmp_21_sva_13 <= twiddle_rsc_0_13_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm = '1' ) THEN
        tmp_21_sva_15 <= twiddle_rsc_0_15_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm <= '0';
      ELSIF ( (NOT(or_tmp_1059 OR (NOT and_334_cse) OR or_tmp_1076)) = '1' ) THEN
        COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_1_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_1017_tmp = '1' ) THEN
        COMP_LOOP_tmp_mux1h_4_itm <= MUX1HOT_v_64_16_2(twiddle_rsc_0_0_i_q_d, tmp_21_sva_1,
            tmp_21_sva_2, tmp_21_sva_3, twiddle_rsc_0_4_i_q_d, tmp_21_sva_5, tmp_21_sva_6,
            tmp_21_sva_7, twiddle_rsc_0_8_i_q_d, tmp_21_sva_9, COMP_LOOP_1_acc_8_itm,
            tmp_21_sva_11, twiddle_rsc_0_12_i_q_d, tmp_21_sva_13, tmp_21_sva_14,
            tmp_21_sva_15, STD_LOGIC_VECTOR'( COMP_LOOP_tmp_and_7_nl & COMP_LOOP_tmp_and_8_nl
            & COMP_LOOP_tmp_and_9_nl & COMP_LOOP_tmp_and_10_nl & COMP_LOOP_tmp_and_11_nl
            & COMP_LOOP_tmp_and_12_nl & COMP_LOOP_tmp_and_13_nl & COMP_LOOP_tmp_and_14_nl
            & COMP_LOOP_tmp_and_15_nl & COMP_LOOP_tmp_and_16_nl & COMP_LOOP_tmp_and_17_nl
            & COMP_LOOP_tmp_and_18_nl & COMP_LOOP_tmp_and_19_nl & COMP_LOOP_tmp_and_20_nl
            & COMP_LOOP_tmp_and_21_nl & COMP_LOOP_tmp_and_22_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT(CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO 0)=STD_LOGIC_VECTOR'("001"))))
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm
          OR COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm OR and_dcpl_133) AND mux_1021_nl)
          = '1' ) THEN
        COMP_LOOP_tmp_mux1h_5_itm <= MUX1HOT_v_64_8_2(twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_0_i_q_d,
            twiddle_rsc_0_4_i_q_d, tmp_21_sva_1, twiddle_rsc_0_8_i_q_d, COMP_LOOP_1_acc_8_itm,
            twiddle_rsc_0_12_i_q_d, tmp_21_sva_11, STD_LOGIC_VECTOR'( and_dcpl_133
            & COMP_LOOP_tmp_and_nl & COMP_LOOP_tmp_and_1_nl & COMP_LOOP_tmp_and_2_nl
            & COMP_LOOP_tmp_and_3_nl & COMP_LOOP_tmp_and_4_nl & COMP_LOOP_tmp_and_5_nl
            & COMP_LOOP_tmp_and_6_nl));
      END IF;
    END IF;
  END PROCESS;
  mux_284_nl <= MUX_s_1_2_2(and_tmp_12, and_344_cse, and_334_cse);
  mux_285_nl <= MUX_s_1_2_2(not_tmp_120, mux_284_nl, fsm_output(5));
  VEC_LOOP_j_not_1_nl <= NOT VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  and_335_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("111"));
  mux_858_nl <= MUX_s_1_2_2(not_tmp_371, and_335_nl, fsm_output(1));
  nand_240_nl <= NOT(mux_858_nl AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_48);
  or_1265_nl <= (fsm_output(7)) OR (fsm_output(5)) OR nor_652_cse OR CONV_SL_1_1(fsm_output(4
      DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  nor_653_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000")));
  mux_1022_nl <= MUX_s_1_2_2(or_170_cse_1, nor_653_nl, fsm_output(5));
  or_1266_nl <= (CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))) OR
      CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  nor_654_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000")));
  mux_nl <= MUX_s_1_2_2(or_1266_nl, nor_654_nl, fsm_output(5));
  mux_1023_nl <= MUX_s_1_2_2(mux_1022_nl, mux_nl, fsm_output(0));
  nand_241_nl <= NOT((fsm_output(7)) AND mux_1023_nl);
  mux_135_nl <= MUX_s_1_2_2(nor_tmp_42, and_364_cse, or_93_cse);
  mux_879_nl <= MUX_s_1_2_2(mux_tmp_859, mux_135_nl, fsm_output(5));
  mux_882_nl <= MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, or_93_cse);
  mux_883_nl <= MUX_s_1_2_2(not_tmp_39, mux_882_nl, fsm_output(5));
  mux_884_nl <= MUX_s_1_2_2(mux_883_nl, mux_tmp_862, fsm_output(1));
  nand_232_nl <= NOT(or_93_cse AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")));
  mux_21_nl <= MUX_s_1_2_2(or_1233_cse, nand_232_nl, fsm_output(5));
  mux_887_nl <= MUX_s_1_2_2(mux_21_nl, (NOT mux_tmp_866), fsm_output(1));
  mux_23_nl <= MUX_s_1_2_2((NOT or_1233_cse), nor_tmp, fsm_output(5));
  mux_889_nl <= MUX_s_1_2_2(mux_23_nl, mux_tmp_866, fsm_output(1));
  COMP_LOOP_3_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0
      & STD_LOGIC_VECTOR'( "010")), 10), 11) + SIGNED'( "00000000001"), 11));
  mux_891_nl <= MUX_s_1_2_2(mux_tmp_6, mux_tmp_866, fsm_output(1));
  mux_896_nl <= MUX_s_1_2_2(nor_tmp_15, nor_tmp_13, fsm_output(0));
  mux_897_nl <= MUX_s_1_2_2(mux_tmp_873, mux_896_nl, fsm_output(2));
  mux_898_nl <= MUX_s_1_2_2(mux_897_nl, (fsm_output(6)), fsm_output(5));
  mux_899_nl <= MUX_s_1_2_2(mux_898_nl, mux_tmp_876, fsm_output(1));
  mux_900_nl <= MUX_s_1_2_2(mux_tmp_873, nor_tmp_13, fsm_output(2));
  mux_901_nl <= MUX_s_1_2_2(mux_900_nl, (fsm_output(6)), fsm_output(5));
  mux_902_nl <= MUX_s_1_2_2(mux_901_nl, mux_tmp_876, fsm_output(1));
  COMP_LOOP_acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 3)))) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0
      & '0'), 8), 9) + UNSIGNED'( "000000001"), 9));
  mux_905_nl <= MUX_s_1_2_2(mux_tmp_885, mux_tmp_876, fsm_output(1));
  mux_82_nl <= MUX_s_1_2_2(not_tmp_39, nor_tmp_13, fsm_output(5));
  mux_909_nl <= MUX_s_1_2_2(mux_82_nl, mux_tmp_862, fsm_output(1));
  COMP_LOOP_5_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0
      & STD_LOGIC_VECTOR'( "100")), 10), 11) + SIGNED'( "00000000001"), 11));
  mux_912_nl <= MUX_s_1_2_2(mux_85_cse, mux_tmp_862, fsm_output(1));
  mux_920_nl <= MUX_s_1_2_2(nor_tmp_42, and_364_cse, fsm_output(0));
  mux_921_nl <= MUX_s_1_2_2(mux_tmp_897, mux_920_nl, fsm_output(2));
  mux_922_nl <= MUX_s_1_2_2(mux_921_nl, (fsm_output(7)), fsm_output(5));
  mux_924_nl <= MUX_s_1_2_2(mux_tmp_897, and_364_cse, fsm_output(2));
  mux_925_nl <= MUX_s_1_2_2(mux_924_nl, (fsm_output(7)), fsm_output(5));
  COMP_LOOP_6_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0
      & STD_LOGIC_VECTOR'( "101")), 10), 11) + SIGNED'( "00000000001"), 11));
  mux_932_nl <= MUX_s_1_2_2(mux_tmp_859, and_364_cse, fsm_output(5));
  COMP_LOOP_7_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0
      & STD_LOGIC_VECTOR'( "110")), 10), 11) + SIGNED'( "00000000001"), 11));
  mux_941_nl <= MUX_s_1_2_2(mux_tmp_848, mux_tmp_847, fsm_output(2));
  mux_942_nl <= MUX_s_1_2_2(mux_941_nl, and_344_cse, fsm_output(5));
  mux_944_nl <= MUX_s_1_2_2(mux_tmp_848, and_344_cse, or_41_cse);
  COMP_LOOP_acc_15_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 4)))) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_3_sva_6_0),
      7), 8) + UNSIGNED'( "00000001"), 8));
  mux_950_nl <= MUX_s_1_2_2(and_tmp_12, and_344_cse, or_93_cse);
  mux_951_nl <= MUX_s_1_2_2(nor_543_cse, mux_950_nl, fsm_output(5));
  mux_225_nl <= MUX_s_1_2_2(nor_543_cse, and_344_cse, fsm_output(5));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_4 & STD_LOGIC_VECTOR'(
      "000")) + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)))) + SIGNED'(
      "00000000001"), 11));
  COMP_LOOP_COMP_LOOP_and_17_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("0011"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_17_nl <= CONV_SL_1_1(z_out_2(2 DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_37_nl <= CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  COMP_LOOP_COMP_LOOP_and_19_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("0101"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_19_nl <= CONV_SL_1_1(z_out_2(2 DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_38_nl <= CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  COMP_LOOP_COMP_LOOP_and_20_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("0110"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_20_nl <= CONV_SL_1_1(z_out_2(2 DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_39_nl <= CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_COMP_LOOP_and_21_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("0111"));
  COMP_LOOP_COMP_LOOP_and_23_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1001"));
  COMP_LOOP_COMP_LOOP_and_24_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1010"));
  COMP_LOOP_COMP_LOOP_and_25_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1011"));
  COMP_LOOP_COMP_LOOP_and_26_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1100"));
  COMP_LOOP_COMP_LOOP_and_27_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1101"));
  COMP_LOOP_COMP_LOOP_and_28_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1110"));
  COMP_LOOP_COMP_LOOP_and_29_nl <= CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO
      0)=STD_LOGIC_VECTOR'("1111"));
  COMP_LOOP_COMP_LOOP_nor_1_nl <= NOT(CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3
      DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
  COMP_LOOP_nor_11_nl <= NOT(CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  COMP_LOOP_nor_12_nl <= NOT((COMP_LOOP_1_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_1_acc_10_itm_10_1_1(2))
      OR (COMP_LOOP_1_acc_10_itm_10_1_1(0)));
  COMP_LOOP_nor_14_nl <= NOT((COMP_LOOP_1_acc_10_itm_10_1_1(3)) OR (COMP_LOOP_1_acc_10_itm_10_1_1(1))
      OR (COMP_LOOP_1_acc_10_itm_10_1_1(0)));
  COMP_LOOP_nor_17_nl <= NOT(CONV_SL_1_1(COMP_LOOP_1_acc_10_itm_10_1_1(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
  COMP_LOOP_COMP_LOOP_mux_2_nl <= MUX_v_64_2_2(COMP_LOOP_1_acc_8_itm, z_out_9, COMP_LOOP_or_17_itm);
  COMP_LOOP_acc_17_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_209_cse)
      + UNSIGNED(COMP_LOOP_COMP_LOOP_mux_2_nl), 64));
  COMP_LOOP_or_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_14_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_13_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_12_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_72_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_10_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_70_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_69_itm AND and_dcpl_75);
  COMP_LOOP_or_1_nl <= ((COMP_LOOP_acc_10_cse_10_1_1_sva(0)) AND COMP_LOOP_tmp_nor_1_itm
      AND and_dcpl_50) OR (COMP_LOOP_COMP_LOOP_nor_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_14_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_13_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_12_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_72_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_10_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_70_itm AND and_dcpl_75);
  COMP_LOOP_or_2_nl <= ((COMP_LOOP_acc_10_cse_10_1_1_sva(1)) AND COMP_LOOP_tmp_nor_14_itm
      AND and_dcpl_50) OR (COMP_LOOP_COMP_LOOP_and_305_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_nor_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_14_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_13_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_12_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_72_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_10_itm AND and_dcpl_75);
  COMP_LOOP_or_3_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_62_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_305_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_nor_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_14_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_13_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_12_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_72_itm AND and_dcpl_75);
  COMP_LOOP_or_4_nl <= ((COMP_LOOP_acc_10_cse_10_1_1_sva(2)) AND COMP_LOOP_tmp_nor_16_itm
      AND and_dcpl_50) OR (COMP_LOOP_COMP_LOOP_and_185_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_62_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_305_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_nor_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_14_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_13_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_12_itm AND and_dcpl_75);
  COMP_LOOP_or_5_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_64_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_185_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_62_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_305_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_nor_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_14_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_13_itm AND and_dcpl_75);
  COMP_LOOP_or_6_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_65_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_64_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_185_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_62_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_305_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_nor_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_14_itm AND and_dcpl_75);
  COMP_LOOP_or_7_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_66_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_65_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_64_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_185_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_62_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_305_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_nor_itm AND and_dcpl_75);
  COMP_LOOP_or_8_nl <= ((COMP_LOOP_acc_10_cse_10_1_1_sva(3)) AND COMP_LOOP_tmp_nor_19_itm
      AND and_dcpl_50) OR (COMP_LOOP_COMP_LOOP_and_6_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_66_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_65_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_64_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_185_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_62_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_305_itm AND and_dcpl_75);
  COMP_LOOP_or_9_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_68_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_6_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_66_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_65_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_64_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_185_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_62_itm AND and_dcpl_75);
  COMP_LOOP_or_10_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm AND and_dcpl_50) OR
      (COMP_LOOP_COMP_LOOP_and_69_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_68_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_6_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_66_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_65_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_64_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_185_itm AND and_dcpl_75);
  COMP_LOOP_or_11_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm AND and_dcpl_50)
      OR (COMP_LOOP_COMP_LOOP_and_70_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_69_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_68_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_6_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_66_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_65_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_64_itm AND and_dcpl_75);
  COMP_LOOP_or_12_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm AND and_dcpl_50)
      OR (COMP_LOOP_COMP_LOOP_and_10_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_70_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_69_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_68_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_6_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_66_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_65_itm AND and_dcpl_75);
  COMP_LOOP_or_13_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm AND and_dcpl_50)
      OR (COMP_LOOP_COMP_LOOP_and_72_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_10_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_70_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_69_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_68_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_6_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_66_itm AND and_dcpl_75);
  COMP_LOOP_or_14_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm AND and_dcpl_50)
      OR (COMP_LOOP_COMP_LOOP_and_12_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_72_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_10_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_70_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_69_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_68_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_6_itm AND and_dcpl_75);
  COMP_LOOP_or_15_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm AND and_dcpl_50)
      OR (COMP_LOOP_COMP_LOOP_and_13_itm AND and_dcpl_58) OR (COMP_LOOP_COMP_LOOP_and_12_itm
      AND and_dcpl_63) OR (COMP_LOOP_COMP_LOOP_and_72_itm AND and_dcpl_66) OR (COMP_LOOP_COMP_LOOP_and_10_itm
      AND and_dcpl_68) OR (COMP_LOOP_COMP_LOOP_and_70_itm AND and_dcpl_71) OR (COMP_LOOP_COMP_LOOP_and_69_itm
      AND and_dcpl_73) OR (COMP_LOOP_COMP_LOOP_and_68_itm AND and_dcpl_75);
  COMP_LOOP_tmp_and_63_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_nl <= (COMP_LOOP_2_tmp_mul_idiv_sva(0)) AND COMP_LOOP_tmp_nor_19_itm
      AND (NOT and_237_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_1_nl <= (COMP_LOOP_2_tmp_mul_idiv_sva(1)) AND COMP_LOOP_tmp_nor_1_itm
      AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_64_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_3_nl <= (COMP_LOOP_2_tmp_mul_idiv_sva(2)) AND COMP_LOOP_tmp_nor_14_itm
      AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_65_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_66_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_67_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_7_nl <= (COMP_LOOP_2_tmp_mul_idiv_sva(3)) AND COMP_LOOP_tmp_nor_16_itm
      AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_68_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_69_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_70_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_71_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_72_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_73_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_74_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND (NOT and_237_tmp);
  COMP_LOOP_tmp_and_58_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_15_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_mul_idiv_sva_2_0=STD_LOGIC_VECTOR'("001"))
      AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_16_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_mul_idiv_sva_2_0=STD_LOGIC_VECTOR'("010"))
      AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_and_59_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_18_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_mul_idiv_sva_2_0=STD_LOGIC_VECTOR'("100"))
      AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_and_60_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_and_61_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_and_62_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND (NOT nor_568_tmp);
  COMP_LOOP_tmp_and_42_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_43_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_44_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_45_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_46_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_47_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_48_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_49_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_50_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_51_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_52_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_53_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_54_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_55_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_56_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_and_57_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm AND (NOT nor_tmp_180);
  COMP_LOOP_tmp_COMP_LOOP_tmp_nor_3_nl <= NOT(CONV_SL_1_1(COMP_LOOP_5_tmp_mul_idiv_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_tmp_and_38_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm AND (NOT and_240_tmp);
  COMP_LOOP_tmp_and_39_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND (NOT and_240_tmp);
  COMP_LOOP_tmp_and_40_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND (NOT and_240_tmp);
  COMP_LOOP_tmp_and_41_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND (NOT and_240_tmp);
  COMP_LOOP_tmp_and_23_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_24_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_63_rgt AND and_245_m1c;
  COMP_LOOP_tmp_and_25_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_26_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_65_rgt AND and_245_m1c;
  COMP_LOOP_tmp_and_27_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_28_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_29_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_30_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_69_rgt AND and_245_m1c;
  COMP_LOOP_tmp_and_31_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_32_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_33_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_34_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_35_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_36_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm AND and_245_m1c;
  COMP_LOOP_tmp_and_37_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm AND and_245_m1c;
  mux_1007_nl <= MUX_s_1_2_2(mux_tmp_984, mux_tmp_982, fsm_output(2));
  mux_1008_nl <= MUX_s_1_2_2(mux_1007_nl, and_344_cse, fsm_output(5));
  mux_1002_nl <= MUX_s_1_2_2((NOT or_1226_cse), nor_tmp_15, fsm_output(7));
  mux_1004_nl <= MUX_s_1_2_2(mux_tmp_984, mux_1002_nl, fsm_output(0));
  mux_1005_nl <= MUX_s_1_2_2(mux_1004_nl, mux_tmp_982, fsm_output(2));
  mux_1006_nl <= MUX_s_1_2_2(mux_1005_nl, and_344_cse, fsm_output(5));
  mux_1009_nl <= MUX_s_1_2_2(mux_1008_nl, mux_1006_nl, fsm_output(1));
  COMP_LOOP_tmp_and_7_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_4_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_8_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_78 AND mux_1017_tmp;
  COMP_LOOP_tmp_and_9_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_80 AND mux_1017_tmp;
  COMP_LOOP_tmp_and_10_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_13_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_11_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_82 AND mux_1017_tmp;
  COMP_LOOP_tmp_and_12_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_14_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_13_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_2_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_14_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_32_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_15_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_84 AND mux_1017_tmp;
  COMP_LOOP_tmp_and_16_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_33_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_17_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_34_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_18_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_35_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_19_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_36_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_20_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_52_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_21_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_53_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_22_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_54_itm AND mux_1017_tmp;
  COMP_LOOP_tmp_and_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_nor_5_itm AND and_dcpl_135;
  COMP_LOOP_tmp_and_1_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("010")) AND and_dcpl_135;
  COMP_LOOP_tmp_and_2_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_10_itm AND and_dcpl_135;
  COMP_LOOP_tmp_and_3_nl <= CONV_SL_1_1(COMP_LOOP_3_tmp_lshift_ncse_sva(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("100")) AND and_dcpl_135;
  COMP_LOOP_tmp_and_4_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_11_itm AND and_dcpl_135;
  COMP_LOOP_tmp_and_5_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_12_itm AND and_dcpl_135;
  COMP_LOOP_tmp_and_6_nl <= COMP_LOOP_tmp_COMP_LOOP_tmp_and_61_itm AND and_dcpl_135;
  mux_1019_nl <= MUX_s_1_2_2(mux_tmp_994, mux_tmp_855, fsm_output(2));
  mux_1020_nl <= MUX_s_1_2_2(mux_1019_nl, nor_tmp_57, fsm_output(5));
  mux_1018_nl <= MUX_s_1_2_2(mux_tmp_855, nor_tmp_57, fsm_output(5));
  mux_1021_nl <= MUX_s_1_2_2(mux_1020_nl, mux_1018_nl, fsm_output(1));
  COMP_LOOP_tmp_nor_59_cse <= NOT(and_dcpl_258 OR and_dcpl_273 OR and_dcpl_274);
  COMP_LOOP_tmp_mux_11_nl <= MUX_s_1_2_2((z_out_1(9)), (COMP_LOOP_2_tmp_lshift_ncse_sva(9)),
      COMP_LOOP_tmp_or_28_ssc);
  COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl <= COMP_LOOP_tmp_mux_11_nl AND COMP_LOOP_tmp_nor_59_cse;
  COMP_LOOP_tmp_or_50_nl <= and_dcpl_261 OR and_dcpl_273;
  COMP_LOOP_tmp_mux1h_62_nl <= MUX1HOT_v_9_4_2(('0' & (z_out(7 DOWNTO 0))), (z_out_1(8
      DOWNTO 0)), (COMP_LOOP_2_tmp_lshift_ncse_sva(8 DOWNTO 0)), COMP_LOOP_3_tmp_lshift_ncse_sva,
      STD_LOGIC_VECTOR'( and_dcpl_258 & COMP_LOOP_tmp_or_50_nl & COMP_LOOP_tmp_or_28_ssc
      & and_dcpl_274));
  COMP_LOOP_tmp_and_80_nl <= (COMP_LOOP_k_10_3_sva_6_0(6)) AND COMP_LOOP_tmp_nor_59_cse;
  COMP_LOOP_tmp_or_51_nl <= and_dcpl_261 OR and_dcpl_264 OR and_dcpl_267 OR and_dcpl_272;
  COMP_LOOP_tmp_mux1h_63_nl <= MUX1HOT_v_6_3_2(('0' & (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 2))), (COMP_LOOP_k_10_3_sva_6_0(5 DOWNTO 0)), (COMP_LOOP_k_10_3_sva_6_0(6
      DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_258 & COMP_LOOP_tmp_or_51_nl & COMP_LOOP_tmp_or_45_itm));
  COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl <= MUX_s_1_2_2((COMP_LOOP_k_10_3_sva_6_0(1)),
      (COMP_LOOP_k_10_3_sva_6_0(0)), COMP_LOOP_tmp_or_45_itm);
  COMP_LOOP_tmp_or_52_nl <= (COMP_LOOP_tmp_COMP_LOOP_tmp_mux_9_nl AND (NOT(and_dcpl_261
      OR and_dcpl_264))) OR and_dcpl_267 OR and_dcpl_272;
  COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl <= ((COMP_LOOP_k_10_3_sva_6_0(0)) AND (NOT(and_dcpl_261
      OR and_dcpl_267 OR and_dcpl_273))) OR and_dcpl_264 OR and_dcpl_272 OR and_dcpl_274;
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_tmp_COMP_LOOP_tmp_and_86_nl
      & COMP_LOOP_tmp_mux1h_62_nl) * UNSIGNED(COMP_LOOP_tmp_and_80_nl & COMP_LOOP_tmp_mux1h_63_nl
      & COMP_LOOP_tmp_or_52_nl & COMP_LOOP_tmp_COMP_LOOP_tmp_or_1_nl & '1')), 10));
  and_626_nl <= and_dcpl_257 AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"))
      AND nor_625_cse;
  COMP_LOOP_tmp_mux1h_64_nl <= MUX1HOT_v_64_9_2((STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000000")
      & (z_out_1(6 DOWNTO 0))), COMP_LOOP_tmp_mux_itm, COMP_LOOP_tmp_mux1h_itm, COMP_LOOP_tmp_mux1h_1_itm,
      COMP_LOOP_tmp_mux1h_2_itm, COMP_LOOP_tmp_mux1h_3_itm, COMP_LOOP_tmp_mux1h_4_itm,
      COMP_LOOP_tmp_mux1h_5_itm, tmp_21_sva_1, STD_LOGIC_VECTOR'( and_626_nl & and_dcpl_286
      & and_dcpl_292 & and_dcpl_295 & and_dcpl_298 & and_dcpl_301 & and_dcpl_304
      & and_dcpl_307 & and_dcpl_309));
  COMP_LOOP_tmp_or_53_nl <= and_dcpl_286 OR and_dcpl_292 OR and_dcpl_295 OR and_dcpl_298
      OR and_dcpl_301 OR and_dcpl_304 OR and_dcpl_307 OR and_dcpl_309;
  COMP_LOOP_tmp_mux_12_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_10_3_sva_6_0), COMP_LOOP_1_modulo_dev_cmp_return_rsc_z, COMP_LOOP_tmp_or_53_nl);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_tmp_mux1h_64_nl)
      * UNSIGNED(COMP_LOOP_tmp_mux_12_nl)), 64));
  and_627_nl <= (NOT (fsm_output(3))) AND (fsm_output(6)) AND and_dcpl_255 AND (NOT
      (fsm_output(1))) AND (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(5));
  COMP_LOOP_mux_206_nl <= MUX_v_7_2_2(COMP_LOOP_k_10_3_sva_6_0, (STD_LOGIC_VECTOR'(
      "001") & (NOT z_out_6)), and_627_nl);
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_206_nl),
      8) + UNSIGNED'( "00000001"), 8));
  COMP_LOOP_mux_207_nl <= MUX_v_11_2_2(('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))), STAGE_LOOP_lshift_psp_sva, and_dcpl_335);
  COMP_LOOP_COMP_LOOP_nand_1_nl <= NOT(and_dcpl_335 AND (NOT(and_dcpl_31 AND and_dcpl_255
      AND and_dcpl_324 AND nor_625_cse)));
  COMP_LOOP_mux_208_nl <= MUX_v_10_2_2((COMP_LOOP_k_10_3_sva_6_0 & STD_LOGIC_VECTOR'(
      "001")), VEC_LOOP_j_10_0_sva_9_0, and_dcpl_335);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_207_nl & COMP_LOOP_COMP_LOOP_nand_1_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_208_nl & '1'), 11), 12),
      12));
  z_out_5 <= acc_1_nl(11 DOWNTO 1);
  STAGE_LOOP_mux_4_nl <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (NOT STAGE_LOOP_i_3_0_sva),
      and_dcpl_348);
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_4_nl) + UNSIGNED('1'
      & (NOT and_dcpl_348) & STD_LOGIC_VECTOR'( "11")), 4));
  COMP_LOOP_mux_209_cse <= MUX_v_64_2_2(z_out_9, COMP_LOOP_1_acc_8_itm, COMP_LOOP_or_17_itm);
  COMP_LOOP_mux1h_367_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_nor_itm, COMP_LOOP_COMP_LOOP_nor_5_itm,
      COMP_LOOP_COMP_LOOP_nor_9_itm, COMP_LOOP_COMP_LOOP_nor_13_itm, COMP_LOOP_COMP_LOOP_nor_17_itm,
      COMP_LOOP_COMP_LOOP_nor_21_itm, COMP_LOOP_COMP_LOOP_nor_25_itm, COMP_LOOP_COMP_LOOP_nor_29_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_COMP_LOOP_and_450_nl <= (COMP_LOOP_acc_10_cse_10_1_2_sva(0)) AND COMP_LOOP_nor_51_itm;
  COMP_LOOP_COMP_LOOP_and_451_nl <= (COMP_LOOP_acc_10_cse_10_1_3_sva(0)) AND COMP_LOOP_nor_91_itm;
  COMP_LOOP_COMP_LOOP_and_452_nl <= (COMP_LOOP_acc_10_cse_10_1_4_sva(0)) AND COMP_LOOP_nor_131_itm;
  COMP_LOOP_COMP_LOOP_and_453_nl <= (COMP_LOOP_acc_10_cse_10_1_5_sva(0)) AND COMP_LOOP_nor_171_itm;
  COMP_LOOP_COMP_LOOP_and_454_nl <= (COMP_LOOP_acc_10_cse_10_1_6_sva(0)) AND COMP_LOOP_nor_211_itm;
  COMP_LOOP_COMP_LOOP_and_455_nl <= (COMP_LOOP_acc_10_cse_10_1_7_sva(0)) AND COMP_LOOP_nor_251_itm;
  COMP_LOOP_COMP_LOOP_and_456_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(0)) AND COMP_LOOP_nor_291_itm;
  COMP_LOOP_mux1h_368_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_305_itm, COMP_LOOP_COMP_LOOP_and_450_nl,
      COMP_LOOP_COMP_LOOP_and_451_nl, COMP_LOOP_COMP_LOOP_and_452_nl, COMP_LOOP_COMP_LOOP_and_453_nl,
      COMP_LOOP_COMP_LOOP_and_454_nl, COMP_LOOP_COMP_LOOP_and_455_nl, COMP_LOOP_COMP_LOOP_and_456_nl,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_COMP_LOOP_and_457_nl <= (COMP_LOOP_acc_10_cse_10_1_2_sva(1)) AND COMP_LOOP_nor_52_itm;
  COMP_LOOP_COMP_LOOP_and_458_nl <= (COMP_LOOP_acc_10_cse_10_1_3_sva(1)) AND COMP_LOOP_nor_92_itm;
  COMP_LOOP_COMP_LOOP_and_459_nl <= (COMP_LOOP_acc_10_cse_10_1_4_sva(1)) AND COMP_LOOP_nor_132_itm;
  COMP_LOOP_COMP_LOOP_and_460_nl <= (COMP_LOOP_acc_10_cse_10_1_5_sva(1)) AND COMP_LOOP_nor_172_itm;
  COMP_LOOP_COMP_LOOP_and_461_nl <= (COMP_LOOP_acc_10_cse_10_1_6_sva(1)) AND COMP_LOOP_nor_212_itm;
  COMP_LOOP_COMP_LOOP_and_462_nl <= (COMP_LOOP_acc_10_cse_10_1_7_sva(1)) AND COMP_LOOP_nor_252_itm;
  COMP_LOOP_COMP_LOOP_and_463_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(1)) AND COMP_LOOP_nor_292_itm;
  COMP_LOOP_mux1h_369_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_62_itm, COMP_LOOP_COMP_LOOP_and_457_nl,
      COMP_LOOP_COMP_LOOP_and_458_nl, COMP_LOOP_COMP_LOOP_and_459_nl, COMP_LOOP_COMP_LOOP_and_460_nl,
      COMP_LOOP_COMP_LOOP_and_461_nl, COMP_LOOP_COMP_LOOP_and_462_nl, COMP_LOOP_COMP_LOOP_and_463_nl,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_370_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_185_itm, COMP_LOOP_COMP_LOOP_and_77_itm,
      COMP_LOOP_COMP_LOOP_and_137_itm, COMP_LOOP_COMP_LOOP_and_197_itm, COMP_LOOP_COMP_LOOP_and_257_itm,
      COMP_LOOP_COMP_LOOP_and_317_itm, COMP_LOOP_COMP_LOOP_and_377_itm, COMP_LOOP_COMP_LOOP_and_437_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_COMP_LOOP_and_464_nl <= (COMP_LOOP_acc_10_cse_10_1_2_sva(2)) AND COMP_LOOP_nor_54_itm;
  COMP_LOOP_COMP_LOOP_and_465_nl <= (COMP_LOOP_acc_10_cse_10_1_3_sva(2)) AND COMP_LOOP_nor_94_itm;
  COMP_LOOP_COMP_LOOP_and_466_nl <= (COMP_LOOP_acc_10_cse_10_1_4_sva(2)) AND COMP_LOOP_nor_134_itm;
  COMP_LOOP_COMP_LOOP_and_467_nl <= (COMP_LOOP_acc_10_cse_10_1_5_sva(2)) AND COMP_LOOP_nor_174_itm;
  COMP_LOOP_COMP_LOOP_and_468_nl <= (COMP_LOOP_acc_10_cse_10_1_6_sva(2)) AND COMP_LOOP_nor_214_itm;
  COMP_LOOP_COMP_LOOP_and_469_nl <= (COMP_LOOP_acc_10_cse_10_1_7_sva(2)) AND COMP_LOOP_nor_254_itm;
  COMP_LOOP_COMP_LOOP_and_470_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(2)) AND COMP_LOOP_nor_294_itm;
  COMP_LOOP_mux1h_371_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_64_itm, COMP_LOOP_COMP_LOOP_and_464_nl,
      COMP_LOOP_COMP_LOOP_and_465_nl, COMP_LOOP_COMP_LOOP_and_466_nl, COMP_LOOP_COMP_LOOP_and_467_nl,
      COMP_LOOP_COMP_LOOP_and_468_nl, COMP_LOOP_COMP_LOOP_and_469_nl, COMP_LOOP_COMP_LOOP_and_470_nl,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_372_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_65_itm, COMP_LOOP_COMP_LOOP_and_79_itm,
      COMP_LOOP_COMP_LOOP_and_139_itm, COMP_LOOP_COMP_LOOP_and_199_itm, COMP_LOOP_COMP_LOOP_and_259_itm,
      COMP_LOOP_COMP_LOOP_and_319_itm, COMP_LOOP_COMP_LOOP_and_379_itm, COMP_LOOP_COMP_LOOP_and_439_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_373_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_66_itm, COMP_LOOP_COMP_LOOP_and_80_itm,
      COMP_LOOP_COMP_LOOP_and_140_itm, COMP_LOOP_COMP_LOOP_and_200_itm, COMP_LOOP_COMP_LOOP_and_260_itm,
      COMP_LOOP_COMP_LOOP_and_320_itm, COMP_LOOP_COMP_LOOP_and_380_itm, COMP_LOOP_COMP_LOOP_and_440_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_374_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_6_itm, COMP_LOOP_COMP_LOOP_and_81_itm,
      COMP_LOOP_COMP_LOOP_and_141_itm, COMP_LOOP_COMP_LOOP_and_201_itm, COMP_LOOP_COMP_LOOP_and_261_itm,
      COMP_LOOP_COMP_LOOP_and_321_itm, COMP_LOOP_COMP_LOOP_and_381_itm, COMP_LOOP_COMP_LOOP_and_441_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_COMP_LOOP_and_471_nl <= (COMP_LOOP_acc_10_cse_10_1_2_sva(3)) AND COMP_LOOP_nor_57_itm;
  COMP_LOOP_COMP_LOOP_and_472_nl <= (COMP_LOOP_acc_10_cse_10_1_3_sva(3)) AND COMP_LOOP_nor_97_itm;
  COMP_LOOP_COMP_LOOP_and_473_nl <= (COMP_LOOP_acc_10_cse_10_1_4_sva(3)) AND COMP_LOOP_nor_137_itm;
  COMP_LOOP_COMP_LOOP_and_474_nl <= (COMP_LOOP_acc_10_cse_10_1_5_sva(3)) AND COMP_LOOP_nor_177_itm;
  COMP_LOOP_COMP_LOOP_and_475_nl <= (COMP_LOOP_acc_10_cse_10_1_6_sva(3)) AND COMP_LOOP_nor_217_itm;
  COMP_LOOP_COMP_LOOP_and_476_nl <= (COMP_LOOP_acc_10_cse_10_1_7_sva(3)) AND COMP_LOOP_nor_257_itm;
  COMP_LOOP_COMP_LOOP_and_477_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(3)) AND COMP_LOOP_nor_297_itm;
  COMP_LOOP_mux1h_375_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_68_itm, COMP_LOOP_COMP_LOOP_and_471_nl,
      COMP_LOOP_COMP_LOOP_and_472_nl, COMP_LOOP_COMP_LOOP_and_473_nl, COMP_LOOP_COMP_LOOP_and_474_nl,
      COMP_LOOP_COMP_LOOP_and_475_nl, COMP_LOOP_COMP_LOOP_and_476_nl, COMP_LOOP_COMP_LOOP_and_477_nl,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_376_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_69_itm, COMP_LOOP_COMP_LOOP_and_83_itm,
      COMP_LOOP_COMP_LOOP_and_143_itm, COMP_LOOP_COMP_LOOP_and_203_itm, COMP_LOOP_COMP_LOOP_and_263_itm,
      COMP_LOOP_COMP_LOOP_and_323_itm, COMP_LOOP_COMP_LOOP_and_383_itm, COMP_LOOP_COMP_LOOP_and_443_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_377_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_70_itm, COMP_LOOP_COMP_LOOP_and_84_itm,
      COMP_LOOP_COMP_LOOP_and_144_itm, COMP_LOOP_COMP_LOOP_and_204_itm, COMP_LOOP_COMP_LOOP_and_264_itm,
      COMP_LOOP_COMP_LOOP_and_324_itm, COMP_LOOP_COMP_LOOP_and_384_itm, COMP_LOOP_COMP_LOOP_and_444_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_378_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_10_itm, COMP_LOOP_COMP_LOOP_and_85_itm,
      COMP_LOOP_COMP_LOOP_and_145_itm, COMP_LOOP_COMP_LOOP_and_205_itm, COMP_LOOP_COMP_LOOP_and_265_itm,
      COMP_LOOP_COMP_LOOP_and_325_itm, COMP_LOOP_COMP_LOOP_and_385_itm, COMP_LOOP_COMP_LOOP_and_445_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_379_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_72_itm, COMP_LOOP_COMP_LOOP_and_86_itm,
      COMP_LOOP_COMP_LOOP_and_146_itm, COMP_LOOP_COMP_LOOP_and_206_itm, COMP_LOOP_COMP_LOOP_and_266_itm,
      COMP_LOOP_COMP_LOOP_and_326_itm, COMP_LOOP_COMP_LOOP_and_386_itm, COMP_LOOP_COMP_LOOP_and_446_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_380_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_12_itm, COMP_LOOP_COMP_LOOP_and_87_itm,
      COMP_LOOP_COMP_LOOP_and_147_itm, COMP_LOOP_COMP_LOOP_and_207_itm, COMP_LOOP_COMP_LOOP_and_267_itm,
      COMP_LOOP_COMP_LOOP_and_327_itm, COMP_LOOP_COMP_LOOP_and_387_itm, COMP_LOOP_COMP_LOOP_and_447_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_381_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_13_itm, COMP_LOOP_COMP_LOOP_and_88_itm,
      COMP_LOOP_COMP_LOOP_and_148_itm, COMP_LOOP_COMP_LOOP_and_208_itm, COMP_LOOP_COMP_LOOP_and_268_itm,
      COMP_LOOP_COMP_LOOP_and_328_itm, COMP_LOOP_COMP_LOOP_and_388_itm, COMP_LOOP_COMP_LOOP_and_448_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  COMP_LOOP_mux1h_382_nl <= MUX1HOT_s_1_8_2(COMP_LOOP_COMP_LOOP_and_14_itm, COMP_LOOP_COMP_LOOP_and_89_itm,
      COMP_LOOP_COMP_LOOP_and_149_itm, COMP_LOOP_COMP_LOOP_and_209_itm, COMP_LOOP_COMP_LOOP_and_269_itm,
      COMP_LOOP_COMP_LOOP_and_329_itm, COMP_LOOP_COMP_LOOP_and_389_itm, COMP_LOOP_COMP_LOOP_and_449_itm,
      STD_LOGIC_VECTOR'( and_dcpl_421 & and_dcpl_425 & and_541_cse & and_545_cse
      & and_548_cse & and_552_cse & and_556_cse & and_558_cse));
  z_out_9 <= MUX1HOT_v_64_16_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, vec_rsc_0_2_i_q_d,
      vec_rsc_0_3_i_q_d, vec_rsc_0_4_i_q_d, vec_rsc_0_5_i_q_d, vec_rsc_0_6_i_q_d,
      vec_rsc_0_7_i_q_d, vec_rsc_0_8_i_q_d, vec_rsc_0_9_i_q_d, vec_rsc_0_10_i_q_d,
      vec_rsc_0_11_i_q_d, vec_rsc_0_12_i_q_d, vec_rsc_0_13_i_q_d, vec_rsc_0_14_i_q_d,
      vec_rsc_0_15_i_q_d, STD_LOGIC_VECTOR'( COMP_LOOP_mux1h_367_nl & COMP_LOOP_mux1h_368_nl
      & COMP_LOOP_mux1h_369_nl & COMP_LOOP_mux1h_370_nl & COMP_LOOP_mux1h_371_nl
      & COMP_LOOP_mux1h_372_nl & COMP_LOOP_mux1h_373_nl & COMP_LOOP_mux1h_374_nl
      & COMP_LOOP_mux1h_375_nl & COMP_LOOP_mux1h_376_nl & COMP_LOOP_mux1h_377_nl
      & COMP_LOOP_mux1h_378_nl & COMP_LOOP_mux1h_379_nl & COMP_LOOP_mux1h_380_nl
      & COMP_LOOP_mux1h_381_nl & COMP_LOOP_mux1h_382_nl));
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_0_0_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_0_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_we : OUT STD_LOGIC;
    vec_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_1_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_we : OUT STD_LOGIC;
    vec_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_2_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_2_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_we : OUT STD_LOGIC;
    vec_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_0_3_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_3_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_we : OUT STD_LOGIC;
    vec_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_3_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    vec_rsc_0_4_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_4_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_4_we : OUT STD_LOGIC;
    vec_rsc_0_4_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_4_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    vec_rsc_0_5_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_5_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_5_we : OUT STD_LOGIC;
    vec_rsc_0_5_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_5_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    vec_rsc_0_6_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_6_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_6_we : OUT STD_LOGIC;
    vec_rsc_0_6_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_6_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    vec_rsc_0_7_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_7_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_7_we : OUT STD_LOGIC;
    vec_rsc_0_7_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_7_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    vec_rsc_0_8_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_8_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_8_we : OUT STD_LOGIC;
    vec_rsc_0_8_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_8_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_8_lz : OUT STD_LOGIC;
    vec_rsc_0_9_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_9_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_9_we : OUT STD_LOGIC;
    vec_rsc_0_9_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_9_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_9_lz : OUT STD_LOGIC;
    vec_rsc_0_10_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_10_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_10_we : OUT STD_LOGIC;
    vec_rsc_0_10_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_10_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_10_lz : OUT STD_LOGIC;
    vec_rsc_0_11_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_11_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_11_we : OUT STD_LOGIC;
    vec_rsc_0_11_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_11_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_11_lz : OUT STD_LOGIC;
    vec_rsc_0_12_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_12_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_12_we : OUT STD_LOGIC;
    vec_rsc_0_12_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_12_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_12_lz : OUT STD_LOGIC;
    vec_rsc_0_13_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_13_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_13_we : OUT STD_LOGIC;
    vec_rsc_0_13_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_13_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_13_lz : OUT STD_LOGIC;
    vec_rsc_0_14_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_14_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_14_we : OUT STD_LOGIC;
    vec_rsc_0_14_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_14_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_14_lz : OUT STD_LOGIC;
    vec_rsc_0_15_wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_15_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_15_we : OUT STD_LOGIC;
    vec_rsc_0_15_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    vec_rsc_0_15_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_15_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_3_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_rsc_0_4_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_4_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    twiddle_rsc_0_5_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_5_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    twiddle_rsc_0_6_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_6_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    twiddle_rsc_0_7_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_7_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    twiddle_rsc_0_8_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_8_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_8_lz : OUT STD_LOGIC;
    twiddle_rsc_0_9_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_9_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_9_lz : OUT STD_LOGIC;
    twiddle_rsc_0_10_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_10_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_10_lz : OUT STD_LOGIC;
    twiddle_rsc_0_11_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_11_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_11_lz : OUT STD_LOGIC;
    twiddle_rsc_0_12_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_12_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_12_lz : OUT STD_LOGIC;
    twiddle_rsc_0_13_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_13_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_13_lz : OUT STD_LOGIC;
    twiddle_rsc_0_14_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_14_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_14_lz : OUT STD_LOGIC;
    twiddle_rsc_0_15_radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    twiddle_rsc_0_15_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_15_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIF;

ARCHITECTURE v12 OF inPlaceNTT_DIF IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_8_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_9_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_10_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_11_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_12_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_13_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_14_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_15_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_8_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_9_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_10_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_11_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_12_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_13_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_14_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_15_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_d_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_4_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_5_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_6_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_7_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_8_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_9_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_10_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_11_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_12_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_13_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_14_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_15_i_we_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr_d_iff : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_3_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_4_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_5_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_5_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_6_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_7_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_7_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_8_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_8_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_9_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_9_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_10_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_10_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_11_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_11_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_12_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_12_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_13_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_13_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_14_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_14_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_15_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_wadr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL vec_rsc_0_15_i_wadr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_3_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_4_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_5_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_6_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_7_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_8_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_8_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_8_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_8_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_9_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_9_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_9_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_9_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_10_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_10_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_10_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_10_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_11_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_11_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_11_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_11_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_12_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_12_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_12_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_12_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_13_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_13_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_13_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_13_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_14_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_14_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_14_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_14_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_15_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_15_i_radr : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL twiddle_rsc_0_15_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_15_i_radr_d : STD_LOGIC_VECTOR (5 DOWNTO 0);

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
      vec_rsc_triosy_0_8_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_9_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_10_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_11_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_12_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_13_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_14_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_15_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_8_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_9_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_10_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_11_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_12_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_13_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_14_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_15_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_8_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_9_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_10_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_11_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_12_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_13_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_14_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_15_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_8_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_9_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_10_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_11_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_12_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_13_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_14_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_15_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_5_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_7_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_8_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_9_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_10_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_11_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_12_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_13_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_14_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_15_i_we_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      twiddle_rsc_0_1_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      twiddle_rsc_0_2_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      twiddle_rsc_0_4_i_radr_d_pff : OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_8_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_9_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_10_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_11_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_12_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_13_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_14_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_15_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_8_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_9_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_10_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_11_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_12_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_13_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_14_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_15_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (5
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff : STD_LOGIC_VECTOR (5
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d_pff : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_radr_d_pff : STD_LOGIC_VECTOR
      (5 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_radr_d_pff : STD_LOGIC_VECTOR
      (5 DOWNTO 0);

BEGIN
  vec_rsc_0_0_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_9_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_0_i_q,
      radr => vec_rsc_0_0_i_radr,
      we => vec_rsc_0_0_we,
      d => vec_rsc_0_0_i_d,
      wadr => vec_rsc_0_0_i_wadr,
      d_d => vec_rsc_0_0_i_d_d,
      q_d => vec_rsc_0_0_i_q_d_1,
      radr_d => vec_rsc_0_0_i_radr_d,
      wadr_d => vec_rsc_0_0_i_wadr_d,
      we_d => vec_rsc_0_0_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_0_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_0_i_q <= vec_rsc_0_0_q;
  vec_rsc_0_0_radr <= vec_rsc_0_0_i_radr;
  vec_rsc_0_0_d <= vec_rsc_0_0_i_d;
  vec_rsc_0_0_wadr <= vec_rsc_0_0_i_wadr;
  vec_rsc_0_0_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d_1;
  vec_rsc_0_0_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_0_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_1_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_10_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_1_i_q,
      radr => vec_rsc_0_1_i_radr,
      we => vec_rsc_0_1_we,
      d => vec_rsc_0_1_i_d,
      wadr => vec_rsc_0_1_i_wadr,
      d_d => vec_rsc_0_1_i_d_d,
      q_d => vec_rsc_0_1_i_q_d_1,
      radr_d => vec_rsc_0_1_i_radr_d,
      wadr_d => vec_rsc_0_1_i_wadr_d,
      we_d => vec_rsc_0_1_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_1_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_1_i_q <= vec_rsc_0_1_q;
  vec_rsc_0_1_radr <= vec_rsc_0_1_i_radr;
  vec_rsc_0_1_d <= vec_rsc_0_1_i_d;
  vec_rsc_0_1_wadr <= vec_rsc_0_1_i_wadr;
  vec_rsc_0_1_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d_1;
  vec_rsc_0_1_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_1_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_2_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_11_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_2_i_q,
      radr => vec_rsc_0_2_i_radr,
      we => vec_rsc_0_2_we,
      d => vec_rsc_0_2_i_d,
      wadr => vec_rsc_0_2_i_wadr,
      d_d => vec_rsc_0_2_i_d_d,
      q_d => vec_rsc_0_2_i_q_d_1,
      radr_d => vec_rsc_0_2_i_radr_d,
      wadr_d => vec_rsc_0_2_i_wadr_d,
      we_d => vec_rsc_0_2_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_2_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_2_i_q <= vec_rsc_0_2_q;
  vec_rsc_0_2_radr <= vec_rsc_0_2_i_radr;
  vec_rsc_0_2_d <= vec_rsc_0_2_i_d;
  vec_rsc_0_2_wadr <= vec_rsc_0_2_i_wadr;
  vec_rsc_0_2_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d_1;
  vec_rsc_0_2_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_2_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_3_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_12_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_3_i_q,
      radr => vec_rsc_0_3_i_radr,
      we => vec_rsc_0_3_we,
      d => vec_rsc_0_3_i_d,
      wadr => vec_rsc_0_3_i_wadr,
      d_d => vec_rsc_0_3_i_d_d,
      q_d => vec_rsc_0_3_i_q_d_1,
      radr_d => vec_rsc_0_3_i_radr_d,
      wadr_d => vec_rsc_0_3_i_wadr_d,
      we_d => vec_rsc_0_3_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_3_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_3_i_q <= vec_rsc_0_3_q;
  vec_rsc_0_3_radr <= vec_rsc_0_3_i_radr;
  vec_rsc_0_3_d <= vec_rsc_0_3_i_d;
  vec_rsc_0_3_wadr <= vec_rsc_0_3_i_wadr;
  vec_rsc_0_3_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_3_i_q_d <= vec_rsc_0_3_i_q_d_1;
  vec_rsc_0_3_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_3_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_4_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_13_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_4_i_q,
      radr => vec_rsc_0_4_i_radr,
      we => vec_rsc_0_4_we,
      d => vec_rsc_0_4_i_d,
      wadr => vec_rsc_0_4_i_wadr,
      d_d => vec_rsc_0_4_i_d_d,
      q_d => vec_rsc_0_4_i_q_d_1,
      radr_d => vec_rsc_0_4_i_radr_d,
      wadr_d => vec_rsc_0_4_i_wadr_d,
      we_d => vec_rsc_0_4_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_4_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_4_i_q <= vec_rsc_0_4_q;
  vec_rsc_0_4_radr <= vec_rsc_0_4_i_radr;
  vec_rsc_0_4_d <= vec_rsc_0_4_i_d;
  vec_rsc_0_4_wadr <= vec_rsc_0_4_i_wadr;
  vec_rsc_0_4_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_4_i_q_d <= vec_rsc_0_4_i_q_d_1;
  vec_rsc_0_4_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_4_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_5_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_14_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_5_i_q,
      radr => vec_rsc_0_5_i_radr,
      we => vec_rsc_0_5_we,
      d => vec_rsc_0_5_i_d,
      wadr => vec_rsc_0_5_i_wadr,
      d_d => vec_rsc_0_5_i_d_d,
      q_d => vec_rsc_0_5_i_q_d_1,
      radr_d => vec_rsc_0_5_i_radr_d,
      wadr_d => vec_rsc_0_5_i_wadr_d,
      we_d => vec_rsc_0_5_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_5_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_5_i_q <= vec_rsc_0_5_q;
  vec_rsc_0_5_radr <= vec_rsc_0_5_i_radr;
  vec_rsc_0_5_d <= vec_rsc_0_5_i_d;
  vec_rsc_0_5_wadr <= vec_rsc_0_5_i_wadr;
  vec_rsc_0_5_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_5_i_q_d <= vec_rsc_0_5_i_q_d_1;
  vec_rsc_0_5_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_5_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_6_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_15_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_6_i_q,
      radr => vec_rsc_0_6_i_radr,
      we => vec_rsc_0_6_we,
      d => vec_rsc_0_6_i_d,
      wadr => vec_rsc_0_6_i_wadr,
      d_d => vec_rsc_0_6_i_d_d,
      q_d => vec_rsc_0_6_i_q_d_1,
      radr_d => vec_rsc_0_6_i_radr_d,
      wadr_d => vec_rsc_0_6_i_wadr_d,
      we_d => vec_rsc_0_6_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_6_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_6_i_q <= vec_rsc_0_6_q;
  vec_rsc_0_6_radr <= vec_rsc_0_6_i_radr;
  vec_rsc_0_6_d <= vec_rsc_0_6_i_d;
  vec_rsc_0_6_wadr <= vec_rsc_0_6_i_wadr;
  vec_rsc_0_6_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_6_i_q_d <= vec_rsc_0_6_i_q_d_1;
  vec_rsc_0_6_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_6_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_7_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_16_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_7_i_q,
      radr => vec_rsc_0_7_i_radr,
      we => vec_rsc_0_7_we,
      d => vec_rsc_0_7_i_d,
      wadr => vec_rsc_0_7_i_wadr,
      d_d => vec_rsc_0_7_i_d_d,
      q_d => vec_rsc_0_7_i_q_d_1,
      radr_d => vec_rsc_0_7_i_radr_d,
      wadr_d => vec_rsc_0_7_i_wadr_d,
      we_d => vec_rsc_0_7_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_7_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_7_i_q <= vec_rsc_0_7_q;
  vec_rsc_0_7_radr <= vec_rsc_0_7_i_radr;
  vec_rsc_0_7_d <= vec_rsc_0_7_i_d;
  vec_rsc_0_7_wadr <= vec_rsc_0_7_i_wadr;
  vec_rsc_0_7_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_7_i_q_d <= vec_rsc_0_7_i_q_d_1;
  vec_rsc_0_7_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_7_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_8_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_17_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_8_i_q,
      radr => vec_rsc_0_8_i_radr,
      we => vec_rsc_0_8_we,
      d => vec_rsc_0_8_i_d,
      wadr => vec_rsc_0_8_i_wadr,
      d_d => vec_rsc_0_8_i_d_d,
      q_d => vec_rsc_0_8_i_q_d_1,
      radr_d => vec_rsc_0_8_i_radr_d,
      wadr_d => vec_rsc_0_8_i_wadr_d,
      we_d => vec_rsc_0_8_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_8_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_8_i_q <= vec_rsc_0_8_q;
  vec_rsc_0_8_radr <= vec_rsc_0_8_i_radr;
  vec_rsc_0_8_d <= vec_rsc_0_8_i_d;
  vec_rsc_0_8_wadr <= vec_rsc_0_8_i_wadr;
  vec_rsc_0_8_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_8_i_q_d <= vec_rsc_0_8_i_q_d_1;
  vec_rsc_0_8_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_8_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_9_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_18_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_9_i_q,
      radr => vec_rsc_0_9_i_radr,
      we => vec_rsc_0_9_we,
      d => vec_rsc_0_9_i_d,
      wadr => vec_rsc_0_9_i_wadr,
      d_d => vec_rsc_0_9_i_d_d,
      q_d => vec_rsc_0_9_i_q_d_1,
      radr_d => vec_rsc_0_9_i_radr_d,
      wadr_d => vec_rsc_0_9_i_wadr_d,
      we_d => vec_rsc_0_9_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_9_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_9_i_q <= vec_rsc_0_9_q;
  vec_rsc_0_9_radr <= vec_rsc_0_9_i_radr;
  vec_rsc_0_9_d <= vec_rsc_0_9_i_d;
  vec_rsc_0_9_wadr <= vec_rsc_0_9_i_wadr;
  vec_rsc_0_9_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_9_i_q_d <= vec_rsc_0_9_i_q_d_1;
  vec_rsc_0_9_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_9_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_10_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_19_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_10_i_q,
      radr => vec_rsc_0_10_i_radr,
      we => vec_rsc_0_10_we,
      d => vec_rsc_0_10_i_d,
      wadr => vec_rsc_0_10_i_wadr,
      d_d => vec_rsc_0_10_i_d_d,
      q_d => vec_rsc_0_10_i_q_d_1,
      radr_d => vec_rsc_0_10_i_radr_d,
      wadr_d => vec_rsc_0_10_i_wadr_d,
      we_d => vec_rsc_0_10_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_10_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_10_i_q <= vec_rsc_0_10_q;
  vec_rsc_0_10_radr <= vec_rsc_0_10_i_radr;
  vec_rsc_0_10_d <= vec_rsc_0_10_i_d;
  vec_rsc_0_10_wadr <= vec_rsc_0_10_i_wadr;
  vec_rsc_0_10_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_10_i_q_d <= vec_rsc_0_10_i_q_d_1;
  vec_rsc_0_10_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_10_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_11_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_20_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_11_i_q,
      radr => vec_rsc_0_11_i_radr,
      we => vec_rsc_0_11_we,
      d => vec_rsc_0_11_i_d,
      wadr => vec_rsc_0_11_i_wadr,
      d_d => vec_rsc_0_11_i_d_d,
      q_d => vec_rsc_0_11_i_q_d_1,
      radr_d => vec_rsc_0_11_i_radr_d,
      wadr_d => vec_rsc_0_11_i_wadr_d,
      we_d => vec_rsc_0_11_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_11_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_11_i_q <= vec_rsc_0_11_q;
  vec_rsc_0_11_radr <= vec_rsc_0_11_i_radr;
  vec_rsc_0_11_d <= vec_rsc_0_11_i_d;
  vec_rsc_0_11_wadr <= vec_rsc_0_11_i_wadr;
  vec_rsc_0_11_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_11_i_q_d <= vec_rsc_0_11_i_q_d_1;
  vec_rsc_0_11_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_11_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_12_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_21_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_12_i_q,
      radr => vec_rsc_0_12_i_radr,
      we => vec_rsc_0_12_we,
      d => vec_rsc_0_12_i_d,
      wadr => vec_rsc_0_12_i_wadr,
      d_d => vec_rsc_0_12_i_d_d,
      q_d => vec_rsc_0_12_i_q_d_1,
      radr_d => vec_rsc_0_12_i_radr_d,
      wadr_d => vec_rsc_0_12_i_wadr_d,
      we_d => vec_rsc_0_12_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_12_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_12_i_q <= vec_rsc_0_12_q;
  vec_rsc_0_12_radr <= vec_rsc_0_12_i_radr;
  vec_rsc_0_12_d <= vec_rsc_0_12_i_d;
  vec_rsc_0_12_wadr <= vec_rsc_0_12_i_wadr;
  vec_rsc_0_12_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_12_i_q_d <= vec_rsc_0_12_i_q_d_1;
  vec_rsc_0_12_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_12_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_13_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_22_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_13_i_q,
      radr => vec_rsc_0_13_i_radr,
      we => vec_rsc_0_13_we,
      d => vec_rsc_0_13_i_d,
      wadr => vec_rsc_0_13_i_wadr,
      d_d => vec_rsc_0_13_i_d_d,
      q_d => vec_rsc_0_13_i_q_d_1,
      radr_d => vec_rsc_0_13_i_radr_d,
      wadr_d => vec_rsc_0_13_i_wadr_d,
      we_d => vec_rsc_0_13_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_13_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_13_i_q <= vec_rsc_0_13_q;
  vec_rsc_0_13_radr <= vec_rsc_0_13_i_radr;
  vec_rsc_0_13_d <= vec_rsc_0_13_i_d;
  vec_rsc_0_13_wadr <= vec_rsc_0_13_i_wadr;
  vec_rsc_0_13_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_13_i_q_d <= vec_rsc_0_13_i_q_d_1;
  vec_rsc_0_13_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_13_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_14_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_14_i_q,
      radr => vec_rsc_0_14_i_radr,
      we => vec_rsc_0_14_we,
      d => vec_rsc_0_14_i_d,
      wadr => vec_rsc_0_14_i_wadr,
      d_d => vec_rsc_0_14_i_d_d,
      q_d => vec_rsc_0_14_i_q_d_1,
      radr_d => vec_rsc_0_14_i_radr_d,
      wadr_d => vec_rsc_0_14_i_wadr_d,
      we_d => vec_rsc_0_14_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_14_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_14_i_q <= vec_rsc_0_14_q;
  vec_rsc_0_14_radr <= vec_rsc_0_14_i_radr;
  vec_rsc_0_14_d <= vec_rsc_0_14_i_d;
  vec_rsc_0_14_wadr <= vec_rsc_0_14_i_wadr;
  vec_rsc_0_14_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_14_i_q_d <= vec_rsc_0_14_i_q_d_1;
  vec_rsc_0_14_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_14_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_15_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_24_6_64_64_64_64_1_gen
    PORT MAP(
      q => vec_rsc_0_15_i_q,
      radr => vec_rsc_0_15_i_radr,
      we => vec_rsc_0_15_we,
      d => vec_rsc_0_15_i_d,
      wadr => vec_rsc_0_15_i_wadr,
      d_d => vec_rsc_0_15_i_d_d,
      q_d => vec_rsc_0_15_i_q_d_1,
      radr_d => vec_rsc_0_15_i_radr_d,
      wadr_d => vec_rsc_0_15_i_wadr_d,
      we_d => vec_rsc_0_15_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_15_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsc_0_15_i_q <= vec_rsc_0_15_q;
  vec_rsc_0_15_radr <= vec_rsc_0_15_i_radr;
  vec_rsc_0_15_d <= vec_rsc_0_15_i_d;
  vec_rsc_0_15_wadr <= vec_rsc_0_15_i_wadr;
  vec_rsc_0_15_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_15_i_q_d <= vec_rsc_0_15_i_q_d_1;
  vec_rsc_0_15_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_15_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;

  twiddle_rsc_0_0_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_25_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_0_i_q,
      radr => twiddle_rsc_0_0_i_radr,
      q_d => twiddle_rsc_0_0_i_q_d_1,
      radr_d => twiddle_rsc_0_0_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_0_i_q <= twiddle_rsc_0_0_q;
  twiddle_rsc_0_0_radr <= twiddle_rsc_0_0_i_radr;
  twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d_1;
  twiddle_rsc_0_0_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;

  twiddle_rsc_0_1_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_26_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_1_i_q,
      radr => twiddle_rsc_0_1_i_radr,
      q_d => twiddle_rsc_0_1_i_q_d_1,
      radr_d => twiddle_rsc_0_1_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_1_i_q <= twiddle_rsc_0_1_q;
  twiddle_rsc_0_1_radr <= twiddle_rsc_0_1_i_radr;
  twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d_1;
  twiddle_rsc_0_1_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_2_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_27_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_2_i_q,
      radr => twiddle_rsc_0_2_i_radr,
      q_d => twiddle_rsc_0_2_i_q_d_1,
      radr_d => twiddle_rsc_0_2_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_2_i_q <= twiddle_rsc_0_2_q;
  twiddle_rsc_0_2_radr <= twiddle_rsc_0_2_i_radr;
  twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d_1;
  twiddle_rsc_0_2_i_radr_d <= twiddle_rsc_0_2_i_radr_d_iff;

  twiddle_rsc_0_3_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_28_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_3_i_q,
      radr => twiddle_rsc_0_3_i_radr,
      q_d => twiddle_rsc_0_3_i_q_d_1,
      radr_d => twiddle_rsc_0_3_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_3_i_q <= twiddle_rsc_0_3_q;
  twiddle_rsc_0_3_radr <= twiddle_rsc_0_3_i_radr;
  twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d_1;
  twiddle_rsc_0_3_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_4_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_29_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_4_i_q,
      radr => twiddle_rsc_0_4_i_radr,
      q_d => twiddle_rsc_0_4_i_q_d_1,
      radr_d => twiddle_rsc_0_4_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_4_i_q <= twiddle_rsc_0_4_q;
  twiddle_rsc_0_4_radr <= twiddle_rsc_0_4_i_radr;
  twiddle_rsc_0_4_i_q_d <= twiddle_rsc_0_4_i_q_d_1;
  twiddle_rsc_0_4_i_radr_d <= twiddle_rsc_0_4_i_radr_d_iff;

  twiddle_rsc_0_5_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_30_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_5_i_q,
      radr => twiddle_rsc_0_5_i_radr,
      q_d => twiddle_rsc_0_5_i_q_d_1,
      radr_d => twiddle_rsc_0_5_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_5_i_q <= twiddle_rsc_0_5_q;
  twiddle_rsc_0_5_radr <= twiddle_rsc_0_5_i_radr;
  twiddle_rsc_0_5_i_q_d <= twiddle_rsc_0_5_i_q_d_1;
  twiddle_rsc_0_5_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_6_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_6_i_q,
      radr => twiddle_rsc_0_6_i_radr,
      q_d => twiddle_rsc_0_6_i_q_d_1,
      radr_d => twiddle_rsc_0_6_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_6_i_q <= twiddle_rsc_0_6_q;
  twiddle_rsc_0_6_radr <= twiddle_rsc_0_6_i_radr;
  twiddle_rsc_0_6_i_q_d <= twiddle_rsc_0_6_i_q_d_1;
  twiddle_rsc_0_6_i_radr_d <= twiddle_rsc_0_2_i_radr_d_iff;

  twiddle_rsc_0_7_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_7_i_q,
      radr => twiddle_rsc_0_7_i_radr,
      q_d => twiddle_rsc_0_7_i_q_d_1,
      radr_d => twiddle_rsc_0_7_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_7_i_q <= twiddle_rsc_0_7_q;
  twiddle_rsc_0_7_radr <= twiddle_rsc_0_7_i_radr;
  twiddle_rsc_0_7_i_q_d <= twiddle_rsc_0_7_i_q_d_1;
  twiddle_rsc_0_7_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_8_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_8_i_q,
      radr => twiddle_rsc_0_8_i_radr,
      q_d => twiddle_rsc_0_8_i_q_d_1,
      radr_d => twiddle_rsc_0_8_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_8_i_q <= twiddle_rsc_0_8_q;
  twiddle_rsc_0_8_radr <= twiddle_rsc_0_8_i_radr;
  twiddle_rsc_0_8_i_q_d <= twiddle_rsc_0_8_i_q_d_1;
  twiddle_rsc_0_8_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;

  twiddle_rsc_0_9_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_9_i_q,
      radr => twiddle_rsc_0_9_i_radr,
      q_d => twiddle_rsc_0_9_i_q_d_1,
      radr_d => twiddle_rsc_0_9_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_9_i_q <= twiddle_rsc_0_9_q;
  twiddle_rsc_0_9_radr <= twiddle_rsc_0_9_i_radr;
  twiddle_rsc_0_9_i_q_d <= twiddle_rsc_0_9_i_q_d_1;
  twiddle_rsc_0_9_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_10_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_10_i_q,
      radr => twiddle_rsc_0_10_i_radr,
      q_d => twiddle_rsc_0_10_i_q_d_1,
      radr_d => twiddle_rsc_0_10_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_10_i_q <= twiddle_rsc_0_10_q;
  twiddle_rsc_0_10_radr <= twiddle_rsc_0_10_i_radr;
  twiddle_rsc_0_10_i_q_d <= twiddle_rsc_0_10_i_q_d_1;
  twiddle_rsc_0_10_i_radr_d <= twiddle_rsc_0_2_i_radr_d_iff;

  twiddle_rsc_0_11_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_11_i_q,
      radr => twiddle_rsc_0_11_i_radr,
      q_d => twiddle_rsc_0_11_i_q_d_1,
      radr_d => twiddle_rsc_0_11_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_11_i_q <= twiddle_rsc_0_11_q;
  twiddle_rsc_0_11_radr <= twiddle_rsc_0_11_i_radr;
  twiddle_rsc_0_11_i_q_d <= twiddle_rsc_0_11_i_q_d_1;
  twiddle_rsc_0_11_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_12_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_12_i_q,
      radr => twiddle_rsc_0_12_i_radr,
      q_d => twiddle_rsc_0_12_i_q_d_1,
      radr_d => twiddle_rsc_0_12_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_12_i_q <= twiddle_rsc_0_12_q;
  twiddle_rsc_0_12_radr <= twiddle_rsc_0_12_i_radr;
  twiddle_rsc_0_12_i_q_d <= twiddle_rsc_0_12_i_q_d_1;
  twiddle_rsc_0_12_i_radr_d <= twiddle_rsc_0_4_i_radr_d_iff;

  twiddle_rsc_0_13_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_13_i_q,
      radr => twiddle_rsc_0_13_i_radr,
      q_d => twiddle_rsc_0_13_i_q_d_1,
      radr_d => twiddle_rsc_0_13_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_13_i_q <= twiddle_rsc_0_13_q;
  twiddle_rsc_0_13_radr <= twiddle_rsc_0_13_i_radr;
  twiddle_rsc_0_13_i_q_d <= twiddle_rsc_0_13_i_q_d_1;
  twiddle_rsc_0_13_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

  twiddle_rsc_0_14_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_39_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_14_i_q,
      radr => twiddle_rsc_0_14_i_radr,
      q_d => twiddle_rsc_0_14_i_q_d_1,
      radr_d => twiddle_rsc_0_14_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_14_i_q <= twiddle_rsc_0_14_q;
  twiddle_rsc_0_14_radr <= twiddle_rsc_0_14_i_radr;
  twiddle_rsc_0_14_i_q_d <= twiddle_rsc_0_14_i_q_d_1;
  twiddle_rsc_0_14_i_radr_d <= twiddle_rsc_0_2_i_radr_d_iff;

  twiddle_rsc_0_15_i : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_40_6_64_64_64_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_15_i_q,
      radr => twiddle_rsc_0_15_i_radr,
      q_d => twiddle_rsc_0_15_i_q_d_1,
      radr_d => twiddle_rsc_0_15_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_15_i_q <= twiddle_rsc_0_15_q;
  twiddle_rsc_0_15_radr <= twiddle_rsc_0_15_i_radr;
  twiddle_rsc_0_15_i_q_d <= twiddle_rsc_0_15_i_q_d_1;
  twiddle_rsc_0_15_i_radr_d <= twiddle_rsc_0_1_i_radr_d_iff;

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
      vec_rsc_triosy_0_8_lz => vec_rsc_triosy_0_8_lz,
      vec_rsc_triosy_0_9_lz => vec_rsc_triosy_0_9_lz,
      vec_rsc_triosy_0_10_lz => vec_rsc_triosy_0_10_lz,
      vec_rsc_triosy_0_11_lz => vec_rsc_triosy_0_11_lz,
      vec_rsc_triosy_0_12_lz => vec_rsc_triosy_0_12_lz,
      vec_rsc_triosy_0_13_lz => vec_rsc_triosy_0_13_lz,
      vec_rsc_triosy_0_14_lz => vec_rsc_triosy_0_14_lz,
      vec_rsc_triosy_0_15_lz => vec_rsc_triosy_0_15_lz,
      p_rsc_dat => inPlaceNTT_DIF_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz => twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz => twiddle_rsc_triosy_0_3_lz,
      twiddle_rsc_triosy_0_4_lz => twiddle_rsc_triosy_0_4_lz,
      twiddle_rsc_triosy_0_5_lz => twiddle_rsc_triosy_0_5_lz,
      twiddle_rsc_triosy_0_6_lz => twiddle_rsc_triosy_0_6_lz,
      twiddle_rsc_triosy_0_7_lz => twiddle_rsc_triosy_0_7_lz,
      twiddle_rsc_triosy_0_8_lz => twiddle_rsc_triosy_0_8_lz,
      twiddle_rsc_triosy_0_9_lz => twiddle_rsc_triosy_0_9_lz,
      twiddle_rsc_triosy_0_10_lz => twiddle_rsc_triosy_0_10_lz,
      twiddle_rsc_triosy_0_11_lz => twiddle_rsc_triosy_0_11_lz,
      twiddle_rsc_triosy_0_12_lz => twiddle_rsc_triosy_0_12_lz,
      twiddle_rsc_triosy_0_13_lz => twiddle_rsc_triosy_0_13_lz,
      twiddle_rsc_triosy_0_14_lz => twiddle_rsc_triosy_0_14_lz,
      twiddle_rsc_triosy_0_15_lz => twiddle_rsc_triosy_0_15_lz,
      vec_rsc_0_0_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d,
      vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d,
      vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_2_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_q_d,
      vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_q_d,
      vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_4_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_q_d,
      vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_5_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_q_d,
      vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_6_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_q_d,
      vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_7_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_q_d,
      vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_8_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_8_i_q_d,
      vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_9_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_9_i_q_d,
      vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_10_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_10_i_q_d,
      vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_11_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_11_i_q_d,
      vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_12_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_12_i_q_d,
      vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_13_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_13_i_q_d,
      vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_14_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_14_i_q_d,
      vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_15_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_15_i_q_d,
      vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_0_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_q_d,
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_3_i_q_d,
      twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_4_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_q_d,
      twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_5_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_5_i_q_d,
      twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_6_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_6_i_q_d,
      twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_7_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_7_i_q_d,
      twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_8_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_8_i_q_d,
      twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_8_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_9_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_9_i_q_d,
      twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_9_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_10_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_10_i_q_d,
      twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_10_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_11_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_11_i_q_d,
      twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_11_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_12_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_12_i_q_d,
      twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_12_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_13_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_13_i_q_d,
      twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_13_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_14_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_14_i_q_d,
      twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_14_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_15_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_15_i_q_d,
      twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_15_i_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_d_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff,
      vec_rsc_0_0_i_radr_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff,
      vec_rsc_0_0_i_wadr_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff,
      vec_rsc_0_0_i_we_d_pff => vec_rsc_0_0_i_we_d_iff,
      vec_rsc_0_1_i_we_d_pff => vec_rsc_0_1_i_we_d_iff,
      vec_rsc_0_2_i_we_d_pff => vec_rsc_0_2_i_we_d_iff,
      vec_rsc_0_3_i_we_d_pff => vec_rsc_0_3_i_we_d_iff,
      vec_rsc_0_4_i_we_d_pff => vec_rsc_0_4_i_we_d_iff,
      vec_rsc_0_5_i_we_d_pff => vec_rsc_0_5_i_we_d_iff,
      vec_rsc_0_6_i_we_d_pff => vec_rsc_0_6_i_we_d_iff,
      vec_rsc_0_7_i_we_d_pff => vec_rsc_0_7_i_we_d_iff,
      vec_rsc_0_8_i_we_d_pff => vec_rsc_0_8_i_we_d_iff,
      vec_rsc_0_9_i_we_d_pff => vec_rsc_0_9_i_we_d_iff,
      vec_rsc_0_10_i_we_d_pff => vec_rsc_0_10_i_we_d_iff,
      vec_rsc_0_11_i_we_d_pff => vec_rsc_0_11_i_we_d_iff,
      vec_rsc_0_12_i_we_d_pff => vec_rsc_0_12_i_we_d_iff,
      vec_rsc_0_13_i_we_d_pff => vec_rsc_0_13_i_we_d_iff,
      vec_rsc_0_14_i_we_d_pff => vec_rsc_0_14_i_we_d_iff,
      vec_rsc_0_15_i_we_d_pff => vec_rsc_0_15_i_we_d_iff,
      twiddle_rsc_0_0_i_radr_d_pff => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d_pff,
      twiddle_rsc_0_1_i_radr_d_pff => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d_pff,
      twiddle_rsc_0_2_i_radr_d_pff => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_radr_d_pff,
      twiddle_rsc_0_4_i_radr_d_pff => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_radr_d_pff
    );
  inPlaceNTT_DIF_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_3_i_q_d <= vec_rsc_0_3_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_4_i_q_d <= vec_rsc_0_4_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_5_i_q_d <= vec_rsc_0_5_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_6_i_q_d <= vec_rsc_0_6_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_7_i_q_d <= vec_rsc_0_7_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_8_i_q_d <= vec_rsc_0_8_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_9_i_q_d <= vec_rsc_0_9_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_10_i_q_d <= vec_rsc_0_10_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_11_i_q_d <= vec_rsc_0_11_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_12_i_q_d <= vec_rsc_0_12_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_13_i_q_d <= vec_rsc_0_13_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_14_i_q_d <= vec_rsc_0_14_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_15_i_q_d <= vec_rsc_0_15_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_q_d <= twiddle_rsc_0_4_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_5_i_q_d <= twiddle_rsc_0_5_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_6_i_q_d <= twiddle_rsc_0_6_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_7_i_q_d <= twiddle_rsc_0_7_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_8_i_q_d <= twiddle_rsc_0_8_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_9_i_q_d <= twiddle_rsc_0_9_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_10_i_q_d <= twiddle_rsc_0_10_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_11_i_q_d <= twiddle_rsc_0_11_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_12_i_q_d <= twiddle_rsc_0_12_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_13_i_q_d <= twiddle_rsc_0_13_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_14_i_q_d <= twiddle_rsc_0_14_i_q_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_15_i_q_d <= twiddle_rsc_0_15_i_q_d;
  vec_rsc_0_0_i_d_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff;
  vec_rsc_0_0_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff;
  vec_rsc_0_0_i_wadr_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff;
  twiddle_rsc_0_0_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d_pff;
  twiddle_rsc_0_1_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d_pff;
  twiddle_rsc_0_2_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_2_i_radr_d_pff;
  twiddle_rsc_0_4_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_4_i_radr_d_pff;

END v12;



