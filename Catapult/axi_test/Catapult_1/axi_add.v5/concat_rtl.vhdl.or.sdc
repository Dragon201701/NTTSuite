# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list run_rsc_vld complete_rsc_rdy {a_rsc_q[*]} {b_rsc_q[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 2.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {a_rsc_adr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {a_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {a_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {a_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {a_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {b_rsc_adr[*]}]
set_max_delay 2.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {b_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {b_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {b_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {b_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_vld}]

