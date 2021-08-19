# written for flow package Precision 
set sdc_version 1.7 

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
# These constraints prevent the Precision 'No initialized timing analysis; 
# cannot define a Clock.' error message in combinational designs
set hls_design_clk [lindex [concat [find_clocks -top] [all_clocks]] 0]
set_input_delay 0.0 -clock $hls_design_clk [all_inputs]
set_output_delay 0.0 -clock $hls_design_clk [all_outputs]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {base_rsc_dat*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {base_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {exp_rsc_dat*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {exp_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {m_rsc_dat*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {m_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_zout*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_lzout}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_zin*}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {result_rsc_triosy_lz}]

