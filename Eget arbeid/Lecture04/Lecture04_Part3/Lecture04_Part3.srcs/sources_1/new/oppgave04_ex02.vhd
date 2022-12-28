----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2020 10:03:53
-- Design Name: 
-- Module Name: oppgave04_ex02 - Behavioral
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

entity oppgave04_ex02 is
    Port ( d0   : in STD_LOGIC_VECTOR (7 downto 0);
           d1   : in STD_LOGIC_VECTOR (7 downto 0);
           d2   : in STD_LOGIC_VECTOR (7 downto 0);
           d3   : in STD_LOGIC_VECTOR (7 downto 0);
           sel  : in STD_LOGIC_VECTOR (1 downto 0);
           Y    : out STD_LOGIC_VECTOR (7 downto 0));
end oppgave04_ex02;

architecture Behavioral of oppgave04_ex02 is

begin

    process(d0, d1, d2, d3, sel)
        begin
            if sel = "00" then
                Y <= d0;
            elsif sel = "01" then
                Y <= d1;
            elsif sel = "10" then
                Y <= d2;
            else
                Y <= d3;
            end if;
    end process;


end Behavioral;
