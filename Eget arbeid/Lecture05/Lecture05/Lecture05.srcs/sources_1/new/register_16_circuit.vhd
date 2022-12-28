----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2020 10:38:31
-- Design Name: 
-- Module Name: register_16_circuit - Behavioral
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

entity register_16_circuit is
    generic (N : integer := 16);
    Port ( rst  : in STD_LOGIC;
           clk  : in STD_LOGIC;
           d    : in STD_LOGIC_VECTOR (N-1 downto 0);
           q    : out STD_LOGIC_VECTOR (N-1 downto 0));
end register_16_circuit;

architecture Behavioral of register_16_circuit is

begin
process(rst, clk)
    begin
        if (rst = '1') then
            -- q <= "0000000000000000";
            q <= (others => '0'); --alle bitene settes til 0
        elsif (rising_edge(clk)) then
            q <= d;
        end if;
    end process;

end Behavioral;
