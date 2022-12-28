library ieee;
use ieee.std_logic_1164.all;
entity reduced_xor8 is
   port(
      a : in std_logic_vector(7 downto 0);
      y : out std_logic
   );
end reduced_xor8;

architecture cascade_arch of reduced_xor8 is
begin
   y <= a(0) xor a(1) xor a(2) xor a(3) xor
        a(4) xor a(5) xor a(6) xor a(7);
end cascade_arch;