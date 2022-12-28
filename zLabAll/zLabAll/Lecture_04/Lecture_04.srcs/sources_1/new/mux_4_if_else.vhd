----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 08:47:21 AM
-- Design Name: 
-- Module Name: mux_4_if_else - Behavioral
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

entity mux_4_if_else is
    Port ( d0 	: in STD_LOGIC_VECTOR (7 downto 0);
           d1 	: in STD_LOGIC_VECTOR (7 downto 0);
           d2 	: in STD_LOGIC_VECTOR (7 downto 0);
           d3 	: in STD_LOGIC_VECTOR (7 downto 0);
           sel 	: in STD_LOGIC_VECTOR (1 downto 0);
           y 	: out STD_LOGIC_VECTOR (7 downto 0));
end mux_4_if_else;

architecture Behavioral of mux_4_if_else is
begin
process (sel, d0, d1, d2, d3)
	begin
		if (sel = "00") then -- first case
			y <= d0;
		elsif (sel = "01") then -- second case 
			y <= d1;
		elsif (sel = "10") then -- third case
			y <= d2;
		else -- fourth case | mean sel = 11
			y <= d3;		
		end if;
	end process;

end Behavioral;
