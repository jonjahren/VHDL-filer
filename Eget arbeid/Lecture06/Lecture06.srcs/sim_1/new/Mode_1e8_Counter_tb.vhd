----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2020 09:35:50
-- Design Name: 
-- Module Name: Mode_M_Counter_tb - Behavioral
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

entity Mode_1e8_Counter_tb is
--  Port ( );
end Mode_1e8_Counter_tb;

architecture Behavioral of Mode_1e8_Counter_tb is

----------component decleration---------
component Mod_1e8_Counter
    generic (M : integer := 10;
             N : integer := 4);
    Port ( rst      : in STD_LOGIC;
           clk      : in STD_LOGIC;
           en       : in STD_LOGIC;
           q        : out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick_1Hz : out STD_LOGIC);
end component Mod_1e8_Counter;

----------internal signal | tb signals--
constant M_tb : integer := 100000000;
constant N : integer := 27;
constant CLK_Period : time := 10 ns; --Basys-3 har klokkefrekvens 100MHz T_Clk = 10ns

signal clk : std_logic  := '1';
signal rst : std_logic  := '0';
signal en : std_logic   := '0';
signal q : std_logic_vector(N-1 downto 0);
signal max_tick_1Hz : std_logic;

begin

----------UUT | component instantiation-
UUT_Counter: Mod_1e8_Counter
generic map (M => M_tb, N => N)
port map (rst => rst,
          clk => clk,
          en => en,
          q => q,
          max_tick_1Hz => max_tick_1Hz);
          
----------Test vector | clk, rst, en----
    -------clock signal----
    clk <= not clk after CLK_Period/2;
    -------generate other signal---
    process
        begin
            wait until rising_edge(clk);
            rst <= '1'; --reset counter
            wait until rising_edge(clk);
            wait until rising_edge(clk);
            rst <= '0'; -- let counter run
            wait until rising_edge(clk);
            en <= '1'; -- let counter run
            wait;
            
        end process;
end Behavioral;
