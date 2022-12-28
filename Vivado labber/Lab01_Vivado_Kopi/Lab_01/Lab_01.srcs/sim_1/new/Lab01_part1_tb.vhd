----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2020 16:39:01
-- Design Name: 
-- Module Name: Lab01_part1_tb - Behavioral
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

entity Lab01_part1_tb is
--  Port ( );
end Lab01_part1_tb;

architecture Behavioral of Lab01_part1_tb is
---Component declaration---
component Lab01_part1
    Port ( i0   : in STD_LOGIC;
           i1   : in STD_LOGIC;
           eq   : out STD_LOGIC);
end component Lab01_part1;
---Internal signal--
signal i0_tb: std_logic;
signal i1_tb: std_logic;
signal eq_tb: std_logic;
begin
---UUT Instatiation--
UUT: Lab01_part1
port map(i0 => i0_tb, i1 => i1_tb, eq => eq_tb);
---Test vector


process
    begin
    wait for 40 ns;
---------------vector 1------------------
    i0_tb <= '0';
    i1_tb <= '0';
    wait for 100 ns;
    
    -------vector 2----------------
    i0_tb <= '0';
    i1_tb <= '1';
    wait for 100 ns;
    
    ------------vector 3----------
    i0_tb <= '1';
    i1_tb <= '0';
    wait for 100 ns;
    
    ------vector 4-----------------
    i0_tb <= '1';
    i1_tb <= '1';
    wait;
    
  end process;
end Behavioral;