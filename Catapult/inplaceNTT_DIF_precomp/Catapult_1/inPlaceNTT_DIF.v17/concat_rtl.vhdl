
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

--------> ../td_ccore_solutions/modulo_dev_5aba70be30c71e06949afd4ea79f22a65a69_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Mon Aug 23 22:38:12 2021
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
  SIGNAL result_rem_12_cmp_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_a : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_result_acc_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_dcpl_1 : STD_LOGIC;
  SIGNAL and_dcpl_2 : STD_LOGIC;
  SIGNAL and_dcpl_3 : STD_LOGIC;
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL and_dcpl_8 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_13 : STD_LOGIC;
  SIGNAL and_dcpl_18 : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_34 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_37 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_39 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_41 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_43 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_47 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL and_dcpl_52 : STD_LOGIC;
  SIGNAL and_dcpl_53 : STD_LOGIC;
  SIGNAL and_dcpl_54 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_59 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_66 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_70 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL and_dcpl_74 : STD_LOGIC;
  SIGNAL and_dcpl_75 : STD_LOGIC;
  SIGNAL and_dcpl_76 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_78 : STD_LOGIC;
  SIGNAL and_dcpl_79 : STD_LOGIC;
  SIGNAL and_dcpl_80 : STD_LOGIC;
  SIGNAL and_dcpl_81 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_86 : STD_LOGIC;
  SIGNAL and_dcpl_88 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_91 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_96 : STD_LOGIC;
  SIGNAL and_dcpl_98 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_100 : STD_LOGIC;
  SIGNAL and_dcpl_101 : STD_LOGIC;
  SIGNAL and_dcpl_102 : STD_LOGIC;
  SIGNAL and_dcpl_103 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_105 : STD_LOGIC;
  SIGNAL and_dcpl_106 : STD_LOGIC;
  SIGNAL and_dcpl_107 : STD_LOGIC;
  SIGNAL and_dcpl_108 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_113 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL and_dcpl_116 : STD_LOGIC;
  SIGNAL and_dcpl_117 : STD_LOGIC;
  SIGNAL and_dcpl_118 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_120 : STD_LOGIC;
  SIGNAL and_dcpl_122 : STD_LOGIC;
  SIGNAL and_dcpl_125 : STD_LOGIC;
  SIGNAL and_dcpl_127 : STD_LOGIC;
  SIGNAL and_dcpl_128 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_130 : STD_LOGIC;
  SIGNAL and_dcpl_131 : STD_LOGIC;
  SIGNAL and_dcpl_132 : STD_LOGIC;
  SIGNAL and_dcpl_133 : STD_LOGIC;
  SIGNAL and_dcpl_134 : STD_LOGIC;
  SIGNAL and_dcpl_135 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_140 : STD_LOGIC;
  SIGNAL and_dcpl_142 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_145 : STD_LOGIC;
  SIGNAL and_dcpl_147 : STD_LOGIC;
  SIGNAL and_dcpl_149 : STD_LOGIC;
  SIGNAL and_dcpl_150 : STD_LOGIC;
  SIGNAL and_dcpl_151 : STD_LOGIC;
  SIGNAL and_dcpl_152 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_154 : STD_LOGIC;
  SIGNAL and_dcpl_155 : STD_LOGIC;
  SIGNAL and_dcpl_156 : STD_LOGIC;
  SIGNAL and_dcpl_157 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL and_dcpl_159 : STD_LOGIC;
  SIGNAL and_dcpl_160 : STD_LOGIC;
  SIGNAL and_dcpl_161 : STD_LOGIC;
  SIGNAL and_dcpl_162 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_176 : STD_LOGIC;
  SIGNAL and_dcpl_177 : STD_LOGIC;
  SIGNAL and_dcpl_178 : STD_LOGIC;
  SIGNAL and_dcpl_179 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_181 : STD_LOGIC;
  SIGNAL and_dcpl_182 : STD_LOGIC;
  SIGNAL and_dcpl_183 : STD_LOGIC;
  SIGNAL and_dcpl_184 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL and_dcpl_186 : STD_LOGIC;
  SIGNAL and_dcpl_187 : STD_LOGIC;
  SIGNAL and_dcpl_188 : STD_LOGIC;
  SIGNAL and_dcpl_189 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_194 : STD_LOGIC;
  SIGNAL and_dcpl_196 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_199 : STD_LOGIC;
  SIGNAL and_dcpl_201 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_203 : STD_LOGIC;
  SIGNAL and_dcpl_204 : STD_LOGIC;
  SIGNAL and_dcpl_205 : STD_LOGIC;
  SIGNAL and_dcpl_206 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_208 : STD_LOGIC;
  SIGNAL and_dcpl_209 : STD_LOGIC;
  SIGNAL and_dcpl_211 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_214 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_221 : STD_LOGIC;
  SIGNAL and_dcpl_228 : STD_LOGIC;
  SIGNAL and_dcpl_232 : STD_LOGIC;
  SIGNAL and_dcpl_233 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_235 : STD_LOGIC;
  SIGNAL and_dcpl_237 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_240 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_260 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_262 : STD_LOGIC;
  SIGNAL and_dcpl_263 : STD_LOGIC;
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_269 : STD_LOGIC;
  SIGNAL mux_tmp_1 : STD_LOGIC;
  SIGNAL and_dcpl_275 : STD_LOGIC;
  SIGNAL mux_tmp_3 : STD_LOGIC;
  SIGNAL mux_tmp_4 : STD_LOGIC;
  SIGNAL and_dcpl_281 : STD_LOGIC;
  SIGNAL mux_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_7 : STD_LOGIC;
  SIGNAL mux_tmp_8 : STD_LOGIC;
  SIGNAL and_dcpl_287 : STD_LOGIC;
  SIGNAL mux_tmp_10 : STD_LOGIC;
  SIGNAL mux_tmp_11 : STD_LOGIC;
  SIGNAL mux_tmp_12 : STD_LOGIC;
  SIGNAL mux_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL mux_tmp_15 : STD_LOGIC;
  SIGNAL mux_tmp_16 : STD_LOGIC;
  SIGNAL mux_tmp_17 : STD_LOGIC;
  SIGNAL mux_tmp_18 : STD_LOGIC;
  SIGNAL mux_tmp_19 : STD_LOGIC;
  SIGNAL and_dcpl_299 : STD_LOGIC;
  SIGNAL mux_tmp_21 : STD_LOGIC;
  SIGNAL mux_tmp_22 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL mux_tmp_24 : STD_LOGIC;
  SIGNAL mux_tmp_25 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL and_dcpl_305 : STD_LOGIC;
  SIGNAL mux_tmp_28 : STD_LOGIC;
  SIGNAL mux_tmp_29 : STD_LOGIC;
  SIGNAL mux_tmp_30 : STD_LOGIC;
  SIGNAL mux_tmp_31 : STD_LOGIC;
  SIGNAL mux_tmp_32 : STD_LOGIC;
  SIGNAL mux_tmp_33 : STD_LOGIC;
  SIGNAL mux_tmp_34 : STD_LOGIC;
  SIGNAL and_dcpl_311 : STD_LOGIC;
  SIGNAL and_tmp_6 : STD_LOGIC;
  SIGNAL mux_tmp_36 : STD_LOGIC;
  SIGNAL mux_tmp_37 : STD_LOGIC;
  SIGNAL and_dcpl_318 : STD_LOGIC;
  SIGNAL and_dcpl_319 : STD_LOGIC;
  SIGNAL or_tmp_102 : STD_LOGIC;
  SIGNAL and_dcpl_322 : STD_LOGIC;
  SIGNAL mux_tmp_39 : STD_LOGIC;
  SIGNAL and_dcpl_325 : STD_LOGIC;
  SIGNAL mux_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_42 : STD_LOGIC;
  SIGNAL and_dcpl_329 : STD_LOGIC;
  SIGNAL mux_tmp_44 : STD_LOGIC;
  SIGNAL mux_tmp_45 : STD_LOGIC;
  SIGNAL mux_tmp_46 : STD_LOGIC;
  SIGNAL and_dcpl_333 : STD_LOGIC;
  SIGNAL mux_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_49 : STD_LOGIC;
  SIGNAL mux_tmp_50 : STD_LOGIC;
  SIGNAL mux_tmp_51 : STD_LOGIC;
  SIGNAL and_dcpl_337 : STD_LOGIC;
  SIGNAL mux_tmp_53 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_56 : STD_LOGIC;
  SIGNAL mux_tmp_57 : STD_LOGIC;
  SIGNAL and_dcpl_341 : STD_LOGIC;
  SIGNAL mux_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_60 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_62 : STD_LOGIC;
  SIGNAL mux_tmp_63 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL and_dcpl_344 : STD_LOGIC;
  SIGNAL mux_tmp_66 : STD_LOGIC;
  SIGNAL mux_tmp_67 : STD_LOGIC;
  SIGNAL mux_tmp_68 : STD_LOGIC;
  SIGNAL mux_tmp_69 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL mux_tmp_71 : STD_LOGIC;
  SIGNAL mux_tmp_72 : STD_LOGIC;
  SIGNAL and_dcpl_347 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL mux_tmp_74 : STD_LOGIC;
  SIGNAL mux_tmp_75 : STD_LOGIC;
  SIGNAL and_dcpl_352 : STD_LOGIC;
  SIGNAL and_dcpl_353 : STD_LOGIC;
  SIGNAL or_tmp_202 : STD_LOGIC;
  SIGNAL and_dcpl_357 : STD_LOGIC;
  SIGNAL mux_tmp_77 : STD_LOGIC;
  SIGNAL and_dcpl_361 : STD_LOGIC;
  SIGNAL mux_tmp_79 : STD_LOGIC;
  SIGNAL mux_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_364 : STD_LOGIC;
  SIGNAL mux_tmp_82 : STD_LOGIC;
  SIGNAL mux_tmp_83 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL and_dcpl_367 : STD_LOGIC;
  SIGNAL mux_tmp_86 : STD_LOGIC;
  SIGNAL mux_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_88 : STD_LOGIC;
  SIGNAL mux_tmp_89 : STD_LOGIC;
  SIGNAL and_dcpl_370 : STD_LOGIC;
  SIGNAL mux_tmp_91 : STD_LOGIC;
  SIGNAL mux_tmp_92 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL mux_tmp_94 : STD_LOGIC;
  SIGNAL mux_tmp_95 : STD_LOGIC;
  SIGNAL and_dcpl_373 : STD_LOGIC;
  SIGNAL mux_tmp_97 : STD_LOGIC;
  SIGNAL mux_tmp_98 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL mux_tmp_101 : STD_LOGIC;
  SIGNAL mux_tmp_102 : STD_LOGIC;
  SIGNAL and_dcpl_377 : STD_LOGIC;
  SIGNAL mux_tmp_104 : STD_LOGIC;
  SIGNAL mux_tmp_105 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_107 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL mux_tmp_109 : STD_LOGIC;
  SIGNAL mux_tmp_110 : STD_LOGIC;
  SIGNAL and_dcpl_381 : STD_LOGIC;
  SIGNAL and_tmp_20 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL and_dcpl_386 : STD_LOGIC;
  SIGNAL and_dcpl_387 : STD_LOGIC;
  SIGNAL or_tmp_302 : STD_LOGIC;
  SIGNAL and_dcpl_390 : STD_LOGIC;
  SIGNAL mux_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL mux_tmp_118 : STD_LOGIC;
  SIGNAL and_dcpl_396 : STD_LOGIC;
  SIGNAL mux_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL mux_tmp_122 : STD_LOGIC;
  SIGNAL and_dcpl_399 : STD_LOGIC;
  SIGNAL mux_tmp_124 : STD_LOGIC;
  SIGNAL mux_tmp_125 : STD_LOGIC;
  SIGNAL mux_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_127 : STD_LOGIC;
  SIGNAL and_dcpl_402 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL mux_tmp_130 : STD_LOGIC;
  SIGNAL mux_tmp_131 : STD_LOGIC;
  SIGNAL mux_tmp_132 : STD_LOGIC;
  SIGNAL mux_tmp_133 : STD_LOGIC;
  SIGNAL and_dcpl_405 : STD_LOGIC;
  SIGNAL mux_tmp_135 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_139 : STD_LOGIC;
  SIGNAL mux_tmp_140 : STD_LOGIC;
  SIGNAL and_dcpl_408 : STD_LOGIC;
  SIGNAL mux_tmp_142 : STD_LOGIC;
  SIGNAL mux_tmp_143 : STD_LOGIC;
  SIGNAL mux_tmp_144 : STD_LOGIC;
  SIGNAL mux_tmp_145 : STD_LOGIC;
  SIGNAL mux_tmp_146 : STD_LOGIC;
  SIGNAL mux_tmp_147 : STD_LOGIC;
  SIGNAL mux_tmp_148 : STD_LOGIC;
  SIGNAL and_dcpl_411 : STD_LOGIC;
  SIGNAL and_tmp_27 : STD_LOGIC;
  SIGNAL mux_tmp_150 : STD_LOGIC;
  SIGNAL mux_tmp_151 : STD_LOGIC;
  SIGNAL and_dcpl_417 : STD_LOGIC;
  SIGNAL and_dcpl_418 : STD_LOGIC;
  SIGNAL or_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_422 : STD_LOGIC;
  SIGNAL mux_tmp_153 : STD_LOGIC;
  SIGNAL and_dcpl_426 : STD_LOGIC;
  SIGNAL mux_tmp_155 : STD_LOGIC;
  SIGNAL mux_tmp_156 : STD_LOGIC;
  SIGNAL and_dcpl_430 : STD_LOGIC;
  SIGNAL mux_tmp_158 : STD_LOGIC;
  SIGNAL mux_tmp_159 : STD_LOGIC;
  SIGNAL mux_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_433 : STD_LOGIC;
  SIGNAL mux_tmp_162 : STD_LOGIC;
  SIGNAL mux_tmp_163 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL and_dcpl_437 : STD_LOGIC;
  SIGNAL mux_tmp_167 : STD_LOGIC;
  SIGNAL mux_tmp_168 : STD_LOGIC;
  SIGNAL mux_tmp_169 : STD_LOGIC;
  SIGNAL mux_tmp_170 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL and_dcpl_441 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL mux_tmp_174 : STD_LOGIC;
  SIGNAL mux_tmp_175 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL mux_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_178 : STD_LOGIC;
  SIGNAL and_dcpl_444 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL mux_tmp_181 : STD_LOGIC;
  SIGNAL mux_tmp_182 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_186 : STD_LOGIC;
  SIGNAL and_dcpl_447 : STD_LOGIC;
  SIGNAL and_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_188 : STD_LOGIC;
  SIGNAL mux_tmp_189 : STD_LOGIC;
  SIGNAL and_dcpl_452 : STD_LOGIC;
  SIGNAL or_tmp_502 : STD_LOGIC;
  SIGNAL and_dcpl_455 : STD_LOGIC;
  SIGNAL mux_tmp_191 : STD_LOGIC;
  SIGNAL and_dcpl_458 : STD_LOGIC;
  SIGNAL mux_tmp_193 : STD_LOGIC;
  SIGNAL mux_tmp_194 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL mux_tmp_196 : STD_LOGIC;
  SIGNAL mux_tmp_197 : STD_LOGIC;
  SIGNAL mux_tmp_198 : STD_LOGIC;
  SIGNAL and_dcpl_464 : STD_LOGIC;
  SIGNAL mux_tmp_200 : STD_LOGIC;
  SIGNAL mux_tmp_201 : STD_LOGIC;
  SIGNAL mux_tmp_202 : STD_LOGIC;
  SIGNAL mux_tmp_203 : STD_LOGIC;
  SIGNAL and_dcpl_468 : STD_LOGIC;
  SIGNAL mux_tmp_205 : STD_LOGIC;
  SIGNAL mux_tmp_206 : STD_LOGIC;
  SIGNAL mux_tmp_207 : STD_LOGIC;
  SIGNAL mux_tmp_208 : STD_LOGIC;
  SIGNAL mux_tmp_209 : STD_LOGIC;
  SIGNAL and_dcpl_472 : STD_LOGIC;
  SIGNAL mux_tmp_211 : STD_LOGIC;
  SIGNAL mux_tmp_212 : STD_LOGIC;
  SIGNAL mux_tmp_213 : STD_LOGIC;
  SIGNAL mux_tmp_214 : STD_LOGIC;
  SIGNAL mux_tmp_215 : STD_LOGIC;
  SIGNAL mux_tmp_216 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL mux_tmp_218 : STD_LOGIC;
  SIGNAL mux_tmp_219 : STD_LOGIC;
  SIGNAL mux_tmp_220 : STD_LOGIC;
  SIGNAL mux_tmp_221 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_223 : STD_LOGIC;
  SIGNAL mux_tmp_224 : STD_LOGIC;
  SIGNAL and_dcpl_476 : STD_LOGIC;
  SIGNAL and_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_226 : STD_LOGIC;
  SIGNAL mux_tmp_227 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL or_tmp_602 : STD_LOGIC;
  SIGNAL and_dcpl_484 : STD_LOGIC;
  SIGNAL mux_tmp_229 : STD_LOGIC;
  SIGNAL and_dcpl_488 : STD_LOGIC;
  SIGNAL mux_tmp_231 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL and_dcpl_491 : STD_LOGIC;
  SIGNAL mux_tmp_234 : STD_LOGIC;
  SIGNAL mux_tmp_235 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL and_dcpl_493 : STD_LOGIC;
  SIGNAL mux_tmp_238 : STD_LOGIC;
  SIGNAL mux_tmp_239 : STD_LOGIC;
  SIGNAL mux_tmp_240 : STD_LOGIC;
  SIGNAL mux_tmp_241 : STD_LOGIC;
  SIGNAL and_dcpl_496 : STD_LOGIC;
  SIGNAL mux_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_244 : STD_LOGIC;
  SIGNAL mux_tmp_245 : STD_LOGIC;
  SIGNAL mux_tmp_246 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL and_dcpl_499 : STD_LOGIC;
  SIGNAL mux_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_250 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL mux_tmp_252 : STD_LOGIC;
  SIGNAL mux_tmp_253 : STD_LOGIC;
  SIGNAL mux_tmp_254 : STD_LOGIC;
  SIGNAL and_dcpl_501 : STD_LOGIC;
  SIGNAL mux_tmp_256 : STD_LOGIC;
  SIGNAL mux_tmp_257 : STD_LOGIC;
  SIGNAL mux_tmp_258 : STD_LOGIC;
  SIGNAL mux_tmp_259 : STD_LOGIC;
  SIGNAL mux_tmp_260 : STD_LOGIC;
  SIGNAL mux_tmp_261 : STD_LOGIC;
  SIGNAL mux_tmp_262 : STD_LOGIC;
  SIGNAL and_dcpl_503 : STD_LOGIC;
  SIGNAL and_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL and_dcpl_507 : STD_LOGIC;
  SIGNAL or_tmp_702 : STD_LOGIC;
  SIGNAL and_dcpl_510 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL and_dcpl_513 : STD_LOGIC;
  SIGNAL mux_tmp_269 : STD_LOGIC;
  SIGNAL mux_tmp_270 : STD_LOGIC;
  SIGNAL and_dcpl_516 : STD_LOGIC;
  SIGNAL mux_tmp_272 : STD_LOGIC;
  SIGNAL mux_tmp_273 : STD_LOGIC;
  SIGNAL mux_tmp_274 : STD_LOGIC;
  SIGNAL and_dcpl_518 : STD_LOGIC;
  SIGNAL mux_tmp_276 : STD_LOGIC;
  SIGNAL mux_tmp_277 : STD_LOGIC;
  SIGNAL mux_tmp_278 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL and_dcpl_521 : STD_LOGIC;
  SIGNAL mux_tmp_281 : STD_LOGIC;
  SIGNAL mux_tmp_282 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL mux_tmp_284 : STD_LOGIC;
  SIGNAL mux_tmp_285 : STD_LOGIC;
  SIGNAL and_dcpl_524 : STD_LOGIC;
  SIGNAL mux_tmp_287 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL mux_tmp_289 : STD_LOGIC;
  SIGNAL mux_tmp_290 : STD_LOGIC;
  SIGNAL mux_tmp_291 : STD_LOGIC;
  SIGNAL mux_tmp_292 : STD_LOGIC;
  SIGNAL and_dcpl_526 : STD_LOGIC;
  SIGNAL mux_tmp_294 : STD_LOGIC;
  SIGNAL mux_tmp_295 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL mux_tmp_297 : STD_LOGIC;
  SIGNAL mux_tmp_298 : STD_LOGIC;
  SIGNAL mux_tmp_299 : STD_LOGIC;
  SIGNAL mux_tmp_300 : STD_LOGIC;
  SIGNAL and_dcpl_528 : STD_LOGIC;
  SIGNAL and_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_302 : STD_LOGIC;
  SIGNAL mux_tmp_303 : STD_LOGIC;
  SIGNAL and_dcpl_532 : STD_LOGIC;
  SIGNAL and_dcpl_533 : STD_LOGIC;
  SIGNAL not_tmp_645 : STD_LOGIC;
  SIGNAL or_tmp_801 : STD_LOGIC;
  SIGNAL and_dcpl_536 : STD_LOGIC;
  SIGNAL mux_tmp_305 : STD_LOGIC;
  SIGNAL and_dcpl_539 : STD_LOGIC;
  SIGNAL mux_tmp_307 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL and_dcpl_542 : STD_LOGIC;
  SIGNAL mux_tmp_310 : STD_LOGIC;
  SIGNAL mux_tmp_311 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL and_dcpl_546 : STD_LOGIC;
  SIGNAL mux_tmp_314 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_316 : STD_LOGIC;
  SIGNAL mux_tmp_317 : STD_LOGIC;
  SIGNAL and_dcpl_549 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL mux_tmp_320 : STD_LOGIC;
  SIGNAL mux_tmp_321 : STD_LOGIC;
  SIGNAL mux_tmp_322 : STD_LOGIC;
  SIGNAL mux_tmp_323 : STD_LOGIC;
  SIGNAL and_dcpl_552 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL mux_tmp_327 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_329 : STD_LOGIC;
  SIGNAL mux_tmp_330 : STD_LOGIC;
  SIGNAL and_dcpl_556 : STD_LOGIC;
  SIGNAL mux_tmp_332 : STD_LOGIC;
  SIGNAL mux_tmp_333 : STD_LOGIC;
  SIGNAL mux_tmp_334 : STD_LOGIC;
  SIGNAL mux_tmp_335 : STD_LOGIC;
  SIGNAL mux_tmp_336 : STD_LOGIC;
  SIGNAL mux_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL and_dcpl_560 : STD_LOGIC;
  SIGNAL or_tmp_897 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL mux_tmp_341 : STD_LOGIC;
  SIGNAL mux_tmp_342 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL mux_tmp_344 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_347 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL and_dcpl_566 : STD_LOGIC;
  SIGNAL or_tmp_909 : STD_LOGIC;
  SIGNAL and_dcpl_568 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL and_dcpl_570 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_353 : STD_LOGIC;
  SIGNAL and_dcpl_572 : STD_LOGIC;
  SIGNAL mux_tmp_355 : STD_LOGIC;
  SIGNAL mux_tmp_356 : STD_LOGIC;
  SIGNAL mux_tmp_357 : STD_LOGIC;
  SIGNAL and_dcpl_576 : STD_LOGIC;
  SIGNAL mux_tmp_359 : STD_LOGIC;
  SIGNAL mux_tmp_360 : STD_LOGIC;
  SIGNAL mux_tmp_361 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL and_dcpl_578 : STD_LOGIC;
  SIGNAL mux_tmp_364 : STD_LOGIC;
  SIGNAL mux_tmp_365 : STD_LOGIC;
  SIGNAL mux_tmp_366 : STD_LOGIC;
  SIGNAL mux_tmp_367 : STD_LOGIC;
  SIGNAL mux_tmp_368 : STD_LOGIC;
  SIGNAL and_dcpl_580 : STD_LOGIC;
  SIGNAL mux_tmp_370 : STD_LOGIC;
  SIGNAL mux_tmp_371 : STD_LOGIC;
  SIGNAL mux_tmp_372 : STD_LOGIC;
  SIGNAL mux_tmp_373 : STD_LOGIC;
  SIGNAL mux_tmp_374 : STD_LOGIC;
  SIGNAL mux_tmp_375 : STD_LOGIC;
  SIGNAL and_dcpl_583 : STD_LOGIC;
  SIGNAL mux_tmp_377 : STD_LOGIC;
  SIGNAL mux_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_381 : STD_LOGIC;
  SIGNAL mux_tmp_382 : STD_LOGIC;
  SIGNAL mux_tmp_383 : STD_LOGIC;
  SIGNAL and_dcpl_586 : STD_LOGIC;
  SIGNAL or_tmp_1005 : STD_LOGIC;
  SIGNAL mux_tmp_385 : STD_LOGIC;
  SIGNAL mux_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL mux_tmp_388 : STD_LOGIC;
  SIGNAL mux_tmp_389 : STD_LOGIC;
  SIGNAL mux_tmp_390 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL mux_tmp_392 : STD_LOGIC;
  SIGNAL mux_tmp_393 : STD_LOGIC;
  SIGNAL and_dcpl_590 : STD_LOGIC;
  SIGNAL or_tmp_1017 : STD_LOGIC;
  SIGNAL and_dcpl_592 : STD_LOGIC;
  SIGNAL mux_tmp_395 : STD_LOGIC;
  SIGNAL and_dcpl_594 : STD_LOGIC;
  SIGNAL mux_tmp_397 : STD_LOGIC;
  SIGNAL mux_tmp_398 : STD_LOGIC;
  SIGNAL and_dcpl_596 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL mux_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_599 : STD_LOGIC;
  SIGNAL mux_tmp_404 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL mux_tmp_406 : STD_LOGIC;
  SIGNAL mux_tmp_407 : STD_LOGIC;
  SIGNAL and_dcpl_601 : STD_LOGIC;
  SIGNAL mux_tmp_409 : STD_LOGIC;
  SIGNAL mux_tmp_410 : STD_LOGIC;
  SIGNAL mux_tmp_411 : STD_LOGIC;
  SIGNAL mux_tmp_412 : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL and_dcpl_603 : STD_LOGIC;
  SIGNAL mux_tmp_415 : STD_LOGIC;
  SIGNAL mux_tmp_416 : STD_LOGIC;
  SIGNAL mux_tmp_417 : STD_LOGIC;
  SIGNAL mux_tmp_418 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL mux_tmp_420 : STD_LOGIC;
  SIGNAL and_dcpl_607 : STD_LOGIC;
  SIGNAL mux_tmp_422 : STD_LOGIC;
  SIGNAL mux_tmp_423 : STD_LOGIC;
  SIGNAL mux_tmp_424 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_426 : STD_LOGIC;
  SIGNAL mux_tmp_427 : STD_LOGIC;
  SIGNAL mux_tmp_428 : STD_LOGIC;
  SIGNAL and_dcpl_611 : STD_LOGIC;
  SIGNAL or_tmp_1113 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL mux_tmp_431 : STD_LOGIC;
  SIGNAL mux_tmp_432 : STD_LOGIC;
  SIGNAL mux_tmp_433 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_435 : STD_LOGIC;
  SIGNAL mux_tmp_436 : STD_LOGIC;
  SIGNAL mux_tmp_437 : STD_LOGIC;
  SIGNAL mux_tmp_438 : STD_LOGIC;
  SIGNAL main_stage_0_11 : STD_LOGIC;
  SIGNAL asn_itm_10 : STD_LOGIC;
  SIGNAL result_rem_11cyc_st_9 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_8 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_7 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_6 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_11 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL asn_itm_11 : STD_LOGIC;
  SIGNAL main_stage_0_12 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL asn_itm_2 : STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL asn_itm_3 : STD_LOGIC;
  SIGNAL main_stage_0_5 : STD_LOGIC;
  SIGNAL asn_itm_4 : STD_LOGIC;
  SIGNAL main_stage_0_6 : STD_LOGIC;
  SIGNAL asn_itm_5 : STD_LOGIC;
  SIGNAL main_stage_0_7 : STD_LOGIC;
  SIGNAL asn_itm_6 : STD_LOGIC;
  SIGNAL main_stage_0_8 : STD_LOGIC;
  SIGNAL asn_itm_7 : STD_LOGIC;
  SIGNAL main_stage_0_9 : STD_LOGIC;
  SIGNAL asn_itm_8 : STD_LOGIC;
  SIGNAL main_stage_0_10 : STD_LOGIC;
  SIGNAL asn_itm_9 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL result_and_1_cse : STD_LOGIC;
  SIGNAL result_and_3_cse : STD_LOGIC;
  SIGNAL result_and_5_cse : STD_LOGIC;
  SIGNAL result_and_7_cse : STD_LOGIC;
  SIGNAL result_and_9_cse : STD_LOGIC;
  SIGNAL result_and_11_cse : STD_LOGIC;
  SIGNAL result_and_13_cse : STD_LOGIC;
  SIGNAL result_and_15_cse : STD_LOGIC;
  SIGNAL result_and_17_cse : STD_LOGIC;
  SIGNAL result_and_19_cse : STD_LOGIC;
  SIGNAL result_and_21_cse : STD_LOGIC;
  SIGNAL or_3_cse : STD_LOGIC;
  SIGNAL or_8_cse : STD_LOGIC;
  SIGNAL or_15_cse : STD_LOGIC;
  SIGNAL or_24_cse : STD_LOGIC;
  SIGNAL or_35_cse : STD_LOGIC;
  SIGNAL or_48_cse : STD_LOGIC;
  SIGNAL or_63_cse : STD_LOGIC;
  SIGNAL or_107_cse : STD_LOGIC;
  SIGNAL or_112_cse : STD_LOGIC;
  SIGNAL or_119_cse : STD_LOGIC;
  SIGNAL or_128_cse : STD_LOGIC;
  SIGNAL or_139_cse : STD_LOGIC;
  SIGNAL or_152_cse : STD_LOGIC;
  SIGNAL or_167_cse : STD_LOGIC;
  SIGNAL or_209_cse : STD_LOGIC;
  SIGNAL or_214_cse : STD_LOGIC;
  SIGNAL or_221_cse : STD_LOGIC;
  SIGNAL or_230_cse : STD_LOGIC;
  SIGNAL or_241_cse : STD_LOGIC;
  SIGNAL or_254_cse : STD_LOGIC;
  SIGNAL or_269_cse : STD_LOGIC;
  SIGNAL or_311_cse : STD_LOGIC;
  SIGNAL or_316_cse : STD_LOGIC;
  SIGNAL or_323_cse : STD_LOGIC;
  SIGNAL or_332_cse : STD_LOGIC;
  SIGNAL or_343_cse : STD_LOGIC;
  SIGNAL or_356_cse : STD_LOGIC;
  SIGNAL or_371_cse : STD_LOGIC;
  SIGNAL nand_144_cse : STD_LOGIC;
  SIGNAL or_413_cse : STD_LOGIC;
  SIGNAL or_418_cse : STD_LOGIC;
  SIGNAL or_425_cse : STD_LOGIC;
  SIGNAL or_434_cse : STD_LOGIC;
  SIGNAL or_445_cse : STD_LOGIC;
  SIGNAL or_458_cse : STD_LOGIC;
  SIGNAL or_473_cse : STD_LOGIC;
  SIGNAL nand_138_cse : STD_LOGIC;
  SIGNAL or_516_cse : STD_LOGIC;
  SIGNAL or_521_cse : STD_LOGIC;
  SIGNAL or_528_cse : STD_LOGIC;
  SIGNAL or_537_cse : STD_LOGIC;
  SIGNAL and_790_cse : STD_LOGIC;
  SIGNAL or_548_cse : STD_LOGIC;
  SIGNAL or_561_cse : STD_LOGIC;
  SIGNAL or_576_cse : STD_LOGIC;
  SIGNAL nand_146_cse : STD_LOGIC;
  SIGNAL or_617_cse : STD_LOGIC;
  SIGNAL or_622_cse : STD_LOGIC;
  SIGNAL or_629_cse : STD_LOGIC;
  SIGNAL or_638_cse : STD_LOGIC;
  SIGNAL or_649_cse : STD_LOGIC;
  SIGNAL or_662_cse : STD_LOGIC;
  SIGNAL or_677_cse : STD_LOGIC;
  SIGNAL or_718_cse : STD_LOGIC;
  SIGNAL nand_112_cse : STD_LOGIC;
  SIGNAL nand_108_cse : STD_LOGIC;
  SIGNAL nand_103_cse : STD_LOGIC;
  SIGNAL nand_97_cse : STD_LOGIC;
  SIGNAL or_763_cse : STD_LOGIC;
  SIGNAL nand_83_cse : STD_LOGIC;
  SIGNAL or_818_cse : STD_LOGIC;
  SIGNAL or_823_cse : STD_LOGIC;
  SIGNAL or_830_cse : STD_LOGIC;
  SIGNAL or_839_cse : STD_LOGIC;
  SIGNAL nand_58_cse : STD_LOGIC;
  SIGNAL or_850_cse : STD_LOGIC;
  SIGNAL nand_55_cse : STD_LOGIC;
  SIGNAL or_863_cse : STD_LOGIC;
  SIGNAL nand_51_cse : STD_LOGIC;
  SIGNAL or_878_cse : STD_LOGIC;
  SIGNAL and_749_cse : STD_LOGIC;
  SIGNAL or_928_cse : STD_LOGIC;
  SIGNAL and_747_cse : STD_LOGIC;
  SIGNAL or_933_cse : STD_LOGIC;
  SIGNAL and_744_cse : STD_LOGIC;
  SIGNAL or_940_cse : STD_LOGIC;
  SIGNAL and_740_cse : STD_LOGIC;
  SIGNAL or_949_cse : STD_LOGIC;
  SIGNAL or_960_cse : STD_LOGIC;
  SIGNAL and_731_cse : STD_LOGIC;
  SIGNAL or_973_cse : STD_LOGIC;
  SIGNAL and_725_cse : STD_LOGIC;
  SIGNAL nand_42_cse : STD_LOGIC;
  SIGNAL or_988_cse : STD_LOGIC;
  SIGNAL or_1037_cse : STD_LOGIC;
  SIGNAL or_1042_cse : STD_LOGIC;
  SIGNAL or_1049_cse : STD_LOGIC;
  SIGNAL or_1058_cse : STD_LOGIC;
  SIGNAL or_1069_cse : STD_LOGIC;
  SIGNAL or_1082_cse : STD_LOGIC;
  SIGNAL or_1097_cse : STD_LOGIC;
  SIGNAL base_buf_sva_mut_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_1_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_1_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_2_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_2_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_3_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_3_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_4_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_4_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_5_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_5_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_6_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_6_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_7_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_7_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_8_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_8_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_9_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_9_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_buf_sva_mut_10_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_mut_10_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_11cyc_st_10 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL return_rsci_d_mx0c0 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c1 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c2 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c3 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c4 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c5 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c6 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c7 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c8 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c9 : STD_LOGIC;
  SIGNAL return_rsci_d_mx0c10 : STD_LOGIC;
  SIGNAL result_acc_imod_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL result_acc_idiv_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL m_and_cse : STD_LOGIC;
  SIGNAL m_and_1_cse : STD_LOGIC;
  SIGNAL m_and_2_cse : STD_LOGIC;
  SIGNAL m_and_3_cse : STD_LOGIC;
  SIGNAL m_and_4_cse : STD_LOGIC;
  SIGNAL m_and_5_cse : STD_LOGIC;
  SIGNAL m_and_6_cse : STD_LOGIC;
  SIGNAL m_and_7_cse : STD_LOGIC;
  SIGNAL m_and_8_cse : STD_LOGIC;
  SIGNAL m_and_9_cse : STD_LOGIC;
  SIGNAL m_and_10_cse : STD_LOGIC;
  SIGNAL m_and_11_cse : STD_LOGIC;
  SIGNAL m_and_12_cse : STD_LOGIC;
  SIGNAL m_and_13_cse : STD_LOGIC;
  SIGNAL m_and_14_cse : STD_LOGIC;
  SIGNAL m_and_15_cse : STD_LOGIC;
  SIGNAL m_and_16_cse : STD_LOGIC;
  SIGNAL m_and_17_cse : STD_LOGIC;
  SIGNAL m_and_18_cse : STD_LOGIC;
  SIGNAL m_and_19_cse : STD_LOGIC;
  SIGNAL m_and_20_cse : STD_LOGIC;
  SIGNAL m_and_21_cse : STD_LOGIC;
  SIGNAL m_and_22_cse : STD_LOGIC;
  SIGNAL m_and_23_cse : STD_LOGIC;
  SIGNAL m_and_24_cse : STD_LOGIC;
  SIGNAL m_and_25_cse : STD_LOGIC;
  SIGNAL m_and_26_cse : STD_LOGIC;
  SIGNAL m_and_27_cse : STD_LOGIC;
  SIGNAL m_and_28_cse : STD_LOGIC;
  SIGNAL m_and_29_cse : STD_LOGIC;
  SIGNAL m_and_30_cse : STD_LOGIC;
  SIGNAL m_and_31_cse : STD_LOGIC;
  SIGNAL m_and_32_cse : STD_LOGIC;
  SIGNAL m_and_33_cse : STD_LOGIC;
  SIGNAL m_and_34_cse : STD_LOGIC;
  SIGNAL m_and_35_cse : STD_LOGIC;
  SIGNAL m_and_36_cse : STD_LOGIC;
  SIGNAL m_and_37_cse : STD_LOGIC;
  SIGNAL m_and_38_cse : STD_LOGIC;
  SIGNAL m_and_39_cse : STD_LOGIC;
  SIGNAL m_and_40_cse : STD_LOGIC;
  SIGNAL m_and_41_cse : STD_LOGIC;
  SIGNAL m_and_42_cse : STD_LOGIC;
  SIGNAL m_and_43_cse : STD_LOGIC;
  SIGNAL m_and_44_cse : STD_LOGIC;
  SIGNAL m_and_45_cse : STD_LOGIC;
  SIGNAL m_and_46_cse : STD_LOGIC;
  SIGNAL m_and_47_cse : STD_LOGIC;
  SIGNAL m_and_48_cse : STD_LOGIC;
  SIGNAL m_and_49_cse : STD_LOGIC;
  SIGNAL m_and_50_cse : STD_LOGIC;
  SIGNAL m_and_51_cse : STD_LOGIC;
  SIGNAL m_and_52_cse : STD_LOGIC;
  SIGNAL m_and_53_cse : STD_LOGIC;
  SIGNAL m_and_54_cse : STD_LOGIC;
  SIGNAL m_and_55_cse : STD_LOGIC;
  SIGNAL m_and_56_cse : STD_LOGIC;
  SIGNAL m_and_57_cse : STD_LOGIC;
  SIGNAL m_and_58_cse : STD_LOGIC;
  SIGNAL m_and_59_cse : STD_LOGIC;
  SIGNAL m_and_60_cse : STD_LOGIC;
  SIGNAL m_and_61_cse : STD_LOGIC;
  SIGNAL m_and_62_cse : STD_LOGIC;
  SIGNAL m_and_63_cse : STD_LOGIC;
  SIGNAL m_and_64_cse : STD_LOGIC;
  SIGNAL m_and_65_cse : STD_LOGIC;
  SIGNAL m_and_66_cse : STD_LOGIC;
  SIGNAL m_and_67_cse : STD_LOGIC;
  SIGNAL m_and_68_cse : STD_LOGIC;
  SIGNAL m_and_69_cse : STD_LOGIC;
  SIGNAL m_and_70_cse : STD_LOGIC;
  SIGNAL m_and_71_cse : STD_LOGIC;
  SIGNAL m_and_72_cse : STD_LOGIC;
  SIGNAL m_and_73_cse : STD_LOGIC;
  SIGNAL m_and_74_cse : STD_LOGIC;
  SIGNAL m_and_75_cse : STD_LOGIC;
  SIGNAL m_and_76_cse : STD_LOGIC;
  SIGNAL m_and_77_cse : STD_LOGIC;
  SIGNAL m_and_78_cse : STD_LOGIC;
  SIGNAL m_and_79_cse : STD_LOGIC;
  SIGNAL m_and_80_cse : STD_LOGIC;
  SIGNAL m_and_81_cse : STD_LOGIC;
  SIGNAL m_and_82_cse : STD_LOGIC;
  SIGNAL m_and_83_cse : STD_LOGIC;
  SIGNAL m_and_84_cse : STD_LOGIC;
  SIGNAL m_and_85_cse : STD_LOGIC;
  SIGNAL m_and_86_cse : STD_LOGIC;
  SIGNAL m_and_87_cse : STD_LOGIC;
  SIGNAL m_and_88_cse : STD_LOGIC;
  SIGNAL m_and_89_cse : STD_LOGIC;
  SIGNAL m_and_90_cse : STD_LOGIC;
  SIGNAL m_and_91_cse : STD_LOGIC;
  SIGNAL m_and_92_cse : STD_LOGIC;
  SIGNAL m_and_93_cse : STD_LOGIC;
  SIGNAL m_and_94_cse : STD_LOGIC;
  SIGNAL m_and_95_cse : STD_LOGIC;
  SIGNAL m_and_96_cse : STD_LOGIC;
  SIGNAL m_and_97_cse : STD_LOGIC;
  SIGNAL m_and_98_cse : STD_LOGIC;

  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_691_nl : STD_LOGIC;
  SIGNAL nor_690_nl : STD_LOGIC;
  SIGNAL or_10_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL nor_689_nl : STD_LOGIC;
  SIGNAL nor_687_nl : STD_LOGIC;
  SIGNAL or_17_nl : STD_LOGIC;
  SIGNAL nor_688_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL nor_686_nl : STD_LOGIC;
  SIGNAL nor_683_nl : STD_LOGIC;
  SIGNAL or_26_nl : STD_LOGIC;
  SIGNAL nor_684_nl : STD_LOGIC;
  SIGNAL nor_685_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL nor_682_nl : STD_LOGIC;
  SIGNAL nor_678_nl : STD_LOGIC;
  SIGNAL or_37_nl : STD_LOGIC;
  SIGNAL nor_679_nl : STD_LOGIC;
  SIGNAL nor_680_nl : STD_LOGIC;
  SIGNAL nor_681_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL nor_677_nl : STD_LOGIC;
  SIGNAL nor_672_nl : STD_LOGIC;
  SIGNAL or_50_nl : STD_LOGIC;
  SIGNAL nor_673_nl : STD_LOGIC;
  SIGNAL nor_674_nl : STD_LOGIC;
  SIGNAL nor_675_nl : STD_LOGIC;
  SIGNAL nor_676_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL nor_671_nl : STD_LOGIC;
  SIGNAL nor_665_nl : STD_LOGIC;
  SIGNAL or_65_nl : STD_LOGIC;
  SIGNAL nor_666_nl : STD_LOGIC;
  SIGNAL nor_667_nl : STD_LOGIC;
  SIGNAL nor_668_nl : STD_LOGIC;
  SIGNAL nor_669_nl : STD_LOGIC;
  SIGNAL nor_670_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL nor_664_nl : STD_LOGIC;
  SIGNAL nor_656_nl : STD_LOGIC;
  SIGNAL or_82_nl : STD_LOGIC;
  SIGNAL or_80_nl : STD_LOGIC;
  SIGNAL nor_657_nl : STD_LOGIC;
  SIGNAL nor_658_nl : STD_LOGIC;
  SIGNAL nor_659_nl : STD_LOGIC;
  SIGNAL nor_660_nl : STD_LOGIC;
  SIGNAL nor_661_nl : STD_LOGIC;
  SIGNAL nor_662_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL nor_663_nl : STD_LOGIC;
  SIGNAL nor_654_nl : STD_LOGIC;
  SIGNAL nor_655_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL nor_653_nl : STD_LOGIC;
  SIGNAL nor_652_nl : STD_LOGIC;
  SIGNAL or_114_nl : STD_LOGIC;
  SIGNAL mux_40_nl : STD_LOGIC;
  SIGNAL nor_651_nl : STD_LOGIC;
  SIGNAL nor_649_nl : STD_LOGIC;
  SIGNAL or_121_nl : STD_LOGIC;
  SIGNAL nor_650_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL nor_648_nl : STD_LOGIC;
  SIGNAL nor_645_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL nor_646_nl : STD_LOGIC;
  SIGNAL nor_647_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL nor_644_nl : STD_LOGIC;
  SIGNAL nor_640_nl : STD_LOGIC;
  SIGNAL or_141_nl : STD_LOGIC;
  SIGNAL nor_641_nl : STD_LOGIC;
  SIGNAL nor_642_nl : STD_LOGIC;
  SIGNAL nor_643_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL nor_639_nl : STD_LOGIC;
  SIGNAL nor_634_nl : STD_LOGIC;
  SIGNAL or_154_nl : STD_LOGIC;
  SIGNAL nor_635_nl : STD_LOGIC;
  SIGNAL nor_636_nl : STD_LOGIC;
  SIGNAL nor_637_nl : STD_LOGIC;
  SIGNAL nor_638_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nor_633_nl : STD_LOGIC;
  SIGNAL nor_627_nl : STD_LOGIC;
  SIGNAL or_169_nl : STD_LOGIC;
  SIGNAL nor_628_nl : STD_LOGIC;
  SIGNAL nor_629_nl : STD_LOGIC;
  SIGNAL nor_630_nl : STD_LOGIC;
  SIGNAL nor_631_nl : STD_LOGIC;
  SIGNAL nor_632_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL nor_626_nl : STD_LOGIC;
  SIGNAL nor_618_nl : STD_LOGIC;
  SIGNAL or_186_nl : STD_LOGIC;
  SIGNAL or_184_nl : STD_LOGIC;
  SIGNAL nor_619_nl : STD_LOGIC;
  SIGNAL nor_620_nl : STD_LOGIC;
  SIGNAL nor_621_nl : STD_LOGIC;
  SIGNAL nor_622_nl : STD_LOGIC;
  SIGNAL nor_623_nl : STD_LOGIC;
  SIGNAL nor_624_nl : STD_LOGIC;
  SIGNAL mux_73_nl : STD_LOGIC;
  SIGNAL nor_625_nl : STD_LOGIC;
  SIGNAL nor_617_nl : STD_LOGIC;
  SIGNAL and_797_nl : STD_LOGIC;
  SIGNAL or_195_nl : STD_LOGIC;
  SIGNAL mux_76_nl : STD_LOGIC;
  SIGNAL nor_616_nl : STD_LOGIC;
  SIGNAL nor_615_nl : STD_LOGIC;
  SIGNAL or_216_nl : STD_LOGIC;
  SIGNAL mux_78_nl : STD_LOGIC;
  SIGNAL nor_614_nl : STD_LOGIC;
  SIGNAL nor_612_nl : STD_LOGIC;
  SIGNAL or_223_nl : STD_LOGIC;
  SIGNAL nor_613_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nor_611_nl : STD_LOGIC;
  SIGNAL nor_608_nl : STD_LOGIC;
  SIGNAL or_232_nl : STD_LOGIC;
  SIGNAL nor_609_nl : STD_LOGIC;
  SIGNAL nor_610_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL nor_607_nl : STD_LOGIC;
  SIGNAL nor_603_nl : STD_LOGIC;
  SIGNAL or_243_nl : STD_LOGIC;
  SIGNAL nor_604_nl : STD_LOGIC;
  SIGNAL nor_605_nl : STD_LOGIC;
  SIGNAL nor_606_nl : STD_LOGIC;
  SIGNAL mux_90_nl : STD_LOGIC;
  SIGNAL nor_602_nl : STD_LOGIC;
  SIGNAL nor_597_nl : STD_LOGIC;
  SIGNAL or_256_nl : STD_LOGIC;
  SIGNAL nor_598_nl : STD_LOGIC;
  SIGNAL nor_599_nl : STD_LOGIC;
  SIGNAL nor_600_nl : STD_LOGIC;
  SIGNAL nor_601_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nor_596_nl : STD_LOGIC;
  SIGNAL nor_590_nl : STD_LOGIC;
  SIGNAL or_271_nl : STD_LOGIC;
  SIGNAL nor_591_nl : STD_LOGIC;
  SIGNAL nor_592_nl : STD_LOGIC;
  SIGNAL nor_593_nl : STD_LOGIC;
  SIGNAL nor_594_nl : STD_LOGIC;
  SIGNAL nor_595_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL nor_589_nl : STD_LOGIC;
  SIGNAL nor_581_nl : STD_LOGIC;
  SIGNAL or_288_nl : STD_LOGIC;
  SIGNAL or_286_nl : STD_LOGIC;
  SIGNAL nor_582_nl : STD_LOGIC;
  SIGNAL nor_583_nl : STD_LOGIC;
  SIGNAL nor_584_nl : STD_LOGIC;
  SIGNAL nor_585_nl : STD_LOGIC;
  SIGNAL nor_586_nl : STD_LOGIC;
  SIGNAL nor_587_nl : STD_LOGIC;
  SIGNAL mux_111_nl : STD_LOGIC;
  SIGNAL nor_588_nl : STD_LOGIC;
  SIGNAL nor_579_nl : STD_LOGIC;
  SIGNAL nor_580_nl : STD_LOGIC;
  SIGNAL mux_114_nl : STD_LOGIC;
  SIGNAL nor_578_nl : STD_LOGIC;
  SIGNAL nor_577_nl : STD_LOGIC;
  SIGNAL or_318_nl : STD_LOGIC;
  SIGNAL mux_116_nl : STD_LOGIC;
  SIGNAL nor_576_nl : STD_LOGIC;
  SIGNAL nor_574_nl : STD_LOGIC;
  SIGNAL or_325_nl : STD_LOGIC;
  SIGNAL nor_575_nl : STD_LOGIC;
  SIGNAL mux_119_nl : STD_LOGIC;
  SIGNAL nor_573_nl : STD_LOGIC;
  SIGNAL nor_570_nl : STD_LOGIC;
  SIGNAL or_334_nl : STD_LOGIC;
  SIGNAL nor_571_nl : STD_LOGIC;
  SIGNAL nor_572_nl : STD_LOGIC;
  SIGNAL mux_123_nl : STD_LOGIC;
  SIGNAL nor_569_nl : STD_LOGIC;
  SIGNAL nor_565_nl : STD_LOGIC;
  SIGNAL or_345_nl : STD_LOGIC;
  SIGNAL nor_566_nl : STD_LOGIC;
  SIGNAL nor_567_nl : STD_LOGIC;
  SIGNAL nor_568_nl : STD_LOGIC;
  SIGNAL mux_128_nl : STD_LOGIC;
  SIGNAL nor_564_nl : STD_LOGIC;
  SIGNAL nor_559_nl : STD_LOGIC;
  SIGNAL or_358_nl : STD_LOGIC;
  SIGNAL nor_560_nl : STD_LOGIC;
  SIGNAL nor_561_nl : STD_LOGIC;
  SIGNAL nor_562_nl : STD_LOGIC;
  SIGNAL nor_563_nl : STD_LOGIC;
  SIGNAL mux_134_nl : STD_LOGIC;
  SIGNAL nor_558_nl : STD_LOGIC;
  SIGNAL nor_552_nl : STD_LOGIC;
  SIGNAL or_373_nl : STD_LOGIC;
  SIGNAL nor_553_nl : STD_LOGIC;
  SIGNAL nor_554_nl : STD_LOGIC;
  SIGNAL nor_555_nl : STD_LOGIC;
  SIGNAL nor_556_nl : STD_LOGIC;
  SIGNAL nor_557_nl : STD_LOGIC;
  SIGNAL mux_141_nl : STD_LOGIC;
  SIGNAL nor_551_nl : STD_LOGIC;
  SIGNAL nor_543_nl : STD_LOGIC;
  SIGNAL or_390_nl : STD_LOGIC;
  SIGNAL or_388_nl : STD_LOGIC;
  SIGNAL nor_544_nl : STD_LOGIC;
  SIGNAL nor_545_nl : STD_LOGIC;
  SIGNAL nor_546_nl : STD_LOGIC;
  SIGNAL nor_547_nl : STD_LOGIC;
  SIGNAL nor_548_nl : STD_LOGIC;
  SIGNAL nor_549_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL nor_550_nl : STD_LOGIC;
  SIGNAL nor_542_nl : STD_LOGIC;
  SIGNAL and_796_nl : STD_LOGIC;
  SIGNAL or_399_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL and_795_nl : STD_LOGIC;
  SIGNAL nor_541_nl : STD_LOGIC;
  SIGNAL or_420_nl : STD_LOGIC;
  SIGNAL mux_154_nl : STD_LOGIC;
  SIGNAL and_794_nl : STD_LOGIC;
  SIGNAL nor_539_nl : STD_LOGIC;
  SIGNAL or_427_nl : STD_LOGIC;
  SIGNAL nor_540_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_793_nl : STD_LOGIC;
  SIGNAL nor_536_nl : STD_LOGIC;
  SIGNAL or_436_nl : STD_LOGIC;
  SIGNAL nor_537_nl : STD_LOGIC;
  SIGNAL nor_538_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL and_792_nl : STD_LOGIC;
  SIGNAL nor_532_nl : STD_LOGIC;
  SIGNAL or_447_nl : STD_LOGIC;
  SIGNAL nor_533_nl : STD_LOGIC;
  SIGNAL nor_534_nl : STD_LOGIC;
  SIGNAL nor_535_nl : STD_LOGIC;
  SIGNAL mux_166_nl : STD_LOGIC;
  SIGNAL and_791_nl : STD_LOGIC;
  SIGNAL nor_527_nl : STD_LOGIC;
  SIGNAL or_460_nl : STD_LOGIC;
  SIGNAL nor_528_nl : STD_LOGIC;
  SIGNAL nor_529_nl : STD_LOGIC;
  SIGNAL nor_530_nl : STD_LOGIC;
  SIGNAL nor_531_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_789_nl : STD_LOGIC;
  SIGNAL nor_522_nl : STD_LOGIC;
  SIGNAL or_475_nl : STD_LOGIC;
  SIGNAL and_788_nl : STD_LOGIC;
  SIGNAL nor_523_nl : STD_LOGIC;
  SIGNAL nor_524_nl : STD_LOGIC;
  SIGNAL nor_525_nl : STD_LOGIC;
  SIGNAL nor_526_nl : STD_LOGIC;
  SIGNAL mux_179_nl : STD_LOGIC;
  SIGNAL and_787_nl : STD_LOGIC;
  SIGNAL nor_516_nl : STD_LOGIC;
  SIGNAL or_492_nl : STD_LOGIC;
  SIGNAL or_490_nl : STD_LOGIC;
  SIGNAL nor_517_nl : STD_LOGIC;
  SIGNAL and_785_nl : STD_LOGIC;
  SIGNAL nor_518_nl : STD_LOGIC;
  SIGNAL nor_519_nl : STD_LOGIC;
  SIGNAL nor_520_nl : STD_LOGIC;
  SIGNAL nor_521_nl : STD_LOGIC;
  SIGNAL mux_187_nl : STD_LOGIC;
  SIGNAL and_786_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL nor_515_nl : STD_LOGIC;
  SIGNAL or_501_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL and_784_nl : STD_LOGIC;
  SIGNAL nor_513_nl : STD_LOGIC;
  SIGNAL or_523_nl : STD_LOGIC;
  SIGNAL mux_192_nl : STD_LOGIC;
  SIGNAL and_783_nl : STD_LOGIC;
  SIGNAL nor_511_nl : STD_LOGIC;
  SIGNAL or_530_nl : STD_LOGIC;
  SIGNAL nor_512_nl : STD_LOGIC;
  SIGNAL mux_195_nl : STD_LOGIC;
  SIGNAL and_782_nl : STD_LOGIC;
  SIGNAL nor_508_nl : STD_LOGIC;
  SIGNAL or_539_nl : STD_LOGIC;
  SIGNAL nor_509_nl : STD_LOGIC;
  SIGNAL nor_510_nl : STD_LOGIC;
  SIGNAL mux_199_nl : STD_LOGIC;
  SIGNAL and_781_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL nor_507_nl : STD_LOGIC;
  SIGNAL mux_204_nl : STD_LOGIC;
  SIGNAL and_780_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL or_563_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_778_nl : STD_LOGIC;
  SIGNAL nor_494_nl : STD_LOGIC;
  SIGNAL or_578_nl : STD_LOGIC;
  SIGNAL and_777_nl : STD_LOGIC;
  SIGNAL nor_495_nl : STD_LOGIC;
  SIGNAL nor_496_nl : STD_LOGIC;
  SIGNAL nor_497_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL and_776_nl : STD_LOGIC;
  SIGNAL nor_488_nl : STD_LOGIC;
  SIGNAL or_595_nl : STD_LOGIC;
  SIGNAL or_593_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL and_774_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL nor_492_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL mux_225_nl : STD_LOGIC;
  SIGNAL and_775_nl : STD_LOGIC;
  SIGNAL nor_487_nl : STD_LOGIC;
  SIGNAL and_773_nl : STD_LOGIC;
  SIGNAL or_604_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL and_772_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL and_771_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL or_631_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL and_770_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL or_640_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL and_769_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL or_651_nl : STD_LOGIC;
  SIGNAL nor_478_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL and_768_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL or_664_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL nor_474_nl : STD_LOGIC;
  SIGNAL nor_475_nl : STD_LOGIC;
  SIGNAL nor_476_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL and_766_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL or_679_nl : STD_LOGIC;
  SIGNAL and_765_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL and_764_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL or_696_nl : STD_LOGIC;
  SIGNAL or_694_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL and_762_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL nor_465_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL and_763_nl : STD_LOGIC;
  SIGNAL nor_459_nl : STD_LOGIC;
  SIGNAL nor_460_nl : STD_LOGIC;
  SIGNAL or_705_nl : STD_LOGIC;
  SIGNAL mux_266_nl : STD_LOGIC;
  SIGNAL and_761_nl : STD_LOGIC;
  SIGNAL nor_458_nl : STD_LOGIC;
  SIGNAL nand_153_nl : STD_LOGIC;
  SIGNAL mux_268_nl : STD_LOGIC;
  SIGNAL and_760_nl : STD_LOGIC;
  SIGNAL nor_456_nl : STD_LOGIC;
  SIGNAL nand_152_nl : STD_LOGIC;
  SIGNAL nor_457_nl : STD_LOGIC;
  SIGNAL mux_271_nl : STD_LOGIC;
  SIGNAL and_759_nl : STD_LOGIC;
  SIGNAL nor_453_nl : STD_LOGIC;
  SIGNAL nand_151_nl : STD_LOGIC;
  SIGNAL nor_454_nl : STD_LOGIC;
  SIGNAL nor_455_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL and_758_nl : STD_LOGIC;
  SIGNAL nor_449_nl : STD_LOGIC;
  SIGNAL nand_96_nl : STD_LOGIC;
  SIGNAL nor_450_nl : STD_LOGIC;
  SIGNAL nor_451_nl : STD_LOGIC;
  SIGNAL nor_452_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL and_757_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL nand_150_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL nor_446_nl : STD_LOGIC;
  SIGNAL nor_447_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL and_755_nl : STD_LOGIC;
  SIGNAL nor_439_nl : STD_LOGIC;
  SIGNAL nand_149_nl : STD_LOGIC;
  SIGNAL and_754_nl : STD_LOGIC;
  SIGNAL nor_440_nl : STD_LOGIC;
  SIGNAL nor_441_nl : STD_LOGIC;
  SIGNAL nor_442_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL mux_293_nl : STD_LOGIC;
  SIGNAL and_753_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL nand_72_nl : STD_LOGIC;
  SIGNAL nand_73_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL and_751_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL nor_437_nl : STD_LOGIC;
  SIGNAL nor_438_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL and_752_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL and_750_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL or_825_nl : STD_LOGIC;
  SIGNAL mux_306_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL or_832_nl : STD_LOGIC;
  SIGNAL and_748_nl : STD_LOGIC;
  SIGNAL mux_309_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL or_841_nl : STD_LOGIC;
  SIGNAL and_745_nl : STD_LOGIC;
  SIGNAL and_746_nl : STD_LOGIC;
  SIGNAL mux_313_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL nor_424_nl : STD_LOGIC;
  SIGNAL or_852_nl : STD_LOGIC;
  SIGNAL and_741_nl : STD_LOGIC;
  SIGNAL and_742_nl : STD_LOGIC;
  SIGNAL and_743_nl : STD_LOGIC;
  SIGNAL mux_318_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL or_865_nl : STD_LOGIC;
  SIGNAL and_736_nl : STD_LOGIC;
  SIGNAL and_737_nl : STD_LOGIC;
  SIGNAL and_738_nl : STD_LOGIC;
  SIGNAL and_739_nl : STD_LOGIC;
  SIGNAL mux_324_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL or_880_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL and_732_nl : STD_LOGIC;
  SIGNAL and_733_nl : STD_LOGIC;
  SIGNAL and_734_nl : STD_LOGIC;
  SIGNAL and_735_nl : STD_LOGIC;
  SIGNAL mux_331_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL or_897_nl : STD_LOGIC;
  SIGNAL or_895_nl : STD_LOGIC;
  SIGNAL and_726_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL and_727_nl : STD_LOGIC;
  SIGNAL and_728_nl : STD_LOGIC;
  SIGNAL and_729_nl : STD_LOGIC;
  SIGNAL and_730_nl : STD_LOGIC;
  SIGNAL mux_339_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL or_914_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL or_913_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL or_912_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL or_911_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL or_910_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL or_909_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL or_908_nl : STD_LOGIC;
  SIGNAL and_724_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL mux_349_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL or_935_nl : STD_LOGIC;
  SIGNAL mux_351_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL or_942_nl : STD_LOGIC;
  SIGNAL and_722_nl : STD_LOGIC;
  SIGNAL mux_354_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL or_951_nl : STD_LOGIC;
  SIGNAL and_719_nl : STD_LOGIC;
  SIGNAL and_720_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL or_962_nl : STD_LOGIC;
  SIGNAL and_715_nl : STD_LOGIC;
  SIGNAL and_716_nl : STD_LOGIC;
  SIGNAL and_717_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL or_975_nl : STD_LOGIC;
  SIGNAL and_710_nl : STD_LOGIC;
  SIGNAL and_711_nl : STD_LOGIC;
  SIGNAL and_712_nl : STD_LOGIC;
  SIGNAL and_713_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL or_990_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL and_706_nl : STD_LOGIC;
  SIGNAL and_707_nl : STD_LOGIC;
  SIGNAL and_708_nl : STD_LOGIC;
  SIGNAL and_709_nl : STD_LOGIC;
  SIGNAL mux_376_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL or_1007_nl : STD_LOGIC;
  SIGNAL or_1005_nl : STD_LOGIC;
  SIGNAL and_700_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL and_701_nl : STD_LOGIC;
  SIGNAL and_702_nl : STD_LOGIC;
  SIGNAL and_703_nl : STD_LOGIC;
  SIGNAL and_704_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL or_1024_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL or_1023_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL or_1022_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL or_1021_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL or_1020_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL or_1019_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL or_1018_nl : STD_LOGIC;
  SIGNAL and_697_nl : STD_LOGIC;
  SIGNAL and_698_nl : STD_LOGIC;
  SIGNAL or_1016_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL or_1044_nl : STD_LOGIC;
  SIGNAL mux_396_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL or_1051_nl : STD_LOGIC;
  SIGNAL and_695_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL or_1060_nl : STD_LOGIC;
  SIGNAL and_692_nl : STD_LOGIC;
  SIGNAL and_693_nl : STD_LOGIC;
  SIGNAL mux_403_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL or_1071_nl : STD_LOGIC;
  SIGNAL and_688_nl : STD_LOGIC;
  SIGNAL and_689_nl : STD_LOGIC;
  SIGNAL and_690_nl : STD_LOGIC;
  SIGNAL mux_408_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL or_1084_nl : STD_LOGIC;
  SIGNAL and_683_nl : STD_LOGIC;
  SIGNAL and_684_nl : STD_LOGIC;
  SIGNAL and_685_nl : STD_LOGIC;
  SIGNAL and_686_nl : STD_LOGIC;
  SIGNAL mux_414_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL or_1099_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL and_679_nl : STD_LOGIC;
  SIGNAL and_680_nl : STD_LOGIC;
  SIGNAL and_681_nl : STD_LOGIC;
  SIGNAL and_682_nl : STD_LOGIC;
  SIGNAL mux_421_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL or_1116_nl : STD_LOGIC;
  SIGNAL or_1114_nl : STD_LOGIC;
  SIGNAL and_673_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL and_674_nl : STD_LOGIC;
  SIGNAL and_675_nl : STD_LOGIC;
  SIGNAL and_676_nl : STD_LOGIC;
  SIGNAL and_677_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL or_1133_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL or_1132_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL or_1131_nl : STD_LOGIC;
  SIGNAL nor_361_nl : STD_LOGIC;
  SIGNAL or_1130_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL or_1129_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL or_1128_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL or_1127_nl : STD_LOGIC;
  SIGNAL and_671_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL result_rem_12_cmp_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_1_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_1_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_2_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_2_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_3_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_3_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_4_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_4_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_5_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_5_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_6_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_6_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_7_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_7_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_8_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_8_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_9_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_9_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL result_rem_12_cmp_10_a_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_b_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL result_rem_12_cmp_10_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_64_11_2(input_10 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(10 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
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

  result_rem_12_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_a_1,
      b => result_rem_12_cmp_b_1,
      z => result_rem_12_cmp_z_1
    );
  result_rem_12_cmp_a_1 <= result_rem_12_cmp_a;
  result_rem_12_cmp_b_1 <= result_rem_12_cmp_b;
  result_rem_12_cmp_z <= result_rem_12_cmp_z_1;

  result_rem_12_cmp_1 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_1_a_1,
      b => result_rem_12_cmp_1_b_1,
      z => result_rem_12_cmp_1_z_1
    );
  result_rem_12_cmp_1_a_1 <= result_rem_12_cmp_1_a;
  result_rem_12_cmp_1_b_1 <= result_rem_12_cmp_1_b;
  result_rem_12_cmp_1_z <= result_rem_12_cmp_1_z_1;

  result_rem_12_cmp_2 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_2_a_1,
      b => result_rem_12_cmp_2_b_1,
      z => result_rem_12_cmp_2_z_1
    );
  result_rem_12_cmp_2_a_1 <= result_rem_12_cmp_2_a;
  result_rem_12_cmp_2_b_1 <= result_rem_12_cmp_2_b;
  result_rem_12_cmp_2_z <= result_rem_12_cmp_2_z_1;

  result_rem_12_cmp_3 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_3_a_1,
      b => result_rem_12_cmp_3_b_1,
      z => result_rem_12_cmp_3_z_1
    );
  result_rem_12_cmp_3_a_1 <= result_rem_12_cmp_3_a;
  result_rem_12_cmp_3_b_1 <= result_rem_12_cmp_3_b;
  result_rem_12_cmp_3_z <= result_rem_12_cmp_3_z_1;

  result_rem_12_cmp_4 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_4_a_1,
      b => result_rem_12_cmp_4_b_1,
      z => result_rem_12_cmp_4_z_1
    );
  result_rem_12_cmp_4_a_1 <= result_rem_12_cmp_4_a;
  result_rem_12_cmp_4_b_1 <= result_rem_12_cmp_4_b;
  result_rem_12_cmp_4_z <= result_rem_12_cmp_4_z_1;

  result_rem_12_cmp_5 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_5_a_1,
      b => result_rem_12_cmp_5_b_1,
      z => result_rem_12_cmp_5_z_1
    );
  result_rem_12_cmp_5_a_1 <= result_rem_12_cmp_5_a;
  result_rem_12_cmp_5_b_1 <= result_rem_12_cmp_5_b;
  result_rem_12_cmp_5_z <= result_rem_12_cmp_5_z_1;

  result_rem_12_cmp_6 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_6_a_1,
      b => result_rem_12_cmp_6_b_1,
      z => result_rem_12_cmp_6_z_1
    );
  result_rem_12_cmp_6_a_1 <= result_rem_12_cmp_6_a;
  result_rem_12_cmp_6_b_1 <= result_rem_12_cmp_6_b;
  result_rem_12_cmp_6_z <= result_rem_12_cmp_6_z_1;

  result_rem_12_cmp_7 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_7_a_1,
      b => result_rem_12_cmp_7_b_1,
      z => result_rem_12_cmp_7_z_1
    );
  result_rem_12_cmp_7_a_1 <= result_rem_12_cmp_7_a;
  result_rem_12_cmp_7_b_1 <= result_rem_12_cmp_7_b;
  result_rem_12_cmp_7_z <= result_rem_12_cmp_7_z_1;

  result_rem_12_cmp_8 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_8_a_1,
      b => result_rem_12_cmp_8_b_1,
      z => result_rem_12_cmp_8_z_1
    );
  result_rem_12_cmp_8_a_1 <= result_rem_12_cmp_8_a;
  result_rem_12_cmp_8_b_1 <= result_rem_12_cmp_8_b;
  result_rem_12_cmp_8_z <= result_rem_12_cmp_8_z_1;

  result_rem_12_cmp_9 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_9_a_1,
      b => result_rem_12_cmp_9_b_1,
      z => result_rem_12_cmp_9_z_1
    );
  result_rem_12_cmp_9_a_1 <= result_rem_12_cmp_9_a;
  result_rem_12_cmp_9_b_1 <= result_rem_12_cmp_9_b;
  result_rem_12_cmp_9_z <= result_rem_12_cmp_9_z_1;

  result_rem_12_cmp_10 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 64,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => result_rem_12_cmp_10_a_1,
      b => result_rem_12_cmp_10_b_1,
      z => result_rem_12_cmp_10_z_1
    );
  result_rem_12_cmp_10_a_1 <= result_rem_12_cmp_10_a;
  result_rem_12_cmp_10_b_1 <= result_rem_12_cmp_10_b;
  result_rem_12_cmp_10_z <= result_rem_12_cmp_10_z_1;

  result_and_1_cse <= ccs_ccore_en AND (and_dcpl_263 OR and_dcpl_269 OR and_dcpl_275
      OR and_dcpl_281 OR and_dcpl_287 OR and_dcpl_293 OR and_dcpl_299 OR and_dcpl_305
      OR and_dcpl_311 OR mux_tmp_37);
  result_and_3_cse <= ccs_ccore_en AND (and_dcpl_319 OR and_dcpl_322 OR and_dcpl_325
      OR and_dcpl_329 OR and_dcpl_333 OR and_dcpl_337 OR and_dcpl_341 OR and_dcpl_344
      OR and_dcpl_347 OR mux_tmp_75);
  result_and_5_cse <= ccs_ccore_en AND (and_dcpl_353 OR and_dcpl_357 OR and_dcpl_361
      OR and_dcpl_364 OR and_dcpl_367 OR and_dcpl_370 OR and_dcpl_373 OR and_dcpl_377
      OR and_dcpl_381 OR mux_tmp_113);
  result_and_7_cse <= ccs_ccore_en AND (and_dcpl_387 OR and_dcpl_390 OR and_dcpl_393
      OR and_dcpl_396 OR and_dcpl_399 OR and_dcpl_402 OR and_dcpl_405 OR and_dcpl_408
      OR and_dcpl_411 OR mux_tmp_151);
  result_and_9_cse <= ccs_ccore_en AND (and_dcpl_418 OR and_dcpl_422 OR and_dcpl_426
      OR and_dcpl_430 OR and_dcpl_433 OR and_dcpl_437 OR and_dcpl_441 OR and_dcpl_444
      OR and_dcpl_447 OR mux_tmp_189);
  result_and_11_cse <= ccs_ccore_en AND (and_dcpl_452 OR and_dcpl_455 OR and_dcpl_458
      OR and_dcpl_462 OR and_dcpl_464 OR and_dcpl_468 OR and_dcpl_472 OR and_dcpl_474
      OR and_dcpl_476 OR mux_tmp_227);
  result_and_13_cse <= ccs_ccore_en AND (and_dcpl_480 OR and_dcpl_484 OR and_dcpl_488
      OR and_dcpl_491 OR and_dcpl_493 OR and_dcpl_496 OR and_dcpl_499 OR and_dcpl_501
      OR and_dcpl_503 OR mux_tmp_265);
  result_and_15_cse <= ccs_ccore_en AND (and_dcpl_507 OR and_dcpl_510 OR and_dcpl_513
      OR and_dcpl_516 OR and_dcpl_518 OR and_dcpl_521 OR and_dcpl_524 OR and_dcpl_526
      OR and_dcpl_528 OR mux_tmp_303);
  result_and_17_cse <= ccs_ccore_en AND (and_dcpl_533 OR and_dcpl_536 OR and_dcpl_539
      OR and_dcpl_542 OR and_dcpl_546 OR and_dcpl_549 OR and_dcpl_552 OR and_dcpl_556
      OR and_dcpl_560 OR mux_tmp_348);
  result_and_19_cse <= ccs_ccore_en AND (and_dcpl_566 OR and_dcpl_568 OR and_dcpl_570
      OR and_dcpl_572 OR and_dcpl_576 OR and_dcpl_578 OR and_dcpl_580 OR and_dcpl_583
      OR and_dcpl_586 OR mux_tmp_393);
  result_and_21_cse <= ccs_ccore_en AND (and_dcpl_590 OR and_dcpl_592 OR and_dcpl_594
      OR and_dcpl_596 OR and_dcpl_599 OR and_dcpl_601 OR and_dcpl_603 OR and_dcpl_607
      OR and_dcpl_611 OR mux_tmp_438);
  m_and_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_2;
  m_and_1_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_6;
  m_and_2_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_9;
  m_and_3_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_11;
  m_and_4_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_2;
  m_and_5_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_6;
  m_and_6_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_9;
  m_and_7_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_11;
  m_and_8_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (NOT (result_rem_11cyc_st_9(0)));
  m_and_9_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (result_rem_11cyc_st_9(0));
  m_and_10_cse <= ccs_ccore_en AND and_dcpl_4 AND (result_rem_11cyc_st_9(3)) AND
      (result_rem_11cyc_st_9(1)) AND (NOT (result_rem_11cyc_st_9(0)));
  m_and_11_cse <= ccs_ccore_en AND and_dcpl_30;
  m_and_12_cse <= ccs_ccore_en AND and_dcpl_32;
  m_and_13_cse <= ccs_ccore_en AND and_dcpl_35;
  m_and_14_cse <= ccs_ccore_en AND and_dcpl_37;
  m_and_15_cse <= ccs_ccore_en AND and_dcpl_39;
  m_and_16_cse <= ccs_ccore_en AND and_dcpl_40;
  m_and_17_cse <= ccs_ccore_en AND and_dcpl_41;
  m_and_18_cse <= ccs_ccore_en AND and_dcpl_42;
  m_and_19_cse <= ccs_ccore_en AND and_dcpl_45;
  m_and_20_cse <= ccs_ccore_en AND and_dcpl_47;
  m_and_21_cse <= ccs_ccore_en AND and_dcpl_50;
  m_and_22_cse <= ccs_ccore_en AND and_dcpl_55;
  m_and_23_cse <= ccs_ccore_en AND and_dcpl_58;
  m_and_24_cse <= ccs_ccore_en AND and_dcpl_60;
  m_and_25_cse <= ccs_ccore_en AND and_dcpl_62;
  m_and_26_cse <= ccs_ccore_en AND and_dcpl_65;
  m_and_27_cse <= ccs_ccore_en AND and_dcpl_68;
  m_and_28_cse <= ccs_ccore_en AND and_dcpl_70;
  m_and_29_cse <= ccs_ccore_en AND and_dcpl_72;
  m_and_30_cse <= ccs_ccore_en AND and_dcpl_74;
  m_and_31_cse <= ccs_ccore_en AND and_dcpl_75;
  m_and_32_cse <= ccs_ccore_en AND and_dcpl_76;
  m_and_33_cse <= ccs_ccore_en AND and_dcpl_81;
  m_and_34_cse <= ccs_ccore_en AND and_dcpl_84;
  m_and_35_cse <= ccs_ccore_en AND and_dcpl_86;
  m_and_36_cse <= ccs_ccore_en AND and_dcpl_88;
  m_and_37_cse <= ccs_ccore_en AND and_dcpl_91;
  m_and_38_cse <= ccs_ccore_en AND and_dcpl_94;
  m_and_39_cse <= ccs_ccore_en AND and_dcpl_96;
  m_and_40_cse <= ccs_ccore_en AND and_dcpl_98;
  m_and_41_cse <= ccs_ccore_en AND and_dcpl_100;
  m_and_42_cse <= ccs_ccore_en AND and_dcpl_101;
  m_and_43_cse <= ccs_ccore_en AND and_dcpl_102;
  m_and_44_cse <= ccs_ccore_en AND and_dcpl_107;
  m_and_45_cse <= ccs_ccore_en AND and_dcpl_110;
  m_and_46_cse <= ccs_ccore_en AND and_dcpl_112;
  m_and_47_cse <= ccs_ccore_en AND and_dcpl_114;
  m_and_48_cse <= ccs_ccore_en AND and_dcpl_116;
  m_and_49_cse <= ccs_ccore_en AND and_dcpl_117;
  m_and_50_cse <= ccs_ccore_en AND and_dcpl_118;
  m_and_51_cse <= ccs_ccore_en AND and_dcpl_119;
  m_and_52_cse <= ccs_ccore_en AND and_dcpl_122;
  m_and_53_cse <= ccs_ccore_en AND and_dcpl_125;
  m_and_54_cse <= ccs_ccore_en AND and_dcpl_127;
  m_and_55_cse <= ccs_ccore_en AND and_dcpl_132;
  m_and_56_cse <= ccs_ccore_en AND and_dcpl_135;
  m_and_57_cse <= ccs_ccore_en AND and_dcpl_137;
  m_and_58_cse <= ccs_ccore_en AND and_dcpl_139;
  m_and_59_cse <= ccs_ccore_en AND and_dcpl_142;
  m_and_60_cse <= ccs_ccore_en AND and_dcpl_145;
  m_and_61_cse <= ccs_ccore_en AND and_dcpl_147;
  m_and_62_cse <= ccs_ccore_en AND and_dcpl_149;
  m_and_63_cse <= ccs_ccore_en AND and_dcpl_151;
  m_and_64_cse <= ccs_ccore_en AND and_dcpl_152;
  m_and_65_cse <= ccs_ccore_en AND and_dcpl_153;
  m_and_66_cse <= ccs_ccore_en AND and_dcpl_158;
  m_and_67_cse <= ccs_ccore_en AND and_dcpl_160;
  m_and_68_cse <= ccs_ccore_en AND and_dcpl_163;
  m_and_69_cse <= ccs_ccore_en AND and_dcpl_165;
  m_and_70_cse <= ccs_ccore_en AND and_dcpl_168;
  m_and_71_cse <= ccs_ccore_en AND and_dcpl_170;
  m_and_72_cse <= ccs_ccore_en AND and_dcpl_173;
  m_and_73_cse <= ccs_ccore_en AND and_dcpl_175;
  m_and_74_cse <= ccs_ccore_en AND and_dcpl_177;
  m_and_75_cse <= ccs_ccore_en AND and_dcpl_178;
  m_and_76_cse <= ccs_ccore_en AND and_dcpl_179;
  m_and_77_cse <= ccs_ccore_en AND and_dcpl_184;
  m_and_78_cse <= ccs_ccore_en AND and_dcpl_186;
  m_and_79_cse <= ccs_ccore_en AND and_dcpl_189;
  m_and_80_cse <= ccs_ccore_en AND and_dcpl_191;
  m_and_81_cse <= ccs_ccore_en AND and_dcpl_194;
  m_and_82_cse <= ccs_ccore_en AND and_dcpl_196;
  m_and_83_cse <= ccs_ccore_en AND and_dcpl_199;
  m_and_84_cse <= ccs_ccore_en AND and_dcpl_201;
  m_and_85_cse <= ccs_ccore_en AND and_dcpl_203;
  m_and_86_cse <= ccs_ccore_en AND and_dcpl_204;
  m_and_87_cse <= ccs_ccore_en AND and_dcpl_205;
  m_and_88_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_207;
  m_and_89_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_212;
  m_and_90_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_214;
  m_and_91_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_211 AND (result_rem_11cyc(1));
  m_and_92_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_218 AND (NOT (result_rem_11cyc(1)));
  m_and_93_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_221 AND (NOT (result_rem_11cyc(1)));
  m_and_94_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_218 AND (result_rem_11cyc(1));
  m_and_95_cse <= ccs_ccore_en AND and_dcpl_209 AND and_dcpl_221 AND (result_rem_11cyc(1));
  m_and_96_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_207;
  m_and_97_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_212;
  m_and_98_cse <= ccs_ccore_en AND and_dcpl_228 AND and_dcpl_214;
  result_result_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_SIGNED(CONV_SIGNED(result_acc_imod_1(3),
      1),2)), 2), 4) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(result_acc_imod_1(2 DOWNTO
      0)), 3), 4), 4));
  result_acc_imod_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(result_acc_idiv_1(2
      DOWNTO 0)), 3), 4) + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED((NOT (result_acc_idiv_1(3)))
      & STD_LOGIC_VECTOR'( "00")), 3), 4) + CONV_SIGNED(CONV_SIGNED(SIGNED(STD_LOGIC_VECTOR'(
      "10") & (result_acc_idiv_1(3))), 3), 4), 4));
  result_acc_idiv_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(result_rem_11cyc)
      + UNSIGNED'( "0001"), 4));
  and_dcpl_1 <= NOT((result_rem_11cyc_st_9(3)) OR (result_rem_11cyc_st_9(1)));
  and_dcpl_2 <= and_dcpl_1 AND (NOT (result_rem_11cyc_st_9(0)));
  and_dcpl_3 <= main_stage_0_10 AND asn_itm_9;
  and_dcpl_4 <= and_dcpl_3 AND (NOT (result_rem_11cyc_st_9(2)));
  and_dcpl_6 <= and_dcpl_1 AND (result_rem_11cyc_st_9(0));
  and_dcpl_8 <= (NOT (result_rem_11cyc_st_9(3))) AND (result_rem_11cyc_st_9(1));
  and_dcpl_9 <= and_dcpl_8 AND (NOT (result_rem_11cyc_st_9(0)));
  and_dcpl_11 <= and_dcpl_8 AND (result_rem_11cyc_st_9(0));
  and_dcpl_13 <= and_dcpl_3 AND (result_rem_11cyc_st_9(2));
  and_dcpl_18 <= (result_rem_11cyc_st_9(3)) AND (NOT (result_rem_11cyc_st_9(1)));
  and_dcpl_26 <= NOT((result_rem_11cyc_st_8(3)) OR (result_rem_11cyc_st_8(1)));
  and_dcpl_27 <= and_dcpl_26 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_28 <= main_stage_0_9 AND asn_itm_8;
  and_dcpl_29 <= and_dcpl_28 AND (NOT (result_rem_11cyc_st_8(2)));
  and_dcpl_30 <= and_dcpl_29 AND and_dcpl_27;
  and_dcpl_31 <= and_dcpl_26 AND (result_rem_11cyc_st_8(0));
  and_dcpl_32 <= and_dcpl_29 AND and_dcpl_31;
  and_dcpl_33 <= (NOT (result_rem_11cyc_st_8(3))) AND (result_rem_11cyc_st_8(1));
  and_dcpl_34 <= and_dcpl_33 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_35 <= and_dcpl_29 AND and_dcpl_34;
  and_dcpl_36 <= and_dcpl_33 AND (result_rem_11cyc_st_8(0));
  and_dcpl_37 <= and_dcpl_29 AND and_dcpl_36;
  and_dcpl_38 <= and_dcpl_28 AND (result_rem_11cyc_st_8(2));
  and_dcpl_39 <= and_dcpl_38 AND and_dcpl_27;
  and_dcpl_40 <= and_dcpl_38 AND and_dcpl_31;
  and_dcpl_41 <= and_dcpl_38 AND and_dcpl_34;
  and_dcpl_42 <= and_dcpl_38 AND and_dcpl_36;
  and_dcpl_43 <= (result_rem_11cyc_st_8(3)) AND (NOT (result_rem_11cyc_st_8(1)));
  and_dcpl_45 <= and_dcpl_29 AND and_dcpl_43 AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_47 <= and_dcpl_29 AND and_dcpl_43 AND (result_rem_11cyc_st_8(0));
  and_dcpl_50 <= and_dcpl_29 AND (result_rem_11cyc_st_8(3)) AND (result_rem_11cyc_st_8(1))
      AND (NOT (result_rem_11cyc_st_8(0)));
  and_dcpl_51 <= NOT((result_rem_11cyc_st_7(2)) OR (result_rem_11cyc_st_7(0)));
  and_dcpl_52 <= and_dcpl_51 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_53 <= main_stage_0_8 AND asn_itm_7;
  and_dcpl_54 <= and_dcpl_53 AND (NOT (result_rem_11cyc_st_7(3)));
  and_dcpl_55 <= and_dcpl_54 AND and_dcpl_52;
  and_dcpl_56 <= (NOT (result_rem_11cyc_st_7(2))) AND (result_rem_11cyc_st_7(0));
  and_dcpl_57 <= and_dcpl_56 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_58 <= and_dcpl_54 AND and_dcpl_57;
  and_dcpl_59 <= and_dcpl_51 AND (result_rem_11cyc_st_7(1));
  and_dcpl_60 <= and_dcpl_54 AND and_dcpl_59;
  and_dcpl_62 <= and_dcpl_54 AND and_dcpl_56 AND (result_rem_11cyc_st_7(1));
  and_dcpl_63 <= (result_rem_11cyc_st_7(2)) AND (NOT (result_rem_11cyc_st_7(0)));
  and_dcpl_65 <= and_dcpl_54 AND and_dcpl_63 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_66 <= (result_rem_11cyc_st_7(2)) AND (result_rem_11cyc_st_7(0));
  and_dcpl_68 <= and_dcpl_54 AND and_dcpl_66 AND (NOT (result_rem_11cyc_st_7(1)));
  and_dcpl_70 <= and_dcpl_54 AND and_dcpl_63 AND (result_rem_11cyc_st_7(1));
  and_dcpl_72 <= and_dcpl_54 AND and_dcpl_66 AND (result_rem_11cyc_st_7(1));
  and_dcpl_73 <= and_dcpl_53 AND (result_rem_11cyc_st_7(3));
  and_dcpl_74 <= and_dcpl_73 AND and_dcpl_52;
  and_dcpl_75 <= and_dcpl_73 AND and_dcpl_57;
  and_dcpl_76 <= and_dcpl_73 AND and_dcpl_59;
  and_dcpl_77 <= NOT((result_rem_11cyc_st_6(2)) OR (result_rem_11cyc_st_6(0)));
  and_dcpl_78 <= and_dcpl_77 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_79 <= main_stage_0_7 AND asn_itm_6;
  and_dcpl_80 <= and_dcpl_79 AND (NOT (result_rem_11cyc_st_6(3)));
  and_dcpl_81 <= and_dcpl_80 AND and_dcpl_78;
  and_dcpl_82 <= (NOT (result_rem_11cyc_st_6(2))) AND (result_rem_11cyc_st_6(0));
  and_dcpl_83 <= and_dcpl_82 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_84 <= and_dcpl_80 AND and_dcpl_83;
  and_dcpl_85 <= and_dcpl_77 AND (result_rem_11cyc_st_6(1));
  and_dcpl_86 <= and_dcpl_80 AND and_dcpl_85;
  and_dcpl_88 <= and_dcpl_80 AND and_dcpl_82 AND (result_rem_11cyc_st_6(1));
  and_dcpl_89 <= (result_rem_11cyc_st_6(2)) AND (NOT (result_rem_11cyc_st_6(0)));
  and_dcpl_91 <= and_dcpl_80 AND and_dcpl_89 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_92 <= (result_rem_11cyc_st_6(2)) AND (result_rem_11cyc_st_6(0));
  and_dcpl_94 <= and_dcpl_80 AND and_dcpl_92 AND (NOT (result_rem_11cyc_st_6(1)));
  and_dcpl_96 <= and_dcpl_80 AND and_dcpl_89 AND (result_rem_11cyc_st_6(1));
  and_dcpl_98 <= and_dcpl_80 AND and_dcpl_92 AND (result_rem_11cyc_st_6(1));
  and_dcpl_99 <= and_dcpl_79 AND (result_rem_11cyc_st_6(3));
  and_dcpl_100 <= and_dcpl_99 AND and_dcpl_78;
  and_dcpl_101 <= and_dcpl_99 AND and_dcpl_83;
  and_dcpl_102 <= and_dcpl_99 AND and_dcpl_85;
  and_dcpl_103 <= NOT((result_rem_11cyc_st_5(3)) OR (result_rem_11cyc_st_5(0)));
  and_dcpl_104 <= and_dcpl_103 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_105 <= main_stage_0_6 AND asn_itm_5;
  and_dcpl_106 <= and_dcpl_105 AND (NOT (result_rem_11cyc_st_5(2)));
  and_dcpl_107 <= and_dcpl_106 AND and_dcpl_104;
  and_dcpl_108 <= (NOT (result_rem_11cyc_st_5(3))) AND (result_rem_11cyc_st_5(0));
  and_dcpl_109 <= and_dcpl_108 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_110 <= and_dcpl_106 AND and_dcpl_109;
  and_dcpl_111 <= and_dcpl_103 AND (result_rem_11cyc_st_5(1));
  and_dcpl_112 <= and_dcpl_106 AND and_dcpl_111;
  and_dcpl_113 <= and_dcpl_108 AND (result_rem_11cyc_st_5(1));
  and_dcpl_114 <= and_dcpl_106 AND and_dcpl_113;
  and_dcpl_115 <= and_dcpl_105 AND (result_rem_11cyc_st_5(2));
  and_dcpl_116 <= and_dcpl_115 AND and_dcpl_104;
  and_dcpl_117 <= and_dcpl_115 AND and_dcpl_109;
  and_dcpl_118 <= and_dcpl_115 AND and_dcpl_111;
  and_dcpl_119 <= and_dcpl_115 AND and_dcpl_113;
  and_dcpl_120 <= (result_rem_11cyc_st_5(3)) AND (NOT (result_rem_11cyc_st_5(0)));
  and_dcpl_122 <= and_dcpl_106 AND and_dcpl_120 AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_125 <= and_dcpl_106 AND (result_rem_11cyc_st_5(3)) AND (result_rem_11cyc_st_5(0))
      AND (NOT (result_rem_11cyc_st_5(1)));
  and_dcpl_127 <= and_dcpl_106 AND and_dcpl_120 AND (result_rem_11cyc_st_5(1));
  and_dcpl_128 <= NOT((result_rem_11cyc_st_4(2)) OR (result_rem_11cyc_st_4(0)));
  and_dcpl_129 <= and_dcpl_128 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_130 <= main_stage_0_5 AND asn_itm_4;
  and_dcpl_131 <= and_dcpl_130 AND (NOT (result_rem_11cyc_st_4(3)));
  and_dcpl_132 <= and_dcpl_131 AND and_dcpl_129;
  and_dcpl_133 <= (NOT (result_rem_11cyc_st_4(2))) AND (result_rem_11cyc_st_4(0));
  and_dcpl_134 <= and_dcpl_133 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_135 <= and_dcpl_131 AND and_dcpl_134;
  and_dcpl_136 <= and_dcpl_128 AND (result_rem_11cyc_st_4(1));
  and_dcpl_137 <= and_dcpl_131 AND and_dcpl_136;
  and_dcpl_139 <= and_dcpl_131 AND and_dcpl_133 AND (result_rem_11cyc_st_4(1));
  and_dcpl_140 <= (result_rem_11cyc_st_4(2)) AND (NOT (result_rem_11cyc_st_4(0)));
  and_dcpl_142 <= and_dcpl_131 AND and_dcpl_140 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_143 <= (result_rem_11cyc_st_4(2)) AND (result_rem_11cyc_st_4(0));
  and_dcpl_145 <= and_dcpl_131 AND and_dcpl_143 AND (NOT (result_rem_11cyc_st_4(1)));
  and_dcpl_147 <= and_dcpl_131 AND and_dcpl_140 AND (result_rem_11cyc_st_4(1));
  and_dcpl_149 <= and_dcpl_131 AND and_dcpl_143 AND (result_rem_11cyc_st_4(1));
  and_dcpl_150 <= and_dcpl_130 AND (result_rem_11cyc_st_4(3));
  and_dcpl_151 <= and_dcpl_150 AND and_dcpl_129;
  and_dcpl_152 <= and_dcpl_150 AND and_dcpl_134;
  and_dcpl_153 <= and_dcpl_150 AND and_dcpl_136;
  and_dcpl_154 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_155 <= and_dcpl_154 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_156 <= main_stage_0_4 AND asn_itm_3;
  and_dcpl_157 <= and_dcpl_156 AND (NOT (result_rem_11cyc_st_3(3)));
  and_dcpl_158 <= and_dcpl_157 AND and_dcpl_155;
  and_dcpl_159 <= and_dcpl_154 AND (result_rem_11cyc_st_3(0));
  and_dcpl_160 <= and_dcpl_157 AND and_dcpl_159;
  and_dcpl_161 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_162 <= and_dcpl_161 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_163 <= and_dcpl_157 AND and_dcpl_162;
  and_dcpl_165 <= and_dcpl_157 AND and_dcpl_161 AND (result_rem_11cyc_st_3(0));
  and_dcpl_166 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_168 <= and_dcpl_157 AND and_dcpl_166 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_170 <= and_dcpl_157 AND and_dcpl_166 AND (result_rem_11cyc_st_3(0));
  and_dcpl_171 <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_173 <= and_dcpl_157 AND and_dcpl_171 AND (NOT (result_rem_11cyc_st_3(0)));
  and_dcpl_175 <= and_dcpl_157 AND and_dcpl_171 AND (result_rem_11cyc_st_3(0));
  and_dcpl_176 <= and_dcpl_156 AND (result_rem_11cyc_st_3(3));
  and_dcpl_177 <= and_dcpl_176 AND and_dcpl_155;
  and_dcpl_178 <= and_dcpl_176 AND and_dcpl_159;
  and_dcpl_179 <= and_dcpl_176 AND and_dcpl_162;
  and_dcpl_180 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_181 <= and_dcpl_180 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_182 <= main_stage_0_3 AND asn_itm_2;
  and_dcpl_183 <= and_dcpl_182 AND (NOT (result_rem_11cyc_st_2(3)));
  and_dcpl_184 <= and_dcpl_183 AND and_dcpl_181;
  and_dcpl_185 <= and_dcpl_180 AND (result_rem_11cyc_st_2(0));
  and_dcpl_186 <= and_dcpl_183 AND and_dcpl_185;
  and_dcpl_187 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_188 <= and_dcpl_187 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_189 <= and_dcpl_183 AND and_dcpl_188;
  and_dcpl_191 <= and_dcpl_183 AND and_dcpl_187 AND (result_rem_11cyc_st_2(0));
  and_dcpl_192 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_194 <= and_dcpl_183 AND and_dcpl_192 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_196 <= and_dcpl_183 AND and_dcpl_192 AND (result_rem_11cyc_st_2(0));
  and_dcpl_197 <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_199 <= and_dcpl_183 AND and_dcpl_197 AND (NOT (result_rem_11cyc_st_2(0)));
  and_dcpl_201 <= and_dcpl_183 AND and_dcpl_197 AND (result_rem_11cyc_st_2(0));
  and_dcpl_202 <= and_dcpl_182 AND (result_rem_11cyc_st_2(3));
  and_dcpl_203 <= and_dcpl_202 AND and_dcpl_181;
  and_dcpl_204 <= and_dcpl_202 AND and_dcpl_185;
  and_dcpl_205 <= and_dcpl_202 AND and_dcpl_188;
  and_dcpl_206 <= NOT((result_rem_11cyc(2)) OR (result_rem_11cyc(0)));
  and_dcpl_207 <= and_dcpl_206 AND (NOT (result_rem_11cyc(1)));
  and_dcpl_208 <= main_stage_0_2 AND asn_itm_1;
  and_dcpl_209 <= and_dcpl_208 AND (NOT (result_rem_11cyc(3)));
  and_dcpl_211 <= (NOT (result_rem_11cyc(2))) AND (result_rem_11cyc(0));
  and_dcpl_212 <= and_dcpl_211 AND (NOT (result_rem_11cyc(1)));
  and_dcpl_214 <= and_dcpl_206 AND (result_rem_11cyc(1));
  and_dcpl_218 <= (result_rem_11cyc(2)) AND (NOT (result_rem_11cyc(0)));
  and_dcpl_221 <= (result_rem_11cyc(2)) AND (result_rem_11cyc(0));
  and_dcpl_228 <= and_dcpl_208 AND (result_rem_11cyc(3));
  and_dcpl_232 <= NOT(CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_233 <= and_dcpl_232 AND (NOT (result_rem_11cyc_st_11(0)));
  and_dcpl_234 <= main_stage_0_12 AND asn_itm_11;
  and_dcpl_235 <= and_dcpl_234 AND (NOT (result_rem_11cyc_st_11(3)));
  and_dcpl_237 <= and_dcpl_232 AND (result_rem_11cyc_st_11(0));
  and_dcpl_239 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_240 <= and_dcpl_239 AND (NOT (result_rem_11cyc_st_11(0)));
  and_dcpl_244 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_249 <= CONV_SL_1_1(result_rem_11cyc_st_11(2 DOWNTO 1)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_254 <= and_dcpl_234 AND (result_rem_11cyc_st_11(3));
  and_dcpl_260 <= NOT(CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_261 <= ccs_ccore_start_rsci_idat AND (NOT (result_result_acc_tmp(2)));
  and_dcpl_262 <= and_dcpl_261 AND (NOT (result_result_acc_tmp(3)));
  and_dcpl_263 <= and_dcpl_262 AND and_dcpl_260;
  or_tmp_2 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0000")) OR (NOT and_dcpl_208);
  or_3_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0000"));
  nor_691_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_2));
  mux_nl <= MUX_s_1_2_2(nor_691_nl, or_tmp_2, or_3_cse);
  and_dcpl_269 <= mux_nl AND and_dcpl_184;
  or_8_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0000"));
  nor_690_nl <= NOT(and_dcpl_208 OR and_dcpl_184);
  or_10_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_182);
  mux_tmp_1 <= MUX_s_1_2_2(nor_690_nl, or_10_nl, or_8_cse);
  nor_689_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_1));
  mux_2_nl <= MUX_s_1_2_2(nor_689_nl, mux_tmp_1, or_3_cse);
  and_dcpl_275 <= mux_2_nl AND and_dcpl_158;
  or_15_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000"));
  nor_687_nl <= NOT(and_dcpl_182 OR and_dcpl_158);
  or_17_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_156);
  mux_tmp_3 <= MUX_s_1_2_2(nor_687_nl, or_17_nl, or_15_cse);
  nor_688_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_3));
  mux_tmp_4 <= MUX_s_1_2_2(nor_688_nl, mux_tmp_3, or_8_cse);
  nor_686_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_4));
  mux_5_nl <= MUX_s_1_2_2(nor_686_nl, mux_tmp_4, or_3_cse);
  and_dcpl_281 <= mux_5_nl AND and_dcpl_132;
  or_24_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000"));
  nor_683_nl <= NOT(and_dcpl_156 OR and_dcpl_132);
  or_26_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_130);
  mux_tmp_6 <= MUX_s_1_2_2(nor_683_nl, or_26_nl, or_24_cse);
  nor_684_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_6));
  mux_tmp_7 <= MUX_s_1_2_2(nor_684_nl, mux_tmp_6, or_15_cse);
  nor_685_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_7));
  mux_tmp_8 <= MUX_s_1_2_2(nor_685_nl, mux_tmp_7, or_8_cse);
  nor_682_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_8));
  mux_9_nl <= MUX_s_1_2_2(nor_682_nl, mux_tmp_8, or_3_cse);
  and_dcpl_287 <= mux_9_nl AND and_dcpl_107;
  or_35_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000"));
  nor_678_nl <= NOT(and_dcpl_130 OR and_dcpl_107);
  or_37_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_105);
  mux_tmp_10 <= MUX_s_1_2_2(nor_678_nl, or_37_nl, or_35_cse);
  nor_679_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_10));
  mux_tmp_11 <= MUX_s_1_2_2(nor_679_nl, mux_tmp_10, or_24_cse);
  nor_680_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_11));
  mux_tmp_12 <= MUX_s_1_2_2(nor_680_nl, mux_tmp_11, or_15_cse);
  nor_681_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_12));
  mux_tmp_13 <= MUX_s_1_2_2(nor_681_nl, mux_tmp_12, or_8_cse);
  nor_677_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_13));
  mux_14_nl <= MUX_s_1_2_2(nor_677_nl, mux_tmp_13, or_3_cse);
  and_dcpl_293 <= mux_14_nl AND and_dcpl_81;
  or_48_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000"));
  nor_672_nl <= NOT(and_dcpl_105 OR and_dcpl_81);
  or_50_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_79);
  mux_tmp_15 <= MUX_s_1_2_2(nor_672_nl, or_50_nl, or_48_cse);
  nor_673_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_15));
  mux_tmp_16 <= MUX_s_1_2_2(nor_673_nl, mux_tmp_15, or_35_cse);
  nor_674_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_16));
  mux_tmp_17 <= MUX_s_1_2_2(nor_674_nl, mux_tmp_16, or_24_cse);
  nor_675_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_17));
  mux_tmp_18 <= MUX_s_1_2_2(nor_675_nl, mux_tmp_17, or_15_cse);
  nor_676_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_18));
  mux_tmp_19 <= MUX_s_1_2_2(nor_676_nl, mux_tmp_18, or_8_cse);
  nor_671_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_19));
  mux_20_nl <= MUX_s_1_2_2(nor_671_nl, mux_tmp_19, or_3_cse);
  and_dcpl_299 <= mux_20_nl AND and_dcpl_55;
  or_63_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000"));
  nor_665_nl <= NOT(and_dcpl_79 OR and_dcpl_55);
  or_65_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_53);
  mux_tmp_21 <= MUX_s_1_2_2(nor_665_nl, or_65_nl, or_63_cse);
  nor_666_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_21));
  mux_tmp_22 <= MUX_s_1_2_2(nor_666_nl, mux_tmp_21, or_48_cse);
  nor_667_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_22));
  mux_tmp_23 <= MUX_s_1_2_2(nor_667_nl, mux_tmp_22, or_35_cse);
  nor_668_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_23));
  mux_tmp_24 <= MUX_s_1_2_2(nor_668_nl, mux_tmp_23, or_24_cse);
  nor_669_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_24));
  mux_tmp_25 <= MUX_s_1_2_2(nor_669_nl, mux_tmp_24, or_15_cse);
  nor_670_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_25));
  mux_tmp_26 <= MUX_s_1_2_2(nor_670_nl, mux_tmp_25, or_8_cse);
  nor_664_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_26));
  mux_27_nl <= MUX_s_1_2_2(nor_664_nl, mux_tmp_26, or_3_cse);
  and_dcpl_305 <= mux_27_nl AND and_dcpl_30;
  nor_656_nl <= NOT(and_dcpl_53 OR and_dcpl_30);
  or_82_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0000")) OR (NOT
      and_dcpl_28);
  or_80_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000"));
  mux_tmp_28 <= MUX_s_1_2_2(nor_656_nl, or_82_nl, or_80_nl);
  nor_657_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_28));
  mux_tmp_29 <= MUX_s_1_2_2(nor_657_nl, mux_tmp_28, or_63_cse);
  nor_658_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_29));
  mux_tmp_30 <= MUX_s_1_2_2(nor_658_nl, mux_tmp_29, or_48_cse);
  nor_659_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_30));
  mux_tmp_31 <= MUX_s_1_2_2(nor_659_nl, mux_tmp_30, or_35_cse);
  nor_660_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_31));
  mux_tmp_32 <= MUX_s_1_2_2(nor_660_nl, mux_tmp_31, or_24_cse);
  nor_661_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_32));
  mux_tmp_33 <= MUX_s_1_2_2(nor_661_nl, mux_tmp_32, or_15_cse);
  nor_662_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_33));
  mux_tmp_34 <= MUX_s_1_2_2(nor_662_nl, mux_tmp_33, or_8_cse);
  nor_663_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_34));
  mux_35_nl <= MUX_s_1_2_2(nor_663_nl, mux_tmp_34, or_3_cse);
  and_dcpl_311 <= mux_35_nl AND and_dcpl_4 AND and_dcpl_2;
  and_tmp_6 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0000")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0000")));
  nor_654_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_6));
  mux_tmp_36 <= MUX_s_1_2_2(nor_654_nl, and_tmp_6, or_8_cse);
  nor_655_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_36));
  mux_tmp_37 <= MUX_s_1_2_2(nor_655_nl, mux_tmp_36, or_3_cse);
  and_dcpl_318 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_319 <= and_dcpl_262 AND and_dcpl_318;
  or_tmp_102 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_208);
  or_107_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0001"));
  nor_653_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_102));
  mux_38_nl <= MUX_s_1_2_2(nor_653_nl, or_tmp_102, or_107_cse);
  and_dcpl_322 <= mux_38_nl AND and_dcpl_186;
  or_112_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0001"));
  nor_652_nl <= NOT(and_dcpl_208 OR and_dcpl_186);
  or_114_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_182);
  mux_tmp_39 <= MUX_s_1_2_2(nor_652_nl, or_114_nl, or_112_cse);
  nor_651_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_39));
  mux_40_nl <= MUX_s_1_2_2(nor_651_nl, mux_tmp_39, or_107_cse);
  and_dcpl_325 <= mux_40_nl AND and_dcpl_160;
  or_119_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001"));
  nor_649_nl <= NOT(and_dcpl_182 OR and_dcpl_160);
  or_121_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_156);
  mux_tmp_41 <= MUX_s_1_2_2(nor_649_nl, or_121_nl, or_119_cse);
  nor_650_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_41));
  mux_tmp_42 <= MUX_s_1_2_2(nor_650_nl, mux_tmp_41, or_112_cse);
  nor_648_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_42));
  mux_43_nl <= MUX_s_1_2_2(nor_648_nl, mux_tmp_42, or_107_cse);
  and_dcpl_329 <= mux_43_nl AND and_dcpl_135;
  or_128_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001"));
  nor_645_nl <= NOT(and_dcpl_156 OR and_dcpl_135);
  or_130_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_130);
  mux_tmp_44 <= MUX_s_1_2_2(nor_645_nl, or_130_nl, or_128_cse);
  nor_646_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_44));
  mux_tmp_45 <= MUX_s_1_2_2(nor_646_nl, mux_tmp_44, or_119_cse);
  nor_647_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_45));
  mux_tmp_46 <= MUX_s_1_2_2(nor_647_nl, mux_tmp_45, or_112_cse);
  nor_644_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_46));
  mux_47_nl <= MUX_s_1_2_2(nor_644_nl, mux_tmp_46, or_107_cse);
  and_dcpl_333 <= mux_47_nl AND and_dcpl_110;
  or_139_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001"));
  nor_640_nl <= NOT(and_dcpl_130 OR and_dcpl_110);
  or_141_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_105);
  mux_tmp_48 <= MUX_s_1_2_2(nor_640_nl, or_141_nl, or_139_cse);
  nor_641_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_48));
  mux_tmp_49 <= MUX_s_1_2_2(nor_641_nl, mux_tmp_48, or_128_cse);
  nor_642_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_49));
  mux_tmp_50 <= MUX_s_1_2_2(nor_642_nl, mux_tmp_49, or_119_cse);
  nor_643_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_50));
  mux_tmp_51 <= MUX_s_1_2_2(nor_643_nl, mux_tmp_50, or_112_cse);
  nor_639_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_51));
  mux_52_nl <= MUX_s_1_2_2(nor_639_nl, mux_tmp_51, or_107_cse);
  and_dcpl_337 <= mux_52_nl AND and_dcpl_84;
  or_152_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001"));
  nor_634_nl <= NOT(and_dcpl_105 OR and_dcpl_84);
  or_154_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_79);
  mux_tmp_53 <= MUX_s_1_2_2(nor_634_nl, or_154_nl, or_152_cse);
  nor_635_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_53));
  mux_tmp_54 <= MUX_s_1_2_2(nor_635_nl, mux_tmp_53, or_139_cse);
  nor_636_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_54));
  mux_tmp_55 <= MUX_s_1_2_2(nor_636_nl, mux_tmp_54, or_128_cse);
  nor_637_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_55));
  mux_tmp_56 <= MUX_s_1_2_2(nor_637_nl, mux_tmp_55, or_119_cse);
  nor_638_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_56));
  mux_tmp_57 <= MUX_s_1_2_2(nor_638_nl, mux_tmp_56, or_112_cse);
  nor_633_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_57));
  mux_58_nl <= MUX_s_1_2_2(nor_633_nl, mux_tmp_57, or_107_cse);
  and_dcpl_341 <= mux_58_nl AND and_dcpl_58;
  or_167_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001"));
  nor_627_nl <= NOT(and_dcpl_79 OR and_dcpl_58);
  or_169_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_53);
  mux_tmp_59 <= MUX_s_1_2_2(nor_627_nl, or_169_nl, or_167_cse);
  nor_628_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_59));
  mux_tmp_60 <= MUX_s_1_2_2(nor_628_nl, mux_tmp_59, or_152_cse);
  nor_629_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_60));
  mux_tmp_61 <= MUX_s_1_2_2(nor_629_nl, mux_tmp_60, or_139_cse);
  nor_630_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_61));
  mux_tmp_62 <= MUX_s_1_2_2(nor_630_nl, mux_tmp_61, or_128_cse);
  nor_631_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_62));
  mux_tmp_63 <= MUX_s_1_2_2(nor_631_nl, mux_tmp_62, or_119_cse);
  nor_632_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_63));
  mux_tmp_64 <= MUX_s_1_2_2(nor_632_nl, mux_tmp_63, or_112_cse);
  nor_626_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_64));
  mux_65_nl <= MUX_s_1_2_2(nor_626_nl, mux_tmp_64, or_107_cse);
  and_dcpl_344 <= mux_65_nl AND and_dcpl_32;
  nor_618_nl <= NOT(and_dcpl_53 OR and_dcpl_32);
  or_186_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0001")) OR (NOT
      and_dcpl_28);
  or_184_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001"));
  mux_tmp_66 <= MUX_s_1_2_2(nor_618_nl, or_186_nl, or_184_nl);
  nor_619_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_66));
  mux_tmp_67 <= MUX_s_1_2_2(nor_619_nl, mux_tmp_66, or_167_cse);
  nor_620_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_67));
  mux_tmp_68 <= MUX_s_1_2_2(nor_620_nl, mux_tmp_67, or_152_cse);
  nor_621_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_68));
  mux_tmp_69 <= MUX_s_1_2_2(nor_621_nl, mux_tmp_68, or_139_cse);
  nor_622_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_69));
  mux_tmp_70 <= MUX_s_1_2_2(nor_622_nl, mux_tmp_69, or_128_cse);
  nor_623_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_70));
  mux_tmp_71 <= MUX_s_1_2_2(nor_623_nl, mux_tmp_70, or_119_cse);
  nor_624_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_71));
  mux_tmp_72 <= MUX_s_1_2_2(nor_624_nl, mux_tmp_71, or_112_cse);
  nor_625_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_72));
  mux_73_nl <= MUX_s_1_2_2(nor_625_nl, mux_tmp_72, or_107_cse);
  and_dcpl_347 <= mux_73_nl AND and_dcpl_4 AND and_dcpl_6;
  and_tmp_13 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0001")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0001")));
  nor_617_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_13));
  mux_tmp_74 <= MUX_s_1_2_2(nor_617_nl, and_tmp_13, or_112_cse);
  nand_146_cse <= NOT((result_result_acc_tmp(0)) AND ccs_ccore_start_rsci_idat);
  and_797_nl <= nand_146_cse AND mux_tmp_74;
  or_195_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_75 <= MUX_s_1_2_2(and_797_nl, mux_tmp_74, or_195_nl);
  and_dcpl_352 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_353 <= and_dcpl_262 AND and_dcpl_352;
  or_tmp_202 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_208);
  or_209_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0010"));
  nor_616_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_202));
  mux_76_nl <= MUX_s_1_2_2(nor_616_nl, or_tmp_202, or_209_cse);
  and_dcpl_357 <= mux_76_nl AND and_dcpl_189;
  or_214_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0010"));
  nor_615_nl <= NOT(and_dcpl_208 OR and_dcpl_189);
  or_216_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_182);
  mux_tmp_77 <= MUX_s_1_2_2(nor_615_nl, or_216_nl, or_214_cse);
  nor_614_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_77));
  mux_78_nl <= MUX_s_1_2_2(nor_614_nl, mux_tmp_77, or_209_cse);
  and_dcpl_361 <= mux_78_nl AND and_dcpl_163;
  or_221_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010"));
  nor_612_nl <= NOT(and_dcpl_182 OR and_dcpl_163);
  or_223_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_156);
  mux_tmp_79 <= MUX_s_1_2_2(nor_612_nl, or_223_nl, or_221_cse);
  nor_613_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_79));
  mux_tmp_80 <= MUX_s_1_2_2(nor_613_nl, mux_tmp_79, or_214_cse);
  nor_611_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_80));
  mux_81_nl <= MUX_s_1_2_2(nor_611_nl, mux_tmp_80, or_209_cse);
  and_dcpl_364 <= mux_81_nl AND and_dcpl_137;
  or_230_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010"));
  nor_608_nl <= NOT(and_dcpl_156 OR and_dcpl_137);
  or_232_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_130);
  mux_tmp_82 <= MUX_s_1_2_2(nor_608_nl, or_232_nl, or_230_cse);
  nor_609_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_82));
  mux_tmp_83 <= MUX_s_1_2_2(nor_609_nl, mux_tmp_82, or_221_cse);
  nor_610_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_83));
  mux_tmp_84 <= MUX_s_1_2_2(nor_610_nl, mux_tmp_83, or_214_cse);
  nor_607_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_84));
  mux_85_nl <= MUX_s_1_2_2(nor_607_nl, mux_tmp_84, or_209_cse);
  and_dcpl_367 <= mux_85_nl AND and_dcpl_112;
  or_241_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010"));
  nor_603_nl <= NOT(and_dcpl_130 OR and_dcpl_112);
  or_243_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_105);
  mux_tmp_86 <= MUX_s_1_2_2(nor_603_nl, or_243_nl, or_241_cse);
  nor_604_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_86));
  mux_tmp_87 <= MUX_s_1_2_2(nor_604_nl, mux_tmp_86, or_230_cse);
  nor_605_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_87));
  mux_tmp_88 <= MUX_s_1_2_2(nor_605_nl, mux_tmp_87, or_221_cse);
  nor_606_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_88));
  mux_tmp_89 <= MUX_s_1_2_2(nor_606_nl, mux_tmp_88, or_214_cse);
  nor_602_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_89));
  mux_90_nl <= MUX_s_1_2_2(nor_602_nl, mux_tmp_89, or_209_cse);
  and_dcpl_370 <= mux_90_nl AND and_dcpl_86;
  or_254_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010"));
  nor_597_nl <= NOT(and_dcpl_105 OR and_dcpl_86);
  or_256_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_79);
  mux_tmp_91 <= MUX_s_1_2_2(nor_597_nl, or_256_nl, or_254_cse);
  nor_598_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_91));
  mux_tmp_92 <= MUX_s_1_2_2(nor_598_nl, mux_tmp_91, or_241_cse);
  nor_599_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_92));
  mux_tmp_93 <= MUX_s_1_2_2(nor_599_nl, mux_tmp_92, or_230_cse);
  nor_600_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_93));
  mux_tmp_94 <= MUX_s_1_2_2(nor_600_nl, mux_tmp_93, or_221_cse);
  nor_601_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_94));
  mux_tmp_95 <= MUX_s_1_2_2(nor_601_nl, mux_tmp_94, or_214_cse);
  nor_596_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_95));
  mux_96_nl <= MUX_s_1_2_2(nor_596_nl, mux_tmp_95, or_209_cse);
  and_dcpl_373 <= mux_96_nl AND and_dcpl_60;
  or_269_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010"));
  nor_590_nl <= NOT(and_dcpl_79 OR and_dcpl_60);
  or_271_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_53);
  mux_tmp_97 <= MUX_s_1_2_2(nor_590_nl, or_271_nl, or_269_cse);
  nor_591_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_97));
  mux_tmp_98 <= MUX_s_1_2_2(nor_591_nl, mux_tmp_97, or_254_cse);
  nor_592_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_98));
  mux_tmp_99 <= MUX_s_1_2_2(nor_592_nl, mux_tmp_98, or_241_cse);
  nor_593_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_99));
  mux_tmp_100 <= MUX_s_1_2_2(nor_593_nl, mux_tmp_99, or_230_cse);
  nor_594_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_100));
  mux_tmp_101 <= MUX_s_1_2_2(nor_594_nl, mux_tmp_100, or_221_cse);
  nor_595_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_101));
  mux_tmp_102 <= MUX_s_1_2_2(nor_595_nl, mux_tmp_101, or_214_cse);
  nor_589_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_102));
  mux_103_nl <= MUX_s_1_2_2(nor_589_nl, mux_tmp_102, or_209_cse);
  and_dcpl_377 <= mux_103_nl AND and_dcpl_35;
  nor_581_nl <= NOT(and_dcpl_53 OR and_dcpl_35);
  or_288_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0010")) OR (NOT
      and_dcpl_28);
  or_286_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010"));
  mux_tmp_104 <= MUX_s_1_2_2(nor_581_nl, or_288_nl, or_286_nl);
  nor_582_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_104));
  mux_tmp_105 <= MUX_s_1_2_2(nor_582_nl, mux_tmp_104, or_269_cse);
  nor_583_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_105));
  mux_tmp_106 <= MUX_s_1_2_2(nor_583_nl, mux_tmp_105, or_254_cse);
  nor_584_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_106));
  mux_tmp_107 <= MUX_s_1_2_2(nor_584_nl, mux_tmp_106, or_241_cse);
  nor_585_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_107));
  mux_tmp_108 <= MUX_s_1_2_2(nor_585_nl, mux_tmp_107, or_230_cse);
  nor_586_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_108));
  mux_tmp_109 <= MUX_s_1_2_2(nor_586_nl, mux_tmp_108, or_221_cse);
  nor_587_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_109));
  mux_tmp_110 <= MUX_s_1_2_2(nor_587_nl, mux_tmp_109, or_214_cse);
  nor_588_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_110));
  mux_111_nl <= MUX_s_1_2_2(nor_588_nl, mux_tmp_110, or_209_cse);
  and_dcpl_381 <= mux_111_nl AND and_dcpl_4 AND and_dcpl_9;
  and_tmp_20 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0010")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0010")));
  nor_579_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_20));
  mux_tmp_112 <= MUX_s_1_2_2(nor_579_nl, and_tmp_20, or_214_cse);
  nor_580_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_112));
  mux_tmp_113 <= MUX_s_1_2_2(nor_580_nl, mux_tmp_112, or_209_cse);
  and_dcpl_386 <= CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_387 <= and_dcpl_262 AND and_dcpl_386;
  or_tmp_302 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_208);
  or_311_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0011"));
  nor_578_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_302));
  mux_114_nl <= MUX_s_1_2_2(nor_578_nl, or_tmp_302, or_311_cse);
  and_dcpl_390 <= mux_114_nl AND and_dcpl_191;
  or_316_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0011"));
  nor_577_nl <= NOT(and_dcpl_208 OR and_dcpl_191);
  or_318_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_182);
  mux_tmp_115 <= MUX_s_1_2_2(nor_577_nl, or_318_nl, or_316_cse);
  nor_576_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_115));
  mux_116_nl <= MUX_s_1_2_2(nor_576_nl, mux_tmp_115, or_311_cse);
  and_dcpl_393 <= mux_116_nl AND and_dcpl_165;
  or_323_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011"));
  nor_574_nl <= NOT(and_dcpl_182 OR and_dcpl_165);
  or_325_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_156);
  mux_tmp_117 <= MUX_s_1_2_2(nor_574_nl, or_325_nl, or_323_cse);
  nor_575_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_117));
  mux_tmp_118 <= MUX_s_1_2_2(nor_575_nl, mux_tmp_117, or_316_cse);
  nor_573_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_118));
  mux_119_nl <= MUX_s_1_2_2(nor_573_nl, mux_tmp_118, or_311_cse);
  and_dcpl_396 <= mux_119_nl AND and_dcpl_139;
  or_332_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011"));
  nor_570_nl <= NOT(and_dcpl_156 OR and_dcpl_139);
  or_334_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_130);
  mux_tmp_120 <= MUX_s_1_2_2(nor_570_nl, or_334_nl, or_332_cse);
  nor_571_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_120));
  mux_tmp_121 <= MUX_s_1_2_2(nor_571_nl, mux_tmp_120, or_323_cse);
  nor_572_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_121));
  mux_tmp_122 <= MUX_s_1_2_2(nor_572_nl, mux_tmp_121, or_316_cse);
  nor_569_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_122));
  mux_123_nl <= MUX_s_1_2_2(nor_569_nl, mux_tmp_122, or_311_cse);
  and_dcpl_399 <= mux_123_nl AND and_dcpl_114;
  or_343_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011"));
  nor_565_nl <= NOT(and_dcpl_130 OR and_dcpl_114);
  or_345_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_105);
  mux_tmp_124 <= MUX_s_1_2_2(nor_565_nl, or_345_nl, or_343_cse);
  nor_566_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_124));
  mux_tmp_125 <= MUX_s_1_2_2(nor_566_nl, mux_tmp_124, or_332_cse);
  nor_567_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_125));
  mux_tmp_126 <= MUX_s_1_2_2(nor_567_nl, mux_tmp_125, or_323_cse);
  nor_568_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_126));
  mux_tmp_127 <= MUX_s_1_2_2(nor_568_nl, mux_tmp_126, or_316_cse);
  nor_564_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_127));
  mux_128_nl <= MUX_s_1_2_2(nor_564_nl, mux_tmp_127, or_311_cse);
  and_dcpl_402 <= mux_128_nl AND and_dcpl_88;
  or_356_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011"));
  nor_559_nl <= NOT(and_dcpl_105 OR and_dcpl_88);
  or_358_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_79);
  mux_tmp_129 <= MUX_s_1_2_2(nor_559_nl, or_358_nl, or_356_cse);
  nor_560_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_129));
  mux_tmp_130 <= MUX_s_1_2_2(nor_560_nl, mux_tmp_129, or_343_cse);
  nor_561_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_130));
  mux_tmp_131 <= MUX_s_1_2_2(nor_561_nl, mux_tmp_130, or_332_cse);
  nor_562_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_131));
  mux_tmp_132 <= MUX_s_1_2_2(nor_562_nl, mux_tmp_131, or_323_cse);
  nor_563_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_132));
  mux_tmp_133 <= MUX_s_1_2_2(nor_563_nl, mux_tmp_132, or_316_cse);
  nor_558_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_133));
  mux_134_nl <= MUX_s_1_2_2(nor_558_nl, mux_tmp_133, or_311_cse);
  and_dcpl_405 <= mux_134_nl AND and_dcpl_62;
  or_371_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011"));
  nor_552_nl <= NOT(and_dcpl_79 OR and_dcpl_62);
  or_373_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_53);
  mux_tmp_135 <= MUX_s_1_2_2(nor_552_nl, or_373_nl, or_371_cse);
  nor_553_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_135));
  mux_tmp_136 <= MUX_s_1_2_2(nor_553_nl, mux_tmp_135, or_356_cse);
  nor_554_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_136));
  mux_tmp_137 <= MUX_s_1_2_2(nor_554_nl, mux_tmp_136, or_343_cse);
  nor_555_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_137));
  mux_tmp_138 <= MUX_s_1_2_2(nor_555_nl, mux_tmp_137, or_332_cse);
  nor_556_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_138));
  mux_tmp_139 <= MUX_s_1_2_2(nor_556_nl, mux_tmp_138, or_323_cse);
  nor_557_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_139));
  mux_tmp_140 <= MUX_s_1_2_2(nor_557_nl, mux_tmp_139, or_316_cse);
  nor_551_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_140));
  mux_141_nl <= MUX_s_1_2_2(nor_551_nl, mux_tmp_140, or_311_cse);
  and_dcpl_408 <= mux_141_nl AND and_dcpl_37;
  nor_543_nl <= NOT(and_dcpl_53 OR and_dcpl_37);
  or_390_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0011")) OR (NOT
      and_dcpl_28);
  or_388_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011"));
  mux_tmp_142 <= MUX_s_1_2_2(nor_543_nl, or_390_nl, or_388_nl);
  nor_544_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_142));
  mux_tmp_143 <= MUX_s_1_2_2(nor_544_nl, mux_tmp_142, or_371_cse);
  nor_545_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_143));
  mux_tmp_144 <= MUX_s_1_2_2(nor_545_nl, mux_tmp_143, or_356_cse);
  nor_546_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_144));
  mux_tmp_145 <= MUX_s_1_2_2(nor_546_nl, mux_tmp_144, or_343_cse);
  nor_547_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_145));
  mux_tmp_146 <= MUX_s_1_2_2(nor_547_nl, mux_tmp_145, or_332_cse);
  nor_548_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_146));
  mux_tmp_147 <= MUX_s_1_2_2(nor_548_nl, mux_tmp_146, or_323_cse);
  nor_549_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_147));
  mux_tmp_148 <= MUX_s_1_2_2(nor_549_nl, mux_tmp_147, or_316_cse);
  nor_550_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_148));
  mux_149_nl <= MUX_s_1_2_2(nor_550_nl, mux_tmp_148, or_311_cse);
  and_dcpl_411 <= mux_149_nl AND and_dcpl_4 AND and_dcpl_11;
  and_tmp_27 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0011")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0011")));
  nor_542_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_27));
  mux_tmp_150 <= MUX_s_1_2_2(nor_542_nl, and_tmp_27, or_316_cse);
  and_796_nl <= (NOT(CONV_SL_1_1(result_result_acc_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat)) AND mux_tmp_150;
  or_399_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_151 <= MUX_s_1_2_2(and_796_nl, mux_tmp_150, or_399_nl);
  and_dcpl_417 <= ccs_ccore_start_rsci_idat AND CONV_SL_1_1(result_result_acc_tmp(3
      DOWNTO 2)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_418 <= and_dcpl_417 AND and_dcpl_260;
  or_tmp_402 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_208);
  nand_144_cse <= NOT((result_result_acc_tmp(2)) AND ccs_ccore_start_rsci_idat);
  or_413_cse <= (result_result_acc_tmp(1)) OR (result_result_acc_tmp(0)) OR (result_result_acc_tmp(3));
  and_795_nl <= nand_144_cse AND or_tmp_402;
  mux_152_nl <= MUX_s_1_2_2(and_795_nl, or_tmp_402, or_413_cse);
  and_dcpl_422 <= mux_152_nl AND and_dcpl_194;
  or_418_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0100"));
  nor_541_nl <= NOT(and_dcpl_208 OR and_dcpl_194);
  or_420_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_182);
  mux_tmp_153 <= MUX_s_1_2_2(nor_541_nl, or_420_nl, or_418_cse);
  and_794_nl <= nand_144_cse AND mux_tmp_153;
  mux_154_nl <= MUX_s_1_2_2(and_794_nl, mux_tmp_153, or_413_cse);
  and_dcpl_426 <= mux_154_nl AND and_dcpl_168;
  or_425_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100"));
  nor_539_nl <= NOT(and_dcpl_182 OR and_dcpl_168);
  or_427_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_156);
  mux_tmp_155 <= MUX_s_1_2_2(nor_539_nl, or_427_nl, or_425_cse);
  nor_540_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_155));
  mux_tmp_156 <= MUX_s_1_2_2(nor_540_nl, mux_tmp_155, or_418_cse);
  and_793_nl <= nand_144_cse AND mux_tmp_156;
  mux_157_nl <= MUX_s_1_2_2(and_793_nl, mux_tmp_156, or_413_cse);
  and_dcpl_430 <= mux_157_nl AND and_dcpl_142;
  or_434_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100"));
  nor_536_nl <= NOT(and_dcpl_156 OR and_dcpl_142);
  or_436_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_130);
  mux_tmp_158 <= MUX_s_1_2_2(nor_536_nl, or_436_nl, or_434_cse);
  nor_537_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_158));
  mux_tmp_159 <= MUX_s_1_2_2(nor_537_nl, mux_tmp_158, or_425_cse);
  nor_538_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_159));
  mux_tmp_160 <= MUX_s_1_2_2(nor_538_nl, mux_tmp_159, or_418_cse);
  and_792_nl <= nand_144_cse AND mux_tmp_160;
  mux_161_nl <= MUX_s_1_2_2(and_792_nl, mux_tmp_160, or_413_cse);
  and_dcpl_433 <= mux_161_nl AND and_dcpl_116;
  or_445_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100"));
  nor_532_nl <= NOT(and_dcpl_130 OR and_dcpl_116);
  or_447_nl <= (result_rem_11cyc_st_5(1)) OR (result_rem_11cyc_st_5(0)) OR (result_rem_11cyc_st_5(3))
      OR (NOT and_dcpl_115);
  mux_tmp_162 <= MUX_s_1_2_2(nor_532_nl, or_447_nl, or_445_cse);
  nor_533_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_162));
  mux_tmp_163 <= MUX_s_1_2_2(nor_533_nl, mux_tmp_162, or_434_cse);
  nor_534_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_163));
  mux_tmp_164 <= MUX_s_1_2_2(nor_534_nl, mux_tmp_163, or_425_cse);
  nor_535_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_164));
  mux_tmp_165 <= MUX_s_1_2_2(nor_535_nl, mux_tmp_164, or_418_cse);
  and_791_nl <= nand_144_cse AND mux_tmp_165;
  mux_166_nl <= MUX_s_1_2_2(and_791_nl, mux_tmp_165, or_413_cse);
  and_dcpl_437 <= mux_166_nl AND and_dcpl_91;
  or_458_cse <= (result_rem_11cyc_st_5(1)) OR (result_rem_11cyc_st_5(0)) OR (result_rem_11cyc_st_5(3));
  and_790_cse <= (result_rem_11cyc_st_5(2)) AND asn_itm_5 AND main_stage_0_6;
  nor_527_nl <= NOT(and_790_cse OR and_dcpl_91);
  or_460_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_79);
  mux_tmp_167 <= MUX_s_1_2_2(nor_527_nl, or_460_nl, or_458_cse);
  nor_528_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_167));
  mux_tmp_168 <= MUX_s_1_2_2(nor_528_nl, mux_tmp_167, or_445_cse);
  nor_529_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_168));
  mux_tmp_169 <= MUX_s_1_2_2(nor_529_nl, mux_tmp_168, or_434_cse);
  nor_530_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_169));
  mux_tmp_170 <= MUX_s_1_2_2(nor_530_nl, mux_tmp_169, or_425_cse);
  nor_531_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_170));
  mux_tmp_171 <= MUX_s_1_2_2(nor_531_nl, mux_tmp_170, or_418_cse);
  and_789_nl <= nand_144_cse AND mux_tmp_171;
  mux_172_nl <= MUX_s_1_2_2(and_789_nl, mux_tmp_171, or_413_cse);
  and_dcpl_441 <= mux_172_nl AND and_dcpl_65;
  or_473_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100"));
  nor_522_nl <= NOT(and_dcpl_79 OR and_dcpl_65);
  or_475_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100")) OR (NOT
      and_dcpl_53);
  mux_tmp_173 <= MUX_s_1_2_2(nor_522_nl, or_475_nl, or_473_cse);
  nand_138_cse <= NOT((result_rem_11cyc_st_5(2)) AND asn_itm_5 AND main_stage_0_6);
  and_788_nl <= nand_138_cse AND mux_tmp_173;
  mux_tmp_174 <= MUX_s_1_2_2(and_788_nl, mux_tmp_173, or_458_cse);
  nor_523_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_174));
  mux_tmp_175 <= MUX_s_1_2_2(nor_523_nl, mux_tmp_174, or_445_cse);
  nor_524_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_175));
  mux_tmp_176 <= MUX_s_1_2_2(nor_524_nl, mux_tmp_175, or_434_cse);
  nor_525_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_176));
  mux_tmp_177 <= MUX_s_1_2_2(nor_525_nl, mux_tmp_176, or_425_cse);
  nor_526_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_177));
  mux_tmp_178 <= MUX_s_1_2_2(nor_526_nl, mux_tmp_177, or_418_cse);
  and_787_nl <= nand_144_cse AND mux_tmp_178;
  mux_179_nl <= MUX_s_1_2_2(and_787_nl, mux_tmp_178, or_413_cse);
  and_dcpl_444 <= mux_179_nl AND and_dcpl_39;
  nor_516_nl <= NOT(and_dcpl_53 OR and_dcpl_39);
  or_492_nl <= (result_rem_11cyc_st_8(0)) OR (result_rem_11cyc_st_8(1)) OR (result_rem_11cyc_st_8(3))
      OR (NOT and_dcpl_38);
  or_490_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_180 <= MUX_s_1_2_2(nor_516_nl, or_492_nl, or_490_nl);
  nor_517_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_180));
  mux_tmp_181 <= MUX_s_1_2_2(nor_517_nl, mux_tmp_180, or_473_cse);
  and_785_nl <= nand_138_cse AND mux_tmp_181;
  mux_tmp_182 <= MUX_s_1_2_2(and_785_nl, mux_tmp_181, or_458_cse);
  nor_518_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_182));
  mux_tmp_183 <= MUX_s_1_2_2(nor_518_nl, mux_tmp_182, or_445_cse);
  nor_519_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_183));
  mux_tmp_184 <= MUX_s_1_2_2(nor_519_nl, mux_tmp_183, or_434_cse);
  nor_520_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_184));
  mux_tmp_185 <= MUX_s_1_2_2(nor_520_nl, mux_tmp_184, or_425_cse);
  nor_521_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_185));
  mux_tmp_186 <= MUX_s_1_2_2(nor_521_nl, mux_tmp_185, or_418_cse);
  and_786_nl <= nand_144_cse AND mux_tmp_186;
  mux_187_nl <= MUX_s_1_2_2(and_786_nl, mux_tmp_186, or_413_cse);
  and_dcpl_447 <= mux_187_nl AND and_dcpl_13 AND and_dcpl_2;
  and_tmp_34 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0100")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0100")));
  nor_514_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_34));
  mux_tmp_188 <= MUX_s_1_2_2(nor_514_nl, and_tmp_34, or_418_cse);
  nor_515_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_188));
  or_501_nl <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0100"));
  mux_tmp_189 <= MUX_s_1_2_2(nor_515_nl, mux_tmp_188, or_501_nl);
  and_dcpl_452 <= and_dcpl_417 AND and_dcpl_318;
  or_tmp_502 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_208);
  or_516_cse <= (result_result_acc_tmp(1)) OR (NOT (result_result_acc_tmp(0))) OR
      (result_result_acc_tmp(3));
  and_784_nl <= nand_144_cse AND or_tmp_502;
  mux_190_nl <= MUX_s_1_2_2(and_784_nl, or_tmp_502, or_516_cse);
  and_dcpl_455 <= mux_190_nl AND and_dcpl_196;
  or_521_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0101"));
  nor_513_nl <= NOT(and_dcpl_208 OR and_dcpl_196);
  or_523_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_182);
  mux_tmp_191 <= MUX_s_1_2_2(nor_513_nl, or_523_nl, or_521_cse);
  and_783_nl <= nand_144_cse AND mux_tmp_191;
  mux_192_nl <= MUX_s_1_2_2(and_783_nl, mux_tmp_191, or_516_cse);
  and_dcpl_458 <= mux_192_nl AND and_dcpl_170;
  or_528_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101"));
  nor_511_nl <= NOT(and_dcpl_182 OR and_dcpl_170);
  or_530_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_156);
  mux_tmp_193 <= MUX_s_1_2_2(nor_511_nl, or_530_nl, or_528_cse);
  nor_512_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_193));
  mux_tmp_194 <= MUX_s_1_2_2(nor_512_nl, mux_tmp_193, or_521_cse);
  and_782_nl <= nand_144_cse AND mux_tmp_194;
  mux_195_nl <= MUX_s_1_2_2(and_782_nl, mux_tmp_194, or_516_cse);
  and_dcpl_462 <= mux_195_nl AND and_dcpl_145;
  or_537_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101"));
  nor_508_nl <= NOT(and_dcpl_156 OR and_dcpl_145);
  or_539_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_130);
  mux_tmp_196 <= MUX_s_1_2_2(nor_508_nl, or_539_nl, or_537_cse);
  nor_509_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_196));
  mux_tmp_197 <= MUX_s_1_2_2(nor_509_nl, mux_tmp_196, or_528_cse);
  nor_510_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_197));
  mux_tmp_198 <= MUX_s_1_2_2(nor_510_nl, mux_tmp_197, or_521_cse);
  and_781_nl <= nand_144_cse AND mux_tmp_198;
  mux_199_nl <= MUX_s_1_2_2(and_781_nl, mux_tmp_198, or_516_cse);
  and_dcpl_464 <= mux_199_nl AND and_dcpl_117;
  or_548_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101"));
  nor_504_nl <= NOT(and_dcpl_130 OR and_dcpl_117);
  or_550_nl <= (result_rem_11cyc_st_5(1)) OR (NOT (result_rem_11cyc_st_5(0))) OR
      (result_rem_11cyc_st_5(3)) OR (NOT and_dcpl_115);
  mux_tmp_200 <= MUX_s_1_2_2(nor_504_nl, or_550_nl, or_548_cse);
  nor_505_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_200));
  mux_tmp_201 <= MUX_s_1_2_2(nor_505_nl, mux_tmp_200, or_537_cse);
  nor_506_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_201));
  mux_tmp_202 <= MUX_s_1_2_2(nor_506_nl, mux_tmp_201, or_528_cse);
  nor_507_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_202));
  mux_tmp_203 <= MUX_s_1_2_2(nor_507_nl, mux_tmp_202, or_521_cse);
  and_780_nl <= nand_144_cse AND mux_tmp_203;
  mux_204_nl <= MUX_s_1_2_2(and_780_nl, mux_tmp_203, or_516_cse);
  and_dcpl_468 <= mux_204_nl AND and_dcpl_94;
  or_561_cse <= (result_rem_11cyc_st_5(1)) OR (NOT (result_rem_11cyc_st_5(0))) OR
      (result_rem_11cyc_st_5(3));
  nor_499_nl <= NOT(and_790_cse OR and_dcpl_94);
  or_563_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_79);
  mux_tmp_205 <= MUX_s_1_2_2(nor_499_nl, or_563_nl, or_561_cse);
  nor_500_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_205));
  mux_tmp_206 <= MUX_s_1_2_2(nor_500_nl, mux_tmp_205, or_548_cse);
  nor_501_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_206));
  mux_tmp_207 <= MUX_s_1_2_2(nor_501_nl, mux_tmp_206, or_537_cse);
  nor_502_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_207));
  mux_tmp_208 <= MUX_s_1_2_2(nor_502_nl, mux_tmp_207, or_528_cse);
  nor_503_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_208));
  mux_tmp_209 <= MUX_s_1_2_2(nor_503_nl, mux_tmp_208, or_521_cse);
  and_778_nl <= nand_144_cse AND mux_tmp_209;
  mux_210_nl <= MUX_s_1_2_2(and_778_nl, mux_tmp_209, or_516_cse);
  and_dcpl_472 <= mux_210_nl AND and_dcpl_68;
  or_576_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101"));
  nor_494_nl <= NOT(and_dcpl_79 OR and_dcpl_68);
  or_578_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101")) OR (NOT
      and_dcpl_53);
  mux_tmp_211 <= MUX_s_1_2_2(nor_494_nl, or_578_nl, or_576_cse);
  and_777_nl <= nand_138_cse AND mux_tmp_211;
  mux_tmp_212 <= MUX_s_1_2_2(and_777_nl, mux_tmp_211, or_561_cse);
  nor_495_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_212));
  mux_tmp_213 <= MUX_s_1_2_2(nor_495_nl, mux_tmp_212, or_548_cse);
  nor_496_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_213));
  mux_tmp_214 <= MUX_s_1_2_2(nor_496_nl, mux_tmp_213, or_537_cse);
  nor_497_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_214));
  mux_tmp_215 <= MUX_s_1_2_2(nor_497_nl, mux_tmp_214, or_528_cse);
  nor_498_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_215));
  mux_tmp_216 <= MUX_s_1_2_2(nor_498_nl, mux_tmp_215, or_521_cse);
  and_776_nl <= nand_144_cse AND mux_tmp_216;
  mux_217_nl <= MUX_s_1_2_2(and_776_nl, mux_tmp_216, or_516_cse);
  and_dcpl_474 <= mux_217_nl AND and_dcpl_40;
  nor_488_nl <= NOT(and_dcpl_53 OR and_dcpl_40);
  or_595_nl <= (NOT (result_rem_11cyc_st_8(0))) OR (result_rem_11cyc_st_8(1)) OR
      (result_rem_11cyc_st_8(3)) OR (NOT and_dcpl_38);
  or_593_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101"));
  mux_tmp_218 <= MUX_s_1_2_2(nor_488_nl, or_595_nl, or_593_nl);
  nor_489_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_218));
  mux_tmp_219 <= MUX_s_1_2_2(nor_489_nl, mux_tmp_218, or_576_cse);
  and_774_nl <= nand_138_cse AND mux_tmp_219;
  mux_tmp_220 <= MUX_s_1_2_2(and_774_nl, mux_tmp_219, or_561_cse);
  nor_490_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_220));
  mux_tmp_221 <= MUX_s_1_2_2(nor_490_nl, mux_tmp_220, or_548_cse);
  nor_491_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_221));
  mux_tmp_222 <= MUX_s_1_2_2(nor_491_nl, mux_tmp_221, or_537_cse);
  nor_492_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_222));
  mux_tmp_223 <= MUX_s_1_2_2(nor_492_nl, mux_tmp_222, or_528_cse);
  nor_493_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_223));
  mux_tmp_224 <= MUX_s_1_2_2(nor_493_nl, mux_tmp_223, or_521_cse);
  and_775_nl <= nand_144_cse AND mux_tmp_224;
  mux_225_nl <= MUX_s_1_2_2(and_775_nl, mux_tmp_224, or_516_cse);
  and_dcpl_476 <= mux_225_nl AND and_dcpl_13 AND and_dcpl_6;
  and_tmp_41 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0101")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0101")));
  nor_487_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_41));
  mux_tmp_226 <= MUX_s_1_2_2(nor_487_nl, and_tmp_41, or_521_cse);
  and_773_nl <= nand_146_cse AND mux_tmp_226;
  or_604_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_227 <= MUX_s_1_2_2(and_773_nl, mux_tmp_226, or_604_nl);
  and_dcpl_480 <= and_dcpl_417 AND and_dcpl_352;
  or_tmp_602 <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_208);
  or_617_cse <= (NOT (result_result_acc_tmp(1))) OR (result_result_acc_tmp(0)) OR
      (result_result_acc_tmp(3));
  and_772_nl <= nand_144_cse AND or_tmp_602;
  mux_228_nl <= MUX_s_1_2_2(and_772_nl, or_tmp_602, or_617_cse);
  and_dcpl_484 <= mux_228_nl AND and_dcpl_199;
  or_622_cse <= CONV_SL_1_1(result_rem_11cyc/=STD_LOGIC_VECTOR'("0110"));
  nor_486_nl <= NOT(and_dcpl_208 OR and_dcpl_199);
  or_624_nl <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_182);
  mux_tmp_229 <= MUX_s_1_2_2(nor_486_nl, or_624_nl, or_622_cse);
  and_771_nl <= nand_144_cse AND mux_tmp_229;
  mux_230_nl <= MUX_s_1_2_2(and_771_nl, mux_tmp_229, or_617_cse);
  and_dcpl_488 <= mux_230_nl AND and_dcpl_173;
  or_629_cse <= CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110"));
  nor_484_nl <= NOT(and_dcpl_182 OR and_dcpl_173);
  or_631_nl <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_156);
  mux_tmp_231 <= MUX_s_1_2_2(nor_484_nl, or_631_nl, or_629_cse);
  nor_485_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_231));
  mux_tmp_232 <= MUX_s_1_2_2(nor_485_nl, mux_tmp_231, or_622_cse);
  and_770_nl <= nand_144_cse AND mux_tmp_232;
  mux_233_nl <= MUX_s_1_2_2(and_770_nl, mux_tmp_232, or_617_cse);
  and_dcpl_491 <= mux_233_nl AND and_dcpl_147;
  or_638_cse <= CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110"));
  nor_481_nl <= NOT(and_dcpl_156 OR and_dcpl_147);
  or_640_nl <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_130);
  mux_tmp_234 <= MUX_s_1_2_2(nor_481_nl, or_640_nl, or_638_cse);
  nor_482_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_234));
  mux_tmp_235 <= MUX_s_1_2_2(nor_482_nl, mux_tmp_234, or_629_cse);
  nor_483_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_235));
  mux_tmp_236 <= MUX_s_1_2_2(nor_483_nl, mux_tmp_235, or_622_cse);
  and_769_nl <= nand_144_cse AND mux_tmp_236;
  mux_237_nl <= MUX_s_1_2_2(and_769_nl, mux_tmp_236, or_617_cse);
  and_dcpl_493 <= mux_237_nl AND and_dcpl_118;
  or_649_cse <= CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110"));
  nor_477_nl <= NOT(and_dcpl_130 OR and_dcpl_118);
  or_651_nl <= (NOT (result_rem_11cyc_st_5(1))) OR (result_rem_11cyc_st_5(0)) OR
      (result_rem_11cyc_st_5(3)) OR (NOT and_dcpl_115);
  mux_tmp_238 <= MUX_s_1_2_2(nor_477_nl, or_651_nl, or_649_cse);
  nor_478_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_238));
  mux_tmp_239 <= MUX_s_1_2_2(nor_478_nl, mux_tmp_238, or_638_cse);
  nor_479_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_239));
  mux_tmp_240 <= MUX_s_1_2_2(nor_479_nl, mux_tmp_239, or_629_cse);
  nor_480_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_240));
  mux_tmp_241 <= MUX_s_1_2_2(nor_480_nl, mux_tmp_240, or_622_cse);
  and_768_nl <= nand_144_cse AND mux_tmp_241;
  mux_242_nl <= MUX_s_1_2_2(and_768_nl, mux_tmp_241, or_617_cse);
  and_dcpl_496 <= mux_242_nl AND and_dcpl_96;
  or_662_cse <= (NOT (result_rem_11cyc_st_5(1))) OR (result_rem_11cyc_st_5(0)) OR
      (result_rem_11cyc_st_5(3));
  nor_472_nl <= NOT(and_790_cse OR and_dcpl_96);
  or_664_nl <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_79);
  mux_tmp_243 <= MUX_s_1_2_2(nor_472_nl, or_664_nl, or_662_cse);
  nor_473_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_243));
  mux_tmp_244 <= MUX_s_1_2_2(nor_473_nl, mux_tmp_243, or_649_cse);
  nor_474_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_244));
  mux_tmp_245 <= MUX_s_1_2_2(nor_474_nl, mux_tmp_244, or_638_cse);
  nor_475_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_245));
  mux_tmp_246 <= MUX_s_1_2_2(nor_475_nl, mux_tmp_245, or_629_cse);
  nor_476_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_246));
  mux_tmp_247 <= MUX_s_1_2_2(nor_476_nl, mux_tmp_246, or_622_cse);
  and_766_nl <= nand_144_cse AND mux_tmp_247;
  mux_248_nl <= MUX_s_1_2_2(and_766_nl, mux_tmp_247, or_617_cse);
  and_dcpl_499 <= mux_248_nl AND and_dcpl_70;
  or_677_cse <= CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110"));
  nor_467_nl <= NOT(and_dcpl_79 OR and_dcpl_70);
  or_679_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110")) OR (NOT
      and_dcpl_53);
  mux_tmp_249 <= MUX_s_1_2_2(nor_467_nl, or_679_nl, or_677_cse);
  and_765_nl <= nand_138_cse AND mux_tmp_249;
  mux_tmp_250 <= MUX_s_1_2_2(and_765_nl, mux_tmp_249, or_662_cse);
  nor_468_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_250));
  mux_tmp_251 <= MUX_s_1_2_2(nor_468_nl, mux_tmp_250, or_649_cse);
  nor_469_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_251));
  mux_tmp_252 <= MUX_s_1_2_2(nor_469_nl, mux_tmp_251, or_638_cse);
  nor_470_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_252));
  mux_tmp_253 <= MUX_s_1_2_2(nor_470_nl, mux_tmp_252, or_629_cse);
  nor_471_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_253));
  mux_tmp_254 <= MUX_s_1_2_2(nor_471_nl, mux_tmp_253, or_622_cse);
  and_764_nl <= nand_144_cse AND mux_tmp_254;
  mux_255_nl <= MUX_s_1_2_2(and_764_nl, mux_tmp_254, or_617_cse);
  and_dcpl_501 <= mux_255_nl AND and_dcpl_41;
  nor_461_nl <= NOT(and_dcpl_53 OR and_dcpl_41);
  or_696_nl <= (result_rem_11cyc_st_8(0)) OR (NOT (result_rem_11cyc_st_8(1))) OR
      (result_rem_11cyc_st_8(3)) OR (NOT and_dcpl_38);
  or_694_nl <= CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110"));
  mux_tmp_256 <= MUX_s_1_2_2(nor_461_nl, or_696_nl, or_694_nl);
  nor_462_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_256));
  mux_tmp_257 <= MUX_s_1_2_2(nor_462_nl, mux_tmp_256, or_677_cse);
  and_762_nl <= nand_138_cse AND mux_tmp_257;
  mux_tmp_258 <= MUX_s_1_2_2(and_762_nl, mux_tmp_257, or_662_cse);
  nor_463_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_258));
  mux_tmp_259 <= MUX_s_1_2_2(nor_463_nl, mux_tmp_258, or_649_cse);
  nor_464_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_259));
  mux_tmp_260 <= MUX_s_1_2_2(nor_464_nl, mux_tmp_259, or_638_cse);
  nor_465_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_260));
  mux_tmp_261 <= MUX_s_1_2_2(nor_465_nl, mux_tmp_260, or_629_cse);
  nor_466_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_261));
  mux_tmp_262 <= MUX_s_1_2_2(nor_466_nl, mux_tmp_261, or_622_cse);
  and_763_nl <= nand_144_cse AND mux_tmp_262;
  mux_263_nl <= MUX_s_1_2_2(and_763_nl, mux_tmp_262, or_617_cse);
  and_dcpl_503 <= mux_263_nl AND and_dcpl_13 AND and_dcpl_9;
  and_tmp_48 <= ((NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("0110")))
      AND ((NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("0110")));
  nor_459_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_48));
  mux_tmp_264 <= MUX_s_1_2_2(nor_459_nl, and_tmp_48, or_622_cse);
  nor_460_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_264));
  or_705_nl <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("0110"));
  mux_tmp_265 <= MUX_s_1_2_2(nor_460_nl, mux_tmp_264, or_705_nl);
  and_dcpl_507 <= and_dcpl_417 AND and_dcpl_386;
  or_tmp_702 <= NOT(CONV_SL_1_1(result_rem_11cyc=STD_LOGIC_VECTOR'("0111")) AND and_dcpl_208);
  or_718_cse <= (NOT (result_result_acc_tmp(1))) OR (NOT (result_result_acc_tmp(0)))
      OR (result_result_acc_tmp(3));
  and_761_nl <= nand_144_cse AND or_tmp_702;
  mux_266_nl <= MUX_s_1_2_2(and_761_nl, or_tmp_702, or_718_cse);
  and_dcpl_510 <= mux_266_nl AND and_dcpl_201;
  nand_112_cse <= NOT(CONV_SL_1_1(result_rem_11cyc=STD_LOGIC_VECTOR'("0111")));
  nor_458_nl <= NOT(and_dcpl_208 OR and_dcpl_201);
  nand_153_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_182);
  mux_tmp_267 <= MUX_s_1_2_2(nor_458_nl, nand_153_nl, nand_112_cse);
  and_760_nl <= nand_144_cse AND mux_tmp_267;
  mux_268_nl <= MUX_s_1_2_2(and_760_nl, mux_tmp_267, or_718_cse);
  and_dcpl_513 <= mux_268_nl AND and_dcpl_175;
  nand_108_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111")));
  nor_456_nl <= NOT(and_dcpl_182 OR and_dcpl_175);
  nand_152_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_156);
  mux_tmp_269 <= MUX_s_1_2_2(nor_456_nl, nand_152_nl, nand_108_cse);
  nor_457_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_269));
  mux_tmp_270 <= MUX_s_1_2_2(nor_457_nl, mux_tmp_269, nand_112_cse);
  and_759_nl <= nand_144_cse AND mux_tmp_270;
  mux_271_nl <= MUX_s_1_2_2(and_759_nl, mux_tmp_270, or_718_cse);
  and_dcpl_516 <= mux_271_nl AND and_dcpl_149;
  nand_103_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111")));
  nor_453_nl <= NOT(and_dcpl_156 OR and_dcpl_149);
  nand_151_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_130);
  mux_tmp_272 <= MUX_s_1_2_2(nor_453_nl, nand_151_nl, nand_103_cse);
  nor_454_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_272));
  mux_tmp_273 <= MUX_s_1_2_2(nor_454_nl, mux_tmp_272, nand_108_cse);
  nor_455_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_273));
  mux_tmp_274 <= MUX_s_1_2_2(nor_455_nl, mux_tmp_273, nand_112_cse);
  and_758_nl <= nand_144_cse AND mux_tmp_274;
  mux_275_nl <= MUX_s_1_2_2(and_758_nl, mux_tmp_274, or_718_cse);
  and_dcpl_518 <= mux_275_nl AND and_dcpl_119;
  nand_97_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111")));
  nor_449_nl <= NOT(and_dcpl_130 OR and_dcpl_119);
  nand_96_nl <= NOT((result_rem_11cyc_st_5(1)) AND (result_rem_11cyc_st_5(0)) AND
      (NOT (result_rem_11cyc_st_5(3))) AND and_dcpl_115);
  mux_tmp_276 <= MUX_s_1_2_2(nor_449_nl, nand_96_nl, nand_97_cse);
  nor_450_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_276));
  mux_tmp_277 <= MUX_s_1_2_2(nor_450_nl, mux_tmp_276, nand_103_cse);
  nor_451_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_277));
  mux_tmp_278 <= MUX_s_1_2_2(nor_451_nl, mux_tmp_277, nand_108_cse);
  nor_452_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_278));
  mux_tmp_279 <= MUX_s_1_2_2(nor_452_nl, mux_tmp_278, nand_112_cse);
  and_757_nl <= nand_144_cse AND mux_tmp_279;
  mux_280_nl <= MUX_s_1_2_2(and_757_nl, mux_tmp_279, or_718_cse);
  and_dcpl_521 <= mux_280_nl AND and_dcpl_98;
  or_763_cse <= (NOT (result_rem_11cyc_st_5(1))) OR (NOT (result_rem_11cyc_st_5(0)))
      OR (result_rem_11cyc_st_5(3));
  nor_444_nl <= NOT(and_790_cse OR and_dcpl_98);
  nand_150_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_79);
  mux_tmp_281 <= MUX_s_1_2_2(nor_444_nl, nand_150_nl, or_763_cse);
  nor_445_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_281));
  mux_tmp_282 <= MUX_s_1_2_2(nor_445_nl, mux_tmp_281, nand_97_cse);
  nor_446_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_282));
  mux_tmp_283 <= MUX_s_1_2_2(nor_446_nl, mux_tmp_282, nand_103_cse);
  nor_447_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_283));
  mux_tmp_284 <= MUX_s_1_2_2(nor_447_nl, mux_tmp_283, nand_108_cse);
  nor_448_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_284));
  mux_tmp_285 <= MUX_s_1_2_2(nor_448_nl, mux_tmp_284, nand_112_cse);
  and_755_nl <= nand_144_cse AND mux_tmp_285;
  mux_286_nl <= MUX_s_1_2_2(and_755_nl, mux_tmp_285, or_718_cse);
  and_dcpl_524 <= mux_286_nl AND and_dcpl_72;
  nand_83_cse <= NOT(CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111")));
  nor_439_nl <= NOT(and_dcpl_79 OR and_dcpl_72);
  nand_149_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111"))
      AND and_dcpl_53);
  mux_tmp_287 <= MUX_s_1_2_2(nor_439_nl, nand_149_nl, nand_83_cse);
  and_754_nl <= nand_138_cse AND mux_tmp_287;
  mux_tmp_288 <= MUX_s_1_2_2(and_754_nl, mux_tmp_287, or_763_cse);
  nor_440_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_288));
  mux_tmp_289 <= MUX_s_1_2_2(nor_440_nl, mux_tmp_288, nand_97_cse);
  nor_441_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_289));
  mux_tmp_290 <= MUX_s_1_2_2(nor_441_nl, mux_tmp_289, nand_103_cse);
  nor_442_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_290));
  mux_tmp_291 <= MUX_s_1_2_2(nor_442_nl, mux_tmp_290, nand_108_cse);
  nor_443_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_291));
  mux_tmp_292 <= MUX_s_1_2_2(nor_443_nl, mux_tmp_291, nand_112_cse);
  and_753_nl <= nand_144_cse AND mux_tmp_292;
  mux_293_nl <= MUX_s_1_2_2(and_753_nl, mux_tmp_292, or_718_cse);
  and_dcpl_526 <= mux_293_nl AND and_dcpl_42;
  nor_433_nl <= NOT(and_dcpl_53 OR and_dcpl_42);
  nand_72_nl <= NOT((result_rem_11cyc_st_8(0)) AND (result_rem_11cyc_st_8(1)) AND
      (NOT (result_rem_11cyc_st_8(3))) AND and_dcpl_38);
  nand_73_nl <= NOT(CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111")));
  mux_tmp_294 <= MUX_s_1_2_2(nor_433_nl, nand_72_nl, nand_73_nl);
  nor_434_nl <= NOT(and_dcpl_79 OR (NOT mux_tmp_294));
  mux_tmp_295 <= MUX_s_1_2_2(nor_434_nl, mux_tmp_294, nand_83_cse);
  and_751_nl <= nand_138_cse AND mux_tmp_295;
  mux_tmp_296 <= MUX_s_1_2_2(and_751_nl, mux_tmp_295, or_763_cse);
  nor_435_nl <= NOT(and_dcpl_130 OR (NOT mux_tmp_296));
  mux_tmp_297 <= MUX_s_1_2_2(nor_435_nl, mux_tmp_296, nand_97_cse);
  nor_436_nl <= NOT(and_dcpl_156 OR (NOT mux_tmp_297));
  mux_tmp_298 <= MUX_s_1_2_2(nor_436_nl, mux_tmp_297, nand_103_cse);
  nor_437_nl <= NOT(and_dcpl_182 OR (NOT mux_tmp_298));
  mux_tmp_299 <= MUX_s_1_2_2(nor_437_nl, mux_tmp_298, nand_108_cse);
  nor_438_nl <= NOT(and_dcpl_208 OR (NOT mux_tmp_299));
  mux_tmp_300 <= MUX_s_1_2_2(nor_438_nl, mux_tmp_299, nand_112_cse);
  and_752_nl <= nand_144_cse AND mux_tmp_300;
  mux_301_nl <= MUX_s_1_2_2(and_752_nl, mux_tmp_300, or_718_cse);
  and_dcpl_528 <= mux_301_nl AND and_dcpl_13 AND and_dcpl_11;
  and_tmp_55 <= (NOT(main_stage_0_3 AND asn_itm_2 AND CONV_SL_1_1(result_rem_11cyc_st_2=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_4 AND asn_itm_3 AND CONV_SL_1_1(result_rem_11cyc_st_3=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_5 AND asn_itm_4 AND CONV_SL_1_1(result_rem_11cyc_st_4=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_6 AND asn_itm_5 AND CONV_SL_1_1(result_rem_11cyc_st_5=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_7 AND asn_itm_6 AND CONV_SL_1_1(result_rem_11cyc_st_6=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(result_rem_11cyc_st_7=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_9 AND asn_itm_8 AND CONV_SL_1_1(result_rem_11cyc_st_8=STD_LOGIC_VECTOR'("0111"))))
      AND (NOT(main_stage_0_10 AND asn_itm_9 AND CONV_SL_1_1(result_rem_11cyc_st_9=STD_LOGIC_VECTOR'("0111"))));
  nor_432_nl <= NOT(and_dcpl_208 OR (NOT and_tmp_55));
  mux_tmp_302 <= MUX_s_1_2_2(nor_432_nl, and_tmp_55, nand_112_cse);
  and_750_nl <= (NOT(CONV_SL_1_1(result_result_acc_tmp(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111"))
      AND ccs_ccore_start_rsci_idat)) AND mux_tmp_302;
  mux_tmp_303 <= MUX_s_1_2_2(and_750_nl, mux_tmp_302, result_result_acc_tmp(3));
  and_dcpl_532 <= and_dcpl_261 AND (result_result_acc_tmp(3));
  and_dcpl_533 <= and_dcpl_532 AND and_dcpl_260;
  not_tmp_645 <= NOT((result_rem_11cyc(3)) AND asn_itm_1 AND main_stage_0_2);
  or_tmp_801 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR not_tmp_645;
  or_818_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1000"));
  nor_431_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_801));
  mux_304_nl <= MUX_s_1_2_2(nor_431_nl, or_tmp_801, or_818_cse);
  and_dcpl_536 <= mux_304_nl AND and_dcpl_203;
  or_823_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_749_cse <= (result_rem_11cyc(3)) AND asn_itm_1 AND main_stage_0_2;
  nor_430_nl <= NOT(and_749_cse OR and_dcpl_203);
  or_825_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_202);
  mux_tmp_305 <= MUX_s_1_2_2(nor_430_nl, or_825_nl, or_823_cse);
  nor_429_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_305));
  mux_306_nl <= MUX_s_1_2_2(nor_429_nl, mux_tmp_305, or_818_cse);
  and_dcpl_539 <= mux_306_nl AND and_dcpl_177;
  or_830_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_747_cse <= (result_rem_11cyc_st_2(3)) AND asn_itm_2 AND main_stage_0_3;
  nor_428_nl <= NOT(and_747_cse OR and_dcpl_177);
  or_832_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_176);
  mux_tmp_307 <= MUX_s_1_2_2(nor_428_nl, or_832_nl, or_830_cse);
  and_748_nl <= not_tmp_645 AND mux_tmp_307;
  mux_tmp_308 <= MUX_s_1_2_2(and_748_nl, mux_tmp_307, or_823_cse);
  nor_427_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_308));
  mux_309_nl <= MUX_s_1_2_2(nor_427_nl, mux_tmp_308, or_818_cse);
  and_dcpl_542 <= mux_309_nl AND and_dcpl_151;
  or_839_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_744_cse <= (result_rem_11cyc_st_3(3)) AND asn_itm_3 AND main_stage_0_4;
  nor_426_nl <= NOT(and_744_cse OR and_dcpl_151);
  or_841_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_150);
  mux_tmp_310 <= MUX_s_1_2_2(nor_426_nl, or_841_nl, or_839_cse);
  nand_58_cse <= NOT((result_rem_11cyc_st_2(3)) AND asn_itm_2 AND main_stage_0_3);
  and_745_nl <= nand_58_cse AND mux_tmp_310;
  mux_tmp_311 <= MUX_s_1_2_2(and_745_nl, mux_tmp_310, or_830_cse);
  and_746_nl <= not_tmp_645 AND mux_tmp_311;
  mux_tmp_312 <= MUX_s_1_2_2(and_746_nl, mux_tmp_311, or_823_cse);
  nor_425_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_312));
  mux_313_nl <= MUX_s_1_2_2(nor_425_nl, mux_tmp_312, or_818_cse);
  and_dcpl_546 <= mux_313_nl AND and_dcpl_122;
  or_850_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_740_cse <= (result_rem_11cyc_st_4(3)) AND asn_itm_4 AND main_stage_0_5;
  nor_424_nl <= NOT(and_740_cse OR and_dcpl_122);
  or_852_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1000")) OR (NOT
      and_dcpl_105);
  mux_tmp_314 <= MUX_s_1_2_2(nor_424_nl, or_852_nl, or_850_cse);
  nand_55_cse <= NOT((result_rem_11cyc_st_3(3)) AND asn_itm_3 AND main_stage_0_4);
  and_741_nl <= nand_55_cse AND mux_tmp_314;
  mux_tmp_315 <= MUX_s_1_2_2(and_741_nl, mux_tmp_314, or_839_cse);
  and_742_nl <= nand_58_cse AND mux_tmp_315;
  mux_tmp_316 <= MUX_s_1_2_2(and_742_nl, mux_tmp_315, or_830_cse);
  and_743_nl <= not_tmp_645 AND mux_tmp_316;
  mux_tmp_317 <= MUX_s_1_2_2(and_743_nl, mux_tmp_316, or_823_cse);
  nor_423_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_317));
  mux_318_nl <= MUX_s_1_2_2(nor_423_nl, mux_tmp_317, or_818_cse);
  and_dcpl_549 <= mux_318_nl AND and_dcpl_100;
  or_863_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1000"));
  nor_422_nl <= NOT(and_dcpl_105 OR and_dcpl_100);
  or_865_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_99);
  mux_tmp_319 <= MUX_s_1_2_2(nor_422_nl, or_865_nl, or_863_cse);
  nand_51_cse <= NOT((result_rem_11cyc_st_4(3)) AND asn_itm_4 AND main_stage_0_5);
  and_736_nl <= nand_51_cse AND mux_tmp_319;
  mux_tmp_320 <= MUX_s_1_2_2(and_736_nl, mux_tmp_319, or_850_cse);
  and_737_nl <= nand_55_cse AND mux_tmp_320;
  mux_tmp_321 <= MUX_s_1_2_2(and_737_nl, mux_tmp_320, or_839_cse);
  and_738_nl <= nand_58_cse AND mux_tmp_321;
  mux_tmp_322 <= MUX_s_1_2_2(and_738_nl, mux_tmp_321, or_830_cse);
  and_739_nl <= not_tmp_645 AND mux_tmp_322;
  mux_tmp_323 <= MUX_s_1_2_2(and_739_nl, mux_tmp_322, or_823_cse);
  nor_421_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_323));
  mux_324_nl <= MUX_s_1_2_2(nor_421_nl, mux_tmp_323, or_818_cse);
  and_dcpl_552 <= mux_324_nl AND and_dcpl_74;
  or_878_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  and_731_cse <= (result_rem_11cyc_st_6(3)) AND asn_itm_6 AND main_stage_0_7;
  nor_419_nl <= NOT(and_731_cse OR and_dcpl_74);
  or_880_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
      OR (NOT and_dcpl_73);
  mux_tmp_325 <= MUX_s_1_2_2(nor_419_nl, or_880_nl, or_878_cse);
  nor_420_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_325));
  mux_tmp_326 <= MUX_s_1_2_2(nor_420_nl, mux_tmp_325, or_863_cse);
  and_732_nl <= nand_51_cse AND mux_tmp_326;
  mux_tmp_327 <= MUX_s_1_2_2(and_732_nl, mux_tmp_326, or_850_cse);
  and_733_nl <= nand_55_cse AND mux_tmp_327;
  mux_tmp_328 <= MUX_s_1_2_2(and_733_nl, mux_tmp_327, or_839_cse);
  and_734_nl <= nand_58_cse AND mux_tmp_328;
  mux_tmp_329 <= MUX_s_1_2_2(and_734_nl, mux_tmp_328, or_830_cse);
  and_735_nl <= not_tmp_645 AND mux_tmp_329;
  mux_tmp_330 <= MUX_s_1_2_2(and_735_nl, mux_tmp_329, or_823_cse);
  nor_418_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_330));
  mux_331_nl <= MUX_s_1_2_2(nor_418_nl, mux_tmp_330, or_818_cse);
  and_dcpl_556 <= mux_331_nl AND and_dcpl_45;
  and_725_cse <= (result_rem_11cyc_st_7(3)) AND asn_itm_7 AND main_stage_0_8;
  nor_415_nl <= NOT(and_725_cse OR and_dcpl_45);
  or_897_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1000")) OR (NOT
      and_dcpl_28);
  or_895_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_332 <= MUX_s_1_2_2(nor_415_nl, or_897_nl, or_895_nl);
  nand_42_cse <= NOT((result_rem_11cyc_st_6(3)) AND asn_itm_6 AND main_stage_0_7);
  and_726_nl <= nand_42_cse AND mux_tmp_332;
  mux_tmp_333 <= MUX_s_1_2_2(and_726_nl, mux_tmp_332, or_878_cse);
  nor_416_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_333));
  mux_tmp_334 <= MUX_s_1_2_2(nor_416_nl, mux_tmp_333, or_863_cse);
  and_727_nl <= nand_51_cse AND mux_tmp_334;
  mux_tmp_335 <= MUX_s_1_2_2(and_727_nl, mux_tmp_334, or_850_cse);
  and_728_nl <= nand_55_cse AND mux_tmp_335;
  mux_tmp_336 <= MUX_s_1_2_2(and_728_nl, mux_tmp_335, or_839_cse);
  and_729_nl <= nand_58_cse AND mux_tmp_336;
  mux_tmp_337 <= MUX_s_1_2_2(and_729_nl, mux_tmp_336, or_830_cse);
  and_730_nl <= not_tmp_645 AND mux_tmp_337;
  mux_tmp_338 <= MUX_s_1_2_2(and_730_nl, mux_tmp_337, or_823_cse);
  nor_417_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_338));
  mux_339_nl <= MUX_s_1_2_2(nor_417_nl, mux_tmp_338, or_818_cse);
  and_dcpl_560 <= mux_339_nl AND and_dcpl_4 AND and_dcpl_18 AND (NOT (result_rem_11cyc_st_9(0)));
  or_tmp_897 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1000"));
  nor_407_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_897));
  or_914_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_340 <= MUX_s_1_2_2(nor_407_nl, or_tmp_897, or_914_nl);
  nor_408_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_340));
  or_913_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_341 <= MUX_s_1_2_2(nor_408_nl, mux_tmp_340, or_913_nl);
  nor_409_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_341));
  or_912_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_342 <= MUX_s_1_2_2(nor_409_nl, mux_tmp_341, or_912_nl);
  nor_410_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_342));
  or_911_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_343 <= MUX_s_1_2_2(nor_410_nl, mux_tmp_342, or_911_nl);
  nor_411_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_343));
  or_910_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_344 <= MUX_s_1_2_2(nor_411_nl, mux_tmp_343, or_910_nl);
  nor_412_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_344));
  or_909_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_345 <= MUX_s_1_2_2(nor_412_nl, mux_tmp_344, or_909_nl);
  nor_413_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_345));
  or_908_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000"));
  mux_tmp_346 <= MUX_s_1_2_2(nor_413_nl, mux_tmp_345, or_908_nl);
  and_724_nl <= not_tmp_645 AND mux_tmp_346;
  mux_tmp_347 <= MUX_s_1_2_2(and_724_nl, mux_tmp_346, or_823_cse);
  nor_414_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_347));
  mux_tmp_348 <= MUX_s_1_2_2(nor_414_nl, mux_tmp_347, or_818_cse);
  and_dcpl_566 <= and_dcpl_532 AND and_dcpl_318;
  or_tmp_909 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR not_tmp_645;
  or_928_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1001"));
  nor_406_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_909));
  mux_349_nl <= MUX_s_1_2_2(nor_406_nl, or_tmp_909, or_928_cse);
  and_dcpl_568 <= mux_349_nl AND and_dcpl_204;
  or_933_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_405_nl <= NOT(and_749_cse OR and_dcpl_204);
  or_935_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_202);
  mux_tmp_350 <= MUX_s_1_2_2(nor_405_nl, or_935_nl, or_933_cse);
  nor_404_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_350));
  mux_351_nl <= MUX_s_1_2_2(nor_404_nl, mux_tmp_350, or_928_cse);
  and_dcpl_570 <= mux_351_nl AND and_dcpl_178;
  or_940_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_403_nl <= NOT(and_747_cse OR and_dcpl_178);
  or_942_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_176);
  mux_tmp_352 <= MUX_s_1_2_2(nor_403_nl, or_942_nl, or_940_cse);
  and_722_nl <= not_tmp_645 AND mux_tmp_352;
  mux_tmp_353 <= MUX_s_1_2_2(and_722_nl, mux_tmp_352, or_933_cse);
  nor_402_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_353));
  mux_354_nl <= MUX_s_1_2_2(nor_402_nl, mux_tmp_353, or_928_cse);
  and_dcpl_572 <= mux_354_nl AND and_dcpl_152;
  or_949_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_401_nl <= NOT(and_744_cse OR and_dcpl_152);
  or_951_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_150);
  mux_tmp_355 <= MUX_s_1_2_2(nor_401_nl, or_951_nl, or_949_cse);
  and_719_nl <= nand_58_cse AND mux_tmp_355;
  mux_tmp_356 <= MUX_s_1_2_2(and_719_nl, mux_tmp_355, or_940_cse);
  and_720_nl <= not_tmp_645 AND mux_tmp_356;
  mux_tmp_357 <= MUX_s_1_2_2(and_720_nl, mux_tmp_356, or_933_cse);
  nor_400_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_357));
  mux_358_nl <= MUX_s_1_2_2(nor_400_nl, mux_tmp_357, or_928_cse);
  and_dcpl_576 <= mux_358_nl AND and_dcpl_125;
  or_960_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_399_nl <= NOT(and_740_cse OR and_dcpl_125);
  or_962_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1001")) OR (NOT
      and_dcpl_105);
  mux_tmp_359 <= MUX_s_1_2_2(nor_399_nl, or_962_nl, or_960_cse);
  and_715_nl <= nand_55_cse AND mux_tmp_359;
  mux_tmp_360 <= MUX_s_1_2_2(and_715_nl, mux_tmp_359, or_949_cse);
  and_716_nl <= nand_58_cse AND mux_tmp_360;
  mux_tmp_361 <= MUX_s_1_2_2(and_716_nl, mux_tmp_360, or_940_cse);
  and_717_nl <= not_tmp_645 AND mux_tmp_361;
  mux_tmp_362 <= MUX_s_1_2_2(and_717_nl, mux_tmp_361, or_933_cse);
  nor_398_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_362));
  mux_363_nl <= MUX_s_1_2_2(nor_398_nl, mux_tmp_362, or_928_cse);
  and_dcpl_578 <= mux_363_nl AND and_dcpl_101;
  or_973_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1001"));
  nor_397_nl <= NOT(and_dcpl_105 OR and_dcpl_101);
  or_975_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_99);
  mux_tmp_364 <= MUX_s_1_2_2(nor_397_nl, or_975_nl, or_973_cse);
  and_710_nl <= nand_51_cse AND mux_tmp_364;
  mux_tmp_365 <= MUX_s_1_2_2(and_710_nl, mux_tmp_364, or_960_cse);
  and_711_nl <= nand_55_cse AND mux_tmp_365;
  mux_tmp_366 <= MUX_s_1_2_2(and_711_nl, mux_tmp_365, or_949_cse);
  and_712_nl <= nand_58_cse AND mux_tmp_366;
  mux_tmp_367 <= MUX_s_1_2_2(and_712_nl, mux_tmp_366, or_940_cse);
  and_713_nl <= not_tmp_645 AND mux_tmp_367;
  mux_tmp_368 <= MUX_s_1_2_2(and_713_nl, mux_tmp_367, or_933_cse);
  nor_396_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_368));
  mux_369_nl <= MUX_s_1_2_2(nor_396_nl, mux_tmp_368, or_928_cse);
  and_dcpl_580 <= mux_369_nl AND and_dcpl_75;
  or_988_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  nor_394_nl <= NOT(and_731_cse OR and_dcpl_75);
  or_990_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"))
      OR (NOT and_dcpl_73);
  mux_tmp_370 <= MUX_s_1_2_2(nor_394_nl, or_990_nl, or_988_cse);
  nor_395_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_370));
  mux_tmp_371 <= MUX_s_1_2_2(nor_395_nl, mux_tmp_370, or_973_cse);
  and_706_nl <= nand_51_cse AND mux_tmp_371;
  mux_tmp_372 <= MUX_s_1_2_2(and_706_nl, mux_tmp_371, or_960_cse);
  and_707_nl <= nand_55_cse AND mux_tmp_372;
  mux_tmp_373 <= MUX_s_1_2_2(and_707_nl, mux_tmp_372, or_949_cse);
  and_708_nl <= nand_58_cse AND mux_tmp_373;
  mux_tmp_374 <= MUX_s_1_2_2(and_708_nl, mux_tmp_373, or_940_cse);
  and_709_nl <= not_tmp_645 AND mux_tmp_374;
  mux_tmp_375 <= MUX_s_1_2_2(and_709_nl, mux_tmp_374, or_933_cse);
  nor_393_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_375));
  mux_376_nl <= MUX_s_1_2_2(nor_393_nl, mux_tmp_375, or_928_cse);
  and_dcpl_583 <= mux_376_nl AND and_dcpl_47;
  nor_390_nl <= NOT(and_725_cse OR and_dcpl_47);
  or_1007_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1001")) OR
      (NOT and_dcpl_28);
  or_1005_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_377 <= MUX_s_1_2_2(nor_390_nl, or_1007_nl, or_1005_nl);
  and_700_nl <= nand_42_cse AND mux_tmp_377;
  mux_tmp_378 <= MUX_s_1_2_2(and_700_nl, mux_tmp_377, or_988_cse);
  nor_391_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_378));
  mux_tmp_379 <= MUX_s_1_2_2(nor_391_nl, mux_tmp_378, or_973_cse);
  and_701_nl <= nand_51_cse AND mux_tmp_379;
  mux_tmp_380 <= MUX_s_1_2_2(and_701_nl, mux_tmp_379, or_960_cse);
  and_702_nl <= nand_55_cse AND mux_tmp_380;
  mux_tmp_381 <= MUX_s_1_2_2(and_702_nl, mux_tmp_380, or_949_cse);
  and_703_nl <= nand_58_cse AND mux_tmp_381;
  mux_tmp_382 <= MUX_s_1_2_2(and_703_nl, mux_tmp_381, or_940_cse);
  and_704_nl <= not_tmp_645 AND mux_tmp_382;
  mux_tmp_383 <= MUX_s_1_2_2(and_704_nl, mux_tmp_382, or_933_cse);
  nor_392_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_383));
  mux_384_nl <= MUX_s_1_2_2(nor_392_nl, mux_tmp_383, or_928_cse);
  and_dcpl_586 <= mux_384_nl AND and_dcpl_4 AND and_dcpl_18 AND (result_rem_11cyc_st_9(0));
  or_tmp_1005 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1001"));
  nor_383_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_1005));
  or_1024_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_385 <= MUX_s_1_2_2(nor_383_nl, or_tmp_1005, or_1024_nl);
  nor_384_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_385));
  or_1023_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_386 <= MUX_s_1_2_2(nor_384_nl, mux_tmp_385, or_1023_nl);
  nor_385_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_386));
  or_1022_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_387 <= MUX_s_1_2_2(nor_385_nl, mux_tmp_386, or_1022_nl);
  nor_386_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_387));
  or_1021_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_388 <= MUX_s_1_2_2(nor_386_nl, mux_tmp_387, or_1021_nl);
  nor_387_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_388));
  or_1020_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_389 <= MUX_s_1_2_2(nor_387_nl, mux_tmp_388, or_1020_nl);
  nor_388_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_389));
  or_1019_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_390 <= MUX_s_1_2_2(nor_388_nl, mux_tmp_389, or_1019_nl);
  nor_389_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_390));
  or_1018_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("001"));
  mux_tmp_391 <= MUX_s_1_2_2(nor_389_nl, mux_tmp_390, or_1018_nl);
  and_697_nl <= not_tmp_645 AND mux_tmp_391;
  mux_tmp_392 <= MUX_s_1_2_2(and_697_nl, mux_tmp_391, or_933_cse);
  and_698_nl <= nand_146_cse AND mux_tmp_392;
  or_1016_nl <= CONV_SL_1_1(result_result_acc_tmp(3 DOWNTO 1)/=STD_LOGIC_VECTOR'("100"));
  mux_tmp_393 <= MUX_s_1_2_2(and_698_nl, mux_tmp_392, or_1016_nl);
  and_dcpl_590 <= and_dcpl_532 AND and_dcpl_352;
  or_tmp_1017 <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR not_tmp_645;
  or_1037_cse <= CONV_SL_1_1(result_result_acc_tmp/=STD_LOGIC_VECTOR'("1010"));
  nor_382_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_1017));
  mux_394_nl <= MUX_s_1_2_2(nor_382_nl, or_tmp_1017, or_1037_cse);
  and_dcpl_592 <= mux_394_nl AND and_dcpl_205;
  or_1042_cse <= CONV_SL_1_1(result_rem_11cyc(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_381_nl <= NOT(and_749_cse OR and_dcpl_205);
  or_1044_nl <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_202);
  mux_tmp_395 <= MUX_s_1_2_2(nor_381_nl, or_1044_nl, or_1042_cse);
  nor_380_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_395));
  mux_396_nl <= MUX_s_1_2_2(nor_380_nl, mux_tmp_395, or_1037_cse);
  and_dcpl_594 <= mux_396_nl AND and_dcpl_179;
  or_1049_cse <= CONV_SL_1_1(result_rem_11cyc_st_2(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_379_nl <= NOT(and_747_cse OR and_dcpl_179);
  or_1051_nl <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_176);
  mux_tmp_397 <= MUX_s_1_2_2(nor_379_nl, or_1051_nl, or_1049_cse);
  and_695_nl <= not_tmp_645 AND mux_tmp_397;
  mux_tmp_398 <= MUX_s_1_2_2(and_695_nl, mux_tmp_397, or_1042_cse);
  nor_378_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_398));
  mux_399_nl <= MUX_s_1_2_2(nor_378_nl, mux_tmp_398, or_1037_cse);
  and_dcpl_596 <= mux_399_nl AND and_dcpl_153;
  or_1058_cse <= CONV_SL_1_1(result_rem_11cyc_st_3(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_377_nl <= NOT(and_744_cse OR and_dcpl_153);
  or_1060_nl <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_150);
  mux_tmp_400 <= MUX_s_1_2_2(nor_377_nl, or_1060_nl, or_1058_cse);
  and_692_nl <= nand_58_cse AND mux_tmp_400;
  mux_tmp_401 <= MUX_s_1_2_2(and_692_nl, mux_tmp_400, or_1049_cse);
  and_693_nl <= not_tmp_645 AND mux_tmp_401;
  mux_tmp_402 <= MUX_s_1_2_2(and_693_nl, mux_tmp_401, or_1042_cse);
  nor_376_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_402));
  mux_403_nl <= MUX_s_1_2_2(nor_376_nl, mux_tmp_402, or_1037_cse);
  and_dcpl_599 <= mux_403_nl AND and_dcpl_127;
  or_1069_cse <= CONV_SL_1_1(result_rem_11cyc_st_4(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_375_nl <= NOT(and_740_cse OR and_dcpl_127);
  or_1071_nl <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1010")) OR
      (NOT and_dcpl_105);
  mux_tmp_404 <= MUX_s_1_2_2(nor_375_nl, or_1071_nl, or_1069_cse);
  and_688_nl <= nand_55_cse AND mux_tmp_404;
  mux_tmp_405 <= MUX_s_1_2_2(and_688_nl, mux_tmp_404, or_1058_cse);
  and_689_nl <= nand_58_cse AND mux_tmp_405;
  mux_tmp_406 <= MUX_s_1_2_2(and_689_nl, mux_tmp_405, or_1049_cse);
  and_690_nl <= not_tmp_645 AND mux_tmp_406;
  mux_tmp_407 <= MUX_s_1_2_2(and_690_nl, mux_tmp_406, or_1042_cse);
  nor_374_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_407));
  mux_408_nl <= MUX_s_1_2_2(nor_374_nl, mux_tmp_407, or_1037_cse);
  and_dcpl_601 <= mux_408_nl AND and_dcpl_102;
  or_1082_cse <= CONV_SL_1_1(result_rem_11cyc_st_5/=STD_LOGIC_VECTOR'("1010"));
  nor_373_nl <= NOT(and_dcpl_105 OR and_dcpl_102);
  or_1084_nl <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_99);
  mux_tmp_409 <= MUX_s_1_2_2(nor_373_nl, or_1084_nl, or_1082_cse);
  and_683_nl <= nand_51_cse AND mux_tmp_409;
  mux_tmp_410 <= MUX_s_1_2_2(and_683_nl, mux_tmp_409, or_1069_cse);
  and_684_nl <= nand_55_cse AND mux_tmp_410;
  mux_tmp_411 <= MUX_s_1_2_2(and_684_nl, mux_tmp_410, or_1058_cse);
  and_685_nl <= nand_58_cse AND mux_tmp_411;
  mux_tmp_412 <= MUX_s_1_2_2(and_685_nl, mux_tmp_411, or_1049_cse);
  and_686_nl <= not_tmp_645 AND mux_tmp_412;
  mux_tmp_413 <= MUX_s_1_2_2(and_686_nl, mux_tmp_412, or_1042_cse);
  nor_372_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_413));
  mux_414_nl <= MUX_s_1_2_2(nor_372_nl, mux_tmp_413, or_1037_cse);
  and_dcpl_603 <= mux_414_nl AND and_dcpl_76;
  or_1097_cse <= CONV_SL_1_1(result_rem_11cyc_st_6(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  nor_370_nl <= NOT(and_731_cse OR and_dcpl_76);
  or_1099_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"))
      OR (NOT and_dcpl_73);
  mux_tmp_415 <= MUX_s_1_2_2(nor_370_nl, or_1099_nl, or_1097_cse);
  nor_371_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_415));
  mux_tmp_416 <= MUX_s_1_2_2(nor_371_nl, mux_tmp_415, or_1082_cse);
  and_679_nl <= nand_51_cse AND mux_tmp_416;
  mux_tmp_417 <= MUX_s_1_2_2(and_679_nl, mux_tmp_416, or_1069_cse);
  and_680_nl <= nand_55_cse AND mux_tmp_417;
  mux_tmp_418 <= MUX_s_1_2_2(and_680_nl, mux_tmp_417, or_1058_cse);
  and_681_nl <= nand_58_cse AND mux_tmp_418;
  mux_tmp_419 <= MUX_s_1_2_2(and_681_nl, mux_tmp_418, or_1049_cse);
  and_682_nl <= not_tmp_645 AND mux_tmp_419;
  mux_tmp_420 <= MUX_s_1_2_2(and_682_nl, mux_tmp_419, or_1042_cse);
  nor_369_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_420));
  mux_421_nl <= MUX_s_1_2_2(nor_369_nl, mux_tmp_420, or_1037_cse);
  and_dcpl_607 <= mux_421_nl AND and_dcpl_50;
  nor_366_nl <= NOT(and_725_cse OR and_dcpl_50);
  or_1116_nl <= CONV_SL_1_1(result_rem_11cyc_st_8/=STD_LOGIC_VECTOR'("1010")) OR
      (NOT and_dcpl_28);
  or_1114_nl <= CONV_SL_1_1(result_rem_11cyc_st_7(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_422 <= MUX_s_1_2_2(nor_366_nl, or_1116_nl, or_1114_nl);
  and_673_nl <= nand_42_cse AND mux_tmp_422;
  mux_tmp_423 <= MUX_s_1_2_2(and_673_nl, mux_tmp_422, or_1097_cse);
  nor_367_nl <= NOT(and_dcpl_105 OR (NOT mux_tmp_423));
  mux_tmp_424 <= MUX_s_1_2_2(nor_367_nl, mux_tmp_423, or_1082_cse);
  and_674_nl <= nand_51_cse AND mux_tmp_424;
  mux_tmp_425 <= MUX_s_1_2_2(and_674_nl, mux_tmp_424, or_1069_cse);
  and_675_nl <= nand_55_cse AND mux_tmp_425;
  mux_tmp_426 <= MUX_s_1_2_2(and_675_nl, mux_tmp_425, or_1058_cse);
  and_676_nl <= nand_58_cse AND mux_tmp_426;
  mux_tmp_427 <= MUX_s_1_2_2(and_676_nl, mux_tmp_426, or_1049_cse);
  and_677_nl <= not_tmp_645 AND mux_tmp_427;
  mux_tmp_428 <= MUX_s_1_2_2(and_677_nl, mux_tmp_427, or_1042_cse);
  nor_368_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_428));
  mux_429_nl <= MUX_s_1_2_2(nor_368_nl, mux_tmp_428, or_1037_cse);
  and_dcpl_611 <= mux_429_nl AND and_dcpl_4 AND (result_rem_11cyc_st_9(3)) AND (result_rem_11cyc_st_9(1))
      AND (NOT (result_rem_11cyc_st_9(0)));
  or_tmp_1113 <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(result_rem_11cyc_st_9/=STD_LOGIC_VECTOR'("1010"));
  nor_358_nl <= NOT((result_rem_11cyc_st_8(3)) OR (NOT or_tmp_1113));
  or_1133_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(result_rem_11cyc_st_8(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_430 <= MUX_s_1_2_2(nor_358_nl, or_tmp_1113, or_1133_nl);
  nor_359_nl <= NOT((result_rem_11cyc_st_7(3)) OR (NOT mux_tmp_430));
  or_1132_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(result_rem_11cyc_st_7(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_431 <= MUX_s_1_2_2(nor_359_nl, mux_tmp_430, or_1132_nl);
  nor_360_nl <= NOT((result_rem_11cyc_st_6(3)) OR (NOT mux_tmp_431));
  or_1131_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(result_rem_11cyc_st_6(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_432 <= MUX_s_1_2_2(nor_360_nl, mux_tmp_431, or_1131_nl);
  nor_361_nl <= NOT((result_rem_11cyc_st_5(3)) OR (NOT mux_tmp_432));
  or_1130_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(result_rem_11cyc_st_5(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_433 <= MUX_s_1_2_2(nor_361_nl, mux_tmp_432, or_1130_nl);
  nor_362_nl <= NOT((result_rem_11cyc_st_4(3)) OR (NOT mux_tmp_433));
  or_1129_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(result_rem_11cyc_st_4(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_434 <= MUX_s_1_2_2(nor_362_nl, mux_tmp_433, or_1129_nl);
  nor_363_nl <= NOT((result_rem_11cyc_st_3(3)) OR (NOT mux_tmp_434));
  or_1128_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(result_rem_11cyc_st_3(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_435 <= MUX_s_1_2_2(nor_363_nl, mux_tmp_434, or_1128_nl);
  nor_364_nl <= NOT((result_rem_11cyc_st_2(3)) OR (NOT mux_tmp_435));
  or_1127_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(result_rem_11cyc_st_2(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("010"));
  mux_tmp_436 <= MUX_s_1_2_2(nor_364_nl, mux_tmp_435, or_1127_nl);
  and_671_nl <= not_tmp_645 AND mux_tmp_436;
  mux_tmp_437 <= MUX_s_1_2_2(and_671_nl, mux_tmp_436, or_1042_cse);
  nor_365_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_437));
  mux_tmp_438 <= MUX_s_1_2_2(nor_365_nl, mux_tmp_437, or_1037_cse);
  return_rsci_d_mx0c0 <= and_dcpl_235 AND and_dcpl_233;
  return_rsci_d_mx0c1 <= and_dcpl_235 AND and_dcpl_237;
  return_rsci_d_mx0c2 <= and_dcpl_235 AND and_dcpl_240;
  return_rsci_d_mx0c3 <= and_dcpl_235 AND and_dcpl_239 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c4 <= and_dcpl_235 AND and_dcpl_244 AND (NOT (result_rem_11cyc_st_11(0)));
  return_rsci_d_mx0c5 <= and_dcpl_235 AND and_dcpl_244 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c6 <= and_dcpl_235 AND and_dcpl_249 AND (NOT (result_rem_11cyc_st_11(0)));
  return_rsci_d_mx0c7 <= and_dcpl_235 AND and_dcpl_249 AND (result_rem_11cyc_st_11(0));
  return_rsci_d_mx0c8 <= and_dcpl_254 AND and_dcpl_233;
  return_rsci_d_mx0c9 <= and_dcpl_254 AND and_dcpl_237;
  return_rsci_d_mx0c10 <= and_dcpl_254 AND and_dcpl_240;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( (ccs_ccore_en AND (return_rsci_d_mx0c0 OR return_rsci_d_mx0c1 OR return_rsci_d_mx0c2
          OR return_rsci_d_mx0c3 OR return_rsci_d_mx0c4 OR return_rsci_d_mx0c5 OR
          return_rsci_d_mx0c6 OR return_rsci_d_mx0c7 OR return_rsci_d_mx0c8 OR return_rsci_d_mx0c9
          OR return_rsci_d_mx0c10)) = '1' ) THEN
        return_rsci_d <= MUX1HOT_v_64_11_2(result_rem_12_cmp_1_z, result_rem_12_cmp_2_z,
            result_rem_12_cmp_3_z, result_rem_12_cmp_4_z, result_rem_12_cmp_5_z,
            result_rem_12_cmp_6_z, result_rem_12_cmp_7_z, result_rem_12_cmp_8_z,
            result_rem_12_cmp_9_z, result_rem_12_cmp_10_z, result_rem_12_cmp_z, STD_LOGIC_VECTOR'(
            return_rsci_d_mx0c0 & return_rsci_d_mx0c1 & return_rsci_d_mx0c2 & return_rsci_d_mx0c3
            & return_rsci_d_mx0c4 & return_rsci_d_mx0c5 & return_rsci_d_mx0c6 & return_rsci_d_mx0c7
            & return_rsci_d_mx0c8 & return_rsci_d_mx0c9 & return_rsci_d_mx0c10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_11 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND main_stage_0_11 AND asn_itm_10) = '1' ) THEN
        result_rem_11cyc_st_11 <= result_rem_11cyc_st_10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        asn_itm_11 <= '0';
        asn_itm_10 <= '0';
        asn_itm_9 <= '0';
        asn_itm_8 <= '0';
        asn_itm_7 <= '0';
        asn_itm_6 <= '0';
        asn_itm_5 <= '0';
        asn_itm_4 <= '0';
        asn_itm_3 <= '0';
        asn_itm_2 <= '0';
        asn_itm_1 <= '0';
        main_stage_0_2 <= '0';
        main_stage_0_3 <= '0';
        main_stage_0_4 <= '0';
        main_stage_0_5 <= '0';
        main_stage_0_6 <= '0';
        main_stage_0_7 <= '0';
        main_stage_0_8 <= '0';
        main_stage_0_9 <= '0';
        main_stage_0_10 <= '0';
        main_stage_0_11 <= '0';
        main_stage_0_12 <= '0';
      ELSIF ( ccs_ccore_en = '1' ) THEN
        asn_itm_11 <= asn_itm_10;
        asn_itm_10 <= asn_itm_9;
        asn_itm_9 <= asn_itm_8;
        asn_itm_8 <= asn_itm_7;
        asn_itm_7 <= asn_itm_6;
        asn_itm_6 <= asn_itm_5;
        asn_itm_5 <= asn_itm_4;
        asn_itm_4 <= asn_itm_3;
        asn_itm_3 <= asn_itm_2;
        asn_itm_2 <= asn_itm_1;
        asn_itm_1 <= ccs_ccore_start_rsci_idat;
        main_stage_0_2 <= '1';
        main_stage_0_3 <= main_stage_0_2;
        main_stage_0_4 <= main_stage_0_3;
        main_stage_0_5 <= main_stage_0_4;
        main_stage_0_6 <= main_stage_0_5;
        main_stage_0_7 <= main_stage_0_6;
        main_stage_0_8 <= main_stage_0_7;
        main_stage_0_9 <= main_stage_0_8;
        main_stage_0_10 <= main_stage_0_9;
        main_stage_0_11 <= main_stage_0_10;
        main_stage_0_12 <= main_stage_0_11;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_1_cse = '1' ) THEN
        result_rem_12_cmp_1_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_1_2,
            m_buf_sva_mut_1_3, m_buf_sva_mut_1_4, m_buf_sva_mut_1_5, m_buf_sva_mut_1_6,
            m_buf_sva_mut_1_7, m_buf_sva_mut_1_8, m_buf_sva_mut_1_9, m_buf_sva_mut_1_10,
            STD_LOGIC_VECTOR'( and_dcpl_263 & and_dcpl_269 & and_dcpl_275 & and_dcpl_281
            & and_dcpl_287 & and_dcpl_293 & and_dcpl_299 & and_dcpl_305 & and_dcpl_311
            & mux_tmp_37));
        result_rem_12_cmp_1_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_1_2,
            base_buf_sva_mut_1_3, base_buf_sva_mut_1_4, base_buf_sva_mut_1_5, base_buf_sva_mut_1_6,
            base_buf_sva_mut_1_7, base_buf_sva_mut_1_8, base_buf_sva_mut_1_9, base_buf_sva_mut_1_10,
            STD_LOGIC_VECTOR'( and_dcpl_263 & and_dcpl_269 & and_dcpl_275 & and_dcpl_281
            & and_dcpl_287 & and_dcpl_293 & and_dcpl_299 & and_dcpl_305 & and_dcpl_311
            & mux_tmp_37));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_3_cse = '1' ) THEN
        result_rem_12_cmp_2_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2_2,
            m_buf_sva_mut_2_3, m_buf_sva_mut_2_4, m_buf_sva_mut_2_5, m_buf_sva_mut_2_6,
            m_buf_sva_mut_2_7, m_buf_sva_mut_2_8, m_buf_sva_mut_2_9, m_buf_sva_mut_2_10,
            STD_LOGIC_VECTOR'( and_dcpl_319 & and_dcpl_322 & and_dcpl_325 & and_dcpl_329
            & and_dcpl_333 & and_dcpl_337 & and_dcpl_341 & and_dcpl_344 & and_dcpl_347
            & mux_tmp_75));
        result_rem_12_cmp_2_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2_2,
            base_buf_sva_mut_2_3, base_buf_sva_mut_2_4, base_buf_sva_mut_2_5, base_buf_sva_mut_2_6,
            base_buf_sva_mut_2_7, base_buf_sva_mut_2_8, base_buf_sva_mut_2_9, base_buf_sva_mut_2_10,
            STD_LOGIC_VECTOR'( and_dcpl_319 & and_dcpl_322 & and_dcpl_325 & and_dcpl_329
            & and_dcpl_333 & and_dcpl_337 & and_dcpl_341 & and_dcpl_344 & and_dcpl_347
            & mux_tmp_75));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_5_cse = '1' ) THEN
        result_rem_12_cmp_3_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_3_2,
            m_buf_sva_mut_3_3, m_buf_sva_mut_3_4, m_buf_sva_mut_3_5, m_buf_sva_mut_3_6,
            m_buf_sva_mut_3_7, m_buf_sva_mut_3_8, m_buf_sva_mut_3_9, m_buf_sva_mut_3_10,
            STD_LOGIC_VECTOR'( and_dcpl_353 & and_dcpl_357 & and_dcpl_361 & and_dcpl_364
            & and_dcpl_367 & and_dcpl_370 & and_dcpl_373 & and_dcpl_377 & and_dcpl_381
            & mux_tmp_113));
        result_rem_12_cmp_3_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_3_2,
            base_buf_sva_mut_3_3, base_buf_sva_mut_3_4, base_buf_sva_mut_3_5, base_buf_sva_mut_3_6,
            base_buf_sva_mut_3_7, base_buf_sva_mut_3_8, base_buf_sva_mut_3_9, base_buf_sva_mut_3_10,
            STD_LOGIC_VECTOR'( and_dcpl_353 & and_dcpl_357 & and_dcpl_361 & and_dcpl_364
            & and_dcpl_367 & and_dcpl_370 & and_dcpl_373 & and_dcpl_377 & and_dcpl_381
            & mux_tmp_113));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_7_cse = '1' ) THEN
        result_rem_12_cmp_4_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_4_2,
            m_buf_sva_mut_4_3, m_buf_sva_mut_4_4, m_buf_sva_mut_4_5, m_buf_sva_mut_4_6,
            m_buf_sva_mut_4_7, m_buf_sva_mut_4_8, m_buf_sva_mut_4_9, m_buf_sva_mut_4_10,
            STD_LOGIC_VECTOR'( and_dcpl_387 & and_dcpl_390 & and_dcpl_393 & and_dcpl_396
            & and_dcpl_399 & and_dcpl_402 & and_dcpl_405 & and_dcpl_408 & and_dcpl_411
            & mux_tmp_151));
        result_rem_12_cmp_4_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_4_2,
            base_buf_sva_mut_4_3, base_buf_sva_mut_4_4, base_buf_sva_mut_4_5, base_buf_sva_mut_4_6,
            base_buf_sva_mut_4_7, base_buf_sva_mut_4_8, base_buf_sva_mut_4_9, base_buf_sva_mut_4_10,
            STD_LOGIC_VECTOR'( and_dcpl_387 & and_dcpl_390 & and_dcpl_393 & and_dcpl_396
            & and_dcpl_399 & and_dcpl_402 & and_dcpl_405 & and_dcpl_408 & and_dcpl_411
            & mux_tmp_151));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_9_cse = '1' ) THEN
        result_rem_12_cmp_5_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_5_2,
            m_buf_sva_mut_5_3, m_buf_sva_mut_5_4, m_buf_sva_mut_5_5, m_buf_sva_mut_5_6,
            m_buf_sva_mut_5_7, m_buf_sva_mut_5_8, m_buf_sva_mut_5_9, m_buf_sva_mut_5_10,
            STD_LOGIC_VECTOR'( and_dcpl_418 & and_dcpl_422 & and_dcpl_426 & and_dcpl_430
            & and_dcpl_433 & and_dcpl_437 & and_dcpl_441 & and_dcpl_444 & and_dcpl_447
            & mux_tmp_189));
        result_rem_12_cmp_5_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_5_2,
            base_buf_sva_mut_5_3, base_buf_sva_mut_5_4, base_buf_sva_mut_5_5, base_buf_sva_mut_5_6,
            base_buf_sva_mut_5_7, base_buf_sva_mut_5_8, base_buf_sva_mut_5_9, base_buf_sva_mut_5_10,
            STD_LOGIC_VECTOR'( and_dcpl_418 & and_dcpl_422 & and_dcpl_426 & and_dcpl_430
            & and_dcpl_433 & and_dcpl_437 & and_dcpl_441 & and_dcpl_444 & and_dcpl_447
            & mux_tmp_189));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_11_cse = '1' ) THEN
        result_rem_12_cmp_6_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_6_2,
            m_buf_sva_mut_6_3, m_buf_sva_mut_6_4, m_buf_sva_mut_6_5, m_buf_sva_mut_6_6,
            m_buf_sva_mut_6_7, m_buf_sva_mut_6_8, m_buf_sva_mut_6_9, m_buf_sva_mut_6_10,
            STD_LOGIC_VECTOR'( and_dcpl_452 & and_dcpl_455 & and_dcpl_458 & and_dcpl_462
            & and_dcpl_464 & and_dcpl_468 & and_dcpl_472 & and_dcpl_474 & and_dcpl_476
            & mux_tmp_227));
        result_rem_12_cmp_6_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_6_2,
            base_buf_sva_mut_6_3, base_buf_sva_mut_6_4, base_buf_sva_mut_6_5, base_buf_sva_mut_6_6,
            base_buf_sva_mut_6_7, base_buf_sva_mut_6_8, base_buf_sva_mut_6_9, base_buf_sva_mut_6_10,
            STD_LOGIC_VECTOR'( and_dcpl_452 & and_dcpl_455 & and_dcpl_458 & and_dcpl_462
            & and_dcpl_464 & and_dcpl_468 & and_dcpl_472 & and_dcpl_474 & and_dcpl_476
            & mux_tmp_227));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_13_cse = '1' ) THEN
        result_rem_12_cmp_7_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_7_2,
            m_buf_sva_mut_7_3, m_buf_sva_mut_7_4, m_buf_sva_mut_7_5, m_buf_sva_mut_7_6,
            m_buf_sva_mut_7_7, m_buf_sva_mut_7_8, m_buf_sva_mut_7_9, m_buf_sva_mut_7_10,
            STD_LOGIC_VECTOR'( and_dcpl_480 & and_dcpl_484 & and_dcpl_488 & and_dcpl_491
            & and_dcpl_493 & and_dcpl_496 & and_dcpl_499 & and_dcpl_501 & and_dcpl_503
            & mux_tmp_265));
        result_rem_12_cmp_7_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_7_2,
            base_buf_sva_mut_7_3, base_buf_sva_mut_7_4, base_buf_sva_mut_7_5, base_buf_sva_mut_7_6,
            base_buf_sva_mut_7_7, base_buf_sva_mut_7_8, base_buf_sva_mut_7_9, base_buf_sva_mut_7_10,
            STD_LOGIC_VECTOR'( and_dcpl_480 & and_dcpl_484 & and_dcpl_488 & and_dcpl_491
            & and_dcpl_493 & and_dcpl_496 & and_dcpl_499 & and_dcpl_501 & and_dcpl_503
            & mux_tmp_265));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_15_cse = '1' ) THEN
        result_rem_12_cmp_8_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_8_2,
            m_buf_sva_mut_8_3, m_buf_sva_mut_8_4, m_buf_sva_mut_8_5, m_buf_sva_mut_8_6,
            m_buf_sva_mut_8_7, m_buf_sva_mut_8_8, m_buf_sva_mut_8_9, m_buf_sva_mut_8_10,
            STD_LOGIC_VECTOR'( and_dcpl_507 & and_dcpl_510 & and_dcpl_513 & and_dcpl_516
            & and_dcpl_518 & and_dcpl_521 & and_dcpl_524 & and_dcpl_526 & and_dcpl_528
            & mux_tmp_303));
        result_rem_12_cmp_8_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_8_2,
            base_buf_sva_mut_8_3, base_buf_sva_mut_8_4, base_buf_sva_mut_8_5, base_buf_sva_mut_8_6,
            base_buf_sva_mut_8_7, base_buf_sva_mut_8_8, base_buf_sva_mut_8_9, base_buf_sva_mut_8_10,
            STD_LOGIC_VECTOR'( and_dcpl_507 & and_dcpl_510 & and_dcpl_513 & and_dcpl_516
            & and_dcpl_518 & and_dcpl_521 & and_dcpl_524 & and_dcpl_526 & and_dcpl_528
            & mux_tmp_303));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_17_cse = '1' ) THEN
        result_rem_12_cmp_9_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_9_2,
            m_buf_sva_mut_9_3, m_buf_sva_mut_9_4, m_buf_sva_mut_9_5, m_buf_sva_mut_9_6,
            m_buf_sva_mut_9_7, m_buf_sva_mut_9_8, m_buf_sva_mut_9_9, m_buf_sva_mut_9_10,
            STD_LOGIC_VECTOR'( and_dcpl_533 & and_dcpl_536 & and_dcpl_539 & and_dcpl_542
            & and_dcpl_546 & and_dcpl_549 & and_dcpl_552 & and_dcpl_556 & and_dcpl_560
            & mux_tmp_348));
        result_rem_12_cmp_9_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_9_2,
            base_buf_sva_mut_9_3, base_buf_sva_mut_9_4, base_buf_sva_mut_9_5, base_buf_sva_mut_9_6,
            base_buf_sva_mut_9_7, base_buf_sva_mut_9_8, base_buf_sva_mut_9_9, base_buf_sva_mut_9_10,
            STD_LOGIC_VECTOR'( and_dcpl_533 & and_dcpl_536 & and_dcpl_539 & and_dcpl_542
            & and_dcpl_546 & and_dcpl_549 & and_dcpl_552 & and_dcpl_556 & and_dcpl_560
            & mux_tmp_348));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_19_cse = '1' ) THEN
        result_rem_12_cmp_10_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_10_2,
            m_buf_sva_mut_10_3, m_buf_sva_mut_10_4, m_buf_sva_mut_10_5, m_buf_sva_mut_10_6,
            m_buf_sva_mut_10_7, m_buf_sva_mut_10_8, m_buf_sva_mut_10_9, m_buf_sva_mut_10_10,
            STD_LOGIC_VECTOR'( and_dcpl_566 & and_dcpl_568 & and_dcpl_570 & and_dcpl_572
            & and_dcpl_576 & and_dcpl_578 & and_dcpl_580 & and_dcpl_583 & and_dcpl_586
            & mux_tmp_393));
        result_rem_12_cmp_10_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_10_2,
            base_buf_sva_mut_10_3, base_buf_sva_mut_10_4, base_buf_sva_mut_10_5,
            base_buf_sva_mut_10_6, base_buf_sva_mut_10_7, base_buf_sva_mut_10_8,
            base_buf_sva_mut_10_9, base_buf_sva_mut_10_10, STD_LOGIC_VECTOR'( and_dcpl_566
            & and_dcpl_568 & and_dcpl_570 & and_dcpl_572 & and_dcpl_576 & and_dcpl_578
            & and_dcpl_580 & and_dcpl_583 & and_dcpl_586 & mux_tmp_393));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( result_and_21_cse = '1' ) THEN
        result_rem_12_cmp_b <= MUX1HOT_v_64_10_2(m_rsci_idat, m_buf_sva_mut_2, m_buf_sva_mut_3,
            m_buf_sva_mut_4, m_buf_sva_mut_5, m_buf_sva_mut_6, m_buf_sva_mut_7, m_buf_sva_mut_8,
            m_buf_sva_mut_9, m_buf_sva_mut_10, STD_LOGIC_VECTOR'( and_dcpl_590 &
            and_dcpl_592 & and_dcpl_594 & and_dcpl_596 & and_dcpl_599 & and_dcpl_601
            & and_dcpl_603 & and_dcpl_607 & and_dcpl_611 & mux_tmp_438));
        result_rem_12_cmp_a <= MUX1HOT_v_64_10_2(base_rsci_idat, base_buf_sva_mut_2,
            base_buf_sva_mut_3, base_buf_sva_mut_4, base_buf_sva_mut_5, base_buf_sva_mut_6,
            base_buf_sva_mut_7, base_buf_sva_mut_8, base_buf_sva_mut_9, base_buf_sva_mut_10,
            STD_LOGIC_VECTOR'( and_dcpl_590 & and_dcpl_592 & and_dcpl_594 & and_dcpl_596
            & and_dcpl_599 & and_dcpl_601 & and_dcpl_603 & and_dcpl_607 & and_dcpl_611
            & mux_tmp_438));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_cse = '1' ) THEN
        m_buf_sva_mut_1_10 <= m_buf_sva_mut_1_9;
        base_buf_sva_mut_1_10 <= base_buf_sva_mut_1_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_1_cse = '1' ) THEN
        m_buf_sva_mut_2_10 <= m_buf_sva_mut_2_9;
        base_buf_sva_mut_2_10 <= base_buf_sva_mut_2_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_2_cse = '1' ) THEN
        m_buf_sva_mut_3_10 <= m_buf_sva_mut_3_9;
        base_buf_sva_mut_3_10 <= base_buf_sva_mut_3_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_3_cse = '1' ) THEN
        m_buf_sva_mut_4_10 <= m_buf_sva_mut_4_9;
        base_buf_sva_mut_4_10 <= base_buf_sva_mut_4_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_4_cse = '1' ) THEN
        m_buf_sva_mut_5_10 <= m_buf_sva_mut_5_9;
        base_buf_sva_mut_5_10 <= base_buf_sva_mut_5_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_5_cse = '1' ) THEN
        m_buf_sva_mut_6_10 <= m_buf_sva_mut_6_9;
        base_buf_sva_mut_6_10 <= base_buf_sva_mut_6_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_6_cse = '1' ) THEN
        m_buf_sva_mut_7_10 <= m_buf_sva_mut_7_9;
        base_buf_sva_mut_7_10 <= base_buf_sva_mut_7_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_7_cse = '1' ) THEN
        m_buf_sva_mut_8_10 <= m_buf_sva_mut_8_9;
        base_buf_sva_mut_8_10 <= base_buf_sva_mut_8_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_8_cse = '1' ) THEN
        m_buf_sva_mut_9_10 <= m_buf_sva_mut_9_9;
        base_buf_sva_mut_9_10 <= base_buf_sva_mut_9_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_9_cse = '1' ) THEN
        m_buf_sva_mut_10_10 <= m_buf_sva_mut_10_9;
        base_buf_sva_mut_10_10 <= base_buf_sva_mut_10_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_10_cse = '1' ) THEN
        m_buf_sva_mut_10 <= m_buf_sva_mut_9;
        base_buf_sva_mut_10 <= base_buf_sva_mut_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_10 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_3) = '1' ) THEN
        result_rem_11cyc_st_10 <= result_rem_11cyc_st_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_11_cse = '1' ) THEN
        m_buf_sva_mut_1_9 <= m_buf_sva_mut_1_8;
        base_buf_sva_mut_1_9 <= base_buf_sva_mut_1_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_12_cse = '1' ) THEN
        m_buf_sva_mut_2_9 <= m_buf_sva_mut_2_8;
        base_buf_sva_mut_2_9 <= base_buf_sva_mut_2_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_13_cse = '1' ) THEN
        m_buf_sva_mut_3_9 <= m_buf_sva_mut_3_8;
        base_buf_sva_mut_3_9 <= base_buf_sva_mut_3_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_14_cse = '1' ) THEN
        m_buf_sva_mut_4_9 <= m_buf_sva_mut_4_8;
        base_buf_sva_mut_4_9 <= base_buf_sva_mut_4_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_15_cse = '1' ) THEN
        m_buf_sva_mut_5_9 <= m_buf_sva_mut_5_8;
        base_buf_sva_mut_5_9 <= base_buf_sva_mut_5_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_16_cse = '1' ) THEN
        m_buf_sva_mut_6_9 <= m_buf_sva_mut_6_8;
        base_buf_sva_mut_6_9 <= base_buf_sva_mut_6_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_17_cse = '1' ) THEN
        m_buf_sva_mut_7_9 <= m_buf_sva_mut_7_8;
        base_buf_sva_mut_7_9 <= base_buf_sva_mut_7_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_18_cse = '1' ) THEN
        m_buf_sva_mut_8_9 <= m_buf_sva_mut_8_8;
        base_buf_sva_mut_8_9 <= base_buf_sva_mut_8_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_19_cse = '1' ) THEN
        m_buf_sva_mut_9_9 <= m_buf_sva_mut_9_8;
        base_buf_sva_mut_9_9 <= base_buf_sva_mut_9_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_20_cse = '1' ) THEN
        m_buf_sva_mut_10_9 <= m_buf_sva_mut_10_8;
        base_buf_sva_mut_10_9 <= base_buf_sva_mut_10_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_21_cse = '1' ) THEN
        m_buf_sva_mut_9 <= m_buf_sva_mut_8;
        base_buf_sva_mut_9 <= base_buf_sva_mut_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_9 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_28) = '1' ) THEN
        result_rem_11cyc_st_9 <= result_rem_11cyc_st_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_22_cse = '1' ) THEN
        m_buf_sva_mut_1_8 <= m_buf_sva_mut_1_7;
        base_buf_sva_mut_1_8 <= base_buf_sva_mut_1_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_23_cse = '1' ) THEN
        m_buf_sva_mut_2_8 <= m_buf_sva_mut_2_7;
        base_buf_sva_mut_2_8 <= base_buf_sva_mut_2_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_24_cse = '1' ) THEN
        m_buf_sva_mut_3_8 <= m_buf_sva_mut_3_7;
        base_buf_sva_mut_3_8 <= base_buf_sva_mut_3_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_25_cse = '1' ) THEN
        m_buf_sva_mut_4_8 <= m_buf_sva_mut_4_7;
        base_buf_sva_mut_4_8 <= base_buf_sva_mut_4_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_26_cse = '1' ) THEN
        m_buf_sva_mut_5_8 <= m_buf_sva_mut_5_7;
        base_buf_sva_mut_5_8 <= base_buf_sva_mut_5_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_27_cse = '1' ) THEN
        m_buf_sva_mut_6_8 <= m_buf_sva_mut_6_7;
        base_buf_sva_mut_6_8 <= base_buf_sva_mut_6_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_28_cse = '1' ) THEN
        m_buf_sva_mut_7_8 <= m_buf_sva_mut_7_7;
        base_buf_sva_mut_7_8 <= base_buf_sva_mut_7_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_29_cse = '1' ) THEN
        m_buf_sva_mut_8_8 <= m_buf_sva_mut_8_7;
        base_buf_sva_mut_8_8 <= base_buf_sva_mut_8_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_30_cse = '1' ) THEN
        m_buf_sva_mut_9_8 <= m_buf_sva_mut_9_7;
        base_buf_sva_mut_9_8 <= base_buf_sva_mut_9_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_31_cse = '1' ) THEN
        m_buf_sva_mut_10_8 <= m_buf_sva_mut_10_7;
        base_buf_sva_mut_10_8 <= base_buf_sva_mut_10_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_32_cse = '1' ) THEN
        m_buf_sva_mut_8 <= m_buf_sva_mut_7;
        base_buf_sva_mut_8 <= base_buf_sva_mut_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_8 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_53) = '1' ) THEN
        result_rem_11cyc_st_8 <= result_rem_11cyc_st_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_33_cse = '1' ) THEN
        m_buf_sva_mut_1_7 <= m_buf_sva_mut_1_6;
        base_buf_sva_mut_1_7 <= base_buf_sva_mut_1_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_34_cse = '1' ) THEN
        m_buf_sva_mut_2_7 <= m_buf_sva_mut_2_6;
        base_buf_sva_mut_2_7 <= base_buf_sva_mut_2_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_35_cse = '1' ) THEN
        m_buf_sva_mut_3_7 <= m_buf_sva_mut_3_6;
        base_buf_sva_mut_3_7 <= base_buf_sva_mut_3_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_36_cse = '1' ) THEN
        m_buf_sva_mut_4_7 <= m_buf_sva_mut_4_6;
        base_buf_sva_mut_4_7 <= base_buf_sva_mut_4_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_37_cse = '1' ) THEN
        m_buf_sva_mut_5_7 <= m_buf_sva_mut_5_6;
        base_buf_sva_mut_5_7 <= base_buf_sva_mut_5_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_38_cse = '1' ) THEN
        m_buf_sva_mut_6_7 <= m_buf_sva_mut_6_6;
        base_buf_sva_mut_6_7 <= base_buf_sva_mut_6_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_39_cse = '1' ) THEN
        m_buf_sva_mut_7_7 <= m_buf_sva_mut_7_6;
        base_buf_sva_mut_7_7 <= base_buf_sva_mut_7_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_40_cse = '1' ) THEN
        m_buf_sva_mut_8_7 <= m_buf_sva_mut_8_6;
        base_buf_sva_mut_8_7 <= base_buf_sva_mut_8_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_41_cse = '1' ) THEN
        m_buf_sva_mut_9_7 <= m_buf_sva_mut_9_6;
        base_buf_sva_mut_9_7 <= base_buf_sva_mut_9_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_42_cse = '1' ) THEN
        m_buf_sva_mut_10_7 <= m_buf_sva_mut_10_6;
        base_buf_sva_mut_10_7 <= base_buf_sva_mut_10_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_43_cse = '1' ) THEN
        m_buf_sva_mut_7 <= m_buf_sva_mut_6;
        base_buf_sva_mut_7 <= base_buf_sva_mut_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_7 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_79) = '1' ) THEN
        result_rem_11cyc_st_7 <= result_rem_11cyc_st_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_44_cse = '1' ) THEN
        m_buf_sva_mut_1_6 <= m_buf_sva_mut_1_5;
        base_buf_sva_mut_1_6 <= base_buf_sva_mut_1_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_45_cse = '1' ) THEN
        m_buf_sva_mut_2_6 <= m_buf_sva_mut_2_5;
        base_buf_sva_mut_2_6 <= base_buf_sva_mut_2_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_46_cse = '1' ) THEN
        m_buf_sva_mut_3_6 <= m_buf_sva_mut_3_5;
        base_buf_sva_mut_3_6 <= base_buf_sva_mut_3_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_47_cse = '1' ) THEN
        m_buf_sva_mut_4_6 <= m_buf_sva_mut_4_5;
        base_buf_sva_mut_4_6 <= base_buf_sva_mut_4_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_48_cse = '1' ) THEN
        m_buf_sva_mut_5_6 <= m_buf_sva_mut_5_5;
        base_buf_sva_mut_5_6 <= base_buf_sva_mut_5_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_49_cse = '1' ) THEN
        m_buf_sva_mut_6_6 <= m_buf_sva_mut_6_5;
        base_buf_sva_mut_6_6 <= base_buf_sva_mut_6_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_50_cse = '1' ) THEN
        m_buf_sva_mut_7_6 <= m_buf_sva_mut_7_5;
        base_buf_sva_mut_7_6 <= base_buf_sva_mut_7_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_51_cse = '1' ) THEN
        m_buf_sva_mut_8_6 <= m_buf_sva_mut_8_5;
        base_buf_sva_mut_8_6 <= base_buf_sva_mut_8_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_52_cse = '1' ) THEN
        m_buf_sva_mut_9_6 <= m_buf_sva_mut_9_5;
        base_buf_sva_mut_9_6 <= base_buf_sva_mut_9_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_53_cse = '1' ) THEN
        m_buf_sva_mut_10_6 <= m_buf_sva_mut_10_5;
        base_buf_sva_mut_10_6 <= base_buf_sva_mut_10_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_54_cse = '1' ) THEN
        m_buf_sva_mut_6 <= m_buf_sva_mut_5;
        base_buf_sva_mut_6 <= base_buf_sva_mut_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_6 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_105) = '1' ) THEN
        result_rem_11cyc_st_6 <= result_rem_11cyc_st_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_55_cse = '1' ) THEN
        m_buf_sva_mut_1_5 <= m_buf_sva_mut_1_4;
        base_buf_sva_mut_1_5 <= base_buf_sva_mut_1_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_56_cse = '1' ) THEN
        m_buf_sva_mut_2_5 <= m_buf_sva_mut_2_4;
        base_buf_sva_mut_2_5 <= base_buf_sva_mut_2_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_57_cse = '1' ) THEN
        m_buf_sva_mut_3_5 <= m_buf_sva_mut_3_4;
        base_buf_sva_mut_3_5 <= base_buf_sva_mut_3_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_58_cse = '1' ) THEN
        m_buf_sva_mut_4_5 <= m_buf_sva_mut_4_4;
        base_buf_sva_mut_4_5 <= base_buf_sva_mut_4_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_59_cse = '1' ) THEN
        m_buf_sva_mut_5_5 <= m_buf_sva_mut_5_4;
        base_buf_sva_mut_5_5 <= base_buf_sva_mut_5_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_60_cse = '1' ) THEN
        m_buf_sva_mut_6_5 <= m_buf_sva_mut_6_4;
        base_buf_sva_mut_6_5 <= base_buf_sva_mut_6_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_61_cse = '1' ) THEN
        m_buf_sva_mut_7_5 <= m_buf_sva_mut_7_4;
        base_buf_sva_mut_7_5 <= base_buf_sva_mut_7_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_62_cse = '1' ) THEN
        m_buf_sva_mut_8_5 <= m_buf_sva_mut_8_4;
        base_buf_sva_mut_8_5 <= base_buf_sva_mut_8_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_63_cse = '1' ) THEN
        m_buf_sva_mut_9_5 <= m_buf_sva_mut_9_4;
        base_buf_sva_mut_9_5 <= base_buf_sva_mut_9_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_64_cse = '1' ) THEN
        m_buf_sva_mut_10_5 <= m_buf_sva_mut_10_4;
        base_buf_sva_mut_10_5 <= base_buf_sva_mut_10_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_65_cse = '1' ) THEN
        m_buf_sva_mut_5 <= m_buf_sva_mut_4;
        base_buf_sva_mut_5 <= base_buf_sva_mut_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_5 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_130) = '1' ) THEN
        result_rem_11cyc_st_5 <= result_rem_11cyc_st_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_66_cse = '1' ) THEN
        m_buf_sva_mut_1_4 <= m_buf_sva_mut_1_3;
        base_buf_sva_mut_1_4 <= base_buf_sva_mut_1_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_67_cse = '1' ) THEN
        m_buf_sva_mut_2_4 <= m_buf_sva_mut_2_3;
        base_buf_sva_mut_2_4 <= base_buf_sva_mut_2_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_68_cse = '1' ) THEN
        m_buf_sva_mut_3_4 <= m_buf_sva_mut_3_3;
        base_buf_sva_mut_3_4 <= base_buf_sva_mut_3_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_69_cse = '1' ) THEN
        m_buf_sva_mut_4_4 <= m_buf_sva_mut_4_3;
        base_buf_sva_mut_4_4 <= base_buf_sva_mut_4_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_70_cse = '1' ) THEN
        m_buf_sva_mut_5_4 <= m_buf_sva_mut_5_3;
        base_buf_sva_mut_5_4 <= base_buf_sva_mut_5_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_71_cse = '1' ) THEN
        m_buf_sva_mut_6_4 <= m_buf_sva_mut_6_3;
        base_buf_sva_mut_6_4 <= base_buf_sva_mut_6_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_72_cse = '1' ) THEN
        m_buf_sva_mut_7_4 <= m_buf_sva_mut_7_3;
        base_buf_sva_mut_7_4 <= base_buf_sva_mut_7_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_73_cse = '1' ) THEN
        m_buf_sva_mut_8_4 <= m_buf_sva_mut_8_3;
        base_buf_sva_mut_8_4 <= base_buf_sva_mut_8_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_74_cse = '1' ) THEN
        m_buf_sva_mut_9_4 <= m_buf_sva_mut_9_3;
        base_buf_sva_mut_9_4 <= base_buf_sva_mut_9_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_75_cse = '1' ) THEN
        m_buf_sva_mut_10_4 <= m_buf_sva_mut_10_3;
        base_buf_sva_mut_10_4 <= base_buf_sva_mut_10_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_76_cse = '1' ) THEN
        m_buf_sva_mut_4 <= m_buf_sva_mut_3;
        base_buf_sva_mut_4 <= base_buf_sva_mut_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_4 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_156) = '1' ) THEN
        result_rem_11cyc_st_4 <= result_rem_11cyc_st_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_77_cse = '1' ) THEN
        m_buf_sva_mut_1_3 <= m_buf_sva_mut_1_2;
        base_buf_sva_mut_1_3 <= base_buf_sva_mut_1_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_78_cse = '1' ) THEN
        m_buf_sva_mut_2_3 <= m_buf_sva_mut_2_2;
        base_buf_sva_mut_2_3 <= base_buf_sva_mut_2_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_79_cse = '1' ) THEN
        m_buf_sva_mut_3_3 <= m_buf_sva_mut_3_2;
        base_buf_sva_mut_3_3 <= base_buf_sva_mut_3_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_80_cse = '1' ) THEN
        m_buf_sva_mut_4_3 <= m_buf_sva_mut_4_2;
        base_buf_sva_mut_4_3 <= base_buf_sva_mut_4_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_81_cse = '1' ) THEN
        m_buf_sva_mut_5_3 <= m_buf_sva_mut_5_2;
        base_buf_sva_mut_5_3 <= base_buf_sva_mut_5_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_82_cse = '1' ) THEN
        m_buf_sva_mut_6_3 <= m_buf_sva_mut_6_2;
        base_buf_sva_mut_6_3 <= base_buf_sva_mut_6_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_83_cse = '1' ) THEN
        m_buf_sva_mut_7_3 <= m_buf_sva_mut_7_2;
        base_buf_sva_mut_7_3 <= base_buf_sva_mut_7_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_84_cse = '1' ) THEN
        m_buf_sva_mut_8_3 <= m_buf_sva_mut_8_2;
        base_buf_sva_mut_8_3 <= base_buf_sva_mut_8_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_85_cse = '1' ) THEN
        m_buf_sva_mut_9_3 <= m_buf_sva_mut_9_2;
        base_buf_sva_mut_9_3 <= base_buf_sva_mut_9_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_86_cse = '1' ) THEN
        m_buf_sva_mut_10_3 <= m_buf_sva_mut_10_2;
        base_buf_sva_mut_10_3 <= base_buf_sva_mut_10_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_87_cse = '1' ) THEN
        m_buf_sva_mut_3 <= m_buf_sva_mut_2;
        base_buf_sva_mut_3 <= base_buf_sva_mut_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_3 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_182) = '1' ) THEN
        result_rem_11cyc_st_3 <= result_rem_11cyc_st_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_88_cse = '1' ) THEN
        m_buf_sva_mut_1_2 <= result_rem_12_cmp_1_b;
        base_buf_sva_mut_1_2 <= result_rem_12_cmp_1_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_89_cse = '1' ) THEN
        m_buf_sva_mut_2_2 <= result_rem_12_cmp_2_b;
        base_buf_sva_mut_2_2 <= result_rem_12_cmp_2_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_90_cse = '1' ) THEN
        m_buf_sva_mut_3_2 <= result_rem_12_cmp_3_b;
        base_buf_sva_mut_3_2 <= result_rem_12_cmp_3_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_91_cse = '1' ) THEN
        m_buf_sva_mut_4_2 <= result_rem_12_cmp_4_b;
        base_buf_sva_mut_4_2 <= result_rem_12_cmp_4_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_92_cse = '1' ) THEN
        m_buf_sva_mut_5_2 <= result_rem_12_cmp_5_b;
        base_buf_sva_mut_5_2 <= result_rem_12_cmp_5_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_93_cse = '1' ) THEN
        m_buf_sva_mut_6_2 <= result_rem_12_cmp_6_b;
        base_buf_sva_mut_6_2 <= result_rem_12_cmp_6_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_94_cse = '1' ) THEN
        m_buf_sva_mut_7_2 <= result_rem_12_cmp_7_b;
        base_buf_sva_mut_7_2 <= result_rem_12_cmp_7_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_95_cse = '1' ) THEN
        m_buf_sva_mut_8_2 <= result_rem_12_cmp_8_b;
        base_buf_sva_mut_8_2 <= result_rem_12_cmp_8_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_96_cse = '1' ) THEN
        m_buf_sva_mut_9_2 <= result_rem_12_cmp_9_b;
        base_buf_sva_mut_9_2 <= result_rem_12_cmp_9_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_97_cse = '1' ) THEN
        m_buf_sva_mut_10_2 <= result_rem_12_cmp_10_b;
        base_buf_sva_mut_10_2 <= result_rem_12_cmp_10_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( m_and_98_cse = '1' ) THEN
        m_buf_sva_mut_2 <= result_rem_12_cmp_b;
        base_buf_sva_mut_2 <= result_rem_12_cmp_a;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc_st_2 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND and_dcpl_208) = '1' ) THEN
        result_rem_11cyc_st_2 <= result_rem_11cyc;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_rem_11cyc <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (ccs_ccore_en AND ccs_ccore_start_rsci_idat) = '1' ) THEN
        result_rem_11cyc <= result_result_acc_tmp;
      END IF;
    END IF;
  END PROCESS;
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
--  Generated date: Tue Aug 31 22:22:44 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
    IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen;

ARCHITECTURE v17 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v17;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    IS
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
END inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen;

ARCHITECTURE v17 OF inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v17;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (33 DOWNTO 0);
    COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
    VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
    STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END inPlaceNTT_DIF_core_core_fsm;

ARCHITECTURE v17 OF inPlaceNTT_DIF_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for inPlaceNTT_DIF_core_core_fsm_1
  TYPE inPlaceNTT_DIF_core_core_fsm_1_ST IS (main_C_0, STAGE_LOOP_C_0, COMP_LOOP_C_0,
      COMP_LOOP_C_1, COMP_LOOP_C_2, COMP_LOOP_C_3, COMP_LOOP_C_4, COMP_LOOP_C_5,
      COMP_LOOP_C_6, COMP_LOOP_C_7, COMP_LOOP_C_8, COMP_LOOP_C_9, COMP_LOOP_C_10,
      COMP_LOOP_C_11, COMP_LOOP_C_12, COMP_LOOP_C_13, COMP_LOOP_C_14, COMP_LOOP_C_15,
      COMP_LOOP_C_16, COMP_LOOP_C_17, COMP_LOOP_C_18, COMP_LOOP_C_19, COMP_LOOP_C_20,
      COMP_LOOP_C_21, COMP_LOOP_C_22, COMP_LOOP_C_23, COMP_LOOP_C_24, COMP_LOOP_C_25,
      COMP_LOOP_C_26, COMP_LOOP_C_27, COMP_LOOP_C_28, VEC_LOOP_C_0, STAGE_LOOP_C_1,
      main_C_1);

  SIGNAL state_var : inPlaceNTT_DIF_core_core_fsm_1_ST;
  SIGNAL state_var_NS : inPlaceNTT_DIF_core_core_fsm_1_ST;

BEGIN
  inPlaceNTT_DIF_core_core_fsm_1 : PROCESS (COMP_LOOP_C_28_tr0, VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN STAGE_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000010");
        state_var_NS <= COMP_LOOP_C_0;
      WHEN COMP_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000100");
        state_var_NS <= COMP_LOOP_C_1;
      WHEN COMP_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000001000");
        state_var_NS <= COMP_LOOP_C_2;
      WHEN COMP_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000010000");
        state_var_NS <= COMP_LOOP_C_3;
      WHEN COMP_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000100000");
        state_var_NS <= COMP_LOOP_C_4;
      WHEN COMP_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000001000000");
        state_var_NS <= COMP_LOOP_C_5;
      WHEN COMP_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000010000000");
        state_var_NS <= COMP_LOOP_C_6;
      WHEN COMP_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000100000000");
        state_var_NS <= COMP_LOOP_C_7;
      WHEN COMP_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000001000000000");
        state_var_NS <= COMP_LOOP_C_8;
      WHEN COMP_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000010000000000");
        state_var_NS <= COMP_LOOP_C_9;
      WHEN COMP_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000100000000000");
        state_var_NS <= COMP_LOOP_C_10;
      WHEN COMP_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000001000000000000");
        state_var_NS <= COMP_LOOP_C_11;
      WHEN COMP_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000010000000000000");
        state_var_NS <= COMP_LOOP_C_12;
      WHEN COMP_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000100000000000000");
        state_var_NS <= COMP_LOOP_C_13;
      WHEN COMP_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000001000000000000000");
        state_var_NS <= COMP_LOOP_C_14;
      WHEN COMP_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000010000000000000000");
        state_var_NS <= COMP_LOOP_C_15;
      WHEN COMP_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000100000000000000000");
        state_var_NS <= COMP_LOOP_C_16;
      WHEN COMP_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000001000000000000000000");
        state_var_NS <= COMP_LOOP_C_17;
      WHEN COMP_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000010000000000000000000");
        state_var_NS <= COMP_LOOP_C_18;
      WHEN COMP_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000100000000000000000000");
        state_var_NS <= COMP_LOOP_C_19;
      WHEN COMP_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000001000000000000000000000");
        state_var_NS <= COMP_LOOP_C_20;
      WHEN COMP_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000010000000000000000000000");
        state_var_NS <= COMP_LOOP_C_21;
      WHEN COMP_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000100000000000000000000000");
        state_var_NS <= COMP_LOOP_C_22;
      WHEN COMP_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000001000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_23;
      WHEN COMP_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000010000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_24;
      WHEN COMP_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000100000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_25;
      WHEN COMP_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_26;
      WHEN COMP_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_27;
      WHEN COMP_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100000000000000000000000000000");
        state_var_NS <= COMP_LOOP_C_28;
      WHEN COMP_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000000000000000000000000000000");
        IF ( COMP_LOOP_C_28_tr0 = '1' ) THEN
          state_var_NS <= VEC_LOOP_C_0;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN VEC_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000000000000000000000000000000");
        IF ( VEC_LOOP_C_0_tr0 = '1' ) THEN
          state_var_NS <= STAGE_LOOP_C_1;
        ELSE
          state_var_NS <= COMP_LOOP_C_0;
        END IF;
      WHEN STAGE_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000000000000000000000000000000");
        IF ( STAGE_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= STAGE_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000000000000000000000000000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000001");
        state_var_NS <= STAGE_LOOP_C_0;
    END CASE;
  END PROCESS inPlaceNTT_DIF_core_core_fsm_1;

  inPlaceNTT_DIF_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS inPlaceNTT_DIF_core_core_fsm_1_REG;

END v17;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core_wait_dp IS
  PORT(
    ensig_cgo_iro : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core_wait_dp;

ARCHITECTURE v17 OF inPlaceNTT_DIF_core_wait_dp IS
  -- Default Constants

BEGIN
  modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v17;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_triosy_lz : OUT STD_LOGIC;
    vec_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    vec_rsci_we_d_pff : OUT STD_LOGIC
  );
END inPlaceNTT_DIF_core;

ARCHITECTURE v17 OF inPlaceNTT_DIF_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (33 DOWNTO 0);
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_6 : STD_LOGIC;
  SIGNAL exit_COMP_LOOP_sva : STD_LOGIC;
  SIGNAL reg_vec_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL VEC_LOOP_j_or_cse : STD_LOGIC;
  SIGNAL and_56_rmff : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_8_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_asn_itm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_1_cse_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_cse_10_1_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_acc_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_k_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL STAGE_LOOP_i_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL STAGE_LOOP_lshift_psp_sva : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_j_10_0_sva_9_0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_itm_10_1_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL VEC_LOOP_j_not_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_j_not_nl : STD_LOGIC;
  SIGNAL COMP_LOOP_acc_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL COMP_LOOP_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL acc_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL VEC_LOOP_mux_2_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL VEC_LOOP_or_1_nl : STD_LOGIC;
  SIGNAL VEC_LOOP_mux_3_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL COMP_LOOP_mux_11_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL p_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL p_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

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
  SIGNAL modulo_dev_cmp_base_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_m_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_return_rsc_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_ccs_ccore_start_rsc_dat : STD_LOGIC;

  SIGNAL COMP_LOOP_twiddle_f_lshift_rg_a : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL COMP_LOOP_twiddle_f_lshift_rg_z : STD_LOGIC_VECTOR (10 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_core_wait_dp
    PORT(
      ensig_cgo_iro : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT inPlaceNTT_DIF_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (33 DOWNTO 0);
      COMP_LOOP_C_28_tr0 : IN STD_LOGIC;
      VEC_LOOP_C_0_tr0 : IN STD_LOGIC;
      STAGE_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (33 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 : STD_LOGIC;
  SIGNAL inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 : STD_LOGIC;

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
  modulo_dev_cmp : modulo_dev
    PORT MAP(
      base_rsc_dat => modulo_dev_cmp_base_rsc_dat,
      m_rsc_dat => modulo_dev_cmp_m_rsc_dat,
      return_rsc_z => modulo_dev_cmp_return_rsc_z_1,
      ccs_ccore_start_rsc_dat => modulo_dev_cmp_ccs_ccore_start_rsc_dat,
      ccs_ccore_clk => clk,
      ccs_ccore_srst => rst,
      ccs_ccore_en => modulo_dev_cmp_ccs_ccore_en
    );
  modulo_dev_cmp_base_rsc_dat <= MUX1HOT_v_64_3_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(vec_rsci_q_d)
      - UNSIGNED(COMP_LOOP_acc_8_itm), 64)), COMP_LOOP_acc_8_itm, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(COMP_LOOP_twiddle_f_asn_itm) * UNSIGNED(modulo_dev_cmp_return_rsc_z)),
      64)), STD_LOGIC_VECTOR'( (fsm_output(4)) & (fsm_output(5)) & (fsm_output(16))));
  modulo_dev_cmp_m_rsc_dat <= p_sva;
  modulo_dev_cmp_return_rsc_z <= modulo_dev_cmp_return_rsc_z_1;
  modulo_dev_cmp_ccs_ccore_start_rsc_dat <= (fsm_output(16)) OR (fsm_output(5)) OR
      (fsm_output(4));

  COMP_LOOP_twiddle_f_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 1,
      signd_a => 0,
      width_s => 4,
      width_z => 11
      )
    PORT MAP(
      a => COMP_LOOP_twiddle_f_lshift_rg_a,
      s => COMP_LOOP_twiddle_f_lshift_rg_s,
      z => COMP_LOOP_twiddle_f_lshift_rg_z
    );
  COMP_LOOP_twiddle_f_lshift_rg_a(0) <= '1';
  COMP_LOOP_twiddle_f_lshift_rg_s <= MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, COMP_LOOP_twiddle_f_acc_3,
      fsm_output(2));
  z_out <= COMP_LOOP_twiddle_f_lshift_rg_z;

  inPlaceNTT_DIF_core_wait_dp_inst : inPlaceNTT_DIF_core_wait_dp
    PORT MAP(
      ensig_cgo_iro => and_56_rmff,
      ensig_cgo => reg_ensig_cgo_cse,
      modulo_dev_cmp_ccs_ccore_en => modulo_dev_cmp_ccs_ccore_en
    );
  inPlaceNTT_DIF_core_core_fsm_inst : inPlaceNTT_DIF_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => inPlaceNTT_DIF_core_core_fsm_inst_fsm_output,
      COMP_LOOP_C_28_tr0 => exit_COMP_LOOP_sva,
      VEC_LOOP_C_0_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0,
      STAGE_LOOP_C_1_tr0 => inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0
    );
  fsm_output <= inPlaceNTT_DIF_core_core_fsm_inst_fsm_output;
  inPlaceNTT_DIF_core_core_fsm_inst_VEC_LOOP_C_0_tr0 <= z_out_1(10);
  inPlaceNTT_DIF_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 <= NOT (z_out_2(4));

  and_56_rmff <= and_dcpl_5 AND (NOT (fsm_output(30))) AND (NOT(CONV_SL_1_1(fsm_output(29
      DOWNTO 28)/=STD_LOGIC_VECTOR'("00")))) AND (NOT (fsm_output(3))) AND (NOT (fsm_output(2)))
      AND (NOT (fsm_output(31))) AND and_dcpl_6;
  VEC_LOOP_j_or_cse <= (fsm_output(1)) OR (fsm_output(31));
  COMP_LOOP_twiddle_f_acc_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STAGE_LOOP_i_3_0_sva)
      + UNSIGNED'( "1111"), 4));
  COMP_LOOP_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0),
      10), 11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_k_10_0_sva_9_0),
      10), 11) + UNSIGNED(STAGE_LOOP_lshift_psp_sva), 11));
  COMP_LOOP_acc_10_itm_10_1_1 <= COMP_LOOP_acc_10_nl(10 DOWNTO 1);
  and_dcpl_5 <= NOT((fsm_output(33)) OR (fsm_output(0)));
  and_dcpl_6 <= NOT((fsm_output(32)) OR (fsm_output(1)));
  vec_rsci_d_d <= MUX_v_64_2_2(modulo_dev_cmp_return_rsc_z, COMP_LOOP_acc_8_itm,
      fsm_output(29));
  vec_rsci_radr_d <= MUX_v_10_2_2(COMP_LOOP_acc_10_itm_10_1_1, COMP_LOOP_acc_1_cse_sva,
      fsm_output(3));
  vec_rsci_wadr_d <= MUX_v_10_2_2(COMP_LOOP_acc_10_cse_10_1_sva, COMP_LOOP_acc_1_cse_sva,
      fsm_output(29));
  vec_rsci_we_d_pff <= CONV_SL_1_1(fsm_output(29 DOWNTO 28)/=STD_LOGIC_VECTOR'("00"));
  vec_rsci_readA_r_ram_ir_internal_RMASK_B_d <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  twiddle_rsci_radr_d <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out(9 DOWNTO 0))
      + UNSIGNED(COMP_LOOP_k_10_0_sva_9_0), 10));
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= fsm_output(2);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(32)) OR (fsm_output(0))) = '1' ) THEN
        STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1010"), COMP_LOOP_twiddle_f_acc_3,
            fsm_output(32));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( and_dcpl_5 = '0' ) THEN
        p_sva <= p_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_vec_rsc_triosy_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
      ELSE
        reg_vec_rsc_triosy_obj_ld_cse <= (NOT (z_out_2(4))) AND (fsm_output(32));
        reg_ensig_cgo_cse <= and_56_rmff;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( VEC_LOOP_j_or_cse = '1' ) THEN
        VEC_LOOP_j_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out_1(9 DOWNTO 0)), VEC_LOOP_j_not_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(and_dcpl_5 AND and_dcpl_6)) = '1' ) THEN
        STAGE_LOOP_lshift_psp_sva <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(32)) OR (fsm_output(2)) OR (fsm_output(0)) OR (fsm_output(31))
          OR (fsm_output(33)) OR (fsm_output(1))) = '1' ) THEN
        COMP_LOOP_k_10_0_sva_9_0 <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"),
            (z_out_2(9 DOWNTO 0)), VEC_LOOP_j_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_COMP_LOOP_sva <= '0';
      ELSIF ( (fsm_output(2)) = '1' ) THEN
        exit_COMP_LOOP_sva <= NOT (z_out_1(10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(2)) = '1' ) THEN
        COMP_LOOP_acc_1_cse_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_j_10_0_sva_9_0)
            + UNSIGNED(COMP_LOOP_k_10_0_sva_9_0), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(2)) = '1' ) THEN
        COMP_LOOP_acc_10_cse_10_1_sva <= COMP_LOOP_acc_10_itm_10_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        COMP_LOOP_twiddle_f_asn_itm <= twiddle_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(17)) OR (fsm_output(3)) OR (fsm_output(4))) = '1' ) THEN
        COMP_LOOP_acc_8_itm <= MUX1HOT_v_64_3_2(vec_rsci_q_d, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_acc_8_nl),
            64)), modulo_dev_cmp_return_rsc_z, STD_LOGIC_VECTOR'( (fsm_output(3))
            & (fsm_output(4)) & (fsm_output(17))));
      END IF;
    END IF;
  END PROCESS;
  VEC_LOOP_j_not_1_nl <= NOT (fsm_output(1));
  VEC_LOOP_j_not_nl <= NOT VEC_LOOP_j_or_cse;
  COMP_LOOP_acc_8_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(vec_rsci_q_d) + UNSIGNED(COMP_LOOP_acc_8_itm),
      64));
  VEC_LOOP_mux_2_nl <= MUX_v_11_2_2(('0' & VEC_LOOP_j_10_0_sva_9_0), z_out_2, fsm_output(2));
  VEC_LOOP_or_1_nl <= (NOT (fsm_output(31))) OR (fsm_output(2));
  VEC_LOOP_mux_3_nl <= MUX_v_11_2_2(STAGE_LOOP_lshift_psp_sva, ('1' & (NOT (STAGE_LOOP_lshift_psp_sva(10
      DOWNTO 1)))), fsm_output(2));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(VEC_LOOP_mux_2_nl & VEC_LOOP_or_1_nl)
      + UNSIGNED(VEC_LOOP_mux_3_nl & '1'), 12));
  z_out_1 <= acc_nl(11 DOWNTO 1);
  COMP_LOOP_mux_11_nl <= MUX_v_10_2_2(COMP_LOOP_k_10_0_sva_9_0, (STD_LOGIC_VECTOR'(
      "000001") & (NOT COMP_LOOP_twiddle_f_acc_3)), fsm_output(32));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(COMP_LOOP_mux_11_nl),
      11) + UNSIGNED'( "00000000001"), 11));
END v17;

-- ------------------------------------------------------------------
--  Design Unit:    inPlaceNTT_DIF
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_shift_comps_v5.ALL;


ENTITY inPlaceNTT_DIF IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    vec_rsc_wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_we : OUT STD_LOGIC;
    vec_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    vec_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    vec_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    r_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    r_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC
  );
END inPlaceNTT_DIF;

ARCHITECTURE v17 OF inPlaceNTT_DIF IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL vec_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL vec_rsci_we_d_iff : STD_LOGIC;

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
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
  SIGNAL vec_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_d_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL vec_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL vec_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
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

  COMPONENT inPlaceNTT_DIF_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      vec_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      r_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      vec_rsci_d_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      vec_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      vec_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      vec_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL inPlaceNTT_DIF_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_vec_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);
  SIGNAL inPlaceNTT_DIF_core_inst_twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);

BEGIN
  vec_rsci : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    PORT MAP(
      q => vec_rsci_q,
      radr => vec_rsci_radr,
      we => vec_rsc_we,
      d => vec_rsci_d,
      wadr => vec_rsci_wadr,
      d_d => vec_rsci_d_d_1,
      q_d => vec_rsci_q_d_1,
      radr_d => vec_rsci_radr_d_1,
      wadr_d => vec_rsci_wadr_d_1,
      we_d => vec_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => vec_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  vec_rsci_q <= vec_rsc_q;
  vec_rsc_radr <= vec_rsci_radr;
  vec_rsc_d <= vec_rsci_d;
  vec_rsc_wadr <= vec_rsci_wadr;
  vec_rsci_d_d_1 <= vec_rsci_d_d;
  vec_rsci_q_d <= vec_rsci_q_d_1;
  vec_rsci_radr_d_1 <= vec_rsci_radr_d;
  vec_rsci_wadr_d_1 <= vec_rsci_wadr_d;

  twiddle_rsci : inPlaceNTT_DIF_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
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

  inPlaceNTT_DIF_core_inst : inPlaceNTT_DIF_core
    PORT MAP(
      clk => clk,
      rst => rst,
      vec_rsc_triosy_lz => vec_rsc_triosy_lz,
      p_rsc_dat => inPlaceNTT_DIF_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      r_rsc_triosy_lz => r_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      vec_rsci_d_d => inPlaceNTT_DIF_core_inst_vec_rsci_d_d,
      vec_rsci_q_d => inPlaceNTT_DIF_core_inst_vec_rsci_q_d,
      vec_rsci_radr_d => inPlaceNTT_DIF_core_inst_vec_rsci_radr_d,
      vec_rsci_wadr_d => inPlaceNTT_DIF_core_inst_vec_rsci_wadr_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d => vec_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_q_d => inPlaceNTT_DIF_core_inst_twiddle_rsci_q_d,
      twiddle_rsci_radr_d => inPlaceNTT_DIF_core_inst_twiddle_rsci_radr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      vec_rsci_we_d_pff => vec_rsci_we_d_iff
    );
  inPlaceNTT_DIF_core_inst_p_rsc_dat <= p_rsc_dat;
  vec_rsci_d_d <= inPlaceNTT_DIF_core_inst_vec_rsci_d_d;
  inPlaceNTT_DIF_core_inst_vec_rsci_q_d <= vec_rsci_q_d;
  vec_rsci_radr_d <= inPlaceNTT_DIF_core_inst_vec_rsci_radr_d;
  vec_rsci_wadr_d <= inPlaceNTT_DIF_core_inst_vec_rsci_wadr_d;
  inPlaceNTT_DIF_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_radr_d <= inPlaceNTT_DIF_core_inst_twiddle_rsci_radr_d;

END v17;



