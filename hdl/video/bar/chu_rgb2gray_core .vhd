library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chu_rgb2gray_core is
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      -- video slot interface
      cs      : in  std_logic;
      write   : in  std_logic;
      addr    : in  std_logic_vector(13 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- stream interface
      si_rgb  : in  std_logic_vector(11 downto 0);
      so_rgb  : out std_logic_vector(11 downto 0)
   );
end chu_rgb2gray_core;

architecture arch of chu_rgb2gray_core is
   signal wr_en      : std_logic;
   signal bypass_reg : std_logic;
   signal gray_rgb   : std_logic_vector(11 downto 0);
begin
   -- instantiate rgb-to-grayscale conversion circuit
   rgb2gray_unit : entity work.rgb2gray
      port map(
         color_rgb => si_rgb,
         gray_rgb  => gray_rgb
      );
   -- register  
   process(clk, reset)
   begin
      if reset = '1' then
         bypass_reg <= '1';
      elsif (clk'event and clk = '1') then
         if wr_en = '1' then
            bypass_reg <= wr_data(0);
         end if;
      end if;
   end process;
   -- decoding 
   wr_en  <= '1' when write = '1' and cs = '1' else '0';
   -- blending: bypass mux
   so_rgb <= si_rgb when bypass_reg = '1' else gray_rgb;
end arch;
