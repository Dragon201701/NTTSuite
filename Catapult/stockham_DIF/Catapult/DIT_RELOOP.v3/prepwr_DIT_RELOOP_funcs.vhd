
-- a package of attributes that give verification tools a hint about
-- the function being implemented
PACKAGE DIT_RELOOP_attributes IS
  ATTRIBUTE CALYPTO_FUNC :  string;
  ATTRIBUTE CALYPTO_DATA_ORDER :  string;
end DIT_RELOOP_attributes;

-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE DIT_RELOOP_funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1:  BOOLEAN) RETURN STD_LOGIC;
--   FUNCTION TO_STDLOGIC(arg1:  STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1:  STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1:  SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1:  STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 :  INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 :  INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne :  INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1:  STD_LOGIC_VECTOR; input2 :  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput:  STD_LOGIC       ; clk:  STD_LOGIC; doutput:  STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput:  STD_LOGIC_VECTOR; clk:  STD_LOGIC; doutput:  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput:  STD_LOGIC       ; control:  STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput:  STD_LOGIC_VECTOR; control:  STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r:  SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r:  SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r:  SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r:  SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r:  SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r:  UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r:  SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r:  STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg:  UNSIGNED; width:  NATURAL) RETURN UNSIGNED;

   FUNCTION fabs(arg1:  SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r:  UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r:  UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r:  UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r:  UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r:  SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r:  SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r:  SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r:  SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1:  STD_LOGIC_VECTOR; arg2:  STD_LOGIC_VECTOR; signd2:  BOOLEAN; sdir:  INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1:  STD_LOGIC_VECTOR; arg2:  UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1:  STD_LOGIC_VECTOR; arg2:  UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1:  STD_LOGIC_VECTOR; arg2:  SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1:  STD_LOGIC_VECTOR; arg2:  SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions:  LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec:  STD_LOGIC_VECTOR; index:  INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec:  STD_LOGIC_VECTOR; index:  INTEGER; width:  POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC       ; index:  INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p:  NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC_VECTOR; index:  INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC_VECTOR; enable:  STD_LOGIC_VECTOR; byte_width:  INTEGER;  index:  INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size :  NATURAL) return NATURAL;
   FUNCTION bits(size :  NATURAL) return NATURAL;

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);

END DIT_RELOOP_funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY DIT_RELOOP_funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1:  BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
--   FUNCTION TO_STDLOGIC(arg1:  STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
--     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1:  STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1:  SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1:  STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result:  STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2:  INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2:  INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne :  INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1:  STD_LOGIC_VECTOR; input2:  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len:  INTEGER := input1'LENGTH;
     ALIAS input1a:  STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a:  STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result:  STD_LOGIC_VECTOR(len-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
--pragma translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
--pragma translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1:  UNSIGNED; input2:  UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1:  SIGNED; input2:  SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1:  UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs:  STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen:  POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1:  POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1:  INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1:  INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx:  STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2:  POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result:  STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen:  POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1:  POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1:  INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1:  INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx:  STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2:  POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result:  STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
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

   FUNCTION xor_v(inputs:  STD_LOGIC_VECTOR; olen:  POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen:  POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1:  POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1:  INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1:  INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx:  STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2:  POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result:  STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
--pragma translate_on
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

   FUNCTION mux_sel2_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 4;
     ALIAS    inputs0:  STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result :  STD_LOGIC_Vector( size-1 DOWNTO 0);
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
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel3_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 8;
     ALIAS    inputs0:  STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result :  STD_LOGIC_Vector(size-1 DOWNTO 0);
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
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel4_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 16;
     ALIAS    inputs0:  STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result :  STD_LOGIC_Vector(size-1 DOWNTO 0);
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
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel5_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 32;
     ALIAS    inputs0:  STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result :  STD_LOGIC_Vector(size-1 DOWNTO 0 );
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
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_sel6_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 64;
     ALIAS    inputs0:  STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result :  STD_LOGIC_Vector(size-1 DOWNTO 0);
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
       result := (others => '0');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs:  STD_LOGIC_VECTOR; sel:  STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0:  STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   :  POSITIVE := inputs'LENGTH / 2;
     VARIABLE result :  STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT inputs'LENGTH = olen * 2 SEVERITY FAILURE;
--pragma translate_on
       CASE sel IS
       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
            =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0'
--pragma translate_off
            | 'L'
--pragma translate_on
            =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
--pragma translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
--pragma translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs:  STD_LOGIC_VECTOR; sel :  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0:  STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   :  STD_LOGIC_VECTOR( sel'LENGTH-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen :  INTEGER RANGE 2-sel'LENGTH TO sel'LENGTH;
     CONSTANT size   :  POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   :  POSITIVE := inputs'LENGTH / 2**sel'LENGTH;
     VARIABLE result :  STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array :  inputs_array_type( 2**sel'LENGTH - 1 DOWNTO 0);
   BEGIN
     sellen := sel'LENGTH;
--pragma translate_off
     ASSERT inputs'LENGTH = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
--pragma translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
            =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0'
--pragma translate_off
            | 'L'
--pragma translate_on
            =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
--pragma translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
--pragma translate_on
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
-- pragma translate_off
       IF(Is_X(sel0)) THEN
         result := (others => '0');
       ELSE
-- pragma translate_on
         FOR i in 0 to 2**sel'LENGTH - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
-- pragma translate_off
       END IF;
-- pragma translate_on
     END CASE;
     RETURN result;
   END;


-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput:  STD_LOGIC; clk:  STD_LOGIC; doutput:  STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput:  STD_LOGIC_VECTOR ; clk:  STD_LOGIC; doutput:  STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
--pragma translate_off
     ASSERT dinput'LENGTH = doutput'LENGTH SEVERITY FAILURE;
--pragma translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput:  STD_LOGIC; control:  STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput:  STD_LOGIC_VECTOR ; control:  STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result:  STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
---- pragma translate_off
--       result := (others => '0');
---- pragma translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r:  SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r:  SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r:  UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff:  UNSIGNED(l'LENGTH DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
--pragma translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'LENGTH);
   END;
   FUNCTION "<"(l, r:  SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'LEFT) xor r(r'LEFT));
   END;

   FUNCTION "<="(l, r:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r:  SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r:  SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r:  UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r:  SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r:  STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
--pragma translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
--pragma translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b :  NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b :  NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b :  NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b :  UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b :  UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b :  INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b :  UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b :  UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b :  STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg:  UNSIGNED; width:  NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps :  NATURAL := arg'LENGTH / width;
     ALIAS    arg0  :  UNSIGNED(arg'LENGTH-1 DOWNTO 0) IS arg;
     VARIABLE result:  UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  :  INTEGER;
     VARIABLE dto   :  INTEGER;
   BEGIN
--pragma translate_off
     ASSERT arg'LENGTH = width * ninps SEVERITY FAILURE;
--pragma translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1:  SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'LEFT) IS
     WHEN '1'
--pragma translate_off
          | 'H'
--pragma translate_on
       =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0'
--pragma translate_off
          | 'L'
--pragma translate_on
       =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r:  UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen:  INTEGER := l'LENGTH;
     CONSTANT rlen:  INTEGER := r'LENGTH;
     CONSTANT llen_plus_rlen:  INTEGER := llen + rlen;
     VARIABLE lbuf:  UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff:  UNSIGNED(rlen DOWNTO 0);
   BEGIN
--pragma translate_off
     ASSERT rdiv'LENGTH = llen AND rmod'LENGTH = rlen SEVERITY FAILURE;
--pragma translate_on
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

   FUNCTION "/"  (l, r:  UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv:  UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod:  UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r:  UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv:  UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod:  UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r:  UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r:  SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv:  UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod:  UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r:  SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv:  UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod:  UNSIGNED(r'LENGTH-1 DOWNTO 0);
     CONSTANT rnul:  UNSIGNED(r'LENGTH-1 DOWNTO 0) := (others => '0');
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

   FUNCTION "REM"(l, r:  SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv:  UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod:  UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r :  UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r;
   END mult_unsigned;

   FUNCTION "**" (l, r :  UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  :  NATURAL := l'LENGTH;
     VARIABLE result:  UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   :  UNSIGNED(llen-1 DOWNTO 0);
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

   FUNCTION "**" (l, r :  SIGNED) RETURN SIGNED IS
     CONSTANT rlen  :  NATURAL := r'LENGTH;
     ALIAS    r0    :  SIGNED(0 TO r'LENGTH-1) IS r;
     VARIABLE result:  SIGNED(l'range);
   BEGIN
     CASE r(r'LEFT) IS
     WHEN '0'
--pragma translate_off
          | 'L'
--pragma translate_on
     =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'LENGTH-1)));
     WHEN '1'
--pragma translate_off
          | 'H'
--pragma translate_on
     =>
       result := (others => '0');
     WHEN others =>
       result := (others => '0');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 :  NATURAL; arg2 :  NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;

--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 :  NATURAL; arg2 :  NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;

   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub:  INTEGER := arg1'LENGTH-1;
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1:  SIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN SIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub:  INTEGER := arg1'LENGTH-1;
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub:  INTEGER := arg1'LENGTH-1;
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1:  SIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN SIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub:  INTEGER := arg1'LENGTH-1;
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l:  NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x:  UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l:  NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad:  UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result:  UNSIGNED(olen-1 DOWNTO 0);
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
--pragma translate_off
            | 'L'
--pragma translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1:  SIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l:  NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x:  SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l:  NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad:  SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result:  SIGNED(olen-1 DOWNTO 0);
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
--pragma translate_off
            | 'L'
--pragma translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
--pragma translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l:  INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result:  UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
--pragma translate_off
            | 'L'
--pragma translate_on
        =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
        =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1:  SIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l:  INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result:  SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
--pragma translate_off
            | 'L'
--pragma translate_on
       =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
       =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshl_stdar(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;


   FUNCTION fshl(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; --2.1.6.3
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp:  UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw:  NATURAL range 1 TO len;
     VARIABLE temp_idx :  INTEGER; --2.1.6.3
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

   FUNCTION fshr(arg1:  UNSIGNED; arg2:  UNSIGNED; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen:  INTEGER := arg1'LENGTH;
     CONSTANT olenM1:  INTEGER := olen-1; --2.1.6.3
     CONSTANT len:  INTEGER := maximum(ilen, olen);
     VARIABLE result:  UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp:  UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw:  sw_range;
     VARIABLE result_idx :  INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was:  temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l:  NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x:  UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l:  NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad:  UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result:  UNSIGNED(olen-1 DOWNTO 0);
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
--pragma translate_off
            | 'L'
--pragma translate_on
       =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
       =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
--pragma translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1:  UNSIGNED; arg2:  SIGNED  ; sbit:  STD_LOGIC; olen:  POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l:  INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x:  SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result:  UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
--pragma translate_off
            | 'L'
--pragma translate_on
       =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
--pragma translate_off
            | 'H'
--pragma translate_on
       =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
--pragma translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
--pragma translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1:  UNSIGNED; arg2:  SIGNED  ; olen:  POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshl(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1:  SIGNED  ; arg2:  SIGNED  ; olen:  POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;


   FUNCTION frot(arg1:  STD_LOGIC_VECTOR; arg2:  STD_LOGIC_VECTOR; signd2:  BOOLEAN; sdir:  INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len:  INTEGER := arg1'LENGTH;
     VARIABLE result:  STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     VARIABLE temp:  STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw:  sw_range;
     VARIABLE temp_idx :  INTEGER; --2.1.6.3
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
         --was:  temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1:  STD_LOGIC_VECTOR; arg2:  UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1:  STD_LOGIC_VECTOR; arg2:  UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1:  STD_LOGIC_VECTOR; arg2:  SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1:  STD_LOGIC_VECTOR; arg2:  SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions:  LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec:  STD_LOGIC_VECTOR; index:  INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len :  INTEGER := vec'LENGTH;
     ALIAS    vec0:  STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN '0';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec:  STD_LOGIC_VECTOR; index:  INTEGER; width:  POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len :  INTEGER := vec'LENGTH;
     CONSTANT indexPwidthM1 :  INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0:  STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx :  STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => '0');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC       ; index:  INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len :  INTEGER := vec'LENGTH;
     VARIABLE vec0:  STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx :  STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => '0');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p:  NATURAL) RETURN POSITIVE IS
     VARIABLE n_b :  POSITIVE;
     VARIABLE p_v :  NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC_VECTOR; index:  INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen:  INTEGER := vec'LENGTH;
--     CONSTANT ilen:  INTEGER := dinput'LENGTH;
--     CONSTANT max_shift:  INTEGER := vlen-ilen;
--     CONSTANT ones:  UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx :  STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => '0');
--     VARIABLE shift :  UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0:  STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp:  UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask:  UNSIGNED(vlen-1 DOWNTO 0);
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

   FUNCTION writeslice(vec:  STD_LOGIC_VECTOR; dinput:  STD_LOGIC_VECTOR; enable:  STD_LOGIC_VECTOR; byte_width:  INTEGER;  index:  INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'LENGTH-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen:  INTEGER := vec'LENGTH;
     CONSTANT ilen:  INTEGER := dinput'LENGTH;
     CONSTANT max_shift:  INTEGER := vlen-ilen;
     CONSTANT ones:  UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx :  STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => '0');
     VARIABLE shift :  UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0:  STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp:  UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask:  UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2:  UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables:  enable_matrix;
     VARIABLE cat_enables:  STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 );
     VARIABLE lsbi :  INTEGER;
     VARIABLE msbi :  INTEGER;

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


   FUNCTION ceil_log2(size :  NATURAL) return NATURAL is
     VARIABLE cnt :  NATURAL;
     VARIABLE res :  NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;

   FUNCTION bits(size :  NATURAL) return NATURAL is
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

END DIT_RELOOP_funcs;
