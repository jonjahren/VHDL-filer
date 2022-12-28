----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2020 09:36:06
-- Design Name: 
-- Module Name: Greater_Than - Behavioral
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

entity Greater_Than is
    Port ( D0_0 : in STD_LOGIC_VECTOR;
           D1_0 : in STD_LOGIC_VECTOR ;
           D0_1 : in STD_LOGIC_VECTOR;
           D1_1 : in STD_LOGIC_VECTOR ;
           Z : out STD_LOGIC);
end Greater_Than;

architecture Behavioral of Greater_Than is

signal p0, p1, p2 : std_logic;

begin

p0 <= ( D0_1(1)) and (not D1_1(1));

p1 <= ( D0_0(0)) and (not D1_1(1)) and (not D1_0(0));

p2 <= (D0_1(1)) and ( D0_0(0)) and (not D1_0(0));


z <= p0 or p1 or p2;   
end Behavioral;

