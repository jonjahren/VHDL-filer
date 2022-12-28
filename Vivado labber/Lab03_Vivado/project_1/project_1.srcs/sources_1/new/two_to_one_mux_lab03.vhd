----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 08:20:20
-- Design Name: 
-- Module Name: 2-to-1-mux-lab03 - Behavioral
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

entity two_to_one_mux_lab03 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end two_to_one_mux_lab03;
 
architecture Behavioral of two_to_one_mux_lab03 is

begin
with sel select
y <= i0 when '0',
     i1 when others;


end Behavioral;
