----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2020 09:06:02 AM
-- Design Name: 
-- Module Name: mux_4_withselect - Behavioral
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

entity mux_4_withselect is
    Port ( i0 	: in STD_LOGIC_VECTOR (1 downto 0);
           i1 	: in STD_LOGIC_VECTOR (1 downto 0);
           i2 	: in STD_LOGIC_VECTOR (1 downto 0);
           i3 	: in STD_LOGIC_VECTOR (1 downto 0);
           sel 	: in STD_LOGIC_VECTOR (1 downto 0);
           z 	: out STD_LOGIC_VECTOR (1 downto 0));
end mux_4_withselect;

architecture Behavioral of mux_4_withselect is

begin
 with sel select
 z <= i0 when "00",
      i1 when "01",
      i2 when "10",
      i3 when others; 	  

end Behavioral;





