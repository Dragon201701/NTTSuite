# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_adra[*]}]
set_max_delay 10.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_da[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_wea}]
set_input_delay -clock [get_clocks {clk}] 2.04 [get_ports {a_rsc_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_adrb[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_db[*]}]
set_output_delay -clock [get_clocks {clk}] 1.235 [get_ports {a_rsc_web}]
set_input_delay -clock [get_clocks {clk}] 2.04 [get_ports {a_rsc_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {a_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_vld}]

