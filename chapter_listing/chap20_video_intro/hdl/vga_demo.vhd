library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity vga_demo is
   generic(
      CD : integer := 12  -- color depth
   );
   port(
      clk   : in  std_logic;
      -- switch control 
      sw    : in  std_logic_vector(13 downto 0);
      -- to vga monitor
      hsync : out std_logic;
      vsync : out std_logic;
      rgb   : out std_logic_vector(CD - 1 downto 0)
   );
end vga_demo;

architecture arch of vga_demo is
   signal hc, vc      : std_logic_vector(10 downto 0);
   signal bar_rgb     : std_logic_vector(CD - 1 downto 0);
   signal back_rgb    : std_logic_vector(CD - 1 downto 0);
   signal gray_rgb    : std_logic_vector(CD - 1 downto 0);
   signal color_rgb   : std_logic_vector(CD - 1 downto 0);
   signal vga_rgb     : std_logic_vector(CD - 1 downto 0);
   signal bypass_bar  : std_logic;
   signal bypass_gray : std_logic;
begin
   -- use switches to set background color
   back_rgb    <= sw(13 downto 2);
   bypass_bar  <= sw(1);
   bypass_gray <= sw(0);
   -- instantiate bar generator
   bar_demo_unit : entity work.bar_demo
      port map(
         x       => hc,
         y       => vc,
         bar_rgb => bar_rgb
      );
   -- instantiate color-to-gray conversion circuit
   c2g_unit : entity work.rgb2gray
      port map(
         color_rgb => color_rgb,
         gray_rgb  => gray_rgb
      );
   -- instantiate video synchronization circuit
   sync_unit : entity work.vga_sync_demo
      generic map(CD => CD)
      port map(
         clk        => clk,
         reset      => '0',
         vga_si_rgb => vga_rgb,
         hsync      => hsync,
         vsync      => vsync,
         rgb        => rgb,
         hc         => hc,
         vc         => vc
      );
   -- video source selection mux #1  
   color_rgb <= back_rgb when bypass_bar = '1' else bar_rgb;
   -- video source selection mux #0  
   vga_rgb <= color_rgb when bypass_gray = '1' else gray_rgb;
end arch;
