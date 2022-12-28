----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 09:33:50
-- Design Name: 
-- Module Name: Eksamen_oppgave_1_tb - Behavioral
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

entity Eksamen_oppgave_1_tb is
--  Port ( );
end Eksamen_oppgave_1_tb;

architecture Behavioral of Eksamen_oppgave_1_tb is
---- Component declaration -----
component Eksamen_oppgave_1 
    Port ( d0 : in STD_LOGIC_VECTOR (1 downto 0);
           d1 : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component Eksamen_oppgave_1;
------ Internal signal
signal d0_tb, d1_tb: std_logic_vector(1 downto 0);
signal Z_tb: std_logic;
-----UUT---


begin
UUT: Eksamen_oppgave_1 
port map(Z=> z_tb, d0 => d0_tb, d1 => d1_tb);
---Test vector generator
process
begin
wait for 40 ns;
---Test vector 1----
d0_tb <= "00";
d1_tb <= "00";
wait for 40 ns;
---Test vector 2----
d0_tb <= "00";
d1_tb <= "01";
wait for 40 ns;
---Test vector 3----
d0_tb <= "00";
d1_tb <= "10";
wait for 40 ns;
---Test vector 4----
d0_tb <= "00";
d1_tb <= "11";
wait for 40 ns;
---Test vector 5----
d0_tb <= "01";
d1_tb <= "00";
wait for 40 ns;
---Test vector 6----
d0_tb <= "01";
d1_tb <= "01";
wait for 40 ns;
---Test vector 7----
d0_tb <= "01";
d1_tb <= "10";
wait for 40 ns;
---Test vector 8----
d0_tb <= "01";
d1_tb <= "11";
wait for 40 ns;
---Test vector 9----
d0_tb <= "10";
d1_tb <= "00";
wait for 40 ns;
---Test vector 10----
d0_tb <= "10";
d1_tb <= "01";
wait for 40 ns;
---Test vector 11----
d0_tb <= "10";
d1_tb <= "10";
wait for 40 ns;
---Test vector 12---
d0_tb <= "10";
d1_tb <= "11";
wait for 40 ns;
---Test vector 13----
d0_tb <= "11";
d1_tb <= "00";
wait for 40 ns;
---Test vector 14----
d0_tb <= "11";
d1_tb <= "01";
wait for 40 ns;
---Test vector 15----
d0_tb <= "11";
d1_tb <= "10";
wait for 40 ns;
---Test vector 16----
d0_tb <= "11";
d1_tb <= "11";

wait;
end process;
end Behavioral;
