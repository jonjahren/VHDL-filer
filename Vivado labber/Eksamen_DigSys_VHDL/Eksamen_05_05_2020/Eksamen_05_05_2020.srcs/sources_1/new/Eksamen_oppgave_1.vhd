----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 09:19:40
-- Design Name: 
-- Module Name: Eksamen_oppgave_1 - Behavioral
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

entity Eksamen_oppgave_1 is
    Port ( d0 : in STD_LOGIC_VECTOR (1 downto 0);
           d1 : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end Eksamen_oppgave_1;

architecture Behavioral of Eksamen_oppgave_1 is

begin
Z <= ((d0(1) and (not d1(1))) or (d0(0) and (not d1(1)) and (not d1(0))) or (d0(1) and d0(0) and (not d1(0))));

end Behavioral;
