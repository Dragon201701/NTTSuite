
# Loop constraints
directive set /peaceNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaceNTT/core/core:rlp/main CSTEPS_FROM {{. == 9} {.. == 0}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE CSTEPS_FROM {{. == 25} {.. == 8}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP CSTEPS_FROM {{. == 25} {.. == 8}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP CSTEPS_FROM {{. == 3} {.. == 8}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 1} {.. == 8}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP CSTEPS_FROM {{. == 77} {.. == 0}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1 CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /peaceNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/w0:io_read(g:rsc.@) CSTEPS_FROM {{.. == 8}}

# Sync operation constraints

# Real operation constraints
directive set /peaceNTT/core/core:rlp/main/operator-<64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#20 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#19 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#28 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#17 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#27 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#32 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#26 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#25 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#31 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#34 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#24 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#23 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#30 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#22 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#29 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#33 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#35 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#36 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#37 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#4 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#38 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#2 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#28 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#27 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#26 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#25 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#24 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#23 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#22 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#21 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#20 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#19 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#18 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#17 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#16 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#15 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#14 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#13 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#12 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#11 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#10 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#9 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#8 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#7 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#6 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#5 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#4 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#2 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#39 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#41 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#40 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#42 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#43 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#44 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:mul#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#45 CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#46 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#47 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#48 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#49 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#50 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#51 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#52 CSTEPS_FROM {{.. == 3}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#53 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#54 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#55 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#56 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#57 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#58 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#59 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#60 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#61 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#62 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#63 CSTEPS_FROM {{.. == 5}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#64 CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#65 CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#66 CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#67 CSTEPS_FROM {{.. == 6}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#68 CSTEPS_FROM {{.. == 7}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#69 CSTEPS_FROM {{.. == 7}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#70 CSTEPS_FROM {{.. == 7}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#71 CSTEPS_FROM {{.. == 7}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:acc#72 CSTEPS_FROM {{.. == 8}}
directive set /peaceNTT/core/core:rlp/main/operator_<66,true>:operator_<66,true>:acc CSTEPS_FROM {{.. == 8}}
directive set /peaceNTT/core/core:rlp/main/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 8}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/MODEXP_WHILE:mul CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/modulo_dev:result:rem CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/modulo_dev:qelse:acc CSTEPS_FROM {{.. == 25}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/MODEXP_WHILE:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/modulo_dev:mux CSTEPS_FROM {{.. == 25}}
directive set /peaceNTT/core/core:rlp/main/MODEXP_WHILE/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/TWIDDLE_LOOP:write_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/TWIDDLE_LOOP:mul CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/modulo_dev#1:result:rem CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/modulo_dev#1:qelse:acc CSTEPS_FROM {{.. == 25}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/TWIDDLE_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/TWIDDLE_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/TWIDDLE_LOOP/modulo_dev#1:mux CSTEPS_FROM {{.. == 25}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/COPY_LOOP/COPY_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:acc CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mul CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:f2:mul#1 CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#2:result:rem CSTEPS_FROM {{.. == 4}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#2:qelse:acc CSTEPS_FROM {{.. == 28}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#2:mux CSTEPS_FROM {{.. == 28}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 28}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#3:result:rem CSTEPS_FROM {{.. == 52}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#3:qelse:acc CSTEPS_FROM {{.. == 76}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#3:mux CSTEPS_FROM {{.. == 76}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@) CSTEPS_FROM {{.. == 76}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#2 CSTEPS_FROM {{.. == 28}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#4:result:rem CSTEPS_FROM {{.. == 28}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#4:qelse:acc CSTEPS_FROM {{.. == 52}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/modulo_dev#4:mux CSTEPS_FROM {{.. == 52}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:write_mem(result:rsc.@)#1 CSTEPS_FROM {{.. == 52}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:read_mem(result:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/COPY_LOOP#1/COPY_LOOP#1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaceNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
