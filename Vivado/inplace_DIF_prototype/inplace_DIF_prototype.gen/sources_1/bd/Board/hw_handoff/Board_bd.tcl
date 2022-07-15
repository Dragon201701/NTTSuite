
################################################################
# This is a generated script based on design: Board
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2021.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source Board_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axi_lit, inPlaceNTT_DIF_precomp

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku115-flvb2104-2-e
   set_property BOARD_PART xilinx.com:kcu1500:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name Board

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set CLK_IN_D [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN_D ]

  set pcie_7x_mgt [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_7x_mgt ]


  # Create ports
  set refclk [ create_bd_port -dir I -type clk -freq_hz 100000000 refclk ]
  set sys_rst_n [ create_bd_port -dir I -type rst sys_rst_n ]

  # Create instance: axi_bram_ctrl_vec_0, and set properties
  set axi_bram_ctrl_vec_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_0

  # Create instance: axi_bram_ctrl_vec_1, and set properties
  set axi_bram_ctrl_vec_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_1 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_1

  # Create instance: axi_bram_ctrl_vec_2, and set properties
  set axi_bram_ctrl_vec_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_2 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_2

  # Create instance: axi_bram_ctrl_vec_3, and set properties
  set axi_bram_ctrl_vec_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_3 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_3

  # Create instance: axi_bram_ctrl_vec_4, and set properties
  set axi_bram_ctrl_vec_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_4 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_4

  # Create instance: axi_bram_ctrl_vec_5, and set properties
  set axi_bram_ctrl_vec_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_5 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_5

  # Create instance: axi_bram_ctrl_vec_6, and set properties
  set axi_bram_ctrl_vec_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_6 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_6

  # Create instance: axi_bram_ctrl_vec_7, and set properties
  set axi_bram_ctrl_vec_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_vec_7 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_vec_7

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {9} \
 ] $axi_interconnect_0

  # Create instance: axi_lit_0, and set properties
  set block_name axi_lit
  set block_cell_name axi_lit_0
  if { [catch {set axi_lit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axi_lit_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_pcie3_0, and set properties
  set axi_pcie3_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_pcie3:3.0 axi_pcie3_0 ]

  # Create instance: blk_mem_gen_twiddle_0, and set properties
  set blk_mem_gen_twiddle_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_0

  # Create instance: blk_mem_gen_twiddle_1, and set properties
  set blk_mem_gen_twiddle_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_1 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_1

  # Create instance: blk_mem_gen_twiddle_2, and set properties
  set blk_mem_gen_twiddle_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_2 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_2

  # Create instance: blk_mem_gen_twiddle_3, and set properties
  set blk_mem_gen_twiddle_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_3 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_3

  # Create instance: blk_mem_gen_twiddle_h_1, and set properties
  set blk_mem_gen_twiddle_h_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_h_1 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_h_1

  # Create instance: blk_mem_gen_twiddle_h_2, and set properties
  set blk_mem_gen_twiddle_h_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_h_2 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_h_2

  # Create instance: blk_mem_gen_twiddle_h_3, and set properties
  set blk_mem_gen_twiddle_h_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_h_3 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_h_3

  # Create instance: blk_mem_gen_twiddle_h_4, and set properties
  set blk_mem_gen_twiddle_h_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_h_4 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_twiddle_h_4

  # Create instance: blk_mem_gen_vec_0, and set properties
  set blk_mem_gen_vec_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_0

  # Create instance: blk_mem_gen_vec_1, and set properties
  set blk_mem_gen_vec_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_1 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_1

  # Create instance: blk_mem_gen_vec_2, and set properties
  set blk_mem_gen_vec_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_2 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_2

  # Create instance: blk_mem_gen_vec_3, and set properties
  set blk_mem_gen_vec_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_3 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_3

  # Create instance: blk_mem_gen_vec_4, and set properties
  set blk_mem_gen_vec_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_4 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_4

  # Create instance: blk_mem_gen_vec_5, and set properties
  set blk_mem_gen_vec_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_5 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_5

  # Create instance: blk_mem_gen_vec_6, and set properties
  set blk_mem_gen_vec_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_6 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_6

  # Create instance: blk_mem_gen_vec_7, and set properties
  set blk_mem_gen_vec_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec_7 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_vec_7

  # Create instance: inPlaceNTT_DIF_preco_0, and set properties
  set block_name inPlaceNTT_DIF_precomp
  set block_cell_name inPlaceNTT_DIF_preco_0
  if { [catch {set inPlaceNTT_DIF_preco_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $inPlaceNTT_DIF_preco_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_1 [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_1_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_1/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_2_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_2/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_2/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_3_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_3/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_3/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_4_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_4/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_4/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_5_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_5/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_5/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_6_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_6/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_6/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_vec_7_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_vec_7/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_vec_7/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_bram_ctrl_vec_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_bram_ctrl_vec_1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_bram_ctrl_vec_2/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_bram_ctrl_vec_3/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_bram_ctrl_vec_4/S_AXI] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins axi_bram_ctrl_vec_5/S_AXI] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_bram_ctrl_vec_6/S_AXI] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins axi_bram_ctrl_vec_7/S_AXI] [get_bd_intf_pins axi_interconnect_0/M07_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M08_AXI [get_bd_intf_pins axi_interconnect_0/M08_AXI] [get_bd_intf_pins axi_lit_0/interface_aximm]
  connect_bd_intf_net -intf_net axi_pcie3_0_M_AXI [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins axi_pcie3_0/M_AXI]
  connect_bd_intf_net -intf_net axi_pcie3_0_pcie_7x_mgt [get_bd_intf_ports pcie_7x_mgt] [get_bd_intf_pins axi_pcie3_0/pcie_7x_mgt]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins axi_bram_ctrl_vec_0/bram_clk_a] [get_bd_pins blk_mem_gen_vec_0/clka] [get_bd_pins blk_mem_gen_vec_0/clkb]
  connect_bd_net -net Net1 [get_bd_pins axi_bram_ctrl_vec_1/bram_clk_a] [get_bd_pins blk_mem_gen_vec_1/clka] [get_bd_pins blk_mem_gen_vec_1/clkb]
  connect_bd_net -net Net2 [get_bd_pins axi_bram_ctrl_vec_3/bram_clk_a] [get_bd_pins blk_mem_gen_vec_3/clka] [get_bd_pins blk_mem_gen_vec_3/clkb]
  connect_bd_net -net Net3 [get_bd_pins axi_bram_ctrl_vec_5/bram_clk_a] [get_bd_pins blk_mem_gen_vec_5/clka] [get_bd_pins blk_mem_gen_vec_5/clkb]
  connect_bd_net -net Net4 [get_bd_pins axi_bram_ctrl_vec_6/bram_clk_a] [get_bd_pins blk_mem_gen_vec_6/clka] [get_bd_pins blk_mem_gen_vec_6/clkb]
  connect_bd_net -net axi_bram_ctrl_vec_2_bram_addr_a [get_bd_pins axi_bram_ctrl_vec_2/bram_addr_a] [get_bd_pins blk_mem_gen_vec_2/clka] [get_bd_pins blk_mem_gen_vec_2/clkb]
  connect_bd_net -net axi_bram_ctrl_vec_4_bram_clk_a [get_bd_pins axi_bram_ctrl_vec_4/bram_clk_a] [get_bd_pins blk_mem_gen_vec_4/clka] [get_bd_pins blk_mem_gen_vec_4/clkb]
  connect_bd_net -net axi_bram_ctrl_vec_7_bram_clk_a [get_bd_pins axi_bram_ctrl_vec_7/bram_clk_a] [get_bd_pins blk_mem_gen_vec_7/clka] [get_bd_pins blk_mem_gen_vec_7/clkb]
  connect_bd_net -net axi_lit_0_ac_sync_complete_rsc_vzout [get_bd_pins axi_lit_0/ac_sync_complete_rsc_vzout] [get_bd_pins inPlaceNTT_DIF_preco_0/complete_rsc_vzout]
  connect_bd_net -net axi_lit_0_ac_sync_run [get_bd_pins axi_lit_0/ac_sync_run] [get_bd_pins inPlaceNTT_DIF_preco_0/run_rsc_vzin]
  connect_bd_net -net axi_lit_0_p_rsc_dat [get_bd_pins axi_lit_0/p_rsc_dat] [get_bd_pins inPlaceNTT_DIF_preco_0/p_rsc_dat]
  connect_bd_net -net axi_lit_0_r_rsc_dat [get_bd_pins axi_lit_0/r_rsc_dat] [get_bd_pins inPlaceNTT_DIF_preco_0/r_rsc_dat]
  connect_bd_net -net axi_pcie3_0_axi_aclk [get_bd_pins axi_bram_ctrl_vec_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_1/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_2/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_3/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_4/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_5/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_6/s_axi_aclk] [get_bd_pins axi_bram_ctrl_vec_7/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_lit_0/ACLK] [get_bd_pins axi_pcie3_0/axi_aclk] [get_bd_pins blk_mem_gen_twiddle_0/clka] [get_bd_pins blk_mem_gen_twiddle_0/clkb] [get_bd_pins blk_mem_gen_twiddle_1/clka] [get_bd_pins blk_mem_gen_twiddle_1/clkb] [get_bd_pins blk_mem_gen_twiddle_2/clka] [get_bd_pins blk_mem_gen_twiddle_2/clkb] [get_bd_pins blk_mem_gen_twiddle_3/clka] [get_bd_pins blk_mem_gen_twiddle_3/clkb] [get_bd_pins blk_mem_gen_twiddle_h_1/clka] [get_bd_pins blk_mem_gen_twiddle_h_1/clkb] [get_bd_pins blk_mem_gen_twiddle_h_2/clka] [get_bd_pins blk_mem_gen_twiddle_h_2/clkb] [get_bd_pins blk_mem_gen_twiddle_h_3/clka] [get_bd_pins blk_mem_gen_twiddle_h_3/clkb] [get_bd_pins blk_mem_gen_twiddle_h_4/clka] [get_bd_pins blk_mem_gen_twiddle_h_4/clkb] [get_bd_pins inPlaceNTT_DIF_preco_0/clk]
  connect_bd_net -net axi_pcie3_0_axi_aresetn [get_bd_pins axi_bram_ctrl_vec_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_1/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_2/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_3/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_4/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_5/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_6/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_vec_7/s_axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_lit_0/ARESETN] [get_bd_pins axi_pcie3_0/axi_aresetn] [get_bd_pins inPlaceNTT_DIF_preco_0/rst]
  connect_bd_net -net blk_mem_gen_twiddle_0_douta [get_bd_pins blk_mem_gen_twiddle_0/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_qa]
  connect_bd_net -net blk_mem_gen_twiddle_0_doutb [get_bd_pins blk_mem_gen_twiddle_0/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_qb]
  connect_bd_net -net blk_mem_gen_twiddle_1_douta [get_bd_pins blk_mem_gen_twiddle_1/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_qa]
  connect_bd_net -net blk_mem_gen_twiddle_1_doutb [get_bd_pins blk_mem_gen_twiddle_1/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_qb]
  connect_bd_net -net blk_mem_gen_twiddle_2_douta [get_bd_pins blk_mem_gen_twiddle_2/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_qa]
  connect_bd_net -net blk_mem_gen_twiddle_2_doutb [get_bd_pins blk_mem_gen_twiddle_2/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_qb]
  connect_bd_net -net blk_mem_gen_twiddle_3_douta [get_bd_pins blk_mem_gen_twiddle_3/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_qa]
  connect_bd_net -net blk_mem_gen_twiddle_3_doutb [get_bd_pins blk_mem_gen_twiddle_3/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_qb]
  connect_bd_net -net blk_mem_gen_twiddle_h_1_douta [get_bd_pins blk_mem_gen_twiddle_h_1/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_qa]
  connect_bd_net -net blk_mem_gen_twiddle_h_1_doutb [get_bd_pins blk_mem_gen_twiddle_h_1/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_qb]
  connect_bd_net -net blk_mem_gen_twiddle_h_2_douta [get_bd_pins blk_mem_gen_twiddle_h_2/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_qa]
  connect_bd_net -net blk_mem_gen_twiddle_h_2_doutb [get_bd_pins blk_mem_gen_twiddle_h_2/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_qb]
  connect_bd_net -net blk_mem_gen_twiddle_h_3_douta [get_bd_pins blk_mem_gen_twiddle_h_3/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_qa]
  connect_bd_net -net blk_mem_gen_twiddle_h_3_doutb [get_bd_pins blk_mem_gen_twiddle_h_3/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_qb]
  connect_bd_net -net blk_mem_gen_twiddle_h_4_douta [get_bd_pins blk_mem_gen_twiddle_h_4/douta] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_qa]
  connect_bd_net -net blk_mem_gen_twiddle_h_4_doutb [get_bd_pins blk_mem_gen_twiddle_h_4/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_qb]
  connect_bd_net -net blk_mem_gen_vec_0_doutb [get_bd_pins blk_mem_gen_vec_0/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_0_q]
  connect_bd_net -net blk_mem_gen_vec_1_doutb [get_bd_pins blk_mem_gen_vec_1/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_1_q]
  connect_bd_net -net blk_mem_gen_vec_2_doutb [get_bd_pins blk_mem_gen_vec_2/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_2_q]
  connect_bd_net -net blk_mem_gen_vec_3_doutb [get_bd_pins blk_mem_gen_vec_3/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_3_q]
  connect_bd_net -net blk_mem_gen_vec_4_doutb [get_bd_pins blk_mem_gen_vec_4/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_4_q]
  connect_bd_net -net blk_mem_gen_vec_6_doutb [get_bd_pins blk_mem_gen_vec_6/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_6_q]
  connect_bd_net -net blk_mem_gen_vec_7_doutb [get_bd_pins blk_mem_gen_vec_7/doutb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_7_q]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_complete_rsc_lzout [get_bd_pins axi_lit_0/ac_sync_complete] [get_bd_pins inPlaceNTT_DIF_preco_0/complete_rsc_lzout]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_p_rsc_triosy_lz [get_bd_pins axi_lit_0/p_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/p_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_r_rsc_triosy_lz [get_bd_pins axi_lit_0/r_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/r_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_run_rsc_lzin [get_bd_pins axi_lit_0/ac_sync_run_rsc_lzin] [get_bd_pins inPlaceNTT_DIF_preco_0/run_rsc_lzin]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_adra [get_bd_pins blk_mem_gen_twiddle_h_1/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_adrb [get_bd_pins blk_mem_gen_twiddle_h_1/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_da [get_bd_pins blk_mem_gen_twiddle_h_1/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_db [get_bd_pins blk_mem_gen_twiddle_h_1/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_wea [get_bd_pins blk_mem_gen_twiddle_h_1/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_0_web [get_bd_pins blk_mem_gen_twiddle_h_1/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_0_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_adra [get_bd_pins blk_mem_gen_twiddle_h_2/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_adrb [get_bd_pins blk_mem_gen_twiddle_h_2/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_da [get_bd_pins blk_mem_gen_twiddle_h_2/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_db [get_bd_pins blk_mem_gen_twiddle_h_2/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_wea [get_bd_pins blk_mem_gen_twiddle_h_2/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_1_web [get_bd_pins blk_mem_gen_twiddle_h_2/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_1_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_adra [get_bd_pins blk_mem_gen_twiddle_h_3/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_adrb [get_bd_pins blk_mem_gen_twiddle_h_3/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_da [get_bd_pins blk_mem_gen_twiddle_h_3/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_db [get_bd_pins blk_mem_gen_twiddle_h_3/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_wea [get_bd_pins blk_mem_gen_twiddle_h_3/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_2_web [get_bd_pins blk_mem_gen_twiddle_h_3/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_2_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_adra [get_bd_pins blk_mem_gen_twiddle_h_4/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_adrb [get_bd_pins blk_mem_gen_twiddle_h_4/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_da [get_bd_pins blk_mem_gen_twiddle_h_4/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_db [get_bd_pins blk_mem_gen_twiddle_h_4/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_wea [get_bd_pins blk_mem_gen_twiddle_h_4/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_0_3_web [get_bd_pins blk_mem_gen_twiddle_h_4/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_0_3_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_triosy_0_0_lz [get_bd_pins axi_lit_0/twiddle_h_rsc_triosy_0_0_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_triosy_0_0_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_triosy_0_1_lz [get_bd_pins axi_lit_0/twiddle_h_rsc_triosy_0_1_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_triosy_0_1_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_triosy_0_2_lz [get_bd_pins axi_lit_0/twiddle_h_rsc_triosy_0_2_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_triosy_0_2_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_h_rsc_triosy_0_3_lz [get_bd_pins axi_lit_0/twiddle_h_rsc_triosy_0_3_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_h_rsc_triosy_0_3_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_adra [get_bd_pins blk_mem_gen_twiddle_0/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_adrb [get_bd_pins blk_mem_gen_twiddle_0/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_da [get_bd_pins blk_mem_gen_twiddle_0/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_db [get_bd_pins blk_mem_gen_twiddle_0/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_wea [get_bd_pins blk_mem_gen_twiddle_0/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_0_web [get_bd_pins blk_mem_gen_twiddle_0/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_0_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_adra [get_bd_pins blk_mem_gen_twiddle_1/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_adrb [get_bd_pins blk_mem_gen_twiddle_1/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_da [get_bd_pins blk_mem_gen_twiddle_1/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_db [get_bd_pins blk_mem_gen_twiddle_1/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_wea [get_bd_pins blk_mem_gen_twiddle_1/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_1_web [get_bd_pins blk_mem_gen_twiddle_1/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_1_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_adra [get_bd_pins blk_mem_gen_twiddle_2/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_adrb [get_bd_pins blk_mem_gen_twiddle_2/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_da [get_bd_pins blk_mem_gen_twiddle_2/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_db [get_bd_pins blk_mem_gen_twiddle_2/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_wea [get_bd_pins blk_mem_gen_twiddle_2/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_2_web [get_bd_pins blk_mem_gen_twiddle_2/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_2_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_adra [get_bd_pins blk_mem_gen_twiddle_3/addra] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_adra]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_adrb [get_bd_pins blk_mem_gen_twiddle_3/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_adrb]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_da [get_bd_pins blk_mem_gen_twiddle_3/dina] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_da]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_db [get_bd_pins blk_mem_gen_twiddle_3/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_db]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_wea [get_bd_pins blk_mem_gen_twiddle_3/wea] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_wea]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_0_3_web [get_bd_pins blk_mem_gen_twiddle_3/web] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_0_3_web]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_triosy_0_0_lz [get_bd_pins axi_lit_0/twiddle_rsc_triosy_0_0_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_triosy_0_0_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_triosy_0_1_lz [get_bd_pins axi_lit_0/twiddle_rsc_triosy_0_1_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_triosy_0_1_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_triosy_0_2_lz [get_bd_pins axi_lit_0/twiddle_rsc_triosy_0_2_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_triosy_0_2_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_twiddle_rsc_triosy_0_3_lz [get_bd_pins axi_lit_0/twiddle_rsc_triosy_0_3_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/twiddle_rsc_triosy_0_3_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_0_adr [get_bd_pins blk_mem_gen_vec_0/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_0_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_0_d [get_bd_pins blk_mem_gen_vec_0/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_0_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_0_we [get_bd_pins axi_lit_0/vec_rsc_triosy_0_0_lz] [get_bd_pins blk_mem_gen_vec_0/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_0_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_1_adr [get_bd_pins blk_mem_gen_vec_1/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_1_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_1_d [get_bd_pins blk_mem_gen_vec_1/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_1_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_1_we [get_bd_pins blk_mem_gen_vec_1/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_1_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_2_adr [get_bd_pins blk_mem_gen_vec_2/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_2_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_2_d [get_bd_pins blk_mem_gen_vec_2/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_2_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_2_we [get_bd_pins blk_mem_gen_vec_2/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_2_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_3_adr [get_bd_pins blk_mem_gen_vec_3/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_3_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_3_d [get_bd_pins blk_mem_gen_vec_3/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_3_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_3_we [get_bd_pins blk_mem_gen_vec_3/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_3_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_4_adr [get_bd_pins blk_mem_gen_vec_4/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_4_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_4_d [get_bd_pins blk_mem_gen_vec_4/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_4_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_4_we [get_bd_pins blk_mem_gen_vec_4/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_4_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_5_adr [get_bd_pins blk_mem_gen_vec_5/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_5_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_5_d [get_bd_pins blk_mem_gen_vec_5/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_5_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_5_we [get_bd_pins blk_mem_gen_vec_5/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_5_q] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_5_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_6_adr [get_bd_pins blk_mem_gen_vec_6/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_6_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_6_d [get_bd_pins blk_mem_gen_vec_6/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_6_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_6_we [get_bd_pins blk_mem_gen_vec_6/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_6_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_7_adr [get_bd_pins blk_mem_gen_vec_7/addrb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_7_adr]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_7_d [get_bd_pins blk_mem_gen_vec_7/dinb] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_7_d]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_0_7_we [get_bd_pins blk_mem_gen_vec_7/web] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_0_7_we]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_1_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_1_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_1_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_2_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_2_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_2_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_3_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_3_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_3_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_4_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_4_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_4_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_5_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_5_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_5_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_6_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_6_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_6_lz]
  connect_bd_net -net inPlaceNTT_DIF_preco_0_vec_rsc_triosy_0_7_lz [get_bd_pins axi_lit_0/vec_rsc_triosy_0_7_lz] [get_bd_pins inPlaceNTT_DIF_preco_0/vec_rsc_triosy_0_7_lz]
  connect_bd_net -net refclk_1 [get_bd_ports refclk] [get_bd_pins axi_pcie3_0/refclk]
  connect_bd_net -net sys_rst_n_1 [get_bd_ports sys_rst_n] [get_bd_pins axi_pcie3_0/sys_rst_n]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins axi_pcie3_0/sys_clk_gt] [get_bd_pins util_ds_buf_0/IBUF_OUT]

  # Create address segments
  assign_bd_address -offset 0xC0000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC2000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_1/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC4000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_2/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC6000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_3/S_AXI/Mem0] -force
  assign_bd_address -offset 0xCE000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_4/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC8000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_5/S_AXI/Mem0] -force
  assign_bd_address -offset 0xCA000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_6/S_AXI/Mem0] -force
  assign_bd_address -offset 0xCC000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_vec_7/S_AXI/Mem0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_pcie3_0/M_AXI] [get_bd_addr_segs axi_lit_0/interface_aximm/reg0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


