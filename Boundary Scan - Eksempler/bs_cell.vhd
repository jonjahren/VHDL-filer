
-- josemmf@usn.no | 2022.02

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bs_cell is
generic(ncells: natural range 0 to 4 := 2)
    Port ( clk, reset: std_logic;
			  bsc_p_in, bsc_s_in: in  std_logic;
           bsc_cs_mux_ctr, bsc_l_mux_ctr: in  std_logic;
			  bsc_csff_en, bsc_lff_en: in  std_logic;
           bsc_p_out, bsc_s_out: out  std_logic 
	 );
end bs_cell;

architecture arch of bs_cell is
   signal bsc_lff_reg, bsc_lff_next: std_logic;
   signal bsc_csff_reg, bsc_csff_next, bsc_cs_mux_out: std_logic;

begin

   -- D FF C/S (capture/shift)
   process(clk,reset)
   begin
      if (reset='1') then
         bsc_csff_reg <='0';
      elsif rising_edge(clk) then
         bsc_csff_reg <= bsc_csff_next;
      end if;
   end process;
   -- CS BS next-state logic
   bsc_csff_next <= bsc_cs_mux_out when bsc_csff_en='1' else bsc_csff_reg;

	-- CS mux 
	bsc_cs_mux_out <= bsc_s_in when bsc_cs_mux_ctr='1' else bsc_p_in;

   -- D FF N/T (normal/test)
   process(clk,reset)
   begin
      if (reset='1') then
         bsc_lff_reg <='0';
      elsif falling_edge(clk) then
         bsc_lff_reg <= bsc_lff_next;
      end if;
   end process;
   -- NT FF next-state logic
   bsc_lff_next <= bsc_csff_reg when bsc_lff_en='1' else bsc_lff_reg;

	-- NT mux (parallel output)
	bsc_p_out <= bsc_lff_reg when bsc_l_mux_ctr='1' else bsc_p_in;
	
	-- serial output
	bsc_s_out <= bsc_csff_reg;

end arch;

