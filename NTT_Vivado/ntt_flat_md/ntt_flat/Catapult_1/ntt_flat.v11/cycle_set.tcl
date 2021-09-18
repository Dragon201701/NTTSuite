
# Loop constraints
directive set /ntt_flat/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /ntt_flat/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /ntt_flat/core/core:rlp/main/for CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP CSTEPS_FROM {{. == 11} {.. == 1}}

# IO operation constraints
directive set /ntt_flat/core/core:rlp/main/p:io_read(p:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/r:io_read(r:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /ntt_flat/core/core:rlp/main/for/for:read_mem(vec:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/for/for:write_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/for/for:acc CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/operator-<20,false>:acc CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/operator-<20,false>#1:acc CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/operator<<<33,true>:lshift CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/operator>><20,false>:rshift CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:g:rshift CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:k:lshift CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:k:acc CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:idx1:mul CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:idx1:acc CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:idx2:acc CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(1)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(2)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(3)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(4)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(5)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(6)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(7)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(8)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(9)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(10)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(11)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:read_mem(result:rsc(12)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f1:mux1h CSTEPS_FROM {{.. == 4}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:acc#1 CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(1)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(2)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(3)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(4)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(5)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(6)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(7)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(8)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(9)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(10)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(11)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:read_mem(result:rsc(12)(0).@) CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:f2:mux1h CSTEPS_FROM {{.. == 4}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc#1 CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:acc#1 CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:qif:acc CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_add:mux CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(0)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(1)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(2)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(3)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(4)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(5)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(6)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(7)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(8)(0).@) CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(9)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(10)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(11)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(12)(0).@) CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc#3 CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub:qif:acc CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/modulo_sub:mux CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:tf:mul CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:tf:read_mem(twiddle:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:z:mul CSTEPS_FROM {{.. == 6}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:tf_h:read_mem(twiddle_h:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:t:mul CSTEPS_FROM {{.. == 5}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:z_:mul CSTEPS_FROM {{.. == 7}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:res:acc CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:if:acc#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:if:acc CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/mult:mux CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:acc#4 CSTEPS_FROM {{.. == 3}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(0)(0).@)#1 CSTEPS_FROM {{.. == 10}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(1)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(2)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(3)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(4)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(5)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(6)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(7)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(8)(0).@)#1 CSTEPS_FROM {{.. == 8}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(9)(0).@)#1 CSTEPS_FROM {{.. == 10}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(10)(0).@)#1 CSTEPS_FROM {{.. == 10}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(11)(0).@)#1 CSTEPS_FROM {{.. == 10}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/butterFly:write_mem(result:rsc(12)(0).@)#1 CSTEPS_FROM {{.. == 10}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/INNER_LOOP/INNER_LOOP:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/STAGE_LOOP:acc CSTEPS_FROM {{.. == 2}}
directive set /ntt_flat/core/core:rlp/main/STAGE_LOOP/operator<=<20,false>:acc CSTEPS_FROM {{.. == 2}}

# Probe constraints
