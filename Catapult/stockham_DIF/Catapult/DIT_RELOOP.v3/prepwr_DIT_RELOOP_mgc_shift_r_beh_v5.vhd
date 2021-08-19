library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY DIT_RELOOP_mgc_shift_r_v5 IS
  GENERIC (
    width_a:  NATURAL;
    signd_a:  NATURAL;
    width_s:  NATURAL;
    width_z:  NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END DIT_RELOOP_mgc_shift_r_v5;

library ieee;
USE ieee.std_logic_arith.all;

ARCHITECTURE beh OF DIT_RELOOP_mgc_shift_r_v5 IS

  FUNCTION maximum (arg1,arg2:  INTEGER) RETURN INTEGER IS
  BEGIN
    IF(arg1 > arg2) THEN
      RETURN(arg1) ;
    ELSE
      RETURN(arg2) ;
    END IF;
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

  FUNCTION fshr_stdar(arg1:  UNSIGNED; arg2:  UNSIGNED; olen:  POSITIVE)
  RETURN UNSIGNED IS
  BEGIN
    RETURN fshr_stdar(arg1, arg2, '0', olen);
  END;

  FUNCTION fshr_stdar(arg1:  SIGNED  ; arg2:  UNSIGNED; olen:  POSITIVE)
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
