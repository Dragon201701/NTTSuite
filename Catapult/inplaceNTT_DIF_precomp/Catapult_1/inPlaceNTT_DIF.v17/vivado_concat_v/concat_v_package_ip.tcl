# Environment variable settings
global env
set CATAPULT_HOME "/opt/mentorgraphics/Catapult_10.5c/Mgc_home"
## Set the variable for file path prefixing 
set RTL_TOOL_SCRIPT_DIR /home/yl7897/NTT_Xilinx/Catapult/inplaceNTT_DIF_precomp/Catapult_1/inPlaceNTT_DIF.v17/vivado_concat_v
set RTL_TOOL_SCRIPT_DIR [file dirname [file normalize [info script] ] ]
puts "-- RTL_TOOL_SCRIPT_DIR is set to '$RTL_TOOL_SCRIPT_DIR' "
# Vivado Non-Project mode script starts here
puts "==========================================="
puts "Catapult driving Vivado in Non-Project mode"
puts "==========================================="
set outputDir /home/yl7897/NTT_Xilinx/Catapult/inplaceNTT_DIF_precomp/Catapult_1/inPlaceNTT_DIF.v17/vivado_concat_v
set outputDir $RTL_TOOL_SCRIPT_DIR
create_project -force ip_tcl_concat_v
   read_verilog ../concat_rtl.v
# set up XPM libraries for XPM-related IP like the Catapult Xilinx_FIFO
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
read_xdc $outputDir/concat_rtl.v.xv.sdc
set_property part xcvu13p-flga2577-3-e [current_project]
