library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sync_rom_template is
   port(
      clk    : in std_logic;
      addr_r : in std_logic_vector(3 downto 0);
      data   : out std_logic_vector(6 downto 0)
   );
end sync_rom_template;

architecture arch of sync_rom_template is
   constant ADDR_WIDTH : integer:=4;
   constant DATA_WIDTH : integer:=7;
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant HEX2LED_LOOK_UP_TABLE: rom_type:=(  -- 2^4-by-7
      "1000000", -- addr 00
      "1111001", -- addr 01
      "0100100", -- addr 02
      "0110000", -- addr 03
      "0011001", -- addr 04
      "0010010", -- addr 05
      "0000010", -- addr 06
      "1111000", -- addr 07
      "0000000", -- addr 08
      "0010000", -- addr 09
      "0001000", -- addr 10
      "0000011", -- addr 11
      "1000110", -- addr 12
      "0100001", -- addr 13
      "0000110", -- addr 14
      "0001110"  -- addr 15
   );
   signal rom: rom_type := HEX2LED_LOOK_UP_TABLE;
begin
   process(clk)
   begin
     if (clk'event and clk = '1') then
        data <= rom(to_integer(unsigned(addr_r)));
     end if;
   end process;
end arch;