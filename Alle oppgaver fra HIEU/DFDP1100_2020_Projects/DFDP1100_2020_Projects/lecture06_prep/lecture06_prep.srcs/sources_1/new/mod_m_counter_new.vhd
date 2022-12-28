----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:04:52 PM
-- Design Name: 
-- Module Name: mod_m_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_counter_new is
generic ( 	M : integer := 16;
			N : integer := 4);
    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end mod_m_counter_new;

architecture Behavioral of mod_m_counter_new is
----------------- Internal signals ---------
signal state_reg : unsigned (N-1 downto 0);
signal state_next : unsigned(N-1 downto 0);
begin

---------------------  Reg_Block | Sequential Circuit -----------
process (rst, clk)
	begin
		if (rst = '1') then
			state_reg <= (others => '0');
		elsif (rising_edge(clk)) then
			if (en = '1') then
				state_reg <= state_next;
			end if; 
		end if;
	end process;
----------------------  Next stage logic | Combination Circuit ---
	state_next <= (others => '0') when state_reg = M-1 else
				   state_reg +1;
----------------------  Output logic | Combination circuit -------
	q 			<= std_logic_vector(state_reg);
	max_tick 	<= '1' when state_reg = M-1 else
	             '0';

end Behavioral;
