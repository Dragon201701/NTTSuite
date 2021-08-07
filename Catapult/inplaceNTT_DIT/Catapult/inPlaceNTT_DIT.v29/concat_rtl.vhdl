
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

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Wed May 19 22:55:03 2021
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
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


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

ARCHITECTURE v29 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v29;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


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

ARCHITECTURE v29 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v29;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


ENTITY inPlaceNTT_DIT_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (47 DOWNTO 0);
    STAGE_LOOP_C_0_tr0 : IN STD_LOGIC;
    modExp_while_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_5_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v29 OF inPlaceNTT_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  TYPE inPlaceNTT_DIT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, modExp_while_C_0,
      modExp_while_C_1, modExp_while_C_2, modExp_while_C_3, modExp_while_C_4, modExp_while_C_5,
      COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0, COMP_LOOP_1_modExp_1_while_C_1,
      COMP_LOOP_1_modExp_1_while_C_2, COMP_LOOP_1_modExp_1_while_C_3, COMP_LOOP_1_modExp_1_while_C_4,
      COMP_LOOP_1_modExp_1_while_C_5, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4,
      COMP_LOOP_C_5, COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9,
      COMP_LOOP_C_10, COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_2_modExp_1_while_C_0,
      COMP_LOOP_2_modExp_1_while_C_1, COMP_LOOP_2_modExp_1_while_C_2, COMP_LOOP_2_modExp_1_while_C_3,
      COMP_LOOP_2_modExp_1_while_C_4, COMP_LOOP_2_modExp_1_while_C_5, COMP_LOOP_C_14,
      COMP_LOOP_C_15, COMP_LOOP_C_16, COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19,
      COMP_LOOP_C_20, COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24,
      VEC_LOOP_C_0, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_0_tr0, modExp_while_C_5_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_5_tr0, COMP_LOOP_C_12_tr0,
      COMP_LOOP_2_modExp_1_while_C_5_tr0, COMP_LOOP_C_24_tr0, VEC_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000010");
        IF ( STAGE_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000100");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000001000");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000010000");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000100000");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000001000000");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000010000000");
        IF ( modExp_while_C_5_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000100000000");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000001000000000");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000010000000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000100000000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000001000000000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000010000000000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000100000000000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000001000000000000000");
        IF ( COMP_LOOP_1_modExp_1_while_C_5_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000010000000000000000");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000100000000000000000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000001000000000000000000");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000010000000000000000000");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000100000000000000000000");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000001000000000000000000000");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000010000000000000000000000");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000100000000000000000000000");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000001000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000010000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000100000000000000000000000000");
        IF ( COMP_LOOP_C_12_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_13;
        END IF;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000001000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000010000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000100000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000001000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000010000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000100000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000001000000000000000000000000000000000");
        IF ( COMP_LOOP_2_modExp_1_while_C_5_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_14;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000010000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000100000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000001000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000010000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000100000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001000000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010000000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100000000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000000000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000000000000000000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000000000000000000000000000000000000000000");
        IF ( COMP_LOOP_C_24_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000000000000000000000000000000000000000000");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000000000000000000000000000000000000000000");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000000000000000000000000000000000000000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000001");
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

END v29;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


ENTITY inPlaceNTT_DIT_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    modulo_result_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    modulo_result_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
  );
END inPlaceNTT_DIT_core_wait_dp;

ARCHITECTURE v29 OF inPlaceNTT_DIT_core_wait_dp IS
  -- Default Constants

BEGIN
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_z_oreg <= modulo_result_rem_cmp_z;
    END IF;
  END PROCESS;
END v29;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


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
    modulo_result_rem_cmp_a : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    modulo_result_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    modulo_result_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v29 OF inPlaceNTT_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (47 DOWNTO 0);
  SIGNAL or_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_16 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL or_dcpl_65 : STD_LOGIC;
  SIGNAL or_dcpl_67 : STD_LOGIC;
  SIGNAL or_dcpl_70 : STD_LOGIC;
  SIGNAL or_dcpl_75 : STD_LOGIC;
  SIGNAL or_dcpl_77 : STD_LOGIC;
  SIGNAL or_tmp_41 : STD_LOGIC;
  SIGNAL or_tmp_82 : STD_LOGIC;
  SIGNAL or_tmp_89 : STD_LOGIC;
  SIGNAL or_tmp_93 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_slc_modExp_exp_0_1_itm : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL modExp_while_and_1_rgt : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_1_obj_ld_cse : STD_LOGIC;
  SIGNAL modulo_result_mux_1_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_1_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL or_tmp_129 : STD_LOGIC;
  SIGNAL or_tmp_130 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_base_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_7_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_1_sva : STD_LOGIC;
  SIGNAL modExp_1_result_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_slc_modExp_exp_63_1_itm : STD_LOGIC_VECTOR (62 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_a_mx0c1 : STD_LOGIC;
  SIGNAL modulo_result_rem_cmp_a_mx0c3 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL modExp_exp_sva_mx0w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_1_result_1_sva_mx0c0 : STD_LOGIC;
  SIGNAL modExp_1_while_and_7 : STD_LOGIC;
  SIGNAL modExp_exp_sva_mx0_63_1 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modExp_result_and_2_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_3_rgt : STD_LOGIC;
  SIGNAL or_152_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL modExp_exp_sva_rsp_1 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL STAGE_LOOP_or_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_1_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_21_cse : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL nor_24_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_while_or_nl : STD_LOGIC;
  SIGNAL modExp_while_or_1_nl : STD_LOGIC;
  SIGNAL modExp_while_or_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_42_nl : STD_LOGIC;
  SIGNAL or_171_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_13_nl : STD_LOGIC;
  SIGNAL or_203_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_34_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_if_or_3_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_if_or_4_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_2_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_3_nl : STD_LOGIC;
  SIGNAL modExp_while_if_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_56_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_57_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_58_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_59_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_60_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_62_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_63_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_67_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_69_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_70_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_71_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_72_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_73_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_74_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_75_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_76_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_77_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_78_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_79_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_80_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_81_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_82_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_83_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_84_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_85_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_86_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_87_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_88_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_89_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_90_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_91_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_92_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_93_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_94_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_95_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_96_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_97_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_98_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_99_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_100_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_101_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_102_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_103_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_104_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_105_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_106_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_107_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_108_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_109_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_45_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_57_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_22_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_64_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_or_23_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_65_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_or_24_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_67_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_109_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_110_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_46_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_68_nl : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL COMP_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_111_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_3_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_or_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_111_nl : STD_LOGIC;
  SIGNAL modulo_qelse_mux_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_qelse_modulo_qelse_or_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL r_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL STAGE_LOOP_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      modulo_result_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      modulo_result_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z_oreg : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (47 DOWNTO 0);
      STAGE_LOOP_C_0_tr0 : IN STD_LOGIC;
      modExp_while_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_12_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_5_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_24_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (47 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_12_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_5_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  PROCEDURE divmod_65_11(
    left:UNSIGNED;
    right:UNSIGNED;
    result_div:OUT UNSIGNED(64 DOWNTO 0);
    result_mod:OUT UNSIGNED(10 DOWNTO 0))
  IS
    VARIABLE left_buffer:UNSIGNED(75 DOWNTO 0);
    VARIABLE diff:UNSIGNED(11 DOWNTO 0);
  BEGIN
    left_buffer:=(OTHERS=>'0');
    left_buffer(64 DOWNTO 0):=left;
    FOR i IN 64 DOWNTO 0 LOOP
      diff:=left_buffer(75 DOWNTO 64)-UNSIGNED('0'&right);
      result_div(i):=NOT diff(11);
      IF diff(11)='0' THEN
        left_buffer(75 DOWNTO 64):=diff;
      END IF;
      left_buffer(75 DOWNTO 1):=left_buffer(74 DOWNTO 0);
    END LOOP;
    result_mod:=left_buffer(75 DOWNTO 65);
  END;

  FUNCTION rslv_65(input1:STD_LOGIC_VECTOR;input2:STD_LOGIC_VECTOR)
  RETURN STD_LOGIC_VECTOR IS
    ALIAS input1_array:STD_LOGIC_VECTOR(64 DOWNTO 0) IS input1;
    ALIAS input2_array:STD_LOGIC_VECTOR(64 DOWNTO 0) IS input2;
    VARIABLE result:STD_LOGIC_VECTOR(64 DOWNTO 0);
  BEGIN
    result:=(OTHERS=>'0');
    -- pragma translate_off
    FOR i IN 64 DOWNTO 0 LOOP
      result(i):=resolved(input1_array(i)&input2_array(i));
    END LOOP;
    -- pragma translate_on
    RETURN result;
  END;

  FUNCTION FABS_65(input_val:SIGNED(64 DOWNTO 0))
  RETURN UNSIGNED IS
  BEGIN
    CASE input_val(64) IS
    WHEN '1'
      -- pragma translate_off
      | 'H'
      -- pragma translate_on
      =>RETURN UNSIGNED'( "0")-UNSIGNED(input_val);
    WHEN '0'
      -- pragma translate_off
      | 'L'
      -- pragma translate_on
      =>RETURN UNSIGNED(input_val);
    WHEN OTHERS =>
      RETURN UNSIGNED(rslv_65(
        STD_LOGIC_VECTOR(input_val),
        STD_LOGIC_VECTOR(UNSIGNED'( "0"-UNSIGNED(input_val)))
      ));
    END CASE;
  END;

  FUNCTION rslv_11(input1:STD_LOGIC_VECTOR;input2:STD_LOGIC_VECTOR)
  RETURN STD_LOGIC_VECTOR IS
    ALIAS input1_array:STD_LOGIC_VECTOR(10 DOWNTO 0) IS input1;
    ALIAS input2_array:STD_LOGIC_VECTOR(10 DOWNTO 0) IS input2;
    VARIABLE result:STD_LOGIC_VECTOR(10 DOWNTO 0);
  BEGIN
    result:=(OTHERS=>'0');
    -- pragma translate_off
    FOR i IN 10 DOWNTO 0 LOOP
      result(i):=resolved(input1_array(i)&input2_array(i));
    END LOOP;
    -- pragma translate_on
    RETURN result;
  END;

  FUNCTION FABS_11(input_val:SIGNED(10 DOWNTO 0))
  RETURN UNSIGNED IS
  BEGIN
    CASE input_val(10) IS
    WHEN '1'
      -- pragma translate_off
      | 'H'
      -- pragma translate_on
      =>RETURN UNSIGNED'( "0")-UNSIGNED(input_val);
    WHEN '0'
      -- pragma translate_off
      | 'L'
      -- pragma translate_on
      =>RETURN UNSIGNED(input_val);
    WHEN OTHERS =>
      RETURN UNSIGNED(rslv_11(
        STD_LOGIC_VECTOR(input_val),
        STD_LOGIC_VECTOR(UNSIGNED'( "0"-UNSIGNED(input_val)))
      ));
    END CASE;
  END;

  FUNCTION FDIV_2_65_11(left:SIGNED;right:SIGNED)
  RETURN SIGNED IS
    VARIABLE result_div:UNSIGNED(64 DOWNTO 0);
    VARIABLE result_mod:UNSIGNED(10 DOWNTO 0);
    CONSTANT zeroes:UNSIGNED(64 DOWNTO 0):=(OTHERS=>'0');
  BEGIN
    divmod_65_11(FABS_65(left),FABS_11(right),result_div,result_mod);
    IF to_X01(left(64))/=to_X01(right(10)) THEN
      result_div:=zeroes-result_div;
    END IF;
    RETURN SIGNED(result_div);
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

  FUNCTION MUX1HOT_v_7_6_2(input_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
      modulo_result_rem_cmp_z => inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z,
      modulo_result_rem_cmp_z_oreg => inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z_oreg
    );
  inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z <= modulo_result_rem_cmp_z;
  modulo_result_rem_cmp_z_oreg <= inPlaceNTT_DIT_core_wait_dp_inst_modulo_result_rem_cmp_z_oreg;

  inPlaceNTT_DIT_core_core_fsm_inst : inPlaceNTT_DIT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIT_core_core_fsm_inst_fsm_output,
      STAGE_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0,
      modExp_while_C_5_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_5_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_12_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_12_tr0,
      COMP_LOOP_2_modExp_1_while_C_5_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_5_tr0,
      COMP_LOOP_C_24_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0 <= NOT (z_out_3(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_12_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_5_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  modExp_result_and_2_rgt <= (NOT modExp_while_and_1_rgt) AND (fsm_output(5));
  modExp_result_and_3_rgt <= modExp_while_and_1_rgt AND (fsm_output(5));
  STAGE_LOOP_or_cse <= (fsm_output(1)) OR (fsm_output(7));
  modulo_result_mux_1_cse <= MUX_v_64_2_2(modulo_result_rem_cmp_z_oreg, (z_out_4(63
      DOWNTO 0)), modulo_result_rem_cmp_z_oreg(63));
  or_152_rgt <= (fsm_output(9)) OR (fsm_output(27));
  modExp_result_and_rgt <= (NOT modExp_1_while_and_7) AND or_tmp_82;
  modExp_result_and_1_rgt <= modExp_1_while_and_7 AND or_tmp_82;
  COMP_LOOP_or_1_cse <= (fsm_output(16)) OR (fsm_output(34));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0),
      8), 11), 11));
  modExp_while_and_1_rgt <= (modulo_result_rem_cmp_z_oreg(63)) AND operator_64_false_slc_modExp_exp_0_1_itm;
  modExp_exp_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(FDIV_2_65_11(SIGNED(z_out_4),CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva_mx0w0),
      10), 11)), 64));
  modExp_exp_sva_mx0_63_1 <= MUX_v_63_2_2(('0' & (modExp_exp_sva_rsp_1(62 DOWNTO
      1))), (modExp_exp_sva_mx0w0(63 DOWNTO 1)), fsm_output(1));
  modExp_1_while_and_7 <= (modulo_result_rem_cmp_z_oreg(63)) AND modExp_exp_1_0_1_sva;
  or_dcpl_2 <= (NOT exit_COMP_LOOP_1_modExp_1_while_sva) OR (z_out_3(64));
  and_dcpl_4 <= NOT((fsm_output(47)) OR (fsm_output(0)));
  or_dcpl_16 <= (fsm_output(32)) OR (fsm_output(12));
  or_dcpl_29 <= (fsm_output(43)) OR (fsm_output(25));
  or_dcpl_35 <= (fsm_output(12)) OR (fsm_output(31));
  and_dcpl_94 <= NOT((fsm_output(13)) OR (fsm_output(33)));
  or_dcpl_65 <= (fsm_output(31)) OR (fsm_output(29)) OR (fsm_output(11));
  or_dcpl_67 <= (fsm_output(30)) OR (fsm_output(32));
  or_dcpl_70 <= (fsm_output(15)) OR (fsm_output(14)) OR (fsm_output(28));
  or_dcpl_75 <= or_dcpl_35 OR (fsm_output(29));
  or_dcpl_77 <= or_dcpl_70 OR or_dcpl_67;
  or_tmp_41 <= (fsm_output(38)) OR (fsm_output(20));
  or_tmp_82 <= (fsm_output(13)) OR (fsm_output(33));
  or_tmp_89 <= or_dcpl_77 OR or_dcpl_75 OR (fsm_output(11)) OR (fsm_output(13));
  or_tmp_93 <= (fsm_output(33)) OR (fsm_output(10));
  modulo_result_rem_cmp_a_mx0c1 <= (fsm_output(22)) OR (fsm_output(40)) OR (fsm_output(30))
      OR or_dcpl_35 OR (fsm_output(13)) OR (fsm_output(23)) OR (fsm_output(41)) OR
      (fsm_output(5)) OR (fsm_output(4));
  modulo_result_rem_cmp_a_mx0c3 <= (fsm_output(35)) OR (fsm_output(17));
  modExp_result_sva_mx0c0 <= (fsm_output(47)) OR (fsm_output(0)) OR (fsm_output(46))
      OR (fsm_output(1));
  modExp_1_result_1_sva_mx0c0 <= NOT((fsm_output(15)) OR (fsm_output(14)) OR (fsm_output(28))
      OR (fsm_output(30)) OR (fsm_output(32)) OR (fsm_output(12)) OR (fsm_output(31))
      OR (fsm_output(29)) OR (fsm_output(11)) OR (NOT and_dcpl_94) OR (fsm_output(34))
      OR (fsm_output(16)) OR (fsm_output(10)));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  or_114_nl <= (fsm_output(26)) OR (fsm_output(41));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_11_5_2(COMP_LOOP_acc_psp_sva_1, (z_out_1(12
      DOWNTO 2)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 1)), STD_LOGIC_VECTOR'( (fsm_output(8))
      & COMP_LOOP_or_1_cse & (fsm_output(23)) & or_dcpl_29 & or_114_nl));
  vec_rsc_0_0_i_da_d_pff <= modulo_result_mux_1_cse;
  vec_rsc_0_0_i_wea_d_pff <= ((NOT (VEC_LOOP_j_sva_11_0(0))) AND (fsm_output(23)))
      OR ((NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0))) AND or_dcpl_29) OR ((NOT (COMP_LOOP_acc_1_cse_sva(0)))
      AND (fsm_output(41)));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ((NOT (COMP_LOOP_acc_1_cse_sva(0)))
      AND COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm AND
      (fsm_output(26))) OR ((NOT (z_out_1(1))) AND (fsm_output(34))) OR ((NOT (VEC_LOOP_j_sva_11_0(0)))
      AND (fsm_output(8))) OR ((NOT (z_out_1(1))) AND (fsm_output(16)));
  vec_rsc_0_1_i_wea_d_pff <= ((VEC_LOOP_j_sva_11_0(0)) AND (fsm_output(23))) OR ((COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      AND or_dcpl_29) OR ((COMP_LOOP_acc_1_cse_sva(0)) AND (fsm_output(41)));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ((COMP_LOOP_acc_1_cse_sva(0))
      AND COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm AND
      (fsm_output(26))) OR ((z_out_1(1)) AND (fsm_output(34))) OR ((VEC_LOOP_j_sva_11_0(0))
      AND (fsm_output(8))) OR ((z_out_1(1)) AND (fsm_output(16)));
  or_tmp_129 <= (fsm_output(29)) OR (fsm_output(10));
  or_tmp_130 <= (fsm_output(28)) OR (fsm_output(11));
  COMP_LOOP_nor_1_cse <= NOT((fsm_output(16)) OR (fsm_output(34)) OR (fsm_output(45)));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( and_dcpl_4 = '0' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(0)) OR (fsm_output(46))) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            fsm_output(46));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( and_dcpl_4 = '0' ) THEN
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
        modExp_exp_1_7_1_sva <= '0';
        modExp_exp_1_0_1_sva_1 <= '0';
      ELSE
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= (NOT STAGE_LOOP_acc_itm_2_1) AND (fsm_output(46));
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux_42_nl AND (NOT (fsm_output(9)))) OR
            (NOT((fsm_output(9)) OR (fsm_output(15)) OR (fsm_output(14)) OR (fsm_output(28))
            OR (fsm_output(30)) OR (fsm_output(32)) OR (fsm_output(12)) OR (fsm_output(31))
            OR (fsm_output(29)) OR (fsm_output(11)) OR (NOT and_dcpl_94) OR (fsm_output(10))));
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_13_nl AND (NOT (fsm_output(33)));
        modExp_exp_1_0_1_sva_1 <= COMP_LOOP_mux1h_34_nl AND (NOT (fsm_output(15)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_b <= p_sva;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(28)) OR (fsm_output(2)) OR (fsm_output(10)) OR modulo_result_rem_cmp_a_mx0c1
          OR modulo_result_rem_cmp_a_mx0c3 OR or_tmp_41) = '1' ) THEN
        modulo_result_rem_cmp_a <= MUX1HOT_v_64_3_2(z_out, COMP_LOOP_1_acc_8_itm,
            z_out_1, STD_LOGIC_VECTOR'( modulo_result_or_nl & modulo_result_rem_cmp_a_mx0c1
            & or_tmp_41));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (STAGE_LOOP_or_cse OR (fsm_output(45))) = '1' ) THEN
        VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"), (z_out_1(11
            DOWNTO 0)), (fsm_output(45)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(and_dcpl_4 AND (NOT (fsm_output(46))) AND (NOT (fsm_output(1)))))
          = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_1_sva_7_0 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( ((fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(34)) OR (fsm_output(45)))
          = '1' ) THEN
        COMP_LOOP_k_9_1_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_3(7
            DOWNTO 0)), nor_24_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((operator_64_false_slc_modExp_exp_0_1_itm OR modExp_result_sva_mx0c0
          OR (NOT((NOT and_dcpl_4) OR (fsm_output(46)) OR (fsm_output(1)) OR (fsm_output(5)))))
          AND (modExp_result_sva_mx0c0 OR modExp_result_and_2_rgt OR modExp_result_and_3_rgt))
          = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z_oreg, (z_out_4(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
            modExp_result_sva_mx0c0 & modExp_result_and_2_rgt & modExp_result_and_3_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( STAGE_LOOP_or_cse = '1' ) THEN
        modExp_base_sva <= MUX_v_64_2_2(r_sva, modulo_result_mux_1_cse, fsm_output(7));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_slc_modExp_exp_0_1_itm <= '0';
      ELSIF ( (STAGE_LOOP_or_cse AND or_dcpl_2) = '1' ) THEN
        operator_64_false_slc_modExp_exp_0_1_itm <= MUX_s_1_2_2((modExp_exp_sva_rsp_1(0)),
            (modExp_exp_sva_mx0w0(0)), fsm_output(1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_2 = '1' ) THEN
        operator_64_false_slc_modExp_exp_63_1_itm <= modExp_exp_sva_mx0_63_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( ((fsm_output(34)) OR (fsm_output(2)) OR (fsm_output(10))) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_3(63))),
            (NOT (z_out_1(8))), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'(
            (fsm_output(2)) & (fsm_output(10)) & (fsm_output(34))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((fsm_output(22)) OR (fsm_output(21)) OR (fsm_output(40)) OR (fsm_output(39))
          OR (fsm_output(28)) OR (fsm_output(30)) OR or_dcpl_16 OR (fsm_output(33))
          OR (fsm_output(4)) OR (fsm_output(10)))) = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_5_2(z_out, modExp_result_sva, modulo_result_rem_cmp_z_oreg,
            (z_out_4(63 DOWNTO 0)), (z_out_3(63 DOWNTO 0)), STD_LOGIC_VECTOR'( modExp_while_or_nl
            & or_152_rgt & modExp_while_or_1_nl & modExp_while_or_2_nl & or_tmp_41));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(8)) = '1' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(28)) OR (fsm_output(8)) OR (fsm_output(16))) = '1' ) THEN
        COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= MUX1HOT_s_1_3_2((z_out_1(9)),
            (z_out_3(9)), (z_out_1(8)), STD_LOGIC_VECTOR'( (fsm_output(8)) & (fsm_output(16))
            & (fsm_output(28))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( ((fsm_output(44)) OR (fsm_output(43)) OR (fsm_output(42)) OR (fsm_output(7))
          OR (fsm_output(6)) OR (fsm_output(47)) OR (fsm_output(0)) OR (fsm_output(46))
          OR (fsm_output(8)) OR (fsm_output(1)) OR (fsm_output(45)) OR (fsm_output(41))
          OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(4)))
          = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= z_out_3(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_exp_1_0_1_sva OR modExp_1_result_1_sva_mx0c0 OR or_dcpl_70 OR
          or_dcpl_67 OR (fsm_output(12)) OR or_dcpl_65 OR (fsm_output(34)) OR (fsm_output(16))
          OR (fsm_output(10))) AND (modExp_1_result_1_sva_mx0c0 OR modExp_result_and_rgt
          OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_1_result_1_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z_oreg, (z_out_4(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
            modExp_1_result_1_sva_mx0c0 & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(5)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(6)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_5_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(4)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(5)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_4_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(3)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(4)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_3_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(2)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(3)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(1)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(2)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_1_1_sva <= '0';
      ELSIF ( or_tmp_89 = '0' ) THEN
        modExp_exp_1_1_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(0)), modExp_exp_1_2_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(1)), STD_LOGIC_VECTOR'( (fsm_output(9)) & or_tmp_93
            & (fsm_output(27))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_152_rgt = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, or_203_nl);
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
      IF (rst = '1') THEN
        modExp_exp_sva_rsp_1 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 2)/=STD_LOGIC_VECTOR'("00000"))))
          = '1' ) THEN
        modExp_exp_sva_rsp_1 <= modExp_exp_sva_mx0_63_1;
      END IF;
    END IF;
  END PROCESS;
  or_171_nl <= or_dcpl_77 OR or_dcpl_75 OR CONV_SL_1_1(fsm_output(11 DOWNTO 10)/=STD_LOGIC_VECTOR'("00"));
  COMP_LOOP_mux_42_nl <= MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva,
      or_171_nl);
  COMP_LOOP_mux1h_13_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(6)), modExp_exp_1_0_1_sva_1,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_sva_7_0(7)), STD_LOGIC_VECTOR'( (fsm_output(9))
      & (fsm_output(10)) & or_tmp_89 & (fsm_output(27))));
  or_207_nl <= (fsm_output(28)) OR (fsm_output(30)) OR or_dcpl_16 OR or_dcpl_65;
  COMP_LOOP_mux1h_34_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(7)), modExp_exp_1_1_1_sva,
      modExp_exp_1_0_1_sva_1, (COMP_LOOP_k_9_1_sva_7_0(0)), STD_LOGIC_VECTOR'( (fsm_output(9))
      & or_tmp_93 & or_207_nl & (fsm_output(27))));
  modulo_result_or_nl <= (fsm_output(2)) OR modulo_result_rem_cmp_a_mx0c3 OR (fsm_output(10))
      OR (fsm_output(28));
  nor_24_nl <= NOT(STAGE_LOOP_or_cse OR (fsm_output(45)));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_3(8 DOWNTO 0))
      & '0') + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'(
      "0000000001"), 10));
  modExp_while_or_nl <= (fsm_output(3)) OR (fsm_output(29)) OR (fsm_output(11));
  modExp_while_or_1_nl <= ((NOT (modulo_result_rem_cmp_z_oreg(63))) AND (fsm_output(15)))
      OR ((NOT (modulo_result_rem_cmp_z_oreg(63))) AND (fsm_output(31)));
  modExp_while_or_2_nl <= ((modulo_result_rem_cmp_z_oreg(63)) AND (fsm_output(15)))
      OR ((modulo_result_rem_cmp_z_oreg(63)) AND (fsm_output(31)));
  or_203_nl <= ((COMP_LOOP_acc_1_cse_sva(0)) AND (fsm_output(27))) OR ((VEC_LOOP_j_sva_11_0(0))
      AND (fsm_output(9)));
  modExp_while_if_or_3_nl <= modulo_result_rem_cmp_a_mx0c3 OR or_tmp_129;
  modExp_while_if_mux1h_2_nl <= MUX1HOT_v_64_4_2(modExp_result_sva, modExp_1_result_1_sva,
      modExp_base_sva, COMP_LOOP_1_acc_8_itm, STD_LOGIC_VECTOR'( (fsm_output(2))
      & modExp_while_if_or_3_nl & (fsm_output(3)) & or_tmp_130));
  modExp_while_if_or_4_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  modExp_while_if_and_2_nl <= (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0))) AND modulo_result_rem_cmp_a_mx0c3;
  modExp_while_if_and_3_nl <= (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) AND modulo_result_rem_cmp_a_mx0c3;
  modExp_while_if_or_5_nl <= or_tmp_129 OR or_tmp_130;
  modExp_while_if_mux1h_3_nl <= MUX1HOT_v_64_4_2(modExp_base_sva, vec_rsc_0_0_i_qa_d,
      vec_rsc_0_1_i_qa_d, COMP_LOOP_1_acc_8_itm, STD_LOGIC_VECTOR'( modExp_while_if_or_4_nl
      & modExp_while_if_and_2_nl & modExp_while_if_and_3_nl & modExp_while_if_or_5_nl));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux1h_2_nl)
      * UNSIGNED(modExp_while_if_mux1h_3_nl)), 64));
  COMP_LOOP_or_21_cse <= (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_56_nl <= ((tmp_2_lpi_4_dfm(63)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_57_nl <= ((tmp_2_lpi_4_dfm(62)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_58_nl <= ((tmp_2_lpi_4_dfm(61)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_59_nl <= ((tmp_2_lpi_4_dfm(60)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_60_nl <= ((tmp_2_lpi_4_dfm(59)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_61_nl <= ((tmp_2_lpi_4_dfm(58)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_62_nl <= ((tmp_2_lpi_4_dfm(57)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_63_nl <= ((tmp_2_lpi_4_dfm(56)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_64_nl <= ((tmp_2_lpi_4_dfm(55)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_65_nl <= ((tmp_2_lpi_4_dfm(54)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_66_nl <= ((tmp_2_lpi_4_dfm(53)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_67_nl <= ((tmp_2_lpi_4_dfm(52)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_68_nl <= ((tmp_2_lpi_4_dfm(51)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_69_nl <= ((tmp_2_lpi_4_dfm(50)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_70_nl <= ((tmp_2_lpi_4_dfm(49)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_71_nl <= ((tmp_2_lpi_4_dfm(48)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_72_nl <= ((tmp_2_lpi_4_dfm(47)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_73_nl <= ((tmp_2_lpi_4_dfm(46)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_74_nl <= ((tmp_2_lpi_4_dfm(45)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_75_nl <= ((tmp_2_lpi_4_dfm(44)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_76_nl <= ((tmp_2_lpi_4_dfm(43)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_77_nl <= ((tmp_2_lpi_4_dfm(42)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_78_nl <= ((tmp_2_lpi_4_dfm(41)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_79_nl <= ((tmp_2_lpi_4_dfm(40)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_80_nl <= ((tmp_2_lpi_4_dfm(39)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_81_nl <= ((tmp_2_lpi_4_dfm(38)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_82_nl <= ((tmp_2_lpi_4_dfm(37)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_83_nl <= ((tmp_2_lpi_4_dfm(36)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_84_nl <= ((tmp_2_lpi_4_dfm(35)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_85_nl <= ((tmp_2_lpi_4_dfm(34)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_86_nl <= ((tmp_2_lpi_4_dfm(33)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_87_nl <= ((tmp_2_lpi_4_dfm(32)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_88_nl <= ((tmp_2_lpi_4_dfm(31)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_89_nl <= ((tmp_2_lpi_4_dfm(30)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_90_nl <= ((tmp_2_lpi_4_dfm(29)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_91_nl <= ((tmp_2_lpi_4_dfm(28)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_92_nl <= ((tmp_2_lpi_4_dfm(27)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_93_nl <= ((tmp_2_lpi_4_dfm(26)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_94_nl <= ((tmp_2_lpi_4_dfm(25)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_95_nl <= ((tmp_2_lpi_4_dfm(24)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_96_nl <= ((tmp_2_lpi_4_dfm(23)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_97_nl <= ((tmp_2_lpi_4_dfm(22)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_98_nl <= ((tmp_2_lpi_4_dfm(21)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_99_nl <= ((tmp_2_lpi_4_dfm(20)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_100_nl <= ((tmp_2_lpi_4_dfm(19)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_101_nl <= ((tmp_2_lpi_4_dfm(18)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_102_nl <= ((tmp_2_lpi_4_dfm(17)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_103_nl <= ((tmp_2_lpi_4_dfm(16)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_104_nl <= ((tmp_2_lpi_4_dfm(15)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_105_nl <= ((tmp_2_lpi_4_dfm(14)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_106_nl <= ((tmp_2_lpi_4_dfm(13)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_COMP_LOOP_or_107_nl <= ((tmp_2_lpi_4_dfm(12)) AND COMP_LOOP_nor_1_cse)
      OR (fsm_output(8)) OR (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_mux_45_nl <= MUX_v_2_2_2((tmp_2_lpi_4_dfm(11 DOWNTO 10)), (VEC_LOOP_j_sva_11_0(11
      DOWNTO 10)), fsm_output(45));
  COMP_LOOP_nor_57_nl <= NOT((fsm_output(16)) OR (fsm_output(34)));
  COMP_LOOP_and_109_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux_45_nl,
      COMP_LOOP_nor_57_nl);
  COMP_LOOP_COMP_LOOP_or_108_nl <= MUX_v_2_2_2(COMP_LOOP_and_109_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_21_cse);
  COMP_LOOP_mux1h_64_nl <= MUX1HOT_v_2_4_2((tmp_2_lpi_4_dfm(9 DOWNTO 8)), STD_LOGIC_VECTOR'(
      '1' & (NOT (COMP_LOOP_k_9_1_sva_7_0(7)))), (z_out_2(9 DOWNTO 8)), (VEC_LOOP_j_sva_11_0(9
      DOWNTO 8)), STD_LOGIC_VECTOR'( or_tmp_41 & (fsm_output(8)) & COMP_LOOP_or_1_cse
      & (fsm_output(45))));
  COMP_LOOP_or_23_nl <= (fsm_output(28)) OR (fsm_output(10));
  COMP_LOOP_or_22_nl <= MUX_v_2_2_2(COMP_LOOP_mux1h_64_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_23_nl);
  COMP_LOOP_mux1h_65_nl <= MUX1HOT_v_7_6_2((tmp_2_lpi_4_dfm(7 DOWNTO 1)), (NOT (COMP_LOOP_k_9_1_sva_7_0(6
      DOWNTO 0))), STD_LOGIC_VECTOR'( (NOT modExp_exp_1_7_1_sva) & (NOT modExp_exp_1_6_1_sva)
      & (NOT modExp_exp_1_5_1_sva) & (NOT modExp_exp_1_4_1_sva) & (NOT modExp_exp_1_3_1_sva)
      & (NOT modExp_exp_1_2_1_sva) & (NOT modExp_exp_1_1_1_sva)), (z_out_2(7 DOWNTO
      1)), (VEC_LOOP_j_sva_11_0(7 DOWNTO 1)), STD_LOGIC_VECTOR'( (NOT modExp_exp_1_0_1_sva_1)
      & (NOT modExp_exp_1_7_1_sva) & (NOT modExp_exp_1_6_1_sva) & (NOT modExp_exp_1_5_1_sva)
      & (NOT modExp_exp_1_4_1_sva) & (NOT modExp_exp_1_3_1_sva) & (NOT modExp_exp_1_2_1_sva)),
      STD_LOGIC_VECTOR'( or_tmp_41 & (fsm_output(8)) & (fsm_output(28)) & COMP_LOOP_or_1_cse
      & (fsm_output(45)) & (fsm_output(10))));
  COMP_LOOP_mux1h_66_nl <= MUX1HOT_s_1_5_2((tmp_2_lpi_4_dfm(0)), (NOT modExp_exp_1_0_1_sva_1),
      (z_out_2(0)), (VEC_LOOP_j_sva_11_0(0)), (NOT modExp_exp_1_1_1_sva), STD_LOGIC_VECTOR'(
      or_tmp_41 & (fsm_output(28)) & COMP_LOOP_or_1_cse & (fsm_output(45)) & (fsm_output(10))));
  COMP_LOOP_or_24_nl <= COMP_LOOP_mux1h_66_nl OR (fsm_output(8));
  COMP_LOOP_mux1h_67_nl <= MUX1HOT_v_64_4_2(modulo_result_mux_1_cse, STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000000000000001"), (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000") & VEC_LOOP_j_sva_11_0),
      (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000")
      & STAGE_LOOP_lshift_psp_sva), STD_LOGIC_VECTOR'( or_tmp_41 & COMP_LOOP_or_21_cse
      & COMP_LOOP_or_1_cse & (fsm_output(45))));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_56_nl
      & COMP_LOOP_COMP_LOOP_or_57_nl & COMP_LOOP_COMP_LOOP_or_58_nl & COMP_LOOP_COMP_LOOP_or_59_nl
      & COMP_LOOP_COMP_LOOP_or_60_nl & COMP_LOOP_COMP_LOOP_or_61_nl & COMP_LOOP_COMP_LOOP_or_62_nl
      & COMP_LOOP_COMP_LOOP_or_63_nl & COMP_LOOP_COMP_LOOP_or_64_nl & COMP_LOOP_COMP_LOOP_or_65_nl
      & COMP_LOOP_COMP_LOOP_or_66_nl & COMP_LOOP_COMP_LOOP_or_67_nl & COMP_LOOP_COMP_LOOP_or_68_nl
      & COMP_LOOP_COMP_LOOP_or_69_nl & COMP_LOOP_COMP_LOOP_or_70_nl & COMP_LOOP_COMP_LOOP_or_71_nl
      & COMP_LOOP_COMP_LOOP_or_72_nl & COMP_LOOP_COMP_LOOP_or_73_nl & COMP_LOOP_COMP_LOOP_or_74_nl
      & COMP_LOOP_COMP_LOOP_or_75_nl & COMP_LOOP_COMP_LOOP_or_76_nl & COMP_LOOP_COMP_LOOP_or_77_nl
      & COMP_LOOP_COMP_LOOP_or_78_nl & COMP_LOOP_COMP_LOOP_or_79_nl & COMP_LOOP_COMP_LOOP_or_80_nl
      & COMP_LOOP_COMP_LOOP_or_81_nl & COMP_LOOP_COMP_LOOP_or_82_nl & COMP_LOOP_COMP_LOOP_or_83_nl
      & COMP_LOOP_COMP_LOOP_or_84_nl & COMP_LOOP_COMP_LOOP_or_85_nl & COMP_LOOP_COMP_LOOP_or_86_nl
      & COMP_LOOP_COMP_LOOP_or_87_nl & COMP_LOOP_COMP_LOOP_or_88_nl & COMP_LOOP_COMP_LOOP_or_89_nl
      & COMP_LOOP_COMP_LOOP_or_90_nl & COMP_LOOP_COMP_LOOP_or_91_nl & COMP_LOOP_COMP_LOOP_or_92_nl
      & COMP_LOOP_COMP_LOOP_or_93_nl & COMP_LOOP_COMP_LOOP_or_94_nl & COMP_LOOP_COMP_LOOP_or_95_nl
      & COMP_LOOP_COMP_LOOP_or_96_nl & COMP_LOOP_COMP_LOOP_or_97_nl & COMP_LOOP_COMP_LOOP_or_98_nl
      & COMP_LOOP_COMP_LOOP_or_99_nl & COMP_LOOP_COMP_LOOP_or_100_nl & COMP_LOOP_COMP_LOOP_or_101_nl
      & COMP_LOOP_COMP_LOOP_or_102_nl & COMP_LOOP_COMP_LOOP_or_103_nl & COMP_LOOP_COMP_LOOP_or_104_nl
      & COMP_LOOP_COMP_LOOP_or_105_nl & COMP_LOOP_COMP_LOOP_or_106_nl & COMP_LOOP_COMP_LOOP_or_107_nl
      & COMP_LOOP_COMP_LOOP_or_108_nl & COMP_LOOP_or_22_nl & COMP_LOOP_mux1h_65_nl
      & COMP_LOOP_or_24_nl) + UNSIGNED(COMP_LOOP_mux1h_67_nl), 64));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0 & (fsm_output(34))),
      9), 10), 10));
  COMP_LOOP_COMP_LOOP_or_109_nl <= (NOT(or_tmp_41 OR (fsm_output(16)) OR (fsm_output(8))
      OR (fsm_output(34)))) OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  COMP_LOOP_mux_46_nl <= MUX_s_1_2_2((tmp_2_lpi_4_dfm(63)), (NOT (modExp_exp_sva_mx0w0(63))),
      fsm_output(1));
  COMP_LOOP_COMP_LOOP_or_110_nl <= (COMP_LOOP_mux_46_nl AND (NOT((fsm_output(16))
      OR (fsm_output(8)) OR (fsm_output(34))))) OR (fsm_output(2));
  COMP_LOOP_mux1h_68_nl <= MUX1HOT_v_63_6_2((tmp_2_lpi_4_dfm(62 DOWNTO 0)), (STD_LOGIC_VECTOR'(
      "000000000000000000000000000000000000000000000000000001") & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)))), (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000")
      & VEC_LOOP_j_sva_11_0), (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_9_1_sva_7_0), (NOT (modExp_exp_sva_mx0w0(62 DOWNTO 0))), (NOT
      operator_64_false_slc_modExp_exp_63_1_itm), STD_LOGIC_VECTOR'( or_tmp_41 &
      (fsm_output(16)) & (fsm_output(8)) & (fsm_output(34)) & (fsm_output(1)) & (fsm_output(2))));
  COMP_LOOP_or_27_nl <= (NOT((fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)))) OR or_tmp_41 OR (fsm_output(16));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl <= NOT((modulo_result_mux_1_cse(63)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl <= NOT((modulo_result_mux_1_cse(62)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl <= NOT((modulo_result_mux_1_cse(61)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl <= NOT((modulo_result_mux_1_cse(60)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl <= NOT((modulo_result_mux_1_cse(59)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl <= NOT((modulo_result_mux_1_cse(58)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl <= NOT((modulo_result_mux_1_cse(57)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl <= NOT((modulo_result_mux_1_cse(56)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl <= NOT((modulo_result_mux_1_cse(55)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl <= NOT((modulo_result_mux_1_cse(54)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl <= NOT((modulo_result_mux_1_cse(53)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl <= NOT((modulo_result_mux_1_cse(52)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl <= NOT((modulo_result_mux_1_cse(51)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl <= NOT((modulo_result_mux_1_cse(50)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl <= NOT((modulo_result_mux_1_cse(49)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl <= NOT((modulo_result_mux_1_cse(48)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl <= NOT((modulo_result_mux_1_cse(47)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl <= NOT((modulo_result_mux_1_cse(46)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl <= NOT((modulo_result_mux_1_cse(45)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl <= NOT((modulo_result_mux_1_cse(44)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl <= NOT((modulo_result_mux_1_cse(43)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl <= NOT((modulo_result_mux_1_cse(42)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl <= NOT((modulo_result_mux_1_cse(41)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl <= NOT((modulo_result_mux_1_cse(40)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl <= NOT((modulo_result_mux_1_cse(39)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl <= NOT((modulo_result_mux_1_cse(38)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl <= NOT((modulo_result_mux_1_cse(37)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl <= NOT((modulo_result_mux_1_cse(36)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl <= NOT((modulo_result_mux_1_cse(35)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl <= NOT((modulo_result_mux_1_cse(34)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl <= NOT((modulo_result_mux_1_cse(33)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl <= NOT((modulo_result_mux_1_cse(32)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl <= NOT((modulo_result_mux_1_cse(31)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl <= NOT((modulo_result_mux_1_cse(30)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl <= NOT((modulo_result_mux_1_cse(29)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl <= NOT((modulo_result_mux_1_cse(28)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl <= NOT((modulo_result_mux_1_cse(27)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl <= NOT((modulo_result_mux_1_cse(26)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl <= NOT((modulo_result_mux_1_cse(25)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl <= NOT((modulo_result_mux_1_cse(24)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl <= NOT((modulo_result_mux_1_cse(23)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl <= NOT((modulo_result_mux_1_cse(22)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl <= NOT((modulo_result_mux_1_cse(21)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl <= NOT((modulo_result_mux_1_cse(20)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl <= NOT((modulo_result_mux_1_cse(19)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl <= NOT((modulo_result_mux_1_cse(18)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl <= NOT((modulo_result_mux_1_cse(17)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl <= NOT((modulo_result_mux_1_cse(16)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl <= NOT((modulo_result_mux_1_cse(15)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl <= NOT((modulo_result_mux_1_cse(14)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl <= NOT((modulo_result_mux_1_cse(13)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl <= NOT((modulo_result_mux_1_cse(12)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl <= NOT((modulo_result_mux_1_cse(11)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl <= NOT((modulo_result_mux_1_cse(10)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl <= NOT((modulo_result_mux_1_cse(9)) OR
      (fsm_output(16)) OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1))
      OR (fsm_output(2)));
  COMP_LOOP_or_28_nl <= (fsm_output(16)) OR (fsm_output(8));
  COMP_LOOP_COMP_LOOP_mux_3_nl <= MUX_v_8_2_2((NOT (modulo_result_mux_1_cse(8 DOWNTO
      1))), COMP_LOOP_k_9_1_sva_7_0, COMP_LOOP_or_28_nl);
  COMP_LOOP_nor_61_nl <= NOT((fsm_output(34)) OR (fsm_output(1)) OR (fsm_output(2)));
  COMP_LOOP_and_111_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), COMP_LOOP_COMP_LOOP_mux_3_nl,
      COMP_LOOP_nor_61_nl);
  COMP_LOOP_COMP_LOOP_or_111_nl <= (NOT (modulo_result_mux_1_cse(0))) OR (fsm_output(16))
      OR (fsm_output(8)) OR (fsm_output(34)) OR (fsm_output(1)) OR (fsm_output(2));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_109_nl
      & COMP_LOOP_COMP_LOOP_or_110_nl & COMP_LOOP_mux1h_68_nl & COMP_LOOP_or_27_nl)
      + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_55_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_56_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_57_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_58_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_59_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_60_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_61_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_62_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_63_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_64_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_65_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_66_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_67_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_68_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_69_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_70_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_71_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_72_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_73_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_74_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_75_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_76_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_77_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_78_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_79_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_80_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_81_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_82_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_83_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_84_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_85_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_86_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_87_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_88_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_89_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_90_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_91_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_92_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_93_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_94_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_95_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_96_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_97_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_98_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_99_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_100_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_101_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_102_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_103_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_104_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_105_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_106_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_107_nl
      & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_108_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_109_nl
      & COMP_LOOP_and_111_nl & COMP_LOOP_COMP_LOOP_or_111_nl & '1'), 65), 66), 66));
  z_out_3 <= acc_2_nl(65 DOWNTO 1);
  modulo_qelse_mux_2_nl <= MUX_v_64_2_2(modulo_result_rem_cmp_z_oreg, p_sva, fsm_output(1));
  modulo_qelse_modulo_qelse_or_1_nl <= MUX_v_64_2_2(p_sva, STD_LOGIC_VECTOR'("1111111111111111111111111111111111111111111111111111111111111111"),
      (fsm_output(1)));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_qelse_mux_2_nl),
      65) + CONV_UNSIGNED(SIGNED(modulo_qelse_modulo_qelse_or_1_nl), 65), 65));
END v29;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.mgc_comps.ALL;


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

ARCHITECTURE v29 OF inPlaceNTT_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra_d_iff : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wea_d_iff : STD_LOGIC;

  SIGNAL modulo_result_rem_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

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
      modulo_result_rem_cmp_a : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      modulo_result_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      modulo_result_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
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
  SIGNAL inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
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
      modulo_result_rem_cmp_a => inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_a,
      modulo_result_rem_cmp_b => inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_b,
      modulo_result_rem_cmp_z => inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_z,
      vec_rsc_0_0_i_adra_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  modulo_result_rem_cmp_a <= inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_a;
  modulo_result_rem_cmp_b <= inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_b;
  inPlaceNTT_DIT_core_inst_modulo_result_rem_cmp_z <= modulo_result_rem_cmp_z;
  vec_rsc_0_0_i_adra_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff;

END v29;



