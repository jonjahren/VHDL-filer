library ieee;
use ieee.std_logic_1164.all;
entity chu_vga_sync_core is
   generic(CD : integer := 12);
   port(
      clk_sys  : in  std_logic;
      clk_25M  : in  std_logic;
      reset    : in  std_logic;
      -- MM interface
      cs       : in  std_logic;
      write    : in  std_logic;
      addr     : in  std_logic_vector(13 downto 0);
      wr_data  : in  std_logic_vector(31 downto 0);
      -- 
      si_data  : in  std_logic_vector(CD downto 0);
      si_valid : in  std_logic;
      si_ready : out std_logic;
      -- to vga monitor  
      hsync    : out std_logic;
      vsync    : out std_logic;
      rgb      : out std_logic_vector(CD - 1 downto 0)
   );
end chu_vga_sync_core;

architecture str_arch of chu_vga_sync_core is
   signal line_so_data  : std_logic_vector(CD downto 0);
   signal line_so_valid : std_logic;
   signal vga_si_ready  : std_logic;
begin
   -- instantiate line buffer
   line_unit : entity work.line_buffer
      generic map(CD => CD)
      port map(
         reset          => reset,
         clk_stream_in  => clk_sys,
         clk_stream_out => clk_25M,
         si_data        => si_data,
         si_valid       => si_valid,
         si_ready       => si_ready,
         so_data        => line_so_data,
         so_valid       => line_so_valid,
         so_reday       => vga_si_ready
      );
   -- instantiate vga controller   
   vga_unit : entity work.vga_sync
      generic map(CD => CD)
      port map(
         clk          => clk_25M,
         reset        => reset,
         vga_si_data  => line_so_data,
         vga_si_valid => line_so_valid,
         vga_si_ready => vga_si_ready,
         hsync        => hsync,
         vsync        => vsync,
         rgb          => rgb
      );
end str_arch;