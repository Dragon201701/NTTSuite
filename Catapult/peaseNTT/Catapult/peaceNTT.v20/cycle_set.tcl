
# Loop constraints
directive set /peaceNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaceNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP CSTEPS_FROM {{. == 468} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1 CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints
directive set /peaceNTT/core/core:rlp/main/COMP_LOOP:f2:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COMP_LOOP:f2:io_read(g:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:read_mem(vec:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(4).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(6).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:read_mem(vec:rsc(0)(4).@)#2 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:read_mem(vec:rsc(0)(6).@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(3).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(5).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:write_mem(xt:rsc(0)(7).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COMP_LOOP:f2:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:and CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:mul CSTEPS_FROM {{.. == 10}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:rem CSTEPS_FROM {{.. == 32}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:acc CSTEPS_FROM {{.. == 61}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 264}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 293}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#8 CSTEPS_FROM {{.. == 61}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:rem#1 CSTEPS_FROM {{.. == 158}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 176}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#3 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#4 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:mul CSTEPS_FROM {{.. == 9}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:rem CSTEPS_FROM {{.. == 61}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:acc CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 293}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 322}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#9 CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:rem#1 CSTEPS_FROM {{.. == 140}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 158}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(1).@)#4 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(5).@)#4 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#6 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(2).@)#2 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#9 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(2).@)#5 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:mul CSTEPS_FROM {{.. == 8}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:rem CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:acc CSTEPS_FROM {{.. == 119}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 322}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(2).@)#4 CSTEPS_FROM {{.. == 351}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#10 CSTEPS_FROM {{.. == 119}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:rem#1 CSTEPS_FROM {{.. == 122}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(2).@)#5 CSTEPS_FROM {{.. == 140}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#11 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(3).@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux1h CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(3).@)#7 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:mul CSTEPS_FROM {{.. == 7}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:rem CSTEPS_FROM {{.. == 119}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:acc CSTEPS_FROM {{.. == 148}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 351}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(3).@)#6 CSTEPS_FROM {{.. == 380}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#11 CSTEPS_FROM {{.. == 148}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:rem#1 CSTEPS_FROM {{.. == 176}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(3).@)#7 CSTEPS_FROM {{.. == 194}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(2).@)#8 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(6).@)#8 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#12 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(4).@)#4 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#15 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(4).@)#9 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:f2:mul CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:f2:rem CSTEPS_FROM {{.. == 148}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:f2:acc CSTEPS_FROM {{.. == 177}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 380}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(4).@)#8 CSTEPS_FROM {{.. == 409}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#12 CSTEPS_FROM {{.. == 177}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:f2:rem#1 CSTEPS_FROM {{.. == 194}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(4).@)#9 CSTEPS_FROM {{.. == 212}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#17 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(5).@)#5 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux1h#2 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(5).@)#11 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:f2:mul CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:f2:rem CSTEPS_FROM {{.. == 177}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:f2:acc CSTEPS_FROM {{.. == 206}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 409}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(5).@)#10 CSTEPS_FROM {{.. == 438}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#13 CSTEPS_FROM {{.. == 206}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:f2:rem#1 CSTEPS_FROM {{.. == 212}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(5).@)#11 CSTEPS_FROM {{.. == 230}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(3).@)#12 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(7).@)#12 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#18 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(6).@)#6 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux1h#4 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(6).@)#13 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:f2:mul CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:f2:rem CSTEPS_FROM {{.. == 206}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:f2:acc CSTEPS_FROM {{.. == 235}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 438}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(6).@)#12 CSTEPS_FROM {{.. == 467}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#14 CSTEPS_FROM {{.. == 235}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:f2:rem#1 CSTEPS_FROM {{.. == 235}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(6).@)#13 CSTEPS_FROM {{.. == 253}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux#21 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc(0)(7).@)#7 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mux1h#6 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc(0)(7).@)#15 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:f2:mul CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:f2:rem CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:f2:acc CSTEPS_FROM {{.. == 32}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:COMP_LOOP:f2:rem#1 CSTEPS_FROM {{.. == 235}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(7).@)#14 CSTEPS_FROM {{.. == 264}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc#15 CSTEPS_FROM {{.. == 32}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:f2:rem#1 CSTEPS_FROM {{.. == 32}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:write_mem(result:rsc(0)(7).@)#15 CSTEPS_FROM {{.. == 50}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COPY_LOOP#1:i:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:read_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:read_mem(result:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(4).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(6).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:read_mem(result:rsc(0)(4).@)#2 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:read_mem(result:rsc(0)(6).@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(3).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(5).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:write_mem(xt:rsc(0)(7).@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:i:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:c:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
