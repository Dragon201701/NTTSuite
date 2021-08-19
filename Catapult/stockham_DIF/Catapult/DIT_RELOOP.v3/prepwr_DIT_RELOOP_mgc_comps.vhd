library ieee;
USE ieee.std_logic_1164.all;

PACKAGE DIT_RELOOP_mgc_comps IS

FUNCTION ifeqsel(arg1, arg2, seleq, selne :  INTEGER) RETURN INTEGER;
FUNCTION ceil_log2(size :  NATURAL) return NATURAL;


COMPONENT DIT_RELOOP_mgc_not
  GENERIC (
    width  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_and
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_nand
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_or
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_nor
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_xor
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_xnor
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mux
  GENERIC (
    width  :   NATURAL;
    ctrlw  :   NATURAL;
    p2ctrlw :  NATURAL := 0
  );
  PORT (
    a: in  std_logic_vector(width*(2**ctrlw) - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw            - 1 DOWNTO 0);
    z: out std_logic_vector(width            - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mux1hot
  GENERIC (
    width  :  NATURAL;
    ctrlw  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ctrlw - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw       - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_reg_pos
  GENERIC (
    width  :  NATURAL;
    has_a_rst :  NATURAL;  -- 0 to 1
    a_rst_on  :  NATURAL;  -- 0 to 1
    has_s_rst :  NATURAL;  -- 0 to 1
    s_rst_on  :  NATURAL;  -- 0 to 1
    has_enable :  NATURAL; -- 0 to 1
    enable_on  :  NATURAL  -- 0 to 1
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

COMPONENT DIT_RELOOP_mgc_reg_neg
  GENERIC (
    width  :  NATURAL;
    has_a_rst :  NATURAL;  -- 0 to 1
    a_rst_on  :  NATURAL;  -- 0 to 1
    has_s_rst :  NATURAL;  -- 0 to 1
    s_rst_on  :  NATURAL;   -- 0 to 1
    has_enable :  NATURAL; -- 0 to 1
    enable_on  :  NATURAL -- 0 to 1
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

COMPONENT DIT_RELOOP_mgc_generic_reg
  GENERIC(
   width:  natural := 8;
   ph_clk:  integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en:  integer range 0 to 1 := 1;
   ph_a_rst:  integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst:  integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used:  integer range 0 to 1 := 1;
   s_rst_used:  integer range 0 to 1 := 0;
   en_used:  integer range 0 to 1 := 1
  );
  PORT(
   d:  std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_equal
  GENERIC (
    width  :  NATURAL
  );
  PORT (
    a : in  std_logic_vector(width-1 DOWNTO 0);
    b : in  std_logic_vector(width-1 DOWNTO 0);
    eq: out std_logic;
    ne: out std_logic
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_shift_l
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

COMPONENT DIT_RELOOP_mgc_shift_r
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

COMPONENT DIT_RELOOP_mgc_shift_bl
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

COMPONENT DIT_RELOOP_mgc_shift_br
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

COMPONENT DIT_RELOOP_mgc_rot
  GENERIC (
    width  :  NATURAL;
    width_s:  NATURAL;
    signd_s:  NATURAL;      -- 0:unsigned 1:signed
    sleft  :  NATURAL;      -- 0:right 1:left;
    log2w  :  NATURAL := 0; -- LOG2(width)
    l2wp2  :  NATURAL := 0  --2**LOG2(width)
  );
  PORT (
    a : in  std_logic_vector(width  -1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width  -1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_add
  GENERIC (
    width   :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_sub
  GENERIC (
    width   :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_add_ci
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width_a, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width_a, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width_a,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width_a,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_addc
  GENERIC (
    width   :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_add3
  GENERIC (
    width   :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_c :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_c :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
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

COMPONENT DIT_RELOOP_mgc_add_pipe
  GENERIC (
     width_a :  natural := 16;
     signd_a :  integer range 0 to 1 := 0;
     width_b :  natural := 3;
     signd_b :  integer range 0 to 1 := 0;
     width_z :  natural := 18;
     ph_clk :  integer range 0 to 1 := 1;
     ph_en :  integer range 0 to 1 := 1;
     ph_a_rst :  integer range 0 to 1 := 1;
     ph_s_rst :  integer range 0 to 1 := 1;
     n_outreg :  natural := 2;
     stages :  natural := 2; -- Default value is minimum required value
     a_rst_used:  integer range 0 to 1 := 1;
     s_rst_used:  integer range 0 to 1 := 0;
     en_used:  integer range 0 to 1 := 1
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

COMPONENT DIT_RELOOP_mgc_sub_pipe
  GENERIC (
     width_a :  natural := 16;
     signd_a :  integer range 0 to 1 := 0;
     width_b :  natural := 3;
     signd_b :  integer range 0 to 1 := 0;
     width_z :  natural := 18;
     ph_clk :  integer range 0 to 1 := 1;
     ph_en :  integer range 0 to 1 := 1;
     ph_a_rst :  integer range 0 to 1 := 1;
     ph_s_rst :  integer range 0 to 1 := 1;
     n_outreg :  natural := 2;
     stages :  natural := 2; -- Default value is minimum required value
     a_rst_used:  integer range 0 to 1 := 1;
     s_rst_used:  integer range 0 to 1 := 0;
     en_used:  integer range 0 to 1 := 1
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

COMPONENT DIT_RELOOP_mgc_addc_pipe
  GENERIC (
     width_a :  natural := 16;
     signd_a :  integer range 0 to 1 := 0;
     width_b :  natural := 3;
     signd_b :  integer range 0 to 1 := 0;
     width_z :  natural := 18;
     ph_clk :  integer range 0 to 1 := 1;
     ph_en :  integer range 0 to 1 := 1;
     ph_a_rst :  integer range 0 to 1 := 1;
     ph_s_rst :  integer range 0 to 1 := 1;
     n_outreg :  natural := 2;
     stages :  natural := 2; -- Default value is minimum required value
     a_rst_used:  integer range 0 to 1 := 1;
     s_rst_used:  integer range 0 to 1 := 0;
     en_used:  integer range 0 to 1 := 1
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

COMPONENT DIT_RELOOP_mgc_addsub
  GENERIC (
    width   :  NATURAL;
    signd_a :  NATURAL := 0;
    width_b :  NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b :  NATURAL := 0;
    width_z :  NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    add: in  std_logic;
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_accu
  GENERIC (
    width  :  NATURAL;
    ninps  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_abs
  GENERIC (
    width  :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mul
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_z :  NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mul_fast
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_z :  NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mul_pipe
  GENERIC (
    width_a       :  NATURAL;
    signd_a       :  NATURAL;
    width_b       :  NATURAL;
    signd_b       :  NATURAL;
    width_z       :  NATURAL; -- <= width_a + width_b
    clock_edge    :  NATURAL; -- 0 to 1
    enable_active :  NATURAL; -- 0 to 1
    a_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    s_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    stages        :  NATURAL;
    n_inreg       :  NATURAL := 0 -- default for backwards compatability

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

COMPONENT DIT_RELOOP_mgc_mul2add1
  GENERIC (
    gentype :  NATURAL;
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_b2 :  NATURAL;
    signd_b2 :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_d :  NATURAL;
    signd_d :  NATURAL;
    width_d2 :  NATURAL;
    signd_d2 :  NATURAL;
    width_e :  NATURAL;
    signd_e :  NATURAL;
    width_z :  NATURAL;   -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   :  NATURAL;
    add_b2  :  NATURAL;
    add_d2  :  NATURAL
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

COMPONENT DIT_RELOOP_mgc_mul2add1_pipe
  GENERIC (
    gentype :  NATURAL;
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_b2 :  NATURAL;
    signd_b2 :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_d :  NATURAL;
    signd_d :  NATURAL;
    width_d2 :  NATURAL;
    signd_d2 :  NATURAL;
    width_e :  NATURAL;
    signd_e :  NATURAL;
    width_z :  NATURAL;    -- <= max(width_a + width_b, width_c + width_d)+1
    isadd   :  NATURAL;
    add_b2   :  NATURAL;
    add_d2   :  NATURAL;
    clock_edge    :  NATURAL; -- 0 to 1
    enable_active :  NATURAL; -- 0 to 1
    a_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    s_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    stages        :  NATURAL;
    n_inreg       :  NATURAL := 0 -- default for backwards compatability
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

COMPONENT DIT_RELOOP_mgc_muladd1
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_cst :  NATURAL;
    signd_cst :  NATURAL;
    width_d :  NATURAL;
    signd_d :  NATURAL;
    width_z :  NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb :  NATURAL;
    add_c   :  NATURAL;
    add_d   :  NATURAL
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

COMPONENT DIT_RELOOP_mgc_muladd1_pipe
  -- operation is z = a * (b + d) + c + cst
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_cst :  NATURAL;
    signd_cst :  NATURAL;
    width_d :  NATURAL;
    signd_d :  NATURAL;
    width_z :  NATURAL;    -- <= max(width_a + width_b, width_c, width_cst)+1
    add_axb :  NATURAL;
    add_c   :  NATURAL;
    add_d   :  NATURAL;
    clock_edge    :  NATURAL; -- 0 to 1
    enable_active :  NATURAL; -- 0 to 1
    a_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    s_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    stages        :  NATURAL;
    n_inreg       :  NATURAL := 0 -- default for backwards compatability
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

COMPONENT DIT_RELOOP_mgc_mulacc_pipe
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_z :  NATURAL;    -- <= max(width_a + width_b, width_c)+1
    clock_edge    :  NATURAL; -- 0 to 1
    enable_active :  NATURAL; -- 0 to 1
    a_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    s_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    stages        :  NATURAL;
    n_inreg       :  NATURAL := 0 -- default for backwards compatability
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

COMPONENT DIT_RELOOP_mgc_mul2acc_pipe
  GENERIC (
    width_a :  NATURAL;
    signd_a :  NATURAL;
    width_b :  NATURAL;
    signd_b :  NATURAL;
    width_c :  NATURAL;
    signd_c :  NATURAL;
    width_d :  NATURAL;
    signd_d :  NATURAL;
    width_e :  NATURAL;
    signd_e :  NATURAL;
    width_z :  NATURAL;    -- <= max(width_a + width_b, width_c)+1
    add_cxd :  NATURAL;
    clock_edge    :  NATURAL; -- 0 to 1
    enable_active :  NATURAL; -- 0 to 1
    a_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    s_rst_active  :  NATURAL; -- 0 to 1 IGNORED
    stages        :  NATURAL;
    n_inreg       :  NATURAL := 0 -- default for backwards compatability
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

COMPONENT DIT_RELOOP_mgc_div
  GENERIC (
    width_a :  NATURAL;
    width_b :  NATURAL;
    signd   :  NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_mod
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
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_rem
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
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_csa
  GENERIC (
     width :  NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     c: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_csha
  GENERIC (
     width :  NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT DIT_RELOOP_mgc_rom
    GENERIC (
      rom_id :  natural := 1;
      size :  natural := 33;
      width :  natural := 32
      );
    PORT (
      data_in :  std_logic_vector((size*width)-1 downto 0);
      addr :  std_logic_vector(ceil_log2(size)-1 downto 0);
      data_out : out std_logic_vector(width-1 downto 0)
    );
END COMPONENT;

END DIT_RELOOP_mgc_comps;

PACKAGE BODY DIT_RELOOP_mgc_comps IS

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

   FUNCTION ifeqsel(arg1, arg2, seleq, selne :  INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

END DIT_RELOOP_mgc_comps;
