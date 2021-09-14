
# Loop constraints
directive set /peaseNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaseNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1 CSTEPS_FROM {{. == 13} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2 CSTEPS_FROM {{. == 13} {.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1 CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3 CSTEPS_FROM {{. == 13} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4 CSTEPS_FROM {{. == 13} {.. == 2}}

# IO operation constraints
directive set /peaseNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator-<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:z:mul CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:res:acc CSTEPS_FROM {{.. == 8}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:if:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult:mux CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_add:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_add:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_add:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_sub:qif:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_sub:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/operator+=<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>#1:lshift CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:f1:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:f2:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:z:mul CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:res:acc CSTEPS_FROM {{.. == 8}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:if:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult#1:mux CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_add#1:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_add#1:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_add#1:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_sub#1:qif:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_sub#1:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/operator+=<20,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/operator<<<33,true>#2:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:z:mul CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:res:acc CSTEPS_FROM {{.. == 8}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:if:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult#2:mux CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_add#2:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_add#2:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_add#2:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_sub#2:qif:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_sub#2:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/operator+=<20,false>#2:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/operator<<<33,true>#3:lshift CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:f1:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:f2:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:z:mul CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:res:acc CSTEPS_FROM {{.. == 8}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:if:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult#3:mux CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_add#3:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_add#3:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_add#3:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_sub#3:qif:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_sub#3:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/operator+=<20,false>#3:acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
