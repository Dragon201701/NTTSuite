# written for flow package DesignCompiler 
set sdc_version 1.7 

set_operating_conditions tt_1p0v_25c
set_load 0.003010 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {i_sample_rsc_dat[*]} {b_rsc_dat[*]}]
set_driving_cell -no_design_rule -library scadv10_cln65gp_rvt_tt_1p0v_25c -lib_cell BUFHX0P7MA10TR -pin Y $data_inputs
set_units -time ns

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {i_sample_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {i_sample_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {b_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {b_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {y_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {y_rsc_triosy_lz}]

