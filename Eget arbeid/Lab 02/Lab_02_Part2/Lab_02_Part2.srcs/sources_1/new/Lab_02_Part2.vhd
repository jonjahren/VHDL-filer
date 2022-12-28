----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2020 09:11:05
-- Design Name: 
-- Module Name: Lab_02_Part2 - Behavioral
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

entity Lab_02_Part2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Lab_02_Part2;

architecture Behavioral of Lab_02_Part2 is

--Internal signal
    signal s0, s1, s2, s3, c0, c1, c2, c3 : std_logic;

begin

    c0 <= (not a) and b and cin;
    c1 <= a and (not b) and cin;
    c2 <= a and b and (not cin);
    c3 <= a and b and cin;
    cout <= c0 or c1 or c2 or c3;
    
    s0 <= (not a) and (not b) and cin;
    s1 <= (not a) and b and (not cin);
    s2 <= a and (not b) and (not cin);
    s3 <= a and b and cin;
    sum <= s0 or s1 or s2 or s3;

end Behavioral;
