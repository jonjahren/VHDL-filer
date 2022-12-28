----------------------------------------------------------------------------------
-- IR register | josemmf@usn.no | 2022.02

library ieee;
use ieee.std_logic_1164.all;
-- IR register

use ieee.numeric_std.all;
entity ir_register is
   port(
		clk, reset: in std_logic;
      tdi: in std_logic;
		irc_p_in0, irc_p_in1, irc_p_in2, irc_p_in3: in std_logic;
		irc_csff_en, irc_lff_en: in std_logic;
		irc_cs_mux_ctr: in std_logic;
		TLR_on: in std_logic;
		irc_p_out0, irc_p_out1, irc_p_out2, irc_p_out3: out std_logic;
		ireg_out: out std_logic
   );
end ir_register;

architecture arch of ir_register is
	signal irc_s_out0, irc_s_out1, irc_s_out2: std_logic;

begin
   ir_cell0_unit: entity work.ir_cell(arch)
      port map(clk => clk, reset => reset,
			irc_p_in => '1', irc_s_in => tdi,
			irc_cs_mux_ctr => irc_cs_mux_ctr,
			irc_csff_en => irc_csff_en, irc_lff_en => irc_lff_en,
			irc_p_out => irc_p_out0, irc_s_out => irc_s_out0,
			TLR_on => TLR_on 
		);
					
   ir_cell1_unit: entity work.ir_cell(arch)
      port map(clk => clk, reset => reset,
			irc_p_in => '0', irc_s_in => irc_s_out0,
			irc_cs_mux_ctr => irc_cs_mux_ctr,
			irc_csff_en => irc_csff_en, irc_lff_en => irc_lff_en,
			irc_p_out => irc_p_out1, irc_s_out => irc_s_out1,
			TLR_on => TLR_on
		);
					
   ir_cell2_unit: entity work.ir_cell(arch)
      port map(clk => clk, reset => reset,
			irc_p_in => '0', irc_s_in => irc_s_out1,
			irc_cs_mux_ctr => irc_cs_mux_ctr,
			irc_csff_en => irc_csff_en, irc_lff_en => irc_lff_en,
			irc_p_out => irc_p_out2, irc_s_out => irc_s_out2,
			TLR_on => TLR_on
		);
					
   ir_cell3_unit: entity work.ir_cell(arch)
      port map(clk => clk, reset => reset,
			irc_p_in => '1', irc_s_in => irc_s_out2,
			irc_cs_mux_ctr => irc_cs_mux_ctr,
			irc_csff_en => irc_csff_en, irc_lff_en => irc_lff_en,
			irc_p_out => irc_p_out3, irc_s_out => ireg_out,
			TLR_on => TLR_on
		);
					
end arch;