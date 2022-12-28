----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:35:02 PM
-- Design Name: 
-- Module Name: mod_m_counter_new_tb - Behavioral
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

entity mod_m_counter_new_tb is
--  Port ( );
end mod_m_counter_new_tb;

architecture Behavioral of mod_m_counter_new_tb is
component mod_m_counter_new 
generic ( 	M : integer := 16;
			N : integer := 4);
    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end component mod_m_counter_new;
----------------- internal signals------------
constant 	M : integer := 16;
constant 	N : integer := 4;
constant	T_period : time := 10 ns;
signal clk 	: std_logic := '1';
signal rst 	: std_logic := '1';
signal en 	: std_logic := '0';
signal q 			: std_logic_vector(N-1 downto 0);
signal max_tick 	: std_logic;
begin
UUT_Counter : mod_m_counter_new
	generic map (M => M, N => N)
	port map (	rst => rst,
				clk => clk, 
				en => en,
				q	=> q,
				max_tick => max_tick);
-------------- clk -- generation----------
clk <= not clk after T_period/2 ;

---------------Other signals -------------
process
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		rst <= '0';
		wait until rising_edge(clk);
		en <= '1';
		wait ;
	end process;


end Behavioral;
