
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
--  Generated date: Wed Sep 15 23:44:08 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
    IS
  PORT(
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
    IS
  PORT(
    clkb_en : OUT STD_LOGIC;
    clka_en : OUT STD_LOGIC;
    qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    web : OUT STD_LOGIC;
    db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    wea : OUT STD_LOGIC;
    da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
    clka : IN STD_LOGIC;
    clka_en_d : IN STD_LOGIC;
    clkb_en_d : IN STD_LOGIC;
    da_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    qa_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    wea_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_RMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    rwA_rw_ram_ir_internal_WMASK_B_d : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
    IS
  -- Default Constants

BEGIN
  clkb_en <= clkb_en_d;
  clka_en <= clka_en_d;
  qa_d(63 DOWNTO 32) <= qb;
  web <= (rwA_rw_ram_ir_internal_WMASK_B_d(1));
  db <= (da_d(63 DOWNTO 32));
  adrb <= (adra_d(21 DOWNTO 11));
  qa_d(31 DOWNTO 0) <= qa;
  wea <= (rwA_rw_ram_ir_internal_WMASK_B_d(0));
  da <= (da_d(31 DOWNTO 0));
  adra <= (adra_d(10 DOWNTO 0));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen;

ARCHITECTURE v18 OF stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
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

ARCHITECTURE v18 OF stockham_dit_core_core_fsm IS
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

END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
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
    mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_cgo : IN STD_LOGIC;
    yt_rsc_0_1_cgo : IN STD_LOGIC;
    yt_rsc_0_2_cgo : IN STD_LOGIC;
    yt_rsc_0_3_cgo : IN STD_LOGIC;
    yt_rsc_0_4_cgo : IN STD_LOGIC;
    yt_rsc_0_5_cgo : IN STD_LOGIC;
    yt_rsc_0_6_cgo : IN STD_LOGIC;
    yt_rsc_0_7_cgo : IN STD_LOGIC;
    mult_t_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END stockham_dit_core_wait_dp;

ARCHITECTURE v18 OF stockham_dit_core_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL mult_t_mul_cmp_z_oreg_pconst_63_32 : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
  yt_rsc_0_0_i_clka_en_d <= yt_rsc_0_0_cgo OR yt_rsc_0_0_cgo_iro;
  yt_rsc_0_1_i_clka_en_d <= yt_rsc_0_1_cgo OR yt_rsc_0_1_cgo_iro;
  yt_rsc_0_2_i_clka_en_d <= yt_rsc_0_2_cgo OR yt_rsc_0_2_cgo_iro;
  yt_rsc_0_3_i_clka_en_d <= yt_rsc_0_3_cgo OR yt_rsc_0_3_cgo_iro;
  yt_rsc_0_4_i_clka_en_d <= yt_rsc_0_4_cgo OR yt_rsc_0_4_cgo_iro;
  yt_rsc_0_5_i_clka_en_d <= yt_rsc_0_5_cgo OR yt_rsc_0_5_cgo_iro;
  yt_rsc_0_6_i_clka_en_d <= yt_rsc_0_6_cgo OR yt_rsc_0_6_cgo_iro;
  yt_rsc_0_7_i_clka_en_d <= yt_rsc_0_7_cgo OR yt_rsc_0_7_cgo_iro;
  mult_t_mul_cmp_z_oreg <= mult_t_mul_cmp_z_oreg_pconst_63_32;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_t_mul_cmp_z_oreg_pconst_63_32 <= mult_t_mul_cmp_z(63 DOWNTO 32);
    END IF;
  END PROCESS;
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
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
    yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
    yt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
    xt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
        0);
    mult_t_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_t_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
  );
END stockham_dit_core;

ARCHITECTURE v18 OF stockham_dit_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL mult_t_mul_cmp_a_drv : STD_LOGIC_VECTOR (31 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_z_oreg : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_acc_tmp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL for_for_a_acc_tmp : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL operator_32_false_acc_tmp : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_3 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_9 : STD_LOGIC;
  SIGNAL not_tmp_21 : STD_LOGIC;
  SIGNAL mux_tmp_1 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL mux_tmp_2 : STD_LOGIC;
  SIGNAL or_dcpl_13 : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_61 : STD_LOGIC;
  SIGNAL or_dcpl_16 : STD_LOGIC;
  SIGNAL or_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL or_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL nor_tmp_1 : STD_LOGIC;
  SIGNAL or_tmp_18 : STD_LOGIC;
  SIGNAL nor_tmp_3 : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL mux_tmp_5 : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL or_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL or_dcpl_27 : STD_LOGIC;
  SIGNAL or_tmp_28 : STD_LOGIC;
  SIGNAL mux_tmp_9 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL mux_tmp_10 : STD_LOGIC;
  SIGNAL or_dcpl_30 : STD_LOGIC;
  SIGNAL or_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL or_dcpl_33 : STD_LOGIC;
  SIGNAL or_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL or_dcpl_36 : STD_LOGIC;
  SIGNAL or_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_13 : STD_LOGIC;
  SIGNAL mux_tmp_14 : STD_LOGIC;
  SIGNAL and_tmp_5 : STD_LOGIC;
  SIGNAL or_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL or_tmp_43 : STD_LOGIC;
  SIGNAL mux_tmp_18 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL or_tmp_49 : STD_LOGIC;
  SIGNAL mux_tmp_20 : STD_LOGIC;
  SIGNAL or_dcpl_45 : STD_LOGIC;
  SIGNAL or_dcpl_46 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_124 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL or_dcpl_48 : STD_LOGIC;
  SIGNAL or_dcpl_49 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL or_tmp_53 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL or_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_25 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL or_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL or_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL or_tmp_64 : STD_LOGIC;
  SIGNAL mux_tmp_30 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL or_tmp_68 : STD_LOGIC;
  SIGNAL mux_tmp_32 : STD_LOGIC;
  SIGNAL or_dcpl_60 : STD_LOGIC;
  SIGNAL or_dcpl_61 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL or_dcpl_63 : STD_LOGIC;
  SIGNAL or_dcpl_64 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL or_dcpl_66 : STD_LOGIC;
  SIGNAL nor_tmp_23 : STD_LOGIC;
  SIGNAL mux_tmp_35 : STD_LOGIC;
  SIGNAL mux_tmp_36 : STD_LOGIC;
  SIGNAL or_dcpl_69 : STD_LOGIC;
  SIGNAL or_dcpl_70 : STD_LOGIC;
  SIGNAL or_dcpl_71 : STD_LOGIC;
  SIGNAL and_dcpl_169 : STD_LOGIC;
  SIGNAL or_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_172 : STD_LOGIC;
  SIGNAL and_dcpl_174 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL or_dcpl_76 : STD_LOGIC;
  SIGNAL or_dcpl_77 : STD_LOGIC;
  SIGNAL or_dcpl_78 : STD_LOGIC;
  SIGNAL or_tmp_75 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_189 : STD_LOGIC;
  SIGNAL or_dcpl_81 : STD_LOGIC;
  SIGNAL or_dcpl_82 : STD_LOGIC;
  SIGNAL or_tmp_78 : STD_LOGIC;
  SIGNAL or_dcpl_84 : STD_LOGIC;
  SIGNAL or_dcpl_87 : STD_LOGIC;
  SIGNAL or_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL or_dcpl_92 : STD_LOGIC;
  SIGNAL or_dcpl_96 : STD_LOGIC;
  SIGNAL or_dcpl_97 : STD_LOGIC;
  SIGNAL and_dcpl_216 : STD_LOGIC;
  SIGNAL or_dcpl_101 : STD_LOGIC;
  SIGNAL or_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL or_dcpl_109 : STD_LOGIC;
  SIGNAL y_3_sva : STD_LOGIC;
  SIGNAL for_for_b_nor_2_cse_1 : STD_LOGIC;
  SIGNAL for_for_b_nor_1_cse_1 : STD_LOGIC;
  SIGNAL for_for_b_nor_cse_1 : STD_LOGIC;
  SIGNAL for_for_t_13_0_sva_12_0 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL for_for_a_lpi_3_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_lpi_3_dfm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_mul_itm : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL operator_34_true_1_and_psp_sva_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL operator_34_true_and_psp_sva_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL for_for_a_nor_2_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_nor_1_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_nor_cse_1 : STD_LOGIC;
  SIGNAL for_for_a_asn_itm : STD_LOGIC;
  SIGNAL for_for_stage_0_1 : STD_LOGIC;
  SIGNAL for_for_stage_0 : STD_LOGIC;
  SIGNAL for_for_a_asn_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_conc_2_itm_1_0 : STD_LOGIC;
  SIGNAL for_for_a_conc_2_itm_1_2_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
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
  SIGNAL for_for_a_asn_itm_2 : STD_LOGIC;
  SIGNAL for_for_a_conc_2_itm_2_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_asn_5_itm_2 : STD_LOGIC;
  SIGNAL for_for_asn_itm_2 : STD_LOGIC;
  SIGNAL for_for_stage_0_3 : STD_LOGIC;
  SIGNAL operator_34_true_1_and_psp_sva_0 : STD_LOGIC;
  SIGNAL x_3_sva : STD_LOGIC;
  SIGNAL for_for_asn_5_itm : STD_LOGIC;
  SIGNAL for_for_asn_itm : STD_LOGIC;
  SIGNAL modulo_sub_base_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_base_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL reg_for_for_acc_tdx_1_13_0_ftd : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL reg_for_for_acc_tdx_1_13_0_ftd_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL or_407_ssc : STD_LOGIC;
  SIGNAL or_397_ssc : STD_LOGIC;
  SIGNAL or_387_ssc : STD_LOGIC;
  SIGNAL or_377_ssc : STD_LOGIC;
  SIGNAL or_367_ssc : STD_LOGIC;
  SIGNAL or_357_ssc : STD_LOGIC;
  SIGNAL or_347_ssc : STD_LOGIC;
  SIGNAL or_328_ssc : STD_LOGIC;
  SIGNAL or_317_ssc : STD_LOGIC;
  SIGNAL or_306_ssc : STD_LOGIC;
  SIGNAL or_295_ssc : STD_LOGIC;
  SIGNAL or_284_ssc : STD_LOGIC;
  SIGNAL or_273_ssc : STD_LOGIC;
  SIGNAL or_262_ssc : STD_LOGIC;
  SIGNAL or_251_ssc : STD_LOGIC;
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
  SIGNAL for_for_mux_18_cse : STD_LOGIC;
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
  SIGNAL nor_29_cse : STD_LOGIC;
  SIGNAL or_179_cse : STD_LOGIC;
  SIGNAL and_979_cse : STD_LOGIC;
  SIGNAL or_159_cse : STD_LOGIC;
  SIGNAL nand_7_cse : STD_LOGIC;
  SIGNAL or_248_rmff : STD_LOGIC;
  SIGNAL modulo_sub_qelse_mux_rmff : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL modulo_add_qelse_mux_rmff : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_for_for_b_nor_14_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_30_rmff : STD_LOGIC;
  SIGNAL or_259_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_13_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_31_rmff : STD_LOGIC;
  SIGNAL or_270_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_12_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_32_rmff : STD_LOGIC;
  SIGNAL or_281_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_11_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_33_rmff : STD_LOGIC;
  SIGNAL or_292_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_10_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_34_rmff : STD_LOGIC;
  SIGNAL or_303_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_9_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_35_rmff : STD_LOGIC;
  SIGNAL or_314_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_8_rmff : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_36_rmff : STD_LOGIC;
  SIGNAL or_325_rmff : STD_LOGIC;
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
  SIGNAL for_for_acc_tdx_1_13_0_sva_2_13_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_acc_tdx_13_0_sva_2_13_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_1_12_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL shift_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_w_lshift_itm : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL for_for_w_rshift_itm : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL nn_7_sva : STD_LOGIC;
  SIGNAL nn_8_sva : STD_LOGIC;
  SIGNAL nn_6_sva : STD_LOGIC;
  SIGNAL nn_9_sva : STD_LOGIC;
  SIGNAL nn_5_sva : STD_LOGIC;
  SIGNAL nn_10_sva : STD_LOGIC;
  SIGNAL nn_4_sva : STD_LOGIC;
  SIGNAL nn_11_sva : STD_LOGIC;
  SIGNAL nn_3_sva : STD_LOGIC;
  SIGNAL nn_12_sva : STD_LOGIC;
  SIGNAL nn_2_sva : STD_LOGIC;
  SIGNAL nn_13_sva : STD_LOGIC;
  SIGNAL nn_1_sva : STD_LOGIC;
  SIGNAL nn_14_sva : STD_LOGIC;
  SIGNAL idx_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL tmp_2_sva_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  SIGNAL for_for_w_asn_2_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_z_mul_itm : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL tmp_sva_7_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_6_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_5_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_4_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_3_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_2_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_sva_1_2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_7_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_6_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_5_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_4_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_3_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_2_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL tmp_2_sva_1_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_a_for_for_a_nor_itm_1 : STD_LOGIC;
  SIGNAL for_for_a_for_for_a_nor_itm_2 : STD_LOGIC;
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
  SIGNAL mult_z_mul_itm_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_asn_itm_1 : STD_LOGIC;
  SIGNAL for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_asn_5_itm_1 : STD_LOGIC;
  SIGNAL for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1 : STD_LOGIC_VECTOR (2 DOWNTO
      0);
  SIGNAL for_for_acc_tdx_13_0_sva_1_13_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_acc_tdx_1_13_0_sva_1_13_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL idx_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d_mx0c0 : STD_LOGIC;
  SIGNAL for_for_acc_tdx_13_0_sva_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL for_for_acc_tdx_1_13_0_sva_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL reg_s_13_0_ftd : STD_LOGIC;
  SIGNAL reg_s_13_0_ftd_1 : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL for_for_a_or_2_cse : STD_LOGIC;
  SIGNAL or_cse : STD_LOGIC;
  SIGNAL for_for_acc_tdx_13_0_sva_13_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_acc_tdx_13_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_12_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_a_acc_psp_sva_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_cse : STD_LOGIC;
  SIGNAL z_out_32 : STD_LOGIC;

  SIGNAL idx_not_1_nl : STD_LOGIC;
  SIGNAL y_not_35_nl : STD_LOGIC;
  SIGNAL operator_32_false_2_acc_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL and_68_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL nor_36_nl : STD_LOGIC;
  SIGNAL or_43_nl : STD_LOGIC;
  SIGNAL mux_21_nl : STD_LOGIC;
  SIGNAL and_109_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL mux_25_nl : STD_LOGIC;
  SIGNAL and_983_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL and_141_nl : STD_LOGIC;
  SIGNAL mux_31_nl : STD_LOGIC;
  SIGNAL nor_35_nl : STD_LOGIC;
  SIGNAL or_91_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL mux_37_nl : STD_LOGIC;
  SIGNAL nor_34_nl : STD_LOGIC;
  SIGNAL or_109_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL and_173_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL and_982_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL or_141_nl : STD_LOGIC;
  SIGNAL for_for_b_and_1_nl : STD_LOGIC;
  SIGNAL for_for_a_mux1h_30_nl : STD_LOGIC;
  SIGNAL for_for_mux1h_28_nl : STD_LOGIC;
  SIGNAL for_for_mux1h_30_nl : STD_LOGIC;
  SIGNAL nn_mux_nl : STD_LOGIC;
  SIGNAL for_for_a_and_1_nl : STD_LOGIC;
  SIGNAL for_for_b_acc_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL or_19_nl : STD_LOGIC;
  SIGNAL or_28_nl : STD_LOGIC;
  SIGNAL or_26_nl : STD_LOGIC;
  SIGNAL nor_39_nl : STD_LOGIC;
  SIGNAL or_47_nl : STD_LOGIC;
  SIGNAL or_45_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL or_55_nl : STD_LOGIC;
  SIGNAL or_63_nl : STD_LOGIC;
  SIGNAL or_61_nl : STD_LOGIC;
  SIGNAL mux_22_nl : STD_LOGIC;
  SIGNAL nor_43_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL nand_10_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL or_88_nl : STD_LOGIC;
  SIGNAL mux_29_nl : STD_LOGIC;
  SIGNAL or_92_nl : STD_LOGIC;
  SIGNAL nor_38_nl : STD_LOGIC;
  SIGNAL mux_34_nl : STD_LOGIC;
  SIGNAL or_111_nl : STD_LOGIC;
  SIGNAL nor_37_nl : STD_LOGIC;
  SIGNAL or_110_nl : STD_LOGIC;
  SIGNAL mux_39_nl : STD_LOGIC;
  SIGNAL or_121_nl : STD_LOGIC;
  SIGNAL mux_41_nl : STD_LOGIC;
  SIGNAL or_138_nl : STD_LOGIC;
  SIGNAL and_984_nl : STD_LOGIC;
  SIGNAL and_985_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL and_200_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL and_214_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL and_223_nl : STD_LOGIC;
  SIGNAL mux_51_nl : STD_LOGIC;
  SIGNAL and_231_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL and_238_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL and_246_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL and_253_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL and_261_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_1_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_44_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_29_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_45_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_3_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_2_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_45_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_28_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_46_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_5_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_4_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_46_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_27_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_47_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_7_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_6_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_47_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_26_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_48_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_9_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_8_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_48_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_25_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_49_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_11_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_49_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_24_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_50_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_13_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_12_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_50_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_23_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_51_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_15_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_14_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_51_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_22_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_52_nl : STD_LOGIC;
  SIGNAL for_for_a_mux1h_114_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL and_554_nl : STD_LOGIC;
  SIGNAL or_344_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_17_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_16_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_52_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_21_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_53_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_19_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_18_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_53_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_20_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_54_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_21_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_20_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_54_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_19_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_55_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_23_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_22_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_55_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_18_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_56_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_25_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_24_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_56_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_17_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_57_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_27_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_26_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_57_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_16_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_58_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_mux_29_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_for_for_b_mux_28_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL for_for_b_or_58_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_15_nl : STD_LOGIC;
  SIGNAL for_for_b_for_for_b_for_for_b_nor_59_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL mult_if_mux_5_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_mux_6_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_if_mux_7_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_if_or_1_nl : STD_LOGIC;
  SIGNAL mult_if_mux_8_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL mult_res_mux_3_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_res_mux_4_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_mux_22_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_mux_23_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL for_for_mux_24_nl : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL for_for_w_rshift_rg_a : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL for_for_w_rshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_w_rshift_rg_z : STD_LOGIC_VECTOR (12 DOWNTO 0);

  SIGNAL for_for_w_lshift_rg_a : STD_LOGIC_VECTOR (12 DOWNTO 0);
  SIGNAL for_for_w_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL for_for_w_lshift_rg_z : STD_LOGIC_VECTOR (13 DOWNTO 0);

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
      mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_cgo : IN STD_LOGIC;
      yt_rsc_0_1_cgo : IN STD_LOGIC;
      yt_rsc_0_2_cgo : IN STD_LOGIC;
      yt_rsc_0_3_cgo : IN STD_LOGIC;
      yt_rsc_0_4_cgo : IN STD_LOGIC;
      yt_rsc_0_5_cgo : IN STD_LOGIC;
      yt_rsc_0_6_cgo : IN STD_LOGIC;
      yt_rsc_0_7_cgo : IN STD_LOGIC;
      mult_t_mul_cmp_z_oreg : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z_oreg : STD_LOGIC_VECTOR
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

  FUNCTION MUX1HOT_v_32_16_2(input_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(15 DOWNTO 0))
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
  for_for_w_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 13,
      signd_a => 0,
      width_s => 4,
      width_z => 13
      )
    PORT MAP(
      a => for_for_w_rshift_rg_a,
      s => for_for_w_rshift_rg_s,
      z => for_for_w_rshift_rg_z
    );
  for_for_w_rshift_rg_a <= operator_34_true_and_psp_sva_1;
  for_for_w_rshift_rg_s <= shift_3_0_sva;
  for_for_w_rshift_itm <= for_for_w_rshift_rg_z;

  for_for_w_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 13,
      signd_a => 0,
      width_s => 4,
      width_z => 14
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
      yt_rsc_0_0_cgo_iro => or_248_rmff,
      yt_rsc_0_0_i_clka_en_d => yt_rsc_0_0_i_clka_en_d,
      yt_rsc_0_1_cgo_iro => or_259_rmff,
      yt_rsc_0_1_i_clka_en_d => yt_rsc_0_1_i_clka_en_d,
      yt_rsc_0_2_cgo_iro => or_270_rmff,
      yt_rsc_0_2_i_clka_en_d => yt_rsc_0_2_i_clka_en_d,
      yt_rsc_0_3_cgo_iro => or_281_rmff,
      yt_rsc_0_3_i_clka_en_d => yt_rsc_0_3_i_clka_en_d,
      yt_rsc_0_4_cgo_iro => or_292_rmff,
      yt_rsc_0_4_i_clka_en_d => yt_rsc_0_4_i_clka_en_d,
      yt_rsc_0_5_cgo_iro => or_303_rmff,
      yt_rsc_0_5_i_clka_en_d => yt_rsc_0_5_i_clka_en_d,
      yt_rsc_0_6_cgo_iro => or_314_rmff,
      yt_rsc_0_6_i_clka_en_d => yt_rsc_0_6_i_clka_en_d,
      yt_rsc_0_7_cgo_iro => or_325_rmff,
      yt_rsc_0_7_i_clka_en_d => yt_rsc_0_7_i_clka_en_d,
      mult_t_mul_cmp_z => stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z,
      yt_rsc_0_0_cgo => reg_yt_rsc_0_0_cgo_cse,
      yt_rsc_0_1_cgo => reg_yt_rsc_0_1_cgo_cse,
      yt_rsc_0_2_cgo => reg_yt_rsc_0_2_cgo_cse,
      yt_rsc_0_3_cgo => reg_yt_rsc_0_3_cgo_cse,
      yt_rsc_0_4_cgo => reg_yt_rsc_0_4_cgo_cse,
      yt_rsc_0_5_cgo => reg_yt_rsc_0_5_cgo_cse,
      yt_rsc_0_6_cgo => reg_yt_rsc_0_6_cgo_cse,
      yt_rsc_0_7_cgo => reg_yt_rsc_0_7_cgo_cse,
      mult_t_mul_cmp_z_oreg => stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z_oreg
    );
  stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z <= mult_t_mul_cmp_z;
  mult_t_mul_cmp_z_oreg <= stockham_dit_core_wait_dp_inst_mult_t_mul_cmp_z_oreg;

  stockham_dit_core_core_fsm_inst : stockham_dit_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => stockham_dit_core_core_fsm_inst_fsm_output,
      for_for_C_2_tr0 => stockham_dit_core_core_fsm_inst_for_for_C_2_tr0,
      for_C_0_tr0 => stockham_dit_core_core_fsm_inst_for_C_0_tr0
    );
  fsm_output <= stockham_dit_core_core_fsm_inst_fsm_output;
  stockham_dit_core_core_fsm_inst_for_for_C_2_tr0 <= NOT(for_for_stage_0_2 OR for_for_stage_0
      OR for_for_stage_0_1);
  stockham_dit_core_core_fsm_inst_for_C_0_tr0 <= NOT (z_out_4(3));

  y_or_cse <= (fsm_output(0)) OR (fsm_output(4));
  for_for_a_or_2_cse <= NOT((y_3_sva AND (fsm_output(1))) OR (fsm_output(2)));
  for_for_mux_18_cse <= for_for_stage_0 OR y_or_cse;
  and_cse <= for_for_stage_0_1 AND (fsm_output(1));
  or_cse <= (fsm_output(5)) OR (fsm_output(0));
  for_for_or_cse <= (fsm_output(3)) OR y_or_cse;
  and_68_nl <= (CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1/=STD_LOGIC_VECTOR'("000")))
      AND (operator_34_true_1_and_psp_sva_0 OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("00")))
      AND mux_tmp_2;
  mux_13_nl <= MUX_s_1_2_2(mux_tmp_2, and_68_nl, and_dcpl_32);
  or_248_rmff <= ((NOT mux_tmp_1) AND for_for_stage_0_3 AND (fsm_output(3))) OR (((or_dcpl_11
      AND for_for_a_nor_cse_1) OR and_dcpl_49) AND and_dcpl_32 AND (fsm_output(1)))
      OR ((NOT mux_13_nl) AND (fsm_output(2)));
  for_for_b_or_42_seb <= (NOT (fsm_output(1))) OR (or_dcpl_18 AND or_dcpl_14) OR
      or_dcpl_16;
  nor_36_nl <= NOT((reg_for_for_acc_tdx_1_13_0_ftd_1(0)) OR (NOT and_tmp_2));
  or_43_nl <= CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  mux_16_nl <= MUX_s_1_2_2(nor_36_nl, and_tmp_2, or_43_nl);
  mux_17_nl <= MUX_s_1_2_2(mux_tmp_5, mux_16_nl, and_dcpl_32);
  or_259_rmff <= ((NOT mux_tmp_4) AND for_for_stage_0_3 AND (fsm_output(3))) OR (((and_dcpl_64
      AND for_for_a_nor_cse_1) OR (for_for_b_nor_cse_1 AND (for_for_b_for_for_b_acc_tmp(0))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_17_nl) AND (fsm_output(2)));
  for_for_b_or_40_seb <= (NOT (fsm_output(1))) OR and_dcpl_81 OR or_dcpl_16;
  and_109_nl <= (CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1/=STD_LOGIC_VECTOR'("010")))
      AND (operator_34_true_1_and_psp_sva_0 OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("01")))
      AND mux_tmp_10;
  mux_21_nl <= MUX_s_1_2_2(mux_tmp_10, and_109_nl, and_dcpl_32);
  or_270_rmff <= ((NOT mux_tmp_9) AND for_for_stage_0_3 AND (fsm_output(3))) OR (((or_dcpl_11
      AND and_dcpl_88) OR (and_dcpl_86 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_21_nl) AND (fsm_output(2)));
  for_for_b_or_38_seb <= (NOT (fsm_output(1))) OR and_dcpl_98 OR or_dcpl_16;
  and_983_nl <= (NOT(CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))))
      AND and_tmp_5;
  mux_25_nl <= MUX_s_1_2_2(and_983_nl, and_tmp_5, reg_for_for_acc_tdx_1_13_0_ftd_1(2));
  mux_26_nl <= MUX_s_1_2_2(mux_tmp_14, mux_25_nl, and_dcpl_32);
  or_281_rmff <= ((NOT mux_tmp_13) AND for_for_stage_0_3 AND (fsm_output(3))) OR
      (((and_dcpl_64 AND and_dcpl_88) OR (and_dcpl_86 AND (for_for_b_for_for_b_acc_tmp(0))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_26_nl) AND (fsm_output(2)));
  for_for_b_or_36_seb <= (NOT (fsm_output(1))) OR and_dcpl_111 OR or_dcpl_16;
  nor_35_nl <= NOT((for_for_a_acc_psp_sva_1_0(1)) OR (NOT mux_tmp_20));
  or_91_nl <= operator_34_true_1_and_psp_sva_0 OR (for_for_a_acc_psp_sva_1_0(0));
  mux_31_nl <= MUX_s_1_2_2(nor_35_nl, mux_tmp_20, or_91_nl);
  and_141_nl <= (CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1/=STD_LOGIC_VECTOR'("100")))
      AND mux_31_nl;
  mux_32_nl <= MUX_s_1_2_2(mux_tmp_20, and_141_nl, and_dcpl_32);
  or_292_rmff <= ((NOT mux_tmp_18) AND for_for_stage_0_3 AND (fsm_output(3))) OR
      (((or_dcpl_11 AND and_dcpl_118) OR (and_dcpl_116 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_32_nl) AND (fsm_output(2)));
  for_for_b_or_34_seb <= (NOT (fsm_output(1))) OR and_dcpl_128 OR or_dcpl_16;
  nor_34_nl <= NOT((reg_for_for_acc_tdx_1_13_0_ftd_1(0)) OR (NOT mux_tmp_26));
  or_109_nl <= CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  mux_37_nl <= MUX_s_1_2_2(nor_34_nl, mux_tmp_26, or_109_nl);
  mux_38_nl <= MUX_s_1_2_2(mux_tmp_25, mux_37_nl, and_dcpl_32);
  or_303_rmff <= ((NOT mux_tmp_23) AND for_for_stage_0_3 AND (fsm_output(3))) OR
      (((and_dcpl_64 AND and_dcpl_118) OR (and_dcpl_116 AND (for_for_b_for_for_b_acc_tmp(0))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_38_nl) AND (fsm_output(2)));
  for_for_b_or_32_seb <= (NOT (fsm_output(1))) OR and_dcpl_142 OR or_dcpl_16;
  and_982_nl <= (NOT(CONV_SL_1_1(for_for_a_acc_psp_sva_1_0=STD_LOGIC_VECTOR'("11"))))
      AND mux_tmp_32;
  mux_43_nl <= MUX_s_1_2_2(and_982_nl, mux_tmp_32, operator_34_true_1_and_psp_sva_0);
  and_173_nl <= (CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1/=STD_LOGIC_VECTOR'("110")))
      AND mux_43_nl;
  mux_44_nl <= MUX_s_1_2_2(mux_tmp_32, and_173_nl, and_dcpl_32);
  or_314_rmff <= ((NOT mux_tmp_30) AND for_for_stage_0_3 AND (fsm_output(3))) OR
      (((or_dcpl_11 AND and_dcpl_149) OR (and_dcpl_147 AND (NOT (for_for_b_for_for_b_acc_tmp(0)))))
      AND and_dcpl_32 AND (fsm_output(1))) OR ((NOT mux_44_nl) AND (fsm_output(2)));
  for_for_b_or_30_seb <= (NOT (fsm_output(1))) OR and_dcpl_159 OR or_dcpl_16;
  or_141_nl <= (CONV_SL_1_1(reg_for_for_acc_tdx_1_13_0_ftd_1=STD_LOGIC_VECTOR'("111")))
      OR (operator_34_true_1_and_psp_sva_0 AND CONV_SL_1_1(for_for_a_acc_psp_sva_1_0=STD_LOGIC_VECTOR'("11")))
      OR mux_tmp_36;
  mux_47_nl <= MUX_s_1_2_2(mux_tmp_36, or_141_nl, and_dcpl_32);
  or_325_rmff <= (mux_tmp_35 AND for_for_stage_0_3 AND (fsm_output(3))) OR (((and_dcpl_64
      AND and_dcpl_149) OR (and_dcpl_147 AND (for_for_b_for_for_b_acc_tmp(0)))) AND
      and_dcpl_32 AND (fsm_output(1))) OR (mux_47_nl AND (fsm_output(2)));
  for_for_b_or_28_seb <= (NOT (fsm_output(1))) OR and_dcpl_172 OR or_dcpl_16;
  for_for_b_or_26_seb <= (NOT (fsm_output(1))) OR and_dcpl_81 OR or_dcpl_84;
  for_for_b_or_24_seb <= (NOT (fsm_output(1))) OR and_dcpl_98 OR or_dcpl_84;
  for_for_b_or_22_seb <= (NOT (fsm_output(1))) OR and_dcpl_111 OR or_dcpl_84;
  for_for_b_or_20_seb <= (NOT (fsm_output(1))) OR and_dcpl_128 OR or_dcpl_84;
  for_for_b_or_18_seb <= (NOT (fsm_output(1))) OR and_dcpl_142 OR or_dcpl_84;
  for_for_b_or_16_seb <= (NOT (fsm_output(1))) OR and_dcpl_159 OR or_dcpl_84;
  for_for_b_or_14_seb <= (NOT (fsm_output(1))) OR and_dcpl_172 OR or_dcpl_84;
  idx_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(idx_3_0_sva) + UNSIGNED'(
      "0001"), 4));
  for_for_a_and_1_nl <= for_for_a_for_for_a_nor_1_itm_2 AND y_3_sva;
  for_for_a_lpi_3_dfm_1 <= MUX1HOT_v_32_16_2((xt_rsc_0_0_i_qa_d(31 DOWNTO 0)), tmp_2_sva_1,
      tmp_2_sva_2, tmp_2_sva_3, tmp_2_sva_4, tmp_2_sva_5, tmp_2_sva_6, tmp_2_sva_7,
      tmp_sva_7, tmp_sva, tmp_sva_1, tmp_sva_2, tmp_sva_3, tmp_sva_4, tmp_sva_5,
      tmp_sva_6, STD_LOGIC_VECTOR'( for_for_a_for_for_a_nor_itm_2 & for_for_a_for_for_a_and_itm_2
      & for_for_a_for_for_a_and_1_itm_2 & for_for_a_for_for_a_and_2_itm_2 & for_for_a_for_for_a_and_3_itm_2
      & for_for_a_for_for_a_and_4_itm_2 & for_for_a_for_for_a_and_5_itm_2 & for_for_a_for_for_a_and_6_itm_2
      & for_for_a_and_1_nl & for_for_a_for_for_a_and_7_itm_2 & for_for_a_for_for_a_and_8_itm_2
      & for_for_a_for_for_a_and_9_itm_2 & for_for_a_for_for_a_and_10_itm_2 & for_for_a_for_for_a_and_11_itm_2
      & for_for_a_for_for_a_and_12_itm_2 & for_for_a_for_for_a_and_13_itm_2));
  for_for_a_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1(12
      DOWNTO 1)), 12), 13) + UNSIGNED(operator_34_true_and_psp_sva_1), 13));
  operator_34_true_1_and_psp_sva_1 <= operator_32_false_acc_tmp AND for_for_t_13_0_sva_12_0;
  for_for_b_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_s_13_0_ftd & reg_s_13_0_ftd_1)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1), 13),
      14), 14));
  for_for_b_for_for_b_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(for_for_b_acc_nl),
      14) + UNSIGNED(operator_34_true_and_psp_sva_1 & '0'), 14));
  for_for_b_nor_2_cse_1 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  for_for_b_nor_1_cse_1 <= NOT((for_for_b_for_for_b_acc_tmp(2)) OR (for_for_b_for_for_b_acc_tmp(0)));
  for_for_b_nor_cse_1 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  operator_34_true_and_psp_sva_1 <= (NOT operator_32_false_acc_tmp) AND for_for_t_13_0_sva_12_0;
  operator_32_false_acc_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_s_13_0_ftd_1)
      + SIGNED'( "1111111111111"), 13));
  for_for_acc_tdx_13_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_1_and_psp_sva_1),
      13), 14) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(operator_34_true_and_psp_sva_1),
      13), 14), 14));
  for_for_a_nor_2_cse_1 <= NOT((for_for_a_acc_tmp(0)) OR (operator_34_true_1_and_psp_sva_1(0)));
  for_for_a_nor_1_cse_1 <= NOT((for_for_a_acc_tmp(1)) OR (operator_34_true_1_and_psp_sva_1(0)));
  for_for_a_nor_cse_1 <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  for_for_acc_tdx_1_13_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_for_acc_tdx_13_0_sva_13_3
      & for_for_acc_tdx_13_0_sva_2_0) + UNSIGNED(for_for_mul_itm), 14));
  and_dcpl_32 <= for_for_stage_0_1 AND y_3_sva;
  or_dcpl_3 <= CONV_SL_1_1(fsm_output(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_tmp_7 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("000"))
      OR (NOT for_for_asn_5_itm_2);
  or_tmp_9 <= (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0)) OR (NOT for_for_asn_itm_2);
  not_tmp_21 <= NOT(for_for_asn_5_itm_2 OR (NOT or_tmp_9));
  or_19_nl <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("000"));
  mux_10_nl <= MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_19_nl);
  mux_tmp_1 <= MUX_s_1_2_2(mux_10_nl, or_tmp_7, or_159_cse);
  and_dcpl_49 <= for_for_b_nor_cse_1 AND (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_11 <= NOT((operator_32_false_acc_tmp(0)) AND (for_for_t_13_0_sva_12_0(0)));
  or_28_nl <= (NOT for_for_asn_5_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("000"))
      OR (NOT for_for_stage_0_3);
  or_26_nl <= (NOT for_for_asn_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_2 <= MUX_s_1_2_2((NOT for_for_stage_0_3), or_28_nl, or_26_nl);
  or_dcpl_13 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_14 <= or_dcpl_13 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_53 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2
      DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_54 <= for_for_asn_5_itm_2 AND (NOT (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0)));
  and_dcpl_59 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_60 <= (NOT (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0))) AND for_for_stage_0_3;
  and_dcpl_61 <= and_dcpl_60 AND and_dcpl_59;
  or_dcpl_16 <= NOT(for_for_stage_0_1 AND y_3_sva);
  or_dcpl_17 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  and_dcpl_64 <= (operator_32_false_acc_tmp(0)) AND (for_for_t_13_0_sva_12_0(0));
  or_dcpl_18 <= and_dcpl_64 OR or_dcpl_17;
  and_dcpl_67 <= for_for_a_nor_cse_1 AND and_dcpl_32;
  nor_tmp_1 <= (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0)) AND for_for_asn_5_itm_2;
  or_tmp_18 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00")) OR (NOT nor_tmp_1);
  nor_tmp_3 <= (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0)) AND for_for_asn_itm_2;
  nor_39_nl <= NOT((NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("001"))
      OR (NOT for_for_asn_5_itm_2))) OR nor_tmp_3);
  mux_tmp_4 <= MUX_s_1_2_2(nor_39_nl, or_tmp_18, or_159_cse);
  or_47_nl <= (NOT for_for_asn_5_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("001"))
      OR (NOT for_for_stage_0_3);
  or_45_nl <= (NOT for_for_asn_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_5 <= MUX_s_1_2_2((NOT for_for_stage_0_3), or_47_nl, or_45_nl);
  and_tmp_2 <= ((NOT operator_34_true_1_and_psp_sva_0) OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("00")))
      AND mux_tmp_5;
  or_dcpl_23 <= or_dcpl_13 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  and_dcpl_77 <= (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0)) AND for_for_stage_0_3;
  and_dcpl_78 <= and_dcpl_77 AND and_dcpl_59;
  or_dcpl_25 <= or_dcpl_11 OR or_dcpl_17;
  and_dcpl_81 <= or_dcpl_25 AND or_dcpl_23;
  and_dcpl_83 <= or_dcpl_23 AND and_dcpl_64;
  or_dcpl_27 <= NOT(for_for_asn_itm_2 AND (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0)));
  or_tmp_28 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("010"))
      OR (NOT for_for_asn_5_itm_2);
  or_55_nl <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("010"));
  mux_18_nl <= MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_55_nl);
  mux_tmp_9 <= MUX_s_1_2_2(or_tmp_28, mux_18_nl, nor_29_cse);
  and_dcpl_86 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_88 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  or_63_nl <= (NOT for_for_asn_5_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("010"))
      OR (NOT for_for_stage_0_3);
  or_61_nl <= (NOT for_for_asn_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_10 <= MUX_s_1_2_2((NOT for_for_stage_0_3), or_63_nl, or_61_nl);
  or_dcpl_30 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_31 <= or_dcpl_30 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_91 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_94 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_95 <= and_dcpl_60 AND and_dcpl_94;
  or_dcpl_33 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_34 <= and_dcpl_64 OR or_dcpl_33;
  and_dcpl_98 <= or_dcpl_34 AND or_dcpl_31;
  and_dcpl_100 <= and_dcpl_88 AND and_dcpl_32;
  and_dcpl_101 <= or_dcpl_31 AND or_dcpl_11;
  or_dcpl_36 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("01"));
  or_tmp_34 <= (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2)) OR (NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(1
      DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND for_for_asn_5_itm_2));
  nor_43_nl <= NOT((CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("011"))
      AND for_for_asn_5_itm_2) OR nor_tmp_3);
  mux_22_nl <= MUX_s_1_2_2(or_tmp_34, nor_43_nl, for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(1));
  mux_tmp_13 <= MUX_s_1_2_2(mux_22_nl, or_tmp_34, for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2));
  nand_9_nl <= NOT(for_for_asn_5_itm_2 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("011"))
      AND for_for_stage_0_3);
  nand_10_nl <= NOT(for_for_asn_itm_2 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("011")));
  mux_tmp_14 <= MUX_s_1_2_2((NOT for_for_stage_0_3), nand_9_nl, nand_10_nl);
  and_tmp_5 <= ((NOT operator_34_true_1_and_psp_sva_0) OR CONV_SL_1_1(for_for_a_acc_psp_sva_1_0/=STD_LOGIC_VECTOR'("01")))
      AND mux_tmp_14;
  or_dcpl_39 <= or_dcpl_30 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  and_dcpl_108 <= and_dcpl_77 AND and_dcpl_94;
  or_dcpl_41 <= or_dcpl_11 OR or_dcpl_33;
  and_dcpl_111 <= or_dcpl_41 AND or_dcpl_39;
  and_dcpl_113 <= or_dcpl_39 AND and_dcpl_64;
  or_tmp_43 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("100"))
      OR (NOT for_for_asn_5_itm_2);
  or_88_nl <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("100"));
  mux_27_nl <= MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_88_nl);
  mux_tmp_18 <= MUX_s_1_2_2(mux_27_nl, or_tmp_43, or_179_cse);
  and_dcpl_116 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_118 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  nand_7_cse <= NOT((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2)) AND for_for_stage_0_3);
  or_tmp_49 <= (NOT for_for_asn_5_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR nand_7_cse;
  mux_29_nl <= MUX_s_1_2_2(or_tmp_49, (NOT for_for_stage_0_3), for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2));
  or_92_nl <= (NOT for_for_asn_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_20 <= MUX_s_1_2_2(mux_29_nl, or_tmp_49, or_92_nl);
  or_dcpl_45 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_46 <= or_dcpl_45 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_121 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_124 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_125 <= and_dcpl_60 AND and_dcpl_124;
  or_dcpl_48 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_49 <= and_dcpl_64 OR or_dcpl_48;
  and_dcpl_128 <= or_dcpl_49 AND or_dcpl_46;
  and_dcpl_130 <= and_dcpl_118 AND and_dcpl_32;
  and_dcpl_131 <= or_dcpl_46 AND or_dcpl_11;
  or_tmp_53 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("10")) OR (NOT nor_tmp_1);
  nor_38_nl <= NOT((CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("101"))
      AND for_for_asn_5_itm_2) OR nor_tmp_3);
  mux_tmp_23 <= MUX_s_1_2_2(nor_38_nl, or_tmp_53, or_179_cse);
  or_tmp_59 <= (NOT for_for_asn_5_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR nand_7_cse;
  mux_34_nl <= MUX_s_1_2_2(or_tmp_59, (NOT for_for_stage_0_3), for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2));
  or_111_nl <= (NOT for_for_asn_itm_2) OR CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("01"));
  mux_tmp_25 <= MUX_s_1_2_2(mux_34_nl, or_tmp_59, or_111_nl);
  nor_37_nl <= NOT((for_for_a_acc_psp_sva_1_0(1)) OR (NOT mux_tmp_25));
  or_110_nl <= (NOT operator_34_true_1_and_psp_sva_0) OR (for_for_a_acc_psp_sva_1_0(0));
  mux_tmp_26 <= MUX_s_1_2_2(nor_37_nl, mux_tmp_25, or_110_nl);
  or_dcpl_54 <= or_dcpl_45 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  and_dcpl_139 <= and_dcpl_77 AND and_dcpl_124;
  or_dcpl_56 <= or_dcpl_11 OR or_dcpl_48;
  and_dcpl_142 <= or_dcpl_56 AND or_dcpl_54;
  and_dcpl_144 <= or_dcpl_54 AND and_dcpl_64;
  or_tmp_64 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("110"))
      AND for_for_asn_5_itm_2);
  or_121_nl <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("110"));
  mux_39_nl <= MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_121_nl);
  mux_tmp_30 <= MUX_s_1_2_2(or_tmp_64, mux_39_nl, and_979_cse);
  and_dcpl_147 <= CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_149 <= CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  or_tmp_68 <= (NOT for_for_asn_5_itm_2) OR (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0))
      OR (NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11")) AND for_for_stage_0_3));
  mux_41_nl <= MUX_s_1_2_2(or_tmp_68, (NOT for_for_stage_0_3), and_979_cse);
  mux_tmp_32 <= MUX_s_1_2_2(mux_41_nl, or_tmp_68, or_tmp_9);
  or_dcpl_60 <= NOT(CONV_SL_1_1(for_for_b_for_for_b_acc_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_61 <= or_dcpl_60 OR (for_for_b_for_for_b_acc_tmp(0));
  and_dcpl_152 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_156 <= and_dcpl_60 AND and_979_cse;
  or_dcpl_63 <= NOT(CONV_SL_1_1(for_for_a_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_64 <= and_dcpl_64 OR or_dcpl_63;
  and_dcpl_159 <= or_dcpl_64 AND or_dcpl_61;
  and_dcpl_161 <= and_dcpl_149 AND and_dcpl_32;
  and_dcpl_162 <= or_dcpl_61 AND or_dcpl_11;
  or_dcpl_66 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11")));
  nor_tmp_23 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("111"))
      AND for_for_asn_5_itm_2;
  or_138_nl <= nor_tmp_23 OR nor_tmp_3;
  mux_tmp_35 <= MUX_s_1_2_2(nor_tmp_23, or_138_nl, and_979_cse);
  and_984_nl <= for_for_asn_5_itm_2 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("111"))
      AND for_for_stage_0_3;
  and_985_nl <= for_for_asn_itm_2 AND CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("111"));
  mux_tmp_36 <= MUX_s_1_2_2(and_984_nl, for_for_stage_0_3, and_985_nl);
  or_dcpl_69 <= or_dcpl_60 OR (NOT (for_for_b_for_for_b_acc_tmp(0)));
  or_dcpl_70 <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2
      DOWNTO 1)=STD_LOGIC_VECTOR'("11")));
  or_dcpl_71 <= (NOT nor_tmp_1) OR or_dcpl_70;
  and_dcpl_169 <= and_dcpl_77 AND and_979_cse;
  or_dcpl_73 <= or_dcpl_11 OR or_dcpl_63;
  and_dcpl_172 <= or_dcpl_73 AND or_dcpl_69;
  and_dcpl_174 <= or_dcpl_69 AND and_dcpl_64;
  and_dcpl_176 <= NOT(for_for_asn_5_itm_2 OR (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0)));
  or_dcpl_76 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_77 <= for_for_asn_5_itm_2 OR (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0));
  or_dcpl_78 <= or_dcpl_77 OR or_dcpl_76;
  or_tmp_75 <= (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0)) OR for_for_asn_itm_2;
  and_dcpl_187 <= for_for_stage_0_1 AND (NOT y_3_sva);
  and_dcpl_189 <= (NOT for_for_asn_5_itm_2) AND (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0));
  or_dcpl_81 <= for_for_asn_5_itm_2 OR (NOT (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(0)));
  or_dcpl_82 <= or_dcpl_81 OR or_dcpl_76;
  or_tmp_78 <= (NOT (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(0))) OR for_for_asn_itm_2;
  or_dcpl_84 <= (NOT for_for_stage_0_1) OR y_3_sva;
  or_dcpl_87 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("01"));
  or_dcpl_88 <= or_dcpl_77 OR or_dcpl_87;
  and_dcpl_203 <= and_dcpl_88 AND and_dcpl_187;
  or_dcpl_92 <= or_dcpl_81 OR or_dcpl_87;
  or_dcpl_96 <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("10"));
  or_dcpl_97 <= or_dcpl_77 OR or_dcpl_96;
  and_dcpl_216 <= and_dcpl_118 AND and_dcpl_187;
  or_dcpl_101 <= or_dcpl_81 OR or_dcpl_96;
  or_dcpl_105 <= or_dcpl_77 OR or_dcpl_70;
  and_dcpl_229 <= and_dcpl_149 AND and_dcpl_187;
  or_dcpl_109 <= or_dcpl_81 OR or_dcpl_70;
  and_200_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("000"))
      OR for_for_asn_5_itm_2) AND or_tmp_75;
  mux_48_nl <= MUX_s_1_2_2(and_200_nl, or_dcpl_78, or_159_cse);
  xt_rsc_0_0_i_wea_d_mx0c0 <= (NOT (fsm_output(2))) OR mux_48_nl OR (NOT for_for_stage_0_3);
  or_251_ssc <= and_dcpl_54 AND and_dcpl_53 AND (fsm_output(2));
  modulo_sub_qelse_mux_rmff <= MUX_v_32_2_2(('0' & (modulo_sub_base_sva(30 DOWNTO
      0))), z_out_1, modulo_sub_base_sva(31));
  modulo_add_qelse_mux_rmff <= MUX_v_32_2_2(modulo_add_base_sva, z_out_2, z_out_32);
  or_262_ssc <= nor_tmp_1 AND and_dcpl_53 AND (fsm_output(2));
  or_273_ssc <= and_dcpl_54 AND and_dcpl_91 AND (fsm_output(2));
  or_284_ssc <= (NOT or_tmp_34) AND (fsm_output(2));
  or_295_ssc <= and_dcpl_54 AND and_dcpl_121 AND (fsm_output(2));
  or_306_ssc <= nor_tmp_1 AND and_dcpl_121 AND (fsm_output(2));
  or_317_ssc <= and_dcpl_54 AND and_dcpl_152 AND (fsm_output(2));
  or_328_ssc <= nor_tmp_23 AND (fsm_output(2));
  or_347_ssc <= and_dcpl_189 AND and_dcpl_53 AND (fsm_output(2));
  or_357_ssc <= and_dcpl_176 AND and_dcpl_91 AND (fsm_output(2));
  or_367_ssc <= and_dcpl_189 AND and_dcpl_91 AND (fsm_output(2));
  or_377_ssc <= and_dcpl_176 AND and_dcpl_121 AND (fsm_output(2));
  or_387_ssc <= and_dcpl_189 AND and_dcpl_121 AND (fsm_output(2));
  or_397_ssc <= and_dcpl_176 AND and_dcpl_152 AND (fsm_output(2));
  or_407_ssc <= and_dcpl_189 AND and_dcpl_152 AND (fsm_output(2));
  for_for_b_for_for_b_for_for_b_nor_14_rmff <= NOT((or_tmp_7 AND for_for_asn_itm_2
      AND and_dcpl_61 AND (fsm_output(2))) OR for_for_b_or_13_seb);
  for_for_b_for_for_b_for_for_b_nor_30_rmff <= NOT(or_tmp_9 OR or_159_cse OR for_for_b_or_13_seb);
  for_for_b_for_for_b_for_for_b_nor_13_rmff <= NOT((or_tmp_18 AND for_for_asn_itm_2
      AND and_dcpl_78 AND (fsm_output(2))) OR for_for_b_or_12_seb);
  for_for_b_for_for_b_for_for_b_nor_31_rmff <= NOT(or_dcpl_27 OR or_159_cse OR for_for_b_or_12_seb);
  for_for_b_for_for_b_for_for_b_nor_12_rmff <= NOT((or_tmp_28 AND for_for_asn_itm_2
      AND and_dcpl_95 AND (fsm_output(2))) OR for_for_b_or_11_seb);
  for_for_b_for_for_b_for_for_b_nor_32_rmff <= NOT(or_tmp_9 OR or_dcpl_36 OR for_for_b_or_11_seb);
  for_for_b_for_for_b_for_for_b_nor_11_rmff <= NOT((or_tmp_34 AND for_for_asn_itm_2
      AND and_dcpl_108 AND (fsm_output(2))) OR for_for_b_or_10_seb);
  for_for_b_for_for_b_for_for_b_nor_33_rmff <= NOT(or_dcpl_27 OR or_dcpl_36 OR for_for_b_or_10_seb);
  for_for_b_for_for_b_for_for_b_nor_10_rmff <= NOT((or_tmp_43 AND for_for_asn_itm_2
      AND and_dcpl_125 AND (fsm_output(2))) OR for_for_b_or_9_seb);
  for_for_b_for_for_b_for_for_b_nor_34_rmff <= NOT(or_tmp_9 OR or_179_cse OR for_for_b_or_9_seb);
  for_for_b_for_for_b_for_for_b_nor_9_rmff <= NOT((or_tmp_53 AND for_for_asn_itm_2
      AND and_dcpl_139 AND (fsm_output(2))) OR for_for_b_or_8_seb);
  for_for_b_for_for_b_for_for_b_nor_35_rmff <= NOT(or_dcpl_27 OR or_179_cse OR for_for_b_or_8_seb);
  for_for_b_for_for_b_for_for_b_nor_8_rmff <= NOT((or_tmp_64 AND for_for_asn_itm_2
      AND and_dcpl_156 AND (fsm_output(2))) OR for_for_b_or_7_seb);
  for_for_b_for_for_b_for_for_b_nor_36_rmff <= NOT(or_tmp_9 OR or_dcpl_66 OR for_for_b_or_7_seb);
  for_for_b_for_for_b_for_for_b_nor_7_rmff <= NOT((or_dcpl_71 AND for_for_asn_itm_2
      AND and_dcpl_169 AND (fsm_output(2))) OR for_for_b_nand_seb);
  for_for_b_for_for_b_for_for_b_nor_37_rmff <= NOT(or_dcpl_27 OR or_dcpl_66 OR for_for_b_nand_seb);
  for_for_a_for_for_a_for_for_a_nor_rmff <= NOT(or_tmp_75 OR or_159_cse OR xt_rsc_0_0_i_wea_d_mx0c0);
  for_for_a_for_for_a_for_for_a_nor_1_rmff <= NOT((or_dcpl_78 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_61 AND (fsm_output(2))) OR xt_rsc_0_0_i_wea_d_mx0c0);
  for_for_b_for_for_b_for_for_b_nor_6_rmff <= NOT((or_dcpl_82 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_78 AND (fsm_output(2))) OR for_for_b_or_6_seb);
  for_for_b_for_for_b_for_for_b_nor_38_rmff <= NOT(or_tmp_78 OR or_159_cse OR for_for_b_or_6_seb);
  for_for_b_for_for_b_for_for_b_nor_5_rmff <= NOT((or_dcpl_88 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_95 AND (fsm_output(2))) OR for_for_b_or_5_seb);
  for_for_b_for_for_b_for_for_b_nor_39_rmff <= NOT(or_tmp_75 OR or_dcpl_36 OR for_for_b_or_5_seb);
  for_for_b_for_for_b_for_for_b_nor_4_rmff <= NOT((or_dcpl_92 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_108 AND (fsm_output(2))) OR for_for_b_or_4_seb);
  for_for_b_for_for_b_for_for_b_nor_40_rmff <= NOT(or_tmp_78 OR or_dcpl_36 OR for_for_b_or_4_seb);
  for_for_b_for_for_b_for_for_b_nor_3_rmff <= NOT((or_dcpl_97 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_125 AND (fsm_output(2))) OR for_for_b_or_3_seb);
  for_for_b_for_for_b_for_for_b_nor_41_rmff <= NOT(or_tmp_75 OR or_179_cse OR for_for_b_or_3_seb);
  for_for_b_for_for_b_for_for_b_nor_2_rmff <= NOT((or_dcpl_101 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_139 AND (fsm_output(2))) OR for_for_b_or_2_seb);
  for_for_b_for_for_b_for_for_b_nor_42_rmff <= NOT(or_tmp_78 OR or_179_cse OR for_for_b_or_2_seb);
  for_for_b_for_for_b_for_for_b_nor_1_rmff <= NOT((or_dcpl_105 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_156 AND (fsm_output(2))) OR for_for_b_or_1_seb);
  for_for_b_for_for_b_for_for_b_nor_43_rmff <= NOT(or_tmp_75 OR or_dcpl_66 OR for_for_b_or_1_seb);
  for_for_b_for_for_b_for_for_b_nor_rmff <= NOT((or_dcpl_109 AND (NOT for_for_asn_itm_2)
      AND and_dcpl_169 AND (fsm_output(2))) OR for_for_b_or_seb);
  for_for_b_for_for_b_for_for_b_nor_44_rmff <= NOT(or_tmp_78 OR or_dcpl_66 OR for_for_b_or_seb);
  for_for_b_or_13_seb <= (NOT (fsm_output(2))) OR mux_tmp_1 OR (NOT for_for_stage_0_3);
  for_for_b_or_12_seb <= (NOT (fsm_output(2))) OR mux_tmp_4 OR (NOT for_for_stage_0_3);
  for_for_b_or_11_seb <= (NOT (fsm_output(2))) OR mux_tmp_9 OR (NOT for_for_stage_0_3);
  for_for_b_or_10_seb <= (NOT (fsm_output(2))) OR mux_tmp_13 OR (NOT for_for_stage_0_3);
  for_for_b_or_9_seb <= (NOT (fsm_output(2))) OR mux_tmp_18 OR (NOT for_for_stage_0_3);
  for_for_b_or_8_seb <= (NOT (fsm_output(2))) OR mux_tmp_23 OR (NOT for_for_stage_0_3);
  for_for_b_or_7_seb <= (NOT (fsm_output(2))) OR mux_tmp_30 OR (NOT for_for_stage_0_3);
  for_for_b_nand_seb <= NOT((fsm_output(2)) AND mux_tmp_35 AND for_for_stage_0_3);
  or_159_cse <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("00"));
  and_214_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("001"))
      OR for_for_asn_5_itm_2) AND or_tmp_78;
  mux_49_nl <= MUX_s_1_2_2(and_214_nl, or_dcpl_82, or_159_cse);
  for_for_b_or_6_seb <= (NOT (fsm_output(2))) OR mux_49_nl OR (NOT for_for_stage_0_3);
  nor_29_cse <= NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("01")));
  and_223_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("010"))
      OR for_for_asn_5_itm_2) AND or_tmp_75;
  mux_50_nl <= MUX_s_1_2_2(or_dcpl_88, and_223_nl, nor_29_cse);
  for_for_b_or_5_seb <= (NOT (fsm_output(2))) OR mux_50_nl OR (NOT for_for_stage_0_3);
  and_231_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("011"))
      OR for_for_asn_5_itm_2) AND or_tmp_78;
  mux_51_nl <= MUX_s_1_2_2(or_dcpl_92, and_231_nl, nor_29_cse);
  for_for_b_or_4_seb <= (NOT (fsm_output(2))) OR mux_51_nl OR (NOT for_for_stage_0_3);
  or_179_cse <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)/=STD_LOGIC_VECTOR'("10"));
  and_238_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("100"))
      OR for_for_asn_5_itm_2) AND or_tmp_75;
  mux_52_nl <= MUX_s_1_2_2(and_238_nl, or_dcpl_97, or_179_cse);
  for_for_b_or_3_seb <= (NOT (fsm_output(2))) OR mux_52_nl OR (NOT for_for_stage_0_3);
  and_246_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("101"))
      OR for_for_asn_5_itm_2) AND or_tmp_78;
  mux_53_nl <= MUX_s_1_2_2(and_246_nl, or_dcpl_101, or_179_cse);
  for_for_b_or_2_seb <= (NOT (fsm_output(2))) OR mux_53_nl OR (NOT for_for_stage_0_3);
  and_979_cse <= CONV_SL_1_1(for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2(2 DOWNTO
      1)=STD_LOGIC_VECTOR'("11"));
  and_253_nl <= (CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2/=STD_LOGIC_VECTOR'("110"))
      OR for_for_asn_5_itm_2) AND or_tmp_75;
  mux_54_nl <= MUX_s_1_2_2(or_dcpl_105, and_253_nl, and_979_cse);
  for_for_b_or_1_seb <= (NOT (fsm_output(2))) OR mux_54_nl OR (NOT for_for_stage_0_3);
  and_261_nl <= (NOT(CONV_SL_1_1(for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2=STD_LOGIC_VECTOR'("111"))
      AND (NOT for_for_asn_5_itm_2))) AND or_tmp_78;
  mux_55_nl <= MUX_s_1_2_2(or_dcpl_109, and_261_nl, and_979_cse);
  for_for_b_or_seb <= (NOT (fsm_output(2))) OR mux_55_nl OR (NOT for_for_stage_0_3);
  twiddle_rsci_radr_d_pff <= for_for_w_lshift_itm;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff <= and_cse;
  for_for_b_for_for_b_mux_1_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_251_ssc);
  for_for_b_or_44_nl <= or_251_ssc OR (or_tmp_7 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_44_nl);
  yt_rsc_0_0_i_adra_d <= for_for_b_for_for_b_mux_1_nl & for_for_b_for_for_b_mux_nl;
  yt_rsc_0_0_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_14_rmff
      & for_for_b_for_for_b_for_for_b_nor_30_rmff);
  for_for_b_for_for_b_for_for_b_nor_29_nl <= NOT((or_dcpl_14 AND or_dcpl_11 AND and_dcpl_67
      AND (fsm_output(1))) OR for_for_b_or_42_seb);
  for_for_b_for_for_b_for_for_b_nor_45_nl <= NOT(or_dcpl_18 OR for_for_b_or_42_seb);
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_29_nl
      & for_for_b_for_for_b_for_for_b_nor_45_nl);
  yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_14_rmff
      & for_for_b_for_for_b_for_for_b_nor_30_rmff);
  for_for_b_for_for_b_mux_3_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_262_ssc);
  for_for_b_or_45_nl <= or_262_ssc OR (or_tmp_18 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_2_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_45_nl);
  yt_rsc_0_1_i_adra_d <= for_for_b_for_for_b_mux_3_nl & for_for_b_for_for_b_mux_2_nl;
  yt_rsc_0_1_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_13_rmff
      & for_for_b_for_for_b_for_for_b_nor_31_rmff);
  for_for_b_for_for_b_for_for_b_nor_28_nl <= NOT((and_dcpl_83 AND and_dcpl_67 AND
      (fsm_output(1))) OR for_for_b_or_40_seb);
  for_for_b_for_for_b_for_for_b_nor_46_nl <= NOT(or_dcpl_25 OR for_for_b_or_40_seb);
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_28_nl
      & for_for_b_for_for_b_for_for_b_nor_46_nl);
  yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_13_rmff
      & for_for_b_for_for_b_for_for_b_nor_31_rmff);
  for_for_b_for_for_b_mux_5_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_273_ssc);
  for_for_b_or_46_nl <= or_273_ssc OR (or_tmp_28 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_4_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_46_nl);
  yt_rsc_0_2_i_adra_d <= for_for_b_for_for_b_mux_5_nl & for_for_b_for_for_b_mux_4_nl;
  yt_rsc_0_2_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_12_rmff
      & for_for_b_for_for_b_for_for_b_nor_32_rmff);
  for_for_b_for_for_b_for_for_b_nor_27_nl <= NOT((and_dcpl_101 AND and_dcpl_100 AND
      (fsm_output(1))) OR for_for_b_or_38_seb);
  for_for_b_for_for_b_for_for_b_nor_47_nl <= NOT(or_dcpl_34 OR for_for_b_or_38_seb);
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_27_nl
      & for_for_b_for_for_b_for_for_b_nor_47_nl);
  yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_12_rmff
      & for_for_b_for_for_b_for_for_b_nor_32_rmff);
  for_for_b_for_for_b_mux_7_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_284_ssc);
  for_for_b_or_47_nl <= or_284_ssc OR (or_tmp_34 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_6_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_47_nl);
  yt_rsc_0_3_i_adra_d <= for_for_b_for_for_b_mux_7_nl & for_for_b_for_for_b_mux_6_nl;
  yt_rsc_0_3_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_11_rmff
      & for_for_b_for_for_b_for_for_b_nor_33_rmff);
  for_for_b_for_for_b_for_for_b_nor_26_nl <= NOT((and_dcpl_113 AND and_dcpl_100 AND
      (fsm_output(1))) OR for_for_b_or_36_seb);
  for_for_b_for_for_b_for_for_b_nor_48_nl <= NOT(or_dcpl_41 OR for_for_b_or_36_seb);
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_26_nl
      & for_for_b_for_for_b_for_for_b_nor_48_nl);
  yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_11_rmff
      & for_for_b_for_for_b_for_for_b_nor_33_rmff);
  for_for_b_for_for_b_mux_9_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_295_ssc);
  for_for_b_or_48_nl <= or_295_ssc OR (or_tmp_43 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_8_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_48_nl);
  yt_rsc_0_4_i_adra_d <= for_for_b_for_for_b_mux_9_nl & for_for_b_for_for_b_mux_8_nl;
  yt_rsc_0_4_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_4_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_10_rmff
      & for_for_b_for_for_b_for_for_b_nor_34_rmff);
  for_for_b_for_for_b_for_for_b_nor_25_nl <= NOT((and_dcpl_131 AND and_dcpl_130 AND
      (fsm_output(1))) OR for_for_b_or_34_seb);
  for_for_b_for_for_b_for_for_b_nor_49_nl <= NOT(or_dcpl_49 OR for_for_b_or_34_seb);
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_25_nl
      & for_for_b_for_for_b_for_for_b_nor_49_nl);
  yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_10_rmff
      & for_for_b_for_for_b_for_for_b_nor_34_rmff);
  for_for_b_for_for_b_mux_11_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_306_ssc);
  for_for_b_or_49_nl <= or_306_ssc OR (or_tmp_53 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_10_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_49_nl);
  yt_rsc_0_5_i_adra_d <= for_for_b_for_for_b_mux_11_nl & for_for_b_for_for_b_mux_10_nl;
  yt_rsc_0_5_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_5_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_9_rmff
      & for_for_b_for_for_b_for_for_b_nor_35_rmff);
  for_for_b_for_for_b_for_for_b_nor_24_nl <= NOT((and_dcpl_144 AND and_dcpl_130 AND
      (fsm_output(1))) OR for_for_b_or_32_seb);
  for_for_b_for_for_b_for_for_b_nor_50_nl <= NOT(or_dcpl_56 OR for_for_b_or_32_seb);
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_24_nl
      & for_for_b_for_for_b_for_for_b_nor_50_nl);
  yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_9_rmff
      & for_for_b_for_for_b_for_for_b_nor_35_rmff);
  for_for_b_for_for_b_mux_13_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_317_ssc);
  for_for_b_or_50_nl <= or_317_ssc OR (or_tmp_64 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_12_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_50_nl);
  yt_rsc_0_6_i_adra_d <= for_for_b_for_for_b_mux_13_nl & for_for_b_for_for_b_mux_12_nl;
  yt_rsc_0_6_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_6_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_8_rmff
      & for_for_b_for_for_b_for_for_b_nor_36_rmff);
  for_for_b_for_for_b_for_for_b_nor_23_nl <= NOT((and_dcpl_162 AND and_dcpl_161 AND
      (fsm_output(1))) OR for_for_b_or_30_seb);
  for_for_b_for_for_b_for_for_b_nor_51_nl <= NOT(or_dcpl_64 OR for_for_b_or_30_seb);
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_23_nl
      & for_for_b_for_for_b_for_for_b_nor_51_nl);
  yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_8_rmff
      & for_for_b_for_for_b_for_for_b_nor_36_rmff);
  for_for_b_for_for_b_mux_15_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_328_ssc);
  for_for_b_or_51_nl <= or_328_ssc OR (or_dcpl_71 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_14_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_51_nl);
  yt_rsc_0_7_i_adra_d <= for_for_b_for_for_b_mux_15_nl & for_for_b_for_for_b_mux_14_nl;
  yt_rsc_0_7_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  yt_rsc_0_7_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_7_rmff
      & for_for_b_for_for_b_for_for_b_nor_37_rmff);
  for_for_b_for_for_b_for_for_b_nor_22_nl <= NOT((and_dcpl_174 AND and_dcpl_161 AND
      (fsm_output(1))) OR for_for_b_or_28_seb);
  for_for_b_for_for_b_for_for_b_nor_52_nl <= NOT(or_dcpl_73 OR for_for_b_or_28_seb);
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_22_nl
      & for_for_b_for_for_b_for_for_b_nor_52_nl);
  yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_7_rmff
      & for_for_b_for_for_b_for_for_b_nor_37_rmff);
  and_554_nl <= and_dcpl_176 AND and_dcpl_53 AND (fsm_output(2));
  for_for_a_mux1h_114_nl <= MUX1HOT_v_11_3_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, for_for_a_acc_psp_sva_1_12_2, STD_LOGIC_VECTOR'(
      (fsm_output(1)) & and_554_nl & (fsm_output(3))));
  xt_rsc_0_0_i_adra_d <= for_for_acc_tdx_13_0_sva_2_13_3 & for_for_a_mux1h_114_nl;
  xt_rsc_0_0_i_da_d <= modulo_add_qelse_mux_rmff & modulo_sub_qelse_mux_rmff;
  xt_rsc_0_0_i_wea_d <= STD_LOGIC_VECTOR'( for_for_a_for_for_a_for_for_a_nor_rmff
      & for_for_a_for_for_a_for_for_a_nor_1_rmff);
  or_344_nl <= (for_for_stage_0_2 AND (NOT for_for_a_asn_itm_1) AND (NOT (for_for_a_conc_2_itm_1_2_1(1)))
      AND (NOT((for_for_a_conc_2_itm_1_2_1(0)) OR for_for_a_conc_2_itm_1_0)) AND
      (fsm_output(3))) OR (and_dcpl_49 AND and_dcpl_187 AND (fsm_output(1)));
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( '0' & or_344_nl);
  xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_a_for_for_a_for_for_a_nor_rmff
      & for_for_a_for_for_a_for_for_a_nor_1_rmff);
  for_for_b_for_for_b_mux_17_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_347_ssc);
  for_for_b_or_52_nl <= or_347_ssc OR (or_dcpl_82 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_16_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_52_nl);
  xt_rsc_0_1_i_adra_d <= for_for_b_for_for_b_mux_17_nl & for_for_b_for_for_b_mux_16_nl;
  xt_rsc_0_1_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_1_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_6_rmff
      & for_for_b_for_for_b_for_for_b_nor_38_rmff);
  for_for_b_for_for_b_for_for_b_nor_21_nl <= NOT((and_dcpl_83 AND for_for_a_nor_cse_1
      AND and_dcpl_187 AND (fsm_output(1))) OR for_for_b_or_26_seb);
  for_for_b_for_for_b_for_for_b_nor_53_nl <= NOT(or_dcpl_25 OR for_for_b_or_26_seb);
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_21_nl
      & for_for_b_for_for_b_for_for_b_nor_53_nl);
  xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_6_rmff
      & for_for_b_for_for_b_for_for_b_nor_38_rmff);
  for_for_b_for_for_b_mux_19_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_357_ssc);
  for_for_b_or_53_nl <= or_357_ssc OR (or_dcpl_88 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_18_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_53_nl);
  xt_rsc_0_2_i_adra_d <= for_for_b_for_for_b_mux_19_nl & for_for_b_for_for_b_mux_18_nl;
  xt_rsc_0_2_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_2_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_5_rmff
      & for_for_b_for_for_b_for_for_b_nor_39_rmff);
  for_for_b_for_for_b_for_for_b_nor_20_nl <= NOT((and_dcpl_101 AND and_dcpl_203 AND
      (fsm_output(1))) OR for_for_b_or_24_seb);
  for_for_b_for_for_b_for_for_b_nor_54_nl <= NOT(or_dcpl_34 OR for_for_b_or_24_seb);
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_20_nl
      & for_for_b_for_for_b_for_for_b_nor_54_nl);
  xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_5_rmff
      & for_for_b_for_for_b_for_for_b_nor_39_rmff);
  for_for_b_for_for_b_mux_21_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_367_ssc);
  for_for_b_or_54_nl <= or_367_ssc OR (or_dcpl_92 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_20_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_54_nl);
  xt_rsc_0_3_i_adra_d <= for_for_b_for_for_b_mux_21_nl & for_for_b_for_for_b_mux_20_nl;
  xt_rsc_0_3_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_3_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_4_rmff
      & for_for_b_for_for_b_for_for_b_nor_40_rmff);
  for_for_b_for_for_b_for_for_b_nor_19_nl <= NOT((and_dcpl_113 AND and_dcpl_203 AND
      (fsm_output(1))) OR for_for_b_or_22_seb);
  for_for_b_for_for_b_for_for_b_nor_55_nl <= NOT(or_dcpl_41 OR for_for_b_or_22_seb);
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_19_nl
      & for_for_b_for_for_b_for_for_b_nor_55_nl);
  xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_4_rmff
      & for_for_b_for_for_b_for_for_b_nor_40_rmff);
  for_for_b_for_for_b_mux_23_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_377_ssc);
  for_for_b_or_55_nl <= or_377_ssc OR (or_dcpl_97 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_22_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_55_nl);
  xt_rsc_0_4_i_adra_d <= for_for_b_for_for_b_mux_23_nl & for_for_b_for_for_b_mux_22_nl;
  xt_rsc_0_4_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_4_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_3_rmff
      & for_for_b_for_for_b_for_for_b_nor_41_rmff);
  for_for_b_for_for_b_for_for_b_nor_18_nl <= NOT((and_dcpl_131 AND and_dcpl_216 AND
      (fsm_output(1))) OR for_for_b_or_20_seb);
  for_for_b_for_for_b_for_for_b_nor_56_nl <= NOT(or_dcpl_49 OR for_for_b_or_20_seb);
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_18_nl
      & for_for_b_for_for_b_for_for_b_nor_56_nl);
  xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_3_rmff
      & for_for_b_for_for_b_for_for_b_nor_41_rmff);
  for_for_b_for_for_b_mux_25_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_387_ssc);
  for_for_b_or_56_nl <= or_387_ssc OR (or_dcpl_101 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_24_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_56_nl);
  xt_rsc_0_5_i_adra_d <= for_for_b_for_for_b_mux_25_nl & for_for_b_for_for_b_mux_24_nl;
  xt_rsc_0_5_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_5_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_2_rmff
      & for_for_b_for_for_b_for_for_b_nor_42_rmff);
  for_for_b_for_for_b_for_for_b_nor_17_nl <= NOT((and_dcpl_144 AND and_dcpl_216 AND
      (fsm_output(1))) OR for_for_b_or_18_seb);
  for_for_b_for_for_b_for_for_b_nor_57_nl <= NOT(or_dcpl_56 OR for_for_b_or_18_seb);
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_17_nl
      & for_for_b_for_for_b_for_for_b_nor_57_nl);
  xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_2_rmff
      & for_for_b_for_for_b_for_for_b_nor_42_rmff);
  for_for_b_for_for_b_mux_27_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_397_ssc);
  for_for_b_or_57_nl <= or_397_ssc OR (or_dcpl_105 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_26_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_57_nl);
  xt_rsc_0_6_i_adra_d <= for_for_b_for_for_b_mux_27_nl & for_for_b_for_for_b_mux_26_nl;
  xt_rsc_0_6_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_6_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_1_rmff
      & for_for_b_for_for_b_for_for_b_nor_43_rmff);
  for_for_b_for_for_b_for_for_b_nor_16_nl <= NOT((and_dcpl_162 AND and_dcpl_229 AND
      (fsm_output(1))) OR for_for_b_or_16_seb);
  for_for_b_for_for_b_for_for_b_nor_58_nl <= NOT(or_dcpl_64 OR for_for_b_or_16_seb);
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_16_nl
      & for_for_b_for_for_b_for_for_b_nor_58_nl);
  xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_1_rmff
      & for_for_b_for_for_b_for_for_b_nor_43_rmff);
  for_for_b_for_for_b_mux_29_nl <= MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp(13 DOWNTO
      3)), for_for_acc_tdx_1_13_0_sva_2_13_3, or_407_ssc);
  for_for_b_or_58_nl <= or_407_ssc OR (or_dcpl_109 AND (fsm_output(2)));
  for_for_b_for_for_b_mux_28_nl <= MUX_v_11_2_2((for_for_a_acc_tmp(12 DOWNTO 2)),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_58_nl);
  xt_rsc_0_7_i_adra_d <= for_for_b_for_for_b_mux_29_nl & for_for_b_for_for_b_mux_28_nl;
  xt_rsc_0_7_i_da_d <= modulo_sub_qelse_mux_rmff & modulo_add_qelse_mux_rmff;
  xt_rsc_0_7_i_wea_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_rmff
      & for_for_b_for_for_b_for_for_b_nor_44_rmff);
  for_for_b_for_for_b_for_for_b_nor_15_nl <= NOT((and_dcpl_174 AND and_dcpl_229 AND
      (fsm_output(1))) OR for_for_b_or_14_seb);
  for_for_b_for_for_b_for_for_b_nor_59_nl <= NOT(or_dcpl_73 OR for_for_b_or_14_seb);
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_15_nl
      & for_for_b_for_for_b_for_for_b_nor_59_nl);
  xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d <= STD_LOGIC_VECTOR'( for_for_b_for_for_b_for_for_b_nor_rmff
      & for_for_b_for_for_b_for_for_b_nor_44_rmff);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( for_for_stage_0_2 = '1' ) THEN
        mult_res_lpi_3_dfm_1 <= MUX_v_32_2_2(z_out_1, z_out_2, z_out_32);
        mult_z_mul_itm <= z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_for_for_a_nor_itm_2 <= '0';
        for_for_a_for_for_a_and_itm_2 <= '0';
        for_for_a_for_for_a_and_1_itm_2 <= '0';
        for_for_a_for_for_a_and_2_itm_2 <= '0';
        for_for_a_for_for_a_and_3_itm_2 <= '0';
        for_for_a_for_for_a_and_4_itm_2 <= '0';
        for_for_a_for_for_a_and_5_itm_2 <= '0';
        for_for_a_for_for_a_and_6_itm_2 <= '0';
        for_for_a_for_for_a_nor_1_itm_2 <= '0';
        for_for_a_for_for_a_and_7_itm_2 <= '0';
        for_for_a_for_for_a_and_8_itm_2 <= '0';
        for_for_a_for_for_a_and_9_itm_2 <= '0';
        for_for_a_for_for_a_and_10_itm_2 <= '0';
        for_for_a_for_for_a_and_11_itm_2 <= '0';
        for_for_a_for_for_a_and_12_itm_2 <= '0';
        for_for_a_for_for_a_and_13_itm_2 <= '0';
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
        for_for_a_asn_itm <= '0';
        for_for_asn_5_itm <= '0';
        for_for_asn_itm <= '0';
        for_for_a_acc_psp_sva_1_0 <= STD_LOGIC_VECTOR'( "00");
        operator_34_true_1_and_psp_sva_0 <= '0';
        for_for_acc_tdx_13_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        reg_for_for_acc_tdx_1_13_0_ftd <= STD_LOGIC_VECTOR'( "00000000000");
        reg_for_for_acc_tdx_1_13_0_ftd_1 <= STD_LOGIC_VECTOR'( "000");
      ELSE
        for_for_a_for_for_a_nor_itm_2 <= for_for_a_for_for_a_nor_itm_1;
        for_for_a_for_for_a_and_itm_2 <= for_for_a_for_for_a_and_itm_1;
        for_for_a_for_for_a_and_1_itm_2 <= for_for_a_for_for_a_and_1_itm_1;
        for_for_a_for_for_a_and_2_itm_2 <= for_for_a_for_for_a_and_2_itm_1;
        for_for_a_for_for_a_and_3_itm_2 <= for_for_a_for_for_a_and_3_itm_1;
        for_for_a_for_for_a_and_4_itm_2 <= for_for_a_for_for_a_and_4_itm_1;
        for_for_a_for_for_a_and_5_itm_2 <= for_for_a_for_for_a_and_5_itm_1;
        for_for_a_for_for_a_and_6_itm_2 <= for_for_a_for_for_a_and_6_itm_1;
        for_for_a_for_for_a_nor_1_itm_2 <= for_for_a_for_for_a_nor_1_itm_1;
        for_for_a_for_for_a_and_7_itm_2 <= for_for_a_for_for_a_and_7_itm_1;
        for_for_a_for_for_a_and_8_itm_2 <= for_for_a_for_for_a_and_8_itm_1;
        for_for_a_for_for_a_and_9_itm_2 <= for_for_a_for_for_a_and_9_itm_1;
        for_for_a_for_for_a_and_10_itm_2 <= for_for_a_for_for_a_and_10_itm_1;
        for_for_a_for_for_a_and_11_itm_2 <= for_for_a_for_for_a_and_11_itm_1;
        for_for_a_for_for_a_and_12_itm_2 <= for_for_a_for_for_a_and_12_itm_1;
        for_for_a_for_for_a_and_13_itm_2 <= for_for_a_for_for_a_and_13_itm_1;
        for_for_stage_0 <= for_for_mux_18_cse AND (NOT((fsm_output(5)) OR (for_for_stage_0_1
            AND (z_out_4(13)) AND (fsm_output(1)))));
        reg_yt_rsc_0_0_cgo_cse <= or_248_rmff;
        reg_yt_rsc_0_1_cgo_cse <= or_259_rmff;
        reg_yt_rsc_0_2_cgo_cse <= or_270_rmff;
        reg_yt_rsc_0_3_cgo_cse <= or_281_rmff;
        reg_yt_rsc_0_4_cgo_cse <= or_292_rmff;
        reg_yt_rsc_0_5_cgo_cse <= or_303_rmff;
        reg_yt_rsc_0_6_cgo_cse <= or_314_rmff;
        reg_yt_rsc_0_7_cgo_cse <= or_325_rmff;
        reg_xt_rsc_triosy_0_7_obj_ld_cse <= (NOT (z_out_4(3))) AND (fsm_output(4));
        for_for_a_asn_itm <= for_for_a_mux1h_30_nl AND (NOT or_cse);
        for_for_asn_5_itm <= for_for_mux1h_28_nl OR or_cse;
        for_for_asn_itm <= for_for_mux1h_30_nl OR or_cse;
        for_for_a_acc_psp_sva_1_0 <= for_for_a_acc_tmp(1 DOWNTO 0);
        operator_34_true_1_and_psp_sva_0 <= operator_34_true_1_and_psp_sva_1(0);
        for_for_acc_tdx_13_0_sva_2_0 <= for_for_acc_tdx_13_0_sva_1(2 DOWNTO 0);
        reg_for_for_acc_tdx_1_13_0_ftd <= for_for_acc_tdx_1_13_0_sva_1(13 DOWNTO
            3);
        reg_for_for_acc_tdx_1_13_0_ftd_1 <= for_for_b_for_for_b_acc_tmp(2 DOWNTO
            0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      mult_t_mul_cmp_b <= twiddle_h_rsci_q_d;
      nn_14_sva <= nn_mux_nl AND (NOT or_cse);
      tmp_2_sva_1 <= MUX1HOT_v_32_3_2(mult_t_mul_cmp_z_oreg, (xt_rsc_0_1_i_qa_d(31
          DOWNTO 0)), tmp_2_sva_1_1, STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2))
          & (fsm_output(3))));
      tmp_2_sva_2 <= MUX_v_32_2_2((xt_rsc_0_2_i_qa_d(31 DOWNTO 0)), tmp_2_sva_2_1,
          fsm_output(3));
      tmp_2_sva_3 <= MUX_v_32_2_2((xt_rsc_0_3_i_qa_d(31 DOWNTO 0)), tmp_2_sva_3_1,
          fsm_output(3));
      tmp_2_sva_4 <= MUX_v_32_2_2((xt_rsc_0_4_i_qa_d(31 DOWNTO 0)), tmp_2_sva_4_1,
          fsm_output(3));
      tmp_2_sva_5 <= MUX_v_32_2_2((xt_rsc_0_5_i_qa_d(31 DOWNTO 0)), tmp_2_sva_5_1,
          fsm_output(3));
      tmp_2_sva_6 <= MUX_v_32_2_2((xt_rsc_0_6_i_qa_d(31 DOWNTO 0)), tmp_2_sva_6_1,
          fsm_output(3));
      tmp_2_sva_7 <= MUX_v_32_2_2((xt_rsc_0_7_i_qa_d(31 DOWNTO 0)), tmp_2_sva_7_1,
          fsm_output(3));
      tmp_sva <= MUX_v_32_2_2((yt_rsc_0_0_i_qa_d(31 DOWNTO 0)), tmp_sva_1_1, fsm_output(3));
      tmp_sva_1 <= MUX_v_32_2_2((yt_rsc_0_1_i_qa_d(31 DOWNTO 0)), tmp_sva_2_1, fsm_output(3));
      tmp_sva_2 <= MUX_v_32_2_2((yt_rsc_0_2_i_qa_d(31 DOWNTO 0)), tmp_sva_3_1, fsm_output(3));
      tmp_sva_3 <= MUX_v_32_2_2((yt_rsc_0_3_i_qa_d(31 DOWNTO 0)), tmp_sva_4_1, fsm_output(3));
      tmp_sva_4 <= MUX_v_32_2_2((yt_rsc_0_4_i_qa_d(31 DOWNTO 0)), tmp_sva_5_1, fsm_output(3));
      tmp_sva_5 <= MUX_v_32_2_2((yt_rsc_0_5_i_qa_d(31 DOWNTO 0)), tmp_sva_6_1, fsm_output(3));
      tmp_sva_6 <= MUX_v_32_2_2((yt_rsc_0_6_i_qa_d(31 DOWNTO 0)), tmp_sva_7_1, fsm_output(3));
      tmp_sva_7 <= MUX_v_32_2_2((yt_rsc_0_7_i_qa_d(31 DOWNTO 0)), tmp_sva_1_2, fsm_output(3));
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( y_or_cse = '1' ) THEN
        idx_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'("0000"), idx_3_0_sva_2, idx_not_1_nl);
        reg_s_13_0_ftd <= NOT (fsm_output(4));
        reg_s_13_0_ftd_1 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"), (reg_s_13_0_ftd
            & (reg_s_13_0_ftd_1(12 DOWNTO 1))), (fsm_output(4)));
        shift_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1101"), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(operator_32_false_2_acc_nl),
            4)), fsm_output(4));
        nn_13_sva <= nn_12_sva AND (NOT (fsm_output(0)));
        nn_12_sva <= nn_11_sva AND (NOT (fsm_output(0)));
        nn_11_sva <= nn_10_sva AND (NOT (fsm_output(0)));
        nn_10_sva <= nn_9_sva AND (NOT (fsm_output(0)));
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
        for_for_a_asn_itm_2 <= '0';
        for_for_a_conc_2_itm_2_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( for_for_a_or_2_cse = '1' ) THEN
        for_for_a_asn_itm_2 <= MUX_s_1_2_2((operator_34_true_1_and_psp_sva_1(0)),
            for_for_a_asn_itm_1, fsm_output(3));
        for_for_a_conc_2_itm_2_1 <= MUX_v_2_2_2((for_for_a_acc_tmp(1 DOWNTO 0)),
            for_for_a_conc_2_itm_1_2_1, fsm_output(3));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_t_13_0_sva_12_0 <= STD_LOGIC_VECTOR'( "0000000000000");
      ELSIF ( (and_cse OR (fsm_output(4)) OR (fsm_output(0))) = '1' ) THEN
        for_for_t_13_0_sva_12_0 <= MUX_v_13_2_2(STD_LOGIC_VECTOR'("0000000000000"),
            (z_out_4(12 DOWNTO 0)), y_not_35_nl);
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
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_13_0_sva_2_13_3 <= for_for_acc_tdx_13_0_sva_1_13_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_1_13_0_sva_2_13_3 <= for_for_acc_tdx_1_13_0_sva_1_13_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_5_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_5_itm_2 <= for_for_asn_5_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_itm_2 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_itm_2 <= for_for_asn_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_2_itm_1_2_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_2_itm_1_2_1 <= for_for_a_conc_2_itm_2_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_conc_2_itm_1_0 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_conc_2_itm_1_0 <= for_for_a_asn_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        mult_z_mul_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(mult_t_mul_cmp_a_drv)
            * UNSIGNED(for_for_w_asn_2_itm)), 32));
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
        for_for_stage_0_1 <= '0';
        for_for_stage_0_2 <= '0';
        for_for_stage_0_3 <= '0';
      ELSIF ( for_for_or_cse = '1' ) THEN
        for_for_stage_0_1 <= for_for_mux_18_cse;
        for_for_stage_0_2 <= for_for_stage_0_1 AND (NOT y_or_cse);
        for_for_stage_0_3 <= for_for_stage_0_2 AND (NOT y_or_cse);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( for_for_stage_0_1 = '1' ) THEN
        mult_t_mul_cmp_a_drv <= MUX1HOT_v_32_16_2((xt_rsc_0_0_i_qa_d(31 DOWNTO 0)),
            (xt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_2_i_qa_d(63 DOWNTO 32)),
            (xt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_4_i_qa_d(63 DOWNTO 32)),
            (xt_rsc_0_5_i_qa_d(63 DOWNTO 32)), (xt_rsc_0_6_i_qa_d(63 DOWNTO 32)),
            (xt_rsc_0_7_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_0_i_qa_d(63 DOWNTO 32)),
            (yt_rsc_0_1_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_2_i_qa_d(63 DOWNTO 32)),
            (yt_rsc_0_3_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_4_i_qa_d(63 DOWNTO 32)),
            (yt_rsc_0_5_i_qa_d(63 DOWNTO 32)), (yt_rsc_0_6_i_qa_d(63 DOWNTO 32)),
            (yt_rsc_0_7_i_qa_d(63 DOWNTO 32)), STD_LOGIC_VECTOR'( for_for_b_for_for_b_nor_itm
            & for_for_b_for_for_b_and_itm & for_for_b_for_for_b_and_1_itm & for_for_b_for_for_b_and_2_itm
            & for_for_b_for_for_b_and_3_itm & for_for_b_for_for_b_and_4_itm & for_for_b_for_for_b_and_5_itm
            & for_for_b_for_for_b_and_6_itm & for_for_b_and_1_nl & for_for_b_for_for_b_and_7_itm
            & for_for_b_for_for_b_and_8_itm & for_for_b_for_for_b_and_9_itm & for_for_b_for_for_b_and_10_itm
            & for_for_b_for_for_b_and_11_itm & for_for_b_for_for_b_and_12_itm & for_for_b_for_for_b_and_13_itm));
        for_for_mul_itm <= z_out_3(13 DOWNTO 0);
        for_for_w_asn_2_itm <= twiddle_rsci_q_d;
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
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_a_acc_psp_sva_1_12_2 <= for_for_a_acc_psp_sva_12_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_5_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_5_itm_1 <= for_for_asn_5_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_asn_itm_1 <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        for_for_asn_itm_1 <= for_for_asn_itm;
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
        for_for_acc_tdx_1_13_0_sva_1_13_3 <= reg_for_for_acc_tdx_1_13_0_ftd;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        for_for_acc_tdx_13_0_sva_1_13_3 <= for_for_acc_tdx_13_0_sva_13_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        tmp_2_sva_1_1 <= tmp_2_sva_1;
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
        tmp_sva_1_2 <= tmp_sva;
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
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((NOT(x_3_sva XOR for_for_asn_5_itm)) AND (fsm_output(2))) = '1' )
          THEN
        for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm <= for_for_acc_tdx_1_13_0_sva_1(2
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (NOT((x_3_sva XOR for_for_asn_itm) OR (fsm_output(2)))) = '1' ) THEN
        for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm <= for_for_acc_tdx_13_0_sva_1(2
            DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( for_for_stage_0_3 = '1' ) THEN
        modulo_add_base_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(for_for_a_lpi_3_dfm_1)
            + UNSIGNED(mult_res_lpi_3_dfm_1), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        modulo_sub_base_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( for_for_stage_0_3 = '1' ) THEN
        modulo_sub_base_sva <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(for_for_a_lpi_3_dfm_1)
            - SIGNED(mult_res_lpi_3_dfm_1), 32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_a_acc_psp_sva_12_2 <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_a_acc_psp_sva_12_2 <= for_for_a_acc_tmp(12 DOWNTO 2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        for_for_acc_tdx_13_0_sva_13_3 <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(2)) = '0' ) THEN
        for_for_acc_tdx_13_0_sva_13_3 <= for_for_acc_tdx_13_0_sva_1(13 DOWNTO 3);
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
  for_for_a_mux1h_30_nl <= MUX1HOT_s_1_3_2(for_for_a_asn_itm, y_3_sva, x_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_3 & (fsm_output(3)) & (fsm_output(4))));
  for_for_mux1h_28_nl <= MUX1HOT_s_1_3_2(for_for_asn_5_itm, x_3_sva, y_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_3 & (fsm_output(3)) & (fsm_output(4))));
  for_for_mux1h_30_nl <= MUX1HOT_s_1_3_2(for_for_asn_itm, x_3_sva, y_3_sva, STD_LOGIC_VECTOR'(
      or_dcpl_3 & (fsm_output(3)) & (fsm_output(4))));
  nn_mux_nl <= MUX_s_1_2_2(nn_14_sva, nn_13_sva, fsm_output(4));
  idx_not_1_nl <= NOT (fsm_output(0));
  operator_32_false_2_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(shift_3_0_sva)
      + UNSIGNED'( "1111"), 4));
  y_not_35_nl <= NOT y_or_cse;
  for_for_b_and_1_nl <= for_for_b_for_for_b_nor_1_itm AND y_3_sva;
  mult_if_mux_5_nl <= MUX_v_32_2_2(z_out_2, p_sva, fsm_output(2));
  mult_if_mux_6_nl <= MUX_v_32_2_2((NOT p_sva), (NOT modulo_add_base_sva), fsm_output(2));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & mult_if_mux_5_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mult_if_mux_6_nl & '1'), 33), 34), 34));
  z_out_32 <= acc_nl(33);
  mult_if_mux_7_nl <= MUX_v_32_2_2(z_out_2, ('1' & (modulo_sub_base_sva(30 DOWNTO
      0))), fsm_output(2));
  mult_if_or_1_nl <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("01"));
  mult_if_mux_8_nl <= MUX_v_32_2_2((NOT p_sva), p_sva, fsm_output(2));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_if_mux_7_nl & mult_if_or_1_nl)
      + UNSIGNED(mult_if_mux_8_nl & '1'), 33));
  z_out_1 <= acc_1_nl(32 DOWNTO 1);
  mult_res_mux_3_nl <= MUX_v_32_2_2(mult_z_mul_itm_1, modulo_add_base_sva, fsm_output(2));
  mult_res_mux_4_nl <= MUX_v_32_2_2((NOT mult_z_mul_itm), (NOT p_sva), fsm_output(2));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mult_res_mux_3_nl & '1') +
      UNSIGNED(mult_res_mux_4_nl & '1'), 33));
  z_out_2 <= acc_2_nl(32 DOWNTO 1);
  for_for_mux_22_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "000000000000000000") & reg_s_13_0_ftd
      & reg_s_13_0_ftd_1), tmp_2_sva_1, fsm_output(2));
  for_for_mux_23_nl <= MUX_v_32_2_2((STD_LOGIC_VECTOR'( "000000000000000000") & nn_14_sva
      & nn_13_sva & nn_12_sva & nn_11_sva & nn_10_sva & nn_9_sva & nn_8_sva & nn_7_sva
      & nn_6_sva & nn_5_sva & nn_4_sva & nn_3_sva & nn_2_sva & nn_1_sva), p_sva,
      fsm_output(2));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(for_for_mux_22_nl)
      * UNSIGNED(for_for_mux_23_nl)), 32));
  for_for_mux_24_nl <= MUX_v_13_2_2(for_for_t_13_0_sva_12_0, (STD_LOGIC_VECTOR'(
      "1111111111") & (idx_3_0_sva_2(3 DOWNTO 1))), fsm_output(4));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(for_for_mux_24_nl),
      14) + UNSIGNED'( "00000000000001"), 14));
END v18;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_dit
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_DPRAM_RBW_DUAL_pkg.ALL;


ENTITY stockham_dit IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    xt_rsc_0_0_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_0_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_wea : OUT STD_LOGIC;
    xt_rsc_0_0_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_0_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_0_web : OUT STD_LOGIC;
    xt_rsc_0_0_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_0_lz : OUT STD_LOGIC;
    xt_rsc_0_1_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_1_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_wea : OUT STD_LOGIC;
    xt_rsc_0_1_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_1_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_1_web : OUT STD_LOGIC;
    xt_rsc_0_1_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_1_lz : OUT STD_LOGIC;
    xt_rsc_0_2_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_2_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_wea : OUT STD_LOGIC;
    xt_rsc_0_2_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_2_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_2_web : OUT STD_LOGIC;
    xt_rsc_0_2_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_2_lz : OUT STD_LOGIC;
    xt_rsc_0_3_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_3_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_wea : OUT STD_LOGIC;
    xt_rsc_0_3_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_3_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_3_web : OUT STD_LOGIC;
    xt_rsc_0_3_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_3_lz : OUT STD_LOGIC;
    xt_rsc_0_4_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_4_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_wea : OUT STD_LOGIC;
    xt_rsc_0_4_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_4_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_4_web : OUT STD_LOGIC;
    xt_rsc_0_4_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_4_lz : OUT STD_LOGIC;
    xt_rsc_0_5_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_5_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_wea : OUT STD_LOGIC;
    xt_rsc_0_5_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_5_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_5_web : OUT STD_LOGIC;
    xt_rsc_0_5_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_5_lz : OUT STD_LOGIC;
    xt_rsc_0_6_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_6_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_wea : OUT STD_LOGIC;
    xt_rsc_0_6_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_6_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_6_web : OUT STD_LOGIC;
    xt_rsc_0_6_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_6_lz : OUT STD_LOGIC;
    xt_rsc_0_7_adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_7_da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_wea : OUT STD_LOGIC;
    xt_rsc_0_7_qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    xt_rsc_0_7_db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_0_7_web : OUT STD_LOGIC;
    xt_rsc_0_7_qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    xt_rsc_triosy_0_7_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_h_rsc_radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
    twiddle_h_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    twiddle_h_rsc_triosy_lz : OUT STD_LOGIC
  );
END stockham_dit;

ARCHITECTURE v18 OF stockham_dit IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_clka_en_d : STD_LOGIC;
  SIGNAL yt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_0_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_web : STD_LOGIC;
  SIGNAL yt_rsc_0_0_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_0_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_0_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_1_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_web : STD_LOGIC;
  SIGNAL yt_rsc_0_1_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_1_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_2_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_web : STD_LOGIC;
  SIGNAL yt_rsc_0_2_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_2_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_3_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_web : STD_LOGIC;
  SIGNAL yt_rsc_0_3_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_3_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_4_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_4_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_web : STD_LOGIC;
  SIGNAL yt_rsc_0_4_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_4_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_5_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_5_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_web : STD_LOGIC;
  SIGNAL yt_rsc_0_5_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_5_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_6_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_6_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_web : STD_LOGIC;
  SIGNAL yt_rsc_0_6_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_6_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_clkb_en : STD_LOGIC;
  SIGNAL yt_rsc_0_7_clka_en : STD_LOGIC;
  SIGNAL yt_rsc_0_7_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_web : STD_LOGIC;
  SIGNAL yt_rsc_0_7_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_wea : STD_LOGIC;
  SIGNAL yt_rsc_0_7_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d_iff : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff : STD_LOGIC;

  SIGNAL yt_rsc_0_0_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_1_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_2_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_3_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_4_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_5_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_6_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL yt_rsc_0_7_comp_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_db : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_comp_qb : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL twiddle_h_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL twiddle_h_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL twiddle_h_rsci_radr_d : STD_LOGIC_VECTOR (13 DOWNTO 0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_4_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_5_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_6_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
    PORT(
      clkb_en : OUT STD_LOGIC;
      clka_en : OUT STD_LOGIC;
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL yt_rsc_0_7_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_0_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_1_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_2_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_3_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_4_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_5_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_6_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_da_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_qa_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_wea_d_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);
  SIGNAL xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d_1 : STD_LOGIC_VECTOR (1 DOWNTO
      0);

  COMPONENT stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
    PORT(
      qb : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      web : OUT STD_LOGIC;
      db : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adrb : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      qa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      wea : OUT STD_LOGIC;
      da : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      adra : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      adra_d : IN STD_LOGIC_VECTOR (21 DOWNTO 0);
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
  SIGNAL xt_rsc_0_7_i_adrb : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_qa : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_da : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_adra : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL xt_rsc_0_7_i_adra_d_1 : STD_LOGIC_VECTOR (21 DOWNTO 0);
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
      yt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_0_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_1_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_2_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_3_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_4_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_5_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_6_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      yt_rsc_0_7_i_clka_en_d : OUT STD_LOGIC;
      yt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_0_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_0_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_1_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_1_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_2_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_2_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_3_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_3_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_4_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_4_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_4_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_4_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_5_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_5_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_5_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_5_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_6_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_6_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_6_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_6_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_7_i_adra_d : OUT STD_LOGIC_VECTOR (21 DOWNTO 0);
      xt_rsc_0_7_i_da_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_7_i_qa_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsc_0_7_i_wea_d : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : OUT STD_LOGIC_VECTOR (1 DOWNTO
          0);
      mult_t_mul_cmp_a : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_t_mul_cmp_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mult_t_mul_cmp_z : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_dit_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_h_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_adra_d : STD_LOGIC_VECTOR (21 DOWNTO
      0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_da_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_qa_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_wea_d : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_t_mul_cmp_a : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_t_mul_cmp_b : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_mult_t_mul_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_dit_core_inst_twiddle_rsci_radr_d_pff : STD_LOGIC_VECTOR (13 DOWNTO
      0);

BEGIN
  yt_rsc_0_0_comp : work.block_dpram_rbw_dual_pkg.BLOCK_DPRAM_RBW_DUAL
    GENERIC MAP(
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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
      addr_width => 11,
      data_width => 32,
      depth => 2048,
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

  twiddle_rsci : stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
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

  twiddle_h_rsci : stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
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

  yt_rsc_0_0_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_1_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_2_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_3_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_4_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_5_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_6_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
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

  yt_rsc_0_7_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_0_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_1_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_2_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_3_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_4_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_5_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_6_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
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

  xt_rsc_0_7_i : stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
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
      mult_t_mul_cmp_a => stockham_dit_core_inst_mult_t_mul_cmp_a,
      mult_t_mul_cmp_b => stockham_dit_core_inst_mult_t_mul_cmp_b,
      mult_t_mul_cmp_z => stockham_dit_core_inst_mult_t_mul_cmp_z,
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
  mult_t_mul_cmp_a <= stockham_dit_core_inst_mult_t_mul_cmp_a;
  mult_t_mul_cmp_b <= stockham_dit_core_inst_mult_t_mul_cmp_b;
  stockham_dit_core_inst_mult_t_mul_cmp_z <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(mult_t_mul_cmp_a) * UNSIGNED(mult_t_mul_cmp_b)), 64));
  twiddle_rsci_radr_d_iff <= stockham_dit_core_inst_twiddle_rsci_radr_d_pff;

END v18;



