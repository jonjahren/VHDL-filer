----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 10:06:31
-- Design Name: 
-- Module Name: Lab_03_Part_3 - Behavioral
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

entity Lab_03_Part_3 is
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end Lab_03_Part_3;

architecture Behavioral of Lab_03_Part_3 is

--------------internal signal-------------
signal sel:std_logic_vector(2 downto 0);

begin

sel <= en & a; --sel(2) = en, sel(1 down to 0) = a
with sel select
    y <=    "0001" when "100",
            "0010" when "101",
            "0100" when "110",
            "1000" when "111",
            "0000" when others;
            
end Behavioral;