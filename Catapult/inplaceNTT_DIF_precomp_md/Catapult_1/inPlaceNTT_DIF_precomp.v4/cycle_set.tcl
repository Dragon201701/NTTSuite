
# Loop constraints
directive set /inPlaceNTT_DIF_precomp/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP CSTEPS_FROM {{. == 10} {.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 4}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 5}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 7}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 8}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP CSTEPS_FROM {{. == 7} {.. == 9}}

# IO operation constraints
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:twiddle_f:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:twiddle_f:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:twiddle_f:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@) CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:VEC_LOOP/COMP_LOOP-1:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:acc CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:twiddle_f:lshift CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:twiddle_f:mul CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#2 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/VEC_LOOP:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#3 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#2 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#3 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-2:VEC_LOOP/COMP_LOOP-2:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:acc CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:twiddle_f:mul CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#2 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#2 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#4 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#5 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#4 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#5 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-3:VEC_LOOP/COMP_LOOP-3:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:twiddle_f:mul CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#3 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#3 CSTEPS_FROM {{.. == 4}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#6 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/VEC_LOOP:acc#17 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#7 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#6 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#7 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-4:VEC_LOOP/COMP_LOOP-4:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:acc CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:twiddle_f:mul CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#4 CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#4 CSTEPS_FROM {{.. == 5}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#8 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#8 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#9 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-5:VEC_LOOP/COMP_LOOP-5:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:acc CSTEPS_FROM {{.. == 7}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:twiddle_f:mul CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#5 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#5 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/VEC_LOOP:acc#19 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#11 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#10 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#11 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-6:VEC_LOOP/COMP_LOOP-6:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:acc CSTEPS_FROM {{.. == 8}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:twiddle_f:mul CSTEPS_FROM {{.. == 7}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#6 CSTEPS_FROM {{.. == 7}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#6 CSTEPS_FROM {{.. == 7}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#12 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:acc#20 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#13 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#12 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#13 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-7:VEC_LOOP/COMP_LOOP-7:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#2 CSTEPS_FROM {{.. == 9}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:twiddle_f:mul CSTEPS_FROM {{.. == 8}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_f:read_mem(twiddle:rsc.@)#7 CSTEPS_FROM {{.. == 8}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:twiddle_help:read_mem(twiddle_h:rsc.@)#7 CSTEPS_FROM {{.. == 8}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#14 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/VEC_LOOP:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/VEC_LOOP:read_mem(vec:rsc.@)#15 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:modulo_add() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#14 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:modulo_sub() CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:mult() CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/VEC_LOOP:write_mem(vec:rsc.@)#15 CSTEPS_FROM {{.. == 6}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-8:VEC_LOOP/COMP_LOOP-8:VEC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP:acc#3 CSTEPS_FROM {{.. == 10}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/COMP_LOOP/COMP_LOOP-1:acc CSTEPS_FROM {{.. == 10}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF_precomp/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}

# Probe constraints
