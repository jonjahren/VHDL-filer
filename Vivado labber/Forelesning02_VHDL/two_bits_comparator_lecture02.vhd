----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 09:32:21 AM
-- Design Name: 
-- Module Name: two_bits_comparator - Behavioral
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

entity two_bits_comparator is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end two_bits_comparator;

architecture Behavioral of two_bits_comparator is
------------------component declaration --------
component One_Bit_Comparator 
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end component One_Bit_Comparator;
------------------internal signal declaration---
signal Z0, Z1 :  STD_LOGIC;
begin
-------------------- component instantiation----
comparate_bit_0: One_Bit_Comparator
port map (i0 => a(0), i1 => b(0), eq => Z0);

comparate_bit_1: One_Bit_Comparator
port map (i0 => a(1), i1 => b(1), eq => Z1);

Z <= Z0 and Z1;

end Behavioral;
