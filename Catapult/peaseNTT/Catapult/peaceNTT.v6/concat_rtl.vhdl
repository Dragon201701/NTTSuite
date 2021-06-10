
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
--  Generated date: Thu Jun 10 12:10:18 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen;

ARCHITECTURE v6 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen IS
  PORT(
    clken : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    clken_d : IN STD_LOGIC;
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen;

ARCHITECTURE v6 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we_d : IN STD_LOGIC;
    writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen;

ARCHITECTURE v6 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adrb_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    qb_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    readB_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen;

ARCHITECTURE v6 OF peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qb_d <= qb;
  adrb <= (adrb_d);
END v6;

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
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    main_C_7_tr0 : IN STD_LOGIC;
    MODEXP_WHILE_C_24_tr0 : IN STD_LOGIC;
    TWIDDLE_LOOP_C_24_tr0 : IN STD_LOGIC;
    COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
    COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_0_tr0 : IN STD_LOGIC
  );
END peaceNTT_core_core_fsm;

ARCHITECTURE v6 OF peaceNTT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for peaceNTT_core_core_fsm_1
  TYPE peaceNTT_core_core_fsm_1_ST IS (main_C_0, main_C_1, main_C_2, main_C_3, main_C_4,
      main_C_5, main_C_6, main_C_7, MODEXP_WHILE_C_0, MODEXP_WHILE_C_1, MODEXP_WHILE_C_2,
      MODEXP_WHILE_C_3, MODEXP_WHILE_C_4, MODEXP_WHILE_C_5, MODEXP_WHILE_C_6, MODEXP_WHILE_C_7,
      MODEXP_WHILE_C_8, MODEXP_WHILE_C_9, MODEXP_WHILE_C_10, MODEXP_WHILE_C_11, MODEXP_WHILE_C_12,
      MODEXP_WHILE_C_13, MODEXP_WHILE_C_14, MODEXP_WHILE_C_15, MODEXP_WHILE_C_16,
      MODEXP_WHILE_C_17, MODEXP_WHILE_C_18, MODEXP_WHILE_C_19, MODEXP_WHILE_C_20,
      MODEXP_WHILE_C_21, MODEXP_WHILE_C_22, MODEXP_WHILE_C_23, MODEXP_WHILE_C_24,
      TWIDDLE_LOOP_C_0, TWIDDLE_LOOP_C_1, TWIDDLE_LOOP_C_2, TWIDDLE_LOOP_C_3, TWIDDLE_LOOP_C_4,
      TWIDDLE_LOOP_C_5, TWIDDLE_LOOP_C_6, TWIDDLE_LOOP_C_7, TWIDDLE_LOOP_C_8, TWIDDLE_LOOP_C_9,
      TWIDDLE_LOOP_C_10, TWIDDLE_LOOP_C_11, TWIDDLE_LOOP_C_12, TWIDDLE_LOOP_C_13,
      TWIDDLE_LOOP_C_14, TWIDDLE_LOOP_C_15, TWIDDLE_LOOP_C_16, TWIDDLE_LOOP_C_17,
      TWIDDLE_LOOP_C_18, TWIDDLE_LOOP_C_19, TWIDDLE_LOOP_C_20, TWIDDLE_LOOP_C_21,
      TWIDDLE_LOOP_C_22, TWIDDLE_LOOP_C_23, TWIDDLE_LOOP_C_24, COPY_LOOP_C_0, COPY_LOOP_C_1,
      COPY_LOOP_C_2, COMP_LOOP_C_0, COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_C_3,
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
      COMP_LOOP_C_74, COMP_LOOP_C_75, COMP_LOOP_C_76, COPY_LOOP_1_C_0, COPY_LOOP_1_C_1,
      COPY_LOOP_1_C_2, STAGE_LOOP_C_0, main_C_8);

  SIGNAL state_var : peaceNTT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : peaceNTT_core_core_fsm_1_ST;

BEGIN
  peaceNTT_core_core_fsm_1 : PROCESS (main_C_7_tr0, MODEXP_WHILE_C_24_tr0, TWIDDLE_LOOP_C_24_tr0,
      COPY_LOOP_C_2_tr0, COMP_LOOP_C_76_tr0, COPY_LOOP_1_C_2_tr0, STAGE_LOOP_C_0_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= main_C_3;
      WHEN main_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        state_var_NS <= main_C_4;
      WHEN main_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= main_C_5;
      WHEN main_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= main_C_6;
      WHEN main_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= main_C_7;
      WHEN main_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        IF ( main_C_7_tr0 = '1' ) THEN
          state_var_NS <= TWIDDLE_LOOP_C_0;
        ELSE
          state_var_NS <= MODEXP_WHILE_C_0;
        END IF;
      WHEN MODEXP_WHILE_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= MODEXP_WHILE_C_1;
      WHEN MODEXP_WHILE_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= MODEXP_WHILE_C_2;
      WHEN MODEXP_WHILE_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= MODEXP_WHILE_C_3;
      WHEN MODEXP_WHILE_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= MODEXP_WHILE_C_4;
      WHEN MODEXP_WHILE_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= MODEXP_WHILE_C_5;
      WHEN MODEXP_WHILE_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= MODEXP_WHILE_C_6;
      WHEN MODEXP_WHILE_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= MODEXP_WHILE_C_7;
      WHEN MODEXP_WHILE_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= MODEXP_WHILE_C_8;
      WHEN MODEXP_WHILE_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= MODEXP_WHILE_C_9;
      WHEN MODEXP_WHILE_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= MODEXP_WHILE_C_10;
      WHEN MODEXP_WHILE_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= MODEXP_WHILE_C_11;
      WHEN MODEXP_WHILE_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= MODEXP_WHILE_C_12;
      WHEN MODEXP_WHILE_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= MODEXP_WHILE_C_13;
      WHEN MODEXP_WHILE_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= MODEXP_WHILE_C_14;
      WHEN MODEXP_WHILE_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= MODEXP_WHILE_C_15;
      WHEN MODEXP_WHILE_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= MODEXP_WHILE_C_16;
      WHEN MODEXP_WHILE_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= MODEXP_WHILE_C_17;
      WHEN MODEXP_WHILE_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= MODEXP_WHILE_C_18;
      WHEN MODEXP_WHILE_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= MODEXP_WHILE_C_19;
      WHEN MODEXP_WHILE_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= MODEXP_WHILE_C_20;
      WHEN MODEXP_WHILE_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= MODEXP_WHILE_C_21;
      WHEN MODEXP_WHILE_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= MODEXP_WHILE_C_22;
      WHEN MODEXP_WHILE_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= MODEXP_WHILE_C_23;
      WHEN MODEXP_WHILE_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= MODEXP_WHILE_C_24;
      WHEN MODEXP_WHILE_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        IF ( MODEXP_WHILE_C_24_tr0 = '1' ) THEN
          state_var_NS <= TWIDDLE_LOOP_C_0;
        ELSE
          state_var_NS <= MODEXP_WHILE_C_0;
        END IF;
      WHEN TWIDDLE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= TWIDDLE_LOOP_C_1;
      WHEN TWIDDLE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= TWIDDLE_LOOP_C_2;
      WHEN TWIDDLE_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= TWIDDLE_LOOP_C_3;
      WHEN TWIDDLE_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= TWIDDLE_LOOP_C_4;
      WHEN TWIDDLE_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= TWIDDLE_LOOP_C_5;
      WHEN TWIDDLE_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= TWIDDLE_LOOP_C_6;
      WHEN TWIDDLE_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= TWIDDLE_LOOP_C_7;
      WHEN TWIDDLE_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= TWIDDLE_LOOP_C_8;
      WHEN TWIDDLE_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= TWIDDLE_LOOP_C_9;
      WHEN TWIDDLE_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= TWIDDLE_LOOP_C_10;
      WHEN TWIDDLE_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= TWIDDLE_LOOP_C_11;
      WHEN TWIDDLE_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= TWIDDLE_LOOP_C_12;
      WHEN TWIDDLE_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= TWIDDLE_LOOP_C_13;
      WHEN TWIDDLE_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= TWIDDLE_LOOP_C_14;
      WHEN TWIDDLE_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= TWIDDLE_LOOP_C_15;
      WHEN TWIDDLE_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= TWIDDLE_LOOP_C_16;
      WHEN TWIDDLE_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= TWIDDLE_LOOP_C_17;
      WHEN TWIDDLE_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= TWIDDLE_LOOP_C_18;
      WHEN TWIDDLE_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= TWIDDLE_LOOP_C_19;
      WHEN TWIDDLE_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= TWIDDLE_LOOP_C_20;
      WHEN TWIDDLE_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= TWIDDLE_LOOP_C_21;
      WHEN TWIDDLE_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= TWIDDLE_LOOP_C_22;
      WHEN TWIDDLE_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= TWIDDLE_LOOP_C_23;
      WHEN TWIDDLE_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= TWIDDLE_LOOP_C_24;
      WHEN TWIDDLE_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        IF ( TWIDDLE_LOOP_C_24_tr0 = '1' ) THEN
          state_var_NS <= COPY_LOOP_C_0;
        ELSE
          state_var_NS <= TWIDDLE_LOOP_C_0;
        END IF;
      WHEN COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= COPY_LOOP_C_1;
      WHEN COPY_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= COPY_LOOP_C_2;
      WHEN COPY_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        IF ( COPY_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= COMP_LOOP_C_0;
        ELSE
          state_var_NS <= COPY_LOOP_C_0;
        END IF;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        IF ( COMP_LOOP_C_76_tr0 = '1' ) THEN
          state_var_NS <= COPY_LOOP_1_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN COPY_LOOP_1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COPY_LOOP_1_C_1;
      WHEN COPY_LOOP_1_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COPY_LOOP_1_C_2;
      WHEN COPY_LOOP_1_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        IF ( COPY_LOOP_1_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_0;
        ELSE
          state_var_NS <= COPY_LOOP_1_C_0;
        END IF;
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        IF ( STAGE_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_8;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN main_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
        state_var_NS <= main_C_1;
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

END v6;

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
    twiddle_rsc_cgo_iro : IN STD_LOGIC;
    twiddle_rsci_clken_d : OUT STD_LOGIC;
    xt_rsc_cgo_iro : IN STD_LOGIC;
    xt_rsci_clken_d : OUT STD_LOGIC;
    twiddle_rsc_cgo : IN STD_LOGIC;
    xt_rsc_cgo : IN STD_LOGIC
  );
END peaceNTT_core_wait_dp;

ARCHITECTURE v6 OF peaceNTT_core_wait_dp IS
  -- Default Constants

BEGIN
  twiddle_rsci_clken_d <= twiddle_rsc_cgo OR twiddle_rsc_cgo_iro;
  xt_rsci_clken_d <= xt_rsc_cgo OR xt_rsc_cgo_iro;
END v6;

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
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    g_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsci_qb_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_readB_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    result_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_clken_d : OUT STD_LOGIC;
    twiddle_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    xt_rsci_clken_d : OUT STD_LOGIC;
    xt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsci_adrb_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsci_we_d_pff : OUT STD_LOGIC;
    twiddle_rsci_we_d_pff : OUT STD_LOGIC;
    xt_rsci_we_d_pff : OUT STD_LOGIC
  );
END peaceNTT_core;

ARCHITECTURE v6 OF peaceNTT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL g_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL not_tmp_8 : STD_LOGIC;
  SIGNAL or_tmp_12 : STD_LOGIC;
  SIGNAL mux_tmp_17 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL or_dcpl_9 : STD_LOGIC;
  SIGNAL or_dcpl_10 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL or_tmp_34 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL or_tmp_40 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL mux_tmp_48 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL mux_tmp_53 : STD_LOGIC;
  SIGNAL or_tmp_45 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL or_dcpl_22 : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL or_tmp_72 : STD_LOGIC;
  SIGNAL or_tmp_73 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL exit_MODEXP_WHILE_sva : STD_LOGIC;
  SIGNAL TWIDDLE_LOOP_slc_TWIDDLE_LOOP_acc_3_itm : STD_LOGIC;
  SIGNAL COMP_LOOP_r_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL or_29_cse : STD_LOGIC;
  SIGNAL reg_twiddle_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL or_41_cse : STD_LOGIC;
  SIGNAL or_59_cse : STD_LOGIC;
  SIGNAL and_108_cse : STD_LOGIC;
  SIGNAL modulo_dev_1_mux_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_27_cse : STD_LOGIC;
  SIGNAL or_19_cse : STD_LOGIC;
  SIGNAL or_15_cse : STD_LOGIC;
  SIGNAL nor_34_cse : STD_LOGIC;
  SIGNAL or_14_cse : STD_LOGIC;
  SIGNAL mux_21_cse : STD_LOGIC;
  SIGNAL mux_31_cse : STD_LOGIC;
  SIGNAL mux_33_cse : STD_LOGIC;
  SIGNAL mux_32_cse : STD_LOGIC;
  SIGNAL and_27_rmff : STD_LOGIC;
  SIGNAL and_37_rmff : STD_LOGIC;
  SIGNAL TWIDDLE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL witer_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_lshift_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_226 : STD_LOGIC;
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_acc_psp_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL modExp_dev_base_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_exp_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_result_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_asn_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_asn_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_mul_28_itm : STD_LOGIC_VECTOR (61 DOWNTO 0);
  SIGNAL operator_66_true_mul_27_itm : STD_LOGIC_VECTOR (59 DOWNTO 0);
  SIGNAL operator_66_true_mul_26_itm : STD_LOGIC_VECTOR (57 DOWNTO 0);
  SIGNAL operator_66_true_mul_25_itm : STD_LOGIC_VECTOR (55 DOWNTO 0);
  SIGNAL operator_66_true_mul_24_itm : STD_LOGIC_VECTOR (53 DOWNTO 0);
  SIGNAL operator_66_true_mul_23_itm : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL operator_66_true_mul_22_itm : STD_LOGIC_VECTOR (49 DOWNTO 0);
  SIGNAL operator_66_true_mul_21_itm : STD_LOGIC_VECTOR (47 DOWNTO 0);
  SIGNAL operator_66_true_mul_20_itm : STD_LOGIC_VECTOR (45 DOWNTO 0);
  SIGNAL operator_66_true_mul_19_itm : STD_LOGIC_VECTOR (43 DOWNTO 0);
  SIGNAL operator_66_true_mul_18_itm : STD_LOGIC_VECTOR (41 DOWNTO 0);
  SIGNAL operator_66_true_mul_17_itm : STD_LOGIC_VECTOR (39 DOWNTO 0);
  SIGNAL operator_66_true_mul_16_itm : STD_LOGIC_VECTOR (37 DOWNTO 0);
  SIGNAL operator_66_true_mul_15_itm : STD_LOGIC_VECTOR (35 DOWNTO 0);
  SIGNAL operator_66_true_mul_14_itm : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL operator_66_true_mul_13_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_66_true_mul_12_itm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL operator_66_true_mul_11_itm : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL operator_66_true_mul_10_itm : STD_LOGIC_VECTOR (25 DOWNTO 0);
  SIGNAL operator_66_true_mul_9_itm : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL operator_66_true_mul_8_itm : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL operator_66_true_mul_7_itm : STD_LOGIC_VECTOR (19 DOWNTO 0);
  SIGNAL operator_66_true_mul_6_itm : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL operator_66_true_mul_5_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL operator_66_true_mul_4_itm : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL operator_66_true_mul_3_itm : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL operator_66_true_mul_2_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_66_true_acc_45_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_66_true_acc_52_itm : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL operator_66_true_acc_58_itm : STD_LOGIC_VECTOR (34 DOWNTO 0);
  SIGNAL operator_66_true_acc_63_itm : STD_LOGIC_VECTOR (44 DOWNTO 0);
  SIGNAL operator_66_true_acc_67_itm : STD_LOGIC_VECTOR (52 DOWNTO 0);
  SIGNAL operator_66_true_acc_71_itm : STD_LOGIC_VECTOR (60 DOWNTO 0);
  SIGNAL MODEXP_WHILE_mul_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL TWIDDLE_LOOP_mul_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_1_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_2_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_64_false_acc_psp_sva_mx0w0 : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_1_psp_mx0w4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_2_psp_mx0w6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_acc_4_psp_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_acc_2_psp_sva_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL modExp_dev_result_1_sva_mx0w2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modExp_dev_exp_sva_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_operator_66_true_acc_psp_1 : STD_LOGIC_VECTOR (62 DOWNTO
      0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_9_0_mx0c0 : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_10_0_sva_9_0_mx0c2 : STD_LOGIC;
  SIGNAL or_90_rgt : STD_LOGIC;
  SIGNAL and_79_rgt : STD_LOGIC;
  SIGNAL and_82_rgt : STD_LOGIC;
  SIGNAL nor_71_cse : STD_LOGIC;
  SIGNAL and_137_cse : STD_LOGIC;
  SIGNAL and_169_cse : STD_LOGIC;
  SIGNAL operator_64_false_operator_64_false_mux_rgt : STD_LOGIC_VECTOR (64 DOWNTO
      0);
  SIGNAL not_tmp_145 : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_mux1h_1_rgt : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL or_tmp_96 : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_10_0_sva_1_10_9 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_1_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_64_false_acc_psp_sva_64 : STD_LOGIC;
  SIGNAL operator_64_false_acc_psp_sva_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_137_cse : STD_LOGIC;
  SIGNAL and_272_cse : STD_LOGIC;
  SIGNAL nor_91_cse : STD_LOGIC;
  SIGNAL or_134_cse : STD_LOGIC;
  SIGNAL mux_118_cse : STD_LOGIC;
  SIGNAL mux_112_cse : STD_LOGIC;
  SIGNAL or_tmp_99 : STD_LOGIC;
  SIGNAL nand_11_seb : STD_LOGIC;
  SIGNAL z_out_27_0 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL z_out_1_45_0 : STD_LOGIC_VECTOR (45 DOWNTO 0);
  SIGNAL z_out_9_64 : STD_LOGIC;

  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL and_nl : STD_LOGIC;
  SIGNAL and_264_nl : STD_LOGIC;
  SIGNAL and_265_nl : STD_LOGIC;
  SIGNAL nor_42_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL or_40_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL or_38_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL and_103_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL or_152_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL nor_90_nl : STD_LOGIC;
  SIGNAL and_271_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL and_26_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL nor_38_nl : STD_LOGIC;
  SIGNAL and_100_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL or_50_nl : STD_LOGIC;
  SIGNAL and_55_nl : STD_LOGIC;
  SIGNAL and_56_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL and_59_nl : STD_LOGIC;
  SIGNAL and_61_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL and_64_nl : STD_LOGIC;
  SIGNAL and_65_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL mux_69_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL or_64_nl : STD_LOGIC;
  SIGNAL or_62_nl : STD_LOGIC;
  SIGNAL or_17_nl : STD_LOGIC;
  SIGNAL operator_66_true_mul_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL r_strt_r_strt_and_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_r_not_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL and_9_nl : STD_LOGIC;
  SIGNAL and_66_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL mux_75_nl : STD_LOGIC;
  SIGNAL or_72_nl : STD_LOGIC;
  SIGNAL nand_16_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL mux_115_nl : STD_LOGIC;
  SIGNAL or_140_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL mux_113_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL or_135_nl : STD_LOGIC;
  SIGNAL mux_121_nl : STD_LOGIC;
  SIGNAL or_145_nl : STD_LOGIC;
  SIGNAL mux_120_nl : STD_LOGIC;
  SIGNAL mux_117_nl : STD_LOGIC;
  SIGNAL or_143_nl : STD_LOGIC;
  SIGNAL operator_66_true_acc_51_nl : STD_LOGIC_VECTOR (20 DOWNTO 0);
  SIGNAL operator_66_true_acc_50_nl : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL operator_66_true_acc_49_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL operator_66_true_acc_48_nl : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL operator_66_true_acc_47_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL operator_66_true_acc_57_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL operator_66_true_acc_56_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL operator_66_true_acc_55_nl : STD_LOGIC_VECTOR (28 DOWNTO 0);
  SIGNAL operator_66_true_acc_54_nl : STD_LOGIC_VECTOR (26 DOWNTO 0);
  SIGNAL operator_66_true_acc_53_nl : STD_LOGIC_VECTOR (24 DOWNTO 0);
  SIGNAL operator_66_true_acc_62_nl : STD_LOGIC_VECTOR (42 DOWNTO 0);
  SIGNAL operator_66_true_acc_61_nl : STD_LOGIC_VECTOR (40 DOWNTO 0);
  SIGNAL operator_66_true_acc_60_nl : STD_LOGIC_VECTOR (38 DOWNTO 0);
  SIGNAL operator_66_true_acc_59_nl : STD_LOGIC_VECTOR (36 DOWNTO 0);
  SIGNAL operator_66_true_acc_66_nl : STD_LOGIC_VECTOR (50 DOWNTO 0);
  SIGNAL operator_66_true_acc_65_nl : STD_LOGIC_VECTOR (48 DOWNTO 0);
  SIGNAL operator_66_true_acc_64_nl : STD_LOGIC_VECTOR (46 DOWNTO 0);
  SIGNAL or_5_nl : STD_LOGIC;
  SIGNAL or_2_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL mux_127_nl : STD_LOGIC;
  SIGNAL mux_126_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL and_274_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL or_151_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL mux_122_nl : STD_LOGIC;
  SIGNAL or_147_nl : STD_LOGIC;
  SIGNAL and_74_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL or_99_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_mux_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_not_nl : STD_LOGIC;
  SIGNAL operator_66_true_acc_37_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_acc_36_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_66_true_acc_72_nl : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_nand_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL or_46_nl : STD_LOGIC;
  SIGNAL and_40_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_mux_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COPY_LOOP_COPY_LOOP_and_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL nor_29_nl : STD_LOGIC;
  SIGNAL nor_30_nl : STD_LOGIC;
  SIGNAL operator_66_true_mux_43_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_66_true_mux_44_nl : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL operator_66_true_mux_45_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_66_true_mux_46_nl : STD_LOGIC_VECTOR (41 DOWNTO 0);
  SIGNAL operator_66_true_mux_47_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_mux_48_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_acc_73_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_mux_49_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_66_true_mux_50_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_66_true_mux_51_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_66_true_acc_76_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_66_true_mul_29_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_66_true_acc_84_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_66_true_and_4_nl : STD_LOGIC;
  SIGNAL operator_66_true_mux_52_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL operator_66_true_acc_85_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_66_true_acc_99_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL operator_66_true_acc_100_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL operator_66_true_operator_66_true_nand_1_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_mux1h_2_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_276_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_or_2_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_COPY_LOOP_1_or_1_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COPY_LOOP_1_mux_1_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_66_true_mux_53_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_mux_54_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL TWIDDLE_LOOP_TWIDDLE_LOOP_and_1_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL not_356_nl : STD_LOGIC;
  SIGNAL TWIDDLE_LOOP_mux_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_mux_55_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_mux_56_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL operator_66_true_acc_101_nl : STD_LOGIC_VECTOR (58 DOWNTO 0);
  SIGNAL operator_66_true_acc_102_nl : STD_LOGIC_VECTOR (56 DOWNTO 0);
  SIGNAL operator_66_true_acc_103_nl : STD_LOGIC_VECTOR (54 DOWNTO 0);
  SIGNAL operator_64_false_acc_nl : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL operator_64_false_mux_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_278_nl : STD_LOGIC;
  SIGNAL operator_66_true_mux_57_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_66_true_or_3_nl : STD_LOGIC;
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL operator_66_true_mux_58_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_66_true_acc_104_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_66_true_operator_66_true_nor_1_nl : STD_LOGIC;
  SIGNAL operator_66_true_mux_59_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_66_true_acc_105_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL g_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL g_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL modulo_dev_result_rem_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL COMP_LOOP_f2_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_core_wait_dp
    PORT(
      twiddle_rsc_cgo_iro : IN STD_LOGIC;
      twiddle_rsci_clken_d : OUT STD_LOGIC;
      xt_rsc_cgo_iro : IN STD_LOGIC;
      xt_rsci_clken_d : OUT STD_LOGIC;
      twiddle_rsc_cgo : IN STD_LOGIC;
      xt_rsc_cgo : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT peaceNTT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      main_C_7_tr0 : IN STD_LOGIC;
      MODEXP_WHILE_C_24_tr0 : IN STD_LOGIC;
      TWIDDLE_LOOP_C_24_tr0 : IN STD_LOGIC;
      COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_76_tr0 : IN STD_LOGIC;
      COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL peaceNTT_core_core_fsm_inst_main_C_7_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_TWIDDLE_LOOP_C_24_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COMP_LOOP_C_76_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_11_3_2(input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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

  FUNCTION MUX_v_24_2_2(input_0 : STD_LOGIC_VECTOR(23 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(23 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(23 DOWNTO 0);

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

  FUNCTION MUX_v_42_2_2(input_0 : STD_LOGIC_VECTOR(41 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(41 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(41 DOWNTO 0);

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

  g_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 3,
      width => 64
      )
    PORT MAP(
      dat => g_rsci_dat,
      idat => g_rsci_idat_1
    );
  g_rsci_dat <= g_rsc_dat;
  g_rsci_idat <= g_rsci_idat_1;

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
  g_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => g_rsc_triosy_lz
    );
  result_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_lz
    );
  modulo_dev_result_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => modulo_dev_result_rem_cmp_a,
      b => modulo_dev_result_rem_cmp_b,
      z => modulo_dev_result_rem_cmp_z_1
    );
  modulo_dev_result_rem_cmp_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(modulo_dev_result_rem_cmp_a_63_0),65));
  modulo_dev_result_rem_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(modulo_dev_result_rem_cmp_b_63_0));
  modulo_dev_result_rem_cmp_z <= modulo_dev_result_rem_cmp_z_1;

  COMP_LOOP_f2_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => COMP_LOOP_f2_lshift_rg_a,
      s => COMP_LOOP_f2_lshift_rg_s,
      z => COMP_LOOP_f2_lshift_rg_z
    );
  COMP_LOOP_f2_lshift_rg_a(0) <= '1';
  COMP_LOOP_f2_lshift_rg_s <= z_out_5(3 DOWNTO 0);
  COMP_LOOP_f2_lshift_itm <= COMP_LOOP_f2_lshift_rg_z;

  peaceNTT_core_wait_dp_inst : peaceNTT_core_wait_dp
    PORT MAP(
      twiddle_rsc_cgo_iro => and_27_rmff,
      twiddle_rsci_clken_d => twiddle_rsci_clken_d,
      xt_rsc_cgo_iro => and_37_rmff,
      xt_rsci_clken_d => xt_rsci_clken_d,
      twiddle_rsc_cgo => reg_twiddle_rsc_cgo_cse,
      xt_rsc_cgo => reg_xt_rsc_cgo_cse
    );
  peaceNTT_core_core_fsm_inst : peaceNTT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => peaceNTT_core_core_fsm_inst_fsm_output,
      main_C_7_tr0 => peaceNTT_core_core_fsm_inst_main_C_7_tr0,
      MODEXP_WHILE_C_24_tr0 => exit_MODEXP_WHILE_sva,
      TWIDDLE_LOOP_C_24_tr0 => peaceNTT_core_core_fsm_inst_TWIDDLE_LOOP_C_24_tr0,
      COPY_LOOP_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0,
      COMP_LOOP_C_76_tr0 => peaceNTT_core_core_fsm_inst_COMP_LOOP_C_76_tr0,
      COPY_LOOP_1_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_0_tr0 => peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0
    );
  fsm_output <= peaceNTT_core_core_fsm_inst_fsm_output;
  peaceNTT_core_core_fsm_inst_main_C_7_tr0 <= NOT z_out_9_64;
  peaceNTT_core_core_fsm_inst_TWIDDLE_LOOP_C_24_tr0 <= NOT TWIDDLE_LOOP_slc_TWIDDLE_LOOP_acc_3_itm;
  peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 <= COPY_LOOP_1_i_10_0_sva_1_10_9(1);
  peaceNTT_core_core_fsm_inst_COMP_LOOP_C_76_tr0 <= COMP_LOOP_r_9_0_sva_1(9);
  peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 <= COPY_LOOP_1_i_10_0_sva_1_10_9(1);
  peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_0_tr0 <= z_out_10(4);

  or_29_cse <= CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"));
  and_108_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  or_27_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_19_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_41_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_40_nl <= and_272_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  or_38_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("10"));
  or_37_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("01"));
  mux_45_nl <= MUX_s_1_2_2(or_38_nl, or_37_nl, and_272_cse);
  and_103_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  mux_46_nl <= MUX_s_1_2_2(or_40_nl, mux_45_nl, and_103_nl);
  nor_42_nl <= NOT(mux_46_nl OR (fsm_output(7)));
  operator_64_false_operator_64_false_mux_rgt <= MUX_v_65_2_2(operator_64_false_acc_psp_sva_mx0w0,
      ('0' & xt_rsci_q_d), nor_42_nl);
  and_272_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  nor_91_cse <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  modulo_dev_1_mux_cse <= MUX_v_64_2_2((modulo_dev_result_rem_cmp_z(63 DOWNTO 0)),
      modExp_dev_result_1_sva_mx0w2, modulo_dev_result_rem_cmp_z(63));
  mux_54_nl <= MUX_s_1_2_2(not_tmp_8, and_272_cse, fsm_output(2));
  and_26_nl <= (fsm_output(1)) AND mux_54_nl;
  nor_38_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("000")));
  and_100_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  mux_53_nl <= MUX_s_1_2_2(nor_38_nl, and_100_nl, fsm_output(1));
  mux_55_nl <= MUX_s_1_2_2(and_26_nl, mux_53_nl, fsm_output(0));
  and_27_rmff <= mux_55_nl AND and_dcpl_25;
  nand_nl <= NOT((fsm_output(2)) AND (NOT mux_21_cse));
  mux_59_nl <= MUX_s_1_2_2(nand_nl, or_tmp_40, fsm_output(1));
  or_50_nl <= (NOT (fsm_output(4))) OR (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_57_nl <= MUX_s_1_2_2(mux_21_cse, or_50_nl, fsm_output(2));
  mux_58_nl <= MUX_s_1_2_2(or_tmp_40, mux_57_nl, fsm_output(1));
  mux_60_nl <= MUX_s_1_2_2(mux_59_nl, mux_58_nl, fsm_output(0));
  and_37_rmff <= (NOT mux_60_nl) AND (NOT (fsm_output(6))) AND (fsm_output(3));
  or_59_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  or_15_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  nor_34_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  or_14_cse <= (NOT((CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")))
      OR (fsm_output(6)))) OR (fsm_output(7));
  mux_31_cse <= MUX_s_1_2_2(mux_tmp_17, or_tmp_12, or_15_cse);
  or_17_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  mux_33_cse <= MUX_s_1_2_2(mux_tmp_17, or_tmp_12, or_17_nl);
  mux_32_cse <= MUX_s_1_2_2(mux_31_cse, or_14_cse, fsm_output(3));
  operator_66_true_mul_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(10
      DOWNTO 9)) * UNSIGNED'( "110011")), 8));
  and_102_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  mux_105_nl <= MUX_s_1_2_2(mux_33_cse, mux_32_cse, and_102_nl);
  mux_103_nl <= MUX_s_1_2_2(mux_31_cse, or_14_cse, and_108_cse);
  mux_104_nl <= MUX_s_1_2_2(mux_103_nl, mux_tmp_61, fsm_output(1));
  mux_106_nl <= MUX_s_1_2_2(mux_105_nl, mux_104_nl, fsm_output(0));
  COMP_LOOP_r_not_nl <= NOT mux_106_nl;
  r_strt_r_strt_and_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (COMP_LOOP_r_9_0_sva_1(8
      DOWNTO 0)), COMP_LOOP_r_not_nl);
  and_9_nl <= and_dcpl_8 AND and_dcpl_5;
  and_66_nl <= and_dcpl_40 AND and_dcpl_13;
  mux_75_nl <= MUX_s_1_2_2(mux_tmp_17, or_tmp_12, fsm_output(5));
  or_72_nl <= (NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(7));
  mux_76_nl <= MUX_s_1_2_2(mux_75_nl, or_72_nl, fsm_output(4));
  mux_77_nl <= MUX_s_1_2_2(mux_31_cse, mux_76_nl, and_108_cse);
  mux_78_nl <= MUX_s_1_2_2(mux_77_nl, mux_tmp_61, or_134_cse);
  COPY_LOOP_1_i_mux1h_1_rgt <= MUX1HOT_v_11_3_2((STD_LOGIC_VECTOR'( "000") & STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_66_true_mul_1_nl),
      8))), z_out_5, (STD_LOGIC_VECTOR'( "00") & r_strt_r_strt_and_nl), STD_LOGIC_VECTOR'(
      and_9_nl & and_66_nl & (NOT mux_78_nl)));
  or_137_cse <= (fsm_output(1)) OR (NOT (fsm_output(7))) OR (fsm_output(5)) OR (fsm_output(4));
  or_134_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  nand_16_nl <= NOT((fsm_output(1)) AND (NOT mux_118_cse));
  mux_112_cse <= MUX_s_1_2_2(nand_16_nl, or_137_cse, fsm_output(0));
  mux_118_cse <= MUX_s_1_2_2(not_tmp_145, or_15_cse, fsm_output(7));
  or_5_nl <= (fsm_output(5)) OR (NOT (fsm_output(7)));
  or_2_nl <= (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_21_cse <= MUX_s_1_2_2(or_5_nl, or_2_nl, fsm_output(4));
  or_90_rgt <= (and_272_cse AND or_41_cse) OR or_dcpl_9 OR (NOT (fsm_output(5)));
  and_79_rgt <= and_dcpl_77 AND nor_34_cse AND (NOT (fsm_output(0))) AND (NOT (modulo_dev_result_rem_cmp_z(63)));
  and_82_rgt <= and_dcpl_77 AND nor_34_cse AND (NOT (fsm_output(0))) AND (modulo_dev_result_rem_cmp_z(63));
  operator_64_false_acc_psp_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(p_rsci_idat),
      64), 65) + SIGNED'( "11111111111111111111111111111111111111111111111111111111111111111"),
      65));
  COMP_LOOP_f2_mul_1_psp_mx0w4 <= STD_LOGIC_VECTOR(CONV_SIGNED(UNSIGNED'( UNSIGNED(COMP_LOOP_f2_asn_itm)
      * UNSIGNED(COMP_LOOP_f2_asn_1_itm)), 64));
  COMP_LOOP_acc_2_psp_mx0w6 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_64_false_acc_psp_sva_63_0)
      - SIGNED(modulo_dev_1_mux_cse), 64));
  operator_66_true_acc_36_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(operator_66_true_acc_psp_sva(4),
      1), 1), 2) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(operator_66_true_acc_psp_sva(5),
      1), 1), 2) + UNSIGNED'( "01"), 2));
  operator_66_true_acc_37_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT
      (operator_66_true_acc_psp_sva(5))) & (NOT (operator_66_true_acc_psp_sva(3 DOWNTO
      2)))), 3), 4) + CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_36_nl), 4) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(operator_66_true_acc_psp_sva(6),
      1), 1), 4), 4));
  operator_66_true_acc_4_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_37_nl),
      4) + UNSIGNED(STD_LOGIC_VECTOR'( "10") & (operator_66_true_acc_psp_sva(1 DOWNTO
      0))), 4));
  operator_66_true_acc_2_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_SIGNED(SIGNED(z_out_10(1
      DOWNTO 0)), 2), 3) + UNSIGNED((operator_66_true_acc_4_psp_sva_1(3)) & (operator_66_true_acc_4_psp_sva_1(1
      DOWNTO 0))), 3));
  modExp_dev_result_1_sva_mx0w2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_dev_result_rem_cmp_z(63
      DOWNTO 0)) + UNSIGNED(p_sva), 64));
  modExp_dev_exp_sva_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modExp_dev_exp_sva)
      + UNSIGNED'( "1111111111111111111111111111111111111111111111111111111111111111"),
      64));
  operator_66_true_acc_72_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_28_itm),
      62), 63) + CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_71_itm), 61),
      63), 63));
  operator_66_true_operator_66_true_acc_psp_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_72_nl),
      63) + SIGNED(operator_64_false_acc_psp_sva_64 & STD_LOGIC_VECTOR'( "00") &
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & STD_LOGIC_VECTOR'( "00") & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(operator_64_false_acc_psp_sva_64,
      1),2)) & '0' & operator_64_false_acc_psp_sva_64), 63));
  not_tmp_8 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_12 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_17 <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), fsm_output(6));
  or_dcpl_7 <= or_27_cse OR or_19_cse;
  or_dcpl_9 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_10 <= or_dcpl_9 OR or_15_cse;
  or_dcpl_11 <= or_dcpl_10 OR or_dcpl_7;
  and_dcpl_3 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_4 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_5 <= and_dcpl_4 AND and_dcpl_3;
  and_dcpl_6 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_8 <= nor_91_cse AND and_dcpl_6;
  and_dcpl_11 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_12 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_13 <= and_dcpl_12 AND and_dcpl_11;
  and_dcpl_15 <= nor_91_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_17 <= and_dcpl_12 AND and_dcpl_3;
  and_dcpl_18 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_19 <= and_dcpl_18 AND and_dcpl_6;
  or_tmp_34 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 4)=STD_LOGIC_VECTOR'("0111")));
  and_dcpl_25 <= nor_91_cse AND (fsm_output(5));
  and_dcpl_27 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_31 <= nor_91_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_4 AND and_dcpl_27;
  and_dcpl_34 <= and_dcpl_15 AND and_108_cse AND and_dcpl_11;
  or_tmp_40 <= NOT((fsm_output(2)) AND (fsm_output(4)) AND (fsm_output(5)) AND (NOT
      (fsm_output(7))));
  and_dcpl_38 <= and_dcpl_12 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_40 <= NOT(mux_21_cse OR (fsm_output(6)));
  and_dcpl_51 <= and_dcpl_8 AND and_dcpl_17;
  mux_tmp_48 <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(3));
  and_dcpl_56 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  mux_tmp_53 <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  or_tmp_45 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_61 <= MUX_s_1_2_2(mux_33_cse, mux_32_cse, fsm_output(2));
  or_dcpl_17 <= or_27_cse OR or_134_cse;
  or_dcpl_18 <= or_dcpl_10 OR or_dcpl_17;
  and_dcpl_70 <= and_108_cse AND and_dcpl_27;
  and_dcpl_72 <= and_dcpl_12 AND and_dcpl_27;
  and_dcpl_77 <= and_dcpl_25 AND not_tmp_8;
  or_dcpl_22 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")) OR or_19_cse;
  or_dcpl_23 <= or_dcpl_10 OR or_dcpl_22;
  or_tmp_72 <= not_tmp_8 OR (fsm_output(5));
  or_tmp_73 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_25 <= or_dcpl_9 OR or_tmp_45 OR or_dcpl_17;
  or_dcpl_29 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_32 <= or_dcpl_9 OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("11"));
  or_dcpl_41 <= or_tmp_12 OR or_tmp_73 OR or_dcpl_22;
  COPY_LOOP_1_i_10_0_sva_9_0_mx0c0 <= and_dcpl_40 AND and_dcpl_72;
  COPY_LOOP_1_i_10_0_sva_9_0_mx0c2 <= and_dcpl_15 AND and_dcpl_70;
  vec_rsci_adrb_d_pff <= COPY_LOOP_1_i_10_0_sva_9_0;
  vec_rsci_readB_r_ram_ir_internal_RMASK_B_d <= and_dcpl_15 AND and_dcpl_13;
  result_rsci_d_d <= modulo_dev_1_mux_cse;
  COMP_LOOP_COMP_LOOP_nand_nl <= NOT(and_dcpl_19 AND and_dcpl_17);
  result_rsci_wadr_d <= COMP_LOOP_COMP_LOOP_nand_nl & COPY_LOOP_1_i_10_0_sva_1_8_0;
  or_46_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 4)/=STD_LOGIC_VECTOR'("1000"));
  mux_52_nl <= MUX_s_1_2_2(or_tmp_34, or_46_nl, fsm_output(3));
  result_rsci_we_d_pff <= (NOT mux_52_nl) AND nor_34_cse AND (NOT (fsm_output(0)));
  result_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_19 AND and_dcpl_13;
  twiddle_rsci_d_d <= witer_sva;
  twiddle_rsci_wadr_d <= STD_LOGIC_VECTOR'( "000000") & TWIDDLE_LOOP_i_3_0_sva;
  twiddle_rsci_we_d_pff <= and_dcpl_31;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_34;
  and_40_nl <= and_dcpl_19 AND and_dcpl_38;
  xt_rsci_d_d <= MUX_v_64_2_2(vec_rsci_qb_d, result_rsci_q_d, and_40_nl);
  COPY_LOOP_mux_1_nl <= MUX_v_8_2_2((COPY_LOOP_1_i_10_0_sva_1_8_0(7 DOWNTO 0)), (COPY_LOOP_1_i_10_0_sva_1_8_0(8
      DOWNTO 1)), and_dcpl_34);
  COPY_LOOP_COPY_LOOP_and_nl <= (COPY_LOOP_1_i_10_0_sva_1_8_0(0)) AND and_dcpl_34;
  xt_rsci_radr_d <= COPY_LOOP_mux_1_nl & COPY_LOOP_COPY_LOOP_and_nl & '0';
  xt_rsci_we_d_pff <= and_dcpl_40 AND and_dcpl_38;
  xt_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_15 AND and_108_cse AND ((fsm_output(1))
      XOR (fsm_output(0)));
  and_dcpl_101 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("00000001"));
  nor_71_cse <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_137_cse <= nor_91_cse AND and_dcpl_6 AND nor_71_cse AND (fsm_output(0)) AND
      (NOT (fsm_output(2)));
  and_dcpl_123 <= nor_91_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("10"))
      AND nor_71_cse AND (fsm_output(0)) AND (NOT (fsm_output(2)));
  and_169_cse <= and_dcpl_8 AND nor_71_cse AND (fsm_output(0)) AND (NOT (fsm_output(2)));
  and_dcpl_144 <= NOT((fsm_output(0)) OR (fsm_output(2)));
  and_dcpl_154 <= nor_91_cse AND (NOT (fsm_output(5))) AND (NOT (fsm_output(4)))
      AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND and_dcpl_144;
  and_dcpl_164 <= and_dcpl_40 AND CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
  and_dcpl_175 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("00001000")));
  and_dcpl_188 <= nor_91_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("111110"));
  twiddle_rsci_radr_d <= z_out_7(9 DOWNTO 0);
  and_dcpl_202 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("01011000"));
  and_dcpl_226 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10")) AND
      and_dcpl_6 AND CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("1101"));
  not_tmp_145 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  or_tmp_96 <= (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(7)) OR (fsm_output(1))
      OR (NOT (fsm_output(5)));
  or_tmp_99 <= and_dcpl_31 OR (and_dcpl_19 AND and_dcpl_70);
  nor_29_nl <= NOT((fsm_output(1)) OR (fsm_output(2)) OR (NOT (fsm_output(5))));
  nor_30_nl <= NOT((NOT (fsm_output(1))) OR (NOT (fsm_output(2))) OR (fsm_output(5)));
  mux_84_nl <= MUX_s_1_2_2(nor_29_nl, nor_30_nl, fsm_output(0));
  nand_11_seb <= NOT(mux_84_nl AND nor_91_cse AND not_tmp_8);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_43_nl, and_265_nl, fsm_output(0))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_28_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(64 DOWNTO 63)) * UNSIGNED'(
            "110011001100110011001100110011001100110011001100110011001101")), 62));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_108_nl OR (fsm_output(7)))) = '1' ) THEN
        operator_64_false_acc_psp_sva_64 <= operator_64_false_operator_64_false_mux_rgt(64);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_109_nl AND nor_91_cse) = '1' ) THEN
        operator_64_false_acc_psp_sva_63_0 <= operator_64_false_operator_64_false_mux_rgt(63
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_26_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(60 DOWNTO 59)) * UNSIGNED'(
            "11001100110011001100110011001100110011001100110011001101")), 58));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_25_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(58 DOWNTO 57)) * UNSIGNED'(
            "110011001100110011001100110011001100110011001100110011")), 56));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_24_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(56 DOWNTO 55)) * UNSIGNED'(
            "1100110011001100110011001100110011001100110011001101")), 54));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_23_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(54 DOWNTO 53)) * UNSIGNED'(
            "11001100110011001100110011001100110011001100110011")), 52));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_22_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(52 DOWNTO 51)) * UNSIGNED'(
            "110011001100110011001100110011001100110011001101")), 50));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_21_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(50 DOWNTO 49)) * UNSIGNED'(
            "1100110011001100110011001100110011001100110011")), 48));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_19_itm <= z_out_1_45_0(43 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_18_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(44 DOWNTO 43)) * UNSIGNED'(
            "1100110011001100110011001100110011001101")), 42));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_17_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(42 DOWNTO 41)) * UNSIGNED'(
            "11001100110011001100110011001100110011")), 40));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_16_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(40 DOWNTO 39)) * UNSIGNED'(
            "110011001100110011001100110011001101")), 38));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_15_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(38 DOWNTO 37)) * UNSIGNED'(
            "1100110011001100110011001100110011")), 36));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_14_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(36 DOWNTO 35)) * UNSIGNED'(
            "11001100110011001100110011001101")), 34));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_13_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(34 DOWNTO 33)) * UNSIGNED'(
            "110011001100110011001100110011")), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_12_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
            UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(32 DOWNTO 31)) * UNSIGNED'(
            "1100110011001100110011001101")), 30));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_10_itm <= z_out_27_0(25 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_9_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(26
            DOWNTO 25)) * UNSIGNED'( "1100110011001100110011")), 24));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_8_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(24
            DOWNTO 23)) * UNSIGNED'( "11001100110011001101")), 22));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_7_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(22
            DOWNTO 21)) * UNSIGNED'( "110011001100110011")), 20));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_6_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(20
            DOWNTO 19)) * UNSIGNED'( "1100110011001101")), 18));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_5_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(18
            DOWNTO 17)) * UNSIGNED'( "11001100110011")), 16));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_4_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(16
            DOWNTO 15)) * UNSIGNED'( "110011001101")), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_3_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(14
            DOWNTO 13)) * UNSIGNED'( "1100110011")), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_11 = '0' ) THEN
        operator_66_true_mul_2_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(12
            DOWNTO 11)) * UNSIGNED'( "11001101")), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_twiddle_rsc_cgo_cse <= '0';
        reg_xt_rsc_cgo_cse <= '0';
        reg_vec_rsc_triosy_obj_ld_cse <= '0';
      ELSE
        reg_twiddle_rsc_cgo_cse <= and_27_rmff;
        reg_xt_rsc_cgo_cse <= and_37_rmff;
        reg_vec_rsc_triosy_obj_ld_cse <= and_dcpl_18 AND CONV_SL_1_1(fsm_output(5
            DOWNTO 0)=STD_LOGIC_VECTOR'("001101")) AND (z_out_10(4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      operator_66_true_acc_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_4(6
          DOWNTO 0)) + UNSIGNED(STD_LOGIC_VECTOR'( "100111") & (NOT (operator_64_false_acc_psp_sva_mx0w0(64)))),
          7));
      modulo_dev_result_rem_cmp_a_63_0 <= MUX1HOT_v_64_9_2(z_out_6, MODEXP_WHILE_mul_psp,
          z_out_7, TWIDDLE_LOOP_mul_psp, COMP_LOOP_f2_mul_1_psp_mx0w4, COMP_LOOP_f2_mul_1_psp,
          COMP_LOOP_acc_2_psp_mx0w6, COMP_LOOP_acc_2_psp, COMP_LOOP_acc_itm, STD_LOGIC_VECTOR'(
          and_dcpl_51 & and_55_nl & and_dcpl_31 & and_56_nl & and_59_nl & and_61_nl
          & and_64_nl & and_65_nl & (NOT mux_69_nl)));
      modulo_dev_result_rem_cmp_b_63_0 <= p_sva;
      operator_66_true_acc_45_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_4),
          8), 9) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(COPY_LOOP_1_i_10_0_sva_1_8_0(7
          DOWNTO 0)), 8), 9), 9));
      operator_66_true_acc_52_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_8_itm),
          22), 23) + CONV_SIGNED(SIGNED(operator_66_true_acc_51_nl), 23), 23));
      operator_66_true_acc_58_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_14_itm),
          34), 35) + CONV_SIGNED(SIGNED(operator_66_true_acc_57_nl), 35), 35));
      operator_66_true_acc_63_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_19_itm),
          44), 45) + CONV_SIGNED(SIGNED(operator_66_true_acc_62_nl), 45), 45));
      operator_66_true_acc_67_itm <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_23_itm),
          52), 53) + CONV_SIGNED(SIGNED(operator_66_true_acc_66_nl), 53), 53));
      operator_66_true_acc_71_itm <= z_out_8(60 DOWNTO 0);
      witer_sva <= MUX_v_64_2_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
          modulo_dev_1_mux_cse, and_74_nl);
      COMP_LOOP_f2_asn_itm <= twiddle_rsci_q_d;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_10_0_sva_1_10_9 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( mux_116_nl = '0' ) THEN
        COPY_LOOP_1_i_10_0_sva_1_10_9 <= COPY_LOOP_1_i_mux1h_1_rgt(10 DOWNTO 9);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_10_0_sva_1_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (NOT(mux_121_nl OR (fsm_output(6)))) = '1' ) THEN
        COPY_LOOP_1_i_10_0_sva_1_8_0 <= COPY_LOOP_1_i_mux1h_1_rgt(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_18 = '0' ) THEN
        operator_66_true_mul_27_itm <= z_out_6(59 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_18 = '0' ) THEN
        operator_66_true_mul_20_itm <= z_out_1_45_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_18 = '0' ) THEN
        operator_66_true_mul_11_itm <= z_out_27_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_125_nl OR (fsm_output(6)))) = '1' ) THEN
        TWIDDLE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( nand_11_seb & '0'
            & nand_11_seb & '0'), (z_out_5(3 DOWNTO 0)), mux_128_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (or_90_rgt OR and_79_rgt OR and_82_rgt) = '1' ) THEN
        modExp_dev_result_1_sva <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000001"),
            (modulo_dev_result_rem_cmp_z(63 DOWNTO 0)), modExp_dev_result_1_sva_mx0w2,
            STD_LOGIC_VECTOR'( or_90_rgt & and_79_rgt & and_82_rgt));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_MODEXP_WHILE_sva <= '0';
      ELSIF ( or_dcpl_23 = '0' ) THEN
        exit_MODEXP_WHILE_sva <= NOT z_out_9_64;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_99_nl) AND nor_91_cse)) = '1' ) THEN
        modExp_dev_exp_sva <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_66_true_operator_66_true_acc_psp_1),64)),
            modExp_dev_exp_sva_4, and_dcpl_51);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT mux_101_nl) AND nor_91_cse)) = '1' ) THEN
        modExp_dev_base_sva <= g_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_23 = '0' ) THEN
        MODEXP_WHILE_mul_psp <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_25 = '0' ) THEN
        TWIDDLE_LOOP_slc_TWIDDLE_LOOP_acc_3_itm <= z_out_2(3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_25 = '0' ) THEN
        TWIDDLE_LOOP_mul_psp <= z_out_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (COPY_LOOP_1_i_10_0_sva_9_0_mx0c0 OR (and_dcpl_40 AND and_108_cse AND
          and_dcpl_3) OR COPY_LOOP_1_i_10_0_sva_9_0_mx0c2) = '1' ) THEN
        COPY_LOOP_1_i_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            COPY_LOOP_1_i_mux_nl, COPY_LOOP_1_i_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COMP_LOOP_r_9_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(or_dcpl_32 OR or_dcpl_29 OR or_134_cse)) = '1' ) THEN
        COMP_LOOP_r_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COPY_LOOP_1_i_10_0_sva_1_8_0),
            9), 10) + UNSIGNED'( "0000000001"), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_32 OR or_dcpl_29 OR CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"))))
          = '1' ) THEN
        COMP_LOOP_f2_asn_1_itm <= xt_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_tmp_12 OR or_15_cse OR or_dcpl_7)) = '1' ) THEN
        COMP_LOOP_f2_mul_1_psp <= COMP_LOOP_f2_mul_1_psp_mx0w4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_41 = '0' ) THEN
        COMP_LOOP_acc_itm <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_41 = '0' ) THEN
        COMP_LOOP_acc_2_psp <= COMP_LOOP_acc_2_psp_mx0w6;
      END IF;
    END IF;
  END PROCESS;
  mux_41_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), (fsm_output(7)), or_29_cse);
  and_nl <= or_29_cse AND (fsm_output(7));
  mux_42_nl <= MUX_s_1_2_2(mux_41_nl, and_nl, or_27_cse);
  and_264_nl <= (and_108_cse OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")))
      AND (fsm_output(7));
  mux_43_nl <= MUX_s_1_2_2(mux_42_nl, and_264_nl, fsm_output(1));
  and_265_nl <= ((CONV_SL_1_1(fsm_output(3 DOWNTO 1)=STD_LOGIC_VECTOR'("111"))) OR
      CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000"))) AND (fsm_output(7));
  or_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000"));
  mux_nl <= MUX_s_1_2_2(or_nl, and_272_cse, fsm_output(6));
  or_152_nl <= (fsm_output(6)) OR (NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"))));
  mux_108_nl <= MUX_s_1_2_2(mux_nl, or_152_nl, fsm_output(5));
  nor_90_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 0)/=STD_LOGIC_VECTOR'("00000")));
  and_271_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 0)=STD_LOGIC_VECTOR'("11111"));
  mux_109_nl <= MUX_s_1_2_2(nor_90_nl, and_271_nl, fsm_output(5));
  and_55_nl <= (((or_41_cse OR (fsm_output(0))) AND (fsm_output(3))) OR (fsm_output(4)))
      AND nor_91_cse AND (NOT (fsm_output(5)));
  mux_27_nl <= MUX_s_1_2_2(not_tmp_8, and_272_cse, or_41_cse);
  mux_62_nl <= MUX_s_1_2_2(mux_tmp_48, and_272_cse, or_41_cse);
  mux_64_nl <= MUX_s_1_2_2(mux_27_nl, mux_62_nl, fsm_output(0));
  and_56_nl <= (NOT mux_64_nl) AND and_dcpl_25;
  and_59_nl <= and_dcpl_56 AND and_dcpl_6 AND and_dcpl_5;
  mux_65_nl <= MUX_s_1_2_2(mux_tmp_48, and_272_cse, or_59_cse);
  and_61_nl <= (NOT mux_65_nl) AND and_dcpl_56 AND (NOT (fsm_output(5)));
  and_64_nl <= and_dcpl_56 AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("01"))
      AND and_dcpl_17;
  and_99_nl <= or_59_cse AND (fsm_output(3));
  mux_67_nl <= MUX_s_1_2_2(or_tmp_45, mux_tmp_53, and_99_nl);
  and_65_nl <= (NOT mux_67_nl) AND and_dcpl_56;
  or_64_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("100"));
  or_62_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 5)/=STD_LOGIC_VECTOR'("011"));
  mux_68_nl <= MUX_s_1_2_2(or_64_nl, or_62_nl, fsm_output(4));
  mux_69_nl <= MUX_s_1_2_2(mux_68_nl, or_tmp_34, fsm_output(3));
  operator_66_true_acc_47_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_3_itm),
      12), 13) + CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_5), 11), 13), 13));
  operator_66_true_acc_48_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_4_itm),
      14), 15) + CONV_SIGNED(SIGNED(operator_66_true_acc_47_nl), 15), 15));
  operator_66_true_acc_49_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_5_itm),
      16), 17) + CONV_SIGNED(SIGNED(operator_66_true_acc_48_nl), 17), 17));
  operator_66_true_acc_50_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_6_itm),
      18), 19) + CONV_SIGNED(SIGNED(operator_66_true_acc_49_nl), 19), 19));
  operator_66_true_acc_51_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_7_itm),
      20), 21) + CONV_SIGNED(SIGNED(operator_66_true_acc_50_nl), 21), 21));
  operator_66_true_acc_53_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_9_itm),
      24), 25) + CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_52_itm), 23),
      25), 25));
  operator_66_true_acc_54_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_10_itm),
      26), 27) + CONV_SIGNED(SIGNED(operator_66_true_acc_53_nl), 27), 27));
  operator_66_true_acc_55_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_11_itm),
      28), 29) + CONV_SIGNED(SIGNED(operator_66_true_acc_54_nl), 29), 29));
  operator_66_true_acc_56_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_12_itm),
      30), 31) + CONV_SIGNED(SIGNED(operator_66_true_acc_55_nl), 31), 31));
  operator_66_true_acc_57_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_13_itm),
      32), 33) + CONV_SIGNED(SIGNED(operator_66_true_acc_56_nl), 33), 33));
  operator_66_true_acc_59_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_15_itm),
      36), 37) + CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_58_itm), 35),
      37), 37));
  operator_66_true_acc_60_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_16_itm),
      38), 39) + CONV_SIGNED(SIGNED(operator_66_true_acc_59_nl), 39), 39));
  operator_66_true_acc_61_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_17_itm),
      40), 41) + CONV_SIGNED(SIGNED(operator_66_true_acc_60_nl), 41), 41));
  operator_66_true_acc_62_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_18_itm),
      42), 43) + CONV_SIGNED(SIGNED(operator_66_true_acc_61_nl), 43), 43));
  operator_66_true_acc_64_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_20_itm),
      46), 47) + CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_63_itm), 45),
      47), 47));
  operator_66_true_acc_65_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_21_itm),
      48), 49) + CONV_SIGNED(SIGNED(operator_66_true_acc_64_nl), 49), 49));
  operator_66_true_acc_66_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_22_itm),
      50), 51) + CONV_SIGNED(SIGNED(operator_66_true_acc_65_nl), 51), 51));
  and_74_nl <= and_dcpl_15 AND and_dcpl_72;
  or_140_nl <= (NOT((NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))))
      OR (fsm_output(7)))) OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  mux_115_nl <= MUX_s_1_2_2(or_140_nl, (fsm_output(7)), fsm_output(6));
  or_135_nl <= (fsm_output(7)) OR not_tmp_145;
  mux_111_nl <= MUX_s_1_2_2(mux_118_cse, or_135_nl, or_134_cse);
  mux_113_nl <= MUX_s_1_2_2(mux_112_cse, mux_111_nl, fsm_output(2));
  mux_114_nl <= MUX_s_1_2_2(mux_113_nl, (fsm_output(7)), fsm_output(6));
  mux_116_nl <= MUX_s_1_2_2(mux_115_nl, mux_114_nl, fsm_output(3));
  or_145_nl <= (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(7))
      OR (fsm_output(5)) OR (fsm_output(4));
  or_143_nl <= (fsm_output(1)) OR (fsm_output(7)) OR not_tmp_145;
  mux_117_nl <= MUX_s_1_2_2(or_143_nl, or_137_cse, fsm_output(0));
  mux_120_nl <= MUX_s_1_2_2(mux_112_cse, mux_117_nl, fsm_output(2));
  mux_121_nl <= MUX_s_1_2_2(or_145_nl, mux_120_nl, fsm_output(3));
  nor_95_nl <= NOT((fsm_output(5)) OR (NOT or_tmp_99));
  mux_126_nl <= MUX_s_1_2_2(nor_95_nl, or_tmp_99, or_41_cse);
  mux_127_nl <= MUX_s_1_2_2(mux_126_nl, or_tmp_99, fsm_output(0));
  and_274_nl <= nor_91_cse AND not_tmp_8;
  mux_128_nl <= MUX_s_1_2_2(or_tmp_99, mux_127_nl, and_274_nl);
  or_151_nl <= (NOT (fsm_output(3))) OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(1)) OR (NOT (fsm_output(5)));
  mux_124_nl <= MUX_s_1_2_2(or_tmp_96, or_151_nl, fsm_output(2));
  or_147_nl <= (fsm_output(4)) OR (fsm_output(7)) OR (NOT (fsm_output(1))) OR (fsm_output(5));
  mux_122_nl <= MUX_s_1_2_2(or_147_nl, or_137_cse, fsm_output(3));
  mux_123_nl <= MUX_s_1_2_2(or_tmp_96, mux_122_nl, fsm_output(2));
  mux_125_nl <= MUX_s_1_2_2(mux_124_nl, mux_123_nl, fsm_output(0));
  mux_98_nl <= MUX_s_1_2_2(mux_tmp_53, or_tmp_73, fsm_output(3));
  mux_99_nl <= MUX_s_1_2_2(mux_98_nl, or_tmp_72, or_59_cse);
  or_99_nl <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"));
  mux_100_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), or_99_nl);
  mux_101_nl <= MUX_s_1_2_2(mux_100_nl, or_tmp_72, or_59_cse);
  COPY_LOOP_1_i_mux_nl <= MUX_v_10_2_2(((COPY_LOOP_1_i_10_0_sva_1_10_9(0)) & COPY_LOOP_1_i_10_0_sva_1_8_0),
      COMP_LOOP_f2_lshift_itm, COPY_LOOP_1_i_10_0_sva_9_0_mx0c2);
  COPY_LOOP_1_i_not_nl <= NOT COPY_LOOP_1_i_10_0_sva_9_0_mx0c0;
  operator_66_true_mux_43_nl <= MUX_v_2_2_2((operator_64_false_acc_psp_sva_mx0w0(28
      DOWNTO 27)), (operator_64_false_acc_psp_sva_63_0(30 DOWNTO 29)), and_dcpl_101);
  operator_66_true_mux_44_nl <= MUX_v_24_2_2(STD_LOGIC_VECTOR'( "011001100110011001100110"),
      STD_LOGIC_VECTOR'( "100110011001100110011001"), and_dcpl_101);
  z_out_27_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_66_true_mux_43_nl)
      * UNSIGNED(CONV_SIGNED(SIGNED(operator_66_true_mux_44_nl & '1'),26))), 28));
  operator_66_true_mux_45_nl <= MUX_v_2_2_2((operator_64_false_acc_psp_sva_mx0w0(46
      DOWNTO 45)), (operator_64_false_acc_psp_sva_63_0(48 DOWNTO 47)), and_137_cse);
  operator_66_true_mux_46_nl <= MUX_v_42_2_2(STD_LOGIC_VECTOR'( "011001100110011001100110011001100110011001"),
      STD_LOGIC_VECTOR'( "100110011001100110011001100110011001100110"), and_137_cse);
  z_out_1_45_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_66_true_mux_45_nl)
      * UNSIGNED(CONV_SIGNED(SIGNED(operator_66_true_mux_46_nl & '1'),44))), 46));
  operator_66_true_mux_47_nl <= MUX_v_4_2_2(z_out_11, ('0' & (z_out_5(3 DOWNTO 1))),
      and_dcpl_123);
  operator_66_true_acc_73_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(10
      DOWNTO 9)), 2), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(12
      DOWNTO 11))), 2), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(14
      DOWNTO 13)), 2), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(16
      DOWNTO 15))), 2), 4), 4));
  operator_66_true_mux_48_nl <= MUX_v_4_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_73_nl),
      4)), STD_LOGIC_VECTOR'( "1011"), and_dcpl_123);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_47_nl),
      5) + CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_48_nl), 5), 5));
  operator_66_true_mux_49_nl <= MUX_v_2_2_2((operator_64_false_acc_psp_sva_mx0w0(62
      DOWNTO 61)), (operator_66_true_acc_psp_sva(3 DOWNTO 2)), and_137_cse);
  operator_66_true_mux_50_nl <= MUX_v_2_2_2((NOT (operator_64_false_acc_psp_sva_mx0w0(64
      DOWNTO 63))), STD_LOGIC_VECTOR'( (operator_66_true_acc_psp_sva(4)) & (operator_66_true_acc_psp_sva(4))),
      and_137_cse);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_49_nl
      & '1'), 3), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_50_nl
      & '1'), 3), 4), 4));
  z_out_3 <= acc_1_nl(3 DOWNTO 1);
  operator_66_true_acc_76_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_2),
      5), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(18
      DOWNTO 17)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(20
      DOWNTO 19))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(26
      DOWNTO 25)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(28
      DOWNTO 27))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(30
      DOWNTO 29)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(32
      DOWNTO 31))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(22
      DOWNTO 21)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(24
      DOWNTO 23))), 2), 6), 6));
  operator_66_true_acc_84_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (operator_64_false_acc_psp_sva_63_0(8
      DOWNTO 7)))) + CONV_SIGNED(CONV_UNSIGNED(CONV_UNSIGNED(operator_66_true_acc_psp_sva(6),
      1), 1), 3) + SIGNED'( "001"), 3));
  operator_66_true_mul_29_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( CONV_SIGNED(SIGNED(operator_66_true_acc_84_nl),
      3) * SIGNED'( "10011")), 7));
  operator_66_true_mux_51_nl <= MUX_v_7_2_2(('0' & STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_76_nl),
      6))), STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(operator_66_true_mul_29_nl), 7)),
      and_169_cse);
  operator_66_true_and_4_nl <= operator_64_false_acc_psp_sva_64 AND (NOT (operator_66_true_acc_2_psp_sva_1(2)))
      AND (CONV_SL_1_1(operator_66_true_acc_2_psp_sva_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"))
      OR (operator_64_false_acc_psp_sva_63_0(0))) AND (NOT(and_dcpl_8 AND nor_71_cse
      AND and_dcpl_144));
  operator_66_true_acc_85_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(34
      DOWNTO 33)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(36
      DOWNTO 35))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(38
      DOWNTO 37)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(40
      DOWNTO 39))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(42
      DOWNTO 41)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(44
      DOWNTO 43))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(46
      DOWNTO 45)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(48
      DOWNTO 47))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_3), 3), 6)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(58
      DOWNTO 57)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(60
      DOWNTO 59))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(50
      DOWNTO 49)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(52
      DOWNTO 51))), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(54
      DOWNTO 53)), 2), 6) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(56
      DOWNTO 55))), 2), 6), 6));
  operator_66_true_acc_100_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_11(2
      DOWNTO 0)), 3), 5) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(z_out_3), 3), 5) +
      CONV_SIGNED(CONV_UNSIGNED(CONV_UNSIGNED(NOT (operator_66_true_acc_4_psp_sva_1(3)),
      1), 1), 5), 5));
  operator_66_true_operator_66_true_nand_1_nl <= NOT((operator_66_true_acc_2_psp_sva_1(2))
      AND (NOT operator_64_false_acc_psp_sva_64));
  operator_66_true_acc_99_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_100_nl),
      6) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED((operator_66_true_acc_psp_sva(5)) &
      (operator_64_false_acc_psp_sva_63_0(6 DOWNTO 5)) & (operator_66_true_acc_4_psp_sva_1(2))),
      4), 6) + CONV_SIGNED(CONV_UNSIGNED(operator_66_true_operator_66_true_nand_1_nl,
      1), 6), 6));
  operator_66_true_mux_52_nl <= MUX_v_7_2_2(('0' & STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_85_nl),
      6))), STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_99_nl),
      6),7)), and_169_cse);
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_SIGNED(SIGNED(operator_66_true_mux_51_nl
      & operator_66_true_and_4_nl), 8), 9) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(operator_66_true_mux_52_nl
      & '1'), 8), 9), 9));
  z_out_4 <= acc_2_nl(8 DOWNTO 1);
  and_276_nl <= and_dcpl_40 AND (fsm_output(3)) AND (fsm_output(1)) AND and_dcpl_144;
  COPY_LOOP_1_or_2_nl <= (nor_91_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 0)=STD_LOGIC_VECTOR'("100001")))
      OR and_dcpl_164;
  COPY_LOOP_1_mux1h_2_nl <= MUX1HOT_v_10_3_2(COPY_LOOP_1_i_10_0_sva_9_0, operator_66_true_mul_2_itm,
      STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(TWIDDLE_LOOP_i_3_0_sva),10)), STD_LOGIC_VECTOR'(
      and_276_nl & and_dcpl_154 & COPY_LOOP_1_or_2_nl));
  COPY_LOOP_1_mux_1_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR'( "000000001"), operator_66_true_acc_45_itm,
      and_dcpl_154);
  COPY_LOOP_1_COPY_LOOP_1_or_1_nl <= MUX_v_9_2_2(COPY_LOOP_1_mux_1_nl, STD_LOGIC_VECTOR'("111111111"),
      and_dcpl_164);
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COPY_LOOP_1_mux1h_2_nl),
      11) + CONV_UNSIGNED(SIGNED(COPY_LOOP_1_COPY_LOOP_1_or_1_nl), 11), 11));
  operator_66_true_mux_53_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000")
      & (operator_64_false_acc_psp_sva_63_0(62 DOWNTO 61))), modExp_dev_result_1_sva,
      and_dcpl_175);
  operator_66_true_mux_54_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR'( "0000001100110011001100110011001100110011001100110011001100110011"),
      modExp_dev_base_sva, and_dcpl_175);
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(operator_66_true_mux_53_nl)
      * UNSIGNED(operator_66_true_mux_54_nl)), 64));
  not_356_nl <= NOT and_dcpl_188;
  TWIDDLE_LOOP_TWIDDLE_LOOP_and_1_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"),
      witer_sva, not_356_nl);
  TWIDDLE_LOOP_mux_3_nl <= MUX_v_64_2_2(modExp_dev_result_1_sva, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(COPY_LOOP_1_i_10_0_sva_9_0),64)),
      and_dcpl_188);
  z_out_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(TWIDDLE_LOOP_TWIDDLE_LOOP_and_1_nl)
      * UNSIGNED(TWIDDLE_LOOP_mux_3_nl)), 64));
  operator_66_true_mux_55_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "0000") & operator_66_true_mul_27_itm),
      operator_64_false_acc_psp_sva_63_0, and_dcpl_202);
  operator_66_true_acc_103_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_24_itm),
      54), 55) + CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_67_itm), 53),
      55), 55));
  operator_66_true_acc_102_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_25_itm),
      56), 57) + CONV_SIGNED(SIGNED(operator_66_true_acc_103_nl), 57), 57));
  operator_66_true_acc_101_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mul_26_itm),
      58), 59) + CONV_SIGNED(SIGNED(operator_66_true_acc_102_nl), 59), 59));
  operator_66_true_mux_56_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(operator_66_true_acc_101_nl),
      59),64)), modulo_dev_1_mux_cse, and_dcpl_202);
  z_out_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_55_nl)
      + UNSIGNED(operator_66_true_mux_56_nl), 64));
  and_278_nl <= nor_91_cse AND and_dcpl_6 AND (fsm_output(3)) AND (NOT (fsm_output(1)))
      AND and_dcpl_144;
  operator_64_false_mux_3_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(NOT
      operator_66_true_operator_66_true_acc_psp_1),64)), (NOT modExp_dev_exp_sva_4),
      and_278_nl);
  operator_64_false_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & operator_64_false_mux_3_nl)
      + UNSIGNED'( "00000000000000000000000000000000000000000000000000000000000000001"),
      65));
  z_out_9_64 <= operator_64_false_acc_nl(64);
  operator_66_true_mux_57_nl <= MUX_v_4_2_2((STD_LOGIC_VECTOR'( "000") & (NOT (operator_66_true_acc_4_psp_sva_1(2)))),
      (z_out_5(3 DOWNTO 0)), and_dcpl_226);
  operator_66_true_or_3_nl <= (NOT (operator_66_true_acc_4_psp_sva_1(3))) OR and_dcpl_226;
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_57_nl),
      5) + CONV_UNSIGNED(CONV_SIGNED(operator_66_true_or_3_nl, 1), 5), 5));
  operator_66_true_acc_104_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(2
      DOWNTO 1)), 2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(4
      DOWNTO 3))), 2), 3), 3));
  operator_66_true_mux_58_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_104_nl),
      3)), ('1' & (operator_64_false_acc_psp_sva_63_0(4 DOWNTO 3))), and_169_cse);
  operator_66_true_operator_66_true_nor_1_nl <= NOT((operator_66_true_acc_psp_sva(5))
      OR (and_dcpl_8 AND nor_71_cse AND and_dcpl_144));
  operator_66_true_acc_105_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_64_false_acc_psp_sva_mx0w0(6
      DOWNTO 5)), 2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (operator_64_false_acc_psp_sva_mx0w0(8
      DOWNTO 7))), 2), 3), 3));
  operator_66_true_mux_59_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_66_true_acc_105_nl),
      3)), ('0' & (operator_64_false_acc_psp_sva_63_0(6 DOWNTO 5))), and_169_cse);
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_58_nl
      & operator_66_true_operator_66_true_nor_1_nl), 4), 5) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_66_true_mux_59_nl
      & '1'), 4), 5), 5));
  z_out_11 <= acc_7_nl(4 DOWNTO 1);
END v6;

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
    vec_rsc_adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    g_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsc_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_we : OUT STD_LOGIC;
    result_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_triosy_lz : OUT STD_LOGIC
  );
END peaceNTT;

ARCHITECTURE v6 OF peaceNTT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_qb_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_readB_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL result_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_clken_d : STD_LOGIC;
  SIGNAL twiddle_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL xt_rsci_clken_d : STD_LOGIC;
  SIGNAL xt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsc_clken : STD_LOGIC;
  SIGNAL twiddle_rsc_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsc_we : STD_LOGIC;
  SIGNAL twiddle_rsc_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsc_clken : STD_LOGIC;
  SIGNAL xt_rsc_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsc_we : STD_LOGIC;
  SIGNAL xt_rsc_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_adrb_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_we_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsci_we_d_iff : STD_LOGIC;
  SIGNAL xt_rsci_we_d_iff : STD_LOGIC;

  SIGNAL twiddle_rsc_comp_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_comp_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL xt_rsc_comp_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_comp_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adrb_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      qb_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      readB_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsci_qb : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_adrb : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_adrb_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_qb_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL result_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen
    PORT(
      clken : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      clken_d : IN STD_LOGIC;
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we_d : IN STD_LOGIC;
      writeA_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC;
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL xt_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      g_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsci_qb_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_readB_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      result_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      result_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_clken_d : OUT STD_LOGIC;
      twiddle_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      xt_rsci_clken_d : OUT STD_LOGIC;
      xt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsci_adrb_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      result_rsci_we_d_pff : OUT STD_LOGIC;
      twiddle_rsci_we_d_pff : OUT STD_LOGIC;
      xt_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_g_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsci_qb_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsci_adrb_d_pff : STD_LOGIC_VECTOR (9 DOWNTO 0);

BEGIN
  twiddle_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 10,
      data_width => 64,
      depth => 1024,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => twiddle_rsc_clken,
      d => twiddle_rsc_comp_d,
      q => twiddle_rsc_comp_q,
      radr => twiddle_rsc_comp_radr,
      wadr => twiddle_rsc_comp_wadr,
      we => twiddle_rsc_we
    );
  twiddle_rsc_comp_d <= twiddle_rsc_d;
  twiddle_rsc_q <= twiddle_rsc_comp_q;
  twiddle_rsc_comp_radr <= twiddle_rsc_radr;
  twiddle_rsc_comp_wadr <= twiddle_rsc_wadr;

  xt_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 10,
      data_width => 64,
      depth => 1024,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => xt_rsc_clken,
      d => xt_rsc_comp_d,
      q => xt_rsc_comp_q,
      radr => xt_rsc_comp_radr,
      wadr => xt_rsc_comp_wadr,
      we => xt_rsc_we
    );
  xt_rsc_comp_d <= xt_rsc_d;
  xt_rsc_q <= xt_rsc_comp_q;
  xt_rsc_comp_radr <= xt_rsc_radr;
  xt_rsc_comp_wadr <= xt_rsc_wadr;

  vec_rsci : peaceNTT_Xilinx_RAMS_BLOCK_2R1W_WBR_DUAL_rport_1_10_64_1024_1024_64_1_gen
    PORT MAP(
      qb => vec_rsci_qb,
      adrb => vec_rsci_adrb,
      adrb_d => vec_rsci_adrb_d,
      qb_d => vec_rsci_qb_d_1,
      readB_r_ram_ir_internal_RMASK_B_d => vec_rsci_readB_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsci_qb <= vec_rsc_qb;
  vec_rsc_adrb <= vec_rsci_adrb;
  vec_rsci_adrb_d <= vec_rsci_adrb_d_iff;
  vec_rsci_qb_d <= vec_rsci_qb_d_1;

  result_rsci : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    PORT MAP(
      q => result_rsci_q,
      radr => result_rsci_radr,
      we => result_rsc_we,
      d => result_rsci_d,
      wadr => result_rsci_wadr,
      d_d => result_rsci_d_d_1,
      q_d => result_rsci_q_d_1,
      radr_d => result_rsci_radr_d,
      wadr_d => result_rsci_wadr_d_1,
      we_d => result_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => result_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => result_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  result_rsci_q <= result_rsc_q;
  result_rsc_radr <= result_rsci_radr;
  result_rsc_d <= result_rsci_d;
  result_rsc_wadr <= result_rsci_wadr;
  result_rsci_d_d_1 <= result_rsci_d_d;
  result_rsci_q_d <= result_rsci_q_d_1;
  result_rsci_radr_d <= vec_rsci_adrb_d_iff;
  result_rsci_wadr_d_1 <= result_rsci_wadr_d;

  twiddle_rsci : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    PORT MAP(
      clken => twiddle_rsc_clken,
      q => twiddle_rsci_q,
      radr => twiddle_rsci_radr,
      we => twiddle_rsc_we,
      d => twiddle_rsci_d,
      wadr => twiddle_rsci_wadr,
      clken_d => twiddle_rsci_clken_d,
      d_d => twiddle_rsci_d_d_1,
      q_d => twiddle_rsci_q_d_1,
      radr_d => twiddle_rsci_radr_d_1,
      wadr_d => twiddle_rsci_wadr_d_1,
      we_d => twiddle_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => twiddle_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsci_q <= twiddle_rsc_q;
  twiddle_rsc_radr <= twiddle_rsci_radr;
  twiddle_rsc_d <= twiddle_rsci_d;
  twiddle_rsc_wadr <= twiddle_rsci_wadr;
  twiddle_rsci_d_d_1 <= twiddle_rsci_d_d;
  twiddle_rsci_q_d <= twiddle_rsci_q_d_1;
  twiddle_rsci_radr_d_1 <= twiddle_rsci_radr_d;
  twiddle_rsci_wadr_d_1 <= twiddle_rsci_wadr_d;

  xt_rsci : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen
    PORT MAP(
      clken => xt_rsc_clken,
      q => xt_rsci_q,
      radr => xt_rsci_radr,
      we => xt_rsc_we,
      d => xt_rsci_d,
      wadr => xt_rsci_wadr,
      clken_d => xt_rsci_clken_d,
      d_d => xt_rsci_d_d_1,
      q_d => xt_rsci_q_d_1,
      radr_d => xt_rsci_radr_d_1,
      wadr_d => xt_rsci_wadr_d,
      we_d => xt_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  xt_rsci_q <= xt_rsc_q;
  xt_rsc_radr <= xt_rsci_radr;
  xt_rsc_d <= xt_rsci_d;
  xt_rsc_wadr <= xt_rsci_wadr;
  xt_rsci_d_d_1 <= xt_rsci_d_d;
  xt_rsci_q_d <= xt_rsci_q_d_1;
  xt_rsci_radr_d_1 <= xt_rsci_radr_d;
  xt_rsci_wadr_d <= vec_rsci_adrb_d_iff;

  peaceNTT_core_inst : peaceNTT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => peaceNTT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      g_rsc_dat => peaceNTT_core_inst_g_rsc_dat,
      g_rsc_triosy_lz => g_rsc_triosy_lz,
      result_rsc_triosy_lz => result_rsc_triosy_lz,
      vec_rsci_qb_d => peaceNTT_core_inst_vec_rsci_qb_d,
      vec_rsci_readB_r_ram_ir_internal_RMASK_B_d => vec_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      result_rsci_d_d => peaceNTT_core_inst_result_rsci_d_d,
      result_rsci_q_d => peaceNTT_core_inst_result_rsci_q_d,
      result_rsci_wadr_d => peaceNTT_core_inst_result_rsci_wadr_d,
      result_rsci_readA_r_ram_ir_internal_RMASK_B_d => result_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_clken_d => twiddle_rsci_clken_d,
      twiddle_rsci_d_d => peaceNTT_core_inst_twiddle_rsci_d_d,
      twiddle_rsci_q_d => peaceNTT_core_inst_twiddle_rsci_q_d,
      twiddle_rsci_radr_d => peaceNTT_core_inst_twiddle_rsci_radr_d,
      twiddle_rsci_wadr_d => peaceNTT_core_inst_twiddle_rsci_wadr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      xt_rsci_clken_d => xt_rsci_clken_d,
      xt_rsci_d_d => peaceNTT_core_inst_xt_rsci_d_d,
      xt_rsci_q_d => peaceNTT_core_inst_xt_rsci_q_d,
      xt_rsci_radr_d => peaceNTT_core_inst_xt_rsci_radr_d,
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d => xt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsci_adrb_d_pff => peaceNTT_core_inst_vec_rsci_adrb_d_pff,
      result_rsci_we_d_pff => result_rsci_we_d_iff,
      twiddle_rsci_we_d_pff => twiddle_rsci_we_d_iff,
      xt_rsci_we_d_pff => xt_rsci_we_d_iff
    );
  peaceNTT_core_inst_p_rsc_dat <= p_rsc_dat;
  peaceNTT_core_inst_g_rsc_dat <= g_rsc_dat;
  peaceNTT_core_inst_vec_rsci_qb_d <= vec_rsci_qb_d;
  result_rsci_d_d <= peaceNTT_core_inst_result_rsci_d_d;
  peaceNTT_core_inst_result_rsci_q_d <= result_rsci_q_d;
  result_rsci_wadr_d <= peaceNTT_core_inst_result_rsci_wadr_d;
  twiddle_rsci_d_d <= peaceNTT_core_inst_twiddle_rsci_d_d;
  peaceNTT_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_radr_d <= peaceNTT_core_inst_twiddle_rsci_radr_d;
  twiddle_rsci_wadr_d <= peaceNTT_core_inst_twiddle_rsci_wadr_d;
  xt_rsci_d_d <= peaceNTT_core_inst_xt_rsci_d_d;
  peaceNTT_core_inst_xt_rsci_q_d <= xt_rsci_q_d;
  xt_rsci_radr_d <= peaceNTT_core_inst_xt_rsci_radr_d;
  vec_rsci_adrb_d_iff <= peaceNTT_core_inst_vec_rsci_adrb_d_pff;

END v6;



