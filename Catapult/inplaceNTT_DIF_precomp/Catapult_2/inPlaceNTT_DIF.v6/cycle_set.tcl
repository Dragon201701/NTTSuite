
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 158} {.. == 0}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#10 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#6 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev:result:rem CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 28}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev#1:result:rem CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 78}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 78}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#8 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev#2:result:rem CSTEPS_FROM {{.. == 28}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 79}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 79}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 80}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 80}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#2 CSTEPS_FROM {{.. == 81}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 81}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 81}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#3 CSTEPS_FROM {{.. == 82}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:lshift CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:mul CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:mux CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#6 CSTEPS_FROM {{.. == 82}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev:result:rem CSTEPS_FROM {{.. == 82}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 107}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev#1:result:rem CSTEPS_FROM {{.. == 107}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#8 CSTEPS_FROM {{.. == 83}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev#2:result:rem CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 157}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 157}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:slc(COMP_LOOP-2:COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
