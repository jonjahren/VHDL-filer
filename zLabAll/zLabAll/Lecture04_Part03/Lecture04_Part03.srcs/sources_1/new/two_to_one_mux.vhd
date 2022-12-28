----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2020 08:37:11 AM
-- Design Name: 
-- Module Name: two_to_one_mux - Behavioral
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

entity two_to_one_mux is
    Port ( a 	: in STD_LOGIC_VECTOR (3 downto 0);
           b 	: in STD_LOGIC_VECTOR (3 downto 0);
           sel 	: in STD_LOGIC;
           hex 	: out STD_LOGIC_VECTOR (3 downto 0));
end two_to_one_mux;

architecture Behavioral of two_to_one_mux is

begin

hex <= a when sel = '1' else
      b ;

end Behavioral;
