library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.chu_io_map.all;

entity chu_video_controller is
   port(
      -- FPro bus 
      video_cs            : in  std_logic;
      video_wr            : in  std_logic;
      video_addr          : in  std_logic_vector(20 downto 0);
      video_wr_data       : in  std_logic_vector(31 downto 0);
      -- MM frame buffer interface 
      frame_cs            : out std_logic;
      frame_wr            : out std_logic;
      frame_addr          : out std_logic_vector(19 downto 0);
      frame_wr_data       : out std_logic_vector(31 downto 0);
      -- MM video core interface
      slot_cs_array       : out std_logic_vector(7 downto 0);
      slot_mem_wr_array   : out std_logic_vector(7 downto 0);
      slot_reg_addr_array : out slot_2d_video_reg_type;
      slot_wr_data_array  : out slot_2d_video_data_type
   );
end chu_video_controller;

architecture arch of chu_video_controller is
   alias slot_addr : std_logic_vector(2 downto 0) is video_addr(16 downto 14);
   alias reg_addr  : std_logic_vector(13 downto 0) is video_addr(13 downto 0);
   signal slot_cs  : std_logic;

begin
   -- address decoding
   frame_cs <= '1' when video_cs = '1' and video_addr(20) = '1' else '0';
   slot_cs  <= '1' when video_cs = '1' and video_addr(20) = '0' else '0';
   process(slot_addr, slot_cs)
   begin
      slot_cs_array <= (others => '0');
      if slot_cs = '1' then
         slot_cs_array(to_integer(unsigned(slot_addr))) <= '1';
      end if;
   end process;
   -- to frame buffer
   frame_addr          <= video_addr(19 downto 0);
   frame_wr            <= video_wr;
   frame_wr_data       <= video_wr_data;
   -- to normal video cores 
   slot_mem_wr_array   <= (others => video_wr);
   slot_wr_data_array  <= (others => video_wr_data);
   slot_reg_addr_array <= (others => reg_addr);
end arch;

