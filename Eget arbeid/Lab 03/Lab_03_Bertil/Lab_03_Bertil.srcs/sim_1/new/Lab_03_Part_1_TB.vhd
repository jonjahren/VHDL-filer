----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 08:34:53
-- Design Name: 
-- Module Name: Lab_03_Part_1_TB - Behavioral
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

entity Lab_03_Part_1_TB is
--  Port ( );
end Lab_03_Part_1_TB;

architecture Behavioral of Lab_03_Part_1_TB is
--Declare component here
component Lab_03_Part_1
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end component Lab_03_Part_1;

--Internal signal
signal i0_tb, i1_tb, sel_tb, y_tb : STD_LOGIC;

begin

UUT: Lab_03_Part_1
Port map (i0 => i0_tb, i1 => i1_tb, sel => sel_tb, y => y_tb);

-------------------- Test Vector Generator --------------------------
Test_Vector_Process: process 
begin
     -----vector 1-----
        sel_tb <= '0';
        i0_tb <= '0';
        i1_tb <= '1';
        wait for 50 ns;
     -----vector 2-----
        sel_tb <= '1';
        i0_tb <= '0';
        i1_tb <= '1';
        wait for 50 ns;
     -----vector 3-----
        sel_tb <= '0';
        i0_tb <= '1';
        i1_tb <= '0';
        wait for 50 ns;
     -----vector 4-----
        sel_tb <= '1';
        i0_tb <= '1';
        i1_tb <= '0';
        wait;
    end process;

end Behavioral;
