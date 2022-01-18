# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_adr[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 2.04 [get_ports {a_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {a_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {b_rsc_adr[*]}]
set_max_delay 10.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {b_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {b_rsc_we}]
set_input_delay -clock [get_clocks {clk}] 2.04 [get_ports {b_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {b_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_vld}]

