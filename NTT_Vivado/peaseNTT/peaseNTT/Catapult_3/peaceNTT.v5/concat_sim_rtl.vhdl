
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
--  Generated by:   ls5382@newnano.poly.edu
--  Generated date: Thu Sep 16 20:26:24 2021
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

ARCHITECTURE v5 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_6_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen;

ARCHITECTURE v5 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v5;

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

ARCHITECTURE v5 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v5;

-- ------------------------------------------------------------------
--  Design Unit:    peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen;

ARCHITECTURE v5 OF peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v5;

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
    COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
    COMP_LOOP_C_185_tr0 : IN STD_LOGIC;
    COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END peaceNTT_core_core_fsm;

ARCHITECTURE v5 OF peaceNTT_core_core_fsm IS
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
      COMP_LOOP_C_184, COMP_LOOP_C_185, COPY_LOOP_1_C_0, COPY_LOOP_1_C_1, COPY_LOOP_1_C_2,
      STAGE_LOOP_C_1, main_C_1);

  SIGNAL state_var : peaceNTT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : peaceNTT_core_core_fsm_1_ST;

BEGIN
  peaceNTT_core_core_fsm_1 : PROCESS (COPY_LOOP_C_2_tr0, COMP_LOOP_C_185_tr0, COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN COPY_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001");
        state_var_NS <= COPY_LOOP_C_1;
      WHEN COPY_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010");
        state_var_NS <= COPY_LOOP_C_2;
      WHEN COPY_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000011");
        IF ( COPY_LOOP_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_0;
        ELSE
          state_var_NS <= COPY_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000101");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000110");
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000111");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001001");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001010");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001011");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001100");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001101");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001110");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001111");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010001");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010010");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010011");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010100");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010101");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010110");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010111");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011001");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011010");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011011");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011100");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011101");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011110");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00011111");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100001");
        state_var_NS <= COMP_LOOP_C_29;
      WHEN COMP_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100010");
        state_var_NS <= COMP_LOOP_C_30;
      WHEN COMP_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100011");
        state_var_NS <= COMP_LOOP_C_31;
      WHEN COMP_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100100");
        state_var_NS <= COMP_LOOP_C_32;
      WHEN COMP_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100101");
        state_var_NS <= COMP_LOOP_C_33;
      WHEN COMP_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100110");
        state_var_NS <= COMP_LOOP_C_34;
      WHEN COMP_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100111");
        state_var_NS <= COMP_LOOP_C_35;
      WHEN COMP_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101000");
        state_var_NS <= COMP_LOOP_C_36;
      WHEN COMP_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101001");
        state_var_NS <= COMP_LOOP_C_37;
      WHEN COMP_LOOP_C_37 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101010");
        state_var_NS <= COMP_LOOP_C_38;
      WHEN COMP_LOOP_C_38 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101011");
        state_var_NS <= COMP_LOOP_C_39;
      WHEN COMP_LOOP_C_39 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101100");
        state_var_NS <= COMP_LOOP_C_40;
      WHEN COMP_LOOP_C_40 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101101");
        state_var_NS <= COMP_LOOP_C_41;
      WHEN COMP_LOOP_C_41 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101110");
        state_var_NS <= COMP_LOOP_C_42;
      WHEN COMP_LOOP_C_42 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00101111");
        state_var_NS <= COMP_LOOP_C_43;
      WHEN COMP_LOOP_C_43 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110000");
        state_var_NS <= COMP_LOOP_C_44;
      WHEN COMP_LOOP_C_44 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110001");
        state_var_NS <= COMP_LOOP_C_45;
      WHEN COMP_LOOP_C_45 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110010");
        state_var_NS <= COMP_LOOP_C_46;
      WHEN COMP_LOOP_C_46 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110011");
        state_var_NS <= COMP_LOOP_C_47;
      WHEN COMP_LOOP_C_47 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110100");
        state_var_NS <= COMP_LOOP_C_48;
      WHEN COMP_LOOP_C_48 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110101");
        state_var_NS <= COMP_LOOP_C_49;
      WHEN COMP_LOOP_C_49 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110110");
        state_var_NS <= COMP_LOOP_C_50;
      WHEN COMP_LOOP_C_50 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00110111");
        state_var_NS <= COMP_LOOP_C_51;
      WHEN COMP_LOOP_C_51 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111000");
        state_var_NS <= COMP_LOOP_C_52;
      WHEN COMP_LOOP_C_52 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111001");
        state_var_NS <= COMP_LOOP_C_53;
      WHEN COMP_LOOP_C_53 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111010");
        state_var_NS <= COMP_LOOP_C_54;
      WHEN COMP_LOOP_C_54 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111011");
        state_var_NS <= COMP_LOOP_C_55;
      WHEN COMP_LOOP_C_55 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111100");
        state_var_NS <= COMP_LOOP_C_56;
      WHEN COMP_LOOP_C_56 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111101");
        state_var_NS <= COMP_LOOP_C_57;
      WHEN COMP_LOOP_C_57 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111110");
        state_var_NS <= COMP_LOOP_C_58;
      WHEN COMP_LOOP_C_58 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00111111");
        state_var_NS <= COMP_LOOP_C_59;
      WHEN COMP_LOOP_C_59 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000");
        state_var_NS <= COMP_LOOP_C_60;
      WHEN COMP_LOOP_C_60 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000001");
        state_var_NS <= COMP_LOOP_C_61;
      WHEN COMP_LOOP_C_61 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000010");
        state_var_NS <= COMP_LOOP_C_62;
      WHEN COMP_LOOP_C_62 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000011");
        state_var_NS <= COMP_LOOP_C_63;
      WHEN COMP_LOOP_C_63 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000100");
        state_var_NS <= COMP_LOOP_C_64;
      WHEN COMP_LOOP_C_64 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000101");
        state_var_NS <= COMP_LOOP_C_65;
      WHEN COMP_LOOP_C_65 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000110");
        state_var_NS <= COMP_LOOP_C_66;
      WHEN COMP_LOOP_C_66 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000111");
        state_var_NS <= COMP_LOOP_C_67;
      WHEN COMP_LOOP_C_67 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001000");
        state_var_NS <= COMP_LOOP_C_68;
      WHEN COMP_LOOP_C_68 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001001");
        state_var_NS <= COMP_LOOP_C_69;
      WHEN COMP_LOOP_C_69 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001010");
        state_var_NS <= COMP_LOOP_C_70;
      WHEN COMP_LOOP_C_70 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001011");
        state_var_NS <= COMP_LOOP_C_71;
      WHEN COMP_LOOP_C_71 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001100");
        state_var_NS <= COMP_LOOP_C_72;
      WHEN COMP_LOOP_C_72 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001101");
        state_var_NS <= COMP_LOOP_C_73;
      WHEN COMP_LOOP_C_73 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001110");
        state_var_NS <= COMP_LOOP_C_74;
      WHEN COMP_LOOP_C_74 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01001111");
        state_var_NS <= COMP_LOOP_C_75;
      WHEN COMP_LOOP_C_75 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010000");
        state_var_NS <= COMP_LOOP_C_76;
      WHEN COMP_LOOP_C_76 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010001");
        state_var_NS <= COMP_LOOP_C_77;
      WHEN COMP_LOOP_C_77 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010010");
        state_var_NS <= COMP_LOOP_C_78;
      WHEN COMP_LOOP_C_78 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010011");
        state_var_NS <= COMP_LOOP_C_79;
      WHEN COMP_LOOP_C_79 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010100");
        state_var_NS <= COMP_LOOP_C_80;
      WHEN COMP_LOOP_C_80 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010101");
        state_var_NS <= COMP_LOOP_C_81;
      WHEN COMP_LOOP_C_81 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010110");
        state_var_NS <= COMP_LOOP_C_82;
      WHEN COMP_LOOP_C_82 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01010111");
        state_var_NS <= COMP_LOOP_C_83;
      WHEN COMP_LOOP_C_83 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011000");
        state_var_NS <= COMP_LOOP_C_84;
      WHEN COMP_LOOP_C_84 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011001");
        state_var_NS <= COMP_LOOP_C_85;
      WHEN COMP_LOOP_C_85 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011010");
        state_var_NS <= COMP_LOOP_C_86;
      WHEN COMP_LOOP_C_86 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011011");
        state_var_NS <= COMP_LOOP_C_87;
      WHEN COMP_LOOP_C_87 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011100");
        state_var_NS <= COMP_LOOP_C_88;
      WHEN COMP_LOOP_C_88 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011101");
        state_var_NS <= COMP_LOOP_C_89;
      WHEN COMP_LOOP_C_89 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011110");
        state_var_NS <= COMP_LOOP_C_90;
      WHEN COMP_LOOP_C_90 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01011111");
        state_var_NS <= COMP_LOOP_C_91;
      WHEN COMP_LOOP_C_91 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100000");
        state_var_NS <= COMP_LOOP_C_92;
      WHEN COMP_LOOP_C_92 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100001");
        state_var_NS <= COMP_LOOP_C_93;
      WHEN COMP_LOOP_C_93 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100010");
        state_var_NS <= COMP_LOOP_C_94;
      WHEN COMP_LOOP_C_94 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100011");
        state_var_NS <= COMP_LOOP_C_95;
      WHEN COMP_LOOP_C_95 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100100");
        state_var_NS <= COMP_LOOP_C_96;
      WHEN COMP_LOOP_C_96 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100101");
        state_var_NS <= COMP_LOOP_C_97;
      WHEN COMP_LOOP_C_97 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100110");
        state_var_NS <= COMP_LOOP_C_98;
      WHEN COMP_LOOP_C_98 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01100111");
        state_var_NS <= COMP_LOOP_C_99;
      WHEN COMP_LOOP_C_99 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101000");
        state_var_NS <= COMP_LOOP_C_100;
      WHEN COMP_LOOP_C_100 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101001");
        state_var_NS <= COMP_LOOP_C_101;
      WHEN COMP_LOOP_C_101 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101010");
        state_var_NS <= COMP_LOOP_C_102;
      WHEN COMP_LOOP_C_102 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101011");
        state_var_NS <= COMP_LOOP_C_103;
      WHEN COMP_LOOP_C_103 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101100");
        state_var_NS <= COMP_LOOP_C_104;
      WHEN COMP_LOOP_C_104 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101101");
        state_var_NS <= COMP_LOOP_C_105;
      WHEN COMP_LOOP_C_105 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101110");
        state_var_NS <= COMP_LOOP_C_106;
      WHEN COMP_LOOP_C_106 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01101111");
        state_var_NS <= COMP_LOOP_C_107;
      WHEN COMP_LOOP_C_107 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110000");
        state_var_NS <= COMP_LOOP_C_108;
      WHEN COMP_LOOP_C_108 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110001");
        state_var_NS <= COMP_LOOP_C_109;
      WHEN COMP_LOOP_C_109 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110010");
        state_var_NS <= COMP_LOOP_C_110;
      WHEN COMP_LOOP_C_110 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110011");
        state_var_NS <= COMP_LOOP_C_111;
      WHEN COMP_LOOP_C_111 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110100");
        state_var_NS <= COMP_LOOP_C_112;
      WHEN COMP_LOOP_C_112 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110101");
        state_var_NS <= COMP_LOOP_C_113;
      WHEN COMP_LOOP_C_113 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110110");
        state_var_NS <= COMP_LOOP_C_114;
      WHEN COMP_LOOP_C_114 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01110111");
        state_var_NS <= COMP_LOOP_C_115;
      WHEN COMP_LOOP_C_115 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111000");
        state_var_NS <= COMP_LOOP_C_116;
      WHEN COMP_LOOP_C_116 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111001");
        state_var_NS <= COMP_LOOP_C_117;
      WHEN COMP_LOOP_C_117 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111010");
        state_var_NS <= COMP_LOOP_C_118;
      WHEN COMP_LOOP_C_118 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111011");
        state_var_NS <= COMP_LOOP_C_119;
      WHEN COMP_LOOP_C_119 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111100");
        state_var_NS <= COMP_LOOP_C_120;
      WHEN COMP_LOOP_C_120 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111101");
        state_var_NS <= COMP_LOOP_C_121;
      WHEN COMP_LOOP_C_121 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111110");
        state_var_NS <= COMP_LOOP_C_122;
      WHEN COMP_LOOP_C_122 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01111111");
        state_var_NS <= COMP_LOOP_C_123;
      WHEN COMP_LOOP_C_123 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000");
        state_var_NS <= COMP_LOOP_C_124;
      WHEN COMP_LOOP_C_124 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000001");
        state_var_NS <= COMP_LOOP_C_125;
      WHEN COMP_LOOP_C_125 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000010");
        state_var_NS <= COMP_LOOP_C_126;
      WHEN COMP_LOOP_C_126 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000011");
        state_var_NS <= COMP_LOOP_C_127;
      WHEN COMP_LOOP_C_127 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000100");
        state_var_NS <= COMP_LOOP_C_128;
      WHEN COMP_LOOP_C_128 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000101");
        state_var_NS <= COMP_LOOP_C_129;
      WHEN COMP_LOOP_C_129 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000110");
        state_var_NS <= COMP_LOOP_C_130;
      WHEN COMP_LOOP_C_130 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000111");
        state_var_NS <= COMP_LOOP_C_131;
      WHEN COMP_LOOP_C_131 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001000");
        state_var_NS <= COMP_LOOP_C_132;
      WHEN COMP_LOOP_C_132 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001001");
        state_var_NS <= COMP_LOOP_C_133;
      WHEN COMP_LOOP_C_133 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001010");
        state_var_NS <= COMP_LOOP_C_134;
      WHEN COMP_LOOP_C_134 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001011");
        state_var_NS <= COMP_LOOP_C_135;
      WHEN COMP_LOOP_C_135 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001100");
        state_var_NS <= COMP_LOOP_C_136;
      WHEN COMP_LOOP_C_136 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001101");
        state_var_NS <= COMP_LOOP_C_137;
      WHEN COMP_LOOP_C_137 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001110");
        state_var_NS <= COMP_LOOP_C_138;
      WHEN COMP_LOOP_C_138 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10001111");
        state_var_NS <= COMP_LOOP_C_139;
      WHEN COMP_LOOP_C_139 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010000");
        state_var_NS <= COMP_LOOP_C_140;
      WHEN COMP_LOOP_C_140 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010001");
        state_var_NS <= COMP_LOOP_C_141;
      WHEN COMP_LOOP_C_141 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010010");
        state_var_NS <= COMP_LOOP_C_142;
      WHEN COMP_LOOP_C_142 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010011");
        state_var_NS <= COMP_LOOP_C_143;
      WHEN COMP_LOOP_C_143 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010100");
        state_var_NS <= COMP_LOOP_C_144;
      WHEN COMP_LOOP_C_144 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010101");
        state_var_NS <= COMP_LOOP_C_145;
      WHEN COMP_LOOP_C_145 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010110");
        state_var_NS <= COMP_LOOP_C_146;
      WHEN COMP_LOOP_C_146 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10010111");
        state_var_NS <= COMP_LOOP_C_147;
      WHEN COMP_LOOP_C_147 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011000");
        state_var_NS <= COMP_LOOP_C_148;
      WHEN COMP_LOOP_C_148 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011001");
        state_var_NS <= COMP_LOOP_C_149;
      WHEN COMP_LOOP_C_149 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011010");
        state_var_NS <= COMP_LOOP_C_150;
      WHEN COMP_LOOP_C_150 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011011");
        state_var_NS <= COMP_LOOP_C_151;
      WHEN COMP_LOOP_C_151 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011100");
        state_var_NS <= COMP_LOOP_C_152;
      WHEN COMP_LOOP_C_152 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011101");
        state_var_NS <= COMP_LOOP_C_153;
      WHEN COMP_LOOP_C_153 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011110");
        state_var_NS <= COMP_LOOP_C_154;
      WHEN COMP_LOOP_C_154 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10011111");
        state_var_NS <= COMP_LOOP_C_155;
      WHEN COMP_LOOP_C_155 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100000");
        state_var_NS <= COMP_LOOP_C_156;
      WHEN COMP_LOOP_C_156 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100001");
        state_var_NS <= COMP_LOOP_C_157;
      WHEN COMP_LOOP_C_157 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100010");
        state_var_NS <= COMP_LOOP_C_158;
      WHEN COMP_LOOP_C_158 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100011");
        state_var_NS <= COMP_LOOP_C_159;
      WHEN COMP_LOOP_C_159 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100100");
        state_var_NS <= COMP_LOOP_C_160;
      WHEN COMP_LOOP_C_160 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100101");
        state_var_NS <= COMP_LOOP_C_161;
      WHEN COMP_LOOP_C_161 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100110");
        state_var_NS <= COMP_LOOP_C_162;
      WHEN COMP_LOOP_C_162 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10100111");
        state_var_NS <= COMP_LOOP_C_163;
      WHEN COMP_LOOP_C_163 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101000");
        state_var_NS <= COMP_LOOP_C_164;
      WHEN COMP_LOOP_C_164 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101001");
        state_var_NS <= COMP_LOOP_C_165;
      WHEN COMP_LOOP_C_165 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101010");
        state_var_NS <= COMP_LOOP_C_166;
      WHEN COMP_LOOP_C_166 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101011");
        state_var_NS <= COMP_LOOP_C_167;
      WHEN COMP_LOOP_C_167 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101100");
        state_var_NS <= COMP_LOOP_C_168;
      WHEN COMP_LOOP_C_168 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101101");
        state_var_NS <= COMP_LOOP_C_169;
      WHEN COMP_LOOP_C_169 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101110");
        state_var_NS <= COMP_LOOP_C_170;
      WHEN COMP_LOOP_C_170 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10101111");
        state_var_NS <= COMP_LOOP_C_171;
      WHEN COMP_LOOP_C_171 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110000");
        state_var_NS <= COMP_LOOP_C_172;
      WHEN COMP_LOOP_C_172 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110001");
        state_var_NS <= COMP_LOOP_C_173;
      WHEN COMP_LOOP_C_173 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110010");
        state_var_NS <= COMP_LOOP_C_174;
      WHEN COMP_LOOP_C_174 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110011");
        state_var_NS <= COMP_LOOP_C_175;
      WHEN COMP_LOOP_C_175 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110100");
        state_var_NS <= COMP_LOOP_C_176;
      WHEN COMP_LOOP_C_176 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110101");
        state_var_NS <= COMP_LOOP_C_177;
      WHEN COMP_LOOP_C_177 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110110");
        state_var_NS <= COMP_LOOP_C_178;
      WHEN COMP_LOOP_C_178 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10110111");
        state_var_NS <= COMP_LOOP_C_179;
      WHEN COMP_LOOP_C_179 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111000");
        state_var_NS <= COMP_LOOP_C_180;
      WHEN COMP_LOOP_C_180 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111001");
        state_var_NS <= COMP_LOOP_C_181;
      WHEN COMP_LOOP_C_181 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111010");
        state_var_NS <= COMP_LOOP_C_182;
      WHEN COMP_LOOP_C_182 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111011");
        state_var_NS <= COMP_LOOP_C_183;
      WHEN COMP_LOOP_C_183 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111100");
        state_var_NS <= COMP_LOOP_C_184;
      WHEN COMP_LOOP_C_184 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111101");
        state_var_NS <= COMP_LOOP_C_185;
      WHEN COMP_LOOP_C_185 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111110");
        IF ( COMP_LOOP_C_185_tr0 = '1' ) THEN
          state_var_NS <= COPY_LOOP_1_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN COPY_LOOP_1_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10111111");
        state_var_NS <= COPY_LOOP_1_C_1;
      WHEN COPY_LOOP_1_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000000");
        state_var_NS <= COPY_LOOP_1_C_2;
      WHEN COPY_LOOP_1_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000001");
        IF ( COPY_LOOP_1_C_2_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COPY_LOOP_1_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000010");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "11000011");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000");
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

END v5;

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
    clk : IN STD_LOGIC;
    xt_rsc_cgo_iro : IN STD_LOGIC;
    xt_rsci_clken_d : OUT STD_LOGIC;
    COMP_LOOP_f2_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    ensig_cgo_iro : IN STD_LOGIC;
    xt_rsc_cgo : IN STD_LOGIC;
    COMP_LOOP_f2_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    ensig_cgo : IN STD_LOGIC;
    COMP_LOOP_f2_mul_cmp_en : OUT STD_LOGIC
  );
END peaceNTT_core_wait_dp;

ARCHITECTURE v5 OF peaceNTT_core_wait_dp IS
  -- Default Constants

BEGIN
  xt_rsci_clken_d <= xt_rsc_cgo OR xt_rsc_cgo_iro;
  COMP_LOOP_f2_mul_cmp_en <= ensig_cgo OR ensig_cgo_iro;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      COMP_LOOP_f2_rem_cmp_z_oreg <= COMP_LOOP_f2_rem_cmp_z;
    END IF;
  END PROCESS;
END v5;

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
    g_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    result_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    result_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    xt_rsci_clken_d : OUT STD_LOGIC;
    xt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    COMP_LOOP_f2_rem_cmp_a : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
    COMP_LOOP_f2_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    COMP_LOOP_f2_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    result_rsci_we_d_pff : OUT STD_LOGIC;
    xt_rsci_we_d_pff : OUT STD_LOGIC
  );
END peaceNTT_core;

ARCHITECTURE v5 OF peaceNTT_core IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_rem_cmp_z_oreg : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_cmp_en : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_mul_cmp_z : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_if_nor_tmp : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL nor_tmp_2 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL nor_tmp_3 : STD_LOGIC;
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_7 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL nor_tmp_6 : STD_LOGIC;
  SIGNAL and_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL or_tmp_17 : STD_LOGIC;
  SIGNAL or_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_31 : STD_LOGIC;
  SIGNAL or_tmp_22 : STD_LOGIC;
  SIGNAL not_tmp_29 : STD_LOGIC;
  SIGNAL mux_tmp_41 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL mux_tmp_65 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_COMP_LOOP_if_nor_svs_st : STD_LOGIC;
  SIGNAL reg_xt_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL and_82_cse : STD_LOGIC;
  SIGNAL reg_modulo_dev_result_rem_cmp_b_63_0_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL or_32_cse : STD_LOGIC;
  SIGNAL and_84_cse : STD_LOGIC;
  SIGNAL and_32_rmff : STD_LOGIC;
  SIGNAL and_63_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_mul_cmp_a_mx0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_8_0_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL modulo_dev_1_mux_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_acc_cse_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lst_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL STAGE_LOOP_lst_sva_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_3_psp : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_3_psp_mx0w0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_9_0_mx0c2 : STD_LOGIC;
  SIGNAL or_tmp : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_1_10_9 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_10_0_sva_1_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL nor_42_cse : STD_LOGIC;
  SIGNAL and_cse : STD_LOGIC;
  SIGNAL mux_93_cse : STD_LOGIC;

  SIGNAL mux_28_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL or_14_nl : STD_LOGIC;
  SIGNAL mux_37_nl : STD_LOGIC;
  SIGNAL mux_36_nl : STD_LOGIC;
  SIGNAL or_12_nl : STD_LOGIC;
  SIGNAL or_11_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL or_21_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL or_16_nl : STD_LOGIC;
  SIGNAL and_60_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL or_22_nl : STD_LOGIC;
  SIGNAL nor_27_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL mux_51_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL nor_31_nl : STD_LOGIC;
  SIGNAL nor_32_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_i_mux_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COPY_LOOP_1_i_not_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_r_COMP_LOOP_r_and_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL COMP_LOOP_r_not_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nand_nl : STD_LOGIC;
  SIGNAL mux_95_nl : STD_LOGIC;
  SIGNAL mux_94_nl : STD_LOGIC;
  SIGNAL nor_41_nl : STD_LOGIC;
  SIGNAL and_75_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL mux_72_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL STAGE_LOOP_lst_nor_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL or_38_nl : STD_LOGIC;
  SIGNAL mux_86_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL and_78_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_nand_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL nor_21_nl : STD_LOGIC;
  SIGNAL nor_22_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_if_and_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_38_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_COPY_LOOP_nand_nl : STD_LOGIC;
  SIGNAL mux_89_nl : STD_LOGIC;
  SIGNAL COPY_LOOP_1_mux_1_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL and_132_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_mux_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_4_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL modulo_dev_result_rem_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL modulo_dev_result_rem_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL COMP_LOOP_f2_mul_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_mul_cmp_z_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);

  SIGNAL STAGE_LOOP_base_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_base_lshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  COMPONENT peaceNTT_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      xt_rsc_cgo_iro : IN STD_LOGIC;
      xt_rsci_clken_d : OUT STD_LOGIC;
      COMP_LOOP_f2_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      ensig_cgo_iro : IN STD_LOGIC;
      xt_rsc_cgo : IN STD_LOGIC;
      COMP_LOOP_f2_rem_cmp_z_oreg : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      ensig_cgo : IN STD_LOGIC;
      COMP_LOOP_f2_mul_cmp_en : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z : STD_LOGIC_VECTOR (63
      DOWNTO 0);
  SIGNAL peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z_oreg : STD_LOGIC_VECTOR
      (63 DOWNTO 0);

  COMPONENT peaceNTT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      COPY_LOOP_C_2_tr0 : IN STD_LOGIC;
      COMP_LOOP_C_185_tr0 : IN STD_LOGIC;
      COPY_LOOP_1_C_2_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COMP_LOOP_C_185_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 : STD_LOGIC;
  SIGNAL peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

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
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_vec_rsc_triosy_obj_ld_cse,
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

  COMP_LOOP_f2_mul_cmp : work.mgc_comps.mgc_mul_pipe
    GENERIC MAP(
      width_a => 64,
      signd_a => 0,
      width_b => 64,
      signd_b => 0,
      width_z => 128,
      clock_edge => 1,
      enable_active => 1,
      a_rst_active => 0,
      s_rst_active => 1,
      stages => 11,
      n_inreg => 2
      )
    PORT MAP(
      a => COMP_LOOP_f2_mul_cmp_a,
      b => COMP_LOOP_f2_mul_cmp_b,
      clk => clk,
      en => COMP_LOOP_f2_mul_cmp_en,
      a_rst => '1',
      s_rst => rst,
      z => COMP_LOOP_f2_mul_cmp_z_1
    );
  COMP_LOOP_f2_mul_cmp_a <= COMP_LOOP_f2_mul_cmp_a_mx0;
  COMP_LOOP_f2_mul_cmp_b <= xt_rsci_q_d;
  COMP_LOOP_f2_mul_cmp_z <= COMP_LOOP_f2_mul_cmp_z_1;

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
  STAGE_LOOP_base_lshift_rg_s <= z_out_2(3 DOWNTO 0);
  STAGE_LOOP_base_lshift_itm <= STAGE_LOOP_base_lshift_rg_z;

  peaceNTT_core_wait_dp_inst : peaceNTT_core_wait_dp
    PORT MAP(
      clk => clk,
      xt_rsc_cgo_iro => and_32_rmff,
      xt_rsci_clken_d => xt_rsci_clken_d,
      COMP_LOOP_f2_rem_cmp_z => peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z,
      ensig_cgo_iro => and_63_rmff,
      xt_rsc_cgo => reg_xt_rsc_cgo_cse,
      COMP_LOOP_f2_rem_cmp_z_oreg => peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z_oreg,
      ensig_cgo => reg_ensig_cgo_cse,
      COMP_LOOP_f2_mul_cmp_en => COMP_LOOP_f2_mul_cmp_en
    );
  peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z <= COMP_LOOP_f2_rem_cmp_z;
  COMP_LOOP_f2_rem_cmp_z_oreg <= peaceNTT_core_wait_dp_inst_COMP_LOOP_f2_rem_cmp_z_oreg;

  peaceNTT_core_core_fsm_inst : peaceNTT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => peaceNTT_core_core_fsm_inst_fsm_output,
      COPY_LOOP_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0,
      COMP_LOOP_C_185_tr0 => peaceNTT_core_core_fsm_inst_COMP_LOOP_C_185_tr0,
      COPY_LOOP_1_C_2_tr0 => peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0,
      STAGE_LOOP_C_1_tr0 => peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= peaceNTT_core_core_fsm_inst_fsm_output;
  peaceNTT_core_core_fsm_inst_COPY_LOOP_C_2_tr0 <= COPY_LOOP_1_i_10_0_sva_1_10_9(1);
  peaceNTT_core_core_fsm_inst_COMP_LOOP_C_185_tr0 <= COPY_LOOP_1_i_10_0_sva_9_0(9);
  peaceNTT_core_core_fsm_inst_COPY_LOOP_1_C_2_tr0 <= COPY_LOOP_1_i_10_0_sva_1_10_9(1);
  peaceNTT_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= z_out_2(4);

  or_14_nl <= (NOT (fsm_output(6))) OR (fsm_output(2)) OR (NOT (fsm_output(7)));
  mux_38_nl <= MUX_s_1_2_2(or_14_nl, or_32_cse, fsm_output(1));
  or_12_nl <= (NOT (fsm_output(2))) OR (fsm_output(7));
  or_11_nl <= (fsm_output(2)) OR (NOT (fsm_output(7)));
  mux_36_nl <= MUX_s_1_2_2(or_12_nl, or_11_nl, fsm_output(6));
  mux_37_nl <= MUX_s_1_2_2(mux_36_nl, or_32_cse, fsm_output(1));
  mux_39_nl <= MUX_s_1_2_2(mux_38_nl, mux_37_nl, fsm_output(0));
  and_32_rmff <= (NOT mux_39_nl) AND and_dcpl_28 AND (NOT (fsm_output(3)));
  and_82_cse <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("11"));
  and_84_cse <= CONV_SL_1_1(fsm_output(4 DOWNTO 2)=STD_LOGIC_VECTOR'("111"));
  COMP_LOOP_f2_rem_cmp_b <= reg_modulo_dev_result_rem_cmp_b_63_0_cse;
  mux_57_nl <= MUX_s_1_2_2((fsm_output(4)), (NOT (fsm_output(4))), fsm_output(3));
  nor_31_nl <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("01")));
  mux_58_nl <= MUX_s_1_2_2(mux_57_nl, nor_31_nl, fsm_output(2));
  nor_32_nl <= NOT((NOT(CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"))))
      OR (fsm_output(4)));
  mux_59_nl <= MUX_s_1_2_2(mux_58_nl, nor_32_nl, fsm_output(1));
  and_63_rmff <= mux_59_nl AND and_dcpl_6 AND (NOT (fsm_output(6)));
  or_32_cse <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)/=STD_LOGIC_VECTOR'("00"));
  mux_77_nl <= MUX_s_1_2_2(mux_tmp_65, mux_tmp_55, fsm_output(0));
  COMP_LOOP_r_not_nl <= NOT mux_77_nl;
  COMP_LOOP_r_COMP_LOOP_r_and_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (COPY_LOOP_1_i_10_0_sva_9_0(8
      DOWNTO 0)), COMP_LOOP_r_not_nl);
  mux_68_nl <= MUX_s_1_2_2(mux_tmp_4, mux_tmp_55, fsm_output(0));
  COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt <= MUX_v_11_2_2((STD_LOGIC_VECTOR'( "00") &
      COMP_LOOP_r_COMP_LOOP_r_and_nl), z_out, mux_68_nl);
  nor_42_cse <= NOT((fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3))
      OR (fsm_output(4)));
  mux_93_cse <= MUX_s_1_2_2(nor_42_cse, and_cse, fsm_output(1));
  COMP_LOOP_acc_3_psp_mx0w0 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(COMP_LOOP_acc_1_itm)
      - SIGNED(COMP_LOOP_f2_rem_cmp_z_oreg), 64));
  COMP_LOOP_f2_mul_cmp_a_mx0 <= MUX_v_64_2_2(STAGE_LOOP_lst_sva, twiddle_rsci_q_d,
      COMP_LOOP_COMP_LOOP_if_nor_svs_st);
  COMP_LOOP_COMP_LOOP_if_nor_tmp <= NOT(((COPY_LOOP_1_i_10_0_sva_1_8_0(8)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(8)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(7)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(7)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(6)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(6)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(5)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(5)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(4)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(4)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(3)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(3)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(2)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(2)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(1)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(1)))) OR ((COPY_LOOP_1_i_10_0_sva_1_8_0(0)) AND (NOT
      (STAGE_LOOP_base_8_0_sva(0)))));
  mux_tmp_4 <= MUX_s_1_2_2(nor_42_cse, (fsm_output(7)), fsm_output(6));
  nor_tmp_2 <= (CONV_SL_1_1(fsm_output(5 DOWNTO 2)/=STD_LOGIC_VECTOR'("0000"))) AND
      (fsm_output(7));
  mux_tmp_8 <= MUX_s_1_2_2(nor_42_cse, nor_tmp_2, fsm_output(6));
  nor_tmp_3 <= CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("11"));
  and_tmp <= (fsm_output(6)) AND nor_tmp_2;
  and_dcpl_2 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_5 <= NOT(CONV_SL_1_1(fsm_output(4 DOWNTO 3)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_6 <= NOT((fsm_output(7)) OR (fsm_output(5)));
  and_dcpl_7 <= and_dcpl_6 AND and_dcpl_5;
  and_dcpl_9 <= (fsm_output(2)) AND (NOT (fsm_output(6)));
  and_dcpl_10 <= and_dcpl_9 AND and_dcpl_2;
  and_dcpl_11 <= CONV_SL_1_1(fsm_output(4 DOWNTO 3)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_13 <= (fsm_output(7)) AND (fsm_output(5)) AND and_dcpl_11;
  nor_tmp_6 <= CONV_SL_1_1(fsm_output(5 DOWNTO 4)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_19 <= and_dcpl_9 AND CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_25 <= and_dcpl_6 AND (NOT (fsm_output(4)));
  and_dcpl_28 <= NOT(CONV_SL_1_1(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_31 <= NOT(CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_34 <= (fsm_output(7)) AND (NOT (fsm_output(5)));
  and_dcpl_37 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  mux_40_nl <= MUX_s_1_2_2(nor_tmp_3, (NOT or_32_cse), fsm_output(1));
  and_dcpl_42 <= mux_40_nl AND (NOT (fsm_output(5)));
  and_dcpl_56 <= and_dcpl_6 AND and_dcpl_11 AND (fsm_output(2)) AND (fsm_output(6))
      AND and_dcpl_37;
  or_tmp_17 <= and_82_cse OR (fsm_output(4)) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  or_tmp_18 <= (NOT (fsm_output(5))) OR (fsm_output(7));
  mux_tmp_31 <= MUX_s_1_2_2(or_tmp_17, or_tmp_18, fsm_output(6));
  or_tmp_22 <= and_84_cse OR (fsm_output(5));
  not_tmp_29 <= NOT(((CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00")))
      AND (fsm_output(4))) OR (fsm_output(5)));
  mux_tmp_41 <= MUX_s_1_2_2(not_tmp_29, or_tmp_22, fsm_output(6));
  and_dcpl_65 <= and_dcpl_7 AND and_dcpl_10;
  mux_65_nl <= MUX_s_1_2_2(and_dcpl_7, and_dcpl_13, fsm_output(2));
  mux_tmp_55 <= MUX_s_1_2_2(mux_65_nl, (fsm_output(7)), fsm_output(6));
  mux_tmp_64 <= MUX_s_1_2_2(and_dcpl_7, (fsm_output(7)), fsm_output(6));
  mux_tmp_65 <= MUX_s_1_2_2(mux_tmp_64, mux_tmp_4, fsm_output(1));
  or_dcpl_4 <= (fsm_output(7)) OR (fsm_output(5));
  or_dcpl_7 <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  and_cse <= (fsm_output(2)) AND (fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(5))
      AND (fsm_output(7));
  COPY_LOOP_1_i_10_0_sva_9_0_mx0c2 <= mux_93_cse AND (NOT (fsm_output(6))) AND (NOT
      (fsm_output(0)));
  vec_rsci_radr_d_pff <= COPY_LOOP_1_i_10_0_sva_9_0;
  vec_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_7 AND (NOT((fsm_output(2))
      OR (fsm_output(6)))) AND and_dcpl_2;
  result_rsci_d_d <= modulo_dev_1_mux_itm;
  COMP_LOOP_nand_nl <= NOT(and_dcpl_13 AND and_dcpl_10);
  result_rsci_wadr_d <= COMP_LOOP_nand_nl & COPY_LOOP_1_i_10_0_sva_1_8_0;
  nor_21_nl <= NOT((NOT (fsm_output(1))) OR (fsm_output(4)) OR (fsm_output(5)));
  nor_22_nl <= NOT((fsm_output(1)) OR (NOT nor_tmp_6));
  mux_35_nl <= MUX_s_1_2_2(nor_21_nl, nor_22_nl, fsm_output(0));
  result_rsci_we_d_pff <= mux_35_nl AND (fsm_output(7)) AND (fsm_output(3)) AND and_dcpl_9;
  result_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_13 AND and_dcpl_19;
  COMP_LOOP_if_and_nl <= COPY_LOOP_1_i_10_0_sva_1_8_0 AND STAGE_LOOP_base_8_0_sva;
  twiddle_rsci_radr_d <= '0' & COMP_LOOP_if_and_nl;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_25 AND (NOT (fsm_output(3)))
      AND (fsm_output(2)) AND (NOT (fsm_output(6))) AND (NOT (fsm_output(1))) AND
      (fsm_output(0)) AND COMP_LOOP_COMP_LOOP_if_nor_tmp;
  and_38_nl <= and_dcpl_34 AND and_dcpl_5 AND (NOT (fsm_output(2))) AND (fsm_output(6))
      AND and_dcpl_31;
  xt_rsci_d_d <= MUX_v_64_2_2(vec_rsci_q_d, result_rsci_q_d, and_38_nl);
  COPY_LOOP_COPY_LOOP_nand_nl <= NOT(and_dcpl_7 AND and_dcpl_9 AND and_dcpl_37);
  xt_rsci_radr_d <= COPY_LOOP_1_i_10_0_sva_1_8_0 & COPY_LOOP_COPY_LOOP_nand_nl;
  xt_rsci_we_d_pff <= and_dcpl_42 AND and_dcpl_5 AND (NOT (fsm_output(2))) AND (NOT
      (fsm_output(0)));
  xt_rsci_readA_r_ram_ir_internal_RMASK_B_d <= and_dcpl_7 AND and_dcpl_9 AND ((fsm_output(1))
      XOR (fsm_output(0)));
  mux_89_nl <= MUX_s_1_2_2(nor_tmp_6, and_dcpl_28, fsm_output(0));
  and_dcpl_95 <= mux_89_nl AND (fsm_output(3)) AND (fsm_output(7)) AND (fsm_output(2))
      AND (NOT((fsm_output(6)) OR (fsm_output(1))));
  or_tmp <= (fsm_output(2)) OR (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3))
      OR (fsm_output(4));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_28_nl, mux_26_nl, fsm_output(0))) = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_xt_rsc_cgo_cse <= '0';
        reg_vec_rsc_triosy_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        COMP_LOOP_COMP_LOOP_if_nor_svs_st <= '0';
      ELSE
        reg_xt_rsc_cgo_cse <= and_32_rmff;
        reg_vec_rsc_triosy_obj_ld_cse <= and_dcpl_34 AND (NOT (fsm_output(4))) AND
            (NOT (fsm_output(3))) AND (NOT (fsm_output(2))) AND (fsm_output(6)) AND
            (fsm_output(1)) AND (NOT (fsm_output(0))) AND (z_out_2(4));
        reg_ensig_cgo_cse <= and_63_rmff;
        COMP_LOOP_COMP_LOOP_if_nor_svs_st <= COMP_LOOP_COMP_LOOP_if_nor_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      modulo_dev_result_rem_cmp_a_63_0 <= MUX1HOT_v_64_3_2(COMP_LOOP_acc_3_psp_mx0w0,
          COMP_LOOP_acc_3_psp, COMP_LOOP_acc_1_itm, STD_LOGIC_VECTOR'( and_dcpl_56
          & (NOT mux_46_nl) & and_60_nl));
      reg_modulo_dev_result_rem_cmp_b_63_0_cse <= p_sva;
      COMP_LOOP_f2_rem_cmp_a <= MUX_v_128_2_2(COMP_LOOP_f2_mul_cmp_z, COMP_LOOP_f2_mul_mut,
          nor_27_nl);
      modulo_dev_1_mux_itm <= MUX_v_64_2_2((modulo_dev_result_rem_cmp_z(63 DOWNTO
          0)), z_out_1, modulo_dev_result_rem_cmp_z(63));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_10_0_sva_9_0 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( ((and_dcpl_42 AND and_dcpl_5 AND (NOT (fsm_output(2))) AND (fsm_output(0)))
          OR and_dcpl_65 OR COPY_LOOP_1_i_10_0_sva_9_0_mx0c2) = '1' ) THEN
        COPY_LOOP_1_i_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            COPY_LOOP_1_i_mux_nl, COPY_LOOP_1_i_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_10_0_sva_1_10_9 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( mux_92_nl = '0' ) THEN
        COPY_LOOP_1_i_10_0_sva_1_10_9 <= COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt(10 DOWNTO
            9);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        COPY_LOOP_1_i_10_0_sva_1_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (mux_95_nl AND (NOT (fsm_output(6)))) = '1' ) THEN
        COPY_LOOP_1_i_10_0_sva_1_8_0 <= COPY_LOOP_1_i_COPY_LOOP_1_i_mux_rgt(8 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_73_nl, mux_20_nl, fsm_output(0))) = '1' ) THEN
        STAGE_LOOP_base_acc_cse_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"), (z_out_2(3
            DOWNTO 0)), and_75_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_tmp_65, mux_79_nl, fsm_output(0))) = '1' ) THEN
        STAGE_LOOP_base_8_0_sva <= STAGE_LOOP_base_lshift_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (CONV_SL_1_1(fsm_output/=STD_LOGIC_VECTOR'("00000101"))) = '1' ) THEN
        STAGE_LOOP_lst_sva <= MUX_v_64_2_2(STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000"),
            STAGE_LOOP_lst_sva_dfm, STAGE_LOOP_lst_nor_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (MUX_s_1_2_2(mux_86_nl, mux_82_nl, fsm_output(0))) = '1' ) THEN
        STAGE_LOOP_lst_sva_dfm <= COMP_LOOP_f2_mul_cmp_a_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((and_dcpl_7 AND and_dcpl_19) OR and_dcpl_56) = '1' ) THEN
        COMP_LOOP_acc_1_itm <= MUX_v_64_2_2(xt_rsci_q_d, z_out_1, and_dcpl_56);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_4 OR (NOT (fsm_output(4))) OR (fsm_output(3)) OR (fsm_output(2))
          OR (fsm_output(6)) OR or_dcpl_7)) = '1' ) THEN
        COMP_LOOP_f2_mul_mut <= COMP_LOOP_f2_mul_cmp_z;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(or_dcpl_4 OR (NOT (fsm_output(4))) OR (NOT (fsm_output(3))) OR (NOT
          (fsm_output(2))) OR (NOT (fsm_output(6))) OR or_dcpl_7)) = '1' ) THEN
        COMP_LOOP_acc_3_psp <= COMP_LOOP_acc_3_psp_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  mux_28_nl <= MUX_s_1_2_2(mux_tmp_8, and_tmp, fsm_output(1));
  mux_26_nl <= MUX_s_1_2_2(and_tmp, nor_tmp_3, fsm_output(1));
  or_21_nl <= (fsm_output(4)) OR (fsm_output(5)) OR (NOT (fsm_output(7)));
  mux_44_nl <= MUX_s_1_2_2(or_21_nl, or_tmp_18, fsm_output(6));
  mux_45_nl <= MUX_s_1_2_2(mux_44_nl, mux_tmp_31, fsm_output(1));
  or_16_nl <= (NOT(and_84_cse OR (fsm_output(5)))) OR (fsm_output(7));
  mux_41_nl <= MUX_s_1_2_2(or_tmp_17, or_16_nl, fsm_output(6));
  mux_43_nl <= MUX_s_1_2_2(mux_tmp_31, mux_41_nl, fsm_output(1));
  mux_46_nl <= MUX_s_1_2_2(mux_45_nl, mux_43_nl, fsm_output(0));
  mux_48_nl <= MUX_s_1_2_2((NOT (fsm_output(5))), (fsm_output(5)), fsm_output(4));
  mux_49_nl <= MUX_s_1_2_2(and_dcpl_28, mux_48_nl, and_82_cse);
  mux_47_nl <= MUX_s_1_2_2(and_dcpl_28, nor_tmp_6, and_82_cse);
  or_22_nl <= CONV_SL_1_1(fsm_output(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_50_nl <= MUX_s_1_2_2(mux_49_nl, mux_47_nl, or_22_nl);
  and_60_nl <= (NOT mux_50_nl) AND CONV_SL_1_1(fsm_output(7 DOWNTO 6)=STD_LOGIC_VECTOR'("10"));
  mux_54_nl <= MUX_s_1_2_2(not_tmp_29, (fsm_output(5)), fsm_output(6));
  mux_55_nl <= MUX_s_1_2_2(mux_54_nl, mux_tmp_41, fsm_output(1));
  mux_51_nl <= MUX_s_1_2_2(and_dcpl_28, or_tmp_22, fsm_output(6));
  mux_53_nl <= MUX_s_1_2_2(mux_tmp_41, mux_51_nl, fsm_output(1));
  mux_56_nl <= MUX_s_1_2_2(mux_55_nl, mux_53_nl, fsm_output(0));
  nor_27_nl <= NOT(mux_56_nl OR (fsm_output(7)));
  COPY_LOOP_1_i_mux_nl <= MUX_v_10_2_2(((COPY_LOOP_1_i_10_0_sva_1_10_9(0)) & COPY_LOOP_1_i_10_0_sva_1_8_0),
      (z_out(9 DOWNTO 0)), and_dcpl_65);
  COPY_LOOP_1_i_not_nl <= NOT COPY_LOOP_1_i_10_0_sva_9_0_mx0c2;
  mux_91_nl <= MUX_s_1_2_2((NOT or_tmp), (fsm_output(7)), fsm_output(6));
  nand_nl <= NOT((fsm_output(2)) AND (fsm_output(7)) AND (fsm_output(5)) AND (fsm_output(3))
      AND (fsm_output(4)));
  mux_nl <= MUX_s_1_2_2(nand_nl, or_tmp, fsm_output(1));
  mux_90_nl <= MUX_s_1_2_2((NOT mux_nl), (fsm_output(7)), fsm_output(6));
  mux_92_nl <= MUX_s_1_2_2(mux_91_nl, mux_90_nl, fsm_output(0));
  nor_41_nl <= NOT((NOT (fsm_output(2))) OR (fsm_output(7)) OR (fsm_output(5)) OR
      (fsm_output(3)) OR (fsm_output(4)));
  mux_94_nl <= MUX_s_1_2_2(nor_41_nl, and_cse, fsm_output(1));
  mux_95_nl <= MUX_s_1_2_2(mux_94_nl, mux_93_cse, fsm_output(0));
  and_75_nl <= and_dcpl_7 AND and_dcpl_9 AND and_dcpl_31;
  mux_72_nl <= MUX_s_1_2_2(and_dcpl_7, nor_tmp_2, fsm_output(6));
  mux_73_nl <= MUX_s_1_2_2(mux_72_nl, mux_tmp_8, fsm_output(1));
  mux_20_nl <= MUX_s_1_2_2(mux_tmp_8, mux_tmp_4, fsm_output(1));
  mux_79_nl <= MUX_s_1_2_2(mux_tmp_4, mux_tmp_55, fsm_output(1));
  nand_1_nl <= NOT((fsm_output(1)) AND (fsm_output(3)) AND (fsm_output(4)) AND (fsm_output(5))
      AND (fsm_output(7)));
  or_38_nl <= (fsm_output(1)) OR (fsm_output(3)) OR (fsm_output(4)) OR (fsm_output(5))
      OR (fsm_output(7));
  mux_81_nl <= MUX_s_1_2_2(nand_1_nl, or_38_nl, fsm_output(0));
  STAGE_LOOP_lst_nor_nl <= NOT(mux_81_nl OR (NOT (fsm_output(2))) OR (fsm_output(6)));
  and_78_nl <= (fsm_output(4)) AND (fsm_output(5)) AND (fsm_output(7));
  mux_83_nl <= MUX_s_1_2_2(and_dcpl_25, and_78_nl, fsm_output(3));
  mux_84_nl <= MUX_s_1_2_2(and_dcpl_7, mux_83_nl, fsm_output(2));
  mux_85_nl <= MUX_s_1_2_2(mux_84_nl, (fsm_output(7)), fsm_output(6));
  mux_86_nl <= MUX_s_1_2_2(mux_tmp_64, mux_85_nl, fsm_output(1));
  mux_82_nl <= MUX_s_1_2_2(mux_tmp_64, mux_tmp_55, fsm_output(1));
  and_132_nl <= and_dcpl_28 AND (NOT((fsm_output(3)) OR (fsm_output(7)))) AND (fsm_output(2))
      AND (NOT (fsm_output(6))) AND (NOT (fsm_output(1))) AND (fsm_output(0));
  COPY_LOOP_1_mux_1_nl <= MUX_v_10_2_2(COPY_LOOP_1_i_10_0_sva_9_0, ('0' & COPY_LOOP_1_i_10_0_sva_1_8_0),
      and_132_nl);
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COPY_LOOP_1_mux_1_nl),
      11) + UNSIGNED'( "00000000001"), 11));
  COMP_LOOP_mux_3_nl <= MUX_v_64_2_2(COMP_LOOP_acc_1_itm, (modulo_dev_result_rem_cmp_z(63
      DOWNTO 0)), and_dcpl_95);
  COMP_LOOP_mux_4_nl <= MUX_v_64_2_2(COMP_LOOP_f2_rem_cmp_z_oreg, p_sva, and_dcpl_95);
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_3_nl) + UNSIGNED(COMP_LOOP_mux_4_nl),
      64));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_base_acc_cse_sva),
      4), 5) + UNSIGNED'( "11111"), 5));
END v5;

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
    vec_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
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
    result_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC
  );
END peaceNTT;

ARCHITECTURE v5 OF peaceNTT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL result_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL xt_rsci_clken_d : STD_LOGIC;
  SIGNAL xt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL COMP_LOOP_f2_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_clken : STD_LOGIC;
  SIGNAL xt_rsc_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsc_we : STD_LOGIC;
  SIGNAL xt_rsc_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_radr_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL result_rsci_we_d_iff : STD_LOGIC;
  SIGNAL xt_rsci_we_d_iff : STD_LOGIC;

  SIGNAL COMP_LOOP_f2_rem_cmp_a_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_rem_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_f2_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL xt_rsc_comp_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_comp_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL vec_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

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

  COMPONENT peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

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
      g_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      result_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      result_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      result_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      xt_rsci_clken_d : OUT STD_LOGIC;
      xt_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      COMP_LOOP_f2_rem_cmp_a : OUT STD_LOGIC_VECTOR (127 DOWNTO 0);
      COMP_LOOP_f2_rem_cmp_b : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      COMP_LOOP_f2_rem_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      result_rsci_we_d_pff : OUT STD_LOGIC;
      xt_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL peaceNTT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_vec_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_result_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_xt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL peaceNTT_core_inst_vec_rsci_radr_d_pff : STD_LOGIC_VECTOR (9 DOWNTO 0);

BEGIN
  COMP_LOOP_f2_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 128,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => COMP_LOOP_f2_rem_cmp_a_1,
      b => COMP_LOOP_f2_rem_cmp_b_1,
      z => COMP_LOOP_f2_rem_cmp_z_1
    );
  COMP_LOOP_f2_rem_cmp_a_1 <= COMP_LOOP_f2_rem_cmp_a;
  COMP_LOOP_f2_rem_cmp_b_1 <= COMP_LOOP_f2_rem_cmp_b;
  COMP_LOOP_f2_rem_cmp_z <= COMP_LOOP_f2_rem_cmp_z_1;

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

  vec_rsci : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_1_10_64_1024_1024_64_1_gen
    PORT MAP(
      q => vec_rsci_q,
      radr => vec_rsci_radr,
      q_d => vec_rsci_q_d_1,
      radr_d => vec_rsci_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsci_q <= vec_rsc_q;
  vec_rsc_radr <= vec_rsci_radr;
  vec_rsci_q_d <= vec_rsci_q_d_1;
  vec_rsci_radr_d <= vec_rsci_radr_d_iff;

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
  result_rsci_radr_d <= vec_rsci_radr_d_iff;
  result_rsci_wadr_d_1 <= result_rsci_wadr_d;

  twiddle_rsci : peaceNTT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_5_10_64_1024_1024_64_1_gen
    PORT MAP(
      q => twiddle_rsci_q,
      radr => twiddle_rsci_radr,
      q_d => twiddle_rsci_q_d_1,
      radr_d => twiddle_rsci_radr_d_1,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  twiddle_rsci_q <= twiddle_rsc_q;
  twiddle_rsc_radr <= twiddle_rsci_radr;
  twiddle_rsci_q_d <= twiddle_rsci_q_d_1;
  twiddle_rsci_radr_d_1 <= twiddle_rsci_radr_d;

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
  xt_rsci_wadr_d <= vec_rsci_radr_d_iff;

  peaceNTT_core_inst : peaceNTT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => peaceNTT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      g_rsc_triosy_lz => g_rsc_triosy_lz,
      result_rsc_triosy_lz => result_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      vec_rsci_q_d => peaceNTT_core_inst_vec_rsci_q_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      result_rsci_d_d => peaceNTT_core_inst_result_rsci_d_d,
      result_rsci_q_d => peaceNTT_core_inst_result_rsci_q_d,
      result_rsci_wadr_d => peaceNTT_core_inst_result_rsci_wadr_d,
      result_rsci_readA_r_ram_ir_internal_RMASK_B_d => result_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_q_d => peaceNTT_core_inst_twiddle_rsci_q_d,
      twiddle_rsci_radr_d => peaceNTT_core_inst_twiddle_rsci_radr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      xt_rsci_clken_d => xt_rsci_clken_d,
      xt_rsci_d_d => peaceNTT_core_inst_xt_rsci_d_d,
      xt_rsci_q_d => peaceNTT_core_inst_xt_rsci_q_d,
      xt_rsci_radr_d => peaceNTT_core_inst_xt_rsci_radr_d,
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d => xt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      COMP_LOOP_f2_rem_cmp_a => peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_a,
      COMP_LOOP_f2_rem_cmp_b => peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_b,
      COMP_LOOP_f2_rem_cmp_z => peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_z,
      vec_rsci_radr_d_pff => peaceNTT_core_inst_vec_rsci_radr_d_pff,
      result_rsci_we_d_pff => result_rsci_we_d_iff,
      xt_rsci_we_d_pff => xt_rsci_we_d_iff
    );
  peaceNTT_core_inst_p_rsc_dat <= p_rsc_dat;
  peaceNTT_core_inst_vec_rsci_q_d <= vec_rsci_q_d;
  result_rsci_d_d <= peaceNTT_core_inst_result_rsci_d_d;
  peaceNTT_core_inst_result_rsci_q_d <= result_rsci_q_d;
  result_rsci_wadr_d <= peaceNTT_core_inst_result_rsci_wadr_d;
  peaceNTT_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_radr_d <= peaceNTT_core_inst_twiddle_rsci_radr_d;
  xt_rsci_d_d <= peaceNTT_core_inst_xt_rsci_d_d;
  peaceNTT_core_inst_xt_rsci_q_d <= xt_rsci_q_d;
  xt_rsci_radr_d <= peaceNTT_core_inst_xt_rsci_radr_d;
  COMP_LOOP_f2_rem_cmp_a <= peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_a;
  COMP_LOOP_f2_rem_cmp_b <= peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_b;
  peaceNTT_core_inst_COMP_LOOP_f2_rem_cmp_z <= COMP_LOOP_f2_rem_cmp_z;
  vec_rsci_radr_d_iff <= peaceNTT_core_inst_vec_rsci_radr_d_pff;

END v5;



