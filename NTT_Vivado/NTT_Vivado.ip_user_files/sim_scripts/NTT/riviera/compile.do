vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/NTT/sim/NTT.v" \


vlog -work xil_defaultlib \
"glbl.v"

