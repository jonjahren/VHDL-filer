----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2020 09:52:51 AM
-- Design Name: 
-- Module Name: d_ff_rst_en_circuit_tb - Behavioral
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

entity d_ff_rst_en_circuit_tb is
--  Port ( );
end d_ff_rst_en_circuit_tb;

architecture Behavioral of d_ff_rst_en_circuit_tb is
------------------ component declaration --------
component d_ff_rst_en_circuit 
    Port ( rst 	: in STD_LOGIC;
           clk 	: in STD_LOGIC;
           en 	: in STD_LOGIC;
           d 	: in STD_LOGIC;
           q 	: out STD_LOGIC);
end component d_ff_rst_en_circuit;
------------------ internal signals -------------
signal clk, rst, en, d, q : std_logic := '0';

constant clk_period : time := 10 ns;  --Basys-3 has clk frequency 100 Mhz | T = 10 ns;
begin
------------------ UUT | Componenet Instantiation---
UUT_D_FF : d_ff_rst_en_circuit
	port map (rst 	=> rst,
			  clk 	=> clk,
			  en 	=> en,
			  d 	=> d, 
			  q 	=> q);

--------------- Clock signal generator -------------
 clk <= not clk after clk_period/2 ; -- T = 10 ns | fclk = 100 Mhz
------------------ Test vector generator -----------
process
	begin
		wait for 25 ns;
			rst <= '1';
		wait for 10 ns;
			rst <= '0';
			d 	<= '1';
		wait for 5ns;
			en <= '1';
		wait until rising_edge(clk);
		
			en <= '0';
		wait ;
	end process;
end Behavioral;
