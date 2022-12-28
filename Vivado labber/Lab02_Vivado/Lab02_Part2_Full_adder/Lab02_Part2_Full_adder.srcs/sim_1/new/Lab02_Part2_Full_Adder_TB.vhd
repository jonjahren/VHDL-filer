----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2020 09:54:43
-- Design Name: 
-- Module Name: Lab02_Part2_Full_Adder_TB - Behavioral
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

entity Lab02_Part2_Full_Adder_TB is
--  Port ( );
end Lab02_Part2_Full_Adder_TB;

architecture Behavioral of Lab02_Part2_Full_Adder_TB is
-----Component declaration------
component Lab02_part2_full_adder
        port ( A :in std_logic;
               B :in std_logic;
               Cin :in std_logic;
               Sum :out std_logic;
               Cout :out std_logic);
end component Lab02_part2_full_adder;
------Internal Signals-----
    signal A_TB, B_TB, Cin_TB, Sum_TB, COut_TB: std_logic;
begin
UUT:Lab02_part2_full_adder
port map( A => A_TB, B => B_TB, Cin=> Cin_TB, Sum => Sum_TB, Cout=> Cout_TB);
----Stimulus_process----
Test_Vector_process: process
begin
wait for 40 ns;
---- Test vector 1---------
A_TB <= '0';
B_TB <= '0';
Cin_TB <= '0';
wait for 100 ns;
---- Test vector 2---------
A_TB <= '0';
B_TB <= '0';
Cin_TB <= '1';
wait for 100 ns;
---- Test vector 2---------
A_TB <= '0';
B_TB <= '1';
Cin_TB <= '0';
wait for 100 ns;
---- Test vector 4---------
A_TB <= '0';
B_TB <= '1';
Cin_TB <= '1';
wait for 100 ns;
---- Test vector 5---------
A_TB <= '1';
B_TB <= '0';
Cin_TB <= '0';
wait for 100 ns;
---- Test vector 6---------
A_TB <= '1';
B_TB <= '0';
Cin_TB <= '1';
wait for 100 ns;
---- Test vector 7---------
A_TB <= '1';
B_TB <= '1';
Cin_TB <= '0';
wait for 100 ns;
---- Test vector 8---------
A_TB <= '1';
B_TB <= '1';
Cin_TB <= '1';
wait;
end process;



end Behavioral;
