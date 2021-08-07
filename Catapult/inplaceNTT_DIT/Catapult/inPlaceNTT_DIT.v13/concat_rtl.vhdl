
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
--  Generated date: Mon May 17 21:39:16 2021
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

ARCHITECTURE v13 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v13;

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

ARCHITECTURE v13 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v13;

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
    STAGE_LOOP_C_5_tr0 : IN STD_LOGIC;
    modExp_while_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_80_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_120_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_160_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_6_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v13 OF inPlaceNTT_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  TYPE inPlaceNTT_DIT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, STAGE_LOOP_C_1,
      STAGE_LOOP_C_2, STAGE_LOOP_C_3, STAGE_LOOP_C_4, STAGE_LOOP_C_5, modExp_while_C_0,
      modExp_while_C_1, modExp_while_C_2, modExp_while_C_3, modExp_while_C_4, modExp_while_C_5,
      modExp_while_C_6, modExp_while_C_7, modExp_while_C_8, modExp_while_C_9, modExp_while_C_10,
      modExp_while_C_11, modExp_while_C_12, modExp_while_C_13, modExp_while_C_14,
      modExp_while_C_15, modExp_while_C_16, modExp_while_C_17, modExp_while_C_18,
      modExp_while_C_19, modExp_while_C_20, modExp_while_C_21, modExp_while_C_22,
      modExp_while_C_23, modExp_while_C_24, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0,
      COMP_LOOP_1_modExp_1_while_C_1, COMP_LOOP_1_modExp_1_while_C_2, COMP_LOOP_1_modExp_1_while_C_3,
      COMP_LOOP_1_modExp_1_while_C_4, COMP_LOOP_1_modExp_1_while_C_5, COMP_LOOP_1_modExp_1_while_C_6,
      COMP_LOOP_1_modExp_1_while_C_7, COMP_LOOP_1_modExp_1_while_C_8, COMP_LOOP_1_modExp_1_while_C_9,
      COMP_LOOP_1_modExp_1_while_C_10, COMP_LOOP_1_modExp_1_while_C_11, COMP_LOOP_1_modExp_1_while_C_12,
      COMP_LOOP_1_modExp_1_while_C_13, COMP_LOOP_1_modExp_1_while_C_14, COMP_LOOP_1_modExp_1_while_C_15,
      COMP_LOOP_1_modExp_1_while_C_16, COMP_LOOP_1_modExp_1_while_C_17, COMP_LOOP_1_modExp_1_while_C_18,
      COMP_LOOP_1_modExp_1_while_C_19, COMP_LOOP_1_modExp_1_while_C_20, COMP_LOOP_1_modExp_1_while_C_21,
      COMP_LOOP_1_modExp_1_while_C_22, COMP_LOOP_1_modExp_1_while_C_23, COMP_LOOP_1_modExp_1_while_C_24,
      COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5, COMP_LOOP_C_6,
      COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10, COMP_LOOP_C_11,
      COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15, COMP_LOOP_C_16,
      COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19, COMP_LOOP_C_20, COMP_LOOP_C_21,
      COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24, COMP_LOOP_C_25, COMP_LOOP_C_26,
      COMP_LOOP_C_27, COMP_LOOP_C_28, COMP_LOOP_C_29, COMP_LOOP_C_30, COMP_LOOP_C_31,
      COMP_LOOP_C_32, COMP_LOOP_C_33, COMP_LOOP_C_34, COMP_LOOP_C_35, COMP_LOOP_C_36,
      COMP_LOOP_C_37, COMP_LOOP_C_38, COMP_LOOP_C_39, COMP_LOOP_C_40, COMP_LOOP_C_41,
      COMP_LOOP_2_modExp_1_while_C_0, COMP_LOOP_2_modExp_1_while_C_1, COMP_LOOP_2_modExp_1_while_C_2,
      COMP_LOOP_2_modExp_1_while_C_3, COMP_LOOP_2_modExp_1_while_C_4, COMP_LOOP_2_modExp_1_while_C_5,
      COMP_LOOP_2_modExp_1_while_C_6, COMP_LOOP_2_modExp_1_while_C_7, COMP_LOOP_2_modExp_1_while_C_8,
      COMP_LOOP_2_modExp_1_while_C_9, COMP_LOOP_2_modExp_1_while_C_10, COMP_LOOP_2_modExp_1_while_C_11,
      COMP_LOOP_2_modExp_1_while_C_12, COMP_LOOP_2_modExp_1_while_C_13, COMP_LOOP_2_modExp_1_while_C_14,
      COMP_LOOP_2_modExp_1_while_C_15, COMP_LOOP_2_modExp_1_while_C_16, COMP_LOOP_2_modExp_1_while_C_17,
      COMP_LOOP_2_modExp_1_while_C_18, COMP_LOOP_2_modExp_1_while_C_19, COMP_LOOP_2_modExp_1_while_C_20,
      COMP_LOOP_2_modExp_1_while_C_21, COMP_LOOP_2_modExp_1_while_C_22, COMP_LOOP_2_modExp_1_while_C_23,
      COMP_LOOP_2_modExp_1_while_C_24, COMP_LOOP_C_42, COMP_LOOP_C_43, COMP_LOOP_C_44,
      COMP_LOOP_C_45, COMP_LOOP_C_46, COMP_LOOP_C_47, COMP_LOOP_C_48, COMP_LOOP_C_49,
      COMP_LOOP_C_50, COMP_LOOP_C_51, COMP_LOOP_C_52, COMP_LOOP_C_53, COMP_LOOP_C_54,
      COMP_LOOP_C_55, COMP_LOOP_C_56, COMP_LOOP_C_57, COMP_LOOP_C_58, COMP_LOOP_C_59,
      COMP_LOOP_C_60, COMP_LOOP_C_61, COMP_LOOP_C_62, COMP_LOOP_C_63, COMP_LOOP_C_64,
      COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_C_68, COMP_LOOP_C_69,
      COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72, COMP_LOOP_C_73, COMP_LOOP_C_74,
      COMP_LOOP_C_75, COMP_LOOP_C_76, COMP_LOOP_C_77, COMP_LOOP_C_78, COMP_LOOP_C_79,
      COMP_LOOP_C_80, COMP_LOOP_C_81, COMP_LOOP_3_modExp_1_while_C_0, COMP_LOOP_3_modExp_1_while_C_1,
      COMP_LOOP_3_modExp_1_while_C_2, COMP_LOOP_3_modExp_1_while_C_3, COMP_LOOP_3_modExp_1_while_C_4,
      COMP_LOOP_3_modExp_1_while_C_5, COMP_LOOP_3_modExp_1_while_C_6, COMP_LOOP_3_modExp_1_while_C_7,
      COMP_LOOP_3_modExp_1_while_C_8, COMP_LOOP_3_modExp_1_while_C_9, COMP_LOOP_3_modExp_1_while_C_10,
      COMP_LOOP_3_modExp_1_while_C_11, COMP_LOOP_3_modExp_1_while_C_12, COMP_LOOP_3_modExp_1_while_C_13,
      COMP_LOOP_3_modExp_1_while_C_14, COMP_LOOP_3_modExp_1_while_C_15, COMP_LOOP_3_modExp_1_while_C_16,
      COMP_LOOP_3_modExp_1_while_C_17, COMP_LOOP_3_modExp_1_while_C_18, COMP_LOOP_3_modExp_1_while_C_19,
      COMP_LOOP_3_modExp_1_while_C_20, COMP_LOOP_3_modExp_1_while_C_21, COMP_LOOP_3_modExp_1_while_C_22,
      COMP_LOOP_3_modExp_1_while_C_23, COMP_LOOP_3_modExp_1_while_C_24, COMP_LOOP_C_82,
      COMP_LOOP_C_83, COMP_LOOP_C_84, COMP_LOOP_C_85, COMP_LOOP_C_86, COMP_LOOP_C_87,
      COMP_LOOP_C_88, COMP_LOOP_C_89, COMP_LOOP_C_90, COMP_LOOP_C_91, COMP_LOOP_C_92,
      COMP_LOOP_C_93, COMP_LOOP_C_94, COMP_LOOP_C_95, COMP_LOOP_C_96, COMP_LOOP_C_97,
      COMP_LOOP_C_98, COMP_LOOP_C_99, COMP_LOOP_C_100, COMP_LOOP_C_101, COMP_LOOP_C_102,
      COMP_LOOP_C_103, COMP_LOOP_C_104, COMP_LOOP_C_105, COMP_LOOP_C_106, COMP_LOOP_C_107,
      COMP_LOOP_C_108, COMP_LOOP_C_109, COMP_LOOP_C_110, COMP_LOOP_C_111, COMP_LOOP_C_112,
      COMP_LOOP_C_113, COMP_LOOP_C_114, COMP_LOOP_C_115, COMP_LOOP_C_116, COMP_LOOP_C_117,
      COMP_LOOP_C_118, COMP_LOOP_C_119, COMP_LOOP_C_120, COMP_LOOP_C_121, COMP_LOOP_4_modExp_1_while_C_0,
      COMP_LOOP_4_modExp_1_while_C_1, COMP_LOOP_4_modExp_1_while_C_2, COMP_LOOP_4_modExp_1_while_C_3,
      COMP_LOOP_4_modExp_1_while_C_4, COMP_LOOP_4_modExp_1_while_C_5, COMP_LOOP_4_modExp_1_while_C_6,
      COMP_LOOP_4_modExp_1_while_C_7, COMP_LOOP_4_modExp_1_while_C_8, COMP_LOOP_4_modExp_1_while_C_9,
      COMP_LOOP_4_modExp_1_while_C_10, COMP_LOOP_4_modExp_1_while_C_11, COMP_LOOP_4_modExp_1_while_C_12,
      COMP_LOOP_4_modExp_1_while_C_13, COMP_LOOP_4_modExp_1_while_C_14, COMP_LOOP_4_modExp_1_while_C_15,
      COMP_LOOP_4_modExp_1_while_C_16, COMP_LOOP_4_modExp_1_while_C_17, COMP_LOOP_4_modExp_1_while_C_18,
      COMP_LOOP_4_modExp_1_while_C_19, COMP_LOOP_4_modExp_1_while_C_20, COMP_LOOP_4_modExp_1_while_C_21,
      COMP_LOOP_4_modExp_1_while_C_22, COMP_LOOP_4_modExp_1_while_C_23, COMP_LOOP_4_modExp_1_while_C_24,
      COMP_LOOP_C_122, COMP_LOOP_C_123, COMP_LOOP_C_124, COMP_LOOP_C_125, COMP_LOOP_C_126,
      COMP_LOOP_C_127, COMP_LOOP_C_128, COMP_LOOP_C_129, COMP_LOOP_C_130, COMP_LOOP_C_131,
      COMP_LOOP_C_132, COMP_LOOP_C_133, COMP_LOOP_C_134, COMP_LOOP_C_135, COMP_LOOP_C_136,
      COMP_LOOP_C_137, COMP_LOOP_C_138, COMP_LOOP_C_139, COMP_LOOP_C_140, COMP_LOOP_C_141,
      COMP_LOOP_C_142, COMP_LOOP_C_143, COMP_LOOP_C_144, COMP_LOOP_C_145, COMP_LOOP_C_146,
      COMP_LOOP_C_147, COMP_LOOP_C_148, COMP_LOOP_C_149, COMP_LOOP_C_150, COMP_LOOP_C_151,
      COMP_LOOP_C_152, COMP_LOOP_C_153, COMP_LOOP_C_154, COMP_LOOP_C_155, COMP_LOOP_C_156,
      COMP_LOOP_C_157, COMP_LOOP_C_158, COMP_LOOP_C_159, COMP_LOOP_C_160, VEC_LOOP_C_0,
      STAGE_LOOP_C_6, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_5_tr0, modExp_while_C_24_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_24_tr0, COMP_LOOP_C_40_tr0,
      COMP_LOOP_2_modExp_1_while_C_24_tr0, COMP_LOOP_C_80_tr0, COMP_LOOP_3_modExp_1_while_C_24_tr0,
      COMP_LOOP_C_120_tr0, COMP_LOOP_4_modExp_1_while_C_24_tr0, COMP_LOOP_C_160_tr0,
      VEC_LOOP_C_0_tr0, STAGE_LOOP_C_6_tr0, state_var)
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
        IF ( STAGE_LOOP_C_5_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        IF ( modExp_while_C_24_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_12;
      WHEN COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_13;
      WHEN COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_14;
      WHEN COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_15;
      WHEN COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_16;
      WHEN COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_17;
      WHEN COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_18;
      WHEN COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_19;
      WHEN COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_20;
      WHEN COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_21;
      WHEN COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_22;
      WHEN COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_23;
      WHEN COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_24;
      WHEN COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        IF ( COMP_LOOP_1_modExp_1_while_C_24_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        IF ( COMP_LOOP_C_40_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_41;
        END IF;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_12;
      WHEN COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_13;
      WHEN COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_14;
      WHEN COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_15;
      WHEN COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_16;
      WHEN COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_17;
      WHEN COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_18;
      WHEN COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_19;
      WHEN COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_20;
      WHEN COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_21;
      WHEN COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_22;
      WHEN COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_23;
      WHEN COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_24;
      WHEN COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        IF ( COMP_LOOP_2_modExp_1_while_C_24_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_42;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        IF ( COMP_LOOP_C_80_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_81;
        END IF;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
      WHEN COMP_LOOP_3_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_1;
      WHEN COMP_LOOP_3_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_2;
      WHEN COMP_LOOP_3_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_3;
      WHEN COMP_LOOP_3_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_4;
      WHEN COMP_LOOP_3_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_5;
      WHEN COMP_LOOP_3_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_6;
      WHEN COMP_LOOP_3_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_7;
      WHEN COMP_LOOP_3_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_8;
      WHEN COMP_LOOP_3_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_9;
      WHEN COMP_LOOP_3_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_10;
      WHEN COMP_LOOP_3_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_11;
      WHEN COMP_LOOP_3_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_12;
      WHEN COMP_LOOP_3_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_13;
      WHEN COMP_LOOP_3_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_14;
      WHEN COMP_LOOP_3_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_15;
      WHEN COMP_LOOP_3_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_16;
      WHEN COMP_LOOP_3_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_17;
      WHEN COMP_LOOP_3_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_18;
      WHEN COMP_LOOP_3_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_19;
      WHEN COMP_LOOP_3_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_20;
      WHEN COMP_LOOP_3_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_21;
      WHEN COMP_LOOP_3_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_22;
      WHEN COMP_LOOP_3_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_23;
      WHEN COMP_LOOP_3_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_24;
      WHEN COMP_LOOP_3_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        IF ( COMP_LOOP_3_modExp_1_while_C_24_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_82;
        ELSE
          state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        IF ( COMP_LOOP_C_120_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_121;
        END IF;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
      WHEN COMP_LOOP_4_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_1;
      WHEN COMP_LOOP_4_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_2;
      WHEN COMP_LOOP_4_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_3;
      WHEN COMP_LOOP_4_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_4;
      WHEN COMP_LOOP_4_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_5;
      WHEN COMP_LOOP_4_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_6;
      WHEN COMP_LOOP_4_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_7;
      WHEN COMP_LOOP_4_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_8;
      WHEN COMP_LOOP_4_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_9;
      WHEN COMP_LOOP_4_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_10;
      WHEN COMP_LOOP_4_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_11;
      WHEN COMP_LOOP_4_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_12;
      WHEN COMP_LOOP_4_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_13;
      WHEN COMP_LOOP_4_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_14;
      WHEN COMP_LOOP_4_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_15;
      WHEN COMP_LOOP_4_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_16;
      WHEN COMP_LOOP_4_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_17;
      WHEN COMP_LOOP_4_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_18;
      WHEN COMP_LOOP_4_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_19;
      WHEN COMP_LOOP_4_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_20;
      WHEN COMP_LOOP_4_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_21;
      WHEN COMP_LOOP_4_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_22;
      WHEN COMP_LOOP_4_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_23;
      WHEN COMP_LOOP_4_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_24;
      WHEN COMP_LOOP_4_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        IF ( COMP_LOOP_4_modExp_1_while_C_24_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_122;
        ELSE
          state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        IF ( COMP_LOOP_C_160_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_6;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        IF ( STAGE_LOOP_C_6_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
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

END v13;

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
    vec_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v13 OF inPlaceNTT_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL nor_tmp_8 : STD_LOGIC;
  SIGNAL mux_tmp_43 : STD_LOGIC;
  SIGNAL or_tmp_47 : STD_LOGIC;
  SIGNAL not_tmp_50 : STD_LOGIC;
  SIGNAL or_tmp_69 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL not_tmp_73 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL or_tmp_135 : STD_LOGIC;
  SIGNAL and_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_142 : STD_LOGIC;
  SIGNAL mux_tmp_139 : STD_LOGIC;
  SIGNAL or_tmp_143 : STD_LOGIC;
  SIGNAL or_tmp_144 : STD_LOGIC;
  SIGNAL mux_tmp_141 : STD_LOGIC;
  SIGNAL or_tmp_149 : STD_LOGIC;
  SIGNAL and_tmp_8 : STD_LOGIC;
  SIGNAL mux_tmp_145 : STD_LOGIC;
  SIGNAL or_tmp_154 : STD_LOGIC;
  SIGNAL or_tmp_156 : STD_LOGIC;
  SIGNAL mux_tmp_151 : STD_LOGIC;
  SIGNAL or_tmp_159 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL xor_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL nand_tmp_10 : STD_LOGIC;
  SIGNAL or_tmp_162 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL mux_tmp_166 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL or_tmp_174 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL or_tmp_192 : STD_LOGIC;
  SIGNAL and_dcpl_120 : STD_LOGIC;
  SIGNAL not_tmp_136 : STD_LOGIC;
  SIGNAL or_tmp_214 : STD_LOGIC;
  SIGNAL or_tmp_218 : STD_LOGIC;
  SIGNAL or_tmp_220 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL or_tmp_226 : STD_LOGIC;
  SIGNAL or_tmp_229 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL mux_tmp_241 : STD_LOGIC;
  SIGNAL or_tmp_237 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL mux_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_259 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL nor_tmp_51 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL or_tmp_261 : STD_LOGIC;
  SIGNAL or_tmp_262 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL not_tmp_190 : STD_LOGIC;
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_60_ssc : STD_LOGIC;
  SIGNAL and_64_ssc : STD_LOGIC;
  SIGNAL and_68_ssc : STD_LOGIC;
  SIGNAL and_73_ssc : STD_LOGIC;
  SIGNAL and_80_ssc : STD_LOGIC;
  SIGNAL and_121_m1c : STD_LOGIC;
  SIGNAL and_129_m1c : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_1_obj_ld_cse : STD_LOGIC;
  SIGNAL or_72_cse : STD_LOGIC;
  SIGNAL and_214_cse : STD_LOGIC;
  SIGNAL or_351_cse : STD_LOGIC;
  SIGNAL or_80_cse : STD_LOGIC;
  SIGNAL or_333_cse : STD_LOGIC;
  SIGNAL and_170_cse : STD_LOGIC;
  SIGNAL nor_84_cse : STD_LOGIC;
  SIGNAL and_211_cse : STD_LOGIC;
  SIGNAL nand_15_cse : STD_LOGIC;
  SIGNAL or_356_cse : STD_LOGIC;
  SIGNAL or_270_cse : STD_LOGIC;
  SIGNAL or_46_cse : STD_LOGIC;
  SIGNAL or_12_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_k_9_2_sva_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL mux_108_cse : STD_LOGIC;
  SIGNAL mux_23_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_3_rmff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_40_rmff : STD_LOGIC;
  SIGNAL modExp_base_1_sva_mx1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_5_mut_mx0w5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_and_3 : STD_LOGIC;
  SIGNAL modExp_while_and_5 : STD_LOGIC;
  SIGNAL mux_97_itm : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_183 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_223 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL and_dcpl_259 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_273 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_exp_1_7_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_11_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL modExp_base_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_or_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL and_259_cse : STD_LOGIC;
  SIGNAL or_tmp_321 : STD_LOGIC;
  SIGNAL or_tmp_323 : STD_LOGIC;
  SIGNAL or_tmp_324 : STD_LOGIC;
  SIGNAL or_tmp_332 : STD_LOGIC;
  SIGNAL mux_tmp_361 : STD_LOGIC;
  SIGNAL mux_tmp_364 : STD_LOGIC;
  SIGNAL mux_tmp_366 : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_2_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL nor_171_cse : STD_LOGIC;
  SIGNAL or_388_cse : STD_LOGIC;
  SIGNAL nor_177_cse : STD_LOGIC;
  SIGNAL or_425_cse : STD_LOGIC;
  SIGNAL nor_172_cse : STD_LOGIC;
  SIGNAL or_410_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_16_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;
  SIGNAL z_out_4_8 : STD_LOGIC;
  SIGNAL mux_284_cse : STD_LOGIC;
  SIGNAL mux_288_cse : STD_LOGIC;
  SIGNAL nor_77_cse : STD_LOGIC;
  SIGNAL and_271_cse : STD_LOGIC;

  SIGNAL or_123_nl : STD_LOGIC;
  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL or_179_nl : STD_LOGIC;
  SIGNAL nor_93_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL or_174_nl : STD_LOGIC;
  SIGNAL or_173_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL or_164_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL and_183_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL and_184_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL nor_91_nl : STD_LOGIC;
  SIGNAL mux1h_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_383_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL or_289_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL or_288_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL or_287_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL or_285_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL or_278_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_1_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_2_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL nor_89_nl : STD_LOGIC;
  SIGNAL or_202_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL nor_153_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL or_197_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL or_398_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL nor_184_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL or_395_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL or_392_nl : STD_LOGIC;
  SIGNAL and_344_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL or_387_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL or_385_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL or_417_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL or_414_nl : STD_LOGIC;
  SIGNAL or_413_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL or_412_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL or_409_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL or_404_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL or_210_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL or_352_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL or_423_nl : STD_LOGIC;
  SIGNAL or_422_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL nor_87_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL or_218_nl : STD_LOGIC;
  SIGNAL and_124_nl : STD_LOGIC;
  SIGNAL r_or_nl : STD_LOGIC;
  SIGNAL r_or_1_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL and_180_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL and_136_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL or_245_nl : STD_LOGIC;
  SIGNAL and_137_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_177_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL nor_78_nl : STD_LOGIC;
  SIGNAL or_240_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL or_239_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_12_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_and_3_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL nor_75_nl : STD_LOGIC;
  SIGNAL nor_76_nl : STD_LOGIC;
  SIGNAL or_349_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL or_257_nl : STD_LOGIC;
  SIGNAL or_256_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL or_368_nl : STD_LOGIC;
  SIGNAL or_369_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL nand_41_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL or_317_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL nor_65_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL nor_64_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_24_nl : STD_LOGIC;
  SIGNAL and_158_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL nor_62_nl : STD_LOGIC;
  SIGNAL nor_63_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL nor_60_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL and_169_nl : STD_LOGIC;
  SIGNAL or_329_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_20_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_37_nl : STD_LOGIC;
  SIGNAL and_166_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL and_165_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL or_92_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL nor_117_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL or_5_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL and_182_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL and_178_nl : STD_LOGIC;
  SIGNAL nor_79_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL or_251_nl : STD_LOGIC;
  SIGNAL or_268_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL or_269_nl : STD_LOGIC;
  SIGNAL or_281_nl : STD_LOGIC;
  SIGNAL or_41_nl : STD_LOGIC;
  SIGNAL mux_325_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL and_160_nl : STD_LOGIC;
  SIGNAL mux_328_nl : STD_LOGIC;
  SIGNAL or_338_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL nor_58_nl : STD_LOGIC;
  SIGNAL and_168_nl : STD_LOGIC;
  SIGNAL nor_88_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL and_215_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL nor_113_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL and_190_nl : STD_LOGIC;
  SIGNAL nor_112_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL nor_111_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL nand_3_nl : STD_LOGIC;
  SIGNAL or_124_nl : STD_LOGIC;
  SIGNAL or_363_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL or_120_nl : STD_LOGIC;
  SIGNAL or_116_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL or_115_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL or_138_nl : STD_LOGIC;
  SIGNAL or_137_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL or_135_nl : STD_LOGIC;
  SIGNAL or_134_nl : STD_LOGIC;
  SIGNAL and_189_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL nor_105_nl : STD_LOGIC;
  SIGNAL nor_106_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL and_188_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL or_361_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL or_143_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL or_142_nl : STD_LOGIC;
  SIGNAL or_141_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL nor_96_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL or_159_nl : STD_LOGIC;
  SIGNAL nand_35_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL nand_21_nl : STD_LOGIC;
  SIGNAL and_186_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL nor_97_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL nand_54_nl : STD_LOGIC;
  SIGNAL or_406_nl : STD_LOGIC;
  SIGNAL or_405_nl : STD_LOGIC;
  SIGNAL or_408_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_27_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_6_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_64_false_1_mux_11_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL operator_64_false_1_or_2_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_1_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_18_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_11_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_5_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_29_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_350_nl : STD_LOGIC;
  SIGNAL and_351_nl : STD_LOGIC;
  SIGNAL and_352_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_3_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_28_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_or_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_4_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_71_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_72_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_24_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_10_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_2_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_not_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_1_mux_12_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_13_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_14_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_16_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_17_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_18_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_353_nl : STD_LOGIC;
  SIGNAL modExp_while_if_or_1_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL or_429_nl : STD_LOGIC;
  SIGNAL and_355_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL and_356_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL nand_55_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL nor_191_nl : STD_LOGIC;
  SIGNAL modExp_while_if_modExp_while_if_mux1h_1_nl : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL modExp_while_if_and_4_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_5_nl : STD_LOGIC;
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL r_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL modulo_result_rem_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL operator_66_true_div_cmp_a_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL STAGE_LOOP_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      STAGE_LOOP_C_5_tr0 : IN STD_LOGIC;
      modExp_while_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_80_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_120_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_modExp_1_while_C_24_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_160_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_6_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0 : STD_LOGIC;

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

  operator_66_true_div_cmp : work.mgc_comps.mgc_div
    GENERIC MAP(
      width_a => 65,
      width_b => 11,
      signd => 1
      )
    PORT MAP(
      a => operator_66_true_div_cmp_a_1,
      b => operator_66_true_div_cmp_b,
      z => operator_66_true_div_cmp_z_1
    );
  operator_66_true_div_cmp_a_1 <= operator_66_true_div_cmp_a;
  operator_66_true_div_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(operator_66_true_div_cmp_b_9_0));
  operator_66_true_div_cmp_z <= operator_66_true_div_cmp_z_1;

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

  inPlaceNTT_DIT_core_core_fsm_inst : inPlaceNTT_DIT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIT_core_core_fsm_inst_fsm_output,
      STAGE_LOOP_C_5_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0,
      modExp_while_C_24_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_24_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0,
      COMP_LOOP_2_modExp_1_while_C_24_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0,
      COMP_LOOP_C_80_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0,
      COMP_LOOP_3_modExp_1_while_C_24_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0,
      COMP_LOOP_C_120_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0,
      COMP_LOOP_4_modExp_1_while_C_24_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0,
      COMP_LOOP_C_160_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_6_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_5_tr0 <= NOT (z_out_2(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_24_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_80_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_24_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_120_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_24_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_6_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  or_123_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_108_cse <= MUX_s_1_2_2(or_tmp_47, or_123_nl, fsm_output(1));
  or_80_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_284_cse <= MUX_s_1_2_2(or_tmp_262, or_tmp_261, fsm_output(0));
  or_289_nl <= (fsm_output(0)) OR (NOT and_tmp_7);
  mux_285_nl <= MUX_s_1_2_2(mux_284_cse, or_289_nl, fsm_output(6));
  mux_278_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(3));
  or_288_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_279_nl <= MUX_s_1_2_2(mux_278_nl, or_46_cse, or_288_nl);
  mux_280_nl <= MUX_s_1_2_2(mux_279_nl, mux_tmp_267, fsm_output(7));
  or_287_nl <= (NOT modExp_exp_1_0_1_sva) OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_274_nl <= MUX_s_1_2_2(or_287_nl, or_46_cse, fsm_output(2));
  mux_275_nl <= MUX_s_1_2_2(mux_23_cse, (NOT mux_274_nl), fsm_output(1));
  mux_276_nl <= MUX_s_1_2_2(mux_275_nl, mux_23_cse, fsm_output(7));
  or_285_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"));
  mux_273_nl <= MUX_s_1_2_2(or_285_nl, mux_tmp_264, fsm_output(7));
  mux_277_nl <= MUX_s_1_2_2(mux_276_nl, (NOT mux_273_nl), fsm_output(0));
  mux_281_nl <= MUX_s_1_2_2(mux_280_nl, mux_277_nl, fsm_output(5));
  mux_260_nl <= MUX_s_1_2_2(nor_tmp_8, mux_tmp_259, fsm_output(1));
  mux_270_nl <= MUX_s_1_2_2(mux_tmp_267, mux_260_nl, fsm_output(7));
  or_284_nl <= (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"))))
      OR (fsm_output(4));
  mux_268_nl <= MUX_s_1_2_2(nor_tmp_51, or_284_nl, fsm_output(1));
  mux_269_nl <= MUX_s_1_2_2(mux_268_nl, mux_tmp_267, fsm_output(7));
  mux_271_nl <= MUX_s_1_2_2(mux_270_nl, mux_269_nl, fsm_output(0));
  or_278_nl <= (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11"))
      OR modExp_exp_1_0_1_sva)) OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_265_nl <= MUX_s_1_2_2(mux_tmp_264, or_278_nl, fsm_output(7));
  nor_nl <= NOT((fsm_output(2)) OR (NOT nor_tmp_8));
  mux_262_nl <= MUX_s_1_2_2(mux_23_cse, nor_nl, fsm_output(1));
  mux_263_nl <= MUX_s_1_2_2(mux_262_nl, mux_23_cse, fsm_output(7));
  mux_266_nl <= MUX_s_1_2_2((NOT mux_265_nl), mux_263_nl, fsm_output(0));
  mux_272_nl <= MUX_s_1_2_2(mux_271_nl, mux_266_nl, fsm_output(5));
  mux_282_nl <= MUX_s_1_2_2(mux_281_nl, mux_272_nl, fsm_output(6));
  or_383_nl <= and_dcpl_87 OR and_dcpl_91 OR (NOT(mux_285_nl OR (NOT and_dcpl_83)
      OR (fsm_output(8)) OR (NOT(mux_282_nl AND (NOT(and_dcpl_133 AND (NOT modExp_exp_1_0_1_sva)))))));
  modExp_while_if_and_1_nl <= modExp_while_and_3 AND and_dcpl_133;
  modExp_while_if_and_2_nl <= modExp_while_and_5 AND and_dcpl_133;
  mux1h_nl <= MUX1HOT_v_64_5_2(z_out_5, STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, COMP_LOOP_1_acc_5_mut_mx0w5,
      STD_LOGIC_VECTOR'( or_383_nl & and_dcpl_120 & modExp_while_if_and_1_nl & modExp_while_if_and_2_nl
      & and_dcpl_95));
  and_111_nl <= and_dcpl_100 AND and_dcpl_27;
  mux_174_nl <= MUX_s_1_2_2(or_tmp_69, or_tmp_143, fsm_output(6));
  mux_175_nl <= MUX_s_1_2_2(mux_174_nl, mux_tmp_173, fsm_output(3));
  nor_89_nl <= NOT((fsm_output(3)) OR mux_tmp_172);
  mux_176_nl <= MUX_s_1_2_2(mux_175_nl, nor_89_nl, fsm_output(4));
  mux_171_nl <= MUX_s_1_2_2(or_tmp_149, or_tmp_174, nor_171_cse);
  or_202_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")) OR mux_171_nl;
  mux_177_nl <= MUX_s_1_2_2(mux_176_nl, or_202_nl, fsm_output(5));
  or_197_nl <= (fsm_output(6)) OR (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))))
      OR (fsm_output(7));
  mux_169_nl <= MUX_s_1_2_2(or_388_cse, or_197_nl, fsm_output(3));
  or_195_nl <= (fsm_output(3)) OR (fsm_output(6)) OR or_tmp_144;
  mux_170_nl <= MUX_s_1_2_2(mux_169_nl, or_195_nl, fsm_output(4));
  nor_153_nl <= NOT((fsm_output(5)) OR mux_170_nl);
  mux_178_nl <= MUX_s_1_2_2(mux_177_nl, nor_153_nl, fsm_output(8));
  operator_64_false_mux1h_2_rgt <= MUX1HOT_v_65_3_2(z_out, (STD_LOGIC_VECTOR'( "00")
      & operator_64_false_slc_modExp_exp_63_1_3), ('0' & mux1h_nl), STD_LOGIC_VECTOR'(
      and_111_nl & and_dcpl_105 & mux_178_nl));
  nor_171_cse <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))));
  or_388_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_425_cse <= (NOT (fsm_output(6))) OR (fsm_output(0));
  nor_172_cse <= NOT((fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(0))));
  or_410_cse <= (fsm_output(4)) OR (fsm_output(8));
  nor_177_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_121_m1c <= and_dcpl_46 AND and_dcpl_49;
  modExp_result_and_rgt <= (NOT modExp_while_and_5) AND and_121_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_5 AND and_121_m1c;
  or_72_cse <= (fsm_output(1)) OR (NOT (fsm_output(7)));
  or_351_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  nor_84_cse <= NOT((NOT (fsm_output(0))) OR (fsm_output(1)) OR (NOT (fsm_output(7))));
  and_214_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_12_cse <= (NOT (fsm_output(5))) OR (fsm_output(8));
  or_270_cse <= (NOT (fsm_output(4))) OR (fsm_output(7));
  or_46_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01"));
  nor_77_cse <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)));
  mux_288_cse <= MUX_s_1_2_2(or_tmp_261, or_tmp_262, fsm_output(0));
  and_170_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  or_333_cse <= (fsm_output(2)) OR (NOT (fsm_output(7)));
  nand_15_cse <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11")));
  COMP_LOOP_or_1_cse <= and_dcpl_47 OR and_dcpl_62 OR and_dcpl_70 OR and_dcpl_77;
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  or_356_cse <= (NOT (fsm_output(1))) OR (fsm_output(7));
  COMP_LOOP_1_acc_5_mut_mx0w5 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_2_lpi_4_dfm)
      + SIGNED(modExp_base_1_sva_mx1), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z(63
      DOWNTO 1)), (tmp_2_lpi_4_dfm(63 DOWNTO 1)), and_dcpl_113);
  modulo_qr_sva_1_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_result_rem_cmp_z)
      + UNSIGNED(p_sva), 64));
  modExp_base_1_sva_mx1 <= MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
      modulo_result_rem_cmp_z(63));
  mux_23_cse <= MUX_s_1_2_2(nor_177_cse, nor_tmp_8, fsm_output(2));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 2)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0),
      7), 10), 10));
  modExp_while_and_3 <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
  modExp_while_and_5 <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
  and_dcpl <= (fsm_output(5)) AND (NOT (fsm_output(8)));
  and_211_cse <= (fsm_output(7)) AND (fsm_output(2));
  nor_tmp_8 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_43 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  or_tmp_47 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  not_tmp_50 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_69 <= (CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))) OR
      (fsm_output(7));
  nor_118_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000")));
  or_92_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR or_tmp_69;
  mux_96_nl <= MUX_s_1_2_2(or_388_cse, or_92_nl, fsm_output(5));
  mux_97_itm <= MUX_s_1_2_2(nor_118_nl, mux_96_nl, fsm_output(8));
  and_dcpl_25 <= NOT((fsm_output(5)) OR (fsm_output(8)));
  and_dcpl_27 <= nor_177_cse AND and_dcpl_25;
  and_dcpl_28 <= NOT((fsm_output(0)) OR (fsm_output(6)));
  and_dcpl_29 <= NOT((fsm_output(7)) OR (fsm_output(1)));
  and_dcpl_30 <= and_dcpl_29 AND (NOT (fsm_output(2)));
  and_dcpl_31 <= and_dcpl_30 AND and_dcpl_28;
  and_dcpl_34 <= nor_177_cse AND (fsm_output(5)) AND (fsm_output(8));
  and_dcpl_35 <= (NOT (fsm_output(7))) AND (fsm_output(1));
  and_dcpl_36 <= and_dcpl_35 AND (fsm_output(2));
  and_dcpl_37 <= and_dcpl_36 AND and_dcpl_28;
  and_dcpl_40 <= nor_177_cse AND and_dcpl;
  and_dcpl_41 <= and_dcpl_31 AND and_dcpl_40;
  and_dcpl_43 <= nor_tmp_8 AND and_dcpl;
  and_dcpl_44 <= (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_dcpl_45 <= and_dcpl_35 AND (NOT (fsm_output(2)));
  and_dcpl_46 <= and_dcpl_45 AND and_dcpl_44;
  and_dcpl_47 <= and_dcpl_46 AND and_dcpl_43;
  and_dcpl_49 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_25;
  and_dcpl_50 <= (NOT (fsm_output(0))) AND (fsm_output(6));
  and_dcpl_51 <= and_dcpl_29 AND (fsm_output(2));
  and_dcpl_52 <= and_dcpl_51 AND and_dcpl_50;
  mux_tmp_99 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(1));
  nor_116_nl <= NOT((fsm_output(0)) OR (NOT mux_tmp_99));
  mux_100_nl <= MUX_s_1_2_2(nor_84_cse, nor_116_nl, fsm_output(6));
  nor_117_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(1)))
      OR (fsm_output(7)));
  not_tmp_73 <= MUX_s_1_2_2(mux_100_nl, nor_117_nl, fsm_output(8));
  and_dcpl_58 <= NOT((fsm_output(3)) OR (fsm_output(8)));
  and_dcpl_62 <= and_dcpl_52 AND and_dcpl_43;
  and_dcpl_67 <= (fsm_output(7)) AND (NOT (fsm_output(1)));
  and_dcpl_70 <= and_dcpl_67 AND (fsm_output(2)) AND and_dcpl_44 AND and_dcpl_43;
  and_dcpl_74 <= (fsm_output(7)) AND (fsm_output(1));
  and_dcpl_75 <= and_dcpl_74 AND (fsm_output(2));
  and_dcpl_77 <= and_dcpl_75 AND and_dcpl_50 AND and_dcpl_43;
  or_307_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_106 <= MUX_s_1_2_2(or_307_nl, or_tmp_47, fsm_output(1));
  and_dcpl_83 <= nor_177_cse AND (fsm_output(5));
  and_dcpl_86 <= and_dcpl_36 AND and_dcpl_44;
  and_dcpl_87 <= and_dcpl_86 AND and_dcpl_27;
  or_tmp_135 <= (fsm_output(3)) OR (fsm_output(6)) OR or_tmp_69;
  and_tmp_7 <= (fsm_output(2)) AND mux_tmp_99;
  or_tmp_142 <= (fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  mux_tmp_139 <= MUX_s_1_2_2((fsm_output(7)), or_tmp_142, fsm_output(6));
  or_tmp_143 <= NOT((fsm_output(0)) AND (fsm_output(2)) AND (fsm_output(1)) AND (NOT
      (fsm_output(7))));
  or_tmp_144 <= (CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))) OR
      (fsm_output(7));
  mux_tmp_141 <= MUX_s_1_2_2(or_tmp_144, or_tmp_143, fsm_output(6));
  or_tmp_149 <= (fsm_output(2)) OR and_dcpl_35;
  and_tmp_8 <= (fsm_output(2)) AND or_72_cse;
  mux_tmp_145 <= MUX_s_1_2_2(and_tmp_8, or_tmp_149, nor_171_cse);
  or_tmp_154 <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT
      (fsm_output(7)));
  or_tmp_156 <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7));
  or_5_nl <= (fsm_output(7)) OR (fsm_output(2));
  mux_tmp_151 <= MUX_s_1_2_2(or_5_nl, or_tmp_156, fsm_output(0));
  or_tmp_159 <= (fsm_output(6)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(2)))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  and_dcpl_88 <= and_dcpl_45 AND and_dcpl_28;
  and_dcpl_89 <= and_dcpl_88 AND and_dcpl_40;
  and_dcpl_91 <= and_tmp_7 AND xor_dcpl AND and_dcpl_43;
  and_dcpl_95 <= not_tmp_73 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("0010"));
  mux_tmp_164 <= MUX_s_1_2_2(or_356_cse, or_72_cse, fsm_output(2));
  nand_tmp_10 <= NOT((fsm_output(0)) AND (NOT mux_tmp_164));
  or_tmp_162 <= (fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(1)) OR (NOT
      (fsm_output(7)));
  mux_tmp_165 <= MUX_s_1_2_2(or_tmp_162, nand_tmp_10, fsm_output(6));
  and_dcpl_96 <= (NOT mux_tmp_165) AND and_dcpl_40;
  and_dcpl_99 <= ((fsm_output(1)) XOR (fsm_output(2))) AND not_tmp_50 AND and_dcpl_27;
  or_191_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR or_tmp_144;
  mux_tmp_166 <= MUX_s_1_2_2(or_388_cse, or_191_nl, fsm_output(5));
  and_dcpl_100 <= and_dcpl_30 AND and_dcpl_44;
  nor_90_nl <= NOT((fsm_output(3)) OR (fsm_output(0)));
  and_182_nl <= (fsm_output(3)) AND (fsm_output(0));
  mux_168_nl <= MUX_s_1_2_2(nor_90_nl, and_182_nl, fsm_output(4));
  and_dcpl_105 <= mux_168_nl AND and_dcpl_35 AND (fsm_output(2)) AND (NOT (fsm_output(6)))
      AND and_dcpl_25;
  or_tmp_174 <= (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  mux_tmp_172 <= MUX_s_1_2_2(and_tmp_8, or_tmp_149, or_425_cse);
  mux_tmp_173 <= MUX_s_1_2_2(or_tmp_142, or_tmp_154, fsm_output(6));
  and_dcpl_113 <= and_dcpl_86 AND nor_tmp_8 AND and_dcpl_25;
  or_tmp_192 <= (fsm_output(0)) OR mux_tmp_164;
  or_223_nl <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT mux_tmp_99);
  mux_197_nl <= MUX_s_1_2_2(or_223_nl, or_tmp_192, fsm_output(6));
  and_dcpl_120 <= (NOT mux_197_nl) AND and_dcpl_40;
  and_178_nl <= (fsm_output(3)) AND (fsm_output(6)) AND (fsm_output(0)) AND (fsm_output(2))
      AND (fsm_output(1)) AND (NOT (fsm_output(7)));
  nor_79_nl <= NOT((fsm_output(3)) OR mux_tmp_173);
  not_tmp_136 <= MUX_s_1_2_2(and_178_nl, nor_79_nl, fsm_output(4));
  or_tmp_214 <= (fsm_output(6)) OR or_tmp_69;
  or_tmp_218 <= (VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(0))) OR (fsm_output(2))
      OR (NOT mux_tmp_99);
  or_tmp_220 <= NOT((VEC_LOOP_j_sva_11_0(0)) AND (fsm_output(0)) AND (NOT (fsm_output(2)))
      AND mux_tmp_99);
  or_251_nl <= (fsm_output(6)) OR (fsm_output(0)) OR (NOT (fsm_output(2))) OR (NOT
      (fsm_output(1))) OR (fsm_output(7));
  mux_223_nl <= MUX_s_1_2_2(or_251_nl, mux_tmp_165, fsm_output(4));
  and_dcpl_133 <= (NOT mux_223_nl) AND (fsm_output(3)) AND (fsm_output(5)) AND (NOT
      (fsm_output(8)));
  or_tmp_226 <= NOT((fsm_output(1)) AND (fsm_output(0)) AND (NOT (fsm_output(7)))
      AND (fsm_output(4)));
  or_tmp_229 <= (fsm_output(7)) OR (fsm_output(4));
  and_tmp_10 <= (fsm_output(4)) AND (CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  mux_tmp_241 <= MUX_s_1_2_2(mux_tmp_43, and_170_cse, fsm_output(4));
  or_tmp_237 <= (fsm_output(5)) OR mux_tmp_241;
  or_268_nl <= (fsm_output(4)) OR (NOT and_170_cse);
  mux_tmp_247 <= MUX_s_1_2_2(and_170_cse, or_268_nl, fsm_output(5));
  mux_248_nl <= MUX_s_1_2_2(and_170_cse, mux_tmp_43, fsm_output(4));
  or_269_nl <= (fsm_output(4)) OR mux_tmp_43;
  mux_tmp_249 <= MUX_s_1_2_2(mux_248_nl, or_269_nl, fsm_output(5));
  mux_tmp_259 <= MUX_s_1_2_2((fsm_output(3)), (fsm_output(4)), fsm_output(2));
  or_281_nl <= (NOT((NOT (fsm_output(2))) OR modExp_exp_1_0_1_sva)) OR CONV_SL_1_1(fsm_output(4
      DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_41_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_264 <= MUX_s_1_2_2(or_281_nl, or_41_nl, fsm_output(1));
  nor_tmp_51 <= (CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))) AND
      (fsm_output(4));
  mux_tmp_267 <= MUX_s_1_2_2(mux_tmp_259, nor_tmp_51, fsm_output(1));
  or_tmp_261 <= (NOT (fsm_output(2))) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  or_tmp_262 <= (fsm_output(2)) OR (NOT (fsm_output(1))) OR (fsm_output(7));
  and_dcpl_148 <= and_dcpl_100 AND and_dcpl_40;
  mux_325_nl <= MUX_s_1_2_2((fsm_output(2)), or_tmp_149, fsm_output(0));
  mux_313_nl <= MUX_s_1_2_2(and_tmp_8, or_tmp_149, fsm_output(0));
  mux_tmp_326 <= MUX_s_1_2_2(mux_325_nl, mux_313_nl, fsm_output(6));
  not_tmp_190 <= NOT((fsm_output(3)) OR mux_tmp_326);
  and_160_nl <= (fsm_output(3)) AND mux_tmp_326;
  mux_327_nl <= MUX_s_1_2_2(not_tmp_190, and_160_nl, fsm_output(4));
  and_dcpl_149 <= (NOT mux_327_nl) AND and_dcpl;
  or_338_nl <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT and_dcpl_74);
  mux_328_nl <= MUX_s_1_2_2(or_338_nl, or_tmp_192, fsm_output(6));
  and_dcpl_150 <= (NOT mux_328_nl) AND and_dcpl_40;
  nor_58_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  and_168_nl <= (fsm_output(3)) AND (NOT mux_tmp_165);
  mux_329_nl <= MUX_s_1_2_2(nor_58_nl, and_168_nl, fsm_output(4));
  and_dcpl_152 <= mux_329_nl AND and_dcpl;
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_37 AND and_dcpl_34;
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_51 AND and_dcpl_44 AND and_dcpl_34;
  nor_88_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000"))
      OR or_tmp_69);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_88_nl, mux_tmp_166, fsm_output(8));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  xor_dcpl <= NOT((fsm_output(0)) XOR (fsm_output(6)));
  and_215_nl <= (fsm_output(2)) AND (fsm_output(0));
  nor_86_nl <= NOT((fsm_output(0)) OR (fsm_output(2)));
  mux_196_nl <= MUX_s_1_2_2(and_215_nl, nor_86_nl, fsm_output(5));
  and_129_m1c <= mux_196_nl AND and_dcpl_35 AND (NOT (fsm_output(6))) AND (fsm_output(3))
      AND (fsm_output(4)) AND (NOT (fsm_output(8)));
  and_60_ssc <= and_dcpl_52 AND and_dcpl_49;
  and_64_ssc <= not_tmp_73 AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1000"));
  nor_113_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT and_211_cse));
  nor_114_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR
      (fsm_output(7)));
  mux_102_nl <= MUX_s_1_2_2(nor_113_nl, nor_114_nl, fsm_output(5));
  and_68_ssc <= mux_102_nl AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_58;
  and_190_nl <= (fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(2));
  nor_112_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(2)));
  mux_103_nl <= MUX_s_1_2_2(and_190_nl, nor_112_nl, fsm_output(5));
  and_73_ssc <= mux_103_nl AND (fsm_output(7)) AND (fsm_output(1)) AND (NOT (fsm_output(0)))
      AND and_dcpl_58;
  nor_110_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (NOT (fsm_output(6)))
      OR (fsm_output(2)) OR (NOT (fsm_output(7))));
  nor_111_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (fsm_output(6)) OR
      (NOT (fsm_output(2))) OR (fsm_output(7)));
  mux_104_nl <= MUX_s_1_2_2(nor_110_nl, nor_111_nl, fsm_output(8));
  and_80_ssc <= mux_104_nl AND (fsm_output(1)) AND (fsm_output(0)) AND (NOT (fsm_output(3)));
  COMP_LOOP_mux1h_3_rmff <= MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_1(12
      DOWNTO 3)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      2)), (COMP_LOOP_acc_1_cse_2_sva(11 DOWNTO 2)), (COMP_LOOP_acc_11_psp_sva(10
      DOWNTO 1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 2)), STD_LOGIC_VECTOR'( and_dcpl_41
      & COMP_LOOP_or_1_cse & and_60_ssc & and_64_ssc & and_68_ssc & and_73_ssc &
      and_80_ssc));
  COMP_LOOP_or_5_nl <= and_dcpl_41 OR and_60_ssc;
  COMP_LOOP_mux1h_40_rmff <= MUX1HOT_s_1_6_2((VEC_LOOP_j_sva_11_0(1)), (z_out_1(2)),
      (COMP_LOOP_acc_10_cse_12_1_1_sva(1)), (COMP_LOOP_acc_1_cse_2_sva(1)), (COMP_LOOP_acc_11_psp_sva(0)),
      (COMP_LOOP_acc_1_cse_sva(1)), STD_LOGIC_VECTOR'( COMP_LOOP_or_5_nl & COMP_LOOP_or_1_cse
      & and_64_ssc & and_68_ssc & and_73_ssc & and_80_ssc));
  vec_rsc_0_0_i_adra_d <= COMP_LOOP_mux1h_3_rmff & COMP_LOOP_mux1h_40_rmff;
  vec_rsc_0_0_i_da_d_pff <= modExp_base_1_sva_mx1;
  nand_3_nl <= NOT((fsm_output(6)) AND (NOT mux_tmp_106));
  or_124_nl <= (fsm_output(6)) OR mux_108_cse;
  mux_109_nl <= MUX_s_1_2_2(nand_3_nl, or_124_nl, fsm_output(0));
  or_362_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      OR mux_109_nl;
  or_120_nl <= (NOT (fsm_output(6))) OR (VEC_LOOP_j_sva_11_0(0)) OR mux_tmp_106;
  or_115_nl <= (NOT (fsm_output(7))) OR (COMP_LOOP_acc_1_cse_2_sva(0)) OR (fsm_output(8));
  or_114_nl <= (fsm_output(7)) OR (COMP_LOOP_acc_1_cse_sva(0)) OR (NOT (fsm_output(8)));
  mux_105_nl <= MUX_s_1_2_2(or_115_nl, or_114_nl, fsm_output(1));
  or_116_nl <= (fsm_output(6)) OR mux_105_nl;
  mux_107_nl <= MUX_s_1_2_2(or_120_nl, or_116_nl, fsm_output(0));
  or_363_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")) OR mux_107_nl;
  mux_110_nl <= MUX_s_1_2_2(or_362_nl, or_363_nl, fsm_output(2));
  vec_rsc_0_0_i_wea_d_pff <= NOT(mux_110_nl OR (fsm_output(3)));
  or_138_nl <= (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_137_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (COMP_LOOP_acc_1_cse_2_sva(0))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_115_nl <= MUX_s_1_2_2(or_138_nl, or_137_nl, fsm_output(0));
  or_135_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (VEC_LOOP_j_sva_11_0(0))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  or_134_nl <= (NOT modExp_exp_1_0_1_sva) OR (COMP_LOOP_acc_1_cse_sva(0)) OR nand_15_cse;
  mux_114_nl <= MUX_s_1_2_2(or_135_nl, or_134_nl, fsm_output(0));
  mux_116_nl <= MUX_s_1_2_2(mux_115_nl, mux_114_nl, fsm_output(1));
  nor_103_nl <= NOT((fsm_output(4)) OR (fsm_output(2)) OR mux_116_nl);
  nor_104_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (z_out_1(1)) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_105_nl <= NOT((z_out_1(1)) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  nor_106_nl <= NOT((z_out_1(1)) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  mux_111_nl <= MUX_s_1_2_2(nor_105_nl, nor_106_nl, fsm_output(0));
  nor_107_nl <= NOT((fsm_output(0)) OR (z_out_1(1)) OR nand_15_cse);
  mux_112_nl <= MUX_s_1_2_2(mux_111_nl, nor_107_nl, fsm_output(1));
  mux_113_nl <= MUX_s_1_2_2(nor_104_nl, mux_112_nl, fsm_output(2));
  and_189_nl <= (fsm_output(4)) AND mux_113_nl;
  mux_117_nl <= MUX_s_1_2_2(nor_103_nl, and_189_nl, fsm_output(3));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_117_nl AND and_dcpl;
  vec_rsc_0_1_i_adra_d <= COMP_LOOP_mux1h_3_rmff & COMP_LOOP_mux1h_40_rmff;
  and_188_nl <= (fsm_output(6)) AND (NOT mux_tmp_106);
  nor_101_nl <= NOT((fsm_output(6)) OR mux_108_cse);
  mux_122_nl <= MUX_s_1_2_2(and_188_nl, nor_101_nl, fsm_output(0));
  nand_36_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0))))) AND mux_122_nl);
  nand_5_nl <= NOT((fsm_output(6)) AND (VEC_LOOP_j_sva_11_0(0)) AND (NOT mux_tmp_106));
  or_142_nl <= (NOT (fsm_output(7))) OR (NOT (COMP_LOOP_acc_1_cse_2_sva(0))) OR (fsm_output(8));
  or_141_nl <= (fsm_output(7)) OR (NOT((COMP_LOOP_acc_1_cse_sva(0)) AND (fsm_output(8))));
  mux_118_nl <= MUX_s_1_2_2(or_142_nl, or_141_nl, fsm_output(1));
  or_143_nl <= (fsm_output(6)) OR mux_118_nl;
  mux_120_nl <= MUX_s_1_2_2(nand_5_nl, or_143_nl, fsm_output(0));
  or_361_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")) OR mux_120_nl;
  mux_123_nl <= MUX_s_1_2_2(nand_36_nl, or_361_nl, fsm_output(2));
  vec_rsc_0_1_i_wea_d_pff <= NOT(mux_123_nl OR (fsm_output(3)));
  or_159_nl <= (NOT (VEC_LOOP_j_sva_11_0(0))) OR CONV_SL_1_1(fsm_output(7 DOWNTO
      6)/=STD_LOGIC_VECTOR'("00"));
  nand_35_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm AND (COMP_LOOP_acc_1_cse_2_sva(0))
      AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01")));
  mux_128_nl <= MUX_s_1_2_2(or_159_nl, nand_35_nl, fsm_output(0));
  nand_20_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm AND (VEC_LOOP_j_sva_11_0(0))
      AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10")));
  nand_21_nl <= NOT(modExp_exp_1_0_1_sva AND (COMP_LOOP_acc_1_cse_sva(0)) AND CONV_SL_1_1(fsm_output(7
      DOWNTO 6)=STD_LOGIC_VECTOR'("11")));
  mux_127_nl <= MUX_s_1_2_2(nand_20_nl, nand_21_nl, fsm_output(0));
  mux_129_nl <= MUX_s_1_2_2(mux_128_nl, mux_127_nl, fsm_output(1));
  nor_96_nl <= NOT((fsm_output(4)) OR (fsm_output(2)) OR mux_129_nl);
  nor_97_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR
      (NOT (z_out_1(1))) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_98_nl <= NOT((NOT (z_out_1(1))) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  nor_99_nl <= NOT((NOT (z_out_1(1))) OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  mux_124_nl <= MUX_s_1_2_2(nor_98_nl, nor_99_nl, fsm_output(0));
  nor_100_nl <= NOT((fsm_output(0)) OR (NOT((z_out_1(1)) AND CONV_SL_1_1(fsm_output(7
      DOWNTO 6)=STD_LOGIC_VECTOR'("11")))));
  mux_125_nl <= MUX_s_1_2_2(mux_124_nl, nor_100_nl, fsm_output(1));
  mux_126_nl <= MUX_s_1_2_2(nor_97_nl, mux_125_nl, fsm_output(2));
  and_186_nl <= (fsm_output(4)) AND mux_126_nl;
  mux_130_nl <= MUX_s_1_2_2(nor_96_nl, and_186_nl, fsm_output(3));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_130_nl AND and_dcpl;
  and_dcpl_168 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("000000001")));
  and_dcpl_178 <= and_dcpl AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_183 <= (fsm_output(1)) AND (NOT (fsm_output(7))) AND (NOT (fsm_output(2)))
      AND and_dcpl_44 AND and_dcpl_178;
  and_dcpl_187 <= and_dcpl_51 AND and_dcpl_50 AND and_dcpl_178;
  and_dcpl_191 <= (NOT (fsm_output(1))) AND (fsm_output(7)) AND (fsm_output(2)) AND
      and_dcpl_44 AND and_dcpl_178;
  and_259_cse <= (fsm_output(1)) AND (fsm_output(7)) AND (fsm_output(2)) AND and_dcpl_50
      AND and_dcpl_178;
  and_dcpl_199 <= and_dcpl_51 AND and_dcpl_44 AND (fsm_output(8)) AND (fsm_output(5))
      AND nor_177_cse;
  and_271_cse <= and_dcpl_29 AND (NOT (fsm_output(2))) AND and_dcpl_28 AND and_dcpl
      AND nor_177_cse;
  and_dcpl_214 <= and_dcpl_35 AND (NOT (fsm_output(2))) AND and_dcpl_44 AND and_dcpl_178;
  and_dcpl_218 <= and_dcpl_29 AND (fsm_output(2)) AND and_dcpl_50 AND and_dcpl_178;
  and_dcpl_220 <= (NOT (fsm_output(8))) AND (NOT (fsm_output(5))) AND nor_177_cse;
  and_dcpl_223 <= and_dcpl_36 AND and_dcpl_44 AND and_dcpl_220;
  and_dcpl_229 <= and_dcpl_36 AND and_dcpl_28 AND and_dcpl_220;
  and_dcpl_232 <= (NOT (fsm_output(8))) AND (fsm_output(5)) AND (fsm_output(3)) AND
      (fsm_output(4));
  and_dcpl_259 <= (NOT (fsm_output(7))) AND (fsm_output(1)) AND (NOT (fsm_output(2)))
      AND and_dcpl_28 AND (NOT (fsm_output(8))) AND (fsm_output(5)) AND nor_177_cse;
  and_dcpl_271 <= (NOT((fsm_output(1)) XOR (fsm_output(7)))) AND (fsm_output(2));
  and_dcpl_273 <= and_dcpl_271 AND xor_dcpl AND and_dcpl AND CONV_SL_1_1(fsm_output(4
      DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_or_ssc <= and_dcpl_223 OR and_259_cse OR and_dcpl_229;
  or_tmp_321 <= (fsm_output(2)) OR (NOT (fsm_output(8)));
  or_tmp_323 <= (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(8));
  or_tmp_324 <= ((fsm_output(4)) AND (fsm_output(2))) OR (fsm_output(8));
  or_tmp_332 <= NOT((fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(4))
      AND (NOT (fsm_output(8))));
  nand_54_nl <= NOT((fsm_output(5)) AND modExp_exp_1_0_1_sva AND (fsm_output(2))
      AND (fsm_output(3)) AND (fsm_output(4)) AND (NOT (fsm_output(8))));
  mux_tmp_361 <= MUX_s_1_2_2(nand_54_nl, or_tmp_332, fsm_output(1));
  or_406_nl <= (fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(8));
  or_405_nl <= (NOT modExp_exp_1_0_1_sva) OR (NOT (fsm_output(2))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (fsm_output(8));
  mux_tmp_364 <= MUX_s_1_2_2(or_406_nl, or_405_nl, fsm_output(5));
  or_408_nl <= (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4))
      OR (fsm_output(8));
  mux_tmp_366 <= MUX_s_1_2_2(mux_tmp_364, or_408_nl, fsm_output(1));
  COMP_LOOP_or_16_itm <= and_dcpl_214 OR and_dcpl_218;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_97_itm = '1' ) THEN
        p_sva <= p_rsci_idat;
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_31 AND and_dcpl_27) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
          THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= '0';
        modExp_exp_1_0_1_sva <= '0';
        modExp_exp_1_0_1_sva_1 <= '0';
        modExp_exp_1_7_1_sva <= '0';
        modExp_exp_1_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_37 AND and_dcpl_83 AND (fsm_output(8))
            AND (NOT STAGE_LOOP_acc_itm_2_1);
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_13_nl AND (NOT(mux_tmp_99 AND (NOT
            (fsm_output(2))) AND and_dcpl_44 AND and_dcpl_40))) OR mux_258_nl OR
            (fsm_output(8));
        modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_24_nl AND (NOT(mux_312_nl AND (NOT
            (fsm_output(7))) AND (NOT (fsm_output(2))) AND and_dcpl_40))) OR mux_324_nl
            OR or_12_cse;
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_20_nl AND (NOT((NOT mux_tmp_165)
            AND and_dcpl_43));
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_37_nl AND (NOT(and_dcpl_88 AND and_dcpl_43));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_4_2(z_out_5, operator_64_false_acc_mut_63_0,
          COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_acc_5_mut_mx0w5, STD_LOGIC_VECTOR'(
          modulo_result_or_nl & mux_150_nl & mux_163_nl & and_dcpl_95));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out, (operator_64_false_acc_mut_64
          & operator_64_false_acc_mut_63_0), and_dcpl_99);
      operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_99);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_91_nl, mux_tmp_166, fsm_output(8))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_362_nl = '0' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_380_nl = '0' ) THEN
        operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt(63 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (and_dcpl_105 OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
        VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"), (z_out_1(11
            DOWNTO 0)), VEC_LOOP_j_sva_11_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_2_sva_6_0 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (mux_383_nl AND (fsm_output(2))) = '1' ) THEN
        COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_2(6
            DOWNTO 0)), or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_while_and_3 OR modExp_while_and_5 OR modExp_result_sva_mx0c0
          OR (NOT mux_195_nl)) AND (modExp_result_sva_mx0c0 OR modExp_result_and_rgt
          OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, STD_LOGIC_VECTOR'( modExp_result_sva_mx0c0
            & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_206_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        modExp_base_1_sva <= MUX1HOT_v_64_4_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
            modExp_result_sva, STD_LOGIC_VECTOR'( and_124_nl & r_or_nl & r_or_1_nl
            & and_dcpl_120));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_2_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_213_nl, or_240_nl, fsm_output(8))) = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX1HOT_v_64_3_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, STD_LOGIC_VECTOR'( and_dcpl_105
            & and_136_nl & and_137_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_87 OR and_dcpl_89 OR and_dcpl_77) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_2(63))),
            (NOT z_out_4_8), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'( and_dcpl_87
            & and_dcpl_89 & and_dcpl_77));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(mux_290_nl OR (fsm_output(4)) OR (fsm_output(8)))) OR and_dcpl_95)
          = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out_5, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(COMP_LOOP_1_acc_8_nl),
            64)), and_dcpl_95);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_156 OR (fsm_output(0)) OR (fsm_output(6)) OR or_80_cse OR
          or_12_cse)) = '1' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (mux_302_nl OR (fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= z_out(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_308_nl OR (fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_11_psp_sva <= z_out_2(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( mux_311_nl = '0' ) THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0)
            + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0 & STD_LOGIC_VECTOR'(
            "11")), 9), 12), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
      ELSIF ( and_dcpl_149 = '0' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(4)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(5)), STD_LOGIC_VECTOR'( and_dcpl_148 & and_dcpl_152
            & and_dcpl_150));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_5_1_sva <= '0';
      ELSIF ( and_dcpl_149 = '0' ) THEN
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(3)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(4)), STD_LOGIC_VECTOR'( and_dcpl_148 & and_dcpl_152
            & and_dcpl_150));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_4_1_sva <= '0';
      ELSIF ( and_dcpl_149 = '0' ) THEN
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(2)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(3)), STD_LOGIC_VECTOR'( and_dcpl_148 & and_dcpl_152
            & and_dcpl_150));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_3_1_sva <= '0';
      ELSIF ( and_dcpl_149 = '0' ) THEN
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(1)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(2)), STD_LOGIC_VECTOR'( and_dcpl_148 & and_dcpl_152
            & and_dcpl_150));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( and_dcpl_149 = '0' ) THEN
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(0)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(1)), STD_LOGIC_VECTOR'( and_dcpl_148 & and_dcpl_152
            & and_dcpl_150));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_1_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_1(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_47 OR and_dcpl_96 OR and_dcpl_62) = '1' ) THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_2(9)), z_out_4_8,
            and_dcpl_96);
      END IF;
    END IF;
  END PROCESS;
  modulo_result_or_nl <= and_dcpl_87 OR and_dcpl_89 OR and_dcpl_91 OR and_dcpl_96;
  or_179_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (NOT mux_tmp_99);
  mux_146_nl <= MUX_s_1_2_2(or_tmp_154, or_179_nl, fsm_output(6));
  mux_147_nl <= MUX_s_1_2_2(or_388_cse, mux_146_nl, fsm_output(3));
  nor_93_nl <= NOT((fsm_output(3)) OR mux_tmp_145);
  mux_148_nl <= MUX_s_1_2_2(mux_147_nl, nor_93_nl, fsm_output(4));
  or_174_nl <= (NOT (fsm_output(2))) OR (fsm_output(7));
  or_173_nl <= (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(7));
  mux_142_nl <= MUX_s_1_2_2(or_174_nl, or_173_nl, fsm_output(0));
  or_175_nl <= (fsm_output(6)) OR mux_142_nl;
  mux_143_nl <= MUX_s_1_2_2(or_175_nl, mux_tmp_141, fsm_output(3));
  mux_136_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_356_cse, fsm_output(2));
  mux_135_nl <= MUX_s_1_2_2((fsm_output(7)), or_72_cse, fsm_output(2));
  mux_137_nl <= MUX_s_1_2_2(mux_136_nl, (NOT mux_135_nl), fsm_output(0));
  mux_133_nl <= MUX_s_1_2_2(and_dcpl_35, or_356_cse, fsm_output(2));
  mux_134_nl <= MUX_s_1_2_2(and_tmp_7, mux_133_nl, fsm_output(0));
  mux_138_nl <= MUX_s_1_2_2(mux_137_nl, mux_134_nl, fsm_output(6));
  mux_140_nl <= MUX_s_1_2_2((NOT mux_tmp_139), mux_138_nl, fsm_output(3));
  mux_144_nl <= MUX_s_1_2_2(mux_143_nl, mux_140_nl, fsm_output(4));
  mux_149_nl <= MUX_s_1_2_2(mux_148_nl, (NOT mux_144_nl), fsm_output(5));
  or_164_nl <= (fsm_output(6)) OR (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"))))
      OR (fsm_output(7));
  mux_131_nl <= MUX_s_1_2_2(or_388_cse, or_164_nl, fsm_output(3));
  mux_132_nl <= MUX_s_1_2_2(mux_131_nl, or_tmp_135, fsm_output(4));
  nor_95_nl <= NOT((fsm_output(5)) OR mux_132_nl);
  mux_150_nl <= MUX_s_1_2_2(mux_149_nl, nor_95_nl, fsm_output(8));
  mux_161_nl <= MUX_s_1_2_2(mux_tmp_145, or_tmp_159, fsm_output(3));
  and_183_nl <= (fsm_output(4)) AND mux_161_nl;
  mux_156_nl <= MUX_s_1_2_2(and_dcpl_67, and_dcpl_74, fsm_output(2));
  mux_157_nl <= MUX_s_1_2_2(mux_156_nl, and_211_cse, fsm_output(0));
  mux_155_nl <= MUX_s_1_2_2(and_dcpl_67, or_72_cse, fsm_output(2));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, mux_155_nl, fsm_output(6));
  mux_159_nl <= MUX_s_1_2_2(mux_158_nl, mux_tmp_141, fsm_output(3));
  or_187_nl <= (fsm_output(6)) OR (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_154_nl <= MUX_s_1_2_2(mux_tmp_139, or_187_nl, fsm_output(3));
  mux_160_nl <= MUX_s_1_2_2(mux_159_nl, (NOT mux_154_nl), fsm_output(4));
  mux_162_nl <= MUX_s_1_2_2(and_183_nl, mux_160_nl, fsm_output(5));
  mux_152_nl <= MUX_s_1_2_2(or_tmp_159, or_388_cse, fsm_output(3));
  and_184_nl <= (fsm_output(4)) AND (NOT mux_152_nl);
  nor_92_nl <= NOT((fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR mux_tmp_151);
  mux_153_nl <= MUX_s_1_2_2(and_184_nl, nor_92_nl, fsm_output(5));
  mux_163_nl <= MUX_s_1_2_2(mux_162_nl, mux_153_nl, fsm_output(8));
  COMP_LOOP_acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 3)))) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0),
      7), 8) + UNSIGNED'( "00000001"), 8));
  COMP_LOOP_and_3_nl <= (NOT and_dcpl_113) AND and_dcpl_105;
  nor_75_nl <= NOT(and_214_cse OR (fsm_output(7)) OR (NOT (fsm_output(4))));
  nor_76_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(0))) OR (fsm_output(7))
      OR (fsm_output(4)));
  mux_235_nl <= MUX_s_1_2_2(nor_75_nl, nor_76_nl, fsm_output(2));
  or_349_nl <= (fsm_output(2)) OR nor_77_cse OR (fsm_output(4));
  mux_236_nl <= MUX_s_1_2_2(mux_235_nl, or_349_nl, fsm_output(5));
  mux_231_nl <= MUX_s_1_2_2((fsm_output(7)), or_270_cse, fsm_output(0));
  mux_232_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), mux_231_nl, fsm_output(1));
  mux_233_nl <= MUX_s_1_2_2(or_tmp_226, mux_232_nl, fsm_output(2));
  mux_234_nl <= MUX_s_1_2_2((NOT or_tmp_229), mux_233_nl, fsm_output(5));
  mux_237_nl <= MUX_s_1_2_2(mux_236_nl, mux_234_nl, fsm_output(3));
  or_257_nl <= (NOT (fsm_output(7))) OR (fsm_output(4));
  mux_227_nl <= MUX_s_1_2_2(or_tmp_229, or_257_nl, and_214_cse);
  or_256_nl <= (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(7))) OR (fsm_output(4));
  mux_228_nl <= MUX_s_1_2_2(mux_227_nl, or_256_nl, fsm_output(2));
  mux_229_nl <= MUX_s_1_2_2((fsm_output(7)), mux_228_nl, fsm_output(5));
  mux_224_nl <= MUX_s_1_2_2(or_270_cse, (NOT (fsm_output(4))), or_351_cse);
  mux_225_nl <= MUX_s_1_2_2(or_tmp_226, mux_224_nl, fsm_output(2));
  mux_226_nl <= MUX_s_1_2_2((fsm_output(7)), mux_225_nl, fsm_output(5));
  mux_230_nl <= MUX_s_1_2_2(mux_229_nl, mux_226_nl, fsm_output(3));
  mux_238_nl <= MUX_s_1_2_2(mux_237_nl, mux_230_nl, fsm_output(6));
  COMP_LOOP_mux1h_13_nl <= MUX1HOT_s_1_6_2((operator_66_true_div_cmp_z(0)), (tmp_2_lpi_4_dfm(0)),
      (z_out_1(7)), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, (COMP_LOOP_acc_12_nl(7)),
      STD_LOGIC_VECTOR'( COMP_LOOP_and_3_nl & and_dcpl_113 & and_dcpl_41 & and_dcpl_133
      & mux_238_nl & and_dcpl_70));
  mux_256_nl <= MUX_s_1_2_2(mux_tmp_249, or_tmp_237, fsm_output(3));
  or_271_nl <= (fsm_output(5)) OR and_170_cse;
  mux_254_nl <= MUX_s_1_2_2(mux_tmp_247, or_271_nl, fsm_output(0));
  mux_253_nl <= MUX_s_1_2_2(mux_tmp_241, or_270_cse, fsm_output(5));
  mux_255_nl <= MUX_s_1_2_2(mux_254_nl, mux_253_nl, fsm_output(3));
  mux_257_nl <= MUX_s_1_2_2(mux_256_nl, mux_255_nl, fsm_output(2));
  mux_250_nl <= MUX_s_1_2_2(mux_tmp_249, mux_tmp_247, fsm_output(0));
  or_267_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(7));
  mux_245_nl <= MUX_s_1_2_2(mux_tmp_241, or_267_nl, fsm_output(5));
  mux_246_nl <= MUX_s_1_2_2(or_tmp_237, mux_245_nl, fsm_output(0));
  mux_251_nl <= MUX_s_1_2_2(mux_250_nl, mux_246_nl, fsm_output(3));
  mux_242_nl <= MUX_s_1_2_2((NOT mux_tmp_241), and_tmp_10, fsm_output(5));
  mux_240_nl <= MUX_s_1_2_2((NOT mux_tmp_43), and_tmp_10, fsm_output(5));
  mux_243_nl <= MUX_s_1_2_2(mux_242_nl, mux_240_nl, fsm_output(0));
  mux_244_nl <= MUX_s_1_2_2((NOT or_tmp_237), mux_243_nl, fsm_output(3));
  mux_252_nl <= MUX_s_1_2_2((NOT mux_251_nl), mux_244_nl, fsm_output(2));
  mux_258_nl <= MUX_s_1_2_2((NOT mux_257_nl), mux_252_nl, fsm_output(1));
  and_158_nl <= (NOT mux_tmp_164) AND xor_dcpl AND and_dcpl_43;
  COMP_LOOP_mux_24_nl <= MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      and_158_nl);
  nor_62_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")));
  nor_63_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")));
  mux_312_nl <= MUX_s_1_2_2(nor_62_nl, nor_63_nl, fsm_output(6));
  or_334_nl <= (fsm_output(0)) OR nand_15_cse;
  mux_321_nl <= MUX_s_1_2_2(nor_172_cse, or_334_nl, fsm_output(2));
  mux_322_nl <= MUX_s_1_2_2(mux_321_nl, or_333_cse, fsm_output(1));
  mux_323_nl <= MUX_s_1_2_2(mux_322_nl, or_388_cse, fsm_output(4));
  nor_60_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(6))
      OR (fsm_output(7)));
  and_169_nl <= ((NOT (fsm_output(0))) OR (fsm_output(6))) AND (fsm_output(7));
  mux_318_nl <= MUX_s_1_2_2(or_388_cse, and_169_nl, fsm_output(2));
  or_329_nl <= (fsm_output(2)) OR nor_172_cse;
  mux_319_nl <= MUX_s_1_2_2((NOT mux_318_nl), or_329_nl, fsm_output(1));
  mux_320_nl <= MUX_s_1_2_2(nor_60_nl, mux_319_nl, fsm_output(4));
  mux_324_nl <= MUX_s_1_2_2((NOT mux_323_nl), mux_320_nl, fsm_output(3));
  COMP_LOOP_mux1h_20_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(5)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0(6)), STD_LOGIC_VECTOR'( and_dcpl_148
      & and_dcpl_89 & and_dcpl_149 & and_dcpl_150));
  and_165_nl <= (fsm_output(3)) AND mux_tmp_172;
  mux_330_nl <= MUX_s_1_2_2(not_tmp_190, and_165_nl, fsm_output(4));
  and_166_nl <= (NOT mux_330_nl) AND and_dcpl;
  COMP_LOOP_mux1h_37_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(6)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0(0)), STD_LOGIC_VECTOR'( and_dcpl_148
      & and_dcpl_152 & and_166_nl & and_dcpl_150));
  nor_91_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  nor_181_nl <= NOT((NOT((NOT((fsm_output(0)) OR (fsm_output(4)))) OR (fsm_output(2))))
      OR (fsm_output(8)));
  mux_358_nl <= MUX_s_1_2_2(nor_181_nl, or_tmp_324, fsm_output(6));
  or_398_nl <= (or_425_cse AND (fsm_output(4)) AND (fsm_output(2))) OR (fsm_output(8));
  mux_359_nl <= MUX_s_1_2_2(mux_358_nl, or_398_nl, fsm_output(7));
  nor_184_nl <= NOT((fsm_output(2)) OR (fsm_output(8)));
  mux_355_nl <= MUX_s_1_2_2(nor_184_nl, or_tmp_321, fsm_output(4));
  or_395_nl <= (fsm_output(4)) OR (fsm_output(2)) OR (fsm_output(8));
  mux_354_nl <= MUX_s_1_2_2(or_tmp_324, or_395_nl, fsm_output(0));
  mux_356_nl <= MUX_s_1_2_2(mux_355_nl, mux_354_nl, fsm_output(6));
  mux_357_nl <= MUX_s_1_2_2(mux_356_nl, or_tmp_324, fsm_output(7));
  mux_360_nl <= MUX_s_1_2_2(mux_359_nl, mux_357_nl, fsm_output(1));
  mux_351_nl <= MUX_s_1_2_2((fsm_output(4)), or_410_cse, fsm_output(6));
  mux_349_nl <= MUX_s_1_2_2(or_tmp_323, or_410_cse, fsm_output(0));
  mux_348_nl <= MUX_s_1_2_2(or_410_cse, or_tmp_323, fsm_output(0));
  mux_350_nl <= MUX_s_1_2_2(mux_349_nl, mux_348_nl, fsm_output(6));
  mux_352_nl <= MUX_s_1_2_2(mux_351_nl, mux_350_nl, fsm_output(7));
  or_392_nl <= (fsm_output(4)) OR (NOT or_tmp_321);
  and_344_nl <= (fsm_output(4)) AND ((NOT (fsm_output(2))) OR (fsm_output(8)));
  mux_346_nl <= MUX_s_1_2_2(or_392_nl, and_344_nl, fsm_output(0));
  mux_347_nl <= MUX_s_1_2_2(mux_346_nl, or_410_cse, or_388_cse);
  mux_353_nl <= MUX_s_1_2_2(mux_352_nl, mux_347_nl, fsm_output(1));
  mux_361_nl <= MUX_s_1_2_2(mux_360_nl, mux_353_nl, fsm_output(3));
  or_387_nl <= (NOT(nor_172_cse OR (fsm_output(4)) OR (fsm_output(2)))) OR (fsm_output(8));
  or_385_nl <= (NOT(nor_171_cse OR (fsm_output(4)) OR (fsm_output(2)))) OR (fsm_output(8));
  mux_nl <= MUX_s_1_2_2((fsm_output(8)), or_385_nl, fsm_output(7));
  mux_344_nl <= MUX_s_1_2_2(or_387_nl, mux_nl, fsm_output(1));
  mux_345_nl <= MUX_s_1_2_2(mux_344_nl, (fsm_output(8)), fsm_output(3));
  mux_362_nl <= MUX_s_1_2_2(mux_361_nl, mux_345_nl, fsm_output(5));
  or_417_nl <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(8));
  nor_179_nl <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(8)));
  nor_180_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(4)) OR (fsm_output(8)));
  mux_375_nl <= MUX_s_1_2_2(nor_179_nl, nor_180_nl, fsm_output(2));
  nand_52_nl <= NOT(modExp_exp_1_0_1_sva AND mux_375_nl);
  mux_376_nl <= MUX_s_1_2_2(or_417_nl, nand_52_nl, fsm_output(5));
  mux_377_nl <= MUX_s_1_2_2(or_tmp_332, mux_376_nl, fsm_output(1));
  mux_378_nl <= MUX_s_1_2_2(mux_377_nl, mux_tmp_361, fsm_output(7));
  or_414_nl <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(8));
  or_412_nl <= (NOT (fsm_output(3))) OR (fsm_output(4)) OR (NOT (fsm_output(8)));
  or_409_nl <= (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_371_nl <= MUX_s_1_2_2(or_410_cse, or_409_nl, fsm_output(3));
  mux_372_nl <= MUX_s_1_2_2(or_412_nl, mux_371_nl, fsm_output(2));
  or_413_nl <= (fsm_output(5)) OR mux_372_nl;
  mux_373_nl <= MUX_s_1_2_2(or_414_nl, or_413_nl, fsm_output(1));
  mux_374_nl <= MUX_s_1_2_2(mux_373_nl, mux_tmp_366, fsm_output(7));
  mux_379_nl <= MUX_s_1_2_2(mux_378_nl, mux_374_nl, fsm_output(0));
  or_407_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(2))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (fsm_output(8));
  mux_367_nl <= MUX_s_1_2_2(or_407_nl, mux_tmp_364, fsm_output(1));
  mux_369_nl <= MUX_s_1_2_2(mux_tmp_366, mux_367_nl, fsm_output(7));
  or_404_nl <= (NOT (fsm_output(5))) OR (NOT modExp_exp_1_0_1_sva) OR (fsm_output(2))
      OR (NOT (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_364_nl <= MUX_s_1_2_2(or_tmp_332, or_404_nl, fsm_output(1));
  mux_365_nl <= MUX_s_1_2_2(mux_364_nl, mux_tmp_361, fsm_output(7));
  mux_370_nl <= MUX_s_1_2_2(mux_369_nl, mux_365_nl, fsm_output(0));
  mux_380_nl <= MUX_s_1_2_2(mux_379_nl, mux_370_nl, fsm_output(6));
  or_352_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (NOT (fsm_output(1)));
  nand_18_nl <= NOT((fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(1)));
  mux_187_nl <= MUX_s_1_2_2(or_352_nl, nand_18_nl, fsm_output(4));
  or_210_nl <= (fsm_output(5)) OR mux_187_nl;
  or_207_nl <= (NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(3)) OR (NOT
      (fsm_output(0))) OR (fsm_output(1));
  mux_188_nl <= MUX_s_1_2_2(or_210_nl, or_207_nl, fsm_output(8));
  or_nl <= mux_188_nl OR (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(6));
  or_423_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(0)))
      OR (fsm_output(4)) OR (fsm_output(3));
  mux_381_nl <= MUX_s_1_2_2(nor_177_cse, nor_tmp_8, fsm_output(0));
  or_422_nl <= (fsm_output(8)) OR (fsm_output(5)) OR (NOT mux_381_nl);
  mux_382_nl <= MUX_s_1_2_2(or_423_nl, or_422_nl, fsm_output(1));
  nor_176_nl <= NOT((fsm_output(7)) OR mux_382_nl);
  nor_178_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(1))) OR (fsm_output(8))
      OR (NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT nor_tmp_8));
  mux_383_nl <= MUX_s_1_2_2(nor_176_nl, nor_178_nl, fsm_output(6));
  or_218_nl <= (fsm_output(3)) OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_194_nl <= MUX_s_1_2_2(or_tmp_135, or_218_nl, fsm_output(4));
  nor_87_nl <= NOT((fsm_output(5)) OR mux_194_nl);
  mux_195_nl <= MUX_s_1_2_2(nor_87_nl, mux_tmp_166, fsm_output(8));
  and_124_nl <= and_dcpl_37 AND and_dcpl_27;
  r_or_nl <= ((NOT (modulo_result_rem_cmp_z(63))) AND and_129_m1c) OR (not_tmp_136
      AND and_dcpl AND (NOT (modulo_result_rem_cmp_z(63))));
  r_or_1_nl <= ((modulo_result_rem_cmp_z(63)) AND and_129_m1c) OR (not_tmp_136 AND
      and_dcpl AND (modulo_result_rem_cmp_z(63)));
  nor_80_nl <= NOT((fsm_output(3)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR
      (fsm_output(6)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_81_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_82_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  mux_202_nl <= MUX_s_1_2_2(nor_81_nl, nor_82_nl, fsm_output(6));
  nor_83_nl <= NOT((fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(7))));
  mux_201_nl <= MUX_s_1_2_2(nor_83_nl, nor_84_cse, fsm_output(6));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, mux_201_nl, fsm_output(2));
  and_179_nl <= or_351_cse AND (fsm_output(7));
  mux_199_nl <= MUX_s_1_2_2(and_179_nl, or_72_cse, fsm_output(6));
  mux_200_nl <= MUX_s_1_2_2(mux_199_nl, or_388_cse, fsm_output(2));
  mux_204_nl <= MUX_s_1_2_2(mux_203_nl, mux_200_nl, fsm_output(4));
  nor_85_nl <= NOT(nor_171_cse OR (fsm_output(1)) OR (NOT (fsm_output(7))));
  mux_198_nl <= MUX_s_1_2_2(or_388_cse, nor_85_nl, fsm_output(2));
  and_180_nl <= (fsm_output(4)) AND mux_198_nl;
  mux_205_nl <= MUX_s_1_2_2(mux_204_nl, and_180_nl, fsm_output(3));
  mux_206_nl <= MUX_s_1_2_2(nor_80_nl, mux_205_nl, fsm_output(5));
  mux_216_nl <= MUX_s_1_2_2(or_tmp_192, or_tmp_162, COMP_LOOP_acc_1_cse_2_sva(0));
  mux_217_nl <= MUX_s_1_2_2(or_tmp_218, mux_216_nl, fsm_output(6));
  or_245_nl <= (COMP_LOOP_acc_1_cse_2_sva(0)) OR (fsm_output(0)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_215_nl <= MUX_s_1_2_2(or_tmp_218, or_245_nl, fsm_output(6));
  mux_218_nl <= MUX_s_1_2_2(mux_217_nl, mux_215_nl, COMP_LOOP_acc_1_cse_sva(0));
  and_136_nl <= (NOT mux_218_nl) AND and_dcpl_40;
  or_250_nl <= (NOT (COMP_LOOP_acc_1_cse_2_sva(0))) OR (fsm_output(0)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_221_nl <= MUX_s_1_2_2(or_tmp_220, or_250_nl, fsm_output(6));
  mux_219_nl <= MUX_s_1_2_2(or_tmp_162, or_tmp_192, COMP_LOOP_acc_1_cse_2_sva(0));
  mux_220_nl <= MUX_s_1_2_2(or_tmp_220, mux_219_nl, fsm_output(6));
  mux_222_nl <= MUX_s_1_2_2(mux_221_nl, mux_220_nl, COMP_LOOP_acc_1_cse_sva(0));
  and_137_nl <= (NOT mux_222_nl) AND and_dcpl_40;
  and_177_nl <= (CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))) AND
      (fsm_output(7));
  mux_210_nl <= MUX_s_1_2_2(and_177_nl, or_tmp_174, fsm_output(6));
  mux_211_nl <= MUX_s_1_2_2((NOT or_tmp_214), mux_210_nl, fsm_output(3));
  mux_209_nl <= MUX_s_1_2_2(or_388_cse, or_tmp_214, fsm_output(3));
  mux_212_nl <= MUX_s_1_2_2(mux_211_nl, mux_209_nl, fsm_output(4));
  nor_78_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")) OR
      mux_tmp_172);
  mux_213_nl <= MUX_s_1_2_2(mux_212_nl, nor_78_nl, fsm_output(5));
  or_239_nl <= (fsm_output(6)) OR mux_tmp_151;
  mux_208_nl <= MUX_s_1_2_2(or_388_cse, or_239_nl, fsm_output(3));
  or_240_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR mux_208_nl;
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_2(7 DOWNTO 0))
      & STD_LOGIC_VECTOR'( "00")) + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)))) + SIGNED'( "0000000001"), 10));
  COMP_LOOP_1_acc_8_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_2_lpi_4_dfm) -
      SIGNED(modExp_base_1_sva_mx1), 64));
  or_368_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(2))
      OR (fsm_output(1)) OR (fsm_output(7));
  mux_289_nl <= MUX_s_1_2_2(mux_288_cse, nand_tmp_10, fsm_output(6));
  or_369_nl <= (fsm_output(3)) OR mux_289_nl;
  mux_290_nl <= MUX_s_1_2_2(or_368_nl, or_369_nl, fsm_output(5));
  nand_41_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))))
      AND (fsm_output(7)));
  mux_297_nl <= MUX_s_1_2_2(nand_41_nl, or_333_cse, fsm_output(0));
  mux_298_nl <= MUX_s_1_2_2(mux_297_nl, (fsm_output(7)), fsm_output(6));
  or_318_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_299_nl <= MUX_s_1_2_2(mux_298_nl, or_318_nl, fsm_output(3));
  mux_301_nl <= MUX_s_1_2_2(mux_tmp_43, mux_299_nl, fsm_output(4));
  or_317_nl <= (NOT((fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(2)) OR (fsm_output(1)))) OR (fsm_output(7));
  mux_302_nl <= MUX_s_1_2_2(mux_301_nl, or_317_nl, fsm_output(5));
  mux_305_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), and_dcpl_75, fsm_output(6));
  mux_306_nl <= MUX_s_1_2_2(mux_305_nl, mux_tmp_43, fsm_output(3));
  mux_307_nl <= MUX_s_1_2_2(not_tmp_50, mux_306_nl, fsm_output(4));
  nor_65_nl <= NOT((fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7)));
  mux_303_nl <= MUX_s_1_2_2(nor_65_nl, (fsm_output(7)), fsm_output(6));
  mux_304_nl <= MUX_s_1_2_2(mux_303_nl, and_170_cse, or_80_cse);
  mux_308_nl <= MUX_s_1_2_2(mux_307_nl, mux_304_nl, fsm_output(5));
  or_324_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(0))
      OR (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_310_nl <= MUX_s_1_2_2(or_388_cse, or_324_nl, fsm_output(5));
  mux_309_nl <= MUX_s_1_2_2(or_388_cse, or_tmp_135, fsm_output(4));
  nor_64_nl <= NOT((fsm_output(5)) OR mux_309_nl);
  mux_311_nl <= MUX_s_1_2_2(mux_310_nl, nor_64_nl, fsm_output(8));
  COMP_LOOP_mux_27_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000")
      & VEC_LOOP_j_sva_11_0), p_sva, and_dcpl_168);
  COMP_LOOP_COMP_LOOP_or_6_nl <= MUX_v_7_2_2(COMP_LOOP_k_9_2_sva_6_0, STD_LOGIC_VECTOR'("1111111"),
      and_dcpl_168);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_27_nl),
      65) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(and_dcpl_168 & COMP_LOOP_COMP_LOOP_or_6_nl
      & and_dcpl_168 & '1'), 10), 65), 65));
  operator_64_false_1_or_2_nl <= and_dcpl_183 OR and_dcpl_187 OR and_dcpl_191 OR
      and_259_cse OR and_dcpl_199;
  operator_64_false_1_mux_11_nl <= MUX_v_12_2_2((STD_LOGIC_VECTOR'( "00001") & (NOT
      COMP_LOOP_k_9_2_sva_6_0)), VEC_LOOP_j_sva_11_0, operator_64_false_1_or_2_nl);
  and_350_nl <= (NOT (fsm_output(1))) AND (fsm_output(7)) AND (fsm_output(2)) AND
      and_dcpl_44 AND and_dcpl_232;
  COMP_LOOP_mux_29_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( "10"), STD_LOGIC_VECTOR'(
      "01"), and_350_nl);
  and_351_nl <= (fsm_output(1)) AND (NOT (fsm_output(7))) AND (NOT (fsm_output(2)))
      AND and_dcpl_44 AND and_dcpl_232;
  COMP_LOOP_COMP_LOOP_nor_5_nl <= NOT(MUX_v_2_2_2(COMP_LOOP_mux_29_nl, STD_LOGIC_VECTOR'("11"),
      and_351_nl));
  and_352_nl <= (fsm_output(1)) AND (fsm_output(7)) AND (fsm_output(2)) AND and_dcpl_50
      AND and_dcpl_232;
  COMP_LOOP_COMP_LOOP_or_11_nl <= MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_5_nl, STD_LOGIC_VECTOR'("11"),
      and_352_nl);
  COMP_LOOP_acc_18_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0 & COMP_LOOP_COMP_LOOP_or_11_nl),
      9), 10), 10));
  operator_64_false_1_or_3_nl <= and_dcpl_183 OR and_dcpl_187 OR and_dcpl_191 OR
      and_259_cse;
  operator_64_false_1_mux1h_1_nl <= MUX1HOT_v_10_3_2(STD_LOGIC_VECTOR'( "0000000001"),
      STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_18_nl), 10)), STAGE_LOOP_lshift_psp_sva,
      STD_LOGIC_VECTOR'( and_271_cse & operator_64_false_1_or_3_nl & and_dcpl_199));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux_11_nl),
      13) + CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux1h_1_nl), 13), 13));
  COMP_LOOP_COMP_LOOP_or_7_nl <= (NOT(and_271_cse OR and_dcpl_214 OR and_dcpl_218
      OR and_259_cse)) OR and_dcpl_223 OR and_dcpl_229;
  COMP_LOOP_COMP_LOOP_or_8_nl <= (NOT((operator_66_true_div_cmp_z(63)) OR and_271_cse
      OR and_dcpl_214 OR and_dcpl_218 OR and_259_cse)) OR and_dcpl_223;
  COMP_LOOP_mux_28_nl <= MUX_v_52_2_2((operator_64_false_acc_mut_63_0(62 DOWNTO 11)),
      (operator_66_true_div_cmp_z(62 DOWNTO 11)), and_dcpl_229);
  COMP_LOOP_or_23_nl <= and_271_cse OR and_dcpl_214 OR and_dcpl_218 OR and_259_cse;
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl <= NOT(MUX_v_52_2_2(COMP_LOOP_mux_28_nl,
      STD_LOGIC_VECTOR'("1111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_or_23_nl));
  COMP_LOOP_mux1h_71_nl <= MUX1HOT_v_2_4_2((NOT (VEC_LOOP_j_sva_11_0(11 DOWNTO 10))),
      STD_LOGIC_VECTOR'( "10"), (operator_64_false_acc_mut_63_0(10 DOWNTO 9)), (operator_66_true_div_cmp_z(10
      DOWNTO 9)), STD_LOGIC_VECTOR'( and_271_cse & COMP_LOOP_or_16_itm & and_dcpl_223
      & and_dcpl_229));
  COMP_LOOP_COMP_LOOP_nor_4_nl <= NOT(MUX_v_2_2_2(COMP_LOOP_mux1h_71_nl, STD_LOGIC_VECTOR'("11"),
      and_259_cse));
  COMP_LOOP_mux1h_72_nl <= MUX1HOT_v_9_5_2((VEC_LOOP_j_sva_11_0(9 DOWNTO 1)), (NOT
      (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1))), (NOT (operator_64_false_acc_mut_63_0(8
      DOWNTO 0))), (STD_LOGIC_VECTOR'( "00") & COMP_LOOP_k_9_2_sva_6_0), (NOT (operator_66_true_div_cmp_z(8
      DOWNTO 0))), STD_LOGIC_VECTOR'( and_271_cse & COMP_LOOP_or_16_itm & and_dcpl_223
      & and_259_cse & and_dcpl_229));
  COMP_LOOP_or_24_nl <= (NOT(and_271_cse OR and_dcpl_223 OR and_259_cse OR and_dcpl_229))
      OR and_dcpl_214 OR and_dcpl_218;
  COMP_LOOP_COMP_LOOP_mux_2_nl <= MUX_v_7_2_2(('0' & (COMP_LOOP_k_9_2_sva_6_0(6 DOWNTO
      1))), COMP_LOOP_k_9_2_sva_6_0, COMP_LOOP_or_16_itm);
  COMP_LOOP_not_68_nl <= NOT COMP_LOOP_or_ssc;
  COMP_LOOP_and_10_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), COMP_LOOP_COMP_LOOP_mux_2_nl,
      COMP_LOOP_not_68_nl);
  COMP_LOOP_COMP_LOOP_or_9_nl <= ((COMP_LOOP_k_9_2_sva_6_0(0)) AND (NOT(and_dcpl_214
      OR COMP_LOOP_or_ssc))) OR and_dcpl_218;
  COMP_LOOP_COMP_LOOP_or_10_nl <= (NOT and_dcpl_218) OR and_271_cse OR and_dcpl_214
      OR COMP_LOOP_or_ssc;
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_7_nl
      & COMP_LOOP_COMP_LOOP_or_8_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl & COMP_LOOP_COMP_LOOP_nor_4_nl
      & COMP_LOOP_mux1h_72_nl & COMP_LOOP_or_24_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_and_10_nl
      & COMP_LOOP_COMP_LOOP_or_9_nl & COMP_LOOP_COMP_LOOP_or_10_nl & '1'), 10), 66),
      66));
  z_out_2 <= acc_2_nl(65 DOWNTO 1);
  operator_64_false_1_mux_12_nl <= MUX_s_1_2_2((NOT modExp_exp_1_7_1_sva), (NOT modExp_exp_1_1_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_13_nl <= MUX_s_1_2_2((NOT modExp_exp_1_6_1_sva), (NOT modExp_exp_1_7_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_14_nl <= MUX_s_1_2_2((NOT modExp_exp_1_5_1_sva), (NOT modExp_exp_1_6_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_15_nl <= MUX_s_1_2_2((NOT modExp_exp_1_4_1_sva), (NOT modExp_exp_1_5_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_16_nl <= MUX_s_1_2_2((NOT modExp_exp_1_3_1_sva), (NOT modExp_exp_1_4_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_17_nl <= MUX_s_1_2_2((NOT modExp_exp_1_2_1_sva), (NOT modExp_exp_1_3_1_sva),
      and_dcpl_259);
  operator_64_false_1_mux_18_nl <= MUX_s_1_2_2((NOT modExp_exp_1_1_1_sva), (NOT modExp_exp_1_2_1_sva),
      and_dcpl_259);
  operator_64_false_1_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( '1' & operator_64_false_1_mux_12_nl
      & operator_64_false_1_mux_13_nl & operator_64_false_1_mux_14_nl & operator_64_false_1_mux_15_nl
      & operator_64_false_1_mux_16_nl & operator_64_false_1_mux_17_nl & operator_64_false_1_mux_18_nl
      & (NOT modExp_exp_1_0_1_sva_1)) + UNSIGNED'( "000000001"), 9));
  z_out_4_8 <= operator_64_false_1_acc_nl(8);
  and_353_nl <= (fsm_output(1)) AND (NOT (fsm_output(7))) AND (fsm_output(2)) AND
      (fsm_output(0)) AND (NOT (fsm_output(6))) AND and_dcpl_25 AND nor_177_cse;
  or_429_nl <= (fsm_output(0)) OR (NOT and_dcpl_271);
  mux_385_nl <= MUX_s_1_2_2(mux_284_cse, or_429_nl, fsm_output(6));
  modExp_while_if_or_1_nl <= and_dcpl_273 OR ((NOT mux_385_nl) AND and_dcpl AND nor_177_cse);
  nor_190_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(1)));
  mux_390_nl <= MUX_s_1_2_2(nor_77_cse, nor_190_nl, fsm_output(2));
  nand_55_nl <= NOT((fsm_output(0)) AND mux_390_nl);
  mux_388_nl <= MUX_s_1_2_2(mux_288_cse, nand_55_nl, fsm_output(6));
  and_356_nl <= (fsm_output(5)) AND (NOT mux_388_nl);
  nor_191_nl <= NOT((fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(2))
      OR (fsm_output(7)) OR (fsm_output(1)));
  mux_387_nl <= MUX_s_1_2_2(and_356_nl, nor_191_nl, fsm_output(3));
  and_355_nl <= mux_387_nl AND (NOT((fsm_output(8)) OR (fsm_output(4))));
  modExp_while_if_mux1h_1_nl <= MUX1HOT_v_64_3_2(modExp_result_sva, operator_64_false_acc_mut_63_0,
      modExp_base_1_sva, STD_LOGIC_VECTOR'( and_353_nl & modExp_while_if_or_1_nl
      & and_355_nl));
  modExp_while_if_and_4_nl <= (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0))) AND and_dcpl_273;
  modExp_while_if_and_5_nl <= (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) AND and_dcpl_273;
  modExp_while_if_modExp_while_if_mux1h_1_nl <= MUX1HOT_v_64_3_2(modExp_base_1_sva,
      vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, STD_LOGIC_VECTOR'( (NOT and_dcpl_273)
      & modExp_while_if_and_4_nl & modExp_while_if_and_5_nl));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux1h_1_nl)
      * UNSIGNED(modExp_while_if_modExp_while_if_mux1h_1_nl)), 64));
END v13;

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

ARCHITECTURE v13 OF inPlaceNTT_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_da_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wea_d_iff : STD_LOGIC;

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
  SIGNAL vec_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
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
  SIGNAL vec_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
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
      vec_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      vec_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      vec_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_r_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  vec_rsc_0_0_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_0_i_qa,
      wea => vec_rsc_0_0_wea,
      da => vec_rsc_0_0_i_da,
      adra => vec_rsc_0_0_i_adra,
      adra_d => vec_rsc_0_0_i_adra_d_1,
      da_d => vec_rsc_0_0_i_da_d,
      qa_d => vec_rsc_0_0_i_qa_d_1,
      wea_d => vec_rsc_0_0_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_0_i_wea_d_iff
    );
  vec_rsc_0_0_i_qa <= vec_rsc_0_0_qa;
  vec_rsc_0_0_da <= vec_rsc_0_0_i_da;
  vec_rsc_0_0_adra <= vec_rsc_0_0_i_adra;
  vec_rsc_0_0_i_adra_d_1 <= vec_rsc_0_0_i_adra_d;
  vec_rsc_0_0_i_da_d <= vec_rsc_0_0_i_da_d_iff;
  vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d_1;

  vec_rsc_0_1_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    PORT MAP(
      qa => vec_rsc_0_1_i_qa,
      wea => vec_rsc_0_1_wea,
      da => vec_rsc_0_1_i_da,
      adra => vec_rsc_0_1_i_adra,
      adra_d => vec_rsc_0_1_i_adra_d_1,
      da_d => vec_rsc_0_1_i_da_d,
      qa_d => vec_rsc_0_1_i_qa_d_1,
      wea_d => vec_rsc_0_1_i_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsc_0_1_i_wea_d_iff
    );
  vec_rsc_0_1_i_qa <= vec_rsc_0_1_qa;
  vec_rsc_0_1_da <= vec_rsc_0_1_i_da;
  vec_rsc_0_1_adra <= vec_rsc_0_1_i_adra;
  vec_rsc_0_1_i_adra_d_1 <= vec_rsc_0_1_i_adra_d;
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
      vec_rsc_0_0_i_adra_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d,
      vec_rsc_0_0_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_adra_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_adra_d,
      vec_rsc_0_1_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  vec_rsc_0_0_i_adra_d <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  vec_rsc_0_1_i_adra_d <= inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_adra_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff;

END v13;



