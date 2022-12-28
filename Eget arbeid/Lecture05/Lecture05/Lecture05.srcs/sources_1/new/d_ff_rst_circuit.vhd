----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2020 09:32:48
-- Design Name: 
-- Module Name: d_ff_rst_circuit - Behavioral
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

entity d_ff_rst_circuit is
    Port ( rst  : in STD_LOGIC;
           clk  : in STD_LOGIC;
           d    : in STD_LOGIC;
           q    : out STD_LOGIC);
end d_ff_rst_circuit;

architecture Behavioral of d_ff_rst_circuit is

begin

process (rst, clk)
    begin
        if (rst = '1') then -- nullstill minne
            q <= '0'; -- minne nullstilles
        -- elsif (clk'event and clk = '1') then, samme som under
        elsif (rising_edge(clk)) then  -- eller falling_edge(clk)
            q <= d;
        end if;
    end process;
    
end Behavioral;
