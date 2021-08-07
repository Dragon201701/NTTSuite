
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
--  Generated date: Mon May 17 21:28:49 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen;

ARCHITECTURE v3 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v3;

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
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
    modExp_while_C_47_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v3 OF inPlaceNTT_DIT_core_core_fsm IS
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
      modExp_while_C_47, COMP_LOOP_C_0, COMP_LOOP_C_1, modExp_1_while_C_0, modExp_1_while_C_1,
      modExp_1_while_C_2, modExp_1_while_C_3, modExp_1_while_C_4, modExp_1_while_C_5,
      modExp_1_while_C_6, modExp_1_while_C_7, modExp_1_while_C_8, modExp_1_while_C_9,
      modExp_1_while_C_10, modExp_1_while_C_11, modExp_1_while_C_12, modExp_1_while_C_13,
      modExp_1_while_C_14, modExp_1_while_C_15, modExp_1_while_C_16, modExp_1_while_C_17,
      modExp_1_while_C_18, modExp_1_while_C_19, modExp_1_while_C_20, modExp_1_while_C_21,
      modExp_1_while_C_22, modExp_1_while_C_23, modExp_1_while_C_24, modExp_1_while_C_25,
      modExp_1_while_C_26, modExp_1_while_C_27, modExp_1_while_C_28, modExp_1_while_C_29,
      modExp_1_while_C_30, modExp_1_while_C_31, modExp_1_while_C_32, modExp_1_while_C_33,
      modExp_1_while_C_34, modExp_1_while_C_35, modExp_1_while_C_36, modExp_1_while_C_37,
      modExp_1_while_C_38, modExp_1_while_C_39, modExp_1_while_C_40, modExp_1_while_C_41,
      modExp_1_while_C_42, modExp_1_while_C_43, modExp_1_while_C_44, modExp_1_while_C_45,
      modExp_1_while_C_46, modExp_1_while_C_47, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4,
      COMP_LOOP_C_5, COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9,
      COMP_LOOP_C_10, COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14,
      COMP_LOOP_C_15, COMP_LOOP_C_16, COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19,
      COMP_LOOP_C_20, COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24,
      COMP_LOOP_C_25, COMP_LOOP_C_26, COMP_LOOP_C_27, COMP_LOOP_C_28, COMP_LOOP_C_29,
      COMP_LOOP_C_30, COMP_LOOP_C_31, COMP_LOOP_C_32, COMP_LOOP_C_33, COMP_LOOP_C_34,
      COMP_LOOP_C_35, COMP_LOOP_C_36, COMP_LOOP_C_37, COMP_LOOP_C_38, COMP_LOOP_C_39,
      COMP_LOOP_C_40, COMP_LOOP_C_41, COMP_LOOP_C_42, COMP_LOOP_C_43, COMP_LOOP_C_44,
      COMP_LOOP_C_45, COMP_LOOP_C_46, COMP_LOOP_C_47, COMP_LOOP_C_48, COMP_LOOP_C_49,
      COMP_LOOP_C_50, COMP_LOOP_C_51, COMP_LOOP_C_52, COMP_LOOP_C_53, COMP_LOOP_C_54,
      COMP_LOOP_C_55, COMP_LOOP_C_56, COMP_LOOP_C_57, COMP_LOOP_C_58, COMP_LOOP_C_59,
      COMP_LOOP_C_60, COMP_LOOP_C_61, COMP_LOOP_C_62, COMP_LOOP_C_63, COMP_LOOP_C_64,
      COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_C_68, COMP_LOOP_C_69,
      COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72, COMP_LOOP_C_73, COMP_LOOP_C_74,
      COMP_LOOP_C_75, COMP_LOOP_C_76, VEC_LOOP_C_0, STAGE_LOOP_C_11, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_10_tr0, modExp_while_C_47_tr0,
      COMP_LOOP_C_1_tr0, modExp_1_while_C_47_tr0, COMP_LOOP_C_76_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_11_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= STAGE_LOOP_C_1;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= STAGE_LOOP_C_2;
      WHEN STAGE_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        state_var_NS <= STAGE_LOOP_C_3;
      WHEN STAGE_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= STAGE_LOOP_C_4;
      WHEN STAGE_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= STAGE_LOOP_C_5;
      WHEN STAGE_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= STAGE_LOOP_C_6;
      WHEN STAGE_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= STAGE_LOOP_C_7;
      WHEN STAGE_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= STAGE_LOOP_C_8;
      WHEN STAGE_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= STAGE_LOOP_C_9;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= STAGE_LOOP_C_10;
      WHEN STAGE_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        IF ( STAGE_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= modExp_while_C_39;
      WHEN modExp_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= modExp_while_C_40;
      WHEN modExp_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= modExp_while_C_41;
      WHEN modExp_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= modExp_while_C_42;
      WHEN modExp_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= modExp_while_C_43;
      WHEN modExp_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= modExp_while_C_44;
      WHEN modExp_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= modExp_while_C_45;
      WHEN modExp_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= modExp_while_C_46;
      WHEN modExp_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= modExp_while_C_47;
      WHEN modExp_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        IF ( modExp_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= modExp_1_while_C_0;
        END IF;
      WHEN modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= modExp_1_while_C_1;
      WHEN modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= modExp_1_while_C_2;
      WHEN modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= modExp_1_while_C_3;
      WHEN modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= modExp_1_while_C_4;
      WHEN modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= modExp_1_while_C_5;
      WHEN modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= modExp_1_while_C_6;
      WHEN modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= modExp_1_while_C_7;
      WHEN modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= modExp_1_while_C_8;
      WHEN modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= modExp_1_while_C_9;
      WHEN modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= modExp_1_while_C_10;
      WHEN modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= modExp_1_while_C_11;
      WHEN modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= modExp_1_while_C_12;
      WHEN modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= modExp_1_while_C_13;
      WHEN modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= modExp_1_while_C_14;
      WHEN modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= modExp_1_while_C_15;
      WHEN modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= modExp_1_while_C_16;
      WHEN modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= modExp_1_while_C_17;
      WHEN modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= modExp_1_while_C_18;
      WHEN modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= modExp_1_while_C_19;
      WHEN modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= modExp_1_while_C_20;
      WHEN modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= modExp_1_while_C_21;
      WHEN modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= modExp_1_while_C_22;
      WHEN modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= modExp_1_while_C_23;
      WHEN modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= modExp_1_while_C_24;
      WHEN modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= modExp_1_while_C_25;
      WHEN modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= modExp_1_while_C_26;
      WHEN modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= modExp_1_while_C_27;
      WHEN modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= modExp_1_while_C_28;
      WHEN modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= modExp_1_while_C_29;
      WHEN modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= modExp_1_while_C_30;
      WHEN modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= modExp_1_while_C_31;
      WHEN modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= modExp_1_while_C_32;
      WHEN modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= modExp_1_while_C_33;
      WHEN modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= modExp_1_while_C_34;
      WHEN modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= modExp_1_while_C_35;
      WHEN modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= modExp_1_while_C_36;
      WHEN modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= modExp_1_while_C_37;
      WHEN modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= modExp_1_while_C_38;
      WHEN modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= modExp_1_while_C_39;
      WHEN modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= modExp_1_while_C_40;
      WHEN modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= modExp_1_while_C_41;
      WHEN modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= modExp_1_while_C_42;
      WHEN modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= modExp_1_while_C_43;
      WHEN modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= modExp_1_while_C_44;
      WHEN modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= modExp_1_while_C_45;
      WHEN modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= modExp_1_while_C_46;
      WHEN modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= modExp_1_while_C_47;
      WHEN modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        IF ( modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        IF ( COMP_LOOP_C_76_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_11;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        IF ( STAGE_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
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

END v3;

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

ARCHITECTURE v3 OF inPlaceNTT_DIT_core_wait_dp IS
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
END v3;

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
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsci_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    operator_66_true_div_cmp_a : OUT STD_LOGIC_VECTOR (64 DOWNTO 0);
    operator_66_true_div_cmp_b : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
    vec_rsci_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v3 OF inPlaceNTT_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL or_tmp_36 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL or_tmp_41 : STD_LOGIC;
  SIGNAL not_tmp_47 : STD_LOGIC;
  SIGNAL or_tmp_48 : STD_LOGIC;
  SIGNAL or_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL mux_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL or_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL mux_tmp_72 : STD_LOGIC;
  SIGNAL or_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL or_tmp_118 : STD_LOGIC;
  SIGNAL exit_modExp_1_while_sva : STD_LOGIC;
  SIGNAL operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm : STD_LOGIC;
  SIGNAL modExp_exp_1_0_sva : STD_LOGIC;
  SIGNAL modExp_base_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_5_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_90_m1c : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL and_133_cse : STD_LOGIC;
  SIGNAL or_75_cse : STD_LOGIC;
  SIGNAL and_126_cse : STD_LOGIC;
  SIGNAL and_115_cse : STD_LOGIC;
  SIGNAL modulo_5_mux_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_141_cse : STD_LOGIC;
  SIGNAL and_129_cse : STD_LOGIC;
  SIGNAL or_173_cse : STD_LOGIC;
  SIGNAL or_174_cse : STD_LOGIC;
  SIGNAL nand_8_cse : STD_LOGIC;
  SIGNAL nand_18_cse : STD_LOGIC;
  SIGNAL or_127_cse : STD_LOGIC;
  SIGNAL modExp_while_and_itm : STD_LOGIC;
  SIGNAL modExp_while_and_1_itm : STD_LOGIC;
  SIGNAL reg_operator_66_true_div_cmp_b_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_12_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL mux_35_itm : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_7_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_sva_1 : STD_LOGIC;
  SIGNAL modExp_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_1_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_0_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_5_mut_mx0w7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx1w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm_mx0w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_cse : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL not_tmp_124 : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_2_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL or_tmp_140 : STD_LOGIC;
  SIGNAL or_tmp_141 : STD_LOGIC;
  SIGNAL or_tmp_143 : STD_LOGIC;
  SIGNAL mux_tmp_155 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL nand_37_cse : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL or_63_nl : STD_LOGIC;
  SIGNAL and_54_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL or_58_nl : STD_LOGIC;
  SIGNAL and_57_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL nor_72_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL or_68_nl : STD_LOGIC;
  SIGNAL and_62_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL and_130_nl : STD_LOGIC;
  SIGNAL nor_57_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL and_128_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL nor_56_nl : STD_LOGIC;
  SIGNAL and_70_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL and_127_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL and_73_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL and_125_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL nor_55_nl : STD_LOGIC;
  SIGNAL modExp_result_mux1h_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL modExp_1_while_and_nl : STD_LOGIC;
  SIGNAL modExp_1_while_and_1_nl : STD_LOGIC;
  SIGNAL and_80_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL or_185_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL or_194_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL and_151_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_199_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL and_229_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL nor_51_nl : STD_LOGIC;
  SIGNAL nor_52_nl : STD_LOGIC;
  SIGNAL and_93_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL or_112_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL or_119_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL or_109_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL or_108_nl : STD_LOGIC;
  SIGNAL or_105_nl : STD_LOGIC;
  SIGNAL and_96_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL nor_49_nl : STD_LOGIC;
  SIGNAL nor_50_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nand_35_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL or_208_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL or_206_nl : STD_LOGIC;
  SIGNAL or_205_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL nand_30_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL or_131_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL or_150_nl : STD_LOGIC;
  SIGNAL nand_27_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_34_nl : STD_LOGIC;
  SIGNAL nor_69_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL mux_34_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL or_48_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL or_82_nl : STD_LOGIC;
  SIGNAL nor_53_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_27_nl : STD_LOGIC;
  SIGNAL and_34_nl : STD_LOGIC;
  SIGNAL and_38_nl : STD_LOGIC;
  SIGNAL mux_37_nl : STD_LOGIC;
  SIGNAL nor_46_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL and_152_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL operator_64_false_1_or_1_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_1_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_231_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl : STD_LOGIC_VECTOR (53 DOWNTO 0);
  SIGNAL COMP_LOOP_not_43_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_8_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_9_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_61_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nand_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_62_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_not_45_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_232_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL and_233_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
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
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
      modExp_while_C_47_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
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

  FUNCTION MUX1HOT_v_64_6_2(input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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

  vec_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => vec_rsc_triosy_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
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
      modExp_while_C_47_tr0 => exit_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      modExp_1_while_C_47_tr0 => exit_modExp_1_while_sva,
      COMP_LOOP_C_76_tr0 => exit_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_11_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 <= NOT (z_out_1(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  modulo_5_mux_cse <= MUX_v_64_2_2(modExp_base_1_sva, modulo_qr_sva_1_mx1w0, modExp_base_1_sva(63));
  or_173_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_133_cse <= or_173_cse AND (fsm_output(2));
  or_75_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_126_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_129_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  or_174_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  operator_66_true_div_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(reg_operator_66_true_div_cmp_b_reg));
  and_115_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_124_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), nand_18_cse, and_115_cse);
  mux_125_nl <= MUX_s_1_2_2(mux_124_nl, mux_tmp_54, fsm_output(7));
  modExp_1_while_and_nl <= (NOT (modExp_base_1_sva(63))) AND modExp_exp_1_0_sva AND
      and_dcpl_100;
  modExp_1_while_and_1_nl <= (modExp_base_1_sva(63)) AND modExp_exp_1_0_sva AND and_dcpl_100;
  modExp_result_mux1h_2_nl <= MUX1HOT_v_64_4_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
      modExp_base_1_sva, modulo_qr_sva_1_mx1w0, (z_out_2(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
      mux_125_nl & modExp_1_while_and_nl & modExp_1_while_and_1_nl & and_dcpl_65));
  and_80_nl <= and_dcpl_14 AND and_dcpl_76;
  nor_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))))
      OR (NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT (fsm_output(3))));
  mux_55_nl <= MUX_s_1_2_2((fsm_output(6)), nor_nl, and_115_cse);
  mux_56_nl <= MUX_s_1_2_2(mux_55_nl, (NOT mux_tmp_54), fsm_output(7));
  operator_64_false_mux1h_2_rgt <= MUX1HOT_v_65_3_2(z_out_2, (STD_LOGIC_VECTOR'(
      "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0' & modExp_result_mux1h_2_nl),
      STD_LOGIC_VECTOR'( and_80_nl & and_dcpl_81 & mux_56_nl));
  and_90_m1c <= and_dcpl_13 AND and_dcpl_25 AND and_dcpl_28;
  modExp_result_and_rgt <= (NOT modExp_while_and_1_itm) AND and_90_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_1_itm AND and_90_m1c;
  nand_37_cse <= NOT((fsm_output(5)) AND (fsm_output(0)));
  or_127_cse <= (fsm_output(7)) OR (NOT (fsm_output(5)));
  nand_18_cse <= NOT((fsm_output(3)) AND (fsm_output(1)) AND (fsm_output(2)) AND
      (NOT (fsm_output(6))));
  mux_73_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_tmp_80, and_126_cse);
  mux_119_nl <= MUX_s_1_2_2(mux_73_nl, or_tmp_118, fsm_output(4));
  mux_120_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), mux_119_nl, fsm_output(5));
  COMP_LOOP_or_5_cse <= mux_120_nl OR (fsm_output(7));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_5_mut_mx0w7 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(COMP_LOOP_acc_5_mut)
      + SIGNED(modulo_5_mux_cse), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z_oreg(63
      DOWNTO 1)), (COMP_LOOP_acc_5_mut(63 DOWNTO 1)), and_dcpl_89);
  modulo_qr_sva_1_mx1w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modExp_base_1_sva)
      + UNSIGNED(p_sva), 64));
  modExp_while_mul_itm_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(UNSIGNED'( UNSIGNED(modExp_base_1_sva)
      * UNSIGNED(modExp_base_1_sva)), 64));
  and_141_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_tmp_36 <= (fsm_output(6)) OR (fsm_output(3));
  nor_61_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000000")));
  or_48_nl <= and_141_cse OR (fsm_output(2));
  mux_33_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_36, or_48_nl);
  mux_34_nl <= MUX_s_1_2_2((fsm_output(6)), mux_33_nl, and_115_cse);
  mux_35_itm <= MUX_s_1_2_2(nor_61_nl, mux_34_nl, fsm_output(7));
  and_dcpl_9 <= NOT((fsm_output(5)) OR (fsm_output(7)));
  and_dcpl_10 <= NOT((fsm_output(0)) OR (fsm_output(4)));
  and_dcpl_11 <= and_dcpl_10 AND and_dcpl_9;
  and_dcpl_12 <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_13 <= NOT((fsm_output(3)) OR (fsm_output(6)));
  and_dcpl_14 <= and_dcpl_13 AND and_dcpl_12;
  and_dcpl_16 <= (fsm_output(5)) AND (fsm_output(7));
  and_dcpl_17 <= (NOT (fsm_output(0))) AND (fsm_output(4));
  and_dcpl_19 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_20 <= (fsm_output(3)) AND (NOT (fsm_output(6)));
  and_dcpl_21 <= and_dcpl_20 AND and_dcpl_19;
  and_dcpl_23 <= (fsm_output(5)) AND (NOT (fsm_output(7)));
  and_dcpl_24 <= and_dcpl_17 AND and_dcpl_23;
  and_dcpl_25 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_26 <= and_dcpl_20 AND and_dcpl_25;
  and_dcpl_28 <= and_dcpl_10 AND and_dcpl_23;
  and_dcpl_30 <= (fsm_output(3)) AND (fsm_output(6));
  and_dcpl_31 <= and_dcpl_30 AND and_126_cse;
  and_dcpl_32 <= and_dcpl_31 AND and_dcpl_28;
  and_dcpl_35 <= (fsm_output(0)) AND (fsm_output(4));
  and_dcpl_36 <= and_dcpl_35 AND and_dcpl_16;
  and_dcpl_52 <= and_dcpl_26 AND and_dcpl_11;
  and_dcpl_53 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_41 <= and_141_cse OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  not_tmp_47 <= NOT((fsm_output(4)) OR (or_173_cse AND CONV_SL_1_1(fsm_output(3 DOWNTO
      2)=STD_LOGIC_VECTOR'("11"))));
  or_tmp_48 <= (fsm_output(2)) OR (NOT (fsm_output(6))) OR (fsm_output(3));
  or_tmp_50 <= NOT((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(2))
      AND (NOT (fsm_output(6))) AND (fsm_output(3)));
  and_dcpl_64 <= and_dcpl_20 AND and_dcpl_12;
  and_dcpl_65 <= and_dcpl_64 AND and_dcpl_10 AND (NOT (fsm_output(5))) AND (fsm_output(7));
  and_dcpl_74 <= NOT((NOT(or_174_cse XOR (fsm_output(3)))) OR CONV_SL_1_1(fsm_output(7
      DOWNTO 4)/=STD_LOGIC_VECTOR'("0000")));
  mux_49_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_36, or_174_cse);
  mux_tmp_50 <= MUX_s_1_2_2((fsm_output(6)), mux_49_nl, and_115_cse);
  and_dcpl_75 <= (fsm_output(0)) AND (NOT (fsm_output(4)));
  and_dcpl_76 <= and_dcpl_75 AND and_dcpl_9;
  and_dcpl_81 <= and_dcpl_20 AND (NOT((fsm_output(4)) XOR (fsm_output(5)))) AND and_dcpl_19
      AND (fsm_output(0)) AND (NOT (fsm_output(7)));
  or_tmp_66 <= (fsm_output(6)) OR (NOT (fsm_output(3)));
  mux_53_nl <= MUX_s_1_2_2(or_tmp_66, (fsm_output(6)), fsm_output(4));
  or_82_nl <= and_133_cse OR (fsm_output(6)) OR (fsm_output(3));
  mux_52_nl <= MUX_s_1_2_2((fsm_output(6)), or_82_nl, fsm_output(4));
  mux_tmp_54 <= MUX_s_1_2_2(mux_53_nl, mux_52_nl, fsm_output(5));
  mux_tmp_72 <= MUX_s_1_2_2((fsm_output(6)), or_tmp_36, fsm_output(2));
  or_tmp_80 <= (NOT (fsm_output(6))) OR (fsm_output(3));
  and_dcpl_88 <= and_dcpl_35 AND and_dcpl_23;
  and_dcpl_89 <= and_dcpl_21 AND and_dcpl_88;
  nand_8_cse <= NOT((fsm_output(7)) AND (fsm_output(2)) AND (fsm_output(1)) AND (NOT
      (fsm_output(6))));
  and_dcpl_94 <= and_dcpl_26 AND and_dcpl_88;
  and_dcpl_95 <= and_dcpl_75 AND and_dcpl_23;
  mux_tmp_99 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(7));
  and_dcpl_100 <= (NOT (fsm_output(3))) AND (fsm_output(6)) AND and_126_cse AND and_dcpl_17
      AND and_dcpl_9;
  and_dcpl_104 <= and_dcpl_20 AND and_126_cse AND and_dcpl_24;
  or_dcpl_28 <= or_tmp_66 OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_32 <= (fsm_output(0)) OR (NOT (fsm_output(4))) OR or_127_cse;
  and_dcpl_107 <= and_dcpl_30 AND and_dcpl_25 AND and_dcpl_95;
  or_tmp_118 <= NOT((fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(2)) AND (NOT
      (fsm_output(6))) AND (fsm_output(3)));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_21 AND and_dcpl_17 AND and_dcpl_16;
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_64 AND and_dcpl_36;
  nor_53_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR
      mux_tmp_72);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_53_nl, mux_tmp_50, fsm_output(7));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  and_27_nl <= and_dcpl_26 AND and_dcpl_24;
  and_34_nl <= and_dcpl_14 AND and_dcpl_10 AND and_dcpl_16;
  and_38_nl <= and_dcpl_13 AND and_126_cse AND and_dcpl_36;
  vec_rsci_adra_d <= MUX1HOT_v_12_4_2((z_out_2(11 DOWNTO 0)), (z_out(12 DOWNTO 1)),
      COMP_LOOP_acc_1_cse_sva, COMP_LOOP_acc_10_cse_12_1_sva, STD_LOGIC_VECTOR'(
      and_27_nl & and_dcpl_32 & and_34_nl & and_38_nl));
  vec_rsci_da_d <= modulo_5_mux_cse;
  nor_46_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
  mux_37_nl <= MUX_s_1_2_2(nor_46_nl, and_129_cse, fsm_output(4));
  vec_rsci_wea_d_pff <= mux_37_nl AND and_dcpl_13 AND and_dcpl_16;
  and_152_nl <= (fsm_output(1)) AND (fsm_output(6));
  nor_82_nl <= NOT((fsm_output(1)) OR (fsm_output(6)));
  mux_38_nl <= MUX_s_1_2_2(and_152_nl, nor_82_nl, fsm_output(4));
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_38_nl AND (fsm_output(3)) AND
      (fsm_output(2)) AND (NOT (fsm_output(0))) AND and_dcpl_23;
  and_dcpl_122 <= and_dcpl_23 AND (NOT (fsm_output(4))) AND (NOT (fsm_output(0)))
      AND (fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(6));
  and_dcpl_128 <= (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(4)) AND (fsm_output(0))
      AND (NOT (fsm_output(1))) AND (NOT (fsm_output(2))) AND and_dcpl_20;
  and_dcpl_142 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("00001011"));
  and_dcpl_149 <= (fsm_output(7)) AND (NOT (fsm_output(5))) AND and_dcpl_10 AND and_dcpl_12
      AND and_dcpl_20;
  and_dcpl_151 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_20;
  and_dcpl_154 <= and_dcpl_23 AND (fsm_output(4)) AND (NOT (fsm_output(0)));
  and_dcpl_155 <= and_dcpl_154 AND and_dcpl_151;
  and_dcpl_161 <= and_dcpl_9 AND (NOT (fsm_output(4))) AND (fsm_output(0)) AND and_dcpl_12
      AND (NOT (fsm_output(3))) AND (NOT (fsm_output(6)));
  and_dcpl_163 <= and_dcpl_9 AND and_dcpl_10 AND and_dcpl_151;
  and_dcpl_168 <= and_dcpl_23 AND and_dcpl_10 AND and_126_cse AND (fsm_output(3))
      AND (fsm_output(6));
  and_dcpl_170 <= and_dcpl_154 AND and_126_cse AND and_dcpl_20;
  mux_tmp <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  not_tmp_124 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_140 <= (fsm_output(5)) OR (NOT (fsm_output(0)));
  or_tmp_141 <= (NOT (fsm_output(5))) OR (fsm_output(0));
  or_tmp_143 <= (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(5)) OR (NOT
      (fsm_output(0)));
  mux_tmp_155 <= MUX_s_1_2_2((NOT or_tmp_141), (fsm_output(5)), modExp_base_1_sva(63));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_35_itm = '1' ) THEN
        p_sva <= p_rsci_idat;
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_14 AND and_dcpl_11) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
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
        reg_vec_rsc_triosy_obj_ld_cse <= '0';
        modExp_while_and_itm <= '0';
        modExp_while_and_1_itm <= '0';
        modExp_exp_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_obj_ld_cse <= and_dcpl_20 AND (NOT (fsm_output(2))) AND
            (fsm_output(1)) AND (NOT (fsm_output(0))) AND (fsm_output(4)) AND (fsm_output(5))
            AND (fsm_output(7)) AND (NOT STAGE_LOOP_acc_itm_2_1);
        modExp_while_and_itm <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_sva;
        modExp_while_and_1_itm <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_sva;
        modExp_exp_1_1_sva <= COMP_LOOP_mux1h_34_nl AND (NOT and_dcpl_107);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_9_2(z_out_3, modExp_while_if_mul_mut,
          modExp_while_mul_itm, modExp_1_while_if_mul_mut, modExp_1_while_mul_itm,
          COMP_LOOP_mul_mut, COMP_LOOP_acc_5_mut_mx0w7, COMP_LOOP_acc_5_mut, operator_64_false_acc_mut_63_0,
          STD_LOGIC_VECTOR'( modulo_result_or_nl & and_54_nl & and_57_nl & nor_72_nl
          & and_62_nl & mux_46_nl & and_dcpl_65 & and_70_nl & and_73_nl));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_2, (operator_64_false_acc_mut_64
          & operator_64_false_acc_mut_63_0), and_dcpl_74);
      reg_operator_66_true_div_cmp_b_reg <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_74);
      operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= z_out(9);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_55_nl, mux_tmp_50, fsm_output(7))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_141_nl = '0' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_145_nl, nor_102_nl, fsm_output(6))) = '1' ) THEN
        operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt(63 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_81 OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
        VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"), (z_out(11
            DOWNTO 0)), VEC_LOOP_j_sva_11_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_0_sva_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_151_nl, mux_150_nl, and_229_nl)) = '1' ) THEN
        COMP_LOOP_k_9_0_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (z_out_2(8
            DOWNTO 0)), nand_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_exp_1_0_sva OR modExp_while_and_itm OR modExp_while_and_1_itm
          OR modExp_result_sva_mx0c0 OR (NOT mux_80_nl)) AND (modExp_result_sva_mx0c0
          OR modExp_result_and_rgt OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modExp_base_1_sva, modulo_qr_sva_1_mx1w0, STD_LOGIC_VECTOR'( modExp_result_sva_mx0c0
            & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_base_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( mux_162_nl = '0' ) THEN
        modExp_base_1_sva <= MUX1HOT_v_64_5_2(r_sva, modulo_result_rem_cmp_z, modulo_5_mux_cse,
            modExp_result_sva, vec_rsci_qa_d, STD_LOGIC_VECTOR'( and_93_nl & (NOT
            mux_86_nl) & and_96_nl & and_dcpl_94 & and_99_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_5_mut <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_106_nl, (fsm_output(7)), fsm_output(6))) = '1' ) THEN
        COMP_LOOP_acc_5_mut <= MUX1HOT_v_64_3_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            vec_rsci_qa_d, COMP_LOOP_acc_5_mut_mx0w7, STD_LOGIC_VECTOR'( and_dcpl_81
            & and_dcpl_94 & and_dcpl_65));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_sva <= '0';
      ELSIF ( (NOT(mux_113_nl AND (NOT (fsm_output(7))))) = '1' ) THEN
        modExp_exp_1_0_sva <= MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z_oreg(0)),
            (COMP_LOOP_acc_5_mut(0)), (COMP_LOOP_k_9_0_sva_8_0(0)), modExp_exp_1_0_sva_1,
            STD_LOGIC_VECTOR'( COMP_LOOP_and_1_nl & and_dcpl_89 & and_dcpl_94 & and_dcpl_100));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_114_nl) AND and_dcpl_53)) = '1' ) THEN
        modExp_while_if_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_52 OR and_dcpl_104 OR and_dcpl_32) = '1' ) THEN
        exit_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_2(63))), (NOT (z_out_2(8))),
            (NOT (COMP_LOOP_acc_nl(9))), STD_LOGIC_VECTOR'( and_dcpl_52 & and_dcpl_104
            & and_dcpl_32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_28 OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(5))
          OR (fsm_output(7)))) = '1' ) THEN
        modExp_while_mul_itm <= modExp_while_mul_itm_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_28 OR or_dcpl_32)) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= z_out_2(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_sva_1 <= '0';
      ELSIF ( (mux_118_nl OR (fsm_output(7))) = '1' ) THEN
        modExp_exp_1_0_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(1)), modExp_exp_1_1_sva,
            and_dcpl_107);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_or_5_cse = '1' ) THEN
        modExp_exp_1_7_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(7)), modExp_exp_1_1_sva,
            and_dcpl_104);
        modExp_exp_1_6_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(6)), modExp_exp_1_7_sva,
            and_dcpl_104);
        modExp_exp_1_5_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(5)), modExp_exp_1_6_sva,
            and_dcpl_104);
        modExp_exp_1_4_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(4)), modExp_exp_1_5_sva,
            and_dcpl_104);
        modExp_exp_1_3_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(3)), modExp_exp_1_4_sva,
            and_dcpl_104);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_sva <= '0';
      ELSIF ( COMP_LOOP_or_5_cse = '1' ) THEN
        modExp_exp_1_2_sva <= MUX_s_1_2_2((COMP_LOOP_k_9_0_sva_8_0(2)), modExp_exp_1_3_sva,
            and_dcpl_104);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_133_nl OR (fsm_output(7))) = '1' ) THEN
        modExp_1_while_if_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(nand_18_cse OR (NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR
          or_127_cse)) = '1' ) THEN
        modExp_1_while_mul_itm <= modExp_while_mul_itm_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(2)))
          OR (NOT (fsm_output(1))) OR (fsm_output(0)) OR (fsm_output(4)) OR or_127_cse))
          = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_sva <= z_out(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_80 OR or_174_cse OR or_dcpl_32)) = '1' ) THEN
        COMP_LOOP_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  or_63_nl <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT (fsm_output(3)));
  mux_41_nl <= MUX_s_1_2_2(or_tmp_48, or_63_nl, fsm_output(1));
  modulo_result_or_nl <= and_dcpl_52 OR ((NOT mux_41_nl) AND and_dcpl_24);
  or_58_nl <= (fsm_output(4)) OR or_tmp_41;
  mux_39_nl <= MUX_s_1_2_2(not_tmp_47, or_58_nl, fsm_output(5));
  and_54_nl <= (NOT mux_39_nl) AND and_dcpl_53;
  nand_13_nl <= NOT(or_174_cse AND (fsm_output(3)));
  mux_40_nl <= MUX_s_1_2_2(or_tmp_41, nand_13_nl, fsm_output(4));
  and_57_nl <= mux_40_nl AND CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("001"));
  or_68_nl <= and_133_cse OR (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_42_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_68_nl, fsm_output(4));
  mux_43_nl <= MUX_s_1_2_2(mux_42_nl, or_tmp_50, fsm_output(5));
  nor_72_nl <= NOT(mux_43_nl OR (fsm_output(7)));
  and_130_nl <= (fsm_output(4)) AND (and_133_cse OR (fsm_output(3)));
  nor_57_nl <= NOT((fsm_output(4)) OR (CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))));
  mux_44_nl <= MUX_s_1_2_2(and_130_nl, nor_57_nl, fsm_output(5));
  and_62_nl <= mux_44_nl AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  mux_45_nl <= MUX_s_1_2_2(and_dcpl_30, (fsm_output(6)), or_75_cse);
  and_128_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND mux_45_nl;
  nor_56_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR
      and_129_cse OR (fsm_output(6)) OR (fsm_output(3)));
  mux_46_nl <= MUX_s_1_2_2(and_128_nl, nor_56_nl, fsm_output(7));
  and_127_nl <= or_75_cse AND (fsm_output(3));
  nand_11_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111")));
  mux_47_nl <= MUX_s_1_2_2(and_127_nl, nand_11_nl, fsm_output(4));
  and_70_nl <= mux_47_nl AND CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("100"));
  and_125_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"));
  nand_10_nl <= NOT((fsm_output(4)) AND (and_126_cse OR (fsm_output(3))));
  mux_48_nl <= MUX_s_1_2_2(and_125_nl, nand_10_nl, fsm_output(5));
  and_73_nl <= mux_48_nl AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  mux_121_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_tmp_80, and_133_cse);
  mux_122_nl <= MUX_s_1_2_2(mux_121_nl, or_tmp_118, fsm_output(4));
  mux_123_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), mux_122_nl, fsm_output(5));
  nor_69_nl <= NOT(mux_123_nl OR (fsm_output(7)));
  COMP_LOOP_mux1h_34_nl <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_0_sva_8_0(8)), modExp_exp_1_2_sva,
      modExp_exp_1_1_sva, STD_LOGIC_VECTOR'( and_dcpl_94 & and_dcpl_104 & nor_69_nl));
  nor_55_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 1)/=STD_LOGIC_VECTOR'("000000")));
  or_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(4))
      OR (fsm_output(5));
  nand_33_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      mux_tmp);
  nand_34_nl <= NOT(or_173_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  mux_138_nl <= MUX_s_1_2_2(nand_33_nl, nand_34_nl, fsm_output(2));
  mux_139_nl <= MUX_s_1_2_2(or_nl, mux_138_nl, fsm_output(3));
  mux_140_nl <= MUX_s_1_2_2(mux_139_nl, and_115_cse, fsm_output(6));
  mux_135_nl <= MUX_s_1_2_2(not_tmp_124, mux_tmp, or_173_cse);
  mux_136_nl <= MUX_s_1_2_2(not_tmp_124, mux_135_nl, fsm_output(2));
  mux_137_nl <= MUX_s_1_2_2(mux_136_nl, and_115_cse, fsm_output(3));
  or_185_nl <= (fsm_output(6)) OR mux_137_nl;
  mux_141_nl <= MUX_s_1_2_2(mux_140_nl, or_185_nl, fsm_output(7));
  or_195_nl <= (fsm_output(7)) OR (NOT (fsm_output(0))) OR (fsm_output(5));
  or_194_nl <= (NOT (fsm_output(7))) OR (fsm_output(0)) OR (fsm_output(5));
  mux_143_nl <= MUX_s_1_2_2(or_195_nl, or_194_nl, fsm_output(3));
  nor_98_nl <= NOT((fsm_output(2)) OR mux_143_nl);
  nor_99_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR
      (NOT (fsm_output(0))) OR (fsm_output(5)));
  mux_144_nl <= MUX_s_1_2_2(nor_98_nl, nor_99_nl, fsm_output(1));
  nor_100_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(3))) OR (fsm_output(7))
      OR nand_37_cse);
  nor_101_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(7)) OR
      nand_37_cse);
  mux_142_nl <= MUX_s_1_2_2(nor_100_nl, nor_101_nl, fsm_output(1));
  mux_145_nl <= MUX_s_1_2_2(mux_144_nl, mux_142_nl, fsm_output(4));
  nor_102_nl <= NOT((NOT modExp_exp_1_0_sva) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(1)))
      OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(0))
      OR (fsm_output(5)));
  nor_80_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(1))));
  and_151_nl <= (fsm_output(4)) AND (fsm_output(1));
  mux_68_nl <= MUX_s_1_2_2(nor_80_nl, and_151_nl, fsm_output(5));
  nor_81_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(1)));
  mux_69_nl <= MUX_s_1_2_2(mux_68_nl, nor_81_nl, fsm_output(7));
  nand_nl <= NOT(mux_69_nl AND and_dcpl_20 AND (NOT (fsm_output(2))) AND (fsm_output(0)));
  mux_151_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  or_199_nl <= (fsm_output(7)) OR (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))));
  mux_149_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_199_nl, fsm_output(6));
  mux_147_nl <= MUX_s_1_2_2((NOT (fsm_output(2))), or_75_cse, fsm_output(7));
  mux_148_nl <= MUX_s_1_2_2(mux_147_nl, (fsm_output(7)), fsm_output(6));
  mux_150_nl <= MUX_s_1_2_2(mux_149_nl, mux_148_nl, fsm_output(4));
  and_229_nl <= (fsm_output(5)) AND (fsm_output(3));
  nor_51_nl <= NOT((fsm_output(4)) OR mux_tmp_72);
  nor_52_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(1)) OR (NOT
      (fsm_output(2))) OR (fsm_output(6)) OR (fsm_output(3)));
  mux_79_nl <= MUX_s_1_2_2(nor_51_nl, nor_52_nl, fsm_output(5));
  mux_80_nl <= MUX_s_1_2_2(mux_79_nl, mux_tmp_50, fsm_output(7));
  and_93_nl <= and_dcpl_21 AND and_dcpl_76;
  or_112_nl <= (NOT (fsm_output(3))) OR (fsm_output(7)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (NOT (fsm_output(6)));
  or_119_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2));
  mux_92_nl <= MUX_s_1_2_2(nand_8_cse, or_119_nl, fsm_output(3));
  mux_85_nl <= MUX_s_1_2_2(or_112_nl, mux_92_nl, fsm_output(4));
  nand_1_nl <= NOT((fsm_output(5)) AND (NOT mux_85_nl));
  or_109_nl <= (fsm_output(3)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(2)))
      OR (NOT (fsm_output(1))) OR (fsm_output(6));
  or_108_nl <= (fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(1)) OR (NOT
      (fsm_output(6)));
  mux_81_nl <= MUX_s_1_2_2(or_108_nl, nand_8_cse, fsm_output(3));
  mux_82_nl <= MUX_s_1_2_2(or_109_nl, mux_81_nl, fsm_output(4));
  or_105_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(6));
  mux_83_nl <= MUX_s_1_2_2(mux_82_nl, or_105_nl, fsm_output(5));
  mux_86_nl <= MUX_s_1_2_2(nand_1_nl, mux_83_nl, fsm_output(0));
  nor_49_nl <= NOT((fsm_output(1)) OR (NOT((fsm_output(6)) AND (fsm_output(2)))));
  nor_50_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(6)));
  mux_87_nl <= MUX_s_1_2_2(nor_49_nl, nor_50_nl, fsm_output(4));
  and_96_nl <= mux_87_nl AND (fsm_output(3)) AND (fsm_output(0)) AND and_dcpl_23;
  and_99_nl <= and_dcpl_31 AND and_dcpl_95;
  nand_35_nl <= NOT((fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(5))
      AND (fsm_output(0)));
  nand_36_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      mux_tmp_155);
  mux_159_nl <= MUX_s_1_2_2(nand_36_nl, or_tmp_143, fsm_output(4));
  mux_160_nl <= MUX_s_1_2_2(nand_35_nl, mux_159_nl, fsm_output(6));
  mux_156_nl <= MUX_s_1_2_2(nand_37_cse, or_tmp_140, fsm_output(3));
  or_208_nl <= (fsm_output(2)) OR mux_156_nl;
  or_207_nl <= (fsm_output(2)) OR (NOT((fsm_output(3)) AND mux_tmp_155));
  mux_157_nl <= MUX_s_1_2_2(or_208_nl, or_207_nl, fsm_output(4));
  or_206_nl <= (fsm_output(4)) OR (NOT((fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(5))
      AND (fsm_output(0))));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, or_206_nl, fsm_output(6));
  mux_161_nl <= MUX_s_1_2_2(mux_160_nl, mux_158_nl, fsm_output(1));
  mux_153_nl <= MUX_s_1_2_2(or_tmp_141, or_tmp_140, fsm_output(3));
  nand_30_nl <= NOT((fsm_output(2)) AND (NOT mux_153_nl));
  mux_154_nl <= MUX_s_1_2_2(or_tmp_143, nand_30_nl, fsm_output(4));
  or_205_nl <= (NOT (fsm_output(1))) OR (fsm_output(6)) OR mux_154_nl;
  mux_162_nl <= MUX_s_1_2_2(mux_161_nl, or_205_nl, fsm_output(7));
  mux_105_nl <= MUX_s_1_2_2(mux_tmp_99, and_dcpl_16, fsm_output(4));
  mux_101_nl <= MUX_s_1_2_2(or_127_cse, mux_tmp_99, fsm_output(1));
  mux_102_nl <= MUX_s_1_2_2(mux_101_nl, and_dcpl_16, fsm_output(4));
  and_118_nl <= ((fsm_output(1)) OR (fsm_output(7))) AND (fsm_output(5));
  mux_100_nl <= MUX_s_1_2_2(mux_tmp_99, and_118_nl, fsm_output(4));
  mux_103_nl <= MUX_s_1_2_2(mux_102_nl, mux_100_nl, fsm_output(0));
  mux_97_nl <= MUX_s_1_2_2((fsm_output(5)), (fsm_output(7)), fsm_output(1));
  mux_98_nl <= MUX_s_1_2_2(and_dcpl_16, mux_97_nl, fsm_output(4));
  mux_104_nl <= MUX_s_1_2_2(mux_103_nl, mux_98_nl, fsm_output(2));
  mux_106_nl <= MUX_s_1_2_2(mux_105_nl, mux_104_nl, fsm_output(3));
  COMP_LOOP_and_1_nl <= (NOT and_dcpl_89) AND and_dcpl_81;
  or_130_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_112_nl <= MUX_s_1_2_2(mux_tmp_72, or_130_nl, fsm_output(4));
  mux_109_nl <= MUX_s_1_2_2(or_tmp_66, (fsm_output(6)), fsm_output(2));
  mux_108_nl <= MUX_s_1_2_2(and_dcpl_20, or_tmp_80, fsm_output(2));
  mux_110_nl <= MUX_s_1_2_2((NOT mux_109_nl), mux_108_nl, fsm_output(1));
  mux_111_nl <= MUX_s_1_2_2(mux_110_nl, nand_18_cse, fsm_output(4));
  mux_113_nl <= MUX_s_1_2_2(mux_112_nl, (NOT mux_111_nl), fsm_output(5));
  or_131_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"));
  mux_114_nl <= MUX_s_1_2_2(not_tmp_47, or_131_nl, fsm_output(5));
  COMP_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_2(9 DOWNTO 0)) +
      SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'( "0000000001"),
      10));
  or_150_nl <= and_126_cse OR (NOT (fsm_output(6))) OR (fsm_output(3));
  mux_117_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_150_nl, fsm_output(4));
  nand_27_nl <= NOT((fsm_output(4)) AND (fsm_output(1)) AND (fsm_output(2)) AND (NOT
      (fsm_output(6))) AND (fsm_output(3)));
  mux_118_nl <= MUX_s_1_2_2(mux_117_nl, nand_27_nl, fsm_output(5));
  mux_132_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), or_tmp_48, fsm_output(4));
  mux_133_nl <= MUX_s_1_2_2(mux_132_nl, or_tmp_50, fsm_output(5));
  operator_64_false_1_or_1_nl <= and_dcpl_122 OR and_dcpl_128;
  operator_64_false_1_mux_1_nl <= MUX_v_12_2_2((STD_LOGIC_VECTOR'( "111") & (NOT
      COMP_LOOP_k_9_0_sva_8_0)), VEC_LOOP_j_sva_11_0, operator_64_false_1_or_1_nl);
  and_231_nl <= and_dcpl_23 AND (fsm_output(4)) AND (NOT (fsm_output(0))) AND (NOT
      (fsm_output(1))) AND (fsm_output(2)) AND and_dcpl_20;
  operator_64_false_1_mux1h_1_nl <= MUX1HOT_v_10_3_2(STD_LOGIC_VECTOR'( "0000000001"),
      (z_out_1(9 DOWNTO 0)), STAGE_LOOP_lshift_psp_sva, STD_LOGIC_VECTOR'( and_231_nl
      & and_dcpl_122 & and_dcpl_128));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux_1_nl),
      13) + CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux1h_1_nl), 13), 13));
  COMP_LOOP_not_43_nl <= NOT and_dcpl_142;
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl <= NOT(MUX_v_54_2_2((operator_66_true_div_cmp_z_oreg(63
      DOWNTO 10)), STD_LOGIC_VECTOR'("111111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_not_43_nl));
  COMP_LOOP_mux_8_nl <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva, (NOT (operator_66_true_div_cmp_z_oreg(9
      DOWNTO 0))), and_dcpl_142);
  COMP_LOOP_mux_9_nl <= MUX_v_9_2_2(COMP_LOOP_k_9_0_sva_8_0, STD_LOGIC_VECTOR'( "000000001"),
      and_dcpl_142);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(and_dcpl_142 & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl
      & COMP_LOOP_mux_8_nl) + CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_9_nl), 65), 65));
  COMP_LOOP_mux1h_61_nl <= MUX1HOT_v_64_6_2(COMP_LOOP_acc_5_mut, (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000") & VEC_LOOP_j_sva_11_0),
      p_sva, ('1' & (NOT (operator_64_false_acc_mut_63_0(62 DOWNTO 0)))), (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000000") & COMP_LOOP_k_9_0_sva_8_0),
      (STD_LOGIC_VECTOR'( "11111111111111111111111111111111111111111111111111111111")
      & (NOT modExp_exp_1_1_sva) & (NOT modExp_exp_1_7_sva) & (NOT modExp_exp_1_6_sva)
      & (NOT modExp_exp_1_5_sva) & (NOT modExp_exp_1_4_sva) & (NOT modExp_exp_1_3_sva)
      & (NOT modExp_exp_1_2_sva) & (NOT modExp_exp_1_0_sva_1)), STD_LOGIC_VECTOR'(
      and_dcpl_149 & and_dcpl_155 & and_dcpl_161 & and_dcpl_163 & and_dcpl_168 &
      and_dcpl_170));
  COMP_LOOP_or_12_nl <= (NOT(and_dcpl_155 OR and_dcpl_161 OR and_dcpl_163 OR and_dcpl_168
      OR and_dcpl_170)) OR and_dcpl_149;
  COMP_LOOP_or_13_nl <= and_dcpl_163 OR and_dcpl_168 OR and_dcpl_170;
  COMP_LOOP_mux1h_62_nl <= MUX1HOT_v_64_3_2(modulo_5_mux_cse, (STD_LOGIC_VECTOR'(
      "1111111111111111111111111111111111111111111111111111111") & (NOT COMP_LOOP_k_9_0_sva_8_0)),
      STD_LOGIC_VECTOR'( "1111111111111111111111111111111111111111111111111111111111111110"),
      STD_LOGIC_VECTOR'( and_dcpl_149 & and_dcpl_155 & COMP_LOOP_or_13_nl));
  COMP_LOOP_not_45_nl <= NOT and_dcpl_161;
  COMP_LOOP_nand_1_nl <= NOT(MUX_v_64_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux1h_62_nl, COMP_LOOP_not_45_nl));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux1h_61_nl
      & COMP_LOOP_or_12_nl), 65), 66) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_nand_1_nl
      & '1'), 65), 66), 66));
  z_out_2 <= acc_2_nl(65 DOWNTO 1);
  and_233_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111"));
  nor_104_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  mux_163_nl <= MUX_s_1_2_2(and_233_nl, nor_104_nl, fsm_output(6));
  and_232_nl <= mux_163_nl AND (fsm_output(5)) AND (NOT (fsm_output(7))) AND (fsm_output(4))
      AND (NOT (fsm_output(0)));
  modExp_while_if_mux_1_nl <= MUX_v_64_2_2(modExp_result_sva, operator_64_false_acc_mut_63_0,
      and_232_nl);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux_1_nl)
      * UNSIGNED(modExp_base_1_sva)), 64));
END v3;

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
    vec_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsc_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_wea : OUT STD_LOGIC;
    vec_rsc_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIT;

ARCHITECTURE v3 OF inPlaceNTT_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL operator_66_true_div_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL vec_rsci_wea_d_iff : STD_LOGIC;

  SIGNAL operator_66_true_div_cmp_a_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_b_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsci_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_adra_d_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      r_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      vec_rsci_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      operator_66_true_div_cmp_a : OUT STD_LOGIC_VECTOR (64 DOWNTO 0);
      operator_66_true_div_cmp_b : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      operator_66_true_div_cmp_z : IN STD_LOGIC_VECTOR (64 DOWNTO 0);
      vec_rsci_wea_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_r_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsci_adra_d : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a : STD_LOGIC_VECTOR (64
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z : STD_LOGIC_VECTOR (64
      DOWNTO 0);

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

  vec_rsci : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_12_64_4096_4096_64_1_gen
    PORT MAP(
      qa => vec_rsci_qa,
      wea => vec_rsc_wea,
      da => vec_rsci_da,
      adra => vec_rsci_adra,
      adra_d => vec_rsci_adra_d_1,
      da_d => vec_rsci_da_d_1,
      qa_d => vec_rsci_qa_d_1,
      wea_d => vec_rsci_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsci_wea_d_iff
    );
  vec_rsci_qa <= vec_rsc_qa;
  vec_rsc_da <= vec_rsci_da;
  vec_rsc_adra <= vec_rsci_adra;
  vec_rsci_adra_d_1 <= vec_rsci_adra_d;
  vec_rsci_da_d_1 <= vec_rsci_da_d;
  vec_rsci_qa_d <= vec_rsci_qa_d_1;

  inPlaceNTT_DIT_core_inst : inPlaceNTT_DIT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => inPlaceNTT_DIT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_dat => inPlaceNTT_DIT_core_inst_r_rsc_dat,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      vec_rsci_adra_d => inPlaceNTT_DIT_core_inst_vec_rsci_adra_d,
      vec_rsci_da_d => inPlaceNTT_DIT_core_inst_vec_rsci_da_d,
      vec_rsci_qa_d => inPlaceNTT_DIT_core_inst_vec_rsci_qa_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      operator_66_true_div_cmp_a => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a,
      operator_66_true_div_cmp_b => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b,
      operator_66_true_div_cmp_z => inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z,
      vec_rsci_wea_d_pff => vec_rsci_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  vec_rsci_adra_d <= inPlaceNTT_DIT_core_inst_vec_rsci_adra_d;
  vec_rsci_da_d <= inPlaceNTT_DIT_core_inst_vec_rsci_da_d;
  inPlaceNTT_DIT_core_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  operator_66_true_div_cmp_a <= inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_a;
  operator_66_true_div_cmp_b <= inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_b;
  inPlaceNTT_DIT_core_inst_operator_66_true_div_cmp_z <= operator_66_true_div_cmp_z;

END v3;



