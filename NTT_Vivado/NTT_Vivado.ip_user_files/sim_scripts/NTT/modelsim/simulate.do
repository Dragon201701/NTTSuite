onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_19 -L axi_mmu_v2_1_17 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.NTT xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {NTT.udo}

run -all

quit -force
