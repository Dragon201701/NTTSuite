
# Loop constraints
directive set /modExp/core/core:rlp CSTEPS_FROM {{. == 1}}
directive set /modExp/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /modExp/core/core:rlp/main/while CSTEPS_FROM {{. == 26} {.. == 2}}

# IO operation constraints
directive set /modExp/core/core:rlp/main/io_read(base:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/io_read(exp:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/io_read(m:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while:io_write(result:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while/while:io_read(result:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while/while:io_write(result:rsc.@)#2 CSTEPS_FROM {{.. == 25}}

# Sync operation constraints

# Real operation constraints
directive set /modExp/core/core:rlp/main/operator><64,false>:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while/while:mul CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while/while:rem CSTEPS_FROM {{.. == 4}}
directive set /modExp/core/core:rlp/main/while/while:acc CSTEPS_FROM {{.. == 1}}
directive set /modExp/core/core:rlp/main/while/operator><64,false>:acc CSTEPS_FROM {{.. == 1}}

# Probe constraints
