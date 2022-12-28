--===
-- VGA frame buffer 
--     - 640*480 = 307,200 = 0x4b000 
--     - 19-bit address
--     - infer 512K simple RAM with 200K wasted   
--     - better alternative: use 2 ram modules (256K+64K = 320K)       
--     - required memory = 320K * color depth
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity vga_ram is
   generic(
      DW : integer := 9
   );
   port(
      clk    : in  std_logic;
      we     : in  std_logic;
      addr_w : in  std_logic_vector(18 downto 0);
      data_w : in  std_logic_vector(DW - 1 downto 0);
      addr_r : in  std_logic_vector(18 downto 0);
      data_r : out std_logic_vector(DW - 1 downto 0)
   );
end vga_ram;

architecture arch of vga_ram is
   signal data_r_256k : std_logic_vector(DW - 1 downto 0);
   signal data_r_64k  : std_logic_vector(DW - 1 downto 0);
   signal we_256k     : std_logic;
   signal we_64k      : std_logic;
begin
   -- instantiate 256K RAM
   ram_256k_unit : entity work.sync_rw_port_ram(beh_arch)
      generic map(
         DATA_WIDTH => DW,
         ADDR_WIDTH => 18)
      port map(
         clk    => clk,
         we     => we_256k,
         addr_w => addr_w(17 downto 0),
         din    => data_w,
         addr_r => addr_r(17 downto 0),
         dout   => data_r_256k
      );
   -- instantiate 64K RAM
   ram_64k_unit : entity work.sync_rw_port_ram(beh_arch)
      generic map(
         DATA_WIDTH => DW,
         ADDR_WIDTH => 16)
      port map(
         clk    => clk,
         we     => we_64k,
         addr_w => addr_w(15 downto 0),
         din    => data_w,
         addr_r => addr_r(15 downto 0),
         dout   => data_r_64k
      );
   -- read data multiplexing
   data_r  <= data_r_64k when addr_r(18) = '1' else data_r_256k;
   -- write decoding
   we_256k <= we and (not addr_w(18));
   we_64k  <= we and addr_w(18);
end arch;