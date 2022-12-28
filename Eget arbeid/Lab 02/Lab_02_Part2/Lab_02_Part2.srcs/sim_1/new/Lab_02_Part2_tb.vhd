----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2020 09:16:43
-- Design Name: 
-- Module Name: Lab_02_Part2_tb - Behavioral
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

entity Lab_02_Part2_tb is
--  Port ( );
end Lab_02_Part2_tb;

architecture Behavioral of Lab_02_Part2_tb is

--Declare component here
component Lab_02_Part2
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component Lab_02_Part2;

--Internal Signal Declaration
signal a_tb : STD_LOGIC;
signal b_tb : STD_LOGIC;
signal cin_tb : STD_LOGIC;
signal sum_tb : STD_LOGIC;
signal cout_tb : STD_LOGIC;

begin

UUT: Lab_02_Part2
Port map (a => a_tb, b => b_tb, cin => cin_tb, sum => sum_tb, cout => cout_tb);

process 
    begin
        -----vector 1-----
        a_tb <= '0';
        b_tb <= '0';
        cin_tb <= '0';
        wait for 50 ns;
        
        -----vector 2-----
        a_tb <= '0';
        b_tb <= '0';
        cin_tb <= '1';
        wait for 50 ns;
        
        -----vector 3-----
        a_tb <= '0';
        b_tb <= '1';
        cin_tb <= '0';
        wait for 50 ns;
        
        -----vector 4-----
        a_tb <= '0';
        b_tb <= '1';
        cin_tb <= '1';
        wait for 50 ns;
        
        -----vector 5-----
        a_tb <= '1';
        b_tb <= '0';
        cin_tb <= '0';
        wait for 50 ns;
        
        -----vector 6-----
        a_tb <= '1';
        b_tb <= '0';
        cin_tb <= '1';
        wait for 50 ns;
        
        -----vector 7-----
        a_tb <= '1';
        b_tb <= '1';
        cin_tb <= '0';
        wait for 50 ns;
        
        -----vector 8-----
        a_tb <= '1';
        b_tb <= '1';
        cin_tb <= '1';
        wait;
    end process;

end Behavioral;
