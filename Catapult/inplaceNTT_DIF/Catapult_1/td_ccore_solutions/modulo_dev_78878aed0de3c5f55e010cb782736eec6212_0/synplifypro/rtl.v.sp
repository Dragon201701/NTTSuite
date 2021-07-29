## HLS SP synthesis script
## Generated for stage extract

set hls_status 0

proc run_cmd { cmd errstr } {
  upvar hls_status hls_status
  puts $cmd
  set retVal {}
  if { !$hls_status } {
    if { [catch { set retVal [uplevel 1 [list eval $cmd] ] } ] } {
      puts "Error: Unable to $errstr."
      set hls_status 1
    }
  } else {
    puts "Error: $errstr skipped due to previous errors."
  }
  set retVal
}

# Source custom SynplifyPro script for specified stage
# stage is one of: initial analyze synthesis reports final
proc source_custom_script { stage } {
   global env
   if { [info exists env(SynplifyPro_CustomScriptDirPath)] } {
      set dir_path $env(SynplifyPro_CustomScriptDirPath)
      if { $dir_path ne "" } {
         set script [file join $dir_path sp_${stage}.tcl]
         if { [file exists $script] } {
            set cmd "source $script"
            set msg [list run custom script $script]
            uplevel 1 [list run_cmd $cmd $msg]
         } else {
            puts "WARNING: script=$script does not exist"
         }
      }
   } else {
      puts "WARNING: env(SynplifyPro_CustomScriptDirPath) does not exist"
   }
}

# Reporting settings
puts "-- Requested 4 fractional digits for design 'modulo_dev' timing"
puts "-- Requested 4 fractional digits for design 'modulo_dev' capacitance"
puts "-- Characterization mode: p2p "

# Environment variable settings
set CATAPULT_HOME "/opt/mentorgraphics/Catapult_10.5c/Mgc_home"
   project -new modulo_dev_proj

# Source potential custom script
source_custom_script initial

# family='VIRTEX-7' partval='xc7vx690tffg1761-2'
# Quartus version 
   #set_option -pipe 1
   set_option -technology VIRTEX7
   set_option -part XC7vx690t
   set_option -package ffg1761
   set_option -speed_grade -2
   set_option -disable_io_insertion 1
   set_option -frequency 50.0
   add_file -verilog $CATAPULT_HOME/pkgs/siflibs/ccs_in_v1.v
   add_file -verilog $CATAPULT_HOME/pkgs/siflibs/mgc_out_dreg_v2.v
   add_file -verilog $CATAPULT_HOME/pkgs/hls_pkgs/mgc_comps_src/mgc_rem_beh.v
   add_file -verilog ../rtl.v

   # Source potential custom script
   source_custom_script analyze

   # SDC Timing Constraints
   add_file -constraint ../../../../../../../../../../../../.catapult/Cache/10_5c_896140/CCORE/16274148909b564c95.5/synplifypro/rtl.v.sp.sdc
   # set top modulo_dev

   # Source potential custom script
   source_custom_script synthesis
puts "-- Starting synthesis for design 'modulo_dev'"
   project -save
   project -run

   # Source potential custom script
   source_custom_script reports
   project -close

# Source potential custom script
source_custom_script final
puts "-- Synthesis finished for design 'modulo_dev'"

