
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
--  Generated date: Mon May 17 21:33:19 2021
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

ARCHITECTURE v6 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_5_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_4_11_64_2048_2048_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v6;

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
    fsm_output : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
    modExp_while_C_47_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    VEC_LOOP_1_COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
    VEC_LOOP_2_COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIT_core_core_fsm;

ARCHITECTURE v6 OF inPlaceNTT_DIT_core_core_fsm IS
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
      modExp_while_C_47, VEC_LOOP_1_COMP_LOOP_C_0, VEC_LOOP_1_COMP_LOOP_C_1, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_39, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_40,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_41, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_42,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_43, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_44,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_45, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_46,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47, VEC_LOOP_1_COMP_LOOP_C_2, VEC_LOOP_1_COMP_LOOP_C_3,
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
      VEC_LOOP_1_COMP_LOOP_C_64, VEC_LOOP_1_COMP_LOOP_C_65, VEC_LOOP_1_COMP_LOOP_C_66,
      VEC_LOOP_1_COMP_LOOP_C_67, VEC_LOOP_1_COMP_LOOP_C_68, VEC_LOOP_1_COMP_LOOP_C_69,
      VEC_LOOP_1_COMP_LOOP_C_70, VEC_LOOP_1_COMP_LOOP_C_71, VEC_LOOP_1_COMP_LOOP_C_72,
      VEC_LOOP_1_COMP_LOOP_C_73, VEC_LOOP_1_COMP_LOOP_C_74, VEC_LOOP_1_COMP_LOOP_C_75,
      VEC_LOOP_1_COMP_LOOP_C_76, VEC_LOOP_1_COMP_LOOP_C_77, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_39, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_40,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_41, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_42,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_43, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_44,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_45, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_46,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47, VEC_LOOP_1_COMP_LOOP_C_78, VEC_LOOP_1_COMP_LOOP_C_79,
      VEC_LOOP_1_COMP_LOOP_C_80, VEC_LOOP_1_COMP_LOOP_C_81, VEC_LOOP_1_COMP_LOOP_C_82,
      VEC_LOOP_1_COMP_LOOP_C_83, VEC_LOOP_1_COMP_LOOP_C_84, VEC_LOOP_1_COMP_LOOP_C_85,
      VEC_LOOP_1_COMP_LOOP_C_86, VEC_LOOP_1_COMP_LOOP_C_87, VEC_LOOP_1_COMP_LOOP_C_88,
      VEC_LOOP_1_COMP_LOOP_C_89, VEC_LOOP_1_COMP_LOOP_C_90, VEC_LOOP_1_COMP_LOOP_C_91,
      VEC_LOOP_1_COMP_LOOP_C_92, VEC_LOOP_1_COMP_LOOP_C_93, VEC_LOOP_1_COMP_LOOP_C_94,
      VEC_LOOP_1_COMP_LOOP_C_95, VEC_LOOP_1_COMP_LOOP_C_96, VEC_LOOP_1_COMP_LOOP_C_97,
      VEC_LOOP_1_COMP_LOOP_C_98, VEC_LOOP_1_COMP_LOOP_C_99, VEC_LOOP_1_COMP_LOOP_C_100,
      VEC_LOOP_1_COMP_LOOP_C_101, VEC_LOOP_1_COMP_LOOP_C_102, VEC_LOOP_1_COMP_LOOP_C_103,
      VEC_LOOP_1_COMP_LOOP_C_104, VEC_LOOP_1_COMP_LOOP_C_105, VEC_LOOP_1_COMP_LOOP_C_106,
      VEC_LOOP_1_COMP_LOOP_C_107, VEC_LOOP_1_COMP_LOOP_C_108, VEC_LOOP_1_COMP_LOOP_C_109,
      VEC_LOOP_1_COMP_LOOP_C_110, VEC_LOOP_1_COMP_LOOP_C_111, VEC_LOOP_1_COMP_LOOP_C_112,
      VEC_LOOP_1_COMP_LOOP_C_113, VEC_LOOP_1_COMP_LOOP_C_114, VEC_LOOP_1_COMP_LOOP_C_115,
      VEC_LOOP_1_COMP_LOOP_C_116, VEC_LOOP_1_COMP_LOOP_C_117, VEC_LOOP_1_COMP_LOOP_C_118,
      VEC_LOOP_1_COMP_LOOP_C_119, VEC_LOOP_1_COMP_LOOP_C_120, VEC_LOOP_1_COMP_LOOP_C_121,
      VEC_LOOP_1_COMP_LOOP_C_122, VEC_LOOP_1_COMP_LOOP_C_123, VEC_LOOP_1_COMP_LOOP_C_124,
      VEC_LOOP_1_COMP_LOOP_C_125, VEC_LOOP_1_COMP_LOOP_C_126, VEC_LOOP_1_COMP_LOOP_C_127,
      VEC_LOOP_1_COMP_LOOP_C_128, VEC_LOOP_1_COMP_LOOP_C_129, VEC_LOOP_1_COMP_LOOP_C_130,
      VEC_LOOP_1_COMP_LOOP_C_131, VEC_LOOP_1_COMP_LOOP_C_132, VEC_LOOP_1_COMP_LOOP_C_133,
      VEC_LOOP_1_COMP_LOOP_C_134, VEC_LOOP_1_COMP_LOOP_C_135, VEC_LOOP_1_COMP_LOOP_C_136,
      VEC_LOOP_1_COMP_LOOP_C_137, VEC_LOOP_1_COMP_LOOP_C_138, VEC_LOOP_1_COMP_LOOP_C_139,
      VEC_LOOP_1_COMP_LOOP_C_140, VEC_LOOP_1_COMP_LOOP_C_141, VEC_LOOP_1_COMP_LOOP_C_142,
      VEC_LOOP_1_COMP_LOOP_C_143, VEC_LOOP_1_COMP_LOOP_C_144, VEC_LOOP_1_COMP_LOOP_C_145,
      VEC_LOOP_1_COMP_LOOP_C_146, VEC_LOOP_1_COMP_LOOP_C_147, VEC_LOOP_1_COMP_LOOP_C_148,
      VEC_LOOP_1_COMP_LOOP_C_149, VEC_LOOP_1_COMP_LOOP_C_150, VEC_LOOP_1_COMP_LOOP_C_151,
      VEC_LOOP_1_COMP_LOOP_C_152, VEC_LOOP_C_0, VEC_LOOP_2_COMP_LOOP_C_0, VEC_LOOP_2_COMP_LOOP_C_1,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1,
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
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_39,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_40, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_41,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_42, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_43,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_44, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_45,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_46, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47,
      VEC_LOOP_2_COMP_LOOP_C_2, VEC_LOOP_2_COMP_LOOP_C_3, VEC_LOOP_2_COMP_LOOP_C_4,
      VEC_LOOP_2_COMP_LOOP_C_5, VEC_LOOP_2_COMP_LOOP_C_6, VEC_LOOP_2_COMP_LOOP_C_7,
      VEC_LOOP_2_COMP_LOOP_C_8, VEC_LOOP_2_COMP_LOOP_C_9, VEC_LOOP_2_COMP_LOOP_C_10,
      VEC_LOOP_2_COMP_LOOP_C_11, VEC_LOOP_2_COMP_LOOP_C_12, VEC_LOOP_2_COMP_LOOP_C_13,
      VEC_LOOP_2_COMP_LOOP_C_14, VEC_LOOP_2_COMP_LOOP_C_15, VEC_LOOP_2_COMP_LOOP_C_16,
      VEC_LOOP_2_COMP_LOOP_C_17, VEC_LOOP_2_COMP_LOOP_C_18, VEC_LOOP_2_COMP_LOOP_C_19,
      VEC_LOOP_2_COMP_LOOP_C_20, VEC_LOOP_2_COMP_LOOP_C_21, VEC_LOOP_2_COMP_LOOP_C_22,
      VEC_LOOP_2_COMP_LOOP_C_23, VEC_LOOP_2_COMP_LOOP_C_24, VEC_LOOP_2_COMP_LOOP_C_25,
      VEC_LOOP_2_COMP_LOOP_C_26, VEC_LOOP_2_COMP_LOOP_C_27, VEC_LOOP_2_COMP_LOOP_C_28,
      VEC_LOOP_2_COMP_LOOP_C_29, VEC_LOOP_2_COMP_LOOP_C_30, VEC_LOOP_2_COMP_LOOP_C_31,
      VEC_LOOP_2_COMP_LOOP_C_32, VEC_LOOP_2_COMP_LOOP_C_33, VEC_LOOP_2_COMP_LOOP_C_34,
      VEC_LOOP_2_COMP_LOOP_C_35, VEC_LOOP_2_COMP_LOOP_C_36, VEC_LOOP_2_COMP_LOOP_C_37,
      VEC_LOOP_2_COMP_LOOP_C_38, VEC_LOOP_2_COMP_LOOP_C_39, VEC_LOOP_2_COMP_LOOP_C_40,
      VEC_LOOP_2_COMP_LOOP_C_41, VEC_LOOP_2_COMP_LOOP_C_42, VEC_LOOP_2_COMP_LOOP_C_43,
      VEC_LOOP_2_COMP_LOOP_C_44, VEC_LOOP_2_COMP_LOOP_C_45, VEC_LOOP_2_COMP_LOOP_C_46,
      VEC_LOOP_2_COMP_LOOP_C_47, VEC_LOOP_2_COMP_LOOP_C_48, VEC_LOOP_2_COMP_LOOP_C_49,
      VEC_LOOP_2_COMP_LOOP_C_50, VEC_LOOP_2_COMP_LOOP_C_51, VEC_LOOP_2_COMP_LOOP_C_52,
      VEC_LOOP_2_COMP_LOOP_C_53, VEC_LOOP_2_COMP_LOOP_C_54, VEC_LOOP_2_COMP_LOOP_C_55,
      VEC_LOOP_2_COMP_LOOP_C_56, VEC_LOOP_2_COMP_LOOP_C_57, VEC_LOOP_2_COMP_LOOP_C_58,
      VEC_LOOP_2_COMP_LOOP_C_59, VEC_LOOP_2_COMP_LOOP_C_60, VEC_LOOP_2_COMP_LOOP_C_61,
      VEC_LOOP_2_COMP_LOOP_C_62, VEC_LOOP_2_COMP_LOOP_C_63, VEC_LOOP_2_COMP_LOOP_C_64,
      VEC_LOOP_2_COMP_LOOP_C_65, VEC_LOOP_2_COMP_LOOP_C_66, VEC_LOOP_2_COMP_LOOP_C_67,
      VEC_LOOP_2_COMP_LOOP_C_68, VEC_LOOP_2_COMP_LOOP_C_69, VEC_LOOP_2_COMP_LOOP_C_70,
      VEC_LOOP_2_COMP_LOOP_C_71, VEC_LOOP_2_COMP_LOOP_C_72, VEC_LOOP_2_COMP_LOOP_C_73,
      VEC_LOOP_2_COMP_LOOP_C_74, VEC_LOOP_2_COMP_LOOP_C_75, VEC_LOOP_2_COMP_LOOP_C_76,
      VEC_LOOP_2_COMP_LOOP_C_77, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1,
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
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_39,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_40, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_41,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_42, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_43,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_44, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_45,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_46, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47,
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
      VEC_LOOP_2_COMP_LOOP_C_123, VEC_LOOP_2_COMP_LOOP_C_124, VEC_LOOP_2_COMP_LOOP_C_125,
      VEC_LOOP_2_COMP_LOOP_C_126, VEC_LOOP_2_COMP_LOOP_C_127, VEC_LOOP_2_COMP_LOOP_C_128,
      VEC_LOOP_2_COMP_LOOP_C_129, VEC_LOOP_2_COMP_LOOP_C_130, VEC_LOOP_2_COMP_LOOP_C_131,
      VEC_LOOP_2_COMP_LOOP_C_132, VEC_LOOP_2_COMP_LOOP_C_133, VEC_LOOP_2_COMP_LOOP_C_134,
      VEC_LOOP_2_COMP_LOOP_C_135, VEC_LOOP_2_COMP_LOOP_C_136, VEC_LOOP_2_COMP_LOOP_C_137,
      VEC_LOOP_2_COMP_LOOP_C_138, VEC_LOOP_2_COMP_LOOP_C_139, VEC_LOOP_2_COMP_LOOP_C_140,
      VEC_LOOP_2_COMP_LOOP_C_141, VEC_LOOP_2_COMP_LOOP_C_142, VEC_LOOP_2_COMP_LOOP_C_143,
      VEC_LOOP_2_COMP_LOOP_C_144, VEC_LOOP_2_COMP_LOOP_C_145, VEC_LOOP_2_COMP_LOOP_C_146,
      VEC_LOOP_2_COMP_LOOP_C_147, VEC_LOOP_2_COMP_LOOP_C_148, VEC_LOOP_2_COMP_LOOP_C_149,
      VEC_LOOP_2_COMP_LOOP_C_150, VEC_LOOP_2_COMP_LOOP_C_151, VEC_LOOP_2_COMP_LOOP_C_152,
      VEC_LOOP_C_1, STAGE_LOOP_C_11, main_C_1);

  SIGNAL state_var : inPlaceNTT_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIT_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIT_core_core_fsm_1 : PROCESS (STAGE_LOOP_C_10_tr0, modExp_while_C_47_tr0,
      VEC_LOOP_1_COMP_LOOP_C_1_tr0, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47_tr0,
      VEC_LOOP_1_COMP_LOOP_C_76_tr0, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0,
      VEC_LOOP_1_COMP_LOOP_C_152_tr0, VEC_LOOP_C_0_tr0, VEC_LOOP_2_COMP_LOOP_C_1_tr0,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47_tr0, VEC_LOOP_2_COMP_LOOP_C_76_tr0,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0, VEC_LOOP_2_COMP_LOOP_C_152_tr0,
      VEC_LOOP_C_1_tr0, STAGE_LOOP_C_11_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000001");
        state_var_NS <= STAGE_LOOP_C_1;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000010");
        state_var_NS <= STAGE_LOOP_C_2;
      WHEN STAGE_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000011");
        state_var_NS <= STAGE_LOOP_C_3;
      WHEN STAGE_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000100");
        state_var_NS <= STAGE_LOOP_C_4;
      WHEN STAGE_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000101");
        state_var_NS <= STAGE_LOOP_C_5;
      WHEN STAGE_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000110");
        state_var_NS <= STAGE_LOOP_C_6;
      WHEN STAGE_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000111");
        state_var_NS <= STAGE_LOOP_C_7;
      WHEN STAGE_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001000");
        state_var_NS <= STAGE_LOOP_C_8;
      WHEN STAGE_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001001");
        state_var_NS <= STAGE_LOOP_C_9;
      WHEN STAGE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001010");
        state_var_NS <= STAGE_LOOP_C_10;
      WHEN STAGE_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001011");
        IF ( STAGE_LOOP_C_10_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN modExp_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001100");
        state_var_NS <= modExp_while_C_1;
      WHEN modExp_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001101");
        state_var_NS <= modExp_while_C_2;
      WHEN modExp_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001110");
        state_var_NS <= modExp_while_C_3;
      WHEN modExp_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001111");
        state_var_NS <= modExp_while_C_4;
      WHEN modExp_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010000");
        state_var_NS <= modExp_while_C_5;
      WHEN modExp_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010001");
        state_var_NS <= modExp_while_C_6;
      WHEN modExp_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010010");
        state_var_NS <= modExp_while_C_7;
      WHEN modExp_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010011");
        state_var_NS <= modExp_while_C_8;
      WHEN modExp_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010100");
        state_var_NS <= modExp_while_C_9;
      WHEN modExp_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010101");
        state_var_NS <= modExp_while_C_10;
      WHEN modExp_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010110");
        state_var_NS <= modExp_while_C_11;
      WHEN modExp_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010111");
        state_var_NS <= modExp_while_C_12;
      WHEN modExp_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011000");
        state_var_NS <= modExp_while_C_13;
      WHEN modExp_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011001");
        state_var_NS <= modExp_while_C_14;
      WHEN modExp_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011010");
        state_var_NS <= modExp_while_C_15;
      WHEN modExp_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011011");
        state_var_NS <= modExp_while_C_16;
      WHEN modExp_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011100");
        state_var_NS <= modExp_while_C_17;
      WHEN modExp_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011101");
        state_var_NS <= modExp_while_C_18;
      WHEN modExp_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011110");
        state_var_NS <= modExp_while_C_19;
      WHEN modExp_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011111");
        state_var_NS <= modExp_while_C_20;
      WHEN modExp_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100000");
        state_var_NS <= modExp_while_C_21;
      WHEN modExp_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100001");
        state_var_NS <= modExp_while_C_22;
      WHEN modExp_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100010");
        state_var_NS <= modExp_while_C_23;
      WHEN modExp_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100011");
        state_var_NS <= modExp_while_C_24;
      WHEN modExp_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100100");
        state_var_NS <= modExp_while_C_25;
      WHEN modExp_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100101");
        state_var_NS <= modExp_while_C_26;
      WHEN modExp_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100110");
        state_var_NS <= modExp_while_C_27;
      WHEN modExp_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100111");
        state_var_NS <= modExp_while_C_28;
      WHEN modExp_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101000");
        state_var_NS <= modExp_while_C_29;
      WHEN modExp_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101001");
        state_var_NS <= modExp_while_C_30;
      WHEN modExp_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101010");
        state_var_NS <= modExp_while_C_31;
      WHEN modExp_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101011");
        state_var_NS <= modExp_while_C_32;
      WHEN modExp_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101100");
        state_var_NS <= modExp_while_C_33;
      WHEN modExp_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101101");
        state_var_NS <= modExp_while_C_34;
      WHEN modExp_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101110");
        state_var_NS <= modExp_while_C_35;
      WHEN modExp_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101111");
        state_var_NS <= modExp_while_C_36;
      WHEN modExp_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110000");
        state_var_NS <= modExp_while_C_37;
      WHEN modExp_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110001");
        state_var_NS <= modExp_while_C_38;
      WHEN modExp_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110010");
        state_var_NS <= modExp_while_C_39;
      WHEN modExp_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110011");
        state_var_NS <= modExp_while_C_40;
      WHEN modExp_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110100");
        state_var_NS <= modExp_while_C_41;
      WHEN modExp_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110101");
        state_var_NS <= modExp_while_C_42;
      WHEN modExp_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110110");
        state_var_NS <= modExp_while_C_43;
      WHEN modExp_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110111");
        state_var_NS <= modExp_while_C_44;
      WHEN modExp_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111000");
        state_var_NS <= modExp_while_C_45;
      WHEN modExp_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111001");
        state_var_NS <= modExp_while_C_46;
      WHEN modExp_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111010");
        state_var_NS <= modExp_while_C_47;
      WHEN modExp_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111011");
        IF ( modExp_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        ELSE
          state_var_NS <= modExp_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111101");
        IF ( VEC_LOOP_1_COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_39;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_40;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_41;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_42;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_43;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_44;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_45;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_46;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47;
      WHEN VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101101");
        IF ( VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_39;
      WHEN VEC_LOOP_1_COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_40;
      WHEN VEC_LOOP_1_COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_41;
      WHEN VEC_LOOP_1_COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_42;
      WHEN VEC_LOOP_1_COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_43;
      WHEN VEC_LOOP_1_COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_44;
      WHEN VEC_LOOP_1_COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_45;
      WHEN VEC_LOOP_1_COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_46;
      WHEN VEC_LOOP_1_COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_47;
      WHEN VEC_LOOP_1_COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_48;
      WHEN VEC_LOOP_1_COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_49;
      WHEN VEC_LOOP_1_COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_50;
      WHEN VEC_LOOP_1_COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_51;
      WHEN VEC_LOOP_1_COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_52;
      WHEN VEC_LOOP_1_COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_53;
      WHEN VEC_LOOP_1_COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_54;
      WHEN VEC_LOOP_1_COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_55;
      WHEN VEC_LOOP_1_COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_56;
      WHEN VEC_LOOP_1_COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_57;
      WHEN VEC_LOOP_1_COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_58;
      WHEN VEC_LOOP_1_COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_59;
      WHEN VEC_LOOP_1_COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_60;
      WHEN VEC_LOOP_1_COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_61;
      WHEN VEC_LOOP_1_COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_62;
      WHEN VEC_LOOP_1_COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_63;
      WHEN VEC_LOOP_1_COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_64;
      WHEN VEC_LOOP_1_COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_65;
      WHEN VEC_LOOP_1_COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_66;
      WHEN VEC_LOOP_1_COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_67;
      WHEN VEC_LOOP_1_COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_68;
      WHEN VEC_LOOP_1_COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_69;
      WHEN VEC_LOOP_1_COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_70;
      WHEN VEC_LOOP_1_COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_71;
      WHEN VEC_LOOP_1_COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_72;
      WHEN VEC_LOOP_1_COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_73;
      WHEN VEC_LOOP_1_COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_74;
      WHEN VEC_LOOP_1_COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_75;
      WHEN VEC_LOOP_1_COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_76;
      WHEN VEC_LOOP_1_COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111000");
        IF ( VEC_LOOP_1_COMP_LOOP_C_76_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_77;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_39;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_40;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_41;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_42;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_43;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_44;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_45;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_46;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47;
      WHEN VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101001");
        IF ( VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_78;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_1_COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_79;
      WHEN VEC_LOOP_1_COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_80;
      WHEN VEC_LOOP_1_COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_81;
      WHEN VEC_LOOP_1_COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_82;
      WHEN VEC_LOOP_1_COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_83;
      WHEN VEC_LOOP_1_COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_84;
      WHEN VEC_LOOP_1_COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_85;
      WHEN VEC_LOOP_1_COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_86;
      WHEN VEC_LOOP_1_COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_87;
      WHEN VEC_LOOP_1_COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_88;
      WHEN VEC_LOOP_1_COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_89;
      WHEN VEC_LOOP_1_COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_90;
      WHEN VEC_LOOP_1_COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_91;
      WHEN VEC_LOOP_1_COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_92;
      WHEN VEC_LOOP_1_COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_93;
      WHEN VEC_LOOP_1_COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_94;
      WHEN VEC_LOOP_1_COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_95;
      WHEN VEC_LOOP_1_COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_96;
      WHEN VEC_LOOP_1_COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_97;
      WHEN VEC_LOOP_1_COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_98;
      WHEN VEC_LOOP_1_COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_99;
      WHEN VEC_LOOP_1_COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_100;
      WHEN VEC_LOOP_1_COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_101;
      WHEN VEC_LOOP_1_COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_102;
      WHEN VEC_LOOP_1_COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_103;
      WHEN VEC_LOOP_1_COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_104;
      WHEN VEC_LOOP_1_COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_105;
      WHEN VEC_LOOP_1_COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_106;
      WHEN VEC_LOOP_1_COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_107;
      WHEN VEC_LOOP_1_COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_108;
      WHEN VEC_LOOP_1_COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_109;
      WHEN VEC_LOOP_1_COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_110;
      WHEN VEC_LOOP_1_COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_111;
      WHEN VEC_LOOP_1_COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_112;
      WHEN VEC_LOOP_1_COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_113;
      WHEN VEC_LOOP_1_COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_114;
      WHEN VEC_LOOP_1_COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_115;
      WHEN VEC_LOOP_1_COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_116;
      WHEN VEC_LOOP_1_COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_117;
      WHEN VEC_LOOP_1_COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_118;
      WHEN VEC_LOOP_1_COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_119;
      WHEN VEC_LOOP_1_COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_120;
      WHEN VEC_LOOP_1_COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_121;
      WHEN VEC_LOOP_1_COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_122;
      WHEN VEC_LOOP_1_COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_123;
      WHEN VEC_LOOP_1_COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_124;
      WHEN VEC_LOOP_1_COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_125;
      WHEN VEC_LOOP_1_COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_126;
      WHEN VEC_LOOP_1_COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_127;
      WHEN VEC_LOOP_1_COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_128;
      WHEN VEC_LOOP_1_COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_129;
      WHEN VEC_LOOP_1_COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_130;
      WHEN VEC_LOOP_1_COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_131;
      WHEN VEC_LOOP_1_COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_132;
      WHEN VEC_LOOP_1_COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_133;
      WHEN VEC_LOOP_1_COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_134;
      WHEN VEC_LOOP_1_COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_135;
      WHEN VEC_LOOP_1_COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_136;
      WHEN VEC_LOOP_1_COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_137;
      WHEN VEC_LOOP_1_COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_138;
      WHEN VEC_LOOP_1_COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_139;
      WHEN VEC_LOOP_1_COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_140;
      WHEN VEC_LOOP_1_COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_141;
      WHEN VEC_LOOP_1_COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_142;
      WHEN VEC_LOOP_1_COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_143;
      WHEN VEC_LOOP_1_COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_144;
      WHEN VEC_LOOP_1_COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101100");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_145;
      WHEN VEC_LOOP_1_COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101101");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_146;
      WHEN VEC_LOOP_1_COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101110");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_147;
      WHEN VEC_LOOP_1_COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101111");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_148;
      WHEN VEC_LOOP_1_COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110000");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_149;
      WHEN VEC_LOOP_1_COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110001");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_150;
      WHEN VEC_LOOP_1_COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110010");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_151;
      WHEN VEC_LOOP_1_COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110011");
        state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_152;
      WHEN VEC_LOOP_1_COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110100");
        IF ( VEC_LOOP_1_COMP_LOOP_C_152_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110101");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_11;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110111");
        IF ( VEC_LOOP_2_COMP_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_2;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_39;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_40;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_41;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_42;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_43;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_44;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_45;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_46;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47;
      WHEN VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100111");
        IF ( VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_2;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_39;
      WHEN VEC_LOOP_2_COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_40;
      WHEN VEC_LOOP_2_COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_41;
      WHEN VEC_LOOP_2_COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_42;
      WHEN VEC_LOOP_2_COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_43;
      WHEN VEC_LOOP_2_COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_44;
      WHEN VEC_LOOP_2_COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_45;
      WHEN VEC_LOOP_2_COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_46;
      WHEN VEC_LOOP_2_COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_47;
      WHEN VEC_LOOP_2_COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_48;
      WHEN VEC_LOOP_2_COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_49;
      WHEN VEC_LOOP_2_COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_50;
      WHEN VEC_LOOP_2_COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_51;
      WHEN VEC_LOOP_2_COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_52;
      WHEN VEC_LOOP_2_COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_53;
      WHEN VEC_LOOP_2_COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_54;
      WHEN VEC_LOOP_2_COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_55;
      WHEN VEC_LOOP_2_COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_56;
      WHEN VEC_LOOP_2_COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_57;
      WHEN VEC_LOOP_2_COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_58;
      WHEN VEC_LOOP_2_COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_59;
      WHEN VEC_LOOP_2_COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_60;
      WHEN VEC_LOOP_2_COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_61;
      WHEN VEC_LOOP_2_COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_62;
      WHEN VEC_LOOP_2_COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_63;
      WHEN VEC_LOOP_2_COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_64;
      WHEN VEC_LOOP_2_COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_65;
      WHEN VEC_LOOP_2_COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_66;
      WHEN VEC_LOOP_2_COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_67;
      WHEN VEC_LOOP_2_COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_68;
      WHEN VEC_LOOP_2_COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_69;
      WHEN VEC_LOOP_2_COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_70;
      WHEN VEC_LOOP_2_COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_71;
      WHEN VEC_LOOP_2_COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_72;
      WHEN VEC_LOOP_2_COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_73;
      WHEN VEC_LOOP_2_COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_74;
      WHEN VEC_LOOP_2_COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_75;
      WHEN VEC_LOOP_2_COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_76;
      WHEN VEC_LOOP_2_COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110010");
        IF ( VEC_LOOP_2_COMP_LOOP_C_76_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_1;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_77;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_2;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_3;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_4;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_5;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_6;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_7;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_8;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_9;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_10;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_11;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_12;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_13;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_14;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_15;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_16;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_17;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_18;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_19;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_20;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_21;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_22;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_23;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_24;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_25;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_26;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_27;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_28;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_29;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_30;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_31;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_32;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_33;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_34;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_35;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_36;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_37;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_39;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_40;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_41;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_42;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_43;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_44;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_45;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_46;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47;
      WHEN VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100011");
        IF ( VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_78;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_0;
        END IF;
      WHEN VEC_LOOP_2_COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_79;
      WHEN VEC_LOOP_2_COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_80;
      WHEN VEC_LOOP_2_COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_81;
      WHEN VEC_LOOP_2_COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_82;
      WHEN VEC_LOOP_2_COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_83;
      WHEN VEC_LOOP_2_COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_84;
      WHEN VEC_LOOP_2_COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_85;
      WHEN VEC_LOOP_2_COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_86;
      WHEN VEC_LOOP_2_COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_87;
      WHEN VEC_LOOP_2_COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_88;
      WHEN VEC_LOOP_2_COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_89;
      WHEN VEC_LOOP_2_COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_90;
      WHEN VEC_LOOP_2_COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_91;
      WHEN VEC_LOOP_2_COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_92;
      WHEN VEC_LOOP_2_COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_93;
      WHEN VEC_LOOP_2_COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_94;
      WHEN VEC_LOOP_2_COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_95;
      WHEN VEC_LOOP_2_COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_96;
      WHEN VEC_LOOP_2_COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_97;
      WHEN VEC_LOOP_2_COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_98;
      WHEN VEC_LOOP_2_COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_99;
      WHEN VEC_LOOP_2_COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_100;
      WHEN VEC_LOOP_2_COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_101;
      WHEN VEC_LOOP_2_COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_102;
      WHEN VEC_LOOP_2_COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_103;
      WHEN VEC_LOOP_2_COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_104;
      WHEN VEC_LOOP_2_COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_105;
      WHEN VEC_LOOP_2_COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_106;
      WHEN VEC_LOOP_2_COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_107;
      WHEN VEC_LOOP_2_COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_108;
      WHEN VEC_LOOP_2_COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_109;
      WHEN VEC_LOOP_2_COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_110;
      WHEN VEC_LOOP_2_COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_111;
      WHEN VEC_LOOP_2_COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_112;
      WHEN VEC_LOOP_2_COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_113;
      WHEN VEC_LOOP_2_COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_114;
      WHEN VEC_LOOP_2_COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_115;
      WHEN VEC_LOOP_2_COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_116;
      WHEN VEC_LOOP_2_COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_117;
      WHEN VEC_LOOP_2_COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_118;
      WHEN VEC_LOOP_2_COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_119;
      WHEN VEC_LOOP_2_COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_120;
      WHEN VEC_LOOP_2_COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_121;
      WHEN VEC_LOOP_2_COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_122;
      WHEN VEC_LOOP_2_COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_123;
      WHEN VEC_LOOP_2_COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_124;
      WHEN VEC_LOOP_2_COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_125;
      WHEN VEC_LOOP_2_COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_126;
      WHEN VEC_LOOP_2_COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_127;
      WHEN VEC_LOOP_2_COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_128;
      WHEN VEC_LOOP_2_COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_129;
      WHEN VEC_LOOP_2_COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_130;
      WHEN VEC_LOOP_2_COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_131;
      WHEN VEC_LOOP_2_COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_132;
      WHEN VEC_LOOP_2_COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_133;
      WHEN VEC_LOOP_2_COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_134;
      WHEN VEC_LOOP_2_COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_135;
      WHEN VEC_LOOP_2_COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_136;
      WHEN VEC_LOOP_2_COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_137;
      WHEN VEC_LOOP_2_COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_138;
      WHEN VEC_LOOP_2_COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_139;
      WHEN VEC_LOOP_2_COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_140;
      WHEN VEC_LOOP_2_COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_141;
      WHEN VEC_LOOP_2_COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_142;
      WHEN VEC_LOOP_2_COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_143;
      WHEN VEC_LOOP_2_COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_144;
      WHEN VEC_LOOP_2_COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100110");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_145;
      WHEN VEC_LOOP_2_COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100111");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_146;
      WHEN VEC_LOOP_2_COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101000");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_147;
      WHEN VEC_LOOP_2_COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101001");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_148;
      WHEN VEC_LOOP_2_COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101010");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_149;
      WHEN VEC_LOOP_2_COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101011");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_150;
      WHEN VEC_LOOP_2_COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101100");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_151;
      WHEN VEC_LOOP_2_COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101101");
        state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_152;
      WHEN VEC_LOOP_2_COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101110");
        IF ( VEC_LOOP_2_COMP_LOOP_C_152_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_1;
        ELSE
          state_var_NS <= VEC_LOOP_2_COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101111");
        IF ( VEC_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_11;
        ELSE
          state_var_NS <= VEC_LOOP_1_COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000110000");
        IF ( STAGE_LOOP_C_11_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000110001");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000");
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

END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_core_wait_dp IS
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
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_result_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_div_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL or_tmp_1 : STD_LOGIC;
  SIGNAL nor_tmp_1 : STD_LOGIC;
  SIGNAL nor_tmp_2 : STD_LOGIC;
  SIGNAL or_tmp_11 : STD_LOGIC;
  SIGNAL or_tmp_19 : STD_LOGIC;
  SIGNAL or_tmp_29 : STD_LOGIC;
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL or_tmp_52 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL not_tmp_63 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL not_tmp_94 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_93 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_138 : STD_LOGIC;
  SIGNAL or_tmp_154 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL mux_tmp_146 : STD_LOGIC;
  SIGNAL and_tmp_11 : STD_LOGIC;
  SIGNAL not_tmp_111 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL or_tmp_167 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL nor_tmp_38 : STD_LOGIC;
  SIGNAL mux_tmp_157 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL or_tmp_189 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL not_tmp_141 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL or_tmp_201 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL or_tmp_204 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL or_tmp_207 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL mux_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_187 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_157 : STD_LOGIC;
  SIGNAL or_tmp_263 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL or_tmp_267 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_167 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_tmp_17 : STD_LOGIC;
  SIGNAL or_tmp_271 : STD_LOGIC;
  SIGNAL or_tmp_273 : STD_LOGIC;
  SIGNAL or_tmp_279 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL or_tmp_283 : STD_LOGIC;
  SIGNAL mux_tmp_256 : STD_LOGIC;
  SIGNAL or_tmp_284 : STD_LOGIC;
  SIGNAL nor_tmp_56 : STD_LOGIC;
  SIGNAL nor_tmp_57 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL nor_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_269 : STD_LOGIC;
  SIGNAL mux_tmp_272 : STD_LOGIC;
  SIGNAL and_tmp_19 : STD_LOGIC;
  SIGNAL or_tmp_295 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_189 : STD_LOGIC;
  SIGNAL and_dcpl_190 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL or_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL or_tmp_335 : STD_LOGIC;
  SIGNAL mux_tmp_314 : STD_LOGIC;
  SIGNAL or_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_320 : STD_LOGIC;
  SIGNAL or_tmp_341 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL or_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL nor_tmp_77 : STD_LOGIC;
  SIGNAL nor_tmp_79 : STD_LOGIC;
  SIGNAL nor_tmp_81 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL or_dcpl_62 : STD_LOGIC;
  SIGNAL or_dcpl_63 : STD_LOGIC;
  SIGNAL or_dcpl_68 : STD_LOGIC;
  SIGNAL or_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_82 : STD_LOGIC;
  SIGNAL or_dcpl_83 : STD_LOGIC;
  SIGNAL or_dcpl_84 : STD_LOGIC;
  SIGNAL or_dcpl_89 : STD_LOGIC;
  SIGNAL exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      : STD_LOGIC;
  SIGNAL VEC_LOOP_j_1_12_0_sva_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modExp_exp_1_0_1_sva : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_10_cse_12_1_1_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_k_9_1_1_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL reg_VEC_LOOP_1_acc_1_psp_ftd_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL and_171_m1c : STD_LOGIC;
  SIGNAL and_178_m1c : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_1_obj_ld_cse : STD_LOGIC;
  SIGNAL and_271_cse : STD_LOGIC;
  SIGNAL or_492_cse : STD_LOGIC;
  SIGNAL or_71_cse : STD_LOGIC;
  SIGNAL and_282_cse : STD_LOGIC;
  SIGNAL or_96_cse : STD_LOGIC;
  SIGNAL or_100_cse : STD_LOGIC;
  SIGNAL and_259_cse : STD_LOGIC;
  SIGNAL or_89_cse : STD_LOGIC;
  SIGNAL or_25_cse : STD_LOGIC;
  SIGNAL and_334_cse : STD_LOGIC;
  SIGNAL or_74_cse : STD_LOGIC;
  SIGNAL nand_51_cse : STD_LOGIC;
  SIGNAL or_52_cse : STD_LOGIC;
  SIGNAL and_273_cse : STD_LOGIC;
  SIGNAL or_210_cse : STD_LOGIC;
  SIGNAL modExp_while_and_itm : STD_LOGIC;
  SIGNAL modExp_while_and_1_itm : STD_LOGIC;
  SIGNAL reg_operator_66_true_div_cmp_b_reg : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL or_252_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_psp_1_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_1_itm_mx1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_241 : STD_LOGIC;
  SIGNAL and_dcpl_242 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_247 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_250 : STD_LOGIC;
  SIGNAL and_dcpl_253 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL and_dcpl_270 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_281 : STD_LOGIC;
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL and_dcpl_287 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_343 : STD_LOGIC;
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL r_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL modExp_result_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_exp_1_7_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_6_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_5_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_4_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_3_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_2_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_1_1_sva : STD_LOGIC;
  SIGNAL modExp_exp_1_0_1_sva_1 : STD_LOGIC;
  SIGNAL modExp_while_if_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_if_mul_mut : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_2_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_if_mul_mut : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_1_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_2_mul_mut : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL COMP_LOOP_mux_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_mul_itm : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_if_mul_itm : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL modulo_result_rem_cmp_a_mx0w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_while_mul_itm_mx0w10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_mul_mut_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_64_false_acc_mut_mx0c0 : STD_LOGIC;
  SIGNAL VEC_LOOP_j_1_12_0_sva_11_0_mx0c1 : STD_LOGIC;
  SIGNAL modExp_result_sva_mx0c0 : STD_LOGIC;
  SIGNAL operator_64_false_slc_modExp_exp_63_1_3 : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL modulo_qr_sva_1_mx0w8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
      : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
      : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL modExp_1_while_and_11 : STD_LOGIC;
  SIGNAL modExp_result_and_rgt : STD_LOGIC;
  SIGNAL modExp_result_and_1_rgt : STD_LOGIC;
  SIGNAL COMP_LOOP_or_2_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_or_4_cse : STD_LOGIC;
  SIGNAL mux_150_cse : STD_LOGIC;
  SIGNAL nor_140_cse : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL mux_195_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_nor_3_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_23_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_or_24_itm : STD_LOGIC;
  SIGNAL z_out_5_8 : STD_LOGIC;
  SIGNAL mux_372_cse : STD_LOGIC;
  SIGNAL and_468_cse : STD_LOGIC;

  SIGNAL and_105_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_106_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL and_299_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL and_300_nl : STD_LOGIC;
  SIGNAL nor_152_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL and_301_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nor_153_nl : STD_LOGIC;
  SIGNAL nor_154_nl : STD_LOGIC;
  SIGNAL nor_155_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL or_188_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL and_114_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL nor_151_nl : STD_LOGIC;
  SIGNAL nor_218_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL nand_80_nl : STD_LOGIC;
  SIGNAL or_512_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL nor_144_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL and_292_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL nor_208_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL nand_64_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nand_65_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL nor_209_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL nand_66_nl : STD_LOGIC;
  SIGNAL or_500_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL nand_50_nl : STD_LOGIC;
  SIGNAL or_213_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL nand_52_nl : STD_LOGIC;
  SIGNAL nor_143_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL and_291_nl : STD_LOGIC;
  SIGNAL and_128_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL nor_138_nl : STD_LOGIC;
  SIGNAL and_130_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL nor_137_nl : STD_LOGIC;
  SIGNAL nor_214_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL or_509_nl : STD_LOGIC;
  SIGNAL nand_73_nl : STD_LOGIC;
  SIGNAL and_135_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL or_228_nl : STD_LOGIC;
  SIGNAL and_138_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL or_493_nl : STD_LOGIC;
  SIGNAL nor_135_nl : STD_LOGIC;
  SIGNAL and_141_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL and_285_nl : STD_LOGIC;
  SIGNAL nor_134_nl : STD_LOGIC;
  SIGNAL and_145_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL nor_133_nl : STD_LOGIC;
  SIGNAL and_147_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL and_148_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL nand_85_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL nor_128_nl : STD_LOGIC;
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_248_nl : STD_LOGIC;
  SIGNAL nor_249_nl : STD_LOGIC;
  SIGNAL nor_250_nl : STD_LOGIC;
  SIGNAL nor_251_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL mux_232_nl : STD_LOGIC;
  SIGNAL or_296_nl : STD_LOGIC;
  SIGNAL or_294_nl : STD_LOGIC;
  SIGNAL and_176_nl : STD_LOGIC;
  SIGNAL r_or_nl : STD_LOGIC;
  SIGNAL r_or_1_nl : STD_LOGIC;
  SIGNAL and_189_nl : STD_LOGIC;
  SIGNAL and_193_nl : STD_LOGIC;
  SIGNAL mux_253_nl : STD_LOGIC;
  SIGNAL or_533_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_250_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL or_314_nl : STD_LOGIC;
  SIGNAL or_312_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_245_nl : STD_LOGIC;
  SIGNAL mux_244_nl : STD_LOGIC;
  SIGNAL mux_243_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL and_195_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL nor_122_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL or_534_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_1_nl : STD_LOGIC;
  SIGNAL mux_289_nl : STD_LOGIC;
  SIGNAL mux_288_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL mux_285_nl : STD_LOGIC;
  SIGNAL mux_284_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL mux_281_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL mux_273_nl : STD_LOGIC;
  SIGNAL or_329_nl : STD_LOGIC;
  SIGNAL mux_270_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL mux_267_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL mux_265_nl : STD_LOGIC;
  SIGNAL mux_264_nl : STD_LOGIC;
  SIGNAL mux_262_nl : STD_LOGIC;
  SIGNAL mux_261_nl : STD_LOGIC;
  SIGNAL nor_120_nl : STD_LOGIC;
  SIGNAL and_276_nl : STD_LOGIC;
  SIGNAL mux_260_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL mux_259_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL mux_258_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL or_322_nl : STD_LOGIC;
  SIGNAL mux_257_nl : STD_LOGIC;
  SIGNAL or_319_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_and_5_nl : STD_LOGIC;
  SIGNAL and_212_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL mux_300_nl : STD_LOGIC;
  SIGNAL nor_113_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_299_nl : STD_LOGIC;
  SIGNAL nor_115_nl : STD_LOGIC;
  SIGNAL mux_298_nl : STD_LOGIC;
  SIGNAL nand_48_nl : STD_LOGIC;
  SIGNAL mux_297_nl : STD_LOGIC;
  SIGNAL mux_294_nl : STD_LOGIC;
  SIGNAL and_270_nl : STD_LOGIC;
  SIGNAL or_344_nl : STD_LOGIC;
  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL or_341_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL mux_303_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_1_COMP_LOOP_1_acc_11_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_21_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL mux_323_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL mux_321_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL mux_317_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL mux_315_nl : STD_LOGIC;
  SIGNAL nor_70_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL mux_328_nl : STD_LOGIC;
  SIGNAL mux_327_nl : STD_LOGIC;
  SIGNAL or_396_nl : STD_LOGIC;
  SIGNAL or_394_nl : STD_LOGIC;
  SIGNAL and_230_nl : STD_LOGIC;
  SIGNAL mux_340_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL and_339_nl : STD_LOGIC;
  SIGNAL mux_338_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL and_341_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL nor_103_nl : STD_LOGIC;
  SIGNAL mux_336_nl : STD_LOGIC;
  SIGNAL mux_335_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL mux_334_nl : STD_LOGIC;
  SIGNAL and_268_nl : STD_LOGIC;
  SIGNAL mux_333_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_23_nl : STD_LOGIC;
  SIGNAL nor_213_nl : STD_LOGIC;
  SIGNAL mux_353_nl : STD_LOGIC;
  SIGNAL mux_352_nl : STD_LOGIC;
  SIGNAL nand_42_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL and_257_nl : STD_LOGIC;
  SIGNAL mux_350_nl : STD_LOGIC;
  SIGNAL and_258_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL mux_348_nl : STD_LOGIC;
  SIGNAL mux_347_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL and_260_nl : STD_LOGIC;
  SIGNAL mux_345_nl : STD_LOGIC;
  SIGNAL mux_344_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_40_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL or_438_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL and_247_nl : STD_LOGIC;
  SIGNAL nand_37_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL or_466_nl : STD_LOGIC;
  SIGNAL mux_364_nl : STD_LOGIC;
  SIGNAL and_246_nl : STD_LOGIC;
  SIGNAL nand_36_nl : STD_LOGIC;
  SIGNAL or_496_nl : STD_LOGIC;
  SIGNAL nor_190_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL or_105_nl : STD_LOGIC;
  SIGNAL or_123_nl : STD_LOGIC;
  SIGNAL nor_148_nl : STD_LOGIC;
  SIGNAL nor_149_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL or_511_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL or_201_nl : STD_LOGIC;
  SIGNAL nand_78_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL or_238_nl : STD_LOGIC;
  SIGNAL or_246_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL or_267_nl : STD_LOGIC;
  SIGNAL or_36_nl : STD_LOGIC;
  SIGNAL nand_28_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL or_42_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL or_303_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL nor_119_nl : STD_LOGIC;
  SIGNAL mux_290_nl : STD_LOGIC;
  SIGNAL or_354_nl : STD_LOGIC;
  SIGNAL and_272_nl : STD_LOGIC;
  SIGNAL mux_295_nl : STD_LOGIC;
  SIGNAL or_347_nl : STD_LOGIC;
  SIGNAL or_346_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL mux_319_nl : STD_LOGIC;
  SIGNAL mux_343_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_342_nl : STD_LOGIC;
  SIGNAL nand_43_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nand_70_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL and_249_nl : STD_LOGIC;
  SIGNAL and_250_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL and_335_nl : STD_LOGIC;
  SIGNAL and_336_nl : STD_LOGIC;
  SIGNAL mux_356_nl : STD_LOGIC;
  SIGNAL mux_355_nl : STD_LOGIC;
  SIGNAL nand_71_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL and_337_nl : STD_LOGIC;
  SIGNAL and_338_nl : STD_LOGIC;
  SIGNAL nand_24_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL or_47_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL or_257_nl : STD_LOGIC;
  SIGNAL nand_74_nl : STD_LOGIC;
  SIGNAL nor_125_nl : STD_LOGIC;
  SIGNAL mux_332_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL or_400_nl : STD_LOGIC;
  SIGNAL mux_330_nl : STD_LOGIC;
  SIGNAL nand_32_nl : STD_LOGIC;
  SIGNAL mux_235_nl : STD_LOGIC;
  SIGNAL or_302_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL or_298_nl : STD_LOGIC;
  SIGNAL nor_220_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL nand_83_nl : STD_LOGIC;
  SIGNAL or_513_nl : STD_LOGIC;
  SIGNAL and_65_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL nor_185_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL and_314_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
  SIGNAL nor_187_nl : STD_LOGIC;
  SIGNAL and_67_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL nor_183_nl : STD_LOGIC;
  SIGNAL and_313_nl : STD_LOGIC;
  SIGNAL nor_184_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL nand_69_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nor_177_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL or_140_nl : STD_LOGIC;
  SIGNAL or_139_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL or_505_nl : STD_LOGIC;
  SIGNAL or_506_nl : STD_LOGIC;
  SIGNAL mux_110_nl : STD_LOGIC;
  SIGNAL or_507_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL or_133_nl : STD_LOGIC;
  SIGNAL or_131_nl : STD_LOGIC;
  SIGNAL or_508_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL and_310_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL and_311_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL nor_170_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL nor_173_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL or_147_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL nand_63_nl : STD_LOGIC;
  SIGNAL or_144_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL nand_67_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL and_340_nl : STD_LOGIC;
  SIGNAL and_308_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL nor_163_nl : STD_LOGIC;
  SIGNAL nor_164_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL or_502_nl : STD_LOGIC;
  SIGNAL or_503_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL nand_68_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL nor_168_nl : STD_LOGIC;
  SIGNAL or_504_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL and_304_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL and_305_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL and_306_nl : STD_LOGIC;
  SIGNAL nor_156_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nor_157_nl : STD_LOGIC;
  SIGNAL nor_158_nl : STD_LOGIC;
  SIGNAL nor_159_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL nor_160_nl : STD_LOGIC;
  SIGNAL nor_161_nl : STD_LOGIC;
  SIGNAL or_173_nl : STD_LOGIC;
  SIGNAL mux_130_nl : STD_LOGIC;
  SIGNAL or_172_nl : STD_LOGIC;
  SIGNAL or_170_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL nor_233_nl : STD_LOGIC;
  SIGNAL nor_234_nl : STD_LOGIC;
  SIGNAL mux_368_nl : STD_LOGIC;
  SIGNAL mux_367_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL or_532_nl : STD_LOGIC;
  SIGNAL nand_86_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL nor_232_nl : STD_LOGIC;
  SIGNAL and_466_nl : STD_LOGIC;
  SIGNAL nor_224_nl : STD_LOGIC;
  SIGNAL nor_225_nl : STD_LOGIC;
  SIGNAL or_537_nl : STD_LOGIC;
  SIGNAL or_536_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_18_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_or_53_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_19_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_31_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_and_65_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_70_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL COMP_LOOP_or_32_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_66_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_71_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_60_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_72_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_18_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_or_33_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_34_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_35_nl : STD_LOGIC;
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
  SIGNAL COMP_LOOP_or_36_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_and_67_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_73_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COMP_LOOP_nor_62_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_37_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_74_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_or_38_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_39_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_20_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL STAGE_LOOP_mux_2_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL operator_64_false_1_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_1_mux_10_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_11_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_12_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_13_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_14_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_15_nl : STD_LOGIC;
  SIGNAL operator_64_false_1_mux_16_nl : STD_LOGIC;
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
      fsm_output : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      STAGE_LOOP_C_10_tr0 : IN STD_LOGIC;
      modExp_while_C_47_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      VEC_LOOP_1_COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_1_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0 : IN STD_LOGIC;
      VEC_LOOP_2_COMP_LOOP_C_152_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_1_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_11_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_76_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_76_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0
      : STD_LOGIC;
  SIGNAL inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0 : STD_LOGIC;
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

  FUNCTION MUX1HOT_v_64_20_2(input_19 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(19 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 19));
      result := result or ( input_19 and tmp);
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
      modExp_while_C_47_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_1_COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0,
      VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_C_47_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_1_COMP_LOOP_C_76_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_76_tr0,
      VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0,
      VEC_LOOP_1_COMP_LOOP_C_152_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      VEC_LOOP_2_COMP_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0,
      VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_C_47_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_2_COMP_LOOP_C_76_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_76_tr0,
      VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0,
      VEC_LOOP_2_COMP_LOOP_C_152_tr0 => exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva,
      VEC_LOOP_C_1_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0,
      STAGE_LOOP_C_11_tr0 => inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0
    );
  fsm_output <= inPlaceNTT_DIT_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_10_tr0 <= NOT (READSLICE_1_65(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1'
      & (NOT operator_66_true_div_cmp_z_oreg)) + SIGNED'( "00000000000000000000000000000000000000000000000000000000000000001"),
      65)), 64));
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_1_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_C_76_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_C_47_tr0
      <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_1_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_C_76_tr0 <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_C_47_tr0
      <= NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm;
  inPlaceNTT_DIT_core_core_fsm_inst_VEC_LOOP_C_1_tr0 <= z_out_1(12);
  inPlaceNTT_DIT_core_core_fsm_inst_STAGE_LOOP_C_11_tr0 <= NOT (z_out_1(2));

  nand_51_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  or_210_cse <= (fsm_output(1)) OR (fsm_output(7));
  nor_140_cse <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  operator_66_true_div_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(reg_operator_66_true_div_cmp_b_reg));
  or_96_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_282_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_171_m1c <= and_dcpl_75 AND and_dcpl_36;
  modExp_result_and_rgt <= (NOT modExp_while_and_1_itm) AND and_171_m1c;
  modExp_result_and_1_rgt <= modExp_while_and_1_itm AND and_171_m1c;
  or_89_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"));
  and_271_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_492_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  COMP_LOOP_or_2_cse <= (and_dcpl_38 AND and_dcpl_33 AND and_dcpl_36) OR (CONV_SL_1_1(fsm_output(3
      DOWNTO 1)=STD_LOGIC_VECTOR'("011")) AND and_dcpl_33 AND and_dcpl_61 AND (NOT
      (fsm_output(6))) AND and_dcpl_20);
  or_71_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_74_cse <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  and_259_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_or_4_cse <= (and_dcpl_44 AND and_dcpl_24 AND and_dcpl_41 AND and_dcpl_20)
      OR (and_dcpl_58 AND and_dcpl_24 AND and_dcpl_41 AND and_dcpl) OR (and_dcpl_37
      AND (NOT (fsm_output(2))) AND and_dcpl_24 AND and_dcpl_68 AND and_dcpl_20)
      OR (and_dcpl_75 AND and_dcpl_73);
  modulo_result_rem_cmp_a_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(UNSIGNED'( UNSIGNED(modExp_result_sva)
      * UNSIGNED(COMP_LOOP_mux_1_itm)), 64));
  or_52_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("011"));
  VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w7 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_2_lpi_4_dfm)
      + SIGNED(COMP_LOOP_mux_1_itm_mx1), 64));
  modExp_while_mul_itm_mx0w10 <= STD_LOGIC_VECTOR(CONV_SIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_mux_1_itm)
      * UNSIGNED(COMP_LOOP_mux_1_itm)), 64));
  VEC_LOOP_1_COMP_LOOP_1_mul_mut_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(VEC_LOOP_1_COMP_LOOP_1_acc_8_itm)
      * SIGNED(COMP_LOOP_mux_1_itm)), 64));
  and_334_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"));
  operator_64_false_slc_modExp_exp_63_1_3 <= MUX_v_63_2_2((operator_66_true_div_cmp_z_oreg(63
      DOWNTO 1)), (VEC_LOOP_1_COMP_LOOP_1_acc_8_itm(63 DOWNTO 1)), and_dcpl_157);
  modulo_qr_sva_1_mx0w8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_mut(63
      DOWNTO 0)) + UNSIGNED(p_sva), 64));
  COMP_LOOP_mux_1_itm_mx1 <= MUX_v_64_2_2((operator_64_false_acc_mut(63 DOWNTO 0)),
      modulo_qr_sva_1_mx0w8, operator_64_false_acc_mut(63));
  modExp_1_while_and_11 <= (operator_64_false_acc_mut(63)) AND modExp_exp_1_0_1_sva;
  or_tmp_1 <= CONV_SL_1_1(fsm_output(8 DOWNTO 6)/=STD_LOGIC_VECTOR'("000"));
  nor_tmp_1 <= or_492_cse AND (fsm_output(3));
  nor_tmp_2 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  or_tmp_11 <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"));
  or_25_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  or_tmp_19 <= and_271_cse OR (fsm_output(3));
  or_tmp_29 <= (NOT (fsm_output(6))) OR (fsm_output(9)) OR (fsm_output(2));
  and_dcpl <= (fsm_output(7)) AND (NOT (fsm_output(9)));
  or_tmp_52 <= (NOT (fsm_output(7))) OR (fsm_output(9));
  or_100_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"));
  and_tmp_10 <= (fsm_output(4)) AND or_100_cse;
  or_496_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 0)/=STD_LOGIC_VECTOR'("000000000"));
  or_105_nl <= (fsm_output(8)) OR and_tmp_10;
  mux_99_nl <= MUX_s_1_2_2((fsm_output(8)), or_105_nl, fsm_output(5));
  nor_190_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))
      OR mux_99_nl);
  not_tmp_63 <= MUX_s_1_2_2(or_496_nl, nor_190_nl, fsm_output(9));
  and_dcpl_20 <= NOT((fsm_output(7)) OR (fsm_output(9)));
  and_dcpl_23 <= NOT((fsm_output(8)) OR (fsm_output(5)) OR (fsm_output(6)) OR (NOT
      and_dcpl_20));
  and_dcpl_24 <= NOT((fsm_output(0)) OR (fsm_output(4)));
  and_dcpl_25 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_26 <= and_dcpl_25 AND (NOT (fsm_output(2)));
  and_dcpl_30 <= (NOT (fsm_output(8))) AND (fsm_output(5));
  and_dcpl_31 <= and_dcpl_30 AND (NOT (fsm_output(6)));
  and_dcpl_32 <= and_dcpl_31 AND (NOT (fsm_output(7))) AND (fsm_output(9));
  and_dcpl_33 <= (NOT (fsm_output(0))) AND (fsm_output(4));
  and_dcpl_36 <= and_dcpl_31 AND and_dcpl_20;
  and_dcpl_37 <= (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_38 <= and_dcpl_37 AND (fsm_output(2));
  and_dcpl_41 <= and_dcpl_30 AND (fsm_output(6));
  and_dcpl_43 <= (fsm_output(3)) AND (fsm_output(1));
  and_dcpl_44 <= and_dcpl_43 AND (fsm_output(2));
  and_dcpl_52 <= (fsm_output(0)) AND (fsm_output(5));
  or_123_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_106 <= MUX_s_1_2_2(or_89_cse, or_123_nl, fsm_output(8));
  and_dcpl_58 <= and_dcpl_43 AND (NOT (fsm_output(2)));
  and_dcpl_61 <= (fsm_output(8)) AND (fsm_output(5));
  and_dcpl_68 <= and_dcpl_61 AND (fsm_output(6));
  and_dcpl_73 <= and_dcpl_68 AND and_dcpl;
  and_dcpl_75 <= and_dcpl_25 AND (fsm_output(2)) AND and_dcpl_24;
  and_dcpl_79 <= (NOT (fsm_output(0))) AND (fsm_output(5)) AND (NOT (fsm_output(9)));
  not_tmp_94 <= NOT((COMP_LOOP_acc_1_cse_2_sva(0)) AND (fsm_output(7)));
  and_dcpl_91 <= and_dcpl_38 AND and_dcpl_24 AND and_dcpl_23;
  and_dcpl_93 <= (NOT (fsm_output(8))) AND (NOT (fsm_output(6))) AND and_dcpl_20;
  mux_tmp_137 <= MUX_s_1_2_2(or_96_cse, or_25_cse, fsm_output(0));
  mux_tmp_138 <= MUX_s_1_2_2(and_dcpl_44, nor_tmp_2, fsm_output(0));
  or_tmp_154 <= (fsm_output(4)) OR mux_tmp_138;
  and_dcpl_98 <= NOT(CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("000")));
  mux_tmp_146 <= MUX_s_1_2_2(or_tmp_19, or_96_cse, fsm_output(0));
  and_tmp_11 <= (fsm_output(4)) AND mux_tmp_146;
  not_tmp_111 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("111111")));
  and_dcpl_100 <= (NOT (fsm_output(8))) AND (fsm_output(6));
  or_tmp_167 <= (CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))) OR
      (fsm_output(3));
  nor_148_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(3))));
  nor_149_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(3)));
  mux_150_cse <= MUX_s_1_2_2(nor_148_nl, nor_149_nl, fsm_output(1));
  nand_17_nl <= NOT((fsm_output(7)) AND mux_150_cse);
  or_201_nl <= (fsm_output(7)) OR (fsm_output(1)) OR (NOT (fsm_output(8))) OR (fsm_output(3));
  mux_151_nl <= MUX_s_1_2_2(nand_17_nl, or_201_nl, fsm_output(2));
  or_511_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")) OR mux_151_nl;
  nand_78_nl <= NOT((fsm_output(5)) AND (fsm_output(6)) AND (fsm_output(2)) AND (fsm_output(7))
      AND (fsm_output(1)) AND (fsm_output(8)) AND (fsm_output(3)));
  mux_152_nl <= MUX_s_1_2_2(or_511_nl, nand_78_nl, fsm_output(4));
  and_dcpl_106 <= NOT(mux_152_nl OR (fsm_output(0)) OR (fsm_output(9)));
  nor_tmp_38 <= (CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))) AND
      (fsm_output(3));
  mux_tmp_157 <= MUX_s_1_2_2(nor_tmp_2, nor_tmp_1, fsm_output(0));
  and_dcpl_108 <= and_259_cse AND (NOT (fsm_output(6)));
  and_dcpl_109 <= and_dcpl_108 AND and_dcpl;
  or_tmp_189 <= (fsm_output(2)) OR (NOT and_dcpl_43);
  mux_tmp_171 <= MUX_s_1_2_2(or_tmp_189, or_tmp_11, fsm_output(8));
  and_dcpl_110 <= NOT(mux_tmp_171 OR (fsm_output(0)));
  and_dcpl_111 <= and_dcpl_110 AND and_dcpl_109;
  and_dcpl_113 <= CONV_SL_1_1(fsm_output(9 DOWNTO 7)=STD_LOGIC_VECTOR'("001"));
  and_dcpl_119 <= CONV_SL_1_1(fsm_output(9 DOWNTO 7)=STD_LOGIC_VECTOR'("010"));
  not_tmp_141 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"))
      AND nor_tmp_38);
  and_dcpl_121 <= (fsm_output(8)) AND (fsm_output(6));
  or_tmp_201 <= (fsm_output(4)) OR mux_tmp_157;
  and_dcpl_127 <= CONV_SL_1_1(fsm_output(9 DOWNTO 7)=STD_LOGIC_VECTOR'("011"));
  or_tmp_204 <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0000"));
  and_dcpl_136 <= NOT((NOT(or_492_cse XOR (fsm_output(3)))) OR (fsm_output(4)) OR
      (fsm_output(8)) OR (fsm_output(5)) OR (fsm_output(6)) OR (NOT and_dcpl_20));
  or_238_nl <= (fsm_output(8)) OR (fsm_output(4));
  mux_181_nl <= MUX_s_1_2_2((fsm_output(8)), or_238_nl, fsm_output(5));
  or_tmp_207 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")) OR mux_181_nl;
  and_dcpl_137 <= (fsm_output(0)) AND (NOT (fsm_output(4)));
  and_dcpl_144 <= and_dcpl_58 AND (NOT((fsm_output(4)) XOR (fsm_output(5)))) AND
      (fsm_output(0)) AND (NOT (fsm_output(8))) AND (NOT (fsm_output(6))) AND and_dcpl_20;
  or_246_nl <= (NOT (fsm_output(8))) OR (NOT (fsm_output(7))) OR (fsm_output(2))
      OR (fsm_output(9)) OR (fsm_output(6));
  or_267_nl <= (NOT (fsm_output(7))) OR (NOT (fsm_output(2))) OR (fsm_output(9))
      OR (fsm_output(6));
  or_36_nl <= (fsm_output(7)) OR (fsm_output(6)) OR (fsm_output(9)) OR (fsm_output(2));
  mux_184_nl <= MUX_s_1_2_2(or_267_nl, or_36_nl, fsm_output(8));
  mux_tmp_185 <= MUX_s_1_2_2(or_246_nl, mux_184_nl, fsm_output(1));
  or_42_nl <= (NOT (fsm_output(6))) OR (fsm_output(9)) OR (NOT (fsm_output(2)));
  mux_32_nl <= MUX_s_1_2_2(or_42_nl, or_tmp_29, fsm_output(7));
  nand_28_nl <= NOT((fsm_output(8)) AND (fsm_output(1)) AND (NOT mux_32_nl));
  mux_tmp_187 <= MUX_s_1_2_2(nand_28_nl, mux_tmp_185, fsm_output(4));
  mux_188_nl <= MUX_s_1_2_2((fsm_output(6)), (NOT (fsm_output(6))), fsm_output(9));
  nand_23_nl <= NOT((fsm_output(2)) AND mux_188_nl);
  mux_189_nl <= MUX_s_1_2_2(nand_23_nl, or_tmp_29, fsm_output(7));
  or_252_cse <= (fsm_output(1)) OR (fsm_output(8)) OR mux_189_nl;
  and_dcpl_151 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("110"));
  and_dcpl_152 <= and_dcpl_151 AND and_dcpl;
  and_dcpl_153 <= and_dcpl_110 AND and_dcpl_152;
  and_dcpl_155 <= (fsm_output(0)) AND (fsm_output(4));
  and_dcpl_157 <= and_dcpl_58 AND and_dcpl_155 AND and_dcpl_36;
  or_tmp_263 <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0110"));
  and_dcpl_164 <= and_dcpl_155 AND (fsm_output(5)) AND (NOT (fsm_output(6))) AND
      (NOT (fsm_output(9)));
  or_tmp_267 <= (fsm_output(1)) OR (NOT (fsm_output(3)));
  or_303_nl <= (NOT (fsm_output(1))) OR (fsm_output(3));
  mux_tmp_236 <= MUX_s_1_2_2(or_tmp_267, or_303_nl, fsm_output(8));
  and_dcpl_165 <= NOT(mux_tmp_236 OR (NOT((fsm_output(2)) XOR (fsm_output(7)))));
  and_dcpl_166 <= and_dcpl_165 AND and_dcpl_164;
  and_dcpl_167 <= (fsm_output(6)) AND (NOT (fsm_output(9)));
  mux_237_nl <= MUX_s_1_2_2((NOT and_dcpl_44), or_89_cse, fsm_output(8));
  mux_238_nl <= MUX_s_1_2_2(mux_237_nl, mux_tmp_171, fsm_output(7));
  and_dcpl_171 <= (NOT mux_238_nl) AND (fsm_output(0));
  and_tmp_17 <= (fsm_output(4)) AND or_96_cse;
  or_tmp_271 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("10100"));
  or_tmp_273 <= (NOT (fsm_output(4))) OR (fsm_output(0)) OR (fsm_output(2)) OR (NOT
      and_dcpl_43);
  or_tmp_279 <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("01100"));
  and_dcpl_179 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("110"));
  or_318_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1001"));
  mux_255_nl <= MUX_s_1_2_2(or_318_nl, or_tmp_263, fsm_output(8));
  and_dcpl_181 <= NOT(mux_255_nl OR (fsm_output(0)));
  or_tmp_283 <= (fsm_output(6)) OR (fsm_output(4));
  mux_tmp_256 <= MUX_s_1_2_2((fsm_output(6)), or_tmp_283, fsm_output(5));
  or_tmp_284 <= (fsm_output(7)) OR mux_tmp_256;
  nor_tmp_56 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  nor_tmp_57 <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111"));
  mux_tmp_263 <= MUX_s_1_2_2((NOT or_tmp_283), (fsm_output(4)), fsm_output(5));
  nor_tmp_59 <= (fsm_output(6)) AND (fsm_output(4));
  mux_tmp_269 <= MUX_s_1_2_2((NOT or_tmp_283), nor_tmp_59, fsm_output(5));
  mux_271_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(6));
  mux_tmp_272 <= MUX_s_1_2_2(mux_271_nl, nor_tmp_59, fsm_output(5));
  and_tmp_19 <= (fsm_output(5)) AND or_tmp_283;
  or_tmp_295 <= (NOT (fsm_output(8))) OR (fsm_output(2)) OR (fsm_output(3));
  or_336_nl <= (fsm_output(8)) OR (NOT (fsm_output(2))) OR (fsm_output(3));
  mux_291_nl <= MUX_s_1_2_2(or_tmp_295, or_336_nl, fsm_output(1));
  nor_118_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(5)) OR (fsm_output(7)) OR
      mux_291_nl);
  or_354_nl <= (fsm_output(8)) OR (fsm_output(2)) OR (NOT (fsm_output(3)));
  mux_290_nl <= MUX_s_1_2_2(or_354_nl, or_tmp_295, fsm_output(1));
  nor_119_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(5))) OR (NOT (fsm_output(7)))
      OR mux_290_nl);
  mux_292_nl <= MUX_s_1_2_2(nor_118_nl, nor_119_nl, fsm_output(0));
  and_dcpl_186 <= mux_292_nl AND and_dcpl_167;
  and_dcpl_187 <= and_dcpl_108 AND and_dcpl_20;
  and_dcpl_189 <= (NOT mux_tmp_236) AND (fsm_output(2)) AND (fsm_output(0));
  and_dcpl_190 <= and_dcpl_189 AND and_dcpl_187;
  and_273_cse <= (fsm_output(2)) AND (fsm_output(7));
  and_272_nl <= (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(8));
  or_347_nl <= and_273_cse OR (fsm_output(8));
  or_346_nl <= (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(8));
  mux_295_nl <= MUX_s_1_2_2(or_347_nl, or_346_nl, fsm_output(1));
  mux_tmp_296 <= MUX_s_1_2_2(and_272_nl, mux_295_nl, fsm_output(3));
  and_dcpl_193 <= (NOT mux_tmp_236) AND (NOT (fsm_output(2))) AND (fsm_output(0));
  and_dcpl_194 <= and_dcpl_193 AND and_dcpl_109;
  mux_304_nl <= MUX_s_1_2_2(nand_51_cse, or_492_cse, fsm_output(8));
  and_dcpl_197 <= (NOT mux_304_nl) AND (fsm_output(3)) AND (NOT (fsm_output(0)));
  and_dcpl_198 <= and_dcpl_197 AND and_dcpl_187;
  or_dcpl_39 <= (fsm_output(7)) OR (fsm_output(9));
  or_dcpl_44 <= or_tmp_267 OR (NOT (fsm_output(2)));
  and_dcpl_202 <= and_dcpl_151 AND and_dcpl_20;
  or_tmp_335 <= (fsm_output(9)) OR (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))));
  mux_tmp_314 <= MUX_s_1_2_2(or_tmp_335, (fsm_output(9)), fsm_output(5));
  or_tmp_337 <= (fsm_output(9)) OR (NOT or_tmp_1);
  mux_319_nl <= MUX_s_1_2_2((NOT or_tmp_1), or_tmp_1, fsm_output(9));
  mux_tmp_320 <= MUX_s_1_2_2(mux_319_nl, or_tmp_335, fsm_output(5));
  or_tmp_341 <= NOT((fsm_output(8)) AND (fsm_output(2)) AND (fsm_output(1)) AND (NOT
      (fsm_output(3))));
  mux_tmp_326 <= MUX_s_1_2_2(or_dcpl_44, or_52_cse, fsm_output(8));
  or_dcpl_58 <= NOT((fsm_output(0)) AND (fsm_output(4)));
  nand_43_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")));
  mux_342_nl <= MUX_s_1_2_2(nand_43_nl, or_89_cse, fsm_output(8));
  nor_99_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)) OR (fsm_output(7)) OR
      mux_342_nl);
  nor_100_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))) OR (NOT (fsm_output(7)))
      OR mux_tmp_106);
  mux_343_nl <= MUX_s_1_2_2(nor_99_nl, nor_100_nl, fsm_output(0));
  and_dcpl_211 <= mux_343_nl AND (fsm_output(5)) AND (NOT (fsm_output(9)));
  nor_tmp_77 <= ((fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(4))) AND (fsm_output(5));
  nor_tmp_79 <= (and_273_cse OR (fsm_output(4))) AND (fsm_output(5));
  nor_tmp_81 <= (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(4)) AND (fsm_output(5));
  and_249_nl <= ((fsm_output(0)) OR (fsm_output(7))) AND (fsm_output(8)) AND (fsm_output(4))
      AND (fsm_output(5));
  and_250_nl <= or_74_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_358_nl <= MUX_s_1_2_2(and_249_nl, and_250_nl, fsm_output(1));
  nand_70_nl <= NOT((fsm_output(3)) AND mux_358_nl);
  and_335_nl <= (((fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(7)) AND (fsm_output(8)))
      OR (fsm_output(4))) AND (fsm_output(5));
  and_336_nl <= ((or_71_cse AND (fsm_output(7))) OR (fsm_output(8)) OR (fsm_output(4)))
      AND (fsm_output(5));
  mux_357_nl <= MUX_s_1_2_2(and_335_nl, and_336_nl, fsm_output(3));
  mux_359_nl <= MUX_s_1_2_2(nand_70_nl, mux_357_nl, fsm_output(6));
  nand_71_nl <= NOT((fsm_output(7)) AND (fsm_output(8)) AND (fsm_output(4)) AND (fsm_output(5)));
  nand_72_nl <= NOT((and_282_cse OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")))
      AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  mux_355_nl <= MUX_s_1_2_2(nand_71_nl, nand_72_nl, fsm_output(3));
  and_337_nl <= ((CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"))) OR
      (fsm_output(4))) AND (fsm_output(5));
  and_338_nl <= ((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(4)))
      AND (fsm_output(5));
  mux_354_nl <= MUX_s_1_2_2(and_337_nl, and_338_nl, fsm_output(3));
  mux_356_nl <= MUX_s_1_2_2(mux_355_nl, mux_354_nl, fsm_output(6));
  mux_360_nl <= MUX_s_1_2_2(mux_359_nl, mux_356_nl, fsm_output(2));
  and_dcpl_214 <= NOT(mux_360_nl OR (fsm_output(9)));
  or_dcpl_62 <= (fsm_output(8)) OR (NOT (fsm_output(5)));
  or_dcpl_63 <= or_dcpl_62 OR (fsm_output(6));
  or_dcpl_68 <= (fsm_output(0)) OR (fsm_output(4));
  or_dcpl_72 <= or_dcpl_62 OR (NOT (fsm_output(6)));
  or_dcpl_82 <= NOT((fsm_output(8)) AND (fsm_output(5)));
  or_dcpl_83 <= or_dcpl_82 OR (fsm_output(6));
  or_dcpl_84 <= or_dcpl_83 OR or_dcpl_39;
  or_dcpl_89 <= or_dcpl_82 OR (NOT (fsm_output(6)));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_26 AND and_dcpl_33 AND and_dcpl_32;
  operator_64_false_acc_mut_mx0c0 <= and_dcpl_26 AND and_dcpl_137 AND and_dcpl_23;
  or_47_nl <= (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(6))
      OR (fsm_output(9)) OR (fsm_output(2));
  mux_210_nl <= MUX_s_1_2_2(or_252_cse, or_47_nl, fsm_output(4));
  mux_194_nl <= MUX_s_1_2_2(mux_tmp_187, mux_210_nl, fsm_output(3));
  nand_24_nl <= NOT((fsm_output(5)) AND (NOT mux_194_nl));
  mux_190_nl <= MUX_s_1_2_2(mux_tmp_185, or_252_cse, fsm_output(4));
  mux_191_nl <= MUX_s_1_2_2(mux_190_nl, mux_tmp_187, fsm_output(3));
  or_257_nl <= (fsm_output(4)) OR (fsm_output(8)) OR (NOT (fsm_output(1))) OR (fsm_output(7))
      OR (fsm_output(2)) OR (fsm_output(9)) OR (fsm_output(6));
  nand_74_nl <= NOT((fsm_output(4)) AND (fsm_output(8)) AND (NOT (fsm_output(1)))
      AND (fsm_output(7)) AND (fsm_output(6)) AND (NOT (fsm_output(9))) AND (fsm_output(2)));
  mux_183_nl <= MUX_s_1_2_2(or_257_nl, nand_74_nl, fsm_output(3));
  mux_192_nl <= MUX_s_1_2_2(mux_191_nl, mux_183_nl, fsm_output(5));
  mux_195_itm <= MUX_s_1_2_2(nand_24_nl, mux_192_nl, fsm_output(0));
  VEC_LOOP_j_1_12_0_sva_11_0_mx0c1 <= and_dcpl_44 AND and_dcpl_137 AND and_dcpl_32;
  nor_125_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 4)/=STD_LOGIC_VECTOR'("00000"))
      OR nor_tmp_2);
  modExp_result_sva_mx0c0 <= MUX_s_1_2_2(nor_125_nl, or_tmp_207, fsm_output(9));
  VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
      <= (NOT mux_tmp_236) AND (fsm_output(2)) AND (NOT (fsm_output(0))) AND and_dcpl_187;
  VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
      <= and_dcpl_197 AND and_dcpl_202;
  or_400_nl <= (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0))) OR (fsm_output(8)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (NOT (fsm_output(3)));
  mux_330_nl <= MUX_s_1_2_2(or_tmp_341, mux_tmp_326, VEC_LOOP_j_1_12_0_sva_11_0(0));
  mux_331_nl <= MUX_s_1_2_2(or_400_nl, mux_330_nl, reg_VEC_LOOP_1_acc_1_psp_ftd_1(0));
  nand_32_nl <= NOT((COMP_LOOP_acc_1_cse_2_sva(0)) AND (NOT mux_tmp_106));
  mux_332_nl <= MUX_s_1_2_2(mux_331_nl, nand_32_nl, fsm_output(7));
  tmp_2_lpi_4_dfm_mx0c1 <= (NOT mux_332_nl) AND and_dcpl_164;
  or_302_nl <= (fsm_output(8)) OR (NOT (fsm_output(4))) OR (fsm_output(2)) OR (NOT
      and_dcpl_43);
  or_298_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("0011"));
  mux_234_nl <= MUX_s_1_2_2(or_tmp_263, or_298_nl, fsm_output(8));
  mux_235_nl <= MUX_s_1_2_2(or_302_nl, mux_234_nl, fsm_output(6));
  and_178_m1c <= (NOT mux_235_nl) AND and_dcpl_52 AND and_dcpl_20;
  nand_83_nl <= NOT((fsm_output(8)) AND (fsm_output(4)) AND (fsm_output(1)) AND (fsm_output(3)));
  or_513_nl <= (fsm_output(8)) OR (fsm_output(4)) OR (fsm_output(1)) OR (fsm_output(3));
  mux_102_nl <= MUX_s_1_2_2(nand_83_nl, or_513_nl, fsm_output(5));
  nor_220_nl <= NOT(mux_102_nl OR (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(6))
      OR (NOT and_dcpl));
  nor_185_nl <= NOT((NOT (fsm_output(8))) OR (NOT (fsm_output(4))) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(3)));
  and_314_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 1)=STD_LOGIC_VECTOR'("1011"));
  nor_186_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1000")));
  mux_103_nl <= MUX_s_1_2_2(and_314_nl, nor_186_nl, fsm_output(8));
  mux_104_nl <= MUX_s_1_2_2(nor_185_nl, mux_103_nl, fsm_output(7));
  nor_187_nl <= NOT((fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(4)) OR (NOT
      (fsm_output(2))) OR (fsm_output(1)) OR (NOT (fsm_output(3))));
  mux_105_nl <= MUX_s_1_2_2(mux_104_nl, nor_187_nl, fsm_output(9));
  and_65_nl <= mux_105_nl AND and_dcpl_52 AND (NOT (fsm_output(6)));
  nor_183_nl <= NOT((fsm_output(5)) OR (NOT (fsm_output(8))) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (NOT (fsm_output(3))));
  and_313_nl <= (fsm_output(5)) AND (NOT mux_tmp_106);
  mux_107_nl <= MUX_s_1_2_2(nor_183_nl, and_313_nl, fsm_output(7));
  nor_184_nl <= NOT((fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(8)) OR (NOT
      (fsm_output(2))) OR (NOT (fsm_output(1))) OR (fsm_output(3)));
  mux_108_nl <= MUX_s_1_2_2(mux_107_nl, nor_184_nl, fsm_output(9));
  and_67_nl <= mux_108_nl AND and_dcpl_33 AND (NOT (fsm_output(6)));
  vec_rsc_0_0_i_adra_d_pff <= MUX1HOT_v_11_5_2(z_out_2, (z_out_1(12 DOWNTO 2)), COMP_LOOP_acc_psp_1_sva,
      (COMP_LOOP_acc_10_cse_12_1_1_sva(11 DOWNTO 1)), (COMP_LOOP_acc_1_cse_2_sva(11
      DOWNTO 1)), STD_LOGIC_VECTOR'( COMP_LOOP_or_2_cse & COMP_LOOP_or_4_cse & nor_220_nl
      & and_65_nl & and_67_nl));
  vec_rsc_0_0_i_da_d_pff <= COMP_LOOP_mux_1_itm_mx1;
  nor_177_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(3))) OR (NOT (fsm_output(1)))
      OR (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) OR CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("011")));
  or_140_nl <= (NOT (fsm_output(1))) OR (fsm_output(8)) OR (NOT (fsm_output(9)))
      OR (fsm_output(7));
  or_139_nl <= (fsm_output(1)) OR (NOT (fsm_output(8))) OR (fsm_output(9)) OR (fsm_output(7));
  mux_113_nl <= MUX_s_1_2_2(or_140_nl, or_139_nl, fsm_output(3));
  nor_178_nl <= NOT((fsm_output(0)) OR (COMP_LOOP_acc_1_cse_2_sva(0)) OR mux_113_nl);
  mux_114_nl <= MUX_s_1_2_2(nor_177_nl, nor_178_nl, fsm_output(2));
  nand_69_nl <= NOT((fsm_output(4)) AND mux_114_nl);
  or_505_nl <= (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(1)) OR (VEC_LOOP_j_1_12_0_sva_11_0(0))
      OR CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("001"));
  or_506_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(3))) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      OR (fsm_output(1)) OR (fsm_output(8)) OR (NOT (fsm_output(9))) OR (fsm_output(7));
  mux_111_nl <= MUX_s_1_2_2(or_505_nl, or_506_nl, fsm_output(2));
  or_133_nl <= CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("011"));
  or_131_nl <= CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("010"));
  mux_109_nl <= MUX_s_1_2_2(or_133_nl, or_131_nl, fsm_output(1));
  or_507_nl <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      OR mux_109_nl;
  or_508_nl <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      OR (NOT (fsm_output(1))) OR (fsm_output(8)) OR (fsm_output(9)) OR (NOT (fsm_output(7)));
  mux_110_nl <= MUX_s_1_2_2(or_507_nl, or_508_nl, fsm_output(2));
  mux_112_nl <= MUX_s_1_2_2(mux_111_nl, mux_110_nl, fsm_output(4));
  mux_115_nl <= MUX_s_1_2_2(nand_69_nl, mux_112_nl, fsm_output(5));
  vec_rsc_0_0_i_wea_d_pff <= NOT(mux_115_nl OR (fsm_output(6)));
  nor_170_nl <= NOT((NOT (fsm_output(1))) OR (z_out_1(1)) OR (NOT (fsm_output(7))));
  nor_171_nl <= NOT((NOT (fsm_output(1))) OR (z_out_1(1)) OR (fsm_output(7)));
  mux_120_nl <= MUX_s_1_2_2(nor_170_nl, nor_171_nl, fsm_output(2));
  and_311_nl <= (fsm_output(3)) AND mux_120_nl;
  nor_172_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (z_out_1(1)) OR (NOT (fsm_output(7))));
  nor_173_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (z_out_1(1)) OR (fsm_output(7)));
  mux_119_nl <= MUX_s_1_2_2(nor_172_nl, nor_173_nl, fsm_output(3));
  mux_121_nl <= MUX_s_1_2_2(and_311_nl, mux_119_nl, fsm_output(8));
  and_310_nl <= (fsm_output(6)) AND mux_121_nl;
  nor_175_nl <= NOT((fsm_output(1)) OR (NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR (COMP_LOOP_acc_1_cse_2_sva(0)) OR (NOT (fsm_output(7))));
  nor_176_nl <= NOT((fsm_output(1)) OR (VEC_LOOP_j_1_12_0_sva_11_0(0)) OR (fsm_output(7)));
  mux_117_nl <= MUX_s_1_2_2(nor_175_nl, nor_176_nl, fsm_output(2));
  nand_6_nl <= NOT((fsm_output(3)) AND mux_117_nl);
  nand_63_nl <= NOT((fsm_output(1)) AND VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
      AND (NOT (COMP_LOOP_acc_1_cse_2_sva(0))) AND (fsm_output(7)));
  or_144_nl <= (NOT (fsm_output(1))) OR (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) OR (fsm_output(7));
  mux_116_nl <= MUX_s_1_2_2(nand_63_nl, or_144_nl, fsm_output(2));
  or_147_nl <= (fsm_output(3)) OR mux_116_nl;
  mux_118_nl <= MUX_s_1_2_2(nand_6_nl, or_147_nl, fsm_output(8));
  nor_174_nl <= NOT((fsm_output(6)) OR mux_118_nl);
  mux_122_nl <= MUX_s_1_2_2(and_310_nl, nor_174_nl, fsm_output(4));
  vec_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_122_nl AND and_dcpl_79;
  and_340_nl <= (NOT (fsm_output(0))) AND (fsm_output(3)) AND (fsm_output(1)) AND
      (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)) AND CONV_SL_1_1(fsm_output(9 DOWNTO 7)=STD_LOGIC_VECTOR'("011"));
  nor_163_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(8)) OR (NOT (fsm_output(9)))
      OR (fsm_output(7)));
  nor_164_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(8))) OR (fsm_output(9)) OR
      (fsm_output(7)));
  mux_127_nl <= MUX_s_1_2_2(nor_163_nl, nor_164_nl, fsm_output(3));
  and_308_nl <= (NOT((fsm_output(0)) OR (NOT (COMP_LOOP_acc_1_cse_2_sva(0))))) AND
      mux_127_nl;
  mux_128_nl <= MUX_s_1_2_2(and_340_nl, and_308_nl, fsm_output(2));
  nand_67_nl <= NOT((fsm_output(4)) AND mux_128_nl);
  or_502_nl <= (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(1)) OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0)))
      OR CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("001"));
  or_503_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(3))) OR (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0)))
      OR (fsm_output(1)) OR (fsm_output(8)) OR (NOT (fsm_output(9))) OR (fsm_output(7));
  mux_125_nl <= MUX_s_1_2_2(or_502_nl, or_503_nl, fsm_output(2));
  nor_167_nl <= NOT(CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("011")));
  nor_168_nl <= NOT(CONV_SL_1_1(fsm_output(9 DOWNTO 7)/=STD_LOGIC_VECTOR'("010")));
  mux_123_nl <= MUX_s_1_2_2(nor_167_nl, nor_168_nl, fsm_output(1));
  nand_68_nl <= NOT((NOT((NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0)))))
      AND mux_123_nl);
  or_504_nl <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0)))
      OR (NOT (fsm_output(1))) OR (fsm_output(8)) OR (fsm_output(9)) OR (NOT (fsm_output(7)));
  mux_124_nl <= MUX_s_1_2_2(nand_68_nl, or_504_nl, fsm_output(2));
  mux_126_nl <= MUX_s_1_2_2(mux_125_nl, mux_124_nl, fsm_output(4));
  mux_129_nl <= MUX_s_1_2_2(nand_67_nl, mux_126_nl, fsm_output(5));
  vec_rsc_0_1_i_wea_d_pff <= NOT(mux_129_nl OR (fsm_output(6)));
  and_306_nl <= (fsm_output(1)) AND (z_out_1(1)) AND (fsm_output(7));
  nor_156_nl <= NOT((NOT (fsm_output(1))) OR (NOT (z_out_1(1))) OR (fsm_output(7)));
  mux_134_nl <= MUX_s_1_2_2(and_306_nl, nor_156_nl, fsm_output(2));
  and_305_nl <= (fsm_output(3)) AND mux_134_nl;
  nor_157_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR (NOT((z_out_1(1)) AND (fsm_output(7)))));
  nor_158_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (z_out_1(1))) OR (fsm_output(7)));
  mux_133_nl <= MUX_s_1_2_2(nor_157_nl, nor_158_nl, fsm_output(3));
  mux_135_nl <= MUX_s_1_2_2(and_305_nl, mux_133_nl, fsm_output(8));
  and_304_nl <= (fsm_output(6)) AND mux_135_nl;
  nor_160_nl <= NOT((fsm_output(1)) OR (NOT VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm)
      OR not_tmp_94);
  nor_161_nl <= NOT((fsm_output(1)) OR (NOT (VEC_LOOP_j_1_12_0_sva_11_0(0))) OR (fsm_output(7)));
  mux_131_nl <= MUX_s_1_2_2(nor_160_nl, nor_161_nl, fsm_output(2));
  nand_12_nl <= NOT((fsm_output(3)) AND mux_131_nl);
  or_172_nl <= (NOT((fsm_output(1)) AND VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm))
      OR not_tmp_94;
  or_170_nl <= (NOT (fsm_output(1))) OR (NOT (reg_VEC_LOOP_1_acc_1_psp_ftd_1(0)))
      OR (fsm_output(7));
  mux_130_nl <= MUX_s_1_2_2(or_172_nl, or_170_nl, fsm_output(2));
  or_173_nl <= (fsm_output(3)) OR mux_130_nl;
  mux_132_nl <= MUX_s_1_2_2(nand_12_nl, or_173_nl, fsm_output(8));
  nor_159_nl <= NOT((fsm_output(6)) OR mux_132_nl);
  mux_136_nl <= MUX_s_1_2_2(and_304_nl, nor_159_nl, fsm_output(4));
  vec_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= mux_136_nl AND and_dcpl_79;
  nor_233_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(3)) OR (NOT (fsm_output(2))));
  nor_234_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(3))) OR (fsm_output(2)));
  mux_365_nl <= MUX_s_1_2_2(nor_233_nl, nor_234_nl, fsm_output(1));
  and_dcpl_232 <= mux_365_nl AND (fsm_output(5)) AND (fsm_output(6)) AND (NOT (fsm_output(4)))
      AND (NOT (fsm_output(9))) AND (fsm_output(7)) AND (NOT (fsm_output(0)));
  or_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("100010"));
  or_532_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 2)/=STD_LOGIC_VECTOR'("000001"));
  mux_367_nl <= MUX_s_1_2_2(or_nl, or_532_nl, fsm_output(8));
  nor_232_nl <= NOT((fsm_output(2)) OR (NOT (fsm_output(7))) OR (fsm_output(5)) OR
      (fsm_output(4)) OR (fsm_output(6)));
  and_466_nl <= (fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(4))
      AND (fsm_output(6));
  mux_366_nl <= MUX_s_1_2_2(nor_232_nl, and_466_nl, fsm_output(3));
  nand_86_nl <= NOT((fsm_output(8)) AND mux_366_nl);
  mux_368_nl <= MUX_s_1_2_2(mux_367_nl, nand_86_nl, fsm_output(1));
  and_dcpl_234 <= NOT(mux_368_nl OR (fsm_output(9)) OR (fsm_output(0)));
  and_dcpl_239 <= (NOT (fsm_output(6))) AND (fsm_output(4));
  and_dcpl_241 <= mux_150_cse AND and_dcpl_239 AND (fsm_output(5)) AND (NOT (fsm_output(9)))
      AND (NOT (fsm_output(7))) AND (fsm_output(2)) AND (NOT (fsm_output(0)));
  and_dcpl_242 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_244 <= NOT((fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(8)));
  and_dcpl_247 <= NOT((fsm_output(6)) OR (fsm_output(4)));
  and_dcpl_249 <= and_dcpl_247 AND (NOT (fsm_output(5))) AND and_dcpl_20;
  and_dcpl_250 <= and_dcpl_249 AND and_dcpl_244 AND and_dcpl_242;
  and_dcpl_253 <= (fsm_output(2)) AND (fsm_output(3)) AND (NOT (fsm_output(8)));
  and_dcpl_255 <= and_dcpl_249 AND and_dcpl_253 AND nor_140_cse;
  and_dcpl_256 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_261 <= and_dcpl_202 AND and_dcpl_253 AND and_dcpl_256;
  and_dcpl_262 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_266 <= and_dcpl_151 AND (NOT (fsm_output(9))) AND (fsm_output(7));
  and_dcpl_267 <= and_dcpl_266 AND and_dcpl_262 AND (NOT (fsm_output(8))) AND and_dcpl_256;
  and_dcpl_270 <= and_dcpl_202 AND and_dcpl_262 AND (fsm_output(8)) AND nor_140_cse;
  and_dcpl_272 <= (fsm_output(2)) AND (NOT (fsm_output(3))) AND (fsm_output(8));
  and_dcpl_274 <= and_dcpl_266 AND and_dcpl_272 AND nor_140_cse;
  and_dcpl_276 <= and_dcpl_239 AND (fsm_output(5));
  and_dcpl_278 <= and_dcpl_276 AND and_dcpl_20 AND and_dcpl_272 AND and_dcpl_242;
  and_dcpl_281 <= (fsm_output(9)) AND (NOT (fsm_output(7)));
  and_dcpl_284 <= and_dcpl_247 AND (fsm_output(5)) AND and_dcpl_281 AND and_dcpl_253
      AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_287 <= and_dcpl_276 AND and_dcpl_281 AND and_dcpl_244 AND nor_140_cse;
  nor_224_nl <= NOT((NOT (fsm_output(8))) OR (fsm_output(2)));
  nor_225_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(2))));
  mux_372_cse <= MUX_s_1_2_2(nor_224_nl, nor_225_nl, fsm_output(1));
  and_dcpl_343 <= mux_372_cse AND (NOT (fsm_output(6))) AND (fsm_output(4)) AND (fsm_output(5))
      AND (NOT (fsm_output(9))) AND (NOT (fsm_output(7))) AND (fsm_output(3)) AND
      (NOT (fsm_output(0)));
  or_537_nl <= (fsm_output(0)) OR (NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"))));
  or_536_nl <= (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7));
  mux_tmp <= MUX_s_1_2_2(or_537_nl, or_536_nl, fsm_output(4));
  COMP_LOOP_nor_3_itm <= NOT(and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287);
  COMP_LOOP_or_23_itm <= and_dcpl_261 OR and_dcpl_267;
  COMP_LOOP_or_24_itm <= and_dcpl_270 OR and_dcpl_274;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_63 = '0' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_26 AND and_dcpl_24 AND and_dcpl_23) OR STAGE_LOOP_i_3_0_sva_mx0c1)
          = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), (z_out_4(3
            DOWNTO 0)), STAGE_LOOP_i_3_0_sva_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( not_tmp_63 = '0' ) THEN
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
        modExp_exp_1_1_1_sva <= '0';
        modExp_exp_1_7_1_sva <= '0';
      ELSE
        reg_vec_rsc_triosy_0_1_obj_ld_cse <= and_dcpl_26 AND and_dcpl_33 AND CONV_SL_1_1(fsm_output(9
            DOWNTO 5)=STD_LOGIC_VECTOR'("10001")) AND (NOT (z_out_1(2)));
        modExp_exp_1_0_1_sva <= (COMP_LOOP_mux1h_13_nl AND (NOT and_dcpl_190)) OR
            and_dcpl_194;
        modExp_while_and_itm <= (NOT (modulo_result_rem_cmp_z(63))) AND modExp_exp_1_0_1_sva;
        modExp_while_and_1_itm <= (modulo_result_rem_cmp_z(63)) AND modExp_exp_1_0_1_sva;
        modExp_exp_1_1_1_sva <= COMP_LOOP_mux1h_23_nl AND (NOT(and_dcpl_189 AND and_dcpl_202));
        modExp_exp_1_7_1_sva <= COMP_LOOP_mux1h_40_nl AND (NOT(and_dcpl_193 AND and_dcpl_152));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_result_rem_cmp_a <= MUX1HOT_v_64_20_2(modulo_result_rem_cmp_a_mx0w0,
          modExp_while_if_mul_mut, modExp_while_mul_itm, VEC_LOOP_1_COMP_LOOP_1_mul_mut_1,
          VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_if_mul_mut, VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm,
          VEC_LOOP_1_COMP_LOOP_1_mul_mut, VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w7,
          COMP_LOOP_mux_1_itm, VEC_LOOP_1_COMP_LOOP_1_acc_8_itm, modExp_while_mul_itm_mx0w10,
          VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_mul_mut, VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_if_mul_itm,
          VEC_LOOP_1_COMP_LOOP_2_mul_mut, VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_if_mul_mut,
          VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_mul_itm, VEC_LOOP_2_COMP_LOOP_1_mul_mut,
          VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_mul_mut, VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_if_mul_itm,
          VEC_LOOP_2_COMP_LOOP_2_mul_mut, STD_LOGIC_VECTOR'( and_dcpl_91 & and_105_nl
          & and_106_nl & and_107_nl & and_111_nl & and_114_nl & nor_218_nl & and_dcpl_106
          & mux_160_nl & nor_208_nl & and_dcpl_111 & and_128_nl & and_130_nl & nor_214_nl
          & and_135_nl & and_138_nl & and_141_nl & and_145_nl & and_147_nl & and_148_nl));
      modulo_result_rem_cmp_b <= p_sva;
      operator_66_true_div_cmp_a <= MUX_v_65_2_2(z_out_1, operator_64_false_acc_mut,
          and_dcpl_136);
      reg_operator_66_true_div_cmp_b_reg <= MUX_v_10_2_2(STAGE_LOOP_lshift_psp_sva_mx0w0,
          STAGE_LOOP_lshift_psp_sva, and_dcpl_136);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_132_nl, or_tmp_207, fsm_output(9))) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        operator_64_false_acc_mut <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (operator_64_false_acc_mut_mx0c0 OR and_dcpl_144 OR (NOT mux_195_itm))
          = '1' ) THEN
        operator_64_false_acc_mut <= MUX1HOT_v_65_3_2(z_out_1, (STD_LOGIC_VECTOR'(
            "00") & operator_64_false_slc_modExp_exp_63_1_3), ('0' & modulo_result_rem_cmp_z),
            STD_LOGIC_VECTOR'( operator_64_false_acc_mut_mx0c0 & and_dcpl_144 & (NOT
            mux_195_itm)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_j_1_12_0_sva_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (and_dcpl_144 OR VEC_LOOP_j_1_12_0_sva_11_0_mx0c1) = '1' ) THEN
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
      ELSIF ( (MUX_s_1_2_2(and_nl, nor_251_nl, fsm_output(8))) = '1' ) THEN
        COMP_LOOP_k_9_1_1_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (z_out_4(7
            DOWNTO 0)), nand_85_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((modExp_exp_1_0_1_sva OR modExp_while_and_itm OR modExp_while_and_1_itm
          OR modExp_result_sva_mx0c0 OR (NOT mux_233_nl)) AND (modExp_result_sva_mx0c0
          OR modExp_result_and_rgt OR modExp_result_and_1_rgt)) = '1' ) THEN
        modExp_result_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            (operator_64_false_acc_mut(63 DOWNTO 0)), modulo_qr_sva_1_mx0w8, STD_LOGIC_VECTOR'(
            modExp_result_sva_mx0c0 & modExp_result_and_rgt & modExp_result_and_1_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_253_nl, or_534_nl, fsm_output(9))) = '1' ) THEN
        COMP_LOOP_mux_1_itm <= MUX1HOT_v_64_7_2(r_sva, (operator_64_false_acc_mut(63
            DOWNTO 0)), modulo_qr_sva_1_mx0w8, modExp_result_sva, vec_rsc_0_0_i_qa_d,
            vec_rsc_0_1_i_qa_d, VEC_LOOP_1_COMP_LOOP_1_acc_5_mut_mx0w7, STD_LOGIC_VECTOR'(
            and_176_nl & r_or_nl & r_or_1_nl & and_dcpl_166 & and_189_nl & and_193_nl
            & and_dcpl_106));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        VEC_LOOP_1_COMP_LOOP_1_acc_8_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((modExp_exp_1_0_1_sva OR and_dcpl_144 OR and_dcpl_166 OR and_dcpl_106)
          AND mux_289_nl) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_acc_8_itm <= MUX1HOT_v_64_5_2(('0' & operator_64_false_slc_modExp_exp_63_1_3),
            STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            (operator_64_false_acc_mut(63 DOWNTO 0)), modulo_qr_sva_1_mx0w8, (z_out_1(63
            DOWNTO 0)), STD_LOGIC_VECTOR'( and_dcpl_144 & and_dcpl_166 & COMP_LOOP_and_nl
            & COMP_LOOP_and_1_nl & and_dcpl_106));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_303_nl AND and_dcpl_93)) = '1' ) THEN
        modExp_while_if_mul_mut <= modulo_result_rem_cmp_a_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva <= '0';
      ELSIF ( (and_dcpl_91 OR and_dcpl_198 OR and_dcpl_153) = '1' ) THEN
        exit_VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_sva <= MUX1HOT_s_1_3_2((NOT (z_out_1(63))),
            (NOT z_out_5_8), (NOT (VEC_LOOP_1_COMP_LOOP_1_acc_11_nl(9))), STD_LOGIC_VECTOR'(
            and_dcpl_91 & and_dcpl_198 & and_dcpl_153));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_44 OR (NOT (fsm_output(0))) OR (fsm_output(4)) OR (fsm_output(8))
          OR (fsm_output(5)) OR (fsm_output(6)) OR or_dcpl_39)) = '1' ) THEN
        modExp_while_mul_itm <= modExp_while_mul_itm_mx0w10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_or_2_cse = '1' ) THEN
        COMP_LOOP_acc_psp_1_sva <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
          OR VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
          OR and_dcpl_111) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm
            <= MUX1HOT_s_1_3_2((z_out_1(9)), (z_out(9)), z_out_5_8, STD_LOGIC_VECTOR'(
            VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c0
            & VEC_LOOP_1_COMP_LOOP_1_operator_64_false_1_slc_operator_64_false_1_acc_9_1_itm_mx0c1
            & and_dcpl_111));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_tmp_320, mux_324_nl, fsm_output(4))) = '1' ) THEN
        COMP_LOOP_acc_1_cse_2_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_21_nl)
            + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0 & '1'),
            9), 12), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT mux_329_nl) AND and_dcpl_164) OR tmp_2_lpi_4_dfm_mx0c1) = '1' )
          THEN
        tmp_2_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_qa_d, vec_rsc_0_1_i_qa_d, tmp_2_lpi_4_dfm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_0_1_sva_1 <= '0';
      ELSIF ( (NOT(mux_340_nl AND (NOT (fsm_output(9))))) = '1' ) THEN
        modExp_exp_1_0_1_sva_1 <= MUX_s_1_2_2((COMP_LOOP_k_9_1_1_sva_7_0(0)), modExp_exp_1_1_1_sva,
            and_230_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_2_1_sva <= '0';
      ELSIF ( and_dcpl_214 = '0' ) THEN
        modExp_exp_1_2_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(1)), modExp_exp_1_3_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(2)), STD_LOGIC_VECTOR'( and_dcpl_190 & and_dcpl_211
            & and_dcpl_194));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_3_1_sva <= '0';
      ELSIF ( and_dcpl_214 = '0' ) THEN
        modExp_exp_1_3_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(2)), modExp_exp_1_4_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(3)), STD_LOGIC_VECTOR'( and_dcpl_190 & and_dcpl_211
            & and_dcpl_194));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_4_1_sva <= '0';
      ELSIF ( and_dcpl_214 = '0' ) THEN
        modExp_exp_1_4_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(3)), modExp_exp_1_5_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(4)), STD_LOGIC_VECTOR'( and_dcpl_190 & and_dcpl_211
            & and_dcpl_194));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_5_1_sva <= '0';
      ELSIF ( and_dcpl_214 = '0' ) THEN
        modExp_exp_1_5_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(4)), modExp_exp_1_6_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(5)), STD_LOGIC_VECTOR'( and_dcpl_190 & and_dcpl_211
            & and_dcpl_194));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modExp_exp_1_6_1_sva <= '0';
      ELSIF ( and_dcpl_214 = '0' ) THEN
        modExp_exp_1_6_1_sva <= MUX1HOT_s_1_3_2((COMP_LOOP_k_9_1_1_sva_7_0(5)), modExp_exp_1_7_1_sva,
            (COMP_LOOP_k_9_1_1_sva_7_0(6)), STD_LOGIC_VECTOR'( and_dcpl_190 & and_dcpl_211
            & and_dcpl_194));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_361_nl) AND and_dcpl_98)) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_if_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT and_dcpl_44) OR or_dcpl_58 OR or_dcpl_63 OR or_dcpl_39)) = '1'
          ) THEN
        VEC_LOOP_1_COMP_LOOP_1_modExp_1_while_mul_itm <= modExp_while_mul_itm_mx0w10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( COMP_LOOP_or_4_cse = '1' ) THEN
        COMP_LOOP_acc_10_cse_12_1_1_sva <= z_out_1(12 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_25_cse OR (fsm_output(0)) OR (NOT (fsm_output(4))) OR or_dcpl_72
          OR or_dcpl_39)) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_1_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_273 OR or_dcpl_63 OR or_tmp_52)) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_mul_mut <= modExp_while_mul_itm_mx0w10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_362_nl AND and_dcpl_113)) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_2_modExp_1_while_if_mul_itm <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_279 OR or_dcpl_72 OR or_tmp_52)) = '1' ) THEN
        VEC_LOOP_1_COMP_LOOP_2_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_363_nl) AND and_dcpl_119)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_if_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_89_cse OR or_dcpl_58 OR or_dcpl_84)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_1_modExp_1_while_mul_itm <= modExp_while_mul_itm_mx0w10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_189 OR or_dcpl_68 OR or_dcpl_89 OR or_dcpl_39)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_1_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_271 OR or_dcpl_83 OR or_tmp_52)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_mul_mut <= modExp_while_mul_itm_mx0w10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_364_nl AND and_dcpl_127)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_2_modExp_1_while_if_mul_itm <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_52_cse OR or_dcpl_68 OR or_dcpl_89 OR or_tmp_52)) = '1' ) THEN
        VEC_LOOP_2_COMP_LOOP_2_mul_mut <= VEC_LOOP_1_COMP_LOOP_1_mul_mut_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_VEC_LOOP_1_acc_1_psp_ftd_1 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (NOT(or_tmp_11 OR or_dcpl_58 OR or_dcpl_84)) = '1' ) THEN
        reg_VEC_LOOP_1_acc_1_psp_ftd_1 <= z_out_1(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  nor_nl <= NOT((fsm_output(4)) OR mux_tmp_137);
  mux_139_nl <= MUX_s_1_2_2(or_tmp_154, nor_nl, fsm_output(5));
  and_105_nl <= mux_139_nl AND and_dcpl_93;
  mux_140_nl <= MUX_s_1_2_2(mux_tmp_137, (NOT nor_tmp_1), fsm_output(4));
  and_106_nl <= mux_140_nl AND and_dcpl_36;
  and_300_nl <= (fsm_output(8)) AND (fsm_output(1)) AND (fsm_output(7)) AND (fsm_output(2));
  nor_152_nl <= NOT((fsm_output(8)) OR (fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(2)));
  mux_144_nl <= MUX_s_1_2_2(and_300_nl, nor_152_nl, fsm_output(4));
  and_299_nl <= (fsm_output(6)) AND mux_144_nl;
  nor_153_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(2))));
  nor_154_nl <= NOT((fsm_output(1)) OR (fsm_output(7)) OR (fsm_output(2)));
  mux_142_nl <= MUX_s_1_2_2(nor_153_nl, nor_154_nl, fsm_output(8));
  and_301_nl <= (fsm_output(4)) AND mux_142_nl;
  or_188_nl <= (fsm_output(1)) OR (NOT((fsm_output(7)) AND (fsm_output(2))));
  or_187_nl <= (NOT (fsm_output(1))) OR (fsm_output(7)) OR (fsm_output(2));
  mux_141_nl <= MUX_s_1_2_2(or_188_nl, or_187_nl, fsm_output(8));
  nor_155_nl <= NOT((fsm_output(4)) OR mux_141_nl);
  mux_143_nl <= MUX_s_1_2_2(and_301_nl, nor_155_nl, fsm_output(6));
  mux_145_nl <= MUX_s_1_2_2(and_299_nl, mux_143_nl, fsm_output(3));
  and_107_nl <= mux_145_nl AND and_dcpl_79;
  or_195_nl <= (fsm_output(5)) OR and_tmp_11;
  mux_147_nl <= MUX_s_1_2_2(not_tmp_111, or_195_nl, fsm_output(6));
  and_111_nl <= (NOT mux_147_nl) AND and_dcpl_98;
  nor_151_nl <= NOT((fsm_output(4)) OR nor_tmp_2);
  mux_148_nl <= MUX_s_1_2_2(and_tmp_11, nor_151_nl, fsm_output(5));
  and_114_nl <= mux_148_nl AND and_dcpl_100 AND and_dcpl_20;
  nand_80_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111"))
      AND or_100_cse);
  or_512_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")) OR or_tmp_167;
  mux_149_nl <= MUX_s_1_2_2(nand_80_nl, or_512_nl, fsm_output(7));
  nor_218_nl <= NOT(mux_149_nl OR CONV_SL_1_1(fsm_output(9 DOWNTO 8)/=STD_LOGIC_VECTOR'("00")));
  mux_158_nl <= MUX_s_1_2_2((NOT mux_tmp_146), mux_tmp_157, fsm_output(4));
  nor_144_nl <= NOT((fsm_output(6)) OR (fsm_output(5)) OR (NOT (fsm_output(8))) OR
      mux_158_nl);
  mux_154_nl <= MUX_s_1_2_2((NOT nor_tmp_38), and_334_cse, fsm_output(4));
  mux_153_nl <= MUX_s_1_2_2((NOT mux_tmp_137), nor_tmp_38, fsm_output(4));
  mux_155_nl <= MUX_s_1_2_2(mux_154_nl, mux_153_nl, fsm_output(8));
  nor_145_nl <= NOT((fsm_output(5)) OR mux_155_nl);
  and_292_nl <= (fsm_output(5)) AND (fsm_output(8)) AND (fsm_output(4)) AND (fsm_output(0))
      AND (fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(3));
  mux_156_nl <= MUX_s_1_2_2(nor_145_nl, and_292_nl, fsm_output(6));
  mux_159_nl <= MUX_s_1_2_2(nor_144_nl, mux_156_nl, fsm_output(7));
  nor_146_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0000"))
      OR and_tmp_11);
  mux_160_nl <= MUX_s_1_2_2(mux_159_nl, nor_146_nl, fsm_output(9));
  mux_168_nl <= MUX_s_1_2_2(or_74_cse, (NOT or_74_cse), fsm_output(9));
  nand_64_nl <= NOT((fsm_output(5)) AND mux_168_nl);
  nor_209_nl <= NOT((fsm_output(8)) OR (fsm_output(2)) OR (fsm_output(7)));
  mux_167_nl <= MUX_s_1_2_2(or_74_cse, nor_209_nl, fsm_output(9));
  nand_65_nl <= NOT((fsm_output(5)) AND mux_167_nl);
  mux_169_nl <= MUX_s_1_2_2(nand_64_nl, nand_65_nl, fsm_output(3));
  nand_66_nl <= NOT((NOT((NOT (fsm_output(9))) OR (fsm_output(8)) OR (NOT (fsm_output(2)))))
      AND (NOT(nor_140_cse OR (fsm_output(7)))));
  nand_50_nl <= NOT(nand_51_cse AND (fsm_output(7)));
  or_213_nl <= (fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(7));
  mux_164_nl <= MUX_s_1_2_2(nand_50_nl, or_213_nl, fsm_output(8));
  or_500_nl <= (fsm_output(9)) OR mux_164_nl;
  mux_165_nl <= MUX_s_1_2_2(nand_66_nl, or_500_nl, fsm_output(5));
  nand_52_nl <= NOT((fsm_output(2)) AND (fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(7)));
  and_291_nl <= (fsm_output(1)) AND (fsm_output(7));
  mux_161_nl <= MUX_s_1_2_2(and_291_nl, or_210_cse, fsm_output(0));
  nor_143_nl <= NOT((fsm_output(2)) OR mux_161_nl);
  mux_162_nl <= MUX_s_1_2_2(nand_52_nl, nor_143_nl, fsm_output(8));
  mux_163_nl <= MUX_s_1_2_2(mux_162_nl, or_74_cse, fsm_output(9));
  or_501_nl <= (fsm_output(5)) OR mux_163_nl;
  mux_166_nl <= MUX_s_1_2_2(mux_165_nl, or_501_nl, fsm_output(3));
  mux_170_nl <= MUX_s_1_2_2(mux_169_nl, mux_166_nl, fsm_output(4));
  nor_208_nl <= NOT(mux_170_nl OR (fsm_output(6)));
  and_287_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND mux_tmp_157;
  nor_138_nl <= NOT((fsm_output(5)) OR and_tmp_10);
  mux_172_nl <= MUX_s_1_2_2(and_287_nl, nor_138_nl, fsm_output(6));
  and_128_nl <= mux_172_nl AND and_dcpl_113;
  nor_137_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  mux_173_nl <= MUX_s_1_2_2(and_tmp_10, nor_137_nl, fsm_output(5));
  and_130_nl <= mux_173_nl AND and_dcpl_100 AND and_dcpl;
  or_509_nl <= (fsm_output(6)) OR (fsm_output(5)) OR (NOT (fsm_output(8))) OR (fsm_output(4))
      OR mux_tmp_137;
  nand_73_nl <= NOT((fsm_output(6)) AND (fsm_output(5)) AND (NOT (fsm_output(8)))
      AND or_tmp_154);
  mux_174_nl <= MUX_s_1_2_2(or_509_nl, nand_73_nl, fsm_output(7));
  nor_214_nl <= NOT(mux_174_nl OR (fsm_output(9)));
  or_228_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR and_334_cse;
  mux_175_nl <= MUX_s_1_2_2(not_tmp_141, or_228_nl, fsm_output(6));
  and_135_nl <= (NOT mux_175_nl) AND and_dcpl_119;
  or_493_nl <= (fsm_output(4)) OR and_334_cse;
  nor_135_nl <= NOT((fsm_output(4)) OR or_tmp_19);
  mux_176_nl <= MUX_s_1_2_2(or_493_nl, nor_135_nl, fsm_output(5));
  and_138_nl <= mux_176_nl AND and_dcpl_121 AND and_dcpl_20;
  and_285_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11")) AND or_tmp_201;
  nor_134_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000000")));
  mux_177_nl <= MUX_s_1_2_2(and_285_nl, nor_134_nl, fsm_output(7));
  and_141_nl <= mux_177_nl AND CONV_SL_1_1(fsm_output(9 DOWNTO 8)=STD_LOGIC_VECTOR'("01"));
  and_284_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND mux_tmp_146;
  nor_133_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"))
      OR mux_tmp_157);
  mux_178_nl <= MUX_s_1_2_2(and_284_nl, nor_133_nl, fsm_output(6));
  and_145_nl <= mux_178_nl AND and_dcpl_127;
  mux_179_nl <= MUX_s_1_2_2(or_tmp_201, (NOT or_tmp_204), fsm_output(5));
  and_147_nl <= mux_179_nl AND and_dcpl_121 AND and_dcpl;
  mux_180_nl <= MUX_s_1_2_2(or_tmp_167, (NOT mux_tmp_138), fsm_output(4));
  and_148_nl <= mux_180_nl AND and_dcpl_73;
  COMP_LOOP_and_5_nl <= (NOT and_dcpl_157) AND and_dcpl_144;
  nor_113_nl <= NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(2))) OR (fsm_output(7))
      OR (fsm_output(8)));
  nor_114_nl <= NOT((fsm_output(3)) OR (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(8)));
  mux_300_nl <= MUX_s_1_2_2(nor_113_nl, nor_114_nl, fsm_output(5));
  nor_115_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  mux_299_nl <= MUX_s_1_2_2(nor_115_nl, mux_tmp_296, fsm_output(5));
  mux_301_nl <= MUX_s_1_2_2(mux_300_nl, mux_299_nl, fsm_output(4));
  and_270_nl <= or_492_cse AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  or_344_nl <= and_271_cse OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00"));
  mux_294_nl <= MUX_s_1_2_2(and_270_nl, or_344_nl, fsm_output(3));
  mux_297_nl <= MUX_s_1_2_2(mux_tmp_296, mux_294_nl, fsm_output(0));
  nand_48_nl <= NOT((fsm_output(5)) AND mux_297_nl);
  or_341_nl <= (fsm_output(2)) OR (fsm_output(7)) OR (NOT (fsm_output(8)));
  or_339_nl <= (NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(8));
  mux_293_nl <= MUX_s_1_2_2(or_341_nl, or_339_nl, fsm_output(1));
  nor_116_nl <= NOT((fsm_output(5)) OR (NOT((fsm_output(0)) OR (fsm_output(3)) OR
      mux_293_nl)));
  mux_298_nl <= MUX_s_1_2_2(nand_48_nl, nor_116_nl, fsm_output(4));
  mux_302_nl <= MUX_s_1_2_2(mux_301_nl, mux_298_nl, fsm_output(6));
  and_212_nl <= mux_302_nl AND (NOT (fsm_output(9)));
  COMP_LOOP_mux1h_13_nl <= MUX1HOT_s_1_4_2((operator_66_true_div_cmp_z_oreg(0)),
      (VEC_LOOP_1_COMP_LOOP_1_acc_8_itm(0)), modExp_exp_1_0_1_sva_1, modExp_exp_1_0_1_sva,
      STD_LOGIC_VECTOR'( COMP_LOOP_and_5_nl & and_dcpl_157 & and_dcpl_186 & and_212_nl));
  and_257_nl <= or_492_cse AND (fsm_output(7)) AND (fsm_output(4)) AND (fsm_output(5));
  and_258_nl <= ((fsm_output(2)) OR (fsm_output(7))) AND CONV_SL_1_1(fsm_output(5
      DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_350_nl <= MUX_s_1_2_2(nor_tmp_81, and_258_nl, fsm_output(1));
  mux_351_nl <= MUX_s_1_2_2(and_257_nl, mux_350_nl, fsm_output(0));
  nand_42_nl <= NOT((fsm_output(3)) AND mux_351_nl);
  mux_348_nl <= MUX_s_1_2_2(nor_tmp_79, nor_tmp_77, or_71_cse);
  mux_349_nl <= MUX_s_1_2_2(and_259_cse, mux_348_nl, fsm_output(3));
  mux_352_nl <= MUX_s_1_2_2(nand_42_nl, mux_349_nl, fsm_output(6));
  and_260_nl <= ((fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(7)))
      AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_346_nl <= MUX_s_1_2_2(nor_tmp_81, and_260_nl, fsm_output(3));
  mux_344_nl <= MUX_s_1_2_2(nor_tmp_79, nor_tmp_77, and_282_cse);
  mux_345_nl <= MUX_s_1_2_2(mux_344_nl, (fsm_output(5)), fsm_output(3));
  mux_347_nl <= MUX_s_1_2_2((NOT mux_346_nl), mux_345_nl, fsm_output(6));
  mux_353_nl <= MUX_s_1_2_2(mux_352_nl, mux_347_nl, fsm_output(8));
  nor_213_nl <= NOT(mux_353_nl OR (fsm_output(9)));
  COMP_LOOP_mux1h_23_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_1_sva_7_0(7)), modExp_exp_1_2_1_sva,
      modExp_exp_1_1_1_sva, (COMP_LOOP_k_9_1_1_sva_7_0(1)), STD_LOGIC_VECTOR'( and_dcpl_190
      & and_dcpl_211 & nor_213_nl & and_dcpl_194));
  COMP_LOOP_mux1h_40_nl <= MUX1HOT_s_1_4_2((COMP_LOOP_k_9_1_1_sva_7_0(6)), modExp_exp_1_1_1_sva,
      modExp_exp_1_7_1_sva, (COMP_LOOP_k_9_1_1_sva_7_0(7)), STD_LOGIC_VECTOR'( and_dcpl_190
      & and_dcpl_198 & and_dcpl_214 & and_dcpl_194));
  nor_132_nl <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000000")));
  nor_128_nl <= NOT((fsm_output(8)) OR (fsm_output(4)) OR (fsm_output(2)) OR (NOT
      and_dcpl_43));
  nor_129_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(2)) OR (NOT and_dcpl_43));
  nor_130_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 1)/=STD_LOGIC_VECTOR'("1010")));
  mux_216_nl <= MUX_s_1_2_2(nor_129_nl, nor_130_nl, fsm_output(8));
  mux_217_nl <= MUX_s_1_2_2(nor_128_nl, mux_216_nl, fsm_output(5));
  nor_131_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(8)) OR (fsm_output(4)) OR
      (NOT and_dcpl_44));
  mux_218_nl <= MUX_s_1_2_2(mux_217_nl, nor_131_nl, fsm_output(9));
  nand_85_nl <= NOT(mux_218_nl AND (fsm_output(0)) AND (NOT (fsm_output(6))) AND
      (NOT (fsm_output(7))));
  nor_248_nl <= NOT((fsm_output(9)) OR (fsm_output(4)) OR (NOT (fsm_output(0))) OR
      (fsm_output(6)) OR (fsm_output(7)));
  nor_249_nl <= NOT((fsm_output(9)) OR mux_tmp);
  mux_374_nl <= MUX_s_1_2_2(nor_248_nl, nor_249_nl, fsm_output(5));
  nor_250_nl <= NOT((NOT (fsm_output(5))) OR (NOT (fsm_output(9))) OR (fsm_output(4))
      OR (NOT (fsm_output(0))) OR (fsm_output(6)) OR (fsm_output(7)));
  mux_375_nl <= MUX_s_1_2_2(mux_374_nl, nor_250_nl, fsm_output(2));
  and_nl <= (fsm_output(3)) AND (fsm_output(1)) AND mux_375_nl;
  nor_251_nl <= NOT((fsm_output(3)) OR (fsm_output(1)) OR (NOT (fsm_output(2))) OR
      (NOT (fsm_output(5))) OR (fsm_output(9)) OR mux_tmp);
  or_296_nl <= (fsm_output(8)) OR (fsm_output(4)) OR nor_tmp_2;
  or_294_nl <= (fsm_output(8)) OR (fsm_output(4)) OR (fsm_output(0)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (fsm_output(3));
  mux_232_nl <= MUX_s_1_2_2(or_296_nl, or_294_nl, fsm_output(5));
  nor_124_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"))
      OR mux_232_nl);
  mux_233_nl <= MUX_s_1_2_2(nor_124_nl, or_tmp_207, fsm_output(9));
  and_176_nl <= and_dcpl_58 AND and_dcpl_137 AND and_dcpl_23;
  r_or_nl <= ((NOT (operator_64_false_acc_mut(63))) AND and_178_m1c) OR (and_dcpl_181
      AND and_dcpl_179 AND (NOT (fsm_output(9))) AND (NOT (operator_64_false_acc_mut(63))));
  r_or_1_nl <= ((operator_64_false_acc_mut(63)) AND and_178_m1c) OR (and_dcpl_181
      AND and_dcpl_179 AND (NOT (fsm_output(9))) AND (operator_64_false_acc_mut(63)));
  and_189_nl <= and_dcpl_171 AND (NOT (fsm_output(4))) AND (NOT (COMP_LOOP_acc_10_cse_12_1_1_sva(0)))
      AND (fsm_output(5)) AND and_dcpl_167;
  and_193_nl <= and_dcpl_171 AND (NOT (fsm_output(4))) AND (COMP_LOOP_acc_10_cse_12_1_1_sva(0))
      AND (fsm_output(5)) AND and_dcpl_167;
  mux_250_nl <= MUX_s_1_2_2((NOT mux_tmp_146), nor_tmp_1, fsm_output(4));
  mux_251_nl <= MUX_s_1_2_2(or_tmp_279, mux_250_nl, fsm_output(8));
  or_314_nl <= (NOT (fsm_output(4))) OR (fsm_output(0)) OR (NOT and_dcpl_44);
  or_312_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("11000"));
  mux_249_nl <= MUX_s_1_2_2(or_314_nl, or_312_nl, fsm_output(8));
  mux_252_nl <= MUX_s_1_2_2(mux_251_nl, mux_249_nl, fsm_output(5));
  or_533_nl <= (fsm_output(6)) OR mux_252_nl;
  mux_245_nl <= MUX_s_1_2_2((NOT nor_tmp_38), and_dcpl_44, fsm_output(4));
  mux_244_nl <= MUX_s_1_2_2((NOT mux_tmp_137), (fsm_output(3)), fsm_output(4));
  mux_246_nl <= MUX_s_1_2_2(mux_245_nl, mux_244_nl, fsm_output(8));
  mux_243_nl <= MUX_s_1_2_2(or_tmp_273, or_tmp_271, fsm_output(8));
  mux_247_nl <= MUX_s_1_2_2(mux_246_nl, mux_243_nl, fsm_output(5));
  and_195_nl <= (fsm_output(4)) AND mux_tmp_137;
  mux_241_nl <= MUX_s_1_2_2(and_195_nl, or_tmp_154, fsm_output(8));
  nor_122_nl <= NOT((fsm_output(4)) OR nor_tmp_1);
  mux_239_nl <= MUX_s_1_2_2((NOT or_96_cse), and_334_cse, fsm_output(4));
  mux_240_nl <= MUX_s_1_2_2(nor_122_nl, mux_239_nl, fsm_output(8));
  mux_242_nl <= MUX_s_1_2_2(mux_241_nl, mux_240_nl, fsm_output(5));
  mux_248_nl <= MUX_s_1_2_2(mux_247_nl, (NOT mux_242_nl), fsm_output(6));
  mux_253_nl <= MUX_s_1_2_2(or_533_nl, mux_248_nl, fsm_output(7));
  or_534_nl <= CONV_SL_1_1(fsm_output(8 DOWNTO 5)/=STD_LOGIC_VECTOR'("0000")) OR
      and_tmp_17;
  COMP_LOOP_and_nl <= (NOT modExp_1_while_and_11) AND and_dcpl_186;
  COMP_LOOP_and_1_nl <= modExp_1_while_and_11 AND and_dcpl_186;
  mux_284_nl <= MUX_s_1_2_2(mux_tmp_269, mux_tmp_263, and_282_cse);
  mux_282_nl <= MUX_s_1_2_2(mux_tmp_263, and_tmp_19, fsm_output(0));
  mux_283_nl <= MUX_s_1_2_2(mux_282_nl, nor_tmp_57, fsm_output(1));
  mux_285_nl <= MUX_s_1_2_2(mux_284_nl, mux_283_nl, fsm_output(7));
  mux_286_nl <= MUX_s_1_2_2(mux_tmp_269, mux_285_nl, fsm_output(3));
  mux_279_nl <= MUX_s_1_2_2(mux_tmp_272, mux_tmp_263, or_71_cse);
  mux_278_nl <= MUX_s_1_2_2(mux_tmp_263, and_tmp_19, and_282_cse);
  mux_280_nl <= MUX_s_1_2_2(mux_279_nl, mux_278_nl, fsm_output(7));
  mux_277_nl <= MUX_s_1_2_2(nor_tmp_57, nor_tmp_56, or_210_cse);
  mux_281_nl <= MUX_s_1_2_2(mux_280_nl, mux_277_nl, fsm_output(3));
  mux_287_nl <= MUX_s_1_2_2(mux_286_nl, mux_281_nl, fsm_output(8));
  or_329_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  mux_273_nl <= MUX_s_1_2_2(mux_tmp_272, mux_tmp_269, or_329_nl);
  mux_270_nl <= MUX_s_1_2_2(mux_tmp_269, mux_tmp_263, or_71_cse);
  mux_274_nl <= MUX_s_1_2_2(mux_273_nl, mux_270_nl, fsm_output(7));
  mux_267_nl <= MUX_s_1_2_2(and_259_cse, nor_tmp_57, fsm_output(1));
  mux_268_nl <= MUX_s_1_2_2(mux_267_nl, nor_tmp_56, fsm_output(7));
  mux_275_nl <= MUX_s_1_2_2(mux_274_nl, mux_268_nl, fsm_output(3));
  mux_264_nl <= MUX_s_1_2_2(mux_tmp_263, and_259_cse, or_71_cse);
  mux_262_nl <= MUX_s_1_2_2(nor_tmp_57, nor_tmp_56, fsm_output(1));
  mux_265_nl <= MUX_s_1_2_2(mux_264_nl, mux_262_nl, fsm_output(7));
  nor_120_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10")));
  and_276_nl <= (fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(0));
  mux_261_nl <= MUX_s_1_2_2(nor_tmp_56, nor_120_nl, and_276_nl);
  mux_266_nl <= MUX_s_1_2_2(mux_265_nl, mux_261_nl, fsm_output(3));
  mux_276_nl <= MUX_s_1_2_2(mux_275_nl, mux_266_nl, fsm_output(8));
  mux_288_nl <= MUX_s_1_2_2(mux_287_nl, mux_276_nl, fsm_output(2));
  or_323_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  mux_258_nl <= MUX_s_1_2_2(mux_tmp_256, or_323_nl, and_282_cse);
  or_324_nl <= (fsm_output(7)) OR mux_258_nl;
  mux_259_nl <= MUX_s_1_2_2(or_tmp_284, or_324_nl, fsm_output(3));
  or_325_nl <= (fsm_output(8)) OR mux_259_nl;
  or_319_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  mux_257_nl <= MUX_s_1_2_2(or_tmp_284, or_319_nl, fsm_output(3));
  or_322_nl <= (fsm_output(8)) OR mux_257_nl;
  mux_260_nl <= MUX_s_1_2_2(or_325_nl, or_322_nl, fsm_output(2));
  mux_289_nl <= MUX_s_1_2_2(mux_288_nl, mux_260_nl, fsm_output(9));
  mux_303_nl <= MUX_s_1_2_2(or_tmp_154, (NOT or_tmp_204), fsm_output(5));
  VEC_LOOP_1_COMP_LOOP_1_acc_11_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out_4
      & '0') + SIGNED('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO 1)))) + SIGNED'(
      "0000000001"), 10));
  COMP_LOOP_mux_21_nl <= MUX_v_12_2_2(VEC_LOOP_j_1_12_0_sva_11_0, reg_VEC_LOOP_1_acc_1_psp_ftd_1,
      and_468_cse);
  mux_323_nl <= MUX_s_1_2_2(mux_tmp_320, or_tmp_337, fsm_output(3));
  mux_317_nl <= MUX_s_1_2_2(or_tmp_335, or_tmp_337, fsm_output(5));
  mux_318_nl <= MUX_s_1_2_2(mux_317_nl, mux_tmp_314, fsm_output(0));
  mux_321_nl <= MUX_s_1_2_2(mux_tmp_320, mux_318_nl, fsm_output(3));
  nor_70_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(5))));
  mux_315_nl <= MUX_s_1_2_2(or_tmp_337, or_tmp_335, nor_70_nl);
  mux_316_nl <= MUX_s_1_2_2(mux_315_nl, mux_tmp_314, fsm_output(3));
  mux_322_nl <= MUX_s_1_2_2(mux_321_nl, mux_316_nl, fsm_output(1));
  mux_324_nl <= MUX_s_1_2_2(mux_323_nl, mux_322_nl, fsm_output(2));
  mux_327_nl <= MUX_s_1_2_2(mux_tmp_326, or_tmp_341, VEC_LOOP_j_1_12_0_sva_11_0(0));
  or_396_nl <= (VEC_LOOP_j_1_12_0_sva_11_0(0)) OR (fsm_output(8)) OR (NOT (fsm_output(2)))
      OR (fsm_output(1)) OR (NOT (fsm_output(3)));
  mux_328_nl <= MUX_s_1_2_2(mux_327_nl, or_396_nl, reg_VEC_LOOP_1_acc_1_psp_ftd_1(0));
  or_394_nl <= (COMP_LOOP_acc_1_cse_2_sva(0)) OR mux_tmp_106;
  mux_329_nl <= MUX_s_1_2_2(mux_328_nl, or_394_nl, fsm_output(7));
  and_230_nl <= and_dcpl_165 AND and_dcpl_137 AND (fsm_output(5)) AND and_dcpl_167;
  and_341_nl <= (NOT((fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(8)))) AND
      (fsm_output(6));
  nor_102_nl <= NOT((fsm_output(8)) OR (NOT (fsm_output(6))));
  mux_337_nl <= MUX_s_1_2_2(and_341_nl, nor_102_nl, fsm_output(2));
  nor_103_nl <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(8))
      OR (NOT (fsm_output(6))));
  mux_338_nl <= MUX_s_1_2_2(mux_337_nl, nor_103_nl, fsm_output(3));
  and_339_nl <= (fsm_output(7)) AND mux_338_nl;
  mux_339_nl <= MUX_s_1_2_2((fsm_output(6)), and_339_nl, fsm_output(5));
  nor_104_nl <= NOT((fsm_output(3)) OR and_271_cse OR (fsm_output(8)) OR (NOT (fsm_output(6))));
  mux_335_nl <= MUX_s_1_2_2(nor_104_nl, (fsm_output(6)), fsm_output(7));
  and_268_nl <= (fsm_output(3)) AND (NOT((NOT(and_271_cse OR (fsm_output(8)))) OR
      (fsm_output(6))));
  nor_107_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(8))) OR (fsm_output(6)));
  nor_108_nl <= NOT((NOT((fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(8))))
      OR (fsm_output(6)));
  mux_333_nl <= MUX_s_1_2_2(nor_107_nl, nor_108_nl, fsm_output(3));
  mux_334_nl <= MUX_s_1_2_2(and_268_nl, mux_333_nl, fsm_output(7));
  mux_336_nl <= MUX_s_1_2_2(mux_335_nl, mux_334_nl, fsm_output(5));
  mux_340_nl <= MUX_s_1_2_2(mux_339_nl, mux_336_nl, fsm_output(4));
  or_438_nl <= (fsm_output(5)) OR and_tmp_17;
  mux_361_nl <= MUX_s_1_2_2(not_tmp_111, or_438_nl, fsm_output(6));
  and_247_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"));
  nand_37_nl <= NOT((fsm_output(5)) AND ((fsm_output(4)) OR or_tmp_167));
  mux_362_nl <= MUX_s_1_2_2(and_247_nl, nand_37_nl, fsm_output(6));
  or_466_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")) OR and_dcpl_44;
  mux_363_nl <= MUX_s_1_2_2(not_tmp_141, or_466_nl, fsm_output(6));
  and_246_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")) AND or_tmp_19;
  nand_36_nl <= NOT((fsm_output(5)) AND (CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000"))));
  mux_364_nl <= MUX_s_1_2_2(and_246_nl, nand_36_nl, fsm_output(6));
  COMP_LOOP_mux_18_nl <= MUX_v_10_2_2(('1' & (NOT (STAGE_LOOP_lshift_psp_sva(9 DOWNTO
      1)))), STAGE_LOOP_lshift_psp_sva, and_dcpl_232);
  COMP_LOOP_COMP_LOOP_nand_1_nl <= NOT(and_dcpl_232 AND (NOT(mux_372_cse AND (fsm_output(5))
      AND (fsm_output(6)) AND (NOT((fsm_output(4)) OR (fsm_output(9)) OR (fsm_output(7))))
      AND (fsm_output(3)) AND (NOT (fsm_output(0))))));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_18_nl & COMP_LOOP_COMP_LOOP_nand_1_nl)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0 & STD_LOGIC_VECTOR'(
      "11")), 10), 11), 11));
  z_out <= acc_nl(10 DOWNTO 1);
  COMP_LOOP_mux_19_nl <= MUX_s_1_2_2((tmp_2_lpi_4_dfm(63)), (p_sva(63)), and_dcpl_250);
  COMP_LOOP_COMP_LOOP_or_53_nl <= (COMP_LOOP_mux_19_nl AND COMP_LOOP_nor_3_itm) OR
      and_dcpl_241 OR and_dcpl_255;
  COMP_LOOP_mux1h_70_nl <= MUX1HOT_v_51_3_2((tmp_2_lpi_4_dfm(62 DOWNTO 12)), (p_sva(62
      DOWNTO 12)), (NOT (operator_64_false_acc_mut(62 DOWNTO 12))), STD_LOGIC_VECTOR'(
      and_dcpl_234 & and_dcpl_250 & and_dcpl_255));
  COMP_LOOP_and_65_nl <= MUX_v_51_2_2(STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000"),
      COMP_LOOP_mux1h_70_nl, COMP_LOOP_nor_3_itm);
  COMP_LOOP_or_31_nl <= MUX_v_51_2_2(COMP_LOOP_and_65_nl, STD_LOGIC_VECTOR'("111111111111111111111111111111111111111111111111111"),
      and_dcpl_241);
  COMP_LOOP_mux1h_71_nl <= MUX1HOT_v_2_5_2((tmp_2_lpi_4_dfm(11 DOWNTO 10)), (p_sva(11
      DOWNTO 10)), (NOT (operator_64_false_acc_mut(11 DOWNTO 10))), (VEC_LOOP_j_1_12_0_sva_11_0(11
      DOWNTO 10)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11 DOWNTO 10)), STD_LOGIC_VECTOR'(
      and_dcpl_234 & and_dcpl_250 & and_dcpl_255 & and_dcpl_278 & and_dcpl_284));
  COMP_LOOP_nor_60_nl <= NOT(and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_287);
  COMP_LOOP_and_66_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_71_nl,
      COMP_LOOP_nor_60_nl);
  COMP_LOOP_or_32_nl <= MUX_v_2_2_2(COMP_LOOP_and_66_nl, STD_LOGIC_VECTOR'("11"),
      and_dcpl_241);
  COMP_LOOP_acc_18_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_lshift_psp_sva(9
      DOWNTO 1)) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0),
      8), 9), 9));
  COMP_LOOP_or_33_nl <= and_dcpl_261 OR and_dcpl_270;
  COMP_LOOP_or_34_nl <= and_dcpl_267 OR and_dcpl_274;
  COMP_LOOP_mux1h_72_nl <= MUX1HOT_v_10_9_2((tmp_2_lpi_4_dfm(9 DOWNTO 0)), ('1' &
      (NOT COMP_LOOP_k_9_1_1_sva_7_0) & '1'), (p_sva(9 DOWNTO 0)), (NOT (operator_64_false_acc_mut(9
      DOWNTO 0))), (STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_18_nl),
      9)) & (STAGE_LOOP_lshift_psp_sva(0))), z_out, (VEC_LOOP_j_1_12_0_sva_11_0(9
      DOWNTO 0)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(9 DOWNTO 0)), (STD_LOGIC_VECTOR'(
      "0000000") & (z_out_4(3 DOWNTO 1))), STD_LOGIC_VECTOR'( and_dcpl_234 & and_dcpl_241
      & and_dcpl_250 & and_dcpl_255 & COMP_LOOP_or_33_nl & COMP_LOOP_or_34_nl & and_dcpl_278
      & and_dcpl_284 & and_dcpl_287));
  COMP_LOOP_or_35_nl <= (NOT(and_dcpl_241 OR and_dcpl_250 OR and_dcpl_255 OR and_dcpl_261
      OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274 OR and_dcpl_278 OR and_dcpl_284
      OR and_dcpl_287)) OR and_dcpl_234;
  COMP_LOOP_COMP_LOOP_or_54_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(63)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_55_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(62)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_56_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(61)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_57_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(60)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_58_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(59)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_59_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(58)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_60_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(57)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_61_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(56)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_62_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(55)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_63_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(54)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_64_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(53)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_65_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(52)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_66_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(51)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_67_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(50)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_68_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(49)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_69_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(48)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_70_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(47)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_71_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(46)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_72_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(45)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_73_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(44)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_74_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(43)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_75_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(42)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_76_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(41)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_77_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(40)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_78_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(39)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_79_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(38)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_80_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(37)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_81_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(36)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_82_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(35)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_83_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(34)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_84_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(33)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_85_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(32)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_86_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(31)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_87_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(30)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_88_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(29)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_89_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(28)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_90_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(27)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_91_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(26)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_92_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(25)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_93_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(24)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_94_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(23)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_95_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(22)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_96_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(21)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_97_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(20)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_98_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(19)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_99_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(18)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_100_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(17)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_101_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(16)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_102_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(15)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_103_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(14)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_104_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(13)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_COMP_LOOP_or_105_nl <= (NOT((COMP_LOOP_mux_1_itm_mx1(12)) OR and_dcpl_241
      OR and_dcpl_255 OR and_dcpl_261 OR and_dcpl_267 OR and_dcpl_270 OR and_dcpl_274
      OR and_dcpl_278 OR and_dcpl_284 OR and_dcpl_287)) OR and_dcpl_250;
  COMP_LOOP_mux1h_73_nl <= MUX1HOT_v_2_3_2((NOT (COMP_LOOP_mux_1_itm_mx1(11 DOWNTO
      10))), (VEC_LOOP_j_1_12_0_sva_11_0(11 DOWNTO 10)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11
      DOWNTO 10)), STD_LOGIC_VECTOR'( and_dcpl_234 & COMP_LOOP_or_23_itm & COMP_LOOP_or_24_itm));
  COMP_LOOP_nor_62_nl <= NOT(and_dcpl_241 OR and_dcpl_255 OR and_dcpl_278 OR and_dcpl_284
      OR and_dcpl_287);
  COMP_LOOP_and_67_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), COMP_LOOP_mux1h_73_nl,
      COMP_LOOP_nor_62_nl);
  COMP_LOOP_or_36_nl <= MUX_v_2_2_2(COMP_LOOP_and_67_nl, STD_LOGIC_VECTOR'("11"),
      and_dcpl_250);
  COMP_LOOP_or_38_nl <= and_dcpl_241 OR and_dcpl_255;
  COMP_LOOP_or_39_nl <= and_dcpl_278 OR and_dcpl_284;
  COMP_LOOP_mux1h_74_nl <= MUX1HOT_v_10_6_2((NOT (COMP_LOOP_mux_1_itm_mx1(9 DOWNTO
      0))), STD_LOGIC_VECTOR'( "0000000001"), (VEC_LOOP_j_1_12_0_sva_11_0(9 DOWNTO
      0)), (reg_VEC_LOOP_1_acc_1_psp_ftd_1(9 DOWNTO 0)), STAGE_LOOP_lshift_psp_sva,
      STD_LOGIC_VECTOR'( "0000000011"), STD_LOGIC_VECTOR'( and_dcpl_234 & COMP_LOOP_or_38_nl
      & COMP_LOOP_or_23_itm & COMP_LOOP_or_24_itm & COMP_LOOP_or_39_nl & and_dcpl_287));
  COMP_LOOP_or_37_nl <= MUX_v_10_2_2(COMP_LOOP_mux1h_74_nl, STD_LOGIC_VECTOR'("1111111111"),
      and_dcpl_250);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_COMP_LOOP_or_53_nl
      & COMP_LOOP_or_31_nl & COMP_LOOP_or_32_nl & COMP_LOOP_mux1h_72_nl & COMP_LOOP_or_35_nl),
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
      & COMP_LOOP_or_36_nl & COMP_LOOP_or_37_nl & '1'), 65), 66), 66));
  z_out_1 <= acc_1_nl(65 DOWNTO 1);
  and_468_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("011")) AND
      and_dcpl_20 AND (fsm_output(2)) AND (NOT (fsm_output(3))) AND (fsm_output(8))
      AND (fsm_output(1)) AND (NOT (fsm_output(0)));
  COMP_LOOP_mux_20_nl <= MUX_v_11_2_2((VEC_LOOP_j_1_12_0_sva_11_0(11 DOWNTO 1)),
      (reg_VEC_LOOP_1_acc_1_psp_ftd_1(11 DOWNTO 1)), and_468_cse);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_20_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_9_1_1_sva_7_0),
      8), 11), 11));
  STAGE_LOOP_mux_2_nl <= MUX_v_8_2_2((STD_LOGIC_VECTOR'( "0000") & STAGE_LOOP_i_3_0_sva),
      COMP_LOOP_k_9_1_1_sva_7_0, and_dcpl_232);
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_mux_2_nl),
      9) + UNSIGNED'( "000000001"), 9));
  operator_64_false_1_mux_10_nl <= MUX_s_1_2_2((NOT modExp_exp_1_7_1_sva), (NOT modExp_exp_1_1_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_11_nl <= MUX_s_1_2_2((NOT modExp_exp_1_6_1_sva), (NOT modExp_exp_1_7_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_12_nl <= MUX_s_1_2_2((NOT modExp_exp_1_5_1_sva), (NOT modExp_exp_1_6_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_13_nl <= MUX_s_1_2_2((NOT modExp_exp_1_4_1_sva), (NOT modExp_exp_1_5_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_14_nl <= MUX_s_1_2_2((NOT modExp_exp_1_3_1_sva), (NOT modExp_exp_1_4_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_15_nl <= MUX_s_1_2_2((NOT modExp_exp_1_2_1_sva), (NOT modExp_exp_1_3_1_sva),
      and_dcpl_343);
  operator_64_false_1_mux_16_nl <= MUX_s_1_2_2((NOT modExp_exp_1_1_1_sva), (NOT modExp_exp_1_2_1_sva),
      and_dcpl_343);
  operator_64_false_1_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( '1' & operator_64_false_1_mux_10_nl
      & operator_64_false_1_mux_11_nl & operator_64_false_1_mux_12_nl & operator_64_false_1_mux_13_nl
      & operator_64_false_1_mux_14_nl & operator_64_false_1_mux_15_nl & operator_64_false_1_mux_16_nl
      & (NOT modExp_exp_1_0_1_sva_1)) + UNSIGNED'( "000000001"), 9));
  z_out_5_8 <= operator_64_false_1_acc_nl(8);
END v6;

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

ARCHITECTURE v6 OF inPlaceNTT_DIT IS
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

END v6;



