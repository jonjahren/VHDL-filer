library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity chu_frame_buffer_core is
   generic(
      CD : integer := 12;               -- color depth
      DW : integer := 9                 -- frame buffer RAM data width
   );
   port(
      clk     : in  std_logic;
      reset   : in  std_logic;
      x       : in  std_logic_vector(10 downto 0);
      y       : in  std_logic_vector(10 downto 0);
      -- video interface
      cs      : in  std_logic;
      write   : in  std_logic;
      addr    : in  std_logic_vector(19 downto 0);
      wr_data : in  std_logic_vector(31 downto 0);
      -- stream interface
      si_rgb  : in  std_logic_vector(CD - 1 downto 0);
      so_rgb  : out std_logic_vector(CD - 1 downto 0)
   );
end chu_frame_buffer_core;

architecture arch of chu_frame_buffer_core is
   signal wr_pix     : std_logic;
   signal wr_en      : std_logic;
   signal wr_bypass  : std_logic;
   signal bypass_reg : std_logic;
   signal frame_rgb  : std_logic_vector(CD - 1 downto 0);
begin
   -- instantiate pixel generation circuit
   frame_gen_unit : entity work.frame_src
      generic map(
         CD => CD,
         DW => DW
      )
      port map(
         clk         => clk,
         x           => x,
         y           => y,
         addr_pix    => addr(18 downto 0),
         wr_data_pix => wr_data(DW - 1 downto 0),
         write_pix   => wr_pix,
         frame_rgb   => frame_rgb
      );
   -- register  
   process(clk, reset)
   begin
      if reset = '1' then
         bypass_reg <= '0';
      elsif (clk'event and clk = '1') then
         if wr_bypass = '1' then
            bypass_reg <= wr_data(0);
         end if;
      end if;
   end process;
   -- decoding logic
   wr_en     <= '1' when write = '1' and cs = '1' else '0';
   wr_bypass <= '1' when addr = x"fffff" and wr_en = '1' else '0';
   wr_pix    <= '1' when addr /= x"fffff" and wr_en = '1' else '0';
   -- stream blending: mux
   so_rgb    <= si_rgb when bypass_reg = '1' else frame_rgb;
end arch;
