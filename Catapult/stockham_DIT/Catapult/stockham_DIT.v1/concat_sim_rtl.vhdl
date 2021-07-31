
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

--------> ../td_ccore_solutions/modulo_dev_ec8c24466b69562b778c7ad72f862955620d_0/rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.5c/896140 Production Release
--  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
-- 
--  Generated by:   yl7897@newnano.poly.edu
--  Generated date: Thu Jul 29 10:40:24 2021
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
  SIGNAL rem_13_cmp_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_z : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_1_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_2_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_3_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_4_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_5_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_6_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_7_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_8_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_9_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_10_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_11_b_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_1_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_2_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_3_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_4_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_5_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_6_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_7_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_8_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_9_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_10_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_13_cmp_11_a_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL acc_tmp : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL acc_1_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
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
  SIGNAL and_dcpl_23 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_31 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_35 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_38 : STD_LOGIC;
  SIGNAL and_dcpl_40 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_50 : STD_LOGIC;
  SIGNAL and_dcpl_55 : STD_LOGIC;
  SIGNAL and_dcpl_56 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL and_dcpl_58 : STD_LOGIC;
  SIGNAL and_dcpl_60 : STD_LOGIC;
  SIGNAL and_dcpl_62 : STD_LOGIC;
  SIGNAL and_dcpl_63 : STD_LOGIC;
  SIGNAL and_dcpl_65 : STD_LOGIC;
  SIGNAL and_dcpl_67 : STD_LOGIC;
  SIGNAL and_dcpl_72 : STD_LOGIC;
  SIGNAL and_dcpl_77 : STD_LOGIC;
  SIGNAL and_dcpl_82 : STD_LOGIC;
  SIGNAL and_dcpl_83 : STD_LOGIC;
  SIGNAL and_dcpl_84 : STD_LOGIC;
  SIGNAL and_dcpl_85 : STD_LOGIC;
  SIGNAL and_dcpl_87 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_90 : STD_LOGIC;
  SIGNAL and_dcpl_92 : STD_LOGIC;
  SIGNAL and_dcpl_94 : STD_LOGIC;
  SIGNAL and_dcpl_99 : STD_LOGIC;
  SIGNAL and_dcpl_104 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL and_dcpl_110 : STD_LOGIC;
  SIGNAL and_dcpl_111 : STD_LOGIC;
  SIGNAL and_dcpl_112 : STD_LOGIC;
  SIGNAL and_dcpl_114 : STD_LOGIC;
  SIGNAL and_dcpl_115 : STD_LOGIC;
  SIGNAL and_dcpl_117 : STD_LOGIC;
  SIGNAL and_dcpl_119 : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL and_dcpl_126 : STD_LOGIC;
  SIGNAL and_dcpl_129 : STD_LOGIC;
  SIGNAL and_dcpl_136 : STD_LOGIC;
  SIGNAL and_dcpl_137 : STD_LOGIC;
  SIGNAL and_dcpl_138 : STD_LOGIC;
  SIGNAL and_dcpl_139 : STD_LOGIC;
  SIGNAL and_dcpl_141 : STD_LOGIC;
  SIGNAL and_dcpl_143 : STD_LOGIC;
  SIGNAL and_dcpl_144 : STD_LOGIC;
  SIGNAL and_dcpl_146 : STD_LOGIC;
  SIGNAL and_dcpl_148 : STD_LOGIC;
  SIGNAL and_dcpl_153 : STD_LOGIC;
  SIGNAL and_dcpl_158 : STD_LOGIC;
  SIGNAL and_dcpl_163 : STD_LOGIC;
  SIGNAL and_dcpl_164 : STD_LOGIC;
  SIGNAL and_dcpl_165 : STD_LOGIC;
  SIGNAL and_dcpl_166 : STD_LOGIC;
  SIGNAL and_dcpl_168 : STD_LOGIC;
  SIGNAL and_dcpl_170 : STD_LOGIC;
  SIGNAL and_dcpl_171 : STD_LOGIC;
  SIGNAL and_dcpl_173 : STD_LOGIC;
  SIGNAL and_dcpl_175 : STD_LOGIC;
  SIGNAL and_dcpl_180 : STD_LOGIC;
  SIGNAL and_dcpl_185 : STD_LOGIC;
  SIGNAL and_dcpl_190 : STD_LOGIC;
  SIGNAL and_dcpl_191 : STD_LOGIC;
  SIGNAL and_dcpl_192 : STD_LOGIC;
  SIGNAL and_dcpl_193 : STD_LOGIC;
  SIGNAL and_dcpl_195 : STD_LOGIC;
  SIGNAL and_dcpl_197 : STD_LOGIC;
  SIGNAL and_dcpl_198 : STD_LOGIC;
  SIGNAL and_dcpl_200 : STD_LOGIC;
  SIGNAL and_dcpl_202 : STD_LOGIC;
  SIGNAL and_dcpl_207 : STD_LOGIC;
  SIGNAL and_dcpl_212 : STD_LOGIC;
  SIGNAL and_dcpl_217 : STD_LOGIC;
  SIGNAL and_dcpl_218 : STD_LOGIC;
  SIGNAL and_dcpl_219 : STD_LOGIC;
  SIGNAL and_dcpl_220 : STD_LOGIC;
  SIGNAL and_dcpl_222 : STD_LOGIC;
  SIGNAL and_dcpl_224 : STD_LOGIC;
  SIGNAL and_dcpl_225 : STD_LOGIC;
  SIGNAL and_dcpl_227 : STD_LOGIC;
  SIGNAL and_dcpl_229 : STD_LOGIC;
  SIGNAL and_dcpl_234 : STD_LOGIC;
  SIGNAL and_dcpl_239 : STD_LOGIC;
  SIGNAL and_dcpl_244 : STD_LOGIC;
  SIGNAL and_dcpl_245 : STD_LOGIC;
  SIGNAL and_dcpl_246 : STD_LOGIC;
  SIGNAL and_dcpl_247 : STD_LOGIC;
  SIGNAL and_dcpl_249 : STD_LOGIC;
  SIGNAL and_dcpl_251 : STD_LOGIC;
  SIGNAL and_dcpl_252 : STD_LOGIC;
  SIGNAL and_dcpl_254 : STD_LOGIC;
  SIGNAL and_dcpl_256 : STD_LOGIC;
  SIGNAL and_dcpl_261 : STD_LOGIC;
  SIGNAL and_dcpl_266 : STD_LOGIC;
  SIGNAL and_dcpl_271 : STD_LOGIC;
  SIGNAL and_dcpl_272 : STD_LOGIC;
  SIGNAL and_dcpl_274 : STD_LOGIC;
  SIGNAL and_dcpl_276 : STD_LOGIC;
  SIGNAL and_dcpl_278 : STD_LOGIC;
  SIGNAL and_dcpl_280 : STD_LOGIC;
  SIGNAL and_dcpl_285 : STD_LOGIC;
  SIGNAL and_dcpl_291 : STD_LOGIC;
  SIGNAL and_dcpl_292 : STD_LOGIC;
  SIGNAL and_dcpl_293 : STD_LOGIC;
  SIGNAL and_dcpl_294 : STD_LOGIC;
  SIGNAL and_dcpl_295 : STD_LOGIC;
  SIGNAL and_dcpl_296 : STD_LOGIC;
  SIGNAL and_dcpl_298 : STD_LOGIC;
  SIGNAL not_tmp_54 : STD_LOGIC;
  SIGNAL or_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_300 : STD_LOGIC;
  SIGNAL and_dcpl_301 : STD_LOGIC;
  SIGNAL and_dcpl_302 : STD_LOGIC;
  SIGNAL and_dcpl_304 : STD_LOGIC;
  SIGNAL and_tmp : STD_LOGIC;
  SIGNAL and_dcpl_306 : STD_LOGIC;
  SIGNAL and_dcpl_307 : STD_LOGIC;
  SIGNAL and_dcpl_308 : STD_LOGIC;
  SIGNAL and_dcpl_310 : STD_LOGIC;
  SIGNAL and_tmp_2 : STD_LOGIC;
  SIGNAL and_dcpl_312 : STD_LOGIC;
  SIGNAL and_dcpl_313 : STD_LOGIC;
  SIGNAL and_dcpl_314 : STD_LOGIC;
  SIGNAL and_dcpl_316 : STD_LOGIC;
  SIGNAL and_tmp_5 : STD_LOGIC;
  SIGNAL and_dcpl_318 : STD_LOGIC;
  SIGNAL and_tmp_9 : STD_LOGIC;
  SIGNAL and_dcpl_324 : STD_LOGIC;
  SIGNAL and_tmp_13 : STD_LOGIC;
  SIGNAL and_dcpl_330 : STD_LOGIC;
  SIGNAL mux_tmp_19 : STD_LOGIC;
  SIGNAL and_tmp_17 : STD_LOGIC;
  SIGNAL and_dcpl_336 : STD_LOGIC;
  SIGNAL mux_tmp_22 : STD_LOGIC;
  SIGNAL mux_tmp_23 : STD_LOGIC;
  SIGNAL and_tmp_21 : STD_LOGIC;
  SIGNAL and_dcpl_342 : STD_LOGIC;
  SIGNAL mux_tmp_26 : STD_LOGIC;
  SIGNAL mux_tmp_27 : STD_LOGIC;
  SIGNAL mux_tmp_28 : STD_LOGIC;
  SIGNAL and_tmp_25 : STD_LOGIC;
  SIGNAL and_dcpl_348 : STD_LOGIC;
  SIGNAL and_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_355 : STD_LOGIC;
  SIGNAL and_dcpl_356 : STD_LOGIC;
  SIGNAL and_dcpl_358 : STD_LOGIC;
  SIGNAL or_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_360 : STD_LOGIC;
  SIGNAL and_dcpl_362 : STD_LOGIC;
  SIGNAL mux_tmp_32 : STD_LOGIC;
  SIGNAL and_dcpl_364 : STD_LOGIC;
  SIGNAL and_dcpl_366 : STD_LOGIC;
  SIGNAL mux_tmp_34 : STD_LOGIC;
  SIGNAL mux_tmp_35 : STD_LOGIC;
  SIGNAL and_dcpl_368 : STD_LOGIC;
  SIGNAL and_dcpl_370 : STD_LOGIC;
  SIGNAL mux_tmp_37 : STD_LOGIC;
  SIGNAL mux_tmp_38 : STD_LOGIC;
  SIGNAL mux_tmp_39 : STD_LOGIC;
  SIGNAL and_dcpl_372 : STD_LOGIC;
  SIGNAL mux_tmp_41 : STD_LOGIC;
  SIGNAL mux_tmp_42 : STD_LOGIC;
  SIGNAL mux_tmp_43 : STD_LOGIC;
  SIGNAL mux_tmp_44 : STD_LOGIC;
  SIGNAL and_dcpl_376 : STD_LOGIC;
  SIGNAL mux_tmp_46 : STD_LOGIC;
  SIGNAL mux_tmp_47 : STD_LOGIC;
  SIGNAL mux_tmp_48 : STD_LOGIC;
  SIGNAL mux_tmp_49 : STD_LOGIC;
  SIGNAL mux_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_379 : STD_LOGIC;
  SIGNAL mux_tmp_52 : STD_LOGIC;
  SIGNAL mux_tmp_53 : STD_LOGIC;
  SIGNAL mux_tmp_54 : STD_LOGIC;
  SIGNAL mux_tmp_55 : STD_LOGIC;
  SIGNAL mux_tmp_56 : STD_LOGIC;
  SIGNAL mux_tmp_57 : STD_LOGIC;
  SIGNAL and_dcpl_382 : STD_LOGIC;
  SIGNAL mux_tmp_59 : STD_LOGIC;
  SIGNAL mux_tmp_60 : STD_LOGIC;
  SIGNAL mux_tmp_61 : STD_LOGIC;
  SIGNAL mux_tmp_62 : STD_LOGIC;
  SIGNAL mux_tmp_63 : STD_LOGIC;
  SIGNAL mux_tmp_64 : STD_LOGIC;
  SIGNAL mux_tmp_65 : STD_LOGIC;
  SIGNAL and_dcpl_385 : STD_LOGIC;
  SIGNAL mux_tmp_67 : STD_LOGIC;
  SIGNAL mux_tmp_68 : STD_LOGIC;
  SIGNAL mux_tmp_69 : STD_LOGIC;
  SIGNAL mux_tmp_70 : STD_LOGIC;
  SIGNAL mux_tmp_71 : STD_LOGIC;
  SIGNAL mux_tmp_72 : STD_LOGIC;
  SIGNAL mux_tmp_73 : STD_LOGIC;
  SIGNAL mux_tmp_74 : STD_LOGIC;
  SIGNAL and_dcpl_388 : STD_LOGIC;
  SIGNAL and_tmp_44 : STD_LOGIC;
  SIGNAL mux_tmp_76 : STD_LOGIC;
  SIGNAL and_dcpl_393 : STD_LOGIC;
  SIGNAL and_dcpl_394 : STD_LOGIC;
  SIGNAL and_dcpl_395 : STD_LOGIC;
  SIGNAL or_tmp_185 : STD_LOGIC;
  SIGNAL and_dcpl_397 : STD_LOGIC;
  SIGNAL and_dcpl_398 : STD_LOGIC;
  SIGNAL and_tmp_45 : STD_LOGIC;
  SIGNAL and_dcpl_400 : STD_LOGIC;
  SIGNAL and_dcpl_401 : STD_LOGIC;
  SIGNAL and_tmp_47 : STD_LOGIC;
  SIGNAL and_dcpl_403 : STD_LOGIC;
  SIGNAL and_dcpl_404 : STD_LOGIC;
  SIGNAL and_tmp_50 : STD_LOGIC;
  SIGNAL and_dcpl_406 : STD_LOGIC;
  SIGNAL and_tmp_54 : STD_LOGIC;
  SIGNAL and_dcpl_409 : STD_LOGIC;
  SIGNAL and_tmp_58 : STD_LOGIC;
  SIGNAL and_dcpl_413 : STD_LOGIC;
  SIGNAL mux_tmp_84 : STD_LOGIC;
  SIGNAL and_tmp_62 : STD_LOGIC;
  SIGNAL and_dcpl_417 : STD_LOGIC;
  SIGNAL mux_tmp_87 : STD_LOGIC;
  SIGNAL mux_tmp_88 : STD_LOGIC;
  SIGNAL and_tmp_66 : STD_LOGIC;
  SIGNAL and_dcpl_421 : STD_LOGIC;
  SIGNAL mux_tmp_91 : STD_LOGIC;
  SIGNAL mux_tmp_92 : STD_LOGIC;
  SIGNAL mux_tmp_93 : STD_LOGIC;
  SIGNAL and_tmp_70 : STD_LOGIC;
  SIGNAL and_dcpl_425 : STD_LOGIC;
  SIGNAL and_tmp_80 : STD_LOGIC;
  SIGNAL and_dcpl_430 : STD_LOGIC;
  SIGNAL and_dcpl_431 : STD_LOGIC;
  SIGNAL or_tmp_263 : STD_LOGIC;
  SIGNAL and_dcpl_433 : STD_LOGIC;
  SIGNAL mux_tmp_97 : STD_LOGIC;
  SIGNAL and_dcpl_435 : STD_LOGIC;
  SIGNAL mux_tmp_99 : STD_LOGIC;
  SIGNAL mux_tmp_100 : STD_LOGIC;
  SIGNAL and_dcpl_437 : STD_LOGIC;
  SIGNAL mux_tmp_102 : STD_LOGIC;
  SIGNAL mux_tmp_103 : STD_LOGIC;
  SIGNAL mux_tmp_104 : STD_LOGIC;
  SIGNAL and_dcpl_439 : STD_LOGIC;
  SIGNAL mux_tmp_106 : STD_LOGIC;
  SIGNAL mux_tmp_107 : STD_LOGIC;
  SIGNAL mux_tmp_108 : STD_LOGIC;
  SIGNAL mux_tmp_109 : STD_LOGIC;
  SIGNAL and_dcpl_442 : STD_LOGIC;
  SIGNAL mux_tmp_111 : STD_LOGIC;
  SIGNAL mux_tmp_112 : STD_LOGIC;
  SIGNAL mux_tmp_113 : STD_LOGIC;
  SIGNAL mux_tmp_114 : STD_LOGIC;
  SIGNAL mux_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_445 : STD_LOGIC;
  SIGNAL mux_tmp_117 : STD_LOGIC;
  SIGNAL mux_tmp_118 : STD_LOGIC;
  SIGNAL mux_tmp_119 : STD_LOGIC;
  SIGNAL mux_tmp_120 : STD_LOGIC;
  SIGNAL mux_tmp_121 : STD_LOGIC;
  SIGNAL mux_tmp_122 : STD_LOGIC;
  SIGNAL and_dcpl_448 : STD_LOGIC;
  SIGNAL mux_tmp_124 : STD_LOGIC;
  SIGNAL mux_tmp_125 : STD_LOGIC;
  SIGNAL mux_tmp_126 : STD_LOGIC;
  SIGNAL mux_tmp_127 : STD_LOGIC;
  SIGNAL mux_tmp_128 : STD_LOGIC;
  SIGNAL mux_tmp_129 : STD_LOGIC;
  SIGNAL mux_tmp_130 : STD_LOGIC;
  SIGNAL and_dcpl_451 : STD_LOGIC;
  SIGNAL mux_tmp_132 : STD_LOGIC;
  SIGNAL mux_tmp_133 : STD_LOGIC;
  SIGNAL mux_tmp_134 : STD_LOGIC;
  SIGNAL mux_tmp_135 : STD_LOGIC;
  SIGNAL mux_tmp_136 : STD_LOGIC;
  SIGNAL mux_tmp_137 : STD_LOGIC;
  SIGNAL mux_tmp_138 : STD_LOGIC;
  SIGNAL mux_tmp_139 : STD_LOGIC;
  SIGNAL and_dcpl_454 : STD_LOGIC;
  SIGNAL and_tmp_89 : STD_LOGIC;
  SIGNAL mux_tmp_141 : STD_LOGIC;
  SIGNAL and_dcpl_460 : STD_LOGIC;
  SIGNAL and_dcpl_461 : STD_LOGIC;
  SIGNAL and_dcpl_462 : STD_LOGIC;
  SIGNAL and_dcpl_463 : STD_LOGIC;
  SIGNAL not_tmp_332 : STD_LOGIC;
  SIGNAL or_tmp_368 : STD_LOGIC;
  SIGNAL and_dcpl_465 : STD_LOGIC;
  SIGNAL and_dcpl_466 : STD_LOGIC;
  SIGNAL and_dcpl_467 : STD_LOGIC;
  SIGNAL and_tmp_90 : STD_LOGIC;
  SIGNAL and_dcpl_469 : STD_LOGIC;
  SIGNAL and_dcpl_470 : STD_LOGIC;
  SIGNAL and_dcpl_471 : STD_LOGIC;
  SIGNAL and_tmp_92 : STD_LOGIC;
  SIGNAL and_dcpl_473 : STD_LOGIC;
  SIGNAL and_dcpl_474 : STD_LOGIC;
  SIGNAL and_dcpl_475 : STD_LOGIC;
  SIGNAL and_tmp_95 : STD_LOGIC;
  SIGNAL and_dcpl_477 : STD_LOGIC;
  SIGNAL and_tmp_99 : STD_LOGIC;
  SIGNAL and_dcpl_480 : STD_LOGIC;
  SIGNAL and_tmp_103 : STD_LOGIC;
  SIGNAL and_dcpl_483 : STD_LOGIC;
  SIGNAL mux_tmp_149 : STD_LOGIC;
  SIGNAL and_tmp_107 : STD_LOGIC;
  SIGNAL and_dcpl_486 : STD_LOGIC;
  SIGNAL mux_tmp_152 : STD_LOGIC;
  SIGNAL mux_tmp_153 : STD_LOGIC;
  SIGNAL and_tmp_111 : STD_LOGIC;
  SIGNAL and_dcpl_489 : STD_LOGIC;
  SIGNAL mux_tmp_156 : STD_LOGIC;
  SIGNAL mux_tmp_157 : STD_LOGIC;
  SIGNAL mux_tmp_158 : STD_LOGIC;
  SIGNAL and_tmp_115 : STD_LOGIC;
  SIGNAL and_dcpl_492 : STD_LOGIC;
  SIGNAL and_tmp_125 : STD_LOGIC;
  SIGNAL and_dcpl_498 : STD_LOGIC;
  SIGNAL or_tmp_446 : STD_LOGIC;
  SIGNAL and_dcpl_500 : STD_LOGIC;
  SIGNAL mux_tmp_162 : STD_LOGIC;
  SIGNAL and_dcpl_502 : STD_LOGIC;
  SIGNAL mux_tmp_164 : STD_LOGIC;
  SIGNAL mux_tmp_165 : STD_LOGIC;
  SIGNAL and_dcpl_504 : STD_LOGIC;
  SIGNAL mux_tmp_167 : STD_LOGIC;
  SIGNAL mux_tmp_168 : STD_LOGIC;
  SIGNAL mux_tmp_169 : STD_LOGIC;
  SIGNAL and_dcpl_506 : STD_LOGIC;
  SIGNAL mux_tmp_171 : STD_LOGIC;
  SIGNAL mux_tmp_172 : STD_LOGIC;
  SIGNAL mux_tmp_173 : STD_LOGIC;
  SIGNAL mux_tmp_174 : STD_LOGIC;
  SIGNAL and_dcpl_508 : STD_LOGIC;
  SIGNAL mux_tmp_176 : STD_LOGIC;
  SIGNAL mux_tmp_177 : STD_LOGIC;
  SIGNAL mux_tmp_178 : STD_LOGIC;
  SIGNAL mux_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_180 : STD_LOGIC;
  SIGNAL and_dcpl_510 : STD_LOGIC;
  SIGNAL mux_tmp_182 : STD_LOGIC;
  SIGNAL mux_tmp_183 : STD_LOGIC;
  SIGNAL mux_tmp_184 : STD_LOGIC;
  SIGNAL mux_tmp_185 : STD_LOGIC;
  SIGNAL mux_tmp_186 : STD_LOGIC;
  SIGNAL mux_tmp_187 : STD_LOGIC;
  SIGNAL and_dcpl_512 : STD_LOGIC;
  SIGNAL mux_tmp_189 : STD_LOGIC;
  SIGNAL mux_tmp_190 : STD_LOGIC;
  SIGNAL mux_tmp_191 : STD_LOGIC;
  SIGNAL mux_tmp_192 : STD_LOGIC;
  SIGNAL mux_tmp_193 : STD_LOGIC;
  SIGNAL mux_tmp_194 : STD_LOGIC;
  SIGNAL mux_tmp_195 : STD_LOGIC;
  SIGNAL and_dcpl_514 : STD_LOGIC;
  SIGNAL mux_tmp_197 : STD_LOGIC;
  SIGNAL mux_tmp_198 : STD_LOGIC;
  SIGNAL mux_tmp_199 : STD_LOGIC;
  SIGNAL mux_tmp_200 : STD_LOGIC;
  SIGNAL mux_tmp_201 : STD_LOGIC;
  SIGNAL mux_tmp_202 : STD_LOGIC;
  SIGNAL mux_tmp_203 : STD_LOGIC;
  SIGNAL mux_tmp_204 : STD_LOGIC;
  SIGNAL and_dcpl_516 : STD_LOGIC;
  SIGNAL and_tmp_134 : STD_LOGIC;
  SIGNAL mux_tmp_206 : STD_LOGIC;
  SIGNAL and_dcpl_520 : STD_LOGIC;
  SIGNAL and_dcpl_521 : STD_LOGIC;
  SIGNAL or_tmp_551 : STD_LOGIC;
  SIGNAL and_dcpl_523 : STD_LOGIC;
  SIGNAL and_dcpl_524 : STD_LOGIC;
  SIGNAL and_tmp_135 : STD_LOGIC;
  SIGNAL and_dcpl_526 : STD_LOGIC;
  SIGNAL and_dcpl_527 : STD_LOGIC;
  SIGNAL and_tmp_137 : STD_LOGIC;
  SIGNAL and_dcpl_529 : STD_LOGIC;
  SIGNAL and_dcpl_530 : STD_LOGIC;
  SIGNAL and_tmp_140 : STD_LOGIC;
  SIGNAL and_dcpl_532 : STD_LOGIC;
  SIGNAL and_tmp_144 : STD_LOGIC;
  SIGNAL and_dcpl_534 : STD_LOGIC;
  SIGNAL and_tmp_148 : STD_LOGIC;
  SIGNAL and_dcpl_536 : STD_LOGIC;
  SIGNAL mux_tmp_214 : STD_LOGIC;
  SIGNAL and_tmp_152 : STD_LOGIC;
  SIGNAL and_dcpl_538 : STD_LOGIC;
  SIGNAL mux_tmp_217 : STD_LOGIC;
  SIGNAL mux_tmp_218 : STD_LOGIC;
  SIGNAL and_tmp_156 : STD_LOGIC;
  SIGNAL and_dcpl_540 : STD_LOGIC;
  SIGNAL mux_tmp_221 : STD_LOGIC;
  SIGNAL mux_tmp_222 : STD_LOGIC;
  SIGNAL mux_tmp_223 : STD_LOGIC;
  SIGNAL and_tmp_160 : STD_LOGIC;
  SIGNAL and_dcpl_542 : STD_LOGIC;
  SIGNAL and_tmp_170 : STD_LOGIC;
  SIGNAL and_dcpl_546 : STD_LOGIC;
  SIGNAL or_tmp_629 : STD_LOGIC;
  SIGNAL and_dcpl_548 : STD_LOGIC;
  SIGNAL mux_tmp_227 : STD_LOGIC;
  SIGNAL and_dcpl_550 : STD_LOGIC;
  SIGNAL mux_tmp_229 : STD_LOGIC;
  SIGNAL mux_tmp_230 : STD_LOGIC;
  SIGNAL and_dcpl_552 : STD_LOGIC;
  SIGNAL mux_tmp_232 : STD_LOGIC;
  SIGNAL mux_tmp_233 : STD_LOGIC;
  SIGNAL mux_tmp_234 : STD_LOGIC;
  SIGNAL and_dcpl_554 : STD_LOGIC;
  SIGNAL mux_tmp_236 : STD_LOGIC;
  SIGNAL mux_tmp_237 : STD_LOGIC;
  SIGNAL mux_tmp_238 : STD_LOGIC;
  SIGNAL mux_tmp_239 : STD_LOGIC;
  SIGNAL and_dcpl_556 : STD_LOGIC;
  SIGNAL mux_tmp_241 : STD_LOGIC;
  SIGNAL mux_tmp_242 : STD_LOGIC;
  SIGNAL mux_tmp_243 : STD_LOGIC;
  SIGNAL mux_tmp_244 : STD_LOGIC;
  SIGNAL mux_tmp_245 : STD_LOGIC;
  SIGNAL and_dcpl_558 : STD_LOGIC;
  SIGNAL mux_tmp_247 : STD_LOGIC;
  SIGNAL mux_tmp_248 : STD_LOGIC;
  SIGNAL mux_tmp_249 : STD_LOGIC;
  SIGNAL mux_tmp_250 : STD_LOGIC;
  SIGNAL mux_tmp_251 : STD_LOGIC;
  SIGNAL mux_tmp_252 : STD_LOGIC;
  SIGNAL and_dcpl_560 : STD_LOGIC;
  SIGNAL mux_tmp_254 : STD_LOGIC;
  SIGNAL mux_tmp_255 : STD_LOGIC;
  SIGNAL mux_tmp_256 : STD_LOGIC;
  SIGNAL mux_tmp_257 : STD_LOGIC;
  SIGNAL mux_tmp_258 : STD_LOGIC;
  SIGNAL mux_tmp_259 : STD_LOGIC;
  SIGNAL mux_tmp_260 : STD_LOGIC;
  SIGNAL and_dcpl_562 : STD_LOGIC;
  SIGNAL mux_tmp_262 : STD_LOGIC;
  SIGNAL mux_tmp_263 : STD_LOGIC;
  SIGNAL mux_tmp_264 : STD_LOGIC;
  SIGNAL mux_tmp_265 : STD_LOGIC;
  SIGNAL mux_tmp_266 : STD_LOGIC;
  SIGNAL mux_tmp_267 : STD_LOGIC;
  SIGNAL mux_tmp_268 : STD_LOGIC;
  SIGNAL mux_tmp_269 : STD_LOGIC;
  SIGNAL and_dcpl_564 : STD_LOGIC;
  SIGNAL and_tmp_179 : STD_LOGIC;
  SIGNAL mux_tmp_271 : STD_LOGIC;
  SIGNAL and_dcpl_568 : STD_LOGIC;
  SIGNAL and_dcpl_569 : STD_LOGIC;
  SIGNAL and_dcpl_570 : STD_LOGIC;
  SIGNAL and_dcpl_571 : STD_LOGIC;
  SIGNAL or_tmp_733 : STD_LOGIC;
  SIGNAL and_dcpl_573 : STD_LOGIC;
  SIGNAL and_dcpl_574 : STD_LOGIC;
  SIGNAL and_dcpl_575 : STD_LOGIC;
  SIGNAL and_tmp_180 : STD_LOGIC;
  SIGNAL and_dcpl_577 : STD_LOGIC;
  SIGNAL and_dcpl_578 : STD_LOGIC;
  SIGNAL and_dcpl_579 : STD_LOGIC;
  SIGNAL and_tmp_182 : STD_LOGIC;
  SIGNAL and_dcpl_581 : STD_LOGIC;
  SIGNAL and_dcpl_582 : STD_LOGIC;
  SIGNAL and_dcpl_583 : STD_LOGIC;
  SIGNAL and_tmp_185 : STD_LOGIC;
  SIGNAL and_dcpl_585 : STD_LOGIC;
  SIGNAL and_tmp_189 : STD_LOGIC;
  SIGNAL and_dcpl_589 : STD_LOGIC;
  SIGNAL and_tmp_193 : STD_LOGIC;
  SIGNAL and_dcpl_593 : STD_LOGIC;
  SIGNAL mux_tmp_279 : STD_LOGIC;
  SIGNAL and_tmp_197 : STD_LOGIC;
  SIGNAL and_dcpl_597 : STD_LOGIC;
  SIGNAL mux_tmp_282 : STD_LOGIC;
  SIGNAL mux_tmp_283 : STD_LOGIC;
  SIGNAL and_tmp_201 : STD_LOGIC;
  SIGNAL and_dcpl_601 : STD_LOGIC;
  SIGNAL mux_tmp_286 : STD_LOGIC;
  SIGNAL mux_tmp_287 : STD_LOGIC;
  SIGNAL mux_tmp_288 : STD_LOGIC;
  SIGNAL and_tmp_205 : STD_LOGIC;
  SIGNAL and_dcpl_605 : STD_LOGIC;
  SIGNAL or_tmp_808 : STD_LOGIC;
  SIGNAL mux_tmp_291 : STD_LOGIC;
  SIGNAL mux_tmp_292 : STD_LOGIC;
  SIGNAL mux_tmp_293 : STD_LOGIC;
  SIGNAL mux_tmp_294 : STD_LOGIC;
  SIGNAL mux_tmp_295 : STD_LOGIC;
  SIGNAL mux_tmp_296 : STD_LOGIC;
  SIGNAL mux_tmp_297 : STD_LOGIC;
  SIGNAL mux_tmp_298 : STD_LOGIC;
  SIGNAL and_tmp_206 : STD_LOGIC;
  SIGNAL and_dcpl_610 : STD_LOGIC;
  SIGNAL or_tmp_820 : STD_LOGIC;
  SIGNAL and_dcpl_612 : STD_LOGIC;
  SIGNAL mux_tmp_301 : STD_LOGIC;
  SIGNAL and_dcpl_614 : STD_LOGIC;
  SIGNAL mux_tmp_303 : STD_LOGIC;
  SIGNAL mux_tmp_304 : STD_LOGIC;
  SIGNAL and_dcpl_616 : STD_LOGIC;
  SIGNAL mux_tmp_306 : STD_LOGIC;
  SIGNAL mux_tmp_307 : STD_LOGIC;
  SIGNAL mux_tmp_308 : STD_LOGIC;
  SIGNAL and_dcpl_618 : STD_LOGIC;
  SIGNAL mux_tmp_310 : STD_LOGIC;
  SIGNAL mux_tmp_311 : STD_LOGIC;
  SIGNAL mux_tmp_312 : STD_LOGIC;
  SIGNAL mux_tmp_313 : STD_LOGIC;
  SIGNAL and_dcpl_622 : STD_LOGIC;
  SIGNAL mux_tmp_315 : STD_LOGIC;
  SIGNAL mux_tmp_316 : STD_LOGIC;
  SIGNAL mux_tmp_317 : STD_LOGIC;
  SIGNAL mux_tmp_318 : STD_LOGIC;
  SIGNAL mux_tmp_319 : STD_LOGIC;
  SIGNAL and_dcpl_625 : STD_LOGIC;
  SIGNAL mux_tmp_321 : STD_LOGIC;
  SIGNAL mux_tmp_322 : STD_LOGIC;
  SIGNAL mux_tmp_323 : STD_LOGIC;
  SIGNAL mux_tmp_324 : STD_LOGIC;
  SIGNAL mux_tmp_325 : STD_LOGIC;
  SIGNAL mux_tmp_326 : STD_LOGIC;
  SIGNAL and_dcpl_628 : STD_LOGIC;
  SIGNAL mux_tmp_328 : STD_LOGIC;
  SIGNAL mux_tmp_329 : STD_LOGIC;
  SIGNAL mux_tmp_330 : STD_LOGIC;
  SIGNAL mux_tmp_331 : STD_LOGIC;
  SIGNAL mux_tmp_332 : STD_LOGIC;
  SIGNAL mux_tmp_333 : STD_LOGIC;
  SIGNAL mux_tmp_334 : STD_LOGIC;
  SIGNAL and_dcpl_631 : STD_LOGIC;
  SIGNAL mux_tmp_336 : STD_LOGIC;
  SIGNAL mux_tmp_337 : STD_LOGIC;
  SIGNAL mux_tmp_338 : STD_LOGIC;
  SIGNAL mux_tmp_339 : STD_LOGIC;
  SIGNAL mux_tmp_340 : STD_LOGIC;
  SIGNAL mux_tmp_341 : STD_LOGIC;
  SIGNAL mux_tmp_342 : STD_LOGIC;
  SIGNAL mux_tmp_343 : STD_LOGIC;
  SIGNAL and_dcpl_634 : STD_LOGIC;
  SIGNAL or_tmp_921 : STD_LOGIC;
  SIGNAL mux_tmp_345 : STD_LOGIC;
  SIGNAL mux_tmp_346 : STD_LOGIC;
  SIGNAL mux_tmp_347 : STD_LOGIC;
  SIGNAL mux_tmp_348 : STD_LOGIC;
  SIGNAL mux_tmp_349 : STD_LOGIC;
  SIGNAL mux_tmp_350 : STD_LOGIC;
  SIGNAL mux_tmp_351 : STD_LOGIC;
  SIGNAL mux_tmp_352 : STD_LOGIC;
  SIGNAL mux_tmp_353 : STD_LOGIC;
  SIGNAL mux_tmp_354 : STD_LOGIC;
  SIGNAL and_dcpl_638 : STD_LOGIC;
  SIGNAL and_dcpl_639 : STD_LOGIC;
  SIGNAL or_tmp_934 : STD_LOGIC;
  SIGNAL and_dcpl_641 : STD_LOGIC;
  SIGNAL and_dcpl_642 : STD_LOGIC;
  SIGNAL and_tmp_207 : STD_LOGIC;
  SIGNAL and_dcpl_644 : STD_LOGIC;
  SIGNAL and_dcpl_645 : STD_LOGIC;
  SIGNAL and_tmp_209 : STD_LOGIC;
  SIGNAL and_dcpl_647 : STD_LOGIC;
  SIGNAL and_dcpl_648 : STD_LOGIC;
  SIGNAL and_tmp_212 : STD_LOGIC;
  SIGNAL and_dcpl_650 : STD_LOGIC;
  SIGNAL and_tmp_216 : STD_LOGIC;
  SIGNAL and_dcpl_653 : STD_LOGIC;
  SIGNAL and_tmp_220 : STD_LOGIC;
  SIGNAL and_dcpl_657 : STD_LOGIC;
  SIGNAL mux_tmp_362 : STD_LOGIC;
  SIGNAL and_tmp_224 : STD_LOGIC;
  SIGNAL and_dcpl_661 : STD_LOGIC;
  SIGNAL mux_tmp_365 : STD_LOGIC;
  SIGNAL mux_tmp_366 : STD_LOGIC;
  SIGNAL and_tmp_228 : STD_LOGIC;
  SIGNAL and_dcpl_665 : STD_LOGIC;
  SIGNAL mux_tmp_369 : STD_LOGIC;
  SIGNAL mux_tmp_370 : STD_LOGIC;
  SIGNAL mux_tmp_371 : STD_LOGIC;
  SIGNAL and_tmp_232 : STD_LOGIC;
  SIGNAL and_dcpl_669 : STD_LOGIC;
  SIGNAL or_tmp_1009 : STD_LOGIC;
  SIGNAL mux_tmp_374 : STD_LOGIC;
  SIGNAL mux_tmp_375 : STD_LOGIC;
  SIGNAL mux_tmp_376 : STD_LOGIC;
  SIGNAL mux_tmp_377 : STD_LOGIC;
  SIGNAL mux_tmp_378 : STD_LOGIC;
  SIGNAL mux_tmp_379 : STD_LOGIC;
  SIGNAL mux_tmp_380 : STD_LOGIC;
  SIGNAL mux_tmp_381 : STD_LOGIC;
  SIGNAL and_tmp_233 : STD_LOGIC;
  SIGNAL and_dcpl_673 : STD_LOGIC;
  SIGNAL or_tmp_1021 : STD_LOGIC;
  SIGNAL and_dcpl_675 : STD_LOGIC;
  SIGNAL mux_tmp_384 : STD_LOGIC;
  SIGNAL and_dcpl_677 : STD_LOGIC;
  SIGNAL mux_tmp_386 : STD_LOGIC;
  SIGNAL mux_tmp_387 : STD_LOGIC;
  SIGNAL and_dcpl_679 : STD_LOGIC;
  SIGNAL mux_tmp_389 : STD_LOGIC;
  SIGNAL mux_tmp_390 : STD_LOGIC;
  SIGNAL mux_tmp_391 : STD_LOGIC;
  SIGNAL and_dcpl_681 : STD_LOGIC;
  SIGNAL mux_tmp_393 : STD_LOGIC;
  SIGNAL mux_tmp_394 : STD_LOGIC;
  SIGNAL mux_tmp_395 : STD_LOGIC;
  SIGNAL mux_tmp_396 : STD_LOGIC;
  SIGNAL and_dcpl_684 : STD_LOGIC;
  SIGNAL mux_tmp_398 : STD_LOGIC;
  SIGNAL mux_tmp_399 : STD_LOGIC;
  SIGNAL mux_tmp_400 : STD_LOGIC;
  SIGNAL mux_tmp_401 : STD_LOGIC;
  SIGNAL mux_tmp_402 : STD_LOGIC;
  SIGNAL and_dcpl_687 : STD_LOGIC;
  SIGNAL mux_tmp_404 : STD_LOGIC;
  SIGNAL mux_tmp_405 : STD_LOGIC;
  SIGNAL mux_tmp_406 : STD_LOGIC;
  SIGNAL mux_tmp_407 : STD_LOGIC;
  SIGNAL mux_tmp_408 : STD_LOGIC;
  SIGNAL mux_tmp_409 : STD_LOGIC;
  SIGNAL and_dcpl_690 : STD_LOGIC;
  SIGNAL mux_tmp_411 : STD_LOGIC;
  SIGNAL mux_tmp_412 : STD_LOGIC;
  SIGNAL mux_tmp_413 : STD_LOGIC;
  SIGNAL mux_tmp_414 : STD_LOGIC;
  SIGNAL mux_tmp_415 : STD_LOGIC;
  SIGNAL mux_tmp_416 : STD_LOGIC;
  SIGNAL mux_tmp_417 : STD_LOGIC;
  SIGNAL and_dcpl_693 : STD_LOGIC;
  SIGNAL mux_tmp_419 : STD_LOGIC;
  SIGNAL mux_tmp_420 : STD_LOGIC;
  SIGNAL mux_tmp_421 : STD_LOGIC;
  SIGNAL mux_tmp_422 : STD_LOGIC;
  SIGNAL mux_tmp_423 : STD_LOGIC;
  SIGNAL mux_tmp_424 : STD_LOGIC;
  SIGNAL mux_tmp_425 : STD_LOGIC;
  SIGNAL mux_tmp_426 : STD_LOGIC;
  SIGNAL and_dcpl_696 : STD_LOGIC;
  SIGNAL or_tmp_1122 : STD_LOGIC;
  SIGNAL mux_tmp_428 : STD_LOGIC;
  SIGNAL mux_tmp_429 : STD_LOGIC;
  SIGNAL mux_tmp_430 : STD_LOGIC;
  SIGNAL mux_tmp_431 : STD_LOGIC;
  SIGNAL mux_tmp_432 : STD_LOGIC;
  SIGNAL mux_tmp_433 : STD_LOGIC;
  SIGNAL mux_tmp_434 : STD_LOGIC;
  SIGNAL mux_tmp_435 : STD_LOGIC;
  SIGNAL mux_tmp_436 : STD_LOGIC;
  SIGNAL mux_tmp_437 : STD_LOGIC;
  SIGNAL rem_12cyc_st_10_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_10_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_9_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_9_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_8_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_8_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_7_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_7_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_6_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_6_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_5_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_5_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_4_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_4_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_3_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_3_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_2_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_2_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_12_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_sva_duc : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_12cyc_st_12_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL asn_itm_12 : STD_LOGIC;
  SIGNAL main_stage_0_13 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL asn_itm_2 : STD_LOGIC;
  SIGNAL main_stage_0_5 : STD_LOGIC;
  SIGNAL asn_itm_3 : STD_LOGIC;
  SIGNAL main_stage_0_6 : STD_LOGIC;
  SIGNAL asn_itm_4 : STD_LOGIC;
  SIGNAL asn_itm_5 : STD_LOGIC;
  SIGNAL main_stage_0_8 : STD_LOGIC;
  SIGNAL asn_itm_7 : STD_LOGIC;
  SIGNAL main_stage_0_9 : STD_LOGIC;
  SIGNAL asn_itm_8 : STD_LOGIC;
  SIGNAL main_stage_0_10 : STD_LOGIC;
  SIGNAL asn_itm_9 : STD_LOGIC;
  SIGNAL main_stage_0_7 : STD_LOGIC;
  SIGNAL asn_itm_6 : STD_LOGIC;
  SIGNAL main_stage_0_11 : STD_LOGIC;
  SIGNAL asn_itm_10 : STD_LOGIC;
  SIGNAL and_1173_cse : STD_LOGIC;
  SIGNAL and_1175_cse : STD_LOGIC;
  SIGNAL and_1177_cse : STD_LOGIC;
  SIGNAL and_1179_cse : STD_LOGIC;
  SIGNAL and_1181_cse : STD_LOGIC;
  SIGNAL and_1183_cse : STD_LOGIC;
  SIGNAL and_1185_cse : STD_LOGIC;
  SIGNAL and_1187_cse : STD_LOGIC;
  SIGNAL and_1189_cse : STD_LOGIC;
  SIGNAL and_1191_cse : STD_LOGIC;
  SIGNAL and_1193_cse : STD_LOGIC;
  SIGNAL and_1195_cse : STD_LOGIC;
  SIGNAL and_1197_cse : STD_LOGIC;
  SIGNAL or_1_cse : STD_LOGIC;
  SIGNAL or_6_cse : STD_LOGIC;
  SIGNAL or_10_cse : STD_LOGIC;
  SIGNAL or_15_cse : STD_LOGIC;
  SIGNAL or_21_cse : STD_LOGIC;
  SIGNAL or_28_cse : STD_LOGIC;
  SIGNAL or_37_cse : STD_LOGIC;
  SIGNAL or_48_cse : STD_LOGIC;
  SIGNAL or_83_cse : STD_LOGIC;
  SIGNAL nand_276_cse : STD_LOGIC;
  SIGNAL or_88_cse : STD_LOGIC;
  SIGNAL nand_274_cse : STD_LOGIC;
  SIGNAL or_93_cse : STD_LOGIC;
  SIGNAL nand_271_cse : STD_LOGIC;
  SIGNAL or_100_cse : STD_LOGIC;
  SIGNAL nand_267_cse : STD_LOGIC;
  SIGNAL or_109_cse : STD_LOGIC;
  SIGNAL or_120_cse : STD_LOGIC;
  SIGNAL or_133_cse : STD_LOGIC;
  SIGNAL or_148_cse : STD_LOGIC;
  SIGNAL or_190_cse : STD_LOGIC;
  SIGNAL or_195_cse : STD_LOGIC;
  SIGNAL or_199_cse : STD_LOGIC;
  SIGNAL or_204_cse : STD_LOGIC;
  SIGNAL or_210_cse : STD_LOGIC;
  SIGNAL or_217_cse : STD_LOGIC;
  SIGNAL or_226_cse : STD_LOGIC;
  SIGNAL or_237_cse : STD_LOGIC;
  SIGNAL or_270_cse : STD_LOGIC;
  SIGNAL or_275_cse : STD_LOGIC;
  SIGNAL or_280_cse : STD_LOGIC;
  SIGNAL or_287_cse : STD_LOGIC;
  SIGNAL or_296_cse : STD_LOGIC;
  SIGNAL or_307_cse : STD_LOGIC;
  SIGNAL or_320_cse : STD_LOGIC;
  SIGNAL or_335_cse : STD_LOGIC;
  SIGNAL nand_281_cse : STD_LOGIC;
  SIGNAL or_377_cse : STD_LOGIC;
  SIGNAL or_382_cse : STD_LOGIC;
  SIGNAL or_386_cse : STD_LOGIC;
  SIGNAL or_391_cse : STD_LOGIC;
  SIGNAL or_397_cse : STD_LOGIC;
  SIGNAL nand_215_cse : STD_LOGIC;
  SIGNAL or_404_cse : STD_LOGIC;
  SIGNAL nand_212_cse : STD_LOGIC;
  SIGNAL or_413_cse : STD_LOGIC;
  SIGNAL nand_208_cse : STD_LOGIC;
  SIGNAL or_424_cse : STD_LOGIC;
  SIGNAL or_458_cse : STD_LOGIC;
  SIGNAL or_463_cse : STD_LOGIC;
  SIGNAL nand_198_cse : STD_LOGIC;
  SIGNAL or_468_cse : STD_LOGIC;
  SIGNAL or_475_cse : STD_LOGIC;
  SIGNAL nand_189_cse : STD_LOGIC;
  SIGNAL or_484_cse : STD_LOGIC;
  SIGNAL or_495_cse : STD_LOGIC;
  SIGNAL or_508_cse : STD_LOGIC;
  SIGNAL nand_203_cse : STD_LOGIC;
  SIGNAL or_523_cse : STD_LOGIC;
  SIGNAL nand_250_cse : STD_LOGIC;
  SIGNAL or_564_cse : STD_LOGIC;
  SIGNAL or_569_cse : STD_LOGIC;
  SIGNAL or_573_cse : STD_LOGIC;
  SIGNAL or_578_cse : STD_LOGIC;
  SIGNAL or_584_cse : STD_LOGIC;
  SIGNAL or_591_cse : STD_LOGIC;
  SIGNAL or_600_cse : STD_LOGIC;
  SIGNAL or_611_cse : STD_LOGIC;
  SIGNAL or_643_cse : STD_LOGIC;
  SIGNAL or_648_cse : STD_LOGIC;
  SIGNAL or_653_cse : STD_LOGIC;
  SIGNAL or_660_cse : STD_LOGIC;
  SIGNAL or_669_cse : STD_LOGIC;
  SIGNAL or_680_cse : STD_LOGIC;
  SIGNAL or_693_cse : STD_LOGIC;
  SIGNAL or_708_cse : STD_LOGIC;
  SIGNAL or_748_cse : STD_LOGIC;
  SIGNAL or_753_cse : STD_LOGIC;
  SIGNAL or_757_cse : STD_LOGIC;
  SIGNAL or_762_cse : STD_LOGIC;
  SIGNAL or_768_cse : STD_LOGIC;
  SIGNAL or_775_cse : STD_LOGIC;
  SIGNAL or_784_cse : STD_LOGIC;
  SIGNAL or_795_cse : STD_LOGIC;
  SIGNAL or_837_cse : STD_LOGIC;
  SIGNAL nand_84_cse : STD_LOGIC;
  SIGNAL or_842_cse : STD_LOGIC;
  SIGNAL or_847_cse : STD_LOGIC;
  SIGNAL nand_79_cse : STD_LOGIC;
  SIGNAL or_854_cse : STD_LOGIC;
  SIGNAL or_863_cse : STD_LOGIC;
  SIGNAL or_874_cse : STD_LOGIC;
  SIGNAL or_887_cse : STD_LOGIC;
  SIGNAL or_902_cse : STD_LOGIC;
  SIGNAL or_952_cse : STD_LOGIC;
  SIGNAL or_957_cse : STD_LOGIC;
  SIGNAL or_961_cse : STD_LOGIC;
  SIGNAL or_966_cse : STD_LOGIC;
  SIGNAL or_972_cse : STD_LOGIC;
  SIGNAL or_979_cse : STD_LOGIC;
  SIGNAL or_988_cse : STD_LOGIC;
  SIGNAL or_999_cse : STD_LOGIC;
  SIGNAL nand_57_cse : STD_LOGIC;
  SIGNAL or_1045_cse : STD_LOGIC;
  SIGNAL or_1050_cse : STD_LOGIC;
  SIGNAL or_1057_cse : STD_LOGIC;
  SIGNAL or_1066_cse : STD_LOGIC;
  SIGNAL nand_36_cse : STD_LOGIC;
  SIGNAL nand_29_cse : STD_LOGIC;
  SIGNAL nand_21_cse : STD_LOGIC;
  SIGNAL nand_222_cse : STD_LOGIC;
  SIGNAL nand_223_cse : STD_LOGIC;
  SIGNAL main_stage_0_12 : STD_LOGIC;
  SIGNAL m_buf_sva_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_3 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_4 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_5 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_6 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_7 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_8 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_9 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_10 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_11 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_buf_sva_12 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL asn_itm_11 : STD_LOGIC;
  SIGNAL mut_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_1_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_2_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_3_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_4_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_5_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_6_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_7_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_8_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_9_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_10_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_11_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_12_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_13_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_14_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_15_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_16_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_17_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_18_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_19_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_20_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_21_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_22_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_2_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_3_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_4_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_5_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_6_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_7_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_8_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_9_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_10_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mut_23_11_63_0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL rem_12cyc_st_11_3_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL rem_12cyc_st_11_1_0 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL result_sva_duc_mx0 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL and_1203_cse : STD_LOGIC;
  SIGNAL and_1205_cse : STD_LOGIC;
  SIGNAL and_1207_cse : STD_LOGIC;
  SIGNAL and_1209_cse : STD_LOGIC;
  SIGNAL and_1211_cse : STD_LOGIC;
  SIGNAL and_1213_cse : STD_LOGIC;
  SIGNAL and_1215_cse : STD_LOGIC;
  SIGNAL and_1217_cse : STD_LOGIC;
  SIGNAL and_1219_cse : STD_LOGIC;
  SIGNAL and_1221_cse : STD_LOGIC;
  SIGNAL and_1223_cse : STD_LOGIC;
  SIGNAL and_1225_cse : STD_LOGIC;
  SIGNAL and_1227_cse : STD_LOGIC;
  SIGNAL and_1229_cse : STD_LOGIC;
  SIGNAL and_1231_cse : STD_LOGIC;
  SIGNAL and_1233_cse : STD_LOGIC;
  SIGNAL and_1235_cse : STD_LOGIC;
  SIGNAL and_1237_cse : STD_LOGIC;
  SIGNAL and_1239_cse : STD_LOGIC;
  SIGNAL and_1241_cse : STD_LOGIC;
  SIGNAL and_1243_cse : STD_LOGIC;
  SIGNAL and_1245_cse : STD_LOGIC;
  SIGNAL and_1247_cse : STD_LOGIC;
  SIGNAL and_1249_cse : STD_LOGIC;
  SIGNAL and_1251_cse : STD_LOGIC;
  SIGNAL and_1253_cse : STD_LOGIC;
  SIGNAL and_1255_cse : STD_LOGIC;
  SIGNAL and_1257_cse : STD_LOGIC;
  SIGNAL and_1259_cse : STD_LOGIC;
  SIGNAL and_1261_cse : STD_LOGIC;
  SIGNAL and_1263_cse : STD_LOGIC;
  SIGNAL and_1265_cse : STD_LOGIC;
  SIGNAL and_1267_cse : STD_LOGIC;
  SIGNAL and_1269_cse : STD_LOGIC;
  SIGNAL and_1271_cse : STD_LOGIC;
  SIGNAL and_1273_cse : STD_LOGIC;
  SIGNAL and_1275_cse : STD_LOGIC;
  SIGNAL and_1277_cse : STD_LOGIC;
  SIGNAL and_1279_cse : STD_LOGIC;
  SIGNAL and_1281_cse : STD_LOGIC;
  SIGNAL and_1283_cse : STD_LOGIC;
  SIGNAL and_1285_cse : STD_LOGIC;
  SIGNAL and_1287_cse : STD_LOGIC;
  SIGNAL and_1289_cse : STD_LOGIC;
  SIGNAL and_1291_cse : STD_LOGIC;
  SIGNAL and_1293_cse : STD_LOGIC;
  SIGNAL and_1295_cse : STD_LOGIC;
  SIGNAL and_1297_cse : STD_LOGIC;
  SIGNAL and_1299_cse : STD_LOGIC;
  SIGNAL and_1301_cse : STD_LOGIC;
  SIGNAL and_1303_cse : STD_LOGIC;
  SIGNAL and_1305_cse : STD_LOGIC;
  SIGNAL and_1307_cse : STD_LOGIC;
  SIGNAL and_1309_cse : STD_LOGIC;
  SIGNAL and_1311_cse : STD_LOGIC;
  SIGNAL and_1313_cse : STD_LOGIC;
  SIGNAL and_1315_cse : STD_LOGIC;
  SIGNAL and_1317_cse : STD_LOGIC;
  SIGNAL and_1319_cse : STD_LOGIC;
  SIGNAL and_1321_cse : STD_LOGIC;
  SIGNAL and_1323_cse : STD_LOGIC;
  SIGNAL and_1325_cse : STD_LOGIC;
  SIGNAL and_1327_cse : STD_LOGIC;
  SIGNAL and_1329_cse : STD_LOGIC;
  SIGNAL and_1331_cse : STD_LOGIC;
  SIGNAL and_1333_cse : STD_LOGIC;
  SIGNAL and_1335_cse : STD_LOGIC;
  SIGNAL and_1337_cse : STD_LOGIC;
  SIGNAL and_1339_cse : STD_LOGIC;
  SIGNAL and_1341_cse : STD_LOGIC;
  SIGNAL and_1343_cse : STD_LOGIC;
  SIGNAL and_1345_cse : STD_LOGIC;
  SIGNAL and_1347_cse : STD_LOGIC;
  SIGNAL and_1349_cse : STD_LOGIC;
  SIGNAL and_1351_cse : STD_LOGIC;
  SIGNAL and_1353_cse : STD_LOGIC;
  SIGNAL and_1355_cse : STD_LOGIC;
  SIGNAL and_1357_cse : STD_LOGIC;
  SIGNAL and_1359_cse : STD_LOGIC;
  SIGNAL and_1361_cse : STD_LOGIC;
  SIGNAL and_1363_cse : STD_LOGIC;
  SIGNAL and_1365_cse : STD_LOGIC;
  SIGNAL and_1367_cse : STD_LOGIC;
  SIGNAL and_1369_cse : STD_LOGIC;
  SIGNAL and_1371_cse : STD_LOGIC;
  SIGNAL and_1373_cse : STD_LOGIC;
  SIGNAL and_1375_cse : STD_LOGIC;
  SIGNAL and_1377_cse : STD_LOGIC;
  SIGNAL and_1379_cse : STD_LOGIC;
  SIGNAL and_1381_cse : STD_LOGIC;
  SIGNAL and_1383_cse : STD_LOGIC;
  SIGNAL and_1385_cse : STD_LOGIC;
  SIGNAL and_1387_cse : STD_LOGIC;
  SIGNAL and_1389_cse : STD_LOGIC;
  SIGNAL and_1391_cse : STD_LOGIC;
  SIGNAL and_1393_cse : STD_LOGIC;
  SIGNAL and_1395_cse : STD_LOGIC;
  SIGNAL and_1397_cse : STD_LOGIC;
  SIGNAL and_1399_cse : STD_LOGIC;
  SIGNAL and_1401_cse : STD_LOGIC;
  SIGNAL and_1403_cse : STD_LOGIC;
  SIGNAL and_1405_cse : STD_LOGIC;
  SIGNAL and_1407_cse : STD_LOGIC;
  SIGNAL and_1409_cse : STD_LOGIC;
  SIGNAL and_1411_cse : STD_LOGIC;
  SIGNAL and_1413_cse : STD_LOGIC;
  SIGNAL and_1415_cse : STD_LOGIC;
  SIGNAL and_1417_cse : STD_LOGIC;
  SIGNAL and_1419_cse : STD_LOGIC;
  SIGNAL and_1421_cse : STD_LOGIC;
  SIGNAL and_1423_cse : STD_LOGIC;
  SIGNAL and_1425_cse : STD_LOGIC;
  SIGNAL and_1427_cse : STD_LOGIC;
  SIGNAL and_1429_cse : STD_LOGIC;
  SIGNAL and_1431_cse : STD_LOGIC;
  SIGNAL and_1433_cse : STD_LOGIC;
  SIGNAL and_1435_cse : STD_LOGIC;
  SIGNAL and_1437_cse : STD_LOGIC;
  SIGNAL and_1439_cse : STD_LOGIC;
  SIGNAL and_1441_cse : STD_LOGIC;
  SIGNAL and_1443_cse : STD_LOGIC;
  SIGNAL and_1445_cse : STD_LOGIC;
  SIGNAL and_1447_cse : STD_LOGIC;
  SIGNAL and_1449_cse : STD_LOGIC;
  SIGNAL and_1451_cse : STD_LOGIC;
  SIGNAL and_1453_cse : STD_LOGIC;
  SIGNAL and_1455_cse : STD_LOGIC;
  SIGNAL and_1457_cse : STD_LOGIC;
  SIGNAL and_1459_cse : STD_LOGIC;
  SIGNAL and_1461_cse : STD_LOGIC;
  SIGNAL and_1463_cse : STD_LOGIC;

  SIGNAL qelse_acc_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL mux_6_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL mux_4_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL and_273_nl : STD_LOGIC;
  SIGNAL and_275_nl : STD_LOGIC;
  SIGNAL and_277_nl : STD_LOGIC;
  SIGNAL and_279_nl : STD_LOGIC;
  SIGNAL and_281_nl : STD_LOGIC;
  SIGNAL and_282_nl : STD_LOGIC;
  SIGNAL and_283_nl : STD_LOGIC;
  SIGNAL and_284_nl : STD_LOGIC;
  SIGNAL and_286_nl : STD_LOGIC;
  SIGNAL and_287_nl : STD_LOGIC;
  SIGNAL and_288_nl : STD_LOGIC;
  SIGNAL and_289_nl : STD_LOGIC;
  SIGNAL and_290_nl : STD_LOGIC;
  SIGNAL xor_nl : STD_LOGIC;
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL nor_518_nl : STD_LOGIC;
  SIGNAL mux_15_nl : STD_LOGIC;
  SIGNAL nor_517_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL nor_516_nl : STD_LOGIC;
  SIGNAL mux_17_nl : STD_LOGIC;
  SIGNAL nor_515_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL nor_514_nl : STD_LOGIC;
  SIGNAL mux_19_nl : STD_LOGIC;
  SIGNAL nor_512_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL nor_513_nl : STD_LOGIC;
  SIGNAL nor_509_nl : STD_LOGIC;
  SIGNAL mux_22_nl : STD_LOGIC;
  SIGNAL nor_510_nl : STD_LOGIC;
  SIGNAL mux_23_nl : STD_LOGIC;
  SIGNAL nor_511_nl : STD_LOGIC;
  SIGNAL nor_505_nl : STD_LOGIC;
  SIGNAL nor_506_nl : STD_LOGIC;
  SIGNAL mux_26_nl : STD_LOGIC;
  SIGNAL nor_507_nl : STD_LOGIC;
  SIGNAL mux_27_nl : STD_LOGIC;
  SIGNAL nor_508_nl : STD_LOGIC;
  SIGNAL nor_500_nl : STD_LOGIC;
  SIGNAL or_61_nl : STD_LOGIC;
  SIGNAL nor_501_nl : STD_LOGIC;
  SIGNAL nor_502_nl : STD_LOGIC;
  SIGNAL mux_31_nl : STD_LOGIC;
  SIGNAL nor_503_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL nor_504_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL nor_499_nl : STD_LOGIC;
  SIGNAL and_1168_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL nor_498_nl : STD_LOGIC;
  SIGNAL and_1166_nl : STD_LOGIC;
  SIGNAL and_1167_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL nor_497_nl : STD_LOGIC;
  SIGNAL and_1163_nl : STD_LOGIC;
  SIGNAL and_1164_nl : STD_LOGIC;
  SIGNAL and_1165_nl : STD_LOGIC;
  SIGNAL mux_42_nl : STD_LOGIC;
  SIGNAL nor_496_nl : STD_LOGIC;
  SIGNAL and_1159_nl : STD_LOGIC;
  SIGNAL and_1160_nl : STD_LOGIC;
  SIGNAL and_1161_nl : STD_LOGIC;
  SIGNAL and_1162_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL nor_495_nl : STD_LOGIC;
  SIGNAL nor_493_nl : STD_LOGIC;
  SIGNAL and_1155_nl : STD_LOGIC;
  SIGNAL and_1156_nl : STD_LOGIC;
  SIGNAL and_1157_nl : STD_LOGIC;
  SIGNAL and_1158_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL nor_494_nl : STD_LOGIC;
  SIGNAL nor_490_nl : STD_LOGIC;
  SIGNAL nor_491_nl : STD_LOGIC;
  SIGNAL and_1151_nl : STD_LOGIC;
  SIGNAL and_1152_nl : STD_LOGIC;
  SIGNAL and_1153_nl : STD_LOGIC;
  SIGNAL and_1154_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL nor_492_nl : STD_LOGIC;
  SIGNAL nor_486_nl : STD_LOGIC;
  SIGNAL nor_487_nl : STD_LOGIC;
  SIGNAL nor_488_nl : STD_LOGIC;
  SIGNAL and_1147_nl : STD_LOGIC;
  SIGNAL and_1148_nl : STD_LOGIC;
  SIGNAL and_1149_nl : STD_LOGIC;
  SIGNAL and_1150_nl : STD_LOGIC;
  SIGNAL mux_68_nl : STD_LOGIC;
  SIGNAL nor_489_nl : STD_LOGIC;
  SIGNAL nor_481_nl : STD_LOGIC;
  SIGNAL or_165_nl : STD_LOGIC;
  SIGNAL nor_482_nl : STD_LOGIC;
  SIGNAL nor_483_nl : STD_LOGIC;
  SIGNAL nor_484_nl : STD_LOGIC;
  SIGNAL and_1143_nl : STD_LOGIC;
  SIGNAL and_1144_nl : STD_LOGIC;
  SIGNAL and_1145_nl : STD_LOGIC;
  SIGNAL and_1146_nl : STD_LOGIC;
  SIGNAL mux_77_nl : STD_LOGIC;
  SIGNAL nor_485_nl : STD_LOGIC;
  SIGNAL nor_480_nl : STD_LOGIC;
  SIGNAL or_175_nl : STD_LOGIC;
  SIGNAL mux_79_nl : STD_LOGIC;
  SIGNAL nor_479_nl : STD_LOGIC;
  SIGNAL mux_80_nl : STD_LOGIC;
  SIGNAL nor_478_nl : STD_LOGIC;
  SIGNAL mux_81_nl : STD_LOGIC;
  SIGNAL nor_477_nl : STD_LOGIC;
  SIGNAL mux_82_nl : STD_LOGIC;
  SIGNAL nor_476_nl : STD_LOGIC;
  SIGNAL mux_83_nl : STD_LOGIC;
  SIGNAL nor_475_nl : STD_LOGIC;
  SIGNAL mux_84_nl : STD_LOGIC;
  SIGNAL nor_473_nl : STD_LOGIC;
  SIGNAL mux_85_nl : STD_LOGIC;
  SIGNAL nor_474_nl : STD_LOGIC;
  SIGNAL nor_470_nl : STD_LOGIC;
  SIGNAL mux_87_nl : STD_LOGIC;
  SIGNAL nor_471_nl : STD_LOGIC;
  SIGNAL mux_88_nl : STD_LOGIC;
  SIGNAL nor_472_nl : STD_LOGIC;
  SIGNAL nor_466_nl : STD_LOGIC;
  SIGNAL nor_467_nl : STD_LOGIC;
  SIGNAL mux_91_nl : STD_LOGIC;
  SIGNAL nor_468_nl : STD_LOGIC;
  SIGNAL mux_92_nl : STD_LOGIC;
  SIGNAL nor_469_nl : STD_LOGIC;
  SIGNAL nor_461_nl : STD_LOGIC;
  SIGNAL or_250_nl : STD_LOGIC;
  SIGNAL nor_462_nl : STD_LOGIC;
  SIGNAL nor_463_nl : STD_LOGIC;
  SIGNAL mux_96_nl : STD_LOGIC;
  SIGNAL nor_464_nl : STD_LOGIC;
  SIGNAL mux_97_nl : STD_LOGIC;
  SIGNAL nor_465_nl : STD_LOGIC;
  SIGNAL mux_98_nl : STD_LOGIC;
  SIGNAL nor_460_nl : STD_LOGIC;
  SIGNAL and_1142_nl : STD_LOGIC;
  SIGNAL mux_100_nl : STD_LOGIC;
  SIGNAL nor_459_nl : STD_LOGIC;
  SIGNAL and_1140_nl : STD_LOGIC;
  SIGNAL and_1141_nl : STD_LOGIC;
  SIGNAL mux_103_nl : STD_LOGIC;
  SIGNAL nor_458_nl : STD_LOGIC;
  SIGNAL and_1137_nl : STD_LOGIC;
  SIGNAL and_1138_nl : STD_LOGIC;
  SIGNAL and_1139_nl : STD_LOGIC;
  SIGNAL mux_107_nl : STD_LOGIC;
  SIGNAL nor_457_nl : STD_LOGIC;
  SIGNAL and_1133_nl : STD_LOGIC;
  SIGNAL and_1134_nl : STD_LOGIC;
  SIGNAL and_1135_nl : STD_LOGIC;
  SIGNAL and_1136_nl : STD_LOGIC;
  SIGNAL mux_112_nl : STD_LOGIC;
  SIGNAL nor_456_nl : STD_LOGIC;
  SIGNAL nor_454_nl : STD_LOGIC;
  SIGNAL and_1129_nl : STD_LOGIC;
  SIGNAL and_1130_nl : STD_LOGIC;
  SIGNAL and_1131_nl : STD_LOGIC;
  SIGNAL and_1132_nl : STD_LOGIC;
  SIGNAL mux_118_nl : STD_LOGIC;
  SIGNAL nor_455_nl : STD_LOGIC;
  SIGNAL nor_451_nl : STD_LOGIC;
  SIGNAL nor_452_nl : STD_LOGIC;
  SIGNAL and_1125_nl : STD_LOGIC;
  SIGNAL and_1126_nl : STD_LOGIC;
  SIGNAL and_1127_nl : STD_LOGIC;
  SIGNAL and_1128_nl : STD_LOGIC;
  SIGNAL mux_125_nl : STD_LOGIC;
  SIGNAL nor_453_nl : STD_LOGIC;
  SIGNAL nor_447_nl : STD_LOGIC;
  SIGNAL nor_448_nl : STD_LOGIC;
  SIGNAL nor_449_nl : STD_LOGIC;
  SIGNAL and_1121_nl : STD_LOGIC;
  SIGNAL and_1122_nl : STD_LOGIC;
  SIGNAL and_1123_nl : STD_LOGIC;
  SIGNAL and_1124_nl : STD_LOGIC;
  SIGNAL mux_133_nl : STD_LOGIC;
  SIGNAL nor_450_nl : STD_LOGIC;
  SIGNAL nor_442_nl : STD_LOGIC;
  SIGNAL or_352_nl : STD_LOGIC;
  SIGNAL nor_443_nl : STD_LOGIC;
  SIGNAL nor_444_nl : STD_LOGIC;
  SIGNAL nor_445_nl : STD_LOGIC;
  SIGNAL and_1117_nl : STD_LOGIC;
  SIGNAL and_1118_nl : STD_LOGIC;
  SIGNAL and_1119_nl : STD_LOGIC;
  SIGNAL and_1120_nl : STD_LOGIC;
  SIGNAL mux_142_nl : STD_LOGIC;
  SIGNAL nor_446_nl : STD_LOGIC;
  SIGNAL and_1116_nl : STD_LOGIC;
  SIGNAL or_362_nl : STD_LOGIC;
  SIGNAL mux_144_nl : STD_LOGIC;
  SIGNAL and_1172_nl : STD_LOGIC;
  SIGNAL mux_145_nl : STD_LOGIC;
  SIGNAL and_1114_nl : STD_LOGIC;
  SIGNAL mux_146_nl : STD_LOGIC;
  SIGNAL and_1113_nl : STD_LOGIC;
  SIGNAL mux_147_nl : STD_LOGIC;
  SIGNAL and_1112_nl : STD_LOGIC;
  SIGNAL mux_148_nl : STD_LOGIC;
  SIGNAL and_1111_nl : STD_LOGIC;
  SIGNAL mux_149_nl : STD_LOGIC;
  SIGNAL and_1109_nl : STD_LOGIC;
  SIGNAL mux_150_nl : STD_LOGIC;
  SIGNAL and_1110_nl : STD_LOGIC;
  SIGNAL and_1106_nl : STD_LOGIC;
  SIGNAL mux_152_nl : STD_LOGIC;
  SIGNAL and_1107_nl : STD_LOGIC;
  SIGNAL mux_153_nl : STD_LOGIC;
  SIGNAL and_1108_nl : STD_LOGIC;
  SIGNAL and_1102_nl : STD_LOGIC;
  SIGNAL and_1103_nl : STD_LOGIC;
  SIGNAL mux_156_nl : STD_LOGIC;
  SIGNAL and_1104_nl : STD_LOGIC;
  SIGNAL mux_157_nl : STD_LOGIC;
  SIGNAL and_1105_nl : STD_LOGIC;
  SIGNAL and_1097_nl : STD_LOGIC;
  SIGNAL or_437_nl : STD_LOGIC;
  SIGNAL and_1098_nl : STD_LOGIC;
  SIGNAL and_1099_nl : STD_LOGIC;
  SIGNAL mux_161_nl : STD_LOGIC;
  SIGNAL and_1100_nl : STD_LOGIC;
  SIGNAL mux_162_nl : STD_LOGIC;
  SIGNAL and_1101_nl : STD_LOGIC;
  SIGNAL mux_163_nl : STD_LOGIC;
  SIGNAL and_1171_nl : STD_LOGIC;
  SIGNAL and_1094_nl : STD_LOGIC;
  SIGNAL mux_165_nl : STD_LOGIC;
  SIGNAL and_1095_nl : STD_LOGIC;
  SIGNAL and_1091_nl : STD_LOGIC;
  SIGNAL and_1092_nl : STD_LOGIC;
  SIGNAL mux_168_nl : STD_LOGIC;
  SIGNAL and_1093_nl : STD_LOGIC;
  SIGNAL and_1087_nl : STD_LOGIC;
  SIGNAL and_1088_nl : STD_LOGIC;
  SIGNAL and_1089_nl : STD_LOGIC;
  SIGNAL mux_172_nl : STD_LOGIC;
  SIGNAL and_1090_nl : STD_LOGIC;
  SIGNAL and_1082_nl : STD_LOGIC;
  SIGNAL and_1083_nl : STD_LOGIC;
  SIGNAL and_1084_nl : STD_LOGIC;
  SIGNAL and_1085_nl : STD_LOGIC;
  SIGNAL mux_177_nl : STD_LOGIC;
  SIGNAL and_1086_nl : STD_LOGIC;
  SIGNAL and_1076_nl : STD_LOGIC;
  SIGNAL and_1077_nl : STD_LOGIC;
  SIGNAL and_1078_nl : STD_LOGIC;
  SIGNAL and_1079_nl : STD_LOGIC;
  SIGNAL and_1080_nl : STD_LOGIC;
  SIGNAL mux_183_nl : STD_LOGIC;
  SIGNAL and_1081_nl : STD_LOGIC;
  SIGNAL and_1069_nl : STD_LOGIC;
  SIGNAL and_1070_nl : STD_LOGIC;
  SIGNAL and_1071_nl : STD_LOGIC;
  SIGNAL and_1072_nl : STD_LOGIC;
  SIGNAL and_1073_nl : STD_LOGIC;
  SIGNAL and_1074_nl : STD_LOGIC;
  SIGNAL mux_190_nl : STD_LOGIC;
  SIGNAL and_1075_nl : STD_LOGIC;
  SIGNAL and_1061_nl : STD_LOGIC;
  SIGNAL and_1062_nl : STD_LOGIC;
  SIGNAL and_1063_nl : STD_LOGIC;
  SIGNAL and_1064_nl : STD_LOGIC;
  SIGNAL and_1065_nl : STD_LOGIC;
  SIGNAL and_1066_nl : STD_LOGIC;
  SIGNAL and_1067_nl : STD_LOGIC;
  SIGNAL mux_198_nl : STD_LOGIC;
  SIGNAL and_1068_nl : STD_LOGIC;
  SIGNAL and_1052_nl : STD_LOGIC;
  SIGNAL or_540_nl : STD_LOGIC;
  SIGNAL and_1053_nl : STD_LOGIC;
  SIGNAL and_1054_nl : STD_LOGIC;
  SIGNAL and_1055_nl : STD_LOGIC;
  SIGNAL and_1056_nl : STD_LOGIC;
  SIGNAL and_1057_nl : STD_LOGIC;
  SIGNAL and_1058_nl : STD_LOGIC;
  SIGNAL and_1059_nl : STD_LOGIC;
  SIGNAL mux_207_nl : STD_LOGIC;
  SIGNAL and_1060_nl : STD_LOGIC;
  SIGNAL nor_439_nl : STD_LOGIC;
  SIGNAL or_550_nl : STD_LOGIC;
  SIGNAL mux_209_nl : STD_LOGIC;
  SIGNAL and_1170_nl : STD_LOGIC;
  SIGNAL mux_210_nl : STD_LOGIC;
  SIGNAL and_1050_nl : STD_LOGIC;
  SIGNAL mux_211_nl : STD_LOGIC;
  SIGNAL and_1049_nl : STD_LOGIC;
  SIGNAL mux_212_nl : STD_LOGIC;
  SIGNAL and_1048_nl : STD_LOGIC;
  SIGNAL mux_213_nl : STD_LOGIC;
  SIGNAL and_1047_nl : STD_LOGIC;
  SIGNAL mux_214_nl : STD_LOGIC;
  SIGNAL and_1045_nl : STD_LOGIC;
  SIGNAL mux_215_nl : STD_LOGIC;
  SIGNAL and_1046_nl : STD_LOGIC;
  SIGNAL and_1042_nl : STD_LOGIC;
  SIGNAL mux_217_nl : STD_LOGIC;
  SIGNAL and_1043_nl : STD_LOGIC;
  SIGNAL mux_218_nl : STD_LOGIC;
  SIGNAL and_1044_nl : STD_LOGIC;
  SIGNAL and_1038_nl : STD_LOGIC;
  SIGNAL and_1039_nl : STD_LOGIC;
  SIGNAL mux_221_nl : STD_LOGIC;
  SIGNAL and_1040_nl : STD_LOGIC;
  SIGNAL mux_222_nl : STD_LOGIC;
  SIGNAL and_1041_nl : STD_LOGIC;
  SIGNAL and_1033_nl : STD_LOGIC;
  SIGNAL or_624_nl : STD_LOGIC;
  SIGNAL and_1034_nl : STD_LOGIC;
  SIGNAL and_1035_nl : STD_LOGIC;
  SIGNAL mux_226_nl : STD_LOGIC;
  SIGNAL and_1036_nl : STD_LOGIC;
  SIGNAL mux_227_nl : STD_LOGIC;
  SIGNAL and_1037_nl : STD_LOGIC;
  SIGNAL mux_228_nl : STD_LOGIC;
  SIGNAL and_1169_nl : STD_LOGIC;
  SIGNAL and_1030_nl : STD_LOGIC;
  SIGNAL mux_230_nl : STD_LOGIC;
  SIGNAL and_1031_nl : STD_LOGIC;
  SIGNAL and_1027_nl : STD_LOGIC;
  SIGNAL and_1028_nl : STD_LOGIC;
  SIGNAL mux_233_nl : STD_LOGIC;
  SIGNAL and_1029_nl : STD_LOGIC;
  SIGNAL and_1023_nl : STD_LOGIC;
  SIGNAL and_1024_nl : STD_LOGIC;
  SIGNAL and_1025_nl : STD_LOGIC;
  SIGNAL mux_237_nl : STD_LOGIC;
  SIGNAL and_1026_nl : STD_LOGIC;
  SIGNAL and_1018_nl : STD_LOGIC;
  SIGNAL and_1019_nl : STD_LOGIC;
  SIGNAL and_1020_nl : STD_LOGIC;
  SIGNAL and_1021_nl : STD_LOGIC;
  SIGNAL mux_242_nl : STD_LOGIC;
  SIGNAL and_1022_nl : STD_LOGIC;
  SIGNAL and_1012_nl : STD_LOGIC;
  SIGNAL and_1013_nl : STD_LOGIC;
  SIGNAL and_1014_nl : STD_LOGIC;
  SIGNAL and_1015_nl : STD_LOGIC;
  SIGNAL and_1016_nl : STD_LOGIC;
  SIGNAL mux_248_nl : STD_LOGIC;
  SIGNAL and_1017_nl : STD_LOGIC;
  SIGNAL and_1005_nl : STD_LOGIC;
  SIGNAL and_1006_nl : STD_LOGIC;
  SIGNAL and_1007_nl : STD_LOGIC;
  SIGNAL and_1008_nl : STD_LOGIC;
  SIGNAL and_1009_nl : STD_LOGIC;
  SIGNAL and_1010_nl : STD_LOGIC;
  SIGNAL mux_255_nl : STD_LOGIC;
  SIGNAL and_1011_nl : STD_LOGIC;
  SIGNAL and_997_nl : STD_LOGIC;
  SIGNAL and_998_nl : STD_LOGIC;
  SIGNAL and_999_nl : STD_LOGIC;
  SIGNAL and_1000_nl : STD_LOGIC;
  SIGNAL and_1001_nl : STD_LOGIC;
  SIGNAL and_1002_nl : STD_LOGIC;
  SIGNAL and_1003_nl : STD_LOGIC;
  SIGNAL mux_263_nl : STD_LOGIC;
  SIGNAL and_1004_nl : STD_LOGIC;
  SIGNAL and_988_nl : STD_LOGIC;
  SIGNAL or_725_nl : STD_LOGIC;
  SIGNAL and_989_nl : STD_LOGIC;
  SIGNAL and_990_nl : STD_LOGIC;
  SIGNAL and_991_nl : STD_LOGIC;
  SIGNAL and_992_nl : STD_LOGIC;
  SIGNAL and_993_nl : STD_LOGIC;
  SIGNAL and_994_nl : STD_LOGIC;
  SIGNAL and_995_nl : STD_LOGIC;
  SIGNAL mux_272_nl : STD_LOGIC;
  SIGNAL and_996_nl : STD_LOGIC;
  SIGNAL and_987_nl : STD_LOGIC;
  SIGNAL or_735_nl : STD_LOGIC;
  SIGNAL mux_274_nl : STD_LOGIC;
  SIGNAL nor_436_nl : STD_LOGIC;
  SIGNAL mux_275_nl : STD_LOGIC;
  SIGNAL nor_435_nl : STD_LOGIC;
  SIGNAL mux_276_nl : STD_LOGIC;
  SIGNAL nor_434_nl : STD_LOGIC;
  SIGNAL mux_277_nl : STD_LOGIC;
  SIGNAL nor_433_nl : STD_LOGIC;
  SIGNAL mux_278_nl : STD_LOGIC;
  SIGNAL nor_432_nl : STD_LOGIC;
  SIGNAL mux_279_nl : STD_LOGIC;
  SIGNAL nor_430_nl : STD_LOGIC;
  SIGNAL mux_280_nl : STD_LOGIC;
  SIGNAL nor_431_nl : STD_LOGIC;
  SIGNAL nor_427_nl : STD_LOGIC;
  SIGNAL mux_282_nl : STD_LOGIC;
  SIGNAL nor_428_nl : STD_LOGIC;
  SIGNAL mux_283_nl : STD_LOGIC;
  SIGNAL nor_429_nl : STD_LOGIC;
  SIGNAL nor_423_nl : STD_LOGIC;
  SIGNAL nor_424_nl : STD_LOGIC;
  SIGNAL mux_286_nl : STD_LOGIC;
  SIGNAL nor_425_nl : STD_LOGIC;
  SIGNAL mux_287_nl : STD_LOGIC;
  SIGNAL nor_426_nl : STD_LOGIC;
  SIGNAL nor_418_nl : STD_LOGIC;
  SIGNAL or_808_nl : STD_LOGIC;
  SIGNAL nor_419_nl : STD_LOGIC;
  SIGNAL nor_420_nl : STD_LOGIC;
  SIGNAL mux_291_nl : STD_LOGIC;
  SIGNAL nor_421_nl : STD_LOGIC;
  SIGNAL mux_292_nl : STD_LOGIC;
  SIGNAL nor_422_nl : STD_LOGIC;
  SIGNAL nor_409_nl : STD_LOGIC;
  SIGNAL or_823_nl : STD_LOGIC;
  SIGNAL nor_410_nl : STD_LOGIC;
  SIGNAL or_822_nl : STD_LOGIC;
  SIGNAL nor_411_nl : STD_LOGIC;
  SIGNAL or_821_nl : STD_LOGIC;
  SIGNAL nor_412_nl : STD_LOGIC;
  SIGNAL or_820_nl : STD_LOGIC;
  SIGNAL nor_413_nl : STD_LOGIC;
  SIGNAL or_819_nl : STD_LOGIC;
  SIGNAL nor_414_nl : STD_LOGIC;
  SIGNAL or_818_nl : STD_LOGIC;
  SIGNAL nor_415_nl : STD_LOGIC;
  SIGNAL or_817_nl : STD_LOGIC;
  SIGNAL nor_416_nl : STD_LOGIC;
  SIGNAL or_816_nl : STD_LOGIC;
  SIGNAL mux_301_nl : STD_LOGIC;
  SIGNAL nor_417_nl : STD_LOGIC;
  SIGNAL or_815_nl : STD_LOGIC;
  SIGNAL mux_302_nl : STD_LOGIC;
  SIGNAL nor_408_nl : STD_LOGIC;
  SIGNAL and_986_nl : STD_LOGIC;
  SIGNAL mux_304_nl : STD_LOGIC;
  SIGNAL nor_407_nl : STD_LOGIC;
  SIGNAL and_984_nl : STD_LOGIC;
  SIGNAL and_985_nl : STD_LOGIC;
  SIGNAL mux_307_nl : STD_LOGIC;
  SIGNAL nor_406_nl : STD_LOGIC;
  SIGNAL and_981_nl : STD_LOGIC;
  SIGNAL and_982_nl : STD_LOGIC;
  SIGNAL and_983_nl : STD_LOGIC;
  SIGNAL mux_311_nl : STD_LOGIC;
  SIGNAL nor_405_nl : STD_LOGIC;
  SIGNAL and_977_nl : STD_LOGIC;
  SIGNAL and_978_nl : STD_LOGIC;
  SIGNAL and_979_nl : STD_LOGIC;
  SIGNAL and_980_nl : STD_LOGIC;
  SIGNAL mux_316_nl : STD_LOGIC;
  SIGNAL nor_404_nl : STD_LOGIC;
  SIGNAL nor_402_nl : STD_LOGIC;
  SIGNAL and_973_nl : STD_LOGIC;
  SIGNAL and_974_nl : STD_LOGIC;
  SIGNAL and_975_nl : STD_LOGIC;
  SIGNAL and_976_nl : STD_LOGIC;
  SIGNAL mux_322_nl : STD_LOGIC;
  SIGNAL nor_403_nl : STD_LOGIC;
  SIGNAL nor_399_nl : STD_LOGIC;
  SIGNAL nor_400_nl : STD_LOGIC;
  SIGNAL and_969_nl : STD_LOGIC;
  SIGNAL and_970_nl : STD_LOGIC;
  SIGNAL and_971_nl : STD_LOGIC;
  SIGNAL and_972_nl : STD_LOGIC;
  SIGNAL mux_329_nl : STD_LOGIC;
  SIGNAL nor_401_nl : STD_LOGIC;
  SIGNAL nor_395_nl : STD_LOGIC;
  SIGNAL nor_396_nl : STD_LOGIC;
  SIGNAL nor_397_nl : STD_LOGIC;
  SIGNAL and_965_nl : STD_LOGIC;
  SIGNAL and_966_nl : STD_LOGIC;
  SIGNAL and_967_nl : STD_LOGIC;
  SIGNAL and_968_nl : STD_LOGIC;
  SIGNAL mux_337_nl : STD_LOGIC;
  SIGNAL nor_398_nl : STD_LOGIC;
  SIGNAL nor_390_nl : STD_LOGIC;
  SIGNAL or_919_nl : STD_LOGIC;
  SIGNAL nor_391_nl : STD_LOGIC;
  SIGNAL nor_392_nl : STD_LOGIC;
  SIGNAL nor_393_nl : STD_LOGIC;
  SIGNAL and_961_nl : STD_LOGIC;
  SIGNAL and_962_nl : STD_LOGIC;
  SIGNAL and_963_nl : STD_LOGIC;
  SIGNAL and_964_nl : STD_LOGIC;
  SIGNAL mux_346_nl : STD_LOGIC;
  SIGNAL nor_394_nl : STD_LOGIC;
  SIGNAL nor_380_nl : STD_LOGIC;
  SIGNAL or_938_nl : STD_LOGIC;
  SIGNAL nor_381_nl : STD_LOGIC;
  SIGNAL or_937_nl : STD_LOGIC;
  SIGNAL nor_382_nl : STD_LOGIC;
  SIGNAL or_936_nl : STD_LOGIC;
  SIGNAL nor_383_nl : STD_LOGIC;
  SIGNAL or_935_nl : STD_LOGIC;
  SIGNAL nor_384_nl : STD_LOGIC;
  SIGNAL or_934_nl : STD_LOGIC;
  SIGNAL nor_385_nl : STD_LOGIC;
  SIGNAL or_933_nl : STD_LOGIC;
  SIGNAL nor_386_nl : STD_LOGIC;
  SIGNAL or_932_nl : STD_LOGIC;
  SIGNAL nor_387_nl : STD_LOGIC;
  SIGNAL or_931_nl : STD_LOGIC;
  SIGNAL nor_388_nl : STD_LOGIC;
  SIGNAL or_930_nl : STD_LOGIC;
  SIGNAL nor_389_nl : STD_LOGIC;
  SIGNAL or_929_nl : STD_LOGIC;
  SIGNAL mux_357_nl : STD_LOGIC;
  SIGNAL nor_379_nl : STD_LOGIC;
  SIGNAL mux_358_nl : STD_LOGIC;
  SIGNAL nor_378_nl : STD_LOGIC;
  SIGNAL mux_359_nl : STD_LOGIC;
  SIGNAL nor_377_nl : STD_LOGIC;
  SIGNAL mux_360_nl : STD_LOGIC;
  SIGNAL nor_376_nl : STD_LOGIC;
  SIGNAL mux_361_nl : STD_LOGIC;
  SIGNAL nor_375_nl : STD_LOGIC;
  SIGNAL mux_362_nl : STD_LOGIC;
  SIGNAL nor_373_nl : STD_LOGIC;
  SIGNAL mux_363_nl : STD_LOGIC;
  SIGNAL nor_374_nl : STD_LOGIC;
  SIGNAL nor_370_nl : STD_LOGIC;
  SIGNAL mux_365_nl : STD_LOGIC;
  SIGNAL nor_371_nl : STD_LOGIC;
  SIGNAL mux_366_nl : STD_LOGIC;
  SIGNAL nor_372_nl : STD_LOGIC;
  SIGNAL nor_366_nl : STD_LOGIC;
  SIGNAL nor_367_nl : STD_LOGIC;
  SIGNAL mux_369_nl : STD_LOGIC;
  SIGNAL nor_368_nl : STD_LOGIC;
  SIGNAL mux_370_nl : STD_LOGIC;
  SIGNAL nor_369_nl : STD_LOGIC;
  SIGNAL nor_361_nl : STD_LOGIC;
  SIGNAL or_1012_nl : STD_LOGIC;
  SIGNAL nor_362_nl : STD_LOGIC;
  SIGNAL nor_363_nl : STD_LOGIC;
  SIGNAL mux_374_nl : STD_LOGIC;
  SIGNAL nor_364_nl : STD_LOGIC;
  SIGNAL mux_375_nl : STD_LOGIC;
  SIGNAL nor_365_nl : STD_LOGIC;
  SIGNAL nor_352_nl : STD_LOGIC;
  SIGNAL or_1027_nl : STD_LOGIC;
  SIGNAL nor_353_nl : STD_LOGIC;
  SIGNAL or_1026_nl : STD_LOGIC;
  SIGNAL nor_354_nl : STD_LOGIC;
  SIGNAL or_1025_nl : STD_LOGIC;
  SIGNAL nor_355_nl : STD_LOGIC;
  SIGNAL or_1024_nl : STD_LOGIC;
  SIGNAL nor_356_nl : STD_LOGIC;
  SIGNAL or_1023_nl : STD_LOGIC;
  SIGNAL nor_357_nl : STD_LOGIC;
  SIGNAL or_1022_nl : STD_LOGIC;
  SIGNAL nor_358_nl : STD_LOGIC;
  SIGNAL or_1021_nl : STD_LOGIC;
  SIGNAL nor_359_nl : STD_LOGIC;
  SIGNAL or_1020_nl : STD_LOGIC;
  SIGNAL mux_384_nl : STD_LOGIC;
  SIGNAL nor_360_nl : STD_LOGIC;
  SIGNAL or_1019_nl : STD_LOGIC;
  SIGNAL mux_385_nl : STD_LOGIC;
  SIGNAL nor_351_nl : STD_LOGIC;
  SIGNAL and_960_nl : STD_LOGIC;
  SIGNAL mux_387_nl : STD_LOGIC;
  SIGNAL nor_350_nl : STD_LOGIC;
  SIGNAL and_958_nl : STD_LOGIC;
  SIGNAL and_959_nl : STD_LOGIC;
  SIGNAL mux_390_nl : STD_LOGIC;
  SIGNAL nor_349_nl : STD_LOGIC;
  SIGNAL and_955_nl : STD_LOGIC;
  SIGNAL and_956_nl : STD_LOGIC;
  SIGNAL and_957_nl : STD_LOGIC;
  SIGNAL mux_394_nl : STD_LOGIC;
  SIGNAL nor_348_nl : STD_LOGIC;
  SIGNAL and_951_nl : STD_LOGIC;
  SIGNAL and_952_nl : STD_LOGIC;
  SIGNAL and_953_nl : STD_LOGIC;
  SIGNAL and_954_nl : STD_LOGIC;
  SIGNAL mux_399_nl : STD_LOGIC;
  SIGNAL nor_347_nl : STD_LOGIC;
  SIGNAL nor_345_nl : STD_LOGIC;
  SIGNAL and_947_nl : STD_LOGIC;
  SIGNAL and_948_nl : STD_LOGIC;
  SIGNAL and_949_nl : STD_LOGIC;
  SIGNAL and_950_nl : STD_LOGIC;
  SIGNAL mux_405_nl : STD_LOGIC;
  SIGNAL nor_346_nl : STD_LOGIC;
  SIGNAL nor_342_nl : STD_LOGIC;
  SIGNAL nor_343_nl : STD_LOGIC;
  SIGNAL and_943_nl : STD_LOGIC;
  SIGNAL and_944_nl : STD_LOGIC;
  SIGNAL and_945_nl : STD_LOGIC;
  SIGNAL and_946_nl : STD_LOGIC;
  SIGNAL mux_412_nl : STD_LOGIC;
  SIGNAL nor_344_nl : STD_LOGIC;
  SIGNAL nor_338_nl : STD_LOGIC;
  SIGNAL nor_339_nl : STD_LOGIC;
  SIGNAL nor_340_nl : STD_LOGIC;
  SIGNAL and_939_nl : STD_LOGIC;
  SIGNAL and_940_nl : STD_LOGIC;
  SIGNAL and_941_nl : STD_LOGIC;
  SIGNAL and_942_nl : STD_LOGIC;
  SIGNAL mux_420_nl : STD_LOGIC;
  SIGNAL nor_341_nl : STD_LOGIC;
  SIGNAL nor_333_nl : STD_LOGIC;
  SIGNAL nand_12_nl : STD_LOGIC;
  SIGNAL nor_334_nl : STD_LOGIC;
  SIGNAL nor_335_nl : STD_LOGIC;
  SIGNAL nor_336_nl : STD_LOGIC;
  SIGNAL and_935_nl : STD_LOGIC;
  SIGNAL and_936_nl : STD_LOGIC;
  SIGNAL and_937_nl : STD_LOGIC;
  SIGNAL and_938_nl : STD_LOGIC;
  SIGNAL mux_429_nl : STD_LOGIC;
  SIGNAL nor_337_nl : STD_LOGIC;
  SIGNAL nor_324_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL nor_325_nl : STD_LOGIC;
  SIGNAL nand_2_nl : STD_LOGIC;
  SIGNAL nor_326_nl : STD_LOGIC;
  SIGNAL nand_3_nl : STD_LOGIC;
  SIGNAL nor_327_nl : STD_LOGIC;
  SIGNAL nand_4_nl : STD_LOGIC;
  SIGNAL nor_328_nl : STD_LOGIC;
  SIGNAL nand_5_nl : STD_LOGIC;
  SIGNAL nor_329_nl : STD_LOGIC;
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL nor_330_nl : STD_LOGIC;
  SIGNAL nand_7_nl : STD_LOGIC;
  SIGNAL nor_331_nl : STD_LOGIC;
  SIGNAL nand_8_nl : STD_LOGIC;
  SIGNAL nor_332_nl : STD_LOGIC;
  SIGNAL nand_9_nl : STD_LOGIC;
  SIGNAL and_934_nl : STD_LOGIC;
  SIGNAL nand_11_nl : STD_LOGIC;
  SIGNAL base_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL base_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL m_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL m_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL return_rsci_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL return_rsci_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL ccs_ccore_start_rsci_dat : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL ccs_ccore_start_rsci_idat_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL rem_13_cmp_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_1_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_1_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_2_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_2_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_3_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_3_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_4_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_4_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_5_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_5_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_6_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_6_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_7_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_7_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_8_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_8_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_9_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_9_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_10_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_10_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  SIGNAL rem_13_cmp_11_a : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_b : STD_LOGIC_VECTOR (64 DOWNTO 0);
  SIGNAL rem_13_cmp_11_z_1 : STD_LOGIC_VECTOR (64 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
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

  FUNCTION MUX1HOT_v_64_13_2(input_12 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(63 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(63 DOWNTO 0);
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
  sel : STD_LOGIC_VECTOR(12 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
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
      rscid => 9,
      width => 1
      )
    PORT MAP(
      dat => ccs_ccore_start_rsci_dat,
      idat => ccs_ccore_start_rsci_idat_1
    );
  ccs_ccore_start_rsci_dat(0) <= ccs_ccore_start_rsc_dat;
  ccs_ccore_start_rsci_idat <= ccs_ccore_start_rsci_idat_1(0);

  rem_13_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_a,
      b => rem_13_cmp_b,
      z => rem_13_cmp_z_1
    );
  rem_13_cmp_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_a_63_0),65));
  rem_13_cmp_b <= '0' & rem_13_cmp_b_63_0;
  rem_13_cmp_z <= rem_13_cmp_z_1;

  rem_13_cmp_1 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_1_a,
      b => rem_13_cmp_1_b,
      z => rem_13_cmp_1_z_1
    );
  rem_13_cmp_1_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_1_a_63_0),65));
  rem_13_cmp_1_b <= '0' & rem_13_cmp_1_b_63_0;
  rem_13_cmp_1_z <= rem_13_cmp_1_z_1;

  rem_13_cmp_2 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_2_a,
      b => rem_13_cmp_2_b,
      z => rem_13_cmp_2_z_1
    );
  rem_13_cmp_2_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_2_a_63_0),65));
  rem_13_cmp_2_b <= '0' & rem_13_cmp_2_b_63_0;
  rem_13_cmp_2_z <= rem_13_cmp_2_z_1;

  rem_13_cmp_3 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_3_a,
      b => rem_13_cmp_3_b,
      z => rem_13_cmp_3_z_1
    );
  rem_13_cmp_3_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_3_a_63_0),65));
  rem_13_cmp_3_b <= '0' & rem_13_cmp_3_b_63_0;
  rem_13_cmp_3_z <= rem_13_cmp_3_z_1;

  rem_13_cmp_4 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_4_a,
      b => rem_13_cmp_4_b,
      z => rem_13_cmp_4_z_1
    );
  rem_13_cmp_4_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_4_a_63_0),65));
  rem_13_cmp_4_b <= '0' & rem_13_cmp_4_b_63_0;
  rem_13_cmp_4_z <= rem_13_cmp_4_z_1;

  rem_13_cmp_5 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_5_a,
      b => rem_13_cmp_5_b,
      z => rem_13_cmp_5_z_1
    );
  rem_13_cmp_5_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_5_a_63_0),65));
  rem_13_cmp_5_b <= '0' & rem_13_cmp_5_b_63_0;
  rem_13_cmp_5_z <= rem_13_cmp_5_z_1;

  rem_13_cmp_6 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_6_a,
      b => rem_13_cmp_6_b,
      z => rem_13_cmp_6_z_1
    );
  rem_13_cmp_6_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_6_a_63_0),65));
  rem_13_cmp_6_b <= '0' & rem_13_cmp_6_b_63_0;
  rem_13_cmp_6_z <= rem_13_cmp_6_z_1;

  rem_13_cmp_7 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_7_a,
      b => rem_13_cmp_7_b,
      z => rem_13_cmp_7_z_1
    );
  rem_13_cmp_7_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_7_a_63_0),65));
  rem_13_cmp_7_b <= '0' & rem_13_cmp_7_b_63_0;
  rem_13_cmp_7_z <= rem_13_cmp_7_z_1;

  rem_13_cmp_8 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_8_a,
      b => rem_13_cmp_8_b,
      z => rem_13_cmp_8_z_1
    );
  rem_13_cmp_8_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_8_a_63_0),65));
  rem_13_cmp_8_b <= '0' & rem_13_cmp_8_b_63_0;
  rem_13_cmp_8_z <= rem_13_cmp_8_z_1;

  rem_13_cmp_9 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_9_a,
      b => rem_13_cmp_9_b,
      z => rem_13_cmp_9_z_1
    );
  rem_13_cmp_9_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_9_a_63_0),65));
  rem_13_cmp_9_b <= '0' & rem_13_cmp_9_b_63_0;
  rem_13_cmp_9_z <= rem_13_cmp_9_z_1;

  rem_13_cmp_10 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_10_a,
      b => rem_13_cmp_10_b,
      z => rem_13_cmp_10_z_1
    );
  rem_13_cmp_10_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_10_a_63_0),65));
  rem_13_cmp_10_b <= '0' & rem_13_cmp_10_b_63_0;
  rem_13_cmp_10_z <= rem_13_cmp_10_z_1;

  rem_13_cmp_11 : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 65,
      width_b => 65,
      signd => 1
      )
    PORT MAP(
      a => rem_13_cmp_11_a,
      b => rem_13_cmp_11_b,
      z => rem_13_cmp_11_z_1
    );
  rem_13_cmp_11_a <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(rem_13_cmp_11_a_63_0),65));
  rem_13_cmp_11_b <= '0' & rem_13_cmp_11_b_63_0;
  rem_13_cmp_11_z <= rem_13_cmp_11_z_1;

  and_1203_cse <= ccs_ccore_en AND main_stage_0_12 AND asn_itm_11;
  and_1173_cse <= ccs_ccore_en AND (and_dcpl_294 OR and_dcpl_300 OR and_dcpl_306
      OR and_dcpl_312 OR and_dcpl_318 OR and_dcpl_324 OR and_dcpl_330 OR and_dcpl_336
      OR and_dcpl_342 OR and_dcpl_348 OR and_tmp_35);
  and_1175_cse <= ccs_ccore_en AND (and_dcpl_356 OR and_dcpl_360 OR and_dcpl_364
      OR and_dcpl_368 OR and_dcpl_372 OR and_dcpl_376 OR and_dcpl_379 OR and_dcpl_382
      OR and_dcpl_385 OR and_dcpl_388 OR mux_tmp_76);
  and_1177_cse <= ccs_ccore_en AND (and_dcpl_394 OR and_dcpl_397 OR and_dcpl_400
      OR and_dcpl_403 OR and_dcpl_406 OR and_dcpl_409 OR and_dcpl_413 OR and_dcpl_417
      OR and_dcpl_421 OR and_dcpl_425 OR and_tmp_80);
  and_1179_cse <= ccs_ccore_en AND (and_dcpl_431 OR and_dcpl_433 OR and_dcpl_435
      OR and_dcpl_437 OR and_dcpl_439 OR and_dcpl_442 OR and_dcpl_445 OR and_dcpl_448
      OR and_dcpl_451 OR and_dcpl_454 OR mux_tmp_141);
  and_1181_cse <= ccs_ccore_en AND (and_dcpl_461 OR and_dcpl_465 OR and_dcpl_469
      OR and_dcpl_473 OR and_dcpl_477 OR and_dcpl_480 OR and_dcpl_483 OR and_dcpl_486
      OR and_dcpl_489 OR and_dcpl_492 OR and_tmp_125);
  and_1183_cse <= ccs_ccore_en AND (and_dcpl_498 OR and_dcpl_500 OR and_dcpl_502
      OR and_dcpl_504 OR and_dcpl_506 OR and_dcpl_508 OR and_dcpl_510 OR and_dcpl_512
      OR and_dcpl_514 OR and_dcpl_516 OR mux_tmp_206);
  and_1185_cse <= ccs_ccore_en AND (and_dcpl_520 OR and_dcpl_523 OR and_dcpl_526
      OR and_dcpl_529 OR and_dcpl_532 OR and_dcpl_534 OR and_dcpl_536 OR and_dcpl_538
      OR and_dcpl_540 OR and_dcpl_542 OR and_tmp_170);
  and_1187_cse <= ccs_ccore_en AND (and_dcpl_546 OR and_dcpl_548 OR and_dcpl_550
      OR and_dcpl_552 OR and_dcpl_554 OR and_dcpl_556 OR and_dcpl_558 OR and_dcpl_560
      OR and_dcpl_562 OR and_dcpl_564 OR mux_tmp_271);
  and_1189_cse <= ccs_ccore_en AND (and_dcpl_569 OR and_dcpl_573 OR and_dcpl_577
      OR and_dcpl_581 OR and_dcpl_585 OR and_dcpl_589 OR and_dcpl_593 OR and_dcpl_597
      OR and_dcpl_601 OR and_dcpl_605 OR and_tmp_206);
  and_1191_cse <= ccs_ccore_en AND (and_dcpl_610 OR and_dcpl_612 OR and_dcpl_614
      OR and_dcpl_616 OR and_dcpl_618 OR and_dcpl_622 OR and_dcpl_625 OR and_dcpl_628
      OR and_dcpl_631 OR and_dcpl_634 OR mux_tmp_354);
  and_1193_cse <= ccs_ccore_en AND (and_dcpl_638 OR and_dcpl_641 OR and_dcpl_644
      OR and_dcpl_647 OR and_dcpl_650 OR and_dcpl_653 OR and_dcpl_657 OR and_dcpl_661
      OR and_dcpl_665 OR and_dcpl_669 OR and_tmp_233);
  and_1195_cse <= ccs_ccore_en AND (and_dcpl_673 OR and_dcpl_675 OR and_dcpl_677
      OR and_dcpl_679 OR and_dcpl_681 OR and_dcpl_684 OR and_dcpl_687 OR and_dcpl_690
      OR and_dcpl_693 OR and_dcpl_696 OR mux_tmp_437);
  and_1205_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_2;
  and_1207_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_6;
  and_1209_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_9;
  and_1211_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_11;
  and_1213_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_2;
  and_1215_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_6;
  and_1217_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_9;
  and_1219_cse <= ccs_ccore_en AND and_dcpl_13 AND and_dcpl_11;
  and_1221_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_1223_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_18 AND (rem_12cyc_st_10_1_0(0));
  and_1225_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_23 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_1227_cse <= ccs_ccore_en AND and_dcpl_4 AND and_dcpl_23 AND (rem_12cyc_st_10_1_0(0));
  and_1229_cse <= ccs_ccore_en AND and_dcpl_3;
  and_1231_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_29;
  and_1233_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_33;
  and_1235_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_36;
  and_1237_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_38;
  and_1239_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_29;
  and_1241_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_33;
  and_1243_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_36;
  and_1245_cse <= ccs_ccore_en AND and_dcpl_40 AND and_dcpl_38;
  and_1247_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_45 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_1249_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_45 AND (rem_12cyc_st_9_1_0(0));
  and_1251_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_50 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_1253_cse <= ccs_ccore_en AND and_dcpl_31 AND and_dcpl_50 AND (rem_12cyc_st_9_1_0(0));
  and_1255_cse <= ccs_ccore_en AND and_dcpl_30;
  and_1257_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_56;
  and_1259_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_60;
  and_1261_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_63;
  and_1263_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_65;
  and_1265_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_56;
  and_1267_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_60;
  and_1269_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_63;
  and_1271_cse <= ccs_ccore_en AND and_dcpl_67 AND and_dcpl_65;
  and_1273_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_72 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_1275_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_72 AND (rem_12cyc_st_8_1_0(0));
  and_1277_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_77 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_1279_cse <= ccs_ccore_en AND and_dcpl_58 AND and_dcpl_77 AND (rem_12cyc_st_8_1_0(0));
  and_1281_cse <= ccs_ccore_en AND and_dcpl_57;
  and_1283_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_83;
  and_1285_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_87;
  and_1287_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_90;
  and_1289_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_92;
  and_1291_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_83;
  and_1293_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_87;
  and_1295_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_90;
  and_1297_cse <= ccs_ccore_en AND and_dcpl_94 AND and_dcpl_92;
  and_1299_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_99 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_1301_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_99 AND (rem_12cyc_st_7_1_0(0));
  and_1303_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_104 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_1305_cse <= ccs_ccore_en AND and_dcpl_85 AND and_dcpl_104 AND (rem_12cyc_st_7_1_0(0));
  and_1307_cse <= ccs_ccore_en AND and_dcpl_84;
  and_1309_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_110;
  and_1311_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_115;
  and_1313_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_117;
  and_1315_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_119;
  and_1317_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_110;
  and_1319_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_115;
  and_1321_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_117;
  and_1323_cse <= ccs_ccore_en AND and_dcpl_121 AND and_dcpl_119;
  and_1325_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_126 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_1327_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_129 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_1329_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_126 AND (rem_12cyc_st_6_1_0(1));
  and_1331_cse <= ccs_ccore_en AND and_dcpl_112 AND and_dcpl_129 AND (rem_12cyc_st_6_1_0(1));
  and_1333_cse <= ccs_ccore_en AND and_dcpl_111;
  and_1335_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_137;
  and_1337_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_141;
  and_1339_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_144;
  and_1341_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_146;
  and_1343_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_137;
  and_1345_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_141;
  and_1347_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_144;
  and_1349_cse <= ccs_ccore_en AND and_dcpl_148 AND and_dcpl_146;
  and_1351_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_153 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_1353_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_153 AND (rem_12cyc_st_5_1_0(0));
  and_1355_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_158 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_1357_cse <= ccs_ccore_en AND and_dcpl_139 AND and_dcpl_158 AND (rem_12cyc_st_5_1_0(0));
  and_1359_cse <= ccs_ccore_en AND and_dcpl_138;
  and_1361_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_164;
  and_1363_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_168;
  and_1365_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_171;
  and_1367_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_173;
  and_1369_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_175 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_1371_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_175 AND (rem_12cyc_st_4_1_0(0));
  and_1373_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_180 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_1375_cse <= ccs_ccore_en AND and_dcpl_166 AND and_dcpl_180 AND (rem_12cyc_st_4_1_0(0));
  and_1377_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_164;
  and_1379_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_168;
  and_1381_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_171;
  and_1383_cse <= ccs_ccore_en AND and_dcpl_185 AND and_dcpl_173;
  and_1385_cse <= ccs_ccore_en AND and_dcpl_165;
  and_1387_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_191;
  and_1389_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_195;
  and_1391_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_198;
  and_1393_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_200;
  and_1395_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_191;
  and_1397_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_195;
  and_1399_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_198;
  and_1401_cse <= ccs_ccore_en AND and_dcpl_202 AND and_dcpl_200;
  and_1403_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_207 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_1405_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_207 AND (rem_12cyc_st_3_1_0(0));
  and_1407_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_212 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_1409_cse <= ccs_ccore_en AND and_dcpl_193 AND and_dcpl_212 AND (rem_12cyc_st_3_1_0(0));
  and_1411_cse <= ccs_ccore_en AND and_dcpl_192;
  and_1413_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_218;
  and_1415_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_222;
  and_1417_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_225;
  and_1419_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_227;
  and_1421_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_229 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_1423_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_229 AND (rem_12cyc_st_2_1_0(0));
  and_1425_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_234 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_1427_cse <= ccs_ccore_en AND and_dcpl_220 AND and_dcpl_234 AND (rem_12cyc_st_2_1_0(0));
  and_1429_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_218;
  and_1431_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_222;
  and_1433_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_225;
  and_1435_cse <= ccs_ccore_en AND and_dcpl_239 AND and_dcpl_227;
  and_1437_cse <= ccs_ccore_en AND and_dcpl_219;
  and_1439_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_245;
  and_1441_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_249;
  and_1443_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_252;
  and_1445_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_254;
  and_1447_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_245;
  and_1449_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_249;
  and_1451_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_252;
  and_1453_cse <= ccs_ccore_en AND and_dcpl_256 AND and_dcpl_254;
  and_1455_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_261 AND (NOT (rem_12cyc_1_0(0)));
  and_1457_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_261 AND (rem_12cyc_1_0(0));
  and_1459_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_266 AND (NOT (rem_12cyc_1_0(0)));
  and_1461_cse <= ccs_ccore_en AND and_dcpl_247 AND and_dcpl_266 AND (rem_12cyc_1_0(0));
  and_1463_cse <= ccs_ccore_en AND and_dcpl_246;
  and_1197_cse <= ccs_ccore_en AND ccs_ccore_start_rsci_idat;
  and_273_nl <= and_dcpl_272 AND and_dcpl_271;
  and_275_nl <= and_dcpl_272 AND and_dcpl_274;
  and_277_nl <= and_dcpl_272 AND and_dcpl_276;
  and_279_nl <= and_dcpl_272 AND and_dcpl_278;
  and_281_nl <= and_dcpl_280 AND and_dcpl_271;
  and_282_nl <= and_dcpl_280 AND and_dcpl_274;
  and_283_nl <= and_dcpl_280 AND and_dcpl_276;
  and_284_nl <= and_dcpl_280 AND and_dcpl_278;
  and_286_nl <= and_dcpl_285 AND and_dcpl_271;
  and_287_nl <= and_dcpl_285 AND and_dcpl_274;
  and_288_nl <= and_dcpl_285 AND and_dcpl_276;
  and_289_nl <= and_dcpl_285 AND and_dcpl_278;
  and_290_nl <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("11"));
  result_sva_duc_mx0 <= MUX1HOT_v_64_13_2((rem_13_cmp_1_z(63 DOWNTO 0)), (rem_13_cmp_2_z(63
      DOWNTO 0)), (rem_13_cmp_3_z(63 DOWNTO 0)), (rem_13_cmp_4_z(63 DOWNTO 0)), (rem_13_cmp_5_z(63
      DOWNTO 0)), (rem_13_cmp_6_z(63 DOWNTO 0)), (rem_13_cmp_7_z(63 DOWNTO 0)), (rem_13_cmp_8_z(63
      DOWNTO 0)), (rem_13_cmp_9_z(63 DOWNTO 0)), (rem_13_cmp_10_z(63 DOWNTO 0)),
      (rem_13_cmp_11_z(63 DOWNTO 0)), (rem_13_cmp_z(63 DOWNTO 0)), result_sva_duc,
      STD_LOGIC_VECTOR'( and_273_nl & and_275_nl & and_277_nl & and_279_nl & and_281_nl
      & and_282_nl & and_283_nl & and_284_nl & and_286_nl & and_287_nl & and_288_nl
      & and_289_nl & and_290_nl));
  acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(rem_12cyc_3_2 & rem_12cyc_1_0)
      + UNSIGNED'( "0001"), 4));
  xor_nl <= (acc_1_tmp(2)) XOR (acc_1_tmp(3));
  nor_nl <= NOT(CONV_SL_1_1(acc_1_tmp(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("10")));
  acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(xor_nl, 1),
      2) + CONV_UNSIGNED(CONV_UNSIGNED(nor_nl, 1), 2), 2));
  and_dcpl_1 <= NOT((rem_12cyc_st_10_3_2(1)) OR (rem_12cyc_st_10_1_0(1)));
  and_dcpl_2 <= and_dcpl_1 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_dcpl_3 <= main_stage_0_11 AND asn_itm_10;
  and_dcpl_4 <= and_dcpl_3 AND (NOT (rem_12cyc_st_10_3_2(0)));
  and_dcpl_6 <= and_dcpl_1 AND (rem_12cyc_st_10_1_0(0));
  and_dcpl_8 <= (NOT (rem_12cyc_st_10_3_2(1))) AND (rem_12cyc_st_10_1_0(1));
  and_dcpl_9 <= and_dcpl_8 AND (NOT (rem_12cyc_st_10_1_0(0)));
  and_dcpl_11 <= and_dcpl_8 AND (rem_12cyc_st_10_1_0(0));
  and_dcpl_13 <= and_dcpl_3 AND (rem_12cyc_st_10_3_2(0));
  and_dcpl_18 <= (rem_12cyc_st_10_3_2(1)) AND (NOT (rem_12cyc_st_10_1_0(1)));
  and_dcpl_23 <= (rem_12cyc_st_10_3_2(1)) AND (rem_12cyc_st_10_1_0(1));
  and_dcpl_28 <= NOT((rem_12cyc_st_9_3_2(1)) OR (rem_12cyc_st_9_1_0(1)));
  and_dcpl_29 <= and_dcpl_28 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_dcpl_30 <= main_stage_0_10 AND asn_itm_9;
  and_dcpl_31 <= and_dcpl_30 AND (NOT (rem_12cyc_st_9_3_2(0)));
  and_dcpl_33 <= and_dcpl_28 AND (rem_12cyc_st_9_1_0(0));
  and_dcpl_35 <= (NOT (rem_12cyc_st_9_3_2(1))) AND (rem_12cyc_st_9_1_0(1));
  and_dcpl_36 <= and_dcpl_35 AND (NOT (rem_12cyc_st_9_1_0(0)));
  and_dcpl_38 <= and_dcpl_35 AND (rem_12cyc_st_9_1_0(0));
  and_dcpl_40 <= and_dcpl_30 AND (rem_12cyc_st_9_3_2(0));
  and_dcpl_45 <= (rem_12cyc_st_9_3_2(1)) AND (NOT (rem_12cyc_st_9_1_0(1)));
  and_dcpl_50 <= (rem_12cyc_st_9_3_2(1)) AND (rem_12cyc_st_9_1_0(1));
  and_dcpl_55 <= NOT((rem_12cyc_st_8_3_2(1)) OR (rem_12cyc_st_8_1_0(1)));
  and_dcpl_56 <= and_dcpl_55 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_dcpl_57 <= main_stage_0_9 AND asn_itm_8;
  and_dcpl_58 <= and_dcpl_57 AND (NOT (rem_12cyc_st_8_3_2(0)));
  and_dcpl_60 <= and_dcpl_55 AND (rem_12cyc_st_8_1_0(0));
  and_dcpl_62 <= (NOT (rem_12cyc_st_8_3_2(1))) AND (rem_12cyc_st_8_1_0(1));
  and_dcpl_63 <= and_dcpl_62 AND (NOT (rem_12cyc_st_8_1_0(0)));
  and_dcpl_65 <= and_dcpl_62 AND (rem_12cyc_st_8_1_0(0));
  and_dcpl_67 <= and_dcpl_57 AND (rem_12cyc_st_8_3_2(0));
  and_dcpl_72 <= (rem_12cyc_st_8_3_2(1)) AND (NOT (rem_12cyc_st_8_1_0(1)));
  and_dcpl_77 <= (rem_12cyc_st_8_3_2(1)) AND (rem_12cyc_st_8_1_0(1));
  and_dcpl_82 <= NOT((rem_12cyc_st_7_3_2(1)) OR (rem_12cyc_st_7_1_0(1)));
  and_dcpl_83 <= and_dcpl_82 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_dcpl_84 <= main_stage_0_8 AND asn_itm_7;
  and_dcpl_85 <= and_dcpl_84 AND (NOT (rem_12cyc_st_7_3_2(0)));
  and_dcpl_87 <= and_dcpl_82 AND (rem_12cyc_st_7_1_0(0));
  and_dcpl_89 <= (NOT (rem_12cyc_st_7_3_2(1))) AND (rem_12cyc_st_7_1_0(1));
  and_dcpl_90 <= and_dcpl_89 AND (NOT (rem_12cyc_st_7_1_0(0)));
  and_dcpl_92 <= and_dcpl_89 AND (rem_12cyc_st_7_1_0(0));
  and_dcpl_94 <= and_dcpl_84 AND (rem_12cyc_st_7_3_2(0));
  and_dcpl_99 <= (rem_12cyc_st_7_3_2(1)) AND (NOT (rem_12cyc_st_7_1_0(1)));
  and_dcpl_104 <= (rem_12cyc_st_7_3_2(1)) AND (rem_12cyc_st_7_1_0(1));
  and_dcpl_109 <= NOT((rem_12cyc_st_6_3_2(1)) OR (rem_12cyc_st_6_1_0(0)));
  and_dcpl_110 <= and_dcpl_109 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_dcpl_111 <= main_stage_0_7 AND asn_itm_6;
  and_dcpl_112 <= and_dcpl_111 AND (NOT (rem_12cyc_st_6_3_2(0)));
  and_dcpl_114 <= (NOT (rem_12cyc_st_6_3_2(1))) AND (rem_12cyc_st_6_1_0(0));
  and_dcpl_115 <= and_dcpl_114 AND (NOT (rem_12cyc_st_6_1_0(1)));
  and_dcpl_117 <= and_dcpl_109 AND (rem_12cyc_st_6_1_0(1));
  and_dcpl_119 <= and_dcpl_114 AND (rem_12cyc_st_6_1_0(1));
  and_dcpl_121 <= and_dcpl_111 AND (rem_12cyc_st_6_3_2(0));
  and_dcpl_126 <= (rem_12cyc_st_6_3_2(1)) AND (NOT (rem_12cyc_st_6_1_0(0)));
  and_dcpl_129 <= (rem_12cyc_st_6_3_2(1)) AND (rem_12cyc_st_6_1_0(0));
  and_dcpl_136 <= NOT((rem_12cyc_st_5_3_2(1)) OR (rem_12cyc_st_5_1_0(1)));
  and_dcpl_137 <= and_dcpl_136 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_dcpl_138 <= main_stage_0_6 AND asn_itm_5;
  and_dcpl_139 <= and_dcpl_138 AND (NOT (rem_12cyc_st_5_3_2(0)));
  and_dcpl_141 <= and_dcpl_136 AND (rem_12cyc_st_5_1_0(0));
  and_dcpl_143 <= (NOT (rem_12cyc_st_5_3_2(1))) AND (rem_12cyc_st_5_1_0(1));
  and_dcpl_144 <= and_dcpl_143 AND (NOT (rem_12cyc_st_5_1_0(0)));
  and_dcpl_146 <= and_dcpl_143 AND (rem_12cyc_st_5_1_0(0));
  and_dcpl_148 <= and_dcpl_138 AND (rem_12cyc_st_5_3_2(0));
  and_dcpl_153 <= (rem_12cyc_st_5_3_2(1)) AND (NOT (rem_12cyc_st_5_1_0(1)));
  and_dcpl_158 <= (rem_12cyc_st_5_3_2(1)) AND (rem_12cyc_st_5_1_0(1));
  and_dcpl_163 <= NOT((rem_12cyc_st_4_3_2(0)) OR (rem_12cyc_st_4_1_0(1)));
  and_dcpl_164 <= and_dcpl_163 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_dcpl_165 <= main_stage_0_5 AND asn_itm_4;
  and_dcpl_166 <= and_dcpl_165 AND (NOT (rem_12cyc_st_4_3_2(1)));
  and_dcpl_168 <= and_dcpl_163 AND (rem_12cyc_st_4_1_0(0));
  and_dcpl_170 <= (NOT (rem_12cyc_st_4_3_2(0))) AND (rem_12cyc_st_4_1_0(1));
  and_dcpl_171 <= and_dcpl_170 AND (NOT (rem_12cyc_st_4_1_0(0)));
  and_dcpl_173 <= and_dcpl_170 AND (rem_12cyc_st_4_1_0(0));
  and_dcpl_175 <= (rem_12cyc_st_4_3_2(0)) AND (NOT (rem_12cyc_st_4_1_0(1)));
  and_dcpl_180 <= (rem_12cyc_st_4_3_2(0)) AND (rem_12cyc_st_4_1_0(1));
  and_dcpl_185 <= and_dcpl_165 AND (rem_12cyc_st_4_3_2(1));
  and_dcpl_190 <= NOT((rem_12cyc_st_3_3_2(1)) OR (rem_12cyc_st_3_1_0(1)));
  and_dcpl_191 <= and_dcpl_190 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_dcpl_192 <= main_stage_0_4 AND asn_itm_3;
  and_dcpl_193 <= and_dcpl_192 AND (NOT (rem_12cyc_st_3_3_2(0)));
  and_dcpl_195 <= and_dcpl_190 AND (rem_12cyc_st_3_1_0(0));
  and_dcpl_197 <= (NOT (rem_12cyc_st_3_3_2(1))) AND (rem_12cyc_st_3_1_0(1));
  and_dcpl_198 <= and_dcpl_197 AND (NOT (rem_12cyc_st_3_1_0(0)));
  and_dcpl_200 <= and_dcpl_197 AND (rem_12cyc_st_3_1_0(0));
  and_dcpl_202 <= and_dcpl_192 AND (rem_12cyc_st_3_3_2(0));
  and_dcpl_207 <= (rem_12cyc_st_3_3_2(1)) AND (NOT (rem_12cyc_st_3_1_0(1)));
  and_dcpl_212 <= (rem_12cyc_st_3_3_2(1)) AND (rem_12cyc_st_3_1_0(1));
  and_dcpl_217 <= NOT((rem_12cyc_st_2_3_2(0)) OR (rem_12cyc_st_2_1_0(1)));
  and_dcpl_218 <= and_dcpl_217 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_dcpl_219 <= main_stage_0_3 AND asn_itm_2;
  and_dcpl_220 <= and_dcpl_219 AND (NOT (rem_12cyc_st_2_3_2(1)));
  and_dcpl_222 <= and_dcpl_217 AND (rem_12cyc_st_2_1_0(0));
  and_dcpl_224 <= (NOT (rem_12cyc_st_2_3_2(0))) AND (rem_12cyc_st_2_1_0(1));
  and_dcpl_225 <= and_dcpl_224 AND (NOT (rem_12cyc_st_2_1_0(0)));
  and_dcpl_227 <= and_dcpl_224 AND (rem_12cyc_st_2_1_0(0));
  and_dcpl_229 <= (rem_12cyc_st_2_3_2(0)) AND (NOT (rem_12cyc_st_2_1_0(1)));
  and_dcpl_234 <= (rem_12cyc_st_2_3_2(0)) AND (rem_12cyc_st_2_1_0(1));
  and_dcpl_239 <= and_dcpl_219 AND (rem_12cyc_st_2_3_2(1));
  and_dcpl_244 <= NOT((rem_12cyc_3_2(1)) OR (rem_12cyc_1_0(1)));
  and_dcpl_245 <= and_dcpl_244 AND (NOT (rem_12cyc_1_0(0)));
  and_dcpl_246 <= main_stage_0_2 AND asn_itm_1;
  and_dcpl_247 <= and_dcpl_246 AND (NOT (rem_12cyc_3_2(0)));
  and_dcpl_249 <= and_dcpl_244 AND (rem_12cyc_1_0(0));
  and_dcpl_251 <= (NOT (rem_12cyc_3_2(1))) AND (rem_12cyc_1_0(1));
  and_dcpl_252 <= and_dcpl_251 AND (NOT (rem_12cyc_1_0(0)));
  and_dcpl_254 <= and_dcpl_251 AND (rem_12cyc_1_0(0));
  and_dcpl_256 <= and_dcpl_246 AND (rem_12cyc_3_2(0));
  and_dcpl_261 <= (rem_12cyc_3_2(1)) AND (NOT (rem_12cyc_1_0(1)));
  and_dcpl_266 <= (rem_12cyc_3_2(1)) AND (rem_12cyc_1_0(1));
  and_dcpl_271 <= NOT(CONV_SL_1_1(rem_12cyc_st_12_1_0/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_272 <= NOT(CONV_SL_1_1(rem_12cyc_st_12_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_274 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("01"));
  and_dcpl_276 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("10"));
  and_dcpl_278 <= CONV_SL_1_1(rem_12cyc_st_12_1_0=STD_LOGIC_VECTOR'("11"));
  and_dcpl_280 <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_285 <= CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_291 <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_292 <= ccs_ccore_start_rsci_idat AND (NOT (acc_tmp(0)));
  and_dcpl_293 <= and_dcpl_292 AND (NOT (acc_tmp(1)));
  and_dcpl_294 <= and_dcpl_293 AND and_dcpl_291;
  and_dcpl_295 <= NOT(CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_296 <= and_dcpl_295 AND (NOT (rem_12cyc_st_2_1_0(1)));
  and_dcpl_298 <= (NOT (rem_12cyc_st_2_1_0(0))) AND main_stage_0_3 AND asn_itm_2;
  not_tmp_54 <= NOT(asn_itm_1 AND main_stage_0_2);
  or_tmp_2 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_1_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_518_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_2));
  mux_14_nl <= MUX_s_1_2_2(nor_518_nl, or_tmp_2, or_1_cse);
  and_dcpl_300 <= mux_14_nl AND and_dcpl_298 AND and_dcpl_296;
  and_dcpl_301 <= NOT(CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_302 <= and_dcpl_301 AND (NOT (rem_12cyc_st_3_1_0(1)));
  and_dcpl_304 <= (NOT (rem_12cyc_st_3_1_0(0))) AND main_stage_0_4 AND asn_itm_3;
  or_6_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp <= or_6_cse AND or_tmp_2;
  nor_517_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp));
  mux_15_nl <= MUX_s_1_2_2(nor_517_nl, and_tmp, or_1_cse);
  and_dcpl_306 <= mux_15_nl AND and_dcpl_304 AND and_dcpl_302;
  and_dcpl_307 <= NOT(CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_308 <= and_dcpl_307 AND (NOT (rem_12cyc_st_4_1_0(1)));
  and_dcpl_310 <= (NOT (rem_12cyc_st_4_1_0(0))) AND main_stage_0_5 AND asn_itm_4;
  or_10_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_2 <= or_6_cse AND or_10_cse AND or_tmp_2;
  nor_516_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_2));
  mux_16_nl <= MUX_s_1_2_2(nor_516_nl, and_tmp_2, or_1_cse);
  and_dcpl_312 <= mux_16_nl AND and_dcpl_310 AND and_dcpl_308;
  and_dcpl_313 <= NOT(CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00")));
  and_dcpl_314 <= and_dcpl_313 AND (NOT (rem_12cyc_st_5_1_0(1)));
  and_dcpl_316 <= (NOT (rem_12cyc_st_5_1_0(0))) AND main_stage_0_6 AND asn_itm_5;
  or_15_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_5 <= or_6_cse AND or_10_cse AND or_15_cse AND or_tmp_2;
  nor_515_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_5));
  mux_17_nl <= MUX_s_1_2_2(nor_515_nl, and_tmp_5, or_1_cse);
  and_dcpl_318 <= mux_17_nl AND and_dcpl_316 AND and_dcpl_314;
  or_21_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_9 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND or_tmp_2;
  nor_514_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_9));
  mux_18_nl <= MUX_s_1_2_2(nor_514_nl, and_tmp_9, or_1_cse);
  and_dcpl_324 <= mux_18_nl AND and_dcpl_112 AND and_dcpl_110;
  or_28_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_512_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_2));
  mux_19_nl <= MUX_s_1_2_2(nor_512_nl, or_tmp_2, or_28_cse);
  and_tmp_13 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_19_nl;
  nor_513_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_13));
  mux_20_nl <= MUX_s_1_2_2(nor_513_nl, and_tmp_13, or_1_cse);
  and_dcpl_330 <= mux_20_nl AND and_dcpl_85 AND and_dcpl_83;
  or_37_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_509_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_2));
  mux_tmp_19 <= MUX_s_1_2_2(nor_509_nl, or_tmp_2, or_37_cse);
  nor_510_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_19));
  mux_22_nl <= MUX_s_1_2_2(nor_510_nl, mux_tmp_19, or_28_cse);
  and_tmp_17 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_22_nl;
  nor_511_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_17));
  mux_23_nl <= MUX_s_1_2_2(nor_511_nl, and_tmp_17, or_1_cse);
  and_dcpl_336 <= mux_23_nl AND and_dcpl_58 AND and_dcpl_56;
  or_48_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_505_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_2));
  mux_tmp_22 <= MUX_s_1_2_2(nor_505_nl, or_tmp_2, or_48_cse);
  nor_506_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_22));
  mux_tmp_23 <= MUX_s_1_2_2(nor_506_nl, mux_tmp_22, or_37_cse);
  nor_507_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_23));
  mux_26_nl <= MUX_s_1_2_2(nor_507_nl, mux_tmp_23, or_28_cse);
  and_tmp_21 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_26_nl;
  nor_508_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_21));
  mux_27_nl <= MUX_s_1_2_2(nor_508_nl, and_tmp_21, or_1_cse);
  and_dcpl_342 <= mux_27_nl AND and_dcpl_31 AND and_dcpl_29;
  nor_500_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_2));
  or_61_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_26 <= MUX_s_1_2_2(nor_500_nl, or_tmp_2, or_61_nl);
  nor_501_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_26));
  mux_tmp_27 <= MUX_s_1_2_2(nor_501_nl, mux_tmp_26, or_48_cse);
  nor_502_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_27));
  mux_tmp_28 <= MUX_s_1_2_2(nor_502_nl, mux_tmp_27, or_37_cse);
  nor_503_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_28));
  mux_31_nl <= MUX_s_1_2_2(nor_503_nl, mux_tmp_28, or_28_cse);
  and_tmp_25 <= or_6_cse AND or_10_cse AND or_15_cse AND or_21_cse AND mux_31_nl;
  nor_504_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_25));
  mux_32_nl <= MUX_s_1_2_2(nor_504_nl, and_tmp_25, or_1_cse);
  and_dcpl_348 <= mux_32_nl AND and_dcpl_4 AND and_dcpl_2;
  and_tmp_35 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND or_6_cse AND
      or_10_cse AND or_15_cse AND or_21_cse AND ((NOT main_stage_0_7) OR (NOT asn_itm_6)
      OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_355 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("01"));
  and_dcpl_356 <= and_dcpl_293 AND and_dcpl_355;
  and_dcpl_358 <= (rem_12cyc_st_2_1_0(0)) AND main_stage_0_3 AND asn_itm_2;
  or_tmp_80 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_83_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_499_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_80));
  mux_33_nl <= MUX_s_1_2_2(nor_499_nl, or_tmp_80, or_83_cse);
  and_dcpl_360 <= mux_33_nl AND and_dcpl_358 AND and_dcpl_296;
  and_dcpl_362 <= (rem_12cyc_st_3_1_0(0)) AND main_stage_0_4 AND asn_itm_3;
  nand_276_cse <= NOT(asn_itm_2 AND main_stage_0_3 AND (rem_12cyc_st_2_1_0(0)));
  or_88_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1168_nl <= nand_276_cse AND or_tmp_80;
  mux_tmp_32 <= MUX_s_1_2_2(and_1168_nl, or_tmp_80, or_88_cse);
  nor_498_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_32));
  mux_35_nl <= MUX_s_1_2_2(nor_498_nl, mux_tmp_32, or_83_cse);
  and_dcpl_364 <= mux_35_nl AND and_dcpl_362 AND and_dcpl_302;
  and_dcpl_366 <= (rem_12cyc_st_4_1_0(0)) AND main_stage_0_5 AND asn_itm_4;
  nand_274_cse <= NOT(asn_itm_3 AND main_stage_0_4 AND (rem_12cyc_st_3_1_0(0)));
  or_93_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1166_nl <= nand_274_cse AND or_tmp_80;
  mux_tmp_34 <= MUX_s_1_2_2(and_1166_nl, or_tmp_80, or_93_cse);
  and_1167_nl <= nand_276_cse AND mux_tmp_34;
  mux_tmp_35 <= MUX_s_1_2_2(and_1167_nl, mux_tmp_34, or_88_cse);
  nor_497_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_35));
  mux_38_nl <= MUX_s_1_2_2(nor_497_nl, mux_tmp_35, or_83_cse);
  and_dcpl_368 <= mux_38_nl AND and_dcpl_366 AND and_dcpl_308;
  and_dcpl_370 <= (rem_12cyc_st_5_1_0(0)) AND main_stage_0_6 AND asn_itm_5;
  nand_271_cse <= NOT(asn_itm_4 AND main_stage_0_5 AND (rem_12cyc_st_4_1_0(0)));
  or_100_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1163_nl <= nand_271_cse AND or_tmp_80;
  mux_tmp_37 <= MUX_s_1_2_2(and_1163_nl, or_tmp_80, or_100_cse);
  and_1164_nl <= nand_274_cse AND mux_tmp_37;
  mux_tmp_38 <= MUX_s_1_2_2(and_1164_nl, mux_tmp_37, or_93_cse);
  and_1165_nl <= nand_276_cse AND mux_tmp_38;
  mux_tmp_39 <= MUX_s_1_2_2(and_1165_nl, mux_tmp_38, or_88_cse);
  nor_496_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_39));
  mux_42_nl <= MUX_s_1_2_2(nor_496_nl, mux_tmp_39, or_83_cse);
  and_dcpl_372 <= mux_42_nl AND and_dcpl_370 AND and_dcpl_314;
  nand_267_cse <= NOT(asn_itm_5 AND main_stage_0_6 AND (rem_12cyc_st_5_1_0(0)));
  or_109_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1159_nl <= nand_267_cse AND or_tmp_80;
  mux_tmp_41 <= MUX_s_1_2_2(and_1159_nl, or_tmp_80, or_109_cse);
  and_1160_nl <= nand_271_cse AND mux_tmp_41;
  mux_tmp_42 <= MUX_s_1_2_2(and_1160_nl, mux_tmp_41, or_100_cse);
  and_1161_nl <= nand_274_cse AND mux_tmp_42;
  mux_tmp_43 <= MUX_s_1_2_2(and_1161_nl, mux_tmp_42, or_93_cse);
  and_1162_nl <= nand_276_cse AND mux_tmp_43;
  mux_tmp_44 <= MUX_s_1_2_2(and_1162_nl, mux_tmp_43, or_88_cse);
  nor_495_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_44));
  mux_47_nl <= MUX_s_1_2_2(nor_495_nl, mux_tmp_44, or_83_cse);
  and_dcpl_376 <= mux_47_nl AND and_dcpl_112 AND and_dcpl_115;
  or_120_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_493_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_80));
  mux_tmp_46 <= MUX_s_1_2_2(nor_493_nl, or_tmp_80, or_120_cse);
  and_1155_nl <= nand_267_cse AND mux_tmp_46;
  mux_tmp_47 <= MUX_s_1_2_2(and_1155_nl, mux_tmp_46, or_109_cse);
  and_1156_nl <= nand_271_cse AND mux_tmp_47;
  mux_tmp_48 <= MUX_s_1_2_2(and_1156_nl, mux_tmp_47, or_100_cse);
  and_1157_nl <= nand_274_cse AND mux_tmp_48;
  mux_tmp_49 <= MUX_s_1_2_2(and_1157_nl, mux_tmp_48, or_93_cse);
  and_1158_nl <= nand_276_cse AND mux_tmp_49;
  mux_tmp_50 <= MUX_s_1_2_2(and_1158_nl, mux_tmp_49, or_88_cse);
  nor_494_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_50));
  mux_53_nl <= MUX_s_1_2_2(nor_494_nl, mux_tmp_50, or_83_cse);
  and_dcpl_379 <= mux_53_nl AND and_dcpl_85 AND and_dcpl_87;
  or_133_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_490_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_80));
  mux_tmp_52 <= MUX_s_1_2_2(nor_490_nl, or_tmp_80, or_133_cse);
  nor_491_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_52));
  mux_tmp_53 <= MUX_s_1_2_2(nor_491_nl, mux_tmp_52, or_120_cse);
  and_1151_nl <= nand_267_cse AND mux_tmp_53;
  mux_tmp_54 <= MUX_s_1_2_2(and_1151_nl, mux_tmp_53, or_109_cse);
  and_1152_nl <= nand_271_cse AND mux_tmp_54;
  mux_tmp_55 <= MUX_s_1_2_2(and_1152_nl, mux_tmp_54, or_100_cse);
  and_1153_nl <= nand_274_cse AND mux_tmp_55;
  mux_tmp_56 <= MUX_s_1_2_2(and_1153_nl, mux_tmp_55, or_93_cse);
  and_1154_nl <= nand_276_cse AND mux_tmp_56;
  mux_tmp_57 <= MUX_s_1_2_2(and_1154_nl, mux_tmp_56, or_88_cse);
  nor_492_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_57));
  mux_60_nl <= MUX_s_1_2_2(nor_492_nl, mux_tmp_57, or_83_cse);
  and_dcpl_382 <= mux_60_nl AND and_dcpl_58 AND and_dcpl_60;
  or_148_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_486_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_80));
  mux_tmp_59 <= MUX_s_1_2_2(nor_486_nl, or_tmp_80, or_148_cse);
  nor_487_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_59));
  mux_tmp_60 <= MUX_s_1_2_2(nor_487_nl, mux_tmp_59, or_133_cse);
  nor_488_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_60));
  mux_tmp_61 <= MUX_s_1_2_2(nor_488_nl, mux_tmp_60, or_120_cse);
  and_1147_nl <= nand_267_cse AND mux_tmp_61;
  mux_tmp_62 <= MUX_s_1_2_2(and_1147_nl, mux_tmp_61, or_109_cse);
  and_1148_nl <= nand_271_cse AND mux_tmp_62;
  mux_tmp_63 <= MUX_s_1_2_2(and_1148_nl, mux_tmp_62, or_100_cse);
  and_1149_nl <= nand_274_cse AND mux_tmp_63;
  mux_tmp_64 <= MUX_s_1_2_2(and_1149_nl, mux_tmp_63, or_93_cse);
  and_1150_nl <= nand_276_cse AND mux_tmp_64;
  mux_tmp_65 <= MUX_s_1_2_2(and_1150_nl, mux_tmp_64, or_88_cse);
  nor_489_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_65));
  mux_68_nl <= MUX_s_1_2_2(nor_489_nl, mux_tmp_65, or_83_cse);
  and_dcpl_385 <= mux_68_nl AND and_dcpl_31 AND and_dcpl_33;
  nor_481_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_80));
  or_165_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_67 <= MUX_s_1_2_2(nor_481_nl, or_tmp_80, or_165_nl);
  nor_482_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_67));
  mux_tmp_68 <= MUX_s_1_2_2(nor_482_nl, mux_tmp_67, or_148_cse);
  nor_483_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_68));
  mux_tmp_69 <= MUX_s_1_2_2(nor_483_nl, mux_tmp_68, or_133_cse);
  nor_484_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_69));
  mux_tmp_70 <= MUX_s_1_2_2(nor_484_nl, mux_tmp_69, or_120_cse);
  and_1143_nl <= nand_267_cse AND mux_tmp_70;
  mux_tmp_71 <= MUX_s_1_2_2(and_1143_nl, mux_tmp_70, or_109_cse);
  and_1144_nl <= nand_271_cse AND mux_tmp_71;
  mux_tmp_72 <= MUX_s_1_2_2(and_1144_nl, mux_tmp_71, or_100_cse);
  and_1145_nl <= nand_274_cse AND mux_tmp_72;
  mux_tmp_73 <= MUX_s_1_2_2(and_1145_nl, mux_tmp_72, or_93_cse);
  and_1146_nl <= nand_276_cse AND mux_tmp_73;
  mux_tmp_74 <= MUX_s_1_2_2(and_1146_nl, mux_tmp_73, or_88_cse);
  nor_485_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_74));
  mux_77_nl <= MUX_s_1_2_2(nor_485_nl, mux_tmp_74, or_83_cse);
  and_dcpl_388 <= mux_77_nl AND and_dcpl_4 AND and_dcpl_6;
  nand_250_cse <= NOT((acc_1_tmp(0)) AND ccs_ccore_start_rsci_idat);
  and_tmp_44 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR (acc_1_tmp(1)) OR nand_250_cse);
  nor_480_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT and_tmp_44));
  or_175_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_76 <= MUX_s_1_2_2(nor_480_nl, and_tmp_44, or_175_nl);
  and_dcpl_393 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("10"));
  and_dcpl_394 <= and_dcpl_293 AND and_dcpl_393;
  and_dcpl_395 <= and_dcpl_295 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_185 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_190_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_479_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_185));
  mux_79_nl <= MUX_s_1_2_2(nor_479_nl, or_tmp_185, or_190_cse);
  and_dcpl_397 <= mux_79_nl AND and_dcpl_298 AND and_dcpl_395;
  and_dcpl_398 <= and_dcpl_301 AND (rem_12cyc_st_3_1_0(1));
  or_195_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_45 <= or_195_cse AND or_tmp_185;
  nor_478_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_45));
  mux_80_nl <= MUX_s_1_2_2(nor_478_nl, and_tmp_45, or_190_cse);
  and_dcpl_400 <= mux_80_nl AND and_dcpl_304 AND and_dcpl_398;
  and_dcpl_401 <= and_dcpl_307 AND (rem_12cyc_st_4_1_0(1));
  or_199_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_47 <= or_195_cse AND or_199_cse AND or_tmp_185;
  nor_477_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_47));
  mux_81_nl <= MUX_s_1_2_2(nor_477_nl, and_tmp_47, or_190_cse);
  and_dcpl_403 <= mux_81_nl AND and_dcpl_310 AND and_dcpl_401;
  and_dcpl_404 <= and_dcpl_313 AND (rem_12cyc_st_5_1_0(1));
  or_204_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_50 <= or_195_cse AND or_199_cse AND or_204_cse AND or_tmp_185;
  nor_476_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_50));
  mux_82_nl <= MUX_s_1_2_2(nor_476_nl, and_tmp_50, or_190_cse);
  and_dcpl_406 <= mux_82_nl AND and_dcpl_316 AND and_dcpl_404;
  or_210_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_54 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND or_tmp_185;
  nor_475_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_54));
  mux_83_nl <= MUX_s_1_2_2(nor_475_nl, and_tmp_54, or_190_cse);
  and_dcpl_409 <= mux_83_nl AND and_dcpl_112 AND and_dcpl_117;
  or_217_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_473_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_185));
  mux_84_nl <= MUX_s_1_2_2(nor_473_nl, or_tmp_185, or_217_cse);
  and_tmp_58 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_84_nl;
  nor_474_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_58));
  mux_85_nl <= MUX_s_1_2_2(nor_474_nl, and_tmp_58, or_190_cse);
  and_dcpl_413 <= mux_85_nl AND and_dcpl_85 AND and_dcpl_90;
  or_226_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_470_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_185));
  mux_tmp_84 <= MUX_s_1_2_2(nor_470_nl, or_tmp_185, or_226_cse);
  nor_471_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_84));
  mux_87_nl <= MUX_s_1_2_2(nor_471_nl, mux_tmp_84, or_217_cse);
  and_tmp_62 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_87_nl;
  nor_472_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_62));
  mux_88_nl <= MUX_s_1_2_2(nor_472_nl, and_tmp_62, or_190_cse);
  and_dcpl_417 <= mux_88_nl AND and_dcpl_58 AND and_dcpl_63;
  or_237_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_466_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_185));
  mux_tmp_87 <= MUX_s_1_2_2(nor_466_nl, or_tmp_185, or_237_cse);
  nor_467_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_87));
  mux_tmp_88 <= MUX_s_1_2_2(nor_467_nl, mux_tmp_87, or_226_cse);
  nor_468_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_88));
  mux_91_nl <= MUX_s_1_2_2(nor_468_nl, mux_tmp_88, or_217_cse);
  and_tmp_66 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_91_nl;
  nor_469_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_66));
  mux_92_nl <= MUX_s_1_2_2(nor_469_nl, and_tmp_66, or_190_cse);
  and_dcpl_421 <= mux_92_nl AND and_dcpl_31 AND and_dcpl_36;
  nor_461_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_185));
  or_250_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_91 <= MUX_s_1_2_2(nor_461_nl, or_tmp_185, or_250_nl);
  nor_462_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_91));
  mux_tmp_92 <= MUX_s_1_2_2(nor_462_nl, mux_tmp_91, or_237_cse);
  nor_463_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_92));
  mux_tmp_93 <= MUX_s_1_2_2(nor_463_nl, mux_tmp_92, or_226_cse);
  nor_464_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_93));
  mux_96_nl <= MUX_s_1_2_2(nor_464_nl, mux_tmp_93, or_217_cse);
  and_tmp_70 <= or_195_cse AND or_199_cse AND or_204_cse AND or_210_cse AND mux_96_nl;
  nor_465_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_70));
  mux_97_nl <= MUX_s_1_2_2(nor_465_nl, and_tmp_70, or_190_cse);
  and_dcpl_425 <= mux_97_nl AND and_dcpl_4 AND and_dcpl_9;
  and_tmp_80 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND or_195_cse
      AND or_199_cse AND or_204_cse AND or_210_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_430 <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"));
  and_dcpl_431 <= and_dcpl_293 AND and_dcpl_430;
  or_tmp_263 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"))
      OR not_tmp_54;
  or_270_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"));
  nor_460_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_263));
  mux_98_nl <= MUX_s_1_2_2(nor_460_nl, or_tmp_263, or_270_cse);
  and_dcpl_433 <= mux_98_nl AND and_dcpl_358 AND and_dcpl_395;
  or_275_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1142_nl <= nand_276_cse AND or_tmp_263;
  mux_tmp_97 <= MUX_s_1_2_2(and_1142_nl, or_tmp_263, or_275_cse);
  nor_459_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_97));
  mux_100_nl <= MUX_s_1_2_2(nor_459_nl, mux_tmp_97, or_270_cse);
  and_dcpl_435 <= mux_100_nl AND and_dcpl_362 AND and_dcpl_398;
  or_280_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1140_nl <= nand_274_cse AND or_tmp_263;
  mux_tmp_99 <= MUX_s_1_2_2(and_1140_nl, or_tmp_263, or_280_cse);
  and_1141_nl <= nand_276_cse AND mux_tmp_99;
  mux_tmp_100 <= MUX_s_1_2_2(and_1141_nl, mux_tmp_99, or_275_cse);
  nor_458_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_100));
  mux_103_nl <= MUX_s_1_2_2(nor_458_nl, mux_tmp_100, or_270_cse);
  and_dcpl_437 <= mux_103_nl AND and_dcpl_366 AND and_dcpl_401;
  or_287_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1137_nl <= nand_271_cse AND or_tmp_263;
  mux_tmp_102 <= MUX_s_1_2_2(and_1137_nl, or_tmp_263, or_287_cse);
  and_1138_nl <= nand_274_cse AND mux_tmp_102;
  mux_tmp_103 <= MUX_s_1_2_2(and_1138_nl, mux_tmp_102, or_280_cse);
  and_1139_nl <= nand_276_cse AND mux_tmp_103;
  mux_tmp_104 <= MUX_s_1_2_2(and_1139_nl, mux_tmp_103, or_275_cse);
  nor_457_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_104));
  mux_107_nl <= MUX_s_1_2_2(nor_457_nl, mux_tmp_104, or_270_cse);
  and_dcpl_439 <= mux_107_nl AND and_dcpl_370 AND and_dcpl_404;
  or_296_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"));
  and_1133_nl <= nand_267_cse AND or_tmp_263;
  mux_tmp_106 <= MUX_s_1_2_2(and_1133_nl, or_tmp_263, or_296_cse);
  and_1134_nl <= nand_271_cse AND mux_tmp_106;
  mux_tmp_107 <= MUX_s_1_2_2(and_1134_nl, mux_tmp_106, or_287_cse);
  and_1135_nl <= nand_274_cse AND mux_tmp_107;
  mux_tmp_108 <= MUX_s_1_2_2(and_1135_nl, mux_tmp_107, or_280_cse);
  and_1136_nl <= nand_276_cse AND mux_tmp_108;
  mux_tmp_109 <= MUX_s_1_2_2(and_1136_nl, mux_tmp_108, or_275_cse);
  nor_456_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_109));
  mux_112_nl <= MUX_s_1_2_2(nor_456_nl, mux_tmp_109, or_270_cse);
  and_dcpl_442 <= mux_112_nl AND and_dcpl_112 AND and_dcpl_119;
  or_307_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_454_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_263));
  mux_tmp_111 <= MUX_s_1_2_2(nor_454_nl, or_tmp_263, or_307_cse);
  and_1129_nl <= nand_267_cse AND mux_tmp_111;
  mux_tmp_112 <= MUX_s_1_2_2(and_1129_nl, mux_tmp_111, or_296_cse);
  and_1130_nl <= nand_271_cse AND mux_tmp_112;
  mux_tmp_113 <= MUX_s_1_2_2(and_1130_nl, mux_tmp_112, or_287_cse);
  and_1131_nl <= nand_274_cse AND mux_tmp_113;
  mux_tmp_114 <= MUX_s_1_2_2(and_1131_nl, mux_tmp_113, or_280_cse);
  and_1132_nl <= nand_276_cse AND mux_tmp_114;
  mux_tmp_115 <= MUX_s_1_2_2(and_1132_nl, mux_tmp_114, or_275_cse);
  nor_455_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_115));
  mux_118_nl <= MUX_s_1_2_2(nor_455_nl, mux_tmp_115, or_270_cse);
  and_dcpl_445 <= mux_118_nl AND and_dcpl_85 AND and_dcpl_92;
  or_320_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_451_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_263));
  mux_tmp_117 <= MUX_s_1_2_2(nor_451_nl, or_tmp_263, or_320_cse);
  nor_452_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_117));
  mux_tmp_118 <= MUX_s_1_2_2(nor_452_nl, mux_tmp_117, or_307_cse);
  and_1125_nl <= nand_267_cse AND mux_tmp_118;
  mux_tmp_119 <= MUX_s_1_2_2(and_1125_nl, mux_tmp_118, or_296_cse);
  and_1126_nl <= nand_271_cse AND mux_tmp_119;
  mux_tmp_120 <= MUX_s_1_2_2(and_1126_nl, mux_tmp_119, or_287_cse);
  and_1127_nl <= nand_274_cse AND mux_tmp_120;
  mux_tmp_121 <= MUX_s_1_2_2(and_1127_nl, mux_tmp_120, or_280_cse);
  and_1128_nl <= nand_276_cse AND mux_tmp_121;
  mux_tmp_122 <= MUX_s_1_2_2(and_1128_nl, mux_tmp_121, or_275_cse);
  nor_453_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_122));
  mux_125_nl <= MUX_s_1_2_2(nor_453_nl, mux_tmp_122, or_270_cse);
  and_dcpl_448 <= mux_125_nl AND and_dcpl_58 AND and_dcpl_65;
  or_335_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"));
  nor_447_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_263));
  mux_tmp_124 <= MUX_s_1_2_2(nor_447_nl, or_tmp_263, or_335_cse);
  nor_448_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_124));
  mux_tmp_125 <= MUX_s_1_2_2(nor_448_nl, mux_tmp_124, or_320_cse);
  nor_449_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_125));
  mux_tmp_126 <= MUX_s_1_2_2(nor_449_nl, mux_tmp_125, or_307_cse);
  and_1121_nl <= nand_267_cse AND mux_tmp_126;
  mux_tmp_127 <= MUX_s_1_2_2(and_1121_nl, mux_tmp_126, or_296_cse);
  and_1122_nl <= nand_271_cse AND mux_tmp_127;
  mux_tmp_128 <= MUX_s_1_2_2(and_1122_nl, mux_tmp_127, or_287_cse);
  and_1123_nl <= nand_274_cse AND mux_tmp_128;
  mux_tmp_129 <= MUX_s_1_2_2(and_1123_nl, mux_tmp_128, or_280_cse);
  and_1124_nl <= nand_276_cse AND mux_tmp_129;
  mux_tmp_130 <= MUX_s_1_2_2(and_1124_nl, mux_tmp_129, or_275_cse);
  nor_450_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_130));
  mux_133_nl <= MUX_s_1_2_2(nor_450_nl, mux_tmp_130, or_270_cse);
  and_dcpl_451 <= mux_133_nl AND and_dcpl_31 AND and_dcpl_38;
  nor_442_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_263));
  or_352_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_132 <= MUX_s_1_2_2(nor_442_nl, or_tmp_263, or_352_nl);
  nor_443_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_132));
  mux_tmp_133 <= MUX_s_1_2_2(nor_443_nl, mux_tmp_132, or_335_cse);
  nor_444_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_133));
  mux_tmp_134 <= MUX_s_1_2_2(nor_444_nl, mux_tmp_133, or_320_cse);
  nor_445_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_134));
  mux_tmp_135 <= MUX_s_1_2_2(nor_445_nl, mux_tmp_134, or_307_cse);
  and_1117_nl <= nand_267_cse AND mux_tmp_135;
  mux_tmp_136 <= MUX_s_1_2_2(and_1117_nl, mux_tmp_135, or_296_cse);
  and_1118_nl <= nand_271_cse AND mux_tmp_136;
  mux_tmp_137 <= MUX_s_1_2_2(and_1118_nl, mux_tmp_136, or_287_cse);
  and_1119_nl <= nand_274_cse AND mux_tmp_137;
  mux_tmp_138 <= MUX_s_1_2_2(and_1119_nl, mux_tmp_137, or_280_cse);
  and_1120_nl <= nand_276_cse AND mux_tmp_138;
  mux_tmp_139 <= MUX_s_1_2_2(and_1120_nl, mux_tmp_138, or_275_cse);
  nor_446_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_139));
  mux_142_nl <= MUX_s_1_2_2(nor_446_nl, mux_tmp_139, or_270_cse);
  and_dcpl_454 <= mux_142_nl AND and_dcpl_4 AND and_dcpl_11;
  nand_222_cse <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat);
  and_tmp_89 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("11"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("00"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("00"))
      OR nand_222_cse);
  nand_223_cse <= NOT(CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11")));
  and_1116_nl <= nand_223_cse AND and_tmp_89;
  or_362_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("00"));
  mux_tmp_141 <= MUX_s_1_2_2(and_1116_nl, and_tmp_89, or_362_nl);
  and_dcpl_460 <= ccs_ccore_start_rsci_idat AND CONV_SL_1_1(acc_tmp=STD_LOGIC_VECTOR'("01"));
  and_dcpl_461 <= and_dcpl_460 AND and_dcpl_291;
  and_dcpl_462 <= CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_463 <= and_dcpl_462 AND (NOT (rem_12cyc_st_2_1_0(1)));
  not_tmp_332 <= NOT((rem_12cyc_3_2(0)) AND asn_itm_1 AND main_stage_0_2);
  or_tmp_368 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  nand_281_cse <= NOT((acc_tmp(0)) AND ccs_ccore_start_rsci_idat);
  or_377_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (acc_tmp(1));
  and_1172_nl <= nand_281_cse AND or_tmp_368;
  mux_144_nl <= MUX_s_1_2_2(and_1172_nl, or_tmp_368, or_377_cse);
  and_dcpl_465 <= mux_144_nl AND and_dcpl_298 AND and_dcpl_463;
  and_dcpl_466 <= CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_467 <= and_dcpl_466 AND (NOT (rem_12cyc_st_3_1_0(1)));
  or_382_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_90 <= or_382_cse AND or_tmp_368;
  and_1114_nl <= nand_281_cse AND and_tmp_90;
  mux_145_nl <= MUX_s_1_2_2(and_1114_nl, and_tmp_90, or_377_cse);
  and_dcpl_469 <= mux_145_nl AND and_dcpl_304 AND and_dcpl_467;
  and_dcpl_470 <= CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_471 <= and_dcpl_470 AND (NOT (rem_12cyc_st_4_1_0(1)));
  or_386_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_92 <= or_382_cse AND or_386_cse AND or_tmp_368;
  and_1113_nl <= nand_281_cse AND and_tmp_92;
  mux_146_nl <= MUX_s_1_2_2(and_1113_nl, and_tmp_92, or_377_cse);
  and_dcpl_473 <= mux_146_nl AND and_dcpl_310 AND and_dcpl_471;
  and_dcpl_474 <= CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("01"));
  and_dcpl_475 <= and_dcpl_474 AND (NOT (rem_12cyc_st_5_1_0(1)));
  or_391_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_95 <= or_382_cse AND or_386_cse AND or_391_cse AND or_tmp_368;
  and_1112_nl <= nand_281_cse AND and_tmp_95;
  mux_147_nl <= MUX_s_1_2_2(and_1112_nl, and_tmp_95, or_377_cse);
  and_dcpl_477 <= mux_147_nl AND and_dcpl_316 AND and_dcpl_475;
  or_397_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_99 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND or_tmp_368;
  and_1111_nl <= nand_281_cse AND and_tmp_99;
  mux_148_nl <= MUX_s_1_2_2(and_1111_nl, and_tmp_99, or_377_cse);
  and_dcpl_480 <= mux_148_nl AND and_dcpl_121 AND and_dcpl_110;
  nand_215_cse <= NOT((rem_12cyc_st_6_3_2(0)) AND asn_itm_6 AND main_stage_0_7);
  or_404_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_6_3_2(1));
  and_1109_nl <= nand_215_cse AND or_tmp_368;
  mux_149_nl <= MUX_s_1_2_2(and_1109_nl, or_tmp_368, or_404_cse);
  and_tmp_103 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_149_nl;
  and_1110_nl <= nand_281_cse AND and_tmp_103;
  mux_150_nl <= MUX_s_1_2_2(and_1110_nl, and_tmp_103, or_377_cse);
  and_dcpl_483 <= mux_150_nl AND and_dcpl_94 AND and_dcpl_83;
  nand_212_cse <= NOT((rem_12cyc_st_7_3_2(0)) AND asn_itm_7 AND main_stage_0_8);
  or_413_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_7_3_2(1));
  and_1106_nl <= nand_212_cse AND or_tmp_368;
  mux_tmp_149 <= MUX_s_1_2_2(and_1106_nl, or_tmp_368, or_413_cse);
  and_1107_nl <= nand_215_cse AND mux_tmp_149;
  mux_152_nl <= MUX_s_1_2_2(and_1107_nl, mux_tmp_149, or_404_cse);
  and_tmp_107 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_152_nl;
  and_1108_nl <= nand_281_cse AND and_tmp_107;
  mux_153_nl <= MUX_s_1_2_2(and_1108_nl, and_tmp_107, or_377_cse);
  and_dcpl_486 <= mux_153_nl AND and_dcpl_67 AND and_dcpl_56;
  nand_208_cse <= NOT((rem_12cyc_st_8_3_2(0)) AND asn_itm_8 AND main_stage_0_9);
  or_424_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_8_3_2(1));
  and_1102_nl <= nand_208_cse AND or_tmp_368;
  mux_tmp_152 <= MUX_s_1_2_2(and_1102_nl, or_tmp_368, or_424_cse);
  and_1103_nl <= nand_212_cse AND mux_tmp_152;
  mux_tmp_153 <= MUX_s_1_2_2(and_1103_nl, mux_tmp_152, or_413_cse);
  and_1104_nl <= nand_215_cse AND mux_tmp_153;
  mux_156_nl <= MUX_s_1_2_2(and_1104_nl, mux_tmp_153, or_404_cse);
  and_tmp_111 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_156_nl;
  and_1105_nl <= nand_281_cse AND and_tmp_111;
  mux_157_nl <= MUX_s_1_2_2(and_1105_nl, and_tmp_111, or_377_cse);
  and_dcpl_489 <= mux_157_nl AND and_dcpl_40 AND and_dcpl_29;
  nand_203_cse <= NOT((rem_12cyc_st_9_3_2(0)) AND asn_itm_9 AND main_stage_0_10);
  and_1097_nl <= nand_203_cse AND or_tmp_368;
  or_437_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_156 <= MUX_s_1_2_2(and_1097_nl, or_tmp_368, or_437_nl);
  and_1098_nl <= nand_208_cse AND mux_tmp_156;
  mux_tmp_157 <= MUX_s_1_2_2(and_1098_nl, mux_tmp_156, or_424_cse);
  and_1099_nl <= nand_212_cse AND mux_tmp_157;
  mux_tmp_158 <= MUX_s_1_2_2(and_1099_nl, mux_tmp_157, or_413_cse);
  and_1100_nl <= nand_215_cse AND mux_tmp_158;
  mux_161_nl <= MUX_s_1_2_2(and_1100_nl, mux_tmp_158, or_404_cse);
  and_tmp_115 <= or_382_cse AND or_386_cse AND or_391_cse AND or_397_cse AND mux_161_nl;
  and_1101_nl <= nand_281_cse AND and_tmp_115;
  mux_162_nl <= MUX_s_1_2_2(and_1101_nl, and_tmp_115, or_377_cse);
  and_dcpl_492 <= mux_162_nl AND and_dcpl_13 AND and_dcpl_2;
  and_tmp_125 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND or_382_cse
      AND or_386_cse AND or_391_cse AND or_397_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_498 <= and_dcpl_460 AND and_dcpl_355;
  or_tmp_446 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_458_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR (acc_tmp(1));
  and_1171_nl <= nand_281_cse AND or_tmp_446;
  mux_163_nl <= MUX_s_1_2_2(and_1171_nl, or_tmp_446, or_458_cse);
  and_dcpl_500 <= mux_163_nl AND and_dcpl_358 AND and_dcpl_463;
  or_463_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1094_nl <= nand_276_cse AND or_tmp_446;
  mux_tmp_162 <= MUX_s_1_2_2(and_1094_nl, or_tmp_446, or_463_cse);
  and_1095_nl <= nand_281_cse AND mux_tmp_162;
  mux_165_nl <= MUX_s_1_2_2(and_1095_nl, mux_tmp_162, or_458_cse);
  and_dcpl_502 <= mux_165_nl AND and_dcpl_362 AND and_dcpl_467;
  nand_198_cse <= NOT((rem_12cyc_st_3_3_2(0)) AND asn_itm_3 AND main_stage_0_4 AND
      (rem_12cyc_st_3_1_0(0)));
  or_468_cse <= (rem_12cyc_st_3_1_0(1)) OR (rem_12cyc_st_3_3_2(1));
  and_1091_nl <= nand_198_cse AND or_tmp_446;
  mux_tmp_164 <= MUX_s_1_2_2(and_1091_nl, or_tmp_446, or_468_cse);
  and_1092_nl <= nand_276_cse AND mux_tmp_164;
  mux_tmp_165 <= MUX_s_1_2_2(and_1092_nl, mux_tmp_164, or_463_cse);
  and_1093_nl <= nand_281_cse AND mux_tmp_165;
  mux_168_nl <= MUX_s_1_2_2(and_1093_nl, mux_tmp_165, or_458_cse);
  and_dcpl_504 <= mux_168_nl AND and_dcpl_366 AND and_dcpl_471;
  or_475_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1087_nl <= nand_271_cse AND or_tmp_446;
  mux_tmp_167 <= MUX_s_1_2_2(and_1087_nl, or_tmp_446, or_475_cse);
  and_1088_nl <= nand_198_cse AND mux_tmp_167;
  mux_tmp_168 <= MUX_s_1_2_2(and_1088_nl, mux_tmp_167, or_468_cse);
  and_1089_nl <= nand_276_cse AND mux_tmp_168;
  mux_tmp_169 <= MUX_s_1_2_2(and_1089_nl, mux_tmp_168, or_463_cse);
  and_1090_nl <= nand_281_cse AND mux_tmp_169;
  mux_172_nl <= MUX_s_1_2_2(and_1090_nl, mux_tmp_169, or_458_cse);
  and_dcpl_506 <= mux_172_nl AND and_dcpl_370 AND and_dcpl_475;
  nand_189_cse <= NOT((rem_12cyc_st_5_3_2(0)) AND asn_itm_5 AND main_stage_0_6 AND
      (rem_12cyc_st_5_1_0(0)));
  or_484_cse <= (rem_12cyc_st_5_1_0(1)) OR (rem_12cyc_st_5_3_2(1));
  and_1082_nl <= nand_189_cse AND or_tmp_446;
  mux_tmp_171 <= MUX_s_1_2_2(and_1082_nl, or_tmp_446, or_484_cse);
  and_1083_nl <= nand_271_cse AND mux_tmp_171;
  mux_tmp_172 <= MUX_s_1_2_2(and_1083_nl, mux_tmp_171, or_475_cse);
  and_1084_nl <= nand_198_cse AND mux_tmp_172;
  mux_tmp_173 <= MUX_s_1_2_2(and_1084_nl, mux_tmp_172, or_468_cse);
  and_1085_nl <= nand_276_cse AND mux_tmp_173;
  mux_tmp_174 <= MUX_s_1_2_2(and_1085_nl, mux_tmp_173, or_463_cse);
  and_1086_nl <= nand_281_cse AND mux_tmp_174;
  mux_177_nl <= MUX_s_1_2_2(and_1086_nl, mux_tmp_174, or_458_cse);
  and_dcpl_508 <= mux_177_nl AND and_dcpl_121 AND and_dcpl_115;
  or_495_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_6_3_2(1));
  and_1076_nl <= nand_215_cse AND or_tmp_446;
  mux_tmp_176 <= MUX_s_1_2_2(and_1076_nl, or_tmp_446, or_495_cse);
  and_1077_nl <= nand_189_cse AND mux_tmp_176;
  mux_tmp_177 <= MUX_s_1_2_2(and_1077_nl, mux_tmp_176, or_484_cse);
  and_1078_nl <= nand_271_cse AND mux_tmp_177;
  mux_tmp_178 <= MUX_s_1_2_2(and_1078_nl, mux_tmp_177, or_475_cse);
  and_1079_nl <= nand_198_cse AND mux_tmp_178;
  mux_tmp_179 <= MUX_s_1_2_2(and_1079_nl, mux_tmp_178, or_468_cse);
  and_1080_nl <= nand_276_cse AND mux_tmp_179;
  mux_tmp_180 <= MUX_s_1_2_2(and_1080_nl, mux_tmp_179, or_463_cse);
  and_1081_nl <= nand_281_cse AND mux_tmp_180;
  mux_183_nl <= MUX_s_1_2_2(and_1081_nl, mux_tmp_180, or_458_cse);
  and_dcpl_510 <= mux_183_nl AND and_dcpl_94 AND and_dcpl_87;
  or_508_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_7_3_2(1));
  and_1069_nl <= nand_212_cse AND or_tmp_446;
  mux_tmp_182 <= MUX_s_1_2_2(and_1069_nl, or_tmp_446, or_508_cse);
  and_1070_nl <= nand_215_cse AND mux_tmp_182;
  mux_tmp_183 <= MUX_s_1_2_2(and_1070_nl, mux_tmp_182, or_495_cse);
  and_1071_nl <= nand_189_cse AND mux_tmp_183;
  mux_tmp_184 <= MUX_s_1_2_2(and_1071_nl, mux_tmp_183, or_484_cse);
  and_1072_nl <= nand_271_cse AND mux_tmp_184;
  mux_tmp_185 <= MUX_s_1_2_2(and_1072_nl, mux_tmp_184, or_475_cse);
  and_1073_nl <= nand_198_cse AND mux_tmp_185;
  mux_tmp_186 <= MUX_s_1_2_2(and_1073_nl, mux_tmp_185, or_468_cse);
  and_1074_nl <= nand_276_cse AND mux_tmp_186;
  mux_tmp_187 <= MUX_s_1_2_2(and_1074_nl, mux_tmp_186, or_463_cse);
  and_1075_nl <= nand_281_cse AND mux_tmp_187;
  mux_190_nl <= MUX_s_1_2_2(and_1075_nl, mux_tmp_187, or_458_cse);
  and_dcpl_512 <= mux_190_nl AND and_dcpl_67 AND and_dcpl_60;
  or_523_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_8_3_2(1));
  and_1061_nl <= nand_208_cse AND or_tmp_446;
  mux_tmp_189 <= MUX_s_1_2_2(and_1061_nl, or_tmp_446, or_523_cse);
  and_1062_nl <= nand_212_cse AND mux_tmp_189;
  mux_tmp_190 <= MUX_s_1_2_2(and_1062_nl, mux_tmp_189, or_508_cse);
  and_1063_nl <= nand_215_cse AND mux_tmp_190;
  mux_tmp_191 <= MUX_s_1_2_2(and_1063_nl, mux_tmp_190, or_495_cse);
  and_1064_nl <= nand_189_cse AND mux_tmp_191;
  mux_tmp_192 <= MUX_s_1_2_2(and_1064_nl, mux_tmp_191, or_484_cse);
  and_1065_nl <= nand_271_cse AND mux_tmp_192;
  mux_tmp_193 <= MUX_s_1_2_2(and_1065_nl, mux_tmp_192, or_475_cse);
  and_1066_nl <= nand_198_cse AND mux_tmp_193;
  mux_tmp_194 <= MUX_s_1_2_2(and_1066_nl, mux_tmp_193, or_468_cse);
  and_1067_nl <= nand_276_cse AND mux_tmp_194;
  mux_tmp_195 <= MUX_s_1_2_2(and_1067_nl, mux_tmp_194, or_463_cse);
  and_1068_nl <= nand_281_cse AND mux_tmp_195;
  mux_198_nl <= MUX_s_1_2_2(and_1068_nl, mux_tmp_195, or_458_cse);
  and_dcpl_514 <= mux_198_nl AND and_dcpl_40 AND and_dcpl_33;
  and_1052_nl <= nand_203_cse AND or_tmp_446;
  or_540_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_197 <= MUX_s_1_2_2(and_1052_nl, or_tmp_446, or_540_nl);
  and_1053_nl <= nand_208_cse AND mux_tmp_197;
  mux_tmp_198 <= MUX_s_1_2_2(and_1053_nl, mux_tmp_197, or_523_cse);
  and_1054_nl <= nand_212_cse AND mux_tmp_198;
  mux_tmp_199 <= MUX_s_1_2_2(and_1054_nl, mux_tmp_198, or_508_cse);
  and_1055_nl <= nand_215_cse AND mux_tmp_199;
  mux_tmp_200 <= MUX_s_1_2_2(and_1055_nl, mux_tmp_199, or_495_cse);
  and_1056_nl <= nand_189_cse AND mux_tmp_200;
  mux_tmp_201 <= MUX_s_1_2_2(and_1056_nl, mux_tmp_200, or_484_cse);
  and_1057_nl <= nand_271_cse AND mux_tmp_201;
  mux_tmp_202 <= MUX_s_1_2_2(and_1057_nl, mux_tmp_201, or_475_cse);
  and_1058_nl <= nand_198_cse AND mux_tmp_202;
  mux_tmp_203 <= MUX_s_1_2_2(and_1058_nl, mux_tmp_202, or_468_cse);
  and_1059_nl <= nand_276_cse AND mux_tmp_203;
  mux_tmp_204 <= MUX_s_1_2_2(and_1059_nl, mux_tmp_203, or_463_cse);
  and_1060_nl <= nand_281_cse AND mux_tmp_204;
  mux_207_nl <= MUX_s_1_2_2(and_1060_nl, mux_tmp_204, or_458_cse);
  and_dcpl_516 <= mux_207_nl AND and_dcpl_13 AND and_dcpl_6;
  and_tmp_134 <= ((NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_3)
      OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_4)
      OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_5)
      OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_6)
      OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_7)
      OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_11)
      OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR (acc_1_tmp(1)) OR nand_250_cse);
  nor_439_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT and_tmp_134));
  or_550_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_206 <= MUX_s_1_2_2(nor_439_nl, and_tmp_134, or_550_nl);
  and_dcpl_520 <= and_dcpl_460 AND and_dcpl_393;
  and_dcpl_521 <= and_dcpl_462 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_551 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_564_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (acc_tmp(1));
  and_1170_nl <= nand_281_cse AND or_tmp_551;
  mux_209_nl <= MUX_s_1_2_2(and_1170_nl, or_tmp_551, or_564_cse);
  and_dcpl_523 <= mux_209_nl AND and_dcpl_298 AND and_dcpl_521;
  and_dcpl_524 <= and_dcpl_466 AND (rem_12cyc_st_3_1_0(1));
  or_569_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_135 <= or_569_cse AND or_tmp_551;
  and_1050_nl <= nand_281_cse AND and_tmp_135;
  mux_210_nl <= MUX_s_1_2_2(and_1050_nl, and_tmp_135, or_564_cse);
  and_dcpl_526 <= mux_210_nl AND and_dcpl_304 AND and_dcpl_524;
  and_dcpl_527 <= and_dcpl_470 AND (rem_12cyc_st_4_1_0(1));
  or_573_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_137 <= or_569_cse AND or_573_cse AND or_tmp_551;
  and_1049_nl <= nand_281_cse AND and_tmp_137;
  mux_211_nl <= MUX_s_1_2_2(and_1049_nl, and_tmp_137, or_564_cse);
  and_dcpl_529 <= mux_211_nl AND and_dcpl_310 AND and_dcpl_527;
  and_dcpl_530 <= and_dcpl_474 AND (rem_12cyc_st_5_1_0(1));
  or_578_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_140 <= or_569_cse AND or_573_cse AND or_578_cse AND or_tmp_551;
  and_1048_nl <= nand_281_cse AND and_tmp_140;
  mux_212_nl <= MUX_s_1_2_2(and_1048_nl, and_tmp_140, or_564_cse);
  and_dcpl_532 <= mux_212_nl AND and_dcpl_316 AND and_dcpl_530;
  or_584_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("01"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_144 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND or_tmp_551;
  and_1047_nl <= nand_281_cse AND and_tmp_144;
  mux_213_nl <= MUX_s_1_2_2(and_1047_nl, and_tmp_144, or_564_cse);
  and_dcpl_534 <= mux_213_nl AND and_dcpl_121 AND and_dcpl_117;
  or_591_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_6_3_2(1));
  and_1045_nl <= nand_215_cse AND or_tmp_551;
  mux_214_nl <= MUX_s_1_2_2(and_1045_nl, or_tmp_551, or_591_cse);
  and_tmp_148 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_214_nl;
  and_1046_nl <= nand_281_cse AND and_tmp_148;
  mux_215_nl <= MUX_s_1_2_2(and_1046_nl, and_tmp_148, or_564_cse);
  and_dcpl_536 <= mux_215_nl AND and_dcpl_94 AND and_dcpl_90;
  or_600_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_7_3_2(1));
  and_1042_nl <= nand_212_cse AND or_tmp_551;
  mux_tmp_214 <= MUX_s_1_2_2(and_1042_nl, or_tmp_551, or_600_cse);
  and_1043_nl <= nand_215_cse AND mux_tmp_214;
  mux_217_nl <= MUX_s_1_2_2(and_1043_nl, mux_tmp_214, or_591_cse);
  and_tmp_152 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_217_nl;
  and_1044_nl <= nand_281_cse AND and_tmp_152;
  mux_218_nl <= MUX_s_1_2_2(and_1044_nl, and_tmp_152, or_564_cse);
  and_dcpl_538 <= mux_218_nl AND and_dcpl_67 AND and_dcpl_63;
  or_611_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_8_3_2(1));
  and_1038_nl <= nand_208_cse AND or_tmp_551;
  mux_tmp_217 <= MUX_s_1_2_2(and_1038_nl, or_tmp_551, or_611_cse);
  and_1039_nl <= nand_212_cse AND mux_tmp_217;
  mux_tmp_218 <= MUX_s_1_2_2(and_1039_nl, mux_tmp_217, or_600_cse);
  and_1040_nl <= nand_215_cse AND mux_tmp_218;
  mux_221_nl <= MUX_s_1_2_2(and_1040_nl, mux_tmp_218, or_591_cse);
  and_tmp_156 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_221_nl;
  and_1041_nl <= nand_281_cse AND and_tmp_156;
  mux_222_nl <= MUX_s_1_2_2(and_1041_nl, and_tmp_156, or_564_cse);
  and_dcpl_540 <= mux_222_nl AND and_dcpl_40 AND and_dcpl_36;
  and_1033_nl <= nand_203_cse AND or_tmp_551;
  or_624_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_221 <= MUX_s_1_2_2(and_1033_nl, or_tmp_551, or_624_nl);
  and_1034_nl <= nand_208_cse AND mux_tmp_221;
  mux_tmp_222 <= MUX_s_1_2_2(and_1034_nl, mux_tmp_221, or_611_cse);
  and_1035_nl <= nand_212_cse AND mux_tmp_222;
  mux_tmp_223 <= MUX_s_1_2_2(and_1035_nl, mux_tmp_222, or_600_cse);
  and_1036_nl <= nand_215_cse AND mux_tmp_223;
  mux_226_nl <= MUX_s_1_2_2(and_1036_nl, mux_tmp_223, or_591_cse);
  and_tmp_160 <= or_569_cse AND or_573_cse AND or_578_cse AND or_584_cse AND mux_226_nl;
  and_1037_nl <= nand_281_cse AND and_tmp_160;
  mux_227_nl <= MUX_s_1_2_2(and_1037_nl, and_tmp_160, or_564_cse);
  and_dcpl_542 <= mux_227_nl AND and_dcpl_13 AND and_dcpl_9;
  and_tmp_170 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND ((NOT main_stage_0_8)
      OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_9)
      OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("01"))) AND ((NOT main_stage_0_10)
      OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("01"))) AND or_569_cse
      AND or_573_cse AND or_578_cse AND or_584_cse AND ((NOT main_stage_0_7) OR (NOT
      asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("01")))
      AND ((NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_st_10_3_2/=STD_LOGIC_VECTOR'("01"))) AND (CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("01"))
      OR CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat));
  and_dcpl_546 <= and_dcpl_460 AND and_dcpl_430;
  or_tmp_629 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_3_2(1))
      OR not_tmp_332;
  or_643_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("11")) OR (acc_tmp(1));
  and_1169_nl <= nand_281_cse AND or_tmp_629;
  mux_228_nl <= MUX_s_1_2_2(and_1169_nl, or_tmp_629, or_643_cse);
  and_dcpl_548 <= mux_228_nl AND and_dcpl_358 AND and_dcpl_521;
  or_648_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1030_nl <= nand_276_cse AND or_tmp_629;
  mux_tmp_227 <= MUX_s_1_2_2(and_1030_nl, or_tmp_629, or_648_cse);
  and_1031_nl <= nand_281_cse AND mux_tmp_227;
  mux_230_nl <= MUX_s_1_2_2(and_1031_nl, mux_tmp_227, or_643_cse);
  and_dcpl_550 <= mux_230_nl AND and_dcpl_362 AND and_dcpl_524;
  or_653_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR (rem_12cyc_st_3_3_2(1));
  and_1027_nl <= nand_198_cse AND or_tmp_629;
  mux_tmp_229 <= MUX_s_1_2_2(and_1027_nl, or_tmp_629, or_653_cse);
  and_1028_nl <= nand_276_cse AND mux_tmp_229;
  mux_tmp_230 <= MUX_s_1_2_2(and_1028_nl, mux_tmp_229, or_648_cse);
  and_1029_nl <= nand_281_cse AND mux_tmp_230;
  mux_233_nl <= MUX_s_1_2_2(and_1029_nl, mux_tmp_230, or_643_cse);
  and_dcpl_552 <= mux_233_nl AND and_dcpl_366 AND and_dcpl_527;
  or_660_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("01"));
  and_1023_nl <= nand_271_cse AND or_tmp_629;
  mux_tmp_232 <= MUX_s_1_2_2(and_1023_nl, or_tmp_629, or_660_cse);
  and_1024_nl <= nand_198_cse AND mux_tmp_232;
  mux_tmp_233 <= MUX_s_1_2_2(and_1024_nl, mux_tmp_232, or_653_cse);
  and_1025_nl <= nand_276_cse AND mux_tmp_233;
  mux_tmp_234 <= MUX_s_1_2_2(and_1025_nl, mux_tmp_233, or_648_cse);
  and_1026_nl <= nand_281_cse AND mux_tmp_234;
  mux_237_nl <= MUX_s_1_2_2(and_1026_nl, mux_tmp_234, or_643_cse);
  and_dcpl_554 <= mux_237_nl AND and_dcpl_370 AND and_dcpl_530;
  or_669_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR (rem_12cyc_st_5_3_2(1));
  and_1018_nl <= nand_189_cse AND or_tmp_629;
  mux_tmp_236 <= MUX_s_1_2_2(and_1018_nl, or_tmp_629, or_669_cse);
  and_1019_nl <= nand_271_cse AND mux_tmp_236;
  mux_tmp_237 <= MUX_s_1_2_2(and_1019_nl, mux_tmp_236, or_660_cse);
  and_1020_nl <= nand_198_cse AND mux_tmp_237;
  mux_tmp_238 <= MUX_s_1_2_2(and_1020_nl, mux_tmp_237, or_653_cse);
  and_1021_nl <= nand_276_cse AND mux_tmp_238;
  mux_tmp_239 <= MUX_s_1_2_2(and_1021_nl, mux_tmp_238, or_648_cse);
  and_1022_nl <= nand_281_cse AND mux_tmp_239;
  mux_242_nl <= MUX_s_1_2_2(and_1022_nl, mux_tmp_239, or_643_cse);
  and_dcpl_556 <= mux_242_nl AND and_dcpl_121 AND and_dcpl_119;
  or_680_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_6_3_2(1));
  and_1012_nl <= nand_215_cse AND or_tmp_629;
  mux_tmp_241 <= MUX_s_1_2_2(and_1012_nl, or_tmp_629, or_680_cse);
  and_1013_nl <= nand_189_cse AND mux_tmp_241;
  mux_tmp_242 <= MUX_s_1_2_2(and_1013_nl, mux_tmp_241, or_669_cse);
  and_1014_nl <= nand_271_cse AND mux_tmp_242;
  mux_tmp_243 <= MUX_s_1_2_2(and_1014_nl, mux_tmp_242, or_660_cse);
  and_1015_nl <= nand_198_cse AND mux_tmp_243;
  mux_tmp_244 <= MUX_s_1_2_2(and_1015_nl, mux_tmp_243, or_653_cse);
  and_1016_nl <= nand_276_cse AND mux_tmp_244;
  mux_tmp_245 <= MUX_s_1_2_2(and_1016_nl, mux_tmp_244, or_648_cse);
  and_1017_nl <= nand_281_cse AND mux_tmp_245;
  mux_248_nl <= MUX_s_1_2_2(and_1017_nl, mux_tmp_245, or_643_cse);
  and_dcpl_558 <= mux_248_nl AND and_dcpl_94 AND and_dcpl_92;
  or_693_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_7_3_2(1));
  and_1005_nl <= nand_212_cse AND or_tmp_629;
  mux_tmp_247 <= MUX_s_1_2_2(and_1005_nl, or_tmp_629, or_693_cse);
  and_1006_nl <= nand_215_cse AND mux_tmp_247;
  mux_tmp_248 <= MUX_s_1_2_2(and_1006_nl, mux_tmp_247, or_680_cse);
  and_1007_nl <= nand_189_cse AND mux_tmp_248;
  mux_tmp_249 <= MUX_s_1_2_2(and_1007_nl, mux_tmp_248, or_669_cse);
  and_1008_nl <= nand_271_cse AND mux_tmp_249;
  mux_tmp_250 <= MUX_s_1_2_2(and_1008_nl, mux_tmp_249, or_660_cse);
  and_1009_nl <= nand_198_cse AND mux_tmp_250;
  mux_tmp_251 <= MUX_s_1_2_2(and_1009_nl, mux_tmp_250, or_653_cse);
  and_1010_nl <= nand_276_cse AND mux_tmp_251;
  mux_tmp_252 <= MUX_s_1_2_2(and_1010_nl, mux_tmp_251, or_648_cse);
  and_1011_nl <= nand_281_cse AND mux_tmp_252;
  mux_255_nl <= MUX_s_1_2_2(and_1011_nl, mux_tmp_252, or_643_cse);
  and_dcpl_560 <= mux_255_nl AND and_dcpl_67 AND and_dcpl_65;
  or_708_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_8_3_2(1));
  and_997_nl <= nand_208_cse AND or_tmp_629;
  mux_tmp_254 <= MUX_s_1_2_2(and_997_nl, or_tmp_629, or_708_cse);
  and_998_nl <= nand_212_cse AND mux_tmp_254;
  mux_tmp_255 <= MUX_s_1_2_2(and_998_nl, mux_tmp_254, or_693_cse);
  and_999_nl <= nand_215_cse AND mux_tmp_255;
  mux_tmp_256 <= MUX_s_1_2_2(and_999_nl, mux_tmp_255, or_680_cse);
  and_1000_nl <= nand_189_cse AND mux_tmp_256;
  mux_tmp_257 <= MUX_s_1_2_2(and_1000_nl, mux_tmp_256, or_669_cse);
  and_1001_nl <= nand_271_cse AND mux_tmp_257;
  mux_tmp_258 <= MUX_s_1_2_2(and_1001_nl, mux_tmp_257, or_660_cse);
  and_1002_nl <= nand_198_cse AND mux_tmp_258;
  mux_tmp_259 <= MUX_s_1_2_2(and_1002_nl, mux_tmp_258, or_653_cse);
  and_1003_nl <= nand_276_cse AND mux_tmp_259;
  mux_tmp_260 <= MUX_s_1_2_2(and_1003_nl, mux_tmp_259, or_648_cse);
  and_1004_nl <= nand_281_cse AND mux_tmp_260;
  mux_263_nl <= MUX_s_1_2_2(and_1004_nl, mux_tmp_260, or_643_cse);
  and_dcpl_562 <= mux_263_nl AND and_dcpl_40 AND and_dcpl_38;
  and_988_nl <= nand_203_cse AND or_tmp_629;
  or_725_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("11")) OR (rem_12cyc_st_9_3_2(1));
  mux_tmp_262 <= MUX_s_1_2_2(and_988_nl, or_tmp_629, or_725_nl);
  and_989_nl <= nand_208_cse AND mux_tmp_262;
  mux_tmp_263 <= MUX_s_1_2_2(and_989_nl, mux_tmp_262, or_708_cse);
  and_990_nl <= nand_212_cse AND mux_tmp_263;
  mux_tmp_264 <= MUX_s_1_2_2(and_990_nl, mux_tmp_263, or_693_cse);
  and_991_nl <= nand_215_cse AND mux_tmp_264;
  mux_tmp_265 <= MUX_s_1_2_2(and_991_nl, mux_tmp_264, or_680_cse);
  and_992_nl <= nand_189_cse AND mux_tmp_265;
  mux_tmp_266 <= MUX_s_1_2_2(and_992_nl, mux_tmp_265, or_669_cse);
  and_993_nl <= nand_271_cse AND mux_tmp_266;
  mux_tmp_267 <= MUX_s_1_2_2(and_993_nl, mux_tmp_266, or_660_cse);
  and_994_nl <= nand_198_cse AND mux_tmp_267;
  mux_tmp_268 <= MUX_s_1_2_2(and_994_nl, mux_tmp_267, or_653_cse);
  and_995_nl <= nand_276_cse AND mux_tmp_268;
  mux_tmp_269 <= MUX_s_1_2_2(and_995_nl, mux_tmp_268, or_648_cse);
  and_996_nl <= nand_281_cse AND mux_tmp_269;
  mux_272_nl <= MUX_s_1_2_2(and_996_nl, mux_tmp_269, or_643_cse);
  and_dcpl_564 <= mux_272_nl AND and_dcpl_13 AND and_dcpl_11;
  and_tmp_179 <= (NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11"))
      AND CONV_SL_1_1(rem_12cyc_st_7_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_9
      AND asn_itm_8 AND CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_8_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_10
      AND asn_itm_9 AND CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_9_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_3
      AND asn_itm_2 AND CONV_SL_1_1(rem_12cyc_st_2_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_4
      AND asn_itm_3 AND CONV_SL_1_1(rem_12cyc_st_3_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_5
      AND asn_itm_4 AND CONV_SL_1_1(rem_12cyc_st_4_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_6
      AND asn_itm_5 AND CONV_SL_1_1(rem_12cyc_st_5_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_7
      AND asn_itm_6 AND CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_6_3_2=STD_LOGIC_VECTOR'("01")))) AND (NOT(main_stage_0_11
      AND asn_itm_10 AND CONV_SL_1_1(rem_12cyc_st_10_1_0=STD_LOGIC_VECTOR'("11"))
      AND CONV_SL_1_1(rem_12cyc_st_10_3_2=STD_LOGIC_VECTOR'("01")))) AND ((acc_tmp(1))
      OR (NOT((acc_tmp(0)) AND CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11"))
      AND ccs_ccore_start_rsci_idat)));
  and_987_nl <= (NOT((rem_12cyc_3_2(0)) AND CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11"))))
      AND and_tmp_179;
  or_735_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR (rem_12cyc_3_2(1));
  mux_tmp_271 <= MUX_s_1_2_2(and_987_nl, and_tmp_179, or_735_nl);
  and_dcpl_568 <= and_dcpl_292 AND (acc_tmp(1));
  and_dcpl_569 <= and_dcpl_568 AND and_dcpl_291;
  and_dcpl_570 <= CONV_SL_1_1(rem_12cyc_st_2_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_571 <= and_dcpl_570 AND (NOT (rem_12cyc_st_2_1_0(1)));
  or_tmp_733 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_748_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_436_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_733));
  mux_274_nl <= MUX_s_1_2_2(nor_436_nl, or_tmp_733, or_748_cse);
  and_dcpl_573 <= mux_274_nl AND and_dcpl_298 AND and_dcpl_571;
  and_dcpl_574 <= CONV_SL_1_1(rem_12cyc_st_3_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_575 <= and_dcpl_574 AND (NOT (rem_12cyc_st_3_1_0(1)));
  or_753_cse <= (rem_12cyc_st_2_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_180 <= or_753_cse AND or_tmp_733;
  nor_435_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_180));
  mux_275_nl <= MUX_s_1_2_2(nor_435_nl, and_tmp_180, or_748_cse);
  and_dcpl_577 <= mux_275_nl AND and_dcpl_304 AND and_dcpl_575;
  and_dcpl_578 <= CONV_SL_1_1(rem_12cyc_st_4_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_579 <= and_dcpl_578 AND (NOT (rem_12cyc_st_4_1_0(1)));
  or_757_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_182 <= or_753_cse AND or_757_cse AND or_tmp_733;
  nor_434_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_182));
  mux_276_nl <= MUX_s_1_2_2(nor_434_nl, and_tmp_182, or_748_cse);
  and_dcpl_581 <= mux_276_nl AND and_dcpl_310 AND and_dcpl_579;
  and_dcpl_582 <= CONV_SL_1_1(rem_12cyc_st_5_3_2=STD_LOGIC_VECTOR'("10"));
  and_dcpl_583 <= and_dcpl_582 AND (NOT (rem_12cyc_st_5_1_0(1)));
  or_762_cse <= (rem_12cyc_st_4_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_185 <= or_753_cse AND or_757_cse AND or_762_cse AND or_tmp_733;
  nor_433_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_185));
  mux_277_nl <= MUX_s_1_2_2(nor_433_nl, and_tmp_185, or_748_cse);
  and_dcpl_585 <= mux_277_nl AND and_dcpl_316 AND and_dcpl_583;
  or_768_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_189 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND or_tmp_733;
  nor_432_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_189));
  mux_278_nl <= MUX_s_1_2_2(nor_432_nl, and_tmp_189, or_748_cse);
  and_dcpl_589 <= mux_278_nl AND and_dcpl_112 AND and_dcpl_126 AND (NOT (rem_12cyc_st_6_1_0(1)));
  or_775_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_430_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_733));
  mux_279_nl <= MUX_s_1_2_2(nor_430_nl, or_tmp_733, or_775_cse);
  and_tmp_193 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_279_nl;
  nor_431_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_193));
  mux_280_nl <= MUX_s_1_2_2(nor_431_nl, and_tmp_193, or_748_cse);
  and_dcpl_593 <= mux_280_nl AND and_dcpl_85 AND and_dcpl_99 AND (NOT (rem_12cyc_st_7_1_0(0)));
  or_784_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_427_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_733));
  mux_tmp_279 <= MUX_s_1_2_2(nor_427_nl, or_tmp_733, or_784_cse);
  nor_428_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_279));
  mux_282_nl <= MUX_s_1_2_2(nor_428_nl, mux_tmp_279, or_775_cse);
  and_tmp_197 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_282_nl;
  nor_429_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_197));
  mux_283_nl <= MUX_s_1_2_2(nor_429_nl, and_tmp_197, or_748_cse);
  and_dcpl_597 <= mux_283_nl AND and_dcpl_58 AND and_dcpl_72 AND (NOT (rem_12cyc_st_8_1_0(0)));
  or_795_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_423_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_733));
  mux_tmp_282 <= MUX_s_1_2_2(nor_423_nl, or_tmp_733, or_795_cse);
  nor_424_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_282));
  mux_tmp_283 <= MUX_s_1_2_2(nor_424_nl, mux_tmp_282, or_784_cse);
  nor_425_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_283));
  mux_286_nl <= MUX_s_1_2_2(nor_425_nl, mux_tmp_283, or_775_cse);
  and_tmp_201 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_286_nl;
  nor_426_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_201));
  mux_287_nl <= MUX_s_1_2_2(nor_426_nl, and_tmp_201, or_748_cse);
  and_dcpl_601 <= mux_287_nl AND and_dcpl_31 AND and_dcpl_45 AND (NOT (rem_12cyc_st_9_1_0(0)));
  nor_418_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_733));
  or_808_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_286 <= MUX_s_1_2_2(nor_418_nl, or_tmp_733, or_808_nl);
  nor_419_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_286));
  mux_tmp_287 <= MUX_s_1_2_2(nor_419_nl, mux_tmp_286, or_795_cse);
  nor_420_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_287));
  mux_tmp_288 <= MUX_s_1_2_2(nor_420_nl, mux_tmp_287, or_784_cse);
  nor_421_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_288));
  mux_291_nl <= MUX_s_1_2_2(nor_421_nl, mux_tmp_288, or_775_cse);
  and_tmp_205 <= or_753_cse AND or_757_cse AND or_762_cse AND or_768_cse AND mux_291_nl;
  nor_422_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_205));
  mux_292_nl <= MUX_s_1_2_2(nor_422_nl, and_tmp_205, or_748_cse);
  and_dcpl_605 <= mux_292_nl AND and_dcpl_4 AND and_dcpl_18 AND (NOT (rem_12cyc_st_10_1_0(0)));
  or_tmp_808 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_1_tmp(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("00")) OR (NOT ccs_ccore_start_rsci_idat);
  nor_409_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_808));
  or_823_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_291 <= MUX_s_1_2_2(nor_409_nl, or_tmp_808, or_823_nl);
  nor_410_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_291));
  or_822_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_292 <= MUX_s_1_2_2(nor_410_nl, mux_tmp_291, or_822_nl);
  nor_411_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_292));
  or_821_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_293 <= MUX_s_1_2_2(nor_411_nl, mux_tmp_292, or_821_nl);
  nor_412_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_293));
  or_820_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_294 <= MUX_s_1_2_2(nor_412_nl, mux_tmp_293, or_820_nl);
  nor_413_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_294));
  or_819_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_295 <= MUX_s_1_2_2(nor_413_nl, mux_tmp_294, or_819_nl);
  nor_414_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_295));
  or_818_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_296 <= MUX_s_1_2_2(nor_414_nl, mux_tmp_295, or_818_nl);
  nor_415_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_296));
  or_817_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_297 <= MUX_s_1_2_2(nor_415_nl, mux_tmp_296, or_817_nl);
  nor_416_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_297));
  or_816_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_298 <= MUX_s_1_2_2(nor_416_nl, mux_tmp_297, or_816_nl);
  nor_417_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_298));
  or_815_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_301_nl <= MUX_s_1_2_2(nor_417_nl, mux_tmp_298, or_815_nl);
  and_tmp_206 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("00"))) AND mux_301_nl;
  and_dcpl_610 <= and_dcpl_568 AND and_dcpl_355;
  or_tmp_820 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_837_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_408_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_820));
  mux_302_nl <= MUX_s_1_2_2(nor_408_nl, or_tmp_820, or_837_cse);
  and_dcpl_612 <= mux_302_nl AND and_dcpl_358 AND and_dcpl_571;
  nand_84_cse <= NOT((rem_12cyc_st_2_3_2(1)) AND asn_itm_2 AND main_stage_0_3 AND
      (rem_12cyc_st_2_1_0(0)));
  or_842_cse <= (rem_12cyc_st_2_1_0(1)) OR (rem_12cyc_st_2_3_2(0));
  and_986_nl <= nand_84_cse AND or_tmp_820;
  mux_tmp_301 <= MUX_s_1_2_2(and_986_nl, or_tmp_820, or_842_cse);
  nor_407_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_301));
  mux_304_nl <= MUX_s_1_2_2(nor_407_nl, mux_tmp_301, or_837_cse);
  and_dcpl_614 <= mux_304_nl AND and_dcpl_362 AND and_dcpl_575;
  or_847_cse <= (rem_12cyc_st_3_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"));
  and_984_nl <= nand_274_cse AND or_tmp_820;
  mux_tmp_303 <= MUX_s_1_2_2(and_984_nl, or_tmp_820, or_847_cse);
  and_985_nl <= nand_84_cse AND mux_tmp_303;
  mux_tmp_304 <= MUX_s_1_2_2(and_985_nl, mux_tmp_303, or_842_cse);
  nor_406_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_304));
  mux_307_nl <= MUX_s_1_2_2(nor_406_nl, mux_tmp_304, or_837_cse);
  and_dcpl_616 <= mux_307_nl AND and_dcpl_366 AND and_dcpl_579;
  nand_79_cse <= NOT((rem_12cyc_st_4_3_2(1)) AND asn_itm_4 AND main_stage_0_5 AND
      (rem_12cyc_st_4_1_0(0)));
  or_854_cse <= (rem_12cyc_st_4_1_0(1)) OR (rem_12cyc_st_4_3_2(0));
  and_981_nl <= nand_79_cse AND or_tmp_820;
  mux_tmp_306 <= MUX_s_1_2_2(and_981_nl, or_tmp_820, or_854_cse);
  and_982_nl <= nand_274_cse AND mux_tmp_306;
  mux_tmp_307 <= MUX_s_1_2_2(and_982_nl, mux_tmp_306, or_847_cse);
  and_983_nl <= nand_84_cse AND mux_tmp_307;
  mux_tmp_308 <= MUX_s_1_2_2(and_983_nl, mux_tmp_307, or_842_cse);
  nor_405_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_308));
  mux_311_nl <= MUX_s_1_2_2(nor_405_nl, mux_tmp_308, or_837_cse);
  and_dcpl_618 <= mux_311_nl AND and_dcpl_370 AND and_dcpl_583;
  or_863_cse <= (rem_12cyc_st_5_1_0(1)) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"));
  and_977_nl <= nand_267_cse AND or_tmp_820;
  mux_tmp_310 <= MUX_s_1_2_2(and_977_nl, or_tmp_820, or_863_cse);
  and_978_nl <= nand_79_cse AND mux_tmp_310;
  mux_tmp_311 <= MUX_s_1_2_2(and_978_nl, mux_tmp_310, or_854_cse);
  and_979_nl <= nand_274_cse AND mux_tmp_311;
  mux_tmp_312 <= MUX_s_1_2_2(and_979_nl, mux_tmp_311, or_847_cse);
  and_980_nl <= nand_84_cse AND mux_tmp_312;
  mux_tmp_313 <= MUX_s_1_2_2(and_980_nl, mux_tmp_312, or_842_cse);
  nor_404_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_313));
  mux_316_nl <= MUX_s_1_2_2(nor_404_nl, mux_tmp_313, or_837_cse);
  and_dcpl_622 <= mux_316_nl AND and_dcpl_112 AND and_dcpl_129 AND (NOT (rem_12cyc_st_6_1_0(1)));
  or_874_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_402_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_820));
  mux_tmp_315 <= MUX_s_1_2_2(nor_402_nl, or_tmp_820, or_874_cse);
  and_973_nl <= nand_267_cse AND mux_tmp_315;
  mux_tmp_316 <= MUX_s_1_2_2(and_973_nl, mux_tmp_315, or_863_cse);
  and_974_nl <= nand_79_cse AND mux_tmp_316;
  mux_tmp_317 <= MUX_s_1_2_2(and_974_nl, mux_tmp_316, or_854_cse);
  and_975_nl <= nand_274_cse AND mux_tmp_317;
  mux_tmp_318 <= MUX_s_1_2_2(and_975_nl, mux_tmp_317, or_847_cse);
  and_976_nl <= nand_84_cse AND mux_tmp_318;
  mux_tmp_319 <= MUX_s_1_2_2(and_976_nl, mux_tmp_318, or_842_cse);
  nor_403_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_319));
  mux_322_nl <= MUX_s_1_2_2(nor_403_nl, mux_tmp_319, or_837_cse);
  and_dcpl_625 <= mux_322_nl AND and_dcpl_85 AND and_dcpl_99 AND (rem_12cyc_st_7_1_0(0));
  or_887_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_399_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_820));
  mux_tmp_321 <= MUX_s_1_2_2(nor_399_nl, or_tmp_820, or_887_cse);
  nor_400_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_321));
  mux_tmp_322 <= MUX_s_1_2_2(nor_400_nl, mux_tmp_321, or_874_cse);
  and_969_nl <= nand_267_cse AND mux_tmp_322;
  mux_tmp_323 <= MUX_s_1_2_2(and_969_nl, mux_tmp_322, or_863_cse);
  and_970_nl <= nand_79_cse AND mux_tmp_323;
  mux_tmp_324 <= MUX_s_1_2_2(and_970_nl, mux_tmp_323, or_854_cse);
  and_971_nl <= nand_274_cse AND mux_tmp_324;
  mux_tmp_325 <= MUX_s_1_2_2(and_971_nl, mux_tmp_324, or_847_cse);
  and_972_nl <= nand_84_cse AND mux_tmp_325;
  mux_tmp_326 <= MUX_s_1_2_2(and_972_nl, mux_tmp_325, or_842_cse);
  nor_401_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_326));
  mux_329_nl <= MUX_s_1_2_2(nor_401_nl, mux_tmp_326, or_837_cse);
  and_dcpl_628 <= mux_329_nl AND and_dcpl_58 AND and_dcpl_72 AND (rem_12cyc_st_8_1_0(0));
  or_902_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_395_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_820));
  mux_tmp_328 <= MUX_s_1_2_2(nor_395_nl, or_tmp_820, or_902_cse);
  nor_396_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_328));
  mux_tmp_329 <= MUX_s_1_2_2(nor_396_nl, mux_tmp_328, or_887_cse);
  nor_397_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_329));
  mux_tmp_330 <= MUX_s_1_2_2(nor_397_nl, mux_tmp_329, or_874_cse);
  and_965_nl <= nand_267_cse AND mux_tmp_330;
  mux_tmp_331 <= MUX_s_1_2_2(and_965_nl, mux_tmp_330, or_863_cse);
  and_966_nl <= nand_79_cse AND mux_tmp_331;
  mux_tmp_332 <= MUX_s_1_2_2(and_966_nl, mux_tmp_331, or_854_cse);
  and_967_nl <= nand_274_cse AND mux_tmp_332;
  mux_tmp_333 <= MUX_s_1_2_2(and_967_nl, mux_tmp_332, or_847_cse);
  and_968_nl <= nand_84_cse AND mux_tmp_333;
  mux_tmp_334 <= MUX_s_1_2_2(and_968_nl, mux_tmp_333, or_842_cse);
  nor_398_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_334));
  mux_337_nl <= MUX_s_1_2_2(nor_398_nl, mux_tmp_334, or_837_cse);
  and_dcpl_631 <= mux_337_nl AND and_dcpl_31 AND and_dcpl_45 AND (rem_12cyc_st_9_1_0(0));
  nor_390_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_820));
  or_919_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_336 <= MUX_s_1_2_2(nor_390_nl, or_tmp_820, or_919_nl);
  nor_391_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_336));
  mux_tmp_337 <= MUX_s_1_2_2(nor_391_nl, mux_tmp_336, or_902_cse);
  nor_392_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_337));
  mux_tmp_338 <= MUX_s_1_2_2(nor_392_nl, mux_tmp_337, or_887_cse);
  nor_393_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_338));
  mux_tmp_339 <= MUX_s_1_2_2(nor_393_nl, mux_tmp_338, or_874_cse);
  and_961_nl <= nand_267_cse AND mux_tmp_339;
  mux_tmp_340 <= MUX_s_1_2_2(and_961_nl, mux_tmp_339, or_863_cse);
  and_962_nl <= nand_79_cse AND mux_tmp_340;
  mux_tmp_341 <= MUX_s_1_2_2(and_962_nl, mux_tmp_340, or_854_cse);
  and_963_nl <= nand_274_cse AND mux_tmp_341;
  mux_tmp_342 <= MUX_s_1_2_2(and_963_nl, mux_tmp_341, or_847_cse);
  and_964_nl <= nand_84_cse AND mux_tmp_342;
  mux_tmp_343 <= MUX_s_1_2_2(and_964_nl, mux_tmp_342, or_842_cse);
  nor_394_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_343));
  mux_346_nl <= MUX_s_1_2_2(nor_394_nl, mux_tmp_343, or_837_cse);
  and_dcpl_634 <= mux_346_nl AND and_dcpl_4 AND and_dcpl_18 AND (rem_12cyc_st_10_1_0(0));
  or_tmp_921 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR (acc_1_tmp(1)) OR
      nand_250_cse;
  nor_380_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_921));
  or_938_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_345 <= MUX_s_1_2_2(nor_380_nl, or_tmp_921, or_938_nl);
  nor_381_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_345));
  or_937_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_346 <= MUX_s_1_2_2(nor_381_nl, mux_tmp_345, or_937_nl);
  nor_382_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_346));
  or_936_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_347 <= MUX_s_1_2_2(nor_382_nl, mux_tmp_346, or_936_nl);
  nor_383_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_347));
  or_935_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_348 <= MUX_s_1_2_2(nor_383_nl, mux_tmp_347, or_935_nl);
  nor_384_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_348));
  or_934_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_349 <= MUX_s_1_2_2(nor_384_nl, mux_tmp_348, or_934_nl);
  nor_385_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_349));
  or_933_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_350 <= MUX_s_1_2_2(nor_385_nl, mux_tmp_349, or_933_nl);
  nor_386_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_350));
  or_932_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_351 <= MUX_s_1_2_2(nor_386_nl, mux_tmp_350, or_932_nl);
  nor_387_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_351));
  or_931_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_352 <= MUX_s_1_2_2(nor_387_nl, mux_tmp_351, or_931_nl);
  nor_388_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_352));
  or_930_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("01"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_tmp_353 <= MUX_s_1_2_2(nor_388_nl, mux_tmp_352, or_930_nl);
  nor_389_nl <= NOT((rem_12cyc_1_0(0)) OR (NOT mux_tmp_353));
  or_929_nl <= (NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_1_0(1));
  mux_tmp_354 <= MUX_s_1_2_2(nor_389_nl, mux_tmp_353, or_929_nl);
  and_dcpl_638 <= and_dcpl_568 AND and_dcpl_393;
  and_dcpl_639 <= and_dcpl_570 AND (rem_12cyc_st_2_1_0(1));
  or_tmp_934 <= CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR not_tmp_54;
  or_952_cse <= CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10"));
  nor_379_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_934));
  mux_357_nl <= MUX_s_1_2_2(nor_379_nl, or_tmp_934, or_952_cse);
  and_dcpl_641 <= mux_357_nl AND and_dcpl_298 AND and_dcpl_639;
  and_dcpl_642 <= and_dcpl_574 AND (rem_12cyc_st_3_1_0(1));
  or_957_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_2_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_2) OR (NOT main_stage_0_3) OR (rem_12cyc_st_2_1_0(0));
  and_tmp_207 <= or_957_cse AND or_tmp_934;
  nor_378_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_207));
  mux_358_nl <= MUX_s_1_2_2(nor_378_nl, and_tmp_207, or_952_cse);
  and_dcpl_644 <= mux_358_nl AND and_dcpl_304 AND and_dcpl_642;
  and_dcpl_645 <= and_dcpl_578 AND (rem_12cyc_st_4_1_0(1));
  or_961_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_3) OR (NOT main_stage_0_4) OR (rem_12cyc_st_3_1_0(0));
  and_tmp_209 <= or_957_cse AND or_961_cse AND or_tmp_934;
  nor_377_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_209));
  mux_359_nl <= MUX_s_1_2_2(nor_377_nl, and_tmp_209, or_952_cse);
  and_dcpl_647 <= mux_359_nl AND and_dcpl_310 AND and_dcpl_645;
  and_dcpl_648 <= and_dcpl_582 AND (rem_12cyc_st_5_1_0(1));
  or_966_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_4_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_4) OR (NOT main_stage_0_5) OR (rem_12cyc_st_4_1_0(0));
  and_tmp_212 <= or_957_cse AND or_961_cse AND or_966_cse AND or_tmp_934;
  nor_376_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_212));
  mux_360_nl <= MUX_s_1_2_2(nor_376_nl, and_tmp_212, or_952_cse);
  and_dcpl_650 <= mux_360_nl AND and_dcpl_316 AND and_dcpl_648;
  or_972_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"))
      OR (NOT asn_itm_5) OR (NOT main_stage_0_6) OR (rem_12cyc_st_5_1_0(0));
  and_tmp_216 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND or_tmp_934;
  nor_375_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_216));
  mux_361_nl <= MUX_s_1_2_2(nor_375_nl, and_tmp_216, or_952_cse);
  and_dcpl_653 <= mux_361_nl AND and_dcpl_112 AND and_dcpl_126 AND (rem_12cyc_st_6_1_0(1));
  or_979_cse <= CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_6_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_373_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_934));
  mux_362_nl <= MUX_s_1_2_2(nor_373_nl, or_tmp_934, or_979_cse);
  and_tmp_220 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_362_nl;
  nor_374_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_220));
  mux_363_nl <= MUX_s_1_2_2(nor_374_nl, and_tmp_220, or_952_cse);
  and_dcpl_657 <= mux_363_nl AND and_dcpl_85 AND and_dcpl_104 AND (NOT (rem_12cyc_st_7_1_0(0)));
  or_988_cse <= CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_7_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_370_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_934));
  mux_tmp_362 <= MUX_s_1_2_2(nor_370_nl, or_tmp_934, or_988_cse);
  nor_371_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_362));
  mux_365_nl <= MUX_s_1_2_2(nor_371_nl, mux_tmp_362, or_979_cse);
  and_tmp_224 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_365_nl;
  nor_372_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_224));
  mux_366_nl <= MUX_s_1_2_2(nor_372_nl, and_tmp_224, or_952_cse);
  and_dcpl_661 <= mux_366_nl AND and_dcpl_58 AND and_dcpl_77 AND (NOT (rem_12cyc_st_8_1_0(0)));
  or_999_cse <= CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_8_3_2/=STD_LOGIC_VECTOR'("10"));
  nor_366_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_934));
  mux_tmp_365 <= MUX_s_1_2_2(nor_366_nl, or_tmp_934, or_999_cse);
  nor_367_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_365));
  mux_tmp_366 <= MUX_s_1_2_2(nor_367_nl, mux_tmp_365, or_988_cse);
  nor_368_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_366));
  mux_369_nl <= MUX_s_1_2_2(nor_368_nl, mux_tmp_366, or_979_cse);
  and_tmp_228 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_369_nl;
  nor_369_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_228));
  mux_370_nl <= MUX_s_1_2_2(nor_369_nl, and_tmp_228, or_952_cse);
  and_dcpl_665 <= mux_370_nl AND and_dcpl_31 AND and_dcpl_50 AND (NOT (rem_12cyc_st_9_1_0(0)));
  nor_361_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_934));
  or_1012_nl <= CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(rem_12cyc_st_9_3_2/=STD_LOGIC_VECTOR'("10"));
  mux_tmp_369 <= MUX_s_1_2_2(nor_361_nl, or_tmp_934, or_1012_nl);
  nor_362_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_369));
  mux_tmp_370 <= MUX_s_1_2_2(nor_362_nl, mux_tmp_369, or_999_cse);
  nor_363_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_370));
  mux_tmp_371 <= MUX_s_1_2_2(nor_363_nl, mux_tmp_370, or_988_cse);
  nor_364_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_371));
  mux_374_nl <= MUX_s_1_2_2(nor_364_nl, mux_tmp_371, or_979_cse);
  and_tmp_232 <= or_957_cse AND or_961_cse AND or_966_cse AND or_972_cse AND mux_374_nl;
  nor_365_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT and_tmp_232));
  mux_375_nl <= MUX_s_1_2_2(nor_365_nl, and_tmp_232, or_952_cse);
  and_dcpl_669 <= mux_375_nl AND and_dcpl_4 AND and_dcpl_23 AND (NOT (rem_12cyc_st_10_1_0(0)));
  or_tmp_1009 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR CONV_SL_1_1(acc_1_tmp(1
      DOWNTO 0)/=STD_LOGIC_VECTOR'("10")) OR (NOT ccs_ccore_start_rsci_idat);
  nor_352_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_1009));
  or_1027_nl <= (NOT main_stage_0_11) OR (NOT asn_itm_10) OR CONV_SL_1_1(rem_12cyc_st_10_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_10_3_2(0));
  mux_tmp_374 <= MUX_s_1_2_2(nor_352_nl, or_tmp_1009, or_1027_nl);
  nor_353_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_374));
  or_1026_nl <= (NOT main_stage_0_7) OR (NOT asn_itm_6) OR CONV_SL_1_1(rem_12cyc_st_6_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_6_3_2(0));
  mux_tmp_375 <= MUX_s_1_2_2(nor_353_nl, mux_tmp_374, or_1026_nl);
  nor_354_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_375));
  or_1025_nl <= (NOT main_stage_0_6) OR (NOT asn_itm_5) OR CONV_SL_1_1(rem_12cyc_st_5_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_5_3_2(0));
  mux_tmp_376 <= MUX_s_1_2_2(nor_354_nl, mux_tmp_375, or_1025_nl);
  nor_355_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_376));
  or_1024_nl <= (NOT main_stage_0_5) OR (NOT asn_itm_4) OR CONV_SL_1_1(rem_12cyc_st_4_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_4_3_2(0));
  mux_tmp_377 <= MUX_s_1_2_2(nor_355_nl, mux_tmp_376, or_1024_nl);
  nor_356_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_377));
  or_1023_nl <= (NOT main_stage_0_4) OR (NOT asn_itm_3) OR CONV_SL_1_1(rem_12cyc_st_3_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_3_3_2(0));
  mux_tmp_378 <= MUX_s_1_2_2(nor_356_nl, mux_tmp_377, or_1023_nl);
  nor_357_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_378));
  or_1022_nl <= (NOT main_stage_0_3) OR (NOT asn_itm_2) OR CONV_SL_1_1(rem_12cyc_st_2_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_2_3_2(0));
  mux_tmp_379 <= MUX_s_1_2_2(nor_357_nl, mux_tmp_378, or_1022_nl);
  nor_358_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_379));
  or_1021_nl <= (NOT main_stage_0_10) OR (NOT asn_itm_9) OR CONV_SL_1_1(rem_12cyc_st_9_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_9_3_2(0));
  mux_tmp_380 <= MUX_s_1_2_2(nor_358_nl, mux_tmp_379, or_1021_nl);
  nor_359_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_380));
  or_1020_nl <= (NOT main_stage_0_9) OR (NOT asn_itm_8) OR CONV_SL_1_1(rem_12cyc_st_8_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_8_3_2(0));
  mux_tmp_381 <= MUX_s_1_2_2(nor_359_nl, mux_tmp_380, or_1020_nl);
  nor_360_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_381));
  or_1019_nl <= (NOT main_stage_0_8) OR (NOT asn_itm_7) OR CONV_SL_1_1(rem_12cyc_st_7_1_0/=STD_LOGIC_VECTOR'("10"))
      OR (rem_12cyc_st_7_3_2(0));
  mux_384_nl <= MUX_s_1_2_2(nor_360_nl, mux_tmp_381, or_1019_nl);
  and_tmp_233 <= ((NOT main_stage_0_2) OR (NOT asn_itm_1) OR CONV_SL_1_1(rem_12cyc_3_2/=STD_LOGIC_VECTOR'("10"))
      OR CONV_SL_1_1(rem_12cyc_1_0/=STD_LOGIC_VECTOR'("10"))) AND mux_384_nl;
  and_dcpl_673 <= and_dcpl_568 AND and_dcpl_430;
  or_tmp_1021 <= (NOT(CONV_SL_1_1(rem_12cyc_1_0=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(rem_12cyc_3_2=STD_LOGIC_VECTOR'("10"))))
      OR not_tmp_54;
  nand_57_cse <= NOT(CONV_SL_1_1(acc_1_tmp(1 DOWNTO 0)=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(acc_tmp=STD_LOGIC_VECTOR'("10")));
  nor_351_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT or_tmp_1021));
  mux_385_nl <= MUX_s_1_2_2(nor_351_nl, or_tmp_1021, nand_57_cse);
  and_dcpl_675 <= mux_385_nl AND and_dcpl_358 AND and_dcpl_639;
  or_1045_cse <= (NOT (rem_12cyc_st_2_1_0(1))) OR (rem_12cyc_st_2_3_2(0));
  and_960_nl <= nand_84_cse AND or_tmp_1021;
  mux_tmp_384 <= MUX_s_1_2_2(and_960_nl, or_tmp_1021, or_1045_cse);
  nor_350_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_384));
  mux_387_nl <= MUX_s_1_2_2(nor_350_nl, mux_tmp_384, nand_57_cse);
  and_dcpl_677 <= mux_387_nl AND and_dcpl_362 AND and_dcpl_642;
  or_1050_cse <= (NOT (rem_12cyc_st_3_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_3_3_2/=STD_LOGIC_VECTOR'("10"));
  and_958_nl <= nand_274_cse AND or_tmp_1021;
  mux_tmp_386 <= MUX_s_1_2_2(and_958_nl, or_tmp_1021, or_1050_cse);
  and_959_nl <= nand_84_cse AND mux_tmp_386;
  mux_tmp_387 <= MUX_s_1_2_2(and_959_nl, mux_tmp_386, or_1045_cse);
  nor_349_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_387));
  mux_390_nl <= MUX_s_1_2_2(nor_349_nl, mux_tmp_387, nand_57_cse);
  and_dcpl_679 <= mux_390_nl AND and_dcpl_366 AND and_dcpl_645;
  or_1057_cse <= (NOT (rem_12cyc_st_4_1_0(1))) OR (rem_12cyc_st_4_3_2(0));
  and_955_nl <= nand_79_cse AND or_tmp_1021;
  mux_tmp_389 <= MUX_s_1_2_2(and_955_nl, or_tmp_1021, or_1057_cse);
  and_956_nl <= nand_274_cse AND mux_tmp_389;
  mux_tmp_390 <= MUX_s_1_2_2(and_956_nl, mux_tmp_389, or_1050_cse);
  and_957_nl <= nand_84_cse AND mux_tmp_390;
  mux_tmp_391 <= MUX_s_1_2_2(and_957_nl, mux_tmp_390, or_1045_cse);
  nor_348_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_391));
  mux_394_nl <= MUX_s_1_2_2(nor_348_nl, mux_tmp_391, nand_57_cse);
  and_dcpl_681 <= mux_394_nl AND and_dcpl_370 AND and_dcpl_648;
  or_1066_cse <= (NOT (rem_12cyc_st_5_1_0(1))) OR CONV_SL_1_1(rem_12cyc_st_5_3_2/=STD_LOGIC_VECTOR'("10"));
  and_951_nl <= nand_267_cse AND or_tmp_1021;
  mux_tmp_393 <= MUX_s_1_2_2(and_951_nl, or_tmp_1021, or_1066_cse);
  and_952_nl <= nand_79_cse AND mux_tmp_393;
  mux_tmp_394 <= MUX_s_1_2_2(and_952_nl, mux_tmp_393, or_1057_cse);
  and_953_nl <= nand_274_cse AND mux_tmp_394;
  mux_tmp_395 <= MUX_s_1_2_2(and_953_nl, mux_tmp_394, or_1050_cse);
  and_954_nl <= nand_84_cse AND mux_tmp_395;
  mux_tmp_396 <= MUX_s_1_2_2(and_954_nl, mux_tmp_395, or_1045_cse);
  nor_347_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_396));
  mux_399_nl <= MUX_s_1_2_2(nor_347_nl, mux_tmp_396, nand_57_cse);
  and_dcpl_684 <= mux_399_nl AND and_dcpl_112 AND and_dcpl_129 AND (rem_12cyc_st_6_1_0(1));
  nand_36_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_6_3_2=STD_LOGIC_VECTOR'("10")));
  nor_345_nl <= NOT(and_dcpl_111 OR (NOT or_tmp_1021));
  mux_tmp_398 <= MUX_s_1_2_2(nor_345_nl, or_tmp_1021, nand_36_cse);
  and_947_nl <= nand_267_cse AND mux_tmp_398;
  mux_tmp_399 <= MUX_s_1_2_2(and_947_nl, mux_tmp_398, or_1066_cse);
  and_948_nl <= nand_79_cse AND mux_tmp_399;
  mux_tmp_400 <= MUX_s_1_2_2(and_948_nl, mux_tmp_399, or_1057_cse);
  and_949_nl <= nand_274_cse AND mux_tmp_400;
  mux_tmp_401 <= MUX_s_1_2_2(and_949_nl, mux_tmp_400, or_1050_cse);
  and_950_nl <= nand_84_cse AND mux_tmp_401;
  mux_tmp_402 <= MUX_s_1_2_2(and_950_nl, mux_tmp_401, or_1045_cse);
  nor_346_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_402));
  mux_405_nl <= MUX_s_1_2_2(nor_346_nl, mux_tmp_402, nand_57_cse);
  and_dcpl_687 <= mux_405_nl AND and_dcpl_85 AND and_dcpl_104 AND (rem_12cyc_st_7_1_0(0));
  nand_29_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_7_3_2=STD_LOGIC_VECTOR'("10")));
  nor_342_nl <= NOT(and_dcpl_84 OR (NOT or_tmp_1021));
  mux_tmp_404 <= MUX_s_1_2_2(nor_342_nl, or_tmp_1021, nand_29_cse);
  nor_343_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_404));
  mux_tmp_405 <= MUX_s_1_2_2(nor_343_nl, mux_tmp_404, nand_36_cse);
  and_943_nl <= nand_267_cse AND mux_tmp_405;
  mux_tmp_406 <= MUX_s_1_2_2(and_943_nl, mux_tmp_405, or_1066_cse);
  and_944_nl <= nand_79_cse AND mux_tmp_406;
  mux_tmp_407 <= MUX_s_1_2_2(and_944_nl, mux_tmp_406, or_1057_cse);
  and_945_nl <= nand_274_cse AND mux_tmp_407;
  mux_tmp_408 <= MUX_s_1_2_2(and_945_nl, mux_tmp_407, or_1050_cse);
  and_946_nl <= nand_84_cse AND mux_tmp_408;
  mux_tmp_409 <= MUX_s_1_2_2(and_946_nl, mux_tmp_408, or_1045_cse);
  nor_344_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_409));
  mux_412_nl <= MUX_s_1_2_2(nor_344_nl, mux_tmp_409, nand_57_cse);
  and_dcpl_690 <= mux_412_nl AND and_dcpl_58 AND and_dcpl_77 AND (rem_12cyc_st_8_1_0(0));
  nand_21_cse <= NOT(CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11")) AND
      CONV_SL_1_1(rem_12cyc_st_8_3_2=STD_LOGIC_VECTOR'("10")));
  nor_338_nl <= NOT(and_dcpl_57 OR (NOT or_tmp_1021));
  mux_tmp_411 <= MUX_s_1_2_2(nor_338_nl, or_tmp_1021, nand_21_cse);
  nor_339_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_411));
  mux_tmp_412 <= MUX_s_1_2_2(nor_339_nl, mux_tmp_411, nand_29_cse);
  nor_340_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_412));
  mux_tmp_413 <= MUX_s_1_2_2(nor_340_nl, mux_tmp_412, nand_36_cse);
  and_939_nl <= nand_267_cse AND mux_tmp_413;
  mux_tmp_414 <= MUX_s_1_2_2(and_939_nl, mux_tmp_413, or_1066_cse);
  and_940_nl <= nand_79_cse AND mux_tmp_414;
  mux_tmp_415 <= MUX_s_1_2_2(and_940_nl, mux_tmp_414, or_1057_cse);
  and_941_nl <= nand_274_cse AND mux_tmp_415;
  mux_tmp_416 <= MUX_s_1_2_2(and_941_nl, mux_tmp_415, or_1050_cse);
  and_942_nl <= nand_84_cse AND mux_tmp_416;
  mux_tmp_417 <= MUX_s_1_2_2(and_942_nl, mux_tmp_416, or_1045_cse);
  nor_341_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_417));
  mux_420_nl <= MUX_s_1_2_2(nor_341_nl, mux_tmp_417, nand_57_cse);
  and_dcpl_693 <= mux_420_nl AND and_dcpl_31 AND and_dcpl_50 AND (rem_12cyc_st_9_1_0(0));
  nor_333_nl <= NOT(and_dcpl_30 OR (NOT or_tmp_1021));
  nand_12_nl <= NOT(CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11")) AND CONV_SL_1_1(rem_12cyc_st_9_3_2=STD_LOGIC_VECTOR'("10")));
  mux_tmp_419 <= MUX_s_1_2_2(nor_333_nl, or_tmp_1021, nand_12_nl);
  nor_334_nl <= NOT(and_dcpl_57 OR (NOT mux_tmp_419));
  mux_tmp_420 <= MUX_s_1_2_2(nor_334_nl, mux_tmp_419, nand_21_cse);
  nor_335_nl <= NOT(and_dcpl_84 OR (NOT mux_tmp_420));
  mux_tmp_421 <= MUX_s_1_2_2(nor_335_nl, mux_tmp_420, nand_29_cse);
  nor_336_nl <= NOT(and_dcpl_111 OR (NOT mux_tmp_421));
  mux_tmp_422 <= MUX_s_1_2_2(nor_336_nl, mux_tmp_421, nand_36_cse);
  and_935_nl <= nand_267_cse AND mux_tmp_422;
  mux_tmp_423 <= MUX_s_1_2_2(and_935_nl, mux_tmp_422, or_1066_cse);
  and_936_nl <= nand_79_cse AND mux_tmp_423;
  mux_tmp_424 <= MUX_s_1_2_2(and_936_nl, mux_tmp_423, or_1057_cse);
  and_937_nl <= nand_274_cse AND mux_tmp_424;
  mux_tmp_425 <= MUX_s_1_2_2(and_937_nl, mux_tmp_424, or_1050_cse);
  and_938_nl <= nand_84_cse AND mux_tmp_425;
  mux_tmp_426 <= MUX_s_1_2_2(and_938_nl, mux_tmp_425, or_1045_cse);
  nor_337_nl <= NOT(ccs_ccore_start_rsci_idat OR (NOT mux_tmp_426));
  mux_429_nl <= MUX_s_1_2_2(nor_337_nl, mux_tmp_426, nand_57_cse);
  and_dcpl_696 <= mux_429_nl AND and_dcpl_4 AND and_dcpl_23 AND (rem_12cyc_st_10_1_0(0));
  or_tmp_1122 <= CONV_SL_1_1(acc_tmp/=STD_LOGIC_VECTOR'("10")) OR nand_222_cse;
  nor_324_nl <= NOT((rem_12cyc_st_10_3_2(1)) OR (NOT or_tmp_1122));
  nand_1_nl <= NOT(main_stage_0_11 AND asn_itm_10 AND CONV_SL_1_1(rem_12cyc_st_10_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_10_3_2(0))));
  mux_tmp_428 <= MUX_s_1_2_2(nor_324_nl, or_tmp_1122, nand_1_nl);
  nor_325_nl <= NOT((rem_12cyc_st_6_3_2(1)) OR (NOT mux_tmp_428));
  nand_2_nl <= NOT(main_stage_0_7 AND asn_itm_6 AND CONV_SL_1_1(rem_12cyc_st_6_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_6_3_2(0))));
  mux_tmp_429 <= MUX_s_1_2_2(nor_325_nl, mux_tmp_428, nand_2_nl);
  nor_326_nl <= NOT((rem_12cyc_st_5_3_2(1)) OR (NOT mux_tmp_429));
  nand_3_nl <= NOT(main_stage_0_6 AND asn_itm_5 AND CONV_SL_1_1(rem_12cyc_st_5_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_5_3_2(0))));
  mux_tmp_430 <= MUX_s_1_2_2(nor_326_nl, mux_tmp_429, nand_3_nl);
  nor_327_nl <= NOT((rem_12cyc_st_4_3_2(1)) OR (NOT mux_tmp_430));
  nand_4_nl <= NOT(main_stage_0_5 AND asn_itm_4 AND CONV_SL_1_1(rem_12cyc_st_4_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_4_3_2(0))));
  mux_tmp_431 <= MUX_s_1_2_2(nor_327_nl, mux_tmp_430, nand_4_nl);
  nor_328_nl <= NOT((rem_12cyc_st_3_3_2(1)) OR (NOT mux_tmp_431));
  nand_5_nl <= NOT(main_stage_0_4 AND asn_itm_3 AND CONV_SL_1_1(rem_12cyc_st_3_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_3_3_2(0))));
  mux_tmp_432 <= MUX_s_1_2_2(nor_328_nl, mux_tmp_431, nand_5_nl);
  nor_329_nl <= NOT((rem_12cyc_st_2_3_2(1)) OR (NOT mux_tmp_432));
  nand_6_nl <= NOT(main_stage_0_3 AND asn_itm_2 AND CONV_SL_1_1(rem_12cyc_st_2_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_2_3_2(0))));
  mux_tmp_433 <= MUX_s_1_2_2(nor_329_nl, mux_tmp_432, nand_6_nl);
  nor_330_nl <= NOT((rem_12cyc_st_9_3_2(1)) OR (NOT mux_tmp_433));
  nand_7_nl <= NOT(main_stage_0_10 AND asn_itm_9 AND CONV_SL_1_1(rem_12cyc_st_9_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_9_3_2(0))));
  mux_tmp_434 <= MUX_s_1_2_2(nor_330_nl, mux_tmp_433, nand_7_nl);
  nor_331_nl <= NOT((rem_12cyc_st_8_3_2(1)) OR (NOT mux_tmp_434));
  nand_8_nl <= NOT(main_stage_0_9 AND asn_itm_8 AND CONV_SL_1_1(rem_12cyc_st_8_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_8_3_2(0))));
  mux_tmp_435 <= MUX_s_1_2_2(nor_331_nl, mux_tmp_434, nand_8_nl);
  nor_332_nl <= NOT((rem_12cyc_st_7_3_2(1)) OR (NOT mux_tmp_435));
  nand_9_nl <= NOT(main_stage_0_8 AND asn_itm_7 AND CONV_SL_1_1(rem_12cyc_st_7_1_0=STD_LOGIC_VECTOR'("11"))
      AND (NOT (rem_12cyc_st_7_3_2(0))));
  mux_tmp_436 <= MUX_s_1_2_2(nor_332_nl, mux_tmp_435, nand_9_nl);
  and_934_nl <= nand_223_cse AND mux_tmp_436;
  nand_11_nl <= NOT(main_stage_0_2 AND asn_itm_1 AND CONV_SL_1_1(rem_12cyc_3_2=STD_LOGIC_VECTOR'("10")));
  mux_tmp_437 <= MUX_s_1_2_2(and_934_nl, mux_tmp_436, nand_11_nl);
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( ccs_ccore_en = '1' ) THEN
        return_rsci_d <= MUX_v_64_2_2(result_sva_duc_mx0, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(qelse_acc_nl),
            64)), mux_13_nl);
        m_buf_sva_12 <= m_buf_sva_11;
        m_buf_sva_11 <= m_buf_sva_10;
        m_buf_sva_10 <= m_buf_sva_9;
        m_buf_sva_9 <= m_buf_sva_8;
        m_buf_sva_8 <= m_buf_sva_7;
        m_buf_sva_7 <= m_buf_sva_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        asn_itm_12 <= '0';
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
        main_stage_0_13 <= '0';
      ELSIF ( ccs_ccore_en = '1' ) THEN
        asn_itm_12 <= asn_itm_11;
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
        main_stage_0_13 <= main_stage_0_12;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        result_sva_duc <= STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000000000000");
      ELSIF ( (asn_itm_12 AND main_stage_0_13 AND ccs_ccore_en AND (NOT(CONV_SL_1_1(rem_12cyc_st_12_3_2=STD_LOGIC_VECTOR'("11")))))
          = '1' ) THEN
        result_sva_duc <= result_sva_duc_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_12_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_12_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1203_cse = '1' ) THEN
        rem_12cyc_st_12_3_2 <= rem_12cyc_st_11_3_2;
        rem_12cyc_st_12_1_0 <= rem_12cyc_st_11_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1173_cse = '1' ) THEN
        rem_13_cmp_1_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_3_2_63_0, mut_3_3_63_0,
            mut_3_4_63_0, mut_3_5_63_0, mut_3_6_63_0, mut_3_7_63_0, mut_3_8_63_0,
            mut_3_9_63_0, mut_3_10_63_0, mut_3_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_294
            & and_dcpl_300 & and_dcpl_306 & and_dcpl_312 & and_dcpl_318 & and_dcpl_324
            & and_dcpl_330 & and_dcpl_336 & and_dcpl_342 & and_dcpl_348 & and_tmp_35));
        rem_13_cmp_1_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_2_63_0, mut_2_3_63_0,
            mut_2_4_63_0, mut_2_5_63_0, mut_2_6_63_0, mut_2_7_63_0, mut_2_8_63_0,
            mut_2_9_63_0, mut_2_10_63_0, mut_2_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_294
            & and_dcpl_300 & and_dcpl_306 & and_dcpl_312 & and_dcpl_318 & and_dcpl_324
            & and_dcpl_330 & and_dcpl_336 & and_dcpl_342 & and_dcpl_348 & and_tmp_35));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1175_cse = '1' ) THEN
        rem_13_cmp_2_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_5_2_63_0, mut_5_3_63_0,
            mut_5_4_63_0, mut_5_5_63_0, mut_5_6_63_0, mut_5_7_63_0, mut_5_8_63_0,
            mut_5_9_63_0, mut_5_10_63_0, mut_5_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_356
            & and_dcpl_360 & and_dcpl_364 & and_dcpl_368 & and_dcpl_372 & and_dcpl_376
            & and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_388 & mux_tmp_76));
        rem_13_cmp_2_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_4_2_63_0, mut_4_3_63_0,
            mut_4_4_63_0, mut_4_5_63_0, mut_4_6_63_0, mut_4_7_63_0, mut_4_8_63_0,
            mut_4_9_63_0, mut_4_10_63_0, mut_4_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_356
            & and_dcpl_360 & and_dcpl_364 & and_dcpl_368 & and_dcpl_372 & and_dcpl_376
            & and_dcpl_379 & and_dcpl_382 & and_dcpl_385 & and_dcpl_388 & mux_tmp_76));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1177_cse = '1' ) THEN
        rem_13_cmp_3_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_7_2_63_0, mut_7_3_63_0,
            mut_7_4_63_0, mut_7_5_63_0, mut_7_6_63_0, mut_7_7_63_0, mut_7_8_63_0,
            mut_7_9_63_0, mut_7_10_63_0, mut_7_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_394
            & and_dcpl_397 & and_dcpl_400 & and_dcpl_403 & and_dcpl_406 & and_dcpl_409
            & and_dcpl_413 & and_dcpl_417 & and_dcpl_421 & and_dcpl_425 & and_tmp_80));
        rem_13_cmp_3_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_6_2_63_0, mut_6_3_63_0,
            mut_6_4_63_0, mut_6_5_63_0, mut_6_6_63_0, mut_6_7_63_0, mut_6_8_63_0,
            mut_6_9_63_0, mut_6_10_63_0, mut_6_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_394
            & and_dcpl_397 & and_dcpl_400 & and_dcpl_403 & and_dcpl_406 & and_dcpl_409
            & and_dcpl_413 & and_dcpl_417 & and_dcpl_421 & and_dcpl_425 & and_tmp_80));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1179_cse = '1' ) THEN
        rem_13_cmp_4_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_9_2_63_0, mut_9_3_63_0,
            mut_9_4_63_0, mut_9_5_63_0, mut_9_6_63_0, mut_9_7_63_0, mut_9_8_63_0,
            mut_9_9_63_0, mut_9_10_63_0, mut_9_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_431
            & and_dcpl_433 & and_dcpl_435 & and_dcpl_437 & and_dcpl_439 & and_dcpl_442
            & and_dcpl_445 & and_dcpl_448 & and_dcpl_451 & and_dcpl_454 & mux_tmp_141));
        rem_13_cmp_4_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_8_2_63_0, mut_8_3_63_0,
            mut_8_4_63_0, mut_8_5_63_0, mut_8_6_63_0, mut_8_7_63_0, mut_8_8_63_0,
            mut_8_9_63_0, mut_8_10_63_0, mut_8_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_431
            & and_dcpl_433 & and_dcpl_435 & and_dcpl_437 & and_dcpl_439 & and_dcpl_442
            & and_dcpl_445 & and_dcpl_448 & and_dcpl_451 & and_dcpl_454 & mux_tmp_141));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1181_cse = '1' ) THEN
        rem_13_cmp_5_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_11_2_63_0, mut_11_3_63_0,
            mut_11_4_63_0, mut_11_5_63_0, mut_11_6_63_0, mut_11_7_63_0, mut_11_8_63_0,
            mut_11_9_63_0, mut_11_10_63_0, mut_11_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_461
            & and_dcpl_465 & and_dcpl_469 & and_dcpl_473 & and_dcpl_477 & and_dcpl_480
            & and_dcpl_483 & and_dcpl_486 & and_dcpl_489 & and_dcpl_492 & and_tmp_125));
        rem_13_cmp_5_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_10_2_63_0, mut_10_3_63_0,
            mut_10_4_63_0, mut_10_5_63_0, mut_10_6_63_0, mut_10_7_63_0, mut_10_8_63_0,
            mut_10_9_63_0, mut_10_10_63_0, mut_10_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_461
            & and_dcpl_465 & and_dcpl_469 & and_dcpl_473 & and_dcpl_477 & and_dcpl_480
            & and_dcpl_483 & and_dcpl_486 & and_dcpl_489 & and_dcpl_492 & and_tmp_125));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1183_cse = '1' ) THEN
        rem_13_cmp_6_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_13_2_63_0, mut_13_3_63_0,
            mut_13_4_63_0, mut_13_5_63_0, mut_13_6_63_0, mut_13_7_63_0, mut_13_8_63_0,
            mut_13_9_63_0, mut_13_10_63_0, mut_13_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_498
            & and_dcpl_500 & and_dcpl_502 & and_dcpl_504 & and_dcpl_506 & and_dcpl_508
            & and_dcpl_510 & and_dcpl_512 & and_dcpl_514 & and_dcpl_516 & mux_tmp_206));
        rem_13_cmp_6_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_12_2_63_0, mut_12_3_63_0,
            mut_12_4_63_0, mut_12_5_63_0, mut_12_6_63_0, mut_12_7_63_0, mut_12_8_63_0,
            mut_12_9_63_0, mut_12_10_63_0, mut_12_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_498
            & and_dcpl_500 & and_dcpl_502 & and_dcpl_504 & and_dcpl_506 & and_dcpl_508
            & and_dcpl_510 & and_dcpl_512 & and_dcpl_514 & and_dcpl_516 & mux_tmp_206));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1185_cse = '1' ) THEN
        rem_13_cmp_7_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_15_2_63_0, mut_15_3_63_0,
            mut_15_4_63_0, mut_15_5_63_0, mut_15_6_63_0, mut_15_7_63_0, mut_15_8_63_0,
            mut_15_9_63_0, mut_15_10_63_0, mut_15_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_520
            & and_dcpl_523 & and_dcpl_526 & and_dcpl_529 & and_dcpl_532 & and_dcpl_534
            & and_dcpl_536 & and_dcpl_538 & and_dcpl_540 & and_dcpl_542 & and_tmp_170));
        rem_13_cmp_7_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_14_2_63_0, mut_14_3_63_0,
            mut_14_4_63_0, mut_14_5_63_0, mut_14_6_63_0, mut_14_7_63_0, mut_14_8_63_0,
            mut_14_9_63_0, mut_14_10_63_0, mut_14_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_520
            & and_dcpl_523 & and_dcpl_526 & and_dcpl_529 & and_dcpl_532 & and_dcpl_534
            & and_dcpl_536 & and_dcpl_538 & and_dcpl_540 & and_dcpl_542 & and_tmp_170));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1187_cse = '1' ) THEN
        rem_13_cmp_8_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_17_2_63_0, mut_17_3_63_0,
            mut_17_4_63_0, mut_17_5_63_0, mut_17_6_63_0, mut_17_7_63_0, mut_17_8_63_0,
            mut_17_9_63_0, mut_17_10_63_0, mut_17_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_546
            & and_dcpl_548 & and_dcpl_550 & and_dcpl_552 & and_dcpl_554 & and_dcpl_556
            & and_dcpl_558 & and_dcpl_560 & and_dcpl_562 & and_dcpl_564 & mux_tmp_271));
        rem_13_cmp_8_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_16_2_63_0, mut_16_3_63_0,
            mut_16_4_63_0, mut_16_5_63_0, mut_16_6_63_0, mut_16_7_63_0, mut_16_8_63_0,
            mut_16_9_63_0, mut_16_10_63_0, mut_16_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_546
            & and_dcpl_548 & and_dcpl_550 & and_dcpl_552 & and_dcpl_554 & and_dcpl_556
            & and_dcpl_558 & and_dcpl_560 & and_dcpl_562 & and_dcpl_564 & mux_tmp_271));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1189_cse = '1' ) THEN
        rem_13_cmp_9_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_19_2_63_0, mut_19_3_63_0,
            mut_19_4_63_0, mut_19_5_63_0, mut_19_6_63_0, mut_19_7_63_0, mut_19_8_63_0,
            mut_19_9_63_0, mut_19_10_63_0, mut_19_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_569
            & and_dcpl_573 & and_dcpl_577 & and_dcpl_581 & and_dcpl_585 & and_dcpl_589
            & and_dcpl_593 & and_dcpl_597 & and_dcpl_601 & and_dcpl_605 & and_tmp_206));
        rem_13_cmp_9_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_18_2_63_0, mut_18_3_63_0,
            mut_18_4_63_0, mut_18_5_63_0, mut_18_6_63_0, mut_18_7_63_0, mut_18_8_63_0,
            mut_18_9_63_0, mut_18_10_63_0, mut_18_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_569
            & and_dcpl_573 & and_dcpl_577 & and_dcpl_581 & and_dcpl_585 & and_dcpl_589
            & and_dcpl_593 & and_dcpl_597 & and_dcpl_601 & and_dcpl_605 & and_tmp_206));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1191_cse = '1' ) THEN
        rem_13_cmp_10_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_21_2_63_0, mut_21_3_63_0,
            mut_21_4_63_0, mut_21_5_63_0, mut_21_6_63_0, mut_21_7_63_0, mut_21_8_63_0,
            mut_21_9_63_0, mut_21_10_63_0, mut_21_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_610
            & and_dcpl_612 & and_dcpl_614 & and_dcpl_616 & and_dcpl_618 & and_dcpl_622
            & and_dcpl_625 & and_dcpl_628 & and_dcpl_631 & and_dcpl_634 & mux_tmp_354));
        rem_13_cmp_10_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_20_2_63_0,
            mut_20_3_63_0, mut_20_4_63_0, mut_20_5_63_0, mut_20_6_63_0, mut_20_7_63_0,
            mut_20_8_63_0, mut_20_9_63_0, mut_20_10_63_0, mut_20_11_63_0, STD_LOGIC_VECTOR'(
            and_dcpl_610 & and_dcpl_612 & and_dcpl_614 & and_dcpl_616 & and_dcpl_618
            & and_dcpl_622 & and_dcpl_625 & and_dcpl_628 & and_dcpl_631 & and_dcpl_634
            & mux_tmp_354));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1193_cse = '1' ) THEN
        rem_13_cmp_11_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_23_2_63_0, mut_23_3_63_0,
            mut_23_4_63_0, mut_23_5_63_0, mut_23_6_63_0, mut_23_7_63_0, mut_23_8_63_0,
            mut_23_9_63_0, mut_23_10_63_0, mut_23_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_638
            & and_dcpl_641 & and_dcpl_644 & and_dcpl_647 & and_dcpl_650 & and_dcpl_653
            & and_dcpl_657 & and_dcpl_661 & and_dcpl_665 & and_dcpl_669 & and_tmp_233));
        rem_13_cmp_11_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_22_2_63_0,
            mut_22_3_63_0, mut_22_4_63_0, mut_22_5_63_0, mut_22_6_63_0, mut_22_7_63_0,
            mut_22_8_63_0, mut_22_9_63_0, mut_22_10_63_0, mut_22_11_63_0, STD_LOGIC_VECTOR'(
            and_dcpl_638 & and_dcpl_641 & and_dcpl_644 & and_dcpl_647 & and_dcpl_650
            & and_dcpl_653 & and_dcpl_657 & and_dcpl_661 & and_dcpl_665 & and_dcpl_669
            & and_tmp_233));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1195_cse = '1' ) THEN
        rem_13_cmp_b_63_0 <= MUX1HOT_v_64_11_2(m_rsci_idat, mut_1_2_63_0, mut_1_3_63_0,
            mut_1_4_63_0, mut_1_5_63_0, mut_1_6_63_0, mut_1_7_63_0, mut_1_8_63_0,
            mut_1_9_63_0, mut_1_10_63_0, mut_1_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_673
            & and_dcpl_675 & and_dcpl_677 & and_dcpl_679 & and_dcpl_681 & and_dcpl_684
            & and_dcpl_687 & and_dcpl_690 & and_dcpl_693 & and_dcpl_696 & mux_tmp_437));
        rem_13_cmp_a_63_0 <= MUX1HOT_v_64_11_2(base_rsci_idat, mut_2_63_0, mut_3_63_0,
            mut_4_63_0, mut_5_63_0, mut_6_63_0, mut_7_63_0, mut_8_63_0, mut_9_63_0,
            mut_10_63_0, mut_11_63_0, STD_LOGIC_VECTOR'( and_dcpl_673 & and_dcpl_675
            & and_dcpl_677 & and_dcpl_679 & and_dcpl_681 & and_dcpl_684 & and_dcpl_687
            & and_dcpl_690 & and_dcpl_693 & and_dcpl_696 & mux_tmp_437));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1205_cse = '1' ) THEN
        mut_3_11_63_0 <= mut_3_10_63_0;
        mut_2_11_63_0 <= mut_2_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1207_cse = '1' ) THEN
        mut_5_11_63_0 <= mut_5_10_63_0;
        mut_4_11_63_0 <= mut_4_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1209_cse = '1' ) THEN
        mut_7_11_63_0 <= mut_7_10_63_0;
        mut_6_11_63_0 <= mut_6_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1211_cse = '1' ) THEN
        mut_9_11_63_0 <= mut_9_10_63_0;
        mut_8_11_63_0 <= mut_8_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1213_cse = '1' ) THEN
        mut_11_11_63_0 <= mut_11_10_63_0;
        mut_10_11_63_0 <= mut_10_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1215_cse = '1' ) THEN
        mut_13_11_63_0 <= mut_13_10_63_0;
        mut_12_11_63_0 <= mut_12_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1217_cse = '1' ) THEN
        mut_15_11_63_0 <= mut_15_10_63_0;
        mut_14_11_63_0 <= mut_14_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1219_cse = '1' ) THEN
        mut_17_11_63_0 <= mut_17_10_63_0;
        mut_16_11_63_0 <= mut_16_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1221_cse = '1' ) THEN
        mut_19_11_63_0 <= mut_19_10_63_0;
        mut_18_11_63_0 <= mut_18_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1223_cse = '1' ) THEN
        mut_21_11_63_0 <= mut_21_10_63_0;
        mut_20_11_63_0 <= mut_20_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1225_cse = '1' ) THEN
        mut_23_11_63_0 <= mut_23_10_63_0;
        mut_22_11_63_0 <= mut_22_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1227_cse = '1' ) THEN
        mut_1_11_63_0 <= mut_1_10_63_0;
        mut_11_63_0 <= mut_10_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_11_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_11_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1229_cse = '1' ) THEN
        rem_12cyc_st_11_3_2 <= rem_12cyc_st_10_3_2;
        rem_12cyc_st_11_1_0 <= rem_12cyc_st_10_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1231_cse = '1' ) THEN
        mut_3_10_63_0 <= mut_3_9_63_0;
        mut_2_10_63_0 <= mut_2_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1233_cse = '1' ) THEN
        mut_5_10_63_0 <= mut_5_9_63_0;
        mut_4_10_63_0 <= mut_4_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1235_cse = '1' ) THEN
        mut_7_10_63_0 <= mut_7_9_63_0;
        mut_6_10_63_0 <= mut_6_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1237_cse = '1' ) THEN
        mut_9_10_63_0 <= mut_9_9_63_0;
        mut_8_10_63_0 <= mut_8_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1239_cse = '1' ) THEN
        mut_11_10_63_0 <= mut_11_9_63_0;
        mut_10_10_63_0 <= mut_10_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1241_cse = '1' ) THEN
        mut_13_10_63_0 <= mut_13_9_63_0;
        mut_12_10_63_0 <= mut_12_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1243_cse = '1' ) THEN
        mut_15_10_63_0 <= mut_15_9_63_0;
        mut_14_10_63_0 <= mut_14_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1245_cse = '1' ) THEN
        mut_17_10_63_0 <= mut_17_9_63_0;
        mut_16_10_63_0 <= mut_16_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1247_cse = '1' ) THEN
        mut_19_10_63_0 <= mut_19_9_63_0;
        mut_18_10_63_0 <= mut_18_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1249_cse = '1' ) THEN
        mut_21_10_63_0 <= mut_21_9_63_0;
        mut_20_10_63_0 <= mut_20_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1251_cse = '1' ) THEN
        mut_23_10_63_0 <= mut_23_9_63_0;
        mut_22_10_63_0 <= mut_22_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1253_cse = '1' ) THEN
        mut_1_10_63_0 <= mut_1_9_63_0;
        mut_10_63_0 <= mut_9_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_10_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_10_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1255_cse = '1' ) THEN
        rem_12cyc_st_10_3_2 <= rem_12cyc_st_9_3_2;
        rem_12cyc_st_10_1_0 <= rem_12cyc_st_9_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1257_cse = '1' ) THEN
        mut_3_9_63_0 <= mut_3_8_63_0;
        mut_2_9_63_0 <= mut_2_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1259_cse = '1' ) THEN
        mut_5_9_63_0 <= mut_5_8_63_0;
        mut_4_9_63_0 <= mut_4_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1261_cse = '1' ) THEN
        mut_7_9_63_0 <= mut_7_8_63_0;
        mut_6_9_63_0 <= mut_6_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1263_cse = '1' ) THEN
        mut_9_9_63_0 <= mut_9_8_63_0;
        mut_8_9_63_0 <= mut_8_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1265_cse = '1' ) THEN
        mut_11_9_63_0 <= mut_11_8_63_0;
        mut_10_9_63_0 <= mut_10_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1267_cse = '1' ) THEN
        mut_13_9_63_0 <= mut_13_8_63_0;
        mut_12_9_63_0 <= mut_12_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1269_cse = '1' ) THEN
        mut_15_9_63_0 <= mut_15_8_63_0;
        mut_14_9_63_0 <= mut_14_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1271_cse = '1' ) THEN
        mut_17_9_63_0 <= mut_17_8_63_0;
        mut_16_9_63_0 <= mut_16_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1273_cse = '1' ) THEN
        mut_19_9_63_0 <= mut_19_8_63_0;
        mut_18_9_63_0 <= mut_18_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1275_cse = '1' ) THEN
        mut_21_9_63_0 <= mut_21_8_63_0;
        mut_20_9_63_0 <= mut_20_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1277_cse = '1' ) THEN
        mut_23_9_63_0 <= mut_23_8_63_0;
        mut_22_9_63_0 <= mut_22_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1279_cse = '1' ) THEN
        mut_1_9_63_0 <= mut_1_8_63_0;
        mut_9_63_0 <= mut_8_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_9_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_9_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1281_cse = '1' ) THEN
        rem_12cyc_st_9_3_2 <= rem_12cyc_st_8_3_2;
        rem_12cyc_st_9_1_0 <= rem_12cyc_st_8_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1283_cse = '1' ) THEN
        mut_3_8_63_0 <= mut_3_7_63_0;
        mut_2_8_63_0 <= mut_2_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1285_cse = '1' ) THEN
        mut_5_8_63_0 <= mut_5_7_63_0;
        mut_4_8_63_0 <= mut_4_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1287_cse = '1' ) THEN
        mut_7_8_63_0 <= mut_7_7_63_0;
        mut_6_8_63_0 <= mut_6_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1289_cse = '1' ) THEN
        mut_9_8_63_0 <= mut_9_7_63_0;
        mut_8_8_63_0 <= mut_8_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1291_cse = '1' ) THEN
        mut_11_8_63_0 <= mut_11_7_63_0;
        mut_10_8_63_0 <= mut_10_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1293_cse = '1' ) THEN
        mut_13_8_63_0 <= mut_13_7_63_0;
        mut_12_8_63_0 <= mut_12_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1295_cse = '1' ) THEN
        mut_15_8_63_0 <= mut_15_7_63_0;
        mut_14_8_63_0 <= mut_14_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1297_cse = '1' ) THEN
        mut_17_8_63_0 <= mut_17_7_63_0;
        mut_16_8_63_0 <= mut_16_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1299_cse = '1' ) THEN
        mut_19_8_63_0 <= mut_19_7_63_0;
        mut_18_8_63_0 <= mut_18_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1301_cse = '1' ) THEN
        mut_21_8_63_0 <= mut_21_7_63_0;
        mut_20_8_63_0 <= mut_20_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1303_cse = '1' ) THEN
        mut_23_8_63_0 <= mut_23_7_63_0;
        mut_22_8_63_0 <= mut_22_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1305_cse = '1' ) THEN
        mut_1_8_63_0 <= mut_1_7_63_0;
        mut_8_63_0 <= mut_7_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_8_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_8_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1307_cse = '1' ) THEN
        rem_12cyc_st_8_3_2 <= rem_12cyc_st_7_3_2;
        rem_12cyc_st_8_1_0 <= rem_12cyc_st_7_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1309_cse = '1' ) THEN
        mut_3_7_63_0 <= mut_3_6_63_0;
        mut_2_7_63_0 <= mut_2_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1311_cse = '1' ) THEN
        mut_5_7_63_0 <= mut_5_6_63_0;
        mut_4_7_63_0 <= mut_4_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1313_cse = '1' ) THEN
        mut_7_7_63_0 <= mut_7_6_63_0;
        mut_6_7_63_0 <= mut_6_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1315_cse = '1' ) THEN
        mut_9_7_63_0 <= mut_9_6_63_0;
        mut_8_7_63_0 <= mut_8_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1317_cse = '1' ) THEN
        mut_11_7_63_0 <= mut_11_6_63_0;
        mut_10_7_63_0 <= mut_10_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1319_cse = '1' ) THEN
        mut_13_7_63_0 <= mut_13_6_63_0;
        mut_12_7_63_0 <= mut_12_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1321_cse = '1' ) THEN
        mut_15_7_63_0 <= mut_15_6_63_0;
        mut_14_7_63_0 <= mut_14_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1323_cse = '1' ) THEN
        mut_17_7_63_0 <= mut_17_6_63_0;
        mut_16_7_63_0 <= mut_16_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1325_cse = '1' ) THEN
        mut_19_7_63_0 <= mut_19_6_63_0;
        mut_18_7_63_0 <= mut_18_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1327_cse = '1' ) THEN
        mut_21_7_63_0 <= mut_21_6_63_0;
        mut_20_7_63_0 <= mut_20_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1329_cse = '1' ) THEN
        mut_23_7_63_0 <= mut_23_6_63_0;
        mut_22_7_63_0 <= mut_22_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1331_cse = '1' ) THEN
        mut_1_7_63_0 <= mut_1_6_63_0;
        mut_7_63_0 <= mut_6_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_7_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_7_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1333_cse = '1' ) THEN
        rem_12cyc_st_7_3_2 <= rem_12cyc_st_6_3_2;
        rem_12cyc_st_7_1_0 <= rem_12cyc_st_6_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1335_cse = '1' ) THEN
        mut_3_6_63_0 <= mut_3_5_63_0;
        mut_2_6_63_0 <= mut_2_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1337_cse = '1' ) THEN
        mut_5_6_63_0 <= mut_5_5_63_0;
        mut_4_6_63_0 <= mut_4_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1339_cse = '1' ) THEN
        mut_7_6_63_0 <= mut_7_5_63_0;
        mut_6_6_63_0 <= mut_6_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1341_cse = '1' ) THEN
        mut_9_6_63_0 <= mut_9_5_63_0;
        mut_8_6_63_0 <= mut_8_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1343_cse = '1' ) THEN
        mut_11_6_63_0 <= mut_11_5_63_0;
        mut_10_6_63_0 <= mut_10_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1345_cse = '1' ) THEN
        mut_13_6_63_0 <= mut_13_5_63_0;
        mut_12_6_63_0 <= mut_12_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1347_cse = '1' ) THEN
        mut_15_6_63_0 <= mut_15_5_63_0;
        mut_14_6_63_0 <= mut_14_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1349_cse = '1' ) THEN
        mut_17_6_63_0 <= mut_17_5_63_0;
        mut_16_6_63_0 <= mut_16_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1351_cse = '1' ) THEN
        mut_19_6_63_0 <= mut_19_5_63_0;
        mut_18_6_63_0 <= mut_18_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1353_cse = '1' ) THEN
        mut_21_6_63_0 <= mut_21_5_63_0;
        mut_20_6_63_0 <= mut_20_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1355_cse = '1' ) THEN
        mut_23_6_63_0 <= mut_23_5_63_0;
        mut_22_6_63_0 <= mut_22_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1357_cse = '1' ) THEN
        mut_1_6_63_0 <= mut_1_5_63_0;
        mut_6_63_0 <= mut_5_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1359_cse = '1' ) THEN
        m_buf_sva_6 <= m_buf_sva_5;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_6_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_6_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1359_cse = '1' ) THEN
        rem_12cyc_st_6_3_2 <= rem_12cyc_st_5_3_2;
        rem_12cyc_st_6_1_0 <= rem_12cyc_st_5_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1361_cse = '1' ) THEN
        mut_3_5_63_0 <= mut_3_4_63_0;
        mut_2_5_63_0 <= mut_2_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1363_cse = '1' ) THEN
        mut_5_5_63_0 <= mut_5_4_63_0;
        mut_4_5_63_0 <= mut_4_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1365_cse = '1' ) THEN
        mut_7_5_63_0 <= mut_7_4_63_0;
        mut_6_5_63_0 <= mut_6_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1367_cse = '1' ) THEN
        mut_9_5_63_0 <= mut_9_4_63_0;
        mut_8_5_63_0 <= mut_8_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1369_cse = '1' ) THEN
        mut_11_5_63_0 <= mut_11_4_63_0;
        mut_10_5_63_0 <= mut_10_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1371_cse = '1' ) THEN
        mut_13_5_63_0 <= mut_13_4_63_0;
        mut_12_5_63_0 <= mut_12_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1373_cse = '1' ) THEN
        mut_15_5_63_0 <= mut_15_4_63_0;
        mut_14_5_63_0 <= mut_14_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1375_cse = '1' ) THEN
        mut_17_5_63_0 <= mut_17_4_63_0;
        mut_16_5_63_0 <= mut_16_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1377_cse = '1' ) THEN
        mut_19_5_63_0 <= mut_19_4_63_0;
        mut_18_5_63_0 <= mut_18_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1379_cse = '1' ) THEN
        mut_21_5_63_0 <= mut_21_4_63_0;
        mut_20_5_63_0 <= mut_20_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1381_cse = '1' ) THEN
        mut_23_5_63_0 <= mut_23_4_63_0;
        mut_22_5_63_0 <= mut_22_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1383_cse = '1' ) THEN
        mut_1_5_63_0 <= mut_1_4_63_0;
        mut_5_63_0 <= mut_4_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1385_cse = '1' ) THEN
        m_buf_sva_5 <= m_buf_sva_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_5_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_5_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1385_cse = '1' ) THEN
        rem_12cyc_st_5_3_2 <= rem_12cyc_st_4_3_2;
        rem_12cyc_st_5_1_0 <= rem_12cyc_st_4_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1387_cse = '1' ) THEN
        mut_3_4_63_0 <= mut_3_3_63_0;
        mut_2_4_63_0 <= mut_2_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1389_cse = '1' ) THEN
        mut_5_4_63_0 <= mut_5_3_63_0;
        mut_4_4_63_0 <= mut_4_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1391_cse = '1' ) THEN
        mut_7_4_63_0 <= mut_7_3_63_0;
        mut_6_4_63_0 <= mut_6_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1393_cse = '1' ) THEN
        mut_9_4_63_0 <= mut_9_3_63_0;
        mut_8_4_63_0 <= mut_8_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1395_cse = '1' ) THEN
        mut_11_4_63_0 <= mut_11_3_63_0;
        mut_10_4_63_0 <= mut_10_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1397_cse = '1' ) THEN
        mut_13_4_63_0 <= mut_13_3_63_0;
        mut_12_4_63_0 <= mut_12_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1399_cse = '1' ) THEN
        mut_15_4_63_0 <= mut_15_3_63_0;
        mut_14_4_63_0 <= mut_14_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1401_cse = '1' ) THEN
        mut_17_4_63_0 <= mut_17_3_63_0;
        mut_16_4_63_0 <= mut_16_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1403_cse = '1' ) THEN
        mut_19_4_63_0 <= mut_19_3_63_0;
        mut_18_4_63_0 <= mut_18_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1405_cse = '1' ) THEN
        mut_21_4_63_0 <= mut_21_3_63_0;
        mut_20_4_63_0 <= mut_20_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1407_cse = '1' ) THEN
        mut_23_4_63_0 <= mut_23_3_63_0;
        mut_22_4_63_0 <= mut_22_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1409_cse = '1' ) THEN
        mut_1_4_63_0 <= mut_1_3_63_0;
        mut_4_63_0 <= mut_3_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1411_cse = '1' ) THEN
        m_buf_sva_4 <= m_buf_sva_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_4_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_4_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1411_cse = '1' ) THEN
        rem_12cyc_st_4_3_2 <= rem_12cyc_st_3_3_2;
        rem_12cyc_st_4_1_0 <= rem_12cyc_st_3_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1413_cse = '1' ) THEN
        mut_3_3_63_0 <= mut_3_2_63_0;
        mut_2_3_63_0 <= mut_2_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1415_cse = '1' ) THEN
        mut_5_3_63_0 <= mut_5_2_63_0;
        mut_4_3_63_0 <= mut_4_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1417_cse = '1' ) THEN
        mut_7_3_63_0 <= mut_7_2_63_0;
        mut_6_3_63_0 <= mut_6_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1419_cse = '1' ) THEN
        mut_9_3_63_0 <= mut_9_2_63_0;
        mut_8_3_63_0 <= mut_8_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1421_cse = '1' ) THEN
        mut_11_3_63_0 <= mut_11_2_63_0;
        mut_10_3_63_0 <= mut_10_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1423_cse = '1' ) THEN
        mut_13_3_63_0 <= mut_13_2_63_0;
        mut_12_3_63_0 <= mut_12_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1425_cse = '1' ) THEN
        mut_15_3_63_0 <= mut_15_2_63_0;
        mut_14_3_63_0 <= mut_14_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1427_cse = '1' ) THEN
        mut_17_3_63_0 <= mut_17_2_63_0;
        mut_16_3_63_0 <= mut_16_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1429_cse = '1' ) THEN
        mut_19_3_63_0 <= mut_19_2_63_0;
        mut_18_3_63_0 <= mut_18_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1431_cse = '1' ) THEN
        mut_21_3_63_0 <= mut_21_2_63_0;
        mut_20_3_63_0 <= mut_20_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1433_cse = '1' ) THEN
        mut_23_3_63_0 <= mut_23_2_63_0;
        mut_22_3_63_0 <= mut_22_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1435_cse = '1' ) THEN
        mut_1_3_63_0 <= mut_1_2_63_0;
        mut_3_63_0 <= mut_2_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1437_cse = '1' ) THEN
        m_buf_sva_3 <= m_buf_sva_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_3_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_3_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1437_cse = '1' ) THEN
        rem_12cyc_st_3_3_2 <= rem_12cyc_st_2_3_2;
        rem_12cyc_st_3_1_0 <= rem_12cyc_st_2_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1439_cse = '1' ) THEN
        mut_3_2_63_0 <= rem_13_cmp_1_b_63_0;
        mut_2_2_63_0 <= rem_13_cmp_1_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1441_cse = '1' ) THEN
        mut_5_2_63_0 <= rem_13_cmp_2_b_63_0;
        mut_4_2_63_0 <= rem_13_cmp_2_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1443_cse = '1' ) THEN
        mut_7_2_63_0 <= rem_13_cmp_3_b_63_0;
        mut_6_2_63_0 <= rem_13_cmp_3_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1445_cse = '1' ) THEN
        mut_9_2_63_0 <= rem_13_cmp_4_b_63_0;
        mut_8_2_63_0 <= rem_13_cmp_4_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1447_cse = '1' ) THEN
        mut_11_2_63_0 <= rem_13_cmp_5_b_63_0;
        mut_10_2_63_0 <= rem_13_cmp_5_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1449_cse = '1' ) THEN
        mut_13_2_63_0 <= rem_13_cmp_6_b_63_0;
        mut_12_2_63_0 <= rem_13_cmp_6_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1451_cse = '1' ) THEN
        mut_15_2_63_0 <= rem_13_cmp_7_b_63_0;
        mut_14_2_63_0 <= rem_13_cmp_7_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1453_cse = '1' ) THEN
        mut_17_2_63_0 <= rem_13_cmp_8_b_63_0;
        mut_16_2_63_0 <= rem_13_cmp_8_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1455_cse = '1' ) THEN
        mut_19_2_63_0 <= rem_13_cmp_9_b_63_0;
        mut_18_2_63_0 <= rem_13_cmp_9_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1457_cse = '1' ) THEN
        mut_21_2_63_0 <= rem_13_cmp_10_b_63_0;
        mut_20_2_63_0 <= rem_13_cmp_10_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1459_cse = '1' ) THEN
        mut_23_2_63_0 <= rem_13_cmp_11_b_63_0;
        mut_22_2_63_0 <= rem_13_cmp_11_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1461_cse = '1' ) THEN
        mut_1_2_63_0 <= rem_13_cmp_b_63_0;
        mut_2_63_0 <= rem_13_cmp_a_63_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1463_cse = '1' ) THEN
        m_buf_sva_2 <= m_buf_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_st_2_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_st_2_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1463_cse = '1' ) THEN
        rem_12cyc_st_2_3_2 <= rem_12cyc_3_2;
        rem_12cyc_st_2_1_0 <= rem_12cyc_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF ( and_1197_cse = '1' ) THEN
        m_buf_sva_1 <= m_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (ccs_ccore_clk)
  BEGIN
    IF ccs_ccore_clk'EVENT AND ( ccs_ccore_clk = '1' ) THEN
      IF (ccs_ccore_srst = '1') THEN
        rem_12cyc_3_2 <= STD_LOGIC_VECTOR'( "00");
        rem_12cyc_1_0 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_1197_cse = '1' ) THEN
        rem_12cyc_3_2 <= acc_tmp;
        rem_12cyc_1_0 <= acc_1_tmp(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  qelse_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(result_sva_duc_mx0) + UNSIGNED(m_buf_sva_12),
      64));
  mux_10_nl <= MUX_s_1_2_2((rem_13_cmp_1_z(63)), (rem_13_cmp_3_z(63)), rem_12cyc_st_12_1_0(1));
  mux_9_nl <= MUX_s_1_2_2((rem_13_cmp_2_z(63)), (rem_13_cmp_4_z(63)), rem_12cyc_st_12_1_0(1));
  mux_11_nl <= MUX_s_1_2_2(mux_10_nl, mux_9_nl, rem_12cyc_st_12_1_0(0));
  mux_7_nl <= MUX_s_1_2_2((rem_13_cmp_9_z(63)), (rem_13_cmp_11_z(63)), rem_12cyc_st_12_1_0(1));
  mux_6_nl <= MUX_s_1_2_2((rem_13_cmp_10_z(63)), (rem_13_cmp_z(63)), rem_12cyc_st_12_1_0(1));
  mux_8_nl <= MUX_s_1_2_2(mux_7_nl, mux_6_nl, rem_12cyc_st_12_1_0(0));
  mux_12_nl <= MUX_s_1_2_2(mux_11_nl, mux_8_nl, rem_12cyc_st_12_3_2(1));
  mux_3_nl <= MUX_s_1_2_2((rem_13_cmp_5_z(63)), (rem_13_cmp_7_z(63)), rem_12cyc_st_12_1_0(1));
  mux_2_nl <= MUX_s_1_2_2((rem_13_cmp_6_z(63)), (rem_13_cmp_8_z(63)), rem_12cyc_st_12_1_0(1));
  mux_4_nl <= MUX_s_1_2_2(mux_3_nl, mux_2_nl, rem_12cyc_st_12_1_0(0));
  mux_5_nl <= MUX_s_1_2_2(mux_4_nl, (result_sva_duc(63)), rem_12cyc_st_12_3_2(1));
  mux_13_nl <= MUX_s_1_2_2(mux_12_nl, mux_5_nl, rem_12cyc_st_12_3_2(0));
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
--  Generated date: Thu Jul 29 10:40:40 2021
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen
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
END stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen;

ARCHITECTURE v1 OF stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  clken <= (clken_d);
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    q_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    readA_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen;

ARCHITECTURE v1 OF stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.mgc_comps.ALL;
USE work.mgc_shift_comps_v5.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
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
END stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen;

ARCHITECTURE v1 OF stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  radr <= (radr_d);
  we <= (writeA_w_ram_ir_internal_WMASK_B_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v1;

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
    fsm_output : OUT STD_LOGIC_VECTOR (40 DOWNTO 0);
    INNER_LOOP_C_36_tr0 : IN STD_LOGIC;
    OUTER_LOOP_C_1_tr0 : IN STD_LOGIC
  );
END stockham_DIT_core_core_fsm;

ARCHITECTURE v1 OF stockham_DIT_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for stockham_DIT_core_core_fsm_1
  TYPE stockham_DIT_core_core_fsm_1_ST IS (main_C_0, OUTER_LOOP_C_0, INNER_LOOP_C_0,
      INNER_LOOP_C_1, INNER_LOOP_C_2, INNER_LOOP_C_3, INNER_LOOP_C_4, INNER_LOOP_C_5,
      INNER_LOOP_C_6, INNER_LOOP_C_7, INNER_LOOP_C_8, INNER_LOOP_C_9, INNER_LOOP_C_10,
      INNER_LOOP_C_11, INNER_LOOP_C_12, INNER_LOOP_C_13, INNER_LOOP_C_14, INNER_LOOP_C_15,
      INNER_LOOP_C_16, INNER_LOOP_C_17, INNER_LOOP_C_18, INNER_LOOP_C_19, INNER_LOOP_C_20,
      INNER_LOOP_C_21, INNER_LOOP_C_22, INNER_LOOP_C_23, INNER_LOOP_C_24, INNER_LOOP_C_25,
      INNER_LOOP_C_26, INNER_LOOP_C_27, INNER_LOOP_C_28, INNER_LOOP_C_29, INNER_LOOP_C_30,
      INNER_LOOP_C_31, INNER_LOOP_C_32, INNER_LOOP_C_33, INNER_LOOP_C_34, INNER_LOOP_C_35,
      INNER_LOOP_C_36, OUTER_LOOP_C_1, main_C_1);

  SIGNAL state_var : stockham_DIT_core_core_fsm_1_ST;
  SIGNAL state_var_NS : stockham_DIT_core_core_fsm_1_ST;

BEGIN
  stockham_DIT_core_core_fsm_1 : PROCESS (INNER_LOOP_C_36_tr0, OUTER_LOOP_C_1_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN OUTER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000010");
        state_var_NS <= INNER_LOOP_C_0;
      WHEN INNER_LOOP_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000100");
        state_var_NS <= INNER_LOOP_C_1;
      WHEN INNER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000001000");
        state_var_NS <= INNER_LOOP_C_2;
      WHEN INNER_LOOP_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000010000");
        state_var_NS <= INNER_LOOP_C_3;
      WHEN INNER_LOOP_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000100000");
        state_var_NS <= INNER_LOOP_C_4;
      WHEN INNER_LOOP_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000001000000");
        state_var_NS <= INNER_LOOP_C_5;
      WHEN INNER_LOOP_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000010000000");
        state_var_NS <= INNER_LOOP_C_6;
      WHEN INNER_LOOP_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000100000000");
        state_var_NS <= INNER_LOOP_C_7;
      WHEN INNER_LOOP_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000001000000000");
        state_var_NS <= INNER_LOOP_C_8;
      WHEN INNER_LOOP_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000010000000000");
        state_var_NS <= INNER_LOOP_C_9;
      WHEN INNER_LOOP_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000100000000000");
        state_var_NS <= INNER_LOOP_C_10;
      WHEN INNER_LOOP_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000001000000000000");
        state_var_NS <= INNER_LOOP_C_11;
      WHEN INNER_LOOP_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000010000000000000");
        state_var_NS <= INNER_LOOP_C_12;
      WHEN INNER_LOOP_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000100000000000000");
        state_var_NS <= INNER_LOOP_C_13;
      WHEN INNER_LOOP_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000001000000000000000");
        state_var_NS <= INNER_LOOP_C_14;
      WHEN INNER_LOOP_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000010000000000000000");
        state_var_NS <= INNER_LOOP_C_15;
      WHEN INNER_LOOP_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000100000000000000000");
        state_var_NS <= INNER_LOOP_C_16;
      WHEN INNER_LOOP_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000001000000000000000000");
        state_var_NS <= INNER_LOOP_C_17;
      WHEN INNER_LOOP_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000010000000000000000000");
        state_var_NS <= INNER_LOOP_C_18;
      WHEN INNER_LOOP_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000100000000000000000000");
        state_var_NS <= INNER_LOOP_C_19;
      WHEN INNER_LOOP_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000001000000000000000000000");
        state_var_NS <= INNER_LOOP_C_20;
      WHEN INNER_LOOP_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000010000000000000000000000");
        state_var_NS <= INNER_LOOP_C_21;
      WHEN INNER_LOOP_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000100000000000000000000000");
        state_var_NS <= INNER_LOOP_C_22;
      WHEN INNER_LOOP_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000001000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_23;
      WHEN INNER_LOOP_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000010000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_24;
      WHEN INNER_LOOP_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000100000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_25;
      WHEN INNER_LOOP_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000001000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_26;
      WHEN INNER_LOOP_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000010000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_27;
      WHEN INNER_LOOP_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000100000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_28;
      WHEN INNER_LOOP_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000001000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_29;
      WHEN INNER_LOOP_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000010000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_30;
      WHEN INNER_LOOP_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000100000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_31;
      WHEN INNER_LOOP_C_31 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001000000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_32;
      WHEN INNER_LOOP_C_32 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010000000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_33;
      WHEN INNER_LOOP_C_33 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100000000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_34;
      WHEN INNER_LOOP_C_34 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000000000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_35;
      WHEN INNER_LOOP_C_35 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000000000000000000000000000000000000");
        state_var_NS <= INNER_LOOP_C_36;
      WHEN INNER_LOOP_C_36 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000000000000000000000000000000000000");
        IF ( INNER_LOOP_C_36_tr0 = '1' ) THEN
          state_var_NS <= OUTER_LOOP_C_1;
        ELSE
          state_var_NS <= INNER_LOOP_C_0;
        END IF;
      WHEN OUTER_LOOP_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000000000000000000000000000000000000");
        IF ( OUTER_LOOP_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= OUTER_LOOP_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000000000000000000000000000000000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000001");
        state_var_NS <= OUTER_LOOP_C_0;
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

END v1;

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
    yt_rsc_cgo_iro : IN STD_LOGIC;
    yt_rsci_clken_d : OUT STD_LOGIC;
    ensig_cgo_iro : IN STD_LOGIC;
    yt_rsc_cgo : IN STD_LOGIC;
    ensig_cgo : IN STD_LOGIC;
    modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
  );
END stockham_DIT_core_wait_dp;

ARCHITECTURE v1 OF stockham_DIT_core_wait_dp IS
  -- Default Constants

BEGIN
  yt_rsci_clken_d <= yt_rsc_cgo OR yt_rsc_cgo_iro;
  modulo_dev_cmp_ccs_ccore_en <= ensig_cgo OR ensig_cgo_iro;
END v1;

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
    xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    yt_rsci_clken_d : OUT STD_LOGIC;
    yt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
    xt_rsci_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsci_wadr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsci_we_d_pff : OUT STD_LOGIC;
    yt_rsci_we_d_pff : OUT STD_LOGIC
  );
END stockham_DIT_core;

ARCHITECTURE v1 OF stockham_DIT_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL p_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_return_rsc_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL modulo_dev_cmp_ccs_ccore_en : STD_LOGIC;
  SIGNAL INNER_LOOP_b_rem_cmp_a : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_z : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (40 DOWNTO 0);
  SIGNAL and_dcpl_5 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_21 : STD_LOGIC;
  SIGNAL or_tmp_46 : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_5 : STD_LOGIC;
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_and_7 : STD_LOGIC;
  SIGNAL INNER_LOOP_t_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL x_3_sva : STD_LOGIC;
  SIGNAL x_1_sva : STD_LOGIC;
  SIGNAL y_3_sva : STD_LOGIC;
  SIGNAL y_1_sva : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_or_cse : STD_LOGIC;
  SIGNAL reg_yt_rsc_cgo_cse : STD_LOGIC;
  SIGNAL reg_xt_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL reg_ensig_cgo_cse : STD_LOGIC;
  SIGNAL reg_modulo_dev_cmp_m_rsc_dat_cse : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL or_98_rmff : STD_LOGIC;
  SIGNAL or_103_rmff : STD_LOGIC;
  SIGNAL INNER_LOOP_a_lpi_3_dfm : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_upper_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_q_and_psp_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL s_9_sva : STD_LOGIC;
  SIGNAL s_8_sva : STD_LOGIC;
  SIGNAL s_7_sva : STD_LOGIC;
  SIGNAL s_6_sva : STD_LOGIC;
  SIGNAL s_5_sva : STD_LOGIC;
  SIGNAL s_4_sva : STD_LOGIC;
  SIGNAL s_3_sva : STD_LOGIC;
  SIGNAL s_2_sva : STD_LOGIC;
  SIGNAL s_1_sva : STD_LOGIC;
  SIGNAL s_0_sva : STD_LOGIC;
  SIGNAL INNER_LOOP_a_acc_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm : STD_LOGIC;
  SIGNAL pref_x_idx_pref_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pref_x_idx_pref_1_9_0_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL OUTER_LOOP_acc_2_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL p_sva : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL drf_y_smx_lpi_2 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL OUTER_LOOP_nn_3_0_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL OUTER_LOOP_m_lshift_psp_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_b_mul_mut : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_b_nor_itm : STD_LOGIC;
  SIGNAL OUTER_LOOP_nn_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL drf_y_smx_lpi_3_dfm_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL pref_x_idx_pref_9_0_sva_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL INNER_LOOP_upper_acc_cse_sva_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_lpi_3_dfm_mx0c0 : STD_LOGIC;
  SIGNAL INNER_LOOP_a_lpi_3_dfm_mx0c1 : STD_LOGIC;
  SIGNAL and_165_rgt : STD_LOGIC;
  SIGNAL xor_3_cse : STD_LOGIC;
  SIGNAL OUTER_LOOP_or_1_seb : STD_LOGIC;

  SIGNAL s_mux_5_nl : STD_LOGIC;
  SIGNAL or_106_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_t_mux_1_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_a_or_1_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_acc_5_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_INNER_LOOP_b_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL INNER_LOOP_b_acc_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL OUTER_LOOP_OUTER_LOOP_and_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL OUTER_LOOP_nor_1_nl : STD_LOGIC;
  SIGNAL OUTER_LOOP_mux1h_3_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL OUTER_LOOP_OUTER_LOOP_or_1_nl : STD_LOGIC;
  SIGNAL INNER_LOOP_mux_3_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_mux_4_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
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

  SIGNAL INNER_LOOP_b_rem_cmp_a_1 : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_b : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL INNER_LOOP_b_rem_cmp_z_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL INNER_LOOP_w_rshift_rg_a : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_w_rshift_rg_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL INNER_LOOP_w_lshift_rg_a : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL INNER_LOOP_w_lshift_rg_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL INNER_LOOP_w_lshift_rg_z : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_core_wait_dp
    PORT(
      yt_rsc_cgo_iro : IN STD_LOGIC;
      yt_rsci_clken_d : OUT STD_LOGIC;
      ensig_cgo_iro : IN STD_LOGIC;
      yt_rsc_cgo : IN STD_LOGIC;
      ensig_cgo : IN STD_LOGIC;
      modulo_dev_cmp_ccs_ccore_en : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT stockham_DIT_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (40 DOWNTO 0);
      INNER_LOOP_C_36_tr0 : IN STD_LOGIC;
      OUTER_LOOP_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_DIT_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (40 DOWNTO
      0);
  SIGNAL stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_36_tr0 : STD_LOGIC;
  SIGNAL stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_1_tr0 : STD_LOGIC;

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_4_4_2(input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

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
      rscid => 5,
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
  modulo_dev_cmp_base_rsc_dat <= MUX_v_64_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(INNER_LOOP_a_lpi_3_dfm)
      + SIGNED(INNER_LOOP_b_sva), 64)), INNER_LOOP_a_lpi_3_dfm, fsm_output(24));
  modulo_dev_cmp_m_rsc_dat <= p_sva;
  modulo_dev_cmp_return_rsc_z <= modulo_dev_cmp_return_rsc_z_1;
  modulo_dev_cmp_ccs_ccore_start_rsc_dat <= CONV_SL_1_1(fsm_output(24 DOWNTO 23)/=STD_LOGIC_VECTOR'("00"));

  INNER_LOOP_b_rem_cmp : work.mgc_comps.mgc_rem
    GENERIC MAP(
      width_a => 128,
      width_b => 64,
      signd => 0
      )
    PORT MAP(
      a => INNER_LOOP_b_rem_cmp_a_1,
      b => INNER_LOOP_b_rem_cmp_b,
      z => INNER_LOOP_b_rem_cmp_z_1
    );
  INNER_LOOP_b_rem_cmp_a_1 <= INNER_LOOP_b_rem_cmp_a;
  INNER_LOOP_b_rem_cmp_b <= reg_modulo_dev_cmp_m_rsc_dat_cse;
  INNER_LOOP_b_rem_cmp_z <= INNER_LOOP_b_rem_cmp_z_1;

  INNER_LOOP_w_rshift_rg : work.mgc_shift_comps_v5.mgc_shift_r_v5
    GENERIC MAP(
      width_a => 9,
      signd_a => 0,
      width_s => 4,
      width_z => 8
      )
    PORT MAP(
      a => INNER_LOOP_w_rshift_rg_a,
      s => INNER_LOOP_w_rshift_rg_s,
      z => INNER_LOOP_w_rshift_rg_z
    );
  INNER_LOOP_w_rshift_rg_a <= INNER_LOOP_upper_and_psp_sva_1;
  INNER_LOOP_w_rshift_rg_s <= OUTER_LOOP_acc_2_itm;
  INNER_LOOP_w_rshift_itm <= INNER_LOOP_w_rshift_rg_z;

  INNER_LOOP_w_lshift_rg : work.mgc_shift_comps_v5.mgc_shift_l_v5
    GENERIC MAP(
      width_a => 8,
      signd_a => 0,
      width_s => 4,
      width_z => 10
      )
    PORT MAP(
      a => INNER_LOOP_w_lshift_rg_a,
      s => INNER_LOOP_w_lshift_rg_s,
      z => INNER_LOOP_w_lshift_rg_z
    );
  INNER_LOOP_w_lshift_rg_a <= MUX_v_8_2_2(STD_LOGIC_VECTOR'( "00000001"), INNER_LOOP_w_rshift_itm,
      fsm_output(2));
  INNER_LOOP_w_lshift_rg_s <= MUX_v_4_2_2((z_out(3 DOWNTO 0)), OUTER_LOOP_acc_2_itm,
      fsm_output(2));
  z_out_1 <= INNER_LOOP_w_lshift_rg_z;

  stockham_DIT_core_wait_dp_inst : stockham_DIT_core_wait_dp
    PORT MAP(
      yt_rsc_cgo_iro => or_98_rmff,
      yt_rsci_clken_d => yt_rsci_clken_d,
      ensig_cgo_iro => or_103_rmff,
      yt_rsc_cgo => reg_yt_rsc_cgo_cse,
      ensig_cgo => reg_ensig_cgo_cse,
      modulo_dev_cmp_ccs_ccore_en => modulo_dev_cmp_ccs_ccore_en
    );
  stockham_DIT_core_core_fsm_inst : stockham_DIT_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => stockham_DIT_core_core_fsm_inst_fsm_output,
      INNER_LOOP_C_36_tr0 => stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_36_tr0,
      OUTER_LOOP_C_1_tr0 => stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_1_tr0
    );
  fsm_output <= stockham_DIT_core_core_fsm_inst_fsm_output;
  stockham_DIT_core_core_fsm_inst_INNER_LOOP_C_36_tr0 <= INNER_LOOP_t_9_0_sva_1(9);
  stockham_DIT_core_core_fsm_inst_OUTER_LOOP_C_1_tr0 <= NOT (z_out(2));

  OUTER_LOOP_nn_or_cse <= (fsm_output(39)) OR (fsm_output(0));
  or_98_rmff <= (INNER_LOOP_b_INNER_LOOP_b_and_7 AND (CONV_SL_1_1(fsm_output(4 DOWNTO
      2)/=STD_LOGIC_VECTOR'("000")))) OR (and_dcpl_11 AND (CONV_SL_1_1(fsm_output(38
      DOWNTO 36)/=STD_LOGIC_VECTOR'("000"))));
  or_103_rmff <= CONV_SL_1_1(fsm_output(36 DOWNTO 23)/=STD_LOGIC_VECTOR'("00000000000000"));
  and_165_rgt <= (INNER_LOOP_t_9_0_sva_1(9)) AND (fsm_output(38));
  xor_3_cse <= y_1_sva XOR y_3_sva;
  OUTER_LOOP_nn_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(OUTER_LOOP_nn_3_0_sva)
      + UNSIGNED'( "0001"), 4));
  drf_y_smx_lpi_3_dfm_1 <= MUX1HOT_v_64_3_2(xt_rsci_q_d, yt_rsci_q_d, drf_y_smx_lpi_2,
      STD_LOGIC_VECTOR'( INNER_LOOP_b_INNER_LOOP_b_and_5 & INNER_LOOP_b_INNER_LOOP_b_and_7
      & INNER_LOOP_b_nor_itm));
  INNER_LOOP_q_and_psp_sva_1 <= INNER_LOOP_upper_acc_cse_sva_1 AND INNER_LOOP_a_acc_psp_sva;
  pref_x_idx_pref_9_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_q_and_psp_sva_1),
      9), 10) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_upper_and_psp_sva_1),
      9), 10), 10));
  INNER_LOOP_upper_and_psp_sva_1 <= (NOT INNER_LOOP_upper_acc_cse_sva_1) AND INNER_LOOP_a_acc_psp_sva;
  INNER_LOOP_upper_acc_cse_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( s_8_sva
      & s_7_sva & s_6_sva & s_5_sva & s_4_sva & s_3_sva & s_2_sva & s_1_sva & s_0_sva)
      + SIGNED'( "111111111"), 9));
  INNER_LOOP_b_INNER_LOOP_b_and_5 <= y_1_sva AND (NOT y_3_sva);
  INNER_LOOP_b_INNER_LOOP_b_and_7 <= y_3_sva AND (NOT y_1_sva);
  and_dcpl_5 <= NOT((fsm_output(40)) OR (fsm_output(0)));
  or_dcpl_4 <= CONV_SL_1_1(fsm_output(37 DOWNTO 36)/=STD_LOGIC_VECTOR'("00"));
  or_dcpl_5 <= CONV_SL_1_1(fsm_output(3 DOWNTO 2)/=STD_LOGIC_VECTOR'("00"));
  and_dcpl_11 <= x_3_sva AND (NOT x_1_sva);
  and_dcpl_14 <= NOT((fsm_output(39)) OR (fsm_output(1)));
  and_dcpl_21 <= NOT(CONV_SL_1_1(fsm_output(38 DOWNTO 37)/=STD_LOGIC_VECTOR'("00")));
  or_tmp_46 <= (fsm_output(40)) OR (fsm_output(0));
  INNER_LOOP_a_lpi_3_dfm_mx0c0 <= INNER_LOOP_b_INNER_LOOP_b_and_7 AND (fsm_output(4));
  INNER_LOOP_a_lpi_3_dfm_mx0c1 <= (y_1_sva OR (NOT y_3_sva)) AND (fsm_output(4));
  xt_rsci_d_d_pff <= modulo_dev_cmp_return_rsc_z;
  INNER_LOOP_b_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_upper_and_psp_sva_1
      & '0') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_q_and_psp_sva_1),
      9), 10), 10));
  INNER_LOOP_b_INNER_LOOP_b_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_b_acc_nl),
      10) + UNSIGNED'( s_9_sva & s_8_sva & s_7_sva & s_6_sva & s_5_sva & s_4_sva
      & s_3_sva & s_2_sva & s_1_sva & s_0_sva), 10));
  xt_rsci_radr_d_pff <= MUX_v_10_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_b_INNER_LOOP_b_acc_nl),
      10)), (INNER_LOOP_a_acc_psp_sva & INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm),
      fsm_output(3));
  xt_rsci_wadr_d_pff <= MUX_v_10_2_2(pref_x_idx_pref_9_0_sva, pref_x_idx_pref_1_9_0_sva,
      fsm_output(37));
  xt_rsci_we_d_pff <= (NOT x_3_sva) AND x_1_sva AND or_dcpl_4;
  xt_rsci_readA_r_ram_ir_internal_RMASK_B_d <= y_1_sva AND (NOT y_3_sva) AND or_dcpl_5;
  twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d <= fsm_output(2);
  yt_rsci_we_d_pff <= and_dcpl_11 AND or_dcpl_4;
  yt_rsci_readA_r_ram_ir_internal_RMASK_B_d <= INNER_LOOP_b_INNER_LOOP_b_and_7 AND
      or_dcpl_5;
  twiddle_rsci_radr_d <= z_out_1;
  OUTER_LOOP_or_1_seb <= (fsm_output(38)) OR (fsm_output(1));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( OUTER_LOOP_nn_or_cse = '1' ) THEN
        OUTER_LOOP_nn_3_0_sva <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "0001"), OUTER_LOOP_nn_3_0_sva_2,
            fsm_output(39));
        s_9_sva <= fsm_output(0);
        s_8_sva <= s_9_sva AND (NOT (fsm_output(0)));
        s_7_sva <= s_8_sva AND (NOT (fsm_output(0)));
        s_6_sva <= s_7_sva AND (NOT (fsm_output(0)));
        s_5_sva <= s_6_sva AND (NOT (fsm_output(0)));
        s_4_sva <= s_5_sva AND (NOT (fsm_output(0)));
        s_3_sva <= s_4_sva AND (NOT (fsm_output(0)));
        s_2_sva <= s_3_sva AND (NOT (fsm_output(0)));
        s_1_sva <= s_2_sva AND (NOT (fsm_output(0)));
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
        x_3_sva <= y_3_sva OR (fsm_output(0));
        x_1_sva <= y_1_sva AND (NOT (fsm_output(0)));
        y_3_sva <= x_3_sva AND (NOT (fsm_output(0)));
        y_1_sva <= x_1_sva OR (fsm_output(0));
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
        reg_yt_rsc_cgo_cse <= '0';
        reg_xt_rsc_triosy_obj_ld_cse <= '0';
        reg_ensig_cgo_cse <= '0';
        INNER_LOOP_b_nor_itm <= '0';
      ELSE
        reg_yt_rsc_cgo_cse <= or_98_rmff;
        reg_xt_rsc_triosy_obj_ld_cse <= (NOT (z_out(2))) AND (fsm_output(39));
        reg_ensig_cgo_cse <= or_103_rmff;
        INNER_LOOP_b_nor_itm <= NOT(INNER_LOOP_b_INNER_LOOP_b_and_5 OR INNER_LOOP_b_INNER_LOOP_b_and_7);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      s_0_sva <= s_mux_5_nl AND (NOT or_tmp_46);
      reg_modulo_dev_cmp_m_rsc_dat_cse <= p_sva;
      INNER_LOOP_b_rem_cmp_a <= MUX_v_128_2_2(z_out_2, INNER_LOOP_b_mul_mut, or_106_nl);
      INNER_LOOP_a_acc_psp_sva <= MUX_v_9_2_2(STD_LOGIC_VECTOR'("000000000"), INNER_LOOP_t_mux_1_nl,
          INNER_LOOP_a_or_1_nl);
      INNER_LOOP_b_sva <= INNER_LOOP_b_rem_cmp_z;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (xor_3_cse AND (fsm_output(3))) = '1' ) THEN
        drf_y_smx_lpi_2 <= drf_y_smx_lpi_3_dfm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (or_tmp_46 OR and_165_rgt) = '1' ) THEN
        OUTER_LOOP_acc_2_itm <= MUX_v_4_2_2(STD_LOGIC_VECTOR'( "1001"), (z_out(3
            DOWNTO 0)), and_165_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(and_dcpl_14 AND and_dcpl_5)) = '1' ) THEN
        OUTER_LOOP_m_lshift_psp_sva <= z_out_1(8 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( xor_3_cse = '1' ) THEN
        INNER_LOOP_a_slc_INNER_LOOP_q_and_psp_0_1_itm <= INNER_LOOP_q_and_psp_sva_1(0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((NOT and_dcpl_21) OR (fsm_output(39)) OR (fsm_output(36)) OR (fsm_output(1))
          OR (fsm_output(40)) OR (fsm_output(0)) OR (fsm_output(2))) = '1' ) THEN
        pref_x_idx_pref_9_0_sva <= pref_x_idx_pref_9_0_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (NOT(and_dcpl_21 AND and_dcpl_14 AND and_dcpl_5 AND (NOT (fsm_output(2)))))
          = '1' ) THEN
        pref_x_idx_pref_1_9_0_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pref_x_idx_pref_9_0_sva_1)
            + UNSIGNED(z_out_2(9 DOWNTO 0)), 10));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        INNER_LOOP_t_9_0_sva_1 <= STD_LOGIC_VECTOR'( "0000000000");
      ELSIF ( (fsm_output(2)) = '1' ) THEN
        INNER_LOOP_t_9_0_sva_1 <= z_out;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( (fsm_output(3)) = '1' ) THEN
        INNER_LOOP_b_mul_mut <= z_out_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF ( ((fsm_output(23)) OR INNER_LOOP_a_lpi_3_dfm_mx0c0 OR INNER_LOOP_a_lpi_3_dfm_mx0c1)
          = '1' ) THEN
        INNER_LOOP_a_lpi_3_dfm <= MUX1HOT_v_64_3_2(yt_rsci_q_d, xt_rsci_q_d, STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(INNER_LOOP_acc_5_nl),
            64)), STD_LOGIC_VECTOR'( INNER_LOOP_a_lpi_3_dfm_mx0c0 & INNER_LOOP_a_lpi_3_dfm_mx0c1
            & (fsm_output(23))));
      END IF;
    END IF;
  END PROCESS;
  s_mux_5_nl <= MUX_s_1_2_2(s_0_sva, s_1_sva, fsm_output(39));
  or_106_nl <= CONV_SL_1_1(fsm_output(21 DOWNTO 4)/=STD_LOGIC_VECTOR'("000000000000000000"));
  INNER_LOOP_a_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_q_and_psp_sva_1(8
      DOWNTO 1)), 8), 9) + UNSIGNED(INNER_LOOP_upper_and_psp_sva_1), 9));
  INNER_LOOP_t_mux_1_nl <= MUX_v_9_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(INNER_LOOP_a_acc_nl),
      9)), (INNER_LOOP_t_9_0_sva_1(8 DOWNTO 0)), fsm_output(38));
  INNER_LOOP_a_or_1_nl <= (fsm_output(38)) OR (fsm_output(2));
  INNER_LOOP_acc_5_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(INNER_LOOP_a_lpi_3_dfm)
      - SIGNED(INNER_LOOP_b_sva), 64));
  OUTER_LOOP_nor_1_nl <= NOT((fsm_output(38)) OR (fsm_output(1)) OR (fsm_output(39)));
  OUTER_LOOP_OUTER_LOOP_and_1_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), (INNER_LOOP_a_acc_psp_sva(8
      DOWNTO 4)), OUTER_LOOP_nor_1_nl);
  OUTER_LOOP_mux1h_3_nl <= MUX1HOT_v_4_4_2(OUTER_LOOP_acc_2_itm, OUTER_LOOP_nn_3_0_sva,
      (INNER_LOOP_a_acc_psp_sva(3 DOWNTO 0)), ('0' & (OUTER_LOOP_nn_3_0_sva_2(3 DOWNTO
      1))), STD_LOGIC_VECTOR'( (fsm_output(38)) & (fsm_output(1)) & (fsm_output(2))
      & (fsm_output(39))));
  OUTER_LOOP_OUTER_LOOP_or_1_nl <= (fsm_output(39)) OR OUTER_LOOP_or_1_seb;
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(OUTER_LOOP_OUTER_LOOP_and_1_nl
      & OUTER_LOOP_mux1h_3_nl), 9), 10) + CONV_UNSIGNED(CONV_SIGNED(SIGNED'( OUTER_LOOP_or_1_seb
      & OUTER_LOOP_OUTER_LOOP_or_1_nl & '1'), 3), 10), 10));
  INNER_LOOP_mux_3_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "000000000000000000000000000000000000000000000000000000")
      & s_9_sva & s_8_sva & s_7_sva & s_6_sva & s_5_sva & s_4_sva & s_3_sva & s_2_sva
      & s_1_sva & s_0_sva), drf_y_smx_lpi_3_dfm_1, fsm_output(3));
  INNER_LOOP_mux_4_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'( "0000000000000000000000000000000000000000000000000000000")
      & OUTER_LOOP_m_lshift_psp_sva), twiddle_rsci_q_d, fsm_output(3));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(INNER_LOOP_mux_3_nl)
      * UNSIGNED(INNER_LOOP_mux_4_nl)), 128));
END v1;

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
    xt_rsc_wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsc_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_we : OUT STD_LOGIC;
    xt_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    xt_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    xt_rsc_triosy_lz : OUT STD_LOGIC;
    p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    p_rsc_triosy_lz : OUT STD_LOGIC;
    g_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    g_rsc_triosy_lz : OUT STD_LOGIC;
    twiddle_rsc_radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    twiddle_rsc_q : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    twiddle_rsc_triosy_lz : OUT STD_LOGIC
  );
END stockham_DIT;

ARCHITECTURE v1 OF stockham_DIT IS
  -- Default Constants
  CONSTANT PWR : STD_LOGIC := '1';

  -- Interconnect Declarations
  SIGNAL xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL yt_rsci_clken_d : STD_LOGIC;
  SIGNAL yt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL yt_rsc_clken : STD_LOGIC;
  SIGNAL yt_rsc_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsc_we : STD_LOGIC;
  SIGNAL yt_rsc_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_d_d_iff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_wadr_d_iff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_we_d_iff : STD_LOGIC;
  SIGNAL yt_rsci_we_d_iff : STD_LOGIC;

  SIGNAL yt_rsc_comp_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_comp_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
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
  SIGNAL xt_rsci_q : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL xt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL xt_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
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

  COMPONENT stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen
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
  SIGNAL yt_rsci_d_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_q_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL yt_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL yt_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT stockham_DIT_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      xt_rsc_triosy_lz : OUT STD_LOGIC;
      p_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      p_rsc_triosy_lz : OUT STD_LOGIC;
      g_rsc_triosy_lz : OUT STD_LOGIC;
      twiddle_rsc_triosy_lz : OUT STD_LOGIC;
      xt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      twiddle_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      twiddle_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      yt_rsci_clken_d : OUT STD_LOGIC;
      yt_rsci_q_d : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      yt_rsci_readA_r_ram_ir_internal_RMASK_B_d : OUT STD_LOGIC;
      xt_rsci_d_d_pff : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
      xt_rsci_radr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xt_rsci_wadr_d_pff : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      xt_rsci_we_d_pff : OUT STD_LOGIC;
      yt_rsci_we_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL stockham_DIT_core_inst_p_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_twiddle_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_twiddle_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL stockham_DIT_core_inst_yt_rsci_q_d : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_d_d_pff : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_radr_d_pff : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL stockham_DIT_core_inst_xt_rsci_wadr_d_pff : STD_LOGIC_VECTOR (9 DOWNTO 0);

BEGIN
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

  xt_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_4_10_64_1024_1024_64_1_gen
    PORT MAP(
      q => xt_rsci_q,
      radr => xt_rsci_radr,
      we => xt_rsc_we,
      d => xt_rsci_d,
      wadr => xt_rsci_wadr,
      d_d => xt_rsci_d_d,
      q_d => xt_rsci_q_d_1,
      radr_d => xt_rsci_radr_d,
      wadr_d => xt_rsci_wadr_d,
      we_d => xt_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => xt_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => xt_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  xt_rsci_q <= xt_rsc_q;
  xt_rsc_radr <= xt_rsci_radr;
  xt_rsc_d <= xt_rsci_d;
  xt_rsc_wadr <= xt_rsci_wadr;
  xt_rsci_d_d <= xt_rsci_d_d_iff;
  xt_rsci_q_d <= xt_rsci_q_d_1;
  xt_rsci_radr_d <= xt_rsci_radr_d_iff;
  xt_rsci_wadr_d <= xt_rsci_wadr_d_iff;

  twiddle_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_7_10_64_1024_1024_64_1_gen
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

  yt_rsci : stockham_DIT_Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_en_8_10_64_1024_1024_64_1_gen
    PORT MAP(
      clken => yt_rsc_clken,
      q => yt_rsci_q,
      radr => yt_rsci_radr,
      we => yt_rsc_we,
      d => yt_rsci_d,
      wadr => yt_rsci_wadr,
      clken_d => yt_rsci_clken_d,
      d_d => yt_rsci_d_d,
      q_d => yt_rsci_q_d_1,
      radr_d => yt_rsci_radr_d,
      wadr_d => yt_rsci_wadr_d,
      we_d => yt_rsci_we_d_iff,
      writeA_w_ram_ir_internal_WMASK_B_d => yt_rsci_we_d_iff,
      readA_r_ram_ir_internal_RMASK_B_d => yt_rsci_readA_r_ram_ir_internal_RMASK_B_d
    );
  yt_rsci_q <= yt_rsc_q;
  yt_rsc_radr <= yt_rsci_radr;
  yt_rsc_d <= yt_rsci_d;
  yt_rsc_wadr <= yt_rsci_wadr;
  yt_rsci_d_d <= xt_rsci_d_d_iff;
  yt_rsci_q_d <= yt_rsci_q_d_1;
  yt_rsci_radr_d <= xt_rsci_radr_d_iff;
  yt_rsci_wadr_d <= xt_rsci_wadr_d_iff;

  stockham_DIT_core_inst : stockham_DIT_core
    PORT MAP(
      clk => clk,
      rst => rst,
      xt_rsc_triosy_lz => xt_rsc_triosy_lz,
      p_rsc_dat => stockham_DIT_core_inst_p_rsc_dat,
      p_rsc_triosy_lz => p_rsc_triosy_lz,
      g_rsc_triosy_lz => g_rsc_triosy_lz,
      twiddle_rsc_triosy_lz => twiddle_rsc_triosy_lz,
      xt_rsci_q_d => stockham_DIT_core_inst_xt_rsci_q_d,
      xt_rsci_readA_r_ram_ir_internal_RMASK_B_d => xt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      twiddle_rsci_q_d => stockham_DIT_core_inst_twiddle_rsci_q_d,
      twiddle_rsci_radr_d => stockham_DIT_core_inst_twiddle_rsci_radr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d => twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      yt_rsci_clken_d => yt_rsci_clken_d,
      yt_rsci_q_d => stockham_DIT_core_inst_yt_rsci_q_d,
      yt_rsci_readA_r_ram_ir_internal_RMASK_B_d => yt_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      xt_rsci_d_d_pff => stockham_DIT_core_inst_xt_rsci_d_d_pff,
      xt_rsci_radr_d_pff => stockham_DIT_core_inst_xt_rsci_radr_d_pff,
      xt_rsci_wadr_d_pff => stockham_DIT_core_inst_xt_rsci_wadr_d_pff,
      xt_rsci_we_d_pff => xt_rsci_we_d_iff,
      yt_rsci_we_d_pff => yt_rsci_we_d_iff
    );
  stockham_DIT_core_inst_p_rsc_dat <= p_rsc_dat;
  stockham_DIT_core_inst_xt_rsci_q_d <= xt_rsci_q_d;
  stockham_DIT_core_inst_twiddle_rsci_q_d <= twiddle_rsci_q_d;
  twiddle_rsci_radr_d <= stockham_DIT_core_inst_twiddle_rsci_radr_d;
  stockham_DIT_core_inst_yt_rsci_q_d <= yt_rsci_q_d;
  xt_rsci_d_d_iff <= stockham_DIT_core_inst_xt_rsci_d_d_pff;
  xt_rsci_radr_d_iff <= stockham_DIT_core_inst_xt_rsci_radr_d_pff;
  xt_rsci_wadr_d_iff <= stockham_DIT_core_inst_xt_rsci_wadr_d_pff;

END v1;



