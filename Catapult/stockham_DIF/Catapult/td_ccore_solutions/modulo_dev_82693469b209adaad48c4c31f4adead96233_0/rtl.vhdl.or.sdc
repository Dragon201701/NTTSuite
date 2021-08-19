# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {base_rsc_dat[*]} {m_rsc_dat[*]} ccs_ccore_en ccs_ccore_start_rsc_dat]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name ccs_ccore_clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {ccs_ccore_clk}]
set_clock_uncertainty 0.0 [get_clocks {ccs_ccore_clk}]

create_clock -name virtual_io_clk -period 10.0
## Multi-cycle component nangate-45nm_beh.mgc_rem (rem_4_cmp) [cycles: 4]
set_multicycle_path  4 -through [get_pins {{modulo_dev_core_inst/rem_4_cmp/z[*]}}]
set_min_delay 0 -from [get_pins {{modulo_dev_core_inst/rem_4_cmp/a[*]} {modulo_dev_core_inst/rem_4_cmp/b[*]}}] -to [get_pins {{modulo_dev_core_inst/rem_4_cmp/z[*]}}]

## Multi-cycle component nangate-45nm_beh.mgc_rem (rem_4_cmp_1) [cycles: 4]
set_multicycle_path  4 -through [get_pins {{modulo_dev_core_inst/rem_4_cmp_1/z[*]}}]
set_min_delay 0 -from [get_pins {{modulo_dev_core_inst/rem_4_cmp_1/a[*]} {modulo_dev_core_inst/rem_4_cmp_1/b[*]}}] -to [get_pins {{modulo_dev_core_inst/rem_4_cmp_1/z[*]}}]

## Multi-cycle component nangate-45nm_beh.mgc_rem (rem_4_cmp_2) [cycles: 4]
set_multicycle_path  4 -through [get_pins {{modulo_dev_core_inst/rem_4_cmp_2/z[*]}}]
set_min_delay 0 -from [get_pins {{modulo_dev_core_inst/rem_4_cmp_2/a[*]} {modulo_dev_core_inst/rem_4_cmp_2/b[*]}}] -to [get_pins {{modulo_dev_core_inst/rem_4_cmp_2/z[*]}}]

## Multi-cycle component nangate-45nm_beh.mgc_rem (rem_4_cmp_3) [cycles: 4]
set_multicycle_path  4 -through [get_pins {{modulo_dev_core_inst/rem_4_cmp_3/z[*]}}]
set_min_delay 0 -from [get_pins {{modulo_dev_core_inst/rem_4_cmp_3/a[*]} {modulo_dev_core_inst/rem_4_cmp_3/b[*]}}] -to [get_pins {{modulo_dev_core_inst/rem_4_cmp_3/z[*]}}]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {base_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {m_rsc_dat[*]}]
set_output_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {return_rsc_z[*]}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_start_rsc_dat}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_srst}]
set_input_delay -clock [get_clocks {ccs_ccore_clk}] 0.0 [get_ports {ccs_ccore_en}]

