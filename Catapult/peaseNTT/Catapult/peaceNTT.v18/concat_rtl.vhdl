
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.vhd 
-- Memory Type:            BLOCK
-- Operating Mode:         Simple Dual Port (2-Port)
-- Clock Mode:             Single Clock
-- 
-- RTL Code RW Resolution: RBW
-- Catapult RW Resolution: RBW
-- 
-- HDL Work Library:       Xilinx_RAMS_lib
-- Component Name:         BLOCK_1R1W_RBW
-- Latency = 1:            RAM with no registers on inputs or outputs
--         = 2:            adds embedded register on RAM output
--         = 3:            adds fabric registers to non-clock input RAM pins
--         = 4:            adds fabric register to output (driven by embedded register from latency=2)

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
PACKAGE BLOCK_1R1W_RBW_pkg IS
  COMPONENT BLOCK_1R1W_RBW IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    clk : in std_logic ;
    clken : in std_logic ;
    d : in std_logic_vector(data_width-1 downto 0) ;
    q : out std_logic_vector(data_width-1 downto 0) ;
    radr : in std_logic_vector(addr_width-1 downto 0) ;
    wadr : in std_logic_vector(addr_width-1 downto 0) ;
    we : in std_logic 
    
  );
  END COMPONENT;
END BLOCK_1R1W_RBW_pkg;
LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
ENTITY BLOCK_1R1W_RBW IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    clk : in std_logic ;
    clken : in std_logic ;
    d : in std_logic_vector(data_width-1 downto 0) ;
    q : out std_logic_vector(data_width-1 downto 0) ;
    radr : in std_logic_vector(addr_width-1 downto 0) ;
    wadr : in std_logic_vector(addr_width-1 downto 0) ;
    we : in std_logic 
    
  );
 END BLOCK_1R1W_RBW;
ARCHITECTURE rtl OF BLOCK_1R1W_RBW IS
  TYPE ram_t IS ARRAY (depth-1 DOWNTO 0) OF std_logic_vector(data_width-1 DOWNTO 0);
  SIGNAL mem : ram_t := (OTHERS => (OTHERS => '0'));
  ATTRIBUTE ram_style: STRING;
  ATTRIBUTE ram_style OF mem : SIGNAL IS "block";
  ATTRIBUTE syn_ramstyle: STRING;
  ATTRIBUTE syn_ramstyle OF mem : SIGNAL IS "block";
  
  SIGNAL ramq : std_logic_vector(data_width-1 downto 0);
  
BEGIN
-- Port Map
-- readA :: CLOCK clk ENABLE clken DATA_OUT q ADDRESS radr
-- writeA :: CLOCK clk ENABLE clken DATA_IN d ADDRESS wadr WRITE_ENABLE we

-- Access memory with non-registered inputs (latency = 1||2)
  IN_PIN :  IF latency < 3 GENERATE
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
         IF (clken = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(radr)) < depth) THEN
          --pragma translate_on
          ramq <= mem(to_integer(unsigned(radr)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (we = '1') THEN
            mem(to_integer(unsigned(wadr))) <= d;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_PIN; 

-- Register all non-clock inputs (latency = 3||4)
  IN_REG :  IF latency > 2 GENERATE
    SIGNAL radr_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL d_reg : std_logic_vector(data_width-1 downto 0);
    SIGNAL wadr_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL we_reg : std_logic;
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          radr_reg <= radr;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          d_reg <= d;
          wadr_reg <= wadr;
          we_reg <= we;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
         IF (clken = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(radr_reg)) < depth) THEN
          --pragma translate_on
          ramq <= mem(to_integer(unsigned(radr_reg)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (we_reg = '1') THEN
            mem(to_integer(unsigned(wadr_reg))) <= d_reg;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_REG;

  out_ram : IF latency = 1 GENERATE
  BEGIN
    q <= ramq;
    
  END GENERATE out_ram;

  out_reg1 : IF ((latency = 2) OR (latency = 3)) GENERATE
    SIGNAL tmpq : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmpq <= ramq;
        END IF;
      END IF;
    END PROCESS;
    
    q <= tmpq;
    
  END GENERATE out_reg1;

  out_reg2 : IF latency = 4 GENERATE
    SIGNAL tmp1q : std_logic_vector(data_width-1 downto 0);
    
    SIGNAL tmp2q : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmp1q <= ramq;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clk)
    BEGIN
      IF (rising_edge(clk)) THEN
        IF (clken = '1') THEN
          tmp2q <= tmp1q;
        END IF;
      END IF;
    END PROCESS;
    
    q <= tmp2q;
    
  END GENERATE out_reg2;


END rtl;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Wed Jun 16 22:58:58 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen;

ARCHITECTURE v18 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_467_tr0 : IN STD_LOGIC;
    COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END peaceNTT_core_core_fsm;

ARCHITECTURE v18 OF peaceNTT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for peaceNTT_core_core_fsm_1
  TYPE peaceNTT_core_core_fsm_1_ST IS (main_C_0, COPY_LOOP_C_0, COPY_LOOP_C_1, COPY_LOOP_C_2,
      STAGE_LOOP_C_0, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_C_3,
      COMP_LOOP_C_4, COMP_LOOP_C_5, COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8,
      COMP_LOOP_C_9, COMP_LOOP_C_10, COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13,
      COMP_LOOP_C_14, COMP_LOOP_C_15, COMP_LOOP_C_16, COMP_LOOP_C_17, COMP_LOOP_C_18,
      COMP_LOOP_C_19, COMP_LOOP_C_20, COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23,
      COMP_LOOP_C_24, COMP_LOOP_C_25, COMP_LOOP_C_26, COMP_LOOP_C_27, COMP_LOOP_C_28,
      COMP_LOOP_C_29, COMP_LOOP_C_30, COMP_LOOP_C_31, COMP_LOOP_C_32, COMP_LOOP_C_33,
      COMP_LOOP_C_34, COMP_LOOP_C_35, COMP_LOOP_C_36, COMP_LOOP_C_37, COMP_LOOP_C_38,
      COMP_LOOP_C_39, COMP_LOOP_C_40, COMP_LOOP_C_41, COMP_LOOP_C_42, COMP_LOOP_C_43,
      COMP_LOOP_C_44, COMP_LOOP_C_45, COMP_LOOP_C_46, COMP_LOOP_C_47, COMP_LOOP_C_48,
      COMP_LOOP_C_49, COMP_LOOP_C_50, COMP_LOOP_C_51, COMP_LOOP_C_52, COMP_LOOP_C_53,
      COMP_LOOP_C_54, COMP_LOOP_C_55, COMP_LOOP_C_56, COMP_LOOP_C_57, COMP_LOOP_C_58,
      COMP_LOOP_C_59, COMP_LOOP_C_60, COMP_LOOP_C_61, COMP_LOOP_C_62, COMP_LOOP_C_63,
      COMP_LOOP_C_64, COMP_LOOP_C_65, COMP_LOOP_C_66, COMP_LOOP_C_67, COMP_LOOP_C_68,
      COMP_LOOP_C_69, COMP_LOOP_C_70, COMP_LOOP_C_71, COMP_LOOP_C_72, COMP_LOOP_C_73,
      COMP_LOOP_C_74, COMP_LOOP_C_75, COMP_LOOP_C_76, COMP_LOOP_C_77, COMP_LOOP_C_78,
      COMP_LOOP_C_79, COMP_LOOP_C_80, COMP_LOOP_C_81, COMP_LOOP_C_82, COMP_LOOP_C_83,
      COMP_LOOP_C_84, COMP_LOOP_C_85, COMP_LOOP_C_86, COMP_LOOP_C_87, COMP_LOOP_C_88,
      COMP_LOOP_C_89, COMP_LOOP_C_90, COMP_LOOP_C_91, COMP_LOOP_C_92, COMP_LOOP_C_93,
      COMP_LOOP_C_94, COMP_LOOP_C_95, COMP_LOOP_C_96, COMP_LOOP_C_97, COMP_LOOP_C_98,
      COMP_LOOP_C_99, COMP_LOOP_C_100, COMP_LOOP_C_101, COMP_LOOP_C_102, COMP_LOOP_C_103,
      COMP_LOOP_C_104, COMP_LOOP_C_105, COMP_LOOP_C_106, COMP_LOOP_C_107, COMP_LOOP_C_108,
      COMP_LOOP_C_109, COMP_LOOP_C_110, COMP_LOOP_C_111, COMP_LOOP_C_112, COMP_LOOP_C_113,
      COMP_LOOP_C_114, COMP_LOOP_C_115, COMP_LOOP_C_116, COMP_LOOP_C_117, COMP_LOOP_C_118,
      COMP_LOOP_C_119, COMP_LOOP_C_120, COMP_LOOP_C_121, COMP_LOOP_C_122, COMP_LOOP_C_123,
      COMP_LOOP_C_124, COMP_LOOP_C_125, COMP_LOOP_C_126, COMP_LOOP_C_127, COMP_LOOP_C_128,
      COMP_LOOP_C_129, COMP_LOOP_C_130, COMP_LOOP_C_131, COMP_LOOP_C_132, COMP_LOOP_C_133,
      COMP_LOOP_C_134, COMP_LOOP_C_135, COMP_LOOP_C_136, COMP_LOOP_C_137, COMP_LOOP_C_138,
      COMP_LOOP_C_139, COMP_LOOP_C_140, COMP_LOOP_C_141, COMP_LOOP_C_142, COMP_LOOP_C_143,
      COMP_LOOP_C_144, COMP_LOOP_C_145, COMP_LOOP_C_146, COMP_LOOP_C_147, COMP_LOOP_C_148,
      COMP_LOOP_C_149, COMP_LOOP_C_150, COMP_LOOP_C_151, COMP_LOOP_C_152, COMP_LOOP_C_153,
      COMP_LOOP_C_154, COMP_LOOP_C_155, COMP_LOOP_C_156, COMP_LOOP_C_157, COMP_LOOP_C_158,
      COMP_LOOP_C_159, COMP_LOOP_C_160, COMP_LOOP_C_161, COMP_LOOP_C_162, COMP_LOOP_C_163,
      COMP_LOOP_C_164, COMP_LOOP_C_165, COMP_LOOP_C_166, COMP_LOOP_C_167, COMP_LOOP_C_168,
      COMP_LOOP_C_169, COMP_LOOP_C_170, COMP_LOOP_C_171, COMP_LOOP_C_172, COMP_LOOP_C_173,
      COMP_LOOP_C_174, COMP_LOOP_C_175, COMP_LOOP_C_176, COMP_LOOP_C_177, COMP_LOOP_C_178,
      COMP_LOOP_C_179, COMP_LOOP_C_180, COMP_LOOP_C_181, COMP_LOOP_C_182, COMP_LOOP_C_183,
      COMP_LOOP_C_184, COMP_LOOP_C_185, COMP_LOOP_C_186, COMP_LOOP_C_187, COMP_LOOP_C_188,
      COMP_LOOP_C_189, COMP_LOOP_C_190, COMP_LOOP_C_191, COMP_LOOP_C_192, COMP_LOOP_C_193,
      COMP_LOOP_C_194, COMP_LOOP_C_195, COMP_LOOP_C_196, COMP_LOOP_C_197, COMP_LOOP_C_198,
      COMP_LOOP_C_199, COMP_LOOP_C_200, COMP_LOOP_C_201, COMP_LOOP_C_202, COMP_LOOP_C_203,
      COMP_LOOP_C_204, COMP_LOOP_C_205, COMP_LOOP_C_206, COMP_LOOP_C_207, COMP_LOOP_C_208,
      COMP_LOOP_C_209, COMP_LOOP_C_210, COMP_LOOP_C_211, COMP_LOOP_C_212, COMP_LOOP_C_213,
      COMP_LOOP_C_214, COMP_LOOP_C_215, COMP_LOOP_C_216, COMP_LOOP_C_217, COMP_LOOP_C_218,
      COMP_LOOP_C_219, COMP_LOOP_C_220, COMP_LOOP_C_221, COMP_LOOP_C_222, COMP_LOOP_C_223,
      COMP_LOOP_C_224, COMP_LOOP_C_225, COMP_LOOP_C_226, COMP_LOOP_C_227, COMP_LOOP_C_228,
      COMP_LOOP_C_229, COMP_LOOP_C_230, COMP_LOOP_C_231, COMP_LOOP_C_232, COMP_LOOP_C_233,
      COMP_LOOP_C_234, COMP_LOOP_C_235, COMP_LOOP_C_236, COMP_LOOP_C_237, COMP_LOOP_C_238,
      COMP_LOOP_C_239, COMP_LOOP_C_240, COMP_LOOP_C_241, COMP_LOOP_C_242, COMP_LOOP_C_243,
      COMP_LOOP_C_244, COMP_LOOP_C_245, COMP_LOOP_C_246, COMP_LOOP_C_247, COMP_LOOP_C_248,
      COMP_LOOP_C_249, COMP_LOOP_C_250, COMP_LOOP_C_251, COMP_LOOP_C_252, COMP_LOOP_C_253,
      COMP_LOOP_C_254, COMP_LOOP_C_255, COMP_LOOP_C_256, COMP_LOOP_C_257, COMP_LOOP_C_258,
      COMP_LOOP_C_259, COMP_LOOP_C_260, COMP_LOOP_C_261, COMP_LOOP_C_262, COMP_LOOP_C_263,
      COMP_LOOP_C_264, COMP_LOOP_C_265, COMP_LOOP_C_266, COMP_LOOP_C_267, COMP_LOOP_C_268,
      COMP_LOOP_C_269, COMP_LOOP_C_270, COMP_LOOP_C_271, COMP_LOOP_C_272, COMP_LOOP_C_273,
      COMP_LOOP_C_274, COMP_LOOP_C_275, COMP_LOOP_C_276, COMP_LOOP_C_277, COMP_LOOP_C_278,
      COMP_LOOP_C_279, COMP_LOOP_C_280, COMP_LOOP_C_281, COMP_LOOP_C_282, COMP_LOOP_C_283,
      COMP_LOOP_C_284, COMP_LOOP_C_285, COMP_LOOP_C_286, COMP_LOOP_C_287, COMP_LOOP_C_288,
      COMP_LOOP_C_289, COMP_LOOP_C_290, COMP_LOOP_C_291, COMP_LOOP_C_292, COMP_LOOP_C_293,
      COMP_LOOP_C_294, COMP_LOOP_C_295, COMP_LOOP_C_296, COMP_LOOP_C_297, COMP_LOOP_C_298,
      COMP_LOOP_C_299, COMP_LOOP_C_300, COMP_LOOP_C_301, COMP_LOOP_C_302, COMP_LOOP_C_303,
      COMP_LOOP_C_304, COMP_LOOP_C_305, COMP_LOOP_C_306, COMP_LOOP_C_307, COMP_LOOP_C_308,
      COMP_LOOP_C_309, COMP_LOOP_C_310, COMP_LOOP_C_311, COMP_LOOP_C_312, COMP_LOOP_C_313,
      COMP_LOOP_C_314, COMP_LOOP_C_315, COMP_LOOP_C_316, COMP_LOOP_C_317, COMP_LOOP_C_318,
      COMP_LOOP_C_319, COMP_LOOP_C_320, COMP_LOOP_C_321, COMP_LOOP_C_322, COMP_LOOP_C_323,
      COMP_LOOP_C_324, COMP_LOOP_C_325, COMP_LOOP_C_326, COMP_LOOP_C_327, COMP_LOOP_C_328,
      COMP_LOOP_C_329, COMP_LOOP_C_330, COMP_LOOP_C_331, COMP_LOOP_C_332, COMP_LOOP_C_333,
      COMP_LOOP_C_334, COMP_LOOP_C_335, COMP_LOOP_C_336, COMP_LOOP_C_337, COMP_LOOP_C_338,
      COMP_LOOP_C_339, COMP_LOOP_C_340, COMP_LOOP_C_341, COMP_LOOP_C_342, COMP_LOOP_C_343,
      COMP_LOOP_C_344, COMP_LOOP_C_345, COMP_LOOP_C_346, COMP_LOOP_C_347, COMP_LOOP_C_348,
      COMP_LOOP_C_349, COMP_LOOP_C_350, COMP_LOOP_C_351, COMP_LOOP_C_352, COMP_LOOP_C_353,
      COMP_LOOP_C_354, COMP_LOOP_C_355, COMP_LOOP_C_356, COMP_LOOP_C_357, COMP_LOOP_C_358,
      COMP_LOOP_C_359, COMP_LOOP_C_360, COMP_LOOP_C_361, COMP_LOOP_C_362, COMP_LOOP_C_363,
      COMP_LOOP_C_364, COMP_LOOP_C_365, COMP_LOOP_C_366, COMP_LOOP_C_367, COMP_LOOP_C_368,
      COMP_LOOP_C_369, COMP_LOOP_C_370, COMP_LOOP_C_371, COMP_LOOP_C_372, COMP_LOOP_C_373,
      COMP_LOOP_C_374, COMP_LOOP_C_375, COMP_LOOP_C_376, COMP_LOOP_C_377, COMP_LOOP_C_378,
      COMP_LOOP_C_379, COMP_LOOP_C_380, COMP_LOOP_C_381, COMP_LOOP_C_382, COMP_LOOP_C_383,
      COMP_LOOP_C_384, COMP_LOOP_C_385, COMP_LOOP_C_386, COMP_LOOP_C_387, COMP_LOOP_C_388,
      COMP_LOOP_C_389, COMP_LOOP_C_390, COMP_LOOP_C_391, COMP_LOOP_C_392, COMP_LOOP_C_393,
      COMP_LOOP_C_394, COMP_LOOP_C_395, COMP_LOOP_C_396, COMP_LOOP_C_397, COMP_LOOP_C_398,
      COMP_LOOP_C_399, COMP_LOOP_C_400, COMP_LOOP_C_401, COMP_LOOP_C_402, COMP_LOOP_C_403,
      COMP_LOOP_C_404, COMP_LOOP_C_405, COMP_LOOP_C_406, COMP_LOOP_C_407, COMP_LOOP_C_408,
      COMP_LOOP_C_409, COMP_LOOP_C_410, COMP_LOOP_C_411, COMP_LOOP_C_412, COMP_LOOP_C_413,
      COMP_LOOP_C_414, COMP_LOOP_C_415, COMP_LOOP_C_416, COMP_LOOP_C_417, COMP_LOOP_C_418,
      COMP_LOOP_C_419, COMP_LOOP_C_420, COMP_LOOP_C_421, COMP_LOOP_C_422, COMP_LOOP_C_423,
      COMP_LOOP_C_424, COMP_LOOP_C_425, COMP_LOOP_C_426, COMP_LOOP_C_427, COMP_LOOP_C_428,
      COMP_LOOP_C_429, COMP_LOOP_C_430, COMP_LOOP_C_431, COMP_LOOP_C_432, COMP_LOOP_C_433,
      COMP_LOOP_C_434, COMP_LOOP_C_435, COMP_LOOP_C_436, COMP_LOOP_C_437, COMP_LOOP_C_438,
      COMP_LOOP_C_439, COMP_LOOP_C_440, COMP_LOOP_C_441, COMP_LOOP_C_442, COMP_LOOP_C_443,
      COMP_LOOP_C_444, COMP_LOOP_C_445, COMP_LOOP_C_446, COMP_LOOP_C_447, COMP_LOOP_C_448,
      COMP_LOOP_C_449, COMP_LOOP_C_450, COMP_LOOP_C_451, COMP_LOOP_C_452, COMP_LOOP_C_453,
      COMP_LOOP_C_454, COMP_LOOP_C_455, COMP_LOOP_C_456, COMP_LOOP_C_457, COMP_LOOP_C_458,
      COMP_LOOP_C_459, COMP_LOOP_C_460, COMP_LOOP_C_461, COMP_LOOP_C_462, COMP_LOOP_C_463,
      COMP_LOOP_C_464, COMP_LOOP_C_465, COMP_LOOP_C_466, COMP_LOOP_C_467, COPY_LOOP_1_C_0,
      COPY_LOOP_1_C_1, COPY_LOOP_1_C_2, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : peaceNTT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : peaceNTT_core_core_fsm_1_ST;

BEGIN
  peaceNTT_core_core_fsm_1 : PROCESS (COPY_LOOP_C_2_tr0, COMP_LOOP_C_467_tr0, COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001");
        state_var_NS <= COPY_LOOP_C_1;
      WHEN COPY_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010");
        state_var_NS <= COPY_LOOP_C_2;
      WHEN COPY_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000011");
        IF ( COPY_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_0;
        ELSE
          state_var_NS <= COPY_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000101");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000110");
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000111");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001001");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001010");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001011");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001100");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001101");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001110");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001111");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010001");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010010");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010011");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010100");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010101");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010110");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010111");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011001");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011010");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011011");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011100");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011101");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011110");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000011111");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100001");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100010");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100011");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100100");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100101");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100110");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100111");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101000");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101001");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101010");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101011");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101100");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101101");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101110");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000101111");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110000");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110001");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110010");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110011");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110100");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110101");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110110");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000110111");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111000");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111001");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111010");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111011");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111100");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111101");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111110");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000111111");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000001");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000010");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000011");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000100");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000101");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000110");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000111");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001000");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001001");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001010");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001011");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001100");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001101");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001110");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001001111");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010000");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010001");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010010");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010011");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010100");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010101");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010110");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001010111");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011000");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011001");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011010");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011011");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011100");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011101");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011110");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001011111");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100000");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100001");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100010");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100011");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100100");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100101");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100110");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001100111");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101000");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101001");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101010");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101011");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101100");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101101");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101110");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001101111");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110000");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110001");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110010");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110011");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110100");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110101");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110110");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001110111");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111000");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111001");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111010");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111011");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111100");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111101");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111110");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001111111");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000001");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000010");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000011");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000100");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000101");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000110");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000111");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001000");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001001");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001010");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001011");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001100");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001101");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001110");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010001111");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010000");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010001");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010010");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010011");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010100");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010101");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010110");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010010111");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011000");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011001");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011010");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011011");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011100");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011101");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011110");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010011111");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100000");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100001");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100010");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100011");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100100");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100101");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100110");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010100111");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101000");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101001");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101010");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101011");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101100");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101101");
        state_var_NS <= COMP_LOOP_C_169;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101110");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010101111");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110000");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110001");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110010");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110011");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110100");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110101");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110110");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010110111");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111000");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111001");
        state_var_NS <= COMP_LOOP_C_181;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111010");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111011");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111100");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111101");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111110");
        state_var_NS <= COMP_LOOP_C_186;
      WHEN COMP_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010111111");
        state_var_NS <= COMP_LOOP_C_187;
      WHEN COMP_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000000");
        state_var_NS <= COMP_LOOP_C_188;
      WHEN COMP_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000001");
        state_var_NS <= COMP_LOOP_C_189;
      WHEN COMP_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000010");
        state_var_NS <= COMP_LOOP_C_190;
      WHEN COMP_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000011");
        state_var_NS <= COMP_LOOP_C_191;
      WHEN COMP_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000100");
        state_var_NS <= COMP_LOOP_C_192;
      WHEN COMP_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000101");
        state_var_NS <= COMP_LOOP_C_193;
      WHEN COMP_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000110");
        state_var_NS <= COMP_LOOP_C_194;
      WHEN COMP_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011000111");
        state_var_NS <= COMP_LOOP_C_195;
      WHEN COMP_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001000");
        state_var_NS <= COMP_LOOP_C_196;
      WHEN COMP_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001001");
        state_var_NS <= COMP_LOOP_C_197;
      WHEN COMP_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001010");
        state_var_NS <= COMP_LOOP_C_198;
      WHEN COMP_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001011");
        state_var_NS <= COMP_LOOP_C_199;
      WHEN COMP_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001100");
        state_var_NS <= COMP_LOOP_C_200;
      WHEN COMP_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001101");
        state_var_NS <= COMP_LOOP_C_201;
      WHEN COMP_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001110");
        state_var_NS <= COMP_LOOP_C_202;
      WHEN COMP_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011001111");
        state_var_NS <= COMP_LOOP_C_203;
      WHEN COMP_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010000");
        state_var_NS <= COMP_LOOP_C_204;
      WHEN COMP_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010001");
        state_var_NS <= COMP_LOOP_C_205;
      WHEN COMP_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010010");
        state_var_NS <= COMP_LOOP_C_206;
      WHEN COMP_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010011");
        state_var_NS <= COMP_LOOP_C_207;
      WHEN COMP_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010100");
        state_var_NS <= COMP_LOOP_C_208;
      WHEN COMP_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010101");
        state_var_NS <= COMP_LOOP_C_209;
      WHEN COMP_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010110");
        state_var_NS <= COMP_LOOP_C_210;
      WHEN COMP_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011010111");
        state_var_NS <= COMP_LOOP_C_211;
      WHEN COMP_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011000");
        state_var_NS <= COMP_LOOP_C_212;
      WHEN COMP_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011001");
        state_var_NS <= COMP_LOOP_C_213;
      WHEN COMP_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011010");
        state_var_NS <= COMP_LOOP_C_214;
      WHEN COMP_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011011");
        state_var_NS <= COMP_LOOP_C_215;
      WHEN COMP_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011100");
        state_var_NS <= COMP_LOOP_C_216;
      WHEN COMP_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011101");
        state_var_NS <= COMP_LOOP_C_217;
      WHEN COMP_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011110");
        state_var_NS <= COMP_LOOP_C_218;
      WHEN COMP_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011011111");
        state_var_NS <= COMP_LOOP_C_219;
      WHEN COMP_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100000");
        state_var_NS <= COMP_LOOP_C_220;
      WHEN COMP_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100001");
        state_var_NS <= COMP_LOOP_C_221;
      WHEN COMP_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100010");
        state_var_NS <= COMP_LOOP_C_222;
      WHEN COMP_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100011");
        state_var_NS <= COMP_LOOP_C_223;
      WHEN COMP_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100100");
        state_var_NS <= COMP_LOOP_C_224;
      WHEN COMP_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100101");
        state_var_NS <= COMP_LOOP_C_225;
      WHEN COMP_LOOP_C_225 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100110");
        state_var_NS <= COMP_LOOP_C_226;
      WHEN COMP_LOOP_C_226 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011100111");
        state_var_NS <= COMP_LOOP_C_227;
      WHEN COMP_LOOP_C_227 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101000");
        state_var_NS <= COMP_LOOP_C_228;
      WHEN COMP_LOOP_C_228 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101001");
        state_var_NS <= COMP_LOOP_C_229;
      WHEN COMP_LOOP_C_229 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101010");
        state_var_NS <= COMP_LOOP_C_230;
      WHEN COMP_LOOP_C_230 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101011");
        state_var_NS <= COMP_LOOP_C_231;
      WHEN COMP_LOOP_C_231 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101100");
        state_var_NS <= COMP_LOOP_C_232;
      WHEN COMP_LOOP_C_232 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101101");
        state_var_NS <= COMP_LOOP_C_233;
      WHEN COMP_LOOP_C_233 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101110");
        state_var_NS <= COMP_LOOP_C_234;
      WHEN COMP_LOOP_C_234 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011101111");
        state_var_NS <= COMP_LOOP_C_235;
      WHEN COMP_LOOP_C_235 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110000");
        state_var_NS <= COMP_LOOP_C_236;
      WHEN COMP_LOOP_C_236 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110001");
        state_var_NS <= COMP_LOOP_C_237;
      WHEN COMP_LOOP_C_237 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110010");
        state_var_NS <= COMP_LOOP_C_238;
      WHEN COMP_LOOP_C_238 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110011");
        state_var_NS <= COMP_LOOP_C_239;
      WHEN COMP_LOOP_C_239 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110100");
        state_var_NS <= COMP_LOOP_C_240;
      WHEN COMP_LOOP_C_240 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110101");
        state_var_NS <= COMP_LOOP_C_241;
      WHEN COMP_LOOP_C_241 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110110");
        state_var_NS <= COMP_LOOP_C_242;
      WHEN COMP_LOOP_C_242 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011110111");
        state_var_NS <= COMP_LOOP_C_243;
      WHEN COMP_LOOP_C_243 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111000");
        state_var_NS <= COMP_LOOP_C_244;
      WHEN COMP_LOOP_C_244 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111001");
        state_var_NS <= COMP_LOOP_C_245;
      WHEN COMP_LOOP_C_245 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111010");
        state_var_NS <= COMP_LOOP_C_246;
      WHEN COMP_LOOP_C_246 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111011");
        state_var_NS <= COMP_LOOP_C_247;
      WHEN COMP_LOOP_C_247 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111100");
        state_var_NS <= COMP_LOOP_C_248;
      WHEN COMP_LOOP_C_248 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111101");
        state_var_NS <= COMP_LOOP_C_249;
      WHEN COMP_LOOP_C_249 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111110");
        state_var_NS <= COMP_LOOP_C_250;
      WHEN COMP_LOOP_C_250 =>
        fsm_output <= STD_LOGIC_VECTOR'( "011111111");
        state_var_NS <= COMP_LOOP_C_251;
      WHEN COMP_LOOP_C_251 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= COMP_LOOP_C_252;
      WHEN COMP_LOOP_C_252 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000001");
        state_var_NS <= COMP_LOOP_C_253;
      WHEN COMP_LOOP_C_253 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000010");
        state_var_NS <= COMP_LOOP_C_254;
      WHEN COMP_LOOP_C_254 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000011");
        state_var_NS <= COMP_LOOP_C_255;
      WHEN COMP_LOOP_C_255 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000100");
        state_var_NS <= COMP_LOOP_C_256;
      WHEN COMP_LOOP_C_256 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000101");
        state_var_NS <= COMP_LOOP_C_257;
      WHEN COMP_LOOP_C_257 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000110");
        state_var_NS <= COMP_LOOP_C_258;
      WHEN COMP_LOOP_C_258 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000111");
        state_var_NS <= COMP_LOOP_C_259;
      WHEN COMP_LOOP_C_259 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001000");
        state_var_NS <= COMP_LOOP_C_260;
      WHEN COMP_LOOP_C_260 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001001");
        state_var_NS <= COMP_LOOP_C_261;
      WHEN COMP_LOOP_C_261 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001010");
        state_var_NS <= COMP_LOOP_C_262;
      WHEN COMP_LOOP_C_262 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001011");
        state_var_NS <= COMP_LOOP_C_263;
      WHEN COMP_LOOP_C_263 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001100");
        state_var_NS <= COMP_LOOP_C_264;
      WHEN COMP_LOOP_C_264 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001101");
        state_var_NS <= COMP_LOOP_C_265;
      WHEN COMP_LOOP_C_265 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001110");
        state_var_NS <= COMP_LOOP_C_266;
      WHEN COMP_LOOP_C_266 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100001111");
        state_var_NS <= COMP_LOOP_C_267;
      WHEN COMP_LOOP_C_267 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010000");
        state_var_NS <= COMP_LOOP_C_268;
      WHEN COMP_LOOP_C_268 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010001");
        state_var_NS <= COMP_LOOP_C_269;
      WHEN COMP_LOOP_C_269 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010010");
        state_var_NS <= COMP_LOOP_C_270;
      WHEN COMP_LOOP_C_270 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010011");
        state_var_NS <= COMP_LOOP_C_271;
      WHEN COMP_LOOP_C_271 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010100");
        state_var_NS <= COMP_LOOP_C_272;
      WHEN COMP_LOOP_C_272 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010101");
        state_var_NS <= COMP_LOOP_C_273;
      WHEN COMP_LOOP_C_273 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010110");
        state_var_NS <= COMP_LOOP_C_274;
      WHEN COMP_LOOP_C_274 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100010111");
        state_var_NS <= COMP_LOOP_C_275;
      WHEN COMP_LOOP_C_275 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011000");
        state_var_NS <= COMP_LOOP_C_276;
      WHEN COMP_LOOP_C_276 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011001");
        state_var_NS <= COMP_LOOP_C_277;
      WHEN COMP_LOOP_C_277 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011010");
        state_var_NS <= COMP_LOOP_C_278;
      WHEN COMP_LOOP_C_278 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011011");
        state_var_NS <= COMP_LOOP_C_279;
      WHEN COMP_LOOP_C_279 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011100");
        state_var_NS <= COMP_LOOP_C_280;
      WHEN COMP_LOOP_C_280 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011101");
        state_var_NS <= COMP_LOOP_C_281;
      WHEN COMP_LOOP_C_281 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011110");
        state_var_NS <= COMP_LOOP_C_282;
      WHEN COMP_LOOP_C_282 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100011111");
        state_var_NS <= COMP_LOOP_C_283;
      WHEN COMP_LOOP_C_283 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100000");
        state_var_NS <= COMP_LOOP_C_284;
      WHEN COMP_LOOP_C_284 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100001");
        state_var_NS <= COMP_LOOP_C_285;
      WHEN COMP_LOOP_C_285 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100010");
        state_var_NS <= COMP_LOOP_C_286;
      WHEN COMP_LOOP_C_286 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100011");
        state_var_NS <= COMP_LOOP_C_287;
      WHEN COMP_LOOP_C_287 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100100");
        state_var_NS <= COMP_LOOP_C_288;
      WHEN COMP_LOOP_C_288 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100101");
        state_var_NS <= COMP_LOOP_C_289;
      WHEN COMP_LOOP_C_289 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100110");
        state_var_NS <= COMP_LOOP_C_290;
      WHEN COMP_LOOP_C_290 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100100111");
        state_var_NS <= COMP_LOOP_C_291;
      WHEN COMP_LOOP_C_291 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101000");
        state_var_NS <= COMP_LOOP_C_292;
      WHEN COMP_LOOP_C_292 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101001");
        state_var_NS <= COMP_LOOP_C_293;
      WHEN COMP_LOOP_C_293 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101010");
        state_var_NS <= COMP_LOOP_C_294;
      WHEN COMP_LOOP_C_294 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101011");
        state_var_NS <= COMP_LOOP_C_295;
      WHEN COMP_LOOP_C_295 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101100");
        state_var_NS <= COMP_LOOP_C_296;
      WHEN COMP_LOOP_C_296 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101101");
        state_var_NS <= COMP_LOOP_C_297;
      WHEN COMP_LOOP_C_297 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101110");
        state_var_NS <= COMP_LOOP_C_298;
      WHEN COMP_LOOP_C_298 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100101111");
        state_var_NS <= COMP_LOOP_C_299;
      WHEN COMP_LOOP_C_299 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110000");
        state_var_NS <= COMP_LOOP_C_300;
      WHEN COMP_LOOP_C_300 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110001");
        state_var_NS <= COMP_LOOP_C_301;
      WHEN COMP_LOOP_C_301 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110010");
        state_var_NS <= COMP_LOOP_C_302;
      WHEN COMP_LOOP_C_302 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110011");
        state_var_NS <= COMP_LOOP_C_303;
      WHEN COMP_LOOP_C_303 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110100");
        state_var_NS <= COMP_LOOP_C_304;
      WHEN COMP_LOOP_C_304 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110101");
        state_var_NS <= COMP_LOOP_C_305;
      WHEN COMP_LOOP_C_305 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110110");
        state_var_NS <= COMP_LOOP_C_306;
      WHEN COMP_LOOP_C_306 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100110111");
        state_var_NS <= COMP_LOOP_C_307;
      WHEN COMP_LOOP_C_307 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111000");
        state_var_NS <= COMP_LOOP_C_308;
      WHEN COMP_LOOP_C_308 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111001");
        state_var_NS <= COMP_LOOP_C_309;
      WHEN COMP_LOOP_C_309 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111010");
        state_var_NS <= COMP_LOOP_C_310;
      WHEN COMP_LOOP_C_310 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111011");
        state_var_NS <= COMP_LOOP_C_311;
      WHEN COMP_LOOP_C_311 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111100");
        state_var_NS <= COMP_LOOP_C_312;
      WHEN COMP_LOOP_C_312 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111101");
        state_var_NS <= COMP_LOOP_C_313;
      WHEN COMP_LOOP_C_313 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111110");
        state_var_NS <= COMP_LOOP_C_314;
      WHEN COMP_LOOP_C_314 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100111111");
        state_var_NS <= COMP_LOOP_C_315;
      WHEN COMP_LOOP_C_315 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000000");
        state_var_NS <= COMP_LOOP_C_316;
      WHEN COMP_LOOP_C_316 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000001");
        state_var_NS <= COMP_LOOP_C_317;
      WHEN COMP_LOOP_C_317 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000010");
        state_var_NS <= COMP_LOOP_C_318;
      WHEN COMP_LOOP_C_318 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000011");
        state_var_NS <= COMP_LOOP_C_319;
      WHEN COMP_LOOP_C_319 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000100");
        state_var_NS <= COMP_LOOP_C_320;
      WHEN COMP_LOOP_C_320 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000101");
        state_var_NS <= COMP_LOOP_C_321;
      WHEN COMP_LOOP_C_321 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000110");
        state_var_NS <= COMP_LOOP_C_322;
      WHEN COMP_LOOP_C_322 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101000111");
        state_var_NS <= COMP_LOOP_C_323;
      WHEN COMP_LOOP_C_323 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001000");
        state_var_NS <= COMP_LOOP_C_324;
      WHEN COMP_LOOP_C_324 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001001");
        state_var_NS <= COMP_LOOP_C_325;
      WHEN COMP_LOOP_C_325 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001010");
        state_var_NS <= COMP_LOOP_C_326;
      WHEN COMP_LOOP_C_326 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001011");
        state_var_NS <= COMP_LOOP_C_327;
      WHEN COMP_LOOP_C_327 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001100");
        state_var_NS <= COMP_LOOP_C_328;
      WHEN COMP_LOOP_C_328 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001101");
        state_var_NS <= COMP_LOOP_C_329;
      WHEN COMP_LOOP_C_329 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001110");
        state_var_NS <= COMP_LOOP_C_330;
      WHEN COMP_LOOP_C_330 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101001111");
        state_var_NS <= COMP_LOOP_C_331;
      WHEN COMP_LOOP_C_331 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010000");
        state_var_NS <= COMP_LOOP_C_332;
      WHEN COMP_LOOP_C_332 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010001");
        state_var_NS <= COMP_LOOP_C_333;
      WHEN COMP_LOOP_C_333 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010010");
        state_var_NS <= COMP_LOOP_C_334;
      WHEN COMP_LOOP_C_334 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010011");
        state_var_NS <= COMP_LOOP_C_335;
      WHEN COMP_LOOP_C_335 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010100");
        state_var_NS <= COMP_LOOP_C_336;
      WHEN COMP_LOOP_C_336 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010101");
        state_var_NS <= COMP_LOOP_C_337;
      WHEN COMP_LOOP_C_337 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010110");
        state_var_NS <= COMP_LOOP_C_338;
      WHEN COMP_LOOP_C_338 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101010111");
        state_var_NS <= COMP_LOOP_C_339;
      WHEN COMP_LOOP_C_339 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011000");
        state_var_NS <= COMP_LOOP_C_340;
      WHEN COMP_LOOP_C_340 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011001");
        state_var_NS <= COMP_LOOP_C_341;
      WHEN COMP_LOOP_C_341 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011010");
        state_var_NS <= COMP_LOOP_C_342;
      WHEN COMP_LOOP_C_342 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011011");
        state_var_NS <= COMP_LOOP_C_343;
      WHEN COMP_LOOP_C_343 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011100");
        state_var_NS <= COMP_LOOP_C_344;
      WHEN COMP_LOOP_C_344 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011101");
        state_var_NS <= COMP_LOOP_C_345;
      WHEN COMP_LOOP_C_345 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011110");
        state_var_NS <= COMP_LOOP_C_346;
      WHEN COMP_LOOP_C_346 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101011111");
        state_var_NS <= COMP_LOOP_C_347;
      WHEN COMP_LOOP_C_347 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100000");
        state_var_NS <= COMP_LOOP_C_348;
      WHEN COMP_LOOP_C_348 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100001");
        state_var_NS <= COMP_LOOP_C_349;
      WHEN COMP_LOOP_C_349 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100010");
        state_var_NS <= COMP_LOOP_C_350;
      WHEN COMP_LOOP_C_350 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100011");
        state_var_NS <= COMP_LOOP_C_351;
      WHEN COMP_LOOP_C_351 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100100");
        state_var_NS <= COMP_LOOP_C_352;
      WHEN COMP_LOOP_C_352 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100101");
        state_var_NS <= COMP_LOOP_C_353;
      WHEN COMP_LOOP_C_353 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100110");
        state_var_NS <= COMP_LOOP_C_354;
      WHEN COMP_LOOP_C_354 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101100111");
        state_var_NS <= COMP_LOOP_C_355;
      WHEN COMP_LOOP_C_355 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101000");
        state_var_NS <= COMP_LOOP_C_356;
      WHEN COMP_LOOP_C_356 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101001");
        state_var_NS <= COMP_LOOP_C_357;
      WHEN COMP_LOOP_C_357 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101010");
        state_var_NS <= COMP_LOOP_C_358;
      WHEN COMP_LOOP_C_358 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101011");
        state_var_NS <= COMP_LOOP_C_359;
      WHEN COMP_LOOP_C_359 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101100");
        state_var_NS <= COMP_LOOP_C_360;
      WHEN COMP_LOOP_C_360 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101101");
        state_var_NS <= COMP_LOOP_C_361;
      WHEN COMP_LOOP_C_361 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101110");
        state_var_NS <= COMP_LOOP_C_362;
      WHEN COMP_LOOP_C_362 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101101111");
        state_var_NS <= COMP_LOOP_C_363;
      WHEN COMP_LOOP_C_363 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110000");
        state_var_NS <= COMP_LOOP_C_364;
      WHEN COMP_LOOP_C_364 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110001");
        state_var_NS <= COMP_LOOP_C_365;
      WHEN COMP_LOOP_C_365 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110010");
        state_var_NS <= COMP_LOOP_C_366;
      WHEN COMP_LOOP_C_366 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110011");
        state_var_NS <= COMP_LOOP_C_367;
      WHEN COMP_LOOP_C_367 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110100");
        state_var_NS <= COMP_LOOP_C_368;
      WHEN COMP_LOOP_C_368 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110101");
        state_var_NS <= COMP_LOOP_C_369;
      WHEN COMP_LOOP_C_369 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110110");
        state_var_NS <= COMP_LOOP_C_370;
      WHEN COMP_LOOP_C_370 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101110111");
        state_var_NS <= COMP_LOOP_C_371;
      WHEN COMP_LOOP_C_371 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111000");
        state_var_NS <= COMP_LOOP_C_372;
      WHEN COMP_LOOP_C_372 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111001");
        state_var_NS <= COMP_LOOP_C_373;
      WHEN COMP_LOOP_C_373 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111010");
        state_var_NS <= COMP_LOOP_C_374;
      WHEN COMP_LOOP_C_374 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111011");
        state_var_NS <= COMP_LOOP_C_375;
      WHEN COMP_LOOP_C_375 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111100");
        state_var_NS <= COMP_LOOP_C_376;
      WHEN COMP_LOOP_C_376 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111101");
        state_var_NS <= COMP_LOOP_C_377;
      WHEN COMP_LOOP_C_377 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111110");
        state_var_NS <= COMP_LOOP_C_378;
      WHEN COMP_LOOP_C_378 =>
        fsm_output <= STD_LOGIC_VECTOR'( "101111111");
        state_var_NS <= COMP_LOOP_C_379;
      WHEN COMP_LOOP_C_379 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000000");
        state_var_NS <= COMP_LOOP_C_380;
      WHEN COMP_LOOP_C_380 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000001");
        state_var_NS <= COMP_LOOP_C_381;
      WHEN COMP_LOOP_C_381 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000010");
        state_var_NS <= COMP_LOOP_C_382;
      WHEN COMP_LOOP_C_382 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000011");
        state_var_NS <= COMP_LOOP_C_383;
      WHEN COMP_LOOP_C_383 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000100");
        state_var_NS <= COMP_LOOP_C_384;
      WHEN COMP_LOOP_C_384 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000101");
        state_var_NS <= COMP_LOOP_C_385;
      WHEN COMP_LOOP_C_385 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000110");
        state_var_NS <= COMP_LOOP_C_386;
      WHEN COMP_LOOP_C_386 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110000111");
        state_var_NS <= COMP_LOOP_C_387;
      WHEN COMP_LOOP_C_387 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001000");
        state_var_NS <= COMP_LOOP_C_388;
      WHEN COMP_LOOP_C_388 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001001");
        state_var_NS <= COMP_LOOP_C_389;
      WHEN COMP_LOOP_C_389 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001010");
        state_var_NS <= COMP_LOOP_C_390;
      WHEN COMP_LOOP_C_390 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001011");
        state_var_NS <= COMP_LOOP_C_391;
      WHEN COMP_LOOP_C_391 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001100");
        state_var_NS <= COMP_LOOP_C_392;
      WHEN COMP_LOOP_C_392 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001101");
        state_var_NS <= COMP_LOOP_C_393;
      WHEN COMP_LOOP_C_393 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001110");
        state_var_NS <= COMP_LOOP_C_394;
      WHEN COMP_LOOP_C_394 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110001111");
        state_var_NS <= COMP_LOOP_C_395;
      WHEN COMP_LOOP_C_395 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010000");
        state_var_NS <= COMP_LOOP_C_396;
      WHEN COMP_LOOP_C_396 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010001");
        state_var_NS <= COMP_LOOP_C_397;
      WHEN COMP_LOOP_C_397 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010010");
        state_var_NS <= COMP_LOOP_C_398;
      WHEN COMP_LOOP_C_398 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010011");
        state_var_NS <= COMP_LOOP_C_399;
      WHEN COMP_LOOP_C_399 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010100");
        state_var_NS <= COMP_LOOP_C_400;
      WHEN COMP_LOOP_C_400 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010101");
        state_var_NS <= COMP_LOOP_C_401;
      WHEN COMP_LOOP_C_401 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010110");
        state_var_NS <= COMP_LOOP_C_402;
      WHEN COMP_LOOP_C_402 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110010111");
        state_var_NS <= COMP_LOOP_C_403;
      WHEN COMP_LOOP_C_403 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011000");
        state_var_NS <= COMP_LOOP_C_404;
      WHEN COMP_LOOP_C_404 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011001");
        state_var_NS <= COMP_LOOP_C_405;
      WHEN COMP_LOOP_C_405 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011010");
        state_var_NS <= COMP_LOOP_C_406;
      WHEN COMP_LOOP_C_406 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011011");
        state_var_NS <= COMP_LOOP_C_407;
      WHEN COMP_LOOP_C_407 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011100");
        state_var_NS <= COMP_LOOP_C_408;
      WHEN COMP_LOOP_C_408 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011101");
        state_var_NS <= COMP_LOOP_C_409;
      WHEN COMP_LOOP_C_409 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011110");
        state_var_NS <= COMP_LOOP_C_410;
      WHEN COMP_LOOP_C_410 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110011111");
        state_var_NS <= COMP_LOOP_C_411;
      WHEN COMP_LOOP_C_411 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100000");
        state_var_NS <= COMP_LOOP_C_412;
      WHEN COMP_LOOP_C_412 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100001");
        state_var_NS <= COMP_LOOP_C_413;
      WHEN COMP_LOOP_C_413 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100010");
        state_var_NS <= COMP_LOOP_C_414;
      WHEN COMP_LOOP_C_414 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100011");
        state_var_NS <= COMP_LOOP_C_415;
      WHEN COMP_LOOP_C_415 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100100");
        state_var_NS <= COMP_LOOP_C_416;
      WHEN COMP_LOOP_C_416 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100101");
        state_var_NS <= COMP_LOOP_C_417;
      WHEN COMP_LOOP_C_417 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100110");
        state_var_NS <= COMP_LOOP_C_418;
      WHEN COMP_LOOP_C_418 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110100111");
        state_var_NS <= COMP_LOOP_C_419;
      WHEN COMP_LOOP_C_419 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101000");
        state_var_NS <= COMP_LOOP_C_420;
      WHEN COMP_LOOP_C_420 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101001");
        state_var_NS <= COMP_LOOP_C_421;
      WHEN COMP_LOOP_C_421 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101010");
        state_var_NS <= COMP_LOOP_C_422;
      WHEN COMP_LOOP_C_422 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101011");
        state_var_NS <= COMP_LOOP_C_423;
      WHEN COMP_LOOP_C_423 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101100");
        state_var_NS <= COMP_LOOP_C_424;
      WHEN COMP_LOOP_C_424 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101101");
        state_var_NS <= COMP_LOOP_C_425;
      WHEN COMP_LOOP_C_425 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101110");
        state_var_NS <= COMP_LOOP_C_426;
      WHEN COMP_LOOP_C_426 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110101111");
        state_var_NS <= COMP_LOOP_C_427;
      WHEN COMP_LOOP_C_427 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110000");
        state_var_NS <= COMP_LOOP_C_428;
      WHEN COMP_LOOP_C_428 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110001");
        state_var_NS <= COMP_LOOP_C_429;
      WHEN COMP_LOOP_C_429 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110010");
        state_var_NS <= COMP_LOOP_C_430;
      WHEN COMP_LOOP_C_430 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110011");
        state_var_NS <= COMP_LOOP_C_431;
      WHEN COMP_LOOP_C_431 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110100");
        state_var_NS <= COMP_LOOP_C_432;
      WHEN COMP_LOOP_C_432 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110101");
        state_var_NS <= COMP_LOOP_C_433;
      WHEN COMP_LOOP_C_433 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110110");
        state_var_NS <= COMP_LOOP_C_434;
      WHEN COMP_LOOP_C_434 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110110111");
        state_var_NS <= COMP_LOOP_C_435;
      WHEN COMP_LOOP_C_435 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111000");
        state_var_NS <= COMP_LOOP_C_436;
      WHEN COMP_LOOP_C_436 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111001");
        state_var_NS <= COMP_LOOP_C_437;
      WHEN COMP_LOOP_C_437 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111010");
        state_var_NS <= COMP_LOOP_C_438;
      WHEN COMP_LOOP_C_438 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111011");
        state_var_NS <= COMP_LOOP_C_439;
      WHEN COMP_LOOP_C_439 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111100");
        state_var_NS <= COMP_LOOP_C_440;
      WHEN COMP_LOOP_C_440 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111101");
        state_var_NS <= COMP_LOOP_C_441;
      WHEN COMP_LOOP_C_441 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111110");
        state_var_NS <= COMP_LOOP_C_442;
      WHEN COMP_LOOP_C_442 =>
        fsm_output <= STD_LOGIC_VECTOR'( "110111111");
        state_var_NS <= COMP_LOOP_C_443;
      WHEN COMP_LOOP_C_443 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000000");
        state_var_NS <= COMP_LOOP_C_444;
      WHEN COMP_LOOP_C_444 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000001");
        state_var_NS <= COMP_LOOP_C_445;
      WHEN COMP_LOOP_C_445 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000010");
        state_var_NS <= COMP_LOOP_C_446;
      WHEN COMP_LOOP_C_446 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000011");
        state_var_NS <= COMP_LOOP_C_447;
      WHEN COMP_LOOP_C_447 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000100");
        state_var_NS <= COMP_LOOP_C_448;
      WHEN COMP_LOOP_C_448 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000101");
        state_var_NS <= COMP_LOOP_C_449;
      WHEN COMP_LOOP_C_449 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000110");
        state_var_NS <= COMP_LOOP_C_450;
      WHEN COMP_LOOP_C_450 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111000111");
        state_var_NS <= COMP_LOOP_C_451;
      WHEN COMP_LOOP_C_451 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001000");
        state_var_NS <= COMP_LOOP_C_452;
      WHEN COMP_LOOP_C_452 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001001");
        state_var_NS <= COMP_LOOP_C_453;
      WHEN COMP_LOOP_C_453 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001010");
        state_var_NS <= COMP_LOOP_C_454;
      WHEN COMP_LOOP_C_454 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001011");
        state_var_NS <= COMP_LOOP_C_455;
      WHEN COMP_LOOP_C_455 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001100");
        state_var_NS <= COMP_LOOP_C_456;
      WHEN COMP_LOOP_C_456 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001101");
        state_var_NS <= COMP_LOOP_C_457;
      WHEN COMP_LOOP_C_457 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001110");
        state_var_NS <= COMP_LOOP_C_458;
      WHEN COMP_LOOP_C_458 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111001111");
        state_var_NS <= COMP_LOOP_C_459;
      WHEN COMP_LOOP_C_459 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010000");
        state_var_NS <= COMP_LOOP_C_460;
      WHEN COMP_LOOP_C_460 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010001");
        state_var_NS <= COMP_LOOP_C_461;
      WHEN COMP_LOOP_C_461 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010010");
        state_var_NS <= COMP_LOOP_C_462;
      WHEN COMP_LOOP_C_462 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010011");
        state_var_NS <= COMP_LOOP_C_463;
      WHEN COMP_LOOP_C_463 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010100");
        state_var_NS <= COMP_LOOP_C_464;
      WHEN COMP_LOOP_C_464 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010101");
        state_var_NS <= COMP_LOOP_C_465;
      WHEN COMP_LOOP_C_465 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010110");
        state_var_NS <= COMP_LOOP_C_466;
      WHEN COMP_LOOP_C_466 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111010111");
        state_var_NS <= COMP_LOOP_C_467;
      WHEN COMP_LOOP_C_467 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011000");
        IF ( COMP_LOOP_C_467_tr0 = '1' ) THEN
          state_var_NS <= COPY_LOOP_1_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN COPY_LOOP_1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011001");
        state_var_NS <= COPY_LOOP_1_C_1;
      WHEN COPY_LOOP_1_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011010");
        state_var_NS <= COPY_LOOP_1_C_2;
      WHEN COPY_LOOP_1_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011011");
        IF ( COPY_LOOP_1_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COPY_LOOP_1_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011100");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "111011101");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000000");
        state_var_NS <= COPY_LOOP_C_0;
    END CASE;
  END PROCESS peaceNTT_core_core_fsm_1;

  peaceNTT_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS peaceNTT_core_core_fsm_1_REG;

END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_core_wait_dp IS
  PORT(
    xt_rsc_0_0_cgo_iro : IN STD_LOGIC;
    xt_rsc_0_0_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_2_cgo_iro : IN STD_LOGIC;
    xt_rsc_0_2_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_4_cgo_iro : IN STD_LOGIC;
    xt_rsc_0_4_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_6_cgo_iro : IN STD_LOGIC;
    xt_rsc_0_6_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_0_cgo : IN STD_LOGIC;
    xt_rsc_0_2_cgo : IN STD_LOGIC;
    xt_rsc_0_4_cgo : IN STD_LOGIC;
    xt_rsc_0_6_cgo : IN STD_LOGIC
  );
END peaceNTT_core_wait_dp;

ARCHITECTURE v18 OF peaceNTT_core_wait_dp IS
  -- Default Constants

BEGIN
  xt_rsc_0_0_i_clken_d <= xt_rsc_0_0_cgo OR xt_rsc_0_0_cgo_iro;
  xt_rsc_0_2_i_clken_d <= xt_rsc_0_2_cgo OR xt_rsc_0_2_cgo_iro;
  xt_rsc_0_4_i_clken_d <= xt_rsc_0_4_cgo OR xt_rsc_0_4_cgo_iro;
  xt_rsc_0_6_i_clken_d <= xt_rsc_0_6_cgo OR xt_rsc_0_6_cgo_iro;
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    xt_rsc_0_0_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_2_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_4_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_6_i_clken_d : OUT STD_LOGIC;
    xt_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
    vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_0_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_0_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_1_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_1_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_2_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_2_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_3_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_3_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_4_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_4_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_5_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_5_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_6_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_6_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_7_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_7_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_4_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_5_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_6_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_7_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    xt_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    xt_rsc_0_1_i_d_d_pff : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    xt_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
    xt_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
    xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    xt_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    result_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    result_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_5_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
    result_rsc_0_7_i_we_d_pff : OUT STD_LOGIC
  );
END peaceNTT_core;

ARCHITECTURE v18 OF peaceNTT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_rem_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_1_f2_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL nor_tmp_8 : STD_LOGIC;
  SIGNAL nor_tmp_9 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL mux_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL or_tmp_16 : STD_LOGIC;
  SIGNAL mux_tmp_14 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL nor_tmp_18 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_120 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL or_tmp_53 : STD_LOGIC;
  SIGNAL or_tmp_67 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL or_tmp_70 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL and_dcpl_157 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL or_tmp_77 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL or_tmp_87 : STD_LOGIC;
  SIGNAL or_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL or_tmp_118 : STD_LOGIC;
  SIGNAL or_tmp_119 : STD_LOGIC;
  SIGNAL not_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL not_tmp_84 : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL or_dcpl_16 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL or_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_230 : STD_LOGIC;
  SIGNAL and_dcpl_233 : STD_LOGIC;
  SIGNAL and_dcpl_243 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_248 : STD_LOGIC;
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_255 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_267 : STD_LOGIC;
  SIGNAL or_dcpl_44 : STD_LOGIC;
  SIGNAL or_dcpl_47 : STD_LOGIC;
  SIGNAL or_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_54 : STD_LOGIC;
  SIGNAL COMP_LOOP_r_10_3_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_12_3_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_12_3_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_8_0_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_230_tmp : STD_LOGIC;
  SIGNAL and_232_tmp : STD_LOGIC;
  SIGNAL and_164_ssc : STD_LOGIC;
  SIGNAL nor_101_ssc : STD_LOGIC;
  SIGNAL and_169_ssc : STD_LOGIC;
  SIGNAL and_172_ssc : STD_LOGIC;
  SIGNAL nor_109_ssc : STD_LOGIC;
  SIGNAL and_176_ssc : STD_LOGIC;
  SIGNAL and_177_ssc : STD_LOGIC;
  SIGNAL and_179_ssc : STD_LOGIC;
  SIGNAL mux_94_ssc : STD_LOGIC;
  SIGNAL and_181_ssc : STD_LOGIC;
  SIGNAL and_183_ssc : STD_LOGIC;
  SIGNAL and_185_ssc : STD_LOGIC;
  SIGNAL and_188_ssc : STD_LOGIC;
  SIGNAL and_191_ssc : STD_LOGIC;
  SIGNAL and_193_ssc : STD_LOGIC;
  SIGNAL and_195_ssc : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_1_f2_rem_cmp_a_ftd : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL reg_xt_rsc_0_0_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_0_2_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_0_4_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_0_6_cgo_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_0_6_obj_ld_cse : STD_LOGIC;
  SIGNAL and_290_cse : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_1_rem_cmp_b_63_0_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f1_or_cse : STD_LOGIC;
  SIGNAL mux_39_cse : STD_LOGIC;
  SIGNAL mux_38_cse : STD_LOGIC;
  SIGNAL or_249_cse : STD_LOGIC;
  SIGNAL mux_48_cse : STD_LOGIC;
  SIGNAL or_59_cse : STD_LOGIC;
  SIGNAL or_138_cse : STD_LOGIC;
  SIGNAL or_204_cse : STD_LOGIC;
  SIGNAL and_277_cse : STD_LOGIC;
  SIGNAL nor_62_cse : STD_LOGIC;
  SIGNAL mux_47_cse : STD_LOGIC;
  SIGNAL nor_99_rmff : STD_LOGIC;
  SIGNAL nor_98_rmff : STD_LOGIC;
  SIGNAL nor_97_rmff : STD_LOGIC;
  SIGNAL nor_96_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_1_f2_and_rmff : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_282 : STD_LOGIC;
  SIGNAL and_dcpl_283 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL and_dcpl_305 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_327 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL and_dcpl_368 : STD_LOGIC;
  SIGNAL and_dcpl_371 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL and_dcpl_375 : STD_LOGIC;
  SIGNAL and_dcpl_376 : STD_LOGIC;
  SIGNAL and_dcpl_378 : STD_LOGIC;
  SIGNAL and_dcpl_379 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL and_dcpl_384 : STD_LOGIC;
  SIGNAL and_dcpl_385 : STD_LOGIC;
  SIGNAL and_dcpl_386 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL and_dcpl_399 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tmp_63_0_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_2_127_64_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_4_63_0_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_6_127_64_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_8_63_0_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_14_127_64_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_8_f2_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_1_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_2_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_2_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_3_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_3_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_4_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_4_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_5_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_5_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_6_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_6_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COMP_LOOP_7_f2_mul_itm : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_nor_3_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_13_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_14_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_15_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_mux1h_6_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_7_63_0_itm : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_12_3_sva_8_0_mx0c2 : STD_LOGIC;
  SIGNAL and_288_cse : STD_LOGIC;
  SIGNAL and_339_cse : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_mux_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_1_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_2_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_3_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_4_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_mux_5_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL or_tmp_212 : STD_LOGIC;
  SIGNAL COMP_LOOP_COMP_LOOP_mux_6_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL or_tmp_227 : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_8_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_9_rgt : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_1_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_1_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_2_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_2_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_6_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_6_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_3_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_3_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_7_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_7_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_4_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_4_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_5_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_5_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_10_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_8_acc_1_itm_64 : STD_LOGIC;
  SIGNAL COMP_LOOP_8_acc_1_itm_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_or_12_ssc : STD_LOGIC;
  SIGNAL and_155_ssc : STD_LOGIC;
  SIGNAL and_157_ssc : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_1_rem_cmp_a_ftd : STD_LOGIC;
  SIGNAL reg_COMP_LOOP_1_rem_cmp_a_ftd_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL nor_189_cse : STD_LOGIC;
  SIGNAL nand_43_cse : STD_LOGIC;
  SIGNAL nor_168_cse : STD_LOGIC;
  SIGNAL and_516_cse : STD_LOGIC;
  SIGNAL nor_161_cse : STD_LOGIC;
  SIGNAL and_275_cse_1 : STD_LOGIC;
  SIGNAL nor_185_cse : STD_LOGIC;
  SIGNAL nor_184_cse : STD_LOGIC;
  SIGNAL mux_156_cse : STD_LOGIC;
  SIGNAL nor_157_cse : STD_LOGIC;
  SIGNAL mux_70_itm : STD_LOGIC;

  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL or_248_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL or_245_nl : STD_LOGIC;
  SIGNAL or_244_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL or_242_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL or_63_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL or_62_nl : STD_LOGIC;
  SIGNAL or_60_nl : STD_LOGIC;
  SIGNAL or_58_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL or_57_nl : STD_LOGIC;
  SIGNAL or_55_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL or_53_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL or_52_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL mux_74_nl : STD_LOGIC;
  SIGNAL or_69_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL nor_59_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL nor_60_nl : STD_LOGIC;
  SIGNAL mux_71_nl : STD_LOGIC;
  SIGNAL nor_61_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL or_74_nl : STD_LOGIC;
  SIGNAL or_72_nl : STD_LOGIC;
  SIGNAL or_70_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_mux_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_not_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_r_not_1_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_13_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_and_12_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_14_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_15_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_16_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux_6_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_220_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL nor_186_nl : STD_LOGIC;
  SIGNAL nor_187_nl : STD_LOGIC;
  SIGNAL nor_188_nl : STD_LOGIC;
  SIGNAL or_339_nl : STD_LOGIC;
  SIGNAL or_340_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux_4_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_226_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL nor_180_nl : STD_LOGIC;
  SIGNAL nor_181_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL and_518_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux_5_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_210_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL nor_174_nl : STD_LOGIC;
  SIGNAL nor_175_nl : STD_LOGIC;
  SIGNAL nor_176_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL nor_171_nl : STD_LOGIC;
  SIGNAL nor_172_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_nor_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_9_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_10_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_11_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL nor_166_nl : STD_LOGIC;
  SIGNAL nor_167_nl : STD_LOGIC;
  SIGNAL nor_169_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL nor_163_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_nor_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_5_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_6_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_7_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL nor_160_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nor_158_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_COMP_LOOP_f2_nor_7_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_1_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_2_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_and_3_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL nor_153_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL nor_154_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_11_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_176_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL or_298_nl : STD_LOGIC;
  SIGNAL or_297_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL or_295_nl : STD_LOGIC;
  SIGNAL or_294_nl : STD_LOGIC;
  SIGNAL or_292_nl : STD_LOGIC;
  SIGNAL nand_40_nl : STD_LOGIC;
  SIGNAL mux_181_nl : STD_LOGIC;
  SIGNAL mux_180_nl : STD_LOGIC;
  SIGNAL or_335_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL or_336_nl : STD_LOGIC;
  SIGNAL nand_38_nl : STD_LOGIC;
  SIGNAL or_337_nl : STD_LOGIC;
  SIGNAL and_270_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_10_nl : STD_LOGIC;
  SIGNAL mux_185_nl : STD_LOGIC;
  SIGNAL nand_31_nl : STD_LOGIC;
  SIGNAL mux_184_nl : STD_LOGIC;
  SIGNAL or_309_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL nand_37_nl : STD_LOGIC;
  SIGNAL mux_182_nl : STD_LOGIC;
  SIGNAL and_512_nl : STD_LOGIC;
  SIGNAL nor_148_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL nor_143_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL nor_144_nl : STD_LOGIC;
  SIGNAL mux_186_nl : STD_LOGIC;
  SIGNAL nor_145_nl : STD_LOGIC;
  SIGNAL nor_146_nl : STD_LOGIC;
  SIGNAL and_255_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL nand_45_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_or_9_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL or_332_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL or_324_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL or_323_nl : STD_LOGIC;
  SIGNAL or_322_nl : STD_LOGIC;
  SIGNAL or_320_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL or_333_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL nand_34_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL and_509_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL and_510_nl : STD_LOGIC;
  SIGNAL nor_140_nl : STD_LOGIC;
  SIGNAL nor_141_nl : STD_LOGIC;
  SIGNAL or_331_nl : STD_LOGIC;
  SIGNAL or_235_nl : STD_LOGIC;
  SIGNAL nand_17_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL nor_81_nl : STD_LOGIC;
  SIGNAL and_295_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL and_301_nl : STD_LOGIC;
  SIGNAL nor_88_nl : STD_LOGIC;
  SIGNAL and_297_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL or_81_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL or_76_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL or_79_nl : STD_LOGIC;
  SIGNAL or_77_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL or_233_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL nand_28_nl : STD_LOGIC;
  SIGNAL or_84_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL mux_89_nl : STD_LOGIC;
  SIGNAL or_92_nl : STD_LOGIC;
  SIGNAL or_91_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL nor_56_nl : STD_LOGIC;
  SIGNAL mux_93_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL nor_54_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL or_101_nl : STD_LOGIC;
  SIGNAL or_100_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL or_115_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_mux1h_nl : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_nor_3_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_mux_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COPY_LOOP_mux_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_mux_2_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COPY_LOOP_mux_4_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL nor_75_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL nor_72_nl : STD_LOGIC;
  SIGNAL nor_73_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL nor_70_nl : STD_LOGIC;
  SIGNAL nor_71_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL nor_111_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nor_68_nl : STD_LOGIC;
  SIGNAL nor_69_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL nor_66_nl : STD_LOGIC;
  SIGNAL nor_67_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL nor_65_nl : STD_LOGIC;
  SIGNAL and_291_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL nor_63_nl : STD_LOGIC;
  SIGNAL nor_64_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_17_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_519_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (65 DOWNTO 0);
  SIGNAL COMP_LOOP_mux1h_15_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_521_nl : STD_LOGIC;
  SIGNAL and_522_nl : STD_LOGIC;
  SIGNAL and_523_nl : STD_LOGIC;
  SIGNAL and_524_nl : STD_LOGIC;
  SIGNAL and_525_nl : STD_LOGIC;
  SIGNAL and_526_nl : STD_LOGIC;
  SIGNAL and_527_nl : STD_LOGIC;
  SIGNAL and_528_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux1h_16_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_529_nl : STD_LOGIC;
  SIGNAL and_530_nl : STD_LOGIC;
  SIGNAL and_531_nl : STD_LOGIC;
  SIGNAL and_532_nl : STD_LOGIC;
  SIGNAL and_533_nl : STD_LOGIC;
  SIGNAL and_534_nl : STD_LOGIC;
  SIGNAL and_535_nl : STD_LOGIC;
  SIGNAL and_536_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_mux1h_15_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mux1h_16_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mux_40_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mux_41_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL COMP_LOOP_1_rem_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_1_rem_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_1_rem_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL COMP_LOOP_1_f2_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_1_f2_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_1_f2_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL STAGE_LOOP_base_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_core_wait_dp
    PORT(
      xt_rsc_0_0_cgo_iro : IN STD_LOGIC;
      xt_rsc_0_0_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_2_cgo_iro : IN STD_LOGIC;
      xt_rsc_0_2_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_4_cgo_iro : IN STD_LOGIC;
      xt_rsc_0_4_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_6_cgo_iro : IN STD_LOGIC;
      xt_rsc_0_6_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_0_cgo : IN STD_LOGIC;
      xt_rsc_0_2_cgo : IN STD_LOGIC;
      xt_rsc_0_4_cgo : IN STD_LOGIC;
      xt_rsc_0_6_cgo : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT peaceNTT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_467_tr0 : IN STD_LOGIC;
      COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_63_9_2(input_8 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(62 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
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

  FUNCTION MUX1HOT_v_65_17_2(input_16 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(64 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(16 DOWNTO 0))
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

  vec_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => vec_rsc_triosy_0_6_lz
    );
  vec_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => vec_rsc_triosy_0_4_lz
    );
  vec_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => vec_rsc_triosy_0_2_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  g_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => g_rsc_triosy_lz
    );
  result_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_7_lz
    );
  result_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_6_lz
    );
  result_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_5_lz
    );
  result_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_4_lz
    );
  result_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_3_lz
    );
  result_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_2_lz
    );
  result_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_1_lz
    );
  result_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => result_rsc_triosy_0_0_lz
    );
  twiddle_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_7_lz
    );
  twiddle_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_6_lz
    );
  twiddle_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_5_lz
    );
  twiddle_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_4_lz
    );
  twiddle_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_3_lz
    );
  twiddle_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_2_lz
    );
  twiddle_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_1_lz
    );
  twiddle_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_0_6_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_0_lz
    );
  COMP_LOOP_1_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => COMP_LOOP_1_rem_cmp_a,
      b => COMP_LOOP_1_rem_cmp_b,
      z => COMP_LOOP_1_rem_cmp_z_1
    );
  COMP_LOOP_1_rem_cmp_a <= reg_COMP_LOOP_1_rem_cmp_a_ftd & reg_COMP_LOOP_1_rem_cmp_a_ftd_1;
  COMP_LOOP_1_rem_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(reg_COMP_LOOP_1_rem_cmp_b_63_0_cse));
  COMP_LOOP_1_rem_cmp_z <= COMP_LOOP_1_rem_cmp_z_1;

  COMP_LOOP_1_f2_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 128,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => COMP_LOOP_1_f2_rem_cmp_a,
      b => COMP_LOOP_1_f2_rem_cmp_b,
      z => COMP_LOOP_1_f2_rem_cmp_z_1
    );
  COMP_LOOP_1_f2_rem_cmp_a <= reg_COMP_LOOP_1_f2_rem_cmp_a_ftd & reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1;
  COMP_LOOP_1_f2_rem_cmp_b <= reg_COMP_LOOP_1_rem_cmp_b_63_0_cse;
  COMP_LOOP_1_f2_rem_cmp_z <= COMP_LOOP_1_f2_rem_cmp_z_1;

  STAGE_LOOP_base_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 1,
      width_s => 4,
      width_z => 9
      )
    PORT MAP(
      a => STAGE_LOOP_base_lshift_rg_a,
      s => STAGE_LOOP_base_lshift_rg_s,
      z => STAGE_LOOP_base_lshift_rg_z
    );
  STAGE_LOOP_base_lshift_rg_a(0) <= '1';
  STAGE_LOOP_base_lshift_rg_s <= z_out_5(3 DOWNTO 0);
  STAGE_LOOP_base_lshift_itm <= STAGE_LOOP_base_lshift_rg_z;

  peaceNTT_core_wait_dp_inst : peaceNTT_core_wait_dp
    PORT MAP(
      xt_rsc_0_0_cgo_iro => nor_99_rmff,
      xt_rsc_0_0_i_clken_d => xt_rsc_0_0_i_clken_d,
      xt_rsc_0_2_cgo_iro => nor_98_rmff,
      xt_rsc_0_2_i_clken_d => xt_rsc_0_2_i_clken_d,
      xt_rsc_0_4_cgo_iro => nor_97_rmff,
      xt_rsc_0_4_i_clken_d => xt_rsc_0_4_i_clken_d,
      xt_rsc_0_6_cgo_iro => nor_96_rmff,
      xt_rsc_0_6_i_clken_d => xt_rsc_0_6_i_clken_d,
      xt_rsc_0_0_cgo => reg_xt_rsc_0_0_cgo_cse,
      xt_rsc_0_2_cgo => reg_xt_rsc_0_2_cgo_cse,
      xt_rsc_0_4_cgo => reg_xt_rsc_0_4_cgo_cse,
      xt_rsc_0_6_cgo => reg_xt_rsc_0_6_cgo_cse
    );
  peaceNTT_core_core_fsm_inst : peaceNTT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => peaceNTT_core_core_fsm_inst_fsm_output,
      COPY_LOOP_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0,
      COMP_LOOP_C_467_tr0 => peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0,
      COPY_LOOP_1_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0 => peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= peaceNTT_core_core_fsm_inst_fsm_output;
  peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 <= COPY_LOOP_1_i_12_3_sva_1(9);
  peaceNTT_core_core_fsm_inst_COMP_LOOP_C_467_tr0 <= COPY_LOOP_1_i_12_3_sva_8_0(8);
  peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 <= COPY_LOOP_1_i_12_3_sva_1(9);
  peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= z_out_5(4);

  or_248_nl <= (NOT (fsm_output(1))) OR CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR mux_39_cse;
  mux_40_nl <= MUX_s_1_2_2(or_248_nl, mux_38_cse, fsm_output(2));
  nor_99_rmff <= NOT(mux_40_nl OR (fsm_output(5)));
  or_245_nl <= (NOT (fsm_output(1))) OR CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR mux_39_cse;
  mux_46_nl <= MUX_s_1_2_2(or_245_nl, mux_38_cse, fsm_output(2));
  nor_98_rmff <= NOT(mux_46_nl OR (fsm_output(5)));
  or_244_nl <= (NOT((NOT (fsm_output(0))) OR (COMP_LOOP_r_10_3_sva(0)))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8));
  mux_47_cse <= MUX_s_1_2_2(or_249_cse, or_244_nl, fsm_output(1));
  or_242_nl <= (NOT (fsm_output(1))) OR (COPY_LOOP_1_i_12_3_sva_8_0(0)) OR (NOT((COPY_LOOP_1_i_12_3_sva_8_0(1))
      AND mux_48_cse));
  mux_49_nl <= MUX_s_1_2_2(or_242_nl, mux_47_cse, fsm_output(2));
  nor_97_rmff <= NOT(mux_49_nl OR (fsm_output(5)));
  nand_25_nl <= NOT((fsm_output(1)) AND CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND mux_48_cse);
  mux_53_nl <= MUX_s_1_2_2(nand_25_nl, mux_47_cse, fsm_output(2));
  nor_96_rmff <= NOT(mux_53_nl OR (fsm_output(5)));
  COMP_LOOP_1_f2_and_rmff <= COMP_LOOP_r_10_3_sva AND (STD_LOGIC_VECTOR'( "11") &
      (STAGE_LOOP_base_8_0_sva(8 DOWNTO 3)));
  and_290_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_59_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  nor_62_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_288_cse <= (fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(6));
  COMP_LOOP_or_12_ssc <= and_dcpl_150 OR and_dcpl_156;
  or_62_nl <= (fsm_output(2)) OR (fsm_output(5)) OR (NOT (fsm_output(8)));
  or_60_nl <= (NOT (fsm_output(2))) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_67_nl <= MUX_s_1_2_2(or_62_nl, or_60_nl, or_59_cse);
  or_58_nl <= and_290_cse OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_68_nl <= MUX_s_1_2_2(mux_67_nl, or_58_nl, fsm_output(4));
  mux_69_nl <= MUX_s_1_2_2(mux_68_nl, or_tmp_53, fsm_output(3));
  or_63_nl <= (fsm_output(6)) OR mux_69_nl;
  or_57_nl <= nor_62_cse OR (NOT (fsm_output(5))) OR (fsm_output(8));
  or_55_nl <= (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_64_nl <= MUX_s_1_2_2(or_57_nl, or_55_nl, fsm_output(4));
  mux_65_nl <= MUX_s_1_2_2(mux_64_nl, or_tmp_53, fsm_output(3));
  or_53_nl <= (NOT (fsm_output(5))) OR (fsm_output(8));
  or_52_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  mux_62_nl <= MUX_s_1_2_2(or_52_nl, (fsm_output(8)), fsm_output(4));
  mux_63_nl <= MUX_s_1_2_2(or_53_nl, mux_62_nl, fsm_output(3));
  mux_66_nl <= MUX_s_1_2_2(mux_65_nl, mux_63_nl, fsm_output(6));
  mux_70_itm <= MUX_s_1_2_2(or_63_nl, mux_66_nl, fsm_output(7));
  or_69_nl <= and_288_cse OR (NOT (fsm_output(7))) OR (fsm_output(5));
  mux_74_nl <= MUX_s_1_2_2(or_69_nl, or_tmp_67, fsm_output(3));
  nor_59_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(6)) OR (NOT nor_tmp_18));
  nor_60_nl <= NOT((fsm_output(6)) OR (NOT nor_tmp_18));
  nor_61_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(5))));
  mux_71_nl <= MUX_s_1_2_2(nor_tmp_18, nor_61_nl, fsm_output(6));
  mux_72_nl <= MUX_s_1_2_2(nor_60_nl, mux_71_nl, and_290_cse);
  mux_73_nl <= MUX_s_1_2_2(nor_59_nl, mux_72_nl, fsm_output(3));
  mux_75_nl <= MUX_s_1_2_2((NOT mux_74_nl), mux_73_nl, fsm_output(4));
  and_155_ssc <= mux_75_nl AND (NOT (fsm_output(8)));
  or_74_nl <= (fsm_output(1)) OR (fsm_output(6)) OR (NOT (fsm_output(5)));
  or_72_nl <= (NOT (fsm_output(1))) OR (NOT (fsm_output(6))) OR (fsm_output(5));
  mux_76_nl <= MUX_s_1_2_2(or_74_nl, or_72_nl, fsm_output(2));
  mux_77_nl <= MUX_s_1_2_2(mux_76_nl, or_tmp_70, fsm_output(3));
  or_70_nl <= ((fsm_output(3)) AND (fsm_output(6))) OR (fsm_output(5));
  mux_78_nl <= MUX_s_1_2_2(mux_77_nl, or_70_nl, fsm_output(4));
  and_157_ssc <= (NOT mux_78_nl) AND and_dcpl_152;
  or_138_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_277_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_220_nl <= and_dcpl_26 AND and_dcpl_124;
  COMP_LOOP_f2_COMP_LOOP_f2_mux_6_nl <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
      and_220_nl);
  COMP_LOOP_COMP_LOOP_mux_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux_6_nl),
      z_out_2, and_dcpl_243);
  nor_189_cse <= NOT(CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  nor_185_cse <= NOT((fsm_output(5)) OR (fsm_output(3)));
  nor_184_cse <= NOT((fsm_output(8)) OR (fsm_output(4)));
  or_339_nl <= (NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT (fsm_output(6)));
  or_340_nl <= (fsm_output(0)) OR (NOT (fsm_output(2))) OR (fsm_output(6));
  mux_156_cse <= MUX_s_1_2_2(or_339_nl, or_340_nl, fsm_output(1));
  and_226_nl <= and_dcpl_26 AND and_dcpl_133;
  COMP_LOOP_f2_COMP_LOOP_f2_mux_4_nl <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_4_i_q_d,
      and_226_nl);
  COMP_LOOP_COMP_LOOP_mux_1_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux_4_nl),
      z_out_2, and_dcpl_248);
  and_210_nl <= and_dcpl_26 AND and_dcpl_121;
  COMP_LOOP_f2_COMP_LOOP_f2_mux_5_nl <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
      and_210_nl);
  COMP_LOOP_COMP_LOOP_mux_2_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux_5_nl),
      z_out_2, and_dcpl_252);
  nand_43_cse <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  COMP_LOOP_f2_COMP_LOOP_f2_nor_6_nl <= NOT((STAGE_LOOP_base_8_0_sva(2)) OR (STAGE_LOOP_base_8_0_sva(0))
      OR and_232_tmp);
  COMP_LOOP_f2_and_9_nl <= (STAGE_LOOP_base_8_0_sva(0)) AND (NOT (STAGE_LOOP_base_8_0_sva(2)))
      AND (NOT and_232_tmp);
  COMP_LOOP_f2_and_10_nl <= (STAGE_LOOP_base_8_0_sva(2)) AND (NOT (STAGE_LOOP_base_8_0_sva(0)))
      AND (NOT and_232_tmp);
  COMP_LOOP_f2_and_11_nl <= (STAGE_LOOP_base_8_0_sva(2)) AND (STAGE_LOOP_base_8_0_sva(0))
      AND (NOT and_232_tmp);
  COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_5_i_q_d, STD_LOGIC_VECTOR'(
      COMP_LOOP_f2_COMP_LOOP_f2_nor_6_nl & COMP_LOOP_f2_and_9_nl & COMP_LOOP_f2_and_10_nl
      & COMP_LOOP_f2_and_11_nl));
  COMP_LOOP_COMP_LOOP_mux_3_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux1h_2_nl),
      z_out_2, and_dcpl_255);
  nor_168_cse <= NOT((NOT (fsm_output(1))) OR (fsm_output(7)) OR (NOT (fsm_output(2)))
      OR (fsm_output(3)));
  COMP_LOOP_f2_COMP_LOOP_f2_nor_nl <= NOT(CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")) OR and_dcpl_158);
  COMP_LOOP_f2_and_5_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"))
      AND (NOT and_dcpl_158);
  COMP_LOOP_f2_and_6_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"))
      AND (NOT and_dcpl_158);
  COMP_LOOP_f2_and_7_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))
      AND (NOT and_dcpl_158);
  COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_4_i_q_d, twiddle_rsc_0_6_i_q_d, STD_LOGIC_VECTOR'(
      COMP_LOOP_f2_COMP_LOOP_f2_nor_nl & COMP_LOOP_f2_and_5_nl & COMP_LOOP_f2_and_6_nl
      & COMP_LOOP_f2_and_7_nl));
  COMP_LOOP_COMP_LOOP_mux_4_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux1h_1_nl),
      z_out_2, and_dcpl_261);
  and_516_cse <= (fsm_output(0)) AND (fsm_output(7)) AND (NOT (fsm_output(1))) AND
      (fsm_output(4));
  nor_161_cse <= NOT((fsm_output(8)) OR (fsm_output(6)));
  and_275_cse_1 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  COMP_LOOP_f2_COMP_LOOP_f2_nor_7_nl <= NOT(CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR and_230_tmp);
  COMP_LOOP_f2_and_1_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"))
      AND (NOT and_230_tmp);
  COMP_LOOP_f2_and_2_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"))
      AND (NOT and_230_tmp);
  COMP_LOOP_f2_and_3_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (NOT and_230_tmp);
  COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( COMP_LOOP_f2_COMP_LOOP_f2_nor_7_nl
      & COMP_LOOP_f2_and_1_nl & COMP_LOOP_f2_and_2_nl & COMP_LOOP_f2_and_3_nl));
  COMP_LOOP_COMP_LOOP_mux_5_rgt <= MUX_v_65_2_2(('0' & COMP_LOOP_f2_COMP_LOOP_f2_mux1h_nl),
      z_out_2, and_dcpl_150);
  nor_157_cse <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  COMP_LOOP_or_11_nl <= and_dcpl_150 OR and_dcpl_243 OR and_dcpl_267 OR and_dcpl_156;
  COMP_LOOP_COMP_LOOP_mux_6_rgt <= MUX_v_65_2_2(('0' & twiddle_rsc_0_0_i_q_d), z_out_1,
      COMP_LOOP_or_11_nl);
  or_204_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  and_270_nl <= (and_290_cse XOR (fsm_output(3))) AND (NOT (fsm_output(5))) AND and_dcpl_207;
  COMP_LOOP_or_10_nl <= and_dcpl_248 OR and_dcpl_261;
  COMP_LOOP_mux1h_8_rgt <= MUX1HOT_v_65_3_2(('0' & (xt_rsc_0_0_i_q_d(63 DOWNTO 0))),
      z_out_1, z_out_2, STD_LOGIC_VECTOR'( and_270_nl & COMP_LOOP_or_10_nl & and_dcpl_156));
  nand_45_nl <= NOT((fsm_output(2)) AND or_59_cse);
  mux_127_nl <= MUX_s_1_2_2(and_290_cse, nand_45_nl, fsm_output(3));
  and_255_nl <= mux_127_nl AND (NOT (fsm_output(5))) AND and_dcpl_207;
  COMP_LOOP_or_9_nl <= and_dcpl_252 OR and_dcpl_255;
  COMP_LOOP_mux1h_9_rgt <= MUX1HOT_v_65_3_2(('0' & (xt_rsc_0_1_i_q_d(63 DOWNTO 0))),
      z_out_1, z_out_2, STD_LOGIC_VECTOR'( and_255_nl & COMP_LOOP_or_9_nl & and_dcpl_267));
  COMP_LOOP_f1_or_cse <= and_dcpl_230 OR and_dcpl_233;
  or_235_nl <= (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8));
  nand_17_nl <= NOT((fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(7)) AND (fsm_output(8)));
  mux_39_cse <= MUX_s_1_2_2(or_235_nl, nand_17_nl, fsm_output(3));
  or_249_cse <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(6))
      OR (fsm_output(7)) OR (fsm_output(8));
  or_250_nl <= ((fsm_output(0)) AND (COMP_LOOP_r_10_3_sva(0))) OR (fsm_output(3))
      OR (fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8));
  mux_38_cse <= MUX_s_1_2_2(or_249_cse, or_250_nl, fsm_output(1));
  nor_81_nl <= NOT((fsm_output(4)) OR (fsm_output(6)) OR (fsm_output(7)) OR (fsm_output(8)));
  and_295_nl <= (fsm_output(4)) AND (fsm_output(6)) AND (fsm_output(7)) AND (fsm_output(8));
  mux_48_cse <= MUX_s_1_2_2(nor_81_nl, and_295_nl, fsm_output(3));
  nor_tmp_8 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  nor_tmp_9 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("111"));
  mux_35_nl <= MUX_s_1_2_2(nor_tmp_9, nor_tmp_8, or_59_cse);
  and_301_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_tmp_8 <= MUX_s_1_2_2(nor_tmp_9, mux_35_nl, and_301_nl);
  and_dcpl_13 <= (fsm_output(4)) AND (fsm_output(8));
  and_dcpl_14 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_15 <= and_dcpl_14 AND and_dcpl_13;
  and_dcpl_16 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_17 <= (NOT (fsm_output(5))) AND (fsm_output(7));
  and_dcpl_18 <= and_dcpl_17 AND (fsm_output(6));
  and_dcpl_19 <= and_dcpl_18 AND and_dcpl_16;
  and_dcpl_20 <= and_dcpl_19 AND and_dcpl_15;
  and_dcpl_22 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_23 <= and_dcpl_22 AND nor_184_cse;
  and_dcpl_24 <= NOT((fsm_output(5)) OR (fsm_output(7)));
  and_dcpl_25 <= and_dcpl_24 AND (NOT (fsm_output(6)));
  and_dcpl_26 <= and_dcpl_25 AND and_dcpl_16;
  and_dcpl_27 <= and_dcpl_26 AND and_dcpl_23;
  and_dcpl_29 <= and_dcpl_16 AND (NOT (fsm_output(2)));
  nor_88_nl <= NOT((fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(6)) OR (fsm_output(7)));
  and_297_nl <= (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(6)) AND (fsm_output(7));
  mux_tmp_13 <= MUX_s_1_2_2(nor_88_nl, and_297_nl, fsm_output(8));
  and_dcpl_31 <= mux_tmp_13 AND (NOT (fsm_output(5)));
  and_dcpl_35 <= (NOT (fsm_output(6))) AND (fsm_output(2)) AND (NOT (fsm_output(3)))
      AND nor_184_cse;
  or_tmp_16 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_14 <= MUX_s_1_2_2((NOT (fsm_output(1))), (fsm_output(1)), fsm_output(0));
  and_dcpl_52 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_53 <= and_dcpl_52 AND nor_184_cse;
  and_dcpl_54 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_55 <= and_dcpl_25 AND and_dcpl_54;
  and_dcpl_57 <= (NOT (fsm_output(4))) AND (fsm_output(8));
  and_dcpl_59 <= (fsm_output(5)) AND (NOT (fsm_output(7)));
  and_dcpl_60 <= and_dcpl_59 AND (NOT (fsm_output(6)));
  and_dcpl_62 <= and_dcpl_60 AND and_dcpl_54 AND and_dcpl_14 AND and_dcpl_57;
  and_dcpl_69 <= and_dcpl_24 AND (fsm_output(6));
  and_dcpl_70 <= and_dcpl_69 AND and_dcpl_16;
  and_dcpl_71 <= and_dcpl_70 AND and_dcpl_22 AND and_dcpl_57;
  and_dcpl_72 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  nor_tmp_18 <= (fsm_output(7)) AND (fsm_output(5));
  and_dcpl_75 <= and_dcpl_52 AND and_dcpl_57;
  and_dcpl_78 <= and_dcpl_59 AND (fsm_output(6)) AND and_275_cse_1;
  and_dcpl_79 <= and_dcpl_78 AND and_dcpl_75;
  and_dcpl_81 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_82 <= and_dcpl_17 AND (NOT (fsm_output(6)));
  and_dcpl_83 <= and_dcpl_82 AND and_dcpl_81;
  and_dcpl_84 <= and_dcpl_83 AND and_dcpl_75;
  and_dcpl_89 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_92 <= and_dcpl_82 AND and_dcpl_54 AND and_dcpl_89 AND and_dcpl_13;
  and_dcpl_98 <= nor_tmp_18 AND (NOT (fsm_output(6)));
  and_dcpl_100 <= and_dcpl_98 AND and_dcpl_16 AND and_dcpl_15;
  and_dcpl_106 <= and_dcpl_18 AND and_275_cse_1 AND and_dcpl_22 AND and_dcpl_13;
  and_dcpl_112 <= and_dcpl_25 AND and_dcpl_81;
  and_dcpl_113 <= and_dcpl_112 AND and_dcpl_89 AND and_dcpl_57;
  and_dcpl_118 <= and_dcpl_55 AND and_dcpl_23;
  and_dcpl_120 <= and_dcpl_22 AND (NOT (fsm_output(4)));
  and_dcpl_121 <= and_dcpl_120 AND (NOT (fsm_output(8))) AND (STAGE_LOOP_base_8_0_sva(0));
  and_dcpl_124 <= and_dcpl_120 AND (NOT (fsm_output(8))) AND (STAGE_LOOP_base_8_0_sva(1));
  and_dcpl_127 <= and_dcpl_72 AND (NOT (fsm_output(8)));
  and_dcpl_130 <= and_dcpl_25 AND and_dcpl_54 AND (fsm_output(2));
  and_dcpl_133 <= and_dcpl_120 AND (NOT (fsm_output(8))) AND (STAGE_LOOP_base_8_0_sva(2));
  and_dcpl_135 <= (STAGE_LOOP_base_8_0_sva(0)) AND (STAGE_LOOP_base_8_0_sva(2));
  and_dcpl_147 <= and_dcpl_18 AND and_dcpl_81;
  and_dcpl_150 <= and_dcpl_60 AND and_dcpl_81 AND and_dcpl_23;
  or_tmp_53 <= (fsm_output(4)) OR (NOT (fsm_output(5))) OR (fsm_output(8));
  or_tmp_67 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100"));
  and_dcpl_152 <= CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("01"));
  or_tmp_70 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  and_dcpl_156 <= nor_tmp_9 AND and_275_cse_1 AND and_dcpl_89 AND nor_184_cse;
  and_dcpl_157 <= and_dcpl_25 AND and_275_cse_1;
  and_dcpl_158 <= and_dcpl_157 AND and_dcpl_23;
  or_tmp_77 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  and_dcpl_166 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  nand_23_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))))
      AND (fsm_output(5)));
  or_81_nl <= (NOT (fsm_output(1))) OR (fsm_output(5));
  mux_tmp_54 <= MUX_s_1_2_2(nand_23_nl, or_81_nl, fsm_output(2));
  and_dcpl_170 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  or_tmp_87 <= (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(5)));
  or_dcpl_2 <= and_275_cse_1 OR (fsm_output(2));
  and_dcpl_201 <= and_dcpl_112 AND and_dcpl_23;
  or_tmp_118 <= (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(7))
      OR (fsm_output(5));
  or_tmp_119 <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000"));
  mux_109_nl <= MUX_s_1_2_2(or_tmp_119, or_tmp_118, fsm_output(2));
  not_tmp_80 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))
      OR mux_109_nl);
  and_dcpl_207 <= nor_157_cse AND nor_184_cse;
  not_tmp_84 <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111")));
  or_dcpl_14 <= (fsm_output(4)) OR (fsm_output(8));
  or_dcpl_16 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01")) OR or_dcpl_14;
  or_dcpl_18 <= or_tmp_119 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_19 <= or_dcpl_18 OR or_dcpl_16;
  and_dcpl_230 <= and_dcpl_157 AND and_dcpl_120 AND (NOT (fsm_output(8))) AND (NOT
      (COMP_LOOP_r_10_3_sva(0)));
  and_dcpl_233 <= and_dcpl_157 AND and_dcpl_120 AND (NOT (fsm_output(8))) AND (COMP_LOOP_r_10_3_sva(0));
  and_dcpl_243 <= and_dcpl_69 AND and_dcpl_54 AND and_dcpl_53;
  and_dcpl_246 <= (fsm_output(4)) AND (NOT (fsm_output(8)));
  and_dcpl_248 <= and_dcpl_70 AND and_dcpl_89 AND and_dcpl_246;
  and_dcpl_251 <= and_dcpl_14 AND and_dcpl_246;
  and_dcpl_252 <= and_dcpl_78 AND and_dcpl_251;
  and_dcpl_255 <= and_dcpl_83 AND and_dcpl_251;
  and_dcpl_261 <= and_dcpl_98 AND and_dcpl_54 AND and_dcpl_22 AND and_dcpl_246;
  and_dcpl_267 <= and_dcpl_19 AND and_dcpl_52 AND and_dcpl_246;
  or_dcpl_44 <= or_tmp_119 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"));
  or_dcpl_47 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR or_dcpl_14;
  or_dcpl_49 <= or_tmp_119 OR or_tmp_16;
  or_dcpl_54 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("11")) OR or_dcpl_14;
  COPY_LOOP_1_i_12_3_sva_8_0_mx0c2 <= NOT((NOT mux_tmp_13) OR (fsm_output(5)) OR
      (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(2)));
  or_76_nl <= (fsm_output(2)) OR (NOT (fsm_output(5)));
  mux_79_nl <= MUX_s_1_2_2(or_76_nl, (fsm_output(5)), or_204_cse);
  and_164_ssc <= (NOT mux_79_nl) AND nor_157_cse AND (NOT (fsm_output(8)));
  or_79_nl <= (fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(5));
  or_77_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000"));
  mux_80_nl <= MUX_s_1_2_2(or_79_nl, or_tmp_77, or_77_nl);
  nor_101_ssc <= NOT(mux_80_nl OR CONV_SL_1_1(fsm_output(8 DOWNTO 7)/=STD_LOGIC_VECTOR'("00")));
  or_233_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0000"));
  nand_12_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111")));
  mux_81_nl <= MUX_s_1_2_2(or_233_nl, nand_12_nl, fsm_output(4));
  and_169_ssc <= mux_81_nl AND and_dcpl_24 AND (fsm_output(6)) AND (NOT (fsm_output(8)));
  mux_83_nl <= MUX_s_1_2_2((fsm_output(5)), (NOT mux_tmp_54), and_277_cse);
  and_172_ssc <= mux_83_nl AND and_dcpl_166 AND (NOT (fsm_output(8)));
  nand_28_nl <= NOT((fsm_output(0)) AND (fsm_output(1)) AND (fsm_output(6)) AND (NOT
      (fsm_output(7))) AND (fsm_output(5)));
  or_84_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("011"));
  mux_84_nl <= MUX_s_1_2_2(nand_28_nl, or_84_nl, fsm_output(2));
  mux_85_nl <= MUX_s_1_2_2(or_tmp_67, mux_84_nl, and_277_cse);
  nor_109_ssc <= NOT(mux_85_nl OR (fsm_output(8)));
  mux_86_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), or_tmp_87, fsm_output(2));
  mux_87_nl <= MUX_s_1_2_2(mux_86_nl, (fsm_output(5)), fsm_output(3));
  mux_88_nl <= MUX_s_1_2_2((fsm_output(5)), (NOT mux_87_nl), fsm_output(4));
  and_176_ssc <= mux_88_nl AND and_dcpl_170 AND (NOT (fsm_output(8)));
  or_92_nl <= (fsm_output(1)) OR (NOT (fsm_output(6))) OR (fsm_output(5));
  or_91_nl <= and_dcpl_81 OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  mux_89_nl <= MUX_s_1_2_2(or_92_nl, or_91_nl, fsm_output(2));
  mux_90_nl <= MUX_s_1_2_2(mux_89_nl, or_tmp_77, fsm_output(3));
  mux_91_nl <= MUX_s_1_2_2(or_tmp_70, mux_90_nl, fsm_output(4));
  and_177_ssc <= (NOT mux_91_nl) AND and_dcpl_152;
  and_nl <= (NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1111"))))
      AND (fsm_output(5));
  nor_56_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"))))
      OR (fsm_output(5)));
  mux_92_nl <= MUX_s_1_2_2(and_nl, nor_56_nl, fsm_output(4));
  and_179_ssc <= mux_92_nl AND nor_tmp_8 AND (NOT (fsm_output(8)));
  and_281_nl <= (fsm_output(3)) AND (fsm_output(2)) AND (fsm_output(0)) AND (fsm_output(1))
      AND (fsm_output(6)) AND (fsm_output(7)) AND (fsm_output(5));
  mux_93_nl <= MUX_s_1_2_2(and_281_nl, nor_tmp_9, fsm_output(4));
  nor_54_nl <= NOT((fsm_output(4)) OR and_dcpl_89 OR CONV_SL_1_1(fsm_output(7 DOWNTO
      5)/=STD_LOGIC_VECTOR'("000")));
  mux_94_ssc <= MUX_s_1_2_2(mux_93_nl, nor_54_nl, fsm_output(8));
  mux_95_nl <= MUX_s_1_2_2(or_tmp_87, (fsm_output(5)), fsm_output(2));
  mux_96_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), mux_95_nl, fsm_output(3));
  mux_97_nl <= MUX_s_1_2_2(mux_96_nl, (fsm_output(5)), fsm_output(4));
  and_181_ssc <= (NOT mux_97_nl) AND nor_157_cse AND (fsm_output(8));
  or_101_nl <= and_290_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  or_100_nl <= (NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))))
      OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  mux_98_nl <= MUX_s_1_2_2(or_101_nl, or_100_nl, fsm_output(3));
  mux_99_nl <= MUX_s_1_2_2(mux_98_nl, or_tmp_77, fsm_output(4));
  and_183_ssc <= (NOT mux_99_nl) AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("10"));
  mux_100_nl <= MUX_s_1_2_2(mux_tmp_54, (fsm_output(5)), or_204_cse);
  and_185_ssc <= (NOT mux_100_nl) AND and_dcpl_166 AND (fsm_output(8));
  and_188_ssc <= (or_dcpl_2 OR CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")))
      AND and_dcpl_59 AND (fsm_output(6)) AND (fsm_output(8));
  and_191_ssc <= (NOT((NOT and_dcpl_81) AND CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"))))
      AND and_dcpl_17 AND (NOT (fsm_output(6))) AND (fsm_output(8));
  nor_107_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(5))));
  nor_108_nl <= NOT(and_dcpl_81 OR (fsm_output(5)));
  mux_101_nl <= MUX_s_1_2_2(nor_107_nl, nor_108_nl, fsm_output(2));
  mux_102_nl <= MUX_s_1_2_2((fsm_output(5)), mux_101_nl, and_277_cse);
  and_193_ssc <= mux_102_nl AND and_dcpl_170 AND (fsm_output(8));
  or_115_nl <= (CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))) OR
      CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  or_114_nl <= nor_62_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  mux_103_nl <= MUX_s_1_2_2(or_115_nl, or_114_nl, fsm_output(3));
  mux_104_nl <= MUX_s_1_2_2(or_tmp_70, mux_103_nl, fsm_output(4));
  and_195_ssc <= (NOT mux_104_nl) AND CONV_SL_1_1(fsm_output(8 DOWNTO 7)=STD_LOGIC_VECTOR'("11"));
  mux_120_nl <= MUX_s_1_2_2(not_tmp_84, or_138_cse, fsm_output(3));
  and_232_tmp <= (NOT mux_120_nl) AND (NOT (fsm_output(5))) AND and_dcpl_207;
  mux_119_nl <= MUX_s_1_2_2(not_tmp_84, or_dcpl_2, fsm_output(3));
  and_230_tmp <= (NOT mux_119_nl) AND (NOT (fsm_output(5))) AND and_dcpl_207;
  COPY_LOOP_mux_nl <= MUX_v_64_2_2(vec_rsc_0_2_i_q_d, result_rsc_0_2_i_q_d, and_dcpl_20);
  COPY_LOOP_mux_3_nl <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, result_rsc_0_0_i_q_d, and_dcpl_20);
  xt_rsc_0_0_i_d_d_pff <= COPY_LOOP_mux_nl & COPY_LOOP_mux_3_nl;
  xt_rsc_0_0_i_radr_d_pff <= MUX_v_7_2_2((COMP_LOOP_r_10_3_sva(6 DOWNTO 0)), (COMP_LOOP_r_10_3_sva(7
      DOWNTO 1)), and_dcpl_27);
  xt_rsc_0_0_i_wadr_d_pff <= COPY_LOOP_1_i_12_3_sva_8_0(8 DOWNTO 2);
  xt_rsc_0_0_i_we_d_pff <= and_dcpl_31 AND and_dcpl_29 AND CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("00"));
  mux_43_nl <= MUX_s_1_2_2(mux_tmp_14, or_tmp_16, COMP_LOOP_r_10_3_sva(0));
  xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= (NOT mux_43_nl) AND and_dcpl_24
      AND and_dcpl_35;
  COPY_LOOP_mux_2_nl <= MUX_v_64_2_2(vec_rsc_0_6_i_q_d, result_rsc_0_6_i_q_d, and_dcpl_20);
  COPY_LOOP_mux_4_nl <= MUX_v_64_2_2(vec_rsc_0_4_i_q_d, result_rsc_0_4_i_q_d, and_dcpl_20);
  xt_rsc_0_1_i_d_d_pff <= COPY_LOOP_mux_2_nl & COPY_LOOP_mux_4_nl;
  xt_rsc_0_2_i_we_d_pff <= and_dcpl_31 AND and_dcpl_29 AND CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  xt_rsc_0_4_i_we_d_pff <= and_dcpl_31 AND and_dcpl_29 AND CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  mux_50_nl <= MUX_s_1_2_2(or_tmp_16, mux_tmp_14, COMP_LOOP_r_10_3_sva(0));
  xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= (NOT mux_50_nl) AND and_dcpl_24
      AND and_dcpl_35;
  xt_rsc_0_6_i_we_d_pff <= and_dcpl_31 AND and_dcpl_29 AND CONV_SL_1_1(COPY_LOOP_1_i_12_3_sva_8_0(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  vec_rsc_0_0_i_radr_d_pff <= COPY_LOOP_1_i_12_3_sva_8_0;
  vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= and_dcpl_55 AND and_dcpl_53;
  result_rsc_0_0_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_62);
  result_rsc_0_0_i_wadr_d <= (NOT and_dcpl_62) & COMP_LOOP_r_10_3_sva;
  nor_74_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT (fsm_output(2)))
      OR (fsm_output(0)) OR (NOT (fsm_output(7))));
  nor_75_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(3))) OR (fsm_output(2)) OR
      (NOT (fsm_output(0))) OR (fsm_output(7)));
  mux_54_nl <= MUX_s_1_2_2(nor_74_nl, nor_75_nl, fsm_output(8));
  result_rsc_0_0_i_we_d_pff <= mux_54_nl AND (fsm_output(5)) AND (NOT (fsm_output(6)))
      AND (NOT (fsm_output(1)));
  result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= and_dcpl_18 AND and_dcpl_54
      AND and_dcpl_15;
  result_rsc_0_1_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_71);
  result_rsc_0_1_i_wadr_d <= (NOT and_dcpl_71) & COMP_LOOP_r_10_3_sva;
  nor_72_nl <= NOT((fsm_output(2)) OR (fsm_output(6)) OR (NOT nor_tmp_18));
  nor_73_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(6))) OR (fsm_output(7))
      OR (fsm_output(5)));
  mux_55_nl <= MUX_s_1_2_2(nor_72_nl, nor_73_nl, fsm_output(8));
  result_rsc_0_1_i_we_d_pff <= mux_55_nl AND and_dcpl_16 AND and_dcpl_72;
  result_rsc_0_2_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_79);
  result_rsc_0_2_i_wadr_d <= (NOT and_dcpl_79) & COMP_LOOP_r_10_3_sva;
  nor_70_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(0)) OR (fsm_output(1)) OR
      (fsm_output(6)) OR (NOT (fsm_output(7))) OR (fsm_output(5)));
  nor_71_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(1)))
      OR (NOT (fsm_output(6))) OR (fsm_output(7)) OR (NOT (fsm_output(5))));
  mux_56_nl <= MUX_s_1_2_2(nor_70_nl, nor_71_nl, fsm_output(8));
  result_rsc_0_2_i_we_d_pff <= mux_56_nl AND and_dcpl_52;
  result_rsc_0_3_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_84);
  result_rsc_0_3_i_wadr_d <= (NOT and_dcpl_84) & COMP_LOOP_r_10_3_sva;
  nor_111_nl <= NOT((fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(6)));
  mux_57_nl <= MUX_s_1_2_2(and_288_cse, nor_111_nl, fsm_output(8));
  result_rsc_0_3_i_we_d_pff <= mux_57_nl AND (NOT (fsm_output(5))) AND (fsm_output(7))
      AND (NOT (fsm_output(0))) AND and_dcpl_72;
  result_rsc_0_4_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_92);
  result_rsc_0_4_i_wadr_d <= (NOT and_dcpl_92) & COMP_LOOP_r_10_3_sva;
  nor_68_nl <= NOT((fsm_output(2)) OR (fsm_output(0)) OR (NOT (fsm_output(6))));
  nor_69_nl <= NOT((NOT (fsm_output(2))) OR (NOT (fsm_output(0))) OR (fsm_output(6)));
  mux_58_nl <= MUX_s_1_2_2(nor_68_nl, nor_69_nl, fsm_output(8));
  result_rsc_0_4_i_we_d_pff <= mux_58_nl AND (NOT (fsm_output(5))) AND (fsm_output(7))
      AND (NOT (fsm_output(1))) AND (fsm_output(3)) AND (fsm_output(4));
  result_rsc_0_5_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_100);
  result_rsc_0_5_i_wadr_d <= (NOT and_dcpl_100) & COMP_LOOP_r_10_3_sva;
  nor_66_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(6))));
  nor_67_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(6)));
  mux_59_nl <= MUX_s_1_2_2(nor_66_nl, nor_67_nl, fsm_output(8));
  result_rsc_0_5_i_we_d_pff <= mux_59_nl AND nor_tmp_18 AND and_dcpl_16 AND and_dcpl_14;
  result_rsc_0_6_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_106);
  result_rsc_0_6_i_wadr_d <= (NOT and_dcpl_106) & COMP_LOOP_r_10_3_sva;
  nor_65_nl <= NOT((fsm_output(2)) OR (fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(7)));
  and_291_nl <= (fsm_output(2)) AND (fsm_output(1)) AND (fsm_output(6)) AND (fsm_output(7));
  mux_60_nl <= MUX_s_1_2_2(nor_65_nl, and_291_nl, fsm_output(4));
  result_rsc_0_6_i_we_d_pff <= mux_60_nl AND (NOT (fsm_output(5))) AND (fsm_output(0))
      AND (NOT (fsm_output(3))) AND (fsm_output(8));
  result_rsc_0_7_i_d_d <= MUX_v_64_2_2((COMP_LOOP_1_rem_cmp_z(63 DOWNTO 0)), COMP_LOOP_1_f2_rem_cmp_z,
      and_dcpl_113);
  result_rsc_0_7_i_wadr_d <= (NOT and_dcpl_113) & COMP_LOOP_r_10_3_sva;
  nor_63_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(3)) OR (NOT((fsm_output(1))
      AND (fsm_output(5)))));
  nor_64_nl <= NOT((fsm_output(4)) OR (NOT (fsm_output(3))) OR (fsm_output(1)) OR
      (fsm_output(5)));
  mux_61_nl <= MUX_s_1_2_2(nor_63_nl, nor_64_nl, fsm_output(8));
  result_rsc_0_7_i_we_d_pff <= mux_61_nl AND nor_157_cse AND (NOT (fsm_output(0)))
      AND (fsm_output(2));
  twiddle_rsc_0_0_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_118;
  twiddle_rsc_0_1_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_55 AND and_dcpl_121;
  twiddle_rsc_0_2_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_55 AND and_dcpl_124;
  twiddle_rsc_0_3_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_130 AND and_dcpl_127
      AND CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  twiddle_rsc_0_4_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_55 AND and_dcpl_133;
  twiddle_rsc_0_5_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_130 AND and_dcpl_127
      AND and_dcpl_135;
  twiddle_rsc_0_6_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_130 AND and_dcpl_127
      AND CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  twiddle_rsc_0_7_i_radr_d <= '0' & COMP_LOOP_1_f2_and_rmff;
  twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_130 AND and_dcpl_127
      AND and_dcpl_135 AND (STAGE_LOOP_base_8_0_sva(1));
  and_dcpl_282 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_283 <= and_dcpl_282 AND (NOT (fsm_output(7)));
  and_dcpl_298 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_339_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_246;
  and_dcpl_305 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_327 <= and_dcpl_166 AND (NOT (fsm_output(5)));
  and_dcpl_368 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10")) AND
      nor_184_cse;
  and_dcpl_371 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_373 <= and_dcpl_371 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"))
      AND and_dcpl_368;
  and_dcpl_375 <= and_dcpl_371 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_376 <= and_dcpl_375 AND and_dcpl_368;
  and_dcpl_378 <= and_dcpl_371 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_379 <= and_dcpl_378 AND and_dcpl_368;
  and_dcpl_382 <= and_dcpl_371 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND and_dcpl_368;
  and_dcpl_384 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")) AND
      nor_184_cse;
  and_dcpl_385 <= and_dcpl_375 AND and_dcpl_384;
  and_dcpl_386 <= and_dcpl_378 AND and_dcpl_384;
  and_dcpl_399 <= and_dcpl_371 AND CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111"))
      AND nor_184_cse;
  or_tmp_212 <= (NOT (fsm_output(3))) OR (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(4));
  or_tmp_227 <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0000"));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(nor_92_nl, mux_tmp_8, fsm_output(8))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_xt_rsc_0_0_cgo_cse <= '0';
        reg_xt_rsc_0_2_cgo_cse <= '0';
        reg_xt_rsc_0_4_cgo_cse <= '0';
        reg_xt_rsc_0_6_cgo_cse <= '0';
        reg_vec_rsc_triosy_0_6_obj_ld_cse <= '0';
        COMP_LOOP_f2_COMP_LOOP_f2_nor_3_itm <= '0';
        COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm <= '0';
        COMP_LOOP_f2_COMP_LOOP_f2_and_13_itm <= '0';
        COMP_LOOP_f2_COMP_LOOP_f2_and_14_itm <= '0';
        COMP_LOOP_f2_COMP_LOOP_f2_and_15_itm <= '0';
      ELSE
        reg_xt_rsc_0_0_cgo_cse <= nor_99_rmff;
        reg_xt_rsc_0_2_cgo_cse <= nor_98_rmff;
        reg_xt_rsc_0_4_cgo_cse <= nor_97_rmff;
        reg_xt_rsc_0_6_cgo_cse <= nor_96_rmff;
        reg_vec_rsc_triosy_0_6_obj_ld_cse <= and_dcpl_147 AND and_dcpl_89 AND (fsm_output(4))
            AND (fsm_output(8)) AND (z_out_5(4));
        COMP_LOOP_f2_COMP_LOOP_f2_nor_3_itm <= NOT(CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011"));
        COMP_LOOP_f2_COMP_LOOP_f2_and_13_itm <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101"));
        COMP_LOOP_f2_COMP_LOOP_f2_and_14_itm <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110"));
        COMP_LOOP_f2_COMP_LOOP_f2_and_15_itm <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      reg_COMP_LOOP_1_rem_cmp_a_ftd <= MUX1HOT_s_1_4_2((z_out_1(64)), COMP_LOOP_acc_10_itm_64,
          COMP_LOOP_acc_7_itm_64, COMP_LOOP_acc_6_itm_64, STD_LOGIC_VECTOR'( COMP_LOOP_or_12_ssc
          & (NOT mux_70_itm) & and_155_ssc & and_157_ssc));
      reg_COMP_LOOP_1_rem_cmp_a_ftd_1 <= MUX1HOT_v_64_4_2((z_out_1(63 DOWNTO 0)),
          COMP_LOOP_acc_10_itm_63_0, COMP_LOOP_acc_7_itm_63_0, COMP_LOOP_acc_6_itm_63_0,
          STD_LOGIC_VECTOR'( COMP_LOOP_or_12_ssc & (NOT mux_70_itm) & and_155_ssc
          & and_157_ssc));
      reg_COMP_LOOP_1_rem_cmp_b_63_0_cse <= p_sva;
      reg_COMP_LOOP_1_f2_rem_cmp_a_ftd <= MUX_v_63_2_2(STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000"),
          COMP_LOOP_f2_mux1h_nl, COMP_LOOP_f2_nor_3_nl);
      reg_COMP_LOOP_1_f2_rem_cmp_a_ftd_1 <= MUX1HOT_v_65_17_2((z_out_4(64 DOWNTO
          0)), (COMP_LOOP_8_f2_mul_mut(64 DOWNTO 0)), (COMP_LOOP_1_f2_mul_itm(64
          DOWNTO 0)), (COMP_LOOP_2_f2_mul_itm(64 DOWNTO 0)), (COMP_LOOP_3_f2_mul_itm(64
          DOWNTO 0)), (COMP_LOOP_4_f2_mul_itm(64 DOWNTO 0)), (COMP_LOOP_5_f2_mul_itm(64
          DOWNTO 0)), (COMP_LOOP_6_f2_mul_itm(64 DOWNTO 0)), (COMP_LOOP_7_f2_mul_itm(64
          DOWNTO 0)), (COMP_LOOP_8_acc_1_itm_64 & COMP_LOOP_8_acc_1_itm_63_0), (COMP_LOOP_1_acc_1_itm_64
          & COMP_LOOP_1_acc_1_itm_63_0), (COMP_LOOP_2_acc_1_itm_64 & COMP_LOOP_2_acc_1_itm_63_0),
          (COMP_LOOP_3_acc_1_itm_64 & COMP_LOOP_3_acc_1_itm_63_0), (COMP_LOOP_4_acc_1_itm_64
          & COMP_LOOP_4_acc_1_itm_63_0), (COMP_LOOP_5_acc_1_itm_64 & COMP_LOOP_5_acc_1_itm_63_0),
          (COMP_LOOP_acc_7_itm_64 & COMP_LOOP_acc_7_itm_63_0), (COMP_LOOP_acc_6_itm_64
          & COMP_LOOP_acc_6_itm_63_0), STD_LOGIC_VECTOR'( and_dcpl_158 & and_164_ssc
          & nor_101_ssc & and_169_ssc & and_172_ssc & nor_109_ssc & and_176_ssc &
          and_177_ssc & and_179_ssc & mux_94_ssc & and_181_ssc & and_183_ssc & and_185_ssc
          & and_188_ssc & and_191_ssc & and_193_ssc & and_195_ssc));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_12_3_sva_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( ((mux_tmp_13 AND (NOT (fsm_output(5))) AND (fsm_output(1)) AND (fsm_output(0))
          AND (NOT (fsm_output(2)))) OR and_dcpl_118 OR COPY_LOOP_1_i_12_3_sva_8_0_mx0c2)
          = '1' ) THEN
        COPY_LOOP_1_i_12_3_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"),
            COPY_LOOP_1_i_mux_nl, COPY_LOOP_1_i_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_12_3_sva_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT((NOT mux_tmp_13) OR (fsm_output(5)) OR (fsm_output(1)) OR (NOT
          (fsm_output(0))) OR (fsm_output(2)))) = '1' ) THEN
        COPY_LOOP_1_i_12_3_sva_1 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(not_tmp_80, mux_tmp_8, fsm_output(8))) = '1' ) THEN
        STAGE_LOOP_base_acc_cse_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"), (z_out_5(3
            DOWNTO 0)), and_dcpl_201);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_r_10_3_sva <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (and_dcpl_201 OR (and_dcpl_147 AND and_dcpl_15)) = '1' ) THEN
        COMP_LOOP_r_10_3_sva <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (COPY_LOOP_1_i_12_3_sva_8_0(7
            DOWNTO 0)), COMP_LOOP_r_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_base_8_0_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(not_tmp_80, mux_113_nl, fsm_output(8))) = '1' ) THEN
        STAGE_LOOP_base_8_0_sva <= STAGE_LOOP_base_lshift_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_19 = '0' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_2_63_0_itm <= xt_rsc_0_2_i_q_d(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_19 = '0' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_3_63_0_itm <= xt_rsc_0_3_i_q_d(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_19 = '0' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_4_63_0_itm <= xt_rsc_0_4_i_q_d(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_19 = '0' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_5_63_0_itm <= xt_rsc_0_5_i_q_d(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_19 = '0' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_6_63_0_itm <= xt_rsc_0_6_i_q_d(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_27 OR and_dcpl_230 OR and_dcpl_233) = '1' ) THEN
        COMP_LOOP_f2_mux1h_6_itm <= MUX1HOT_v_64_10_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, twiddle_rsc_0_4_i_q_d,
            twiddle_rsc_0_5_i_q_d, twiddle_rsc_0_6_i_q_d, twiddle_rsc_0_7_i_q_d,
            (xt_rsc_0_2_i_q_d(127 DOWNTO 64)), (xt_rsc_0_6_i_q_d(127 DOWNTO 64)),
            STD_LOGIC_VECTOR'( COMP_LOOP_f2_and_12_nl & COMP_LOOP_f2_COMP_LOOP_f2_and_9_nl
            & COMP_LOOP_f2_COMP_LOOP_f2_and_10_nl & COMP_LOOP_f2_and_13_nl & COMP_LOOP_f2_COMP_LOOP_f2_and_12_nl
            & COMP_LOOP_f2_and_14_nl & COMP_LOOP_f2_and_15_nl & COMP_LOOP_f2_and_16_nl
            & and_dcpl_230 & and_dcpl_233));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT (fsm_output(5))) AND (fsm_output(2)) AND (NOT (fsm_output(3)))
          AND nor_184_cse AND nor_157_cse AND (fsm_output(1)) AND ((NOT (fsm_output(0)))
          OR (COMP_LOOP_r_10_3_sva(0)))) OR and_dcpl_230) = '1' ) THEN
        COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_7_63_0_itm <= MUX_v_64_2_2((xt_rsc_0_7_i_q_d(63
            DOWNTO 0)), (xt_rsc_0_3_i_q_d(63 DOWNTO 0)), and_dcpl_230);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_155_nl AND nor_189_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("00")))
          = '1' ) THEN
        COMP_LOOP_1_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(mux_156_cse OR (fsm_output(7)))) AND nor_184_cse AND nor_185_cse)
          = '1' ) THEN
        COMP_LOOP_1_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_158_nl AND (NOT((fsm_output(7)) OR (fsm_output(8)) OR (fsm_output(5)))))
          = '1' ) THEN
        COMP_LOOP_2_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_1_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_159_nl AND nor_189_cse AND (NOT (fsm_output(5))) AND (fsm_output(2))
          AND (NOT (fsm_output(0))) AND (fsm_output(1))) = '1' ) THEN
        COMP_LOOP_2_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_1_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_161_nl AND nor_189_cse) = '1' ) THEN
        COMP_LOOP_3_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_2_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_162_nl AND nor_189_cse AND (fsm_output(1))) = '1' ) THEN
        COMP_LOOP_3_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_2_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_165_nl AND (NOT((fsm_output(6)) OR (fsm_output(5)) OR (fsm_output(8)))))
          = '1' ) THEN
        COMP_LOOP_4_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_3_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_166_nl AND (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))))
          AND (NOT((fsm_output(8)) OR (fsm_output(0))))) = '1' ) THEN
        COMP_LOOP_4_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_3_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_167_nl AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"))
          AND nor_161_cse) = '1' ) THEN
        COMP_LOOP_5_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_4_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_168_nl AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("01"))
          AND nor_161_cse) = '1' ) THEN
        COMP_LOOP_5_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_4_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_170_nl AND nor_184_cse AND nor_157_cse) = '1' ) THEN
        COMP_LOOP_8_acc_1_itm_64 <= COMP_LOOP_COMP_LOOP_mux_5_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT((fsm_output(4)) OR (fsm_output(8)) OR (fsm_output(6)))) AND ((fsm_output(5))
          XOR (fsm_output(1))) AND (NOT((fsm_output(7)) OR (fsm_output(3)))) AND
          (NOT (fsm_output(0))) AND (fsm_output(2))) = '1' ) THEN
        COMP_LOOP_8_acc_1_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_5_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_177_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_acc_10_itm_64 <= COMP_LOOP_COMP_LOOP_mux_6_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_181_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_acc_10_itm_63_0 <= COMP_LOOP_COMP_LOOP_mux_6_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_185_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_acc_6_itm_64 <= COMP_LOOP_mux1h_8_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_188_nl AND (NOT (fsm_output(8))) AND (fsm_output(2))) = '1' ) THEN
        COMP_LOOP_acc_6_itm_63_0 <= COMP_LOOP_mux1h_8_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_193_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_acc_7_itm_64 <= COMP_LOOP_mux1h_9_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_196_nl OR (fsm_output(8)))) = '1' ) THEN
        COMP_LOOP_acc_7_itm_63_0 <= COMP_LOOP_mux1h_9_rgt(63 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( COMP_LOOP_f1_or_cse = '1' ) THEN
        tmp_14_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_3_i_q_d(127 DOWNTO 64)),
            (xt_rsc_0_7_i_q_d(127 DOWNTO 64)), and_dcpl_233);
        tmp_8_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_2_i_q_d(63 DOWNTO 0)), (xt_rsc_0_6_i_q_d(63
            DOWNTO 0)), and_dcpl_233);
        tmp_6_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_1_i_q_d(127 DOWNTO 64)),
            (xt_rsc_0_5_i_q_d(127 DOWNTO 64)), and_dcpl_233);
        tmp_4_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_1_i_q_d(63 DOWNTO 0)), (xt_rsc_0_5_i_q_d(63
            DOWNTO 0)), and_dcpl_233);
        tmp_2_127_64_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_0_i_q_d(127 DOWNTO 64)),
            (xt_rsc_0_4_i_q_d(127 DOWNTO 64)), and_dcpl_233);
        tmp_63_0_lpi_3_dfm <= MUX_v_64_2_2((xt_rsc_0_0_i_q_d(63 DOWNTO 0)), (xt_rsc_0_4_i_q_d(63
            DOWNTO 0)), and_dcpl_233);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_44 OR or_dcpl_16)) = '1' ) THEN
        COMP_LOOP_8_f2_mul_mut <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_118 OR or_dcpl_47)) = '1' ) THEN
        COMP_LOOP_7_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_49 OR or_dcpl_47)) = '1' ) THEN
        COMP_LOOP_6_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_18 OR or_dcpl_47)) = '1' ) THEN
        COMP_LOOP_5_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_44 OR or_dcpl_47)) = '1' ) THEN
        COMP_LOOP_4_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_118 OR or_dcpl_54)) = '1' ) THEN
        COMP_LOOP_3_f2_mul_itm <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_49 OR or_dcpl_54)) = '1' ) THEN
        COMP_LOOP_2_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_18 OR or_dcpl_54)) = '1' ) THEN
        COMP_LOOP_1_f2_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  nor_92_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000000")));
  COMP_LOOP_f2_mux1h_nl <= MUX1HOT_v_63_9_2((z_out_4(127 DOWNTO 65)), (COMP_LOOP_8_f2_mul_mut(127
      DOWNTO 65)), (COMP_LOOP_1_f2_mul_itm(127 DOWNTO 65)), (COMP_LOOP_2_f2_mul_itm(127
      DOWNTO 65)), (COMP_LOOP_3_f2_mul_itm(127 DOWNTO 65)), (COMP_LOOP_4_f2_mul_itm(127
      DOWNTO 65)), (COMP_LOOP_5_f2_mul_itm(127 DOWNTO 65)), (COMP_LOOP_6_f2_mul_itm(127
      DOWNTO 65)), (COMP_LOOP_7_f2_mul_itm(127 DOWNTO 65)), STD_LOGIC_VECTOR'( and_dcpl_158
      & and_164_ssc & nor_101_ssc & and_169_ssc & and_172_ssc & nor_109_ssc & and_176_ssc
      & and_177_ssc & and_179_ssc));
  COMP_LOOP_f2_nor_3_nl <= NOT(mux_94_ssc OR and_181_ssc OR and_183_ssc OR and_185_ssc
      OR and_188_ssc OR and_191_ssc OR and_193_ssc OR and_195_ssc);
  COPY_LOOP_1_i_mux_nl <= MUX_v_9_2_2((COPY_LOOP_1_i_12_3_sva_1(8 DOWNTO 0)), (z_out(8
      DOWNTO 0)), and_dcpl_118);
  COPY_LOOP_1_i_not_nl <= NOT COPY_LOOP_1_i_12_3_sva_8_0_mx0c2;
  COMP_LOOP_r_not_1_nl <= NOT and_dcpl_201;
  mux_112_nl <= MUX_s_1_2_2(nor_tmp_9, nor_tmp_8, or_138_cse);
  mux_113_nl <= MUX_s_1_2_2(nor_tmp_9, mux_112_nl, and_277_cse);
  COMP_LOOP_f2_and_12_nl <= COMP_LOOP_f2_COMP_LOOP_f2_nor_3_itm AND and_dcpl_27;
  COMP_LOOP_f2_COMP_LOOP_f2_and_9_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("001")) AND and_dcpl_27;
  COMP_LOOP_f2_COMP_LOOP_f2_and_10_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("010")) AND and_dcpl_27;
  COMP_LOOP_f2_and_13_nl <= COMP_LOOP_f2_COMP_LOOP_f2_and_11_itm AND and_dcpl_27;
  COMP_LOOP_f2_COMP_LOOP_f2_and_12_nl <= CONV_SL_1_1(STAGE_LOOP_base_8_0_sva(2 DOWNTO
      0)=STD_LOGIC_VECTOR'("100")) AND and_dcpl_27;
  COMP_LOOP_f2_and_14_nl <= COMP_LOOP_f2_COMP_LOOP_f2_and_13_itm AND and_dcpl_27;
  COMP_LOOP_f2_and_15_nl <= COMP_LOOP_f2_COMP_LOOP_f2_and_14_itm AND and_dcpl_27;
  COMP_LOOP_f2_and_16_nl <= COMP_LOOP_f2_COMP_LOOP_f2_and_15_itm AND and_dcpl_27;
  nor_186_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(2)) OR (NOT (fsm_output(6))));
  nor_187_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(6)));
  mux_154_nl <= MUX_s_1_2_2(nor_186_nl, nor_187_nl, fsm_output(1));
  nor_188_nl <= NOT((fsm_output(2)) OR (fsm_output(6)));
  mux_155_nl <= MUX_s_1_2_2(mux_154_nl, nor_188_nl, fsm_output(3));
  nor_nl <= NOT((NOT (fsm_output(3))) OR (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(6)));
  nor_180_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(4)) OR (fsm_output(6)));
  nor_181_nl <= NOT((fsm_output(0)) OR (NOT((fsm_output(2)) AND (fsm_output(4)) AND
      (fsm_output(6)))));
  mux_157_nl <= MUX_s_1_2_2(nor_180_nl, nor_181_nl, fsm_output(3));
  mux_158_nl <= MUX_s_1_2_2(nor_nl, mux_157_nl, fsm_output(1));
  nor_178_nl <= NOT((fsm_output(4)) OR (fsm_output(6)));
  and_518_nl <= (fsm_output(4)) AND (fsm_output(6));
  mux_159_nl <= MUX_s_1_2_2(nor_178_nl, and_518_nl, fsm_output(3));
  nor_174_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(5))
      OR (fsm_output(4)));
  nor_175_nl <= NOT((or_59_cse AND (fsm_output(2))) OR CONV_SL_1_1(fsm_output(5 DOWNTO
      4)/=STD_LOGIC_VECTOR'("00")));
  mux_160_nl <= MUX_s_1_2_2(nor_174_nl, nor_175_nl, fsm_output(3));
  nor_176_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1011"))))
      OR nand_43_cse);
  mux_161_nl <= MUX_s_1_2_2(mux_160_nl, nor_176_nl, fsm_output(6));
  nor_171_nl <= NOT((fsm_output(3)) OR (fsm_output(0)) OR (NOT (fsm_output(2))) OR
      (fsm_output(5)) OR (fsm_output(4)));
  nor_172_nl <= NOT((NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(2))
      OR nand_43_cse);
  mux_162_nl <= MUX_s_1_2_2(nor_171_nl, nor_172_nl, fsm_output(6));
  nor_166_nl <= NOT((fsm_output(7)) OR (fsm_output(2)) OR (NOT (fsm_output(3))));
  nor_167_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(2))) OR (fsm_output(3)));
  mux_163_nl <= MUX_s_1_2_2(nor_166_nl, nor_167_nl, fsm_output(1));
  mux_164_nl <= MUX_s_1_2_2(mux_163_nl, nor_168_cse, fsm_output(0));
  nor_169_nl <= NOT((fsm_output(0)) OR (fsm_output(1)) OR (NOT (fsm_output(7))) OR
      (fsm_output(2)) OR (NOT (fsm_output(3))));
  mux_165_nl <= MUX_s_1_2_2(mux_164_nl, nor_169_nl, fsm_output(4));
  nor_163_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(7))) OR (fsm_output(2)) OR
      (NOT (fsm_output(3))));
  mux_166_nl <= MUX_s_1_2_2(nor_168_cse, nor_163_nl, fsm_output(4));
  nor_160_nl <= NOT((fsm_output(7)) OR (NOT (fsm_output(1))) OR (fsm_output(4)));
  mux_167_nl <= MUX_s_1_2_2(nor_160_nl, and_516_cse, fsm_output(5));
  nor_158_nl <= NOT((fsm_output(0)) OR (fsm_output(7)) OR (NOT (fsm_output(1))) OR
      (fsm_output(4)));
  mux_168_nl <= MUX_s_1_2_2(nor_158_nl, and_516_cse, fsm_output(5));
  nor_153_nl <= NOT(and_275_cse_1 OR (NOT (fsm_output(3))) OR (fsm_output(5)));
  nor_154_nl <= NOT((fsm_output(0)) OR (fsm_output(3)) OR (NOT (fsm_output(5))));
  mux_169_nl <= MUX_s_1_2_2(nor_154_nl, nor_185_cse, fsm_output(1));
  mux_170_nl <= MUX_s_1_2_2(nor_153_nl, mux_169_nl, fsm_output(2));
  or_298_nl <= (NOT (fsm_output(0))) OR (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(7))
      OR (fsm_output(4));
  or_297_nl <= (fsm_output(0)) OR (fsm_output(3)) OR (fsm_output(5)) OR (NOT((fsm_output(7))
      AND (fsm_output(4))));
  mux_175_nl <= MUX_s_1_2_2(or_298_nl, or_297_nl, fsm_output(1));
  mux_176_nl <= MUX_s_1_2_2(or_tmp_212, mux_175_nl, fsm_output(6));
  or_295_nl <= (NOT (fsm_output(5))) OR (fsm_output(7)) OR (fsm_output(4));
  or_294_nl <= (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(4));
  mux_171_nl <= MUX_s_1_2_2(or_295_nl, or_294_nl, fsm_output(3));
  mux_172_nl <= MUX_s_1_2_2(mux_171_nl, or_tmp_212, fsm_output(0));
  or_292_nl <= (fsm_output(3)) OR (fsm_output(5)) OR (fsm_output(7)) OR (fsm_output(4));
  mux_173_nl <= MUX_s_1_2_2(mux_172_nl, or_292_nl, fsm_output(1));
  nand_40_nl <= NOT((fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(3)) AND (fsm_output(5))
      AND (fsm_output(7)) AND (NOT (fsm_output(4))));
  mux_174_nl <= MUX_s_1_2_2(mux_173_nl, nand_40_nl, fsm_output(6));
  mux_177_nl <= MUX_s_1_2_2(mux_176_nl, mux_174_nl, fsm_output(2));
  or_335_nl <= (fsm_output(3)) OR (fsm_output(7)) OR mux_156_cse;
  or_336_nl <= (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(0)) OR (NOT (fsm_output(2)))
      OR (fsm_output(6));
  nand_38_nl <= NOT((fsm_output(7)) AND (fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(2))
      AND (fsm_output(6)));
  mux_178_nl <= MUX_s_1_2_2(or_336_nl, nand_38_nl, fsm_output(3));
  mux_180_nl <= MUX_s_1_2_2(or_335_nl, mux_178_nl, fsm_output(5));
  or_337_nl <= (fsm_output(5)) OR (fsm_output(3)) OR (NOT (fsm_output(7))) OR (NOT
      (fsm_output(1))) OR (fsm_output(0)) OR (fsm_output(2)) OR (NOT (fsm_output(6)));
  mux_181_nl <= MUX_s_1_2_2(mux_180_nl, or_337_nl, fsm_output(4));
  or_309_nl <= (fsm_output(6)) OR (NOT((fsm_output(4)) AND (fsm_output(0)) AND (fsm_output(5))
      AND (fsm_output(7))));
  mux_184_nl <= MUX_s_1_2_2(or_309_nl, or_tmp_227, fsm_output(1));
  nand_31_nl <= NOT((fsm_output(2)) AND (NOT mux_184_nl));
  and_512_nl <= (fsm_output(0)) AND (fsm_output(5)) AND (fsm_output(7));
  nor_148_nl <= NOT((fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(7)));
  mux_182_nl <= MUX_s_1_2_2(and_512_nl, nor_148_nl, fsm_output(4));
  nand_37_nl <= NOT((fsm_output(6)) AND mux_182_nl);
  mux_183_nl <= MUX_s_1_2_2(or_tmp_227, nand_37_nl, and_290_cse);
  mux_185_nl <= MUX_s_1_2_2(nand_31_nl, mux_183_nl, fsm_output(3));
  nor_143_nl <= NOT((fsm_output(3)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(5)))
      OR (NOT (fsm_output(4))) OR (NOT (fsm_output(7))) OR (fsm_output(6)));
  nor_144_nl <= NOT((fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(4)) OR (fsm_output(7))
      OR (fsm_output(6)));
  nor_145_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("0101")));
  nor_146_nl <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1110")));
  mux_186_nl <= MUX_s_1_2_2(nor_145_nl, nor_146_nl, fsm_output(0));
  mux_187_nl <= MUX_s_1_2_2(nor_144_nl, mux_186_nl, fsm_output(3));
  mux_188_nl <= MUX_s_1_2_2(nor_143_nl, mux_187_nl, fsm_output(1));
  or_324_nl <= (fsm_output(7)) OR (NOT (fsm_output(1))) OR (NOT (fsm_output(2)))
      OR (fsm_output(4));
  or_323_nl <= and_290_cse OR (fsm_output(4));
  or_322_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  mux_190_nl <= MUX_s_1_2_2(or_323_nl, or_322_nl, fsm_output(7));
  or_320_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(4));
  mux_191_nl <= MUX_s_1_2_2(mux_190_nl, or_320_nl, fsm_output(0));
  mux_192_nl <= MUX_s_1_2_2(or_324_nl, mux_191_nl, fsm_output(3));
  or_332_nl <= (fsm_output(5)) OR mux_192_nl;
  or_333_nl <= (fsm_output(3)) OR (fsm_output(0)) OR (NOT (fsm_output(7))) OR (NOT
      (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  or_334_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(0))) OR (fsm_output(7))
      OR (NOT (fsm_output(1))) OR (fsm_output(2)) OR (NOT (fsm_output(4)));
  mux_189_nl <= MUX_s_1_2_2(or_333_nl, or_334_nl, fsm_output(5));
  mux_193_nl <= MUX_s_1_2_2(or_332_nl, mux_189_nl, fsm_output(6));
  and_510_nl <= (fsm_output(6)) AND (fsm_output(1));
  nor_140_nl <= NOT((fsm_output(6)) OR (fsm_output(1)));
  mux_194_nl <= MUX_s_1_2_2(and_510_nl, nor_140_nl, fsm_output(3));
  and_509_nl <= (NOT((fsm_output(5)) OR (NOT (fsm_output(7))))) AND mux_194_nl;
  nor_141_nl <= NOT((NOT (fsm_output(5))) OR (fsm_output(7)) OR (NOT((fsm_output(3))
      AND (fsm_output(6)) AND (fsm_output(1)))));
  mux_195_nl <= MUX_s_1_2_2(and_509_nl, nor_141_nl, fsm_output(0));
  nand_34_nl <= NOT((fsm_output(4)) AND mux_195_nl);
  or_331_nl <= (fsm_output(4)) OR (fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(7))
      OR (fsm_output(3)) OR (fsm_output(6)) OR (NOT (fsm_output(1)));
  mux_196_nl <= MUX_s_1_2_2(nand_34_nl, or_331_nl, fsm_output(2));
  and_519_nl <= mux_tmp_13 AND (NOT (fsm_output(1))) AND (fsm_output(0)) AND (NOT((fsm_output(5))
      OR (fsm_output(2))));
  COMP_LOOP_mux_17_nl <= MUX_v_9_2_2(('0' & COMP_LOOP_r_10_3_sva), COPY_LOOP_1_i_12_3_sva_8_0,
      and_519_nl);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_17_nl),
      10) + UNSIGNED'( "0000000001"), 10));
  and_521_nl <= and_dcpl_283 AND and_dcpl_54 AND and_dcpl_52 AND nor_184_cse;
  and_522_nl <= and_dcpl_282 AND (fsm_output(7)) AND and_dcpl_16 AND and_dcpl_52
      AND and_dcpl_246;
  and_523_nl <= and_dcpl_283 AND and_dcpl_16 AND and_dcpl_89 AND and_dcpl_246;
  and_524_nl <= and_dcpl_298 AND (fsm_output(7)) AND and_dcpl_54 AND and_dcpl_22
      AND and_dcpl_246;
  and_525_nl <= and_dcpl_305 AND (NOT (fsm_output(7))) AND and_275_cse_1 AND and_339_cse;
  and_526_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)=STD_LOGIC_VECTOR'("100")) AND
      and_dcpl_81 AND and_339_cse;
  and_527_nl <= and_dcpl_298 AND (NOT (fsm_output(7))) AND and_dcpl_81 AND and_dcpl_22
      AND nor_184_cse;
  and_528_nl <= and_dcpl_305 AND (fsm_output(7)) AND and_275_cse_1 AND and_dcpl_89
      AND nor_184_cse;
  COMP_LOOP_mux1h_15_nl <= MUX1HOT_v_64_8_2(tmp_63_0_lpi_3_dfm, COMP_LOOP_f2_mux1h_6_itm,
      tmp_2_127_64_lpi_3_dfm, tmp_8_63_0_lpi_3_dfm, tmp_4_63_0_lpi_3_dfm, tmp_6_127_64_lpi_3_dfm,
      tmp_14_127_64_lpi_3_dfm, COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_7_63_0_itm,
      STD_LOGIC_VECTOR'( and_521_nl & and_522_nl & and_523_nl & and_524_nl & and_525_nl
      & and_526_nl & and_527_nl & and_528_nl));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & COMP_LOOP_mux1h_15_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT COMP_LOOP_1_f2_rem_cmp_z)
      & '1'), 65), 66), 66));
  z_out_1 <= acc_1_nl(65 DOWNTO 1);
  and_529_nl <= and_dcpl_327 AND and_dcpl_54 AND and_dcpl_52 AND nor_184_cse;
  and_530_nl <= and_dcpl_327 AND and_dcpl_16 AND and_dcpl_89 AND and_dcpl_246;
  and_531_nl <= and_dcpl_166 AND (fsm_output(5)) AND and_275_cse_1 AND and_339_cse;
  and_532_nl <= and_dcpl_170 AND (NOT (fsm_output(5))) AND and_dcpl_81 AND and_339_cse;
  and_533_nl <= and_dcpl_170 AND (fsm_output(5)) AND and_dcpl_54 AND and_dcpl_22
      AND and_dcpl_246;
  and_534_nl <= nor_157_cse AND (fsm_output(5)) AND and_dcpl_81 AND and_dcpl_22 AND
      nor_184_cse;
  and_535_nl <= nor_tmp_8 AND (fsm_output(5)) AND and_275_cse_1 AND and_dcpl_89 AND
      nor_184_cse;
  and_536_nl <= nor_tmp_8 AND (NOT (fsm_output(5))) AND and_dcpl_16 AND and_dcpl_52
      AND and_dcpl_246;
  COMP_LOOP_mux1h_16_nl <= MUX1HOT_v_64_8_2(tmp_63_0_lpi_3_dfm, tmp_2_127_64_lpi_3_dfm,
      tmp_4_63_0_lpi_3_dfm, tmp_6_127_64_lpi_3_dfm, tmp_8_63_0_lpi_3_dfm, tmp_14_127_64_lpi_3_dfm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_7_63_0_itm, COMP_LOOP_f2_mux1h_6_itm,
      STD_LOGIC_VECTOR'( and_529_nl & and_530_nl & and_531_nl & and_532_nl & and_533_nl
      & and_534_nl & and_535_nl & and_536_nl));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux1h_16_nl),
      65) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_1_f2_rem_cmp_z), 64),
      65), 65));
  COMP_LOOP_f2_mux1h_15_nl <= MUX1HOT_v_64_6_2(COMP_LOOP_5_acc_1_itm_63_0, COMP_LOOP_4_acc_1_itm_63_0,
      COMP_LOOP_2_acc_1_itm_63_0, COMP_LOOP_8_acc_1_itm_63_0, COMP_LOOP_3_acc_1_itm_63_0,
      COMP_LOOP_acc_10_itm_63_0, STD_LOGIC_VECTOR'( and_dcpl_373 & and_dcpl_376 &
      and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_386));
  COMP_LOOP_f2_mux1h_16_nl <= MUX1HOT_v_64_6_2(COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_6_6_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_5_5_63_0_itm, COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_4_4_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_3_3_63_0_itm, COMP_LOOP_acc_7_itm_63_0,
      COMP_LOOP_acc_6_itm_63_0, STD_LOGIC_VECTOR'( and_dcpl_373 & and_dcpl_376 &
      and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_386));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_f2_mux1h_15_nl)
      * UNSIGNED(COMP_LOOP_f2_mux1h_16_nl)), 128));
  COMP_LOOP_f2_mux_40_nl <= MUX_v_64_2_2(COMP_LOOP_1_acc_1_itm_63_0, COMP_LOOP_f2_mux1h_6_itm,
      and_dcpl_399);
  COMP_LOOP_f2_mux_41_nl <= MUX_v_64_2_2(COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_2_2_63_0_itm,
      COMP_LOOP_f2_slc_COMP_LOOP_f2_read_mem_xt_rsc_0_7_7_63_0_itm, and_dcpl_399);
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_f2_mux_40_nl)
      * UNSIGNED(COMP_LOOP_f2_mux_41_nl)), 128));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_base_acc_cse_sva),
      4), 5) + UNSIGNED'( "11111"), 5));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_0_4_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_4_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    vec_rsc_0_6_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_6_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    g_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_0_0_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_0_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_0_we : OUT STD_LOGIC;
    result_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    result_rsc_0_1_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_1_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_1_we : OUT STD_LOGIC;
    result_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    result_rsc_0_2_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_2_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_2_we : OUT STD_LOGIC;
    result_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    result_rsc_0_3_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_3_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_3_we : OUT STD_LOGIC;
    result_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    result_rsc_0_4_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_4_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_4_we : OUT STD_LOGIC;
    result_rsc_0_4_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_4_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    result_rsc_0_5_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_5_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_5_we : OUT STD_LOGIC;
    result_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    result_rsc_0_6_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_6_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_6_we : OUT STD_LOGIC;
    result_rsc_0_6_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_6_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    result_rsc_0_7_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    result_rsc_0_7_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_7_we : OUT STD_LOGIC;
    result_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_3_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_rsc_0_4_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_4_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    twiddle_rsc_0_5_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_5_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    twiddle_rsc_0_6_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_6_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    twiddle_rsc_0_7_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_7_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC
  );
END peaceNTT;

ARCHITECTURE v18 OF peaceNTT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL xt_rsc_0_0_i_clken_d : STD_LOGIC;
  SIGNAL xt_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_clken_d : STD_LOGIC;
  SIGNAL xt_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_clken_d : STD_LOGIC;
  SIGNAL xt_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_clken_d : STD_LOGIC;
  SIGNAL xt_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_3_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_5_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_5_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_7_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_7_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL xt_rsc_0_0_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_0_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_we : STD_LOGIC;
  SIGNAL xt_rsc_0_0_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_1_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_we : STD_LOGIC;
  SIGNAL xt_rsc_0_1_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_2_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_we : STD_LOGIC;
  SIGNAL xt_rsc_0_2_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_3_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_we : STD_LOGIC;
  SIGNAL xt_rsc_0_3_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_4_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_we : STD_LOGIC;
  SIGNAL xt_rsc_0_4_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_5_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_we : STD_LOGIC;
  SIGNAL xt_rsc_0_5_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_6_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_we : STD_LOGIC;
  SIGNAL xt_rsc_0_6_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_clken : STD_LOGIC;
  SIGNAL xt_rsc_0_7_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_we : STD_LOGIC;
  SIGNAL xt_rsc_0_7_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_d_d_iff : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wadr_d_iff : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL xt_rsc_0_1_i_d_d_iff : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_we_d_iff : STD_LOGIC;
  SIGNAL xt_rsc_0_4_i_we_d_iff : STD_LOGIC;
  SIGNAL xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL xt_rsc_0_6_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_1_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_2_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_3_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_4_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_5_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_6_i_we_d_iff : STD_LOGIC;
  SIGNAL result_rsc_0_7_i_we_d_iff : STD_LOGIC;

  SIGNAL xt_rsc_0_0_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_1_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_2_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_3_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_4_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_5_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_6_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  SIGNAL xt_rsc_0_7_comp_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_comp_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_comp_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_comp_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_0_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_1_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_2_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_3_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_4_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_5_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_6_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_7_i_q : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_radr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_wadr : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_d_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_q_d_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_radr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_wadr_d : STD_LOGIC_VECTOR (6 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_4_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_6_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_1_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_1_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_1_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_2_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_3_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_3_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_3_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_3_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_4_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_4_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_5_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_5_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_5_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_5_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_6_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_6_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsc_0_7_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_7_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL result_rsc_0_7_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_7_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_3_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_4_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_4_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_5_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_5_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_6_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_6_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_7_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_7_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      g_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_5_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_7_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_5_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_7_lz : OUT STD_LOGIC;
      xt_rsc_0_0_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_2_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_4_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_6_i_clken_d : OUT STD_LOGIC;
      xt_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
      vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_0_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_0_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_1_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_1_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_2_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_2_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_3_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_3_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_4_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_4_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_5_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_5_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_6_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_6_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      result_rsc_0_7_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_7_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_4_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_4_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_5_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_5_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_6_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_6_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsc_0_7_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_7_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      xt_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      xt_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      xt_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      xt_rsc_0_1_i_d_d_pff : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      xt_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
      xt_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
      xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      xt_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      result_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      result_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_4_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_5_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_6_i_we_d_pff : OUT STD_LOGIC;
      result_rsc_0_7_i_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_2_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_3_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_4_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_4_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_5_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_5_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_6_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_6_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_7_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsc_0_7_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_4_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_4_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_5_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_5_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_6_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_6_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_7_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsc_0_7_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_0_i_d_d_pff : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_0_i_wadr_d_pff : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_xt_rsc_0_1_i_d_d_pff : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (8 DOWNTO
      0);

BEGIN
  xt_rsc_0_0_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_0_clken,
      d => xt_rsc_0_0_comp_d,
      q => xt_rsc_0_0_comp_q,
      radr => xt_rsc_0_0_comp_radr,
      wadr => xt_rsc_0_0_comp_wadr,
      we => xt_rsc_0_0_we
    );
  xt_rsc_0_0_comp_d <= xt_rsc_0_0_d;
  xt_rsc_0_0_q <= xt_rsc_0_0_comp_q;
  xt_rsc_0_0_comp_radr <= xt_rsc_0_0_radr;
  xt_rsc_0_0_comp_wadr <= xt_rsc_0_0_wadr;

  xt_rsc_0_1_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_1_clken,
      d => xt_rsc_0_1_comp_d,
      q => xt_rsc_0_1_comp_q,
      radr => xt_rsc_0_1_comp_radr,
      wadr => xt_rsc_0_1_comp_wadr,
      we => xt_rsc_0_1_we
    );
  xt_rsc_0_1_comp_d <= xt_rsc_0_1_d;
  xt_rsc_0_1_q <= xt_rsc_0_1_comp_q;
  xt_rsc_0_1_comp_radr <= xt_rsc_0_1_radr;
  xt_rsc_0_1_comp_wadr <= xt_rsc_0_1_wadr;

  xt_rsc_0_2_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_2_clken,
      d => xt_rsc_0_2_comp_d,
      q => xt_rsc_0_2_comp_q,
      radr => xt_rsc_0_2_comp_radr,
      wadr => xt_rsc_0_2_comp_wadr,
      we => xt_rsc_0_2_we
    );
  xt_rsc_0_2_comp_d <= xt_rsc_0_2_d;
  xt_rsc_0_2_q <= xt_rsc_0_2_comp_q;
  xt_rsc_0_2_comp_radr <= xt_rsc_0_2_radr;
  xt_rsc_0_2_comp_wadr <= xt_rsc_0_2_wadr;

  xt_rsc_0_3_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_3_clken,
      d => xt_rsc_0_3_comp_d,
      q => xt_rsc_0_3_comp_q,
      radr => xt_rsc_0_3_comp_radr,
      wadr => xt_rsc_0_3_comp_wadr,
      we => xt_rsc_0_3_we
    );
  xt_rsc_0_3_comp_d <= xt_rsc_0_3_d;
  xt_rsc_0_3_q <= xt_rsc_0_3_comp_q;
  xt_rsc_0_3_comp_radr <= xt_rsc_0_3_radr;
  xt_rsc_0_3_comp_wadr <= xt_rsc_0_3_wadr;

  xt_rsc_0_4_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_4_clken,
      d => xt_rsc_0_4_comp_d,
      q => xt_rsc_0_4_comp_q,
      radr => xt_rsc_0_4_comp_radr,
      wadr => xt_rsc_0_4_comp_wadr,
      we => xt_rsc_0_4_we
    );
  xt_rsc_0_4_comp_d <= xt_rsc_0_4_d;
  xt_rsc_0_4_q <= xt_rsc_0_4_comp_q;
  xt_rsc_0_4_comp_radr <= xt_rsc_0_4_radr;
  xt_rsc_0_4_comp_wadr <= xt_rsc_0_4_wadr;

  xt_rsc_0_5_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_5_clken,
      d => xt_rsc_0_5_comp_d,
      q => xt_rsc_0_5_comp_q,
      radr => xt_rsc_0_5_comp_radr,
      wadr => xt_rsc_0_5_comp_wadr,
      we => xt_rsc_0_5_we
    );
  xt_rsc_0_5_comp_d <= xt_rsc_0_5_d;
  xt_rsc_0_5_q <= xt_rsc_0_5_comp_q;
  xt_rsc_0_5_comp_radr <= xt_rsc_0_5_radr;
  xt_rsc_0_5_comp_wadr <= xt_rsc_0_5_wadr;

  xt_rsc_0_6_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_6_clken,
      d => xt_rsc_0_6_comp_d,
      q => xt_rsc_0_6_comp_q,
      radr => xt_rsc_0_6_comp_radr,
      wadr => xt_rsc_0_6_comp_wadr,
      we => xt_rsc_0_6_we
    );
  xt_rsc_0_6_comp_d <= xt_rsc_0_6_d;
  xt_rsc_0_6_q <= xt_rsc_0_6_comp_q;
  xt_rsc_0_6_comp_radr <= xt_rsc_0_6_radr;
  xt_rsc_0_6_comp_wadr <= xt_rsc_0_6_wadr;

  xt_rsc_0_7_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 7,
      data_width => 128,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_0_7_clken,
      d => xt_rsc_0_7_comp_d,
      q => xt_rsc_0_7_comp_q,
      radr => xt_rsc_0_7_comp_radr,
      wadr => xt_rsc_0_7_comp_wadr,
      we => xt_rsc_0_7_we
    );
  xt_rsc_0_7_comp_d <= xt_rsc_0_7_d;
  xt_rsc_0_7_q <= xt_rsc_0_7_comp_q;
  xt_rsc_0_7_comp_radr <= xt_rsc_0_7_radr;
  xt_rsc_0_7_comp_wadr <= xt_rsc_0_7_wadr;

  xt_rsc_0_0_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_7_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_0_clken,
      q => xt_rsc_0_0_i_q,
      radr => xt_rsc_0_0_i_radr,
      we => xt_rsc_0_0_we,
      d => xt_rsc_0_0_i_d,
      wadr => xt_rsc_0_0_i_wadr,
      clken_d => xt_rsc_0_0_i_clken_d,
      d_d => xt_rsc_0_0_i_d_d,
      q_d => xt_rsc_0_0_i_q_d_1,
      radr_d => xt_rsc_0_0_i_radr_d,
      wadr_d => xt_rsc_0_0_i_wadr_d,
      we_d => xt_rsc_0_0_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_0_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_0_i_q <= xt_rsc_0_0_q;
  xt_rsc_0_0_radr <= xt_rsc_0_0_i_radr;
  xt_rsc_0_0_d <= xt_rsc_0_0_i_d;
  xt_rsc_0_0_wadr <= xt_rsc_0_0_i_wadr;
  xt_rsc_0_0_i_d_d <= xt_rsc_0_0_i_d_d_iff;
  xt_rsc_0_0_i_q_d <= xt_rsc_0_0_i_q_d_1;
  xt_rsc_0_0_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_0_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_1_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_1_clken,
      q => xt_rsc_0_1_i_q,
      radr => xt_rsc_0_1_i_radr,
      we => xt_rsc_0_1_we,
      d => xt_rsc_0_1_i_d,
      wadr => xt_rsc_0_1_i_wadr,
      clken_d => xt_rsc_0_0_i_clken_d,
      d_d => xt_rsc_0_1_i_d_d,
      q_d => xt_rsc_0_1_i_q_d_1,
      radr_d => xt_rsc_0_1_i_radr_d,
      wadr_d => xt_rsc_0_1_i_wadr_d,
      we_d => xt_rsc_0_0_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_0_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_1_i_q <= xt_rsc_0_1_q;
  xt_rsc_0_1_radr <= xt_rsc_0_1_i_radr;
  xt_rsc_0_1_d <= xt_rsc_0_1_i_d;
  xt_rsc_0_1_wadr <= xt_rsc_0_1_i_wadr;
  xt_rsc_0_1_i_d_d <= xt_rsc_0_1_i_d_d_iff;
  xt_rsc_0_1_i_q_d <= xt_rsc_0_1_i_q_d_1;
  xt_rsc_0_1_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_1_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_2_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_9_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_2_clken,
      q => xt_rsc_0_2_i_q,
      radr => xt_rsc_0_2_i_radr,
      we => xt_rsc_0_2_we,
      d => xt_rsc_0_2_i_d,
      wadr => xt_rsc_0_2_i_wadr,
      clken_d => xt_rsc_0_2_i_clken_d,
      d_d => xt_rsc_0_2_i_d_d,
      q_d => xt_rsc_0_2_i_q_d_1,
      radr_d => xt_rsc_0_2_i_radr_d,
      wadr_d => xt_rsc_0_2_i_wadr_d,
      we_d => xt_rsc_0_2_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_2_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_2_i_q <= xt_rsc_0_2_q;
  xt_rsc_0_2_radr <= xt_rsc_0_2_i_radr;
  xt_rsc_0_2_d <= xt_rsc_0_2_i_d;
  xt_rsc_0_2_wadr <= xt_rsc_0_2_i_wadr;
  xt_rsc_0_2_i_d_d <= xt_rsc_0_0_i_d_d_iff;
  xt_rsc_0_2_i_q_d <= xt_rsc_0_2_i_q_d_1;
  xt_rsc_0_2_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_2_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_3_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_10_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_3_clken,
      q => xt_rsc_0_3_i_q,
      radr => xt_rsc_0_3_i_radr,
      we => xt_rsc_0_3_we,
      d => xt_rsc_0_3_i_d,
      wadr => xt_rsc_0_3_i_wadr,
      clken_d => xt_rsc_0_2_i_clken_d,
      d_d => xt_rsc_0_3_i_d_d,
      q_d => xt_rsc_0_3_i_q_d_1,
      radr_d => xt_rsc_0_3_i_radr_d,
      wadr_d => xt_rsc_0_3_i_wadr_d,
      we_d => xt_rsc_0_2_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_2_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_3_i_q <= xt_rsc_0_3_q;
  xt_rsc_0_3_radr <= xt_rsc_0_3_i_radr;
  xt_rsc_0_3_d <= xt_rsc_0_3_i_d;
  xt_rsc_0_3_wadr <= xt_rsc_0_3_i_wadr;
  xt_rsc_0_3_i_d_d <= xt_rsc_0_1_i_d_d_iff;
  xt_rsc_0_3_i_q_d <= xt_rsc_0_3_i_q_d_1;
  xt_rsc_0_3_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_3_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_4_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_11_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_4_clken,
      q => xt_rsc_0_4_i_q,
      radr => xt_rsc_0_4_i_radr,
      we => xt_rsc_0_4_we,
      d => xt_rsc_0_4_i_d,
      wadr => xt_rsc_0_4_i_wadr,
      clken_d => xt_rsc_0_4_i_clken_d,
      d_d => xt_rsc_0_4_i_d_d,
      q_d => xt_rsc_0_4_i_q_d_1,
      radr_d => xt_rsc_0_4_i_radr_d,
      wadr_d => xt_rsc_0_4_i_wadr_d,
      we_d => xt_rsc_0_4_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_4_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_4_i_q <= xt_rsc_0_4_q;
  xt_rsc_0_4_radr <= xt_rsc_0_4_i_radr;
  xt_rsc_0_4_d <= xt_rsc_0_4_i_d;
  xt_rsc_0_4_wadr <= xt_rsc_0_4_i_wadr;
  xt_rsc_0_4_i_d_d <= xt_rsc_0_0_i_d_d_iff;
  xt_rsc_0_4_i_q_d <= xt_rsc_0_4_i_q_d_1;
  xt_rsc_0_4_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_4_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_5_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_12_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_5_clken,
      q => xt_rsc_0_5_i_q,
      radr => xt_rsc_0_5_i_radr,
      we => xt_rsc_0_5_we,
      d => xt_rsc_0_5_i_d,
      wadr => xt_rsc_0_5_i_wadr,
      clken_d => xt_rsc_0_4_i_clken_d,
      d_d => xt_rsc_0_5_i_d_d,
      q_d => xt_rsc_0_5_i_q_d_1,
      radr_d => xt_rsc_0_5_i_radr_d,
      wadr_d => xt_rsc_0_5_i_wadr_d,
      we_d => xt_rsc_0_4_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_4_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_5_i_q <= xt_rsc_0_5_q;
  xt_rsc_0_5_radr <= xt_rsc_0_5_i_radr;
  xt_rsc_0_5_d <= xt_rsc_0_5_i_d;
  xt_rsc_0_5_wadr <= xt_rsc_0_5_i_wadr;
  xt_rsc_0_5_i_d_d <= xt_rsc_0_1_i_d_d_iff;
  xt_rsc_0_5_i_q_d <= xt_rsc_0_5_i_q_d_1;
  xt_rsc_0_5_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_5_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_6_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_13_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_6_clken,
      q => xt_rsc_0_6_i_q,
      radr => xt_rsc_0_6_i_radr,
      we => xt_rsc_0_6_we,
      d => xt_rsc_0_6_i_d,
      wadr => xt_rsc_0_6_i_wadr,
      clken_d => xt_rsc_0_6_i_clken_d,
      d_d => xt_rsc_0_6_i_d_d,
      q_d => xt_rsc_0_6_i_q_d_1,
      radr_d => xt_rsc_0_6_i_radr_d,
      wadr_d => xt_rsc_0_6_i_wadr_d,
      we_d => xt_rsc_0_6_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_6_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_6_i_q <= xt_rsc_0_6_q;
  xt_rsc_0_6_radr <= xt_rsc_0_6_i_radr;
  xt_rsc_0_6_d <= xt_rsc_0_6_i_d;
  xt_rsc_0_6_wadr <= xt_rsc_0_6_i_wadr;
  xt_rsc_0_6_i_d_d <= xt_rsc_0_0_i_d_d_iff;
  xt_rsc_0_6_i_q_d <= xt_rsc_0_6_i_q_d_1;
  xt_rsc_0_6_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_6_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  xt_rsc_0_7_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_14_7_128_128_128_128_1_gen
    PORT MAP(
      clken => xt_rsc_0_7_clken,
      q => xt_rsc_0_7_i_q,
      radr => xt_rsc_0_7_i_radr,
      we => xt_rsc_0_7_we,
      d => xt_rsc_0_7_i_d,
      wadr => xt_rsc_0_7_i_wadr,
      clken_d => xt_rsc_0_6_i_clken_d,
      d_d => xt_rsc_0_7_i_d_d,
      q_d => xt_rsc_0_7_i_q_d_1,
      radr_d => xt_rsc_0_7_i_radr_d,
      wadr_d => xt_rsc_0_7_i_wadr_d,
      we_d => xt_rsc_0_6_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsc_0_6_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  xt_rsc_0_7_i_q <= xt_rsc_0_7_q;
  xt_rsc_0_7_radr <= xt_rsc_0_7_i_radr;
  xt_rsc_0_7_d <= xt_rsc_0_7_i_d;
  xt_rsc_0_7_wadr <= xt_rsc_0_7_i_wadr;
  xt_rsc_0_7_i_d_d <= xt_rsc_0_1_i_d_d_iff;
  xt_rsc_0_7_i_q_d <= xt_rsc_0_7_i_q_d_1;
  xt_rsc_0_7_i_radr_d <= xt_rsc_0_0_i_radr_d_iff;
  xt_rsc_0_7_i_wadr_d <= xt_rsc_0_0_i_wadr_d_iff;

  vec_rsc_0_0_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_9_64_512_512_64_1_gen
    PORT MAP(
      q => vec_rsc_0_0_i_q,
      radr => vec_rsc_0_0_i_radr,
      q_d => vec_rsc_0_0_i_q_d_1,
      radr_d => vec_rsc_0_0_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  vec_rsc_0_0_i_q <= vec_rsc_0_0_q;
  vec_rsc_0_0_radr <= vec_rsc_0_0_i_radr;
  vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d_1;
  vec_rsc_0_0_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;

  vec_rsc_0_2_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_9_64_512_512_64_1_gen
    PORT MAP(
      q => vec_rsc_0_2_i_q,
      radr => vec_rsc_0_2_i_radr,
      q_d => vec_rsc_0_2_i_q_d_1,
      radr_d => vec_rsc_0_2_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  vec_rsc_0_2_i_q <= vec_rsc_0_2_q;
  vec_rsc_0_2_radr <= vec_rsc_0_2_i_radr;
  vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d_1;
  vec_rsc_0_2_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;

  vec_rsc_0_4_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_9_64_512_512_64_1_gen
    PORT MAP(
      q => vec_rsc_0_4_i_q,
      radr => vec_rsc_0_4_i_radr,
      q_d => vec_rsc_0_4_i_q_d_1,
      radr_d => vec_rsc_0_4_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  vec_rsc_0_4_i_q <= vec_rsc_0_4_q;
  vec_rsc_0_4_radr <= vec_rsc_0_4_i_radr;
  vec_rsc_0_4_i_q_d <= vec_rsc_0_4_i_q_d_1;
  vec_rsc_0_4_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;

  vec_rsc_0_6_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_9_64_512_512_64_1_gen
    PORT MAP(
      q => vec_rsc_0_6_i_q,
      radr => vec_rsc_0_6_i_radr,
      q_d => vec_rsc_0_6_i_q_d_1,
      radr_d => vec_rsc_0_6_i_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  vec_rsc_0_6_i_q <= vec_rsc_0_6_q;
  vec_rsc_0_6_radr <= vec_rsc_0_6_i_radr;
  vec_rsc_0_6_i_q_d <= vec_rsc_0_6_i_q_d_1;
  vec_rsc_0_6_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;

  result_rsc_0_0_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_23_9_64_512_512_64_1_gen
    PORT MAP(
      q => result_rsc_0_0_i_q,
      radr => result_rsc_0_0_i_radr,
      we => result_rsc_0_0_we,
      d => result_rsc_0_0_i_d,
      wadr => result_rsc_0_0_i_wadr,
      d_d => result_rsc_0_0_i_d_d_1,
      q_d => result_rsc_0_0_i_q_d_1,
      radr_d => result_rsc_0_0_i_radr_d,
      wadr_d => result_rsc_0_0_i_wadr_d_1,
      we_d => result_rsc_0_0_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_0_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  result_rsc_0_0_i_q <= result_rsc_0_0_q;
  result_rsc_0_0_radr <= result_rsc_0_0_i_radr;
  result_rsc_0_0_d <= result_rsc_0_0_i_d;
  result_rsc_0_0_wadr <= result_rsc_0_0_i_wadr;
  result_rsc_0_0_i_d_d_1 <= result_rsc_0_0_i_d_d;
  result_rsc_0_0_i_q_d <= result_rsc_0_0_i_q_d_1;
  result_rsc_0_0_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  result_rsc_0_0_i_wadr_d_1 <= result_rsc_0_0_i_wadr_d;

  result_rsc_0_1_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_24_9_64_512_512_64_1_gen
    PORT MAP(
      we => result_rsc_0_1_we,
      d => result_rsc_0_1_i_d,
      wadr => result_rsc_0_1_i_wadr,
      d_d => result_rsc_0_1_i_d_d_1,
      wadr_d => result_rsc_0_1_i_wadr_d_1,
      we_d => result_rsc_0_1_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_1_i_we_d_iff
    );
  result_rsc_0_1_d <= result_rsc_0_1_i_d;
  result_rsc_0_1_wadr <= result_rsc_0_1_i_wadr;
  result_rsc_0_1_i_d_d_1 <= result_rsc_0_1_i_d_d;
  result_rsc_0_1_i_wadr_d_1 <= result_rsc_0_1_i_wadr_d;

  result_rsc_0_2_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_25_9_64_512_512_64_1_gen
    PORT MAP(
      q => result_rsc_0_2_i_q,
      radr => result_rsc_0_2_i_radr,
      we => result_rsc_0_2_we,
      d => result_rsc_0_2_i_d,
      wadr => result_rsc_0_2_i_wadr,
      d_d => result_rsc_0_2_i_d_d_1,
      q_d => result_rsc_0_2_i_q_d_1,
      radr_d => result_rsc_0_2_i_radr_d,
      wadr_d => result_rsc_0_2_i_wadr_d_1,
      we_d => result_rsc_0_2_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_2_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  result_rsc_0_2_i_q <= result_rsc_0_2_q;
  result_rsc_0_2_radr <= result_rsc_0_2_i_radr;
  result_rsc_0_2_d <= result_rsc_0_2_i_d;
  result_rsc_0_2_wadr <= result_rsc_0_2_i_wadr;
  result_rsc_0_2_i_d_d_1 <= result_rsc_0_2_i_d_d;
  result_rsc_0_2_i_q_d <= result_rsc_0_2_i_q_d_1;
  result_rsc_0_2_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  result_rsc_0_2_i_wadr_d_1 <= result_rsc_0_2_i_wadr_d;

  result_rsc_0_3_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_26_9_64_512_512_64_1_gen
    PORT MAP(
      we => result_rsc_0_3_we,
      d => result_rsc_0_3_i_d,
      wadr => result_rsc_0_3_i_wadr,
      d_d => result_rsc_0_3_i_d_d_1,
      wadr_d => result_rsc_0_3_i_wadr_d_1,
      we_d => result_rsc_0_3_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_3_i_we_d_iff
    );
  result_rsc_0_3_d <= result_rsc_0_3_i_d;
  result_rsc_0_3_wadr <= result_rsc_0_3_i_wadr;
  result_rsc_0_3_i_d_d_1 <= result_rsc_0_3_i_d_d;
  result_rsc_0_3_i_wadr_d_1 <= result_rsc_0_3_i_wadr_d;

  result_rsc_0_4_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_27_9_64_512_512_64_1_gen
    PORT MAP(
      q => result_rsc_0_4_i_q,
      radr => result_rsc_0_4_i_radr,
      we => result_rsc_0_4_we,
      d => result_rsc_0_4_i_d,
      wadr => result_rsc_0_4_i_wadr,
      d_d => result_rsc_0_4_i_d_d_1,
      q_d => result_rsc_0_4_i_q_d_1,
      radr_d => result_rsc_0_4_i_radr_d,
      wadr_d => result_rsc_0_4_i_wadr_d_1,
      we_d => result_rsc_0_4_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_4_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  result_rsc_0_4_i_q <= result_rsc_0_4_q;
  result_rsc_0_4_radr <= result_rsc_0_4_i_radr;
  result_rsc_0_4_d <= result_rsc_0_4_i_d;
  result_rsc_0_4_wadr <= result_rsc_0_4_i_wadr;
  result_rsc_0_4_i_d_d_1 <= result_rsc_0_4_i_d_d;
  result_rsc_0_4_i_q_d <= result_rsc_0_4_i_q_d_1;
  result_rsc_0_4_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  result_rsc_0_4_i_wadr_d_1 <= result_rsc_0_4_i_wadr_d;

  result_rsc_0_5_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_28_9_64_512_512_64_1_gen
    PORT MAP(
      we => result_rsc_0_5_we,
      d => result_rsc_0_5_i_d,
      wadr => result_rsc_0_5_i_wadr,
      d_d => result_rsc_0_5_i_d_d_1,
      wadr_d => result_rsc_0_5_i_wadr_d_1,
      we_d => result_rsc_0_5_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_5_i_we_d_iff
    );
  result_rsc_0_5_d <= result_rsc_0_5_i_d;
  result_rsc_0_5_wadr <= result_rsc_0_5_i_wadr;
  result_rsc_0_5_i_d_d_1 <= result_rsc_0_5_i_d_d;
  result_rsc_0_5_i_wadr_d_1 <= result_rsc_0_5_i_wadr_d;

  result_rsc_0_6_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_29_9_64_512_512_64_1_gen
    PORT MAP(
      q => result_rsc_0_6_i_q,
      radr => result_rsc_0_6_i_radr,
      we => result_rsc_0_6_we,
      d => result_rsc_0_6_i_d,
      wadr => result_rsc_0_6_i_wadr,
      d_d => result_rsc_0_6_i_d_d_1,
      q_d => result_rsc_0_6_i_q_d_1,
      radr_d => result_rsc_0_6_i_radr_d,
      wadr_d => result_rsc_0_6_i_wadr_d_1,
      we_d => result_rsc_0_6_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_6_i_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  result_rsc_0_6_i_q <= result_rsc_0_6_q;
  result_rsc_0_6_radr <= result_rsc_0_6_i_radr;
  result_rsc_0_6_d <= result_rsc_0_6_i_d;
  result_rsc_0_6_wadr <= result_rsc_0_6_i_wadr;
  result_rsc_0_6_i_d_d_1 <= result_rsc_0_6_i_d_d;
  result_rsc_0_6_i_q_d <= result_rsc_0_6_i_q_d_1;
  result_rsc_0_6_i_radr_d <= vec_rsc_0_0_i_radr_d_iff;
  result_rsc_0_6_i_wadr_d_1 <= result_rsc_0_6_i_wadr_d;

  result_rsc_0_7_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_wport_30_9_64_512_512_64_1_gen
    PORT MAP(
      we => result_rsc_0_7_we,
      d => result_rsc_0_7_i_d,
      wadr => result_rsc_0_7_i_wadr,
      d_d => result_rsc_0_7_i_d_d_1,
      wadr_d => result_rsc_0_7_i_wadr_d_1,
      we_d => result_rsc_0_7_i_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsc_0_7_i_we_d_iff
    );
  result_rsc_0_7_d <= result_rsc_0_7_i_d;
  result_rsc_0_7_wadr <= result_rsc_0_7_i_wadr;
  result_rsc_0_7_i_d_d_1 <= result_rsc_0_7_i_d_d;
  result_rsc_0_7_i_wadr_d_1 <= result_rsc_0_7_i_wadr_d;

  twiddle_rsc_0_0_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_31_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_0_i_q,
      radr => twiddle_rsc_0_0_i_radr,
      q_d => twiddle_rsc_0_0_i_q_d_1,
      radr_d => twiddle_rsc_0_0_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_0_i_q <= twiddle_rsc_0_0_q;
  twiddle_rsc_0_0_radr <= twiddle_rsc_0_0_i_radr;
  twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d_1;
  twiddle_rsc_0_0_i_radr_d_1 <= twiddle_rsc_0_0_i_radr_d;

  twiddle_rsc_0_1_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_32_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_1_i_q,
      radr => twiddle_rsc_0_1_i_radr,
      q_d => twiddle_rsc_0_1_i_q_d_1,
      radr_d => twiddle_rsc_0_1_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_1_i_q <= twiddle_rsc_0_1_q;
  twiddle_rsc_0_1_radr <= twiddle_rsc_0_1_i_radr;
  twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d_1;
  twiddle_rsc_0_1_i_radr_d_1 <= twiddle_rsc_0_1_i_radr_d;

  twiddle_rsc_0_2_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_33_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_2_i_q,
      radr => twiddle_rsc_0_2_i_radr,
      q_d => twiddle_rsc_0_2_i_q_d_1,
      radr_d => twiddle_rsc_0_2_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_2_i_q <= twiddle_rsc_0_2_q;
  twiddle_rsc_0_2_radr <= twiddle_rsc_0_2_i_radr;
  twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d_1;
  twiddle_rsc_0_2_i_radr_d_1 <= twiddle_rsc_0_2_i_radr_d;

  twiddle_rsc_0_3_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_34_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_3_i_q,
      radr => twiddle_rsc_0_3_i_radr,
      q_d => twiddle_rsc_0_3_i_q_d_1,
      radr_d => twiddle_rsc_0_3_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_3_i_q <= twiddle_rsc_0_3_q;
  twiddle_rsc_0_3_radr <= twiddle_rsc_0_3_i_radr;
  twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d_1;
  twiddle_rsc_0_3_i_radr_d_1 <= twiddle_rsc_0_3_i_radr_d;

  twiddle_rsc_0_4_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_35_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_4_i_q,
      radr => twiddle_rsc_0_4_i_radr,
      q_d => twiddle_rsc_0_4_i_q_d_1,
      radr_d => twiddle_rsc_0_4_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_4_i_q <= twiddle_rsc_0_4_q;
  twiddle_rsc_0_4_radr <= twiddle_rsc_0_4_i_radr;
  twiddle_rsc_0_4_i_q_d <= twiddle_rsc_0_4_i_q_d_1;
  twiddle_rsc_0_4_i_radr_d_1 <= twiddle_rsc_0_4_i_radr_d;

  twiddle_rsc_0_5_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_36_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_5_i_q,
      radr => twiddle_rsc_0_5_i_radr,
      q_d => twiddle_rsc_0_5_i_q_d_1,
      radr_d => twiddle_rsc_0_5_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_5_i_q <= twiddle_rsc_0_5_q;
  twiddle_rsc_0_5_radr <= twiddle_rsc_0_5_i_radr;
  twiddle_rsc_0_5_i_q_d <= twiddle_rsc_0_5_i_q_d_1;
  twiddle_rsc_0_5_i_radr_d_1 <= twiddle_rsc_0_5_i_radr_d;

  twiddle_rsc_0_6_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_37_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_6_i_q,
      radr => twiddle_rsc_0_6_i_radr,
      q_d => twiddle_rsc_0_6_i_q_d_1,
      radr_d => twiddle_rsc_0_6_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_6_i_q <= twiddle_rsc_0_6_q;
  twiddle_rsc_0_6_radr <= twiddle_rsc_0_6_i_radr;
  twiddle_rsc_0_6_i_q_d <= twiddle_rsc_0_6_i_q_d_1;
  twiddle_rsc_0_6_i_radr_d_1 <= twiddle_rsc_0_6_i_radr_d;

  twiddle_rsc_0_7_i : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_38_9_64_512_512_64_1_gen
    PORT MAP(
      q => twiddle_rsc_0_7_i_q,
      radr => twiddle_rsc_0_7_i_radr,
      q_d => twiddle_rsc_0_7_i_q_d_1,
      radr_d => twiddle_rsc_0_7_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsc_0_7_i_q <= twiddle_rsc_0_7_q;
  twiddle_rsc_0_7_radr <= twiddle_rsc_0_7_i_radr;
  twiddle_rsc_0_7_i_q_d <= twiddle_rsc_0_7_i_q_d_1;
  twiddle_rsc_0_7_i_radr_d_1 <= twiddle_rsc_0_7_i_radr_d;

  peaceNTT_core_inst : peaceNTT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_2_lz => vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_4_lz => vec_rsc_triosy_0_4_lz,
      vec_rsc_triosy_0_6_lz => vec_rsc_triosy_0_6_lz,
      p_rsc_dat => peaceNTT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      g_rsc_triosy_lz => g_rsc_triosy_lz,
      result_rsc_triosy_0_0_lz => result_rsc_triosy_0_0_lz,
      result_rsc_triosy_0_1_lz => result_rsc_triosy_0_1_lz,
      result_rsc_triosy_0_2_lz => result_rsc_triosy_0_2_lz,
      result_rsc_triosy_0_3_lz => result_rsc_triosy_0_3_lz,
      result_rsc_triosy_0_4_lz => result_rsc_triosy_0_4_lz,
      result_rsc_triosy_0_5_lz => result_rsc_triosy_0_5_lz,
      result_rsc_triosy_0_6_lz => result_rsc_triosy_0_6_lz,
      result_rsc_triosy_0_7_lz => result_rsc_triosy_0_7_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz => twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz => twiddle_rsc_triosy_0_3_lz,
      twiddle_rsc_triosy_0_4_lz => twiddle_rsc_triosy_0_4_lz,
      twiddle_rsc_triosy_0_5_lz => twiddle_rsc_triosy_0_5_lz,
      twiddle_rsc_triosy_0_6_lz => twiddle_rsc_triosy_0_6_lz,
      twiddle_rsc_triosy_0_7_lz => twiddle_rsc_triosy_0_7_lz,
      xt_rsc_0_0_i_clken_d => xt_rsc_0_0_i_clken_d,
      xt_rsc_0_0_i_q_d => peaceNTT_core_inst_xt_rsc_0_0_i_q_d,
      xt_rsc_0_1_i_q_d => peaceNTT_core_inst_xt_rsc_0_1_i_q_d,
      xt_rsc_0_2_i_clken_d => xt_rsc_0_2_i_clken_d,
      xt_rsc_0_2_i_q_d => peaceNTT_core_inst_xt_rsc_0_2_i_q_d,
      xt_rsc_0_3_i_q_d => peaceNTT_core_inst_xt_rsc_0_3_i_q_d,
      xt_rsc_0_4_i_clken_d => xt_rsc_0_4_i_clken_d,
      xt_rsc_0_4_i_q_d => peaceNTT_core_inst_xt_rsc_0_4_i_q_d,
      xt_rsc_0_5_i_q_d => peaceNTT_core_inst_xt_rsc_0_5_i_q_d,
      xt_rsc_0_6_i_clken_d => xt_rsc_0_6_i_clken_d,
      xt_rsc_0_6_i_q_d => peaceNTT_core_inst_xt_rsc_0_6_i_q_d,
      xt_rsc_0_7_i_q_d => peaceNTT_core_inst_xt_rsc_0_7_i_q_d,
      vec_rsc_0_0_i_q_d => peaceNTT_core_inst_vec_rsc_0_0_i_q_d,
      vec_rsc_0_2_i_q_d => peaceNTT_core_inst_vec_rsc_0_2_i_q_d,
      vec_rsc_0_4_i_q_d => peaceNTT_core_inst_vec_rsc_0_4_i_q_d,
      vec_rsc_0_6_i_q_d => peaceNTT_core_inst_vec_rsc_0_6_i_q_d,
      result_rsc_0_0_i_d_d => peaceNTT_core_inst_result_rsc_0_0_i_d_d,
      result_rsc_0_0_i_q_d => peaceNTT_core_inst_result_rsc_0_0_i_q_d,
      result_rsc_0_0_i_wadr_d => peaceNTT_core_inst_result_rsc_0_0_i_wadr_d,
      result_rsc_0_1_i_d_d => peaceNTT_core_inst_result_rsc_0_1_i_d_d,
      result_rsc_0_1_i_wadr_d => peaceNTT_core_inst_result_rsc_0_1_i_wadr_d,
      result_rsc_0_2_i_d_d => peaceNTT_core_inst_result_rsc_0_2_i_d_d,
      result_rsc_0_2_i_q_d => peaceNTT_core_inst_result_rsc_0_2_i_q_d,
      result_rsc_0_2_i_wadr_d => peaceNTT_core_inst_result_rsc_0_2_i_wadr_d,
      result_rsc_0_3_i_d_d => peaceNTT_core_inst_result_rsc_0_3_i_d_d,
      result_rsc_0_3_i_wadr_d => peaceNTT_core_inst_result_rsc_0_3_i_wadr_d,
      result_rsc_0_4_i_d_d => peaceNTT_core_inst_result_rsc_0_4_i_d_d,
      result_rsc_0_4_i_q_d => peaceNTT_core_inst_result_rsc_0_4_i_q_d,
      result_rsc_0_4_i_wadr_d => peaceNTT_core_inst_result_rsc_0_4_i_wadr_d,
      result_rsc_0_5_i_d_d => peaceNTT_core_inst_result_rsc_0_5_i_d_d,
      result_rsc_0_5_i_wadr_d => peaceNTT_core_inst_result_rsc_0_5_i_wadr_d,
      result_rsc_0_6_i_d_d => peaceNTT_core_inst_result_rsc_0_6_i_d_d,
      result_rsc_0_6_i_q_d => peaceNTT_core_inst_result_rsc_0_6_i_q_d,
      result_rsc_0_6_i_wadr_d => peaceNTT_core_inst_result_rsc_0_6_i_wadr_d,
      result_rsc_0_7_i_d_d => peaceNTT_core_inst_result_rsc_0_7_i_d_d,
      result_rsc_0_7_i_wadr_d => peaceNTT_core_inst_result_rsc_0_7_i_wadr_d,
      twiddle_rsc_0_0_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_0_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_0_i_radr_d,
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_1_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_1_i_radr_d,
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_2_i_q_d,
      twiddle_rsc_0_2_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_2_i_radr_d,
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_3_i_q_d,
      twiddle_rsc_0_3_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_3_i_radr_d,
      twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_3_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_4_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_4_i_q_d,
      twiddle_rsc_0_4_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_4_i_radr_d,
      twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_5_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_5_i_q_d,
      twiddle_rsc_0_5_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_5_i_radr_d,
      twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_5_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_6_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_6_i_q_d,
      twiddle_rsc_0_6_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_6_i_radr_d,
      twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_6_i_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_7_i_q_d => peaceNTT_core_inst_twiddle_rsc_0_7_i_q_d,
      twiddle_rsc_0_7_i_radr_d => peaceNTT_core_inst_twiddle_rsc_0_7_i_radr_d,
      twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_7_i_readA_r_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_d_d_pff => peaceNTT_core_inst_xt_rsc_0_0_i_d_d_pff,
      xt_rsc_0_0_i_radr_d_pff => peaceNTT_core_inst_xt_rsc_0_0_i_radr_d_pff,
      xt_rsc_0_0_i_wadr_d_pff => peaceNTT_core_inst_xt_rsc_0_0_i_wadr_d_pff,
      xt_rsc_0_0_i_we_d_pff => xt_rsc_0_0_i_we_d_iff,
      xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff => xt_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      xt_rsc_0_1_i_d_d_pff => peaceNTT_core_inst_xt_rsc_0_1_i_d_d_pff,
      xt_rsc_0_2_i_we_d_pff => xt_rsc_0_2_i_we_d_iff,
      xt_rsc_0_4_i_we_d_pff => xt_rsc_0_4_i_we_d_iff,
      xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_pff => xt_rsc_0_4_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      xt_rsc_0_6_i_we_d_pff => xt_rsc_0_6_i_we_d_iff,
      vec_rsc_0_0_i_radr_d_pff => peaceNTT_core_inst_vec_rsc_0_0_i_radr_d_pff,
      vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff => vec_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      result_rsc_0_0_i_we_d_pff => result_rsc_0_0_i_we_d_iff,
      result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff => result_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      result_rsc_0_1_i_we_d_pff => result_rsc_0_1_i_we_d_iff,
      result_rsc_0_2_i_we_d_pff => result_rsc_0_2_i_we_d_iff,
      result_rsc_0_3_i_we_d_pff => result_rsc_0_3_i_we_d_iff,
      result_rsc_0_4_i_we_d_pff => result_rsc_0_4_i_we_d_iff,
      result_rsc_0_5_i_we_d_pff => result_rsc_0_5_i_we_d_iff,
      result_rsc_0_6_i_we_d_pff => result_rsc_0_6_i_we_d_iff,
      result_rsc_0_7_i_we_d_pff => result_rsc_0_7_i_we_d_iff
    );
  peaceNTT_core_inst_p_rsc_dat <= p_rsc_dat;
  peaceNTT_core_inst_xt_rsc_0_0_i_q_d <= xt_rsc_0_0_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_1_i_q_d <= xt_rsc_0_1_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_2_i_q_d <= xt_rsc_0_2_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_3_i_q_d <= xt_rsc_0_3_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_4_i_q_d <= xt_rsc_0_4_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_5_i_q_d <= xt_rsc_0_5_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_6_i_q_d <= xt_rsc_0_6_i_q_d;
  peaceNTT_core_inst_xt_rsc_0_7_i_q_d <= xt_rsc_0_7_i_q_d;
  peaceNTT_core_inst_vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d;
  peaceNTT_core_inst_vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d;
  peaceNTT_core_inst_vec_rsc_0_4_i_q_d <= vec_rsc_0_4_i_q_d;
  peaceNTT_core_inst_vec_rsc_0_6_i_q_d <= vec_rsc_0_6_i_q_d;
  result_rsc_0_0_i_d_d <= peaceNTT_core_inst_result_rsc_0_0_i_d_d;
  peaceNTT_core_inst_result_rsc_0_0_i_q_d <= result_rsc_0_0_i_q_d;
  result_rsc_0_0_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_0_i_wadr_d;
  result_rsc_0_1_i_d_d <= peaceNTT_core_inst_result_rsc_0_1_i_d_d;
  result_rsc_0_1_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_1_i_wadr_d;
  result_rsc_0_2_i_d_d <= peaceNTT_core_inst_result_rsc_0_2_i_d_d;
  peaceNTT_core_inst_result_rsc_0_2_i_q_d <= result_rsc_0_2_i_q_d;
  result_rsc_0_2_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_2_i_wadr_d;
  result_rsc_0_3_i_d_d <= peaceNTT_core_inst_result_rsc_0_3_i_d_d;
  result_rsc_0_3_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_3_i_wadr_d;
  result_rsc_0_4_i_d_d <= peaceNTT_core_inst_result_rsc_0_4_i_d_d;
  peaceNTT_core_inst_result_rsc_0_4_i_q_d <= result_rsc_0_4_i_q_d;
  result_rsc_0_4_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_4_i_wadr_d;
  result_rsc_0_5_i_d_d <= peaceNTT_core_inst_result_rsc_0_5_i_d_d;
  result_rsc_0_5_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_5_i_wadr_d;
  result_rsc_0_6_i_d_d <= peaceNTT_core_inst_result_rsc_0_6_i_d_d;
  peaceNTT_core_inst_result_rsc_0_6_i_q_d <= result_rsc_0_6_i_q_d;
  result_rsc_0_6_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_6_i_wadr_d;
  result_rsc_0_7_i_d_d <= peaceNTT_core_inst_result_rsc_0_7_i_d_d;
  result_rsc_0_7_i_wadr_d <= peaceNTT_core_inst_result_rsc_0_7_i_wadr_d;
  peaceNTT_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  twiddle_rsc_0_0_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_0_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  twiddle_rsc_0_1_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_1_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d;
  twiddle_rsc_0_2_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_2_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d;
  twiddle_rsc_0_3_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_3_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_4_i_q_d <= twiddle_rsc_0_4_i_q_d;
  twiddle_rsc_0_4_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_4_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_5_i_q_d <= twiddle_rsc_0_5_i_q_d;
  twiddle_rsc_0_5_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_5_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_6_i_q_d <= twiddle_rsc_0_6_i_q_d;
  twiddle_rsc_0_6_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_6_i_radr_d;
  peaceNTT_core_inst_twiddle_rsc_0_7_i_q_d <= twiddle_rsc_0_7_i_q_d;
  twiddle_rsc_0_7_i_radr_d <= peaceNTT_core_inst_twiddle_rsc_0_7_i_radr_d;
  xt_rsc_0_0_i_d_d_iff <= peaceNTT_core_inst_xt_rsc_0_0_i_d_d_pff;
  xt_rsc_0_0_i_radr_d_iff <= peaceNTT_core_inst_xt_rsc_0_0_i_radr_d_pff;
  xt_rsc_0_0_i_wadr_d_iff <= peaceNTT_core_inst_xt_rsc_0_0_i_wadr_d_pff;
  xt_rsc_0_1_i_d_d_iff <= peaceNTT_core_inst_xt_rsc_0_1_i_d_d_pff;
  vec_rsc_0_0_i_radr_d_iff <= peaceNTT_core_inst_vec_rsc_0_0_i_radr_d_pff;

END v18;



