# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 20.0 -waveform { 0.0 10.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 20.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_da[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_wea}]
set_input_delay -clock [get_clocks {clk}] 1.51 [get_ports {vec_rsc_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_adrb[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_db[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_web}]
set_input_delay -clock [get_clocks {clk}] 1.51 [get_ports {vec_rsc_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]

