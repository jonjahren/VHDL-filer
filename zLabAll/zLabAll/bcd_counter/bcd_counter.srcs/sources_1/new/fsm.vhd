----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2021 14:08:06
-- Design Name: 
-- Module Name: fsm - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
 Port ( 
        clock                      : in std_logic;
        reset                      : in std_logic;
        fsm_input_a, fsm_input_b   : in std_logic;
        fsm_output                 : out std_logic_vector(3 downto 0) 
        );
end fsm;

architecture finite_state_machine of fsm is
type eg_state_type is (s0, s1, s2);
signal state_reg, state_next : eg_state_type;
begin
-- state register
process(clock, reset)
begin
    if(reset = '1') then
        state_reg <= s0;
    elsif(clock'event and clock = '1') then
        state_reg <= state_next;
    end if;
    -- Next state logic
    fsm_logic : process(state_reg, fsm_input_a, fsm_input_b) is
    begin
        case state_reg is
            when state_reg <=
                if(fsm_input_a = '1')
                    
        
end process;


end architecture;
