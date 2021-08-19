
library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY DIT_RELOOP_mgc_rem IS
  GENERIC (
    width_a :  NATURAL;
    width_b :  NATURAL;
    signd   :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END DIT_RELOOP_mgc_rem;

library ieee;
USE ieee.std_logic_arith.all;
library mgc_hls;
USE mgc_hls.DIT_RELOOP_funcs.all;

ARCHITECTURE beh OF DIT_RELOOP_mgc_rem IS
BEGIN
  z <= std_logic_vector(unsigned(a) rem unsigned(b)) WHEN signd = 0 ELSE
       std_logic_vector(  signed(a) rem   signed(b));
END beh;
