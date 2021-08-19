
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_bl_beh_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_shift_bl_v5 IS
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
END mgc_shift_bl_v5;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_shift_bl_v5 IS

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

  FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED)
  RETURN UNSIGNED IS
  BEGIN
    RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1),
                                             STD_LOGIC_VECTOR(input2)));
  END;

  FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED)
  RETURN SIGNED IS
  BEGIN
    RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1),
                                           STD_LOGIC_VECTOR(input2)));
  END;

  FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
    BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;

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

  FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE)
  RETURN UNSIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, '0', olen);
  END;

  FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE)
  RETURN SIGNED IS
  BEGIN
    RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen);
  END;

BEGIN
UNSGNED:  IF signd_a = 0 GENERATE
    z <= std_logic_vector(fshl_stdar(unsigned(a), signed(s), width_z));
  END GENERATE;
SGNED:  IF signd_a /= 0 GENERATE
    z <= std_logic_vector(fshl_stdar(  signed(a), signed(s), width_z));
  END GENERATE;
END beh;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Wed Aug 18 21:31:37 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen;

ARCHITECTURE v6 OF inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
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
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    COMP_LOOP_C_79_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_157_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_core_core_fsm;

ARCHITECTURE v6 OF inPlaceNTT_DIF_core_core_fsm IS
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
      COMP_LOOP_C_156, COMP_LOOP_C_157, VEC_LOOP_C_0, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIF_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIF_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIF_core_core_fsm_1 : PROCESS (COMP_LOOP_C_79_tr0, COMP_LOOP_C_157_tr0,
      VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0, state_var)
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
        state_var_NS <= COMP_LOOP_C_29;
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
        state_var_NS <= COMP_LOOP_C_57;
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
        IF ( COMP_LOOP_C_79_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_80;
        END IF;
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
        state_var_NS <= COMP_LOOP_C_85;
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
        state_var_NS <= COMP_LOOP_C_113;
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
        state_var_NS <= COMP_LOOP_C_141;
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
        IF ( COMP_LOOP_C_157_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
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
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core;

ARCHITECTURE v6 OF inPlaceNTT_DIF_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nor_tmp_6 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_7 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL or_tmp_36 : STD_LOGIC;
  SIGNAL mux_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL or_tmp_39 : STD_LOGIC;
  SIGNAL mux_tmp_38 : STD_LOGIC;
  SIGNAL or_tmp_42 : STD_LOGIC;
  SIGNAL mux_tmp_40 : STD_LOGIC;
  SIGNAL or_tmp_43 : STD_LOGIC;
  SIGNAL mux_tmp_44 : STD_LOGIC;
  SIGNAL nor_tmp_11 : STD_LOGIC;
  SIGNAL or_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL or_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL and_tmp_4 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL or_dcpl_9 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL or_tmp_78 : STD_LOGIC;
  SIGNAL not_tmp_68 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL or_tmp_103 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_2_tmp_mul_idiv_sva_0 : STD_LOGIC;
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_k_10_1_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_COMP_LOOP_k_10_1_ftd_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_twiddle_rsc_triosy_0_0_obj_ld_cse : STD_LOGIC;
  SIGNAL or_82_cse : STD_LOGIC;
  SIGNAL or_5_cse : STD_LOGIC;
  SIGNAL nor_35_cse : STD_LOGIC;
  SIGNAL and_119_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_6_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_asn_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_tmp_mux_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_10_0_sva_9_0_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c0 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c1 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c2 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_8_itm_mx0c3 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_6_mut_mx0c1 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL nor_64_cse : STD_LOGIC;
  SIGNAL or_141_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL nor_36_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL or_50_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL or_49_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL nor_46_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL or_52_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL nor_28_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL or_132_nl : STD_LOGIC;
  SIGNAL or_133_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_2_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL or_9_nl : STD_LOGIC;
  SIGNAL or_93_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL and_110_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL nor_25_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL or_120_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL or_46_nl : STD_LOGIC;
  SIGNAL or_45_nl : STD_LOGIC;
  SIGNAL or_51_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL or_124_nl : STD_LOGIC;
  SIGNAL or_123_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL nor_26_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL and_71_nl : STD_LOGIC;
  SIGNAL and_73_nl : STD_LOGIC;
  SIGNAL and_74_nl : STD_LOGIC;
  SIGNAL and_62_nl : STD_LOGIC;
  SIGNAL and_64_nl : STD_LOGIC;
  SIGNAL and_69_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL or_137_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL or_73_nl : STD_LOGIC;
  SIGNAL or_72_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL nor_30_nl : STD_LOGIC;
  SIGNAL nor_31_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL or_77_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL or_76_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL or_138_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL or_61_nl : STD_LOGIC;
  SIGNAL or_60_nl : STD_LOGIC;
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL and_130_nl : STD_LOGIC;
  SIGNAL nor_34_nl : STD_LOGIC;
  SIGNAL mux_74_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL mux_70_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nand_15_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_11_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_12_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux1h_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_and_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_18_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_13_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_mux_8_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_14_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_5_nl : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_19_nl : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL not_337_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_20_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_21_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_modulo_dev_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO
      0);

  SIGNAL COMP_LOOP_1_tmp_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_lshift_rg_s : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL COMP_LOOP_1_tmp_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      COMP_LOOP_C_79_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_157_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_4_3_2(input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_55_3_2(input_2 : STD_LOGIC_VECTOR(54 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(54 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(54 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(54 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(54 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
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
      rscid => 2,
      width => 64
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  twiddle_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_1_lz
    );
  twiddle_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_0_lz
    );
  COMP_LOOP_1_modulo_dev_result_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => COMP_LOOP_1_modulo_dev_result_rem_cmp_a_1,
      b => COMP_LOOP_1_modulo_dev_result_rem_cmp_b_1,
      z => COMP_LOOP_1_modulo_dev_result_rem_cmp_z_1
    );
  COMP_LOOP_1_modulo_dev_result_rem_cmp_a_1 <= COMP_LOOP_1_modulo_dev_result_rem_cmp_a;
  COMP_LOOP_1_modulo_dev_result_rem_cmp_b_1 <= COMP_LOOP_1_modulo_dev_result_rem_cmp_b;
  COMP_LOOP_1_modulo_dev_result_rem_cmp_z <= COMP_LOOP_1_modulo_dev_result_rem_cmp_z_1;

  COMP_LOOP_1_tmp_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_bl_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 5,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_1_tmp_lshift_rg_a,
      s => COMP_LOOP_1_tmp_lshift_rg_s,
      z => COMP_LOOP_1_tmp_lshift_rg_z
    );
  COMP_LOOP_1_tmp_lshift_rg_a(0) <= '1';
  COMP_LOOP_1_tmp_lshift_rg_s <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(MUX1HOT_v_4_3_2(STAGE_LOOP_i_3_0_sva,
      COMP_LOOP_1_tmp_acc_cse_sva, z_out_2, STD_LOGIC_VECTOR'( (NOT (fsm_output(1)))
      & (and_dcpl_10 AND nor_64_cse AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"))) & (NOT (fsm_output(0)))))));
  z_out_4 <= COMP_LOOP_1_tmp_lshift_rg_z;

  inPlaceNTT_DIF_core_core_fsm_inst : inPlaceNTT_DIF_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIF_core_core_fsm_inst_fsm_output,
      COMP_LOOP_C_79_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0,
      COMP_LOOP_C_157_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIF_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_79_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_COMP_LOOP_C_157_tr0 <= NOT COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm;
  inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out(10);
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= NOT (z_out_3(4));

  or_82_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_141_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  or_5_cse <= (fsm_output(4)) OR (fsm_output(6));
  and_119_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_1_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0), 10), 11) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_1_sva_8_0 & '0'), 10),
      11), 11));
  COMP_LOOP_1_acc_10_itm_10_1_1 <= COMP_LOOP_1_acc_10_nl(10 DOWNTO 1);
  nor_tmp_6 <= (fsm_output(4)) AND (fsm_output(6));
  and_dcpl_6 <= NOT((fsm_output(0)) OR (fsm_output(7)));
  and_dcpl_7 <= NOT((fsm_output(5)) OR (fsm_output(1)));
  and_dcpl_8 <= and_dcpl_7 AND and_dcpl_6;
  and_dcpl_10 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_11 <= and_dcpl_10 AND (NOT (fsm_output(2))) AND (NOT (fsm_output(6)));
  and_dcpl_13 <= (fsm_output(0)) AND (fsm_output(7));
  and_dcpl_14 <= (fsm_output(5)) AND (NOT (fsm_output(1)));
  or_tmp_36 <= (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4));
  mux_tmp_35 <= MUX_s_1_2_2((fsm_output(6)), or_tmp_36, fsm_output(5));
  and_dcpl_17 <= (fsm_output(2)) AND (NOT (fsm_output(6)));
  and_dcpl_18 <= and_dcpl_10 AND and_dcpl_17;
  and_dcpl_19 <= and_dcpl_18 AND and_dcpl_8;
  nor_35_cse <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_39 <= nor_35_cse OR (fsm_output(7));
  or_46_nl <= (fsm_output(5)) OR (fsm_output(7));
  or_45_nl <= (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_tmp_38 <= MUX_s_1_2_2(or_46_nl, or_45_nl, fsm_output(6));
  or_tmp_42 <= (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))))
      OR (fsm_output(7));
  mux_tmp_40 <= MUX_s_1_2_2(or_tmp_42, or_tmp_39, fsm_output(4));
  or_tmp_43 <= (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("010"))))
      OR (fsm_output(7));
  or_51_nl <= (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_tmp_44 <= MUX_s_1_2_2(or_51_nl, (fsm_output(7)), fsm_output(6));
  nor_tmp_11 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  or_tmp_48 <= (fsm_output(7)) OR nor_tmp_11;
  nand_nl <= NOT((fsm_output(7)) AND (CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))));
  mux_tmp_54 <= MUX_s_1_2_2(nand_nl, or_tmp_48, fsm_output(5));
  and_dcpl_21 <= (fsm_output(0)) AND (NOT (fsm_output(7)));
  and_dcpl_22 <= (NOT (fsm_output(5))) AND (fsm_output(1));
  and_dcpl_23 <= and_dcpl_22 AND and_dcpl_21;
  and_dcpl_25 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_26 <= and_dcpl_25 AND (NOT (fsm_output(2))) AND (fsm_output(6));
  and_dcpl_27 <= and_dcpl_26 AND and_dcpl_23;
  and_dcpl_31 <= (NOT (fsm_output(4))) AND (fsm_output(3)) AND (fsm_output(2)) AND
      (fsm_output(6));
  and_dcpl_32 <= and_dcpl_31 AND and_dcpl_14 AND and_dcpl_6;
  and_dcpl_37 <= and_dcpl_10 AND (NOT (fsm_output(2)));
  and_dcpl_50 <= and_dcpl_11 AND and_dcpl_23;
  and_dcpl_53 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_54 <= and_dcpl_53 AND (NOT (fsm_output(5))) AND (NOT (fsm_output(7)));
  nand_10_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm AND nor_tmp_6);
  mux_tmp_61 <= MUX_s_1_2_2(nand_10_nl, or_5_cse, fsm_output(1));
  or_tmp_59 <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR (fsm_output(4));
  mux_tmp_64 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(6));
  and_tmp_4 <= (fsm_output(1)) AND mux_tmp_64;
  and_dcpl_56 <= and_dcpl_26 AND and_dcpl_8;
  and_dcpl_60 <= (NOT (fsm_output(0))) AND (fsm_output(7));
  and_dcpl_63 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")) AND
      and_dcpl_17;
  and_dcpl_65 <= and_dcpl_22 AND and_dcpl_6;
  and_dcpl_67 <= and_dcpl_7 AND and_dcpl_21;
  or_dcpl_9 <= (fsm_output(5)) OR (NOT (fsm_output(1)));
  or_dcpl_11 <= or_tmp_36 OR or_dcpl_9 OR (fsm_output(0)) OR (fsm_output(7));
  or_tmp_78 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR (CONV_SL_1_1(fsm_output(4
      DOWNTO 2)=STD_LOGIC_VECTOR'("111")));
  not_tmp_68 <= NOT(and_119_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000")));
  and_dcpl_81 <= (NOT (fsm_output(2))) AND (NOT (fsm_output(5))) AND (fsm_output(1))
      AND and_dcpl_21;
  and_tmp_6 <= (fsm_output(6)) AND ((CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")))
      OR (fsm_output(4)));
  and_dcpl_107 <= (NOT (fsm_output(3))) AND (NOT (fsm_output(5))) AND and_dcpl_6;
  or_tmp_103 <= (fsm_output(1)) OR (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(4));
  or_124_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(4));
  or_123_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  mux_tmp_108 <= MUX_s_1_2_2(or_124_nl, or_123_nl, fsm_output(1));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_11 AND and_dcpl_14 AND and_dcpl_13;
  VEC_LOOP_j_10_0_sva_9_0_mx0c0 <= and_dcpl_11 AND and_dcpl_67;
  mux_100_nl <= MUX_s_1_2_2(mux_tmp_64, (NOT or_5_cse), COMP_LOOP_acc_10_cse_10_1_sva(0));
  nor_26_nl <= NOT((COMP_LOOP_acc_10_cse_10_1_sva(0)) OR (NOT nor_tmp_6));
  mux_101_nl <= MUX_s_1_2_2(mux_100_nl, nor_26_nl, COMP_LOOP_acc_10_cse_10_1_1_sva(0));
  COMP_LOOP_1_acc_8_itm_mx0c0 <= mux_101_nl AND (NOT (fsm_output(3))) AND and_dcpl_81;
  and_118_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(0)) AND (fsm_output(6)) AND (fsm_output(4));
  mux_102_nl <= MUX_s_1_2_2((NOT or_5_cse), mux_tmp_64, COMP_LOOP_acc_10_cse_10_1_sva(0));
  mux_103_nl <= MUX_s_1_2_2(and_118_nl, mux_102_nl, COMP_LOOP_acc_10_cse_10_1_1_sva(0));
  COMP_LOOP_1_acc_8_itm_mx0c1 <= mux_103_nl AND (NOT (fsm_output(3))) AND and_dcpl_81;
  mux_104_nl <= MUX_s_1_2_2((NOT nor_tmp_6), or_5_cse, fsm_output(0));
  COMP_LOOP_1_acc_8_itm_mx0c2 <= NOT(mux_104_nl OR (fsm_output(3)) OR (NOT (fsm_output(2)))
      OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(7)));
  COMP_LOOP_1_acc_8_itm_mx0c3 <= and_dcpl_25 AND and_dcpl_17 AND (fsm_output(5))
      AND (fsm_output(1)) AND and_dcpl_6;
  COMP_LOOP_1_acc_6_mut_mx0c1 <= and_dcpl_63 AND and_dcpl_67;
  nand_11_nl <= NOT((COMP_LOOP_acc_1_cse_sva(0)) AND (fsm_output(1)) AND (fsm_output(6))
      AND (NOT (fsm_output(2))) AND (fsm_output(4)));
  mux_118_nl <= MUX_s_1_2_2(or_tmp_103, mux_tmp_108, COMP_LOOP_acc_1_cse_sva(0));
  mux_119_nl <= MUX_s_1_2_2(nand_11_nl, mux_118_nl, VEC_LOOP_j_10_0_sva_9_0(0));
  tmp_2_lpi_4_dfm_mx0c1 <= (NOT mux_119_nl) AND and_dcpl_107;
  and_71_nl <= and_dcpl_11 AND and_dcpl_65;
  and_73_nl <= and_dcpl_26 AND and_dcpl_67;
  and_74_nl <= and_dcpl_26 AND and_dcpl_65;
  vec_rsc_0_0_i_radr_d_pff <= MUX1HOT_v_9_4_2((COMP_LOOP_1_acc_10_itm_10_1_1(9 DOWNTO
      1)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_1_cse_sva(9 DOWNTO 1)), (COMP_LOOP_acc_10_cse_10_1_sva(9
      DOWNTO 1)), STD_LOGIC_VECTOR'( and_71_nl & and_dcpl_50 & and_73_nl & and_74_nl));
  and_62_nl <= and_dcpl_31 AND and_dcpl_23;
  and_64_nl <= and_dcpl_18 AND and_dcpl_7 AND and_dcpl_13;
  and_69_nl <= and_dcpl_63 AND and_dcpl_22 AND and_dcpl_60;
  vec_rsc_0_0_i_wadr_d_pff <= MUX1HOT_v_9_4_2((COMP_LOOP_acc_10_cse_10_1_1_sva(9
      DOWNTO 1)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_10_1_sva(9 DOWNTO
      1)), (COMP_LOOP_acc_1_cse_sva(9 DOWNTO 1)), STD_LOGIC_VECTOR'( and_62_nl &
      and_dcpl_56 & and_64_nl & and_69_nl));
  vec_rsc_0_0_i_d_d_pff <= MUX_v_64_2_2(COMP_LOOP_1_modulo_dev_result_rem_cmp_z,
      COMP_LOOP_1_acc_8_itm, and_dcpl_56);
  or_73_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (VEC_LOOP_j_10_0_sva_9_0(0))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_72_nl <= (NOT (fsm_output(0))) OR (fsm_output(4)) OR (COMP_LOOP_acc_10_cse_10_1_sva(0))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_76_nl <= MUX_s_1_2_2(or_73_nl, or_72_nl, fsm_output(2));
  or_137_nl <= (fsm_output(3)) OR mux_76_nl;
  nor_30_nl <= NOT((NOT (fsm_output(4))) OR (COMP_LOOP_acc_1_cse_sva(0)) OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  nor_31_nl <= NOT((fsm_output(4)) OR (COMP_LOOP_acc_10_cse_10_1_1_sva(0)) OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  mux_75_nl <= MUX_s_1_2_2(nor_30_nl, nor_31_nl, fsm_output(0));
  nand_12_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      mux_75_nl);
  mux_77_nl <= MUX_s_1_2_2(or_137_nl, nand_12_nl, fsm_output(1));
  vec_rsc_0_0_i_we_d_pff <= NOT(mux_77_nl OR (fsm_output(5)));
  mux_80_nl <= MUX_s_1_2_2((NOT and_tmp_4), or_tmp_59, COMP_LOOP_acc_10_cse_10_1_sva(0));
  or_77_nl <= (COMP_LOOP_acc_10_cse_10_1_sva(0)) OR (NOT((fsm_output(1)) AND (fsm_output(6))
      AND (fsm_output(4))));
  mux_81_nl <= MUX_s_1_2_2(mux_80_nl, or_77_nl, COMP_LOOP_1_acc_10_itm_10_1_1(0));
  mux_78_nl <= MUX_s_1_2_2(mux_tmp_61, or_tmp_59, COMP_LOOP_acc_1_cse_sva(0));
  or_76_nl <= (COMP_LOOP_acc_1_cse_sva(0)) OR (fsm_output(1)) OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm)
      OR (NOT nor_tmp_6);
  mux_79_nl <= MUX_s_1_2_2(mux_78_nl, or_76_nl, VEC_LOOP_j_10_0_sva_9_0(0));
  mux_82_nl <= MUX_s_1_2_2(mux_81_nl, mux_79_nl, fsm_output(0));
  vec_rsc_0_0_i_re_d_pff <= (NOT mux_82_nl) AND and_dcpl_54;
  or_61_nl <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR (NOT (VEC_LOOP_j_10_0_sva_9_0(0)))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_60_nl <= (NOT (fsm_output(0))) OR (fsm_output(4)) OR (NOT (COMP_LOOP_acc_10_cse_10_1_sva(0)))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_66_nl <= MUX_s_1_2_2(or_61_nl, or_60_nl, fsm_output(2));
  or_138_nl <= (fsm_output(3)) OR mux_66_nl;
  and_130_nl <= (fsm_output(4)) AND (COMP_LOOP_acc_1_cse_sva(0)) AND CONV_SL_1_1(fsm_output(7
      DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  nor_34_nl <= NOT((fsm_output(4)) OR (NOT (COMP_LOOP_acc_10_cse_10_1_1_sva(0)))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  mux_65_nl <= MUX_s_1_2_2(and_130_nl, nor_34_nl, fsm_output(0));
  nand_13_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      mux_65_nl);
  mux_67_nl <= MUX_s_1_2_2(or_138_nl, nand_13_nl, fsm_output(1));
  vec_rsc_0_1_i_we_d_pff <= NOT(mux_67_nl OR (fsm_output(5)));
  nand_7_nl <= NOT((COMP_LOOP_acc_10_cse_10_1_sva(0)) AND (fsm_output(1)) AND (fsm_output(6))
      AND (fsm_output(4)));
  mux_72_nl <= MUX_s_1_2_2(or_tmp_59, (NOT and_tmp_4), COMP_LOOP_acc_10_cse_10_1_sva(0));
  mux_73_nl <= MUX_s_1_2_2(nand_7_nl, mux_72_nl, COMP_LOOP_1_acc_10_itm_10_1_1(0));
  nand_8_nl <= NOT((COMP_LOOP_acc_1_cse_sva(0)) AND (NOT (fsm_output(1))) AND COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm
      AND nor_tmp_6);
  mux_69_nl <= MUX_s_1_2_2(or_tmp_59, mux_tmp_61, COMP_LOOP_acc_1_cse_sva(0));
  mux_70_nl <= MUX_s_1_2_2(nand_8_nl, mux_69_nl, VEC_LOOP_j_10_0_sva_9_0(0));
  mux_74_nl <= MUX_s_1_2_2(mux_73_nl, mux_70_nl, fsm_output(0));
  vec_rsc_0_1_i_re_d_pff <= (NOT mux_74_nl) AND and_dcpl_54;
  twiddle_rsc_0_0_i_radr_d <= MUX_v_9_2_2((z_out_5(8 DOWNTO 0)), (z_out_5(9 DOWNTO
      1)), and_dcpl_50);
  twiddle_rsc_0_0_i_re_d_pff <= and_dcpl_37 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_22 AND (NOT((fsm_output(0)) AND (z_out_5(0))));
  twiddle_rsc_0_1_i_radr_d <= z_out_5(9 DOWNTO 1);
  twiddle_rsc_0_1_i_re_d_pff <= and_dcpl_37 AND nor_35_cse AND (fsm_output(1)) AND
      (fsm_output(0)) AND (NOT (fsm_output(7))) AND (z_out_5(0));
  and_dcpl_121 <= and_dcpl_10 AND (NOT (fsm_output(6))) AND (fsm_output(7)) AND (fsm_output(5))
      AND (NOT (fsm_output(2))) AND (NOT (fsm_output(0))) AND (NOT (fsm_output(1)));
  nand_15_nl <= NOT((fsm_output(6)) AND (fsm_output(4)));
  mux_nl <= MUX_s_1_2_2(nand_15_nl, or_5_cse, fsm_output(0));
  and_dcpl_126 <= NOT(mux_nl OR (fsm_output(3)) OR (NOT (fsm_output(2))) OR (fsm_output(5))
      OR (fsm_output(7)) OR (fsm_output(1)));
  and_dcpl_128 <= NOT((fsm_output(5)) OR (fsm_output(7)));
  and_dcpl_133 <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (NOT (fsm_output(2)))
      OR (fsm_output(6)) OR (NOT and_dcpl_128) OR CONV_SL_1_1(fsm_output(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_139 <= (NOT (fsm_output(3))) AND (fsm_output(4)) AND (NOT (fsm_output(2)))
      AND (fsm_output(6)) AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nor_64_cse <= NOT((fsm_output(2)) OR (fsm_output(6)));
  and_dcpl_150 <= and_dcpl_10 AND nor_64_cse AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_181 <= (fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(2)) AND (NOT
      (fsm_output(6))) AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_188 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("01101100"));
  and_dcpl_193 <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(2)) OR (fsm_output(6)));
  and_dcpl_194 <= and_dcpl_193 AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_197 <= and_dcpl_193 AND and_dcpl_128 AND CONV_SL_1_1(fsm_output(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("10"));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_i_3_0_sva <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( ((and_dcpl_11 AND and_dcpl_8) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1'
          ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"), z_out_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        p_sva <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(nor_36_nl, mux_43_nl, fsm_output(7))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_modulo_dev_result_rem_cmp_b <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        COMP_LOOP_1_modulo_dev_result_rem_cmp_a <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= '0';
        COMP_LOOP_1_tmp_acc_cse_sva <= STD_LOGIC_VECTOR'( "0000");
        COMP_LOOP_2_tmp_mul_idiv_sva_0 <= '0';
      ELSE
        COMP_LOOP_1_modulo_dev_result_rem_cmp_b <= p_sva;
        COMP_LOOP_1_modulo_dev_result_rem_cmp_a <= MUX1HOT_v_64_4_2(z_out_1, COMP_LOOP_1_acc_6_mut,
            COMP_LOOP_1_acc_8_itm, z_out_5, STD_LOGIC_VECTOR'( COMP_LOOP_or_7_nl
            & (NOT mux_57_nl) & nor_46_nl & and_dcpl_32));
        reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= and_dcpl_37 AND (NOT (fsm_output(6)))
            AND (fsm_output(5)) AND (NOT (fsm_output(1))) AND (fsm_output(0)) AND
            (fsm_output(7)) AND (NOT (z_out_3(4)));
        COMP_LOOP_1_tmp_acc_cse_sva <= z_out_2;
        COMP_LOOP_2_tmp_mul_idiv_sva_0 <= z_out_5(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_10_0_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (VEC_LOOP_j_10_0_sva_9_0_mx0c0 OR (and_dcpl_11 AND and_dcpl_14 AND
          and_dcpl_60)) = '1' ) THEN
        VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out(9 DOWNTO 0)), VEC_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_lshift_psp_sva <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (MUX_s_1_2_2(nor_28_nl, mux_84_nl, fsm_output(7))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_10_1_sva_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2((NOT mux_122_nl), or_141_cse, fsm_output(7))) = '1' )
          THEN
        COMP_LOOP_k_10_1_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), reg_COMP_LOOP_k_10_1_ftd_1,
            or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( or_dcpl_11 = '0' ) THEN
        COMP_LOOP_acc_10_cse_10_1_1_sva <= COMP_LOOP_1_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( or_dcpl_11 = '0' ) THEN
        COMP_LOOP_acc_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0(9
            DOWNTO 1)) + UNSIGNED(COMP_LOOP_k_10_1_sva_8_0), 9));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= '0';
      ELSIF ( or_dcpl_11 = '0' ) THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_10_itm <= z_out(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_68, mux_94_nl, fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
            + UNSIGNED(COMP_LOOP_k_10_1_sva_8_0 & '1'), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_10_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_68, mux_10_nl, fsm_output(7))) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_2_acc_10_nl(10 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= '0';
      ELSIF ( (MUX_s_1_2_2(not_tmp_68, mux_98_nl, fsm_output(7))) = '1' ) THEN
        COMP_LOOP_1_slc_COMP_LOOP_acc_10_itm <= COMP_LOOP_1_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_asn_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (NOT(or_tmp_36 OR or_dcpl_9 OR (NOT (fsm_output(0))) OR (fsm_output(7))))
          = '1' ) THEN
        COMP_LOOP_tmp_asn_itm <= twiddle_rsc_0_0_i_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_acc_8_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (COMP_LOOP_1_acc_8_itm_mx0c0 OR COMP_LOOP_1_acc_8_itm_mx0c1 OR COMP_LOOP_1_acc_8_itm_mx0c2
          OR COMP_LOOP_1_acc_8_itm_mx0c3) = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
            z_out_1, COMP_LOOP_1_modulo_dev_result_rem_cmp_z, STD_LOGIC_VECTOR'(
            COMP_LOOP_1_acc_8_itm_mx0c0 & COMP_LOOP_1_acc_8_itm_mx0c1 & COMP_LOOP_1_acc_8_itm_mx0c2
            & COMP_LOOP_1_acc_8_itm_mx0c3));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_acc_6_mut <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (and_dcpl_19 OR COMP_LOOP_1_acc_6_mut_mx0c1 OR and_dcpl_27 OR and_dcpl_32)
          = '1' ) THEN
        COMP_LOOP_1_acc_6_mut <= MUX_v_64_2_2(z_out_1, z_out_5, COMP_LOOP_or_8_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_tmp_mux_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (mux_114_nl OR (fsm_output(7))) = '1' ) THEN
        COMP_LOOP_tmp_mux_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            and_110_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_2_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (((NOT mux_117_nl) AND and_dcpl_107) OR tmp_2_lpi_4_dfm_mx0c1) = '1'
          ) THEN
        tmp_2_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, tmp_2_lpi_4_dfm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_COMP_LOOP_k_10_1_ftd_1 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( or_dcpl_11 = '0' ) THEN
        reg_COMP_LOOP_k_10_1_ftd_1 <= z_out_3(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  nor_36_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000000")));
  mux_43_nl <= MUX_s_1_2_2(mux_tmp_35, or_141_cse, fsm_output(1));
  COMP_LOOP_or_7_nl <= and_dcpl_19 OR and_dcpl_27;
  mux_55_nl <= MUX_s_1_2_2(mux_tmp_44, mux_tmp_38, fsm_output(4));
  mux_56_nl <= MUX_s_1_2_2(mux_55_nl, or_tmp_43, fsm_output(3));
  or_50_nl <= (fsm_output(0)) OR (fsm_output(4));
  mux_52_nl <= MUX_s_1_2_2(mux_tmp_44, or_tmp_42, or_50_nl);
  or_49_nl <= (NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10"))))
      OR (fsm_output(7));
  mux_50_nl <= MUX_s_1_2_2(or_49_nl, mux_tmp_40, fsm_output(0));
  mux_53_nl <= MUX_s_1_2_2(mux_52_nl, mux_50_nl, fsm_output(3));
  mux_46_nl <= MUX_s_1_2_2(mux_tmp_38, or_tmp_39, fsm_output(4));
  mux_48_nl <= MUX_s_1_2_2(mux_tmp_40, mux_46_nl, fsm_output(0));
  mux_49_nl <= MUX_s_1_2_2(or_tmp_43, mux_48_nl, fsm_output(3));
  mux_54_nl <= MUX_s_1_2_2(mux_53_nl, mux_49_nl, fsm_output(1));
  mux_57_nl <= MUX_s_1_2_2(mux_56_nl, mux_54_nl, fsm_output(2));
  mux_60_nl <= MUX_s_1_2_2((NOT or_tmp_48), or_tmp_48, fsm_output(5));
  mux_62_nl <= MUX_s_1_2_2(mux_tmp_54, mux_60_nl, fsm_output(0));
  mux_58_nl <= MUX_s_1_2_2((NOT nor_tmp_11), nor_tmp_11, fsm_output(7));
  or_52_nl <= (fsm_output(7)) OR (fsm_output(4));
  mux_59_nl <= MUX_s_1_2_2(mux_58_nl, or_52_nl, fsm_output(5));
  mux_63_nl <= MUX_s_1_2_2(mux_62_nl, mux_59_nl, fsm_output(1));
  mux_64_nl <= MUX_s_1_2_2(mux_tmp_54, mux_63_nl, fsm_output(2));
  nor_46_nl <= NOT(mux_64_nl OR (fsm_output(6)));
  VEC_LOOP_j_not_1_nl <= NOT VEC_LOOP_j_10_0_sva_9_0_mx0c0;
  nor_28_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000000")));
  mux_84_nl <= MUX_s_1_2_2(mux_tmp_35, or_141_cse, or_82_cse);
  or_132_nl <= (NOT (fsm_output(0))) OR (fsm_output(5));
  or_133_nl <= (fsm_output(0)) OR (NOT (fsm_output(5)));
  mux_35_nl <= MUX_s_1_2_2(or_132_nl, or_133_nl, fsm_output(7));
  or_nl <= mux_35_nl OR (fsm_output(4)) OR (NOT and_dcpl_53) OR (fsm_output(6)) OR
      (fsm_output(1));
  and_nl <= (fsm_output(6)) AND (fsm_output(4)) AND (CONV_SL_1_1(fsm_output(3 DOWNTO
      2)/=STD_LOGIC_VECTOR'("00")));
  nor_nl <= NOT((fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(2)));
  mux_120_nl <= MUX_s_1_2_2(nor_nl, (fsm_output(4)), fsm_output(6));
  mux_121_nl <= MUX_s_1_2_2(and_nl, mux_120_nl, fsm_output(1));
  mux_122_nl <= MUX_s_1_2_2(mux_121_nl, (fsm_output(6)), fsm_output(5));
  mux_94_nl <= MUX_s_1_2_2(or_141_cse, or_tmp_78, fsm_output(1));
  COMP_LOOP_2_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0), 10), 11) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_1_sva_8_0 & '1'), 10),
      11), 11));
  or_9_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000"));
  or_93_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000"));
  mux_10_nl <= MUX_s_1_2_2(or_9_nl, or_93_nl, or_82_cse);
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_3 & '0') + SIGNED('1'
      & (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO 1)))) + SIGNED'( "00000000001"),
      11));
  mux_98_nl <= MUX_s_1_2_2(or_141_cse, or_tmp_78, and_119_cse);
  COMP_LOOP_or_8_nl <= COMP_LOOP_1_acc_6_mut_mx0c1 OR and_dcpl_32;
  and_110_nl <= and_dcpl_10 AND (fsm_output(2)) AND nor_35_cse AND (NOT(CONV_SL_1_1(fsm_output(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")))) AND (NOT (fsm_output(7))) AND COMP_LOOP_2_tmp_mul_idiv_sva_0;
  nor_25_nl <= NOT((fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(4)));
  mux_113_nl <= MUX_s_1_2_2(nor_25_nl, and_tmp_6, fsm_output(5));
  mux_112_nl <= MUX_s_1_2_2(and_dcpl_11, and_tmp_6, fsm_output(5));
  mux_114_nl <= MUX_s_1_2_2(mux_113_nl, mux_112_nl, or_82_cse);
  mux_116_nl <= MUX_s_1_2_2(mux_tmp_108, or_tmp_103, COMP_LOOP_acc_1_cse_sva(0));
  or_120_nl <= (COMP_LOOP_acc_1_cse_sva(0)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(6)))
      OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  mux_117_nl <= MUX_s_1_2_2(mux_116_nl, or_120_nl, VEC_LOOP_j_10_0_sva_9_0(0));
  COMP_LOOP_mux_11_nl <= MUX_v_11_2_2(('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10 DOWNTO
      1)))), STAGE_LOOP_lshift_psp_sva, and_dcpl_121);
  COMP_LOOP_COMP_LOOP_nand_1_nl <= NOT(and_dcpl_121 AND (NOT(and_dcpl_10 AND (NOT(CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("00")))) AND (NOT((fsm_output(5)) OR (fsm_output(2))))
      AND (NOT (fsm_output(0))) AND (fsm_output(1)))));
  COMP_LOOP_mux_12_nl <= MUX_v_10_2_2((COMP_LOOP_k_10_1_sva_8_0 & '1'), VEC_LOOP_j_10_0_sva_9_0,
      and_dcpl_121);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_11_nl & COMP_LOOP_COMP_LOOP_nand_1_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_12_nl & '1'), 11), 12),
      12));
  z_out <= acc_nl(11 DOWNTO 1);
  COMP_LOOP_and_3_nl <= (NOT (VEC_LOOP_j_10_0_sva_9_0(0))) AND and_dcpl_133;
  COMP_LOOP_and_4_nl <= (VEC_LOOP_j_10_0_sva_9_0(0)) AND and_dcpl_133;
  COMP_LOOP_COMP_LOOP_mux1h_1_nl <= MUX1HOT_v_64_3_2(tmp_2_lpi_4_dfm, vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_q_d, STD_LOGIC_VECTOR'( (NOT and_dcpl_133) & COMP_LOOP_and_3_nl
      & COMP_LOOP_and_4_nl));
  COMP_LOOP_or_10_nl <= (NOT and_dcpl_126) OR and_dcpl_133 OR and_dcpl_139;
  COMP_LOOP_mux_13_nl <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, COMP_LOOP_acc_10_cse_10_1_sva(0));
  COMP_LOOP_mux1h_18_nl <= MUX1HOT_v_64_3_2(COMP_LOOP_1_acc_8_itm, (NOT COMP_LOOP_1_acc_8_itm),
      (NOT COMP_LOOP_mux_13_nl), STD_LOGIC_VECTOR'( and_dcpl_126 & and_dcpl_133 &
      and_dcpl_139));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_mux1h_1_nl
      & COMP_LOOP_or_10_nl) + UNSIGNED(COMP_LOOP_mux1h_18_nl & '1'), 65));
  z_out_1 <= acc_1_nl(64 DOWNTO 1);
  STAGE_LOOP_mux_8_nl <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (NOT STAGE_LOOP_i_3_0_sva),
      and_dcpl_150);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_8_nl) + UNSIGNED('1'
      & (NOT and_dcpl_150) & STD_LOGIC_VECTOR'( "11")), 4));
  and_221_nl <= and_dcpl_10 AND nor_64_cse AND (fsm_output(5)) AND (fsm_output(7))
      AND (NOT (fsm_output(1))) AND (fsm_output(0));
  COMP_LOOP_mux_14_nl <= MUX_v_9_2_2(COMP_LOOP_k_10_1_sva_8_0, (STD_LOGIC_VECTOR'(
      "00001") & (NOT z_out_2)), and_221_nl);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_14_nl),
      10) + UNSIGNED'( "0000000001"), 10));
  COMP_LOOP_mux1h_19_nl <= MUX1HOT_v_55_3_2((COMP_LOOP_tmp_asn_itm(63 DOWNTO 9)),
      (COMP_LOOP_tmp_mux_itm(63 DOWNTO 9)), (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000")
      & (z_out_4(9))), STD_LOGIC_VECTOR'( and_dcpl_181 & and_dcpl_188 & and_dcpl_194));
  not_337_nl <= NOT and_dcpl_197;
  COMP_LOOP_and_5_nl <= MUX_v_55_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux1h_19_nl, not_337_nl);
  COMP_LOOP_or_11_nl <= and_dcpl_194 OR and_dcpl_197;
  COMP_LOOP_mux1h_20_nl <= MUX1HOT_v_9_3_2((COMP_LOOP_tmp_asn_itm(8 DOWNTO 0)), (COMP_LOOP_tmp_mux_itm(8
      DOWNTO 0)), (z_out_4(8 DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_181 & and_dcpl_188
      & COMP_LOOP_or_11_nl));
  COMP_LOOP_or_12_nl <= and_dcpl_181 OR and_dcpl_188;
  COMP_LOOP_mux1h_21_nl <= MUX1HOT_v_64_3_2(COMP_LOOP_1_modulo_dev_result_rem_cmp_z,
      (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_10_1_sva_8_0 & '1'), (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_10_1_sva_8_0), STD_LOGIC_VECTOR'( COMP_LOOP_or_12_nl & and_dcpl_194
      & and_dcpl_197));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_and_5_nl
      & COMP_LOOP_mux1h_20_nl) * UNSIGNED(COMP_LOOP_mux1h_21_nl)), 64));
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
    vec_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_re : OUT STD_LOGIC;
    vec_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_re : OUT STD_LOGIC;
    vec_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_re : OUT STD_LOGIC;
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_1_re : OUT STD_LOGIC;
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIF;

ARCHITECTURE v6 OF inPlaceNTT_DIF IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d_iff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_re_d_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff : STD_LOGIC_VECTOR (8
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  vec_rsc_0_0_i : inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_5_64_9_512_512_64_5_gen
    PORT MAP(
      we => vec_rsc_0_0_we,
      d => vec_rsc_0_0_i_d,
      wadr => vec_rsc_0_0_i_wadr,
      q => vec_rsc_0_0_i_q,
      re => vec_rsc_0_0_re,
      radr => vec_rsc_0_0_i_radr,
      radr_d => vec_rsc_0_0_i_radr_d,
      wadr_d => vec_rsc_0_0_i_wadr_d,
      d_d => vec_rsc_0_0_i_d_d,
      we_d => vec_rsc_0_0_i_we_d_iff,
      re_d => vec_rsc_0_0_i_re_d_iff,
      q_d => vec_rsc_0_0_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_0_i_we_d_iff
    );
  vec_rsc_0_0_d <= vec_rsc_0_0_i_d;
  vec_rsc_0_0_wadr <= vec_rsc_0_0_i_wadr;
  vec_rsc_0_0_i_q <= vec_rsc_0_0_q;
  vec_rsc_0_0_radr <= vec_rsc_0_0_i_radr;
  vec_rsc_0_0_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_0_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;
  vec_rsc_0_0_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d_1;

  vec_rsc_0_1_i : inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_6_64_9_512_512_64_5_gen
    PORT MAP(
      we => vec_rsc_0_1_we,
      d => vec_rsc_0_1_i_d,
      wadr => vec_rsc_0_1_i_wadr,
      q => vec_rsc_0_1_i_q,
      re => vec_rsc_0_1_re,
      radr => vec_rsc_0_1_i_radr,
      radr_d => vec_rsc_0_1_i_radr_d,
      wadr_d => vec_rsc_0_1_i_wadr_d,
      d_d => vec_rsc_0_1_i_d_d,
      we_d => vec_rsc_0_1_i_we_d_iff,
      re_d => vec_rsc_0_1_i_re_d_iff,
      q_d => vec_rsc_0_1_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_1_i_we_d_iff
    );
  vec_rsc_0_1_d <= vec_rsc_0_1_i_d;
  vec_rsc_0_1_wadr <= vec_rsc_0_1_i_wadr;
  vec_rsc_0_1_i_q <= vec_rsc_0_1_q;
  vec_rsc_0_1_radr <= vec_rsc_0_1_i_radr;
  vec_rsc_0_1_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  vec_rsc_0_1_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;
  vec_rsc_0_1_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d_1;

  twiddle_rsc_0_0_i : inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_7_64_9_512_512_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_0_i_q,
      re => twiddle_rsc_0_0_re,
      radr => twiddle_rsc_0_0_i_radr,
      radr_d => twiddle_rsc_0_0_i_radr_d_1,
      re_d => twiddle_rsc_0_0_i_re_d_iff,
      q_d => twiddle_rsc_0_0_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_re_d_iff
    );
  twiddle_rsc_0_0_i_q <= twiddle_rsc_0_0_q;
  twiddle_rsc_0_0_radr <= twiddle_rsc_0_0_i_radr;
  twiddle_rsc_0_0_i_radr_d_1 <= twiddle_rsc_0_0_i_radr_d;
  twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d_1;

  twiddle_rsc_0_1_i : inPlaceNTT_DIF_ccs_sample_mem_ccs_ram_sync_1R1W_rport_8_64_9_512_512_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_1_i_q,
      re => twiddle_rsc_0_1_re,
      radr => twiddle_rsc_0_1_i_radr,
      radr_d => twiddle_rsc_0_1_i_radr_d_1,
      re_d => twiddle_rsc_0_1_i_re_d_iff,
      q_d => twiddle_rsc_0_1_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_re_d_iff
    );
  twiddle_rsc_0_1_i_q <= twiddle_rsc_0_1_q;
  twiddle_rsc_0_1_radr <= twiddle_rsc_0_1_i_radr;
  twiddle_rsc_0_1_i_radr_d_1 <= twiddle_rsc_0_1_i_radr_d;
  twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d_1;

  inPlaceNTT_DIF_core_inst : inPlaceNTT_DIF_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      p_rsc_dat => inPlaceNTT_DIF_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      vec_rsc_0_0_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_q_d => inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d,
      twiddle_rsc_0_0_i_radr_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d,
      twiddle_rsc_0_0_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_radr_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d,
      twiddle_rsc_0_1_i_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d,
      vec_rsc_0_0_i_radr_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff,
      vec_rsc_0_0_i_wadr_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff,
      vec_rsc_0_0_i_d_d_pff => inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff,
      vec_rsc_0_0_i_we_d_pff => vec_rsc_0_0_i_we_d_iff,
      vec_rsc_0_0_i_re_d_pff => vec_rsc_0_0_i_re_d_iff,
      vec_rsc_0_1_i_we_d_pff => vec_rsc_0_1_i_we_d_iff,
      vec_rsc_0_1_i_re_d_pff => vec_rsc_0_1_i_re_d_iff,
      twiddle_rsc_0_0_i_re_d_pff => twiddle_rsc_0_0_i_re_d_iff,
      twiddle_rsc_0_1_i_re_d_pff => twiddle_rsc_0_1_i_re_d_iff
    );
  inPlaceNTT_DIF_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d;
  inPlaceNTT_DIF_core_inst_vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d;
  twiddle_rsc_0_0_i_radr_d <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_radr_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  twiddle_rsc_0_1_i_radr_d <= inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_radr_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  vec_rsc_0_0_i_radr_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_radr_d_pff;
  vec_rsc_0_0_i_wadr_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_wadr_d_pff;
  vec_rsc_0_0_i_d_d_iff <= inPlaceNTT_DIF_core_inst_vec_rsc_0_0_i_d_d_pff;

END v6;



