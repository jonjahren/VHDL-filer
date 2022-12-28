----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2020 15:51:06
-- Design Name: 
-- Module Name: Lab02_part2 - Behavioral
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

entity Lab01_part2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end Lab01_part2;

architecture Behavioral of Lab01_part2 is
------------------component declaration --------
component Lab01_part1 
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end component Lab01_part1;
------------------internal signal declaration---
signal Z0, Z1 :  STD_LOGIC;
begin
-------------------- component instantiation----
comparate_bit_0: Lab01_part1
port map (i0 => a(0), i1 => b(0), eq => Z0);

comparate_bit_1: Lab01_part1
port map (i0 => a(1), i1 => b(1), eq => Z1);

Z <= Z0 and Z1;

end Behavioral;
