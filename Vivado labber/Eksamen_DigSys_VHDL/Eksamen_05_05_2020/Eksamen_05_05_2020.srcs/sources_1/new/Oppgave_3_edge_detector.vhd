----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 10:47:53
-- Design Name: 
-- Module Name: Oppgave_3_edge_detector - Behavioral
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

entity Oppgave_3_edge_detector is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           level : in STD_LOGIC;
           tick : out STD_LOGIC);
end Oppgave_3_edge_detector;

architecture Behavioral of Oppgave_3_edge_detector is
signal state_reg,state_next: std_logic;
begin
--state register
process(clk,rst)
begin
    if (rst='1') then
    state_reg <= '0';
    state_next<= '0';
    elsif(rising_edge(clk)) then
    state_reg <= level;
    state_next <= state_reg;
    end if;
    end process;
 tick <= (not state_next) and state_reg;
    

end Behavioral;
