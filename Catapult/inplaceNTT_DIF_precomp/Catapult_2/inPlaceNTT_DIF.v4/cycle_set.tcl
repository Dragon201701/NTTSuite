
# Loop constraints
directive set /inPlaceNTT_DIF/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP CSTEPS_FROM {{. == 80} {.. == 0}}

# IO operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:read_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:lshift CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:mul CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:tmp:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#6 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo_dev:result:rem CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:mul CSTEPS_FROM {{.. == 28}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo_dev#1:result:rem CSTEPS_FROM {{.. == 53}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@) CSTEPS_FROM {{.. == 78}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#8 CSTEPS_FROM {{.. == 3}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/modulo_dev#2:result:rem CSTEPS_FROM {{.. == 28}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:write_mem(vec:rsc.@)#1 CSTEPS_FROM {{.. == 79}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/COMP_LOOP/COMP_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/VEC_LOOP/VEC_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /inPlaceNTT_DIF/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
