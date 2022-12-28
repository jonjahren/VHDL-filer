----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 08:32:05
-- Design Name: 
-- Module Name: two_to_one_mux_lab03_tb - Behavioral
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

entity two_to_one_mux_lab03_tb is
--  Port ( );
end two_to_one_mux_lab03_tb;

architecture Behavioral of two_to_one_mux_lab03_tb is
-------Component declaration------
component two_to_one_mux_lab03 
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end component two_to_one_mux_lab03;

----Internal Signal---
signal i0_tb: std_logic;
signal i1_tb: std_logic;
signal sel_tb: std_logic;
signal y_tb: std_logic;

--- Component instatiation----
begin
UUT: two_to_one_mux_lab03
port map( i0 => i0_tb, i1 => i1_tb, sel => sel_tb, y => y_tb);

----Test vector generator----
process 
begin
wait for 40 ns;

----Vector 1----
sel_tb <= '0';
i0_tb <= '0';
i1_tb <= '0';
wait for 100 ns;

----Vector 2----
sel_tb <= '0';
i0_tb <= '1';
i1_tb <= '0';
wait for 100 ns;
----Vector 3---
sel_tb <= '1';
i0_tb <= '0';
i1_tb <= '0';
wait for 100 ns;
----Vector 4----
sel_tb <= '1';
i0_tb <= '0';
i1_tb <= '1';
wait;
end process;

end Behavioral;
