
# Loop constraints
directive set /peaceNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaceNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP CSTEPS_FROM {{. == 4} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP CSTEPS_FROM {{. == 245} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1 CSTEPS_FROM {{. == 6} {.. == 1}}

# IO operation constraints
directive set /peaceNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/g:io_read(g:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:read_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:and CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:mul CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:f2:rem CSTEPS_FROM {{.. == 33}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:acc#1 CSTEPS_FROM {{.. == 64}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 153}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@) CSTEPS_FROM {{.. == 184}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#5 CSTEPS_FROM {{.. == 64}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:rem CSTEPS_FROM {{.. == 64}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 83}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc.@)#1 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:mul CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:f2:rem CSTEPS_FROM {{.. == 63}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:acc#1 CSTEPS_FROM {{.. == 94}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 183}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#2 CSTEPS_FROM {{.. == 214}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#6 CSTEPS_FROM {{.. == 94}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:rem CSTEPS_FROM {{.. == 94}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#3 CSTEPS_FROM {{.. == 113}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f1:read_mem(xt:rsc.@)#2 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc.@)#2 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@)#2 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:mul CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:f2:rem CSTEPS_FROM {{.. == 93}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:acc#1 CSTEPS_FROM {{.. == 124}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 213}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#4 CSTEPS_FROM {{.. == 244}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#7 CSTEPS_FROM {{.. == 124}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:rem CSTEPS_FROM {{.. == 124}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#5 CSTEPS_FROM {{.. == 143}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc.@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@)#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:mul CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:f2:rem CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:acc#1 CSTEPS_FROM {{.. == 34}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 123}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#6 CSTEPS_FROM {{.. == 154}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#8 CSTEPS_FROM {{.. == 34}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:rem CSTEPS_FROM {{.. == 34}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#7 CSTEPS_FROM {{.. == 53}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@) CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@)#3 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@)#2 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:write_mem(xt:rsc.@)#3 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
