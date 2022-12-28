----------------------------------------------------------------------------------
-- test bench for top level | josemmf@usn.no | October 2015


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_top_level1 IS
END tb_top_level1;

ARCHITECTURE behavior OF tb_top_level1 IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT toplevel
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tdi : IN  std_logic;
         tms : IN  std_logic;
         in0 : IN  std_logic;
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         out0 : OUT  std_logic;
         out1 : OUT  std_logic;
         out2 : OUT  std_logic;
         tdo : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal tdi : std_logic := '0';
   signal tms : std_logic := '0';
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';

 	--Outputs
   signal out0 : std_logic;
   signal out1 : std_logic;
   signal out2 : std_logic;
   signal tdo : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: toplevel PORT MAP (
          clk => clk,
          reset => reset,
          tdi => tdi,
          tms => tms,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          out0 => out0,
          out1 => out1,
          out2 => out2,
          tdo => tdo
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
      wait for 20 ns;	
		reset <= '0';
		in0 <= '1';
		in1 <= '1';
		in2 <= '1';
		tdi <= '0';
		tms <= '1';				
      wait for clk_period*5;	-- Go to TLR
		tms <= '0';				
      wait for clk_period;		-- Go to RTI
		tms <= '1';		
      wait for clk_period;		-- Go to SEL-DR
		tms <= '1';		
      wait for clk_period;		-- Go to SEL-IR
		tms <= '0';		
      wait for clk_period;		-- Go to CAPT-IR
		tms <= '0';		
      wait for clk_period;		-- Go to SHIFT-IR
		tdi <= '0';					-- To shift in the OVRD instruction
      wait for clk_period;	   -- Remain in SHIFT-IR 
		tdi <= '1';					-- To shift in the OVRD instruction
      wait for clk_period;	   -- Remain in SHIFT-IR 
		tdi <= '1';					-- To shift in the OVRD instruction
      wait for clk_period;	   -- Remain in SHIFT-IR 
		tdi <= '0';					-- To shift in the OVRD instruction
		tms <= '1';					-- Shift last bit into IR and go to EX1-IR
      wait for clk_period;	   -- Remain in SHIFT-IR 
		tms <= '1';		
      wait for clk_period;		-- Go to UPDT-IR
		tms <= '1';		
      wait for clk_period;		-- Go to SEL-DR
		tms <= '0';		
      wait for clk_period;		-- Go to CAPT-DR
		tms <= '0';		
      wait for clk_period;		-- Go to SHIFT-DR
		tdi <= '0';		
      wait for clk_period;		-- Remain in SHIFT-DR 
		tdi <= '1';					-- To override OUT[1]
      wait for clk_period;		-- Remain in SHIFT-DR 
		tdi <= '0';		
      wait for clk_period;		-- Remain in SHIFT-DR 
		tdi <= '0';		
      wait for clk_period;		-- Remain in SHIFT-DR 
		tdi <= '0';		
      wait for clk_period;		-- Remain in SHIFT-DR 
		tdi <= '0';		
 		tms <= '1';		
		wait for clk_period;		-- Shift last bit into DR (BSR) and go to EX1-DR 
		tms <= '1';		
      wait for clk_period;		-- Go to UPDT-DR
		tms <= '1';		
      wait for clk_period;		-- Go to SEL-DR
		tms <= '1';		
      wait for clk_period;		-- Go to SEL-IR
		tms <= '0';		
      wait for clk_period;		-- Go to CAPT-IR
		tms <= '0';		
      wait for clk_period;		-- Go to SHIFT-IR
		tdi <= '1';					-- To shift in the BYPASS instruction
      wait for clk_period*3; 	-- Remain in SHIFT-IR for 3 TCK cyles
		tms <= '1';					-- Shift last bit into IR and go to EX1-IR
      wait for clk_period;	   -- Remain in SHIFT-IR 
		tms <= '1';		
      wait for clk_period;		-- Go to UPDT-IR
		tms <= '0';		
      wait for clk_period;		-- Go to RTI
		in0 <= '0';
		in1 <= '1';
		in2 <= '0';
      wait for clk_period*3;		
		in0 <= '1';
		in1 <= '0';
		in2 <= '1';
      wait for clk_period*3;		
		in0 <= '0';
		in1 <= '0';
		in2 <= '0';
      wait for clk_period*3;		

      wait;

		end process;

END;

