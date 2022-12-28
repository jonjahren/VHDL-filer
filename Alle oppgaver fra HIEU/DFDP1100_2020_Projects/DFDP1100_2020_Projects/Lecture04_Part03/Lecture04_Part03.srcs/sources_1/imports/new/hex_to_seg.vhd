----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2020 09:15:27 AM
-- Design Name: 
-- Module Name: hex_to_seg - Behavioral
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

entity hex_to_seg is
    Port ( dp 	: in STD_LOGIC;
           hex 	: in STD_LOGIC_VECTOR (3 downto 0);
           an 	: out STD_LOGIC_VECTOR (3 downto 0);
           seg 	: out STD_LOGIC_VECTOR (7 downto 0));
end hex_to_seg;

architecture Behavioral of hex_to_seg is

begin
	seg(7) <= dp; -- connect the decimal point to the seg number 8
	an     <= "0000";
process (hex)
	begin
		case hex is
			when "0000" => -- hex = 0
				seg(6 downto 0) <= "1000000";
			when "0001" => -- hex = 1
				seg(6 downto 0) <= "1111001";
			when "0010" => -- hex = 2
				seg(6 downto 0) <= "0100100";
			when "0011" => -- hex = 3
			-- your statements here--
				seg(6 downto 0) <= "0110000";
			when "0100" => -- hex = 4
				seg(6 downto 0) <= "0011001";
			when "0101" => -- hex = 5
				seg(6 downto 0) <= "0010010";
			when "0110" => -- hex = 6
				seg(6 downto 0) <= "0000010";
			when "0111" => -- hex = 7
				seg(6 downto 0) <= "1111000";
			when "1000" => -- hex = 8
				seg(6 downto 0) <= "0000000";
			when "1001" => -- hex = 9
				seg(6 downto 0) <= "0010000";
			when "1010" => -- hex = A
				seg(6 downto 0) <= "0001000";
			when "1011" => -- hex = B
				seg(6 downto 0) <= "0000011";
			when "1100" => -- hex = C
				seg(6 downto 0) <= "1000110";
			when "1101" => -- hex = D
				seg(6 downto 0) <= "0100001";
			when "1110" => -- hex = E
				seg(6 downto 0) <= "0000110";
			when others => -- hex = F
				seg(6 downto 0) <= "0001110";
		end case;
	end process;

end Behavioral;





