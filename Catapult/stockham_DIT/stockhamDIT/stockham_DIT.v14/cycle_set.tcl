
# Loop constraints
directive set /stockham_DIT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /stockham_DIT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP CSTEPS_FROM {{. == 124} {.. == 1}}

# IO operation constraints
directive set /stockham_DIT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/g:io_read(g:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:m:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:m:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:upper:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:upper:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:q:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:INNER_LOOP:a:mux CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mux1h CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:w:rshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:w:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:b:mul CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:b:rem CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:acc#2 CSTEPS_FROM {{.. == 29}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev:result:rem CSTEPS_FROM {{.. == 29}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev:qelse:acc CSTEPS_FROM {{.. == 45}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev:mux CSTEPS_FROM {{.. == 45}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 46}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 45}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:mul CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:acc#5 CSTEPS_FROM {{.. == 29}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev#1:result:rem CSTEPS_FROM {{.. == 45}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev#1:qelse:acc CSTEPS_FROM {{.. == 61}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev#1:mux CSTEPS_FROM {{.. == 61}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 61}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 61}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:a:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 62}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 62}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:INNER_LOOP:a:mux#1 CSTEPS_FROM {{.. == 63}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 63}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 63}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mux1h#1 CSTEPS_FROM {{.. == 64}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:w:rshift CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:w:lshift CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc.@)#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:mul CSTEPS_FROM {{.. == 65}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:rem CSTEPS_FROM {{.. == 65}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:acc#2 CSTEPS_FROM {{.. == 91}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev:result:rem CSTEPS_FROM {{.. == 91}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev:qelse:acc CSTEPS_FROM {{.. == 107}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev:mux#1 CSTEPS_FROM {{.. == 107}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@)#2 CSTEPS_FROM {{.. == 107}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@)#2 CSTEPS_FROM {{.. == 107}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:acc#5 CSTEPS_FROM {{.. == 91}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev#1:result:rem CSTEPS_FROM {{.. == 107}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev#1:qelse:acc CSTEPS_FROM {{.. == 123}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/modulo_dev#1:mux#1 CSTEPS_FROM {{.. == 123}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc.@)#3 CSTEPS_FROM {{.. == 123}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc.@)#3 CSTEPS_FROM {{.. == 123}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:slc(INNER_LOOP-2:INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}

# Probe constraints
