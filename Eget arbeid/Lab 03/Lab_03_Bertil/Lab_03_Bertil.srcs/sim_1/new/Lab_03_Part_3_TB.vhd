----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2020 10:10:37
-- Design Name: 
-- Module Name: Lab_03_Part_3_TB - Behavioral
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

entity Lab_03_Part_3_TB is
--  Port ( );
end Lab_03_Part_3_TB;

architecture Behavioral of Lab_03_Part_3_TB is

--Declare component here
component Lab_03_Part_3
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end component Lab_03_Part_3;

--Internal signals
signal en_tb : STD_LOGIC;
signal a_tb : STD_LOGIC_VECTOR (1 downto 0);
signal y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin 
UUT: Lab_03_Part_3
Port map (en => en_tb, a => a_tb, y => y_tb);

Test_Vector_Process: process
begin
    -----Vector 1-----
    en_tb <= '0';
    a_tb <= "00";
    wait for 50 ns;
    -----Vector 2-----
    en_tb <= '0';
    a_tb <= "01";
    wait for 50ns;
    -----Vector 3-----
    en_tb <= '0';
    a_tb <= "10";
    wait for 50ns;
    -----Vector 4-----
    en_tb <= '0';
    a_tb <= "11";
    wait for 50ns;
    -----Vector 5-----
    en_tb <= '1';
    a_tb <= "00";
    wait for 50ns;
    -----Vector 6-----
    en_tb <= '1';
    a_tb <= "01";
    wait for 50ns;
    -----Vector 7-----
    en_tb <= '1';
    a_tb <= "10";
    wait for 50ns;
    -----Vector 8-----
    en_tb <= '1';
    a_tb <= "11";
    wait;
  end process;
    
    

end Behavioral;
