
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
--  Generated by:   jd4691@newnano.poly.edu
--  Generated date: Wed Jul 28 06:08:16 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    IS
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
END stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen;

ARCHITECTURE v12 OF stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    adrb_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    qb_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    readB_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen;

ARCHITECTURE v12 OF stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qb_d <= qb;
  adrb <= (adrb_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
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
END stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen;

ARCHITECTURE v12 OF stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d);
  da <= (da_d);
  adra <= (adra_d);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_core_core_fsm
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


ENTITY stockham_DIT_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    INNER_LOOP_C_61_tr0 : IN STD_LOGIC;
    OUTER_LOOP_C_0_tr0 : IN STD_LOGIC
  );
END stockham_DIT_core_core_fsm;

ARCHITECTURE v12 OF stockham_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for stockham_DIT_core_core_fsm_1
  TYPE stockham_DIT_core_core_fsm_1_ST IS (main_C_0, INNER_LOOP_C_0, INNER_LOOP_C_1,
      INNER_LOOP_C_2, INNER_LOOP_C_3, INNER_LOOP_C_4, INNER_LOOP_C_5, INNER_LOOP_C_6,
      INNER_LOOP_C_7, INNER_LOOP_C_8, INNER_LOOP_C_9, INNER_LOOP_C_10, INNER_LOOP_C_11,
      INNER_LOOP_C_12, INNER_LOOP_C_13, INNER_LOOP_C_14, INNER_LOOP_C_15, INNER_LOOP_C_16,
      INNER_LOOP_C_17, INNER_LOOP_C_18, INNER_LOOP_C_19, INNER_LOOP_C_20, INNER_LOOP_C_21,
      INNER_LOOP_C_22, INNER_LOOP_C_23, INNER_LOOP_C_24, INNER_LOOP_C_25, INNER_LOOP_C_26,
      INNER_LOOP_C_27, INNER_LOOP_C_28, INNER_LOOP_C_29, INNER_LOOP_C_30, INNER_LOOP_C_31,
      INNER_LOOP_C_32, INNER_LOOP_C_33, INNER_LOOP_C_34, INNER_LOOP_C_35, INNER_LOOP_C_36,
      INNER_LOOP_C_37, INNER_LOOP_C_38, INNER_LOOP_C_39, INNER_LOOP_C_40, INNER_LOOP_C_41,
      INNER_LOOP_C_42, INNER_LOOP_C_43, INNER_LOOP_C_44, INNER_LOOP_C_45, INNER_LOOP_C_46,
      INNER_LOOP_C_47, INNER_LOOP_C_48, INNER_LOOP_C_49, INNER_LOOP_C_50, INNER_LOOP_C_51,
      INNER_LOOP_C_52, INNER_LOOP_C_53, INNER_LOOP_C_54, INNER_LOOP_C_55, INNER_LOOP_C_56,
      INNER_LOOP_C_57, INNER_LOOP_C_58, INNER_LOOP_C_59, INNER_LOOP_C_60, INNER_LOOP_C_61,
      OUTER_LOOP_C_0, main_C_1);

  SIGNAL state_var : stockham_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : stockham_DIT_core_core_fsm_1_ST;

BEGIN
  stockham_DIT_core_core_fsm_1 : PROCESS (INNER_LOOP_C_61_tr0, OUTER_LOOP_C_0_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN INNER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= INNER_LOOP_C_1;
      WHEN INNER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        state_var_NS <= INNER_LOOP_C_2;
      WHEN INNER_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000011");
        state_var_NS <= INNER_LOOP_C_3;
      WHEN INNER_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        state_var_NS <= INNER_LOOP_C_4;
      WHEN INNER_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000101");
        state_var_NS <= INNER_LOOP_C_5;
      WHEN INNER_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000110");
        state_var_NS <= INNER_LOOP_C_6;
      WHEN INNER_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000111");
        state_var_NS <= INNER_LOOP_C_7;
      WHEN INNER_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        state_var_NS <= INNER_LOOP_C_8;
      WHEN INNER_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001001");
        state_var_NS <= INNER_LOOP_C_9;
      WHEN INNER_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001010");
        state_var_NS <= INNER_LOOP_C_10;
      WHEN INNER_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001011");
        state_var_NS <= INNER_LOOP_C_11;
      WHEN INNER_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001100");
        state_var_NS <= INNER_LOOP_C_12;
      WHEN INNER_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001101");
        state_var_NS <= INNER_LOOP_C_13;
      WHEN INNER_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001110");
        state_var_NS <= INNER_LOOP_C_14;
      WHEN INNER_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001111");
        state_var_NS <= INNER_LOOP_C_15;
      WHEN INNER_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= INNER_LOOP_C_16;
      WHEN INNER_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010001");
        state_var_NS <= INNER_LOOP_C_17;
      WHEN INNER_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010010");
        state_var_NS <= INNER_LOOP_C_18;
      WHEN INNER_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010011");
        state_var_NS <= INNER_LOOP_C_19;
      WHEN INNER_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010100");
        state_var_NS <= INNER_LOOP_C_20;
      WHEN INNER_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010101");
        state_var_NS <= INNER_LOOP_C_21;
      WHEN INNER_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010110");
        state_var_NS <= INNER_LOOP_C_22;
      WHEN INNER_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010111");
        state_var_NS <= INNER_LOOP_C_23;
      WHEN INNER_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011000");
        state_var_NS <= INNER_LOOP_C_24;
      WHEN INNER_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011001");
        state_var_NS <= INNER_LOOP_C_25;
      WHEN INNER_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011010");
        state_var_NS <= INNER_LOOP_C_26;
      WHEN INNER_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011011");
        state_var_NS <= INNER_LOOP_C_27;
      WHEN INNER_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011100");
        state_var_NS <= INNER_LOOP_C_28;
      WHEN INNER_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011101");
        state_var_NS <= INNER_LOOP_C_29;
      WHEN INNER_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011110");
        state_var_NS <= INNER_LOOP_C_30;
      WHEN INNER_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0011111");
        state_var_NS <= INNER_LOOP_C_31;
      WHEN INNER_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        state_var_NS <= INNER_LOOP_C_32;
      WHEN INNER_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100001");
        state_var_NS <= INNER_LOOP_C_33;
      WHEN INNER_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100010");
        state_var_NS <= INNER_LOOP_C_34;
      WHEN INNER_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100011");
        state_var_NS <= INNER_LOOP_C_35;
      WHEN INNER_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100100");
        state_var_NS <= INNER_LOOP_C_36;
      WHEN INNER_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100101");
        state_var_NS <= INNER_LOOP_C_37;
      WHEN INNER_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100110");
        state_var_NS <= INNER_LOOP_C_38;
      WHEN INNER_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100111");
        state_var_NS <= INNER_LOOP_C_39;
      WHEN INNER_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101000");
        state_var_NS <= INNER_LOOP_C_40;
      WHEN INNER_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101001");
        state_var_NS <= INNER_LOOP_C_41;
      WHEN INNER_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101010");
        state_var_NS <= INNER_LOOP_C_42;
      WHEN INNER_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101011");
        state_var_NS <= INNER_LOOP_C_43;
      WHEN INNER_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101100");
        state_var_NS <= INNER_LOOP_C_44;
      WHEN INNER_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101101");
        state_var_NS <= INNER_LOOP_C_45;
      WHEN INNER_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101110");
        state_var_NS <= INNER_LOOP_C_46;
      WHEN INNER_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0101111");
        state_var_NS <= INNER_LOOP_C_47;
      WHEN INNER_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110000");
        state_var_NS <= INNER_LOOP_C_48;
      WHEN INNER_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110001");
        state_var_NS <= INNER_LOOP_C_49;
      WHEN INNER_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110010");
        state_var_NS <= INNER_LOOP_C_50;
      WHEN INNER_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110011");
        state_var_NS <= INNER_LOOP_C_51;
      WHEN INNER_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110100");
        state_var_NS <= INNER_LOOP_C_52;
      WHEN INNER_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110101");
        state_var_NS <= INNER_LOOP_C_53;
      WHEN INNER_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110110");
        state_var_NS <= INNER_LOOP_C_54;
      WHEN INNER_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0110111");
        state_var_NS <= INNER_LOOP_C_55;
      WHEN INNER_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111000");
        state_var_NS <= INNER_LOOP_C_56;
      WHEN INNER_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111001");
        state_var_NS <= INNER_LOOP_C_57;
      WHEN INNER_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111010");
        state_var_NS <= INNER_LOOP_C_58;
      WHEN INNER_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111011");
        state_var_NS <= INNER_LOOP_C_59;
      WHEN INNER_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111100");
        state_var_NS <= INNER_LOOP_C_60;
      WHEN INNER_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111101");
        state_var_NS <= INNER_LOOP_C_61;
      WHEN INNER_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111110");
        IF ( INNER_LOOP_C_61_tr0 = '1' ) THEN
          state_var_NS <= OUTER_LOOP_C_0;
        ELSE
          state_var_NS <= INNER_LOOP_C_0;
        END IF;
      WHEN OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0111111");
        IF ( OUTER_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= INNER_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000");
        state_var_NS <= INNER_LOOP_C_0;
    END CASE;
  END PROCESS stockham_DIT_core_core_fsm_1;

  stockham_DIT_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS stockham_DIT_core_core_fsm_1_REG;

END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    yt_rsc_cgo_iro : IN STD_LOGIC;
    yt_rsci_clken_d : OUT STD_LOGIC;
    INNER_LOOP_b_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_cgo : IN STD_LOGIC;
    INNER_LOOP_b_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
  );
END stockham_DIT_core_wait_dp;

ARCHITECTURE v12 OF stockham_DIT_core_wait_dp IS
  -- Default Constants

BEGIN
  yt_rsci_clken_d <= yt_rsc_cgo OR yt_rsc_cgo_iro;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      INNER_LOOP_b_rem_cmp_z_oreg <= INNER_LOOP_b_rem_cmp_z;
    END IF;
  END PROCESS;
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    xt_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsci_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_adrb_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_qb_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    yt_rsci_clken_d : OUT STD_LOGIC;
    yt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    yt_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    INNER_LOOP_b_rem_cmp_a : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    INNER_LOOP_b_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    INNER_LOOP_b_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_wea_d_pff : OUT STD_LOGIC;
    yt_rsci_we_d_pff : OUT STD_LOGIC
  );
END stockham_DIT_core;

ARCHITECTURE v12 OF stockham_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_7 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_16 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_24 : STD_LOGIC;
  SIGNAL or_tmp_3 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL or_tmp_6 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL or_dcpl_9 : STD_LOGIC;
  SIGNAL or_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_5 : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_7 : STD_LOGIC;
  SIGNAL y_1_sva : STD_LOGIC;
  SIGNAL y_3_sva : STD_LOGIC;
  SIGNAL INNER_LOOP_t_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_3_sva : STD_LOGIC;
  SIGNAL x_1_sva : STD_LOGIC;
  SIGNAL INNER_LOOP_a_acc_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL OUTER_LOOP_nn_or_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_modulo_dev_result_rem_cmp_b_63_0_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_18_cse : STD_LOGIC;
  SIGNAL INNER_LOOP_b_nor_itm : STD_LOGIC;
  SIGNAL nor_11_rmff : STD_LOGIC;
  SIGNAL INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm : STD_LOGIC;
  SIGNAL pref_x_idx_pref_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL INNER_LOOP_acc_tdx_1_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL INNER_LOOP_a_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_upper_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL shift_4_0_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_acc_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL modulo_dev_qelse_mux_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (22 DOWNTO 0);
  SIGNAL and_dcpl_93 : STD_LOGIC;
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL s_10_0_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL OUTER_LOOP_nn_15_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_16_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_14_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_17_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_13_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_18_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_12_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_19_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_11_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_20_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_10_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_21_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_9_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_22_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_8_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_23_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_7_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_24_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_6_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_25_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_5_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_26_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_4_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_27_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_3_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_28_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_2_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_29_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_1_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_30_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_0_sva : STD_LOGIC;
  SIGNAL drf_y_smx_lpi_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_acc_5_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_acc_2_psp_mx0w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_q_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL pref_x_idx_pref_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL INNER_LOOP_upper_acc_psp_10_8_0_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_lpi_3_dfm_mx0c1 : STD_LOGIC;
  SIGNAL INNER_LOOP_a_lpi_3_dfm_mx0c2 : STD_LOGIC;
  SIGNAL INNER_LOOP_a_lpi_3_dfm_mx0c4 : STD_LOGIC;
  SIGNAL mux_18_itm : STD_LOGIC;

  SIGNAL INNER_LOOP_b_and_1_nl : STD_LOGIC;
  SIGNAL OUTER_LOOP_acc_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL or_13_nl : STD_LOGIC;
  SIGNAL nor_10_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL or_17_nl : STD_LOGIC;
  SIGNAL and_49_nl : STD_LOGIC;
  SIGNAL and_50_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_a_mux_2_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_52_nl : STD_LOGIC;
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL or_38_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL nor_9_nl : STD_LOGIC;
  SIGNAL and_66_nl : STD_LOGIC;
  SIGNAL and_22_nl : STD_LOGIC;
  SIGNAL mux_4_nl : STD_LOGIC;
  SIGNAL or_12_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_mux_6_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_mux_7_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_20_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_21_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_22_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_23_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_24_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_25_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_26_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_27_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_28_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_29_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_30_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_31_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_12_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_13_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_14_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_15_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_16_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_17_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_18_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_19_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_mux_20_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_32_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_or_1_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL INNER_LOOP_mux_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_INNER_LOOP_nand_1_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_mux_9_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL modulo_dev_result_rem_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL INNER_LOOP_w_rshift_rg_a : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_rg_s : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL INNER_LOOP_w_lshift_rg_a : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_w_lshift_rg_s : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL INNER_LOOP_w_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      yt_rsc_cgo_iro : IN STD_LOGIC;
      yt_rsci_clken_d : OUT STD_LOGIC;
      INNER_LOOP_b_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_cgo : IN STD_LOGIC;
      INNER_LOOP_b_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z : STD_LOGIC_VECTOR
      (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z_oreg : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

  COMPONENT stockham_DIT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      INNER_LOOP_C_61_tr0 : IN STD_LOGIC;
      OUTER_LOOP_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_61_tr0 : STD_LOGIC;
  SIGNAL stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_10_4_2(input_3 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);

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

  xt_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_obj_ld_cse,
      lz => xt_rsc_triosy_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  g_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_obj_ld_cse,
      lz => g_rsc_triosy_lz
    );
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_obj_ld_cse,
      lz => twiddle_rsc_triosy_lz
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
  modulo_dev_result_rem_cmp_b <= STD_LOGIC_VECTOR(UNSIGNED'( "0") & UNSIGNED(reg_modulo_dev_result_rem_cmp_b_63_0_cse));
  modulo_dev_result_rem_cmp_z <= modulo_dev_result_rem_cmp_z_1;

  INNER_LOOP_w_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 9,
      signd_a => 0,
      width_s => 5,
      width_z => 9
      )
    PORT MAP(
      a => INNER_LOOP_w_rshift_rg_a,
      s => INNER_LOOP_w_rshift_rg_s,
      z => INNER_LOOP_w_rshift_rg_z
    );
  INNER_LOOP_w_rshift_rg_a <= INNER_LOOP_upper_and_psp_sva_1;
  INNER_LOOP_w_rshift_rg_s <= shift_4_0_sva;
  INNER_LOOP_w_rshift_itm <= INNER_LOOP_w_rshift_rg_z;

  INNER_LOOP_w_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 9,
      signd_a => 0,
      width_s => 5,
      width_z => 10
      )
    PORT MAP(
      a => INNER_LOOP_w_lshift_rg_a,
      s => INNER_LOOP_w_lshift_rg_s,
      z => INNER_LOOP_w_lshift_rg_z
    );
  INNER_LOOP_w_lshift_rg_a <= INNER_LOOP_w_rshift_itm;
  INNER_LOOP_w_lshift_rg_s <= shift_4_0_sva;
  twiddle_rsci_adrb_d <= INNER_LOOP_w_lshift_rg_z;

  stockham_DIT_core_wait_dp_inst : stockham_DIT_core_wait_dp
    PORT MAP(
      clk => clk,
      yt_rsc_cgo_iro => nor_11_rmff,
      yt_rsci_clken_d => yt_rsci_clken_d,
      INNER_LOOP_b_rem_cmp_z => stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z,
      yt_rsc_cgo => reg_yt_rsc_cgo_cse,
      INNER_LOOP_b_rem_cmp_z_oreg => stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z_oreg
    );
  stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z <= INNER_LOOP_b_rem_cmp_z;
  INNER_LOOP_b_rem_cmp_z_oreg <= stockham_DIT_core_wait_dp_inst_INNER_LOOP_b_rem_cmp_z_oreg;

  stockham_DIT_core_core_fsm_inst : stockham_DIT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => stockham_DIT_core_core_fsm_inst_fsm_output,
      INNER_LOOP_C_61_tr0 => stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_61_tr0,
      OUTER_LOOP_C_0_tr0 => stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0
    );
  fsm_output <= stockham_DIT_core_core_fsm_inst_fsm_output;
  stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_61_tr0 <= INNER_LOOP_t_9_0_sva_1(9);
  stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_0_tr0 <= NOT (z_out_1(22));

  OUTER_LOOP_nn_or_cse <= and_dcpl_9 OR and_dcpl_15;
  or_37_nl <= (fsm_output(3)) OR (fsm_output(5)) OR (NOT y_3_sva) OR y_1_sva OR (fsm_output(4));
  nand_5_nl <= NOT((fsm_output(3)) AND (fsm_output(5)));
  mux_5_nl <= MUX_s_1_2_2(or_37_nl, nand_5_nl, fsm_output(2));
  mux_18_itm <= MUX_s_1_2_2(or_tmp_6, mux_5_nl, x_3_sva);
  mux_8_nl <= MUX_s_1_2_2(mux_18_itm, or_tmp_6, x_1_sva);
  nand_nl <= NOT((fsm_output(1)) AND (NOT mux_8_nl));
  or_13_nl <= (fsm_output(1)) OR x_1_sva;
  mux_7_nl <= MUX_s_1_2_2(mux_18_itm, or_tmp_6, or_13_nl);
  mux_9_nl <= MUX_s_1_2_2(nand_nl, mux_7_nl, fsm_output(0));
  nor_11_rmff <= NOT(mux_9_nl OR (fsm_output(6)));
  or_18_cse <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  INNER_LOOP_b_rem_cmp_b <= reg_modulo_dev_result_rem_cmp_b_63_0_cse;
  INNER_LOOP_b_INNER_LOOP_b_acc_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_1(9
      DOWNTO 0)) + UNSIGNED(s_10_0_sva(9 DOWNTO 0)), 10));
  modulo_dev_qelse_mux_itm <= MUX_v_64_2_2((modulo_dev_result_rem_cmp_z(63 DOWNTO
      0)), z_out_2, modulo_dev_result_rem_cmp_z(63));
  INNER_LOOP_acc_2_psp_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(INNER_LOOP_a_lpi_3_dfm)
      + SIGNED(INNER_LOOP_b_rem_cmp_z_oreg), 64));
  INNER_LOOP_q_and_psp_sva_1 <= INNER_LOOP_upper_acc_psp_10_8_0_sva_1 AND INNER_LOOP_a_acc_psp_sva;
  pref_x_idx_pref_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_q_and_psp_sva_1),
      9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_upper_and_psp_sva_1),
      9), 10), 10));
  INNER_LOOP_upper_and_psp_sva_1 <= (NOT INNER_LOOP_upper_acc_psp_10_8_0_sva_1) AND
      INNER_LOOP_a_acc_psp_sva;
  INNER_LOOP_upper_acc_psp_10_8_0_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(s_10_0_sva(8
      DOWNTO 0)) + SIGNED'( "111111111"), 9));
  INNER_LOOP_b_INNER_LOOP_b_and_5 <= y_1_sva AND (NOT y_3_sva);
  INNER_LOOP_b_INNER_LOOP_b_and_7 <= y_3_sva AND (NOT y_1_sva);
  or_dcpl_4 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_5 <= or_dcpl_4 OR (fsm_output(5));
  and_dcpl_6 <= NOT(CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_7 <= NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_8 <= and_dcpl_7 AND and_dcpl_6;
  and_dcpl_9 <= NOT((NOT and_dcpl_8) OR (fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(4)));
  and_dcpl_10 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_12 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_13 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_14 <= and_dcpl_13 AND and_dcpl_12;
  and_dcpl_15 <= and_dcpl_14 AND and_dcpl_10 AND (fsm_output(4));
  and_dcpl_16 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_17 <= and_dcpl_16 AND (NOT (fsm_output(4)));
  and_dcpl_18 <= and_dcpl_8 AND and_dcpl_17;
  and_dcpl_19 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_20 <= and_dcpl_19 AND (NOT (fsm_output(4)));
  and_dcpl_21 <= and_dcpl_8 AND and_dcpl_20;
  and_dcpl_23 <= and_dcpl_19 AND (fsm_output(4));
  and_dcpl_24 <= and_dcpl_14 AND and_dcpl_23;
  or_tmp_3 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  and_dcpl_30 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_32 <= and_dcpl_7 AND (NOT (fsm_output(6)));
  and_dcpl_33 <= and_dcpl_32 AND ((fsm_output(0)) XOR (fsm_output(1)));
  or_tmp_6 <= (fsm_output(2)) OR (fsm_output(3)) OR (fsm_output(5)) OR (NOT y_3_sva)
      OR y_1_sva OR (fsm_output(4));
  and_dcpl_46 <= and_dcpl_13 AND and_dcpl_6 AND and_dcpl_23;
  or_dcpl_9 <= CONV_SL_1_1(fsm_output(6 DOWNTO 5)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_10 <= or_dcpl_4 OR or_dcpl_9;
  and_dcpl_56 <= (fsm_output(1)) AND (NOT (fsm_output(4)));
  and_dcpl_59 <= and_dcpl_32 AND (NOT (fsm_output(5))) AND (fsm_output(0));
  INNER_LOOP_a_lpi_3_dfm_mx0c1 <= and_dcpl_59 AND and_dcpl_56 AND INNER_LOOP_b_INNER_LOOP_b_and_7;
  INNER_LOOP_a_lpi_3_dfm_mx0c2 <= and_dcpl_59 AND and_dcpl_56 AND (y_1_sva OR (NOT
      y_3_sva));
  INNER_LOOP_a_lpi_3_dfm_mx0c4 <= and_dcpl_14 AND and_dcpl_20;
  and_22_nl <= and_dcpl_14 AND and_dcpl_17;
  xt_rsci_adra_d <= MUX1HOT_v_10_4_2(INNER_LOOP_b_INNER_LOOP_b_acc_itm, (INNER_LOOP_a_acc_psp_sva
      & INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm), pref_x_idx_pref_9_0_sva,
      INNER_LOOP_acc_tdx_1_9_0_sva, STD_LOGIC_VECTOR'( and_dcpl_21 & and_dcpl_18
      & and_22_nl & and_dcpl_24));
  xt_rsci_da_d <= MUX_v_64_2_2(INNER_LOOP_a_lpi_3_dfm, modulo_dev_qelse_mux_itm,
      and_dcpl_24);
  or_12_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  mux_4_nl <= MUX_s_1_2_2(or_12_nl, or_tmp_3, fsm_output(4));
  xt_rsci_wea_d_pff <= (NOT mux_4_nl) AND and_dcpl_13 AND and_dcpl_12 AND (NOT x_3_sva)
      AND x_1_sva;
  xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= and_dcpl_33 AND and_dcpl_30 AND y_1_sva
      AND (NOT y_3_sva);
  twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d <= and_dcpl_21;
  yt_rsci_d_d <= modulo_dev_qelse_mux_itm;
  yt_rsci_radr_d <= MUX_v_10_2_2(INNER_LOOP_b_INNER_LOOP_b_acc_itm, (INNER_LOOP_a_acc_psp_sva
      & INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm), and_dcpl_18);
  yt_rsci_wadr_d <= MUX_v_10_2_2(pref_x_idx_pref_9_0_sva, INNER_LOOP_acc_tdx_1_9_0_sva,
      and_dcpl_24);
  yt_rsci_we_d_pff <= and_dcpl_14 AND and_dcpl_19 AND x_3_sva AND (NOT x_1_sva);
  yt_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_33 AND and_dcpl_30 AND INNER_LOOP_b_INNER_LOOP_b_and_7;
  and_dcpl_71 <= and_dcpl_7 AND and_dcpl_30 AND (fsm_output(1)) AND (NOT (fsm_output(6)))
      AND (fsm_output(0));
  and_dcpl_83 <= CONV_SL_1_1(fsm_output=STD_LOGIC_VECTOR'("0111111"));
  and_dcpl_93 <= and_dcpl_13 AND (NOT (fsm_output(6))) AND (fsm_output(5)) AND (NOT
      (fsm_output(1))) AND (fsm_output(0));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(or_dcpl_5 OR or_18_cse OR (fsm_output(4)))) OR (fsm_output(6)))
          = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( OUTER_LOOP_nn_or_cse = '1' ) THEN
        OUTER_LOOP_nn_30_sva <= OUTER_LOOP_nn_29_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_29_sva <= OUTER_LOOP_nn_28_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_28_sva <= OUTER_LOOP_nn_27_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_27_sva <= OUTER_LOOP_nn_26_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_26_sva <= OUTER_LOOP_nn_25_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_25_sva <= OUTER_LOOP_nn_24_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_24_sva <= OUTER_LOOP_nn_23_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_23_sva <= OUTER_LOOP_nn_22_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_22_sva <= OUTER_LOOP_nn_21_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_21_sva <= OUTER_LOOP_nn_20_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_20_sva <= OUTER_LOOP_nn_19_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_19_sva <= OUTER_LOOP_nn_18_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_18_sva <= OUTER_LOOP_nn_17_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_17_sva <= OUTER_LOOP_nn_16_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_16_sva <= OUTER_LOOP_nn_15_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_15_sva <= OUTER_LOOP_nn_14_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_14_sva <= OUTER_LOOP_nn_13_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_13_sva <= OUTER_LOOP_nn_12_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_12_sva <= OUTER_LOOP_nn_11_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_11_sva <= OUTER_LOOP_nn_10_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_10_sva <= OUTER_LOOP_nn_9_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_9_sva <= OUTER_LOOP_nn_8_sva AND (NOT and_dcpl_9);
        s_10_0_sva <= MUX_v_11_2_2(STD_LOGIC_VECTOR'( "01000000000"), STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(s_10_0_sva(10
            DOWNTO 1)),11)), and_dcpl_15);
        OUTER_LOOP_nn_8_sva <= OUTER_LOOP_nn_7_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_7_sva <= OUTER_LOOP_nn_6_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_6_sva <= OUTER_LOOP_nn_5_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_5_sva <= OUTER_LOOP_nn_4_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_4_sva <= OUTER_LOOP_nn_3_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_3_sva <= OUTER_LOOP_nn_2_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_2_sva <= OUTER_LOOP_nn_1_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_1_sva <= OUTER_LOOP_nn_0_sva AND (NOT and_dcpl_9);
        OUTER_LOOP_nn_0_sva <= and_dcpl_9;
        shift_4_0_sva <= MUX_v_5_2_2(STD_LOGIC_VECTOR'( "01001"), STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(OUTER_LOOP_acc_1_nl),
            5)), and_dcpl_15);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        x_3_sva <= '0';
        x_1_sva <= '0';
        y_3_sva <= '0';
        y_1_sva <= '0';
      ELSIF ( OUTER_LOOP_nn_or_cse = '1' ) THEN
        x_3_sva <= y_3_sva OR and_dcpl_9;
        x_1_sva <= y_1_sva AND (NOT and_dcpl_9);
        y_3_sva <= x_3_sva AND (NOT and_dcpl_9);
        y_1_sva <= x_1_sva OR and_dcpl_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (((NOT INNER_LOOP_b_nor_itm) OR INNER_LOOP_b_INNER_LOOP_b_and_5 OR INNER_LOOP_b_INNER_LOOP_b_and_7)
          AND and_dcpl_18) = '1' ) THEN
        drf_y_smx_lpi_3 <= MUX_v_64_2_2(xt_rsci_qa_d, yt_rsci_q_d, INNER_LOOP_b_and_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_yt_rsc_cgo_cse <= '0';
        reg_xt_rsc_triosy_obj_ld_cse <= '0';
        INNER_LOOP_b_nor_itm <= '0';
      ELSE
        reg_yt_rsc_cgo_cse <= nor_11_rmff;
        reg_xt_rsc_triosy_obj_ld_cse <= and_dcpl_14 AND and_dcpl_10 AND (fsm_output(4))
            AND (NOT (z_out_1(22)));
        INNER_LOOP_b_nor_itm <= NOT(INNER_LOOP_b_INNER_LOOP_b_and_5 OR INNER_LOOP_b_INNER_LOOP_b_and_7);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_dev_result_rem_cmp_a_63_0 <= MUX1HOT_v_64_3_2(INNER_LOOP_acc_2_psp_mx0w0,
          INNER_LOOP_a_lpi_3_dfm, INNER_LOOP_acc_5_itm, STD_LOGIC_VECTOR'( and_dcpl_46
          & nor_10_nl & and_49_nl));
      reg_modulo_dev_result_rem_cmp_b_63_0_cse <= p_sva;
      INNER_LOOP_b_rem_cmp_a <= MUX_v_128_2_2(z_out, INNER_LOOP_b_mul_mut, and_50_nl);
      INNER_LOOP_a_acc_psp_sva <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), INNER_LOOP_a_mux_2_nl,
          or_nl);
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (y_1_sva XOR y_3_sva) = '1' ) THEN
        INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm <= INNER_LOOP_q_and_psp_sva_1(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(mux_14_nl AND (NOT (fsm_output(6))))) = '1' ) THEN
        pref_x_idx_pref_9_0_sva <= pref_x_idx_pref_9_0_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_15_nl OR (fsm_output(6))) = '1' ) THEN
        INNER_LOOP_acc_tdx_1_9_0_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pref_x_idx_pref_9_0_sva_1)
            + UNSIGNED(z_out(9 DOWNTO 0)), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP_t_9_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (NOT(or_dcpl_10 OR or_tmp_3 OR (fsm_output(4)))) = '1' ) THEN
        INNER_LOOP_t_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_a_acc_psp_sva),
            9), 10) + SIGNED'( "0000000001"), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (and_dcpl_18 OR INNER_LOOP_a_lpi_3_dfm_mx0c1 OR INNER_LOOP_a_lpi_3_dfm_mx0c2
          OR and_dcpl_46 OR INNER_LOOP_a_lpi_3_dfm_mx0c4) = '1' ) THEN
        INNER_LOOP_a_lpi_3_dfm <= MUX1HOT_v_64_5_2(twiddle_rsci_qb_d, yt_rsci_q_d,
            xt_rsci_qa_d, INNER_LOOP_acc_2_psp_mx0w0, modulo_dev_qelse_mux_itm, STD_LOGIC_VECTOR'(
            and_dcpl_18 & INNER_LOOP_a_lpi_3_dfm_mx0c1 & INNER_LOOP_a_lpi_3_dfm_mx0c2
            & and_dcpl_46 & INNER_LOOP_a_lpi_3_dfm_mx0c4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_10 OR (NOT (fsm_output(0))) OR (NOT (fsm_output(1))) OR (fsm_output(4))))
          = '1' ) THEN
        INNER_LOOP_b_mul_mut <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT and_dcpl_13) OR or_dcpl_9 OR or_tmp_3 OR (NOT (fsm_output(4)))))
          = '1' ) THEN
        INNER_LOOP_acc_5_itm <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  OUTER_LOOP_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(shift_4_0_sva) + SIGNED'(
      "11111"), 5));
  INNER_LOOP_b_and_1_nl <= INNER_LOOP_b_INNER_LOOP_b_and_7 AND and_dcpl_18;
  nand_1_nl <= NOT((fsm_output(5)) AND (NOT and_dcpl_13));
  mux_10_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), nand_1_nl, or_18_cse);
  or_17_nl <= (NOT (fsm_output(1))) OR (fsm_output(5)) OR (NOT and_dcpl_13);
  mux_11_nl <= MUX_s_1_2_2(mux_10_nl, or_17_nl, fsm_output(4));
  nor_10_nl <= NOT(mux_11_nl OR (fsm_output(6)));
  and_49_nl <= ((and_dcpl_13 AND or_18_cse) XOR (fsm_output(4))) AND and_dcpl_12;
  mux_12_nl <= MUX_s_1_2_2(and_dcpl_7, and_dcpl_13, fsm_output(4));
  and_50_nl <= (NOT mux_12_nl) AND and_dcpl_6;
  INNER_LOOP_a_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_q_and_psp_sva_1(8
      DOWNTO 1)), 8), 9) + UNSIGNED(INNER_LOOP_upper_and_psp_sva_1), 9));
  and_52_nl <= and_dcpl_14 AND and_dcpl_16 AND (fsm_output(4));
  INNER_LOOP_a_mux_2_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_a_acc_nl),
      9)), (INNER_LOOP_t_9_0_sva_1(8 DOWNTO 0)), and_52_nl);
  or_38_nl <= (fsm_output(1)) OR (fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(2))
      OR (fsm_output(3));
  nand_7_nl <= NOT((fsm_output(1)) AND (fsm_output(0)) AND (fsm_output(5)) AND (fsm_output(2))
      AND (fsm_output(3)));
  mux_nl <= MUX_s_1_2_2(or_38_nl, nand_7_nl, fsm_output(4));
  or_nl <= mux_nl OR (fsm_output(6));
  nand_4_nl <= NOT((fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(3)));
  mux_13_nl <= MUX_s_1_2_2(or_dcpl_5, nand_4_nl, fsm_output(1));
  mux_14_nl <= MUX_s_1_2_2(mux_13_nl, (NOT (fsm_output(5))), fsm_output(4));
  nor_9_nl <= NOT((fsm_output(1)) OR (fsm_output(5)) OR (fsm_output(2)) OR (fsm_output(3)));
  and_66_nl <= or_18_cse AND (fsm_output(5)) AND (fsm_output(2)) AND (fsm_output(3));
  mux_15_nl <= MUX_s_1_2_2(nor_9_nl, and_66_nl, fsm_output(4));
  INNER_LOOP_mux_6_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(s_10_0_sva(9
      DOWNTO 0)),64)), drf_y_smx_lpi_3, and_dcpl_71);
  INNER_LOOP_mux_7_nl <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( OUTER_LOOP_nn_9_sva
      & OUTER_LOOP_nn_8_sva & OUTER_LOOP_nn_7_sva & OUTER_LOOP_nn_6_sva & OUTER_LOOP_nn_5_sva
      & OUTER_LOOP_nn_4_sva & OUTER_LOOP_nn_3_sva & OUTER_LOOP_nn_2_sva & OUTER_LOOP_nn_1_sva
      & OUTER_LOOP_nn_0_sva),64)), INNER_LOOP_a_lpi_3_dfm, and_dcpl_71);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(INNER_LOOP_mux_6_nl)
      * UNSIGNED(INNER_LOOP_mux_7_nl)), 128));
  INNER_LOOP_b_INNER_LOOP_b_and_20_nl <= OUTER_LOOP_nn_30_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_21_nl <= OUTER_LOOP_nn_29_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_22_nl <= OUTER_LOOP_nn_28_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_23_nl <= OUTER_LOOP_nn_27_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_24_nl <= OUTER_LOOP_nn_26_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_25_nl <= OUTER_LOOP_nn_25_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_26_nl <= OUTER_LOOP_nn_24_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_27_nl <= OUTER_LOOP_nn_23_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_28_nl <= OUTER_LOOP_nn_22_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_29_nl <= OUTER_LOOP_nn_21_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_30_nl <= OUTER_LOOP_nn_20_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_and_31_nl <= OUTER_LOOP_nn_19_sva AND and_dcpl_83;
  INNER_LOOP_b_mux_12_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(8)), OUTER_LOOP_nn_18_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_13_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(7)), OUTER_LOOP_nn_17_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_14_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(6)), OUTER_LOOP_nn_16_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_15_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(5)), OUTER_LOOP_nn_15_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_16_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(4)), OUTER_LOOP_nn_14_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_17_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(3)), OUTER_LOOP_nn_13_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_18_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(2)), OUTER_LOOP_nn_12_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_19_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(1)), OUTER_LOOP_nn_11_sva,
      and_dcpl_83);
  INNER_LOOP_b_mux_20_nl <= MUX_s_1_2_2((INNER_LOOP_upper_and_psp_sva_1(0)), OUTER_LOOP_nn_10_sva,
      and_dcpl_83);
  INNER_LOOP_b_INNER_LOOP_b_and_32_nl <= OUTER_LOOP_nn_9_sva AND and_dcpl_83;
  INNER_LOOP_b_INNER_LOOP_b_or_1_nl <= MUX_v_9_2_2(INNER_LOOP_q_and_psp_sva_1, STD_LOGIC_VECTOR'("111111111"),
      and_dcpl_83);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(
      INNER_LOOP_b_INNER_LOOP_b_and_20_nl & INNER_LOOP_b_INNER_LOOP_b_and_21_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_22_nl & INNER_LOOP_b_INNER_LOOP_b_and_23_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_24_nl & INNER_LOOP_b_INNER_LOOP_b_and_25_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_26_nl & INNER_LOOP_b_INNER_LOOP_b_and_27_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_28_nl & INNER_LOOP_b_INNER_LOOP_b_and_29_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_30_nl & INNER_LOOP_b_INNER_LOOP_b_and_31_nl &
      INNER_LOOP_b_mux_12_nl & INNER_LOOP_b_mux_13_nl & INNER_LOOP_b_mux_14_nl &
      INNER_LOOP_b_mux_15_nl & INNER_LOOP_b_mux_16_nl & INNER_LOOP_b_mux_17_nl &
      INNER_LOOP_b_mux_18_nl & INNER_LOOP_b_mux_19_nl & INNER_LOOP_b_mux_20_nl &
      INNER_LOOP_b_INNER_LOOP_b_and_32_nl), 22), 23) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(and_dcpl_83
      & INNER_LOOP_b_INNER_LOOP_b_or_1_nl), 10), 23), 23));
  INNER_LOOP_mux_8_nl <= MUX_v_64_2_2(INNER_LOOP_a_lpi_3_dfm, (modulo_dev_result_rem_cmp_z(63
      DOWNTO 0)), and_dcpl_93);
  INNER_LOOP_INNER_LOOP_nand_1_nl <= NOT(and_dcpl_93 AND (NOT(and_dcpl_13 AND and_dcpl_6
      AND (fsm_output(4)) AND (NOT (fsm_output(1))) AND (fsm_output(0)))));
  INNER_LOOP_mux_9_nl <= MUX_v_64_2_2((NOT INNER_LOOP_b_rem_cmp_z_oreg), p_sva, and_dcpl_93);
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_mux_8_nl & INNER_LOOP_INNER_LOOP_nand_1_nl)
      + UNSIGNED(INNER_LOOP_mux_9_nl & '1'), 65));
  z_out_2 <= acc_1_nl(64 DOWNTO 1);
END v12;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_adra : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsc_da : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_wea : OUT STD_LOGIC;
    xt_rsc_qa : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    g_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC
  );
END stockham_DIT;

ARCHITECTURE v12 OF stockham_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL xt_rsci_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_adrb_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_qb_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL yt_rsci_clken_d : STD_LOGIC;
  SIGNAL yt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL INNER_LOOP_b_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_clken : STD_LOGIC;
  SIGNAL yt_rsc_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsc_we : STD_LOGIC;
  SIGNAL yt_rsc_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_wea_d_iff : STD_LOGIC;
  SIGNAL yt_rsci_we_d_iff : STD_LOGIC;

  SIGNAL INNER_LOOP_b_rem_cmp_a_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL yt_rsc_comp_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_comp_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
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
  SIGNAL xt_rsci_qa : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_da : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_adra : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_adra_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      adrb_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      qb_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      readB_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_qb : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_adrb : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_adrb_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_qb_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
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
  SIGNAL yt_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      xt_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      g_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      xt_rsci_adra_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xt_rsci_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_adrb_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_qb_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      yt_rsci_clken_d : OUT STD_LOGIC;
      yt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      yt_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      INNER_LOOP_b_rem_cmp_a : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      INNER_LOOP_b_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      INNER_LOOP_b_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_wea_d_pff : OUT STD_LOGIC;
      yt_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_adra_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_twiddle_rsci_adrb_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL stockham_DIT_core_inst_twiddle_rsci_qb_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_yt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_yt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_yt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_yt_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO
      0);
  SIGNAL stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  INNER_LOOP_b_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 128,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => INNER_LOOP_b_rem_cmp_a_1,
      b => INNER_LOOP_b_rem_cmp_b_1,
      z => INNER_LOOP_b_rem_cmp_z_1
    );
  INNER_LOOP_b_rem_cmp_a_1 <= INNER_LOOP_b_rem_cmp_a;
  INNER_LOOP_b_rem_cmp_b_1 <= INNER_LOOP_b_rem_cmp_b;
  INNER_LOOP_b_rem_cmp_z <= INNER_LOOP_b_rem_cmp_z_1;

  yt_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      addr_width => 10,
      data_width => 64,
      depth => 1024,
      latency => 1
      )
    PORT MAP(
      clk => clk,
      clken => yt_rsc_clken,
      d => yt_rsc_comp_d,
      q => yt_rsc_comp_q,
      radr => yt_rsc_comp_radr,
      wadr => yt_rsc_comp_wadr,
      we => yt_rsc_we
    );
  yt_rsc_comp_d <= yt_rsc_d;
  yt_rsc_q <= yt_rsc_comp_q;
  yt_rsc_comp_radr <= yt_rsc_radr;
  yt_rsc_comp_wadr <= yt_rsc_wadr;

  xt_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rwport_1_10_64_1024_1024_64_1_gen
    PORT MAP(
      qa => xt_rsci_qa,
      wea => xt_rsc_wea,
      da => xt_rsci_da,
      adra => xt_rsci_adra,
      adra_d => xt_rsci_adra_d_1,
      da_d => xt_rsci_da_d_1,
      qa_d => xt_rsci_qa_d_1,
      wea_d => xt_rsci_wea_d_iff,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsci_wea_d_iff
    );
  xt_rsci_qa <= xt_rsc_qa;
  xt_rsc_da <= xt_rsci_da;
  xt_rsc_adra <= xt_rsci_adra;
  xt_rsci_adra_d_1 <= xt_rsci_adra_d;
  xt_rsci_da_d_1 <= xt_rsci_da_d;
  xt_rsci_qa_d <= xt_rsci_qa_d_1;

  twiddle_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_2R1W_RBW_DUAL_rport_4_10_64_1024_1024_64_1_gen
    PORT MAP(
      qb => twiddle_rsci_qb,
      adrb => twiddle_rsci_adrb,
      adrb_d => twiddle_rsci_adrb_d_1,
      qb_d => twiddle_rsci_qb_d_1,
      readB_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsci_qb <= twiddle_rsc_qb;
  twiddle_rsc_adrb <= twiddle_rsci_adrb;
  twiddle_rsci_adrb_d_1 <= twiddle_rsci_adrb_d;
  twiddle_rsci_qb_d <= twiddle_rsci_qb_d_1;

  yt_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_5_10_64_1024_1024_64_1_gen
    PORT MAP(
      clken => yt_rsc_clken,
      q => yt_rsci_q,
      radr => yt_rsci_radr,
      we => yt_rsc_we,
      d => yt_rsci_d,
      wadr => yt_rsci_wadr,
      clken_d => yt_rsci_clken_d,
      d_d => yt_rsci_d_d_1,
      q_d => yt_rsci_q_d_1,
      radr_d => yt_rsci_radr_d_1,
      wadr_d => yt_rsci_wadr_d_1,
      we_d => yt_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => yt_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => yt_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  yt_rsci_q <= yt_rsc_q;
  yt_rsc_radr <= yt_rsci_radr;
  yt_rsc_d <= yt_rsci_d;
  yt_rsc_wadr <= yt_rsci_wadr;
  yt_rsci_d_d_1 <= yt_rsci_d_d;
  yt_rsci_q_d <= yt_rsci_q_d_1;
  yt_rsci_radr_d_1 <= yt_rsci_radr_d;
  yt_rsci_wadr_d_1 <= yt_rsci_wadr_d;

  stockham_DIT_core_inst : stockham_DIT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      xt_rsc_triosy_lz => xt_rsc_triosy_lz,
      p_rsc_dat => stockham_DIT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      g_rsc_triosy_lz => g_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      xt_rsci_adra_d => stockham_DIT_core_inst_xt_rsci_adra_d,
      xt_rsci_da_d => stockham_DIT_core_inst_xt_rsci_da_d,
      xt_rsci_qa_d => stockham_DIT_core_inst_xt_rsci_qa_d,
      xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_adrb_d => stockham_DIT_core_inst_twiddle_rsci_adrb_d,
      twiddle_rsci_qb_d => stockham_DIT_core_inst_twiddle_rsci_qb_d,
      twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readB_r_ram_ir_internal_RMASK_B_d,
      yt_rsci_clken_d => yt_rsci_clken_d,
      yt_rsci_d_d => stockham_DIT_core_inst_yt_rsci_d_d,
      yt_rsci_q_d => stockham_DIT_core_inst_yt_rsci_q_d,
      yt_rsci_radr_d => stockham_DIT_core_inst_yt_rsci_radr_d,
      yt_rsci_wadr_d => stockham_DIT_core_inst_yt_rsci_wadr_d,
      yt_rsci_readA_r_ram_ir_internal_RMASK_B_d => yt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      INNER_LOOP_b_rem_cmp_a => stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_a,
      INNER_LOOP_b_rem_cmp_b => stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_b,
      INNER_LOOP_b_rem_cmp_z => stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_z,
      xt_rsci_wea_d_pff => xt_rsci_wea_d_iff,
      yt_rsci_we_d_pff => yt_rsci_we_d_iff
    );
  stockham_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  xt_rsci_adra_d <= stockham_DIT_core_inst_xt_rsci_adra_d;
  xt_rsci_da_d <= stockham_DIT_core_inst_xt_rsci_da_d;
  stockham_DIT_core_inst_xt_rsci_qa_d <= xt_rsci_qa_d;
  twiddle_rsci_adrb_d <= stockham_DIT_core_inst_twiddle_rsci_adrb_d;
  stockham_DIT_core_inst_twiddle_rsci_qb_d <= twiddle_rsci_qb_d;
  yt_rsci_d_d <= stockham_DIT_core_inst_yt_rsci_d_d;
  stockham_DIT_core_inst_yt_rsci_q_d <= yt_rsci_q_d;
  yt_rsci_radr_d <= stockham_DIT_core_inst_yt_rsci_radr_d;
  yt_rsci_wadr_d <= stockham_DIT_core_inst_yt_rsci_wadr_d;
  INNER_LOOP_b_rem_cmp_a <= stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_a;
  INNER_LOOP_b_rem_cmp_b <= stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_b;
  stockham_DIT_core_inst_INNER_LOOP_b_rem_cmp_z <= INNER_LOOP_b_rem_cmp_z;

END v12;



