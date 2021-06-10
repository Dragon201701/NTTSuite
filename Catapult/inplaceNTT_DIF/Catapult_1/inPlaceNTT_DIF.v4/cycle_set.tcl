
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/COPY_LOOP CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP CSTEPS_FROM {{. == 8} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while CSTEPS_FROM {{. == 44} {.. == 7}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP CSTEPS_FROM {{. == 2} {.. == 7}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 134} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while CSTEPS_FROM {{. == 44} {.. == 46}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/COPY_LOOP/COPY_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/COPY_LOOP/COPY_LOOP:write_mem(result:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/COPY_LOOP/COPY_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator_<64,false>:div CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 7}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/modExp:while:if:mul CSTEPS_FROM {{.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/modExp:while:if:rem CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/modExp:while:mul CSTEPS_FROM {{.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/modExp:while:rem CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/modExp:while:mux CSTEPS_FROM {{.. == 40}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp:while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(result:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#5 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@) CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:if:mul CSTEPS_FROM {{.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:if:rem CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:mul CSTEPS_FROM {{.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:rem CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/modExp#1:while:mux CSTEPS_FROM {{.. == 40}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp#1:while/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#12 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:rem#1 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mul CSTEPS_FROM {{.. == 89}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:rem CSTEPS_FROM {{.. == 91}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 133}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#9 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc#1 CSTEPS_FROM {{.. == 8}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc CSTEPS_FROM {{.. == 8}}

# Probe constraints
