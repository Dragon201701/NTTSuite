
# Loop constraints
directive set /stockham_DIT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /stockham_DIT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP CSTEPS_FROM {{. == 37} {.. == 1}}

# IO operation constraints
directive set /stockham_DIT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/g:io_read(g:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:m:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:m:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:upper:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:upper:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:q:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:INNER_LOOP:a:mux CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mux1h CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:rshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mul CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:rem CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#2 CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev() CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 35}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 35}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:mul CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#5 CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev()#1 CSTEPS_FROM {{.. == 23}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}

# Probe constraints
