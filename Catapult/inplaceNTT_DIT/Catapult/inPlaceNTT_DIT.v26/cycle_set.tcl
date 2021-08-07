
# Loop constraints
directive set /inPlaceNTT_DIT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 12} {.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while CSTEPS_FROM {{. == 48} {.. == 11}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 11}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 77} {.. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while CSTEPS_FROM {{. == 48} {.. == 2}}

# IO operation constraints
directive set /inPlaceNTT_DIT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator_<66,true>:div CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modExp:while:if:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modulo:result:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modulo:qelse:acc CSTEPS_FROM {{.. == 25}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modExp:while:modExp:while:mux1h CSTEPS_FROM {{.. == 25}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modExp:while:mul CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modulo#1:result:rem CSTEPS_FROM {{.. == 24}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modulo#1:qelse:acc CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/modulo#1:mux CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp:while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:if:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modulo#2:result:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modulo#2:qelse:acc CSTEPS_FROM {{.. == 25}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:mul CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modulo#3:result:rem CSTEPS_FROM {{.. == 24}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modulo#3:qelse:acc CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modulo#3:mux CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:modExp#1:while:mux1h CSTEPS_FROM {{.. == 25}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modExp#1:while/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#12 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#10 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mul CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#4:result:rem CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#4:qelse:acc CSTEPS_FROM {{.. == 29}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#4:mux CSTEPS_FROM {{.. == 29}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#5 CSTEPS_FROM {{.. == 29}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#5:result:rem CSTEPS_FROM {{.. == 29}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#5:qelse:acc CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#5:mux CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@) CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#8 CSTEPS_FROM {{.. == 29}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#6:result:rem CSTEPS_FROM {{.. == 52}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#6:qelse:acc CSTEPS_FROM {{.. == 76}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo#6:mux CSTEPS_FROM {{.. == 76}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 76}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#9 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 12}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 12}}

# Probe constraints
