-- Listing 4.5 modified
library ieee;
use ieee.std_logic_1164.all;
entity adder_reg is
   port(
      clk, reset, en, clear: in std_logic;
      d: in std_logic_vector(7 downto 0);
      q: out std_logic_vector(7 downto 0)
   );
end adder_reg;

architecture arch of adder_reg is
begin
   process(clk,reset)
   begin
      if (reset='1') then
         q <=(others=>'0');
      elsif (clk'event and clk='1') then
			if (clear='1') then
				q <=(others=>'0');
			elsif (en='1') then
				q <= d;
			end if;
      end if;
   end process;
end arch;