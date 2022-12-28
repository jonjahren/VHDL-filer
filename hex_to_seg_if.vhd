----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2020 10:19:08
-- Design Name: 
-- Module Name: hex_to_seg_if - Behavioral
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

entity hex_to_seg_if is
    Port ( dp   : in STD_LOGIC;
           hex  : in STD_LOGIC_VECTOR (3 downto 0);
           an   : out STD_LOGIC_VECTOR (3 downto 0);
           seg  : out STD_LOGIC_VECTOR (7 downto 0));
end hex_to_seg_if;

architecture Behavioral of hex_to_seg_if is

begin
seg(7)  <= dp;
an      <= "1100"; --kun de to siste er på

    process (hex)
        begin
            if hex = "0000" then --hex = 0
                seg(6 downto 0) <= "1000000";
            elsif hex = "0001" then --hex = 1
                seg(6 downto 0) <= "1111001";
            elsif hex = "0010" then --hex = 2
                seg(6 downto 0) <= "0100100";
            elsif hex = "0011" then --hex = 3
                seg(6 downto 0) <= "0110000";
            elsif hex = "0100" then --hex = 4
                seg(6 downto 0) <= "0011001";
            elsif hex = "0101" then --hex = 5
                seg(6 downto 0) <= "0010010";
            elsif hex = "0110" then --hex = 6
                seg(6 downto 0) <= "0000010";
            elsif hex = "0111" then --hex = 7
                seg(6 downto 0) <= "1111000";
            elsif hex = "1000" then --hex = 8
                seg(6 downto 0) <= "0000000";
            elsif hex = "1001" then --hex = 9
                seg(6 downto 0) <= "0010000";
            elsif hex = "1010" then --hex = A
                seg(6 downto 0) <= "0001000";
            elsif hex = "1011" then --hex = B
                seg(6 downto 0) <= "0000011";
            elsif hex = "1100" then --hex = C
                seg(6 downto 0) <= "1000110";
            elsif hex = "1101" then --hex = D
                seg(6 downto 0) <= "0100001";
            elsif hex = "1110" then --hex = E
                seg(6 downto 0) <= "0000110";
            else --hex = F
                seg(6 downto 0) <= "0001110";
            end if;
        end process;

end Behavioral;
