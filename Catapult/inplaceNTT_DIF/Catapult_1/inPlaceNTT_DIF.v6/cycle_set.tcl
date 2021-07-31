
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP CSTEPS_FROM {{. == 6} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while CSTEPS_FROM {{. == 12} {.. == 5}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP CSTEPS_FROM {{. == 2} {.. == 5}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 177} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 17}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 61}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 105}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modExp_dev#1:while CSTEPS_FROM {{. == 12} {.. == 149}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:div CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/modExp_dev:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/modExp_dev:while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP-1:operator<<64,false>:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#37 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#25 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#3 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@) CSTEPS_FROM {{.. == 16}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modExp_dev#1:while/COMP_LOOP-1:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:acc#5 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#1 CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:mul CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:modulo_dev()#2 CSTEPS_FROM {{.. == 31}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 44}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 44}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 44}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#1 CSTEPS_FROM {{.. == 44}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:operator<<64,false>:acc CSTEPS_FROM {{.. == 18}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#2 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#2 CSTEPS_FROM {{.. == 45}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#2 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#26 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#3 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#3 CSTEPS_FROM {{.. == 46}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#3 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#3 CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev() CSTEPS_FROM {{.. == 47}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#2 CSTEPS_FROM {{.. == 60}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 60}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#2 CSTEPS_FROM {{.. == 60}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#2 CSTEPS_FROM {{.. == 60}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modExp_dev#1:while/COMP_LOOP-2:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:acc#5 CSTEPS_FROM {{.. == 62}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#1 CSTEPS_FROM {{.. == 62}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:mul CSTEPS_FROM {{.. == 75}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-2:modulo_dev()#2 CSTEPS_FROM {{.. == 75}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 88}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 88}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#3 CSTEPS_FROM {{.. == 88}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#3 CSTEPS_FROM {{.. == 88}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:operator<<64,false>:acc CSTEPS_FROM {{.. == 62}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#4 CSTEPS_FROM {{.. == 89}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#4 CSTEPS_FROM {{.. == 89}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#4 CSTEPS_FROM {{.. == 89}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#4 CSTEPS_FROM {{.. == 89}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#4 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#27 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#5 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#5 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#5 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#5 CSTEPS_FROM {{.. == 90}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#5 CSTEPS_FROM {{.. == 91}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:acc#3 CSTEPS_FROM {{.. == 91}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modulo_dev() CSTEPS_FROM {{.. == 91}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#4 CSTEPS_FROM {{.. == 104}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#4 CSTEPS_FROM {{.. == 104}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#4 CSTEPS_FROM {{.. == 104}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#4 CSTEPS_FROM {{.. == 104}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modExp_dev#1:while/COMP_LOOP-3:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modExp_dev#1:while/COMP_LOOP-3:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modExp_dev#1:while/COMP_LOOP-3:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modExp_dev#1:while/COMP_LOOP-3:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:acc#5 CSTEPS_FROM {{.. == 106}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modulo_dev()#1 CSTEPS_FROM {{.. == 106}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:mul CSTEPS_FROM {{.. == 119}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-3:modulo_dev()#2 CSTEPS_FROM {{.. == 119}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#5 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#5 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#5 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#5 CSTEPS_FROM {{.. == 132}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/operator<<64,false>:acc CSTEPS_FROM {{.. == 106}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#6 CSTEPS_FROM {{.. == 133}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#6 CSTEPS_FROM {{.. == 133}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#6 CSTEPS_FROM {{.. == 133}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#6 CSTEPS_FROM {{.. == 133}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#6 CSTEPS_FROM {{.. == 134}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#28 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:operator+<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(0).@)#7 CSTEPS_FROM {{.. == 134}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(1).@)#7 CSTEPS_FROM {{.. == 134}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(2).@)#7 CSTEPS_FROM {{.. == 134}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc(0)(3).@)#7 CSTEPS_FROM {{.. == 134}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:mux1h#7 CSTEPS_FROM {{.. == 135}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:acc#3 CSTEPS_FROM {{.. == 135}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modulo_dev() CSTEPS_FROM {{.. == 135}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#6 CSTEPS_FROM {{.. == 148}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#6 CSTEPS_FROM {{.. == 148}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#6 CSTEPS_FROM {{.. == 148}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#6 CSTEPS_FROM {{.. == 148}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modExp_dev#1:while/COMP_LOOP-4:modExp_dev#1:while:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modExp_dev#1:while/COMP_LOOP-4:modExp_dev#1:while:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modExp_dev#1:while/COMP_LOOP-4:modExp_dev#1:while:rem CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modExp_dev#1:while/COMP_LOOP-4:operator><64,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:acc#5 CSTEPS_FROM {{.. == 150}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modulo_dev()#1 CSTEPS_FROM {{.. == 150}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:mul CSTEPS_FROM {{.. == 163}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-4:modulo_dev()#2 CSTEPS_FROM {{.. == 163}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(0).@)#7 CSTEPS_FROM {{.. == 176}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(1).@)#7 CSTEPS_FROM {{.. == 176}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(2).@)#7 CSTEPS_FROM {{.. == 176}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc(0)(3).@)#7 CSTEPS_FROM {{.. == 176}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#8 CSTEPS_FROM {{.. == 150}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/COMP_LOOP/COMP_LOOP-1:operator<<64,false>:acc CSTEPS_FROM {{.. == 150}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_VEC_LOOP/STAGE_VEC_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_MAIN_LOOP/STAGE_MAIN_LOOP:acc CSTEPS_FROM {{.. == 6}}

# Probe constraints
