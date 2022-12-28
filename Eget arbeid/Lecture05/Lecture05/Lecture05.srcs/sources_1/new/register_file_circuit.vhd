----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2020 10:50:54
-- Design Name: 
-- Module Name: register_file_circuit - Behavioral
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

entity register_file_circuit is
    Port ( rst      : in STD_LOGIC;
           clk      : in STD_LOGIC;
           wr_en    : in STD_LOGIC;
           r_addr   : in STD_LOGIC_VECTOR (2 downto 0);
           w_addr   : in STD_LOGIC_VECTOR (2 downto 0);
           w_data   : in STD_LOGIC_VECTOR (7 downto 0);
           r_data   : out STD_LOGIC_VECTOR (7 downto 0));
end register_file_circuit;

architecture Behavioral of register_file_circuit is

--This is the register file that has 8 register and each register has 8 bits
type register_file_type is array (7 downto 0) of std_logic_vector (7 downto 0); --define a new data type
signal array_register : register_file_type; -- a signal of the new data type


begin

process (rst, clk)
    begin
        if (rst = '1') then
            array_register <= (others => (others => '0'));
        elsif (rising_edge(clk)) then
            if (wr_en = '1') then
                array_register(to_integer(unsigned(w_addr))) <= w_data;
            end if;
        end if;
    end process;

    r_data <= array_register(to_integer(unsigned(r_addr)));
end Behavioral;
