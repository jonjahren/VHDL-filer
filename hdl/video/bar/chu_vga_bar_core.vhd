library ieee;
use ieee.std_logic_1164.all;
entity chu_vga_bar_core is
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      -- frame counter
      x, y    : in  std_logic_vector(10 downto 0);
      -- video slot interface
      cs      : in  std_logic;
      write   : in  std_logic;
      addr    : in  std_logic_vector(13 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- stream interface
      si_rgb  : in  std_logic_vector(11 downto 0);
      so_rgb  : out std_logic_vector(11 downto 0)
   );
end chu_vga_bar_core;

architecture arch of chu_vga_bar_core is
   signal wr_en      : std_logic;
   signal bypass_reg : std_logic;
   signal bar_rgb    : std_logic_vector(11 downto 0);
begin
   -- instantiate bar generator
   bar_src_unit : entity work.bar_src
      port map(
         clk     => clk,
         x       => x,
         y       => y,
         bar_rgb => bar_rgb);
   -- register  
   process(clk, reset)
   begin
      if reset = '1' then
         bypass_reg <= '0';
      elsif (clk'event and clk = '1') then
         if wr_en = '1' then
            bypass_reg <= wr_data(0);
         end if;
      end if;
   end process;
   -- decoding 
   wr_en  <= '1' when write = '1' and cs = '1' else '0';
   --  blending: bypass mux 
   so_rgb <= si_rgb when bypass_reg = '1' else bar_rgb;
end arch;
