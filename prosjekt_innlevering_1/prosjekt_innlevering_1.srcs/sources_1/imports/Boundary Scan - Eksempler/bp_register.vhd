
-- josemmf@usn.no | 2022.02

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bp_register is
    Port ( clk, reset: std_logic;
			  bp_p_in, tdi: in  std_logic;
           bp_cs_mux_ctr: in  std_logic;
			  bp_csff_en: in  std_logic;
           bp_s_out: out  std_logic 
	 );
end bp_register;

architecture arch of bp_register is
   signal bp_s_in, bp_csff_reg, bp_csff_next, bp_cs_mux_out: std_logic;

begin

	bp_s_in <= tdi;
   -- D FF C/S (capture/shift)
   process(clk,reset)
   begin
      if (reset='1') then
         bp_csff_reg <='0';
      elsif (clk'event and clk='1') then
         bp_csff_reg <= bp_csff_next;
      end if;
   end process;
   -- CS BP next-state logic
   bp_csff_next <= bp_cs_mux_out when bp_csff_en='1' else bp_csff_reg;

	-- CS mux 
	bp_cs_mux_out <= bp_s_in when bp_cs_mux_ctr='1' else '0'; -- bp_p_in = '0' 
	
	-- serial output
	bp_s_out <= bp_csff_reg;

end arch;

