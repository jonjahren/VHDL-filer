----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2020 09:18:48 AM
-- Design Name: 
-- Module Name: Eight_Bit_Comparator_struct_tb - Behavioral
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

entity Eight_Bit_Comparator_struct_tb is
--  Port ( );
end Eight_Bit_Comparator_struct_tb;

architecture Behavioral of Eight_Bit_Comparator_struct_tb is
------------------------- component declaration -------------------
component Eight_Bit_Comparator 
    Port ( A8 : in STD_LOGIC_VECTOR (7 downto 0);
           B8 : in STD_LOGIC_VECTOR (7 downto 0);
           Z8 : out STD_LOGIC);
end component Eight_Bit_Comparator;

------------------------ internal signals --------------------------
signal a8_tb, b8_tb : std_logic_vector (7 downto 0);
signal z8_tb : std_logic; 

begin
-------------------- UUT instantiation ------------------------------
UUT : Eight_Bit_Comparator
port map(a8 => a8_tb, b8=>b8_tb, z8 => z8_tb); -----trenger ikke å legg til _tb eks. a8=>a8


-------------------- Test Vector Generator --------------------------
Test_Vector_Process: process 
begin 
    for a_tb in 0 to 2**8-1 loop 
        for b_tb in 0 to 2**8-1 loop
            a8_tb <= std_logic_vector(to_unsigned(a_tb,8)); -----idikerer antall bit i dette tilfelle 8. 
            b8_tb <= std_logic_vector(to_unsigned(b_tb,8));
            wait for 10ns;
        end loop; --- end of the loop for b
    end loop; --- end of the loop for a
end process; 

end Behavioral;
