----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2020 09:40:57 AM
-- Design Name: 
-- Module Name: two_2_four_encoder_withselect - Behavioral
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

entity two_2_four_encoder_withselect is
    Port ( en 	: in STD_LOGIC;
           a 	: in STD_LOGIC_VECTOR (1 downto 0);
           y 	: out STD_LOGIC_VECTOR (3 downto 0));
end two_2_four_encoder_withselect;

architecture Behavioral of two_2_four_encoder_withselect is
signal sel :std_logic_vector(2 downto 0);
begin
sel <= en & a; --sel(2) = en, sel(1 downto 0) = a 


with sel select
	y <= "0000" when "0--", -- for simulation only
	     "0001" when "100",
		 "0010" when "101",
		 "0100" when "110",
         "1000" when others;
		 
-- with sel select
	-- y <= "0000" when "000" | "001" | "010" | "011",
	     -- "0001" when "100",
		 -- "0010" when "101",
		 -- "0100" when "110",
         -- "1000" when others;
		  
end Behavioral;





