
# Loop constraints
directive set /peaseNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaseNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1 CSTEPS_FROM {{. == 14} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2 CSTEPS_FROM {{. == 15} {.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1 CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3 CSTEPS_FROM {{. == 14} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4 CSTEPS_FROM {{. == 15} {.. == 2}}

# IO operation constraints
directive set /peaseNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator-<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/INNER_LOOP1:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/mult() CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_add() CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 13}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/modulo_sub() CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/butterFly1:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP1/operator+=<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>#1:lshift CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:f1:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/INNER_LOOP2:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:f2:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/mult()#1 CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:acc CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_add()#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 14}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:acc#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/modulo_sub()#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/butterFly1#1:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 13}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP2/operator+=<20,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/operator<<<33,true>#2:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:f1:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:f2:read_mem(xt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/mult()#2 CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_add()#2 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:write_mem(yt:rsc.@) CSTEPS_FROM {{.. == 13}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/modulo_sub()#2 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/butterFly2:write_mem(yt:rsc.@)#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP3/operator+=<20,false>#2:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/operator<<<33,true>#3:lshift CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:f1:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:tw_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:f2:read_mem(yt:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/mult()#3 CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:acc CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_add()#3 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:write_mem(xt:rsc.@) CSTEPS_FROM {{.. == 14}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:acc#1 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/modulo_sub()#3 CSTEPS_FROM {{.. == 12}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/butterFly2#1:write_mem(xt:rsc.@)#1 CSTEPS_FROM {{.. == 13}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP1/INNER_LOOP4/operator+=<20,false>#3:acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
