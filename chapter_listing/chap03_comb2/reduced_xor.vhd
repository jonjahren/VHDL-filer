library ieee;
use ieee.std_logic_1164.all;
entity reduced_xor is
   generic(WIDTH: integer := 8);
   port(
      a : in std_logic_vector(WIDTH-1 downto 0);
      y : out std_logic
   );
end reduced_xor;

architecture gen_linear_arch of reduced_xor is
   signal p: std_logic_vector(WIDTH-1 downto 0);
begin
   p(0) <= a(0);
   xor_gen:
   for i in 1 to (WIDTH-1) generate
      p(i) <= a(i) xor p(i-1);
   end generate;
   y <= p(WIDTH-1);
end gen_linear_arch;