
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP CSTEPS_FROM {{. == 5} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while CSTEPS_FROM {{. == 12} {.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP CSTEPS_FROM {{. == 2} {.. == 4}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 91} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 17}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 62}}

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
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP-1:operator<<64,false>:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#13 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#3 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#5 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#1 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#2 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:operator<<64,false>:acc CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#2 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#3 CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#3 CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev() CSTEPS_FROM {{.. == 48}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 61}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 61}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#5 CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#1 CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 76}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#2 CSTEPS_FROM {{.. == 77}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:slc(COMP_LOOP-2:COMP_LOOP:acc CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:operator<<64,false>:acc CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc CSTEPS_FROM {{.. == 5}}

# Probe constraints
