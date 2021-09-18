
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

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   ls5382@newnano.poly.edu
--  Generated date: Thu Sep 16 12:08:48 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen;

ARCHITECTURE v11 OF ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(23 DOWNTO 12));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(11 DOWNTO 0));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    for_C_0_tr0 : IN STD_LOGIC;
    INNER_LOOP_C_2_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END ntt_flat_core_core_fsm;

ARCHITECTURE v11 OF ntt_flat_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for ntt_flat_core_core_fsm_1
  TYPE ntt_flat_core_core_fsm_1_ST IS (main_C_0, for_C_0, STAGE_LOOP_C_0, INNER_LOOP_C_0,
      INNER_LOOP_C_1, INNER_LOOP_C_2, STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : ntt_flat_core_core_fsm_1_ST;
  SIGNAL state_var_NS : ntt_flat_core_core_fsm_1_ST;

BEGIN
  ntt_flat_core_core_fsm_1 : PROCESS (for_C_0_tr0, INNER_LOOP_C_2_tr0, STAGE_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        IF ( for_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_0;
        ELSE
          state_var_NS <= for_C_0;
        END IF;
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= INNER_LOOP_C_0;
      WHEN INNER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= INNER_LOOP_C_1;
      WHEN INNER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= INNER_LOOP_C_2;
      WHEN INNER_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        IF ( INNER_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= INNER_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= for_C_0;
    END CASE;
  END PROCESS ntt_flat_core_core_fsm_1;

  ntt_flat_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS ntt_flat_core_core_fsm_1_REG;

END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (51 DOWNTO 0);
    mult_t_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END ntt_flat_core_wait_dp;

ARCHITECTURE v11 OF ntt_flat_core_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL mult_t_mul_cmp_z_oreg_pconst_51_20 : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  mult_t_mul_cmp_z_oreg <= mult_t_mul_cmp_z_oreg_pconst_51_20;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_t_mul_cmp_z_oreg_pconst_51_20 <= mult_t_mul_cmp_z(51 DOWNTO 20);
    END IF;
  END PROCESS;
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_1_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_2_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_3_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_4_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_5_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_6_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_7_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_8_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_9_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_10_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_11_0_lz : OUT STD_LOGIC;
    result_rsc_triosy_12_0_lz : OUT STD_LOGIC;
    vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_1_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_1_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_1_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_2_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_2_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_2_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_3_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_3_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_3_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_4_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_4_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_4_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_5_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_5_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_5_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_6_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_6_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_6_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_7_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_7_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_7_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_8_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_8_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_8_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_9_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_9_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_9_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    result_rsc_10_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_10_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_10_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    result_rsc_11_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_11_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_11_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    result_rsc_12_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
    result_rsc_12_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsc_12_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
        DOWNTO 0);
    mult_t_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_t_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (51 DOWNTO 0);
    twiddle_rsci_adra_d_pff : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_1_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_9_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END ntt_flat_core;

ARCHITECTURE v11 OF ntt_flat_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL mult_t_mul_cmp_a_drv : STD_LOGIC_VECTOR (31 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL butterFly_f2_acc_1_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL butterFly_f1_acc_1_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL or_dcpl_20 : STD_LOGIC;
  SIGNAL or_dcpl_21 : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL or_dcpl_24 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_28 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL or_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL or_dcpl_31 : STD_LOGIC;
  SIGNAL or_dcpl_33 : STD_LOGIC;
  SIGNAL or_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL or_dcpl_38 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_71 : STD_LOGIC;
  SIGNAL or_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL or_dcpl_46 : STD_LOGIC;
  SIGNAL or_tmp_16 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL or_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_52 : STD_LOGIC;
  SIGNAL or_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL or_tmp_20 : STD_LOGIC;
  SIGNAL not_tmp_61 : STD_LOGIC;
  SIGNAL or_dcpl_55 : STD_LOGIC;
  SIGNAL or_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL or_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL or_tmp_25 : STD_LOGIC;
  SIGNAL not_tmp_63 : STD_LOGIC;
  SIGNAL or_dcpl_63 : STD_LOGIC;
  SIGNAL or_dcpl_67 : STD_LOGIC;
  SIGNAL not_tmp_64 : STD_LOGIC;
  SIGNAL or_tmp_29 : STD_LOGIC;
  SIGNAL or_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_73 : STD_LOGIC;
  SIGNAL modulo_sub_base_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL INNER_LOOP_j_11_0_sva_2 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL for_i_12_0_sva_2 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL butterFly_acc_4_itm_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_stage_0_3 : STD_LOGIC;
  SIGNAL INNER_LOOP_stage_0 : STD_LOGIC;
  SIGNAL INNER_LOOP_stage_0_1 : STD_LOGIC;
  SIGNAL butterFly_acc_itm_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL butterFly_acc_4_itm_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_stage_0_2 : STD_LOGIC;
  SIGNAL butterFly_acc_itm_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL butterFly_acc_4_itm_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_stage_0_4 : STD_LOGIC;
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_vec_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL INNER_LOOP_or_1_cse : STD_LOGIC;
  SIGNAL nor_18_cse : STD_LOGIC;
  SIGNAL or_96_cse : STD_LOGIC;
  SIGNAL butterFly_f1_nor_7_cse : STD_LOGIC;
  SIGNAL and_163_rmff : STD_LOGIC;
  SIGNAL or_121_rmff : STD_LOGIC;
  SIGNAL or_129_rmff : STD_LOGIC;
  SIGNAL or_137_rmff : STD_LOGIC;
  SIGNAL or_145_rmff : STD_LOGIC;
  SIGNAL or_153_rmff : STD_LOGIC;
  SIGNAL or_161_rmff : STD_LOGIC;
  SIGNAL or_169_rmff : STD_LOGIC;
  SIGNAL or_177_rmff : STD_LOGIC;
  SIGNAL or_185_rmff : STD_LOGIC;
  SIGNAL or_193_rmff : STD_LOGIC;
  SIGNAL or_200_rmff : STD_LOGIC;
  SIGNAL or_207_rmff : STD_LOGIC;
  SIGNAL or_214_rmff : STD_LOGIC;
  SIGNAL for_or_11_seb : STD_LOGIC;
  SIGNAL for_or_10_seb : STD_LOGIC;
  SIGNAL for_or_9_seb : STD_LOGIC;
  SIGNAL for_or_8_seb : STD_LOGIC;
  SIGNAL for_or_7_seb : STD_LOGIC;
  SIGNAL for_or_6_seb : STD_LOGIC;
  SIGNAL for_or_5_seb : STD_LOGIC;
  SIGNAL for_or_4_seb : STD_LOGIC;
  SIGNAL for_or_3_seb : STD_LOGIC;
  SIGNAL for_or_2_seb : STD_LOGIC;
  SIGNAL for_or_1_seb : STD_LOGIC;
  SIGNAL for_or_seb : STD_LOGIC;
  SIGNAL result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_mx0c0 : STD_LOGIC;
  SIGNAL mult_res_lpi_3_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_qr_lpi_3_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_idx2_15_0_sva_2_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL for_i_slc_for_i_12_0_11_0_1_itm_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL butterFly_idx2_15_0_sva_3_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL INNER_LOOP_idx1_acc_psp_sva_2_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL INNER_LOOP_k_15_0_sva_2_0 : STD_LOGIC;
  SIGNAL INNER_LOOP_k_15_0_sva : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mult_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_20_false_acc_psp_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_20_false_rshift_psp_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL tmp_lpi_3_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_qr_lpi_3_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_lpi_3_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL INNER_LOOP_idx1_mul_itm : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_f1_acc_1_svs_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL butterFly_f2_acc_1_svs_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL butterFly_f1_butterFly_f1_nor_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_nor_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_nor_1_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_2_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_nor_3_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_4_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_5_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_6_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_nor_6_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_8_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_9_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_10_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_11_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_nor_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_nor_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_nor_1_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_2_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_nor_3_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_4_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_5_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_6_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_nor_6_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_8_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_9_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_10_itm_1 : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_11_itm_1 : STD_LOGIC;
  SIGNAL INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL mult_z_mul_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm_1 : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL INNER_LOOP_j_11_0_sva_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL INNER_LOOP_k_15_0_sva_1_0 : STD_LOGIC;
  SIGNAL INNER_LOOP_idx1_acc_psp_sva_1_10_0 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL butterFly_idx2_15_0_sva_1_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL INNER_LOOP_idx1_acc_psp_sva_1 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL butterFly_idx2_15_0_sva_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL INNER_LOOP_j_or_cse : STD_LOGIC;
  SIGNAL butterFly_f2_mux1h_1_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL butterFly_f2_mux1h_49_itm : STD_LOGIC;
  SIGNAL for_mux1h_15_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_mux1h_27_itm : STD_LOGIC;
  SIGNAL operator_20_false_acc_itm_4_1 : STD_LOGIC;

  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL and_50_nl : STD_LOGIC;
  SIGNAL mux_6_nl : STD_LOGIC;
  SIGNAL and_61_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL and_72_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL and_82_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL and_92_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL and_99_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC;
  SIGNAL and_108_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL or_72_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL or_80_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL or_84_nl : STD_LOGIC;
  SIGNAL mux_19_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL or_91_nl : STD_LOGIC;
  SIGNAL mux_21_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL and_482_nl : STD_LOGIC;
  SIGNAL modulo_sub_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly_mux_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_INNER_LOOP_and_nl : STD_LOGIC;
  SIGNAL or_225_nl : STD_LOGIC;
  SIGNAL for_i_for_i_mux_1_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL INNER_LOOP_nor_nl : STD_LOGIC;
  SIGNAL mult_res_and_nl : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_nl : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_1_nl : STD_LOGIC;
  SIGNAL mult_res_and_1_nl : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_3_nl : STD_LOGIC;
  SIGNAL mult_res_and_2_nl : STD_LOGIC;
  SIGNAL mult_res_and_3_nl : STD_LOGIC;
  SIGNAL mult_res_and_4_nl : STD_LOGIC;
  SIGNAL butterFly_f2_butterFly_f2_and_7_nl : STD_LOGIC;
  SIGNAL mult_res_and_5_nl : STD_LOGIC;
  SIGNAL mult_res_and_6_nl : STD_LOGIC;
  SIGNAL mult_res_and_7_nl : STD_LOGIC;
  SIGNAL mult_res_and_8_nl : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_nl : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_1_nl : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_3_nl : STD_LOGIC;
  SIGNAL butterFly_f1_butterFly_f1_and_7_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL nor_9_nl : STD_LOGIC;
  SIGNAL or_265_nl : STD_LOGIC;
  SIGNAL modulo_add_qif_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL operator_20_false_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mux_4_nl : STD_LOGIC;
  SIGNAL and_34_nl : STD_LOGIC;
  SIGNAL and_161_nl : STD_LOGIC;
  SIGNAL for_mux1h_3_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL for_for_for_nor_12_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_13_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_11_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_14_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_10_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_15_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_9_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_16_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_8_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_17_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_7_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_18_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_6_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_19_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_5_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_20_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_4_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_21_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_3_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_22_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_2_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_23_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_1_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_24_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_nl : STD_LOGIC;
  SIGNAL for_for_for_nor_25_nl : STD_LOGIC;
  SIGNAL mult_z_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL INNER_LOOP_k_lshift_rg_a : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL INNER_LOOP_k_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_k_lshift_rg_z : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL INNER_LOOP_g_rshift_rg_a : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP_g_rshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_g_rshift_rg_z : STD_LOGIC_VECTOR (11 DOWNTO 0);

  COMPONENT ntt_flat_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (51 DOWNTO 0);
      mult_t_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z : STD_LOGIC_VECTOR (51 DOWNTO
      0);
  SIGNAL ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);

  COMPONENT ntt_flat_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      for_C_0_tr0 : IN STD_LOGIC;
      INNER_LOOP_C_2_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL ntt_flat_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL ntt_flat_core_core_fsm_inst_INNER_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_12_4_2(input_3 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(11 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_32_13_2(input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(12 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_14_2(input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(13 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

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
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_32_3_2(input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

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

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);

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

BEGIN
  -- Output Reader Assignments
  mult_t_mul_cmp_a <= mult_t_mul_cmp_a_drv;

  p_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 32
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

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
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => twiddle_rsc_triosy_lz
    );
  twiddle_h_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_lz
    );
  result_rsc_triosy_12_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_12_0_lz
    );
  result_rsc_triosy_11_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_11_0_lz
    );
  result_rsc_triosy_10_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_10_0_lz
    );
  result_rsc_triosy_9_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_9_0_lz
    );
  result_rsc_triosy_8_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_8_0_lz
    );
  result_rsc_triosy_7_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_7_0_lz
    );
  result_rsc_triosy_6_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_6_0_lz
    );
  result_rsc_triosy_5_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_5_0_lz
    );
  result_rsc_triosy_4_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_4_0_lz
    );
  result_rsc_triosy_3_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_3_0_lz
    );
  result_rsc_triosy_2_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_2_0_lz
    );
  result_rsc_triosy_1_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_1_0_lz
    );
  result_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
      lz => result_rsc_triosy_0_0_lz
    );
  INNER_LOOP_k_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 11,
      signd_a => 0,
      width_s => 4,
      width_z => 16
      )
    PORT MAP(
      a => INNER_LOOP_k_lshift_rg_a,
      s => INNER_LOOP_k_lshift_rg_s,
      z => INNER_LOOP_k_lshift_rg_z
    );
  INNER_LOOP_k_lshift_rg_a <= MUX_v_11_2_2(STD_LOGIC_VECTOR'( "00000000001"), (z_out_3(10
      DOWNTO 0)), fsm_output(3));
  INNER_LOOP_k_lshift_rg_s <= MUX_v_4_2_2(z_out, operator_20_false_acc_psp_sva, fsm_output(3));
  z_out_1 <= INNER_LOOP_k_lshift_rg_z;

  INNER_LOOP_g_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 13,
      signd_a => 0,
      width_s => 4,
      width_z => 12
      )
    PORT MAP(
      a => INNER_LOOP_g_rshift_rg_a,
      s => INNER_LOOP_g_rshift_rg_s,
      z => INNER_LOOP_g_rshift_rg_z
    );
  INNER_LOOP_g_rshift_rg_a <= (NOT (fsm_output(3))) & '0' & (MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
      INNER_LOOP_j_11_0_sva_10_0, (fsm_output(3))));
  INNER_LOOP_g_rshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, operator_20_false_acc_psp_sva,
      fsm_output(3));
  z_out_3 <= INNER_LOOP_g_rshift_rg_z;

  ntt_flat_core_wait_dp_inst : ntt_flat_core_wait_dp
    PORT MAP(
      clk => clk,
      mult_t_mul_cmp_z => ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z,
      mult_t_mul_cmp_z_oreg => ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z_oreg
    );
  ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z <= mult_t_mul_cmp_z;
  mult_t_mul_cmp_z_oreg <= ntt_flat_core_wait_dp_inst_mult_t_mul_cmp_z_oreg;

  ntt_flat_core_core_fsm_inst : ntt_flat_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => ntt_flat_core_core_fsm_inst_fsm_output,
      for_C_0_tr0 => nor_18_cse,
      INNER_LOOP_C_2_tr0 => ntt_flat_core_core_fsm_inst_INNER_LOOP_C_2_tr0,
      STAGE_LOOP_C_1_tr0 => ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= ntt_flat_core_core_fsm_inst_fsm_output;
  ntt_flat_core_core_fsm_inst_INNER_LOOP_C_2_tr0 <= (NOT(INNER_LOOP_stage_0_3 OR
      INNER_LOOP_stage_0_2)) AND nor_18_cse;
  ntt_flat_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= operator_20_false_acc_itm_4_1;

  and_163_rmff <= INNER_LOOP_stage_0_1 AND (fsm_output(4));
  or_121_rmff <= ((NOT (butterFly_acc_4_itm_3(3))) AND INNER_LOOP_stage_0_4 AND (NOT
      (butterFly_acc_4_itm_3(0))) AND and_dcpl_21 AND (fsm_output(3))) OR (INNER_LOOP_stage_0_1
      AND (fsm_output(1))) OR (and_dcpl_27 AND and_dcpl_25 AND (fsm_output(4)));
  or_129_rmff <= (and_dcpl_27 AND and_dcpl_38 AND (fsm_output(3))) OR (and_dcpl_42
      AND and_dcpl_40 AND (fsm_output(4)));
  and_50_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0001"))) AND
      or_tmp_7;
  mux_5_nl <= MUX_s_1_2_2(or_dcpl_24, and_50_nl, butterFly_f1_acc_1_tmp(0));
  for_or_11_seb <= (NOT (fsm_output(5))) OR mux_5_nl OR (NOT INNER_LOOP_stage_0_1);
  or_137_rmff <= (and_dcpl_27 AND and_dcpl_50 AND (fsm_output(3))) OR (and_dcpl_42
      AND and_dcpl_52 AND (fsm_output(4)));
  and_61_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0010"))) AND
      or_tmp_10;
  mux_6_nl <= MUX_s_1_2_2(and_61_nl, or_dcpl_29, butterFly_f1_acc_1_tmp(0));
  for_or_10_seb <= (NOT (fsm_output(5))) OR mux_6_nl OR (NOT INNER_LOOP_stage_0_1);
  or_145_rmff <= (and_dcpl_27 AND and_dcpl_60 AND (fsm_output(3))) OR (and_dcpl_42
      AND and_dcpl_62 AND (fsm_output(4)));
  and_72_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0011"))) AND
      or_tmp_10;
  mux_7_nl <= MUX_s_1_2_2(or_dcpl_34, and_72_nl, butterFly_f1_acc_1_tmp(0));
  for_or_9_seb <= (NOT (fsm_output(5))) OR mux_7_nl OR (NOT INNER_LOOP_stage_0_1);
  or_153_rmff <= (and_dcpl_68 AND and_dcpl_25 AND (fsm_output(3))) OR (and_dcpl_71
      AND and_dcpl_70 AND (fsm_output(4)));
  and_82_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0100"))) AND
      or_tmp_13;
  mux_8_nl <= MUX_s_1_2_2(and_82_nl, or_dcpl_39, butterFly_f1_acc_1_tmp(0));
  for_or_8_seb <= (NOT (fsm_output(5))) OR mux_8_nl OR (NOT INNER_LOOP_stage_0_1);
  or_161_rmff <= (and_dcpl_68 AND and_dcpl_38 AND (fsm_output(3))) OR (and_dcpl_71
      AND and_dcpl_40 AND (fsm_output(4)));
  and_92_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0101"))) AND
      or_tmp_13;
  mux_9_nl <= MUX_s_1_2_2(or_dcpl_43, and_92_nl, butterFly_f1_acc_1_tmp(0));
  for_or_7_seb <= (NOT (fsm_output(5))) OR mux_9_nl OR (NOT INNER_LOOP_stage_0_1);
  or_169_rmff <= (and_dcpl_68 AND and_dcpl_50 AND (fsm_output(3))) OR (and_dcpl_71
      AND and_dcpl_52 AND (fsm_output(4)));
  and_99_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0110"))) AND
      or_tmp_16;
  mux_10_nl <= MUX_s_1_2_2(and_99_nl, or_dcpl_46, butterFly_f1_acc_1_tmp(0));
  for_or_6_seb <= (NOT (fsm_output(5))) OR mux_10_nl OR (NOT INNER_LOOP_stage_0_1);
  or_177_rmff <= (and_dcpl_68 AND and_dcpl_60 AND (fsm_output(3))) OR (and_dcpl_71
      AND and_dcpl_62 AND (fsm_output(4)));
  and_108_nl <= (NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("0111"))))
      AND or_tmp_16;
  mux_11_nl <= MUX_s_1_2_2(or_dcpl_49, and_108_nl, butterFly_f1_acc_1_tmp(0));
  for_or_5_seb <= (NOT (fsm_output(5))) OR mux_11_nl OR (NOT INNER_LOOP_stage_0_1);
  or_185_rmff <= (and_dcpl_101 AND and_dcpl_25 AND (fsm_output(3))) OR (INNER_LOOP_stage_0_3
      AND CONV_SL_1_1(butterFly_acc_4_itm_2(3 DOWNTO 2)=STD_LOGIC_VECTOR'("10"))
      AND and_dcpl_70 AND (fsm_output(4)));
  or_72_nl <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_12_nl <= MUX_s_1_2_2(not_tmp_61, or_tmp_20, or_72_nl);
  mux_13_nl <= MUX_s_1_2_2(mux_12_nl, or_dcpl_53, butterFly_f1_acc_1_tmp(0));
  for_or_4_seb <= (NOT (fsm_output(5))) OR mux_13_nl OR (NOT INNER_LOOP_stage_0_1);
  or_193_rmff <= (and_dcpl_112 AND and_dcpl_21 AND (fsm_output(3))) OR (and_dcpl_101
      AND and_dcpl_38 AND (fsm_output(4)));
  or_80_nl <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_14_nl <= MUX_s_1_2_2(not_tmp_61, or_tmp_20, or_80_nl);
  mux_15_nl <= MUX_s_1_2_2(or_dcpl_57, mux_14_nl, butterFly_f1_acc_1_tmp(0));
  for_or_3_seb <= (NOT (fsm_output(5))) OR mux_15_nl OR (NOT INNER_LOOP_stage_0_1);
  or_200_rmff <= (and_dcpl_119 AND and_dcpl_118 AND (fsm_output(3))) OR (and_dcpl_101
      AND and_dcpl_50 AND (fsm_output(4)));
  or_84_nl <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_16_nl <= MUX_s_1_2_2(not_tmp_63, or_tmp_25, or_84_nl);
  mux_17_nl <= MUX_s_1_2_2(mux_16_nl, or_dcpl_60, butterFly_f1_acc_1_tmp(0));
  for_or_2_seb <= (NOT (fsm_output(5))) OR mux_17_nl OR (NOT INNER_LOOP_stage_0_1);
  or_207_rmff <= (and_dcpl_112 AND and_dcpl_118 AND (fsm_output(3))) OR (and_dcpl_101
      AND and_dcpl_60 AND (fsm_output(4)));
  or_91_nl <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("011"));
  mux_18_nl <= MUX_s_1_2_2(not_tmp_63, or_tmp_25, or_91_nl);
  mux_19_nl <= MUX_s_1_2_2(or_dcpl_63, mux_18_nl, butterFly_f1_acc_1_tmp(0));
  for_or_1_seb <= (NOT (fsm_output(5))) OR mux_19_nl OR (NOT INNER_LOOP_stage_0_1);
  or_214_rmff <= (and_dcpl_119 AND CONV_SL_1_1(butterFly_acc_4_itm_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"))
      AND (fsm_output(3))) OR (and_dcpl_100 AND (butterFly_acc_itm_2(2)) AND and_dcpl_25
      AND (fsm_output(4)));
  or_96_cse <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_482_nl <= (NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"))))
      AND or_tmp_29;
  mux_20_nl <= MUX_s_1_2_2(and_482_nl, or_tmp_29, or_96_cse);
  mux_21_nl <= MUX_s_1_2_2(mux_20_nl, or_dcpl_67, butterFly_f1_acc_1_tmp(0));
  for_or_seb <= (NOT (fsm_output(5))) OR mux_21_nl OR (NOT INNER_LOOP_stage_0_1);
  nor_18_cse <= NOT(INNER_LOOP_stage_0_1 OR INNER_LOOP_stage_0);
  butterFly_f1_nor_7_cse <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  INNER_LOOP_j_or_cse <= CONV_SL_1_1(fsm_output(5 DOWNTO 3)/=STD_LOGIC_VECTOR'("000"));
  INNER_LOOP_or_1_cse <= (fsm_output(2)) OR (fsm_output(5));
  for_i_12_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(butterFly_idx2_15_0_sva_2_11_0),
      12), 13) + UNSIGNED'( "0000000000001"), 13));
  butterFly_f2_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_idx2_15_0_sva_1(15
      DOWNTO 12)) + UNSIGNED(STAGE_LOOP_i_3_0_sva), 4));
  butterFly_f1_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_idx1_acc_psp_sva_1(14
      DOWNTO 11)) + UNSIGNED(STAGE_LOOP_i_3_0_sva), 4));
  INNER_LOOP_j_11_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_j_11_0_sva_10_0),
      11), 12) + UNSIGNED'( "000000000001"), 12));
  mult_if_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_sva_1) - UNSIGNED(p_sva),
      32));
  mult_if_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_res_sva_1)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT p_sva), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"),
      33));
  mult_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_acc_nl),
      32)), mult_res_sva_1, mult_if_acc_1_nl(32));
  mult_res_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_z_mul_itm_1) - UNSIGNED(mult_z_mul_itm),
      32));
  modulo_sub_base_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_lpi_3_dfm) - SIGNED(mult_res_lpi_3_dfm_1),
      32));
  modulo_add_base_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(tmp_lpi_3_dfm)
      + UNSIGNED(mult_res_lpi_3_dfm_1), 32));
  INNER_LOOP_idx1_acc_psp_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_idx1_mul_itm)
      + UNSIGNED(INNER_LOOP_k_15_0_sva(15 DOWNTO 1)), 15));
  butterFly_idx2_15_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_idx1_acc_psp_sva_1
      & (INNER_LOOP_k_15_0_sva(0))) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_20_false_rshift_psp_sva),
      12), 16), 16));
  operator_20_false_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT z_out))
      + SIGNED'( "01101"), 5));
  operator_20_false_acc_itm_4_1 <= operator_20_false_acc_nl(4);
  or_dcpl_17 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_18 <= or_dcpl_17 OR or_96_cse;
  and_dcpl_21 <= NOT(CONV_SL_1_1(butterFly_acc_4_itm_3(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_25 <= NOT(CONV_SL_1_1(butterFly_acc_itm_2(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_26 <= INNER_LOOP_stage_0_3 AND (NOT (butterFly_acc_itm_2(3)));
  and_dcpl_27 <= and_dcpl_26 AND (NOT (butterFly_acc_itm_2(2)));
  or_tmp_7 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  and_dcpl_33 <= INNER_LOOP_stage_0_1 AND (NOT (butterFly_f1_acc_1_tmp(0)));
  and_dcpl_35 <= butterFly_f1_nor_7_cse AND and_dcpl_33;
  or_dcpl_20 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_21 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_23 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_24 <= or_dcpl_17 OR or_dcpl_23;
  and_dcpl_38 <= CONV_SL_1_1(butterFly_acc_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_40 <= CONV_SL_1_1(butterFly_acc_4_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_41 <= INNER_LOOP_stage_0_3 AND (NOT (butterFly_acc_4_itm_2(3)));
  and_dcpl_42 <= and_dcpl_41 AND (NOT (butterFly_acc_4_itm_2(2)));
  and_dcpl_46 <= INNER_LOOP_stage_0_1 AND (butterFly_f1_acc_1_tmp(0));
  and_dcpl_47 <= butterFly_f1_nor_7_cse AND and_dcpl_46;
  or_dcpl_26 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_28 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_29 <= or_dcpl_17 OR or_dcpl_28;
  and_dcpl_50 <= CONV_SL_1_1(butterFly_acc_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_52 <= CONV_SL_1_1(butterFly_acc_4_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  or_tmp_10 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("001"));
  and_dcpl_56 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_57 <= and_dcpl_56 AND and_dcpl_33;
  or_dcpl_31 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_33 <= NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_34 <= or_dcpl_17 OR or_dcpl_33;
  and_dcpl_60 <= CONV_SL_1_1(butterFly_acc_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_62 <= CONV_SL_1_1(butterFly_acc_4_itm_2(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_65 <= and_dcpl_56 AND and_dcpl_46;
  or_dcpl_36 <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_38 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_39 <= or_dcpl_38 OR or_96_cse;
  and_dcpl_68 <= and_dcpl_26 AND (butterFly_acc_itm_2(2));
  and_dcpl_70 <= NOT(CONV_SL_1_1(butterFly_acc_4_itm_2(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_71 <= and_dcpl_41 AND (butterFly_acc_4_itm_2(2));
  or_tmp_13 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"));
  and_dcpl_76 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_77 <= and_dcpl_76 AND and_dcpl_33;
  or_dcpl_41 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_43 <= or_dcpl_38 OR or_dcpl_23;
  or_dcpl_46 <= or_dcpl_38 OR or_dcpl_28;
  or_tmp_16 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("011"));
  and_dcpl_90 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  or_dcpl_49 <= or_dcpl_38 OR or_dcpl_33;
  or_dcpl_52 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_53 <= or_dcpl_52 OR or_96_cse;
  and_dcpl_100 <= INNER_LOOP_stage_0_3 AND (butterFly_acc_itm_2(3));
  and_dcpl_101 <= and_dcpl_100 AND (NOT (butterFly_acc_itm_2(2)));
  or_tmp_20 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"));
  not_tmp_61 <= NOT((butterFly_f2_acc_1_tmp(3)) OR (NOT or_tmp_20));
  or_dcpl_55 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_57 <= or_dcpl_52 OR or_dcpl_23;
  and_dcpl_111 <= (butterFly_acc_4_itm_3(3)) AND INNER_LOOP_stage_0_4;
  and_dcpl_112 <= and_dcpl_111 AND (butterFly_acc_4_itm_3(0));
  or_dcpl_60 <= or_dcpl_52 OR or_dcpl_28;
  and_dcpl_118 <= CONV_SL_1_1(butterFly_acc_4_itm_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_119 <= and_dcpl_111 AND (NOT (butterFly_acc_4_itm_3(0)));
  or_tmp_25 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("101"));
  not_tmp_63 <= NOT((butterFly_f2_acc_1_tmp(3)) OR (NOT or_tmp_25));
  or_dcpl_63 <= or_dcpl_52 OR or_dcpl_33;
  or_dcpl_67 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("11"))
      OR or_96_cse;
  not_tmp_64 <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11")));
  or_tmp_29 <= (butterFly_f1_acc_1_tmp(1)) OR not_tmp_64;
  or_dcpl_72 <= (fsm_output(0)) OR (fsm_output(2));
  or_dcpl_73 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  and_34_nl <= (CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0000"))) AND
      or_tmp_7;
  mux_4_nl <= MUX_s_1_2_2(and_34_nl, or_dcpl_18, butterFly_f1_acc_1_tmp(0));
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_mx0c0 <= (NOT (fsm_output(5)))
      OR mux_4_nl OR (NOT INNER_LOOP_stage_0_1);
  butterFly_f2_mux1h_1_itm <= MUX1HOT_v_11_3_2(INNER_LOOP_idx1_acc_psp_sva_2_10_0,
      (butterFly_idx2_15_0_sva_2_11_0(11 DOWNTO 1)), (INNER_LOOP_idx1_acc_psp_sva_1(10
      DOWNTO 0)), STD_LOGIC_VECTOR'( (fsm_output(3)) & (fsm_output(4)) & (fsm_output(5))));
  butterFly_f2_mux1h_49_itm <= MUX1HOT_s_1_3_2(INNER_LOOP_k_15_0_sva_2_0, (butterFly_idx2_15_0_sva_2_11_0(0)),
      (INNER_LOOP_k_15_0_sva(0)), STD_LOGIC_VECTOR'( (fsm_output(3)) & (fsm_output(4))
      & (fsm_output(5))));
  for_mux1h_15_itm <= MUX1HOT_v_11_3_2((butterFly_idx2_15_0_sva_3_11_0(11 DOWNTO
      1)), INNER_LOOP_idx1_acc_psp_sva_2_10_0, (INNER_LOOP_idx1_acc_psp_sva_1(10
      DOWNTO 0)), STD_LOGIC_VECTOR'( (fsm_output(3)) & (fsm_output(4)) & (fsm_output(5))));
  for_mux1h_27_itm <= MUX1HOT_s_1_3_2((butterFly_idx2_15_0_sva_3_11_0(0)), INNER_LOOP_k_15_0_sva_2_0,
      (INNER_LOOP_k_15_0_sva(0)), STD_LOGIC_VECTOR'( (fsm_output(3)) & (fsm_output(4))
      & (fsm_output(5))));
  vec_rsci_adra_d <= butterFly_idx2_15_0_sva_2_11_0;
  and_161_nl <= INNER_LOOP_stage_0 AND (fsm_output(1));
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( '0' & and_161_nl);
  twiddle_rsci_adra_d_pff <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(for_i_slc_for_i_12_0_11_0_1_itm_1)
      * UNSIGNED(INNER_LOOP_k_15_0_sva(11 DOWNTO 0))), 12));
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( '0' & and_163_rmff);
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( '0' & and_163_rmff);
  for_mux1h_3_nl <= MUX1HOT_v_12_4_2(for_i_slc_for_i_12_0_11_0_1_itm_1, butterFly_idx2_15_0_sva_3_11_0,
      (INNER_LOOP_idx1_acc_psp_sva_2_10_0 & INNER_LOOP_k_15_0_sva_2_0), (butterFly_idx2_15_0_sva_1(11
      DOWNTO 0)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(3)) & (fsm_output(4))
      & (fsm_output(5))));
  result_rsc_0_0_i_adra_d <= (INNER_LOOP_idx1_acc_psp_sva_1(10 DOWNTO 0)) & (INNER_LOOP_k_15_0_sva(0))
      & for_mux1h_3_nl;
  result_rsc_0_0_i_da_d <= MUX1HOT_v_32_3_2((vec_rsci_qa_d(31 DOWNTO 0)), mult_res_lpi_3_dfm_1,
      modulo_add_qr_lpi_3_dfm_1, STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(3))
      & (fsm_output(4))));
  result_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_121_rmff);
  for_for_for_nor_12_nl <= NOT(or_dcpl_21 OR or_dcpl_20 OR result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_mx0c0);
  for_for_for_nor_13_nl <= NOT((or_dcpl_18 AND (NOT (butterFly_f1_acc_1_tmp(3)))
      AND and_dcpl_35 AND (fsm_output(5))) OR result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_mx0c0);
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_12_nl
      & for_for_for_nor_13_nl);
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_121_rmff);
  result_rsc_1_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_1_0_i_da_d_pff <= MUX_v_32_2_2(modulo_add_qr_lpi_3_dfm_1, mult_res_lpi_3_dfm_mx0,
      fsm_output(4));
  result_rsc_1_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_129_rmff);
  for_for_for_nor_11_nl <= NOT((or_dcpl_24 AND (NOT (butterFly_f1_acc_1_tmp(3)))
      AND and_dcpl_47 AND (fsm_output(5))) OR for_or_11_seb);
  for_for_for_nor_14_nl <= NOT(or_dcpl_21 OR or_dcpl_26 OR for_or_11_seb);
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_11_nl
      & for_for_for_nor_14_nl);
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_129_rmff);
  result_rsc_2_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_2_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_137_rmff);
  for_for_for_nor_10_nl <= NOT((or_dcpl_29 AND (NOT (butterFly_f1_acc_1_tmp(3)))
      AND and_dcpl_57 AND (fsm_output(5))) OR for_or_10_seb);
  for_for_for_nor_15_nl <= NOT(or_dcpl_21 OR or_dcpl_31 OR for_or_10_seb);
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_10_nl
      & for_for_for_nor_15_nl);
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_137_rmff);
  result_rsc_3_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_3_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_145_rmff);
  for_for_for_nor_9_nl <= NOT((or_dcpl_34 AND (NOT (butterFly_f1_acc_1_tmp(3))) AND
      and_dcpl_65 AND (fsm_output(5))) OR for_or_9_seb);
  for_for_for_nor_16_nl <= NOT(or_dcpl_21 OR or_dcpl_36 OR for_or_9_seb);
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_9_nl
      & for_for_for_nor_16_nl);
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_145_rmff);
  result_rsc_4_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_4_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_153_rmff);
  for_for_for_nor_8_nl <= NOT((or_dcpl_39 AND (NOT (butterFly_f1_acc_1_tmp(3))) AND
      and_dcpl_77 AND (fsm_output(5))) OR for_or_8_seb);
  for_for_for_nor_17_nl <= NOT(or_dcpl_41 OR or_dcpl_20 OR for_or_8_seb);
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_8_nl
      & for_for_for_nor_17_nl);
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_153_rmff);
  result_rsc_5_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_5_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_161_rmff);
  for_for_for_nor_7_nl <= NOT((or_dcpl_43 AND (NOT (butterFly_f1_acc_1_tmp(3))) AND
      and_dcpl_76 AND and_dcpl_46 AND (fsm_output(5))) OR for_or_7_seb);
  for_for_for_nor_18_nl <= NOT(or_dcpl_41 OR or_dcpl_26 OR for_or_7_seb);
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_7_nl
      & for_for_for_nor_18_nl);
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_161_rmff);
  result_rsc_6_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_6_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_169_rmff);
  for_for_for_nor_6_nl <= NOT((or_dcpl_46 AND (NOT (butterFly_f1_acc_1_tmp(3))) AND
      and_dcpl_90 AND and_dcpl_33 AND (fsm_output(5))) OR for_or_6_seb);
  for_for_for_nor_19_nl <= NOT(or_dcpl_41 OR or_dcpl_31 OR for_or_6_seb);
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_6_nl
      & for_for_for_nor_19_nl);
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_169_rmff);
  result_rsc_7_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_7_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_177_rmff);
  for_for_for_nor_5_nl <= NOT((or_dcpl_49 AND (NOT (butterFly_f1_acc_1_tmp(3))) AND
      and_dcpl_90 AND and_dcpl_46 AND (fsm_output(5))) OR for_or_5_seb);
  for_for_for_nor_20_nl <= NOT(or_dcpl_41 OR or_dcpl_36 OR for_or_5_seb);
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_5_nl
      & for_for_for_nor_20_nl);
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_177_rmff);
  result_rsc_8_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & butterFly_f2_mux1h_1_itm
      & butterFly_f2_mux1h_49_itm;
  result_rsc_8_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_185_rmff);
  for_for_for_nor_4_nl <= NOT((or_dcpl_53 AND (butterFly_f1_acc_1_tmp(3)) AND and_dcpl_35
      AND (fsm_output(5))) OR for_or_4_seb);
  for_for_for_nor_21_nl <= NOT(or_dcpl_55 OR or_dcpl_20 OR for_or_4_seb);
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_4_nl
      & for_for_for_nor_21_nl);
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_185_rmff);
  result_rsc_9_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & for_mux1h_15_itm
      & for_mux1h_27_itm;
  result_rsc_9_0_i_da_d_pff <= MUX_v_32_2_2(mult_res_lpi_3_dfm_1, modulo_add_qr_lpi_3_dfm_1,
      fsm_output(4));
  result_rsc_9_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_193_rmff);
  for_for_for_nor_3_nl <= NOT((or_dcpl_57 AND (butterFly_f1_acc_1_tmp(3)) AND and_dcpl_47
      AND (fsm_output(5))) OR for_or_3_seb);
  for_for_for_nor_22_nl <= NOT(or_dcpl_55 OR or_dcpl_26 OR for_or_3_seb);
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_3_nl
      & for_for_for_nor_22_nl);
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_193_rmff);
  result_rsc_10_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & for_mux1h_15_itm
      & for_mux1h_27_itm;
  result_rsc_10_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_200_rmff);
  for_for_for_nor_2_nl <= NOT((or_dcpl_60 AND (butterFly_f1_acc_1_tmp(3)) AND and_dcpl_57
      AND (fsm_output(5))) OR for_or_2_seb);
  for_for_for_nor_23_nl <= NOT(or_dcpl_55 OR or_dcpl_31 OR for_or_2_seb);
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_2_nl
      & for_for_for_nor_23_nl);
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' &
      or_200_rmff);
  result_rsc_11_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & for_mux1h_15_itm
      & for_mux1h_27_itm;
  result_rsc_11_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_207_rmff);
  for_for_for_nor_1_nl <= NOT((or_dcpl_63 AND (butterFly_f1_acc_1_tmp(3)) AND and_dcpl_65
      AND (fsm_output(5))) OR for_or_1_seb);
  for_for_for_nor_24_nl <= NOT(or_dcpl_55 OR or_dcpl_36 OR for_or_1_seb);
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_1_nl
      & for_for_for_nor_24_nl);
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' &
      or_207_rmff);
  result_rsc_12_0_i_adra_d <= (butterFly_idx2_15_0_sva_1(11 DOWNTO 0)) & for_mux1h_15_itm
      & for_mux1h_27_itm;
  result_rsc_12_0_i_wea_d <= STD_LOGIC_VECTOR'( '0' & or_214_rmff);
  for_for_for_nor_nl <= NOT((or_dcpl_67 AND (butterFly_f1_acc_1_tmp(3)) AND and_dcpl_77
      AND (fsm_output(5))) OR for_or_seb);
  for_for_for_nor_25_nl <= NOT(not_tmp_64 OR or_dcpl_20 OR for_or_seb);
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_for_nor_nl
      & for_for_for_nor_25_nl);
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( '0' &
      or_214_rmff);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(7)) OR (fsm_output(0))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_obj_ld_cse <= '0';
        INNER_LOOP_stage_0 <= '0';
        butterFly_acc_4_itm_3 <= STD_LOGIC_VECTOR'( "0000");
        INNER_LOOP_stage_0_4 <= '0';
      ELSE
        reg_vec_rsc_triosy_obj_ld_cse <= operator_20_false_acc_itm_4_1 AND (fsm_output(6));
        INNER_LOOP_stage_0 <= (butterFly_mux_nl AND (NOT(or_dcpl_73 OR (INNER_LOOP_stage_0_1
            AND (INNER_LOOP_j_11_0_sva_2(11)) AND (fsm_output(3)))))) OR or_dcpl_72;
        butterFly_acc_4_itm_3 <= butterFly_acc_4_itm_2;
        INNER_LOOP_stage_0_4 <= INNER_LOOP_stage_0_3 AND (fsm_output(5));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_t_mul_cmp_b <= INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm_1;
      mult_res_lpi_3_dfm_1 <= MUX1HOT_v_32_14_2((result_rsc_0_0_i_qa_d(31 DOWNTO
          0)), (result_rsc_1_0_i_qa_d(63 DOWNTO 32)), (result_rsc_2_0_i_qa_d(63 DOWNTO
          32)), (result_rsc_3_0_i_qa_d(63 DOWNTO 32)), (result_rsc_4_0_i_qa_d(63
          DOWNTO 32)), (result_rsc_5_0_i_qa_d(63 DOWNTO 32)), (result_rsc_6_0_i_qa_d(63
          DOWNTO 32)), (result_rsc_7_0_i_qa_d(63 DOWNTO 32)), (result_rsc_8_0_i_qa_d(63
          DOWNTO 32)), (result_rsc_9_0_i_qa_d(63 DOWNTO 32)), (result_rsc_10_0_i_qa_d(63
          DOWNTO 32)), (result_rsc_11_0_i_qa_d(63 DOWNTO 32)), (result_rsc_12_0_i_qa_d(63
          DOWNTO 32)), mult_res_lpi_3_dfm, STD_LOGIC_VECTOR'( mult_res_and_nl & butterFly_f2_butterFly_f2_and_nl
          & butterFly_f2_butterFly_f2_and_1_nl & mult_res_and_1_nl & butterFly_f2_butterFly_f2_and_3_nl
          & mult_res_and_2_nl & mult_res_and_3_nl & mult_res_and_4_nl & butterFly_f2_butterFly_f2_and_7_nl
          & mult_res_and_5_nl & mult_res_and_6_nl & mult_res_and_7_nl & mult_res_and_8_nl
          & (fsm_output(5))));
      butterFly_idx2_15_0_sva_3_11_0 <= MUX_v_12_2_2(('0' & (z_out_3(10 DOWNTO 0))),
          butterFly_idx2_15_0_sva_2_11_0, fsm_output(5));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_stage_0_2 = '1' ) THEN
        mult_t_mul_cmp_a_drv <= MUX_v_32_2_2(('0' & (modulo_sub_base_sva_1(30 DOWNTO
            0))), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_sub_qif_acc_nl),
            32)), modulo_sub_base_sva_1(31));
        tmp_lpi_3_dfm <= MUX1HOT_v_32_13_2((result_rsc_0_0_i_qa_d(63 DOWNTO 32)),
            (result_rsc_1_0_i_qa_d(31 DOWNTO 0)), (result_rsc_2_0_i_qa_d(31 DOWNTO
            0)), (result_rsc_3_0_i_qa_d(31 DOWNTO 0)), (result_rsc_4_0_i_qa_d(31
            DOWNTO 0)), (result_rsc_5_0_i_qa_d(31 DOWNTO 0)), (result_rsc_6_0_i_qa_d(31
            DOWNTO 0)), (result_rsc_7_0_i_qa_d(31 DOWNTO 0)), (result_rsc_8_0_i_qa_d(31
            DOWNTO 0)), (result_rsc_9_0_i_qa_d(31 DOWNTO 0)), (result_rsc_10_0_i_qa_d(31
            DOWNTO 0)), (result_rsc_11_0_i_qa_d(31 DOWNTO 0)), (result_rsc_12_0_i_qa_d(31
            DOWNTO 0)), STD_LOGIC_VECTOR'( butterFly_f1_butterFly_f1_nor_itm_1 &
            butterFly_f1_butterFly_f1_and_nl & butterFly_f1_butterFly_f1_and_1_nl
            & butterFly_f1_butterFly_f1_and_2_itm_1 & butterFly_f1_butterFly_f1_and_3_nl
            & butterFly_f1_butterFly_f1_and_4_itm_1 & butterFly_f1_butterFly_f1_and_5_itm_1
            & butterFly_f1_butterFly_f1_and_6_itm_1 & butterFly_f1_butterFly_f1_and_7_nl
            & butterFly_f1_butterFly_f1_and_8_itm_1 & butterFly_f1_butterFly_f1_and_9_itm_1
            & butterFly_f1_butterFly_f1_and_10_itm_1 & butterFly_f1_butterFly_f1_and_11_itm_1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_j_or_cse = '0' ) THEN
        for_i_slc_for_i_12_0_11_0_1_itm_1 <= MUX_v_12_2_2(butterFly_idx2_15_0_sva_2_11_0,
            (z_out_1(11 DOWNTO 0)), fsm_output(2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP_stage_0_1 <= '0';
      ELSIF ( ((fsm_output(0)) OR (fsm_output(1)) OR (fsm_output(5)) OR (fsm_output(2)))
          = '1' ) THEN
        INNER_LOOP_stage_0_1 <= (INNER_LOOP_stage_0 AND (NOT (fsm_output(0)))) OR
            (fsm_output(2));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(5)) OR (fsm_output(1)) OR (fsm_output(2)) OR (fsm_output(7))
          OR (fsm_output(0)) OR (fsm_output(6))) = '1' ) THEN
        butterFly_idx2_15_0_sva_2_11_0 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"),
            for_i_for_i_mux_1_nl, INNER_LOOP_nor_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(6)) OR (fsm_output(1))) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), z_out, fsm_output(6));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        modulo_add_qr_lpi_3_dfm_1 <= modulo_add_qr_lpi_3_dfm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_idx1_acc_psp_sva_2_10_0 <= INNER_LOOP_idx1_acc_psp_sva_1_10_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_k_15_0_sva_2_0 <= INNER_LOOP_k_15_0_sva_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        butterFly_acc_itm_2 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        butterFly_acc_itm_2 <= butterFly_acc_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_stage_0_1 = '1' ) THEN
        INNER_LOOP_idx1_mul_itm <= z_out_2(14 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        butterFly_f2_butterFly_f2_nor_itm_1 <= '0';
        butterFly_f2_acc_1_svs_1 <= STD_LOGIC_VECTOR'( "0000");
        butterFly_f2_nor_itm_1 <= '0';
        butterFly_f2_nor_1_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_2_itm_1 <= '0';
        butterFly_f2_nor_3_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_4_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_5_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_6_itm_1 <= '0';
        butterFly_f2_nor_6_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_8_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_9_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_10_itm_1 <= '0';
        butterFly_f2_butterFly_f2_and_11_itm_1 <= '0';
        butterFly_f1_butterFly_f1_nor_itm_1 <= '0';
        butterFly_f1_acc_1_svs_1 <= STD_LOGIC_VECTOR'( "0000");
        butterFly_f1_nor_itm_1 <= '0';
        butterFly_f1_nor_1_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_2_itm_1 <= '0';
        butterFly_f1_nor_3_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_4_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_5_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_6_itm_1 <= '0';
        butterFly_f1_nor_6_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_8_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_9_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_10_itm_1 <= '0';
        butterFly_f1_butterFly_f1_and_11_itm_1 <= '0';
      ELSIF ( INNER_LOOP_stage_0_1 = '1' ) THEN
        butterFly_f2_butterFly_f2_nor_itm_1 <= NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp/=STD_LOGIC_VECTOR'("0000")));
        butterFly_f2_acc_1_svs_1 <= butterFly_f2_acc_1_tmp;
        butterFly_f2_nor_itm_1 <= NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp(3 DOWNTO
            1)/=STD_LOGIC_VECTOR'("000")));
        butterFly_f2_nor_1_itm_1 <= NOT((butterFly_f2_acc_1_tmp(3)) OR (butterFly_f2_acc_1_tmp(2))
            OR (butterFly_f2_acc_1_tmp(0)));
        butterFly_f2_butterFly_f2_and_2_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("0011"));
        butterFly_f2_nor_3_itm_1 <= NOT((butterFly_f2_acc_1_tmp(3)) OR (butterFly_f2_acc_1_tmp(1))
            OR (butterFly_f2_acc_1_tmp(0)));
        butterFly_f2_butterFly_f2_and_4_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("0101"));
        butterFly_f2_butterFly_f2_and_5_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("0110"));
        butterFly_f2_butterFly_f2_and_6_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("0111"));
        butterFly_f2_nor_6_itm_1 <= NOT(CONV_SL_1_1(butterFly_f2_acc_1_tmp(2 DOWNTO
            0)/=STD_LOGIC_VECTOR'("000")));
        butterFly_f2_butterFly_f2_and_8_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("1001"));
        butterFly_f2_butterFly_f2_and_9_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("1010"));
        butterFly_f2_butterFly_f2_and_10_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("1011"));
        butterFly_f2_butterFly_f2_and_11_itm_1 <= CONV_SL_1_1(butterFly_f2_acc_1_tmp=STD_LOGIC_VECTOR'("1100"));
        butterFly_f1_butterFly_f1_nor_itm_1 <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp/=STD_LOGIC_VECTOR'("0000")));
        butterFly_f1_acc_1_svs_1 <= butterFly_f1_acc_1_tmp;
        butterFly_f1_nor_itm_1 <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp(3 DOWNTO
            1)/=STD_LOGIC_VECTOR'("000")));
        butterFly_f1_nor_1_itm_1 <= NOT((butterFly_f1_acc_1_tmp(3)) OR (butterFly_f1_acc_1_tmp(2))
            OR (butterFly_f1_acc_1_tmp(0)));
        butterFly_f1_butterFly_f1_and_2_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("0011"));
        butterFly_f1_nor_3_itm_1 <= NOT((butterFly_f1_acc_1_tmp(3)) OR (butterFly_f1_acc_1_tmp(1))
            OR (butterFly_f1_acc_1_tmp(0)));
        butterFly_f1_butterFly_f1_and_4_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("0101"));
        butterFly_f1_butterFly_f1_and_5_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("0110"));
        butterFly_f1_butterFly_f1_and_6_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("0111"));
        butterFly_f1_nor_6_itm_1 <= NOT(CONV_SL_1_1(butterFly_f1_acc_1_tmp(2 DOWNTO
            0)/=STD_LOGIC_VECTOR'("000")));
        butterFly_f1_butterFly_f1_and_8_itm_1 <= (butterFly_f1_acc_1_tmp(3)) AND
            (butterFly_f1_acc_1_tmp(0)) AND butterFly_f1_nor_7_cse;
        butterFly_f1_butterFly_f1_and_9_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("1010"));
        butterFly_f1_butterFly_f1_and_10_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("1011"));
        butterFly_f1_butterFly_f1_and_11_itm_1 <= CONV_SL_1_1(butterFly_f1_acc_1_tmp=STD_LOGIC_VECTOR'("1100"));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((INNER_LOOP_stage_0_1 OR (NOT (fsm_output(3)))) AND CONV_SL_1_1(fsm_output(5
          DOWNTO 4)=STD_LOGIC_VECTOR'("00"))) = '1' ) THEN
        INNER_LOOP_j_11_0_sva_10_0 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
            (INNER_LOOP_j_11_0_sva_2(10 DOWNTO 0)), INNER_LOOP_j_or_cse);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_j_or_cse = '0' ) THEN
        operator_20_false_acc_psp_sva <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(NOT
            STAGE_LOOP_i_3_0_sva) + SIGNED'( "1101"), 4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        butterFly_acc_4_itm_2 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        butterFly_acc_4_itm_2 <= butterFly_acc_4_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        mult_z_mul_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(mult_t_mul_cmp_a_drv)
            * UNSIGNED(INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm_1)), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_tf_h_slc_twiddle_h_rsci_qa_d_31_0_itm_1 <= twiddle_h_rsci_qa_d(31
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_j_or_cse = '0' ) THEN
        operator_20_false_rshift_psp_sva <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP_stage_0_2 <= '0';
        INNER_LOOP_stage_0_3 <= '0';
      ELSIF ( INNER_LOOP_or_1_cse = '1' ) THEN
        INNER_LOOP_stage_0_2 <= INNER_LOOP_stage_0_1 AND (NOT (fsm_output(2)));
        INNER_LOOP_stage_0_3 <= INNER_LOOP_stage_0_2 AND (NOT (fsm_output(2)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_tf_slc_twiddle_rsci_qa_d_31_0_itm_1 <= twiddle_rsci_qa_d(31 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        butterFly_acc_4_itm_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        butterFly_acc_4_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly_idx2_15_0_sva_1(15
            DOWNTO 12)) + UNSIGNED(STAGE_LOOP_i_3_0_sva) + UNSIGNED'( "0001"), 4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        butterFly_acc_itm_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        butterFly_acc_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_idx1_acc_psp_sva_1(14
            DOWNTO 11)) + UNSIGNED(STAGE_LOOP_i_3_0_sva) + UNSIGNED'( "0001"), 4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        butterFly_idx2_15_0_sva_1_11_0 <= butterFly_idx2_15_0_sva_1(11 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_idx1_acc_psp_sva_1_10_0 <= INNER_LOOP_idx1_acc_psp_sva_1(10 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(5)) = '1' ) THEN
        INNER_LOOP_k_15_0_sva_1_0 <= INNER_LOOP_k_15_0_sva(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP_stage_0_3 = '1' ) THEN
        mult_z_mul_itm <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(4)) = '0' ) THEN
        INNER_LOOP_k_15_0_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_j_11_0_sva_10_0),
            11), 16) - UNSIGNED(z_out_1), 16));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (mux_3_nl AND INNER_LOOP_stage_0_3) = '1' ) THEN
        mult_res_lpi_3_dfm <= mult_res_lpi_3_dfm_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((CONV_SL_1_1(butterFly_acc_itm_1(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("11"))
          OR (NOT(CONV_SL_1_1(butterFly_acc_itm_1(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")))))
          AND INNER_LOOP_stage_0_2) = '1' ) THEN
        modulo_add_qr_lpi_3_dfm <= MUX_v_32_2_2(modulo_add_base_sva_1, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_qif_acc_nl),
            32)), modulo_add_acc_1_nl(32));
      END IF;
    END IF;
  END PROCESS;
  INNER_LOOP_INNER_LOOP_and_nl <= INNER_LOOP_stage_0 AND (NOT (for_i_12_0_sva_2(12)));
  or_225_nl <= ((NOT(INNER_LOOP_stage_0_1 AND (INNER_LOOP_j_11_0_sva_2(11)))) AND
      (fsm_output(3))) OR CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  butterFly_mux_nl <= MUX_s_1_2_2(INNER_LOOP_INNER_LOOP_and_nl, INNER_LOOP_stage_0,
      or_225_nl);
  mult_res_and_nl <= butterFly_f2_butterFly_f2_nor_itm_1 AND (NOT (fsm_output(5)));
  butterFly_f2_butterFly_f2_and_nl <= (butterFly_f2_acc_1_svs_1(0)) AND butterFly_f2_nor_itm_1
      AND (NOT (fsm_output(5)));
  butterFly_f2_butterFly_f2_and_1_nl <= (butterFly_f2_acc_1_svs_1(1)) AND butterFly_f2_nor_1_itm_1
      AND (NOT (fsm_output(5)));
  mult_res_and_1_nl <= butterFly_f2_butterFly_f2_and_2_itm_1 AND (NOT (fsm_output(5)));
  butterFly_f2_butterFly_f2_and_3_nl <= (butterFly_f2_acc_1_svs_1(2)) AND butterFly_f2_nor_3_itm_1
      AND (NOT (fsm_output(5)));
  mult_res_and_2_nl <= butterFly_f2_butterFly_f2_and_4_itm_1 AND (NOT (fsm_output(5)));
  mult_res_and_3_nl <= butterFly_f2_butterFly_f2_and_5_itm_1 AND (NOT (fsm_output(5)));
  mult_res_and_4_nl <= butterFly_f2_butterFly_f2_and_6_itm_1 AND (NOT (fsm_output(5)));
  butterFly_f2_butterFly_f2_and_7_nl <= (butterFly_f2_acc_1_svs_1(3)) AND butterFly_f2_nor_6_itm_1
      AND (NOT (fsm_output(5)));
  mult_res_and_5_nl <= butterFly_f2_butterFly_f2_and_8_itm_1 AND (NOT (fsm_output(5)));
  mult_res_and_6_nl <= butterFly_f2_butterFly_f2_and_9_itm_1 AND (NOT (fsm_output(5)));
  mult_res_and_7_nl <= butterFly_f2_butterFly_f2_and_10_itm_1 AND (NOT (fsm_output(5)));
  mult_res_and_8_nl <= butterFly_f2_butterFly_f2_and_11_itm_1 AND (NOT (fsm_output(5)));
  modulo_sub_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & (modulo_sub_base_sva_1(30
      DOWNTO 0))) + UNSIGNED(p_sva), 32));
  butterFly_f1_butterFly_f1_and_nl <= (butterFly_f1_acc_1_svs_1(0)) AND butterFly_f1_nor_itm_1;
  butterFly_f1_butterFly_f1_and_1_nl <= (butterFly_f1_acc_1_svs_1(1)) AND butterFly_f1_nor_1_itm_1;
  butterFly_f1_butterFly_f1_and_3_nl <= (butterFly_f1_acc_1_svs_1(2)) AND butterFly_f1_nor_3_itm_1;
  butterFly_f1_butterFly_f1_and_7_nl <= (butterFly_f1_acc_1_svs_1(3)) AND butterFly_f1_nor_6_itm_1;
  for_i_for_i_mux_1_nl <= MUX_v_12_2_2((for_i_12_0_sva_2(11 DOWNTO 0)), butterFly_idx2_15_0_sva_1_11_0,
      fsm_output(5));
  INNER_LOOP_nor_nl <= NOT(or_dcpl_73 OR or_dcpl_72);
  mux_2_nl <= MUX_s_1_2_2((NOT (butterFly_acc_4_itm_2(3))), (butterFly_acc_4_itm_2(3)),
      butterFly_acc_4_itm_2(2));
  nor_9_nl <= NOT(CONV_SL_1_1(butterFly_acc_4_itm_2(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")));
  or_265_nl <= CONV_SL_1_1(butterFly_acc_4_itm_2(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_3_nl <= MUX_s_1_2_2(mux_2_nl, nor_9_nl, or_265_nl);
  modulo_add_qif_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_base_sva_1)
      - UNSIGNED(p_sva), 32));
  modulo_add_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT
      modulo_add_base_sva_1), 32), 33) + UNSIGNED'( "000000000000000000000000000000001"),
      33));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva) + CONV_UNSIGNED(CONV_SIGNED(SIGNED'(
      (NOT (fsm_output(6))) & '1'), 2), 4), 4));
  mult_z_mux_2_nl <= MUX_v_32_2_2(mult_t_mul_cmp_z_oreg, (STD_LOGIC_VECTOR'( "000000000000000000000")
      & (butterFly_idx2_15_0_sva_3_11_0(10 DOWNTO 0))), fsm_output(4));
  mult_z_mux_3_nl <= MUX_v_32_2_2(p_sva, (STD_LOGIC_VECTOR'( "00000000000000000000")
      & operator_20_false_rshift_psp_sva), fsm_output(4));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(mult_z_mux_2_nl)
      * UNSIGNED(mult_z_mux_3_nl)), 32));
END v11;

-- ------------------------------------------------------------------
--  Design Unit:    ntt_flat
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY ntt_flat IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_wea : OUT STD_LOGIC;
    vec_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    vec_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_web : OUT STD_LOGIC;
    vec_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_wea : OUT STD_LOGIC;
    twiddle_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_web : OUT STD_LOGIC;
    twiddle_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_wea : OUT STD_LOGIC;
    twiddle_h_rsc_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    twiddle_h_rsc_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_web : OUT STD_LOGIC;
    twiddle_h_rsc_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_0_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_0_0_wea : OUT STD_LOGIC;
    result_rsc_0_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_0_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_0_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_0_0_web : OUT STD_LOGIC;
    result_rsc_0_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    result_rsc_1_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_1_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_1_0_wea : OUT STD_LOGIC;
    result_rsc_1_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_1_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_1_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_1_0_web : OUT STD_LOGIC;
    result_rsc_1_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_1_0_lz : OUT STD_LOGIC;
    result_rsc_2_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_2_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_2_0_wea : OUT STD_LOGIC;
    result_rsc_2_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_2_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_2_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_2_0_web : OUT STD_LOGIC;
    result_rsc_2_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_2_0_lz : OUT STD_LOGIC;
    result_rsc_3_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_3_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_3_0_wea : OUT STD_LOGIC;
    result_rsc_3_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_3_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_3_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_3_0_web : OUT STD_LOGIC;
    result_rsc_3_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_3_0_lz : OUT STD_LOGIC;
    result_rsc_4_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_4_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_4_0_wea : OUT STD_LOGIC;
    result_rsc_4_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_4_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_4_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_4_0_web : OUT STD_LOGIC;
    result_rsc_4_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_4_0_lz : OUT STD_LOGIC;
    result_rsc_5_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_5_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_5_0_wea : OUT STD_LOGIC;
    result_rsc_5_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_5_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_5_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_5_0_web : OUT STD_LOGIC;
    result_rsc_5_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_5_0_lz : OUT STD_LOGIC;
    result_rsc_6_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_6_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_6_0_wea : OUT STD_LOGIC;
    result_rsc_6_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_6_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_6_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_6_0_web : OUT STD_LOGIC;
    result_rsc_6_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_6_0_lz : OUT STD_LOGIC;
    result_rsc_7_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_7_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_7_0_wea : OUT STD_LOGIC;
    result_rsc_7_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_7_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_7_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_7_0_web : OUT STD_LOGIC;
    result_rsc_7_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_7_0_lz : OUT STD_LOGIC;
    result_rsc_8_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_8_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_8_0_wea : OUT STD_LOGIC;
    result_rsc_8_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_8_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_8_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_8_0_web : OUT STD_LOGIC;
    result_rsc_8_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_8_0_lz : OUT STD_LOGIC;
    result_rsc_9_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_9_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_9_0_wea : OUT STD_LOGIC;
    result_rsc_9_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_9_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_9_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_9_0_web : OUT STD_LOGIC;
    result_rsc_9_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_9_0_lz : OUT STD_LOGIC;
    result_rsc_10_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_10_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_10_0_wea : OUT STD_LOGIC;
    result_rsc_10_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_10_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_10_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_10_0_web : OUT STD_LOGIC;
    result_rsc_10_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_10_0_lz : OUT STD_LOGIC;
    result_rsc_11_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_11_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_11_0_wea : OUT STD_LOGIC;
    result_rsc_11_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_11_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_11_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_11_0_web : OUT STD_LOGIC;
    result_rsc_11_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_11_0_lz : OUT STD_LOGIC;
    result_rsc_12_0_adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_12_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_12_0_wea : OUT STD_LOGIC;
    result_rsc_12_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_12_0_adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
    result_rsc_12_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_12_0_web : OUT STD_LOGIC;
    result_rsc_12_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    result_rsc_triosy_12_0_lz : OUT STD_LOGIC
  );
END ntt_flat;

ARCHITECTURE v11 OF ntt_flat IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_adra_d : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL result_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_1_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_2_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_3_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_4_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_5_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_6_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_7_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_8_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_9_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_10_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_11_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_12_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d_iff : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_da_d_iff : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_da_d_iff : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL vec_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL vec_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL vec_rsci_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL vec_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_rsci_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsci_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL twiddle_h_rsci_adra_d : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL twiddle_h_rsci_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_h_rsci_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_0_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_1_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_2_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_3_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_4_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_5_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_6_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_7_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_8_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_9_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);
  SIGNAL result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1
      DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_10_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_11_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

  COMPONENT ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (23 DOWNTO 0);
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL result_rsc_12_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_adrb : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_adra : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_adra_d_1 : STD_LOGIC_VECTOR (23 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR
      (1 DOWNTO 0);

  COMPONENT ntt_flat_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_1_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_2_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_3_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_4_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_5_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_6_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_7_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_8_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_9_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_10_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_11_0_lz : OUT STD_LOGIC;
      result_rsc_triosy_12_0_lz : OUT STD_LOGIC;
      vec_rsci_adra_d : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      vec_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_h_rsci_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      result_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      result_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_1_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_1_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_1_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_2_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_2_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_2_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_3_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_3_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_3_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_4_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_4_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_4_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_5_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_5_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_5_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_6_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_6_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_6_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_7_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_7_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_7_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_8_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_8_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_8_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_9_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_9_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_9_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_10_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_10_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_10_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_11_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_11_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_11_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_12_0_i_adra_d : OUT STD_LOGIC_VECTOR (23 DOWNTO 0);
      result_rsc_12_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsc_12_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1
          DOWNTO 0);
      mult_t_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_t_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (51 DOWNTO 0);
      twiddle_rsci_adra_d_pff : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
      result_rsc_1_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      result_rsc_9_0_i_da_d_pff : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL ntt_flat_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_vec_rsci_adra_d : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_vec_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_twiddle_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_twiddle_h_rsci_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_2_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_2_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_2_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_3_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_3_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_3_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_4_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_4_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_4_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_5_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_5_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_5_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_6_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_6_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_6_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_7_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_7_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_7_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_8_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_8_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_8_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_10_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_10_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_10_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_11_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_11_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_11_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_12_0_i_adra_d : STD_LOGIC_VECTOR (23 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_12_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_12_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d :
      STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_mult_t_mul_cmp_z : STD_LOGIC_VECTOR (51 DOWNTO 0);
  SIGNAL ntt_flat_core_inst_twiddle_rsci_adra_d_pff : STD_LOGIC_VECTOR (11 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_1_0_i_da_d_pff : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL ntt_flat_core_inst_result_rsc_9_0_i_da_d_pff : STD_LOGIC_VECTOR (31 DOWNTO
      0);

BEGIN
  vec_rsci : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_1_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => vec_rsci_qb,
      web => vec_rsc_web,
      db => vec_rsci_db,
      adrb => vec_rsci_adrb,
      qa => vec_rsci_qa,
      wea => vec_rsc_wea,
      da => vec_rsci_da,
      adra => vec_rsci_adra,
      adra_d => vec_rsci_adra_d_1,
      da_d => vec_rsci_da_d,
      qa_d => vec_rsci_qa_d_1,
      wea_d => vec_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  vec_rsci_qb <= vec_rsc_qb;
  vec_rsc_db <= vec_rsci_db;
  vec_rsc_adrb <= vec_rsci_adrb;
  vec_rsci_qa <= vec_rsc_qa;
  vec_rsc_da <= vec_rsci_da;
  vec_rsc_adra <= vec_rsci_adra;
  vec_rsci_adra_d_1 <= STD_LOGIC_VECTOR'( "000000000000") & vec_rsci_adra_d;
  vec_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  vec_rsci_qa_d <= vec_rsci_qa_d_1;
  vec_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  twiddle_rsci : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_4_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => twiddle_rsci_qb,
      web => twiddle_rsc_web,
      db => twiddle_rsci_db,
      adrb => twiddle_rsci_adrb,
      qa => twiddle_rsci_qa,
      wea => twiddle_rsc_wea,
      da => twiddle_rsci_da,
      adra => twiddle_rsci_adra,
      adra_d => twiddle_rsci_adra_d,
      da_d => twiddle_rsci_da_d,
      qa_d => twiddle_rsci_qa_d_1,
      wea_d => twiddle_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  twiddle_rsci_qb <= twiddle_rsc_qb;
  twiddle_rsc_db <= twiddle_rsci_db;
  twiddle_rsc_adrb <= twiddle_rsci_adrb;
  twiddle_rsci_qa <= twiddle_rsc_qa;
  twiddle_rsc_da <= twiddle_rsci_da;
  twiddle_rsc_adra <= twiddle_rsci_adra;
  twiddle_rsci_adra_d <= STD_LOGIC_VECTOR'( "000000000000") & twiddle_rsci_adra_d_iff;
  twiddle_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_rsci_qa_d <= twiddle_rsci_qa_d_1;
  twiddle_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  twiddle_h_rsci : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_5_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => twiddle_h_rsci_qb,
      web => twiddle_h_rsc_web,
      db => twiddle_h_rsci_db,
      adrb => twiddle_h_rsci_adrb,
      qa => twiddle_h_rsci_qa,
      wea => twiddle_h_rsc_wea,
      da => twiddle_h_rsci_da,
      adra => twiddle_h_rsci_adra,
      adra_d => twiddle_h_rsci_adra_d,
      da_d => twiddle_h_rsci_da_d,
      qa_d => twiddle_h_rsci_qa_d_1,
      wea_d => twiddle_h_rsci_wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d => twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d
    );
  twiddle_h_rsci_qb <= twiddle_h_rsc_qb;
  twiddle_h_rsc_db <= twiddle_h_rsci_db;
  twiddle_h_rsc_adrb <= twiddle_h_rsci_adrb;
  twiddle_h_rsci_qa <= twiddle_h_rsc_qa;
  twiddle_h_rsc_da <= twiddle_h_rsci_da;
  twiddle_h_rsc_adra <= twiddle_h_rsci_adra;
  twiddle_h_rsci_adra_d <= STD_LOGIC_VECTOR'( "000000000000") & twiddle_rsci_adra_d_iff;
  twiddle_h_rsci_da_d <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
  twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d_1;
  twiddle_h_rsci_wea_d <= STD_LOGIC_VECTOR'( "00");
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( "00");

  result_rsc_0_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_7_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_0_0_i_qb,
      web => result_rsc_0_0_web,
      db => result_rsc_0_0_i_db,
      adrb => result_rsc_0_0_i_adrb,
      qa => result_rsc_0_0_i_qa,
      wea => result_rsc_0_0_wea,
      da => result_rsc_0_0_i_da,
      adra => result_rsc_0_0_i_adra,
      adra_d => result_rsc_0_0_i_adra_d_1,
      da_d => result_rsc_0_0_i_da_d_1,
      qa_d => result_rsc_0_0_i_qa_d_1,
      wea_d => result_rsc_0_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_0_0_i_qb <= result_rsc_0_0_qb;
  result_rsc_0_0_db <= result_rsc_0_0_i_db;
  result_rsc_0_0_adrb <= result_rsc_0_0_i_adrb;
  result_rsc_0_0_i_qa <= result_rsc_0_0_qa;
  result_rsc_0_0_da <= result_rsc_0_0_i_da;
  result_rsc_0_0_adra <= result_rsc_0_0_i_adra;
  result_rsc_0_0_i_adra_d_1 <= result_rsc_0_0_i_adra_d;
  result_rsc_0_0_i_da_d_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_0_0_i_da_d;
  result_rsc_0_0_i_qa_d <= result_rsc_0_0_i_qa_d_1;
  result_rsc_0_0_i_wea_d_1 <= result_rsc_0_0_i_wea_d;
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_1_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_8_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_1_0_i_qb,
      web => result_rsc_1_0_web,
      db => result_rsc_1_0_i_db,
      adrb => result_rsc_1_0_i_adrb,
      qa => result_rsc_1_0_i_qa,
      wea => result_rsc_1_0_wea,
      da => result_rsc_1_0_i_da,
      adra => result_rsc_1_0_i_adra,
      adra_d => result_rsc_1_0_i_adra_d_1,
      da_d => result_rsc_1_0_i_da_d,
      qa_d => result_rsc_1_0_i_qa_d_1,
      wea_d => result_rsc_1_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_1_0_i_qb <= result_rsc_1_0_qb;
  result_rsc_1_0_db <= result_rsc_1_0_i_db;
  result_rsc_1_0_adrb <= result_rsc_1_0_i_adrb;
  result_rsc_1_0_i_qa <= result_rsc_1_0_qa;
  result_rsc_1_0_da <= result_rsc_1_0_i_da;
  result_rsc_1_0_adra <= result_rsc_1_0_i_adra;
  result_rsc_1_0_i_adra_d_1 <= result_rsc_1_0_i_adra_d;
  result_rsc_1_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_1_0_i_qa_d <= result_rsc_1_0_i_qa_d_1;
  result_rsc_1_0_i_wea_d_1 <= result_rsc_1_0_i_wea_d;
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_2_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_9_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_2_0_i_qb,
      web => result_rsc_2_0_web,
      db => result_rsc_2_0_i_db,
      adrb => result_rsc_2_0_i_adrb,
      qa => result_rsc_2_0_i_qa,
      wea => result_rsc_2_0_wea,
      da => result_rsc_2_0_i_da,
      adra => result_rsc_2_0_i_adra,
      adra_d => result_rsc_2_0_i_adra_d_1,
      da_d => result_rsc_2_0_i_da_d,
      qa_d => result_rsc_2_0_i_qa_d_1,
      wea_d => result_rsc_2_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_2_0_i_qb <= result_rsc_2_0_qb;
  result_rsc_2_0_db <= result_rsc_2_0_i_db;
  result_rsc_2_0_adrb <= result_rsc_2_0_i_adrb;
  result_rsc_2_0_i_qa <= result_rsc_2_0_qa;
  result_rsc_2_0_da <= result_rsc_2_0_i_da;
  result_rsc_2_0_adra <= result_rsc_2_0_i_adra;
  result_rsc_2_0_i_adra_d_1 <= result_rsc_2_0_i_adra_d;
  result_rsc_2_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_2_0_i_qa_d <= result_rsc_2_0_i_qa_d_1;
  result_rsc_2_0_i_wea_d_1 <= result_rsc_2_0_i_wea_d;
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_3_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_10_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_3_0_i_qb,
      web => result_rsc_3_0_web,
      db => result_rsc_3_0_i_db,
      adrb => result_rsc_3_0_i_adrb,
      qa => result_rsc_3_0_i_qa,
      wea => result_rsc_3_0_wea,
      da => result_rsc_3_0_i_da,
      adra => result_rsc_3_0_i_adra,
      adra_d => result_rsc_3_0_i_adra_d_1,
      da_d => result_rsc_3_0_i_da_d,
      qa_d => result_rsc_3_0_i_qa_d_1,
      wea_d => result_rsc_3_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_3_0_i_qb <= result_rsc_3_0_qb;
  result_rsc_3_0_db <= result_rsc_3_0_i_db;
  result_rsc_3_0_adrb <= result_rsc_3_0_i_adrb;
  result_rsc_3_0_i_qa <= result_rsc_3_0_qa;
  result_rsc_3_0_da <= result_rsc_3_0_i_da;
  result_rsc_3_0_adra <= result_rsc_3_0_i_adra;
  result_rsc_3_0_i_adra_d_1 <= result_rsc_3_0_i_adra_d;
  result_rsc_3_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_3_0_i_qa_d <= result_rsc_3_0_i_qa_d_1;
  result_rsc_3_0_i_wea_d_1 <= result_rsc_3_0_i_wea_d;
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_4_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_11_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_4_0_i_qb,
      web => result_rsc_4_0_web,
      db => result_rsc_4_0_i_db,
      adrb => result_rsc_4_0_i_adrb,
      qa => result_rsc_4_0_i_qa,
      wea => result_rsc_4_0_wea,
      da => result_rsc_4_0_i_da,
      adra => result_rsc_4_0_i_adra,
      adra_d => result_rsc_4_0_i_adra_d_1,
      da_d => result_rsc_4_0_i_da_d,
      qa_d => result_rsc_4_0_i_qa_d_1,
      wea_d => result_rsc_4_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_4_0_i_qb <= result_rsc_4_0_qb;
  result_rsc_4_0_db <= result_rsc_4_0_i_db;
  result_rsc_4_0_adrb <= result_rsc_4_0_i_adrb;
  result_rsc_4_0_i_qa <= result_rsc_4_0_qa;
  result_rsc_4_0_da <= result_rsc_4_0_i_da;
  result_rsc_4_0_adra <= result_rsc_4_0_i_adra;
  result_rsc_4_0_i_adra_d_1 <= result_rsc_4_0_i_adra_d;
  result_rsc_4_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_4_0_i_qa_d <= result_rsc_4_0_i_qa_d_1;
  result_rsc_4_0_i_wea_d_1 <= result_rsc_4_0_i_wea_d;
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_5_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_12_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_5_0_i_qb,
      web => result_rsc_5_0_web,
      db => result_rsc_5_0_i_db,
      adrb => result_rsc_5_0_i_adrb,
      qa => result_rsc_5_0_i_qa,
      wea => result_rsc_5_0_wea,
      da => result_rsc_5_0_i_da,
      adra => result_rsc_5_0_i_adra,
      adra_d => result_rsc_5_0_i_adra_d_1,
      da_d => result_rsc_5_0_i_da_d,
      qa_d => result_rsc_5_0_i_qa_d_1,
      wea_d => result_rsc_5_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_5_0_i_qb <= result_rsc_5_0_qb;
  result_rsc_5_0_db <= result_rsc_5_0_i_db;
  result_rsc_5_0_adrb <= result_rsc_5_0_i_adrb;
  result_rsc_5_0_i_qa <= result_rsc_5_0_qa;
  result_rsc_5_0_da <= result_rsc_5_0_i_da;
  result_rsc_5_0_adra <= result_rsc_5_0_i_adra;
  result_rsc_5_0_i_adra_d_1 <= result_rsc_5_0_i_adra_d;
  result_rsc_5_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_5_0_i_qa_d <= result_rsc_5_0_i_qa_d_1;
  result_rsc_5_0_i_wea_d_1 <= result_rsc_5_0_i_wea_d;
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_6_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_13_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_6_0_i_qb,
      web => result_rsc_6_0_web,
      db => result_rsc_6_0_i_db,
      adrb => result_rsc_6_0_i_adrb,
      qa => result_rsc_6_0_i_qa,
      wea => result_rsc_6_0_wea,
      da => result_rsc_6_0_i_da,
      adra => result_rsc_6_0_i_adra,
      adra_d => result_rsc_6_0_i_adra_d_1,
      da_d => result_rsc_6_0_i_da_d,
      qa_d => result_rsc_6_0_i_qa_d_1,
      wea_d => result_rsc_6_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_6_0_i_qb <= result_rsc_6_0_qb;
  result_rsc_6_0_db <= result_rsc_6_0_i_db;
  result_rsc_6_0_adrb <= result_rsc_6_0_i_adrb;
  result_rsc_6_0_i_qa <= result_rsc_6_0_qa;
  result_rsc_6_0_da <= result_rsc_6_0_i_da;
  result_rsc_6_0_adra <= result_rsc_6_0_i_adra;
  result_rsc_6_0_i_adra_d_1 <= result_rsc_6_0_i_adra_d;
  result_rsc_6_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_6_0_i_qa_d <= result_rsc_6_0_i_qa_d_1;
  result_rsc_6_0_i_wea_d_1 <= result_rsc_6_0_i_wea_d;
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_7_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_14_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_7_0_i_qb,
      web => result_rsc_7_0_web,
      db => result_rsc_7_0_i_db,
      adrb => result_rsc_7_0_i_adrb,
      qa => result_rsc_7_0_i_qa,
      wea => result_rsc_7_0_wea,
      da => result_rsc_7_0_i_da,
      adra => result_rsc_7_0_i_adra,
      adra_d => result_rsc_7_0_i_adra_d_1,
      da_d => result_rsc_7_0_i_da_d,
      qa_d => result_rsc_7_0_i_qa_d_1,
      wea_d => result_rsc_7_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_7_0_i_qb <= result_rsc_7_0_qb;
  result_rsc_7_0_db <= result_rsc_7_0_i_db;
  result_rsc_7_0_adrb <= result_rsc_7_0_i_adrb;
  result_rsc_7_0_i_qa <= result_rsc_7_0_qa;
  result_rsc_7_0_da <= result_rsc_7_0_i_da;
  result_rsc_7_0_adra <= result_rsc_7_0_i_adra;
  result_rsc_7_0_i_adra_d_1 <= result_rsc_7_0_i_adra_d;
  result_rsc_7_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_7_0_i_qa_d <= result_rsc_7_0_i_qa_d_1;
  result_rsc_7_0_i_wea_d_1 <= result_rsc_7_0_i_wea_d;
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_8_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_15_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_8_0_i_qb,
      web => result_rsc_8_0_web,
      db => result_rsc_8_0_i_db,
      adrb => result_rsc_8_0_i_adrb,
      qa => result_rsc_8_0_i_qa,
      wea => result_rsc_8_0_wea,
      da => result_rsc_8_0_i_da,
      adra => result_rsc_8_0_i_adra,
      adra_d => result_rsc_8_0_i_adra_d_1,
      da_d => result_rsc_8_0_i_da_d,
      qa_d => result_rsc_8_0_i_qa_d_1,
      wea_d => result_rsc_8_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_8_0_i_qb <= result_rsc_8_0_qb;
  result_rsc_8_0_db <= result_rsc_8_0_i_db;
  result_rsc_8_0_adrb <= result_rsc_8_0_i_adrb;
  result_rsc_8_0_i_qa <= result_rsc_8_0_qa;
  result_rsc_8_0_da <= result_rsc_8_0_i_da;
  result_rsc_8_0_adra <= result_rsc_8_0_i_adra;
  result_rsc_8_0_i_adra_d_1 <= result_rsc_8_0_i_adra_d;
  result_rsc_8_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_1_0_i_da_d_iff;
  result_rsc_8_0_i_qa_d <= result_rsc_8_0_i_qa_d_1;
  result_rsc_8_0_i_wea_d_1 <= result_rsc_8_0_i_wea_d;
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_9_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_16_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_9_0_i_qb,
      web => result_rsc_9_0_web,
      db => result_rsc_9_0_i_db,
      adrb => result_rsc_9_0_i_adrb,
      qa => result_rsc_9_0_i_qa,
      wea => result_rsc_9_0_wea,
      da => result_rsc_9_0_i_da,
      adra => result_rsc_9_0_i_adra,
      adra_d => result_rsc_9_0_i_adra_d_1,
      da_d => result_rsc_9_0_i_da_d,
      qa_d => result_rsc_9_0_i_qa_d_1,
      wea_d => result_rsc_9_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_9_0_i_qb <= result_rsc_9_0_qb;
  result_rsc_9_0_db <= result_rsc_9_0_i_db;
  result_rsc_9_0_adrb <= result_rsc_9_0_i_adrb;
  result_rsc_9_0_i_qa <= result_rsc_9_0_qa;
  result_rsc_9_0_da <= result_rsc_9_0_i_da;
  result_rsc_9_0_adra <= result_rsc_9_0_i_adra;
  result_rsc_9_0_i_adra_d_1 <= result_rsc_9_0_i_adra_d;
  result_rsc_9_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_9_0_i_da_d_iff;
  result_rsc_9_0_i_qa_d <= result_rsc_9_0_i_qa_d_1;
  result_rsc_9_0_i_wea_d_1 <= result_rsc_9_0_i_wea_d;
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_10_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_17_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_10_0_i_qb,
      web => result_rsc_10_0_web,
      db => result_rsc_10_0_i_db,
      adrb => result_rsc_10_0_i_adrb,
      qa => result_rsc_10_0_i_qa,
      wea => result_rsc_10_0_wea,
      da => result_rsc_10_0_i_da,
      adra => result_rsc_10_0_i_adra,
      adra_d => result_rsc_10_0_i_adra_d_1,
      da_d => result_rsc_10_0_i_da_d,
      qa_d => result_rsc_10_0_i_qa_d_1,
      wea_d => result_rsc_10_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_10_0_i_qb <= result_rsc_10_0_qb;
  result_rsc_10_0_db <= result_rsc_10_0_i_db;
  result_rsc_10_0_adrb <= result_rsc_10_0_i_adrb;
  result_rsc_10_0_i_qa <= result_rsc_10_0_qa;
  result_rsc_10_0_da <= result_rsc_10_0_i_da;
  result_rsc_10_0_adra <= result_rsc_10_0_i_adra;
  result_rsc_10_0_i_adra_d_1 <= result_rsc_10_0_i_adra_d;
  result_rsc_10_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_9_0_i_da_d_iff;
  result_rsc_10_0_i_qa_d <= result_rsc_10_0_i_qa_d_1;
  result_rsc_10_0_i_wea_d_1 <= result_rsc_10_0_i_wea_d;
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_11_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_18_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_11_0_i_qb,
      web => result_rsc_11_0_web,
      db => result_rsc_11_0_i_db,
      adrb => result_rsc_11_0_i_adrb,
      qa => result_rsc_11_0_i_qa,
      wea => result_rsc_11_0_wea,
      da => result_rsc_11_0_i_da,
      adra => result_rsc_11_0_i_adra,
      adra_d => result_rsc_11_0_i_adra_d_1,
      da_d => result_rsc_11_0_i_da_d,
      qa_d => result_rsc_11_0_i_qa_d_1,
      wea_d => result_rsc_11_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_11_0_i_qb <= result_rsc_11_0_qb;
  result_rsc_11_0_db <= result_rsc_11_0_i_db;
  result_rsc_11_0_adrb <= result_rsc_11_0_i_adrb;
  result_rsc_11_0_i_qa <= result_rsc_11_0_qa;
  result_rsc_11_0_da <= result_rsc_11_0_i_da;
  result_rsc_11_0_adra <= result_rsc_11_0_i_adra;
  result_rsc_11_0_i_adra_d_1 <= result_rsc_11_0_i_adra_d;
  result_rsc_11_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_9_0_i_da_d_iff;
  result_rsc_11_0_i_qa_d <= result_rsc_11_0_i_qa_d_1;
  result_rsc_11_0_i_wea_d_1 <= result_rsc_11_0_i_wea_d;
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  result_rsc_12_0_i : ntt_flat_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_19_12_32_4096_4096_32_1_gen
    PORT MAP(
      qb => result_rsc_12_0_i_qb,
      web => result_rsc_12_0_web,
      db => result_rsc_12_0_i_db,
      adrb => result_rsc_12_0_i_adrb,
      qa => result_rsc_12_0_i_qa,
      wea => result_rsc_12_0_wea,
      da => result_rsc_12_0_i_da,
      adra => result_rsc_12_0_i_adra,
      adra_d => result_rsc_12_0_i_adra_d_1,
      da_d => result_rsc_12_0_i_da_d,
      qa_d => result_rsc_12_0_i_qa_d_1,
      wea_d => result_rsc_12_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  result_rsc_12_0_i_qb <= result_rsc_12_0_qb;
  result_rsc_12_0_db <= result_rsc_12_0_i_db;
  result_rsc_12_0_adrb <= result_rsc_12_0_i_adrb;
  result_rsc_12_0_i_qa <= result_rsc_12_0_qa;
  result_rsc_12_0_da <= result_rsc_12_0_i_da;
  result_rsc_12_0_adra <= result_rsc_12_0_i_adra;
  result_rsc_12_0_i_adra_d_1 <= result_rsc_12_0_i_adra_d;
  result_rsc_12_0_i_da_d <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000")
      & result_rsc_9_0_i_da_d_iff;
  result_rsc_12_0_i_qa_d <= result_rsc_12_0_i_qa_d_1;
  result_rsc_12_0_i_wea_d_1 <= result_rsc_12_0_i_wea_d;
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  ntt_flat_core_inst : ntt_flat_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => ntt_flat_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      result_rsc_triosy_0_0_lz => result_rsc_triosy_0_0_lz,
      result_rsc_triosy_1_0_lz => result_rsc_triosy_1_0_lz,
      result_rsc_triosy_2_0_lz => result_rsc_triosy_2_0_lz,
      result_rsc_triosy_3_0_lz => result_rsc_triosy_3_0_lz,
      result_rsc_triosy_4_0_lz => result_rsc_triosy_4_0_lz,
      result_rsc_triosy_5_0_lz => result_rsc_triosy_5_0_lz,
      result_rsc_triosy_6_0_lz => result_rsc_triosy_6_0_lz,
      result_rsc_triosy_7_0_lz => result_rsc_triosy_7_0_lz,
      result_rsc_triosy_8_0_lz => result_rsc_triosy_8_0_lz,
      result_rsc_triosy_9_0_lz => result_rsc_triosy_9_0_lz,
      result_rsc_triosy_10_0_lz => result_rsc_triosy_10_0_lz,
      result_rsc_triosy_11_0_lz => result_rsc_triosy_11_0_lz,
      result_rsc_triosy_12_0_lz => result_rsc_triosy_12_0_lz,
      vec_rsci_adra_d => ntt_flat_core_inst_vec_rsci_adra_d,
      vec_rsci_qa_d => ntt_flat_core_inst_vec_rsci_qa_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_qa_d => ntt_flat_core_inst_twiddle_rsci_qa_d,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_qa_d => ntt_flat_core_inst_twiddle_h_rsci_qa_d,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_0_0_i_adra_d => ntt_flat_core_inst_result_rsc_0_0_i_adra_d,
      result_rsc_0_0_i_da_d => ntt_flat_core_inst_result_rsc_0_0_i_da_d,
      result_rsc_0_0_i_qa_d => ntt_flat_core_inst_result_rsc_0_0_i_qa_d,
      result_rsc_0_0_i_wea_d => ntt_flat_core_inst_result_rsc_0_0_i_wea_d,
      result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_1_0_i_adra_d => ntt_flat_core_inst_result_rsc_1_0_i_adra_d,
      result_rsc_1_0_i_qa_d => ntt_flat_core_inst_result_rsc_1_0_i_qa_d,
      result_rsc_1_0_i_wea_d => ntt_flat_core_inst_result_rsc_1_0_i_wea_d,
      result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_2_0_i_adra_d => ntt_flat_core_inst_result_rsc_2_0_i_adra_d,
      result_rsc_2_0_i_qa_d => ntt_flat_core_inst_result_rsc_2_0_i_qa_d,
      result_rsc_2_0_i_wea_d => ntt_flat_core_inst_result_rsc_2_0_i_wea_d,
      result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_3_0_i_adra_d => ntt_flat_core_inst_result_rsc_3_0_i_adra_d,
      result_rsc_3_0_i_qa_d => ntt_flat_core_inst_result_rsc_3_0_i_qa_d,
      result_rsc_3_0_i_wea_d => ntt_flat_core_inst_result_rsc_3_0_i_wea_d,
      result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_4_0_i_adra_d => ntt_flat_core_inst_result_rsc_4_0_i_adra_d,
      result_rsc_4_0_i_qa_d => ntt_flat_core_inst_result_rsc_4_0_i_qa_d,
      result_rsc_4_0_i_wea_d => ntt_flat_core_inst_result_rsc_4_0_i_wea_d,
      result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_5_0_i_adra_d => ntt_flat_core_inst_result_rsc_5_0_i_adra_d,
      result_rsc_5_0_i_qa_d => ntt_flat_core_inst_result_rsc_5_0_i_qa_d,
      result_rsc_5_0_i_wea_d => ntt_flat_core_inst_result_rsc_5_0_i_wea_d,
      result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_6_0_i_adra_d => ntt_flat_core_inst_result_rsc_6_0_i_adra_d,
      result_rsc_6_0_i_qa_d => ntt_flat_core_inst_result_rsc_6_0_i_qa_d,
      result_rsc_6_0_i_wea_d => ntt_flat_core_inst_result_rsc_6_0_i_wea_d,
      result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_7_0_i_adra_d => ntt_flat_core_inst_result_rsc_7_0_i_adra_d,
      result_rsc_7_0_i_qa_d => ntt_flat_core_inst_result_rsc_7_0_i_qa_d,
      result_rsc_7_0_i_wea_d => ntt_flat_core_inst_result_rsc_7_0_i_wea_d,
      result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_8_0_i_adra_d => ntt_flat_core_inst_result_rsc_8_0_i_adra_d,
      result_rsc_8_0_i_qa_d => ntt_flat_core_inst_result_rsc_8_0_i_qa_d,
      result_rsc_8_0_i_wea_d => ntt_flat_core_inst_result_rsc_8_0_i_wea_d,
      result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_9_0_i_adra_d => ntt_flat_core_inst_result_rsc_9_0_i_adra_d,
      result_rsc_9_0_i_qa_d => ntt_flat_core_inst_result_rsc_9_0_i_qa_d,
      result_rsc_9_0_i_wea_d => ntt_flat_core_inst_result_rsc_9_0_i_wea_d,
      result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_10_0_i_adra_d => ntt_flat_core_inst_result_rsc_10_0_i_adra_d,
      result_rsc_10_0_i_qa_d => ntt_flat_core_inst_result_rsc_10_0_i_qa_d,
      result_rsc_10_0_i_wea_d => ntt_flat_core_inst_result_rsc_10_0_i_wea_d,
      result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_11_0_i_adra_d => ntt_flat_core_inst_result_rsc_11_0_i_adra_d,
      result_rsc_11_0_i_qa_d => ntt_flat_core_inst_result_rsc_11_0_i_qa_d,
      result_rsc_11_0_i_wea_d => ntt_flat_core_inst_result_rsc_11_0_i_wea_d,
      result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      result_rsc_12_0_i_adra_d => ntt_flat_core_inst_result_rsc_12_0_i_adra_d,
      result_rsc_12_0_i_qa_d => ntt_flat_core_inst_result_rsc_12_0_i_qa_d,
      result_rsc_12_0_i_wea_d => ntt_flat_core_inst_result_rsc_12_0_i_wea_d,
      result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      mult_t_mul_cmp_a => ntt_flat_core_inst_mult_t_mul_cmp_a,
      mult_t_mul_cmp_b => ntt_flat_core_inst_mult_t_mul_cmp_b,
      mult_t_mul_cmp_z => ntt_flat_core_inst_mult_t_mul_cmp_z,
      twiddle_rsci_adra_d_pff => ntt_flat_core_inst_twiddle_rsci_adra_d_pff,
      result_rsc_1_0_i_da_d_pff => ntt_flat_core_inst_result_rsc_1_0_i_da_d_pff,
      result_rsc_9_0_i_da_d_pff => ntt_flat_core_inst_result_rsc_9_0_i_da_d_pff
    );
  ntt_flat_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsci_adra_d <= ntt_flat_core_inst_vec_rsci_adra_d;
  ntt_flat_core_inst_vec_rsci_qa_d <= vec_rsci_qa_d;
  vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  ntt_flat_core_inst_twiddle_rsci_qa_d <= twiddle_rsci_qa_d;
  twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  ntt_flat_core_inst_twiddle_h_rsci_qa_d <= twiddle_h_rsci_qa_d;
  twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_0_0_i_adra_d <= ntt_flat_core_inst_result_rsc_0_0_i_adra_d;
  result_rsc_0_0_i_da_d <= ntt_flat_core_inst_result_rsc_0_0_i_da_d;
  ntt_flat_core_inst_result_rsc_0_0_i_qa_d <= result_rsc_0_0_i_qa_d;
  result_rsc_0_0_i_wea_d <= ntt_flat_core_inst_result_rsc_0_0_i_wea_d;
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_1_0_i_adra_d <= ntt_flat_core_inst_result_rsc_1_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_1_0_i_qa_d <= result_rsc_1_0_i_qa_d;
  result_rsc_1_0_i_wea_d <= ntt_flat_core_inst_result_rsc_1_0_i_wea_d;
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_1_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_2_0_i_adra_d <= ntt_flat_core_inst_result_rsc_2_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_2_0_i_qa_d <= result_rsc_2_0_i_qa_d;
  result_rsc_2_0_i_wea_d <= ntt_flat_core_inst_result_rsc_2_0_i_wea_d;
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_2_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_3_0_i_adra_d <= ntt_flat_core_inst_result_rsc_3_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_3_0_i_qa_d <= result_rsc_3_0_i_qa_d;
  result_rsc_3_0_i_wea_d <= ntt_flat_core_inst_result_rsc_3_0_i_wea_d;
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_3_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_4_0_i_adra_d <= ntt_flat_core_inst_result_rsc_4_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_4_0_i_qa_d <= result_rsc_4_0_i_qa_d;
  result_rsc_4_0_i_wea_d <= ntt_flat_core_inst_result_rsc_4_0_i_wea_d;
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_4_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_5_0_i_adra_d <= ntt_flat_core_inst_result_rsc_5_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_5_0_i_qa_d <= result_rsc_5_0_i_qa_d;
  result_rsc_5_0_i_wea_d <= ntt_flat_core_inst_result_rsc_5_0_i_wea_d;
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_5_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_6_0_i_adra_d <= ntt_flat_core_inst_result_rsc_6_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_6_0_i_qa_d <= result_rsc_6_0_i_qa_d;
  result_rsc_6_0_i_wea_d <= ntt_flat_core_inst_result_rsc_6_0_i_wea_d;
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_6_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_7_0_i_adra_d <= ntt_flat_core_inst_result_rsc_7_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_7_0_i_qa_d <= result_rsc_7_0_i_qa_d;
  result_rsc_7_0_i_wea_d <= ntt_flat_core_inst_result_rsc_7_0_i_wea_d;
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_7_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_8_0_i_adra_d <= ntt_flat_core_inst_result_rsc_8_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_8_0_i_qa_d <= result_rsc_8_0_i_qa_d;
  result_rsc_8_0_i_wea_d <= ntt_flat_core_inst_result_rsc_8_0_i_wea_d;
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_8_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_9_0_i_adra_d <= ntt_flat_core_inst_result_rsc_9_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_9_0_i_qa_d <= result_rsc_9_0_i_qa_d;
  result_rsc_9_0_i_wea_d <= ntt_flat_core_inst_result_rsc_9_0_i_wea_d;
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_9_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_10_0_i_adra_d <= ntt_flat_core_inst_result_rsc_10_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_10_0_i_qa_d <= result_rsc_10_0_i_qa_d;
  result_rsc_10_0_i_wea_d <= ntt_flat_core_inst_result_rsc_10_0_i_wea_d;
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_10_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_11_0_i_adra_d <= ntt_flat_core_inst_result_rsc_11_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_11_0_i_qa_d <= result_rsc_11_0_i_qa_d;
  result_rsc_11_0_i_wea_d <= ntt_flat_core_inst_result_rsc_11_0_i_wea_d;
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_11_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  result_rsc_12_0_i_adra_d <= ntt_flat_core_inst_result_rsc_12_0_i_adra_d;
  ntt_flat_core_inst_result_rsc_12_0_i_qa_d <= result_rsc_12_0_i_qa_d;
  result_rsc_12_0_i_wea_d <= ntt_flat_core_inst_result_rsc_12_0_i_wea_d;
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= ntt_flat_core_inst_result_rsc_12_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  mult_t_mul_cmp_a <= ntt_flat_core_inst_mult_t_mul_cmp_a;
  mult_t_mul_cmp_b <= ntt_flat_core_inst_mult_t_mul_cmp_b;
  ntt_flat_core_inst_mult_t_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_t_mul_cmp_a) * UNSIGNED(mult_t_mul_cmp_b)), 52));
  twiddle_rsci_adra_d_iff <= ntt_flat_core_inst_twiddle_rsci_adra_d_pff;
  result_rsc_1_0_i_da_d_iff <= ntt_flat_core_inst_result_rsc_1_0_i_da_d_pff;
  result_rsc_9_0_i_da_d_iff <= ntt_flat_core_inst_result_rsc_9_0_i_da_d_pff;

END v11;



