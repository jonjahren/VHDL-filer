----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2020 08:28:46 AM
-- Design Name: 
-- Module Name: top_block_ex03 - Behavioral
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

entity top_block_ex03 is
    Port ( a 	: in STD_LOGIC_VECTOR (3 downto 0);
           b 	: in STD_LOGIC_VECTOR (3 downto 0);
           sel 	: in STD_LOGIC;
           an 	: out STD_LOGIC_VECTOR (3 downto 0);
           seg 	: out STD_LOGIC_VECTOR (7 downto 0));
end top_block_ex03;

architecture Behavioral of top_block_ex03 is
-----------------component declaration -----
component two_to_one_mux 
    Port ( a 	: in STD_LOGIC_VECTOR (3 downto 0);
           b 	: in STD_LOGIC_VECTOR (3 downto 0);
           sel 	: in STD_LOGIC;
           hex 	: out STD_LOGIC_VECTOR (3 downto 0));
end component two_to_one_mux;

component hex_to_seg 
    Port ( dp 	: in STD_LOGIC;
           hex 	: in STD_LOGIC_VECTOR (3 downto 0);
           an 	: out STD_LOGIC_VECTOR (3 downto 0);
           seg 	: out STD_LOGIC_VECTOR (7 downto 0));
end component hex_to_seg;

------------------internal signals --------
signal hex : std_logic_vector(3 downto 0);
begin
------------------Component Instantiation--
SELECT_DATA : two_to_one_mux
port map (a => a,
		  b => b,
		  sel => sel,
		  hex => hex);

SEG_DISPLAY_DATA: hex_to_seg
port map (dp => '1',
          hex => hex,
		  an => an,
		  seg => seg);
end Behavioral;












