# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 2.0 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {vec_rsc_q[*]} {p_rsc_dat[*]} {r_rsc_dat[*]} {twiddle_rsc_q[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell BUF_X2 -pin Z $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 20.0 -waveform { 0.0 10.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 20.0
## Multi-cycle component nangate-45nm_beh.mgc_rem (IDX_LOOP_IDX_LOOP_rem_1_cmp) [cycles: 25]
set_multicycle_path 25 -through [get_pins {{DIT_RELOOP_core_inst/IDX_LOOP_IDX_LOOP_rem_1_cmp/z[*]}}]
set_min_delay 0 -from [get_pins {{DIT_RELOOP_core_inst/IDX_LOOP_IDX_LOOP_rem_1_cmp/a[*]} {DIT_RELOOP_core_inst/IDX_LOOP_IDX_LOOP_rem_1_cmp/b[*]}}] -to [get_pins {{DIT_RELOOP_core_inst/IDX_LOOP_IDX_LOOP_rem_1_cmp/z[*]}}]

## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {vec_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_wadr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_d[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {vec_rsc_we}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {vec_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {p_rsc_triosy_lz}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {r_rsc_triosy_lz}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_radr[*]}]
set_output_delay -clock [get_clocks {clk}] 0.01 [get_ports {twiddle_rsc_re}]
set_input_delay -clock [get_clocks {clk}] 0.5 [get_ports {twiddle_rsc_q[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {twiddle_rsc_triosy_lz}]

