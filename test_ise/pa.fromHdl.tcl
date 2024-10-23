
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name test_ise -dir "/home/ise/BT_ISE_XILINX/test_ise/planAhead_run_1" -part xc3s500epq208-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "test_buoi1.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {test_buoi1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top test_buoi1 $srcset
add_files [list {test_buoi1.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500epq208-5
