
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# inPlaceNTT_DIT_precomp

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku115-flvb2104-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

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

  # Create ports
  set clk [ create_bd_port -dir I -type clk -freq_hz 100000000 clk ]
  set complete_rsc_rdy [ create_bd_port -dir I complete_rsc_rdy ]
  set complete_rsc_vld [ create_bd_port -dir O complete_rsc_vld ]
  set p_rsc_dat [ create_bd_port -dir I -from 31 -to 0 p_rsc_dat ]
  set p_rsc_triosy_lz [ create_bd_port -dir O p_rsc_triosy_lz ]
  set r_rsc_dat [ create_bd_port -dir I -from 31 -to 0 r_rsc_dat ]
  set r_rsc_triosy_lz [ create_bd_port -dir O r_rsc_triosy_lz ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set run_rsc_rdy [ create_bd_port -dir O run_rsc_rdy ]
  set run_rsc_vld [ create_bd_port -dir I run_rsc_vld ]
  set twiddle_h_rsc_triosy_lz [ create_bd_port -dir O twiddle_h_rsc_triosy_lz ]
  set twiddle_rsc_triosy_lz [ create_bd_port -dir O twiddle_rsc_triosy_lz ]
  set vec_rsc_triosy_lz [ create_bd_port -dir O vec_rsc_triosy_lz ]

  # Create instance: blk_mem_gen_twiddle_h_rsc, and set properties
  set blk_mem_gen_twiddle_h_rsc [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_h_rsc ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_A {Use_ENA_Pin} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_twiddle_h_rsc

  # Create instance: blk_mem_gen_twiddle_rsc, and set properties
  set blk_mem_gen_twiddle_rsc [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_twiddle_rsc ]
  set_property -dict [ list \
   CONFIG.Assume_Synchronous_Clk {false} \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_A {Use_ENA_Pin} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Read_Width_A {32} \
   CONFIG.Read_Width_B {32} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.Write_Width_A {32} \
   CONFIG.Write_Width_B {32} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_twiddle_rsc

  # Create instance: blk_mem_gen_vec, and set properties
  set blk_mem_gen_vec [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_vec ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_A {Use_ENA_Pin} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_vec

  # Create instance: inPlaceNTT_DIT_preco_0, and set properties
  set block_name inPlaceNTT_DIT_precomp
  set block_cell_name inPlaceNTT_DIT_preco_0
  if { [catch {set inPlaceNTT_DIT_preco_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $inPlaceNTT_DIT_preco_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net blk_mem_gen_twiddle_h_rsc_douta [get_bd_pins blk_mem_gen_twiddle_h_rsc/douta] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_qa]
  connect_bd_net -net blk_mem_gen_twiddle_h_rsc_doutb [get_bd_pins blk_mem_gen_twiddle_h_rsc/doutb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_qb]
  connect_bd_net -net blk_mem_gen_twiddle_rsc_douta [get_bd_pins blk_mem_gen_twiddle_rsc/douta] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_qa]
  connect_bd_net -net blk_mem_gen_twiddle_rsc_doutb [get_bd_pins blk_mem_gen_twiddle_rsc/doutb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_qb]
  connect_bd_net -net blk_mem_gen_vec_douta [get_bd_pins blk_mem_gen_vec/douta] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_qa]
  connect_bd_net -net blk_mem_gen_vec_doutb [get_bd_pins blk_mem_gen_vec/doutb] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_qb]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins blk_mem_gen_twiddle_h_rsc/clka] [get_bd_pins blk_mem_gen_twiddle_h_rsc/clkb] [get_bd_pins blk_mem_gen_twiddle_rsc/clka] [get_bd_pins blk_mem_gen_twiddle_rsc/clkb] [get_bd_pins blk_mem_gen_vec/clka] [get_bd_pins blk_mem_gen_vec/clkb] [get_bd_pins inPlaceNTT_DIT_preco_0/clk]
  connect_bd_net -net complete_rsc_rdy_1 [get_bd_ports complete_rsc_rdy] [get_bd_pins inPlaceNTT_DIT_preco_0/complete_rsc_rdy]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_complete_rsc_vld [get_bd_ports complete_rsc_vld] [get_bd_pins inPlaceNTT_DIT_preco_0/complete_rsc_vld]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_p_rsc_triosy_lz [get_bd_ports p_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIT_preco_0/p_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_r_rsc_triosy_lz [get_bd_ports r_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIT_preco_0/r_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_run_rsc_rdy [get_bd_ports run_rsc_rdy] [get_bd_pins inPlaceNTT_DIT_preco_0/run_rsc_rdy]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adra [get_bd_pins blk_mem_gen_twiddle_h_rsc/addra] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_adra]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_adrb [get_bd_pins blk_mem_gen_twiddle_h_rsc/addrb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_adrb]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_da [get_bd_pins blk_mem_gen_twiddle_h_rsc/dina] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_da]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_db [get_bd_pins blk_mem_gen_twiddle_h_rsc/dinb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_db]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_triosy_lz [get_bd_ports twiddle_h_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_wea [get_bd_pins blk_mem_gen_twiddle_h_rsc/wea] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_wea]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_h_rsc_web [get_bd_pins blk_mem_gen_twiddle_h_rsc/web] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_h_rsc_web]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_adra [get_bd_pins blk_mem_gen_twiddle_rsc/addra] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_adra]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_adrb [get_bd_pins blk_mem_gen_twiddle_rsc/addrb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_adrb]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_da [get_bd_pins blk_mem_gen_twiddle_rsc/dina] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_da]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_db [get_bd_pins blk_mem_gen_twiddle_rsc/dinb] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_db]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_triosy_lz [get_bd_ports twiddle_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_wea [get_bd_pins blk_mem_gen_twiddle_rsc/wea] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_wea]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_twiddle_rsc_web [get_bd_pins blk_mem_gen_twiddle_rsc/web] [get_bd_pins inPlaceNTT_DIT_preco_0/twiddle_rsc_web]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_adra [get_bd_pins blk_mem_gen_vec/addra] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_adra]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_adrb [get_bd_pins blk_mem_gen_vec/addrb] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_adrb]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_da [get_bd_pins blk_mem_gen_vec/dina] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_da]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_db [get_bd_pins blk_mem_gen_vec/dinb] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_db]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_triosy_lz [get_bd_ports vec_rsc_triosy_lz] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_triosy_lz]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_wea [get_bd_pins blk_mem_gen_vec/wea] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_wea]
  connect_bd_net -net inPlaceNTT_DIT_preco_0_vec_rsc_web [get_bd_pins blk_mem_gen_vec/web] [get_bd_pins inPlaceNTT_DIT_preco_0/vec_rsc_web]
  connect_bd_net -net p_rsc_dat_1 [get_bd_ports p_rsc_dat] [get_bd_pins inPlaceNTT_DIT_preco_0/p_rsc_dat]
  connect_bd_net -net r_rsc_dat_1 [get_bd_ports r_rsc_dat] [get_bd_pins inPlaceNTT_DIT_preco_0/r_rsc_dat]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins inPlaceNTT_DIT_preco_0/rst]
  connect_bd_net -net run_rsc_vld_1 [get_bd_ports run_rsc_vld] [get_bd_pins inPlaceNTT_DIT_preco_0/run_rsc_vld]

  # Create address segments


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


