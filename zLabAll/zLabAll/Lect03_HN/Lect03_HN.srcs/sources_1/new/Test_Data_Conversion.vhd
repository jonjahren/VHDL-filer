----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 09:02:20 AM
-- Design Name: 
-- Module Name: Test_Data_Conversion - Behavioral
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
use IEEE.NUMERIC_STD.ALL; -- for arithmetic operations

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test_Data_Conversion is
--  Port ( );
end Test_Data_Conversion;

architecture Behavioral of Test_Data_Conversion is
signal s1, s2, s3, s4, s5, s6 : std_logic_vector(3 downto 0);
signal u1, u2, u3, u4, u5, u6, u7 : unsigned(3 downto 0);
signal a1 : std_logic;
signal a4 : std_logic_vector(3 downto 0) := "1010";
signal b8, c8, d8 : std_logic_vector(7 downto 0);
begin
b8 <= a4 & a4; -- b8 = "1010 1010"
c8 <= "11" & a4 & "00";
--u1 <= s1
--u1 <= unsigned(s1) ; -- it works
--s1 <= 5; -- not work because mismatch in datatype (left : std_logic_vector, right: natural number)
--s1 <= std_logic_vector(to_unsigned(5, 4)); -- it works
--s5 <= std_logic_vector(unsigned(s1) + unsigned(s2)) ;
end Behavioral;



