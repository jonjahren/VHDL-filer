library ieee;
use ieee.std_logic_1164.all;
use work.chu_io_map.all;
entity mcs_top_dlx is
   generic(BRIDGE_BASE : std_logic_vector(31 downto 0) := x"C0000000");
   port(
      clk         : in    std_logic;
      reset_n     : in    std_logic;
      -- switches and LEDs
      sw          : in    std_logic_vector(15 downto 0);
      led         : out   std_logic_vector(15 downto 0);
      -- uart
      rx          : in    std_logic;
      tx          : out   std_logic;
      -- xadc
      adc_p       : in    std_logic_vector(3 downto 0);
      adc_n       : in    std_logic_vector(3 downto 0);
      -- rgb leds
      rgb_led1    : out   std_logic_vector(2 downto 0);
      rgb_led2    : out   std_logic_vector(2 downto 0);
      -- buttons
      btn         : in    std_logic_vector(4 downto 0);
      -- 4-digit 7-seg LEDs
      an          : out   std_logic_vector(7 downto 0);
      sseg        : out   std_logic_vector(7 downto 0);
      -- spi accelerator
      acl_sclk    : out   std_logic;
      acl_mosi    : out   std_logic;
      acl_miso    : in    std_logic;
      acl_ss_n    : out   std_logic;
      -- i2c temperature sensor
      tmp_i2c_scl : out   std_logic;
      tmp_i2c_sda : inout std_logic;
      -- ps2
      ps2d        : inout std_logic;
      ps2c        : inout std_logic;
      -- nexsys 4 aduio
      audio_on    : out   std_logic;
      audio_pdm   : out   std_logic;
      
      -- to vga monitor  
      hsync   : out std_logic;
      vsync   : out std_logic;
      rgb     : out std_logic_vector(11 downto 0);
      
      -- spi sd card
      sd_sclk    : out   std_logic;
      sd_mosi    : out   std_logic;
      sd_miso    : in    std_logic;
      sd_ss_n    : out   std_logic;
      sd_reset    : out   std_logic;
    
      -- PMOD JA (divided into top row and bottom row
      ja_top      : out   std_logic_vector(4 downto 1);
      ja_btm      : out   std_logic_vector(10 downto 7);
      -- PMOD JB (divided into top row and bottom row
      jb_top      : inout   std_logic_vector(4 downto 1);
      jb_btm      : inout   std_logic_vector(10 downto 7);
      -- PMOD JC (divided into top row and bottom row
      jc_top      : inout   std_logic_vector(4 downto 1);
      jc_btm      : inout   std_logic_vector(10 downto 7);
      -- PMOD JD (divided into top row and bottom row
      jd_top      : inout   std_logic_vector(4 downto 1);
      jd_btm      : inout   std_logic_vector(10 downto 7)
   );
end mcs_top_dlx;

architecture arch of mcs_top_dlx is
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
   component mmcm_fpro
      port(
         clk_in_100M : in  std_logic;
         clk_100M    : out std_logic;
         clk_25M     : out std_logic;
         clk_40M     : out std_logic;
         clk_67M     : out std_logic;
         reset       : in  std_logic;
         locked      : out std_logic
      );
   end component;
   -- clk/reset related
   signal clk_25M, clk_100M : std_logic;
   signal locked, reset_sys : std_logic;
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
   signal fp_video_cs     : std_logic;
   signal fp_wr         : std_logic;
   signal fp_rd         : std_logic;
   signal fp_addr       : std_logic_vector(20 downto 0);
   signal fp_wr_data    : std_logic_vector(31 downto 0);
   signal fp_rd_data    : std_logic_vector(31 downto 0);
   -- pwm 
   signal pwm             : std_logic_vector(7 downto 0);
   -- ddfs/audio pdm 
   signal pdm             : std_logic;
   signal ddfs_sq_wave    : std_logic;
   -- dlx system signals
   signal spi1_sclk     : std_logic;
   signal spi1_mosi     : std_logic;
   signal spi1_miso     : std_logic;
   signal spi1_ss       : std_logic_vector(3 downto 0);
   signal spi2_ss       : std_logic_vector(3 downto 0);
   signal i2c1_scl      : std_logic;
   signal i2c1_sda      : std_logic;
   signal rx2, tx2      : std_logic;
   signal pwm1          : std_logic_vector(7 downto 0);

begin
   -- audio
   audio_pdm          <= pdm;
   audio_on           <= '1';
   --  rgb leds
   rgb_led2           <= pwm(5 downto 3);
   rgb_led1           <= pwm(2 downto 0);
   -- sd card 
   -- asserting sd_reset 0 to supply sd card power *see manual
   sd_reset <='0'; 
   sd_ss_n <=spi2_ss(0); 
   -- PMOD JA  
   ja_top(1)          <= ddfs_sq_wave;
   ja_top(2)          <= pdm;
   ja_top(4 downto 3) <= pwm(7 downto 6);
   ja_btm             <= "0000";
   -- PMOD JB (per pmod spi spec; with additional cs on bottom)
   jb_top(1) <= spi2_ss(0);
   jb_top(2) <= spi1_mosi;
   spi1_miso <= jb_top(3) ;
   jb_top(4) <= spi1_sclk;
   jb_btm <= spi1_ss (3 downto 1) & '0';
   -- PMOD JC (per pmod i2c spec)
   --jc_top(1) <= i2c1_sda;
   --jc_top(2) <= i2c1_scl;
   jc_btm(8) <= tx2;
   rx2  <= jc_btm(9);
   -- PMOD JD
   jd_top <= pwm1(3 downto 0);
   jd_btm <= pwm1(7 downto 4);
   
   -- clock and reset
   reset_sys <= (not locked) or (not reset_n);
   -- instantiate clock management unit 
   clk_mmcm_unit : mmcm_fpro
      port map(
         -- Clock in ports
         clk_in_100M => clk,
         -- Clock out ports  
         clk_100M    => clk_100M,
         clk_25M     => clk_25M,
         clk_40M     => open,
         clk_67M     => open,
         -- Status and control signals                
         reset       => '0',
         locked      => locked
      );
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
         fp_video_cs     => fp_video_cs,
         fp_mmio_cs      => fp_mmio_cs,
         fp_wr           => fp_wr,
         fp_rd           => fp_rd,
         fp_addr         => fp_addr,
         fp_wr_data      => fp_wr_data,
         fp_rd_data      => fp_rd_data
      );
   -- instantiate sampler MMIO subsystem 
   mmio_sys_unit : entity work.mmio_sys_dlx
      port map(
         clk           => clk_100M,
         reset         => reset_sys,
         mmio_cs       => fp_mmio_cs,
         mmio_wr       => fp_wr,
         mmio_rd       => fp_rd,
         mmio_addr     => fp_addr,
         mmio_wr_data  => fp_wr_data,
         mmio_rd_data  => fp_rd_data,
         sw            => sw,
         led           => led,
         rx            => rx,
         tx            => tx,
         adc_p         => adc_p,
         adc_n         => adc_n,
         pwm           => pwm,
         btn           => btn,
         an            => an,
         sseg          => sseg,
         tmp_i2c_scl   => tmp_i2c_scl,
         tmp_i2c_sda   => tmp_i2c_sda,
         acl_sclk      => acl_sclk,
         acl_mosi      => acl_mosi,
         acl_miso      => acl_miso,
         acl_ss        => acl_ss_n,
         ps2d          => ps2d,
         ps2c          => ps2c,
         ddfs_sq_wave  => ddfs_sq_wave,
         pdm           => pdm,
         rx2           => rx2,
         tx2           => tx2,
         rx3           => '0',
         tx3           => open,
         spi1_sclk     => spi1_sclk,
         spi1_mosi     => spi1_mosi,
         spi1_miso     => spi1_miso,
         spi1_ss       => spi1_ss,
         spi2_sclk     => sd_sclk,
         spi2_mosi     => sd_mosi,
         spi2_miso     => sd_miso,
         spi2_ss       => spi2_ss,
         i2c1_scl      => jc_top(2),
         i2c1_sda      => jc_top(1),
         i2c2_scl      => open,
         i2c2_sda      => open,
         ddfs1_sq_wave => open,
         ddfs1_pdm     => open,
         ddfs2_sq_wave => open,
         ddfs2_pdm     => open,
         pwm1          => pwm1
      );

   -- instantiate daisy video subsystem
   video_sys_unit : entity work.video_sys_daisy
      generic map(
         CD              => 12,
         VRAM_DATA_WIDTH => 9)
      port map(
         clk_sys       => clk_100M,
         clk_25M       => clk_25M,
         reset_sys     => reset_sys,
         video_cs      => fp_video_cs,
         video_wr      => fp_wr,
         video_addr    => fp_addr,
         video_wr_data => fp_wr_data,
         vsync         => vsync,
         hsync         => hsync,
         rgb           => rgb
      );
end arch;

