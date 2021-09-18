
//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_r_beh_v5.v 
module mgc_shift_r_v5(a,s,z);
   parameter    width_a = 4;
   parameter    signd_a = 1;
   parameter    width_s = 2;
   parameter    width_z = 8;

   input [width_a-1:0] a;
   input [width_s-1:0] s;
   output [width_z -1:0] z;

   generate
     if (signd_a)
     begin: SGNED
       assign z = fshr_u(a,s,a[width_a-1]);
     end
     else
     begin: UNSGNED
       assign z = fshr_u(a,s,1'b0);
     end
   endgenerate

   //Shift right - unsigned shift argument
   function [width_z-1:0] fshr_u;
      input [width_a-1:0] arg1;
      input [width_s-1:0] arg2;
      input sbit;
      parameter olen = width_z;
      parameter ilen = signd_a ? width_a : width_a+1;
      parameter len = (ilen >= olen) ? ilen : olen;
      reg signed [len-1:0] result;
      reg signed [len-1:0] result_t;
      begin
        result_t = $signed( {(len){sbit}} );
        result_t[width_a-1:0] = arg1;
        result = result_t >>> arg2;
        fshr_u =  result[olen-1:0];
      end
   endfunction // fshl_u

endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_shift_l_beh_v5.v 
module mgc_shift_l_v5(a,s,z);
   parameter    width_a = 4;
   parameter    signd_a = 1;
   parameter    width_s = 2;
   parameter    width_z = 8;

   input [width_a-1:0] a;
   input [width_s-1:0] s;
   output [width_z -1:0] z;

   generate
   if (signd_a)
   begin: SGNED
      assign z = fshl_u(a,s,a[width_a-1]);
   end
   else
   begin: UNSGNED
      assign z = fshl_u(a,s,1'b0);
   end
   endgenerate

   //Shift-left - unsigned shift argument one bit more
   function [width_z-1:0] fshl_u_1;
      input [width_a  :0] arg1;
      input [width_s-1:0] arg2;
      input sbit;
      parameter olen = width_z;
      parameter ilen = width_a+1;
      parameter len = (ilen >= olen) ? ilen : olen;
      reg [len-1:0] result;
      reg [len-1:0] result_t;
      begin
        result_t = {(len){sbit}};
        result_t[ilen-1:0] = arg1;
        result = result_t <<< arg2;
        fshl_u_1 =  result[olen-1:0];
      end
   endfunction // fshl_u

   //Shift-left - unsigned shift argument
   function [width_z-1:0] fshl_u;
      input [width_a-1:0] arg1;
      input [width_s-1:0] arg2;
      input sbit;
      fshl_u = fshl_u_1({sbit,arg1} ,arg2, sbit);
   endfunction // fshl_u

endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_DPRAM_RBW_DUAL.v 
// Memory Type:            BLOCK
// Operating Mode:         True Dual Port (2-Port)
// Clock Mode:             Dual Clock
// 
// RTL Code RW Resolution: RBW
// Catapult RW Resolution: RBW
// 
// HDL Work Library:       Xilinx_RAMS_lib
// Component Name:         BLOCK_DPRAM_RBW_DUAL
// Latency = 1:            RAM with no registers on inputs or outputs
//         = 2:            adds embedded register on RAM output
//         = 3:            adds fabric registers to non-clock input RAM pins
//         = 4:            adds fabric register to output (driven by embedded register from latency=2)

module BLOCK_DPRAM_RBW_DUAL #(
  parameter addr_width = 8 ,
  parameter data_width = 7 ,
  parameter depth = 256 ,
  parameter latency = 1 
  
)( adra,adrb,clka,clka_en,clkb,clkb_en,da,db,qa,qb,wea,web);

  input [addr_width-1:0] adra;
  input [addr_width-1:0] adrb;
  input  clka;
  input  clka_en;
  input  clkb;
  input  clkb_en;
  input [data_width-1:0] da;
  input [data_width-1:0] db;
  output [data_width-1:0] qa;
  output [data_width-1:0] qb;
  input  wea;
  input  web;
  
  (* ram_style = "block" *)
  reg [data_width-1:0] mem [depth-1:0];// synthesis syn_ramstyle="block"
  
  reg [data_width-1:0] ramqa;
  reg [data_width-1:0] ramqb;
  
  // Port Map
  // rwA :: ADDRESS adra CLOCK clka ENABLE clka_en DATA_IN da DATA_OUT qa WRITE_ENABLE wea
  // rwB :: ADDRESS adrb CLOCK clkb ENABLE clkb_en DATA_IN db DATA_OUT qb WRITE_ENABLE web

  generate
    // Register all non-clock inputs (latency < 3)
    if (latency > 2 ) begin
      reg [addr_width-1:0] adra_reg;
      reg [data_width-1:0] da_reg;
      reg wea_reg;
      reg [addr_width-1:0] adrb_reg;
      reg [data_width-1:0] db_reg;
      reg web_reg;
      
      always @(posedge clka) begin
        if (clka_en) begin
          adra_reg <= adra;
          da_reg <= da;
          wea_reg <= wea;
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
          adrb_reg <= adrb;
          db_reg <= db;
          web_reg <= web;
        end
      end
      
    // Access memory with registered inputs
      always @(posedge clka) begin
        if (clka_en) begin
            ramqa <= mem[adra_reg];
            if (wea_reg) begin
              mem[adra_reg] <= da_reg;
            end
        end
      end
      always @(posedge clka) begin
        if (clka_en) begin
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
            ramqb <= mem[adrb_reg];
            if (web_reg) begin
              mem[adrb_reg] <= db_reg;
            end
        end
      end
      
    end // END register inputs

    else begin
    // latency = 1||2: Access memory with non-registered inputs
      always @(posedge clka) begin
        if (clka_en) begin
            ramqa <= mem[adra];
            if (wea) begin
              mem[adra] <= da;
            end
        end
      end
      always @(posedge clka) begin
        if (clka_en) begin
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
            ramqb <= mem[adrb];
            if (web) begin
              mem[adrb] <= db;
            end
        end
      end
      
    end
  endgenerate //END input port generate 

  generate
    // latency=1: sequential RAM outputs drive module outputs
    if (latency == 1) begin
      assign qa = ramqa;
      assign qb = ramqb;
      
    end

    else if (latency == 2 || latency == 3) begin
    // latency=2: sequential (RAM output => tmp register => module output)
      reg [data_width-1:0] tmpqa;
      reg [data_width-1:0] tmpqb;
      
      always @(posedge clka) begin
        if (clka_en) begin
          tmpqa <= ramqa;
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
          tmpqb <= ramqb;
        end
      end
      
      assign qa = tmpqa;
      assign qb = tmpqb;
      
    end
    else if (latency == 4) begin
    // latency=4: (RAM => tmp1 register => tmp2 fabric register => module output)
      reg [data_width-1:0] tmp1qa;
      reg [data_width-1:0] tmp1qb;
      
      reg [data_width-1:0] tmp2qa;
      reg [data_width-1:0] tmp2qb;
      
      always @(posedge clka) begin
        if (clka_en) begin
          tmp1qa <= ramqa;
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
          tmp1qb <= ramqb;
        end
      end
      
      always @(posedge clka) begin
        if (clka_en) begin
          tmp2qa <= tmp1qa;
        end
      end
      always @(posedge clkb) begin
        if (clkb_en) begin
          tmp2qb <= tmp1qb;
        end
      end
      
      assign qa = tmp2qa;
      assign qb = tmp2qb;
      
    end
    else begin
      //Add error check if latency > 4 or add N-pipeline regs
    end
  endgenerate //END output port generate

endmodule

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Wed Sep 15 23:44:14 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [10:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [10:0] adra;
  input [21:0] adra_d;
  input clka;
  input clka_en_d;
  input clkb_en_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign clkb_en = clkb_en_d;
  assign clka_en = clka_en_d;
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[21:11]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[10:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen
    (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [13:0] radr;
  output [31:0] q_d;
  input [13:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen
    (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [13:0] radr;
  output [31:0] q_d;
  input [13:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module stockham_dit_core_core_fsm (
  clk, rst, fsm_output, for_for_C_2_tr0, for_C_0_tr0
);
  input clk;
  input rst;
  output [5:0] fsm_output;
  reg [5:0] fsm_output;
  input for_for_C_2_tr0;
  input for_C_0_tr0;


  // FSM State Type Declaration for stockham_dit_core_core_fsm_1
  parameter
    main_C_0 = 3'd0,
    for_for_C_0 = 3'd1,
    for_for_C_1 = 3'd2,
    for_for_C_2 = 3'd3,
    for_C_0 = 3'd4,
    main_C_1 = 3'd5;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : stockham_dit_core_core_fsm_1
    case (state_var)
      for_for_C_0 : begin
        fsm_output = 6'b000010;
        state_var_NS = for_for_C_1;
      end
      for_for_C_1 : begin
        fsm_output = 6'b000100;
        state_var_NS = for_for_C_2;
      end
      for_for_C_2 : begin
        fsm_output = 6'b001000;
        if ( for_for_C_2_tr0 ) begin
          state_var_NS = for_C_0;
        end
        else begin
          state_var_NS = for_for_C_0;
        end
      end
      for_C_0 : begin
        fsm_output = 6'b010000;
        if ( for_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = for_for_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 6'b100000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 6'b000001;
        state_var_NS = for_for_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_core_wait_dp
// ------------------------------------------------------------------


module stockham_dit_core_wait_dp (
  clk, yt_rsc_0_0_cgo_iro, yt_rsc_0_0_i_clka_en_d, yt_rsc_0_1_cgo_iro, yt_rsc_0_1_i_clka_en_d,
      yt_rsc_0_2_cgo_iro, yt_rsc_0_2_i_clka_en_d, yt_rsc_0_3_cgo_iro, yt_rsc_0_3_i_clka_en_d,
      yt_rsc_0_4_cgo_iro, yt_rsc_0_4_i_clka_en_d, yt_rsc_0_5_cgo_iro, yt_rsc_0_5_i_clka_en_d,
      yt_rsc_0_6_cgo_iro, yt_rsc_0_6_i_clka_en_d, yt_rsc_0_7_cgo_iro, yt_rsc_0_7_i_clka_en_d,
      mult_t_mul_cmp_z, yt_rsc_0_0_cgo, yt_rsc_0_1_cgo, yt_rsc_0_2_cgo, yt_rsc_0_3_cgo,
      yt_rsc_0_4_cgo, yt_rsc_0_5_cgo, yt_rsc_0_6_cgo, yt_rsc_0_7_cgo, mult_t_mul_cmp_z_oreg
);
  input clk;
  input yt_rsc_0_0_cgo_iro;
  output yt_rsc_0_0_i_clka_en_d;
  input yt_rsc_0_1_cgo_iro;
  output yt_rsc_0_1_i_clka_en_d;
  input yt_rsc_0_2_cgo_iro;
  output yt_rsc_0_2_i_clka_en_d;
  input yt_rsc_0_3_cgo_iro;
  output yt_rsc_0_3_i_clka_en_d;
  input yt_rsc_0_4_cgo_iro;
  output yt_rsc_0_4_i_clka_en_d;
  input yt_rsc_0_5_cgo_iro;
  output yt_rsc_0_5_i_clka_en_d;
  input yt_rsc_0_6_cgo_iro;
  output yt_rsc_0_6_i_clka_en_d;
  input yt_rsc_0_7_cgo_iro;
  output yt_rsc_0_7_i_clka_en_d;
  input [63:0] mult_t_mul_cmp_z;
  input yt_rsc_0_0_cgo;
  input yt_rsc_0_1_cgo;
  input yt_rsc_0_2_cgo;
  input yt_rsc_0_3_cgo;
  input yt_rsc_0_4_cgo;
  input yt_rsc_0_5_cgo;
  input yt_rsc_0_6_cgo;
  input yt_rsc_0_7_cgo;
  output [31:0] mult_t_mul_cmp_z_oreg;


  // Interconnect Declarations
  reg [31:0] mult_t_mul_cmp_z_oreg_pconst_63_32;


  // Interconnect Declarations for Component Instantiations 
  assign yt_rsc_0_0_i_clka_en_d = yt_rsc_0_0_cgo | yt_rsc_0_0_cgo_iro;
  assign yt_rsc_0_1_i_clka_en_d = yt_rsc_0_1_cgo | yt_rsc_0_1_cgo_iro;
  assign yt_rsc_0_2_i_clka_en_d = yt_rsc_0_2_cgo | yt_rsc_0_2_cgo_iro;
  assign yt_rsc_0_3_i_clka_en_d = yt_rsc_0_3_cgo | yt_rsc_0_3_cgo_iro;
  assign yt_rsc_0_4_i_clka_en_d = yt_rsc_0_4_cgo | yt_rsc_0_4_cgo_iro;
  assign yt_rsc_0_5_i_clka_en_d = yt_rsc_0_5_cgo | yt_rsc_0_5_cgo_iro;
  assign yt_rsc_0_6_i_clka_en_d = yt_rsc_0_6_cgo | yt_rsc_0_6_cgo_iro;
  assign yt_rsc_0_7_i_clka_en_d = yt_rsc_0_7_cgo | yt_rsc_0_7_cgo_iro;
  assign mult_t_mul_cmp_z_oreg = mult_t_mul_cmp_z_oreg_pconst_63_32;
  always @(posedge clk) begin
    mult_t_mul_cmp_z_oreg_pconst_63_32 <= mult_t_mul_cmp_z[63:32];
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_core
// ------------------------------------------------------------------


module stockham_dit_core (
  clk, rst, xt_rsc_triosy_0_0_lz, xt_rsc_triosy_0_1_lz, xt_rsc_triosy_0_2_lz, xt_rsc_triosy_0_3_lz,
      xt_rsc_triosy_0_4_lz, xt_rsc_triosy_0_5_lz, xt_rsc_triosy_0_6_lz, xt_rsc_triosy_0_7_lz,
      p_rsc_dat, p_rsc_triosy_lz, twiddle_rsc_triosy_lz, twiddle_h_rsc_triosy_lz,
      twiddle_rsci_q_d, twiddle_h_rsci_q_d, yt_rsc_0_0_i_adra_d, yt_rsc_0_0_i_clka_en_d,
      yt_rsc_0_0_i_da_d, yt_rsc_0_0_i_qa_d, yt_rsc_0_0_i_wea_d, yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_1_i_adra_d, yt_rsc_0_1_i_clka_en_d,
      yt_rsc_0_1_i_da_d, yt_rsc_0_1_i_qa_d, yt_rsc_0_1_i_wea_d, yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_2_i_adra_d, yt_rsc_0_2_i_clka_en_d,
      yt_rsc_0_2_i_da_d, yt_rsc_0_2_i_qa_d, yt_rsc_0_2_i_wea_d, yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_3_i_adra_d, yt_rsc_0_3_i_clka_en_d,
      yt_rsc_0_3_i_da_d, yt_rsc_0_3_i_qa_d, yt_rsc_0_3_i_wea_d, yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_4_i_adra_d, yt_rsc_0_4_i_clka_en_d,
      yt_rsc_0_4_i_da_d, yt_rsc_0_4_i_qa_d, yt_rsc_0_4_i_wea_d, yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_5_i_adra_d, yt_rsc_0_5_i_clka_en_d,
      yt_rsc_0_5_i_da_d, yt_rsc_0_5_i_qa_d, yt_rsc_0_5_i_wea_d, yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_6_i_adra_d, yt_rsc_0_6_i_clka_en_d,
      yt_rsc_0_6_i_da_d, yt_rsc_0_6_i_qa_d, yt_rsc_0_6_i_wea_d, yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d, yt_rsc_0_7_i_adra_d, yt_rsc_0_7_i_clka_en_d,
      yt_rsc_0_7_i_da_d, yt_rsc_0_7_i_qa_d, yt_rsc_0_7_i_wea_d, yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_0_i_adra_d, xt_rsc_0_0_i_da_d,
      xt_rsc_0_0_i_qa_d, xt_rsc_0_0_i_wea_d, xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_1_i_adra_d, xt_rsc_0_1_i_da_d,
      xt_rsc_0_1_i_qa_d, xt_rsc_0_1_i_wea_d, xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_2_i_adra_d, xt_rsc_0_2_i_da_d,
      xt_rsc_0_2_i_qa_d, xt_rsc_0_2_i_wea_d, xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_3_i_adra_d, xt_rsc_0_3_i_da_d,
      xt_rsc_0_3_i_qa_d, xt_rsc_0_3_i_wea_d, xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_4_i_adra_d, xt_rsc_0_4_i_da_d,
      xt_rsc_0_4_i_qa_d, xt_rsc_0_4_i_wea_d, xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_5_i_adra_d, xt_rsc_0_5_i_da_d,
      xt_rsc_0_5_i_qa_d, xt_rsc_0_5_i_wea_d, xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_6_i_adra_d, xt_rsc_0_6_i_da_d,
      xt_rsc_0_6_i_qa_d, xt_rsc_0_6_i_wea_d, xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d, xt_rsc_0_7_i_adra_d, xt_rsc_0_7_i_da_d,
      xt_rsc_0_7_i_qa_d, xt_rsc_0_7_i_wea_d, xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d, mult_t_mul_cmp_a, mult_t_mul_cmp_b,
      mult_t_mul_cmp_z, twiddle_rsci_radr_d_pff, twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff
);
  input clk;
  input rst;
  output xt_rsc_triosy_0_0_lz;
  output xt_rsc_triosy_0_1_lz;
  output xt_rsc_triosy_0_2_lz;
  output xt_rsc_triosy_0_3_lz;
  output xt_rsc_triosy_0_4_lz;
  output xt_rsc_triosy_0_5_lz;
  output xt_rsc_triosy_0_6_lz;
  output xt_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output twiddle_h_rsc_triosy_lz;
  input [31:0] twiddle_rsci_q_d;
  input [31:0] twiddle_h_rsci_q_d;
  output [21:0] yt_rsc_0_0_i_adra_d;
  output yt_rsc_0_0_i_clka_en_d;
  output [63:0] yt_rsc_0_0_i_da_d;
  input [63:0] yt_rsc_0_0_i_qa_d;
  output [1:0] yt_rsc_0_0_i_wea_d;
  output [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_1_i_adra_d;
  output yt_rsc_0_1_i_clka_en_d;
  output [63:0] yt_rsc_0_1_i_da_d;
  input [63:0] yt_rsc_0_1_i_qa_d;
  output [1:0] yt_rsc_0_1_i_wea_d;
  output [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_2_i_adra_d;
  output yt_rsc_0_2_i_clka_en_d;
  output [63:0] yt_rsc_0_2_i_da_d;
  input [63:0] yt_rsc_0_2_i_qa_d;
  output [1:0] yt_rsc_0_2_i_wea_d;
  output [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_3_i_adra_d;
  output yt_rsc_0_3_i_clka_en_d;
  output [63:0] yt_rsc_0_3_i_da_d;
  input [63:0] yt_rsc_0_3_i_qa_d;
  output [1:0] yt_rsc_0_3_i_wea_d;
  output [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_4_i_adra_d;
  output yt_rsc_0_4_i_clka_en_d;
  output [63:0] yt_rsc_0_4_i_da_d;
  input [63:0] yt_rsc_0_4_i_qa_d;
  output [1:0] yt_rsc_0_4_i_wea_d;
  output [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_5_i_adra_d;
  output yt_rsc_0_5_i_clka_en_d;
  output [63:0] yt_rsc_0_5_i_da_d;
  input [63:0] yt_rsc_0_5_i_qa_d;
  output [1:0] yt_rsc_0_5_i_wea_d;
  output [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_6_i_adra_d;
  output yt_rsc_0_6_i_clka_en_d;
  output [63:0] yt_rsc_0_6_i_da_d;
  input [63:0] yt_rsc_0_6_i_qa_d;
  output [1:0] yt_rsc_0_6_i_wea_d;
  output [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] yt_rsc_0_7_i_adra_d;
  output yt_rsc_0_7_i_clka_en_d;
  output [63:0] yt_rsc_0_7_i_da_d;
  input [63:0] yt_rsc_0_7_i_qa_d;
  output [1:0] yt_rsc_0_7_i_wea_d;
  output [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_0_i_adra_d;
  output [63:0] xt_rsc_0_0_i_da_d;
  input [63:0] xt_rsc_0_0_i_qa_d;
  output [1:0] xt_rsc_0_0_i_wea_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_1_i_adra_d;
  output [63:0] xt_rsc_0_1_i_da_d;
  input [63:0] xt_rsc_0_1_i_qa_d;
  output [1:0] xt_rsc_0_1_i_wea_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_2_i_adra_d;
  output [63:0] xt_rsc_0_2_i_da_d;
  input [63:0] xt_rsc_0_2_i_qa_d;
  output [1:0] xt_rsc_0_2_i_wea_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_3_i_adra_d;
  output [63:0] xt_rsc_0_3_i_da_d;
  input [63:0] xt_rsc_0_3_i_qa_d;
  output [1:0] xt_rsc_0_3_i_wea_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_4_i_adra_d;
  output [63:0] xt_rsc_0_4_i_da_d;
  input [63:0] xt_rsc_0_4_i_qa_d;
  output [1:0] xt_rsc_0_4_i_wea_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_5_i_adra_d;
  output [63:0] xt_rsc_0_5_i_da_d;
  input [63:0] xt_rsc_0_5_i_qa_d;
  output [1:0] xt_rsc_0_5_i_wea_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_6_i_adra_d;
  output [63:0] xt_rsc_0_6_i_da_d;
  input [63:0] xt_rsc_0_6_i_qa_d;
  output [1:0] xt_rsc_0_6_i_wea_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [21:0] xt_rsc_0_7_i_adra_d;
  output [63:0] xt_rsc_0_7_i_da_d;
  input [63:0] xt_rsc_0_7_i_qa_d;
  output [1:0] xt_rsc_0_7_i_wea_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [31:0] mult_t_mul_cmp_a;
  reg [31:0] mult_t_mul_cmp_a;
  output [31:0] mult_t_mul_cmp_b;
  reg [31:0] mult_t_mul_cmp_b;
  input [63:0] mult_t_mul_cmp_z;
  output [13:0] twiddle_rsci_radr_d_pff;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff;


  // Interconnect Declarations
  wire [31:0] p_rsci_idat;
  wire [31:0] mult_t_mul_cmp_z_oreg;
  wire [5:0] fsm_output;
  wire [13:0] for_for_b_for_for_b_acc_tmp;
  wire [14:0] nl_for_for_b_for_for_b_acc_tmp;
  wire [12:0] for_for_a_acc_tmp;
  wire [13:0] nl_for_for_a_acc_tmp;
  wire [12:0] operator_32_false_acc_tmp;
  wire [13:0] nl_operator_32_false_acc_tmp;
  wire and_dcpl_32;
  wire or_dcpl_3;
  wire or_tmp_7;
  wire or_tmp_9;
  wire not_tmp_21;
  wire mux_tmp_1;
  wire and_dcpl_49;
  wire or_dcpl_11;
  wire mux_tmp_2;
  wire or_dcpl_13;
  wire or_dcpl_14;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire or_dcpl_16;
  wire or_dcpl_17;
  wire and_dcpl_64;
  wire or_dcpl_18;
  wire and_dcpl_67;
  wire nor_tmp_1;
  wire or_tmp_18;
  wire nor_tmp_3;
  wire mux_tmp_4;
  wire mux_tmp_5;
  wire and_tmp_2;
  wire or_dcpl_23;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire or_dcpl_25;
  wire and_dcpl_81;
  wire and_dcpl_83;
  wire or_dcpl_27;
  wire or_tmp_28;
  wire mux_tmp_9;
  wire and_dcpl_86;
  wire and_dcpl_88;
  wire mux_tmp_10;
  wire or_dcpl_30;
  wire or_dcpl_31;
  wire and_dcpl_91;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire or_dcpl_33;
  wire or_dcpl_34;
  wire and_dcpl_98;
  wire and_dcpl_100;
  wire and_dcpl_101;
  wire or_dcpl_36;
  wire or_tmp_34;
  wire mux_tmp_13;
  wire mux_tmp_14;
  wire and_tmp_5;
  wire or_dcpl_39;
  wire and_dcpl_108;
  wire or_dcpl_41;
  wire and_dcpl_111;
  wire and_dcpl_113;
  wire or_tmp_43;
  wire mux_tmp_18;
  wire and_dcpl_116;
  wire and_dcpl_118;
  wire or_tmp_49;
  wire mux_tmp_20;
  wire or_dcpl_45;
  wire or_dcpl_46;
  wire and_dcpl_121;
  wire and_dcpl_124;
  wire and_dcpl_125;
  wire or_dcpl_48;
  wire or_dcpl_49;
  wire and_dcpl_128;
  wire and_dcpl_130;
  wire and_dcpl_131;
  wire or_tmp_53;
  wire mux_tmp_23;
  wire or_tmp_59;
  wire mux_tmp_25;
  wire mux_tmp_26;
  wire or_dcpl_54;
  wire and_dcpl_139;
  wire or_dcpl_56;
  wire and_dcpl_142;
  wire and_dcpl_144;
  wire or_tmp_64;
  wire mux_tmp_30;
  wire and_dcpl_147;
  wire and_dcpl_149;
  wire or_tmp_68;
  wire mux_tmp_32;
  wire or_dcpl_60;
  wire or_dcpl_61;
  wire and_dcpl_152;
  wire and_dcpl_156;
  wire or_dcpl_63;
  wire or_dcpl_64;
  wire and_dcpl_159;
  wire and_dcpl_161;
  wire and_dcpl_162;
  wire or_dcpl_66;
  wire nor_tmp_23;
  wire mux_tmp_35;
  wire mux_tmp_36;
  wire or_dcpl_69;
  wire or_dcpl_70;
  wire or_dcpl_71;
  wire and_dcpl_169;
  wire or_dcpl_73;
  wire and_dcpl_172;
  wire and_dcpl_174;
  wire and_dcpl_176;
  wire or_dcpl_76;
  wire or_dcpl_77;
  wire or_dcpl_78;
  wire or_tmp_75;
  wire and_dcpl_187;
  wire and_dcpl_189;
  wire or_dcpl_81;
  wire or_dcpl_82;
  wire or_tmp_78;
  wire or_dcpl_84;
  wire or_dcpl_87;
  wire or_dcpl_88;
  wire and_dcpl_203;
  wire or_dcpl_92;
  wire or_dcpl_96;
  wire or_dcpl_97;
  wire and_dcpl_216;
  wire or_dcpl_101;
  wire or_dcpl_105;
  wire and_dcpl_229;
  wire or_dcpl_109;
  reg y_3_sva;
  wire for_for_b_nor_2_cse_1;
  wire for_for_b_nor_1_cse_1;
  wire for_for_b_nor_cse_1;
  reg [12:0] for_for_t_13_0_sva_12_0;
  wire [31:0] for_for_a_lpi_3_dfm_1;
  reg [31:0] mult_res_lpi_3_dfm_1;
  reg [13:0] for_for_mul_itm;
  wire [12:0] operator_34_true_1_and_psp_sva_1;
  wire [12:0] operator_34_true_and_psp_sva_1;
  wire for_for_a_nor_2_cse_1;
  wire for_for_a_nor_1_cse_1;
  wire for_for_a_nor_cse_1;
  reg for_for_a_asn_itm;
  reg for_for_stage_0_1;
  reg for_for_stage_0;
  reg for_for_a_asn_itm_1;
  reg for_for_a_conc_2_itm_1_0;
  reg [1:0] for_for_a_conc_2_itm_1_2_1;
  reg for_for_stage_0_2;
  reg for_for_a_for_for_a_and_itm_1;
  reg for_for_a_for_for_a_and_1_itm_1;
  reg for_for_a_for_for_a_and_2_itm_1;
  reg for_for_a_for_for_a_and_3_itm_1;
  reg for_for_a_for_for_a_and_4_itm_1;
  reg for_for_a_for_for_a_and_5_itm_1;
  reg for_for_a_for_for_a_and_6_itm_1;
  reg for_for_a_for_for_a_nor_1_itm_1;
  reg for_for_a_for_for_a_and_7_itm_1;
  reg for_for_a_for_for_a_and_8_itm_1;
  reg for_for_a_for_for_a_and_9_itm_1;
  reg for_for_a_for_for_a_and_10_itm_1;
  reg for_for_a_for_for_a_and_11_itm_1;
  reg for_for_a_for_for_a_and_12_itm_1;
  reg for_for_a_for_for_a_and_13_itm_1;
  reg for_for_a_asn_itm_2;
  reg [1:0] for_for_a_conc_2_itm_2_1;
  reg [2:0] for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2;
  reg for_for_asn_5_itm_2;
  reg for_for_asn_itm_2;
  reg for_for_stage_0_3;
  reg operator_34_true_1_and_psp_sva_0;
  reg x_3_sva;
  reg for_for_asn_5_itm;
  reg for_for_asn_itm;
  reg [31:0] modulo_sub_base_sva;
  wire [32:0] nl_modulo_sub_base_sva;
  reg [31:0] p_sva;
  reg [31:0] modulo_add_base_sva;
  wire [32:0] nl_modulo_add_base_sva;
  reg [10:0] reg_for_for_acc_tdx_1_13_0_ftd;
  reg [2:0] reg_for_for_acc_tdx_1_13_0_ftd_1;
  wire or_407_ssc;
  wire or_397_ssc;
  wire or_387_ssc;
  wire or_377_ssc;
  wire or_367_ssc;
  wire or_357_ssc;
  wire or_347_ssc;
  wire or_328_ssc;
  wire or_317_ssc;
  wire or_306_ssc;
  wire or_295_ssc;
  wire or_284_ssc;
  wire or_273_ssc;
  wire or_262_ssc;
  wire or_251_ssc;
  wire for_for_b_or_13_seb;
  wire for_for_b_or_12_seb;
  wire for_for_b_or_11_seb;
  wire for_for_b_or_10_seb;
  wire for_for_b_or_9_seb;
  wire for_for_b_or_8_seb;
  wire for_for_b_or_7_seb;
  wire for_for_b_nand_seb;
  wire for_for_b_or_6_seb;
  wire for_for_b_or_5_seb;
  wire for_for_b_or_4_seb;
  wire for_for_b_or_3_seb;
  wire for_for_b_or_2_seb;
  wire for_for_b_or_1_seb;
  wire for_for_b_or_seb;
  wire y_or_cse;
  wire for_for_mux_18_cse;
  wire for_for_or_cse;
  reg reg_yt_rsc_0_0_cgo_cse;
  reg reg_yt_rsc_0_1_cgo_cse;
  reg reg_yt_rsc_0_2_cgo_cse;
  reg reg_yt_rsc_0_3_cgo_cse;
  reg reg_yt_rsc_0_4_cgo_cse;
  reg reg_yt_rsc_0_5_cgo_cse;
  reg reg_yt_rsc_0_6_cgo_cse;
  reg reg_yt_rsc_0_7_cgo_cse;
  reg reg_xt_rsc_triosy_0_7_obj_ld_cse;
  wire nor_29_cse;
  wire or_179_cse;
  wire and_979_cse;
  wire or_159_cse;
  wire nand_7_cse;
  wire or_248_rmff;
  wire [31:0] modulo_sub_qelse_mux_rmff;
  wire [31:0] modulo_add_qelse_mux_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_14_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_30_rmff;
  wire or_259_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_13_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_31_rmff;
  wire or_270_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_12_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_32_rmff;
  wire or_281_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_11_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_33_rmff;
  wire or_292_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_10_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_34_rmff;
  wire or_303_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_9_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_35_rmff;
  wire or_314_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_8_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_36_rmff;
  wire or_325_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_7_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_37_rmff;
  wire for_for_a_for_for_a_for_for_a_nor_rmff;
  wire for_for_a_for_for_a_for_for_a_nor_1_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_6_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_38_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_5_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_39_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_4_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_40_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_3_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_41_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_2_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_42_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_1_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_43_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_44_rmff;
  wire for_for_b_or_42_seb;
  wire for_for_b_or_40_seb;
  wire for_for_b_or_38_seb;
  wire for_for_b_or_36_seb;
  wire for_for_b_or_34_seb;
  wire for_for_b_or_32_seb;
  wire for_for_b_or_30_seb;
  wire for_for_b_or_28_seb;
  wire for_for_b_or_26_seb;
  wire for_for_b_or_24_seb;
  wire for_for_b_or_22_seb;
  wire for_for_b_or_20_seb;
  wire for_for_b_or_18_seb;
  wire for_for_b_or_16_seb;
  wire for_for_b_or_14_seb;
  reg [10:0] for_for_acc_tdx_1_13_0_sva_2_13_3;
  reg [10:0] for_for_acc_tdx_13_0_sva_2_13_3;
  reg [10:0] for_for_a_acc_psp_sva_1_12_2;
  reg [3:0] shift_3_0_sva;
  wire [13:0] for_for_w_lshift_itm;
  wire [12:0] for_for_w_rshift_itm;
  wire [31:0] z_out_1;
  wire [31:0] z_out_2;
  wire [31:0] z_out_3;
  wire [63:0] nl_z_out_3;
  wire [13:0] z_out_4;
  wire [14:0] nl_z_out_4;
  reg nn_7_sva;
  reg nn_8_sva;
  reg nn_6_sva;
  reg nn_9_sva;
  reg nn_5_sva;
  reg nn_10_sva;
  reg nn_4_sva;
  reg nn_11_sva;
  reg nn_3_sva;
  reg nn_12_sva;
  reg nn_2_sva;
  reg nn_13_sva;
  reg nn_1_sva;
  reg nn_14_sva;
  reg [3:0] idx_3_0_sva;
  reg [31:0] tmp_2_sva_1;
  reg [31:0] tmp_2_sva_2;
  reg [31:0] tmp_2_sva_3;
  reg [31:0] tmp_2_sva_4;
  reg [31:0] tmp_2_sva_5;
  reg [31:0] tmp_2_sva_6;
  reg [31:0] tmp_2_sva_7;
  reg [31:0] tmp_sva;
  reg [31:0] tmp_sva_1;
  reg [31:0] tmp_sva_2;
  reg [31:0] tmp_sva_3;
  reg [31:0] tmp_sva_4;
  reg [31:0] tmp_sva_5;
  reg [31:0] tmp_sva_6;
  reg [31:0] tmp_sva_7;
  reg for_for_a_for_for_a_nor_itm;
  reg for_for_a_for_for_a_and_itm;
  reg for_for_a_for_for_a_and_1_itm;
  reg for_for_a_for_for_a_and_2_itm;
  reg for_for_a_for_for_a_and_3_itm;
  reg for_for_a_for_for_a_and_4_itm;
  reg for_for_a_for_for_a_and_5_itm;
  reg for_for_a_for_for_a_and_6_itm;
  reg for_for_a_for_for_a_nor_1_itm;
  reg for_for_a_for_for_a_and_7_itm;
  reg for_for_a_for_for_a_and_8_itm;
  reg for_for_a_for_for_a_and_9_itm;
  reg for_for_a_for_for_a_and_10_itm;
  reg for_for_a_for_for_a_and_11_itm;
  reg for_for_a_for_for_a_and_12_itm;
  reg for_for_a_for_for_a_and_13_itm;
  reg for_for_b_for_for_b_nor_itm;
  reg for_for_b_for_for_b_and_itm;
  reg for_for_b_for_for_b_and_1_itm;
  reg for_for_b_for_for_b_and_2_itm;
  reg for_for_b_for_for_b_and_3_itm;
  reg for_for_b_for_for_b_and_4_itm;
  reg for_for_b_for_for_b_and_5_itm;
  reg for_for_b_for_for_b_and_6_itm;
  reg for_for_b_for_for_b_nor_1_itm;
  reg for_for_b_for_for_b_and_7_itm;
  reg for_for_b_for_for_b_and_8_itm;
  reg for_for_b_for_for_b_and_9_itm;
  reg for_for_b_for_for_b_and_10_itm;
  reg for_for_b_for_for_b_and_11_itm;
  reg for_for_b_for_for_b_and_12_itm;
  reg for_for_b_for_for_b_and_13_itm;
  reg [31:0] for_for_w_asn_2_itm;
  reg [31:0] mult_z_mul_itm;
  reg [2:0] for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm;
  reg [31:0] tmp_sva_7_1;
  reg [31:0] tmp_sva_6_1;
  reg [31:0] tmp_sva_5_1;
  reg [31:0] tmp_sva_4_1;
  reg [31:0] tmp_sva_3_1;
  reg [31:0] tmp_sva_2_1;
  reg [31:0] tmp_sva_1_1;
  reg [31:0] tmp_sva_1_2;
  reg [31:0] tmp_2_sva_7_1;
  reg [31:0] tmp_2_sva_6_1;
  reg [31:0] tmp_2_sva_5_1;
  reg [31:0] tmp_2_sva_4_1;
  reg [31:0] tmp_2_sva_3_1;
  reg [31:0] tmp_2_sva_2_1;
  reg [31:0] tmp_2_sva_1_1;
  reg for_for_a_for_for_a_nor_itm_1;
  reg for_for_a_for_for_a_nor_itm_2;
  reg for_for_a_for_for_a_and_itm_2;
  reg for_for_a_for_for_a_and_1_itm_2;
  reg for_for_a_for_for_a_and_2_itm_2;
  reg for_for_a_for_for_a_and_3_itm_2;
  reg for_for_a_for_for_a_and_4_itm_2;
  reg for_for_a_for_for_a_and_5_itm_2;
  reg for_for_a_for_for_a_and_6_itm_2;
  reg for_for_a_for_for_a_nor_1_itm_2;
  reg for_for_a_for_for_a_and_7_itm_2;
  reg for_for_a_for_for_a_and_8_itm_2;
  reg for_for_a_for_for_a_and_9_itm_2;
  reg for_for_a_for_for_a_and_10_itm_2;
  reg for_for_a_for_for_a_and_11_itm_2;
  reg for_for_a_for_for_a_and_12_itm_2;
  reg for_for_a_for_for_a_and_13_itm_2;
  reg [31:0] mult_z_mul_itm_1;
  wire [63:0] nl_mult_z_mul_itm_1;
  reg for_for_asn_itm_1;
  reg [2:0] for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1;
  reg for_for_asn_5_itm_1;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1;
  reg [10:0] for_for_acc_tdx_13_0_sva_1_13_3;
  reg [10:0] for_for_acc_tdx_1_13_0_sva_1_13_3;
  wire [3:0] idx_3_0_sva_2;
  wire [4:0] nl_idx_3_0_sva_2;
  wire xt_rsc_0_0_i_wea_d_mx0c0;
  wire [13:0] for_for_acc_tdx_13_0_sva_1;
  wire [14:0] nl_for_for_acc_tdx_13_0_sva_1;
  wire [13:0] for_for_acc_tdx_1_13_0_sva_1;
  wire [14:0] nl_for_for_acc_tdx_1_13_0_sva_1;
  reg reg_s_13_0_ftd;
  reg [12:0] reg_s_13_0_ftd_1;
  wire for_for_a_or_2_cse;
  wire or_cse;
  reg [10:0] for_for_acc_tdx_13_0_sva_13_3;
  reg [2:0] for_for_acc_tdx_13_0_sva_2_0;
  reg [10:0] for_for_a_acc_psp_sva_12_2;
  reg [1:0] for_for_a_acc_psp_sva_1_0;
  wire and_cse;
  wire z_out_32;

  wire[0:0] idx_not_1_nl;
  wire[0:0] y_not_35_nl;
  wire[3:0] operator_32_false_2_acc_nl;
  wire[4:0] nl_operator_32_false_2_acc_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] and_68_nl;
  wire[0:0] mux_17_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] nor_36_nl;
  wire[0:0] or_43_nl;
  wire[0:0] mux_21_nl;
  wire[0:0] and_109_nl;
  wire[0:0] mux_26_nl;
  wire[0:0] mux_25_nl;
  wire[0:0] and_983_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] and_141_nl;
  wire[0:0] mux_31_nl;
  wire[0:0] nor_35_nl;
  wire[0:0] or_91_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] mux_37_nl;
  wire[0:0] nor_34_nl;
  wire[0:0] or_109_nl;
  wire[0:0] mux_44_nl;
  wire[0:0] and_173_nl;
  wire[0:0] mux_43_nl;
  wire[0:0] and_982_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] or_141_nl;
  wire[0:0] for_for_b_and_1_nl;
  wire[0:0] for_for_a_mux1h_30_nl;
  wire[0:0] for_for_mux1h_28_nl;
  wire[0:0] for_for_mux1h_30_nl;
  wire[0:0] nn_mux_nl;
  wire[0:0] for_for_a_and_1_nl;
  wire[13:0] for_for_b_acc_nl;
  wire[14:0] nl_for_for_b_acc_nl;
  wire[0:0] mux_10_nl;
  wire[0:0] or_19_nl;
  wire[0:0] or_28_nl;
  wire[0:0] or_26_nl;
  wire[0:0] nor_39_nl;
  wire[0:0] or_47_nl;
  wire[0:0] or_45_nl;
  wire[0:0] mux_18_nl;
  wire[0:0] or_55_nl;
  wire[0:0] or_63_nl;
  wire[0:0] or_61_nl;
  wire[0:0] mux_22_nl;
  wire[0:0] nor_43_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_27_nl;
  wire[0:0] or_88_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] or_92_nl;
  wire[0:0] nor_38_nl;
  wire[0:0] mux_34_nl;
  wire[0:0] or_111_nl;
  wire[0:0] nor_37_nl;
  wire[0:0] or_110_nl;
  wire[0:0] mux_39_nl;
  wire[0:0] or_121_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] or_138_nl;
  wire[0:0] and_984_nl;
  wire[0:0] and_985_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] and_200_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] and_214_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] and_223_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] and_231_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] and_238_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] and_246_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] and_253_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] and_261_nl;
  wire[10:0] for_for_b_for_for_b_mux_1_nl;
  wire[10:0] for_for_b_for_for_b_mux_nl;
  wire[0:0] for_for_b_or_44_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_29_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_45_nl;
  wire[10:0] for_for_b_for_for_b_mux_3_nl;
  wire[10:0] for_for_b_for_for_b_mux_2_nl;
  wire[0:0] for_for_b_or_45_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_28_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_46_nl;
  wire[10:0] for_for_b_for_for_b_mux_5_nl;
  wire[10:0] for_for_b_for_for_b_mux_4_nl;
  wire[0:0] for_for_b_or_46_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_27_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_47_nl;
  wire[10:0] for_for_b_for_for_b_mux_7_nl;
  wire[10:0] for_for_b_for_for_b_mux_6_nl;
  wire[0:0] for_for_b_or_47_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_26_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_48_nl;
  wire[10:0] for_for_b_for_for_b_mux_9_nl;
  wire[10:0] for_for_b_for_for_b_mux_8_nl;
  wire[0:0] for_for_b_or_48_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_25_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_49_nl;
  wire[10:0] for_for_b_for_for_b_mux_11_nl;
  wire[10:0] for_for_b_for_for_b_mux_10_nl;
  wire[0:0] for_for_b_or_49_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_24_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_50_nl;
  wire[10:0] for_for_b_for_for_b_mux_13_nl;
  wire[10:0] for_for_b_for_for_b_mux_12_nl;
  wire[0:0] for_for_b_or_50_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_23_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_51_nl;
  wire[10:0] for_for_b_for_for_b_mux_15_nl;
  wire[10:0] for_for_b_for_for_b_mux_14_nl;
  wire[0:0] for_for_b_or_51_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_22_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_52_nl;
  wire[10:0] for_for_a_mux1h_114_nl;
  wire[0:0] and_554_nl;
  wire[0:0] or_344_nl;
  wire[10:0] for_for_b_for_for_b_mux_17_nl;
  wire[10:0] for_for_b_for_for_b_mux_16_nl;
  wire[0:0] for_for_b_or_52_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_21_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_53_nl;
  wire[10:0] for_for_b_for_for_b_mux_19_nl;
  wire[10:0] for_for_b_for_for_b_mux_18_nl;
  wire[0:0] for_for_b_or_53_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_20_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_54_nl;
  wire[10:0] for_for_b_for_for_b_mux_21_nl;
  wire[10:0] for_for_b_for_for_b_mux_20_nl;
  wire[0:0] for_for_b_or_54_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_19_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_55_nl;
  wire[10:0] for_for_b_for_for_b_mux_23_nl;
  wire[10:0] for_for_b_for_for_b_mux_22_nl;
  wire[0:0] for_for_b_or_55_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_18_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_56_nl;
  wire[10:0] for_for_b_for_for_b_mux_25_nl;
  wire[10:0] for_for_b_for_for_b_mux_24_nl;
  wire[0:0] for_for_b_or_56_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_17_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_57_nl;
  wire[10:0] for_for_b_for_for_b_mux_27_nl;
  wire[10:0] for_for_b_for_for_b_mux_26_nl;
  wire[0:0] for_for_b_or_57_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_16_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_58_nl;
  wire[10:0] for_for_b_for_for_b_mux_29_nl;
  wire[10:0] for_for_b_for_for_b_mux_28_nl;
  wire[0:0] for_for_b_or_58_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_15_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_59_nl;
  wire[33:0] acc_nl;
  wire[34:0] nl_acc_nl;
  wire[31:0] mult_if_mux_5_nl;
  wire[31:0] mult_if_mux_6_nl;
  wire[32:0] acc_1_nl;
  wire[33:0] nl_acc_1_nl;
  wire[31:0] mult_if_mux_7_nl;
  wire[0:0] mult_if_or_1_nl;
  wire[31:0] mult_if_mux_8_nl;
  wire[32:0] acc_2_nl;
  wire[33:0] nl_acc_2_nl;
  wire[31:0] mult_res_mux_3_nl;
  wire[31:0] mult_res_mux_4_nl;
  wire[31:0] for_for_mux_22_nl;
  wire[31:0] for_for_mux_23_nl;
  wire[12:0] for_for_mux_24_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_stockham_dit_core_core_fsm_inst_for_for_C_2_tr0;
  assign nl_stockham_dit_core_core_fsm_inst_for_for_C_2_tr0 = ~(for_for_stage_0_2
      | for_for_stage_0 | for_for_stage_0_1);
  wire [0:0] nl_stockham_dit_core_core_fsm_inst_for_C_0_tr0;
  assign nl_stockham_dit_core_core_fsm_inst_for_C_0_tr0 = ~ (z_out_4[3]);
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_7_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_7_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_6_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_6_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_5_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_5_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_4_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_4_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_3_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_3_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_2_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_2_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_1_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_1_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) xt_rsc_triosy_0_0_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(xt_rsc_triosy_0_0_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(p_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_rsc_triosy_lz)
    );
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_obj (
      .ld(reg_xt_rsc_triosy_0_7_obj_ld_cse),
      .lz(twiddle_h_rsc_triosy_lz)
    );
  mgc_shift_r_v5 #(.width_a(32'sd13),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd13)) for_for_w_rshift_rg (
      .a(operator_34_true_and_psp_sva_1),
      .s(shift_3_0_sva),
      .z(for_for_w_rshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd13),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd14)) for_for_w_lshift_rg (
      .a(for_for_w_rshift_itm),
      .s(shift_3_0_sva),
      .z(for_for_w_lshift_itm)
    );
  stockham_dit_core_wait_dp stockham_dit_core_wait_dp_inst (
      .clk(clk),
      .yt_rsc_0_0_cgo_iro(or_248_rmff),
      .yt_rsc_0_0_i_clka_en_d(yt_rsc_0_0_i_clka_en_d),
      .yt_rsc_0_1_cgo_iro(or_259_rmff),
      .yt_rsc_0_1_i_clka_en_d(yt_rsc_0_1_i_clka_en_d),
      .yt_rsc_0_2_cgo_iro(or_270_rmff),
      .yt_rsc_0_2_i_clka_en_d(yt_rsc_0_2_i_clka_en_d),
      .yt_rsc_0_3_cgo_iro(or_281_rmff),
      .yt_rsc_0_3_i_clka_en_d(yt_rsc_0_3_i_clka_en_d),
      .yt_rsc_0_4_cgo_iro(or_292_rmff),
      .yt_rsc_0_4_i_clka_en_d(yt_rsc_0_4_i_clka_en_d),
      .yt_rsc_0_5_cgo_iro(or_303_rmff),
      .yt_rsc_0_5_i_clka_en_d(yt_rsc_0_5_i_clka_en_d),
      .yt_rsc_0_6_cgo_iro(or_314_rmff),
      .yt_rsc_0_6_i_clka_en_d(yt_rsc_0_6_i_clka_en_d),
      .yt_rsc_0_7_cgo_iro(or_325_rmff),
      .yt_rsc_0_7_i_clka_en_d(yt_rsc_0_7_i_clka_en_d),
      .mult_t_mul_cmp_z(mult_t_mul_cmp_z),
      .yt_rsc_0_0_cgo(reg_yt_rsc_0_0_cgo_cse),
      .yt_rsc_0_1_cgo(reg_yt_rsc_0_1_cgo_cse),
      .yt_rsc_0_2_cgo(reg_yt_rsc_0_2_cgo_cse),
      .yt_rsc_0_3_cgo(reg_yt_rsc_0_3_cgo_cse),
      .yt_rsc_0_4_cgo(reg_yt_rsc_0_4_cgo_cse),
      .yt_rsc_0_5_cgo(reg_yt_rsc_0_5_cgo_cse),
      .yt_rsc_0_6_cgo(reg_yt_rsc_0_6_cgo_cse),
      .yt_rsc_0_7_cgo(reg_yt_rsc_0_7_cgo_cse),
      .mult_t_mul_cmp_z_oreg(mult_t_mul_cmp_z_oreg)
    );
  stockham_dit_core_core_fsm stockham_dit_core_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .for_for_C_2_tr0(nl_stockham_dit_core_core_fsm_inst_for_for_C_2_tr0[0:0]),
      .for_C_0_tr0(nl_stockham_dit_core_core_fsm_inst_for_C_0_tr0[0:0])
    );
  assign y_or_cse = (fsm_output[0]) | (fsm_output[4]);
  assign for_for_a_or_2_cse = ~((y_3_sva & (fsm_output[1])) | (fsm_output[2]));
  assign for_for_mux_18_cse = for_for_stage_0 | y_or_cse;
  assign and_cse = for_for_stage_0_1 & (fsm_output[1]);
  assign or_cse = (fsm_output[5]) | (fsm_output[0]);
  assign for_for_or_cse = (fsm_output[3]) | y_or_cse;
  assign and_68_nl = ((reg_for_for_acc_tdx_1_13_0_ftd_1!=3'b000)) & (operator_34_true_1_and_psp_sva_0
      | (for_for_a_acc_psp_sva_1_0!=2'b00)) & mux_tmp_2;
  assign mux_13_nl = MUX_s_1_2_2(mux_tmp_2, and_68_nl, and_dcpl_32);
  assign or_248_rmff = ((~ mux_tmp_1) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & for_for_a_nor_cse_1) | and_dcpl_49) & and_dcpl_32 & (fsm_output[1])) | ((~
      mux_13_nl) & (fsm_output[2]));
  assign for_for_b_or_42_seb = (~ (fsm_output[1])) | (or_dcpl_18 & or_dcpl_14) |
      or_dcpl_16;
  assign nor_36_nl = ~((reg_for_for_acc_tdx_1_13_0_ftd_1[0]) | (~ and_tmp_2));
  assign or_43_nl = (reg_for_for_acc_tdx_1_13_0_ftd_1[2:1]!=2'b00);
  assign mux_16_nl = MUX_s_1_2_2(nor_36_nl, and_tmp_2, or_43_nl);
  assign mux_17_nl = MUX_s_1_2_2(mux_tmp_5, mux_16_nl, and_dcpl_32);
  assign or_259_rmff = ((~ mux_tmp_4) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_64
      & for_for_a_nor_cse_1) | (for_for_b_nor_cse_1 & (for_for_b_for_for_b_acc_tmp[0])))
      & and_dcpl_32 & (fsm_output[1])) | ((~ mux_17_nl) & (fsm_output[2]));
  assign for_for_b_or_40_seb = (~ (fsm_output[1])) | and_dcpl_81 | or_dcpl_16;
  assign and_109_nl = ((reg_for_for_acc_tdx_1_13_0_ftd_1!=3'b010)) & (operator_34_true_1_and_psp_sva_0
      | (for_for_a_acc_psp_sva_1_0!=2'b01)) & mux_tmp_10;
  assign mux_21_nl = MUX_s_1_2_2(mux_tmp_10, and_109_nl, and_dcpl_32);
  assign or_270_rmff = ((~ mux_tmp_9) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_88) | (and_dcpl_86 & (~ (for_for_b_for_for_b_acc_tmp[0])))) & and_dcpl_32
      & (fsm_output[1])) | ((~ mux_21_nl) & (fsm_output[2]));
  assign for_for_b_or_38_seb = (~ (fsm_output[1])) | and_dcpl_98 | or_dcpl_16;
  assign and_983_nl = (~((reg_for_for_acc_tdx_1_13_0_ftd_1[1:0]==2'b11))) & and_tmp_5;
  assign mux_25_nl = MUX_s_1_2_2(and_983_nl, and_tmp_5, reg_for_for_acc_tdx_1_13_0_ftd_1[2]);
  assign mux_26_nl = MUX_s_1_2_2(mux_tmp_14, mux_25_nl, and_dcpl_32);
  assign or_281_rmff = ((~ mux_tmp_13) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_64
      & and_dcpl_88) | (and_dcpl_86 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_32
      & (fsm_output[1])) | ((~ mux_26_nl) & (fsm_output[2]));
  assign for_for_b_or_36_seb = (~ (fsm_output[1])) | and_dcpl_111 | or_dcpl_16;
  assign nor_35_nl = ~((for_for_a_acc_psp_sva_1_0[1]) | (~ mux_tmp_20));
  assign or_91_nl = operator_34_true_1_and_psp_sva_0 | (for_for_a_acc_psp_sva_1_0[0]);
  assign mux_31_nl = MUX_s_1_2_2(nor_35_nl, mux_tmp_20, or_91_nl);
  assign and_141_nl = ((reg_for_for_acc_tdx_1_13_0_ftd_1!=3'b100)) & mux_31_nl;
  assign mux_32_nl = MUX_s_1_2_2(mux_tmp_20, and_141_nl, and_dcpl_32);
  assign or_292_rmff = ((~ mux_tmp_18) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_118) | (and_dcpl_116 & (~ (for_for_b_for_for_b_acc_tmp[0])))) &
      and_dcpl_32 & (fsm_output[1])) | ((~ mux_32_nl) & (fsm_output[2]));
  assign for_for_b_or_34_seb = (~ (fsm_output[1])) | and_dcpl_128 | or_dcpl_16;
  assign nor_34_nl = ~((reg_for_for_acc_tdx_1_13_0_ftd_1[0]) | (~ mux_tmp_26));
  assign or_109_nl = (reg_for_for_acc_tdx_1_13_0_ftd_1[2:1]!=2'b10);
  assign mux_37_nl = MUX_s_1_2_2(nor_34_nl, mux_tmp_26, or_109_nl);
  assign mux_38_nl = MUX_s_1_2_2(mux_tmp_25, mux_37_nl, and_dcpl_32);
  assign or_303_rmff = ((~ mux_tmp_23) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_64
      & and_dcpl_118) | (and_dcpl_116 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_32
      & (fsm_output[1])) | ((~ mux_38_nl) & (fsm_output[2]));
  assign for_for_b_or_32_seb = (~ (fsm_output[1])) | and_dcpl_142 | or_dcpl_16;
  assign and_982_nl = (~((for_for_a_acc_psp_sva_1_0==2'b11))) & mux_tmp_32;
  assign mux_43_nl = MUX_s_1_2_2(and_982_nl, mux_tmp_32, operator_34_true_1_and_psp_sva_0);
  assign and_173_nl = ((reg_for_for_acc_tdx_1_13_0_ftd_1!=3'b110)) & mux_43_nl;
  assign mux_44_nl = MUX_s_1_2_2(mux_tmp_32, and_173_nl, and_dcpl_32);
  assign or_314_rmff = ((~ mux_tmp_30) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_149) | (and_dcpl_147 & (~ (for_for_b_for_for_b_acc_tmp[0])))) &
      and_dcpl_32 & (fsm_output[1])) | ((~ mux_44_nl) & (fsm_output[2]));
  assign for_for_b_or_30_seb = (~ (fsm_output[1])) | and_dcpl_159 | or_dcpl_16;
  assign or_141_nl = ((reg_for_for_acc_tdx_1_13_0_ftd_1==3'b111)) | (operator_34_true_1_and_psp_sva_0
      & (for_for_a_acc_psp_sva_1_0==2'b11)) | mux_tmp_36;
  assign mux_47_nl = MUX_s_1_2_2(mux_tmp_36, or_141_nl, and_dcpl_32);
  assign or_325_rmff = (mux_tmp_35 & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_64
      & and_dcpl_149) | (and_dcpl_147 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_32
      & (fsm_output[1])) | (mux_47_nl & (fsm_output[2]));
  assign for_for_b_or_28_seb = (~ (fsm_output[1])) | and_dcpl_172 | or_dcpl_16;
  assign for_for_b_or_26_seb = (~ (fsm_output[1])) | and_dcpl_81 | or_dcpl_84;
  assign for_for_b_or_24_seb = (~ (fsm_output[1])) | and_dcpl_98 | or_dcpl_84;
  assign for_for_b_or_22_seb = (~ (fsm_output[1])) | and_dcpl_111 | or_dcpl_84;
  assign for_for_b_or_20_seb = (~ (fsm_output[1])) | and_dcpl_128 | or_dcpl_84;
  assign for_for_b_or_18_seb = (~ (fsm_output[1])) | and_dcpl_142 | or_dcpl_84;
  assign for_for_b_or_16_seb = (~ (fsm_output[1])) | and_dcpl_159 | or_dcpl_84;
  assign for_for_b_or_14_seb = (~ (fsm_output[1])) | and_dcpl_172 | or_dcpl_84;
  assign nl_idx_3_0_sva_2 = idx_3_0_sva + 4'b0001;
  assign idx_3_0_sva_2 = nl_idx_3_0_sva_2[3:0];
  assign for_for_a_and_1_nl = for_for_a_for_for_a_nor_1_itm_2 & y_3_sva;
  assign for_for_a_lpi_3_dfm_1 = MUX1HOT_v_32_16_2((xt_rsc_0_0_i_qa_d[31:0]), tmp_2_sva_1,
      tmp_2_sva_2, tmp_2_sva_3, tmp_2_sva_4, tmp_2_sva_5, tmp_2_sva_6, tmp_2_sva_7,
      tmp_sva_7, tmp_sva, tmp_sva_1, tmp_sva_2, tmp_sva_3, tmp_sva_4, tmp_sva_5,
      tmp_sva_6, {for_for_a_for_for_a_nor_itm_2 , for_for_a_for_for_a_and_itm_2 ,
      for_for_a_for_for_a_and_1_itm_2 , for_for_a_for_for_a_and_2_itm_2 , for_for_a_for_for_a_and_3_itm_2
      , for_for_a_for_for_a_and_4_itm_2 , for_for_a_for_for_a_and_5_itm_2 , for_for_a_for_for_a_and_6_itm_2
      , for_for_a_and_1_nl , for_for_a_for_for_a_and_7_itm_2 , for_for_a_for_for_a_and_8_itm_2
      , for_for_a_for_for_a_and_9_itm_2 , for_for_a_for_for_a_and_10_itm_2 , for_for_a_for_for_a_and_11_itm_2
      , for_for_a_for_for_a_and_12_itm_2 , for_for_a_for_for_a_and_13_itm_2});
  assign nl_for_for_a_acc_tmp = conv_u2u_12_13(operator_34_true_1_and_psp_sva_1[12:1])
      + operator_34_true_and_psp_sva_1;
  assign for_for_a_acc_tmp = nl_for_for_a_acc_tmp[12:0];
  assign operator_34_true_1_and_psp_sva_1 = operator_32_false_acc_tmp & for_for_t_13_0_sva_12_0;
  assign nl_for_for_b_acc_nl = ({reg_s_13_0_ftd , reg_s_13_0_ftd_1}) + conv_u2u_13_14(operator_34_true_1_and_psp_sva_1);
  assign for_for_b_acc_nl = nl_for_for_b_acc_nl[13:0];
  assign nl_for_for_b_for_for_b_acc_tmp = for_for_b_acc_nl + ({operator_34_true_and_psp_sva_1
      , 1'b0});
  assign for_for_b_for_for_b_acc_tmp = nl_for_for_b_for_for_b_acc_tmp[13:0];
  assign for_for_b_nor_2_cse_1 = ~((for_for_b_for_for_b_acc_tmp[1:0]!=2'b00));
  assign for_for_b_nor_1_cse_1 = ~((for_for_b_for_for_b_acc_tmp[2]) | (for_for_b_for_for_b_acc_tmp[0]));
  assign for_for_b_nor_cse_1 = ~((for_for_b_for_for_b_acc_tmp[2:1]!=2'b00));
  assign operator_34_true_and_psp_sva_1 = (~ operator_32_false_acc_tmp) & for_for_t_13_0_sva_12_0;
  assign nl_operator_32_false_acc_tmp = reg_s_13_0_ftd_1 + 13'b1111111111111;
  assign operator_32_false_acc_tmp = nl_operator_32_false_acc_tmp[12:0];
  assign nl_for_for_acc_tdx_13_0_sva_1 = conv_u2u_13_14(operator_34_true_1_and_psp_sva_1)
      + conv_u2u_13_14(operator_34_true_and_psp_sva_1);
  assign for_for_acc_tdx_13_0_sva_1 = nl_for_for_acc_tdx_13_0_sva_1[13:0];
  assign for_for_a_nor_2_cse_1 = ~((for_for_a_acc_tmp[0]) | (operator_34_true_1_and_psp_sva_1[0]));
  assign for_for_a_nor_1_cse_1 = ~((for_for_a_acc_tmp[1]) | (operator_34_true_1_and_psp_sva_1[0]));
  assign for_for_a_nor_cse_1 = ~((for_for_a_acc_tmp[1:0]!=2'b00));
  assign nl_for_for_acc_tdx_1_13_0_sva_1 = ({for_for_acc_tdx_13_0_sva_13_3 , for_for_acc_tdx_13_0_sva_2_0})
      + for_for_mul_itm;
  assign for_for_acc_tdx_1_13_0_sva_1 = nl_for_for_acc_tdx_1_13_0_sva_1[13:0];
  assign and_dcpl_32 = for_for_stage_0_1 & y_3_sva;
  assign or_dcpl_3 = (fsm_output[2:1]!=2'b00);
  assign or_tmp_7 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b000) | (~
      for_for_asn_5_itm_2);
  assign or_tmp_9 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0]) | (~ for_for_asn_itm_2);
  assign not_tmp_21 = ~(for_for_asn_5_itm_2 | (~ or_tmp_9));
  assign or_19_nl = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b000);
  assign mux_10_nl = MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_19_nl);
  assign mux_tmp_1 = MUX_s_1_2_2(mux_10_nl, or_tmp_7, or_159_cse);
  assign and_dcpl_49 = for_for_b_nor_cse_1 & (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_11 = ~((operator_32_false_acc_tmp[0]) & (for_for_t_13_0_sva_12_0[0]));
  assign or_28_nl = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b000)
      | (~ for_for_stage_0_3);
  assign or_26_nl = (~ for_for_asn_itm_2) | (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2!=3'b000);
  assign mux_tmp_2 = MUX_s_1_2_2((~ for_for_stage_0_3), or_28_nl, or_26_nl);
  assign or_dcpl_13 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b00);
  assign or_dcpl_14 = or_dcpl_13 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_53 = ~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b00));
  assign and_dcpl_54 = for_for_asn_5_itm_2 & (~ (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]));
  assign and_dcpl_59 = ~((for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]!=2'b00));
  assign and_dcpl_60 = (~ (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0])) & for_for_stage_0_3;
  assign and_dcpl_61 = and_dcpl_60 & and_dcpl_59;
  assign or_dcpl_16 = ~(for_for_stage_0_1 & y_3_sva);
  assign or_dcpl_17 = (for_for_a_acc_tmp[1:0]!=2'b00);
  assign and_dcpl_64 = (operator_32_false_acc_tmp[0]) & (for_for_t_13_0_sva_12_0[0]);
  assign or_dcpl_18 = and_dcpl_64 | or_dcpl_17;
  assign and_dcpl_67 = for_for_a_nor_cse_1 & and_dcpl_32;
  assign nor_tmp_1 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]) & for_for_asn_5_itm_2;
  assign or_tmp_18 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b00)
      | (~ nor_tmp_1);
  assign nor_tmp_3 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0]) & for_for_asn_itm_2;
  assign nor_39_nl = ~((~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b001)
      | (~ for_for_asn_5_itm_2))) | nor_tmp_3);
  assign mux_tmp_4 = MUX_s_1_2_2(nor_39_nl, or_tmp_18, or_159_cse);
  assign or_47_nl = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b001)
      | (~ for_for_stage_0_3);
  assign or_45_nl = (~ for_for_asn_itm_2) | (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2!=3'b001);
  assign mux_tmp_5 = MUX_s_1_2_2((~ for_for_stage_0_3), or_47_nl, or_45_nl);
  assign and_tmp_2 = ((~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0!=2'b00))
      & mux_tmp_5;
  assign or_dcpl_23 = or_dcpl_13 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign and_dcpl_77 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0]) & for_for_stage_0_3;
  assign and_dcpl_78 = and_dcpl_77 & and_dcpl_59;
  assign or_dcpl_25 = or_dcpl_11 | or_dcpl_17;
  assign and_dcpl_81 = or_dcpl_25 & or_dcpl_23;
  assign and_dcpl_83 = or_dcpl_23 & and_dcpl_64;
  assign or_dcpl_27 = ~(for_for_asn_itm_2 & (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0]));
  assign or_tmp_28 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b010) | (~
      for_for_asn_5_itm_2);
  assign or_55_nl = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b010);
  assign mux_18_nl = MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_55_nl);
  assign mux_tmp_9 = MUX_s_1_2_2(or_tmp_28, mux_18_nl, nor_29_cse);
  assign and_dcpl_86 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b01);
  assign and_dcpl_88 = (for_for_a_acc_tmp[1:0]==2'b01);
  assign or_63_nl = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b010)
      | (~ for_for_stage_0_3);
  assign or_61_nl = (~ for_for_asn_itm_2) | (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2!=3'b010);
  assign mux_tmp_10 = MUX_s_1_2_2((~ for_for_stage_0_3), or_63_nl, or_61_nl);
  assign or_dcpl_30 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b01);
  assign or_dcpl_31 = or_dcpl_30 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_91 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]==2'b01);
  assign and_dcpl_94 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]==2'b01);
  assign and_dcpl_95 = and_dcpl_60 & and_dcpl_94;
  assign or_dcpl_33 = (for_for_a_acc_tmp[1:0]!=2'b01);
  assign or_dcpl_34 = and_dcpl_64 | or_dcpl_33;
  assign and_dcpl_98 = or_dcpl_34 & or_dcpl_31;
  assign and_dcpl_100 = and_dcpl_88 & and_dcpl_32;
  assign and_dcpl_101 = or_dcpl_31 & or_dcpl_11;
  assign or_dcpl_36 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]!=2'b01);
  assign or_tmp_34 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2]) | (~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[1:0]==2'b11)
      & for_for_asn_5_itm_2));
  assign nor_43_nl = ~(((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b011)
      & for_for_asn_5_itm_2) | nor_tmp_3);
  assign mux_22_nl = MUX_s_1_2_2(or_tmp_34, nor_43_nl, for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[1]);
  assign mux_tmp_13 = MUX_s_1_2_2(mux_22_nl, or_tmp_34, for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2]);
  assign nand_9_nl = ~(for_for_asn_5_itm_2 & (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b011)
      & for_for_stage_0_3);
  assign nand_10_nl = ~(for_for_asn_itm_2 & (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2==3'b011));
  assign mux_tmp_14 = MUX_s_1_2_2((~ for_for_stage_0_3), nand_9_nl, nand_10_nl);
  assign and_tmp_5 = ((~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0!=2'b01))
      & mux_tmp_14;
  assign or_dcpl_39 = or_dcpl_30 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign and_dcpl_108 = and_dcpl_77 & and_dcpl_94;
  assign or_dcpl_41 = or_dcpl_11 | or_dcpl_33;
  assign and_dcpl_111 = or_dcpl_41 & or_dcpl_39;
  assign and_dcpl_113 = or_dcpl_39 & and_dcpl_64;
  assign or_tmp_43 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b100) | (~
      for_for_asn_5_itm_2);
  assign or_88_nl = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b100);
  assign mux_27_nl = MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_88_nl);
  assign mux_tmp_18 = MUX_s_1_2_2(mux_27_nl, or_tmp_43, or_179_cse);
  assign and_dcpl_116 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b10);
  assign and_dcpl_118 = (for_for_a_acc_tmp[1:0]==2'b10);
  assign nand_7_cse = ~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2]) & for_for_stage_0_3);
  assign or_tmp_49 = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[1:0]!=2'b00)
      | nand_7_cse;
  assign mux_29_nl = MUX_s_1_2_2(or_tmp_49, (~ for_for_stage_0_3), for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2]);
  assign or_92_nl = (~ for_for_asn_itm_2) | (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[1:0]!=2'b00);
  assign mux_tmp_20 = MUX_s_1_2_2(mux_29_nl, or_tmp_49, or_92_nl);
  assign or_dcpl_45 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b10);
  assign or_dcpl_46 = or_dcpl_45 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_121 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]==2'b10);
  assign and_dcpl_124 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]==2'b10);
  assign and_dcpl_125 = and_dcpl_60 & and_dcpl_124;
  assign or_dcpl_48 = (for_for_a_acc_tmp[1:0]!=2'b10);
  assign or_dcpl_49 = and_dcpl_64 | or_dcpl_48;
  assign and_dcpl_128 = or_dcpl_49 & or_dcpl_46;
  assign and_dcpl_130 = and_dcpl_118 & and_dcpl_32;
  assign and_dcpl_131 = or_dcpl_46 & or_dcpl_11;
  assign or_tmp_53 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b10)
      | (~ nor_tmp_1);
  assign nor_38_nl = ~(((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b101)
      & for_for_asn_5_itm_2) | nor_tmp_3);
  assign mux_tmp_23 = MUX_s_1_2_2(nor_38_nl, or_tmp_53, or_179_cse);
  assign or_tmp_59 = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[1:0]!=2'b01)
      | nand_7_cse;
  assign mux_34_nl = MUX_s_1_2_2(or_tmp_59, (~ for_for_stage_0_3), for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2]);
  assign or_111_nl = (~ for_for_asn_itm_2) | (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[1:0]!=2'b01);
  assign mux_tmp_25 = MUX_s_1_2_2(mux_34_nl, or_tmp_59, or_111_nl);
  assign nor_37_nl = ~((for_for_a_acc_psp_sva_1_0[1]) | (~ mux_tmp_25));
  assign or_110_nl = (~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0[0]);
  assign mux_tmp_26 = MUX_s_1_2_2(nor_37_nl, mux_tmp_25, or_110_nl);
  assign or_dcpl_54 = or_dcpl_45 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign and_dcpl_139 = and_dcpl_77 & and_dcpl_124;
  assign or_dcpl_56 = or_dcpl_11 | or_dcpl_48;
  assign and_dcpl_142 = or_dcpl_56 & or_dcpl_54;
  assign and_dcpl_144 = or_dcpl_54 & and_dcpl_64;
  assign or_tmp_64 = ~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b110) &
      for_for_asn_5_itm_2);
  assign or_121_nl = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b110);
  assign mux_39_nl = MUX_s_1_2_2(not_tmp_21, or_tmp_9, or_121_nl);
  assign mux_tmp_30 = MUX_s_1_2_2(or_tmp_64, mux_39_nl, and_979_cse);
  assign and_dcpl_147 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b11);
  assign and_dcpl_149 = (for_for_a_acc_tmp[1:0]==2'b11);
  assign or_tmp_68 = (~ for_for_asn_5_itm_2) | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0])
      | (~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]==2'b11) & for_for_stage_0_3));
  assign mux_41_nl = MUX_s_1_2_2(or_tmp_68, (~ for_for_stage_0_3), and_979_cse);
  assign mux_tmp_32 = MUX_s_1_2_2(mux_41_nl, or_tmp_68, or_tmp_9);
  assign or_dcpl_60 = ~((for_for_b_for_for_b_acc_tmp[2:1]==2'b11));
  assign or_dcpl_61 = or_dcpl_60 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_152 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]==2'b11);
  assign and_dcpl_156 = and_dcpl_60 & and_979_cse;
  assign or_dcpl_63 = ~((for_for_a_acc_tmp[1:0]==2'b11));
  assign or_dcpl_64 = and_dcpl_64 | or_dcpl_63;
  assign and_dcpl_159 = or_dcpl_64 & or_dcpl_61;
  assign and_dcpl_161 = and_dcpl_149 & and_dcpl_32;
  assign and_dcpl_162 = or_dcpl_61 & or_dcpl_11;
  assign or_dcpl_66 = ~((for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]==2'b11));
  assign nor_tmp_23 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b111) &
      for_for_asn_5_itm_2;
  assign or_138_nl = nor_tmp_23 | nor_tmp_3;
  assign mux_tmp_35 = MUX_s_1_2_2(nor_tmp_23, or_138_nl, and_979_cse);
  assign and_984_nl = for_for_asn_5_itm_2 & (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b111)
      & for_for_stage_0_3;
  assign and_985_nl = for_for_asn_itm_2 & (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2==3'b111);
  assign mux_tmp_36 = MUX_s_1_2_2(and_984_nl, for_for_stage_0_3, and_985_nl);
  assign or_dcpl_69 = or_dcpl_60 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_70 = ~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]==2'b11));
  assign or_dcpl_71 = (~ nor_tmp_1) | or_dcpl_70;
  assign and_dcpl_169 = and_dcpl_77 & and_979_cse;
  assign or_dcpl_73 = or_dcpl_11 | or_dcpl_63;
  assign and_dcpl_172 = or_dcpl_73 & or_dcpl_69;
  assign and_dcpl_174 = or_dcpl_69 & and_dcpl_64;
  assign and_dcpl_176 = ~(for_for_asn_5_itm_2 | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]));
  assign or_dcpl_76 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b00);
  assign or_dcpl_77 = for_for_asn_5_itm_2 | (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]);
  assign or_dcpl_78 = or_dcpl_77 | or_dcpl_76;
  assign or_tmp_75 = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0]) | for_for_asn_itm_2;
  assign and_dcpl_187 = for_for_stage_0_1 & (~ y_3_sva);
  assign and_dcpl_189 = (~ for_for_asn_5_itm_2) & (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]);
  assign or_dcpl_81 = for_for_asn_5_itm_2 | (~ (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[0]));
  assign or_dcpl_82 = or_dcpl_81 | or_dcpl_76;
  assign or_tmp_78 = (~ (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[0])) | for_for_asn_itm_2;
  assign or_dcpl_84 = (~ for_for_stage_0_1) | y_3_sva;
  assign or_dcpl_87 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b01);
  assign or_dcpl_88 = or_dcpl_77 | or_dcpl_87;
  assign and_dcpl_203 = and_dcpl_88 & and_dcpl_187;
  assign or_dcpl_92 = or_dcpl_81 | or_dcpl_87;
  assign or_dcpl_96 = (for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2[2:1]!=2'b10);
  assign or_dcpl_97 = or_dcpl_77 | or_dcpl_96;
  assign and_dcpl_216 = and_dcpl_118 & and_dcpl_187;
  assign or_dcpl_101 = or_dcpl_81 | or_dcpl_96;
  assign or_dcpl_105 = or_dcpl_77 | or_dcpl_70;
  assign and_dcpl_229 = and_dcpl_149 & and_dcpl_187;
  assign or_dcpl_109 = or_dcpl_81 | or_dcpl_70;
  assign and_200_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b000) |
      for_for_asn_5_itm_2) & or_tmp_75;
  assign mux_48_nl = MUX_s_1_2_2(and_200_nl, or_dcpl_78, or_159_cse);
  assign xt_rsc_0_0_i_wea_d_mx0c0 = (~ (fsm_output[2])) | mux_48_nl | (~ for_for_stage_0_3);
  assign or_251_ssc = and_dcpl_54 & and_dcpl_53 & (fsm_output[2]);
  assign modulo_sub_qelse_mux_rmff = MUX_v_32_2_2(({1'b0 , (modulo_sub_base_sva[30:0])}),
      z_out_1, modulo_sub_base_sva[31]);
  assign modulo_add_qelse_mux_rmff = MUX_v_32_2_2(modulo_add_base_sva, z_out_2, z_out_32);
  assign or_262_ssc = nor_tmp_1 & and_dcpl_53 & (fsm_output[2]);
  assign or_273_ssc = and_dcpl_54 & and_dcpl_91 & (fsm_output[2]);
  assign or_284_ssc = (~ or_tmp_34) & (fsm_output[2]);
  assign or_295_ssc = and_dcpl_54 & and_dcpl_121 & (fsm_output[2]);
  assign or_306_ssc = nor_tmp_1 & and_dcpl_121 & (fsm_output[2]);
  assign or_317_ssc = and_dcpl_54 & and_dcpl_152 & (fsm_output[2]);
  assign or_328_ssc = nor_tmp_23 & (fsm_output[2]);
  assign or_347_ssc = and_dcpl_189 & and_dcpl_53 & (fsm_output[2]);
  assign or_357_ssc = and_dcpl_176 & and_dcpl_91 & (fsm_output[2]);
  assign or_367_ssc = and_dcpl_189 & and_dcpl_91 & (fsm_output[2]);
  assign or_377_ssc = and_dcpl_176 & and_dcpl_121 & (fsm_output[2]);
  assign or_387_ssc = and_dcpl_189 & and_dcpl_121 & (fsm_output[2]);
  assign or_397_ssc = and_dcpl_176 & and_dcpl_152 & (fsm_output[2]);
  assign or_407_ssc = and_dcpl_189 & and_dcpl_152 & (fsm_output[2]);
  assign for_for_b_for_for_b_for_for_b_nor_14_rmff = ~((or_tmp_7 & for_for_asn_itm_2
      & and_dcpl_61 & (fsm_output[2])) | for_for_b_or_13_seb);
  assign for_for_b_for_for_b_for_for_b_nor_30_rmff = ~(or_tmp_9 | or_159_cse | for_for_b_or_13_seb);
  assign for_for_b_for_for_b_for_for_b_nor_13_rmff = ~((or_tmp_18 & for_for_asn_itm_2
      & and_dcpl_78 & (fsm_output[2])) | for_for_b_or_12_seb);
  assign for_for_b_for_for_b_for_for_b_nor_31_rmff = ~(or_dcpl_27 | or_159_cse |
      for_for_b_or_12_seb);
  assign for_for_b_for_for_b_for_for_b_nor_12_rmff = ~((or_tmp_28 & for_for_asn_itm_2
      & and_dcpl_95 & (fsm_output[2])) | for_for_b_or_11_seb);
  assign for_for_b_for_for_b_for_for_b_nor_32_rmff = ~(or_tmp_9 | or_dcpl_36 | for_for_b_or_11_seb);
  assign for_for_b_for_for_b_for_for_b_nor_11_rmff = ~((or_tmp_34 & for_for_asn_itm_2
      & and_dcpl_108 & (fsm_output[2])) | for_for_b_or_10_seb);
  assign for_for_b_for_for_b_for_for_b_nor_33_rmff = ~(or_dcpl_27 | or_dcpl_36 |
      for_for_b_or_10_seb);
  assign for_for_b_for_for_b_for_for_b_nor_10_rmff = ~((or_tmp_43 & for_for_asn_itm_2
      & and_dcpl_125 & (fsm_output[2])) | for_for_b_or_9_seb);
  assign for_for_b_for_for_b_for_for_b_nor_34_rmff = ~(or_tmp_9 | or_179_cse | for_for_b_or_9_seb);
  assign for_for_b_for_for_b_for_for_b_nor_9_rmff = ~((or_tmp_53 & for_for_asn_itm_2
      & and_dcpl_139 & (fsm_output[2])) | for_for_b_or_8_seb);
  assign for_for_b_for_for_b_for_for_b_nor_35_rmff = ~(or_dcpl_27 | or_179_cse |
      for_for_b_or_8_seb);
  assign for_for_b_for_for_b_for_for_b_nor_8_rmff = ~((or_tmp_64 & for_for_asn_itm_2
      & and_dcpl_156 & (fsm_output[2])) | for_for_b_or_7_seb);
  assign for_for_b_for_for_b_for_for_b_nor_36_rmff = ~(or_tmp_9 | or_dcpl_66 | for_for_b_or_7_seb);
  assign for_for_b_for_for_b_for_for_b_nor_7_rmff = ~((or_dcpl_71 & for_for_asn_itm_2
      & and_dcpl_169 & (fsm_output[2])) | for_for_b_nand_seb);
  assign for_for_b_for_for_b_for_for_b_nor_37_rmff = ~(or_dcpl_27 | or_dcpl_66 |
      for_for_b_nand_seb);
  assign for_for_a_for_for_a_for_for_a_nor_rmff = ~(or_tmp_75 | or_159_cse | xt_rsc_0_0_i_wea_d_mx0c0);
  assign for_for_a_for_for_a_for_for_a_nor_1_rmff = ~((or_dcpl_78 & (~ for_for_asn_itm_2)
      & and_dcpl_61 & (fsm_output[2])) | xt_rsc_0_0_i_wea_d_mx0c0);
  assign for_for_b_for_for_b_for_for_b_nor_6_rmff = ~((or_dcpl_82 & (~ for_for_asn_itm_2)
      & and_dcpl_78 & (fsm_output[2])) | for_for_b_or_6_seb);
  assign for_for_b_for_for_b_for_for_b_nor_38_rmff = ~(or_tmp_78 | or_159_cse | for_for_b_or_6_seb);
  assign for_for_b_for_for_b_for_for_b_nor_5_rmff = ~((or_dcpl_88 & (~ for_for_asn_itm_2)
      & and_dcpl_95 & (fsm_output[2])) | for_for_b_or_5_seb);
  assign for_for_b_for_for_b_for_for_b_nor_39_rmff = ~(or_tmp_75 | or_dcpl_36 | for_for_b_or_5_seb);
  assign for_for_b_for_for_b_for_for_b_nor_4_rmff = ~((or_dcpl_92 & (~ for_for_asn_itm_2)
      & and_dcpl_108 & (fsm_output[2])) | for_for_b_or_4_seb);
  assign for_for_b_for_for_b_for_for_b_nor_40_rmff = ~(or_tmp_78 | or_dcpl_36 | for_for_b_or_4_seb);
  assign for_for_b_for_for_b_for_for_b_nor_3_rmff = ~((or_dcpl_97 & (~ for_for_asn_itm_2)
      & and_dcpl_125 & (fsm_output[2])) | for_for_b_or_3_seb);
  assign for_for_b_for_for_b_for_for_b_nor_41_rmff = ~(or_tmp_75 | or_179_cse | for_for_b_or_3_seb);
  assign for_for_b_for_for_b_for_for_b_nor_2_rmff = ~((or_dcpl_101 & (~ for_for_asn_itm_2)
      & and_dcpl_139 & (fsm_output[2])) | for_for_b_or_2_seb);
  assign for_for_b_for_for_b_for_for_b_nor_42_rmff = ~(or_tmp_78 | or_179_cse | for_for_b_or_2_seb);
  assign for_for_b_for_for_b_for_for_b_nor_1_rmff = ~((or_dcpl_105 & (~ for_for_asn_itm_2)
      & and_dcpl_156 & (fsm_output[2])) | for_for_b_or_1_seb);
  assign for_for_b_for_for_b_for_for_b_nor_43_rmff = ~(or_tmp_75 | or_dcpl_66 | for_for_b_or_1_seb);
  assign for_for_b_for_for_b_for_for_b_nor_rmff = ~((or_dcpl_109 & (~ for_for_asn_itm_2)
      & and_dcpl_169 & (fsm_output[2])) | for_for_b_or_seb);
  assign for_for_b_for_for_b_for_for_b_nor_44_rmff = ~(or_tmp_78 | or_dcpl_66 | for_for_b_or_seb);
  assign for_for_b_or_13_seb = (~ (fsm_output[2])) | mux_tmp_1 | (~ for_for_stage_0_3);
  assign for_for_b_or_12_seb = (~ (fsm_output[2])) | mux_tmp_4 | (~ for_for_stage_0_3);
  assign for_for_b_or_11_seb = (~ (fsm_output[2])) | mux_tmp_9 | (~ for_for_stage_0_3);
  assign for_for_b_or_10_seb = (~ (fsm_output[2])) | mux_tmp_13 | (~ for_for_stage_0_3);
  assign for_for_b_or_9_seb = (~ (fsm_output[2])) | mux_tmp_18 | (~ for_for_stage_0_3);
  assign for_for_b_or_8_seb = (~ (fsm_output[2])) | mux_tmp_23 | (~ for_for_stage_0_3);
  assign for_for_b_or_7_seb = (~ (fsm_output[2])) | mux_tmp_30 | (~ for_for_stage_0_3);
  assign for_for_b_nand_seb = ~((fsm_output[2]) & mux_tmp_35 & for_for_stage_0_3);
  assign or_159_cse = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]!=2'b00);
  assign and_214_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b001) |
      for_for_asn_5_itm_2) & or_tmp_78;
  assign mux_49_nl = MUX_s_1_2_2(and_214_nl, or_dcpl_82, or_159_cse);
  assign for_for_b_or_6_seb = (~ (fsm_output[2])) | mux_49_nl | (~ for_for_stage_0_3);
  assign nor_29_cse = ~((for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]!=2'b01));
  assign and_223_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b010) |
      for_for_asn_5_itm_2) & or_tmp_75;
  assign mux_50_nl = MUX_s_1_2_2(or_dcpl_88, and_223_nl, nor_29_cse);
  assign for_for_b_or_5_seb = (~ (fsm_output[2])) | mux_50_nl | (~ for_for_stage_0_3);
  assign and_231_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b011) |
      for_for_asn_5_itm_2) & or_tmp_78;
  assign mux_51_nl = MUX_s_1_2_2(or_dcpl_92, and_231_nl, nor_29_cse);
  assign for_for_b_or_4_seb = (~ (fsm_output[2])) | mux_51_nl | (~ for_for_stage_0_3);
  assign or_179_cse = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]!=2'b10);
  assign and_238_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b100) |
      for_for_asn_5_itm_2) & or_tmp_75;
  assign mux_52_nl = MUX_s_1_2_2(and_238_nl, or_dcpl_97, or_179_cse);
  assign for_for_b_or_3_seb = (~ (fsm_output[2])) | mux_52_nl | (~ for_for_stage_0_3);
  assign and_246_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b101) |
      for_for_asn_5_itm_2) & or_tmp_78;
  assign mux_53_nl = MUX_s_1_2_2(and_246_nl, or_dcpl_101, or_179_cse);
  assign for_for_b_or_2_seb = (~ (fsm_output[2])) | mux_53_nl | (~ for_for_stage_0_3);
  assign and_979_cse = (for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2[2:1]==2'b11);
  assign and_253_nl = ((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2!=3'b110) |
      for_for_asn_5_itm_2) & or_tmp_75;
  assign mux_54_nl = MUX_s_1_2_2(or_dcpl_105, and_253_nl, and_979_cse);
  assign for_for_b_or_1_seb = (~ (fsm_output[2])) | mux_54_nl | (~ for_for_stage_0_3);
  assign and_261_nl = (~((for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2==3'b111)
      & (~ for_for_asn_5_itm_2))) & or_tmp_78;
  assign mux_55_nl = MUX_s_1_2_2(or_dcpl_109, and_261_nl, and_979_cse);
  assign for_for_b_or_seb = (~ (fsm_output[2])) | mux_55_nl | (~ for_for_stage_0_3);
  assign twiddle_rsci_radr_d_pff = for_for_w_lshift_itm;
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff = and_cse;
  assign for_for_b_for_for_b_mux_1_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_251_ssc);
  assign for_for_b_or_44_nl = or_251_ssc | (or_tmp_7 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_44_nl);
  assign yt_rsc_0_0_i_adra_d = {for_for_b_for_for_b_mux_1_nl , for_for_b_for_for_b_mux_nl};
  assign yt_rsc_0_0_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_0_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_14_rmff , for_for_b_for_for_b_for_for_b_nor_30_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_29_nl = ~((or_dcpl_14 & or_dcpl_11 & and_dcpl_67
      & (fsm_output[1])) | for_for_b_or_42_seb);
  assign for_for_b_for_for_b_for_for_b_nor_45_nl = ~(or_dcpl_18 | for_for_b_or_42_seb);
  assign yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_29_nl
      , for_for_b_for_for_b_for_for_b_nor_45_nl};
  assign yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_14_rmff
      , for_for_b_for_for_b_for_for_b_nor_30_rmff};
  assign for_for_b_for_for_b_mux_3_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_262_ssc);
  assign for_for_b_or_45_nl = or_262_ssc | (or_tmp_18 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_2_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_45_nl);
  assign yt_rsc_0_1_i_adra_d = {for_for_b_for_for_b_mux_3_nl , for_for_b_for_for_b_mux_2_nl};
  assign yt_rsc_0_1_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_1_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_13_rmff , for_for_b_for_for_b_for_for_b_nor_31_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_28_nl = ~((and_dcpl_83 & and_dcpl_67 &
      (fsm_output[1])) | for_for_b_or_40_seb);
  assign for_for_b_for_for_b_for_for_b_nor_46_nl = ~(or_dcpl_25 | for_for_b_or_40_seb);
  assign yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_28_nl
      , for_for_b_for_for_b_for_for_b_nor_46_nl};
  assign yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_13_rmff
      , for_for_b_for_for_b_for_for_b_nor_31_rmff};
  assign for_for_b_for_for_b_mux_5_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_273_ssc);
  assign for_for_b_or_46_nl = or_273_ssc | (or_tmp_28 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_4_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_46_nl);
  assign yt_rsc_0_2_i_adra_d = {for_for_b_for_for_b_mux_5_nl , for_for_b_for_for_b_mux_4_nl};
  assign yt_rsc_0_2_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_2_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_12_rmff , for_for_b_for_for_b_for_for_b_nor_32_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_27_nl = ~((and_dcpl_101 & and_dcpl_100
      & (fsm_output[1])) | for_for_b_or_38_seb);
  assign for_for_b_for_for_b_for_for_b_nor_47_nl = ~(or_dcpl_34 | for_for_b_or_38_seb);
  assign yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_27_nl
      , for_for_b_for_for_b_for_for_b_nor_47_nl};
  assign yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_12_rmff
      , for_for_b_for_for_b_for_for_b_nor_32_rmff};
  assign for_for_b_for_for_b_mux_7_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_284_ssc);
  assign for_for_b_or_47_nl = or_284_ssc | (or_tmp_34 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_6_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_47_nl);
  assign yt_rsc_0_3_i_adra_d = {for_for_b_for_for_b_mux_7_nl , for_for_b_for_for_b_mux_6_nl};
  assign yt_rsc_0_3_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_3_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_11_rmff , for_for_b_for_for_b_for_for_b_nor_33_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_26_nl = ~((and_dcpl_113 & and_dcpl_100
      & (fsm_output[1])) | for_for_b_or_36_seb);
  assign for_for_b_for_for_b_for_for_b_nor_48_nl = ~(or_dcpl_41 | for_for_b_or_36_seb);
  assign yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_26_nl
      , for_for_b_for_for_b_for_for_b_nor_48_nl};
  assign yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_11_rmff
      , for_for_b_for_for_b_for_for_b_nor_33_rmff};
  assign for_for_b_for_for_b_mux_9_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_295_ssc);
  assign for_for_b_or_48_nl = or_295_ssc | (or_tmp_43 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_8_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]), for_for_acc_tdx_13_0_sva_2_13_3,
      for_for_b_or_48_nl);
  assign yt_rsc_0_4_i_adra_d = {for_for_b_for_for_b_mux_9_nl , for_for_b_for_for_b_mux_8_nl};
  assign yt_rsc_0_4_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_4_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_10_rmff , for_for_b_for_for_b_for_for_b_nor_34_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_25_nl = ~((and_dcpl_131 & and_dcpl_130
      & (fsm_output[1])) | for_for_b_or_34_seb);
  assign for_for_b_for_for_b_for_for_b_nor_49_nl = ~(or_dcpl_49 | for_for_b_or_34_seb);
  assign yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_25_nl
      , for_for_b_for_for_b_for_for_b_nor_49_nl};
  assign yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_10_rmff
      , for_for_b_for_for_b_for_for_b_nor_34_rmff};
  assign for_for_b_for_for_b_mux_11_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_306_ssc);
  assign for_for_b_or_49_nl = or_306_ssc | (or_tmp_53 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_10_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_49_nl);
  assign yt_rsc_0_5_i_adra_d = {for_for_b_for_for_b_mux_11_nl , for_for_b_for_for_b_mux_10_nl};
  assign yt_rsc_0_5_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_5_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_9_rmff , for_for_b_for_for_b_for_for_b_nor_35_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_24_nl = ~((and_dcpl_144 & and_dcpl_130
      & (fsm_output[1])) | for_for_b_or_32_seb);
  assign for_for_b_for_for_b_for_for_b_nor_50_nl = ~(or_dcpl_56 | for_for_b_or_32_seb);
  assign yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_24_nl
      , for_for_b_for_for_b_for_for_b_nor_50_nl};
  assign yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_9_rmff
      , for_for_b_for_for_b_for_for_b_nor_35_rmff};
  assign for_for_b_for_for_b_mux_13_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_317_ssc);
  assign for_for_b_or_50_nl = or_317_ssc | (or_tmp_64 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_12_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_50_nl);
  assign yt_rsc_0_6_i_adra_d = {for_for_b_for_for_b_mux_13_nl , for_for_b_for_for_b_mux_12_nl};
  assign yt_rsc_0_6_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_6_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_8_rmff , for_for_b_for_for_b_for_for_b_nor_36_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_23_nl = ~((and_dcpl_162 & and_dcpl_161
      & (fsm_output[1])) | for_for_b_or_30_seb);
  assign for_for_b_for_for_b_for_for_b_nor_51_nl = ~(or_dcpl_64 | for_for_b_or_30_seb);
  assign yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_23_nl
      , for_for_b_for_for_b_for_for_b_nor_51_nl};
  assign yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_8_rmff
      , for_for_b_for_for_b_for_for_b_nor_36_rmff};
  assign for_for_b_for_for_b_mux_15_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_328_ssc);
  assign for_for_b_or_51_nl = or_328_ssc | (or_dcpl_71 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_14_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_51_nl);
  assign yt_rsc_0_7_i_adra_d = {for_for_b_for_for_b_mux_15_nl , for_for_b_for_for_b_mux_14_nl};
  assign yt_rsc_0_7_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_7_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_7_rmff , for_for_b_for_for_b_for_for_b_nor_37_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_22_nl = ~((and_dcpl_174 & and_dcpl_161
      & (fsm_output[1])) | for_for_b_or_28_seb);
  assign for_for_b_for_for_b_for_for_b_nor_52_nl = ~(or_dcpl_73 | for_for_b_or_28_seb);
  assign yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_22_nl
      , for_for_b_for_for_b_for_for_b_nor_52_nl};
  assign yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_7_rmff
      , for_for_b_for_for_b_for_for_b_nor_37_rmff};
  assign and_554_nl = and_dcpl_176 & and_dcpl_53 & (fsm_output[2]);
  assign for_for_a_mux1h_114_nl = MUX1HOT_v_11_3_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, for_for_a_acc_psp_sva_1_12_2, {(fsm_output[1])
      , and_554_nl , (fsm_output[3])});
  assign xt_rsc_0_0_i_adra_d = {for_for_acc_tdx_13_0_sva_2_13_3 , for_for_a_mux1h_114_nl};
  assign xt_rsc_0_0_i_da_d = {modulo_add_qelse_mux_rmff , modulo_sub_qelse_mux_rmff};
  assign xt_rsc_0_0_i_wea_d = {for_for_a_for_for_a_for_for_a_nor_rmff , for_for_a_for_for_a_for_for_a_nor_1_rmff};
  assign or_344_nl = (for_for_stage_0_2 & (~ for_for_a_asn_itm_1) & (~ (for_for_a_conc_2_itm_1_2_1[1]))
      & (~((for_for_a_conc_2_itm_1_2_1[0]) | for_for_a_conc_2_itm_1_0)) & (fsm_output[3]))
      | (and_dcpl_49 & and_dcpl_187 & (fsm_output[1]));
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = {1'b0 , or_344_nl};
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_a_for_for_a_for_for_a_nor_rmff
      , for_for_a_for_for_a_for_for_a_nor_1_rmff};
  assign for_for_b_for_for_b_mux_17_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_347_ssc);
  assign for_for_b_or_52_nl = or_347_ssc | (or_dcpl_82 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_16_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_52_nl);
  assign xt_rsc_0_1_i_adra_d = {for_for_b_for_for_b_mux_17_nl , for_for_b_for_for_b_mux_16_nl};
  assign xt_rsc_0_1_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_1_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_6_rmff , for_for_b_for_for_b_for_for_b_nor_38_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_21_nl = ~((and_dcpl_83 & for_for_a_nor_cse_1
      & and_dcpl_187 & (fsm_output[1])) | for_for_b_or_26_seb);
  assign for_for_b_for_for_b_for_for_b_nor_53_nl = ~(or_dcpl_25 | for_for_b_or_26_seb);
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_21_nl
      , for_for_b_for_for_b_for_for_b_nor_53_nl};
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_6_rmff
      , for_for_b_for_for_b_for_for_b_nor_38_rmff};
  assign for_for_b_for_for_b_mux_19_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_357_ssc);
  assign for_for_b_or_53_nl = or_357_ssc | (or_dcpl_88 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_18_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_53_nl);
  assign xt_rsc_0_2_i_adra_d = {for_for_b_for_for_b_mux_19_nl , for_for_b_for_for_b_mux_18_nl};
  assign xt_rsc_0_2_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_2_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_5_rmff , for_for_b_for_for_b_for_for_b_nor_39_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_20_nl = ~((and_dcpl_101 & and_dcpl_203
      & (fsm_output[1])) | for_for_b_or_24_seb);
  assign for_for_b_for_for_b_for_for_b_nor_54_nl = ~(or_dcpl_34 | for_for_b_or_24_seb);
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_20_nl
      , for_for_b_for_for_b_for_for_b_nor_54_nl};
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_5_rmff
      , for_for_b_for_for_b_for_for_b_nor_39_rmff};
  assign for_for_b_for_for_b_mux_21_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_367_ssc);
  assign for_for_b_or_54_nl = or_367_ssc | (or_dcpl_92 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_20_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_54_nl);
  assign xt_rsc_0_3_i_adra_d = {for_for_b_for_for_b_mux_21_nl , for_for_b_for_for_b_mux_20_nl};
  assign xt_rsc_0_3_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_3_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_4_rmff , for_for_b_for_for_b_for_for_b_nor_40_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_19_nl = ~((and_dcpl_113 & and_dcpl_203
      & (fsm_output[1])) | for_for_b_or_22_seb);
  assign for_for_b_for_for_b_for_for_b_nor_55_nl = ~(or_dcpl_41 | for_for_b_or_22_seb);
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_19_nl
      , for_for_b_for_for_b_for_for_b_nor_55_nl};
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_4_rmff
      , for_for_b_for_for_b_for_for_b_nor_40_rmff};
  assign for_for_b_for_for_b_mux_23_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_377_ssc);
  assign for_for_b_or_55_nl = or_377_ssc | (or_dcpl_97 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_22_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_55_nl);
  assign xt_rsc_0_4_i_adra_d = {for_for_b_for_for_b_mux_23_nl , for_for_b_for_for_b_mux_22_nl};
  assign xt_rsc_0_4_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_4_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_3_rmff , for_for_b_for_for_b_for_for_b_nor_41_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_18_nl = ~((and_dcpl_131 & and_dcpl_216
      & (fsm_output[1])) | for_for_b_or_20_seb);
  assign for_for_b_for_for_b_for_for_b_nor_56_nl = ~(or_dcpl_49 | for_for_b_or_20_seb);
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_18_nl
      , for_for_b_for_for_b_for_for_b_nor_56_nl};
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_3_rmff
      , for_for_b_for_for_b_for_for_b_nor_41_rmff};
  assign for_for_b_for_for_b_mux_25_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_387_ssc);
  assign for_for_b_or_56_nl = or_387_ssc | (or_dcpl_101 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_24_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_56_nl);
  assign xt_rsc_0_5_i_adra_d = {for_for_b_for_for_b_mux_25_nl , for_for_b_for_for_b_mux_24_nl};
  assign xt_rsc_0_5_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_5_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_2_rmff , for_for_b_for_for_b_for_for_b_nor_42_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_17_nl = ~((and_dcpl_144 & and_dcpl_216
      & (fsm_output[1])) | for_for_b_or_18_seb);
  assign for_for_b_for_for_b_for_for_b_nor_57_nl = ~(or_dcpl_56 | for_for_b_or_18_seb);
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_17_nl
      , for_for_b_for_for_b_for_for_b_nor_57_nl};
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_2_rmff
      , for_for_b_for_for_b_for_for_b_nor_42_rmff};
  assign for_for_b_for_for_b_mux_27_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_397_ssc);
  assign for_for_b_or_57_nl = or_397_ssc | (or_dcpl_105 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_26_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_57_nl);
  assign xt_rsc_0_6_i_adra_d = {for_for_b_for_for_b_mux_27_nl , for_for_b_for_for_b_mux_26_nl};
  assign xt_rsc_0_6_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_6_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_1_rmff , for_for_b_for_for_b_for_for_b_nor_43_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_16_nl = ~((and_dcpl_162 & and_dcpl_229
      & (fsm_output[1])) | for_for_b_or_16_seb);
  assign for_for_b_for_for_b_for_for_b_nor_58_nl = ~(or_dcpl_64 | for_for_b_or_16_seb);
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_16_nl
      , for_for_b_for_for_b_for_for_b_nor_58_nl};
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_1_rmff
      , for_for_b_for_for_b_for_for_b_nor_43_rmff};
  assign for_for_b_for_for_b_mux_29_nl = MUX_v_11_2_2((for_for_b_for_for_b_acc_tmp[13:3]),
      for_for_acc_tdx_1_13_0_sva_2_13_3, or_407_ssc);
  assign for_for_b_or_58_nl = or_407_ssc | (or_dcpl_109 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_28_nl = MUX_v_11_2_2((for_for_a_acc_tmp[12:2]),
      for_for_acc_tdx_13_0_sva_2_13_3, for_for_b_or_58_nl);
  assign xt_rsc_0_7_i_adra_d = {for_for_b_for_for_b_mux_29_nl , for_for_b_for_for_b_mux_28_nl};
  assign xt_rsc_0_7_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_7_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_rmff , for_for_b_for_for_b_for_for_b_nor_44_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_15_nl = ~((and_dcpl_174 & and_dcpl_229
      & (fsm_output[1])) | for_for_b_or_14_seb);
  assign for_for_b_for_for_b_for_for_b_nor_59_nl = ~(or_dcpl_73 | for_for_b_or_14_seb);
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_15_nl
      , for_for_b_for_for_b_for_for_b_nor_59_nl};
  assign xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_rmff
      , for_for_b_for_for_b_for_for_b_nor_44_rmff};
  always @(posedge clk) begin
    if ( for_for_stage_0_2 ) begin
      mult_res_lpi_3_dfm_1 <= MUX_v_32_2_2(z_out_1, z_out_2, z_out_32);
      mult_z_mul_itm <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_nor_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_1_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_2_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_3_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_4_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_5_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_6_itm_2 <= 1'b0;
      for_for_a_for_for_a_nor_1_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_7_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_8_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_9_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_10_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_11_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_12_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_13_itm_2 <= 1'b0;
      for_for_stage_0 <= 1'b0;
      reg_yt_rsc_0_0_cgo_cse <= 1'b0;
      reg_yt_rsc_0_1_cgo_cse <= 1'b0;
      reg_yt_rsc_0_2_cgo_cse <= 1'b0;
      reg_yt_rsc_0_3_cgo_cse <= 1'b0;
      reg_yt_rsc_0_4_cgo_cse <= 1'b0;
      reg_yt_rsc_0_5_cgo_cse <= 1'b0;
      reg_yt_rsc_0_6_cgo_cse <= 1'b0;
      reg_yt_rsc_0_7_cgo_cse <= 1'b0;
      reg_xt_rsc_triosy_0_7_obj_ld_cse <= 1'b0;
      for_for_a_asn_itm <= 1'b0;
      for_for_asn_5_itm <= 1'b0;
      for_for_asn_itm <= 1'b0;
      for_for_a_acc_psp_sva_1_0 <= 2'b00;
      operator_34_true_1_and_psp_sva_0 <= 1'b0;
      for_for_acc_tdx_13_0_sva_2_0 <= 3'b000;
      reg_for_for_acc_tdx_1_13_0_ftd <= 11'b00000000000;
      reg_for_for_acc_tdx_1_13_0_ftd_1 <= 3'b000;
    end
    else begin
      for_for_a_for_for_a_nor_itm_2 <= for_for_a_for_for_a_nor_itm_1;
      for_for_a_for_for_a_and_itm_2 <= for_for_a_for_for_a_and_itm_1;
      for_for_a_for_for_a_and_1_itm_2 <= for_for_a_for_for_a_and_1_itm_1;
      for_for_a_for_for_a_and_2_itm_2 <= for_for_a_for_for_a_and_2_itm_1;
      for_for_a_for_for_a_and_3_itm_2 <= for_for_a_for_for_a_and_3_itm_1;
      for_for_a_for_for_a_and_4_itm_2 <= for_for_a_for_for_a_and_4_itm_1;
      for_for_a_for_for_a_and_5_itm_2 <= for_for_a_for_for_a_and_5_itm_1;
      for_for_a_for_for_a_and_6_itm_2 <= for_for_a_for_for_a_and_6_itm_1;
      for_for_a_for_for_a_nor_1_itm_2 <= for_for_a_for_for_a_nor_1_itm_1;
      for_for_a_for_for_a_and_7_itm_2 <= for_for_a_for_for_a_and_7_itm_1;
      for_for_a_for_for_a_and_8_itm_2 <= for_for_a_for_for_a_and_8_itm_1;
      for_for_a_for_for_a_and_9_itm_2 <= for_for_a_for_for_a_and_9_itm_1;
      for_for_a_for_for_a_and_10_itm_2 <= for_for_a_for_for_a_and_10_itm_1;
      for_for_a_for_for_a_and_11_itm_2 <= for_for_a_for_for_a_and_11_itm_1;
      for_for_a_for_for_a_and_12_itm_2 <= for_for_a_for_for_a_and_12_itm_1;
      for_for_a_for_for_a_and_13_itm_2 <= for_for_a_for_for_a_and_13_itm_1;
      for_for_stage_0 <= for_for_mux_18_cse & (~((fsm_output[5]) | (for_for_stage_0_1
          & (z_out_4[13]) & (fsm_output[1]))));
      reg_yt_rsc_0_0_cgo_cse <= or_248_rmff;
      reg_yt_rsc_0_1_cgo_cse <= or_259_rmff;
      reg_yt_rsc_0_2_cgo_cse <= or_270_rmff;
      reg_yt_rsc_0_3_cgo_cse <= or_281_rmff;
      reg_yt_rsc_0_4_cgo_cse <= or_292_rmff;
      reg_yt_rsc_0_5_cgo_cse <= or_303_rmff;
      reg_yt_rsc_0_6_cgo_cse <= or_314_rmff;
      reg_yt_rsc_0_7_cgo_cse <= or_325_rmff;
      reg_xt_rsc_triosy_0_7_obj_ld_cse <= (~ (z_out_4[3])) & (fsm_output[4]);
      for_for_a_asn_itm <= for_for_a_mux1h_30_nl & (~ or_cse);
      for_for_asn_5_itm <= for_for_mux1h_28_nl | or_cse;
      for_for_asn_itm <= for_for_mux1h_30_nl | or_cse;
      for_for_a_acc_psp_sva_1_0 <= for_for_a_acc_tmp[1:0];
      operator_34_true_1_and_psp_sva_0 <= operator_34_true_1_and_psp_sva_1[0];
      for_for_acc_tdx_13_0_sva_2_0 <= for_for_acc_tdx_13_0_sva_1[2:0];
      reg_for_for_acc_tdx_1_13_0_ftd <= for_for_acc_tdx_1_13_0_sva_1[13:3];
      reg_for_for_acc_tdx_1_13_0_ftd_1 <= for_for_b_for_for_b_acc_tmp[2:0];
    end
  end
  always @(posedge clk) begin
    mult_t_mul_cmp_b <= twiddle_h_rsci_q_d;
    nn_14_sva <= nn_mux_nl & (~ or_cse);
    tmp_2_sva_1 <= MUX1HOT_v_32_3_2(mult_t_mul_cmp_z_oreg, (xt_rsc_0_1_i_qa_d[31:0]),
        tmp_2_sva_1_1, {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3])});
    tmp_2_sva_2 <= MUX_v_32_2_2((xt_rsc_0_2_i_qa_d[31:0]), tmp_2_sva_2_1, fsm_output[3]);
    tmp_2_sva_3 <= MUX_v_32_2_2((xt_rsc_0_3_i_qa_d[31:0]), tmp_2_sva_3_1, fsm_output[3]);
    tmp_2_sva_4 <= MUX_v_32_2_2((xt_rsc_0_4_i_qa_d[31:0]), tmp_2_sva_4_1, fsm_output[3]);
    tmp_2_sva_5 <= MUX_v_32_2_2((xt_rsc_0_5_i_qa_d[31:0]), tmp_2_sva_5_1, fsm_output[3]);
    tmp_2_sva_6 <= MUX_v_32_2_2((xt_rsc_0_6_i_qa_d[31:0]), tmp_2_sva_6_1, fsm_output[3]);
    tmp_2_sva_7 <= MUX_v_32_2_2((xt_rsc_0_7_i_qa_d[31:0]), tmp_2_sva_7_1, fsm_output[3]);
    tmp_sva <= MUX_v_32_2_2((yt_rsc_0_0_i_qa_d[31:0]), tmp_sva_1_1, fsm_output[3]);
    tmp_sva_1 <= MUX_v_32_2_2((yt_rsc_0_1_i_qa_d[31:0]), tmp_sva_2_1, fsm_output[3]);
    tmp_sva_2 <= MUX_v_32_2_2((yt_rsc_0_2_i_qa_d[31:0]), tmp_sva_3_1, fsm_output[3]);
    tmp_sva_3 <= MUX_v_32_2_2((yt_rsc_0_3_i_qa_d[31:0]), tmp_sva_4_1, fsm_output[3]);
    tmp_sva_4 <= MUX_v_32_2_2((yt_rsc_0_4_i_qa_d[31:0]), tmp_sva_5_1, fsm_output[3]);
    tmp_sva_5 <= MUX_v_32_2_2((yt_rsc_0_5_i_qa_d[31:0]), tmp_sva_6_1, fsm_output[3]);
    tmp_sva_6 <= MUX_v_32_2_2((yt_rsc_0_6_i_qa_d[31:0]), tmp_sva_7_1, fsm_output[3]);
    tmp_sva_7 <= MUX_v_32_2_2((yt_rsc_0_7_i_qa_d[31:0]), tmp_sva_1_2, fsm_output[3]);
  end
  always @(posedge clk) begin
    if ( y_or_cse ) begin
      idx_3_0_sva <= MUX_v_4_2_2(4'b0000, idx_3_0_sva_2, idx_not_1_nl);
      reg_s_13_0_ftd <= ~ (fsm_output[4]);
      reg_s_13_0_ftd_1 <= MUX_v_13_2_2(13'b0000000000000, ({reg_s_13_0_ftd , (reg_s_13_0_ftd_1[12:1])}),
          (fsm_output[4]));
      shift_3_0_sva <= MUX_v_4_2_2(4'b1101, operator_32_false_2_acc_nl, fsm_output[4]);
      nn_13_sva <= nn_12_sva & (~ (fsm_output[0]));
      nn_12_sva <= nn_11_sva & (~ (fsm_output[0]));
      nn_11_sva <= nn_10_sva & (~ (fsm_output[0]));
      nn_10_sva <= nn_9_sva & (~ (fsm_output[0]));
      nn_9_sva <= nn_8_sva & (~ (fsm_output[0]));
      nn_8_sva <= nn_7_sva & (~ (fsm_output[0]));
      nn_7_sva <= nn_6_sva & (~ (fsm_output[0]));
      nn_6_sva <= nn_5_sva & (~ (fsm_output[0]));
      nn_5_sva <= nn_4_sva & (~ (fsm_output[0]));
      nn_4_sva <= nn_3_sva & (~ (fsm_output[0]));
      nn_3_sva <= nn_2_sva & (~ (fsm_output[0]));
      nn_2_sva <= nn_1_sva & (~ (fsm_output[0]));
      nn_1_sva <= fsm_output[0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      y_3_sva <= 1'b0;
      x_3_sva <= 1'b0;
    end
    else if ( y_or_cse ) begin
      y_3_sva <= x_3_sva & (~ (fsm_output[0]));
      x_3_sva <= y_3_sva | (fsm_output[0]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_asn_itm_2 <= 1'b0;
      for_for_a_conc_2_itm_2_1 <= 2'b00;
    end
    else if ( for_for_a_or_2_cse ) begin
      for_for_a_asn_itm_2 <= MUX_s_1_2_2((operator_34_true_1_and_psp_sva_1[0]), for_for_a_asn_itm_1,
          fsm_output[3]);
      for_for_a_conc_2_itm_2_1 <= MUX_v_2_2_2((for_for_a_acc_tmp[1:0]), for_for_a_conc_2_itm_1_2_1,
          fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_t_13_0_sva_12_0 <= 13'b0000000000000;
    end
    else if ( and_cse | (fsm_output[4]) | (fsm_output[0]) ) begin
      for_for_t_13_0_sva_12_0 <= MUX_v_13_2_2(13'b0000000000000, (z_out_4[12:0]),
          y_not_35_nl);
    end
  end
  always @(posedge clk) begin
    if ( or_cse ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_13_0_sva_2_13_3 <= for_for_acc_tdx_13_0_sva_1_13_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_1_13_0_sva_2_13_3 <= for_for_acc_tdx_1_13_0_sva_1_13_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_5_itm_2 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_5_itm_2 <= for_for_asn_5_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_itm_2 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_itm_2 <= for_for_asn_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_conc_2_itm_1_2_1 <= 2'b00;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_conc_2_itm_1_2_1 <= for_for_a_conc_2_itm_2_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_conc_2_itm_1_0 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_conc_2_itm_1_0 <= for_for_a_asn_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      mult_z_mul_itm_1 <= nl_mult_z_mul_itm_1[31:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_asn_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_asn_itm_1 <= for_for_a_asn_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_stage_0_1 <= 1'b0;
      for_for_stage_0_2 <= 1'b0;
      for_for_stage_0_3 <= 1'b0;
    end
    else if ( for_for_or_cse ) begin
      for_for_stage_0_1 <= for_for_mux_18_cse;
      for_for_stage_0_2 <= for_for_stage_0_1 & (~ y_or_cse);
      for_for_stage_0_3 <= for_for_stage_0_2 & (~ y_or_cse);
    end
  end
  always @(posedge clk) begin
    if ( for_for_stage_0_1 ) begin
      mult_t_mul_cmp_a <= MUX1HOT_v_32_16_2((xt_rsc_0_0_i_qa_d[31:0]), (xt_rsc_0_1_i_qa_d[63:32]),
          (xt_rsc_0_2_i_qa_d[63:32]), (xt_rsc_0_3_i_qa_d[63:32]), (xt_rsc_0_4_i_qa_d[63:32]),
          (xt_rsc_0_5_i_qa_d[63:32]), (xt_rsc_0_6_i_qa_d[63:32]), (xt_rsc_0_7_i_qa_d[63:32]),
          (yt_rsc_0_0_i_qa_d[63:32]), (yt_rsc_0_1_i_qa_d[63:32]), (yt_rsc_0_2_i_qa_d[63:32]),
          (yt_rsc_0_3_i_qa_d[63:32]), (yt_rsc_0_4_i_qa_d[63:32]), (yt_rsc_0_5_i_qa_d[63:32]),
          (yt_rsc_0_6_i_qa_d[63:32]), (yt_rsc_0_7_i_qa_d[63:32]), {for_for_b_for_for_b_nor_itm
          , for_for_b_for_for_b_and_itm , for_for_b_for_for_b_and_1_itm , for_for_b_for_for_b_and_2_itm
          , for_for_b_for_for_b_and_3_itm , for_for_b_for_for_b_and_4_itm , for_for_b_for_for_b_and_5_itm
          , for_for_b_for_for_b_and_6_itm , for_for_b_and_1_nl , for_for_b_for_for_b_and_7_itm
          , for_for_b_for_for_b_and_8_itm , for_for_b_for_for_b_and_9_itm , for_for_b_for_for_b_and_10_itm
          , for_for_b_for_for_b_and_11_itm , for_for_b_for_for_b_and_12_itm , for_for_b_for_for_b_and_13_itm});
      for_for_mul_itm <= z_out_3[13:0];
      for_for_w_asn_2_itm <= twiddle_rsci_q_d;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_b_for_for_b_and_13_itm <= 1'b0;
      for_for_b_for_for_b_and_12_itm <= 1'b0;
      for_for_b_for_for_b_and_11_itm <= 1'b0;
      for_for_b_for_for_b_and_10_itm <= 1'b0;
      for_for_b_for_for_b_and_9_itm <= 1'b0;
      for_for_b_for_for_b_and_8_itm <= 1'b0;
      for_for_b_for_for_b_and_7_itm <= 1'b0;
      for_for_b_for_for_b_nor_1_itm <= 1'b0;
      for_for_b_for_for_b_and_6_itm <= 1'b0;
      for_for_b_for_for_b_and_5_itm <= 1'b0;
      for_for_b_for_for_b_and_4_itm <= 1'b0;
      for_for_b_for_for_b_and_3_itm <= 1'b0;
      for_for_b_for_for_b_and_2_itm <= 1'b0;
      for_for_b_for_for_b_and_1_itm <= 1'b0;
      for_for_b_for_for_b_and_itm <= 1'b0;
      for_for_b_for_for_b_nor_itm <= 1'b0;
    end
    else if ( for_for_stage_0_1 ) begin
      for_for_b_for_for_b_and_13_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b111)
          & y_3_sva;
      for_for_b_for_for_b_and_12_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b110)
          & y_3_sva;
      for_for_b_for_for_b_and_11_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b101)
          & y_3_sva;
      for_for_b_for_for_b_and_10_itm <= (for_for_b_for_for_b_acc_tmp[2]) & for_for_b_nor_2_cse_1
          & y_3_sva;
      for_for_b_for_for_b_and_9_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b011)
          & y_3_sva;
      for_for_b_for_for_b_and_8_itm <= (for_for_b_for_for_b_acc_tmp[1]) & for_for_b_nor_1_cse_1
          & y_3_sva;
      for_for_b_for_for_b_and_7_itm <= (for_for_b_for_for_b_acc_tmp[0]) & for_for_b_nor_cse_1
          & y_3_sva;
      for_for_b_for_for_b_nor_1_itm <= ~((for_for_b_for_for_b_acc_tmp[2:0]!=3'b000));
      for_for_b_for_for_b_and_6_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b111)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_5_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b110)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_4_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b101)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_3_itm <= (for_for_b_for_for_b_acc_tmp[2]) & for_for_b_nor_2_cse_1
          & (~ y_3_sva);
      for_for_b_for_for_b_and_2_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b011)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_1_itm <= (for_for_b_for_for_b_acc_tmp[1]) & for_for_b_nor_1_cse_1
          & (~ y_3_sva);
      for_for_b_for_for_b_and_itm <= (for_for_b_for_for_b_acc_tmp[0]) & for_for_b_nor_cse_1
          & (~ y_3_sva);
      for_for_b_for_for_b_nor_itm <= ~((for_for_b_for_for_b_acc_tmp[2:0]!=3'b000)
          | y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_a_acc_psp_sva_1_12_2 <= for_for_a_acc_psp_sva_12_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_5_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_5_itm_1 <= for_for_asn_5_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_itm_1 <= for_for_asn_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_13_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_13_itm_1 <= for_for_a_for_for_a_and_13_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_12_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_12_itm_1 <= for_for_a_for_for_a_and_12_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_11_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_11_itm_1 <= for_for_a_for_for_a_and_11_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_10_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_10_itm_1 <= for_for_a_for_for_a_and_10_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_9_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_9_itm_1 <= for_for_a_for_for_a_and_9_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_8_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_8_itm_1 <= for_for_a_for_for_a_and_8_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_7_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_7_itm_1 <= for_for_a_for_for_a_and_7_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_nor_1_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_nor_1_itm_1 <= for_for_a_for_for_a_nor_1_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_6_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_6_itm_1 <= for_for_a_for_for_a_and_6_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_5_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_5_itm_1 <= for_for_a_for_for_a_and_5_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_4_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_4_itm_1 <= for_for_a_for_for_a_and_4_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_3_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_3_itm_1 <= for_for_a_for_for_a_and_3_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_2_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_2_itm_1 <= for_for_a_for_for_a_and_2_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_1_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_1_itm_1 <= for_for_a_for_for_a_and_1_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_itm_1 <= for_for_a_for_for_a_and_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_nor_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_nor_itm_1 <= for_for_a_for_for_a_nor_itm;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_1_13_0_sva_1_13_3 <= reg_for_for_acc_tdx_1_13_0_ftd;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_13_0_sva_1_13_3 <= for_for_acc_tdx_13_0_sva_13_3;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_1_1 <= tmp_2_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_2_1 <= tmp_2_sva_2;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_3_1 <= tmp_2_sva_3;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_4_1 <= tmp_2_sva_4;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_5_1 <= tmp_2_sva_5;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_6_1 <= tmp_2_sva_6;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_2_sva_7_1 <= tmp_2_sva_7;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_1_2 <= tmp_sva;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_1_1 <= tmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_2_1 <= tmp_sva_2;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_3_1 <= tmp_sva_3;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_4_1 <= tmp_sva_4;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_5_1 <= tmp_sva_5;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_6_1 <= tmp_sva_6;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      tmp_sva_7_1 <= tmp_sva_7;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm <= 3'b000;
    end
    else if ( (~(x_3_sva ^ for_for_asn_5_itm)) & (fsm_output[2]) ) begin
      for_for_slc_for_for_acc_tdx_1_13_0_2_0_1_itm <= for_for_acc_tdx_1_13_0_sva_1[2:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm <= 3'b000;
    end
    else if ( ~((x_3_sva ^ for_for_asn_itm) | (fsm_output[2])) ) begin
      for_for_slc_for_for_acc_tdx_13_0_2_0_1_itm <= for_for_acc_tdx_13_0_sva_1[2:0];
    end
  end
  always @(posedge clk) begin
    if ( for_for_stage_0_3 ) begin
      modulo_add_base_sva <= nl_modulo_add_base_sva[31:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      modulo_sub_base_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( for_for_stage_0_3 ) begin
      modulo_sub_base_sva <= nl_modulo_sub_base_sva[31:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_acc_psp_sva_12_2 <= 11'b00000000000;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_acc_psp_sva_12_2 <= for_for_a_acc_tmp[12:2];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_acc_tdx_13_0_sva_13_3 <= 11'b00000000000;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_acc_tdx_13_0_sva_13_3 <= for_for_acc_tdx_13_0_sva_1[13:3];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_13_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_13_itm <= (for_for_a_acc_tmp[1:0]==2'b11) & (operator_34_true_1_and_psp_sva_1[0])
          & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_12_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_12_itm <= (for_for_a_acc_tmp[1:0]==2'b11) & (~ (operator_34_true_1_and_psp_sva_1[0]))
          & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_11_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_11_itm <= (for_for_a_acc_tmp[1]) & (operator_34_true_1_and_psp_sva_1[0])
          & (~ (for_for_a_acc_tmp[0])) & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_10_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_10_itm <= (for_for_a_acc_tmp[1]) & for_for_a_nor_2_cse_1
          & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_9_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_9_itm <= (for_for_a_acc_tmp[0]) & (operator_34_true_1_and_psp_sva_1[0])
          & (~ (for_for_a_acc_tmp[1])) & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_8_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_8_itm <= (for_for_a_acc_tmp[0]) & for_for_a_nor_1_cse_1
          & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_7_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_7_itm <= (operator_34_true_1_and_psp_sva_1[0]) & for_for_a_nor_cse_1
          & y_3_sva;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_nor_1_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_nor_1_itm <= ~((for_for_a_acc_tmp[1:0]!=2'b00) | (operator_34_true_1_and_psp_sva_1[0]));
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_6_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_6_itm <= (for_for_a_acc_tmp[1:0]==2'b11) & (operator_34_true_1_and_psp_sva_1[0])
          & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_5_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_5_itm <= (for_for_a_acc_tmp[1:0]==2'b11) & (~ (operator_34_true_1_and_psp_sva_1[0]))
          & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_4_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_4_itm <= (for_for_a_acc_tmp[1]) & (operator_34_true_1_and_psp_sva_1[0])
          & (~ (for_for_a_acc_tmp[0])) & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_3_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_3_itm <= (for_for_a_acc_tmp[1]) & for_for_a_nor_2_cse_1
          & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_2_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_2_itm <= (for_for_a_acc_tmp[0]) & (operator_34_true_1_and_psp_sva_1[0])
          & (~ (for_for_a_acc_tmp[1])) & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_1_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_1_itm <= (for_for_a_acc_tmp[0]) & for_for_a_nor_1_cse_1
          & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_itm <= (operator_34_true_1_and_psp_sva_1[0]) & for_for_a_nor_cse_1
          & (~ y_3_sva);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_nor_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_nor_itm <= ~((for_for_a_acc_tmp[1:0]!=2'b00) | (operator_34_true_1_and_psp_sva_1[0])
          | y_3_sva);
    end
  end
  assign for_for_a_mux1h_30_nl = MUX1HOT_s_1_3_2(for_for_a_asn_itm, y_3_sva, x_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign for_for_mux1h_28_nl = MUX1HOT_s_1_3_2(for_for_asn_5_itm, x_3_sva, y_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign for_for_mux1h_30_nl = MUX1HOT_s_1_3_2(for_for_asn_itm, x_3_sva, y_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign nn_mux_nl = MUX_s_1_2_2(nn_14_sva, nn_13_sva, fsm_output[4]);
  assign idx_not_1_nl = ~ (fsm_output[0]);
  assign nl_operator_32_false_2_acc_nl = shift_3_0_sva + 4'b1111;
  assign operator_32_false_2_acc_nl = nl_operator_32_false_2_acc_nl[3:0];
  assign y_not_35_nl = ~ y_or_cse;
  assign nl_mult_z_mul_itm_1  = mult_t_mul_cmp_a * for_for_w_asn_2_itm;
  assign for_for_b_and_1_nl = for_for_b_for_for_b_nor_1_itm & y_3_sva;
  assign nl_modulo_sub_base_sva  = for_for_a_lpi_3_dfm_1 - mult_res_lpi_3_dfm_1;
  assign nl_modulo_add_base_sva  = for_for_a_lpi_3_dfm_1 + mult_res_lpi_3_dfm_1;
  assign mult_if_mux_5_nl = MUX_v_32_2_2(z_out_2, p_sva, fsm_output[2]);
  assign mult_if_mux_6_nl = MUX_v_32_2_2((~ p_sva), (~ modulo_add_base_sva), fsm_output[2]);
  assign nl_acc_nl = ({1'b1 , mult_if_mux_5_nl , 1'b1}) + conv_u2u_33_34({mult_if_mux_6_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[33:0];
  assign z_out_32 = readslicef_34_1_33(acc_nl);
  assign mult_if_mux_7_nl = MUX_v_32_2_2(z_out_2, ({1'b1 , (modulo_sub_base_sva[30:0])}),
      fsm_output[2]);
  assign mult_if_or_1_nl = (fsm_output[3:2]!=2'b01);
  assign mult_if_mux_8_nl = MUX_v_32_2_2((~ p_sva), p_sva, fsm_output[2]);
  assign nl_acc_1_nl = ({mult_if_mux_7_nl , mult_if_or_1_nl}) + ({mult_if_mux_8_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[32:0];
  assign z_out_1 = readslicef_33_32_1(acc_1_nl);
  assign mult_res_mux_3_nl = MUX_v_32_2_2(mult_z_mul_itm_1, modulo_add_base_sva,
      fsm_output[2]);
  assign mult_res_mux_4_nl = MUX_v_32_2_2((~ mult_z_mul_itm), (~ p_sva), fsm_output[2]);
  assign nl_acc_2_nl = ({mult_res_mux_3_nl , 1'b1}) + ({mult_res_mux_4_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[32:0];
  assign z_out_2 = readslicef_33_32_1(acc_2_nl);
  assign for_for_mux_22_nl = MUX_v_32_2_2(({18'b000000000000000000 , reg_s_13_0_ftd
      , reg_s_13_0_ftd_1}), tmp_2_sva_1, fsm_output[2]);
  assign for_for_mux_23_nl = MUX_v_32_2_2(({18'b000000000000000000 , nn_14_sva ,
      nn_13_sva , nn_12_sva , nn_11_sva , nn_10_sva , nn_9_sva , nn_8_sva , nn_7_sva
      , nn_6_sva , nn_5_sva , nn_4_sva , nn_3_sva , nn_2_sva , nn_1_sva}), p_sva,
      fsm_output[2]);
  assign nl_z_out_3 = for_for_mux_22_nl * for_for_mux_23_nl;
  assign z_out_3 = nl_z_out_3[31:0];
  assign for_for_mux_24_nl = MUX_v_13_2_2(for_for_t_13_0_sva_12_0, ({10'b1111111111
      , (idx_3_0_sva_2[3:1])}), fsm_output[4]);
  assign nl_z_out_4 = conv_u2u_13_14(for_for_mux_24_nl) + 14'b00000000000001;
  assign z_out_4 = nl_z_out_4[13:0];

  function automatic [0:0] MUX1HOT_s_1_3_2;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [2:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function automatic [10:0] MUX1HOT_v_11_3_2;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [2:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    MUX1HOT_v_11_3_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_16_2;
    input [31:0] input_15;
    input [31:0] input_14;
    input [31:0] input_13;
    input [31:0] input_12;
    input [31:0] input_11;
    input [31:0] input_10;
    input [31:0] input_9;
    input [31:0] input_8;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [15:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    result = result | ( input_4 & {32{sel[4]}});
    result = result | ( input_5 & {32{sel[5]}});
    result = result | ( input_6 & {32{sel[6]}});
    result = result | ( input_7 & {32{sel[7]}});
    result = result | ( input_8 & {32{sel[8]}});
    result = result | ( input_9 & {32{sel[9]}});
    result = result | ( input_10 & {32{sel[10]}});
    result = result | ( input_11 & {32{sel[11]}});
    result = result | ( input_12 & {32{sel[12]}});
    result = result | ( input_13 & {32{sel[13]}});
    result = result | ( input_14 & {32{sel[14]}});
    result = result | ( input_15 & {32{sel[15]}});
    MUX1HOT_v_32_16_2 = result;
  end
  endfunction


  function automatic [31:0] MUX1HOT_v_32_3_2;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [2:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    MUX1HOT_v_32_3_2 = result;
  end
  endfunction


  function automatic [0:0] MUX_s_1_2_2;
    input [0:0] input_0;
    input [0:0] input_1;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [10:0] MUX_v_11_2_2;
    input [10:0] input_0;
    input [10:0] input_1;
    input [0:0] sel;
    reg [10:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_11_2_2 = result;
  end
  endfunction


  function automatic [12:0] MUX_v_13_2_2;
    input [12:0] input_0;
    input [12:0] input_1;
    input [0:0] sel;
    reg [12:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_13_2_2 = result;
  end
  endfunction


  function automatic [1:0] MUX_v_2_2_2;
    input [1:0] input_0;
    input [1:0] input_1;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input [0:0] sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [3:0] MUX_v_4_2_2;
    input [3:0] input_0;
    input [3:0] input_1;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction


  function automatic [31:0] readslicef_33_32_1;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_33_32_1 = tmp[31:0];
  end
  endfunction


  function automatic [0:0] readslicef_34_1_33;
    input [33:0] vector;
    reg [33:0] tmp;
  begin
    tmp = vector >> 33;
    readslicef_34_1_33 = tmp[0:0];
  end
  endfunction


  function automatic [12:0] conv_u2u_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_13 = {1'b0, vector};
  end
  endfunction


  function automatic [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function automatic [33:0] conv_u2u_33_34 ;
    input [32:0]  vector ;
  begin
    conv_u2u_33_34 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit
// ------------------------------------------------------------------


module stockham_dit (
  clk, rst, xt_rsc_0_0_adra, xt_rsc_0_0_da, xt_rsc_0_0_wea, xt_rsc_0_0_qa, xt_rsc_0_0_adrb,
      xt_rsc_0_0_db, xt_rsc_0_0_web, xt_rsc_0_0_qb, xt_rsc_triosy_0_0_lz, xt_rsc_0_1_adra,
      xt_rsc_0_1_da, xt_rsc_0_1_wea, xt_rsc_0_1_qa, xt_rsc_0_1_adrb, xt_rsc_0_1_db,
      xt_rsc_0_1_web, xt_rsc_0_1_qb, xt_rsc_triosy_0_1_lz, xt_rsc_0_2_adra, xt_rsc_0_2_da,
      xt_rsc_0_2_wea, xt_rsc_0_2_qa, xt_rsc_0_2_adrb, xt_rsc_0_2_db, xt_rsc_0_2_web,
      xt_rsc_0_2_qb, xt_rsc_triosy_0_2_lz, xt_rsc_0_3_adra, xt_rsc_0_3_da, xt_rsc_0_3_wea,
      xt_rsc_0_3_qa, xt_rsc_0_3_adrb, xt_rsc_0_3_db, xt_rsc_0_3_web, xt_rsc_0_3_qb,
      xt_rsc_triosy_0_3_lz, xt_rsc_0_4_adra, xt_rsc_0_4_da, xt_rsc_0_4_wea, xt_rsc_0_4_qa,
      xt_rsc_0_4_adrb, xt_rsc_0_4_db, xt_rsc_0_4_web, xt_rsc_0_4_qb, xt_rsc_triosy_0_4_lz,
      xt_rsc_0_5_adra, xt_rsc_0_5_da, xt_rsc_0_5_wea, xt_rsc_0_5_qa, xt_rsc_0_5_adrb,
      xt_rsc_0_5_db, xt_rsc_0_5_web, xt_rsc_0_5_qb, xt_rsc_triosy_0_5_lz, xt_rsc_0_6_adra,
      xt_rsc_0_6_da, xt_rsc_0_6_wea, xt_rsc_0_6_qa, xt_rsc_0_6_adrb, xt_rsc_0_6_db,
      xt_rsc_0_6_web, xt_rsc_0_6_qb, xt_rsc_triosy_0_6_lz, xt_rsc_0_7_adra, xt_rsc_0_7_da,
      xt_rsc_0_7_wea, xt_rsc_0_7_qa, xt_rsc_0_7_adrb, xt_rsc_0_7_db, xt_rsc_0_7_web,
      xt_rsc_0_7_qb, xt_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, twiddle_rsc_radr,
      twiddle_rsc_q, twiddle_rsc_triosy_lz, twiddle_h_rsc_radr, twiddle_h_rsc_q,
      twiddle_h_rsc_triosy_lz
);
  input clk;
  input rst;
  output [10:0] xt_rsc_0_0_adra;
  output [31:0] xt_rsc_0_0_da;
  output xt_rsc_0_0_wea;
  input [31:0] xt_rsc_0_0_qa;
  output [10:0] xt_rsc_0_0_adrb;
  output [31:0] xt_rsc_0_0_db;
  output xt_rsc_0_0_web;
  input [31:0] xt_rsc_0_0_qb;
  output xt_rsc_triosy_0_0_lz;
  output [10:0] xt_rsc_0_1_adra;
  output [31:0] xt_rsc_0_1_da;
  output xt_rsc_0_1_wea;
  input [31:0] xt_rsc_0_1_qa;
  output [10:0] xt_rsc_0_1_adrb;
  output [31:0] xt_rsc_0_1_db;
  output xt_rsc_0_1_web;
  input [31:0] xt_rsc_0_1_qb;
  output xt_rsc_triosy_0_1_lz;
  output [10:0] xt_rsc_0_2_adra;
  output [31:0] xt_rsc_0_2_da;
  output xt_rsc_0_2_wea;
  input [31:0] xt_rsc_0_2_qa;
  output [10:0] xt_rsc_0_2_adrb;
  output [31:0] xt_rsc_0_2_db;
  output xt_rsc_0_2_web;
  input [31:0] xt_rsc_0_2_qb;
  output xt_rsc_triosy_0_2_lz;
  output [10:0] xt_rsc_0_3_adra;
  output [31:0] xt_rsc_0_3_da;
  output xt_rsc_0_3_wea;
  input [31:0] xt_rsc_0_3_qa;
  output [10:0] xt_rsc_0_3_adrb;
  output [31:0] xt_rsc_0_3_db;
  output xt_rsc_0_3_web;
  input [31:0] xt_rsc_0_3_qb;
  output xt_rsc_triosy_0_3_lz;
  output [10:0] xt_rsc_0_4_adra;
  output [31:0] xt_rsc_0_4_da;
  output xt_rsc_0_4_wea;
  input [31:0] xt_rsc_0_4_qa;
  output [10:0] xt_rsc_0_4_adrb;
  output [31:0] xt_rsc_0_4_db;
  output xt_rsc_0_4_web;
  input [31:0] xt_rsc_0_4_qb;
  output xt_rsc_triosy_0_4_lz;
  output [10:0] xt_rsc_0_5_adra;
  output [31:0] xt_rsc_0_5_da;
  output xt_rsc_0_5_wea;
  input [31:0] xt_rsc_0_5_qa;
  output [10:0] xt_rsc_0_5_adrb;
  output [31:0] xt_rsc_0_5_db;
  output xt_rsc_0_5_web;
  input [31:0] xt_rsc_0_5_qb;
  output xt_rsc_triosy_0_5_lz;
  output [10:0] xt_rsc_0_6_adra;
  output [31:0] xt_rsc_0_6_da;
  output xt_rsc_0_6_wea;
  input [31:0] xt_rsc_0_6_qa;
  output [10:0] xt_rsc_0_6_adrb;
  output [31:0] xt_rsc_0_6_db;
  output xt_rsc_0_6_web;
  input [31:0] xt_rsc_0_6_qb;
  output xt_rsc_triosy_0_6_lz;
  output [10:0] xt_rsc_0_7_adra;
  output [31:0] xt_rsc_0_7_da;
  output xt_rsc_0_7_wea;
  input [31:0] xt_rsc_0_7_qa;
  output [10:0] xt_rsc_0_7_adrb;
  output [31:0] xt_rsc_0_7_db;
  output xt_rsc_0_7_web;
  input [31:0] xt_rsc_0_7_qb;
  output xt_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output [13:0] twiddle_rsc_radr;
  input [31:0] twiddle_rsc_q;
  output twiddle_rsc_triosy_lz;
  output [13:0] twiddle_h_rsc_radr;
  input [31:0] twiddle_h_rsc_q;
  output twiddle_h_rsc_triosy_lz;


  // Interconnect Declarations
  wire [31:0] twiddle_rsci_q_d;
  wire [31:0] twiddle_h_rsci_q_d;
  wire [21:0] yt_rsc_0_0_i_adra_d;
  wire yt_rsc_0_0_i_clka_en_d;
  wire [63:0] yt_rsc_0_0_i_da_d;
  wire [63:0] yt_rsc_0_0_i_qa_d;
  wire [1:0] yt_rsc_0_0_i_wea_d;
  wire [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_1_i_adra_d;
  wire yt_rsc_0_1_i_clka_en_d;
  wire [63:0] yt_rsc_0_1_i_da_d;
  wire [63:0] yt_rsc_0_1_i_qa_d;
  wire [1:0] yt_rsc_0_1_i_wea_d;
  wire [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_2_i_adra_d;
  wire yt_rsc_0_2_i_clka_en_d;
  wire [63:0] yt_rsc_0_2_i_da_d;
  wire [63:0] yt_rsc_0_2_i_qa_d;
  wire [1:0] yt_rsc_0_2_i_wea_d;
  wire [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_3_i_adra_d;
  wire yt_rsc_0_3_i_clka_en_d;
  wire [63:0] yt_rsc_0_3_i_da_d;
  wire [63:0] yt_rsc_0_3_i_qa_d;
  wire [1:0] yt_rsc_0_3_i_wea_d;
  wire [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_4_i_adra_d;
  wire yt_rsc_0_4_i_clka_en_d;
  wire [63:0] yt_rsc_0_4_i_da_d;
  wire [63:0] yt_rsc_0_4_i_qa_d;
  wire [1:0] yt_rsc_0_4_i_wea_d;
  wire [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_5_i_adra_d;
  wire yt_rsc_0_5_i_clka_en_d;
  wire [63:0] yt_rsc_0_5_i_da_d;
  wire [63:0] yt_rsc_0_5_i_qa_d;
  wire [1:0] yt_rsc_0_5_i_wea_d;
  wire [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_6_i_adra_d;
  wire yt_rsc_0_6_i_clka_en_d;
  wire [63:0] yt_rsc_0_6_i_da_d;
  wire [63:0] yt_rsc_0_6_i_qa_d;
  wire [1:0] yt_rsc_0_6_i_wea_d;
  wire [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] yt_rsc_0_7_i_adra_d;
  wire yt_rsc_0_7_i_clka_en_d;
  wire [63:0] yt_rsc_0_7_i_da_d;
  wire [63:0] yt_rsc_0_7_i_qa_d;
  wire [1:0] yt_rsc_0_7_i_wea_d;
  wire [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_0_i_adra_d;
  wire [63:0] xt_rsc_0_0_i_da_d;
  wire [63:0] xt_rsc_0_0_i_qa_d;
  wire [1:0] xt_rsc_0_0_i_wea_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_1_i_adra_d;
  wire [63:0] xt_rsc_0_1_i_da_d;
  wire [63:0] xt_rsc_0_1_i_qa_d;
  wire [1:0] xt_rsc_0_1_i_wea_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_2_i_adra_d;
  wire [63:0] xt_rsc_0_2_i_da_d;
  wire [63:0] xt_rsc_0_2_i_qa_d;
  wire [1:0] xt_rsc_0_2_i_wea_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_3_i_adra_d;
  wire [63:0] xt_rsc_0_3_i_da_d;
  wire [63:0] xt_rsc_0_3_i_qa_d;
  wire [1:0] xt_rsc_0_3_i_wea_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_4_i_adra_d;
  wire [63:0] xt_rsc_0_4_i_da_d;
  wire [63:0] xt_rsc_0_4_i_qa_d;
  wire [1:0] xt_rsc_0_4_i_wea_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_5_i_adra_d;
  wire [63:0] xt_rsc_0_5_i_da_d;
  wire [63:0] xt_rsc_0_5_i_qa_d;
  wire [1:0] xt_rsc_0_5_i_wea_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_6_i_adra_d;
  wire [63:0] xt_rsc_0_6_i_da_d;
  wire [63:0] xt_rsc_0_6_i_qa_d;
  wire [1:0] xt_rsc_0_6_i_wea_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [21:0] xt_rsc_0_7_i_adra_d;
  wire [63:0] xt_rsc_0_7_i_da_d;
  wire [63:0] xt_rsc_0_7_i_qa_d;
  wire [1:0] xt_rsc_0_7_i_wea_d;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [31:0] mult_t_mul_cmp_a;
  wire [31:0] mult_t_mul_cmp_b;
  wire yt_rsc_0_0_clkb_en;
  wire yt_rsc_0_0_clka_en;
  wire [31:0] yt_rsc_0_0_qb;
  wire yt_rsc_0_0_web;
  wire [31:0] yt_rsc_0_0_db;
  wire [10:0] yt_rsc_0_0_adrb;
  wire [31:0] yt_rsc_0_0_qa;
  wire yt_rsc_0_0_wea;
  wire [31:0] yt_rsc_0_0_da;
  wire [10:0] yt_rsc_0_0_adra;
  wire yt_rsc_0_1_clkb_en;
  wire yt_rsc_0_1_clka_en;
  wire [31:0] yt_rsc_0_1_qb;
  wire yt_rsc_0_1_web;
  wire [31:0] yt_rsc_0_1_db;
  wire [10:0] yt_rsc_0_1_adrb;
  wire [31:0] yt_rsc_0_1_qa;
  wire yt_rsc_0_1_wea;
  wire [31:0] yt_rsc_0_1_da;
  wire [10:0] yt_rsc_0_1_adra;
  wire yt_rsc_0_2_clkb_en;
  wire yt_rsc_0_2_clka_en;
  wire [31:0] yt_rsc_0_2_qb;
  wire yt_rsc_0_2_web;
  wire [31:0] yt_rsc_0_2_db;
  wire [10:0] yt_rsc_0_2_adrb;
  wire [31:0] yt_rsc_0_2_qa;
  wire yt_rsc_0_2_wea;
  wire [31:0] yt_rsc_0_2_da;
  wire [10:0] yt_rsc_0_2_adra;
  wire yt_rsc_0_3_clkb_en;
  wire yt_rsc_0_3_clka_en;
  wire [31:0] yt_rsc_0_3_qb;
  wire yt_rsc_0_3_web;
  wire [31:0] yt_rsc_0_3_db;
  wire [10:0] yt_rsc_0_3_adrb;
  wire [31:0] yt_rsc_0_3_qa;
  wire yt_rsc_0_3_wea;
  wire [31:0] yt_rsc_0_3_da;
  wire [10:0] yt_rsc_0_3_adra;
  wire yt_rsc_0_4_clkb_en;
  wire yt_rsc_0_4_clka_en;
  wire [31:0] yt_rsc_0_4_qb;
  wire yt_rsc_0_4_web;
  wire [31:0] yt_rsc_0_4_db;
  wire [10:0] yt_rsc_0_4_adrb;
  wire [31:0] yt_rsc_0_4_qa;
  wire yt_rsc_0_4_wea;
  wire [31:0] yt_rsc_0_4_da;
  wire [10:0] yt_rsc_0_4_adra;
  wire yt_rsc_0_5_clkb_en;
  wire yt_rsc_0_5_clka_en;
  wire [31:0] yt_rsc_0_5_qb;
  wire yt_rsc_0_5_web;
  wire [31:0] yt_rsc_0_5_db;
  wire [10:0] yt_rsc_0_5_adrb;
  wire [31:0] yt_rsc_0_5_qa;
  wire yt_rsc_0_5_wea;
  wire [31:0] yt_rsc_0_5_da;
  wire [10:0] yt_rsc_0_5_adra;
  wire yt_rsc_0_6_clkb_en;
  wire yt_rsc_0_6_clka_en;
  wire [31:0] yt_rsc_0_6_qb;
  wire yt_rsc_0_6_web;
  wire [31:0] yt_rsc_0_6_db;
  wire [10:0] yt_rsc_0_6_adrb;
  wire [31:0] yt_rsc_0_6_qa;
  wire yt_rsc_0_6_wea;
  wire [31:0] yt_rsc_0_6_da;
  wire [10:0] yt_rsc_0_6_adra;
  wire yt_rsc_0_7_clkb_en;
  wire yt_rsc_0_7_clka_en;
  wire [31:0] yt_rsc_0_7_qb;
  wire yt_rsc_0_7_web;
  wire [31:0] yt_rsc_0_7_db;
  wire [10:0] yt_rsc_0_7_adrb;
  wire [31:0] yt_rsc_0_7_qa;
  wire yt_rsc_0_7_wea;
  wire [31:0] yt_rsc_0_7_da;
  wire [10:0] yt_rsc_0_7_adra;
  wire [13:0] twiddle_rsci_radr_d_iff;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_stockham_dit_core_inst_mult_t_mul_cmp_z;
  assign nl_stockham_dit_core_inst_mult_t_mul_cmp_z = conv_u2u_64_64(mult_t_mul_cmp_a
      * mult_t_mul_cmp_b);
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_0_comp (
      .adra(yt_rsc_0_0_adra),
      .adrb(yt_rsc_0_0_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_0_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_0_clkb_en),
      .da(yt_rsc_0_0_da),
      .db(yt_rsc_0_0_db),
      .qa(yt_rsc_0_0_qa),
      .qb(yt_rsc_0_0_qb),
      .wea(yt_rsc_0_0_wea),
      .web(yt_rsc_0_0_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_1_comp (
      .adra(yt_rsc_0_1_adra),
      .adrb(yt_rsc_0_1_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_1_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_1_clkb_en),
      .da(yt_rsc_0_1_da),
      .db(yt_rsc_0_1_db),
      .qa(yt_rsc_0_1_qa),
      .qb(yt_rsc_0_1_qb),
      .wea(yt_rsc_0_1_wea),
      .web(yt_rsc_0_1_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_2_comp (
      .adra(yt_rsc_0_2_adra),
      .adrb(yt_rsc_0_2_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_2_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_2_clkb_en),
      .da(yt_rsc_0_2_da),
      .db(yt_rsc_0_2_db),
      .qa(yt_rsc_0_2_qa),
      .qb(yt_rsc_0_2_qb),
      .wea(yt_rsc_0_2_wea),
      .web(yt_rsc_0_2_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_3_comp (
      .adra(yt_rsc_0_3_adra),
      .adrb(yt_rsc_0_3_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_3_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_3_clkb_en),
      .da(yt_rsc_0_3_da),
      .db(yt_rsc_0_3_db),
      .qa(yt_rsc_0_3_qa),
      .qb(yt_rsc_0_3_qb),
      .wea(yt_rsc_0_3_wea),
      .web(yt_rsc_0_3_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_4_comp (
      .adra(yt_rsc_0_4_adra),
      .adrb(yt_rsc_0_4_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_4_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_4_clkb_en),
      .da(yt_rsc_0_4_da),
      .db(yt_rsc_0_4_db),
      .qa(yt_rsc_0_4_qa),
      .qb(yt_rsc_0_4_qb),
      .wea(yt_rsc_0_4_wea),
      .web(yt_rsc_0_4_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_5_comp (
      .adra(yt_rsc_0_5_adra),
      .adrb(yt_rsc_0_5_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_5_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_5_clkb_en),
      .da(yt_rsc_0_5_da),
      .db(yt_rsc_0_5_db),
      .qa(yt_rsc_0_5_qa),
      .qb(yt_rsc_0_5_qb),
      .wea(yt_rsc_0_5_wea),
      .web(yt_rsc_0_5_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_6_comp (
      .adra(yt_rsc_0_6_adra),
      .adrb(yt_rsc_0_6_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_6_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_6_clkb_en),
      .da(yt_rsc_0_6_da),
      .db(yt_rsc_0_6_db),
      .qa(yt_rsc_0_6_qa),
      .qb(yt_rsc_0_6_qb),
      .wea(yt_rsc_0_6_wea),
      .web(yt_rsc_0_6_web)
    );
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd11),
  .data_width(32'sd32),
  .depth(32'sd2048),
  .latency(32'sd1)) yt_rsc_0_7_comp (
      .adra(yt_rsc_0_7_adra),
      .adrb(yt_rsc_0_7_adrb),
      .clka(clk),
      .clka_en(yt_rsc_0_7_clkb_en),
      .clkb(clk),
      .clkb_en(yt_rsc_0_7_clkb_en),
      .da(yt_rsc_0_7_da),
      .db(yt_rsc_0_7_db),
      .qa(yt_rsc_0_7_qa),
      .qb(yt_rsc_0_7_qb),
      .wea(yt_rsc_0_7_wea),
      .web(yt_rsc_0_7_web)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_14_32_16384_16384_32_1_gen twiddle_rsci
      (
      .q(twiddle_rsc_q),
      .radr(twiddle_rsc_radr),
      .q_d(twiddle_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_14_32_16384_16384_32_1_gen twiddle_h_rsci
      (
      .q(twiddle_h_rsc_q),
      .radr(twiddle_h_rsc_radr),
      .q_d(twiddle_h_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_11_32_2048_2048_32_1_gen
      yt_rsc_0_0_i (
      .clkb_en(yt_rsc_0_0_clkb_en),
      .clka_en(yt_rsc_0_0_clka_en),
      .qb(yt_rsc_0_0_qb),
      .web(yt_rsc_0_0_web),
      .db(yt_rsc_0_0_db),
      .adrb(yt_rsc_0_0_adrb),
      .qa(yt_rsc_0_0_qa),
      .wea(yt_rsc_0_0_wea),
      .da(yt_rsc_0_0_da),
      .adra(yt_rsc_0_0_adra),
      .adra_d(yt_rsc_0_0_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_0_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_0_i_clka_en_d),
      .da_d(yt_rsc_0_0_i_da_d),
      .qa_d(yt_rsc_0_0_i_qa_d),
      .wea_d(yt_rsc_0_0_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_11_32_2048_2048_32_1_gen
      yt_rsc_0_1_i (
      .clkb_en(yt_rsc_0_1_clkb_en),
      .clka_en(yt_rsc_0_1_clka_en),
      .qb(yt_rsc_0_1_qb),
      .web(yt_rsc_0_1_web),
      .db(yt_rsc_0_1_db),
      .adrb(yt_rsc_0_1_adrb),
      .qa(yt_rsc_0_1_qa),
      .wea(yt_rsc_0_1_wea),
      .da(yt_rsc_0_1_da),
      .adra(yt_rsc_0_1_adra),
      .adra_d(yt_rsc_0_1_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_1_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_1_i_clka_en_d),
      .da_d(yt_rsc_0_1_i_da_d),
      .qa_d(yt_rsc_0_1_i_qa_d),
      .wea_d(yt_rsc_0_1_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_11_32_2048_2048_32_1_gen
      yt_rsc_0_2_i (
      .clkb_en(yt_rsc_0_2_clkb_en),
      .clka_en(yt_rsc_0_2_clka_en),
      .qb(yt_rsc_0_2_qb),
      .web(yt_rsc_0_2_web),
      .db(yt_rsc_0_2_db),
      .adrb(yt_rsc_0_2_adrb),
      .qa(yt_rsc_0_2_qa),
      .wea(yt_rsc_0_2_wea),
      .da(yt_rsc_0_2_da),
      .adra(yt_rsc_0_2_adra),
      .adra_d(yt_rsc_0_2_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_2_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_2_i_clka_en_d),
      .da_d(yt_rsc_0_2_i_da_d),
      .qa_d(yt_rsc_0_2_i_qa_d),
      .wea_d(yt_rsc_0_2_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_11_32_2048_2048_32_1_gen
      yt_rsc_0_3_i (
      .clkb_en(yt_rsc_0_3_clkb_en),
      .clka_en(yt_rsc_0_3_clka_en),
      .qb(yt_rsc_0_3_qb),
      .web(yt_rsc_0_3_web),
      .db(yt_rsc_0_3_db),
      .adrb(yt_rsc_0_3_adrb),
      .qa(yt_rsc_0_3_qa),
      .wea(yt_rsc_0_3_wea),
      .da(yt_rsc_0_3_da),
      .adra(yt_rsc_0_3_adra),
      .adra_d(yt_rsc_0_3_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_3_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_3_i_clka_en_d),
      .da_d(yt_rsc_0_3_i_da_d),
      .qa_d(yt_rsc_0_3_i_qa_d),
      .wea_d(yt_rsc_0_3_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_11_32_2048_2048_32_1_gen
      yt_rsc_0_4_i (
      .clkb_en(yt_rsc_0_4_clkb_en),
      .clka_en(yt_rsc_0_4_clka_en),
      .qb(yt_rsc_0_4_qb),
      .web(yt_rsc_0_4_web),
      .db(yt_rsc_0_4_db),
      .adrb(yt_rsc_0_4_adrb),
      .qa(yt_rsc_0_4_qa),
      .wea(yt_rsc_0_4_wea),
      .da(yt_rsc_0_4_da),
      .adra(yt_rsc_0_4_adra),
      .adra_d(yt_rsc_0_4_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_4_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_4_i_clka_en_d),
      .da_d(yt_rsc_0_4_i_da_d),
      .qa_d(yt_rsc_0_4_i_qa_d),
      .wea_d(yt_rsc_0_4_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_11_32_2048_2048_32_1_gen
      yt_rsc_0_5_i (
      .clkb_en(yt_rsc_0_5_clkb_en),
      .clka_en(yt_rsc_0_5_clka_en),
      .qb(yt_rsc_0_5_qb),
      .web(yt_rsc_0_5_web),
      .db(yt_rsc_0_5_db),
      .adrb(yt_rsc_0_5_adrb),
      .qa(yt_rsc_0_5_qa),
      .wea(yt_rsc_0_5_wea),
      .da(yt_rsc_0_5_da),
      .adra(yt_rsc_0_5_adra),
      .adra_d(yt_rsc_0_5_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_5_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_5_i_clka_en_d),
      .da_d(yt_rsc_0_5_i_da_d),
      .qa_d(yt_rsc_0_5_i_qa_d),
      .wea_d(yt_rsc_0_5_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_11_32_2048_2048_32_1_gen
      yt_rsc_0_6_i (
      .clkb_en(yt_rsc_0_6_clkb_en),
      .clka_en(yt_rsc_0_6_clka_en),
      .qb(yt_rsc_0_6_qb),
      .web(yt_rsc_0_6_web),
      .db(yt_rsc_0_6_db),
      .adrb(yt_rsc_0_6_adrb),
      .qa(yt_rsc_0_6_qa),
      .wea(yt_rsc_0_6_wea),
      .da(yt_rsc_0_6_da),
      .adra(yt_rsc_0_6_adra),
      .adra_d(yt_rsc_0_6_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_6_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_6_i_clka_en_d),
      .da_d(yt_rsc_0_6_i_da_d),
      .qa_d(yt_rsc_0_6_i_qa_d),
      .wea_d(yt_rsc_0_6_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_11_32_2048_2048_32_1_gen
      yt_rsc_0_7_i (
      .clkb_en(yt_rsc_0_7_clkb_en),
      .clka_en(yt_rsc_0_7_clka_en),
      .qb(yt_rsc_0_7_qb),
      .web(yt_rsc_0_7_web),
      .db(yt_rsc_0_7_db),
      .adrb(yt_rsc_0_7_adrb),
      .qa(yt_rsc_0_7_qa),
      .wea(yt_rsc_0_7_wea),
      .da(yt_rsc_0_7_da),
      .adra(yt_rsc_0_7_adra),
      .adra_d(yt_rsc_0_7_i_adra_d),
      .clka(clk),
      .clka_en_d(yt_rsc_0_7_i_clka_en_d),
      .clkb_en_d(yt_rsc_0_7_i_clka_en_d),
      .da_d(yt_rsc_0_7_i_da_d),
      .qa_d(yt_rsc_0_7_i_qa_d),
      .wea_d(yt_rsc_0_7_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_11_32_2048_2048_32_1_gen
      xt_rsc_0_0_i (
      .qb(xt_rsc_0_0_qb),
      .web(xt_rsc_0_0_web),
      .db(xt_rsc_0_0_db),
      .adrb(xt_rsc_0_0_adrb),
      .qa(xt_rsc_0_0_qa),
      .wea(xt_rsc_0_0_wea),
      .da(xt_rsc_0_0_da),
      .adra(xt_rsc_0_0_adra),
      .adra_d(xt_rsc_0_0_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_0_i_da_d),
      .qa_d(xt_rsc_0_0_i_qa_d),
      .wea_d(xt_rsc_0_0_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_11_32_2048_2048_32_1_gen
      xt_rsc_0_1_i (
      .qb(xt_rsc_0_1_qb),
      .web(xt_rsc_0_1_web),
      .db(xt_rsc_0_1_db),
      .adrb(xt_rsc_0_1_adrb),
      .qa(xt_rsc_0_1_qa),
      .wea(xt_rsc_0_1_wea),
      .da(xt_rsc_0_1_da),
      .adra(xt_rsc_0_1_adra),
      .adra_d(xt_rsc_0_1_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_1_i_da_d),
      .qa_d(xt_rsc_0_1_i_qa_d),
      .wea_d(xt_rsc_0_1_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_11_32_2048_2048_32_1_gen
      xt_rsc_0_2_i (
      .qb(xt_rsc_0_2_qb),
      .web(xt_rsc_0_2_web),
      .db(xt_rsc_0_2_db),
      .adrb(xt_rsc_0_2_adrb),
      .qa(xt_rsc_0_2_qa),
      .wea(xt_rsc_0_2_wea),
      .da(xt_rsc_0_2_da),
      .adra(xt_rsc_0_2_adra),
      .adra_d(xt_rsc_0_2_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_2_i_da_d),
      .qa_d(xt_rsc_0_2_i_qa_d),
      .wea_d(xt_rsc_0_2_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_11_32_2048_2048_32_1_gen
      xt_rsc_0_3_i (
      .qb(xt_rsc_0_3_qb),
      .web(xt_rsc_0_3_web),
      .db(xt_rsc_0_3_db),
      .adrb(xt_rsc_0_3_adrb),
      .qa(xt_rsc_0_3_qa),
      .wea(xt_rsc_0_3_wea),
      .da(xt_rsc_0_3_da),
      .adra(xt_rsc_0_3_adra),
      .adra_d(xt_rsc_0_3_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_3_i_da_d),
      .qa_d(xt_rsc_0_3_i_qa_d),
      .wea_d(xt_rsc_0_3_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_11_32_2048_2048_32_1_gen
      xt_rsc_0_4_i (
      .qb(xt_rsc_0_4_qb),
      .web(xt_rsc_0_4_web),
      .db(xt_rsc_0_4_db),
      .adrb(xt_rsc_0_4_adrb),
      .qa(xt_rsc_0_4_qa),
      .wea(xt_rsc_0_4_wea),
      .da(xt_rsc_0_4_da),
      .adra(xt_rsc_0_4_adra),
      .adra_d(xt_rsc_0_4_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_4_i_da_d),
      .qa_d(xt_rsc_0_4_i_qa_d),
      .wea_d(xt_rsc_0_4_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_11_32_2048_2048_32_1_gen
      xt_rsc_0_5_i (
      .qb(xt_rsc_0_5_qb),
      .web(xt_rsc_0_5_web),
      .db(xt_rsc_0_5_db),
      .adrb(xt_rsc_0_5_adrb),
      .qa(xt_rsc_0_5_qa),
      .wea(xt_rsc_0_5_wea),
      .da(xt_rsc_0_5_da),
      .adra(xt_rsc_0_5_adra),
      .adra_d(xt_rsc_0_5_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_5_i_da_d),
      .qa_d(xt_rsc_0_5_i_qa_d),
      .wea_d(xt_rsc_0_5_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_11_32_2048_2048_32_1_gen
      xt_rsc_0_6_i (
      .qb(xt_rsc_0_6_qb),
      .web(xt_rsc_0_6_web),
      .db(xt_rsc_0_6_db),
      .adrb(xt_rsc_0_6_adrb),
      .qa(xt_rsc_0_6_qa),
      .wea(xt_rsc_0_6_wea),
      .da(xt_rsc_0_6_da),
      .adra(xt_rsc_0_6_adra),
      .adra_d(xt_rsc_0_6_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_6_i_da_d),
      .qa_d(xt_rsc_0_6_i_qa_d),
      .wea_d(xt_rsc_0_6_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_11_32_2048_2048_32_1_gen
      xt_rsc_0_7_i (
      .qb(xt_rsc_0_7_qb),
      .web(xt_rsc_0_7_web),
      .db(xt_rsc_0_7_db),
      .adrb(xt_rsc_0_7_adrb),
      .qa(xt_rsc_0_7_qa),
      .wea(xt_rsc_0_7_wea),
      .da(xt_rsc_0_7_da),
      .adra(xt_rsc_0_7_adra),
      .adra_d(xt_rsc_0_7_i_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(xt_rsc_0_7_i_da_d),
      .qa_d(xt_rsc_0_7_i_qa_d),
      .wea_d(xt_rsc_0_7_i_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  stockham_dit_core stockham_dit_core_inst (
      .clk(clk),
      .rst(rst),
      .xt_rsc_triosy_0_0_lz(xt_rsc_triosy_0_0_lz),
      .xt_rsc_triosy_0_1_lz(xt_rsc_triosy_0_1_lz),
      .xt_rsc_triosy_0_2_lz(xt_rsc_triosy_0_2_lz),
      .xt_rsc_triosy_0_3_lz(xt_rsc_triosy_0_3_lz),
      .xt_rsc_triosy_0_4_lz(xt_rsc_triosy_0_4_lz),
      .xt_rsc_triosy_0_5_lz(xt_rsc_triosy_0_5_lz),
      .xt_rsc_triosy_0_6_lz(xt_rsc_triosy_0_6_lz),
      .xt_rsc_triosy_0_7_lz(xt_rsc_triosy_0_7_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .twiddle_h_rsci_q_d(twiddle_h_rsci_q_d),
      .yt_rsc_0_0_i_adra_d(yt_rsc_0_0_i_adra_d),
      .yt_rsc_0_0_i_clka_en_d(yt_rsc_0_0_i_clka_en_d),
      .yt_rsc_0_0_i_da_d(yt_rsc_0_0_i_da_d),
      .yt_rsc_0_0_i_qa_d(yt_rsc_0_0_i_qa_d),
      .yt_rsc_0_0_i_wea_d(yt_rsc_0_0_i_wea_d),
      .yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_1_i_adra_d(yt_rsc_0_1_i_adra_d),
      .yt_rsc_0_1_i_clka_en_d(yt_rsc_0_1_i_clka_en_d),
      .yt_rsc_0_1_i_da_d(yt_rsc_0_1_i_da_d),
      .yt_rsc_0_1_i_qa_d(yt_rsc_0_1_i_qa_d),
      .yt_rsc_0_1_i_wea_d(yt_rsc_0_1_i_wea_d),
      .yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_2_i_adra_d(yt_rsc_0_2_i_adra_d),
      .yt_rsc_0_2_i_clka_en_d(yt_rsc_0_2_i_clka_en_d),
      .yt_rsc_0_2_i_da_d(yt_rsc_0_2_i_da_d),
      .yt_rsc_0_2_i_qa_d(yt_rsc_0_2_i_qa_d),
      .yt_rsc_0_2_i_wea_d(yt_rsc_0_2_i_wea_d),
      .yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_3_i_adra_d(yt_rsc_0_3_i_adra_d),
      .yt_rsc_0_3_i_clka_en_d(yt_rsc_0_3_i_clka_en_d),
      .yt_rsc_0_3_i_da_d(yt_rsc_0_3_i_da_d),
      .yt_rsc_0_3_i_qa_d(yt_rsc_0_3_i_qa_d),
      .yt_rsc_0_3_i_wea_d(yt_rsc_0_3_i_wea_d),
      .yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_4_i_adra_d(yt_rsc_0_4_i_adra_d),
      .yt_rsc_0_4_i_clka_en_d(yt_rsc_0_4_i_clka_en_d),
      .yt_rsc_0_4_i_da_d(yt_rsc_0_4_i_da_d),
      .yt_rsc_0_4_i_qa_d(yt_rsc_0_4_i_qa_d),
      .yt_rsc_0_4_i_wea_d(yt_rsc_0_4_i_wea_d),
      .yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_5_i_adra_d(yt_rsc_0_5_i_adra_d),
      .yt_rsc_0_5_i_clka_en_d(yt_rsc_0_5_i_clka_en_d),
      .yt_rsc_0_5_i_da_d(yt_rsc_0_5_i_da_d),
      .yt_rsc_0_5_i_qa_d(yt_rsc_0_5_i_qa_d),
      .yt_rsc_0_5_i_wea_d(yt_rsc_0_5_i_wea_d),
      .yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_6_i_adra_d(yt_rsc_0_6_i_adra_d),
      .yt_rsc_0_6_i_clka_en_d(yt_rsc_0_6_i_clka_en_d),
      .yt_rsc_0_6_i_da_d(yt_rsc_0_6_i_da_d),
      .yt_rsc_0_6_i_qa_d(yt_rsc_0_6_i_qa_d),
      .yt_rsc_0_6_i_wea_d(yt_rsc_0_6_i_wea_d),
      .yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .yt_rsc_0_7_i_adra_d(yt_rsc_0_7_i_adra_d),
      .yt_rsc_0_7_i_clka_en_d(yt_rsc_0_7_i_clka_en_d),
      .yt_rsc_0_7_i_da_d(yt_rsc_0_7_i_da_d),
      .yt_rsc_0_7_i_qa_d(yt_rsc_0_7_i_qa_d),
      .yt_rsc_0_7_i_wea_d(yt_rsc_0_7_i_wea_d),
      .yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d(yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d(yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_0_i_adra_d(xt_rsc_0_0_i_adra_d),
      .xt_rsc_0_0_i_da_d(xt_rsc_0_0_i_da_d),
      .xt_rsc_0_0_i_qa_d(xt_rsc_0_0_i_qa_d),
      .xt_rsc_0_0_i_wea_d(xt_rsc_0_0_i_wea_d),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_1_i_adra_d(xt_rsc_0_1_i_adra_d),
      .xt_rsc_0_1_i_da_d(xt_rsc_0_1_i_da_d),
      .xt_rsc_0_1_i_qa_d(xt_rsc_0_1_i_qa_d),
      .xt_rsc_0_1_i_wea_d(xt_rsc_0_1_i_wea_d),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_2_i_adra_d(xt_rsc_0_2_i_adra_d),
      .xt_rsc_0_2_i_da_d(xt_rsc_0_2_i_da_d),
      .xt_rsc_0_2_i_qa_d(xt_rsc_0_2_i_qa_d),
      .xt_rsc_0_2_i_wea_d(xt_rsc_0_2_i_wea_d),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_3_i_adra_d(xt_rsc_0_3_i_adra_d),
      .xt_rsc_0_3_i_da_d(xt_rsc_0_3_i_da_d),
      .xt_rsc_0_3_i_qa_d(xt_rsc_0_3_i_qa_d),
      .xt_rsc_0_3_i_wea_d(xt_rsc_0_3_i_wea_d),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_4_i_adra_d(xt_rsc_0_4_i_adra_d),
      .xt_rsc_0_4_i_da_d(xt_rsc_0_4_i_da_d),
      .xt_rsc_0_4_i_qa_d(xt_rsc_0_4_i_qa_d),
      .xt_rsc_0_4_i_wea_d(xt_rsc_0_4_i_wea_d),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_5_i_adra_d(xt_rsc_0_5_i_adra_d),
      .xt_rsc_0_5_i_da_d(xt_rsc_0_5_i_da_d),
      .xt_rsc_0_5_i_qa_d(xt_rsc_0_5_i_qa_d),
      .xt_rsc_0_5_i_wea_d(xt_rsc_0_5_i_wea_d),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_6_i_adra_d(xt_rsc_0_6_i_adra_d),
      .xt_rsc_0_6_i_da_d(xt_rsc_0_6_i_da_d),
      .xt_rsc_0_6_i_qa_d(xt_rsc_0_6_i_qa_d),
      .xt_rsc_0_6_i_wea_d(xt_rsc_0_6_i_wea_d),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .xt_rsc_0_7_i_adra_d(xt_rsc_0_7_i_adra_d),
      .xt_rsc_0_7_i_da_d(xt_rsc_0_7_i_da_d),
      .xt_rsc_0_7_i_qa_d(xt_rsc_0_7_i_qa_d),
      .xt_rsc_0_7_i_wea_d(xt_rsc_0_7_i_wea_d),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d(xt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d),
      .mult_t_mul_cmp_a(mult_t_mul_cmp_a),
      .mult_t_mul_cmp_b(mult_t_mul_cmp_b),
      .mult_t_mul_cmp_z(nl_stockham_dit_core_inst_mult_t_mul_cmp_z[63:0]),
      .twiddle_rsci_radr_d_pff(twiddle_rsci_radr_d_iff),
      .twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );

  function automatic [63:0] conv_u2u_64_64 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_64 = vector;
  end
  endfunction

endmodule



