----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2020 10:58:00
-- Design Name: 
-- Module Name: Mod_1e8_Counter - Behavioral
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

entity Mod_1e8_Counter is
    generic (M : integer := 100000000;
             N : integer := 27);
    Port ( rst      : in STD_LOGIC;
           clk      : in STD_LOGIC;
           en       : in STD_LOGIC;
           q        : out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end Mod_1e8_Counter;

architecture Behavioral of Mod_1e8_Counter is
--------------internal signals ---------------------------
signal state_next: unsigned(N-1 downto 0); --husk å aktivere linje 27 (for unsigned)
signal state_reg : unsigned(N-1 downto 0);

begin
--------------state_reg | sequential part | clk, rst -----
    process (rst, clk)
    begin
        if (rst = '1') then
            state_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if (en = '1') then
                state_reg <= state_next;
            end if;
        end if;
    end process;
    
--------------next state logic | combinational circuits --
---------input signals - external signal, state_reg---
---------output signals : state_next------------------
---------if state_reg = M-1 --> state_next = 0 | reset the counter 
---------if state_reg < M-1 --> state_next = state_reg + 1
state_next <= (others => '0') when state_reg = M-1 else
               state_reg + 1;
               
--------------output logic | combinational circuits ------
q <= std_logic_vector(state_reg);

--------------max_tick | max_tick = 1 only when the counter = M-1
max_tick <= '1' when state_reg = M-1 else
            '0';
            
end Behavioral;