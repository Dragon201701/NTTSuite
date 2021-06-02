onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+NTT -L xil_defaultlib -L xpm -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_19 -L axi_mmu_v2_1_17 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.NTT xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {NTT.udo}

run -all

endsim

quit -force
