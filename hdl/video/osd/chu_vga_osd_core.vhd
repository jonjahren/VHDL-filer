library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity chu_vga_osd_core is
   generic(
      CD        : integer                       := 12;
      KEY_COLOR : std_logic_vector(11 downto 0) := (others => '0')
   );
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      -- frame counter
      x       : in  std_logic_vector(10 downto 0);
      y       : in  std_logic_vector(10 downto 0);
      -- video slot interface
      cs      : in  std_logic;
      write   : in  std_logic;
      addr    : in  std_logic_vector(13 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- stream interface
      si_rgb  : in  std_logic_vector(CD - 1 downto 0);
      so_rgb  : out std_logic_vector(CD - 1 downto 0)
   );
end chu_vga_osd_core;

architecture arch of chu_vga_osd_core is
   signal wr_en        : std_logic;
   signal wr_reg       : std_logic;
   signal wr_bypass    : std_logic;
   signal wr_fg_color  : std_logic;
   signal wr_bg_color  : std_logic;
   signal wr_char_ram  : std_logic;
   signal fg_color_reg : std_logic_vector(CD - 1 downto 0);
   signal bg_color_reg : std_logic_vector(CD - 1 downto 0);
   signal bypass_reg   : std_logic;
   signal osd_rgb      : std_logic_vector(CD - 1 downto 0);
begin
   -- instantiate osd generator
   osd_src_unit : entity work.osd_src
      generic map(CD => CD)
      port map(
         clk       => clk,
         x         => x,
         y         => y,
         xt        => addr(6 downto 0),
         yt        => addr(11 downto 7),
         ch_in     => wr_data(7 downto 0),
         we_ch     => wr_char_ram,
         front_rgb => fg_color_reg,
         back_rgb  => bg_color_reg,
         osd_rgb   => osd_rgb);
   -- registers 
   process(clk, reset)
   begin
      if reset = '1' then
         fg_color_reg <= (others => '1');
         bg_color_reg <= (others => '0');
      elsif (clk'event and clk = '1') then
         if wr_fg_color = '1' then
            fg_color_reg <= wr_data(CD - 1 downto 0);
         end if;
         if wr_bg_color = '1' then
            bg_color_reg <= wr_data(CD - 1 downto 0);
         end if;
         if wr_bypass = '1' then
            bypass_reg <= wr_data(0);
         end if;
      end if;
   end process;
   -- decoding logic
   wr_en       <= '1' when write = '1' and cs = '1' else '0';
   wr_char_ram <= '1' when addr(13) = '0' and wr_en = '1' else '0';
   wr_reg      <= '1' when addr(13) = '1' and wr_en = '1' else '0';
   wr_bypass   <= '1' when wr_reg='1' and addr(1 downto 0)="00" else '0';
   wr_fg_color <= '1' when wr_reg='1' and addr(1 downto 0)="01" else '0';
   wr_bg_color <= '1' when wr_reg='1' and addr(1 downto 0)="10" else '0';
   -- chroma-key blending and multiplexing
   so_rgb <= si_rgb when bypass_reg='1' or osd_rgb=KEY_COLOR else osd_rgb;
end arch;
