
# Loop constraints
directive set /mult/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mult/core/core:rlp/main CSTEPS_FROM {{. == 8} {.. == 0}}

# IO operation constraints
directive set /mult/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/y_:io_read(y_:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/y:io_read(y:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/x:io_read(x:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/VEC_LOOP:io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/VEC_LOOP:io_write(return:rsc.@) CSTEPS_FROM {{.. == 7}}

# Sync operation constraints

# Real operation constraints
directive set /mult/core/core:rlp/main/z:mul CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/t:mul CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/z_:mul CSTEPS_FROM {{.. == 4}}
directive set /mult/core/core:rlp/main/res:acc CSTEPS_FROM {{.. == 6}}
directive set /mult/core/core:rlp/main/if:acc#1 CSTEPS_FROM {{.. == 6}}
directive set /mult/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 7}}
directive set /mult/core/core:rlp/main/VEC_LOOP:mux#1 CSTEPS_FROM {{.. == 7}}

# Probe constraints
