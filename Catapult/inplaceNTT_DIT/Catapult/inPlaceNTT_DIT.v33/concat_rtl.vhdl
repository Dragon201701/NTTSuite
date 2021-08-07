
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
--  Generated date: Wed Jun 30 21:01:18 2021
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

ARCHITECTURE v33 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v33;

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

ARCHITECTURE v33 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v33;

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
    STAGE_LOOP_C_8_tr0 : IN STD_LOGIC;
    modExp_while_C_38_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_61_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_122_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v33 OF inPlaceNTT_DIT_core_core_fsm IS
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
      modExp_while_C_37, modExp_while_C_38, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0,
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
      COMP_LOOP_1_modExp_1_while_C_37, COMP_LOOP_1_modExp_1_while_C_38, COMP_LOOP_C_2,
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
      COMP_LOOP_C_63, COMP_LOOP_C_64, COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67,
      COMP_LOOP_C_68, COMP_LOOP_C_69, COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72,
      COMP_LOOP_C_73, COMP_LOOP_C_74, COMP_LOOP_C_75, COMP_LOOP_C_76, COMP_LOOP_C_77,
      COMP_LOOP_C_78, COMP_LOOP_C_79, COMP_LOOP_C_80, COMP_LOOP_C_81, COMP_LOOP_C_82,
      COMP_LOOP_C_83, COMP_LOOP_C_84, COMP_LOOP_C_85, COMP_LOOP_C_86, COMP_LOOP_C_87,
      COMP_LOOP_C_88, COMP_LOOP_C_89, COMP_LOOP_C_90, COMP_LOOP_C_91, COMP_LOOP_C_92,
      COMP_LOOP_C_93, COMP_LOOP_C_94, COMP_LOOP_C_95, COMP_LOOP_C_96, COMP_LOOP_C_97,
      COMP_LOOP_C_98, COMP_LOOP_C_99, COMP_LOOP_C_100, COMP_LOOP_C_101, COMP_LOOP_C_102,
      COMP_LOOP_C_103, COMP_LOOP_C_104, COMP_LOOP_C_105, COMP_LOOP_C_106, COMP_LOOP_C_107,
      COMP_LOOP_C_108, COMP_LOOP_C_109, COMP_LOOP_C_110, COMP_LOOP_C_111, COMP_LOOP_C_112,
      COMP_LOOP_C_113, COMP_LOOP_C_114, COMP_LOOP_C_115, COMP_LOOP_C_116, COMP_LOOP_C_117,
      COMP_LOOP_C_118, COMP_LOOP_C_119, COMP_LOOP_C_120, COMP_LOOP_C_121, COMP_LOOP_C_122,
      VEC_LOOP_C_0, STAGE_LOOP_C_9, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_8_tr0, modExp_while_C_38_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_38_tr0, COMP_LOOP_C_61_tr0,
      COMP_LOOP_2_modExp_1_while_C_38_tr0, COMP_LOOP_C_122_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_9_tr0, state_var)
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
        IF ( STAGE_LOOP_C_8_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        IF ( modExp_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_12;
      WHEN COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_13;
      WHEN COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_14;
      WHEN COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_15;
      WHEN COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_16;
      WHEN COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_17;
      WHEN COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_18;
      WHEN COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_19;
      WHEN COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_20;
      WHEN COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_21;
      WHEN COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_22;
      WHEN COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_23;
      WHEN COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_24;
      WHEN COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_25;
      WHEN COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_26;
      WHEN COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_27;
      WHEN COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_28;
      WHEN COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_29;
      WHEN COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_30;
      WHEN COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_31;
      WHEN COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_32;
      WHEN COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_33;
      WHEN COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_34;
      WHEN COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_35;
      WHEN COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_36;
      WHEN COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_37;
      WHEN COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_38;
      WHEN COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        IF ( COMP_LOOP_1_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        IF ( COMP_LOOP_C_61_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_62;
        END IF;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_12;
      WHEN COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_13;
      WHEN COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_14;
      WHEN COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_15;
      WHEN COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_16;
      WHEN COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_17;
      WHEN COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_18;
      WHEN COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_19;
      WHEN COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_20;
      WHEN COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_21;
      WHEN COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_22;
      WHEN COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_23;
      WHEN COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_24;
      WHEN COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_25;
      WHEN COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_26;
      WHEN COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_27;
      WHEN COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_28;
      WHEN COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_29;
      WHEN COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_30;
      WHEN COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_31;
      WHEN COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_32;
      WHEN COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_33;
      WHEN COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_34;
      WHEN COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_35;
      WHEN COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_36;
      WHEN COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_37;
      WHEN COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_38;
      WHEN COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        IF ( COMP_LOOP_2_modExp_1_while_C_38_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_63;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111111");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000000");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000001");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000010");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000011");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000100");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000101");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000110");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000111");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001000");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001001");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001010");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001011");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001100");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001101");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001110");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001111");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010000");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010001");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010010");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010011");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010100");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010101");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010110");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010111");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011000");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011001");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011010");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011011");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011100");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011101");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011110");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011111");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100000");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100001");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100010");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100011");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100100");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100101");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100110");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100111");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101000");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101001");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101010");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101011");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101100");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101101");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101110");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101111");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110000");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110001");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110010");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110011");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110100");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110101");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110110");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11110111");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11111000");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11111001");
        IF ( COMP_LOOP_C_122_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11111010");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11111011");
        IF ( STAGE_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11111100");
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

END v33;

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
    vec_rsc_0_0_i_adra_d_pff : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    vec_rsc_0_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wea_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wea_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIT_core;

ARCHITECTURE v33 OF inPlaceNTT_DIT_core IS
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
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL nor_tmp_8 : STD_LOGIC;
  SIGNAL not_tmp_47 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
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
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL not_tmp_60 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL mux_tmp_68 : STD_LOGIC;
  SIGNAL or_tmp_73 : STD_LOGIC;
  SIGNAL mux_tmp_69 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL mux_tmp_73 : STD_LOGIC;
  SIGNAL mux_tmp_76 : STD_LOGIC;
  SIGNAL mux_tmp_77 : STD_LOGIC;
  SIGNAL mux_tmp_80 : STD_LOGIC;
  SIGNAL mux_tmp_82 : STD_LOGIC;
  SIGNAL mux_tmp_90 : STD_LOGIC;
  SIGNAL or_tmp_78 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_tmp_11 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL nor_tmp_38 : STD_LOGIC;
  SIGNAL mux_tmp_111 : STD_LOGIC;
  SIGNAL not_tmp_98 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL nor_tmp_47 : STD_LOGIC;
  SIGNAL or_tmp_123 : STD_LOGIC;
  SIGNAL nor_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_154 : STD_LOGIC;
  SIGNAL mux_tmp_156 : STD_LOGIC;
  SIGNAL mux_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL or_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_187 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL mux_tmp_226 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_111_m1c : STD_LOGIC;
  SIGNAL and_117_m1c : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_1_obj_ld_cse : STD_LOGIC;
  SIGNAL and_164_cse : STD_LOGIC;
  SIGNAL or_97_cse : STD_LOGIC;
  SIGNAL or_245_cse : STD_LOGIC;
  SIGNAL and_178_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_k_9_1_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL modExp_base_1_sva_mx1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_and_3 : STD_LOGIC;
  SIGNAL modExp_while_and_5 : STD_LOGIC;
  SIGNAL mux_174_itm : STD_LOGIC;
  SIGNAL mux_227_itm : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_157 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
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
  SIGNAL modExp_base_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mul_mut_mx0w4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL nor_118_cse : STD_LOGIC;
  SIGNAL and_217_cse : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_2_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_305_cse : STD_LOGIC;
  SIGNAL nor_177_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_2_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_14_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_16_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_17_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_56_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;
  SIGNAL or_246_cse : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL or_93_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL mux_74_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL and_182_nl : STD_LOGIC;
  SIGNAL mux_71_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL or_95_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL mux_89_nl : STD_LOGIC;
  SIGNAL and_87_nl : STD_LOGIC;
  SIGNAL and_88_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL nand_14_nl : STD_LOGIC;
  SIGNAL and_97_nl : STD_LOGIC;
  SIGNAL nor_96_nl : STD_LOGIC;
  SIGNAL mux1h_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_263_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL nor_69_nl : STD_LOGIC;
  SIGNAL nor_70_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL nor_71_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL and_210_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL nor_55_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL or_171_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL nor_75_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL or_166_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL nor_77_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL and_167_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_1_nl : STD_LOGIC;
  SIGNAL modExp_while_if_and_2_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL and_207_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL nand_48_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL nand_51_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL or_308_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL and_310_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL nor_170_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL or_292_nl : STD_LOGIC;
  SIGNAL or_290_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL nand_46_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL or_283_nl : STD_LOGIC;
  SIGNAL and_302_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL nor_173_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL and_303_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL or_125_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL or_124_nl : STD_LOGIC;
  SIGNAL or_123_nl : STD_LOGIC;
  SIGNAL nand_27_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL or_301_nl : STD_LOGIC;
  SIGNAL or_299_nl : STD_LOGIC;
  SIGNAL and_308_nl : STD_LOGIC;
  SIGNAL and_309_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL nor_89_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL or_133_nl : STD_LOGIC;
  SIGNAL and_114_nl : STD_LOGIC;
  SIGNAL r_or_nl : STD_LOGIC;
  SIGNAL r_or_1_nl : STD_LOGIC;
  SIGNAL and_121_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL and_172_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL and_173_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_140_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL nor_84_nl : STD_LOGIC;
  SIGNAL and_135_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL and_136_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL nor_79_nl : STD_LOGIC;
  SIGNAL nor_80_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_3_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_156_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL nor_78_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL or_159_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL and_169_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL or_247_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL and_149_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL and_159_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL and_160_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL or_234_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL nor_120_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_36_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL or_221_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_40_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_243_nl : STD_LOGIC;
  SIGNAL nand_22_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL nand_15_nl : STD_LOGIC;
  SIGNAL or_100_nl : STD_LOGIC;
  SIGNAL and_187_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL and_208_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL or_105_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL nor_94_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL or_110_nl : STD_LOGIC;
  SIGNAL or_34_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_209_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL nor_63_nl : STD_LOGIC;
  SIGNAL nor_64_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL nor_87_nl : STD_LOGIC;
  SIGNAL nor_88_nl : STD_LOGIC;
  SIGNAL and_55_nl : STD_LOGIC;
  SIGNAL and_59_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL nor_113_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL and_63_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL nor_111_nl : STD_LOGIC;
  SIGNAL nor_112_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nor_109_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL or_68_nl : STD_LOGIC;
  SIGNAL or_67_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL or_64_nl : STD_LOGIC;
  SIGNAL or_63_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL and_186_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL nor_106_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL or_72_nl : STD_LOGIC;
  SIGNAL or_71_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL and_185_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL nor_105_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL or_240_nl : STD_LOGIC;
  SIGNAL nand_18_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL and_183_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL and_184_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL or_84_nl : STD_LOGIC;
  SIGNAL or_83_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL nor_144_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_110_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_111_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_112_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_113_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_114_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_115_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_116_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_117_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_118_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_119_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_120_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_121_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_122_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_123_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_124_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_125_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_126_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_127_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_128_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_129_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_130_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_131_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_132_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_133_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_134_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_135_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_136_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_137_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_138_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_139_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_140_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_141_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_142_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_143_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_144_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_145_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_146_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_147_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_148_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_149_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_150_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_151_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_152_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_153_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_154_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_155_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_156_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_157_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_158_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_159_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_160_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_161_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_162_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_166_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_45_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_112_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_26_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_67_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_68_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_69_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_70_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_311_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_163_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_71_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_29_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_164_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_165_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_166_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_167_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_168_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_169_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_170_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_171_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_172_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_173_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_174_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_175_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_176_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_177_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_178_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_179_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_180_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_181_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_182_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_183_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_184_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_185_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_186_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_187_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_188_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_189_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_190_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_191_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_192_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_193_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_194_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_195_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_196_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_197_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_198_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_199_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_200_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_201_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_202_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_203_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_204_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_205_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_206_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_207_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_208_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_209_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_210_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_211_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_212_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_213_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_214_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_215_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_216_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_217_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_218_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_30_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_and_222_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_3_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_116_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_219_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_312_nl : STD_LOGIC;
  SIGNAL nor_184_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL or_310_nl : STD_LOGIC;
  SIGNAL or_311_nl : STD_LOGIC;
  SIGNAL and_313_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL nor_185_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
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
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      STAGE_LOOP_C_8_tr0 : IN STD_LOGIC;
      modExp_while_C_38_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_61_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_38_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_122_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
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
      modExp_while_C_38_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_38_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_61_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0,
      COMP_LOOP_2_modExp_1_while_C_38_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0,
      COMP_LOOP_C_122_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_9_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 <= NOT (z_out_2(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_61_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_38_tr0 <= NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  or_97_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_164_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_178_cse <= (fsm_output(1)) AND (fsm_output(4));
  nor_69_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(3)) OR (NOT and_164_cse));
  nor_70_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(0)) OR
      (fsm_output(1)));
  mux_209_nl <= MUX_s_1_2_2(nor_69_nl, nor_70_nl, fsm_output(7));
  nor_71_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01")));
  mux_201_nl <= MUX_s_1_2_2(nor_71_nl, (fsm_output(7)), fsm_output(5));
  and_210_nl <= (NOT((fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(6)))) AND
      (fsm_output(7));
  nor_55_nl <= NOT((NOT (fsm_output(1))) OR modExp_exp_1_0_1_sva OR (NOT (fsm_output(0))));
  mux_199_nl <= MUX_s_1_2_2(mux_tmp_187, nor_tmp_48, nor_55_nl);
  mux_200_nl <= MUX_s_1_2_2(and_210_nl, mux_199_nl, fsm_output(5));
  mux_202_nl <= MUX_s_1_2_2((NOT mux_201_nl), mux_200_nl, fsm_output(4));
  or_171_nl <= (NOT(and_164_cse OR (fsm_output(6)))) OR (fsm_output(7));
  mux_197_nl <= MUX_s_1_2_2(or_171_nl, or_tmp_123, fsm_output(5));
  nor_74_nl <= NOT((NOT modExp_exp_1_0_1_sva) OR (fsm_output(0)) OR (fsm_output(6))
      OR (NOT (fsm_output(7))));
  nor_75_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(6))) OR (fsm_output(7)));
  mux_195_nl <= MUX_s_1_2_2(nor_74_nl, nor_75_nl, fsm_output(1));
  mux_196_nl <= MUX_s_1_2_2(mux_195_nl, nor_tmp_48, fsm_output(5));
  mux_198_nl <= MUX_s_1_2_2(mux_197_nl, mux_196_nl, fsm_output(4));
  mux_203_nl <= MUX_s_1_2_2(mux_202_nl, mux_198_nl, fsm_output(3));
  or_166_nl <= (NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_192_nl <= MUX_s_1_2_2(or_166_nl, or_tmp_123, fsm_output(5));
  nor_77_nl <= NOT(and_164_cse OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10")));
  mux_191_nl <= MUX_s_1_2_2(nor_77_nl, nor_tmp_48, fsm_output(5));
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_191_nl, fsm_output(4));
  mux_188_nl <= MUX_s_1_2_2(or_tmp_123, mux_tmp_187, and_164_cse);
  mux_189_nl <= MUX_s_1_2_2((fsm_output(7)), mux_188_nl, fsm_output(5));
  and_167_nl <= ((fsm_output(0)) OR (fsm_output(6))) AND (fsm_output(7));
  mux_186_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), and_167_nl, fsm_output(5));
  mux_190_nl <= MUX_s_1_2_2(mux_189_nl, mux_186_nl, fsm_output(4));
  mux_194_nl <= MUX_s_1_2_2(mux_193_nl, mux_190_nl, fsm_output(3));
  mux_204_nl <= MUX_s_1_2_2(mux_203_nl, mux_194_nl, fsm_output(2));
  or_263_nl <= and_dcpl_72 OR (mux_209_nl AND and_dcpl_28 AND mux_204_nl);
  mux_206_nl <= MUX_s_1_2_2(not_tmp_98, mux_tmp_70, fsm_output(5));
  mux_205_nl <= MUX_s_1_2_2((NOT mux_174_itm), nor_tmp_38, fsm_output(5));
  mux_207_nl <= MUX_s_1_2_2((NOT mux_206_nl), mux_205_nl, fsm_output(7));
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, mux_tmp_108, fsm_output(6));
  modExp_while_if_and_1_nl <= modExp_while_and_3 AND and_dcpl_122;
  modExp_while_if_and_2_nl <= modExp_while_and_5 AND and_dcpl_122;
  mux1h_nl <= MUX1HOT_v_64_5_2(z_out_3, STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5, (z_out_2(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
      or_263_nl & mux_208_nl & modExp_while_if_and_1_nl & modExp_while_if_and_2_nl
      & and_dcpl_79));
  and_102_nl <= and_dcpl_44 AND and_dcpl_19;
  mux_113_nl <= MUX_s_1_2_2(not_tmp_98, mux_tmp_111, fsm_output(5));
  and_207_nl <= (fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(1));
  mux_109_nl <= MUX_s_1_2_2(and_207_nl, (fsm_output(4)), fsm_output(3));
  mux_110_nl <= MUX_s_1_2_2((NOT mux_109_nl), nor_tmp_38, fsm_output(5));
  mux_114_nl <= MUX_s_1_2_2((NOT mux_113_nl), mux_110_nl, fsm_output(7));
  mux_115_nl <= MUX_s_1_2_2(mux_114_nl, mux_tmp_108, fsm_output(6));
  operator_64_false_mux1h_2_rgt <= MUX1HOT_v_65_3_2(z_out_2, (STD_LOGIC_VECTOR'(
      "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0' & mux1h_nl), STD_LOGIC_VECTOR'(
      and_102_nl & and_dcpl_92 & (NOT mux_115_nl)));
  and_305_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  nor_177_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_111_m1c <= and_dcpl_95 AND and_dcpl_70;
  modExp_result_and_rgt <= (NOT modExp_while_and_5) AND and_111_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_5 AND and_111_m1c;
  nor_118_cse <= NOT((fsm_output(7)) OR (fsm_output(5)));
  or_246_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("01011"));
  or_245_cse <= (fsm_output(4)) OR (fsm_output(2));
  COMP_LOOP_or_1_cse <= and_dcpl_41 OR and_dcpl_57;
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0),
      8), 11), 11));
  COMP_LOOP_mux_40_nl <= MUX_v_64_2_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, COMP_LOOP_acc_10_cse_12_1_1_sva(0));
  COMP_LOOP_1_mul_mut_mx0w4 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(operator_64_false_acc_mut_63_0)
      * SIGNED(COMP_LOOP_mux_40_nl)), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z(63
      DOWNTO 1)), (tmp_2_lpi_4_dfm(63 DOWNTO 1)), and_dcpl_98);
  modulo_qr_sva_1_mx0w5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_result_rem_cmp_z)
      + UNSIGNED(p_sva), 64));
  modExp_base_1_sva_mx1 <= MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
      modulo_result_rem_cmp_z(63));
  modExp_while_and_3 <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
  modExp_while_and_5 <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
  and_dcpl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_3 <= (fsm_output(2)) AND (fsm_output(4));
  nor_tmp_8 <= (fsm_output(7)) AND (fsm_output(5));
  or_243_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(4))
      OR (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(1));
  nand_22_nl <= NOT((fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(3)) AND (fsm_output(4))
      AND (fsm_output(2)));
  not_tmp_47 <= MUX_s_1_2_2(or_243_nl, nand_22_nl, fsm_output(6));
  and_dcpl_17 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_18 <= NOT((fsm_output(3)) OR (fsm_output(5)));
  and_dcpl_19 <= and_dcpl_18 AND and_dcpl_17;
  and_dcpl_20 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_21 <= NOT((fsm_output(2)) OR (fsm_output(4)));
  and_dcpl_25 <= (fsm_output(3)) AND (fsm_output(5));
  and_dcpl_26 <= and_dcpl_25 AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_28 <= (NOT (fsm_output(2))) AND (fsm_output(4));
  and_dcpl_29 <= and_dcpl_28 AND and_164_cse;
  and_dcpl_32 <= (NOT (fsm_output(3))) AND (fsm_output(5)) AND and_dcpl_17;
  and_dcpl_33 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_34 <= and_dcpl_28 AND and_dcpl_33;
  and_dcpl_35 <= and_dcpl_34 AND and_dcpl_32;
  and_dcpl_36 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_37 <= (fsm_output(3)) AND (NOT (fsm_output(5)));
  and_dcpl_38 <= and_dcpl_37 AND and_dcpl_36;
  and_dcpl_39 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_40 <= and_dcpl_28 AND and_dcpl_39;
  and_dcpl_41 <= and_dcpl_40 AND and_dcpl_38;
  and_dcpl_43 <= and_dcpl_18 AND and_dcpl;
  and_dcpl_44 <= and_dcpl_21 AND and_dcpl_33;
  and_dcpl_47 <= (fsm_output(4)) AND (NOT (fsm_output(1)));
  and_dcpl_54 <= and_dcpl_25 AND and_dcpl;
  and_dcpl_56 <= and_dcpl_3 AND and_dcpl_39;
  and_dcpl_57 <= and_dcpl_56 AND and_dcpl_54;
  and_dcpl_58 <= (NOT (fsm_output(1))) AND (fsm_output(7));
  not_tmp_60 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")));
  and_dcpl_66 <= (fsm_output(0)) AND (fsm_output(3));
  and_dcpl_70 <= and_dcpl_37 AND and_dcpl_17;
  and_dcpl_72 <= and_dcpl_21 AND and_dcpl_39 AND and_dcpl_70;
  mux_tmp_68 <= MUX_s_1_2_2((fsm_output(4)), or_245_cse, or_97_cse);
  or_tmp_73 <= (fsm_output(3)) OR mux_tmp_68;
  mux_tmp_69 <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), and_164_cse);
  mux_tmp_70 <= MUX_s_1_2_2(mux_tmp_69, (fsm_output(4)), fsm_output(3));
  mux_tmp_73 <= MUX_s_1_2_2((fsm_output(4)), or_245_cse, fsm_output(1));
  mux_tmp_76 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(4));
  mux_tmp_77 <= MUX_s_1_2_2(mux_tmp_76, and_dcpl_3, fsm_output(1));
  mux_78_nl <= MUX_s_1_2_2(and_dcpl_21, and_dcpl_3, fsm_output(1));
  mux_79_nl <= MUX_s_1_2_2(mux_78_nl, mux_tmp_77, fsm_output(0));
  mux_tmp_80 <= MUX_s_1_2_2((NOT (fsm_output(4))), mux_79_nl, fsm_output(3));
  mux_tmp_82 <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), fsm_output(3));
  mux_tmp_90 <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), or_97_cse);
  or_tmp_78 <= (fsm_output(1)) OR (fsm_output(4)) OR (fsm_output(2));
  mux_tmp_93 <= MUX_s_1_2_2((fsm_output(4)), or_tmp_78, fsm_output(3));
  and_tmp_10 <= (fsm_output(3)) AND or_97_cse AND (fsm_output(4)) AND (fsm_output(2));
  and_dcpl_73 <= and_dcpl_29 AND and_dcpl_32;
  nand_15_nl <= NOT((fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(2)));
  or_100_nl <= (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(2));
  mux_tmp_99 <= MUX_s_1_2_2(nand_15_nl, or_100_nl, fsm_output(6));
  and_187_nl <= (fsm_output(3)) AND (fsm_output(1));
  mux_tmp_100 <= MUX_s_1_2_2((fsm_output(4)), or_245_cse, and_187_nl);
  and_208_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1011"));
  nor_98_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0100")));
  mux_102_nl <= MUX_s_1_2_2(and_208_nl, nor_98_nl, fsm_output(7));
  and_dcpl_79 <= mux_102_nl AND and_dcpl_39 AND (fsm_output(6));
  and_dcpl_80 <= and_dcpl_3 AND and_164_cse;
  and_dcpl_81 <= and_dcpl_80 AND and_dcpl_43;
  or_dcpl_18 <= NOT((NOT(nor_177_cse AND (NOT (fsm_output(3))))) AND (fsm_output(4)));
  or_105_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_103_nl <= MUX_s_1_2_2(nor_177_cse, or_105_nl, fsm_output(3));
  and_dcpl_89 <= NOT(mux_103_nl OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT and_dcpl_17));
  and_tmp_11 <= (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(3)) AND mux_tmp_69;
  nor_94_nl <= NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(4)));
  nor_95_nl <= NOT((fsm_output(3)) OR (fsm_output(0)) OR (NOT (fsm_output(4))));
  mux_105_nl <= MUX_s_1_2_2(nor_94_nl, nor_95_nl, fsm_output(5));
  and_dcpl_92 <= mux_105_nl AND nor_177_cse AND and_dcpl_17;
  nand_13_nl <= NOT((fsm_output(3)) AND mux_tmp_69);
  mux_107_nl <= MUX_s_1_2_2(nand_13_nl, mux_tmp_100, fsm_output(5));
  or_110_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  mux_106_nl <= MUX_s_1_2_2(or_dcpl_18, or_110_nl, fsm_output(5));
  mux_tmp_108 <= MUX_s_1_2_2((NOT mux_107_nl), mux_106_nl, fsm_output(7));
  nor_tmp_38 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"));
  or_34_nl <= (fsm_output(3)) OR (fsm_output(1));
  mux_tmp_111 <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), or_34_nl);
  not_tmp_98 <= MUX_s_1_2_2((fsm_output(4)), (NOT mux_tmp_77), fsm_output(3));
  mux_tmp_136 <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), fsm_output(1));
  and_dcpl_95 <= and_dcpl_3 AND and_dcpl_33;
  and_dcpl_98 <= and_dcpl_28 AND and_dcpl_20 AND and_dcpl_32;
  and_dcpl_103 <= NOT((fsm_output(3)) OR (fsm_output(6)));
  and_dcpl_112 <= and_dcpl_21 AND (fsm_output(1)) AND (NOT (fsm_output(0))) AND (fsm_output(3));
  nor_tmp_47 <= ((fsm_output(5)) OR (fsm_output(7))) AND (fsm_output(6));
  or_tmp_123 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  nor_tmp_48 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_154 <= MUX_s_1_2_2((NOT or_tmp_123), nor_tmp_48, fsm_output(5));
  mux_tmp_156 <= MUX_s_1_2_2((NOT (fsm_output(6))), nor_tmp_48, fsm_output(5));
  mux_tmp_160 <= MUX_s_1_2_2((fsm_output(7)), (fsm_output(6)), fsm_output(5));
  and_dcpl_118 <= and_178_cse AND (NOT (fsm_output(0))) AND and_dcpl_103;
  and_dcpl_121 <= and_dcpl_40 AND and_dcpl_32;
  and_209_nl <= (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(3)) AND (fsm_output(0))
      AND (NOT (fsm_output(1))) AND (fsm_output(4));
  nor_116_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(0))
      OR (NOT (fsm_output(1))) OR (fsm_output(4)));
  mux_172_nl <= MUX_s_1_2_2(and_209_nl, nor_116_nl, fsm_output(6));
  and_dcpl_122 <= mux_172_nl AND (fsm_output(2));
  mux_174_itm <= MUX_s_1_2_2(and_dcpl_80, (fsm_output(4)), fsm_output(3));
  mux_tmp_175 <= MUX_s_1_2_2((NOT mux_174_itm), and_tmp_10, fsm_output(5));
  or_tmp_138 <= (fsm_output(7)) OR (fsm_output(5)) OR ((fsm_output(3)) AND mux_tmp_136);
  mux_tmp_187 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  or_dcpl_26 <= (fsm_output(2)) OR (NOT (fsm_output(4)));
  nand_5_nl <= NOT((fsm_output(5)) AND mux_tmp_82);
  mux_tmp_226 <= MUX_s_1_2_2(nand_5_nl, mux_tmp_175, fsm_output(7));
  mux_227_itm <= MUX_s_1_2_2(mux_tmp_226, or_tmp_138, fsm_output(6));
  and_dcpl_129 <= and_dcpl_56 AND and_dcpl_43;
  nor_63_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001")));
  nor_64_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("110")));
  mux_228_nl <= MUX_s_1_2_2(nor_63_nl, nor_64_nl, fsm_output(7));
  and_dcpl_134 <= mux_228_nl AND (fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(5))
      AND (NOT (fsm_output(6)));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_29 AND and_dcpl_26;
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_40 AND and_dcpl_26;
  nor_90_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR mux_tmp_93);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_90_nl, and_tmp_11, fsm_output(6));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  nor_87_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(3)) OR (fsm_output(0)));
  nor_88_nl <= NOT((fsm_output(5)) OR (NOT and_dcpl_66));
  mux_144_nl <= MUX_s_1_2_2(nor_87_nl, nor_88_nl, fsm_output(6));
  and_117_m1c <= mux_144_nl AND and_dcpl_28 AND (NOT (fsm_output(1))) AND (NOT (fsm_output(7)));
  and_55_nl <= and_dcpl_44 AND and_dcpl_43;
  nor_113_nl <= NOT((fsm_output(5)) OR (fsm_output(3)) OR (NOT (fsm_output(2))));
  nor_114_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(3))) OR (fsm_output(2)));
  mux_54_nl <= MUX_s_1_2_2(nor_113_nl, nor_114_nl, fsm_output(6));
  and_59_nl <= mux_54_nl AND and_dcpl_47 AND (NOT (fsm_output(0))) AND (fsm_output(7));
  nor_111_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01")));
  nor_112_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")));
  mux_55_nl <= MUX_s_1_2_2(nor_111_nl, nor_112_nl, fsm_output(6));
  and_63_nl <= mux_55_nl AND (fsm_output(2)) AND and_dcpl_33 AND (NOT (fsm_output(3)))
      AND (fsm_output(7));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_11_5_2(COMP_LOOP_acc_psp_sva_1, (z_out(12
      DOWNTO 2)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_35
      & COMP_LOOP_or_1_cse & and_55_nl & and_59_nl & and_63_nl));
  vec_rsc_0_0_i_da_d_pff <= modExp_base_1_sva_mx1;
  or_68_nl <= (NOT (fsm_output(2))) OR (fsm_output(5)) OR (fsm_output(6));
  or_67_nl <= (fsm_output(2)) OR not_tmp_60;
  mux_57_nl <= MUX_s_1_2_2(or_68_nl, or_67_nl, fsm_output(3));
  nor_109_nl <= NOT((NOT (fsm_output(4))) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      OR mux_57_nl);
  or_64_nl <= (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  or_63_nl <= (COMP_LOOP_acc_1_cse_sva(0)) OR not_tmp_60;
  mux_56_nl <= MUX_s_1_2_2(or_64_nl, or_63_nl, fsm_output(2));
  nor_110_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR mux_56_nl);
  mux_58_nl <= MUX_s_1_2_2(nor_109_nl, nor_110_nl, fsm_output(0));
  vec_rsc_0_0_i_wea_d_pff <= mux_58_nl AND and_dcpl_58;
  nor_106_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (z_out(1)) OR (NOT (fsm_output(6))));
  nor_107_nl <= NOT((NOT (fsm_output(7))) OR (z_out(1)) OR CONV_SL_1_1(fsm_output(6
      DOWNTO 5)/=STD_LOGIC_VECTOR'("01")));
  mux_60_nl <= MUX_s_1_2_2(nor_106_nl, nor_107_nl, fsm_output(2));
  and_186_nl <= (fsm_output(1)) AND (fsm_output(3)) AND mux_60_nl;
  or_72_nl <= (fsm_output(7)) OR (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(6
      DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_71_nl <= (NOT (fsm_output(7))) OR (fsm_output(5)) OR (NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR (COMP_LOOP_acc_1_cse_sva(0)) OR (fsm_output(6));
  mux_59_nl <= MUX_s_1_2_2(or_72_nl, or_71_nl, fsm_output(2));
  nor_108_nl <= NOT((fsm_output(1)) OR (fsm_output(3)) OR mux_59_nl);
  mux_61_nl <= MUX_s_1_2_2(and_186_nl, nor_108_nl, fsm_output(0));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_61_nl AND (fsm_output(4));
  nor_103_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(5)) OR (fsm_output(6)));
  nor_104_nl <= NOT((fsm_output(2)) OR not_tmp_60);
  mux_63_nl <= MUX_s_1_2_2(nor_103_nl, nor_104_nl, fsm_output(3));
  and_185_nl <= (fsm_output(4)) AND (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) AND mux_63_nl;
  or_240_nl <= (NOT (VEC_LOOP_j_sva_11_0(0))) OR CONV_SL_1_1(fsm_output(6 DOWNTO
      5)/=STD_LOGIC_VECTOR'("00"));
  nand_18_nl <= NOT((COMP_LOOP_acc_1_cse_sva(0)) AND CONV_SL_1_1(fsm_output(6 DOWNTO
      5)=STD_LOGIC_VECTOR'("11")));
  mux_62_nl <= MUX_s_1_2_2(or_240_nl, nand_18_nl, fsm_output(2));
  nor_105_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR mux_62_nl);
  mux_64_nl <= MUX_s_1_2_2(and_185_nl, nor_105_nl, fsm_output(0));
  vec_rsc_0_1_i_wea_d_pff <= mux_64_nl AND and_dcpl_58;
  nor_101_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (NOT((z_out(1)) AND (fsm_output(6)))));
  and_184_nl <= (fsm_output(7)) AND (z_out(1)) AND CONV_SL_1_1(fsm_output(6 DOWNTO
      5)=STD_LOGIC_VECTOR'("01"));
  mux_66_nl <= MUX_s_1_2_2(nor_101_nl, and_184_nl, fsm_output(2));
  and_183_nl <= (fsm_output(1)) AND (fsm_output(3)) AND mux_66_nl;
  or_84_nl <= (fsm_output(7)) OR (NOT (VEC_LOOP_j_sva_11_0(0))) OR CONV_SL_1_1(fsm_output(6
      DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_83_nl <= (NOT (fsm_output(7))) OR (fsm_output(5)) OR (NOT COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR (NOT (COMP_LOOP_acc_1_cse_sva(0))) OR (fsm_output(6));
  mux_65_nl <= MUX_s_1_2_2(or_84_nl, or_83_nl, fsm_output(2));
  nor_102_nl <= NOT((fsm_output(1)) OR (fsm_output(3)) OR mux_65_nl);
  mux_67_nl <= MUX_s_1_2_2(and_183_nl, nor_102_nl, fsm_output(0));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_67_nl AND (fsm_output(4));
  nor_144_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(3)) OR (NOT (fsm_output(4)))
      OR (fsm_output(2)));
  nor_145_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR
      (NOT (fsm_output(2))));
  mux_235_nl <= MUX_s_1_2_2(nor_144_nl, nor_145_nl, fsm_output(5));
  and_217_cse <= mux_235_nl AND and_dcpl_39 AND (fsm_output(6));
  and_dcpl_142 <= and_dcpl_103 AND (NOT (fsm_output(7))) AND (fsm_output(5));
  and_dcpl_146 <= and_dcpl_28 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_142;
  and_dcpl_152 <= and_dcpl_3 AND and_164_cse AND and_dcpl_103 AND (fsm_output(7))
      AND (NOT (fsm_output(5)));
  and_dcpl_154 <= (fsm_output(3)) AND (fsm_output(6));
  and_dcpl_157 <= and_dcpl_40 AND and_dcpl_154 AND (NOT (fsm_output(7))) AND (NOT
      (fsm_output(5)));
  and_dcpl_162 <= and_dcpl_3 AND and_dcpl_39 AND (fsm_output(3)) AND (NOT (fsm_output(6)))
      AND nor_tmp_8;
  and_dcpl_164 <= and_dcpl_40 AND and_dcpl_154 AND nor_tmp_8;
  and_dcpl_166 <= and_dcpl_28 AND and_164_cse AND and_dcpl_142;
  and_dcpl_186 <= and_dcpl_28 AND and_dcpl_39 AND (fsm_output(3)) AND (fsm_output(6))
      AND nor_118_cse;
  and_dcpl_192 <= and_dcpl_28 AND and_dcpl_33 AND and_dcpl_103 AND (NOT (fsm_output(7)))
      AND (fsm_output(5));
  and_dcpl_198 <= and_dcpl_44 AND and_dcpl_103 AND nor_118_cse;
  and_dcpl_199 <= (fsm_output(3)) AND (NOT (fsm_output(6)));
  and_dcpl_200 <= and_dcpl_199 AND nor_118_cse;
  and_dcpl_202 <= and_dcpl_21 AND and_dcpl_39 AND and_dcpl_200;
  and_dcpl_207 <= (fsm_output(2)) AND (fsm_output(4)) AND and_dcpl_39 AND and_dcpl_199
      AND (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_208 <= and_dcpl_44 AND and_dcpl_200;
  COMP_LOOP_nor_2_itm <= NOT(and_dcpl_157 OR and_dcpl_162 OR and_dcpl_164);
  COMP_LOOP_or_14_itm <= and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_or_16_itm <= and_dcpl_157 OR and_dcpl_162;
  COMP_LOOP_or_17_itm <= and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_nor_56_itm <= NOT(and_dcpl_186 OR and_dcpl_192 OR and_dcpl_202 OR and_dcpl_207
      OR and_dcpl_208);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_47 = '0' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_21 AND and_dcpl_20 AND and_dcpl_19) OR STAGE_LOOP_i_3_0_sva_mx0c1)
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_47 = '0' ) THEN
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
        modExp_exp_1_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_28 AND (fsm_output(1)) AND
            and_dcpl_66 AND nor_tmp_8 AND (fsm_output(6)) AND (NOT STAGE_LOOP_acc_itm_2_1);
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_12_nl AND (NOT and_dcpl_121)) OR
            mux_185_nl;
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_19_nl AND (NOT(and_dcpl_95 AND and_dcpl_54));
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_36_nl AND (NOT(and_dcpl_34 AND and_dcpl_38));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_7_2(z_out_3, operator_64_false_acc_mut_63_0,
          COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_mul_mut_mx0w4, COMP_LOOP_1_mul_mut,
          (z_out_2(63 DOWNTO 0)), COMP_LOOP_2_mul_mut, STD_LOGIC_VECTOR'( modulo_result_or_nl
          & (NOT mux_88_nl) & (NOT mux_98_nl) & and_87_nl & and_88_nl & and_dcpl_79
          & and_97_nl));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_2, (operator_64_false_acc_mut_64
          & operator_64_false_acc_mut_63_0), and_dcpl_89);
      operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_89);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_96_nl, and_tmp_11, fsm_output(6))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_245_nl, (NOT mux_239_nl), fsm_output(6))) = '1' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_mux1h_2_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_254_nl, and_302_nl, fsm_output(7))) = '1' ) THEN
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
      ELSIF ( (and_dcpl_92 OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
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
      ELSIF ( (MUX_s_1_2_2(mux_257_nl, and_309_nl, fsm_output(2))) = '1' ) THEN
        COMP_LOOP_k_9_1_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_2(7
            DOWNTO 0)), or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_while_and_3 OR modExp_while_and_5 OR modExp_result_sva_mx0c0
          OR (NOT mux_143_nl)) AND (modExp_result_sva_mx0c0 OR modExp_result_and_rgt
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
      IF ( (NOT(mux_152_nl AND (NOT (fsm_output(6))))) = '1' ) THEN
        modExp_base_1_sva <= MUX1HOT_v_64_4_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w5,
            modExp_result_sva, STD_LOGIC_VECTOR'( and_114_nl & r_or_nl & r_or_1_nl
            & and_121_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_2_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_168_nl, mux_159_nl, fsm_output(3))) = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX1HOT_v_64_3_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, STD_LOGIC_VECTOR'( and_dcpl_92
            & and_135_nl & and_136_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_72 OR and_dcpl_73 OR and_dcpl_57) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_2(63))),
            (NOT (z_out(8))), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'( and_dcpl_72
            & and_dcpl_73 & and_dcpl_57));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(mux_213_nl OR (fsm_output(6)))) OR and_dcpl_79) = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out_3, z_out, and_dcpl_79);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_26 OR (fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(3))
          OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(6)))) = '1'
          ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_35 OR and_dcpl_41 OR and_dcpl_81) = '1' ) THEN
        COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm <= MUX1HOT_s_1_3_2((z_out(9)),
            (z_out_2(9)), (z_out(8)), STD_LOGIC_VECTOR'( and_dcpl_35 & and_dcpl_41
            & and_dcpl_81));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2(nor_nl, and_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= z_out_2(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_1_sva_1 <= '0';
      ELSIF ( mux_225_nl = '0' ) THEN
        modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_sva_7_0(0)), modExp_exp_1_1_1_sva,
            and_149_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
        modExp_exp_1_5_1_sva <= '0';
        modExp_exp_1_4_1_sva <= '0';
        modExp_exp_1_3_1_sva <= '0';
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( mux_227_itm = '1' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(5)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(6)), STD_LOGIC_VECTOR'( and_dcpl_121 & and_dcpl_134
            & and_dcpl_129));
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(4)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(5)), STD_LOGIC_VECTOR'( and_dcpl_121 & and_dcpl_134
            & and_dcpl_129));
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(3)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(4)), STD_LOGIC_VECTOR'( and_dcpl_121 & and_dcpl_134
            & and_dcpl_129));
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(2)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(3)), STD_LOGIC_VECTOR'( and_dcpl_121 & and_dcpl_134
            & and_dcpl_129));
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_sva_7_0(1)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_1_sva_7_0(2)), STD_LOGIC_VECTOR'( and_dcpl_121 & and_dcpl_134
            & and_dcpl_129));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_1_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_26 OR (NOT and_164_cse) OR (NOT (fsm_output(3))) OR (fsm_output(5))
          OR (fsm_output(7)) OR (NOT (fsm_output(6))))) = '1' ) THEN
        COMP_LOOP_1_mul_mut <= COMP_LOOP_1_mul_mut_mx0w4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_80 AND (fsm_output(3)) AND (fsm_output(5)) AND (fsm_output(7))
          AND (NOT (fsm_output(6)))) = '1' ) THEN
        COMP_LOOP_2_mul_mut <= COMP_LOOP_1_mul_mut_mx0w4;
      END IF;
    END IF;
  END PROCESS;
  modulo_result_or_nl <= and_dcpl_72 OR and_dcpl_73 OR and_dcpl_81;
  mux_83_nl <= MUX_s_1_2_2(and_dcpl_21, mux_tmp_76, fsm_output(1));
  mux_84_nl <= MUX_s_1_2_2(mux_83_nl, mux_tmp_77, fsm_output(0));
  mux_85_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), mux_84_nl, fsm_output(3));
  mux_86_nl <= MUX_s_1_2_2(mux_85_nl, (NOT mux_tmp_82), fsm_output(5));
  or_93_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000"));
  mux_81_nl <= MUX_s_1_2_2(or_93_nl, mux_tmp_80, fsm_output(5));
  mux_87_nl <= MUX_s_1_2_2(mux_86_nl, mux_81_nl, fsm_output(7));
  nor_100_nl <= NOT((fsm_output(3)) OR mux_tmp_73);
  and_182_nl <= (fsm_output(3)) AND (fsm_output(0)) AND (fsm_output(1));
  mux_72_nl <= MUX_s_1_2_2((fsm_output(4)), or_245_cse, and_182_nl);
  mux_74_nl <= MUX_s_1_2_2(nor_100_nl, mux_72_nl, fsm_output(5));
  mux_71_nl <= MUX_s_1_2_2((NOT mux_tmp_70), or_tmp_73, fsm_output(5));
  mux_75_nl <= MUX_s_1_2_2((NOT mux_74_nl), mux_71_nl, fsm_output(7));
  mux_88_nl <= MUX_s_1_2_2(mux_87_nl, mux_75_nl, fsm_output(6));
  mux_96_nl <= MUX_s_1_2_2((NOT and_tmp_10), (fsm_output(4)), fsm_output(5));
  mux_94_nl <= MUX_s_1_2_2(mux_tmp_76, and_dcpl_3, or_97_cse);
  nor_99_nl <= NOT((fsm_output(3)) OR (NOT mux_94_nl));
  mux_95_nl <= MUX_s_1_2_2(nor_99_nl, mux_tmp_93, fsm_output(5));
  mux_97_nl <= MUX_s_1_2_2(mux_96_nl, mux_95_nl, fsm_output(7));
  mux_91_nl <= MUX_s_1_2_2((NOT mux_tmp_73), mux_tmp_90, fsm_output(3));
  or_95_nl <= (fsm_output(5)) OR mux_91_nl;
  mux_89_nl <= MUX_s_1_2_2(mux_tmp_68, (NOT (fsm_output(4))), fsm_output(3));
  nand_4_nl <= NOT((fsm_output(5)) AND mux_89_nl);
  mux_92_nl <= MUX_s_1_2_2(or_95_nl, nand_4_nl, fsm_output(7));
  mux_98_nl <= MUX_s_1_2_2(mux_97_nl, mux_92_nl, fsm_output(6));
  and_87_nl <= (NOT mux_tmp_99) AND and_178_cse AND and_dcpl_66;
  nand_14_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111")));
  mux_101_nl <= MUX_s_1_2_2(nand_14_nl, mux_tmp_100, fsm_output(5));
  and_88_nl <= (NOT mux_101_nl) AND and_dcpl_36;
  and_97_nl <= or_dcpl_18 AND CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("110"));
  COMP_LOOP_and_3_nl <= (NOT and_dcpl_98) AND and_dcpl_92;
  mux_176_nl <= MUX_s_1_2_2(mux_tmp_80, (NOT mux_tmp_70), fsm_output(5));
  mux_177_nl <= MUX_s_1_2_2(mux_176_nl, mux_tmp_175, fsm_output(7));
  nor_78_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR
      (NOT (fsm_output(2))));
  mux_173_nl <= MUX_s_1_2_2(nor_78_nl, mux_tmp_136, fsm_output(3));
  or_156_nl <= (fsm_output(7)) OR (fsm_output(5)) OR mux_173_nl;
  mux_178_nl <= MUX_s_1_2_2(mux_177_nl, or_156_nl, fsm_output(6));
  COMP_LOOP_mux1h_12_nl <= MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z(0)), (tmp_2_lpi_4_dfm(0)),
      modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva, STD_LOGIC_VECTOR'( COMP_LOOP_and_3_nl
      & and_dcpl_98 & and_dcpl_122 & (NOT mux_178_nl)));
  mux_181_nl <= MUX_s_1_2_2(and_dcpl_21, and_dcpl_3, or_97_cse);
  mux_182_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), mux_181_nl, fsm_output(3));
  or_159_nl <= (fsm_output(3)) OR (NOT (fsm_output(0))) OR (fsm_output(1));
  mux_180_nl <= MUX_s_1_2_2(and_dcpl_3, (fsm_output(4)), or_159_nl);
  mux_183_nl <= MUX_s_1_2_2(mux_182_nl, (NOT mux_180_nl), fsm_output(5));
  and_169_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111"));
  mux_179_nl <= MUX_s_1_2_2((NOT mux_174_itm), and_169_nl, fsm_output(5));
  mux_184_nl <= MUX_s_1_2_2(mux_183_nl, mux_179_nl, fsm_output(7));
  mux_185_nl <= MUX_s_1_2_2(mux_184_nl, or_tmp_138, fsm_output(6));
  COMP_LOOP_mux1h_19_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(6)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_sva_7_0(7)), STD_LOGIC_VECTOR'( and_dcpl_121
      & and_dcpl_73 & (NOT mux_227_itm) & and_dcpl_129));
  or_221_nl <= (fsm_output(7)) OR (fsm_output(5)) OR ((fsm_output(3)) AND mux_tmp_90);
  mux_229_nl <= MUX_s_1_2_2(mux_tmp_226, or_221_nl, fsm_output(6));
  COMP_LOOP_mux1h_36_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_sva_7_0(7)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_sva_7_0(1)), STD_LOGIC_VECTOR'( and_dcpl_121
      & and_dcpl_134 & (NOT mux_229_nl) & and_dcpl_129));
  nor_96_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(1))
      OR (fsm_output(4)) OR (fsm_output(2)));
  nand_48_nl <= NOT((CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")))
      AND (fsm_output(3)));
  nor_176_nl <= NOT(nor_177_cse OR (fsm_output(3)));
  mux_243_nl <= MUX_s_1_2_2(nand_48_nl, nor_176_nl, fsm_output(0));
  nor_180_nl <= NOT((fsm_output(7)) OR mux_243_nl);
  nand_51_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")));
  or_307_nl <= and_305_cse OR (fsm_output(3));
  mux_242_nl <= MUX_s_1_2_2(nand_51_nl, or_307_nl, fsm_output(7));
  mux_244_nl <= MUX_s_1_2_2(nor_180_nl, mux_242_nl, fsm_output(4));
  or_308_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"));
  nand_52_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111")));
  mux_240_nl <= MUX_s_1_2_2(or_308_nl, nand_52_nl, fsm_output(7));
  mux_241_nl <= MUX_s_1_2_2((fsm_output(7)), mux_240_nl, fsm_output(4));
  mux_245_nl <= MUX_s_1_2_2(mux_244_nl, mux_241_nl, fsm_output(5));
  and_310_nl <= (and_164_cse OR (fsm_output(2))) AND (fsm_output(3));
  nor_181_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000")));
  mux_237_nl <= MUX_s_1_2_2(and_310_nl, nor_181_nl, fsm_output(7));
  mux_238_nl <= MUX_s_1_2_2((fsm_output(7)), mux_237_nl, fsm_output(4));
  nand_50_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")));
  or_267_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  mux_nl <= MUX_s_1_2_2(nand_50_nl, or_267_nl, fsm_output(7));
  mux_236_nl <= MUX_s_1_2_2(mux_nl, (fsm_output(7)), fsm_output(4));
  mux_239_nl <= MUX_s_1_2_2(mux_238_nl, mux_236_nl, fsm_output(5));
  or_292_nl <= (NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(1)));
  or_290_nl <= (fsm_output(5)) OR (fsm_output(1));
  mux_252_nl <= MUX_s_1_2_2(or_292_nl, or_290_nl, fsm_output(0));
  nor_170_nl <= NOT((fsm_output(2)) OR mux_252_nl);
  or_303_nl <= (NOT modExp_exp_1_0_1_sva) OR (fsm_output(5)) OR (NOT (fsm_output(1)));
  nand_46_nl <= NOT((fsm_output(5)) AND (fsm_output(1)));
  mux_251_nl <= MUX_s_1_2_2(or_303_nl, nand_46_nl, fsm_output(3));
  nor_171_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(0)) OR mux_251_nl);
  mux_253_nl <= MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output(6));
  or_284_nl <= (fsm_output(3)) OR (NOT (fsm_output(5)));
  or_283_nl <= (fsm_output(3)) OR (NOT(modExp_exp_1_0_1_sva AND (fsm_output(5)) AND
      (fsm_output(1))));
  mux_250_nl <= MUX_s_1_2_2(or_284_nl, or_283_nl, fsm_output(0));
  nor_172_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR mux_250_nl);
  mux_254_nl <= MUX_s_1_2_2(mux_253_nl, nor_172_nl, fsm_output(4));
  nor_173_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(3))) OR (NOT modExp_exp_1_0_1_sva)
      OR (fsm_output(5)) OR (fsm_output(1)));
  nor_174_nl <= NOT((fsm_output(3)) OR (fsm_output(5)) OR (NOT (fsm_output(1))));
  and_303_nl <= (fsm_output(3)) AND modExp_exp_1_0_1_sva AND (fsm_output(5)) AND
      (NOT (fsm_output(1)));
  mux_247_nl <= MUX_s_1_2_2(nor_174_nl, and_303_nl, fsm_output(0));
  mux_248_nl <= MUX_s_1_2_2(nor_173_nl, mux_247_nl, fsm_output(2));
  nor_175_nl <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(5))
      OR (NOT (fsm_output(1))));
  mux_249_nl <= MUX_s_1_2_2(mux_248_nl, nor_175_nl, fsm_output(6));
  and_302_nl <= (fsm_output(4)) AND mux_249_nl;
  or_124_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(1))
      OR (fsm_output(4));
  or_123_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(4)));
  mux_134_nl <= MUX_s_1_2_2(or_124_nl, or_123_nl, fsm_output(5));
  or_125_nl <= (fsm_output(7)) OR mux_134_nl;
  nand_27_nl <= NOT((fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(3)) AND (NOT
      (fsm_output(0))) AND and_178_cse);
  mux_135_nl <= MUX_s_1_2_2(or_125_nl, nand_27_nl, fsm_output(6));
  or_nl <= mux_135_nl OR (fsm_output(2));
  or_301_nl <= (NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT (fsm_output(4)));
  or_299_nl <= (fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(4));
  mux_256_nl <= MUX_s_1_2_2(or_301_nl, or_299_nl, fsm_output(3));
  nor_167_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))
      OR mux_256_nl);
  and_308_nl <= (fsm_output(6)) AND (fsm_output(7)) AND (fsm_output(3)) AND (fsm_output(5))
      AND (NOT (fsm_output(0))) AND (fsm_output(4));
  mux_257_nl <= MUX_s_1_2_2(nor_167_nl, and_308_nl, fsm_output(1));
  and_309_nl <= (fsm_output(1)) AND (NOT (fsm_output(6))) AND (fsm_output(7)) AND
      (fsm_output(3)) AND (fsm_output(5)) AND (NOT (fsm_output(0))) AND (fsm_output(4));
  or_133_nl <= (fsm_output(1)) OR (NOT mux_tmp_76);
  mux_141_nl <= MUX_s_1_2_2(or_tmp_78, or_133_nl, fsm_output(0));
  mux_142_nl <= MUX_s_1_2_2((fsm_output(4)), mux_141_nl, fsm_output(3));
  nor_89_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR mux_142_nl);
  mux_143_nl <= MUX_s_1_2_2(nor_89_nl, and_tmp_11, fsm_output(6));
  and_114_nl <= and_dcpl_44 AND and_dcpl_70;
  r_or_nl <= ((NOT (modulo_result_rem_cmp_z(63))) AND and_117_m1c) OR (and_dcpl_112
      AND nor_tmp_8 AND (NOT (fsm_output(6))) AND (NOT (modulo_result_rem_cmp_z(63))));
  r_or_1_nl <= ((modulo_result_rem_cmp_z(63)) AND and_117_m1c) OR (and_dcpl_112 AND
      nor_tmp_8 AND (NOT (fsm_output(6))) AND (modulo_result_rem_cmp_z(63)));
  nor_85_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(2)));
  nor_86_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(2))));
  mux_145_nl <= MUX_s_1_2_2(nor_85_nl, nor_86_nl, fsm_output(7));
  and_121_nl <= mux_145_nl AND (fsm_output(4)) AND and_dcpl_39 AND and_dcpl_103;
  and_172_nl <= (fsm_output(3)) AND (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(5));
  mux_151_nl <= MUX_s_1_2_2(and_172_nl, nor_tmp_8, fsm_output(4));
  or_140_nl <= (fsm_output(0)) OR (fsm_output(2));
  mux_149_nl <= MUX_s_1_2_2(nor_118_cse, nor_tmp_8, or_140_nl);
  and_173_nl <= (fsm_output(3)) AND mux_149_nl;
  mux_146_nl <= MUX_s_1_2_2((fsm_output(5)), (fsm_output(7)), fsm_output(2));
  mux_147_nl <= MUX_s_1_2_2(nor_tmp_8, mux_146_nl, fsm_output(0));
  nor_84_nl <= NOT((fsm_output(2)) OR (NOT nor_tmp_8));
  mux_148_nl <= MUX_s_1_2_2(mux_147_nl, nor_84_nl, fsm_output(3));
  mux_150_nl <= MUX_s_1_2_2(and_173_nl, mux_148_nl, fsm_output(4));
  mux_152_nl <= MUX_s_1_2_2(mux_151_nl, mux_150_nl, fsm_output(1));
  nor_81_nl <= NOT((VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(5))) OR (fsm_output(2)));
  nor_82_nl <= NOT((COMP_LOOP_acc_1_cse_sva(0)) OR (fsm_output(5)) OR (NOT (fsm_output(2))));
  mux_170_nl <= MUX_s_1_2_2(nor_81_nl, nor_82_nl, fsm_output(7));
  and_135_nl <= mux_170_nl AND and_dcpl_118;
  nor_79_nl <= NOT((NOT (VEC_LOOP_j_sva_11_0(0))) OR (NOT (fsm_output(5))) OR (fsm_output(2)));
  nor_80_nl <= NOT((NOT (COMP_LOOP_acc_1_cse_sva(0))) OR (fsm_output(5)) OR (NOT
      (fsm_output(2))));
  mux_171_nl <= MUX_s_1_2_2(nor_79_nl, nor_80_nl, fsm_output(7));
  and_136_nl <= mux_171_nl AND and_dcpl_118;
  mux_165_nl <= MUX_s_1_2_2((NOT or_tmp_123), or_tmp_123, fsm_output(5));
  mux_166_nl <= MUX_s_1_2_2(mux_165_nl, mux_tmp_160, fsm_output(2));
  mux_162_nl <= MUX_s_1_2_2((fsm_output(7)), or_tmp_123, fsm_output(5));
  mux_163_nl <= MUX_s_1_2_2(mux_162_nl, mux_tmp_160, fsm_output(2));
  mux_161_nl <= MUX_s_1_2_2(mux_tmp_160, nor_tmp_47, fsm_output(2));
  mux_164_nl <= MUX_s_1_2_2(mux_163_nl, mux_161_nl, fsm_output(0));
  mux_167_nl <= MUX_s_1_2_2(mux_166_nl, mux_164_nl, fsm_output(1));
  mux_168_nl <= MUX_s_1_2_2(mux_tmp_156, mux_167_nl, fsm_output(4));
  mux_157_nl <= MUX_s_1_2_2(mux_tmp_156, mux_tmp_154, fsm_output(2));
  mux_153_nl <= MUX_s_1_2_2((NOT or_tmp_123), (fsm_output(6)), fsm_output(5));
  mux_155_nl <= MUX_s_1_2_2(mux_tmp_154, mux_153_nl, fsm_output(2));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, mux_155_nl, fsm_output(1));
  mux_159_nl <= MUX_s_1_2_2(mux_158_nl, nor_tmp_47, fsm_output(4));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_2(8 DOWNTO 0))
      & '0') + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'(
      "0000000001"), 10));
  or_247_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(1)) OR (NOT and_dcpl_3);
  mux_212_nl <= MUX_s_1_2_2(or_246_cse, or_247_nl, fsm_output(5));
  or_248_nl <= (fsm_output(5)) OR (fsm_output(3)) OR (NOT and_dcpl_80);
  mux_213_nl <= MUX_s_1_2_2(mux_212_nl, or_248_nl, fsm_output(7));
  nor_nl <= NOT((fsm_output(7)) OR ((fsm_output(5)) AND mux_tmp_111));
  and_nl <= (fsm_output(7)) AND (fsm_output(5)) AND or_tmp_73;
  and_149_nl <= (NOT mux_tmp_99) AND and_dcpl_47 AND and_dcpl_66;
  and_160_nl <= (fsm_output(2)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(7));
  mux_223_nl <= MUX_s_1_2_2(and_160_nl, (fsm_output(7)), fsm_output(3));
  and_159_nl <= (fsm_output(4)) AND mux_223_nl;
  or_234_nl <= (fsm_output(2)) OR and_164_cse OR (fsm_output(7));
  nand_6_nl <= NOT((fsm_output(2)) AND or_97_cse AND (fsm_output(7)));
  mux_221_nl <= MUX_s_1_2_2(or_234_nl, nand_6_nl, fsm_output(3));
  mux_222_nl <= MUX_s_1_2_2((fsm_output(7)), mux_221_nl, fsm_output(4));
  mux_224_nl <= MUX_s_1_2_2(and_159_nl, mux_222_nl, fsm_output(5));
  nor_120_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR and_305_cse OR (fsm_output(7)) OR (fsm_output(5)));
  mux_225_nl <= MUX_s_1_2_2(mux_224_nl, nor_120_nl, fsm_output(6));
  COMP_LOOP_COMP_LOOP_or_110_nl <= ((tmp_2_lpi_4_dfm(63)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_111_nl <= ((tmp_2_lpi_4_dfm(62)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_112_nl <= ((tmp_2_lpi_4_dfm(61)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_113_nl <= ((tmp_2_lpi_4_dfm(60)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_114_nl <= ((tmp_2_lpi_4_dfm(59)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_115_nl <= ((tmp_2_lpi_4_dfm(58)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_116_nl <= ((tmp_2_lpi_4_dfm(57)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_117_nl <= ((tmp_2_lpi_4_dfm(56)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_118_nl <= ((tmp_2_lpi_4_dfm(55)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_119_nl <= ((tmp_2_lpi_4_dfm(54)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_120_nl <= ((tmp_2_lpi_4_dfm(53)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_121_nl <= ((tmp_2_lpi_4_dfm(52)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_122_nl <= ((tmp_2_lpi_4_dfm(51)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_123_nl <= ((tmp_2_lpi_4_dfm(50)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_124_nl <= ((tmp_2_lpi_4_dfm(49)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_125_nl <= ((tmp_2_lpi_4_dfm(48)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_126_nl <= ((tmp_2_lpi_4_dfm(47)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_127_nl <= ((tmp_2_lpi_4_dfm(46)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_128_nl <= ((tmp_2_lpi_4_dfm(45)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_129_nl <= ((tmp_2_lpi_4_dfm(44)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_130_nl <= ((tmp_2_lpi_4_dfm(43)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_131_nl <= ((tmp_2_lpi_4_dfm(42)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_132_nl <= ((tmp_2_lpi_4_dfm(41)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_133_nl <= ((tmp_2_lpi_4_dfm(40)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_134_nl <= ((tmp_2_lpi_4_dfm(39)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_135_nl <= ((tmp_2_lpi_4_dfm(38)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_136_nl <= ((tmp_2_lpi_4_dfm(37)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_137_nl <= ((tmp_2_lpi_4_dfm(36)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_138_nl <= ((tmp_2_lpi_4_dfm(35)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_139_nl <= ((tmp_2_lpi_4_dfm(34)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_140_nl <= ((tmp_2_lpi_4_dfm(33)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_141_nl <= ((tmp_2_lpi_4_dfm(32)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_142_nl <= ((tmp_2_lpi_4_dfm(31)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_143_nl <= ((tmp_2_lpi_4_dfm(30)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_144_nl <= ((tmp_2_lpi_4_dfm(29)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_145_nl <= ((tmp_2_lpi_4_dfm(28)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_146_nl <= ((tmp_2_lpi_4_dfm(27)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_147_nl <= ((tmp_2_lpi_4_dfm(26)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_148_nl <= ((tmp_2_lpi_4_dfm(25)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_149_nl <= ((tmp_2_lpi_4_dfm(24)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_150_nl <= ((tmp_2_lpi_4_dfm(23)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_151_nl <= ((tmp_2_lpi_4_dfm(22)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_152_nl <= ((tmp_2_lpi_4_dfm(21)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_153_nl <= ((tmp_2_lpi_4_dfm(20)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_154_nl <= ((tmp_2_lpi_4_dfm(19)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_155_nl <= ((tmp_2_lpi_4_dfm(18)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_156_nl <= ((tmp_2_lpi_4_dfm(17)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_157_nl <= ((tmp_2_lpi_4_dfm(16)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_158_nl <= ((tmp_2_lpi_4_dfm(15)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_159_nl <= ((tmp_2_lpi_4_dfm(14)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_160_nl <= ((tmp_2_lpi_4_dfm(13)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_COMP_LOOP_or_161_nl <= ((tmp_2_lpi_4_dfm(12)) AND COMP_LOOP_nor_2_itm)
      OR and_dcpl_146 OR and_dcpl_152 OR and_dcpl_166;
  COMP_LOOP_mux_45_nl <= MUX_v_2_2_2((tmp_2_lpi_4_dfm(11 DOWNTO 10)), (VEC_LOOP_j_sva_11_0(11
      DOWNTO 10)), and_dcpl_164);
  COMP_LOOP_nor_112_nl <= NOT(and_dcpl_157 OR and_dcpl_162);
  COMP_LOOP_and_166_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux_45_nl,
      COMP_LOOP_nor_112_nl);
  COMP_LOOP_COMP_LOOP_or_162_nl <= MUX_v_2_2_2(COMP_LOOP_and_166_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_14_itm);
  COMP_LOOP_mux1h_67_nl <= MUX1HOT_v_2_4_2((tmp_2_lpi_4_dfm(9 DOWNTO 8)), STD_LOGIC_VECTOR'(
      '1' & (NOT (COMP_LOOP_k_9_1_sva_7_0(7)))), (z_out_1(9 DOWNTO 8)), (VEC_LOOP_j_sva_11_0(9
      DOWNTO 8)), STD_LOGIC_VECTOR'( and_217_cse & and_dcpl_146 & COMP_LOOP_or_16_itm
      & and_dcpl_164));
  COMP_LOOP_or_26_nl <= MUX_v_2_2_2(COMP_LOOP_mux1h_67_nl, STD_LOGIC_VECTOR'("11"),
      COMP_LOOP_or_17_itm);
  COMP_LOOP_mux1h_68_nl <= MUX1HOT_v_7_6_2((tmp_2_lpi_4_dfm(7 DOWNTO 1)), (NOT (COMP_LOOP_k_9_1_sva_7_0(6
      DOWNTO 0))), STD_LOGIC_VECTOR'( (NOT modExp_exp_1_7_1_sva) & (NOT modExp_exp_1_6_1_sva)
      & (NOT modExp_exp_1_5_1_sva) & (NOT modExp_exp_1_4_1_sva) & (NOT modExp_exp_1_3_1_sva)
      & (NOT modExp_exp_1_2_1_sva) & (NOT modExp_exp_1_1_1_sva)), (z_out_1(7 DOWNTO
      1)), (VEC_LOOP_j_sva_11_0(7 DOWNTO 1)), STD_LOGIC_VECTOR'( (NOT modExp_exp_1_1_1_sva)
      & (NOT modExp_exp_1_7_1_sva) & (NOT modExp_exp_1_6_1_sva) & (NOT modExp_exp_1_5_1_sva)
      & (NOT modExp_exp_1_4_1_sva) & (NOT modExp_exp_1_3_1_sva) & (NOT modExp_exp_1_2_1_sva)),
      STD_LOGIC_VECTOR'( and_217_cse & and_dcpl_146 & and_dcpl_152 & COMP_LOOP_or_16_itm
      & and_dcpl_164 & and_dcpl_166));
  COMP_LOOP_mux1h_69_nl <= MUX1HOT_s_1_4_2((tmp_2_lpi_4_dfm(0)), (NOT modExp_exp_1_0_1_sva_1),
      (z_out_1(0)), (VEC_LOOP_j_sva_11_0(0)), STD_LOGIC_VECTOR'( and_217_cse & COMP_LOOP_or_17_itm
      & COMP_LOOP_or_16_itm & and_dcpl_164));
  COMP_LOOP_or_27_nl <= COMP_LOOP_mux1h_69_nl OR and_dcpl_146;
  COMP_LOOP_or_28_nl <= (NOT(and_dcpl_146 OR and_dcpl_152 OR and_dcpl_157 OR and_dcpl_162
      OR and_dcpl_164 OR and_dcpl_166)) OR and_217_cse;
  COMP_LOOP_mux1h_70_nl <= MUX1HOT_v_64_4_2((NOT modExp_base_1_sva_mx1), STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000000000000001"), (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000") & VEC_LOOP_j_sva_11_0),
      (STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000")
      & STAGE_LOOP_lshift_psp_sva), STD_LOGIC_VECTOR'( and_217_cse & COMP_LOOP_or_14_itm
      & COMP_LOOP_or_16_itm & and_dcpl_164));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_110_nl
      & COMP_LOOP_COMP_LOOP_or_111_nl & COMP_LOOP_COMP_LOOP_or_112_nl & COMP_LOOP_COMP_LOOP_or_113_nl
      & COMP_LOOP_COMP_LOOP_or_114_nl & COMP_LOOP_COMP_LOOP_or_115_nl & COMP_LOOP_COMP_LOOP_or_116_nl
      & COMP_LOOP_COMP_LOOP_or_117_nl & COMP_LOOP_COMP_LOOP_or_118_nl & COMP_LOOP_COMP_LOOP_or_119_nl
      & COMP_LOOP_COMP_LOOP_or_120_nl & COMP_LOOP_COMP_LOOP_or_121_nl & COMP_LOOP_COMP_LOOP_or_122_nl
      & COMP_LOOP_COMP_LOOP_or_123_nl & COMP_LOOP_COMP_LOOP_or_124_nl & COMP_LOOP_COMP_LOOP_or_125_nl
      & COMP_LOOP_COMP_LOOP_or_126_nl & COMP_LOOP_COMP_LOOP_or_127_nl & COMP_LOOP_COMP_LOOP_or_128_nl
      & COMP_LOOP_COMP_LOOP_or_129_nl & COMP_LOOP_COMP_LOOP_or_130_nl & COMP_LOOP_COMP_LOOP_or_131_nl
      & COMP_LOOP_COMP_LOOP_or_132_nl & COMP_LOOP_COMP_LOOP_or_133_nl & COMP_LOOP_COMP_LOOP_or_134_nl
      & COMP_LOOP_COMP_LOOP_or_135_nl & COMP_LOOP_COMP_LOOP_or_136_nl & COMP_LOOP_COMP_LOOP_or_137_nl
      & COMP_LOOP_COMP_LOOP_or_138_nl & COMP_LOOP_COMP_LOOP_or_139_nl & COMP_LOOP_COMP_LOOP_or_140_nl
      & COMP_LOOP_COMP_LOOP_or_141_nl & COMP_LOOP_COMP_LOOP_or_142_nl & COMP_LOOP_COMP_LOOP_or_143_nl
      & COMP_LOOP_COMP_LOOP_or_144_nl & COMP_LOOP_COMP_LOOP_or_145_nl & COMP_LOOP_COMP_LOOP_or_146_nl
      & COMP_LOOP_COMP_LOOP_or_147_nl & COMP_LOOP_COMP_LOOP_or_148_nl & COMP_LOOP_COMP_LOOP_or_149_nl
      & COMP_LOOP_COMP_LOOP_or_150_nl & COMP_LOOP_COMP_LOOP_or_151_nl & COMP_LOOP_COMP_LOOP_or_152_nl
      & COMP_LOOP_COMP_LOOP_or_153_nl & COMP_LOOP_COMP_LOOP_or_154_nl & COMP_LOOP_COMP_LOOP_or_155_nl
      & COMP_LOOP_COMP_LOOP_or_156_nl & COMP_LOOP_COMP_LOOP_or_157_nl & COMP_LOOP_COMP_LOOP_or_158_nl
      & COMP_LOOP_COMP_LOOP_or_159_nl & COMP_LOOP_COMP_LOOP_or_160_nl & COMP_LOOP_COMP_LOOP_or_161_nl
      & COMP_LOOP_COMP_LOOP_or_162_nl & COMP_LOOP_or_26_nl & COMP_LOOP_mux1h_68_nl
      & COMP_LOOP_or_27_nl & COMP_LOOP_or_28_nl) + UNSIGNED(COMP_LOOP_mux1h_70_nl
      & '1'), 65));
  z_out <= acc_nl(64 DOWNTO 1);
  and_311_nl <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("10111110"));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva) +
      CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_sva_7_0 & and_311_nl),
      9), 10), 10));
  COMP_LOOP_COMP_LOOP_or_163_nl <= (NOT(and_dcpl_186 OR and_dcpl_192 OR and_217_cse
      OR and_dcpl_198 OR and_dcpl_207)) OR and_dcpl_202 OR and_dcpl_208;
  COMP_LOOP_mux1h_71_nl <= MUX1HOT_v_64_7_2((STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000001")
      & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))), (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000")
      & VEC_LOOP_j_sva_11_0), tmp_2_lpi_4_dfm, p_sva, ('1' & (NOT (operator_64_false_acc_mut_63_0(62
      DOWNTO 0)))), (STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000")
      & COMP_LOOP_k_9_1_sva_7_0), (NOT (operator_66_true_div_cmp_z(63 DOWNTO 0))),
      STD_LOGIC_VECTOR'( and_dcpl_186 & and_dcpl_192 & and_217_cse & and_dcpl_198
      & and_dcpl_202 & and_dcpl_207 & and_dcpl_208));
  COMP_LOOP_or_29_nl <= (NOT(and_dcpl_192 OR and_217_cse OR and_dcpl_198 OR and_dcpl_202
      OR and_dcpl_207 OR and_dcpl_208)) OR and_dcpl_186;
  COMP_LOOP_COMP_LOOP_or_164_nl <= ((modExp_base_1_sva_mx1(63)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_165_nl <= ((modExp_base_1_sva_mx1(62)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_166_nl <= ((modExp_base_1_sva_mx1(61)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_167_nl <= ((modExp_base_1_sva_mx1(60)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_168_nl <= ((modExp_base_1_sva_mx1(59)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_169_nl <= ((modExp_base_1_sva_mx1(58)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_170_nl <= ((modExp_base_1_sva_mx1(57)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_171_nl <= ((modExp_base_1_sva_mx1(56)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_172_nl <= ((modExp_base_1_sva_mx1(55)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_173_nl <= ((modExp_base_1_sva_mx1(54)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_174_nl <= ((modExp_base_1_sva_mx1(53)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_175_nl <= ((modExp_base_1_sva_mx1(52)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_176_nl <= ((modExp_base_1_sva_mx1(51)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_177_nl <= ((modExp_base_1_sva_mx1(50)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_178_nl <= ((modExp_base_1_sva_mx1(49)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_179_nl <= ((modExp_base_1_sva_mx1(48)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_180_nl <= ((modExp_base_1_sva_mx1(47)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_181_nl <= ((modExp_base_1_sva_mx1(46)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_182_nl <= ((modExp_base_1_sva_mx1(45)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_183_nl <= ((modExp_base_1_sva_mx1(44)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_184_nl <= ((modExp_base_1_sva_mx1(43)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_185_nl <= ((modExp_base_1_sva_mx1(42)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_186_nl <= ((modExp_base_1_sva_mx1(41)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_187_nl <= ((modExp_base_1_sva_mx1(40)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_188_nl <= ((modExp_base_1_sva_mx1(39)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_189_nl <= ((modExp_base_1_sva_mx1(38)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_190_nl <= ((modExp_base_1_sva_mx1(37)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_191_nl <= ((modExp_base_1_sva_mx1(36)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_192_nl <= ((modExp_base_1_sva_mx1(35)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_193_nl <= ((modExp_base_1_sva_mx1(34)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_194_nl <= ((modExp_base_1_sva_mx1(33)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_195_nl <= ((modExp_base_1_sva_mx1(32)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_196_nl <= ((modExp_base_1_sva_mx1(31)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_197_nl <= ((modExp_base_1_sva_mx1(30)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_198_nl <= ((modExp_base_1_sva_mx1(29)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_199_nl <= ((modExp_base_1_sva_mx1(28)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_200_nl <= ((modExp_base_1_sva_mx1(27)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_201_nl <= ((modExp_base_1_sva_mx1(26)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_202_nl <= ((modExp_base_1_sva_mx1(25)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_203_nl <= ((modExp_base_1_sva_mx1(24)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_204_nl <= ((modExp_base_1_sva_mx1(23)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_205_nl <= ((modExp_base_1_sva_mx1(22)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_206_nl <= ((modExp_base_1_sva_mx1(21)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_207_nl <= ((modExp_base_1_sva_mx1(20)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_208_nl <= ((modExp_base_1_sva_mx1(19)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_209_nl <= ((modExp_base_1_sva_mx1(18)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_210_nl <= ((modExp_base_1_sva_mx1(17)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_211_nl <= ((modExp_base_1_sva_mx1(16)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_212_nl <= ((modExp_base_1_sva_mx1(15)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_213_nl <= ((modExp_base_1_sva_mx1(14)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_214_nl <= ((modExp_base_1_sva_mx1(13)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_215_nl <= ((modExp_base_1_sva_mx1(12)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_216_nl <= ((modExp_base_1_sva_mx1(11)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_217_nl <= ((modExp_base_1_sva_mx1(10)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_or_218_nl <= ((modExp_base_1_sva_mx1(9)) AND COMP_LOOP_nor_56_itm)
      OR and_dcpl_198;
  COMP_LOOP_COMP_LOOP_mux_3_nl <= MUX_v_8_2_2(COMP_LOOP_k_9_1_sva_7_0, (modExp_base_1_sva_mx1(8
      DOWNTO 1)), and_217_cse);
  COMP_LOOP_nor_116_nl <= NOT(and_dcpl_202 OR and_dcpl_207 OR and_dcpl_208);
  COMP_LOOP_and_222_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), COMP_LOOP_COMP_LOOP_mux_3_nl,
      COMP_LOOP_nor_116_nl);
  COMP_LOOP_or_30_nl <= MUX_v_8_2_2(COMP_LOOP_and_222_nl, STD_LOGIC_VECTOR'("11111111"),
      and_dcpl_198);
  COMP_LOOP_COMP_LOOP_or_219_nl <= (modExp_base_1_sva_mx1(0)) OR and_dcpl_186 OR
      and_dcpl_192 OR and_dcpl_198 OR and_dcpl_202 OR and_dcpl_207 OR and_dcpl_208;
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_163_nl
      & COMP_LOOP_mux1h_71_nl & COMP_LOOP_or_29_nl) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_COMP_LOOP_or_164_nl
      & COMP_LOOP_COMP_LOOP_or_165_nl & COMP_LOOP_COMP_LOOP_or_166_nl & COMP_LOOP_COMP_LOOP_or_167_nl
      & COMP_LOOP_COMP_LOOP_or_168_nl & COMP_LOOP_COMP_LOOP_or_169_nl & COMP_LOOP_COMP_LOOP_or_170_nl
      & COMP_LOOP_COMP_LOOP_or_171_nl & COMP_LOOP_COMP_LOOP_or_172_nl & COMP_LOOP_COMP_LOOP_or_173_nl
      & COMP_LOOP_COMP_LOOP_or_174_nl & COMP_LOOP_COMP_LOOP_or_175_nl & COMP_LOOP_COMP_LOOP_or_176_nl
      & COMP_LOOP_COMP_LOOP_or_177_nl & COMP_LOOP_COMP_LOOP_or_178_nl & COMP_LOOP_COMP_LOOP_or_179_nl
      & COMP_LOOP_COMP_LOOP_or_180_nl & COMP_LOOP_COMP_LOOP_or_181_nl & COMP_LOOP_COMP_LOOP_or_182_nl
      & COMP_LOOP_COMP_LOOP_or_183_nl & COMP_LOOP_COMP_LOOP_or_184_nl & COMP_LOOP_COMP_LOOP_or_185_nl
      & COMP_LOOP_COMP_LOOP_or_186_nl & COMP_LOOP_COMP_LOOP_or_187_nl & COMP_LOOP_COMP_LOOP_or_188_nl
      & COMP_LOOP_COMP_LOOP_or_189_nl & COMP_LOOP_COMP_LOOP_or_190_nl & COMP_LOOP_COMP_LOOP_or_191_nl
      & COMP_LOOP_COMP_LOOP_or_192_nl & COMP_LOOP_COMP_LOOP_or_193_nl & COMP_LOOP_COMP_LOOP_or_194_nl
      & COMP_LOOP_COMP_LOOP_or_195_nl & COMP_LOOP_COMP_LOOP_or_196_nl & COMP_LOOP_COMP_LOOP_or_197_nl
      & COMP_LOOP_COMP_LOOP_or_198_nl & COMP_LOOP_COMP_LOOP_or_199_nl & COMP_LOOP_COMP_LOOP_or_200_nl
      & COMP_LOOP_COMP_LOOP_or_201_nl & COMP_LOOP_COMP_LOOP_or_202_nl & COMP_LOOP_COMP_LOOP_or_203_nl
      & COMP_LOOP_COMP_LOOP_or_204_nl & COMP_LOOP_COMP_LOOP_or_205_nl & COMP_LOOP_COMP_LOOP_or_206_nl
      & COMP_LOOP_COMP_LOOP_or_207_nl & COMP_LOOP_COMP_LOOP_or_208_nl & COMP_LOOP_COMP_LOOP_or_209_nl
      & COMP_LOOP_COMP_LOOP_or_210_nl & COMP_LOOP_COMP_LOOP_or_211_nl & COMP_LOOP_COMP_LOOP_or_212_nl
      & COMP_LOOP_COMP_LOOP_or_213_nl & COMP_LOOP_COMP_LOOP_or_214_nl & COMP_LOOP_COMP_LOOP_or_215_nl
      & COMP_LOOP_COMP_LOOP_or_216_nl & COMP_LOOP_COMP_LOOP_or_217_nl & COMP_LOOP_COMP_LOOP_or_218_nl
      & COMP_LOOP_or_30_nl & COMP_LOOP_COMP_LOOP_or_219_nl & '1'), 65), 66), 66));
  z_out_2 <= acc_2_nl(65 DOWNTO 1);
  and_312_nl <= and_dcpl_21 AND (fsm_output(1)) AND (NOT (fsm_output(0))) AND (fsm_output(3))
      AND (NOT (fsm_output(6))) AND nor_118_cse;
  or_310_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("10111"));
  mux_261_nl <= MUX_s_1_2_2(or_246_cse, or_310_nl, fsm_output(7));
  or_311_nl <= (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(0)) OR (fsm_output(1))
      OR (NOT((fsm_output(2)) AND (fsm_output(4))));
  mux_260_nl <= MUX_s_1_2_2(mux_261_nl, or_311_nl, fsm_output(5));
  nor_184_nl <= NOT(mux_260_nl OR (fsm_output(6)));
  nor_185_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(3))) OR (fsm_output(0))
      OR (fsm_output(1)));
  nor_186_nl <= NOT((fsm_output(7)) OR (fsm_output(3)) OR (NOT(CONV_SL_1_1(fsm_output(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")))));
  mux_262_nl <= MUX_s_1_2_2(nor_185_nl, nor_186_nl, fsm_output(5));
  and_313_nl <= mux_262_nl AND (fsm_output(4)) AND (NOT (fsm_output(2))) AND (NOT
      (fsm_output(6)));
  modExp_while_if_mux1h_1_nl <= MUX1HOT_v_64_3_2(modExp_result_sva, modExp_base_1_sva,
      operator_64_false_acc_mut_63_0, STD_LOGIC_VECTOR'( and_312_nl & nor_184_nl
      & and_313_nl));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux1h_1_nl)
      * UNSIGNED(modExp_base_1_sva)), 64));
END v33;

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

ARCHITECTURE v33 OF inPlaceNTT_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_adra_d_iff : STD_LOGIC_VECTOR (10 DOWNTO 0);
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
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
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
      vec_rsc_0_0_i_adra_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff,
      vec_rsc_0_0_i_da_d_pff => inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff,
      vec_rsc_0_0_i_wea_d_pff => vec_rsc_0_0_i_wea_d_iff,
      vec_rsc_0_1_i_wea_d_pff => vec_rsc_0_1_i_wea_d_iff
    );
  inPlaceNTT_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  inPlaceNTT_DIT_core_inst_r_rsc_dat <= r_rsc_dat;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_qa_d <= vec_rsc_0_0_i_qa_d;
  inPlaceNTT_DIT_core_inst_vec_rsc_0_1_i_qa_d <= vec_rsc_0_1_i_qa_d;
  vec_rsc_0_0_i_adra_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_adra_d_pff;
  vec_rsc_0_0_i_da_d_iff <= inPlaceNTT_DIT_core_inst_vec_rsc_0_0_i_da_d_pff;

END v33;



