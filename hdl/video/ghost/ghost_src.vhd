library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ghost_src is
   generic(
      CD        : integer                       := 12;
      ADDR      : integer                       := 10;
      KEY_COLOR : std_logic_vector(11 downto 0) := (others => '0')
   );
   port(
      clk      : std_logic;
      -- frame counter input
      x, y     : in  std_logic_vector(10 downto 0);
      -- orgin of sprite 
      x0, y0   : in  std_logic_vector(10 downto 0);
      -- sprite control
      ctrl     : in  std_logic_vector(4 downto 0);
      -- sprite ram write 
      we       : in  std_logic;
      addr_w   : in  std_logic_vector(9 downto 0);
      pixel_in : in  std_logic_vector(1 downto 0);
      sprite_rgb : out std_logic_vector(CD - 1 downto 0)
   );
end ghost_src;

architecture arch of ghost_src is
   constant H_SIZE    : integer := 16;  -- horizontal size of sprite
   constant V_SIZE    : integer := 16;  -- vertical size of sprite
   signal addr_r      : std_logic_vector(9 downto 0);
   signal sid         : std_logic_vector(1 downto 0); -- sprite id 
   signal xr          : signed(11 downto 0); -- sprite x position
   signal yr          : signed(11 downto 0); -- sprite y position
   signal in_region   : std_logic;
   signal plt_code    : std_logic_vector(1 downto 0);
   signal frame_tick  : std_logic;
   signal ani_tick    : std_logic;
   signal c_reg       : unsigned(3 downto 0);
   signal c_next      : unsigned(3 downto 0);
   signal ani_reg     : unsigned(1 downto 0);
   signal ani_next     : unsigned(1 downto 0);
   signal x_d1_reg    : std_logic_vector(10 downto 0);
   signal full_rgb    : std_logic_vector(CD - 1 downto 0);
   signal ghost_rgb   : std_logic_vector(CD - 1 downto 0);
   signal out_rgb     : std_logic_vector(CD - 1 downto 0);
   signal out_d1_reg  : std_logic_vector(CD - 1 downto 0);
   alias gc_color_sel : std_logic_vector(1 downto 0) is ctrl(4 downto 3);
   alias auto         : std_logic is ctrl(2);
   alias gc_id_sel    : std_logic_vector(1 downto 0) is ctrl(1 downto 0);
begin
   --******************************************************************
   -- sprite RAM
   --******************************************************************
   -- instantiate sprite RAM
   slot_ram_unit : entity work.ghost_ram_lut
      generic map(
         ADDR_WIDTH => ADDR,
         DATA_WIDTH => 2
      )
      port map(
         clk    => clk,
         we     => we,
         addr_w => addr_w,
         din    => pixel_in,
         addr_r => addr_r,
         dout   => plt_code
      );
   addr_r <= sid & std_logic_vector(yr(3 downto 0) & xr(3 downto 0));
   --******************************************************************
   -- ghost color control
   --******************************************************************
   -- ghost color selection
   with gc_color_sel select 
      ghost_rgb <=
         x"f00" when "00",    -- red 
         x"f8b" when "01",    -- pink
         x"fa0" when "10",    -- orange
         x"0ff" when others;  -- cyan
   -- palette table
   with plt_code select 
      full_rgb <=
         x"000" when "00",    -- chrome key
         x"111" when "01",    -- dark gray
         ghost_rgb when "10", -- ghost body color
         x"fff" when others;  -- white
   --******************************************************************
   -- in-region circuit
   --******************************************************************
   -- relative coordinate calculation
   xr  <= signed('0' & x) - signed('0' & x0);
   yr  <= signed('0' & y) - signed('0' & y0);
   -- in-region comparison and multiplexing 
   in_region <= '1' when (0 <= xr) and (xr < H_SIZE) and 
                         (0 <= yr) and (yr < V_SIZE) else 
                '0';
   out_rgb   <= full_rgb when in_region = '1' else KEY_COLOR;
   --******************************************************************
   -- animation timing control
   --******************************************************************
   -- counters 
   process(clk)
   begin
      if (clk'event and clk = '1') then
         x_d1_reg <= x;
         c_reg <= c_next;
         ani_reg <= ani_next;
      end if;
   end process;
   c_next <= 
      (others => '0') when frame_tick='1' and c_reg=9 else 
      c_reg +1 when frame_tick='1' else
      c_reg; 
   ani_next <= ani_reg + 1 when ani_tick='1' else ani_reg;
   -- 60-Hz tick from fram counter 
   frame_tick <= '1' when signed(x_d1_reg) = 0 and 
                          signed(x) = 1 and signed(y) = 0 else 
                 '0';
   -- sprite animation id tick 
   ani_tick   <= '1' when frame_tick = '1' and c_reg = 0 else '0';
   -- sprite id selection
   sid <= std_logic_vector(ani_reg) when auto = '1' else gc_id_sel;
   --******************************************************************
   -- delay line (one clock) 
   --******************************************************************
   process(clk)
   begin
      if (clk'event and clk = '1') then
         out_d1_reg <= out_rgb;
      end if;
   end process;
   sprite_rgb <= out_d1_reg;
end arch;
  