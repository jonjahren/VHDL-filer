----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 09:47:11 AM
-- Design Name: 
-- Module Name: tri_state_buffer - Behavioral
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

entity tri_state_buffer is
    Port ( datain 	: in STD_LOGIC;
           oe 		: in STD_LOGIC;
           y 		: out STD_LOGIC);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin
--- when else syntax for RTL-Design ---
y <= datain when oe = '1' else 
     'Z';

end Behavioral;
