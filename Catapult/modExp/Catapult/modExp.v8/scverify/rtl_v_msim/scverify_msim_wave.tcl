# Source static function file
global env
# Source the common TCL file (that also reads the wave database file)
source $env(MGC_HOME)/pkgs/sif/userware/En_na/flows/questa_funcs.tcl
read_ccs_wave ./Catapult/modExp.v8/scverify/ccs_wave_signals.dat
setup_vcd_file ./Catapult/modExp.v8/.dut_inst_info.tcl
setup_qwave_sigfile ./Catapult/modExp.v8/.qwave_signal

catch {populate_wave_window}

if { ("" != {}) && [file exists ""] } {
   source ""
}
# If not running in GUI mode, run the entire simulation
if { ![gui_is_active] } {
   do_simulation_run
}
