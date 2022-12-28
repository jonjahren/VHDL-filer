
--======================================================================
-- Description: wrapper for Xilinx Artix-7 dual-clock BRAM FIFO  buffer 
-- Xilinx info:
--   * FIFO_DUALCLOCK_MACRO
--   * cut/paste from Xilinx HDL Language Template, version 2014.3
-- Design:
--   * to be used in line buffer
--   * use FWFT (first-word-fall-through mode):
--     read data "showing ahead" (read signal acts as acknowledge 
--     to remove the data from the head of fifo) 
--   * use a 18Kb BRAM
--   * 1024 words
--   * 10-18 bits in a word 
-- Note:
--   * The BRAM FIFO is a hard macro and uses no external logic cells
--   * Constraints on FIFO size/depth 
--   * Dummy rdcount/wrcount signals (instead of "open") needed because of 
--     the formal signals are defined as unconstrainted signals 
--   * Use the exact case in generic values 
--   * BRAM FIFO reset signal must connected to a phsyical signal (i.e., not 0)
--     or a DRC error issued when genertaing bit stream 
--======================================================================
-----------------------------------------------------------------
-- DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width --
-- ===========|===========|============|=======================--
--   37-72    |  "36Kb"   |     512    |         9-bit         --
--   19-36    |  "36Kb"   |    1024    |        10-bit         --
--   19-36    |  "18Kb"   |     512    |         9-bit         --
--   10-18    |  "36Kb"   |    2048    |        11-bit         --
--   10-18    |  "18Kb"   |    1024    |        10-bit         --
--    5-9     |  "36Kb"   |    4096    |        12-bit         --
--    5-9     |  "18Kb"   |    2048    |        11-bit         --
--    1-4     |  "36Kb"   |    8192    |        13-bit         --
--    1-4     |  "18Kb"   |    4096    |        12-bit         --
-----------------------------------------------------------------

--======================================================================

library ieee;
use ieee.std_logic_1164.all;

-- Xilinx macro libraries
library unisim;
use unisim.vcomponents.all;
library unimacro;
use unimacro.vcomponents.all;

entity bram_fifo_fpro is
   generic(
      DW : integer := 14  -- # data width (bits per word; 10-18) 
   );
   port(
      reset        : in  std_logic;
      -- read port 
      clk_rd       : in  std_logic;     -- read clock
      empty        : out std_logic;     -- read port empty 
      almost_empty : out std_logic;     -- read port almost empty 
      rd_ack       : in  std_logic;     -- read acknowledge
      rd_data      : out std_logic_vector(DW - 1 downto 0); -- read data
      -- write port
      clk_wr       : in  std_logic;     -- write clock
      full         : out std_logic;     -- write port full 
      almost_full  : out std_logic;     -- write port almost full 
      wr_en        : in  std_logic;     -- write enable 
      wr_data      : in  std_logic_vector(DW - 1 downto 0); -- write data
      -- occupancy of fifo
      rdcount      : out std_logic_vector(9 downto 0); -- read count
      wrcount      : out std_logic_vector(9 downto 0)  -- write count
   );
end bram_fifo_fpro;

architecture wrapper_arch of bram_fifo_fpro is
--signal rdcount, wrcount: std_logic_vector(9 downto 0);
begin
   -- instantiate macro
   bram_fifo_unit : FIFO_DUALCLOCK_MACRO
      generic map(
         device                  => "7SERIES", -- target device: "7SERIES" 
         almost_full_offset      => x"0080",   -- almost full threshold
         almost_empty_offset     => x"0080",   -- almost empty threshold
         data_width              => DW,         
         fifo_size               => "18Kb",    -- BRAM: "18Kb" or "36Kb" 
         first_word_fall_through => true        
      )
      port map(
         rst         => reset, 
         -- read port      
         rdclk       => clk_rd,       -- read clock
         do          => rd_data,      -- read data out  
         rden        => rd_ack,       -- remove word from head
         empty       => empty,        -- fifo empty  
         almostempty => almost_empty,  
         rdcount     => rdcount,       
         rderr       => open,         -- read error
         -- write port
         wrclk       => clk_wr,       -- write clock
         di          => wr_data,      -- write data in
         wren        => wr_en,        -- write enable
         full        => full,         -- fifo full 
         almostfull  => almost_full,   
         wrcount     => wrcount,   
         wrerr       => open          -- write error
      );
end wrapper_arch;