
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_to_one_mux is
    Port ( a    : in STD_LOGIC_VECTOR (3 downto 0);
           b    : in STD_LOGIC_VECTOR (3 downto 0);
           s  : in STD_LOGIC;
           z  : out STD_LOGIC_VECTOR (3 downto 0));
end two_to_one_mux;

architecture Behavioral of two_to_one_mux is

begin

z <= a when s = '1' else
    b;

end Behavioral;
