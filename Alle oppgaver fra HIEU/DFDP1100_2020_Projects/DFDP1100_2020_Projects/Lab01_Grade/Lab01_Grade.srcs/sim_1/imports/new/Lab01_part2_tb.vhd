----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 09:49:09
-- Design Name: 
-- Module Name: Lab01_part2_tb - Behavioral
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

entity Lab01_part2_tb is
--  Port ( );
end Lab01_part2_tb;

architecture Behavioral of Lab01_part2_tb is

-------------------------Declare component here
component Lab01_part2
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component Lab01_part2;

----------------------- internal Signal Decleration----
signal a_tb: std_logic_VECTOR (1 downto 0);
signal b_tb: std_logic_VECTOR (1 downto 0);
signal z_tb: std_logic;

begin

UUT: Lab01_part2
port map (a=> a_tb, b => b_tb, z=> z_tb);

process
    begin
        -----------vector 0-------
        a_tb <= "00";
        b_tb <= "00";
        wait for 40 ns;
        ------------vector 1-------
        a_tb <= "01";
        b_tb <= "00";
        wait for 40 ns;
        ------------vector 2-------
        a_tb <= "10";
        b_tb <= "00";
        wait for 40 ns;
         ------------vector 3-------
        a_tb <= "11";
        b_tb <= "00";
        wait for 40 ns;
         ------------vector 4-------
        a_tb <= "00";
        b_tb <= "01";
        wait for 40 ns;
        ------------vector 5-------
        a_tb <= "01";
        b_tb <= "01";
        wait for 40 ns;
        ------------vector 6-------
        a_tb <= "10";
        b_tb <= "01";
        wait for 40 ns;
        ------------vector 7-------
        a_tb <= "11";
        b_tb <= "01";
        wait for 40 ns;
        ------------vector 8-------
        a_tb <= "00";
        b_tb <= "10";
        wait for 40 ns;
        ------------vector 9-------
        a_tb <= "01";
        b_tb <= "10";
        wait for 40 ns;
        ------------vector 10-------
        a_tb <= "10";
        b_tb <= "10";
        wait for 40 ns;
        ------------vector 11-------
        a_tb <= "11";
        b_tb <= "10";
        wait for 40 ns;
        ------------vector 12-------
        a_tb <= "00";
        b_tb <= "11";
        wait for 40 ns;
        ------------vector 13-------
        a_tb <= "01";
        b_tb <= "11";
        wait for 40 ns;
        ------------vector 14-------
        a_tb <= "10";
        b_tb <= "11";
        wait for 40 ns;
        ------------vector 15-------
        a_tb <= "11";
        b_tb <= "11";
        wait for 40 ns;

end process; 

end Behavioral;
