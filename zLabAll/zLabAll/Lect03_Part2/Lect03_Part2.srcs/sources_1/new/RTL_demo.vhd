----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2020 08:25:07 AM
-- Design Name: 
-- Module Name: RTL_demo - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RTL_demo is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           c : in STD_LOGIC_VECTOR (1 downto 0);
           m : in STD_LOGIC_VECTOR (1 downto 0);
           n : in STD_LOGIC_VECTOR (1 downto 0);
           r : out STD_LOGIC_VECTOR (1 downto 0));
end RTL_demo;

architecture Behavioral of RTL_demo is
------------internal signal --------
signal a_signed, b_signed, c_signed, r_signed : signed(1 downto 0);

begin
a_signed <= signed(a);
b_signed <= signed(b);
c_signed <= signed(c);
--r_signed <= signed(r);

r_signed <= a_signed + b_signed + c_signed when m = n else
            a_signed - b_signed when m > n else
			c_signed + 1;
r    <= std_logic_vector(r_signed);
end Behavioral;


