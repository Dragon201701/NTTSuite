# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 11.63 -waveform { 0.0 5.815 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 11.63
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_da[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_0_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_da[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_1_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_1_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_da[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_2_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_2_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_2_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_da[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_3_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_3_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_3_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]

