# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name clk -period 5.0 -waveform { 0.0 2.5 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 5.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {run_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_da[*]}]
set_max_delay 5.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_0_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_adrb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_db[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_web}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_0_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_adra[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_da[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_wea}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_1_qa[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_adrb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_db[*]}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_web}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {vec_rsc_0_1_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_1_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_rsc_0_0_adrb[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {twiddle_rsc_0_0_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_rsc_0_1_adrb[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {twiddle_rsc_0_1_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_0_1_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_h_rsc_0_0_adrb[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {twiddle_h_rsc_0_0_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_h_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_h_rsc_0_1_adrb[*]}]
set_input_delay -clock [get_clocks {clk}] 2.4 [get_ports {twiddle_h_rsc_0_1_qb[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_h_rsc_triosy_0_1_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {complete_rsc_vld}]

