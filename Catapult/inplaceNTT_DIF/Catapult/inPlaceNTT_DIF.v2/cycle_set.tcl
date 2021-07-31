
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP CSTEPS_FROM {{. == 5} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while CSTEPS_FROM {{. == 12} {.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP CSTEPS_FROM {{. == 2} {.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 46} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 17}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:div CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/operator<<64,false>:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#3 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modulo_dev() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp_dev#1:while/modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp_dev#1:while/modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp_dev#1:while/modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modExp_dev#1:while/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#5 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modulo_dev()#1 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mul CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/modulo_dev()#2 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#6 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator<<64,false>:acc CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc CSTEPS_FROM {{.. == 5}}

# Probe constraints
