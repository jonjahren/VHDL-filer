-- "place holder" in a cascading chain 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chu_vga_dummy_core is
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      -- MM video interface
      cs      : in  std_logic;
      write   : in  std_logic;
      addr    : in  std_logic_vector(13 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- stream interface
      si_rgb  : in  std_logic_vector(11 downto 0);
      so_rgb  : out std_logic_vector(11 downto 0)
   );
end chu_vga_dummy_core;

architecture arch of chu_vga_dummy_core is
begin
   so_rgb <= si_rgb;
end arch;
