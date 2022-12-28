----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2020 12:38:13
-- Design Name: 
-- Module Name: Mod_16_Test_Block_2 - Behavioral
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

entity Mod_16_Test_Block_2 is
    Port ( rst  : in STD_LOGIC;
           clk  : in STD_LOGIC;
           seg  : out STD_LOGIC_VECTOR (7 downto 0);
           an   : out STD_LOGIC_VECTOR (3 downto 0));
end Mod_16_Test_Block_2;

architecture Behavioral of Mod_16_Test_Block_2 is

component Mode_M_Counter_1e8 
    generic (M : integer := 10;
             N : integer := 4);
    Port ( rst  : in STD_LOGIC;
           clk  : in STD_LOGIC;
           en   : in STD_LOGIC;
           q    : out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC);
end component Mode_M_Counter_1e8;


component hex_to_seg
    Port ( dp   : in STD_LOGIC;
           hex  : in STD_LOGIC_VECTOR (3 downto 0);
           an   : out STD_LOGIC_VECTOR (3 downto 0);
           seg  : out STD_LOGIC_VECTOR (7 downto 0));
end component hex_to_seg;


--------internal signal--------
signal q16 : std_logic_vector(3 downto 0);
signal max_tick_1Hz : std_logic;

begin
Counter_1e8 : mode_M_counter_1e8
    generic map (M => 10000000, N => 27)
    port map (  rst         => rst,
                clk         => clk,
                en                => '1', 
                q                 => open, 
                max_tick    => max_tick_1Hz);
              
Mode_16_Counter: mode_M_counter_1e8
    generic map (M => 16, N => 4)
    port map (rst => rst,
              clk => clk,
              en => max_tick_1Hz,
              q => q16,
              max_tick => open);

HEX_Display: hex_to_seg
    port map (dp => '1',
              hex => q16,
              an => an,
              seg => seg);

end Behavioral;
