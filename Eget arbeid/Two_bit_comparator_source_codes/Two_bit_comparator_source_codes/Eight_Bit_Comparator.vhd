----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2020 08:39:46 AM
-- Design Name: 
-- Module Name: Eight_Bit_Comparator - Behavioral
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

entity Eight_Bit_Comparator is
    Port ( A8 : in STD_LOGIC_VECTOR (7 downto 0);
           B8 : in STD_LOGIC_VECTOR (7 downto 0);
           Z8 : out STD_LOGIC);
end Eight_Bit_Comparator;

architecture Behavioral of Eight_Bit_Comparator is
-------------------- component declaration ------------------
component two_bits_comparator
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component two_bits_comparator;

-------------------- internal signals -----------------------
signal z10, z32, z54, z76 : STD_LOGIC; 

begin
-------------------- component instantiation ----------------
compare_bit_10: two_bits_comparator
port map (a => a8 (1 downto 0), b=> b8(1 downto 0),z => z10);

compare_bit_32: two_bits_comparator
port map (a => a8 (3 downto 2), b=> b8(3 downto 2),z => z32);

compare_bit_54: two_bits_comparator
port map (a => a8 (5 downto 4), b=> b8(5 downto 4),z => z54);

compare_bit_76: two_bits_comparator
port map (a => a8 (7 downto 6), b=> b8(7 downto 6),z => z76);

z8 <= z10 and z32 and z54 and z76;

end Behavioral;
