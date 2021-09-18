
//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
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

module ccs_sync_in_wait_v1 (rdy, vld, irdy, ivld);
  parameter integer rscid = 1;

  output rdy;
  input  vld;
  input  irdy;
  output ivld;

  wire   ivld;
  wire   rdy;

  assign ivld = vld;
  assign rdy = irdy;
endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
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

module ccs_sync_out_wait_v1 (vld, irdy, ivld, rdy);
  parameter integer rscid = 1;

  input  ivld;
  output irdy;
  output vld;
  input  rdy;

  wire   irdy;
  wire   vld;

  assign vld = ivld;
  assign irdy = rdy;
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


//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/mgc_out_dreg_v2.v 
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


module mgc_out_dreg_v2 (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------> ../td_ccore_solutions/modulo_sub_f83f1ef2ff5a4101c59f332e5a2a07d06350_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Sep 16 11:50:47 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_sub_core
// ------------------------------------------------------------------


module modulo_sub_core (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_clk, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_clk;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] base_rsci_idat;
  wire [31:0] m_rsci_idat;
  reg [31:0] return_rsci_d;

  wire[31:0] qif_acc_nl;
  wire[32:0] nl_qif_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd9),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd10),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd11),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(({1'b0 , (base_rsci_idat[30:0])}), qif_acc_nl,
          base_rsci_idat[31]);
    end
  end
  assign nl_qif_acc_nl = ({1'b1 , (base_rsci_idat[30:0])}) + m_rsci_idat;
  assign qif_acc_nl = nl_qif_acc_nl[31:0];

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modulo_sub
// ------------------------------------------------------------------


module modulo_sub (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  modulo_sub_core modulo_sub_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en)
    );
endmodule




//------> ../td_ccore_solutions/modulo_add_1c7cb5effec07f258b1f9fafcfd3564d6028_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Sep 16 11:50:48 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    modulo_add_core
// ------------------------------------------------------------------


module modulo_add_core (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_clk, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_clk;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] base_rsci_idat;
  wire [31:0] m_rsci_idat;
  reg [31:0] return_rsci_d;

  wire[31:0] qif_acc_nl;
  wire[32:0] nl_qif_acc_nl;
  wire[32:0] acc_1_nl;
  wire[33:0] nl_acc_1_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd6),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd7),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd8),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(base_rsci_idat, qif_acc_nl, readslicef_33_1_32(acc_1_nl));
    end
  end
  assign nl_qif_acc_nl = base_rsci_idat - m_rsci_idat;
  assign qif_acc_nl = nl_qif_acc_nl[31:0];
  assign nl_acc_1_nl = ({1'b1 , m_rsci_idat}) + conv_u2u_32_33(~ base_rsci_idat)
      + 33'b000000000000000000000000000000001;
  assign acc_1_nl = nl_acc_1_nl[32:0];

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


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
  end
  endfunction


  function automatic [32:0] conv_u2u_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_33 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    modulo_add
// ------------------------------------------------------------------


module modulo_add (
  base_rsc_dat, m_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat, ccs_ccore_clk,
      ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] base_rsc_dat;
  input [31:0] m_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  modulo_add_core modulo_add_core_inst (
      .base_rsc_dat(base_rsc_dat),
      .m_rsc_dat(m_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en)
    );
endmodule




//------> ../td_ccore_solutions/mult_211a0e259bca55d0a7d87e37cf4e500170bb_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Sep 16 11:50:49 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mult_core
// ------------------------------------------------------------------


module mult_core (
  x_rsc_dat, y_rsc_dat, y_rsc_dat_1, p_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat,
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] x_rsc_dat;
  input [31:0] y_rsc_dat;
  input [31:0] y_rsc_dat_1;
  input [31:0] p_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;


  // Interconnect Declarations
  wire [31:0] x_rsci_idat;
  wire [31:0] y_rsci_idat;
  wire [31:0] y_rsci_idat_1;
  wire [31:0] p_rsci_idat;
  reg [31:0] return_rsci_d;
  wire ccs_ccore_start_rsci_idat;
  wire and_dcpl;
  reg slc_32_svs_1;
  reg main_stage_0_2;
  reg [31:0] p_buf_sva_1;
  reg [31:0] p_buf_sva_2;
  reg [31:0] res_sva_1;
  reg [31:0] z_mul_itm_1;
  wire [63:0] nl_z_mul_itm_1;
  reg [31:0] operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1;
  reg asn_itm_1;
  wire [31:0] res_sva_3;
  wire [32:0] nl_res_sva_3;
  wire res_and_cse;
  wire p_and_1_cse;
  wire if_acc_1_itm_32_1;

  wire[31:0] if_acc_nl;
  wire[32:0] nl_if_acc_nl;
  wire[63:0] t_mul_nl;
  wire[31:0] z_mul_nl;
  wire[63:0] nl_z_mul_nl;
  wire[32:0] if_acc_1_nl;
  wire[33:0] nl_if_acc_1_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd32)) x_rsci (
      .dat(x_rsc_dat),
      .idat(x_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) y_rsci (
      .dat(y_rsc_dat),
      .idat(y_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd3),
  .width(32'sd32)) y_rsci_1 (
      .dat(y_rsc_dat_1),
      .idat(y_rsci_idat_1)
    );
  ccs_in_v1 #(.rscid(32'sd4),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd5),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  ccs_in_v1 #(.rscid(32'sd21),
  .width(32'sd1)) ccs_ccore_start_rsci (
      .dat(ccs_ccore_start_rsc_dat),
      .idat(ccs_ccore_start_rsci_idat)
    );
  assign res_and_cse = ccs_ccore_en & and_dcpl;
  assign p_and_1_cse = ccs_ccore_en & ccs_ccore_start_rsci_idat;
  assign nl_z_mul_nl = operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1
      * p_buf_sva_1;
  assign z_mul_nl = nl_z_mul_nl[31:0];
  assign nl_res_sva_3 = z_mul_itm_1 - z_mul_nl;
  assign res_sva_3 = nl_res_sva_3[31:0];
  assign nl_if_acc_1_nl = ({1'b1 , res_sva_3}) + conv_u2u_32_33(~ p_buf_sva_1) +
      33'b000000000000000000000000000000001;
  assign if_acc_1_nl = nl_if_acc_1_nl[32:0];
  assign if_acc_1_itm_32_1 = readslicef_33_1_32(if_acc_1_nl);
  assign and_dcpl = main_stage_0_2 & asn_itm_1;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(if_acc_nl, res_sva_1, slc_32_svs_1);
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      asn_itm_1 <= 1'b0;
      main_stage_0_2 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      asn_itm_1 <= ccs_ccore_start_rsci_idat;
      main_stage_0_2 <= 1'b1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( res_and_cse ) begin
      res_sva_1 <= res_sva_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      slc_32_svs_1 <= 1'b0;
    end
    else if ( res_and_cse ) begin
      slc_32_svs_1 <= if_acc_1_itm_32_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & and_dcpl & (~ if_acc_1_itm_32_1) ) begin
      p_buf_sva_2 <= p_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( p_and_1_cse ) begin
      p_buf_sva_1 <= p_rsci_idat;
      z_mul_itm_1 <= nl_z_mul_itm_1[31:0];
      operator_96_false_operator_96_false_slc_t_mul_63_32_itm_1 <= readslicef_64_32_32(t_mul_nl);
    end
  end
  assign nl_if_acc_nl = res_sva_1 - p_buf_sva_2;
  assign if_acc_nl = nl_if_acc_nl[31:0];
  assign nl_z_mul_itm_1  = x_rsci_idat * y_rsci_idat;
  assign t_mul_nl = conv_u2u_64_64(x_rsci_idat * y_rsci_idat_1);

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


  function automatic [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
  end
  endfunction


  function automatic [31:0] readslicef_64_32_32;
    input [63:0] vector;
    reg [63:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_64_32_32 = tmp[31:0];
  end
  endfunction


  function automatic [32:0] conv_u2u_32_33 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_33 = {1'b0, vector};
  end
  endfunction


  function automatic [63:0] conv_u2u_64_64 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_64 = vector;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    mult
// ------------------------------------------------------------------


module mult (
  x_rsc_dat, y_rsc_dat, y_rsc_dat_1, p_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat,
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en
);
  input [31:0] x_rsc_dat;
  input [31:0] y_rsc_dat;
  input [31:0] y_rsc_dat_1;
  input [31:0] p_rsc_dat;
  output [31:0] return_rsc_z;
  input ccs_ccore_start_rsc_dat;
  input ccs_ccore_clk;
  input ccs_ccore_srst;
  input ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  mult_core mult_core_inst (
      .x_rsc_dat(x_rsc_dat),
      .y_rsc_dat(y_rsc_dat),
      .y_rsc_dat_1(y_rsc_dat_1),
      .p_rsc_dat(p_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_srst(ccs_ccore_srst),
      .ccs_ccore_en(ccs_ccore_en)
    );
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

//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Thu Sep 16 12:51:46 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [11:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [11:0] adra;
  input [23:0] adra_d;
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
  assign adrb = (adra_d[23:12]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[11:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [11:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [11:0] adra;
  input [23:0] adra_d;
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
  assign adrb = (adra_d[23:12]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[11:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [11:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [11:0] adra;
  input [23:0] adra_d;
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
  assign adrb = (adra_d[23:12]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[11:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_core_fsm (
  clk, rst, complete_rsci_wen_comp, fsm_output, main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_2_tr0, COMP_LOOP_2_VEC_LOOP_C_8_tr0, COMP_LOOP_C_3_tr0, COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_4_tr0, COMP_LOOP_4_VEC_LOOP_C_8_tr0, COMP_LOOP_C_5_tr0, COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_6_tr0, COMP_LOOP_6_VEC_LOOP_C_8_tr0, COMP_LOOP_C_7_tr0, COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_8_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_9_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [6:0] fsm_output;
  reg [6:0] fsm_output;
  input main_C_0_tr0;
  input COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_2_tr0;
  input COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_3_tr0;
  input COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_4_tr0;
  input COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_5_tr0;
  input COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_6_tr0;
  input COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_7_tr0;
  input COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_8_tr0;
  input COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_9_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  parameter
    main_C_0 = 7'd0,
    STAGE_LOOP_C_0 = 7'd1,
    COMP_LOOP_C_0 = 7'd2,
    COMP_LOOP_C_1 = 7'd3,
    COMP_LOOP_1_VEC_LOOP_C_0 = 7'd4,
    COMP_LOOP_1_VEC_LOOP_C_1 = 7'd5,
    COMP_LOOP_1_VEC_LOOP_C_2 = 7'd6,
    COMP_LOOP_1_VEC_LOOP_C_3 = 7'd7,
    COMP_LOOP_1_VEC_LOOP_C_4 = 7'd8,
    COMP_LOOP_1_VEC_LOOP_C_5 = 7'd9,
    COMP_LOOP_1_VEC_LOOP_C_6 = 7'd10,
    COMP_LOOP_1_VEC_LOOP_C_7 = 7'd11,
    COMP_LOOP_1_VEC_LOOP_C_8 = 7'd12,
    COMP_LOOP_C_2 = 7'd13,
    COMP_LOOP_2_VEC_LOOP_C_0 = 7'd14,
    COMP_LOOP_2_VEC_LOOP_C_1 = 7'd15,
    COMP_LOOP_2_VEC_LOOP_C_2 = 7'd16,
    COMP_LOOP_2_VEC_LOOP_C_3 = 7'd17,
    COMP_LOOP_2_VEC_LOOP_C_4 = 7'd18,
    COMP_LOOP_2_VEC_LOOP_C_5 = 7'd19,
    COMP_LOOP_2_VEC_LOOP_C_6 = 7'd20,
    COMP_LOOP_2_VEC_LOOP_C_7 = 7'd21,
    COMP_LOOP_2_VEC_LOOP_C_8 = 7'd22,
    COMP_LOOP_C_3 = 7'd23,
    COMP_LOOP_3_VEC_LOOP_C_0 = 7'd24,
    COMP_LOOP_3_VEC_LOOP_C_1 = 7'd25,
    COMP_LOOP_3_VEC_LOOP_C_2 = 7'd26,
    COMP_LOOP_3_VEC_LOOP_C_3 = 7'd27,
    COMP_LOOP_3_VEC_LOOP_C_4 = 7'd28,
    COMP_LOOP_3_VEC_LOOP_C_5 = 7'd29,
    COMP_LOOP_3_VEC_LOOP_C_6 = 7'd30,
    COMP_LOOP_3_VEC_LOOP_C_7 = 7'd31,
    COMP_LOOP_3_VEC_LOOP_C_8 = 7'd32,
    COMP_LOOP_C_4 = 7'd33,
    COMP_LOOP_4_VEC_LOOP_C_0 = 7'd34,
    COMP_LOOP_4_VEC_LOOP_C_1 = 7'd35,
    COMP_LOOP_4_VEC_LOOP_C_2 = 7'd36,
    COMP_LOOP_4_VEC_LOOP_C_3 = 7'd37,
    COMP_LOOP_4_VEC_LOOP_C_4 = 7'd38,
    COMP_LOOP_4_VEC_LOOP_C_5 = 7'd39,
    COMP_LOOP_4_VEC_LOOP_C_6 = 7'd40,
    COMP_LOOP_4_VEC_LOOP_C_7 = 7'd41,
    COMP_LOOP_4_VEC_LOOP_C_8 = 7'd42,
    COMP_LOOP_C_5 = 7'd43,
    COMP_LOOP_5_VEC_LOOP_C_0 = 7'd44,
    COMP_LOOP_5_VEC_LOOP_C_1 = 7'd45,
    COMP_LOOP_5_VEC_LOOP_C_2 = 7'd46,
    COMP_LOOP_5_VEC_LOOP_C_3 = 7'd47,
    COMP_LOOP_5_VEC_LOOP_C_4 = 7'd48,
    COMP_LOOP_5_VEC_LOOP_C_5 = 7'd49,
    COMP_LOOP_5_VEC_LOOP_C_6 = 7'd50,
    COMP_LOOP_5_VEC_LOOP_C_7 = 7'd51,
    COMP_LOOP_5_VEC_LOOP_C_8 = 7'd52,
    COMP_LOOP_C_6 = 7'd53,
    COMP_LOOP_6_VEC_LOOP_C_0 = 7'd54,
    COMP_LOOP_6_VEC_LOOP_C_1 = 7'd55,
    COMP_LOOP_6_VEC_LOOP_C_2 = 7'd56,
    COMP_LOOP_6_VEC_LOOP_C_3 = 7'd57,
    COMP_LOOP_6_VEC_LOOP_C_4 = 7'd58,
    COMP_LOOP_6_VEC_LOOP_C_5 = 7'd59,
    COMP_LOOP_6_VEC_LOOP_C_6 = 7'd60,
    COMP_LOOP_6_VEC_LOOP_C_7 = 7'd61,
    COMP_LOOP_6_VEC_LOOP_C_8 = 7'd62,
    COMP_LOOP_C_7 = 7'd63,
    COMP_LOOP_7_VEC_LOOP_C_0 = 7'd64,
    COMP_LOOP_7_VEC_LOOP_C_1 = 7'd65,
    COMP_LOOP_7_VEC_LOOP_C_2 = 7'd66,
    COMP_LOOP_7_VEC_LOOP_C_3 = 7'd67,
    COMP_LOOP_7_VEC_LOOP_C_4 = 7'd68,
    COMP_LOOP_7_VEC_LOOP_C_5 = 7'd69,
    COMP_LOOP_7_VEC_LOOP_C_6 = 7'd70,
    COMP_LOOP_7_VEC_LOOP_C_7 = 7'd71,
    COMP_LOOP_7_VEC_LOOP_C_8 = 7'd72,
    COMP_LOOP_C_8 = 7'd73,
    COMP_LOOP_8_VEC_LOOP_C_0 = 7'd74,
    COMP_LOOP_8_VEC_LOOP_C_1 = 7'd75,
    COMP_LOOP_8_VEC_LOOP_C_2 = 7'd76,
    COMP_LOOP_8_VEC_LOOP_C_3 = 7'd77,
    COMP_LOOP_8_VEC_LOOP_C_4 = 7'd78,
    COMP_LOOP_8_VEC_LOOP_C_5 = 7'd79,
    COMP_LOOP_8_VEC_LOOP_C_6 = 7'd80,
    COMP_LOOP_8_VEC_LOOP_C_7 = 7'd81,
    COMP_LOOP_8_VEC_LOOP_C_8 = 7'd82,
    COMP_LOOP_C_9 = 7'd83,
    STAGE_LOOP_C_1 = 7'd84,
    main_C_1 = 7'd85,
    main_C_2 = 7'd86;

  reg [6:0] state_var;
  reg [6:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 7'b0000001;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 7'b0000010;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 7'b0000011;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
      end
      COMP_LOOP_1_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0000100;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_1;
      end
      COMP_LOOP_1_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0000101;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_2;
      end
      COMP_LOOP_1_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0000110;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_3;
      end
      COMP_LOOP_1_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0000111;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_4;
      end
      COMP_LOOP_1_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0001000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_5;
      end
      COMP_LOOP_1_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0001001;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_6;
      end
      COMP_LOOP_1_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0001010;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_7;
      end
      COMP_LOOP_1_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0001011;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_8;
      end
      COMP_LOOP_1_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0001100;
        if ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 7'b0001101;
        if ( COMP_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_2_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0001110;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_1;
      end
      COMP_LOOP_2_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0001111;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_2;
      end
      COMP_LOOP_2_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0010000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_3;
      end
      COMP_LOOP_2_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0010001;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_4;
      end
      COMP_LOOP_2_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0010010;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_5;
      end
      COMP_LOOP_2_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0010011;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_6;
      end
      COMP_LOOP_2_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0010100;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_7;
      end
      COMP_LOOP_2_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0010101;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_8;
      end
      COMP_LOOP_2_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0010110;
        if ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_3;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 7'b0010111;
        if ( COMP_LOOP_C_3_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_3_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0011000;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_1;
      end
      COMP_LOOP_3_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0011001;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_2;
      end
      COMP_LOOP_3_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0011010;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_3;
      end
      COMP_LOOP_3_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0011011;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_4;
      end
      COMP_LOOP_3_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0011100;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_5;
      end
      COMP_LOOP_3_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0011101;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_6;
      end
      COMP_LOOP_3_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0011110;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_7;
      end
      COMP_LOOP_3_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0011111;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_8;
      end
      COMP_LOOP_3_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0100000;
        if ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 7'b0100001;
        if ( COMP_LOOP_C_4_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_4_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0100010;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_1;
      end
      COMP_LOOP_4_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0100011;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_2;
      end
      COMP_LOOP_4_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0100100;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_3;
      end
      COMP_LOOP_4_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0100101;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_4;
      end
      COMP_LOOP_4_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0100110;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_5;
      end
      COMP_LOOP_4_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0100111;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_6;
      end
      COMP_LOOP_4_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0101000;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_7;
      end
      COMP_LOOP_4_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0101001;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_8;
      end
      COMP_LOOP_4_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0101010;
        if ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_5;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 7'b0101011;
        if ( COMP_LOOP_C_5_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_5_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0101100;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_1;
      end
      COMP_LOOP_5_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0101101;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_2;
      end
      COMP_LOOP_5_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0101110;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_3;
      end
      COMP_LOOP_5_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0101111;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_4;
      end
      COMP_LOOP_5_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0110000;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_5;
      end
      COMP_LOOP_5_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0110001;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_6;
      end
      COMP_LOOP_5_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0110010;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_7;
      end
      COMP_LOOP_5_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0110011;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_8;
      end
      COMP_LOOP_5_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0110100;
        if ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 7'b0110101;
        if ( COMP_LOOP_C_6_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_6_VEC_LOOP_C_0 : begin
        fsm_output = 7'b0110110;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_1;
      end
      COMP_LOOP_6_VEC_LOOP_C_1 : begin
        fsm_output = 7'b0110111;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_2;
      end
      COMP_LOOP_6_VEC_LOOP_C_2 : begin
        fsm_output = 7'b0111000;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_3;
      end
      COMP_LOOP_6_VEC_LOOP_C_3 : begin
        fsm_output = 7'b0111001;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_4;
      end
      COMP_LOOP_6_VEC_LOOP_C_4 : begin
        fsm_output = 7'b0111010;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_5;
      end
      COMP_LOOP_6_VEC_LOOP_C_5 : begin
        fsm_output = 7'b0111011;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_6;
      end
      COMP_LOOP_6_VEC_LOOP_C_6 : begin
        fsm_output = 7'b0111100;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_7;
      end
      COMP_LOOP_6_VEC_LOOP_C_7 : begin
        fsm_output = 7'b0111101;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_8;
      end
      COMP_LOOP_6_VEC_LOOP_C_8 : begin
        fsm_output = 7'b0111110;
        if ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_7;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 7'b0111111;
        if ( COMP_LOOP_C_7_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_7_VEC_LOOP_C_0 : begin
        fsm_output = 7'b1000000;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_1;
      end
      COMP_LOOP_7_VEC_LOOP_C_1 : begin
        fsm_output = 7'b1000001;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_2;
      end
      COMP_LOOP_7_VEC_LOOP_C_2 : begin
        fsm_output = 7'b1000010;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_3;
      end
      COMP_LOOP_7_VEC_LOOP_C_3 : begin
        fsm_output = 7'b1000011;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_4;
      end
      COMP_LOOP_7_VEC_LOOP_C_4 : begin
        fsm_output = 7'b1000100;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_5;
      end
      COMP_LOOP_7_VEC_LOOP_C_5 : begin
        fsm_output = 7'b1000101;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_6;
      end
      COMP_LOOP_7_VEC_LOOP_C_6 : begin
        fsm_output = 7'b1000110;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_7;
      end
      COMP_LOOP_7_VEC_LOOP_C_7 : begin
        fsm_output = 7'b1000111;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_8;
      end
      COMP_LOOP_7_VEC_LOOP_C_8 : begin
        fsm_output = 7'b1001000;
        if ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_8;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 7'b1001001;
        if ( COMP_LOOP_C_8_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_8_VEC_LOOP_C_0 : begin
        fsm_output = 7'b1001010;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_1;
      end
      COMP_LOOP_8_VEC_LOOP_C_1 : begin
        fsm_output = 7'b1001011;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_2;
      end
      COMP_LOOP_8_VEC_LOOP_C_2 : begin
        fsm_output = 7'b1001100;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_3;
      end
      COMP_LOOP_8_VEC_LOOP_C_3 : begin
        fsm_output = 7'b1001101;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_4;
      end
      COMP_LOOP_8_VEC_LOOP_C_4 : begin
        fsm_output = 7'b1001110;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_5;
      end
      COMP_LOOP_8_VEC_LOOP_C_5 : begin
        fsm_output = 7'b1001111;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_6;
      end
      COMP_LOOP_8_VEC_LOOP_C_6 : begin
        fsm_output = 7'b1010000;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_7;
      end
      COMP_LOOP_8_VEC_LOOP_C_7 : begin
        fsm_output = 7'b1010001;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_8;
      end
      COMP_LOOP_8_VEC_LOOP_C_8 : begin
        fsm_output = 7'b1010010;
        if ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 7'b1010011;
        if ( COMP_LOOP_C_9_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 7'b1010100;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 7'b1010101;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 7'b1010110;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 7'b0000000;
        if ( main_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( complete_rsci_wen_comp ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_staller
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_staller (
  clk, rst, core_wten, complete_rsci_wen_comp, core_wten_pff
);
  input clk;
  input rst;
  output core_wten;
  input complete_rsci_wen_comp;
  output core_wten_pff;


  // Interconnect Declarations
  reg core_wten_reg;


  // Interconnect Declarations for Component Instantiations 
  assign core_wten = core_wten_reg;
  assign core_wten_pff = ~ complete_rsci_wen_comp;
  always @(posedge clk) begin
    if ( rst ) begin
      core_wten_reg <= 1'b0;
    end
    else begin
      core_wten_reg <= ~ complete_rsci_wen_comp;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_obj_iswt0, twiddle_h_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_obj_iswt0;
  output twiddle_h_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_obj_ld_core_sct = twiddle_h_rsc_triosy_obj_iswt0 &
      (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_obj_iswt0, twiddle_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;
  output twiddle_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_obj_ld_core_sct = twiddle_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl (
  core_wten, r_rsc_triosy_obj_iswt0, r_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input r_rsc_triosy_obj_iswt0;
  output r_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign r_rsc_triosy_obj_ld_core_sct = r_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl (
  core_wten, p_rsc_triosy_obj_iswt0, p_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input p_rsc_triosy_obj_iswt0;
  output p_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign p_rsc_triosy_obj_ld_core_sct = p_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl (
  core_wten, vec_rsc_triosy_obj_iswt0, vec_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;
  output vec_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_obj_ld_core_sct = vec_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp (
  clk, rst, complete_rsci_oswt, complete_rsci_wen_comp, complete_rsci_biwt, complete_rsci_bdwt,
      complete_rsci_bcwt
);
  input clk;
  input rst;
  input complete_rsci_oswt;
  output complete_rsci_wen_comp;
  input complete_rsci_biwt;
  input complete_rsci_bdwt;
  output complete_rsci_bcwt;
  reg complete_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign complete_rsci_wen_comp = (~ complete_rsci_oswt) | complete_rsci_biwt | complete_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      complete_rsci_bcwt <= 1'b0;
    end
    else begin
      complete_rsci_bcwt <= ~((~(complete_rsci_bcwt | complete_rsci_biwt)) | complete_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl (
  core_wen, complete_rsci_oswt, complete_rsci_biwt, complete_rsci_bdwt, complete_rsci_bcwt,
      complete_rsci_ivld_core_sct, complete_rsci_irdy
);
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_biwt;
  output complete_rsci_bdwt;
  input complete_rsci_bcwt;
  output complete_rsci_ivld_core_sct;
  input complete_rsci_irdy;


  // Interconnect Declarations
  wire complete_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign complete_rsci_bdwt = complete_rsci_oswt & core_wen;
  assign complete_rsci_biwt = complete_rsci_ogwt & complete_rsci_irdy;
  assign complete_rsci_ogwt = complete_rsci_oswt & (~ complete_rsci_bcwt);
  assign complete_rsci_ivld_core_sct = complete_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp (
  clk, rst, twiddle_h_rsci_adra_d, twiddle_h_rsci_qa_d, twiddle_h_rsci_adra_d_core,
      twiddle_h_rsci_qa_d_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt
);
  input clk;
  input rst;
  output [11:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  input [23:0] twiddle_h_rsci_adra_d_core;
  output [31:0] twiddle_h_rsci_qa_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsci_bcwt;
  reg [31:0] twiddle_h_rsci_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_qa_d_mxwt = MUX_v_32_2_2((twiddle_h_rsci_qa_d[31:0]), twiddle_h_rsci_qa_d_bfwt_31_0,
      twiddle_h_rsci_bcwt);
  assign twiddle_h_rsci_adra_d = twiddle_h_rsci_adra_d_core[11:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsci_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsci_bcwt <= ~((~(twiddle_h_rsci_bcwt | twiddle_h_rsci_biwt)) | twiddle_h_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsci_biwt ) begin
      twiddle_h_rsci_qa_d_bfwt_31_0 <= twiddle_h_rsci_qa_d[31:0];
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_h_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  input [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_7_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign COMP_LOOP_twiddle_help_and_7_nl = (twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_h_rsci_oswt_pff;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_help_and_7_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_adra_d, twiddle_rsci_qa_d, twiddle_rsci_adra_d_core, twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_biwt, twiddle_rsci_bdwt
);
  input clk;
  input rst;
  output [11:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  input [23:0] twiddle_rsci_adra_d_core;
  output [31:0] twiddle_rsci_qa_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_rsci_bcwt;
  reg [31:0] twiddle_rsci_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_qa_d_mxwt = MUX_v_32_2_2((twiddle_rsci_qa_d[31:0]), twiddle_rsci_qa_d_bfwt_31_0,
      twiddle_rsci_bcwt);
  assign twiddle_rsci_adra_d = twiddle_rsci_adra_d_core[11:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsci_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsci_bcwt <= ~((~(twiddle_rsci_bcwt | twiddle_rsci_biwt)) | twiddle_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsci_biwt ) begin
      twiddle_rsci_qa_d_bfwt_31_0 <= twiddle_rsci_qa_d[31:0];
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  input [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsci_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_7_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign COMP_LOOP_twiddle_f_and_7_nl = (twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_rsci_oswt_pff;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_f_and_7_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_wait_dp (
  ensig_cgo_iro, ensig_cgo_iro_2, core_wen, ensig_cgo, COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en,
      ensig_cgo_2, COMP_LOOP_1_mult_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo_iro_2;
  input core_wen;
  input ensig_cgo;
  output COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  input ensig_cgo_2;
  output COMP_LOOP_1_mult_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign COMP_LOOP_1_mult_cmp_ccs_ccore_en = core_wen & (ensig_cgo_2 | ensig_cgo_iro_2);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp (
  clk, rst, vec_rsci_da_d, vec_rsci_qa_d, vec_rsci_da_d_core, vec_rsci_qa_d_mxwt,
      vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_biwt_1, vec_rsci_bdwt_2
);
  input clk;
  input rst;
  output [31:0] vec_rsci_da_d;
  input [63:0] vec_rsci_qa_d;
  input [63:0] vec_rsci_da_d_core;
  output [63:0] vec_rsci_qa_d_mxwt;
  input vec_rsci_biwt;
  input vec_rsci_bdwt;
  input vec_rsci_biwt_1;
  input vec_rsci_bdwt_2;


  // Interconnect Declarations
  reg vec_rsci_bcwt;
  reg vec_rsci_bcwt_1;
  reg [31:0] vec_rsci_qa_d_bfwt_63_32;
  reg [31:0] vec_rsci_qa_d_bfwt_31_0;

  wire[31:0] VEC_LOOP_mux_2_nl;
  wire[31:0] VEC_LOOP_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  assign VEC_LOOP_mux_2_nl = MUX_v_32_2_2((vec_rsci_qa_d[63:32]), vec_rsci_qa_d_bfwt_63_32,
      vec_rsci_bcwt_1);
  assign VEC_LOOP_mux_3_nl = MUX_v_32_2_2((vec_rsci_qa_d[31:0]), vec_rsci_qa_d_bfwt_31_0,
      vec_rsci_bcwt);
  assign vec_rsci_qa_d_mxwt = {VEC_LOOP_mux_2_nl , VEC_LOOP_mux_3_nl};
  assign vec_rsci_da_d = vec_rsci_da_d_core[31:0];
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsci_bcwt <= 1'b0;
      vec_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      vec_rsci_bcwt <= ~((~(vec_rsci_bcwt | vec_rsci_biwt)) | vec_rsci_bdwt);
      vec_rsci_bcwt_1 <= ~((~(vec_rsci_bcwt_1 | vec_rsci_biwt_1)) | vec_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsci_biwt_1 ) begin
      vec_rsci_qa_d_bfwt_63_32 <= vec_rsci_qa_d[63:32];
    end
  end
  always @(posedge clk) begin
    if ( vec_rsci_biwt ) begin
      vec_rsci_qa_d_bfwt_31_0 <= vec_rsci_qa_d[31:0];
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl (
  core_wen, core_wten, vec_rsci_oswt, vec_rsci_oswt_1, vec_rsci_wea_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      vec_rsci_biwt, vec_rsci_bdwt, vec_rsci_biwt_1, vec_rsci_bdwt_2, vec_rsci_wea_d_core_sct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct, vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct,
      core_wten_pff, vec_rsci_oswt_pff, vec_rsci_oswt_1_pff
);
  input core_wen;
  input core_wten;
  input vec_rsci_oswt;
  input vec_rsci_oswt_1;
  input [1:0] vec_rsci_wea_d_core_psct;
  input [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  output vec_rsci_biwt;
  output vec_rsci_bdwt;
  output vec_rsci_biwt_1;
  output vec_rsci_bdwt_2;
  output [1:0] vec_rsci_wea_d_core_sct;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  input core_wten_pff;
  input vec_rsci_oswt_pff;
  input vec_rsci_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsci_dswt_pff;

  wire[0:0] VEC_LOOP_and_8_nl;
  wire[0:0] VEC_LOOP_and_12_nl;
  wire[0:0] VEC_LOOP_and_10_nl;

  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_bdwt = vec_rsci_oswt & core_wen;
  assign vec_rsci_biwt = (~ core_wten) & vec_rsci_oswt;
  assign vec_rsci_bdwt_2 = vec_rsci_oswt_1 & core_wen;
  assign vec_rsci_biwt_1 = (~ core_wten) & vec_rsci_oswt_1;
  assign VEC_LOOP_and_8_nl = (vec_rsci_wea_d_core_psct[0]) & vec_rsci_dswt_pff;
  assign vec_rsci_wea_d_core_sct = {1'b0 , VEC_LOOP_and_8_nl};
  assign vec_rsci_dswt_pff = (~ core_wten_pff) & vec_rsci_oswt_pff;
  assign VEC_LOOP_and_12_nl = (~ core_wten_pff) & vec_rsci_oswt_1_pff;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({VEC_LOOP_and_12_nl , vec_rsci_dswt_pff});
  assign VEC_LOOP_and_10_nl = (vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])
      & vec_rsci_dswt_pff;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct = {1'b0 , VEC_LOOP_and_10_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp (
  clk, rst, run_rsci_ivld_mxwt, run_rsci_ivld, run_rsci_biwt, run_rsci_bdwt
);
  input clk;
  input rst;
  output run_rsci_ivld_mxwt;
  input run_rsci_ivld;
  input run_rsci_biwt;
  input run_rsci_bdwt;


  // Interconnect Declarations
  reg run_rsci_bcwt;
  reg run_rsci_ivld_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign run_rsci_ivld_mxwt = MUX_s_1_2_2(run_rsci_ivld, run_rsci_ivld_bfwt, run_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      run_rsci_bcwt <= 1'b0;
    end
    else begin
      run_rsci_bcwt <= ~((~(run_rsci_bcwt | run_rsci_biwt)) | run_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( run_rsci_biwt ) begin
      run_rsci_ivld_bfwt <= run_rsci_ivld;
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl (
  core_wen, run_rsci_oswt, core_wten, run_rsci_biwt, run_rsci_bdwt
);
  input core_wen;
  input run_rsci_oswt;
  input core_wten;
  output run_rsci_biwt;
  output run_rsci_bdwt;



  // Interconnect Declarations for Component Instantiations 
  assign run_rsci_bdwt = run_rsci_oswt & core_wen;
  assign run_rsci_biwt = (~ core_wten) & run_rsci_oswt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj (
  twiddle_h_rsc_triosy_lz, core_wten, twiddle_h_rsc_triosy_obj_iswt0
);
  output twiddle_h_rsc_triosy_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_obj (
      .ld(twiddle_h_rsc_triosy_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
      inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(twiddle_h_rsc_triosy_obj_iswt0),
      .twiddle_h_rsc_triosy_obj_ld_core_sct(twiddle_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj (
  twiddle_rsc_triosy_lz, core_wten, twiddle_rsc_triosy_obj_iswt0
);
  output twiddle_rsc_triosy_lz;
  input core_wten;
  input twiddle_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_obj (
      .ld(twiddle_rsc_triosy_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
      inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj (
  r_rsc_triosy_lz, core_wten, r_rsc_triosy_obj_iswt0
);
  output r_rsc_triosy_lz;
  input core_wten;
  input r_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire r_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) r_rsc_triosy_obj (
      .ld(r_rsc_triosy_obj_ld_core_sct),
      .lz(r_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(r_rsc_triosy_obj_iswt0),
      .r_rsc_triosy_obj_ld_core_sct(r_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj (
  p_rsc_triosy_lz, core_wten, p_rsc_triosy_obj_iswt0
);
  output p_rsc_triosy_lz;
  input core_wten;
  input p_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire p_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) p_rsc_triosy_obj (
      .ld(p_rsc_triosy_obj_ld_core_sct),
      .lz(p_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(p_rsc_triosy_obj_iswt0),
      .p_rsc_triosy_obj_ld_core_sct(p_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj (
  vec_rsc_triosy_lz, core_wten, vec_rsc_triosy_obj_iswt0
);
  output vec_rsc_triosy_lz;
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_obj (
      .ld(vec_rsc_triosy_obj_ld_core_sct),
      .lz(vec_rsc_triosy_lz)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(vec_rsc_triosy_obj_iswt0),
      .vec_rsc_triosy_obj_ld_core_sct(vec_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_complete_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_complete_rsci (
  clk, rst, complete_rsc_rdy, complete_rsc_vld, core_wen, complete_rsci_oswt, complete_rsci_wen_comp
);
  input clk;
  input rst;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_wen_comp;


  // Interconnect Declarations
  wire complete_rsci_biwt;
  wire complete_rsci_bdwt;
  wire complete_rsci_bcwt;
  wire complete_rsci_ivld_core_sct;
  wire complete_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_out_wait_v1 #(.rscid(32'sd18)) complete_rsci (
      .vld(complete_rsc_vld),
      .rdy(complete_rsc_rdy),
      .ivld(complete_rsci_ivld_core_sct),
      .irdy(complete_rsci_irdy)
    );
  inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt),
      .complete_rsci_ivld_core_sct(complete_rsci_ivld_core_sct),
      .complete_rsci_irdy(complete_rsci_irdy)
    );
  inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp inPlaceNTT_DIT_precomp_core_complete_rsci_complete_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 (
  clk, rst, twiddle_h_rsci_adra_d, twiddle_h_rsci_qa_d, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_adra_d_core, twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, core_wten_pff, twiddle_h_rsci_oswt_pff
);
  input clk;
  input rst;
  output [11:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  input [23:0] twiddle_h_rsci_adra_d_core;
  output [31:0] twiddle_h_rsci_qa_d_mxwt;
  input [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_h_rsci_qa_d_mxwt_pconst;
  wire [11:0] twiddle_h_rsci_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core
      = {12'b000000000000 , (twiddle_h_rsci_adra_d_core[11:0])};
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_adra_d(twiddle_h_rsci_adra_d_reg),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_adra_d_core(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core[23:0]),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt_pconst),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt)
    );
  assign twiddle_h_rsci_qa_d_mxwt = twiddle_h_rsci_qa_d_mxwt_pconst;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_h_rsci_adra_d = twiddle_h_rsci_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_adra_d, twiddle_rsci_qa_d, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_adra_d_core, twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, core_wten_pff, twiddle_rsci_oswt_pff
);
  input clk;
  input rst;
  output [11:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  input [23:0] twiddle_rsci_adra_d_core;
  output [31:0] twiddle_rsci_qa_d_mxwt;
  input [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_rsci_qa_d_mxwt_pconst;
  wire [11:0] twiddle_rsci_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core
      = {12'b000000000000 , (twiddle_rsci_adra_d_core[11:0])};
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_adra_d(twiddle_rsci_adra_d_reg),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_adra_d_core(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core[23:0]),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt_pconst),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt)
    );
  assign twiddle_rsci_qa_d_mxwt = twiddle_rsci_qa_d_mxwt_pconst;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_rsci_adra_d = twiddle_rsci_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_vec_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_vec_rsci_1 (
  clk, rst, vec_rsci_da_d, vec_rsci_qa_d, vec_rsci_wea_d, vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d, core_wen, core_wten, vec_rsci_oswt,
      vec_rsci_oswt_1, vec_rsci_da_d_core, vec_rsci_qa_d_mxwt, vec_rsci_wea_d_core_psct,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct,
      core_wten_pff, vec_rsci_oswt_pff, vec_rsci_oswt_1_pff
);
  input clk;
  input rst;
  output [31:0] vec_rsci_da_d;
  input [63:0] vec_rsci_qa_d;
  output [1:0] vec_rsci_wea_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsci_oswt;
  input vec_rsci_oswt_1;
  input [63:0] vec_rsci_da_d_core;
  output [63:0] vec_rsci_qa_d_mxwt;
  input [1:0] vec_rsci_wea_d_core_psct;
  input [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  input core_wten_pff;
  input vec_rsci_oswt_pff;
  input vec_rsci_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsci_biwt;
  wire vec_rsci_bdwt;
  wire vec_rsci_biwt_1;
  wire vec_rsci_bdwt_2;
  wire [1:0] vec_rsci_wea_d_core_sct;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  wire [31:0] vec_rsci_da_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct
      = {1'b0 , (vec_rsci_wea_d_core_psct[0])};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[0])};
  wire [63:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core
      = {32'b00000000000000000000000000000000 , (vec_rsci_da_d_core[31:0])};
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsci_oswt(vec_rsci_oswt),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_wea_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_wea_d_core_psct[1:0]),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_wea_d_core_sct(vec_rsci_wea_d_core_sct),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct(vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .vec_rsci_oswt_pff(vec_rsci_oswt_pff),
      .vec_rsci_oswt_1_pff(vec_rsci_oswt_1_pff)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_da_d(vec_rsci_da_d_reg),
      .vec_rsci_qa_d(vec_rsci_qa_d),
      .vec_rsci_da_d_core(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst_vec_rsci_da_d_core[63:0]),
      .vec_rsci_qa_d_mxwt(vec_rsci_qa_d_mxwt),
      .vec_rsci_biwt(vec_rsci_biwt),
      .vec_rsci_bdwt(vec_rsci_bdwt),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2)
    );
  assign vec_rsci_wea_d = vec_rsci_wea_d_core_sct;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_sct;
  assign vec_rsci_da_d = vec_rsci_da_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_run_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_run_rsci (
  clk, rst, run_rsc_rdy, run_rsc_vld, core_wen, run_rsci_oswt, core_wten, run_rsci_ivld_mxwt
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  input core_wen;
  input run_rsci_oswt;
  input core_wten;
  output run_rsci_ivld_mxwt;


  // Interconnect Declarations
  wire run_rsci_ivld;
  wire run_rsci_biwt;
  wire run_rsci_bdwt;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_in_wait_v1 #(.rscid(32'sd12)) run_rsci (
      .vld(run_rsc_vld),
      .rdy(run_rsc_rdy),
      .ivld(run_rsci_ivld),
      .irdy(run_rsci_biwt)
    );
  inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .run_rsci_oswt(run_rsci_oswt),
      .core_wten(core_wten),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
  inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp inPlaceNTT_DIT_precomp_core_run_rsci_run_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt),
      .run_rsci_ivld(run_rsci_ivld),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_triosy_lz, twiddle_rsc_triosy_lz, twiddle_h_rsc_triosy_lz, complete_rsc_rdy,
      complete_rsc_vld, vec_rsci_adra_d, vec_rsci_da_d, vec_rsci_qa_d, vec_rsci_wea_d,
      vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d, vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d,
      twiddle_rsci_adra_d, twiddle_rsci_qa_d, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsci_adra_d, twiddle_h_rsci_qa_d, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_lz;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;
  output [23:0] vec_rsci_adra_d;
  output [31:0] vec_rsci_da_d;
  input [63:0] vec_rsci_qa_d;
  output [1:0] vec_rsci_wea_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [11:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [11:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;


  // Interconnect Declarations
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire [63:0] vec_rsci_qa_d_mxwt;
  wire [31:0] p_rsci_idat;
  wire [31:0] twiddle_rsci_qa_d_mxwt;
  wire [31:0] twiddle_h_rsci_qa_d_mxwt;
  wire complete_rsci_wen_comp;
  wire [31:0] COMP_LOOP_1_modulo_sub_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_add_cmp_return_rsc_z;
  wire [31:0] COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [6:0] fsm_output;
  wire or_tmp_13;
  wire nor_tmp;
  wire nor_tmp_13;
  wire or_dcpl_30;
  wire or_tmp_53;
  wire or_tmp_54;
  wire or_tmp_55;
  wire or_tmp_59;
  wire or_tmp_60;
  wire mux_tmp_58;
  wire or_tmp_61;
  wire or_tmp_63;
  wire mux_tmp_59;
  wire mux_tmp_60;
  wire or_tmp_64;
  wire mux_tmp_61;
  wire mux_tmp_62;
  wire and_dcpl_14;
  wire and_dcpl_15;
  wire and_dcpl_16;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire mux_tmp_64;
  wire mux_tmp_65;
  wire mux_tmp_66;
  wire mux_tmp_68;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_28;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_33;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_44;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_56;
  wire or_tmp_70;
  wire mux_tmp_72;
  wire or_tmp_73;
  wire or_tmp_74;
  wire nand_tmp;
  wire mux_tmp_83;
  wire and_dcpl_61;
  wire and_dcpl_65;
  wire xor_dcpl;
  wire and_dcpl_81;
  wire and_dcpl_84;
  wire or_tmp_85;
  wire mux_tmp_85;
  wire mux_tmp_89;
  wire mux_tmp_95;
  wire or_tmp_89;
  wire or_tmp_90;
  wire mux_tmp_97;
  wire mux_tmp_100;
  wire or_tmp_96;
  wire mux_tmp_109;
  wire mux_tmp_110;
  wire mux_tmp_115;
  wire mux_tmp_137;
  wire and_dcpl_104;
  wire or_tmp_127;
  wire mux_tmp_150;
  reg COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  reg [12:0] STAGE_LOOP_lshift_psp_sva;
  reg [12:0] VEC_LOOP_j_2_12_0_sva_1;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_2_cse;
  wire or_77_cse;
  wire or_75_cse;
  wire or_203_cse;
  wire or_185_cse;
  wire VEC_LOOP_nor_cse;
  wire or_124_cse;
  wire [31:0] vec_rsci_da_d_reg;
  wire [1:0] vec_rsci_wea_d_reg;
  wire core_wten_iff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [11:0] twiddle_rsci_adra_d_reg;
  wire [8:0] COMP_LOOP_twiddle_f_mux1h_23_rmff;
  wire COMP_LOOP_twiddle_f_and_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_15_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_28_rmff;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire nor_58_rmff;
  wire [11:0] twiddle_h_rsci_adra_d_reg;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_87_rmff;
  reg [31:0] factor1_1_sva;
  reg [31:0] VEC_LOOP_mult_vec_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [11:0] VEC_LOOP_acc_10_cse_1_sva;
  reg [31:0] VEC_LOOP_j_1_sva;
  reg [31:0] p_sva;
  wire mux_57_itm;
  wire mux_94_itm;
  wire mux_106_itm;
  wire mux_69_itm;
  wire and_dcpl_112;
  wire [12:0] z_out;
  wire and_dcpl_127;
  wire and_dcpl_130;
  wire and_dcpl_134;
  wire and_dcpl_139;
  wire and_dcpl_144;
  wire [12:0] z_out_1;
  wire and_dcpl_156;
  wire [3:0] z_out_2;
  wire [4:0] nl_z_out_2;
  wire and_dcpl_168;
  wire mux_tmp_177;
  wire and_dcpl_175;
  wire [31:0] z_out_4;
  wire and_dcpl_177;
  wire and_dcpl_192;
  wire and_dcpl_202;
  wire [11:0] z_out_5;
  wire [12:0] nl_z_out_5;
  wire and_dcpl_210;
  wire and_dcpl_224;
  wire and_dcpl_229;
  wire and_dcpl_232;
  wire and_dcpl_236;
  wire [11:0] z_out_6;
  wire [12:0] nl_z_out_6;
  wire and_dcpl_242;
  wire and_dcpl_243;
  wire and_dcpl_247;
  wire and_dcpl_255;
  wire and_dcpl_263;
  wire [11:0] z_out_7;
  wire and_dcpl_269;
  wire and_dcpl_274;
  wire and_dcpl_279;
  wire and_dcpl_280;
  wire and_dcpl_283;
  wire and_dcpl_285;
  wire and_dcpl_286;
  wire and_dcpl_287;
  wire and_dcpl_290;
  wire [11:0] z_out_8;
  wire [23:0] nl_z_out_8;
  wire and_dcpl_296;
  wire and_dcpl_302;
  wire and_dcpl_306;
  wire [10:0] z_out_9;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_twiddle_f_acc_cse_sva;
  reg [31:0] VEC_LOOP_j_1_sva_1;
  reg [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  reg [10:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  reg [8:0] COMP_LOOP_k_12_3_sva_8_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire VEC_LOOP_j_1_sva_mx0c0;
  wire [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire [10:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
  wire VEC_LOOP_or_29_ssc;
  wire COMP_LOOP_twiddle_f_or_ssc;
  wire COMP_LOOP_twiddle_f_or_7_cse;
  wire COMP_LOOP_twiddle_f_or_4_cse;
  wire VEC_LOOP_or_11_cse;
  wire VEC_LOOP_or_12_cse;
  wire VEC_LOOP_or_13_cse;
  wire VEC_LOOP_or_19_cse;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire and_228_cse;
  wire and_232_cse;
  wire mux_tmp;
  wire or_tmp_154;
  wire or_tmp_160;
  wire [10:0] VEC_LOOP_VEC_LOOP_mux_1_rgt;
  reg VEC_LOOP_acc_11_psp_sva_10;
  reg [9:0] VEC_LOOP_acc_11_psp_sva_9_0;
  reg [2:0] reg_VEC_LOOP_acc_1_reg;
  reg [8:0] reg_VEC_LOOP_acc_1_1_reg;
  wire nor_56_ssc;
  wire VEC_LOOP_nand_seb;
  wire VEC_LOOP_or_7_ssc;
  wire or_251_cse;
  wire nand_24_cse;
  wire or_cse;
  wire nor_33_cse;
  wire and_349_cse;
  wire nor_111_cse;
  wire and_344_cse;
  wire and_116_cse;
  wire nand_20_cse;
  wire VEC_LOOP_or_32_itm;
  wire VEC_LOOP_or_24_itm;
  wire VEC_LOOP_or_34_itm;
  wire COMP_LOOP_twiddle_f_nor_1_itm;
  wire STAGE_LOOP_acc_itm_4_1;
  wire [8:0] z_out_3_20_12;
  wire nand_28_cse;

  wire[0:0] mux_56_nl;
  wire[0:0] mux_55_nl;
  wire[0:0] mux_54_nl;
  wire[0:0] or_93_nl;
  wire[0:0] mux_53_nl;
  wire[0:0] or_92_nl;
  wire[0:0] mux_52_nl;
  wire[0:0] mux_51_nl;
  wire[0:0] or_91_nl;
  wire[0:0] mux_50_nl;
  wire[0:0] mux_49_nl;
  wire[0:0] mux_48_nl;
  wire[0:0] mux_47_nl;
  wire[0:0] mux_46_nl;
  wire[0:0] mux_45_nl;
  wire[0:0] mux_44_nl;
  wire[0:0] mux_81_nl;
  wire[0:0] mux_80_nl;
  wire[0:0] or_115_nl;
  wire[0:0] mux_79_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] or_114_nl;
  wire[0:0] mux_78_nl;
  wire[0:0] or_112_nl;
  wire[0:0] mux_77_nl;
  wire[0:0] or_111_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_7_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl;
  wire[8:0] COMP_LOOP_1_twiddle_f_mul_nl;
  wire[17:0] nl_COMP_LOOP_1_twiddle_f_mul_nl;
  wire[0:0] and_75_nl;
  wire[0:0] mux_93_nl;
  wire[0:0] mux_92_nl;
  wire[0:0] mux_91_nl;
  wire[0:0] mux_90_nl;
  wire[0:0] mux_86_nl;
  wire[0:0] mux_84_nl;
  wire[0:0] mux_96_nl;
  wire[0:0] mux_105_nl;
  wire[0:0] mux_104_nl;
  wire[0:0] mux_103_nl;
  wire[0:0] mux_102_nl;
  wire[0:0] mux_101_nl;
  wire[0:0] nand_1_nl;
  wire[0:0] or_130_nl;
  wire[0:0] or_129_nl;
  wire[0:0] mux_98_nl;
  wire[0:0] or_128_nl;
  wire[0:0] or_127_nl;
  wire[0:0] mux_113_nl;
  wire[0:0] mux_112_nl;
  wire[0:0] mux_111_nl;
  wire[0:0] COMP_LOOP_k_not_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_120_nl;
  wire[0:0] mux_119_nl;
  wire[0:0] mux_118_nl;
  wire[0:0] or_143_nl;
  wire[0:0] nor_54_nl;
  wire[0:0] nor_55_nl;
  wire[31:0] VEC_LOOP_mux_2_nl;
  wire[0:0] VEC_LOOP_j_not_1_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_63_nl;
  wire[0:0] mux_138_nl;
  wire[2:0] VEC_LOOP_VEC_LOOP_mux_8_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] nand_19_nl;
  wire[0:0] or_250_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] or_224_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] or_223_nl;
  wire[0:0] or_222_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_9_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] or_239_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] or_238_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_201_nl;
  wire[0:0] or_236_nl;
  wire[0:0] or_234_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] mux_198_nl;
  wire[0:0] or_231_nl;
  wire[0:0] or_230_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] mux_152_nl;
  wire[0:0] and_117_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] mux_149_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] mux_158_nl;
  wire[0:0] nor_31_nl;
  wire[0:0] mux_157_nl;
  wire[0:0] nor_32_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[9:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl;
  wire[0:0] and_110_nl;
  wire[0:0] mux_160_nl;
  wire[0:0] nand_26_nl;
  wire[0:0] mux_34_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] nor_115_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] nor_112_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] or_240_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] mux_212_nl;
  wire[0:0] nor_108_nl;
  wire[0:0] nor_110_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] or_245_nl;
  wire[0:0] or_244_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_67_nl;
  wire[0:0] mux_70_nl;
  wire[0:0] nor_35_nl;
  wire[0:0] nor_36_nl;
  wire[0:0] mux_71_nl;
  wire[0:0] or_104_nl;
  wire[0:0] or_103_nl;
  wire[0:0] mux_76_nl;
  wire[0:0] or_110_nl;
  wire[0:0] mux_82_nl;
  wire[0:0] mux_88_nl;
  wire[0:0] mux_87_nl;
  wire[0:0] mux_99_nl;
  wire[0:0] mux_114_nl;
  wire[0:0] mux_148_nl;
  wire[9:0] VEC_LOOP_mux1h_6_nl;
  wire[0:0] VEC_LOOP_mux1h_4_nl;
  wire[0:0] VEC_LOOP_mux1h_2_nl;
  wire[0:0] and_59_nl;
  wire[8:0] VEC_LOOP_mux1h_nl;
  wire[0:0] and_26_nl;
  wire[0:0] VEC_LOOP_mux1h_1_nl;
  wire[0:0] VEC_LOOP_mux1h_3_nl;
  wire[0:0] nor_60_nl;
  wire[0:0] mux_73_nl;
  wire[0:0] or_107_nl;
  wire[0:0] VEC_LOOP_mux1h_5_nl;
  wire[0:0] nor_59_nl;
  wire[0:0] mux_75_nl;
  wire[0:0] mux_74_nl;
  wire[0:0] or_214_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] mux_179_nl;
  wire[13:0] acc_nl;
  wire[14:0] nl_acc_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_9_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_or_37_nl;
  wire[0:0] mux_214_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_10_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_12_nl;
  wire[3:0] STAGE_LOOP_mux_3_nl;
  wire[21:0] acc_2_nl;
  wire[22:0] nl_acc_2_nl;
  wire[19:0] VEC_LOOP_mux_9_nl;
  wire[0:0] VEC_LOOP_or_38_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[31:0] VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_or_39_nl;
  wire[31:0] VEC_LOOP_mux_11_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_12_nl;
  wire[11:0] VEC_LOOP_mux_12_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_13_nl;
  wire[2:0] VEC_LOOP_or_40_nl;
  wire[2:0] VEC_LOOP_mux1h_29_nl;
  wire[0:0] VEC_LOOP_or_41_nl;
  wire[11:0] VEC_LOOP_mux1h_30_nl;
  wire[12:0] acc_6_nl;
  wire[13:0] nl_acc_6_nl;
  wire[1:0] VEC_LOOP_VEC_LOOP_and_2_nl;
  wire[0:0] VEC_LOOP_nor_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_13_nl;
  wire[0:0] VEC_LOOP_mux_13_nl;
  wire[8:0] VEC_LOOP_mux1h_31_nl;
  wire[0:0] VEC_LOOP_or_42_nl;
  wire[8:0] VEC_LOOP_mux1h_32_nl;
  wire[1:0] VEC_LOOP_or_43_nl;
  wire[1:0] VEC_LOOP_and_16_nl;
  wire[1:0] VEC_LOOP_mux1h_33_nl;
  wire[0:0] not_475_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_14_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux_4_nl;
  wire[10:0] COMP_LOOP_twiddle_f_mux1h_73_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_10_nl;
  wire[7:0] COMP_LOOP_twiddle_f_mux1h_74_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_13_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_14_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_15_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl;
  wire[11:0] acc_7_nl;
  wire[12:0] nl_acc_7_nl;
  wire[10:0] VEC_LOOP_VEC_LOOP_mux_14_nl;
  wire[0:0] VEC_LOOP_or_44_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_16_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = z_out_4;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat = factor1_1_sva + COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_x_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_x_rsc_dat = VEC_LOOP_mult_vec_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat = COMP_LOOP_twiddle_f_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = COMP_LOOP_twiddle_help_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire[0:0] mux_107_nl;
  wire [0:0] nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  assign mux_107_nl = MUX_s_1_2_2(mux_tmp_95, mux_tmp_62, fsm_output[1]);
  assign nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat = ~(mux_107_nl | (fsm_output[0]));
  wire[0:0] and_142_nl;
  wire[0:0] and_149_nl;
  wire [3:0] nl_COMP_LOOP_1_twiddle_f_lshift_rg_s;
  assign and_142_nl = and_dcpl_112 & (~ (fsm_output[5])) & (~ (fsm_output[3])) &
      (fsm_output[1]) & (~ (fsm_output[6])) & (~ (fsm_output[0]));
  assign and_149_nl = and_dcpl_112 & (fsm_output[5]) & (~ (fsm_output[3])) & (~((fsm_output[1])
      | (fsm_output[6]))) & (~ (fsm_output[0]));
  assign nl_COMP_LOOP_1_twiddle_f_lshift_rg_s = MUX1HOT_v_4_3_2(z_out_2, STAGE_LOOP_i_3_0_sva,
      COMP_LOOP_1_twiddle_f_acc_cse_sva, {and_142_nl , (fsm_output[0]) , and_149_nl});
  wire[31:0] VEC_LOOP_mux_nl;
  wire [63:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core;
  assign VEC_LOOP_mux_nl = MUX_v_32_2_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      VEC_LOOP_j_1_sva, and_dcpl_25);
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core = {32'b00000000000000000000000000000000
      , VEC_LOOP_mux_nl};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct
      = {1'b0 , (~ mux_69_itm)};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {VEC_LOOP_nor_cse , VEC_LOOP_nor_cse};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (~ mux_69_itm)};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff = ~ mux_57_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro = ~ mux_94_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 = ~ mux_106_itm;
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core
      = {12'b000000000000 , COMP_LOOP_twiddle_f_mux1h_23_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_15_rmff , COMP_LOOP_twiddle_f_mux1h_28_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , nor_58_rmff};
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core
      = {12'b000000000000 , COMP_LOOP_twiddle_f_mux1h_23_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_15_rmff , COMP_LOOP_twiddle_f_mux1h_28_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , nor_58_rmff};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0
      = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_9[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 = ~ (z_out_7[9]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_2_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 = ~ (z_out_3_20_12[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd14),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  modulo_sub  COMP_LOOP_1_modulo_sub_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(and_87_rmff),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(and_87_rmff),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  mult  COMP_LOOP_1_mult_cmp (
      .x_rsc_dat(nl_COMP_LOOP_1_mult_cmp_x_rsc_dat[31:0]),
      .y_rsc_dat(nl_COMP_LOOP_1_mult_cmp_y_rsc_dat[31:0]),
      .y_rsc_dat_1(nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1[31:0]),
      .p_rsc_dat(nl_COMP_LOOP_1_mult_cmp_p_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_mult_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd12)) COMP_LOOP_2_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva),
      .z(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd11)) COMP_LOOP_3_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva),
      .z(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd13)) COMP_LOOP_1_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_1_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
    );
  inPlaceNTT_DIT_precomp_core_run_rsci inPlaceNTT_DIT_precomp_core_run_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .core_wen(complete_rsci_wen_comp),
      .run_rsci_oswt(reg_run_rsci_oswt_cse),
      .core_wten(core_wten),
      .run_rsci_ivld_mxwt(run_rsci_ivld_mxwt)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsci_1 inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_da_d(vec_rsci_da_d_reg),
      .vec_rsci_qa_d(vec_rsci_qa_d),
      .vec_rsci_wea_d(vec_rsci_wea_d_reg),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsci_oswt(reg_vec_rsci_oswt_cse),
      .vec_rsci_oswt_1(reg_vec_rsci_oswt_1_cse),
      .vec_rsci_da_d_core(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core[63:0]),
      .vec_rsci_qa_d_mxwt(vec_rsci_qa_d_mxwt),
      .vec_rsci_wea_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct[1:0]),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsci_oswt_pff(nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff[0:0]),
      .vec_rsci_oswt_1_pff(VEC_LOOP_nor_cse)
    );
  inPlaceNTT_DIT_precomp_core_wait_dp inPlaceNTT_DIT_precomp_core_wait_dp_inst (
      .ensig_cgo_iro(nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro[0:0]),
      .ensig_cgo_iro_2(nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2[0:0]),
      .core_wen(complete_rsci_wen_comp),
      .ensig_cgo(reg_ensig_cgo_cse),
      .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en),
      .ensig_cgo_2(reg_ensig_cgo_2_cse),
      .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_adra_d(twiddle_rsci_adra_d_reg),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_adra_d_core(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core[23:0]),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsci_oswt_pff(nor_58_rmff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_adra_d(twiddle_h_rsci_adra_d_reg),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_adra_d_core(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core[23:0]),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsci_oswt_pff(nor_58_rmff)
    );
  inPlaceNTT_DIT_precomp_core_complete_rsci inPlaceNTT_DIT_precomp_core_complete_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .core_wen(complete_rsci_wen_comp),
      .complete_rsci_oswt(reg_complete_rsci_oswt_cse),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_vec_rsc_triosy_obj_inst
      (
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj inPlaceNTT_DIT_precomp_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIT_precomp_core_staller inPlaceNTT_DIT_precomp_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wten(core_wten),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .core_wten_pff(core_wten_iff)
    );
  inPlaceNTT_DIT_precomp_core_core_fsm inPlaceNTT_DIT_precomp_core_core_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .fsm_output(fsm_output),
      .main_C_0_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0[0:0]),
      .COMP_LOOP_1_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_2_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0[0:0]),
      .COMP_LOOP_2_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_3_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0[0:0]),
      .COMP_LOOP_3_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_4_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0[0:0]),
      .COMP_LOOP_4_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_5_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0[0:0]),
      .COMP_LOOP_5_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_6_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0[0:0]),
      .COMP_LOOP_6_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_7_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_7_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_8_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_9_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_93_nl = (fsm_output[0]) | (~ (fsm_output[6])) | (fsm_output[5]);
  assign mux_54_nl = MUX_s_1_2_2(or_93_nl, or_tmp_53, fsm_output[1]);
  assign or_92_nl = ((fsm_output[0]) & (fsm_output[6])) | (fsm_output[5]);
  assign mux_53_nl = MUX_s_1_2_2(or_185_cse, or_92_nl, fsm_output[1]);
  assign mux_55_nl = MUX_s_1_2_2(mux_54_nl, mux_53_nl, fsm_output[3]);
  assign mux_51_nl = MUX_s_1_2_2(or_tmp_55, or_185_cse, fsm_output[1]);
  assign or_91_nl = (fsm_output[1]) | (fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]);
  assign mux_52_nl = MUX_s_1_2_2(mux_51_nl, or_91_nl, fsm_output[3]);
  assign mux_56_nl = MUX_s_1_2_2(mux_55_nl, mux_52_nl, fsm_output[4]);
  assign mux_48_nl = MUX_s_1_2_2(or_tmp_54, or_tmp_55, fsm_output[1]);
  assign mux_47_nl = MUX_s_1_2_2(or_tmp_53, or_tmp_54, fsm_output[1]);
  assign mux_49_nl = MUX_s_1_2_2(mux_48_nl, mux_47_nl, fsm_output[3]);
  assign mux_45_nl = MUX_s_1_2_2(or_203_cse, or_tmp_53, fsm_output[1]);
  assign mux_44_nl = MUX_s_1_2_2(or_185_cse, or_203_cse, fsm_output[1]);
  assign mux_46_nl = MUX_s_1_2_2(mux_45_nl, mux_44_nl, fsm_output[3]);
  assign mux_50_nl = MUX_s_1_2_2(mux_49_nl, mux_46_nl, fsm_output[4]);
  assign mux_57_itm = MUX_s_1_2_2(mux_56_nl, mux_50_nl, fsm_output[2]);
  assign nand_2_nl = ~((VEC_LOOP_j_2_12_0_sva_1[12]) & (fsm_output[6]));
  assign or_114_nl = COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm | (fsm_output[6]);
  assign mux_79_nl = MUX_s_1_2_2(nand_2_nl, or_114_nl, fsm_output[2]);
  assign or_115_nl = (fsm_output[5:4]!=2'b00) | mux_79_nl;
  assign mux_80_nl = MUX_s_1_2_2(nand_tmp, or_115_nl, fsm_output[3]);
  assign or_111_nl = (fsm_output[2]) | (fsm_output[6]);
  assign mux_77_nl = MUX_s_1_2_2(or_111_nl, or_tmp_74, fsm_output[4]);
  assign or_112_nl = (fsm_output[5]) | mux_77_nl;
  assign mux_78_nl = MUX_s_1_2_2(or_112_nl, nand_tmp, fsm_output[3]);
  assign mux_81_nl = MUX_s_1_2_2(mux_80_nl, mux_78_nl, fsm_output[1]);
  assign nor_58_rmff = ~(mux_81_nl | (fsm_output[0]));
  assign COMP_LOOP_twiddle_f_or_7_cse = (and_dcpl_31 & and_dcpl_16 & and_dcpl_39)
      | (and_dcpl_47 & and_dcpl_21);
  assign COMP_LOOP_twiddle_f_or_4_cse = and_dcpl_61 | (and_dcpl_41 & and_dcpl_15)
      | (and_dcpl_47 & and_dcpl_15) | (and_dcpl_50 & and_dcpl_30);
  assign COMP_LOOP_twiddle_f_mux1h_7_nl = MUX1HOT_s_1_3_2((z_out_8[2]), (z_out_8[1]),
      (z_out_8[0]), {COMP_LOOP_twiddle_f_or_4_cse , COMP_LOOP_twiddle_f_or_7_cse
      , and_dcpl_65});
  assign COMP_LOOP_twiddle_f_and_rmff = COMP_LOOP_twiddle_f_mux1h_7_nl & (~(mux_tmp_83
      | (fsm_output[0])));
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl = MUX_s_1_2_2((z_out_8[1]),
      (z_out_8[0]), COMP_LOOP_twiddle_f_or_7_cse);
  assign COMP_LOOP_twiddle_f_mux1h_15_rmff = COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl
      & (~(and_dcpl_53 & xor_dcpl & (fsm_output[2:0]==3'b010)));
  assign nl_COMP_LOOP_1_twiddle_f_mul_nl = (z_out[8:0]) * COMP_LOOP_k_12_3_sva_8_0;
  assign COMP_LOOP_1_twiddle_f_mul_nl = nl_COMP_LOOP_1_twiddle_f_mul_nl[8:0];
  assign and_75_nl = and_dcpl_23 & and_dcpl_39;
  assign COMP_LOOP_twiddle_f_mux1h_23_rmff = MUX1HOT_v_9_4_2(COMP_LOOP_1_twiddle_f_mul_nl,
      (z_out_8[11:3]), (z_out_8[10:2]), (z_out_8[9:1]), {and_75_nl , COMP_LOOP_twiddle_f_or_4_cse
      , COMP_LOOP_twiddle_f_or_7_cse , and_dcpl_65});
  assign COMP_LOOP_twiddle_f_mux1h_28_rmff = (z_out_8[0]) & (~((~((fsm_output[4])
      ^ (fsm_output[2]))) & xor_dcpl & (~ (fsm_output[6])) & (fsm_output[1]) & (~
      (fsm_output[0]))));
  assign mux_91_nl = MUX_s_1_2_2(or_124_cse, or_tmp_63, fsm_output[3]);
  assign mux_92_nl = MUX_s_1_2_2(mux_91_nl, mux_tmp_85, fsm_output[2]);
  assign mux_93_nl = MUX_s_1_2_2(mux_92_nl, mux_tmp_89, fsm_output[1]);
  assign mux_84_nl = MUX_s_1_2_2(or_tmp_63, or_tmp_60, fsm_output[3]);
  assign mux_86_nl = MUX_s_1_2_2(mux_tmp_85, mux_84_nl, fsm_output[2]);
  assign mux_90_nl = MUX_s_1_2_2(mux_tmp_89, mux_86_nl, fsm_output[1]);
  assign mux_94_itm = MUX_s_1_2_2(mux_93_nl, mux_90_nl, fsm_output[0]);
  assign mux_96_nl = MUX_s_1_2_2(mux_tmp_66, mux_tmp_95, fsm_output[1]);
  assign and_87_rmff = (~ mux_96_nl) & (fsm_output[0]);
  assign mux_103_nl = MUX_s_1_2_2(or_tmp_96, (~ mux_tmp_100), fsm_output[4]);
  assign mux_102_nl = MUX_s_1_2_2(or_tmp_90, or_tmp_96, fsm_output[4]);
  assign mux_104_nl = MUX_s_1_2_2(mux_103_nl, mux_102_nl, fsm_output[2]);
  assign nand_1_nl = ~((fsm_output[4]) & (~ mux_tmp_97));
  assign or_130_nl = (fsm_output[4]) | (~ mux_tmp_100);
  assign mux_101_nl = MUX_s_1_2_2(nand_1_nl, or_130_nl, fsm_output[2]);
  assign mux_105_nl = MUX_s_1_2_2(mux_104_nl, mux_101_nl, fsm_output[5]);
  assign or_128_nl = (fsm_output[4]) | (~ (fsm_output[1])) | (fsm_output[3]);
  assign or_127_nl = (fsm_output[4]) | mux_tmp_97;
  assign mux_98_nl = MUX_s_1_2_2(or_128_nl, or_127_nl, fsm_output[2]);
  assign or_129_nl = (fsm_output[5]) | mux_98_nl;
  assign mux_106_itm = MUX_s_1_2_2(mux_105_nl, or_129_nl, fsm_output[6]);
  assign or_77_cse = (fsm_output[1:0]!=2'b00);
  assign or_75_cse = (fsm_output[3:2]!=2'b00);
  assign or_cse = (fsm_output[3:1]!=3'b000);
  assign and_349_cse = (fsm_output[6:5]==2'b11);
  assign nor_33_cse = ~((fsm_output[4:2]!=3'b000));
  assign mux_130_nl = MUX_s_1_2_2(mux_tmp_64, mux_tmp_59, fsm_output[3]);
  assign mux_131_nl = MUX_s_1_2_2(mux_tmp_60, mux_130_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_help_and_cse = complete_rsci_wen_comp & (~ mux_131_nl)
      & (fsm_output[0]);
  assign mux_63_nl = MUX_s_1_2_2(mux_tmp_62, mux_tmp_60, fsm_output[1]);
  assign VEC_LOOP_nor_cse = ~(mux_63_nl | (fsm_output[0]));
  assign mux_138_nl = MUX_s_1_2_2(mux_tmp_137, mux_tmp_68, fsm_output[1]);
  assign nor_56_ssc = ~(mux_138_nl | (fsm_output[0]));
  assign VEC_LOOP_nand_seb = ~((~ mux_tmp_83) & (fsm_output[0]));
  assign or_251_cse = (fsm_output[2:1]!=2'b01);
  assign nand_24_cse = ~((~((fsm_output[1:0]==2'b11))) & (fsm_output[2]));
  assign nand_20_cse = ~((fsm_output[2:1]==2'b11));
  assign and_116_cse = (fsm_output[1:0]==2'b11);
  assign or_185_cse = (fsm_output[6:5]!=2'b01);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl = MUX_v_10_2_2((z_out[9:0]),
      (z_out_7[9:0]), and_dcpl_44);
  assign nand_26_nl = ~(or_cse & (fsm_output[4]));
  assign nand_27_nl = ~(or_75_cse & (fsm_output[4]));
  assign nor_115_nl = ~((~((fsm_output[3:2]!=2'b10))) | (fsm_output[4]));
  assign mux_34_nl = MUX_s_1_2_2(nand_27_nl, nor_115_nl, fsm_output[1]);
  assign mux_160_nl = MUX_s_1_2_2(nand_26_nl, mux_34_nl, fsm_output[0]);
  assign and_110_nl = mux_160_nl & (fsm_output[6:5]==2'b01);
  assign VEC_LOOP_VEC_LOOP_mux_1_rgt = MUX_v_11_2_2(z_out_9, ({1'b0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_nl}),
      and_110_nl);
  assign and_344_cse = (fsm_output[0]) & (fsm_output[3]) & (fsm_output[1]);
  assign nor_111_cse = ~((fsm_output[1:0]!=2'b00));
  assign or_124_cse = (fsm_output[6:4]!=3'b101);
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ z_out_2)}) + 5'b01101;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign or_203_cse = (fsm_output[6:5]!=2'b00);
  assign or_tmp_13 = (fsm_output[5:4]!=2'b00);
  assign nor_tmp = (fsm_output[5:4]==2'b11);
  assign nor_tmp_13 = or_tmp_13 & (fsm_output[6]);
  assign or_dcpl_30 = (fsm_output[3]) | (fsm_output[1]) | (fsm_output[0]);
  assign or_tmp_53 = (fsm_output[0]) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign or_tmp_54 = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[5]);
  assign or_tmp_55 = (fsm_output[6:5]!=2'b10);
  assign or_tmp_59 = (fsm_output[6:4]!=3'b000);
  assign or_tmp_60 = (fsm_output[6:4]!=3'b100);
  assign mux_tmp_58 = MUX_s_1_2_2(or_tmp_60, or_tmp_59, fsm_output[2]);
  assign or_tmp_61 = (fsm_output[6]) | (~ nor_tmp);
  assign or_tmp_63 = (fsm_output[6:4]!=3'b010);
  assign mux_tmp_59 = MUX_s_1_2_2(or_tmp_63, or_tmp_61, fsm_output[2]);
  assign mux_tmp_60 = MUX_s_1_2_2(mux_tmp_59, mux_tmp_58, fsm_output[3]);
  assign or_tmp_64 = (fsm_output[6:4]!=3'b001);
  assign mux_tmp_61 = MUX_s_1_2_2(or_tmp_64, or_tmp_63, fsm_output[2]);
  assign mux_tmp_62 = MUX_s_1_2_2(mux_tmp_58, mux_tmp_61, fsm_output[3]);
  assign and_dcpl_14 = ~((fsm_output[3]) | (fsm_output[1]));
  assign and_dcpl_15 = and_dcpl_14 & (~ (fsm_output[0]));
  assign and_dcpl_16 = (~ (fsm_output[6])) & (fsm_output[2]);
  assign and_dcpl_17 = ~((fsm_output[5:4]!=2'b00));
  assign and_dcpl_18 = and_dcpl_17 & and_dcpl_16;
  assign and_dcpl_19 = and_dcpl_18 & and_dcpl_15;
  assign and_dcpl_21 = (fsm_output[3]) & (fsm_output[1]) & (~ (fsm_output[0]));
  assign and_dcpl_22 = ~((fsm_output[6]) | (fsm_output[2]));
  assign and_dcpl_23 = and_dcpl_17 & and_dcpl_22;
  assign mux_tmp_64 = MUX_s_1_2_2(or_tmp_59, or_tmp_64, fsm_output[2]);
  assign mux_tmp_65 = MUX_s_1_2_2(or_tmp_61, or_tmp_60, fsm_output[2]);
  assign mux_tmp_66 = MUX_s_1_2_2(mux_tmp_65, mux_tmp_64, fsm_output[3]);
  assign mux_67_nl = MUX_s_1_2_2(or_124_cse, or_tmp_64, fsm_output[2]);
  assign mux_tmp_68 = MUX_s_1_2_2(mux_67_nl, mux_tmp_59, fsm_output[3]);
  assign mux_69_itm = MUX_s_1_2_2(mux_tmp_68, mux_tmp_66, fsm_output[1]);
  assign and_dcpl_25 = (~ mux_69_itm) & (fsm_output[0]);
  assign and_dcpl_26 = and_dcpl_18 & and_dcpl_21;
  assign and_dcpl_28 = (~ mux_tmp_68) & nor_111_cse;
  assign and_dcpl_30 = (fsm_output[3]) & (~ (fsm_output[1])) & (~ (fsm_output[0]));
  assign and_dcpl_31 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_33 = and_dcpl_31 & and_dcpl_22 & and_dcpl_30;
  assign nor_35_nl = ~((~ (fsm_output[6])) | (fsm_output[4]));
  assign nor_36_nl = ~((fsm_output[6]) | (~ (fsm_output[4])));
  assign mux_70_nl = MUX_s_1_2_2(nor_35_nl, nor_36_nl, fsm_output[3]);
  assign and_dcpl_37 = mux_70_nl & (~ (fsm_output[5])) & (fsm_output[2]) & (fsm_output[1])
      & (~ (fsm_output[0]));
  assign and_dcpl_38 = (~ (fsm_output[3])) & (fsm_output[1]);
  assign and_dcpl_39 = and_dcpl_38 & (~ (fsm_output[0]));
  assign and_dcpl_40 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_41 = and_dcpl_40 & and_dcpl_22;
  assign and_dcpl_42 = and_dcpl_41 & and_dcpl_39;
  assign and_dcpl_44 = and_dcpl_40 & and_dcpl_16 & and_dcpl_30;
  assign and_dcpl_46 = nor_tmp & and_dcpl_22 & and_dcpl_39;
  assign and_dcpl_47 = nor_tmp & and_dcpl_16;
  assign and_dcpl_48 = and_dcpl_47 & and_dcpl_39;
  assign and_dcpl_49 = (fsm_output[6]) & (~ (fsm_output[2]));
  assign and_dcpl_50 = and_dcpl_17 & and_dcpl_49;
  assign and_dcpl_51 = and_dcpl_50 & and_dcpl_15;
  assign and_dcpl_52 = and_dcpl_50 & and_dcpl_21;
  assign and_dcpl_53 = ~((fsm_output[4]) | (fsm_output[6]));
  assign or_104_nl = (fsm_output[3:2]!=2'b01);
  assign or_103_nl = (fsm_output[3:2]!=2'b10);
  assign mux_71_nl = MUX_s_1_2_2(or_104_nl, or_103_nl, fsm_output[1]);
  assign and_dcpl_56 = ~(mux_71_nl | (fsm_output[5]) | (~ and_dcpl_53) | (fsm_output[0]));
  assign or_tmp_70 = (fsm_output[2]) | (~ (fsm_output[6])) | (fsm_output[4]) | (fsm_output[5]);
  assign mux_tmp_72 = MUX_s_1_2_2(or_tmp_70, mux_tmp_61, fsm_output[3]);
  assign or_tmp_73 = (~ (fsm_output[2])) | (fsm_output[6]) | (~ (fsm_output[4]))
      | (fsm_output[5]);
  assign or_tmp_74 = (~ (fsm_output[2])) | (~ (VEC_LOOP_j_2_12_0_sva_1[12])) | (fsm_output[6]);
  assign or_110_nl = (fsm_output[2]) | (~ (VEC_LOOP_j_2_12_0_sva_1[12])) | (fsm_output[6]);
  assign mux_76_nl = MUX_s_1_2_2(or_110_nl, or_tmp_74, fsm_output[4]);
  assign nand_tmp = ~((fsm_output[5]) & (~ mux_76_nl));
  assign mux_82_nl = MUX_s_1_2_2(or_tmp_73, mux_tmp_59, fsm_output[3]);
  assign mux_tmp_83 = MUX_s_1_2_2(mux_tmp_60, mux_82_nl, fsm_output[1]);
  assign and_dcpl_61 = and_dcpl_18 & and_dcpl_30;
  assign and_dcpl_65 = and_dcpl_41 & and_dcpl_21;
  assign and_dcpl_81 = and_dcpl_31 & (fsm_output[6]) & (fsm_output[2]);
  assign and_dcpl_84 = and_dcpl_81 & and_dcpl_14 & (fsm_output[0]);
  assign or_tmp_85 = (fsm_output[6:4]!=3'b011);
  assign mux_tmp_85 = MUX_s_1_2_2(or_tmp_64, or_tmp_85, fsm_output[3]);
  assign mux_88_nl = MUX_s_1_2_2(or_tmp_85, or_tmp_59, fsm_output[3]);
  assign mux_87_nl = MUX_s_1_2_2(or_tmp_60, or_tmp_64, fsm_output[3]);
  assign mux_tmp_89 = MUX_s_1_2_2(mux_88_nl, mux_87_nl, fsm_output[2]);
  assign mux_tmp_95 = MUX_s_1_2_2(mux_tmp_61, mux_tmp_65, fsm_output[3]);
  assign or_tmp_89 = (fsm_output[1]) | (~ (fsm_output[3]));
  assign or_tmp_90 = (~ (fsm_output[1])) | (fsm_output[3]);
  assign mux_tmp_97 = MUX_s_1_2_2((~ or_tmp_90), or_tmp_89, fsm_output[0]);
  assign mux_99_nl = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[1]);
  assign mux_tmp_100 = MUX_s_1_2_2(or_tmp_89, mux_99_nl, fsm_output[0]);
  assign or_tmp_96 = (fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[3]));
  assign mux_tmp_109 = MUX_s_1_2_2(and_349_cse, nor_tmp_13, or_75_cse);
  assign mux_tmp_110 = MUX_s_1_2_2(and_dcpl_17, (fsm_output[5]), fsm_output[6]);
  assign mux_114_nl = MUX_s_1_2_2(mux_tmp_110, nor_tmp_13, or_75_cse);
  assign mux_tmp_115 = MUX_s_1_2_2(mux_114_nl, mux_tmp_109, fsm_output[1]);
  assign mux_tmp_137 = MUX_s_1_2_2(mux_tmp_59, or_tmp_70, fsm_output[3]);
  assign mux_148_nl = MUX_s_1_2_2(mux_tmp_72, mux_tmp_137, fsm_output[1]);
  assign and_dcpl_104 = (~ mux_148_nl) & (fsm_output[0]);
  assign or_tmp_127 = (fsm_output[6]) | and_dcpl_17;
  assign mux_tmp_150 = MUX_s_1_2_2(and_dcpl_17, or_tmp_13, fsm_output[6]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_81 & and_dcpl_15;
  assign VEC_LOOP_j_1_sva_mx0c0 = and_dcpl_23 & and_dcpl_38 & (fsm_output[0]);
  assign xor_dcpl = ~((fsm_output[5]) ^ (fsm_output[3]));
  assign VEC_LOOP_or_11_cse = and_dcpl_19 | and_dcpl_26;
  assign VEC_LOOP_or_12_cse = and_dcpl_33 | and_dcpl_51;
  assign VEC_LOOP_or_13_cse = and_dcpl_42 | and_dcpl_48 | and_dcpl_52;
  assign VEC_LOOP_or_19_cse = and_dcpl_33 | and_dcpl_42 | and_dcpl_44 | and_dcpl_48
      | and_dcpl_51 | and_dcpl_52;
  assign VEC_LOOP_mux1h_6_nl = MUX1HOT_v_10_4_2((z_out_5[11:2]), (z_out_9[10:1]),
      (z_out_7[11:2]), (z_out_7[9:0]), {VEC_LOOP_or_11_cse , VEC_LOOP_or_12_cse ,
      VEC_LOOP_or_13_cse , and_dcpl_44});
  assign VEC_LOOP_mux1h_4_nl = MUX1HOT_s_1_4_2((z_out_5[1]), (z_out_9[0]), (z_out_7[1]),
      (reg_VEC_LOOP_acc_1_1_reg[1]), {VEC_LOOP_or_11_cse , VEC_LOOP_or_12_cse , VEC_LOOP_or_13_cse
      , and_dcpl_44});
  assign and_59_nl = (~ mux_tmp_72) & nor_111_cse;
  assign VEC_LOOP_mux1h_2_nl = MUX1HOT_s_1_3_2((z_out_5[0]), (reg_VEC_LOOP_acc_1_1_reg[0]),
      (z_out_7[0]), {VEC_LOOP_or_11_cse , and_59_nl , VEC_LOOP_or_13_cse});
  assign and_26_nl = and_dcpl_23 & and_dcpl_21;
  assign VEC_LOOP_mux1h_nl = MUX1HOT_v_9_8_2((z_out_7[8:0]), reg_VEC_LOOP_acc_1_1_reg,
      (VEC_LOOP_acc_10_cse_1_sva[11:3]), (z_out_7[11:3]), ({reg_VEC_LOOP_acc_1_reg
      , (reg_VEC_LOOP_acc_1_1_reg[8:3])}), (z_out_5[11:3]), ({VEC_LOOP_acc_11_psp_sva_10
      , (VEC_LOOP_acc_11_psp_sva_9_0[9:2])}), (VEC_LOOP_acc_11_psp_sva_9_0[9:1]),
      {and_dcpl_19 , and_26_nl , and_dcpl_25 , and_dcpl_26 , and_dcpl_28 , VEC_LOOP_or_19_cse
      , and_dcpl_37 , and_dcpl_46});
  assign VEC_LOOP_mux1h_1_nl = MUX1HOT_s_1_7_2((VEC_LOOP_j_1_sva[2]), (VEC_LOOP_acc_10_cse_1_sva[2]),
      (z_out_7[2]), (reg_VEC_LOOP_acc_1_1_reg[2]), (z_out_5[2]), (VEC_LOOP_acc_11_psp_sva_9_0[1]),
      (VEC_LOOP_acc_11_psp_sva_9_0[0]), {and_dcpl_56 , and_dcpl_25 , and_dcpl_26
      , and_dcpl_28 , VEC_LOOP_or_19_cse , and_dcpl_37 , and_dcpl_46});
  assign or_107_nl = (fsm_output[3]) | (fsm_output[2]) | (fsm_output[6]) | (~ nor_tmp);
  assign mux_73_nl = MUX_s_1_2_2(mux_tmp_68, or_107_nl, fsm_output[1]);
  assign nor_60_nl = ~(mux_73_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_3_nl = MUX1HOT_s_1_6_2((VEC_LOOP_j_1_sva[1]), (VEC_LOOP_acc_10_cse_1_sva[1]),
      (z_out_7[1]), (reg_VEC_LOOP_acc_1_1_reg[1]), (z_out_5[1]), (VEC_LOOP_acc_11_psp_sva_9_0[0]),
      {and_dcpl_56 , and_dcpl_25 , and_dcpl_26 , nor_60_nl , VEC_LOOP_or_19_cse ,
      and_dcpl_37});
  assign mux_74_nl = MUX_s_1_2_2(mux_tmp_65, or_tmp_73, fsm_output[3]);
  assign mux_75_nl = MUX_s_1_2_2(mux_tmp_68, mux_74_nl, fsm_output[1]);
  assign nor_59_nl = ~(mux_75_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_5_nl = MUX1HOT_s_1_5_2((VEC_LOOP_j_1_sva[0]), (VEC_LOOP_acc_10_cse_1_sva[0]),
      (z_out_7[0]), (reg_VEC_LOOP_acc_1_1_reg[0]), (z_out_5[0]), {and_dcpl_56 , and_dcpl_25
      , and_dcpl_26 , nor_59_nl , VEC_LOOP_or_19_cse});
  assign vec_rsci_adra_d = {VEC_LOOP_mux1h_6_nl , VEC_LOOP_mux1h_4_nl , VEC_LOOP_mux1h_2_nl
      , VEC_LOOP_mux1h_nl , VEC_LOOP_mux1h_1_nl , VEC_LOOP_mux1h_3_nl , VEC_LOOP_mux1h_5_nl};
  assign vec_rsci_wea_d = vec_rsci_wea_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_da_d = vec_rsci_da_d_reg;
  assign twiddle_rsci_adra_d = twiddle_rsci_adra_d_reg;
  assign twiddle_h_rsci_adra_d = twiddle_h_rsci_adra_d_reg;
  assign and_dcpl_112 = ~((fsm_output[2]) | (fsm_output[4]));
  assign and_dcpl_127 = and_dcpl_47 & and_344_cse;
  assign and_dcpl_130 = and_dcpl_47 & (~ (fsm_output[3])) & (~ (fsm_output[1])) &
      (fsm_output[0]);
  assign and_dcpl_134 = (~ (fsm_output[4])) & (fsm_output[5]) & (~ (fsm_output[6]))
      & (~ (fsm_output[2])) & and_344_cse;
  assign and_dcpl_139 = (fsm_output[5:4]==2'b01) & and_dcpl_16 & (~ (fsm_output[3]))
      & (fsm_output[1]) & (fsm_output[0]);
  assign and_dcpl_144 = (fsm_output[5:4]==2'b00) & and_dcpl_16 & (fsm_output[3])
      & (~ (fsm_output[1])) & (fsm_output[0]);
  assign and_dcpl_156 = ~((fsm_output!=7'b0000010));
  assign and_dcpl_168 = (fsm_output==7'b1010011);
  assign or_214_nl = (fsm_output[6:4]!=3'b011);
  assign mux_tmp_177 = MUX_s_1_2_2(or_214_nl, or_tmp_60, fsm_output[2]);
  assign mux_181_nl = MUX_s_1_2_2(mux_tmp_177, mux_tmp_64, fsm_output[3]);
  assign mux_179_nl = MUX_s_1_2_2(mux_tmp_61, mux_tmp_177, fsm_output[3]);
  assign mux_182_nl = MUX_s_1_2_2(mux_181_nl, mux_179_nl, fsm_output[1]);
  assign and_dcpl_175 = (~ mux_182_nl) & (fsm_output[0]);
  assign and_dcpl_177 = ~((fsm_output[3]) | (fsm_output[1]) | (fsm_output[0]));
  assign and_dcpl_192 = (~ (fsm_output[3])) & (fsm_output[1]) & (~ (fsm_output[0]));
  assign and_228_cse = (fsm_output[5:4]==2'b11) & and_dcpl_16 & and_dcpl_192;
  assign and_dcpl_202 = and_dcpl_17 & (fsm_output[6]) & (~ (fsm_output[2]));
  assign and_232_cse = and_dcpl_202 & and_dcpl_21;
  assign and_dcpl_210 = and_dcpl_18 & and_dcpl_177;
  assign and_dcpl_224 = and_dcpl_40 & and_dcpl_22 & and_dcpl_39;
  assign and_dcpl_229 = (fsm_output[5:4]==2'b11) & and_dcpl_16 & and_dcpl_39;
  assign and_dcpl_232 = and_dcpl_50 & and_dcpl_177;
  assign and_dcpl_236 = and_dcpl_31 & and_dcpl_49 & and_dcpl_38 & (fsm_output[0]);
  assign and_dcpl_242 = ~((~ and_dcpl_18) | (fsm_output[3]) | (fsm_output[1]) | (fsm_output[0]));
  assign and_dcpl_243 = (fsm_output[3]) & (~ (fsm_output[1]));
  assign and_dcpl_247 = and_dcpl_40 & and_dcpl_16 & and_dcpl_243 & (~ (fsm_output[0]));
  assign and_dcpl_255 = and_dcpl_40 & (~ (fsm_output[6])) & (~ (fsm_output[2])) &
      and_dcpl_192;
  assign and_dcpl_263 = and_dcpl_202 & and_dcpl_243 & (fsm_output[0]);
  assign and_dcpl_269 = and_dcpl_17 & and_dcpl_16 & and_dcpl_30;
  assign and_dcpl_274 = (fsm_output[5:4]==2'b01) & and_dcpl_16 & (~ (fsm_output[3]))
      & (fsm_output[1]) & (~ (fsm_output[0]));
  assign and_dcpl_279 = ~((~ (fsm_output[5])) | (fsm_output[4]) | (fsm_output[6])
      | (fsm_output[2]));
  assign and_dcpl_280 = and_dcpl_279 & and_dcpl_177;
  assign and_dcpl_283 = and_dcpl_279 & and_dcpl_21;
  assign and_dcpl_285 = (fsm_output[5:4]==2'b11) & and_dcpl_16;
  assign and_dcpl_286 = and_dcpl_285 & and_dcpl_177;
  assign and_dcpl_287 = and_dcpl_285 & and_dcpl_21;
  assign and_dcpl_290 = and_dcpl_17 & (fsm_output[6]) & (~ (fsm_output[2])) & and_dcpl_30;
  assign and_dcpl_296 = (fsm_output[5:4]==2'b01) & and_dcpl_22 & (fsm_output[3])
      & (~ (fsm_output[1])) & (~ (fsm_output[0]));
  assign and_dcpl_302 = (~ (fsm_output[4])) & (~ (fsm_output[5])) & (fsm_output[6])
      & (~ (fsm_output[2])) & and_dcpl_14 & (~ (fsm_output[0]));
  assign and_dcpl_306 = (fsm_output[5:4]==2'b10) & and_dcpl_22 & and_dcpl_14 & (fsm_output[0]);
  assign VEC_LOOP_or_29_ssc = and_dcpl_242 | and_dcpl_263;
  assign COMP_LOOP_twiddle_f_or_ssc = and_dcpl_280 | and_dcpl_286 | and_dcpl_290;
  assign mux_tmp = MUX_s_1_2_2((~ or_tmp_13), (fsm_output[5]), fsm_output[6]);
  assign or_tmp_154 = and_116_cse | (fsm_output[2]);
  assign or_tmp_160 = (fsm_output[0]) | (~ (fsm_output[2]));
  assign VEC_LOOP_or_7_ssc = and_dcpl_26 | and_dcpl_255 | and_228_cse | and_232_cse;
  assign VEC_LOOP_or_32_itm = and_dcpl_127 | and_dcpl_130 | and_dcpl_134 | and_dcpl_139
      | and_dcpl_144;
  assign VEC_LOOP_or_24_itm = (and_dcpl_17 & and_dcpl_16 & and_dcpl_21) | ((fsm_output[5:4]==2'b01)
      & and_dcpl_22 & and_dcpl_30) | (and_dcpl_40 & and_dcpl_22 & and_dcpl_192) |
      and_dcpl_44 | and_228_cse | (and_dcpl_202 & and_dcpl_177) | and_232_cse;
  assign VEC_LOOP_or_34_itm = and_dcpl_26 | and_dcpl_33 | and_dcpl_224 | and_dcpl_44
      | and_dcpl_229 | and_dcpl_232 | and_dcpl_52;
  assign COMP_LOOP_twiddle_f_nor_1_itm = ~(and_dcpl_274 | and_dcpl_283 | and_dcpl_287);
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      VEC_LOOP_mult_vec_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[63:32]), (vec_rsci_qa_d_mxwt[31:0]),
          and_dcpl_104);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_2_cse <= 1'b0;
    end
    else if ( complete_rsci_wen_comp ) begin
      reg_run_rsci_oswt_cse <= ~(or_tmp_13 | (fsm_output[6]) | (fsm_output[2]) |
          or_dcpl_30);
      reg_vec_rsci_oswt_cse <= ~ mux_57_itm;
      reg_vec_rsci_oswt_1_cse <= VEC_LOOP_nor_cse;
      reg_twiddle_rsci_oswt_cse <= nor_58_rmff;
      reg_complete_rsci_oswt_cse <= and_dcpl_81 & and_dcpl_14 & (~ (fsm_output[0]))
          & STAGE_LOOP_acc_itm_4_1;
      reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_84;
      reg_ensig_cgo_cse <= ~ mux_94_itm;
      reg_ensig_cgo_2_cse <= ~ mux_106_itm;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_23 & and_dcpl_15) | STAGE_LOOP_i_3_0_sva_mx0c1)
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, z_out_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_113_nl ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_tmp_115 ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( mux_189_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_12_3_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (z_out_6[8:0]), COMP_LOOP_k_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(mux_120_nl & (~ (fsm_output[6])))) ) begin
      COMP_LOOP_1_twiddle_f_acc_cse_sva <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (VEC_LOOP_j_1_sva_mx0c0 | (~(mux_69_itm | (fsm_output[0])))
        | and_dcpl_61) ) begin
      VEC_LOOP_j_1_sva <= MUX_v_32_2_2(32'b00000000000000000000000000000000, VEC_LOOP_mux_2_nl,
          VEC_LOOP_j_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_cse ) begin
      COMP_LOOP_twiddle_help_1_sva <= twiddle_h_rsci_qa_d_mxwt;
      COMP_LOOP_twiddle_f_1_sva <= twiddle_rsci_qa_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (and_dcpl_19 | and_dcpl_84) ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= MUX_s_1_2_2((z_out_3_20_12[8]),
          run_rsci_ivld_mxwt, and_dcpl_84);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_19 | and_dcpl_26 | and_dcpl_33 | and_dcpl_42
        | and_dcpl_44 | and_dcpl_48 | and_dcpl_51 | and_dcpl_52) ) begin
      VEC_LOOP_acc_10_cse_1_sva <= z_out_5;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(or_tmp_13 | (fsm_output[6]) | (~ (fsm_output[2]))
        | or_dcpl_30)) ) begin
      VEC_LOOP_j_1_sva_1 <= z_out_4;
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_197_nl) & complete_rsci_wen_comp ) begin
      reg_VEC_LOOP_acc_1_reg <= MUX_v_3_2_2(3'b000, VEC_LOOP_VEC_LOOP_mux_8_nl, VEC_LOOP_nand_seb);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_206_nl) & complete_rsci_wen_comp ) begin
      reg_VEC_LOOP_acc_1_1_reg <= MUX_v_9_2_2(9'b000000000, VEC_LOOP_VEC_LOOP_mux_9_nl,
          VEC_LOOP_nand_seb);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_17 & (~((fsm_output[1]) ^ (fsm_output[3])))
        & and_dcpl_16 & (fsm_output[0])) | and_dcpl_104) ) begin
      factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[31:0]), (vec_rsci_qa_d_mxwt[63:32]),
          and_dcpl_104);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_153_nl ) begin
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_2_12_0_sva_1 <= 13'b0000000000000;
    end
    else if ( complete_rsci_wen_comp & (~(mux_154_nl | (fsm_output[0]))) ) begin
      VEC_LOOP_j_2_12_0_sva_1 <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_158_nl | (fsm_output[6])) ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_210_nl & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_10 <= VEC_LOOP_VEC_LOOP_mux_1_rgt[10];
    end
  end
  always @(posedge clk) begin
    if ( mux_213_nl & nor_111_cse & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_9_0 <= VEC_LOOP_VEC_LOOP_mux_1_rgt[9:0];
    end
  end
  assign mux_111_nl = MUX_s_1_2_2(mux_tmp_110, and_349_cse, fsm_output[2]);
  assign mux_112_nl = MUX_s_1_2_2(mux_111_nl, nor_tmp_13, fsm_output[3]);
  assign mux_113_nl = MUX_s_1_2_2(mux_112_nl, mux_tmp_109, or_77_cse);
  assign COMP_LOOP_k_not_nl = ~ mux_tmp_115;
  assign mux_186_nl = MUX_s_1_2_2(mux_tmp, nor_tmp_13, fsm_output[2]);
  assign mux_185_nl = MUX_s_1_2_2(and_349_cse, nor_tmp_13, fsm_output[2]);
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, mux_185_nl, fsm_output[1]);
  assign mux_188_nl = MUX_s_1_2_2(mux_187_nl, nor_tmp_13, fsm_output[3]);
  assign mux_184_nl = MUX_s_1_2_2(mux_tmp, nor_tmp_13, or_cse);
  assign mux_189_nl = MUX_s_1_2_2(mux_188_nl, mux_184_nl, fsm_output[0]);
  assign or_143_nl = (fsm_output[4:2]!=3'b000);
  assign mux_118_nl = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), or_143_nl);
  assign nor_54_nl = ~(nor_33_cse | (fsm_output[5]));
  assign mux_119_nl = MUX_s_1_2_2(mux_118_nl, nor_54_nl, fsm_output[1]);
  assign nor_55_nl = ~((~((fsm_output[4:1]!=4'b0000))) | (fsm_output[5]));
  assign mux_120_nl = MUX_s_1_2_2(mux_119_nl, nor_55_nl, fsm_output[0]);
  assign VEC_LOOP_mux_2_nl = MUX_v_32_2_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      VEC_LOOP_j_1_sva_1, and_dcpl_61);
  assign VEC_LOOP_j_not_1_nl = ~ VEC_LOOP_j_1_sva_mx0c0;
  assign VEC_LOOP_VEC_LOOP_mux_8_nl = MUX_v_3_2_2((z_out_7[11:9]), (VEC_LOOP_j_2_12_0_sva_1[11:9]),
      nor_56_ssc);
  assign nand_19_nl = ~(((~ (fsm_output[4])) | (fsm_output[1])) & (fsm_output[2]));
  assign mux_194_nl = MUX_s_1_2_2((~ or_tmp_160), or_tmp_160, fsm_output[1]);
  assign or_250_nl = (fsm_output[4]) | mux_194_nl;
  assign mux_195_nl = MUX_s_1_2_2(nand_19_nl, or_250_nl, fsm_output[3]);
  assign mux_192_nl = MUX_s_1_2_2(or_tmp_154, nand_24_cse, fsm_output[4]);
  assign mux_191_nl = MUX_s_1_2_2(or_251_cse, nand_20_cse, fsm_output[4]);
  assign mux_193_nl = MUX_s_1_2_2(mux_192_nl, mux_191_nl, fsm_output[3]);
  assign mux_196_nl = MUX_s_1_2_2(mux_195_nl, mux_193_nl, fsm_output[5]);
  assign or_223_nl = (~ (fsm_output[4])) | (~ (fsm_output[1])) | (fsm_output[0])
      | (fsm_output[2]);
  assign or_222_nl = (fsm_output[4]) | or_tmp_154;
  assign mux_190_nl = MUX_s_1_2_2(or_223_nl, or_222_nl, fsm_output[3]);
  assign or_224_nl = (fsm_output[5]) | mux_190_nl;
  assign mux_197_nl = MUX_s_1_2_2(mux_196_nl, or_224_nl, fsm_output[6]);
  assign VEC_LOOP_VEC_LOOP_mux_9_nl = MUX_v_9_2_2((z_out_7[8:0]), (VEC_LOOP_j_2_12_0_sva_1[8:0]),
      nor_56_ssc);
  assign or_238_nl = (fsm_output[2:0]!=3'b100);
  assign mux_204_nl = MUX_s_1_2_2(or_238_nl, or_tmp_154, fsm_output[5]);
  assign or_239_nl = (fsm_output[6]) | mux_204_nl;
  assign or_236_nl = (fsm_output[2:1]!=2'b10);
  assign mux_201_nl = MUX_s_1_2_2(nand_20_cse, or_236_nl, fsm_output[0]);
  assign mux_202_nl = MUX_s_1_2_2(mux_201_nl, or_251_cse, fsm_output[5]);
  assign or_234_nl = (fsm_output[5]) | or_tmp_154;
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, or_234_nl, fsm_output[6]);
  assign mux_205_nl = MUX_s_1_2_2(or_239_nl, mux_203_nl, fsm_output[3]);
  assign mux_198_nl = MUX_s_1_2_2(nand_20_cse, nand_24_cse, fsm_output[5]);
  assign or_231_nl = (fsm_output[5]) | (fsm_output[0]) | (~ (fsm_output[1])) | (fsm_output[2]);
  assign mux_199_nl = MUX_s_1_2_2(mux_198_nl, or_231_nl, fsm_output[6]);
  assign or_230_nl = (fsm_output[6]) | (~((fsm_output[5]) & (fsm_output[1]) & (fsm_output[2])));
  assign mux_200_nl = MUX_s_1_2_2(mux_199_nl, or_230_nl, fsm_output[3]);
  assign mux_206_nl = MUX_s_1_2_2(mux_205_nl, mux_200_nl, fsm_output[4]);
  assign and_117_nl = (fsm_output[3:2]==2'b11);
  assign mux_152_nl = MUX_s_1_2_2(mux_tmp_150, or_tmp_127, and_117_nl);
  assign mux_149_nl = MUX_s_1_2_2(or_tmp_127, (fsm_output[6]), fsm_output[2]);
  assign mux_151_nl = MUX_s_1_2_2(mux_tmp_150, mux_149_nl, fsm_output[3]);
  assign mux_153_nl = MUX_s_1_2_2(mux_152_nl, mux_151_nl, or_77_cse);
  assign mux_154_nl = MUX_s_1_2_2(mux_tmp_72, mux_tmp_60, fsm_output[1]);
  assign nor_31_nl = ~(((fsm_output[4:3]==2'b11)) | (fsm_output[5]));
  assign nor_32_nl = ~(((fsm_output[2]) & (fsm_output[4])) | (fsm_output[5]));
  assign mux_155_nl = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[4]);
  assign mux_156_nl = MUX_s_1_2_2(and_dcpl_17, mux_155_nl, fsm_output[2]);
  assign mux_157_nl = MUX_s_1_2_2(nor_32_nl, mux_156_nl, fsm_output[3]);
  assign mux_158_nl = MUX_s_1_2_2(nor_31_nl, mux_157_nl, and_116_cse);
  assign nor_112_nl = ~((fsm_output[4:0]!=5'b11000));
  assign nor_113_nl = ~((fsm_output[4:0]!=5'b00000));
  assign mux_209_nl = MUX_s_1_2_2(nor_112_nl, nor_113_nl, fsm_output[6]);
  assign or_240_nl = (fsm_output[3]) | (fsm_output[1]);
  assign mux_207_nl = MUX_s_1_2_2(and_344_cse, or_240_nl, fsm_output[4]);
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, (fsm_output[4]), fsm_output[2]);
  assign nor_114_nl = ~((fsm_output[6]) | mux_208_nl);
  assign mux_210_nl = MUX_s_1_2_2(mux_209_nl, nor_114_nl, fsm_output[5]);
  assign nor_108_nl = ~((fsm_output[4:2]!=3'b110));
  assign mux_212_nl = MUX_s_1_2_2(nor_108_nl, nor_33_cse, fsm_output[6]);
  assign or_245_nl = (fsm_output[4:3]!=2'b00);
  assign or_244_nl = (fsm_output[4:3]!=2'b01);
  assign mux_211_nl = MUX_s_1_2_2(or_245_nl, or_244_nl, fsm_output[2]);
  assign nor_110_nl = ~((fsm_output[6]) | mux_211_nl);
  assign mux_213_nl = MUX_s_1_2_2(mux_212_nl, nor_110_nl, fsm_output[5]);
  assign VEC_LOOP_VEC_LOOP_or_9_nl = (STAGE_LOOP_lshift_psp_sva[12]) | and_dcpl_127
      | and_dcpl_130 | and_dcpl_134 | and_dcpl_139 | and_dcpl_144;
  assign VEC_LOOP_VEC_LOOP_mux_10_nl = MUX_v_12_2_2((STAGE_LOOP_lshift_psp_sva[11:0]),
      (~ (STAGE_LOOP_lshift_psp_sva[12:1])), VEC_LOOP_or_32_itm);
  assign mux_214_nl = MUX_s_1_2_2(mux_tmp_72, mux_tmp_60, fsm_output[1]);
  assign VEC_LOOP_or_37_nl = mux_214_nl | (fsm_output[0]) | and_dcpl_127 | and_dcpl_130
      | and_dcpl_134 | and_dcpl_139 | and_dcpl_144;
  assign VEC_LOOP_VEC_LOOP_mux_11_nl = MUX_v_9_2_2(({reg_VEC_LOOP_acc_1_reg , (reg_VEC_LOOP_acc_1_1_reg[8:3])}),
      COMP_LOOP_k_12_3_sva_8_0, VEC_LOOP_or_32_itm);
  assign VEC_LOOP_VEC_LOOP_or_10_nl = ((reg_VEC_LOOP_acc_1_1_reg[2]) & (~(and_dcpl_139
      | and_dcpl_144))) | and_dcpl_127 | and_dcpl_130 | and_dcpl_134;
  assign VEC_LOOP_VEC_LOOP_or_11_nl = ((reg_VEC_LOOP_acc_1_1_reg[1]) & (~(and_dcpl_130
      | and_dcpl_134 | and_dcpl_144))) | and_dcpl_127 | and_dcpl_139;
  assign VEC_LOOP_VEC_LOOP_or_12_nl = ((reg_VEC_LOOP_acc_1_1_reg[0]) & (~(and_dcpl_127
      | and_dcpl_134 | and_dcpl_139))) | and_dcpl_130 | and_dcpl_144;
  assign nl_acc_nl = ({VEC_LOOP_VEC_LOOP_or_9_nl , VEC_LOOP_VEC_LOOP_mux_10_nl ,
      VEC_LOOP_or_37_nl}) + conv_u2u_13_14({VEC_LOOP_VEC_LOOP_mux_11_nl , VEC_LOOP_VEC_LOOP_or_10_nl
      , VEC_LOOP_VEC_LOOP_or_11_nl , VEC_LOOP_VEC_LOOP_or_12_nl , 1'b1});
  assign acc_nl = nl_acc_nl[13:0];
  assign z_out_1 = readslicef_14_13_1(acc_nl);
  assign STAGE_LOOP_mux_3_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_dcpl_156);
  assign nl_z_out_2 = STAGE_LOOP_mux_3_nl + conv_s2u_3_4({and_dcpl_156 , 2'b01});
  assign z_out_2 = nl_z_out_2[3:0];
  assign nand_28_cse = ~(and_dcpl_17 & (~ (fsm_output[6])) & (fsm_output[2]) & and_dcpl_177);
  assign VEC_LOOP_mux_9_nl = MUX_v_20_2_2((z_out_4[31:12]), ({7'b0000000 , (z_out_6[9:0])
      , 3'b000}), and_dcpl_168);
  assign VEC_LOOP_or_38_nl = nand_28_cse | and_dcpl_168;
  assign VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl = ~(MUX_v_12_2_2(12'b000000000000,
      (STAGE_LOOP_lshift_psp_sva[12:1]), and_dcpl_168));
  assign nl_acc_2_nl = conv_u2u_21_22({VEC_LOOP_mux_9_nl , VEC_LOOP_or_38_nl}) +
      conv_s2u_14_22({1'b1 , VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[21:0];
  assign z_out_3_20_12 = readslicef_22_9_13(acc_2_nl);
  assign VEC_LOOP_mux_10_nl = MUX_v_32_2_2(VEC_LOOP_j_1_sva, factor1_1_sva, and_dcpl_175);
  assign VEC_LOOP_or_39_nl = nand_28_cse | and_dcpl_175;
  assign VEC_LOOP_mux_11_nl = MUX_v_32_2_2(({19'b0000000000000000000 , STAGE_LOOP_lshift_psp_sva}),
      (~ COMP_LOOP_1_mult_cmp_return_rsc_z), and_dcpl_175);
  assign nl_acc_3_nl = ({VEC_LOOP_mux_10_nl , VEC_LOOP_or_39_nl}) + ({VEC_LOOP_mux_11_nl
      , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_4 = readslicef_33_32_1(acc_3_nl);
  assign VEC_LOOP_VEC_LOOP_mux_12_nl = MUX_v_12_2_2(({(z_out_6[8:0]) , (STAGE_LOOP_lshift_psp_sva[3:1])}),
      z_out_6, VEC_LOOP_or_24_itm);
  assign VEC_LOOP_mux_12_nl = MUX_v_12_2_2((VEC_LOOP_j_1_sva[11:0]), ({reg_VEC_LOOP_acc_1_reg
      , reg_VEC_LOOP_acc_1_1_reg}), VEC_LOOP_or_24_itm);
  assign nl_z_out_5 = VEC_LOOP_VEC_LOOP_mux_12_nl + VEC_LOOP_mux_12_nl;
  assign z_out_5 = nl_z_out_5[11:0];
  assign VEC_LOOP_VEC_LOOP_mux_13_nl = MUX_v_9_2_2(({3'b000 , (COMP_LOOP_k_12_3_sva_8_0[8:3])}),
      COMP_LOOP_k_12_3_sva_8_0, VEC_LOOP_or_34_itm);
  assign VEC_LOOP_or_41_nl = and_dcpl_210 | and_dcpl_236;
  assign VEC_LOOP_mux1h_29_nl = MUX1HOT_v_3_7_2((COMP_LOOP_k_12_3_sva_8_0[2:0]),
      3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, {VEC_LOOP_or_41_nl , and_dcpl_26
      , and_dcpl_33 , and_dcpl_224 , and_dcpl_44 , and_dcpl_229 , and_dcpl_232});
  assign VEC_LOOP_or_40_nl = MUX_v_3_2_2(VEC_LOOP_mux1h_29_nl, 3'b111, and_dcpl_52);
  assign VEC_LOOP_mux1h_30_nl = MUX1HOT_v_12_3_2(({3'b000 , (STAGE_LOOP_lshift_psp_sva[12:4])}),
      (STAGE_LOOP_lshift_psp_sva[12:1]), 12'b000000000001, {and_dcpl_210 , VEC_LOOP_or_34_itm
      , and_dcpl_236});
  assign nl_z_out_6 = ({VEC_LOOP_VEC_LOOP_mux_13_nl , VEC_LOOP_or_40_nl}) + VEC_LOOP_mux1h_30_nl;
  assign z_out_6 = nl_z_out_6[11:0];
  assign VEC_LOOP_nor_11_nl = ~(and_dcpl_242 | and_dcpl_247 | and_dcpl_263);
  assign VEC_LOOP_VEC_LOOP_and_2_nl = MUX_v_2_2_2(2'b00, (reg_VEC_LOOP_acc_1_reg[2:1]),
      VEC_LOOP_nor_11_nl);
  assign VEC_LOOP_mux_13_nl = MUX_s_1_2_2((reg_VEC_LOOP_acc_1_reg[2]), (reg_VEC_LOOP_acc_1_reg[0]),
      VEC_LOOP_or_7_ssc);
  assign VEC_LOOP_VEC_LOOP_or_13_nl = (VEC_LOOP_mux_13_nl & (~ and_dcpl_242)) | and_dcpl_263;
  assign VEC_LOOP_mux1h_31_nl = MUX1HOT_v_9_4_2((VEC_LOOP_j_1_sva[11:3]), ({(reg_VEC_LOOP_acc_1_reg[1:0])
      , (reg_VEC_LOOP_acc_1_1_reg[8:2])}), reg_VEC_LOOP_acc_1_1_reg, (~ (STAGE_LOOP_lshift_psp_sva[12:4])),
      {and_dcpl_242 , and_dcpl_247 , VEC_LOOP_or_7_ssc , and_dcpl_263});
  assign VEC_LOOP_or_42_nl = (~(and_dcpl_242 | and_dcpl_247 | and_dcpl_26 | and_dcpl_255
      | and_228_cse | and_232_cse)) | and_dcpl_263;
  assign VEC_LOOP_mux1h_32_nl = MUX1HOT_v_9_3_2(({3'b000 , (COMP_LOOP_k_12_3_sva_8_0[8:3])}),
      ({2'b00 , (COMP_LOOP_k_12_3_sva_8_0[8:2])}), COMP_LOOP_k_12_3_sva_8_0, {VEC_LOOP_or_29_ssc
      , and_dcpl_247 , VEC_LOOP_or_7_ssc});
  assign VEC_LOOP_mux1h_33_nl = MUX1HOT_v_2_4_2((COMP_LOOP_k_12_3_sva_8_0[2:1]),
      (COMP_LOOP_k_12_3_sva_8_0[1:0]), 2'b01, 2'b10, {VEC_LOOP_or_29_ssc , and_dcpl_247
      , and_dcpl_255 , and_228_cse});
  assign not_475_nl = ~ and_dcpl_26;
  assign VEC_LOOP_and_16_nl = MUX_v_2_2_2(2'b00, VEC_LOOP_mux1h_33_nl, not_475_nl);
  assign VEC_LOOP_or_43_nl = MUX_v_2_2_2(VEC_LOOP_and_16_nl, 2'b11, and_232_cse);
  assign VEC_LOOP_VEC_LOOP_or_14_nl = (COMP_LOOP_k_12_3_sva_8_0[0]) | and_dcpl_247
      | and_dcpl_26 | and_dcpl_255 | and_228_cse | and_232_cse;
  assign nl_acc_6_nl = ({VEC_LOOP_VEC_LOOP_and_2_nl , VEC_LOOP_VEC_LOOP_or_13_nl
      , VEC_LOOP_mux1h_31_nl , VEC_LOOP_or_42_nl}) + ({VEC_LOOP_mux1h_32_nl , VEC_LOOP_or_43_nl
      , VEC_LOOP_VEC_LOOP_or_14_nl , 1'b1});
  assign acc_6_nl = nl_acc_6_nl[12:0];
  assign z_out_7 = readslicef_13_12_1(acc_6_nl);
  assign COMP_LOOP_twiddle_f_mux_4_nl = MUX_s_1_2_2((COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[11]),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11]), COMP_LOOP_twiddle_f_or_ssc);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl = COMP_LOOP_twiddle_f_mux_4_nl
      & COMP_LOOP_twiddle_f_nor_1_itm;
  assign COMP_LOOP_twiddle_f_mux1h_73_nl = MUX1HOT_v_11_5_2((COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[10:0]),
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1, (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10:0]),
      ({1'b0 , VEC_LOOP_acc_11_psp_sva_9_0}), COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
      {and_dcpl_269 , and_dcpl_274 , COMP_LOOP_twiddle_f_or_ssc , and_dcpl_283 ,
      and_dcpl_287});
  assign COMP_LOOP_twiddle_f_and_10_nl = (COMP_LOOP_k_12_3_sva_8_0[8]) & COMP_LOOP_twiddle_f_nor_1_itm;
  assign COMP_LOOP_twiddle_f_or_13_nl = and_dcpl_269 | and_dcpl_280 | and_dcpl_286
      | and_dcpl_290;
  assign COMP_LOOP_twiddle_f_or_14_nl = and_dcpl_274 | and_dcpl_287;
  assign COMP_LOOP_twiddle_f_mux1h_74_nl = MUX1HOT_v_8_3_2((COMP_LOOP_k_12_3_sva_8_0[7:0]),
      (COMP_LOOP_k_12_3_sva_8_0[8:1]), ({1'b0 , (COMP_LOOP_k_12_3_sva_8_0[8:2])}),
      {COMP_LOOP_twiddle_f_or_13_nl , COMP_LOOP_twiddle_f_or_14_nl , and_dcpl_283});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl = MUX_s_1_2_2((COMP_LOOP_k_12_3_sva_8_0[0]),
      (COMP_LOOP_k_12_3_sva_8_0[1]), and_dcpl_283);
  assign COMP_LOOP_twiddle_f_or_15_nl = (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl
      & (~(and_dcpl_269 | and_dcpl_280))) | and_dcpl_286 | and_dcpl_290;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl = ((COMP_LOOP_k_12_3_sva_8_0[0])
      & (~(and_dcpl_269 | and_dcpl_274 | and_dcpl_286))) | and_dcpl_280 | and_dcpl_287
      | and_dcpl_290;
  assign nl_z_out_8 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl , COMP_LOOP_twiddle_f_mux1h_73_nl})
      * ({COMP_LOOP_twiddle_f_and_10_nl , COMP_LOOP_twiddle_f_mux1h_74_nl , COMP_LOOP_twiddle_f_or_15_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_1_nl , 1'b1});
  assign z_out_8 = nl_z_out_8[11:0];
  assign VEC_LOOP_VEC_LOOP_mux_14_nl = MUX_v_11_2_2(({reg_VEC_LOOP_acc_1_reg , (reg_VEC_LOOP_acc_1_1_reg[8:1])}),
      ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[12:3]))}), and_dcpl_306);
  assign VEC_LOOP_or_44_nl = (~(and_dcpl_296 | and_dcpl_302)) | and_dcpl_306;
  assign VEC_LOOP_VEC_LOOP_mux_15_nl = MUX_v_9_2_2(COMP_LOOP_k_12_3_sva_8_0, ({1'b0
      , (COMP_LOOP_k_12_3_sva_8_0[8:1])}), and_dcpl_306);
  assign VEC_LOOP_VEC_LOOP_or_15_nl = ((COMP_LOOP_k_12_3_sva_8_0[0]) & (~ and_dcpl_296))
      | and_dcpl_302;
  assign VEC_LOOP_VEC_LOOP_or_16_nl = (~ and_dcpl_306) | and_dcpl_296 | and_dcpl_302;
  assign nl_acc_7_nl = ({VEC_LOOP_VEC_LOOP_mux_14_nl , VEC_LOOP_or_44_nl}) + ({VEC_LOOP_VEC_LOOP_mux_15_nl
      , VEC_LOOP_VEC_LOOP_or_15_nl , VEC_LOOP_VEC_LOOP_or_16_nl , 1'b1});
  assign acc_7_nl = nl_acc_7_nl[11:0];
  assign z_out_9 = readslicef_12_11_1(acc_7_nl);

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


  function automatic [0:0] MUX1HOT_s_1_4_2;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [3:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    MUX1HOT_s_1_4_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_5_2;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [4:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    MUX1HOT_s_1_5_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_6_2;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [5:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    MUX1HOT_s_1_6_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_7_2;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [6:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    MUX1HOT_s_1_7_2 = result;
  end
  endfunction


  function automatic [9:0] MUX1HOT_v_10_4_2;
    input [9:0] input_3;
    input [9:0] input_2;
    input [9:0] input_1;
    input [9:0] input_0;
    input [3:0] sel;
    reg [9:0] result;
  begin
    result = input_0 & {10{sel[0]}};
    result = result | ( input_1 & {10{sel[1]}});
    result = result | ( input_2 & {10{sel[2]}});
    result = result | ( input_3 & {10{sel[3]}});
    MUX1HOT_v_10_4_2 = result;
  end
  endfunction


  function automatic [10:0] MUX1HOT_v_11_5_2;
    input [10:0] input_4;
    input [10:0] input_3;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [4:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    result = result | ( input_3 & {11{sel[3]}});
    result = result | ( input_4 & {11{sel[4]}});
    MUX1HOT_v_11_5_2 = result;
  end
  endfunction


  function automatic [11:0] MUX1HOT_v_12_3_2;
    input [11:0] input_2;
    input [11:0] input_1;
    input [11:0] input_0;
    input [2:0] sel;
    reg [11:0] result;
  begin
    result = input_0 & {12{sel[0]}};
    result = result | ( input_1 & {12{sel[1]}});
    result = result | ( input_2 & {12{sel[2]}});
    MUX1HOT_v_12_3_2 = result;
  end
  endfunction


  function automatic [1:0] MUX1HOT_v_2_4_2;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [3:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    MUX1HOT_v_2_4_2 = result;
  end
  endfunction


  function automatic [2:0] MUX1HOT_v_3_7_2;
    input [2:0] input_6;
    input [2:0] input_5;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [6:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    result = result | ( input_5 & {3{sel[5]}});
    result = result | ( input_6 & {3{sel[6]}});
    MUX1HOT_v_3_7_2 = result;
  end
  endfunction


  function automatic [3:0] MUX1HOT_v_4_3_2;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [2:0] sel;
    reg [3:0] result;
  begin
    result = input_0 & {4{sel[0]}};
    result = result | ( input_1 & {4{sel[1]}});
    result = result | ( input_2 & {4{sel[2]}});
    MUX1HOT_v_4_3_2 = result;
  end
  endfunction


  function automatic [7:0] MUX1HOT_v_8_3_2;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [2:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | ( input_1 & {8{sel[1]}});
    result = result | ( input_2 & {8{sel[2]}});
    MUX1HOT_v_8_3_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_3_2;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [2:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    MUX1HOT_v_9_3_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_4_2;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [3:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    MUX1HOT_v_9_4_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_8_2;
    input [8:0] input_7;
    input [8:0] input_6;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [7:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    result = result | ( input_5 & {9{sel[5]}});
    result = result | ( input_6 & {9{sel[6]}});
    result = result | ( input_7 & {9{sel[7]}});
    MUX1HOT_v_9_8_2 = result;
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


  function automatic [9:0] MUX_v_10_2_2;
    input [9:0] input_0;
    input [9:0] input_1;
    input [0:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_10_2_2 = result;
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


  function automatic [11:0] MUX_v_12_2_2;
    input [11:0] input_0;
    input [11:0] input_1;
    input [0:0] sel;
    reg [11:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_12_2_2 = result;
  end
  endfunction


  function automatic [19:0] MUX_v_20_2_2;
    input [19:0] input_0;
    input [19:0] input_1;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_20_2_2 = result;
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


  function automatic [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
  end
  endfunction


  function automatic [11:0] readslicef_13_12_1;
    input [12:0] vector;
    reg [12:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_13_12_1 = tmp[11:0];
  end
  endfunction


  function automatic [12:0] readslicef_14_13_1;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_14_13_1 = tmp[12:0];
  end
  endfunction


  function automatic [8:0] readslicef_22_9_13;
    input [21:0] vector;
    reg [21:0] tmp;
  begin
    tmp = vector >> 13;
    readslicef_22_9_13 = tmp[8:0];
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


  function automatic [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


  function automatic [3:0] conv_s2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_s2u_3_4 = {vector[2], vector};
  end
  endfunction


  function automatic [21:0] conv_s2u_14_22 ;
    input [13:0]  vector ;
  begin
    conv_s2u_14_22 = {{8{vector[13]}}, vector};
  end
  endfunction


  function automatic [13:0] conv_u2u_13_14 ;
    input [12:0]  vector ;
  begin
    conv_u2u_13_14 = {1'b0, vector};
  end
  endfunction


  function automatic [21:0] conv_u2u_21_22 ;
    input [20:0]  vector ;
  begin
    conv_u2u_21_22 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_adra, vec_rsc_da, vec_rsc_wea, vec_rsc_qa,
      vec_rsc_adrb, vec_rsc_db, vec_rsc_web, vec_rsc_qb, vec_rsc_triosy_lz, p_rsc_dat,
      p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz, twiddle_rsc_adra, twiddle_rsc_da,
      twiddle_rsc_wea, twiddle_rsc_qa, twiddle_rsc_adrb, twiddle_rsc_db, twiddle_rsc_web,
      twiddle_rsc_qb, twiddle_rsc_triosy_lz, twiddle_h_rsc_adra, twiddle_h_rsc_da,
      twiddle_h_rsc_wea, twiddle_h_rsc_qa, twiddle_h_rsc_adrb, twiddle_h_rsc_db,
      twiddle_h_rsc_web, twiddle_h_rsc_qb, twiddle_h_rsc_triosy_lz, complete_rsc_rdy,
      complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [11:0] vec_rsc_adra;
  output [31:0] vec_rsc_da;
  output vec_rsc_wea;
  input [31:0] vec_rsc_qa;
  output [11:0] vec_rsc_adrb;
  output [31:0] vec_rsc_db;
  output vec_rsc_web;
  input [31:0] vec_rsc_qb;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [11:0] twiddle_rsc_adra;
  output [31:0] twiddle_rsc_da;
  output twiddle_rsc_wea;
  input [31:0] twiddle_rsc_qa;
  output [11:0] twiddle_rsc_adrb;
  output [31:0] twiddle_rsc_db;
  output twiddle_rsc_web;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [11:0] twiddle_h_rsc_adra;
  output [31:0] twiddle_h_rsc_da;
  output twiddle_h_rsc_wea;
  input [31:0] twiddle_h_rsc_qa;
  output [11:0] twiddle_h_rsc_adrb;
  output [31:0] twiddle_h_rsc_db;
  output twiddle_h_rsc_web;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire [23:0] vec_rsci_adra_d;
  wire [31:0] vec_rsci_da_d;
  wire [63:0] vec_rsci_qa_d;
  wire [1:0] vec_rsci_wea_d;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [11:0] twiddle_rsci_adra_d;
  wire [63:0] twiddle_rsci_qa_d;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] twiddle_h_rsci_adra_d;
  wire [63:0] twiddle_h_rsci_qa_d;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_vec_rsci_da_d;
  assign nl_vec_rsci_da_d = {32'b00000000000000000000000000000000 , vec_rsci_da_d};
  wire [23:0] nl_twiddle_rsci_adra_d;
  assign nl_twiddle_rsci_adra_d = {12'b000000000000 , twiddle_rsci_adra_d};
  wire [23:0] nl_twiddle_h_rsci_adra_d;
  assign nl_twiddle_h_rsci_adra_d = {12'b000000000000 , twiddle_h_rsci_adra_d};
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_12_32_4096_4096_32_1_gen
      vec_rsci (
      .qb(vec_rsc_qb),
      .web(vec_rsc_web),
      .db(vec_rsc_db),
      .adrb(vec_rsc_adrb),
      .qa(vec_rsc_qa),
      .wea(vec_rsc_wea),
      .da(vec_rsc_da),
      .adra(vec_rsc_adra),
      .adra_d(vec_rsci_adra_d),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(nl_vec_rsci_da_d[63:0]),
      .qa_d(vec_rsci_qa_d),
      .wea_d(vec_rsci_wea_d),
      .rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d)
    );
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_12_32_4096_4096_32_1_gen
      twiddle_rsci (
      .qb(twiddle_rsc_qb),
      .web(twiddle_rsc_web),
      .db(twiddle_rsc_db),
      .adrb(twiddle_rsc_adrb),
      .qa(twiddle_rsc_qa),
      .wea(twiddle_rsc_wea),
      .da(twiddle_rsc_da),
      .adra(twiddle_rsc_adra),
      .adra_d(nl_twiddle_rsci_adra_d[23:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsci_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_12_32_4096_4096_32_1_gen
      twiddle_h_rsci (
      .qb(twiddle_h_rsc_qb),
      .web(twiddle_h_rsc_web),
      .db(twiddle_h_rsc_db),
      .adrb(twiddle_h_rsc_adrb),
      .qa(twiddle_h_rsc_qa),
      .wea(twiddle_h_rsc_wea),
      .da(twiddle_h_rsc_da),
      .adra(twiddle_h_rsc_adra),
      .adra_d(nl_twiddle_h_rsci_adra_d[23:0]),
      .clka(clk),
      .clka_en(1'b1),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsci_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIT_precomp_core inPlaceNTT_DIT_precomp_core_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_rdy(run_rsc_rdy),
      .run_rsc_vld(run_rsc_vld),
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .vec_rsci_adra_d(vec_rsci_adra_d),
      .vec_rsci_da_d(vec_rsci_da_d),
      .vec_rsci_qa_d(vec_rsci_qa_d),
      .vec_rsci_wea_d(vec_rsci_wea_d),
      .vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d(vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d),
      .twiddle_rsci_adra_d(twiddle_rsci_adra_d),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsci_adra_d(twiddle_h_rsci_adra_d),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d)
    );
endmodule



