
# Loop constraints
directive set /DIT_RELOOP/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /DIT_RELOOP/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP CSTEPS_FROM {{. == 66} {.. == 0}}

# IO operation constraints
directive set /DIT_RELOOP/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:gp:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:gp:lshift CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:op:rshift CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:idx1:mul CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:idx1:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:idx2:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f1:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:mux CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:acc#2 CSTEPS_FROM {{.. == 3}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:modulo_dev() CSTEPS_FROM {{.. == 3}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:lshift CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:read_mem(twiddle:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:mux#10 CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:mul CSTEPS_FROM {{.. == 7}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:IDX_LOOP:rem#1 CSTEPS_FROM {{.. == 7}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 32}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 32}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:acc#3 CSTEPS_FROM {{.. == 4}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:modulo_dev()#1 CSTEPS_FROM {{.. == 4}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 33}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:idx2:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f1:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 33}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 34}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 34}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:f2:mux#1 CSTEPS_FROM {{.. == 35}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:acc#2 CSTEPS_FROM {{.. == 35}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:modulo_dev() CSTEPS_FROM {{.. == 35}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:lshift CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:read_mem(twiddle:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:mux#1 CSTEPS_FROM {{.. == 3}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:mul CSTEPS_FROM {{.. == 39}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:IDX_LOOP:rem#1 CSTEPS_FROM {{.. == 39}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 64}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 64}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:acc#3 CSTEPS_FROM {{.. == 36}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-2:modulo_dev()#1 CSTEPS_FROM {{.. == 36}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 65}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP:slc(IDX_LOOP-2:IDX_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/IDX_LOOP/IDX_LOOP-1:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/GROUP_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/GROUP_LOOP/GROUP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /DIT_RELOOP/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
