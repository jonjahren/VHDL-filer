library ieee;
use ieee.std_logic_1164.all;
entity frame_palette_9 is
   port(
      color_in  : in  std_logic_vector(8 downto 0);
      color_out : out std_logic_vector(11 downto 0)
   );
end frame_palette_9;

architecture arch of frame_palette_9 is
   alias r_in   : std_logic_vector(2 downto 0) is color_in(8 downto 6);
   alias g_in   : std_logic_vector(2 downto 0) is color_in(5 downto 3);
   alias b_in   : std_logic_vector(2 downto 0) is color_in(2 downto 0);
   signal r_out : std_logic_vector(3 downto 0);
   signal g_out : std_logic_vector(3 downto 0);
   signal b_out : std_logic_vector(3 downto 0);
begin
   r_out     <= r_in & r_in(2);
   g_out     <= g_in & g_in(2);
   b_out     <= b_in & b_in(2);
   color_out <= r_out & g_out & b_out;
end arch;

-- 3-/6-/9-bit color to 12-/15-bit/24-bit color 
--architecture arch of frame_palette is
--   constant M: integer := DI/3;
--   constant N: integer := DO/3;
--   alias r_in: std_logic_vector(M-1 downto 0) is color_in(3*M-1 downto 2*M);
--   alias g_in: std_logic_vector(M-1 downto 0) is color_in(2*M-1 downto M);
--   alias b_in: std_logic_vector(M-1 downto 0) is color_in(M-1 downto 0);
--   signal r_out, g_out, b_out: std_logic_vector(N-1 downto 0);
--begin
--   r_out(N-1 downto N-M) <= r_in; 
--   r_out(N-M-1 downto 0) <= (others=>r_in(M-1)); 
--   g_out(N-1 downto N-M) <= g_in; 
--   g_out(N-M-1 downto 0) <= (others=>g_in(M-1)); 
--   b_out(N-1 downto N-M) <= b_in; 
--   b_out(N-M-1 downto 0) <= (others=>b_in(M-1)); 
--   color_out <= r_out & g_out & b_out;
--end arch;
