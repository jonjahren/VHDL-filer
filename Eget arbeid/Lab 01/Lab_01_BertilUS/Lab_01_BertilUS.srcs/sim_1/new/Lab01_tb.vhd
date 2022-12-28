----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2020 08:32:34
-- Design Name: 
-- Module Name: Lab01_tb - Behavioral
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

entity Lab01_tb is
--  Port ( );
end Lab01_tb;

architecture Behavioral of Lab01_tb is

--Declare component here
component Lab01
    Port (  i0 : in STD_LOGIC;
            i1 : in STD_LOGIC;
            eq : out STD_LOGIC);
end component Lab01;

--Internal Signal Declaration
signal i0_tb : STD_LOGIC;
signal i1_tb : STD_LOGIC;
signal eq_tb : STD_LOGIC;

begin

UUT: Lab01
port map (i0 => i0_tb, i1 => i1_tb, eq => eq_tb);

process 
    begin
        -----vector 1-----
        i0_tb <= '0';
        i1_tb <= '0';
        wait for 50 ns;
        
        -----vector 2-----
        i0_tb <= '0';
        i1_tb <= '1';
        wait for 50 ns;
        
        -----vector 3-----
        i0_tb <= '1';
        i1_tb <= '0';
        wait for 50 ns;
         
        -----vector 4-----
        i0_tb <= '1';
        i1_tb <= '1';
        wait;
    end process;    
    
end Behavioral;
