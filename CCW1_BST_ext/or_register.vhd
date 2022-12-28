----------------------------------------------------------------------------------
-- Override control register | josemmf@usn.no | 2022.02

library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;
entity or_register is
   port(
		clk, reset: in std_logic;
      tdi: in std_logic;
		orc_csff_en, orc_lff_en: in std_logic;
		orc_p_out0, orc_p_out1, orc_p_out2, orc_p_out3, orc_p_out4, orc_p_out5: out std_logic;
		oreg_out: out std_logic
   );
end or_register;

architecture arch of or_register is
	signal orc_s_out0, orc_s_out1, orc_s_out2, orc_s_out3, orc_s_out4: std_logic;

begin
   or_cell0_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => tdi,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out0, orc_s_out => orc_s_out0 
		);
					
   or_cell1_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => orc_s_out0,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out1, orc_s_out => orc_s_out1
		);
					
   or_cell2_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => orc_s_out1,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out2, orc_s_out => orc_s_out2
		);
					
   or_cell3_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => orc_s_out2,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out3, orc_s_out => orc_s_out3
		);
					
   or_cell4_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => orc_s_out3,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out4, orc_s_out => orc_s_out4
		);
					
   or_cell5_unit: entity work.or_cell(arch)
      port map(clk => clk, reset => reset,
			orc_s_in => orc_s_out4,
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en,
			orc_p_out => orc_p_out5, orc_s_out => oreg_out
		);
					
end arch;