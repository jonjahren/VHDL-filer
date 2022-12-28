----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 09:23:31 AM
-- Design Name: 
-- Module Name: mux_4_case - Behavioral
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

entity mux_4_case is
    generic (N : integer := 8);
    Port ( d0 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d1 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d2 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           d3 	: in STD_LOGIC_VECTOR (N-1 downto 0);
           sel 	: in STD_LOGIC_VECTOR (1 downto 0);
           y 	: out STD_LOGIC_VECTOR (N-1 downto 0));
end mux_4_case;

architecture Behavioral of mux_4_case is
--constant N : integer := 8; 
begin
	process (sel, d0, d1, d2, d3)
		begin
			case sel is
				when "00" =>
					y <= d0;
					
				when "01" =>
					y <= d1; 
				when "10" =>
					y <= d2;
				when others =>
					y <= d3;
			end case;
		end process;

end Behavioral;







