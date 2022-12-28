library ieee;
use ieee.std_logic_1164.all;

entity project4 is
    port ( 
        clk:        in  std_logic;
        reset:      in  std_logic;
        x:          in  std_logic_vector (1 downto 0);
        y:  out std_logic_vector (2 downto 0)
    );
end entity project4;

architecture behavioral of project4 is
    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal state: state_type;
begin
process1: 
    process (clk, reset)
    begin
    if reset ='0' then 
        state <= s0;
        y <= "000";
    else if clk'event and clk='1' then
        case state is
            when s0 =>
                if x = "00" then
                    state <= s1;
                    y <= "001";
                else if x = "01" then
                    state <= s7;
                    y <= "111";
                else if  x = "10" then
                    state <= s2;
                    y <= "010";
                else
                    state <= s4;
                    y <= "100";
                end if;
            when s1 =>
                if  x = "00" then
                    state <= s2;
                    y <= "010";
                else if  
                    x = "01" then
                    state <= s0;
                    y <= "000";
                else if  x = "10" then
                    state <= s0;
                    y <= "000";
                else
                    state <= s0;
                    y <= "000";
                end if;

            when s2 =>
                if  x = "00" then
                     state <= s3;
                     y <= "011";
                else if  x = "01" then
                     state <= s1;
                     y <= "001";
                else if  x = "10" then
                     state <= s5;
                     y <= "110";
                else
                     state <= s3;
                     y <= "011";
        end if;

            when s3 =>
                if  x = "00" then
                     state <= s4;
                     y <= "100";
                else if  x = "01" then
                     state <= s2;
                     y <= "010";
                else if  x = "10" then
                     state <= s1;
                     y <= "001";
                else
                     state <= s1;
                     y <= "001";
                 end if;

            when s4 =>
                if  x = "00" then
                    state <= s5;
                    y <= "101";
                else if  x = "01" then
                     state <= s3;
                     y <= "011";
                else if  x = "10" then
                     state <= s5;
                     y <= "101";
                 else
                     state <= s5;
                     y <= "101";
                 end if;

            when s5 =>
                if  x = "00" then
                    state <= s6;
                    y <= "110";
                else if  x = "01" then
                    state <= s4;
                    y <= "100";
                else if  x = "10" then
                    state <= s7;
                    y <= "111";
                else
                    state <= s7;
                    y <= "111";
                end if;

            when s6 =>
                if  x = "00" then
                     state <= s7;
                     y <= "111";
                else if  x = "01" then
                    state <= s5;
                    y <= "101";
                else if  x = "10" then
                    state <= s4;
                    y <= "100";
                else
                    state <= s2;
                    y <= "010";
                end if;

            when s7 =>
                if  x = "00" then
                    state <= s0;
                    y <= "000";
                else if  x = "01" then
                    state <= s6;
                    y <= "110";
                else if  x = "10" then
                    state <= s3;
                    y <= "011";
                else
                    state <= s6;
                    y <= "110";
                end if;
            end case;

    end process process1;

process2: 
    process(state)
    begin
        case state is
            when s0 => y <= "000";
            when s1 => y <= "001";
            when s2 => y <= "010";
            when s3 => y <= "011";
            when s4 => y <= "100";
            when s5 => y <= "101";
            when s6 => y <= "110";
            when s7 => y <= "111";
        end case;
    end process process2;
end behavioral;