--======================================================================
-- Description: line buffer for pixel data stream
-- Design:
--   * to accomodate xilinx bram fifo buffer, the size is fixed at 1024
--   * use almost_full rather than full to provide some cushion in 
--     processing pipeline (e.g., some pixels may be partially processed)
-- Note:
--   * the size of buffer is about a horizontal line to take advantage of
--     extra cusshion time in horizontal sync retrace interval
--======================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity line_buffer is
   generic(
      CD : integer := 12                -- color depth
   );
   port(
      reset          : in  std_logic;
      clk_stream_in  : in  std_logic;
      clk_stream_out : in  std_logic;
      -- stream in (sink)
      si_data        : in  std_logic_vector(CD downto 0);
      si_valid       : in  std_logic;
      si_ready       : out std_logic;
      -- stream out (source)
      so_data        : out std_logic_vector(CD downto 0);
      so_valid       : out std_logic;
      so_reday       : in  std_logic
   );
end line_buffer;

architecture str_arch of line_buffer is
   constant DW        : integer := CD + 1; -- colors+start 
   signal almost_full : std_logic;
   signal empty       : std_logic;
   signal fifo_wr_en  : std_logic;
   signal fifo_rd_ack : std_logic;
   signal rdcount     : std_logic_vector(9 downto 0);
   signal wrcount     : std_logic_vector(9 downto 0);
begin
   -- instantiate dual-clock fifo
   fifo_unit : entity work.bram_fifo_fpro
      generic map(DW => DW)
      port map(
         reset        => reset,
         -- read port 
         clk_rd       => clk_stream_out,
         rd_data      => so_data,
         rd_ack       => fifo_rd_ack,  --so_reday,
         empty        => empty,
         almost_empty => open,
         rdcount      => rdcount,
         -- write port
         clk_wr       => clk_stream_in,
         wr_data      => si_data,
         wr_en        => fifo_wr_en,
         full         => open,
         almost_full  => almost_full,
         wrcount      => wrcount
      );
   -- stream interface signals   
   fifo_wr_en <= si_valid;
   si_ready   <= not almost_full;
   so_valid   <= not empty;
   fifo_rd_ack <= so_reday;
end str_arch;

