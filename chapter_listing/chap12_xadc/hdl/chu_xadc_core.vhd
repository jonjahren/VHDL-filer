
--*************************************************
-- Xilinx xadc interface:
--  * xadc in sequence mode
--  * DRP interface is connected to atomtically read
--    out the pres-designated channels
--  * the readout is stored into corresponding register
--
--*************************************************
library ieee;
use ieee.std_logic_1164.all;
entity chu_xadc_core is
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      -- slot interface
      cs      : in  std_logic;
      write   : in  std_logic;
      read    : in  std_logic;         
      addr    : in  std_logic_vector(4 downto 0);  
      rd_data : out std_logic_vector(31 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- external signals 
      adc_p   : in  std_logic_vector(3 downto 0);
      adc_n   : in  std_logic_vector(3 downto 0)
   );
end chu_xadc_core;

architecture arch of chu_xadc_core is
   component xadc_fpro
      port(
         di_in       : in  std_logic_vector(15 downto 0);
         daddr_in    : in  std_logic_vector(6 downto 0);
         den_in      : in  std_logic;
         dwe_in      : in  std_logic;
         drdy_out    : out std_logic;
         do_out      : out std_logic_vector(15 downto 0);
         dclk_in     : in  std_logic;
         reset_in    : in  std_logic;
         vp_in       : in  std_logic;
         vn_in       : in  std_logic;
         vauxp2      : in  std_logic;
         vauxn2      : in  std_logic;
         vauxp3      : in  std_logic;
         vauxn3      : in  std_logic;
         vauxp10     : in  std_logic;
         vauxn10     : in  std_logic;
         vauxp11     : in  std_logic;
         vauxn11     : in  std_logic;
         channel_out : out std_logic_vector(4 downto 0);
         eoc_out     : out std_logic;
         alarm_out   : out std_logic;
         eos_out     : out std_logic;
         busy_out    : out std_logic
      );
   end component;
   signal channel      : std_logic_vector(4 downto 0);
   signal daddr_in     : std_logic_vector(6 downto 0);
   signal eoc          : std_logic;
   signal rdy          : std_logic;
   signal adc_data     : std_logic_vector(15 downto 0);
   signal adc0_out_reg : std_logic_vector(15 downto 0);
   signal adc1_out_reg : std_logic_vector(15 downto 0);
   signal adc2_out_reg : std_logic_vector(15 downto 0);
   signal adc3_out_reg : std_logic_vector(15 downto 0);
   signal tmp_out_reg  : std_logic_vector(15 downto 0);
   signal vcc_out_reg  : std_logic_vector(15 downto 0);
begin
   -- instantiate cusomized xadc core  
   xdac_unit : xadc_fpro
      port map(
         dclk_in     => clk,
         reset_in    => reset,          --reset,
         di_in       => (others => '0'),
         daddr_in    => daddr_in,
         den_in      => eoc,
         dwe_in      => '0',            -- read only
         drdy_out    => rdy,
         do_out      => adc_data,
         vp_in       => '0',
         vn_in       => '0',
         vauxp2      => adc_p(2),
         vauxn2      => adc_n(2),
         vauxp3      => adc_p(0),
         vauxn3      => adc_n(0),
         vauxp10     => adc_p(1),
         vauxn10     => adc_n(1),
         vauxp11     => adc_p(3),
         vauxn11     => adc_n(3),
         channel_out => channel,
         eoc_out     => eoc,
         eos_out     => open,
         busy_out    => open,
         alarm_out   => open
      );
   -- form xadc DRP address 
   daddr_in <= "00" & channel;
   -- registers and decoding 
   process(clk, reset)
   begin
      if reset = '1' then
         adc0_out_reg <= (others => '0');
         adc1_out_reg <= (others => '0');
         adc2_out_reg <= (others => '0');
         adc3_out_reg <= (others => '0');
         tmp_out_reg  <= (others => '0');
         vcc_out_reg  <= (others => '0');
      elsif (clk'event and clk = '1') then
         if rdy = '1' and channel = "10011" then
            adc0_out_reg <= adc_data;
         end if;
         if rdy = '1' and channel = "11010" then
            adc1_out_reg <= adc_data;
         end if;
         if rdy = '1' and channel = "10010" then
            adc2_out_reg <= adc_data;
         end if;
         if rdy = '1' and channel = "11011" then
            adc3_out_reg <= adc_data;
         end if;
         if rdy = '1' and channel = "00000" then
            tmp_out_reg <= adc_data;
         end if;
         if rdy = '1' and channel = "00001" then
            vcc_out_reg <= adc_data;
         end if;
      end if;
   end process;
   -- read multiplexing   
   with addr(2 downto 0) select 
      rd_data <=
         x"0000" & adc0_out_reg when "000",
         x"0000" & adc1_out_reg when "001",
         x"0000" & adc2_out_reg when "010",
         x"0000" & adc3_out_reg when "011",
         x"0000" & tmp_out_reg  when "100",
         x"0000" & vcc_out_reg  when others;
end arch;

