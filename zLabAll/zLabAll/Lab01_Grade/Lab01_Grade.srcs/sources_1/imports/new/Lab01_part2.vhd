----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 09:45:29
-- Design Name: 
-- Module Name: Lab01_part2 - Behavioral
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

----------------internal signals-------------
signal p0, p1, p2, p3 : std_logic;
---------------------------------------------

begin

p0 <= (not a(1)) and (not a(0)) and (not b(1)) and (not b(0));

p1 <= (not a(1)) and (a(0)) and (not b(1)) and (b(0));

p2 <= (a(1)) and (not a(0)) and (b(1)) and (not b(0));

p3 <= a(1) and a(0) and b(1) and b(0);

z <= p0 or p1 or p2 or p3;  
end Behavioral;
