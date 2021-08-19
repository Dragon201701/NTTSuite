
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
--  Generated date: Wed Aug 18 22:09:40 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

-- ------------------------------------------------------------------
--  Design Unit:    DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
    port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
  );
END DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen;

ARCHITECTURE v3 OF DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen
    IS
  -- Default Constants

BEGIN
  we <= (port_1_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v3;

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
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    IDX_LOOP_C_59_tr0 : IN STD_LOGIC;
    IDX_LOOP_C_117_tr0 : IN STD_LOGIC;
    IDX_LOOP_C_175_tr0 : IN STD_LOGIC;
    IDX_LOOP_C_233_tr0 : IN STD_LOGIC;
    GROUP_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END DIT_RELOOP_core_core_fsm;

ARCHITECTURE v3 OF DIT_RELOOP_core_core_fsm IS
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
      IDX_LOOP_C_118, IDX_LOOP_C_119, IDX_LOOP_C_120, IDX_LOOP_C_121, IDX_LOOP_C_122,
      IDX_LOOP_C_123, IDX_LOOP_C_124, IDX_LOOP_C_125, IDX_LOOP_C_126, IDX_LOOP_C_127,
      IDX_LOOP_C_128, IDX_LOOP_C_129, IDX_LOOP_C_130, IDX_LOOP_C_131, IDX_LOOP_C_132,
      IDX_LOOP_C_133, IDX_LOOP_C_134, IDX_LOOP_C_135, IDX_LOOP_C_136, IDX_LOOP_C_137,
      IDX_LOOP_C_138, IDX_LOOP_C_139, IDX_LOOP_C_140, IDX_LOOP_C_141, IDX_LOOP_C_142,
      IDX_LOOP_C_143, IDX_LOOP_C_144, IDX_LOOP_C_145, IDX_LOOP_C_146, IDX_LOOP_C_147,
      IDX_LOOP_C_148, IDX_LOOP_C_149, IDX_LOOP_C_150, IDX_LOOP_C_151, IDX_LOOP_C_152,
      IDX_LOOP_C_153, IDX_LOOP_C_154, IDX_LOOP_C_155, IDX_LOOP_C_156, IDX_LOOP_C_157,
      IDX_LOOP_C_158, IDX_LOOP_C_159, IDX_LOOP_C_160, IDX_LOOP_C_161, IDX_LOOP_C_162,
      IDX_LOOP_C_163, IDX_LOOP_C_164, IDX_LOOP_C_165, IDX_LOOP_C_166, IDX_LOOP_C_167,
      IDX_LOOP_C_168, IDX_LOOP_C_169, IDX_LOOP_C_170, IDX_LOOP_C_171, IDX_LOOP_C_172,
      IDX_LOOP_C_173, IDX_LOOP_C_174, IDX_LOOP_C_175, IDX_LOOP_C_176, IDX_LOOP_C_177,
      IDX_LOOP_C_178, IDX_LOOP_C_179, IDX_LOOP_C_180, IDX_LOOP_C_181, IDX_LOOP_C_182,
      IDX_LOOP_C_183, IDX_LOOP_C_184, IDX_LOOP_C_185, IDX_LOOP_C_186, IDX_LOOP_C_187,
      IDX_LOOP_C_188, IDX_LOOP_C_189, IDX_LOOP_C_190, IDX_LOOP_C_191, IDX_LOOP_C_192,
      IDX_LOOP_C_193, IDX_LOOP_C_194, IDX_LOOP_C_195, IDX_LOOP_C_196, IDX_LOOP_C_197,
      IDX_LOOP_C_198, IDX_LOOP_C_199, IDX_LOOP_C_200, IDX_LOOP_C_201, IDX_LOOP_C_202,
      IDX_LOOP_C_203, IDX_LOOP_C_204, IDX_LOOP_C_205, IDX_LOOP_C_206, IDX_LOOP_C_207,
      IDX_LOOP_C_208, IDX_LOOP_C_209, IDX_LOOP_C_210, IDX_LOOP_C_211, IDX_LOOP_C_212,
      IDX_LOOP_C_213, IDX_LOOP_C_214, IDX_LOOP_C_215, IDX_LOOP_C_216, IDX_LOOP_C_217,
      IDX_LOOP_C_218, IDX_LOOP_C_219, IDX_LOOP_C_220, IDX_LOOP_C_221, IDX_LOOP_C_222,
      IDX_LOOP_C_223, IDX_LOOP_C_224, IDX_LOOP_C_225, IDX_LOOP_C_226, IDX_LOOP_C_227,
      IDX_LOOP_C_228, IDX_LOOP_C_229, IDX_LOOP_C_230, IDX_LOOP_C_231, IDX_LOOP_C_232,
      IDX_LOOP_C_233, GROUP_LOOP_C_0, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : DIT_RELOOP_core_core_fsm_1_ST;
  SIGNAL state_var_NS : DIT_RELOOP_core_core_fsm_1_ST;

BEGIN
  DIT_RELOOP_core_core_fsm_1 : PROCESS (IDX_LOOP_C_59_tr0, IDX_LOOP_C_117_tr0, IDX_LOOP_C_175_tr0,
      IDX_LOOP_C_233_tr0, GROUP_LOOP_C_0_tr0, STAGE_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= IDX_LOOP_C_0;
      WHEN IDX_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= IDX_LOOP_C_1;
      WHEN IDX_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        state_var_NS <= IDX_LOOP_C_2;
      WHEN IDX_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= IDX_LOOP_C_3;
      WHEN IDX_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= IDX_LOOP_C_4;
      WHEN IDX_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= IDX_LOOP_C_5;
      WHEN IDX_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= IDX_LOOP_C_6;
      WHEN IDX_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= IDX_LOOP_C_7;
      WHEN IDX_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= IDX_LOOP_C_8;
      WHEN IDX_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= IDX_LOOP_C_9;
      WHEN IDX_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= IDX_LOOP_C_10;
      WHEN IDX_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= IDX_LOOP_C_11;
      WHEN IDX_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= IDX_LOOP_C_12;
      WHEN IDX_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= IDX_LOOP_C_13;
      WHEN IDX_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= IDX_LOOP_C_14;
      WHEN IDX_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= IDX_LOOP_C_15;
      WHEN IDX_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= IDX_LOOP_C_16;
      WHEN IDX_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= IDX_LOOP_C_17;
      WHEN IDX_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= IDX_LOOP_C_18;
      WHEN IDX_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= IDX_LOOP_C_19;
      WHEN IDX_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= IDX_LOOP_C_20;
      WHEN IDX_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= IDX_LOOP_C_21;
      WHEN IDX_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= IDX_LOOP_C_22;
      WHEN IDX_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= IDX_LOOP_C_23;
      WHEN IDX_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= IDX_LOOP_C_24;
      WHEN IDX_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= IDX_LOOP_C_25;
      WHEN IDX_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= IDX_LOOP_C_26;
      WHEN IDX_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= IDX_LOOP_C_27;
      WHEN IDX_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= IDX_LOOP_C_28;
      WHEN IDX_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= IDX_LOOP_C_29;
      WHEN IDX_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= IDX_LOOP_C_30;
      WHEN IDX_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= IDX_LOOP_C_31;
      WHEN IDX_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= IDX_LOOP_C_32;
      WHEN IDX_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= IDX_LOOP_C_33;
      WHEN IDX_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= IDX_LOOP_C_34;
      WHEN IDX_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= IDX_LOOP_C_35;
      WHEN IDX_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= IDX_LOOP_C_36;
      WHEN IDX_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= IDX_LOOP_C_37;
      WHEN IDX_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= IDX_LOOP_C_38;
      WHEN IDX_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= IDX_LOOP_C_39;
      WHEN IDX_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= IDX_LOOP_C_40;
      WHEN IDX_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= IDX_LOOP_C_41;
      WHEN IDX_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= IDX_LOOP_C_42;
      WHEN IDX_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= IDX_LOOP_C_43;
      WHEN IDX_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= IDX_LOOP_C_44;
      WHEN IDX_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= IDX_LOOP_C_45;
      WHEN IDX_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= IDX_LOOP_C_46;
      WHEN IDX_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= IDX_LOOP_C_47;
      WHEN IDX_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= IDX_LOOP_C_48;
      WHEN IDX_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= IDX_LOOP_C_49;
      WHEN IDX_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= IDX_LOOP_C_50;
      WHEN IDX_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= IDX_LOOP_C_51;
      WHEN IDX_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= IDX_LOOP_C_52;
      WHEN IDX_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= IDX_LOOP_C_53;
      WHEN IDX_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= IDX_LOOP_C_54;
      WHEN IDX_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= IDX_LOOP_C_55;
      WHEN IDX_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= IDX_LOOP_C_56;
      WHEN IDX_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= IDX_LOOP_C_57;
      WHEN IDX_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= IDX_LOOP_C_58;
      WHEN IDX_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= IDX_LOOP_C_59;
      WHEN IDX_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        IF ( IDX_LOOP_C_59_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_60;
        END IF;
      WHEN IDX_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= IDX_LOOP_C_61;
      WHEN IDX_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= IDX_LOOP_C_62;
      WHEN IDX_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= IDX_LOOP_C_63;
      WHEN IDX_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= IDX_LOOP_C_64;
      WHEN IDX_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= IDX_LOOP_C_65;
      WHEN IDX_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= IDX_LOOP_C_66;
      WHEN IDX_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= IDX_LOOP_C_67;
      WHEN IDX_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= IDX_LOOP_C_68;
      WHEN IDX_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= IDX_LOOP_C_69;
      WHEN IDX_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= IDX_LOOP_C_70;
      WHEN IDX_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= IDX_LOOP_C_71;
      WHEN IDX_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= IDX_LOOP_C_72;
      WHEN IDX_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= IDX_LOOP_C_73;
      WHEN IDX_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= IDX_LOOP_C_74;
      WHEN IDX_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= IDX_LOOP_C_75;
      WHEN IDX_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= IDX_LOOP_C_76;
      WHEN IDX_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= IDX_LOOP_C_77;
      WHEN IDX_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= IDX_LOOP_C_78;
      WHEN IDX_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= IDX_LOOP_C_79;
      WHEN IDX_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= IDX_LOOP_C_80;
      WHEN IDX_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= IDX_LOOP_C_81;
      WHEN IDX_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= IDX_LOOP_C_82;
      WHEN IDX_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= IDX_LOOP_C_83;
      WHEN IDX_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= IDX_LOOP_C_84;
      WHEN IDX_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= IDX_LOOP_C_85;
      WHEN IDX_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= IDX_LOOP_C_86;
      WHEN IDX_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= IDX_LOOP_C_87;
      WHEN IDX_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= IDX_LOOP_C_88;
      WHEN IDX_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= IDX_LOOP_C_89;
      WHEN IDX_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= IDX_LOOP_C_90;
      WHEN IDX_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= IDX_LOOP_C_91;
      WHEN IDX_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= IDX_LOOP_C_92;
      WHEN IDX_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= IDX_LOOP_C_93;
      WHEN IDX_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= IDX_LOOP_C_94;
      WHEN IDX_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= IDX_LOOP_C_95;
      WHEN IDX_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= IDX_LOOP_C_96;
      WHEN IDX_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= IDX_LOOP_C_97;
      WHEN IDX_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= IDX_LOOP_C_98;
      WHEN IDX_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= IDX_LOOP_C_99;
      WHEN IDX_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= IDX_LOOP_C_100;
      WHEN IDX_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= IDX_LOOP_C_101;
      WHEN IDX_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= IDX_LOOP_C_102;
      WHEN IDX_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= IDX_LOOP_C_103;
      WHEN IDX_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= IDX_LOOP_C_104;
      WHEN IDX_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= IDX_LOOP_C_105;
      WHEN IDX_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= IDX_LOOP_C_106;
      WHEN IDX_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= IDX_LOOP_C_107;
      WHEN IDX_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= IDX_LOOP_C_108;
      WHEN IDX_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= IDX_LOOP_C_109;
      WHEN IDX_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= IDX_LOOP_C_110;
      WHEN IDX_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= IDX_LOOP_C_111;
      WHEN IDX_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= IDX_LOOP_C_112;
      WHEN IDX_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= IDX_LOOP_C_113;
      WHEN IDX_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= IDX_LOOP_C_114;
      WHEN IDX_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= IDX_LOOP_C_115;
      WHEN IDX_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= IDX_LOOP_C_116;
      WHEN IDX_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= IDX_LOOP_C_117;
      WHEN IDX_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        IF ( IDX_LOOP_C_117_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_118;
        END IF;
      WHEN IDX_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= IDX_LOOP_C_119;
      WHEN IDX_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= IDX_LOOP_C_120;
      WHEN IDX_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= IDX_LOOP_C_121;
      WHEN IDX_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= IDX_LOOP_C_122;
      WHEN IDX_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= IDX_LOOP_C_123;
      WHEN IDX_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= IDX_LOOP_C_124;
      WHEN IDX_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= IDX_LOOP_C_125;
      WHEN IDX_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= IDX_LOOP_C_126;
      WHEN IDX_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= IDX_LOOP_C_127;
      WHEN IDX_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= IDX_LOOP_C_128;
      WHEN IDX_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= IDX_LOOP_C_129;
      WHEN IDX_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= IDX_LOOP_C_130;
      WHEN IDX_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= IDX_LOOP_C_131;
      WHEN IDX_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= IDX_LOOP_C_132;
      WHEN IDX_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= IDX_LOOP_C_133;
      WHEN IDX_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= IDX_LOOP_C_134;
      WHEN IDX_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= IDX_LOOP_C_135;
      WHEN IDX_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= IDX_LOOP_C_136;
      WHEN IDX_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= IDX_LOOP_C_137;
      WHEN IDX_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= IDX_LOOP_C_138;
      WHEN IDX_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= IDX_LOOP_C_139;
      WHEN IDX_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= IDX_LOOP_C_140;
      WHEN IDX_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= IDX_LOOP_C_141;
      WHEN IDX_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= IDX_LOOP_C_142;
      WHEN IDX_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= IDX_LOOP_C_143;
      WHEN IDX_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= IDX_LOOP_C_144;
      WHEN IDX_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= IDX_LOOP_C_145;
      WHEN IDX_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= IDX_LOOP_C_146;
      WHEN IDX_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= IDX_LOOP_C_147;
      WHEN IDX_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= IDX_LOOP_C_148;
      WHEN IDX_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= IDX_LOOP_C_149;
      WHEN IDX_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= IDX_LOOP_C_150;
      WHEN IDX_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= IDX_LOOP_C_151;
      WHEN IDX_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= IDX_LOOP_C_152;
      WHEN IDX_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= IDX_LOOP_C_153;
      WHEN IDX_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= IDX_LOOP_C_154;
      WHEN IDX_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= IDX_LOOP_C_155;
      WHEN IDX_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= IDX_LOOP_C_156;
      WHEN IDX_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= IDX_LOOP_C_157;
      WHEN IDX_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= IDX_LOOP_C_158;
      WHEN IDX_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= IDX_LOOP_C_159;
      WHEN IDX_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= IDX_LOOP_C_160;
      WHEN IDX_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= IDX_LOOP_C_161;
      WHEN IDX_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= IDX_LOOP_C_162;
      WHEN IDX_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= IDX_LOOP_C_163;
      WHEN IDX_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= IDX_LOOP_C_164;
      WHEN IDX_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= IDX_LOOP_C_165;
      WHEN IDX_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= IDX_LOOP_C_166;
      WHEN IDX_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= IDX_LOOP_C_167;
      WHEN IDX_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= IDX_LOOP_C_168;
      WHEN IDX_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= IDX_LOOP_C_169;
      WHEN IDX_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= IDX_LOOP_C_170;
      WHEN IDX_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= IDX_LOOP_C_171;
      WHEN IDX_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= IDX_LOOP_C_172;
      WHEN IDX_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= IDX_LOOP_C_173;
      WHEN IDX_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= IDX_LOOP_C_174;
      WHEN IDX_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= IDX_LOOP_C_175;
      WHEN IDX_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        IF ( IDX_LOOP_C_175_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_176;
        END IF;
      WHEN IDX_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= IDX_LOOP_C_177;
      WHEN IDX_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= IDX_LOOP_C_178;
      WHEN IDX_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= IDX_LOOP_C_179;
      WHEN IDX_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= IDX_LOOP_C_180;
      WHEN IDX_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= IDX_LOOP_C_181;
      WHEN IDX_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= IDX_LOOP_C_182;
      WHEN IDX_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        state_var_NS <= IDX_LOOP_C_183;
      WHEN IDX_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        state_var_NS <= IDX_LOOP_C_184;
      WHEN IDX_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        state_var_NS <= IDX_LOOP_C_185;
      WHEN IDX_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= IDX_LOOP_C_186;
      WHEN IDX_LOOP_C_186 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        state_var_NS <= IDX_LOOP_C_187;
      WHEN IDX_LOOP_C_187 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        state_var_NS <= IDX_LOOP_C_188;
      WHEN IDX_LOOP_C_188 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
        state_var_NS <= IDX_LOOP_C_189;
      WHEN IDX_LOOP_C_189 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111111");
        state_var_NS <= IDX_LOOP_C_190;
      WHEN IDX_LOOP_C_190 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000000");
        state_var_NS <= IDX_LOOP_C_191;
      WHEN IDX_LOOP_C_191 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000001");
        state_var_NS <= IDX_LOOP_C_192;
      WHEN IDX_LOOP_C_192 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000010");
        state_var_NS <= IDX_LOOP_C_193;
      WHEN IDX_LOOP_C_193 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000011");
        state_var_NS <= IDX_LOOP_C_194;
      WHEN IDX_LOOP_C_194 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000100");
        state_var_NS <= IDX_LOOP_C_195;
      WHEN IDX_LOOP_C_195 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000101");
        state_var_NS <= IDX_LOOP_C_196;
      WHEN IDX_LOOP_C_196 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000110");
        state_var_NS <= IDX_LOOP_C_197;
      WHEN IDX_LOOP_C_197 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000111");
        state_var_NS <= IDX_LOOP_C_198;
      WHEN IDX_LOOP_C_198 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001000");
        state_var_NS <= IDX_LOOP_C_199;
      WHEN IDX_LOOP_C_199 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001001");
        state_var_NS <= IDX_LOOP_C_200;
      WHEN IDX_LOOP_C_200 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001010");
        state_var_NS <= IDX_LOOP_C_201;
      WHEN IDX_LOOP_C_201 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001011");
        state_var_NS <= IDX_LOOP_C_202;
      WHEN IDX_LOOP_C_202 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001100");
        state_var_NS <= IDX_LOOP_C_203;
      WHEN IDX_LOOP_C_203 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001101");
        state_var_NS <= IDX_LOOP_C_204;
      WHEN IDX_LOOP_C_204 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001110");
        state_var_NS <= IDX_LOOP_C_205;
      WHEN IDX_LOOP_C_205 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11001111");
        state_var_NS <= IDX_LOOP_C_206;
      WHEN IDX_LOOP_C_206 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010000");
        state_var_NS <= IDX_LOOP_C_207;
      WHEN IDX_LOOP_C_207 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010001");
        state_var_NS <= IDX_LOOP_C_208;
      WHEN IDX_LOOP_C_208 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010010");
        state_var_NS <= IDX_LOOP_C_209;
      WHEN IDX_LOOP_C_209 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010011");
        state_var_NS <= IDX_LOOP_C_210;
      WHEN IDX_LOOP_C_210 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010100");
        state_var_NS <= IDX_LOOP_C_211;
      WHEN IDX_LOOP_C_211 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010101");
        state_var_NS <= IDX_LOOP_C_212;
      WHEN IDX_LOOP_C_212 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010110");
        state_var_NS <= IDX_LOOP_C_213;
      WHEN IDX_LOOP_C_213 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11010111");
        state_var_NS <= IDX_LOOP_C_214;
      WHEN IDX_LOOP_C_214 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011000");
        state_var_NS <= IDX_LOOP_C_215;
      WHEN IDX_LOOP_C_215 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011001");
        state_var_NS <= IDX_LOOP_C_216;
      WHEN IDX_LOOP_C_216 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011010");
        state_var_NS <= IDX_LOOP_C_217;
      WHEN IDX_LOOP_C_217 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011011");
        state_var_NS <= IDX_LOOP_C_218;
      WHEN IDX_LOOP_C_218 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011100");
        state_var_NS <= IDX_LOOP_C_219;
      WHEN IDX_LOOP_C_219 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011101");
        state_var_NS <= IDX_LOOP_C_220;
      WHEN IDX_LOOP_C_220 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011110");
        state_var_NS <= IDX_LOOP_C_221;
      WHEN IDX_LOOP_C_221 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11011111");
        state_var_NS <= IDX_LOOP_C_222;
      WHEN IDX_LOOP_C_222 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100000");
        state_var_NS <= IDX_LOOP_C_223;
      WHEN IDX_LOOP_C_223 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100001");
        state_var_NS <= IDX_LOOP_C_224;
      WHEN IDX_LOOP_C_224 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100010");
        state_var_NS <= IDX_LOOP_C_225;
      WHEN IDX_LOOP_C_225 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100011");
        state_var_NS <= IDX_LOOP_C_226;
      WHEN IDX_LOOP_C_226 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100100");
        state_var_NS <= IDX_LOOP_C_227;
      WHEN IDX_LOOP_C_227 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100101");
        state_var_NS <= IDX_LOOP_C_228;
      WHEN IDX_LOOP_C_228 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100110");
        state_var_NS <= IDX_LOOP_C_229;
      WHEN IDX_LOOP_C_229 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11100111");
        state_var_NS <= IDX_LOOP_C_230;
      WHEN IDX_LOOP_C_230 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101000");
        state_var_NS <= IDX_LOOP_C_231;
      WHEN IDX_LOOP_C_231 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101001");
        state_var_NS <= IDX_LOOP_C_232;
      WHEN IDX_LOOP_C_232 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101010");
        state_var_NS <= IDX_LOOP_C_233;
      WHEN IDX_LOOP_C_233 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101011");
        IF ( IDX_LOOP_C_233_tr0 = '1' ) THEN
          state_var_NS <= GROUP_LOOP_C_0;
        ELSE
          state_var_NS <= IDX_LOOP_C_0;
        END IF;
      WHEN GROUP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101100");
        IF ( GROUP_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= IDX_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101101");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11101110");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
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

END v3;

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

ARCHITECTURE v3 OF DIT_RELOOP_core_wait_dp IS
  -- Default Constants

BEGIN
  IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v3;

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
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    vec_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_1_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
    vec_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_2_i_re_d_pff : OUT STD_LOGIC;
    vec_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
    vec_rsc_0_3_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_2_i_re_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_3_i_re_d_pff : OUT STD_LOGIC
  );
END DIT_RELOOP_core;

ARCHITECTURE v3 OF DIT_RELOOP_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_acc_tmp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL or_tmp_5 : STD_LOGIC;
  SIGNAL nor_tmp_7 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL not_tmp_39 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL mux_tmp_74 : STD_LOGIC;
  SIGNAL and_tmp_8 : STD_LOGIC;
  SIGNAL nor_tmp_35 : STD_LOGIC;
  SIGNAL not_tmp_71 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL mux_tmp_95 : STD_LOGIC;
  SIGNAL or_tmp_70 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL not_tmp_87 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_102 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_123 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL not_tmp_122 : STD_LOGIC;
  SIGNAL and_tmp_10 : STD_LOGIC;
  SIGNAL or_tmp_187 : STD_LOGIC;
  SIGNAL not_tmp_126 : STD_LOGIC;
  SIGNAL not_tmp_129 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL or_tmp_193 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL not_tmp_139 : STD_LOGIC;
  SIGNAL and_tmp_11 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL mux_tmp_197 : STD_LOGIC;
  SIGNAL and_dcpl_172 : STD_LOGIC;
  SIGNAL and_dcpl_174 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_177 : STD_LOGIC;
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_183 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL not_tmp_163 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_idx1_acc_psp_4_sva_mx0w0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_psp_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL GROUP_LOOP_j_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_idx2_9_0_2_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_idx1_acc_psp_3_sva_mx0w0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_t_10_2_sva_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL IDX_LOOP_slc_IDX_LOOP_acc_8_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_8_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_20_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_9_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_21_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_12_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_idx2_acc_1_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_idx1_acc_psp_3_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_acc_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_9_0_2_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_9_0_sva_mx0w0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_idx2_acc_1_psp_sva_mx0w0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL reg_IDX_LOOP_t_10_2_ftd_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 : STD_LOGIC;
  SIGNAL reg_IDX_LOOP_1_lshift_idiv_ftd_8 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL reg_twiddle_rsc_triosy_0_0_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_265_cse : STD_LOGIC;
  SIGNAL and_232_cse : STD_LOGIC;
  SIGNAL and_251_cse : STD_LOGIC;
  SIGNAL and_231_cse : STD_LOGIC;
  SIGNAL and_269_cse : STD_LOGIC;
  SIGNAL nor_115_cse : STD_LOGIC;
  SIGNAL nand_28_cse : STD_LOGIC;
  SIGNAL nand_24_cse : STD_LOGIC;
  SIGNAL and_252_cse : STD_LOGIC;
  SIGNAL mux_98_rmff : STD_LOGIC;
  SIGNAL tmp_1_lpi_4_dfm_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL tmp_2_lpi_4_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_idx1_acc_psp_4_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_op_rshift_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL mux_201_itm : STD_LOGIC;
  SIGNAL mux_214_itm : STD_LOGIC;
  SIGNAL mux_220_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_264 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL and_dcpl_284 : STD_LOGIC;
  SIGNAL and_dcpl_289 : STD_LOGIC;
  SIGNAL and_dcpl_291 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_296 : STD_LOGIC;
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_dcpl_303 : STD_LOGIC;
  SIGNAL and_dcpl_309 : STD_LOGIC;
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_dcpl_320 : STD_LOGIC;
  SIGNAL and_dcpl_321 : STD_LOGIC;
  SIGNAL and_dcpl_322 : STD_LOGIC;
  SIGNAL and_dcpl_325 : STD_LOGIC;
  SIGNAL and_dcpl_331 : STD_LOGIC;
  SIGNAL STAGE_LOOP_gp_acc_psp_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_gp_lshift_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_1_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL IDX_LOOP_f1_IDX_LOOP_f1_nor_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_1_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_2_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_3_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_5_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_6_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_7_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_IDX_LOOP_f1_nor_1_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_6_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_7_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_10_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_11_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_mux1h_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_f1_IDX_LOOP_f1_nor_2_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_11_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_13_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_15_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_16_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_17_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_mux1h_2_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_f1_IDX_LOOP_f1_nor_3_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_18_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_19_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_22_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_IDX_LOOP_f2_and_23_itm : STD_LOGIC;
  SIGNAL IDX_LOOP_mux1h_3_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva_mx0c1 : STD_LOGIC;
  SIGNAL STAGE_LOOP_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL GROUP_LOOP_j_10_0_sva_9_0_mx0c0 : STD_LOGIC;
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva_mx0c0 : STD_LOGIC;
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva_mx0c1 : STD_LOGIC;
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva_mx0c2 : STD_LOGIC;
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva_mx0c3 : STD_LOGIC;
  SIGNAL IDX_LOOP_modulo_dev_return_1_sva_mx0c4 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c0 : STD_LOGIC;
  SIGNAL tmp_2_lpi_4_dfm_mx0c1 : STD_LOGIC;
  SIGNAL and_362_ssc : STD_LOGIC;
  SIGNAL IDX_LOOP_or_2_tmp : STD_LOGIC;
  SIGNAL and_304_cse : STD_LOGIC;
  SIGNAL and_391_cse : STD_LOGIC;
  SIGNAL and_cse : STD_LOGIC;
  SIGNAL and_416_cse : STD_LOGIC;
  SIGNAL or_287_cse : STD_LOGIC;
  SIGNAL mux_250_cse : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_itm_4_1 : STD_LOGIC;
  SIGNAL z_out_1_10 : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_42_m1c : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_43_m1c : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_45_m1c : STD_LOGIC;

  SIGNAL nor_116_nl : STD_LOGIC;
  SIGNAL nor_113_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL or_75_nl : STD_LOGIC;
  SIGNAL and_254_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL and_255_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL nor_114_nl : STD_LOGIC;
  SIGNAL mux_109_nl : STD_LOGIC;
  SIGNAL mux_108_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL mux_106_nl : STD_LOGIC;
  SIGNAL or_86_nl : STD_LOGIC;
  SIGNAL mux_105_nl : STD_LOGIC;
  SIGNAL or_85_nl : STD_LOGIC;
  SIGNAL mux_104_nl : STD_LOGIC;
  SIGNAL or_83_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL mux_102_nl : STD_LOGIC;
  SIGNAL mux_101_nl : STD_LOGIC;
  SIGNAL or_263_nl : STD_LOGIC;
  SIGNAL nand_29_nl : STD_LOGIC;
  SIGNAL nand_30_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL or_79_nl : STD_LOGIC;
  SIGNAL mux_99_nl : STD_LOGIC;
  SIGNAL GROUP_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL or_281_nl : STD_LOGIC;
  SIGNAL or_282_nl : STD_LOGIC;
  SIGNAL or_290_nl : STD_LOGIC;
  SIGNAL mux_252_nl : STD_LOGIC;
  SIGNAL or_289_nl : STD_LOGIC;
  SIGNAL or_288_nl : STD_LOGIC;
  SIGNAL mux_251_nl : STD_LOGIC;
  SIGNAL mux_249_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL mux_189_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_IDX_LOOP_f1_nor_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_9_nl : STD_LOGIC;
  SIGNAL and_179_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL mux_194_nl : STD_LOGIC;
  SIGNAL mux_193_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL mux_191_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL mux_197_nl : STD_LOGIC;
  SIGNAL mux_196_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_3_acc_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL mux_203_nl : STD_LOGIC;
  SIGNAL and_230_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL and_184_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_216_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_and_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_and_1_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_or_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_or_1_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f2_or_3_nl : STD_LOGIC;
  SIGNAL and_207_nl : STD_LOGIC;
  SIGNAL and_209_nl : STD_LOGIC;
  SIGNAL and_211_nl : STD_LOGIC;
  SIGNAL and_213_nl : STD_LOGIC;
  SIGNAL mux_234_nl : STD_LOGIC;
  SIGNAL nor_85_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_11_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_12_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_13_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_14_nl : STD_LOGIC;
  SIGNAL and_217_nl : STD_LOGIC;
  SIGNAL and_218_nl : STD_LOGIC;
  SIGNAL and_219_nl : STD_LOGIC;
  SIGNAL and_220_nl : STD_LOGIC;
  SIGNAL mux_238_nl : STD_LOGIC;
  SIGNAL and_227_nl : STD_LOGIC;
  SIGNAL and_223_nl : STD_LOGIC;
  SIGNAL and_224_nl : STD_LOGIC;
  SIGNAL and_225_nl : STD_LOGIC;
  SIGNAL and_226_nl : STD_LOGIC;
  SIGNAL mux_241_nl : STD_LOGIC;
  SIGNAL mux_240_nl : STD_LOGIC;
  SIGNAL mux_239_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL or_70_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL and_280_nl : STD_LOGIC;
  SIGNAL nor_142_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL mux_178_nl : STD_LOGIC;
  SIGNAL mux_188_nl : STD_LOGIC;
  SIGNAL mux_200_nl : STD_LOGIC;
  SIGNAL or_224_nl : STD_LOGIC;
  SIGNAL mux_208_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL mux_206_nl : STD_LOGIC;
  SIGNAL mux_205_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL mux_219_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL or_277_nl : STD_LOGIC;
  SIGNAL or_278_nl : STD_LOGIC;
  SIGNAL or_279_nl : STD_LOGIC;
  SIGNAL and_168_nl : STD_LOGIC;
  SIGNAL and_169_nl : STD_LOGIC;
  SIGNAL and_140_nl : STD_LOGIC;
  SIGNAL and_142_nl : STD_LOGIC;
  SIGNAL and_139_nl : STD_LOGIC;
  SIGNAL mux_171_nl : STD_LOGIC;
  SIGNAL nor_117_nl : STD_LOGIC;
  SIGNAL mux_170_nl : STD_LOGIC;
  SIGNAL or_196_nl : STD_LOGIC;
  SIGNAL or_194_nl : STD_LOGIC;
  SIGNAL mux_169_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL nor_118_nl : STD_LOGIC;
  SIGNAL nor_119_nl : STD_LOGIC;
  SIGNAL nor_120_nl : STD_LOGIC;
  SIGNAL mux_167_nl : STD_LOGIC;
  SIGNAL or_188_nl : STD_LOGIC;
  SIGNAL or_186_nl : STD_LOGIC;
  SIGNAL mux_175_nl : STD_LOGIC;
  SIGNAL and_239_nl : STD_LOGIC;
  SIGNAL mux_174_nl : STD_LOGIC;
  SIGNAL mux_173_nl : STD_LOGIC;
  SIGNAL nor_92_nl : STD_LOGIC;
  SIGNAL nor_93_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL nor_94_nl : STD_LOGIC;
  SIGNAL nor_95_nl : STD_LOGIC;
  SIGNAL nor_96_nl : STD_LOGIC;
  SIGNAL nor_97_nl : STD_LOGIC;
  SIGNAL and_157_nl : STD_LOGIC;
  SIGNAL and_159_nl : STD_LOGIC;
  SIGNAL and_162_nl : STD_LOGIC;
  SIGNAL and_164_nl : STD_LOGIC;
  SIGNAL and_111_nl : STD_LOGIC;
  SIGNAL and_116_nl : STD_LOGIC;
  SIGNAL and_107_nl : STD_LOGIC;
  SIGNAL mux_143_nl : STD_LOGIC;
  SIGNAL nor_108_nl : STD_LOGIC;
  SIGNAL nor_109_nl : STD_LOGIC;
  SIGNAL mux_159_nl : STD_LOGIC;
  SIGNAL and_262_nl : STD_LOGIC;
  SIGNAL mux_158_nl : STD_LOGIC;
  SIGNAL nor_121_nl : STD_LOGIC;
  SIGNAL nor_122_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_263_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL nor_123_nl : STD_LOGIC;
  SIGNAL nor_124_nl : STD_LOGIC;
  SIGNAL nor_125_nl : STD_LOGIC;
  SIGNAL mux_155_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL or_161_nl : STD_LOGIC;
  SIGNAL nor_98_nl : STD_LOGIC;
  SIGNAL and_241_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL mux_164_nl : STD_LOGIC;
  SIGNAL nor_99_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL or_180_nl : STD_LOGIC;
  SIGNAL or_178_nl : STD_LOGIC;
  SIGNAL nor_100_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL mux_160_nl : STD_LOGIC;
  SIGNAL or_174_nl : STD_LOGIC;
  SIGNAL or_173_nl : STD_LOGIC;
  SIGNAL nor_101_nl : STD_LOGIC;
  SIGNAL and_148_nl : STD_LOGIC;
  SIGNAL and_151_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL nor_127_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL or_148_nl : STD_LOGIC;
  SIGNAL or_146_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL nor_128_nl : STD_LOGIC;
  SIGNAL nor_129_nl : STD_LOGIC;
  SIGNAL nor_130_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL or_140_nl : STD_LOGIC;
  SIGNAL or_138_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL and_242_nl : STD_LOGIC;
  SIGNAL mux_151_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL nor_102_nl : STD_LOGIC;
  SIGNAL and_243_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL nor_104_nl : STD_LOGIC;
  SIGNAL nor_105_nl : STD_LOGIC;
  SIGNAL nor_106_nl : STD_LOGIC;
  SIGNAL nor_107_nl : STD_LOGIC;
  SIGNAL and_120_nl : STD_LOGIC;
  SIGNAL and_123_nl : STD_LOGIC;
  SIGNAL and_130_nl : STD_LOGIC;
  SIGNAL and_134_nl : STD_LOGIC;
  SIGNAL mux_135_nl : STD_LOGIC;
  SIGNAL and_265_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL nor_131_nl : STD_LOGIC;
  SIGNAL nor_132_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL and_266_nl : STD_LOGIC;
  SIGNAL mux_132_nl : STD_LOGIC;
  SIGNAL nor_133_nl : STD_LOGIC;
  SIGNAL nor_134_nl : STD_LOGIC;
  SIGNAL nor_135_nl : STD_LOGIC;
  SIGNAL mux_131_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL or_112_nl : STD_LOGIC;
  SIGNAL nor_110_nl : STD_LOGIC;
  SIGNAL and_244_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL mux_140_nl : STD_LOGIC;
  SIGNAL nor_111_nl : STD_LOGIC;
  SIGNAL mux_139_nl : STD_LOGIC;
  SIGNAL mux_138_nl : STD_LOGIC;
  SIGNAL and_245_nl : STD_LOGIC;
  SIGNAL nand_25_nl : STD_LOGIC;
  SIGNAL nor_112_nl : STD_LOGIC;
  SIGNAL mux_137_nl : STD_LOGIC;
  SIGNAL mux_136_nl : STD_LOGIC;
  SIGNAL or_126_nl : STD_LOGIC;
  SIGNAL nand_26_nl : STD_LOGIC;
  SIGNAL and_246_nl : STD_LOGIC;
  SIGNAL mux_129_nl : STD_LOGIC;
  SIGNAL or_110_nl : STD_LOGIC;
  SIGNAL or_111_nl : STD_LOGIC;
  SIGNAL mux_124_nl : STD_LOGIC;
  SIGNAL or_103_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL or_101_nl : STD_LOGIC;
  SIGNAL nor_49_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL nor_47_nl : STD_LOGIC;
  SIGNAL or_97_nl : STD_LOGIC;
  SIGNAL or_95_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nand_43_nl : STD_LOGIC;
  SIGNAL and_247_nl : STD_LOGIC;
  SIGNAL mux_247_nl : STD_LOGIC;
  SIGNAL mux_246_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_178_nl : STD_LOGIC;
  SIGNAL nor_179_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_13_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL IDX_LOOP_IDX_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_IDX_LOOP_and_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL not_698_nl : STD_LOGIC;
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_14_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL IDX_LOOP_mux_15_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL STAGE_LOOP_gp_mux_5_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL IDX_LOOP_mux1h_27_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_418_nl : STD_LOGIC;
  SIGNAL and_419_nl : STD_LOGIC;
  SIGNAL and_420_nl : STD_LOGIC;
  SIGNAL and_421_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_mux_16_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL IDX_LOOP_f1_or_19_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_20_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_21_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_40_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_16_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_17_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_41_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_18_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_22_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_or_23_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_mux1h_44_nl : STD_LOGIC;
  SIGNAL IDX_LOOP_f1_and_26_nl : STD_LOGIC;
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
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      IDX_LOOP_C_59_tr0 : IN STD_LOGIC;
      IDX_LOOP_C_117_tr0 : IN STD_LOGIC;
      IDX_LOOP_C_175_tr0 : IN STD_LOGIC;
      IDX_LOOP_C_233_tr0 : IN STD_LOGIC;
      GROUP_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_59_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_117_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_175_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_233_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_8_6_2(input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

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

  vec_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_3_lz
    );
  vec_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => vec_rsc_triosy_0_2_lz
    );
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
  twiddle_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_3_lz
    );
  twiddle_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_twiddle_rsc_triosy_0_0_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_2_lz
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
  IDX_LOOP_1_modulo_dev_cmp_base_rsc_dat <= READSLICE_64_65(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((MUX1HOT_v_64_3_2(vec_rsc_0_0_i_q_d,
      vec_rsc_0_2_i_q_d, tmp_2_lpi_4_dfm, STD_LOGIC_VECTOR'( (NOT(reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8
      OR IDX_LOOP_or_2_tmp)) & (reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 AND (NOT IDX_LOOP_or_2_tmp))
      & IDX_LOOP_or_2_tmp))) & ((NOT and_dcpl_322) OR and_dcpl_321 OR and_dcpl_325
      OR and_dcpl_331 OR and_391_cse)) + UNSIGNED((MUX1HOT_v_64_3_2((NOT tmp_1_lpi_4_dfm_2),
      tmp_1_lpi_4_dfm_2, (NOT z_out_5), STD_LOGIC_VECTOR'( and_dcpl_321 & and_dcpl_322
      & (and_dcpl_325 OR and_dcpl_331 OR and_391_cse)))) & '1'), 65)), 1);
  IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat <= p_sva;
  IDX_LOOP_1_modulo_dev_cmp_return_rsc_z <= IDX_LOOP_1_modulo_dev_cmp_return_rsc_z_1;
  IDX_LOOP_1_modulo_dev_cmp_ccs_ccore_start_rsc_dat <= NOT (MUX_s_1_2_2((MUX_s_1_2_2(not_tmp_71,
      (CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("11001"))), fsm_output(7))),
      ((fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2)) OR (NOT and_cse)), fsm_output(6)));

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
  IDX_LOOP_1_lshift_rg_a <= (MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), IDX_LOOP_t_10_2_sva_7_0,
      (NOT and_362_ssc))) & ((NOT(and_362_ssc OR and_dcpl_289 OR and_dcpl_291)) OR
      and_dcpl_295 OR and_dcpl_296) & ((NOT(and_dcpl_289 OR and_dcpl_295)) OR and_362_ssc
      OR and_dcpl_291 OR and_dcpl_296);
  IDX_LOOP_1_lshift_rg_s <= MUX_v_4_2_2((z_out_2(3 DOWNTO 0)), STAGE_LOOP_gp_acc_psp_sva,
      and_dcpl_289 OR and_dcpl_291 OR and_dcpl_295 OR and_dcpl_296);
  z_out_4 <= IDX_LOOP_1_lshift_rg_z;

  DIT_RELOOP_core_wait_dp_inst : DIT_RELOOP_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => mux_98_rmff,
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
      IDX_LOOP_C_175_tr0 => DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_175_tr0,
      IDX_LOOP_C_233_tr0 => DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_233_tr0,
      GROUP_LOOP_C_0_tr0 => DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= DIT_RELOOP_core_core_fsm_inst_fsm_output;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_59_tr0 <= NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_117_tr0 <= NOT IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_175_tr0 <= NOT IDX_LOOP_slc_IDX_LOOP_acc_8_itm;
  DIT_RELOOP_core_core_fsm_inst_IDX_LOOP_C_233_tr0 <= NOT IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm;
  DIT_RELOOP_core_core_fsm_inst_GROUP_LOOP_C_0_tr0 <= NOT z_out_1_10;
  DIT_RELOOP_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= STAGE_LOOP_acc_itm_4_1;

  mux_96_nl <= MUX_s_1_2_2((NOT (fsm_output(6))), (fsm_output(6)), fsm_output(2));
  or_75_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(6));
  mux_97_nl <= MUX_s_1_2_2(mux_96_nl, or_75_nl, fsm_output(3));
  nor_113_nl <= NOT((fsm_output(5)) OR (fsm_output(7)) OR mux_97_nl);
  mux_94_nl <= MUX_s_1_2_2((fsm_output(6)), (NOT (fsm_output(6))), and_232_cse);
  and_255_nl <= (fsm_output(3)) AND mux_94_nl;
  nor_114_nl <= NOT((fsm_output(3)) OR nor_115_cse OR (fsm_output(6)));
  mux_95_nl <= MUX_s_1_2_2(and_255_nl, nor_114_nl, fsm_output(7));
  and_254_nl <= (fsm_output(5)) AND mux_95_nl;
  mux_98_rmff <= MUX_s_1_2_2(nor_113_nl, and_254_nl, fsm_output(4));
  or_265_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_251_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  nand_28_cse <= NOT((fsm_output(7)) AND (fsm_output(4)));
  and_252_cse <= or_265_cse AND (fsm_output(2));
  and_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)=STD_LOGIC_VECTOR'("111"));
  and_416_cse <= (fsm_output(5)) AND (fsm_output(3));
  or_287_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_250_cse <= MUX_s_1_2_2(and_cse, and_dcpl_4, or_287_cse);
  and_232_cse <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_231_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_269_cse <= (fsm_output(2)) AND (fsm_output(4));
  STAGE_LOOP_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  nor_115_cse <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  IDX_LOOP_idx2_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_4_sva_mx0w0
      & (z_out_3(0))) + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva(9 DOWNTO 1)), 9));
  IDX_LOOP_idx1_acc_psp_4_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_3(8
      DOWNTO 1)) + UNSIGNED(IDX_LOOP_t_10_2_sva_7_0), 8));
  IDX_LOOP_idx2_9_0_2_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_4_sva_mx0w0
      & (z_out_3(0)) & '1') + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva), 10));
  IDX_LOOP_idx2_acc_1_psp_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_3_sva_mx0w0)
      + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva(9 DOWNTO 1)), 9));
  IDX_LOOP_idx1_acc_psp_3_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_3(8
      DOWNTO 0)) + UNSIGNED(IDX_LOOP_t_10_2_sva_7_0 & '1'), 9));
  IDX_LOOP_idx2_9_0_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_idx1_acc_psp_3_sva_mx0w0
      & '1') + UNSIGNED(STAGE_LOOP_op_rshift_psp_1_sva), 10));
  STAGE_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT STAGE_LOOP_i_3_0_sva_2))
      + SIGNED'( "01011"), 5));
  STAGE_LOOP_acc_itm_4_1 <= STAGE_LOOP_acc_nl(4);
  and_dcpl <= NOT((fsm_output(0)) OR (fsm_output(6)));
  and_dcpl_4 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  or_tmp_5 <= (fsm_output(4)) OR (fsm_output(7));
  nor_tmp_7 <= (CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00"))) AND
      (fsm_output(5));
  and_dcpl_11 <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00")));
  not_tmp_39 <= NOT(and_231_cse OR (fsm_output(5)));
  and_dcpl_35 <= NOT((fsm_output(1)) OR (fsm_output(7)));
  and_dcpl_36 <= and_dcpl_35 AND and_dcpl;
  and_dcpl_37 <= NOT((fsm_output(4)) OR (fsm_output(2)));
  and_dcpl_38 <= NOT((fsm_output(5)) OR (fsm_output(3)));
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_37;
  and_dcpl_41 <= (fsm_output(0)) AND (fsm_output(6));
  and_dcpl_42 <= (NOT (fsm_output(1))) AND (fsm_output(7));
  and_dcpl_43 <= and_dcpl_42 AND and_dcpl_41;
  and_dcpl_46 <= and_416_cse AND (NOT (fsm_output(4))) AND (fsm_output(2));
  mux_tmp_74 <= MUX_s_1_2_2(and_dcpl_4, nor_tmp_7, and_232_cse);
  and_tmp_8 <= (fsm_output(7)) AND mux_tmp_74;
  nor_tmp_35 <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"));
  or_70_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0001"));
  not_tmp_71 <= MUX_s_1_2_2(or_70_nl, (NOT nor_tmp_35), fsm_output(1));
  and_dcpl_50 <= (fsm_output(1)) AND (NOT (fsm_output(7)));
  and_dcpl_51 <= and_dcpl_50 AND and_dcpl;
  and_dcpl_52 <= nor_tmp_35 AND and_dcpl_51;
  and_dcpl_53 <= (NOT (fsm_output(0))) AND (fsm_output(6));
  and_dcpl_55 <= (fsm_output(4)) AND (NOT (fsm_output(2)));
  and_dcpl_56 <= and_416_cse AND and_dcpl_55;
  and_dcpl_57 <= and_dcpl_56 AND and_dcpl_35 AND and_dcpl_53;
  and_dcpl_58 <= (fsm_output(1)) AND (fsm_output(7));
  and_dcpl_60 <= (fsm_output(5)) AND (NOT (fsm_output(3)));
  and_dcpl_61 <= and_dcpl_60 AND and_dcpl_55;
  and_dcpl_62 <= and_dcpl_61 AND and_dcpl_58 AND and_dcpl;
  and_dcpl_63 <= (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_dcpl_64 <= and_dcpl_35 AND and_dcpl_63;
  and_dcpl_68 <= and_dcpl_50 AND and_dcpl_41;
  and_dcpl_70 <= and_dcpl_35 AND and_dcpl_41;
  and_dcpl_72 <= and_dcpl_58 AND and_dcpl_63;
  and_dcpl_74 <= and_dcpl_60 AND and_269_cse;
  and_dcpl_79 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_84 <= and_dcpl_38 AND (NOT (fsm_output(4)));
  and_dcpl_85 <= and_dcpl_84 AND and_dcpl_11;
  mux_tmp_95 <= MUX_s_1_2_2((NOT (fsm_output(2))), (fsm_output(2)), fsm_output(1));
  or_tmp_70 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  and_dcpl_87 <= and_dcpl_39 AND and_dcpl_51;
  and_dcpl_88 <= and_dcpl_50 AND and_dcpl_63;
  and_dcpl_89 <= and_dcpl_39 AND and_dcpl_88;
  not_tmp_87 <= NOT((fsm_output(7)) AND (fsm_output(3)));
  and_dcpl_98 <= and_dcpl_56 AND and_dcpl_88;
  and_dcpl_99 <= and_dcpl_74 AND and_dcpl_70;
  and_dcpl_102 <= and_dcpl_46 AND and_dcpl_72;
  and_dcpl_103 <= and_416_cse AND and_dcpl_37;
  and_dcpl_104 <= and_dcpl_103 AND and_dcpl_43;
  and_dcpl_108 <= reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 AND (NOT (fsm_output(7))) AND
      and_dcpl;
  and_dcpl_109 <= and_cse AND and_dcpl_79;
  and_dcpl_111 <= and_dcpl_79 AND and_dcpl_11;
  and_dcpl_114 <= and_dcpl_74 AND and_dcpl_68;
  and_dcpl_118 <= and_dcpl_60 AND (fsm_output(4));
  and_dcpl_119 <= and_dcpl_118 AND nor_115_cse;
  and_dcpl_122 <= nor_115_cse AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_123 <= and_dcpl_118 AND ((NOT (IDX_LOOP_idx1_acc_psp_3_sva(0))) OR (fsm_output(0)));
  nand_24_cse <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")));
  and_dcpl_126 <= (fsm_output(4)) AND (NOT (fsm_output(1)));
  and_280_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  nor_142_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  mux_154_nl <= MUX_s_1_2_2(and_280_nl, nor_142_nl, fsm_output(7));
  and_dcpl_128 <= mux_154_nl AND (fsm_output(5));
  and_dcpl_133 <= nor_tmp_35 AND and_dcpl_64;
  and_dcpl_137 <= and_dcpl_118 AND and_232_cse;
  and_dcpl_140 <= and_232_cse AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_143 <= and_dcpl_61 AND and_dcpl_42 AND and_dcpl_63;
  and_dcpl_146 <= (NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8) AND (NOT (fsm_output(7)))
      AND and_dcpl;
  and_dcpl_153 <= and_dcpl_118 AND ((IDX_LOOP_idx1_acc_psp_3_sva(0)) OR (fsm_output(0)));
  not_tmp_122 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111")));
  mux_177_nl <= MUX_s_1_2_2(and_dcpl_4, nor_tmp_7, fsm_output(2));
  and_tmp_10 <= (fsm_output(7)) AND mux_177_nl;
  or_tmp_187 <= (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(4))
      OR (fsm_output(3)) OR (fsm_output(5));
  mux_178_nl <= MUX_s_1_2_2(and_tmp_8, and_tmp_10, fsm_output(0));
  not_tmp_126 <= MUX_s_1_2_2(or_tmp_187, (NOT mux_178_nl), fsm_output(6));
  not_tmp_129 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00001")));
  or_dcpl_25 <= CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("00000010"));
  mux_tmp_172 <= MUX_s_1_2_2(and_cse, and_dcpl_4, and_232_cse);
  or_tmp_193 <= and_251_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"));
  mux_188_nl <= MUX_s_1_2_2(or_tmp_193, (NOT mux_tmp_172), fsm_output(6));
  and_dcpl_165 <= mux_188_nl AND (NOT (fsm_output(7)));
  not_tmp_139 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00000")));
  mux_200_nl <= MUX_s_1_2_2(and_dcpl_4, nor_tmp_7, or_287_cse);
  and_tmp_11 <= (fsm_output(7)) AND mux_200_nl;
  or_224_nl <= (fsm_output(7)) OR (fsm_output(2)) OR (fsm_output(4)) OR (fsm_output(3))
      OR (fsm_output(5));
  mux_201_itm <= MUX_s_1_2_2(or_224_nl, or_tmp_187, fsm_output(0));
  mux_206_nl <= MUX_s_1_2_2(and_dcpl_84, and_cse, fsm_output(2));
  mux_207_nl <= MUX_s_1_2_2(and_dcpl_39, mux_206_nl, fsm_output(1));
  mux_205_nl <= MUX_s_1_2_2(and_dcpl_39, nor_tmp_35, fsm_output(1));
  mux_208_nl <= MUX_s_1_2_2(mux_207_nl, mux_205_nl, fsm_output(0));
  and_dcpl_171 <= (NOT mux_208_nl) AND and_dcpl_11;
  mux_tmp_197 <= MUX_s_1_2_2(and_dcpl_39, mux_250_cse, fsm_output(7));
  mux_211_nl <= MUX_s_1_2_2(not_tmp_139, and_dcpl_4, fsm_output(7));
  mux_213_nl <= MUX_s_1_2_2(mux_tmp_197, mux_211_nl, fsm_output(0));
  mux_214_itm <= MUX_s_1_2_2(mux_213_nl, (fsm_output(7)), fsm_output(6));
  mux_215_nl <= MUX_s_1_2_2(or_tmp_193, (NOT and_cse), fsm_output(6));
  and_dcpl_172 <= mux_215_nl AND (NOT (fsm_output(7)));
  mux_218_nl <= MUX_s_1_2_2(not_tmp_139, mux_250_cse, fsm_output(7));
  mux_219_nl <= MUX_s_1_2_2(mux_tmp_197, mux_218_nl, fsm_output(0));
  mux_220_itm <= MUX_s_1_2_2(mux_219_nl, (fsm_output(7)), fsm_output(6));
  and_dcpl_174 <= and_dcpl_128 AND and_dcpl_126 AND and_dcpl_63;
  and_dcpl_175 <= NOT(CONV_SL_1_1(reg_IDX_LOOP_1_lshift_idiv_ftd_8/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_177 <= (NOT (fsm_output(7))) AND (fsm_output(0)) AND (NOT (fsm_output(6)));
  and_dcpl_178 <= and_dcpl_177 AND and_dcpl_175;
  and_dcpl_180 <= CONV_SL_1_1(reg_IDX_LOOP_1_lshift_idiv_ftd_8=STD_LOGIC_VECTOR'("01"));
  and_dcpl_181 <= and_dcpl_177 AND and_dcpl_180;
  and_dcpl_183 <= CONV_SL_1_1(reg_IDX_LOOP_1_lshift_idiv_ftd_8=STD_LOGIC_VECTOR'("10"));
  and_dcpl_184 <= and_dcpl_177 AND and_dcpl_183;
  and_dcpl_186 <= CONV_SL_1_1(reg_IDX_LOOP_1_lshift_idiv_ftd_8=STD_LOGIC_VECTOR'("11"));
  and_dcpl_187 <= and_dcpl_177 AND and_dcpl_186;
  and_dcpl_191 <= NOT((fsm_output(7)) OR (fsm_output(0)) OR (fsm_output(6)));
  and_dcpl_192 <= and_dcpl_191 AND and_dcpl_175;
  and_dcpl_193 <= and_dcpl_84 AND and_dcpl_79;
  and_dcpl_195 <= and_dcpl_191 AND and_dcpl_180;
  and_dcpl_197 <= and_dcpl_191 AND and_dcpl_183;
  and_dcpl_199 <= and_dcpl_191 AND and_dcpl_186;
  not_tmp_163 <= NOT(and_232_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  and_dcpl_209 <= and_dcpl_84 AND and_232_cse;
  STAGE_LOOP_i_3_0_sva_mx0c1 <= and_dcpl_46 AND and_dcpl_43;
  GROUP_LOOP_j_10_0_sva_9_0_mx0c0 <= and_dcpl_39 AND and_dcpl_64;
  IDX_LOOP_modulo_dev_return_1_sva_mx0c0 <= not_tmp_129 AND and_dcpl_178;
  IDX_LOOP_modulo_dev_return_1_sva_mx0c1 <= not_tmp_129 AND and_dcpl_181;
  IDX_LOOP_modulo_dev_return_1_sva_mx0c2 <= not_tmp_129 AND and_dcpl_184;
  IDX_LOOP_modulo_dev_return_1_sva_mx0c3 <= not_tmp_129 AND and_dcpl_187;
  or_277_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("00101"));
  or_278_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR (NOT
      and_cse);
  mux_226_nl <= MUX_s_1_2_2(or_277_nl, or_278_nl, fsm_output(7));
  or_279_nl <= (fsm_output(7)) OR not_tmp_71;
  mux_227_nl <= MUX_s_1_2_2(mux_226_nl, or_279_nl, fsm_output(6));
  IDX_LOOP_modulo_dev_return_1_sva_mx0c4 <= NOT(mux_227_nl OR (fsm_output(0)));
  tmp_2_lpi_4_dfm_mx0c0 <= and_dcpl_193 AND and_dcpl_146;
  tmp_2_lpi_4_dfm_mx0c1 <= and_dcpl_193 AND and_dcpl_108;
  and_168_nl <= and_dcpl_137 AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva(0))) AND (NOT
      (fsm_output(7))) AND and_dcpl_53;
  and_169_nl <= and_dcpl_153 AND and_dcpl_140;
  vec_rsc_0_0_i_radr_d <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_tmp(8 DOWNTO 1)), IDX_LOOP_idx1_acc_psp_4_sva,
      (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), (IDX_LOOP_idx1_acc_psp_3_sva(8 DOWNTO
      1)), (IDX_LOOP_idx2_acc_1_psp_sva(8 DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9 DOWNTO
      2)), STD_LOGIC_VECTOR'( and_dcpl_87 & and_dcpl_89 & and_dcpl_133 & and_168_nl
      & and_169_nl & and_dcpl_143));
  and_140_nl <= nor_tmp_35 AND and_dcpl_36;
  and_142_nl <= and_dcpl_61 AND and_dcpl_42 AND and_dcpl;
  vec_rsc_0_0_i_wadr_d_pff <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_psp_sva(8 DOWNTO
      1)), IDX_LOOP_idx1_acc_psp_4_sva, (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), (IDX_LOOP_idx2_acc_1_psp_sva(8
      DOWNTO 1)), (IDX_LOOP_idx1_acc_psp_3_sva(8 DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9
      DOWNTO 2)), STD_LOGIC_VECTOR'( and_dcpl_98 & and_140_nl & and_dcpl_99 & and_dcpl_102
      & and_142_nl & and_dcpl_104));
  and_139_nl <= and_dcpl_128 AND and_dcpl_126 AND and_dcpl;
  vec_rsc_0_0_i_d_d_pff <= MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_modulo_dev_return_1_sva,
      and_139_nl);
  or_196_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (IDX_LOOP_idx1_acc_psp_3_sva(0))
      OR nand_28_cse;
  or_194_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(2))) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_170_nl <= MUX_s_1_2_2(or_196_nl, or_194_nl, fsm_output(6));
  nor_117_nl <= NOT((fsm_output(1)) OR mux_170_nl);
  nor_118_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(2))) OR reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8
      OR (fsm_output(7)) OR (NOT (fsm_output(4))));
  nor_119_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(2)) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT (fsm_output(7))) OR (fsm_output(4)));
  mux_168_nl <= MUX_s_1_2_2(nor_118_nl, nor_119_nl, fsm_output(6));
  or_188_nl <= (IDX_LOOP_idx2_acc_psp_sva(0)) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  or_186_nl <= (IDX_LOOP_idx2_acc_1_psp_sva(0)) OR (NOT (fsm_output(7))) OR (fsm_output(4));
  mux_167_nl <= MUX_s_1_2_2(or_188_nl, or_186_nl, fsm_output(2));
  nor_120_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))) OR (STAGE_LOOP_op_rshift_psp_1_sva(0))
      OR mux_167_nl);
  mux_169_nl <= MUX_s_1_2_2(mux_168_nl, nor_120_nl, fsm_output(1));
  mux_171_nl <= MUX_s_1_2_2(nor_117_nl, mux_169_nl, fsm_output(3));
  vec_rsc_0_0_i_we_d_pff <= mux_171_nl AND (fsm_output(5));
  nor_92_nl <= NOT((STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (IDX_LOOP_idx2_acc_tmp(0))
      OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  nor_93_nl <= NOT((((IDX_LOOP_idx2_acc_1_psp_sva(0)) OR (STAGE_LOOP_op_rshift_psp_1_sva(0)))
      AND (IDX_LOOP_idx1_acc_psp_3_sva(0))) OR not_tmp_122);
  mux_173_nl <= MUX_s_1_2_2(nor_92_nl, nor_93_nl, fsm_output(2));
  nor_94_nl <= NOT(reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 OR CONV_SL_1_1(fsm_output(6
      DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  nor_95_nl <= NOT((IDX_LOOP_idx2_acc_1_psp_sva(0)) OR (NOT IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm)
      OR (STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (IDX_LOOP_idx1_acc_psp_3_sva(0))
      OR not_tmp_122);
  mux_172_nl <= MUX_s_1_2_2(nor_94_nl, nor_95_nl, fsm_output(2));
  mux_174_nl <= MUX_s_1_2_2(mux_173_nl, mux_172_nl, fsm_output(0));
  and_239_nl <= (fsm_output(1)) AND mux_174_nl;
  nor_96_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(2)))
      OR (fsm_output(6)) OR (NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR nand_24_cse);
  mux_175_nl <= MUX_s_1_2_2(and_239_nl, nor_96_nl, fsm_output(3));
  nor_97_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT IDX_LOOP_slc_IDX_LOOP_acc_8_itm) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (fsm_output(6)) OR nand_24_cse);
  vec_rsc_0_0_i_re_d_pff <= MUX_s_1_2_2(mux_175_nl, nor_97_nl, fsm_output(7));
  and_157_nl <= and_dcpl_109 AND and_dcpl_146;
  and_159_nl <= and_cse AND (reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 OR (fsm_output(0)))
      AND and_dcpl_111;
  and_162_nl <= and_dcpl_119 AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva(0))) AND (fsm_output(7))
      AND and_dcpl;
  and_164_nl <= and_dcpl_153 AND and_dcpl_122;
  vec_rsc_0_1_i_radr_d <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_tmp(8 DOWNTO 1)), IDX_LOOP_idx1_acc_psp_4_sva,
      (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), (IDX_LOOP_idx2_acc_1_psp_sva(8 DOWNTO
      1)), (IDX_LOOP_idx1_acc_psp_3_sva(8 DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9 DOWNTO
      2)), STD_LOGIC_VECTOR'( and_dcpl_87 & and_157_nl & and_159_nl & and_dcpl_114
      & and_162_nl & and_164_nl));
  and_111_nl <= and_dcpl_74 AND and_dcpl_50 AND and_dcpl_53;
  and_116_nl <= and_dcpl_103 AND and_dcpl_58 AND and_dcpl_53;
  vec_rsc_0_1_i_wadr_d_pff <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_psp_sva(8 DOWNTO
      1)), (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), IDX_LOOP_idx1_acc_psp_4_sva, (IDX_LOOP_idx2_acc_1_psp_sva(8
      DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9 DOWNTO 2)), (IDX_LOOP_idx1_acc_psp_3_sva(8
      DOWNTO 1)), STD_LOGIC_VECTOR'( and_dcpl_98 & and_dcpl_99 & and_111_nl & and_dcpl_102
      & and_dcpl_104 & and_116_nl));
  nor_108_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("101")));
  nor_109_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 2)/=STD_LOGIC_VECTOR'("010")));
  mux_143_nl <= MUX_s_1_2_2(nor_108_nl, nor_109_nl, fsm_output(7));
  and_107_nl <= mux_143_nl AND (fsm_output(5)) AND (fsm_output(1)) AND and_dcpl_53;
  vec_rsc_0_1_i_d_d_pff <= MUX_v_64_2_2(IDX_LOOP_1_IDX_LOOP_rem_1_cmp_z, IDX_LOOP_modulo_dev_return_1_sva,
      and_107_nl);
  nor_121_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT (fsm_output(3)))
      OR (IDX_LOOP_idx2_acc_psp_sva(0)));
  nor_122_nl <= NOT((IDX_LOOP_idx2_acc_1_psp_sva(0)) OR (fsm_output(4)) OR not_tmp_87);
  mux_158_nl <= MUX_s_1_2_2(nor_121_nl, nor_122_nl, fsm_output(2));
  and_262_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
      AND mux_158_nl;
  nor_123_nl <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(4)) OR not_tmp_87);
  nor_124_nl <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(3)));
  mux_156_nl <= MUX_s_1_2_2(nor_123_nl, nor_124_nl, fsm_output(2));
  and_263_nl <= (fsm_output(0)) AND mux_156_nl;
  or_163_nl <= (IDX_LOOP_idx1_acc_psp_3_sva(0)) OR (fsm_output(4)) OR not_tmp_87;
  or_161_nl <= reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 OR (NOT (fsm_output(4))) OR (fsm_output(7))
      OR (fsm_output(3));
  mux_155_nl <= MUX_s_1_2_2(or_163_nl, or_161_nl, fsm_output(2));
  nor_125_nl <= NOT((fsm_output(0)) OR mux_155_nl);
  mux_157_nl <= MUX_s_1_2_2(and_263_nl, nor_125_nl, fsm_output(1));
  mux_159_nl <= MUX_s_1_2_2(and_262_nl, mux_157_nl, fsm_output(6));
  vec_rsc_0_1_i_we_d_pff <= mux_159_nl AND (fsm_output(5));
  nor_98_nl <= NOT((fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(0)) OR (IDX_LOOP_idx2_acc_tmp(0)) OR
      (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0))) OR (fsm_output(7)));
  or_180_nl <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(7)));
  mux_162_nl <= MUX_s_1_2_2((NOT (fsm_output(7))), or_180_nl, IDX_LOOP_idx1_acc_psp_3_sva(0));
  or_178_nl <= (NOT IDX_LOOP_slc_IDX_LOOP_acc_8_itm) OR (IDX_LOOP_idx1_acc_psp_3_sva(0))
      OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (NOT (fsm_output(7)));
  mux_163_nl <= MUX_s_1_2_2(mux_162_nl, or_178_nl, fsm_output(0));
  nor_99_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")) OR
      mux_163_nl);
  or_174_nl <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(7));
  mux_160_nl <= MUX_s_1_2_2((fsm_output(7)), or_174_nl, reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8);
  or_173_nl <= reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 OR (NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm)
      OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"))
      OR (fsm_output(7));
  mux_161_nl <= MUX_s_1_2_2(mux_160_nl, or_173_nl, fsm_output(0));
  nor_100_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR mux_161_nl);
  mux_164_nl <= MUX_s_1_2_2(nor_99_nl, nor_100_nl, fsm_output(3));
  nor_101_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0111"))
      OR (NOT IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm) OR (IDX_LOOP_idx2_acc_1_psp_sva(0))
      OR (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0))) OR (fsm_output(7)));
  mux_165_nl <= MUX_s_1_2_2(mux_164_nl, nor_101_nl, fsm_output(6));
  and_241_nl <= (fsm_output(5)) AND mux_165_nl;
  vec_rsc_0_1_i_re_d_pff <= MUX_s_1_2_2(nor_98_nl, and_241_nl, fsm_output(4));
  and_148_nl <= and_dcpl_137 AND (IDX_LOOP_idx1_acc_psp_3_sva(0)) AND (NOT (fsm_output(7)))
      AND and_dcpl_53;
  and_151_nl <= and_dcpl_123 AND and_dcpl_140;
  vec_rsc_0_2_i_radr_d <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_tmp(8 DOWNTO 1)), IDX_LOOP_idx1_acc_psp_4_sva,
      (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), (IDX_LOOP_idx1_acc_psp_3_sva(8 DOWNTO
      1)), (IDX_LOOP_idx2_acc_1_psp_sva(8 DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9 DOWNTO
      2)), STD_LOGIC_VECTOR'( and_dcpl_87 & and_dcpl_89 & and_dcpl_133 & and_148_nl
      & and_151_nl & and_dcpl_143));
  or_148_nl <= (fsm_output(0)) OR (fsm_output(2)) OR (NOT((IDX_LOOP_idx1_acc_psp_3_sva(0))
      AND (fsm_output(7)) AND (fsm_output(4))));
  or_146_nl <= (NOT (fsm_output(0))) OR (NOT (fsm_output(2))) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_147_nl <= MUX_s_1_2_2(or_148_nl, or_146_nl, fsm_output(6));
  nor_127_nl <= NOT((fsm_output(1)) OR mux_147_nl);
  nor_128_nl <= NOT((fsm_output(0)) OR (NOT (fsm_output(2))) OR (NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8)
      OR (fsm_output(7)) OR (NOT (fsm_output(4))));
  nor_129_nl <= NOT((NOT (fsm_output(0))) OR (fsm_output(2)) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT (fsm_output(7))) OR (fsm_output(4)));
  mux_145_nl <= MUX_s_1_2_2(nor_128_nl, nor_129_nl, fsm_output(6));
  or_140_nl <= (NOT (IDX_LOOP_idx2_acc_psp_sva(0))) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  or_138_nl <= (NOT (IDX_LOOP_idx2_acc_1_psp_sva(0))) OR (NOT (fsm_output(7))) OR
      (fsm_output(4));
  mux_144_nl <= MUX_s_1_2_2(or_140_nl, or_138_nl, fsm_output(2));
  nor_130_nl <= NOT((fsm_output(6)) OR (NOT (fsm_output(0))) OR (STAGE_LOOP_op_rshift_psp_1_sva(0))
      OR mux_144_nl);
  mux_146_nl <= MUX_s_1_2_2(mux_145_nl, nor_130_nl, fsm_output(1));
  mux_148_nl <= MUX_s_1_2_2(nor_127_nl, mux_146_nl, fsm_output(3));
  vec_rsc_0_2_i_we_d_pff <= mux_148_nl AND (fsm_output(5));
  nor_102_nl <= NOT((STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (NOT (IDX_LOOP_idx2_acc_tmp(0)))
      OR CONV_SL_1_1(fsm_output(6 DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  and_243_nl <= ((NOT((NOT (IDX_LOOP_idx2_acc_1_psp_sva(0))) OR (STAGE_LOOP_op_rshift_psp_1_sva(0))))
      OR (IDX_LOOP_idx1_acc_psp_3_sva(0))) AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111"));
  mux_150_nl <= MUX_s_1_2_2(nor_102_nl, and_243_nl, fsm_output(2));
  nor_104_nl <= NOT((NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8) OR CONV_SL_1_1(fsm_output(6
      DOWNTO 4)/=STD_LOGIC_VECTOR'("000")));
  nor_105_nl <= NOT((NOT (IDX_LOOP_idx2_acc_1_psp_sva(0))) OR (NOT IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm)
      OR (STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (NOT((IDX_LOOP_idx1_acc_psp_3_sva(0))
      AND CONV_SL_1_1(fsm_output(6 DOWNTO 4)=STD_LOGIC_VECTOR'("111")))));
  mux_149_nl <= MUX_s_1_2_2(nor_104_nl, nor_105_nl, fsm_output(2));
  mux_151_nl <= MUX_s_1_2_2(mux_150_nl, mux_149_nl, fsm_output(0));
  and_242_nl <= (fsm_output(1)) AND mux_151_nl;
  nor_106_nl <= NOT((fsm_output(1)) OR (NOT (fsm_output(0))) OR (NOT (fsm_output(2)))
      OR (fsm_output(6)) OR (NOT IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm) OR (IDX_LOOP_idx2_9_0_2_sva(0))
      OR (NOT((IDX_LOOP_idx2_9_0_2_sva(1)) AND CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11")))));
  mux_152_nl <= MUX_s_1_2_2(and_242_nl, nor_106_nl, fsm_output(3));
  nor_107_nl <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 0)/=STD_LOGIC_VECTOR'("0001"))
      OR (NOT IDX_LOOP_slc_IDX_LOOP_acc_8_itm) OR CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (fsm_output(6)) OR nand_24_cse);
  vec_rsc_0_2_i_re_d_pff <= MUX_s_1_2_2(mux_152_nl, nor_107_nl, fsm_output(7));
  and_120_nl <= and_dcpl_109 AND and_dcpl_108;
  and_123_nl <= and_cse AND ((NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8) OR (fsm_output(0)))
      AND and_dcpl_111;
  and_130_nl <= and_dcpl_119 AND (IDX_LOOP_idx1_acc_psp_3_sva(0)) AND (fsm_output(7))
      AND and_dcpl;
  and_134_nl <= and_dcpl_123 AND and_dcpl_122;
  vec_rsc_0_3_i_radr_d <= MUX1HOT_v_8_6_2((IDX_LOOP_idx2_acc_tmp(8 DOWNTO 1)), IDX_LOOP_idx1_acc_psp_4_sva,
      (IDX_LOOP_idx2_9_0_2_sva(9 DOWNTO 2)), (IDX_LOOP_idx2_acc_1_psp_sva(8 DOWNTO
      1)), (IDX_LOOP_idx1_acc_psp_3_sva(8 DOWNTO 1)), (IDX_LOOP_idx2_9_0_sva(9 DOWNTO
      2)), STD_LOGIC_VECTOR'( and_dcpl_87 & and_120_nl & and_123_nl & and_dcpl_114
      & and_130_nl & and_134_nl));
  nor_131_nl <= NOT((NOT (fsm_output(4))) OR (fsm_output(7)) OR (NOT((fsm_output(3))
      AND (IDX_LOOP_idx2_acc_psp_sva(0)))));
  nor_132_nl <= NOT((NOT (IDX_LOOP_idx2_acc_1_psp_sva(0))) OR (fsm_output(4)) OR
      not_tmp_87);
  mux_134_nl <= MUX_s_1_2_2(nor_131_nl, nor_132_nl, fsm_output(2));
  and_265_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
      AND mux_134_nl;
  nor_133_nl <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(4)) OR not_tmp_87);
  nor_134_nl <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (NOT (fsm_output(4))) OR (fsm_output(7)) OR (fsm_output(3)));
  mux_132_nl <= MUX_s_1_2_2(nor_133_nl, nor_134_nl, fsm_output(2));
  and_266_nl <= (fsm_output(0)) AND mux_132_nl;
  or_114_nl <= (NOT (IDX_LOOP_idx1_acc_psp_3_sva(0))) OR (fsm_output(4)) OR not_tmp_87;
  or_112_nl <= (NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8) OR (NOT (fsm_output(4))) OR
      (fsm_output(7)) OR (fsm_output(3));
  mux_131_nl <= MUX_s_1_2_2(or_114_nl, or_112_nl, fsm_output(2));
  nor_135_nl <= NOT((fsm_output(0)) OR mux_131_nl);
  mux_133_nl <= MUX_s_1_2_2(and_266_nl, nor_135_nl, fsm_output(1));
  mux_135_nl <= MUX_s_1_2_2(and_265_nl, mux_133_nl, fsm_output(6));
  vec_rsc_0_3_i_we_d_pff <= mux_135_nl AND (fsm_output(5));
  nor_110_nl <= NOT((fsm_output(5)) OR (fsm_output(6)) OR (fsm_output(3)) OR (fsm_output(2))
      OR (NOT (fsm_output(1))) OR (fsm_output(0)) OR (NOT (IDX_LOOP_idx2_acc_tmp(0)))
      OR (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0))) OR (fsm_output(7)));
  and_245_nl <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(7));
  mux_138_nl <= MUX_s_1_2_2(and_245_nl, (fsm_output(7)), IDX_LOOP_idx1_acc_psp_3_sva(0));
  nand_25_nl <= NOT(IDX_LOOP_slc_IDX_LOOP_acc_8_itm AND (IDX_LOOP_idx1_acc_psp_3_sva(0))
      AND CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (fsm_output(7)));
  mux_139_nl <= MUX_s_1_2_2((NOT mux_138_nl), nand_25_nl, fsm_output(0));
  nor_111_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"))
      OR mux_139_nl);
  or_126_nl <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11"))
      OR (fsm_output(7));
  mux_136_nl <= MUX_s_1_2_2(or_126_nl, (fsm_output(7)), reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8);
  nand_26_nl <= NOT(reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 AND IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm
      AND CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND (NOT (fsm_output(7))));
  mux_137_nl <= MUX_s_1_2_2(mux_136_nl, nand_26_nl, fsm_output(0));
  nor_112_nl <= NOT(CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"))
      OR mux_137_nl);
  mux_140_nl <= MUX_s_1_2_2(nor_111_nl, nor_112_nl, fsm_output(3));
  and_246_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 0)=STD_LOGIC_VECTOR'("0111")) AND
      IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm AND (IDX_LOOP_idx2_acc_1_psp_sva(0)) AND
      (STAGE_LOOP_op_rshift_psp_1_sva(0)) AND (NOT (fsm_output(7)));
  mux_141_nl <= MUX_s_1_2_2(mux_140_nl, and_246_nl, fsm_output(6));
  and_244_nl <= (fsm_output(5)) AND mux_141_nl;
  vec_rsc_0_3_i_re_d_pff <= MUX_s_1_2_2(nor_110_nl, and_244_nl, fsm_output(4));
  twiddle_rsc_0_0_i_radr_d_pff <= z_out_4(9 DOWNTO 2);
  or_110_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_111_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_129_nl <= MUX_s_1_2_2(mux_tmp_95, or_110_nl, or_111_nl);
  twiddle_rsc_0_0_i_re_d_pff <= (NOT mux_129_nl) AND and_dcpl_85;
  or_103_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_101_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_123_nl <= MUX_s_1_2_2(mux_tmp_95, or_tmp_70, or_101_nl);
  nor_49_nl <= NOT(CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")));
  mux_124_nl <= MUX_s_1_2_2(or_103_nl, mux_123_nl, nor_49_nl);
  twiddle_rsc_0_1_i_re_d_pff <= (NOT mux_124_nl) AND and_dcpl_85;
  nor_47_nl <= NOT(CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")));
  mux_118_nl <= MUX_s_1_2_2(or_tmp_70, mux_tmp_95, nor_47_nl);
  or_97_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(fsm_output(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_95_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  mux_119_nl <= MUX_s_1_2_2(mux_118_nl, or_97_nl, or_95_nl);
  twiddle_rsc_0_2_i_re_d_pff <= (NOT mux_119_nl) AND and_dcpl_85;
  nand_43_nl <= NOT(CONV_SL_1_1(z_out_4(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(fsm_output(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10")));
  and_247_nl <= CONV_SL_1_1(z_out_4(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  mux_114_nl <= MUX_s_1_2_2(nand_43_nl, mux_tmp_95, and_247_nl);
  twiddle_rsc_0_3_i_re_d_pff <= (NOT mux_114_nl) AND and_dcpl_85;
  and_304_cse <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("11101100"));
  and_dcpl_252 <= NOT(CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("00000010")));
  and_dcpl_264 <= (NOT (fsm_output(3))) AND (NOT (fsm_output(5))) AND and_dcpl_37;
  and_dcpl_278 <= and_dcpl_264 AND and_dcpl_50 AND (NOT (fsm_output(0))) AND (NOT
      (fsm_output(6)));
  and_dcpl_284 <= and_dcpl_38 AND (NOT (fsm_output(4))) AND (NOT (fsm_output(2)));
  and_dcpl_289 <= and_dcpl_284 AND and_dcpl_50 AND and_dcpl;
  and_dcpl_291 <= and_dcpl_284 AND and_dcpl_50 AND and_dcpl_63;
  and_dcpl_294 <= and_dcpl_38 AND (NOT (fsm_output(4))) AND (fsm_output(2));
  and_dcpl_295 <= and_dcpl_294 AND and_dcpl_35 AND and_dcpl;
  and_dcpl_296 <= and_dcpl_294 AND and_dcpl_64;
  and_dcpl_303 <= and_416_cse AND (fsm_output(4)) AND (fsm_output(2)) AND (fsm_output(1))
      AND (NOT (fsm_output(7))) AND and_dcpl;
  and_dcpl_309 <= and_416_cse AND and_dcpl_55 AND (NOT (fsm_output(1))) AND (NOT
      (fsm_output(7))) AND (NOT (fsm_output(0))) AND (fsm_output(6));
  and_391_cse <= (NOT (fsm_output(3))) AND (fsm_output(5)) AND and_dcpl_55 AND (fsm_output(1))
      AND (fsm_output(7)) AND and_dcpl;
  and_dcpl_320 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0001")));
  and_dcpl_321 <= and_dcpl_320 AND and_dcpl_35 AND and_dcpl;
  mux_nl <= MUX_s_1_2_2(and_dcpl_320, nor_tmp_35, fsm_output(1));
  nor_178_nl <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 1)/=STD_LOGIC_VECTOR'("11001")));
  mux_246_nl <= MUX_s_1_2_2(mux_nl, nor_178_nl, fsm_output(7));
  nor_179_nl <= NOT((fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2)) OR (NOT(CONV_SL_1_1(fsm_output(5
      DOWNTO 3)=STD_LOGIC_VECTOR'("111")))));
  mux_247_nl <= MUX_s_1_2_2(mux_246_nl, nor_179_nl, fsm_output(6));
  and_dcpl_322 <= mux_247_nl AND (fsm_output(0));
  and_dcpl_325 <= nor_tmp_35 AND (fsm_output(1)) AND (NOT (fsm_output(7))) AND and_dcpl;
  and_dcpl_331 <= (fsm_output(5)) AND (fsm_output(3)) AND and_dcpl_55 AND and_dcpl_35
      AND (NOT (fsm_output(0))) AND (fsm_output(6));
  and_362_ssc <= and_dcpl_284 AND and_dcpl_64;
  IDX_LOOP_or_2_tmp <= and_dcpl_322 OR and_dcpl_325 OR and_dcpl_331 OR and_391_cse;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_i_3_0_sva <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( ((and_dcpl_39 AND and_dcpl_36) OR STAGE_LOOP_i_3_0_sva_mx0c1) = '1'
          ) THEN
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
      ELSIF ( (MUX_s_1_2_2(nor_116_nl, and_tmp_8, fsm_output(6))) = '1' ) THEN
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
        IDX_LOOP_f1_and_1_itm <= '0';
        IDX_LOOP_f1_and_2_itm <= '0';
        IDX_LOOP_f1_and_3_itm <= '0';
        IDX_LOOP_f1_and_5_itm <= '0';
        IDX_LOOP_f1_and_6_itm <= '0';
        IDX_LOOP_f1_and_7_itm <= '0';
        reg_IDX_LOOP_1_lshift_idiv_ftd_8 <= STD_LOGIC_VECTOR'( "00");
      ELSE
        reg_IDX_LOOP_1_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
        reg_ensig_cgo_cse <= mux_98_rmff;
        IDX_LOOP_1_IDX_LOOP_rem_1_cmp_a <= MUX_v_128_2_2(z_out_3, IDX_LOOP_1_mul_mut,
            mux_109_nl);
        reg_twiddle_rsc_triosy_0_0_obj_ld_cse <= and_416_cse AND (NOT (fsm_output(4)))
            AND and_dcpl_79 AND (fsm_output(7)) AND (fsm_output(0)) AND (fsm_output(6))
            AND STAGE_LOOP_acc_itm_4_1;
        IDX_LOOP_f1_and_1_itm <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) AND (NOT (IDX_LOOP_idx2_acc_tmp(0)))
            AND (NOT (z_out_3(0)));
        IDX_LOOP_f1_and_2_itm <= (IDX_LOOP_idx2_acc_tmp(0)) AND (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0)))
            AND (NOT (z_out_3(0)));
        IDX_LOOP_f1_and_3_itm <= (IDX_LOOP_idx2_acc_tmp(0)) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
            AND (NOT (z_out_3(0)));
        IDX_LOOP_f1_and_5_itm <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) AND (NOT (IDX_LOOP_idx2_acc_tmp(0)))
            AND (z_out_3(0));
        IDX_LOOP_f1_and_6_itm <= (IDX_LOOP_idx2_acc_tmp(0)) AND (NOT (STAGE_LOOP_op_rshift_psp_1_sva(0)))
            AND (z_out_3(0));
        IDX_LOOP_f1_and_7_itm <= (IDX_LOOP_idx2_acc_tmp(0)) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
            AND (z_out_3(0));
        reg_IDX_LOOP_1_lshift_idiv_ftd_8 <= z_out_4(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_op_rshift_psp_1_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( not_tmp_126 = '0' ) THEN
        STAGE_LOOP_op_rshift_psp_1_sva <= STAGE_LOOP_op_rshift_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_gp_lshift_psp_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( not_tmp_126 = '0' ) THEN
        STAGE_LOOP_gp_lshift_psp_sva <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        GROUP_LOOP_j_10_0_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (GROUP_LOOP_j_10_0_sva_9_0_mx0c0 OR (and_dcpl_46 AND and_dcpl_42 AND
          and_dcpl_53)) = '1' ) THEN
        GROUP_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out(9 DOWNTO 0)), GROUP_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_t_10_2_sva_7_0 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (MUX_s_1_2_2(or_290_nl, mux_251_nl, fsm_output(7))) = '1' ) THEN
        IDX_LOOP_t_10_2_sva_7_0 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), reg_IDX_LOOP_t_10_2_ftd_1,
            or_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        STAGE_LOOP_gp_acc_psp_sva <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( not_tmp_126 = '0' ) THEN
        STAGE_LOOP_gp_acc_psp_sva <= z_out_2(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_acc_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( or_dcpl_25 = '0' ) THEN
        IDX_LOOP_idx2_acc_psp_sva <= IDX_LOOP_idx2_acc_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx1_acc_psp_4_sva <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( and_dcpl_165 = '0' ) THEN
        IDX_LOOP_idx1_acc_psp_4_sva <= IDX_LOOP_idx1_acc_psp_4_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_9_0_2_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(mux_190_nl AND (NOT (fsm_output(7))))) = '1' ) THEN
        IDX_LOOP_idx2_9_0_2_sva <= IDX_LOOP_idx2_9_0_2_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= '0';
      ELSIF ( or_dcpl_25 = '0' ) THEN
        IDX_LOOP_2_slc_IDX_LOOP_acc_10_itm <= z_out(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_itm <= '0';
      ELSIF ( (NOT((NOT mux_195_nl) AND and_dcpl_11)) = '1' ) THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_itm <= MUX_s_1_2_2(IDX_LOOP_f1_IDX_LOOP_f1_nor_nl,
            IDX_LOOP_f1_and_9_nl, and_179_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_acc_1_psp_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2(mux_198_nl, (fsm_output(7)), fsm_output(6))) = '1' ) THEN
        IDX_LOOP_idx2_acc_1_psp_sva <= IDX_LOOP_idx2_acc_1_psp_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx1_acc_psp_3_sva <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (MUX_s_1_2_2((NOT mux_201_itm), and_tmp_11, fsm_output(6))) = '1' )
          THEN
        IDX_LOOP_idx1_acc_psp_3_sva <= IDX_LOOP_idx1_acc_psp_3_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm <= '0';
      ELSIF ( (NOT(mux_204_nl AND (NOT (fsm_output(7))))) = '1' ) THEN
        IDX_LOOP_3_slc_IDX_LOOP_acc_10_itm <= IDX_LOOP_3_acc_nl(10);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_1_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_1_itm <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (z_out_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_6_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_6_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (NOT (z_out_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_7_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_7_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND (NOT (z_out_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_8_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_8_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (NOT (z_out_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_9_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_9_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (z_out_3(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_10_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_10_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND (z_out_3(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_11_itm <= '0';
      ELSIF ( and_dcpl_171 = '0' ) THEN
        IDX_LOOP_f2_IDX_LOOP_f2_and_11_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (z_out_3(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_idx2_9_0_sva <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (MUX_s_1_2_2((NOT mux_201_itm), mux_209_nl, fsm_output(6))) = '1' )
          THEN
        IDX_LOOP_idx2_9_0_sva <= IDX_LOOP_idx2_9_0_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_slc_IDX_LOOP_acc_8_itm <= '0';
        reg_IDX_LOOP_t_10_2_ftd_1 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( mux_214_itm = '1' ) THEN
        IDX_LOOP_slc_IDX_LOOP_acc_8_itm <= IDX_LOOP_acc_nl(8);
        reg_IDX_LOOP_t_10_2_ftd_1 <= z_out_2(7 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_2_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_2_itm <= NOT((IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0))
            OR (STAGE_LOOP_op_rshift_psp_1_sva(0)) OR (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_11_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_11_itm <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) AND (NOT (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)))
            AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_12_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_12_itm <= (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)) AND (NOT
            (STAGE_LOOP_op_rshift_psp_1_sva(0))) AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_13_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_13_itm <= (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
            AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_15_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_15_itm <= (STAGE_LOOP_op_rshift_psp_1_sva(0)) AND (NOT (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)))
            AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_16_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_16_itm <= (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)) AND (NOT
            (STAGE_LOOP_op_rshift_psp_1_sva(0))) AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_and_17_itm <= '0';
      ELSIF ( and_dcpl_172 = '0' ) THEN
        IDX_LOOP_f1_and_17_itm <= (IDX_LOOP_idx2_acc_1_psp_sva_mx0w0(0)) AND (STAGE_LOOP_op_rshift_psp_1_sva(0))
            AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= '0';
      ELSIF ( (MUX_s_1_2_2((NOT mux_201_itm), mux_216_nl, fsm_output(6))) = '1' )
          THEN
        IDX_LOOP_1_slc_IDX_LOOP_acc_10_itm <= z_out_1_10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_3_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_18_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_19_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_20_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_21_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_22_itm <= '0';
        IDX_LOOP_f2_IDX_LOOP_f2_and_23_itm <= '0';
      ELSIF ( mux_220_itm = '1' ) THEN
        IDX_LOOP_f1_IDX_LOOP_f1_nor_3_itm <= NOT(CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
        IDX_LOOP_f2_IDX_LOOP_f2_and_18_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
        IDX_LOOP_f2_IDX_LOOP_f2_and_19_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
        IDX_LOOP_f2_IDX_LOOP_f2_and_20_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (NOT (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0)));
        IDX_LOOP_f2_IDX_LOOP_f2_and_21_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("01")) AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
        IDX_LOOP_f2_IDX_LOOP_f2_and_22_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("10")) AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
        IDX_LOOP_f2_IDX_LOOP_f2_and_23_itm <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva_mx0w0(1
            DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND (IDX_LOOP_idx1_acc_psp_3_sva_mx0w0(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_1_lpi_4_dfm_2 <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (and_dcpl_89 OR and_dcpl_174 OR and_dcpl_52 OR and_dcpl_114 OR and_dcpl_57
          OR and_dcpl_62) = '1' ) THEN
        tmp_1_lpi_4_dfm_2 <= MUX1HOT_v_64_5_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d,
            vec_rsc_0_2_i_q_d, vec_rsc_0_3_i_q_d, z_out_5, STD_LOGIC_VECTOR'( IDX_LOOP_f2_and_nl
            & IDX_LOOP_f2_and_1_nl & IDX_LOOP_f2_or_nl & IDX_LOOP_f2_or_1_nl & IDX_LOOP_f2_or_3_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_modulo_dev_return_1_sva <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (IDX_LOOP_modulo_dev_return_1_sva_mx0c0 OR IDX_LOOP_modulo_dev_return_1_sva_mx0c1
          OR IDX_LOOP_modulo_dev_return_1_sva_mx0c2 OR IDX_LOOP_modulo_dev_return_1_sva_mx0c3
          OR IDX_LOOP_modulo_dev_return_1_sva_mx0c4 OR and_dcpl_174 OR and_dcpl_114)
          = '1' ) THEN
        IDX_LOOP_modulo_dev_return_1_sva <= MUX1HOT_v_64_7_2(twiddle_rsc_0_0_i_q_d,
            twiddle_rsc_0_1_i_q_d, twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d,
            IDX_LOOP_1_modulo_dev_cmp_return_rsc_z, vec_rsc_0_1_i_q_d, vec_rsc_0_0_i_q_d,
            STD_LOGIC_VECTOR'( IDX_LOOP_modulo_dev_return_1_sva_mx0c0 & IDX_LOOP_modulo_dev_return_1_sva_mx0c1
            & IDX_LOOP_modulo_dev_return_1_sva_mx0c2 & IDX_LOOP_modulo_dev_return_1_sva_mx0c3
            & IDX_LOOP_modulo_dev_return_1_sva_mx0c4 & and_dcpl_174 & and_dcpl_114));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_mux1h_1_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (mux_234_nl OR (fsm_output(7))) = '1' ) THEN
        IDX_LOOP_mux1h_1_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( and_207_nl
            & and_209_nl & and_211_nl & and_213_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        tmp_2_lpi_4_dfm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (tmp_2_lpi_4_dfm_mx0c0 OR tmp_2_lpi_4_dfm_mx0c1 OR and_dcpl_133 OR
          and_dcpl_114 OR and_dcpl_143) = '1' ) THEN
        tmp_2_lpi_4_dfm <= MUX1HOT_v_64_4_2(vec_rsc_0_0_i_q_d, vec_rsc_0_2_i_q_d,
            vec_rsc_0_1_i_q_d, vec_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( IDX_LOOP_f1_or_11_nl
            & IDX_LOOP_f1_or_12_nl & IDX_LOOP_f1_or_13_nl & IDX_LOOP_f1_or_14_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_mux1h_2_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (mux_238_nl OR (fsm_output(7))) = '1' ) THEN
        IDX_LOOP_mux1h_2_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( and_217_nl
            & and_218_nl & and_219_nl & and_220_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_mux1h_3_itm <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (MUX_s_1_2_2(mux_241_nl, (fsm_output(7)), fsm_output(6))) = '1' ) THEN
        IDX_LOOP_mux1h_3_itm <= MUX1HOT_v_64_4_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
            twiddle_rsc_0_2_i_q_d, twiddle_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( and_223_nl
            & and_224_nl & and_225_nl & and_226_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        IDX_LOOP_1_mul_mut <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (((NOT (fsm_output(5))) AND (fsm_output(3)) AND and_dcpl_37 AND and_dcpl_64)
          OR (and_dcpl_39 AND and_dcpl_68) OR (nor_tmp_35 AND and_dcpl_70) OR (and_dcpl_74
          AND and_dcpl_72)) = '1' ) THEN
        IDX_LOOP_1_mul_mut <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 <= '0';
      ELSIF ( and_dcpl_165 = '0' ) THEN
        reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 <= z_out_3(0);
      END IF;
    END IF;
  END PROCESS;
  nor_116_nl <= NOT((fsm_output(0)) OR (fsm_output(7)) OR (fsm_output(1)) OR (fsm_output(2))
      OR (fsm_output(4)) OR (fsm_output(3)) OR (fsm_output(5)));
  mux_107_nl <= MUX_s_1_2_2(or_tmp_5, nand_28_cse, fsm_output(5));
  or_86_nl <= (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(4));
  or_85_nl <= (NOT (fsm_output(2))) OR (fsm_output(7)) OR (NOT (fsm_output(4)));
  or_83_nl <= (fsm_output(7)) OR (NOT (fsm_output(4)));
  mux_103_nl <= MUX_s_1_2_2((NOT (fsm_output(4))), (fsm_output(4)), fsm_output(7));
  mux_104_nl <= MUX_s_1_2_2(or_83_nl, mux_103_nl, fsm_output(2));
  mux_105_nl <= MUX_s_1_2_2(or_85_nl, mux_104_nl, and_251_cse);
  mux_106_nl <= MUX_s_1_2_2(or_86_nl, mux_105_nl, fsm_output(5));
  mux_108_nl <= MUX_s_1_2_2(mux_107_nl, mux_106_nl, fsm_output(3));
  or_263_nl <= (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(4));
  nand_29_nl <= NOT((and_252_cse OR (fsm_output(7))) AND (fsm_output(4)));
  mux_101_nl <= MUX_s_1_2_2(or_263_nl, nand_29_nl, fsm_output(5));
  or_79_nl <= (((fsm_output(0)) OR (fsm_output(2))) AND (fsm_output(7))) OR (fsm_output(4));
  mux_99_nl <= MUX_s_1_2_2(or_tmp_5, (fsm_output(7)), fsm_output(2));
  mux_100_nl <= MUX_s_1_2_2(or_79_nl, mux_99_nl, fsm_output(1));
  nand_30_nl <= NOT((fsm_output(5)) AND mux_100_nl);
  mux_102_nl <= MUX_s_1_2_2(mux_101_nl, nand_30_nl, fsm_output(3));
  mux_109_nl <= MUX_s_1_2_2(mux_108_nl, mux_102_nl, fsm_output(6));
  GROUP_LOOP_j_not_1_nl <= NOT GROUP_LOOP_j_10_0_sva_9_0_mx0c0;
  or_281_nl <= (NOT (fsm_output(0))) OR (fsm_output(7)) OR (fsm_output(3)) OR (fsm_output(2))
      OR (fsm_output(5));
  or_282_nl <= (fsm_output(0)) OR (NOT((fsm_output(7)) AND (fsm_output(3)) AND (fsm_output(2))
      AND (fsm_output(5))));
  mux_82_nl <= MUX_s_1_2_2(or_281_nl, or_282_nl, fsm_output(6));
  or_nl <= mux_82_nl OR (fsm_output(4)) OR (fsm_output(1));
  or_289_nl <= (NOT (fsm_output(2))) OR (fsm_output(0)) OR (fsm_output(4)) OR (fsm_output(5))
      OR (fsm_output(3));
  or_288_nl <= CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"));
  mux_252_nl <= MUX_s_1_2_2(or_289_nl, or_288_nl, fsm_output(1));
  or_290_nl <= (fsm_output(6)) OR mux_252_nl;
  mux_248_nl <= MUX_s_1_2_2(and_416_cse, (fsm_output(5)), fsm_output(4));
  mux_249_nl <= MUX_s_1_2_2(and_dcpl_4, mux_248_nl, fsm_output(2));
  mux_251_nl <= MUX_s_1_2_2((NOT mux_250_cse), mux_249_nl, fsm_output(6));
  mux_189_nl <= MUX_s_1_2_2(and_cse, and_dcpl_4, and_252_cse);
  mux_190_nl <= MUX_s_1_2_2(or_tmp_193, (NOT mux_189_nl), fsm_output(6));
  IDX_LOOP_f1_IDX_LOOP_f1_nor_nl <= NOT((IDX_LOOP_idx2_acc_tmp(0)) OR (STAGE_LOOP_op_rshift_psp_1_sva(0))
      OR (z_out_3(0)));
  IDX_LOOP_f1_and_9_nl <= CONV_SL_1_1(IDX_LOOP_idx2_9_0_2_sva(1 DOWNTO 0)=STD_LOGIC_VECTOR'("00"))
      AND reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8;
  and_179_nl <= and_dcpl_38 AND and_269_cse AND and_dcpl_51;
  mux_193_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), and_231_cse);
  mux_194_nl <= MUX_s_1_2_2(not_tmp_39, mux_193_nl, and_232_cse);
  mux_191_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), and_416_cse, fsm_output(4));
  mux_192_nl <= MUX_s_1_2_2(not_tmp_39, mux_191_nl, and_232_cse);
  mux_195_nl <= MUX_s_1_2_2(mux_194_nl, mux_192_nl, fsm_output(0));
  mux_197_nl <= MUX_s_1_2_2(and_dcpl_39, and_dcpl_4, fsm_output(7));
  mux_196_nl <= MUX_s_1_2_2(not_tmp_139, mux_tmp_74, fsm_output(7));
  mux_198_nl <= MUX_s_1_2_2(mux_197_nl, mux_196_nl, fsm_output(0));
  IDX_LOOP_3_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT STAGE_LOOP_op_rshift_psp_1_sva))
      + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_t_10_2_sva_7_0 & STD_LOGIC_VECTOR'(
      "10")), 10), 11) + SIGNED'( "00000000001"), 11));
  and_230_nl <= CONV_SL_1_1(fsm_output(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"));
  mux_203_nl <= MUX_s_1_2_2(and_cse, and_dcpl_4, and_230_nl);
  mux_204_nl <= MUX_s_1_2_2(or_tmp_193, (NOT mux_203_nl), fsm_output(6));
  and_184_nl <= (fsm_output(7)) AND nor_tmp_7;
  mux_209_nl <= MUX_s_1_2_2(and_tmp_11, and_184_nl, fsm_output(0));
  IDX_LOOP_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (NOT (STAGE_LOOP_op_rshift_psp_1_sva(9
      DOWNTO 2)))) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_t_10_2_sva_7_0),
      8), 9) + UNSIGNED'( "000000001"), 9));
  mux_216_nl <= MUX_s_1_2_2(and_tmp_10, and_tmp_11, fsm_output(0));
  IDX_LOOP_f2_and_nl <= (IDX_LOOP_f1_IDX_LOOP_f1_nor_itm OR ((NOT((IDX_LOOP_idx2_acc_psp_sva(0))
      OR (STAGE_LOOP_op_rshift_psp_1_sva(0)))) AND reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8))
      AND and_dcpl_89;
  IDX_LOOP_f2_and_1_nl <= (IDX_LOOP_f1_and_1_itm OR IDX_LOOP_f1_and_5_itm) AND and_dcpl_89;
  IDX_LOOP_f2_or_nl <= ((IDX_LOOP_f1_and_2_itm OR IDX_LOOP_f1_and_6_itm) AND and_dcpl_89)
      OR and_dcpl_114;
  IDX_LOOP_f2_or_1_nl <= ((IDX_LOOP_f1_and_3_itm OR IDX_LOOP_f1_and_7_itm) AND and_dcpl_89)
      OR and_dcpl_174;
  IDX_LOOP_f2_or_3_nl <= and_dcpl_52 OR and_dcpl_57 OR and_dcpl_62;
  and_207_nl <= and_dcpl_193 AND and_dcpl_192;
  and_209_nl <= and_dcpl_193 AND and_dcpl_195;
  and_211_nl <= and_dcpl_193 AND and_dcpl_197;
  and_213_nl <= and_dcpl_193 AND and_dcpl_199;
  nor_85_nl <= NOT(and_252_cse OR CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000")));
  mux_234_nl <= MUX_s_1_2_2(nor_85_nl, or_tmp_193, fsm_output(6));
  IDX_LOOP_f1_or_11_nl <= tmp_2_lpi_4_dfm_mx0c0 OR ((NOT (IDX_LOOP_idx1_acc_psp_3_sva(0)))
      AND and_dcpl_114);
  IDX_LOOP_f1_or_12_nl <= tmp_2_lpi_4_dfm_mx0c1 OR ((IDX_LOOP_idx1_acc_psp_3_sva(0))
      AND and_dcpl_114);
  IDX_LOOP_f1_or_13_nl <= ((NOT reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8) AND and_dcpl_133)
      OR ((NOT (IDX_LOOP_idx1_acc_psp_3_sva(0))) AND and_dcpl_143);
  IDX_LOOP_f1_or_14_nl <= (reg_IDX_LOOP_1_idx1_mul_sdt_ftd_8 AND and_dcpl_133) OR
      ((IDX_LOOP_idx1_acc_psp_3_sva(0)) AND and_dcpl_143);
  and_217_nl <= and_dcpl_193 AND and_dcpl_178;
  and_218_nl <= and_dcpl_193 AND and_dcpl_181;
  and_219_nl <= and_dcpl_193 AND and_dcpl_184;
  and_220_nl <= and_dcpl_193 AND and_dcpl_187;
  and_227_nl <= or_265_cse AND CONV_SL_1_1(fsm_output(5 DOWNTO 2)=STD_LOGIC_VECTOR'("1111"));
  mux_238_nl <= MUX_s_1_2_2(not_tmp_163, and_227_nl, fsm_output(6));
  and_223_nl <= and_dcpl_209 AND and_dcpl_192;
  and_224_nl <= and_dcpl_209 AND and_dcpl_195;
  and_225_nl <= and_dcpl_209 AND and_dcpl_197;
  and_226_nl <= and_dcpl_209 AND and_dcpl_199;
  mux_240_nl <= MUX_s_1_2_2(and_dcpl_84, and_cse, fsm_output(7));
  mux_239_nl <= MUX_s_1_2_2(not_tmp_163, mux_tmp_172, fsm_output(7));
  mux_241_nl <= MUX_s_1_2_2(mux_240_nl, mux_239_nl, fsm_output(0));
  IDX_LOOP_mux_13_nl <= MUX_v_10_2_2((NOT STAGE_LOOP_op_rshift_psp_1_sva), GROUP_LOOP_j_10_0_sva_9_0,
      and_304_cse);
  IDX_LOOP_IDX_LOOP_nand_1_nl <= NOT(and_304_cse AND (NOT(and_dcpl_38 AND and_dcpl_37
      AND (fsm_output(1)) AND (NOT (fsm_output(7))) AND and_dcpl)));
  not_698_nl <= NOT and_304_cse;
  IDX_LOOP_IDX_LOOP_and_1_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), IDX_LOOP_t_10_2_sva_7_0,
      not_698_nl);
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED((NOT and_304_cse) & IDX_LOOP_mux_13_nl
      & IDX_LOOP_IDX_LOOP_nand_1_nl) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_IDX_LOOP_and_1_nl
      & STD_LOGIC_VECTOR'( "011")), 11), 12), 12));
  z_out <= acc_nl(11 DOWNTO 1);
  IDX_LOOP_mux_14_nl <= MUX_v_11_2_2((z_out_2 & STD_LOGIC_VECTOR'( "00")), z_out,
      and_304_cse);
  IDX_LOOP_mux_15_nl <= MUX_v_10_2_2((NOT STAGE_LOOP_op_rshift_psp_1_sva), (NOT STAGE_LOOP_gp_lshift_psp_sva),
      and_304_cse);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(IDX_LOOP_mux_14_nl & '1') +
      UNSIGNED('1' & IDX_LOOP_mux_15_nl & '1'), 12));
  z_out_1_10 <= acc_1_nl(11);
  STAGE_LOOP_gp_mux_5_nl <= MUX_v_8_2_2((STD_LOGIC_VECTOR'( "0000") & STAGE_LOOP_i_3_0_sva),
      IDX_LOOP_t_10_2_sva_7_0, and_dcpl_252);
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_gp_mux_5_nl),
      9) + CONV_UNSIGNED(CONV_SIGNED(SIGNED'( (NOT and_dcpl_252) & '1'), 2), 9),
      9));
  and_418_nl <= (fsm_output(3)) AND (NOT (fsm_output(5))) AND and_dcpl_37 AND and_dcpl_35
      AND and_dcpl_63;
  and_419_nl <= and_dcpl_264 AND and_dcpl_50 AND and_dcpl_41;
  and_420_nl <= (fsm_output(3)) AND (fsm_output(5)) AND and_269_cse AND and_dcpl_35
      AND and_dcpl_41;
  and_421_nl <= (NOT (fsm_output(3))) AND (fsm_output(5)) AND and_269_cse AND (fsm_output(1))
      AND (fsm_output(7)) AND and_dcpl_63;
  IDX_LOOP_mux1h_27_nl <= MUX1HOT_v_64_5_2(IDX_LOOP_modulo_dev_return_1_sva, IDX_LOOP_mux1h_1_itm,
      IDX_LOOP_mux1h_2_itm, IDX_LOOP_mux1h_3_itm, (STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & (GROUP_LOOP_j_10_0_sva_9_0(8 DOWNTO 0))), STD_LOGIC_VECTOR'( and_418_nl &
      and_419_nl & and_420_nl & and_421_nl & and_dcpl_278));
  IDX_LOOP_mux_16_nl <= MUX_v_64_2_2(IDX_LOOP_1_modulo_dev_cmp_return_rsc_z, (STD_LOGIC_VECTOR'(
      "0000000000000000000000000000000000000000000000000000000") & (STAGE_LOOP_op_rshift_psp_1_sva(8
      DOWNTO 0))), and_dcpl_278);
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(IDX_LOOP_mux1h_27_nl)
      * UNSIGNED(IDX_LOOP_mux_16_nl)), 128));
  IDX_LOOP_f1_or_19_nl <= IDX_LOOP_f2_IDX_LOOP_f2_and_7_itm OR IDX_LOOP_f2_IDX_LOOP_f2_and_10_itm;
  IDX_LOOP_f1_or_20_nl <= IDX_LOOP_f2_IDX_LOOP_f2_and_19_itm OR IDX_LOOP_f2_IDX_LOOP_f2_and_22_itm;
  IDX_LOOP_f1_mux1h_42_m1c <= MUX1HOT_s_1_3_2(IDX_LOOP_f1_or_19_nl, IDX_LOOP_f1_and_12_itm,
      IDX_LOOP_f1_or_20_nl, STD_LOGIC_VECTOR'( and_dcpl_303 & and_dcpl_309 & and_391_cse));
  IDX_LOOP_f1_or_21_nl <= IDX_LOOP_f1_and_13_itm OR IDX_LOOP_f1_and_17_itm;
  IDX_LOOP_f1_mux1h_43_m1c <= MUX1HOT_s_1_3_2(IDX_LOOP_f2_IDX_LOOP_f2_and_8_itm,
      IDX_LOOP_f1_or_21_nl, IDX_LOOP_f2_IDX_LOOP_f2_and_20_itm, STD_LOGIC_VECTOR'(
      and_dcpl_303 & and_dcpl_309 & and_391_cse));
  IDX_LOOP_f1_mux1h_45_m1c <= MUX1HOT_s_1_3_2(IDX_LOOP_f2_IDX_LOOP_f2_and_11_itm,
      IDX_LOOP_f1_and_16_itm, IDX_LOOP_f2_IDX_LOOP_f2_and_23_itm, STD_LOGIC_VECTOR'(
      and_dcpl_303 & and_dcpl_309 & and_391_cse));
  IDX_LOOP_f1_or_16_nl <= IDX_LOOP_f1_IDX_LOOP_f1_nor_1_itm OR IDX_LOOP_f1_IDX_LOOP_f1_nor_itm;
  IDX_LOOP_f1_or_17_nl <= IDX_LOOP_f1_IDX_LOOP_f1_nor_3_itm OR (CONV_SL_1_1(IDX_LOOP_idx2_9_0_sva(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("00")) AND (IDX_LOOP_idx1_acc_psp_3_sva(0)));
  IDX_LOOP_f1_mux1h_40_nl <= MUX1HOT_s_1_3_2(IDX_LOOP_f1_or_16_nl, IDX_LOOP_f1_IDX_LOOP_f1_nor_2_itm,
      IDX_LOOP_f1_or_17_nl, STD_LOGIC_VECTOR'( and_dcpl_303 & and_dcpl_309 & and_391_cse));
  IDX_LOOP_f1_or_18_nl <= IDX_LOOP_f1_and_11_itm OR IDX_LOOP_f1_and_15_itm;
  IDX_LOOP_f1_mux1h_41_nl <= MUX1HOT_s_1_3_2(IDX_LOOP_f2_IDX_LOOP_f2_and_6_itm, IDX_LOOP_f1_or_18_nl,
      IDX_LOOP_f2_IDX_LOOP_f2_and_18_itm, STD_LOGIC_VECTOR'( and_dcpl_303 & and_dcpl_309
      & and_391_cse));
  IDX_LOOP_f1_or_nl <= ((NOT and_dcpl_309) AND IDX_LOOP_f1_mux1h_42_m1c) OR (and_dcpl_309
      AND IDX_LOOP_f1_mux1h_45_m1c);
  IDX_LOOP_f1_or_22_nl <= (and_dcpl_309 AND IDX_LOOP_f1_mux1h_42_m1c) OR ((NOT and_dcpl_309)
      AND IDX_LOOP_f1_mux1h_43_m1c);
  IDX_LOOP_f1_or_23_nl <= (and_dcpl_309 AND IDX_LOOP_f1_mux1h_43_m1c) OR ((NOT and_dcpl_309)
      AND IDX_LOOP_f1_mux1h_45_m1c);
  IDX_LOOP_f1_and_26_nl <= (NOT((IDX_LOOP_idx2_acc_1_psp_sva(0)) OR (STAGE_LOOP_op_rshift_psp_1_sva(0))))
      AND (IDX_LOOP_idx1_acc_psp_3_sva(0));
  IDX_LOOP_f1_mux1h_44_nl <= MUX1HOT_s_1_3_2(IDX_LOOP_f2_IDX_LOOP_f2_and_9_itm, IDX_LOOP_f1_and_26_nl,
      IDX_LOOP_f2_IDX_LOOP_f2_and_21_itm, STD_LOGIC_VECTOR'( and_dcpl_303 & and_dcpl_309
      & and_391_cse));
  z_out_5 <= MUX1HOT_v_64_6_2(vec_rsc_0_0_i_q_d, vec_rsc_0_1_i_q_d, vec_rsc_0_2_i_q_d,
      tmp_1_lpi_4_dfm_2, vec_rsc_0_3_i_q_d, IDX_LOOP_modulo_dev_return_1_sva, STD_LOGIC_VECTOR'(
      IDX_LOOP_f1_mux1h_40_nl & IDX_LOOP_f1_mux1h_41_nl & IDX_LOOP_f1_or_nl & IDX_LOOP_f1_or_22_nl
      & IDX_LOOP_f1_or_23_nl & IDX_LOOP_f1_mux1h_44_nl));
END v3;

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
    vec_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_0_re : OUT STD_LOGIC;
    vec_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_0_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_0_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    vec_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_1_re : OUT STD_LOGIC;
    vec_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_1_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_1_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    vec_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_2_re : OUT STD_LOGIC;
    vec_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_2_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_2_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    vec_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_3_re : OUT STD_LOGIC;
    vec_rsc_0_3_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    vec_rsc_0_3_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_0_3_we : OUT STD_LOGIC;
    vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_0_0_re : OUT STD_LOGIC;
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_0_1_re : OUT STD_LOGIC;
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_0_2_re : OUT STD_LOGIC;
    twiddle_rsc_0_2_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    twiddle_rsc_0_3_re : OUT STD_LOGIC;
    twiddle_rsc_0_3_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC
  );
END DIT_RELOOP;

ARCHITECTURE v3 OF DIT_RELOOP IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d_iff : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_wadr_d_iff : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_1_i_re_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_2_i_re_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_we_d_iff : STD_LOGIC;
  SIGNAL vec_rsc_0_3_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_0_i_radr_d_iff : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_2_i_re_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_3_i_re_d_iff : STD_LOGIC;

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_0_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_wadr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_1_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_wadr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_2_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_wadr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_radr_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_wadr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC;
      port_1_w_ram_ir_internal_WMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsc_0_3_i_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_wadr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_radr_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_wadr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_2_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_3_i_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT DIT_RELOOP_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      vec_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      vec_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_0_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_0_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_wadr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      vec_rsc_0_1_i_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsc_0_1_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
      vec_rsc_0_2_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_2_i_re_d_pff : OUT STD_LOGIC;
      vec_rsc_0_3_i_we_d_pff : OUT STD_LOGIC;
      vec_rsc_0_3_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_0_i_radr_d_pff : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      twiddle_rsc_0_0_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_2_i_re_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_3_i_re_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL DIT_RELOOP_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d_pff : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d_pff : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d_pff : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff : STD_LOGIC_VECTOR (7
      DOWNTO 0);

BEGIN
  vec_rsc_0_0_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_9_64_8_256_256_64_5_gen
    PORT MAP(
      we => vec_rsc_0_0_we,
      d => vec_rsc_0_0_i_d,
      wadr => vec_rsc_0_0_i_wadr,
      q => vec_rsc_0_0_i_q,
      re => vec_rsc_0_0_re,
      radr => vec_rsc_0_0_i_radr,
      radr_d => vec_rsc_0_0_i_radr_d_1,
      wadr_d => vec_rsc_0_0_i_wadr_d,
      d_d => vec_rsc_0_0_i_d_d,
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
  vec_rsc_0_0_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;
  vec_rsc_0_0_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d_1;

  vec_rsc_0_1_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_10_64_8_256_256_64_5_gen
    PORT MAP(
      we => vec_rsc_0_1_we,
      d => vec_rsc_0_1_i_d,
      wadr => vec_rsc_0_1_i_wadr,
      q => vec_rsc_0_1_i_q,
      re => vec_rsc_0_1_re,
      radr => vec_rsc_0_1_i_radr,
      radr_d => vec_rsc_0_1_i_radr_d_1,
      wadr_d => vec_rsc_0_1_i_wadr_d,
      d_d => vec_rsc_0_1_i_d_d,
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
  vec_rsc_0_1_i_wadr_d <= vec_rsc_0_1_i_wadr_d_iff;
  vec_rsc_0_1_i_d_d <= vec_rsc_0_1_i_d_d_iff;
  vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d_1;

  vec_rsc_0_2_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_11_64_8_256_256_64_5_gen
    PORT MAP(
      we => vec_rsc_0_2_we,
      d => vec_rsc_0_2_i_d,
      wadr => vec_rsc_0_2_i_wadr,
      q => vec_rsc_0_2_i_q,
      re => vec_rsc_0_2_re,
      radr => vec_rsc_0_2_i_radr,
      radr_d => vec_rsc_0_2_i_radr_d_1,
      wadr_d => vec_rsc_0_2_i_wadr_d,
      d_d => vec_rsc_0_2_i_d_d,
      we_d => vec_rsc_0_2_i_we_d_iff,
      re_d => vec_rsc_0_2_i_re_d_iff,
      q_d => vec_rsc_0_2_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_2_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_2_i_we_d_iff
    );
  vec_rsc_0_2_d <= vec_rsc_0_2_i_d;
  vec_rsc_0_2_wadr <= vec_rsc_0_2_i_wadr;
  vec_rsc_0_2_i_q <= vec_rsc_0_2_q;
  vec_rsc_0_2_radr <= vec_rsc_0_2_i_radr;
  vec_rsc_0_2_i_radr_d_1 <= vec_rsc_0_2_i_radr_d;
  vec_rsc_0_2_i_wadr_d <= vec_rsc_0_0_i_wadr_d_iff;
  vec_rsc_0_2_i_d_d <= vec_rsc_0_0_i_d_d_iff;
  vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d_1;

  vec_rsc_0_3_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rwport_12_64_8_256_256_64_5_gen
    PORT MAP(
      we => vec_rsc_0_3_we,
      d => vec_rsc_0_3_i_d,
      wadr => vec_rsc_0_3_i_wadr,
      q => vec_rsc_0_3_i_q,
      re => vec_rsc_0_3_re,
      radr => vec_rsc_0_3_i_radr,
      radr_d => vec_rsc_0_3_i_radr_d_1,
      wadr_d => vec_rsc_0_3_i_wadr_d,
      d_d => vec_rsc_0_3_i_d_d,
      we_d => vec_rsc_0_3_i_we_d_iff,
      re_d => vec_rsc_0_3_i_re_d_iff,
      q_d => vec_rsc_0_3_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => vec_rsc_0_3_i_re_d_iff,
      port_1_w_ram_ir_internal_WMASK_B_d => vec_rsc_0_3_i_we_d_iff
    );
  vec_rsc_0_3_d <= vec_rsc_0_3_i_d;
  vec_rsc_0_3_wadr <= vec_rsc_0_3_i_wadr;
  vec_rsc_0_3_i_q <= vec_rsc_0_3_q;
  vec_rsc_0_3_radr <= vec_rsc_0_3_i_radr;
  vec_rsc_0_3_i_radr_d_1 <= vec_rsc_0_3_i_radr_d;
  vec_rsc_0_3_i_wadr_d <= vec_rsc_0_1_i_wadr_d_iff;
  vec_rsc_0_3_i_d_d <= vec_rsc_0_1_i_d_d_iff;
  vec_rsc_0_3_i_q_d <= vec_rsc_0_3_i_q_d_1;

  twiddle_rsc_0_0_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_13_64_8_256_256_64_5_gen
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

  twiddle_rsc_0_1_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_14_64_8_256_256_64_5_gen
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

  twiddle_rsc_0_2_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_15_64_8_256_256_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_2_i_q,
      re => twiddle_rsc_0_2_re,
      radr => twiddle_rsc_0_2_i_radr,
      radr_d => twiddle_rsc_0_2_i_radr_d,
      re_d => twiddle_rsc_0_2_i_re_d_iff,
      q_d => twiddle_rsc_0_2_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_re_d_iff
    );
  twiddle_rsc_0_2_i_q <= twiddle_rsc_0_2_q;
  twiddle_rsc_0_2_radr <= twiddle_rsc_0_2_i_radr;
  twiddle_rsc_0_2_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;
  twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d_1;

  twiddle_rsc_0_3_i : DIT_RELOOP_ccs_sample_mem_ccs_ram_sync_1R1W_rport_16_64_8_256_256_64_5_gen
    PORT MAP(
      q => twiddle_rsc_0_3_i_q,
      re => twiddle_rsc_0_3_re,
      radr => twiddle_rsc_0_3_i_radr,
      radr_d => twiddle_rsc_0_3_i_radr_d,
      re_d => twiddle_rsc_0_3_i_re_d_iff,
      q_d => twiddle_rsc_0_3_i_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_3_i_re_d_iff
    );
  twiddle_rsc_0_3_i_q <= twiddle_rsc_0_3_q;
  twiddle_rsc_0_3_radr <= twiddle_rsc_0_3_i_radr;
  twiddle_rsc_0_3_i_radr_d <= twiddle_rsc_0_0_i_radr_d_iff;
  twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d_1;

  DIT_RELOOP_core_inst : DIT_RELOOP_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_0_0_lz => vec_rsc_triosy_0_0_lz,
      vec_rsc_triosy_0_1_lz => vec_rsc_triosy_0_1_lz,
      vec_rsc_triosy_0_2_lz => vec_rsc_triosy_0_2_lz,
      vec_rsc_triosy_0_3_lz => vec_rsc_triosy_0_3_lz,
      p_rsc_dat => DIT_RELOOP_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz => twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz => twiddle_rsc_triosy_0_3_lz,
      vec_rsc_0_0_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d,
      vec_rsc_0_0_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d,
      vec_rsc_0_1_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d,
      vec_rsc_0_1_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d,
      vec_rsc_0_2_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_2_i_radr_d,
      vec_rsc_0_2_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_2_i_q_d,
      vec_rsc_0_3_i_radr_d => DIT_RELOOP_core_inst_vec_rsc_0_3_i_radr_d,
      vec_rsc_0_3_i_q_d => DIT_RELOOP_core_inst_vec_rsc_0_3_i_q_d,
      twiddle_rsc_0_0_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_1_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_2_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_2_i_q_d,
      twiddle_rsc_0_3_i_q_d => DIT_RELOOP_core_inst_twiddle_rsc_0_3_i_q_d,
      vec_rsc_0_0_i_wadr_d_pff => DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d_pff,
      vec_rsc_0_0_i_d_d_pff => DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d_pff,
      vec_rsc_0_0_i_we_d_pff => vec_rsc_0_0_i_we_d_iff,
      vec_rsc_0_0_i_re_d_pff => vec_rsc_0_0_i_re_d_iff,
      vec_rsc_0_1_i_wadr_d_pff => DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d_pff,
      vec_rsc_0_1_i_d_d_pff => DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d_pff,
      vec_rsc_0_1_i_we_d_pff => vec_rsc_0_1_i_we_d_iff,
      vec_rsc_0_1_i_re_d_pff => vec_rsc_0_1_i_re_d_iff,
      vec_rsc_0_2_i_we_d_pff => vec_rsc_0_2_i_we_d_iff,
      vec_rsc_0_2_i_re_d_pff => vec_rsc_0_2_i_re_d_iff,
      vec_rsc_0_3_i_we_d_pff => vec_rsc_0_3_i_we_d_iff,
      vec_rsc_0_3_i_re_d_pff => vec_rsc_0_3_i_re_d_iff,
      twiddle_rsc_0_0_i_radr_d_pff => DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff,
      twiddle_rsc_0_0_i_re_d_pff => twiddle_rsc_0_0_i_re_d_iff,
      twiddle_rsc_0_1_i_re_d_pff => twiddle_rsc_0_1_i_re_d_iff,
      twiddle_rsc_0_2_i_re_d_pff => twiddle_rsc_0_2_i_re_d_iff,
      twiddle_rsc_0_3_i_re_d_pff => twiddle_rsc_0_3_i_re_d_iff
    );
  DIT_RELOOP_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsc_0_0_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_radr_d;
  DIT_RELOOP_core_inst_vec_rsc_0_0_i_q_d <= vec_rsc_0_0_i_q_d;
  vec_rsc_0_1_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_radr_d;
  DIT_RELOOP_core_inst_vec_rsc_0_1_i_q_d <= vec_rsc_0_1_i_q_d;
  vec_rsc_0_2_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_2_i_radr_d;
  DIT_RELOOP_core_inst_vec_rsc_0_2_i_q_d <= vec_rsc_0_2_i_q_d;
  vec_rsc_0_3_i_radr_d <= DIT_RELOOP_core_inst_vec_rsc_0_3_i_radr_d;
  DIT_RELOOP_core_inst_vec_rsc_0_3_i_q_d <= vec_rsc_0_3_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d;
  DIT_RELOOP_core_inst_twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d;
  vec_rsc_0_0_i_wadr_d_iff <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_wadr_d_pff;
  vec_rsc_0_0_i_d_d_iff <= DIT_RELOOP_core_inst_vec_rsc_0_0_i_d_d_pff;
  vec_rsc_0_1_i_wadr_d_iff <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_wadr_d_pff;
  vec_rsc_0_1_i_d_d_iff <= DIT_RELOOP_core_inst_vec_rsc_0_1_i_d_d_pff;
  twiddle_rsc_0_0_i_radr_d_iff <= DIT_RELOOP_core_inst_twiddle_rsc_0_0_i_radr_d_pff;

END v3;



