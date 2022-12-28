----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 10:19:40
-- Design Name: 
-- Module Name: two_to_four_decoder_lab03_tb - Behavioral
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

entity two_to_four_decoder_lab03_tb is
--  Port ( );
end two_to_four_decoder_lab03_tb;

architecture Behavioral of two_to_four_decoder_lab03_tb is
----COmponent declaration---
component two_to_four_decoder_lab03 
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end component two_to_four_decoder_lab03;
----Internal signal----
signal en_tb: std_logic;
signal a_tb: std_logic_vector(1 downto 0);
signal z_tb: std_logic_vector(3 downto 0);

--- Component instatiation----
begin
UUT: two_to_four_decoder_lab03
port map( en => en_tb, a => a_tb, z => z_tb);

----Test vector generator-----
process
begin
wait for 40 ns;
----Test vector 1----
en_tb <= '0';
a_tb <= "00";
wait for 40 ns;
----Test vector 2----
en_tb <= '1';
a_tb <= "00";
wait for 40 ns;
----Test vector 3----
en_tb <= '0';
a_tb <= "01";
wait for 40 ns;
----Test vector 4----
en_tb <= '1';
a_tb <= "01";
wait for 40 ns;
----Test vector 5----
en_tb <= '0';
a_tb <= "10";
wait for 40 ns;
----Test vector 6----
en_tb <= '1';
a_tb <= "10";
wait for 40 ns;
----Test vector 7----
en_tb <= '0';
a_tb <= "11";
wait for 40 ns;
----Test vector 8----
en_tb <= '1';
a_tb <= "11";
wait;
end process;


end Behavioral;
