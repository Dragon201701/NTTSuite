# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 20.0 -waveform { 0.0 10.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 20.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_we}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {vec_rsc_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 1.51 [get_ports {vec_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 1.17 [get_ports {twiddle_rsc_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 1.51 [get_ports {twiddle_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_lz}]

