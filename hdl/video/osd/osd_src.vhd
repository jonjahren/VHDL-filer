library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity osd_src is
   generic(
      CD        : integer                       := 12;
      KEY_COLOR : std_logic_vector(11 downto 0) := (others => '0')
   );
   port(
      clk       : std_logic;
      x, y      : in  std_logic_vector(10 downto 0);
      -- tile ram write port 
      xt        : in  std_logic_vector(6 downto 0);
      yt        : in  std_logic_vector(4 downto 0);
      ch_in     : in  std_logic_vector(7 downto 0); -- char data
      we_ch     : in  std_logic;        -- char write enable
      -- forground/background color of char tile
      front_rgb : in  std_logic_vector(CD - 1 downto 0);
      back_rgb  : in  std_logic_vector(CD - 1 downto 0);
      -- stream 
      osd_rgb   : out std_logic_vector(CD - 1 downto 0)
   );
end osd_src;

architecture arch of osd_src is
   constant NULL_CHAR  : std_logic_vector(6 downto 0):= (others=>'0');
   -- font ROM
   signal char_addr    : std_logic_vector(6 downto 0);
   signal rom_addr     : std_logic_vector(10 downto 0);
   signal row_addr     : std_logic_vector(3 downto 0);
   signal bit_addr     : std_logic_vector(2 downto 0);
   signal font_word    : std_logic_vector(7 downto 0);
   -- char tile RAM
   signal addr_w       : std_logic_vector(11 downto 0);
   signal addr_r       : std_logic_vector(11 downto 0);
   signal ch_ram_out   : std_logic_vector(7 downto 0);
   signal ch_d1_reg    : std_logic_vector(7 downto 0);
   -- delay line 
   signal x_delay1_reg : std_logic_vector(2 downto 0);
   signal x_delay2_reg : std_logic_vector(2 downto 0);
   signal y_delay1_reg : std_logic_vector(3 downto 0);
   -- other signals
   signal font_bit     : std_logic;
   signal f_rgb        : std_logic_vector(CD - 1 downto 0);
   signal b_rgb        : std_logic_vector(CD - 1 downto 0);
   signal p_rgb        : std_logic_vector(CD - 1 downto 0);
   signal rev_bit      : std_logic;

begin
   -- *****************************************************************
   -- instantiation
   -- *****************************************************************
   -- instantiate font ROM
   font_unit : entity work.font_rom
      port map(clk => clk, addr => rom_addr, data => font_word);
   -- instantiate dual port tile RAM (2^12-by-8)
   text_ram_unit : entity work.sync_rw_port_ram
      generic map(ADDR_WIDTH => 12, DATA_WIDTH => 8)
      port map(
         clk    => clk,
         -- write from main system
         we   => we_ch,
         addr_w => addr_w,
         din  => ch_in,
         -- read to vga
         addr_r => addr_r,
         dout => ch_ram_out
      );
   -- tile RAM write
   addr_w <= yt & xt;
   
   -- *****************************************************************
   -- delay-line registers
   -- ***************************************************************** 
   process(clk)
   begin
      if (clk'event and clk = '1') then
         y_delay1_reg <= y(3 downto 0);
         x_delay1_reg <= x(2 downto 0);
         x_delay2_reg <= x_delay1_reg;
         ch_d1_reg    <= ch_ram_out;
      end if;
   end process;
   
   -- *****************************************************************
   -- pixel data read
   -- *****************************************************************
   -- tile RAM address
   addr_r    <= y(8 downto 4) & x(9 downto 3);
   char_addr <= ch_ram_out(6 downto 0); -- 7 LSBs (ascii code)
   -- font ROM
   row_addr  <= y_delay1_reg;           
   rom_addr  <= char_addr & row_addr;
   -- select a bit
   bit_addr  <= x_delay2_reg;   
   font_bit  <= font_word(to_integer(unsigned(not bit_addr)));
   
   -- *****************************************************************
   -- pixel color control
   -- ***************************************************************** 
   -- reverse color control
   rev_bit <= ch_d1_reg(7);
   f_rgb   <= front_rgb when rev_bit = '0' else back_rgb;
   b_rgb   <= back_rgb when rev_bit = '0' else front_rgb;
   -- palette circuit 
   p_rgb   <= f_rgb when font_bit = '1' else b_rgb;
   -- transparency control
   osd_rgb <= KEY_COLOR when ch_d1_reg(6 downto 0)=NULL_CHAR else p_rgb;
end arch;
