library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sync_one_port_ram is
   generic(
      ADDR_WIDTH : integer := 12;
      DATA_WIDTH : integer := 8
   );
   port(
      clk    : in  std_logic;
      we_a   : in  std_logic;
      addr_a : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      din_a  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      dout_a : out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end sync_one_port_ram;

architecture beh_arch of sync_one_port_ram is
   type ram_type is array (0 to 2**ADDR_WIDTH-1) of 
        std_logic_vector(DATA_WIDTH-1 downto 0);
   signal ram : ram_type;
begin
   process(clk)
   begin
      if (clk'event and clk = '1') then
         if (we_a = '1') then
            ram(to_integer(unsigned(addr_a))) <= din_a;
         end if;
         dout_a <= ram(to_integer(unsigned(addr_a)));
      end if;
   end process;
end beh_arch;