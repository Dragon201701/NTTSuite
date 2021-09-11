# written for flow package Vivado 
set sdc_version 1.7 

create_clock -name ccs_ccore_clk -period 5.0 -waveform { 0.0 2.5 } [get_ports {ccs_ccore_clk}]
set_clock_uncertainty 0.0 [get_clocks {ccs_ccore_clk}]

create_clock -name virtual_io_clk -period 5.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {x_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {y_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {y_rsc_dat_1[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {return_rsc_z[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_start_rsc_dat}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_srst}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_en}]

