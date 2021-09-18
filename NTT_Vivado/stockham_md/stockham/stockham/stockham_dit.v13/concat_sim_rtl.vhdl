
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
--  Generated date: Wed Sep 15 18:27:44 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(13 DOWNTO 7));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(6 DOWNTO 0));
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen;

ARCHITECTURE v13 OF stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core_core_fsm
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


ENTITY stockham_dit_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
    for_for_C_2_tr0 : IN STD_LOGIC;
    for_C_0_tr0 : IN STD_LOGIC
  );
END stockham_dit_core_core_fsm;

ARCHITECTURE v13 OF stockham_dit_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for stockham_dit_core_core_fsm_1
  TYPE stockham_dit_core_core_fsm_1_ST IS (main_C_0, for_for_C_0, for_for_C_1, for_for_C_2,
      for_C_0, main_C_1);

  SIGNAL state_var : stockham_dit_core_core_fsm_1_ST;
  SIGNAL state_var_NS : stockham_dit_core_core_fsm_1_ST;

BEGIN
  stockham_dit_core_core_fsm_1 : PROCESS (for_for_C_2_tr0, for_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN for_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000010");
        state_var_NS <= for_for_C_1;
      WHEN for_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "000100");
        state_var_NS <= for_for_C_2;
      WHEN for_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "001000");
        IF ( for_for_C_2_tr0 = '1' ) THEN
          state_var_NS <= for_C_0;
        ELSE
          state_var_NS <= for_for_C_0;
        END IF;
      WHEN for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010000");
        IF ( for_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= for_for_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "000001");
        state_var_NS <= for_for_C_0;
    END CASE;
  END PROCESS stockham_dit_core_core_fsm_1;

  stockham_dit_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS stockham_dit_core_core_fsm_1_REG;

END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_core_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    yt_rsc_0_0_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_1_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_2_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_3_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_4_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_5_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_6_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_7_cgo_iro : IN STD_LOGIC;
    yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
    ensig_cgo_iro : IN STD_LOGIC;
    mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    yt_rsc_0_0_cgo : IN STD_LOGIC;
    yt_rsc_0_1_cgo : IN STD_LOGIC;
    yt_rsc_0_2_cgo : IN STD_LOGIC;
    yt_rsc_0_3_cgo : IN STD_LOGIC;
    yt_rsc_0_4_cgo : IN STD_LOGIC;
    yt_rsc_0_5_cgo : IN STD_LOGIC;
    yt_rsc_0_6_cgo : IN STD_LOGIC;
    yt_rsc_0_7_cgo : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    mult_t_mul_cmp_en : OUT STD_LOGIC;
    mult_z_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END stockham_dit_core_wait_dp;

ARCHITECTURE v13 OF stockham_dit_core_wait_dp IS
  -- Default Constants

BEGIN
  yt_rsc_0_0_i_clka_en_d <= yt_rsc_0_0_cgo OR yt_rsc_0_0_cgo_iro;
  yt_rsc_0_1_i_clka_en_d <= yt_rsc_0_1_cgo OR yt_rsc_0_1_cgo_iro;
  yt_rsc_0_2_i_clka_en_d <= yt_rsc_0_2_cgo OR yt_rsc_0_2_cgo_iro;
  yt_rsc_0_3_i_clka_en_d <= yt_rsc_0_3_cgo OR yt_rsc_0_3_cgo_iro;
  yt_rsc_0_4_i_clka_en_d <= yt_rsc_0_4_cgo OR yt_rsc_0_4_cgo_iro;
  yt_rsc_0_5_i_clka_en_d <= yt_rsc_0_5_cgo OR yt_rsc_0_5_cgo_iro;
  yt_rsc_0_6_i_clka_en_d <= yt_rsc_0_6_cgo OR yt_rsc_0_6_cgo_iro;
  yt_rsc_0_7_i_clka_en_d <= yt_rsc_0_7_cgo OR yt_rsc_0_7_cgo_iro;
  mult_t_mul_cmp_en <= ensig_cgo OR ensig_cgo_iro;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_z_mul_cmp_z_oreg <= mult_z_mul_cmp_z;
    END IF;
  END PROCESS;
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    xt_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    xt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    mult_z_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
  );
END stockham_dit_core;

ARCHITECTURE v13 OF stockham_dit_core IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_en : STD_LOGIC;
  SIGNAL mult_t_mul_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_acc_tmp : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL for_for_a_acc_tmp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_32_false_acc_tmp : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_8 : STD_LOGIC;
  SIGNAL mux_tmp : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_12 : STD_LOGIC;
  SIGNAL nand_tmp : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL or_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL or_dcpl_19 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL or_dcpl_21 : STD_LOGIC;
  SIGNAL or_dcpl_22 : STD_LOGIC;
  SIGNAL or_tmp_15 : STD_LOGIC;
  SIGNAL not_tmp_46 : STD_LOGIC;
  SIGNAL or_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_3 : STD_LOGIC;
  SIGNAL nand_tmp_1 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_97 : STD_LOGIC;
  SIGNAL or_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_tmp_24 : STD_LOGIC;
  SIGNAL or_tmp_25 : STD_LOGIC;
  SIGNAL mux_tmp_5 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL nand_tmp_2 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL or_dcpl_35 : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL or_dcpl_38 : STD_LOGIC;
  SIGNAL not_tmp_53 : STD_LOGIC;
  SIGNAL or_tmp_31 : STD_LOGIC;
  SIGNAL not_tmp_55 : STD_LOGIC;
  SIGNAL nor_tmp_5 : STD_LOGIC;
  SIGNAL or_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL nand_tmp_3 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL or_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL or_tmp_40 : STD_LOGIC;
  SIGNAL or_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_10 : STD_LOGIC;
  SIGNAL and_dcpl_141 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL or_tmp_46 : STD_LOGIC;
  SIGNAL nand_tmp_4 : STD_LOGIC;
  SIGNAL mux_tmp_12 : STD_LOGIC;
  SIGNAL or_dcpl_47 : STD_LOGIC;
  SIGNAL or_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL or_dcpl_50 : STD_LOGIC;
  SIGNAL or_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL or_dcpl_53 : STD_LOGIC;
  SIGNAL or_tmp_52 : STD_LOGIC;
  SIGNAL not_tmp_71 : STD_LOGIC;
  SIGNAL or_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_16 : STD_LOGIC;
  SIGNAL or_tmp_60 : STD_LOGIC;
  SIGNAL nand_tmp_5 : STD_LOGIC;
  SIGNAL mux_tmp_18 : STD_LOGIC;
  SIGNAL or_dcpl_56 : STD_LOGIC;
  SIGNAL or_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL or_tmp_65 : STD_LOGIC;
  SIGNAL or_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_21 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL or_tmp_69 : STD_LOGIC;
  SIGNAL nand_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL or_dcpl_62 : STD_LOGIC;
  SIGNAL or_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL or_dcpl_65 : STD_LOGIC;
  SIGNAL or_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL nor_tmp_15 : STD_LOGIC;
  SIGNAL nor_tmp_16 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL and_tmp_16 : STD_LOGIC;
  SIGNAL or_dcpl_70 : STD_LOGIC;
  SIGNAL or_dcpl_72 : STD_LOGIC;
  SIGNAL or_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_196 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL or_dcpl_78 : STD_LOGIC;
  SIGNAL or_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL or_dcpl_81 : STD_LOGIC;
  SIGNAL or_dcpl_83 : STD_LOGIC;
  SIGNAL or_dcpl_84 : STD_LOGIC;
  SIGNAL or_dcpl_86 : STD_LOGIC;
  SIGNAL or_dcpl_89 : STD_LOGIC;
  SIGNAL or_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_224 : STD_LOGIC;
  SIGNAL or_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL or_dcpl_98 : STD_LOGIC;
  SIGNAL or_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_235 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL or_dcpl_102 : STD_LOGIC;
  SIGNAL or_dcpl_104 : STD_LOGIC;
  SIGNAL or_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_253 : STD_LOGIC;
  SIGNAL or_dcpl_112 : STD_LOGIC;
  SIGNAL for_for_t_9_0_sva_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL for_for_t_9_0_sva_8_0 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL y_3_sva : STD_LOGIC;
  SIGNAL for_for_b_nor_2_cse_1 : STD_LOGIC;
  SIGNAL for_for_b_nor_1_cse_1 : STD_LOGIC;
  SIGNAL for_for_b_nor_cse_1 : STD_LOGIC;
  SIGNAL for_for_mul_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_34_true_1_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL operator_34_true_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL for_for_a_nor_2_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_nor_1_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_nor_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_asn_itm : STD_LOGIC;
  SIGNAL for_for_stage_0_1 : STD_LOGIC;
  SIGNAL for_for_stage_0 : STD_LOGIC;
  SIGNAL for_for_a_conc_5_itm_2_0 : STD_LOGIC;
  SIGNAL for_for_a_conc_5_itm_2_2_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_a_asn_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_asn_itm_1 : STD_LOGIC;
  SIGNAL for_for_stage_0_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_1_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_2_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_3_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_4_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_5_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_6_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_1_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_7_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_8_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_9_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_10_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_11_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_12_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_13_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_conc_5_itm_1_2_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_a_conc_5_itm_1_0 : STD_LOGIC;
  SIGNAL for_for_stage_0_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_1_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_2_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_3_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_4_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_5_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_6_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_1_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_7_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_8_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_9_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_10_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_11_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_12_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_13_itm_1 : STD_LOGIC;
  SIGNAL for_for_asn_10_itm : STD_LOGIC;
  SIGNAL for_for_a_asn_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_conc_5_itm_2_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_asn_12_itm_3 : STD_LOGIC;
  SIGNAL for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_stage_0_4 : STD_LOGIC;
  SIGNAL operator_34_true_1_and_psp_sva_0 : STD_LOGIC;
  SIGNAL for_for_b_acc_tdx_9_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL for_for_asn_10_itm_3 : STD_LOGIC;
  SIGNAL x_3_sva : STD_LOGIC;
  SIGNAL for_for_asn_12_itm : STD_LOGIC;
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL or_412_ssc : STD_LOGIC;
  SIGNAL or_402_ssc : STD_LOGIC;
  SIGNAL or_392_ssc : STD_LOGIC;
  SIGNAL or_382_ssc : STD_LOGIC;
  SIGNAL or_372_ssc : STD_LOGIC;
  SIGNAL or_362_ssc : STD_LOGIC;
  SIGNAL or_352_ssc : STD_LOGIC;
  SIGNAL or_333_ssc : STD_LOGIC;
  SIGNAL or_322_ssc : STD_LOGIC;
  SIGNAL or_311_ssc : STD_LOGIC;
  SIGNAL or_300_ssc : STD_LOGIC;
  SIGNAL or_289_ssc : STD_LOGIC;
  SIGNAL or_278_ssc : STD_LOGIC;
  SIGNAL or_267_ssc : STD_LOGIC;
  SIGNAL or_256_ssc : STD_LOGIC;
  SIGNAL for_for_b_or_13_seb : STD_LOGIC;
  SIGNAL for_for_b_or_12_seb : STD_LOGIC;
  SIGNAL for_for_b_or_11_seb : STD_LOGIC;
  SIGNAL for_for_b_or_10_seb : STD_LOGIC;
  SIGNAL for_for_b_or_9_seb : STD_LOGIC;
  SIGNAL for_for_b_or_8_seb : STD_LOGIC;
  SIGNAL for_for_b_or_7_seb : STD_LOGIC;
  SIGNAL for_for_b_nand_seb : STD_LOGIC;
  SIGNAL for_for_b_or_6_seb : STD_LOGIC;
  SIGNAL for_for_b_or_5_seb : STD_LOGIC;
  SIGNAL for_for_b_or_4_seb : STD_LOGIC;
  SIGNAL for_for_b_or_3_seb : STD_LOGIC;
  SIGNAL for_for_b_or_2_seb : STD_LOGIC;
  SIGNAL for_for_b_or_1_seb : STD_LOGIC;
  SIGNAL for_for_b_or_seb : STD_LOGIC;
  SIGNAL y_or_cse : STD_LOGIC;
  SIGNAL for_for_mux_26_cse : STD_LOGIC;
  SIGNAL for_for_or_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_0_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_1_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_2_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_3_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_4_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_5_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_6_cgo_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_0_7_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_triosy_0_7_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_mult_t_mul_cmp_a_cse : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL or_175_cse : STD_LOGIC;
  SIGNAL or_253_rmff : STD_LOGIC;
  SIGNAL modulo_sub_qelse_mux_rmff : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_qif_mux_rmff : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_for_for_b_nor_14_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_30_rmff : STD_LOGIC;
  SIGNAL or_264_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_13_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_31_rmff : STD_LOGIC;
  SIGNAL or_275_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_12_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_32_rmff : STD_LOGIC;
  SIGNAL or_286_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_11_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_33_rmff : STD_LOGIC;
  SIGNAL or_297_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_10_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_34_rmff : STD_LOGIC;
  SIGNAL or_308_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_9_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_35_rmff : STD_LOGIC;
  SIGNAL or_319_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_8_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_36_rmff : STD_LOGIC;
  SIGNAL or_330_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_7_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_37_rmff : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_for_for_a_nor_rmff : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_for_for_a_nor_1_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_6_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_38_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_5_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_39_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_4_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_40_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_3_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_41_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_2_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_42_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_1_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_43_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_44_rmff : STD_LOGIC;
  SIGNAL or_421_rmff : STD_LOGIC;
  SIGNAL for_for_b_or_42_seb : STD_LOGIC;
  SIGNAL for_for_b_or_40_seb : STD_LOGIC;
  SIGNAL for_for_b_or_38_seb : STD_LOGIC;
  SIGNAL for_for_b_or_36_seb : STD_LOGIC;
  SIGNAL for_for_b_or_34_seb : STD_LOGIC;
  SIGNAL for_for_b_or_32_seb : STD_LOGIC;
  SIGNAL for_for_b_or_30_seb : STD_LOGIC;
  SIGNAL for_for_b_or_28_seb : STD_LOGIC;
  SIGNAL for_for_b_or_26_seb : STD_LOGIC;
  SIGNAL for_for_b_or_24_seb : STD_LOGIC;
  SIGNAL for_for_b_or_22_seb : STD_LOGIC;
  SIGNAL for_for_b_or_20_seb : STD_LOGIC;
  SIGNAL for_for_b_or_18_seb : STD_LOGIC;
  SIGNAL for_for_b_or_16_seb : STD_LOGIC;
  SIGNAL for_for_b_or_14_seb : STD_LOGIC;
  SIGNAL for_for_acc_tdx_1_9_0_sva_3_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_9_0_sva_3_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_2_8_2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_w_rshift_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL shift_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_acc_tdx_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL for_for_w_rshift_itm_3 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL for_for_w_lshift_itm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL nn_5_sva : STD_LOGIC;
  SIGNAL nn_6_sva : STD_LOGIC;
  SIGNAL nn_4_sva : STD_LOGIC;
  SIGNAL nn_7_sva : STD_LOGIC;
  SIGNAL nn_3_sva : STD_LOGIC;
  SIGNAL nn_8_sva : STD_LOGIC;
  SIGNAL nn_2_sva : STD_LOGIC;
  SIGNAL nn_9_sva : STD_LOGIC;
  SIGNAL nn_1_sva : STD_LOGIC;
  SIGNAL nn_10_sva : STD_LOGIC;
  SIGNAL idx_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tmp_2_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_5 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_6 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_7 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_a_lpi_3_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_x_lpi_3_dfm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_a_for_for_a_nor_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_1_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_2_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_3_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_4_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_5_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_6_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_1_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_7_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_8_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_9_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_10_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_11_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_12_itm : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_13_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_nor_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_1_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_2_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_3_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_4_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_5_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_6_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_nor_1_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_7_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_8_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_9_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_10_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_11_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_12_itm : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_and_13_itm : STD_LOGIC;
  SIGNAL mult_z_asn_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_9_0_2_0_itm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL tmp_sva_7_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_7_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_6_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_6_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_5_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_5_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_4_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_4_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_3_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_3_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_7_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_7_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_6_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_6_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_5_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_5_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_4_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_4_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_3_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_3_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_2_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_2_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_1_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_1_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_lpi_3_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_a_for_for_a_nor_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_1_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_2_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_3_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_4_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_5_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_6_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_1_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_7_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_8_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_9_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_10_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_11_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_12_itm_3 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_and_13_itm_3 : STD_LOGIC;
  SIGNAL mult_z_asn_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_asn_10_itm_1 : STD_LOGIC;
  SIGNAL for_for_asn_10_itm_2 : STD_LOGIC;
  SIGNAL for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_asn_12_itm_1 : STD_LOGIC;
  SIGNAL for_for_asn_12_itm_2 : STD_LOGIC;
  SIGNAL for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_a_acc_psp_sva_1_8_2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_9_0_sva_1_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_9_0_sva_2_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_1_9_0_sva_1_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_1_9_0_sva_2_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL idx_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d_mx0c0 : STD_LOGIC;
  SIGNAL for_for_acc_tdx_1_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL for_for_acc_tdx_1_9_0_sva_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL reg_s_9_0_ftd : STD_LOGIC;
  SIGNAL reg_s_9_0_ftd_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL for_for_a_and_2_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_4_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_5_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_6_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_7_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_8_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_9_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_1_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_10_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_11_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_12_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_13_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_14_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_15_rgt : STD_LOGIC;
  SIGNAL for_for_a_and_16_rgt : STD_LOGIC;
  SIGNAL or_cse : STD_LOGIC;
  SIGNAL for_for_acc_tdx_9_0_sva_9_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_acc_tdx_9_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_8_2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL operator_32_false_acc_itm_3_1 : STD_LOGIC;
  SIGNAL z_out_2_32 : STD_LOGIC;

  SIGNAL idx_not_1_nl : STD_LOGIC;
  SIGNAL y_not_36_nl : STD_LOGIC;
  SIGNAL operator_32_false_2_acc_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mult_res_and_1_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL and_95_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL and_119_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL and_140_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL and_160_nl : STD_LOGIC;
  SIGNAL mux_25_nl : STD_LOGIC;
  SIGNAL mux_24_nl : STD_LOGIC;
  SIGNAL nor_26_nl : STD_LOGIC;
  SIGNAL or_89_nl : STD_LOGIC;
  SIGNAL mux_31_nl : STD_LOGIC;
  SIGNAL mux_30_nl : STD_LOGIC;
  SIGNAL nor_25_nl : STD_LOGIC;
  SIGNAL or_112_nl : STD_LOGIC;
  SIGNAL mux_36_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL and_1091_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL or_146_nl : STD_LOGIC;
  SIGNAL for_for_a_mux1h_80_nl : STD_LOGIC;
  SIGNAL for_for_and_6_nl : STD_LOGIC;
  SIGNAL for_for_mux1h_36_nl : STD_LOGIC;
  SIGNAL for_for_mux1h_41_nl : STD_LOGIC;
  SIGNAL nn_mux_nl : STD_LOGIC;
  SIGNAL for_for_b_and_nl : STD_LOGIC;
  SIGNAL for_for_b_and_2_nl : STD_LOGIC;
  SIGNAL for_for_b_and_3_nl : STD_LOGIC;
  SIGNAL for_for_b_and_4_nl : STD_LOGIC;
  SIGNAL for_for_b_and_5_nl : STD_LOGIC;
  SIGNAL for_for_b_and_6_nl : STD_LOGIC;
  SIGNAL for_for_b_and_7_nl : STD_LOGIC;
  SIGNAL for_for_b_and_8_nl : STD_LOGIC;
  SIGNAL for_for_b_and_1_nl : STD_LOGIC;
  SIGNAL for_for_b_and_9_nl : STD_LOGIC;
  SIGNAL for_for_b_and_10_nl : STD_LOGIC;
  SIGNAL for_for_b_and_11_nl : STD_LOGIC;
  SIGNAL for_for_b_and_12_nl : STD_LOGIC;
  SIGNAL for_for_b_and_13_nl : STD_LOGIC;
  SIGNAL for_for_b_and_14_nl : STD_LOGIC;
  SIGNAL for_for_b_and_15_nl : STD_LOGIC;
  SIGNAL for_for_b_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL operator_32_false_acc_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_85_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL and_131_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL or_70_nl : STD_LOGIC;
  SIGNAL and_170_nl : STD_LOGIC;
  SIGNAL mux_22_nl : STD_LOGIC;
  SIGNAL nor_30_nl : STD_LOGIC;
  SIGNAL or_91_nl : STD_LOGIC;
  SIGNAL nor_31_nl : STD_LOGIC;
  SIGNAL or_90_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL or_105_nl : STD_LOGIC;
  SIGNAL mux_28_nl : STD_LOGIC;
  SIGNAL nor_27_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL nor_28_nl : STD_LOGIC;
  SIGNAL or_113_nl : STD_LOGIC;
  SIGNAL and_201_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL and_1097_nl : STD_LOGIC;
  SIGNAL or_129_nl : STD_LOGIC;
  SIGNAL and_1098_nl : STD_LOGIC;
  SIGNAL or_142_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL and_233_nl : STD_LOGIC;
  SIGNAL modulo_add_qif_acc_1_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL or_163_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL and_253_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL and_269_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL or_187_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL nor_23_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_1_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_44_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_29_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_45_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_3_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_2_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_45_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_28_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_46_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_5_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_4_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_46_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_27_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_47_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_7_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_6_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_47_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_26_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_48_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_9_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_8_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_48_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_25_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_49_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_11_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_10_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_49_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_24_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_50_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_13_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_12_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_50_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_23_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_51_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_15_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_14_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_51_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_22_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_52_nl : STD_LOGIC;
  SIGNAL for_for_a_mux1h_148_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_593_nl : STD_LOGIC;
  SIGNAL or_349_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_17_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_16_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_52_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_21_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_53_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_19_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_18_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_53_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_20_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_54_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_21_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_20_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_54_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_19_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_55_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_23_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_22_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_55_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_18_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_56_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_25_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_24_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_56_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_17_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_57_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_27_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_26_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_57_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_16_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_58_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_29_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_28_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL for_for_b_or_58_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_15_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_59_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mult_if_or_1_nl : STD_LOGIC;
  SIGNAL mult_if_or_1_nl : STD_LOGIC;
  SIGNAL mult_if_mux_5_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL for_for_mux_29_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_mux_30_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mux_6_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_mux_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL for_for_w_rshift_rg_a : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL for_for_w_rshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_w_rshift_rg_z : STD_LOGIC_VECTOR (8 DOWNTO 0);

  SIGNAL for_for_w_lshift_rg_a : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL for_for_w_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_w_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_dit_core_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      yt_rsc_0_0_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_1_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_2_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_3_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_4_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_5_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_6_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_7_cgo_iro : IN STD_LOGIC;
      yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
      ensig_cgo_iro : IN STD_LOGIC;
      mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      yt_rsc_0_0_cgo : IN STD_LOGIC;
      yt_rsc_0_1_cgo : IN STD_LOGIC;
      yt_rsc_0_2_cgo : IN STD_LOGIC;
      yt_rsc_0_3_cgo : IN STD_LOGIC;
      yt_rsc_0_4_cgo : IN STD_LOGIC;
      yt_rsc_0_5_cgo : IN STD_LOGIC;
      yt_rsc_0_6_cgo : IN STD_LOGIC;
      yt_rsc_0_7_cgo : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      mult_t_mul_cmp_en : OUT STD_LOGIC;
      mult_z_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z_oreg : STD_LOGIC_VECTOR
      (31 DOWNTO 0);

  COMPONENT stockham_dit_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
      for_for_C_2_tr0 : IN STD_LOGIC;
      for_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_dit_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (5 DOWNTO
      0);
  SIGNAL stockham_dit_core_core_fsm_inst_for_for_C_2_tr0 : STD_LOGIC;
  SIGNAL stockham_dit_core_core_fsm_inst_for_C_0_tr0 : STD_LOGIC;

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

  FUNCTION MUX1HOT_v_32_17_2(input_16 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(16 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
      tmp := (OTHERS=>sel( 16));
      result := result or ( input_16 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_3_2(input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

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
      width => 32
      )
    PORT MAP(
      dat => p_rsci_dat,
      idat => p_rsci_idat_1
    );
  p_rsci_dat <= p_rsc_dat;
  p_rsci_idat <= p_rsci_idat_1;

  xt_rsc_triosy_0_7_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_7_lz
    );
  xt_rsc_triosy_0_6_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_6_lz
    );
  xt_rsc_triosy_0_5_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_5_lz
    );
  xt_rsc_triosy_0_4_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_4_lz
    );
  xt_rsc_triosy_0_3_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_3_lz
    );
  xt_rsc_triosy_0_2_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_2_lz
    );
  xt_rsc_triosy_0_1_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_1_lz
    );
  xt_rsc_triosy_0_0_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => xt_rsc_triosy_0_0_lz
    );
  p_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => p_rsc_triosy_lz
    );
  twiddle_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => twiddle_rsc_triosy_lz
    );
  twiddle_h_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_xt_rsc_triosy_0_7_obj_ld_cse,
      lz => twiddle_h_rsc_triosy_lz
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
  mult_t_mul_cmp_a <= mult_x_lpi_3_dfm;
  mult_t_mul_cmp_b <= twiddle_h_rsci_q_d;
  mult_t_mul_cmp_z <= mult_t_mul_cmp_z_1;

  for_for_w_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 9,
      signd_a => 0,
      width_s => 4,
      width_z => 9
      )
    PORT MAP(
      a => for_for_w_rshift_rg_a,
      s => for_for_w_rshift_rg_s,
      z => for_for_w_rshift_rg_z
    );
  for_for_w_rshift_rg_a <= operator_34_true_and_psp_sva_1;
  for_for_w_rshift_rg_s <= shift_3_0_sva;
  for_for_w_rshift_itm_3 <= for_for_w_rshift_rg_z;

  for_for_w_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 9,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => for_for_w_lshift_rg_a,
      s => for_for_w_lshift_rg_s,
      z => for_for_w_lshift_rg_z
    );
  for_for_w_lshift_rg_a <= for_for_w_rshift_itm;
  for_for_w_lshift_rg_s <= shift_3_0_sva;
  for_for_w_lshift_itm <= for_for_w_lshift_rg_z;

  stockham_dit_core_wait_dp_inst : stockham_dit_core_wait_dp
    PORT MAP(
      clk => clk,
      yt_rsc_0_0_cgo_iro => or_253_rmff,
      yt_rsc_0_0_i_clka_en_d => yt_rsc_0_0_i_clka_en_d,
      yt_rsc_0_1_cgo_iro => or_264_rmff,
      yt_rsc_0_1_i_clka_en_d => yt_rsc_0_1_i_clka_en_d,
      yt_rsc_0_2_cgo_iro => or_275_rmff,
      yt_rsc_0_2_i_clka_en_d => yt_rsc_0_2_i_clka_en_d,
      yt_rsc_0_3_cgo_iro => or_286_rmff,
      yt_rsc_0_3_i_clka_en_d => yt_rsc_0_3_i_clka_en_d,
      yt_rsc_0_4_cgo_iro => or_297_rmff,
      yt_rsc_0_4_i_clka_en_d => yt_rsc_0_4_i_clka_en_d,
      yt_rsc_0_5_cgo_iro => or_308_rmff,
      yt_rsc_0_5_i_clka_en_d => yt_rsc_0_5_i_clka_en_d,
      yt_rsc_0_6_cgo_iro => or_319_rmff,
      yt_rsc_0_6_i_clka_en_d => yt_rsc_0_6_i_clka_en_d,
      yt_rsc_0_7_cgo_iro => or_330_rmff,
      yt_rsc_0_7_i_clka_en_d => yt_rsc_0_7_i_clka_en_d,
      ensig_cgo_iro => or_421_rmff,
      mult_z_mul_cmp_z => stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z,
      yt_rsc_0_0_cgo => reg_yt_rsc_0_0_cgo_cse,
      yt_rsc_0_1_cgo => reg_yt_rsc_0_1_cgo_cse,
      yt_rsc_0_2_cgo => reg_yt_rsc_0_2_cgo_cse,
      yt_rsc_0_3_cgo => reg_yt_rsc_0_3_cgo_cse,
      yt_rsc_0_4_cgo => reg_yt_rsc_0_4_cgo_cse,
      yt_rsc_0_5_cgo => reg_yt_rsc_0_5_cgo_cse,
      yt_rsc_0_6_cgo => reg_yt_rsc_0_6_cgo_cse,
      yt_rsc_0_7_cgo => reg_yt_rsc_0_7_cgo_cse,
      ensig_cgo => reg_ensig_cgo_cse,
      mult_t_mul_cmp_en => mult_t_mul_cmp_en,
      mult_z_mul_cmp_z_oreg => stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z_oreg
    );
  stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z <= mult_z_mul_cmp_z;
  mult_z_mul_cmp_z_oreg <= stockham_dit_core_wait_dp_inst_mult_z_mul_cmp_z_oreg;

  stockham_dit_core_core_fsm_inst : stockham_dit_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => stockham_dit_core_core_fsm_inst_fsm_output,
      for_for_C_2_tr0 => stockham_dit_core_core_fsm_inst_for_for_C_2_tr0,
      for_C_0_tr0 => stockham_dit_core_core_fsm_inst_for_C_0_tr0
    );
  fsm_output <= stockham_dit_core_core_fsm_inst_fsm_output;
  stockham_dit_core_core_fsm_inst_for_for_C_2_tr0 <= (NOT(for_for_stage_0_3 OR for_for_stage_0))
      AND (NOT(for_for_stage_0_2 OR for_for_stage_0_1));
  stockham_dit_core_core_fsm_inst_for_C_0_tr0 <= NOT operator_32_false_acc_itm_3_1;

  y_or_cse <= (fsm_output(0)) OR (fsm_output(4));
  or_cse <= (fsm_output(5)) OR (fsm_output(0));
  for_for_mux_26_cse <= for_for_stage_0 OR y_or_cse;
  for_for_or_cse <= (fsm_output(3)) OR y_or_cse;
  and_95_nl <= (operator_34_true_1_and_psp_sva_0 OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("00")))
      AND (CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0/=STD_LOGIC_VECTOR'("000")))
      AND nand_tmp;
  mux_12_nl <= MUX_s_1_2_2(nand_tmp, and_95_nl, and_dcpl_54);
  or_253_rmff <= ((NOT mux_tmp) AND for_for_stage_0_4 AND (fsm_output(3))) OR (((or_dcpl_12
      AND for_for_a_nor_cse_1) OR and_dcpl_72) AND and_dcpl_54 AND (fsm_output(1)))
      OR ((NOT mux_12_nl) AND (fsm_output(2)));
  for_for_b_or_42_seb <= (NOT (fsm_output(1))) OR (or_dcpl_19 AND or_dcpl_15) OR
      or_dcpl_17;
  and_119_nl <= ((NOT operator_34_true_1_and_psp_sva_0) OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("00")))
      AND (CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0/=STD_LOGIC_VECTOR'("001")))
      AND nand_tmp_1;
  mux_15_nl <= MUX_s_1_2_2(nand_tmp_1, and_119_nl, and_dcpl_54);
  or_264_rmff <= ((NOT mux_tmp_3) AND for_for_stage_0_4 AND (fsm_output(3))) OR (((and_dcpl_87
      AND for_for_a_nor_cse_1) OR (for_for_b_nor_cse_1 AND (for_for_b_for_for_b_acc_tmp(0))))
      AND and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_15_nl) AND (fsm_output(2)));
  for_for_b_or_40_seb <= (NOT (fsm_output(1))) OR and_dcpl_104 OR or_dcpl_17;
  and_140_nl <= (operator_34_true_1_and_psp_sva_0 OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("01")))
      AND (CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0/=STD_LOGIC_VECTOR'("010")))
      AND nand_tmp_2;
  mux_17_nl <= MUX_s_1_2_2(nand_tmp_2, and_140_nl, and_dcpl_54);
  or_275_rmff <= ((NOT mux_tmp_5) AND for_for_stage_0_4 AND (fsm_output(3))) OR (((or_dcpl_12
      AND and_dcpl_111) OR (and_dcpl_109 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_17_nl) AND (fsm_output(2)));
  for_for_b_or_38_seb <= (NOT (fsm_output(1))) OR and_dcpl_122 OR or_dcpl_17;
  and_160_nl <= ((NOT operator_34_true_1_and_psp_sva_0) OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("01")))
      AND (CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0/=STD_LOGIC_VECTOR'("011")))
      AND nand_tmp_3;
  mux_20_nl <= MUX_s_1_2_2(nand_tmp_3, and_160_nl, and_dcpl_54);
  or_286_rmff <= ((NOT mux_tmp_8) AND for_for_stage_0_4 AND (fsm_output(3))) OR (((and_dcpl_87
      AND and_dcpl_111) OR (and_dcpl_109 AND (for_for_b_for_for_b_acc_tmp(0)))) AND
      and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_20_nl) AND (fsm_output(2)));
  for_for_b_or_36_seb <= (NOT (fsm_output(1))) OR and_dcpl_136 OR or_dcpl_17;
  nor_26_nl <= NOT((for_for_a_acc_psp_sva_1_0(1)) OR (NOT mux_tmp_12));
  or_89_nl <= operator_34_true_1_and_psp_sva_0 OR (for_for_a_acc_psp_sva_1_0(0));
  mux_24_nl <= MUX_s_1_2_2(nor_26_nl, mux_tmp_12, or_89_nl);
  mux_25_nl <= MUX_s_1_2_2(nand_tmp_4, mux_24_nl, and_dcpl_54);
  or_297_rmff <= ((NOT mux_tmp_10) AND for_for_stage_0_4 AND (fsm_output(3))) OR
      (((or_dcpl_12 AND and_dcpl_143) OR (and_dcpl_141 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_25_nl) AND (fsm_output(2)));
  for_for_b_or_34_seb <= (NOT (fsm_output(1))) OR and_dcpl_153 OR or_dcpl_17;
  nor_25_nl <= NOT((for_for_a_acc_psp_sva_1_0(1)) OR (NOT mux_tmp_18));
  or_112_nl <= (NOT operator_34_true_1_and_psp_sva_0) OR (for_for_a_acc_psp_sva_1_0(0));
  mux_30_nl <= MUX_s_1_2_2(nor_25_nl, mux_tmp_18, or_112_nl);
  mux_31_nl <= MUX_s_1_2_2(nand_tmp_5, mux_30_nl, and_dcpl_54);
  or_308_rmff <= ((NOT mux_tmp_16) AND for_for_stage_0_4 AND (fsm_output(3))) OR
      (((and_dcpl_87 AND and_dcpl_143) OR (and_dcpl_141 AND (for_for_b_for_for_b_acc_tmp(0))))
      AND and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_31_nl) AND (fsm_output(2)));
  for_for_b_or_32_seb <= (NOT (fsm_output(1))) OR and_dcpl_166 OR or_dcpl_17;
  and_1091_nl <= (NOT(CONV_SL_1_1(for_for_a_acc_psp_sva_1_0=STD_LOGIC_VECTOR'("11"))))
      AND mux_tmp_23;
  mux_35_nl <= MUX_s_1_2_2(and_1091_nl, mux_tmp_23, operator_34_true_1_and_psp_sva_0);
  mux_36_nl <= MUX_s_1_2_2(nand_tmp_6, mux_35_nl, and_dcpl_54);
  or_319_rmff <= ((NOT mux_tmp_21) AND for_for_stage_0_4 AND (fsm_output(3))) OR
      (((or_dcpl_12 AND and_dcpl_173) OR (and_dcpl_171 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_54 AND (fsm_output(1))) OR ((NOT mux_36_nl) AND (fsm_output(2)));
  for_for_b_or_30_seb <= (NOT (fsm_output(1))) OR and_dcpl_182 OR or_dcpl_17;
  or_146_nl <= (operator_34_true_1_and_psp_sva_0 AND CONV_SL_1_1(for_for_a_acc_psp_sva_1_0=STD_LOGIC_VECTOR'("11")))
      OR (CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0=STD_LOGIC_VECTOR'("111"))) OR
      and_tmp_16;
  mux_38_nl <= MUX_s_1_2_2(and_tmp_16, or_146_nl, and_dcpl_54);
  or_330_rmff <= (mux_tmp_26 AND for_for_stage_0_4 AND (fsm_output(3))) OR (((and_dcpl_87
      AND and_dcpl_173) OR (and_dcpl_171 AND (for_for_b_for_for_b_acc_tmp(0)))) AND
      and_dcpl_54 AND (fsm_output(1))) OR (mux_38_nl AND (fsm_output(2)));
  for_for_b_or_28_seb <= (NOT (fsm_output(1))) OR and_dcpl_194 OR or_dcpl_17;
  for_for_b_or_26_seb <= (NOT (fsm_output(1))) OR and_dcpl_104 OR or_dcpl_86;
  for_for_b_or_24_seb <= (NOT (fsm_output(1))) OR and_dcpl_122 OR or_dcpl_86;
  for_for_b_or_22_seb <= (NOT (fsm_output(1))) OR and_dcpl_136 OR or_dcpl_86;
  for_for_b_or_20_seb <= (NOT (fsm_output(1))) OR and_dcpl_153 OR or_dcpl_86;
  for_for_b_or_18_seb <= (NOT (fsm_output(1))) OR and_dcpl_166 OR or_dcpl_86;
  for_for_b_or_16_seb <= (NOT (fsm_output(1))) OR and_dcpl_182 OR or_dcpl_86;
  for_for_b_or_14_seb <= (NOT (fsm_output(1))) OR and_dcpl_194 OR or_dcpl_86;
  or_421_rmff <= (for_for_stage_0_1 AND (fsm_output(3))) OR (for_for_stage_0_2 AND
      or_dcpl_4);
  mult_z_mul_cmp_a <= reg_mult_t_mul_cmp_a_cse;
  for_for_a_and_2_rgt <= for_for_a_for_for_a_nor_itm_3 AND (fsm_output(1));
  for_for_a_and_4_rgt <= for_for_a_for_for_a_and_1_itm_3 AND (fsm_output(1));
  for_for_a_and_5_rgt <= for_for_a_for_for_a_and_2_itm_3 AND (fsm_output(1));
  for_for_a_and_6_rgt <= for_for_a_for_for_a_and_3_itm_3 AND (fsm_output(1));
  for_for_a_and_7_rgt <= for_for_a_for_for_a_and_4_itm_3 AND (fsm_output(1));
  for_for_a_and_8_rgt <= for_for_a_for_for_a_and_5_itm_3 AND (fsm_output(1));
  for_for_a_and_9_rgt <= for_for_a_for_for_a_and_6_itm_3 AND (fsm_output(1));
  for_for_a_and_1_rgt <= for_for_a_for_for_a_nor_1_itm_3 AND y_3_sva AND (fsm_output(1));
  for_for_a_and_10_rgt <= for_for_a_for_for_a_and_7_itm_3 AND (fsm_output(1));
  for_for_a_and_11_rgt <= for_for_a_for_for_a_and_8_itm_3 AND (fsm_output(1));
  for_for_a_and_12_rgt <= for_for_a_for_for_a_and_9_itm_3 AND (fsm_output(1));
  for_for_a_and_13_rgt <= for_for_a_for_for_a_and_10_itm_3 AND (fsm_output(1));
  for_for_a_and_14_rgt <= for_for_a_for_for_a_and_11_itm_3 AND (fsm_output(1));
  for_for_a_and_15_rgt <= for_for_a_for_for_a_and_12_itm_3 AND (fsm_output(1));
  for_for_a_and_16_rgt <= for_for_a_for_for_a_and_13_itm_3 AND (fsm_output(1));
  idx_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(idx_3_0_sva) + UNSIGNED'(
      "0001"), 4));
  for_for_a_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1(8
      DOWNTO 1)), 8), 9) + UNSIGNED(operator_34_true_and_psp_sva_1), 9));
  operator_34_true_1_and_psp_sva_1 <= operator_32_false_acc_tmp AND for_for_t_9_0_sva_8_0;
  for_for_b_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_s_9_0_ftd & reg_s_9_0_ftd_1)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1), 9),
      10), 10));
  for_for_b_for_for_b_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(for_for_b_acc_nl),
      10) + UNSIGNED(operator_34_true_and_psp_sva_1 & '0'), 10));
  for_for_t_9_0_sva_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(for_for_t_9_0_sva_8_0),
      9), 10) + SIGNED'( "0000000001"), 10));
  operator_34_true_and_psp_sva_1 <= (NOT operator_32_false_acc_tmp) AND for_for_t_9_0_sva_8_0;
  operator_32_false_acc_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_s_9_0_ftd_1)
      + SIGNED'( "111111111"), 9));
  for_for_b_nor_2_cse_1 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  for_for_b_nor_1_cse_1 <= NOT((for_for_b_for_for_b_acc_tmp(2)) OR (for_for_b_for_for_b_acc_tmp(0)));
  for_for_b_nor_cse_1 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  for_for_acc_tdx_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1),
      9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_and_psp_sva_1),
      9), 10), 10));
  for_for_a_nor_2_cse_1 <= NOT((for_for_a_acc_tmp(0)) OR (operator_34_true_1_and_psp_sva_1(0)));
  for_for_a_nor_1_cse_1 <= NOT((for_for_a_acc_tmp(1)) OR (operator_34_true_1_and_psp_sva_1(0)));
  for_for_a_nor_cse_1 <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  modulo_add_base_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_for_a_lpi_3_dfm)
      + UNSIGNED(mult_res_lpi_3_dfm_1), 32));
  for_for_acc_tdx_1_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_for_acc_tdx_9_0_sva_9_3
      & for_for_acc_tdx_9_0_sva_2_0) + UNSIGNED(for_for_mul_itm), 10));
  operator_32_false_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(idx_3_0_sva_2(3
      DOWNTO 1)), 3), 4) + SIGNED'( "1011"), 4));
  operator_32_false_acc_itm_3_1 <= operator_32_false_acc_nl(3);
  and_dcpl_54 <= for_for_stage_0_1 AND y_3_sva;
  or_dcpl_4 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_7 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("000"));
  or_tmp_8 <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("000"));
  and_85_nl <= or_tmp_8 AND or_tmp_7;
  mux_tmp <= MUX_s_1_2_2(or_tmp_8, and_85_nl, for_for_asn_10_itm_3);
  and_dcpl_72 <= for_for_b_nor_cse_1 AND (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_12 <= NOT((operator_32_false_acc_tmp(0)) AND (for_for_t_9_0_sva_8_0(0)));
  nand_tmp <= NOT(for_for_stage_0_4 AND (NOT(or_tmp_8 AND ((NOT for_for_asn_10_itm_3)
      OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("000"))))));
  or_dcpl_14 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_15 <= or_dcpl_14 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_76 <= (NOT (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2))) AND for_for_asn_12_itm_3;
  and_dcpl_77 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_82 <= for_for_stage_0_4 AND for_for_asn_10_itm_3;
  and_dcpl_83 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_84 <= and_dcpl_83 AND and_dcpl_82;
  or_dcpl_17 <= NOT(for_for_stage_0_1 AND y_3_sva);
  or_dcpl_18 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_dcpl_87 <= (operator_32_false_acc_tmp(0)) AND (for_for_t_9_0_sva_8_0(0));
  or_dcpl_19 <= and_dcpl_87 OR or_dcpl_18;
  and_dcpl_90 <= for_for_a_nor_cse_1 AND and_dcpl_54;
  or_dcpl_21 <= (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2)) OR (NOT for_for_asn_10_itm_3);
  or_dcpl_22 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_15 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("001"));
  not_tmp_46 <= NOT((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(0)) OR (NOT or_tmp_15));
  or_tmp_18 <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("001"));
  or_37_nl <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_13_nl <= MUX_s_1_2_2(not_tmp_46, or_tmp_15, or_37_nl);
  mux_tmp_3 <= MUX_s_1_2_2(or_tmp_18, mux_13_nl, for_for_asn_10_itm_3);
  nand_tmp_1 <= NOT(for_for_stage_0_4 AND (NOT(or_tmp_18 AND ((NOT for_for_asn_10_itm_3)
      OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("001"))))));
  or_dcpl_25 <= or_dcpl_14 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  and_dcpl_97 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("01"));
  or_dcpl_27 <= or_dcpl_12 OR or_dcpl_18;
  and_dcpl_104 <= or_dcpl_27 AND or_dcpl_25;
  and_dcpl_106 <= or_dcpl_25 AND and_dcpl_87;
  or_dcpl_29 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_24 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("010"));
  or_tmp_25 <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("010"));
  and_131_nl <= or_tmp_25 AND or_tmp_24;
  mux_tmp_5 <= MUX_s_1_2_2(or_tmp_25, and_131_nl, for_for_asn_10_itm_3);
  and_dcpl_109 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_111 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  nand_tmp_2 <= NOT(for_for_stage_0_4 AND (NOT(or_tmp_25 AND ((NOT for_for_asn_10_itm_3)
      OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("010"))))));
  or_dcpl_32 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_33 <= or_dcpl_32 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_114 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_118 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_119 <= and_dcpl_118 AND and_dcpl_82;
  or_dcpl_35 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_36 <= and_dcpl_87 OR or_dcpl_35;
  and_dcpl_122 <= or_dcpl_36 AND or_dcpl_33;
  and_dcpl_124 <= and_dcpl_111 AND and_dcpl_54;
  and_dcpl_125 <= or_dcpl_33 AND or_dcpl_12;
  or_dcpl_38 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10"));
  not_tmp_53 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11")));
  or_tmp_31 <= (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2)) OR not_tmp_53;
  not_tmp_55 <= (NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")))) AND or_tmp_31;
  nor_tmp_5 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)=STD_LOGIC_VECTOR'("11"));
  or_tmp_34 <= (NOT for_for_asn_12_itm_3) OR (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2))
      OR (NOT nor_tmp_5);
  or_70_nl <= (NOT for_for_asn_12_itm_3) OR (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2));
  mux_18_nl <= MUX_s_1_2_2(not_tmp_55, or_tmp_31, or_70_nl);
  mux_tmp_8 <= MUX_s_1_2_2(or_tmp_34, mux_18_nl, for_for_asn_10_itm_3);
  nand_tmp_3 <= NOT(for_for_stage_0_4 AND (NOT((NOT(for_for_asn_12_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("011"))))
      AND (NOT(for_for_asn_10_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("011")))))));
  or_dcpl_41 <= or_dcpl_32 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_43 <= or_dcpl_12 OR or_dcpl_35;
  and_dcpl_136 <= or_dcpl_43 AND or_dcpl_41;
  and_dcpl_138 <= or_dcpl_41 AND and_dcpl_87;
  or_tmp_40 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("100"));
  or_tmp_41 <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("100"));
  and_170_nl <= or_tmp_41 AND or_tmp_40;
  mux_tmp_10 <= MUX_s_1_2_2(or_tmp_41, and_170_nl, for_for_asn_10_itm_3);
  and_dcpl_141 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_143 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  or_tmp_46 <= (NOT for_for_asn_10_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("100"));
  nor_30_nl <= NOT((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2)) OR (NOT or_tmp_46));
  or_91_nl <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_22_nl <= MUX_s_1_2_2(nor_30_nl, or_tmp_46, or_91_nl);
  nand_tmp_4 <= NOT(for_for_stage_0_4 AND (NOT mux_22_nl));
  nor_31_nl <= NOT((for_for_b_acc_tdx_9_0_sva_2_0(2)) OR (NOT nand_tmp_4));
  or_90_nl <= CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_12 <= MUX_s_1_2_2(nor_31_nl, nand_tmp_4, or_90_nl);
  or_dcpl_47 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_48 <= or_dcpl_47 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_146 <= (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2)) AND for_for_asn_12_itm_3;
  and_dcpl_149 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_150 <= and_dcpl_149 AND and_dcpl_82;
  or_dcpl_50 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_51 <= and_dcpl_87 OR or_dcpl_50;
  and_dcpl_153 <= or_dcpl_51 AND or_dcpl_48;
  and_dcpl_155 <= and_dcpl_143 AND and_dcpl_54;
  and_dcpl_156 <= or_dcpl_48 AND or_dcpl_12;
  or_dcpl_53 <= NOT((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2)) AND for_for_asn_10_itm_3);
  or_tmp_52 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("101"));
  not_tmp_71 <= NOT((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(0)) OR (NOT or_tmp_52));
  or_tmp_55 <= NOT(for_for_asn_12_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("101")));
  or_105_nl <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_26_nl <= MUX_s_1_2_2(not_tmp_71, or_tmp_52, or_105_nl);
  mux_tmp_16 <= MUX_s_1_2_2(or_tmp_55, mux_26_nl, for_for_asn_10_itm_3);
  or_tmp_60 <= NOT(for_for_asn_10_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("101")));
  nor_27_nl <= NOT((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2)) OR (NOT or_tmp_60));
  or_114_nl <= (NOT for_for_asn_12_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_28_nl <= MUX_s_1_2_2(nor_27_nl, or_tmp_60, or_114_nl);
  nand_tmp_5 <= NOT(for_for_stage_0_4 AND (NOT mux_28_nl));
  nor_28_nl <= NOT((for_for_b_acc_tdx_9_0_sva_2_0(2)) OR (NOT nand_tmp_5));
  or_113_nl <= CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_18 <= MUX_s_1_2_2(nor_28_nl, nand_tmp_5, or_113_nl);
  or_dcpl_56 <= or_dcpl_47 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_58 <= or_dcpl_12 OR or_dcpl_50;
  and_dcpl_166 <= or_dcpl_58 AND or_dcpl_56;
  and_dcpl_168 <= or_dcpl_56 AND and_dcpl_87;
  or_tmp_65 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("110"));
  or_tmp_66 <= NOT(for_for_asn_12_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("110")));
  and_201_nl <= or_tmp_66 AND or_tmp_65;
  mux_tmp_21 <= MUX_s_1_2_2(or_tmp_66, and_201_nl, for_for_asn_10_itm_3);
  and_dcpl_171 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_173 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_tmp_69 <= (NOT for_for_asn_10_itm_3) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("110"));
  and_1097_nl <= (NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("11")))) AND or_tmp_69;
  or_129_nl <= (NOT for_for_asn_12_itm_3) OR (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(0));
  mux_33_nl <= MUX_s_1_2_2(and_1097_nl, or_tmp_69, or_129_nl);
  nand_tmp_6 <= NOT(for_for_stage_0_4 AND (NOT mux_33_nl));
  and_1098_nl <= (NOT(CONV_SL_1_1(for_for_b_acc_tdx_9_0_sva_2_0(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"))))
      AND nand_tmp_6;
  mux_tmp_23 <= MUX_s_1_2_2(and_1098_nl, nand_tmp_6, for_for_b_acc_tdx_9_0_sva_2_0(0));
  or_dcpl_62 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_63 <= or_dcpl_62 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_178 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_179 <= and_dcpl_178 AND and_dcpl_82;
  or_dcpl_65 <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_66 <= and_dcpl_87 OR or_dcpl_65;
  and_dcpl_182 <= or_dcpl_66 AND or_dcpl_63;
  and_dcpl_184 <= and_dcpl_173 AND and_dcpl_54;
  and_dcpl_185 <= or_dcpl_63 AND or_dcpl_12;
  nor_tmp_15 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("111"));
  nor_tmp_16 <= for_for_asn_12_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("111"));
  or_142_nl <= nor_tmp_16 OR nor_tmp_15;
  mux_tmp_26 <= MUX_s_1_2_2(nor_tmp_16, or_142_nl, for_for_asn_10_itm_3);
  and_tmp_16 <= for_for_stage_0_4 AND (nor_tmp_16 OR (for_for_asn_10_itm_3 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("111"))));
  or_dcpl_70 <= or_dcpl_62 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_72 <= NOT(nor_tmp_5 AND (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2))
      AND for_for_asn_12_itm_3);
  or_dcpl_74 <= or_dcpl_12 OR or_dcpl_65;
  and_dcpl_194 <= or_dcpl_74 AND or_dcpl_70;
  and_dcpl_196 <= or_dcpl_70 AND and_dcpl_87;
  and_dcpl_198 <= NOT((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2)) OR for_for_asn_12_itm_3);
  or_dcpl_78 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_79 <= or_dcpl_78 OR or_175_cse;
  and_dcpl_201 <= for_for_stage_0_4 AND (NOT for_for_asn_10_itm_3);
  and_dcpl_202 <= and_dcpl_83 AND and_dcpl_201;
  and_dcpl_209 <= for_for_stage_0_1 AND (NOT y_3_sva);
  or_dcpl_81 <= (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2)) OR for_for_asn_10_itm_3;
  or_dcpl_83 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_84 <= or_dcpl_83 OR or_175_cse;
  or_dcpl_86 <= (NOT for_for_stage_0_1) OR y_3_sva;
  or_dcpl_89 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(1 DOWNTO
      0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_90 <= or_dcpl_89 OR or_175_cse;
  and_dcpl_220 <= and_dcpl_118 AND and_dcpl_201;
  and_dcpl_224 <= and_dcpl_111 AND and_dcpl_209;
  or_dcpl_94 <= (NOT nor_tmp_5) OR or_175_cse;
  and_dcpl_232 <= (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2)) AND (NOT for_for_asn_12_itm_3);
  or_dcpl_98 <= (NOT (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2))) OR for_for_asn_12_itm_3;
  or_dcpl_99 <= or_dcpl_78 OR or_dcpl_98;
  and_dcpl_235 <= and_dcpl_149 AND and_dcpl_201;
  and_dcpl_239 <= and_dcpl_143 AND and_dcpl_209;
  or_dcpl_102 <= (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(2))) OR for_for_asn_10_itm_3;
  or_dcpl_104 <= or_dcpl_83 OR or_dcpl_98;
  or_dcpl_108 <= or_dcpl_89 OR or_dcpl_98;
  and_dcpl_249 <= and_dcpl_178 AND and_dcpl_201;
  and_dcpl_253 <= and_dcpl_173 AND and_dcpl_209;
  or_dcpl_112 <= (NOT nor_tmp_5) OR or_dcpl_98;
  and_233_nl <= (for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("000")))
      AND or_tmp_7;
  mux_39_nl <= MUX_s_1_2_2(and_233_nl, or_dcpl_79, for_for_asn_10_itm_3);
  xt_rsc_0_0_i_wea_d_mx0c0 <= (NOT (fsm_output(2))) OR mux_39_nl OR (NOT for_for_stage_0_4);
  or_256_ssc <= and_dcpl_77 AND and_dcpl_76 AND (fsm_output(2));
  modulo_sub_qelse_mux_rmff <= MUX_v_32_2_2(('0' & (z_out_1(30 DOWNTO 0))), z_out,
      z_out_1(31));
  modulo_add_qif_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_base_sva_1)
      - UNSIGNED(p_sva), 32));
  modulo_add_qif_mux_rmff <= MUX_v_32_2_2(modulo_add_base_sva_1, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(modulo_add_qif_acc_1_nl),
      32)), z_out_2_32);
  or_267_ssc <= and_dcpl_97 AND and_dcpl_76 AND (fsm_output(2));
  or_278_ssc <= and_dcpl_114 AND and_dcpl_76 AND (fsm_output(2));
  or_289_ssc <= nor_tmp_5 AND and_dcpl_76 AND (fsm_output(2));
  or_300_ssc <= and_dcpl_77 AND and_dcpl_146 AND (fsm_output(2));
  or_311_ssc <= and_dcpl_97 AND and_dcpl_146 AND (fsm_output(2));
  or_322_ssc <= and_dcpl_114 AND and_dcpl_146 AND (fsm_output(2));
  or_333_ssc <= nor_tmp_16 AND (fsm_output(2));
  or_352_ssc <= and_dcpl_97 AND and_dcpl_198 AND (fsm_output(2));
  or_362_ssc <= and_dcpl_114 AND and_dcpl_198 AND (fsm_output(2));
  or_372_ssc <= nor_tmp_5 AND and_dcpl_198 AND (fsm_output(2));
  or_382_ssc <= and_dcpl_77 AND and_dcpl_232 AND (fsm_output(2));
  or_392_ssc <= and_dcpl_97 AND and_dcpl_232 AND (fsm_output(2));
  or_402_ssc <= and_dcpl_114 AND and_dcpl_232 AND (fsm_output(2));
  or_412_ssc <= nor_tmp_5 AND and_dcpl_232 AND (fsm_output(2));
  for_for_b_for_for_b_for_for_b_nor_14_rmff <= NOT((or_tmp_8 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_84 AND (fsm_output(2))) OR for_for_b_or_13_seb);
  for_for_b_for_for_b_for_for_b_nor_30_rmff <= NOT(or_dcpl_22 OR or_dcpl_21 OR for_for_b_or_13_seb);
  for_for_b_for_for_b_for_for_b_nor_13_rmff <= NOT((or_tmp_18 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_84 AND (fsm_output(2))) OR for_for_b_or_12_seb);
  for_for_b_for_for_b_for_for_b_nor_31_rmff <= NOT(or_dcpl_29 OR or_dcpl_21 OR for_for_b_or_12_seb);
  for_for_b_for_for_b_for_for_b_nor_12_rmff <= NOT((or_tmp_25 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_119 AND (fsm_output(2))) OR for_for_b_or_11_seb);
  for_for_b_for_for_b_for_for_b_nor_32_rmff <= NOT(or_dcpl_38 OR or_dcpl_21 OR for_for_b_or_11_seb);
  for_for_b_for_for_b_for_for_b_nor_11_rmff <= NOT((or_tmp_34 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_119 AND (fsm_output(2))) OR for_for_b_or_10_seb);
  for_for_b_for_for_b_for_for_b_nor_33_rmff <= NOT(not_tmp_53 OR or_dcpl_21 OR for_for_b_or_10_seb);
  for_for_b_for_for_b_for_for_b_nor_10_rmff <= NOT((or_tmp_41 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_150 AND (fsm_output(2))) OR for_for_b_or_9_seb);
  for_for_b_for_for_b_for_for_b_nor_34_rmff <= NOT(or_dcpl_22 OR or_dcpl_53 OR for_for_b_or_9_seb);
  for_for_b_for_for_b_for_for_b_nor_9_rmff <= NOT((or_tmp_55 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_150 AND (fsm_output(2))) OR for_for_b_or_8_seb);
  for_for_b_for_for_b_for_for_b_nor_35_rmff <= NOT(or_dcpl_29 OR or_dcpl_53 OR for_for_b_or_8_seb);
  for_for_b_for_for_b_for_for_b_nor_8_rmff <= NOT((or_tmp_66 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_179 AND (fsm_output(2))) OR for_for_b_or_7_seb);
  for_for_b_for_for_b_for_for_b_nor_36_rmff <= NOT(or_dcpl_38 OR or_dcpl_53 OR for_for_b_or_7_seb);
  for_for_b_for_for_b_for_for_b_nor_7_rmff <= NOT((or_dcpl_72 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_179 AND (fsm_output(2))) OR for_for_b_nand_seb);
  for_for_b_for_for_b_for_for_b_nor_37_rmff <= NOT(not_tmp_53 OR or_dcpl_53 OR for_for_b_nand_seb);
  for_for_a_for_for_a_for_for_a_nor_rmff <= NOT(or_dcpl_22 OR or_dcpl_81 OR xt_rsc_0_0_i_wea_d_mx0c0);
  for_for_a_for_for_a_for_for_a_nor_1_rmff <= NOT((or_dcpl_79 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_202 AND (fsm_output(2))) OR xt_rsc_0_0_i_wea_d_mx0c0);
  for_for_b_for_for_b_for_for_b_nor_6_rmff <= NOT((or_dcpl_84 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_202 AND (fsm_output(2))) OR for_for_b_or_6_seb);
  for_for_b_for_for_b_for_for_b_nor_38_rmff <= NOT(or_dcpl_29 OR or_dcpl_81 OR for_for_b_or_6_seb);
  for_for_b_for_for_b_for_for_b_nor_5_rmff <= NOT((or_dcpl_90 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_220 AND (fsm_output(2))) OR for_for_b_or_5_seb);
  for_for_b_for_for_b_for_for_b_nor_39_rmff <= NOT(or_dcpl_38 OR or_dcpl_81 OR for_for_b_or_5_seb);
  for_for_b_for_for_b_for_for_b_nor_4_rmff <= NOT((or_dcpl_94 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_220 AND (fsm_output(2))) OR for_for_b_or_4_seb);
  for_for_b_for_for_b_for_for_b_nor_40_rmff <= NOT(not_tmp_53 OR or_dcpl_81 OR for_for_b_or_4_seb);
  for_for_b_for_for_b_for_for_b_nor_3_rmff <= NOT((or_dcpl_99 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_235 AND (fsm_output(2))) OR for_for_b_or_3_seb);
  for_for_b_for_for_b_for_for_b_nor_41_rmff <= NOT(or_dcpl_22 OR or_dcpl_102 OR for_for_b_or_3_seb);
  for_for_b_for_for_b_for_for_b_nor_2_rmff <= NOT((or_dcpl_104 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_235 AND (fsm_output(2))) OR for_for_b_or_2_seb);
  for_for_b_for_for_b_for_for_b_nor_42_rmff <= NOT(or_dcpl_29 OR or_dcpl_102 OR for_for_b_or_2_seb);
  for_for_b_for_for_b_for_for_b_nor_1_rmff <= NOT((or_dcpl_108 AND (NOT (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0)))
      AND and_dcpl_249 AND (fsm_output(2))) OR for_for_b_or_1_seb);
  for_for_b_for_for_b_for_for_b_nor_43_rmff <= NOT(or_dcpl_38 OR or_dcpl_102 OR for_for_b_or_1_seb);
  for_for_b_for_for_b_for_for_b_nor_rmff <= NOT((or_dcpl_112 AND (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3(0))
      AND and_dcpl_249 AND (fsm_output(2))) OR for_for_b_or_seb);
  for_for_b_for_for_b_for_for_b_nor_44_rmff <= NOT(not_tmp_53 OR or_dcpl_102 OR for_for_b_or_seb);
  for_for_b_or_13_seb <= (NOT (fsm_output(2))) OR mux_tmp OR (NOT for_for_stage_0_4);
  for_for_b_or_12_seb <= (NOT (fsm_output(2))) OR mux_tmp_3 OR (NOT for_for_stage_0_4);
  for_for_b_or_11_seb <= (NOT (fsm_output(2))) OR mux_tmp_5 OR (NOT for_for_stage_0_4);
  for_for_b_or_10_seb <= (NOT (fsm_output(2))) OR mux_tmp_8 OR (NOT for_for_stage_0_4);
  for_for_b_or_9_seb <= (NOT (fsm_output(2))) OR mux_tmp_10 OR (NOT for_for_stage_0_4);
  for_for_b_or_8_seb <= (NOT (fsm_output(2))) OR mux_tmp_16 OR (NOT for_for_stage_0_4);
  for_for_b_or_7_seb <= (NOT (fsm_output(2))) OR mux_tmp_21 OR (NOT for_for_stage_0_4);
  for_for_b_nand_seb <= NOT((fsm_output(2)) AND mux_tmp_26 AND for_for_stage_0_4);
  or_163_nl <= for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_40_nl <= MUX_s_1_2_2(not_tmp_46, or_tmp_15, or_163_nl);
  mux_41_nl <= MUX_s_1_2_2(mux_40_nl, or_dcpl_84, for_for_asn_10_itm_3);
  for_for_b_or_6_seb <= (NOT (fsm_output(2))) OR mux_41_nl OR (NOT for_for_stage_0_4);
  and_253_nl <= (for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("010")))
      AND or_tmp_24;
  mux_42_nl <= MUX_s_1_2_2(and_253_nl, or_dcpl_90, for_for_asn_10_itm_3);
  for_for_b_or_5_seb <= (NOT (fsm_output(2))) OR mux_42_nl OR (NOT for_for_stage_0_4);
  or_175_cse <= for_for_asn_12_itm_3 OR (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2));
  mux_43_nl <= MUX_s_1_2_2(not_tmp_55, or_tmp_31, or_175_cse);
  mux_44_nl <= MUX_s_1_2_2(mux_43_nl, or_dcpl_94, for_for_asn_10_itm_3);
  for_for_b_or_4_seb <= (NOT (fsm_output(2))) OR mux_44_nl OR (NOT for_for_stage_0_4);
  and_269_nl <= (for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("100")))
      AND or_tmp_40;
  mux_45_nl <= MUX_s_1_2_2(and_269_nl, or_dcpl_99, for_for_asn_10_itm_3);
  for_for_b_or_3_seb <= (NOT (fsm_output(2))) OR mux_45_nl OR (NOT for_for_stage_0_4);
  or_187_nl <= for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_46_nl <= MUX_s_1_2_2(not_tmp_71, or_tmp_52, or_187_nl);
  mux_47_nl <= MUX_s_1_2_2(mux_46_nl, or_dcpl_104, for_for_asn_10_itm_3);
  for_for_b_or_2_seb <= (NOT (fsm_output(2))) OR mux_47_nl OR (NOT for_for_stage_0_4);
  and_284_nl <= (for_for_asn_12_itm_3 OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3/=STD_LOGIC_VECTOR'("110")))
      AND or_tmp_65;
  mux_48_nl <= MUX_s_1_2_2(and_284_nl, or_dcpl_108, for_for_asn_10_itm_3);
  for_for_b_or_1_seb <= (NOT (fsm_output(2))) OR mux_48_nl OR (NOT for_for_stage_0_4);
  nor_23_nl <= NOT(((NOT for_for_asn_12_itm_3) AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3=STD_LOGIC_VECTOR'("111")))
      OR nor_tmp_15);
  mux_49_nl <= MUX_s_1_2_2(nor_23_nl, or_dcpl_112, for_for_asn_10_itm_3);
  for_for_b_or_seb <= (NOT (fsm_output(2))) OR mux_49_nl OR (NOT for_for_stage_0_4);
  twiddle_rsci_radr_d_pff <= for_for_w_lshift_itm;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff <= for_for_stage_0_1 AND (fsm_output(2));
  for_for_b_for_for_b_mux_1_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_256_ssc);
  for_for_b_or_44_nl <= or_256_ssc OR (or_tmp_8 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_44_nl);
  yt_rsc_0_0_i_adra_d <= for_for_b_for_for_b_mux_1_nl & for_for_b_for_for_b_mux_nl;
  yt_rsc_0_0_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_14_rmff
      & for_for_b_for_for_b_for_for_b_nor_30_rmff);
  for_for_b_for_for_b_for_for_b_nor_29_nl <= NOT((or_dcpl_15 AND or_dcpl_12 AND and_dcpl_90
      AND (fsm_output(1))) OR for_for_b_or_42_seb);
  for_for_b_for_for_b_for_for_b_nor_45_nl <= NOT(or_dcpl_19 OR for_for_b_or_42_seb);
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_29_nl
      & for_for_b_for_for_b_for_for_b_nor_45_nl);
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_14_rmff
      & for_for_b_for_for_b_for_for_b_nor_30_rmff);
  for_for_b_for_for_b_mux_3_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_267_ssc);
  for_for_b_or_45_nl <= or_267_ssc OR (or_tmp_18 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_2_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_45_nl);
  yt_rsc_0_1_i_adra_d <= for_for_b_for_for_b_mux_3_nl & for_for_b_for_for_b_mux_2_nl;
  yt_rsc_0_1_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_13_rmff
      & for_for_b_for_for_b_for_for_b_nor_31_rmff);
  for_for_b_for_for_b_for_for_b_nor_28_nl <= NOT((and_dcpl_106 AND and_dcpl_90 AND
      (fsm_output(1))) OR for_for_b_or_40_seb);
  for_for_b_for_for_b_for_for_b_nor_46_nl <= NOT(or_dcpl_27 OR for_for_b_or_40_seb);
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_28_nl
      & for_for_b_for_for_b_for_for_b_nor_46_nl);
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_13_rmff
      & for_for_b_for_for_b_for_for_b_nor_31_rmff);
  for_for_b_for_for_b_mux_5_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_278_ssc);
  for_for_b_or_46_nl <= or_278_ssc OR (or_tmp_25 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_4_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_46_nl);
  yt_rsc_0_2_i_adra_d <= for_for_b_for_for_b_mux_5_nl & for_for_b_for_for_b_mux_4_nl;
  yt_rsc_0_2_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_12_rmff
      & for_for_b_for_for_b_for_for_b_nor_32_rmff);
  for_for_b_for_for_b_for_for_b_nor_27_nl <= NOT((and_dcpl_125 AND and_dcpl_124 AND
      (fsm_output(1))) OR for_for_b_or_38_seb);
  for_for_b_for_for_b_for_for_b_nor_47_nl <= NOT(or_dcpl_36 OR for_for_b_or_38_seb);
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_27_nl
      & for_for_b_for_for_b_for_for_b_nor_47_nl);
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_12_rmff
      & for_for_b_for_for_b_for_for_b_nor_32_rmff);
  for_for_b_for_for_b_mux_7_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_289_ssc);
  for_for_b_or_47_nl <= or_289_ssc OR (or_tmp_34 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_6_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_47_nl);
  yt_rsc_0_3_i_adra_d <= for_for_b_for_for_b_mux_7_nl & for_for_b_for_for_b_mux_6_nl;
  yt_rsc_0_3_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_11_rmff
      & for_for_b_for_for_b_for_for_b_nor_33_rmff);
  for_for_b_for_for_b_for_for_b_nor_26_nl <= NOT((and_dcpl_138 AND and_dcpl_124 AND
      (fsm_output(1))) OR for_for_b_or_36_seb);
  for_for_b_for_for_b_for_for_b_nor_48_nl <= NOT(or_dcpl_43 OR for_for_b_or_36_seb);
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_26_nl
      & for_for_b_for_for_b_for_for_b_nor_48_nl);
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_11_rmff
      & for_for_b_for_for_b_for_for_b_nor_33_rmff);
  for_for_b_for_for_b_mux_9_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_300_ssc);
  for_for_b_or_48_nl <= or_300_ssc OR (or_tmp_41 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_8_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_48_nl);
  yt_rsc_0_4_i_adra_d <= for_for_b_for_for_b_mux_9_nl & for_for_b_for_for_b_mux_8_nl;
  yt_rsc_0_4_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_4_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_10_rmff
      & for_for_b_for_for_b_for_for_b_nor_34_rmff);
  for_for_b_for_for_b_for_for_b_nor_25_nl <= NOT((and_dcpl_156 AND and_dcpl_155 AND
      (fsm_output(1))) OR for_for_b_or_34_seb);
  for_for_b_for_for_b_for_for_b_nor_49_nl <= NOT(or_dcpl_51 OR for_for_b_or_34_seb);
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_25_nl
      & for_for_b_for_for_b_for_for_b_nor_49_nl);
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_10_rmff
      & for_for_b_for_for_b_for_for_b_nor_34_rmff);
  for_for_b_for_for_b_mux_11_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_311_ssc);
  for_for_b_or_49_nl <= or_311_ssc OR (or_tmp_55 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_10_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_49_nl);
  yt_rsc_0_5_i_adra_d <= for_for_b_for_for_b_mux_11_nl & for_for_b_for_for_b_mux_10_nl;
  yt_rsc_0_5_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_5_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_9_rmff
      & for_for_b_for_for_b_for_for_b_nor_35_rmff);
  for_for_b_for_for_b_for_for_b_nor_24_nl <= NOT((and_dcpl_168 AND and_dcpl_155 AND
      (fsm_output(1))) OR for_for_b_or_32_seb);
  for_for_b_for_for_b_for_for_b_nor_50_nl <= NOT(or_dcpl_58 OR for_for_b_or_32_seb);
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_24_nl
      & for_for_b_for_for_b_for_for_b_nor_50_nl);
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_9_rmff
      & for_for_b_for_for_b_for_for_b_nor_35_rmff);
  for_for_b_for_for_b_mux_13_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_322_ssc);
  for_for_b_or_50_nl <= or_322_ssc OR (or_tmp_66 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_12_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_50_nl);
  yt_rsc_0_6_i_adra_d <= for_for_b_for_for_b_mux_13_nl & for_for_b_for_for_b_mux_12_nl;
  yt_rsc_0_6_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_6_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_8_rmff
      & for_for_b_for_for_b_for_for_b_nor_36_rmff);
  for_for_b_for_for_b_for_for_b_nor_23_nl <= NOT((and_dcpl_185 AND and_dcpl_184 AND
      (fsm_output(1))) OR for_for_b_or_30_seb);
  for_for_b_for_for_b_for_for_b_nor_51_nl <= NOT(or_dcpl_66 OR for_for_b_or_30_seb);
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_23_nl
      & for_for_b_for_for_b_for_for_b_nor_51_nl);
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_8_rmff
      & for_for_b_for_for_b_for_for_b_nor_36_rmff);
  for_for_b_for_for_b_mux_15_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_333_ssc);
  for_for_b_or_51_nl <= or_333_ssc OR (or_dcpl_72 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_14_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_51_nl);
  yt_rsc_0_7_i_adra_d <= for_for_b_for_for_b_mux_15_nl & for_for_b_for_for_b_mux_14_nl;
  yt_rsc_0_7_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  yt_rsc_0_7_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_7_rmff
      & for_for_b_for_for_b_for_for_b_nor_37_rmff);
  for_for_b_for_for_b_for_for_b_nor_22_nl <= NOT((and_dcpl_196 AND and_dcpl_184 AND
      (fsm_output(1))) OR for_for_b_or_28_seb);
  for_for_b_for_for_b_for_for_b_nor_52_nl <= NOT(or_dcpl_74 OR for_for_b_or_28_seb);
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_22_nl
      & for_for_b_for_for_b_for_for_b_nor_52_nl);
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_7_rmff
      & for_for_b_for_for_b_for_for_b_nor_37_rmff);
  and_593_nl <= and_dcpl_77 AND and_dcpl_198 AND (fsm_output(2));
  for_for_a_mux1h_148_nl <= MUX1HOT_v_7_3_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, for_for_a_acc_psp_sva_2_8_2, STD_LOGIC_VECTOR'(
      (fsm_output(1)) & and_593_nl & (fsm_output(3))));
  xt_rsc_0_0_i_adra_d <= for_for_acc_tdx_9_0_sva_3_9_3 & for_for_a_mux1h_148_nl;
  xt_rsc_0_0_i_da_d <= modulo_add_qif_mux_rmff & modulo_sub_qelse_mux_rmff;
  xt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( for_for_a_for_for_a_for_for_a_nor_rmff
      & for_for_a_for_for_a_for_for_a_nor_1_rmff);
  or_349_nl <= (for_for_stage_0_3 AND (NOT for_for_a_asn_itm_2) AND (NOT (for_for_a_conc_5_itm_2_2_1(1)))
      AND (NOT((for_for_a_conc_5_itm_2_2_1(0)) OR for_for_a_conc_5_itm_2_0)) AND
      (fsm_output(3))) OR (and_dcpl_72 AND and_dcpl_209 AND (fsm_output(1)));
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_349_nl);
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_a_for_for_a_for_for_a_nor_rmff
      & for_for_a_for_for_a_for_for_a_nor_1_rmff);
  for_for_b_for_for_b_mux_17_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_352_ssc);
  for_for_b_or_52_nl <= or_352_ssc OR (or_dcpl_84 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_16_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_52_nl);
  xt_rsc_0_1_i_adra_d <= for_for_b_for_for_b_mux_17_nl & for_for_b_for_for_b_mux_16_nl;
  xt_rsc_0_1_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_6_rmff
      & for_for_b_for_for_b_for_for_b_nor_38_rmff);
  for_for_b_for_for_b_for_for_b_nor_21_nl <= NOT((and_dcpl_106 AND for_for_a_nor_cse_1
      AND and_dcpl_209 AND (fsm_output(1))) OR for_for_b_or_26_seb);
  for_for_b_for_for_b_for_for_b_nor_53_nl <= NOT(or_dcpl_27 OR for_for_b_or_26_seb);
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_21_nl
      & for_for_b_for_for_b_for_for_b_nor_53_nl);
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_6_rmff
      & for_for_b_for_for_b_for_for_b_nor_38_rmff);
  for_for_b_for_for_b_mux_19_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_362_ssc);
  for_for_b_or_53_nl <= or_362_ssc OR (or_dcpl_90 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_18_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_53_nl);
  xt_rsc_0_2_i_adra_d <= for_for_b_for_for_b_mux_19_nl & for_for_b_for_for_b_mux_18_nl;
  xt_rsc_0_2_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_5_rmff
      & for_for_b_for_for_b_for_for_b_nor_39_rmff);
  for_for_b_for_for_b_for_for_b_nor_20_nl <= NOT((and_dcpl_125 AND and_dcpl_224 AND
      (fsm_output(1))) OR for_for_b_or_24_seb);
  for_for_b_for_for_b_for_for_b_nor_54_nl <= NOT(or_dcpl_36 OR for_for_b_or_24_seb);
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_20_nl
      & for_for_b_for_for_b_for_for_b_nor_54_nl);
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_5_rmff
      & for_for_b_for_for_b_for_for_b_nor_39_rmff);
  for_for_b_for_for_b_mux_21_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_372_ssc);
  for_for_b_or_54_nl <= or_372_ssc OR (or_dcpl_94 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_20_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_54_nl);
  xt_rsc_0_3_i_adra_d <= for_for_b_for_for_b_mux_21_nl & for_for_b_for_for_b_mux_20_nl;
  xt_rsc_0_3_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_4_rmff
      & for_for_b_for_for_b_for_for_b_nor_40_rmff);
  for_for_b_for_for_b_for_for_b_nor_19_nl <= NOT((and_dcpl_138 AND and_dcpl_224 AND
      (fsm_output(1))) OR for_for_b_or_22_seb);
  for_for_b_for_for_b_for_for_b_nor_55_nl <= NOT(or_dcpl_43 OR for_for_b_or_22_seb);
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_19_nl
      & for_for_b_for_for_b_for_for_b_nor_55_nl);
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_4_rmff
      & for_for_b_for_for_b_for_for_b_nor_40_rmff);
  for_for_b_for_for_b_mux_23_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_382_ssc);
  for_for_b_or_55_nl <= or_382_ssc OR (or_dcpl_99 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_22_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_55_nl);
  xt_rsc_0_4_i_adra_d <= for_for_b_for_for_b_mux_23_nl & for_for_b_for_for_b_mux_22_nl;
  xt_rsc_0_4_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_4_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_3_rmff
      & for_for_b_for_for_b_for_for_b_nor_41_rmff);
  for_for_b_for_for_b_for_for_b_nor_18_nl <= NOT((and_dcpl_156 AND and_dcpl_239 AND
      (fsm_output(1))) OR for_for_b_or_20_seb);
  for_for_b_for_for_b_for_for_b_nor_56_nl <= NOT(or_dcpl_51 OR for_for_b_or_20_seb);
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_18_nl
      & for_for_b_for_for_b_for_for_b_nor_56_nl);
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_3_rmff
      & for_for_b_for_for_b_for_for_b_nor_41_rmff);
  for_for_b_for_for_b_mux_25_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_392_ssc);
  for_for_b_or_56_nl <= or_392_ssc OR (or_dcpl_104 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_24_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_56_nl);
  xt_rsc_0_5_i_adra_d <= for_for_b_for_for_b_mux_25_nl & for_for_b_for_for_b_mux_24_nl;
  xt_rsc_0_5_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_5_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_2_rmff
      & for_for_b_for_for_b_for_for_b_nor_42_rmff);
  for_for_b_for_for_b_for_for_b_nor_17_nl <= NOT((and_dcpl_168 AND and_dcpl_239 AND
      (fsm_output(1))) OR for_for_b_or_18_seb);
  for_for_b_for_for_b_for_for_b_nor_57_nl <= NOT(or_dcpl_58 OR for_for_b_or_18_seb);
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_17_nl
      & for_for_b_for_for_b_for_for_b_nor_57_nl);
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_2_rmff
      & for_for_b_for_for_b_for_for_b_nor_42_rmff);
  for_for_b_for_for_b_mux_27_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_402_ssc);
  for_for_b_or_57_nl <= or_402_ssc OR (or_dcpl_108 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_26_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_57_nl);
  xt_rsc_0_6_i_adra_d <= for_for_b_for_for_b_mux_27_nl & for_for_b_for_for_b_mux_26_nl;
  xt_rsc_0_6_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_6_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_1_rmff
      & for_for_b_for_for_b_for_for_b_nor_43_rmff);
  for_for_b_for_for_b_for_for_b_nor_16_nl <= NOT((and_dcpl_185 AND and_dcpl_253 AND
      (fsm_output(1))) OR for_for_b_or_16_seb);
  for_for_b_for_for_b_for_for_b_nor_58_nl <= NOT(or_dcpl_66 OR for_for_b_or_16_seb);
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_16_nl
      & for_for_b_for_for_b_for_for_b_nor_58_nl);
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_1_rmff
      & for_for_b_for_for_b_for_for_b_nor_43_rmff);
  for_for_b_for_for_b_mux_29_nl <= MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp(9 DOWNTO
      3)), for_for_acc_tdx_1_9_0_sva_3_9_3, or_412_ssc);
  for_for_b_or_58_nl <= or_412_ssc OR (or_dcpl_112 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_28_nl <= MUX_v_7_2_2((for_for_a_acc_tmp(8 DOWNTO 2)), for_for_acc_tdx_9_0_sva_3_9_3,
      for_for_b_or_58_nl);
  xt_rsc_0_7_i_adra_d <= for_for_b_for_for_b_mux_29_nl & for_for_b_for_for_b_mux_28_nl;
  xt_rsc_0_7_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qif_mux_rmff;
  xt_rsc_0_7_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_rmff
      & for_for_b_for_for_b_for_for_b_nor_44_rmff);
  for_for_b_for_for_b_for_for_b_nor_15_nl <= NOT((and_dcpl_196 AND and_dcpl_253 AND
      (fsm_output(1))) OR for_for_b_or_14_seb);
  for_for_b_for_for_b_for_for_b_nor_59_nl <= NOT(or_dcpl_74 OR for_for_b_or_14_seb);
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_15_nl
      & for_for_b_for_for_b_for_for_b_nor_59_nl);
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_rmff
      & for_for_b_for_for_b_for_for_b_nor_44_rmff);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_itm_3 <= '0';
        for_for_a_for_for_a_and_itm_3 <= '0';
        for_for_a_for_for_a_and_1_itm_3 <= '0';
        for_for_a_for_for_a_and_2_itm_3 <= '0';
        for_for_a_for_for_a_and_3_itm_3 <= '0';
        for_for_a_for_for_a_and_4_itm_3 <= '0';
        for_for_a_for_for_a_and_5_itm_3 <= '0';
        for_for_a_for_for_a_and_6_itm_3 <= '0';
        for_for_a_for_for_a_nor_1_itm_3 <= '0';
        for_for_a_for_for_a_and_7_itm_3 <= '0';
        for_for_a_for_for_a_and_8_itm_3 <= '0';
        for_for_a_for_for_a_and_9_itm_3 <= '0';
        for_for_a_for_for_a_and_10_itm_3 <= '0';
        for_for_a_for_for_a_and_11_itm_3 <= '0';
        for_for_a_for_for_a_and_12_itm_3 <= '0';
        for_for_a_for_for_a_and_13_itm_3 <= '0';
        for_for_stage_0 <= '0';
        reg_yt_rsc_0_0_cgo_cse <= '0';
        reg_yt_rsc_0_1_cgo_cse <= '0';
        reg_yt_rsc_0_2_cgo_cse <= '0';
        reg_yt_rsc_0_3_cgo_cse <= '0';
        reg_yt_rsc_0_4_cgo_cse <= '0';
        reg_yt_rsc_0_5_cgo_cse <= '0';
        reg_yt_rsc_0_6_cgo_cse <= '0';
        reg_yt_rsc_0_7_cgo_cse <= '0';
        reg_xt_rsc_triosy_0_7_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        for_for_a_asn_itm <= '0';
        for_for_asn_12_itm <= '0';
        for_for_asn_10_itm <= '0';
        for_for_a_acc_psp_sva_1_0 <= STD_LOGIC_VECTOR'( "00");
        operator_34_true_1_and_psp_sva_0 <= '0';
        for_for_b_acc_tdx_9_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        for_for_acc_tdx_9_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        for_for_acc_tdx_1_9_0_sva_9_3 <= STD_LOGIC_VECTOR'( "0000000");
      ELSE
        for_for_a_for_for_a_nor_itm_3 <= for_for_a_for_for_a_nor_itm_2;
        for_for_a_for_for_a_and_itm_3 <= for_for_a_for_for_a_and_itm_2;
        for_for_a_for_for_a_and_1_itm_3 <= for_for_a_for_for_a_and_1_itm_2;
        for_for_a_for_for_a_and_2_itm_3 <= for_for_a_for_for_a_and_2_itm_2;
        for_for_a_for_for_a_and_3_itm_3 <= for_for_a_for_for_a_and_3_itm_2;
        for_for_a_for_for_a_and_4_itm_3 <= for_for_a_for_for_a_and_4_itm_2;
        for_for_a_for_for_a_and_5_itm_3 <= for_for_a_for_for_a_and_5_itm_2;
        for_for_a_for_for_a_and_6_itm_3 <= for_for_a_for_for_a_and_6_itm_2;
        for_for_a_for_for_a_nor_1_itm_3 <= for_for_a_for_for_a_nor_1_itm_2;
        for_for_a_for_for_a_and_7_itm_3 <= for_for_a_for_for_a_and_7_itm_2;
        for_for_a_for_for_a_and_8_itm_3 <= for_for_a_for_for_a_and_8_itm_2;
        for_for_a_for_for_a_and_9_itm_3 <= for_for_a_for_for_a_and_9_itm_2;
        for_for_a_for_for_a_and_10_itm_3 <= for_for_a_for_for_a_and_10_itm_2;
        for_for_a_for_for_a_and_11_itm_3 <= for_for_a_for_for_a_and_11_itm_2;
        for_for_a_for_for_a_and_12_itm_3 <= for_for_a_for_for_a_and_12_itm_2;
        for_for_a_for_for_a_and_13_itm_3 <= for_for_a_for_for_a_and_13_itm_2;
        for_for_stage_0 <= for_for_mux_26_cse AND (NOT((fsm_output(5)) OR (for_for_stage_0_1
            AND (for_for_t_9_0_sva_2(9)) AND (fsm_output(1)))));
        reg_yt_rsc_0_0_cgo_cse <= or_253_rmff;
        reg_yt_rsc_0_1_cgo_cse <= or_264_rmff;
        reg_yt_rsc_0_2_cgo_cse <= or_275_rmff;
        reg_yt_rsc_0_3_cgo_cse <= or_286_rmff;
        reg_yt_rsc_0_4_cgo_cse <= or_297_rmff;
        reg_yt_rsc_0_5_cgo_cse <= or_308_rmff;
        reg_yt_rsc_0_6_cgo_cse <= or_319_rmff;
        reg_yt_rsc_0_7_cgo_cse <= or_330_rmff;
        reg_xt_rsc_triosy_0_7_obj_ld_cse <= (NOT operator_32_false_acc_itm_3_1) AND
            (fsm_output(4));
        reg_ensig_cgo_cse <= or_421_rmff;
        for_for_a_asn_itm <= for_for_a_mux1h_80_nl AND (NOT or_cse);
        for_for_asn_12_itm <= for_for_mux1h_36_nl OR or_cse;
        for_for_asn_10_itm <= for_for_mux1h_41_nl OR or_cse;
        for_for_a_acc_psp_sva_1_0 <= for_for_a_acc_tmp(1 DOWNTO 0);
        operator_34_true_1_and_psp_sva_0 <= operator_34_true_1_and_psp_sva_1(0);
        for_for_b_acc_tdx_9_0_sva_2_0 <= for_for_b_for_for_b_acc_tmp(2 DOWNTO 0);
        for_for_acc_tdx_9_0_sva_2_0 <= for_for_acc_tdx_9_0_sva_1(2 DOWNTO 0);
        for_for_acc_tdx_1_9_0_sva_9_3 <= for_for_acc_tdx_1_9_0_sva_1(9 DOWNTO 3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      reg_mult_t_mul_cmp_a_cse <= mult_x_lpi_3_dfm;
      mult_z_mul_cmp_b <= MUX_v_32_2_2(p_sva, twiddle_rsci_q_d, fsm_output(3));
      nn_10_sva <= nn_mux_nl AND (NOT or_cse);
      tmp_2_sva_2 <= MUX_v_32_2_2((xt_rsc_0_2_i_qa_d(31 DOWNTO 0)), tmp_2_sva_2_2,
          fsm_output(3));
      tmp_2_sva_3 <= MUX_v_32_2_2((xt_rsc_0_3_i_qa_d(31 DOWNTO 0)), tmp_2_sva_3_2,
          fsm_output(3));
      tmp_2_sva_4 <= MUX_v_32_2_2((xt_rsc_0_4_i_qa_d(31 DOWNTO 0)), tmp_2_sva_4_2,
          fsm_output(3));
      tmp_2_sva_5 <= MUX_v_32_2_2((xt_rsc_0_5_i_qa_d(31 DOWNTO 0)), tmp_2_sva_5_2,
          fsm_output(3));
      tmp_2_sva_6 <= MUX_v_32_2_2((xt_rsc_0_6_i_qa_d(31 DOWNTO 0)), tmp_2_sva_6_2,
          fsm_output(3));
      tmp_2_sva_7 <= MUX_v_32_2_2((xt_rsc_0_7_i_qa_d(31 DOWNTO 0)), tmp_2_sva_7_2,
          fsm_output(3));
      tmp_sva <= MUX_v_32_2_2((yt_rsc_0_0_i_qa_d(31 DOWNTO 0)), tmp_sva_1_2, fsm_output(3));
      tmp_sva_1 <= MUX_v_32_2_2((yt_rsc_0_1_i_qa_d(31 DOWNTO 0)), tmp_sva_2_2, fsm_output(3));
      tmp_sva_2 <= MUX_v_32_2_2((yt_rsc_0_2_i_qa_d(31 DOWNTO 0)), tmp_sva_3_2, fsm_output(3));
      tmp_sva_3 <= MUX_v_32_2_2((yt_rsc_0_3_i_qa_d(31 DOWNTO 0)), tmp_sva_4_2, fsm_output(3));
      tmp_sva_4 <= MUX_v_32_2_2((yt_rsc_0_4_i_qa_d(31 DOWNTO 0)), tmp_sva_5_2, fsm_output(3));
      tmp_sva_5 <= MUX_v_32_2_2((yt_rsc_0_5_i_qa_d(31 DOWNTO 0)), tmp_sva_6_2, fsm_output(3));
      tmp_sva_6 <= MUX_v_32_2_2((yt_rsc_0_6_i_qa_d(31 DOWNTO 0)), tmp_sva_7_2, fsm_output(3));
      tmp_sva_7 <= MUX_v_32_2_2((yt_rsc_0_7_i_qa_d(31 DOWNTO 0)), tmp_sva_2_3, fsm_output(3));
      mult_x_lpi_3_dfm <= MUX1HOT_v_32_17_2((xt_rsc_0_0_i_qa_d(31 DOWNTO 0)), (xt_rsc_0_1_i_qa_d(63
          DOWNTO 32)), (xt_rsc_0_2_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_3_i_qa_d(63 DOWNTO
          32)), (xt_rsc_0_4_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_5_i_qa_d(63 DOWNTO 32)),
          (xt_rsc_0_6_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_7_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_0_i_qa_d(63
          DOWNTO 32)), (yt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_2_i_qa_d(63 DOWNTO
          32)), (yt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_4_i_qa_d(63 DOWNTO 32)),
          (yt_rsc_0_5_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_6_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_7_i_qa_d(63
          DOWNTO 32)), (mult_t_mul_cmp_z(63 DOWNTO 32)), STD_LOGIC_VECTOR'( for_for_b_and_nl
          & for_for_b_and_2_nl & for_for_b_and_3_nl & for_for_b_and_4_nl & for_for_b_and_5_nl
          & for_for_b_and_6_nl & for_for_b_and_7_nl & for_for_b_and_8_nl & for_for_b_and_1_nl
          & for_for_b_and_9_nl & for_for_b_and_10_nl & for_for_b_and_11_nl & for_for_b_and_12_nl
          & for_for_b_and_13_nl & for_for_b_and_14_nl & for_for_b_and_15_nl & (fsm_output(3))));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( y_or_cse = '1' ) THEN
        idx_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), idx_3_0_sva_2, idx_not_1_nl);
        reg_s_9_0_ftd <= NOT (fsm_output(4));
        reg_s_9_0_ftd_1 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (reg_s_9_0_ftd
            & (reg_s_9_0_ftd_1(8 DOWNTO 1))), (fsm_output(4)));
        shift_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1001"), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_32_false_2_acc_nl),
            4)), fsm_output(4));
        nn_9_sva <= nn_8_sva AND (NOT (fsm_output(0)));
        nn_8_sva <= nn_7_sva AND (NOT (fsm_output(0)));
        nn_7_sva <= nn_6_sva AND (NOT (fsm_output(0)));
        nn_6_sva <= nn_5_sva AND (NOT (fsm_output(0)));
        nn_5_sva <= nn_4_sva AND (NOT (fsm_output(0)));
        nn_4_sva <= nn_3_sva AND (NOT (fsm_output(0)));
        nn_3_sva <= nn_2_sva AND (NOT (fsm_output(0)));
        nn_2_sva <= nn_1_sva AND (NOT (fsm_output(0)));
        nn_1_sva <= fsm_output(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        y_3_sva <= '0';
        x_3_sva <= '0';
      ELSIF ( y_or_cse = '1' ) THEN
        y_3_sva <= x_3_sva AND (NOT (fsm_output(0)));
        x_3_sva <= y_3_sva OR (fsm_output(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_asn_itm_3 <= '0';
      ELSIF ( (NOT((y_3_sva AND (fsm_output(1))) OR (fsm_output(2)))) = '1' ) THEN
        for_for_a_asn_itm_3 <= MUX_s_1_2_2((operator_34_true_1_and_psp_sva_1(0)),
            for_for_a_asn_itm_2, fsm_output(3));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( or_cse = '1' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_t_9_0_sva_8_0 <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( ((fsm_output(4)) OR (fsm_output(0)) OR ((fsm_output(1)) AND for_for_stage_0_1))
          = '1' ) THEN
        for_for_t_9_0_sva_8_0 <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), (for_for_t_9_0_sva_2(8
            DOWNTO 0)), y_not_36_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_9_0_sva_3_9_3 <= for_for_acc_tdx_9_0_sva_2_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_3 <= for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_1_9_0_sva_3_9_3 <= for_for_acc_tdx_1_9_0_sva_2_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_3 <= for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_12_itm_3 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_12_itm_3 <= for_for_asn_12_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        mult_res_lpi_3_dfm_1 <= MUX_v_32_2_2(z_out, z_out_1, mult_res_and_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_10_itm_3 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_10_itm_3 <= for_for_asn_10_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_5_itm_2_2_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_5_itm_2_2_1 <= for_for_a_conc_5_itm_1_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_5_itm_2_0 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_5_itm_2_0 <= for_for_a_conc_5_itm_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        mult_z_asn_itm_1 <= mult_z_asn_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_asn_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_asn_itm_2 <= for_for_a_asn_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_stage_0_1 <= '0';
        for_for_stage_0_2 <= '0';
        for_for_stage_0_3 <= '0';
        for_for_stage_0_4 <= '0';
      ELSIF ( for_for_or_cse = '1' ) THEN
        for_for_stage_0_1 <= for_for_mux_26_cse;
        for_for_stage_0_2 <= for_for_stage_0_1 AND (NOT y_or_cse);
        for_for_stage_0_3 <= for_for_stage_0_2 AND (NOT y_or_cse);
        for_for_stage_0_4 <= for_for_stage_0_3 AND (NOT y_or_cse);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_acc_psp_sva_2_8_2 <= for_for_a_acc_psp_sva_1_8_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_12_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_12_itm_2 <= for_for_asn_12_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_10_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_10_itm_2 <= for_for_asn_10_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_5_itm_1_2_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_5_itm_1_2_1 <= for_for_a_conc_5_itm_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_5_itm_1_0 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_5_itm_1_0 <= for_for_a_asn_itm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_asn_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_asn_itm_1 <= for_for_a_asn_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_13_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_13_itm_2 <= for_for_a_for_for_a_and_13_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_12_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_12_itm_2 <= for_for_a_for_for_a_and_12_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_11_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_11_itm_2 <= for_for_a_for_for_a_and_11_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_10_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_10_itm_2 <= for_for_a_for_for_a_and_10_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_9_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_9_itm_2 <= for_for_a_for_for_a_and_9_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_8_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_8_itm_2 <= for_for_a_for_for_a_and_8_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_7_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_7_itm_2 <= for_for_a_for_for_a_and_7_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_1_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_nor_1_itm_2 <= for_for_a_for_for_a_nor_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_6_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_6_itm_2 <= for_for_a_for_for_a_and_6_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_5_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_5_itm_2 <= for_for_a_for_for_a_and_5_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_4_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_4_itm_2 <= for_for_a_for_for_a_and_4_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_3_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_3_itm_2 <= for_for_a_for_for_a_and_3_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_2_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_2_itm_2 <= for_for_a_for_for_a_and_2_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_1_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_1_itm_2 <= for_for_a_for_for_a_and_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_itm_2 <= for_for_a_for_for_a_and_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_nor_itm_2 <= for_for_a_for_for_a_nor_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_1_9_0_sva_2_9_3 <= for_for_acc_tdx_1_9_0_sva_1_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_9_0_sva_2_9_3 <= for_for_acc_tdx_9_0_sva_1_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_1_2 <= tmp_2_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_2_2 <= tmp_2_sva_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_3_2 <= tmp_2_sva_3_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_4_2 <= tmp_2_sva_4_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_5_2 <= tmp_2_sva_5_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_6_2 <= tmp_2_sva_6_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_7_2 <= tmp_2_sva_7_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_2_3 <= tmp_sva_1_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_1_2 <= tmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_2_2 <= tmp_sva_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_3_2 <= tmp_sva_3_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_4_2 <= tmp_sva_4_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_5_2 <= tmp_sva_5_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_6_2 <= tmp_sva_6_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_7_2 <= tmp_sva_7_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_5_itm_2_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (NOT(y_3_sva OR (fsm_output(2)))) = '1' ) THEN
        for_for_a_conc_5_itm_2_1 <= for_for_a_acc_tmp(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_12_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_12_itm_1 <= for_for_asn_12_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1 <= MUX_v_3_2_2(for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm,
            for_for_slc_for_for_acc_tdx_9_0_2_0_itm, for_for_and_6_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_10_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_10_itm_1 <= for_for_asn_10_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_13_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_13_itm_1 <= for_for_a_for_for_a_and_13_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_12_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_12_itm_1 <= for_for_a_for_for_a_and_12_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_11_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_11_itm_1 <= for_for_a_for_for_a_and_11_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_10_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_10_itm_1 <= for_for_a_for_for_a_and_10_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_9_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_9_itm_1 <= for_for_a_for_for_a_and_9_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_8_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_8_itm_1 <= for_for_a_for_for_a_and_8_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_7_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_7_itm_1 <= for_for_a_for_for_a_and_7_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_1_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_nor_1_itm_1 <= for_for_a_for_for_a_nor_1_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_6_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_6_itm_1 <= for_for_a_for_for_a_and_6_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_5_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_5_itm_1 <= for_for_a_for_for_a_and_5_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_4_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_4_itm_1 <= for_for_a_for_for_a_and_4_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_3_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_3_itm_1 <= for_for_a_for_for_a_and_3_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_2_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_2_itm_1 <= for_for_a_for_for_a_and_2_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_1_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_1_itm_1 <= for_for_a_for_for_a_and_1_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_and_itm_1 <= for_for_a_for_for_a_and_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_for_for_a_nor_itm_1 <= for_for_a_for_for_a_nor_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_1_9_0_sva_1_9_3 <= for_for_acc_tdx_1_9_0_sva_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_9_0_sva_1_9_3 <= for_for_acc_tdx_9_0_sva_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_acc_psp_sva_1_8_2 <= for_for_a_acc_psp_sva_8_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_1_1 <= for_for_a_lpi_3_dfm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_2_1 <= tmp_2_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_3_1 <= tmp_2_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_4_1 <= tmp_2_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_5_1 <= tmp_2_sva_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_6_1 <= tmp_2_sva_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_7_1 <= tmp_2_sva_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_1_3 <= tmp_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_1_1 <= tmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_2_1 <= tmp_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_3_1 <= tmp_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_4_1 <= tmp_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_5_1 <= tmp_sva_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_6_1 <= tmp_sva_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_sva_7_1 <= tmp_sva_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(x_3_sva XOR for_for_asn_12_itm)) AND (fsm_output(2))) = '1' )
          THEN
        for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm <= for_for_acc_tdx_1_9_0_sva_1(2
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (NOT(x_3_sva OR (fsm_output(2)))) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm <= for_for_acc_tdx_9_0_sva_1(2
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (x_3_sva AND (NOT (fsm_output(2)))) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_9_0_2_0_itm <= for_for_acc_tdx_9_0_sva_1(2 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT(for_for_a_for_for_a_and_itm_3 AND (fsm_output(1)))) OR for_for_a_and_2_rgt
          OR for_for_a_and_4_rgt OR for_for_a_and_5_rgt OR for_for_a_and_6_rgt OR
          for_for_a_and_7_rgt OR for_for_a_and_8_rgt OR for_for_a_and_9_rgt OR for_for_a_and_1_rgt
          OR for_for_a_and_10_rgt OR for_for_a_and_11_rgt OR for_for_a_and_12_rgt
          OR for_for_a_and_13_rgt OR for_for_a_and_14_rgt OR for_for_a_and_15_rgt
          OR for_for_a_and_16_rgt) = '1' ) THEN
        for_for_a_lpi_3_dfm <= MUX1HOT_v_32_17_2((xt_rsc_0_0_i_qa_d(31 DOWNTO 0)),
            tmp_2_sva_2, tmp_2_sva_3, tmp_2_sva_4, tmp_2_sva_5, tmp_2_sva_6, tmp_2_sva_7,
            tmp_sva_7, tmp_sva, tmp_sva_1, tmp_sva_2, tmp_sva_3, tmp_sva_4, tmp_sva_5,
            tmp_sva_6, (xt_rsc_0_1_i_qa_d(31 DOWNTO 0)), tmp_2_sva_1_2, STD_LOGIC_VECTOR'(
            for_for_a_and_2_rgt & for_for_a_and_4_rgt & for_for_a_and_5_rgt & for_for_a_and_6_rgt
            & for_for_a_and_7_rgt & for_for_a_and_8_rgt & for_for_a_and_9_rgt & for_for_a_and_1_rgt
            & for_for_a_and_10_rgt & for_for_a_and_11_rgt & for_for_a_and_12_rgt
            & for_for_a_and_13_rgt & for_for_a_and_14_rgt & for_for_a_and_15_rgt
            & for_for_a_and_16_rgt & (fsm_output(2)) & (fsm_output(3))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_acc_psp_sva_8_2 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_acc_psp_sva_8_2 <= for_for_a_acc_tmp(8 DOWNTO 2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( for_for_stage_0_1 = '1' ) THEN
        for_for_w_rshift_itm <= for_for_w_rshift_itm_3;
        for_for_mul_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(reg_s_9_0_ftd
            & reg_s_9_0_ftd_1) * UNSIGNED'( nn_10_sva & nn_9_sva & nn_8_sva & nn_7_sva
            & nn_6_sva & nn_5_sva & nn_4_sva & nn_3_sva & nn_2_sva & nn_1_sva)),
            10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_b_for_for_b_and_13_itm <= '0';
        for_for_b_for_for_b_and_12_itm <= '0';
        for_for_b_for_for_b_and_11_itm <= '0';
        for_for_b_for_for_b_and_10_itm <= '0';
        for_for_b_for_for_b_and_9_itm <= '0';
        for_for_b_for_for_b_and_8_itm <= '0';
        for_for_b_for_for_b_and_7_itm <= '0';
        for_for_b_for_for_b_nor_1_itm <= '0';
        for_for_b_for_for_b_and_6_itm <= '0';
        for_for_b_for_for_b_and_5_itm <= '0';
        for_for_b_for_for_b_and_4_itm <= '0';
        for_for_b_for_for_b_and_3_itm <= '0';
        for_for_b_for_for_b_and_2_itm <= '0';
        for_for_b_for_for_b_and_1_itm <= '0';
        for_for_b_for_for_b_and_itm <= '0';
        for_for_b_for_for_b_nor_itm <= '0';
      ELSIF ( for_for_stage_0_1 = '1' ) THEN
        for_for_b_for_for_b_and_13_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND y_3_sva;
        for_for_b_for_for_b_and_12_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110")) AND y_3_sva;
        for_for_b_for_for_b_and_11_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101")) AND y_3_sva;
        for_for_b_for_for_b_and_10_itm <= (for_for_b_for_for_b_acc_tmp(2)) AND for_for_b_nor_2_cse_1
            AND y_3_sva;
        for_for_b_for_for_b_and_9_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011")) AND y_3_sva;
        for_for_b_for_for_b_and_8_itm <= (for_for_b_for_for_b_acc_tmp(1)) AND for_for_b_nor_1_cse_1
            AND y_3_sva;
        for_for_b_for_for_b_and_7_itm <= (for_for_b_for_for_b_acc_tmp(0)) AND for_for_b_nor_cse_1
            AND y_3_sva;
        for_for_b_for_for_b_nor_1_itm <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")));
        for_for_b_for_for_b_and_6_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("111")) AND (NOT y_3_sva);
        for_for_b_for_for_b_and_5_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("110")) AND (NOT y_3_sva);
        for_for_b_for_for_b_and_4_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("101")) AND (NOT y_3_sva);
        for_for_b_for_for_b_and_3_itm <= (for_for_b_for_for_b_acc_tmp(2)) AND for_for_b_nor_2_cse_1
            AND (NOT y_3_sva);
        for_for_b_for_for_b_and_2_itm <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)=STD_LOGIC_VECTOR'("011")) AND (NOT y_3_sva);
        for_for_b_for_for_b_and_1_itm <= (for_for_b_for_for_b_acc_tmp(1)) AND for_for_b_nor_1_cse_1
            AND (NOT y_3_sva);
        for_for_b_for_for_b_and_itm <= (for_for_b_for_for_b_acc_tmp(0)) AND for_for_b_nor_cse_1
            AND (NOT y_3_sva);
        for_for_b_for_for_b_nor_itm <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2
            DOWNTO 0)/=STD_LOGIC_VECTOR'("000")) OR y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_acc_tdx_9_0_sva_9_3 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_acc_tdx_9_0_sva_9_3 <= for_for_acc_tdx_9_0_sva_1(9 DOWNTO 3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_13_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_13_itm <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO
            0)=STD_LOGIC_VECTOR'("11")) AND (operator_34_true_1_and_psp_sva_1(0))
            AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_12_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_12_itm <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO
            0)=STD_LOGIC_VECTOR'("11")) AND (NOT (operator_34_true_1_and_psp_sva_1(0)))
            AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_11_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_11_itm <= (for_for_a_acc_tmp(1)) AND (operator_34_true_1_and_psp_sva_1(0))
            AND (NOT (for_for_a_acc_tmp(0))) AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_10_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_10_itm <= (for_for_a_acc_tmp(1)) AND for_for_a_nor_2_cse_1
            AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_9_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_9_itm <= (for_for_a_acc_tmp(0)) AND (operator_34_true_1_and_psp_sva_1(0))
            AND (NOT (for_for_a_acc_tmp(1))) AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_8_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_8_itm <= (for_for_a_acc_tmp(0)) AND for_for_a_nor_1_cse_1
            AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_7_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_7_itm <= (operator_34_true_1_and_psp_sva_1(0)) AND
            for_for_a_nor_cse_1 AND y_3_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_1_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_nor_1_itm <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO
            0)/=STD_LOGIC_VECTOR'("00")) OR (operator_34_true_1_and_psp_sva_1(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_6_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_6_itm <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
            AND (operator_34_true_1_and_psp_sva_1(0)) AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_5_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_5_itm <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
            AND (NOT (operator_34_true_1_and_psp_sva_1(0))) AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_4_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_4_itm <= (for_for_a_acc_tmp(1)) AND (operator_34_true_1_and_psp_sva_1(0))
            AND (NOT (for_for_a_acc_tmp(0))) AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_3_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_3_itm <= (for_for_a_acc_tmp(1)) AND for_for_a_nor_2_cse_1
            AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_2_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_2_itm <= (for_for_a_acc_tmp(0)) AND (operator_34_true_1_and_psp_sva_1(0))
            AND (NOT (for_for_a_acc_tmp(1))) AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_1_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_1_itm <= (for_for_a_acc_tmp(0)) AND for_for_a_nor_1_cse_1
            AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_and_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_and_itm <= (operator_34_true_1_and_psp_sva_1(0)) AND
            for_for_a_nor_cse_1 AND (NOT y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_itm <= '0';
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_for_for_a_nor_itm <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO
            0)/=STD_LOGIC_VECTOR'("00")) OR (operator_34_true_1_and_psp_sva_1(0))
            OR y_3_sva);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( for_for_stage_0_2 = '1' ) THEN
        mult_z_asn_itm <= mult_z_mul_cmp_z_oreg;
      END IF;
    END IF;
  END PROCESS;
  for_for_a_mux1h_80_nl <= MUX1HOT_s_1_3_2(for_for_a_asn_itm, y_3_sva, x_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_4 & (fsm_output(3)) & (fsm_output(4))));
  for_for_mux1h_36_nl <= MUX1HOT_s_1_3_2(for_for_asn_12_itm, x_3_sva, y_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_4 & (fsm_output(3)) & (fsm_output(4))));
  for_for_mux1h_41_nl <= MUX1HOT_s_1_3_2(for_for_asn_10_itm, x_3_sva, y_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_4 & (fsm_output(3)) & (fsm_output(4))));
  nn_mux_nl <= MUX_s_1_2_2(nn_10_sva, nn_9_sva, fsm_output(4));
  for_for_b_and_nl <= for_for_b_for_for_b_nor_itm AND (NOT (fsm_output(3)));
  for_for_b_and_2_nl <= for_for_b_for_for_b_and_itm AND (NOT (fsm_output(3)));
  for_for_b_and_3_nl <= for_for_b_for_for_b_and_1_itm AND (NOT (fsm_output(3)));
  for_for_b_and_4_nl <= for_for_b_for_for_b_and_2_itm AND (NOT (fsm_output(3)));
  for_for_b_and_5_nl <= for_for_b_for_for_b_and_3_itm AND (NOT (fsm_output(3)));
  for_for_b_and_6_nl <= for_for_b_for_for_b_and_4_itm AND (NOT (fsm_output(3)));
  for_for_b_and_7_nl <= for_for_b_for_for_b_and_5_itm AND (NOT (fsm_output(3)));
  for_for_b_and_8_nl <= for_for_b_for_for_b_and_6_itm AND (NOT (fsm_output(3)));
  for_for_b_and_1_nl <= for_for_b_for_for_b_nor_1_itm AND y_3_sva AND (NOT (fsm_output(3)));
  for_for_b_and_9_nl <= for_for_b_for_for_b_and_7_itm AND (NOT (fsm_output(3)));
  for_for_b_and_10_nl <= for_for_b_for_for_b_and_8_itm AND (NOT (fsm_output(3)));
  for_for_b_and_11_nl <= for_for_b_for_for_b_and_9_itm AND (NOT (fsm_output(3)));
  for_for_b_and_12_nl <= for_for_b_for_for_b_and_10_itm AND (NOT (fsm_output(3)));
  for_for_b_and_13_nl <= for_for_b_for_for_b_and_11_itm AND (NOT (fsm_output(3)));
  for_for_b_and_14_nl <= for_for_b_for_for_b_and_12_itm AND (NOT (fsm_output(3)));
  for_for_b_and_15_nl <= for_for_b_for_for_b_and_13_itm AND (NOT (fsm_output(3)));
  idx_not_1_nl <= NOT (fsm_output(0));
  operator_32_false_2_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(shift_3_0_sva)
      + UNSIGNED'( "1111"), 4));
  y_not_36_nl <= NOT y_or_cse;
  mult_res_and_1_nl <= z_out_2_32 AND (fsm_output(3));
  for_for_and_6_nl <= for_for_asn_10_itm AND (fsm_output(3));
  mult_if_mult_if_or_1_nl <= (z_out_1(31)) OR (fsm_output(2));
  mult_if_or_1_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  mult_if_mux_5_nl <= MUX_v_32_2_2((NOT p_sva), p_sva, fsm_output(2));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mult_if_or_1_nl & (z_out_1(30
      DOWNTO 0)) & mult_if_or_1_nl) + UNSIGNED(mult_if_mux_5_nl & '1'), 33));
  z_out <= acc_nl(32 DOWNTO 1);
  for_for_mux_29_nl <= MUX_v_32_2_2(for_for_a_lpi_3_dfm, mult_z_asn_itm_1, fsm_output(3));
  for_for_mux_30_nl <= MUX_v_32_2_2((NOT mult_res_lpi_3_dfm_1), (NOT mult_z_mul_cmp_z_oreg),
      fsm_output(3));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_for_mux_29_nl & '1') +
      UNSIGNED(for_for_mux_30_nl & '1'), 33));
  z_out_1 <= acc_1_nl(32 DOWNTO 1);
  mult_if_mux_6_nl <= MUX_v_32_2_2(z_out_1, p_sva, fsm_output(2));
  mult_if_mux_7_nl <= MUX_v_32_2_2((NOT p_sva), (NOT modulo_add_base_sva_1), fsm_output(2));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mux_6_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mult_if_mux_7_nl & '1'), 33), 34), 34));
  z_out_2_32 <= acc_2_nl(33);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_wea : OUT STD_LOGIC;
    xt_rsc_0_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_web : OUT STD_LOGIC;
    xt_rsc_0_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    xt_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_1_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_wea : OUT STD_LOGIC;
    xt_rsc_0_1_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_1_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_web : OUT STD_LOGIC;
    xt_rsc_0_1_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    xt_rsc_0_2_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_2_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_wea : OUT STD_LOGIC;
    xt_rsc_0_2_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_2_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_web : OUT STD_LOGIC;
    xt_rsc_0_2_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    xt_rsc_0_3_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_3_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_wea : OUT STD_LOGIC;
    xt_rsc_0_3_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_3_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_web : OUT STD_LOGIC;
    xt_rsc_0_3_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    xt_rsc_0_4_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_4_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_wea : OUT STD_LOGIC;
    xt_rsc_0_4_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_4_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_web : OUT STD_LOGIC;
    xt_rsc_0_4_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    xt_rsc_0_5_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_5_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_wea : OUT STD_LOGIC;
    xt_rsc_0_5_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_5_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_web : OUT STD_LOGIC;
    xt_rsc_0_5_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    xt_rsc_0_6_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_6_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_wea : OUT STD_LOGIC;
    xt_rsc_0_6_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_6_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_web : OUT STD_LOGIC;
    xt_rsc_0_6_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    xt_rsc_0_7_adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_7_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_wea : OUT STD_LOGIC;
    xt_rsc_0_7_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    xt_rsc_0_7_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_web : OUT STD_LOGIC;
    xt_rsc_0_7_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_h_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC
  );
END stockham_dit;

ARCHITECTURE v13 OF stockham_dit IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL mult_z_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_web : STD_LOGIC;
  SIGNAL yt_rsc_0_0_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_0_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_0_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_web : STD_LOGIC;
  SIGNAL yt_rsc_0_1_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_1_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_web : STD_LOGIC;
  SIGNAL yt_rsc_0_2_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_2_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_web : STD_LOGIC;
  SIGNAL yt_rsc_0_3_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_3_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_4_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_4_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_web : STD_LOGIC;
  SIGNAL yt_rsc_0_4_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_4_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_5_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_5_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_web : STD_LOGIC;
  SIGNAL yt_rsc_0_5_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_5_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_6_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_6_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_web : STD_LOGIC;
  SIGNAL yt_rsc_0_6_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_6_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_7_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_7_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_web : STD_LOGIC;
  SIGNAL yt_rsc_0_7_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_7_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;

  SIGNAL yt_rsc_0_0_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_1_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_2_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_3_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_4_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_5_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_6_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_7_comp_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_4_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_5_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_6_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL yt_rsc_0_7_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL xt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL xt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL xt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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
  SIGNAL xt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_4_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_5_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_6_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      clka : IN STD_LOGIC;
      clka_en : IN STD_LOGIC;
      da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL xt_rsc_0_7_i_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_adrb : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_adra : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_adra_d_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_4_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_5_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_6_lz : OUT STD_LOGIC;
      xt_rsc_triosy_0_7_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_h_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_h_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      xt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      mult_z_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_z_mul_cmp_z : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      twiddle_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_dit_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_z_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_z_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_z_mul_cmp_z : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_rsci_radr_d_pff : STD_LOGIC_VECTOR (9 DOWNTO
      0);

BEGIN
  yt_rsc_0_0_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 7,
      data_width => 32,
      depth => 128,
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
      addr_width => 7,
      data_width => 32,
      depth => 128,
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
      addr_width => 7,
      data_width => 32,
      depth => 128,
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
      addr_width => 7,
      data_width => 32,
      depth => 128,
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

  yt_rsc_0_4_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 7,
      data_width => 32,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_4_comp_adra,
      adrb => yt_rsc_0_4_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_4_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_4_clkb_en,
      da => yt_rsc_0_4_comp_da,
      db => yt_rsc_0_4_comp_db,
      qa => yt_rsc_0_4_comp_qa,
      qb => yt_rsc_0_4_comp_qb,
      wea => yt_rsc_0_4_wea,
      web => yt_rsc_0_4_web
    );
  yt_rsc_0_4_comp_adra <= yt_rsc_0_4_adra;
  yt_rsc_0_4_comp_adrb <= yt_rsc_0_4_adrb;
  yt_rsc_0_4_comp_da <= yt_rsc_0_4_da;
  yt_rsc_0_4_comp_db <= yt_rsc_0_4_db;
  yt_rsc_0_4_qa <= yt_rsc_0_4_comp_qa;
  yt_rsc_0_4_qb <= yt_rsc_0_4_comp_qb;

  yt_rsc_0_5_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 7,
      data_width => 32,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_5_comp_adra,
      adrb => yt_rsc_0_5_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_5_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_5_clkb_en,
      da => yt_rsc_0_5_comp_da,
      db => yt_rsc_0_5_comp_db,
      qa => yt_rsc_0_5_comp_qa,
      qb => yt_rsc_0_5_comp_qb,
      wea => yt_rsc_0_5_wea,
      web => yt_rsc_0_5_web
    );
  yt_rsc_0_5_comp_adra <= yt_rsc_0_5_adra;
  yt_rsc_0_5_comp_adrb <= yt_rsc_0_5_adrb;
  yt_rsc_0_5_comp_da <= yt_rsc_0_5_da;
  yt_rsc_0_5_comp_db <= yt_rsc_0_5_db;
  yt_rsc_0_5_qa <= yt_rsc_0_5_comp_qa;
  yt_rsc_0_5_qb <= yt_rsc_0_5_comp_qb;

  yt_rsc_0_6_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 7,
      data_width => 32,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_6_comp_adra,
      adrb => yt_rsc_0_6_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_6_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_6_clkb_en,
      da => yt_rsc_0_6_comp_da,
      db => yt_rsc_0_6_comp_db,
      qa => yt_rsc_0_6_comp_qa,
      qb => yt_rsc_0_6_comp_qb,
      wea => yt_rsc_0_6_wea,
      web => yt_rsc_0_6_web
    );
  yt_rsc_0_6_comp_adra <= yt_rsc_0_6_adra;
  yt_rsc_0_6_comp_adrb <= yt_rsc_0_6_adrb;
  yt_rsc_0_6_comp_da <= yt_rsc_0_6_da;
  yt_rsc_0_6_comp_db <= yt_rsc_0_6_db;
  yt_rsc_0_6_qa <= yt_rsc_0_6_comp_qa;
  yt_rsc_0_6_qb <= yt_rsc_0_6_comp_qb;

  yt_rsc_0_7_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 7,
      data_width => 32,
      depth => 128,
      latency => 1
      )
    PORT MAP(
      adra => yt_rsc_0_7_comp_adra,
      adrb => yt_rsc_0_7_comp_adrb,
      clka => clk,
      clka_en => yt_rsc_0_7_clkb_en,
      clkb => clk,
      clkb_en => yt_rsc_0_7_clkb_en,
      da => yt_rsc_0_7_comp_da,
      db => yt_rsc_0_7_comp_db,
      qa => yt_rsc_0_7_comp_qa,
      qb => yt_rsc_0_7_comp_qb,
      wea => yt_rsc_0_7_wea,
      web => yt_rsc_0_7_web
    );
  yt_rsc_0_7_comp_adra <= yt_rsc_0_7_adra;
  yt_rsc_0_7_comp_adrb <= yt_rsc_0_7_adrb;
  yt_rsc_0_7_comp_da <= yt_rsc_0_7_da;
  yt_rsc_0_7_comp_db <= yt_rsc_0_7_db;
  yt_rsc_0_7_qa <= yt_rsc_0_7_comp_qa;
  yt_rsc_0_7_qb <= yt_rsc_0_7_comp_qb;

  twiddle_rsci : stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen
    PORT MAP(
      q => twiddle_rsci_q,
      radr => twiddle_rsci_radr,
      q_d => twiddle_rsci_q_d_1,
      radr_d => twiddle_rsci_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_rsci_q <= twiddle_rsc_q;
  twiddle_rsc_radr <= twiddle_rsci_radr;
  twiddle_rsci_q_d <= twiddle_rsci_q_d_1;
  twiddle_rsci_radr_d <= twiddle_rsci_radr_d_iff;

  twiddle_h_rsci : stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen
    PORT MAP(
      q => twiddle_h_rsci_q,
      radr => twiddle_h_rsci_radr,
      q_d => twiddle_h_rsci_q_d_1,
      radr_d => twiddle_h_rsci_radr_d,
      readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  twiddle_h_rsci_q <= twiddle_h_rsc_q;
  twiddle_h_rsc_radr <= twiddle_h_rsci_radr;
  twiddle_h_rsci_q_d <= twiddle_h_rsci_q_d_1;
  twiddle_h_rsci_radr_d <= twiddle_rsci_radr_d_iff;

  yt_rsc_0_0_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
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

  yt_rsc_0_1_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
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
      clka_en_d => yt_rsc_0_1_i_clka_en_d,
      clkb_en_d => yt_rsc_0_1_i_clka_en_d,
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

  yt_rsc_0_2_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
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
      clka_en_d => yt_rsc_0_2_i_clka_en_d,
      clkb_en_d => yt_rsc_0_2_i_clka_en_d,
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

  yt_rsc_0_3_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
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
      clka_en_d => yt_rsc_0_3_i_clka_en_d,
      clkb_en_d => yt_rsc_0_3_i_clka_en_d,
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

  yt_rsc_0_4_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_4_clkb_en,
      clka_en => yt_rsc_0_4_clka_en,
      qb => yt_rsc_0_4_i_qb,
      web => yt_rsc_0_4_web,
      db => yt_rsc_0_4_i_db,
      adrb => yt_rsc_0_4_i_adrb,
      qa => yt_rsc_0_4_i_qa,
      wea => yt_rsc_0_4_wea,
      da => yt_rsc_0_4_i_da,
      adra => yt_rsc_0_4_i_adra,
      adra_d => yt_rsc_0_4_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_4_i_clka_en_d,
      clkb_en_d => yt_rsc_0_4_i_clka_en_d,
      da_d => yt_rsc_0_4_i_da_d_1,
      qa_d => yt_rsc_0_4_i_qa_d_1,
      wea_d => yt_rsc_0_4_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_4_i_qb <= yt_rsc_0_4_qb;
  yt_rsc_0_4_db <= yt_rsc_0_4_i_db;
  yt_rsc_0_4_adrb <= yt_rsc_0_4_i_adrb;
  yt_rsc_0_4_i_qa <= yt_rsc_0_4_qa;
  yt_rsc_0_4_da <= yt_rsc_0_4_i_da;
  yt_rsc_0_4_adra <= yt_rsc_0_4_i_adra;
  yt_rsc_0_4_i_adra_d_1 <= yt_rsc_0_4_i_adra_d;
  yt_rsc_0_4_i_da_d_1 <= yt_rsc_0_4_i_da_d;
  yt_rsc_0_4_i_qa_d <= yt_rsc_0_4_i_qa_d_1;
  yt_rsc_0_4_i_wea_d_1 <= yt_rsc_0_4_i_wea_d;
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_5_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_5_clkb_en,
      clka_en => yt_rsc_0_5_clka_en,
      qb => yt_rsc_0_5_i_qb,
      web => yt_rsc_0_5_web,
      db => yt_rsc_0_5_i_db,
      adrb => yt_rsc_0_5_i_adrb,
      qa => yt_rsc_0_5_i_qa,
      wea => yt_rsc_0_5_wea,
      da => yt_rsc_0_5_i_da,
      adra => yt_rsc_0_5_i_adra,
      adra_d => yt_rsc_0_5_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_5_i_clka_en_d,
      clkb_en_d => yt_rsc_0_5_i_clka_en_d,
      da_d => yt_rsc_0_5_i_da_d_1,
      qa_d => yt_rsc_0_5_i_qa_d_1,
      wea_d => yt_rsc_0_5_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_5_i_qb <= yt_rsc_0_5_qb;
  yt_rsc_0_5_db <= yt_rsc_0_5_i_db;
  yt_rsc_0_5_adrb <= yt_rsc_0_5_i_adrb;
  yt_rsc_0_5_i_qa <= yt_rsc_0_5_qa;
  yt_rsc_0_5_da <= yt_rsc_0_5_i_da;
  yt_rsc_0_5_adra <= yt_rsc_0_5_i_adra;
  yt_rsc_0_5_i_adra_d_1 <= yt_rsc_0_5_i_adra_d;
  yt_rsc_0_5_i_da_d_1 <= yt_rsc_0_5_i_da_d;
  yt_rsc_0_5_i_qa_d <= yt_rsc_0_5_i_qa_d_1;
  yt_rsc_0_5_i_wea_d_1 <= yt_rsc_0_5_i_wea_d;
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_6_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_6_clkb_en,
      clka_en => yt_rsc_0_6_clka_en,
      qb => yt_rsc_0_6_i_qb,
      web => yt_rsc_0_6_web,
      db => yt_rsc_0_6_i_db,
      adrb => yt_rsc_0_6_i_adrb,
      qa => yt_rsc_0_6_i_qa,
      wea => yt_rsc_0_6_wea,
      da => yt_rsc_0_6_i_da,
      adra => yt_rsc_0_6_i_adra,
      adra_d => yt_rsc_0_6_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_6_i_clka_en_d,
      clkb_en_d => yt_rsc_0_6_i_clka_en_d,
      da_d => yt_rsc_0_6_i_da_d_1,
      qa_d => yt_rsc_0_6_i_qa_d_1,
      wea_d => yt_rsc_0_6_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_6_i_qb <= yt_rsc_0_6_qb;
  yt_rsc_0_6_db <= yt_rsc_0_6_i_db;
  yt_rsc_0_6_adrb <= yt_rsc_0_6_i_adrb;
  yt_rsc_0_6_i_qa <= yt_rsc_0_6_qa;
  yt_rsc_0_6_da <= yt_rsc_0_6_i_da;
  yt_rsc_0_6_adra <= yt_rsc_0_6_i_adra;
  yt_rsc_0_6_i_adra_d_1 <= yt_rsc_0_6_i_adra_d;
  yt_rsc_0_6_i_da_d_1 <= yt_rsc_0_6_i_da_d;
  yt_rsc_0_6_i_qa_d <= yt_rsc_0_6_i_qa_d_1;
  yt_rsc_0_6_i_wea_d_1 <= yt_rsc_0_6_i_wea_d;
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  yt_rsc_0_7_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
    PORT MAP(
      clkb_en => yt_rsc_0_7_clkb_en,
      clka_en => yt_rsc_0_7_clka_en,
      qb => yt_rsc_0_7_i_qb,
      web => yt_rsc_0_7_web,
      db => yt_rsc_0_7_i_db,
      adrb => yt_rsc_0_7_i_adrb,
      qa => yt_rsc_0_7_i_qa,
      wea => yt_rsc_0_7_wea,
      da => yt_rsc_0_7_i_da,
      adra => yt_rsc_0_7_i_adra,
      adra_d => yt_rsc_0_7_i_adra_d_1,
      clka => clk,
      clka_en_d => yt_rsc_0_7_i_clka_en_d,
      clkb_en_d => yt_rsc_0_7_i_clka_en_d,
      da_d => yt_rsc_0_7_i_da_d_1,
      qa_d => yt_rsc_0_7_i_qa_d_1,
      wea_d => yt_rsc_0_7_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  yt_rsc_0_7_i_qb <= yt_rsc_0_7_qb;
  yt_rsc_0_7_db <= yt_rsc_0_7_i_db;
  yt_rsc_0_7_adrb <= yt_rsc_0_7_i_adrb;
  yt_rsc_0_7_i_qa <= yt_rsc_0_7_qa;
  yt_rsc_0_7_da <= yt_rsc_0_7_i_da;
  yt_rsc_0_7_adra <= yt_rsc_0_7_i_adra;
  yt_rsc_0_7_i_adra_d_1 <= yt_rsc_0_7_i_adra_d;
  yt_rsc_0_7_i_da_d_1 <= yt_rsc_0_7_i_da_d;
  yt_rsc_0_7_i_qa_d <= yt_rsc_0_7_i_qa_d_1;
  yt_rsc_0_7_i_wea_d_1 <= yt_rsc_0_7_i_wea_d;
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_0_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
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

  xt_rsc_0_1_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
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

  xt_rsc_0_2_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
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

  xt_rsc_0_3_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
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

  xt_rsc_0_4_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_4_i_qb,
      web => xt_rsc_0_4_web,
      db => xt_rsc_0_4_i_db,
      adrb => xt_rsc_0_4_i_adrb,
      qa => xt_rsc_0_4_i_qa,
      wea => xt_rsc_0_4_wea,
      da => xt_rsc_0_4_i_da,
      adra => xt_rsc_0_4_i_adra,
      adra_d => xt_rsc_0_4_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_4_i_da_d_1,
      qa_d => xt_rsc_0_4_i_qa_d_1,
      wea_d => xt_rsc_0_4_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_4_i_qb <= xt_rsc_0_4_qb;
  xt_rsc_0_4_db <= xt_rsc_0_4_i_db;
  xt_rsc_0_4_adrb <= xt_rsc_0_4_i_adrb;
  xt_rsc_0_4_i_qa <= xt_rsc_0_4_qa;
  xt_rsc_0_4_da <= xt_rsc_0_4_i_da;
  xt_rsc_0_4_adra <= xt_rsc_0_4_i_adra;
  xt_rsc_0_4_i_adra_d_1 <= xt_rsc_0_4_i_adra_d;
  xt_rsc_0_4_i_da_d_1 <= xt_rsc_0_4_i_da_d;
  xt_rsc_0_4_i_qa_d <= xt_rsc_0_4_i_qa_d_1;
  xt_rsc_0_4_i_wea_d_1 <= xt_rsc_0_4_i_wea_d;
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_5_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_5_i_qb,
      web => xt_rsc_0_5_web,
      db => xt_rsc_0_5_i_db,
      adrb => xt_rsc_0_5_i_adrb,
      qa => xt_rsc_0_5_i_qa,
      wea => xt_rsc_0_5_wea,
      da => xt_rsc_0_5_i_da,
      adra => xt_rsc_0_5_i_adra,
      adra_d => xt_rsc_0_5_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_5_i_da_d_1,
      qa_d => xt_rsc_0_5_i_qa_d_1,
      wea_d => xt_rsc_0_5_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_5_i_qb <= xt_rsc_0_5_qb;
  xt_rsc_0_5_db <= xt_rsc_0_5_i_db;
  xt_rsc_0_5_adrb <= xt_rsc_0_5_i_adrb;
  xt_rsc_0_5_i_qa <= xt_rsc_0_5_qa;
  xt_rsc_0_5_da <= xt_rsc_0_5_i_da;
  xt_rsc_0_5_adra <= xt_rsc_0_5_i_adra;
  xt_rsc_0_5_i_adra_d_1 <= xt_rsc_0_5_i_adra_d;
  xt_rsc_0_5_i_da_d_1 <= xt_rsc_0_5_i_da_d;
  xt_rsc_0_5_i_qa_d <= xt_rsc_0_5_i_qa_d_1;
  xt_rsc_0_5_i_wea_d_1 <= xt_rsc_0_5_i_wea_d;
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_6_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_6_i_qb,
      web => xt_rsc_0_6_web,
      db => xt_rsc_0_6_i_db,
      adrb => xt_rsc_0_6_i_adrb,
      qa => xt_rsc_0_6_i_qa,
      wea => xt_rsc_0_6_wea,
      da => xt_rsc_0_6_i_da,
      adra => xt_rsc_0_6_i_adra,
      adra_d => xt_rsc_0_6_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_6_i_da_d_1,
      qa_d => xt_rsc_0_6_i_qa_d_1,
      wea_d => xt_rsc_0_6_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_6_i_qb <= xt_rsc_0_6_qb;
  xt_rsc_0_6_db <= xt_rsc_0_6_i_db;
  xt_rsc_0_6_adrb <= xt_rsc_0_6_i_adrb;
  xt_rsc_0_6_i_qa <= xt_rsc_0_6_qa;
  xt_rsc_0_6_da <= xt_rsc_0_6_i_da;
  xt_rsc_0_6_adra <= xt_rsc_0_6_i_adra;
  xt_rsc_0_6_i_adra_d_1 <= xt_rsc_0_6_i_adra_d;
  xt_rsc_0_6_i_da_d_1 <= xt_rsc_0_6_i_da_d;
  xt_rsc_0_6_i_qa_d <= xt_rsc_0_6_i_qa_d_1;
  xt_rsc_0_6_i_wea_d_1 <= xt_rsc_0_6_i_wea_d;
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  xt_rsc_0_7_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
    PORT MAP(
      qb => xt_rsc_0_7_i_qb,
      web => xt_rsc_0_7_web,
      db => xt_rsc_0_7_i_db,
      adrb => xt_rsc_0_7_i_adrb,
      qa => xt_rsc_0_7_i_qa,
      wea => xt_rsc_0_7_wea,
      da => xt_rsc_0_7_i_da,
      adra => xt_rsc_0_7_i_adra,
      adra_d => xt_rsc_0_7_i_adra_d_1,
      clka => clk,
      clka_en => '1',
      da_d => xt_rsc_0_7_i_da_d_1,
      qa_d => xt_rsc_0_7_i_qa_d_1,
      wea_d => xt_rsc_0_7_i_wea_d_1,
      rwA_rw_ram_ir_internal_RMASK_B_d => xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1,
      rwA_rw_ram_ir_internal_WMASK_B_d => xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1
    );
  xt_rsc_0_7_i_qb <= xt_rsc_0_7_qb;
  xt_rsc_0_7_db <= xt_rsc_0_7_i_db;
  xt_rsc_0_7_adrb <= xt_rsc_0_7_i_adrb;
  xt_rsc_0_7_i_qa <= xt_rsc_0_7_qa;
  xt_rsc_0_7_da <= xt_rsc_0_7_i_da;
  xt_rsc_0_7_adra <= xt_rsc_0_7_i_adra;
  xt_rsc_0_7_i_adra_d_1 <= xt_rsc_0_7_i_adra_d;
  xt_rsc_0_7_i_da_d_1 <= xt_rsc_0_7_i_da_d;
  xt_rsc_0_7_i_qa_d <= xt_rsc_0_7_i_qa_d_1;
  xt_rsc_0_7_i_wea_d_1 <= xt_rsc_0_7_i_wea_d;
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 <= xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 <= xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;

  stockham_dit_core_inst : stockham_dit_core
    PORT MAP(
      clk => clk,
      rst => rst,
      xt_rsc_triosy_0_0_lz => xt_rsc_triosy_0_0_lz,
      xt_rsc_triosy_0_1_lz => xt_rsc_triosy_0_1_lz,
      xt_rsc_triosy_0_2_lz => xt_rsc_triosy_0_2_lz,
      xt_rsc_triosy_0_3_lz => xt_rsc_triosy_0_3_lz,
      xt_rsc_triosy_0_4_lz => xt_rsc_triosy_0_4_lz,
      xt_rsc_triosy_0_5_lz => xt_rsc_triosy_0_5_lz,
      xt_rsc_triosy_0_6_lz => xt_rsc_triosy_0_6_lz,
      xt_rsc_triosy_0_7_lz => xt_rsc_triosy_0_7_lz,
      p_rsc_dat => stockham_dit_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      twiddle_h_rsc_triosy_lz => twiddle_h_rsc_triosy_lz,
      twiddle_rsci_q_d => stockham_dit_core_inst_twiddle_rsci_q_d,
      twiddle_h_rsci_q_d => stockham_dit_core_inst_twiddle_h_rsci_q_d,
      yt_rsc_0_0_i_adra_d => stockham_dit_core_inst_yt_rsc_0_0_i_adra_d,
      yt_rsc_0_0_i_clka_en_d => yt_rsc_0_0_i_clka_en_d,
      yt_rsc_0_0_i_da_d => stockham_dit_core_inst_yt_rsc_0_0_i_da_d,
      yt_rsc_0_0_i_qa_d => stockham_dit_core_inst_yt_rsc_0_0_i_qa_d,
      yt_rsc_0_0_i_wea_d => stockham_dit_core_inst_yt_rsc_0_0_i_wea_d,
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_1_i_adra_d => stockham_dit_core_inst_yt_rsc_0_1_i_adra_d,
      yt_rsc_0_1_i_clka_en_d => yt_rsc_0_1_i_clka_en_d,
      yt_rsc_0_1_i_da_d => stockham_dit_core_inst_yt_rsc_0_1_i_da_d,
      yt_rsc_0_1_i_qa_d => stockham_dit_core_inst_yt_rsc_0_1_i_qa_d,
      yt_rsc_0_1_i_wea_d => stockham_dit_core_inst_yt_rsc_0_1_i_wea_d,
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_2_i_adra_d => stockham_dit_core_inst_yt_rsc_0_2_i_adra_d,
      yt_rsc_0_2_i_clka_en_d => yt_rsc_0_2_i_clka_en_d,
      yt_rsc_0_2_i_da_d => stockham_dit_core_inst_yt_rsc_0_2_i_da_d,
      yt_rsc_0_2_i_qa_d => stockham_dit_core_inst_yt_rsc_0_2_i_qa_d,
      yt_rsc_0_2_i_wea_d => stockham_dit_core_inst_yt_rsc_0_2_i_wea_d,
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_3_i_adra_d => stockham_dit_core_inst_yt_rsc_0_3_i_adra_d,
      yt_rsc_0_3_i_clka_en_d => yt_rsc_0_3_i_clka_en_d,
      yt_rsc_0_3_i_da_d => stockham_dit_core_inst_yt_rsc_0_3_i_da_d,
      yt_rsc_0_3_i_qa_d => stockham_dit_core_inst_yt_rsc_0_3_i_qa_d,
      yt_rsc_0_3_i_wea_d => stockham_dit_core_inst_yt_rsc_0_3_i_wea_d,
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_4_i_adra_d => stockham_dit_core_inst_yt_rsc_0_4_i_adra_d,
      yt_rsc_0_4_i_clka_en_d => yt_rsc_0_4_i_clka_en_d,
      yt_rsc_0_4_i_da_d => stockham_dit_core_inst_yt_rsc_0_4_i_da_d,
      yt_rsc_0_4_i_qa_d => stockham_dit_core_inst_yt_rsc_0_4_i_qa_d,
      yt_rsc_0_4_i_wea_d => stockham_dit_core_inst_yt_rsc_0_4_i_wea_d,
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_5_i_adra_d => stockham_dit_core_inst_yt_rsc_0_5_i_adra_d,
      yt_rsc_0_5_i_clka_en_d => yt_rsc_0_5_i_clka_en_d,
      yt_rsc_0_5_i_da_d => stockham_dit_core_inst_yt_rsc_0_5_i_da_d,
      yt_rsc_0_5_i_qa_d => stockham_dit_core_inst_yt_rsc_0_5_i_qa_d,
      yt_rsc_0_5_i_wea_d => stockham_dit_core_inst_yt_rsc_0_5_i_wea_d,
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_6_i_adra_d => stockham_dit_core_inst_yt_rsc_0_6_i_adra_d,
      yt_rsc_0_6_i_clka_en_d => yt_rsc_0_6_i_clka_en_d,
      yt_rsc_0_6_i_da_d => stockham_dit_core_inst_yt_rsc_0_6_i_da_d,
      yt_rsc_0_6_i_qa_d => stockham_dit_core_inst_yt_rsc_0_6_i_qa_d,
      yt_rsc_0_6_i_wea_d => stockham_dit_core_inst_yt_rsc_0_6_i_wea_d,
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      yt_rsc_0_7_i_adra_d => stockham_dit_core_inst_yt_rsc_0_7_i_adra_d,
      yt_rsc_0_7_i_clka_en_d => yt_rsc_0_7_i_clka_en_d,
      yt_rsc_0_7_i_da_d => stockham_dit_core_inst_yt_rsc_0_7_i_da_d,
      yt_rsc_0_7_i_qa_d => stockham_dit_core_inst_yt_rsc_0_7_i_qa_d,
      yt_rsc_0_7_i_wea_d => stockham_dit_core_inst_yt_rsc_0_7_i_wea_d,
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_0_i_adra_d => stockham_dit_core_inst_xt_rsc_0_0_i_adra_d,
      xt_rsc_0_0_i_da_d => stockham_dit_core_inst_xt_rsc_0_0_i_da_d,
      xt_rsc_0_0_i_qa_d => stockham_dit_core_inst_xt_rsc_0_0_i_qa_d,
      xt_rsc_0_0_i_wea_d => stockham_dit_core_inst_xt_rsc_0_0_i_wea_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_1_i_adra_d => stockham_dit_core_inst_xt_rsc_0_1_i_adra_d,
      xt_rsc_0_1_i_da_d => stockham_dit_core_inst_xt_rsc_0_1_i_da_d,
      xt_rsc_0_1_i_qa_d => stockham_dit_core_inst_xt_rsc_0_1_i_qa_d,
      xt_rsc_0_1_i_wea_d => stockham_dit_core_inst_xt_rsc_0_1_i_wea_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_2_i_adra_d => stockham_dit_core_inst_xt_rsc_0_2_i_adra_d,
      xt_rsc_0_2_i_da_d => stockham_dit_core_inst_xt_rsc_0_2_i_da_d,
      xt_rsc_0_2_i_qa_d => stockham_dit_core_inst_xt_rsc_0_2_i_qa_d,
      xt_rsc_0_2_i_wea_d => stockham_dit_core_inst_xt_rsc_0_2_i_wea_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_3_i_adra_d => stockham_dit_core_inst_xt_rsc_0_3_i_adra_d,
      xt_rsc_0_3_i_da_d => stockham_dit_core_inst_xt_rsc_0_3_i_da_d,
      xt_rsc_0_3_i_qa_d => stockham_dit_core_inst_xt_rsc_0_3_i_qa_d,
      xt_rsc_0_3_i_wea_d => stockham_dit_core_inst_xt_rsc_0_3_i_wea_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_4_i_adra_d => stockham_dit_core_inst_xt_rsc_0_4_i_adra_d,
      xt_rsc_0_4_i_da_d => stockham_dit_core_inst_xt_rsc_0_4_i_da_d,
      xt_rsc_0_4_i_qa_d => stockham_dit_core_inst_xt_rsc_0_4_i_qa_d,
      xt_rsc_0_4_i_wea_d => stockham_dit_core_inst_xt_rsc_0_4_i_wea_d,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_5_i_adra_d => stockham_dit_core_inst_xt_rsc_0_5_i_adra_d,
      xt_rsc_0_5_i_da_d => stockham_dit_core_inst_xt_rsc_0_5_i_da_d,
      xt_rsc_0_5_i_qa_d => stockham_dit_core_inst_xt_rsc_0_5_i_qa_d,
      xt_rsc_0_5_i_wea_d => stockham_dit_core_inst_xt_rsc_0_5_i_wea_d,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_6_i_adra_d => stockham_dit_core_inst_xt_rsc_0_6_i_adra_d,
      xt_rsc_0_6_i_da_d => stockham_dit_core_inst_xt_rsc_0_6_i_da_d,
      xt_rsc_0_6_i_qa_d => stockham_dit_core_inst_xt_rsc_0_6_i_qa_d,
      xt_rsc_0_6_i_wea_d => stockham_dit_core_inst_xt_rsc_0_6_i_wea_d,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      xt_rsc_0_7_i_adra_d => stockham_dit_core_inst_xt_rsc_0_7_i_adra_d,
      xt_rsc_0_7_i_da_d => stockham_dit_core_inst_xt_rsc_0_7_i_da_d,
      xt_rsc_0_7_i_qa_d => stockham_dit_core_inst_xt_rsc_0_7_i_qa_d,
      xt_rsc_0_7_i_wea_d => stockham_dit_core_inst_xt_rsc_0_7_i_wea_d,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d => stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d => stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d,
      mult_z_mul_cmp_a => stockham_dit_core_inst_mult_z_mul_cmp_a,
      mult_z_mul_cmp_b => stockham_dit_core_inst_mult_z_mul_cmp_b,
      mult_z_mul_cmp_z => stockham_dit_core_inst_mult_z_mul_cmp_z,
      twiddle_rsci_radr_d_pff => stockham_dit_core_inst_twiddle_rsci_radr_d_pff,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff
    );
  stockham_dit_core_inst_p_rsc_dat <= p_rsc_dat;
  stockham_dit_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  stockham_dit_core_inst_twiddle_h_rsci_q_d <= twiddle_h_rsci_q_d;
  yt_rsc_0_0_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_0_i_adra_d;
  yt_rsc_0_0_i_da_d <= stockham_dit_core_inst_yt_rsc_0_0_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_0_i_qa_d <= yt_rsc_0_0_i_qa_d;
  yt_rsc_0_0_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_0_i_wea_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_1_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_1_i_adra_d;
  yt_rsc_0_1_i_da_d <= stockham_dit_core_inst_yt_rsc_0_1_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_1_i_qa_d <= yt_rsc_0_1_i_qa_d;
  yt_rsc_0_1_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_1_i_wea_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_2_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_2_i_adra_d;
  yt_rsc_0_2_i_da_d <= stockham_dit_core_inst_yt_rsc_0_2_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_2_i_qa_d <= yt_rsc_0_2_i_qa_d;
  yt_rsc_0_2_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_2_i_wea_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_3_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_3_i_adra_d;
  yt_rsc_0_3_i_da_d <= stockham_dit_core_inst_yt_rsc_0_3_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_3_i_qa_d <= yt_rsc_0_3_i_qa_d;
  yt_rsc_0_3_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_3_i_wea_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_4_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_4_i_adra_d;
  yt_rsc_0_4_i_da_d <= stockham_dit_core_inst_yt_rsc_0_4_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_4_i_qa_d <= yt_rsc_0_4_i_qa_d;
  yt_rsc_0_4_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_4_i_wea_d;
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_5_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_5_i_adra_d;
  yt_rsc_0_5_i_da_d <= stockham_dit_core_inst_yt_rsc_0_5_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_5_i_qa_d <= yt_rsc_0_5_i_qa_d;
  yt_rsc_0_5_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_5_i_wea_d;
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_6_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_6_i_adra_d;
  yt_rsc_0_6_i_da_d <= stockham_dit_core_inst_yt_rsc_0_6_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_6_i_qa_d <= yt_rsc_0_6_i_qa_d;
  yt_rsc_0_6_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_6_i_wea_d;
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  yt_rsc_0_7_i_adra_d <= stockham_dit_core_inst_yt_rsc_0_7_i_adra_d;
  yt_rsc_0_7_i_da_d <= stockham_dit_core_inst_yt_rsc_0_7_i_da_d;
  stockham_dit_core_inst_yt_rsc_0_7_i_qa_d <= yt_rsc_0_7_i_qa_d;
  yt_rsc_0_7_i_wea_d <= stockham_dit_core_inst_yt_rsc_0_7_i_wea_d;
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_0_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_0_i_adra_d;
  xt_rsc_0_0_i_da_d <= stockham_dit_core_inst_xt_rsc_0_0_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_0_i_qa_d <= xt_rsc_0_0_i_qa_d;
  xt_rsc_0_0_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_0_i_wea_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_1_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_1_i_adra_d;
  xt_rsc_0_1_i_da_d <= stockham_dit_core_inst_xt_rsc_0_1_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_1_i_qa_d <= xt_rsc_0_1_i_qa_d;
  xt_rsc_0_1_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_1_i_wea_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_2_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_2_i_adra_d;
  xt_rsc_0_2_i_da_d <= stockham_dit_core_inst_xt_rsc_0_2_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_2_i_qa_d <= xt_rsc_0_2_i_qa_d;
  xt_rsc_0_2_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_2_i_wea_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_3_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_3_i_adra_d;
  xt_rsc_0_3_i_da_d <= stockham_dit_core_inst_xt_rsc_0_3_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_3_i_qa_d <= xt_rsc_0_3_i_qa_d;
  xt_rsc_0_3_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_3_i_wea_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_4_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_4_i_adra_d;
  xt_rsc_0_4_i_da_d <= stockham_dit_core_inst_xt_rsc_0_4_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_4_i_qa_d <= xt_rsc_0_4_i_qa_d;
  xt_rsc_0_4_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_4_i_wea_d;
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_5_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_5_i_adra_d;
  xt_rsc_0_5_i_da_d <= stockham_dit_core_inst_xt_rsc_0_5_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_5_i_qa_d <= xt_rsc_0_5_i_qa_d;
  xt_rsc_0_5_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_5_i_wea_d;
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_6_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_6_i_adra_d;
  xt_rsc_0_6_i_da_d <= stockham_dit_core_inst_xt_rsc_0_6_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_6_i_qa_d <= xt_rsc_0_6_i_qa_d;
  xt_rsc_0_6_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_6_i_wea_d;
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  xt_rsc_0_7_i_adra_d <= stockham_dit_core_inst_xt_rsc_0_7_i_adra_d;
  xt_rsc_0_7_i_da_d <= stockham_dit_core_inst_xt_rsc_0_7_i_da_d;
  stockham_dit_core_inst_xt_rsc_0_7_i_qa_d <= xt_rsc_0_7_i_qa_d;
  xt_rsc_0_7_i_wea_d <= stockham_dit_core_inst_xt_rsc_0_7_i_wea_d;
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  mult_z_mul_cmp_a <= stockham_dit_core_inst_mult_z_mul_cmp_a;
  mult_z_mul_cmp_b <= stockham_dit_core_inst_mult_z_mul_cmp_b;
  stockham_dit_core_inst_mult_z_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_z_mul_cmp_a) * UNSIGNED(mult_z_mul_cmp_b)), 32));
  twiddle_rsci_radr_d_iff <= stockham_dit_core_inst_twiddle_rsci_radr_d_pff;

END v13;



