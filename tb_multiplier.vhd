--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:50:39 10/04/2015
-- Design Name:   
-- Module Name:   C:/Xdesigns/w07_q17/tb_multiplier.vhd
-- Project Name:  w07_q17
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_multiplier IS
END tb_multiplier;
 
ARCHITECTURE behavior OF tb_multiplier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         In_A : IN  std_logic_vector(3 downto 0);
         In_B : IN  std_logic_vector(3 downto 0);
         OR_Out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal In_A : std_logic_vector(3 downto 0) := (others => '0');
   signal In_B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OR_Out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier PORT MAP (
          clk => clk,
          reset => reset,
          In_A => In_A,
          In_B => In_B,
          OR_Out => OR_Out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*3;

      In_A <= "0100";
		In_B <= "0110";
		wait for clk_period*300;

      wait;
   end process;

END;
