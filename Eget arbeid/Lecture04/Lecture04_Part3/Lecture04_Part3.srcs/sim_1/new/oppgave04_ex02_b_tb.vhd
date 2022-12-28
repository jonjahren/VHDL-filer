----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2020 10:22:49
-- Design Name: 
-- Module Name: oppgave04_ex02_b_tb - Behavioral
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

entity oppgave04_ex02_b_tb is
--  Port ( );
end oppgave04_ex02_b_tb;

architecture Behavioral of oppgave04_ex02_b_tb is

component oppgave04_ex02_b
    Port ( d0 : in STD_LOGIC_VECTOR (7 downto 0);
           d1 : in STD_LOGIC_VECTOR (7 downto 0);
           d2 : in STD_LOGIC_VECTOR (7 downto 0);
           d3 : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component oppgave04_ex02_b;

--internal signal
signal d0_tb : STD_LOGIC_VECTOR (7 downto 0);
signal d1_tb : STD_LOGIC_VECTOR (7 downto 0);
signal d2_tb : STD_LOGIC_VECTOR (7 downto 0);
signal d3_tb : STD_LOGIC_VECTOR (7 downto 0);
signal sel_tb : STD_LOGIC_VECTOR (1 downto 0);
signal Y_tb : STD_LOGIC_VECTOR (7 downto 0);


begin

-------------------- UUT instantiation ------------------------------
UUT: oppgave04_ex02_b
Port map (d0 => d0_tb, d1 => d1_tb, d2 => d2_tb, d3 => d3_tb, sel => sel_tb, Y => Y_tb);

Test_Vector_Process: process 
    begin
        -----vector 1-----
        d0_tb <= "00000000";
        d1_tb <= "00001111";
        d2_tb <= "11110000";
        d3_tb <= "11111111";
        sel_tb <= "00";
        wait for 50 ns; 
        -----vector 2-----
        d0_tb <= "00000000";
        d1_tb <= "00001111";
        d2_tb <= "11110000";
        d3_tb <= "11111111";
        sel_tb <= "01";
        wait for 50 ns; 
        -----vector 3-----
        d0_tb <= "00000000";
        d1_tb <= "00001111";
        d2_tb <= "11110000";
        d3_tb <= "11111111";
        sel_tb <= "10";
        wait for 50 ns; 
        -----vector 4-----
        d0_tb <= "00000000";
        d1_tb <= "00001111";
        d2_tb <= "11110000";
        d3_tb <= "11111111";
        sel_tb <= "11";
        wait; 
    end process;

end Behavioral;
