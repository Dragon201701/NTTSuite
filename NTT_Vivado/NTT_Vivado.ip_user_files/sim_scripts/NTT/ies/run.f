-makelib ies_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/NTT/sim/NTT.v" \
  "d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_axi_pcie3_0_0/NTT_axi_pcie3_0_0_sim_netlist.v" \
  "d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_xbar_0/NTT_xbar_0_sim_netlist.v" \
  "d:/fhe_accelerator/ntt/Vivado_proj/inplace_DIT_precomp/inplace_DIT_precomp.srcs/sources_1/bd/NTT/ip/NTT_axi_bram_ctrl_0_0/NTT_axi_bram_ctrl_0_0_sim_netlist.v" \
  "d:/NTT_Xilinx/NTT_Vivado/NTT_Vivado.srcs/sources_1/bd/NTT/ip/NTT_util_ds_buf_0/NTT_util_ds_buf_0_sim_netlist.v" \
  "d:/NTT_Xilinx/NTT_Vivado/NTT_Vivado.srcs/sources_1/bd/NTT/ip/NTT_auto_ds_0/NTT_auto_ds_0_sim_netlist.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_19 \
  "../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_mmu_v2_1_17 \
  "../../../../NTT_Vivado.srcs/sources_1/bd/NTT/ipshared/b5b8/hdl/axi_mmu_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/NTT/ip/NTT_s00_mmu_0/sim/NTT_s00_mmu_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

