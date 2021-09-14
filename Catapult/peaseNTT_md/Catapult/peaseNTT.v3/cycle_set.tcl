
# Loop constraints
directive set /peaseNTT/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /peaseNTT/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP CSTEPS_FROM {{. == 12} {.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for CSTEPS_FROM {{. == 4} {.. == 1}}

# IO operation constraints
directive set /peaseNTT/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator>=<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>:lshift CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:tw:and CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:tw:read_mem(twiddle:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:tw_h:read_mem(twiddle_h:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:z:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:res:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:if:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(yt:rsc(1)(0).@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:f1:read_mem(xt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:f2:read_mem(xt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:tw:read_mem(twiddle:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:tw_h:read_mem(twiddle_h:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:tw:mux CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:z:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:tw_h:mux CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:res:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:if:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#1:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#1:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#1:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#1:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:write_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#1:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#1:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#1:write_mem(yt:rsc(1)(1).@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:f1:read_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:f2:read_mem(xt:rsc(0)(5).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:tw:read_mem(twiddle:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:tw_h:read_mem(twiddle_h:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:tw:mux CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:z:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:tw_h:mux CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:res:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:if:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#2:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#2:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#2:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#2:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:write_mem(yt:rsc(0)(2).@) CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#2:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#2:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#2:write_mem(yt:rsc(1)(2).@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:f1:read_mem(xt:rsc(0)(6).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:f2:read_mem(xt:rsc(0)(7).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:tw:read_mem(twiddle:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:tw_h:read_mem(twiddle_h:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:tw:mux1h CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:z:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:tw:mux1h#1 CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:t:mul CSTEPS_FROM {{.. == 2}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:z_:mul CSTEPS_FROM {{.. == 5}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:res:acc CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:if:acc#1 CSTEPS_FROM {{.. == 9}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:if:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult#3:mux CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:acc CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#3:acc#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#3:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add#3:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:write_mem(yt:rsc(0)(3).@) CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:acc#1 CSTEPS_FROM {{.. == 10}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#3:qif:acc CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub#3:mux CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly#3:write_mem(yt:rsc(1)(3).@)#1 CSTEPS_FROM {{.. == 11}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/operator+=<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(0)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(0)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(0)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(0)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(1)(0).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(1)(1).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(1)(2).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:read_mem(yt:rsc(1)(3).@) CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:mux1h CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(1).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(2).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(3).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(4).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(5).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(6).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:write_mem(xt:rsc(0)(7).@) CSTEPS_FROM {{.. == 3}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/cpyVec:for/cpyVec:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /peaseNTT/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
