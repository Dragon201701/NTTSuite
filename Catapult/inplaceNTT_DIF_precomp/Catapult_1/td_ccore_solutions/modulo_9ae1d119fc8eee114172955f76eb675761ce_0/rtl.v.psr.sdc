# written for flow package Precision 
set sdc_version 1.7 

create_clock -name ccs_ccore_clk -period 20.0 -waveform { 0.0 10.0 } [get_ports {ccs_ccore_clk}]
set_clock_uncertainty 0.0 [get_clocks {ccs_ccore_clk}]

create_clock -name virtual_io_clk -period 20.0
# These constraints prevent the Precision 'No initialized timing analysis; 
# cannot define a Clock.' error message in combinational designs
set hls_design_clk [lindex [concat [find_clocks -top] [all_clocks]] 0]
set_input_delay 0.0 -clock $hls_design_clk [all_inputs]
set_output_delay 0.0 -clock $hls_design_clk [all_outputs]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {base_rsc_dat*}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {m_rsc_dat*}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {return_rsc_z*}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_start_rsc_dat}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_srst}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_en}]

