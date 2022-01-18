
# Loop constraints
directive set /axi_add/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /axi_add/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /axi_add/core/core:rlp/main/ADD_LOOP/operator+<32,false>:io_read(a:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:io_write(b:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints
directive set /axi_add/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_add/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /axi_add/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/operator+<32,false>:mux CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/operator+<32,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#8 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#10 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#11 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#12 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#13 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#14 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#15 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#16 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#17 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#18 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#19 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#20 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#21 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#22 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#23 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#24 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#25 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#26 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#27 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#28 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#29 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#30 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:ADD_LOOP:mux#31 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/ADD_LOOP/ADD_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}
directive set /axi_add/core/core:rlp/main/mux#35 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#36 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#37 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#38 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#39 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#40 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#41 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#42 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#43 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#44 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#45 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#46 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#47 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#48 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#49 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#50 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#51 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#52 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#53 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#54 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#55 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#56 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#57 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#58 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#59 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#60 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#61 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#62 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#63 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#64 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#65 CSTEPS_FROM {{.. == 2}}
directive set /axi_add/core/core:rlp/main/mux#66 CSTEPS_FROM {{.. == 2}}

# Probe constraints
