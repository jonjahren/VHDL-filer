library IEEE;

entity two_to_one_mux is
    Port (a, b, s: in bit;
         z: out bit);
end two_to_one_mux;

architecture behav of two_to_one_mux is
begin
    choose: process (a, b, s)  -- is
    begin
        if s = '0' then
            z <= b;
        else
            z <= a;
        end if;
    end process choose;
end architecture behav;

LIBRARY ieee;

ENTITY two_to_one_test IS
END two_to_one_test;

ARCHITECTURE behavior OF two_to_one_test IS 

    COMPONENT two_to_one_mux
    PORT(
        a : IN  bit;
        b : IN  bit;
        s : IN  bit;
        z : OUT  bit
        );
    END COMPONENT two_to_one_mux;


   --Inputs
   signal a : bit := '0';
   signal b : bit := '0';
   signal s : bit := '0';

   --Outputs
   signal z : bit;

BEGIN

-- Instantiate the Unit Under Test (UUT)
    uut: two_to_one_mux PORT MAP (
           a => a,
           b => b,
           s => s,
           z => z
           );

   -- Stimulus process
   stimulus: process
   begin
       wait for 10 ns;
       a <= '1';
       wait for 10 ns;
       s <= '1';
       wait for 10 ns;
       s <= '0';     -- added
       wait for 10 ns; -- added
       b <= '1';
       wait for 10 ns; -- added
       wait;
   end process stimulus;
END architecture behavior;