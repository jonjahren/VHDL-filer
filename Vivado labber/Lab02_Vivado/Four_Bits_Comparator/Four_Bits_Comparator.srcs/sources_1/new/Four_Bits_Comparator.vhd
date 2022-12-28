----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2020 08:30:54
-- Design Name: 
-- Module Name: Four_Bits_Comparator - Behavioral
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

entity Four_Bits_Comparator is
    Port ( a4 : in STD_LOGIC_VECTOR (3 downto 0);
           b4 : in STD_LOGIC_VECTOR (3 downto 0);
           z4 : out STD_LOGIC);
end Four_Bits_Comparator;

architecture Behavioral of Four_Bits_Comparator is
------------ Component declaration-------
component two_bits_comparator
    Port ( a : in STD_LOGIC_VECTOR(1 downto 0);
           b : in STD_LOGIC_VECTOR(1 downto 0);
           z : out STD_LOGIC);
end component two_bits_comparator;
-----Internal Signal--------- 
signal z10, z32: STD_LOGIC;
begin
------ Component instiation-----

compare_bit_10: two_bits_comparator
port map (a => a4(1 downto 0),b => b4(1 downto 0), z=>z10);

compare_bit_32: two_bits_comparator
port map (a => a4(3 downto 2),b => b4(3 downto 2), z =>z32);

z4 <= z10 and z32;





end Behavioral;
