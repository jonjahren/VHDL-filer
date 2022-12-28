----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 10:13:14
-- Design Name: 
-- Module Name: Eksamen_oppgave2_with_select - Behavioral
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

entity Eksamen_oppgave2_with_select is
    Port ( en : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (2 downto 0);
           Z : out STD_LOGIC_VECTOR (7 downto 0));
end Eksamen_oppgave2_with_select;

architecture Behavioral of Eksamen_oppgave2_with_select is
signal sel:std_logic_vector(3 downto 0);
begin
sel <= en & d; --Sel (3) = en, sel(2 downto 0) = d

with sel select
Z <= "00000001" when "1000",
     "00000010" when "1001",
     "00000100" when "1010",
     "00001000" when "1011",
     "00010000" when "1100",
     "00100000" when "1101",
     "01000000" when "1110",
     "10000000" when "1111",
     "00000000" when others;

end Behavioral;
