-- Listing 6.3 modified
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity multiplier is
   port(
      clk, reset: in std_logic;
      In_A, In_B: in std_logic_vector(3 downto 0);
      OR_Out: out std_logic_vector(7 downto 0)
   );
end multiplier;

architecture arch of multiplier is
   signal adder_in_A, adder_in_B, adder_out: unsigned(7 downto 0);
   signal AR_out: std_logic_vector(7 downto 0);
	signal load, dec, zero_tick, clear_AR, update_AR, update_OR: std_logic;

begin
   -- instantiate down counter
   counter: entity work.down_counter(arch)
      port map(
         clk=>clk, reset=>reset, load=>load,
         d=>In_B, dec=> dec, zero_tick=>zero_tick
      );
   -- adder circuit
	adder_in_A <= unsigned("0000" & In_A);
	adder_in_B <= unsigned(AR_out);
   adder_out <= 
		adder_in_B + adder_in_A;
   -- instantiate adder register
   adder_reg: entity work.adder_reg(arch)
      port map(
         clk=>clk, reset=>reset,
			en=>update_AR, clear=>clear_AR,
         d=>std_logic_vector(adder_out),
			q=>AR_out
      );
	-- instantiate output register
   output_reg: entity work.out_reg(arch)
      port map(
         clk=>clk, reset=>reset,
			en=>update_OR,
         d=>AR_out,
			q=>OR_out
      );
	-- instantiate FSM control path
   control_path: entity work.fsm(arch)
      port map(
         clk=>clk, reset=>reset,
         load=>load, dec=>dec, zero_tick=>zero_tick,
			clear_AR=>clear_AR, update_AR=>update_AR, update_OR=>update_OR
      );
	
end arch;