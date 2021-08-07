
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
--  Generated date: Wed May 19 22:57:42 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen;

ARCHITECTURE v31 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v31;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen;

ARCHITECTURE v31 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v31;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen;

ARCHITECTURE v31 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v31;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen;

ARCHITECTURE v31 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v31;

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
    STAGE_LOOP_C_8_tr0 : IN STD_LOGIC;
    modExp_while_C_38_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_62_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_124_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_62_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_124_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v31 OF inPlaceNTT_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  TYPE inPlaceNTT_DIT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, STAGE_LOOP_C_1,
      STAGE_LOOP_C_2, STAGE_LOOP_C_3, STAGE_LOOP_C_4, STAGE_LOOP_C_5, STAGE_LOOP_C_6,
      STAGE_LOOP_C_7, STAGE_LOOP_C_8, modExp_while_C_0, modExp_while_C_1, modExp_while_C_2,
      modExp_while_C_3, modExp_while_C_4, modExp_while_C_5, modExp_while_C_6, modExp_while_C_7,
      modExp_while_C_8, modExp_while_C_9, modExp_while_C_10, modExp_while_C_11, modExp_while_C_12,
      modExp_while_C_13, modExp_while_C_14, modExp_while_C_15, modExp_while_C_16,
      modExp_while_C_17, modExp_while_C_18, modExp_while_C_19, modExp_while_C_20,
      modExp_while_C_21, modExp_while_C_22, modExp_while_C_23, modExp_while_C_24,
      modExp_while_C_25, modExp_while_C_26, modExp_while_C_27, modExp_while_C_28,
      modExp_while_C_29, modExp_while_C_30, modExp_while_C_31, modExp_while_C_32,
      modExp_while_C_33, modExp_while_C_34, modExp_while_C_35, modExp_while_C_36,
      modExp_while_C_37, modExp_while_C_38, VEC_LOOP_1_COMP_LOOP_C_0, VEC_LOOP_1_COMP_LOOP_C_1,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38, VEC_LOOP_1_COMP_LOOP_C_2, VEC_LOOP_1_COMP_LOOP_C_3,
      VEC_LOOP_1_COMP_LOOP_C_4, VEC_LOOP_1_COMP_LOOP_C_5, VEC_LOOP_1_COMP_LOOP_C_6,
      VEC_LOOP_1_COMP_LOOP_C_7, VEC_LOOP_1_COMP_LOOP_C_8, VEC_LOOP_1_COMP_LOOP_C_9,
      VEC_LOOP_1_COMP_LOOP_C_10, VEC_LOOP_1_COMP_LOOP_C_11, VEC_LOOP_1_COMP_LOOP_C_12,
      VEC_LOOP_1_COMP_LOOP_C_13, VEC_LOOP_1_COMP_LOOP_C_14, VEC_LOOP_1_COMP_LOOP_C_15,
      VEC_LOOP_1_COMP_LOOP_C_16, VEC_LOOP_1_COMP_LOOP_C_17, VEC_LOOP_1_COMP_LOOP_C_18,
      VEC_LOOP_1_COMP_LOOP_C_19, VEC_LOOP_1_COMP_LOOP_C_20, VEC_LOOP_1_COMP_LOOP_C_21,
      VEC_LOOP_1_COMP_LOOP_C_22, VEC_LOOP_1_COMP_LOOP_C_23, VEC_LOOP_1_COMP_LOOP_C_24,
      VEC_LOOP_1_COMP_LOOP_C_25, VEC_LOOP_1_COMP_LOOP_C_26, VEC_LOOP_1_COMP_LOOP_C_27,
      VEC_LOOP_1_COMP_LOOP_C_28, VEC_LOOP_1_COMP_LOOP_C_29, VEC_LOOP_1_COMP_LOOP_C_30,
      VEC_LOOP_1_COMP_LOOP_C_31, VEC_LOOP_1_COMP_LOOP_C_32, VEC_LOOP_1_COMP_LOOP_C_33,
      VEC_LOOP_1_COMP_LOOP_C_34, VEC_LOOP_1_COMP_LOOP_C_35, VEC_LOOP_1_COMP_LOOP_C_36,
      VEC_LOOP_1_COMP_LOOP_C_37, VEC_LOOP_1_COMP_LOOP_C_38, VEC_LOOP_1_COMP_LOOP_C_39,
      VEC_LOOP_1_COMP_LOOP_C_40, VEC_LOOP_1_COMP_LOOP_C_41, VEC_LOOP_1_COMP_LOOP_C_42,
      VEC_LOOP_1_COMP_LOOP_C_43, VEC_LOOP_1_COMP_LOOP_C_44, VEC_LOOP_1_COMP_LOOP_C_45,
      VEC_LOOP_1_COMP_LOOP_C_46, VEC_LOOP_1_COMP_LOOP_C_47, VEC_LOOP_1_COMP_LOOP_C_48,
      VEC_LOOP_1_COMP_LOOP_C_49, VEC_LOOP_1_COMP_LOOP_C_50, VEC_LOOP_1_COMP_LOOP_C_51,
      VEC_LOOP_1_COMP_LOOP_C_52, VEC_LOOP_1_COMP_LOOP_C_53, VEC_LOOP_1_COMP_LOOP_C_54,
      VEC_LOOP_1_COMP_LOOP_C_55, VEC_LOOP_1_COMP_LOOP_C_56, VEC_LOOP_1_COMP_LOOP_C_57,
      VEC_LOOP_1_COMP_LOOP_C_58, VEC_LOOP_1_COMP_LOOP_C_59, VEC_LOOP_1_COMP_LOOP_C_60,
      VEC_LOOP_1_COMP_LOOP_C_61, VEC_LOOP_1_COMP_LOOP_C_62, VEC_LOOP_1_COMP_LOOP_C_63,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38, VEC_LOOP_1_COMP_LOOP_C_64, VEC_LOOP_1_COMP_LOOP_C_65,
      VEC_LOOP_1_COMP_LOOP_C_66, VEC_LOOP_1_COMP_LOOP_C_67, VEC_LOOP_1_COMP_LOOP_C_68,
      VEC_LOOP_1_COMP_LOOP_C_69, VEC_LOOP_1_COMP_LOOP_C_70, VEC_LOOP_1_COMP_LOOP_C_71,
      VEC_LOOP_1_COMP_LOOP_C_72, VEC_LOOP_1_COMP_LOOP_C_73, VEC_LOOP_1_COMP_LOOP_C_74,
      VEC_LOOP_1_COMP_LOOP_C_75, VEC_LOOP_1_COMP_LOOP_C_76, VEC_LOOP_1_COMP_LOOP_C_77,
      VEC_LOOP_1_COMP_LOOP_C_78, VEC_LOOP_1_COMP_LOOP_C_79, VEC_LOOP_1_COMP_LOOP_C_80,
      VEC_LOOP_1_COMP_LOOP_C_81, VEC_LOOP_1_COMP_LOOP_C_82, VEC_LOOP_1_COMP_LOOP_C_83,
      VEC_LOOP_1_COMP_LOOP_C_84, VEC_LOOP_1_COMP_LOOP_C_85, VEC_LOOP_1_COMP_LOOP_C_86,
      VEC_LOOP_1_COMP_LOOP_C_87, VEC_LOOP_1_COMP_LOOP_C_88, VEC_LOOP_1_COMP_LOOP_C_89,
      VEC_LOOP_1_COMP_LOOP_C_90, VEC_LOOP_1_COMP_LOOP_C_91, VEC_LOOP_1_COMP_LOOP_C_92,
      VEC_LOOP_1_COMP_LOOP_C_93, VEC_LOOP_1_COMP_LOOP_C_94, VEC_LOOP_1_COMP_LOOP_C_95,
      VEC_LOOP_1_COMP_LOOP_C_96, VEC_LOOP_1_COMP_LOOP_C_97, VEC_LOOP_1_COMP_LOOP_C_98,
      VEC_LOOP_1_COMP_LOOP_C_99, VEC_LOOP_1_COMP_LOOP_C_100, VEC_LOOP_1_COMP_LOOP_C_101,
      VEC_LOOP_1_COMP_LOOP_C_102, VEC_LOOP_1_COMP_LOOP_C_103, VEC_LOOP_1_COMP_LOOP_C_104,
      VEC_LOOP_1_COMP_LOOP_C_105, VEC_LOOP_1_COMP_LOOP_C_106, VEC_LOOP_1_COMP_LOOP_C_107,
      VEC_LOOP_1_COMP_LOOP_C_108, VEC_LOOP_1_COMP_LOOP_C_109, VEC_LOOP_1_COMP_LOOP_C_110,
      VEC_LOOP_1_COMP_LOOP_C_111, VEC_LOOP_1_COMP_LOOP_C_112, VEC_LOOP_1_COMP_LOOP_C_113,
      VEC_LOOP_1_COMP_LOOP_C_114, VEC_LOOP_1_COMP_LOOP_C_115, VEC_LOOP_1_COMP_LOOP_C_116,
      VEC_LOOP_1_COMP_LOOP_C_117, VEC_LOOP_1_COMP_LOOP_C_118, VEC_LOOP_1_COMP_LOOP_C_119,
      VEC_LOOP_1_COMP_LOOP_C_120, VEC_LOOP_1_COMP_LOOP_C_121, VEC_LOOP_1_COMP_LOOP_C_122,
      VEC_LOOP_1_COMP_LOOP_C_123, VEC_LOOP_1_COMP_LOOP_C_124, VEC_LOOP_C_0, VEC_LOOP_2_COMP_LOOP_C_0,
      VEC_LOOP_2_COMP_LOOP_C_1, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_2, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_3,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_4, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_5,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_6, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_7,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_8, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_9,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_10, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_11,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_12, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_13,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_14, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_15,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_16, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_17,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_18, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_19,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_20, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_21,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_22, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_23,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_24, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_25,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_26, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_27,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_28, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_29,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_30, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_31,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_32, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_33,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_34, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_35,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_36, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_37,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38, VEC_LOOP_2_COMP_LOOP_C_2, VEC_LOOP_2_COMP_LOOP_C_3,
      VEC_LOOP_2_COMP_LOOP_C_4, VEC_LOOP_2_COMP_LOOP_C_5, VEC_LOOP_2_COMP_LOOP_C_6,
      VEC_LOOP_2_COMP_LOOP_C_7, VEC_LOOP_2_COMP_LOOP_C_8, VEC_LOOP_2_COMP_LOOP_C_9,
      VEC_LOOP_2_COMP_LOOP_C_10, VEC_LOOP_2_COMP_LOOP_C_11, VEC_LOOP_2_COMP_LOOP_C_12,
      VEC_LOOP_2_COMP_LOOP_C_13, VEC_LOOP_2_COMP_LOOP_C_14, VEC_LOOP_2_COMP_LOOP_C_15,
      VEC_LOOP_2_COMP_LOOP_C_16, VEC_LOOP_2_COMP_LOOP_C_17, VEC_LOOP_2_COMP_LOOP_C_18,
      VEC_LOOP_2_COMP_LOOP_C_19, VEC_LOOP_2_COMP_LOOP_C_20, VEC_LOOP_2_COMP_LOOP_C_21,
      VEC_LOOP_2_COMP_LOOP_C_22, VEC_LOOP_2_COMP_LOOP_C_23, VEC_LOOP_2_COMP_LOOP_C_24,
      VEC_LOOP_2_COMP_LOOP_C_25, VEC_LOOP_2_COMP_LOOP_C_26, VEC_LOOP_2_COMP_LOOP_C_27,
      VEC_LOOP_2_COMP_LOOP_C_28, VEC_LOOP_2_COMP_LOOP_C_29, VEC_LOOP_2_COMP_LOOP_C_30,
      VEC_LOOP_2_COMP_LOOP_C_31, VEC_LOOP_2_COMP_LOOP_C_32, VEC_LOOP_2_COMP_LOOP_C_33,
      VEC_LOOP_2_COMP_LOOP_C_34, VEC_LOOP_2_COMP_LOOP_C_35, VEC_LOOP_2_COMP_LOOP_C_36,
      VEC_LOOP_2_COMP_LOOP_C_37, VEC_LOOP_2_COMP_LOOP_C_38, VEC_LOOP_2_COMP_LOOP_C_39,
      VEC_LOOP_2_COMP_LOOP_C_40, VEC_LOOP_2_COMP_LOOP_C_41, VEC_LOOP_2_COMP_LOOP_C_42,
      VEC_LOOP_2_COMP_LOOP_C_43, VEC_LOOP_2_COMP_LOOP_C_44, VEC_LOOP_2_COMP_LOOP_C_45,
      VEC_LOOP_2_COMP_LOOP_C_46, VEC_LOOP_2_COMP_LOOP_C_47, VEC_LOOP_2_COMP_LOOP_C_48,
      VEC_LOOP_2_COMP_LOOP_C_49, VEC_LOOP_2_COMP_LOOP_C_50, VEC_LOOP_2_COMP_LOOP_C_51,
      VEC_LOOP_2_COMP_LOOP_C_52, VEC_LOOP_2_COMP_LOOP_C_53, VEC_LOOP_2_COMP_LOOP_C_54,
      VEC_LOOP_2_COMP_LOOP_C_55, VEC_LOOP_2_COMP_LOOP_C_56, VEC_LOOP_2_COMP_LOOP_C_57,
      VEC_LOOP_2_COMP_LOOP_C_58, VEC_LOOP_2_COMP_LOOP_C_59, VEC_LOOP_2_COMP_LOOP_C_60,
      VEC_LOOP_2_COMP_LOOP_C_61, VEC_LOOP_2_COMP_LOOP_C_62, VEC_LOOP_2_COMP_LOOP_C_63,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_2, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_3,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_4, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_5,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_6, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_7,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_8, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_9,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_10, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_11,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_12, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_13,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_14, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_15,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_16, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_17,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_18, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_19,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_20, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_21,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_22, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_23,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_24, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_25,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_26, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_27,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_28, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_29,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_30, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_31,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_32, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_33,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_34, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_35,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_36, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_37,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38, VEC_LOOP_2_COMP_LOOP_C_64, VEC_LOOP_2_COMP_LOOP_C_65,
      VEC_LOOP_2_COMP_LOOP_C_66, VEC_LOOP_2_COMP_LOOP_C_67, VEC_LOOP_2_COMP_LOOP_C_68,
      VEC_LOOP_2_COMP_LOOP_C_69, VEC_LOOP_2_COMP_LOOP_C_70, VEC_LOOP_2_COMP_LOOP_C_71,
      VEC_LOOP_2_COMP_LOOP_C_72, VEC_LOOP_2_COMP_LOOP_C_73, VEC_LOOP_2_COMP_LOOP_C_74,
      VEC_LOOP_2_COMP_LOOP_C_75, VEC_LOOP_2_COMP_LOOP_C_76, VEC_LOOP_2_COMP_LOOP_C_77,
      VEC_LOOP_2_COMP_LOOP_C_78, VEC_LOOP_2_COMP_LOOP_C_79, VEC_LOOP_2_COMP_LOOP_C_80,
      VEC_LOOP_2_COMP_LOOP_C_81, VEC_LOOP_2_COMP_LOOP_C_82, VEC_LOOP_2_COMP_LOOP_C_83,
      VEC_LOOP_2_COMP_LOOP_C_84, VEC_LOOP_2_COMP_LOOP_C_85, VEC_LOOP_2_COMP_LOOP_C_86,
      VEC_LOOP_2_COMP_LOOP_C_87, VEC_LOOP_2_COMP_LOOP_C_88, VEC_LOOP_2_COMP_LOOP_C_89,
      VEC_LOOP_2_COMP_LOOP_C_90, VEC_LOOP_2_COMP_LOOP_C_91, VEC_LOOP_2_COMP_LOOP_C_92,
      VEC_LOOP_2_COMP_LOOP_C_93, VEC_LOOP_2_COMP_LOOP_C_94, VEC_LOOP_2_COMP_LOOP_C_95,
      VEC_LOOP_2_COMP_LOOP_C_96, VEC_LOOP_2_COMP_LOOP_C_97, VEC_LOOP_2_COMP_LOOP_C_98,
      VEC_LOOP_2_COMP_LOOP_C_99, VEC_LOOP_2_COMP_LOOP_C_100, VEC_LOOP_2_COMP_LOOP_C_101,
      VEC_LOOP_2_COMP_LOOP_C_102, VEC_LOOP_2_COMP_LOOP_C_103, VEC_LOOP_2_COMP_LOOP_C_104,
      VEC_LOOP_2_COMP_LOOP_C_105, VEC_LOOP_2_COMP_LOOP_C_106, VEC_LOOP_2_COMP_LOOP_C_107,
      VEC_LOOP_2_COMP_LOOP_C_108, VEC_LOOP_2_COMP_LOOP_C_109, VEC_LOOP_2_COMP_LOOP_C_110,
      VEC_LOOP_2_COMP_LOOP_C_111, VEC_LOOP_2_COMP_LOOP_C_112, VEC_LOOP_2_COMP_LOOP_C_113,
      VEC_LOOP_2_COMP_LOOP_C_114, VEC_LOOP_2_COMP_LOOP_C_115, VEC_LOOP_2_COMP_LOOP_C_116,
      VEC_LOOP_2_COMP_LOOP_C_117, VEC_LOOP_2_COMP_LOOP_C_118, VEC_LOOP_2_COMP_LOOP_C_119,
      VEC_LOOP_2_COMP_LOOP_C_120, VEC_LOOP_2_COMP_LOOP_C_121, VEC_LOOP_2_COMP_LOOP_C_122,
      VEC_LOOP_2_COMP_LOOP_C_123, VEC_LOOP_2_COMP_LOOP_C_124, VEC_LOOP_C_1, STAGE_LOOP_C_9,
      main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_8_tr0, modExp_while_C_38_tr0,
      VEC_LOOP_1_COMP_LOOP_C_1_tr0, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38_tr0,
      VEC_LOOP_1_COMP_LOOP_C_62_tr0, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0,
      VEC_LOOP_1_COMP_LOOP_C_124_tr0, VEC_LOOP_C_0_tr0, VEC_LOOP_2_COMP_LOOP_C_1_tr0,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38_tr0, VEC_LOOP_2_COMP_LOOP_C_62_tr0,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0, VEC_LOOP_2_COMP_LOOP_C_124_tr0,
      VEC_LOOP_C_1_tr0, STAGE_LOOP_C_9_tr0, state_var)
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
        IF ( STAGE_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        IF ( modExp_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        IF ( VEC_LOOP_1_COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        IF ( VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_39;
      WHEN VEC_LOOP_1_COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_40;
      WHEN VEC_LOOP_1_COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_41;
      WHEN VEC_LOOP_1_COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_42;
      WHEN VEC_LOOP_1_COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_43;
      WHEN VEC_LOOP_1_COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_44;
      WHEN VEC_LOOP_1_COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_45;
      WHEN VEC_LOOP_1_COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_46;
      WHEN VEC_LOOP_1_COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_47;
      WHEN VEC_LOOP_1_COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_48;
      WHEN VEC_LOOP_1_COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_49;
      WHEN VEC_LOOP_1_COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_50;
      WHEN VEC_LOOP_1_COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_51;
      WHEN VEC_LOOP_1_COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_52;
      WHEN VEC_LOOP_1_COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_53;
      WHEN VEC_LOOP_1_COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_54;
      WHEN VEC_LOOP_1_COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_55;
      WHEN VEC_LOOP_1_COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_56;
      WHEN VEC_LOOP_1_COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_57;
      WHEN VEC_LOOP_1_COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_58;
      WHEN VEC_LOOP_1_COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_59;
      WHEN VEC_LOOP_1_COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_60;
      WHEN VEC_LOOP_1_COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_61;
      WHEN VEC_LOOP_1_COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_62;
      WHEN VEC_LOOP_1_COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        IF ( VEC_LOOP_1_COMP_LOOP_C_62_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_63;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        IF ( VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_64;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_65;
      WHEN VEC_LOOP_1_COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_66;
      WHEN VEC_LOOP_1_COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_67;
      WHEN VEC_LOOP_1_COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_68;
      WHEN VEC_LOOP_1_COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_69;
      WHEN VEC_LOOP_1_COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_70;
      WHEN VEC_LOOP_1_COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_71;
      WHEN VEC_LOOP_1_COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_72;
      WHEN VEC_LOOP_1_COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_73;
      WHEN VEC_LOOP_1_COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_74;
      WHEN VEC_LOOP_1_COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_75;
      WHEN VEC_LOOP_1_COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_76;
      WHEN VEC_LOOP_1_COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_77;
      WHEN VEC_LOOP_1_COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_78;
      WHEN VEC_LOOP_1_COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_79;
      WHEN VEC_LOOP_1_COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_80;
      WHEN VEC_LOOP_1_COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_81;
      WHEN VEC_LOOP_1_COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_82;
      WHEN VEC_LOOP_1_COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_83;
      WHEN VEC_LOOP_1_COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_84;
      WHEN VEC_LOOP_1_COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_85;
      WHEN VEC_LOOP_1_COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_86;
      WHEN VEC_LOOP_1_COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_87;
      WHEN VEC_LOOP_1_COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_88;
      WHEN VEC_LOOP_1_COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_89;
      WHEN VEC_LOOP_1_COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_90;
      WHEN VEC_LOOP_1_COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_91;
      WHEN VEC_LOOP_1_COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_92;
      WHEN VEC_LOOP_1_COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_93;
      WHEN VEC_LOOP_1_COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_94;
      WHEN VEC_LOOP_1_COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_95;
      WHEN VEC_LOOP_1_COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_96;
      WHEN VEC_LOOP_1_COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_97;
      WHEN VEC_LOOP_1_COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_98;
      WHEN VEC_LOOP_1_COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_99;
      WHEN VEC_LOOP_1_COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_100;
      WHEN VEC_LOOP_1_COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_101;
      WHEN VEC_LOOP_1_COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_102;
      WHEN VEC_LOOP_1_COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_103;
      WHEN VEC_LOOP_1_COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_104;
      WHEN VEC_LOOP_1_COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_105;
      WHEN VEC_LOOP_1_COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_106;
      WHEN VEC_LOOP_1_COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_107;
      WHEN VEC_LOOP_1_COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_108;
      WHEN VEC_LOOP_1_COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_109;
      WHEN VEC_LOOP_1_COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_110;
      WHEN VEC_LOOP_1_COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_111;
      WHEN VEC_LOOP_1_COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_112;
      WHEN VEC_LOOP_1_COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_113;
      WHEN VEC_LOOP_1_COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_114;
      WHEN VEC_LOOP_1_COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_115;
      WHEN VEC_LOOP_1_COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_116;
      WHEN VEC_LOOP_1_COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_117;
      WHEN VEC_LOOP_1_COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_118;
      WHEN VEC_LOOP_1_COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_119;
      WHEN VEC_LOOP_1_COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_120;
      WHEN VEC_LOOP_1_COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_121;
      WHEN VEC_LOOP_1_COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_122;
      WHEN VEC_LOOP_1_COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_123;
      WHEN VEC_LOOP_1_COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_124;
      WHEN VEC_LOOP_1_COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        IF ( VEC_LOOP_1_COMP_LOOP_C_124_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_9;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        IF ( VEC_LOOP_2_COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_2;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        IF ( VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_39;
      WHEN VEC_LOOP_2_COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_40;
      WHEN VEC_LOOP_2_COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_41;
      WHEN VEC_LOOP_2_COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_42;
      WHEN VEC_LOOP_2_COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_43;
      WHEN VEC_LOOP_2_COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_44;
      WHEN VEC_LOOP_2_COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_45;
      WHEN VEC_LOOP_2_COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_46;
      WHEN VEC_LOOP_2_COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_47;
      WHEN VEC_LOOP_2_COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_48;
      WHEN VEC_LOOP_2_COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_49;
      WHEN VEC_LOOP_2_COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_50;
      WHEN VEC_LOOP_2_COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_51;
      WHEN VEC_LOOP_2_COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_52;
      WHEN VEC_LOOP_2_COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_53;
      WHEN VEC_LOOP_2_COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_54;
      WHEN VEC_LOOP_2_COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_55;
      WHEN VEC_LOOP_2_COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_56;
      WHEN VEC_LOOP_2_COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_57;
      WHEN VEC_LOOP_2_COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_58;
      WHEN VEC_LOOP_2_COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_59;
      WHEN VEC_LOOP_2_COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_60;
      WHEN VEC_LOOP_2_COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_61;
      WHEN VEC_LOOP_2_COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_62;
      WHEN VEC_LOOP_2_COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100010");
        IF ( VEC_LOOP_2_COMP_LOOP_C_62_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_1;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_63;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_2;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001010");
        IF ( VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_64;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_65;
      WHEN VEC_LOOP_2_COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_66;
      WHEN VEC_LOOP_2_COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_67;
      WHEN VEC_LOOP_2_COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_68;
      WHEN VEC_LOOP_2_COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_69;
      WHEN VEC_LOOP_2_COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_70;
      WHEN VEC_LOOP_2_COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_71;
      WHEN VEC_LOOP_2_COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_72;
      WHEN VEC_LOOP_2_COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_73;
      WHEN VEC_LOOP_2_COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_74;
      WHEN VEC_LOOP_2_COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_75;
      WHEN VEC_LOOP_2_COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_76;
      WHEN VEC_LOOP_2_COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_77;
      WHEN VEC_LOOP_2_COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_78;
      WHEN VEC_LOOP_2_COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_79;
      WHEN VEC_LOOP_2_COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_80;
      WHEN VEC_LOOP_2_COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_81;
      WHEN VEC_LOOP_2_COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_82;
      WHEN VEC_LOOP_2_COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_83;
      WHEN VEC_LOOP_2_COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_84;
      WHEN VEC_LOOP_2_COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_85;
      WHEN VEC_LOOP_2_COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_86;
      WHEN VEC_LOOP_2_COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_87;
      WHEN VEC_LOOP_2_COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_88;
      WHEN VEC_LOOP_2_COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_89;
      WHEN VEC_LOOP_2_COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_90;
      WHEN VEC_LOOP_2_COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_91;
      WHEN VEC_LOOP_2_COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_92;
      WHEN VEC_LOOP_2_COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_93;
      WHEN VEC_LOOP_2_COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_94;
      WHEN VEC_LOOP_2_COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_95;
      WHEN VEC_LOOP_2_COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_96;
      WHEN VEC_LOOP_2_COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_97;
      WHEN VEC_LOOP_2_COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_98;
      WHEN VEC_LOOP_2_COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_99;
      WHEN VEC_LOOP_2_COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_100;
      WHEN VEC_LOOP_2_COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_101;
      WHEN VEC_LOOP_2_COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_102;
      WHEN VEC_LOOP_2_COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_103;
      WHEN VEC_LOOP_2_COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_104;
      WHEN VEC_LOOP_2_COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_105;
      WHEN VEC_LOOP_2_COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_106;
      WHEN VEC_LOOP_2_COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_107;
      WHEN VEC_LOOP_2_COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_108;
      WHEN VEC_LOOP_2_COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_109;
      WHEN VEC_LOOP_2_COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_110;
      WHEN VEC_LOOP_2_COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_111;
      WHEN VEC_LOOP_2_COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_112;
      WHEN VEC_LOOP_2_COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_113;
      WHEN VEC_LOOP_2_COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_114;
      WHEN VEC_LOOP_2_COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_115;
      WHEN VEC_LOOP_2_COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_116;
      WHEN VEC_LOOP_2_COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_117;
      WHEN VEC_LOOP_2_COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_118;
      WHEN VEC_LOOP_2_COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_119;
      WHEN VEC_LOOP_2_COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_120;
      WHEN VEC_LOOP_2_COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_121;
      WHEN VEC_LOOP_2_COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_122;
      WHEN VEC_LOOP_2_COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_123;
      WHEN VEC_LOOP_2_COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_124;
      WHEN VEC_LOOP_2_COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000111");
        IF ( VEC_LOOP_2_COMP_LOOP_C_124_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_1;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001000");
        IF ( VEC_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_9;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001001");
        IF ( STAGE_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001010");
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

END v31;

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
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
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
    vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_2_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_3_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v31 OF inPlaceNTT_DIT_core IS
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
  SIGNAL not_tmp_20 : STD_LOGIC;
  SIGNAL not_tmp_38 : STD_LOGIC;
  SIGNAL mux_tmp_40 : STD_LOGIC;
  SIGNAL or_tmp_69 : STD_LOGIC;
  SIGNAL or_tmp_93 : STD_LOGIC;
  SIGNAL and_tmp_7 : STD_LOGIC;
  SIGNAL mux_tmp_94 : STD_LOGIC;
  SIGNAL mux_tmp_95 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL mux_tmp_103 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL not_tmp_92 : STD_LOGIC;
  SIGNAL not_tmp_109 : STD_LOGIC;
  SIGNAL nor_tmp_48 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL or_tmp_242 : STD_LOGIC;
  SIGNAL nor_tmp_51 : STD_LOGIC;
  SIGNAL or_tmp_244 : STD_LOGIC;
  SIGNAL mux_tmp_168 : STD_LOGIC;
  SIGNAL or_tmp_245 : STD_LOGIC;
  SIGNAL or_tmp_247 : STD_LOGIC;
  SIGNAL mux_tmp_174 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL or_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL or_tmp_251 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_195 : STD_LOGIC;
  SIGNAL or_tmp_254 : STD_LOGIC;
  SIGNAL or_tmp_255 : STD_LOGIC;
  SIGNAL or_tmp_277 : STD_LOGIC;
  SIGNAL not_tmp_156 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL or_tmp_305 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL or_tmp_351 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL not_tmp_197 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL not_tmp_208 : STD_LOGIC;
  SIGNAL or_tmp_398 : STD_LOGIC;
  SIGNAL mux_tmp_341 : STD_LOGIC;
  SIGNAL nor_tmp_97 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL not_tmp_236 : STD_LOGIC;
  SIGNAL or_tmp_417 : STD_LOGIC;
  SIGNAL nor_tmp_103 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL not_tmp_252 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL nor_tmp_118 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL or_tmp_523 : STD_LOGIC;
  SIGNAL or_tmp_524 : STD_LOGIC;
  SIGNAL mux_tmp_466 : STD_LOGIC;
  SIGNAL mux_tmp_476 : STD_LOGIC;
  SIGNAL not_tmp_310 : STD_LOGIC;
  SIGNAL exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      : STD_LOGIC;
  SIGNAL VEC_LOOP_j_1_12_0_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_1_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_1_1_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL reg_VEC_LOOP_1_acc_1_psp_ftd_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_123_m1c : STD_LOGIC;
  SIGNAL and_138_m1c : STD_LOGIC;
  SIGNAL and_98_m1c : STD_LOGIC;
  SIGNAL and_102_m1c : STD_LOGIC;
  SIGNAL and_251_cse : STD_LOGIC;
  SIGNAL nor_259_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_3_obj_ld_cse : STD_LOGIC;
  SIGNAL or_605_cse : STD_LOGIC;
  SIGNAL and_231_cse : STD_LOGIC;
  SIGNAL or_610_cse : STD_LOGIC;
  SIGNAL nor_217_cse : STD_LOGIC;
  SIGNAL and_230_cse : STD_LOGIC;
  SIGNAL nor_161_cse : STD_LOGIC;
  SIGNAL and_273_cse : STD_LOGIC;
  SIGNAL or_621_cse : STD_LOGIC;
  SIGNAL and_206_cse : STD_LOGIC;
  SIGNAL and_187_cse : STD_LOGIC;
  SIGNAL or_603_cse : STD_LOGIC;
  SIGNAL and_182_cse : STD_LOGIC;
  SIGNAL or_604_cse : STD_LOGIC;
  SIGNAL and_224_cse : STD_LOGIC;
  SIGNAL or_619_cse : STD_LOGIC;
  SIGNAL and_196_cse : STD_LOGIC;
  SIGNAL and_266_cse : STD_LOGIC;
  SIGNAL mux_106_cse : STD_LOGIC;
  SIGNAL mux_136_cse : STD_LOGIC;
  SIGNAL or_298_cse : STD_LOGIC;
  SIGNAL and_215_cse : STD_LOGIC;
  SIGNAL or_95_cse : STD_LOGIC;
  SIGNAL or_581_cse : STD_LOGIC;
  SIGNAL mux_63_cse : STD_LOGIC;
  SIGNAL mux_68_cse : STD_LOGIC;
  SIGNAL or_280_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_1_itm_mx1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_96_itm : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL or_tmp_550 : STD_LOGIC;
  SIGNAL not_tmp_321 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_160 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_169 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL nor_tmp_146 : STD_LOGIC;
  SIGNAL not_tmp_368 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_7_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL COMP_LOOP_mux1h_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_1_12_0_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w11 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
      : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
      : STD_LOGIC;
  SIGNAL modExp_while_and_3 : STD_LOGIC;
  SIGNAL modExp_while_and_5 : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL and_379_ssc : STD_LOGIC;
  SIGNAL and_387_ssc : STD_LOGIC;
  SIGNAL and_392_ssc : STD_LOGIC;
  SIGNAL and_396_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_or_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL mux_462_cse : STD_LOGIC;
  SIGNAL nand_86_cse : STD_LOGIC;
  SIGNAL and_220_cse : STD_LOGIC;
  SIGNAL or_303_cse : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL or_tmp_586 : STD_LOGIC;
  SIGNAL or_tmp_598 : STD_LOGIC;
  SIGNAL or_tmp_600 : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_2_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL not_tmp_395 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_226_cse : STD_LOGIC;
  SIGNAL or_674_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_3_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_24_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_25_itm : STD_LOGIC;
  SIGNAL and_434_cse : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL nor_212_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL nand_89_nl : STD_LOGIC;
  SIGNAL or_294_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL and_228_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL nor_215_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL nor_219_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL or_269_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL or_266_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL or_286_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL and_229_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL or_281_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL nand_99_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL and_221_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL nand_101_nl : STD_LOGIC;
  SIGNAL or_308_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL or_306_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL or_304_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_if_or_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL nor_154_nl : STD_LOGIC;
  SIGNAL nor_155_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL or_588_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_156_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_1_nl : STD_LOGIC;
  SIGNAL and_80_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL or_628_nl : STD_LOGIC;
  SIGNAL mux_269_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL or_629_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL or_471_nl : STD_LOGIC;
  SIGNAL and_85_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL or_338_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL nor_201_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL or_474_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL and_214_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL or_19_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL or_329_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL or_684_nl : STD_LOGIC;
  SIGNAL and_425_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL nand_128_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL and_426_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL and_427_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL and_428_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL and_429_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL and_430_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL or_676_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL and_431_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL mux_548_nl : STD_LOGIC;
  SIGNAL mux_547_nl : STD_LOGIC;
  SIGNAL mux_546_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL mux_545_nl : STD_LOGIC;
  SIGNAL nand_125_nl : STD_LOGIC;
  SIGNAL mux_544_nl : STD_LOGIC;
  SIGNAL and_421_nl : STD_LOGIC;
  SIGNAL mux_543_nl : STD_LOGIC;
  SIGNAL or_700_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL and_422_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL or_697_nl : STD_LOGIC;
  SIGNAL and_423_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL and_415_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL and_424_nl : STD_LOGIC;
  SIGNAL mux_539_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL mux_538_nl : STD_LOGIC;
  SIGNAL nand_118_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL mux_535_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL or_372_nl : STD_LOGIC;
  SIGNAL mux_552_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL and_417_nl : STD_LOGIC;
  SIGNAL mux_551_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL and_418_nl : STD_LOGIC;
  SIGNAL and_419_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL and_100_nl : STD_LOGIC;
  SIGNAL r_or_nl : STD_LOGIC;
  SIGNAL r_or_1_nl : STD_LOGIC;
  SIGNAL and_105_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL and_109_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL nor_301_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL nor_302_nl : STD_LOGIC;
  SIGNAL nor_303_nl : STD_LOGIC;
  SIGNAL or_620_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL or_32_nl : STD_LOGIC;
  SIGNAL or_30_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL or_593_nl : STD_LOGIC;
  SIGNAL or_594_nl : STD_LOGIC;
  SIGNAL nand_51_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL or_595_nl : STD_LOGIC;
  SIGNAL nand_53_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL nand_54_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL nand_55_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL nor_182_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL or_426_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL or_424_nl : STD_LOGIC;
  SIGNAL or_104_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL mux_328_nl : STD_LOGIC;
  SIGNAL nand_87_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL or_418_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_4_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL mux_379_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL and_189_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL and_191_nl : STD_LOGIC;
  SIGNAL mux_373_nl : STD_LOGIC;
  SIGNAL mux_372_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL or_440_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_11_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL and_288_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL or_592_nl : STD_LOGIC;
  SIGNAL nor_165_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL and_186_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL or_463_nl : STD_LOGIC;
  SIGNAL mux_392_nl : STD_LOGIC;
  SIGNAL nor_168_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL or_459_nl : STD_LOGIC;
  SIGNAL mux_388_nl : STD_LOGIC;
  SIGNAL or_458_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL or_457_nl : STD_LOGIC;
  SIGNAL or_455_nl : STD_LOGIC;
  SIGNAL nand_49_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_acc_11_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL nor_330_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL or_506_nl : STD_LOGIC;
  SIGNAL or_505_nl : STD_LOGIC;
  SIGNAL or_504_nl : STD_LOGIC;
  SIGNAL nor_331_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL or_499_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_88_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL and_175_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL and_177_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL nor_147_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL and_172_nl : STD_LOGIC;
  SIGNAL nor_148_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL or_544_nl : STD_LOGIC;
  SIGNAL or_542_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL and_286_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL or_538_nl : STD_LOGIC;
  SIGNAL mux_455_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL mux_454_nl : STD_LOGIC;
  SIGNAL mux_453_nl : STD_LOGIC;
  SIGNAL mux_452_nl : STD_LOGIC;
  SIGNAL mux_451_nl : STD_LOGIC;
  SIGNAL nor_316_nl : STD_LOGIC;
  SIGNAL nor_317_nl : STD_LOGIC;
  SIGNAL nor_318_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_20_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL mux_479_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL nand_38_nl : STD_LOGIC;
  SIGNAL mux_477_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL or_558_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL and_162_nl : STD_LOGIC;
  SIGNAL or_556_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL or_555_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_37_nl : STD_LOGIC;
  SIGNAL nor_277_nl : STD_LOGIC;
  SIGNAL and_18_nl : STD_LOGIC;
  SIGNAL mux_93_nl : STD_LOGIC;
  SIGNAL and_17_nl : STD_LOGIC;
  SIGNAL or_135_nl : STD_LOGIC;
  SIGNAL or_133_nl : STD_LOGIC;
  SIGNAL or_145_nl : STD_LOGIC;
  SIGNAL or_143_nl : STD_LOGIC;
  SIGNAL nor_242_nl : STD_LOGIC;
  SIGNAL nor_243_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL and_216_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL and_217_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL and_218_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL or_373_nl : STD_LOGIC;
  SIGNAL or_392_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL nor_275_nl : STD_LOGIC;
  SIGNAL nor_276_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL or_607_nl : STD_LOGIC;
  SIGNAL nand_74_nl : STD_LOGIC;
  SIGNAL or_396_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL or_407_nl : STD_LOGIC;
  SIGNAL or_406_nl : STD_LOGIC;
  SIGNAL nor_187_nl : STD_LOGIC;
  SIGNAL mux_320_nl : STD_LOGIC;
  SIGNAL or_403_nl : STD_LOGIC;
  SIGNAL or_401_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL nor_173_nl : STD_LOGIC;
  SIGNAL and_188_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_382_nl : STD_LOGIC;
  SIGNAL or_452_nl : STD_LOGIC;
  SIGNAL or_451_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL or_552_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL nand_73_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL nand_37_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL and_168_nl : STD_LOGIC;
  SIGNAL nor_143_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL mux_488_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL mux_486_nl : STD_LOGIC;
  SIGNAL mux_485_nl : STD_LOGIC;
  SIGNAL nor_144_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL mux_484_nl : STD_LOGIC;
  SIGNAL mux_483_nl : STD_LOGIC;
  SIGNAL mux_482_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL and_94_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL or_394_nl : STD_LOGIC;
  SIGNAL and_49_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL nor_273_nl : STD_LOGIC;
  SIGNAL nor_274_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL and_253_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL nor_270_nl : STD_LOGIC;
  SIGNAL nor_271_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL or_124_nl : STD_LOGIC;
  SIGNAL or_122_nl : STD_LOGIC;
  SIGNAL and_51_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL nor_268_nl : STD_LOGIC;
  SIGNAL nor_269_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL and_252_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL nor_263_nl : STD_LOGIC;
  SIGNAL nor_264_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL nor_265_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL or_150_nl : STD_LOGIC;
  SIGNAL or_149_nl : STD_LOGIC;
  SIGNAL nor_266_nl : STD_LOGIC;
  SIGNAL nor_267_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL or_140_nl : STD_LOGIC;
  SIGNAL or_138_nl : STD_LOGIC;
  SIGNAL and_250_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL nor_256_nl : STD_LOGIC;
  SIGNAL nor_257_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL nor_258_nl : STD_LOGIC;
  SIGNAL nor_260_nl : STD_LOGIC;
  SIGNAL or_160_nl : STD_LOGIC;
  SIGNAL nor_261_nl : STD_LOGIC;
  SIGNAL nor_262_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL or_157_nl : STD_LOGIC;
  SIGNAL or_156_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL and_249_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL nor_251_nl : STD_LOGIC;
  SIGNAL nor_252_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL nor_253_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL or_184_nl : STD_LOGIC;
  SIGNAL or_183_nl : STD_LOGIC;
  SIGNAL nor_254_nl : STD_LOGIC;
  SIGNAL nor_255_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL or_174_nl : STD_LOGIC;
  SIGNAL or_172_nl : STD_LOGIC;
  SIGNAL and_246_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nor_245_nl : STD_LOGIC;
  SIGNAL and_247_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL nor_246_nl : STD_LOGIC;
  SIGNAL nor_248_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL nor_249_nl : STD_LOGIC;
  SIGNAL nor_250_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL or_192_nl : STD_LOGIC;
  SIGNAL or_190_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL and_244_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL nor_239_nl : STD_LOGIC;
  SIGNAL nor_240_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL nor_241_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL or_215_nl : STD_LOGIC;
  SIGNAL and_245_nl : STD_LOGIC;
  SIGNAL nor_244_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL or_209_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL and_241_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL and_242_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL nor_235_nl : STD_LOGIC;
  SIGNAL nor_45_nl : STD_LOGIC;
  SIGNAL nor_237_nl : STD_LOGIC;
  SIGNAL nor_238_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL or_222_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL and_238_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL nor_226_nl : STD_LOGIC;
  SIGNAL nor_227_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL nor_228_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL nor_229_nl : STD_LOGIC;
  SIGNAL and_239_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL or_239_nl : STD_LOGIC;
  SIGNAL nand_90_nl : STD_LOGIC;
  SIGNAL and_234_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL and_235_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nor_221_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL nor_222_nl : STD_LOGIC;
  SIGNAL and_237_nl : STD_LOGIC;
  SIGNAL nor_224_nl : STD_LOGIC;
  SIGNAL nor_225_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL or_253_nl : STD_LOGIC;
  SIGNAL nand_64_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL or_642_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL mux_499_nl : STD_LOGIC;
  SIGNAL or_638_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL nor_352_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL nand_112_nl : STD_LOGIC;
  SIGNAL mux_536_nl : STD_LOGIC;
  SIGNAL or_708_nl : STD_LOGIC;
  SIGNAL nand_127_nl : STD_LOGIC;
  SIGNAL and_420_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_85_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL mux_555_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_53_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_86_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_32_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_and_70_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_67_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_or_33_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_71_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_68_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_59_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_69_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_33_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_34_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_35_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_36_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_54_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_55_nl : STD_LOGIC;
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
  SIGNAL COMP_LOOP_or_37_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_72_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_70_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_61_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_38_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_71_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_or_39_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_40_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_87_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_64_false_1_operator_64_false_1_or_1_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_nor_4_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_9_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_nor_5_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_10_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_nor_6_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_11_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_operator_64_false_1_nor_7_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_12_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_13_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_14_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_16_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_2_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_436_nl : STD_LOGIC;
  SIGNAL mux_556_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL mux_557_nl : STD_LOGIC;
  SIGNAL nand_129_nl : STD_LOGIC;
  SIGNAL mux_558_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL or_713_nl : STD_LOGIC;
  SIGNAL mux_559_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL mux_560_nl : STD_LOGIC;
  SIGNAL mux_561_nl : STD_LOGIC;
  SIGNAL mux_562_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL mux_563_nl : STD_LOGIC;
  SIGNAL or_714_nl : STD_LOGIC;
  SIGNAL or_715_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL mux_564_nl : STD_LOGIC;
  SIGNAL or_716_nl : STD_LOGIC;
  SIGNAL mux_565_nl : STD_LOGIC;
  SIGNAL or_717_nl : STD_LOGIC;
  SIGNAL or_718_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL mux_566_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL and_437_nl : STD_LOGIC;
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
      STAGE_LOOP_C_8_tr0 : IN STD_LOGIC;
      modExp_while_C_38_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_62_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_124_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_62_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_124_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_62_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_62_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_10_6_2(input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_10_9_2(input_8 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
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

  FUNCTION MUX1HOT_v_51_3_2(input_2 : STD_LOGIC_VECTOR(50 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(50 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(50 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(50 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(50 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
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

  FUNCTION MUX_v_51_2_2(input_0 : STD_LOGIC_VECTOR(50 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(50 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(50 DOWNTO 0);

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

  FUNCTION READSLICE_1_65(input_val:STD_LOGIC_VECTOR(64 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 64);
  BEGIN
    RETURN input_val(sat_index);
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

  vec_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
      lz => vec_rsc_triosy_0_3_lz
    );
  vec_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
      lz => vec_rsc_triosy_0_2_lz
    );
  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_3_obj_ld_cse,
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
      STAGE_LOOP_C_8_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0,
      modExp_while_C_38_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_1_COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_1_COMP_LOOP_C_62_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_62_tr0,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0,
      VEC_LOOP_1_COMP_LOOP_C_124_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      VEC_LOOP_2_COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_2_COMP_LOOP_C_62_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_62_tr0,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0,
      VEC_LOOP_2_COMP_LOOP_C_124_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0,
      STAGE_LOOP_C_9_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 <= NOT (READSLICE_1_65(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1'
      & (NOT (operator_66_true_div_cmp_z(63 DOWNTO 0)))) + SIGNED'( "00000000000000000000000000000000000000000000000000000000000000001"),
      65)), 64));
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_62_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38_tr0
      <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_62_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38_tr0
      <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 <= NOT (z_out_1(2));

  and_251_cse <= (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4)) AND (NOT
      (fsm_output(8)));
  nor_259_cse <= NOT((NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(7))
      OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  or_605_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_231_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_603_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  nor_217_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_230_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  or_604_cse <= (fsm_output(3)) OR (fsm_output(7));
  and_224_cse <= (fsm_output(3)) AND (fsm_output(7));
  or_298_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_280_cse <= and_231_cse OR (fsm_output(2));
  and_220_cse <= (fsm_output(3)) AND (fsm_output(7)) AND (fsm_output(6));
  or_303_cse <= (fsm_output(3)) OR (fsm_output(7)) OR (fsm_output(6));
  and_226_cse <= (fsm_output(1)) AND (fsm_output(3));
  or_610_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  and_215_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111"));
  nor_161_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_182_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  nor_154_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(3)) OR (fsm_output(7)) OR
      (fsm_output(1)) OR (NOT nor_tmp_118));
  or_588_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(5)))
      OR (fsm_output(2)) OR (fsm_output(6));
  nor_156_nl <= NOT((fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(6)));
  mux_429_nl <= MUX_s_1_2_2(nor_156_nl, nor_tmp_118, fsm_output(1));
  nand_45_nl <= NOT((fsm_output(7)) AND mux_429_nl);
  mux_430_nl <= MUX_s_1_2_2(or_588_nl, nand_45_nl, fsm_output(3));
  nor_155_nl <= NOT((fsm_output(8)) OR mux_430_nl);
  mux_431_nl <= MUX_s_1_2_2(nor_154_nl, nor_155_nl, fsm_output(4));
  modExp_while_if_or_nl <= and_dcpl_62 OR (mux_431_nl AND modExp_exp_1_0_1_sva AND
      (fsm_output(0)));
  modExp_while_if_and_nl <= modExp_while_and_3 AND and_dcpl_125;
  modExp_while_if_and_1_nl <= modExp_while_and_5 AND and_dcpl_125;
  modExp_while_if_mux1h_nl <= MUX1HOT_v_64_5_2(z_out_5, STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w11, (z_out_1(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
      modExp_while_if_or_nl & and_dcpl_86 & modExp_while_if_and_nl & modExp_while_if_and_1_nl
      & not_tmp_156));
  and_80_nl <= and_dcpl_15 AND and_dcpl_24;
  or_628_nl <= (fsm_output(4)) OR (fsm_output(8));
  nor_328_nl <= NOT(nor_217_cse OR (fsm_output(8)));
  mux_269_nl <= MUX_s_1_2_2((fsm_output(8)), nor_328_nl, fsm_output(4));
  mux_270_nl <= MUX_s_1_2_2(or_628_nl, mux_269_nl, fsm_output(5));
  or_629_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")) OR (or_280_cse
      AND (fsm_output(8)));
  mux_271_nl <= MUX_s_1_2_2(mux_270_nl, or_629_nl, fsm_output(6));
  or_471_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(8));
  mux_266_nl <= MUX_s_1_2_2(or_471_nl, or_tmp_305, fsm_output(4));
  and_85_nl <= (fsm_output(4)) AND (and_231_cse OR (fsm_output(2)) OR (NOT (fsm_output(8))));
  mux_267_nl <= MUX_s_1_2_2(mux_266_nl, and_85_nl, fsm_output(5));
  or_339_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(2))) OR (fsm_output(8));
  or_338_nl <= (fsm_output(4)) OR and_230_cse OR (fsm_output(8));
  mux_265_nl <= MUX_s_1_2_2(or_339_nl, or_338_nl, fsm_output(5));
  mux_268_nl <= MUX_s_1_2_2(mux_267_nl, mux_265_nl, fsm_output(6));
  mux_272_nl <= MUX_s_1_2_2(mux_271_nl, mux_268_nl, fsm_output(3));
  nor_201_nl <= NOT((fsm_output(5)) OR (NOT((fsm_output(4)) AND (((NOT(CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")))) AND (fsm_output(2))) OR (fsm_output(8))))));
  or_474_nl <= (fsm_output(2)) OR (NOT (fsm_output(8)));
  mux_260_nl <= MUX_s_1_2_2((NOT or_tmp_305), or_474_nl, or_605_cse);
  mux_261_nl <= MUX_s_1_2_2(mux_260_nl, or_tmp_305, fsm_output(4));
  mux_262_nl <= MUX_s_1_2_2(mux_261_nl, (fsm_output(8)), fsm_output(5));
  mux_263_nl <= MUX_s_1_2_2(nor_201_nl, mux_262_nl, fsm_output(6));
  and_214_nl <= or_605_cse AND (fsm_output(2)) AND (fsm_output(8));
  mux_258_nl <= MUX_s_1_2_2(and_214_nl, (fsm_output(8)), fsm_output(4));
  nor_202_nl <= NOT((fsm_output(5)) OR (NOT mux_258_nl));
  or_19_nl <= (NOT (fsm_output(4))) OR (fsm_output(8));
  or_329_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(8));
  mux_255_nl <= MUX_s_1_2_2(or_329_nl, or_tmp_305, fsm_output(1));
  mux_256_nl <= MUX_s_1_2_2((fsm_output(8)), mux_255_nl, fsm_output(4));
  mux_257_nl <= MUX_s_1_2_2(or_19_nl, mux_256_nl, fsm_output(5));
  mux_259_nl <= MUX_s_1_2_2(nor_202_nl, mux_257_nl, fsm_output(6));
  mux_264_nl <= MUX_s_1_2_2(mux_263_nl, mux_259_nl, fsm_output(3));
  mux_273_nl <= MUX_s_1_2_2(mux_272_nl, (NOT mux_264_nl), fsm_output(7));
  operator_64_false_mux1h_2_rgt <= MUX1HOT_v_65_3_2(z_out_1, (STD_LOGIC_VECTOR'(
      "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0' & modExp_while_if_mux1h_nl),
      STD_LOGIC_VECTOR'( and_80_nl & and_dcpl_72 & mux_273_nl));
  or_674_cse <= (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(3));
  and_206_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  and_98_m1c <= and_dcpl_33 AND (fsm_output(2)) AND and_dcpl_12 AND and_dcpl_78;
  modExp_result_and_rgt <= (NOT modExp_while_and_5) AND and_98_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_5 AND and_98_m1c;
  and_196_cse <= (fsm_output(0)) AND (fsm_output(3));
  or_95_cse <= (fsm_output(4)) OR (fsm_output(7));
  mux_63_cse <= MUX_s_1_2_2((NOT or_604_cse), (fsm_output(7)), fsm_output(4));
  mux_68_cse <= MUX_s_1_2_2(or_95_cse, or_tmp_69, fsm_output(5));
  or_621_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_273_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_187_cse <= (fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(2));
  or_619_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  COMP_LOOP_or_cse <= (and_dcpl_27 AND and_dcpl_24) OR (and_dcpl_44 AND and_dcpl_12
      AND and_dcpl_19);
  and_266_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  nor_146_nl <= NOT((fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  nor_147_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_462_cse <= MUX_s_1_2_2(nor_146_nl, nor_147_nl, fsm_output(2));
  COMP_LOOP_or_1_cse <= (and_dcpl_33 AND (NOT (fsm_output(2))) AND and_dcpl_32 AND
      CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01")) AND and_dcpl_29)
      OR (and_dcpl_45 AND and_dcpl_43) OR ((fsm_output(5)) AND (NOT (fsm_output(4)))
      AND (fsm_output(2)) AND and_dcpl_49 AND and_dcpl_11) OR (and_dcpl_14 AND and_dcpl_49
      AND and_dcpl_43);
  VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w5 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_2_lpi_4_dfm)
      + SIGNED(COMP_LOOP_mux1h_1_itm_mx1), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z(63
      DOWNTO 1)), (tmp_2_lpi_4_dfm(63 DOWNTO 1)), and_dcpl_82);
  modulo_qr_sva_1_mx0w11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_result_rem_cmp_z)
      + UNSIGNED(p_sva), 64));
  COMP_LOOP_mux1h_1_itm_mx1 <= MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w11,
      modulo_result_rem_cmp_z(63));
  modExp_while_and_3 <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
  modExp_while_and_5 <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
  not_tmp_20 <= NOT((fsm_output(0)) AND (fsm_output(7)));
  not_tmp_38 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_tmp_40 <= MUX_s_1_2_2(not_tmp_38, and_182_cse, fsm_output(6));
  or_tmp_69 <= (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (fsm_output(7));
  or_tmp_93 <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(5));
  and_tmp_7 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111")) AND or_tmp_93;
  nor_277_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)) OR (fsm_output(5)));
  and_18_nl <= (fsm_output(6)) AND (fsm_output(8)) AND or_610_cse;
  mux_tmp_94 <= MUX_s_1_2_2(nor_277_nl, and_18_nl, fsm_output(7));
  mux_tmp_95 <= MUX_s_1_2_2(mux_tmp_94, and_tmp_7, fsm_output(3));
  and_17_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111")) AND or_610_cse;
  mux_93_nl <= MUX_s_1_2_2(and_17_nl, and_tmp_7, fsm_output(3));
  mux_96_itm <= MUX_s_1_2_2(mux_tmp_95, mux_93_nl, fsm_output(0));
  and_dcpl_10 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_11 <= and_dcpl_10 AND (NOT (fsm_output(3))) AND (NOT (fsm_output(0)));
  and_dcpl_12 <= NOT((fsm_output(1)) OR (fsm_output(8)));
  and_dcpl_13 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_14 <= and_dcpl_13 AND (NOT (fsm_output(2)));
  and_dcpl_15 <= and_dcpl_14 AND and_dcpl_12;
  and_dcpl_19 <= and_266_cse AND and_196_cse;
  and_dcpl_21 <= and_dcpl_14 AND (NOT (fsm_output(1))) AND (fsm_output(8));
  and_dcpl_23 <= (NOT (fsm_output(3))) AND (fsm_output(0));
  and_dcpl_24 <= and_dcpl_10 AND and_dcpl_23;
  and_dcpl_26 <= and_206_cse AND (NOT (fsm_output(2)));
  and_dcpl_27 <= and_dcpl_26 AND and_dcpl_12;
  and_dcpl_29 <= (fsm_output(3)) AND (NOT (fsm_output(0)));
  and_dcpl_32 <= (fsm_output(1)) AND (NOT (fsm_output(8)));
  and_dcpl_33 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_37 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_40 <= (fsm_output(1)) AND (NOT (fsm_output(3)));
  or_135_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (fsm_output(2))
      OR (fsm_output(4)) OR (NOT (fsm_output(5)));
  or_133_nl <= (fsm_output(6)) OR (fsm_output(8)) OR (NOT (fsm_output(2))) OR (NOT
      (fsm_output(4))) OR (fsm_output(5));
  mux_tmp_103 <= MUX_s_1_2_2(or_135_nl, or_133_nl, fsm_output(7));
  and_dcpl_42 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_43 <= and_dcpl_42 AND and_196_cse;
  and_dcpl_44 <= and_206_cse AND (fsm_output(2));
  and_dcpl_45 <= and_dcpl_44 AND and_dcpl_32;
  and_dcpl_49 <= (fsm_output(1)) AND (fsm_output(8));
  not_tmp_92 <= NOT((fsm_output(8)) AND (fsm_output(6)));
  or_145_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  or_143_nl <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  mux_106_cse <= MUX_s_1_2_2(or_145_nl, or_143_nl, fsm_output(4));
  not_tmp_109 <= NOT((COMP_LOOP_acc_10_cse_12_1_1_sva(1)) AND (fsm_output(8)) AND
      (fsm_output(6)));
  nor_242_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT (fsm_output(6))));
  nor_243_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(8))) OR (fsm_output(6)));
  mux_136_cse <= MUX_s_1_2_2(nor_242_nl, nor_243_nl, fsm_output(4));
  nor_tmp_48 <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(8)) AND (fsm_output(6));
  and_dcpl_62 <= and_dcpl_14 AND and_dcpl_32 AND and_dcpl_10 AND and_dcpl_29;
  or_tmp_242 <= (fsm_output(3)) OR (fsm_output(8));
  nor_tmp_51 <= (fsm_output(3)) AND (fsm_output(8));
  or_tmp_244 <= (NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(8));
  mux_167_nl <= MUX_s_1_2_2((NOT nor_tmp_51), or_tmp_242, fsm_output(7));
  mux_tmp_168 <= MUX_s_1_2_2(or_tmp_244, mux_167_nl, fsm_output(4));
  or_tmp_245 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_tmp_247 <= (NOT (fsm_output(3))) OR (fsm_output(8));
  mux_tmp_174 <= MUX_s_1_2_2((NOT or_tmp_242), nor_tmp_51, fsm_output(7));
  or_271_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(8));
  mux_tmp_175 <= MUX_s_1_2_2(mux_tmp_174, or_271_nl, fsm_output(4));
  or_tmp_249 <= (fsm_output(3)) OR (NOT (fsm_output(8)));
  mux_178_nl <= MUX_s_1_2_2(or_tmp_242, or_tmp_249, fsm_output(7));
  mux_tmp_179 <= MUX_s_1_2_2(mux_178_nl, or_tmp_245, fsm_output(4));
  mux_tmp_180 <= MUX_s_1_2_2(mux_tmp_179, mux_tmp_168, fsm_output(5));
  mux_182_nl <= MUX_s_1_2_2((NOT or_tmp_247), or_tmp_249, fsm_output(7));
  and_tmp_10 <= (fsm_output(4)) AND mux_182_nl;
  or_tmp_251 <= and_224_cse OR (fsm_output(8));
  mux_tmp_184 <= MUX_s_1_2_2(mux_tmp_174, or_tmp_251, fsm_output(4));
  mux_tmp_195 <= MUX_s_1_2_2((NOT nor_tmp_51), (fsm_output(8)), fsm_output(7));
  or_tmp_254 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  or_tmp_255 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_277 <= (NOT((fsm_output(3)) OR (fsm_output(7)))) OR (fsm_output(6));
  and_217_nl <= (fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(6)) AND (NOT
      (fsm_output(8)));
  nor_208_nl <= NOT((fsm_output(4)) OR (fsm_output(2)) OR (fsm_output(6)) OR (NOT
      (fsm_output(8))));
  mux_247_nl <= MUX_s_1_2_2(and_217_nl, nor_208_nl, fsm_output(5));
  and_216_nl <= (NOT((fsm_output(1)) OR (fsm_output(3)) OR (NOT (fsm_output(7)))))
      AND mux_247_nl;
  and_218_nl <= (fsm_output(1)) AND (fsm_output(3)) AND (NOT (fsm_output(7))) AND
      (fsm_output(5)) AND mux_136_cse;
  not_tmp_156 <= MUX_s_1_2_2(and_216_nl, and_218_nl, fsm_output(0));
  or_626_nl <= (fsm_output(7)) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(8)))
      OR (NOT (fsm_output(2))) OR (fsm_output(4)) OR (NOT (fsm_output(5)));
  or_627_nl <= (NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(2))
      OR (NOT (fsm_output(4))) OR (fsm_output(5));
  mux_249_nl <= MUX_s_1_2_2(or_626_nl, or_627_nl, fsm_output(3));
  and_dcpl_64 <= NOT(mux_249_nl OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  mux_250_nl <= MUX_s_1_2_2(or_619_cse, (NOT or_619_cse), fsm_output(3));
  nor_205_nl <= NOT((fsm_output(3)) OR (NOT or_619_cse));
  mux_251_nl <= MUX_s_1_2_2(mux_250_nl, nor_205_nl, fsm_output(0));
  and_dcpl_68 <= mux_251_nl AND (NOT (fsm_output(5))) AND (NOT (fsm_output(4))) AND
      (NOT (fsm_output(8))) AND and_dcpl_10;
  nor_203_nl <= NOT((fsm_output(3)) OR (NOT and_206_cse));
  nor_204_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("001")));
  mux_254_nl <= MUX_s_1_2_2(nor_203_nl, nor_204_nl, fsm_output(0));
  and_dcpl_72 <= mux_254_nl AND (NOT (fsm_output(2))) AND and_dcpl_12 AND and_dcpl_10;
  or_tmp_305 <= (NOT (fsm_output(2))) OR (fsm_output(8));
  and_dcpl_73 <= and_266_cse AND and_dcpl_29;
  or_373_nl <= (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(5));
  mux_tmp_296 <= MUX_s_1_2_2((NOT and_dcpl_44), or_373_nl, fsm_output(8));
  or_tmp_351 <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(2))
      OR (NOT and_206_cse);
  and_dcpl_76 <= (NOT mux_tmp_296) AND (fsm_output(1));
  and_dcpl_77 <= and_dcpl_76 AND and_dcpl_43;
  not_tmp_197 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_78 <= and_dcpl_10 AND and_196_cse;
  and_dcpl_82 <= and_dcpl_27 AND and_dcpl_11;
  and_dcpl_84 <= NOT((fsm_output(1)) OR (fsm_output(7)));
  or_392_nl <= (fsm_output(6)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(2)))
      OR (fsm_output(4)) OR (NOT (fsm_output(5)));
  or_390_nl <= (NOT (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(2)) OR (NOT
      (fsm_output(4))) OR (fsm_output(5));
  mux_tmp_315 <= MUX_s_1_2_2(or_392_nl, or_390_nl, fsm_output(3));
  nor_275_nl <= NOT((NOT (fsm_output(8))) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(7)));
  or_607_nl <= (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(2)) OR (fsm_output(7));
  nand_74_nl <= NOT((fsm_output(3)) AND (fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(7)));
  mux_317_nl <= MUX_s_1_2_2(or_607_nl, nand_74_nl, fsm_output(6));
  or_396_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(5)) OR (NOT((fsm_output(2))
      AND (fsm_output(7))));
  mux_318_nl <= MUX_s_1_2_2(mux_317_nl, or_396_nl, fsm_output(0));
  nor_276_nl <= NOT((fsm_output(8)) OR mux_318_nl);
  mux_319_nl <= MUX_s_1_2_2(nor_275_nl, nor_276_nl, fsm_output(4));
  and_dcpl_86 <= mux_319_nl AND (fsm_output(1));
  or_407_nl <= (NOT (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(3));
  or_406_nl <= (fsm_output(6)) OR (NOT((fsm_output(8)) AND (fsm_output(3))));
  mux_321_nl <= MUX_s_1_2_2(or_407_nl, or_406_nl, fsm_output(2));
  nor_186_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(7))) OR (fsm_output(5)) OR
      (fsm_output(4)) OR mux_321_nl);
  or_403_nl <= (NOT (fsm_output(4))) OR (fsm_output(2)) OR (NOT (fsm_output(6)))
      OR (fsm_output(8)) OR (NOT (fsm_output(3)));
  or_401_nl <= (fsm_output(4)) OR (NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT
      (fsm_output(8))) OR (fsm_output(3));
  mux_320_nl <= MUX_s_1_2_2(or_403_nl, or_401_nl, fsm_output(5));
  nor_187_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR mux_320_nl);
  not_tmp_208 <= MUX_s_1_2_2(nor_186_nl, nor_187_nl, fsm_output(0));
  nand_86_cse <= NOT((fsm_output(0)) AND (fsm_output(3)));
  or_tmp_398 <= NOT(nand_86_cse AND (fsm_output(7)));
  mux_tmp_341 <= MUX_s_1_2_2(and_224_cse, or_604_cse, fsm_output(0));
  nor_tmp_97 <= or_603_cse AND (fsm_output(7));
  and_dcpl_97 <= (fsm_output(5)) AND (fsm_output(1));
  nor_178_nl <= NOT((fsm_output(7)) OR (NOT((fsm_output(6)) AND (fsm_output(8)) AND
      (fsm_output(2)) AND (fsm_output(4)))));
  nor_179_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(8)) OR
      (fsm_output(2)) OR (fsm_output(4)));
  not_tmp_236 <= MUX_s_1_2_2(nor_178_nl, nor_179_nl, fsm_output(3));
  or_tmp_417 <= (fsm_output(7)) OR (NOT (fsm_output(4)));
  nor_tmp_103 <= (fsm_output(7)) AND (fsm_output(4));
  and_dcpl_105 <= (fsm_output(1)) AND (NOT (COMP_LOOP_acc_1_cse_2_sva(1)));
  and_dcpl_112 <= (fsm_output(1)) AND (COMP_LOOP_acc_1_cse_2_sva(1));
  and_dcpl_121 <= (fsm_output(4)) AND (fsm_output(1));
  nor_173_nl <= NOT((fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(2)));
  and_188_nl <= (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(2));
  mux_381_nl <= MUX_s_1_2_2(nor_173_nl, and_188_nl, fsm_output(3));
  and_dcpl_123 <= mux_381_nl AND (fsm_output(5));
  and_dcpl_124 <= and_dcpl_123 AND and_dcpl_121 AND (NOT (fsm_output(8))) AND (NOT
      (fsm_output(0)));
  or_452_nl <= (NOT (fsm_output(8))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR (fsm_output(5));
  or_451_nl <= (fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(5));
  mux_382_nl <= MUX_s_1_2_2(or_452_nl, or_451_nl, fsm_output(6));
  nor_171_nl <= NOT((fsm_output(7)) OR mux_382_nl);
  nor_172_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"))
      OR mux_tmp_296);
  mux_383_nl <= MUX_s_1_2_2(nor_171_nl, nor_172_nl, fsm_output(3));
  and_dcpl_125 <= mux_383_nl AND and_dcpl_37;
  mux_tmp_387 <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), fsm_output(5));
  not_tmp_252 <= NOT((fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(8)));
  and_dcpl_127 <= (NOT mux_tmp_103) AND and_dcpl_40 AND (fsm_output(0));
  nor_tmp_118 <= (fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(6));
  and_dcpl_130 <= (NOT (fsm_output(8))) AND (fsm_output(0));
  and_dcpl_132 <= and_dcpl_123 AND and_dcpl_121 AND and_dcpl_130;
  or_552_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(6))
      OR mux_tmp_296;
  nand_73_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("011"))
      AND and_dcpl_44);
  mux_464_nl <= MUX_s_1_2_2(or_tmp_351, nand_73_nl, fsm_output(3));
  mux_465_nl <= MUX_s_1_2_2(or_552_nl, mux_464_nl, fsm_output(0));
  and_dcpl_139 <= (NOT mux_465_nl) AND (fsm_output(1));
  or_tmp_523 <= (fsm_output(7)) OR (NOT (fsm_output(5)));
  or_tmp_524 <= (fsm_output(7)) OR (fsm_output(5));
  mux_tmp_466 <= MUX_s_1_2_2(or_tmp_524, or_tmp_523, fsm_output(6));
  nand_40_nl <= NOT((fsm_output(7)) AND (fsm_output(5)));
  mux_tmp_476 <= MUX_s_1_2_2(nand_40_nl, or_tmp_524, fsm_output(6));
  or_581_cse <= (fsm_output(2)) OR (fsm_output(4));
  nand_37_nl <= NOT((and_273_cse OR (fsm_output(4))) AND (fsm_output(5)));
  mux_491_nl <= MUX_s_1_2_2(and_dcpl_44, nand_37_nl, fsm_output(8));
  and_168_nl <= or_581_cse AND (fsm_output(5));
  mux_490_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), and_168_nl, fsm_output(8));
  mux_492_nl <= MUX_s_1_2_2(mux_491_nl, mux_490_nl, fsm_output(6));
  mux_489_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), or_610_cse, fsm_output(8));
  nor_143_nl <= NOT((fsm_output(6)) OR mux_489_nl);
  mux_493_nl <= MUX_s_1_2_2(mux_492_nl, nor_143_nl, fsm_output(7));
  mux_486_nl <= MUX_s_1_2_2(and_206_cse, (NOT (fsm_output(5))), fsm_output(8));
  nor_144_nl <= NOT((or_619_cse AND (fsm_output(4))) OR (fsm_output(5)));
  mux_485_nl <= MUX_s_1_2_2(nor_144_nl, (fsm_output(5)), fsm_output(8));
  mux_487_nl <= MUX_s_1_2_2(mux_486_nl, mux_485_nl, fsm_output(6));
  mux_482_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  mux_483_nl <= MUX_s_1_2_2(and_dcpl_13, mux_482_nl, and_273_cse);
  mux_484_nl <= MUX_s_1_2_2(mux_483_nl, or_tmp_93, fsm_output(8));
  nor_145_nl <= NOT((fsm_output(6)) OR mux_484_nl);
  mux_488_nl <= MUX_s_1_2_2(mux_487_nl, nor_145_nl, fsm_output(7));
  not_tmp_310 <= MUX_s_1_2_2(mux_493_nl, mux_488_nl, fsm_output(3));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_21 AND and_dcpl_19;
  VEC_LOOP_j_1_12_0_sva_11_0_mx0c1 <= and_dcpl_21 AND and_dcpl_73;
  nor_190_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"))
      OR (or_619_cse AND (fsm_output(3))) OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_94_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")) AND (((CONV_SL_1_1(fsm_output(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))) AND (fsm_output(3))) OR CONV_SL_1_1(fsm_output(5
      DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_190_nl, and_94_nl, fsm_output(6));
  VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
      <= and_dcpl_123 AND (fsm_output(4)) AND (NOT (fsm_output(1))) AND and_dcpl_130;
  VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
      <= NOT(mux_tmp_315 OR (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(0)));
  or_394_nl <= (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(2))
      OR (NOT and_206_cse);
  mux_316_nl <= MUX_s_1_2_2(or_394_nl, mux_tmp_315, fsm_output(0));
  and_102_m1c <= (NOT mux_316_nl) AND and_dcpl_84;
  and_123_m1c <= and_dcpl_26 AND and_dcpl_32 AND and_dcpl_11;
  and_138_m1c <= and_dcpl_45 AND and_dcpl_73;
  nor_273_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(8)) OR
      (fsm_output(2)));
  nor_274_nl <= NOT((fsm_output(7)) OR (NOT((fsm_output(6)) AND (fsm_output(8)) AND
      (fsm_output(2)))));
  mux_98_nl <= MUX_s_1_2_2(nor_273_nl, nor_274_nl, fsm_output(3));
  and_49_nl <= mux_98_nl AND and_dcpl_13 AND and_dcpl_37;
  nor_270_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(5)) OR (fsm_output(4)) OR
      (NOT (fsm_output(8))));
  nor_271_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(4)))
      OR (fsm_output(8)));
  mux_100_nl <= MUX_s_1_2_2(nor_270_nl, nor_271_nl, fsm_output(3));
  and_253_nl <= (fsm_output(1)) AND (fsm_output(7)) AND (fsm_output(6)) AND mux_100_nl;
  or_124_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (fsm_output(2)) OR (NOT
      (fsm_output(5))) OR (fsm_output(4)) OR (NOT (fsm_output(8)));
  or_122_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (NOT (fsm_output(2))) OR (fsm_output(5))
      OR (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_99_nl <= MUX_s_1_2_2(or_124_nl, or_122_nl, fsm_output(7));
  nor_272_nl <= NOT((fsm_output(1)) OR mux_99_nl);
  mux_101_nl <= MUX_s_1_2_2(and_253_nl, nor_272_nl, fsm_output(0));
  nor_268_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(2)) OR (NOT and_206_cse));
  nor_269_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(4)) OR
      (NOT (fsm_output(5))));
  mux_102_nl <= MUX_s_1_2_2(nor_268_nl, nor_269_nl, fsm_output(6));
  nand_6_nl <= NOT((fsm_output(7)) AND mux_102_nl);
  mux_104_nl <= MUX_s_1_2_2(mux_tmp_103, nand_6_nl, fsm_output(0));
  and_51_nl <= (NOT mux_104_nl) AND and_dcpl_40;
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_10_5_2((z_out_2(10 DOWNTO 1)), (z_out_1(12
      DOWNTO 3)), (COMP_LOOP_acc_psp_1_sva(10 DOWNTO 1)), (COMP_LOOP_acc_10_cse_12_1_1_sva(11
      DOWNTO 2)), (COMP_LOOP_acc_1_cse_2_sva(11 DOWNTO 2)), STD_LOGIC_VECTOR'( COMP_LOOP_or_cse
      & COMP_LOOP_or_1_cse & and_49_nl & mux_101_nl & and_51_nl));
  vec_rsc_0_0_i_da_d_pff <= COMP_LOOP_mux1h_1_itm_mx1;
  nor_263_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(2)) OR
      CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_92);
  nor_264_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(2)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(8)) OR (fsm_output(6)));
  mux_109_nl <= MUX_s_1_2_2(nor_263_nl, nor_264_nl, fsm_output(7));
  and_252_nl <= (fsm_output(0)) AND mux_109_nl;
  or_150_nl <= (COMP_LOOP_acc_psp_1_sva(0)) OR (VEC_LOOP_j_1_12_0_sva_11_0(0)) OR
      (fsm_output(8)) OR (fsm_output(6));
  or_149_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_92;
  mux_107_nl <= MUX_s_1_2_2(or_150_nl, or_149_nl, fsm_output(2));
  nor_265_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(4)) OR
      mux_107_nl);
  nor_266_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(5))) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR mux_106_cse);
  mux_108_nl <= MUX_s_1_2_2(nor_265_nl, nor_266_nl, fsm_output(0));
  mux_110_nl <= MUX_s_1_2_2(and_252_nl, mux_108_nl, fsm_output(1));
  or_140_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))
      OR (COMP_LOOP_acc_psp_1_sva(0)) OR not_tmp_92;
  or_138_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(2))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_105_nl <= MUX_s_1_2_2(or_140_nl, or_138_nl, fsm_output(7));
  nor_267_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR mux_105_nl);
  vec_rsc_0_0_i_wea_d_pff <= MUX_s_1_2_2(mux_110_nl, nor_267_nl, fsm_output(3));
  nor_256_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR (VEC_LOOP_j_1_12_0_sva_11_0(0)) OR (z_out_2(0)) OR (fsm_output(2)) OR (fsm_output(7))
      OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  nor_257_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("11"))
      OR (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) OR (z_out_2(0)) OR (NOT (fsm_output(2)))
      OR (NOT (fsm_output(7))) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_118_nl <= MUX_s_1_2_2(nor_256_nl, nor_257_nl, fsm_output(3));
  and_250_nl <= (fsm_output(0)) AND mux_118_nl;
  nor_258_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR
      (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  mux_113_nl <= MUX_s_1_2_2(and_251_cse, nor_258_nl, fsm_output(5));
  mux_114_nl <= MUX_s_1_2_2(mux_113_nl, nor_259_cse, fsm_output(6));
  nor_260_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(2)))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  or_160_nl <= (NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_115_nl <= MUX_s_1_2_2(mux_114_nl, nor_260_nl, or_160_nl);
  nor_261_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_116_nl <= MUX_s_1_2_2(mux_115_nl, nor_261_nl, fsm_output(3));
  or_157_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT
      (fsm_output(8))) OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_156_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      (fsm_output(2))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_112_nl <= MUX_s_1_2_2(or_157_nl, or_156_nl, fsm_output(5));
  nor_262_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(6)) OR mux_112_nl);
  mux_117_nl <= MUX_s_1_2_2(mux_116_nl, nor_262_nl, fsm_output(0));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_250_nl, mux_117_nl,
      fsm_output(1));
  nor_251_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(2)) OR
      CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR not_tmp_92);
  nor_252_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(2)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(8)) OR (fsm_output(6)));
  mux_124_nl <= MUX_s_1_2_2(nor_251_nl, nor_252_nl, fsm_output(7));
  and_249_nl <= (fsm_output(0)) AND mux_124_nl;
  or_184_nl <= (COMP_LOOP_acc_psp_1_sva(0)) OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0)))
      OR (fsm_output(8)) OR (fsm_output(6));
  or_183_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR not_tmp_92;
  mux_122_nl <= MUX_s_1_2_2(or_184_nl, or_183_nl, fsm_output(2));
  nor_253_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(4)) OR
      mux_122_nl);
  nor_254_nl <= NOT((NOT((fsm_output(7)) AND (fsm_output(5)) AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")))) OR mux_106_cse);
  mux_123_nl <= MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output(0));
  mux_125_nl <= MUX_s_1_2_2(and_249_nl, mux_123_nl, fsm_output(1));
  or_174_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR (NOT
      (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))) OR (COMP_LOOP_acc_psp_1_sva(0)) OR not_tmp_92;
  or_172_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(2))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_120_nl <= MUX_s_1_2_2(or_174_nl, or_172_nl, fsm_output(7));
  nor_255_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR mux_120_nl);
  vec_rsc_0_1_i_wea_d_pff <= MUX_s_1_2_2(mux_125_nl, nor_255_nl, fsm_output(3));
  nor_245_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0))) OR (z_out_2(0)) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  and_247_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))
      AND (NOT (z_out_2(0))) AND (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4))
      AND (NOT (fsm_output(8)));
  mux_133_nl <= MUX_s_1_2_2(nor_245_nl, and_247_nl, fsm_output(3));
  and_246_nl <= (fsm_output(0)) AND mux_133_nl;
  nor_246_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR
      (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  mux_128_nl <= MUX_s_1_2_2(and_251_cse, nor_246_nl, fsm_output(5));
  mux_129_nl <= MUX_s_1_2_2(mux_128_nl, nor_259_cse, fsm_output(6));
  nor_248_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR (NOT (fsm_output(2)))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  or_195_nl <= (NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_130_nl <= MUX_s_1_2_2(mux_129_nl, nor_248_nl, or_195_nl);
  nor_249_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_131_nl <= MUX_s_1_2_2(mux_130_nl, nor_249_nl, fsm_output(3));
  or_192_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT
      (fsm_output(8))) OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_190_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR (NOT
      (fsm_output(2))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_127_nl <= MUX_s_1_2_2(or_192_nl, or_190_nl, fsm_output(5));
  nor_250_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(6)) OR mux_127_nl);
  mux_132_nl <= MUX_s_1_2_2(mux_131_nl, nor_250_nl, fsm_output(0));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_246_nl, mux_132_nl,
      fsm_output(1));
  nor_239_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(2)) OR
      (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) OR not_tmp_109);
  nor_240_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(2)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(8)) OR (fsm_output(6)));
  mux_139_nl <= MUX_s_1_2_2(nor_239_nl, nor_240_nl, fsm_output(7));
  and_244_nl <= (fsm_output(0)) AND mux_139_nl;
  or_216_nl <= (NOT (COMP_LOOP_acc_psp_1_sva(0))) OR (VEC_LOOP_j_1_12_0_sva_11_0(0))
      OR (fsm_output(8)) OR (fsm_output(6));
  or_215_nl <= (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) OR not_tmp_109;
  mux_137_nl <= MUX_s_1_2_2(or_216_nl, or_215_nl, fsm_output(2));
  nor_241_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(4)) OR
      mux_137_nl);
  and_245_nl <= (fsm_output(7)) AND (fsm_output(5)) AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND mux_136_cse;
  mux_138_nl <= MUX_s_1_2_2(nor_241_nl, and_245_nl, fsm_output(0));
  mux_140_nl <= MUX_s_1_2_2(and_244_nl, mux_138_nl, fsm_output(1));
  or_209_nl <= (fsm_output(5)) OR (fsm_output(4)) OR (NOT (fsm_output(2))) OR (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))
      OR (NOT((COMP_LOOP_acc_psp_1_sva(0)) AND (fsm_output(8)) AND (fsm_output(6))));
  or_207_nl <= (NOT (fsm_output(5))) OR (NOT (fsm_output(4))) OR (fsm_output(2))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_135_nl <= MUX_s_1_2_2(or_209_nl, or_207_nl, fsm_output(7));
  nor_244_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR mux_135_nl);
  vec_rsc_0_2_i_wea_d_pff <= MUX_s_1_2_2(mux_140_nl, nor_244_nl, fsm_output(3));
  nor_233_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR (VEC_LOOP_j_1_12_0_sva_11_0(0)) OR (NOT (z_out_2(0))) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  and_242_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND (NOT
      (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))) AND (z_out_2(0)) AND (fsm_output(2)) AND
      (fsm_output(7)) AND (fsm_output(4)) AND (NOT (fsm_output(8)));
  mux_148_nl <= MUX_s_1_2_2(nor_233_nl, and_242_nl, fsm_output(3));
  and_241_nl <= (fsm_output(0)) AND mux_148_nl;
  nor_234_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR (NOT (fsm_output(2)))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  nor_235_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR
      (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  mux_143_nl <= MUX_s_1_2_2(and_251_cse, nor_235_nl, fsm_output(5));
  mux_144_nl <= MUX_s_1_2_2(mux_143_nl, nor_259_cse, fsm_output(6));
  nor_45_nl <= NOT((NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")));
  mux_145_nl <= MUX_s_1_2_2(nor_234_nl, mux_144_nl, nor_45_nl);
  nor_237_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_146_nl <= MUX_s_1_2_2(mux_145_nl, nor_237_nl, fsm_output(3));
  or_223_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT
      (fsm_output(8))) OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_222_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      (fsm_output(2))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(4))) OR (fsm_output(8));
  mux_142_nl <= MUX_s_1_2_2(or_223_nl, or_222_nl, fsm_output(5));
  nor_238_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(6)) OR mux_142_nl);
  mux_147_nl <= MUX_s_1_2_2(mux_146_nl, nor_238_nl, fsm_output(0));
  vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_241_nl, mux_147_nl,
      fsm_output(1));
  nor_226_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(4)) OR (fsm_output(2)) OR
      (NOT nor_tmp_48));
  nor_227_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(2)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(8)) OR (fsm_output(6)));
  mux_154_nl <= MUX_s_1_2_2(nor_226_nl, nor_227_nl, fsm_output(7));
  and_238_nl <= (fsm_output(0)) AND mux_154_nl;
  nor_229_nl <= NOT((NOT (COMP_LOOP_acc_psp_1_sva(0))) OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0)))
      OR (fsm_output(8)) OR (fsm_output(6)));
  mux_152_nl <= MUX_s_1_2_2(nor_229_nl, nor_tmp_48, fsm_output(2));
  nor_228_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(4)) OR
      (NOT mux_152_nl));
  and_239_nl <= (fsm_output(7)) AND (fsm_output(5)) AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND mux_136_cse;
  mux_153_nl <= MUX_s_1_2_2(nor_228_nl, and_239_nl, fsm_output(0));
  mux_155_nl <= MUX_s_1_2_2(and_238_nl, mux_153_nl, fsm_output(1));
  or_239_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR (NOT((fsm_output(2))
      AND (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) AND (COMP_LOOP_acc_psp_1_sva(0)) AND
      (fsm_output(8)) AND (fsm_output(6))));
  nand_90_nl <= NOT((fsm_output(5)) AND (fsm_output(4)) AND (NOT (fsm_output(2)))
      AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (NOT (fsm_output(8))) AND (fsm_output(6)));
  mux_150_nl <= MUX_s_1_2_2(or_239_nl, nand_90_nl, fsm_output(7));
  nor_232_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR mux_150_nl);
  vec_rsc_0_3_i_wea_d_pff <= MUX_s_1_2_2(mux_155_nl, nor_232_nl, fsm_output(3));
  nor_220_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0))) OR (NOT (z_out_2(0))) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  and_235_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0))
      AND (z_out_2(0)) AND (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4))
      AND (NOT (fsm_output(8)));
  mux_163_nl <= MUX_s_1_2_2(nor_220_nl, and_235_nl, fsm_output(3));
  and_234_nl <= (fsm_output(0)) AND mux_163_nl;
  nor_221_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11")) OR (NOT (fsm_output(2)))
      OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  nor_222_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11")) OR
      (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(4)) OR (NOT (fsm_output(8))));
  mux_158_nl <= MUX_s_1_2_2(and_251_cse, nor_222_nl, fsm_output(5));
  mux_159_nl <= MUX_s_1_2_2(mux_158_nl, nor_259_cse, fsm_output(6));
  and_237_nl <= VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  mux_160_nl <= MUX_s_1_2_2(nor_221_nl, mux_159_nl, and_237_nl);
  nor_224_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11")) OR (fsm_output(2))
      OR (fsm_output(7)) OR (NOT (fsm_output(4))) OR (fsm_output(8)));
  mux_161_nl <= MUX_s_1_2_2(mux_160_nl, nor_224_nl, fsm_output(3));
  or_253_nl <= (fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(4)) OR (NOT((fsm_output(8))
      AND CONV_SL_1_1(z_out_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))));
  nand_64_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND
      (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4)) AND (NOT (fsm_output(8))));
  mux_157_nl <= MUX_s_1_2_2(or_253_nl, nand_64_nl, fsm_output(5));
  nor_225_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(6)) OR mux_157_nl);
  mux_162_nl <= MUX_s_1_2_2(mux_161_nl, nor_225_nl, fsm_output(0));
  vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_234_nl, mux_162_nl,
      fsm_output(1));
  and_dcpl_150 <= mux_462_cse AND (fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(6)))
      AND (fsm_output(1)) AND (fsm_output(0));
  or_tmp_550 <= (NOT (fsm_output(5))) OR (NOT (fsm_output(1))) OR (fsm_output(7))
      OR nand_86_cse;
  or_642_nl <= (NOT (fsm_output(5))) OR (fsm_output(1)) OR (NOT (fsm_output(7)))
      OR (fsm_output(3)) OR (fsm_output(0));
  mux_500_nl <= MUX_s_1_2_2(or_642_nl, or_tmp_550, fsm_output(4));
  nor_343_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(6)) OR mux_500_nl);
  or_638_nl <= (fsm_output(5)) OR (fsm_output(1)) OR (NOT (fsm_output(7))) OR (fsm_output(3))
      OR (fsm_output(0));
  mux_499_nl <= MUX_s_1_2_2(or_tmp_550, or_638_nl, fsm_output(4));
  nor_344_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(6))) OR mux_499_nl);
  not_tmp_321 <= MUX_s_1_2_2(nor_343_nl, nor_344_nl, fsm_output(2));
  nor_nl <= NOT((fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(3)));
  mux_502_nl <= MUX_s_1_2_2(nor_nl, and_220_cse, fsm_output(2));
  and_dcpl_155 <= mux_502_nl AND (fsm_output(4)) AND (NOT (fsm_output(8))) AND (fsm_output(5))
      AND (NOT (fsm_output(1))) AND (fsm_output(0));
  and_dcpl_156 <= (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_159 <= NOT((fsm_output(7)) OR (fsm_output(5)));
  and_dcpl_160 <= NOT((fsm_output(4)) OR (fsm_output(8)));
  and_dcpl_163 <= and_dcpl_160 AND (NOT (fsm_output(3))) AND and_dcpl_159 AND (NOT
      (fsm_output(6))) AND (NOT (fsm_output(1))) AND and_dcpl_156;
  and_dcpl_164 <= NOT((fsm_output(2)) OR (fsm_output(0)));
  and_dcpl_165 <= (NOT (fsm_output(6))) AND (fsm_output(1));
  and_dcpl_169 <= and_dcpl_160 AND (fsm_output(3)) AND and_dcpl_159 AND and_dcpl_165
      AND and_dcpl_164;
  and_dcpl_173 <= (fsm_output(4)) AND (NOT (fsm_output(8))) AND (fsm_output(3));
  and_dcpl_175 <= and_dcpl_173 AND and_dcpl_159 AND (fsm_output(6)) AND (fsm_output(1))
      AND and_dcpl_164;
  and_dcpl_179 <= and_dcpl_173 AND (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_180 <= and_dcpl_179 AND and_dcpl_165 AND (fsm_output(2)) AND (fsm_output(0));
  and_dcpl_181 <= (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_184 <= (NOT (fsm_output(4))) AND (fsm_output(8));
  and_dcpl_187 <= and_dcpl_184 AND (NOT (fsm_output(3))) AND (NOT (fsm_output(7)))
      AND (fsm_output(5)) AND and_dcpl_165 AND and_dcpl_181;
  and_dcpl_191 <= and_dcpl_184 AND (fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(5)));
  and_dcpl_192 <= and_dcpl_191 AND and_dcpl_165 AND and_dcpl_156;
  and_dcpl_193 <= (fsm_output(6)) AND (NOT (fsm_output(1)));
  and_dcpl_195 <= and_dcpl_179 AND and_dcpl_193 AND and_dcpl_181;
  and_dcpl_197 <= and_dcpl_191 AND and_dcpl_193 AND and_dcpl_164;
  and_dcpl_199 <= and_dcpl_191 AND and_dcpl_193 AND and_dcpl_156;
  nor_tmp_146 <= (fsm_output(5)) AND (fsm_output(2));
  not_tmp_368 <= NOT((fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(7)));
  nor_352_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 3)/=STD_LOGIC_VECTOR'("010011")));
  nor_353_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 3)/=STD_LOGIC_VECTOR'("101100")));
  mux_503_nl <= MUX_s_1_2_2(nor_352_nl, nor_353_nl, fsm_output(2));
  and_379_ssc <= mux_503_nl AND nor_161_cse;
  and_387_ssc <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("111001001"));
  and_392_ssc <= mux_462_cse AND (fsm_output(3)) AND (fsm_output(7)) AND (NOT (fsm_output(6)))
      AND and_231_cse;
  nand_112_nl <= NOT((fsm_output(6)) AND (fsm_output(7)) AND (fsm_output(3)));
  mux_505_nl <= MUX_s_1_2_2(or_303_cse, nand_112_nl, fsm_output(2));
  and_396_ssc <= (NOT(mux_505_nl OR (fsm_output(8)))) AND CONV_SL_1_1(fsm_output(5
      DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND and_231_cse;
  nor_tmp <= or_605_cse AND (fsm_output(3));
  or_tmp_586 <= and_231_cse OR (fsm_output(3));
  or_708_nl <= (fsm_output(0)) OR (NOT modExp_exp_1_0_1_sva) OR (fsm_output(3)) OR
      (NOT (fsm_output(1)));
  nand_127_nl <= NOT((fsm_output(0)) AND (fsm_output(3)) AND (fsm_output(1)));
  mux_536_nl <= MUX_s_1_2_2(or_708_nl, nand_127_nl, fsm_output(5));
  or_tmp_598 <= (fsm_output(7)) OR mux_536_nl;
  or_tmp_600 <= (fsm_output(0)) OR (NOT(modExp_exp_1_0_1_sva AND (fsm_output(3))
      AND (fsm_output(1))));
  and_420_nl <= (fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(5));
  nor_388_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(5)));
  not_tmp_395 <= MUX_s_1_2_2(and_420_nl, nor_388_nl, fsm_output(8));
  COMP_LOOP_nor_3_itm <= NOT(and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199);
  COMP_LOOP_or_24_itm <= and_dcpl_175 OR and_dcpl_180;
  COMP_LOOP_or_25_itm <= and_dcpl_187 OR and_dcpl_192;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_96_itm = '1' ) THEN
        p_sva <= p_rsci_idat;
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_15 AND and_dcpl_11) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
          THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), (z_out_4(3
            DOWNTO 0)), STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= '0';
        modExp_exp_1_0_1_sva <= '0';
        modExp_exp_1_1_1_sva <= '0';
        modExp_exp_1_7_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= and_dcpl_21 AND and_266_cse AND (fsm_output(3))
            AND (fsm_output(0)) AND (NOT (z_out_1(2)));
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_11_nl AND (NOT and_dcpl_124)) OR
            and_dcpl_127;
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_20_nl AND (NOT((NOT mux_tmp_315)
            AND and_dcpl_84 AND (fsm_output(0))));
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_37_nl AND (NOT(and_dcpl_76 AND and_dcpl_42
            AND and_dcpl_29));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_5_2(z_out_5, operator_64_false_acc_mut_63_0,
          VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm, COMP_LOOP_mux1h_1_itm, VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w5,
          STD_LOGIC_VECTOR'( modulo_result_or_nl & (NOT mux_206_nl) & (NOT mux_221_nl)
          & (NOT mux_245_nl) & not_tmp_156));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_1, (operator_64_false_acc_mut_64
          & operator_64_false_acc_mut_63_0), and_dcpl_68);
      operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_68);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_95, mux_252_nl, fsm_output(0))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_534_nl = '0' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_548_nl, mux_539_nl, fsm_output(8))) = '1' ) THEN
        operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_2_rgt(63 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_1_12_0_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (and_dcpl_72 OR VEC_LOOP_j_1_12_0_sva_11_0_mx0c1) = '1' ) THEN
        VEC_LOOP_j_1_12_0_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"),
            (z_out_1(11 DOWNTO 0)), VEC_LOOP_j_1_12_0_sva_11_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_1_1_sva_7_0 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (MUX_s_1_2_2(mux_552_nl, and_419_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_k_9_1_1_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_4(7
            DOWNTO 0)), or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_while_and_3 OR modExp_while_and_5 OR modExp_result_sva_mx0c0
          OR (NOT mux_314_nl)) AND (modExp_result_sva_mx0c0 OR modExp_result_and_rgt
          OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w11, STD_LOGIC_VECTOR'( modExp_result_sva_mx0c0
            & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_363_nl, mux_346_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_mux1h_1_itm <= MUX1HOT_v_64_10_2(r_sva, modulo_result_rem_cmp_z,
            modulo_qr_sva_1_mx0w11, modExp_result_sva, vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
            vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, z_out_5, VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w5,
            STD_LOGIC_VECTOR'( and_100_nl & r_or_nl & r_or_1_nl & and_dcpl_86 & and_105_nl
            & and_107_nl & and_109_nl & and_111_nl & nor_301_nl & not_tmp_156));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_2_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_379_nl, mux_372_nl, fsm_output(8))) = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX1HOT_v_64_5_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            vec_rsc_0_0_i_qa_d, vec_rsc_0_2_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_3_i_qa_d,
            STD_LOGIC_VECTOR'( and_dcpl_72 & COMP_LOOP_or_3_nl & COMP_LOOP_or_4_nl
            & COMP_LOOP_or_5_nl & COMP_LOOP_or_6_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_62 OR and_dcpl_132 OR and_dcpl_77) = '1' ) THEN
        exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_1(63))),
            (NOT (z_out_4(8))), (NOT (VEC_LOOP_1_COMP_LOOP_1_acc_11_nl(9))), STD_LOGIC_VECTOR'(
            and_dcpl_62 & and_dcpl_132 & and_dcpl_77));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_330_nl, nor_331_nl, fsm_output(2))) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm <= z_out_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_psp_1_sva <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( COMP_LOOP_or_cse = '1' ) THEN
        COMP_LOOP_acc_psp_1_sva <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
          OR VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
          OR and_dcpl_64) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
            <= MUX1HOT_s_1_3_2((z_out_1(9)), (z_out(9)), (z_out_4(8)), STD_LOGIC_VECTOR'(
            VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
            & VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
            & and_dcpl_64));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_449_nl, mux_446_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_88_nl)
            + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0 & '1'),
            9), 12), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_1_sva_1 <= '0';
      ELSIF ( mux_460_nl = '0' ) THEN
        modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_1_sva_7_0(0)), modExp_exp_1_1_1_sva,
            mux_463_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( not_tmp_310 = '0' ) THEN
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(1)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(2)), STD_LOGIC_VECTOR'( and_dcpl_124 & and_dcpl_139
            & and_dcpl_127));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_3_1_sva <= '0';
      ELSIF ( not_tmp_310 = '0' ) THEN
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(2)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(3)), STD_LOGIC_VECTOR'( and_dcpl_124 & and_dcpl_139
            & and_dcpl_127));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_4_1_sva <= '0';
      ELSIF ( not_tmp_310 = '0' ) THEN
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(3)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(4)), STD_LOGIC_VECTOR'( and_dcpl_124 & and_dcpl_139
            & and_dcpl_127));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_5_1_sva <= '0';
      ELSIF ( not_tmp_310 = '0' ) THEN
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(4)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(5)), STD_LOGIC_VECTOR'( and_dcpl_124 & and_dcpl_139
            & and_dcpl_127));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
      ELSIF ( not_tmp_310 = '0' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(5)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(6)), STD_LOGIC_VECTOR'( and_dcpl_124 & and_dcpl_139
            & and_dcpl_127));
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
        reg_VEC_LOOP_1_acc_1_psp_ftd_1 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (NOT((NOT and_dcpl_44) OR (fsm_output(1)) OR (fsm_output(8)) OR (NOT
          (fsm_output(6))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(0))))
          = '1' ) THEN
        reg_VEC_LOOP_1_acc_1_psp_ftd_1 <= z_out_1(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  nand_89_nl <= NOT((fsm_output(2)) AND (fsm_output(6)) AND (NOT (fsm_output(8)))
      AND (fsm_output(4)));
  or_294_nl <= (fsm_output(2)) OR (fsm_output(6)) OR (NOT (fsm_output(8))) OR (fsm_output(4));
  mux_225_nl <= MUX_s_1_2_2(nand_89_nl, or_294_nl, fsm_output(5));
  nor_212_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(7)) OR (fsm_output(1)) OR
      mux_225_nl);
  nor_213_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(5))) OR (fsm_output(2))
      OR (fsm_output(6)) OR (fsm_output(8)) OR (NOT (fsm_output(4))));
  nor_214_nl <= NOT((fsm_output(1)) OR (fsm_output(5)) OR (fsm_output(2)) OR (NOT
      (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(4)));
  mux_223_nl <= MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output(7));
  nor_215_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(2))) OR (fsm_output(6)) OR
      (NOT (fsm_output(8))) OR (fsm_output(4)));
  and_284_nl <= (fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(6)) AND (NOT
      (fsm_output(8))) AND (fsm_output(4));
  mux_222_nl <= MUX_s_1_2_2(nor_215_nl, and_284_nl, fsm_output(1));
  and_228_nl <= (fsm_output(7)) AND mux_222_nl;
  mux_224_nl <= MUX_s_1_2_2(mux_223_nl, and_228_nl, fsm_output(3));
  mux_226_nl <= MUX_s_1_2_2(nor_212_nl, mux_224_nl, fsm_output(0));
  modulo_result_or_nl <= and_dcpl_62 OR mux_226_nl OR and_dcpl_64;
  mux_201_nl <= MUX_s_1_2_2(nor_tmp_51, or_tmp_242, fsm_output(7));
  mux_202_nl <= MUX_s_1_2_2(or_tmp_251, (NOT mux_201_nl), fsm_output(4));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, and_tmp_10, fsm_output(5));
  mux_197_nl <= MUX_s_1_2_2(or_tmp_249, or_tmp_247, fsm_output(7));
  mux_198_nl <= MUX_s_1_2_2(mux_197_nl, mux_tmp_195, fsm_output(4));
  mux_196_nl <= MUX_s_1_2_2(or_tmp_244, mux_tmp_195, fsm_output(4));
  mux_199_nl <= MUX_s_1_2_2(mux_198_nl, mux_196_nl, fsm_output(0));
  mux_200_nl <= MUX_s_1_2_2(mux_tmp_179, mux_199_nl, fsm_output(5));
  mux_204_nl <= MUX_s_1_2_2((NOT mux_203_nl), mux_200_nl, fsm_output(6));
  mux_192_nl <= MUX_s_1_2_2(mux_tmp_184, mux_tmp_175, fsm_output(0));
  mux_191_nl <= MUX_s_1_2_2(or_tmp_244, (NOT or_tmp_245), fsm_output(4));
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_191_nl, fsm_output(5));
  mux_194_nl <= MUX_s_1_2_2(mux_193_nl, mux_tmp_180, fsm_output(6));
  mux_205_nl <= MUX_s_1_2_2(mux_204_nl, mux_194_nl, fsm_output(2));
  mux_185_nl <= MUX_s_1_2_2((NOT (fsm_output(8))), nor_tmp_51, fsm_output(7));
  mux_186_nl <= MUX_s_1_2_2(mux_185_nl, or_tmp_251, fsm_output(4));
  mux_187_nl <= MUX_s_1_2_2(mux_186_nl, mux_tmp_184, fsm_output(0));
  nor_219_nl <= NOT((fsm_output(7)) OR (NOT or_tmp_247));
  mux_181_nl <= MUX_s_1_2_2(or_tmp_244, nor_219_nl, fsm_output(4));
  mux_183_nl <= MUX_s_1_2_2((NOT and_tmp_10), mux_181_nl, fsm_output(0));
  mux_188_nl <= MUX_s_1_2_2(mux_187_nl, mux_183_nl, fsm_output(5));
  mux_189_nl <= MUX_s_1_2_2(mux_188_nl, mux_tmp_180, fsm_output(6));
  mux_172_nl <= MUX_s_1_2_2((fsm_output(8)), (NOT or_tmp_247), fsm_output(7));
  mux_173_nl <= MUX_s_1_2_2(or_tmp_244, mux_172_nl, fsm_output(4));
  mux_176_nl <= MUX_s_1_2_2(mux_tmp_175, mux_173_nl, fsm_output(5));
  or_269_nl <= (fsm_output(7)) OR (NOT nor_tmp_51);
  mux_170_nl <= MUX_s_1_2_2(or_269_nl, or_tmp_245, fsm_output(4));
  or_266_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_165_nl <= MUX_s_1_2_2((NOT (fsm_output(8))), or_tmp_242, fsm_output(7));
  mux_166_nl <= MUX_s_1_2_2(or_266_nl, mux_165_nl, fsm_output(4));
  mux_169_nl <= MUX_s_1_2_2(mux_tmp_168, mux_166_nl, fsm_output(0));
  mux_171_nl <= MUX_s_1_2_2(mux_170_nl, mux_169_nl, fsm_output(5));
  mux_177_nl <= MUX_s_1_2_2(mux_176_nl, mux_171_nl, fsm_output(6));
  mux_190_nl <= MUX_s_1_2_2(mux_189_nl, mux_177_nl, fsm_output(2));
  mux_206_nl <= MUX_s_1_2_2(mux_205_nl, mux_190_nl, fsm_output(1));
  or_286_nl <= (fsm_output(8)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR (NOT (fsm_output(6))) OR (fsm_output(7));
  and_229_nl <= or_605_cse AND (fsm_output(2));
  mux_217_nl <= MUX_s_1_2_2(or_298_cse, or_tmp_255, and_229_nl);
  mux_218_nl <= MUX_s_1_2_2((fsm_output(6)), mux_217_nl, fsm_output(8));
  mux_219_nl <= MUX_s_1_2_2(or_286_nl, mux_218_nl, fsm_output(5));
  or_284_nl <= nor_217_cse OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  mux_215_nl <= MUX_s_1_2_2(or_tmp_255, or_284_nl, fsm_output(8));
  nand_17_nl <= NOT((fsm_output(8)) AND (NOT(and_230_cse OR CONV_SL_1_1(fsm_output(7
      DOWNTO 6)/=STD_LOGIC_VECTOR'("01")))));
  mux_216_nl <= MUX_s_1_2_2(mux_215_nl, nand_17_nl, fsm_output(5));
  mux_220_nl <= MUX_s_1_2_2(mux_219_nl, mux_216_nl, fsm_output(4));
  or_281_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  mux_211_nl <= MUX_s_1_2_2((fsm_output(6)), or_298_cse, or_280_cse);
  mux_212_nl <= MUX_s_1_2_2(mux_211_nl, or_tmp_255, fsm_output(8));
  mux_213_nl <= MUX_s_1_2_2(or_281_nl, mux_212_nl, fsm_output(5));
  mux_208_nl <= MUX_s_1_2_2(or_tmp_255, or_tmp_254, fsm_output(2));
  mux_207_nl <= MUX_s_1_2_2(or_tmp_254, (fsm_output(6)), fsm_output(2));
  mux_209_nl <= MUX_s_1_2_2(mux_208_nl, mux_207_nl, or_605_cse);
  mux_210_nl <= MUX_s_1_2_2(mux_209_nl, or_298_cse, fsm_output(8));
  or_279_nl <= (fsm_output(5)) OR mux_210_nl;
  mux_214_nl <= MUX_s_1_2_2(mux_213_nl, or_279_nl, fsm_output(4));
  mux_221_nl <= MUX_s_1_2_2(mux_220_nl, mux_214_nl, fsm_output(3));
  or_314_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(3));
  mux_242_nl <= MUX_s_1_2_2(or_tmp_254, (NOT and_266_cse), or_314_nl);
  nand_99_nl <= NOT((NOT(or_603_cse AND (fsm_output(7)))) AND (fsm_output(6)));
  mux_243_nl <= MUX_s_1_2_2(mux_242_nl, nand_99_nl, fsm_output(5));
  and_221_nl <= or_604_cse AND (fsm_output(6));
  mux_239_nl <= MUX_s_1_2_2(and_220_cse, and_221_nl, or_605_cse);
  mux_240_nl <= MUX_s_1_2_2(and_266_cse, mux_239_nl, fsm_output(4));
  nand_101_nl <= NOT((NOT((fsm_output(3)) AND (fsm_output(7)))) AND (fsm_output(6)));
  or_308_nl <= (fsm_output(3)) OR (fsm_output(7)) OR (NOT (fsm_output(6)));
  mux_237_nl <= MUX_s_1_2_2(nand_101_nl, or_308_nl, and_231_cse);
  mux_238_nl <= MUX_s_1_2_2(mux_237_nl, or_tmp_255, fsm_output(4));
  mux_241_nl <= MUX_s_1_2_2((NOT mux_240_nl), mux_238_nl, fsm_output(5));
  mux_244_nl <= MUX_s_1_2_2(mux_243_nl, mux_241_nl, fsm_output(2));
  mux_234_nl <= MUX_s_1_2_2(or_tmp_255, or_tmp_254, fsm_output(4));
  or_306_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(7))) OR (fsm_output(6));
  mux_232_nl <= MUX_s_1_2_2(or_306_nl, or_tmp_277, or_605_cse);
  or_304_nl <= and_224_cse OR (fsm_output(6));
  mux_231_nl <= MUX_s_1_2_2(or_304_nl, or_303_cse, and_231_cse);
  mux_233_nl <= MUX_s_1_2_2(mux_232_nl, mux_231_nl, fsm_output(4));
  mux_235_nl <= MUX_s_1_2_2(mux_234_nl, mux_233_nl, fsm_output(5));
  mux_228_nl <= MUX_s_1_2_2(or_tmp_255, or_tmp_254, and_226_cse);
  mux_229_nl <= MUX_s_1_2_2(mux_228_nl, or_tmp_254, fsm_output(4));
  mux_227_nl <= MUX_s_1_2_2(or_tmp_277, or_298_cse, fsm_output(4));
  mux_230_nl <= MUX_s_1_2_2(mux_229_nl, mux_227_nl, fsm_output(5));
  mux_236_nl <= MUX_s_1_2_2(mux_235_nl, mux_230_nl, fsm_output(2));
  mux_245_nl <= MUX_s_1_2_2(mux_244_nl, mux_236_nl, fsm_output(8));
  COMP_LOOP_and_11_nl <= (NOT and_dcpl_82) AND and_dcpl_72;
  and_288_nl <= (NOT((fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(2)))) AND
      (fsm_output(8));
  or_592_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT
      (fsm_output(8)));
  nor_165_nl <= NOT((NOT(and_231_cse OR (fsm_output(2)))) OR (fsm_output(8)));
  mux_397_nl <= MUX_s_1_2_2(or_592_nl, nor_165_nl, fsm_output(5));
  mux_398_nl <= MUX_s_1_2_2(and_288_nl, mux_397_nl, fsm_output(4));
  nor_167_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("110"))))
      OR (fsm_output(8)));
  and_186_nl <= (fsm_output(2)) AND (fsm_output(8));
  mux_395_nl <= MUX_s_1_2_2(nor_167_nl, and_186_nl, fsm_output(5));
  mux_396_nl <= MUX_s_1_2_2(mux_395_nl, mux_tmp_387, fsm_output(4));
  mux_399_nl <= MUX_s_1_2_2(mux_398_nl, mux_396_nl, fsm_output(6));
  or_463_nl <= (fsm_output(5)) OR not_tmp_252;
  nor_168_nl <= NOT(nor_161_cse OR (NOT (fsm_output(2))) OR (fsm_output(8)));
  mux_392_nl <= MUX_s_1_2_2(nor_168_nl, (fsm_output(8)), fsm_output(5));
  mux_393_nl <= MUX_s_1_2_2(or_463_nl, mux_392_nl, fsm_output(4));
  mux_390_nl <= MUX_s_1_2_2(not_tmp_252, (fsm_output(8)), fsm_output(5));
  mux_391_nl <= MUX_s_1_2_2(mux_tmp_387, mux_390_nl, fsm_output(4));
  mux_394_nl <= MUX_s_1_2_2((NOT mux_393_nl), mux_391_nl, fsm_output(6));
  mux_400_nl <= MUX_s_1_2_2(mux_399_nl, mux_394_nl, fsm_output(3));
  or_458_nl <= (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_388_nl <= MUX_s_1_2_2(mux_tmp_387, or_458_nl, fsm_output(4));
  or_459_nl <= (fsm_output(6)) OR mux_388_nl;
  or_457_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(8)));
  mux_384_nl <= MUX_s_1_2_2(or_457_nl, (fsm_output(8)), fsm_output(5));
  or_455_nl <= and_187_cse OR (fsm_output(8));
  mux_385_nl <= MUX_s_1_2_2(mux_384_nl, or_455_nl, fsm_output(4));
  nand_49_nl <= NOT((fsm_output(4)) AND (fsm_output(5)) AND (fsm_output(0)) AND (fsm_output(1))
      AND (fsm_output(2)) AND (NOT (fsm_output(8))));
  mux_386_nl <= MUX_s_1_2_2(mux_385_nl, nand_49_nl, fsm_output(6));
  mux_389_nl <= MUX_s_1_2_2(or_459_nl, mux_386_nl, fsm_output(3));
  mux_401_nl <= MUX_s_1_2_2(mux_400_nl, (NOT mux_389_nl), fsm_output(7));
  COMP_LOOP_mux1h_11_nl <= MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z(0)), (tmp_2_lpi_4_dfm(0)),
      modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, STD_LOGIC_VECTOR'( COMP_LOOP_and_11_nl
      & and_dcpl_82 & and_dcpl_125 & mux_401_nl));
  nand_38_nl <= NOT(((fsm_output(7)) OR (fsm_output(2))) AND (fsm_output(5)));
  mux_478_nl <= MUX_s_1_2_2(nand_38_nl, or_tmp_524, fsm_output(6));
  mux_479_nl <= MUX_s_1_2_2(mux_tmp_476, mux_478_nl, fsm_output(4));
  mux_474_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), and_187_cse, fsm_output(7));
  or_558_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(1))
      OR (fsm_output(5));
  mux_475_nl <= MUX_s_1_2_2(mux_474_nl, or_558_nl, fsm_output(6));
  mux_477_nl <= MUX_s_1_2_2(mux_tmp_476, mux_475_nl, fsm_output(4));
  mux_480_nl <= MUX_s_1_2_2(mux_479_nl, mux_477_nl, fsm_output(3));
  and_162_nl <= (fsm_output(2)) AND or_605_cse AND (fsm_output(5));
  mux_470_nl <= MUX_s_1_2_2(and_162_nl, (fsm_output(5)), fsm_output(7));
  or_556_nl <= (fsm_output(7)) OR (NOT((fsm_output(2)) AND (fsm_output(5))));
  mux_471_nl <= MUX_s_1_2_2(mux_470_nl, or_556_nl, fsm_output(6));
  mux_472_nl <= MUX_s_1_2_2(mux_471_nl, mux_tmp_466, fsm_output(4));
  or_555_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(5));
  mux_467_nl <= MUX_s_1_2_2((fsm_output(5)), or_555_nl, fsm_output(7));
  mux_468_nl <= MUX_s_1_2_2(mux_467_nl, or_tmp_523, fsm_output(6));
  mux_469_nl <= MUX_s_1_2_2(mux_468_nl, mux_tmp_466, fsm_output(4));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output(3));
  mux_481_nl <= MUX_s_1_2_2(mux_480_nl, mux_473_nl, fsm_output(8));
  COMP_LOOP_mux1h_20_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_1_sva_7_0(7)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_1_sva_7_0(1)), STD_LOGIC_VECTOR'( and_dcpl_124
      & and_dcpl_139 & (NOT mux_481_nl) & and_dcpl_127));
  COMP_LOOP_mux1h_37_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_1_sva_7_0(6)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_1_sva_7_0(7)), STD_LOGIC_VECTOR'( and_dcpl_124
      & and_dcpl_132 & not_tmp_310 & and_dcpl_127));
  mux_252_nl <= MUX_s_1_2_2(mux_tmp_94, and_215_cse, fsm_output(3));
  or_684_nl <= (NOT (fsm_output(1))) OR (fsm_output(3));
  mux_529_nl <= MUX_s_1_2_2(and_226_cse, or_684_nl, fsm_output(0));
  mux_530_nl <= MUX_s_1_2_2(mux_529_nl, (fsm_output(3)), fsm_output(2));
  nor_394_nl <= NOT((fsm_output(6)) OR mux_530_nl);
  and_425_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  mux_531_nl <= MUX_s_1_2_2(nor_394_nl, and_425_nl, fsm_output(4));
  nand_128_nl <= NOT((fsm_output(6)) AND (fsm_output(2)) AND (fsm_output(0)) AND
      (fsm_output(1)) AND (fsm_output(3)));
  nor_395_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(0))) OR
      (fsm_output(1)) OR (fsm_output(3)));
  mux_528_nl <= MUX_s_1_2_2(nand_128_nl, nor_395_nl, fsm_output(4));
  mux_532_nl <= MUX_s_1_2_2(mux_531_nl, mux_528_nl, fsm_output(5));
  nor_398_nl <= NOT((fsm_output(2)) OR or_tmp_586);
  mux_526_nl <= MUX_s_1_2_2((fsm_output(3)), nor_398_nl, fsm_output(6));
  and_427_nl <= (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(3));
  mux_525_nl <= MUX_s_1_2_2(and_427_nl, (fsm_output(3)), fsm_output(2));
  nor_399_nl <= NOT((fsm_output(6)) OR mux_525_nl);
  mux_527_nl <= MUX_s_1_2_2(mux_526_nl, nor_399_nl, fsm_output(4));
  and_426_nl <= (fsm_output(5)) AND mux_527_nl;
  mux_533_nl <= MUX_s_1_2_2(mux_532_nl, and_426_nl, fsm_output(8));
  and_428_nl <= (fsm_output(6)) AND (CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")));
  and_429_nl <= (fsm_output(2)) AND (NOT or_tmp_586);
  nor_396_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  mux_521_nl <= MUX_s_1_2_2(and_429_nl, nor_396_nl, fsm_output(6));
  mux_522_nl <= MUX_s_1_2_2(and_428_nl, mux_521_nl, fsm_output(4));
  nor_397_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(3))));
  mux_520_nl <= MUX_s_1_2_2(nor_tmp, nor_397_nl, fsm_output(2));
  and_430_nl <= (fsm_output(4)) AND (fsm_output(6)) AND mux_520_nl;
  mux_523_nl <= MUX_s_1_2_2(mux_522_nl, and_430_nl, fsm_output(5));
  and_431_nl <= (fsm_output(2)) AND nor_tmp;
  mux_nl <= MUX_s_1_2_2((fsm_output(3)), or_674_cse, fsm_output(2));
  mux_518_nl <= MUX_s_1_2_2(and_431_nl, mux_nl, fsm_output(6));
  or_676_nl <= (fsm_output(4)) OR mux_518_nl;
  mux_519_nl <= MUX_s_1_2_2(or_676_nl, (fsm_output(6)), fsm_output(5));
  mux_524_nl <= MUX_s_1_2_2(mux_523_nl, mux_519_nl, fsm_output(8));
  mux_534_nl <= MUX_s_1_2_2(mux_533_nl, mux_524_nl, fsm_output(7));
  nand_125_nl <= NOT((fsm_output(3)) AND (fsm_output(1)));
  mux_545_nl <= MUX_s_1_2_2(nand_125_nl, (fsm_output(1)), fsm_output(0));
  nor_389_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR mux_545_nl);
  or_700_nl <= (NOT modExp_exp_1_0_1_sva) OR (fsm_output(3)) OR (NOT (fsm_output(1)));
  mux_543_nl <= MUX_s_1_2_2((fsm_output(3)), or_700_nl, fsm_output(0));
  and_421_nl <= (fsm_output(5)) AND (NOT mux_543_nl);
  nor_390_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(0))) OR (NOT modExp_exp_1_0_1_sva)
      OR (NOT (fsm_output(3))) OR (fsm_output(1)));
  mux_544_nl <= MUX_s_1_2_2(and_421_nl, nor_390_nl, fsm_output(7));
  mux_546_nl <= MUX_s_1_2_2(nor_389_nl, mux_544_nl, fsm_output(4));
  or_697_nl <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(1)));
  mux_542_nl <= MUX_s_1_2_2(or_697_nl, or_tmp_600, fsm_output(5));
  and_422_nl <= (fsm_output(4)) AND (fsm_output(7)) AND (NOT mux_542_nl);
  mux_547_nl <= MUX_s_1_2_2(mux_546_nl, and_422_nl, fsm_output(2));
  and_424_nl <= ((NOT (fsm_output(0))) OR modExp_exp_1_0_1_sva) AND (fsm_output(3))
      AND (fsm_output(1));
  mux_540_nl <= MUX_s_1_2_2((NOT or_674_cse), and_424_nl, fsm_output(5));
  and_415_nl <= (fsm_output(7)) AND mux_540_nl;
  mux_541_nl <= MUX_s_1_2_2((NOT or_tmp_598), and_415_nl, fsm_output(4));
  and_423_nl <= (fsm_output(2)) AND mux_541_nl;
  mux_548_nl <= MUX_s_1_2_2(mux_547_nl, and_423_nl, fsm_output(6));
  mux_537_nl <= MUX_s_1_2_2(or_tmp_600, or_674_cse, fsm_output(5));
  nand_118_nl <= NOT((fsm_output(7)) AND (NOT mux_537_nl));
  mux_538_nl <= MUX_s_1_2_2(nand_118_nl, or_tmp_598, fsm_output(4));
  nor_391_nl <= NOT((fsm_output(2)) OR mux_538_nl);
  nor_392_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(5))) OR
      (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(1))));
  nor_393_nl <= NOT((fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(5))) OR
      (NOT (fsm_output(0))) OR (NOT modExp_exp_1_0_1_sva) OR (fsm_output(3)) OR (fsm_output(1)));
  mux_535_nl <= MUX_s_1_2_2(nor_392_nl, nor_393_nl, fsm_output(2));
  mux_539_nl <= MUX_s_1_2_2(nor_391_nl, mux_535_nl, fsm_output(6));
  nand_25_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11")) AND
      (NOT mux_tmp_296));
  mux_297_nl <= MUX_s_1_2_2(or_tmp_351, nand_25_nl, fsm_output(3));
  or_372_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000010"));
  mux_298_nl <= MUX_s_1_2_2(mux_297_nl, or_372_nl, fsm_output(0));
  or_nl <= mux_298_nl OR (fsm_output(1));
  nor_386_nl <= NOT((fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(8))
      OR (fsm_output(2)) OR (NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")))));
  nor_387_nl <= NOT((fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(2)) OR (fsm_output(4))
      OR (fsm_output(5)));
  and_418_nl <= (fsm_output(7)) AND not_tmp_395;
  mux_551_nl <= MUX_s_1_2_2(nor_387_nl, and_418_nl, fsm_output(1));
  and_417_nl <= (fsm_output(0)) AND mux_551_nl;
  mux_552_nl <= MUX_s_1_2_2(nor_386_nl, and_417_nl, fsm_output(3));
  and_419_nl <= (NOT((NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(1))
      OR (NOT (fsm_output(7))))) AND not_tmp_395;
  mux_312_nl <= MUX_s_1_2_2(not_tmp_197, and_215_cse, fsm_output(4));
  mux_309_nl <= MUX_s_1_2_2(not_tmp_197, and_215_cse, or_581_cse);
  mux_307_nl <= MUX_s_1_2_2(mux_tmp_40, and_215_cse, fsm_output(4));
  mux_306_nl <= MUX_s_1_2_2(and_215_cse, mux_tmp_40, fsm_output(4));
  mux_308_nl <= MUX_s_1_2_2(mux_307_nl, mux_306_nl, fsm_output(2));
  mux_310_nl <= MUX_s_1_2_2(mux_309_nl, mux_308_nl, fsm_output(0));
  mux_311_nl <= MUX_s_1_2_2(mux_310_nl, and_215_cse, fsm_output(1));
  mux_313_nl <= MUX_s_1_2_2(mux_312_nl, mux_311_nl, fsm_output(3));
  mux_314_nl <= MUX_s_1_2_2(mux_313_nl, and_215_cse, fsm_output(5));
  and_100_nl <= and_dcpl_15 AND and_dcpl_78;
  r_or_nl <= ((NOT (modulo_result_rem_cmp_z(63))) AND and_102_m1c) OR (not_tmp_236
      AND and_dcpl_97 AND (fsm_output(0)) AND (NOT (modulo_result_rem_cmp_z(63))));
  r_or_1_nl <= ((modulo_result_rem_cmp_z(63)) AND and_102_m1c) OR (not_tmp_236 AND
      and_dcpl_97 AND (fsm_output(0)) AND (modulo_result_rem_cmp_z(63)));
  and_105_nl <= not_tmp_208 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("00"));
  and_107_nl <= not_tmp_208 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("01"));
  and_109_nl <= not_tmp_208 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("10"));
  and_111_nl <= not_tmp_208 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11"));
  nor_302_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("011"))
      OR not_tmp_20);
  nor_303_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR
      (fsm_output(0)) OR (fsm_output(7)));
  mux_17_nl <= MUX_s_1_2_2(nor_302_nl, nor_303_nl, fsm_output(5));
  nand_nl <= NOT((fsm_output(8)) AND mux_17_nl);
  or_32_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")) OR not_tmp_20;
  or_30_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(0)) OR
      (fsm_output(7));
  mux_16_nl <= MUX_s_1_2_2(or_32_nl, or_30_nl, fsm_output(2));
  or_620_nl <= (fsm_output(8)) OR (fsm_output(5)) OR mux_16_nl;
  mux_18_nl <= MUX_s_1_2_2(nand_nl, or_620_nl, fsm_output(6));
  nor_301_nl <= NOT(mux_18_nl OR (fsm_output(1)));
  or_593_nl <= (fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(7)));
  or_594_nl <= (fsm_output(0)) OR (NOT and_224_cse);
  mux_359_nl <= MUX_s_1_2_2(or_593_nl, or_594_nl, fsm_output(4));
  nand_51_nl <= NOT((fsm_output(4)) AND (fsm_output(7)));
  mux_360_nl <= MUX_s_1_2_2(mux_359_nl, nand_51_nl, fsm_output(5));
  mux_358_nl <= MUX_s_1_2_2((NOT nor_tmp_97), nor_tmp_97, fsm_output(5));
  mux_361_nl <= MUX_s_1_2_2(mux_360_nl, mux_358_nl, fsm_output(6));
  nand_52_nl <= NOT((fsm_output(5)) AND nor_tmp_97);
  mux_355_nl <= MUX_s_1_2_2((fsm_output(7)), mux_tmp_341, fsm_output(4));
  mux_356_nl <= MUX_s_1_2_2((NOT mux_355_nl), nor_tmp_97, fsm_output(5));
  mux_357_nl <= MUX_s_1_2_2(nand_52_nl, mux_356_nl, fsm_output(6));
  mux_362_nl <= MUX_s_1_2_2(mux_361_nl, mux_357_nl, fsm_output(2));
  or_595_nl <= (fsm_output(4)) OR (fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(7));
  nand_53_nl <= NOT((fsm_output(4)) AND ((NOT((NOT (fsm_output(0))) OR (fsm_output(3))))
      OR (fsm_output(7))));
  mux_352_nl <= MUX_s_1_2_2(or_595_nl, nand_53_nl, fsm_output(5));
  nand_54_nl <= NOT(((NOT (fsm_output(4))) OR (NOT (fsm_output(0))) OR (fsm_output(3)))
      AND (fsm_output(7)));
  mux_351_nl <= MUX_s_1_2_2(nand_54_nl, nor_tmp_97, fsm_output(5));
  mux_353_nl <= MUX_s_1_2_2(mux_352_nl, mux_351_nl, fsm_output(6));
  mux_349_nl <= MUX_s_1_2_2(and_224_cse, (NOT or_tmp_398), fsm_output(4));
  nand_55_nl <= NOT((fsm_output(5)) AND mux_349_nl);
  nor_181_nl <= NOT((CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")))
      OR (fsm_output(7)));
  mux_347_nl <= MUX_s_1_2_2(or_604_cse, (NOT or_tmp_398), fsm_output(4));
  mux_348_nl <= MUX_s_1_2_2(nor_181_nl, mux_347_nl, fsm_output(5));
  mux_350_nl <= MUX_s_1_2_2(nand_55_nl, mux_348_nl, fsm_output(6));
  mux_354_nl <= MUX_s_1_2_2(mux_353_nl, mux_350_nl, fsm_output(2));
  mux_363_nl <= MUX_s_1_2_2(mux_362_nl, mux_354_nl, fsm_output(1));
  mux_342_nl <= MUX_s_1_2_2((NOT mux_tmp_341), and_224_cse, fsm_output(4));
  mux_343_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), mux_342_nl, fsm_output(5));
  mux_344_nl <= MUX_s_1_2_2(mux_343_nl, mux_68_cse, fsm_output(6));
  nor_182_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(7))));
  mux_338_nl <= MUX_s_1_2_2(nor_182_nl, (fsm_output(7)), fsm_output(4));
  mux_339_nl <= MUX_s_1_2_2((NOT mux_338_nl), mux_63_cse, fsm_output(5));
  or_426_nl <= (fsm_output(4)) OR and_196_cse OR (fsm_output(7));
  or_424_nl <= (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(7));
  or_104_nl <= (NOT (fsm_output(3))) OR (fsm_output(7));
  mux_336_nl <= MUX_s_1_2_2(or_424_nl, or_104_nl, fsm_output(4));
  mux_337_nl <= MUX_s_1_2_2(or_426_nl, mux_336_nl, fsm_output(5));
  mux_340_nl <= MUX_s_1_2_2(mux_339_nl, mux_337_nl, fsm_output(6));
  mux_345_nl <= MUX_s_1_2_2(mux_344_nl, mux_340_nl, fsm_output(2));
  mux_332_nl <= MUX_s_1_2_2(or_tmp_398, (NOT (fsm_output(7))), fsm_output(4));
  mux_331_nl <= MUX_s_1_2_2((NOT or_604_cse), or_604_cse, fsm_output(4));
  mux_333_nl <= MUX_s_1_2_2(mux_332_nl, mux_331_nl, fsm_output(5));
  mux_334_nl <= MUX_s_1_2_2(mux_333_nl, mux_68_cse, fsm_output(6));
  nand_87_nl <= NOT((NOT((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(3))))
      AND (fsm_output(7)));
  mux_328_nl <= MUX_s_1_2_2(nand_87_nl, mux_63_cse, fsm_output(5));
  or_418_nl <= (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(7));
  mux_326_nl <= MUX_s_1_2_2(or_418_nl, or_tmp_69, fsm_output(5));
  mux_329_nl <= MUX_s_1_2_2(mux_328_nl, mux_326_nl, fsm_output(6));
  mux_335_nl <= MUX_s_1_2_2(mux_334_nl, mux_329_nl, fsm_output(2));
  mux_346_nl <= MUX_s_1_2_2(mux_345_nl, mux_335_nl, fsm_output(1));
  COMP_LOOP_or_3_nl <= ((NOT((VEC_LOOP_j_1_12_0_sva_11_0(0)) OR (COMP_LOOP_acc_psp_1_sva(0))))
      AND and_123_m1c) OR ((NOT mux_tmp_103) AND and_dcpl_105 AND (NOT (COMP_LOOP_acc_1_cse_2_sva(0)))
      AND and_dcpl_23) OR ((NOT((reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) OR (COMP_LOOP_acc_psp_1_sva(0))))
      AND and_138_m1c);
  COMP_LOOP_or_4_nl <= ((COMP_LOOP_acc_psp_1_sva(0)) AND (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0)))
      AND and_123_m1c) OR ((NOT mux_tmp_103) AND and_dcpl_112 AND (NOT (COMP_LOOP_acc_1_cse_2_sva(0)))
      AND and_dcpl_23) OR ((COMP_LOOP_acc_psp_1_sva(0)) AND (NOT (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)))
      AND and_138_m1c);
  COMP_LOOP_or_5_nl <= ((VEC_LOOP_j_1_12_0_sva_11_0(0)) AND (NOT (COMP_LOOP_acc_psp_1_sva(0)))
      AND and_123_m1c) OR ((NOT mux_tmp_103) AND and_dcpl_105 AND (COMP_LOOP_acc_1_cse_2_sva(0))
      AND and_dcpl_23) OR ((reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) AND (NOT (COMP_LOOP_acc_psp_1_sva(0)))
      AND and_138_m1c);
  COMP_LOOP_or_6_nl <= ((VEC_LOOP_j_1_12_0_sva_11_0(0)) AND (COMP_LOOP_acc_psp_1_sva(0))
      AND and_123_m1c) OR ((NOT mux_tmp_103) AND and_dcpl_112 AND (COMP_LOOP_acc_1_cse_2_sva(0))
      AND and_dcpl_23) OR ((reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) AND (COMP_LOOP_acc_psp_1_sva(0))
      AND and_138_m1c);
  and_189_nl <= (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4));
  mux_377_nl <= MUX_s_1_2_2(or_tmp_417, and_189_nl, fsm_output(6));
  nor_174_nl <= NOT((fsm_output(2)) OR and_231_cse OR (fsm_output(7)) OR (NOT (fsm_output(4))));
  mux_376_nl <= MUX_s_1_2_2(nor_174_nl, or_95_cse, fsm_output(6));
  mux_378_nl <= MUX_s_1_2_2(mux_377_nl, mux_376_nl, fsm_output(5));
  nor_175_nl <= NOT((NOT(nor_217_cse OR (fsm_output(7)))) OR (fsm_output(4)));
  mux_374_nl <= MUX_s_1_2_2(nor_175_nl, nor_tmp_103, fsm_output(6));
  mux_373_nl <= MUX_s_1_2_2(or_95_cse, (NOT nor_tmp_103), and_230_cse);
  and_191_nl <= (fsm_output(6)) AND mux_373_nl;
  mux_375_nl <= MUX_s_1_2_2(mux_374_nl, and_191_nl, fsm_output(5));
  mux_379_nl <= MUX_s_1_2_2(mux_378_nl, mux_375_nl, fsm_output(3));
  or_440_nl <= (NOT (fsm_output(6))) OR (fsm_output(2));
  mux_370_nl <= MUX_s_1_2_2(or_tmp_417, (fsm_output(7)), or_440_nl);
  mux_371_nl <= MUX_s_1_2_2((fsm_output(6)), mux_370_nl, fsm_output(5));
  mux_366_nl <= MUX_s_1_2_2((fsm_output(7)), or_95_cse, and_231_cse);
  mux_367_nl <= MUX_s_1_2_2(mux_366_nl, or_95_cse, fsm_output(2));
  mux_368_nl <= MUX_s_1_2_2(mux_367_nl, (fsm_output(7)), fsm_output(6));
  mux_369_nl <= MUX_s_1_2_2((fsm_output(6)), mux_368_nl, fsm_output(5));
  mux_372_nl <= MUX_s_1_2_2(mux_371_nl, mux_369_nl, fsm_output(3));
  VEC_LOOP_1_COMP_LOOP_1_acc_11_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_4
      & '0') + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'(
      "0000000001"), 10));
  or_506_nl <= (fsm_output(6)) OR (NOT (fsm_output(8))) OR (fsm_output(0)) OR (fsm_output(1))
      OR (fsm_output(4));
  or_505_nl <= (fsm_output(6)) OR (fsm_output(8)) OR (NOT (fsm_output(0))) OR (NOT
      (fsm_output(1))) OR (fsm_output(4));
  mux_436_nl <= MUX_s_1_2_2(or_506_nl, or_505_nl, fsm_output(3));
  or_504_nl <= (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_437_nl <= MUX_s_1_2_2(mux_436_nl, or_504_nl, fsm_output(7));
  nor_330_nl <= NOT((fsm_output(5)) OR mux_437_nl);
  or_501_nl <= (fsm_output(8)) OR (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  or_499_nl <= (NOT (fsm_output(8))) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(4));
  mux_435_nl <= MUX_s_1_2_2(or_501_nl, or_499_nl, fsm_output(6));
  nor_331_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(3)) OR
      mux_435_nl);
  COMP_LOOP_mux_88_nl <= MUX_v_12_2_2(VEC_LOOP_j_1_12_0_sva_11_0, reg_VEC_LOOP_1_acc_1_psp_ftd_1,
      and_434_cse);
  and_175_nl <= (fsm_output(0)) AND (fsm_output(8)) AND (fsm_output(7));
  mux_447_nl <= MUX_s_1_2_2(not_tmp_38, and_175_nl, fsm_output(1));
  mux_448_nl <= MUX_s_1_2_2(mux_447_nl, and_182_cse, or_621_cse);
  mux_449_nl <= MUX_s_1_2_2(not_tmp_38, mux_448_nl, and_206_cse);
  and_177_nl <= (and_230_cse OR (fsm_output(8))) AND (fsm_output(7));
  mux_444_nl <= MUX_s_1_2_2(and_177_nl, (fsm_output(7)), fsm_output(3));
  and_179_nl <= (NOT((fsm_output(3)) AND (fsm_output(2)) AND (fsm_output(1)) AND
      (NOT (fsm_output(8))))) AND (fsm_output(7));
  mux_445_nl <= MUX_s_1_2_2(mux_444_nl, and_179_nl, fsm_output(4));
  mux_446_nl <= MUX_s_1_2_2(and_182_cse, mux_445_nl, fsm_output(5));
  and_172_nl <= (fsm_output(1)) AND (fsm_output(7)) AND (NOT (fsm_output(6))) AND
      (fsm_output(3)) AND mux_462_cse;
  or_544_nl <= (fsm_output(3)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(5)))
      OR (fsm_output(4)) OR (NOT (fsm_output(8)));
  or_542_nl <= (NOT (fsm_output(3))) OR (fsm_output(2)) OR (fsm_output(5)) OR (NOT
      (fsm_output(4))) OR (fsm_output(8));
  mux_461_nl <= MUX_s_1_2_2(or_544_nl, or_542_nl, fsm_output(6));
  nor_148_nl <= NOT((fsm_output(1)) OR (fsm_output(7)) OR mux_461_nl);
  mux_463_nl <= MUX_s_1_2_2(and_172_nl, nor_148_nl, fsm_output(0));
  nor_326_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT
      (fsm_output(8))));
  mux_457_nl <= MUX_s_1_2_2((fsm_output(8)), nor_326_nl, fsm_output(4));
  or_538_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(8));
  mux_456_nl <= MUX_s_1_2_2(or_538_nl, (fsm_output(8)), or_621_cse);
  and_286_nl <= (fsm_output(4)) AND (NOT mux_456_nl);
  mux_458_nl <= MUX_s_1_2_2(mux_457_nl, and_286_nl, fsm_output(5));
  nor_327_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR and_273_cse OR (fsm_output(8)));
  and_287_nl <= (CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"))) AND
      (fsm_output(8));
  mux_455_nl <= MUX_s_1_2_2(nor_327_nl, and_287_nl, fsm_output(5));
  mux_459_nl <= MUX_s_1_2_2(mux_458_nl, mux_455_nl, fsm_output(6));
  nor_316_nl <= NOT((fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(8))));
  mux_451_nl <= MUX_s_1_2_2((fsm_output(8)), nor_316_nl, fsm_output(3));
  nor_317_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_452_nl <= MUX_s_1_2_2(mux_451_nl, nor_317_nl, fsm_output(4));
  nor_318_nl <= NOT((CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111")))
      OR (fsm_output(8)));
  mux_453_nl <= MUX_s_1_2_2(mux_452_nl, nor_318_nl, fsm_output(5));
  and_283_nl <= (fsm_output(5)) AND (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(2))
      AND (fsm_output(0)) AND (fsm_output(1)) AND (NOT (fsm_output(8)));
  mux_454_nl <= MUX_s_1_2_2(mux_453_nl, and_283_nl, fsm_output(6));
  mux_460_nl <= MUX_s_1_2_2(mux_459_nl, mux_454_nl, fsm_output(7));
  COMP_LOOP_mux_85_nl <= MUX_v_10_2_2(('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO
      1)))), STAGE_LOOP_lshift_psp_sva, and_dcpl_150);
  nor_400_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(5)) OR (NOT (fsm_output(4)))
      OR (fsm_output(8)) OR (NOT (fsm_output(3))));
  nor_401_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(5))) OR (fsm_output(4)) OR
      (NOT (fsm_output(8))) OR (fsm_output(3)));
  mux_555_nl <= MUX_s_1_2_2(nor_400_nl, nor_401_nl, fsm_output(2));
  COMP_LOOP_COMP_LOOP_nand_1_nl <= NOT(and_dcpl_150 AND (NOT(mux_555_nl AND (NOT
      (fsm_output(7))) AND (fsm_output(1)) AND (NOT (fsm_output(0))))));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_85_nl & COMP_LOOP_COMP_LOOP_nand_1_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0 & STD_LOGIC_VECTOR'(
      "11")), 10), 11), 11));
  z_out <= acc_nl(10 DOWNTO 1);
  COMP_LOOP_mux_86_nl <= MUX_s_1_2_2((tmp_2_lpi_4_dfm(63)), (p_sva(63)), and_dcpl_163);
  COMP_LOOP_COMP_LOOP_or_53_nl <= (COMP_LOOP_mux_86_nl AND COMP_LOOP_nor_3_itm) OR
      and_dcpl_155 OR and_dcpl_169;
  COMP_LOOP_mux1h_67_nl <= MUX1HOT_v_51_3_2((tmp_2_lpi_4_dfm(62 DOWNTO 12)), (p_sva(62
      DOWNTO 12)), (NOT (operator_64_false_acc_mut_63_0(62 DOWNTO 12))), STD_LOGIC_VECTOR'(
      not_tmp_321 & and_dcpl_163 & and_dcpl_169));
  COMP_LOOP_and_70_nl <= MUX_v_51_2_2(STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux1h_67_nl, COMP_LOOP_nor_3_itm);
  COMP_LOOP_or_32_nl <= MUX_v_51_2_2(COMP_LOOP_and_70_nl, STD_LOGIC_VECTOR'("111111111111111111111111111111111111111111111111111"),
      and_dcpl_155);
  COMP_LOOP_mux1h_68_nl <= MUX1HOT_v_2_5_2((tmp_2_lpi_4_dfm(11 DOWNTO 10)), (p_sva(11
      DOWNTO 10)), (NOT (operator_64_false_acc_mut_63_0(11 DOWNTO 10))), (VEC_LOOP_j_1_12_0_sva_11_0(11
      DOWNTO 10)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11 DOWNTO 10)), STD_LOGIC_VECTOR'(
      not_tmp_321 & and_dcpl_163 & and_dcpl_169 & and_dcpl_195 & and_dcpl_197));
  COMP_LOOP_nor_59_nl <= NOT(and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_199);
  COMP_LOOP_and_71_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_68_nl,
      COMP_LOOP_nor_59_nl);
  COMP_LOOP_or_33_nl <= MUX_v_2_2_2(COMP_LOOP_and_71_nl, STD_LOGIC_VECTOR'("11"),
      and_dcpl_155);
  COMP_LOOP_acc_33_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0),
      8), 9), 9));
  COMP_LOOP_or_34_nl <= and_dcpl_175 OR and_dcpl_187;
  COMP_LOOP_or_35_nl <= and_dcpl_180 OR and_dcpl_192;
  COMP_LOOP_mux1h_69_nl <= MUX1HOT_v_10_9_2((tmp_2_lpi_4_dfm(9 DOWNTO 0)), ('1' &
      (NOT COMP_LOOP_k_9_1_1_sva_7_0) & '1'), (p_sva(9 DOWNTO 0)), (NOT (operator_64_false_acc_mut_63_0(9
      DOWNTO 0))), (STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_33_nl),
      9)) & (STAGE_LOOP_lshift_psp_sva(0))), z_out, (VEC_LOOP_j_1_12_0_sva_11_0(9
      DOWNTO 0)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(9 DOWNTO 0)), (STD_LOGIC_VECTOR'(
      "0000000") & (z_out_4(3 DOWNTO 1))), STD_LOGIC_VECTOR'( not_tmp_321 & and_dcpl_155
      & and_dcpl_163 & and_dcpl_169 & COMP_LOOP_or_34_nl & COMP_LOOP_or_35_nl & and_dcpl_195
      & and_dcpl_197 & and_dcpl_199));
  COMP_LOOP_or_36_nl <= (NOT(and_dcpl_155 OR and_dcpl_163 OR and_dcpl_169 OR and_dcpl_175
      OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192 OR and_dcpl_195 OR and_dcpl_197
      OR and_dcpl_199)) OR not_tmp_321;
  COMP_LOOP_COMP_LOOP_or_54_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(63)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_55_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(62)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_56_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(61)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_57_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(60)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_58_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(59)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_59_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(58)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_60_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(57)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_61_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(56)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_62_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(55)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_63_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(54)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_64_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(53)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_65_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(52)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_66_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(51)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_67_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(50)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_68_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(49)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_69_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(48)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_70_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(47)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_71_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(46)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_72_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(45)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_73_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(44)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_74_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(43)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_75_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(42)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_76_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(41)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_77_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(40)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_78_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(39)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_79_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(38)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_80_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(37)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_81_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(36)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_82_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(35)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_83_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(34)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_84_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(33)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_85_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(32)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_86_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(31)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_87_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(30)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_88_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(29)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_89_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(28)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_90_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(27)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_91_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(26)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_92_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(25)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_93_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(24)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_94_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(23)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_95_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(22)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_96_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(21)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_97_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(20)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_98_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(19)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_99_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(18)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_100_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(17)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_101_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(16)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_102_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(15)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_103_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(14)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_104_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(13)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_COMP_LOOP_or_105_nl <= (NOT((COMP_LOOP_mux1h_1_itm_mx1(12)) OR and_dcpl_155
      OR and_dcpl_169 OR and_dcpl_175 OR and_dcpl_180 OR and_dcpl_187 OR and_dcpl_192
      OR and_dcpl_195 OR and_dcpl_197 OR and_dcpl_199)) OR and_dcpl_163;
  COMP_LOOP_mux1h_70_nl <= MUX1HOT_v_2_3_2((NOT (COMP_LOOP_mux1h_1_itm_mx1(11 DOWNTO
      10))), (VEC_LOOP_j_1_12_0_sva_11_0(11 DOWNTO 10)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11
      DOWNTO 10)), STD_LOGIC_VECTOR'( not_tmp_321 & COMP_LOOP_or_24_itm & COMP_LOOP_or_25_itm));
  COMP_LOOP_nor_61_nl <= NOT(and_dcpl_155 OR and_dcpl_169 OR and_dcpl_195 OR and_dcpl_197
      OR and_dcpl_199);
  COMP_LOOP_and_72_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_70_nl,
      COMP_LOOP_nor_61_nl);
  COMP_LOOP_or_37_nl <= MUX_v_2_2_2(COMP_LOOP_and_72_nl, STD_LOGIC_VECTOR'("11"),
      and_dcpl_163);
  COMP_LOOP_or_39_nl <= and_dcpl_155 OR and_dcpl_169;
  COMP_LOOP_or_40_nl <= and_dcpl_195 OR and_dcpl_197;
  COMP_LOOP_mux1h_71_nl <= MUX1HOT_v_10_6_2((NOT (COMP_LOOP_mux1h_1_itm_mx1(9 DOWNTO
      0))), STD_LOGIC_VECTOR'( "0000000001"), (VEC_LOOP_j_1_12_0_sva_11_0(9 DOWNTO
      0)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(9 DOWNTO 0)), STAGE_LOOP_lshift_psp_sva,
      STD_LOGIC_VECTOR'( "0000000011"), STD_LOGIC_VECTOR'( not_tmp_321 & COMP_LOOP_or_39_nl
      & COMP_LOOP_or_24_itm & COMP_LOOP_or_25_itm & COMP_LOOP_or_40_nl & and_dcpl_199));
  COMP_LOOP_or_38_nl <= MUX_v_10_2_2(COMP_LOOP_mux1h_71_nl, STD_LOGIC_VECTOR'("1111111111"),
      and_dcpl_163);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_53_nl
      & COMP_LOOP_or_32_nl & COMP_LOOP_or_33_nl & COMP_LOOP_mux1h_69_nl & COMP_LOOP_or_36_nl),
      65), 66) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_COMP_LOOP_or_54_nl &
      COMP_LOOP_COMP_LOOP_or_55_nl & COMP_LOOP_COMP_LOOP_or_56_nl & COMP_LOOP_COMP_LOOP_or_57_nl
      & COMP_LOOP_COMP_LOOP_or_58_nl & COMP_LOOP_COMP_LOOP_or_59_nl & COMP_LOOP_COMP_LOOP_or_60_nl
      & COMP_LOOP_COMP_LOOP_or_61_nl & COMP_LOOP_COMP_LOOP_or_62_nl & COMP_LOOP_COMP_LOOP_or_63_nl
      & COMP_LOOP_COMP_LOOP_or_64_nl & COMP_LOOP_COMP_LOOP_or_65_nl & COMP_LOOP_COMP_LOOP_or_66_nl
      & COMP_LOOP_COMP_LOOP_or_67_nl & COMP_LOOP_COMP_LOOP_or_68_nl & COMP_LOOP_COMP_LOOP_or_69_nl
      & COMP_LOOP_COMP_LOOP_or_70_nl & COMP_LOOP_COMP_LOOP_or_71_nl & COMP_LOOP_COMP_LOOP_or_72_nl
      & COMP_LOOP_COMP_LOOP_or_73_nl & COMP_LOOP_COMP_LOOP_or_74_nl & COMP_LOOP_COMP_LOOP_or_75_nl
      & COMP_LOOP_COMP_LOOP_or_76_nl & COMP_LOOP_COMP_LOOP_or_77_nl & COMP_LOOP_COMP_LOOP_or_78_nl
      & COMP_LOOP_COMP_LOOP_or_79_nl & COMP_LOOP_COMP_LOOP_or_80_nl & COMP_LOOP_COMP_LOOP_or_81_nl
      & COMP_LOOP_COMP_LOOP_or_82_nl & COMP_LOOP_COMP_LOOP_or_83_nl & COMP_LOOP_COMP_LOOP_or_84_nl
      & COMP_LOOP_COMP_LOOP_or_85_nl & COMP_LOOP_COMP_LOOP_or_86_nl & COMP_LOOP_COMP_LOOP_or_87_nl
      & COMP_LOOP_COMP_LOOP_or_88_nl & COMP_LOOP_COMP_LOOP_or_89_nl & COMP_LOOP_COMP_LOOP_or_90_nl
      & COMP_LOOP_COMP_LOOP_or_91_nl & COMP_LOOP_COMP_LOOP_or_92_nl & COMP_LOOP_COMP_LOOP_or_93_nl
      & COMP_LOOP_COMP_LOOP_or_94_nl & COMP_LOOP_COMP_LOOP_or_95_nl & COMP_LOOP_COMP_LOOP_or_96_nl
      & COMP_LOOP_COMP_LOOP_or_97_nl & COMP_LOOP_COMP_LOOP_or_98_nl & COMP_LOOP_COMP_LOOP_or_99_nl
      & COMP_LOOP_COMP_LOOP_or_100_nl & COMP_LOOP_COMP_LOOP_or_101_nl & COMP_LOOP_COMP_LOOP_or_102_nl
      & COMP_LOOP_COMP_LOOP_or_103_nl & COMP_LOOP_COMP_LOOP_or_104_nl & COMP_LOOP_COMP_LOOP_or_105_nl
      & COMP_LOOP_or_37_nl & COMP_LOOP_or_38_nl & '1'), 65), 66), 66));
  z_out_1 <= acc_1_nl(65 DOWNTO 1);
  and_434_cse <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("011111101"));
  COMP_LOOP_mux_87_nl <= MUX_v_11_2_2((VEC_LOOP_j_1_12_0_sva_11_0(11 DOWNTO 1)),
      (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11 DOWNTO 1)), and_434_cse);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_87_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0),
      8), 11), 11));
  operator_64_false_1_operator_64_false_1_or_1_nl <= (NOT(and_387_ssc OR and_392_ssc))
      OR and_379_ssc OR and_396_ssc;
  operator_64_false_1_mux1h_9_nl <= MUX1HOT_s_1_3_2(modExp_exp_1_7_1_sva, (NOT (COMP_LOOP_k_9_1_1_sva_7_0(7))),
      modExp_exp_1_1_1_sva, STD_LOGIC_VECTOR'( and_379_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_operator_64_false_1_nor_4_nl <= NOT(operator_64_false_1_mux1h_9_nl
      OR and_387_ssc);
  operator_64_false_1_mux1h_10_nl <= MUX1HOT_s_1_3_2(modExp_exp_1_6_1_sva, (NOT (COMP_LOOP_k_9_1_1_sva_7_0(6))),
      modExp_exp_1_7_1_sva, STD_LOGIC_VECTOR'( and_379_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_operator_64_false_1_nor_5_nl <= NOT(operator_64_false_1_mux1h_10_nl
      OR and_387_ssc);
  operator_64_false_1_mux1h_11_nl <= MUX1HOT_s_1_3_2(modExp_exp_1_5_1_sva, (NOT (COMP_LOOP_k_9_1_1_sva_7_0(5))),
      modExp_exp_1_6_1_sva, STD_LOGIC_VECTOR'( and_379_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_operator_64_false_1_nor_6_nl <= NOT(operator_64_false_1_mux1h_11_nl
      OR and_387_ssc);
  operator_64_false_1_mux1h_12_nl <= MUX1HOT_s_1_3_2(modExp_exp_1_4_1_sva, (NOT (COMP_LOOP_k_9_1_1_sva_7_0(4))),
      modExp_exp_1_5_1_sva, STD_LOGIC_VECTOR'( and_379_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_operator_64_false_1_nor_7_nl <= NOT(operator_64_false_1_mux1h_12_nl
      OR and_387_ssc);
  operator_64_false_1_mux1h_13_nl <= MUX1HOT_s_1_4_2((NOT modExp_exp_1_3_1_sva),
      (STAGE_LOOP_i_3_0_sva(3)), (COMP_LOOP_k_9_1_1_sva_7_0(3)), (NOT modExp_exp_1_4_1_sva),
      STD_LOGIC_VECTOR'( and_379_ssc & and_387_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_mux1h_14_nl <= MUX1HOT_s_1_4_2((NOT modExp_exp_1_2_1_sva),
      (STAGE_LOOP_i_3_0_sva(2)), (COMP_LOOP_k_9_1_1_sva_7_0(2)), (NOT modExp_exp_1_3_1_sva),
      STD_LOGIC_VECTOR'( and_379_ssc & and_387_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_mux1h_15_nl <= MUX1HOT_s_1_4_2((NOT modExp_exp_1_1_1_sva),
      (STAGE_LOOP_i_3_0_sva(1)), (COMP_LOOP_k_9_1_1_sva_7_0(1)), (NOT modExp_exp_1_2_1_sva),
      STD_LOGIC_VECTOR'( and_379_ssc & and_387_ssc & and_392_ssc & and_396_ssc));
  operator_64_false_1_or_2_nl <= and_379_ssc OR and_396_ssc;
  operator_64_false_1_mux1h_16_nl <= MUX1HOT_s_1_3_2((NOT modExp_exp_1_0_1_sva_1),
      (STAGE_LOOP_i_3_0_sva(0)), (COMP_LOOP_k_9_1_1_sva_7_0(0)), STD_LOGIC_VECTOR'(
      operator_64_false_1_or_2_nl & and_387_ssc & and_392_ssc));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( operator_64_false_1_operator_64_false_1_or_1_nl
      & operator_64_false_1_operator_64_false_1_nor_4_nl & operator_64_false_1_operator_64_false_1_nor_5_nl
      & operator_64_false_1_operator_64_false_1_nor_6_nl & operator_64_false_1_operator_64_false_1_nor_7_nl
      & operator_64_false_1_mux1h_13_nl & operator_64_false_1_mux1h_14_nl & operator_64_false_1_mux1h_15_nl
      & operator_64_false_1_mux1h_16_nl) + UNSIGNED'( "000000001"), 9));
  and_436_nl <= (fsm_output(3)) AND (NOT (fsm_output(8))) AND (NOT (fsm_output(4)))
      AND and_dcpl_159 AND (NOT (fsm_output(6))) AND (fsm_output(1)) AND and_dcpl_164;
  nor_405_nl <= NOT((fsm_output(3)) OR (fsm_output(6)) OR (NOT nor_tmp_146));
  nor_406_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(5)) OR
      (fsm_output(2)));
  mux_558_nl <= MUX_s_1_2_2(nor_405_nl, nor_406_nl, fsm_output(7));
  nand_129_nl <= NOT((fsm_output(4)) AND mux_558_nl);
  nor_407_nl <= NOT((fsm_output(5)) OR (fsm_output(2)));
  mux_559_nl <= MUX_s_1_2_2(nor_407_nl, nor_tmp_146, fsm_output(6));
  or_713_nl <= (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(3)) OR (NOT mux_559_nl);
  mux_557_nl <= MUX_s_1_2_2(nand_129_nl, or_713_nl, fsm_output(8));
  nor_404_nl <= NOT((fsm_output(0)) OR mux_557_nl);
  nor_408_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(8)) OR (fsm_output(4)) OR
      (fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(6)) OR (fsm_output(5))
      OR (fsm_output(2)));
  mux_556_nl <= MUX_s_1_2_2(nor_404_nl, nor_408_nl, fsm_output(1));
  nor_409_nl <= NOT((fsm_output(5)) OR (fsm_output(2)) OR (NOT (fsm_output(6))) OR
      (fsm_output(3)) OR not_tmp_20);
  or_714_nl <= (fsm_output(6)) OR not_tmp_368;
  or_715_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(3))) OR (fsm_output(0))
      OR (fsm_output(7));
  mux_563_nl <= MUX_s_1_2_2(or_714_nl, or_715_nl, fsm_output(2));
  nor_410_nl <= NOT((fsm_output(5)) OR mux_563_nl);
  mux_562_nl <= MUX_s_1_2_2(nor_409_nl, nor_410_nl, fsm_output(4));
  or_716_nl <= (NOT (fsm_output(2))) OR (fsm_output(6)) OR not_tmp_368;
  or_717_nl <= (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR (fsm_output(7));
  or_718_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(0)))
      OR (fsm_output(7));
  mux_565_nl <= MUX_s_1_2_2(or_717_nl, or_718_nl, fsm_output(2));
  mux_564_nl <= MUX_s_1_2_2(or_716_nl, mux_565_nl, fsm_output(5));
  nor_411_nl <= NOT((fsm_output(4)) OR mux_564_nl);
  mux_561_nl <= MUX_s_1_2_2(mux_562_nl, nor_411_nl, fsm_output(8));
  nor_413_nl <= NOT((fsm_output(6)) OR (fsm_output(3)) OR (NOT (fsm_output(0))) OR
      (fsm_output(7)));
  and_437_nl <= (fsm_output(6)) AND (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(7));
  mux_566_nl <= MUX_s_1_2_2(nor_413_nl, and_437_nl, fsm_output(2));
  nor_412_nl <= NOT((fsm_output(8)) OR (NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND mux_566_nl)));
  mux_560_nl <= MUX_s_1_2_2(mux_561_nl, nor_412_nl, fsm_output(1));
  modExp_while_if_mux1h_2_nl <= MUX1HOT_v_64_3_2(modExp_result_sva, COMP_LOOP_mux1h_1_itm,
      operator_64_false_acc_mut_63_0, STD_LOGIC_VECTOR'( and_436_nl & mux_556_nl
      & mux_560_nl));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux1h_2_nl)
      * UNSIGNED(COMP_LOOP_mux1h_1_itm)), 64));
END v31;

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
    vec_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_0_0_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wea : OUT STD_LOGIC;
    vec_rsc_0_0_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_0_1_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wea : OUT STD_LOGIC;
    vec_rsc_0_1_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_2_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_0_2_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_wea : OUT STD_LOGIC;
    vec_rsc_0_2_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_0_3_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_0_3_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_wea : OUT STD_LOGIC;
    vec_rsc_0_3_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIT;

ARCHITECTURE v31 OF inPlaceNTT_DIT IS
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
  SIGNAL vec_rsc_0_0_i_adra_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_wea_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_wea_d_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_2_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    PORT(
      qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_3_i_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT inPlaceNTT_DIT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
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
      vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_2_i_wea_d_pff : OUT STD_LOGIC;
      vec_rsc_0_3_i_wea_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_r_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff : STD_LOGIC_VECTOR (9
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  vec_rsc_0_0_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
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

  vec_rsc_0_1_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
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

  vec_rsc_0_2_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
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

  vec_rsc_0_3_i : inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
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

  inPlaceNTT_DIT_core_inst : inPlaceNTT_DIT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      vec_rsc_triosy_0_2_lz => vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz => vec_rsc_triosy_0_3_lz,
      p_rsc_dat => inPlaceNTT_DIT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_dat => inPlaceNTT_DIT_core_inst_r_rsc_dat,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      vec_rsc_0_0_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d,
      vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d,
      vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_2_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_2_i_qa_d,
      vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_3_i_qa_d => inPlaceNTT_DIT_core_inst_vec_rsc_0_3_i_qa_d,
      vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_adra_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff,
      vec_rsc_0_2_i_wea_d_pff => vec_rsc_0_2_i_wea_d_iff,
      vec_rsc_0_3_i_wea_d_pff => vec_rsc_0_3_i_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_2_i_qa_d <= vec_rsc_0_2_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_3_i_qa_d <= vec_rsc_0_3_i_qa_d;
  vec_rsc_0_0_i_adra_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff;

END v31;



