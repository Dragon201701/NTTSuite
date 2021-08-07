
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 63} {.. == 0}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#12 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#6 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo()#1 CSTEPS_FROM {{.. == 17}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 30}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 30}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#8 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo()#2 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#2 CSTEPS_FROM {{.. == 33}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 33}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 33}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#3 CSTEPS_FROM {{.. == 34}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#6 CSTEPS_FROM {{.. == 34}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo() CSTEPS_FROM {{.. == 34}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:mux CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo()#1 CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 61}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 61}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#8 CSTEPS_FROM {{.. == 34}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo()#2 CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 62}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 62}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:slc(COMP_LOOP-2:COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
