----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 10:15:06
-- Design Name: 
-- Module Name: two_to_four_decoder_lab03 - Behavioral
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

entity two_to_four_decoder_lab03 is
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end two_to_four_decoder_lab03;

architecture Behavioral of two_to_four_decoder_lab03 is
begin
z <= "0000" when (en='0') else
     "0001" when (a="00") else
     "0010" when (a="01") else
     "0100" when (a="10") else
     "1000" ;

end Behavioral;
