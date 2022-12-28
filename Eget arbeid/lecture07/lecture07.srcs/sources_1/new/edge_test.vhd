library ieee;
use ieee.std_logic_1164.all;

entity tb_ed is
end entity tb_ed;

architecture tb_ed_rtl of tb_ed is

   component EdgeDetector is
      port (
         clk      : in std_logic;
         d        : in std_logic;
         edge     : out std_logic
      );
   end component;

   signal tb_clk     : std_logic := '0';
   signal tb_d       : std_logic := '0';
   signal tb_edge    : std_logic := '0';

   constant ClkGenConst  : time := 10 ns;

begin

   UUT: EdgeDetector
      port map (
         tb_clk,
         tb_d,
         tb_edge
      );

   ClockGenerator_p: process
   begin
      tb_clk <= '0' after ClkGenConst, '1' after 2*ClkGenConst;
      wait for 2*ClkGenConst;

   end process;
   tb_d <= '0', '1' after 110 ns, '0' after 210 ns, '1' after 310 ns, '0' after 410 ns;

end architecture tb_ed_rtl;
