
# Loop constraints
directive set /stockham_DIT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /stockham_DIT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP CSTEPS_FROM {{. == 74} {.. == 1}}

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
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:INNER_LOOP:a:mux CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mux1h CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:w:rshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:w:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:mux CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:b:mul CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:b:rem CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:acc#2 CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev() CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 35}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 35}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:mul CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:acc#5 CSTEPS_FROM {{.. == 22}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-1:modulo_dev()#1 CSTEPS_FROM {{.. == 23}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 36}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:a:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(xt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 37}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:read_mem(yt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 37}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:a:INNER_LOOP:a:INNER_LOOP:a:mux1h CSTEPS_FROM {{.. == 39}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:INNER_LOOP:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 37}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(xt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 37}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:read_mem(yt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 38}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:b:mux1h#3 CSTEPS_FROM {{.. == 39}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:w:rshift CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:w:lshift CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:read_mem(twiddle:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:w:mux#1 CSTEPS_FROM {{.. == 3}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:mul CSTEPS_FROM {{.. == 39}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:b:rem CSTEPS_FROM {{.. == 39}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:acc#2 CSTEPS_FROM {{.. == 59}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev() CSTEPS_FROM {{.. == 59}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 72}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(1).@)#2 CSTEPS_FROM {{.. == 72}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:acc#5 CSTEPS_FROM {{.. == 59}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP-2:modulo_dev()#1 CSTEPS_FROM {{.. == 60}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 73}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(xt:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 73}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(0).@)#3 CSTEPS_FROM {{.. == 73}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:write_mem(yt:rsc(0)(1).@)#3 CSTEPS_FROM {{.. == 73}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/INNER_LOOP/INNER_LOOP:slc(INNER_LOOP-2:INNER_LOOP:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /stockham_DIT/core/core:rlp/main/OUTER_LOOP/OUTER_LOOP:acc#2 CSTEPS_FROM {{.. == 1}}

# Probe constraints
