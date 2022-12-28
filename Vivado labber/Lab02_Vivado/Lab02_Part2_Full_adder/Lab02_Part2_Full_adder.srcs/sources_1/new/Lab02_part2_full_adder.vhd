----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2020 09:22:42
-- Design Name: 
-- Module Name: Lab02_part2_full_adder - arch_full_adder
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

entity Lab02_part2_full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Lab02_part2_full_adder;

architecture arch_full_adder of Lab02_part2_full_adder is
-----Internal signal----
signal A_XOR_B : std_logic;

begin
A_XOR_B <= (A and (not B)) or (B and (not A));
Cout <= (A and B) or (Cin and A_XOR_B);
Sum <= (A_XOR_B and (not Cin)) or (Cin and (not A_XOR_B));

end arch_full_adder;
