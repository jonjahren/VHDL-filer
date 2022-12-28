
-- josemmf@usn.no | 2022.02

library ieee;
use ieee.std_logic_1164.all;
-- top level (BS architecture and internal circuitry)

use ieee.numeric_std.all;
entity toplevel is
   port(
		clk, reset: in std_logic;
      tdi, tms: in std_logic;
		in0, in1, in2: in std_logic;
		out0, out1, out2: out std_logic;
		tdo: out std_logic
   );
end toplevel;

architecture arch of toplevel is
	signal core_logic0, core_logic1, core_logic2: std_logic;
	signal bsc_csff_en, bsc_lff_en, bsc_cs_mux_ctr, bsc_l_mux_ctr: std_logic;
	signal bsc_l_mux_ctr0, bsc_l_mux_ctr1, bsc_l_mux_ctr2: std_logic;
	signal bsc_l_mux_ctr3, bsc_l_mux_ctr4, bsc_l_mux_ctr5: std_logic;	
	signal d_mux_in0, d_mux_in1, d_mux_in2, d_mux_in3: std_logic;
	signal d_mux_ctr0, d_mux_ctr1, d_mux_out: std_logic;
	signal bp_cs_mux_ctr, bp_csff_en: std_logic;
	signal orc_csff_en, orc_lff_en: std_logic;
	signal orc_p_out0, orc_p_out1, orc_p_out2, orc_p_out3, orc_p_out4, orc_p_out5: std_logic;
	signal irc_csff_en, irc_lff_en, irc_cs_mux_ctr: std_logic;
	signal irc_p_out0, irc_p_out1, irc_p_out2, irc_p_out3: std_logic;
	signal di_mux_in0, di_mux_in1, di_mux_ctr, di_mux_out: std_logic;
	signal EXTEST_on, SP_on, BYPASS_on, OVRD_on: std_logic;
	signal TLR_on, CAPT_DR_on, SHIFT_DR_on, UPDT_DR_on: std_logic;
	signal CAPT_IR_on, SHIFT_IR_on, UPDT_IR_on: std_logic;

begin
   bs_register_unit: entity work.bs_register(arch)
      port map(clk => clk, reset => reset, tdi => tdi, 
			bsc_p_in0 => in0, bsc_p_in1 => in1, bsc_p_in2 => in2,
			bsc_p_in3 => core_logic2, bsc_p_in4 => core_logic1, bsc_p_in5 => core_logic0,
			bsc_csff_en => bsc_csff_en, bsc_lff_en => bsc_lff_en, 
			bsc_cs_mux_ctr => bsc_cs_mux_ctr, 
			bsc_l_mux_ctr0 => bsc_l_mux_ctr0, bsc_l_mux_ctr1 => bsc_l_mux_ctr1, 
			bsc_l_mux_ctr2 => bsc_l_mux_ctr2, bsc_l_mux_ctr3 => bsc_l_mux_ctr3,
			bsc_l_mux_ctr4 => bsc_l_mux_ctr4, bsc_l_mux_ctr5 => bsc_l_mux_ctr5,
			bsc_p_out0 => core_logic0, bsc_p_out1 => core_logic1, bsc_p_out2 => core_logic2,
			bsc_p_out3 => out2, bsc_p_out4 => out1, bsc_p_out5 => out0,
			bsreg_out => d_mux_in0
		);
		

   bp_register_unit: entity work.bp_register(arch)
      port map(clk => clk, reset => reset,
			bp_p_in => '0', tdi => tdi, 
			bp_cs_mux_ctr => bp_cs_mux_ctr, bp_csff_en => bp_csff_en,
			bp_s_out => d_mux_in1
		);

   or_register_unit: entity work.or_register(arch)
      port map(clk => clk, reset => reset, tdi => tdi, 
			orc_csff_en => orc_csff_en, orc_lff_en => orc_lff_en, 
			orc_p_out0 => orc_p_out0, orc_p_out1 => orc_p_out1, orc_p_out2 => orc_p_out2,
			orc_p_out3 => orc_p_out3, orc_p_out4 => orc_p_out4, orc_p_out5 => orc_p_out5, 
			oreg_out => d_mux_in2
		);

   ir_register_unit: entity work.ir_register(arch)
      port map(clk => clk, reset => reset, tdi => tdi, 
			irc_p_in0 => '1', irc_p_in1 => '0', irc_p_in2 => '0', irc_p_in3 => '1', 
			irc_csff_en => irc_csff_en, irc_lff_en => irc_lff_en, 
			irc_cs_mux_ctr => irc_cs_mux_ctr, TLR_on => TLR_on,
			irc_p_out0 => irc_p_out0, irc_p_out1 => irc_p_out1, 
			irc_p_out2 => irc_p_out2, irc_p_out3 => irc_p_out3, 
			ireg_out => di_mux_in1
		);

   tapc_fsm_unit: entity work.tapc_fsm(arch)
      port map(clk => clk, reset => reset, tms => tms, TLR_on => TLR_on,
			CAPT_DR_on => CAPT_DR_on, SHIFT_DR_on => SHIFT_DR_on, UPDT_DR_on => UPDT_DR_on,
			CAPT_IR_on => CAPT_IR_on, SHIFT_IR_on => SHIFT_IR_on, UPDT_IR_on => UPDT_IR_on
		);
		
-- glue logic in the test architecture

	bsc_csff_en <= '1' when ((EXTEST_on='1' or SP_on='1') and (CAPT_DR_on='1' or SHIFT_DR_on='1')) else '0';
	bsc_lff_en <= '1' when ((EXTEST_on='1' or SP_on='1') and (UPDT_DR_on='1')) else '0';
	bsc_cs_mux_ctr <= '1' when SHIFT_DR_on='1' else '0';
	
	bsc_l_mux_ctr0 <= '1' when (EXTEST_on='1' or orc_p_out0='1') else '0';
	bsc_l_mux_ctr1 <= '1' when (EXTEST_on='1' or orc_p_out1='1') else '0';
	bsc_l_mux_ctr2 <= '1' when (EXTEST_on='1' or orc_p_out2='1') else '0';
	bsc_l_mux_ctr3 <= '1' when (EXTEST_on='1' or orc_p_out3='1') else '0';
	bsc_l_mux_ctr4 <= '1' when (EXTEST_on='1' or orc_p_out4='1') else '0';
	bsc_l_mux_ctr5 <= '1' when (EXTEST_on='1' or orc_p_out5='1') else '0';

	bp_cs_mux_ctr <= '1' when SHIFT_DR_on='1' else '0';
	bp_csff_en <= '1' when ((BYPASS_on='1') and (CAPT_DR_on='1' or SHIFT_DR_on='1')) else '0';

	orc_csff_en <= '1' when ((OVRD_on='1') and (SHIFT_DR_on='1')) else '0';
	orc_lff_en <= '1' when ((OVRD_on='1') and (UPDT_DR_on='1')) else '0';

	irc_csff_en <= '1' when (CAPT_IR_on='1' or SHIFT_IR_on='1') else '0';
	irc_lff_en <= '1' when UPDT_IR_on='1' else '0';
	irc_cs_mux_ctr <= '1' when SHIFT_IR_on='1' else '0';
	
	EXTEST_on <= '1' when (irc_p_out0='0' and  irc_p_out1='0' 
							  and  irc_p_out2='0' and  irc_p_out3='0') else '0';
	SP_on <=  '1' when (irc_p_out0='1' and  irc_p_out1='0'
						  and  irc_p_out2='0' and  irc_p_out3='1') else '0';
	BYPASS_on <= '1' when (irc_p_out0='1' and  irc_p_out1='1'
						  and  irc_p_out2='1' and  irc_p_out3='1') else '0';
	OVRD_on <= '1' when (irc_p_out0='0' and  irc_p_out1='1'
						  and  irc_p_out2='1' and  irc_p_out3='0') else '0';
  
	di_mux_in0 <= d_mux_out;
	d_mux_in3 <= '0';
	d_mux_ctr0 <= '1' when BYPASS_on='1' else '0';
	d_mux_ctr1 <= '1' when OVRD_on='1' else '0';
	di_mux_ctr <= '1' when SHIFT_IR_on='1' else '0';
	d_mux_out <= d_mux_in0 when (d_mux_ctr1='0' and d_mux_ctr0='0') else
					 d_mux_in1 when (d_mux_ctr1='0' and d_mux_ctr0='1') else
					 d_mux_in2 when (d_mux_ctr1='1' and d_mux_ctr0='0') else
					 d_mux_in3 when (d_mux_ctr1='1' and d_mux_ctr0='1');
	di_mux_out <= di_mux_in0 when di_mux_ctr = '0' else di_mux_in1;
	
	tdo <= di_mux_out;

end arch;