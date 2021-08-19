
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_out_dreg_v2.vhd 
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
PACKAGE mgc_out_dreg_pkg_v2 IS

COMPONENT mgc_out_dreg_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END mgc_out_dreg_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_out_dreg_v2 IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_dreg_v2;

ARCHITECTURE beh OF mgc_out_dreg_v2 IS
BEGIN

  z <= d;

END beh;

--------> ../td_ccore_solutions/modulo_dev_82693469b209adaad48c4c31f4adead96233_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Wed Aug 18 21:51:12 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    modulo_dev_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;
USE work.mgc_comps.ALL;


ENTITY modulo_dev_core IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_dev_core;

ARCHITECTURE v1 OF modulo_dev_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL base_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat : STD_LOGIC;
  SIGNAL rem_4_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_1_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_2_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_3_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_1_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_2_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_3_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_1_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_2_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_4_cmp_3_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL acc_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL or_dcpl_3 : STD_LOGIC;
  SIGNAL rem_4cyc_st_4 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_sva_duc_mx0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_7_cse : STD_LOGIC;
  SIGNAL and_9_cse : STD_LOGIC;
  SIGNAL and_11_cse : STD_LOGIC;
  SIGNAL and_13_cse : STD_LOGIC;
  SIGNAL rem_4cyc : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL m_buf_sva_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL asn_itm_2 : STD_LOGIC;
  SIGNAL asn_itm_3 : STD_LOGIC;
  SIGNAL rem_4cyc_st_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_4cyc_st_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL m_and_cse : STD_LOGIC;
  SIGNAL and_17_cse : STD_LOGIC;
  SIGNAL and_18_cse : STD_LOGIC;
  SIGNAL and_15_cse : STD_LOGIC;

  SIGNAL qelse_acc_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL and_4_nl : STD_LOGIC;
  SIGNAL and_5_nl : STD_LOGIC;
  SIGNAL and_6_nl : STD_LOGIC;
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL rem_4_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_4_cmp_1_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_1_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_1_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_4_cmp_2_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_2_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_2_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_4_cmp_3_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_3_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_4_cmp_3_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

BEGIN
  base_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 64
      )
    PORT MAP(
      dat => base_rsci_dat,
      idat => base_rsci_idat_1
    );
  base_rsci_dat <= base_rsc_dat;
  base_rsci_idat <= base_rsci_idat_1;

  m_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 64
      )
    PORT MAP(
      dat => m_rsci_dat,
      idat => m_rsci_idat_1
    );
  m_rsci_dat <= m_rsc_dat;
  m_rsci_idat <= m_rsci_idat_1;

  return_rsci : work.mgc_out_dreg_pkg_v2.mgc_out_dreg_v2
    GENERIC MAP(
      rscid => 3,
      width => 64
      )
    PORT MAP(
      d => return_rsci_d_1,
      z => return_rsci_z
    );
  return_rsci_d_1 <= return_rsci_d;
  return_rsc_z <= return_rsci_z;

  ccs_ccore_start_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 8,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  rem_4_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_4_cmp_a,
      b => rem_4_cmp_b,
      z => rem_4_cmp_z_1
    );
  rem_4_cmp_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_4_cmp_a_63_0),65));
  rem_4_cmp_b <= '0' & rem_4_cmp_b_63_0;
  rem_4_cmp_z <= rem_4_cmp_z_1;

  rem_4_cmp_1 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_4_cmp_1_a,
      b => rem_4_cmp_1_b,
      z => rem_4_cmp_1_z_1
    );
  rem_4_cmp_1_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_4_cmp_1_a_63_0),65));
  rem_4_cmp_1_b <= '0' & rem_4_cmp_1_b_63_0;
  rem_4_cmp_1_z <= rem_4_cmp_1_z_1;

  rem_4_cmp_2 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_4_cmp_2_a,
      b => rem_4_cmp_2_b,
      z => rem_4_cmp_2_z_1
    );
  rem_4_cmp_2_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_4_cmp_2_a_63_0),65));
  rem_4_cmp_2_b <= '0' & rem_4_cmp_2_b_63_0;
  rem_4_cmp_2_z <= rem_4_cmp_2_z_1;

  rem_4_cmp_3 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_4_cmp_3_a,
      b => rem_4_cmp_3_b,
      z => rem_4_cmp_3_z_1
    );
  rem_4_cmp_3_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_4_cmp_3_a_63_0),65));
  rem_4_cmp_3_b <= '0' & rem_4_cmp_3_b_63_0;
  rem_4_cmp_3_z <= rem_4_cmp_3_z_1;

  m_and_cse <= ccs_ccore_en AND main_stage_0_4 AND asn_itm_3;
  and_7_cse <= ccs_ccore_en AND (NOT(or_dcpl OR (acc_tmp(0))));
  and_9_cse <= ccs_ccore_en AND (NOT(or_dcpl OR (NOT (acc_tmp(0)))));
  and_11_cse <= ccs_ccore_en AND (NOT(or_dcpl_3 OR (acc_tmp(0))));
  and_13_cse <= ccs_ccore_en AND (NOT(or_dcpl_3 OR (NOT (acc_tmp(0)))));
  and_17_cse <= ccs_ccore_en AND main_stage_0_3 AND asn_itm_2;
  and_18_cse <= ccs_ccore_en AND main_stage_0_2 AND asn_itm_1;
  and_15_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  nor_nl <= NOT(CONV_SL_1_1(rem_4cyc_st_4/=STD_LOGIC_VECTOR'("00")));
  and_4_nl <= CONV_SL_1_1(rem_4cyc_st_4=STD_LOGIC_VECTOR'("01"));
  and_5_nl <= CONV_SL_1_1(rem_4cyc_st_4=STD_LOGIC_VECTOR'("10"));
  and_6_nl <= CONV_SL_1_1(rem_4cyc_st_4=STD_LOGIC_VECTOR'("11"));
  result_sva_duc_mx0 <= MUX1HOT_v_64_4_2((rem_4_cmp_1_z(63 DOWNTO 0)), (rem_4_cmp_2_z(63
      DOWNTO 0)), (rem_4_cmp_3_z(63 DOWNTO 0)), (rem_4_cmp_z(63 DOWNTO 0)), STD_LOGIC_VECTOR'(
      nor_nl & and_4_nl & and_5_nl & and_6_nl));
  acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(rem_4cyc) + UNSIGNED'( "01"),
      2));
  or_dcpl <= (NOT ccs_ccore_start_rsci_idat) OR (acc_tmp(1));
  or_dcpl_3 <= NOT(ccs_ccore_start_rsci_idat AND (acc_tmp(1)));
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        return_rsci_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        asn_itm_3 <= '0';
        asn_itm_2 <= '0';
        asn_itm_1 <= '0';
        main_stage_0_2 <= '0';
        main_stage_0_3 <= '0';
        main_stage_0_4 <= '0';
      ELSIF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_64_2_2(result_sva_duc_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(qelse_acc_nl),
            64)), result_sva_duc_mx0(63));
        asn_itm_3 <= asn_itm_2;
        asn_itm_2 <= asn_itm_1;
        asn_itm_1 <= ccs_ccore_start_rsci_idat;
        main_stage_0_2 <= '1';
        main_stage_0_3 <= main_stage_0_2;
        main_stage_0_4 <= main_stage_0_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        m_buf_sva_4 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        rem_4cyc_st_4 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( m_and_cse = '1' ) THEN
        m_buf_sva_4 <= m_buf_sva_3;
        rem_4cyc_st_4 <= rem_4cyc_st_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4_cmp_1_b_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        rem_4_cmp_1_a_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_7_cse = '1' ) THEN
        rem_4_cmp_1_b_63_0 <= m_rsci_idat;
        rem_4_cmp_1_a_63_0 <= base_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4_cmp_2_b_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        rem_4_cmp_2_a_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_9_cse = '1' ) THEN
        rem_4_cmp_2_b_63_0 <= m_rsci_idat;
        rem_4_cmp_2_a_63_0 <= base_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4_cmp_3_b_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        rem_4_cmp_3_a_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_11_cse = '1' ) THEN
        rem_4_cmp_3_b_63_0 <= m_rsci_idat;
        rem_4_cmp_3_a_63_0 <= base_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4_cmp_b_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        rem_4_cmp_a_63_0 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_13_cse = '1' ) THEN
        rem_4_cmp_b_63_0 <= m_rsci_idat;
        rem_4_cmp_a_63_0 <= base_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4cyc_st_3 <= STD_LOGIC_VECTOR'( "00");
        m_buf_sva_3 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_17_cse = '1' ) THEN
        rem_4cyc_st_3 <= rem_4cyc_st_2;
        m_buf_sva_3 <= m_buf_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4cyc_st_2 <= STD_LOGIC_VECTOR'( "00");
        m_buf_sva_2 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_18_cse = '1' ) THEN
        rem_4cyc_st_2 <= rem_4cyc;
        m_buf_sva_2 <= m_buf_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_4cyc <= STD_LOGIC_VECTOR'( "00");
        m_buf_sva_1 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( and_15_cse = '1' ) THEN
        rem_4cyc <= acc_tmp;
        m_buf_sva_1 <= m_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  qelse_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(result_sva_duc_mx0) + UNSIGNED(m_buf_sva_4),
      64));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    modulo_dev
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_out_dreg_pkg_v2.ALL;
USE work.mgc_comps.ALL;


ENTITY modulo_dev IS
  PORT(
    base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    ccs_ccore_start_rsc_dat : IN STD_LOGIC;
    ccs_ccore_clk : IN STD_LOGIC;
    ccs_ccore_srst : IN STD_LOGIC;
    ccs_ccore_en : IN STD_LOGIC
  );
END modulo_dev;

ARCHITECTURE v1 OF modulo_dev IS
  -- Default Constants

  COMPONENT modulo_dev_core
    PORT(
      base_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL modulo_dev_core_inst_base_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_core_inst_m_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_core_inst_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

BEGIN
  modulo_dev_core_inst : modulo_dev_core
    PORT MAP(
      base_rsc_dat => modulo_dev_core_inst_base_rsc_dat,
      m_rsc_dat => modulo_dev_core_inst_m_rsc_dat,
      return_rsc_z => modulo_dev_core_inst_return_rsc_z,
      ccs_ccore_start_rsc_dat => ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => ccs_ccore_clk,
      ccs_ccore_srst => ccs_ccore_srst,
      ccs_ccore_en => ccs_ccore_en
    );
  modulo_dev_core_inst_base_rsc_dat <= base_rsc_dat;
  modulo_dev_core_inst_m_rsc_dat <= m_rsc_dat;
  return_rsc_z <= modulo_dev_core_inst_return_rsc_z;

END v1;




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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_r_beh_v5.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_shift_r_v5 IS
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
END mgc_shift_r_v5;

LIBRARY ieee;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_shift_r_v5 IS

  FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1 > arg2) THEN
      RETURN(arg1) ;
    ELSE
      RETURN(arg2) ;
    END IF;
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

  FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE)
  RETURN UNSIGNED IS
  BEGIN
    RETURN fshr_stdar(arg1, arg2, '0', olen);
  END;

  FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE)
  RETURN SIGNED IS
  BEGIN
    RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen);
  END;

BEGIN
UNSGNED:  IF signd_a = 0 GENERATE
    z <= std_logic_vector(fshr_stdar(unsigned(a), unsigned(s), width_z));
  END GENERATE;
SGNED:  IF signd_a /= 0 GENERATE
    z <= std_logic_vector(fshr_stdar(  signed(a), unsigned(s), width_z));
  END GENERATE;
END beh;

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
--  Generated date: Wed Aug 18 21:52:59 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen;

ARCHITECTURE v2 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen;

ARCHITECTURE v2 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen;

ARCHITECTURE v2 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen;

ARCHITECTURE v2 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    IDX_LOOP_C_59_tr0 : IN STD_LOGIC;
    IDX_LOOP_C_117_tr0 : IN STD_LOGIC;
    GROUP_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END DIT_RELOOP_core_core_fsm;

ARCHITECTURE v2 OF DIT_RELOOP_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for DIT_RELOOP_core_core_fsm_1
  TYPE DIT_RELOOP_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, IDX_LOOP_C_0,
      IDX_LOOP_C_1, IDX_LOOP_C_2, IDX_LOOP_C_3, IDX_LOOP_C_4, IDX_LOOP_C_5, IDX_LOOP_C_6,
      IDX_LOOP_C_7, IDX_LOOP_C_8, IDX_LOOP_C_9, IDX_LOOP_C_10, IDX_LOOP_C_11, IDX_LOOP_C_12,
      IDX_LOOP_C_13, IDX_LOOP_C_14, IDX_LOOP_C_15, IDX_LOOP_C_16, IDX_LOOP_C_17,
      IDX_LOOP_C_18, IDX_LOOP_C_19, IDX_LOOP_C_20, IDX_LOOP_C_21, IDX_LOOP_C_22,
      IDX_LOOP_C_23, IDX_LOOP_C_24, IDX_LOOP_C_25, IDX_LOOP_C_26, IDX_LOOP_C_27,
      IDX_LOOP_C_28, IDX_LOOP_C_29, IDX_LOOP_C_30, IDX_LOOP_C_31, IDX_LOOP_C_32,
      IDX_LOOP_C_33, IDX_LOOP_C_34, IDX_LOOP_C_35, IDX_LOOP_C_36, IDX_LOOP_C_37,
      IDX_LOOP_C_38, IDX_LOOP_C_39, IDX_LOOP_C_40, IDX_LOOP_C_41, IDX_LOOP_C_42,
      IDX_LOOP_C_43, IDX_LOOP_C_44, IDX_LOOP_C_45, IDX_LOOP_C_46, IDX_LOOP_C_47,
      IDX_LOOP_C_48, IDX_LOOP_C_49, IDX_LOOP_C_50, IDX_LOOP_C_51, IDX_LOOP_C_52,
      IDX_LOOP_C_53, IDX_LOOP_C_54, IDX_LOOP_C_55, IDX_LOOP_C_56, IDX_LOOP_C_57,
      IDX_LOOP_C_58, IDX_LOOP_C_59, IDX_LOOP_C_60, IDX_LOOP_C_61, IDX_LOOP_C_62,
      IDX_LOOP_C_63, IDX_LOOP_C_64, IDX_LOOP_C_65, IDX_LOOP_C_66, IDX_LOOP_C_67,
      IDX_LOOP_C_68, IDX_LOOP_C_69, IDX_LOOP_C_70, IDX_LOOP_C_71, IDX_LOOP_C_72,
      IDX_LOOP_C_73, IDX_LOOP_C_74, IDX_LOOP_C_75, IDX_LOOP_C_76, IDX_LOOP_C_77,
      IDX_LOOP_C_78, IDX_LOOP_C_79, IDX_LOOP_C_80, IDX_LOOP_C_81, IDX_LOOP_C_82,
      IDX_LOOP_C_83, IDX_LOOP_C_84, IDX_LOOP_C_85, IDX_LOOP_C_86, IDX_LOOP_C_87,
      IDX_LOOP_C_88, IDX_LOOP_C_89, IDX_LOOP_C_90, IDX_LOOP_C_91, IDX_LOOP_C_92,
      IDX_LOOP_C_93, IDX_LOOP_C_94, IDX_LOOP_C_95, IDX_LOOP_C_96, IDX_LOOP_C_97,
      IDX_LOOP_C_98, IDX_LOOP_C_99, IDX_LOOP_C_100, IDX_LOOP_C_101, IDX_LOOP_C_102,
      IDX_LOOP_C_103, IDX_LOOP_C_104, IDX_LOOP_C_105, IDX_LOOP_C_106, IDX_LOOP_C_107,
      IDX_LOOP_C_108, IDX_LOOP_C_109, IDX_LOOP_C_110, IDX_LOOP_C_111, IDX_LOOP_C_112,
      IDX_LOOP_C_113, IDX_LOOP_C_114, IDX_LOOP_C_115, IDX_LOOP_C_116, IDX_LOOP_C_117,
      GROUP_LOOP_C_0, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : DIT_RELOOP_core_core_fsm_1_ST;
  SIGNAL state_var_NS : DIT_RELOOP_core_core_fsm_1_ST;

BEGIN
  DIT_RELOOP_core_core_fsm_1 : PROCESS (IDX_LOOP_C_59_tr0, IDX_LOOP_C_117_tr0, GROUP_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= IDX_LOOP_C_0;
      WHEN IDX_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        state_var_NS <= IDX_LOOP_C_1;
      WHEN IDX_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011");
        state_var_NS <= IDX_LOOP_C_2;
      WHEN IDX_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        state_var_NS <= IDX_LOOP_C_3;
      WHEN IDX_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101");
        state_var_NS <= IDX_LOOP_C_4;
      WHEN IDX_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110");
        state_var_NS <= IDX_LOOP_C_5;
      WHEN IDX_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111");
        state_var_NS <= IDX_LOOP_C_6;
      WHEN IDX_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        state_var_NS <= IDX_LOOP_C_7;
      WHEN IDX_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001");
        state_var_NS <= IDX_LOOP_C_8;
      WHEN IDX_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010");
        state_var_NS <= IDX_LOOP_C_9;
      WHEN IDX_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011");
        state_var_NS <= IDX_LOOP_C_10;
      WHEN IDX_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100");
        state_var_NS <= IDX_LOOP_C_11;
      WHEN IDX_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101");
        state_var_NS <= IDX_LOOP_C_12;
      WHEN IDX_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110");
        state_var_NS <= IDX_LOOP_C_13;
      WHEN IDX_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111");
        state_var_NS <= IDX_LOOP_C_14;
      WHEN IDX_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= IDX_LOOP_C_15;
      WHEN IDX_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001");
        state_var_NS <= IDX_LOOP_C_16;
      WHEN IDX_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010");
        state_var_NS <= IDX_LOOP_C_17;
      WHEN IDX_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011");
        state_var_NS <= IDX_LOOP_C_18;
      WHEN IDX_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100");
        state_var_NS <= IDX_LOOP_C_19;
      WHEN IDX_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101");
        state_var_NS <= IDX_LOOP_C_20;
      WHEN IDX_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110");
        state_var_NS <= IDX_LOOP_C_21;
      WHEN IDX_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111");
        state_var_NS <= IDX_LOOP_C_22;
      WHEN IDX_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000");
        state_var_NS <= IDX_LOOP_C_23;
      WHEN IDX_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001");
        state_var_NS <= IDX_LOOP_C_24;
      WHEN IDX_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010");
        state_var_NS <= IDX_LOOP_C_25;
      WHEN IDX_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011");
        state_var_NS <= IDX_LOOP_C_26;
      WHEN IDX_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100");
        state_var_NS <= IDX_LOOP_C_27;
      WHEN IDX_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101");
        state_var_NS <= IDX_LOOP_C_28;
      WHEN IDX_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110");
        state_var_NS <= IDX_LOOP_C_29;
      WHEN IDX_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111");
        state_var_NS <= IDX_LOOP_C_30;
      WHEN IDX_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        state_var_NS <= IDX_LOOP_C_31;
      WHEN IDX_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001");
        state_var_NS <= IDX_LOOP_C_32;
      WHEN IDX_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010");
        state_var_NS <= IDX_LOOP_C_33;
      WHEN IDX_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011");
        state_var_NS <= IDX_LOOP_C_34;
      WHEN IDX_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100");
        state_var_NS <= IDX_LOOP_C_35;
      WHEN IDX_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101");
        state_var_NS <= IDX_LOOP_C_36;
      WHEN IDX_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110");
        state_var_NS <= IDX_LOOP_C_37;
      WHEN IDX_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111");
        state_var_NS <= IDX_LOOP_C_38;
      WHEN IDX_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000");
        state_var_NS <= IDX_LOOP_C_39;
      WHEN IDX_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001");
        state_var_NS <= IDX_LOOP_C_40;
      WHEN IDX_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010");
        state_var_NS <= IDX_LOOP_C_41;
      WHEN IDX_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011");
        state_var_NS <= IDX_LOOP_C_42;
      WHEN IDX_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100");
        state_var_NS <= IDX_LOOP_C_43;
      WHEN IDX_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101");
        state_var_NS <= IDX_LOOP_C_44;
      WHEN IDX_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110");
        state_var_NS <= IDX_LOOP_C_45;
      WHEN IDX_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111");
        state_var_NS <= IDX_LOOP_C_46;
      WHEN IDX_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000");
        state_var_NS <= IDX_LOOP_C_47;
      WHEN IDX_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001");
        state_var_NS <= IDX_LOOP_C_48;
      WHEN IDX_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010");
        state_var_NS <= IDX_LOOP_C_49;
      WHEN IDX_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011");
        state_var_NS <= IDX_LOOP_C_50;
      WHEN IDX_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100");
        state_var_NS <= IDX_LOOP_C_51;
      WHEN IDX_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101");
        state_var_NS <= IDX_LOOP_C_52;
      WHEN IDX_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110");
        state_var_NS <= IDX_LOOP_C_53;
      WHEN IDX_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111");
        state_var_NS <= IDX_LOOP_C_54;
      WHEN IDX_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000");
        state_var_NS <= IDX_LOOP_C_55;
      WHEN IDX_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001");
        state_var_NS <= IDX_LOOP_C_56;
      WHEN IDX_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010");
        state_var_NS <= IDX_LOOP_C_57;
      WHEN IDX_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011");
        state_var_NS <= IDX_LOOP_C_58;
      WHEN IDX_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100");
        state_var_NS <= IDX_LOOP_C_59;
      WHEN IDX_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101");
        IF ( IDX_LOOP_C_59_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_60;
        END IF;
      WHEN IDX_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110");
        state_var_NS <= IDX_LOOP_C_61;
      WHEN IDX_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111");
        state_var_NS <= IDX_LOOP_C_62;
      WHEN IDX_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= IDX_LOOP_C_63;
      WHEN IDX_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000001");
        state_var_NS <= IDX_LOOP_C_64;
      WHEN IDX_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000010");
        state_var_NS <= IDX_LOOP_C_65;
      WHEN IDX_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000011");
        state_var_NS <= IDX_LOOP_C_66;
      WHEN IDX_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000100");
        state_var_NS <= IDX_LOOP_C_67;
      WHEN IDX_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000101");
        state_var_NS <= IDX_LOOP_C_68;
      WHEN IDX_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000110");
        state_var_NS <= IDX_LOOP_C_69;
      WHEN IDX_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000111");
        state_var_NS <= IDX_LOOP_C_70;
      WHEN IDX_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001000");
        state_var_NS <= IDX_LOOP_C_71;
      WHEN IDX_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001001");
        state_var_NS <= IDX_LOOP_C_72;
      WHEN IDX_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001010");
        state_var_NS <= IDX_LOOP_C_73;
      WHEN IDX_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001011");
        state_var_NS <= IDX_LOOP_C_74;
      WHEN IDX_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001100");
        state_var_NS <= IDX_LOOP_C_75;
      WHEN IDX_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001101");
        state_var_NS <= IDX_LOOP_C_76;
      WHEN IDX_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001110");
        state_var_NS <= IDX_LOOP_C_77;
      WHEN IDX_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1001111");
        state_var_NS <= IDX_LOOP_C_78;
      WHEN IDX_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010000");
        state_var_NS <= IDX_LOOP_C_79;
      WHEN IDX_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010001");
        state_var_NS <= IDX_LOOP_C_80;
      WHEN IDX_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010010");
        state_var_NS <= IDX_LOOP_C_81;
      WHEN IDX_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010011");
        state_var_NS <= IDX_LOOP_C_82;
      WHEN IDX_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010100");
        state_var_NS <= IDX_LOOP_C_83;
      WHEN IDX_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010101");
        state_var_NS <= IDX_LOOP_C_84;
      WHEN IDX_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010110");
        state_var_NS <= IDX_LOOP_C_85;
      WHEN IDX_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1010111");
        state_var_NS <= IDX_LOOP_C_86;
      WHEN IDX_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011000");
        state_var_NS <= IDX_LOOP_C_87;
      WHEN IDX_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011001");
        state_var_NS <= IDX_LOOP_C_88;
      WHEN IDX_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011010");
        state_var_NS <= IDX_LOOP_C_89;
      WHEN IDX_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011011");
        state_var_NS <= IDX_LOOP_C_90;
      WHEN IDX_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011100");
        state_var_NS <= IDX_LOOP_C_91;
      WHEN IDX_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011101");
        state_var_NS <= IDX_LOOP_C_92;
      WHEN IDX_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011110");
        state_var_NS <= IDX_LOOP_C_93;
      WHEN IDX_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1011111");
        state_var_NS <= IDX_LOOP_C_94;
      WHEN IDX_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100000");
        state_var_NS <= IDX_LOOP_C_95;
      WHEN IDX_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100001");
        state_var_NS <= IDX_LOOP_C_96;
      WHEN IDX_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100010");
        state_var_NS <= IDX_LOOP_C_97;
      WHEN IDX_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100011");
        state_var_NS <= IDX_LOOP_C_98;
      WHEN IDX_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100100");
        state_var_NS <= IDX_LOOP_C_99;
      WHEN IDX_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100101");
        state_var_NS <= IDX_LOOP_C_100;
      WHEN IDX_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100110");
        state_var_NS <= IDX_LOOP_C_101;
      WHEN IDX_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1100111");
        state_var_NS <= IDX_LOOP_C_102;
      WHEN IDX_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101000");
        state_var_NS <= IDX_LOOP_C_103;
      WHEN IDX_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101001");
        state_var_NS <= IDX_LOOP_C_104;
      WHEN IDX_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101010");
        state_var_NS <= IDX_LOOP_C_105;
      WHEN IDX_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101011");
        state_var_NS <= IDX_LOOP_C_106;
      WHEN IDX_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101100");
        state_var_NS <= IDX_LOOP_C_107;
      WHEN IDX_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101101");
        state_var_NS <= IDX_LOOP_C_108;
      WHEN IDX_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101110");
        state_var_NS <= IDX_LOOP_C_109;
      WHEN IDX_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1101111");
        state_var_NS <= IDX_LOOP_C_110;
      WHEN IDX_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110000");
        state_var_NS <= IDX_LOOP_C_111;
      WHEN IDX_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110001");
        state_var_NS <= IDX_LOOP_C_112;
      WHEN IDX_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110010");
        state_var_NS <= IDX_LOOP_C_113;
      WHEN IDX_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110011");
        state_var_NS <= IDX_LOOP_C_114;
      WHEN IDX_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110100");
        state_var_NS <= IDX_LOOP_C_115;
      WHEN IDX_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110101");
        state_var_NS <= IDX_LOOP_C_116;
      WHEN IDX_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110110");
        state_var_NS <= IDX_LOOP_C_117;
      WHEN IDX_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1110111");
        IF ( IDX_LOOP_C_117_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_0;
        END IF;
      WHEN GROUP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1111000");
        IF ( GROUP_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= IDX_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1111001");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1111010");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000");
        state_var_NS <= STAGE_LOOP_C_0;
    END CASE;
  END PROCESS DIT_RELOOP_core_core_fsm_1;

  DIT_RELOOP_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS DIT_RELOOP_core_core_fsm_1_REG;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END DIT_RELOOP_core_wait_dp;

ARCHITECTURE v2 OF DIT_RELOOP_core_wait_dp IS
  -- Default Constants

BEGIN
  IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC
  );
END DIT_RELOOP_core;

ARCHITECTURE v2 OF DIT_RELOOP_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL or_tmp_3 : STD_LOGIC;
  SIGNAL nor_tmp_3 : STD_LOGIC;
  SIGNAL or_tmp_5 : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL nor_tmp_9 : STD_LOGIC;
  SIGNAL mux_tmp_24 : STD_LOGIC;
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL not_tmp_34 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL mux_tmp_35 : STD_LOGIC;
  SIGNAL not_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL mux_tmp_47 : STD_LOGIC;
  SIGNAL or_tmp_26 : STD_LOGIC;
  SIGNAL mux_tmp_51 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_psp_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL reg_IDX_LOOP_t_10_1_ftd_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_IDX_LOOP_1_lshift_idiv_ftd_9 : STD_LOGIC;
  SIGNAL reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL reg_twiddle_rsc_triosy_0_0_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_22_cse : STD_LOGIC;
  SIGNAL and_88_cse : STD_LOGIC;
  SIGNAL or_73_cse : STD_LOGIC;
  SIGNAL and_80_cse : STD_LOGIC;
  SIGNAL or_76_cse : STD_LOGIC;
  SIGNAL mux_16_cse : STD_LOGIC;
  SIGNAL mux_47_rmff : STD_LOGIC;
  SIGNAL tmp_1_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_f1_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_acc_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_idx1_acc_psp_1_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_acc_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_69_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL STAGE_LOOP_gp_acc_psp_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_gp_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_1_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_10_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL GROUP_LOOP_j_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_t_10_1_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL GROUP_LOOP_j_10_0_sva_9_0_mx0c0 : STD_LOGIC;
  SIGNAL tmp_1_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL IDX_LOOP_mux_10_itm_mx0c1 : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL and_145_ssc : STD_LOGIC;
  SIGNAL and_104_cse : STD_LOGIC;
  SIGNAL and_139_cse : STD_LOGIC;
  SIGNAL and_cse : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL z_out_1_10 : STD_LOGIC;

  SIGNAL and_2_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL nor_28_nl : STD_LOGIC;
  SIGNAL mux_51_nl : STD_LOGIC;
  SIGNAL and_81_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL and_82_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL GROUP_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_70_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL or_15_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL or_80_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL nor_26_nl : STD_LOGIC;
  SIGNAL nor_27_nl : STD_LOGIC;
  SIGNAL and_75_nl : STD_LOGIC;
  SIGNAL mux_25_nl : STD_LOGIC;
  SIGNAL nor_35_nl : STD_LOGIC;
  SIGNAL mux_23_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL or_27_nl : STD_LOGIC;
  SIGNAL or_26_nl : STD_LOGIC;
  SIGNAL or_1_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL and_77_nl : STD_LOGIC;
  SIGNAL nor_25_nl : STD_LOGIC;
  SIGNAL and_36_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL or_41_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL or_39_nl : STD_LOGIC;
  SIGNAL mux_67_nl : STD_LOGIC;
  SIGNAL or_44_nl : STD_LOGIC;
  SIGNAL mux_66_nl : STD_LOGIC;
  SIGNAL or_43_nl : STD_LOGIC;
  SIGNAL or_42_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL or_30_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_13_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_IDX_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_IDX_LOOP_and_1_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL not_273_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_14_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_15_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_gp_mux_5_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_mux1h_11_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_165_nl : STD_LOGIC;
  SIGNAL and_166_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_mux_16_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT modulo_dev
    PORT (
      base_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      return_rsc_z : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      ccs_ccore_start_rsc_dat : IN STD_LOGIC;
      ccs_ccore_clk : IN STD_LOGIC;
      ccs_ccore_srst : IN STD_LOGIC;
      ccs_ccore_en : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

  SIGNAL STAGE_LOOP_op_rshift_rg_a : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL IDX_LOOP_1_lshift_rg_a : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_1_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL IDX_LOOP_1_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT DIT_RELOOP_core_wait_dp
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT DIT_RELOOP_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      IDX_LOOP_C_59_tr0 : IN STD_LOGIC;
      IDX_LOOP_C_117_tr0 : IN STD_LOGIC;
      GROUP_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_59_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_117_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_9_3_2(input_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(8 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
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

  FUNCTION MUX_v_128_2_2(input_0 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(127 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(127 DOWNTO 0);

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

  FUNCTION READSLICE_64_65(input_val:STD_LOGIC_VECTOR(64 DOWNTO 0);index:INTEGER)
  RETURN STD_LOGIC_VECTOR IS
    CONSTANT min_sat_index:INTEGER:= maximum( index, 0 );
    CONSTANT sat_index:INTEGER:= minimum( min_sat_index, 1);
  BEGIN
    RETURN input_val(sat_index+63 DOWNTO sat_index);
  END;

BEGIN
  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 5,
      width => 64
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  vec_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_1_lz
    );
  vec_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  twiddle_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_1_lz
    );
  twiddle_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_0_lz
    );
  IDX_LOOP_1_IDX_LOOP_rem_1_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 128,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a_1,
      b => IDX_LOOP_1_IDX_LOOP_rem_1_cmp_b,
      z => IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z_1
    );
  IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a_1 <= IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a;
  IDX_LOOP_1_IDX_LOOP_rem_1_cmp_b <= reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse;
  IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z <= IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z_1;

  IDX_LOOP_1_modulo_dev_cmp : modulo_dev
    PORT MAP(
      base_rsc_dat => IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat,
      m_rsc_dat => IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat,
      return_rsc_z => IDX_LOOP_1_modulo_dev_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en
    );
  IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat <= READSLICE_64_65(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((MUX_v_64_2_2(vec_rsc_0_0_i_q_d,
      IDX_LOOP_f1_1_sva, and_dcpl_138 OR and_dcpl_142)) & ((NOT and_dcpl_138) OR
      and_dcpl_136 OR and_dcpl_142)) + UNSIGNED((MUX1HOT_v_64_3_2((NOT tmp_1_lpi_4_dfm),
      tmp_1_lpi_4_dfm, (NOT (MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, IDX_LOOP_idx2_9_0_sva(0)))),
      STD_LOGIC_VECTOR'( and_dcpl_136 & and_dcpl_138 & and_dcpl_142))) & '1'), 65)),
      1);
  IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat <= p_sva;
  IDX_LOOP_1_modulo_dev_cmp_return_rsc_z <= IDX_LOOP_1_modulo_dev_cmp_return_rsc_z_1;
  IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat <= (MUX_s_1_2_2(not_tmp_34, and_cse,
      fsm_output(1))) AND and_dcpl_14;

  STAGE_LOOP_op_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 11,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => STAGE_LOOP_op_rshift_rg_a,
      s => STAGE_LOOP_op_rshift_rg_s,
      z => STAGE_LOOP_op_rshift_rg_z
    );
  STAGE_LOOP_op_rshift_rg_a <= STD_LOGIC_VECTOR'( "10000000000");
  STAGE_LOOP_op_rshift_rg_s <= STAGE_LOOP_i_3_0_sva;
  STAGE_LOOP_op_rshift_itm <= STAGE_LOOP_op_rshift_rg_z;

  IDX_LOOP_1_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 10,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => IDX_LOOP_1_lshift_rg_a,
      s => IDX_LOOP_1_lshift_rg_s,
      z => IDX_LOOP_1_lshift_rg_z
    );
  IDX_LOOP_1_lshift_rg_a <= (MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), IDX_LOOP_t_10_1_sva_8_0,
      (NOT and_145_ssc))) & ((NOT and_139_cse) OR and_145_ssc OR and_dcpl_130);
  IDX_LOOP_1_lshift_rg_s <= MUX_v_4_2_2((z_out_2(3 DOWNTO 0)), STAGE_LOOP_gp_acc_psp_sva,
      and_139_cse OR and_dcpl_130);
  z_out_4 <= IDX_LOOP_1_lshift_rg_z;

  DIT_RELOOP_core_wait_dp_inst : DIT_RELOOP_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => mux_47_rmff,
      ensig_cgo => reg_ensig_cgo_cse,
      IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en => IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en
    );
  DIT_RELOOP_core_core_fsm_inst : DIT_RELOOP_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => DIT_RELOOP_core_core_fsm_inst_fsm_output,
      IDX_LOOP_C_59_tr0 => DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_59_tr0,
      IDX_LOOP_C_117_tr0 => DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_117_tr0,
      GROUP_LOOP_C_0_tr0 => DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= DIT_RELOOP_core_core_fsm_inst_fsm_output;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_59_tr0 <= NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_117_tr0 <= NOT IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm;
  DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 <= NOT z_out_1_10;
  DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  mux_45_nl <= MUX_s_1_2_2(not_tmp_34, mux_tmp_35, fsm_output(1));
  mux_46_nl <= MUX_s_1_2_2(not_tmp_35, mux_45_nl, fsm_output(2));
  mux_47_rmff <= MUX_s_1_2_2(mux_46_nl, (NOT or_tmp_5), fsm_output(6));
  or_22_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_73_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  and_80_cse <= (fsm_output(1)) AND (fsm_output(3));
  and_88_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_76_cse <= (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(5));
  and_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  IDX_LOOP_idx2_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_1_sva_mx0w0)
      + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva(9 DOWNTO 1)), 9));
  IDX_LOOP_idx1_acc_psp_1_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_3(8
      DOWNTO 0)) + UNSIGNED(IDX_LOOP_t_10_1_sva_8_0), 9));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT STAGE_LOOP_i_3_0_sva_2))
      + SIGNED'( "01011"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  or_tmp_3 <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000"));
  nor_tmp_3 <= (and_88_cse OR (fsm_output(3))) AND CONV_SL_1_1(fsm_output(5 DOWNTO
      4)=STD_LOGIC_VECTOR'("11"));
  or_tmp_5 <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"));
  mux_tmp_4 <= MUX_s_1_2_2((NOT or_tmp_5), nor_tmp_3, fsm_output(6));
  mux_16_cse <= MUX_s_1_2_2((NOT or_tmp_3), nor_tmp_3, fsm_output(6));
  nor_tmp_9 <= or_73_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  mux_tmp_24 <= MUX_s_1_2_2((NOT or_tmp_3), nor_tmp_9, fsm_output(6));
  and_dcpl_2 <= NOT((fsm_output(2)) OR (fsm_output(6)));
  and_dcpl_3 <= and_dcpl_2 AND (NOT (fsm_output(0)));
  and_dcpl_4 <= NOT((fsm_output(3)) OR (fsm_output(1)));
  and_dcpl_5 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_6 <= and_dcpl_5 AND and_dcpl_4;
  and_dcpl_8 <= (NOT (fsm_output(2))) AND (fsm_output(6));
  and_dcpl_9 <= and_dcpl_8 AND (fsm_output(0));
  and_dcpl_11 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_12 <= and_dcpl_11 AND (fsm_output(3)) AND (NOT (fsm_output(1)));
  and_dcpl_14 <= (fsm_output(2)) AND (NOT (fsm_output(6)));
  not_tmp_34 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_16 <= and_dcpl_14 AND (NOT (fsm_output(0)));
  and_dcpl_17 <= and_dcpl_6 AND and_dcpl_16;
  mux_tmp_35 <= MUX_s_1_2_2(and_dcpl_5, and_dcpl_11, fsm_output(3));
  not_tmp_35 <= NOT((fsm_output(1)) OR (NOT (fsm_output(3))) OR (fsm_output(4)) OR
      (fsm_output(5)));
  and_dcpl_23 <= and_dcpl_2 AND (fsm_output(0));
  and_dcpl_25 <= (NOT (fsm_output(3))) AND (fsm_output(1));
  and_dcpl_26 <= and_dcpl_5 AND and_dcpl_25;
  and_dcpl_31 <= and_dcpl_25 AND and_dcpl_2;
  or_27_nl <= (fsm_output(2)) OR (NOT and_80_cse);
  or_26_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_47 <= MUX_s_1_2_2(or_27_nl, or_26_nl, fsm_output(6));
  or_tmp_26 <= (NOT (fsm_output(6))) OR (NOT (fsm_output(2))) OR (fsm_output(1))
      OR (fsm_output(3));
  or_1_nl <= (fsm_output(1)) OR (NOT and_cse);
  mux_tmp_51 <= MUX_s_1_2_2(or_76_cse, or_1_nl, fsm_output(2));
  and_dcpl_39 <= (fsm_output(2)) AND (fsm_output(6));
  and_dcpl_42 <= and_dcpl_11 AND and_dcpl_25 AND and_dcpl_39 AND (NOT (fsm_output(0)));
  and_dcpl_43 <= and_dcpl_11 AND and_80_cse AND and_dcpl_23;
  and_dcpl_46 <= and_dcpl_11 AND and_dcpl_4 AND and_dcpl_39 AND (fsm_output(0));
  and_dcpl_47 <= and_dcpl_26 AND and_dcpl_3;
  and_dcpl_48 <= and_dcpl_12 AND and_dcpl_16;
  and_dcpl_49 <= and_dcpl_12 AND and_dcpl_14 AND (fsm_output(0));
  mux_32_nl <= MUX_s_1_2_2((NOT or_tmp_3), and_cse, fsm_output(6));
  mux_69_itm <= MUX_s_1_2_2(mux_tmp_24, mux_32_nl, fsm_output(0));
  or_dcpl_5 <= or_76_cse OR (fsm_output(2)) OR (fsm_output(6)) OR (fsm_output(0));
  and_dcpl_57 <= (fsm_output(1)) AND (NOT (fsm_output(6)));
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_12 AND and_dcpl_9;
  GROUP_LOOP_j_10_0_sva_9_0_mx0c0 <= and_dcpl_6 AND and_dcpl_23;
  and_77_nl <= (IDX_LOOP_idx2_9_0_sva(0)) AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"));
  nor_25_nl <= NOT((NOT (STAGE_LOOP_op_rshift_psp_1_sva(0))) OR CONV_SL_1_1(fsm_output(5
      DOWNTO 2)/=STD_LOGIC_VECTOR'("0000")));
  mux_83_nl <= MUX_s_1_2_2(and_77_nl, nor_25_nl, fsm_output(0));
  tmp_1_lpi_4_dfm_mx0c1 <= mux_83_nl AND and_dcpl_57;
  IDX_LOOP_mux_10_itm_mx0c1 <= and_dcpl_26 AND and_dcpl_2 AND (fsm_output(0)) AND
      reg_IDX_LOOP_1_lshift_idiv_ftd_9;
  IDX_LOOP_f1_1_sva_mx0c1 <= (NOT mux_tmp_47) AND and_dcpl_5 AND (NOT (fsm_output(0)));
  and_36_nl <= and_dcpl_26 AND and_dcpl_23;
  vec_rsc_0_0_i_radr_d <= MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva_1, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva(9 DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_47 & and_36_nl
      & and_dcpl_49));
  vec_rsc_0_0_i_wadr_d <= MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva(9 DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_43 & and_dcpl_48
      & and_dcpl_46));
  vec_rsc_0_0_i_d_d <= MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_f1_1_sva,
      and_dcpl_48);
  or_41_nl <= (fsm_output(6)) OR (NOT (fsm_output(2))) OR (fsm_output(1)) OR (NOT
      (fsm_output(3)));
  mux_63_nl <= MUX_s_1_2_2(mux_tmp_47, or_tmp_26, STAGE_LOOP_op_rshift_psp_1_sva(0));
  or_39_nl <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (fsm_output(6)) OR (fsm_output(2))
      OR (NOT and_80_cse);
  mux_64_nl <= MUX_s_1_2_2(mux_63_nl, or_39_nl, IDX_LOOP_idx2_9_0_sva(0));
  mux_65_nl <= MUX_s_1_2_2(or_41_nl, mux_64_nl, fsm_output(0));
  vec_rsc_0_0_i_we_d_pff <= (NOT mux_65_nl) AND and_dcpl_11;
  or_44_nl <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) OR CONV_SL_1_1(fsm_output(5 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00001"));
  or_43_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00001"));
  or_42_nl <= (NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm) OR (IDX_LOOP_idx2_9_0_sva(0));
  mux_66_nl <= MUX_s_1_2_2(mux_tmp_51, or_43_nl, or_42_nl);
  mux_67_nl <= MUX_s_1_2_2(or_44_nl, mux_66_nl, fsm_output(0));
  vec_rsc_0_0_i_re_d_pff <= NOT(mux_67_nl OR (fsm_output(6)));
  vec_rsc_0_1_i_radr_d <= MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva_1, IDX_LOOP_idx1_acc_psp_1_sva,
      (IDX_LOOP_idx2_9_0_sva(9 DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_47 & and_dcpl_48
      & and_dcpl_49));
  vec_rsc_0_1_i_wadr_d <= MUX1HOT_v_9_3_2(IDX_LOOP_idx2_acc_psp_sva, (IDX_LOOP_idx2_9_0_sva(9
      DOWNTO 1)), IDX_LOOP_idx1_acc_psp_1_sva, STD_LOGIC_VECTOR'( and_dcpl_43 & and_dcpl_46
      & and_dcpl_42));
  vec_rsc_0_1_i_d_d <= MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_f1_1_sva,
      and_dcpl_42);
  nand_4_nl <= NOT((fsm_output(6)) AND (fsm_output(2)) AND (fsm_output(1)) AND (NOT
      (fsm_output(3))));
  or_30_nl <= (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0))) OR (fsm_output(6)) OR (fsm_output(2))
      OR (NOT and_80_cse);
  mux_57_nl <= MUX_s_1_2_2(or_tmp_26, mux_tmp_47, STAGE_LOOP_op_rshift_psp_1_sva(0));
  mux_58_nl <= MUX_s_1_2_2(or_30_nl, mux_57_nl, IDX_LOOP_idx2_9_0_sva(0));
  mux_59_nl <= MUX_s_1_2_2(nand_4_nl, mux_58_nl, fsm_output(0));
  vec_rsc_0_1_i_we_d_pff <= (NOT mux_59_nl) AND and_dcpl_11;
  or_37_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10")) OR (NOT
      and_cse);
  mux_61_nl <= MUX_s_1_2_2(or_37_nl, mux_tmp_51, STAGE_LOOP_op_rshift_psp_1_sva(0));
  nand_7_nl <= NOT(IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm AND (IDX_LOOP_idx2_9_0_sva(0))
      AND CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")) AND and_cse);
  mux_62_nl <= MUX_s_1_2_2(mux_61_nl, nand_7_nl, fsm_output(0));
  vec_rsc_0_1_i_re_d_pff <= NOT(mux_62_nl OR (fsm_output(6)));
  twiddle_rsc_0_0_i_radr_d_pff <= z_out_4(9 DOWNTO 1);
  twiddle_rsc_0_0_i_re_d_pff <= (NOT (z_out_4(0))) AND and_dcpl_5 AND and_dcpl_31;
  twiddle_rsc_0_1_i_re_d_pff <= (z_out_4(0)) AND and_dcpl_5 AND and_dcpl_31;
  and_104_cse <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("1111000"));
  and_dcpl_106 <= and_dcpl_5 AND (NOT (fsm_output(3))) AND (fsm_output(1)) AND and_dcpl_2
      AND (NOT (fsm_output(0)));
  and_dcpl_116 <= and_dcpl_5 AND (NOT (fsm_output(3))) AND (fsm_output(1));
  and_139_cse <= and_dcpl_116 AND and_dcpl_2 AND (NOT (fsm_output(0)));
  and_dcpl_130 <= and_dcpl_116 AND and_dcpl_23;
  and_dcpl_136 <= and_dcpl_5 AND and_dcpl_4 AND and_dcpl_16;
  mux_nl <= MUX_s_1_2_2(not_tmp_34, and_cse, fsm_output(1));
  and_dcpl_138 <= mux_nl AND and_dcpl_14 AND (fsm_output(0));
  and_dcpl_142 <= (fsm_output(5)) AND (fsm_output(4)) AND (fsm_output(3)) AND (fsm_output(1))
      AND and_dcpl_16;
  and_145_ssc <= and_dcpl_5 AND and_dcpl_4 AND and_dcpl_23;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_i_3_0_sva <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( ((and_dcpl_6 AND and_dcpl_3) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1' )
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
        p_sva <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_tmp_24, and_2_nl, fsm_output(0))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
        reg_ensig_cgo_cse <= '0';
        IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= '0';
        reg_IDX_LOOP_1_lshift_idiv_ftd_9 <= '0';
      ELSE
        reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
        reg_ensig_cgo_cse <= mux_47_rmff;
        IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a <= MUX_v_128_2_2(IDX_LOOP_1_mul_mut, z_out_3,
            mux_54_nl);
        reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= and_dcpl_12 AND and_dcpl_8 AND (fsm_output(0))
            AND STAGE_LOOP_acc_itm_4_1;
        reg_IDX_LOOP_1_lshift_idiv_ftd_9 <= z_out_4(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_gp_lshift_psp_sva <= STD_LOGIC_VECTOR'( "0000000000");
        STAGE_LOOP_op_rshift_psp_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
        STAGE_LOOP_gp_acc_psp_sva <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( mux_69_itm = '1' ) THEN
        STAGE_LOOP_gp_lshift_psp_sva <= z_out_4;
        STAGE_LOOP_op_rshift_psp_1_sva <= STAGE_LOOP_op_rshift_itm;
        STAGE_LOOP_gp_acc_psp_sva <= z_out_2(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        GROUP_LOOP_j_10_0_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (GROUP_LOOP_j_10_0_sva_9_0_mx0c0 OR (and_dcpl_12 AND and_dcpl_8 AND
          (NOT (fsm_output(0))))) = '1' ) THEN
        GROUP_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out(9 DOWNTO 0)), GROUP_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_t_10_1_sva_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_92_nl, and_cse, fsm_output(6))) = '1' ) THEN
        IDX_LOOP_t_10_1_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), reg_IDX_LOOP_t_10_1_ftd_1,
            or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_acc_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( or_dcpl_5 = '0' ) THEN
        IDX_LOOP_idx2_acc_psp_sva <= IDX_LOOP_idx2_acc_psp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= '0';
      ELSIF ( or_dcpl_5 = '0' ) THEN
        IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= z_out(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx1_acc_psp_1_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_tmp_4, mux_16_cse, fsm_output(0))) = '1' ) THEN
        IDX_LOOP_idx1_acc_psp_1_sva <= IDX_LOOP_idx1_acc_psp_1_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_9_0_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2(mux_tmp_4, (NOT mux_78_nl), fsm_output(0))) = '1' ) THEN
        IDX_LOOP_idx2_9_0_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_1_sva_mx0w0
            & '1') + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= '0';
      ELSIF ( (MUX_s_1_2_2(mux_18_nl, mux_16_cse, fsm_output(0))) = '1' ) THEN
        IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= z_out_1_10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_1_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((mux_82_nl AND and_dcpl_57) OR tmp_1_lpi_4_dfm_mx0c1) = '1' ) THEN
        tmp_1_lpi_4_dfm <= MUX_v_64_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, tmp_1_lpi_4_dfm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_mux_10_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((and_dcpl_26 AND and_dcpl_2 AND (fsm_output(0)) AND (NOT reg_IDX_LOOP_1_lshift_idiv_ftd_9))
          OR IDX_LOOP_mux_10_itm_mx0c1) = '1' ) THEN
        IDX_LOOP_mux_10_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            IDX_LOOP_mux_10_itm_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (and_dcpl_17 OR IDX_LOOP_f1_1_sva_mx0c1 OR and_dcpl_49) = '1' ) THEN
        IDX_LOOP_f1_1_sva <= MUX1HOT_v_64_3_2(vec_rsc_0_0_i_q_d, IDX_LOOP_1_modulo_dev_cmp_return_rsc_z,
            vec_rsc_0_1_i_q_d, STD_LOGIC_VECTOR'( and_dcpl_17 & IDX_LOOP_f1_1_sva_mx0c1
            & and_dcpl_49));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_mux_1_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_25_nl, mux_23_nl, fsm_output(0))) = '1' ) THEN
        IDX_LOOP_mux_1_itm <= MUX_v_64_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            and_75_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_1_mul_mut <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( ((not_tmp_35 AND and_dcpl_23) OR (and_dcpl_26 AND and_dcpl_9)) = '1'
          ) THEN
        IDX_LOOP_1_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_IDX_LOOP_t_10_1_ftd_1 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( or_dcpl_5 = '0' ) THEN
        reg_IDX_LOOP_t_10_1_ftd_1 <= z_out_2(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  and_2_nl <= (fsm_output(6)) AND nor_tmp_9;
  nor_28_nl <= NOT(and_80_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  mux_52_nl <= MUX_s_1_2_2(nor_28_nl, mux_tmp_35, fsm_output(2));
  and_81_nl <= ((fsm_output(1)) OR (fsm_output(3))) AND CONV_SL_1_1(fsm_output(5
      DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  mux_51_nl <= MUX_s_1_2_2(mux_tmp_35, and_81_nl, fsm_output(2));
  mux_53_nl <= MUX_s_1_2_2(mux_52_nl, mux_51_nl, fsm_output(6));
  and_82_nl <= or_73_cse AND (fsm_output(3));
  mux_49_nl <= MUX_s_1_2_2(and_dcpl_5, and_dcpl_11, and_82_nl);
  mux_48_nl <= MUX_s_1_2_2(and_dcpl_5, and_dcpl_11, or_22_cse);
  mux_50_nl <= MUX_s_1_2_2(mux_49_nl, mux_48_nl, fsm_output(6));
  mux_54_nl <= MUX_s_1_2_2(mux_53_nl, mux_50_nl, fsm_output(0));
  GROUP_LOOP_j_not_1_nl <= NOT GROUP_LOOP_j_10_0_sva_9_0_mx0c0;
  nand_8_nl <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 3)=STD_LOGIC_VECTOR'("1111")));
  or_15_nl <= CONV_SL_1_1(fsm_output(6 DOWNTO 3)/=STD_LOGIC_VECTOR'("0000"));
  mux_70_nl <= MUX_s_1_2_2(nand_8_nl, or_15_nl, fsm_output(0));
  or_nl <= mux_70_nl OR CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_80_nl <= (fsm_output(0)) OR (NOT (fsm_output(1))) OR (fsm_output(3)) OR (fsm_output(4))
      OR (fsm_output(5));
  nand_9_nl <= NOT((fsm_output(1)) AND (fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(5)));
  mux_92_nl <= MUX_s_1_2_2(or_80_nl, nand_9_nl, fsm_output(2));
  nand_1_nl <= NOT(or_22_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  mux_78_nl <= MUX_s_1_2_2(or_tmp_3, nand_1_nl, fsm_output(6));
  mux_18_nl <= MUX_s_1_2_2((NOT or_tmp_5), and_cse, fsm_output(6));
  nor_26_nl <= NOT((IDX_LOOP_idx2_9_0_sva(0)) OR CONV_SL_1_1(fsm_output(5 DOWNTO
      2)/=STD_LOGIC_VECTOR'("1111")));
  nor_27_nl <= NOT((STAGE_LOOP_op_rshift_psp_1_sva(0)) OR CONV_SL_1_1(fsm_output(5
      DOWNTO 2)/=STD_LOGIC_VECTOR'("0000")));
  mux_82_nl <= MUX_s_1_2_2(nor_26_nl, nor_27_nl, fsm_output(0));
  and_75_nl <= and_dcpl_6 AND and_dcpl_14 AND (NOT (fsm_output(0))) AND reg_IDX_LOOP_1_lshift_idiv_ftd_9;
  nor_35_nl <= NOT(and_88_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  mux_25_nl <= MUX_s_1_2_2(nor_35_nl, or_tmp_5, fsm_output(6));
  mux_23_nl <= MUX_s_1_2_2((NOT or_tmp_5), or_tmp_3, fsm_output(6));
  IDX_LOOP_mux_13_nl <= MUX_v_10_2_2((NOT STAGE_LOOP_op_rshift_psp_1_sva), GROUP_LOOP_j_10_0_sva_9_0,
      and_104_cse);
  IDX_LOOP_IDX_LOOP_nand_1_nl <= NOT(and_104_cse AND (NOT(and_dcpl_5 AND (NOT (fsm_output(3)))
      AND (fsm_output(1)) AND (NOT((fsm_output(2)) OR (fsm_output(6)) OR (fsm_output(0)))))));
  not_273_nl <= NOT and_104_cse;
  IDX_LOOP_IDX_LOOP_and_1_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), IDX_LOOP_t_10_1_sva_8_0,
      not_273_nl);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((NOT and_104_cse) & IDX_LOOP_mux_13_nl
      & IDX_LOOP_IDX_LOOP_nand_1_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_IDX_LOOP_and_1_nl
      & STD_LOGIC_VECTOR'( "11")), 11), 12), 12));
  z_out <= acc_nl(11 DOWNTO 1);
  IDX_LOOP_mux_14_nl <= MUX_v_11_2_2((z_out_2 & '0'), z_out, and_104_cse);
  IDX_LOOP_mux_15_nl <= MUX_v_10_2_2((NOT STAGE_LOOP_op_rshift_psp_1_sva), (NOT STAGE_LOOP_gp_lshift_psp_sva),
      and_104_cse);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_mux_14_nl & '1') +
      UNSIGNED('1' & IDX_LOOP_mux_15_nl & '1'), 12));
  z_out_1_10 <= acc_1_nl(11);
  STAGE_LOOP_gp_mux_5_nl <= MUX_v_9_2_2((STD_LOGIC_VECTOR'( "00000") & STAGE_LOOP_i_3_0_sva),
      IDX_LOOP_t_10_1_sva_8_0, and_dcpl_106);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_gp_mux_5_nl),
      10) + CONV_UNSIGNED(CONV_SIGNED(SIGNED'( (NOT and_dcpl_106) & '1'), 2), 10),
      10));
  and_165_nl <= and_dcpl_5 AND (fsm_output(3)) AND (NOT (fsm_output(1))) AND and_dcpl_2
      AND (fsm_output(0));
  and_166_nl <= and_dcpl_116 AND (NOT (fsm_output(2))) AND (fsm_output(6)) AND (fsm_output(0));
  IDX_LOOP_mux1h_11_nl <= MUX1HOT_v_64_3_2(IDX_LOOP_mux_10_itm, IDX_LOOP_mux_1_itm,
      (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & (GROUP_LOOP_j_10_0_sva_9_0(8 DOWNTO 0))), STD_LOGIC_VECTOR'( and_165_nl &
      and_166_nl & and_139_cse));
  IDX_LOOP_mux_16_nl <= MUX_v_64_2_2(IDX_LOOP_1_modulo_dev_cmp_return_rsc_z, (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000000") & (STAGE_LOOP_op_rshift_psp_1_sva(8
      DOWNTO 0))), and_139_cse);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(IDX_LOOP_mux1h_11_nl)
      * UNSIGNED(IDX_LOOP_mux_16_nl)), 128));
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_re : OUT STD_LOGIC;
    vec_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_0_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_re : OUT STD_LOGIC;
    vec_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    vec_rsc_0_1_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_0_re : OUT STD_LOGIC;
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    twiddle_rsc_0_1_re : OUT STD_LOGIC;
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC
  );
END DIT_RELOOP;

ARCHITECTURE v2 OF DIT_RELOOP IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_re_d_iff : STD_LOGIC;

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_0_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_0_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_1_i_wadr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      vec_rsc_0_1_i_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL DIT_RELOOP_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (8
      DOWNTO 0);

BEGIN
  vec_rsc_0_0_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_9_512_512_64_5_gen
    PORT MAP(
      we => vec_rsc_0_0_we,
      d => vec_rsc_0_0_i_d,
      wadr => vec_rsc_0_0_i_wadr,
      q => vec_rsc_0_0_i_q,
      re => vec_rsc_0_0_re,
      radr => vec_rsc_0_0_i_radr,
      radr_d => vec_rsc_0_0_i_radr_d_1,
      wadr_d => vec_rsc_0_0_i_wadr_d_1,
      d_d => vec_rsc_0_0_i_d_d_1,
      we_d => vec_rsc_0_0_i_we_d_iff,
      re_d => vec_rsc_0_0_i_re_d_iff,
      q_d => vec_rsc_0_0_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_0_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_0_i_we_d_iff
    );
  vec_rsc_0_0_d <= vec_rsc_0_0_i_d;
  vec_rsc_0_0_wadr <= vec_rsc_0_0_i_wadr;
  vec_rsc_0_0_i_q <= vec_rsc_0_0_q;
  vec_rsc_0_0_radr <= vec_rsc_0_0_i_radr;
  vec_rsc_0_0_i_radr_d_1 <= vec_rsc_0_0_i_radr_d;
  vec_rsc_0_0_i_wadr_d_1 <= vec_rsc_0_0_i_wadr_d;
  vec_rsc_0_0_i_d_d_1 <= vec_rsc_0_0_i_d_d;
  vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d_1;

  vec_rsc_0_1_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_9_512_512_64_5_gen
    PORT MAP(
      we => vec_rsc_0_1_we,
      d => vec_rsc_0_1_i_d,
      wadr => vec_rsc_0_1_i_wadr,
      q => vec_rsc_0_1_i_q,
      re => vec_rsc_0_1_re,
      radr => vec_rsc_0_1_i_radr,
      radr_d => vec_rsc_0_1_i_radr_d_1,
      wadr_d => vec_rsc_0_1_i_wadr_d_1,
      d_d => vec_rsc_0_1_i_d_d_1,
      we_d => vec_rsc_0_1_i_we_d_iff,
      re_d => vec_rsc_0_1_i_re_d_iff,
      q_d => vec_rsc_0_1_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_1_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_1_i_we_d_iff
    );
  vec_rsc_0_1_d <= vec_rsc_0_1_i_d;
  vec_rsc_0_1_wadr <= vec_rsc_0_1_i_wadr;
  vec_rsc_0_1_i_q <= vec_rsc_0_1_q;
  vec_rsc_0_1_radr <= vec_rsc_0_1_i_radr;
  vec_rsc_0_1_i_radr_d_1 <= vec_rsc_0_1_i_radr_d;
  vec_rsc_0_1_i_wadr_d_1 <= vec_rsc_0_1_i_wadr_d;
  vec_rsc_0_1_i_d_d_1 <= vec_rsc_0_1_i_d_d;
  vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d_1;

  twiddle_rsc_0_0_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_11_64_9_512_512_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_0_i_q,
      re => twiddle_rsc_0_0_re,
      radr => twiddle_rsc_0_0_i_radr,
      radr_d => twiddle_rsc_0_0_i_radr_d,
      re_d => twiddle_rsc_0_0_i_re_d_iff,
      q_d => twiddle_rsc_0_0_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_re_d_iff
    );
  twiddle_rsc_0_0_i_q <= twiddle_rsc_0_0_q;
  twiddle_rsc_0_0_radr <= twiddle_rsc_0_0_i_radr;
  twiddle_rsc_0_0_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;
  twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d_1;

  twiddle_rsc_0_1_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_12_64_9_512_512_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_1_i_q,
      re => twiddle_rsc_0_1_re,
      radr => twiddle_rsc_0_1_i_radr,
      radr_d => twiddle_rsc_0_1_i_radr_d,
      re_d => twiddle_rsc_0_1_i_re_d_iff,
      q_d => twiddle_rsc_0_1_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_re_d_iff
    );
  twiddle_rsc_0_1_i_q <= twiddle_rsc_0_1_q;
  twiddle_rsc_0_1_radr <= twiddle_rsc_0_1_i_radr;
  twiddle_rsc_0_1_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;
  twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d_1;

  DIT_RELOOP_core_inst : DIT_RELOOP_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      p_rsc_dat => DIT_RELOOP_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      vec_rsc_0_0_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d,
      vec_rsc_0_0_i_wadr_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d,
      vec_rsc_0_0_i_d_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d,
      vec_rsc_0_0_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d,
      vec_rsc_0_1_i_wadr_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d,
      vec_rsc_0_1_i_d_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d,
      vec_rsc_0_1_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d,
      twiddle_rsc_0_0_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d,
      vec_rsc_0_0_i_we_d_pff => vec_rsc_0_0_i_we_d_iff,
      vec_rsc_0_0_i_re_d_pff => vec_rsc_0_0_i_re_d_iff,
      vec_rsc_0_1_i_we_d_pff => vec_rsc_0_1_i_we_d_iff,
      vec_rsc_0_1_i_re_d_pff => vec_rsc_0_1_i_re_d_iff,
      twiddle_rsc_0_0_i_radr_d_pff => DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff,
      twiddle_rsc_0_0_i_re_d_pff => twiddle_rsc_0_0_i_re_d_iff,
      twiddle_rsc_0_1_i_re_d_pff => twiddle_rsc_0_1_i_re_d_iff
    );
  DIT_RELOOP_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsc_0_0_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d;
  vec_rsc_0_0_i_wadr_d <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d;
  vec_rsc_0_0_i_d_d <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d;
  DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d;
  vec_rsc_0_1_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d;
  vec_rsc_0_1_i_wadr_d <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d;
  vec_rsc_0_1_i_d_d <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d;
  DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  twiddle_rsc_0_0_i_radr_d_iff <= DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff;

END v2;



