library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_unsigned.all;



entity bnd_scan is

    port (TDI_P, TMS_P, TCK_P : in STD_LOGIC;

          LOAD_P, CE_P, CLOCK_P, RESET_P: in

          STD_LOGIC;

          DATA_P: in STD_LOGIC_VECTOR(3 downto 0);

          TDO_P: out STD_LOGIC;

          COUT_P: out STD_LOGIC_VECTOR(3 downto 0));

end bnd_scan;



architecture XILINX of bnd_scan is



    component BSCAN 

        port (TDI, TMS, TCK out STD_LOGIC;

              TDO: in STD_LOGIC);

    end component;



    component TDI

        port (I: out STD_LOGIC);

    end component;



    component TMS

        port (I: out STD_LOGIC);

    end component;

   

    component TCK

        port (I: out STD_LOGIC);

    end component;



    component TDO

        port (O: out STD_LOGIC);

    end component;



    component count4

        port (LOAD, CE, CLOCK, RST: in STD_LOGIC;

              DATA: in STD_LOGIC_VECTOR (3 downto 0);

              COUT: out STD_LOGIC_VECTOR (3 downto 0));

    end component;



    -- Defining signals to connect BSCAN to Pins --

    signal TCK_NET  : STD_LOGIC;

    signal TDI_NET  : STD_LOGIC;

    signal TMS_NET  : STD_LOGIC;

    signal TDO_NET  : STD_LOGIC;



begin



    U1: BSCAN port map (TDO => TDO_NET,

                        TDI => TDI_NET, 

                        TMS => TMS_NET, 

                        TCK => TCK_NET);



    U2: TDI port map (I =>TDI_NET);



    U3: TCK port map (I =>TCK_NET);



    U4: TMS port map (I =>TMS_NET);



    U5: TDO port map (O =>TDO_NET);



    U6: count4 port map (LOAD  => LOAD_P, 

                         CE    => CE_P, 

                         CLOCK => CLOCK_P, 

                         RST   => RESET_P,

                         DATA  => DATA_P, 

                         COUT  => COUT_P);



end XILINX;