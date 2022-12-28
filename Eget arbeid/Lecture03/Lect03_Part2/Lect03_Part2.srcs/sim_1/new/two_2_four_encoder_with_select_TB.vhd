----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2020 09:55:18
-- Design Name: 
-- Module Name: two_2_four_encoder_with_select_TB - Behavioral
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

entity two_2_four_encoder_with_select_TB is
--  Port ( );
end two_2_four_encoder_with_select_TB;

architecture Behavioral of two_2_four_encoder_with_select_TB is

--Declare component here
component two_2_four_encoder_with_select
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end component two_2_four_encoder_with_select;

--Internal Signal Declaration
signal en_tb : STD_LOGIC;
signal a_tb: STD_LOGIC_VECTOR(1 downto 0);
signal y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
-------------------- UUT instantiation ------------------------------
UUT: two_2_four_encoder_with_select
Port map (en => en_tb, a => a_tb, y => y_tb);

-------------------- Test Vector Generator --------------------------
Test_Vector_Process: process 
begin 
     -----vector 1-----
        en_tb <= '0';
        a_tb <= "00";
        wait for 50 ns;
     -----vector 2-----
        en_tb <= '0';
        a_tb <= "01";
        wait for 50 ns;
     -----vector 3-----
        en_tb <= '0';
        a_tb <= "10";
        wait for 50 ns;
     -----vector 4-----
        en_tb <= '0';
        a_tb <= "11";
        wait for 50 ns;
     -----vector 5-----
        en_tb <= '1';
        a_tb <= "00";
        wait for 50 ns;
     -----vector 6-----
        en_tb <= '1';
        a_tb <= "01";
        wait for 50 ns;
     -----vector 7-----
        en_tb <= '1';
        a_tb <= "10";
        wait for 50 ns;
     -----vector 8-----
        en_tb <= '1';
        a_tb <= "11";
        wait;
    end process;

end Behavioral;
