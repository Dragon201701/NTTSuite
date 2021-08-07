
# Loop constraints
directive set /inPlaceNTT_DIT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 5} {.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp_dev:while CSTEPS_FROM {{. == 15} {.. == 4}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 4}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 65} {.. == 0}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while CSTEPS_FROM {{. == 15} {.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while CSTEPS_FROM {{. == 15} {.. == 34}}

# IO operation constraints
directive set /inPlaceNTT_DIT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator_<66,true>:div CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp_dev:while/modExp_dev:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp_dev:while/modulo_dev() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp_dev:while/modExp_dev:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/modExp_dev:while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#13 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modulo_dev()#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#10 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#1 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#2 CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#5 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#3 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#8 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#4 CSTEPS_FROM {{.. == 19}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 32}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 33}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 33}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#2 CSTEPS_FROM {{.. == 34}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modulo_dev()#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#10 CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mux#3 CSTEPS_FROM {{.. == 36}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 36}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#2 CSTEPS_FROM {{.. == 37}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#5 CSTEPS_FROM {{.. == 50}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#3 CSTEPS_FROM {{.. == 50}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 63}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#8 CSTEPS_FROM {{.. == 50}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#4 CSTEPS_FROM {{.. == 51}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 64}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 64}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:slc(COMP_LOOP-2:COMP_LOOP:acc CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc CSTEPS_FROM {{.. == 35}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 5}}

# Probe constraints
