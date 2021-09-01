
# Loop constraints
directive set /inPlaceNTT_DIT_precomp/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 78} {.. == 0}}

# IO operation constraints
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#15 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:tmp:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo:result:rem CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo:qelse:acc CSTEPS_FROM {{.. == 14}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo:mux CSTEPS_FROM {{.. == 14}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#5 CSTEPS_FROM {{.. == 14}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo#1:result:rem CSTEPS_FROM {{.. == 14}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo#1:qelse:acc CSTEPS_FROM {{.. == 26}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#1:mux CSTEPS_FROM {{.. == 26}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 26}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 26}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#8 CSTEPS_FROM {{.. == 14}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo#2:result:rem CSTEPS_FROM {{.. == 26}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo#2:qelse:acc CSTEPS_FROM {{.. == 38}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#2:mux CSTEPS_FROM {{.. == 38}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 39}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 39}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#2 CSTEPS_FROM {{.. == 40}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 40}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 40}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:lshift CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:tmp:mul CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:mux CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#3 CSTEPS_FROM {{.. == 41}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 41}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo:result:rem CSTEPS_FROM {{.. == 41}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo:qelse:acc CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo:mux#1 CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#5 CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo#1:result:rem CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo#1:qelse:acc CSTEPS_FROM {{.. == 65}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#1:mux#1 CSTEPS_FROM {{.. == 65}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 65}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 65}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#8 CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo#2:result:rem CSTEPS_FROM {{.. == 65}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo#2:qelse:acc CSTEPS_FROM {{.. == 77}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#2:mux#1 CSTEPS_FROM {{.. == 77}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 77}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 77}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:slc(COMP_LOOP-2:COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
