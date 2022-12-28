library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg_file_2_read_port is
   generic(
      ADDR_WIDTH : integer := 2;
      DATA_WIDTH : integer := 8
   );
   port(
      clk     : in std_logic;
      wr_en   : in std_logic;
      w_addr  : in std_logic_vector (ADDR_WIDTH-1 downto 0);
      r_addr1 : in std_logic_vector (ADDR_WIDTH-1 downto 0);
      r_addr2 : in std_logic_vector (ADDR_WIDTH-1 downto 0);
      w_data  : in std_logic_vector (DATA_WIDTH-1 downto 0);
      r_data1 : out std_logic_vector (DATA_WIDTH-1 downto 0)
      r_data2 : out std_logic_vector (DATA_WIDTH-1 downto 0)
   );
end reg_file_2_read_port ;

architecture arch of reg_file_2_read_port is
   type mem_2d_type is array (0 to 2**ADDR_WIDTH-1) of
        std_logic_vector(DATA_WIDTH-1 downto 0);
   signal array_reg: mem_2d_type;
begin
   process(clk)
   begin
      if (clk'event and clk='1') then
         if wr_en='1' then
            array_reg(to_integer(unsigned(w_addr))) <= w_data;
         end if;
      end if;
   end process;
   -- read port 1
   r_data1 <= array_reg(to_integer(unsigned(r_addr1)));
   -- read port 2
   r_data2 <= array_reg(to_integer(unsigned(r_addr2)));
end arch;