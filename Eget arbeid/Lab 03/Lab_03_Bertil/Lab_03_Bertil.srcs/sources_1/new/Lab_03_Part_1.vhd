----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 08:28:27
-- Design Name: 
-- Module Name: Lab_03_Part_1 - Behavioral
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

entity Lab_03_Part_1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end Lab_03_Part_1;

architecture Behavioral of Lab_03_Part_1 is

begin

y <= i0 when sel = '0' else
     i1;

end Behavioral;
