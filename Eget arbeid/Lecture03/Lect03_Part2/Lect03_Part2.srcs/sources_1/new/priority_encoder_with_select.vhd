----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2020 09:23:55
-- Design Name: 
-- Module Name: priority_encoder_with_select - Behavioral
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

entity priority_encoder_with_select is
    Port ( r : in STD_LOGIC_VECTOR (3 downto 0);
           pcode : out STD_LOGIC_VECTOR (2 downto 0));
end priority_encoder_with_select;

architecture Behavioral of priority_encoder_with_select is

begin
with r select
pcode <=    "100" when "1000"|"1001"|"1010"|"1011"|"1100"|"1101"|"1110"|"1111", -- "1---", og 1 betyr eller            
            "011" when "01--",
            "010" when "001-",
            "001" when "0001",
            "000" when others;
end Behavioral;
