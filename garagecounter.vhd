-- Garage debouncer code --

-- Library declarations --
library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- debouncer logic --

entity debouncer is
  Generic(debnc_clocks : integer range 2 to (integer'high) := 2**16;
          port_width : integer range 1 to(integer'high) := 4);
  port(signal_i : in std_logic_vector((port_width - 1) downto 0);
       clk_i : in std_logic;
       signal_o : out std_logic_vector((port_width - 1) downto 0));
end debouncer;

architecture behavioral of debouncer is

  constant cntr_width : integer :=(ceil(log2(real(debnc_clocks))));
  constant cntr_max : std_logic_vector((cntr_width - 1) downto 0) := std_logic_cetor(to_unsigned((debnc_clocks -1), cntr_width));
  type vector_array_type is array(integer range <>) of std_logic_vector((cntr_width - 1) downto 0);
  
