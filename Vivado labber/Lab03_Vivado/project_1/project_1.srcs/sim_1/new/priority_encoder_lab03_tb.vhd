----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 09:37:26
-- Design Name: 
-- Module Name: priority_encoder_lab03_tb - Behavioral
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

entity priority_encoder_lab03_tb is
--  Port ( );
end priority_encoder_lab03_tb;

architecture Behavioral of priority_encoder_lab03_tb is
----Component declaration---
component priority_encoder_lab03 
    Port ( r : in STD_LOGIC_VECTOR (3 downto 0);
           pcode : out STD_LOGIC_VECTOR (2 downto 0));
end component priority_encoder_lab03;

-----Internal signal----
signal r_tb: std_logic_vector(3 downto 0);
signal pcode_tb: std_logic_vector(2 downto 0);

--- Component instatiation----
begin
UUT: priority_encoder_lab03
port map( r => r_tb, pcode => pcode_tb);

------Test vector generetaor----
process
begin
wait for 40 ns;

----Test vector 1----
r_tb <= "0000";
wait for 40 ns;
----Test vector 2----
r_tb <= "0001";
wait for 40 ns;
----Test vector 3----
r_tb <= "0010";
wait for 40 ns;
----Test vector 4----
r_tb <= "0100";
wait for 40 ns;
---Test vector 5---
r_tb <= "1000";
wait;

end process;

end Behavioral;
