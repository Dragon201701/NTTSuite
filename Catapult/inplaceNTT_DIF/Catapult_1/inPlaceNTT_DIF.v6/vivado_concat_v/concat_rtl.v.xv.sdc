# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 20.0 -waveform { 0.0 10.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 20.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_we}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_0_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_we}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_1_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_1_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_we}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_2_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_2_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_we}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_radr[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_3_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_3_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]

