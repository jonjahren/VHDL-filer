----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2020 08:47:41
-- Design Name: 
-- Module Name: FSM_Example - Behavioral
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

entity FSM_Example is
    Port ( rst  : in STD_LOGIC;
           clk  : in STD_LOGIC;
           a    : in STD_LOGIC;
           b    : in STD_LOGIC;
           y0   : out STD_LOGIC;
           y1   : out STD_LOGIC);
end FSM_Example;

architecture Behavioral of FSM_Example is
-------------define the new data type for FSM------------
type FSM_EX is (S0, s1, s2);
signal state_next, state_reg : FSM_EX;

begin
-------------sequential block | state register-----------
 process (rst, clk)
    begin
        if (rst = '1') then
            state_reg <= S0;
        elsif(rising_edge(clk)) then
            --if (en = '1') then
                state_reg <= state_next;
            --end if;
        end if;
    end process;

-------------next state logic | combinational circuits----
----Inputs: External inputs signal (a,b) and state_reg----
----Output: State_next -----------------------------------
----State_Reg har høyest prioritet------------------------
process(a, b, state_Reg)
    begin
        case state_reg is --follow this
            when S0 =>
                if (a = '0') then
                    state_next <= S0;
                elsif (b = '0') then --a = 1, b = 0
                    state_next <= S1;
                else -- a = 1, b = 1
                    state_next <= S2;
                end if;
            when S1 =>
                if (a = '0') then
                    state_next <= S1;
                else
                    state_next <= S0;
                end if;
            when S2 =>
                state_next <= S0; -- unconditioned transition.
            when others =>
                state_next <= S0; --return the FSM to its initial state
        end case; 
    end process;

-------------output logic | combinational circuts---------
---------Inputs: state_reg and a, b ----------------------
y0 <= '1' when (a = '1') and (b = '1') and (state_reg = S0) else
    '0';
y1 <= '1' when state_reg = S0 or state_reg = S1 else
    '0';

end Behavioral;
