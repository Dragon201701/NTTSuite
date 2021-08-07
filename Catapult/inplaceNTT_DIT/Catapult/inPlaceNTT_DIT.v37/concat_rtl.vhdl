
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
--  Generated date: Wed Jun 30 21:18:02 2021
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

ARCHITECTURE v37 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v37;

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

ARCHITECTURE v37 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v37;

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

ARCHITECTURE v37 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v37;

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

ARCHITECTURE v37 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v37;

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
    modExp_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_65_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_130_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_195_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_260_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v37 OF inPlaceNTT_DIT_core_core_fsm IS
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
      modExp_while_C_37, modExp_while_C_38, modExp_while_C_39, modExp_while_C_40,
      COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0, COMP_LOOP_1_modExp_1_while_C_1,
      COMP_LOOP_1_modExp_1_while_C_2, COMP_LOOP_1_modExp_1_while_C_3, COMP_LOOP_1_modExp_1_while_C_4,
      COMP_LOOP_1_modExp_1_while_C_5, COMP_LOOP_1_modExp_1_while_C_6, COMP_LOOP_1_modExp_1_while_C_7,
      COMP_LOOP_1_modExp_1_while_C_8, COMP_LOOP_1_modExp_1_while_C_9, COMP_LOOP_1_modExp_1_while_C_10,
      COMP_LOOP_1_modExp_1_while_C_11, COMP_LOOP_1_modExp_1_while_C_12, COMP_LOOP_1_modExp_1_while_C_13,
      COMP_LOOP_1_modExp_1_while_C_14, COMP_LOOP_1_modExp_1_while_C_15, COMP_LOOP_1_modExp_1_while_C_16,
      COMP_LOOP_1_modExp_1_while_C_17, COMP_LOOP_1_modExp_1_while_C_18, COMP_LOOP_1_modExp_1_while_C_19,
      COMP_LOOP_1_modExp_1_while_C_20, COMP_LOOP_1_modExp_1_while_C_21, COMP_LOOP_1_modExp_1_while_C_22,
      COMP_LOOP_1_modExp_1_while_C_23, COMP_LOOP_1_modExp_1_while_C_24, COMP_LOOP_1_modExp_1_while_C_25,
      COMP_LOOP_1_modExp_1_while_C_26, COMP_LOOP_1_modExp_1_while_C_27, COMP_LOOP_1_modExp_1_while_C_28,
      COMP_LOOP_1_modExp_1_while_C_29, COMP_LOOP_1_modExp_1_while_C_30, COMP_LOOP_1_modExp_1_while_C_31,
      COMP_LOOP_1_modExp_1_while_C_32, COMP_LOOP_1_modExp_1_while_C_33, COMP_LOOP_1_modExp_1_while_C_34,
      COMP_LOOP_1_modExp_1_while_C_35, COMP_LOOP_1_modExp_1_while_C_36, COMP_LOOP_1_modExp_1_while_C_37,
      COMP_LOOP_1_modExp_1_while_C_38, COMP_LOOP_1_modExp_1_while_C_39, COMP_LOOP_1_modExp_1_while_C_40,
      COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5, COMP_LOOP_C_6,
      COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10, COMP_LOOP_C_11,
      COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15, COMP_LOOP_C_16,
      COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19, COMP_LOOP_C_20, COMP_LOOP_C_21,
      COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24, COMP_LOOP_C_25, COMP_LOOP_C_26,
      COMP_LOOP_C_27, COMP_LOOP_C_28, COMP_LOOP_C_29, COMP_LOOP_C_30, COMP_LOOP_C_31,
      COMP_LOOP_C_32, COMP_LOOP_C_33, COMP_LOOP_C_34, COMP_LOOP_C_35, COMP_LOOP_C_36,
      COMP_LOOP_C_37, COMP_LOOP_C_38, COMP_LOOP_C_39, COMP_LOOP_C_40, COMP_LOOP_C_41,
      COMP_LOOP_C_42, COMP_LOOP_C_43, COMP_LOOP_C_44, COMP_LOOP_C_45, COMP_LOOP_C_46,
      COMP_LOOP_C_47, COMP_LOOP_C_48, COMP_LOOP_C_49, COMP_LOOP_C_50, COMP_LOOP_C_51,
      COMP_LOOP_C_52, COMP_LOOP_C_53, COMP_LOOP_C_54, COMP_LOOP_C_55, COMP_LOOP_C_56,
      COMP_LOOP_C_57, COMP_LOOP_C_58, COMP_LOOP_C_59, COMP_LOOP_C_60, COMP_LOOP_C_61,
      COMP_LOOP_C_62, COMP_LOOP_C_63, COMP_LOOP_C_64, COMP_LOOP_C_65, COMP_LOOP_C_66,
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
      COMP_LOOP_2_modExp_1_while_C_39, COMP_LOOP_2_modExp_1_while_C_40, COMP_LOOP_C_67,
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
      COMP_LOOP_C_123, COMP_LOOP_C_124, COMP_LOOP_C_125, COMP_LOOP_C_126, COMP_LOOP_C_127,
      COMP_LOOP_C_128, COMP_LOOP_C_129, COMP_LOOP_C_130, COMP_LOOP_C_131, COMP_LOOP_3_modExp_1_while_C_0,
      COMP_LOOP_3_modExp_1_while_C_1, COMP_LOOP_3_modExp_1_while_C_2, COMP_LOOP_3_modExp_1_while_C_3,
      COMP_LOOP_3_modExp_1_while_C_4, COMP_LOOP_3_modExp_1_while_C_5, COMP_LOOP_3_modExp_1_while_C_6,
      COMP_LOOP_3_modExp_1_while_C_7, COMP_LOOP_3_modExp_1_while_C_8, COMP_LOOP_3_modExp_1_while_C_9,
      COMP_LOOP_3_modExp_1_while_C_10, COMP_LOOP_3_modExp_1_while_C_11, COMP_LOOP_3_modExp_1_while_C_12,
      COMP_LOOP_3_modExp_1_while_C_13, COMP_LOOP_3_modExp_1_while_C_14, COMP_LOOP_3_modExp_1_while_C_15,
      COMP_LOOP_3_modExp_1_while_C_16, COMP_LOOP_3_modExp_1_while_C_17, COMP_LOOP_3_modExp_1_while_C_18,
      COMP_LOOP_3_modExp_1_while_C_19, COMP_LOOP_3_modExp_1_while_C_20, COMP_LOOP_3_modExp_1_while_C_21,
      COMP_LOOP_3_modExp_1_while_C_22, COMP_LOOP_3_modExp_1_while_C_23, COMP_LOOP_3_modExp_1_while_C_24,
      COMP_LOOP_3_modExp_1_while_C_25, COMP_LOOP_3_modExp_1_while_C_26, COMP_LOOP_3_modExp_1_while_C_27,
      COMP_LOOP_3_modExp_1_while_C_28, COMP_LOOP_3_modExp_1_while_C_29, COMP_LOOP_3_modExp_1_while_C_30,
      COMP_LOOP_3_modExp_1_while_C_31, COMP_LOOP_3_modExp_1_while_C_32, COMP_LOOP_3_modExp_1_while_C_33,
      COMP_LOOP_3_modExp_1_while_C_34, COMP_LOOP_3_modExp_1_while_C_35, COMP_LOOP_3_modExp_1_while_C_36,
      COMP_LOOP_3_modExp_1_while_C_37, COMP_LOOP_3_modExp_1_while_C_38, COMP_LOOP_3_modExp_1_while_C_39,
      COMP_LOOP_3_modExp_1_while_C_40, COMP_LOOP_C_132, COMP_LOOP_C_133, COMP_LOOP_C_134,
      COMP_LOOP_C_135, COMP_LOOP_C_136, COMP_LOOP_C_137, COMP_LOOP_C_138, COMP_LOOP_C_139,
      COMP_LOOP_C_140, COMP_LOOP_C_141, COMP_LOOP_C_142, COMP_LOOP_C_143, COMP_LOOP_C_144,
      COMP_LOOP_C_145, COMP_LOOP_C_146, COMP_LOOP_C_147, COMP_LOOP_C_148, COMP_LOOP_C_149,
      COMP_LOOP_C_150, COMP_LOOP_C_151, COMP_LOOP_C_152, COMP_LOOP_C_153, COMP_LOOP_C_154,
      COMP_LOOP_C_155, COMP_LOOP_C_156, COMP_LOOP_C_157, COMP_LOOP_C_158, COMP_LOOP_C_159,
      COMP_LOOP_C_160, COMP_LOOP_C_161, COMP_LOOP_C_162, COMP_LOOP_C_163, COMP_LOOP_C_164,
      COMP_LOOP_C_165, COMP_LOOP_C_166, COMP_LOOP_C_167, COMP_LOOP_C_168, COMP_LOOP_C_169,
      COMP_LOOP_C_170, COMP_LOOP_C_171, COMP_LOOP_C_172, COMP_LOOP_C_173, COMP_LOOP_C_174,
      COMP_LOOP_C_175, COMP_LOOP_C_176, COMP_LOOP_C_177, COMP_LOOP_C_178, COMP_LOOP_C_179,
      COMP_LOOP_C_180, COMP_LOOP_C_181, COMP_LOOP_C_182, COMP_LOOP_C_183, COMP_LOOP_C_184,
      COMP_LOOP_C_185, COMP_LOOP_C_186, COMP_LOOP_C_187, COMP_LOOP_C_188, COMP_LOOP_C_189,
      COMP_LOOP_C_190, COMP_LOOP_C_191, COMP_LOOP_C_192, COMP_LOOP_C_193, COMP_LOOP_C_194,
      COMP_LOOP_C_195, COMP_LOOP_C_196, COMP_LOOP_4_modExp_1_while_C_0, COMP_LOOP_4_modExp_1_while_C_1,
      COMP_LOOP_4_modExp_1_while_C_2, COMP_LOOP_4_modExp_1_while_C_3, COMP_LOOP_4_modExp_1_while_C_4,
      COMP_LOOP_4_modExp_1_while_C_5, COMP_LOOP_4_modExp_1_while_C_6, COMP_LOOP_4_modExp_1_while_C_7,
      COMP_LOOP_4_modExp_1_while_C_8, COMP_LOOP_4_modExp_1_while_C_9, COMP_LOOP_4_modExp_1_while_C_10,
      COMP_LOOP_4_modExp_1_while_C_11, COMP_LOOP_4_modExp_1_while_C_12, COMP_LOOP_4_modExp_1_while_C_13,
      COMP_LOOP_4_modExp_1_while_C_14, COMP_LOOP_4_modExp_1_while_C_15, COMP_LOOP_4_modExp_1_while_C_16,
      COMP_LOOP_4_modExp_1_while_C_17, COMP_LOOP_4_modExp_1_while_C_18, COMP_LOOP_4_modExp_1_while_C_19,
      COMP_LOOP_4_modExp_1_while_C_20, COMP_LOOP_4_modExp_1_while_C_21, COMP_LOOP_4_modExp_1_while_C_22,
      COMP_LOOP_4_modExp_1_while_C_23, COMP_LOOP_4_modExp_1_while_C_24, COMP_LOOP_4_modExp_1_while_C_25,
      COMP_LOOP_4_modExp_1_while_C_26, COMP_LOOP_4_modExp_1_while_C_27, COMP_LOOP_4_modExp_1_while_C_28,
      COMP_LOOP_4_modExp_1_while_C_29, COMP_LOOP_4_modExp_1_while_C_30, COMP_LOOP_4_modExp_1_while_C_31,
      COMP_LOOP_4_modExp_1_while_C_32, COMP_LOOP_4_modExp_1_while_C_33, COMP_LOOP_4_modExp_1_while_C_34,
      COMP_LOOP_4_modExp_1_while_C_35, COMP_LOOP_4_modExp_1_while_C_36, COMP_LOOP_4_modExp_1_while_C_37,
      COMP_LOOP_4_modExp_1_while_C_38, COMP_LOOP_4_modExp_1_while_C_39, COMP_LOOP_4_modExp_1_while_C_40,
      COMP_LOOP_C_197, COMP_LOOP_C_198, COMP_LOOP_C_199, COMP_LOOP_C_200, COMP_LOOP_C_201,
      COMP_LOOP_C_202, COMP_LOOP_C_203, COMP_LOOP_C_204, COMP_LOOP_C_205, COMP_LOOP_C_206,
      COMP_LOOP_C_207, COMP_LOOP_C_208, COMP_LOOP_C_209, COMP_LOOP_C_210, COMP_LOOP_C_211,
      COMP_LOOP_C_212, COMP_LOOP_C_213, COMP_LOOP_C_214, COMP_LOOP_C_215, COMP_LOOP_C_216,
      COMP_LOOP_C_217, COMP_LOOP_C_218, COMP_LOOP_C_219, COMP_LOOP_C_220, COMP_LOOP_C_221,
      COMP_LOOP_C_222, COMP_LOOP_C_223, COMP_LOOP_C_224, COMP_LOOP_C_225, COMP_LOOP_C_226,
      COMP_LOOP_C_227, COMP_LOOP_C_228, COMP_LOOP_C_229, COMP_LOOP_C_230, COMP_LOOP_C_231,
      COMP_LOOP_C_232, COMP_LOOP_C_233, COMP_LOOP_C_234, COMP_LOOP_C_235, COMP_LOOP_C_236,
      COMP_LOOP_C_237, COMP_LOOP_C_238, COMP_LOOP_C_239, COMP_LOOP_C_240, COMP_LOOP_C_241,
      COMP_LOOP_C_242, COMP_LOOP_C_243, COMP_LOOP_C_244, COMP_LOOP_C_245, COMP_LOOP_C_246,
      COMP_LOOP_C_247, COMP_LOOP_C_248, COMP_LOOP_C_249, COMP_LOOP_C_250, COMP_LOOP_C_251,
      COMP_LOOP_C_252, COMP_LOOP_C_253, COMP_LOOP_C_254, COMP_LOOP_C_255, COMP_LOOP_C_256,
      COMP_LOOP_C_257, COMP_LOOP_C_258, COMP_LOOP_C_259, COMP_LOOP_C_260, VEC_LOOP_C_0,
      STAGE_LOOP_C_9, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_8_tr0, modExp_while_C_40_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_40_tr0, COMP_LOOP_C_65_tr0,
      COMP_LOOP_2_modExp_1_while_C_40_tr0, COMP_LOOP_C_130_tr0, COMP_LOOP_3_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_195_tr0, COMP_LOOP_4_modExp_1_while_C_40_tr0, COMP_LOOP_C_260_tr0,
      VEC_LOOP_C_0_tr0, STAGE_LOOP_C_9_tr0, state_var)
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
          state_var_NS <= COMP_LOOP_C_0;
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
        state_var_NS <= modExp_while_C_39;
      WHEN modExp_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= modExp_while_C_40;
      WHEN modExp_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        IF ( modExp_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_12;
      WHEN COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_13;
      WHEN COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_14;
      WHEN COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_15;
      WHEN COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_16;
      WHEN COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_17;
      WHEN COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_18;
      WHEN COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_19;
      WHEN COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_20;
      WHEN COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_21;
      WHEN COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_22;
      WHEN COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_23;
      WHEN COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_24;
      WHEN COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_25;
      WHEN COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_26;
      WHEN COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_27;
      WHEN COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_28;
      WHEN COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_29;
      WHEN COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_30;
      WHEN COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_31;
      WHEN COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_32;
      WHEN COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_33;
      WHEN COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_34;
      WHEN COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_35;
      WHEN COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_36;
      WHEN COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_37;
      WHEN COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_38;
      WHEN COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_39;
      WHEN COMP_LOOP_1_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_40;
      WHEN COMP_LOOP_1_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        IF ( COMP_LOOP_1_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        IF ( COMP_LOOP_C_65_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_66;
        END IF;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_12;
      WHEN COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_13;
      WHEN COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_14;
      WHEN COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_15;
      WHEN COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_16;
      WHEN COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_17;
      WHEN COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_18;
      WHEN COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_19;
      WHEN COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_20;
      WHEN COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_21;
      WHEN COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_22;
      WHEN COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_23;
      WHEN COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_24;
      WHEN COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_25;
      WHEN COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_26;
      WHEN COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_27;
      WHEN COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_28;
      WHEN COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_29;
      WHEN COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_30;
      WHEN COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_31;
      WHEN COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_32;
      WHEN COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_33;
      WHEN COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_34;
      WHEN COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_35;
      WHEN COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_36;
      WHEN COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_37;
      WHEN COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_38;
      WHEN COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_39;
      WHEN COMP_LOOP_2_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_40;
      WHEN COMP_LOOP_2_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        IF ( COMP_LOOP_2_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_67;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        IF ( COMP_LOOP_C_130_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_131;
        END IF;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
      WHEN COMP_LOOP_3_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_1;
      WHEN COMP_LOOP_3_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_2;
      WHEN COMP_LOOP_3_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_3;
      WHEN COMP_LOOP_3_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_4;
      WHEN COMP_LOOP_3_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_5;
      WHEN COMP_LOOP_3_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_6;
      WHEN COMP_LOOP_3_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_7;
      WHEN COMP_LOOP_3_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_8;
      WHEN COMP_LOOP_3_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_9;
      WHEN COMP_LOOP_3_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_10;
      WHEN COMP_LOOP_3_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_11;
      WHEN COMP_LOOP_3_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_12;
      WHEN COMP_LOOP_3_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_13;
      WHEN COMP_LOOP_3_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_14;
      WHEN COMP_LOOP_3_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_15;
      WHEN COMP_LOOP_3_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_16;
      WHEN COMP_LOOP_3_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_17;
      WHEN COMP_LOOP_3_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_18;
      WHEN COMP_LOOP_3_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_19;
      WHEN COMP_LOOP_3_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_20;
      WHEN COMP_LOOP_3_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_21;
      WHEN COMP_LOOP_3_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_22;
      WHEN COMP_LOOP_3_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_23;
      WHEN COMP_LOOP_3_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_24;
      WHEN COMP_LOOP_3_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_25;
      WHEN COMP_LOOP_3_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_26;
      WHEN COMP_LOOP_3_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_27;
      WHEN COMP_LOOP_3_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_28;
      WHEN COMP_LOOP_3_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_29;
      WHEN COMP_LOOP_3_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_30;
      WHEN COMP_LOOP_3_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_31;
      WHEN COMP_LOOP_3_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_32;
      WHEN COMP_LOOP_3_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_33;
      WHEN COMP_LOOP_3_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_34;
      WHEN COMP_LOOP_3_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_35;
      WHEN COMP_LOOP_3_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_36;
      WHEN COMP_LOOP_3_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_37;
      WHEN COMP_LOOP_3_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_38;
      WHEN COMP_LOOP_3_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_39;
      WHEN COMP_LOOP_3_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_40;
      WHEN COMP_LOOP_3_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        IF ( COMP_LOOP_3_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_132;
        ELSE
          state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001000");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001001");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001010");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001011");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001100");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001101");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001110");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001111");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010000");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010001");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010010");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010011");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010100");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010101");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010110");
        state_var_NS <= COMP_LOOP_C_169;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010111");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011000");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011001");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011010");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011011");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011100");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011101");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011110");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011111");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100000");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100001");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100010");
        state_var_NS <= COMP_LOOP_C_181;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100011");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100100");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100101");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100110");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100111");
        state_var_NS <= COMP_LOOP_C_186;
      WHEN COMP_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101000");
        state_var_NS <= COMP_LOOP_C_187;
      WHEN COMP_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101001");
        state_var_NS <= COMP_LOOP_C_188;
      WHEN COMP_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101010");
        state_var_NS <= COMP_LOOP_C_189;
      WHEN COMP_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101011");
        state_var_NS <= COMP_LOOP_C_190;
      WHEN COMP_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101100");
        state_var_NS <= COMP_LOOP_C_191;
      WHEN COMP_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101101");
        state_var_NS <= COMP_LOOP_C_192;
      WHEN COMP_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101110");
        state_var_NS <= COMP_LOOP_C_193;
      WHEN COMP_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101111");
        state_var_NS <= COMP_LOOP_C_194;
      WHEN COMP_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110000");
        state_var_NS <= COMP_LOOP_C_195;
      WHEN COMP_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110001");
        IF ( COMP_LOOP_C_195_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_196;
        END IF;
      WHEN COMP_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
      WHEN COMP_LOOP_4_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_1;
      WHEN COMP_LOOP_4_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_2;
      WHEN COMP_LOOP_4_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_3;
      WHEN COMP_LOOP_4_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_4;
      WHEN COMP_LOOP_4_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_5;
      WHEN COMP_LOOP_4_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_6;
      WHEN COMP_LOOP_4_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_7;
      WHEN COMP_LOOP_4_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_8;
      WHEN COMP_LOOP_4_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_9;
      WHEN COMP_LOOP_4_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_10;
      WHEN COMP_LOOP_4_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_11;
      WHEN COMP_LOOP_4_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_12;
      WHEN COMP_LOOP_4_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_13;
      WHEN COMP_LOOP_4_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_14;
      WHEN COMP_LOOP_4_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_15;
      WHEN COMP_LOOP_4_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_16;
      WHEN COMP_LOOP_4_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_17;
      WHEN COMP_LOOP_4_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_18;
      WHEN COMP_LOOP_4_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_19;
      WHEN COMP_LOOP_4_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_20;
      WHEN COMP_LOOP_4_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_21;
      WHEN COMP_LOOP_4_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_22;
      WHEN COMP_LOOP_4_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_23;
      WHEN COMP_LOOP_4_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_24;
      WHEN COMP_LOOP_4_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_25;
      WHEN COMP_LOOP_4_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_26;
      WHEN COMP_LOOP_4_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_27;
      WHEN COMP_LOOP_4_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_28;
      WHEN COMP_LOOP_4_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_29;
      WHEN COMP_LOOP_4_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_30;
      WHEN COMP_LOOP_4_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_31;
      WHEN COMP_LOOP_4_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_32;
      WHEN COMP_LOOP_4_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_33;
      WHEN COMP_LOOP_4_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_34;
      WHEN COMP_LOOP_4_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_35;
      WHEN COMP_LOOP_4_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_36;
      WHEN COMP_LOOP_4_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_37;
      WHEN COMP_LOOP_4_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_38;
      WHEN COMP_LOOP_4_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_39;
      WHEN COMP_LOOP_4_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_40;
      WHEN COMP_LOOP_4_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011011");
        IF ( COMP_LOOP_4_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_197;
        ELSE
          state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011100");
        state_var_NS <= COMP_LOOP_C_198;
      WHEN COMP_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011101");
        state_var_NS <= COMP_LOOP_C_199;
      WHEN COMP_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011110");
        state_var_NS <= COMP_LOOP_C_200;
      WHEN COMP_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011111");
        state_var_NS <= COMP_LOOP_C_201;
      WHEN COMP_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100000");
        state_var_NS <= COMP_LOOP_C_202;
      WHEN COMP_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100001");
        state_var_NS <= COMP_LOOP_C_203;
      WHEN COMP_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100010");
        state_var_NS <= COMP_LOOP_C_204;
      WHEN COMP_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100011");
        state_var_NS <= COMP_LOOP_C_205;
      WHEN COMP_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100100");
        state_var_NS <= COMP_LOOP_C_206;
      WHEN COMP_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100101");
        state_var_NS <= COMP_LOOP_C_207;
      WHEN COMP_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100110");
        state_var_NS <= COMP_LOOP_C_208;
      WHEN COMP_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100111");
        state_var_NS <= COMP_LOOP_C_209;
      WHEN COMP_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101000");
        state_var_NS <= COMP_LOOP_C_210;
      WHEN COMP_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101001");
        state_var_NS <= COMP_LOOP_C_211;
      WHEN COMP_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101010");
        state_var_NS <= COMP_LOOP_C_212;
      WHEN COMP_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101011");
        state_var_NS <= COMP_LOOP_C_213;
      WHEN COMP_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101100");
        state_var_NS <= COMP_LOOP_C_214;
      WHEN COMP_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101101");
        state_var_NS <= COMP_LOOP_C_215;
      WHEN COMP_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101110");
        state_var_NS <= COMP_LOOP_C_216;
      WHEN COMP_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101111");
        state_var_NS <= COMP_LOOP_C_217;
      WHEN COMP_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110000");
        state_var_NS <= COMP_LOOP_C_218;
      WHEN COMP_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110001");
        state_var_NS <= COMP_LOOP_C_219;
      WHEN COMP_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110010");
        state_var_NS <= COMP_LOOP_C_220;
      WHEN COMP_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110011");
        state_var_NS <= COMP_LOOP_C_221;
      WHEN COMP_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110100");
        state_var_NS <= COMP_LOOP_C_222;
      WHEN COMP_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110101");
        state_var_NS <= COMP_LOOP_C_223;
      WHEN COMP_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110110");
        state_var_NS <= COMP_LOOP_C_224;
      WHEN COMP_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110111");
        state_var_NS <= COMP_LOOP_C_225;
      WHEN COMP_LOOP_C_225 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111000");
        state_var_NS <= COMP_LOOP_C_226;
      WHEN COMP_LOOP_C_226 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111001");
        state_var_NS <= COMP_LOOP_C_227;
      WHEN COMP_LOOP_C_227 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111010");
        state_var_NS <= COMP_LOOP_C_228;
      WHEN COMP_LOOP_C_228 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111011");
        state_var_NS <= COMP_LOOP_C_229;
      WHEN COMP_LOOP_C_229 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111100");
        state_var_NS <= COMP_LOOP_C_230;
      WHEN COMP_LOOP_C_230 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111101");
        state_var_NS <= COMP_LOOP_C_231;
      WHEN COMP_LOOP_C_231 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111110");
        state_var_NS <= COMP_LOOP_C_232;
      WHEN COMP_LOOP_C_232 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111111");
        state_var_NS <= COMP_LOOP_C_233;
      WHEN COMP_LOOP_C_233 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000000");
        state_var_NS <= COMP_LOOP_C_234;
      WHEN COMP_LOOP_C_234 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000001");
        state_var_NS <= COMP_LOOP_C_235;
      WHEN COMP_LOOP_C_235 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000010");
        state_var_NS <= COMP_LOOP_C_236;
      WHEN COMP_LOOP_C_236 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000011");
        state_var_NS <= COMP_LOOP_C_237;
      WHEN COMP_LOOP_C_237 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000100");
        state_var_NS <= COMP_LOOP_C_238;
      WHEN COMP_LOOP_C_238 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000101");
        state_var_NS <= COMP_LOOP_C_239;
      WHEN COMP_LOOP_C_239 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000110");
        state_var_NS <= COMP_LOOP_C_240;
      WHEN COMP_LOOP_C_240 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000111");
        state_var_NS <= COMP_LOOP_C_241;
      WHEN COMP_LOOP_C_241 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001000");
        state_var_NS <= COMP_LOOP_C_242;
      WHEN COMP_LOOP_C_242 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001001");
        state_var_NS <= COMP_LOOP_C_243;
      WHEN COMP_LOOP_C_243 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001010");
        state_var_NS <= COMP_LOOP_C_244;
      WHEN COMP_LOOP_C_244 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001011");
        state_var_NS <= COMP_LOOP_C_245;
      WHEN COMP_LOOP_C_245 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001100");
        state_var_NS <= COMP_LOOP_C_246;
      WHEN COMP_LOOP_C_246 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001101");
        state_var_NS <= COMP_LOOP_C_247;
      WHEN COMP_LOOP_C_247 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001110");
        state_var_NS <= COMP_LOOP_C_248;
      WHEN COMP_LOOP_C_248 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001111");
        state_var_NS <= COMP_LOOP_C_249;
      WHEN COMP_LOOP_C_249 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010000");
        state_var_NS <= COMP_LOOP_C_250;
      WHEN COMP_LOOP_C_250 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010001");
        state_var_NS <= COMP_LOOP_C_251;
      WHEN COMP_LOOP_C_251 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010010");
        state_var_NS <= COMP_LOOP_C_252;
      WHEN COMP_LOOP_C_252 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010011");
        state_var_NS <= COMP_LOOP_C_253;
      WHEN COMP_LOOP_C_253 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010100");
        state_var_NS <= COMP_LOOP_C_254;
      WHEN COMP_LOOP_C_254 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010101");
        state_var_NS <= COMP_LOOP_C_255;
      WHEN COMP_LOOP_C_255 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010110");
        state_var_NS <= COMP_LOOP_C_256;
      WHEN COMP_LOOP_C_256 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010111");
        state_var_NS <= COMP_LOOP_C_257;
      WHEN COMP_LOOP_C_257 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011000");
        state_var_NS <= COMP_LOOP_C_258;
      WHEN COMP_LOOP_C_258 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011001");
        state_var_NS <= COMP_LOOP_C_259;
      WHEN COMP_LOOP_C_259 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011010");
        state_var_NS <= COMP_LOOP_C_260;
      WHEN COMP_LOOP_C_260 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011011");
        IF ( COMP_LOOP_C_260_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011100");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_9;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011101");
        IF ( STAGE_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011110");
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

END v37;

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

ARCHITECTURE v37 OF inPlaceNTT_DIT_core IS
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
  SIGNAL or_dcpl_2 : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL or_tmp_3 : STD_LOGIC;
  SIGNAL mux_tmp_31 : STD_LOGIC;
  SIGNAL or_tmp_32 : STD_LOGIC;
  SIGNAL nor_tmp_11 : STD_LOGIC;
  SIGNAL nor_tmp_17 : STD_LOGIC;
  SIGNAL or_tmp_51 : STD_LOGIC;
  SIGNAL and_dcpl_7 : STD_LOGIC;
  SIGNAL nor_tmp_25 : STD_LOGIC;
  SIGNAL or_tmp_58 : STD_LOGIC;
  SIGNAL or_tmp_75 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL not_tmp_126 : STD_LOGIC;
  SIGNAL nor_tmp_65 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL mux_tmp_248 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL or_tmp_268 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL not_tmp_173 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL nor_tmp_85 : STD_LOGIC;
  SIGNAL mux_tmp_272 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL mux_tmp_280 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL or_tmp_325 : STD_LOGIC;
  SIGNAL nor_tmp_100 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL mux_tmp_399 : STD_LOGIC;
  SIGNAL or_tmp_414 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL not_tmp_280 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL or_tmp_493 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL not_tmp_294 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_k_9_2_sva_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_64_false_slc_modExp_exp_0_1_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_11_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL modExp_while_and_1_rgt : STD_LOGIC;
  SIGNAL and_108_m1c : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_3_obj_ld_cse : STD_LOGIC;
  SIGNAL or_262_cse : STD_LOGIC;
  SIGNAL and_224_cse : STD_LOGIC;
  SIGNAL or_261_cse : STD_LOGIC;
  SIGNAL and_225_cse : STD_LOGIC;
  SIGNAL or_279_cse : STD_LOGIC;
  SIGNAL and_254_cse : STD_LOGIC;
  SIGNAL or_580_cse : STD_LOGIC;
  SIGNAL and_184_cse : STD_LOGIC;
  SIGNAL nor_213_cse : STD_LOGIC;
  SIGNAL or_303_cse : STD_LOGIC;
  SIGNAL and_187_cse : STD_LOGIC;
  SIGNAL or_289_cse : STD_LOGIC;
  SIGNAL modulo_result_mux_1_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_388_cse : STD_LOGIC;
  SIGNAL or_63_cse : STD_LOGIC;
  SIGNAL nor_210_cse : STD_LOGIC;
  SIGNAL nor_291_cse : STD_LOGIC;
  SIGNAL nand_62_cse : STD_LOGIC;
  SIGNAL nand_57_cse : STD_LOGIC;
  SIGNAL nand_35_cse : STD_LOGIC;
  SIGNAL nand_88_cse : STD_LOGIC;
  SIGNAL and_223_cse : STD_LOGIC;
  SIGNAL and_244_cse : STD_LOGIC;
  SIGNAL nand_29_cse : STD_LOGIC;
  SIGNAL or_69_cse : STD_LOGIC;
  SIGNAL and_260_cse : STD_LOGIC;
  SIGNAL and_173_cse : STD_LOGIC;
  SIGNAL or_607_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_2_cse : STD_LOGIC;
  SIGNAL mux_77_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_140_itm : STD_LOGIC;
  SIGNAL mux_431_itm : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL not_tmp_307 : STD_LOGIC;
  SIGNAL not_tmp_308 : STD_LOGIC;
  SIGNAL not_tmp_311 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL and_dcpl_213 : STD_LOGIC;
  SIGNAL and_dcpl_215 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_243 : STD_LOGIC;
  SIGNAL and_dcpl_247 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
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
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_slc_modExp_exp_63_1_itm : STD_LOGIC_VECTOR (62 DOWNTO
      0);
  SIGNAL COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_5_mut_mx0w5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL modExp_base_sva_mx0c1 : STD_LOGIC;
  SIGNAL modulo_qr_sva_1_mx1w1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm_mx0c0 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c2 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c3 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c4 : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL modExp_exp_sva_rsp_1 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL and_323_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_or_2_cse : STD_LOGIC;
  SIGNAL nor_350_cse : STD_LOGIC;
  SIGNAL nor_338_cse : STD_LOGIC;
  SIGNAL nor_337_cse : STD_LOGIC;
  SIGNAL nor_tmp_154 : STD_LOGIC;
  SIGNAL or_tmp_553 : STD_LOGIC;
  SIGNAL or_tmp_556 : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_mux_rgt : STD_LOGIC_VECTOR (64 DOWNTO
      0);
  SIGNAL not_tmp_395 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL nor_216_cse : STD_LOGIC;
  SIGNAL or_699_cse : STD_LOGIC;
  SIGNAL mux_536_cse : STD_LOGIC;
  SIGNAL or_685_cse : STD_LOGIC;
  SIGNAL or_554_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_21_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;
  SIGNAL z_out_5_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_7_8 : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL nor_211_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL nor_212_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL mux_224_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL mux_220_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL or_270_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL or_269_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL or_266_nl : STD_LOGIC;
  SIGNAL nand_90_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL and_93_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL nor_319_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL nor_320_nl : STD_LOGIC;
  SIGNAL mux_231_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL nand_14_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL nor_321_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL or_305_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL or_304_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL or_302_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL or_300_nl : STD_LOGIC;
  SIGNAL mux_256_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL nand_78_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL and_220_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL or_291_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_if_or_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL nor_188_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL or_399_nl : STD_LOGIC;
  SIGNAL or_397_nl : STD_LOGIC;
  SIGNAL and_192_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_189_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL modExp_1_while_and_8_nl : STD_LOGIC;
  SIGNAL modExp_1_while_and_10_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL and_216_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL or_327_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL mux_522_nl : STD_LOGIC;
  SIGNAL mux_521_nl : STD_LOGIC;
  SIGNAL mux_520_nl : STD_LOGIC;
  SIGNAL mux_519_nl : STD_LOGIC;
  SIGNAL mux_518_nl : STD_LOGIC;
  SIGNAL or_672_nl : STD_LOGIC;
  SIGNAL mux_517_nl : STD_LOGIC;
  SIGNAL mux_516_nl : STD_LOGIC;
  SIGNAL mux_515_nl : STD_LOGIC;
  SIGNAL mux_514_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL mux_513_nl : STD_LOGIC;
  SIGNAL mux_512_nl : STD_LOGIC;
  SIGNAL mux_511_nl : STD_LOGIC;
  SIGNAL mux_510_nl : STD_LOGIC;
  SIGNAL mux_509_nl : STD_LOGIC;
  SIGNAL mux_508_nl : STD_LOGIC;
  SIGNAL mux_507_nl : STD_LOGIC;
  SIGNAL mux_506_nl : STD_LOGIC;
  SIGNAL mux_505_nl : STD_LOGIC;
  SIGNAL mux_504_nl : STD_LOGIC;
  SIGNAL mux_503_nl : STD_LOGIC;
  SIGNAL mux_502_nl : STD_LOGIC;
  SIGNAL mux_501_nl : STD_LOGIC;
  SIGNAL mux_500_nl : STD_LOGIC;
  SIGNAL mux_534_nl : STD_LOGIC;
  SIGNAL mux_533_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL mux_532_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL mux_531_nl : STD_LOGIC;
  SIGNAL mux_530_nl : STD_LOGIC;
  SIGNAL or_684_nl : STD_LOGIC;
  SIGNAL or_683_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_529_nl : STD_LOGIC;
  SIGNAL or_681_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL mux_528_nl : STD_LOGIC;
  SIGNAL nand_104_nl : STD_LOGIC;
  SIGNAL mux_527_nl : STD_LOGIC;
  SIGNAL mux_526_nl : STD_LOGIC;
  SIGNAL mux_525_nl : STD_LOGIC;
  SIGNAL nand_108_nl : STD_LOGIC;
  SIGNAL nand_103_nl : STD_LOGIC;
  SIGNAL mux_524_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL or_675_nl : STD_LOGIC;
  SIGNAL mux_523_nl : STD_LOGIC;
  SIGNAL or_674_nl : STD_LOGIC;
  SIGNAL or_673_nl : STD_LOGIC;
  SIGNAL or_697_nl : STD_LOGIC;
  SIGNAL or_695_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nand_44_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL or_663_nl : STD_LOGIC;
  SIGNAL mux_537_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL nor_196_nl : STD_LOGIC;
  SIGNAL nor_197_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL and_106_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL and_191_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_185_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
  SIGNAL nor_187_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL or_414_nl : STD_LOGIC;
  SIGNAL or_413_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL nand_75_nl : STD_LOGIC;
  SIGNAL mux_378_nl : STD_LOGIC;
  SIGNAL mux_377_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL and_124_nl : STD_LOGIC;
  SIGNAL mux_381_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL mux_380_nl : STD_LOGIC;
  SIGNAL and_125_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_nl : STD_LOGIC;
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_1_mux_13_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_64_false_1_or_3_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_14_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_64_false_1_or_2_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL mux_404_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL or_456_nl : STD_LOGIC;
  SIGNAL mux_402_nl : STD_LOGIC;
  SIGNAL mux_401_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL mux_397_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL mux_395_nl : STD_LOGIC;
  SIGNAL or_454_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL mux_393_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL mux_389_nl : STD_LOGIC;
  SIGNAL or_450_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL mux_386_nl : STD_LOGIC;
  SIGNAL or_449_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL or_448_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL mux_383_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL nor_182_nl : STD_LOGIC;
  SIGNAL mux_406_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_22_nl : STD_LOGIC;
  SIGNAL and_136_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL and_177_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL and_178_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL or_469_nl : STD_LOGIC;
  SIGNAL or_468_nl : STD_LOGIC;
  SIGNAL mux_407_nl : STD_LOGIC;
  SIGNAL and_182_nl : STD_LOGIC;
  SIGNAL nor_177_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL mux_425_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL or_474_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL or_473_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_15_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL mux_432_nl : STD_LOGIC;
  SIGNAL and_176_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL nor_173_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_32_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL or_491_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL mux_450_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL mux_449_nl : STD_LOGIC;
  SIGNAL nor_162_nl : STD_LOGIC;
  SIGNAL nor_163_nl : STD_LOGIC;
  SIGNAL or_522_nl : STD_LOGIC;
  SIGNAL mux_448_nl : STD_LOGIC;
  SIGNAL or_521_nl : STD_LOGIC;
  SIGNAL nand_32_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_12_nl : STD_LOGIC;
  SIGNAL and_152_nl : STD_LOGIC;
  SIGNAL and_155_nl : STD_LOGIC;
  SIGNAL and_157_nl : STD_LOGIC;
  SIGNAL and_159_nl : STD_LOGIC;
  SIGNAL nor_316_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL or_632_nl : STD_LOGIC;
  SIGNAL or_633_nl : STD_LOGIC;
  SIGNAL mux_476_nl : STD_LOGIC;
  SIGNAL mux_475_nl : STD_LOGIC;
  SIGNAL mux_474_nl : STD_LOGIC;
  SIGNAL nor_154_nl : STD_LOGIC;
  SIGNAL and_167_nl : STD_LOGIC;
  SIGNAL mux_473_nl : STD_LOGIC;
  SIGNAL mux_472_nl : STD_LOGIC;
  SIGNAL and_168_nl : STD_LOGIC;
  SIGNAL mux_471_nl : STD_LOGIC;
  SIGNAL mux_470_nl : STD_LOGIC;
  SIGNAL mux_469_nl : STD_LOGIC;
  SIGNAL mux_468_nl : STD_LOGIC;
  SIGNAL mux_467_nl : STD_LOGIC;
  SIGNAL mux_466_nl : STD_LOGIC;
  SIGNAL and_170_nl : STD_LOGIC;
  SIGNAL mux_465_nl : STD_LOGIC;
  SIGNAL mux_464_nl : STD_LOGIC;
  SIGNAL mux_463_nl : STD_LOGIC;
  SIGNAL mux_462_nl : STD_LOGIC;
  SIGNAL mux_461_nl : STD_LOGIC;
  SIGNAL mux_460_nl : STD_LOGIC;
  SIGNAL or_552_nl : STD_LOGIC;
  SIGNAL mux_459_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL or_548_nl : STD_LOGIC;
  SIGNAL mux_458_nl : STD_LOGIC;
  SIGNAL nand_26_nl : STD_LOGIC;
  SIGNAL mux_457_nl : STD_LOGIC;
  SIGNAL or_545_nl : STD_LOGIC;
  SIGNAL or_543_nl : STD_LOGIC;
  SIGNAL mux_456_nl : STD_LOGIC;
  SIGNAL or_36_nl : STD_LOGIC;
  SIGNAL or_35_nl : STD_LOGIC;
  SIGNAL nor_276_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL and_241_nl : STD_LOGIC;
  SIGNAL or_286_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL nand_80_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL nor_207_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL or_613_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL or_308_nl : STD_LOGIC;
  SIGNAL or_307_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL or_635_nl : STD_LOGIC;
  SIGNAL nor_206_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_98_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nor_273_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nand_65_nl : STD_LOGIC;
  SIGNAL or_405_nl : STD_LOGIC;
  SIGNAL and_240_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nor_274_nl : STD_LOGIC;
  SIGNAL nor_275_nl : STD_LOGIC;
  SIGNAL nor_288_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL or_465_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL or_475_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL nor_271_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL or_489_nl : STD_LOGIC;
  SIGNAL or_488_nl : STD_LOGIC;
  SIGNAL nor_272_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL or_484_nl : STD_LOGIC;
  SIGNAL or_482_nl : STD_LOGIC;
  SIGNAL and_175_nl : STD_LOGIC;
  SIGNAL mux_481_nl : STD_LOGIC;
  SIGNAL nor_149_nl : STD_LOGIC;
  SIGNAL nor_150_nl : STD_LOGIC;
  SIGNAL nor_161_nl : STD_LOGIC;
  SIGNAL mux_480_nl : STD_LOGIC;
  SIGNAL or_564_nl : STD_LOGIC;
  SIGNAL or_562_nl : STD_LOGIC;
  SIGNAL and_166_nl : STD_LOGIC;
  SIGNAL mux_478_nl : STD_LOGIC;
  SIGNAL nor_151_nl : STD_LOGIC;
  SIGNAL nor_152_nl : STD_LOGIC;
  SIGNAL nor_153_nl : STD_LOGIC;
  SIGNAL nor_199_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL nor_170_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL or_495_nl : STD_LOGIC;
  SIGNAL or_494_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL nor_168_nl : STD_LOGIC;
  SIGNAL nor_169_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL or_500_nl : STD_LOGIC;
  SIGNAL mux_445_nl : STD_LOGIC;
  SIGNAL nor_166_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL or_506_nl : STD_LOGIC;
  SIGNAL mux_447_nl : STD_LOGIC;
  SIGNAL nor_164_nl : STD_LOGIC;
  SIGNAL nor_165_nl : STD_LOGIC;
  SIGNAL mux_446_nl : STD_LOGIC;
  SIGNAL or_514_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_62_nl : STD_LOGIC;
  SIGNAL nor_311_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL or_629_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL or_134_nl : STD_LOGIC;
  SIGNAL or_133_nl : STD_LOGIC;
  SIGNAL or_630_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nand_92_nl : STD_LOGIC;
  SIGNAL and_66_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL nor_267_nl : STD_LOGIC;
  SIGNAL nor_268_nl : STD_LOGIC;
  SIGNAL and_72_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL nor_265_nl : STD_LOGIC;
  SIGNAL nor_266_nl : STD_LOGIC;
  SIGNAL and_79_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL nor_263_nl : STD_LOGIC;
  SIGNAL nor_264_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL nand_85_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL nor_257_nl : STD_LOGIC;
  SIGNAL nor_258_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL or_625_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL or_156_nl : STD_LOGIC;
  SIGNAL or_154_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL or_627_nl : STD_LOGIC;
  SIGNAL or_628_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL or_147_nl : STD_LOGIC;
  SIGNAL or_145_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nor_252_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL and_237_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL nor_253_nl : STD_LOGIC;
  SIGNAL nor_254_nl : STD_LOGIC;
  SIGNAL nor_255_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL or_168_nl : STD_LOGIC;
  SIGNAL or_166_nl : STD_LOGIC;
  SIGNAL nor_256_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL or_164_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL or_161_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL nand_84_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL nor_246_nl : STD_LOGIC;
  SIGNAL nor_247_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL or_621_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL or_186_nl : STD_LOGIC;
  SIGNAL nand_91_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL or_622_nl : STD_LOGIC;
  SIGNAL or_623_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL or_177_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL and_282_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL and_234_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL nor_241_nl : STD_LOGIC;
  SIGNAL nor_242_nl : STD_LOGIC;
  SIGNAL and_235_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL nor_243_nl : STD_LOGIC;
  SIGNAL nor_244_nl : STD_LOGIC;
  SIGNAL nor_245_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL or_194_nl : STD_LOGIC;
  SIGNAL or_193_nl : STD_LOGIC;
  SIGNAL or_191_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL nand_83_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL nor_235_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL or_617_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL or_215_nl : STD_LOGIC;
  SIGNAL or_213_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL or_618_nl : STD_LOGIC;
  SIGNAL or_619_nl : STD_LOGIC;
  SIGNAL or_620_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_206_nl : STD_LOGIC;
  SIGNAL or_204_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL and_232_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL nor_230_nl : STD_LOGIC;
  SIGNAL nor_231_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL or_227_nl : STD_LOGIC;
  SIGNAL or_225_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL or_222_nl : STD_LOGIC;
  SIGNAL or_220_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL nand_81_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL nor_223_nl : STD_LOGIC;
  SIGNAL nor_224_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL or_614_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL nor_226_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL nand_82_nl : STD_LOGIC;
  SIGNAL or_615_nl : STD_LOGIC;
  SIGNAL or_616_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL or_236_nl : STD_LOGIC;
  SIGNAL or_234_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL and_227_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL nor_218_nl : STD_LOGIC;
  SIGNAL nor_219_nl : STD_LOGIC;
  SIGNAL and_228_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL nor_221_nl : STD_LOGIC;
  SIGNAL nor_222_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL or_251_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL mux_487_nl : STD_LOGIC;
  SIGNAL and_433_nl : STD_LOGIC;
  SIGNAL nor_346_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL or_638_nl : STD_LOGIC;
  SIGNAL or_662_nl : STD_LOGIC;
  SIGNAL and_431_nl : STD_LOGIC;
  SIGNAL mux_493_nl : STD_LOGIC;
  SIGNAL mux_492_nl : STD_LOGIC;
  SIGNAL mux_491_nl : STD_LOGIC;
  SIGNAL and_432_nl : STD_LOGIC;
  SIGNAL nor_340_nl : STD_LOGIC;
  SIGNAL nor_341_nl : STD_LOGIC;
  SIGNAL nor_342_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL mux_490_nl : STD_LOGIC;
  SIGNAL or_647_nl : STD_LOGIC;
  SIGNAL mux_489_nl : STD_LOGIC;
  SIGNAL or_646_nl : STD_LOGIC;
  SIGNAL or_645_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL modExp_while_mux1h_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_441_nl : STD_LOGIC;
  SIGNAL and_442_nl : STD_LOGIC;
  SIGNAL modExp_while_mux_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_or_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl : STD_LOGIC_VECTOR (52 DOWNTO 0);
  SIGNAL COMP_LOOP_not_104_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_24_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_and_4_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL not_1505_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl : STD_LOGIC_VECTOR (55 DOWNTO 0);
  SIGNAL COMP_LOOP_not_105_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_25_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_70_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_35_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_5_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_26_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_449_nl : STD_LOGIC;
  SIGNAL and_450_nl : STD_LOGIC;
  SIGNAL and_451_nl : STD_LOGIC;
  SIGNAL and_443_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL and_448_nl : STD_LOGIC;
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_3_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_4_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_3_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_4_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_1_mux_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_16_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_17_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_18_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_19_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_20_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_21_nl : STD_LOGIC;
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_27_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_2_nl : STD_LOGIC;
  SIGNAL mux_540_nl : STD_LOGIC;
  SIGNAL nand_113_nl : STD_LOGIC;
  SIGNAL mux_541_nl : STD_LOGIC;
  SIGNAL and_452_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL nand_114_nl : STD_LOGIC;
  SIGNAL mux_542_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nand_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_not_106_nl : STD_LOGIC;
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
      modExp_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_65_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_130_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_195_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_260_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_9_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0 :
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

  FUNCTION MUX_v_53_2_2(input_0 : STD_LOGIC_VECTOR(52 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(52 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(52 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_56_2_2(input_0 : STD_LOGIC_VECTOR(55 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(55 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(55 DOWNTO 0);

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
      modExp_while_C_40_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_40_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_65_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0,
      COMP_LOOP_2_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_130_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0,
      COMP_LOOP_3_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_195_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0,
      COMP_LOOP_4_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_260_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_9_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_8_tr0 <= NOT (z_out_1(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_65_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_130_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_195_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_4(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  or_262_cse <= (NOT (fsm_output(0))) OR (fsm_output(6));
  and_224_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_261_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_225_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_279_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  nor_213_cse <= NOT((fsm_output(6)) OR (NOT (fsm_output(8))));
  or_303_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_289_cse <= (fsm_output(8)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4)))
      OR (fsm_output(6));
  nor_210_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_223_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  nor_216_cse <= NOT((NOT (fsm_output(0))) OR (fsm_output(6)));
  or_399_nl <= (NOT (fsm_output(7))) OR (fsm_output(1)) OR (fsm_output(3)) OR (NOT
      (fsm_output(5)));
  or_397_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  mux_355_nl <= MUX_s_1_2_2(or_399_nl, or_397_nl, fsm_output(8));
  nor_188_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6)) OR mux_355_nl);
  nor_189_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (fsm_output(1)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_190_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR (fsm_output(7)) OR (fsm_output(1))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  mux_354_nl <= MUX_s_1_2_2(nor_189_nl, nor_190_nl, fsm_output(0));
  and_192_nl <= (fsm_output(4)) AND mux_354_nl;
  mux_356_nl <= MUX_s_1_2_2(nor_188_nl, and_192_nl, fsm_output(2));
  modExp_while_if_or_nl <= and_dcpl_84 OR (mux_356_nl AND modExp_exp_1_0_1_sva);
  modExp_1_while_and_8_nl <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva
      AND and_dcpl_104;
  modExp_1_while_and_10_nl <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva
      AND and_dcpl_104;
  modExp_while_if_mux1h_nl <= MUX1HOT_v_64_5_2(z_out, STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
      modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1, COMP_LOOP_1_acc_5_mut_mx0w5,
      STD_LOGIC_VECTOR'( modExp_while_if_or_nl & COMP_LOOP_nor_2_cse & modExp_1_while_and_8_nl
      & modExp_1_while_and_10_nl & and_dcpl_85));
  mux_289_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), and_223_cse);
  mux_290_nl <= MUX_s_1_2_2(mux_289_nl, mux_tmp_279, fsm_output(1));
  mux_291_nl <= MUX_s_1_2_2(mux_tmp_280, mux_290_nl, fsm_output(0));
  mux_287_nl <= MUX_s_1_2_2(nor_291_cse, mux_tmp_117, and_224_cse);
  mux_286_nl <= MUX_s_1_2_2(nor_291_cse, and_254_cse, and_224_cse);
  mux_288_nl <= MUX_s_1_2_2(mux_287_nl, mux_286_nl, fsm_output(0));
  mux_292_nl <= MUX_s_1_2_2(mux_291_nl, (NOT mux_288_nl), fsm_output(7));
  mux_285_nl <= MUX_s_1_2_2(nor_291_cse, and_244_cse, fsm_output(7));
  mux_293_nl <= MUX_s_1_2_2(mux_292_nl, mux_285_nl, fsm_output(8));
  mux_283_nl <= MUX_s_1_2_2((NOT and_260_cse), nor_tmp_25, fsm_output(7));
  mux_284_nl <= MUX_s_1_2_2(or_tmp_58, mux_283_nl, fsm_output(8));
  mux_294_nl <= MUX_s_1_2_2(mux_293_nl, (NOT mux_284_nl), fsm_output(5));
  and_216_nl <= (fsm_output(7)) AND (NOT mux_tmp_280);
  mux_277_nl <= MUX_s_1_2_2(nor_291_cse, mux_tmp_117, or_607_cse);
  or_327_nl <= and_173_cse OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_278_nl <= MUX_s_1_2_2(mux_277_nl, or_327_nl, fsm_output(7));
  mux_281_nl <= MUX_s_1_2_2(and_216_nl, mux_278_nl, fsm_output(8));
  mux_274_nl <= MUX_s_1_2_2((NOT and_260_cse), nor_tmp_11, fsm_output(7));
  or_323_nl <= (fsm_output(7)) OR (NOT nor_tmp_25);
  mux_275_nl <= MUX_s_1_2_2(mux_274_nl, or_323_nl, fsm_output(8));
  mux_282_nl <= MUX_s_1_2_2(mux_281_nl, mux_275_nl, fsm_output(5));
  mux_295_nl <= MUX_s_1_2_2(mux_294_nl, mux_282_nl, fsm_output(6));
  operator_64_false_operator_64_false_mux_rgt <= MUX_v_65_2_2(('0' & modExp_while_if_mux1h_nl),
      z_out_8, mux_295_nl);
  or_699_cse <= (NOT (fsm_output(8))) OR (fsm_output(6));
  or_685_cse <= (NOT (fsm_output(8))) OR (fsm_output(2));
  and_254_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  or_697_nl <= (fsm_output(1)) OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3)));
  or_695_nl <= (NOT (fsm_output(1))) OR (fsm_output(0)) OR (NOT (fsm_output(4)))
      OR (fsm_output(3));
  mux_536_cse <= MUX_s_1_2_2(or_697_nl, or_695_nl, fsm_output(5));
  and_108_m1c <= and_dcpl_47 AND and_dcpl_25;
  modExp_result_and_rgt <= (NOT modExp_while_and_1_rgt) AND and_108_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_1_rgt AND and_108_m1c;
  or_580_cse <= (fsm_output(2)) OR (fsm_output(4));
  and_184_cse <= (fsm_output(2)) AND (fsm_output(4));
  and_187_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  mux_388_cse <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(8));
  or_63_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  or_69_cse <= ((CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))) AND
      (fsm_output(3))) OR (fsm_output(4));
  and_260_cse <= or_261_cse AND (fsm_output(4));
  nand_35_cse <= NOT((fsm_output(1)) AND (fsm_output(7)));
  nor_162_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR
      (NOT (fsm_output(2))) OR (fsm_output(8)));
  nor_163_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(2)) OR (NOT (fsm_output(8))));
  mux_449_nl <= MUX_s_1_2_2(nor_162_nl, nor_163_nl, fsm_output(6));
  nand_23_nl <= NOT((fsm_output(5)) AND mux_449_nl);
  or_521_nl <= (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(2)) OR (NOT (fsm_output(8)));
  nand_32_nl <= NOT((fsm_output(4)) AND (fsm_output(7)) AND (fsm_output(2)) AND (NOT
      (fsm_output(8))));
  mux_448_nl <= MUX_s_1_2_2(or_521_nl, nand_32_nl, fsm_output(1));
  or_522_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_448_nl;
  mux_450_nl <= MUX_s_1_2_2(nand_23_nl, or_522_nl, fsm_output(3));
  COMP_LOOP_nor_2_cse <= NOT(mux_450_nl OR (fsm_output(0)));
  modulo_result_mux_1_cse <= MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1,
      modulo_result_rem_cmp_z(63));
  and_244_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111"));
  and_173_cse <= or_303_cse AND (fsm_output(2));
  or_554_cse <= (NOT (fsm_output(2))) OR (fsm_output(8));
  COMP_LOOP_or_2_cse <= and_dcpl_48 OR and_dcpl_60 OR and_dcpl_68 OR and_dcpl_74;
  nand_29_cse <= NOT((fsm_output(1)) AND (fsm_output(4)));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 2)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0),
      7), 10), 10));
  COMP_LOOP_1_acc_5_mut_mx0w5 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_2_lpi_4_dfm)
      + SIGNED(modulo_result_mux_1_cse), 64));
  modExp_while_and_1_rgt <= (modulo_result_rem_cmp_z(63)) AND operator_64_false_slc_modExp_exp_0_1_itm;
  modulo_qr_sva_1_mx1w1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_result_rem_cmp_z)
      + UNSIGNED(p_sva), 64));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z(63
      DOWNTO 1)), ('0' & (modExp_exp_sva_rsp_1(62 DOWNTO 1))), or_dcpl_39);
  nand_88_cse <= NOT((fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(2)) AND
      (fsm_output(3)) AND (fsm_output(4)));
  or_dcpl_2 <= (NOT exit_COMP_LOOP_1_modExp_1_while_sva) OR (z_out_1(64));
  nor_tmp <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  or_tmp_3 <= (fsm_output(8)) OR (fsm_output(6));
  or_36_nl <= (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_35_nl <= (NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_tmp_31 <= MUX_s_1_2_2(or_36_nl, or_35_nl, fsm_output(1));
  or_tmp_32 <= and_187_cse OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  nor_tmp_11 <= (CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000")))
      AND (fsm_output(4));
  or_607_cse <= and_225_cse OR (fsm_output(2));
  nor_tmp_17 <= (fsm_output(8)) AND (fsm_output(6));
  nor_291_cse <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_51 <= (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_77_cse <= MUX_s_1_2_2((fsm_output(8)), or_tmp_51, fsm_output(4));
  and_dcpl_7 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  nor_tmp_25 <= (CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))) AND
      (fsm_output(4));
  or_tmp_58 <= (fsm_output(7)) OR and_260_cse;
  or_tmp_75 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_117 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(3));
  and_dcpl_13 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"));
  nor_276_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(7)) OR (fsm_output(0))
      OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)));
  and_241_nl <= (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(2))
      AND (fsm_output(3)) AND (fsm_output(4));
  mux_139_nl <= MUX_s_1_2_2(and_241_nl, nor_tmp, fsm_output(5));
  mux_140_itm <= MUX_s_1_2_2(nor_276_nl, mux_139_nl, fsm_output(6));
  and_dcpl_23 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_24 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_25 <= and_dcpl_24 AND and_dcpl_23;
  and_dcpl_32 <= nor_tmp AND and_dcpl_13;
  and_dcpl_33 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_35 <= and_254_cse AND (fsm_output(2));
  and_dcpl_36 <= and_dcpl_35 AND and_dcpl_33;
  and_dcpl_38 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_39 <= and_dcpl_24 AND and_dcpl_38;
  and_dcpl_41 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_42 <= and_dcpl_41 AND (NOT (fsm_output(2)));
  and_dcpl_44 <= and_dcpl_42 AND and_225_cse AND and_dcpl_39;
  and_dcpl_45 <= and_dcpl_24 AND and_dcpl_13;
  and_dcpl_47 <= and_dcpl_35 AND and_dcpl_7;
  and_dcpl_48 <= and_dcpl_47 AND and_dcpl_45;
  and_dcpl_49 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_52 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("010"));
  and_dcpl_53 <= and_dcpl_52 AND nor_210_cse;
  and_dcpl_60 <= and_dcpl_53 AND and_dcpl_49 AND and_dcpl_13;
  and_dcpl_65 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_67 <= and_dcpl_42 AND and_dcpl_7;
  and_dcpl_68 <= and_dcpl_67 AND and_dcpl_65 AND and_dcpl_38;
  and_dcpl_73 <= and_dcpl_35 AND nor_210_cse;
  and_dcpl_74 <= and_dcpl_73 AND nor_tmp AND and_dcpl_23;
  nand_62_cse <= NOT((fsm_output(4)) AND (fsm_output(7)));
  not_tmp_126 <= NOT((COMP_LOOP_acc_10_cse_12_1_1_sva(1)) AND (fsm_output(7)));
  nand_57_cse <= NOT((VEC_LOOP_j_sva_11_0(1)) AND (fsm_output(7)));
  nor_tmp_65 <= (fsm_output(4)) AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(7));
  and_dcpl_84 <= and_dcpl_52 AND and_dcpl_7 AND and_dcpl_25;
  mux_tmp_232 <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), fsm_output(6));
  mux_tmp_236 <= MUX_s_1_2_2((NOT mux_tmp_232), mux_tmp_232, fsm_output(7));
  or_286_nl <= (fsm_output(2)) OR (fsm_output(4)) OR (NOT (fsm_output(6)));
  or_284_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(4))) OR (fsm_output(6));
  mux_tmp_248 <= MUX_s_1_2_2(or_286_nl, or_284_nl, fsm_output(8));
  mux_tmp_251 <= MUX_s_1_2_2(or_tmp_51, or_699_cse, fsm_output(7));
  or_tmp_268 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  nor_207_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(6)) OR nand_35_cse);
  nor_208_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(6))) OR (fsm_output(1)) OR
      (fsm_output(7)));
  mux_266_nl <= MUX_s_1_2_2(nor_207_nl, nor_208_nl, fsm_output(2));
  nand_80_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND
      mux_266_nl);
  or_308_nl <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(6)))
      OR (fsm_output(1)) OR (fsm_output(7));
  or_307_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR (NOT((fsm_output(6)) AND
      (fsm_output(1)) AND (fsm_output(7))));
  mux_265_nl <= MUX_s_1_2_2(or_308_nl, or_307_nl, fsm_output(4));
  or_613_nl <= (fsm_output(5)) OR mux_265_nl;
  mux_267_nl <= MUX_s_1_2_2(nand_80_nl, or_613_nl, fsm_output(3));
  and_dcpl_85 <= NOT(mux_267_nl OR (fsm_output(0)));
  or_635_nl <= (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(3)))
      OR (fsm_output(4));
  mux_26_nl <= MUX_s_1_2_2(nand_88_cse, or_635_nl, fsm_output(8));
  nor_205_nl <= NOT((fsm_output(5)) OR mux_26_nl);
  nor_206_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))));
  not_tmp_173 <= MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output(6));
  and_dcpl_86 <= not_tmp_173 AND (fsm_output(0));
  mux_270_nl <= MUX_s_1_2_2((fsm_output(3)), (NOT (fsm_output(3))), or_279_cse);
  nor_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(3)));
  mux_271_nl <= MUX_s_1_2_2(mux_270_nl, nor_nl, fsm_output(0));
  and_dcpl_88 <= mux_271_nl AND (NOT (fsm_output(4))) AND and_dcpl_25;
  nor_tmp_85 <= or_303_cse AND CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  and_98_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")) AND nor_tmp_85;
  mux_tmp_272 <= MUX_s_1_2_2(and_98_nl, nor_tmp, fsm_output(5));
  mux_tmp_279 <= MUX_s_1_2_2(nor_291_cse, mux_tmp_117, fsm_output(2));
  nor_202_nl <= NOT(and_223_cse OR (fsm_output(4)));
  mux_tmp_280 <= MUX_s_1_2_2(nor_202_nl, mux_tmp_279, fsm_output(1));
  and_dcpl_91 <= NOT((fsm_output(8)) OR (fsm_output(6)));
  or_tmp_325 <= (or_279_cse AND (fsm_output(3))) OR (fsm_output(4));
  nor_tmp_100 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)=STD_LOGIC_VECTOR'("111"));
  or_dcpl_39 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("01001")) OR
      or_tmp_75 OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  nand_65_nl <= NOT((fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(7)));
  or_405_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_358_nl <= MUX_s_1_2_2(nand_65_nl, or_405_nl, fsm_output(3));
  nor_273_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(5)) OR
      mux_358_nl);
  nor_274_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"))
      OR nand_35_cse);
  nor_275_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7)));
  mux_357_nl <= MUX_s_1_2_2(nor_274_nl, nor_275_nl, fsm_output(5));
  and_240_nl <= nor_213_cse AND mux_357_nl;
  mux_359_nl <= MUX_s_1_2_2(nor_273_nl, and_240_nl, fsm_output(4));
  and_dcpl_104 <= mux_359_nl AND (fsm_output(0));
  and_dcpl_105 <= and_dcpl_41 AND (fsm_output(2));
  and_dcpl_107 <= and_dcpl_105 AND and_dcpl_33 AND and_dcpl_39;
  nor_288_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(8))));
  mux_tmp_399 <= MUX_s_1_2_2(nor_288_nl, mux_77_cse, fsm_output(2));
  or_tmp_414 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")) OR (NOT((and_225_cse
      OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))) AND (fsm_output(4))));
  and_dcpl_123 <= and_dcpl_105 AND nor_210_cse AND and_dcpl_39;
  nand_36_nl <= NOT((fsm_output(7)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(2))
      AND (fsm_output(3)) AND (fsm_output(4)));
  and_179_nl <= or_607_cse AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  mux_411_nl <= MUX_s_1_2_2((NOT or_69_cse), and_179_nl, fsm_output(7));
  mux_412_nl <= MUX_s_1_2_2(nand_36_nl, mux_411_nl, fsm_output(8));
  nor_174_nl <= NOT((fsm_output(7)) OR ((and_224_cse OR (fsm_output(3))) AND (fsm_output(4))));
  or_465_nl <= (fsm_output(7)) OR nor_tmp_11;
  mux_429_nl <= MUX_s_1_2_2(nor_174_nl, or_465_nl, fsm_output(8));
  mux_tmp_430 <= MUX_s_1_2_2(mux_412_nl, mux_429_nl, fsm_output(5));
  mux_427_nl <= MUX_s_1_2_2(and_244_cse, or_tmp_32, fsm_output(7));
  or_475_nl <= (fsm_output(8)) OR mux_427_nl;
  mux_428_nl <= MUX_s_1_2_2(or_475_nl, or_tmp_414, fsm_output(5));
  mux_431_itm <= MUX_s_1_2_2(mux_tmp_430, mux_428_nl, fsm_output(6));
  and_dcpl_124 <= not_tmp_173 AND (NOT (fsm_output(0)));
  or_489_nl <= (fsm_output(1)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_488_nl <= (NOT (fsm_output(1))) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_435_nl <= MUX_s_1_2_2(or_489_nl, or_488_nl, fsm_output(3));
  nor_271_nl <= NOT((NOT (fsm_output(8))) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR mux_435_nl);
  or_484_nl <= (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(1)))
      OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  or_482_nl <= (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(1)) OR (NOT (fsm_output(5)))
      OR (fsm_output(7));
  mux_434_nl <= MUX_s_1_2_2(or_484_nl, or_482_nl, fsm_output(4));
  nor_272_nl <= NOT((fsm_output(8)) OR mux_434_nl);
  mux_436_nl <= MUX_s_1_2_2(nor_271_nl, nor_272_nl, fsm_output(2));
  and_dcpl_126 <= mux_436_nl AND (fsm_output(0));
  and_dcpl_127 <= and_dcpl_36 AND and_dcpl_45;
  and_dcpl_128 <= (fsm_output(4)) AND (NOT (fsm_output(0)));
  and_dcpl_135 <= (fsm_output(0)) AND (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0)));
  nor_149_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(1))) OR (fsm_output(7)));
  nor_150_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4)))
      OR (fsm_output(1)) OR (NOT (fsm_output(7))));
  mux_481_nl <= MUX_s_1_2_2(nor_149_nl, nor_150_nl, fsm_output(3));
  and_175_nl <= (fsm_output(8)) AND mux_481_nl;
  or_564_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(7)));
  or_562_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_480_nl <= MUX_s_1_2_2(or_564_nl, or_562_nl, fsm_output(2));
  nor_161_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(3))) OR (fsm_output(5)) OR
      mux_480_nl);
  not_tmp_280 <= MUX_s_1_2_2(and_175_nl, nor_161_nl, fsm_output(6));
  and_dcpl_138 <= (fsm_output(0)) AND (COMP_LOOP_acc_10_cse_12_1_1_sva(0));
  or_tmp_493 <= (fsm_output(2)) OR (fsm_output(8));
  and_dcpl_146 <= (fsm_output(0)) AND (NOT (fsm_output(6)));
  nor_151_nl <= NOT((fsm_output(1)) OR (NOT and_dcpl_35));
  nor_152_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0011")));
  mux_478_nl <= MUX_s_1_2_2(nor_151_nl, nor_152_nl, fsm_output(7));
  and_166_nl <= (fsm_output(8)) AND mux_478_nl;
  nor_153_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(1)))
      OR (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))));
  not_tmp_294 <= MUX_s_1_2_2(and_166_nl, nor_153_nl, fsm_output(5));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_36 AND and_dcpl_32;
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_73 AND and_dcpl_32;
  nor_199_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(7)) OR or_tmp_325);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_199_nl, mux_tmp_272, fsm_output(6));
  modExp_base_sva_mx0c1 <= and_dcpl_67 AND and_dcpl_39;
  nor_170_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(1)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  or_495_nl <= CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_494_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_440_nl <= MUX_s_1_2_2(or_495_nl, or_494_nl, fsm_output(1));
  nor_171_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR mux_440_nl);
  mux_441_nl <= MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output(2));
  tmp_2_lpi_4_dfm_mx0c0 <= mux_441_nl AND and_dcpl_128;
  nor_168_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(1)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")));
  or_501_nl <= CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_500_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_442_nl <= MUX_s_1_2_2(or_501_nl, or_500_nl, fsm_output(1));
  nor_169_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR mux_442_nl);
  mux_443_nl <= MUX_s_1_2_2(nor_168_nl, nor_169_nl, fsm_output(2));
  tmp_2_lpi_4_dfm_mx0c1 <= mux_443_nl AND and_dcpl_128;
  nor_166_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(1)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")));
  or_507_nl <= CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  or_506_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_444_nl <= MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output(1));
  nor_167_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR mux_444_nl);
  mux_445_nl <= MUX_s_1_2_2(nor_166_nl, nor_167_nl, fsm_output(2));
  tmp_2_lpi_4_dfm_mx0c2 <= mux_445_nl AND and_dcpl_128;
  nor_164_nl <= NOT((NOT (fsm_output(6))) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(1)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("11")));
  or_514_nl <= CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  nand_34_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(3)) AND (NOT (fsm_output(5))) AND (fsm_output(7)));
  mux_446_nl <= MUX_s_1_2_2(or_514_nl, nand_34_nl, fsm_output(1));
  nor_165_nl <= NOT((fsm_output(6)) OR (fsm_output(8)) OR mux_446_nl);
  mux_447_nl <= MUX_s_1_2_2(nor_164_nl, nor_165_nl, fsm_output(2));
  tmp_2_lpi_4_dfm_mx0c3 <= mux_447_nl AND and_dcpl_128;
  tmp_2_lpi_4_dfm_mx0c4 <= and_dcpl_53 AND and_dcpl_65 AND and_dcpl_23;
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  and_62_nl <= and_dcpl_53 AND and_dcpl_49 AND and_dcpl_23;
  or_134_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(8))) OR (fsm_output(4))
      OR (NOT (fsm_output(2))) OR (fsm_output(6));
  or_133_nl <= (fsm_output(1)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(4)))
      OR (fsm_output(2)) OR (NOT (fsm_output(6)));
  mux_143_nl <= MUX_s_1_2_2(or_134_nl, or_133_nl, fsm_output(5));
  or_629_nl <= (fsm_output(7)) OR mux_143_nl;
  nand_92_nl <= NOT((fsm_output(8)) AND (fsm_output(4)) AND (NOT (fsm_output(2)))
      AND (fsm_output(6)));
  mux_142_nl <= MUX_s_1_2_2(or_289_cse, nand_92_nl, fsm_output(1));
  or_630_nl <= (NOT (fsm_output(7))) OR (fsm_output(5)) OR mux_142_nl;
  mux_144_nl <= MUX_s_1_2_2(or_629_nl, or_630_nl, fsm_output(3));
  nor_311_nl <= NOT(mux_144_nl OR (fsm_output(0)));
  nor_267_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(1)) OR
      (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")))));
  nor_268_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT (fsm_output(1)))
      OR (fsm_output(2)) OR (fsm_output(3)));
  mux_145_nl <= MUX_s_1_2_2(nor_267_nl, nor_268_nl, fsm_output(6));
  and_66_nl <= mux_145_nl AND (fsm_output(4)) AND (fsm_output(7)) AND (NOT (fsm_output(8)));
  nor_265_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(3))
      OR (fsm_output(4)));
  nor_266_nl <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT and_254_cse));
  mux_146_nl <= MUX_s_1_2_2(nor_265_nl, nor_266_nl, fsm_output(6));
  and_72_nl <= mux_146_nl AND (fsm_output(2)) AND (NOT (fsm_output(7))) AND (fsm_output(8))
      AND (NOT (fsm_output(5)));
  nor_263_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(0)) OR (NOT (fsm_output(1)))
      OR (NOT (fsm_output(2))) OR (fsm_output(4)));
  nor_264_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(0))) OR (fsm_output(1)) OR
      (fsm_output(2)) OR (NOT (fsm_output(4))));
  mux_147_nl <= MUX_s_1_2_2(nor_263_nl, nor_264_nl, fsm_output(5));
  and_79_nl <= mux_147_nl AND (NOT (fsm_output(3))) AND (fsm_output(8)) AND (fsm_output(6));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_4(12
      DOWNTO 3)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      2)), (COMP_LOOP_acc_1_cse_2_sva(11 DOWNTO 2)), (COMP_LOOP_acc_11_psp_sva(10
      DOWNTO 1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 2)), STD_LOGIC_VECTOR'( and_dcpl_44
      & COMP_LOOP_or_2_cse & and_62_nl & nor_311_nl & and_66_nl & and_72_nl & and_79_nl));
  vec_rsc_0_0_i_da_d_pff <= modulo_result_mux_1_cse;
  nor_257_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(7)));
  nor_258_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(7))));
  mux_152_nl <= MUX_s_1_2_2(nor_257_nl, nor_258_nl, fsm_output(6));
  nand_85_nl <= NOT((fsm_output(8)) AND (fsm_output(1)) AND mux_152_nl);
  or_156_nl <= (VEC_LOOP_j_sva_11_0(0)) OR (fsm_output(4)) OR (VEC_LOOP_j_sva_11_0(1))
      OR (NOT (fsm_output(7)));
  or_154_nl <= (NOT (fsm_output(4))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(7)));
  mux_150_nl <= MUX_s_1_2_2(or_156_nl, or_154_nl, fsm_output(2));
  or_625_nl <= (fsm_output(1)) OR (fsm_output(6)) OR mux_150_nl;
  or_626_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(2))) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(4))) OR (fsm_output(7));
  or_627_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(7)));
  mux_149_nl <= MUX_s_1_2_2(or_626_nl, or_627_nl, fsm_output(1));
  mux_151_nl <= MUX_s_1_2_2(or_625_nl, mux_149_nl, fsm_output(8));
  mux_153_nl <= MUX_s_1_2_2(nand_85_nl, mux_151_nl, fsm_output(3));
  or_147_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(2))
      OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR nand_62_cse;
  or_145_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT
      (fsm_output(4))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(7));
  mux_148_nl <= MUX_s_1_2_2(or_147_nl, or_145_nl, fsm_output(8));
  or_628_nl <= (fsm_output(3)) OR mux_148_nl;
  mux_154_nl <= MUX_s_1_2_2(mux_153_nl, or_628_nl, fsm_output(5));
  vec_rsc_0_0_i_wea_d_pff <= NOT(mux_154_nl OR (fsm_output(0)));
  nor_252_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(6)))
      OR (fsm_output(2)) OR (NOT modExp_exp_1_0_1_sva) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(5))) OR (fsm_output(3))
      OR (NOT (fsm_output(8))));
  nor_253_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(5))) OR (fsm_output(3)) OR (NOT (fsm_output(8))));
  nor_254_nl <= NOT((NOT (fsm_output(2))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_158_nl <= MUX_s_1_2_2(nor_253_nl, nor_254_nl, fsm_output(6));
  and_237_nl <= (fsm_output(4)) AND mux_158_nl;
  or_168_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (fsm_output(5)) OR (fsm_output(3))
      OR (NOT (fsm_output(8)));
  or_166_nl <= (fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(3))
      OR (VEC_LOOP_j_sva_11_0(1)) OR (fsm_output(8));
  mux_157_nl <= MUX_s_1_2_2(or_168_nl, or_166_nl, fsm_output(4));
  nor_255_nl <= NOT((VEC_LOOP_j_sva_11_0(0)) OR mux_157_nl);
  mux_159_nl <= MUX_s_1_2_2(and_237_nl, nor_255_nl, fsm_output(0));
  mux_160_nl <= MUX_s_1_2_2(nor_252_nl, mux_159_nl, fsm_output(1));
  or_164_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR CONV_SL_1_1(z_out_4(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  or_163_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT
      (fsm_output(3))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8)));
  mux_155_nl <= MUX_s_1_2_2(or_164_nl, or_163_nl, fsm_output(4));
  or_161_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  mux_156_nl <= MUX_s_1_2_2(mux_155_nl, or_161_nl, fsm_output(0));
  nor_256_nl <= NOT((fsm_output(1)) OR mux_156_nl);
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_160_nl, nor_256_nl,
      fsm_output(7));
  nor_246_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (fsm_output(7)));
  nor_247_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (NOT (fsm_output(7))));
  mux_166_nl <= MUX_s_1_2_2(nor_246_nl, nor_247_nl, fsm_output(6));
  nand_84_nl <= NOT((fsm_output(8)) AND (fsm_output(1)) AND mux_166_nl);
  or_186_nl <= (NOT (VEC_LOOP_j_sva_11_0(0))) OR (fsm_output(4)) OR (VEC_LOOP_j_sva_11_0(1))
      OR (NOT (fsm_output(7)));
  nand_91_nl <= NOT((fsm_output(4)) AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (fsm_output(7)));
  mux_164_nl <= MUX_s_1_2_2(or_186_nl, nand_91_nl, fsm_output(2));
  or_621_nl <= (fsm_output(1)) OR (fsm_output(6)) OR mux_164_nl;
  or_622_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(2))) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (NOT (VEC_LOOP_j_sva_11_0(0))) OR (NOT (fsm_output(4))) OR (fsm_output(7));
  or_623_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(7)));
  mux_163_nl <= MUX_s_1_2_2(or_622_nl, or_623_nl, fsm_output(1));
  mux_165_nl <= MUX_s_1_2_2(or_621_nl, mux_163_nl, fsm_output(8));
  mux_167_nl <= MUX_s_1_2_2(nand_84_nl, mux_165_nl, fsm_output(3));
  or_177_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(2))
      OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR nand_62_cse;
  or_175_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT
      (fsm_output(4))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(7));
  mux_162_nl <= MUX_s_1_2_2(or_177_nl, or_175_nl, fsm_output(8));
  or_624_nl <= (fsm_output(3)) OR mux_162_nl;
  mux_168_nl <= MUX_s_1_2_2(mux_167_nl, or_624_nl, fsm_output(5));
  vec_rsc_0_1_i_wea_d_pff <= NOT(mux_168_nl OR (fsm_output(0)));
  and_282_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT
      (fsm_output(2))) AND modExp_exp_1_0_1_sva AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (fsm_output(5)) AND (NOT (fsm_output(3)))
      AND (fsm_output(8));
  nor_241_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(5))) OR (fsm_output(3)) OR (NOT (fsm_output(8))));
  nor_242_nl <= NOT((NOT (fsm_output(2))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_172_nl <= MUX_s_1_2_2(nor_241_nl, nor_242_nl, fsm_output(6));
  and_234_nl <= (fsm_output(4)) AND mux_172_nl;
  nor_243_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(2))) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (fsm_output(5)) OR (fsm_output(3))
      OR (NOT (fsm_output(8))));
  nor_244_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR
      (fsm_output(3)) OR (VEC_LOOP_j_sva_11_0(1)) OR (fsm_output(8)));
  mux_171_nl <= MUX_s_1_2_2(nor_243_nl, nor_244_nl, fsm_output(4));
  and_235_nl <= (VEC_LOOP_j_sva_11_0(0)) AND mux_171_nl;
  mux_173_nl <= MUX_s_1_2_2(and_234_nl, and_235_nl, fsm_output(0));
  mux_174_nl <= MUX_s_1_2_2(and_282_nl, mux_173_nl, fsm_output(1));
  or_194_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR CONV_SL_1_1(z_out_4(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  or_193_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT
      (fsm_output(3))) OR (z_out_4(2)) OR (NOT((z_out_4(1)) AND (fsm_output(8))));
  mux_169_nl <= MUX_s_1_2_2(or_194_nl, or_193_nl, fsm_output(4));
  or_191_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  mux_170_nl <= MUX_s_1_2_2(mux_169_nl, or_191_nl, fsm_output(0));
  nor_245_nl <= NOT((fsm_output(1)) OR mux_170_nl);
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_174_nl, nor_245_nl,
      fsm_output(7));
  nor_234_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(7)));
  nor_235_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR (COMP_LOOP_acc_1_cse_sva(0))
      OR (NOT((COMP_LOOP_acc_1_cse_sva(1)) AND (fsm_output(7)))));
  mux_180_nl <= MUX_s_1_2_2(nor_234_nl, nor_235_nl, fsm_output(6));
  nand_83_nl <= NOT((fsm_output(8)) AND (fsm_output(1)) AND mux_180_nl);
  or_215_nl <= (VEC_LOOP_j_sva_11_0(0)) OR (fsm_output(4)) OR nand_57_cse;
  or_213_nl <= (NOT (fsm_output(4))) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) OR not_tmp_126;
  mux_178_nl <= MUX_s_1_2_2(or_215_nl, or_213_nl, fsm_output(2));
  or_617_nl <= (fsm_output(1)) OR (fsm_output(6)) OR mux_178_nl;
  or_618_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(2))) OR (NOT (COMP_LOOP_acc_11_psp_sva(0)))
      OR (VEC_LOOP_j_sva_11_0(0)) OR (NOT (fsm_output(4))) OR (fsm_output(7));
  or_619_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT (fsm_output(4)))
      OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0)) OR not_tmp_126;
  mux_177_nl <= MUX_s_1_2_2(or_618_nl, or_619_nl, fsm_output(1));
  mux_179_nl <= MUX_s_1_2_2(or_617_nl, mux_177_nl, fsm_output(8));
  mux_181_nl <= MUX_s_1_2_2(nand_83_nl, mux_179_nl, fsm_output(3));
  or_206_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(2))
      OR (COMP_LOOP_acc_1_cse_2_sva(0)) OR (NOT((COMP_LOOP_acc_1_cse_2_sva(1)) AND
      (fsm_output(4)) AND (fsm_output(7))));
  or_204_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT
      (fsm_output(4))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(7));
  mux_176_nl <= MUX_s_1_2_2(or_206_nl, or_204_nl, fsm_output(8));
  or_620_nl <= (fsm_output(3)) OR mux_176_nl;
  mux_182_nl <= MUX_s_1_2_2(mux_181_nl, or_620_nl, fsm_output(5));
  vec_rsc_0_2_i_wea_d_pff <= NOT(mux_182_nl OR (fsm_output(0)));
  and_283_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT
      (fsm_output(2))) AND modExp_exp_1_0_1_sva AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND (fsm_output(5)) AND (NOT (fsm_output(3)))
      AND (fsm_output(8));
  nor_230_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(5))) OR (fsm_output(3)) OR (NOT (fsm_output(8))));
  nor_231_nl <= NOT((NOT (fsm_output(2))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_186_nl <= MUX_s_1_2_2(nor_230_nl, nor_231_nl, fsm_output(6));
  and_232_nl <= (fsm_output(4)) AND mux_186_nl;
  or_227_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (NOT (COMP_LOOP_acc_11_psp_sva(0)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (fsm_output(5)) OR (fsm_output(3))
      OR (NOT (fsm_output(8)));
  or_225_nl <= (fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(3))
      OR (NOT (VEC_LOOP_j_sva_11_0(1))) OR (fsm_output(8));
  mux_185_nl <= MUX_s_1_2_2(or_227_nl, or_225_nl, fsm_output(4));
  nor_232_nl <= NOT((VEC_LOOP_j_sva_11_0(0)) OR mux_185_nl);
  mux_187_nl <= MUX_s_1_2_2(and_232_nl, nor_232_nl, fsm_output(0));
  mux_188_nl <= MUX_s_1_2_2(and_283_nl, mux_187_nl, fsm_output(1));
  or_223_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR CONV_SL_1_1(z_out_4(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  or_222_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT
      (fsm_output(3))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(8)));
  mux_183_nl <= MUX_s_1_2_2(or_223_nl, or_222_nl, fsm_output(4));
  or_220_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  mux_184_nl <= MUX_s_1_2_2(mux_183_nl, or_220_nl, fsm_output(0));
  nor_233_nl <= NOT((fsm_output(1)) OR mux_184_nl);
  vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_188_nl, nor_233_nl,
      fsm_output(7));
  nor_223_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR (fsm_output(7)));
  nor_224_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(7)))));
  mux_194_nl <= MUX_s_1_2_2(nor_223_nl, nor_224_nl, fsm_output(6));
  nand_81_nl <= NOT((fsm_output(8)) AND (fsm_output(1)) AND mux_194_nl);
  nor_226_nl <= NOT((NOT (VEC_LOOP_j_sva_11_0(0))) OR (fsm_output(4)) OR nand_57_cse);
  mux_192_nl <= MUX_s_1_2_2(nor_226_nl, nor_tmp_65, fsm_output(2));
  or_614_nl <= (fsm_output(1)) OR (fsm_output(6)) OR (NOT mux_192_nl);
  nand_82_nl <= NOT((fsm_output(6)) AND (fsm_output(2)) AND (COMP_LOOP_acc_11_psp_sva(0))
      AND (VEC_LOOP_j_sva_11_0(0)) AND (fsm_output(4)) AND (NOT (fsm_output(7))));
  or_615_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT nor_tmp_65);
  mux_191_nl <= MUX_s_1_2_2(nand_82_nl, or_615_nl, fsm_output(1));
  mux_193_nl <= MUX_s_1_2_2(or_614_nl, mux_191_nl, fsm_output(8));
  mux_195_nl <= MUX_s_1_2_2(nand_81_nl, mux_193_nl, fsm_output(3));
  or_236_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(2))
      OR (NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(4)) AND (fsm_output(7))));
  or_234_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT
      (fsm_output(4))) OR CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(7));
  mux_190_nl <= MUX_s_1_2_2(or_236_nl, or_234_nl, fsm_output(8));
  or_616_nl <= (fsm_output(3)) OR mux_190_nl;
  mux_196_nl <= MUX_s_1_2_2(mux_195_nl, or_616_nl, fsm_output(5));
  vec_rsc_0_3_i_wea_d_pff <= NOT(mux_196_nl OR (fsm_output(0)));
  and_281_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT
      (fsm_output(2))) AND modExp_exp_1_0_1_sva AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(5)) AND (NOT (fsm_output(3)))
      AND (fsm_output(8));
  nor_218_nl <= NOT((fsm_output(2)) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11"))
      OR (NOT (fsm_output(5))) OR (fsm_output(3)) OR (NOT (fsm_output(8))));
  nor_219_nl <= NOT((NOT (fsm_output(2))) OR CONV_SL_1_1(z_out_4(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(5)) OR (NOT (fsm_output(3))) OR (fsm_output(8)));
  mux_200_nl <= MUX_s_1_2_2(nor_218_nl, nor_219_nl, fsm_output(6));
  and_227_nl <= (fsm_output(4)) AND mux_200_nl;
  nor_220_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(2))) OR (NOT (COMP_LOOP_acc_11_psp_sva(0)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (fsm_output(5)) OR (fsm_output(3))
      OR (NOT (fsm_output(8))));
  nor_221_nl <= NOT((fsm_output(6)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR
      (fsm_output(3)) OR (NOT (VEC_LOOP_j_sva_11_0(1))) OR (fsm_output(8)));
  mux_199_nl <= MUX_s_1_2_2(nor_220_nl, nor_221_nl, fsm_output(4));
  and_228_nl <= (VEC_LOOP_j_sva_11_0(0)) AND mux_199_nl;
  mux_201_nl <= MUX_s_1_2_2(and_227_nl, and_228_nl, fsm_output(0));
  mux_202_nl <= MUX_s_1_2_2(and_281_nl, mux_201_nl, fsm_output(1));
  or_251_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR CONV_SL_1_1(z_out_4(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("11")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  or_250_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(5)) OR (NOT((fsm_output(3))
      AND CONV_SL_1_1(z_out_4(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(8))));
  mux_197_nl <= MUX_s_1_2_2(or_251_nl, or_250_nl, fsm_output(4));
  or_248_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(2)))
      OR (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR (fsm_output(5)) OR (NOT (fsm_output(3)))
      OR (fsm_output(8));
  mux_198_nl <= MUX_s_1_2_2(mux_197_nl, or_248_nl, fsm_output(0));
  nor_222_nl <= NOT((fsm_output(1)) OR mux_198_nl);
  vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(mux_202_nl, nor_222_nl,
      fsm_output(7));
  and_dcpl_156 <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)=STD_LOGIC_VECTOR'("00101"));
  nor_344_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 1)/=STD_LOGIC_VECTOR'("00011011")));
  and_433_nl <= (fsm_output(5)) AND (NOT (fsm_output(7))) AND (fsm_output(4)) AND
      (fsm_output(1)) AND (fsm_output(6)) AND (NOT (fsm_output(2))) AND (fsm_output(8));
  or_638_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(2))
      OR (NOT (fsm_output(8)));
  or_662_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(6))
      OR (NOT (fsm_output(2))) OR (fsm_output(8));
  mux_nl <= MUX_s_1_2_2(or_638_nl, or_662_nl, fsm_output(7));
  nor_346_nl <= NOT((fsm_output(5)) OR mux_nl);
  mux_487_nl <= MUX_s_1_2_2(and_433_nl, nor_346_nl, fsm_output(3));
  not_tmp_307 <= MUX_s_1_2_2(nor_344_nl, mux_487_nl, fsm_output(0));
  not_tmp_308 <= NOT((fsm_output(4)) AND (fsm_output(2)));
  and_432_nl <= (fsm_output(0)) AND (fsm_output(4)) AND (fsm_output(2));
  nor_340_nl <= NOT((fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(2)));
  mux_491_nl <= MUX_s_1_2_2(and_432_nl, nor_340_nl, fsm_output(6));
  nor_341_nl <= NOT((fsm_output(0)) OR not_tmp_308);
  mux_492_nl <= MUX_s_1_2_2(mux_491_nl, nor_341_nl, fsm_output(8));
  nor_342_nl <= NOT((fsm_output(8)) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(4))
      OR (fsm_output(2)));
  mux_493_nl <= MUX_s_1_2_2(mux_492_nl, nor_342_nl, fsm_output(7));
  and_431_nl <= (NOT((fsm_output(1)) OR (NOT (fsm_output(5))))) AND mux_493_nl;
  or_647_nl <= (NOT (fsm_output(8))) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(4))
      OR (fsm_output(2));
  or_646_nl <= (NOT (fsm_output(6))) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(2));
  or_645_nl <= (fsm_output(6)) OR (fsm_output(0)) OR not_tmp_308;
  mux_489_nl <= MUX_s_1_2_2(or_646_nl, or_645_nl, fsm_output(8));
  mux_490_nl <= MUX_s_1_2_2(or_647_nl, mux_489_nl, fsm_output(7));
  nor_343_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(5)) OR mux_490_nl);
  not_tmp_311 <= MUX_s_1_2_2(and_431_nl, nor_343_nl, fsm_output(3));
  and_dcpl_175 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("000001001")));
  and_dcpl_197 <= (NOT (fsm_output(3))) AND (fsm_output(4)) AND (NOT (fsm_output(2)))
      AND (fsm_output(1)) AND (NOT (fsm_output(7)));
  and_dcpl_202 <= and_dcpl_197 AND (fsm_output(8)) AND (fsm_output(5)) AND (NOT (fsm_output(0)))
      AND (NOT (fsm_output(6)));
  and_dcpl_206 <= (fsm_output(1)) AND (NOT (fsm_output(7)));
  and_dcpl_209 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_206;
  and_dcpl_211 <= (NOT (fsm_output(0))) AND (fsm_output(6));
  and_dcpl_213 <= (NOT (fsm_output(8))) AND (NOT (fsm_output(5))) AND and_dcpl_211;
  and_dcpl_215 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  and_dcpl_218 <= (NOT (fsm_output(1))) AND (fsm_output(7));
  nor_350_cse <= NOT((fsm_output(0)) OR (fsm_output(6)));
  and_dcpl_227 <= (fsm_output(8)) AND (NOT (fsm_output(5)));
  and_dcpl_229 <= and_dcpl_215 AND and_dcpl_218;
  and_dcpl_240 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_206 AND (NOT (fsm_output(8))) AND (fsm_output(5)) AND (fsm_output(0))
      AND (NOT (fsm_output(6)));
  and_dcpl_243 <= NOT((fsm_output(8)) OR (fsm_output(5)) OR (fsm_output(0)) OR (NOT
      (fsm_output(6))));
  and_dcpl_247 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111")) AND
      and_dcpl_206 AND and_dcpl_243;
  and_dcpl_252 <= (fsm_output(3)) AND (NOT (fsm_output(4))) AND (NOT (fsm_output(2)))
      AND (NOT (fsm_output(1))) AND (fsm_output(7)) AND and_dcpl_243;
  nor_338_cse <= NOT((fsm_output(1)) OR (fsm_output(7)));
  and_dcpl_285 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("101")) AND
      nor_338_cse AND (NOT (fsm_output(8))) AND (fsm_output(5)) AND (fsm_output(0))
      AND (NOT (fsm_output(6)));
  nor_337_cse <= NOT((fsm_output(8)) OR (fsm_output(5)));
  and_dcpl_294 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("000")) AND
      nor_338_cse AND nor_337_cse AND (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_323_ssc <= (NOT (fsm_output(4))) AND (fsm_output(3)) AND (NOT (fsm_output(2)))
      AND (fsm_output(1)) AND (NOT (fsm_output(7))) AND nor_337_cse AND nor_350_cse;
  nor_tmp_154 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  or_tmp_553 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_556 <= NOT((NOT(or_303_cse AND (fsm_output(6)))) AND (fsm_output(7)));
  not_tmp_395 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11")));
  COMP_LOOP_or_21_itm <= and_dcpl_247 OR and_dcpl_252;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_140_itm = '1' ) THEN
        p_sva <= p_rsci_idat;
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((nor_291_cse AND (NOT (fsm_output(2))) AND nor_210_cse AND and_dcpl_25)
          OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), STAGE_LOOP_i_3_0_sva_2,
            STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= '0';
        modExp_exp_1_0_1_sva <= '0';
        modExp_exp_1_0_1_sva_1 <= '0';
        modExp_exp_1_7_1_sva <= '0';
        modExp_exp_1_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= and_dcpl_36 AND nor_tmp AND CONV_SL_1_1(fsm_output(6
            DOWNTO 5)=STD_LOGIC_VECTOR'("10")) AND (NOT STAGE_LOOP_acc_itm_2_1);
        modExp_exp_1_0_1_sva <= (operator_64_false_1_mux1h_nl AND (NOT(mux_383_nl
            AND nor_210_cse AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("00")))))
            OR (mux_406_nl AND (fsm_output(4)) AND (fsm_output(1)) AND (NOT (fsm_output(0))));
        modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_22_nl AND (NOT(mux_407_nl AND (fsm_output(4))
            AND (fsm_output(2)) AND (NOT (fsm_output(0))) AND and_dcpl_91))) OR mux_426_nl;
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_15_nl AND (NOT(mux_433_nl AND (fsm_output(0))));
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_32_nl AND (NOT and_dcpl_127);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_5_2(z_out, operator_64_false_acc_mut_63_0,
          COMP_LOOP_1_acc_8_itm, COMP_LOOP_1_mul_mut, COMP_LOOP_1_acc_5_mut_mx0w5,
          STD_LOGIC_VECTOR'( modulo_result_or_nl & (NOT mux_228_nl) & mux_247_nl
          & (NOT mux_264_nl) & and_dcpl_85));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_8, (operator_64_false_acc_mut_64
          & operator_64_false_acc_mut_63_0), and_dcpl_88);
      operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_88);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_203_nl, mux_tmp_272, fsm_output(6))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( mux_522_nl = '0' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_operator_64_false_mux_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_534_nl, nor_376_nl, fsm_output(5))) = '1' ) THEN
        operator_64_false_acc_mut_63_0 <= operator_64_false_operator_64_false_mux_rgt(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( ((NOT(mux_536_cse OR (fsm_output(2)) OR (fsm_output(7)) OR (NOT and_dcpl_91)))
          OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
        VEC_LOOP_j_sva_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"), (z_out_4(11
            DOWNTO 0)), VEC_LOOP_j_sva_11_0_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_k_9_2_sva_6_0 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (MUX_s_1_2_2(mux_537_nl, nor_372_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_2(6
            DOWNTO 0)), mux_305_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((operator_64_false_slc_modExp_exp_0_1_itm OR modExp_result_sva_mx0c0
          OR (NOT mux_317_nl)) AND (modExp_result_sva_mx0c0 OR modExp_result_and_rgt
          OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z, modulo_qr_sva_1_mx1w1, STD_LOGIC_VECTOR'( modExp_result_sva_mx0c0
            & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_52 AND and_dcpl_33 AND and_dcpl_25) OR modExp_base_sva_mx0c1)
          = '1' ) THEN
        modExp_base_sva <= MUX_v_64_2_2(r_sva, modulo_result_mux_1_cse, modExp_base_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_slc_modExp_exp_0_1_itm <= '0';
      ELSIF ( ((NOT(mux_536_cse OR (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(8))
          OR (fsm_output(6)))) AND or_dcpl_2) = '1' ) THEN
        operator_64_false_slc_modExp_exp_0_1_itm <= MUX_s_1_2_2((operator_66_true_div_cmp_z(0)),
            (modExp_exp_sva_rsp_1(0)), or_dcpl_39);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_2 = '1' ) THEN
        operator_64_false_slc_modExp_exp_63_1_itm <= operator_64_false_slc_modExp_exp_63_1_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_84 OR and_dcpl_107 OR and_dcpl_74) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_2(63))),
            (NOT z_out_7_8), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'( and_dcpl_84
            & and_dcpl_107 & and_dcpl_74));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_52 AND and_225_cse AND and_dcpl_25) OR mux_364_nl OR and_dcpl_85)
          = '1' ) THEN
        COMP_LOOP_1_acc_8_itm <= MUX_v_64_2_2(z_out, (z_out_8(63 DOWNTO 0)), and_dcpl_85);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("10011")) OR
          or_tmp_75 OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"))))
          = '1' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (NOT(mux_374_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= z_out_4(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_11_psp_sva <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (MUX_s_1_2_2(mux_378_nl, mux_375_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_acc_11_psp_sva <= z_out_1(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2((NOT mux_381_nl), mux_380_nl, fsm_output(6))) = '1' )
          THEN
        COMP_LOOP_acc_1_cse_sva <= z_out_5_11_0;
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
      ELSIF ( mux_431_itm = '1' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(4)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(5)), STD_LOGIC_VECTOR'( and_dcpl_123 & and_dcpl_126
            & and_dcpl_124));
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(3)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(4)), STD_LOGIC_VECTOR'( and_dcpl_123 & and_dcpl_126
            & and_dcpl_124));
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(2)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(3)), STD_LOGIC_VECTOR'( and_dcpl_123 & and_dcpl_126
            & and_dcpl_124));
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(1)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(2)), STD_LOGIC_VECTOR'( and_dcpl_123 & and_dcpl_126
            & and_dcpl_124));
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(0)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(1)), STD_LOGIC_VECTOR'( and_dcpl_123 & and_dcpl_126
            & and_dcpl_124));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (tmp_2_lpi_4_dfm_mx0c0 OR tmp_2_lpi_4_dfm_mx0c1 OR tmp_2_lpi_4_dfm_mx0c2
          OR tmp_2_lpi_4_dfm_mx0c3 OR tmp_2_lpi_4_dfm_mx0c4) = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
            vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, STD_LOGIC_VECTOR'( COMP_LOOP_or_5_nl
            & COMP_LOOP_or_6_nl & COMP_LOOP_or_7_nl & COMP_LOOP_or_8_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2((NOT mux_476_nl), mux_462_nl, fsm_output(6))) = '1' ) THEN
        COMP_LOOP_1_mul_mut <= MUX1HOT_v_64_8_2(modExp_result_sva, modulo_result_rem_cmp_z,
            modulo_qr_sva_1_mx1w1, vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d,
            vec_rsc_0_3_i_qa_d, z_out, STD_LOGIC_VECTOR'( COMP_LOOP_nor_2_cse & COMP_LOOP_or_11_nl
            & COMP_LOOP_or_12_nl & and_152_nl & and_155_nl & and_157_nl & and_159_nl
            & nor_316_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_2_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_4(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_48 OR and_dcpl_86 OR and_dcpl_60) = '1' ) THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_5_11_0(9)), z_out_7_8,
            and_dcpl_86);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_sva_rsp_1 <= STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (NOT(mux_318_nl AND and_dcpl_24 AND (NOT (fsm_output(6))))) = '1' )
          THEN
        modExp_exp_sva_rsp_1 <= operator_64_false_slc_modExp_exp_63_1_3;
      END IF;
    END IF;
  END PROCESS;
  mux_249_nl <= MUX_s_1_2_2(mux_tmp_248, or_289_cse, fsm_output(0));
  nor_211_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(7)) OR
      mux_249_nl);
  nor_212_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(7)))
      OR (fsm_output(0)) OR mux_tmp_248);
  mux_250_nl <= MUX_s_1_2_2(nor_211_nl, nor_212_nl, fsm_output(1));
  modulo_result_or_nl <= and_dcpl_84 OR and_dcpl_86 OR mux_250_nl;
  mux_222_nl <= MUX_s_1_2_2((NOT or_tmp_51), nor_tmp_17, fsm_output(0));
  mux_221_nl <= MUX_s_1_2_2(nor_tmp_17, mux_388_cse, fsm_output(0));
  mux_223_nl <= MUX_s_1_2_2(mux_222_nl, mux_221_nl, fsm_output(1));
  mux_224_nl <= MUX_s_1_2_2(mux_223_nl, mux_388_cse, fsm_output(2));
  mux_225_nl <= MUX_s_1_2_2(or_tmp_51, (NOT mux_224_nl), fsm_output(3));
  mux_226_nl <= MUX_s_1_2_2(mux_225_nl, or_699_cse, fsm_output(5));
  or_271_nl <= (NOT((fsm_output(0)) OR (NOT (fsm_output(8))))) OR (fsm_output(6));
  mux_217_nl <= MUX_s_1_2_2(or_271_nl, or_699_cse, fsm_output(1));
  mux_219_nl <= MUX_s_1_2_2((NOT mux_388_cse), mux_217_nl, and_223_cse);
  or_270_nl <= (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  or_269_nl <= (NOT (fsm_output(0))) OR (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_214_nl <= MUX_s_1_2_2(or_269_nl, (fsm_output(8)), fsm_output(1));
  mux_215_nl <= MUX_s_1_2_2(or_270_nl, mux_214_nl, fsm_output(2));
  mux_216_nl <= MUX_s_1_2_2(mux_215_nl, (fsm_output(8)), fsm_output(3));
  mux_220_nl <= MUX_s_1_2_2(mux_219_nl, mux_216_nl, fsm_output(5));
  mux_227_nl <= MUX_s_1_2_2(mux_226_nl, mux_220_nl, fsm_output(4));
  mux_209_nl <= MUX_s_1_2_2((fsm_output(8)), (fsm_output(6)), fsm_output(0));
  mux_210_nl <= MUX_s_1_2_2((NOT or_699_cse), mux_209_nl, and_224_cse);
  mux_211_nl <= MUX_s_1_2_2(mux_210_nl, or_699_cse, fsm_output(3));
  mux_212_nl <= MUX_s_1_2_2(mux_211_nl, or_tmp_51, fsm_output(5));
  or_266_nl <= and_225_cse OR (NOT (fsm_output(8))) OR (fsm_output(6));
  nand_90_nl <= NOT((fsm_output(1)) AND (fsm_output(0)) AND (NOT (fsm_output(8)))
      AND (fsm_output(6)));
  mux_206_nl <= MUX_s_1_2_2(or_266_nl, nand_90_nl, fsm_output(2));
  mux_207_nl <= MUX_s_1_2_2(or_699_cse, mux_206_nl, fsm_output(3));
  mux_204_nl <= MUX_s_1_2_2(or_tmp_51, or_262_cse, fsm_output(1));
  mux_205_nl <= MUX_s_1_2_2(mux_204_nl, (fsm_output(6)), or_261_cse);
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, mux_205_nl, fsm_output(5));
  mux_213_nl <= MUX_s_1_2_2(mux_212_nl, mux_208_nl, fsm_output(4));
  mux_228_nl <= MUX_s_1_2_2(mux_227_nl, mux_213_nl, fsm_output(7));
  and_93_nl <= (fsm_output(7)) AND or_262_cse AND (fsm_output(8));
  mux_244_nl <= MUX_s_1_2_2(nor_213_cse, and_93_nl, and_224_cse);
  nor_214_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(6))) OR (fsm_output(8)));
  mux_242_nl <= MUX_s_1_2_2(nor_214_nl, mux_tmp_232, fsm_output(7));
  mux_243_nl <= MUX_s_1_2_2(mux_242_nl, mux_tmp_236, or_279_cse);
  mux_245_nl <= MUX_s_1_2_2(mux_244_nl, mux_243_nl, fsm_output(3));
  mux_241_nl <= MUX_s_1_2_2(mux_tmp_232, (NOT or_tmp_3), fsm_output(7));
  mux_246_nl <= MUX_s_1_2_2(mux_245_nl, mux_241_nl, fsm_output(5));
  mux_235_nl <= MUX_s_1_2_2(mux_tmp_232, or_tmp_3, fsm_output(7));
  mux_237_nl <= MUX_s_1_2_2(mux_tmp_236, (NOT mux_235_nl), fsm_output(1));
  mux_233_nl <= MUX_s_1_2_2(or_tmp_3, nor_tmp_17, fsm_output(0));
  nor_319_nl <= NOT((fsm_output(7)) OR (NOT mux_233_nl));
  nor_320_nl <= NOT((fsm_output(7)) OR (NOT mux_tmp_232));
  mux_234_nl <= MUX_s_1_2_2(nor_319_nl, nor_320_nl, fsm_output(1));
  mux_238_nl <= MUX_s_1_2_2(mux_237_nl, mux_234_nl, fsm_output(2));
  mux_239_nl <= MUX_s_1_2_2(mux_tmp_236, mux_238_nl, fsm_output(3));
  nand_14_nl <= NOT((fsm_output(7)) AND (NOT(nor_216_cse OR (fsm_output(8)))));
  mux_230_nl <= MUX_s_1_2_2(or_tmp_3, nand_14_nl, fsm_output(1));
  nor_321_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(8)));
  mux_229_nl <= MUX_s_1_2_2(nor_tmp_17, nor_321_nl, fsm_output(7));
  mux_231_nl <= MUX_s_1_2_2((NOT mux_230_nl), mux_229_nl, or_261_cse);
  mux_240_nl <= MUX_s_1_2_2(mux_239_nl, mux_231_nl, fsm_output(5));
  mux_247_nl <= MUX_s_1_2_2(mux_246_nl, mux_240_nl, fsm_output(4));
  or_305_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("101"));
  mux_262_nl <= MUX_s_1_2_2(or_305_nl, or_tmp_268, fsm_output(4));
  or_304_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("110"));
  mux_259_nl <= MUX_s_1_2_2(or_304_nl, mux_tmp_251, or_303_cse);
  or_302_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("001"));
  mux_258_nl <= MUX_s_1_2_2(mux_tmp_251, or_302_nl, fsm_output(1));
  mux_260_nl <= MUX_s_1_2_2(mux_259_nl, mux_258_nl, fsm_output(4));
  or_300_nl <= nor_210_cse OR CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_257_nl <= MUX_s_1_2_2(mux_tmp_251, or_300_nl, fsm_output(4));
  mux_261_nl <= MUX_s_1_2_2(mux_260_nl, mux_257_nl, fsm_output(2));
  mux_263_nl <= MUX_s_1_2_2(mux_262_nl, mux_261_nl, fsm_output(5));
  nand_78_nl <= NOT((fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(7)) AND (NOT
      (fsm_output(8))) AND (fsm_output(6)));
  mux_254_nl <= MUX_s_1_2_2(nand_78_nl, or_tmp_268, fsm_output(4));
  nand_50_nl <= NOT((fsm_output(0)) AND (fsm_output(7)) AND (fsm_output(8)) AND (NOT
      (fsm_output(6))));
  and_220_nl <= (fsm_output(4)) AND (fsm_output(1));
  mux_253_nl <= MUX_s_1_2_2(or_tmp_268, nand_50_nl, and_220_nl);
  mux_255_nl <= MUX_s_1_2_2(mux_254_nl, mux_253_nl, fsm_output(2));
  or_291_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  mux_252_nl <= MUX_s_1_2_2(mux_tmp_251, or_291_nl, fsm_output(4));
  mux_256_nl <= MUX_s_1_2_2(mux_255_nl, mux_252_nl, fsm_output(5));
  mux_264_nl <= MUX_s_1_2_2(mux_263_nl, mux_256_nl, fsm_output(3));
  operator_64_false_1_mux_13_nl <= MUX_v_7_2_2((NOT COMP_LOOP_k_9_2_sva_6_0), (NOT
      (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 3))), and_dcpl_202);
  operator_64_false_1_or_3_nl <= (NOT(and_dcpl_197 AND (NOT (fsm_output(8))) AND
      (fsm_output(5)) AND (fsm_output(0)) AND (NOT (fsm_output(6))))) OR and_dcpl_202;
  operator_64_false_1_mux_14_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'( "0000001"), COMP_LOOP_k_9_2_sva_6_0,
      and_dcpl_202);
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & operator_64_false_1_mux_13_nl
      & operator_64_false_1_or_3_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux_14_nl
      & '1'), 8), 9), 9));
  operator_64_false_1_or_2_nl <= and_dcpl_44 OR and_dcpl_68;
  or_456_nl <= ((fsm_output(4)) AND (fsm_output(8))) OR (fsm_output(6));
  mux_401_nl <= MUX_s_1_2_2((fsm_output(8)), mux_tmp_399, fsm_output(0));
  mux_398_nl <= MUX_s_1_2_2((fsm_output(8)), or_tmp_51, and_184_cse);
  mux_400_nl <= MUX_s_1_2_2(mux_tmp_399, mux_398_nl, fsm_output(0));
  mux_402_nl <= MUX_s_1_2_2(mux_401_nl, mux_400_nl, fsm_output(1));
  mux_403_nl <= MUX_s_1_2_2(or_456_nl, mux_402_nl, fsm_output(5));
  or_454_nl <= (or_580_cse AND (fsm_output(8))) OR (fsm_output(6));
  mux_394_nl <= MUX_s_1_2_2((fsm_output(8)), or_tmp_3, or_580_cse);
  mux_395_nl <= MUX_s_1_2_2(or_454_nl, mux_394_nl, fsm_output(0));
  mux_393_nl <= MUX_s_1_2_2(or_tmp_3, (fsm_output(8)), and_184_cse);
  mux_396_nl <= MUX_s_1_2_2(mux_395_nl, mux_393_nl, fsm_output(1));
  mux_397_nl <= MUX_s_1_2_2(mux_396_nl, mux_77_cse, fsm_output(5));
  mux_404_nl <= MUX_s_1_2_2(mux_403_nl, mux_397_nl, fsm_output(3));
  or_450_nl <= and_187_cse OR (fsm_output(4));
  mux_389_nl <= MUX_s_1_2_2(mux_388_cse, or_699_cse, or_450_nl);
  mux_390_nl <= MUX_s_1_2_2(mux_389_nl, or_tmp_3, fsm_output(5));
  or_449_nl <= and_184_cse OR (NOT (fsm_output(8))) OR (fsm_output(6));
  or_448_nl <= (fsm_output(4)) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  mux_384_nl <= MUX_s_1_2_2(or_699_cse, or_tmp_3, fsm_output(4));
  mux_385_nl <= MUX_s_1_2_2(or_448_nl, mux_384_nl, fsm_output(2));
  mux_386_nl <= MUX_s_1_2_2(or_449_nl, mux_385_nl, and_225_cse);
  mux_387_nl <= MUX_s_1_2_2(mux_386_nl, or_tmp_3, fsm_output(5));
  mux_391_nl <= MUX_s_1_2_2(mux_390_nl, mux_387_nl, fsm_output(3));
  mux_405_nl <= MUX_s_1_2_2(mux_404_nl, (NOT mux_391_nl), fsm_output(7));
  operator_64_false_1_mux1h_nl <= MUX1HOT_s_1_3_2((acc_2_nl(8)), modExp_exp_1_0_1_sva_1,
      modExp_exp_1_0_1_sva, STD_LOGIC_VECTOR'( operator_64_false_1_or_2_nl & and_dcpl_104
      & mux_405_nl));
  nor_181_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(2)) OR (NOT (fsm_output(3)))
      OR (fsm_output(4)));
  nor_182_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR
      (NOT (fsm_output(4))));
  mux_383_nl <= MUX_s_1_2_2(nor_181_nl, nor_182_nl, fsm_output(5));
  nor_178_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (NOT((fsm_output(7)) AND
      (fsm_output(2)) AND (fsm_output(3)))));
  nor_179_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (fsm_output(2)) OR (fsm_output(3)));
  mux_406_nl <= MUX_s_1_2_2(nor_178_nl, nor_179_nl, fsm_output(6));
  and_178_nl <= (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(1)) AND (fsm_output(7));
  nor_175_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(3)) OR (fsm_output(1)) OR
      (fsm_output(7)));
  mux_416_nl <= MUX_s_1_2_2(and_178_nl, nor_175_nl, fsm_output(5));
  and_177_nl <= nor_213_cse AND mux_416_nl;
  or_469_nl <= (fsm_output(3)) OR nand_35_cse;
  or_468_nl <= (NOT (fsm_output(3))) OR (fsm_output(1)) OR (fsm_output(7));
  mux_415_nl <= MUX_s_1_2_2(or_469_nl, or_468_nl, fsm_output(4));
  nor_176_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(8)) OR (fsm_output(5)) OR
      mux_415_nl);
  mux_417_nl <= MUX_s_1_2_2(and_177_nl, nor_176_nl, fsm_output(2));
  and_136_nl <= mux_417_nl AND (fsm_output(0));
  COMP_LOOP_mux_22_nl <= MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      and_136_nl);
  and_182_nl <= (fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(3));
  nor_177_nl <= NOT((fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(3)));
  mux_407_nl <= MUX_s_1_2_2(and_182_nl, nor_177_nl, fsm_output(5));
  mux_423_nl <= MUX_s_1_2_2((NOT or_69_cse), and_dcpl_35, fsm_output(7));
  mux_424_nl <= MUX_s_1_2_2(nand_88_cse, mux_423_nl, fsm_output(8));
  or_474_nl <= (fsm_output(7)) OR nor_tmp_25;
  mux_422_nl <= MUX_s_1_2_2((NOT or_tmp_58), or_474_nl, fsm_output(8));
  mux_425_nl <= MUX_s_1_2_2(mux_424_nl, mux_422_nl, fsm_output(5));
  mux_418_nl <= MUX_s_1_2_2((NOT mux_tmp_279), or_63_cse, fsm_output(1));
  mux_419_nl <= MUX_s_1_2_2(or_tmp_325, mux_418_nl, fsm_output(0));
  mux_420_nl <= MUX_s_1_2_2(mux_419_nl, or_63_cse, fsm_output(7));
  or_473_nl <= (fsm_output(8)) OR mux_420_nl;
  mux_421_nl <= MUX_s_1_2_2(or_473_nl, or_tmp_414, fsm_output(5));
  mux_426_nl <= MUX_s_1_2_2(mux_425_nl, mux_421_nl, fsm_output(6));
  COMP_LOOP_mux1h_15_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(5)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0(6)), STD_LOGIC_VECTOR'( and_dcpl_123
      & and_dcpl_107 & (NOT mux_431_itm) & and_dcpl_124));
  and_176_nl <= (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(1)) AND (NOT
      (fsm_output(2))) AND and_254_cse;
  nor_172_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(1)) OR
      (fsm_output(2)) OR (fsm_output(3)) OR (NOT (fsm_output(4))));
  mux_432_nl <= MUX_s_1_2_2(and_176_nl, nor_172_nl, fsm_output(5));
  nor_173_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (NOT (fsm_output(7))) OR
      (NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(3)) OR (fsm_output(4)));
  mux_433_nl <= MUX_s_1_2_2(mux_432_nl, nor_173_nl, fsm_output(6));
  mux_437_nl <= MUX_s_1_2_2(nor_tmp_85, or_tmp_32, fsm_output(7));
  or_491_nl <= (fsm_output(8)) OR mux_437_nl;
  mux_438_nl <= MUX_s_1_2_2(or_491_nl, or_tmp_414, fsm_output(5));
  mux_439_nl <= MUX_s_1_2_2(mux_tmp_430, mux_438_nl, fsm_output(6));
  COMP_LOOP_mux1h_32_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(6)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0(0)), STD_LOGIC_VECTOR'( and_dcpl_123
      & and_dcpl_126 & (NOT mux_439_nl) & and_dcpl_124));
  nor_203_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(7)) OR (fsm_output(1))
      OR (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(4)));
  or_672_nl <= (NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))))
      OR CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  mux_517_nl <= MUX_s_1_2_2(or_tmp_553, (fsm_output(6)), and_225_cse);
  mux_518_nl <= MUX_s_1_2_2(or_672_nl, mux_517_nl, fsm_output(2));
  mux_516_nl <= MUX_s_1_2_2((fsm_output(6)), (NOT (fsm_output(7))), or_279_cse);
  mux_519_nl <= MUX_s_1_2_2(mux_518_nl, mux_516_nl, fsm_output(3));
  nor_379_nl <= NOT(nor_216_cse OR (fsm_output(7)));
  mux_514_nl <= MUX_s_1_2_2(nor_379_nl, or_tmp_553, fsm_output(1));
  mux_515_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), mux_514_nl, and_223_cse);
  mux_520_nl <= MUX_s_1_2_2(mux_519_nl, mux_515_nl, fsm_output(4));
  mux_511_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_tmp_556, fsm_output(2));
  mux_512_nl <= MUX_s_1_2_2(mux_511_nl, nor_tmp_154, fsm_output(3));
  mux_508_nl <= MUX_s_1_2_2(nor_tmp_154, (fsm_output(6)), and_225_cse);
  mux_507_nl <= MUX_s_1_2_2((fsm_output(6)), or_tmp_553, fsm_output(1));
  mux_509_nl <= MUX_s_1_2_2(mux_508_nl, mux_507_nl, fsm_output(2));
  mux_510_nl <= MUX_s_1_2_2(nor_tmp_154, mux_509_nl, fsm_output(3));
  mux_513_nl <= MUX_s_1_2_2(mux_512_nl, mux_510_nl, fsm_output(4));
  mux_521_nl <= MUX_s_1_2_2((NOT mux_520_nl), mux_513_nl, fsm_output(8));
  mux_504_nl <= MUX_s_1_2_2(or_tmp_556, nor_tmp_154, or_261_cse);
  mux_505_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), mux_504_nl, fsm_output(4));
  mux_501_nl <= MUX_s_1_2_2(or_tmp_553, nor_tmp_154, fsm_output(1));
  mux_500_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  mux_502_nl <= MUX_s_1_2_2(mux_501_nl, mux_500_nl, or_261_cse);
  mux_503_nl <= MUX_s_1_2_2(or_tmp_553, mux_502_nl, fsm_output(4));
  mux_506_nl <= MUX_s_1_2_2(mux_505_nl, mux_503_nl, fsm_output(8));
  mux_522_nl <= MUX_s_1_2_2(mux_521_nl, mux_506_nl, fsm_output(5));
  nor_373_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(0))) OR
      (fsm_output(8)) OR (fsm_output(6)) OR (fsm_output(2)));
  nor_374_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(0)))
      OR (NOT modExp_exp_1_0_1_sva) OR (fsm_output(8)) OR (NOT((fsm_output(6)) AND
      (fsm_output(2)))));
  mux_533_nl <= MUX_s_1_2_2(nor_373_nl, nor_374_nl, fsm_output(7));
  or_684_nl <= (NOT modExp_exp_1_0_1_sva) OR (fsm_output(8)) OR (NOT (fsm_output(6)))
      OR (fsm_output(2));
  mux_530_nl <= MUX_s_1_2_2(or_685_cse, or_684_nl, fsm_output(0));
  or_683_nl <= (fsm_output(0)) OR (NOT(modExp_exp_1_0_1_sva OR (NOT (fsm_output(8)))))
      OR (fsm_output(6)) OR (fsm_output(2));
  mux_531_nl <= MUX_s_1_2_2(mux_530_nl, or_683_nl, fsm_output(1));
  nor_375_nl <= NOT((fsm_output(4)) OR mux_531_nl);
  or_681_nl <= (NOT modExp_exp_1_0_1_sva) OR (NOT (fsm_output(8))) OR (fsm_output(6))
      OR (fsm_output(2));
  mux_529_nl <= MUX_s_1_2_2(or_554_cse, or_681_nl, fsm_output(0));
  and_nl <= (fsm_output(4)) AND (fsm_output(1)) AND (NOT mux_529_nl);
  mux_532_nl <= MUX_s_1_2_2(nor_375_nl, and_nl, fsm_output(7));
  mux_534_nl <= MUX_s_1_2_2(mux_533_nl, mux_532_nl, fsm_output(3));
  nand_108_nl <= NOT(or_699_cse AND (fsm_output(2)));
  mux_525_nl <= MUX_s_1_2_2(or_554_cse, nand_108_nl, modExp_exp_1_0_1_sva);
  nor_377_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(2))));
  nor_378_nl <= NOT((fsm_output(6)) OR (fsm_output(2)));
  mux_524_nl <= MUX_s_1_2_2(nor_377_nl, nor_378_nl, fsm_output(8));
  nand_103_nl <= NOT(modExp_exp_1_0_1_sva AND mux_524_nl);
  mux_526_nl <= MUX_s_1_2_2(mux_525_nl, nand_103_nl, fsm_output(0));
  or_675_nl <= (fsm_output(0)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(6)))
      OR (fsm_output(2));
  mux_527_nl <= MUX_s_1_2_2(mux_526_nl, or_675_nl, fsm_output(1));
  nand_104_nl <= NOT((fsm_output(4)) AND (NOT mux_527_nl));
  or_674_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      modExp_exp_1_0_1_sva) OR (fsm_output(8)) OR (fsm_output(6)) OR (fsm_output(2));
  or_673_nl <= (NOT (fsm_output(1))) OR (fsm_output(0)) OR (NOT (fsm_output(8)))
      OR (fsm_output(6)) OR (fsm_output(2));
  mux_523_nl <= MUX_s_1_2_2(or_674_nl, or_673_nl, fsm_output(4));
  mux_528_nl <= MUX_s_1_2_2(nand_104_nl, mux_523_nl, fsm_output(7));
  nor_376_nl <= NOT((fsm_output(3)) OR mux_528_nl);
  nand_44_nl <= NOT((fsm_output(4)) AND (fsm_output(1)) AND (NOT (fsm_output(3)))
      AND (fsm_output(5)));
  or_336_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  mux_304_nl <= MUX_s_1_2_2(nand_44_nl, or_336_nl, fsm_output(0));
  or_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")) OR mux_304_nl;
  or_663_nl <= (NOT (fsm_output(6))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(8)))
      OR (fsm_output(0)) OR (NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  mux_305_nl <= MUX_s_1_2_2(or_nl, or_663_nl, fsm_output(2));
  nor_370_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"))
      OR mux_536_cse);
  nor_371_nl <= NOT((NOT (fsm_output(7))) OR (NOT (fsm_output(8))) OR (fsm_output(5))
      OR (fsm_output(1)) OR (fsm_output(0)) OR not_tmp_395);
  mux_537_nl <= MUX_s_1_2_2(nor_370_nl, nor_371_nl, fsm_output(2));
  nor_372_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(8)))
      OR (fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(0)) OR not_tmp_395);
  nor_196_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000")));
  nor_197_nl <= NOT((fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(7))
      OR (fsm_output(8)));
  mux_315_nl <= MUX_s_1_2_2(nor_196_nl, nor_197_nl, fsm_output(3));
  mux_313_nl <= MUX_s_1_2_2(and_dcpl_24, nor_tmp, fsm_output(6));
  and_106_nl <= (fsm_output(1)) AND mux_313_nl;
  mux_314_nl <= MUX_s_1_2_2(and_106_nl, nor_tmp_100, fsm_output(0));
  and_107_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND mux_314_nl;
  mux_316_nl <= MUX_s_1_2_2(mux_315_nl, and_107_nl, fsm_output(4));
  mux_317_nl <= MUX_s_1_2_2(mux_316_nl, nor_tmp_100, fsm_output(5));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_2(7 DOWNTO 0))
      & STD_LOGIC_VECTOR'( "00")) + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)))) + SIGNED'( "0000000001"), 10));
  nor_185_nl <= NOT((fsm_output(6)) OR (fsm_output(7)) OR (NOT (fsm_output(2))) OR
      (fsm_output(8)) OR nand_29_cse);
  nor_186_nl <= NOT((NOT (fsm_output(6))) OR (fsm_output(7)) OR (fsm_output(2)) OR
      (NOT((fsm_output(8)) AND (fsm_output(1)) AND (fsm_output(4)))));
  mux_363_nl <= MUX_s_1_2_2(nor_185_nl, nor_186_nl, fsm_output(0));
  and_191_nl <= (fsm_output(5)) AND mux_363_nl;
  or_414_nl <= (fsm_output(2)) OR (NOT (fsm_output(8))) OR (fsm_output(1)) OR (fsm_output(4));
  or_413_nl <= (NOT (fsm_output(2))) OR (fsm_output(8)) OR nand_29_cse;
  mux_362_nl <= MUX_s_1_2_2(or_414_nl, or_413_nl, fsm_output(7));
  nor_187_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR
      mux_362_nl);
  mux_364_nl <= MUX_s_1_2_2(and_191_nl, nor_187_nl, fsm_output(3));
  mux_87_nl <= MUX_s_1_2_2((fsm_output(7)), or_tmp_58, fsm_output(5));
  nand_75_nl <= NOT((fsm_output(5)) AND (fsm_output(7)) AND nor_tmp_25);
  mux_374_nl <= MUX_s_1_2_2(mux_87_nl, nand_75_nl, fsm_output(6));
  mux_377_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(8));
  mux_376_nl <= MUX_s_1_2_2((NOT or_tmp_58), (fsm_output(7)), fsm_output(8));
  mux_378_nl <= MUX_s_1_2_2(mux_377_nl, mux_376_nl, fsm_output(5));
  and_124_nl <= (fsm_output(8)) AND ((fsm_output(7)) OR and_dcpl_35);
  mux_375_nl <= MUX_s_1_2_2(and_124_nl, (fsm_output(8)), fsm_output(5));
  or_442_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")) OR and_260_cse;
  mux_381_nl <= MUX_s_1_2_2(or_tmp_75, or_442_nl, fsm_output(5));
  and_125_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")) AND (and_224_cse
      OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  mux_380_nl <= MUX_s_1_2_2(and_125_nl, nor_tmp, fsm_output(5));
  COMP_LOOP_or_5_nl <= tmp_2_lpi_4_dfm_mx0c0 OR ((NOT((VEC_LOOP_j_sva_11_0(0)) OR
      (COMP_LOOP_acc_11_psp_sva(0)))) AND tmp_2_lpi_4_dfm_mx0c4);
  COMP_LOOP_or_6_nl <= tmp_2_lpi_4_dfm_mx0c1 OR ((VEC_LOOP_j_sva_11_0(0)) AND (NOT
      (COMP_LOOP_acc_11_psp_sva(0))) AND tmp_2_lpi_4_dfm_mx0c4);
  COMP_LOOP_or_7_nl <= tmp_2_lpi_4_dfm_mx0c2 OR ((COMP_LOOP_acc_11_psp_sva(0)) AND
      (NOT (VEC_LOOP_j_sva_11_0(0))) AND tmp_2_lpi_4_dfm_mx0c4);
  COMP_LOOP_or_8_nl <= tmp_2_lpi_4_dfm_mx0c3 OR ((VEC_LOOP_j_sva_11_0(0)) AND (COMP_LOOP_acc_11_psp_sva(0))
      AND tmp_2_lpi_4_dfm_mx0c4);
  COMP_LOOP_or_11_nl <= ((NOT (modulo_result_rem_cmp_z(63))) AND and_dcpl_127) OR
      (not_tmp_294 AND and_dcpl_146 AND (NOT (modulo_result_rem_cmp_z(63))));
  COMP_LOOP_or_12_nl <= ((modulo_result_rem_cmp_z(63)) AND and_dcpl_127) OR (not_tmp_294
      AND and_dcpl_146 AND (modulo_result_rem_cmp_z(63)));
  and_152_nl <= not_tmp_280 AND and_dcpl_135 AND (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(1)));
  and_155_nl <= not_tmp_280 AND and_dcpl_138 AND (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(1)));
  and_157_nl <= not_tmp_280 AND and_dcpl_135 AND (COMP_LOOP_acc_10_cse_12_1_1_sva(1));
  and_159_nl <= not_tmp_280 AND and_dcpl_138 AND (COMP_LOOP_acc_10_cse_12_1_1_sva(1));
  or_632_nl <= (fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(8)) OR mux_tmp_31;
  or_633_nl <= (NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(8)))
      OR mux_tmp_31;
  mux_32_nl <= MUX_s_1_2_2(or_632_nl, or_633_nl, fsm_output(2));
  nor_316_nl <= NOT(mux_32_nl OR (fsm_output(0)));
  nor_154_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(1)) OR (NOT (fsm_output(0)))
      OR (fsm_output(2)) OR (NOT (fsm_output(8))));
  and_167_nl <= (fsm_output(3)) AND (fsm_output(8));
  mux_474_nl <= MUX_s_1_2_2(nor_154_nl, and_167_nl, fsm_output(7));
  mux_475_nl <= MUX_s_1_2_2(mux_474_nl, (fsm_output(8)), fsm_output(5));
  and_168_nl <= (fsm_output(3)) AND (fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(8));
  mux_470_nl <= MUX_s_1_2_2((NOT or_685_cse), or_tmp_493, and_225_cse);
  mux_471_nl <= MUX_s_1_2_2((fsm_output(8)), mux_470_nl, fsm_output(3));
  mux_472_nl <= MUX_s_1_2_2(and_168_nl, mux_471_nl, fsm_output(7));
  mux_466_nl <= MUX_s_1_2_2((NOT or_685_cse), or_tmp_493, fsm_output(0));
  and_170_nl <= (fsm_output(2)) AND (fsm_output(8));
  mux_467_nl <= MUX_s_1_2_2(mux_466_nl, and_170_nl, fsm_output(1));
  mux_468_nl <= MUX_s_1_2_2(mux_467_nl, (fsm_output(8)), fsm_output(3));
  mux_463_nl <= MUX_s_1_2_2((NOT (fsm_output(8))), (fsm_output(8)), fsm_output(2));
  mux_464_nl <= MUX_s_1_2_2(mux_463_nl, or_554_cse, or_303_cse);
  mux_465_nl <= MUX_s_1_2_2(mux_464_nl, (fsm_output(8)), fsm_output(3));
  mux_469_nl <= MUX_s_1_2_2(mux_468_nl, (NOT mux_465_nl), fsm_output(7));
  mux_473_nl <= MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output(5));
  mux_476_nl <= MUX_s_1_2_2(mux_475_nl, mux_473_nl, fsm_output(4));
  or_552_nl <= (fsm_output(3)) OR and_187_cse OR (NOT (fsm_output(8)));
  or_550_nl <= (NOT(and_225_cse OR (fsm_output(2)))) OR (fsm_output(8));
  mux_459_nl <= MUX_s_1_2_2((fsm_output(8)), or_550_nl, fsm_output(3));
  mux_460_nl <= MUX_s_1_2_2(or_552_nl, mux_459_nl, fsm_output(7));
  or_548_nl <= (fsm_output(7)) OR (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"))))
      OR (fsm_output(8));
  mux_461_nl <= MUX_s_1_2_2(mux_460_nl, or_548_nl, fsm_output(5));
  or_545_nl <= and_173_cse OR (fsm_output(8));
  mux_457_nl <= MUX_s_1_2_2((fsm_output(8)), or_545_nl, fsm_output(3));
  nand_26_nl <= NOT((fsm_output(7)) AND (NOT mux_457_nl));
  mux_456_nl <= MUX_s_1_2_2(or_tmp_493, or_685_cse, and_225_cse);
  or_543_nl <= (fsm_output(7)) OR (fsm_output(3)) OR mux_456_nl;
  mux_458_nl <= MUX_s_1_2_2(nand_26_nl, or_543_nl, fsm_output(5));
  mux_462_nl <= MUX_s_1_2_2(mux_461_nl, mux_458_nl, fsm_output(4));
  mux_318_nl <= MUX_s_1_2_2(or_tmp_325, (NOT nor_tmp_25), fsm_output(5));
  and_441_nl <= and_dcpl_156 AND and_dcpl_24 AND (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_442_nl <= and_dcpl_156 AND and_dcpl_24 AND nor_350_cse;
  modExp_while_mux1h_3_nl <= MUX1HOT_v_64_4_2(modExp_base_sva, modExp_result_sva,
      COMP_LOOP_1_mul_mut, operator_64_false_acc_mut_63_0, STD_LOGIC_VECTOR'( and_441_nl
      & and_442_nl & not_tmp_307 & not_tmp_311));
  modExp_while_or_1_nl <= not_tmp_307 OR not_tmp_311;
  modExp_while_mux_1_nl <= MUX_v_64_2_2(modExp_base_sva, COMP_LOOP_1_mul_mut, modExp_while_or_1_nl);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_mux1h_3_nl)
      * UNSIGNED(modExp_while_mux_1_nl)), 64));
  COMP_LOOP_not_104_nl <= NOT and_dcpl_175;
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl <= NOT(MUX_v_53_2_2((operator_66_true_div_cmp_z(63
      DOWNTO 11)), STD_LOGIC_VECTOR'("11111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_not_104_nl));
  COMP_LOOP_mux_24_nl <= MUX_v_11_2_2((VEC_LOOP_j_sva_11_0(11 DOWNTO 1)), (NOT (operator_66_true_div_cmp_z(10
      DOWNTO 0))), and_dcpl_175);
  not_1505_nl <= NOT and_dcpl_175;
  COMP_LOOP_COMP_LOOP_and_4_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), COMP_LOOP_k_9_2_sva_6_0,
      not_1505_nl);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(and_dcpl_175 & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_2_nl
      & COMP_LOOP_mux_24_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_and_4_nl
      & '1'), 8), 65), 65));
  COMP_LOOP_not_105_nl <= NOT and_323_ssc;
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl <= NOT(MUX_v_56_2_2((operator_64_false_slc_modExp_exp_63_1_itm(62
      DOWNTO 7)), STD_LOGIC_VECTOR'("11111111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_not_105_nl));
  COMP_LOOP_mux_25_nl <= MUX_v_7_2_2(COMP_LOOP_k_9_2_sva_6_0, (NOT (operator_64_false_slc_modExp_exp_63_1_itm(6
      DOWNTO 0))), and_323_ssc);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(and_323_ssc & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_3_nl
      & COMP_LOOP_mux_25_nl) + UNSIGNED'( "0000000000000000000000000000000000000000000000000000000000000001"),
      64));
  and_449_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_206 AND (fsm_output(8)) AND (fsm_output(5)) AND nor_350_cse;
  COMP_LOOP_mux_26_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( "10"), STD_LOGIC_VECTOR'(
      "01"), and_449_nl);
  and_450_nl <= and_dcpl_215 AND and_dcpl_206 AND and_dcpl_243;
  COMP_LOOP_COMP_LOOP_nor_1_nl <= NOT(MUX_v_2_2_2(COMP_LOOP_mux_26_nl, STD_LOGIC_VECTOR'("11"),
      and_450_nl));
  and_451_nl <= and_dcpl_215 AND and_dcpl_218 AND (fsm_output(8)) AND (NOT (fsm_output(5)))
      AND nor_350_cse;
  COMP_LOOP_COMP_LOOP_or_5_nl <= MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_1_nl, STD_LOGIC_VECTOR'("11"),
      and_451_nl);
  COMP_LOOP_acc_35_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0 & COMP_LOOP_COMP_LOOP_or_5_nl),
      9), 10), 10));
  and_443_nl <= and_dcpl_209 AND (NOT (fsm_output(8))) AND (fsm_output(5)) AND (fsm_output(0))
      AND (NOT (fsm_output(6)));
  COMP_LOOP_or_27_nl <= (and_dcpl_215 AND and_dcpl_206 AND and_dcpl_213) OR (CONV_SL_1_1(fsm_output(4
      DOWNTO 2)=STD_LOGIC_VECTOR'("010")) AND and_dcpl_218 AND and_dcpl_213) OR (and_dcpl_209
      AND (fsm_output(8)) AND (fsm_output(5)) AND nor_350_cse) OR (and_dcpl_229 AND
      and_dcpl_227 AND nor_350_cse);
  and_448_nl <= and_dcpl_229 AND and_dcpl_227 AND and_dcpl_211;
  COMP_LOOP_mux1h_70_nl <= MUX1HOT_v_10_3_2(('0' & COMP_LOOP_k_9_2_sva_6_0 & STD_LOGIC_VECTOR'(
      "01")), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_35_nl), 10)),
      STAGE_LOOP_lshift_psp_sva, STD_LOGIC_VECTOR'( and_443_nl & COMP_LOOP_or_27_nl
      & and_448_nl));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0),
      12), 13) + CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux1h_70_nl), 13), 13));
  COMP_LOOP_COMP_LOOP_mux_3_nl <= MUX_v_3_2_2((VEC_LOOP_j_sva_11_0(11 DOWNTO 9)),
      STD_LOGIC_VECTOR'( "001"), COMP_LOOP_or_21_itm);
  COMP_LOOP_COMP_LOOP_mux_4_nl <= MUX_v_9_2_2((VEC_LOOP_j_sva_11_0(8 DOWNTO 0)),
      (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1))), COMP_LOOP_or_21_itm);
  COMP_LOOP_or_28_nl <= (NOT and_dcpl_240) OR and_dcpl_247 OR and_dcpl_252;
  COMP_LOOP_COMP_LOOP_or_3_nl <= (NOT and_dcpl_247) OR and_dcpl_240 OR and_dcpl_252;
  COMP_LOOP_COMP_LOOP_or_4_nl <= (NOT and_dcpl_252) OR and_dcpl_240 OR and_dcpl_247;
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_mux_3_nl
      & COMP_LOOP_COMP_LOOP_mux_4_nl & COMP_LOOP_or_28_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0
      & COMP_LOOP_COMP_LOOP_or_3_nl & COMP_LOOP_COMP_LOOP_or_4_nl & '1'), 10), 13),
      13));
  z_out_5_11_0 <= acc_4_nl(12 DOWNTO 1);
  operator_64_false_1_mux_15_nl <= MUX_s_1_2_2((NOT modExp_exp_1_7_1_sva), (NOT modExp_exp_1_1_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_16_nl <= MUX_s_1_2_2((NOT modExp_exp_1_6_1_sva), (NOT modExp_exp_1_7_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_17_nl <= MUX_s_1_2_2((NOT modExp_exp_1_5_1_sva), (NOT modExp_exp_1_6_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_18_nl <= MUX_s_1_2_2((NOT modExp_exp_1_4_1_sva), (NOT modExp_exp_1_5_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_19_nl <= MUX_s_1_2_2((NOT modExp_exp_1_3_1_sva), (NOT modExp_exp_1_4_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_20_nl <= MUX_s_1_2_2((NOT modExp_exp_1_2_1_sva), (NOT modExp_exp_1_3_1_sva),
      and_dcpl_285);
  operator_64_false_1_mux_21_nl <= MUX_s_1_2_2((NOT modExp_exp_1_1_1_sva), (NOT modExp_exp_1_2_1_sva),
      and_dcpl_285);
  operator_64_false_1_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( '1' & operator_64_false_1_mux_15_nl
      & operator_64_false_1_mux_16_nl & operator_64_false_1_mux_17_nl & operator_64_false_1_mux_18_nl
      & operator_64_false_1_mux_19_nl & operator_64_false_1_mux_20_nl & operator_64_false_1_mux_21_nl
      & (NOT modExp_exp_1_0_1_sva_1)) + UNSIGNED'( "000000001"), 9));
  z_out_7_8 <= operator_64_false_1_acc_nl(8);
  COMP_LOOP_mux_27_nl <= MUX_v_64_2_2(tmp_2_lpi_4_dfm, p_sva, and_dcpl_294);
  and_452_nl <= (fsm_output(5)) AND (fsm_output(4)) AND (fsm_output(2)) AND (NOT
      (fsm_output(8)));
  nor_383_nl <= NOT((fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(2)) OR (NOT
      (fsm_output(8))));
  mux_541_nl <= MUX_s_1_2_2(and_452_nl, nor_383_nl, fsm_output(3));
  nand_113_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"))))
      AND mux_541_nl);
  nor_384_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(4)))
      OR (fsm_output(2)) OR (NOT (fsm_output(8))));
  nor_385_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(2))) OR (fsm_output(8)));
  mux_542_nl <= MUX_s_1_2_2(nor_384_nl, nor_385_nl, fsm_output(6));
  nand_114_nl <= NOT((fsm_output(7)) AND mux_542_nl);
  mux_540_nl <= MUX_s_1_2_2(nand_113_nl, nand_114_nl, fsm_output(1));
  COMP_LOOP_COMP_LOOP_nand_2_nl <= NOT(and_dcpl_294 AND (mux_540_nl OR (fsm_output(0))));
  COMP_LOOP_not_106_nl <= NOT and_dcpl_294;
  COMP_LOOP_COMP_LOOP_nand_3_nl <= NOT(MUX_v_64_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"),
      modulo_result_mux_1_cse, COMP_LOOP_not_106_nl));
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_27_nl
      & COMP_LOOP_COMP_LOOP_nand_2_nl), 65), 66) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(COMP_LOOP_COMP_LOOP_nand_3_nl
      & '1'), 65), 66), 66));
  z_out_8 <= acc_7_nl(65 DOWNTO 1);
END v37;

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

ARCHITECTURE v37 OF inPlaceNTT_DIT IS
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

END v37;



