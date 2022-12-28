----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2020 09:44:17 AM
-- Design Name: 
-- Module Name: d_ff_rst_en_circuit - Behavioral
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

entity d_ff_rst_en_circuit is
    Port ( rst 	: in STD_LOGIC;
           clk 	: in STD_LOGIC;
           en 	: in STD_LOGIC;
           d 	: in STD_LOGIC;
           q 	: out STD_LOGIC);
end d_ff_rst_en_circuit;

architecture Behavioral of d_ff_rst_en_circuit is

begin
	process (rst, clk)
		begin
			if (rst = '1') then 
				q <= '0'; -- reset the memory element
			elsif (rising_edge(clk)) then
				if (en = '1') then 
					q <= d;
				end if; -- if of enable signal
			end if; -- if of reset signal 
		end process;

end Behavioral;














