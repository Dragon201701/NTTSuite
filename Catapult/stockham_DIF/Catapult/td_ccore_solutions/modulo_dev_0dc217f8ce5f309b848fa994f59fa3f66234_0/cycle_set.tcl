
# Loop constraints
directive set /modulo_dev/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /modulo_dev/core/core:rlp/main CSTEPS_FROM {{. == 5} {.. == 0}}

# IO operation constraints
directive set /modulo_dev/core/core:rlp/main/m:io_read(m:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_dev/core/core:rlp/main/base:io_read(base:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_dev/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modulo_dev/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 4}}

# Sync operation constraints

# Real operation constraints
directive set /modulo_dev/core/core:rlp/main/rem CSTEPS_FROM {{.. == 1}}
directive set /modulo_dev/core/core:rlp/main/qelse:acc CSTEPS_FROM {{.. == 4}}
directive set /modulo_dev/core/core:rlp/main/mux#2 CSTEPS_FROM {{.. == 4}}

# Probe constraints
