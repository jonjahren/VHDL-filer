----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2021 09:48:09
-- Design Name: 
-- Module Name: Test_Data_Type - Behavioral
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

entity Test_Data_Type is
--  Port ( );
end Test_Data_Type;

architecture Behavioral of Test_Data_Type is
-- Declare Internal Signal
  signal s1, s2, s3, s4, s5, s6 : std_logic_vector(3 downto 0);
  signal u1, u2, u3, u4, u5, u6, u7 : unsigned(3 downto 0);
begin
-- u1 <= s1; -- This will not work mismatched data types  

  u1 <= unsigned(s1) -- This will work because casting

--  u2 <= 5; -- 5 can be natural or integer so this will not work

--  u2 <= to_unsigned(abs(5), 4); -- This gives error message

--  s5 <= s1 + s2; -- integer addition not supported

  s5 <= std_logic_vector(unsigned(s1) + unsigned(s2));
  
end Behavioral;
