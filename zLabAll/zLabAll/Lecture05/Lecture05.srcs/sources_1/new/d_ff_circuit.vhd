----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2020 09:17:51 AM
-- Design Name: 
-- Module Name: d_ff_circuit - Behavioral
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

entity d_ff_circuit is
    Port ( clk 	: in STD_LOGIC;
           d 	: in STD_LOGIC;
           q 	: out STD_LOGIC);
end d_ff_circuit;

architecture Behavioral of d_ff_circuit is

begin
 process (clk) --- d not in sensitivity list
	begin
		if (clk'event and clk = '1') then -- rising edge
			q <= d;
		end if;
	end process;

end Behavioral;










