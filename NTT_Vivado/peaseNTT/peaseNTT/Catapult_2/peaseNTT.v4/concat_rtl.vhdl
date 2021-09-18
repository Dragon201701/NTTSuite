
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_mul_pipe_beh.vhd 

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mgc_mul_pipe IS
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
END mgc_mul_pipe;

LIBRARY IEEE;

USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF mgc_mul_pipe IS
  TYPE reg_array_type is array(natural range<>) of std_logic_vector(width_z-1 DOWNTO 0); 
  SIGNAL xz : std_logic_vector(width_a+width_b DOWNTO 0);

--MF Added pipelined input
    signal a_f     : STD_LOGIC_VECTOR(width_a-1 downto 0); 
    signal b_f     : STD_LOGIC_VECTOR(width_b-1 downto 0);
   type a_array is array (natural range <>) of STD_LOGIC_VECTOR(width_a-1 downto 0);
   type b_array is array (natural range <>) of STD_LOGIC_VECTOR(width_b-1 downto 0);
BEGIN
  n_inreg_gt_0: if n_inreg > 0 generate
    GENPOS_INREG: IF clock_edge = 1 GENERATE
     I0: process(clk)
        variable a_in_reg: a_array(n_inreg-1 downto 0);
        variable b_in_reg: b_array(n_inreg-1 downto 0);
      begin
        if (clk'event and clk = '1' ) then
          if (conv_integer(en) = enable_active) then
            for i in n_inreg - 2 downto 0 loop
              a_in_reg(i+1) := a_in_reg(i);
              b_in_reg(i+1) := b_in_reg(i);
            end loop;                                                                                                                             
            a_in_reg(0) := a;
            b_in_reg(0) := b;

            a_f <= a_in_reg(n_inreg-1);             
            b_f <= b_in_reg(n_inreg-1);    
                                                   
          end if;
        end if;
      end process;
    END GENERATE;
  
   GENNEG_INREG: IF clock_edge = 0 GENERATE
     I0: process(clk)
        variable a_in_reg: a_array(n_inreg-1 downto 0);
        variable b_in_reg: b_array(n_inreg-1 downto 0);
      begin
        if (clk'event and clk = '0' ) then
          if (conv_integer(en) = enable_active) then
            for i in n_inreg - 2 downto 0 loop
              a_in_reg(i+1) := a_in_reg(i);
              b_in_reg(i+1) := b_in_reg(i);
            end loop;                                                                                                                             
            a_in_reg(0) := a;
            b_in_reg(0) := b;            
                                 
            a_f <= a_in_reg(n_inreg-1);             
            b_f <= b_in_reg(n_inreg-1);
                                                        
          end if;
        end if;
      end process;
    END GENERATE;
  END GENERATE;

  n_inreg_eq_0: if n_inreg = 0 generate
    a_f <= a;
    b_f <= b;
  end generate n_inreg_eq_0;

  xz <= '0'&(unsigned(a_f) * unsigned(b_f)) WHEN signd_a = 0 AND signd_b = 0 ELSE
            (  signed(a_f) * unsigned(b_f)) WHEN signd_a = 1 AND signd_b = 0 ELSE
            (unsigned(a_f) *   signed(b_f)) WHEN signd_a = 0 AND signd_b = 1 ELSE
        '0'&(  signed(a_f) *   signed(b_f));

  GENPOS: IF clock_edge = 1 GENERATE
    PROCESS (clk)
    VARIABLE reg_array: reg_array_type(stages-2 DOWNTO 0);
    BEGIN
      IF ( clk'EVENT AND clk = '1') THEN
        IF ( conv_integer(en) = enable_active) THEN
          FOR I IN stages-2 DOWNTO 1 LOOP
            reg_array(I) := reg_array(I-1);
          END LOOP;
          reg_array(0) := xz(width_z-1 DOWNTO 0);
          z <= reg_array(stages-2);
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;

  GENNEG: IF clock_edge = 0 GENERATE
    PROCESS (clk)
    VARIABLE reg_array: reg_array_type(stages-2 DOWNTO 0);
    BEGIN
      IF ( clk'EVENT AND clk = '0') THEN
        IF ( conv_integer(en) = enable_active) THEN
          FOR I IN stages-2 DOWNTO 1 LOOP
            reg_array(I) := reg_array(I-1);
          END LOOP;
          reg_array(0) := xz(width_z-1 DOWNTO 0);
          z <= reg_array(stages-2);
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;
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

--------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_DPRAM_RBW_DUAL.vhd 
-- Memory Type:            BLOCK
-- Operating Mode:         True Dual Port (2-Port)
-- Clock Mode:             Dual Clock
-- 
-- RTL Code RW Resolution: RBW
-- Catapult RW Resolution: RBW
-- 
-- HDL Work Library:       Xilinx_RAMS_lib
-- Component Name:         BLOCK_DPRAM_RBW_DUAL
-- Latency = 1:            RAM with no registers on inputs or outputs
--         = 2:            adds embedded register on RAM output
--         = 3:            adds fabric registers to non-clock input RAM pins
--         = 4:            adds fabric register to output (driven by embedded register from latency=2)

LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
PACKAGE BLOCK_DPRAM_RBW_DUAL_pkg IS
  COMPONENT BLOCK_DPRAM_RBW_DUAL IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    adra : in std_logic_vector(addr_width-1 downto 0) ;
    adrb : in std_logic_vector(addr_width-1 downto 0) ;
    clka : in std_logic ;
    clka_en : in std_logic ;
    clkb : in std_logic ;
    clkb_en : in std_logic ;
    da : in std_logic_vector(data_width-1 downto 0) ;
    db : in std_logic_vector(data_width-1 downto 0) ;
    qa : out std_logic_vector(data_width-1 downto 0) ;
    qb : out std_logic_vector(data_width-1 downto 0) ;
    wea : in std_logic ;
    web : in std_logic 
    
  );
  END COMPONENT;
END BLOCK_DPRAM_RBW_DUAL_pkg;
LIBRARY ieee;

  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;
ENTITY BLOCK_DPRAM_RBW_DUAL IS
  GENERIC (
    addr_width : integer := 8 ;
    data_width : integer := 7 ;
    depth : integer := 256 ;
    latency : integer := 1 
    
  );
  PORT (
    adra : in std_logic_vector(addr_width-1 downto 0) ;
    adrb : in std_logic_vector(addr_width-1 downto 0) ;
    clka : in std_logic ;
    clka_en : in std_logic ;
    clkb : in std_logic ;
    clkb_en : in std_logic ;
    da : in std_logic_vector(data_width-1 downto 0) ;
    db : in std_logic_vector(data_width-1 downto 0) ;
    qa : out std_logic_vector(data_width-1 downto 0) ;
    qb : out std_logic_vector(data_width-1 downto 0) ;
    wea : in std_logic ;
    web : in std_logic 
    
  );
 END BLOCK_DPRAM_RBW_DUAL;
ARCHITECTURE rtl OF BLOCK_DPRAM_RBW_DUAL IS
  TYPE ram_t IS ARRAY (depth-1 DOWNTO 0) OF std_logic_vector(data_width-1 DOWNTO 0);
  SHARED VARIABLE mem : ram_t := (OTHERS => (OTHERS => '0'));
  ATTRIBUTE ram_style: STRING;
  ATTRIBUTE ram_style OF mem : VARIABLE IS "block";
  ATTRIBUTE syn_ramstyle: STRING;
  ATTRIBUTE syn_ramstyle OF mem : VARIABLE IS "block";
  
  SIGNAL ramqa : std_logic_vector(data_width-1 downto 0);
  SIGNAL ramqb : std_logic_vector(data_width-1 downto 0);
  
BEGIN
-- Port Map
-- rwA :: ADDRESS adra CLOCK clka ENABLE clka_en DATA_IN da DATA_OUT qa WRITE_ENABLE wea
-- rwB :: ADDRESS adrb CLOCK clkb ENABLE clkb_en DATA_IN db DATA_OUT qb WRITE_ENABLE web

-- Access memory with non-registered inputs (latency = 1||2)
  IN_PIN :  IF latency < 3 GENERATE
  BEGIN
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
         IF (clka_en = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(adra)) < depth) THEN
          --pragma translate_on
          ramqa <= mem(to_integer(unsigned(adra)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (wea = '1') THEN
            mem(to_integer(unsigned(adra))) := da;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
         IF (clka_en = '1') THEN
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
         IF (clkb_en = '1') THEN
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
         IF (clkb_en = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(adrb)) < depth) THEN
          --pragma translate_on
          ramqb <= mem(to_integer(unsigned(adrb)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (web = '1') THEN
            mem(to_integer(unsigned(adrb))) := db;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_PIN; 

-- Register all non-clock inputs (latency = 3||4)
  IN_REG :  IF latency > 2 GENERATE
    SIGNAL adra_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL da_reg : std_logic_vector(data_width-1 downto 0);
    SIGNAL wea_reg : std_logic;
    SIGNAL adrb_reg : std_logic_vector(addr_width-1 downto 0);
    SIGNAL db_reg : std_logic_vector(data_width-1 downto 0);
    SIGNAL web_reg : std_logic;
    
  BEGIN
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
        IF (clka_en = '1') THEN
          adra_reg <= adra;
          da_reg <= da;
          wea_reg <= wea;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
        IF (clkb_en = '1') THEN
          adrb_reg <= adrb;
          db_reg <= db;
          web_reg <= web;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
         IF (clka_en = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(adra_reg)) < depth) THEN
          --pragma translate_on
          ramqa <= mem(to_integer(unsigned(adra_reg)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (wea_reg = '1') THEN
            mem(to_integer(unsigned(adra_reg))) := da_reg;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
         IF (clka_en = '1') THEN
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
         IF (clkb_en = '1') THEN
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
         IF (clkb_en = '1') THEN
          -- workaround for simulation when read address out-of-range during inactive cycle
          --pragma translate_off
          IF (to_integer(unsigned(adrb_reg)) < depth) THEN
          --pragma translate_on
          ramqb <= mem(to_integer(unsigned(adrb_reg)));
          --pragma translate_off
          END IF;
          --pragma translate_on
          IF (web_reg = '1') THEN
            mem(to_integer(unsigned(adrb_reg))) := db_reg;
          END IF;
        END IF;
      END IF;
    END PROCESS;
    
  END GENERATE IN_REG;

  out_ram : IF latency = 1 GENERATE
  BEGIN
    qa <= ramqa;
    qb <= ramqb;
    
  END GENERATE out_ram;

  out_reg1 : IF ((latency = 2) OR (latency = 3)) GENERATE
    SIGNAL tmpqa : std_logic_vector(data_width-1 downto 0);
    SIGNAL tmpqb : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
        IF (clka_en = '1') THEN
          tmpqa <= ramqa;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
        IF (clkb_en = '1') THEN
          tmpqb <= ramqb;
        END IF;
      END IF;
    END PROCESS;
    
    qa <= tmpqa;
    qb <= tmpqb;
    
  END GENERATE out_reg1;

  out_reg2 : IF latency = 4 GENERATE
    SIGNAL tmp1qa : std_logic_vector(data_width-1 downto 0);
    SIGNAL tmp1qb : std_logic_vector(data_width-1 downto 0);
    
    SIGNAL tmp2qa : std_logic_vector(data_width-1 downto 0);
    SIGNAL tmp2qb : std_logic_vector(data_width-1 downto 0);
    
  BEGIN
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
        IF (clka_en = '1') THEN
          tmp1qa <= ramqa;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
        IF (clkb_en = '1') THEN
          tmp1qb <= ramqb;
        END IF;
      END IF;
    END PROCESS;
    
    PROCESS (clka)
    BEGIN
      IF (rising_edge(clka)) THEN
        IF (clka_en = '1') THEN
          tmp2qa <= tmp1qa;
        END IF;
      END IF;
    END PROCESS;
    PROCESS (clkb)
    BEGIN
      IF (rising_edge(clkb)) THEN
        IF (clkb_en = '1') THEN
          tmp2qb <= tmp1qb;
        END IF;
      END IF;
    END PROCESS;
    
    qa <= tmp2qa;
    qb <= tmp2qb;
    
  END GENERATE out_reg2;


END rtl;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   ls5382@newnano.poly.edu
--  Generated date: Thu Sep 16 18:53:17 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen;

ARCHITECTURE v4 OF peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(27 DOWNTO 14));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(13 DOWNTO 0));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
    INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_2_tr0 : IN STD_LOGIC;
    INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
    INNER_LOOP4_C_0_tr0 : IN STD_LOGIC
  );
END peaseNTT_core_core_fsm;

ARCHITECTURE v4 OF peaseNTT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for peaseNTT_core_core_fsm_1
  TYPE peaseNTT_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, INNER_LOOP1_C_0,
      STAGE_LOOP_C_1, INNER_LOOP2_C_0, STAGE_LOOP_C_2, INNER_LOOP3_C_0, INNER_LOOP4_C_0,
      main_C_1);

  SIGNAL state_var : peaseNTT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : peaseNTT_core_core_fsm_1_ST;

BEGIN
  peaseNTT_core_core_fsm_1 : PROCESS (INNER_LOOP1_C_0_tr0, INNER_LOOP2_C_0_tr0, STAGE_LOOP_C_2_tr0,
      INNER_LOOP3_C_0_tr0, INNER_LOOP4_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000010");
        state_var_NS <= INNER_LOOP1_C_0;
      WHEN INNER_LOOP1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000100");
        IF ( INNER_LOOP1_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= INNER_LOOP1_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001000");
        state_var_NS <= INNER_LOOP2_C_0;
      WHEN INNER_LOOP2_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010000");
        IF ( INNER_LOOP2_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_2;
        ELSE
          state_var_NS <= INNER_LOOP2_C_0;
        END IF;
      WHEN STAGE_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100000");
        IF ( STAGE_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= INNER_LOOP3_C_0;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN INNER_LOOP3_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000000");
        IF ( INNER_LOOP3_C_0_tr0 = '1' ) THEN
          state_var_NS <= INNER_LOOP4_C_0;
        ELSE
          state_var_NS <= INNER_LOOP3_C_0;
        END IF;
      WHEN INNER_LOOP4_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000000");
        IF ( INNER_LOOP4_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= INNER_LOOP4_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000000001");
        state_var_NS <= STAGE_LOOP_C_0;
    END CASE;
  END PROCESS peaseNTT_core_core_fsm_1;

  peaseNTT_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS peaseNTT_core_core_fsm_1_REG;

END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    yt_rsc_0_0_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
    ensig_cgo_iro : IN STD_LOGIC;
    mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_1_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_2_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_3_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_4_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_5_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_6_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_7_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    yt_rsc_0_0_cgo : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    mult_t_mul_cmp_en : OUT STD_LOGIC;
    mult_z_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_1_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_2_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_3_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_4_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_5_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_6_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_7_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END peaseNTT_core_wait_dp;

ARCHITECTURE v4 OF peaseNTT_core_wait_dp IS
  -- Default Constants

BEGIN
  yt_rsc_0_0_i_clka_en_d <= yt_rsc_0_0_cgo OR yt_rsc_0_0_cgo_iro;
  mult_t_mul_cmp_en <= ensig_cgo OR ensig_cgo_iro;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_z_mul_cmp_z_oreg <= mult_z_mul_cmp_z;
      mult_z_mul_cmp_1_z_oreg <= mult_z_mul_cmp_1_z;
      mult_z_mul_cmp_2_z_oreg <= mult_z_mul_cmp_2_z;
      mult_z_mul_cmp_3_z_oreg <= mult_z_mul_cmp_3_z;
      mult_z_mul_cmp_4_z_oreg <= mult_z_mul_cmp_4_z;
      mult_z_mul_cmp_5_z_oreg <= mult_z_mul_cmp_5_z;
      mult_z_mul_cmp_6_z_oreg <= mult_z_mul_cmp_6_z;
      mult_z_mul_cmp_7_z_oreg <= mult_z_mul_cmp_7_z;
    END IF;
  END PROCESS;
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
    xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    mult_z_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_1_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_1_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_1_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_2_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_2_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_2_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_3_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_3_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_4_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_4_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_4_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_5_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_5_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_6_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_6_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_6_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_7_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_7_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
    twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
  );
END peaseNTT_core;

ARCHITECTURE v4 OF peaseNTT_core IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_en : STD_LOGIC;
  SIGNAL mult_t_mul_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_1_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_2_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_3_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_1_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_2_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_3_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_4_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_5_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_6_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_7_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP4_nor_tmp : STD_LOGIC;
  SIGNAL INNER_LOOP2_nor_tmp : STD_LOGIC;
  SIGNAL or_dcpl_2 : STD_LOGIC;
  SIGNAL or_dcpl_3 : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL or_tmp_153 : STD_LOGIC;
  SIGNAL or_tmp_232 : STD_LOGIC;
  SIGNAL and_206_cse : STD_LOGIC;
  SIGNAL and_207_cse : STD_LOGIC;
  SIGNAL tmp_14_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_15_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_12_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_14_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_10_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_13_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_8_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_11_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_10_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_9_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_8_res_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_7_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_6_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_5_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_4_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_lpi_3_dfm_mx0 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL INNER_LOOP1_stage_0_4 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_2 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_4 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_3 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_7 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_5 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_6 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_8 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_10 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_9 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_2 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_9 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_9 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0_2 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_3 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_4 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_3 : STD_LOGIC;
  SIGNAL INNER_LOOP1_r_asn_11_itm_1 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0 : STD_LOGIC;
  SIGNAL INNER_LOOP2_r_asn_10_itm_1 : STD_LOGIC;
  SIGNAL mult_7_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_6_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_5_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_4_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL INNER_LOOP3_r_asn_14_itm_1 : STD_LOGIC;
  SIGNAL INNER_LOOP3_stage_0 : STD_LOGIC;
  SIGNAL INNER_LOOP4_r_asn_18_itm_1 : STD_LOGIC;
  SIGNAL INNER_LOOP4_stage_0 : STD_LOGIC;
  SIGNAL mult_15_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_14_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_13_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL mult_12_slc_32_svs_st_1 : STD_LOGIC;
  SIGNAL modulo_add_base_15_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_14_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_13_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_12_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_15_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_14_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_13_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_11_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_10_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_9_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_8_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_11_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_10_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_9_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_8_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_7_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_6_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_5_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_4_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_7_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_6_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_5_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_4_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_3_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_2_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_3_f2_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_3_f2_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_3_f1_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_3_f1_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_2_f2_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_2_f2_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_2_f1_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_2_f1_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_3_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_3_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_2_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_2_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_1_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_1_and_ssc_2 : STD_LOGIC;
  SIGNAL butterFly1_and_ssc : STD_LOGIC;
  SIGNAL butterFly1_and_ssc_2 : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_0_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_triosy_0_3_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_mult_z_mul_cmp_1_b_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_mux_4_cse : STD_LOGIC;
  SIGNAL butterFly1_mux_5_cse : STD_LOGIC;
  SIGNAL butterFly1_nor_1_cse : STD_LOGIC;
  SIGNAL butterFly1_nor_2_cse : STD_LOGIC;
  SIGNAL butterFly1_3_f2_mux_16_cse : STD_LOGIC;
  SIGNAL butterFly1_3_f2_mux_17_cse : STD_LOGIC;
  SIGNAL modulo_sub_base_7_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_15_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_6_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_14_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_5_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_13_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_4_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_12_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_3_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_11_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_2_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_10_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_1_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_9_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_base_8_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL or_39_rmff : STD_LOGIC;
  SIGNAL butterFly1_butterFly1_or_rmff : STD_LOGIC;
  SIGNAL butterFly1_mux1h_1_rmff : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL butterFly1_butterFly1_and_4_rmff : STD_LOGIC;
  SIGNAL butterFly1_butterFly1_and_5_rmff : STD_LOGIC;
  SIGNAL butterFly1_butterFly1_or_1_rmff : STD_LOGIC;
  SIGNAL butterFly1_butterFly1_butterFly1_and_rmff : STD_LOGIC;
  SIGNAL or_52_rmff : STD_LOGIC;
  SIGNAL butterFly1_3_f2_butterFly1_3_f2_and_10_rmff : STD_LOGIC;
  SIGNAL butterFly1_3_f2_mux1h_rmff : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL butterFly1_3_f2_butterFly1_3_f2_or_6_rmff : STD_LOGIC;
  SIGNAL butterFly1_3_f2_butterFly1_3_f2_or_7_rmff : STD_LOGIC;
  SIGNAL butterFly1_3_f2_butterFly1_3_f2_and_11_rmff : STD_LOGIC;
  SIGNAL butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff : STD_LOGIC;
  SIGNAL or_112_rmff : STD_LOGIC;
  SIGNAL INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_nor_1_rmff : STD_LOGIC;
  SIGNAL INNER_LOOP1_tw_h_mux1h_rmff : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL butterFly2_2_tw_butterFly2_2_tw_nor_rmff : STD_LOGIC;
  SIGNAL butterFly2_2_tw_butterFly2_2_tw_mux_rmff : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL or_182_rmff : STD_LOGIC;
  SIGNAL INNER_LOOP4_r_15_2_sva_12_0_mx1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_12 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_17 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_18 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_19 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_20 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_21 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_22 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_23 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_24 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_26 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_27 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_29 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_30 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_43 : STD_LOGIC_VECTOR (14 DOWNTO 0);
  SIGNAL z_out_44 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL c_3_1_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_32_false_acc_psp_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL operator_34_true_return_14_2_sva : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL operator_34_true_1_lshift_psp_13_2_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL INNER_LOOP1_stage_0_5 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_6 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_7 : STD_LOGIC;
  SIGNAL INNER_LOOP1_stage_0_8 : STD_LOGIC;
  SIGNAL tmp_16_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_16_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_16_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_16_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_18_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_18_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_18_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_18_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_20_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_20_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_20_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_20_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_22_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_22_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_22_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_22_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_asn_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_z_asn_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_1_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_z_asn_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_2_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_z_asn_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_3_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_1 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_2 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_3 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_4 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_5 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_6 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_7 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL INNER_LOOP2_stage_0_5 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_6 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_7 : STD_LOGIC;
  SIGNAL INNER_LOOP2_stage_0_8 : STD_LOGIC;
  SIGNAL tmp_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_4_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_5_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_4_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_6_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_6_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_7_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_4_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_4_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_5_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_5_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_6_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_6_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_7_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_7_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_1 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_2 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_3 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_4 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_5 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_6 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_7 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL mult_8_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_9_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_10_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_11_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_1 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_2 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_3 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_4 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_5 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_6 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_7 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL tmp_8_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_8_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_8_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_8_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_10_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_10_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_10_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_10_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_13_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_12_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_12_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_12_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_12_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_14_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_14_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_14_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_14_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_14_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_15_res_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_12_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_13_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_13_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_14_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_14_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_15_z_asn_itm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_15_z_asn_itm_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_1 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_2 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_3 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_4 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_5 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_6 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_7 : STD_LOGIC_VECTOR (12 DOWNTO
      0);
  SIGNAL INNER_LOOP1_r_15_2_sva_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP2_r_15_2_sva_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP3_r_15_2_sva_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP4_r_15_2_sva_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP1_r_15_2_sva_1_1_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP2_r_15_2_sva_1_1_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP3_r_15_2_sva_1_1_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP4_r_15_2_sva_1_1_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP1_r_15_2_sva_12_0_mx1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP2_r_15_2_sva_12_0_mx1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP3_r_15_2_sva_12_0_mx1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL reg_mult_3_slc_32_svs_st_1_cse : STD_LOGIC;
  SIGNAL reg_mult_2_slc_32_svs_st_1_cse : STD_LOGIC;
  SIGNAL reg_mult_1_slc_32_svs_st_1_cse : STD_LOGIC;
  SIGNAL reg_mult_slc_32_svs_st_1_cse : STD_LOGIC;
  SIGNAL reg_mult_3_z_asn_itm_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_2_z_asn_itm_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_1_z_asn_itm_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_mult_z_asn_itm_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_22_sva_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_20_sva_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_18_sva_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_16_sva_3_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL INNER_LOOP1_INNER_LOOP1_and_8_cse : STD_LOGIC;
  SIGNAL INNER_LOOP2_INNER_LOOP2_and_1_cse : STD_LOGIC;
  SIGNAL reg_tmp_22_sva_6_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_20_sva_6_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_18_sva_6_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_tmp_16_sva_6_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_31_32 : STD_LOGIC;
  SIGNAL z_out_32_32 : STD_LOGIC;
  SIGNAL z_out_33_32 : STD_LOGIC;
  SIGNAL z_out_34_32 : STD_LOGIC;
  SIGNAL z_out_35_32 : STD_LOGIC;
  SIGNAL z_out_36_32 : STD_LOGIC;
  SIGNAL z_out_37_32 : STD_LOGIC;
  SIGNAL z_out_38_32 : STD_LOGIC;
  SIGNAL z_out_39_32 : STD_LOGIC;
  SIGNAL z_out_40_32 : STD_LOGIC;
  SIGNAL z_out_41_32 : STD_LOGIC;
  SIGNAL z_out_42_32 : STD_LOGIC;
  SIGNAL butterFly1_mux_12_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_2_mux_12_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly2_mux_4_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly2_1_mux_4_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL or_233_nl : STD_LOGIC;
  SIGNAL INNER_LOOP1_mux_nl : STD_LOGIC;
  SIGNAL or_28_nl : STD_LOGIC;
  SIGNAL or_31_nl : STD_LOGIC;
  SIGNAL or_33_nl : STD_LOGIC;
  SIGNAL or_35_nl : STD_LOGIC;
  SIGNAL INNER_LOOP1_tw_and_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL INNER_LOOP2_tw_and_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL butterFly1_butterFly1_and_nl : STD_LOGIC;
  SIGNAL butterFly1_mux1h_4_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_or_nl : STD_LOGIC;
  SIGNAL butterFly1_mux1h_9_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_25_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_or_1_nl : STD_LOGIC;
  SIGNAL butterFly1_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_1_butterFly1_1_and_nl : STD_LOGIC;
  SIGNAL butterFly1_1_mux1h_4_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_1_or_nl : STD_LOGIC;
  SIGNAL butterFly1_1_mux1h_9_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_1_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_1_and_5_nl : STD_LOGIC;
  SIGNAL butterFly1_1_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_1_and_7_nl : STD_LOGIC;
  SIGNAL butterFly1_2_butterFly1_2_and_nl : STD_LOGIC;
  SIGNAL butterFly1_2_mux1h_4_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_2_or_nl : STD_LOGIC;
  SIGNAL butterFly1_2_mux1h_9_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_2_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_2_and_5_nl : STD_LOGIC;
  SIGNAL butterFly1_2_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_2_and_7_nl : STD_LOGIC;
  SIGNAL butterFly1_3_butterFly1_3_and_nl : STD_LOGIC;
  SIGNAL butterFly1_3_mux1h_4_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_3_or_nl : STD_LOGIC;
  SIGNAL butterFly1_3_mux1h_16_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_3_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_3_and_5_nl : STD_LOGIC;
  SIGNAL butterFly1_3_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_3_and_7_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_mux1h_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_2_f1_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_and_5_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_and_7_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_butterFly1_2_f1_and_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f1_mux1h_11_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_2_f1_or_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f2_mux1h_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_28_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_5_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_2_f2_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f2_or_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f2_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f2_butterFly1_2_f2_and_nl : STD_LOGIC;
  SIGNAL butterFly1_2_f2_mux1h_5_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_2_f2_or_1_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f1_mux1h_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_13_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_6_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_3_f1_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f1_or_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f1_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f1_butterFly1_3_f1_and_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f1_mux1h_11_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_3_f1_or_1_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f2_mux1h_6_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_7_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_3_f2_and_4_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f2_or_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f2_and_6_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f2_butterFly1_3_f2_and_nl : STD_LOGIC;
  SIGNAL butterFly1_3_f2_mux1h_9_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly1_3_f2_or_1_nl : STD_LOGIC;
  SIGNAL butterFly1_mux_13_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL butterFly1_mux_15_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly1_2_mux_13_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL butterFly1_2_mux_15_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_3_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL modulo_sub_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL modulo_sub_2_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL butterFly2_mux_5_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_9_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL butterFly2_mux_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL butterFly2_1_mux_5_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_11_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL butterFly2_1_mux_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_4_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL modulo_sub_5_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL modulo_sub_1_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL acc_16_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_3_if_mux1h_6_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_17_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_2_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_18_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_1_if_mux1h_6_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_19_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_20_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_9_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_21_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_8_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_22_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_5_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_23_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_4_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_24_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL modulo_add_10_qif_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_26_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_12_if_mux_2_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_sub_7_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL modulo_sub_6_qif_mux_2_nl : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL operator_32_false_mux1h_2_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL acc_31_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_3_if_mux1h_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_32_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_2_if_mux1h_4_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_33_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_1_if_mux1h_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_34_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mux1h_4_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_35_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_4_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_36_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_2_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_37_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_7_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_38_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_1_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_39_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_3_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_40_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_13_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_41_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_42_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL modulo_add_5_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL operator_32_false_mux_1_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL mult_t_mul_cmp_1_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_1_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_1_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL mult_t_mul_cmp_2_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_2_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_2_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL mult_t_mul_cmp_3_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_3_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_3_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL operator_34_true_1_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL operator_34_true_1_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL operator_34_true_1_lshift_rg_z : STD_LOGIC_VECTOR (14 DOWNTO 0);

  COMPONENT peaseNTT_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      yt_rsc_0_0_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
      ensig_cgo_iro : IN STD_LOGIC;
      mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_1_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_2_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_3_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_4_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_5_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_6_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_7_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      yt_rsc_0_0_cgo : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      mult_t_mul_cmp_en : OUT STD_LOGIC;
      mult_z_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_1_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_2_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_3_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_4_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_5_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_6_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_7_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);
  SIGNAL peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z_oreg : STD_LOGIC_VECTOR (31
      DOWNTO 0);

  COMPONENT peaseNTT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      INNER_LOOP1_C_0_tr0 : IN STD_LOGIC;
      INNER_LOOP2_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_2_tr0 : IN STD_LOGIC;
      INNER_LOOP3_C_0_tr0 : IN STD_LOGIC;
      INNER_LOOP4_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaseNTT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_0_tr0 : STD_LOGIC;
  SIGNAL peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_0_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_13_4_2(input_3 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(12 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(12 DOWNTO 0);

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

  FUNCTION MUX1HOT_v_31_3_2(input_2 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(30 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(30 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
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

  FUNCTION MUX1HOT_v_32_4_2(input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
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

  FUNCTION MUX_v_13_2_2(input_0 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(12 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(12 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_31_2_2(input_0 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(30 DOWNTO 0);

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

BEGIN
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

  xt_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => xt_rsc_triosy_0_3_lz
    );
  xt_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => xt_rsc_triosy_0_2_lz
    );
  xt_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => xt_rsc_triosy_0_1_lz
    );
  xt_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => xt_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  r_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => r_rsc_triosy_lz
    );
  twiddle_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_3_lz
    );
  twiddle_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_2_lz
    );
  twiddle_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_1_lz
    );
  twiddle_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_rsc_triosy_0_0_lz
    );
  twiddle_h_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_0_3_lz
    );
  twiddle_h_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_0_2_lz
    );
  twiddle_h_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_0_1_lz
    );
  twiddle_h_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_3_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_0_0_lz
    );
  mult_t_mul_cmp : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 32,
      signd_a => 0,
      width_b => 32,
      signd_b => 0,
      width_z => 64,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_t_mul_cmp_a,
      b => mult_t_mul_cmp_b,
      clk => clk,
      en => mult_t_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_t_mul_cmp_z_1
    );
  mult_t_mul_cmp_a <= MUX1HOT_v_32_4_2((xt_rsc_0_1_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_1_i_qa_d(63
      DOWNTO 32)), (xt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_3_i_qa_d(31 DOWNTO
      0)), STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  mult_t_mul_cmp_b <= MUX1HOT_v_32_3_2(twiddle_h_rsc_0_0_i_q_d, twiddle_h_rsc_0_2_i_q_d,
      twiddle_h_rsc_0_3_i_q_d, STD_LOGIC_VECTOR'( or_tmp_153 & (fsm_output(6)) &
      (fsm_output(7))));
  mult_t_mul_cmp_z <= mult_t_mul_cmp_z_1;

  mult_t_mul_cmp_1 : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 32,
      signd_a => 0,
      width_b => 32,
      signd_b => 0,
      width_z => 64,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_t_mul_cmp_1_a,
      b => mult_t_mul_cmp_1_b,
      clk => clk,
      en => mult_t_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_t_mul_cmp_1_z_1
    );
  mult_t_mul_cmp_1_a <= MUX1HOT_v_32_4_2((xt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_3_i_qa_d(31
      DOWNTO 0)), (xt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_1_i_qa_d(63 DOWNTO
      32)), STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  mult_t_mul_cmp_1_b <= MUX_v_32_2_2(twiddle_h_rsc_0_0_i_q_d, twiddle_h_rsc_0_2_i_q_d,
      fsm_output(6));
  mult_t_mul_cmp_1_z <= mult_t_mul_cmp_1_z_1;

  mult_t_mul_cmp_2 : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 32,
      signd_a => 0,
      width_b => 32,
      signd_b => 0,
      width_z => 64,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_t_mul_cmp_2_a,
      b => mult_t_mul_cmp_2_b,
      clk => clk,
      en => mult_t_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_t_mul_cmp_2_z_1
    );
  mult_t_mul_cmp_2_a <= MUX1HOT_v_32_4_2((xt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_1_i_qa_d(31
      DOWNTO 0)), (xt_rsc_0_3_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_3_i_qa_d(63 DOWNTO
      32)), STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  mult_t_mul_cmp_2_b <= MUX_v_32_2_2(twiddle_h_rsc_0_0_i_q_d, twiddle_h_rsc_0_1_i_q_d,
      fsm_output(7));
  mult_t_mul_cmp_2_z <= mult_t_mul_cmp_2_z_1;

  mult_t_mul_cmp_3 : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 32,
      signd_a => 0,
      width_b => 32,
      signd_b => 0,
      width_z => 64,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 2,
      n_inreg => 2
      )
    PORT MAP(
      a => mult_t_mul_cmp_3_a,
      b => mult_t_mul_cmp_3_b,
      clk => clk,
      en => mult_t_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => mult_t_mul_cmp_3_z_1
    );
  mult_t_mul_cmp_3_a <= MUX1HOT_v_32_4_2((xt_rsc_0_3_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_3_i_qa_d(63
      DOWNTO 32)), (xt_rsc_0_1_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_1_i_qa_d(31 DOWNTO
      0)), STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  mult_t_mul_cmp_3_b <= MUX_v_32_2_2(twiddle_h_rsc_0_0_i_q_d, twiddle_h_rsc_0_2_i_q_d,
      fsm_output(7));
  mult_t_mul_cmp_3_z <= mult_t_mul_cmp_3_z_1;

  operator_34_true_1_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 1,
      width_s => 4,
      width_z => 15
      )
    PORT MAP(
      a => operator_34_true_1_lshift_rg_a,
      s => operator_34_true_1_lshift_rg_s,
      z => operator_34_true_1_lshift_rg_z
    );
  operator_34_true_1_lshift_rg_a(0) <= '1';
  operator_34_true_1_lshift_rg_s <= (MUX_v_3_2_2(z_out_44, operator_32_false_acc_psp_sva,
      fsm_output(3))) & (NOT (fsm_output(3)));
  z_out_43 <= operator_34_true_1_lshift_rg_z;

  peaseNTT_core_wait_dp_inst : peaseNTT_core_wait_dp
    PORT MAP(
      clk => clk,
      yt_rsc_0_0_cgo_iro => or_39_rmff,
      yt_rsc_0_0_i_clka_en_d => yt_rsc_0_0_i_clka_en_d,
      ensig_cgo_iro => or_182_rmff,
      mult_z_mul_cmp_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z,
      mult_z_mul_cmp_1_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z,
      mult_z_mul_cmp_2_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z,
      mult_z_mul_cmp_3_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z,
      mult_z_mul_cmp_4_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z,
      mult_z_mul_cmp_5_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z,
      mult_z_mul_cmp_6_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z,
      mult_z_mul_cmp_7_z => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z,
      yt_rsc_0_0_cgo => reg_yt_rsc_0_0_cgo_cse,
      ensig_cgo => reg_ensig_cgo_cse,
      mult_t_mul_cmp_en => mult_t_mul_cmp_en,
      mult_z_mul_cmp_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z_oreg,
      mult_z_mul_cmp_1_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z_oreg,
      mult_z_mul_cmp_2_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z_oreg,
      mult_z_mul_cmp_3_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z_oreg,
      mult_z_mul_cmp_4_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z_oreg,
      mult_z_mul_cmp_5_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z_oreg,
      mult_z_mul_cmp_6_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z_oreg,
      mult_z_mul_cmp_7_z_oreg => peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z_oreg
    );
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z <= mult_z_mul_cmp_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z <= mult_z_mul_cmp_1_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z <= mult_z_mul_cmp_2_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z <= mult_z_mul_cmp_3_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z <= mult_z_mul_cmp_4_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z <= mult_z_mul_cmp_5_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z <= mult_z_mul_cmp_6_z;
  peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z <= mult_z_mul_cmp_7_z;
  mult_z_mul_cmp_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_z_oreg;
  mult_z_mul_cmp_1_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_1_z_oreg;
  mult_z_mul_cmp_2_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_2_z_oreg;
  mult_z_mul_cmp_3_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_3_z_oreg;
  mult_z_mul_cmp_4_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_4_z_oreg;
  mult_z_mul_cmp_5_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_5_z_oreg;
  mult_z_mul_cmp_6_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_6_z_oreg;
  mult_z_mul_cmp_7_z_oreg <= peaseNTT_core_wait_dp_inst_mult_z_mul_cmp_7_z_oreg;

  peaseNTT_core_core_fsm_inst : peaseNTT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => peaseNTT_core_core_fsm_inst_fsm_output,
      INNER_LOOP1_C_0_tr0 => peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_0_tr0,
      INNER_LOOP2_C_0_tr0 => INNER_LOOP2_nor_tmp,
      STAGE_LOOP_C_2_tr0 => peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_2_tr0,
      INNER_LOOP3_C_0_tr0 => peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_0_tr0,
      INNER_LOOP4_C_0_tr0 => INNER_LOOP4_nor_tmp
    );
  fsm_output <= peaseNTT_core_core_fsm_inst_fsm_output;
  peaseNTT_core_core_fsm_inst_INNER_LOOP1_C_0_tr0 <= NOT(INNER_LOOP1_stage_0 OR INNER_LOOP1_stage_0_2
      OR INNER_LOOP1_stage_0_3 OR INNER_LOOP1_stage_0_4 OR INNER_LOOP1_stage_0_5
      OR INNER_LOOP1_stage_0_6 OR INNER_LOOP1_stage_0_7 OR INNER_LOOP1_stage_0_8
      OR INNER_LOOP1_stage_0_9);
  peaseNTT_core_core_fsm_inst_STAGE_LOOP_C_2_tr0 <= z_out_44(2);
  peaseNTT_core_core_fsm_inst_INNER_LOOP3_C_0_tr0 <= NOT(INNER_LOOP3_stage_0 OR INNER_LOOP1_stage_0_2
      OR INNER_LOOP1_stage_0_3 OR INNER_LOOP1_stage_0_4 OR INNER_LOOP1_stage_0_5
      OR INNER_LOOP1_stage_0_6 OR INNER_LOOP1_stage_0_7 OR INNER_LOOP1_stage_0_8
      OR INNER_LOOP1_stage_0_9);

  or_39_rmff <= ((INNER_LOOP4_stage_0 OR INNER_LOOP4_stage_0_2) AND (fsm_output(7)))
      OR ((INNER_LOOP1_stage_0_10 OR INNER_LOOP1_stage_0_9) AND or_dcpl_14) OR ((INNER_LOOP2_stage_0_2
      OR INNER_LOOP2_stage_0) AND (fsm_output(4)));
  or_52_rmff <= INNER_LOOP1_INNER_LOOP1_and_8_cse OR INNER_LOOP2_INNER_LOOP2_and_1_cse;
  or_112_rmff <= and_206_cse OR and_207_cse;
  or_182_rmff <= ((INNER_LOOP4_stage_0_2 OR INNER_LOOP4_stage_0_4 OR INNER_LOOP4_stage_0_3)
      AND (fsm_output(7))) OR ((INNER_LOOP1_stage_0_2 OR INNER_LOOP1_stage_0_4 OR
      INNER_LOOP1_stage_0_3) AND or_dcpl_14) OR ((INNER_LOOP2_stage_0_2 OR INNER_LOOP2_stage_0_4
      OR INNER_LOOP2_stage_0_3) AND (fsm_output(4)));
  mult_z_mul_cmp_1_b <= reg_mult_z_mul_cmp_1_b_cse;
  INNER_LOOP2_INNER_LOOP2_and_1_cse <= INNER_LOOP2_stage_0 AND (fsm_output(4));
  INNER_LOOP1_INNER_LOOP1_and_8_cse <= INNER_LOOP4_stage_0 AND (fsm_output(7));
  or_28_nl <= (NOT INNER_LOOP1_stage_0_2) OR INNER_LOOP1_r_asn_11_itm_1;
  INNER_LOOP1_r_15_2_sva_12_0_mx1 <= MUX_v_13_2_2(INNER_LOOP1_r_15_2_sva_1_1_12_0,
      INNER_LOOP1_r_15_2_sva_12_0, or_28_nl);
  mult_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_7_z_oreg), 32));
  mult_1_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_1_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_5_z_oreg), 32));
  mult_2_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_2_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_3_z_oreg), 32));
  mult_3_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_3_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_1_z_oreg), 32));
  mult_3_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_16, mult_3_res_sva_1, reg_mult_3_slc_32_svs_st_1_cse);
  mult_2_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_17, mult_2_res_sva_1, reg_mult_2_slc_32_svs_st_1_cse);
  mult_1_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_18, mult_1_res_sva_1, reg_mult_1_slc_32_svs_st_1_cse);
  mult_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_19, mult_res_sva_1, reg_mult_slc_32_svs_st_1_cse);
  or_31_nl <= (NOT INNER_LOOP2_stage_0_2) OR INNER_LOOP2_r_asn_10_itm_1;
  INNER_LOOP2_r_15_2_sva_12_0_mx1 <= MUX_v_13_2_2(INNER_LOOP2_r_15_2_sva_1_1_12_0,
      INNER_LOOP2_r_15_2_sva_12_0, or_31_nl);
  mult_4_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_4_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_7_z_oreg), 32));
  mult_5_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_5_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_5_z_oreg), 32));
  mult_6_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_6_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_3_z_oreg), 32));
  mult_7_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_7_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_1_z_oreg), 32));
  mult_7_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_16, mult_7_res_sva_1, mult_7_slc_32_svs_st_1);
  mult_6_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_18, mult_6_res_sva_1, mult_6_slc_32_svs_st_1);
  mult_5_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_22, mult_5_res_sva_1, mult_5_slc_32_svs_st_1);
  mult_4_res_lpi_3_dfm_mx0 <= MUX_v_32_2_2(z_out_23, mult_4_res_sva_1, mult_4_slc_32_svs_st_1);
  or_33_nl <= (NOT INNER_LOOP1_stage_0_2) OR INNER_LOOP3_r_asn_14_itm_1;
  INNER_LOOP3_r_15_2_sva_12_0_mx1 <= MUX_v_13_2_2(INNER_LOOP3_r_15_2_sva_1_1_12_0,
      INNER_LOOP3_r_15_2_sva_12_0, or_33_nl);
  mult_8_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_3_z_oreg), 32));
  mult_9_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_1_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_5_z_oreg), 32));
  mult_10_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_2_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_1_z_oreg), 32));
  mult_11_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_mult_3_z_asn_itm_3_cse)
      - UNSIGNED(mult_z_mul_cmp_7_z_oreg), 32));
  or_35_nl <= (NOT INNER_LOOP4_stage_0_2) OR INNER_LOOP4_r_asn_18_itm_1;
  INNER_LOOP4_r_15_2_sva_12_0_mx1 <= MUX_v_13_2_2(INNER_LOOP4_r_15_2_sva_1_1_12_0,
      INNER_LOOP4_r_15_2_sva_12_0, or_35_nl);
  mult_12_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_12_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_3_z_oreg), 32));
  mult_13_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_13_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_7_z_oreg), 32));
  mult_14_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_14_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_1_z_oreg), 32));
  mult_15_res_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_15_z_asn_itm_3)
      - UNSIGNED(mult_z_mul_cmp_5_z_oreg), 32));
  mult_11_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_16, mult_11_res_sva_1, reg_mult_3_slc_32_svs_st_1_cse);
  mult_10_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_18, mult_10_res_sva_1, reg_mult_2_slc_32_svs_st_1_cse);
  mult_9_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_20, mult_9_res_sva_1, reg_mult_1_slc_32_svs_st_1_cse);
  mult_8_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_21, mult_8_res_sva_1, reg_mult_slc_32_svs_st_1_cse);
  mult_15_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_16, mult_15_res_sva_1, mult_15_slc_32_svs_st_1);
  mult_14_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_18, mult_14_res_sva_1, mult_14_slc_32_svs_st_1);
  mult_13_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_23, mult_13_res_sva_1, mult_13_slc_32_svs_st_1);
  mult_12_res_lpi_2_dfm_mx0 <= MUX_v_32_2_2(z_out_26, mult_12_res_sva_1, mult_12_slc_32_svs_st_1);
  INNER_LOOP4_nor_tmp <= NOT(INNER_LOOP4_stage_0 OR INNER_LOOP4_stage_0_2 OR INNER_LOOP4_stage_0_3
      OR INNER_LOOP4_stage_0_4 OR INNER_LOOP4_stage_0_5 OR INNER_LOOP4_stage_0_6
      OR INNER_LOOP4_stage_0_7 OR INNER_LOOP4_stage_0_8 OR INNER_LOOP4_stage_0_9);
  INNER_LOOP2_nor_tmp <= NOT(INNER_LOOP2_stage_0 OR INNER_LOOP2_stage_0_2 OR INNER_LOOP2_stage_0_3
      OR INNER_LOOP2_stage_0_4 OR INNER_LOOP2_stage_0_5 OR INNER_LOOP2_stage_0_6
      OR INNER_LOOP2_stage_0_7 OR INNER_LOOP2_stage_0_8 OR INNER_LOOP2_stage_0_9);
  or_dcpl_2 <= INNER_LOOP1_stage_0_4 OR INNER_LOOP2_stage_0_4 OR INNER_LOOP4_stage_0_4;
  or_dcpl_3 <= INNER_LOOP2_stage_0_2 OR INNER_LOOP4_stage_0_2;
  or_dcpl_14 <= (fsm_output(2)) OR (fsm_output(6));
  and_206_cse <= INNER_LOOP3_stage_0 AND (fsm_output(6));
  and_207_cse <= INNER_LOOP1_stage_0 AND (fsm_output(2));
  or_tmp_153 <= (fsm_output(4)) OR (fsm_output(2));
  or_tmp_232 <= (fsm_output(1)) OR (fsm_output(5));
  butterFly1_mux_4_cse <= MUX_s_1_2_2((INNER_LOOP2_r_15_2_sva_12_0_mx1(12)), (INNER_LOOP4_r_15_2_sva_12_0_mx1(12)),
      fsm_output(7));
  butterFly1_butterFly1_or_rmff <= butterFly1_mux_4_cse OR (fsm_output(2)) OR (fsm_output(6));
  butterFly1_mux1h_1_rmff <= MUX1HOT_v_12_4_2((butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_7(12
      DOWNTO 1)), (INNER_LOOP2_r_15_2_sva_12_0_mx1(11 DOWNTO 0)), (butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_7(12
      DOWNTO 1)), (INNER_LOOP4_r_15_2_sva_12_0_mx1(11 DOWNTO 0)), STD_LOGIC_VECTOR'(
      (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6)) & (fsm_output(7))));
  butterFly1_mux_5_cse <= MUX_s_1_2_2((butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_7(0)),
      (butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_7(0)), fsm_output(6));
  butterFly1_nor_1_cse <= NOT((fsm_output(4)) OR (fsm_output(7)));
  butterFly1_butterFly1_and_4_rmff <= butterFly1_mux_5_cse AND butterFly1_nor_1_cse;
  butterFly1_nor_2_cse <= NOT((fsm_output(2)) OR (fsm_output(6)));
  butterFly1_butterFly1_and_5_rmff <= butterFly1_mux_4_cse AND butterFly1_nor_2_cse;
  butterFly1_butterFly1_or_1_rmff <= butterFly1_mux_5_cse OR (fsm_output(4)) OR (fsm_output(7));
  butterFly1_and_ssc <= (NOT (modulo_sub_base_sva_1(31))) AND (fsm_output(2));
  butterFly1_and_ssc_2 <= (NOT (modulo_sub_base_8_sva_1(31))) AND (fsm_output(6));
  butterFly1_butterFly1_butterFly1_and_rmff <= or_dcpl_14 AND INNER_LOOP1_stage_0_9;
  butterFly1_1_and_ssc <= (NOT (modulo_sub_base_1_sva_1(31))) AND (fsm_output(2));
  butterFly1_1_and_ssc_2 <= (NOT (modulo_sub_base_9_sva_1(31))) AND (fsm_output(6));
  butterFly1_2_and_ssc <= (NOT (modulo_sub_base_2_sva_1(31))) AND (fsm_output(2));
  butterFly1_2_and_ssc_2 <= (NOT (modulo_sub_base_10_sva_1(31))) AND (fsm_output(6));
  butterFly1_3_and_ssc <= (NOT (modulo_sub_base_3_sva_1(31))) AND (fsm_output(2));
  butterFly1_3_and_ssc_2 <= (NOT (modulo_sub_base_11_sva_1(31))) AND (fsm_output(6));
  butterFly1_3_f2_mux_16_cse <= MUX_s_1_2_2((INNER_LOOP1_r_15_2_sva_12_0_mx1(12)),
      (INNER_LOOP3_r_15_2_sva_12_0_mx1(12)), fsm_output(6));
  butterFly1_3_f2_butterFly1_3_f2_and_10_rmff <= butterFly1_3_f2_mux_16_cse AND butterFly1_nor_1_cse;
  butterFly1_3_f2_mux1h_rmff <= MUX1HOT_v_12_4_2((INNER_LOOP1_r_15_2_sva_12_0_mx1(11
      DOWNTO 0)), (butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_7(12 DOWNTO 1)),
      (INNER_LOOP3_r_15_2_sva_12_0_mx1(11 DOWNTO 0)), (butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_7(12
      DOWNTO 1)), STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  butterFly1_3_f2_mux_17_cse <= MUX_s_1_2_2((butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_7(0)),
      (butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_7(0)), fsm_output(7));
  butterFly1_3_f2_butterFly1_3_f2_or_6_rmff <= butterFly1_3_f2_mux_17_cse OR (fsm_output(2))
      OR (fsm_output(6));
  butterFly1_3_f2_butterFly1_3_f2_or_7_rmff <= butterFly1_3_f2_mux_16_cse OR (fsm_output(4))
      OR (fsm_output(7));
  butterFly1_3_f2_butterFly1_3_f2_and_11_rmff <= butterFly1_3_f2_mux_17_cse AND butterFly1_nor_2_cse;
  butterFly1_2_f1_and_ssc <= (NOT (modulo_sub_base_4_sva_1(31))) AND (fsm_output(4));
  butterFly1_2_f1_and_ssc_2 <= (NOT (modulo_sub_base_12_sva_1(31))) AND (fsm_output(7));
  butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff <= NOT(((NOT INNER_LOOP4_stage_0_9)
      AND (fsm_output(7))) OR butterFly1_nor_1_cse OR ((NOT INNER_LOOP2_stage_0_9)
      AND (fsm_output(4))));
  butterFly1_2_f2_and_ssc <= (NOT (modulo_sub_base_5_sva_1(31))) AND (fsm_output(4));
  butterFly1_2_f2_and_ssc_2 <= (NOT (modulo_sub_base_13_sva_1(31))) AND (fsm_output(7));
  butterFly1_3_f1_and_ssc <= (NOT (modulo_sub_base_6_sva_1(31))) AND (fsm_output(4));
  butterFly1_3_f1_and_ssc_2 <= (NOT (modulo_sub_base_14_sva_1(31))) AND (fsm_output(7));
  butterFly1_3_f2_and_ssc <= (NOT (modulo_sub_base_7_sva_1(31))) AND (fsm_output(4));
  butterFly1_3_f2_and_ssc_2 <= (NOT (modulo_sub_base_15_sva_1(31))) AND (fsm_output(7));
  INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_nor_1_rmff <= NOT((fsm_output(2)) OR (fsm_output(4))
      OR (fsm_output(6)) OR (fsm_output(7)));
  INNER_LOOP1_tw_and_nl <= operator_34_true_return_14_2_sva AND INNER_LOOP1_r_15_2_sva_12_0_mx1;
  INNER_LOOP2_tw_and_nl <= operator_34_true_1_lshift_psp_13_2_sva AND (INNER_LOOP2_r_15_2_sva_12_0_mx1(11
      DOWNTO 0));
  INNER_LOOP1_tw_h_mux1h_rmff <= MUX1HOT_v_13_4_2(INNER_LOOP1_tw_and_nl, ((INNER_LOOP2_r_15_2_sva_12_0_mx1(12))
      & INNER_LOOP2_tw_and_nl), INNER_LOOP3_r_15_2_sva_12_0_mx1, INNER_LOOP4_r_15_2_sva_12_0_mx1,
      STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6)) & (fsm_output(7))));
  butterFly2_2_tw_butterFly2_2_tw_nor_rmff <= NOT(CONV_SL_1_1(fsm_output(7 DOWNTO
      6)/=STD_LOGIC_VECTOR'("00")));
  butterFly2_2_tw_butterFly2_2_tw_mux_rmff <= MUX_v_13_2_2(INNER_LOOP3_r_15_2_sva_12_0_mx1,
      INNER_LOOP4_r_15_2_sva_12_0_mx1, fsm_output(7));
  yt_rsc_0_0_i_adra_d <= butterFly1_butterFly1_or_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_and_4_rmff & butterFly1_butterFly1_and_5_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_or_1_rmff;
  butterFly1_butterFly1_and_nl <= (z_out_6(31)) AND (NOT(butterFly1_and_ssc OR butterFly1_and_ssc_2));
  butterFly1_or_nl <= ((modulo_sub_base_sva_1(31)) AND (fsm_output(2))) OR ((modulo_sub_base_8_sva_1(31))
      AND (fsm_output(6)));
  butterFly1_mux1h_4_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_sva_1(30 DOWNTO 0)),
      (z_out_6(30 DOWNTO 0)), (modulo_sub_base_8_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_and_ssc & butterFly1_or_nl & butterFly1_and_ssc_2));
  modulo_add_qif_mux_2_nl <= MUX_v_32_2_2(modulo_add_base_sva_1, modulo_add_base_8_sva_1,
      fsm_output(6));
  acc_25_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_qif_mux_2_nl &
      '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  butterFly1_and_4_nl <= (NOT z_out_41_32) AND (fsm_output(2));
  butterFly1_or_1_nl <= (z_out_41_32 AND (fsm_output(2))) OR (z_out_41_32 AND (fsm_output(6)));
  butterFly1_and_6_nl <= (NOT z_out_41_32) AND (fsm_output(6));
  butterFly1_mux1h_9_nl <= MUX1HOT_v_32_3_2(modulo_add_base_sva_1, (acc_25_nl(32
      DOWNTO 1)), modulo_add_base_8_sva_1, STD_LOGIC_VECTOR'( butterFly1_and_4_nl
      & butterFly1_or_1_nl & butterFly1_and_6_nl));
  yt_rsc_0_0_i_da_d <= butterFly1_butterFly1_and_nl & butterFly1_mux1h_4_nl & butterFly1_mux1h_9_nl;
  yt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_52_rmff,
      1),2));
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_1_i_adra_d <= butterFly1_butterFly1_or_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_and_4_rmff & butterFly1_butterFly1_and_5_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_or_1_rmff;
  butterFly1_1_butterFly1_1_and_nl <= (z_out_15(31)) AND (NOT(butterFly1_1_and_ssc
      OR butterFly1_1_and_ssc_2));
  butterFly1_1_or_nl <= ((modulo_sub_base_1_sva_1(31)) AND (fsm_output(2))) OR ((modulo_sub_base_9_sva_1(31))
      AND (fsm_output(6)));
  butterFly1_1_mux1h_4_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_1_sva_1(30 DOWNTO
      0)), (z_out_15(30 DOWNTO 0)), (modulo_sub_base_9_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_1_and_ssc & butterFly1_1_or_nl & butterFly1_1_and_ssc_2));
  butterFly1_1_and_4_nl <= (NOT z_out_38_32) AND (fsm_output(2));
  butterFly1_1_and_5_nl <= z_out_38_32 AND (fsm_output(2));
  butterFly1_1_and_6_nl <= (NOT z_out_38_32) AND (fsm_output(6));
  butterFly1_1_and_7_nl <= z_out_38_32 AND (fsm_output(6));
  butterFly1_1_mux1h_9_nl <= MUX1HOT_v_32_4_2(modulo_add_base_1_sva_1, z_out_21,
      modulo_add_base_9_sva_1, z_out_19, STD_LOGIC_VECTOR'( butterFly1_1_and_4_nl
      & butterFly1_1_and_5_nl & butterFly1_1_and_6_nl & butterFly1_1_and_7_nl));
  yt_rsc_0_1_i_da_d <= butterFly1_1_butterFly1_1_and_nl & butterFly1_1_mux1h_4_nl
      & butterFly1_1_mux1h_9_nl;
  yt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_52_rmff,
      1),2));
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_2_i_adra_d <= butterFly1_butterFly1_or_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_and_4_rmff & butterFly1_butterFly1_and_5_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_or_1_rmff;
  butterFly1_2_butterFly1_2_and_nl <= (z_out_7(31)) AND (NOT(butterFly1_2_and_ssc
      OR butterFly1_2_and_ssc_2));
  butterFly1_2_or_nl <= ((modulo_sub_base_2_sva_1(31)) AND (fsm_output(2))) OR ((modulo_sub_base_10_sva_1(31))
      AND (fsm_output(6)));
  butterFly1_2_mux1h_4_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_2_sva_1(30 DOWNTO
      0)), (z_out_7(30 DOWNTO 0)), (modulo_sub_base_10_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_2_and_ssc & butterFly1_2_or_nl & butterFly1_2_and_ssc_2));
  butterFly1_2_and_4_nl <= (NOT z_out_36_32) AND (fsm_output(2));
  butterFly1_2_and_5_nl <= z_out_36_32 AND (fsm_output(2));
  butterFly1_2_and_6_nl <= (NOT z_out_36_32) AND (fsm_output(6));
  butterFly1_2_and_7_nl <= z_out_36_32 AND (fsm_output(6));
  butterFly1_2_mux1h_9_nl <= MUX1HOT_v_32_4_2(modulo_add_base_2_sva_1, z_out_20,
      modulo_add_base_10_sva_1, z_out_24, STD_LOGIC_VECTOR'( butterFly1_2_and_4_nl
      & butterFly1_2_and_5_nl & butterFly1_2_and_6_nl & butterFly1_2_and_7_nl));
  yt_rsc_0_2_i_da_d <= butterFly1_2_butterFly1_2_and_nl & butterFly1_2_mux1h_4_nl
      & butterFly1_2_mux1h_9_nl;
  yt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_52_rmff,
      1),2));
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_3_i_adra_d <= butterFly1_butterFly1_or_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_and_4_rmff & butterFly1_butterFly1_and_5_rmff & butterFly1_mux1h_1_rmff
      & butterFly1_butterFly1_or_1_rmff;
  butterFly1_3_butterFly1_3_and_nl <= (z_out_5(31)) AND (NOT(butterFly1_3_and_ssc
      OR butterFly1_3_and_ssc_2));
  butterFly1_3_or_nl <= ((modulo_sub_base_3_sva_1(31)) AND (fsm_output(2))) OR ((modulo_sub_base_11_sva_1(31))
      AND (fsm_output(6)));
  butterFly1_3_mux1h_4_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_3_sva_1(30 DOWNTO
      0)), (z_out_5(30 DOWNTO 0)), (modulo_sub_base_11_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_3_and_ssc & butterFly1_3_or_nl & butterFly1_3_and_ssc_2));
  butterFly1_3_and_4_nl <= (NOT z_out_39_32) AND (fsm_output(2));
  butterFly1_3_and_5_nl <= z_out_39_32 AND (fsm_output(2));
  butterFly1_3_and_6_nl <= (NOT z_out_39_32) AND (fsm_output(6));
  butterFly1_3_and_7_nl <= z_out_39_32 AND (fsm_output(6));
  butterFly1_3_mux1h_16_nl <= MUX1HOT_v_32_4_2(modulo_add_base_3_sva_1, z_out_24,
      modulo_add_base_11_sva_1, z_out_17, STD_LOGIC_VECTOR'( butterFly1_3_and_4_nl
      & butterFly1_3_and_5_nl & butterFly1_3_and_6_nl & butterFly1_3_and_7_nl));
  yt_rsc_0_3_i_da_d <= butterFly1_3_butterFly1_3_and_nl & butterFly1_3_mux1h_4_nl
      & butterFly1_3_mux1h_16_nl;
  yt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_52_rmff,
      1),2));
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_butterFly1_butterFly1_and_rmff
      & butterFly1_butterFly1_butterFly1_and_rmff);
  xt_rsc_0_0_i_adra_d <= butterFly1_3_f2_butterFly1_3_f2_and_10_rmff & butterFly1_3_f2_mux1h_rmff
      & butterFly1_3_f2_butterFly1_3_f2_or_6_rmff & butterFly1_3_f2_butterFly1_3_f2_or_7_rmff
      & butterFly1_3_f2_mux1h_rmff & butterFly1_3_f2_butterFly1_3_f2_and_11_rmff;
  butterFly1_2_f1_and_4_nl <= (NOT z_out_35_32) AND (fsm_output(4));
  butterFly1_2_f1_and_5_nl <= z_out_35_32 AND (fsm_output(4));
  butterFly1_2_f1_and_6_nl <= (NOT z_out_35_32) AND (fsm_output(7));
  butterFly1_2_f1_and_7_nl <= z_out_35_32 AND (fsm_output(7));
  butterFly1_2_f1_mux1h_2_nl <= MUX1HOT_v_32_4_2(modulo_add_base_4_sva_1, z_out_26,
      modulo_add_base_12_sva_1, z_out_22, STD_LOGIC_VECTOR'( butterFly1_2_f1_and_4_nl
      & butterFly1_2_f1_and_5_nl & butterFly1_2_f1_and_6_nl & butterFly1_2_f1_and_7_nl));
  butterFly1_2_f1_butterFly1_2_f1_and_nl <= (z_out_12(31)) AND (NOT(butterFly1_2_f1_and_ssc
      OR butterFly1_2_f1_and_ssc_2));
  butterFly1_2_f1_or_nl <= ((modulo_sub_base_4_sva_1(31)) AND (fsm_output(4))) OR
      ((modulo_sub_base_12_sva_1(31)) AND (fsm_output(7)));
  butterFly1_2_f1_mux1h_11_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_4_sva_1(30 DOWNTO
      0)), (z_out_12(30 DOWNTO 0)), (modulo_sub_base_12_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_2_f1_and_ssc & butterFly1_2_f1_or_nl & butterFly1_2_f1_and_ssc_2));
  xt_rsc_0_0_i_da_d <= butterFly1_2_f1_mux1h_2_nl & butterFly1_2_f1_butterFly1_2_f1_and_nl
      & butterFly1_2_f1_mux1h_11_nl;
  xt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_112_rmff,
      1),2));
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_1_i_adra_d <= butterFly1_3_f2_butterFly1_3_f2_and_10_rmff & butterFly1_3_f2_mux1h_rmff
      & butterFly1_3_f2_butterFly1_3_f2_or_6_rmff & butterFly1_3_f2_butterFly1_3_f2_or_7_rmff
      & butterFly1_3_f2_mux1h_rmff & butterFly1_3_f2_butterFly1_3_f2_and_11_rmff;
  modulo_add_5_qif_mux_2_nl <= MUX_v_32_2_2(modulo_add_base_5_sva_1, modulo_add_base_13_sva_1,
      fsm_output(7));
  acc_28_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_5_qif_mux_2_nl
      & '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  butterFly1_2_f2_and_4_nl <= (NOT z_out_42_32) AND (fsm_output(4));
  butterFly1_2_f2_or_nl <= (z_out_42_32 AND (fsm_output(4))) OR (z_out_40_32 AND
      (fsm_output(7)));
  butterFly1_2_f2_and_6_nl <= (NOT z_out_40_32) AND (fsm_output(7));
  butterFly1_2_f2_mux1h_2_nl <= MUX1HOT_v_32_3_2(modulo_add_base_5_sva_1, (acc_28_nl(32
      DOWNTO 1)), modulo_add_base_13_sva_1, STD_LOGIC_VECTOR'( butterFly1_2_f2_and_4_nl
      & butterFly1_2_f2_or_nl & butterFly1_2_f2_and_6_nl));
  butterFly1_2_f2_butterFly1_2_f2_and_nl <= (z_out_14(31)) AND (NOT(butterFly1_2_f2_and_ssc
      OR butterFly1_2_f2_and_ssc_2));
  butterFly1_2_f2_or_1_nl <= ((modulo_sub_base_5_sva_1(31)) AND (fsm_output(4)))
      OR ((modulo_sub_base_13_sva_1(31)) AND (fsm_output(7)));
  butterFly1_2_f2_mux1h_5_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_5_sva_1(30 DOWNTO
      0)), (z_out_14(30 DOWNTO 0)), (modulo_sub_base_13_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_2_f2_and_ssc & butterFly1_2_f2_or_1_nl & butterFly1_2_f2_and_ssc_2));
  xt_rsc_0_1_i_da_d <= butterFly1_2_f2_mux1h_2_nl & butterFly1_2_f2_butterFly1_2_f2_and_nl
      & butterFly1_2_f2_mux1h_5_nl;
  xt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_112_rmff,
      1),2));
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_2_i_adra_d <= butterFly1_3_f2_butterFly1_3_f2_and_10_rmff & butterFly1_3_f2_mux1h_rmff
      & butterFly1_3_f2_butterFly1_3_f2_or_6_rmff & butterFly1_3_f2_butterFly1_3_f2_or_7_rmff
      & butterFly1_3_f2_mux1h_rmff & butterFly1_3_f2_butterFly1_3_f2_and_11_rmff;
  modulo_add_6_qif_mux_2_nl <= MUX_v_32_2_2(modulo_add_base_6_sva_1, modulo_add_base_14_sva_1,
      fsm_output(7));
  acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_6_qif_mux_2_nl
      & '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  butterFly1_3_f1_and_4_nl <= (NOT z_out_40_32) AND (fsm_output(4));
  butterFly1_3_f1_or_nl <= (z_out_40_32 AND (fsm_output(4))) OR (z_out_42_32 AND
      (fsm_output(7)));
  butterFly1_3_f1_and_6_nl <= (NOT z_out_42_32) AND (fsm_output(7));
  butterFly1_3_f1_mux1h_2_nl <= MUX1HOT_v_32_3_2(modulo_add_base_6_sva_1, (acc_13_nl(32
      DOWNTO 1)), modulo_add_base_14_sva_1, STD_LOGIC_VECTOR'( butterFly1_3_f1_and_4_nl
      & butterFly1_3_f1_or_nl & butterFly1_3_f1_and_6_nl));
  butterFly1_3_f1_butterFly1_3_f1_and_nl <= (z_out_29(31)) AND (NOT(butterFly1_3_f1_and_ssc
      OR butterFly1_3_f1_and_ssc_2));
  butterFly1_3_f1_or_1_nl <= ((modulo_sub_base_6_sva_1(31)) AND (fsm_output(4)))
      OR ((modulo_sub_base_14_sva_1(31)) AND (fsm_output(7)));
  butterFly1_3_f1_mux1h_11_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_6_sva_1(30 DOWNTO
      0)), (z_out_29(30 DOWNTO 0)), (modulo_sub_base_14_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_3_f1_and_ssc & butterFly1_3_f1_or_1_nl & butterFly1_3_f1_and_ssc_2));
  xt_rsc_0_2_i_da_d <= butterFly1_3_f1_mux1h_2_nl & butterFly1_3_f1_butterFly1_3_f1_and_nl
      & butterFly1_3_f1_mux1h_11_nl;
  xt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_112_rmff,
      1),2));
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_3_i_adra_d <= butterFly1_3_f2_butterFly1_3_f2_and_10_rmff & butterFly1_3_f2_mux1h_rmff
      & butterFly1_3_f2_butterFly1_3_f2_or_6_rmff & butterFly1_3_f2_butterFly1_3_f2_or_7_rmff
      & butterFly1_3_f2_mux1h_rmff & butterFly1_3_f2_butterFly1_3_f2_and_11_rmff;
  modulo_add_7_qif_mux_2_nl <= MUX_v_32_2_2(modulo_add_base_7_sva_1, modulo_add_base_15_sva_1,
      fsm_output(7));
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_7_qif_mux_2_nl &
      '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  butterFly1_3_f2_and_4_nl <= (NOT z_out_37_32) AND (fsm_output(4));
  butterFly1_3_f2_or_nl <= (z_out_37_32 AND (fsm_output(4))) OR (z_out_37_32 AND
      (fsm_output(7)));
  butterFly1_3_f2_and_6_nl <= (NOT z_out_37_32) AND (fsm_output(7));
  butterFly1_3_f2_mux1h_6_nl <= MUX1HOT_v_32_3_2(modulo_add_base_7_sva_1, (acc_4_nl(32
      DOWNTO 1)), modulo_add_base_15_sva_1, STD_LOGIC_VECTOR'( butterFly1_3_f2_and_4_nl
      & butterFly1_3_f2_or_nl & butterFly1_3_f2_and_6_nl));
  butterFly1_3_f2_butterFly1_3_f2_and_nl <= (z_out_27(31)) AND (NOT(butterFly1_3_f2_and_ssc
      OR butterFly1_3_f2_and_ssc_2));
  butterFly1_3_f2_or_1_nl <= ((modulo_sub_base_7_sva_1(31)) AND (fsm_output(4)))
      OR ((modulo_sub_base_15_sva_1(31)) AND (fsm_output(7)));
  butterFly1_3_f2_mux1h_9_nl <= MUX1HOT_v_31_3_2((modulo_sub_base_7_sva_1(30 DOWNTO
      0)), (z_out_27(30 DOWNTO 0)), (modulo_sub_base_15_sva_1(30 DOWNTO 0)), STD_LOGIC_VECTOR'(
      butterFly1_3_f2_and_ssc & butterFly1_3_f2_or_1_nl & butterFly1_3_f2_and_ssc_2));
  xt_rsc_0_3_i_da_d <= butterFly1_3_f2_mux1h_6_nl & butterFly1_3_f2_butterFly1_3_f2_and_nl
      & butterFly1_3_f2_mux1h_9_nl;
  xt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(or_112_rmff,
      1),2));
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff
      & butterFly1_2_f1_butterFly1_2_f1_butterFly1_2_f1_nor_rmff);
  twiddle_rsc_0_0_i_radr_d <= INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_nor_1_rmff & INNER_LOOP1_tw_h_mux1h_rmff;
  twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= INNER_LOOP1_INNER_LOOP1_and_8_cse
      OR and_206_cse OR and_207_cse OR INNER_LOOP2_INNER_LOOP2_and_1_cse;
  twiddle_rsc_0_1_i_radr_d <= '0' & INNER_LOOP4_r_15_2_sva_12_0_mx1;
  twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= INNER_LOOP1_INNER_LOOP1_and_8_cse;
  twiddle_rsc_0_2_i_radr_d <= butterFly2_2_tw_butterFly2_2_tw_nor_rmff & butterFly2_2_tw_butterFly2_2_tw_mux_rmff;
  twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff <= INNER_LOOP1_INNER_LOOP1_and_8_cse
      OR and_206_cse;
  twiddle_rsc_0_3_i_radr_d <= '0' & INNER_LOOP4_r_15_2_sva_12_0_mx1;
  twiddle_h_rsc_0_0_i_radr_d <= INNER_LOOP1_tw_h_INNER_LOOP1_tw_h_nor_1_rmff & INNER_LOOP1_tw_h_mux1h_rmff;
  twiddle_h_rsc_0_1_i_radr_d <= '0' & INNER_LOOP4_r_15_2_sva_12_0_mx1;
  twiddle_h_rsc_0_2_i_radr_d <= butterFly2_2_tw_butterFly2_2_tw_nor_rmff & butterFly2_2_tw_butterFly2_2_tw_mux_rmff;
  twiddle_h_rsc_0_3_i_radr_d <= '0' & INNER_LOOP4_r_15_2_sva_12_0_mx1;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(8)) OR (fsm_output(0))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_yt_rsc_0_0_cgo_cse <= '0';
        reg_xt_rsc_triosy_0_3_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        INNER_LOOP1_stage_0 <= '0';
        INNER_LOOP1_stage_0_2 <= '0';
        INNER_LOOP1_stage_0_3 <= '0';
        INNER_LOOP1_stage_0_4 <= '0';
        INNER_LOOP1_stage_0_5 <= '0';
        INNER_LOOP1_stage_0_6 <= '0';
        INNER_LOOP1_stage_0_7 <= '0';
        INNER_LOOP1_stage_0_8 <= '0';
        INNER_LOOP1_stage_0_9 <= '0';
        INNER_LOOP1_stage_0_10 <= '0';
        INNER_LOOP2_stage_0 <= '0';
        INNER_LOOP2_stage_0_2 <= '0';
        INNER_LOOP2_stage_0_3 <= '0';
        INNER_LOOP2_stage_0_4 <= '0';
        INNER_LOOP2_stage_0_5 <= '0';
        INNER_LOOP2_stage_0_6 <= '0';
        INNER_LOOP2_stage_0_7 <= '0';
        INNER_LOOP2_stage_0_8 <= '0';
        INNER_LOOP2_stage_0_9 <= '0';
        INNER_LOOP3_stage_0 <= '0';
        INNER_LOOP4_stage_0 <= '0';
        INNER_LOOP4_stage_0_2 <= '0';
        INNER_LOOP4_stage_0_3 <= '0';
        INNER_LOOP4_stage_0_4 <= '0';
        INNER_LOOP4_stage_0_5 <= '0';
        INNER_LOOP4_stage_0_6 <= '0';
        INNER_LOOP4_stage_0_7 <= '0';
        INNER_LOOP4_stage_0_8 <= '0';
        INNER_LOOP4_stage_0_9 <= '0';
      ELSE
        reg_yt_rsc_0_0_cgo_cse <= or_39_rmff;
        reg_xt_rsc_triosy_0_3_obj_ld_cse <= INNER_LOOP4_nor_tmp AND (fsm_output(7));
        reg_ensig_cgo_cse <= or_182_rmff;
        INNER_LOOP1_stage_0 <= NOT((NOT(INNER_LOOP1_stage_0 AND (NOT (z_out_30(13)))))
            AND (fsm_output(2)));
        INNER_LOOP1_stage_0_2 <= INNER_LOOP1_mux_nl AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_3 <= INNER_LOOP1_stage_0_2 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_4 <= INNER_LOOP1_stage_0_3 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_5 <= INNER_LOOP1_stage_0_4 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_6 <= INNER_LOOP1_stage_0_5 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_7 <= INNER_LOOP1_stage_0_6 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_8 <= INNER_LOOP1_stage_0_7 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_9 <= INNER_LOOP1_stage_0_8 AND (NOT or_tmp_232);
        INNER_LOOP1_stage_0_10 <= INNER_LOOP1_stage_0_9 AND (NOT or_tmp_232);
        INNER_LOOP2_stage_0 <= NOT((NOT(INNER_LOOP2_stage_0 AND (NOT (z_out_30(13)))))
            AND (fsm_output(4)));
        INNER_LOOP2_stage_0_2 <= INNER_LOOP2_INNER_LOOP2_and_1_cse;
        INNER_LOOP2_stage_0_3 <= INNER_LOOP2_stage_0_2 AND (fsm_output(4));
        INNER_LOOP2_stage_0_4 <= INNER_LOOP2_stage_0_3 AND (fsm_output(4));
        INNER_LOOP2_stage_0_5 <= INNER_LOOP2_stage_0_4 AND (fsm_output(4));
        INNER_LOOP2_stage_0_6 <= INNER_LOOP2_stage_0_5 AND (fsm_output(4));
        INNER_LOOP2_stage_0_7 <= INNER_LOOP2_stage_0_6 AND (fsm_output(4));
        INNER_LOOP2_stage_0_8 <= INNER_LOOP2_stage_0_7 AND (fsm_output(4));
        INNER_LOOP2_stage_0_9 <= INNER_LOOP2_stage_0_8 AND (fsm_output(4));
        INNER_LOOP3_stage_0 <= NOT((NOT(INNER_LOOP3_stage_0 AND (NOT (z_out_30(13)))))
            AND (fsm_output(6)));
        INNER_LOOP4_stage_0 <= NOT((NOT(INNER_LOOP4_stage_0 AND (NOT (z_out_30(13)))))
            AND (fsm_output(7)));
        INNER_LOOP4_stage_0_2 <= INNER_LOOP1_INNER_LOOP1_and_8_cse;
        INNER_LOOP4_stage_0_3 <= INNER_LOOP4_stage_0_2 AND (fsm_output(7));
        INNER_LOOP4_stage_0_4 <= INNER_LOOP4_stage_0_3 AND (fsm_output(7));
        INNER_LOOP4_stage_0_5 <= INNER_LOOP4_stage_0_4 AND (fsm_output(7));
        INNER_LOOP4_stage_0_6 <= INNER_LOOP4_stage_0_5 AND (fsm_output(7));
        INNER_LOOP4_stage_0_7 <= INNER_LOOP4_stage_0_6 AND (fsm_output(7));
        INNER_LOOP4_stage_0_8 <= INNER_LOOP4_stage_0_7 AND (fsm_output(7));
        INNER_LOOP4_stage_0_9 <= INNER_LOOP4_stage_0_8 AND (fsm_output(7));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      c_3_1_sva <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), operator_32_false_acc_psp_sva,
          (fsm_output(5)));
      mult_z_mul_cmp_a <= MUX1HOT_v_32_3_2((xt_rsc_0_1_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_1_i_qa_d(63
          DOWNTO 32)), (yt_rsc_0_3_i_qa_d(63 DOWNTO 32)), STD_LOGIC_VECTOR'( or_dcpl_14
          & (fsm_output(4)) & (fsm_output(7))));
      mult_z_mul_cmp_b <= MUX_v_32_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_1_i_q_d,
          fsm_output(7));
      mult_z_mul_cmp_1_a <= MUX_v_32_2_2((mult_t_mul_cmp_1_z(63 DOWNTO 32)), (mult_t_mul_cmp_3_z(63
          DOWNTO 32)), fsm_output(7));
      reg_mult_z_mul_cmp_1_b_cse <= p_sva;
      mult_z_mul_cmp_2_a <= MUX1HOT_v_32_3_2((xt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_3_i_qa_d(31
          DOWNTO 0)), (yt_rsc_0_1_i_qa_d(31 DOWNTO 0)), STD_LOGIC_VECTOR'( or_dcpl_14
          & (fsm_output(4)) & (fsm_output(7))));
      mult_z_mul_cmp_2_b <= MUX_v_32_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
          or_233_nl);
      mult_z_mul_cmp_3_a <= MUX1HOT_v_32_3_2((mult_t_mul_cmp_2_z(63 DOWNTO 32)),
          (mult_t_mul_cmp_3_z(63 DOWNTO 32)), (mult_t_mul_cmp_1_z(63 DOWNTO 32)),
          STD_LOGIC_VECTOR'( or_tmp_153 & (fsm_output(6)) & (fsm_output(7))));
      mult_z_mul_cmp_4_a <= MUX1HOT_v_32_3_2((xt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_1_i_qa_d(31
          DOWNTO 0)), (yt_rsc_0_1_i_qa_d(63 DOWNTO 32)), STD_LOGIC_VECTOR'( or_dcpl_14
          & (fsm_output(4)) & (fsm_output(7))));
      mult_z_mul_cmp_4_b <= MUX_v_32_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_2_i_q_d,
          fsm_output(6));
      mult_z_mul_cmp_5_a <= MUX1HOT_v_32_3_2((mult_t_mul_cmp_3_z(63 DOWNTO 32)),
          (mult_t_mul_cmp_2_z(63 DOWNTO 32)), (mult_t_mul_cmp_z(63 DOWNTO 32)), STD_LOGIC_VECTOR'(
          or_tmp_153 & (fsm_output(6)) & (fsm_output(7))));
      mult_z_mul_cmp_6_a <= MUX1HOT_v_32_3_2((xt_rsc_0_3_i_qa_d(31 DOWNTO 0)), (yt_rsc_0_3_i_qa_d(63
          DOWNTO 32)), (yt_rsc_0_3_i_qa_d(31 DOWNTO 0)), STD_LOGIC_VECTOR'( or_dcpl_14
          & (fsm_output(4)) & (fsm_output(7))));
      mult_z_mul_cmp_6_b <= MUX_v_32_2_2(twiddle_rsc_0_0_i_q_d, twiddle_rsc_0_3_i_q_d,
          fsm_output(7));
      mult_z_mul_cmp_7_a <= MUX_v_32_2_2((mult_t_mul_cmp_z(63 DOWNTO 32)), (mult_t_mul_cmp_2_z(63
          DOWNTO 32)), fsm_output(7));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_8 = '1' ) THEN
        modulo_add_base_sva_1 <= z_out;
        modulo_add_base_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_tmp_18_sva_6_cse)
            + UNSIGNED(mult_1_res_lpi_3_dfm_mx0), 32));
        modulo_add_base_2_sva_1 <= z_out_2;
        modulo_add_base_3_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_tmp_22_sva_6_cse)
            + UNSIGNED(mult_3_res_lpi_3_dfm_mx0), 32));
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_7 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_6;
        modulo_add_base_8_sva_1 <= z_out_8;
        modulo_add_base_9_sva_1 <= z_out_10;
        modulo_add_base_10_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_tmp_20_sva_6_cse)
            + UNSIGNED(mult_10_res_lpi_2_dfm_mx0), 32));
        modulo_add_base_11_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_tmp_22_sva_6_cse)
            + UNSIGNED(mult_11_res_lpi_2_dfm_mx0), 32));
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_7 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modulo_sub_base_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_1_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_2_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_3_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_8_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_9_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_10_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_11_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( INNER_LOOP1_stage_0_8 = '1' ) THEN
        modulo_sub_base_sva_1 <= z_out_1;
        modulo_sub_base_1_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_tmp_18_sva_6_cse)
            - SIGNED(mult_1_res_lpi_3_dfm_mx0), 32));
        modulo_sub_base_2_sva_1 <= z_out_3;
        modulo_sub_base_3_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_tmp_22_sva_6_cse)
            - SIGNED(mult_3_res_lpi_3_dfm_mx0), 32));
        modulo_sub_base_8_sva_1 <= z_out_9;
        modulo_sub_base_9_sva_1 <= z_out_11;
        modulo_sub_base_10_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_tmp_20_sva_6_cse)
            - SIGNED(mult_10_res_lpi_2_dfm_mx0), 32));
        modulo_sub_base_11_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_tmp_22_sva_6_cse)
            - SIGNED(mult_11_res_lpi_2_dfm_mx0), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_7 = '1' ) THEN
        mult_res_sva_1 <= mult_res_sva_2;
        mult_1_res_sva_1 <= mult_1_res_sva_2;
        mult_2_res_sva_1 <= mult_2_res_sva_2;
        mult_3_res_sva_1 <= mult_3_res_sva_2;
        reg_tmp_22_sva_6_cse <= tmp_22_sva_5;
        reg_tmp_20_sva_6_cse <= tmp_20_sva_5;
        reg_tmp_18_sva_6_cse <= tmp_18_sva_5;
        reg_tmp_16_sva_6_cse <= tmp_16_sva_5;
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_6 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_5;
        mult_8_res_sva_1 <= mult_8_res_sva_2;
        mult_9_res_sva_1 <= mult_9_res_sva_2;
        mult_10_res_sva_1 <= mult_10_res_sva_2;
        mult_11_res_sva_1 <= mult_11_res_sva_2;
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_6 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_mult_3_slc_32_svs_st_1_cse <= '0';
        reg_mult_2_slc_32_svs_st_1_cse <= '0';
        reg_mult_1_slc_32_svs_st_1_cse <= '0';
        reg_mult_slc_32_svs_st_1_cse <= '0';
      ELSIF ( INNER_LOOP1_stage_0_7 = '1' ) THEN
        reg_mult_3_slc_32_svs_st_1_cse <= z_out_31_32;
        reg_mult_2_slc_32_svs_st_1_cse <= z_out_32_32;
        reg_mult_1_slc_32_svs_st_1_cse <= z_out_33_32;
        reg_mult_slc_32_svs_st_1_cse <= z_out_34_32;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT((NOT INNER_LOOP1_r_asn_11_itm_1) AND INNER_LOOP1_stage_0_2))
          AND (fsm_output(2)))) = '1' ) THEN
        INNER_LOOP1_r_15_2_sva_12_0 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"),
            INNER_LOOP1_r_15_2_sva_12_0_mx1, (fsm_output(2)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (INNER_LOOP1_stage_0 AND (NOT (z_out_30(13)))) = '1' ) THEN
        INNER_LOOP1_r_15_2_sva_1_1_12_0 <= z_out_30(12 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP1_r_asn_11_itm_1 <= '0';
      ELSIF ( INNER_LOOP1_stage_0 = '1' ) THEN
        INNER_LOOP1_r_asn_11_itm_1 <= z_out_30(13);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(2)) = '0' ) THEN
        operator_34_true_return_14_2_sva <= z_out_43(14 DOWNTO 2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(1)) = '1' ) THEN
        operator_32_false_acc_psp_sva <= z_out_44;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_6 = '1' ) THEN
        reg_mult_3_z_asn_itm_3_cse <= mult_3_z_asn_itm_2;
        reg_mult_2_z_asn_itm_3_cse <= mult_2_z_asn_itm_2;
        reg_mult_1_z_asn_itm_3_cse <= mult_1_z_asn_itm_2;
        reg_mult_z_asn_itm_3_cse <= mult_z_asn_itm_2;
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_5 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_4;
        tmp_22_sva_5 <= tmp_22_sva_4;
        tmp_20_sva_5 <= tmp_20_sva_4;
        tmp_18_sva_5 <= tmp_18_sva_4;
        tmp_16_sva_5 <= tmp_16_sva_4;
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_5 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_5 = '1' ) THEN
        mult_3_z_asn_itm_2 <= mult_3_z_asn_itm_1;
        mult_2_z_asn_itm_2 <= mult_2_z_asn_itm_1;
        mult_1_z_asn_itm_2 <= mult_1_z_asn_itm_1;
        mult_z_asn_itm_2 <= mult_z_asn_itm_1;
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_4 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_3;
        tmp_22_sva_4 <= reg_tmp_22_sva_3_cse;
        tmp_20_sva_4 <= reg_tmp_20_sva_3_cse;
        tmp_18_sva_4 <= reg_tmp_18_sva_3_cse;
        tmp_16_sva_4 <= reg_tmp_16_sva_3_cse;
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_4 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_2 = '1' ) THEN
        mult_3_z_asn_itm_1 <= mult_z_mul_cmp_2_z_oreg;
        mult_2_z_asn_itm_1 <= mult_z_mul_cmp_4_z_oreg;
        mult_1_z_asn_itm_1 <= mult_z_mul_cmp_6_z_oreg;
        mult_z_asn_itm_1 <= mult_z_mul_cmp_z_oreg;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_4 = '1' ) THEN
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_3 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_2;
        reg_tmp_22_sva_3_cse <= tmp_22_sva_2;
        reg_tmp_20_sva_3_cse <= tmp_20_sva_2;
        reg_tmp_18_sva_3_cse <= tmp_18_sva_2;
        reg_tmp_16_sva_3_cse <= tmp_16_sva_2;
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_3 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_3 = '1' ) THEN
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_2 <= butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_1;
        tmp_22_sva_2 <= tmp_22_sva_1;
        tmp_20_sva_2 <= tmp_20_sva_1;
        tmp_18_sva_2 <= tmp_18_sva_1;
        tmp_16_sva_2 <= tmp_16_sva_1;
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_2 <= butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP1_stage_0_2 = '1' ) THEN
        butterFly1_3_slc_INNER_LOOP1_r_15_2_12_0_itm_1 <= INNER_LOOP1_r_15_2_sva_12_0;
        tmp_22_sva_1 <= xt_rsc_0_2_i_qa_d(63 DOWNTO 32);
        tmp_20_sva_1 <= xt_rsc_0_0_i_qa_d(63 DOWNTO 32);
        tmp_18_sva_1 <= xt_rsc_0_2_i_qa_d(31 DOWNTO 0);
        tmp_16_sva_1 <= xt_rsc_0_0_i_qa_d(31 DOWNTO 0);
        butterFly2_3_slc_INNER_LOOP3_r_15_2_12_0_itm_1 <= INNER_LOOP3_r_15_2_sva_12_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_8 = '1' ) THEN
        modulo_add_base_4_sva_1 <= z_out;
        modulo_add_base_5_sva_1 <= z_out_2;
        modulo_add_base_6_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(tmp_4_sva_6)
            + UNSIGNED(mult_6_res_lpi_3_dfm_mx0), 32));
        modulo_add_base_7_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(tmp_6_sva_6)
            + UNSIGNED(mult_7_res_lpi_3_dfm_mx0), 32));
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_7 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modulo_sub_base_4_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_5_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_6_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_7_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( INNER_LOOP2_stage_0_8 = '1' ) THEN
        modulo_sub_base_4_sva_1 <= z_out_1;
        modulo_sub_base_5_sva_1 <= z_out_3;
        modulo_sub_base_6_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_4_sva_6)
            - SIGNED(mult_6_res_lpi_3_dfm_mx0), 32));
        modulo_sub_base_7_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_6_sva_6)
            - SIGNED(mult_7_res_lpi_3_dfm_mx0), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_7 = '1' ) THEN
        mult_4_res_sva_1 <= mult_4_res_sva_2;
        mult_5_res_sva_1 <= mult_5_res_sva_2;
        mult_6_res_sva_1 <= mult_6_res_sva_2;
        mult_7_res_sva_1 <= mult_7_res_sva_2;
        tmp_6_sva_6 <= tmp_6_sva_5;
        tmp_4_sva_6 <= tmp_4_sva_5;
        tmp_2_sva_6 <= tmp_2_sva_5;
        tmp_sva_6 <= tmp_sva_5;
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_6 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        mult_7_slc_32_svs_st_1 <= '0';
        mult_6_slc_32_svs_st_1 <= '0';
        mult_5_slc_32_svs_st_1 <= '0';
        mult_4_slc_32_svs_st_1 <= '0';
      ELSIF ( INNER_LOOP2_stage_0_7 = '1' ) THEN
        mult_7_slc_32_svs_st_1 <= z_out_31_32;
        mult_6_slc_32_svs_st_1 <= z_out_32_32;
        mult_5_slc_32_svs_st_1 <= z_out_33_32;
        mult_4_slc_32_svs_st_1 <= z_out_34_32;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT((NOT INNER_LOOP2_r_asn_10_itm_1) AND INNER_LOOP2_stage_0_2))
          AND (fsm_output(4)))) = '1' ) THEN
        INNER_LOOP2_r_15_2_sva_12_0 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"),
            INNER_LOOP2_r_15_2_sva_12_0_mx1, (fsm_output(4)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(INNER_LOOP2_nor_tmp OR (z_out_30(13)))) AND INNER_LOOP2_stage_0)
          = '1' ) THEN
        INNER_LOOP2_r_15_2_sva_1_1_12_0 <= z_out_30(12 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP2_r_asn_10_itm_1 <= '0';
      ELSIF ( INNER_LOOP2_stage_0 = '1' ) THEN
        INNER_LOOP2_r_asn_10_itm_1 <= z_out_30(13);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(4)) = '0' ) THEN
        operator_34_true_1_lshift_psp_13_2_sva <= z_out_43(13 DOWNTO 2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_6 = '1' ) THEN
        mult_7_z_asn_itm_3 <= mult_7_z_asn_itm_2;
        mult_6_z_asn_itm_3 <= mult_6_z_asn_itm_2;
        mult_5_z_asn_itm_3 <= mult_5_z_asn_itm_2;
        mult_4_z_asn_itm_3 <= mult_4_z_asn_itm_2;
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_5 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_4;
        tmp_6_sva_5 <= tmp_6_sva_4;
        tmp_4_sva_5 <= tmp_4_sva_4;
        tmp_2_sva_5 <= tmp_2_sva_4;
        tmp_sva_5 <= tmp_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_5 = '1' ) THEN
        mult_7_z_asn_itm_2 <= mult_3_z_asn_itm_1;
        mult_6_z_asn_itm_2 <= mult_2_z_asn_itm_1;
        mult_5_z_asn_itm_2 <= mult_1_z_asn_itm_1;
        mult_4_z_asn_itm_2 <= mult_z_asn_itm_1;
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_4 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_3;
        tmp_6_sva_4 <= tmp_6_sva_3;
        tmp_4_sva_4 <= tmp_4_sva_3;
        tmp_2_sva_4 <= tmp_2_sva_3;
        tmp_sva_4 <= tmp_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_4 = '1' ) THEN
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_3 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_2;
        tmp_6_sva_3 <= tmp_6_sva_2;
        tmp_4_sva_3 <= tmp_4_sva_2;
        tmp_2_sva_3 <= tmp_2_sva_2;
        tmp_sva_3 <= tmp_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_3 = '1' ) THEN
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_2 <= butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_1;
        tmp_6_sva_2 <= tmp_6_sva_1;
        tmp_4_sva_2 <= tmp_4_sva_1;
        tmp_2_sva_2 <= tmp_2_sva_1;
        tmp_sva_2 <= tmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP2_stage_0_2 = '1' ) THEN
        butterFly1_7_slc_INNER_LOOP2_r_15_2_12_0_itm_1 <= INNER_LOOP2_r_15_2_sva_12_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_dcpl_3 = '1' ) THEN
        tmp_6_sva_1 <= yt_rsc_0_2_i_qa_d(31 DOWNTO 0);
        tmp_4_sva_1 <= yt_rsc_0_0_i_qa_d(31 DOWNTO 0);
        tmp_2_sva_1 <= yt_rsc_0_2_i_qa_d(63 DOWNTO 32);
        tmp_sva_1 <= yt_rsc_0_0_i_qa_d(63 DOWNTO 32);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT((NOT INNER_LOOP3_r_asn_14_itm_1) AND INNER_LOOP1_stage_0_2))
          AND (fsm_output(6)))) = '1' ) THEN
        INNER_LOOP3_r_15_2_sva_12_0 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"),
            INNER_LOOP3_r_15_2_sva_12_0_mx1, (fsm_output(6)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (INNER_LOOP3_stage_0 AND (NOT (z_out_30(13)))) = '1' ) THEN
        INNER_LOOP3_r_15_2_sva_1_1_12_0 <= z_out_30(12 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP3_r_asn_14_itm_1 <= '0';
      ELSIF ( INNER_LOOP3_stage_0 = '1' ) THEN
        INNER_LOOP3_r_asn_14_itm_1 <= z_out_30(13);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_8 = '1' ) THEN
        modulo_add_base_12_sva_1 <= z_out_8;
        modulo_add_base_13_sva_1 <= z_out_10;
        modulo_add_base_14_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(tmp_12_sva_6)
            + UNSIGNED(mult_14_res_lpi_2_dfm_mx0), 32));
        modulo_add_base_15_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(tmp_14_sva_6)
            + UNSIGNED(mult_15_res_lpi_2_dfm_mx0), 32));
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_7 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modulo_sub_base_12_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_13_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_14_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
        modulo_sub_base_15_sva_1 <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( INNER_LOOP4_stage_0_8 = '1' ) THEN
        modulo_sub_base_12_sva_1 <= z_out_9;
        modulo_sub_base_13_sva_1 <= z_out_11;
        modulo_sub_base_14_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_12_sva_6)
            - SIGNED(mult_14_res_lpi_2_dfm_mx0), 32));
        modulo_sub_base_15_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(tmp_14_sva_6)
            - SIGNED(mult_15_res_lpi_2_dfm_mx0), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_7 = '1' ) THEN
        mult_12_res_sva_1 <= mult_12_res_sva_2;
        mult_13_res_sva_1 <= mult_13_res_sva_2;
        mult_14_res_sva_1 <= mult_14_res_sva_2;
        mult_15_res_sva_1 <= mult_15_res_sva_2;
        tmp_14_sva_6 <= tmp_14_sva_5;
        tmp_12_sva_6 <= tmp_12_sva_5;
        tmp_10_sva_6 <= tmp_10_sva_5;
        tmp_8_sva_6 <= tmp_8_sva_5;
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_6 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        mult_15_slc_32_svs_st_1 <= '0';
        mult_14_slc_32_svs_st_1 <= '0';
        mult_13_slc_32_svs_st_1 <= '0';
        mult_12_slc_32_svs_st_1 <= '0';
      ELSIF ( INNER_LOOP4_stage_0_7 = '1' ) THEN
        mult_15_slc_32_svs_st_1 <= z_out_31_32;
        mult_14_slc_32_svs_st_1 <= z_out_32_32;
        mult_13_slc_32_svs_st_1 <= z_out_33_32;
        mult_12_slc_32_svs_st_1 <= z_out_34_32;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT((NOT((NOT INNER_LOOP4_r_asn_18_itm_1) AND INNER_LOOP4_stage_0_2))
          AND (fsm_output(7)))) = '1' ) THEN
        INNER_LOOP4_r_15_2_sva_12_0 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"),
            INNER_LOOP4_r_15_2_sva_12_0_mx1, (fsm_output(7)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (INNER_LOOP4_stage_0 AND (NOT (z_out_30(13)))) = '1' ) THEN
        INNER_LOOP4_r_15_2_sva_1_1_12_0 <= z_out_30(12 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP4_r_asn_18_itm_1 <= '0';
      ELSIF ( INNER_LOOP4_stage_0 = '1' ) THEN
        INNER_LOOP4_r_asn_18_itm_1 <= z_out_30(13);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_6 = '1' ) THEN
        mult_15_z_asn_itm_3 <= mult_15_z_asn_itm_2;
        mult_14_z_asn_itm_3 <= mult_14_z_asn_itm_2;
        mult_13_z_asn_itm_3 <= mult_13_z_asn_itm_2;
        mult_12_z_asn_itm_3 <= mult_12_z_asn_itm_2;
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_5 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_4;
        tmp_14_sva_5 <= tmp_14_sva_4;
        tmp_12_sva_5 <= tmp_12_sva_4;
        tmp_10_sva_5 <= tmp_10_sva_4;
        tmp_8_sva_5 <= tmp_8_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_5 = '1' ) THEN
        mult_15_z_asn_itm_2 <= mult_1_z_asn_itm_1;
        mult_14_z_asn_itm_2 <= mult_3_z_asn_itm_1;
        mult_13_z_asn_itm_2 <= mult_z_asn_itm_1;
        mult_12_z_asn_itm_2 <= mult_2_z_asn_itm_1;
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_4 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_3;
        tmp_14_sva_4 <= tmp_14_sva_3;
        tmp_12_sva_4 <= tmp_12_sva_3;
        tmp_10_sva_4 <= tmp_10_sva_3;
        tmp_8_sva_4 <= tmp_8_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_4 = '1' ) THEN
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_3 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_2;
        tmp_14_sva_3 <= tmp_14_sva_2;
        tmp_12_sva_3 <= tmp_12_sva_2;
        tmp_10_sva_3 <= tmp_10_sva_2;
        tmp_8_sva_3 <= tmp_8_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_3 = '1' ) THEN
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_2 <= butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_1;
        tmp_14_sva_2 <= tmp_6_sva_1;
        tmp_12_sva_2 <= tmp_4_sva_1;
        tmp_10_sva_2 <= tmp_2_sva_1;
        tmp_8_sva_2 <= tmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( INNER_LOOP4_stage_0_2 = '1' ) THEN
        butterFly2_7_slc_INNER_LOOP4_r_15_2_12_0_itm_1 <= INNER_LOOP4_r_15_2_sva_12_0;
      END IF;
    END IF;
  END PROCESS;
  or_233_nl <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  INNER_LOOP1_mux_nl <= MUX_s_1_2_2(INNER_LOOP1_stage_0, INNER_LOOP3_stage_0, fsm_output(6));
  butterFly1_mux_12_cse <= MUX_v_32_2_2(reg_tmp_16_sva_6_cse, tmp_sva_6, fsm_output(4));
  butterFly1_mux_13_nl <= MUX_v_32_2_2(mult_res_lpi_3_dfm_mx0, mult_4_res_lpi_3_dfm_mx0,
      fsm_output(4));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly1_mux_12_cse) + UNSIGNED(butterFly1_mux_13_nl),
      32));
  butterFly1_mux_15_nl <= MUX_v_32_2_2((NOT mult_res_lpi_3_dfm_mx0), (NOT mult_4_res_lpi_3_dfm_mx0),
      fsm_output(4));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly1_mux_12_cse & '1')
      + UNSIGNED(butterFly1_mux_15_nl & '1'), 33));
  z_out_1 <= acc_1_nl(32 DOWNTO 1);
  butterFly1_2_mux_12_cse <= MUX_v_32_2_2(reg_tmp_20_sva_6_cse, tmp_2_sva_6, fsm_output(4));
  butterFly1_2_mux_13_nl <= MUX_v_32_2_2(mult_2_res_lpi_3_dfm_mx0, mult_5_res_lpi_3_dfm_mx0,
      fsm_output(4));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly1_2_mux_12_cse) + UNSIGNED(butterFly1_2_mux_13_nl),
      32));
  butterFly1_2_mux_15_nl <= MUX_v_32_2_2((NOT mult_2_res_lpi_3_dfm_mx0), (NOT mult_5_res_lpi_3_dfm_mx0),
      fsm_output(4));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly1_2_mux_12_cse & '1')
      + UNSIGNED(butterFly1_2_mux_15_nl & '1'), 33));
  z_out_3 <= acc_3_nl(32 DOWNTO 1);
  modulo_sub_3_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_3_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_11_sva_1(30 DOWNTO 0)), fsm_output(6));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_3_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  modulo_sub_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_sva_1(30 DOWNTO 0)), (modulo_sub_base_8_sva_1(30
      DOWNTO 0)), fsm_output(6));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  modulo_sub_2_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_2_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_10_sva_1(30 DOWNTO 0)), fsm_output(6));
  z_out_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_2_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  butterFly2_mux_4_cse <= MUX_v_32_2_2(reg_tmp_16_sva_6_cse, tmp_8_sva_6, fsm_output(7));
  butterFly2_mux_5_nl <= MUX_v_32_2_2(mult_8_res_lpi_2_dfm_mx0, mult_12_res_lpi_2_dfm_mx0,
      fsm_output(7));
  z_out_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly2_mux_4_cse) + UNSIGNED(butterFly2_mux_5_nl),
      32));
  butterFly2_mux_7_nl <= MUX_v_32_2_2((NOT mult_8_res_lpi_2_dfm_mx0), (NOT mult_12_res_lpi_2_dfm_mx0),
      fsm_output(7));
  acc_9_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly2_mux_4_cse & '1')
      + UNSIGNED(butterFly2_mux_7_nl & '1'), 33));
  z_out_9 <= acc_9_nl(32 DOWNTO 1);
  butterFly2_1_mux_4_cse <= MUX_v_32_2_2(reg_tmp_18_sva_6_cse, tmp_10_sva_6, fsm_output(7));
  butterFly2_1_mux_5_nl <= MUX_v_32_2_2(mult_9_res_lpi_2_dfm_mx0, mult_13_res_lpi_2_dfm_mx0,
      fsm_output(7));
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly2_1_mux_4_cse) + UNSIGNED(butterFly2_1_mux_5_nl),
      32));
  butterFly2_1_mux_7_nl <= MUX_v_32_2_2((NOT mult_9_res_lpi_2_dfm_mx0), (NOT mult_13_res_lpi_2_dfm_mx0),
      fsm_output(7));
  acc_11_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(butterFly2_1_mux_4_cse & '1')
      + UNSIGNED(butterFly2_1_mux_7_nl & '1'), 33));
  z_out_11 <= acc_11_nl(32 DOWNTO 1);
  modulo_sub_4_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_4_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_12_sva_1(30 DOWNTO 0)), fsm_output(7));
  z_out_12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_4_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  modulo_sub_5_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_5_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_13_sva_1(30 DOWNTO 0)), fsm_output(7));
  z_out_14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_5_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  modulo_sub_1_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_1_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_9_sva_1(30 DOWNTO 0)), fsm_output(6));
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_1_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  mult_3_if_mux1h_6_nl <= MUX1HOT_v_32_4_2(mult_3_res_sva_1, mult_7_res_sva_1, mult_11_res_sva_1,
      mult_15_res_sva_1, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_16_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_3_if_mux1h_6_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_16 <= acc_16_nl(32 DOWNTO 1);
  mult_2_if_mux_2_nl <= MUX_v_32_2_2(mult_2_res_sva_1, modulo_add_base_11_sva_1,
      fsm_output(6));
  acc_17_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_2_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_17 <= acc_17_nl(32 DOWNTO 1);
  mult_1_if_mux1h_6_nl <= MUX1HOT_v_32_4_2(mult_1_res_sva_1, mult_6_res_sva_1, mult_10_res_sva_1,
      mult_14_res_sva_1, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_18_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_1_if_mux1h_6_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_18 <= acc_18_nl(32 DOWNTO 1);
  mult_if_mux_2_nl <= MUX_v_32_2_2(mult_res_sva_1, modulo_add_base_9_sva_1, fsm_output(6));
  acc_19_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mux_2_nl & '1') +
      UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_19 <= acc_19_nl(32 DOWNTO 1);
  mult_9_if_mux_2_nl <= MUX_v_32_2_2(mult_9_res_sva_1, modulo_add_base_2_sva_1, fsm_output(2));
  acc_20_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_9_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_20 <= acc_20_nl(32 DOWNTO 1);
  mult_8_if_mux_2_nl <= MUX_v_32_2_2(mult_8_res_sva_1, modulo_add_base_1_sva_1, fsm_output(2));
  acc_21_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_8_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_21 <= acc_21_nl(32 DOWNTO 1);
  mult_5_if_mux_2_nl <= MUX_v_32_2_2(mult_5_res_sva_1, modulo_add_base_12_sva_1,
      fsm_output(7));
  acc_22_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_5_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_22 <= acc_22_nl(32 DOWNTO 1);
  mult_4_if_mux_2_nl <= MUX_v_32_2_2(mult_4_res_sva_1, mult_13_res_sva_1, fsm_output(7));
  acc_23_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_4_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_23 <= acc_23_nl(32 DOWNTO 1);
  modulo_add_10_qif_mux_2_nl <= MUX_v_32_2_2(modulo_add_base_10_sva_1, modulo_add_base_3_sva_1,
      fsm_output(2));
  acc_24_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_10_qif_mux_2_nl
      & '1') + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_24 <= acc_24_nl(32 DOWNTO 1);
  mult_12_if_mux_2_nl <= MUX_v_32_2_2(mult_12_res_sva_1, modulo_add_base_4_sva_1,
      fsm_output(4));
  acc_26_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_12_if_mux_2_nl & '1')
      + UNSIGNED((NOT p_sva) & '1'), 33));
  z_out_26 <= acc_26_nl(32 DOWNTO 1);
  modulo_sub_7_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_7_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_15_sva_1(30 DOWNTO 0)), fsm_output(7));
  z_out_27 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_7_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  modulo_sub_6_qif_mux_2_nl <= MUX_v_31_2_2((modulo_sub_base_6_sva_1(30 DOWNTO 0)),
      (modulo_sub_base_14_sva_1(30 DOWNTO 0)), fsm_output(7));
  z_out_29 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & modulo_sub_6_qif_mux_2_nl)
      + UNSIGNED(p_sva), 32));
  operator_32_false_mux1h_2_nl <= MUX1HOT_v_13_4_2(INNER_LOOP1_r_15_2_sva_12_0_mx1,
      INNER_LOOP2_r_15_2_sva_12_0_mx1, INNER_LOOP3_r_15_2_sva_12_0_mx1, INNER_LOOP4_r_15_2_sva_12_0_mx1,
      STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6)) & (fsm_output(7))));
  z_out_30 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_32_false_mux1h_2_nl),
      14) + UNSIGNED'( "00000000000001"), 14));
  mult_3_if_mux1h_7_nl <= MUX1HOT_v_32_4_2(mult_3_res_sva_2, mult_7_res_sva_2, mult_11_res_sva_2,
      mult_15_res_sva_2, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_31_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_3_if_mux1h_7_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34),
      34));
  z_out_31_32 <= acc_31_nl(33);
  mult_2_if_mux1h_4_nl <= MUX1HOT_v_32_4_2(mult_2_res_sva_2, mult_6_res_sva_2, mult_10_res_sva_2,
      mult_14_res_sva_2, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_32_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_2_if_mux1h_4_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34),
      34));
  z_out_32_32 <= acc_32_nl(33);
  mult_1_if_mux1h_7_nl <= MUX1HOT_v_32_4_2(mult_1_res_sva_2, mult_5_res_sva_2, mult_9_res_sva_2,
      mult_13_res_sva_2, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_33_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_1_if_mux1h_7_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34),
      34));
  z_out_33_32 <= acc_33_nl(33);
  mult_if_mux1h_4_nl <= MUX1HOT_v_32_4_2(mult_res_sva_2, mult_4_res_sva_2, mult_8_res_sva_2,
      mult_12_res_sva_2, STD_LOGIC_VECTOR'( (fsm_output(2)) & (fsm_output(4)) & (fsm_output(6))
      & (fsm_output(7))));
  acc_34_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mux1h_4_nl &
      '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((NOT p_sva) & '1'), 33), 34), 34));
  z_out_34_32 <= acc_34_nl(33);
  modulo_add_4_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_4_sva_1), (NOT modulo_add_base_12_sva_1),
      fsm_output(7));
  acc_35_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_4_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_35_32 <= acc_35_nl(33);
  modulo_add_2_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_2_sva_1), (NOT modulo_add_base_10_sva_1),
      fsm_output(6));
  acc_36_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_2_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_36_32 <= acc_36_nl(33);
  modulo_add_7_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_7_sva_1), (NOT modulo_add_base_15_sva_1),
      fsm_output(7));
  acc_37_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_7_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_37_32 <= acc_37_nl(33);
  modulo_add_1_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_1_sva_1), (NOT modulo_add_base_9_sva_1),
      fsm_output(6));
  acc_38_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_1_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_38_32 <= acc_38_nl(33);
  modulo_add_3_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_3_sva_1), (NOT modulo_add_base_11_sva_1),
      fsm_output(6));
  acc_39_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_3_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_39_32 <= acc_39_nl(33);
  modulo_add_13_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_13_sva_1), (NOT modulo_add_base_6_sva_1),
      fsm_output(4));
  acc_40_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_13_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_40_32 <= acc_40_nl(33);
  modulo_add_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_sva_1), (NOT modulo_add_base_8_sva_1),
      fsm_output(6));
  acc_41_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_41_32 <= acc_41_nl(33);
  modulo_add_5_mux_3_nl <= MUX_v_32_2_2((NOT modulo_add_base_5_sva_1), (NOT modulo_add_base_14_sva_1),
      fsm_output(7));
  acc_42_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & p_sva & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(modulo_add_5_mux_3_nl
      & '1'), 33), 34), 34));
  z_out_42_32 <= acc_42_nl(33);
  operator_32_false_mux_1_nl <= MUX_v_3_2_2(c_3_1_sva, ('0' & (operator_32_false_acc_psp_sva(2
      DOWNTO 1))), fsm_output(5));
  z_out_44 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_32_false_mux_1_nl)
      + UNSIGNED'( "111"), 3));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    peaseNTT
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY peaseNTT IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_wea : OUT STD_LOGIC;
    xt_rsc_0_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_web : OUT STD_LOGIC;
    xt_rsc_0_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    xt_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_1_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_wea : OUT STD_LOGIC;
    xt_rsc_0_1_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_1_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_web : OUT STD_LOGIC;
    xt_rsc_0_1_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    xt_rsc_0_2_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_2_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_wea : OUT STD_LOGIC;
    xt_rsc_0_2_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_2_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_web : OUT STD_LOGIC;
    xt_rsc_0_2_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    xt_rsc_0_3_adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_3_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_wea : OUT STD_LOGIC;
    xt_rsc_0_3_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_3_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_web : OUT STD_LOGIC;
    xt_rsc_0_3_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_0_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_1_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_2_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_0_3_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    twiddle_h_rsc_0_0_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_0_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    twiddle_h_rsc_0_1_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_1_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    twiddle_h_rsc_0_2_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_2_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    twiddle_h_rsc_0_3_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_0_3_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_0_3_lz : OUT STD_LOGIC
  );
END peaseNTT;

ARCHITECTURE v4 OF peaseNTT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_1_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_1_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_2_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_2_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_3_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_4_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_4_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_5_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_6_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_6_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_7_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_web : STD_LOGIC;
  SIGNAL yt_rsc_0_0_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_0_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_web : STD_LOGIC;
  SIGNAL yt_rsc_0_1_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_1_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_web : STD_LOGIC;
  SIGNAL yt_rsc_0_2_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_2_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_web : STD_LOGIC;
  SIGNAL yt_rsc_0_3_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_3_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;
  SIGNAL twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;

  SIGNAL yt_rsc_0_0_comp_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_1_comp_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_2_comp_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_3_comp_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en_d : IN STD_LOGIC;
      clkb_en_d : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL yt_rsc_0_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en_d : IN STD_LOGIC;
      clkb_en_d : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL yt_rsc_0_1_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en_d : IN STD_LOGIC;
      clkb_en_d : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL yt_rsc_0_2_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en_d : IN STD_LOGIC;
      clkb_en_d : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL yt_rsc_0_3_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_0_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_1_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_2_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (27 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_3_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_0_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_1_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_2_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_2_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsc_0_3_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsc_0_3_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsc_0_0_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_0_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_0_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_0_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsc_0_1_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_1_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_1_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_1_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsc_0_2_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_2_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_2_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_2_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsc_0_3_i_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_3_i_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_3_i_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsc_0_3_i_radr_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT peaseNTT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
      xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      twiddle_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsc_0_0_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_0_0_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsc_0_1_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_0_1_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsc_0_2_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_0_2_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_h_rsc_0_3_i_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsc_0_3_i_radr_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      mult_z_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_1_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_1_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_1_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_2_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_2_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_2_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_3_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_3_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_4_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_4_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_4_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_5_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_5_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_6_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_6_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_6_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_7_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_7_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC;
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaseNTT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (27 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_twiddle_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_0_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_0_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_1_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_1_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_2_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_2_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_3_i_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_twiddle_h_rsc_0_3_i_radr_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_1_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_1_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_1_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_2_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_2_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_2_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_3_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_3_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_4_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_4_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_4_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_5_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_5_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_6_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_6_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_6_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_7_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL peaseNTT_core_inst_mult_z_mul_cmp_7_z : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  yt_rsc_0_0_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 14,
      data_width => 32,
      depth => 16384,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_0_comp_adra,
      adrb => yt_rsc_0_0_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_0_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_0_clkb_en,
      da => yt_rsc_0_0_comp_da,
      db => yt_rsc_0_0_comp_db,
      qa => yt_rsc_0_0_comp_qa,
      qb => yt_rsc_0_0_comp_qb,
      wea => yt_rsc_0_0_wea,
      web => yt_rsc_0_0_web
    );
  yt_rsc_0_0_comp_adra <= yt_rsc_0_0_adra;
  yt_rsc_0_0_comp_adrb <= yt_rsc_0_0_adrb;
  yt_rsc_0_0_comp_da <= yt_rsc_0_0_da;
  yt_rsc_0_0_comp_db <= yt_rsc_0_0_db;
  yt_rsc_0_0_qa <= yt_rsc_0_0_comp_qa;
  yt_rsc_0_0_qb <= yt_rsc_0_0_comp_qb;

  yt_rsc_0_1_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 14,
      data_width => 32,
      depth => 16384,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_1_comp_adra,
      adrb => yt_rsc_0_1_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_1_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_1_clkb_en,
      da => yt_rsc_0_1_comp_da,
      db => yt_rsc_0_1_comp_db,
      qa => yt_rsc_0_1_comp_qa,
      qb => yt_rsc_0_1_comp_qb,
      wea => yt_rsc_0_1_wea,
      web => yt_rsc_0_1_web
    );
  yt_rsc_0_1_comp_adra <= yt_rsc_0_1_adra;
  yt_rsc_0_1_comp_adrb <= yt_rsc_0_1_adrb;
  yt_rsc_0_1_comp_da <= yt_rsc_0_1_da;
  yt_rsc_0_1_comp_db <= yt_rsc_0_1_db;
  yt_rsc_0_1_qa <= yt_rsc_0_1_comp_qa;
  yt_rsc_0_1_qb <= yt_rsc_0_1_comp_qb;

  yt_rsc_0_2_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 14,
      data_width => 32,
      depth => 16384,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_2_comp_adra,
      adrb => yt_rsc_0_2_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_2_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_2_clkb_en,
      da => yt_rsc_0_2_comp_da,
      db => yt_rsc_0_2_comp_db,
      qa => yt_rsc_0_2_comp_qa,
      qb => yt_rsc_0_2_comp_qb,
      wea => yt_rsc_0_2_wea,
      web => yt_rsc_0_2_web
    );
  yt_rsc_0_2_comp_adra <= yt_rsc_0_2_adra;
  yt_rsc_0_2_comp_adrb <= yt_rsc_0_2_adrb;
  yt_rsc_0_2_comp_da <= yt_rsc_0_2_da;
  yt_rsc_0_2_comp_db <= yt_rsc_0_2_db;
  yt_rsc_0_2_qa <= yt_rsc_0_2_comp_qa;
  yt_rsc_0_2_qb <= yt_rsc_0_2_comp_qb;

  yt_rsc_0_3_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 14,
      data_width => 32,
      depth => 16384,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_3_comp_adra,
      adrb => yt_rsc_0_3_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_3_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_3_clkb_en,
      da => yt_rsc_0_3_comp_da,
      db => yt_rsc_0_3_comp_db,
      qa => yt_rsc_0_3_comp_qa,
      qb => yt_rsc_0_3_comp_qb,
      wea => yt_rsc_0_3_wea,
      web => yt_rsc_0_3_web
    );
  yt_rsc_0_3_comp_adra <= yt_rsc_0_3_adra;
  yt_rsc_0_3_comp_adrb <= yt_rsc_0_3_adrb;
  yt_rsc_0_3_comp_da <= yt_rsc_0_3_da;
  yt_rsc_0_3_comp_db <= yt_rsc_0_3_db;
  yt_rsc_0_3_qa <= yt_rsc_0_3_comp_qa;
  yt_rsc_0_3_qb <= yt_rsc_0_3_comp_qb;

  yt_rsc_0_0_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_14_32_16384_16384_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_0_clkb_en,
      clka_en => yt_rsc_0_0_clka_en,
      qb => yt_rsc_0_0_i_qb,
      web => yt_rsc_0_0_web,
      db => yt_rsc_0_0_i_db,
      adrb => yt_rsc_0_0_i_adrb,
      qa => yt_rsc_0_0_i_qa,
      wea => yt_rsc_0_0_wea,
      da => yt_rsc_0_0_i_da,
      adra => yt_rsc_0_0_i_adra,
      adra_d => yt_rsc_0_0_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_0_i_clka_en_d,
      clkb_en_d => yt_rsc_0_0_i_clka_en_d,
      da_d => yt_rsc_0_0_i_da_d_1,
      qa_d => yt_rsc_0_0_i_qa_d_1,
      wea_d => yt_rsc_0_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_0_i_qb <= yt_rsc_0_0_qb;
  yt_rsc_0_0_db <= yt_rsc_0_0_i_db;
  yt_rsc_0_0_adrb <= yt_rsc_0_0_i_adrb;
  yt_rsc_0_0_i_qa <= yt_rsc_0_0_qa;
  yt_rsc_0_0_da <= yt_rsc_0_0_i_da;
  yt_rsc_0_0_adra <= yt_rsc_0_0_i_adra;
  yt_rsc_0_0_i_adra_d_1 <= yt_rsc_0_0_i_adra_d;
  yt_rsc_0_0_i_da_d_1 <= yt_rsc_0_0_i_da_d;
  yt_rsc_0_0_i_qa_d <= yt_rsc_0_0_i_qa_d_1;
  yt_rsc_0_0_i_wea_d_1 <= yt_rsc_0_0_i_wea_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_1_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_14_32_16384_16384_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_1_clkb_en,
      clka_en => yt_rsc_0_1_clka_en,
      qb => yt_rsc_0_1_i_qb,
      web => yt_rsc_0_1_web,
      db => yt_rsc_0_1_i_db,
      adrb => yt_rsc_0_1_i_adrb,
      qa => yt_rsc_0_1_i_qa,
      wea => yt_rsc_0_1_wea,
      da => yt_rsc_0_1_i_da,
      adra => yt_rsc_0_1_i_adra,
      adra_d => yt_rsc_0_1_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_0_i_clka_en_d,
      clkb_en_d => yt_rsc_0_0_i_clka_en_d,
      da_d => yt_rsc_0_1_i_da_d_1,
      qa_d => yt_rsc_0_1_i_qa_d_1,
      wea_d => yt_rsc_0_1_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_1_i_qb <= yt_rsc_0_1_qb;
  yt_rsc_0_1_db <= yt_rsc_0_1_i_db;
  yt_rsc_0_1_adrb <= yt_rsc_0_1_i_adrb;
  yt_rsc_0_1_i_qa <= yt_rsc_0_1_qa;
  yt_rsc_0_1_da <= yt_rsc_0_1_i_da;
  yt_rsc_0_1_adra <= yt_rsc_0_1_i_adra;
  yt_rsc_0_1_i_adra_d_1 <= yt_rsc_0_1_i_adra_d;
  yt_rsc_0_1_i_da_d_1 <= yt_rsc_0_1_i_da_d;
  yt_rsc_0_1_i_qa_d <= yt_rsc_0_1_i_qa_d_1;
  yt_rsc_0_1_i_wea_d_1 <= yt_rsc_0_1_i_wea_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_2_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_14_32_16384_16384_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_2_clkb_en,
      clka_en => yt_rsc_0_2_clka_en,
      qb => yt_rsc_0_2_i_qb,
      web => yt_rsc_0_2_web,
      db => yt_rsc_0_2_i_db,
      adrb => yt_rsc_0_2_i_adrb,
      qa => yt_rsc_0_2_i_qa,
      wea => yt_rsc_0_2_wea,
      da => yt_rsc_0_2_i_da,
      adra => yt_rsc_0_2_i_adra,
      adra_d => yt_rsc_0_2_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_0_i_clka_en_d,
      clkb_en_d => yt_rsc_0_0_i_clka_en_d,
      da_d => yt_rsc_0_2_i_da_d_1,
      qa_d => yt_rsc_0_2_i_qa_d_1,
      wea_d => yt_rsc_0_2_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_2_i_qb <= yt_rsc_0_2_qb;
  yt_rsc_0_2_db <= yt_rsc_0_2_i_db;
  yt_rsc_0_2_adrb <= yt_rsc_0_2_i_adrb;
  yt_rsc_0_2_i_qa <= yt_rsc_0_2_qa;
  yt_rsc_0_2_da <= yt_rsc_0_2_i_da;
  yt_rsc_0_2_adra <= yt_rsc_0_2_i_adra;
  yt_rsc_0_2_i_adra_d_1 <= yt_rsc_0_2_i_adra_d;
  yt_rsc_0_2_i_da_d_1 <= yt_rsc_0_2_i_da_d;
  yt_rsc_0_2_i_qa_d <= yt_rsc_0_2_i_qa_d_1;
  yt_rsc_0_2_i_wea_d_1 <= yt_rsc_0_2_i_wea_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_3_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_14_32_16384_16384_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_3_clkb_en,
      clka_en => yt_rsc_0_3_clka_en,
      qb => yt_rsc_0_3_i_qb,
      web => yt_rsc_0_3_web,
      db => yt_rsc_0_3_i_db,
      adrb => yt_rsc_0_3_i_adrb,
      qa => yt_rsc_0_3_i_qa,
      wea => yt_rsc_0_3_wea,
      da => yt_rsc_0_3_i_da,
      adra => yt_rsc_0_3_i_adra,
      adra_d => yt_rsc_0_3_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_0_i_clka_en_d,
      clkb_en_d => yt_rsc_0_0_i_clka_en_d,
      da_d => yt_rsc_0_3_i_da_d_1,
      qa_d => yt_rsc_0_3_i_qa_d_1,
      wea_d => yt_rsc_0_3_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_3_i_qb <= yt_rsc_0_3_qb;
  yt_rsc_0_3_db <= yt_rsc_0_3_i_db;
  yt_rsc_0_3_adrb <= yt_rsc_0_3_i_adrb;
  yt_rsc_0_3_i_qa <= yt_rsc_0_3_qa;
  yt_rsc_0_3_da <= yt_rsc_0_3_i_da;
  yt_rsc_0_3_adra <= yt_rsc_0_3_i_adra;
  yt_rsc_0_3_i_adra_d_1 <= yt_rsc_0_3_i_adra_d;
  yt_rsc_0_3_i_da_d_1 <= yt_rsc_0_3_i_da_d;
  yt_rsc_0_3_i_qa_d <= yt_rsc_0_3_i_qa_d_1;
  yt_rsc_0_3_i_wea_d_1 <= yt_rsc_0_3_i_wea_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_0_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_11_14_32_16384_16384_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_0_i_qb,
      web => xt_rsc_0_0_web,
      db => xt_rsc_0_0_i_db,
      adrb => xt_rsc_0_0_i_adrb,
      qa => xt_rsc_0_0_i_qa,
      wea => xt_rsc_0_0_wea,
      da => xt_rsc_0_0_i_da,
      adra => xt_rsc_0_0_i_adra,
      adra_d => xt_rsc_0_0_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_0_i_da_d_1,
      qa_d => xt_rsc_0_0_i_qa_d_1,
      wea_d => xt_rsc_0_0_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_0_i_qb <= xt_rsc_0_0_qb;
  xt_rsc_0_0_db <= xt_rsc_0_0_i_db;
  xt_rsc_0_0_adrb <= xt_rsc_0_0_i_adrb;
  xt_rsc_0_0_i_qa <= xt_rsc_0_0_qa;
  xt_rsc_0_0_da <= xt_rsc_0_0_i_da;
  xt_rsc_0_0_adra <= xt_rsc_0_0_i_adra;
  xt_rsc_0_0_i_adra_d_1 <= xt_rsc_0_0_i_adra_d;
  xt_rsc_0_0_i_da_d_1 <= xt_rsc_0_0_i_da_d;
  xt_rsc_0_0_i_qa_d <= xt_rsc_0_0_i_qa_d_1;
  xt_rsc_0_0_i_wea_d_1 <= xt_rsc_0_0_i_wea_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_1_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_12_14_32_16384_16384_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_1_i_qb,
      web => xt_rsc_0_1_web,
      db => xt_rsc_0_1_i_db,
      adrb => xt_rsc_0_1_i_adrb,
      qa => xt_rsc_0_1_i_qa,
      wea => xt_rsc_0_1_wea,
      da => xt_rsc_0_1_i_da,
      adra => xt_rsc_0_1_i_adra,
      adra_d => xt_rsc_0_1_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_1_i_da_d_1,
      qa_d => xt_rsc_0_1_i_qa_d_1,
      wea_d => xt_rsc_0_1_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_1_i_qb <= xt_rsc_0_1_qb;
  xt_rsc_0_1_db <= xt_rsc_0_1_i_db;
  xt_rsc_0_1_adrb <= xt_rsc_0_1_i_adrb;
  xt_rsc_0_1_i_qa <= xt_rsc_0_1_qa;
  xt_rsc_0_1_da <= xt_rsc_0_1_i_da;
  xt_rsc_0_1_adra <= xt_rsc_0_1_i_adra;
  xt_rsc_0_1_i_adra_d_1 <= xt_rsc_0_1_i_adra_d;
  xt_rsc_0_1_i_da_d_1 <= xt_rsc_0_1_i_da_d;
  xt_rsc_0_1_i_qa_d <= xt_rsc_0_1_i_qa_d_1;
  xt_rsc_0_1_i_wea_d_1 <= xt_rsc_0_1_i_wea_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_2_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_2_i_qb,
      web => xt_rsc_0_2_web,
      db => xt_rsc_0_2_i_db,
      adrb => xt_rsc_0_2_i_adrb,
      qa => xt_rsc_0_2_i_qa,
      wea => xt_rsc_0_2_wea,
      da => xt_rsc_0_2_i_da,
      adra => xt_rsc_0_2_i_adra,
      adra_d => xt_rsc_0_2_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_2_i_da_d_1,
      qa_d => xt_rsc_0_2_i_qa_d_1,
      wea_d => xt_rsc_0_2_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_2_i_qb <= xt_rsc_0_2_qb;
  xt_rsc_0_2_db <= xt_rsc_0_2_i_db;
  xt_rsc_0_2_adrb <= xt_rsc_0_2_i_adrb;
  xt_rsc_0_2_i_qa <= xt_rsc_0_2_qa;
  xt_rsc_0_2_da <= xt_rsc_0_2_i_da;
  xt_rsc_0_2_adra <= xt_rsc_0_2_i_adra;
  xt_rsc_0_2_i_adra_d_1 <= xt_rsc_0_2_i_adra_d;
  xt_rsc_0_2_i_da_d_1 <= xt_rsc_0_2_i_da_d;
  xt_rsc_0_2_i_qa_d <= xt_rsc_0_2_i_qa_d_1;
  xt_rsc_0_2_i_wea_d_1 <= xt_rsc_0_2_i_wea_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_3_i : peaseNTT_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_14_32_16384_16384_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_3_i_qb,
      web => xt_rsc_0_3_web,
      db => xt_rsc_0_3_i_db,
      adrb => xt_rsc_0_3_i_adrb,
      qa => xt_rsc_0_3_i_qa,
      wea => xt_rsc_0_3_wea,
      da => xt_rsc_0_3_i_da,
      adra => xt_rsc_0_3_i_adra,
      adra_d => xt_rsc_0_3_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_3_i_da_d_1,
      qa_d => xt_rsc_0_3_i_qa_d_1,
      wea_d => xt_rsc_0_3_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_3_i_qb <= xt_rsc_0_3_qb;
  xt_rsc_0_3_db <= xt_rsc_0_3_i_db;
  xt_rsc_0_3_adrb <= xt_rsc_0_3_i_adrb;
  xt_rsc_0_3_i_qa <= xt_rsc_0_3_qa;
  xt_rsc_0_3_da <= xt_rsc_0_3_i_da;
  xt_rsc_0_3_adra <= xt_rsc_0_3_i_adra;
  xt_rsc_0_3_i_adra_d_1 <= xt_rsc_0_3_i_adra_d;
  xt_rsc_0_3_i_da_d_1 <= xt_rsc_0_3_i_da_d;
  xt_rsc_0_3_i_qa_d <= xt_rsc_0_3_i_qa_d_1;
  xt_rsc_0_3_i_wea_d_1 <= xt_rsc_0_3_i_wea_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  twiddle_rsc_0_0_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_15_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_rsc_0_0_i_q,
      radr => twiddle_rsc_0_0_i_radr,
      q_d => twiddle_rsc_0_0_i_q_d_1,
      radr_d => twiddle_rsc_0_0_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_rsc_0_0_i_q <= twiddle_rsc_0_0_q;
  twiddle_rsc_0_0_radr <= twiddle_rsc_0_0_i_radr;
  twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d_1;
  twiddle_rsc_0_0_i_radr_d_1 <= twiddle_rsc_0_0_i_radr_d;

  twiddle_rsc_0_1_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_16_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_rsc_0_1_i_q,
      radr => twiddle_rsc_0_1_i_radr,
      q_d => twiddle_rsc_0_1_i_q_d_1,
      radr_d => twiddle_rsc_0_1_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_rsc_0_1_i_q <= twiddle_rsc_0_1_q;
  twiddle_rsc_0_1_radr <= twiddle_rsc_0_1_i_radr;
  twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d_1;
  twiddle_rsc_0_1_i_radr_d_1 <= twiddle_rsc_0_1_i_radr_d;

  twiddle_rsc_0_2_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_17_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_rsc_0_2_i_q,
      radr => twiddle_rsc_0_2_i_radr,
      q_d => twiddle_rsc_0_2_i_q_d_1,
      radr_d => twiddle_rsc_0_2_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_rsc_0_2_i_q <= twiddle_rsc_0_2_q;
  twiddle_rsc_0_2_radr <= twiddle_rsc_0_2_i_radr;
  twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d_1;
  twiddle_rsc_0_2_i_radr_d_1 <= twiddle_rsc_0_2_i_radr_d;

  twiddle_rsc_0_3_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_18_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_rsc_0_3_i_q,
      radr => twiddle_rsc_0_3_i_radr,
      q_d => twiddle_rsc_0_3_i_q_d_1,
      radr_d => twiddle_rsc_0_3_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_rsc_0_3_i_q <= twiddle_rsc_0_3_q;
  twiddle_rsc_0_3_radr <= twiddle_rsc_0_3_i_radr;
  twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d_1;
  twiddle_rsc_0_3_i_radr_d_1 <= twiddle_rsc_0_3_i_radr_d;

  twiddle_h_rsc_0_0_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_19_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_h_rsc_0_0_i_q,
      radr => twiddle_h_rsc_0_0_i_radr,
      q_d => twiddle_h_rsc_0_0_i_q_d_1,
      radr_d => twiddle_h_rsc_0_0_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_h_rsc_0_0_i_q <= twiddle_h_rsc_0_0_q;
  twiddle_h_rsc_0_0_radr <= twiddle_h_rsc_0_0_i_radr;
  twiddle_h_rsc_0_0_i_q_d <= twiddle_h_rsc_0_0_i_q_d_1;
  twiddle_h_rsc_0_0_i_radr_d_1 <= twiddle_h_rsc_0_0_i_radr_d;

  twiddle_h_rsc_0_1_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_20_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_h_rsc_0_1_i_q,
      radr => twiddle_h_rsc_0_1_i_radr,
      q_d => twiddle_h_rsc_0_1_i_q_d_1,
      radr_d => twiddle_h_rsc_0_1_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_h_rsc_0_1_i_q <= twiddle_h_rsc_0_1_q;
  twiddle_h_rsc_0_1_radr <= twiddle_h_rsc_0_1_i_radr;
  twiddle_h_rsc_0_1_i_q_d <= twiddle_h_rsc_0_1_i_q_d_1;
  twiddle_h_rsc_0_1_i_radr_d_1 <= twiddle_h_rsc_0_1_i_radr_d;

  twiddle_h_rsc_0_2_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_21_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_h_rsc_0_2_i_q,
      radr => twiddle_h_rsc_0_2_i_radr,
      q_d => twiddle_h_rsc_0_2_i_q_d_1,
      radr_d => twiddle_h_rsc_0_2_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_h_rsc_0_2_i_q <= twiddle_h_rsc_0_2_q;
  twiddle_h_rsc_0_2_radr <= twiddle_h_rsc_0_2_i_radr;
  twiddle_h_rsc_0_2_i_q_d <= twiddle_h_rsc_0_2_i_q_d_1;
  twiddle_h_rsc_0_2_i_radr_d_1 <= twiddle_h_rsc_0_2_i_radr_d;

  twiddle_h_rsc_0_3_i : peaseNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_22_14_32_16384_16384_32_1_gen
    PORT MAP(
      q => twiddle_h_rsc_0_3_i_q,
      radr => twiddle_h_rsc_0_3_i_radr,
      q_d => twiddle_h_rsc_0_3_i_q_d_1,
      radr_d => twiddle_h_rsc_0_3_i_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_h_rsc_0_3_i_q <= twiddle_h_rsc_0_3_q;
  twiddle_h_rsc_0_3_radr <= twiddle_h_rsc_0_3_i_radr;
  twiddle_h_rsc_0_3_i_q_d <= twiddle_h_rsc_0_3_i_q_d_1;
  twiddle_h_rsc_0_3_i_radr_d_1 <= twiddle_h_rsc_0_3_i_radr_d;

  peaseNTT_core_inst : peaseNTT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      xt_rsc_triosy_0_0_lz => xt_rsc_triosy_0_0_lz,
      xt_rsc_triosy_0_1_lz => xt_rsc_triosy_0_1_lz,
      xt_rsc_triosy_0_2_lz => xt_rsc_triosy_0_2_lz,
      xt_rsc_triosy_0_3_lz => xt_rsc_triosy_0_3_lz,
      p_rsc_dat => peaseNTT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz => twiddle_rsc_triosy_0_0_lz,
      twiddle_rsc_triosy_0_1_lz => twiddle_rsc_triosy_0_1_lz,
      twiddle_rsc_triosy_0_2_lz => twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz => twiddle_rsc_triosy_0_3_lz,
      twiddle_h_rsc_triosy_0_0_lz => twiddle_h_rsc_triosy_0_0_lz,
      twiddle_h_rsc_triosy_0_1_lz => twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_triosy_0_2_lz => twiddle_h_rsc_triosy_0_2_lz,
      twiddle_h_rsc_triosy_0_3_lz => twiddle_h_rsc_triosy_0_3_lz,
      yt_rsc_0_0_i_adra_d => peaseNTT_core_inst_yt_rsc_0_0_i_adra_d,
      yt_rsc_0_0_i_clka_en_d => yt_rsc_0_0_i_clka_en_d,
      yt_rsc_0_0_i_da_d => peaseNTT_core_inst_yt_rsc_0_0_i_da_d,
      yt_rsc_0_0_i_qa_d => peaseNTT_core_inst_yt_rsc_0_0_i_qa_d,
      yt_rsc_0_0_i_wea_d => peaseNTT_core_inst_yt_rsc_0_0_i_wea_d,
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_1_i_adra_d => peaseNTT_core_inst_yt_rsc_0_1_i_adra_d,
      yt_rsc_0_1_i_da_d => peaseNTT_core_inst_yt_rsc_0_1_i_da_d,
      yt_rsc_0_1_i_qa_d => peaseNTT_core_inst_yt_rsc_0_1_i_qa_d,
      yt_rsc_0_1_i_wea_d => peaseNTT_core_inst_yt_rsc_0_1_i_wea_d,
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_2_i_adra_d => peaseNTT_core_inst_yt_rsc_0_2_i_adra_d,
      yt_rsc_0_2_i_da_d => peaseNTT_core_inst_yt_rsc_0_2_i_da_d,
      yt_rsc_0_2_i_qa_d => peaseNTT_core_inst_yt_rsc_0_2_i_qa_d,
      yt_rsc_0_2_i_wea_d => peaseNTT_core_inst_yt_rsc_0_2_i_wea_d,
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_3_i_adra_d => peaseNTT_core_inst_yt_rsc_0_3_i_adra_d,
      yt_rsc_0_3_i_da_d => peaseNTT_core_inst_yt_rsc_0_3_i_da_d,
      yt_rsc_0_3_i_qa_d => peaseNTT_core_inst_yt_rsc_0_3_i_qa_d,
      yt_rsc_0_3_i_wea_d => peaseNTT_core_inst_yt_rsc_0_3_i_wea_d,
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_0_i_adra_d => peaseNTT_core_inst_xt_rsc_0_0_i_adra_d,
      xt_rsc_0_0_i_da_d => peaseNTT_core_inst_xt_rsc_0_0_i_da_d,
      xt_rsc_0_0_i_qa_d => peaseNTT_core_inst_xt_rsc_0_0_i_qa_d,
      xt_rsc_0_0_i_wea_d => peaseNTT_core_inst_xt_rsc_0_0_i_wea_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_1_i_adra_d => peaseNTT_core_inst_xt_rsc_0_1_i_adra_d,
      xt_rsc_0_1_i_da_d => peaseNTT_core_inst_xt_rsc_0_1_i_da_d,
      xt_rsc_0_1_i_qa_d => peaseNTT_core_inst_xt_rsc_0_1_i_qa_d,
      xt_rsc_0_1_i_wea_d => peaseNTT_core_inst_xt_rsc_0_1_i_wea_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_2_i_adra_d => peaseNTT_core_inst_xt_rsc_0_2_i_adra_d,
      xt_rsc_0_2_i_da_d => peaseNTT_core_inst_xt_rsc_0_2_i_da_d,
      xt_rsc_0_2_i_qa_d => peaseNTT_core_inst_xt_rsc_0_2_i_qa_d,
      xt_rsc_0_2_i_wea_d => peaseNTT_core_inst_xt_rsc_0_2_i_wea_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_3_i_adra_d => peaseNTT_core_inst_xt_rsc_0_3_i_adra_d,
      xt_rsc_0_3_i_da_d => peaseNTT_core_inst_xt_rsc_0_3_i_da_d,
      xt_rsc_0_3_i_qa_d => peaseNTT_core_inst_xt_rsc_0_3_i_qa_d,
      xt_rsc_0_3_i_wea_d => peaseNTT_core_inst_xt_rsc_0_3_i_wea_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d => peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      twiddle_rsc_0_0_i_q_d => peaseNTT_core_inst_twiddle_rsc_0_0_i_q_d,
      twiddle_rsc_0_0_i_radr_d => peaseNTT_core_inst_twiddle_rsc_0_0_i_radr_d,
      twiddle_rsc_0_1_i_q_d => peaseNTT_core_inst_twiddle_rsc_0_1_i_q_d,
      twiddle_rsc_0_1_i_radr_d => peaseNTT_core_inst_twiddle_rsc_0_1_i_radr_d,
      twiddle_rsc_0_2_i_q_d => peaseNTT_core_inst_twiddle_rsc_0_2_i_q_d,
      twiddle_rsc_0_2_i_radr_d => peaseNTT_core_inst_twiddle_rsc_0_2_i_radr_d,
      twiddle_rsc_0_3_i_q_d => peaseNTT_core_inst_twiddle_rsc_0_3_i_q_d,
      twiddle_rsc_0_3_i_radr_d => peaseNTT_core_inst_twiddle_rsc_0_3_i_radr_d,
      twiddle_h_rsc_0_0_i_q_d => peaseNTT_core_inst_twiddle_h_rsc_0_0_i_q_d,
      twiddle_h_rsc_0_0_i_radr_d => peaseNTT_core_inst_twiddle_h_rsc_0_0_i_radr_d,
      twiddle_h_rsc_0_1_i_q_d => peaseNTT_core_inst_twiddle_h_rsc_0_1_i_q_d,
      twiddle_h_rsc_0_1_i_radr_d => peaseNTT_core_inst_twiddle_h_rsc_0_1_i_radr_d,
      twiddle_h_rsc_0_2_i_q_d => peaseNTT_core_inst_twiddle_h_rsc_0_2_i_q_d,
      twiddle_h_rsc_0_2_i_radr_d => peaseNTT_core_inst_twiddle_h_rsc_0_2_i_radr_d,
      twiddle_h_rsc_0_3_i_q_d => peaseNTT_core_inst_twiddle_h_rsc_0_3_i_q_d,
      twiddle_h_rsc_0_3_i_radr_d => peaseNTT_core_inst_twiddle_h_rsc_0_3_i_radr_d,
      mult_z_mul_cmp_a => peaseNTT_core_inst_mult_z_mul_cmp_a,
      mult_z_mul_cmp_b => peaseNTT_core_inst_mult_z_mul_cmp_b,
      mult_z_mul_cmp_z => peaseNTT_core_inst_mult_z_mul_cmp_z,
      mult_z_mul_cmp_1_a => peaseNTT_core_inst_mult_z_mul_cmp_1_a,
      mult_z_mul_cmp_1_b => peaseNTT_core_inst_mult_z_mul_cmp_1_b,
      mult_z_mul_cmp_1_z => peaseNTT_core_inst_mult_z_mul_cmp_1_z,
      mult_z_mul_cmp_2_a => peaseNTT_core_inst_mult_z_mul_cmp_2_a,
      mult_z_mul_cmp_2_b => peaseNTT_core_inst_mult_z_mul_cmp_2_b,
      mult_z_mul_cmp_2_z => peaseNTT_core_inst_mult_z_mul_cmp_2_z,
      mult_z_mul_cmp_3_a => peaseNTT_core_inst_mult_z_mul_cmp_3_a,
      mult_z_mul_cmp_3_z => peaseNTT_core_inst_mult_z_mul_cmp_3_z,
      mult_z_mul_cmp_4_a => peaseNTT_core_inst_mult_z_mul_cmp_4_a,
      mult_z_mul_cmp_4_b => peaseNTT_core_inst_mult_z_mul_cmp_4_b,
      mult_z_mul_cmp_4_z => peaseNTT_core_inst_mult_z_mul_cmp_4_z,
      mult_z_mul_cmp_5_a => peaseNTT_core_inst_mult_z_mul_cmp_5_a,
      mult_z_mul_cmp_5_z => peaseNTT_core_inst_mult_z_mul_cmp_5_z,
      mult_z_mul_cmp_6_a => peaseNTT_core_inst_mult_z_mul_cmp_6_a,
      mult_z_mul_cmp_6_b => peaseNTT_core_inst_mult_z_mul_cmp_6_b,
      mult_z_mul_cmp_6_z => peaseNTT_core_inst_mult_z_mul_cmp_6_z,
      mult_z_mul_cmp_7_a => peaseNTT_core_inst_mult_z_mul_cmp_7_a,
      mult_z_mul_cmp_7_z => peaseNTT_core_inst_mult_z_mul_cmp_7_z,
      twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_pff => twiddle_rsc_0_0_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_pff => twiddle_rsc_0_1_i_readA_r_ram_ir_internal_RMASK_B_d_iff,
      twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_pff => twiddle_rsc_0_2_i_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  peaseNTT_core_inst_p_rsc_dat <= p_rsc_dat;
  yt_rsc_0_0_i_adra_d <= peaseNTT_core_inst_yt_rsc_0_0_i_adra_d;
  yt_rsc_0_0_i_da_d <= peaseNTT_core_inst_yt_rsc_0_0_i_da_d;
  peaseNTT_core_inst_yt_rsc_0_0_i_qa_d <= yt_rsc_0_0_i_qa_d;
  yt_rsc_0_0_i_wea_d <= peaseNTT_core_inst_yt_rsc_0_0_i_wea_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_1_i_adra_d <= peaseNTT_core_inst_yt_rsc_0_1_i_adra_d;
  yt_rsc_0_1_i_da_d <= peaseNTT_core_inst_yt_rsc_0_1_i_da_d;
  peaseNTT_core_inst_yt_rsc_0_1_i_qa_d <= yt_rsc_0_1_i_qa_d;
  yt_rsc_0_1_i_wea_d <= peaseNTT_core_inst_yt_rsc_0_1_i_wea_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_2_i_adra_d <= peaseNTT_core_inst_yt_rsc_0_2_i_adra_d;
  yt_rsc_0_2_i_da_d <= peaseNTT_core_inst_yt_rsc_0_2_i_da_d;
  peaseNTT_core_inst_yt_rsc_0_2_i_qa_d <= yt_rsc_0_2_i_qa_d;
  yt_rsc_0_2_i_wea_d <= peaseNTT_core_inst_yt_rsc_0_2_i_wea_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_3_i_adra_d <= peaseNTT_core_inst_yt_rsc_0_3_i_adra_d;
  yt_rsc_0_3_i_da_d <= peaseNTT_core_inst_yt_rsc_0_3_i_da_d;
  peaseNTT_core_inst_yt_rsc_0_3_i_qa_d <= yt_rsc_0_3_i_qa_d;
  yt_rsc_0_3_i_wea_d <= peaseNTT_core_inst_yt_rsc_0_3_i_wea_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_0_i_adra_d <= peaseNTT_core_inst_xt_rsc_0_0_i_adra_d;
  xt_rsc_0_0_i_da_d <= peaseNTT_core_inst_xt_rsc_0_0_i_da_d;
  peaseNTT_core_inst_xt_rsc_0_0_i_qa_d <= xt_rsc_0_0_i_qa_d;
  xt_rsc_0_0_i_wea_d <= peaseNTT_core_inst_xt_rsc_0_0_i_wea_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_1_i_adra_d <= peaseNTT_core_inst_xt_rsc_0_1_i_adra_d;
  xt_rsc_0_1_i_da_d <= peaseNTT_core_inst_xt_rsc_0_1_i_da_d;
  peaseNTT_core_inst_xt_rsc_0_1_i_qa_d <= xt_rsc_0_1_i_qa_d;
  xt_rsc_0_1_i_wea_d <= peaseNTT_core_inst_xt_rsc_0_1_i_wea_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_2_i_adra_d <= peaseNTT_core_inst_xt_rsc_0_2_i_adra_d;
  xt_rsc_0_2_i_da_d <= peaseNTT_core_inst_xt_rsc_0_2_i_da_d;
  peaseNTT_core_inst_xt_rsc_0_2_i_qa_d <= xt_rsc_0_2_i_qa_d;
  xt_rsc_0_2_i_wea_d <= peaseNTT_core_inst_xt_rsc_0_2_i_wea_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_3_i_adra_d <= peaseNTT_core_inst_xt_rsc_0_3_i_adra_d;
  xt_rsc_0_3_i_da_d <= peaseNTT_core_inst_xt_rsc_0_3_i_da_d;
  peaseNTT_core_inst_xt_rsc_0_3_i_qa_d <= xt_rsc_0_3_i_qa_d;
  xt_rsc_0_3_i_wea_d <= peaseNTT_core_inst_xt_rsc_0_3_i_wea_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= peaseNTT_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  peaseNTT_core_inst_twiddle_rsc_0_0_i_q_d <= twiddle_rsc_0_0_i_q_d;
  twiddle_rsc_0_0_i_radr_d <= peaseNTT_core_inst_twiddle_rsc_0_0_i_radr_d;
  peaseNTT_core_inst_twiddle_rsc_0_1_i_q_d <= twiddle_rsc_0_1_i_q_d;
  twiddle_rsc_0_1_i_radr_d <= peaseNTT_core_inst_twiddle_rsc_0_1_i_radr_d;
  peaseNTT_core_inst_twiddle_rsc_0_2_i_q_d <= twiddle_rsc_0_2_i_q_d;
  twiddle_rsc_0_2_i_radr_d <= peaseNTT_core_inst_twiddle_rsc_0_2_i_radr_d;
  peaseNTT_core_inst_twiddle_rsc_0_3_i_q_d <= twiddle_rsc_0_3_i_q_d;
  twiddle_rsc_0_3_i_radr_d <= peaseNTT_core_inst_twiddle_rsc_0_3_i_radr_d;
  peaseNTT_core_inst_twiddle_h_rsc_0_0_i_q_d <= twiddle_h_rsc_0_0_i_q_d;
  twiddle_h_rsc_0_0_i_radr_d <= peaseNTT_core_inst_twiddle_h_rsc_0_0_i_radr_d;
  peaseNTT_core_inst_twiddle_h_rsc_0_1_i_q_d <= twiddle_h_rsc_0_1_i_q_d;
  twiddle_h_rsc_0_1_i_radr_d <= peaseNTT_core_inst_twiddle_h_rsc_0_1_i_radr_d;
  peaseNTT_core_inst_twiddle_h_rsc_0_2_i_q_d <= twiddle_h_rsc_0_2_i_q_d;
  twiddle_h_rsc_0_2_i_radr_d <= peaseNTT_core_inst_twiddle_h_rsc_0_2_i_radr_d;
  peaseNTT_core_inst_twiddle_h_rsc_0_3_i_q_d <= twiddle_h_rsc_0_3_i_q_d;
  twiddle_h_rsc_0_3_i_radr_d <= peaseNTT_core_inst_twiddle_h_rsc_0_3_i_radr_d;
  mult_z_mul_cmp_a <= peaseNTT_core_inst_mult_z_mul_cmp_a;
  mult_z_mul_cmp_b <= peaseNTT_core_inst_mult_z_mul_cmp_b;
  peaseNTT_core_inst_mult_z_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_a) * UNSIGNED(mult_z_mul_cmp_b)), 32));
  mult_z_mul_cmp_1_a <= peaseNTT_core_inst_mult_z_mul_cmp_1_a;
  mult_z_mul_cmp_1_b <= peaseNTT_core_inst_mult_z_mul_cmp_1_b;
  peaseNTT_core_inst_mult_z_mul_cmp_1_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_1_a) * UNSIGNED(mult_z_mul_cmp_1_b)), 32));
  mult_z_mul_cmp_2_a <= peaseNTT_core_inst_mult_z_mul_cmp_2_a;
  mult_z_mul_cmp_2_b <= peaseNTT_core_inst_mult_z_mul_cmp_2_b;
  peaseNTT_core_inst_mult_z_mul_cmp_2_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_2_a) * UNSIGNED(mult_z_mul_cmp_2_b)), 32));
  mult_z_mul_cmp_3_a <= peaseNTT_core_inst_mult_z_mul_cmp_3_a;
  peaseNTT_core_inst_mult_z_mul_cmp_3_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_3_a) * UNSIGNED(mult_z_mul_cmp_1_b)), 32));
  mult_z_mul_cmp_4_a <= peaseNTT_core_inst_mult_z_mul_cmp_4_a;
  mult_z_mul_cmp_4_b <= peaseNTT_core_inst_mult_z_mul_cmp_4_b;
  peaseNTT_core_inst_mult_z_mul_cmp_4_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_4_a) * UNSIGNED(mult_z_mul_cmp_4_b)), 32));
  mult_z_mul_cmp_5_a <= peaseNTT_core_inst_mult_z_mul_cmp_5_a;
  peaseNTT_core_inst_mult_z_mul_cmp_5_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_5_a) * UNSIGNED(mult_z_mul_cmp_1_b)), 32));
  mult_z_mul_cmp_6_a <= peaseNTT_core_inst_mult_z_mul_cmp_6_a;
  mult_z_mul_cmp_6_b <= peaseNTT_core_inst_mult_z_mul_cmp_6_b;
  peaseNTT_core_inst_mult_z_mul_cmp_6_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_6_a) * UNSIGNED(mult_z_mul_cmp_6_b)), 32));
  mult_z_mul_cmp_7_a <= peaseNTT_core_inst_mult_z_mul_cmp_7_a;
  peaseNTT_core_inst_mult_z_mul_cmp_7_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_7_a) * UNSIGNED(mult_z_mul_cmp_1_b)), 32));

END v4;



