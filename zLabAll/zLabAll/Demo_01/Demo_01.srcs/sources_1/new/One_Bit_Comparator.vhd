----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/06/2020 10:05:57 AM
-- Design Name: 
-- Module Name: One_Bit_Comparator - Behavioral
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

entity One_Bit_Comparator is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end One_Bit_Comparator;

architecture Behavioral of One_Bit_Comparator is
 signal p0, p1 :  STD_LOGIC;
begin
eq <= P0 or P1;
P0 <= i0 and i1;
P1 <= (not i0) and (not i1);
--eq  <= (i0 and i1) or ((not i0) and (not i1));

end Behavioral;
