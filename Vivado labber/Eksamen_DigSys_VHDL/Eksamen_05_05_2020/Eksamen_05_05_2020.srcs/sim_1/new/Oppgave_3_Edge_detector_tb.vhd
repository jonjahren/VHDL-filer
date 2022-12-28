----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 11:09:46
-- Design Name: 
-- Module Name: Oppgave_3_Edge_detector_tb - Behavioral
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

entity Oppgave_3_Edge_detector_tb is
--  Port ( );
end Oppgave_3_Edge_detector_tb;

architecture Behavioral of Oppgave_3_Edge_detector_tb is
------Component declaration---
component Oppgave_3_edge_detector
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           level : in STD_LOGIC;
           tick : out STD_LOGIC);
end component Oppgave_3_edge_detector;

-------Internal signal----
constant clk_period :time := 10 ns;
signal rst_tb:std_logic:= '0';
signal level_tb:std_logic:= '0';
signal tick_tb: std_logic:= '0';
signal clk_tb: std_logic := '1';


begin
----UUT

UUT: Oppgave_3_edge_detector
port map(clk => clk_tb,
        rst=> rst_tb,
        level=> level_tb,
        tick=> tick_tb);
        
------Test vector generator
-----Clk generator
clk_tb <= (not clk_tb) after clk_period/2;

process
    begin
       wait until rising_edge(clk_tb);
       rst_tb <='1'; --- reset
       wait until rising_edge(clk_tb);
       wait until rising_edge(clk_tb);
       rst_tb <='0';
       wait until rising_edge(clk_tb);
       level_tb <= '1';
       wait until rising_edge(clk_tb);
       level_tb <= '0';
       wait until rising_edge(clk_tb);
       
       
       end process;
end Behavioral;
