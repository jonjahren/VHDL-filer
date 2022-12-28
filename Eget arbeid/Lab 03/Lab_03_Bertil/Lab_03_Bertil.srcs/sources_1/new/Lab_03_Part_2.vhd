----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 09:14:35
-- Design Name: 
-- Module Name: Lab_03_Part_2 - Behavioral
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

entity Lab_03_Part_2 is
    Port ( r : in STD_LOGIC_VECTOR (3 downto 0);
           pcode : out STD_LOGIC_VECTOR (2 downto 0));
end Lab_03_Part_2;

architecture Behavioral of Lab_03_Part_2 is

begin

pcode <=    "100" when (r(3) = '1') else
            "011" when (r(2) = '1') else
            "010" when (r(1) = '1') else
            "001" when (r(0) = '1') else
            "000";

end Behavioral;
