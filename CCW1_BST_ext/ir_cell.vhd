
-- josemmf@usn.no | 2022.02

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ir_cell is
    Port ( clk, reset: std_logic;
			  irc_p_in, irc_s_in: in  std_logic;
           irc_cs_mux_ctr: in  std_logic;
			  irc_csff_en, irc_lff_en: in  std_logic;
           irc_p_out, irc_s_out: out  std_logic;
			  TLR_on: in std_logic
	 );
end ir_cell;

architecture arch of ir_cell is
   signal irc_lff_reg, irc_lff_next: std_logic;
   signal irc_csff_reg, irc_csff_next, irc_cs_mux_out: std_logic;

begin

   -- D FF C/S (capture/shift)
   process(clk,reset)
   begin
      if (reset='1') then
         irc_csff_reg <='0';
      elsif rising_edge(clk) then
			irc_csff_reg <= irc_csff_next;
      end if;
   end process;
   -- CS IR next-state logic
   irc_csff_next <= irc_cs_mux_out when irc_csff_en='1' else irc_csff_reg;

	-- CS mux 
	irc_cs_mux_out <= irc_s_in when irc_cs_mux_ctr='1' else irc_p_in; -- irc_p_in = '0' or '1'

   -- D FF out (IR cell parallel output)
   process(clk,reset)
   begin
      if (reset='1') then
         irc_lff_reg <='1';
      elsif falling_edge(clk) then		
			if (TLR_on = '1') then 
				irc_lff_reg <= '1';
			else
				irc_lff_reg <= irc_lff_next;
			end if;				
      end if;
   end process;
   -- NT FF next-state logic
   irc_lff_next <= irc_csff_reg when irc_lff_en='1' else irc_lff_reg;

	-- pout mux (parallel output)
	irc_p_out <= irc_lff_reg;
	
	-- serial output
	irc_s_out <= irc_csff_reg;

end arch;

