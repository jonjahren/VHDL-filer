
-- josemmf@usn.no | 2022.02

library ieee;
use ieee.std_logic_1164.all;
-- BS register

use ieee.numeric_std.all;
entity bs_register is
   port(
		clk, reset: in std_logic;
      tdi: in std_logic;
		bsc_p_in0, bsc_p_in1, bsc_p_in2, bsc_p_in3, bsc_p_in4, bsc_p_in5: in std_logic;
		bsc_csff_en, bsc_lff_en: in std_logic;
		bsc_cs_mux_ctr, bsc_l_mux_ctr: in std_logic;
		bsc_p_out0, bsc_p_out1, bsc_p_out2, bsc_p_out3, bsc_p_out4, bsc_p_out5: out std_logic;
		bsreg_out: out std_logic
   );
end bs_register;

architecture arch of bs_register is
	signal bsc_s_out0, bsc_s_out1, bsc_s_out2, bsc_s_out3, bsc_s_out4: std_logic;

begin
   bs_cell0_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in0, bsc_s_in => tdi,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out0, bsc_s_out => bsc_s_out0 
		);
					
   bs_cell1_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in1, bsc_s_in => bsc_s_out0,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out1, bsc_s_out => bsc_s_out1 
		);
					
   bs_cell2_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in2, bsc_s_in => bsc_s_out1,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out2, bsc_s_out => bsc_s_out2 
		);

   bs_cell3_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in3, bsc_s_in => bsc_s_out2,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out3, bsc_s_out => bsc_s_out3 
		);

   bs_cell4_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in4, bsc_s_in => bsc_s_out3,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out4, bsc_s_out => bsc_s_out4 
		);

   bs_cell5_unit: entity work.bs_cell(arch)
      port map(clk => clk, reset => reset,
			bsc_p_in => bsc_p_in5, bsc_s_in => bsc_s_out4,
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, bsc_l_mux_ctr => bsc_l_mux_ctr,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en,
			bsc_p_out => bsc_p_out5, bsc_s_out => bsreg_out
		);

end arch;