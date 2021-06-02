vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_19
vlib modelsim_lib/msim/axi_mmu_v2_1_17

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 modelsim_lib/msim/axi_register_slice_v2_1_19
vmap axi_mmu_v2_1_17 modelsim_lib/msim/axi_mmu_v2_1_17

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"../../../bd/NTT/sim/NTT.v" \
"d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_axi_pcie3_0_0/NTT_axi_pcie3_0_0_sim_netlist.v" \
"d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_xbar_0/NTT_xbar_0_sim_netlist.v" \
"d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_axi_bram_ctrl_0_0/NTT_axi_bram_ctrl_0_0_sim_netlist.v" \
"d:/NTT_Xilinx/NTT_Vivado/NTT_Vivado.srcs/sources_1/bd/NTT/ip/NTT_util_ds_buf_0/NTT_util_ds_buf_0_sim_netlist.v" \
"d:/NTT_Xilinx/NTT_Vivado/NTT_Vivado.srcs/sources_1/bd/NTT/ip/NTT_auto_ds_0/NTT_auto_ds_0_sim_netlist.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19 -64 -incr "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_mmu_v2_1_17 -64 -incr "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/b5b8/hdl/axi_mmu_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/dcd4/hdl/verilog" "+incdir+../../../../../../fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ipshared/ec67/hdl" \
"../../../bd/NTT/ip/NTT_s00_mmu_0/sim/NTT_s00_mmu_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

