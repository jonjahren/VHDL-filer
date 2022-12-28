----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 10:28:31 AM
-- Design Name: 
-- Module Name: mux_4_case_tb - Behavioral
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

entity mux_4_case_tb is
--  Port ( );
end mux_4_case_tb;

architecture Behavioral of mux_4_case_tb is
----------------consant-------------------
constant N_BIT : integer := 10;
------------- internal signals -----------
signal sel_tb : std_logic_vector(1 downto 0);
signal d0_tb, d1_tb, d2_tb, d3_tb, y_tb : std_logic_vector(N_BIT -1 downto 0); 
--------------- component declaration-----
component mux_4_case 
    generic (N : integer := 8);
    Port ( d0 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d1 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d2 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d3 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           sel 	: in STD_LOGIC_VECTOR (1 downto 0);
           y 	: out STD_LOGIC_VECTOR (N-1 downto 0));
end component mux_4_case;
begin
--------------- UUT ---------------------
UUT_MUX : mux_4_case
generic map (N =>  N_BIT)
port map (	d0 	=> d0_tb, 
			d1 	=> d1_tb, 
			d2 	=> d2_tb, 
			d3 	=> d3_tb, 
			sel => sel_tb, 
			y 	=> y_tb);
---------------Test vector generator----
d0_tb <= "0000000001"; -- data 1
d1_tb <= "0000000010"; -- data 2
d2_tb <= "0000000100"; --data 3
d3_tb <= "0000001000"; -- data 4

process 
	begin
		sel_tb <= "00";
		wait for 20 ns;
		
		sel_tb <= "01";
		wait for 20 ns;
		
		sel_tb <= "10";
		wait for 20 ns;
		
		sel_tb <= "11";
		wait ;
	end process; 
end Behavioral;
