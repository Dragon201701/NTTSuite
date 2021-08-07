
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
--  Generated date: Wed Jun 30 21:34:05 2021
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

ARCHITECTURE v38 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_7_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v38;

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

ARCHITECTURE v38 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_6_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v38;

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

ARCHITECTURE v38 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v38;

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

ARCHITECTURE v38 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v38;

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
    STAGE_LOOP_C_9_tr0 : IN STD_LOGIC;
    modExp_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    COMP_LOOP_1_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_66_tr0 : IN STD_LOGIC;
    COMP_LOOP_2_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_132_tr0 : IN STD_LOGIC;
    COMP_LOOP_3_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_198_tr0 : IN STD_LOGIC;
    COMP_LOOP_4_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_264_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_10_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v38 OF inPlaceNTT_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIT_core_core_fsm_1
  TYPE inPlaceNTT_DIT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, STAGE_LOOP_C_1,
      STAGE_LOOP_C_2, STAGE_LOOP_C_3, STAGE_LOOP_C_4, STAGE_LOOP_C_5, STAGE_LOOP_C_6,
      STAGE_LOOP_C_7, STAGE_LOOP_C_8, STAGE_LOOP_C_9, modExp_while_C_0, modExp_while_C_1,
      modExp_while_C_2, modExp_while_C_3, modExp_while_C_4, modExp_while_C_5, modExp_while_C_6,
      modExp_while_C_7, modExp_while_C_8, modExp_while_C_9, modExp_while_C_10, modExp_while_C_11,
      modExp_while_C_12, modExp_while_C_13, modExp_while_C_14, modExp_while_C_15,
      modExp_while_C_16, modExp_while_C_17, modExp_while_C_18, modExp_while_C_19,
      modExp_while_C_20, modExp_while_C_21, modExp_while_C_22, modExp_while_C_23,
      modExp_while_C_24, modExp_while_C_25, modExp_while_C_26, modExp_while_C_27,
      modExp_while_C_28, modExp_while_C_29, modExp_while_C_30, modExp_while_C_31,
      modExp_while_C_32, modExp_while_C_33, modExp_while_C_34, modExp_while_C_35,
      modExp_while_C_36, modExp_while_C_37, modExp_while_C_38, modExp_while_C_39,
      modExp_while_C_40, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_1_modExp_1_while_C_0,
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
      COMP_LOOP_1_modExp_1_while_C_40, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4,
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
      COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_2_modExp_1_while_C_0,
      COMP_LOOP_2_modExp_1_while_C_1, COMP_LOOP_2_modExp_1_while_C_2, COMP_LOOP_2_modExp_1_while_C_3,
      COMP_LOOP_2_modExp_1_while_C_4, COMP_LOOP_2_modExp_1_while_C_5, COMP_LOOP_2_modExp_1_while_C_6,
      COMP_LOOP_2_modExp_1_while_C_7, COMP_LOOP_2_modExp_1_while_C_8, COMP_LOOP_2_modExp_1_while_C_9,
      COMP_LOOP_2_modExp_1_while_C_10, COMP_LOOP_2_modExp_1_while_C_11, COMP_LOOP_2_modExp_1_while_C_12,
      COMP_LOOP_2_modExp_1_while_C_13, COMP_LOOP_2_modExp_1_while_C_14, COMP_LOOP_2_modExp_1_while_C_15,
      COMP_LOOP_2_modExp_1_while_C_16, COMP_LOOP_2_modExp_1_while_C_17, COMP_LOOP_2_modExp_1_while_C_18,
      COMP_LOOP_2_modExp_1_while_C_19, COMP_LOOP_2_modExp_1_while_C_20, COMP_LOOP_2_modExp_1_while_C_21,
      COMP_LOOP_2_modExp_1_while_C_22, COMP_LOOP_2_modExp_1_while_C_23, COMP_LOOP_2_modExp_1_while_C_24,
      COMP_LOOP_2_modExp_1_while_C_25, COMP_LOOP_2_modExp_1_while_C_26, COMP_LOOP_2_modExp_1_while_C_27,
      COMP_LOOP_2_modExp_1_while_C_28, COMP_LOOP_2_modExp_1_while_C_29, COMP_LOOP_2_modExp_1_while_C_30,
      COMP_LOOP_2_modExp_1_while_C_31, COMP_LOOP_2_modExp_1_while_C_32, COMP_LOOP_2_modExp_1_while_C_33,
      COMP_LOOP_2_modExp_1_while_C_34, COMP_LOOP_2_modExp_1_while_C_35, COMP_LOOP_2_modExp_1_while_C_36,
      COMP_LOOP_2_modExp_1_while_C_37, COMP_LOOP_2_modExp_1_while_C_38, COMP_LOOP_2_modExp_1_while_C_39,
      COMP_LOOP_2_modExp_1_while_C_40, COMP_LOOP_C_68, COMP_LOOP_C_69, COMP_LOOP_C_70,
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
      COMP_LOOP_C_131, COMP_LOOP_C_132, COMP_LOOP_C_133, COMP_LOOP_3_modExp_1_while_C_0,
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
      COMP_LOOP_3_modExp_1_while_C_40, COMP_LOOP_C_134, COMP_LOOP_C_135, COMP_LOOP_C_136,
      COMP_LOOP_C_137, COMP_LOOP_C_138, COMP_LOOP_C_139, COMP_LOOP_C_140, COMP_LOOP_C_141,
      COMP_LOOP_C_142, COMP_LOOP_C_143, COMP_LOOP_C_144, COMP_LOOP_C_145, COMP_LOOP_C_146,
      COMP_LOOP_C_147, COMP_LOOP_C_148, COMP_LOOP_C_149, COMP_LOOP_C_150, COMP_LOOP_C_151,
      COMP_LOOP_C_152, COMP_LOOP_C_153, COMP_LOOP_C_154, COMP_LOOP_C_155, COMP_LOOP_C_156,
      COMP_LOOP_C_157, COMP_LOOP_C_158, COMP_LOOP_C_159, COMP_LOOP_C_160, COMP_LOOP_C_161,
      COMP_LOOP_C_162, COMP_LOOP_C_163, COMP_LOOP_C_164, COMP_LOOP_C_165, COMP_LOOP_C_166,
      COMP_LOOP_C_167, COMP_LOOP_C_168, COMP_LOOP_C_169, COMP_LOOP_C_170, COMP_LOOP_C_171,
      COMP_LOOP_C_172, COMP_LOOP_C_173, COMP_LOOP_C_174, COMP_LOOP_C_175, COMP_LOOP_C_176,
      COMP_LOOP_C_177, COMP_LOOP_C_178, COMP_LOOP_C_179, COMP_LOOP_C_180, COMP_LOOP_C_181,
      COMP_LOOP_C_182, COMP_LOOP_C_183, COMP_LOOP_C_184, COMP_LOOP_C_185, COMP_LOOP_C_186,
      COMP_LOOP_C_187, COMP_LOOP_C_188, COMP_LOOP_C_189, COMP_LOOP_C_190, COMP_LOOP_C_191,
      COMP_LOOP_C_192, COMP_LOOP_C_193, COMP_LOOP_C_194, COMP_LOOP_C_195, COMP_LOOP_C_196,
      COMP_LOOP_C_197, COMP_LOOP_C_198, COMP_LOOP_C_199, COMP_LOOP_4_modExp_1_while_C_0,
      COMP_LOOP_4_modExp_1_while_C_1, COMP_LOOP_4_modExp_1_while_C_2, COMP_LOOP_4_modExp_1_while_C_3,
      COMP_LOOP_4_modExp_1_while_C_4, COMP_LOOP_4_modExp_1_while_C_5, COMP_LOOP_4_modExp_1_while_C_6,
      COMP_LOOP_4_modExp_1_while_C_7, COMP_LOOP_4_modExp_1_while_C_8, COMP_LOOP_4_modExp_1_while_C_9,
      COMP_LOOP_4_modExp_1_while_C_10, COMP_LOOP_4_modExp_1_while_C_11, COMP_LOOP_4_modExp_1_while_C_12,
      COMP_LOOP_4_modExp_1_while_C_13, COMP_LOOP_4_modExp_1_while_C_14, COMP_LOOP_4_modExp_1_while_C_15,
      COMP_LOOP_4_modExp_1_while_C_16, COMP_LOOP_4_modExp_1_while_C_17, COMP_LOOP_4_modExp_1_while_C_18,
      COMP_LOOP_4_modExp_1_while_C_19, COMP_LOOP_4_modExp_1_while_C_20, COMP_LOOP_4_modExp_1_while_C_21,
      COMP_LOOP_4_modExp_1_while_C_22, COMP_LOOP_4_modExp_1_while_C_23, COMP_LOOP_4_modExp_1_while_C_24,
      COMP_LOOP_4_modExp_1_while_C_25, COMP_LOOP_4_modExp_1_while_C_26, COMP_LOOP_4_modExp_1_while_C_27,
      COMP_LOOP_4_modExp_1_while_C_28, COMP_LOOP_4_modExp_1_while_C_29, COMP_LOOP_4_modExp_1_while_C_30,
      COMP_LOOP_4_modExp_1_while_C_31, COMP_LOOP_4_modExp_1_while_C_32, COMP_LOOP_4_modExp_1_while_C_33,
      COMP_LOOP_4_modExp_1_while_C_34, COMP_LOOP_4_modExp_1_while_C_35, COMP_LOOP_4_modExp_1_while_C_36,
      COMP_LOOP_4_modExp_1_while_C_37, COMP_LOOP_4_modExp_1_while_C_38, COMP_LOOP_4_modExp_1_while_C_39,
      COMP_LOOP_4_modExp_1_while_C_40, COMP_LOOP_C_200, COMP_LOOP_C_201, COMP_LOOP_C_202,
      COMP_LOOP_C_203, COMP_LOOP_C_204, COMP_LOOP_C_205, COMP_LOOP_C_206, COMP_LOOP_C_207,
      COMP_LOOP_C_208, COMP_LOOP_C_209, COMP_LOOP_C_210, COMP_LOOP_C_211, COMP_LOOP_C_212,
      COMP_LOOP_C_213, COMP_LOOP_C_214, COMP_LOOP_C_215, COMP_LOOP_C_216, COMP_LOOP_C_217,
      COMP_LOOP_C_218, COMP_LOOP_C_219, COMP_LOOP_C_220, COMP_LOOP_C_221, COMP_LOOP_C_222,
      COMP_LOOP_C_223, COMP_LOOP_C_224, COMP_LOOP_C_225, COMP_LOOP_C_226, COMP_LOOP_C_227,
      COMP_LOOP_C_228, COMP_LOOP_C_229, COMP_LOOP_C_230, COMP_LOOP_C_231, COMP_LOOP_C_232,
      COMP_LOOP_C_233, COMP_LOOP_C_234, COMP_LOOP_C_235, COMP_LOOP_C_236, COMP_LOOP_C_237,
      COMP_LOOP_C_238, COMP_LOOP_C_239, COMP_LOOP_C_240, COMP_LOOP_C_241, COMP_LOOP_C_242,
      COMP_LOOP_C_243, COMP_LOOP_C_244, COMP_LOOP_C_245, COMP_LOOP_C_246, COMP_LOOP_C_247,
      COMP_LOOP_C_248, COMP_LOOP_C_249, COMP_LOOP_C_250, COMP_LOOP_C_251, COMP_LOOP_C_252,
      COMP_LOOP_C_253, COMP_LOOP_C_254, COMP_LOOP_C_255, COMP_LOOP_C_256, COMP_LOOP_C_257,
      COMP_LOOP_C_258, COMP_LOOP_C_259, COMP_LOOP_C_260, COMP_LOOP_C_261, COMP_LOOP_C_262,
      COMP_LOOP_C_263, COMP_LOOP_C_264, VEC_LOOP_C_0, STAGE_LOOP_C_10, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_9_tr0, modExp_while_C_40_tr0,
      COMP_LOOP_C_1_tr0, COMP_LOOP_1_modExp_1_while_C_40_tr0, COMP_LOOP_C_66_tr0,
      COMP_LOOP_2_modExp_1_while_C_40_tr0, COMP_LOOP_C_132_tr0, COMP_LOOP_3_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_198_tr0, COMP_LOOP_4_modExp_1_while_C_40_tr0, COMP_LOOP_C_264_tr0,
      VEC_LOOP_C_0_tr0, STAGE_LOOP_C_10_tr0, state_var)
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
        IF ( STAGE_LOOP_C_9_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= modExp_while_C_39;
      WHEN modExp_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= modExp_while_C_40;
      WHEN modExp_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        IF ( modExp_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        IF ( COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_1;
      WHEN COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_2;
      WHEN COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_3;
      WHEN COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_4;
      WHEN COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_5;
      WHEN COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_6;
      WHEN COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_7;
      WHEN COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_8;
      WHEN COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_9;
      WHEN COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_10;
      WHEN COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_11;
      WHEN COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_12;
      WHEN COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_13;
      WHEN COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_14;
      WHEN COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_15;
      WHEN COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_16;
      WHEN COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_17;
      WHEN COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_18;
      WHEN COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_19;
      WHEN COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_20;
      WHEN COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_21;
      WHEN COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_22;
      WHEN COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_23;
      WHEN COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_24;
      WHEN COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_25;
      WHEN COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_26;
      WHEN COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_27;
      WHEN COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_28;
      WHEN COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_29;
      WHEN COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_30;
      WHEN COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_31;
      WHEN COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_32;
      WHEN COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_33;
      WHEN COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_34;
      WHEN COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_35;
      WHEN COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_36;
      WHEN COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_37;
      WHEN COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_38;
      WHEN COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_39;
      WHEN COMP_LOOP_1_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= COMP_LOOP_1_modExp_1_while_C_40;
      WHEN COMP_LOOP_1_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        IF ( COMP_LOOP_1_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_2;
        ELSE
          state_var_NS <= COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        IF ( COMP_LOOP_C_66_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_67;
        END IF;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
      WHEN COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_1;
      WHEN COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_2;
      WHEN COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_3;
      WHEN COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_4;
      WHEN COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_5;
      WHEN COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_6;
      WHEN COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_7;
      WHEN COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_8;
      WHEN COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_9;
      WHEN COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_10;
      WHEN COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_11;
      WHEN COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_12;
      WHEN COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_13;
      WHEN COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_14;
      WHEN COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_15;
      WHEN COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_16;
      WHEN COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_17;
      WHEN COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_18;
      WHEN COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_19;
      WHEN COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_20;
      WHEN COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_21;
      WHEN COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_22;
      WHEN COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_23;
      WHEN COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_24;
      WHEN COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_25;
      WHEN COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_26;
      WHEN COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_27;
      WHEN COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_28;
      WHEN COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_29;
      WHEN COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_30;
      WHEN COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_31;
      WHEN COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_32;
      WHEN COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_33;
      WHEN COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_34;
      WHEN COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_35;
      WHEN COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_36;
      WHEN COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_37;
      WHEN COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_38;
      WHEN COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_39;
      WHEN COMP_LOOP_2_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_2_modExp_1_while_C_40;
      WHEN COMP_LOOP_2_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        IF ( COMP_LOOP_2_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_68;
        ELSE
          state_var_NS <= COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        IF ( COMP_LOOP_C_132_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_133;
        END IF;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
      WHEN COMP_LOOP_3_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_1;
      WHEN COMP_LOOP_3_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_2;
      WHEN COMP_LOOP_3_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_3;
      WHEN COMP_LOOP_3_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_4;
      WHEN COMP_LOOP_3_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_5;
      WHEN COMP_LOOP_3_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_6;
      WHEN COMP_LOOP_3_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_7;
      WHEN COMP_LOOP_3_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_8;
      WHEN COMP_LOOP_3_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_9;
      WHEN COMP_LOOP_3_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_10;
      WHEN COMP_LOOP_3_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_11;
      WHEN COMP_LOOP_3_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_12;
      WHEN COMP_LOOP_3_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_13;
      WHEN COMP_LOOP_3_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_14;
      WHEN COMP_LOOP_3_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_15;
      WHEN COMP_LOOP_3_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_16;
      WHEN COMP_LOOP_3_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_17;
      WHEN COMP_LOOP_3_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_18;
      WHEN COMP_LOOP_3_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_19;
      WHEN COMP_LOOP_3_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_20;
      WHEN COMP_LOOP_3_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_21;
      WHEN COMP_LOOP_3_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_22;
      WHEN COMP_LOOP_3_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_23;
      WHEN COMP_LOOP_3_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_24;
      WHEN COMP_LOOP_3_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_25;
      WHEN COMP_LOOP_3_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_26;
      WHEN COMP_LOOP_3_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_27;
      WHEN COMP_LOOP_3_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_28;
      WHEN COMP_LOOP_3_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_29;
      WHEN COMP_LOOP_3_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_30;
      WHEN COMP_LOOP_3_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_31;
      WHEN COMP_LOOP_3_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_32;
      WHEN COMP_LOOP_3_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_33;
      WHEN COMP_LOOP_3_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_34;
      WHEN COMP_LOOP_3_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_35;
      WHEN COMP_LOOP_3_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_36;
      WHEN COMP_LOOP_3_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_37;
      WHEN COMP_LOOP_3_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_38;
      WHEN COMP_LOOP_3_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_39;
      WHEN COMP_LOOP_3_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_3_modExp_1_while_C_40;
      WHEN COMP_LOOP_3_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        IF ( COMP_LOOP_3_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_134;
        ELSE
          state_var_NS <= COMP_LOOP_3_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001000");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001001");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001010");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001011");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001100");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001101");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001110");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001111");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010000");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010001");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010010");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010011");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010100");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010101");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010110");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010111");
        state_var_NS <= COMP_LOOP_C_169;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011000");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011001");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011010");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011011");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011100");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011101");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011110");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011111");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100000");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100001");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100010");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100011");
        state_var_NS <= COMP_LOOP_C_181;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100100");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100101");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100110");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100111");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101000");
        state_var_NS <= COMP_LOOP_C_186;
      WHEN COMP_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101001");
        state_var_NS <= COMP_LOOP_C_187;
      WHEN COMP_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101010");
        state_var_NS <= COMP_LOOP_C_188;
      WHEN COMP_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101011");
        state_var_NS <= COMP_LOOP_C_189;
      WHEN COMP_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101100");
        state_var_NS <= COMP_LOOP_C_190;
      WHEN COMP_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101101");
        state_var_NS <= COMP_LOOP_C_191;
      WHEN COMP_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101110");
        state_var_NS <= COMP_LOOP_C_192;
      WHEN COMP_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101111");
        state_var_NS <= COMP_LOOP_C_193;
      WHEN COMP_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110000");
        state_var_NS <= COMP_LOOP_C_194;
      WHEN COMP_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110001");
        state_var_NS <= COMP_LOOP_C_195;
      WHEN COMP_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110010");
        state_var_NS <= COMP_LOOP_C_196;
      WHEN COMP_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110011");
        state_var_NS <= COMP_LOOP_C_197;
      WHEN COMP_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110100");
        state_var_NS <= COMP_LOOP_C_198;
      WHEN COMP_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110101");
        IF ( COMP_LOOP_C_198_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_199;
        END IF;
      WHEN COMP_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
      WHEN COMP_LOOP_4_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_1;
      WHEN COMP_LOOP_4_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_2;
      WHEN COMP_LOOP_4_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_3;
      WHEN COMP_LOOP_4_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_4;
      WHEN COMP_LOOP_4_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_5;
      WHEN COMP_LOOP_4_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_6;
      WHEN COMP_LOOP_4_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_7;
      WHEN COMP_LOOP_4_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_8;
      WHEN COMP_LOOP_4_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_9;
      WHEN COMP_LOOP_4_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_10;
      WHEN COMP_LOOP_4_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_11;
      WHEN COMP_LOOP_4_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_12;
      WHEN COMP_LOOP_4_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_13;
      WHEN COMP_LOOP_4_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_14;
      WHEN COMP_LOOP_4_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_15;
      WHEN COMP_LOOP_4_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_16;
      WHEN COMP_LOOP_4_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_17;
      WHEN COMP_LOOP_4_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_18;
      WHEN COMP_LOOP_4_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_19;
      WHEN COMP_LOOP_4_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_20;
      WHEN COMP_LOOP_4_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_21;
      WHEN COMP_LOOP_4_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_22;
      WHEN COMP_LOOP_4_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_23;
      WHEN COMP_LOOP_4_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_24;
      WHEN COMP_LOOP_4_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_25;
      WHEN COMP_LOOP_4_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_26;
      WHEN COMP_LOOP_4_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_27;
      WHEN COMP_LOOP_4_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_28;
      WHEN COMP_LOOP_4_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_29;
      WHEN COMP_LOOP_4_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_30;
      WHEN COMP_LOOP_4_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_31;
      WHEN COMP_LOOP_4_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_32;
      WHEN COMP_LOOP_4_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010111");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_33;
      WHEN COMP_LOOP_4_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011000");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_34;
      WHEN COMP_LOOP_4_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011001");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_35;
      WHEN COMP_LOOP_4_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011010");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_36;
      WHEN COMP_LOOP_4_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011011");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_37;
      WHEN COMP_LOOP_4_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011100");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_38;
      WHEN COMP_LOOP_4_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011101");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_39;
      WHEN COMP_LOOP_4_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011110");
        state_var_NS <= COMP_LOOP_4_modExp_1_while_C_40;
      WHEN COMP_LOOP_4_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011111");
        IF ( COMP_LOOP_4_modExp_1_while_C_40_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_200;
        ELSE
          state_var_NS <= COMP_LOOP_4_modExp_1_while_C_0;
        END IF;
      WHEN COMP_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100000");
        state_var_NS <= COMP_LOOP_C_201;
      WHEN COMP_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100001");
        state_var_NS <= COMP_LOOP_C_202;
      WHEN COMP_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100010");
        state_var_NS <= COMP_LOOP_C_203;
      WHEN COMP_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100011");
        state_var_NS <= COMP_LOOP_C_204;
      WHEN COMP_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100100");
        state_var_NS <= COMP_LOOP_C_205;
      WHEN COMP_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100101");
        state_var_NS <= COMP_LOOP_C_206;
      WHEN COMP_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100110");
        state_var_NS <= COMP_LOOP_C_207;
      WHEN COMP_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100111");
        state_var_NS <= COMP_LOOP_C_208;
      WHEN COMP_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101000");
        state_var_NS <= COMP_LOOP_C_209;
      WHEN COMP_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101001");
        state_var_NS <= COMP_LOOP_C_210;
      WHEN COMP_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101010");
        state_var_NS <= COMP_LOOP_C_211;
      WHEN COMP_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101011");
        state_var_NS <= COMP_LOOP_C_212;
      WHEN COMP_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101100");
        state_var_NS <= COMP_LOOP_C_213;
      WHEN COMP_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101101");
        state_var_NS <= COMP_LOOP_C_214;
      WHEN COMP_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101110");
        state_var_NS <= COMP_LOOP_C_215;
      WHEN COMP_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101111");
        state_var_NS <= COMP_LOOP_C_216;
      WHEN COMP_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110000");
        state_var_NS <= COMP_LOOP_C_217;
      WHEN COMP_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110001");
        state_var_NS <= COMP_LOOP_C_218;
      WHEN COMP_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110010");
        state_var_NS <= COMP_LOOP_C_219;
      WHEN COMP_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110011");
        state_var_NS <= COMP_LOOP_C_220;
      WHEN COMP_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110100");
        state_var_NS <= COMP_LOOP_C_221;
      WHEN COMP_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110101");
        state_var_NS <= COMP_LOOP_C_222;
      WHEN COMP_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110110");
        state_var_NS <= COMP_LOOP_C_223;
      WHEN COMP_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110111");
        state_var_NS <= COMP_LOOP_C_224;
      WHEN COMP_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111000");
        state_var_NS <= COMP_LOOP_C_225;
      WHEN COMP_LOOP_C_225 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111001");
        state_var_NS <= COMP_LOOP_C_226;
      WHEN COMP_LOOP_C_226 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111010");
        state_var_NS <= COMP_LOOP_C_227;
      WHEN COMP_LOOP_C_227 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111011");
        state_var_NS <= COMP_LOOP_C_228;
      WHEN COMP_LOOP_C_228 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111100");
        state_var_NS <= COMP_LOOP_C_229;
      WHEN COMP_LOOP_C_229 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111101");
        state_var_NS <= COMP_LOOP_C_230;
      WHEN COMP_LOOP_C_230 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111110");
        state_var_NS <= COMP_LOOP_C_231;
      WHEN COMP_LOOP_C_231 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111111");
        state_var_NS <= COMP_LOOP_C_232;
      WHEN COMP_LOOP_C_232 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000000");
        state_var_NS <= COMP_LOOP_C_233;
      WHEN COMP_LOOP_C_233 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000001");
        state_var_NS <= COMP_LOOP_C_234;
      WHEN COMP_LOOP_C_234 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000010");
        state_var_NS <= COMP_LOOP_C_235;
      WHEN COMP_LOOP_C_235 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000011");
        state_var_NS <= COMP_LOOP_C_236;
      WHEN COMP_LOOP_C_236 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000100");
        state_var_NS <= COMP_LOOP_C_237;
      WHEN COMP_LOOP_C_237 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000101");
        state_var_NS <= COMP_LOOP_C_238;
      WHEN COMP_LOOP_C_238 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000110");
        state_var_NS <= COMP_LOOP_C_239;
      WHEN COMP_LOOP_C_239 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000111");
        state_var_NS <= COMP_LOOP_C_240;
      WHEN COMP_LOOP_C_240 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001000");
        state_var_NS <= COMP_LOOP_C_241;
      WHEN COMP_LOOP_C_241 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001001");
        state_var_NS <= COMP_LOOP_C_242;
      WHEN COMP_LOOP_C_242 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001010");
        state_var_NS <= COMP_LOOP_C_243;
      WHEN COMP_LOOP_C_243 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001011");
        state_var_NS <= COMP_LOOP_C_244;
      WHEN COMP_LOOP_C_244 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001100");
        state_var_NS <= COMP_LOOP_C_245;
      WHEN COMP_LOOP_C_245 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001101");
        state_var_NS <= COMP_LOOP_C_246;
      WHEN COMP_LOOP_C_246 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001110");
        state_var_NS <= COMP_LOOP_C_247;
      WHEN COMP_LOOP_C_247 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001111");
        state_var_NS <= COMP_LOOP_C_248;
      WHEN COMP_LOOP_C_248 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010000");
        state_var_NS <= COMP_LOOP_C_249;
      WHEN COMP_LOOP_C_249 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010001");
        state_var_NS <= COMP_LOOP_C_250;
      WHEN COMP_LOOP_C_250 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010010");
        state_var_NS <= COMP_LOOP_C_251;
      WHEN COMP_LOOP_C_251 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010011");
        state_var_NS <= COMP_LOOP_C_252;
      WHEN COMP_LOOP_C_252 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010100");
        state_var_NS <= COMP_LOOP_C_253;
      WHEN COMP_LOOP_C_253 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010101");
        state_var_NS <= COMP_LOOP_C_254;
      WHEN COMP_LOOP_C_254 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010110");
        state_var_NS <= COMP_LOOP_C_255;
      WHEN COMP_LOOP_C_255 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010111");
        state_var_NS <= COMP_LOOP_C_256;
      WHEN COMP_LOOP_C_256 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011000");
        state_var_NS <= COMP_LOOP_C_257;
      WHEN COMP_LOOP_C_257 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011001");
        state_var_NS <= COMP_LOOP_C_258;
      WHEN COMP_LOOP_C_258 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011010");
        state_var_NS <= COMP_LOOP_C_259;
      WHEN COMP_LOOP_C_259 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011011");
        state_var_NS <= COMP_LOOP_C_260;
      WHEN COMP_LOOP_C_260 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011100");
        state_var_NS <= COMP_LOOP_C_261;
      WHEN COMP_LOOP_C_261 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011101");
        state_var_NS <= COMP_LOOP_C_262;
      WHEN COMP_LOOP_C_262 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011110");
        state_var_NS <= COMP_LOOP_C_263;
      WHEN COMP_LOOP_C_263 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011111");
        state_var_NS <= COMP_LOOP_C_264;
      WHEN COMP_LOOP_C_264 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111100000");
        IF ( COMP_LOOP_C_264_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111100001");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_10;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111100010");
        IF ( STAGE_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111100011");
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

END v38;

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

ARCHITECTURE v38 OF inPlaceNTT_DIT_core IS
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
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL nor_tmp_4 : STD_LOGIC;
  SIGNAL or_tmp_32 : STD_LOGIC;
  SIGNAL or_tmp_43 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL not_tmp_73 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL nor_tmp_40 : STD_LOGIC;
  SIGNAL not_tmp_90 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL or_tmp_111 : STD_LOGIC;
  SIGNAL or_tmp_113 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL mux_tmp_170 : STD_LOGIC;
  SIGNAL not_tmp_130 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL nor_tmp_57 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL or_tmp_230 : STD_LOGIC;
  SIGNAL mux_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_178 : STD_LOGIC;
  SIGNAL mux_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL nor_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_181 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL not_tmp_144 : STD_LOGIC;
  SIGNAL or_tmp_251 : STD_LOGIC;
  SIGNAL or_tmp_255 : STD_LOGIC;
  SIGNAL not_tmp_152 : STD_LOGIC;
  SIGNAL nor_tmp_68 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL or_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL or_tmp_268 : STD_LOGIC;
  SIGNAL or_tmp_269 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL or_tmp_285 : STD_LOGIC;
  SIGNAL or_tmp_291 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL not_tmp_185 : STD_LOGIC;
  SIGNAL not_tmp_191 : STD_LOGIC;
  SIGNAL or_tmp_330 : STD_LOGIC;
  SIGNAL or_tmp_334 : STD_LOGIC;
  SIGNAL not_tmp_201 : STD_LOGIC;
  SIGNAL mux_tmp_257 : STD_LOGIC;
  SIGNAL nor_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_258 : STD_LOGIC;
  SIGNAL or_tmp_349 : STD_LOGIC;
  SIGNAL or_tmp_351 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL or_tmp_353 : STD_LOGIC;
  SIGNAL mux_tmp_268 : STD_LOGIC;
  SIGNAL not_tmp_215 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL or_dcpl_40 : STD_LOGIC;
  SIGNAL or_dcpl_42 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL not_tmp_227 : STD_LOGIC;
  SIGNAL mux_tmp_327 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_335 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL not_tmp_245 : STD_LOGIC;
  SIGNAL not_tmp_250 : STD_LOGIC;
  SIGNAL nor_tmp_104 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL not_tmp_252 : STD_LOGIC;
  SIGNAL not_tmp_253 : STD_LOGIC;
  SIGNAL or_dcpl_47 : STD_LOGIC;
  SIGNAL or_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_52 : STD_LOGIC;
  SIGNAL or_dcpl_53 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm : STD_LOGIC;
  SIGNAL VEC_LOOP_j_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_2_sva_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_11_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_5_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_137_m1c : STD_LOGIC;
  SIGNAL and_181_m1c : STD_LOGIC;
  SIGNAL nor_43_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_3_obj_ld_cse : STD_LOGIC;
  SIGNAL or_278_cse : STD_LOGIC;
  SIGNAL and_192_cse : STD_LOGIC;
  SIGNAL or_376_cse : STD_LOGIC;
  SIGNAL nor_149_cse : STD_LOGIC;
  SIGNAL modulo_result_mux_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_540_cse : STD_LOGIC;
  SIGNAL or_52_cse : STD_LOGIC;
  SIGNAL nor_161_cse : STD_LOGIC;
  SIGNAL and_190_cse : STD_LOGIC;
  SIGNAL and_284_cse : STD_LOGIC;
  SIGNAL or_57_cse : STD_LOGIC;
  SIGNAL and_285_cse : STD_LOGIC;
  SIGNAL or_574_cse : STD_LOGIC;
  SIGNAL or_107_cse : STD_LOGIC;
  SIGNAL or_71_cse : STD_LOGIC;
  SIGNAL nand_56_cse : STD_LOGIC;
  SIGNAL nor_143_cse : STD_LOGIC;
  SIGNAL or_353_cse : STD_LOGIC;
  SIGNAL mux_249_cse : STD_LOGIC;
  SIGNAL or_123_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_psp_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_base_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_185_itm : STD_LOGIC;
  SIGNAL mux_204_itm : STD_LOGIC;
  SIGNAL mux_269_itm : STD_LOGIC;
  SIGNAL mux_353_itm : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_183 : STD_LOGIC;
  SIGNAL not_tmp_289 : STD_LOGIC;
  SIGNAL not_tmp_291 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_190 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_242 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL and_dcpl_258 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_268 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
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
  SIGNAL modExp_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_1_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_3_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_3_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_4_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_4_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_3_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_4_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_5_mut_mx0w7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_mx0w0 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL VEC_LOOP_j_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_and_3 : STD_LOGIC;
  SIGNAL modExp_while_and_5 : STD_LOGIC;
  SIGNAL and_144_m1c : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL operator_64_false_1_or_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_or_ssc : STD_LOGIC;
  SIGNAL COMP_LOOP_or_2_cse : STD_LOGIC;
  SIGNAL and_203_cse : STD_LOGIC;
  SIGNAL nor_263_cse : STD_LOGIC;
  SIGNAL or_384_cse : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL or_tmp_497 : STD_LOGIC;
  SIGNAL operator_64_false_mux1h_1_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_mut_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_607_cse : STD_LOGIC;
  SIGNAL nand_cse : STD_LOGIC;
  SIGNAL nand_57_cse : STD_LOGIC;
  SIGNAL operator_64_false_1_or_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_20_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_2_1 : STD_LOGIC;
  SIGNAL nor_287_cse : STD_LOGIC;

  SIGNAL modulo_result_or_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL and_236_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL or_263_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL or_261_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
  SIGNAL and_93_nl : STD_LOGIC;
  SIGNAL and_96_nl : STD_LOGIC;
  SIGNAL and_98_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL and_101_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL nand_62_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL nand_26_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL nand_61_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL nor_182_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL and_103_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL or_284_nl : STD_LOGIC;
  SIGNAL and_106_nl : STD_LOGIC;
  SIGNAL and_108_nl : STD_LOGIC;
  SIGNAL mux_201_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL and_113_nl : STD_LOGIC;
  SIGNAL and_117_nl : STD_LOGIC;
  SIGNAL and_118_nl : STD_LOGIC;
  SIGNAL mux_202_nl : STD_LOGIC;
  SIGNAL nand_59_nl : STD_LOGIC;
  SIGNAL and_119_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL and_222_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL and_121_nl : STD_LOGIC;
  SIGNAL and_122_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL nor_177_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_40_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL nor_138_nl : STD_LOGIC;
  SIGNAL nor_139_nl : STD_LOGIC;
  SIGNAL nor_140_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL nor_135_nl : STD_LOGIC;
  SIGNAL nor_136_nl : STD_LOGIC;
  SIGNAL nor_137_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL nor_133_nl : STD_LOGIC;
  SIGNAL nor_134_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL mux_371_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL and_127_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL or_576_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL or_320_nl : STD_LOGIC;
  SIGNAL or_319_nl : STD_LOGIC;
  SIGNAL nand_91_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL or_316_nl : STD_LOGIC;
  SIGNAL nand_92_nl : STD_LOGIC;
  SIGNAL mux_424_nl : STD_LOGIC;
  SIGNAL mux_423_nl : STD_LOGIC;
  SIGNAL mux_422_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL or_609_nl : STD_LOGIC;
  SIGNAL or_608_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL mux_419_nl : STD_LOGIC;
  SIGNAL mux_418_nl : STD_LOGIC;
  SIGNAL mux_417_nl : STD_LOGIC;
  SIGNAL or_606_nl : STD_LOGIC;
  SIGNAL mux_416_nl : STD_LOGIC;
  SIGNAL mux_415_nl : STD_LOGIC;
  SIGNAL or_605_nl : STD_LOGIC;
  SIGNAL mux_413_nl : STD_LOGIC;
  SIGNAL and_413_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nor_315_nl : STD_LOGIC;
  SIGNAL mux_431_nl : STD_LOGIC;
  SIGNAL or_619_nl : STD_LOGIC;
  SIGNAL or_618_nl : STD_LOGIC;
  SIGNAL mux_430_nl : STD_LOGIC;
  SIGNAL or_617_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_316_nl : STD_LOGIC;
  SIGNAL mux_428_nl : STD_LOGIC;
  SIGNAL or_614_nl : STD_LOGIC;
  SIGNAL or_613_nl : STD_LOGIC;
  SIGNAL nor_317_nl : STD_LOGIC;
  SIGNAL mux_427_nl : STD_LOGIC;
  SIGNAL mux_426_nl : STD_LOGIC;
  SIGNAL or_610_nl : STD_LOGIC;
  SIGNAL or_601_nl : STD_LOGIC;
  SIGNAL mux_223_nl : STD_LOGIC;
  SIGNAL or_333_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL or_332_nl : STD_LOGIC;
  SIGNAL nand_86_nl : STD_LOGIC;
  SIGNAL or_328_nl : STD_LOGIC;
  SIGNAL mux_435_nl : STD_LOGIC;
  SIGNAL or_628_nl : STD_LOGIC;
  SIGNAL mux_434_nl : STD_LOGIC;
  SIGNAL or_626_nl : STD_LOGIC;
  SIGNAL nand_101_nl : STD_LOGIC;
  SIGNAL nand_102_nl : STD_LOGIC;
  SIGNAL mux_433_nl : STD_LOGIC;
  SIGNAL nor_313_nl : STD_LOGIC;
  SIGNAL nor_314_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL nor_169_nl : STD_LOGIC;
  SIGNAL nor_170_nl : STD_LOGIC;
  SIGNAL and_141_nl : STD_LOGIC;
  SIGNAL r_or_nl : STD_LOGIC;
  SIGNAL r_or_1_nl : STD_LOGIC;
  SIGNAL and_146_nl : STD_LOGIC;
  SIGNAL and_148_nl : STD_LOGIC;
  SIGNAL and_150_nl : STD_LOGIC;
  SIGNAL and_152_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL mux_254_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL or_99_nl : STD_LOGIC;
  SIGNAL or_379_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL nand_32_nl : STD_LOGIC;
  SIGNAL or_548_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL or_372_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL or_370_nl : STD_LOGIC;
  SIGNAL or_95_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL nand_83_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL or_388_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL or_386_nl : STD_LOGIC;
  SIGNAL and_210_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_9_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL mux_314_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL mux_312_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL or_405_nl : STD_LOGIC;
  SIGNAL mux_310_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL mux_308_nl : STD_LOGIC;
  SIGNAL and_202_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL or_403_nl : STD_LOGIC;
  SIGNAL or_402_nl : STD_LOGIC;
  SIGNAL mux_305_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL and_263_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL mux_296_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL or_400_nl : STD_LOGIC;
  SIGNAL or_399_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL nor_154_nl : STD_LOGIC;
  SIGNAL nor_155_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL nand_48_nl : STD_LOGIC;
  SIGNAL or_425_nl : STD_LOGIC;
  SIGNAL and_166_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_19_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL and_200_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL nor_150_nl : STD_LOGIC;
  SIGNAL nor_151_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL or_433_nl : STD_LOGIC;
  SIGNAL or_431_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL nand_90_nl : STD_LOGIC;
  SIGNAL or_575_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL or_442_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL mux_341_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL or_440_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL or_439_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_22_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL and_198_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL and_290_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_39_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL or_464_nl : STD_LOGIC;
  SIGNAL mux_391_nl : STD_LOGIC;
  SIGNAL mux_398_nl : STD_LOGIC;
  SIGNAL nand_39_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_125_nl : STD_LOGIC;
  SIGNAL mux_400_nl : STD_LOGIC;
  SIGNAL and_188_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL or_560_nl : STD_LOGIC;
  SIGNAL nand_74_nl : STD_LOGIC;
  SIGNAL nor_236_nl : STD_LOGIC;
  SIGNAL nor_237_nl : STD_LOGIC;
  SIGNAL or_266_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL and_230_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL nor_183_nl : STD_LOGIC;
  SIGNAL and_231_nl : STD_LOGIC;
  SIGNAL and_232_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL nor_184_nl : STD_LOGIC;
  SIGNAL nor_185_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL or_293_nl : STD_LOGIC;
  SIGNAL or_291_nl : STD_LOGIC;
  SIGNAL and_292_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL and_214_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL and_215_nl : STD_LOGIC;
  SIGNAL mux_229_nl : STD_LOGIC;
  SIGNAL and_216_nl : STD_LOGIC;
  SIGNAL nor_166_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL nor_168_nl : STD_LOGIC;
  SIGNAL and_213_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL nor_163_nl : STD_LOGIC;
  SIGNAL nor_164_nl : STD_LOGIC;
  SIGNAL nor_165_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL or_352_nl : STD_LOGIC;
  SIGNAL and_212_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL or_366_nl : STD_LOGIC;
  SIGNAL nor_162_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL or_545_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL mux_236_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL nand_53_nl : STD_LOGIC;
  SIGNAL or_360_nl : STD_LOGIC;
  SIGNAL nand_54_nl : STD_LOGIC;
  SIGNAL nor_156_nl : STD_LOGIC;
  SIGNAL nor_157_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL or_393_nl : STD_LOGIC;
  SIGNAL nand_33_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL nor_158_nl : STD_LOGIC;
  SIGNAL and_291_nl : STD_LOGIC;
  SIGNAL mux_326_nl : STD_LOGIC;
  SIGNAL mux_325_nl : STD_LOGIC;
  SIGNAL or_430_nl : STD_LOGIC;
  SIGNAL nand_98_nl : STD_LOGIC;
  SIGNAL or_444_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL or_445_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL and_199_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_147_nl : STD_LOGIC;
  SIGNAL nor_148_nl : STD_LOGIC;
  SIGNAL nor_142_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nand_82_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_66_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL nor_238_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL or_137_nl : STD_LOGIC;
  SIGNAL or_135_nl : STD_LOGIC;
  SIGNAL and_257_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL nor_239_nl : STD_LOGIC;
  SIGNAL and_70_nl : STD_LOGIC;
  SIGNAL and_77_nl : STD_LOGIC;
  SIGNAL and_84_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL nor_231_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL or_154_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL or_153_nl : STD_LOGIC;
  SIGNAL or_151_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL or_150_nl : STD_LOGIC;
  SIGNAL or_149_nl : STD_LOGIC;
  SIGNAL and_256_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL nor_235_nl : STD_LOGIC;
  SIGNAL and_254_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL nor_224_nl : STD_LOGIC;
  SIGNAL and_255_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL nor_225_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL nor_226_nl : STD_LOGIC;
  SIGNAL nor_227_nl : STD_LOGIC;
  SIGNAL nor_228_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL or_162_nl : STD_LOGIC;
  SIGNAL or_160_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL nor_229_nl : STD_LOGIC;
  SIGNAL nor_230_nl : STD_LOGIC;
  SIGNAL nor_218_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL nor_219_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL or_178_nl : STD_LOGIC;
  SIGNAL nand_71_nl : STD_LOGIC;
  SIGNAL and_252_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL nor_221_nl : STD_LOGIC;
  SIGNAL nor_222_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL nor_223_nl : STD_LOGIC;
  SIGNAL and_253_nl : STD_LOGIC;
  SIGNAL and_250_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL nor_211_nl : STD_LOGIC;
  SIGNAL and_251_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL nor_212_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL nor_215_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL or_190_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL or_189_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL nor_216_nl : STD_LOGIC;
  SIGNAL nor_217_nl : STD_LOGIC;
  SIGNAL nor_207_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL or_210_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL or_209_nl : STD_LOGIC;
  SIGNAL or_207_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL or_206_nl : STD_LOGIC;
  SIGNAL nand_69_nl : STD_LOGIC;
  SIGNAL and_248_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL nor_209_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nor_210_nl : STD_LOGIC;
  SIGNAL and_249_nl : STD_LOGIC;
  SIGNAL and_246_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL nor_200_nl : STD_LOGIC;
  SIGNAL and_247_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL nor_201_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL nor_202_nl : STD_LOGIC;
  SIGNAL nor_203_nl : STD_LOGIC;
  SIGNAL nor_204_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL or_219_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL or_218_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL nand_15_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL nor_205_nl : STD_LOGIC;
  SIGNAL nor_206_nl : STD_LOGIC;
  SIGNAL nor_194_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL nand_19_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nor_195_nl : STD_LOGIC;
  SIGNAL nor_196_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL or_235_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL and_244_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_293_nl : STD_LOGIC;
  SIGNAL nor_198_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL nor_199_nl : STD_LOGIC;
  SIGNAL and_245_nl : STD_LOGIC;
  SIGNAL and_241_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nor_188_nl : STD_LOGIC;
  SIGNAL and_242_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL nor_189_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL and_294_nl : STD_LOGIC;
  SIGNAL and_295_nl : STD_LOGIC;
  SIGNAL nor_192_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL or_247_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL nand_85_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL and_243_nl : STD_LOGIC;
  SIGNAL nor_193_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_411_nl : STD_LOGIC;
  SIGNAL nor_288_nl : STD_LOGIC;
  SIGNAL nor_289_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_22_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_23_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_1_operator_64_false_1_or_1_nl : STD_LOGIC_VECTOR (3 DOWNTO
      0);
  SIGNAL operator_64_false_1_and_1_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL not_1275_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_6_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_9_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_10_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_11_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_12_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_13_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_14_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_16_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux1h_17_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_34_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_5_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nor_4_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_24_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_417_nl : STD_LOGIC;
  SIGNAL and_418_nl : STD_LOGIC;
  SIGNAL and_419_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_7_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_or_8_nl : STD_LOGIC;
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_25_nl : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL COMP_LOOP_or_27_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_nor_6_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_75_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_76_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_28_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_17_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_2_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL COMP_LOOP_not_101_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_8_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL modExp_while_if_mux1h_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_420_nl : STD_LOGIC;
  SIGNAL mux_436_nl : STD_LOGIC;
  SIGNAL nor_322_nl : STD_LOGIC;
  SIGNAL mux_437_nl : STD_LOGIC;
  SIGNAL or_632_nl : STD_LOGIC;
  SIGNAL nand_105_nl : STD_LOGIC;
  SIGNAL mux_438_nl : STD_LOGIC;
  SIGNAL nor_323_nl : STD_LOGIC;
  SIGNAL nor_324_nl : STD_LOGIC;
  SIGNAL mux_439_nl : STD_LOGIC;
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL mux_440_nl : STD_LOGIC;
  SIGNAL or_633_nl : STD_LOGIC;
  SIGNAL mux_441_nl : STD_LOGIC;
  SIGNAL mux_442_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL mux_443_nl : STD_LOGIC;
  SIGNAL or_634_nl : STD_LOGIC;
  SIGNAL or_635_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL mux_444_nl : STD_LOGIC;
  SIGNAL or_636_nl : STD_LOGIC;
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
      STAGE_LOOP_C_9_tr0 : IN STD_LOGIC;
      modExp_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      COMP_LOOP_1_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_66_tr0 : IN STD_LOGIC;
      COMP_LOOP_2_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_132_tr0 : IN STD_LOGIC;
      COMP_LOOP_3_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_198_tr0 : IN STD_LOGIC;
      COMP_LOOP_4_modExp_1_while_C_40_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_264_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_10_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0 :
      STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_64_18_2(input_17 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(17 DOWNTO 0))
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
      STAGE_LOOP_C_9_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0,
      modExp_while_C_40_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0,
      COMP_LOOP_1_modExp_1_while_C_40_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      COMP_LOOP_C_66_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0,
      COMP_LOOP_2_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_132_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0,
      COMP_LOOP_3_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_198_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0,
      COMP_LOOP_4_modExp_1_while_C_40_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0,
      COMP_LOOP_C_264_tr0 => exit_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_10_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_9_tr0 <= NOT (z_out_3(64));
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_1_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_66_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_2_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_132_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_3_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_C_198_tr0 <= NOT modExp_exp_1_0_1_sva;
  inPlaceNTT_DIT_core_core_fsm_inst_COMP_LOOP_4_modExp_1_while_C_40_tr0 <= NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 <= NOT STAGE_LOOP_acc_itm_2_1;

  nor_43_cse <= NOT((fsm_output(3)) OR (NOT (fsm_output(5))));
  or_278_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_574_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_192_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_190_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_1_acc_8_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_64_false_acc_mut_63_0)
      - SIGNED(modulo_result_mux_cse), 64));
  nor_138_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_253);
  nor_139_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)));
  mux_364_nl <= MUX_s_1_2_2(nor_138_nl, nor_139_nl, fsm_output(7));
  nor_140_nl <= NOT((fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(6))) OR (fsm_output(0)) OR
      not_tmp_252);
  mux_365_nl <= MUX_s_1_2_2(mux_364_nl, nor_140_nl, fsm_output(8));
  COMP_LOOP_or_6_nl <= (mux_365_nl AND and_dcpl_155) OR ((NOT((VEC_LOOP_j_sva_11_0(0))
      OR (COMP_LOOP_acc_11_psp_sva(0)))) AND and_181_m1c);
  nor_135_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_253);
  nor_136_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01")) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)));
  mux_366_nl <= MUX_s_1_2_2(nor_135_nl, nor_136_nl, fsm_output(7));
  nor_137_nl <= NOT((fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01")) OR (NOT (fsm_output(6))) OR (fsm_output(0)) OR
      not_tmp_252);
  mux_367_nl <= MUX_s_1_2_2(mux_366_nl, nor_137_nl, fsm_output(8));
  COMP_LOOP_or_7_nl <= (mux_367_nl AND and_dcpl_155) OR ((VEC_LOOP_j_sva_11_0(0))
      AND (NOT (COMP_LOOP_acc_11_psp_sva(0))) AND and_181_m1c);
  nor_132_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_253);
  nor_133_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)));
  mux_368_nl <= MUX_s_1_2_2(nor_132_nl, nor_133_nl, fsm_output(7));
  nor_134_nl <= NOT((fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10")) OR (NOT (fsm_output(6))) OR (fsm_output(0)) OR
      not_tmp_252);
  mux_369_nl <= MUX_s_1_2_2(mux_368_nl, nor_134_nl, fsm_output(8));
  COMP_LOOP_or_8_nl <= (mux_369_nl AND and_dcpl_155) OR ((COMP_LOOP_acc_11_psp_sva(0))
      AND (NOT (VEC_LOOP_j_sva_11_0(0))) AND and_181_m1c);
  nor_129_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR not_tmp_253);
  nor_130_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("11")) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)));
  mux_370_nl <= MUX_s_1_2_2(nor_129_nl, nor_130_nl, fsm_output(7));
  nor_131_nl <= NOT((fsm_output(7)) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("11")) OR (NOT (fsm_output(6))) OR (fsm_output(0)) OR
      not_tmp_252);
  mux_371_nl <= MUX_s_1_2_2(mux_370_nl, nor_131_nl, fsm_output(8));
  COMP_LOOP_or_9_nl <= (mux_371_nl AND and_dcpl_155) OR ((VEC_LOOP_j_sva_11_0(0))
      AND (COMP_LOOP_acc_11_psp_sva(0)) AND and_181_m1c);
  COMP_LOOP_mux1h_40_nl <= MUX1HOT_v_64_5_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d,
      vec_rsc_0_2_i_qa_d, vec_rsc_0_3_i_qa_d, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(COMP_LOOP_1_acc_8_nl),
      64)), STD_LOGIC_VECTOR'( COMP_LOOP_or_6_nl & COMP_LOOP_or_7_nl & COMP_LOOP_or_8_nl
      & COMP_LOOP_or_9_nl & not_tmp_144));
  and_127_nl <= and_dcpl_111 AND and_dcpl_27;
  or_323_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      and_dcpl_49);
  mux_215_nl <= MUX_s_1_2_2(or_tmp_291, or_323_nl, fsm_output(7));
  or_320_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("010"));
  or_319_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("001"));
  mux_212_nl <= MUX_s_1_2_2(or_320_nl, or_319_nl, and_192_cse);
  or_576_nl <= (fsm_output(5)) OR mux_212_nl;
  or_316_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("100"));
  mux_211_nl <= MUX_s_1_2_2(or_tmp_285, or_316_nl, fsm_output(1));
  nand_91_nl <= NOT((fsm_output(5)) AND (NOT mux_211_nl));
  mux_213_nl <= MUX_s_1_2_2(or_576_nl, nand_91_nl, fsm_output(6));
  nand_92_nl <= NOT((fsm_output(6)) AND ((fsm_output(5)) OR (or_278_cse AND CONV_SL_1_1(fsm_output(4
      DOWNTO 2)=STD_LOGIC_VECTOR'("111")))));
  mux_214_nl <= MUX_s_1_2_2(mux_213_nl, nand_92_nl, fsm_output(7));
  mux_216_nl <= MUX_s_1_2_2(mux_215_nl, mux_214_nl, fsm_output(8));
  operator_64_false_mux1h_1_rgt <= MUX1HOT_v_65_3_2(operator_64_false_acc_mut_mx0w0,
      (STD_LOGIC_VECTOR'( "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0'
      & COMP_LOOP_mux1h_40_nl), STD_LOGIC_VECTOR'( and_127_nl & and_dcpl_116 & mux_216_nl));
  or_607_cse <= (NOT (fsm_output(8))) OR (fsm_output(6));
  nand_cse <= NOT((fsm_output(7)) AND (fsm_output(8)) AND (fsm_output(1)));
  or_71_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  and_137_m1c <= and_dcpl_50 AND and_dcpl_27;
  modExp_result_and_rgt <= (NOT modExp_while_and_5) AND and_137_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_5 AND and_137_m1c;
  or_376_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("110"));
  modulo_result_mux_cse <= MUX_v_64_2_2(modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8,
      modulo_result_rem_cmp_z(63));
  nor_161_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  or_107_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("011"));
  mux_249_cse <= MUX_s_1_2_2(or_607_cse, or_tmp_32, fsm_output(7));
  nor_169_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(0))) OR (fsm_output(2))
      OR (fsm_output(3)));
  nor_170_nl <= NOT((fsm_output(5)) OR (fsm_output(0)) OR (NOT and_284_cse));
  mux_228_nl <= MUX_s_1_2_2(nor_169_nl, nor_170_nl, fsm_output(6));
  and_144_m1c <= mux_228_nl AND (fsm_output(4)) AND (fsm_output(1)) AND and_dcpl_25;
  or_57_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  and_203_cse <= (fsm_output(2)) AND (fsm_output(4));
  nor_149_cse <= NOT((fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(0))
      OR (fsm_output(7)));
  nor_143_cse <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(8))
      OR (fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(3))) OR (fsm_output(5))
      OR (NOT (fsm_output(7))));
  COMP_LOOP_or_2_cse <= and_dcpl_51 OR and_dcpl_63 OR and_dcpl_72 OR and_dcpl_77;
  or_540_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  COMP_LOOP_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_sva_11_0(11
      DOWNTO 2)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0),
      7), 10), 10));
  COMP_LOOP_1_acc_5_mut_mx0w7 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_64_false_acc_mut_63_0)
      + SIGNED(modulo_result_mux_cse), 64));
  operator_64_false_acc_mut_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(p_sva),
      64), 65) + SIGNED'( "11111111111111111111111111111111111111111111111111111111111111111"),
      65));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(63
      DOWNTO 1)), (COMP_LOOP_1_acc_5_mut(63 DOWNTO 1)), and_dcpl_122);
  modulo_qr_sva_1_mx0w8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_result_rem_cmp_z)
      + UNSIGNED(p_sva), 64));
  or_52_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("100"));
  modExp_while_and_3 <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
  modExp_while_and_5 <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
  or_tmp_2 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_7 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  nor_tmp_4 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  and_284_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_285_cse <= (fsm_output(5)) AND ((CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111")))
      OR (fsm_output(3))) AND (fsm_output(4));
  or_tmp_32 <= (fsm_output(8)) OR (fsm_output(6));
  or_tmp_43 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_55 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(8));
  and_dcpl_2 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  and_tmp_6 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("111")) AND (CONV_SL_1_1(fsm_output(4
      DOWNTO 1)/=STD_LOGIC_VECTOR'("0000")));
  or_123_cse <= and_192_cse OR CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  or_560_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000"));
  nand_74_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("111"))
      AND or_123_cse);
  not_tmp_73 <= MUX_s_1_2_2(or_560_nl, nand_74_nl, fsm_output(8));
  and_dcpl_25 <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_26 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_27 <= and_dcpl_26 AND and_dcpl_25;
  and_dcpl_29 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_30 <= and_dcpl_29 AND (NOT (fsm_output(2)));
  and_dcpl_31 <= and_dcpl_30 AND nor_161_cse;
  and_dcpl_35 <= and_dcpl_2 AND nor_tmp_4;
  and_dcpl_36 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_37 <= and_dcpl_30 AND and_dcpl_36;
  and_dcpl_39 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_40 <= and_dcpl_39 AND and_dcpl_25;
  and_dcpl_41 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_42 <= and_dcpl_41 AND (fsm_output(2));
  and_dcpl_44 <= and_dcpl_42 AND nor_161_cse AND and_dcpl_40;
  and_dcpl_45 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_46 <= and_dcpl_45 AND and_dcpl_25;
  and_dcpl_49 <= and_190_cse AND (fsm_output(2));
  and_dcpl_50 <= and_dcpl_49 AND and_192_cse;
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl_46;
  and_dcpl_52 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_55 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("010"));
  and_dcpl_56 <= and_dcpl_55 AND and_dcpl_36;
  nor_tmp_40 <= (fsm_output(8)) AND (fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(6));
  nor_236_nl <= NOT((fsm_output(5)) OR (NOT((fsm_output(1)) AND (fsm_output(3)))));
  nor_237_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(1)) OR (fsm_output(3)));
  not_tmp_90 <= MUX_s_1_2_2(nor_236_nl, nor_237_nl, fsm_output(6));
  and_dcpl_62 <= and_dcpl_45 AND and_dcpl_52;
  and_dcpl_63 <= and_dcpl_56 AND and_dcpl_62;
  and_dcpl_64 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_70 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_71 <= and_dcpl_42 AND and_dcpl_70;
  and_dcpl_72 <= and_dcpl_71 AND and_dcpl_39 AND and_dcpl_64;
  or_tmp_111 <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00101"));
  or_tmp_113 <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("11010"));
  and_dcpl_76 <= and_dcpl_39 AND nor_tmp_4;
  and_dcpl_77 <= and_dcpl_31 AND and_dcpl_76;
  and_dcpl_82 <= and_dcpl_55 AND and_192_cse;
  and_dcpl_83 <= and_dcpl_82 AND and_dcpl_27;
  mux_tmp_170 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), and_284_cse);
  not_tmp_130 <= NOT(and_284_cse OR (fsm_output(4)));
  mux_tmp_171 <= MUX_s_1_2_2(not_tmp_130, mux_tmp_170, and_192_cse);
  and_dcpl_85 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  nor_tmp_57 <= (and_192_cse OR CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")))
      AND (fsm_output(4));
  mux_tmp_172 <= MUX_s_1_2_2((NOT and_dcpl_50), nor_tmp_57, fsm_output(5));
  or_tmp_230 <= (fsm_output(7)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4)))
      OR (NOT (fsm_output(1))) OR (fsm_output(6));
  or_266_nl <= (fsm_output(5)) OR (or_57_cse AND (fsm_output(3))) OR (fsm_output(4));
  mux_tmp_177 <= MUX_s_1_2_2((NOT and_285_cse), or_266_nl, fsm_output(6));
  mux_tmp_178 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(3));
  mux_tmp_179 <= MUX_s_1_2_2(and_dcpl_29, mux_tmp_178, fsm_output(2));
  mux_tmp_180 <= MUX_s_1_2_2(not_tmp_130, mux_tmp_179, fsm_output(1));
  nor_tmp_61 <= or_574_cse AND (fsm_output(4));
  mux_tmp_181 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), or_574_cse);
  mux_tmp_183 <= MUX_s_1_2_2(mux_tmp_178, and_190_cse, fsm_output(2));
  mux_tmp_184 <= MUX_s_1_2_2(mux_tmp_183, nor_tmp_61, fsm_output(1));
  mux_182_nl <= MUX_s_1_2_2(mux_tmp_181, nor_tmp_61, fsm_output(1));
  mux_185_itm <= MUX_s_1_2_2(mux_tmp_184, mux_182_nl, fsm_output(0));
  nor_183_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (fsm_output(0)) OR
      (NOT (fsm_output(7))));
  and_231_nl <= (fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(0)) AND (NOT
      (fsm_output(7)));
  mux_187_nl <= MUX_s_1_2_2(nor_183_nl, and_231_nl, fsm_output(2));
  and_230_nl <= (NOT((fsm_output(8)) OR (fsm_output(3)) OR (NOT (fsm_output(5)))))
      AND mux_187_nl;
  nor_184_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4)))
      OR (fsm_output(6)) OR (fsm_output(0)) OR (NOT (fsm_output(7))));
  nor_185_nl <= NOT((fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(4)) OR (NOT
      (fsm_output(6))) OR (NOT (fsm_output(0))) OR (fsm_output(7)));
  mux_186_nl <= MUX_s_1_2_2(nor_184_nl, nor_185_nl, fsm_output(3));
  and_232_nl <= (fsm_output(8)) AND mux_186_nl;
  not_tmp_144 <= MUX_s_1_2_2(and_230_nl, and_232_nl, fsm_output(1));
  or_tmp_251 <= (fsm_output(5)) OR (or_540_cse AND (fsm_output(3))) OR (fsm_output(4));
  or_tmp_255 <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  or_293_nl <= (NOT (fsm_output(7))) OR (fsm_output(8)) OR (NOT (fsm_output(0)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  or_291_nl <= (fsm_output(7)) OR (NOT (fsm_output(8))) OR (fsm_output(0)) OR (NOT
      (fsm_output(3))) OR (fsm_output(5));
  mux_199_nl <= MUX_s_1_2_2(or_293_nl, or_291_nl, fsm_output(2));
  nor_180_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR mux_199_nl);
  and_292_nl <= (fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(2)) AND (NOT
      (fsm_output(7))) AND (fsm_output(8)) AND (fsm_output(0)) AND (NOT (fsm_output(3)))
      AND (fsm_output(5));
  not_tmp_152 <= MUX_s_1_2_2(nor_180_nl, and_292_nl, fsm_output(1));
  nor_tmp_68 <= ((or_278_cse AND (fsm_output(2))) OR (fsm_output(3))) AND (fsm_output(4));
  and_tmp_13 <= (fsm_output(5)) AND nor_tmp_68;
  or_dcpl_31 <= (and_284_cse AND or_278_cse) OR (fsm_output(4));
  and_dcpl_98 <= and_dcpl_26 AND and_dcpl_64;
  and_dcpl_100 <= and_dcpl_85 AND (fsm_output(8));
  or_tmp_268 <= ((and_192_cse OR (fsm_output(2))) AND (fsm_output(3))) OR (fsm_output(4));
  or_tmp_269 <= (fsm_output(5)) OR or_tmp_268;
  mux_204_itm <= MUX_s_1_2_2(not_tmp_130, mux_tmp_179, and_192_cse);
  mux_207_nl <= MUX_s_1_2_2((fsm_output(3)), (NOT (fsm_output(3))), or_57_cse);
  nor_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(3)));
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, nor_nl, fsm_output(0));
  and_dcpl_110 <= mux_208_nl AND (NOT (fsm_output(4))) AND and_dcpl_27;
  and_dcpl_111 <= and_dcpl_30 AND and_dcpl_70;
  nor_175_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(3))) OR (fsm_output(4)));
  nor_176_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (fsm_output(4))));
  mux_210_nl <= MUX_s_1_2_2(nor_175_nl, nor_176_nl, fsm_output(5));
  and_dcpl_116 <= mux_210_nl AND (NOT (fsm_output(2))) AND (fsm_output(1)) AND (NOT
      (fsm_output(6))) AND and_dcpl_25;
  or_tmp_285 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("101"));
  or_tmp_291 <= (fsm_output(6)) OR and_tmp_13;
  and_dcpl_122 <= and_dcpl_41 AND (NOT (fsm_output(2))) AND and_192_cse AND and_dcpl_40;
  nand_57_cse <= NOT((fsm_output(1)) AND (fsm_output(8)));
  and_216_nl <= (fsm_output(6)) AND (fsm_output(1)) AND (fsm_output(8));
  nor_166_nl <= NOT((fsm_output(6)) OR (fsm_output(1)) OR (fsm_output(8)));
  mux_229_nl <= MUX_s_1_2_2(and_216_nl, nor_166_nl, fsm_output(0));
  and_215_nl <= (fsm_output(2)) AND (fsm_output(4)) AND mux_229_nl;
  nor_167_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6))
      OR (fsm_output(1)) OR (fsm_output(8)));
  mux_230_nl <= MUX_s_1_2_2(and_215_nl, nor_167_nl, fsm_output(7));
  and_214_nl <= (fsm_output(5)) AND mux_230_nl;
  nor_168_nl <= NOT((fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(4))
      OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR nand_57_cse);
  not_tmp_185 <= MUX_s_1_2_2(and_214_nl, nor_168_nl, fsm_output(3));
  nand_56_cse <= NOT((fsm_output(0)) AND (fsm_output(7)));
  or_353_cse <= (fsm_output(3)) OR (NOT (fsm_output(5))) OR (fsm_output(0)) OR (fsm_output(7));
  nor_163_nl <= NOT((fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(3)) OR (NOT((fsm_output(5))
      AND (fsm_output(0)) AND (fsm_output(7)))));
  nor_164_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))) OR (fsm_output(0)) OR (fsm_output(7)));
  mux_233_nl <= MUX_s_1_2_2(nor_163_nl, nor_164_nl, fsm_output(2));
  and_213_nl <= (fsm_output(8)) AND mux_233_nl;
  or_352_nl <= (NOT (fsm_output(3))) OR (fsm_output(5)) OR nand_56_cse;
  mux_232_nl <= MUX_s_1_2_2(or_353_cse, or_352_nl, fsm_output(1));
  nor_165_nl <= NOT((fsm_output(8)) OR (fsm_output(2)) OR (fsm_output(4)) OR mux_232_nl);
  not_tmp_191 <= MUX_s_1_2_2(and_213_nl, nor_165_nl, fsm_output(6));
  or_tmp_330 <= (fsm_output(4)) OR (fsm_output(2)) OR (fsm_output(1)) OR (NOT (fsm_output(8)))
      OR (fsm_output(7));
  or_tmp_334 <= (NOT (fsm_output(4))) OR (NOT (fsm_output(2))) OR (fsm_output(1))
      OR (fsm_output(8)) OR (NOT (fsm_output(7)));
  mux_242_nl <= MUX_s_1_2_2(or_tmp_330, or_tmp_334, fsm_output(6));
  or_366_nl <= (NOT (fsm_output(4))) OR (fsm_output(2)) OR (NOT (fsm_output(1)))
      OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_241_nl <= MUX_s_1_2_2(or_tmp_334, or_366_nl, fsm_output(6));
  mux_243_nl <= MUX_s_1_2_2(mux_242_nl, mux_241_nl, fsm_output(0));
  and_212_nl <= (fsm_output(5)) AND (NOT mux_243_nl);
  or_545_nl <= (fsm_output(2)) OR nand_cse;
  nand_52_nl <= NOT((fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(8)) AND (fsm_output(7)));
  mux_238_nl <= MUX_s_1_2_2(or_545_nl, nand_52_nl, fsm_output(4));
  mux_239_nl <= MUX_s_1_2_2(or_tmp_330, mux_238_nl, fsm_output(6));
  nand_53_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11")));
  mux_235_nl <= MUX_s_1_2_2(or_tmp_7, nand_53_nl, fsm_output(1));
  or_362_nl <= (fsm_output(2)) OR mux_235_nl;
  or_360_nl <= (NOT (fsm_output(2))) OR (fsm_output(1)) OR (fsm_output(8)) OR (NOT
      (fsm_output(7)));
  mux_236_nl <= MUX_s_1_2_2(or_362_nl, or_360_nl, fsm_output(4));
  nand_54_nl <= NOT((fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(8))
      AND (NOT (fsm_output(7))));
  mux_237_nl <= MUX_s_1_2_2(mux_236_nl, nand_54_nl, fsm_output(6));
  mux_240_nl <= MUX_s_1_2_2(mux_239_nl, mux_237_nl, fsm_output(0));
  nor_162_nl <= NOT((fsm_output(5)) OR mux_240_nl);
  not_tmp_201 <= MUX_s_1_2_2(and_212_nl, nor_162_nl, fsm_output(3));
  mux_tmp_257 <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(7));
  nor_tmp_87 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  mux_tmp_258 <= MUX_s_1_2_2(nor_tmp_87, mux_tmp_257, fsm_output(8));
  or_tmp_349 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_351 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_265 <= MUX_s_1_2_2((fsm_output(7)), nor_tmp_87, fsm_output(8));
  or_tmp_353 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_268 <= MUX_s_1_2_2((NOT or_tmp_353), or_tmp_349, fsm_output(8));
  mux_269_itm <= MUX_s_1_2_2(or_tmp_349, (fsm_output(7)), fsm_output(8));
  nor_156_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(0)) OR (fsm_output(7)) OR
      (fsm_output(1)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4))) OR (fsm_output(6))
      OR (NOT (fsm_output(8))));
  or_393_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (fsm_output(4))
      OR (NOT (fsm_output(6))) OR (fsm_output(8));
  nor_158_nl <= NOT((fsm_output(2)) OR (fsm_output(4)) OR (NOT (fsm_output(6))) OR
      (fsm_output(8)));
  and_291_nl <= (fsm_output(2)) AND (fsm_output(4)) AND (NOT (fsm_output(6))) AND
      (fsm_output(8));
  mux_290_nl <= MUX_s_1_2_2(nor_158_nl, and_291_nl, fsm_output(1));
  nand_33_nl <= NOT((fsm_output(7)) AND mux_290_nl);
  mux_291_nl <= MUX_s_1_2_2(or_393_nl, nand_33_nl, fsm_output(0));
  nor_157_nl <= NOT((fsm_output(5)) OR mux_291_nl);
  not_tmp_215 <= MUX_s_1_2_2(nor_156_nl, nor_157_nl, fsm_output(3));
  and_dcpl_145 <= and_dcpl_42 AND and_dcpl_36 AND and_dcpl_40;
  or_dcpl_40 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("011")) OR
      or_278_cse;
  or_dcpl_42 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_43 <= or_dcpl_42 OR or_tmp_2;
  not_tmp_227 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))
      OR and_tmp_13);
  mux_325_nl <= MUX_s_1_2_2(not_tmp_130, nor_tmp_61, fsm_output(5));
  mux_326_nl <= MUX_s_1_2_2(mux_325_nl, (NOT and_285_cse), fsm_output(6));
  or_430_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR and_dcpl_50;
  mux_tmp_327 <= MUX_s_1_2_2(mux_326_nl, or_430_nl, fsm_output(7));
  nand_98_nl <= NOT((fsm_output(5)) AND (CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000"))));
  mux_tmp_328 <= MUX_s_1_2_2(nand_98_nl, or_tmp_251, fsm_output(6));
  mux_tmp_335 <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(8));
  or_444_nl <= (fsm_output(8)) OR (NOT (fsm_output(6)));
  mux_tmp_345 <= MUX_s_1_2_2(or_444_nl, mux_tmp_335, fsm_output(7));
  and_dcpl_152 <= and_dcpl_71 AND and_dcpl_40;
  or_445_nl <= (fsm_output(5)) OR and_dcpl_50;
  mux_351_nl <= MUX_s_1_2_2((NOT and_285_cse), or_445_nl, fsm_output(6));
  mux_352_nl <= MUX_s_1_2_2(mux_351_nl, mux_tmp_328, fsm_output(7));
  mux_353_itm <= MUX_s_1_2_2(mux_352_nl, mux_tmp_327, fsm_output(8));
  nor_263_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  nor_146_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(8)) OR (fsm_output(2)) OR
      (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(0)) OR (fsm_output(3)) OR
      (NOT (fsm_output(5))));
  nor_147_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR (NOT (fsm_output(0))) OR
      (NOT (fsm_output(3))) OR (fsm_output(5)));
  nor_148_nl <= NOT((NOT (fsm_output(4))) OR (NOT (fsm_output(6))) OR (fsm_output(0))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  mux_354_nl <= MUX_s_1_2_2(nor_147_nl, nor_148_nl, fsm_output(2));
  and_199_nl <= nor_263_cse AND mux_354_nl;
  not_tmp_245 <= MUX_s_1_2_2(nor_146_nl, and_199_nl, fsm_output(1));
  or_460_nl <= (NOT (fsm_output(8))) OR (fsm_output(0)) OR (fsm_output(3)) OR (NOT
      (fsm_output(5))) OR (fsm_output(7));
  nand_82_nl <= NOT((fsm_output(0)) AND (fsm_output(3)) AND (NOT (fsm_output(5)))
      AND (fsm_output(7)));
  mux_358_nl <= MUX_s_1_2_2(or_353_cse, nand_82_nl, fsm_output(8));
  mux_359_nl <= MUX_s_1_2_2(or_460_nl, mux_358_nl, fsm_output(1));
  nor_142_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR mux_359_nl);
  not_tmp_250 <= MUX_s_1_2_2(nor_143_cse, nor_142_nl, fsm_output(2));
  nor_tmp_104 <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1111"));
  and_dcpl_155 <= (NOT (fsm_output(3))) AND (fsm_output(5));
  not_tmp_252 <= NOT((fsm_output(1)) AND (fsm_output(2)) AND (fsm_output(4)));
  not_tmp_253 <= NOT((fsm_output(2)) AND (fsm_output(4)));
  or_dcpl_47 <= or_tmp_285 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"));
  or_dcpl_49 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_52 <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  or_dcpl_53 <= or_dcpl_52 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_37 AND and_dcpl_35;
  VEC_LOOP_j_sva_11_0_mx0c1 <= and_dcpl_111 AND and_dcpl_35;
  nor_172_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"))
      OR or_tmp_268);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_172_nl, and_tmp_6, fsm_output(8));
  or_384_cse <= (NOT (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(6));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(STAGE_LOOP_i_3_0_sva_2(3
      DOWNTO 1)) + SIGNED'( "011"), 3));
  STAGE_LOOP_acc_itm_2_1 <= STAGE_LOOP_acc_nl(2);
  and_181_m1c <= and_dcpl_82 AND and_dcpl_98;
  and_66_nl <= and_dcpl_56 AND and_dcpl_26 AND and_dcpl_52;
  or_137_nl <= (NOT (fsm_output(5))) OR (fsm_output(0)) OR (NOT nor_tmp_40);
  or_135_nl <= (fsm_output(5)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(8)))
      OR (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(6));
  mux_110_nl <= MUX_s_1_2_2(or_137_nl, or_135_nl, fsm_output(3));
  nor_238_nl <= NOT((fsm_output(7)) OR mux_110_nl);
  nor_239_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(2))) OR (NOT (fsm_output(4)))
      OR (fsm_output(6)));
  mux_109_nl <= MUX_s_1_2_2(nor_239_nl, nor_tmp_40, fsm_output(0));
  and_257_nl <= (fsm_output(7)) AND (fsm_output(3)) AND (NOT (fsm_output(5))) AND
      mux_109_nl;
  mux_111_nl <= MUX_s_1_2_2(nor_238_nl, and_257_nl, fsm_output(1));
  and_70_nl <= not_tmp_90 AND (fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(0))
      AND and_dcpl_52;
  and_77_nl <= not_tmp_90 AND (NOT (fsm_output(4))) AND (NOT (fsm_output(2))) AND
      (NOT (fsm_output(0))) AND and_dcpl_64;
  mux_113_nl <= MUX_s_1_2_2(or_tmp_113, or_tmp_111, fsm_output(7));
  and_84_nl <= (NOT mux_113_nl) AND (fsm_output(0)) AND (fsm_output(6)) AND (fsm_output(8));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_10_7_2(COMP_LOOP_acc_psp_sva_1, (z_out_1(12
      DOWNTO 3)), COMP_LOOP_acc_psp_sva, (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO
      2)), (COMP_LOOP_acc_1_cse_2_sva(11 DOWNTO 2)), (COMP_LOOP_acc_11_psp_sva(10
      DOWNTO 1)), (COMP_LOOP_acc_1_cse_sva(11 DOWNTO 2)), STD_LOGIC_VECTOR'( and_dcpl_44
      & COMP_LOOP_or_2_cse & and_66_nl & mux_111_nl & and_70_nl & and_77_nl & and_84_nl));
  vec_rsc_0_0_i_da_d_pff <= modExp_base_1_sva;
  or_153_nl <= (COMP_LOOP_acc_11_psp_sva(0)) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  or_151_nl <= (VEC_LOOP_j_sva_11_0(1)) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  mux_118_nl <= MUX_s_1_2_2(or_153_nl, or_151_nl, fsm_output(1));
  or_154_nl <= (VEC_LOOP_j_sva_11_0(0)) OR mux_118_nl;
  or_150_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  or_149_nl <= CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (NOT (fsm_output(3))) OR (fsm_output(5));
  mux_117_nl <= MUX_s_1_2_2(or_150_nl, or_149_nl, fsm_output(1));
  mux_119_nl <= MUX_s_1_2_2(or_154_nl, mux_117_nl, fsm_output(0));
  nor_231_nl <= NOT((fsm_output(4)) OR mux_119_nl);
  nor_232_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  nor_233_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (fsm_output(8)) OR (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)));
  mux_115_nl <= MUX_s_1_2_2(nor_232_nl, nor_233_nl, fsm_output(1));
  nor_234_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  nor_235_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8))) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_114_nl <= MUX_s_1_2_2(nor_234_nl, nor_235_nl, fsm_output(1));
  mux_116_nl <= MUX_s_1_2_2(mux_115_nl, mux_114_nl, fsm_output(0));
  and_256_nl <= (fsm_output(4)) AND mux_116_nl;
  vec_rsc_0_0_i_wea_d_pff <= MUX_s_1_2_2(nor_231_nl, and_256_nl, fsm_output(2));
  nor_224_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT
      (fsm_output(7))) OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (fsm_output(8))));
  nor_225_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  nor_226_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  nor_227_nl <= NOT((NOT modExp_exp_1_0_1_sva) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  mux_124_nl <= MUX_s_1_2_2(nor_226_nl, nor_227_nl, fsm_output(6));
  mux_125_nl <= MUX_s_1_2_2(nor_225_nl, mux_124_nl, fsm_output(0));
  and_255_nl <= (fsm_output(4)) AND mux_125_nl;
  mux_126_nl <= MUX_s_1_2_2(nor_224_nl, and_255_nl, fsm_output(2));
  and_254_nl <= nor_43_cse AND mux_126_nl;
  or_162_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_160_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(fsm_output(8
      DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_122_nl <= MUX_s_1_2_2(or_162_nl, or_160_nl, fsm_output(6));
  or_163_nl <= (fsm_output(4)) OR (fsm_output(0)) OR mux_122_nl;
  nor_229_nl <= NOT((NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  nor_230_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_121_nl <= MUX_s_1_2_2(nor_229_nl, nor_230_nl, fsm_output(6));
  nand_6_nl <= NOT((fsm_output(4)) AND (fsm_output(0)) AND mux_121_nl);
  mux_123_nl <= MUX_s_1_2_2(or_163_nl, nand_6_nl, fsm_output(2));
  nor_228_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR mux_123_nl);
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_254_nl, nor_228_nl,
      fsm_output(1));
  nor_219_nl <= NOT((COMP_LOOP_acc_11_psp_sva(0)) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_220_nl <= NOT((VEC_LOOP_j_sva_11_0(1)) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_132_nl <= MUX_s_1_2_2(nor_219_nl, nor_220_nl, fsm_output(1));
  nand_10_nl <= NOT((VEC_LOOP_j_sva_11_0(0)) AND mux_132_nl);
  or_178_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  nand_71_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5))));
  mux_131_nl <= MUX_s_1_2_2(or_178_nl, nand_71_nl, fsm_output(1));
  mux_133_nl <= MUX_s_1_2_2(nand_10_nl, mux_131_nl, fsm_output(0));
  nor_218_nl <= NOT((fsm_output(4)) OR mux_133_nl);
  nor_221_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  nor_222_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(8)) OR (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)));
  mux_129_nl <= MUX_s_1_2_2(nor_221_nl, nor_222_nl, fsm_output(1));
  nor_223_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")));
  and_253_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5)));
  mux_128_nl <= MUX_s_1_2_2(nor_223_nl, and_253_nl, fsm_output(1));
  mux_130_nl <= MUX_s_1_2_2(mux_129_nl, mux_128_nl, fsm_output(0));
  and_252_nl <= (fsm_output(4)) AND mux_130_nl;
  vec_rsc_0_1_i_wea_d_pff <= MUX_s_1_2_2(nor_218_nl, and_252_nl, fsm_output(2));
  nor_211_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT
      (fsm_output(7))) OR (z_out_1(2)) OR (NOT((z_out_1(1)) AND (fsm_output(8)))));
  nor_212_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  nor_213_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  nor_214_nl <= NOT((NOT modExp_exp_1_0_1_sva) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  mux_138_nl <= MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output(6));
  mux_139_nl <= MUX_s_1_2_2(nor_212_nl, mux_138_nl, fsm_output(0));
  and_251_nl <= (fsm_output(4)) AND mux_139_nl;
  mux_140_nl <= MUX_s_1_2_2(nor_211_nl, and_251_nl, fsm_output(2));
  and_250_nl <= nor_43_cse AND mux_140_nl;
  or_189_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (COMP_LOOP_acc_11_psp_sva(0))
      OR (NOT (VEC_LOOP_j_sva_11_0(0))) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_187_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(fsm_output(8
      DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_136_nl <= MUX_s_1_2_2(or_189_nl, or_187_nl, fsm_output(6));
  or_190_nl <= (fsm_output(4)) OR (fsm_output(0)) OR mux_136_nl;
  nor_216_nl <= NOT((NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  nor_217_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_135_nl <= MUX_s_1_2_2(nor_216_nl, nor_217_nl, fsm_output(6));
  nand_11_nl <= NOT((fsm_output(4)) AND (fsm_output(0)) AND mux_135_nl);
  mux_137_nl <= MUX_s_1_2_2(or_190_nl, nand_11_nl, fsm_output(2));
  nor_215_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR mux_137_nl);
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_250_nl, nor_215_nl,
      fsm_output(1));
  or_209_nl <= (NOT (COMP_LOOP_acc_11_psp_sva(0))) OR (NOT (fsm_output(8))) OR (fsm_output(7))
      OR (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(5)));
  or_207_nl <= (NOT (VEC_LOOP_j_sva_11_0(1))) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(5));
  mux_146_nl <= MUX_s_1_2_2(or_209_nl, or_207_nl, fsm_output(1));
  or_210_nl <= (VEC_LOOP_j_sva_11_0(0)) OR mux_146_nl;
  or_206_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  nand_69_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5))));
  mux_145_nl <= MUX_s_1_2_2(or_206_nl, nand_69_nl, fsm_output(1));
  mux_147_nl <= MUX_s_1_2_2(or_210_nl, mux_145_nl, fsm_output(0));
  nor_207_nl <= NOT((fsm_output(4)) OR mux_147_nl);
  nor_208_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(3))
      OR (NOT (fsm_output(5))));
  nor_209_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR (fsm_output(8)) OR (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)));
  mux_143_nl <= MUX_s_1_2_2(nor_208_nl, nor_209_nl, fsm_output(1));
  nor_210_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)) OR (NOT (fsm_output(5))) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")));
  and_249_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5)));
  mux_142_nl <= MUX_s_1_2_2(nor_210_nl, and_249_nl, fsm_output(1));
  mux_144_nl <= MUX_s_1_2_2(mux_143_nl, mux_142_nl, fsm_output(0));
  and_248_nl <= (fsm_output(4)) AND mux_144_nl;
  vec_rsc_0_2_i_wea_d_pff <= MUX_s_1_2_2(nor_207_nl, and_248_nl, fsm_output(2));
  nor_200_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT
      (fsm_output(7))) OR CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT (fsm_output(8))));
  nor_201_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  nor_202_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  nor_203_nl <= NOT((NOT modExp_exp_1_0_1_sva) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10")));
  mux_152_nl <= MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output(6));
  mux_153_nl <= MUX_s_1_2_2(nor_201_nl, mux_152_nl, fsm_output(0));
  and_247_nl <= (fsm_output(4)) AND mux_153_nl;
  mux_154_nl <= MUX_s_1_2_2(nor_200_nl, and_247_nl, fsm_output(2));
  and_246_nl <= nor_43_cse AND mux_154_nl;
  or_218_nl <= (NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR (NOT (COMP_LOOP_acc_11_psp_sva(0)))
      OR (VEC_LOOP_j_sva_11_0(0)) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("10"));
  or_216_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(fsm_output(8
      DOWNTO 7)/=STD_LOGIC_VECTOR'("01"));
  mux_150_nl <= MUX_s_1_2_2(or_218_nl, or_216_nl, fsm_output(6));
  or_219_nl <= (fsm_output(4)) OR (fsm_output(0)) OR mux_150_nl;
  nor_205_nl <= NOT((NOT COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm) OR CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("01")));
  nor_206_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_149_nl <= MUX_s_1_2_2(nor_205_nl, nor_206_nl, fsm_output(6));
  nand_15_nl <= NOT((fsm_output(4)) AND (fsm_output(0)) AND mux_149_nl);
  mux_151_nl <= MUX_s_1_2_2(or_219_nl, nand_15_nl, fsm_output(2));
  nor_204_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR mux_151_nl);
  vec_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_246_nl, nor_204_nl,
      fsm_output(1));
  nor_195_nl <= NOT((NOT (COMP_LOOP_acc_11_psp_sva(0))) OR (NOT (fsm_output(8)))
      OR (fsm_output(7)) OR (NOT (fsm_output(6))) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  nor_196_nl <= NOT((NOT (VEC_LOOP_j_sva_11_0(1))) OR (fsm_output(8)) OR (NOT (fsm_output(7)))
      OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  mux_160_nl <= MUX_s_1_2_2(nor_195_nl, nor_196_nl, fsm_output(1));
  nand_19_nl <= NOT((VEC_LOOP_j_sva_11_0(0)) AND mux_160_nl);
  or_235_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (NOT (fsm_output(8))) OR (fsm_output(7)) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5));
  nand_67_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5))));
  mux_159_nl <= MUX_s_1_2_2(or_235_nl, nand_67_nl, fsm_output(1));
  mux_161_nl <= MUX_s_1_2_2(nand_19_nl, mux_159_nl, fsm_output(0));
  nor_194_nl <= NOT((fsm_output(4)) OR mux_161_nl);
  and_293_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(8)) AND (NOT (fsm_output(7))) AND (fsm_output(6)) AND (NOT
      (fsm_output(3))) AND (fsm_output(5));
  nor_198_nl <= NOT(CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(8)) OR (NOT (fsm_output(7))) OR (fsm_output(6)) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)));
  mux_157_nl <= MUX_s_1_2_2(and_293_nl, nor_198_nl, fsm_output(1));
  nor_199_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(7))) OR (NOT (fsm_output(6)))
      OR (fsm_output(3)) OR (NOT((fsm_output(5)) AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")))));
  and_245_nl <= CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(8)) AND (fsm_output(7)) AND (fsm_output(6)) AND (fsm_output(3))
      AND (NOT (fsm_output(5)));
  mux_156_nl <= MUX_s_1_2_2(nor_199_nl, and_245_nl, fsm_output(1));
  mux_158_nl <= MUX_s_1_2_2(mux_157_nl, mux_156_nl, fsm_output(0));
  and_244_nl <= (fsm_output(4)) AND mux_158_nl;
  vec_rsc_0_3_i_wea_d_pff <= MUX_s_1_2_2(nor_194_nl, and_244_nl, fsm_output(2));
  nor_188_nl <= NOT((fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(6)) OR (NOT((fsm_output(7))
      AND CONV_SL_1_1(z_out_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND (fsm_output(8)))));
  nor_189_nl <= NOT((fsm_output(6)) OR CONV_SL_1_1(VEC_LOOP_j_sva_11_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  and_294_nl <= CONV_SL_1_1(z_out_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(fsm_output(8
      DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_295_nl <= modExp_exp_1_0_1_sva AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  mux_166_nl <= MUX_s_1_2_2(and_294_nl, and_295_nl, fsm_output(6));
  mux_167_nl <= MUX_s_1_2_2(nor_189_nl, mux_166_nl, fsm_output(0));
  and_242_nl <= (fsm_output(4)) AND mux_167_nl;
  mux_168_nl <= MUX_s_1_2_2(nor_188_nl, and_242_nl, fsm_output(2));
  and_241_nl <= nor_43_cse AND mux_168_nl;
  nand_85_nl <= NOT(COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm AND (COMP_LOOP_acc_11_psp_sva(0))
      AND (VEC_LOOP_j_sva_11_0(0)) AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10")));
  nand_66_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01")));
  mux_164_nl <= MUX_s_1_2_2(nand_85_nl, nand_66_nl, fsm_output(6));
  or_247_nl <= (fsm_output(4)) OR (fsm_output(0)) OR mux_164_nl;
  and_243_nl <= COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm AND CONV_SL_1_1(COMP_LOOP_acc_1_cse_2_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  nor_193_nl <= NOT(CONV_SL_1_1(z_out_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("11")) OR
      CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_163_nl <= MUX_s_1_2_2(and_243_nl, nor_193_nl, fsm_output(6));
  nand_20_nl <= NOT((fsm_output(4)) AND (fsm_output(0)) AND mux_163_nl);
  mux_165_nl <= MUX_s_1_2_2(or_247_nl, nand_20_nl, fsm_output(2));
  nor_192_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR mux_165_nl);
  vec_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= MUX_s_1_2_2(and_241_nl, nor_192_nl,
      fsm_output(1));
  and_dcpl_170 <= and_dcpl_85 AND (fsm_output(5)) AND (NOT((fsm_output(3)) OR (fsm_output(1))));
  and_dcpl_175 <= and_dcpl_170 AND (NOT (fsm_output(0))) AND (fsm_output(2)) AND
      (fsm_output(4)) AND (NOT (fsm_output(8)));
  and_dcpl_178 <= and_203_cse AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("00"));
  and_dcpl_181 <= (NOT (fsm_output(6))) AND (fsm_output(5)) AND (NOT (fsm_output(3)));
  and_dcpl_182 <= and_dcpl_181 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"));
  and_dcpl_183 <= and_dcpl_182 AND and_dcpl_178;
  not_tmp_289 <= NOT((fsm_output(0)) AND (fsm_output(5)));
  nor_287_cse <= NOT((NOT (fsm_output(7))) OR (fsm_output(8)) OR (fsm_output(4))
      OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(3)) OR not_tmp_289);
  nor_288_nl <= NOT((fsm_output(1)) OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR
      (fsm_output(0)) OR (fsm_output(5)));
  nor_289_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(3))
      OR not_tmp_289);
  mux_411_nl <= MUX_s_1_2_2(nor_288_nl, nor_289_nl, fsm_output(4));
  and_nl <= nor_263_cse AND mux_411_nl;
  not_tmp_291 <= MUX_s_1_2_2(nor_287_cse, and_nl, fsm_output(2));
  and_dcpl_186 <= (fsm_output(6)) AND (NOT (fsm_output(5))) AND (fsm_output(3));
  and_dcpl_188 <= and_dcpl_186 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_178;
  and_dcpl_190 <= NOT((fsm_output(2)) OR (fsm_output(4)));
  and_dcpl_194 <= and_dcpl_186 AND and_dcpl_36 AND and_dcpl_190 AND CONV_SL_1_1(fsm_output(8
      DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_199 <= and_dcpl_181 AND and_dcpl_70 AND and_203_cse AND CONV_SL_1_1(fsm_output(8
      DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_201 <= and_dcpl_190 AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_202 <= and_dcpl_182 AND and_dcpl_201;
  and_dcpl_206 <= (fsm_output(6)) AND (fsm_output(5)) AND (NOT (fsm_output(3))) AND
      and_dcpl_70 AND and_dcpl_201;
  and_dcpl_208 <= and_dcpl_181 AND and_dcpl_36 AND and_dcpl_178;
  and_dcpl_212 <= (fsm_output(0)) AND (fsm_output(2));
  and_dcpl_227 <= (fsm_output(5)) AND (NOT (fsm_output(3))) AND (NOT (fsm_output(1)));
  and_dcpl_242 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("10100"))
      AND and_dcpl_39 AND and_dcpl_25;
  and_dcpl_249 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"))
      AND and_dcpl_45 AND and_dcpl_25;
  and_dcpl_252 <= NOT((fsm_output(0)) OR (fsm_output(4)));
  and_dcpl_254 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("101"));
  and_dcpl_255 <= and_dcpl_254 AND and_dcpl_252;
  and_dcpl_256 <= and_dcpl_255 AND and_dcpl_45 AND CONV_SL_1_1(fsm_output(8 DOWNTO
      7)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_258 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("00")) AND
      and_dcpl_25;
  and_dcpl_261 <= and_dcpl_254 AND (fsm_output(0)) AND (NOT (fsm_output(4))) AND
      and_dcpl_258;
  and_dcpl_267 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("000")) AND
      and_dcpl_252 AND and_dcpl_39 AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_268 <= and_dcpl_255 AND and_dcpl_258;
  operator_64_false_1_or_ssc <= and_dcpl_188 OR and_dcpl_194 OR and_dcpl_199 OR and_dcpl_202
      OR and_dcpl_206;
  COMP_LOOP_or_ssc <= and_dcpl_261 OR and_dcpl_267 OR and_dcpl_268;
  nor_tmp <= (fsm_output(8)) AND (fsm_output(6));
  mux_tmp_413 <= MUX_s_1_2_2(mux_tmp_335, nor_tmp, fsm_output(0));
  or_tmp_497 <= (fsm_output(7)) OR nand_57_cse;
  operator_64_false_1_or_itm <= not_tmp_291 OR and_dcpl_208;
  COMP_LOOP_or_20_itm <= and_dcpl_249 OR and_dcpl_256;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_73 = '0' ) THEN
        p_sva <= p_rsci_idat;
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
      IF ( not_tmp_73 = '0' ) THEN
        r_sva <= r_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= '0';
        operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm <= STD_LOGIC_VECTOR'(
            "0000000000000000000000000000000000000000000000000000000000000000");
        modExp_exp_1_0_1_sva <= '0';
        modExp_exp_1_0_1_sva_1 <= '0';
        modExp_exp_1_7_1_sva <= '0';
        modExp_exp_1_1_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_3_obj_ld_cse <= and_dcpl_37 AND and_dcpl_2 AND CONV_SL_1_1(fsm_output(8
            DOWNTO 7)=STD_LOGIC_VECTOR'("11")) AND (NOT STAGE_LOOP_acc_itm_2_1);
        operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm <= operator_66_true_div_cmp_z(63
            DOWNTO 0);
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_14_nl AND (mux_293_nl OR (NOT (fsm_output(0)))
            OR (fsm_output(6)) OR (fsm_output(7)))) OR (mux_317_nl AND (NOT (fsm_output(3)))
            AND (NOT (fsm_output(0))) AND (fsm_output(5)));
        modExp_exp_1_0_1_sva_1 <= (COMP_LOOP_mux_19_nl AND (mux_324_nl OR (fsm_output(3))
            OR (fsm_output(1)) OR (NOT (fsm_output(5))) OR (fsm_output(6)) OR (fsm_output(8))))
            OR mux_350_nl;
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_22_nl AND (NOT mux_357_nl);
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_39_nl AND (NOT(and_dcpl_49 AND and_dcpl_36
            AND and_dcpl_46));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_18_2(z_out_4, modExp_while_if_mul_mut,
          modExp_while_mul_itm, COMP_LOOP_1_modExp_1_while_if_mul_mut, COMP_LOOP_1_modExp_1_while_mul_itm,
          COMP_LOOP_1_mul_mut, COMP_LOOP_1_acc_5_mut_mx0w7, COMP_LOOP_1_acc_5_mut,
          operator_64_false_acc_mut_63_0, COMP_LOOP_2_modExp_1_while_mul_mut, COMP_LOOP_2_modExp_1_while_if_mul_itm,
          COMP_LOOP_2_mul_mut, COMP_LOOP_3_modExp_1_while_mul_mut, COMP_LOOP_3_modExp_1_while_if_mul_itm,
          COMP_LOOP_3_mul_mut, COMP_LOOP_4_modExp_1_while_mul_mut, COMP_LOOP_4_modExp_1_while_if_mul_itm,
          COMP_LOOP_4_mul_mut, STD_LOGIC_VECTOR'( modulo_result_or_nl & and_93_nl
          & and_96_nl & and_98_nl & and_99_nl & and_101_nl & not_tmp_144 & (NOT mux_193_nl)
          & (NOT mux_198_nl) & and_106_nl & and_108_nl & and_111_nl & and_113_nl
          & and_117_nl & and_118_nl & and_119_nl & and_121_nl & and_122_nl));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(operator_64_false_acc_mut_mx0w0,
          (operator_64_false_acc_mut_64 & operator_64_false_acc_mut_63_0), and_dcpl_110);
      operator_66_true_div_cmp_b_9_0 <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_110);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_177_nl, and_tmp_6, fsm_output(8))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_424_nl, (NOT mux_413_nl), fsm_output(7))) = '1' ) THEN
        operator_64_false_acc_mut_64 <= operator_64_false_mux1h_1_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_315_nl, mux_429_nl, fsm_output(5))) = '1' ) THEN
        operator_64_false_acc_mut_63_0 <= operator_64_false_mux1h_1_rgt(63 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (and_dcpl_116 OR VEC_LOOP_j_sva_11_0_mx0c1) = '1' ) THEN
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
      ELSIF ( (NOT(mux_435_nl OR (fsm_output(2)))) = '1' ) THEN
        COMP_LOOP_k_9_2_sva_6_0 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_3(6
            DOWNTO 0)), or_601_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_while_and_3 OR modExp_while_and_5 OR modExp_result_sva_mx0c0
          OR (NOT mux_227_nl)) AND (modExp_result_sva_mx0c0 OR modExp_result_and_rgt
          OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8, STD_LOGIC_VECTOR'( modExp_result_sva_mx0c0
            & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_255_nl, mux_251_nl, fsm_output(5))) = '1' ) THEN
        modExp_base_1_sva <= MUX1HOT_v_64_8_2(r_sva, modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8,
            modExp_result_sva, vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, vec_rsc_0_2_i_qa_d,
            vec_rsc_0_3_i_qa_d, STD_LOGIC_VECTOR'( and_141_nl & r_or_nl & r_or_1_nl
            & not_tmp_185 & and_146_nl & and_148_nl & and_150_nl & and_152_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_1_acc_5_mut <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((modExp_while_and_3 OR modExp_while_and_5 OR and_dcpl_116 OR not_tmp_185
          OR not_tmp_144) AND mux_289_nl) = '1' ) THEN
        COMP_LOOP_1_acc_5_mut <= MUX1HOT_v_64_5_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            modulo_result_rem_cmp_z, modulo_qr_sva_1_mx0w8, COMP_LOOP_1_acc_5_mut_mx0w7,
            STD_LOGIC_VECTOR'( and_dcpl_116 & not_tmp_185 & COMP_LOOP_and_nl & COMP_LOOP_and_1_nl
            & not_tmp_144));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_318_nl) AND and_dcpl_27)) = '1' ) THEN
        modExp_while_if_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_83 OR and_dcpl_145 OR and_dcpl_77) = '1' ) THEN
        exit_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_3(63))),
            (NOT (z_out_1(8))), (NOT (COMP_LOOP_1_acc_nl(9))), STD_LOGIC_VECTOR'(
            and_dcpl_83 & and_dcpl_145 & and_dcpl_77));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_40 OR or_71_cse OR or_tmp_2)) = '1' ) THEN
        modExp_while_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_285 OR or_278_cse OR or_dcpl_43)) = '1' ) THEN
        COMP_LOOP_acc_psp_sva <= COMP_LOOP_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (NOT(mux_321_nl AND (NOT (fsm_output(8))))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_11_psp_sva <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_227, or_425_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_acc_11_psp_sva <= z_out_3(10 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_227, and_166_nl, fsm_output(8))) = '1' ) THEN
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
        modExp_exp_1_5_1_sva <= '0';
        modExp_exp_1_4_1_sva <= '0';
        modExp_exp_1_3_1_sva <= '0';
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( mux_353_itm = '1' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(4)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(5)), STD_LOGIC_VECTOR'( and_dcpl_152 & not_tmp_250
            & not_tmp_245));
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(3)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(4)), STD_LOGIC_VECTOR'( and_dcpl_152 & not_tmp_250
            & not_tmp_245));
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(2)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(3)), STD_LOGIC_VECTOR'( and_dcpl_152 & not_tmp_250
            & not_tmp_245));
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(1)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(2)), STD_LOGIC_VECTOR'( and_dcpl_152 & not_tmp_250
            & not_tmp_245));
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_2_sva_6_0(0)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_2_sva_6_0(1)), STD_LOGIC_VECTOR'( and_dcpl_152 & not_tmp_250
            & not_tmp_245));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_391_nl AND and_dcpl_25)) = '1' ) THEN
        COMP_LOOP_1_modExp_1_while_if_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_47 OR or_dcpl_43)) = '1' ) THEN
        COMP_LOOP_1_modExp_1_while_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_2_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_1(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_51 OR not_tmp_152 OR and_dcpl_63) = '1' ) THEN
        COMP_LOOP_2_slc_COMP_LOOP_acc_9_itm <= MUX_s_1_2_2((z_out_3(9)), (z_out_1(8)),
            not_tmp_152);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_53 OR or_dcpl_49 OR or_tmp_2)) = '1' ) THEN
        COMP_LOOP_1_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_53 OR or_dcpl_42 OR or_tmp_7)) = '1' ) THEN
        COMP_LOOP_2_modExp_1_while_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_398_nl) AND and_dcpl_52)) = '1' ) THEN
        COMP_LOOP_2_modExp_1_while_if_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_40 OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"))
          OR or_tmp_7)) = '1' ) THEN
        COMP_LOOP_2_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_40 OR or_71_cse OR or_tmp_43)) = '1' ) THEN
        COMP_LOOP_3_modExp_1_while_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_399_nl) AND and_dcpl_100)) = '1' ) THEN
        COMP_LOOP_3_modExp_1_while_if_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_47 OR or_dcpl_42 OR or_tmp_43)) = '1' ) THEN
        COMP_LOOP_3_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_47 OR or_dcpl_49 OR or_tmp_43)) = '1' ) THEN
        COMP_LOOP_4_modExp_1_while_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_400_nl AND (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_4_modExp_1_while_if_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_52 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))
          OR or_dcpl_42 OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("11"))))
          = '1' ) THEN
        COMP_LOOP_4_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  or_263_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(1))
      OR (NOT (fsm_output(6)));
  mux_174_nl <= MUX_s_1_2_2(or_tmp_230, or_263_nl, fsm_output(0));
  or_261_nl <= (NOT (fsm_output(7))) OR (fsm_output(2)) OR (fsm_output(4)) OR (NOT
      (fsm_output(1))) OR (fsm_output(6));
  mux_173_nl <= MUX_s_1_2_2(or_261_nl, or_tmp_230, fsm_output(0));
  mux_175_nl <= MUX_s_1_2_2(mux_174_nl, mux_173_nl, fsm_output(8));
  and_236_nl <= (fsm_output(5)) AND (NOT mux_175_nl);
  nor_186_nl <= NOT((fsm_output(5)) OR (fsm_output(8)) OR (fsm_output(0)) OR (NOT
      (fsm_output(7))) OR (NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(1))
      OR (NOT (fsm_output(6))));
  mux_176_nl <= MUX_s_1_2_2(and_236_nl, nor_186_nl, fsm_output(3));
  modulo_result_or_nl <= and_dcpl_83 OR mux_176_nl OR not_tmp_152;
  and_93_nl <= (NOT mux_tmp_171) AND and_dcpl_27;
  and_96_nl <= (NOT mux_tmp_172) AND and_dcpl_85 AND (NOT (fsm_output(8)));
  and_98_nl <= (NOT mux_tmp_177) AND and_dcpl_25;
  and_99_nl <= (NOT mux_tmp_180) AND and_dcpl_46;
  and_101_nl <= (NOT mux_185_itm) AND and_dcpl_2 AND and_dcpl_25;
  nand_62_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND
      ((CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))) OR (fsm_output(3)))
      AND (fsm_output(4)));
  mux_190_nl <= MUX_s_1_2_2(mux_tmp_181, nor_tmp_61, or_278_cse);
  nand_26_nl <= NOT((fsm_output(5)) AND (NOT mux_190_nl));
  mux_191_nl <= MUX_s_1_2_2(or_tmp_251, nand_26_nl, fsm_output(6));
  mux_192_nl <= MUX_s_1_2_2(nand_62_nl, mux_191_nl, fsm_output(7));
  or_277_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR mux_tmp_171;
  mux_189_nl <= MUX_s_1_2_2(or_277_nl, mux_tmp_177, fsm_output(7));
  mux_193_nl <= MUX_s_1_2_2(mux_192_nl, mux_189_nl, fsm_output(8));
  mux_196_nl <= MUX_s_1_2_2(not_tmp_130, mux_tmp_179, or_278_cse);
  nor_182_nl <= NOT((fsm_output(5)) OR mux_196_nl);
  and_103_nl <= (fsm_output(5)) AND nor_tmp_61;
  mux_197_nl <= MUX_s_1_2_2(nor_182_nl, and_103_nl, fsm_output(6));
  nand_61_nl <= NOT((fsm_output(7)) AND mux_197_nl);
  mux_194_nl <= MUX_s_1_2_2(or_tmp_255, mux_tmp_172, fsm_output(6));
  or_284_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10")) OR mux_tmp_180;
  mux_195_nl <= MUX_s_1_2_2(mux_194_nl, or_284_nl, fsm_output(7));
  mux_198_nl <= MUX_s_1_2_2(nand_61_nl, mux_195_nl, fsm_output(8));
  and_106_nl <= (NOT mux_185_itm) AND and_dcpl_39 AND and_dcpl_52;
  mux_201_nl <= MUX_s_1_2_2(and_tmp_13, (NOT or_tmp_251), fsm_output(6));
  and_108_nl <= mux_201_nl AND and_dcpl_52;
  and_111_nl <= or_dcpl_31 AND and_dcpl_62;
  and_113_nl <= or_dcpl_31 AND and_dcpl_98;
  and_117_nl <= (NOT(or_574_cse AND (fsm_output(4)))) AND (fsm_output(5)) AND and_dcpl_100;
  nand_59_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111")));
  mux_202_nl <= MUX_s_1_2_2(nand_59_nl, or_tmp_269, fsm_output(6));
  and_118_nl <= (NOT mux_202_nl) AND and_dcpl_64;
  and_222_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)=STD_LOGIC_VECTOR'("1111"));
  nor_179_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))
      OR or_tmp_268);
  mux_203_nl <= MUX_s_1_2_2(and_222_nl, nor_179_nl, fsm_output(7));
  and_119_nl <= mux_203_nl AND (fsm_output(8));
  and_121_nl <= (NOT mux_204_itm) AND and_dcpl_26 AND nor_tmp_4;
  mux_205_nl <= MUX_s_1_2_2(mux_tmp_183, mux_tmp_181, fsm_output(1));
  mux_206_nl <= MUX_s_1_2_2(mux_205_nl, mux_tmp_184, fsm_output(0));
  and_122_nl <= (NOT mux_206_nl) AND and_dcpl_76;
  COMP_LOOP_and_9_nl <= (NOT and_dcpl_122) AND and_dcpl_116;
  mux_313_nl <= MUX_s_1_2_2(nor_tmp_4, or_tmp_7, fsm_output(4));
  or_405_nl <= (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(1));
  mux_311_nl <= MUX_s_1_2_2(or_tmp_43, mux_tmp_55, or_405_nl);
  mux_54_nl <= MUX_s_1_2_2(or_tmp_7, nor_tmp_4, fsm_output(1));
  mux_310_nl <= MUX_s_1_2_2(mux_tmp_55, mux_54_nl, fsm_output(4));
  mux_312_nl <= MUX_s_1_2_2(mux_311_nl, mux_310_nl, fsm_output(2));
  mux_314_nl <= MUX_s_1_2_2((NOT mux_313_nl), mux_312_nl, fsm_output(5));
  and_202_nl <= ((fsm_output(4)) OR (fsm_output(8))) AND (fsm_output(7));
  or_403_nl <= (fsm_output(1)) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  or_402_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(8))) OR (fsm_output(7));
  mux_306_nl <= MUX_s_1_2_2(or_403_nl, or_402_nl, fsm_output(0));
  mux_307_nl <= MUX_s_1_2_2(or_tmp_43, mux_306_nl, and_203_cse);
  mux_308_nl <= MUX_s_1_2_2(and_202_nl, mux_307_nl, fsm_output(5));
  mux_315_nl <= MUX_s_1_2_2(mux_314_nl, mux_308_nl, fsm_output(6));
  mux_61_nl <= MUX_s_1_2_2(nor_tmp_4, mux_tmp_55, and_192_cse);
  mux_302_nl <= MUX_s_1_2_2(mux_61_nl, or_tmp_7, fsm_output(4));
  and_263_nl <= (fsm_output(4)) AND (fsm_output(1)) AND (fsm_output(0));
  mux_300_nl <= MUX_s_1_2_2((NOT or_tmp_7), or_tmp_43, and_263_nl);
  mux_303_nl <= MUX_s_1_2_2((NOT mux_302_nl), mux_300_nl, fsm_output(2));
  mux_299_nl <= MUX_s_1_2_2(mux_tmp_55, nor_tmp_4, fsm_output(4));
  mux_304_nl <= MUX_s_1_2_2(mux_303_nl, mux_299_nl, fsm_output(5));
  mux_294_nl <= MUX_s_1_2_2(nor_tmp_4, or_tmp_43, fsm_output(1));
  or_400_nl <= (fsm_output(4)) OR (fsm_output(0));
  mux_295_nl <= MUX_s_1_2_2(mux_294_nl, (fsm_output(7)), or_400_nl);
  or_399_nl <= ((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(1)) AND (NOT
      (fsm_output(8)))) OR (fsm_output(7));
  mux_296_nl <= MUX_s_1_2_2(mux_295_nl, or_399_nl, fsm_output(2));
  mux_297_nl <= MUX_s_1_2_2(mux_296_nl, or_tmp_43, fsm_output(5));
  mux_305_nl <= MUX_s_1_2_2(mux_304_nl, mux_297_nl, fsm_output(6));
  mux_316_nl <= MUX_s_1_2_2(mux_315_nl, mux_305_nl, fsm_output(3));
  COMP_LOOP_mux1h_14_nl <= MUX1HOT_s_1_6_2((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(0)),
      (COMP_LOOP_1_acc_5_mut(0)), (z_out_1(7)), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva,
      (z_out(7)), STD_LOGIC_VECTOR'( COMP_LOOP_and_9_nl & and_dcpl_122 & and_dcpl_44
      & not_tmp_215 & (NOT mux_316_nl) & and_dcpl_72));
  mux_293_nl <= MUX_s_1_2_2(or_tmp_113, or_tmp_111, fsm_output(8));
  nor_154_nl <= NOT((NOT (fsm_output(7))) OR (fsm_output(6)) OR (fsm_output(1)) OR
      (fsm_output(2)) OR (fsm_output(4)));
  nor_155_nl <= NOT((fsm_output(7)) OR (NOT((fsm_output(6)) AND (fsm_output(1)) AND
      (fsm_output(2)) AND (fsm_output(4)))));
  mux_317_nl <= MUX_s_1_2_2(nor_154_nl, nor_155_nl, fsm_output(8));
  nor_150_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(5)) OR nand_56_cse);
  mux_333_nl <= MUX_s_1_2_2(nor_149_cse, nor_150_nl, fsm_output(1));
  and_200_nl <= (fsm_output(8)) AND (fsm_output(2)) AND (fsm_output(4)) AND mux_333_nl;
  or_433_nl <= (fsm_output(4)) OR (fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(5))
      OR nand_56_cse;
  or_431_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(3)))
      OR (fsm_output(5)) OR (fsm_output(0)) OR (fsm_output(7));
  mux_332_nl <= MUX_s_1_2_2(or_433_nl, or_431_nl, fsm_output(2));
  nor_151_nl <= NOT((fsm_output(8)) OR mux_332_nl);
  mux_334_nl <= MUX_s_1_2_2(and_200_nl, nor_151_nl, fsm_output(6));
  COMP_LOOP_mux_19_nl <= MUX_s_1_2_2(modExp_exp_1_0_1_sva_1, modExp_exp_1_1_1_sva,
      mux_334_nl);
  nand_90_nl <= NOT((fsm_output(0)) AND (fsm_output(2)) AND (fsm_output(4)));
  or_575_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (fsm_output(4));
  mux_324_nl <= MUX_s_1_2_2(nand_90_nl, or_575_nl, fsm_output(7));
  mux_346_nl <= MUX_s_1_2_2(mux_tmp_345, or_376_cse, fsm_output(1));
  mux_347_nl <= MUX_s_1_2_2(mux_346_nl, or_607_cse, fsm_output(2));
  mux_348_nl <= MUX_s_1_2_2(mux_tmp_345, mux_347_nl, fsm_output(3));
  or_442_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(2))) OR (fsm_output(0))
      OR (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_344_nl <= MUX_s_1_2_2(mux_tmp_335, or_607_cse, or_442_nl);
  mux_349_nl <= MUX_s_1_2_2(mux_348_nl, mux_344_nl, fsm_output(4));
  or_440_nl <= (fsm_output(1)) OR (fsm_output(7));
  mux_338_nl <= MUX_s_1_2_2(or_607_cse, or_tmp_32, or_440_nl);
  or_439_nl <= (NOT (fsm_output(1))) OR (fsm_output(7));
  mux_337_nl <= MUX_s_1_2_2((NOT mux_tmp_335), or_tmp_32, or_439_nl);
  mux_339_nl <= MUX_s_1_2_2(mux_338_nl, mux_337_nl, fsm_output(0));
  mux_341_nl <= MUX_s_1_2_2(mux_249_cse, mux_339_nl, fsm_output(2));
  mux_336_nl <= MUX_s_1_2_2((NOT mux_tmp_335), or_tmp_32, fsm_output(7));
  mux_342_nl <= MUX_s_1_2_2(mux_341_nl, mux_336_nl, fsm_output(3));
  mux_343_nl <= MUX_s_1_2_2(mux_249_cse, mux_342_nl, fsm_output(4));
  mux_350_nl <= MUX_s_1_2_2(mux_349_nl, mux_343_nl, fsm_output(5));
  COMP_LOOP_mux1h_22_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(5)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_2_sva_6_0(6)), STD_LOGIC_VECTOR'( and_dcpl_152
      & and_dcpl_145 & (NOT mux_353_itm) & not_tmp_245));
  and_290_nl <= (fsm_output(0)) AND (fsm_output(3)) AND (NOT (fsm_output(5))) AND
      (fsm_output(7));
  mux_356_nl <= MUX_s_1_2_2(nor_149_cse, and_290_nl, fsm_output(1));
  and_198_nl <= (NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR (NOT (fsm_output(8)))))
      AND mux_356_nl;
  mux_357_nl <= MUX_s_1_2_2(nor_143_cse, and_198_nl, fsm_output(2));
  or_464_nl <= (fsm_output(5)) OR nor_tmp_104;
  mux_361_nl <= MUX_s_1_2_2((NOT and_285_cse), or_464_nl, fsm_output(6));
  mux_362_nl <= MUX_s_1_2_2(mux_361_nl, mux_tmp_328, fsm_output(7));
  mux_363_nl <= MUX_s_1_2_2(mux_362_nl, mux_tmp_327, fsm_output(8));
  COMP_LOOP_mux1h_39_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_2_sva_6_0(6)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_2_sva_6_0(0)), STD_LOGIC_VECTOR'( and_dcpl_152
      & not_tmp_250 & (NOT mux_363_nl) & not_tmp_245));
  nor_177_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000000")));
  or_609_nl <= (NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))))
      OR (fsm_output(8)) OR (fsm_output(6));
  or_608_nl <= ((NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))))
      AND (fsm_output(8))) OR (fsm_output(6));
  mux_421_nl <= MUX_s_1_2_2(or_609_nl, or_608_nl, fsm_output(2));
  mux_418_nl <= MUX_s_1_2_2(or_607_cse, or_tmp_32, fsm_output(0));
  mux_419_nl <= MUX_s_1_2_2((fsm_output(6)), mux_418_nl, fsm_output(1));
  mux_420_nl <= MUX_s_1_2_2(mux_419_nl, or_tmp_32, fsm_output(2));
  mux_422_nl <= MUX_s_1_2_2(mux_421_nl, mux_420_nl, fsm_output(3));
  mux_423_nl <= MUX_s_1_2_2(mux_422_nl, or_tmp_32, fsm_output(4));
  mux_415_nl <= MUX_s_1_2_2(or_tmp_32, (NOT mux_tmp_413), fsm_output(1));
  or_605_nl <= (fsm_output(1)) OR (NOT mux_tmp_413);
  mux_416_nl <= MUX_s_1_2_2(mux_415_nl, or_605_nl, fsm_output(2));
  or_606_nl <= (fsm_output(3)) OR mux_416_nl;
  mux_417_nl <= MUX_s_1_2_2(or_tmp_32, or_606_nl, fsm_output(4));
  mux_424_nl <= MUX_s_1_2_2(mux_423_nl, mux_417_nl, fsm_output(5));
  mux_412_nl <= MUX_s_1_2_2((NOT or_tmp_32), mux_tmp_335, or_278_cse);
  and_413_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111")) AND
      mux_412_nl;
  mux_413_nl <= MUX_s_1_2_2(and_413_nl, nor_tmp, fsm_output(5));
  or_619_nl <= (fsm_output(4)) OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7))
      OR (fsm_output(8)) OR (fsm_output(1));
  or_617_nl <= (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8)) OR (NOT (fsm_output(1)));
  mux_430_nl <= MUX_s_1_2_2(or_617_nl, or_tmp_497, fsm_output(0));
  or_618_nl <= (fsm_output(4)) OR mux_430_nl;
  mux_431_nl <= MUX_s_1_2_2(or_619_nl, or_618_nl, fsm_output(3));
  nor_315_nl <= NOT((fsm_output(2)) OR mux_431_nl);
  or_614_nl <= (fsm_output(0)) OR (NOT (fsm_output(7))) OR (fsm_output(8)) OR (fsm_output(1));
  or_613_nl <= (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8))
      OR (NOT (fsm_output(1)));
  mux_428_nl <= MUX_s_1_2_2(or_614_nl, or_613_nl, fsm_output(4));
  nor_316_nl <= NOT((fsm_output(3)) OR mux_428_nl);
  mux_426_nl <= MUX_s_1_2_2(nand_cse, or_tmp_497, fsm_output(6));
  or_610_nl <= (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(1));
  mux_427_nl <= MUX_s_1_2_2(mux_426_nl, or_610_nl, fsm_output(0));
  nor_317_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("10"))
      OR mux_427_nl);
  mux_429_nl <= MUX_s_1_2_2(nor_316_nl, nor_317_nl, fsm_output(2));
  or_332_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(3)))
      OR (fsm_output(4));
  nand_86_nl <= NOT((fsm_output(0)) AND (fsm_output(1)) AND (NOT (fsm_output(3)))
      AND (fsm_output(4)));
  mux_222_nl <= MUX_s_1_2_2(or_332_nl, nand_86_nl, fsm_output(5));
  or_333_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_222_nl;
  or_328_nl <= (NOT (fsm_output(7))) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(5)))
      OR (NOT (fsm_output(0))) OR (fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(4));
  mux_223_nl <= MUX_s_1_2_2(or_333_nl, or_328_nl, fsm_output(8));
  or_601_nl <= mux_223_nl OR (fsm_output(2));
  or_626_nl <= (fsm_output(5)) OR (NOT (fsm_output(1))) OR (fsm_output(4)) OR (NOT
      (fsm_output(3)));
  nand_101_nl <= NOT((fsm_output(5)) AND (fsm_output(1)) AND (fsm_output(4)) AND
      (NOT (fsm_output(3))));
  mux_434_nl <= MUX_s_1_2_2(or_626_nl, nand_101_nl, fsm_output(0));
  or_628_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_434_nl;
  nor_313_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(5))) OR (fsm_output(1)) OR
      (fsm_output(4)) OR (fsm_output(3)));
  nor_314_nl <= NOT((NOT (fsm_output(0))) OR (NOT (fsm_output(5))) OR (fsm_output(1))
      OR (fsm_output(4)) OR (fsm_output(3)));
  mux_433_nl <= MUX_s_1_2_2(nor_313_nl, nor_314_nl, fsm_output(6));
  nand_102_nl <= NOT((fsm_output(7)) AND mux_433_nl);
  mux_435_nl <= MUX_s_1_2_2(or_628_nl, nand_102_nl, fsm_output(8));
  nor_171_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT mux_204_itm));
  mux_227_nl <= MUX_s_1_2_2(nor_171_nl, and_tmp_6, fsm_output(8));
  and_141_nl <= and_dcpl_56 AND and_dcpl_27;
  r_or_nl <= ((NOT (modulo_result_rem_cmp_z(63))) AND and_144_m1c) OR (not_tmp_201
      AND (NOT (modulo_result_rem_cmp_z(63))));
  r_or_1_nl <= ((modulo_result_rem_cmp_z(63)) AND and_144_m1c) OR (not_tmp_201 AND
      (modulo_result_rem_cmp_z(63)));
  and_146_nl <= not_tmp_191 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("00"));
  and_148_nl <= not_tmp_191 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("01"));
  and_150_nl <= not_tmp_191 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("10"));
  and_152_nl <= not_tmp_191 AND CONV_SL_1_1(COMP_LOOP_acc_10_cse_12_1_1_sva(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11"));
  or_99_nl <= (NOT (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(6));
  mux_252_nl <= MUX_s_1_2_2(or_107_cse, or_99_nl, fsm_output(1));
  or_379_nl <= (NOT(nor_161_cse OR (fsm_output(7)))) OR (NOT (fsm_output(8))) OR
      (fsm_output(6));
  mux_253_nl <= MUX_s_1_2_2(mux_252_nl, or_379_nl, fsm_output(2));
  mux_254_nl <= MUX_s_1_2_2(or_107_cse, mux_253_nl, fsm_output(3));
  mux_255_nl <= MUX_s_1_2_2(mux_254_nl, or_376_cse, fsm_output(4));
  nand_32_nl <= NOT((fsm_output(0)) AND (NOT mux_249_cse));
  or_548_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  mux_250_nl <= MUX_s_1_2_2(nand_32_nl, or_52_cse, or_548_nl);
  or_372_nl <= (fsm_output(0)) OR (fsm_output(7)) OR (NOT (fsm_output(8))) OR (fsm_output(6));
  nand_50_nl <= NOT((fsm_output(8)) AND (fsm_output(6)));
  or_370_nl <= (NOT (fsm_output(0))) OR (fsm_output(7));
  mux_245_nl <= MUX_s_1_2_2(nand_50_nl, or_tmp_32, or_370_nl);
  mux_246_nl <= MUX_s_1_2_2(or_372_nl, mux_245_nl, fsm_output(1));
  mux_247_nl <= MUX_s_1_2_2(or_52_cse, mux_246_nl, fsm_output(2));
  or_95_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("010"));
  mux_248_nl <= MUX_s_1_2_2(mux_247_nl, or_95_nl, fsm_output(3));
  mux_251_nl <= MUX_s_1_2_2(mux_250_nl, mux_248_nl, fsm_output(4));
  COMP_LOOP_and_nl <= (NOT modExp_while_and_5) AND not_tmp_215;
  COMP_LOOP_and_1_nl <= modExp_while_and_5 AND not_tmp_215;
  nand_83_nl <= NOT(nand_56_cse AND (fsm_output(6)));
  mux_283_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_tmp_351, fsm_output(0));
  mux_284_nl <= MUX_s_1_2_2(nand_83_nl, mux_283_nl, fsm_output(8));
  mux_281_nl <= MUX_s_1_2_2(nor_tmp_87, or_tmp_351, fsm_output(0));
  mux_282_nl <= MUX_s_1_2_2((NOT mux_281_nl), or_tmp_351, fsm_output(8));
  mux_285_nl <= MUX_s_1_2_2(mux_284_nl, mux_282_nl, fsm_output(1));
  mux_286_nl <= MUX_s_1_2_2((NOT mux_269_itm), mux_285_nl, fsm_output(3));
  mux_278_nl <= MUX_s_1_2_2((fsm_output(7)), (NOT or_tmp_353), fsm_output(0));
  mux_279_nl <= MUX_s_1_2_2(mux_278_nl, (fsm_output(6)), fsm_output(8));
  or_388_nl <= (fsm_output(3)) OR (fsm_output(1));
  mux_280_nl <= MUX_s_1_2_2(mux_279_nl, mux_tmp_268, or_388_nl);
  mux_287_nl <= MUX_s_1_2_2(mux_286_nl, mux_280_nl, fsm_output(5));
  mux_273_nl <= MUX_s_1_2_2((NOT or_tmp_353), or_tmp_351, fsm_output(0));
  mux_274_nl <= MUX_s_1_2_2(mux_273_nl, or_tmp_349, fsm_output(8));
  mux_275_nl <= MUX_s_1_2_2(mux_tmp_268, mux_274_nl, fsm_output(1));
  mux_276_nl <= MUX_s_1_2_2(mux_275_nl, mux_tmp_258, fsm_output(3));
  mux_277_nl <= MUX_s_1_2_2(mux_tmp_265, mux_276_nl, fsm_output(5));
  mux_288_nl <= MUX_s_1_2_2(mux_287_nl, mux_277_nl, fsm_output(4));
  mux_270_nl <= MUX_s_1_2_2((NOT mux_269_itm), mux_tmp_265, fsm_output(3));
  mux_271_nl <= MUX_s_1_2_2(mux_270_nl, mux_tmp_268, fsm_output(5));
  or_386_nl <= ((fsm_output(0)) AND (fsm_output(7))) OR (fsm_output(6));
  mux_264_nl <= MUX_s_1_2_2((fsm_output(7)), or_386_nl, fsm_output(8));
  and_210_nl <= (fsm_output(3)) AND (fsm_output(1));
  mux_266_nl <= MUX_s_1_2_2(mux_tmp_265, mux_264_nl, and_210_nl);
  mux_261_nl <= MUX_s_1_2_2(or_tmp_351, or_384_cse, fsm_output(8));
  mux_259_nl <= MUX_s_1_2_2(or_tmp_349, mux_tmp_257, fsm_output(0));
  mux_260_nl <= MUX_s_1_2_2(nor_tmp_87, mux_259_nl, fsm_output(8));
  mux_262_nl <= MUX_s_1_2_2(mux_261_nl, mux_260_nl, fsm_output(1));
  mux_263_nl <= MUX_s_1_2_2(mux_262_nl, mux_tmp_258, fsm_output(3));
  mux_267_nl <= MUX_s_1_2_2(mux_266_nl, mux_263_nl, fsm_output(5));
  mux_272_nl <= MUX_s_1_2_2(mux_271_nl, mux_267_nl, fsm_output(4));
  mux_289_nl <= MUX_s_1_2_2(mux_288_nl, mux_272_nl, fsm_output(2));
  mux_318_nl <= MUX_s_1_2_2(not_tmp_130, mux_tmp_170, fsm_output(1));
  COMP_LOOP_1_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED((z_out_3(7 DOWNTO 0))
      & STD_LOGIC_VECTOR'( "00")) + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)))) + SIGNED'( "0000000001"), 10));
  nand_48_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND
      nor_tmp_68);
  mux_321_nl <= MUX_s_1_2_2(or_tmp_291, nand_48_nl, fsm_output(7));
  or_425_nl <= (fsm_output(7)) OR and_dcpl_2;
  and_166_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11")) AND or_tmp_269;
  mux_391_nl <= MUX_s_1_2_2(and_285_cse, (NOT or_tmp_251), fsm_output(6));
  nand_39_nl <= NOT((fsm_output(5)) AND or_123_cse);
  mux_398_nl <= MUX_s_1_2_2(nand_39_nl, or_tmp_255, fsm_output(6));
  nor_125_nl <= NOT((CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")))
      OR (fsm_output(4)));
  mux_399_nl <= MUX_s_1_2_2(nor_125_nl, nor_tmp_57, fsm_output(5));
  and_188_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND or_540_cse
      AND CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  nor_124_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))
      OR nor_tmp_104);
  mux_400_nl <= MUX_s_1_2_2(and_188_nl, nor_124_nl, fsm_output(7));
  COMP_LOOP_mux_22_nl <= MUX_v_12_2_2((STD_LOGIC_VECTOR'( "00001") & (NOT (STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 3)))), VEC_LOOP_j_sva_11_0, and_dcpl_175);
  COMP_LOOP_COMP_LOOP_nand_1_nl <= NOT(and_dcpl_175 AND (NOT(and_dcpl_170 AND (fsm_output(0))
      AND (fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(8)))));
  COMP_LOOP_mux_23_nl <= MUX_v_9_2_2((STD_LOGIC_VECTOR'( "00") & COMP_LOOP_k_9_2_sva_6_0),
      (COMP_LOOP_k_9_2_sva_6_0 & STD_LOGIC_VECTOR'( "01")), and_dcpl_175);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_22_nl & COMP_LOOP_COMP_LOOP_nand_1_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_23_nl & '1'), 10), 13),
      13));
  z_out <= acc_nl(12 DOWNTO 1);
  not_1275_nl <= NOT and_dcpl_183;
  operator_64_false_1_and_1_nl <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), (VEC_LOOP_j_sva_11_0(11
      DOWNTO 8)), not_1275_nl);
  operator_64_false_1_operator_64_false_1_or_1_nl <= MUX_v_4_2_2(operator_64_false_1_and_1_nl,
      STD_LOGIC_VECTOR'("1111"), operator_64_false_1_or_itm);
  operator_64_false_1_mux1h_9_nl <= MUX1HOT_s_1_3_2((NOT modExp_exp_1_7_1_sva), (VEC_LOOP_j_sva_11_0(7)),
      (NOT modExp_exp_1_1_1_sva), STD_LOGIC_VECTOR'( not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_or_6_nl <= operator_64_false_1_mux1h_9_nl OR and_dcpl_183;
  operator_64_false_1_mux1h_10_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(6))),
      (NOT modExp_exp_1_6_1_sva), (VEC_LOOP_j_sva_11_0(6)), (NOT modExp_exp_1_7_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_11_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(5))),
      (NOT modExp_exp_1_5_1_sva), (VEC_LOOP_j_sva_11_0(5)), (NOT modExp_exp_1_6_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_12_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(4))),
      (NOT modExp_exp_1_4_1_sva), (VEC_LOOP_j_sva_11_0(4)), (NOT modExp_exp_1_5_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_13_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(3))),
      (NOT modExp_exp_1_3_1_sva), (VEC_LOOP_j_sva_11_0(3)), (NOT modExp_exp_1_4_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_14_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(2))),
      (NOT modExp_exp_1_2_1_sva), (VEC_LOOP_j_sva_11_0(2)), (NOT modExp_exp_1_3_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_15_nl <= MUX1HOT_s_1_4_2((NOT (COMP_LOOP_k_9_2_sva_6_0(1))),
      (NOT modExp_exp_1_1_1_sva), (VEC_LOOP_j_sva_11_0(1)), (NOT modExp_exp_1_2_1_sva),
      STD_LOGIC_VECTOR'( and_dcpl_183 & not_tmp_291 & operator_64_false_1_or_ssc
      & and_dcpl_208));
  operator_64_false_1_mux1h_16_nl <= MUX1HOT_s_1_3_2((NOT (COMP_LOOP_k_9_2_sva_6_0(0))),
      (NOT modExp_exp_1_0_1_sva_1), (VEC_LOOP_j_sva_11_0(0)), STD_LOGIC_VECTOR'(
      and_dcpl_183 & operator_64_false_1_or_itm & operator_64_false_1_or_ssc));
  and_417_nl <= and_dcpl_227 AND and_dcpl_212 AND (fsm_output(4)) AND (NOT (fsm_output(6)))
      AND (NOT (fsm_output(7))) AND (fsm_output(8));
  COMP_LOOP_mux_24_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'( "10"), STD_LOGIC_VECTOR'(
      "01"), and_417_nl);
  and_418_nl <= (NOT (fsm_output(5))) AND (fsm_output(3)) AND (fsm_output(1)) AND
      and_dcpl_212 AND (fsm_output(4)) AND (fsm_output(6)) AND (NOT (fsm_output(7)))
      AND (NOT (fsm_output(8)));
  COMP_LOOP_COMP_LOOP_nor_4_nl <= NOT(MUX_v_2_2_2(COMP_LOOP_mux_24_nl, STD_LOGIC_VECTOR'("11"),
      and_418_nl));
  and_419_nl <= and_dcpl_227 AND (NOT((fsm_output(0)) OR (fsm_output(2)))) AND (NOT
      (fsm_output(4))) AND (NOT (fsm_output(6))) AND (fsm_output(7)) AND (fsm_output(8));
  COMP_LOOP_COMP_LOOP_or_5_nl <= MUX_v_2_2_2(COMP_LOOP_COMP_LOOP_nor_4_nl, STD_LOGIC_VECTOR'("11"),
      and_419_nl);
  COMP_LOOP_acc_34_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_2_sva_6_0 & COMP_LOOP_COMP_LOOP_or_5_nl),
      9), 10), 10));
  operator_64_false_1_or_7_nl <= and_dcpl_183 OR not_tmp_291 OR and_dcpl_208;
  operator_64_false_1_or_8_nl <= and_dcpl_188 OR and_dcpl_194 OR and_dcpl_199 OR
      and_dcpl_202;
  operator_64_false_1_mux1h_17_nl <= MUX1HOT_v_10_3_2(STD_LOGIC_VECTOR'( "0000000001"),
      STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_34_nl), 10)), STAGE_LOOP_lshift_psp_sva,
      STD_LOGIC_VECTOR'( operator_64_false_1_or_7_nl & operator_64_false_1_or_8_nl
      & and_dcpl_206));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_1_operator_64_false_1_or_1_nl
      & operator_64_false_1_or_6_nl & operator_64_false_1_mux1h_10_nl & operator_64_false_1_mux1h_11_nl
      & operator_64_false_1_mux1h_12_nl & operator_64_false_1_mux1h_13_nl & operator_64_false_1_mux1h_14_nl
      & operator_64_false_1_mux1h_15_nl & operator_64_false_1_mux1h_16_nl), 12),
      13) + CONV_UNSIGNED(UNSIGNED(operator_64_false_1_mux1h_17_nl), 13), 13));
  COMP_LOOP_COMP_LOOP_or_6_nl <= (NOT(and_dcpl_242 OR and_dcpl_249 OR and_dcpl_256
      OR and_dcpl_267)) OR and_dcpl_261 OR and_dcpl_268;
  COMP_LOOP_COMP_LOOP_or_7_nl <= (NOT((operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(63))
      OR and_dcpl_242 OR and_dcpl_249 OR and_dcpl_256 OR and_dcpl_267)) OR and_dcpl_261;
  COMP_LOOP_mux_25_nl <= MUX_v_52_2_2((operator_64_false_acc_mut_63_0(62 DOWNTO 11)),
      (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(62 DOWNTO 11)), and_dcpl_268);
  COMP_LOOP_or_27_nl <= and_dcpl_242 OR and_dcpl_249 OR and_dcpl_256 OR and_dcpl_267;
  COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl <= NOT(MUX_v_52_2_2(COMP_LOOP_mux_25_nl,
      STD_LOGIC_VECTOR'("1111111111111111111111111111111111111111111111111111"),
      COMP_LOOP_or_27_nl));
  COMP_LOOP_mux1h_75_nl <= MUX1HOT_v_2_4_2((NOT (VEC_LOOP_j_sva_11_0(11 DOWNTO 10))),
      STD_LOGIC_VECTOR'( "10"), (operator_64_false_acc_mut_63_0(10 DOWNTO 9)), (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(10
      DOWNTO 9)), STD_LOGIC_VECTOR'( and_dcpl_242 & COMP_LOOP_or_20_itm & and_dcpl_261
      & and_dcpl_268));
  COMP_LOOP_COMP_LOOP_nor_6_nl <= NOT(MUX_v_2_2_2(COMP_LOOP_mux1h_75_nl, STD_LOGIC_VECTOR'("11"),
      and_dcpl_267));
  COMP_LOOP_mux1h_76_nl <= MUX1HOT_v_9_5_2((VEC_LOOP_j_sva_11_0(9 DOWNTO 1)), (NOT
      (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1))), (NOT (operator_64_false_acc_mut_63_0(8
      DOWNTO 0))), (STD_LOGIC_VECTOR'( "00") & COMP_LOOP_k_9_2_sva_6_0), (NOT (operator_66_true_slc_operator_66_true_div_cmp_z_63_0_itm(8
      DOWNTO 0))), STD_LOGIC_VECTOR'( and_dcpl_242 & COMP_LOOP_or_20_itm & and_dcpl_261
      & and_dcpl_267 & and_dcpl_268));
  COMP_LOOP_or_28_nl <= (NOT(and_dcpl_242 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_268))
      OR and_dcpl_249 OR and_dcpl_256;
  COMP_LOOP_COMP_LOOP_mux_2_nl <= MUX_v_7_2_2(('0' & (COMP_LOOP_k_9_2_sva_6_0(6 DOWNTO
      1))), COMP_LOOP_k_9_2_sva_6_0, COMP_LOOP_or_20_itm);
  COMP_LOOP_not_101_nl <= NOT COMP_LOOP_or_ssc;
  COMP_LOOP_and_17_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), COMP_LOOP_COMP_LOOP_mux_2_nl,
      COMP_LOOP_not_101_nl);
  COMP_LOOP_COMP_LOOP_or_8_nl <= ((COMP_LOOP_k_9_2_sva_6_0(0)) AND (NOT(and_dcpl_249
      OR COMP_LOOP_or_ssc))) OR and_dcpl_256;
  COMP_LOOP_COMP_LOOP_or_9_nl <= (NOT and_dcpl_256) OR and_dcpl_242 OR and_dcpl_249
      OR COMP_LOOP_or_ssc;
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_6_nl
      & COMP_LOOP_COMP_LOOP_or_7_nl & COMP_LOOP_COMP_LOOP_COMP_LOOP_nor_1_nl & COMP_LOOP_COMP_LOOP_nor_6_nl
      & COMP_LOOP_mux1h_76_nl & COMP_LOOP_or_28_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_and_17_nl
      & COMP_LOOP_COMP_LOOP_or_8_nl & COMP_LOOP_COMP_LOOP_or_9_nl & '1'), 10), 66),
      66));
  z_out_3 <= acc_3_nl(65 DOWNTO 1);
  and_420_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("01011")) AND
      and_dcpl_26 AND and_dcpl_25;
  or_632_nl <= (fsm_output(1)) OR (fsm_output(6)) OR (NOT (fsm_output(3))) OR (fsm_output(0))
      OR (fsm_output(5));
  nor_323_nl <= NOT((fsm_output(8)) OR (fsm_output(3)) OR not_tmp_289);
  nor_324_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(3)) OR not_tmp_289);
  mux_438_nl <= MUX_s_1_2_2(nor_323_nl, nor_324_nl, fsm_output(6));
  nand_105_nl <= NOT((fsm_output(1)) AND mux_438_nl);
  mux_437_nl <= MUX_s_1_2_2(or_632_nl, nand_105_nl, fsm_output(4));
  nor_322_nl <= NOT((fsm_output(7)) OR mux_437_nl);
  mux_436_nl <= MUX_s_1_2_2(nor_287_cse, nor_322_nl, fsm_output(2));
  or_633_nl <= (fsm_output(0)) OR (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"))));
  mux_440_nl <= MUX_s_1_2_2(or_633_nl, or_384_cse, fsm_output(8));
  nor_325_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0110"))
      OR mux_440_nl);
  or_634_nl <= (fsm_output(8)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(6)))
      OR (fsm_output(7));
  or_635_nl <= (fsm_output(0)) OR (fsm_output(6)) OR (NOT (fsm_output(7)));
  mux_443_nl <= MUX_s_1_2_2(or_634_nl, or_635_nl, fsm_output(1));
  nor_326_nl <= NOT((fsm_output(4)) OR mux_443_nl);
  nor_327_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(1)) OR (NOT (fsm_output(8)))
      OR (fsm_output(0)) OR (NOT (fsm_output(6))) OR (fsm_output(7)));
  mux_442_nl <= MUX_s_1_2_2(nor_326_nl, nor_327_nl, fsm_output(3));
  or_636_nl <= (fsm_output(0)) OR (fsm_output(6)) OR (fsm_output(7));
  mux_444_nl <= MUX_s_1_2_2(or_636_nl, or_384_cse, fsm_output(8));
  nor_328_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(4))) OR (NOT (fsm_output(1)))
      OR mux_444_nl);
  mux_441_nl <= MUX_s_1_2_2(mux_442_nl, nor_328_nl, fsm_output(2));
  mux_439_nl <= MUX_s_1_2_2(nor_325_nl, mux_441_nl, fsm_output(5));
  modExp_while_if_mux1h_2_nl <= MUX1HOT_v_64_3_2(modExp_result_sva, modExp_base_1_sva,
      COMP_LOOP_1_acc_5_mut, STD_LOGIC_VECTOR'( and_420_nl & mux_436_nl & mux_439_nl));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(modExp_while_if_mux1h_2_nl)
      * UNSIGNED(modExp_base_1_sva)), 64));
END v38;

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

ARCHITECTURE v38 OF inPlaceNTT_DIT IS
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

END v38;



