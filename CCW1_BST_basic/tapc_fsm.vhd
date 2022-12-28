
-- josemmf@usn.no | 2022.02

library ieee;
use ieee.std_logic_1164.all;
entity tapc_fsm is
   port(
      clk, reset, tms: in std_logic;
		TLR_on, CAPT_DR_on, SHIFT_DR_on, UPDT_DR_on: out std_logic; 
		CAPT_IR_on, SHIFT_IR_on, UPDT_IR_on: out std_logic
   );
end tapc_fsm;

architecture arch of tapc_fsm is
   type state_type is (TLR, RTI,
							  SLDR, CPDR, SHDR, E1DR, PADR, E2DR, UPDR,
							  SLIR, CPIR, SHIR, E1IR, PAIR, E2IR, UPIR  );
   signal state_reg, state_next: state_type;
	
begin
   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= TLR;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state/output logic
   process(state_reg,tms)
   begin
      state_next <= state_reg;  -- default back to same state
		TLR_on <= '0';
		CAPT_DR_on <= '0';
		SHIFT_DR_on <= '0';
		UPDT_DR_on <= '0';
		CAPT_IR_on <= '0';
		SHIFT_IR_on <= '0';
		UPDT_IR_on <= '0';
		
      case state_reg is
         when TLR =>					-- Test Logic Reset
				TLR_on <= '1';
				if (tms='0') then 
					state_next <= RTI;
				end if;
         when RTI =>					-- Run Test / Idle
				if (tms='1') then 
					state_next <= SLDR;
				end if;
				
			when SLDR =>					-- Select Data Register
				if (tms='1') then
					state_next <= SLIR;
				else
					state_next <= CPDR;
				end if;
			when CPDR =>					-- Capture Data Register
				CAPT_DR_on <= '1';
				if (tms='1') then
					state_next <= E1DR;
				else
					state_next <= SHDR;
				end if;
			when SHDR =>					-- Shift Data Register
				SHIFT_DR_on <= '1';
				if (tms='1') then
					state_next <= E1DR;
				end if;
			when E1DR =>				-- Exit-1 Data Register
				if (tms='1') then
					state_next <= UPDR;
				else
					state_next <= PADR;
				end if;
			when PADR =>					-- Pause Data Register
				if (tms='1') then
					state_next <= E2DR;
				end if;
			when E2DR =>				-- Exit-2 Data Register
				if (tms='1') then
					state_next <= UPDR;
				else
					state_next <= SHDR;
				end if;
			when UPDR =>					-- Update Data Register
				UPDT_DR_on <= '1';
				if (tms='1') then
					state_next <= SLDR;
				else
					state_next <= RTI;
				end if;
					
			when SLIR =>					-- Select Instruction Register
				if (tms='1') then
					state_next <= TLR;
				else
					state_next <= CPIR;
				end if;
			when CPIR =>					-- Capture Instruction Register
				CAPT_IR_on <= '1';
				if (tms='1') then
					state_next <= E1IR;
				else
					state_next <= SHIR;
				end if;
			when SHIR =>					-- Shift Instruction Register
				SHIFT_IR_on <= '1';
				if (tms='1') then
					state_next <= E1IR;
				end if;
			when E1IR =>				-- Exit-1 Instruction Register
				if (tms='1') then
					state_next <= UPIR;
				else
					state_next <= PAIR;
				end if;
			when PAIR =>					-- Pause Instruction Register
				if (tms='1') then
					state_next <= E2IR;
				end if;
			when E2IR =>				-- Exit-2 Instruction Register
				if (tms='1') then
					state_next <= UPIR;
				else
					state_next <= SHIR;
				end if;
			when UPIR =>					-- Update Instruction Register
				UPDT_IR_on <= '1';
				if (tms='1') then
					state_next <= SLDR;
				else
					state_next <= RTI;
				end if;
      end case;
   end process;
end arch;