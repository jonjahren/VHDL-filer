-- Listing 5.2 modified
library ieee;
use ieee.std_logic_1164.all;
entity fsm is
   port(
      clk, reset: in std_logic;
      zero_tick: in std_logic;
      load, dec, clear_AR, update_AR, update_OR: out std_logic
   );
end fsm;

architecture arch of fsm is
   type eg_state_type is (s0, s1);
   signal state_reg, state_next: eg_state_type;
begin
   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= s0;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state/output logic
   process(state_reg,zero_tick)
   begin
      state_next <= state_reg;  -- default back to same state
      load <= '0';  -- all outputs default to '0'  
      dec <= '0';   
		clear_AR <= '0';
		update_AR <= '0';
		update_OR <= '0';
      case state_reg is
         when s0 =>
            load <= '1';
				state_next <= s1;
         when s1 =>
            if (zero_tick='1') then
					update_OR <= '1';
					clear_AR <= '1';
					load <= '1';
               state_next <= s0;
            else 
					update_AR <= '1';
					dec <= '1';
               state_next <= s1;
            end if;
      end case;
   end process;
end arch;