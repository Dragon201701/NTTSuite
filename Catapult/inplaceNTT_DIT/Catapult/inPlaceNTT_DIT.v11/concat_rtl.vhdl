
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

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Mon May 17 21:37:11 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen;

ARCHITECTURE v11 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen;

ARCHITECTURE v11 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
    modExp_while_C_47_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v11 OF inPlaceNTT_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  TYPE inPlaceNTT_DIT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, STAGE_LOOP_C_1,
      STAGE_LOOP_C_2, STAGE_LOOP_C_3, STAGE_LOOP_C_4, STAGE_LOOP_C_5, STAGE_LOOP_C_6,
      STAGE_LOOP_C_7, STAGE_LOOP_C_8, STAGE_LOOP_C_9, STAGE_LOOP_C_10, modExp_while_C_0,
      modExp_while_C_1, modExp_while_C_2, modExp_while_C_3, modExp_while_C_4, modExp_while_C_5,
      modExp_while_C_6, modExp_while_C_7, modExp_while_C_8, modExp_while_C_9, modExp_while_C_10,
      modExp_while_C_11, modExp_while_C_12, modExp_while_C_13, modExp_while_C_14,
      modExp_while_C_15, modExp_while_C_16, modExp_while_C_17, modExp_while_C_18,
      modExp_while_C_19, modExp_while_C_20, modExp_while_C_21, modExp_while_C_22,
      modExp_while_C_23, modExp_while_C_24, modExp_while_C_25, modExp_while_C_26,
      modExp_while_C_27, modExp_while_C_28, modExp_while_C_29, modExp_while_C_30,
      modExp_while_C_31, modExp_while_C_32, modExp_while_C_33, modExp_while_C_34,
      modExp_while_C_35, modExp_while_C_36, modExp_while_C_37, modExp_while_C_38,
      modExp_while_C_39, modExp_while_C_40, modExp_while_C_41, modExp_while_C_42,
      modExp_while_C_43, modExp_while_C_44, modExp_while_C_45, modExp_while_C_46,
      modExp_while_C_47, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0,
      COMP_LOOP_1_modExp_1_while_C_1, COMP_LOOP_1_modExp_1_while_C_2, COMP_LOOP_1_modExp_1_while_C_3,
      COMP_LOOP_1_modExp_1_while_C_4, COMP_LOOP_1_modExp_1_while_C_5, COMP_LOOP_1_modExp_1_while_C_6,
      COMP_LOOP_1_modExp_1_while_C_7, COMP_LOOP_1_modExp_1_while_C_8, COMP_LOOP_1_modExp_1_while_C_9,
      COMP_LOOP_1_modExp_1_while_C_10, COMP_LOOP_1_modExp_1_while_C_11, COMP_LOOP_1_modExp_1_while_C_12,
      COMP_LOOP_1_modExp_1_while_C_13, COMP_LOOP_1_modExp_1_while_C_14, COMP_LOOP_1_modExp_1_while_C_15,
      COMP_LOOP_1_modExp_1_while_C_16, COMP_LOOP_1_modExp_1_while_C_17, COMP_LOOP_1_modExp_1_while_C_18,
      COMP_LOOP_1_modExp_1_while_C_19, COMP_LOOP_1_modExp_1_while_C_20, COMP_LOOP_1_modExp_1_while_C_21,
      COMP_LOOP_1_modExp_1_while_C_22, COMP_LOOP_1_modExp_1_while_C_23, COMP_LOOP_1_modExp_1_while_C_24,
      COMP_LOOP_1_modExp_1_while_C_25, COMP_LOOP_1_modExp_1_while_C_26, COMP_LOOP_1_modExp_1_while_C_27,
      COMP_LOOP_1_modExp_1_while_C_28, COMP_LOOP_1_modExp_1_while_C_29, COMP_LOOP_1_modExp_1_while_C_30,
      COMP_LOOP_1_modExp_1_while_C_31, COMP_LOOP_1_modExp_1_while_C_32, COMP_LOOP_1_modExp_1_while_C_33,
      COMP_LOOP_1_modExp_1_while_C_34, COMP_LOOP_1_modExp_1_while_C_35, COMP_LOOP_1_modExp_1_while_C_36,
      COMP_LOOP_1_modExp_1_while_C_37, COMP_LOOP_1_modExp_1_while_C_38, COMP_LOOP_1_modExp_1_while_C_39,
      COMP_LOOP_1_modExp_1_while_C_40, COMP_LOOP_1_modExp_1_while_C_41, COMP_LOOP_1_modExp_1_while_C_42,
      COMP_LOOP_1_modExp_1_while_C_43, COMP_LOOP_1_modExp_1_while_C_44, COMP_LOOP_1_modExp_1_while_C_45,
      COMP_LOOP_1_modExp_1_while_C_46, COMP_LOOP_1_modExp_1_while_C_47, COMP_LOOP_C_2,
      COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5, COMP_LOOP_C_6, COMP_LOOP_C_7,
      COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10, COMP_LOOP_C_11, COMP_LOOP_C_12,
      COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15, COMP_LOOP_C_16, COMP_LOOP_C_17,
      COMP_LOOP_C_18, COMP_LOOP_C_19, COMP_LOOP_C_20, COMP_LOOP_C_21, COMP_LOOP_C_22,
      COMP_LOOP_C_23, COMP_LOOP_C_24, COMP_LOOP_C_25, COMP_LOOP_C_26, COMP_LOOP_C_27,
      COMP_LOOP_C_28, COMP_LOOP_C_29, COMP_LOOP_C_30, COMP_LOOP_C_31, COMP_LOOP_C_32,
      COMP_LOOP_C_33, COMP_LOOP_C_34, COMP_LOOP_C_35, COMP_LOOP_C_36, COMP_LOOP_C_37,
      COMP_LOOP_C_38, COMP_LOOP_C_39, COMP_LOOP_C_40, COMP_LOOP_C_41, COMP_LOOP_C_42,
      COMP_LOOP_C_43, COMP_LOOP_C_44, COMP_LOOP_C_45, COMP_LOOP_C_46, COMP_LOOP_C_47,
      COMP_LOOP_C_48, COMP_LOOP_C_49, COMP_LOOP_C_50, COMP_LOOP_C_51, COMP_LOOP_C_52,
      COMP_LOOP_C_53, COMP_LOOP_C_54, COMP_LOOP_C_55, COMP_LOOP_C_56, COMP_LOOP_C_57,
      COMP_LOOP_C_58, COMP_LOOP_C_59, COMP_LOOP_C_60, COMP_LOOP_C_61, COMP_LOOP_C_62,
      COMP_LOOP_C_63, COMP_LOOP_C_64, COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67,
      COMP_LOOP_C_68, COMP_LOOP_C_69, COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72,
      COMP_LOOP_C_73, COMP_LOOP_C_74, COMP_LOOP_C_75, COMP_LOOP_C_76, COMP_LOOP_C_77,
      COMP_LOOP_2_modExp_1_while_C_0, COMP_LOOP_2_modExp_1_while_C_1, COMP_LOOP_2_modExp_1_while_C_2,
      COMP_LOOP_2_modExp_1_while_C_3, COMP_LOOP_2_modExp_1_while_C_4, COMP_LOOP_2_modExp_1_while_C_5,
      COMP_LOOP_2_modExp_1_while_C_6, COMP_LOOP_2_modExp_1_while_C_7, COMP_LOOP_2_modExp_1_while_C_8,
      COMP_LOOP_2_modExp_1_while_C_9, COMP_LOOP_2_modExp_1_while_C_10, COMP_LOOP_2_modExp_1_while_C_11,
      COMP_LOOP_2_modExp_1_while_C_12, COMP_LOOP_2_modExp_1_while_C_13, COMP_LOOP_2_modExp_1_while_C_14,
      COMP_LOOP_2_modExp_1_while_C_15, COMP_LOOP_2_modExp_1_while_C_16, COMP_LOOP_2_modExp_1_while_C_17,
      COMP_LOOP_2_modExp_1_while_C_18, COMP_LOOP_2_modExp_1_while_C_19, COMP_LOOP_2_modExp_1_while_C_20,
      COMP_LOOP_2_modExp_1_while_C_21, COMP_LOOP_2_modExp_1_while_C_22, COMP_LOOP_2_modExp_1_while_C_23,
      COMP_LOOP_2_modExp_1_while_C_24, COMP_LOOP_2_modExp_1_while_C_25, COMP_LOOP_2_modExp_1_while_C_26,
      COMP_LOOP_2_modExp_1_while_C_27, COMP_LOOP_2_modExp_1_while_C_28, COMP_LOOP_2_modExp_1_while_C_29,
      COMP_LOOP_2_modExp_1_while_C_30, COMP_LOOP_2_modExp_1_while_C_31, COMP_LOOP_2_modExp_1_while_C_32,
      COMP_LOOP_2_modExp_1_while_C_33, COMP_LOOP_2_modExp_1_while_C_34, COMP_LOOP_2_modExp_1_while_C_35,
      COMP_LOOP_2_modExp_1_while_C_36, COMP_LOOP_2_modExp_1_while_C_37, COMP_LOOP_2_modExp_1_while_C_38,
      COMP_LOOP_2_modExp_1_while_C_39, COMP_LOOP_2_modExp_1_while_C_40, COMP_LOOP_2_modExp_1_while_C_41,
      COMP_LOOP_2_modExp_1_while_C_42, COMP_LOOP_2_modExp_1_while_C_43, COMP_LOOP_2_modExp_1_while_C_44,
      COMP_LOOP_2_modExp_1_while_C_45, COMP_LOOP_2_modExp_1_while_C_46, COMP_LOOP_2_modExp_1_while_C_47,
      COMP_LOOP_C_78, COMP_LOOP_C_79, COMP_LOOP_C_80, COMP_LOOP_C_81, COMP_LOOP_C_82,
      COMP_LOOP_C_83, COMP_LOOP_C_84, COMP_LOOP_C_85, COMP_LOOP_C_86, COMP_LOOP_C_87,
      COMP_LOOP_C_88, COMP_LOOP_C_89, COMP_LOOP_C_90, COMP_LOOP_C_91, COMP_LOOP_C_92,
      COMP_LOOP_C_93, COMP_LOOP_C_94, COMP_LOOP_C_95, COMP_LOOP_C_96, COMP_LOOP_C_97,
      COMP_LOOP_C_98, COMP_LOOP_C_99, COMP_LOOP_C_100, COMP_LOOP_C_101, COMP_LOOP_C_102,
      COMP_LOOP_C_103, COMP_LOOP_C_104, COMP_LOOP_C_105, COMP_LOOP_C_106, COMP_LOOP_C_107,
      COMP_LOOP_C_108, COMP_LOOP_C_109, COMP_LOOP_C_110, COMP_LOOP_C_111, COMP_LOOP_C_112,
      COMP_LOOP_C_113, COMP_LOOP_C_114, COMP_LOOP_C_115, COMP_LOOP_C_116, COMP_LOOP_C_117,
      COMP_LOOP_C_118, COMP_LOOP_C_119, COMP_LOOP_C_120, COMP_LOOP_C_121, COMP_LOOP_C_122,
      COMP_LOOP_C_123, COMP_LOOP_C_124, COMP_LOOP_C_125, COMP_LOOP_C_126, COMP_LOOP_C_127,
      COMP_LOOP_C_128, COMP_LOOP_C_129, COMP_LOOP_C_130, COMP_LOOP_C_131, COMP_LOOP_C_132,
      COMP_LOOP_C_133, COMP_LOOP_C_134, COMP_LOOP_C_135, COMP_LOOP_C_136, COMP_LOOP_C_137,
      COMP_LOOP_C_138, COMP_LOOP_C_139, COMP_LOOP_C_140, COMP_LOOP_C_141, COMP_LOOP_C_142,
      COMP_LOOP_C_143, COMP_LOOP_C_144, COMP_LOOP_C_145, COMP_LOOP_C_146, COMP_LOOP_C_147,
      COMP_LOOP_C_148, COMP_LOOP_C_149, COMP_LOOP_C_150, COMP_LOOP_C_151, COMP_LOOP_C_152,
      VEC_LOOP_C_0, STAGE_LOOP_C_11, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_10_tr0, modExp_while_C_47_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_47_tr0, COMP_LOOP_C_76_tr0,
      COMP_LOOP_2_modExp_1_while_C_47_tr0, COMP_LOOP_C_152_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_11_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001");
        state_var_NS <= STAGE_LOOP_C_1;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010");
        state_var_NS <= STAGE_LOOP_C_2;
      WHEN STAGE_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000011");
        state_var_NS <= STAGE_LOOP_C_3;
      WHEN STAGE_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        state_var_NS <= STAGE_LOOP_C_4;
      WHEN STAGE_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000101");
        state_var_NS <= STAGE_LOOP_C_5;
      WHEN STAGE_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000110");
        state_var_NS <= STAGE_LOOP_C_6;
      WHEN STAGE_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= STAGE_LOOP_C_7;
      WHEN STAGE_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= STAGE_LOOP_C_8;
      WHEN STAGE_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= STAGE_LOOP_C_9;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= STAGE_LOOP_C_10;
      WHEN STAGE_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        IF ( STAGE_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= modExp_while_C_39;
      WHEN modExp_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= modExp_while_C_40;
      WHEN modExp_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= modExp_while_C_41;
      WHEN modExp_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= modExp_while_C_42;
      WHEN modExp_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= modExp_while_C_43;
      WHEN modExp_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= modExp_while_C_44;
      WHEN modExp_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= modExp_while_C_45;
      WHEN modExp_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= modExp_while_C_46;
      WHEN modExp_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= modExp_while_C_47;
      WHEN modExp_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        IF ( modExp_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_12;
      WHEN COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_13;
      WHEN COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_14;
      WHEN COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_15;
      WHEN COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_16;
      WHEN COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_17;
      WHEN COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_18;
      WHEN COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_19;
      WHEN COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_20;
      WHEN COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_21;
      WHEN COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_22;
      WHEN COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_23;
      WHEN COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_24;
      WHEN COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_25;
      WHEN COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_26;
      WHEN COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_27;
      WHEN COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_28;
      WHEN COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_29;
      WHEN COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_30;
      WHEN COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_31;
      WHEN COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_32;
      WHEN COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_33;
      WHEN COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_34;
      WHEN COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_35;
      WHEN COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_36;
      WHEN COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_37;
      WHEN COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_38;
      WHEN COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_39;
      WHEN COMP_LOOP_1_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_40;
      WHEN COMP_LOOP_1_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_41;
      WHEN COMP_LOOP_1_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_42;
      WHEN COMP_LOOP_1_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_43;
      WHEN COMP_LOOP_1_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_44;
      WHEN COMP_LOOP_1_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_45;
      WHEN COMP_LOOP_1_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_46;
      WHEN COMP_LOOP_1_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_47;
      WHEN COMP_LOOP_1_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        IF ( COMP_LOOP_1_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        IF ( COMP_LOOP_C_76_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_77;
        END IF;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_12;
      WHEN COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_13;
      WHEN COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_14;
      WHEN COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_15;
      WHEN COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_16;
      WHEN COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_17;
      WHEN COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_18;
      WHEN COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_19;
      WHEN COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_20;
      WHEN COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_21;
      WHEN COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_22;
      WHEN COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_23;
      WHEN COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_24;
      WHEN COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_25;
      WHEN COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_26;
      WHEN COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_27;
      WHEN COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_28;
      WHEN COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_29;
      WHEN COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_30;
      WHEN COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_31;
      WHEN COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_32;
      WHEN COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_33;
      WHEN COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_34;
      WHEN COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_35;
      WHEN COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_36;
      WHEN COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_37;
      WHEN COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_38;
      WHEN COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_39;
      WHEN COMP_LOOP_2_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_40;
      WHEN COMP_LOOP_2_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_41;
      WHEN COMP_LOOP_2_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_42;
      WHEN COMP_LOOP_2_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_43;
      WHEN COMP_LOOP_2_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_44;
      WHEN COMP_LOOP_2_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_45;
      WHEN COMP_LOOP_2_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_46;
      WHEN COMP_LOOP_2_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_47;
      WHEN COMP_LOOP_2_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        IF ( COMP_LOOP_2_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_78;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        IF ( COMP_LOOP_C_152_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        IF ( STAGE_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000");
        state_var_NS <= STAGE_LOOP_C_0;
    END CASE;
  END PROCESS inPlaceNTT_DIT_core_core_fsm_1;

  inPlaceNTT_DIT_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS inPlaceNTT_DIT_core_core_fsm_1_REG;

END v11;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
    operator_66_true_div_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
  );
END inPlaceNTT_DIT_core_wait_dp;

ARCHITECTURE v11 OF inPlaceNTT_DIT_core_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL operator_66_true_div_cmp_z_oreg_pconst_63_0 : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  operator_66_true_div_cmp_z_oreg <= operator_66_true_div_cmp_z_oreg_pconst_63_0;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      operator_66_true_div_cmp_z_oreg_pconst_63_0 <= operator_66_true_div_cmp_z(63
          DOWNTO 0);
    END IF;
  END PROCESS;
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    operator_66_true_div_cmp_a : OUT STD_LOGIC_VECTOR (64 DOWNTO 0);
    operator_66_true_div_cmp_b : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
    vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v11 OF inPlaceNTT_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_tmp_4 : STD_LOGIC;
  SIGNAL not_tmp_7 : STD_LOGIC;
  SIGNAL mux_tmp_22 : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL or_tmp_39 : STD_LOGIC;
  SIGNAL or_tmp_62 : STD_LOGIC;
  SIGNAL or_tmp_63 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL not_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL or_tmp_96 : STD_LOGIC;
  SIGNAL or_tmp_99 : STD_LOGIC;
  SIGNAL nor_tmp_35 : STD_LOGIC;
  SIGNAL or_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_109 : STD_LOGIC;
  SIGNAL mux_tmp_110 : STD_LOGIC;
  SIGNAL and_tmp_7 : STD_LOGIC;
  SIGNAL nor_tmp_36 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL mux_tmp_122 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL or_tmp_124 : STD_LOGIC;
  SIGNAL or_tmp_125 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL or_tmp_130 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_120 : STD_LOGIC;
  SIGNAL or_tmp_154 : STD_LOGIC;
  SIGNAL mux_tmp_170 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL xor_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL or_tmp_165 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL or_tmp_170 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_160 : STD_LOGIC;
  SIGNAL mux_tmp_207 : STD_LOGIC;
  SIGNAL mux_tmp_210 : STD_LOGIC;
  SIGNAL or_tmp_203 : STD_LOGIC;
  SIGNAL or_tmp_204 : STD_LOGIC;
  SIGNAL mux_tmp_219 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_35 : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL or_dcpl_37 : STD_LOGIC;
  SIGNAL or_tmp_225 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL or_tmp_227 : STD_LOGIC;
  SIGNAL and_dcpl_169 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL not_tmp_155 : STD_LOGIC;
  SIGNAL or_dcpl_52 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_138_m1c : STD_LOGIC;
  SIGNAL nor_28_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_1_obj_ld_cse : STD_LOGIC;
  SIGNAL or_134_cse : STD_LOGIC;
  SIGNAL and_244_cse : STD_LOGIC;
  SIGNAL and_246_cse : STD_LOGIC;
  SIGNAL nor_119_cse : STD_LOGIC;
  SIGNAL and_241_cse : STD_LOGIC;
  SIGNAL or_38_cse : STD_LOGIC;
  SIGNAL or_308_cse : STD_LOGIC;
  SIGNAL or_12_cse : STD_LOGIC;
  SIGNAL mux_23_cse : STD_LOGIC;
  SIGNAL or_37_cse : STD_LOGIC;
  SIGNAL or_39_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_k_9_1_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL modExp_while_and_itm : STD_LOGIC;
  SIGNAL modExp_while_and_1_itm : STD_LOGIC;
  SIGNAL reg_operator_66_true_div_cmp_b_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_103_itm : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL and_dcpl_215 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL and_dcpl_222 : STD_LOGIC;
  SIGNAL and_dcpl_223 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_243 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_248 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_257 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_7_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_1_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_5_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_1_while_if_mul_mut_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_mx0c0 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL modExp_1_while_and_7 : STD_LOGIC;
  SIGNAL and_147_m1c : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_or_3_cse : STD_LOGIC;
  SIGNAL nor_152_cse : STD_LOGIC;
  SIGNAL mux_151_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_18_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_22_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_7_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL and_90_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL nor_147_nl : STD_LOGIC;
  SIGNAL and_93_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL and_96_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL and_247_nl : STD_LOGIC;
  SIGNAL nor_94_nl : STD_LOGIC;
  SIGNAL and_97_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL and_101_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL or_315_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL or_131_nl : STD_LOGIC;
  SIGNAL nor_136_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL nand_48_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL or_320_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL nand_42_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL nand_29_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL or_312_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL and_211_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL and_117_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL or_142_nl : STD_LOGIC;
  SIGNAL and_120_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL and_208_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL and_209_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL or_170_nl : STD_LOGIC;
  SIGNAL or_168_nl : STD_LOGIC;
  SIGNAL or_167_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL or_345_nl : STD_LOGIC;
  SIGNAL nand_57_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_158_nl : STD_LOGIC;
  SIGNAL nor_159_nl : STD_LOGIC;
  SIGNAL nor_160_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL or_180_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL and_143_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL and_155_nl : STD_LOGIC;
  SIGNAL and_158_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL or_337_nl : STD_LOGIC;
  SIGNAL or_338_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL nor_77_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL nor_69_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL and_170_nl : STD_LOGIC;
  SIGNAL or_217_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL nor_71_nl : STD_LOGIC;
  SIGNAL and_169_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL nor_72_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL and_204_nl : STD_LOGIC;
  SIGNAL nor_73_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL or_209_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL or_208_nl : STD_LOGIC;
  SIGNAL or_206_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL or_74_nl : STD_LOGIC;
  SIGNAL or_202_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_5_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL or_225_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL or_224_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL or_235_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL or_233_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL or_230_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL or_226_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL nor_157_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL and_201_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL and_202_nl : STD_LOGIC;
  SIGNAL and_182_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_40_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL or_276_nl : STD_LOGIC;
  SIGNAL or_275_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL or_26_nl : STD_LOGIC;
  SIGNAL or_24_nl : STD_LOGIC;
  SIGNAL or_305_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL or_127_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL or_321_nl : STD_LOGIC;
  SIGNAL or_322_nl : STD_LOGIC;
  SIGNAL and_213_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL or_150_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL nor_67_nl : STD_LOGIC;
  SIGNAL nor_68_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL nor_62_nl : STD_LOGIC;
  SIGNAL nand_15_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL nand_14_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_28_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL or_157_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL nand_2_nl : STD_LOGIC;
  SIGNAL or_153_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_62_nl : STD_LOGIC;
  SIGNAL and_67_nl : STD_LOGIC;
  SIGNAL mux_89_nl : STD_LOGIC;
  SIGNAL and_235_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL and_71_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL mux_93_nl : STD_LOGIC;
  SIGNAL nand_44_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL nor_105_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL or_95_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL or_102_nl : STD_LOGIC;
  SIGNAL or_101_nl : STD_LOGIC;
  SIGNAL and_224_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL nand_43_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL nor_97_nl : STD_LOGIC;
  SIGNAL and_223_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL or_313_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL nand_31_nl : STD_LOGIC;
  SIGNAL or_111_nl : STD_LOGIC;
  SIGNAL and_220_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL nor_96_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL or_335_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_4_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_and_14_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_12_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_28_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_15_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_75_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_29_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_76_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_or_30_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_77_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_or_31_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nand_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_78_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_not_55_nl : STD_LOGIC;
  SIGNAL and_342_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_79_nl : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL COMP_LOOP_or_32_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_55_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_56_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_57_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_58_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_59_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_60_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_62_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_63_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_67_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_69_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_70_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_71_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_72_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_73_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_74_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_75_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_76_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_77_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_78_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_79_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_80_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_81_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_82_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_83_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_84_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_85_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_86_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_87_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_88_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_89_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_90_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_91_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_92_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_93_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_94_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_95_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_96_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_97_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_98_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_99_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_100_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_101_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_102_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_103_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_104_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_105_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_106_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_107_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_108_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_and_109_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_17_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_4_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_70_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_343_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL nor_161_nl : STD_LOGIC;
  SIGNAL and_344_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL nor_162_nl : STD_LOGIC;
  SIGNAL nor_163_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL r_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL modulo_result_rem_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL STAGE_LOOP_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
      operator_66_true_div_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z : STD_LOGIC_VECTOR
      (64 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z_oreg : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
      modExp_while_C_47_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_76_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_47_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_11_5_2(input_4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_3_2(input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_5_2(input_4 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_63_6_2(input_5 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(62 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(62 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_64_5_2(input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_64_7_2(input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_65_3_2(input_2 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(64 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(64 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
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

  FUNCTION MUX_v_52_2_2(input_0 : STD_LOGIC_VECTOR(51 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(51 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(51 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_63_2_2(input_0 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(62 DOWNTO 0);

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

  FUNCTION MUX_v_65_2_2(input_0 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(64 DOWNTO 0);

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

  r_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 3,
      width => 64
      )
    PORT MAP(
      dat => r_rsci_dat,
      idat => r_rsci_idat_1
    );
  r_rsci_dat <= r_rsc_dat;
  r_rsci_idat <= r_rsci_idat_1;

  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_1_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_1_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_1_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_1_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  modulo_result_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 1
      )
    PORT MAP(
      a => modulo_result_rem_cmp_a_1,
      b => modulo_result_rem_cmp_b_1,
      z => modulo_result_rem_cmp_z_1
    );
  modulo_result_rem_cmp_a_1 <= modulo_result_rem_cmp_a;
  modulo_result_rem_cmp_b_1 <= modulo_result_rem_cmp_b;
  modulo_result_rem_cmp_z <= modulo_result_rem_cmp_z_1;

  STAGE_LOOP_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => STAGE_LOOP_lshift_rg_a,
      s => STAGE_LOOP_lshift_rg_s,
      z => STAGE_LOOP_lshift_rg_z
    );
  STAGE_LOOP_lshift_rg_a(0) <= '1';
  STAGE_LOOP_lshift_rg_s <= STAGE_LOOP_i_3_0_sva;
  STAGE_LOOP_lshift_psp_sva_mx0w0 <= STAGE_LOOP_lshift_rg_z;

  inPlaceNTT_DIT_core_wait_dp_inst : inPlaceNTT_DIT_core_wait_dp
    PORT MAP(
      clk => clk,
      operator_66_true_div_cmp_z => inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z,
      operator_66_true_div_cmp_z_oreg => inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z_oreg
    );
  inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z <= operator_66_true_div_cmp_z;
  operator_66_true_div_cmp_z_oreg <= inPlaceNTT_DIT_core_wait_dp_inst_operator_66_true_div_cmp_z_oreg;

  inPlaceNTT_DIT_core_core_fsm_inst : inPlaceNTT_DIT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIT_core_core_fsm_inst_fsm_output,
      STAGE_LOOP_C_10_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0,
      modExp_while_C_47_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_47_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_76_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_76_tr0,
      COMP_LOOP_2_modExp_1_while_C_47_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_47_tr0,
      COMP_LOOP_C_152_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_11_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 <= NOT (z_out_2(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_76_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_47_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  nor_28_cse <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))));
  or_134_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  operator_66_true_div_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(reg_operator_66_true_div_cmp_b_reg));
  and_138_m1c <= and_dcpl_34 AND and_dcpl_43;
  and_246_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  modExp_result_and_rgt <= (NOT modExp_while_and_1_itm) AND and_138_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_1_itm AND and_138_m1c;
  nor_80_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(6)));
  nor_81_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(6))));
  mux_174_nl <= MUX_s_1_2_2(nor_80_nl, nor_81_nl, fsm_output(2));
  and_147_m1c <= mux_174_nl AND (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(5))
      AND and_dcpl_28;
  and_244_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_12_cse <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(1));
  nor_119_cse <= NOT((fsm_output(3)) OR (fsm_output(6)));
  and_241_cse <= (fsm_output(3)) AND (fsm_output(6));
  COMP_LOOP_or_3_cse <= and_dcpl_51 OR and_dcpl_65;
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0),
      8), 11), 11));
  modulo_qr_sva_1_mx0w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_mut(63
      DOWNTO 0)) + UNSIGNED(p_sva), 64));
  vec_rsc_0_0_i_da_d_1 <= MUX_v_64_2_2((operator_64_false_acc_mut(63 DOWNTO 0)),
      modulo_qr_sva_1_mx0w1, operator_64_false_acc_mut(63));
  COMP_LOOP_1_modExp_1_while_if_mul_mut_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'(
      SIGNED(COMP_LOOP_1_acc_8_itm) * SIGNED(COMP_LOOP_1_acc_5_mut)), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z_oreg(63
      DOWNTO 1)), (COMP_LOOP_1_acc_8_itm(63 DOWNTO 1)), and_dcpl_129);
  modExp_1_while_and_7 <= (operator_64_false_acc_mut(63)) AND modExp_exp_1_0_1_sva;
  or_tmp_4 <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6));
  not_tmp_7 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  or_26_nl <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR (NOT((fsm_output(2)) AND
      (fsm_output(7))));
  or_24_nl <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(7));
  mux_tmp_22 <= MUX_s_1_2_2(or_26_nl, or_24_nl, fsm_output(8));
  mux_23_cse <= MUX_s_1_2_2((fsm_output(7)), (NOT (fsm_output(7))), fsm_output(2));
  and_dcpl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_4 <= (NOT (fsm_output(6))) AND (fsm_output(3));
  and_dcpl_5 <= and_dcpl_4 AND (NOT (fsm_output(1)));
  and_dcpl_8 <= (fsm_output(5)) AND (NOT (fsm_output(8)));
  or_38_cse <= (fsm_output(3)) OR (NOT (fsm_output(6)));
  or_37_cse <= (NOT (fsm_output(3))) OR (fsm_output(6));
  or_39_cse <= (NOT (fsm_output(1))) OR (NOT (fsm_output(3))) OR (fsm_output(6));
  or_tmp_39 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  or_308_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_62 <= and_244_cse OR (fsm_output(6)) OR (fsm_output(3));
  or_tmp_63 <= (fsm_output(6)) OR (fsm_output(3));
  mux_tmp_84 <= MUX_s_1_2_2((fsm_output(6)), or_tmp_63, fsm_output(4));
  or_305_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000"));
  mux_83_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_62, fsm_output(4));
  mux_85_nl <= MUX_s_1_2_2(mux_tmp_84, mux_83_nl, fsm_output(2));
  mux_86_nl <= MUX_s_1_2_2((fsm_output(6)), mux_85_nl, fsm_output(5));
  nor_110_nl <= NOT((fsm_output(7)) OR mux_86_nl);
  not_tmp_50 <= MUX_s_1_2_2(or_305_nl, nor_110_nl, fsm_output(8));
  and_dcpl_28 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_29 <= NOT((fsm_output(2)) OR (fsm_output(5)));
  and_dcpl_30 <= and_dcpl_29 AND and_dcpl_28;
  and_dcpl_31 <= NOT((fsm_output(0)) OR (fsm_output(4)));
  and_dcpl_33 <= nor_119_cse AND (NOT (fsm_output(1)));
  and_dcpl_34 <= and_dcpl_33 AND and_dcpl_31;
  and_dcpl_37 <= (fsm_output(2)) AND (fsm_output(5));
  and_dcpl_38 <= and_dcpl_37 AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_39 <= (NOT (fsm_output(0))) AND (fsm_output(4));
  and_dcpl_41 <= nor_119_cse AND (fsm_output(1)) AND and_dcpl_39;
  and_dcpl_43 <= and_dcpl_37 AND and_dcpl_28;
  and_dcpl_47 <= and_dcpl_5 AND and_dcpl_39 AND and_dcpl_43;
  and_dcpl_49 <= and_241_cse AND (fsm_output(1));
  and_dcpl_50 <= and_dcpl_49 AND and_dcpl_31;
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl_43;
  and_dcpl_53 <= (NOT (fsm_output(2))) AND (fsm_output(5));
  and_dcpl_54 <= and_dcpl_53 AND and_dcpl;
  and_dcpl_65 <= and_dcpl_50 AND and_dcpl_54;
  and_dcpl_69 <= (fsm_output(3)) AND (NOT (fsm_output(0))) AND and_dcpl_8;
  and_dcpl_80 <= and_dcpl_5 AND and_dcpl_31 AND (fsm_output(2)) AND (NOT (fsm_output(5)))
      AND and_dcpl_28;
  and_dcpl_82 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  or_tmp_96 <= and_244_cse OR (fsm_output(3));
  or_tmp_99 <= (fsm_output(4)) OR (or_134_cse AND (fsm_output(3)));
  mux_103_itm <= MUX_s_1_2_2((fsm_output(4)), or_tmp_99, fsm_output(2));
  nor_tmp_35 <= (fsm_output(1)) AND (fsm_output(3));
  or_tmp_106 <= NOT((fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1))
      AND (NOT (fsm_output(6))) AND (fsm_output(3)));
  or_127_nl <= (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_tmp_109 <= MUX_s_1_2_2((NOT (fsm_output(6))), or_127_nl, fsm_output(4));
  mux_tmp_110 <= MUX_s_1_2_2((NOT (fsm_output(6))), or_38_cse, fsm_output(4));
  and_tmp_7 <= (fsm_output(4)) AND or_12_cse;
  nor_tmp_36 <= (fsm_output(4)) AND (fsm_output(6));
  or_321_nl <= (NOT (fsm_output(7))) OR (fsm_output(2)) OR (NOT (fsm_output(3)));
  or_322_nl <= (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(3));
  mux_120_nl <= MUX_s_1_2_2(or_321_nl, or_322_nl, fsm_output(8));
  and_dcpl_99 <= NOT(mux_120_nl OR (fsm_output(6)) OR (fsm_output(1)) OR (fsm_output(0))
      OR (NOT not_tmp_7));
  and_213_nl <= (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(3));
  mux_tmp_122 <= MUX_s_1_2_2((NOT (fsm_output(3))), and_213_nl, fsm_output(4));
  and_tmp_10 <= (fsm_output(4)) AND ((fsm_output(1)) OR (fsm_output(3)));
  and_dcpl_103 <= and_dcpl_4 AND (fsm_output(1));
  and_dcpl_104 <= and_dcpl_103 AND and_dcpl_39;
  and_dcpl_105 <= and_dcpl_104 AND and_dcpl_54;
  or_tmp_124 <= NOT((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1)) AND (NOT
      (fsm_output(6))) AND (fsm_output(3)));
  or_tmp_125 <= (fsm_output(4)) OR (NOT (fsm_output(6)));
  and_dcpl_112 <= ((CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")))
      XOR (fsm_output(3))) AND (NOT (fsm_output(6))) AND not_tmp_7 AND and_dcpl_28;
  or_150_nl <= (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(3));
  mux_140_nl <= MUX_s_1_2_2((fsm_output(6)), or_150_nl, fsm_output(4));
  mux_141_nl <= MUX_s_1_2_2(mux_tmp_84, mux_140_nl, fsm_output(2));
  mux_142_nl <= MUX_s_1_2_2((fsm_output(6)), mux_141_nl, fsm_output(5));
  or_tmp_130 <= (fsm_output(7)) OR mux_142_nl;
  and_dcpl_113 <= (fsm_output(0)) AND (NOT (fsm_output(4)));
  and_dcpl_119 <= and_dcpl_103 AND (NOT((fsm_output(4)) XOR (fsm_output(5)))) AND
      (fsm_output(0)) AND (NOT (fsm_output(2))) AND and_dcpl_28;
  and_dcpl_120 <= (fsm_output(0)) AND (fsm_output(4));
  or_tmp_154 <= (fsm_output(4)) OR (fsm_output(6));
  mux_tmp_170 <= MUX_s_1_2_2(or_tmp_154, or_tmp_4, fsm_output(2));
  and_dcpl_129 <= and_dcpl_103 AND and_dcpl_120 AND and_dcpl_53 AND and_dcpl_28;
  xor_dcpl_2 <= (fsm_output(2)) XOR (fsm_output(7));
  and_dcpl_138 <= and_dcpl_5 AND xor_dcpl_2 AND and_dcpl_120 AND and_dcpl_8;
  and_dcpl_140 <= and_dcpl_113 AND (fsm_output(5));
  and_dcpl_142 <= and_dcpl_49 AND xor_dcpl_2;
  or_tmp_165 <= (fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_tmp_180 <= MUX_s_1_2_2((NOT (fsm_output(6))), or_38_cse, fsm_output(1));
  or_tmp_170 <= and_244_cse OR (NOT (fsm_output(6))) OR (fsm_output(3));
  and_dcpl_148 <= and_dcpl_29 AND (fsm_output(7));
  and_dcpl_152 <= (NOT (fsm_output(3))) AND (fsm_output(6)) AND (fsm_output(1)) AND
      and_dcpl_39;
  nor_67_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("010110")));
  nor_68_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 0)/=STD_LOGIC_VECTOR'("101001")));
  mux_205_nl <= MUX_s_1_2_2(nor_67_nl, nor_68_nl, fsm_output(7));
  and_dcpl_158 <= mux_205_nl AND (fsm_output(6)) AND (NOT (fsm_output(8)));
  and_dcpl_159 <= and_dcpl_5 AND and_dcpl_120;
  and_dcpl_160 <= and_dcpl_159 AND and_dcpl_43;
  mux_tmp_207 <= MUX_s_1_2_2((NOT (fsm_output(6))), or_38_cse, or_134_cse);
  mux_208_nl <= MUX_s_1_2_2(mux_tmp_207, or_39_cse, fsm_output(4));
  mux_33_nl <= MUX_s_1_2_2(or_38_cse, or_37_cse, fsm_output(4));
  mux_209_nl <= MUX_s_1_2_2(mux_208_nl, mux_33_nl, fsm_output(2));
  mux_tmp_210 <= MUX_s_1_2_2((NOT (fsm_output(6))), mux_209_nl, fsm_output(5));
  or_tmp_203 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_204 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_218_nl <= MUX_s_1_2_2(or_tmp_203, or_tmp_204, fsm_output(4));
  mux_217_nl <= MUX_s_1_2_2(or_tmp_203, (fsm_output(6)), fsm_output(4));
  mux_tmp_219 <= MUX_s_1_2_2(mux_218_nl, mux_217_nl, fsm_output(0));
  and_dcpl_163 <= and_dcpl_104 AND and_dcpl_43;
  or_dcpl_28 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_32 <= or_37_cse OR (fsm_output(1));
  or_dcpl_35 <= NOT((fsm_output(2)) AND (fsm_output(5)));
  or_dcpl_36 <= or_dcpl_35 OR or_dcpl_28;
  or_dcpl_37 <= (fsm_output(0)) OR (NOT (fsm_output(4)));
  or_tmp_225 <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(3));
  and_dcpl_166 <= and_241_cse AND (NOT (fsm_output(1)));
  or_tmp_227 <= NOT((fsm_output(0)) AND (fsm_output(1)) AND (NOT (fsm_output(6)))
      AND (fsm_output(3)));
  mux_241_nl <= MUX_s_1_2_2(mux_tmp_180, or_tmp_227, fsm_output(4));
  mux_242_nl <= MUX_s_1_2_2(or_tmp_125, mux_241_nl, fsm_output(2));
  mux_243_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), mux_242_nl, fsm_output(5));
  mux_244_nl <= MUX_s_1_2_2(mux_243_nl, mux_tmp_210, fsm_output(7));
  and_dcpl_169 <= NOT(mux_244_nl OR (fsm_output(8)));
  and_dcpl_170 <= and_dcpl_159 AND and_dcpl_54;
  and_dcpl_171 <= and_dcpl_166 AND and_dcpl_113;
  nor_61_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(4))) OR (fsm_output(0))
      OR (NOT (fsm_output(1))) OR (fsm_output(6)));
  nor_62_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (NOT (fsm_output(0))) OR
      (fsm_output(1)) OR (NOT (fsm_output(6))));
  mux_245_nl <= MUX_s_1_2_2(nor_61_nl, nor_62_nl, fsm_output(7));
  and_dcpl_175 <= mux_245_nl AND (fsm_output(3)) AND (fsm_output(5)) AND (NOT (fsm_output(8)));
  and_dcpl_180 <= (NOT (fsm_output(1))) AND (fsm_output(0)) AND (fsm_output(4)) AND
      and_dcpl_8;
  not_tmp_155 <= NOT((VEC_LOOP_j_sva_11_0(0)) AND (fsm_output(2)));
  or_dcpl_52 <= (fsm_output(2)) OR (NOT (fsm_output(5)));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_41 AND and_dcpl_38;
  operator_64_false_acc_mut_mx0c0 <= and_dcpl_33 AND and_dcpl_113 AND and_dcpl_30;
  nand_14_nl <= NOT((NOT((NOT (fsm_output(3))) OR (fsm_output(8)) OR (fsm_output(1))
      OR (NOT (fsm_output(6))))) AND mux_23_cse);
  or_28_nl <= (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(6)) OR (fsm_output(2))
      OR (fsm_output(7));
  mux_149_nl <= MUX_s_1_2_2(mux_tmp_22, or_28_nl, fsm_output(3));
  mux_150_nl <= MUX_s_1_2_2(nand_14_nl, mux_149_nl, fsm_output(4));
  nand_15_nl <= NOT((fsm_output(5)) AND (NOT mux_150_nl));
  or_157_nl <= (fsm_output(3)) OR mux_tmp_22;
  nand_2_nl <= NOT((NOT((fsm_output(8)) OR (fsm_output(1)) OR (NOT (fsm_output(6)))))
      AND mux_23_cse);
  mux_146_nl <= MUX_s_1_2_2(nand_2_nl, mux_tmp_22, fsm_output(3));
  mux_147_nl <= MUX_s_1_2_2(or_157_nl, mux_146_nl, fsm_output(4));
  or_153_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(8)) OR (NOT (fsm_output(1)))
      OR (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(7));
  mux_148_nl <= MUX_s_1_2_2(mux_147_nl, or_153_nl, fsm_output(5));
  mux_151_itm <= MUX_s_1_2_2(nand_15_nl, mux_148_nl, fsm_output(0));
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_33 AND and_dcpl_120 AND and_dcpl_38;
  nor_83_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR mux_tmp_170);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_83_nl, or_tmp_130, fsm_output(8));
  or_277_nl <= (fsm_output(7)) OR not_tmp_155;
  mux_252_nl <= MUX_s_1_2_2(not_tmp_155, (fsm_output(2)), fsm_output(7));
  mux_253_nl <= MUX_s_1_2_2(or_277_nl, mux_252_nl, COMP_LOOP_acc_1_cse_sva(0));
  tmp_2_lpi_4_dfm_mx0c1 <= (NOT mux_253_nl) AND and_dcpl_4 AND and_dcpl_180;
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  and_62_nl <= and_dcpl_34 AND and_dcpl_54;
  and_235_nl <= (fsm_output(2)) AND (fsm_output(7));
  nor_118_nl <= NOT((fsm_output(2)) OR (fsm_output(7)));
  mux_89_nl <= MUX_s_1_2_2(and_235_nl, nor_118_nl, fsm_output(8));
  and_67_nl <= mux_89_nl AND nor_119_cse AND (fsm_output(1)) AND (fsm_output(0))
      AND (fsm_output(4)) AND (fsm_output(5));
  nor_107_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR (fsm_output(2)));
  nor_108_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (NOT (fsm_output(2))));
  mux_90_nl <= MUX_s_1_2_2(nor_107_nl, nor_108_nl, fsm_output(8));
  and_71_nl <= mux_90_nl AND (fsm_output(3)) AND (NOT (fsm_output(6))) AND (NOT (fsm_output(1)))
      AND and_dcpl_39;
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_11_5_2(COMP_LOOP_acc_psp_sva_1, (z_out(12
      DOWNTO 2)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_47
      & COMP_LOOP_or_3_cse & and_62_nl & and_67_nl & and_71_nl));
  vec_rsc_0_0_i_da_d_pff <= vec_rsc_0_0_i_da_d_1;
  nor_104_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  or_95_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_91_nl <= MUX_s_1_2_2(or_95_nl, or_tmp_39, fsm_output(2));
  nor_105_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) OR mux_91_nl);
  mux_92_nl <= MUX_s_1_2_2(nor_104_nl, nor_105_nl, fsm_output(4));
  nand_44_nl <= NOT((fsm_output(5)) AND mux_92_nl);
  or_314_nl <= (fsm_output(5)) OR (NOT (fsm_output(4))) OR (fsm_output(0)) OR (fsm_output(1))
      OR (NOT (fsm_output(2))) OR (COMP_LOOP_acc_1_cse_sva(0)) OR CONV_SL_1_1(fsm_output(8
      DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_93_nl <= MUX_s_1_2_2(nand_44_nl, or_314_nl, fsm_output(3));
  vec_rsc_0_0_i_wea_d_pff <= NOT(mux_93_nl OR (fsm_output(6)));
  or_102_nl <= (NOT (fsm_output(7))) OR (NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR (COMP_LOOP_acc_1_cse_sva(0));
  or_101_nl <= (fsm_output(7)) OR (VEC_LOOP_j_sva_11_0(0));
  mux_95_nl <= MUX_s_1_2_2(or_102_nl, or_101_nl, fsm_output(2));
  nor_101_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR mux_95_nl);
  nor_102_nl <= NOT((NOT (fsm_output(7))) OR (z_out(1)));
  nor_103_nl <= NOT((fsm_output(7)) OR (z_out(1)));
  mux_94_nl <= MUX_s_1_2_2(nor_102_nl, nor_103_nl, fsm_output(2));
  and_224_nl <= nor_28_cse AND mux_94_nl;
  mux_96_nl <= MUX_s_1_2_2(nor_101_nl, and_224_nl, fsm_output(1));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_96_nl AND and_dcpl_69;
  nor_97_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT (VEC_LOOP_j_sva_11_0(0))) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  nor_98_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  nor_99_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  mux_97_nl <= MUX_s_1_2_2(nor_98_nl, nor_99_nl, fsm_output(2));
  and_223_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      AND mux_97_nl;
  mux_98_nl <= MUX_s_1_2_2(nor_97_nl, and_223_nl, fsm_output(4));
  nand_43_nl <= NOT((fsm_output(5)) AND mux_98_nl);
  or_313_nl <= (fsm_output(5)) OR (NOT (fsm_output(4))) OR (fsm_output(0)) OR (fsm_output(1))
      OR (NOT (fsm_output(2))) OR (NOT (COMP_LOOP_acc_1_cse_sva(0))) OR CONV_SL_1_1(fsm_output(8
      DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_99_nl <= MUX_s_1_2_2(nand_43_nl, or_313_nl, fsm_output(3));
  vec_rsc_0_1_i_wea_d_pff <= NOT(mux_99_nl OR (fsm_output(6)));
  nand_31_nl <= NOT((fsm_output(7)) AND COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      AND (COMP_LOOP_acc_1_cse_sva(0)));
  or_111_nl <= (fsm_output(7)) OR (NOT (VEC_LOOP_j_sva_11_0(0)));
  mux_101_nl <= MUX_s_1_2_2(nand_31_nl, or_111_nl, fsm_output(2));
  nor_95_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR mux_101_nl);
  and_221_nl <= (fsm_output(7)) AND (z_out(1));
  nor_96_nl <= NOT((fsm_output(7)) OR (NOT (z_out(1))));
  mux_100_nl <= MUX_s_1_2_2(and_221_nl, nor_96_nl, fsm_output(2));
  and_220_nl <= nor_28_cse AND mux_100_nl;
  mux_102_nl <= MUX_s_1_2_2(nor_95_nl, and_220_nl, fsm_output(1));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_102_nl AND and_dcpl_69;
  and_dcpl_187 <= NOT((fsm_output(4)) OR (fsm_output(6)));
  or_334_nl <= (NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT (fsm_output(8)));
  or_335_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(8));
  mux_262_nl <= MUX_s_1_2_2(or_334_nl, or_335_nl, fsm_output(3));
  nor_152_cse <= NOT(mux_262_nl OR (fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(1))
      OR (NOT and_dcpl_187));
  and_dcpl_192 <= (fsm_output(4)) AND (NOT (fsm_output(6)));
  and_dcpl_198 <= and_dcpl_28 AND (fsm_output(5)) AND (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_199 <= and_dcpl_198 AND (NOT (fsm_output(1))) AND (fsm_output(3)) AND
      and_dcpl_192;
  and_dcpl_201 <= nor_tmp_35 AND and_dcpl_192;
  and_dcpl_205 <= (NOT (fsm_output(8))) AND (fsm_output(7)) AND (fsm_output(5)) AND
      (NOT (fsm_output(2))) AND (NOT (fsm_output(0)));
  and_dcpl_206 <= and_dcpl_205 AND and_dcpl_201;
  and_dcpl_207 <= NOT((fsm_output(1)) OR (fsm_output(3)));
  and_dcpl_212 <= and_dcpl_28 AND (NOT (fsm_output(5))) AND (NOT (fsm_output(2)))
      AND (fsm_output(0)) AND and_dcpl_207 AND and_dcpl_187;
  and_dcpl_214 <= nor_tmp_35 AND (NOT (fsm_output(4))) AND (fsm_output(6));
  and_dcpl_215 <= and_dcpl_198 AND and_dcpl_214;
  and_dcpl_216 <= and_dcpl_205 AND and_dcpl_214;
  and_dcpl_222 <= (fsm_output(8)) AND (NOT (fsm_output(7))) AND (fsm_output(5)) AND
      (fsm_output(2)) AND (fsm_output(0)) AND and_dcpl_207 AND and_dcpl_192;
  and_dcpl_223 <= and_dcpl_198 AND and_dcpl_201;
  and_dcpl_240 <= (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_243 <= and_dcpl_28 AND (fsm_output(5)) AND and_dcpl_240;
  and_dcpl_244 <= and_dcpl_243 AND and_dcpl_214;
  and_dcpl_246 <= (NOT (fsm_output(1))) AND (fsm_output(3));
  and_dcpl_248 <= and_dcpl_243 AND and_dcpl_246 AND (fsm_output(4)) AND (NOT (fsm_output(6)));
  and_dcpl_255 <= and_dcpl_28 AND (NOT (fsm_output(5)));
  and_dcpl_257 <= and_dcpl_255 AND and_dcpl_240 AND and_dcpl_246 AND and_dcpl_187;
  and_dcpl_262 <= (NOT (fsm_output(8))) AND (fsm_output(7)) AND (fsm_output(5)) AND
      (NOT (fsm_output(2))) AND (NOT (fsm_output(0))) AND and_dcpl_214;
  and_dcpl_266 <= and_dcpl_255 AND (NOT (fsm_output(2))) AND (fsm_output(0)) AND
      nor_tmp_35 AND and_dcpl_187;
  COMP_LOOP_or_18_itm <= and_dcpl_199 OR and_dcpl_206 OR and_dcpl_223;
  COMP_LOOP_or_22_itm <= and_dcpl_215 OR and_dcpl_216;
  COMP_LOOP_nor_7_itm <= NOT(and_dcpl_244 OR and_dcpl_248 OR and_dcpl_257 OR and_dcpl_262
      OR and_dcpl_266);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_50 = '0' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_34 AND and_dcpl_30) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
          THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_50 = '0' ) THEN
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= '0';
        modExp_exp_1_0_1_sva <= '0';
        modExp_while_and_itm <= '0';
        modExp_while_and_1_itm <= '0';
        modExp_exp_1_7_1_sva <= '0';
        modExp_exp_1_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_41 AND and_dcpl_37 AND CONV_SL_1_1(fsm_output(8
            DOWNTO 7)=STD_LOGIC_VECTOR'("10")) AND (NOT STAGE_LOOP_acc_itm_2_1);
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_16_nl AND (NOT and_dcpl_160)) OR
            mux_227_nl OR (fsm_output(8));
        modExp_while_and_itm <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
        modExp_while_and_1_itm <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_23_nl AND (NOT(and_dcpl_171 AND and_dcpl_54));
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_40_nl AND (NOT(and_dcpl_171 AND and_dcpl_43));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_13_2(z_out_3, modExp_while_if_mul_mut,
          modExp_while_mul_itm, COMP_LOOP_1_modExp_1_while_if_mul_mut_1, COMP_LOOP_1_modExp_1_while_if_mul_mut,
          COMP_LOOP_1_modExp_1_while_mul_itm, COMP_LOOP_1_mul_mut, (z_out_2(63 DOWNTO
          0)), COMP_LOOP_1_acc_5_mut, COMP_LOOP_1_acc_8_itm, COMP_LOOP_2_modExp_1_while_mul_mut,
          COMP_LOOP_2_modExp_1_while_if_mul_itm, COMP_LOOP_2_mul_mut, STD_LOGIC_VECTOR'(
          modulo_result_or_nl & and_90_nl & and_93_nl & and_96_nl & and_97_nl & and_101_nl
          & nor_131_nl & and_dcpl_99 & nor_136_nl & nor_124_nl & and_117_nl & and_120_nl
          & mux_139_nl));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out, operator_64_false_acc_mut,
          and_dcpl_112);
      reg_operator_66_true_div_cmp_b_reg <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_112);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_85_nl, or_tmp_130, fsm_output(8))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_mut <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (operator_64_false_acc_mut_mx0c0 OR and_dcpl_119 OR (NOT mux_151_itm))
          = '1' ) THEN
        operator_64_false_acc_mut <= MUX1HOT_v_65_3_2(z_out, (STD_LOGIC_VECTOR'(
            "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0' & modulo_result_rem_cmp_z),
            STD_LOGIC_VECTOR'( operator_64_false_acc_mut_mx0c0 & and_dcpl_119 & (NOT
            mux_151_itm)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (and_dcpl_119 OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
        VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"), (z_out(11
            DOWNTO 0)), VEC_LOOP_j_sva_11_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_1_sva_7_0 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (MUX_s_1_2_2(nor_nl, nor_160_nl, fsm_output(7))) = '1' ) THEN
        COMP_LOOP_k_9_1_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_2(7
            DOWNTO 0)), or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_exp_1_0_1_sva OR modExp_while_and_itm OR modExp_while_and_1_itm
          OR modExp_result_sva_mx0c0 OR (NOT mux_173_nl)) AND (modExp_result_sva_mx0c0
          OR modExp_result_and_rgt OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            (operator_64_false_acc_mut(63 DOWNTO 0)), modulo_qr_sva_1_mx0w1, STD_LOGIC_VECTOR'(
            modExp_result_sva_mx0c0 & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_188_nl, or_339_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_1_acc_5_mut <= MUX1HOT_v_64_7_2(r_sva, (operator_64_false_acc_mut(63
            DOWNTO 0)), modulo_qr_sva_1_mx0w1, modExp_result_sva, vec_rsc_0_0_i_qa_d,
            vec_rsc_0_1_i_qa_d, (z_out_2(63 DOWNTO 0)), STD_LOGIC_VECTOR'( and_143_nl
            & COMP_LOOP_or_7_nl & COMP_LOOP_or_8_nl & and_dcpl_138 & and_155_nl &
            and_158_nl & and_dcpl_99));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_acc_8_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((modExp_exp_1_0_1_sva OR and_dcpl_119 OR and_dcpl_138 OR and_dcpl_99)
          AND mux_204_nl) = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_5_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            (operator_64_false_acc_mut(63 DOWNTO 0)), modulo_qr_sva_1_mx0w1, (z_out(63
            DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_119 & and_dcpl_138 & COMP_LOOP_and_nl
            & COMP_LOOP_and_1_nl & and_dcpl_99));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_228_nl AND and_dcpl_82)) = '1' ) THEN
        modExp_while_if_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_80 OR and_dcpl_163 OR and_dcpl_65) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_2(63))),
            (NOT (z_out(8))), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'( and_dcpl_80
            & and_dcpl_163 & and_dcpl_65));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_32 OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (NOT (fsm_output(2)))
          OR (fsm_output(5)) OR or_dcpl_28)) = '1' ) THEN
        modExp_while_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_32 OR or_dcpl_37 OR or_dcpl_36)) = '1' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_47 OR and_dcpl_51 OR and_dcpl_105) = '1' ) THEN
        COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= MUX1HOT_s_1_3_2((z_out(9)),
            (z_out_2(9)), (z_out(8)), STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_51
            & and_dcpl_105));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2(nor_157_nl, or_336_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= z_out_2(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_1_sva_1 <= '0';
      ELSIF ( (mux_240_nl OR (fsm_output(8))) = '1' ) THEN
        modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_sva_7_0(0)), modExp_exp_1_1_1_sva,
            and_182_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
      ELSIF ( and_dcpl_169 = '0' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(5)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(6)), STD_LOGIC_VECTOR'( and_dcpl_160 & and_dcpl_175
            & and_dcpl_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_5_1_sva <= '0';
      ELSIF ( and_dcpl_169 = '0' ) THEN
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(4)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(5)), STD_LOGIC_VECTOR'( and_dcpl_160 & and_dcpl_175
            & and_dcpl_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_4_1_sva <= '0';
      ELSIF ( and_dcpl_169 = '0' ) THEN
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(3)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(4)), STD_LOGIC_VECTOR'( and_dcpl_160 & and_dcpl_175
            & and_dcpl_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_3_1_sva <= '0';
      ELSIF ( and_dcpl_169 = '0' ) THEN
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(2)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(3)), STD_LOGIC_VECTOR'( and_dcpl_160 & and_dcpl_175
            & and_dcpl_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( and_dcpl_169 = '0' ) THEN
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(1)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(2)), STD_LOGIC_VECTOR'( and_dcpl_160 & and_dcpl_175
            & and_dcpl_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT mux_251_nl) AND and_dcpl_4 AND and_dcpl_180) OR tmp_2_lpi_4_dfm_mx0c1)
          = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, tmp_2_lpi_4_dfm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_255_nl) AND and_dcpl_28)) = '1' ) THEN
        COMP_LOOP_1_modExp_1_while_if_mul_mut <= COMP_LOOP_1_modExp_1_while_if_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_124 OR or_dcpl_36)) = '1' ) THEN
        COMP_LOOP_1_modExp_1_while_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_3_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_225 OR or_dcpl_37 OR or_dcpl_52 OR or_dcpl_28)) = '1' ) THEN
        COMP_LOOP_1_mul_mut <= COMP_LOOP_1_modExp_1_while_if_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_39_cse OR or_dcpl_37 OR or_dcpl_52 OR or_tmp_39)) = '1' ) THEN
        COMP_LOOP_2_modExp_1_while_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_258_nl AND and_dcpl)) = '1' ) THEN
        COMP_LOOP_2_modExp_1_while_if_mul_itm <= COMP_LOOP_1_modExp_1_while_if_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT and_241_cse) OR (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(4))
          OR or_dcpl_35 OR or_tmp_39)) = '1' ) THEN
        COMP_LOOP_2_mul_mut <= COMP_LOOP_1_modExp_1_while_if_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  modulo_result_or_nl <= and_dcpl_80 OR and_dcpl_105;
  nor_147_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR or_tmp_96);
  mux_104_nl <= MUX_s_1_2_2(mux_103_itm, nor_147_nl, fsm_output(5));
  and_90_nl <= mux_104_nl AND and_dcpl_82;
  mux_105_nl <= MUX_s_1_2_2((NOT or_tmp_96), nor_tmp_35, fsm_output(4));
  mux_106_nl <= MUX_s_1_2_2(mux_105_nl, and_246_cse, fsm_output(2));
  and_93_nl <= (NOT mux_106_nl) AND CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_28;
  nor_92_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)));
  and_247_nl <= (fsm_output(4)) AND (fsm_output(1)) AND (NOT (fsm_output(6))) AND
      (fsm_output(3));
  mux_107_nl <= MUX_s_1_2_2(nor_92_nl, and_247_nl, fsm_output(2));
  nor_94_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(1)) OR
      (NOT and_241_cse));
  mux_108_nl <= MUX_s_1_2_2(mux_107_nl, nor_94_nl, fsm_output(7));
  and_96_nl <= mux_108_nl AND (NOT (fsm_output(0))) AND (fsm_output(5)) AND (NOT
      (fsm_output(8)));
  mux_111_nl <= MUX_s_1_2_2(mux_tmp_110, mux_tmp_109, fsm_output(2));
  mux_112_nl <= MUX_s_1_2_2(mux_111_nl, or_tmp_106, fsm_output(5));
  and_97_nl <= (NOT mux_112_nl) AND and_dcpl_28;
  mux_114_nl <= MUX_s_1_2_2(and_246_cse, and_tmp_7, fsm_output(2));
  mux_113_nl <= MUX_s_1_2_2((fsm_output(4)), or_308_cse, fsm_output(2));
  mux_115_nl <= MUX_s_1_2_2(mux_114_nl, (NOT mux_113_nl), fsm_output(5));
  and_101_nl <= mux_115_nl AND CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("001"));
  mux_117_nl <= MUX_s_1_2_2(and_241_cse, (fsm_output(6)), or_134_cse);
  and_102_nl <= (fsm_output(4)) AND mux_117_nl;
  mux_118_nl <= MUX_s_1_2_2(and_102_nl, nor_tmp_36, fsm_output(2));
  nand_45_nl <= NOT((fsm_output(5)) AND mux_118_nl);
  or_131_nl <= (fsm_output(4)) OR or_tmp_62;
  mux_116_nl <= MUX_s_1_2_2(or_tmp_4, or_131_nl, fsm_output(2));
  or_315_nl <= (fsm_output(5)) OR mux_116_nl;
  mux_119_nl <= MUX_s_1_2_2(nand_45_nl, or_315_nl, fsm_output(7));
  nor_131_nl <= NOT(mux_119_nl OR (fsm_output(8)));
  mux_124_nl <= MUX_s_1_2_2(or_tmp_99, (NOT mux_tmp_122), fsm_output(2));
  nand_48_nl <= NOT((fsm_output(7)) AND mux_124_nl);
  mux_121_nl <= MUX_s_1_2_2((NOT or_12_cse), (fsm_output(3)), fsm_output(4));
  mux_123_nl <= MUX_s_1_2_2(mux_tmp_122, mux_121_nl, fsm_output(2));
  or_320_nl <= (fsm_output(7)) OR mux_123_nl;
  mux_125_nl <= MUX_s_1_2_2(nand_48_nl, or_320_nl, fsm_output(8));
  nor_136_nl <= NOT(mux_125_nl OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  nand_29_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111")));
  mux_129_nl <= MUX_s_1_2_2(and_246_cse, and_tmp_10, fsm_output(2));
  mux_130_nl <= MUX_s_1_2_2(nand_29_nl, mux_129_nl, fsm_output(5));
  nand_42_nl <= NOT((fsm_output(7)) AND (NOT mux_130_nl));
  and_211_nl <= (fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(3));
  mux_127_nl <= MUX_s_1_2_2(and_211_nl, and_246_cse, fsm_output(2));
  mux_126_nl <= MUX_s_1_2_2(and_tmp_10, (fsm_output(4)), fsm_output(2));
  mux_128_nl <= MUX_s_1_2_2((NOT mux_127_nl), mux_126_nl, fsm_output(5));
  or_312_nl <= (fsm_output(7)) OR mux_128_nl;
  mux_131_nl <= MUX_s_1_2_2(nand_42_nl, or_312_nl, fsm_output(8));
  nor_124_nl <= NOT(mux_131_nl OR (fsm_output(6)));
  mux_133_nl <= MUX_s_1_2_2(mux_tmp_109, or_tmp_125, fsm_output(2));
  or_142_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  mux_132_nl <= MUX_s_1_2_2(or_tmp_124, or_142_nl, fsm_output(2));
  mux_134_nl <= MUX_s_1_2_2(mux_133_nl, mux_132_nl, fsm_output(5));
  and_117_nl <= (NOT mux_134_nl) AND and_dcpl;
  mux_135_nl <= MUX_s_1_2_2(and_tmp_7, (fsm_output(4)), fsm_output(2));
  mux_136_nl <= MUX_s_1_2_2(mux_135_nl, (NOT or_308_cse), fsm_output(5));
  and_120_nl <= mux_136_nl AND CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011"));
  and_209_nl <= or_134_cse AND (fsm_output(6)) AND (fsm_output(3));
  mux_137_nl <= MUX_s_1_2_2(and_209_nl, (fsm_output(6)), fsm_output(4));
  mux_138_nl <= MUX_s_1_2_2(nor_tmp_36, mux_137_nl, fsm_output(2));
  and_208_nl <= (fsm_output(7)) AND (fsm_output(5)) AND mux_138_nl;
  nor_86_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(4))
      OR or_tmp_62);
  mux_139_nl <= MUX_s_1_2_2(and_208_nl, nor_86_nl, fsm_output(8));
  COMP_LOOP_and_5_nl <= (NOT and_dcpl_129) AND and_dcpl_119;
  or_225_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3));
  mux_213_nl <= MUX_s_1_2_2(or_tmp_63, or_225_nl, fsm_output(4));
  mux_214_nl <= MUX_s_1_2_2(or_tmp_154, mux_213_nl, fsm_output(2));
  or_224_nl <= (fsm_output(4)) OR and_dcpl_4;
  mux_211_nl <= MUX_s_1_2_2(mux_tmp_180, or_39_cse, fsm_output(4));
  mux_212_nl <= MUX_s_1_2_2(or_224_nl, mux_211_nl, fsm_output(2));
  mux_215_nl <= MUX_s_1_2_2((NOT mux_214_nl), mux_212_nl, fsm_output(5));
  mux_216_nl <= MUX_s_1_2_2(mux_215_nl, mux_tmp_210, fsm_output(7));
  COMP_LOOP_mux1h_16_nl <= MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z_oreg(0)),
      (COMP_LOOP_1_acc_8_itm(0)), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, STD_LOGIC_VECTOR'(
      COMP_LOOP_and_5_nl & and_dcpl_129 & and_dcpl_158 & (NOT mux_216_nl)));
  or_235_nl <= (NOT((NOT (fsm_output(4))) OR (fsm_output(7)))) OR (fsm_output(6));
  or_233_nl <= (NOT((NOT(and_244_cse OR (fsm_output(4)))) OR (fsm_output(7)))) OR
      (fsm_output(6));
  mux_225_nl <= MUX_s_1_2_2(or_233_nl, or_tmp_204, fsm_output(2));
  mux_226_nl <= MUX_s_1_2_2(or_235_nl, mux_225_nl, fsm_output(3));
  or_230_nl <= (fsm_output(4)) OR (NOT or_tmp_204);
  mux_223_nl <= MUX_s_1_2_2(or_230_nl, or_tmp_125, fsm_output(2));
  mux_221_nl <= MUX_s_1_2_2(or_tmp_125, mux_tmp_219, fsm_output(1));
  or_226_nl <= (NOT (fsm_output(4))) OR (fsm_output(6));
  mux_220_nl <= MUX_s_1_2_2(mux_tmp_219, or_226_nl, fsm_output(1));
  mux_222_nl <= MUX_s_1_2_2(mux_221_nl, mux_220_nl, fsm_output(2));
  mux_224_nl <= MUX_s_1_2_2(mux_223_nl, mux_222_nl, fsm_output(3));
  mux_227_nl <= MUX_s_1_2_2((NOT mux_226_nl), mux_224_nl, fsm_output(5));
  COMP_LOOP_mux1h_23_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(6)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_sva_7_0(7)), STD_LOGIC_VECTOR'( and_dcpl_160
      & and_dcpl_163 & and_dcpl_169 & and_dcpl_170));
  mux_246_nl <= MUX_s_1_2_2(mux_tmp_207, or_tmp_227, fsm_output(4));
  mux_247_nl <= MUX_s_1_2_2(or_tmp_125, mux_246_nl, fsm_output(2));
  mux_248_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), mux_247_nl, fsm_output(5));
  mux_249_nl <= MUX_s_1_2_2(mux_248_nl, mux_tmp_210, fsm_output(7));
  nor_127_nl <= NOT(mux_249_nl OR (fsm_output(8)));
  COMP_LOOP_mux1h_40_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(7)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_sva_7_0(1)), STD_LOGIC_VECTOR'( and_dcpl_160
      & and_dcpl_175 & nor_127_nl & and_dcpl_170));
  nor_85_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  or_170_nl <= (fsm_output(2)) OR (fsm_output(4)) OR (NOT nor_tmp_35);
  or_168_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1101"));
  mux_163_nl <= MUX_s_1_2_2(or_170_nl, or_168_nl, fsm_output(5));
  or_167_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("11010"));
  mux_164_nl <= MUX_s_1_2_2(mux_163_nl, or_167_nl, fsm_output(8));
  or_nl <= mux_164_nl OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR (fsm_output(7));
  or_345_nl <= (fsm_output(5)) OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT
      (fsm_output(3))) OR (fsm_output(8));
  nor_158_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(3)) OR (NOT (fsm_output(8))));
  nor_159_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_nl <= MUX_s_1_2_2(nor_158_nl, nor_159_nl, fsm_output(1));
  nand_57_nl <= NOT((fsm_output(5)) AND mux_nl);
  mux_263_nl <= MUX_s_1_2_2(or_345_nl, nand_57_nl, fsm_output(4));
  nor_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(6)) OR mux_263_nl);
  nor_160_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(6))) OR (fsm_output(4)) OR
      (NOT (fsm_output(5))) OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8)));
  or_180_nl <= (NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(1))
      OR (fsm_output(6)) OR (fsm_output(3));
  mux_172_nl <= MUX_s_1_2_2(mux_tmp_170, or_180_nl, fsm_output(5));
  nor_82_nl <= NOT((fsm_output(7)) OR mux_172_nl);
  mux_173_nl <= MUX_s_1_2_2(nor_82_nl, or_tmp_130, fsm_output(8));
  and_143_nl <= and_dcpl_103 AND and_dcpl_113 AND and_dcpl_30;
  COMP_LOOP_or_7_nl <= ((NOT (operator_64_false_acc_mut(63))) AND and_147_m1c) OR
      (and_dcpl_152 AND and_dcpl_148 AND (NOT (fsm_output(8))) AND (NOT (operator_64_false_acc_mut(63))));
  COMP_LOOP_or_8_nl <= ((operator_64_false_acc_mut(63)) AND and_147_m1c) OR (and_dcpl_152
      AND and_dcpl_148 AND (NOT (fsm_output(8))) AND (operator_64_false_acc_mut(63)));
  and_155_nl <= and_dcpl_142 AND and_dcpl_140 AND (NOT (fsm_output(8))) AND (NOT
      (COMP_LOOP_acc_10_cse_12_1_1_sva(0)));
  and_158_nl <= and_dcpl_142 AND and_dcpl_140 AND (NOT (fsm_output(8))) AND (COMP_LOOP_acc_10_cse_12_1_1_sva(0));
  or_337_nl <= (NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(1))
      OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  or_338_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(4))) OR (fsm_output(0))
      OR (NOT (fsm_output(1))) OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  mux_187_nl <= MUX_s_1_2_2(or_337_nl, or_338_nl, fsm_output(5));
  nor_77_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(6)) OR (NOT (fsm_output(3))));
  mux_184_nl <= MUX_s_1_2_2(nor_77_nl, or_tmp_170, fsm_output(4));
  mux_183_nl <= MUX_s_1_2_2(and_dcpl_4, or_39_cse, fsm_output(4));
  mux_185_nl <= MUX_s_1_2_2(mux_184_nl, mux_183_nl, fsm_output(2));
  or_191_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(6)) OR (NOT
      (fsm_output(3)));
  mux_181_nl <= MUX_s_1_2_2(mux_tmp_180, or_191_nl, fsm_output(4));
  mux_182_nl <= MUX_s_1_2_2(mux_181_nl, or_tmp_165, fsm_output(2));
  mux_186_nl <= MUX_s_1_2_2((NOT mux_185_nl), mux_182_nl, fsm_output(5));
  mux_188_nl <= MUX_s_1_2_2(mux_187_nl, mux_186_nl, fsm_output(7));
  mux_177_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_63, fsm_output(1));
  mux_178_nl <= MUX_s_1_2_2(or_37_cse, mux_177_nl, fsm_output(4));
  mux_175_nl <= MUX_s_1_2_2(or_37_cse, (fsm_output(6)), or_134_cse);
  mux_176_nl <= MUX_s_1_2_2(mux_175_nl, or_tmp_63, fsm_output(4));
  mux_179_nl <= MUX_s_1_2_2(mux_178_nl, mux_176_nl, fsm_output(2));
  or_339_nl <= (fsm_output(7)) OR (fsm_output(5)) OR mux_179_nl;
  COMP_LOOP_and_nl <= (NOT modExp_1_while_and_7) AND and_dcpl_158;
  COMP_LOOP_and_1_nl <= modExp_1_while_and_7 AND and_dcpl_158;
  nor_69_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_170_nl <= (fsm_output(7)) AND (fsm_output(2)) AND or_134_cse AND (fsm_output(5));
  or_217_nl <= (NOT((fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(0)) OR
      (NOT (fsm_output(1))))) OR (fsm_output(5));
  mux_201_nl <= MUX_s_1_2_2(and_170_nl, or_217_nl, fsm_output(6));
  mux_202_nl <= MUX_s_1_2_2(nor_69_nl, mux_201_nl, fsm_output(4));
  nor_71_nl <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(5)));
  mux_198_nl <= MUX_s_1_2_2(and_dcpl_29, nor_71_nl, fsm_output(7));
  nor_72_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(1)) OR (NOT (fsm_output(5))));
  mux_197_nl <= MUX_s_1_2_2(nor_72_nl, (fsm_output(5)), fsm_output(2));
  and_169_nl <= (fsm_output(7)) AND mux_197_nl;
  mux_199_nl <= MUX_s_1_2_2(mux_198_nl, and_169_nl, fsm_output(6));
  and_204_nl <= (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(5));
  nor_73_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(5))));
  mux_194_nl <= MUX_s_1_2_2(and_204_nl, nor_73_nl, fsm_output(2));
  nor_74_nl <= NOT((fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(5))));
  mux_195_nl <= MUX_s_1_2_2(mux_194_nl, nor_74_nl, fsm_output(7));
  mux_196_nl <= MUX_s_1_2_2(mux_195_nl, (fsm_output(5)), fsm_output(6));
  mux_200_nl <= MUX_s_1_2_2(mux_199_nl, mux_196_nl, fsm_output(4));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, mux_200_nl, fsm_output(3));
  or_208_nl <= (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(5));
  mux_191_nl <= MUX_s_1_2_2((fsm_output(5)), or_208_nl, fsm_output(2));
  or_209_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      mux_191_nl);
  or_206_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR ((CONV_SL_1_1(fsm_output(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))) AND (fsm_output(5)));
  mux_192_nl <= MUX_s_1_2_2(or_209_nl, or_206_nl, fsm_output(4));
  or_74_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_202_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  mux_190_nl <= MUX_s_1_2_2(or_74_nl, or_202_nl, fsm_output(4));
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_190_nl, fsm_output(3));
  mux_204_nl <= MUX_s_1_2_2(mux_203_nl, mux_193_nl, fsm_output(8));
  nor_146_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000")));
  mux_228_nl <= MUX_s_1_2_2(mux_103_itm, nor_146_nl, fsm_output(5));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_2(8 DOWNTO 0))
      & '0') + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'(
      "0000000001"), 10));
  mux_234_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_63, or_134_cse);
  and_201_nl <= (fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(4));
  mux_235_nl <= MUX_s_1_2_2((fsm_output(6)), mux_234_nl, and_201_nl);
  nor_157_nl <= NOT((fsm_output(7)) OR mux_235_nl);
  and_202_nl <= (fsm_output(2)) AND (fsm_output(4));
  mux_233_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_63, and_202_nl);
  or_336_nl <= (fsm_output(7)) OR (fsm_output(5)) OR mux_233_nl;
  and_182_nl <= and_dcpl_166 AND xor_dcpl_2 AND and_dcpl_113 AND and_dcpl_8;
  mux_237_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_tmp_225, fsm_output(4));
  mux_238_nl <= MUX_s_1_2_2(mux_tmp_110, mux_237_nl, fsm_output(2));
  nand_52_nl <= NOT((fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(1)) AND (NOT
      (fsm_output(6))) AND (fsm_output(3)));
  mux_239_nl <= MUX_s_1_2_2(mux_238_nl, nand_52_nl, fsm_output(5));
  mux_240_nl <= MUX_s_1_2_2(mux_239_nl, mux_tmp_210, fsm_output(7));
  or_276_nl <= (VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(2)));
  mux_250_nl <= MUX_s_1_2_2(or_276_nl, (fsm_output(2)), fsm_output(7));
  or_275_nl <= (fsm_output(7)) OR (VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(2)));
  mux_251_nl <= MUX_s_1_2_2(mux_250_nl, or_275_nl, COMP_LOOP_acc_1_cse_sva(0));
  mux_254_nl <= MUX_s_1_2_2(mux_tmp_110, or_tmp_125, fsm_output(2));
  mux_255_nl <= MUX_s_1_2_2(mux_254_nl, or_tmp_106, fsm_output(5));
  mux_256_nl <= MUX_s_1_2_2(or_tmp_170, or_37_cse, fsm_output(4));
  mux_257_nl <= MUX_s_1_2_2(or_tmp_165, mux_256_nl, fsm_output(2));
  mux_258_nl <= MUX_s_1_2_2((fsm_output(6)), (NOT mux_257_nl), fsm_output(5));
  COMP_LOOP_mux_12_nl <= MUX_v_52_2_2((tmp_2_lpi_4_dfm(63 DOWNTO 12)), (p_sva(63
      DOWNTO 12)), and_dcpl_212);
  COMP_LOOP_nor_64_nl <= NOT(and_dcpl_215 OR and_dcpl_216 OR and_dcpl_222);
  COMP_LOOP_and_14_nl <= MUX_v_52_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux_12_nl, COMP_LOOP_nor_64_nl);
  COMP_LOOP_COMP_LOOP_or_4_nl <= MUX_v_52_2_2(COMP_LOOP_and_14_nl, STD_LOGIC_VECTOR'("1111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_or_18_itm);
  COMP_LOOP_mux1h_75_nl <= MUX1HOT_v_2_3_2((tmp_2_lpi_4_dfm(11 DOWNTO 10)), (p_sva(11
      DOWNTO 10)), (VEC_LOOP_j_sva_11_0(11 DOWNTO 10)), STD_LOGIC_VECTOR'( nor_152_cse
      & and_dcpl_212 & and_dcpl_222));
  COMP_LOOP_nor_65_nl <= NOT(and_dcpl_215 OR and_dcpl_216);
  COMP_LOOP_and_15_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_75_nl,
      COMP_LOOP_nor_65_nl);
  COMP_LOOP_or_28_nl <= MUX_v_2_2_2(COMP_LOOP_and_15_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_18_itm);
  COMP_LOOP_mux1h_76_nl <= MUX1HOT_v_2_5_2((tmp_2_lpi_4_dfm(9 DOWNTO 8)), STD_LOGIC_VECTOR'(
      '1' & (NOT (COMP_LOOP_k_9_1_sva_7_0(7)))), (p_sva(9 DOWNTO 8)), (z_out_1(9
      DOWNTO 8)), (VEC_LOOP_j_sva_11_0(9 DOWNTO 8)), STD_LOGIC_VECTOR'( nor_152_cse
      & and_dcpl_199 & and_dcpl_212 & COMP_LOOP_or_22_itm & and_dcpl_222));
  COMP_LOOP_or_30_nl <= and_dcpl_206 OR and_dcpl_223;
  COMP_LOOP_or_29_nl <= MUX_v_2_2_2(COMP_LOOP_mux1h_76_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_30_nl);
  COMP_LOOP_mux1h_77_nl <= MUX1HOT_v_8_7_2((tmp_2_lpi_4_dfm(7 DOWNTO 0)), ((NOT (COMP_LOOP_k_9_1_sva_7_0(6
      DOWNTO 0))) & '1'), STD_LOGIC_VECTOR'( (NOT modExp_exp_1_7_1_sva) & (NOT modExp_exp_1_6_1_sva)
      & (NOT modExp_exp_1_5_1_sva) & (NOT modExp_exp_1_4_1_sva) & (NOT modExp_exp_1_3_1_sva)
      & (NOT modExp_exp_1_2_1_sva) & (NOT modExp_exp_1_1_1_sva) & (NOT modExp_exp_1_0_1_sva_1)),
      (p_sva(7 DOWNTO 0)), (z_out_1(7 DOWNTO 0)), (VEC_LOOP_j_sva_11_0(7 DOWNTO 0)),
      STD_LOGIC_VECTOR'( (NOT modExp_exp_1_1_1_sva) & (NOT modExp_exp_1_7_1_sva)
      & (NOT modExp_exp_1_6_1_sva) & (NOT modExp_exp_1_5_1_sva) & (NOT modExp_exp_1_4_1_sva)
      & (NOT modExp_exp_1_3_1_sva) & (NOT modExp_exp_1_2_1_sva) & (NOT modExp_exp_1_0_1_sva_1)),
      STD_LOGIC_VECTOR'( nor_152_cse & and_dcpl_199 & and_dcpl_206 & and_dcpl_212
      & COMP_LOOP_or_22_itm & and_dcpl_222 & and_dcpl_223));
  COMP_LOOP_or_31_nl <= (NOT(and_dcpl_199 OR and_dcpl_206 OR and_dcpl_212 OR and_dcpl_215
      OR and_dcpl_216 OR and_dcpl_222 OR and_dcpl_223)) OR nor_152_cse;
  COMP_LOOP_mux1h_78_nl <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_da_d_1, STD_LOGIC_VECTOR'(
      "1111111111111111111111111111111111111111111111111111111111111110"), (STD_LOGIC_VECTOR'(
      "1111111111111111111111111111111111111111111111111111") & (NOT VEC_LOOP_j_sva_11_0)),
      (STD_LOGIC_VECTOR'( "111111111111111111111111111111111111111111111111111111")
      & (NOT STAGE_LOOP_lshift_psp_sva)), STD_LOGIC_VECTOR'( nor_152_cse & COMP_LOOP_or_18_itm
      & COMP_LOOP_or_22_itm & and_dcpl_222));
  COMP_LOOP_not_55_nl <= NOT and_dcpl_212;
  COMP_LOOP_nand_1_nl <= NOT(MUX_v_64_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux1h_78_nl, COMP_LOOP_not_55_nl));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_4_nl
      & COMP_LOOP_or_28_nl & COMP_LOOP_or_29_nl & COMP_LOOP_mux1h_77_nl & COMP_LOOP_or_31_nl),
      65), 66) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_nand_1_nl & '1'), 65),
      66), 66));
  z_out <= acc_nl(65 DOWNTO 1);
  and_342_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("011101010"));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0 & and_342_nl),
      9), 10), 10));
  COMP_LOOP_COMP_LOOP_or_5_nl <= (NOT(and_dcpl_244 OR and_dcpl_248 OR nor_152_cse
      OR and_dcpl_262)) OR and_dcpl_257 OR and_dcpl_266;
  COMP_LOOP_mux_13_nl <= MUX_s_1_2_2((tmp_2_lpi_4_dfm(63)), (NOT (operator_66_true_div_cmp_z_oreg(63))),
      and_dcpl_266);
  COMP_LOOP_COMP_LOOP_or_6_nl <= (COMP_LOOP_mux_13_nl AND (NOT(and_dcpl_244 OR and_dcpl_248
      OR and_dcpl_262))) OR and_dcpl_257;
  COMP_LOOP_mux1h_79_nl <= MUX1HOT_v_63_6_2((STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000001")
      & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))), (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000")
      & VEC_LOOP_j_sva_11_0), (tmp_2_lpi_4_dfm(62 DOWNTO 0)), (NOT (operator_64_false_acc_mut(62
      DOWNTO 0))), (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_9_1_sva_7_0), (NOT (operator_66_true_div_cmp_z_oreg(62 DOWNTO
      0))), STD_LOGIC_VECTOR'( and_dcpl_244 & and_dcpl_248 & nor_152_cse & and_dcpl_257
      & and_dcpl_262 & and_dcpl_266));
  COMP_LOOP_or_32_nl <= (NOT(and_dcpl_248 OR nor_152_cse OR and_dcpl_257 OR and_dcpl_262
      OR and_dcpl_266)) OR and_dcpl_244;
  COMP_LOOP_COMP_LOOP_and_55_nl <= (vec_rsc_0_0_i_da_d_1(63)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_56_nl <= (vec_rsc_0_0_i_da_d_1(62)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_57_nl <= (vec_rsc_0_0_i_da_d_1(61)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_58_nl <= (vec_rsc_0_0_i_da_d_1(60)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_59_nl <= (vec_rsc_0_0_i_da_d_1(59)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_60_nl <= (vec_rsc_0_0_i_da_d_1(58)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_61_nl <= (vec_rsc_0_0_i_da_d_1(57)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_62_nl <= (vec_rsc_0_0_i_da_d_1(56)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_63_nl <= (vec_rsc_0_0_i_da_d_1(55)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_64_nl <= (vec_rsc_0_0_i_da_d_1(54)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_65_nl <= (vec_rsc_0_0_i_da_d_1(53)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_66_nl <= (vec_rsc_0_0_i_da_d_1(52)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_67_nl <= (vec_rsc_0_0_i_da_d_1(51)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_68_nl <= (vec_rsc_0_0_i_da_d_1(50)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_69_nl <= (vec_rsc_0_0_i_da_d_1(49)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_70_nl <= (vec_rsc_0_0_i_da_d_1(48)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_71_nl <= (vec_rsc_0_0_i_da_d_1(47)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_72_nl <= (vec_rsc_0_0_i_da_d_1(46)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_73_nl <= (vec_rsc_0_0_i_da_d_1(45)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_74_nl <= (vec_rsc_0_0_i_da_d_1(44)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_75_nl <= (vec_rsc_0_0_i_da_d_1(43)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_76_nl <= (vec_rsc_0_0_i_da_d_1(42)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_77_nl <= (vec_rsc_0_0_i_da_d_1(41)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_78_nl <= (vec_rsc_0_0_i_da_d_1(40)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_79_nl <= (vec_rsc_0_0_i_da_d_1(39)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_80_nl <= (vec_rsc_0_0_i_da_d_1(38)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_81_nl <= (vec_rsc_0_0_i_da_d_1(37)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_82_nl <= (vec_rsc_0_0_i_da_d_1(36)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_83_nl <= (vec_rsc_0_0_i_da_d_1(35)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_84_nl <= (vec_rsc_0_0_i_da_d_1(34)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_85_nl <= (vec_rsc_0_0_i_da_d_1(33)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_86_nl <= (vec_rsc_0_0_i_da_d_1(32)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_87_nl <= (vec_rsc_0_0_i_da_d_1(31)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_88_nl <= (vec_rsc_0_0_i_da_d_1(30)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_89_nl <= (vec_rsc_0_0_i_da_d_1(29)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_90_nl <= (vec_rsc_0_0_i_da_d_1(28)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_91_nl <= (vec_rsc_0_0_i_da_d_1(27)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_92_nl <= (vec_rsc_0_0_i_da_d_1(26)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_93_nl <= (vec_rsc_0_0_i_da_d_1(25)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_94_nl <= (vec_rsc_0_0_i_da_d_1(24)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_95_nl <= (vec_rsc_0_0_i_da_d_1(23)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_96_nl <= (vec_rsc_0_0_i_da_d_1(22)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_97_nl <= (vec_rsc_0_0_i_da_d_1(21)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_98_nl <= (vec_rsc_0_0_i_da_d_1(20)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_99_nl <= (vec_rsc_0_0_i_da_d_1(19)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_100_nl <= (vec_rsc_0_0_i_da_d_1(18)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_101_nl <= (vec_rsc_0_0_i_da_d_1(17)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_102_nl <= (vec_rsc_0_0_i_da_d_1(16)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_103_nl <= (vec_rsc_0_0_i_da_d_1(15)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_104_nl <= (vec_rsc_0_0_i_da_d_1(14)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_105_nl <= (vec_rsc_0_0_i_da_d_1(13)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_106_nl <= (vec_rsc_0_0_i_da_d_1(12)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_107_nl <= (vec_rsc_0_0_i_da_d_1(11)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_108_nl <= (vec_rsc_0_0_i_da_d_1(10)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_and_109_nl <= (vec_rsc_0_0_i_da_d_1(9)) AND COMP_LOOP_nor_7_itm;
  COMP_LOOP_COMP_LOOP_mux_4_nl <= MUX_v_8_2_2(COMP_LOOP_k_9_1_sva_7_0, (vec_rsc_0_0_i_da_d_1(8
      DOWNTO 1)), nor_152_cse);
  COMP_LOOP_nor_70_nl <= NOT(and_dcpl_257 OR and_dcpl_262 OR and_dcpl_266);
  COMP_LOOP_and_17_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), COMP_LOOP_COMP_LOOP_mux_4_nl,
      COMP_LOOP_nor_70_nl);
  COMP_LOOP_COMP_LOOP_or_7_nl <= (vec_rsc_0_0_i_da_d_1(0)) OR and_dcpl_244 OR and_dcpl_248
      OR and_dcpl_257 OR and_dcpl_262 OR and_dcpl_266;
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_5_nl
      & COMP_LOOP_COMP_LOOP_or_6_nl & COMP_LOOP_mux1h_79_nl & COMP_LOOP_or_32_nl)
      + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_COMP_LOOP_and_55_nl & COMP_LOOP_COMP_LOOP_and_56_nl
      & COMP_LOOP_COMP_LOOP_and_57_nl & COMP_LOOP_COMP_LOOP_and_58_nl & COMP_LOOP_COMP_LOOP_and_59_nl
      & COMP_LOOP_COMP_LOOP_and_60_nl & COMP_LOOP_COMP_LOOP_and_61_nl & COMP_LOOP_COMP_LOOP_and_62_nl
      & COMP_LOOP_COMP_LOOP_and_63_nl & COMP_LOOP_COMP_LOOP_and_64_nl & COMP_LOOP_COMP_LOOP_and_65_nl
      & COMP_LOOP_COMP_LOOP_and_66_nl & COMP_LOOP_COMP_LOOP_and_67_nl & COMP_LOOP_COMP_LOOP_and_68_nl
      & COMP_LOOP_COMP_LOOP_and_69_nl & COMP_LOOP_COMP_LOOP_and_70_nl & COMP_LOOP_COMP_LOOP_and_71_nl
      & COMP_LOOP_COMP_LOOP_and_72_nl & COMP_LOOP_COMP_LOOP_and_73_nl & COMP_LOOP_COMP_LOOP_and_74_nl
      & COMP_LOOP_COMP_LOOP_and_75_nl & COMP_LOOP_COMP_LOOP_and_76_nl & COMP_LOOP_COMP_LOOP_and_77_nl
      & COMP_LOOP_COMP_LOOP_and_78_nl & COMP_LOOP_COMP_LOOP_and_79_nl & COMP_LOOP_COMP_LOOP_and_80_nl
      & COMP_LOOP_COMP_LOOP_and_81_nl & COMP_LOOP_COMP_LOOP_and_82_nl & COMP_LOOP_COMP_LOOP_and_83_nl
      & COMP_LOOP_COMP_LOOP_and_84_nl & COMP_LOOP_COMP_LOOP_and_85_nl & COMP_LOOP_COMP_LOOP_and_86_nl
      & COMP_LOOP_COMP_LOOP_and_87_nl & COMP_LOOP_COMP_LOOP_and_88_nl & COMP_LOOP_COMP_LOOP_and_89_nl
      & COMP_LOOP_COMP_LOOP_and_90_nl & COMP_LOOP_COMP_LOOP_and_91_nl & COMP_LOOP_COMP_LOOP_and_92_nl
      & COMP_LOOP_COMP_LOOP_and_93_nl & COMP_LOOP_COMP_LOOP_and_94_nl & COMP_LOOP_COMP_LOOP_and_95_nl
      & COMP_LOOP_COMP_LOOP_and_96_nl & COMP_LOOP_COMP_LOOP_and_97_nl & COMP_LOOP_COMP_LOOP_and_98_nl
      & COMP_LOOP_COMP_LOOP_and_99_nl & COMP_LOOP_COMP_LOOP_and_100_nl & COMP_LOOP_COMP_LOOP_and_101_nl
      & COMP_LOOP_COMP_LOOP_and_102_nl & COMP_LOOP_COMP_LOOP_and_103_nl & COMP_LOOP_COMP_LOOP_and_104_nl
      & COMP_LOOP_COMP_LOOP_and_105_nl & COMP_LOOP_COMP_LOOP_and_106_nl & COMP_LOOP_COMP_LOOP_and_107_nl
      & COMP_LOOP_COMP_LOOP_and_108_nl & COMP_LOOP_COMP_LOOP_and_109_nl & COMP_LOOP_and_17_nl
      & COMP_LOOP_COMP_LOOP_or_7_nl & '1'), 65), 66), 66));
  z_out_2 <= acc_2_nl(65 DOWNTO 1);
  nor_161_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(2)))
      OR (fsm_output(5)) OR (fsm_output(7)));
  nor_162_nl <= NOT((fsm_output(2)) OR (NOT((fsm_output(5)) AND (fsm_output(7)))));
  nor_163_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(5))) OR (fsm_output(7)));
  mux_267_nl <= MUX_s_1_2_2(nor_162_nl, nor_163_nl, fsm_output(0));
  and_344_nl <= (fsm_output(1)) AND mux_267_nl;
  mux_266_nl <= MUX_s_1_2_2(nor_161_nl, and_344_nl, fsm_output(4));
  and_343_nl <= mux_266_nl AND (NOT (fsm_output(8))) AND (fsm_output(3)) AND (NOT
      (fsm_output(6)));
  modExp_while_if_mux_1_nl <= MUX_v_64_2_2(modExp_result_sva, COMP_LOOP_1_acc_5_mut,
      and_343_nl);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(SIGNED'( SIGNED(modExp_while_if_mux_1_nl)
      * SIGNED(COMP_LOOP_1_acc_5_mut)), 64));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_0_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wea : OUT STD_LOGIC;
    vec_rsc_0_0_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_1_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wea : OUT STD_LOGIC;
    vec_rsc_0_1_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIT;

ARCHITECTURE v11 OF inPlaceNTT_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL operator_66_true_div_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra_d_iff : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wea_d_iff : STD_LOGIC;

  SIGNAL operator_66_true_div_cmp_a_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      r_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      operator_66_true_div_cmp_a : OUT STD_LOGIC_VECTOR (64 DOWNTO 0);
      operator_66_true_div_cmp_b : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
      vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_r_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a : STD_LOGIC_VECTOR (64
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z : STD_LOGIC_VECTOR (64
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  operator_66_true_div_cmp : work.mgc_comps.mgc_div
    GENERIC MAP(
      width_a => 65,
      width_b => 11,
      signd => 1
      )
    PORT MAP(
      a => operator_66_true_div_cmp_a_1,
      b => operator_66_true_div_cmp_b_1,
      z => operator_66_true_div_cmp_z_1
    );
  operator_66_true_div_cmp_a_1 <= operator_66_true_div_cmp_a;
  operator_66_true_div_cmp_b_1 <= operator_66_true_div_cmp_b;
  operator_66_true_div_cmp_z <= operator_66_true_div_cmp_z_1;

  vec_rsc_0_0_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
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

  vec_rsc_0_1_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
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

  inPlaceNTT_DIT_core_inst : inPlaceNTT_DIT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      p_rsc_dat => inPlaceNTT_DIT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_dat => inPlaceNTT_DIT_core_inst_r_rsc_dat,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      vec_rsc_0_0_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      operator_66_true_div_cmp_a => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a,
      operator_66_true_div_cmp_b => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b,
      operator_66_true_div_cmp_z => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z,
      vec_rsc_0_0_i_adra_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  operator_66_true_div_cmp_a <= inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a;
  operator_66_true_div_cmp_b <= inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b;
  inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z <= operator_66_true_div_cmp_z;
  vec_rsc_0_0_i_adra_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff;

END v11;



