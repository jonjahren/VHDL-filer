----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2020 09:35:50 AM
-- Design Name: 
-- Module Name: Mode_M_Counter_tb - Behavioral
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

entity Mode_M_Counter_tb is
--  Port ( );
end Mode_M_Counter_tb;

architecture Behavioral of Mode_M_Counter_tb is
---------------- component declaration -----------------
component Mode_M_Counter 
	generic (M : integer := 10;
			 N : integer := 4);
    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end component Mode_M_Counter;
---------------- internal signals | testbench signals---
constant M_tb : integer := 16;
constant N : integer := 4;
constant CLK_Period : time := 10 ns; -- Basys-3 has clock frequency of 100 Mhz --> T_clk = 10ns
signal clk : std_logic := '1';
signal rst : std_logic := '0';
signal en  : std_logic := '0';
signal q : std_logic_vector(N-1 downto 0);
signal max_tick : std_logic;
begin

------------------ UUT | Component Instantiation ---------------
UUT_Counter: Mode_M_Counter
generic map ( M => M_tb, N => N)
port map (rst 	=> rst,
		  clk 	=> clk,
		  en 	=> en,
		  q 	=> q,
		  max_tick => max_tick);
-------------------- Generate the test vectors | clk, rst, en---
    ------------------ Generate the clock signals ---------
	 clk <= not clk after CLK_Period/2;
	---------------------- Generate the other signals ----
	process
		begin
			wait until rising_edge(clk);
			rst <= '1';  -- reset the counter
			wait until rising_edge(clk);
			wait until rising_edge(clk);
			rst <= '0'; 
			wait until rising_edge(clk);
			en <= '1'; --- let the counter run
			wait; 
		end process;
end Behavioral;











