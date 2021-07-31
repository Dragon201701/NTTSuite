# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
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

