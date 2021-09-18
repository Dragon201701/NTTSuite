
# Loop constraints
directive set /modulo_add/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /modulo_add/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /modulo_add/core/core:rlp/main/m:io_read(m:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_add/core/core:rlp/main/base:io_read(base:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_add/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_add/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /modulo_add/core/core:rlp/main/acc#1 CSTEPS_FROM {{.. == 1}}
directive set /modulo_add/core/core:rlp/main/qif:acc CSTEPS_FROM {{.. == 1}}
directive set /modulo_add/core/core:rlp/main/mux#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
