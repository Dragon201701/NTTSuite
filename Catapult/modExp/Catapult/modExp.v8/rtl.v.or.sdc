# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {base_rsc_dat[*]} {exp_rsc_dat[*]} {m_rsc_dat[*]} {result_rsc_zin[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## Multi-cycle component nangate-45nm_beh.mgc_rem (while_rem_cmp) [cycles: 25]
set_multicycle_path 25 -through [get_pins {{modExp_core_inst/while_rem_cmp/z[*]}}]
set_min_delay 0 -from [get_pins {{modExp_core_inst/while_rem_cmp/a[*]} {modExp_core_inst/while_rem_cmp/b[*]}}] -to [get_pins {{modExp_core_inst/while_rem_cmp/z[*]}}]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {base_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {base_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {exp_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {exp_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {m_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {m_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_zout[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_lzout}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_zin[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_triosy_lz}]

