----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2020 10:20:30 AM
-- Design Name: 
-- Module Name: mod_16_test_block_1 - Behavioral
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

entity mod_16_test_block_1 is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end mod_16_test_block_1;

architecture Behavioral of mod_16_test_block_1 is

component Mode_M_Counter 
	generic (M : integer := 10;
			 N : integer := 4);
    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end component Mode_M_Counter;
component hex_to_seg 
    Port ( dp 	: in STD_LOGIC;
           hex 	: in STD_LOGIC_VECTOR (3 downto 0);
           an 	: out STD_LOGIC_VECTOR (3 downto 0);
           seg 	: out STD_LOGIC_VECTOR (7 downto 0));
end component hex_to_seg;
----------------- internal signal -------
signal q16 : std_logic_vector(3 downto 0);
begin
Mod_16_counter: Mode_M_Counter
	generic map (M => 16, N => 4)
	port map (rst => rst,
	          clk => clk,
			  en  => '1',
			  q => q16,
			  max_tick => open);
HEX_Display: hex_to_seg
	port map (dp => '1',
	          hex => q16,
			  an => an,
			  seg => seg);
end Behavioral;















