# This Catapult LB script has been generated to expand the characterization range(es)
# of components of the Catapult base library(ies) to fit the current design
# 
# Running this script is optional but using the updated library should result in improved correlation.
# 
# Run this script in Catapult LB with the base library loaded or uncomment the "library load" command(s)
#library load /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/mgc_Xilinx-VIRTEX-uplus-3_beh.lib
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/width_a -- -CHAR_RANGE {8, 18 to 18, 27 to 27, 35 to 35, 44 to 44, 52 to 52, 61 to 61, 69 to 69}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/signd_a -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/width_b -- -CHAR_RANGE {9, 18 to 18, 27 to 27, 35 to 35, 44 to 44, 52 to 52, 61 to 61, 69 to 69}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/signd_b -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/width_z -- -CHAR_RANGE {9, 36 to 36, 45 to 45, 53 to 53, 54 to 54, 62 to 62, 70 to 70, 71 to 71, 79 to 79, 87 to 87, 88 to 88, 96 to 96, 104 to 104, 105 to 105, 113 to 113, 121 to 121, 122 to 122, 130 to 130, 136 to 136, 138 to 138}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/a_rst_active -- -CHAR_RANGE {0, 1 to 1}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/s_rst_active -- -CHAR_RANGE {0 to 0, 1}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mul_pipe/PARAMETERS/n_inreg -- -CHAR_RANGE {1, 2 to 2}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mux1hot/PARAMETERS/ctrlw -- -CHAR_RANGE {1, 4 to 32}
library set /LIBS/mgc_Xilinx-VIRTEX-uplus-3_beh/MODS/mgc_mux1hot/PARAMETERS/width -- -CHAR_RANGE {1, 4 to 32}
# The "library characterize" command below requires that: 
#   1. characterization directory set in the library exists and write accessible;
#   2. paths to technology libraries are set to correct locations;
#   3. the downstream tool used to characterize the library is available;
library characterize
