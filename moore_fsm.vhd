library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore_finite_state_machine is
port (
 clock: in std_logic; 
 reset: in std_logic; 
 s_in: in std_logic;
 d_out: out std_logic 
);
end moore_finite_state_machine;

architecture Behavioral of moore_finite_state_machine is

type moore_fsm is (zero, one, one_zero, one_zero_zero, one_zero_zero_one);

signal current_state, next_state: moore_fsm;

begin


process(clock,reset)
begin
 if(reset='1') then
  current_state <= zero;
 elsif(rising_edge(clock)) then
  current_state <= next_state;
 end if;
end process;

process(current_state,s_in)
begin
 case(current_state) is
 when zero =>
  if(s_in='1') then
   -- "1"
   next_state <= one;
  else
   next_state <= zero;
  end if;
 when one =>
  if(s_in='0') then
   -- "10"
   next_state <= one_zero;
  else
   next_state <= one;
  end if;  
 when one_zero => 
  if(s_in='0') then
   -- "100"
   next_state <= one_zero_zero;
  else
   next_state <= one;
  end if;  
 when one_zero_zero =>
  if(s_in='1') then
   -- "1001"
   next_state <= one_zero_zero_one;
  else
   next_state <= zero;
  end if; 
 when one_zero_zero_one =>
  if(s_in='1') then
   next_state <= one;
  else
   next_state <= one_zero;
  end if;
 end case;
end process;


process(current_state)
begin 
 case current_state is
 when zero =>
  d_out <= '0';
 when one =>
  d_out <= '0'; 
 when one_zero => 
  d_out <= '0'; 
 when one_zero_zero =>
  d_out <= '0'; 
 when one_zero_zero_one =>
  d_out <= '1';
 end case;
end process;
end Behavioral;