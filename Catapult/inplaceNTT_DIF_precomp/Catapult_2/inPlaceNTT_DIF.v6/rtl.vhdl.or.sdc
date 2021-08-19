# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {vec_rsc_0_0_q[*]} {vec_rsc_0_1_q[*]} {p_rsc_dat[*]} {r_rsc_dat[*]} {twiddle_rsc_0_0_q[*]} {twiddle_rsc_0_1_q[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## Multi-cycle component nangate-45nm_beh.mgc_rem (COMP_LOOP_1_modulo_dev_result_rem_cmp) [cycles: 25]
set_multicycle_path 25 -through [get_pins {{inPlaceNTT_DIF_core_inst/COMP_LOOP_1_modulo_dev_result_rem_cmp/z[*]}}]
set_min_delay 0 -from [get_pins {{inPlaceNTT_DIF_core_inst/COMP_LOOP_1_modulo_dev_result_rem_cmp/a[*]} {inPlaceNTT_DIF_core_inst/COMP_LOOP_1_modulo_dev_result_rem_cmp/b[*]}}] -to [get_pins {{inPlaceNTT_DIF_core_inst/COMP_LOOP_1_modulo_dev_result_rem_cmp/z[*]}}]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_0_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_0_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_0_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_0_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_0_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_0_we}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_1_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_1_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_0_1_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_1_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_1_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_0_1_we}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_0_1_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_0_0_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_0_0_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_rsc_0_0_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_0_0_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_0_1_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_0_1_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_rsc_0_1_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_0_1_lz}]

