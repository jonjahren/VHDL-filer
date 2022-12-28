----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 10:27:58
-- Design Name: 
-- Module Name: Eksamen_oppgave_2_if_else - Behavioral
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

entity Eksamen_oppgave_2_if_else is
    Port ( en : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (2 downto 0);
           Z : out STD_LOGIC_VECTOR (7 downto 0));
end Eksamen_oppgave_2_if_else;

architecture Behavioral of Eksamen_oppgave_2_if_else is

begin
process(en, d)
begin 
    if (en = '1') then
        if (d = "000") then
            Z <= "00000001";
        elsif (d="001") then
            Z <= "00000010";
        elsif (d="010") then
            Z <= "00000100";
        elsif (d="011") then
            Z <= "00001000";
        elsif (d="100") then
            Z <= "00010000";
        elsif (d="101") then
            Z <= "00100000";
        elsif (d="110") then
            Z <= "01000000";
        else
            Z <= "10000000";
            end if;
      else
      Z<= "00000000";
      end if;
end process;
end Behavioral;
