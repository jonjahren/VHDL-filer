library ieee;
use ieee.std_logic_1164.all;
use work.chu_io_map.all;
entity mmio_sys_dlx is
   port(
      -- FPro bus
      clk           : in    std_logic;
      reset         : in    std_logic;
      mmio_cs       : in    std_logic;
      mmio_wr       : in    std_logic;
      mmio_rd       : in    std_logic;
      mmio_addr     : in    std_logic_vector(20 downto 0);
      mmio_wr_data  : in    std_logic_vector(31 downto 0);
      mmio_rd_data  : out   std_logic_vector(31 downto 0);
      -- switches and LEDs
      sw            : in    std_logic_vector(15 downto 0);
      led           : out   std_logic_vector(15 downto 0);
      -- uart
      rx            : in    std_logic;
      tx            : out   std_logic;
      -- 4 analog input pair
      adc_p         : in    std_logic_vector(3 downto 0);
      adc_n         : in    std_logic_vector(3 downto 0);
      -- pwm 
      pwm           : out   std_logic_vector(7 downto 0);
      -- btn
      btn           : in    std_logic_vector(4 downto 0);
      -- 8-digit 7-seg LEDs
      an            : out   std_logic_vector(7 downto 0);
      sseg          : out   std_logic_vector(7 downto 0);
      -- spi accelerator
      acl_sclk      : out   std_logic;
      acl_mosi      : out   std_logic;
      acl_miso      : in    std_logic;
      acl_ss        : out   std_logic;
      -- i2c temperature sensor  
      tmp_i2c_scl   : out   std_logic;
      tmp_i2c_sda   : inout std_logic;
      -- ps2
      ps2d          : inout std_logic;
      ps2c          : inout std_logic;
      --ddfs square wave output
      ddfs_sq_wave  : out   std_logic;
      -- 1-bit dac 
      pdm           : out   std_logic;
      -- ***********************************************
      -- additional signals for dlx 
      -- ***********************************************
      -- 2 uarts
      rx2           : in    std_logic;
      tx2           : out   std_logic;
      rx3           : in    std_logic;
      tx3           : out   std_logic;
      -- 2 spi 
      spi1_sclk     : out   std_logic;
      spi1_mosi     : out   std_logic;
      spi1_miso     : in    std_logic;
      spi1_ss       : out   std_logic_vector(3 downto 0);
      spi2_sclk     : out   std_logic;
      spi2_mosi     : out   std_logic;
      spi2_miso     : in    std_logic;
      spi2_ss       : out   std_logic_vector(3 downto 0);
      -- 2 i2c master  
      i2c1_scl      : out   std_logic;
      i2c1_sda      : inout std_logic;
      i2c2_scl      : out   std_logic;
      i2c2_sda      : inout std_logic;
      -- 2 ddfs
      ddfs1_sq_wave : out   std_logic;
      ddfs1_pdm     : out   std_logic;
      ddfs2_sq_wave : out   std_logic;
      ddfs2_pdm     : out   std_logic;
      pwm1          : out   std_logic_vector(7 downto 0)
   );
end mmio_sys_dlx;

architecture arch of mmio_sys_dlx is
   signal cs_array       : std_logic_vector(63 downto 0);
   signal reg_addr_array : slot_2d_reg_type;
   signal mem_rd_array   : std_logic_vector(63 downto 0);
   signal mem_wr_array   : std_logic_vector(63 downto 0);
   signal rd_data_array  : slot_2d_data_type;
   signal wr_data_array  : slot_2d_data_type;
   signal adsr_env       : std_logic_vector(15 downto 0);
begin
   --******************************************************************
   --  MMIO controller instantiation  
   --******************************************************************
   ctrl_unit : entity work.chu_mmio_controller
      port map(
         -- FPro bus interface
         mmio_cs             => mmio_cs,
         mmio_wr             => mmio_wr,
         mmio_rd             => mmio_rd,
         mmio_addr           => mmio_addr,
         mmio_wr_data        => mmio_wr_data,
         mmio_rd_data        => mmio_rd_data,
         -- 64 slot interface
         slot_cs_array       => cs_array,
         slot_reg_addr_array => reg_addr_array,
         slot_mem_rd_array   => mem_rd_array,
         slot_mem_wr_array   => mem_wr_array,
         slot_rd_data_array  => rd_data_array,
         slot_wr_data_array  => wr_data_array
      );
   --******************************************************************
   -- IO slots instantiations
   --******************************************************************
   -- slot 0: system timer 
   timer_slot0 : entity work.chu_timer
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S0_SYS_TIMER),
         read    => mem_rd_array(S0_SYS_TIMER),
         write   => mem_wr_array(S0_SYS_TIMER),
         addr    => reg_addr_array(S0_SYS_TIMER),
         rd_data => rd_data_array(S0_SYS_TIMER),
         wr_data => wr_data_array(S0_SYS_TIMER)
      );
   -- slot 1: uart1     
   uart1_slot1 : entity work.chu_uart
      generic map(FIFO_DEPTH_BIT => 6)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S1_UART1),
         read    => mem_rd_array(S1_UART1),
         write   => mem_wr_array(S1_UART1),
         addr    => reg_addr_array(S1_UART1),
         rd_data => rd_data_array(S1_UART1),
         wr_data => wr_data_array(S1_UART1),
         -- external signals
         tx      => tx,
         rx      => rx
      );
   -- slot 2: GPO for 16 LEDs
   gpo_slot2 : entity work.chu_gpo
      generic map(W => 16)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S2_LED),
         read    => mem_rd_array(S2_LED),
         write   => mem_wr_array(S2_LED),
         addr    => reg_addr_array(S2_LED),
         rd_data => rd_data_array(S2_LED),
         wr_data => wr_data_array(S2_LED),
         -- external signal
         dout    => led
      );
   -- slot 3: input port for 16 slide switches     
   gpi_slot3 : entity work.chu_gpi
      generic map(W => 16)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S3_SW),
         read    => mem_rd_array(S3_SW),
         write   => mem_wr_array(S3_SW),
         addr    => reg_addr_array(S3_SW),
         rd_data => rd_data_array(S3_SW),
         wr_data => wr_data_array(S3_SW),
         -- external signal
         din     => sw
      );
   -- slot 4: reserved for user defined              
   -- user_slot4 : entity work.
   -- port map(
   --    clk      => clk,
   --    reset    => reset,
   --    cs       => cs_array(S4_USER),
   --    read     => mem_rd_array(S4_USER),
   --    write    => mem_wr_array(S4_USER),
   --    addr     => reg_addr_array(S4_USER),
   --    rd_data  => rd_data_array(S4_USER),
   --    wr_data  => wr_data_array(S4_USER)
   -- );
   rd_data_array(4) <= (others => '0');
   -- slot 5: xadc           
   xadc_slot5 : entity work.chu_xadc_core
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S5_XADC),
         read    => mem_rd_array(S5_XADC),
         write   => mem_wr_array(S5_XADC),
         addr    => reg_addr_array(S5_XADC),
         rd_data => rd_data_array(S5_XADC),
         wr_data => wr_data_array(S5_XADC),
         -- external signal
         adc_p   => adc_p,
         adc_n   => adc_n
      );
   -- slot 6: pwm 
   pwm_slot6 : entity work.chu_io_pwm_core
      generic map(
         W => 8,
         R => 10)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S6_PWM),
         read    => mem_rd_array(S6_PWM),
         write   => mem_wr_array(S6_PWM),
         addr    => reg_addr_array(S6_PWM),
         rd_data => rd_data_array(S6_PWM),
         wr_data => wr_data_array(S6_PWM),
         -- external interface
         pwm_out => pwm
      );
   -- slot 7: push button     
   debounce_slot7 : entity work.chu_debounce_core
      generic map(
         W => 5,
         N => 20
      )
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S7_BTN),
         read    => mem_rd_array(S7_BTN),
         write   => mem_wr_array(S7_BTN),
         addr    => reg_addr_array(S7_BTN),
         rd_data => rd_data_array(S7_BTN),
         wr_data => wr_data_array(S7_BTN),
         -- external interface
         din     => btn
      );
   -- slot 8: 7-seg LED    
   sseg_led_slot8 : entity work.chu_led_mux_core
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S8_SSEG),
         read    => mem_rd_array(S8_SSEG),
         write   => mem_wr_array(S8_SSEG),
         addr    => reg_addr_array(S8_SSEG),
         rd_data => rd_data_array(S8_SSEG),
         wr_data => wr_data_array(S8_SSEG),
         -- external interface
         an      => an,
         sseg    => sseg
      );
   -- slot 9 SPI
   spi_slot9 : entity work.chu_spi_core
      generic map(S => 1)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S9_SPI),
         read        => mem_rd_array(S9_SPI),
         write       => mem_wr_array(S9_SPI),
         addr        => reg_addr_array(S9_SPI),
         rd_data     => rd_data_array(S9_SPI),
         wr_data     => wr_data_array(S9_SPI),
         spi_sclk    => acl_sclk,
         spi_mosi    => acl_mosi,
         spi_miso    => acl_miso,
         spi_ss_n(0) => acl_ss
      );
   -- slot 10: i2C    
   i2c_slot10 : entity work.chu_i2c_core
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S10_I2C),
         read    => mem_rd_array(S10_I2C),
         write   => mem_wr_array(S10_I2C),
         addr    => reg_addr_array(S10_I2C),
         rd_data => rd_data_array(S10_I2C),
         wr_data => wr_data_array(S10_I2C),
         scl     => tmp_i2c_scl,
         sda     => tmp_i2c_sda
      );
   -- slot 11: PS2  
   ps2_slot11 : entity work.chu_ps2_core
      generic map(W_SIZE => 6)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S11_PS2),
         read    => mem_rd_array(S11_PS2),
         write   => mem_wr_array(S11_PS2),
         addr    => reg_addr_array(S11_PS2),
         rd_data => rd_data_array(S11_PS2),
         wr_data => wr_data_array(S11_PS2),
         -- external interface
         ps2d    => ps2d,
         ps2c    => ps2c
      );
   -- slot 12: ddfs  
   ddfs_slot12 : entity work.chu_ddfs_core
      generic map(PW => 30)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S12_DDFS),
         read        => mem_rd_array(S12_DDFS),
         write       => mem_wr_array(S12_DDFS),
         addr        => reg_addr_array(S12_DDFS),
         rd_data     => rd_data_array(S12_DDFS),
         wr_data     => wr_data_array(S12_DDFS),
         -- external interface
         focw_ext    => (others => '0'),
         pha_ext     => (others => '0'),
         env_ext     => adsr_env,
         pcm_out     => open,
         digital_out => ddfs_sq_wave,
         pdm_out     => pdm
      );
   -- slot 13: adsr  
   adsr_slot13 : entity work.chu_adsr_core
      port map(
         clk      => clk,
         reset    => reset,
         cs       => cs_array(S13_ADSR),
         read     => mem_rd_array(S13_ADSR),
         write    => mem_wr_array(S13_ADSR),
         addr     => reg_addr_array(S13_ADSR),
         rd_data  => rd_data_array(S13_ADSR),
         wr_data  => wr_data_array(S13_ADSR),
         -- external interface
         adsr_env => adsr_env
      );
   -- ***********************************************
   -- additional cores for dlx 
   -- ***********************************************
   -- slot 14: reserved for user defined              
   -- user_slot14 : entity work.
   -- port map(
   --    clk      => clk,
   --    reset    => reset,
   --    cs       => cs_array(S14_USER1),
   --    read     => mem_rd_array(S14_USER1),
   --    write    => mem_wr_array(S14_USER1),
   --    addr     => reg_addr_array(S14_USER1),
   --    rd_data  => rd_data_array(S14_USER1),
   --    wr_data  => wr_data_array(S14_USER1)
   -- );
   rd_data_array(14) <= (others => '0');

   -- slot 15: reserved for user defined              
   -- user_slot14 : entity work.
   -- port map(
   --    clk      => clk,
   --    reset    => reset,
   --    cs       => cs_array(S15_USER2),
   --    read     => mem_rd_array(S15_USER2),
   --    write    => mem_wr_array(S15_USER2),
   --    addr     => reg_addr_array(S15_USER2),
   --    rd_data  => rd_data_array(S15_USER2),
   --    wr_data  => wr_data_array(S15_USER2)
   -- );
   rd_data_array(15) <= (others => '0');

   -- slot 16: timer #1 
   timer_slot16 : entity work.chu_timer
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S16_TIMER1),
         read    => mem_rd_array(S16_TIMER1),
         write   => mem_wr_array(S16_TIMER1),
         addr    => reg_addr_array(S16_TIMER1),
         rd_data => rd_data_array(S16_TIMER1),
         wr_data => wr_data_array(S16_TIMER1)
      );
   -- slot 17: timer #2 
   timer_slot17 : entity work.chu_timer
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S17_TIMER2),
         read    => mem_rd_array(S17_TIMER2),
         write   => mem_wr_array(S17_TIMER2),
         addr    => reg_addr_array(S17_TIMER2),
         rd_data => rd_data_array(S17_TIMER2),
         wr_data => wr_data_array(S17_TIMER2)
      );
   -- slot 18: uart #2     
   uart2_slot18 : entity work.chu_uart
      generic map(FIFO_DEPTH_BIT => 6)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S18_UART2),
         read    => mem_rd_array(S18_UART2),
         write   => mem_wr_array(S18_UART2),
         addr    => reg_addr_array(S18_UART2),
         rd_data => rd_data_array(S18_UART2),
         wr_data => wr_data_array(S18_UART2),
         -- external signals
         tx      => tx2,
         rx      => rx2
      );
   -- slot 19: uart #3     
   uart3_slot19 : entity work.chu_uart
      generic map(FIFO_DEPTH_BIT => 6)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S19_UART3),
         read    => mem_rd_array(S19_UART3),
         write   => mem_wr_array(S19_UART3),
         addr    => reg_addr_array(S19_UART3),
         rd_data => rd_data_array(S19_UART3),
         wr_data => wr_data_array(S19_UART3),
         -- external signals
         tx      => tx3,
         rx      => rx3
      );
   -- slot 20 SPI #1
   spi_slot20 : entity work.chu_spi_core
      generic map(S => 4)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S20_SPI1),
         read        => mem_rd_array(S20_SPI1),
         write       => mem_wr_array(S20_SPI1),
         addr        => reg_addr_array(S20_SPI1),
         rd_data     => rd_data_array(S20_SPI1),
         wr_data     => wr_data_array(S20_SPI1),
         spi_sclk    => spi1_sclk,
         spi_mosi    => spi1_mosi,
         spi_miso    => spi1_miso,
         spi_ss_n    => spi1_ss
      );
   -- slot 21 SPI #2
   spi_slot21 : entity work.chu_spi_core
      generic map(S => 4)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S21_SPI2),
         read        => mem_rd_array(S21_SPI2),
         write       => mem_wr_array(S21_SPI2),
         addr        => reg_addr_array(S21_SPI2),
         rd_data     => rd_data_array(S21_SPI2),
         wr_data     => wr_data_array(S21_SPI2),
         spi_sclk    => spi2_sclk,
         spi_mosi    => spi2_mosi,
         spi_miso    => spi2_miso,
         spi_ss_n    => spi2_ss
      );
   -- slot 22: i2C #1   
   i2c_slot22 : entity work.chu_i2c_core
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S22_I2C1),
         read    => mem_rd_array(S22_I2C1),
         write   => mem_wr_array(S22_I2C1),
         addr    => reg_addr_array(S22_I2C1),
         rd_data => rd_data_array(S22_I2C1),
         wr_data => wr_data_array(S22_I2C1),
         scl     => i2c1_scl,
         sda     => i2c1_sda
      );
   -- slot 23: i2C #2   
   i2c_slot23 : entity work.chu_i2c_core
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S23_I2C2),
         read    => mem_rd_array(S23_I2C2),
         write   => mem_wr_array(S23_I2C2),
         addr    => reg_addr_array(S23_I2C2),
         rd_data => rd_data_array(S23_I2C2),
         wr_data => wr_data_array(S23_I2C2),
         scl     => i2c2_scl,
         sda     => i2c2_sda
      );
   -- slot 24: ddfs #1  
   ddfs_slot24 : entity work.chu_ddfs_core
      generic map(PW => 30)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S24_DDFS1),
         read        => mem_rd_array(S24_DDFS1),
         write       => mem_wr_array(S24_DDFS1),
         addr        => reg_addr_array(S24_DDFS1),
         rd_data     => rd_data_array(S24_DDFS1),
         wr_data     => wr_data_array(S24_DDFS1),
         -- external interface
         focw_ext    => (others => '0'),
         pha_ext     => (others => '0'),
         env_ext     => (others => '0'),
         pcm_out     => open,
         digital_out => ddfs1_sq_wave,
         pdm_out     => ddfs1_pdm
      );
   -- slot 25: ddfs #2  
   ddfs_slot25 : entity work.chu_ddfs_core
      generic map(PW => 30)
      port map(
         clk         => clk,
         reset       => reset,
         cs          => cs_array(S25_DDFS2),
         read        => mem_rd_array(S25_DDFS2),
         write       => mem_wr_array(S25_DDFS2),
         addr        => reg_addr_array(S25_DDFS2),
         rd_data     => rd_data_array(S25_DDFS2),
         wr_data     => wr_data_array(S25_DDFS2),
         -- external interface
         focw_ext    => (others => '0'),
         pha_ext     => (others => '0'),
         env_ext     => (others => '0'),
         pcm_out     => open,
         digital_out => ddfs2_sq_wave,
         pdm_out     => ddfs2_pdm
      );
   -- slot 26: pwm #1 (can also be used as gpo)
   pwm_slot26 : entity work.chu_io_pwm_core
      generic map(
         W => 8,
         R => 10)
      port map(
         clk     => clk,
         reset   => reset,
         cs      => cs_array(S26_PWM1),
         read    => mem_rd_array(S26_PWM1),
         write   => mem_wr_array(S26_PWM1),
         addr    => reg_addr_array(S26_PWM1),
         rd_data => rd_data_array(S26_PWM1),
         wr_data => wr_data_array(S26_PWM1),
         -- external interface
         pwm_out => pwm1
      );

   -- assign 0's to all unused slot rd_data signals 
   gen_unused_slot : for i in 27 to 63 generate
      rd_data_array(i) <= (others => '0');
   end generate gen_unused_slot;
end arch;

