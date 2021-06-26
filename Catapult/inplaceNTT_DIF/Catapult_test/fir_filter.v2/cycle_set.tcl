
# Loop constraints
directive set /fir_filter/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /fir_filter/core/core:rlp/x:vinit CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /fir_filter/core/core:rlp/main CSTEPS_FROM {{. == 5} {.. == 1}}
directive set /fir_filter/core/core:rlp/main/SHIFT_LOOP CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP CSTEPS_FROM {{. == 2} {.. == 3}}

# IO operation constraints
directive set /fir_filter/core/core:rlp/main/i_sample:io_read(i_sample:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/io_write(y:rsc.@) CSTEPS_FROM {{.. == 4}}

# Sync operation constraints

# Real operation constraints
directive set /fir_filter/core/core:rlp/x:vinit/x:static_init:else:write_mem(x:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/x:vinit/x:static_init:else:acc CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/SHIFT_LOOP/SHIFT_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/SHIFT_LOOP/SHIFT_LOOP:read_mem(x:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/SHIFT_LOOP/SHIFT_LOOP:write_mem(x:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /fir_filter/core/core:rlp/main/SHIFT_LOOP/SHIFT_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/write_mem(x:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:read_mem(x:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:read_mem(b:rsc.@) CSTEPS_FROM {{.. == 0}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:mul CSTEPS_FROM {{.. == 2}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/MAC_LOOP/MAC_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /fir_filter/core/core:rlp/main/acc CSTEPS_FROM {{.. == 4}}
directive set /fir_filter/core/core:rlp/main/nor#5 CSTEPS_FROM {{.. == 4}}
directive set /fir_filter/core/core:rlp/main/nor#4 CSTEPS_FROM {{.. == 4}}

# Probe constraints
