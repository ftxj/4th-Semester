# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Document/vivado各次试验/project_3/project_3.cache/wt [current_project]
set_property parent.project_path C:/Document/vivado各次试验/project_3/project_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Document/vivado各次试验/project_3/project_3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.1
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.2
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.4
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.5.1
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.5.2
  C:/Document/vivado各次试验/project_3/project_3.srcs/sources_1/new/lab3.6
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Document/vivado各次试验/project_3/project_3.srcs/constrs_1/imports/VivadoProject/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files C:/Document/vivado各次试验/project_3/project_3.srcs/constrs_1/imports/VivadoProject/Nexys4DDR_Master.xdc]


synth_design -top top3_6 -part xc7a100tcsg324-1


write_checkpoint -force -noxdef top3_6.dcp

catch { report_utilization -file top3_6_utilization_synth.rpt -pb top3_6_utilization_synth.pb }
