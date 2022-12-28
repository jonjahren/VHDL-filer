library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pwm_basic is
   generic(
      R : integer := 8   -- # bits of PWM resolution (i.e., 2^R levels)
   );
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      duty    : in  std_logic_vector(R - 1 downto 0);
      pwm_out : out std_logic
   );
end pwm_basic;

architecture arch of pwm_basic is
   signal d_reg, d_next     : unsigned(R - 1 downto 0);
   signal pwm_reg, pwm_next : std_logic;
begin
   process(clk, reset)
   begin
      if reset = '1' then
         d_reg <= (others => '0');
         pwm_reg <=  '0';
      elsif (clk'event and clk = '1') then
         d_reg <= d_next;
         pwm_reg <=  pwm_next;
     end if;
   end process;
   -- duty cycle counter
   d_next   <= d_reg + 1;
   -- comparison circuit
   pwm_next <= '1' when d_reg < unsigned(duty) else '0';
   pwm_out  <= pwm_reg;
end arch;