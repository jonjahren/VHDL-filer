----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2020 10:25:51
-- Design Name: 
-- Module Name: mux_4 - Behavioral
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

entity mux_4 is
    Port ( d0   : in STD_LOGIC_VECTOR (3 downto 0);
           d1   : in STD_LOGIC_VECTOR (3 downto 0);
           d2   : in STD_LOGIC_VECTOR (3 downto 0);
           d3   : in STD_LOGIC_VECTOR (3 downto 0);
           sel  : in STD_LOGIC_VECTOR (1 downto 0);
           dout : out STD_LOGIC_VECTOR (3 downto 0));
end mux_4;

architecture Behavioral of mux_4 is

begin
dout <= d0 when sel = "00" else
        d1 when sel = "01" else
        d2 when sel = "10" else
        d3 ;


end Behavioral;
