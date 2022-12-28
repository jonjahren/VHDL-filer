library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sync_rw_port_ram is
   generic(
      ADDR_WIDTH : integer := 10;
      DATA_WIDTH : integer := 12
   );
   port(
      clk    : in std_logic;
      we     : in std_logic;
      addr_w : in std_logic_vector(ADDR_WIDTH-1 downto 0);
      addr_r : in std_logic_vector(ADDR_WIDTH-1 downto 0);
      din    : in std_logic_vector(DATA_WIDTH-1 downto 0);
      dout   : out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end sync_rw_port_ram;

architecture beh_arch of sync_rw_port_ram is
   type ram_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector (DATA_WIDTH-1 downto 0);
   signal ram: ram_type;
begin
   process(clk)
   begin
     if (clk'event and clk = '1') then
        if (we = '1') then
           ram(to_integer(unsigned(addr_w))) <= din;
        end if;
        dout <= ram(to_integer(unsigned(addr_r)));
     end if;
   end process;
end beh_arch;
