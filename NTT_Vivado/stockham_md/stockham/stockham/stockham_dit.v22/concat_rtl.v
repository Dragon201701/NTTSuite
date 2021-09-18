
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
//  Generated date: Thu Sep 16 00:41:23 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
    (
  clkb_en, clka_en, qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en_d,
      clkb_en_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  output clkb_en;
  output clka_en;
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [6:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [6:0] adra;
  input [13:0] adra_d;
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
  assign adrb = (adra_d[13:7]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[6:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [9:0] radr;
  output [31:0] q_d;
  input [9:0] radr_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen (
  q, radr, q_d, radr_d, readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [9:0] radr;
  output [31:0] q_d;
  input [9:0] radr_d;
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
  output [13:0] yt_rsc_0_0_i_adra_d;
  output yt_rsc_0_0_i_clka_en_d;
  output [63:0] yt_rsc_0_0_i_da_d;
  input [63:0] yt_rsc_0_0_i_qa_d;
  output [1:0] yt_rsc_0_0_i_wea_d;
  output [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_1_i_adra_d;
  output yt_rsc_0_1_i_clka_en_d;
  output [63:0] yt_rsc_0_1_i_da_d;
  input [63:0] yt_rsc_0_1_i_qa_d;
  output [1:0] yt_rsc_0_1_i_wea_d;
  output [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_2_i_adra_d;
  output yt_rsc_0_2_i_clka_en_d;
  output [63:0] yt_rsc_0_2_i_da_d;
  input [63:0] yt_rsc_0_2_i_qa_d;
  output [1:0] yt_rsc_0_2_i_wea_d;
  output [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_3_i_adra_d;
  output yt_rsc_0_3_i_clka_en_d;
  output [63:0] yt_rsc_0_3_i_da_d;
  input [63:0] yt_rsc_0_3_i_qa_d;
  output [1:0] yt_rsc_0_3_i_wea_d;
  output [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_4_i_adra_d;
  output yt_rsc_0_4_i_clka_en_d;
  output [63:0] yt_rsc_0_4_i_da_d;
  input [63:0] yt_rsc_0_4_i_qa_d;
  output [1:0] yt_rsc_0_4_i_wea_d;
  output [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_5_i_adra_d;
  output yt_rsc_0_5_i_clka_en_d;
  output [63:0] yt_rsc_0_5_i_da_d;
  input [63:0] yt_rsc_0_5_i_qa_d;
  output [1:0] yt_rsc_0_5_i_wea_d;
  output [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_6_i_adra_d;
  output yt_rsc_0_6_i_clka_en_d;
  output [63:0] yt_rsc_0_6_i_da_d;
  input [63:0] yt_rsc_0_6_i_qa_d;
  output [1:0] yt_rsc_0_6_i_wea_d;
  output [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] yt_rsc_0_7_i_adra_d;
  output yt_rsc_0_7_i_clka_en_d;
  output [63:0] yt_rsc_0_7_i_da_d;
  input [63:0] yt_rsc_0_7_i_qa_d;
  output [1:0] yt_rsc_0_7_i_wea_d;
  output [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_0_i_adra_d;
  output [63:0] xt_rsc_0_0_i_da_d;
  input [63:0] xt_rsc_0_0_i_qa_d;
  output [1:0] xt_rsc_0_0_i_wea_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_1_i_adra_d;
  output [63:0] xt_rsc_0_1_i_da_d;
  input [63:0] xt_rsc_0_1_i_qa_d;
  output [1:0] xt_rsc_0_1_i_wea_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_2_i_adra_d;
  output [63:0] xt_rsc_0_2_i_da_d;
  input [63:0] xt_rsc_0_2_i_qa_d;
  output [1:0] xt_rsc_0_2_i_wea_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_3_i_adra_d;
  output [63:0] xt_rsc_0_3_i_da_d;
  input [63:0] xt_rsc_0_3_i_qa_d;
  output [1:0] xt_rsc_0_3_i_wea_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_4_i_adra_d;
  output [63:0] xt_rsc_0_4_i_da_d;
  input [63:0] xt_rsc_0_4_i_qa_d;
  output [1:0] xt_rsc_0_4_i_wea_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_5_i_adra_d;
  output [63:0] xt_rsc_0_5_i_da_d;
  input [63:0] xt_rsc_0_5_i_qa_d;
  output [1:0] xt_rsc_0_5_i_wea_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_6_i_adra_d;
  output [63:0] xt_rsc_0_6_i_da_d;
  input [63:0] xt_rsc_0_6_i_qa_d;
  output [1:0] xt_rsc_0_6_i_wea_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [13:0] xt_rsc_0_7_i_adra_d;
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
  output [9:0] twiddle_rsci_radr_d_pff;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff;


  // Interconnect Declarations
  wire [31:0] p_rsci_idat;
  wire [31:0] mult_t_mul_cmp_z_oreg;
  wire [5:0] fsm_output;
  wire [9:0] for_for_b_for_for_b_acc_tmp;
  wire [10:0] nl_for_for_b_for_for_b_acc_tmp;
  wire [8:0] for_for_a_acc_tmp;
  wire [9:0] nl_for_for_a_acc_tmp;
  wire [8:0] operator_32_false_acc_tmp;
  wire [9:0] nl_operator_32_false_acc_tmp;
  wire or_dcpl_3;
  wire or_tmp_6;
  wire or_tmp_7;
  wire mux_tmp;
  wire and_dcpl_49;
  wire and_dcpl_51;
  wire or_dcpl_11;
  wire mux_tmp_1;
  wire or_dcpl_13;
  wire or_dcpl_14;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_61;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire or_dcpl_16;
  wire or_dcpl_17;
  wire and_dcpl_66;
  wire or_dcpl_18;
  wire and_dcpl_69;
  wire or_dcpl_20;
  wire or_dcpl_21;
  wire or_tmp_15;
  wire not_tmp_41;
  wire or_tmp_18;
  wire mux_tmp_4;
  wire mux_tmp_5;
  wire or_dcpl_24;
  wire and_dcpl_76;
  wire or_dcpl_26;
  wire and_dcpl_83;
  wire and_dcpl_85;
  wire or_dcpl_28;
  wire or_tmp_25;
  wire or_tmp_26;
  wire mux_tmp_7;
  wire and_dcpl_88;
  wire and_dcpl_90;
  wire mux_tmp_8;
  wire or_dcpl_31;
  wire or_dcpl_32;
  wire and_dcpl_93;
  wire and_dcpl_97;
  wire and_dcpl_98;
  wire or_dcpl_34;
  wire or_dcpl_35;
  wire and_dcpl_101;
  wire and_dcpl_103;
  wire and_dcpl_104;
  wire or_dcpl_37;
  wire not_tmp_48;
  wire or_tmp_33;
  wire not_tmp_50;
  wire nor_tmp_5;
  wire or_tmp_36;
  wire mux_tmp_11;
  wire mux_tmp_12;
  wire or_dcpl_40;
  wire or_dcpl_42;
  wire and_dcpl_115;
  wire and_dcpl_117;
  wire or_tmp_43;
  wire or_tmp_44;
  wire mux_tmp_14;
  wire and_dcpl_120;
  wire and_dcpl_122;
  wire or_tmp_49;
  wire mux_tmp_16;
  wire mux_tmp_17;
  wire or_dcpl_46;
  wire or_dcpl_47;
  wire and_dcpl_125;
  wire and_dcpl_128;
  wire and_dcpl_129;
  wire or_dcpl_49;
  wire or_dcpl_50;
  wire and_dcpl_132;
  wire and_dcpl_134;
  wire and_dcpl_135;
  wire or_dcpl_52;
  wire or_tmp_54;
  wire not_tmp_65;
  wire or_tmp_57;
  wire mux_tmp_21;
  wire or_tmp_62;
  wire mux_tmp_23;
  wire mux_tmp_24;
  wire or_dcpl_55;
  wire or_dcpl_57;
  wire and_dcpl_145;
  wire and_dcpl_147;
  wire or_tmp_66;
  wire or_tmp_67;
  wire mux_tmp_27;
  wire and_dcpl_150;
  wire and_dcpl_152;
  wire or_tmp_70;
  wire mux_tmp_29;
  wire mux_tmp_30;
  wire or_dcpl_61;
  wire or_dcpl_62;
  wire and_dcpl_157;
  wire and_dcpl_158;
  wire or_dcpl_64;
  wire or_dcpl_65;
  wire and_dcpl_161;
  wire and_dcpl_163;
  wire and_dcpl_164;
  wire nor_tmp_17;
  wire nor_tmp_18;
  wire mux_tmp_33;
  wire mux_tmp_34;
  wire or_dcpl_69;
  wire or_dcpl_71;
  wire or_dcpl_73;
  wire and_dcpl_173;
  wire and_dcpl_175;
  wire and_dcpl_177;
  wire or_dcpl_77;
  wire or_dcpl_78;
  wire and_dcpl_180;
  wire and_dcpl_181;
  wire and_dcpl_188;
  wire or_dcpl_80;
  wire or_dcpl_82;
  wire or_dcpl_83;
  wire or_dcpl_85;
  wire or_dcpl_88;
  wire or_dcpl_89;
  wire and_dcpl_199;
  wire and_dcpl_203;
  wire or_dcpl_93;
  wire and_dcpl_211;
  wire or_dcpl_97;
  wire or_dcpl_98;
  wire and_dcpl_214;
  wire and_dcpl_218;
  wire or_dcpl_101;
  wire or_dcpl_103;
  wire or_dcpl_107;
  wire and_dcpl_228;
  wire and_dcpl_232;
  wire or_dcpl_111;
  reg y_3_sva;
  wire for_for_b_nor_2_cse_1;
  wire for_for_b_nor_1_cse_1;
  wire for_for_b_nor_cse_1;
  reg [8:0] for_for_t_9_0_sva_8_0;
  wire [31:0] for_for_a_lpi_3_dfm_1;
  reg [31:0] mult_res_lpi_3_dfm_1;
  wire [9:0] for_for_acc_tdx_9_0_sva_1;
  wire [10:0] nl_for_for_acc_tdx_9_0_sva_1;
  reg nn_10_sva;
  reg nn_9_sva;
  reg nn_8_sva;
  reg nn_7_sva;
  reg nn_6_sva;
  reg nn_5_sva;
  reg nn_4_sva;
  reg nn_3_sva;
  reg nn_2_sva;
  reg nn_1_sva;
  wire [8:0] operator_34_true_1_and_psp_sva_1;
  wire [8:0] operator_34_true_and_psp_sva_1;
  wire for_for_a_nor_2_cse_1;
  wire for_for_a_nor_1_cse_1;
  wire for_for_a_nor_cse_1;
  reg for_for_a_asn_itm;
  reg for_for_stage_0_1;
  reg for_for_stage_0;
  reg for_for_a_asn_itm_1;
  reg for_for_a_conc_5_itm_1_0;
  reg [1:0] for_for_a_conc_5_itm_1_2_1;
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
  reg for_for_asn_12_itm;
  reg for_for_a_asn_itm_2;
  reg [1:0] for_for_a_conc_5_itm_2_1;
  reg for_for_a_for_for_a_and_5_itm_2;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2;
  reg for_for_asn_12_itm_2;
  reg [2:0] for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2;
  reg for_for_stage_0_3;
  reg operator_34_true_1_and_psp_sva_0;
  reg [2:0] for_for_b_acc_tdx_9_0_sva_2_0;
  reg for_for_asn_10_itm_2;
  reg x_3_sva;
  reg for_for_asn_10_itm;
  reg [31:0] tmp_2_sva_1;
  reg [31:0] p_sva;
  reg [31:0] for_for_w_asn_3_itm;
  wire or_442_ssc;
  wire or_432_ssc;
  wire or_422_ssc;
  wire or_412_ssc;
  wire or_402_ssc;
  wire or_392_ssc;
  wire or_382_ssc;
  wire or_363_ssc;
  wire or_352_ssc;
  wire or_341_ssc;
  wire or_330_ssc;
  wire or_319_ssc;
  wire or_308_ssc;
  wire or_297_ssc;
  wire or_286_ssc;
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
  wire for_for_mux_21_cse;
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
  wire nand_8_cse;
  wire or_173_cse;
  wire or_283_rmff;
  wire [31:0] modulo_sub_qelse_mux_rmff;
  wire [31:0] modulo_add_qelse_mux_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_14_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_30_rmff;
  wire or_294_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_13_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_31_rmff;
  wire or_305_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_12_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_32_rmff;
  wire or_316_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_11_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_33_rmff;
  wire or_327_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_10_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_34_rmff;
  wire or_338_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_9_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_35_rmff;
  wire or_349_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_8_rmff;
  wire for_for_b_for_for_b_for_for_b_nor_36_rmff;
  wire or_360_rmff;
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
  reg [6:0] for_for_acc_tdx_1_9_0_sva_2_9_3;
  reg [6:0] for_for_acc_tdx_9_0_sva_2_9_3;
  reg [6:0] for_for_a_acc_psp_sva_1_8_2;
  reg [3:0] shift_3_0_sva;
  wire [9:0] for_for_acc_tdx_1_9_0_sva_1;
  wire [10:0] nl_for_for_acc_tdx_1_9_0_sva_1;
  wire [9:0] for_for_w_lshift_itm;
  wire [8:0] for_for_w_rshift_itm;
  wire [31:0] z_out_1;
  wire [31:0] z_out_2;
  wire [31:0] z_out_3;
  wire [63:0] nl_z_out_3;
  wire [9:0] z_out_4;
  wire [10:0] nl_z_out_4;
  reg [3:0] idx_3_0_sva;
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
  reg for_for_a_for_for_a_and_itm;
  reg for_for_a_for_for_a_and_1_itm;
  reg for_for_a_for_for_a_and_3_itm;
  reg for_for_a_for_for_a_and_7_itm;
  reg for_for_a_for_for_a_and_8_itm;
  reg for_for_a_for_for_a_and_10_itm;
  reg for_for_b_for_for_b_nor_itm;
  reg for_for_b_for_for_b_and_itm;
  reg for_for_b_for_for_b_and_1_itm;
  reg for_for_b_for_for_b_and_3_itm;
  reg for_for_b_for_for_b_and_5_itm;
  reg for_for_b_for_for_b_and_6_itm;
  reg for_for_b_for_for_b_and_7_itm;
  reg for_for_b_for_for_b_and_8_itm;
  reg for_for_b_for_for_b_and_9_itm;
  reg for_for_b_for_for_b_and_10_itm;
  reg [31:0] mult_z_mul_itm;
  reg [2:0] for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_9_0_2_0_itm;
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
  reg for_for_asn_10_itm_1;
  reg [2:0] for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1;
  reg for_for_asn_12_itm_1;
  reg [2:0] for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1;
  reg [6:0] for_for_acc_tdx_9_0_sva_1_9_3;
  reg [6:0] for_for_acc_tdx_1_9_0_sva_1_9_3;
  wire [3:0] idx_3_0_sva_2;
  wire [4:0] nl_idx_3_0_sva_2;
  wire xt_rsc_0_0_i_wea_d_mx0c0;
  wire for_for_a_and_3;
  reg [6:0] for_for_acc_tdx_9_0_sva_9_3;
  reg [6:0] for_for_acc_tdx_1_9_0_sva_9_3;
  reg reg_s_9_0_ftd;
  reg [8:0] reg_s_9_0_ftd_1;
  wire for_for_a_or_12_cse;
  wire or_cse;
  reg [6:0] for_for_a_acc_psp_sva_8_2;
  reg [1:0] for_for_a_acc_psp_sva_1_0;
  wire and_cse;
  wire z_out_32;

  wire[0:0] for_for_b_for_for_b_and_4_nl;
  wire[0:0] for_for_b_for_for_b_and_2_nl;
  wire[0:0] for_for_a_for_for_a_and_11_nl;
  wire[0:0] for_for_a_for_for_a_and_5_nl;
  wire[0:0] for_for_a_for_for_a_and_6_nl;
  wire[0:0] for_for_a_for_for_a_and_9_nl;
  wire[0:0] for_for_a_for_for_a_nor_1_nl;
  wire[0:0] for_for_a_for_for_a_nor_nl;
  wire[0:0] for_for_b_for_for_b_nor_1_nl;
  wire[0:0] for_for_b_for_for_b_and_11_nl;
  wire[0:0] for_for_b_for_for_b_and_12_nl;
  wire[0:0] for_for_b_for_for_b_and_13_nl;
  wire[0:0] for_for_a_for_for_a_and_12_nl;
  wire[0:0] for_for_a_for_for_a_and_13_nl;
  wire[0:0] for_for_a_for_for_a_and_2_nl;
  wire[0:0] for_for_a_for_for_a_and_4_nl;
  wire[0:0] idx_not_1_nl;
  wire[0:0] y_not_35_nl;
  wire[3:0] operator_32_false_2_acc_nl;
  wire[4:0] nl_operator_32_false_2_acc_nl;
  wire[0:0] mux_12_nl;
  wire[0:0] and_71_nl;
  wire[0:0] mux_16_nl;
  wire[0:0] and_94_nl;
  wire[0:0] mux_19_nl;
  wire[0:0] and_114_nl;
  wire[0:0] mux_23_nl;
  wire[0:0] and_133_nl;
  wire[0:0] mux_29_nl;
  wire[0:0] mux_28_nl;
  wire[0:0] nor_28_nl;
  wire[0:0] or_91_nl;
  wire[0:0] mux_36_nl;
  wire[0:0] mux_35_nl;
  wire[0:0] nor_27_nl;
  wire[0:0] or_113_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] mux_41_nl;
  wire[0:0] and_1020_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] or_144_nl;
  wire[0:0] for_for_a_mux1h_66_nl;
  wire[0:0] for_for_and_6_nl;
  wire[0:0] for_for_mux1h_31_nl;
  wire[0:0] for_for_mux1h_33_nl;
  wire[0:0] nn_mux_nl;
  wire[31:0] for_for_acc_5_nl;
  wire[32:0] nl_for_for_acc_5_nl;
  wire[31:0] for_for_acc_2_nl;
  wire[32:0] nl_for_for_acc_2_nl;
  wire[9:0] for_for_b_acc_nl;
  wire[10:0] nl_for_for_b_acc_nl;
  wire[0:0] and_62_nl;
  wire[0:0] or_25_nl;
  wire[0:0] mux_13_nl;
  wire[0:0] or_36_nl;
  wire[0:0] or_47_nl;
  wire[0:0] and_106_nl;
  wire[0:0] or_62_nl;
  wire[0:0] mux_20_nl;
  wire[0:0] or_71_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] nand_12_nl;
  wire[0:0] and_143_nl;
  wire[0:0] mux_25_nl;
  wire[0:0] or_93_nl;
  wire[0:0] nor_31_nl;
  wire[0:0] or_92_nl;
  wire[0:0] mux_30_nl;
  wire[0:0] or_106_nl;
  wire[0:0] mux_32_nl;
  wire[0:0] or_115_nl;
  wire[0:0] nor_29_nl;
  wire[0:0] or_114_nl;
  wire[0:0] and_174_nl;
  wire[0:0] mux_38_nl;
  wire[0:0] and_1026_nl;
  wire[0:0] or_129_nl;
  wire[0:0] and_1027_nl;
  wire[0:0] or_141_nl;
  wire[0:0] and_1021_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] and_205_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] or_161_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] and_225_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] and_241_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] or_185_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] and_256_nl;
  wire[0:0] mux_56_nl;
  wire[0:0] nor_25_nl;
  wire[6:0] for_for_b_for_for_b_mux_1_nl;
  wire[6:0] for_for_b_for_for_b_mux_nl;
  wire[0:0] for_for_b_or_44_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_29_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_45_nl;
  wire[6:0] for_for_b_for_for_b_mux_3_nl;
  wire[6:0] for_for_b_for_for_b_mux_2_nl;
  wire[0:0] for_for_b_or_45_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_28_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_46_nl;
  wire[6:0] for_for_b_for_for_b_mux_5_nl;
  wire[6:0] for_for_b_for_for_b_mux_4_nl;
  wire[0:0] for_for_b_or_46_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_27_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_47_nl;
  wire[6:0] for_for_b_for_for_b_mux_7_nl;
  wire[6:0] for_for_b_for_for_b_mux_6_nl;
  wire[0:0] for_for_b_or_47_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_26_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_48_nl;
  wire[6:0] for_for_b_for_for_b_mux_9_nl;
  wire[6:0] for_for_b_for_for_b_mux_8_nl;
  wire[0:0] for_for_b_or_48_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_25_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_49_nl;
  wire[6:0] for_for_b_for_for_b_mux_11_nl;
  wire[6:0] for_for_b_for_for_b_mux_10_nl;
  wire[0:0] for_for_b_or_49_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_24_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_50_nl;
  wire[6:0] for_for_b_for_for_b_mux_13_nl;
  wire[6:0] for_for_b_for_for_b_mux_12_nl;
  wire[0:0] for_for_b_or_50_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_23_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_51_nl;
  wire[6:0] for_for_b_for_for_b_mux_15_nl;
  wire[6:0] for_for_b_for_for_b_mux_14_nl;
  wire[0:0] for_for_b_or_51_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_22_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_52_nl;
  wire[6:0] for_for_a_mux1h_132_nl;
  wire[0:0] and_629_nl;
  wire[0:0] or_379_nl;
  wire[6:0] for_for_b_for_for_b_mux_17_nl;
  wire[6:0] for_for_b_for_for_b_mux_16_nl;
  wire[0:0] for_for_b_or_52_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_21_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_53_nl;
  wire[6:0] for_for_b_for_for_b_mux_19_nl;
  wire[6:0] for_for_b_for_for_b_mux_18_nl;
  wire[0:0] for_for_b_or_53_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_20_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_54_nl;
  wire[6:0] for_for_b_for_for_b_mux_21_nl;
  wire[6:0] for_for_b_for_for_b_mux_20_nl;
  wire[0:0] for_for_b_or_54_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_19_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_55_nl;
  wire[6:0] for_for_b_for_for_b_mux_23_nl;
  wire[6:0] for_for_b_for_for_b_mux_22_nl;
  wire[0:0] for_for_b_or_55_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_18_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_56_nl;
  wire[6:0] for_for_b_for_for_b_mux_25_nl;
  wire[6:0] for_for_b_for_for_b_mux_24_nl;
  wire[0:0] for_for_b_or_56_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_17_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_57_nl;
  wire[6:0] for_for_b_for_for_b_mux_27_nl;
  wire[6:0] for_for_b_for_for_b_mux_26_nl;
  wire[0:0] for_for_b_or_57_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_16_nl;
  wire[0:0] for_for_b_for_for_b_for_for_b_nor_58_nl;
  wire[6:0] for_for_b_for_for_b_mux_29_nl;
  wire[6:0] for_for_b_for_for_b_mux_28_nl;
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
  wire[31:0] mult_z_mux_2_nl;
  wire[31:0] mult_z_mux_3_nl;
  wire[8:0] for_for_mux_24_nl;
  wire[2:0] for_for_mux_25_nl;

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
  mgc_shift_r_v5 #(.width_a(32'sd9),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd9)) for_for_w_rshift_rg (
      .a(operator_34_true_and_psp_sva_1),
      .s(shift_3_0_sva),
      .z(for_for_w_rshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd9),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) for_for_w_lshift_rg (
      .a(for_for_w_rshift_itm),
      .s(shift_3_0_sva),
      .z(for_for_w_lshift_itm)
    );
  stockham_dit_core_wait_dp stockham_dit_core_wait_dp_inst (
      .clk(clk),
      .yt_rsc_0_0_cgo_iro(or_283_rmff),
      .yt_rsc_0_0_i_clka_en_d(yt_rsc_0_0_i_clka_en_d),
      .yt_rsc_0_1_cgo_iro(or_294_rmff),
      .yt_rsc_0_1_i_clka_en_d(yt_rsc_0_1_i_clka_en_d),
      .yt_rsc_0_2_cgo_iro(or_305_rmff),
      .yt_rsc_0_2_i_clka_en_d(yt_rsc_0_2_i_clka_en_d),
      .yt_rsc_0_3_cgo_iro(or_316_rmff),
      .yt_rsc_0_3_i_clka_en_d(yt_rsc_0_3_i_clka_en_d),
      .yt_rsc_0_4_cgo_iro(or_327_rmff),
      .yt_rsc_0_4_i_clka_en_d(yt_rsc_0_4_i_clka_en_d),
      .yt_rsc_0_5_cgo_iro(or_338_rmff),
      .yt_rsc_0_5_i_clka_en_d(yt_rsc_0_5_i_clka_en_d),
      .yt_rsc_0_6_cgo_iro(or_349_rmff),
      .yt_rsc_0_6_i_clka_en_d(yt_rsc_0_6_i_clka_en_d),
      .yt_rsc_0_7_cgo_iro(or_360_rmff),
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
  assign for_for_a_or_12_cse = ~((y_3_sva & (fsm_output[1])) | (fsm_output[2]));
  assign for_for_mux_21_cse = for_for_stage_0 | y_or_cse;
  assign and_cse = for_for_stage_0_1 & (fsm_output[1]);
  assign or_cse = (fsm_output[5]) | (fsm_output[0]);
  assign for_for_or_cse = (fsm_output[3]) | y_or_cse;
  assign and_71_nl = (operator_34_true_1_and_psp_sva_0 | (for_for_a_acc_psp_sva_1_0!=2'b00))
      & ((for_for_b_acc_tdx_9_0_sva_2_0!=3'b000)) & mux_tmp_1;
  assign mux_12_nl = MUX_s_1_2_2(mux_tmp_1, and_71_nl, and_dcpl_49);
  assign or_283_rmff = ((~ mux_tmp) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & for_for_a_nor_cse_1) | and_dcpl_51) & and_dcpl_49 & (fsm_output[1])) | ((~
      mux_12_nl) & (fsm_output[2]));
  assign for_for_b_or_42_seb = (~ (fsm_output[1])) | (or_dcpl_18 & or_dcpl_14) |
      or_dcpl_16;
  assign and_94_nl = ((~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0!=2'b00))
      & ((for_for_b_acc_tdx_9_0_sva_2_0!=3'b001)) & mux_tmp_5;
  assign mux_16_nl = MUX_s_1_2_2(mux_tmp_5, and_94_nl, and_dcpl_49);
  assign or_294_rmff = ((~ mux_tmp_4) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_66
      & for_for_a_nor_cse_1) | (for_for_b_nor_cse_1 & (for_for_b_for_for_b_acc_tmp[0])))
      & and_dcpl_49 & (fsm_output[1])) | ((~ mux_16_nl) & (fsm_output[2]));
  assign for_for_b_or_40_seb = (~ (fsm_output[1])) | and_dcpl_83 | or_dcpl_16;
  assign and_114_nl = (operator_34_true_1_and_psp_sva_0 | (for_for_a_acc_psp_sva_1_0!=2'b01))
      & ((for_for_b_acc_tdx_9_0_sva_2_0!=3'b010)) & mux_tmp_8;
  assign mux_19_nl = MUX_s_1_2_2(mux_tmp_8, and_114_nl, and_dcpl_49);
  assign or_305_rmff = ((~ mux_tmp_7) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_90) | (and_dcpl_88 & (~ (for_for_b_for_for_b_acc_tmp[0])))) & and_dcpl_49
      & (fsm_output[1])) | ((~ mux_19_nl) & (fsm_output[2]));
  assign for_for_b_or_38_seb = (~ (fsm_output[1])) | and_dcpl_101 | or_dcpl_16;
  assign and_133_nl = ((~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0!=2'b01))
      & ((for_for_b_acc_tdx_9_0_sva_2_0!=3'b011)) & mux_tmp_12;
  assign mux_23_nl = MUX_s_1_2_2(mux_tmp_12, and_133_nl, and_dcpl_49);
  assign or_316_rmff = ((~ mux_tmp_11) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_66
      & and_dcpl_90) | (and_dcpl_88 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_49
      & (fsm_output[1])) | ((~ mux_23_nl) & (fsm_output[2]));
  assign for_for_b_or_36_seb = (~ (fsm_output[1])) | and_dcpl_115 | or_dcpl_16;
  assign nor_28_nl = ~((for_for_a_acc_psp_sva_1_0[1]) | (~ mux_tmp_17));
  assign or_91_nl = operator_34_true_1_and_psp_sva_0 | (for_for_a_acc_psp_sva_1_0[0]);
  assign mux_28_nl = MUX_s_1_2_2(nor_28_nl, mux_tmp_17, or_91_nl);
  assign mux_29_nl = MUX_s_1_2_2(mux_tmp_16, mux_28_nl, and_dcpl_49);
  assign or_327_rmff = ((~ mux_tmp_14) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_122) | (and_dcpl_120 & (~ (for_for_b_for_for_b_acc_tmp[0])))) &
      and_dcpl_49 & (fsm_output[1])) | ((~ mux_29_nl) & (fsm_output[2]));
  assign for_for_b_or_34_seb = (~ (fsm_output[1])) | and_dcpl_132 | or_dcpl_16;
  assign nor_27_nl = ~((for_for_a_acc_psp_sva_1_0[1]) | (~ mux_tmp_24));
  assign or_113_nl = (~ operator_34_true_1_and_psp_sva_0) | (for_for_a_acc_psp_sva_1_0[0]);
  assign mux_35_nl = MUX_s_1_2_2(nor_27_nl, mux_tmp_24, or_113_nl);
  assign mux_36_nl = MUX_s_1_2_2(mux_tmp_23, mux_35_nl, and_dcpl_49);
  assign or_338_rmff = ((~ mux_tmp_21) & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_66
      & and_dcpl_122) | (and_dcpl_120 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_49
      & (fsm_output[1])) | ((~ mux_36_nl) & (fsm_output[2]));
  assign for_for_b_or_32_seb = (~ (fsm_output[1])) | and_dcpl_145 | or_dcpl_16;
  assign and_1020_nl = (~((for_for_a_acc_psp_sva_1_0==2'b11))) & mux_tmp_30;
  assign mux_41_nl = MUX_s_1_2_2(and_1020_nl, mux_tmp_30, operator_34_true_1_and_psp_sva_0);
  assign mux_42_nl = MUX_s_1_2_2(mux_tmp_29, mux_41_nl, and_dcpl_49);
  assign or_349_rmff = ((~ mux_tmp_27) & for_for_stage_0_3 & (fsm_output[3])) | (((or_dcpl_11
      & and_dcpl_152) | (and_dcpl_150 & (~ (for_for_b_for_for_b_acc_tmp[0])))) &
      and_dcpl_49 & (fsm_output[1])) | ((~ mux_42_nl) & (fsm_output[2]));
  assign for_for_b_or_30_seb = (~ (fsm_output[1])) | and_dcpl_161 | or_dcpl_16;
  assign or_144_nl = (operator_34_true_1_and_psp_sva_0 & (for_for_a_acc_psp_sva_1_0==2'b11))
      | ((for_for_b_acc_tdx_9_0_sva_2_0==3'b111)) | mux_tmp_34;
  assign mux_45_nl = MUX_s_1_2_2(mux_tmp_34, or_144_nl, and_dcpl_49);
  assign or_360_rmff = (mux_tmp_33 & for_for_stage_0_3 & (fsm_output[3])) | (((and_dcpl_66
      & and_dcpl_152) | (and_dcpl_150 & (for_for_b_for_for_b_acc_tmp[0]))) & and_dcpl_49
      & (fsm_output[1])) | (mux_45_nl & (fsm_output[2]));
  assign for_for_b_or_28_seb = (~ (fsm_output[1])) | and_dcpl_173 | or_dcpl_16;
  assign for_for_b_or_26_seb = (~ (fsm_output[1])) | and_dcpl_83 | or_dcpl_85;
  assign for_for_b_or_24_seb = (~ (fsm_output[1])) | and_dcpl_101 | or_dcpl_85;
  assign for_for_b_or_22_seb = (~ (fsm_output[1])) | and_dcpl_115 | or_dcpl_85;
  assign for_for_b_or_20_seb = (~ (fsm_output[1])) | and_dcpl_132 | or_dcpl_85;
  assign for_for_b_or_18_seb = (~ (fsm_output[1])) | and_dcpl_145 | or_dcpl_85;
  assign for_for_b_or_16_seb = (~ (fsm_output[1])) | and_dcpl_161 | or_dcpl_85;
  assign for_for_b_or_14_seb = (~ (fsm_output[1])) | and_dcpl_173 | or_dcpl_85;
  assign nl_idx_3_0_sva_2 = idx_3_0_sva + 4'b0001;
  assign idx_3_0_sva_2 = nl_idx_3_0_sva_2[3:0];
  assign for_for_a_lpi_3_dfm_1 = MUX1HOT_v_32_16_2((xt_rsc_0_0_i_qa_d[31:0]), tmp_2_sva_1,
      tmp_2_sva_2, tmp_2_sva_3, tmp_2_sva_4, tmp_2_sva_5, tmp_2_sva_6, tmp_2_sva_7,
      tmp_sva_7, tmp_sva, tmp_sva_1, tmp_sva_2, tmp_sva_3, tmp_sva_4, tmp_sva_5,
      tmp_sva_6, {for_for_a_for_for_a_nor_itm_2 , for_for_a_for_for_a_and_itm_2 ,
      for_for_a_for_for_a_and_1_itm_2 , for_for_a_for_for_a_and_2_itm_2 , for_for_a_for_for_a_and_3_itm_2
      , for_for_a_for_for_a_and_4_itm_2 , for_for_a_for_for_a_and_5_itm_2 , for_for_a_for_for_a_and_6_itm_2
      , for_for_a_and_3 , for_for_a_for_for_a_and_7_itm_2 , for_for_a_for_for_a_and_8_itm_2
      , for_for_a_for_for_a_and_9_itm_2 , for_for_a_for_for_a_and_10_itm_2 , for_for_a_for_for_a_and_11_itm_2
      , for_for_a_for_for_a_and_12_itm_2 , for_for_a_for_for_a_and_13_itm_2});
  assign nl_for_for_a_acc_tmp = conv_u2u_8_9(operator_34_true_1_and_psp_sva_1[8:1])
      + operator_34_true_and_psp_sva_1;
  assign for_for_a_acc_tmp = nl_for_for_a_acc_tmp[8:0];
  assign operator_34_true_1_and_psp_sva_1 = operator_32_false_acc_tmp & for_for_t_9_0_sva_8_0;
  assign nl_for_for_b_acc_nl = ({reg_s_9_0_ftd , reg_s_9_0_ftd_1}) + conv_u2u_9_10(operator_34_true_1_and_psp_sva_1);
  assign for_for_b_acc_nl = nl_for_for_b_acc_nl[9:0];
  assign nl_for_for_b_for_for_b_acc_tmp = for_for_b_acc_nl + ({operator_34_true_and_psp_sva_1
      , 1'b0});
  assign for_for_b_for_for_b_acc_tmp = nl_for_for_b_for_for_b_acc_tmp[9:0];
  assign for_for_b_nor_2_cse_1 = ~((for_for_b_for_for_b_acc_tmp[1:0]!=2'b00));
  assign for_for_b_nor_1_cse_1 = ~((for_for_b_for_for_b_acc_tmp[2]) | (for_for_b_for_for_b_acc_tmp[0]));
  assign for_for_b_nor_cse_1 = ~((for_for_b_for_for_b_acc_tmp[2:1]!=2'b00));
  assign operator_34_true_and_psp_sva_1 = (~ operator_32_false_acc_tmp) & for_for_t_9_0_sva_8_0;
  assign nl_operator_32_false_acc_tmp = reg_s_9_0_ftd_1 + 9'b111111111;
  assign operator_32_false_acc_tmp = nl_operator_32_false_acc_tmp[8:0];
  assign nl_for_for_acc_tdx_9_0_sva_1 = conv_u2u_9_10(operator_34_true_1_and_psp_sva_1)
      + conv_u2u_9_10(operator_34_true_and_psp_sva_1);
  assign for_for_acc_tdx_9_0_sva_1 = nl_for_for_acc_tdx_9_0_sva_1[9:0];
  assign nl_for_for_acc_tdx_1_9_0_sva_1 = for_for_acc_tdx_9_0_sva_1 + (z_out_3[9:0]);
  assign for_for_acc_tdx_1_9_0_sva_1 = nl_for_for_acc_tdx_1_9_0_sva_1[9:0];
  assign for_for_a_nor_2_cse_1 = ~((for_for_a_acc_tmp[0]) | (operator_34_true_1_and_psp_sva_1[0]));
  assign for_for_a_nor_1_cse_1 = ~((for_for_a_acc_tmp[1]) | (operator_34_true_1_and_psp_sva_1[0]));
  assign for_for_a_nor_cse_1 = ~((for_for_a_acc_tmp[1:0]!=2'b00));
  assign for_for_a_and_3 = for_for_a_for_for_a_nor_1_itm_2 & y_3_sva;
  assign or_dcpl_3 = (fsm_output[2:1]!=2'b00);
  assign or_tmp_6 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b000);
  assign or_tmp_7 = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b000);
  assign and_62_nl = or_tmp_7 & or_tmp_6;
  assign mux_tmp = MUX_s_1_2_2(or_tmp_7, and_62_nl, for_for_asn_10_itm_2);
  assign and_dcpl_49 = for_for_stage_0_1 & y_3_sva;
  assign and_dcpl_51 = for_for_b_nor_cse_1 & (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_11 = ~((operator_32_false_acc_tmp[0]) & (for_for_t_9_0_sva_8_0[0]));
  assign or_25_nl = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b000)
      | (~ for_for_stage_0_3);
  assign mux_tmp_1 = MUX_s_1_2_2((~ for_for_stage_0_3), or_25_nl, or_tmp_7);
  assign or_dcpl_13 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b00);
  assign or_dcpl_14 = or_dcpl_13 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_55 = (~ (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2])) & for_for_asn_12_itm_2;
  assign and_dcpl_56 = ~((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b00));
  assign and_dcpl_61 = for_for_stage_0_3 & for_for_asn_10_itm_2;
  assign and_dcpl_62 = ~((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2:1]!=2'b00));
  assign and_dcpl_63 = and_dcpl_62 & and_dcpl_61;
  assign or_dcpl_16 = ~(for_for_stage_0_1 & y_3_sva);
  assign or_dcpl_17 = (for_for_a_acc_tmp[1:0]!=2'b00);
  assign and_dcpl_66 = (operator_32_false_acc_tmp[0]) & (for_for_t_9_0_sva_8_0[0]);
  assign or_dcpl_18 = and_dcpl_66 | or_dcpl_17;
  assign and_dcpl_69 = for_for_a_nor_cse_1 & and_dcpl_49;
  assign or_dcpl_20 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2]) | (~ for_for_asn_10_itm_2);
  assign or_dcpl_21 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]!=2'b00);
  assign or_tmp_15 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b001);
  assign not_tmp_41 = ~((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[0]) | (~ or_tmp_15));
  assign or_tmp_18 = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b001);
  assign or_36_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2:1]!=2'b00);
  assign mux_13_nl = MUX_s_1_2_2(not_tmp_41, or_tmp_15, or_36_nl);
  assign mux_tmp_4 = MUX_s_1_2_2(or_tmp_18, mux_13_nl, for_for_asn_10_itm_2);
  assign or_47_nl = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b001)
      | (~ for_for_stage_0_3);
  assign mux_tmp_5 = MUX_s_1_2_2((~ for_for_stage_0_3), or_47_nl, or_tmp_18);
  assign or_dcpl_24 = or_dcpl_13 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign and_dcpl_76 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]==2'b01);
  assign or_dcpl_26 = or_dcpl_11 | or_dcpl_17;
  assign and_dcpl_83 = or_dcpl_26 & or_dcpl_24;
  assign and_dcpl_85 = or_dcpl_24 & and_dcpl_66;
  assign or_dcpl_28 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]!=2'b01);
  assign or_tmp_25 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b010);
  assign or_tmp_26 = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b010);
  assign and_106_nl = or_tmp_26 & or_tmp_25;
  assign mux_tmp_7 = MUX_s_1_2_2(or_tmp_26, and_106_nl, for_for_asn_10_itm_2);
  assign and_dcpl_88 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b01);
  assign and_dcpl_90 = (for_for_a_acc_tmp[1:0]==2'b01);
  assign or_62_nl = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b010)
      | (~ for_for_stage_0_3);
  assign mux_tmp_8 = MUX_s_1_2_2((~ for_for_stage_0_3), or_62_nl, or_tmp_26);
  assign or_dcpl_31 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b01);
  assign or_dcpl_32 = or_dcpl_31 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_93 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]==2'b10);
  assign and_dcpl_97 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2:1]==2'b01);
  assign and_dcpl_98 = and_dcpl_97 & and_dcpl_61;
  assign or_dcpl_34 = (for_for_a_acc_tmp[1:0]!=2'b01);
  assign or_dcpl_35 = and_dcpl_66 | or_dcpl_34;
  assign and_dcpl_101 = or_dcpl_35 & or_dcpl_32;
  assign and_dcpl_103 = and_dcpl_90 & and_dcpl_49;
  assign and_dcpl_104 = or_dcpl_32 & or_dcpl_11;
  assign or_dcpl_37 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]!=2'b10);
  assign not_tmp_48 = ~((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]==2'b11));
  assign or_tmp_33 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2]) | not_tmp_48;
  assign not_tmp_50 = (~((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]==2'b11)))
      & or_tmp_33;
  assign nor_tmp_5 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]==2'b11);
  assign or_tmp_36 = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2])
      | (~ nor_tmp_5);
  assign or_71_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]);
  assign mux_20_nl = MUX_s_1_2_2(not_tmp_50, or_tmp_33, or_71_nl);
  assign mux_tmp_11 = MUX_s_1_2_2(or_tmp_36, mux_20_nl, for_for_asn_10_itm_2);
  assign nand_11_nl = ~(for_for_asn_10_itm_2 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2==3'b011)
      & for_for_stage_0_3);
  assign nand_12_nl = ~(for_for_asn_12_itm_2 & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2==3'b011));
  assign mux_tmp_12 = MUX_s_1_2_2((~ for_for_stage_0_3), nand_11_nl, nand_12_nl);
  assign or_dcpl_40 = or_dcpl_31 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_42 = or_dcpl_11 | or_dcpl_34;
  assign and_dcpl_115 = or_dcpl_42 & or_dcpl_40;
  assign and_dcpl_117 = or_dcpl_40 & and_dcpl_66;
  assign or_tmp_43 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b100);
  assign or_tmp_44 = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b100);
  assign and_143_nl = or_tmp_44 & or_tmp_43;
  assign mux_tmp_14 = MUX_s_1_2_2(or_tmp_44, and_143_nl, for_for_asn_10_itm_2);
  assign and_dcpl_120 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b10);
  assign and_dcpl_122 = (for_for_a_acc_tmp[1:0]==2'b10);
  assign nand_8_cse = ~((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2]) & for_for_stage_0_3);
  assign or_tmp_49 = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]!=2'b00)
      | nand_8_cse;
  assign mux_25_nl = MUX_s_1_2_2(or_tmp_49, (~ for_for_stage_0_3), for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]);
  assign or_93_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b00);
  assign mux_tmp_16 = MUX_s_1_2_2(mux_25_nl, or_tmp_49, or_93_nl);
  assign nor_31_nl = ~((for_for_b_acc_tdx_9_0_sva_2_0[2]) | (~ mux_tmp_16));
  assign or_92_nl = (for_for_b_acc_tdx_9_0_sva_2_0[1:0]!=2'b00);
  assign mux_tmp_17 = MUX_s_1_2_2(nor_31_nl, mux_tmp_16, or_92_nl);
  assign or_dcpl_46 = (for_for_b_for_for_b_acc_tmp[2:1]!=2'b10);
  assign or_dcpl_47 = or_dcpl_46 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_125 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]) & for_for_asn_12_itm_2;
  assign and_dcpl_128 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2:1]==2'b10);
  assign and_dcpl_129 = and_dcpl_128 & and_dcpl_61;
  assign or_dcpl_49 = (for_for_a_acc_tmp[1:0]!=2'b10);
  assign or_dcpl_50 = and_dcpl_66 | or_dcpl_49;
  assign and_dcpl_132 = or_dcpl_50 & or_dcpl_47;
  assign and_dcpl_134 = and_dcpl_122 & and_dcpl_49;
  assign and_dcpl_135 = or_dcpl_47 & or_dcpl_11;
  assign or_dcpl_52 = ~((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2]) & for_for_asn_10_itm_2);
  assign or_tmp_54 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b101);
  assign not_tmp_65 = ~((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[0]) | (~ or_tmp_54));
  assign or_tmp_57 = ~(for_for_asn_12_itm_2 & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2==3'b101));
  assign or_106_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2:1]!=2'b10);
  assign mux_30_nl = MUX_s_1_2_2(not_tmp_65, or_tmp_54, or_106_nl);
  assign mux_tmp_21 = MUX_s_1_2_2(or_tmp_57, mux_30_nl, for_for_asn_10_itm_2);
  assign or_tmp_62 = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[1:0]!=2'b01)
      | nand_8_cse;
  assign mux_32_nl = MUX_s_1_2_2(or_tmp_62, (~ for_for_stage_0_3), for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]);
  assign or_115_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b01);
  assign mux_tmp_23 = MUX_s_1_2_2(mux_32_nl, or_tmp_62, or_115_nl);
  assign nor_29_nl = ~((for_for_b_acc_tdx_9_0_sva_2_0[2]) | (~ mux_tmp_23));
  assign or_114_nl = (for_for_b_acc_tdx_9_0_sva_2_0[1:0]!=2'b01);
  assign mux_tmp_24 = MUX_s_1_2_2(nor_29_nl, mux_tmp_23, or_114_nl);
  assign or_dcpl_55 = or_dcpl_46 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_57 = or_dcpl_11 | or_dcpl_49;
  assign and_dcpl_145 = or_dcpl_57 & or_dcpl_55;
  assign and_dcpl_147 = or_dcpl_55 & and_dcpl_66;
  assign or_tmp_66 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2!=3'b110);
  assign or_tmp_67 = ~(for_for_asn_12_itm_2 & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2==3'b110));
  assign and_174_nl = or_tmp_67 & or_tmp_66;
  assign mux_tmp_27 = MUX_s_1_2_2(or_tmp_67, and_174_nl, for_for_asn_10_itm_2);
  assign and_dcpl_150 = (for_for_b_for_for_b_acc_tmp[2:1]==2'b11);
  assign and_dcpl_152 = (for_for_a_acc_tmp[1:0]==2'b11);
  assign or_tmp_70 = (~ for_for_asn_10_itm_2) | (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      | (~((for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2:1]==2'b11) & for_for_stage_0_3));
  assign and_1026_nl = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2:1]==2'b11);
  assign mux_38_nl = MUX_s_1_2_2(or_tmp_70, (~ for_for_stage_0_3), and_1026_nl);
  assign or_129_nl = (~ for_for_asn_12_itm_2) | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[0]);
  assign mux_tmp_29 = MUX_s_1_2_2(mux_38_nl, or_tmp_70, or_129_nl);
  assign and_1027_nl = (~((for_for_b_acc_tdx_9_0_sva_2_0[2:1]==2'b11))) & mux_tmp_29;
  assign mux_tmp_30 = MUX_s_1_2_2(and_1027_nl, mux_tmp_29, for_for_b_acc_tdx_9_0_sva_2_0[0]);
  assign or_dcpl_61 = ~((for_for_b_for_for_b_acc_tmp[2:1]==2'b11));
  assign or_dcpl_62 = or_dcpl_61 | (for_for_b_for_for_b_acc_tmp[0]);
  assign and_dcpl_157 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2:1]==2'b11);
  assign and_dcpl_158 = and_dcpl_157 & and_dcpl_61;
  assign or_dcpl_64 = ~((for_for_a_acc_tmp[1:0]==2'b11));
  assign or_dcpl_65 = and_dcpl_66 | or_dcpl_64;
  assign and_dcpl_161 = or_dcpl_65 & or_dcpl_62;
  assign and_dcpl_163 = and_dcpl_152 & and_dcpl_49;
  assign and_dcpl_164 = or_dcpl_62 & or_dcpl_11;
  assign nor_tmp_17 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2==3'b111);
  assign nor_tmp_18 = for_for_asn_12_itm_2 & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2==3'b111);
  assign or_141_nl = nor_tmp_18 | nor_tmp_17;
  assign mux_tmp_33 = MUX_s_1_2_2(nor_tmp_18, or_141_nl, for_for_asn_10_itm_2);
  assign and_1021_nl = for_for_asn_10_itm_2 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2==3'b111)
      & for_for_stage_0_3;
  assign mux_tmp_34 = MUX_s_1_2_2(and_1021_nl, for_for_stage_0_3, nor_tmp_18);
  assign or_dcpl_69 = or_dcpl_61 | (~ (for_for_b_for_for_b_acc_tmp[0]));
  assign or_dcpl_71 = ~(nor_tmp_5 & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2])
      & for_for_asn_12_itm_2);
  assign or_dcpl_73 = or_dcpl_11 | or_dcpl_64;
  assign and_dcpl_173 = or_dcpl_73 & or_dcpl_69;
  assign and_dcpl_175 = or_dcpl_69 & and_dcpl_66;
  assign and_dcpl_177 = ~((for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]) | for_for_asn_12_itm_2);
  assign or_dcpl_77 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b00);
  assign or_dcpl_78 = or_dcpl_77 | or_173_cse;
  assign and_dcpl_180 = for_for_stage_0_3 & (~ for_for_asn_10_itm_2);
  assign and_dcpl_181 = and_dcpl_62 & and_dcpl_180;
  assign and_dcpl_188 = for_for_stage_0_1 & (~ y_3_sva);
  assign or_dcpl_80 = (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2]) | for_for_asn_10_itm_2;
  assign or_dcpl_82 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b01);
  assign or_dcpl_83 = or_dcpl_82 | or_173_cse;
  assign or_dcpl_85 = (~ for_for_stage_0_1) | y_3_sva;
  assign or_dcpl_88 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[1:0]!=2'b10);
  assign or_dcpl_89 = or_dcpl_88 | or_173_cse;
  assign and_dcpl_199 = and_dcpl_97 & and_dcpl_180;
  assign and_dcpl_203 = and_dcpl_90 & and_dcpl_188;
  assign or_dcpl_93 = (~ nor_tmp_5) | or_173_cse;
  assign and_dcpl_211 = (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]) & (~ for_for_asn_12_itm_2);
  assign or_dcpl_97 = (~ (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2])) | for_for_asn_12_itm_2;
  assign or_dcpl_98 = or_dcpl_77 | or_dcpl_97;
  assign and_dcpl_214 = and_dcpl_128 & and_dcpl_180;
  assign and_dcpl_218 = and_dcpl_122 & and_dcpl_188;
  assign or_dcpl_101 = (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[2])) | for_for_asn_10_itm_2;
  assign or_dcpl_103 = or_dcpl_82 | or_dcpl_97;
  assign or_dcpl_107 = or_dcpl_88 | or_dcpl_97;
  assign and_dcpl_228 = and_dcpl_157 & and_dcpl_180;
  assign and_dcpl_232 = and_dcpl_152 & and_dcpl_188;
  assign or_dcpl_111 = (~ nor_tmp_5) | or_dcpl_97;
  assign and_205_nl = (for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b000))
      & or_tmp_6;
  assign mux_46_nl = MUX_s_1_2_2(and_205_nl, or_dcpl_78, for_for_asn_10_itm_2);
  assign xt_rsc_0_0_i_wea_d_mx0c0 = (~ (fsm_output[2])) | mux_46_nl | (~ for_for_stage_0_3);
  assign or_286_ssc = and_dcpl_56 & and_dcpl_55 & (fsm_output[2]);
  assign modulo_sub_qelse_mux_rmff = MUX_v_32_2_2(({1'b0 , (tmp_2_sva_1[30:0])}),
      z_out_1, tmp_2_sva_1[31]);
  assign modulo_add_qelse_mux_rmff = MUX_v_32_2_2(for_for_w_asn_3_itm, z_out_2, z_out_32);
  assign or_297_ssc = and_dcpl_76 & and_dcpl_55 & (fsm_output[2]);
  assign or_308_ssc = and_dcpl_93 & and_dcpl_55 & (fsm_output[2]);
  assign or_319_ssc = nor_tmp_5 & and_dcpl_55 & (fsm_output[2]);
  assign or_330_ssc = and_dcpl_56 & and_dcpl_125 & (fsm_output[2]);
  assign or_341_ssc = and_dcpl_76 & and_dcpl_125 & (fsm_output[2]);
  assign or_352_ssc = and_dcpl_93 & and_dcpl_125 & (fsm_output[2]);
  assign or_363_ssc = nor_tmp_18 & (fsm_output[2]);
  assign or_382_ssc = and_dcpl_76 & and_dcpl_177 & (fsm_output[2]);
  assign or_392_ssc = and_dcpl_93 & and_dcpl_177 & (fsm_output[2]);
  assign or_402_ssc = nor_tmp_5 & and_dcpl_177 & (fsm_output[2]);
  assign or_412_ssc = and_dcpl_56 & and_dcpl_211 & (fsm_output[2]);
  assign or_422_ssc = and_dcpl_76 & and_dcpl_211 & (fsm_output[2]);
  assign or_432_ssc = and_dcpl_93 & and_dcpl_211 & (fsm_output[2]);
  assign or_442_ssc = nor_tmp_5 & and_dcpl_211 & (fsm_output[2]);
  assign for_for_b_for_for_b_for_for_b_nor_14_rmff = ~((or_tmp_7 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_63 & (fsm_output[2])) | for_for_b_or_13_seb);
  assign for_for_b_for_for_b_for_for_b_nor_30_rmff = ~(or_dcpl_21 | or_dcpl_20 |
      for_for_b_or_13_seb);
  assign for_for_b_for_for_b_for_for_b_nor_13_rmff = ~((or_tmp_18 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_63 & (fsm_output[2])) | for_for_b_or_12_seb);
  assign for_for_b_for_for_b_for_for_b_nor_31_rmff = ~(or_dcpl_28 | or_dcpl_20 |
      for_for_b_or_12_seb);
  assign for_for_b_for_for_b_for_for_b_nor_12_rmff = ~((or_tmp_26 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_98 & (fsm_output[2])) | for_for_b_or_11_seb);
  assign for_for_b_for_for_b_for_for_b_nor_32_rmff = ~(or_dcpl_37 | or_dcpl_20 |
      for_for_b_or_11_seb);
  assign for_for_b_for_for_b_for_for_b_nor_11_rmff = ~((or_tmp_36 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_98 & (fsm_output[2])) | for_for_b_or_10_seb);
  assign for_for_b_for_for_b_for_for_b_nor_33_rmff = ~(not_tmp_48 | or_dcpl_20 |
      for_for_b_or_10_seb);
  assign for_for_b_for_for_b_for_for_b_nor_10_rmff = ~((or_tmp_44 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_129 & (fsm_output[2])) | for_for_b_or_9_seb);
  assign for_for_b_for_for_b_for_for_b_nor_34_rmff = ~(or_dcpl_21 | or_dcpl_52 |
      for_for_b_or_9_seb);
  assign for_for_b_for_for_b_for_for_b_nor_9_rmff = ~((or_tmp_57 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_129 & (fsm_output[2])) | for_for_b_or_8_seb);
  assign for_for_b_for_for_b_for_for_b_nor_35_rmff = ~(or_dcpl_28 | or_dcpl_52 |
      for_for_b_or_8_seb);
  assign for_for_b_for_for_b_for_for_b_nor_8_rmff = ~((or_tmp_67 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_158 & (fsm_output[2])) | for_for_b_or_7_seb);
  assign for_for_b_for_for_b_for_for_b_nor_36_rmff = ~(or_dcpl_37 | or_dcpl_52 |
      for_for_b_or_7_seb);
  assign for_for_b_for_for_b_for_for_b_nor_7_rmff = ~((or_dcpl_71 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_158 & (fsm_output[2])) | for_for_b_nand_seb);
  assign for_for_b_for_for_b_for_for_b_nor_37_rmff = ~(not_tmp_48 | or_dcpl_52 |
      for_for_b_nand_seb);
  assign for_for_a_for_for_a_for_for_a_nor_rmff = ~(or_dcpl_21 | or_dcpl_80 | xt_rsc_0_0_i_wea_d_mx0c0);
  assign for_for_a_for_for_a_for_for_a_nor_1_rmff = ~((or_dcpl_78 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_181 & (fsm_output[2])) | xt_rsc_0_0_i_wea_d_mx0c0);
  assign for_for_b_for_for_b_for_for_b_nor_6_rmff = ~((or_dcpl_83 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_181 & (fsm_output[2])) | for_for_b_or_6_seb);
  assign for_for_b_for_for_b_for_for_b_nor_38_rmff = ~(or_dcpl_28 | or_dcpl_80 |
      for_for_b_or_6_seb);
  assign for_for_b_for_for_b_for_for_b_nor_5_rmff = ~((or_dcpl_89 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_199 & (fsm_output[2])) | for_for_b_or_5_seb);
  assign for_for_b_for_for_b_for_for_b_nor_39_rmff = ~(or_dcpl_37 | or_dcpl_80 |
      for_for_b_or_5_seb);
  assign for_for_b_for_for_b_for_for_b_nor_4_rmff = ~((or_dcpl_93 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_199 & (fsm_output[2])) | for_for_b_or_4_seb);
  assign for_for_b_for_for_b_for_for_b_nor_40_rmff = ~(not_tmp_48 | or_dcpl_80 |
      for_for_b_or_4_seb);
  assign for_for_b_for_for_b_for_for_b_nor_3_rmff = ~((or_dcpl_98 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_214 & (fsm_output[2])) | for_for_b_or_3_seb);
  assign for_for_b_for_for_b_for_for_b_nor_41_rmff = ~(or_dcpl_21 | or_dcpl_101 |
      for_for_b_or_3_seb);
  assign for_for_b_for_for_b_for_for_b_nor_2_rmff = ~((or_dcpl_103 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_214 & (fsm_output[2])) | for_for_b_or_2_seb);
  assign for_for_b_for_for_b_for_for_b_nor_42_rmff = ~(or_dcpl_28 | or_dcpl_101 |
      for_for_b_or_2_seb);
  assign for_for_b_for_for_b_for_for_b_nor_1_rmff = ~((or_dcpl_107 & (~ (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0]))
      & and_dcpl_228 & (fsm_output[2])) | for_for_b_or_1_seb);
  assign for_for_b_for_for_b_for_for_b_nor_43_rmff = ~(or_dcpl_37 | or_dcpl_101 |
      for_for_b_or_1_seb);
  assign for_for_b_for_for_b_for_for_b_nor_rmff = ~((or_dcpl_111 & (for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2[0])
      & and_dcpl_228 & (fsm_output[2])) | for_for_b_or_seb);
  assign for_for_b_for_for_b_for_for_b_nor_44_rmff = ~(not_tmp_48 | or_dcpl_101 |
      for_for_b_or_seb);
  assign for_for_b_or_13_seb = (~ (fsm_output[2])) | mux_tmp | (~ for_for_stage_0_3);
  assign for_for_b_or_12_seb = (~ (fsm_output[2])) | mux_tmp_4 | (~ for_for_stage_0_3);
  assign for_for_b_or_11_seb = (~ (fsm_output[2])) | mux_tmp_7 | (~ for_for_stage_0_3);
  assign for_for_b_or_10_seb = (~ (fsm_output[2])) | mux_tmp_11 | (~ for_for_stage_0_3);
  assign for_for_b_or_9_seb = (~ (fsm_output[2])) | mux_tmp_14 | (~ for_for_stage_0_3);
  assign for_for_b_or_8_seb = (~ (fsm_output[2])) | mux_tmp_21 | (~ for_for_stage_0_3);
  assign for_for_b_or_7_seb = (~ (fsm_output[2])) | mux_tmp_27 | (~ for_for_stage_0_3);
  assign for_for_b_nand_seb = ~((fsm_output[2]) & mux_tmp_33 & for_for_stage_0_3);
  assign or_161_nl = for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2:1]!=2'b00);
  assign mux_47_nl = MUX_s_1_2_2(not_tmp_41, or_tmp_15, or_161_nl);
  assign mux_48_nl = MUX_s_1_2_2(mux_47_nl, or_dcpl_83, for_for_asn_10_itm_2);
  assign for_for_b_or_6_seb = (~ (fsm_output[2])) | mux_48_nl | (~ for_for_stage_0_3);
  assign and_225_nl = (for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b010))
      & or_tmp_25;
  assign mux_49_nl = MUX_s_1_2_2(and_225_nl, or_dcpl_89, for_for_asn_10_itm_2);
  assign for_for_b_or_5_seb = (~ (fsm_output[2])) | mux_49_nl | (~ for_for_stage_0_3);
  assign or_173_cse = for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2]);
  assign mux_50_nl = MUX_s_1_2_2(not_tmp_50, or_tmp_33, or_173_cse);
  assign mux_51_nl = MUX_s_1_2_2(mux_50_nl, or_dcpl_93, for_for_asn_10_itm_2);
  assign for_for_b_or_4_seb = (~ (fsm_output[2])) | mux_51_nl | (~ for_for_stage_0_3);
  assign and_241_nl = (for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b100))
      & or_tmp_43;
  assign mux_52_nl = MUX_s_1_2_2(and_241_nl, or_dcpl_98, for_for_asn_10_itm_2);
  assign for_for_b_or_3_seb = (~ (fsm_output[2])) | mux_52_nl | (~ for_for_stage_0_3);
  assign or_185_nl = for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2[2:1]!=2'b10);
  assign mux_53_nl = MUX_s_1_2_2(not_tmp_65, or_tmp_54, or_185_nl);
  assign mux_54_nl = MUX_s_1_2_2(mux_53_nl, or_dcpl_103, for_for_asn_10_itm_2);
  assign for_for_b_or_2_seb = (~ (fsm_output[2])) | mux_54_nl | (~ for_for_stage_0_3);
  assign and_256_nl = (for_for_asn_12_itm_2 | (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2!=3'b110))
      & or_tmp_66;
  assign mux_55_nl = MUX_s_1_2_2(and_256_nl, or_dcpl_107, for_for_asn_10_itm_2);
  assign for_for_b_or_1_seb = (~ (fsm_output[2])) | mux_55_nl | (~ for_for_stage_0_3);
  assign nor_25_nl = ~(((~ for_for_asn_12_itm_2) & (for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2==3'b111))
      | nor_tmp_17);
  assign mux_56_nl = MUX_s_1_2_2(nor_25_nl, or_dcpl_111, for_for_asn_10_itm_2);
  assign for_for_b_or_seb = (~ (fsm_output[2])) | mux_56_nl | (~ for_for_stage_0_3);
  assign twiddle_rsci_radr_d_pff = for_for_w_lshift_itm;
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_pff = and_cse;
  assign for_for_b_for_for_b_mux_1_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_286_ssc);
  assign for_for_b_or_44_nl = or_286_ssc | (or_tmp_7 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_44_nl);
  assign yt_rsc_0_0_i_adra_d = {for_for_b_for_for_b_mux_1_nl , for_for_b_for_for_b_mux_nl};
  assign yt_rsc_0_0_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_0_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_14_rmff , for_for_b_for_for_b_for_for_b_nor_30_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_29_nl = ~((or_dcpl_14 & or_dcpl_11 & and_dcpl_69
      & (fsm_output[1])) | for_for_b_or_42_seb);
  assign for_for_b_for_for_b_for_for_b_nor_45_nl = ~(or_dcpl_18 | for_for_b_or_42_seb);
  assign yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_29_nl
      , for_for_b_for_for_b_for_for_b_nor_45_nl};
  assign yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_14_rmff
      , for_for_b_for_for_b_for_for_b_nor_30_rmff};
  assign for_for_b_for_for_b_mux_3_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_297_ssc);
  assign for_for_b_or_45_nl = or_297_ssc | (or_tmp_18 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_2_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_45_nl);
  assign yt_rsc_0_1_i_adra_d = {for_for_b_for_for_b_mux_3_nl , for_for_b_for_for_b_mux_2_nl};
  assign yt_rsc_0_1_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_1_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_13_rmff , for_for_b_for_for_b_for_for_b_nor_31_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_28_nl = ~((and_dcpl_85 & and_dcpl_69 &
      (fsm_output[1])) | for_for_b_or_40_seb);
  assign for_for_b_for_for_b_for_for_b_nor_46_nl = ~(or_dcpl_26 | for_for_b_or_40_seb);
  assign yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_28_nl
      , for_for_b_for_for_b_for_for_b_nor_46_nl};
  assign yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_13_rmff
      , for_for_b_for_for_b_for_for_b_nor_31_rmff};
  assign for_for_b_for_for_b_mux_5_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_308_ssc);
  assign for_for_b_or_46_nl = or_308_ssc | (or_tmp_26 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_4_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_46_nl);
  assign yt_rsc_0_2_i_adra_d = {for_for_b_for_for_b_mux_5_nl , for_for_b_for_for_b_mux_4_nl};
  assign yt_rsc_0_2_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_2_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_12_rmff , for_for_b_for_for_b_for_for_b_nor_32_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_27_nl = ~((and_dcpl_104 & and_dcpl_103
      & (fsm_output[1])) | for_for_b_or_38_seb);
  assign for_for_b_for_for_b_for_for_b_nor_47_nl = ~(or_dcpl_35 | for_for_b_or_38_seb);
  assign yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_27_nl
      , for_for_b_for_for_b_for_for_b_nor_47_nl};
  assign yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_12_rmff
      , for_for_b_for_for_b_for_for_b_nor_32_rmff};
  assign for_for_b_for_for_b_mux_7_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_319_ssc);
  assign for_for_b_or_47_nl = or_319_ssc | (or_tmp_36 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_6_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_47_nl);
  assign yt_rsc_0_3_i_adra_d = {for_for_b_for_for_b_mux_7_nl , for_for_b_for_for_b_mux_6_nl};
  assign yt_rsc_0_3_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_3_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_11_rmff , for_for_b_for_for_b_for_for_b_nor_33_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_26_nl = ~((and_dcpl_117 & and_dcpl_103
      & (fsm_output[1])) | for_for_b_or_36_seb);
  assign for_for_b_for_for_b_for_for_b_nor_48_nl = ~(or_dcpl_42 | for_for_b_or_36_seb);
  assign yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_26_nl
      , for_for_b_for_for_b_for_for_b_nor_48_nl};
  assign yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_11_rmff
      , for_for_b_for_for_b_for_for_b_nor_33_rmff};
  assign for_for_b_for_for_b_mux_9_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_330_ssc);
  assign for_for_b_or_48_nl = or_330_ssc | (or_tmp_44 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_8_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_48_nl);
  assign yt_rsc_0_4_i_adra_d = {for_for_b_for_for_b_mux_9_nl , for_for_b_for_for_b_mux_8_nl};
  assign yt_rsc_0_4_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_4_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_10_rmff , for_for_b_for_for_b_for_for_b_nor_34_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_25_nl = ~((and_dcpl_135 & and_dcpl_134
      & (fsm_output[1])) | for_for_b_or_34_seb);
  assign for_for_b_for_for_b_for_for_b_nor_49_nl = ~(or_dcpl_50 | for_for_b_or_34_seb);
  assign yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_25_nl
      , for_for_b_for_for_b_for_for_b_nor_49_nl};
  assign yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_10_rmff
      , for_for_b_for_for_b_for_for_b_nor_34_rmff};
  assign for_for_b_for_for_b_mux_11_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_341_ssc);
  assign for_for_b_or_49_nl = or_341_ssc | (or_tmp_57 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_10_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_49_nl);
  assign yt_rsc_0_5_i_adra_d = {for_for_b_for_for_b_mux_11_nl , for_for_b_for_for_b_mux_10_nl};
  assign yt_rsc_0_5_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_5_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_9_rmff , for_for_b_for_for_b_for_for_b_nor_35_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_24_nl = ~((and_dcpl_147 & and_dcpl_134
      & (fsm_output[1])) | for_for_b_or_32_seb);
  assign for_for_b_for_for_b_for_for_b_nor_50_nl = ~(or_dcpl_57 | for_for_b_or_32_seb);
  assign yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_24_nl
      , for_for_b_for_for_b_for_for_b_nor_50_nl};
  assign yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_9_rmff
      , for_for_b_for_for_b_for_for_b_nor_35_rmff};
  assign for_for_b_for_for_b_mux_13_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_352_ssc);
  assign for_for_b_or_50_nl = or_352_ssc | (or_tmp_67 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_12_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_50_nl);
  assign yt_rsc_0_6_i_adra_d = {for_for_b_for_for_b_mux_13_nl , for_for_b_for_for_b_mux_12_nl};
  assign yt_rsc_0_6_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_6_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_8_rmff , for_for_b_for_for_b_for_for_b_nor_36_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_23_nl = ~((and_dcpl_164 & and_dcpl_163
      & (fsm_output[1])) | for_for_b_or_30_seb);
  assign for_for_b_for_for_b_for_for_b_nor_51_nl = ~(or_dcpl_65 | for_for_b_or_30_seb);
  assign yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_23_nl
      , for_for_b_for_for_b_for_for_b_nor_51_nl};
  assign yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_8_rmff
      , for_for_b_for_for_b_for_for_b_nor_36_rmff};
  assign for_for_b_for_for_b_mux_15_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_363_ssc);
  assign for_for_b_or_51_nl = or_363_ssc | (or_dcpl_71 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_14_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_51_nl);
  assign yt_rsc_0_7_i_adra_d = {for_for_b_for_for_b_mux_15_nl , for_for_b_for_for_b_mux_14_nl};
  assign yt_rsc_0_7_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign yt_rsc_0_7_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_7_rmff , for_for_b_for_for_b_for_for_b_nor_37_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_22_nl = ~((and_dcpl_175 & and_dcpl_163
      & (fsm_output[1])) | for_for_b_or_28_seb);
  assign for_for_b_for_for_b_for_for_b_nor_52_nl = ~(or_dcpl_73 | for_for_b_or_28_seb);
  assign yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_22_nl
      , for_for_b_for_for_b_for_for_b_nor_52_nl};
  assign yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_7_rmff
      , for_for_b_for_for_b_for_for_b_nor_37_rmff};
  assign and_629_nl = and_dcpl_56 & and_dcpl_177 & (fsm_output[2]);
  assign for_for_a_mux1h_132_nl = MUX1HOT_v_7_3_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, for_for_a_acc_psp_sva_1_8_2, {(fsm_output[1])
      , and_629_nl , (fsm_output[3])});
  assign xt_rsc_0_0_i_adra_d = {for_for_acc_tdx_9_0_sva_2_9_3 , for_for_a_mux1h_132_nl};
  assign xt_rsc_0_0_i_da_d = {modulo_add_qelse_mux_rmff , modulo_sub_qelse_mux_rmff};
  assign xt_rsc_0_0_i_wea_d = {for_for_a_for_for_a_for_for_a_nor_rmff , for_for_a_for_for_a_for_for_a_nor_1_rmff};
  assign or_379_nl = (for_for_stage_0_2 & (~ for_for_a_asn_itm_1) & (~ (for_for_a_conc_5_itm_1_2_1[1]))
      & (~((for_for_a_conc_5_itm_1_2_1[0]) | for_for_a_conc_5_itm_1_0)) & (fsm_output[3]))
      | (and_dcpl_51 & and_dcpl_188 & (fsm_output[1]));
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = {1'b0 , or_379_nl};
  assign xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_a_for_for_a_for_for_a_nor_rmff
      , for_for_a_for_for_a_for_for_a_nor_1_rmff};
  assign for_for_b_for_for_b_mux_17_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_382_ssc);
  assign for_for_b_or_52_nl = or_382_ssc | (or_dcpl_83 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_16_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_52_nl);
  assign xt_rsc_0_1_i_adra_d = {for_for_b_for_for_b_mux_17_nl , for_for_b_for_for_b_mux_16_nl};
  assign xt_rsc_0_1_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_1_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_6_rmff , for_for_b_for_for_b_for_for_b_nor_38_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_21_nl = ~((and_dcpl_85 & for_for_a_nor_cse_1
      & and_dcpl_188 & (fsm_output[1])) | for_for_b_or_26_seb);
  assign for_for_b_for_for_b_for_for_b_nor_53_nl = ~(or_dcpl_26 | for_for_b_or_26_seb);
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_21_nl
      , for_for_b_for_for_b_for_for_b_nor_53_nl};
  assign xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_6_rmff
      , for_for_b_for_for_b_for_for_b_nor_38_rmff};
  assign for_for_b_for_for_b_mux_19_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_392_ssc);
  assign for_for_b_or_53_nl = or_392_ssc | (or_dcpl_89 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_18_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_53_nl);
  assign xt_rsc_0_2_i_adra_d = {for_for_b_for_for_b_mux_19_nl , for_for_b_for_for_b_mux_18_nl};
  assign xt_rsc_0_2_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_2_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_5_rmff , for_for_b_for_for_b_for_for_b_nor_39_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_20_nl = ~((and_dcpl_104 & and_dcpl_203
      & (fsm_output[1])) | for_for_b_or_24_seb);
  assign for_for_b_for_for_b_for_for_b_nor_54_nl = ~(or_dcpl_35 | for_for_b_or_24_seb);
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_20_nl
      , for_for_b_for_for_b_for_for_b_nor_54_nl};
  assign xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_5_rmff
      , for_for_b_for_for_b_for_for_b_nor_39_rmff};
  assign for_for_b_for_for_b_mux_21_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_402_ssc);
  assign for_for_b_or_54_nl = or_402_ssc | (or_dcpl_93 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_20_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_54_nl);
  assign xt_rsc_0_3_i_adra_d = {for_for_b_for_for_b_mux_21_nl , for_for_b_for_for_b_mux_20_nl};
  assign xt_rsc_0_3_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_3_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_4_rmff , for_for_b_for_for_b_for_for_b_nor_40_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_19_nl = ~((and_dcpl_117 & and_dcpl_203
      & (fsm_output[1])) | for_for_b_or_22_seb);
  assign for_for_b_for_for_b_for_for_b_nor_55_nl = ~(or_dcpl_42 | for_for_b_or_22_seb);
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_19_nl
      , for_for_b_for_for_b_for_for_b_nor_55_nl};
  assign xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_4_rmff
      , for_for_b_for_for_b_for_for_b_nor_40_rmff};
  assign for_for_b_for_for_b_mux_23_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_412_ssc);
  assign for_for_b_or_55_nl = or_412_ssc | (or_dcpl_98 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_22_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_55_nl);
  assign xt_rsc_0_4_i_adra_d = {for_for_b_for_for_b_mux_23_nl , for_for_b_for_for_b_mux_22_nl};
  assign xt_rsc_0_4_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_4_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_3_rmff , for_for_b_for_for_b_for_for_b_nor_41_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_18_nl = ~((and_dcpl_135 & and_dcpl_218
      & (fsm_output[1])) | for_for_b_or_20_seb);
  assign for_for_b_for_for_b_for_for_b_nor_56_nl = ~(or_dcpl_50 | for_for_b_or_20_seb);
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_18_nl
      , for_for_b_for_for_b_for_for_b_nor_56_nl};
  assign xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_3_rmff
      , for_for_b_for_for_b_for_for_b_nor_41_rmff};
  assign for_for_b_for_for_b_mux_25_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_422_ssc);
  assign for_for_b_or_56_nl = or_422_ssc | (or_dcpl_103 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_24_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_56_nl);
  assign xt_rsc_0_5_i_adra_d = {for_for_b_for_for_b_mux_25_nl , for_for_b_for_for_b_mux_24_nl};
  assign xt_rsc_0_5_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_5_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_2_rmff , for_for_b_for_for_b_for_for_b_nor_42_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_17_nl = ~((and_dcpl_147 & and_dcpl_218
      & (fsm_output[1])) | for_for_b_or_18_seb);
  assign for_for_b_for_for_b_for_for_b_nor_57_nl = ~(or_dcpl_57 | for_for_b_or_18_seb);
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_17_nl
      , for_for_b_for_for_b_for_for_b_nor_57_nl};
  assign xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_2_rmff
      , for_for_b_for_for_b_for_for_b_nor_42_rmff};
  assign for_for_b_for_for_b_mux_27_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_432_ssc);
  assign for_for_b_or_57_nl = or_432_ssc | (or_dcpl_107 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_26_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_57_nl);
  assign xt_rsc_0_6_i_adra_d = {for_for_b_for_for_b_mux_27_nl , for_for_b_for_for_b_mux_26_nl};
  assign xt_rsc_0_6_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_6_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_1_rmff , for_for_b_for_for_b_for_for_b_nor_43_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_16_nl = ~((and_dcpl_164 & and_dcpl_232
      & (fsm_output[1])) | for_for_b_or_16_seb);
  assign for_for_b_for_for_b_for_for_b_nor_58_nl = ~(or_dcpl_65 | for_for_b_or_16_seb);
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_16_nl
      , for_for_b_for_for_b_for_for_b_nor_58_nl};
  assign xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d = {for_for_b_for_for_b_for_for_b_nor_1_rmff
      , for_for_b_for_for_b_for_for_b_nor_43_rmff};
  assign for_for_b_for_for_b_mux_29_nl = MUX_v_7_2_2((for_for_b_for_for_b_acc_tmp[9:3]),
      for_for_acc_tdx_1_9_0_sva_2_9_3, or_442_ssc);
  assign for_for_b_or_58_nl = or_442_ssc | (or_dcpl_111 & (fsm_output[2]));
  assign for_for_b_for_for_b_mux_28_nl = MUX_v_7_2_2((for_for_a_acc_tmp[8:2]), for_for_acc_tdx_9_0_sva_2_9_3,
      for_for_b_or_58_nl);
  assign xt_rsc_0_7_i_adra_d = {for_for_b_for_for_b_mux_29_nl , for_for_b_for_for_b_mux_28_nl};
  assign xt_rsc_0_7_i_da_d = {modulo_sub_qelse_mux_rmff , modulo_add_qelse_mux_rmff};
  assign xt_rsc_0_7_i_wea_d = {for_for_b_for_for_b_for_for_b_nor_rmff , for_for_b_for_for_b_for_for_b_nor_44_rmff};
  assign for_for_b_for_for_b_for_for_b_nor_15_nl = ~((and_dcpl_175 & and_dcpl_232
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
      for_for_a_for_for_a_nor_1_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_7_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_8_itm_2 <= 1'b0;
      for_for_a_for_for_a_and_9_itm_2 <= 1'b0;
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
      for_for_asn_12_itm <= 1'b0;
      for_for_asn_10_itm <= 1'b0;
      tmp_2_sva_1 <= 32'b00000000000000000000000000000000;
      for_for_a_acc_psp_sva_1_0 <= 2'b00;
      operator_34_true_1_and_psp_sva_0 <= 1'b0;
      for_for_b_acc_tdx_9_0_sva_2_0 <= 3'b000;
    end
    else begin
      for_for_a_for_for_a_nor_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_and_4_nl,
          for_for_a_for_for_a_nor_itm_1, fsm_output[3]);
      for_for_a_for_for_a_and_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_and_2_nl,
          for_for_a_for_for_a_and_itm_1, fsm_output[3]);
      for_for_a_for_for_a_nor_1_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_nor_1_nl,
          for_for_a_for_for_a_nor_1_itm_1, fsm_output[3]);
      for_for_a_for_for_a_and_7_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_and_11_nl,
          for_for_a_for_for_a_and_7_itm_1, fsm_output[3]);
      for_for_a_for_for_a_and_8_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_and_12_nl,
          for_for_a_for_for_a_and_8_itm_1, fsm_output[3]);
      for_for_a_for_for_a_and_9_itm_2 <= MUX_s_1_2_2(for_for_b_for_for_b_and_13_nl,
          for_for_a_for_for_a_and_9_itm_1, fsm_output[3]);
      for_for_stage_0 <= for_for_mux_21_cse & (~((fsm_output[5]) | (for_for_stage_0_1
          & (z_out_4[9]) & (fsm_output[1]))));
      reg_yt_rsc_0_0_cgo_cse <= or_283_rmff;
      reg_yt_rsc_0_1_cgo_cse <= or_294_rmff;
      reg_yt_rsc_0_2_cgo_cse <= or_305_rmff;
      reg_yt_rsc_0_3_cgo_cse <= or_316_rmff;
      reg_yt_rsc_0_4_cgo_cse <= or_327_rmff;
      reg_yt_rsc_0_5_cgo_cse <= or_338_rmff;
      reg_yt_rsc_0_6_cgo_cse <= or_349_rmff;
      reg_yt_rsc_0_7_cgo_cse <= or_360_rmff;
      reg_xt_rsc_triosy_0_7_obj_ld_cse <= (~ (z_out_4[3])) & (fsm_output[4]);
      for_for_a_asn_itm <= for_for_a_mux1h_66_nl & (~ or_cse);
      for_for_asn_12_itm <= for_for_mux1h_31_nl | or_cse;
      for_for_asn_10_itm <= for_for_mux1h_33_nl | or_cse;
      tmp_2_sva_1 <= MUX1HOT_v_32_3_2(for_for_acc_5_nl, (xt_rsc_0_1_i_qa_d[31:0]),
          tmp_2_sva_1_1, {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3])});
      for_for_a_acc_psp_sva_1_0 <= for_for_a_acc_tmp[1:0];
      operator_34_true_1_and_psp_sva_0 <= operator_34_true_1_and_psp_sva_1[0];
      for_for_b_acc_tdx_9_0_sva_2_0 <= for_for_b_for_for_b_acc_tmp[2:0];
    end
  end
  always @(posedge clk) begin
    mult_t_mul_cmp_b <= twiddle_h_rsci_q_d;
    nn_10_sva <= nn_mux_nl & (~ or_cse);
    tmp_2_sva_2 <= MUX1HOT_v_32_3_2(mult_t_mul_cmp_z_oreg, (xt_rsc_0_2_i_qa_d[31:0]),
        tmp_2_sva_2_1, {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[3])});
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
    for_for_w_asn_3_itm <= MUX_v_32_2_2(for_for_acc_2_nl, twiddle_rsci_q_d, fsm_output[2]);
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_1_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_1_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_11_nl,
          for_for_a_for_for_a_and_1_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_2_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_2_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_5_nl,
          for_for_a_for_for_a_and_2_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_3_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_3_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_6_nl,
          for_for_a_for_for_a_and_3_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_4_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_4_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_9_nl,
          for_for_a_for_for_a_and_4_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_5_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_5_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_nor_1_nl,
          for_for_a_for_for_a_and_5_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_6_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_6_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_nor_nl,
          for_for_a_for_for_a_and_6_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( y_or_cse ) begin
      idx_3_0_sva <= MUX_v_4_2_2(4'b0000, idx_3_0_sva_2, idx_not_1_nl);
      reg_s_9_0_ftd <= ~ (fsm_output[4]);
      reg_s_9_0_ftd_1 <= MUX_v_9_2_2(9'b000000000, ({reg_s_9_0_ftd , (reg_s_9_0_ftd_1[8:1])}),
          (fsm_output[4]));
      shift_3_0_sva <= MUX_v_4_2_2(4'b1001, operator_32_false_2_acc_nl, fsm_output[4]);
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
      for_for_a_for_for_a_and_10_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_10_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_12_nl,
          for_for_a_for_for_a_and_10_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_11_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_11_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_13_nl,
          for_for_a_for_for_a_and_11_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_12_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_12_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_2_nl,
          for_for_a_for_for_a_and_12_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_13_itm_2 <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_13_itm_2 <= MUX_s_1_2_2(for_for_a_for_for_a_and_4_nl,
          for_for_a_for_for_a_and_13_itm_1, fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_asn_itm_2 <= 1'b0;
      for_for_a_conc_5_itm_2_1 <= 2'b00;
    end
    else if ( for_for_a_or_12_cse ) begin
      for_for_a_asn_itm_2 <= MUX_s_1_2_2((operator_34_true_1_and_psp_sva_1[0]), for_for_a_asn_itm_1,
          fsm_output[3]);
      for_for_a_conc_5_itm_2_1 <= MUX_v_2_2_2((for_for_a_acc_tmp[1:0]), for_for_a_conc_5_itm_1_2_1,
          fsm_output[3]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_t_9_0_sva_8_0 <= 9'b000000000;
    end
    else if ( and_cse | (fsm_output[4]) | (fsm_output[0]) ) begin
      for_for_t_9_0_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (z_out_4[8:0]), y_not_35_nl);
    end
  end
  always @(posedge clk) begin
    if ( or_cse ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_9_0_sva_2_9_3 <= for_for_acc_tdx_9_0_sva_1_9_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_1_9_0_sva_2_9_3 <= for_for_acc_tdx_1_9_0_sva_1_9_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_2 <= for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_12_itm_2 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_12_itm_2 <= for_for_asn_12_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_10_itm_2 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_10_itm_2 <= for_for_asn_10_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_conc_5_itm_1_2_1 <= 2'b00;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_conc_5_itm_1_2_1 <= for_for_a_conc_5_itm_2_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_conc_5_itm_1_0 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_conc_5_itm_1_0 <= for_for_a_asn_itm_2;
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
      for_for_stage_0_1 <= for_for_mux_21_cse;
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
          , for_for_b_for_for_b_and_itm , for_for_b_for_for_b_and_1_itm , for_for_a_for_for_a_and_itm_2
          , for_for_b_for_for_b_and_3_itm , for_for_a_for_for_a_nor_itm_2 , for_for_b_for_for_b_and_5_itm
          , for_for_b_for_for_b_and_6_itm , for_for_a_and_3 , for_for_b_for_for_b_and_7_itm
          , for_for_b_for_for_b_and_8_itm , for_for_b_for_for_b_and_9_itm , for_for_b_for_for_b_and_10_itm
          , for_for_a_for_for_a_and_7_itm_2 , for_for_a_for_for_a_and_8_itm_2 , for_for_a_for_for_a_and_9_itm_2});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_b_for_for_b_and_10_itm <= 1'b0;
      for_for_b_for_for_b_and_9_itm <= 1'b0;
      for_for_b_for_for_b_and_8_itm <= 1'b0;
      for_for_b_for_for_b_and_7_itm <= 1'b0;
      for_for_b_for_for_b_and_6_itm <= 1'b0;
      for_for_b_for_for_b_and_5_itm <= 1'b0;
      for_for_b_for_for_b_and_3_itm <= 1'b0;
      for_for_b_for_for_b_and_1_itm <= 1'b0;
      for_for_b_for_for_b_and_itm <= 1'b0;
      for_for_b_for_for_b_nor_itm <= 1'b0;
    end
    else if ( for_for_stage_0_1 ) begin
      for_for_b_for_for_b_and_10_itm <= (for_for_b_for_for_b_acc_tmp[2]) & for_for_b_nor_2_cse_1
          & y_3_sva;
      for_for_b_for_for_b_and_9_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b011)
          & y_3_sva;
      for_for_b_for_for_b_and_8_itm <= (for_for_b_for_for_b_acc_tmp[1]) & for_for_b_nor_1_cse_1
          & y_3_sva;
      for_for_b_for_for_b_and_7_itm <= (for_for_b_for_for_b_acc_tmp[0]) & for_for_b_nor_cse_1
          & y_3_sva;
      for_for_b_for_for_b_and_6_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b111)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_5_itm <= (for_for_b_for_for_b_acc_tmp[2:0]==3'b110)
          & (~ y_3_sva);
      for_for_b_for_for_b_and_3_itm <= (for_for_b_for_for_b_acc_tmp[2]) & for_for_b_nor_2_cse_1
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
      for_for_a_acc_psp_sva_1_8_2 <= for_for_a_acc_psp_sva_8_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm_1 <= MUX_v_3_2_2(for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm,
          for_for_slc_for_for_acc_tdx_1_9_0_2_0_itm, for_for_and_6_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_12_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_12_itm_1 <= for_for_asn_12_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1 <= 3'b000;
    end
    else if ( fsm_output[3] ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm_1 <= for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_asn_10_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_asn_10_itm_1 <= for_for_asn_10_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_13_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_13_itm_1 <= for_for_a_for_for_a_and_11_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_12_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_12_itm_1 <= for_for_a_for_for_a_and_10_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_11_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_11_itm_1 <= for_for_a_for_for_a_and_1_itm_2;
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
      for_for_a_for_for_a_and_9_itm_1 <= for_for_a_for_for_a_and_4_itm_2;
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
      for_for_a_for_for_a_nor_1_itm_1 <= for_for_a_for_for_a_and_5_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_6_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_6_itm_1 <= for_for_a_for_for_a_and_3_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_5_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_5_itm_1 <= for_for_a_for_for_a_and_2_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_for_for_a_and_4_itm_1 <= 1'b0;
    end
    else if ( fsm_output[3] ) begin
      for_for_a_for_for_a_and_4_itm_1 <= for_for_a_for_for_a_and_13_itm_2;
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
      for_for_a_for_for_a_and_2_itm_1 <= for_for_a_for_for_a_and_12_itm_2;
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
      for_for_a_for_for_a_nor_itm_1 <= for_for_a_for_for_a_and_6_itm_2;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_1_9_0_sva_1_9_3 <= for_for_acc_tdx_1_9_0_sva_9_3;
    end
  end
  always @(posedge clk) begin
    if ( fsm_output[3] ) begin
      for_for_acc_tdx_9_0_sva_1_9_3 <= for_for_acc_tdx_9_0_sva_9_3;
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
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm <= 3'b000;
    end
    else if ( ~(x_3_sva | (fsm_output[2])) ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_1_itm <= for_for_acc_tdx_1_9_0_sva_1[2:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_itm <= 3'b000;
    end
    else if ( x_3_sva & (~ (fsm_output[2])) ) begin
      for_for_slc_for_for_acc_tdx_1_9_0_2_0_itm <= for_for_acc_tdx_1_9_0_sva_1[2:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm <= 3'b000;
    end
    else if ( ~((x_3_sva ^ for_for_asn_10_itm) | (fsm_output[2])) ) begin
      for_for_slc_for_for_acc_tdx_9_0_2_0_1_itm <= for_for_acc_tdx_9_0_sva_1[2:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_a_acc_psp_sva_8_2 <= 7'b0000000;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_acc_psp_sva_8_2 <= for_for_a_acc_tmp[8:2];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_acc_tdx_9_0_sva_9_3 <= 7'b0000000;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_acc_tdx_9_0_sva_9_3 <= for_for_acc_tdx_9_0_sva_1[9:3];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      for_for_acc_tdx_1_9_0_sva_9_3 <= 7'b0000000;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_acc_tdx_1_9_0_sva_9_3 <= for_for_acc_tdx_1_9_0_sva_1[9:3];
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
      for_for_a_for_for_a_and_3_itm <= 1'b0;
    end
    else if ( ~ (fsm_output[2]) ) begin
      for_for_a_for_for_a_and_3_itm <= (for_for_a_acc_tmp[1]) & for_for_a_nor_2_cse_1
          & (~ y_3_sva);
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
  assign for_for_b_for_for_b_and_4_nl = (for_for_b_for_for_b_acc_tmp[2:0]==3'b101)
      & (~ y_3_sva);
  assign for_for_b_for_for_b_and_2_nl = (for_for_b_for_for_b_acc_tmp[2:0]==3'b011)
      & (~ y_3_sva);
  assign for_for_b_for_for_b_nor_1_nl = ~((for_for_b_for_for_b_acc_tmp[2:0]!=3'b000));
  assign for_for_b_for_for_b_and_11_nl = (for_for_b_for_for_b_acc_tmp[2:0]==3'b101)
      & y_3_sva;
  assign for_for_b_for_for_b_and_12_nl = (for_for_b_for_for_b_acc_tmp[2:0]==3'b110)
      & y_3_sva;
  assign for_for_b_for_for_b_and_13_nl = (for_for_b_for_for_b_acc_tmp[2:0]==3'b111)
      & y_3_sva;
  assign for_for_a_mux1h_66_nl = MUX1HOT_s_1_3_2(for_for_a_asn_itm, y_3_sva, x_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign for_for_mux1h_31_nl = MUX1HOT_s_1_3_2(for_for_asn_12_itm, x_3_sva, y_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign for_for_mux1h_33_nl = MUX1HOT_s_1_3_2(for_for_asn_10_itm, x_3_sva, y_3_sva,
      {or_dcpl_3 , (fsm_output[3]) , (fsm_output[4])});
  assign nn_mux_nl = MUX_s_1_2_2(nn_10_sva, nn_9_sva, fsm_output[4]);
  assign nl_for_for_acc_5_nl = for_for_a_lpi_3_dfm_1 - mult_res_lpi_3_dfm_1;
  assign for_for_acc_5_nl = nl_for_for_acc_5_nl[31:0];
  assign nl_for_for_acc_2_nl = for_for_a_lpi_3_dfm_1 + mult_res_lpi_3_dfm_1;
  assign for_for_acc_2_nl = nl_for_for_acc_2_nl[31:0];
  assign for_for_a_for_for_a_and_11_nl = (for_for_a_acc_tmp[1]) & (operator_34_true_1_and_psp_sva_1[0])
      & (~ (for_for_a_acc_tmp[0])) & y_3_sva;
  assign for_for_a_for_for_a_and_5_nl = (for_for_a_acc_tmp[1:0]==2'b11) & (~ (operator_34_true_1_and_psp_sva_1[0]))
      & (~ y_3_sva);
  assign for_for_a_for_for_a_and_6_nl = (for_for_a_acc_tmp[1:0]==2'b11) & (operator_34_true_1_and_psp_sva_1[0])
      & (~ y_3_sva);
  assign for_for_a_for_for_a_and_9_nl = (for_for_a_acc_tmp[0]) & (operator_34_true_1_and_psp_sva_1[0])
      & (~ (for_for_a_acc_tmp[1])) & y_3_sva;
  assign for_for_a_for_for_a_nor_1_nl = ~((for_for_a_acc_tmp[1:0]!=2'b00) | (operator_34_true_1_and_psp_sva_1[0]));
  assign for_for_a_for_for_a_nor_nl = ~((for_for_a_acc_tmp[1:0]!=2'b00) | (operator_34_true_1_and_psp_sva_1[0])
      | y_3_sva);
  assign idx_not_1_nl = ~ (fsm_output[0]);
  assign nl_operator_32_false_2_acc_nl = shift_3_0_sva + 4'b1111;
  assign operator_32_false_2_acc_nl = nl_operator_32_false_2_acc_nl[3:0];
  assign for_for_a_for_for_a_and_12_nl = (for_for_a_acc_tmp[1:0]==2'b11) & (~ (operator_34_true_1_and_psp_sva_1[0]))
      & y_3_sva;
  assign for_for_a_for_for_a_and_13_nl = (for_for_a_acc_tmp[1:0]==2'b11) & (operator_34_true_1_and_psp_sva_1[0])
      & y_3_sva;
  assign for_for_a_for_for_a_and_2_nl = (for_for_a_acc_tmp[0]) & (operator_34_true_1_and_psp_sva_1[0])
      & (~ (for_for_a_acc_tmp[1])) & (~ y_3_sva);
  assign for_for_a_for_for_a_and_4_nl = (for_for_a_acc_tmp[1]) & (operator_34_true_1_and_psp_sva_1[0])
      & (~ (for_for_a_acc_tmp[0])) & (~ y_3_sva);
  assign y_not_35_nl = ~ y_or_cse;
  assign nl_mult_z_mul_itm_1  = mult_t_mul_cmp_a * for_for_w_asn_3_itm;
  assign for_for_and_6_nl = for_for_asn_12_itm & (fsm_output[3]);
  assign mult_if_mux_5_nl = MUX_v_32_2_2(z_out_2, p_sva, fsm_output[2]);
  assign mult_if_mux_6_nl = MUX_v_32_2_2((~ p_sva), (~ for_for_w_asn_3_itm), fsm_output[2]);
  assign nl_acc_nl = ({1'b1 , mult_if_mux_5_nl , 1'b1}) + conv_u2u_33_34({mult_if_mux_6_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[33:0];
  assign z_out_32 = readslicef_34_1_33(acc_nl);
  assign mult_if_mux_7_nl = MUX_v_32_2_2(z_out_2, ({1'b1 , (tmp_2_sva_1[30:0])}),
      fsm_output[2]);
  assign mult_if_or_1_nl = (fsm_output[3:2]!=2'b01);
  assign mult_if_mux_8_nl = MUX_v_32_2_2((~ p_sva), p_sva, fsm_output[2]);
  assign nl_acc_1_nl = ({mult_if_mux_7_nl , mult_if_or_1_nl}) + ({mult_if_mux_8_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[32:0];
  assign z_out_1 = readslicef_33_32_1(acc_1_nl);
  assign mult_res_mux_3_nl = MUX_v_32_2_2(mult_z_mul_itm_1, for_for_w_asn_3_itm,
      fsm_output[2]);
  assign mult_res_mux_4_nl = MUX_v_32_2_2((~ mult_z_mul_itm), (~ p_sva), fsm_output[2]);
  assign nl_acc_2_nl = ({mult_res_mux_3_nl , 1'b1}) + ({mult_res_mux_4_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[32:0];
  assign z_out_2 = readslicef_33_32_1(acc_2_nl);
  assign mult_z_mux_2_nl = MUX_v_32_2_2(tmp_2_sva_2, ({22'b0000000000000000000000
      , reg_s_9_0_ftd , reg_s_9_0_ftd_1}), fsm_output[1]);
  assign mult_z_mux_3_nl = MUX_v_32_2_2(p_sva, ({22'b0000000000000000000000 , nn_10_sva
      , nn_9_sva , nn_8_sva , nn_7_sva , nn_6_sva , nn_5_sva , nn_4_sva , nn_3_sva
      , nn_2_sva , nn_1_sva}), fsm_output[1]);
  assign nl_z_out_3 = mult_z_mux_2_nl * mult_z_mux_3_nl;
  assign z_out_3 = nl_z_out_3[31:0];
  assign for_for_mux_24_nl = MUX_v_9_2_2(for_for_t_9_0_sva_8_0, 9'b111111011, fsm_output[4]);
  assign for_for_mux_25_nl = MUX_v_3_2_2(3'b001, (idx_3_0_sva_2[3:1]), fsm_output[4]);
  assign nl_z_out_4 = conv_u2u_9_10(for_for_mux_24_nl) + conv_u2u_3_10(for_for_mux_25_nl);
  assign z_out_4 = nl_z_out_4[9:0];

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


  function automatic [6:0] MUX1HOT_v_7_3_2;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [2:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    MUX1HOT_v_7_3_2 = result;
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


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
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


  function automatic [6:0] MUX_v_7_2_2;
    input [6:0] input_0;
    input [6:0] input_1;
    input [0:0] sel;
    reg [6:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_7_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input [0:0] sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
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


  function automatic [9:0] conv_u2u_3_10 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_10 = {{7{1'b0}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
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
  output [6:0] xt_rsc_0_0_adra;
  output [31:0] xt_rsc_0_0_da;
  output xt_rsc_0_0_wea;
  input [31:0] xt_rsc_0_0_qa;
  output [6:0] xt_rsc_0_0_adrb;
  output [31:0] xt_rsc_0_0_db;
  output xt_rsc_0_0_web;
  input [31:0] xt_rsc_0_0_qb;
  output xt_rsc_triosy_0_0_lz;
  output [6:0] xt_rsc_0_1_adra;
  output [31:0] xt_rsc_0_1_da;
  output xt_rsc_0_1_wea;
  input [31:0] xt_rsc_0_1_qa;
  output [6:0] xt_rsc_0_1_adrb;
  output [31:0] xt_rsc_0_1_db;
  output xt_rsc_0_1_web;
  input [31:0] xt_rsc_0_1_qb;
  output xt_rsc_triosy_0_1_lz;
  output [6:0] xt_rsc_0_2_adra;
  output [31:0] xt_rsc_0_2_da;
  output xt_rsc_0_2_wea;
  input [31:0] xt_rsc_0_2_qa;
  output [6:0] xt_rsc_0_2_adrb;
  output [31:0] xt_rsc_0_2_db;
  output xt_rsc_0_2_web;
  input [31:0] xt_rsc_0_2_qb;
  output xt_rsc_triosy_0_2_lz;
  output [6:0] xt_rsc_0_3_adra;
  output [31:0] xt_rsc_0_3_da;
  output xt_rsc_0_3_wea;
  input [31:0] xt_rsc_0_3_qa;
  output [6:0] xt_rsc_0_3_adrb;
  output [31:0] xt_rsc_0_3_db;
  output xt_rsc_0_3_web;
  input [31:0] xt_rsc_0_3_qb;
  output xt_rsc_triosy_0_3_lz;
  output [6:0] xt_rsc_0_4_adra;
  output [31:0] xt_rsc_0_4_da;
  output xt_rsc_0_4_wea;
  input [31:0] xt_rsc_0_4_qa;
  output [6:0] xt_rsc_0_4_adrb;
  output [31:0] xt_rsc_0_4_db;
  output xt_rsc_0_4_web;
  input [31:0] xt_rsc_0_4_qb;
  output xt_rsc_triosy_0_4_lz;
  output [6:0] xt_rsc_0_5_adra;
  output [31:0] xt_rsc_0_5_da;
  output xt_rsc_0_5_wea;
  input [31:0] xt_rsc_0_5_qa;
  output [6:0] xt_rsc_0_5_adrb;
  output [31:0] xt_rsc_0_5_db;
  output xt_rsc_0_5_web;
  input [31:0] xt_rsc_0_5_qb;
  output xt_rsc_triosy_0_5_lz;
  output [6:0] xt_rsc_0_6_adra;
  output [31:0] xt_rsc_0_6_da;
  output xt_rsc_0_6_wea;
  input [31:0] xt_rsc_0_6_qa;
  output [6:0] xt_rsc_0_6_adrb;
  output [31:0] xt_rsc_0_6_db;
  output xt_rsc_0_6_web;
  input [31:0] xt_rsc_0_6_qb;
  output xt_rsc_triosy_0_6_lz;
  output [6:0] xt_rsc_0_7_adra;
  output [31:0] xt_rsc_0_7_da;
  output xt_rsc_0_7_wea;
  input [31:0] xt_rsc_0_7_qa;
  output [6:0] xt_rsc_0_7_adrb;
  output [31:0] xt_rsc_0_7_db;
  output xt_rsc_0_7_web;
  input [31:0] xt_rsc_0_7_qb;
  output xt_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output [9:0] twiddle_rsc_radr;
  input [31:0] twiddle_rsc_q;
  output twiddle_rsc_triosy_lz;
  output [9:0] twiddle_h_rsc_radr;
  input [31:0] twiddle_h_rsc_q;
  output twiddle_h_rsc_triosy_lz;


  // Interconnect Declarations
  wire [31:0] twiddle_rsci_q_d;
  wire [31:0] twiddle_h_rsci_q_d;
  wire [13:0] yt_rsc_0_0_i_adra_d;
  wire yt_rsc_0_0_i_clka_en_d;
  wire [63:0] yt_rsc_0_0_i_da_d;
  wire [63:0] yt_rsc_0_0_i_qa_d;
  wire [1:0] yt_rsc_0_0_i_wea_d;
  wire [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_1_i_adra_d;
  wire yt_rsc_0_1_i_clka_en_d;
  wire [63:0] yt_rsc_0_1_i_da_d;
  wire [63:0] yt_rsc_0_1_i_qa_d;
  wire [1:0] yt_rsc_0_1_i_wea_d;
  wire [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_2_i_adra_d;
  wire yt_rsc_0_2_i_clka_en_d;
  wire [63:0] yt_rsc_0_2_i_da_d;
  wire [63:0] yt_rsc_0_2_i_qa_d;
  wire [1:0] yt_rsc_0_2_i_wea_d;
  wire [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_3_i_adra_d;
  wire yt_rsc_0_3_i_clka_en_d;
  wire [63:0] yt_rsc_0_3_i_da_d;
  wire [63:0] yt_rsc_0_3_i_qa_d;
  wire [1:0] yt_rsc_0_3_i_wea_d;
  wire [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_4_i_adra_d;
  wire yt_rsc_0_4_i_clka_en_d;
  wire [63:0] yt_rsc_0_4_i_da_d;
  wire [63:0] yt_rsc_0_4_i_qa_d;
  wire [1:0] yt_rsc_0_4_i_wea_d;
  wire [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_5_i_adra_d;
  wire yt_rsc_0_5_i_clka_en_d;
  wire [63:0] yt_rsc_0_5_i_da_d;
  wire [63:0] yt_rsc_0_5_i_qa_d;
  wire [1:0] yt_rsc_0_5_i_wea_d;
  wire [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_6_i_adra_d;
  wire yt_rsc_0_6_i_clka_en_d;
  wire [63:0] yt_rsc_0_6_i_da_d;
  wire [63:0] yt_rsc_0_6_i_qa_d;
  wire [1:0] yt_rsc_0_6_i_wea_d;
  wire [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] yt_rsc_0_7_i_adra_d;
  wire yt_rsc_0_7_i_clka_en_d;
  wire [63:0] yt_rsc_0_7_i_da_d;
  wire [63:0] yt_rsc_0_7_i_qa_d;
  wire [1:0] yt_rsc_0_7_i_wea_d;
  wire [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] yt_rsc_0_7_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_0_i_adra_d;
  wire [63:0] xt_rsc_0_0_i_da_d;
  wire [63:0] xt_rsc_0_0_i_qa_d;
  wire [1:0] xt_rsc_0_0_i_wea_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_0_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_1_i_adra_d;
  wire [63:0] xt_rsc_0_1_i_da_d;
  wire [63:0] xt_rsc_0_1_i_qa_d;
  wire [1:0] xt_rsc_0_1_i_wea_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_1_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_2_i_adra_d;
  wire [63:0] xt_rsc_0_2_i_da_d;
  wire [63:0] xt_rsc_0_2_i_qa_d;
  wire [1:0] xt_rsc_0_2_i_wea_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_2_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_3_i_adra_d;
  wire [63:0] xt_rsc_0_3_i_da_d;
  wire [63:0] xt_rsc_0_3_i_qa_d;
  wire [1:0] xt_rsc_0_3_i_wea_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_3_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_4_i_adra_d;
  wire [63:0] xt_rsc_0_4_i_da_d;
  wire [63:0] xt_rsc_0_4_i_qa_d;
  wire [1:0] xt_rsc_0_4_i_wea_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_4_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_5_i_adra_d;
  wire [63:0] xt_rsc_0_5_i_da_d;
  wire [63:0] xt_rsc_0_5_i_qa_d;
  wire [1:0] xt_rsc_0_5_i_wea_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_5_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_6_i_adra_d;
  wire [63:0] xt_rsc_0_6_i_da_d;
  wire [63:0] xt_rsc_0_6_i_qa_d;
  wire [1:0] xt_rsc_0_6_i_wea_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] xt_rsc_0_6_i_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [13:0] xt_rsc_0_7_i_adra_d;
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
  wire [6:0] yt_rsc_0_0_adrb;
  wire [31:0] yt_rsc_0_0_qa;
  wire yt_rsc_0_0_wea;
  wire [31:0] yt_rsc_0_0_da;
  wire [6:0] yt_rsc_0_0_adra;
  wire yt_rsc_0_1_clkb_en;
  wire yt_rsc_0_1_clka_en;
  wire [31:0] yt_rsc_0_1_qb;
  wire yt_rsc_0_1_web;
  wire [31:0] yt_rsc_0_1_db;
  wire [6:0] yt_rsc_0_1_adrb;
  wire [31:0] yt_rsc_0_1_qa;
  wire yt_rsc_0_1_wea;
  wire [31:0] yt_rsc_0_1_da;
  wire [6:0] yt_rsc_0_1_adra;
  wire yt_rsc_0_2_clkb_en;
  wire yt_rsc_0_2_clka_en;
  wire [31:0] yt_rsc_0_2_qb;
  wire yt_rsc_0_2_web;
  wire [31:0] yt_rsc_0_2_db;
  wire [6:0] yt_rsc_0_2_adrb;
  wire [31:0] yt_rsc_0_2_qa;
  wire yt_rsc_0_2_wea;
  wire [31:0] yt_rsc_0_2_da;
  wire [6:0] yt_rsc_0_2_adra;
  wire yt_rsc_0_3_clkb_en;
  wire yt_rsc_0_3_clka_en;
  wire [31:0] yt_rsc_0_3_qb;
  wire yt_rsc_0_3_web;
  wire [31:0] yt_rsc_0_3_db;
  wire [6:0] yt_rsc_0_3_adrb;
  wire [31:0] yt_rsc_0_3_qa;
  wire yt_rsc_0_3_wea;
  wire [31:0] yt_rsc_0_3_da;
  wire [6:0] yt_rsc_0_3_adra;
  wire yt_rsc_0_4_clkb_en;
  wire yt_rsc_0_4_clka_en;
  wire [31:0] yt_rsc_0_4_qb;
  wire yt_rsc_0_4_web;
  wire [31:0] yt_rsc_0_4_db;
  wire [6:0] yt_rsc_0_4_adrb;
  wire [31:0] yt_rsc_0_4_qa;
  wire yt_rsc_0_4_wea;
  wire [31:0] yt_rsc_0_4_da;
  wire [6:0] yt_rsc_0_4_adra;
  wire yt_rsc_0_5_clkb_en;
  wire yt_rsc_0_5_clka_en;
  wire [31:0] yt_rsc_0_5_qb;
  wire yt_rsc_0_5_web;
  wire [31:0] yt_rsc_0_5_db;
  wire [6:0] yt_rsc_0_5_adrb;
  wire [31:0] yt_rsc_0_5_qa;
  wire yt_rsc_0_5_wea;
  wire [31:0] yt_rsc_0_5_da;
  wire [6:0] yt_rsc_0_5_adra;
  wire yt_rsc_0_6_clkb_en;
  wire yt_rsc_0_6_clka_en;
  wire [31:0] yt_rsc_0_6_qb;
  wire yt_rsc_0_6_web;
  wire [31:0] yt_rsc_0_6_db;
  wire [6:0] yt_rsc_0_6_adrb;
  wire [31:0] yt_rsc_0_6_qa;
  wire yt_rsc_0_6_wea;
  wire [31:0] yt_rsc_0_6_da;
  wire [6:0] yt_rsc_0_6_adra;
  wire yt_rsc_0_7_clkb_en;
  wire yt_rsc_0_7_clka_en;
  wire [31:0] yt_rsc_0_7_qb;
  wire yt_rsc_0_7_web;
  wire [31:0] yt_rsc_0_7_db;
  wire [6:0] yt_rsc_0_7_adrb;
  wire [31:0] yt_rsc_0_7_qa;
  wire yt_rsc_0_7_wea;
  wire [31:0] yt_rsc_0_7_da;
  wire [6:0] yt_rsc_0_7_adra;
  wire [9:0] twiddle_rsci_radr_d_iff;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_stockham_dit_core_inst_mult_t_mul_cmp_z;
  assign nl_stockham_dit_core_inst_mult_t_mul_cmp_z = conv_u2u_64_64(mult_t_mul_cmp_a
      * mult_t_mul_cmp_b);
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  BLOCK_DPRAM_RBW_DUAL #(.addr_width(32'sd7),
  .data_width(32'sd32),
  .depth(32'sd128),
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
  stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_3_10_32_1024_1024_32_1_gen twiddle_rsci
      (
      .q(twiddle_rsc_q),
      .radr(twiddle_rsc_radr),
      .q_d(twiddle_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_1R1W_RBW_rport_4_10_32_1024_1024_32_1_gen twiddle_h_rsci
      (
      .q(twiddle_h_rsc_q),
      .radr(twiddle_h_rsc_radr),
      .q_d(twiddle_h_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_iff)
    );
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_6_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_7_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_8_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_9_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_10_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_11_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_12_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_en_13_7_32_128_128_32_1_gen
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_14_7_32_128_128_32_1_gen xt_rsc_0_0_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_15_7_32_128_128_32_1_gen xt_rsc_0_1_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_7_32_128_128_32_1_gen xt_rsc_0_2_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_7_32_128_128_32_1_gen xt_rsc_0_3_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_18_7_32_128_128_32_1_gen xt_rsc_0_4_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_19_7_32_128_128_32_1_gen xt_rsc_0_5_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_20_7_32_128_128_32_1_gen xt_rsc_0_6_i
      (
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
  stockham_dit_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_21_7_32_128_128_32_1_gen xt_rsc_0_7_i
      (
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



