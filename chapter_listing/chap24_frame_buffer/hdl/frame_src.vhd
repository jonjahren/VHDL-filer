library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity frame_src is
   generic(
      CD : integer := 12;               -- color depth
      DW : integer := 9                 -- video RAM data width
   );
   port(
      clk         : std_logic;
      -- frame counter coordinate
      x, y        : in  std_logic_vector(10 downto 0);
      -- write interface
      addr_pix    : in  std_logic_vector(18 downto 0);
      wr_data_pix : in  std_logic_vector(DW - 1 downto 0);
      write_pix   : in  std_logic;
      -- stream 
      frame_rgb   : out std_logic_vector(CD - 1 downto 0)
   );
end frame_src;

architecture arch of frame_src is
   signal ram_rd_out_data : std_logic_vector(DW - 1 downto 0);
   signal converted_color : std_logic_vector(CD - 1 downto 0);
   signal y_offset        : unsigned(18 downto 0);
   signal r_addr          : std_logic_vector(18 downto 0);
begin
   -- instantiate video ram
   vram_unit : entity work.vga_ram
      generic map(DW => DW)
      port map(
         clk    => clk,
         -- write port (to processor) 
         we     => write_pix,
         addr_w => addr_pix(18 downto 0),
         data_w => wr_data_pix(DW - 1 downto 0),
         -- read port (to read pipe)
         addr_r => r_addr,
         data_r => ram_rd_out_data
      );
   -- instantiate palette circuit   
   pallete_unit : entity work.frame_palette_9
      port map(
         color_in  => ram_rd_out_data,
         color_out => converted_color);
   -- read address = 640*y + x = 512*y + 128*y + x
   y_offset <= unsigned('0' & y(8 downto 0) & "000000000") + 
               unsigned("000" & y(8 downto 0) & "0000000");
   r_addr   <= std_logic_vector(y_offset + unsigned(x));
   -- 1 clock delay line
   process(clk)
   begin
      if (clk'event and clk = '1') then
         frame_rgb <= converted_color;
      end if;
   end process;
end arch;
