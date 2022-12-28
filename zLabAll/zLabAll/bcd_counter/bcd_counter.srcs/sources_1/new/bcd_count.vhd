----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2021 12:32:03
-- Design Name: 
-- Module Name: bcd_count - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_7segment is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end bcd_7segment;
 
architecture Behavioral of bcd_7segment is
 
begin
 
process(BCDin)
begin

-- Figuring out which pins should be which was a terrible job --
-- Pinout should be ABCDEFG but that is not how the circuit maps it --
-- Also, it was terribly frustrating to understand that it is not --
-- ABCDEFG it's GFEDCBA -- 

case BCDin is
when "0000" =>
Seven_Segment <= "0111111"; --0
when "0001" =>
Seven_Segment <= "0000110"; --1
when "0010" =>
Seven_Segment <= "1011011"; --2
when "0011" =>
Seven_Segment <= "1001111"; --3
when "0100" =>
Seven_Segment <= "1100110"; --4
when "0101" =>
Seven_Segment <= "1101101"; --5
when "0110" =>
Seven_Segment <= "1111101"; --6
when "0111" =>
Seven_Segment <= "0000111"; --7
when "1000" =>
Seven_Segment <= "1111111"; --8
when "1001" =>
Seven_Segment <= "1100111"; --9
when others =>
Seven_Segment <= "0000000"; --null
end case;

-- After I fixed the source code it occured to me that I could have just reversed the connection order on the board... --
 
end process;

end architecture;
