# Environment variable settings
global env
set CATAPULT_HOME "/opt/mentorgraphics/Catapult_10.5c/Mgc_home"
## Set the variable for file path prefixing 
set RTL_TOOL_SCRIPT_DIR /home/yl7897/fhe_accelerator/ntt/inplaceNTT_DIT/Catapult/inPlaceNTT_DIT.v17/vivado_concat_vhdl
set RTL_TOOL_SCRIPT_DIR [file dirname [file normalize [info script] ] ]
puts "-- RTL_TOOL_SCRIPT_DIR is set to '$RTL_TOOL_SCRIPT_DIR' "
# Vivado Non-Project mode script starts here
puts "==========================================="
puts "Catapult driving Vivado in Non-Project mode"
puts "==========================================="
set outputDir /home/yl7897/fhe_accelerator/ntt/inplaceNTT_DIT/Catapult/inPlaceNTT_DIT.v17/vivado_concat_vhdl
set outputDir $RTL_TOOL_SCRIPT_DIR
create_project -force ip_tcl_concat_vhdl
   read_vhdl -library work ../concat_rtl.vhdl
# set up XPM libraries for XPM-related IP like the Catapult Xilinx_FIFO
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
read_xdc $outputDir/concat_rtl.vhdl.xv.sdc
set_property part xc7vx690tffg1761-2 [current_project]
