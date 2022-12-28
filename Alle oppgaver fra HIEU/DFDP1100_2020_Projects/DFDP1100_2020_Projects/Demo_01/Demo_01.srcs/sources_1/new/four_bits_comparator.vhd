----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 09:49:58 AM
-- Design Name: 
-- Module Name: four_bits_comparator - Behavioral
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

entity four_bits_comparator is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
		   z : out STD_LOGIC);
end four_bits_comparator;

architecture Behavioral of four_bits_comparator is
-------------------- component declaration----
component two_bits_comparator 
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component two_bits_comparator;
-------------internal signals----------------
signal Z10, Z32 : STD_LOGIC;
begin
----------------component instantiation-----
compare_bits_10: two_bits_comparator
port map (a => a(1 downto 0),b => b(1 downto 0), Z => Z10);

compare_bits_32: two_bits_comparator
port map (a => a(3 downto 2),b => b(3 downto 2), Z => Z32);

Z <= Z10 and Z32;

end Behavioral;
