
# Loop constraints
directive set /axi_test/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /axi_test/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints

# Sync operation constraints
directive set /axi_test/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_test/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /axi_test/core/core:rlp/main/io_read(run) CSTEPS_FROM {{.. == 0}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/operator+<32,false>:read_mem(a:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/operator+<32,false>:acc CSTEPS_FROM {{.. == 2}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/ADD_LOOP:write_mem(b:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /axi_test/core/core:rlp/main/ADD_LOOP/ADD_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /axi_test/core/core:rlp/main/if:io_write(complete) CSTEPS_FROM {{.. == 1}}

# Probe constraints
