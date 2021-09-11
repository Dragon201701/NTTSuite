
# Loop constraints
directive set /mult/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mult/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /mult/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/y_:io_read(y_:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/y:io_read(y:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/x:io_read(x:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /mult/core/core:rlp/main/z:mul CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/t:mul CSTEPS_FROM {{.. == 1}}
directive set /mult/core/core:rlp/main/z_:mul CSTEPS_FROM {{.. == 2}}
directive set /mult/core/core:rlp/main/res:acc CSTEPS_FROM {{.. == 2}}
directive set /mult/core/core:rlp/main/acc CSTEPS_FROM {{.. == 2}}
directive set /mult/core/core:rlp/main/if:acc CSTEPS_FROM {{.. == 2}}
directive set /mult/core/core:rlp/main/mux#1 CSTEPS_FROM {{.. == 2}}

# Probe constraints
