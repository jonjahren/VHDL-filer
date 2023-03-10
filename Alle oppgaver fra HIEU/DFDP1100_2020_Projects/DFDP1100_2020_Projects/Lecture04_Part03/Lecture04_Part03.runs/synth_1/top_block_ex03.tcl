# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.cache/wt [current_project]
set_property parent.project_path C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.srcs/sources_1/imports/new/hex_to_seg.vhd
  C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.srcs/sources_1/new/two_to_one_mux.vhd
  C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.srcs/sources_1/new/top_block_ex03.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.srcs/constrs_1/new/top_block_ex03_xdc.xdc
set_property used_in_implementation false [get_files C:/Users/hn/Desktop/DFDP1100_2020_Projects/Lecture04_Part03/Lecture04_Part03.srcs/constrs_1/new/top_block_ex03_xdc.xdc]


synth_design -top top_block_ex03 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef top_block_ex03.dcp

catch { report_utilization -file top_block_ex03_utilization_synth.rpt -pb top_block_ex03_utilization_synth.pb }
