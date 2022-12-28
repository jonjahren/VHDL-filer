----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 11:50:31
-- Design Name: 
-- Module Name: UART_RX_JJ - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_RX_JJ is
    Port ( rst          : in STD_LOGIC;
           clk          : in STD_LOGIC;
           s_tick       : in STD_LOGIC;
           rx           : in STD_LOGIC;
           dout         : out STD_LOGIC_VECTOR(7 downto 0);
           rx_done_ticlk : out STD_LOGIC);
end UART_RX_JJ;

architecture Behavioral of UART_RX_JJ is

-- New data type for fsm

type UART_FSM is(IDLE, START, DATA, STOP);

-- Internal signals --
signal state_next, state_reg : UART_FSM;

signal s_next, s_reg : unsigned(3 downto 0);
signal s_next, n_reg : unsigned(2 downto 0);
signal buffer_nex, buffer_reg : STD_lOGIC_VECTOR(7 downto 0);

  
begin
-- state reg part --
process (rst, clk)
    begin
        if (rst = '1') then
            state_reg <= IDLE;
        elsif(rising_edge(clk)) then
            
                state_reg <= state_next;
            
        end if;
    end process;
-- next state logic --

end Behavioral;
