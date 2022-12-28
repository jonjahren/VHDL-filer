library ieee;
use ieee.std_logic_1164.all;
use work.chu_io_map.all;
entity mcs_top_vanilla is
   generic(BRIDGE_BASE : std_logic_vector(31 downto 0) := x"C0000000");
   port(
      clk     : in  std_logic;
      reset_n : in  std_logic;
      -- switches and LEDs
      sw      : in  std_logic_vector(15 downto 0);
      led     : out std_logic_vector(15 downto 0);
      -- uart
      rx      : in  std_logic;
      tx      : out std_logic
      
   );
end mcs_top_vanilla;

architecture arch of mcs_top_vanilla is
   component cpu
      port(
         clk             : in  std_logic;
         reset           : in  std_logic;
         io_addr_strobe  : out std_logic;
         io_read_strobe  : out std_logic;
         io_write_strobe : out std_logic;
         io_address      : out std_logic_vector(31 downto 0);
         io_byte_enable  : out std_logic_vector(3 downto 0);
         io_write_data   : out std_logic_vector(31 downto 0);
         io_read_data    : in  std_logic_vector(31 downto 0);
         io_ready        : in  std_logic
      );
   end component;
   signal clk_100M        : std_logic;
   signal reset_sys       : std_logic;
   -- MCS IO bus
   signal io_addr_strobe  : std_logic;
   signal io_read_strobe  : std_logic;
   signal io_write_strobe : std_logic;
   signal io_byte_enable  : std_logic_vector(3 downto 0);
   signal io_address      : std_logic_vector(31 downto 0);
   signal io_write_data   : std_logic_vector(31 downto 0);
   signal io_read_data    : std_logic_vector(31 downto 0);
   signal io_ready        : std_logic;
   -- fpro bus 
   signal fp_mmio_cs         : std_logic;
   signal fp_wr         : std_logic;
   signal fp_rd         : std_logic;
   signal fp_addr       : std_logic_vector(20 downto 0);
   signal fp_wr_data    : std_logic_vector(31 downto 0);
   signal fp_rd_data    : std_logic_vector(31 downto 0);
begin
   -- clock and reset
   clk_100M  <= clk;   -- 100 MHz external clock
   reset_sys <= not reset_n;
   -- instantiate microBlaze MCS
   mcs_0 : cpu
      port map(
         clk             => clk_100M,
         reset           => reset_sys,
         io_addr_strobe  => io_addr_strobe,
         io_read_strobe  => io_read_strobe,
         io_write_strobe => io_write_strobe,
         io_byte_enable  => io_byte_enable,
         io_address      => io_address,
         io_write_data   => io_write_data,
         io_read_data    => io_read_data,
         io_ready        => io_ready
      );
   -- instantiate MCS IO bus to FPro bus bridge
   bridge_unit : entity work.chu_mcs_bridge
      generic map(BRG_BASE => BRIDGE_BASE)
      port map(
         io_addr_strobe  => io_addr_strobe,
         io_read_strobe  => io_read_strobe,
         io_write_strobe => io_write_strobe,
         io_byte_enable  => io_byte_enable,
         io_address      => io_address,
         io_write_data   => io_write_data,
         io_read_data    => io_read_data,
         io_ready        => io_ready,
         fp_video_cs     => open,
         fp_mmio_cs      => fp_mmio_cs,
         fp_wr           => fp_wr,
         fp_rd           => fp_rd,
         fp_addr         => fp_addr,
         fp_wr_data      => fp_wr_data,
         fp_rd_data      => fp_rd_data
      );
   -- instantiate vanilla MMIO subsystem 
   mmio_sys_unit : entity work.mmio_sys_vanilla
      generic map(
         N_LED=>16,
         N_SW=>16
      )
      port map(
         clk          => clk_100M,
         reset        => reset_sys,
         mmio_cs      => fp_mmio_cs,
         mmio_wr      => fp_wr,
         mmio_rd      => fp_rd,
         mmio_addr    => fp_addr,
         mmio_wr_data => fp_wr_data,
         mmio_rd_data => fp_rd_data,
         sw           => sw,
         led          => led,
         rx           => rx,
         tx           => tx
      );
end arch;


