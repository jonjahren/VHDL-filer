----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2020 10:14:32
-- Design Name: 
-- Module Name: oppgave04_ex02_b - Behavioral
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

entity oppgave04_ex02_b is
    Port ( d0 : in STD_LOGIC_VECTOR (7 downto 0);
           d1 : in STD_LOGIC_VECTOR (7 downto 0);
           d2 : in STD_LOGIC_VECTOR (7 downto 0);
           d3 : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end oppgave04_ex02_b;

architecture Behavioral of oppgave04_ex02_b is

begin

    process(d0, d1, d2, d3, sel)
        begin
            case sel is
                when "00"   =>
                    Y <= d0;
                when "01"   =>
                    Y <= d1;  
                when "10"   =>
                    Y <= d2;
                when others =>
                    Y <= d3;      
            end case;
    end process;

end Behavioral;
