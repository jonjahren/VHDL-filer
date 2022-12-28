----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 10:21:47 AM
-- Design Name: 
-- Module Name: one_bit_comparator_tb - Behavioral
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

entity one_bit_comparator_tb is
--  Port ( );
end one_bit_comparator_tb;

architecture Behavioral of one_bit_comparator_tb is
------------ component declaration | take the design out to test | Unit Under Test | UUT
component One_Bit_Comparator 
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end component One_Bit_Comparator;
----------------internal signals--------------------------
signal i0_tb : STD_LOGIC;
signal i1_tb : STD_LOGIC;
signal eq_tb :STD_LOGIC;
begin
-------------------UUT Instantiation | Component Instantiation---
UUT_one_bit_comparator: One_Bit_Comparator 
port map (i0 => i0_tb, i1 => i1_tb, eq => eq_tb);
-----------------------Test Vector Generator | Generate all the input signal values
stimulus: process
	begin
		--------------------Test vector 1 | 0 0 --------
		wait for 100 ns; 
		i0_tb <= '0';
		i1_tb <= '0';
		
		--------------------Test vector 2 | 0 1 --------
		wait for 100 ns; 
		i0_tb <= '1';
		i1_tb <= '0';
		
		--------------------Test vector 3 | 1 0---------
		wait for 100 ns; 
		i0_tb <= '0';
		i1_tb <= '1';
		-------------------- Test vector 4 | 1 1--------
		wait for 100 ns; 
		i0_tb <= '1';
		i1_tb <= '1';
		wait; 
	end process;
	
end Behavioral;
