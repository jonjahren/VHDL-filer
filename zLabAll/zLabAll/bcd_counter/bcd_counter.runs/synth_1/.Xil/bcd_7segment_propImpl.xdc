set_property SRC_FILE_INFO {cfile:C:/Users/jonja/Documents/Arty-A7-100-Master.xdc rfile:../../../../../../Arty-A7-100-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock_100Mhz }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clock_100Mhz }];
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { BCDin[0] }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { BCDin[1] }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { BCDin[2] }]; #IO_L13N_T2_MRCC_16 Sch=sw[2]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { BCDin[3] }]; #IO_L14P_T2_SRCC_16 Sch=sw[3]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { reset[0] }]; #IO_L6N_T0_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[0] }]; #IO_0_15 Sch=ja[1]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[1] }]; #IO_L4P_T0_15 Sch=ja[2]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[2] }]; #IO_L4N_T0_15 Sch=ja[3]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[3] }]; #IO_L6P_T0_15 Sch=ja[4]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[4] }]; #IO_L6N_T0_VREF_15 Sch=ja[7]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[5] }]; #IO_L10P_T1_AD11P_15 Sch=ja[8]
set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { Seven_Segment[6] }]; #IO_L10N_T1_AD11N_15 Sch=ja[9]