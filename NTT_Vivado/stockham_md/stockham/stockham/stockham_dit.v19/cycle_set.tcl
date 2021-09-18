
# Loop constraints
directive set /stockham_dit/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /stockham_dit/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /stockham_dit/core/core:rlp/main/for CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for CSTEPS_FROM {{. == 9} {.. == 0}}

# IO operation constraints
directive set /stockham_dit/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /stockham_dit/core/core:rlp/main/for/for:for/operator-<32,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/operator&<34,true>:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:w:rshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:w:lshift CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/operator&<34,true>#1:and CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 6}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(5).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(6).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(xt:rsc(0)(7).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(4).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(5).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(6).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:read_mem(yt:rsc(0)(7).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:a:for:for:a:mux1h CSTEPS_FROM {{.. == 7}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:for:for:b:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(5).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(6).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(xt:rsc(0)(7).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(4).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(5).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(6).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:read_mem(yt:rsc(0)(7).@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:b:for:for:b:mux1h CSTEPS_FROM {{.. == 2}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:w:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:z:mul CSTEPS_FROM {{.. == 4}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:wh:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:t:mul CSTEPS_FROM {{.. == 3}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:res:acc CSTEPS_FROM {{.. == 6}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:if:acc#1 CSTEPS_FROM {{.. == 6}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:if:acc CSTEPS_FROM {{.. == 6}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/mult:mux CSTEPS_FROM {{.. == 6}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:acc#2 CSTEPS_FROM {{.. == 7}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/modulo_add:acc#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/modulo_add:qif:acc CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/modulo_add:mux CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(2).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(3).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(5).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(6).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(7).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(2).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(3).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(4).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(5).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(6).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(7).@) CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:mul CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:for:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:acc#5 CSTEPS_FROM {{.. == 7}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/modulo_sub:qif:acc CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/modulo_sub:mux CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(3).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(4).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(5).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(6).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(xt:rsc(0)(7).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(1).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(2).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(3).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(4).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(5).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(6).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:write_mem(yt:rsc(0)(7).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /stockham_dit/core/core:rlp/main/for/for:for/for:for:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/for:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/operator<<32,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /stockham_dit/core/core:rlp/main/for/operator-<32,false>#2:acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
