
# Loop constraints
directive set /axi_test/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /axi_test/core/core:rlp/main CSTEPS_FROM {{. == 4} {.. == 1}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /axi_test/core/core:rlp/main/if:io_write(arrsum:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints
directive set /axi_test/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_test/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /axi_test/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/ADD_LOOP:read_mem(a:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/ADD_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/ADD_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /axi_test/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 2}}

# Probe constraints
