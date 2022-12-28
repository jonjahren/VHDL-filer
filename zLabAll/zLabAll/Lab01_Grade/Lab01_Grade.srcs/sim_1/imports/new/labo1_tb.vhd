----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 08:45:04
-- Design Name: 
-- Module Name: labo1_tb - Behavioral
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

entity lab01_tb is
--  Port ( );
end lab01_tb;

architecture Behavioral of lab01_tb is
-------------Declare component here
component lab01
    port ( i0 : in STD_LOGIC;
           i1 : in STD_LOgIC;
           eq : out STD_LOGIC);
end component lab01;
 
 --------------Internal signal decleration
 signal i0_tb: std_logic;
 signal i1_tb: std_logic;
 signal eq_tb: std_logic;
 
begin

UUT: lab01
port map (i0=> i0_tb,i1=> i1_tb,eq => eq_tb);


process
    begin
        ------------------Vector 1-------------
        i0_tb<= '0';
        i1_tb<= '0';
        wait for 40 ns;
 
        ------------------Vector 2-------------
        i0_tb<= '0';
        i1_tb<= '1';
        wait for 40 ns;
        
        ------------------Vector 3-------------
        i0_tb<= '1';
        i1_tb<= '0';
        wait for 40 ns;
        ------------------Vector 3-------------
        i0_tb<= '1';
        i1_tb<= '1';
        wait;
    end process;
        
        

end Behavioral;
