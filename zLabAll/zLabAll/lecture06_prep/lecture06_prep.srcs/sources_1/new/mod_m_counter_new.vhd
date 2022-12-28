----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:04:52 PM
-- Design Name: 
-- Module Name: mod_m_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_m_counter_new is
generic ( 	M : integer := 10;
			N : integer := 4);
    Port ( rst 		: in STD_LOGIC;
           clk 		: in STD_LOGIC;
           en 		: in STD_LOGIC;
           q 		: out STD_LOGIC_VECTOR (N-1 downto 0);
           dp 	: in STD_LOGIC;
           hex 	: in STD_LOGIC_VECTOR (3 downto 0);
           an 	: out STD_LOGIC_VECTOR (3 downto 0);
           seg 	: out STD_LOGIC_VECTOR (7 downto 0));
           
end mod_m_counter_new;

architecture Behavioral of mod_m_counter_new is

signal state_reg : unsigned (N-1 downto 0);
signal state_next : unsigned(N-1 downto 0);
begin


process (rst, clk)
	begin
		if (rst = '1') then
			state_reg <= (others => '0');
		elsif (rising_edge(clk)) then
			if (en = '1') then
				state_reg <= state_next;
			end if; 
		end if;
	end process;

	state_next <= (others => '0') when state_reg = M-1 else
				   state_reg +1;

	q 			<= std_logic_vector(state_reg);
	max_tick 	<= '1' when state_reg = M-1 else
	             '0';
    max_tick = hex
begin
	seg(7) <= dp; 
	an     <= "0000";
process (hex)
	begin
		case hex is
			when "0000" => -- hex = 0
				seg(6 downto 0) <= "1000000";
			when "0001" => -- hex = 1
				seg(6 downto 0) <= "1111001";
			when "0010" => -- hex = 2
				seg(6 downto 0) <= "0100100";
			when "0011" => -- hex = 3
			-- your statements here--
				seg(6 downto 0) <= "0110000";
			when "0100" => -- hex = 4
				seg(6 downto 0) <= "0011001";
			when "0101" => -- hex = 5
				seg(6 downto 0) <= "0010010";
			when "0110" => -- hex = 6
				seg(6 downto 0) <= "0000010";
			when "0111" => -- hex = 7
				seg(6 downto 0) <= "1111000";
			when "1000" => -- hex = 8
				seg(6 downto 0) <= "0000000";
			when "1001" => -- hex = 9
				seg(6 downto 0) <= "0010000";
			when "1010" => -- hex = A
				seg(6 downto 0) <= "0001000";
			when "1011" => -- hex = B
				seg(6 downto 0) <= "0000011";
			when "1100" => -- hex = C
				seg(6 downto 0) <= "1000110";
			when "1101" => -- hex = D
				seg(6 downto 0) <= "0100001";
			when "1110" => -- hex = E
				seg(6 downto 0) <= "0000110";
			when others => -- hex = F
				seg(6 downto 0) <= "0001110";
		end case;
	end process;

end Behavioral;
