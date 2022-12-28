--======================================================================
-- Description: synchronization for VGA 
-- Design:
--   * generate horizontal sync and vertical sync of VGA
--   * an FSM sychronizes the beginning of scan with input frame data  
--======================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity vga_sync is
   generic(
      CD : integer := 12                -- color depth
   );
   port(
      clk, reset   : in  std_logic;
      -- stream interface
      vga_si_data  : in  std_logic_vector(CD downto 0); -- color+start
      vga_si_valid : in  std_logic;
      vga_si_ready : out std_logic;
      -- to vga monitor
      hsync        : out std_logic;
      vsync        : out std_logic;
      rgb          : out std_logic_vector(CD - 1 downto 0)
   );
end vga_sync;

architecture arch of vga_sync is
   -- vga 640-by-480 sync parameters
   constant HD : integer := 640; -- horizontal display area
   constant HF : integer := 16; -- h. front porch
   constant HB : integer := 48; -- h. back porch
   constant HR : integer := 96; -- h. retrace
   constant HT : integer := HD + HF + HB + HR; -- horizontal total (800)
   constant VD : integer := 480; -- vertical display area
   constant VF : integer := 10; -- v. front porch
   constant VB : integer := 33; -- v. back porch
   constant VR : integer := 2; -- v. retrace
   constant VT : integer := VD + VF + VB + VR; -- vertical total (525)
   -- stream input
   alias vga_st_in_start : std_logic is vga_si_data(0);
   alias vga_st_in_color : std_logic_vector(CD - 1 downto 0) is 
         vga_si_data(CD downto 1);
   -- sync counetr and signals
   signal x, y           : unsigned(10 downto 0);
   signal hc, vc         : std_logic_vector(10 downto 0);
   signal scan_end       : std_logic;
   signal hsync_i        : std_logic;
   signal vsync_i        : std_logic;
   signal video_on_i     : std_logic;
   -- fsm 
   type state_type is (frame_sync, disp);
   signal state_reg, state_next : state_type;
begin
   --******************************************************************
   -- instantiate frame counter
   --******************************************************************
   counter_unit : entity work.frame_counter
      generic map(
         HMAX => HT,
         VMAX => VT
      )
      port map(
         clk         => clk,
         reset       => reset,
         sync_clr    => '0',
         hcount      => hc,
         vcount      => vc,
         inc         => '1',
         frame_start => open,
         frame_end   => scan_end
      );
   x <= unsigned(hc);
   y <= unsigned(vc);
   --******************************************************************
   -- horizontal and vertical sync 
   --******************************************************************
   hsync_i <= '0' when (x >= (HD+HF)) and (x <= (HD+HF+HR-1)) else '1';
   vsync_i <= '0' when (y >= (VD+VF)) and (y <= (VD+VF+VR-1)) else '1';
   video_on_i <= '1' when (x < HD) and (y < VD) else '0';

   --******************************************************************
   -- buffered output to vga monitor
   --******************************************************************
   process(clk)
   begin
      if (clk'event and clk = '1') then
         vsync <= vsync_i;
         hsync <= hsync_i;
         if (video_on_i = '1') then
            rgb <= vga_st_in_color;
         else
            rgb <= (others => '0');     -- black when display off 
         end if;
      end if;
   end process;
   --******************************************************************
   -- FSM to synchronize data for each frame 
   --******************************************************************
   -- state register
   process(clk, reset)
   begin
      if (reset = '1') then
         state_reg <= frame_sync;
      elsif (clk'event and clk = '1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state/output logic
   process(state_reg, x, y, vga_st_in_start, video_on_i, scan_end)
   begin
      state_next   <= state_reg;
      vga_si_ready <= '0';
      case state_reg is
         when frame_sync =>
            -- wait for end of current scan (end of v/h retrace)
            if scan_end = '1' then
               if vga_st_in_start = '1' then
                  state_next <= disp;
               else
                  state_next <= frame_sync;
               end if;
            end if;
            -- flush out partial frame fragment 
            -- (due to corruption or incorrectly formed long packet)  
            if vga_st_in_start = '0' then
               vga_si_ready <= '1';
            end if;
         when disp =>
            -- resync when reaching end of the displayable data  
            if ((x = HD - 1) and (y = VD - 1)) then
               state_next <= frame_sync;
            end if;
            if video_on_i = '1' then
               vga_si_ready <= '1';
            end if;
      end case;
   end process;
end arch;
