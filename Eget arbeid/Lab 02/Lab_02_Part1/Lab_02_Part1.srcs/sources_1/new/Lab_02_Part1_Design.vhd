----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2020 08:58:16
-- Design Name: 
-- Module Name: Lab_02_Part1_Design - Behavioral
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

entity Lab_02_Part1_Design is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC);
end Lab_02_Part1_Design;

architecture Behavioral of Lab_02_Part1_Design is

begin

Z <= (A and (not B)) or (B and (not A)); --A xor B

end Behavioral;
