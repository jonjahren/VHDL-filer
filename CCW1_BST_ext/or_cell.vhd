
-- josemmf@usn.no | 2022.02

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_cell is
    Port ( clk, reset: std_logic;
			  orc_s_in: in  std_logic;
			  orc_csff_en, orc_lff_en: in  std_logic;
           orc_p_out, orc_s_out: out  std_logic
	 );
end or_cell;

architecture arch of or_cell is
   signal orc_lff_reg, orc_lff_next: std_logic;
   signal orc_csff_reg, orc_csff_next: std_logic;

begin

   -- D FF C/S (capture/shift)
   process(clk,reset)
   begin
      if (reset='1') then
         orc_csff_reg <='0';
      elsif rising_edge(clk) then
			orc_csff_reg <= orc_csff_next;
      end if;
   end process;
   -- CS OR next-state logic
   orc_csff_next <= orc_s_in when orc_csff_en='1' else orc_csff_reg;

   -- D FF out (OR cell parallel output)
   process(clk,reset)
   begin
      if (reset='1') then
         orc_lff_reg <='0';
      elsif falling_edge(clk) then		
			orc_lff_reg <= orc_lff_next;
      end if;
   end process;
   -- NT FF next-state logic
   orc_lff_next <= orc_csff_reg when orc_lff_en='1' else orc_lff_reg;

	-- pout mux (parallel output)
	orc_p_out <= orc_lff_reg;
	
	-- serial output
	orc_s_out <= orc_csff_reg;

end arch;

