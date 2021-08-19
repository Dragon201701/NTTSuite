library ieee;
USE ieee.std_logic_1164.all;

PACKAGE DIT_RELOOP_mgc_shift_comps_v5 IS

COMPONENT DIT_RELOOP_mgc_shift_l_v5
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
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_shift_r_v5
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
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_shift_bl_v5
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
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_shift_br_v5
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
END COMPONENT;

END DIT_RELOOP_mgc_shift_comps_v5;
