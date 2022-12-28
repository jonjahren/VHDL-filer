----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 09:52:08
-- Design Name: 
-- Module Name: Greater_than_TB - Behavioral
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
library UNISIM;
--use UNISIM.VComponents.all;

entity Greater_than_TB is
--  Port ( );
end Greater_than_TB;

architecture Behavioral of Greater_than_TB is

component Greater_than is
    port ( D0_0 : in STD_LOGIC;
           D0_1: in STD_LOGIC;
           D1_0 : in STD_LOGIC;
           D1_1: in STD_LOGIC;
           Z : out STD_LOGIC );
 end component Greater_than;
       
 signal D0_0_tb: STD_LOGIC;
 signal D0_1_tb: STD_LOGIC;
 signal D1_0_tb: STD_LOGIC; 
 signal D1_1_tb: STD_LOGIC;
 signal Z_tb: STD_LOGIC;      
       
          
   begin

UUT: Greater_than
port map (D0_0 => D0_0_tb,D0_1 => D0_1_tb, Z => Z_tb,
          D1_0 => D1_0_tb, D1_1 => D1_1_tb);  


process
    begin
    
        D0_0_tb <= '0';
        D0_1_tb <= '0';
        D1_0_tb <= '0';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '0';
        D1_0_tb <= '0';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '0';
        D1_0_tb <= '1';
        D1_1_tb <= '0';
        wait for 40 ns;

        D0_0_tb <= '0';
        D0_1_tb <= '0';
        D1_0_tb <= '1';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '1';
        D1_0_tb <= '0';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '1';
        D1_0_tb <= '0';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '1';
        D1_0_tb <= '1';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '0';
        D0_1_tb <= '1';
        D1_0_tb <= '1';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '0';
        D1_0_tb <= '0';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '0';
        D1_0_tb <= '0';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '0';
        D1_0_tb <= '1';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '0';
        D1_0_tb <= '1';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '1';
        D1_0_tb <= '0';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '1';
        D1_0_tb <= '0';
        D1_1_tb <= '1';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '1';
        D1_0_tb <= '1';
        D1_1_tb <= '0';
        wait for 40 ns;
        
        D0_0_tb <= '1';
        D0_1_tb <= '1';
        D1_0_tb <= '1';
        D1_1_tb <= '1';
        wait;
      end process;



end Behavioral;