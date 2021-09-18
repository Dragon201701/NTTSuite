
# Loop constraints
directive set /peaceNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaceNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP CSTEPS_FROM {{. == 186} {.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1 CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints
directive set /peaceNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/g:io_read(g:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:base:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:if:and CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:if:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:mux CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mul CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:rem CSTEPS_FROM {{.. == 14}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#1 CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev:result:rem CSTEPS_FROM {{.. == 137}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev:qelse:acc CSTEPS_FROM {{.. == 184}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev:mux CSTEPS_FROM {{.. == 184}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@) CSTEPS_FROM {{.. == 185}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#3 CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#1:result:rem CSTEPS_FROM {{.. == 90}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#1:qelse:acc CSTEPS_FROM {{.. == 137}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#1:mux CSTEPS_FROM {{.. == 137}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 138}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
