----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 09:24:06
-- Design Name: 
-- Module Name: Lab_03_Part_2_TB - Behavioral
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

entity Lab_03_Part_2_TB is
--  Port ( );
end Lab_03_Part_2_TB;

architecture Behavioral of Lab_03_Part_2_TB is

--Declare component
component Lab_03_Part_2
    Port ( r : in STD_LOGIC_VECTOR (3 downto 0);
           pcode : out STD_LOGIC_VECTOR (2 downto 0));
end component Lab_03_Part_2;

--Internal signal
signal r_tb : STD_LOGIC_VECTOR (3 downto 0);
signal pcode_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Lab_03_Part_2
Port map (r => r_tb, pcode => pcode_tb);

Test_Vector_Process: process 
begin
    for a_tb in 0 to 2**4-1 loop 
        r_tb <= STD_LOGIC_VECTOR(to_unsigned(a_tb,4)); -----idikerer antall bit i dette tilfelle 4.
        wait for 50ns;
    end loop; --- end of the loop
end process;   

end Behavioral;
