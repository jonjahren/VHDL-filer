----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 09:24:49
-- Design Name: 
-- Module Name: Lab01part2 - Behavioral
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

entity Lab01part2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end Lab01part2;

architecture Behavioral of Lab01part2 is

component Lab01
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end component Lab01;

--Internal Signals--
signal z1, z2 : std_logic;

begin

--two bit comparator--
komparator_bit_0 : Lab01
port map (i0 => a(0), i1 => b(0), eq => z1);

komparator_bit_1 : Lab01
port map (i0 => a(1), i1 => b(1), eq => z2);

z <= z1 and z2 ;
end Behavioral;
