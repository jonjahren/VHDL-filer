----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2020 09:37:11 AM
-- Design Name: 
-- Module Name: oppgave04_ex01 - Behavioral
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

entity oppgave04_ex01 is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end oppgave04_ex01;

architecture Behavioral of oppgave04_ex01 is

begin -- architeture

	process (X)
		begin -- begin og process
			
			case X is
				when "000" | "001" 			=> 
					Y <= "01";
				when "010" | "011" | "110" 	=>
					Y <= "11";
				when "100" | "101"			=>
					Y <= "00";
				when others 				=>
					Y <= "10";
			end case;
			-------------------If statement & simplified version ---------------
			-- if (X = "000" or X = "001") then
				-- Y <= "01";
			-- elsif X = "010" or X = "011" or X = "110"  then
				-- Y <= "11";
			-- elsif X = "100" or X = "101" then
				-- Y <= "00";
			-- else -- X = "111"
				-- Y <= "10";
			-- end if;
			
			----------------- If statement with full version ------------------
			-- if X = "000" then
				-- Y <= "01";
			-- elsif X = "001" then
				-- Y <= "01";
			-- elsif X = "010" then
				-- Y <= "11";
			-- elsif X = "011" then
				-- Y <= "11";
			-- elsif X = "100" then
				-- Y <= "00";
			-- elsif X = "101" then
				-- Y <= "00";
			-- elsif X = "110" then
				-- Y <= "11";
			-- else -- X = "111"
				-- Y <= "10";
			-- end if;
	end process;

end Behavioral;














