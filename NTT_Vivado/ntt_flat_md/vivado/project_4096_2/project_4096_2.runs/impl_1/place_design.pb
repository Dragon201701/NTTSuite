
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
	xc7vx690t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
	xc7vx690t2default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and has expired for new software. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
719*common2
2021.082default:defaultZ17-1540h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3009.1092default:default2
0.0002default:default2
1351342default:default2
5055322default:defaultZ17-722h px� 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: db754a9a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.03 . Memory (MB): peak = 3009.109 ; gain = 0.000 ; free physical = 135133 ; free virtual = 5055322default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3009.1092default:default2
0.0002default:default2
1351332default:default2
5055322default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
�
�IO Placement failed due to overutilization. This design contains %s I/O ports
 while the target %s, contains only %s available user I/O. The target device has %s usable I/O pins of which %s are already occupied by user-locked I/Os.
 To rectify this issue:
 1. Ensure you are targeting the correct device and package.  Select a larger device or different package if necessary.
 2. Check the top-level ports of the design to ensure the correct number of ports are specified.
 3. Consider design changes to reduce the number of I/Os necessary.
415*place2
24202default:default25
! device: 7vx690t package: ffg17612default:default2
8502default:default2
8502default:default2
02default:defaultZ30-415h px� 
�
�%s: no pin(s)/port(s)/net(s) specified as objects, only virtual clock '%s' will be created. If you don't want this, please specify pin(s)/ports(s)/net(s) as objects to the command.
483*constraints2 
create_clock2default:default2"
virtual_io_clk2default:default2�
v/home/ls5382/project/forPython/pythonSelfUseCtype/ntt_flat/Catapult_1/ntt_flat.v11/vivado_concat_v/concat_rtl.v.xv.sdc2default:default2
72default:default8@Z18-483h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
Instance %s (%s) is not placed
68*place2(
clk_IBUF_BUFG_inst2default:default2
BUFG2default:default8Z30-68h px� 

Instance %s (%s) is not placed
68*place2#
clk_IBUF_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[0]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[10]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[11]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[12]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[13]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[14]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[15]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[16]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[17]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[18]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[19]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[1]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[20]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[21]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[22]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[23]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[24]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[25]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[26]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[27]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[28]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[29]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[2]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[30]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2-
p_rsc_dat_IBUF[31]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[3]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[4]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[5]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[6]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[7]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[8]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2,
p_rsc_dat_IBUF[9]_inst2default:default2
IBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2/
p_rsc_triosy_lz_OBUF_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place2/
r_rsc_triosy_lz_OBUF_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[0]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place27
!result_rsc_0_0_adra_OBUF[10]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place27
!result_rsc_0_0_adra_OBUF[11]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[1]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[2]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[3]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[4]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[5]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[6]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[7]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[8]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adra_OBUF[9]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[0]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place27
!result_rsc_0_0_adrb_OBUF[10]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place27
!result_rsc_0_0_adrb_OBUF[11]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[1]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[2]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[3]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[4]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[5]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[6]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[7]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[8]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place26
 result_rsc_0_0_adrb_OBUF[9]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[0]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[10]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[11]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[12]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[13]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[14]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[15]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[16]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[17]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[18]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[19]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[1]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[20]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[21]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[22]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[23]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[24]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[25]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[26]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[27]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[28]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[29]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[2]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[30]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_da_OBUF[31]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[3]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[4]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[5]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[6]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[7]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[8]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_da_OBUF[9]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place24
result_rsc_0_0_db_OBUF[0]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[10]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[11]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[12]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[13]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[14]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[15]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
Instance %s (%s) is not placed
68*place25
result_rsc_0_0_db_OBUF[16]_inst2default:default2
OBUF2default:default8Z30-68h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Place 30-682default:default2
1002default:defaultZ17-14h px� 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: b7f80187
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 3009.109 ; gain = 0.000 ; free physical = 134881 ; free virtual = 5052792default:defaulth px� 
H
3Phase 1 Placer Initialization | Checksum: b7f80187
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 3009.109 ; gain = 0.000 ; free physical = 134881 ; free virtual = 5052792default:defaulth px� 
�
�Placer failed with error: '%s'
Please review all ERROR and WARNING messages during placement to understand the cause for failure.
1*	placeflow2*
IO Clock Placer failed2default:defaultZ30-99h px� 
=
(Ending Placer Task | Checksum: b7f80187
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 3009.109 ; gain = 0.000 ; free physical = 134881 ; free virtual = 5052802default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
482default:default2
02default:default2
02default:default2
1032default:defaultZ4-41h px� 
N

%s failed
30*	vivadotcl2 
place_design2default:defaultZ4-43h px� 
m
Command failed: %s
69*common28
$Placer could not place all instances2default:defaultZ17-69h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Sep 16 12:32:41 20212default:defaultZ17-206h px� 


End Record