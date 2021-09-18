
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
//  Generated date: Thu Sep 16 12:56:43 2021
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
      COMP_LOOP_C_3_tr0, COMP_LOOP_2_VEC_LOOP_C_8_tr0, COMP_LOOP_C_4_tr0, COMP_LOOP_3_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_5_tr0, COMP_LOOP_4_VEC_LOOP_C_8_tr0, COMP_LOOP_C_6_tr0, COMP_LOOP_5_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_7_tr0, COMP_LOOP_6_VEC_LOOP_C_8_tr0, COMP_LOOP_C_8_tr0, COMP_LOOP_7_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_9_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_10_tr0, COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_11_tr0, COMP_LOOP_10_VEC_LOOP_C_8_tr0, COMP_LOOP_C_12_tr0, COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_13_tr0, COMP_LOOP_12_VEC_LOOP_C_8_tr0, COMP_LOOP_C_14_tr0, COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_15_tr0, COMP_LOOP_14_VEC_LOOP_C_8_tr0, COMP_LOOP_C_16_tr0, COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_17_tr0, COMP_LOOP_16_VEC_LOOP_C_8_tr0, COMP_LOOP_C_18_tr0, COMP_LOOP_17_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_19_tr0, COMP_LOOP_18_VEC_LOOP_C_8_tr0, COMP_LOOP_C_20_tr0, COMP_LOOP_19_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_21_tr0, COMP_LOOP_20_VEC_LOOP_C_8_tr0, COMP_LOOP_C_22_tr0, COMP_LOOP_21_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_23_tr0, COMP_LOOP_22_VEC_LOOP_C_8_tr0, COMP_LOOP_C_24_tr0, COMP_LOOP_23_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_25_tr0, COMP_LOOP_24_VEC_LOOP_C_8_tr0, COMP_LOOP_C_26_tr0, COMP_LOOP_25_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_27_tr0, COMP_LOOP_26_VEC_LOOP_C_8_tr0, COMP_LOOP_C_28_tr0, COMP_LOOP_27_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_29_tr0, COMP_LOOP_28_VEC_LOOP_C_8_tr0, COMP_LOOP_C_30_tr0, COMP_LOOP_29_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_31_tr0, COMP_LOOP_30_VEC_LOOP_C_8_tr0, COMP_LOOP_C_32_tr0, COMP_LOOP_31_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_33_tr0, COMP_LOOP_32_VEC_LOOP_C_8_tr0, COMP_LOOP_C_34_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input main_C_0_tr0;
  input COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_3_tr0;
  input COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_4_tr0;
  input COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_5_tr0;
  input COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_6_tr0;
  input COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_7_tr0;
  input COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_8_tr0;
  input COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_9_tr0;
  input COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_10_tr0;
  input COMP_LOOP_9_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_11_tr0;
  input COMP_LOOP_10_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_12_tr0;
  input COMP_LOOP_11_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_13_tr0;
  input COMP_LOOP_12_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_14_tr0;
  input COMP_LOOP_13_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_15_tr0;
  input COMP_LOOP_14_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_16_tr0;
  input COMP_LOOP_15_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_17_tr0;
  input COMP_LOOP_16_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_18_tr0;
  input COMP_LOOP_17_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_19_tr0;
  input COMP_LOOP_18_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_20_tr0;
  input COMP_LOOP_19_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_21_tr0;
  input COMP_LOOP_20_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_22_tr0;
  input COMP_LOOP_21_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_23_tr0;
  input COMP_LOOP_22_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_24_tr0;
  input COMP_LOOP_23_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_25_tr0;
  input COMP_LOOP_24_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_26_tr0;
  input COMP_LOOP_25_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_27_tr0;
  input COMP_LOOP_26_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_28_tr0;
  input COMP_LOOP_27_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_29_tr0;
  input COMP_LOOP_28_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_30_tr0;
  input COMP_LOOP_29_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_31_tr0;
  input COMP_LOOP_30_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_32_tr0;
  input COMP_LOOP_31_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_33_tr0;
  input COMP_LOOP_32_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_34_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  parameter
    main_C_0 = 9'd0,
    STAGE_LOOP_C_0 = 9'd1,
    COMP_LOOP_C_0 = 9'd2,
    COMP_LOOP_C_1 = 9'd3,
    COMP_LOOP_C_2 = 9'd4,
    COMP_LOOP_1_VEC_LOOP_C_0 = 9'd5,
    COMP_LOOP_1_VEC_LOOP_C_1 = 9'd6,
    COMP_LOOP_1_VEC_LOOP_C_2 = 9'd7,
    COMP_LOOP_1_VEC_LOOP_C_3 = 9'd8,
    COMP_LOOP_1_VEC_LOOP_C_4 = 9'd9,
    COMP_LOOP_1_VEC_LOOP_C_5 = 9'd10,
    COMP_LOOP_1_VEC_LOOP_C_6 = 9'd11,
    COMP_LOOP_1_VEC_LOOP_C_7 = 9'd12,
    COMP_LOOP_1_VEC_LOOP_C_8 = 9'd13,
    COMP_LOOP_C_3 = 9'd14,
    COMP_LOOP_2_VEC_LOOP_C_0 = 9'd15,
    COMP_LOOP_2_VEC_LOOP_C_1 = 9'd16,
    COMP_LOOP_2_VEC_LOOP_C_2 = 9'd17,
    COMP_LOOP_2_VEC_LOOP_C_3 = 9'd18,
    COMP_LOOP_2_VEC_LOOP_C_4 = 9'd19,
    COMP_LOOP_2_VEC_LOOP_C_5 = 9'd20,
    COMP_LOOP_2_VEC_LOOP_C_6 = 9'd21,
    COMP_LOOP_2_VEC_LOOP_C_7 = 9'd22,
    COMP_LOOP_2_VEC_LOOP_C_8 = 9'd23,
    COMP_LOOP_C_4 = 9'd24,
    COMP_LOOP_3_VEC_LOOP_C_0 = 9'd25,
    COMP_LOOP_3_VEC_LOOP_C_1 = 9'd26,
    COMP_LOOP_3_VEC_LOOP_C_2 = 9'd27,
    COMP_LOOP_3_VEC_LOOP_C_3 = 9'd28,
    COMP_LOOP_3_VEC_LOOP_C_4 = 9'd29,
    COMP_LOOP_3_VEC_LOOP_C_5 = 9'd30,
    COMP_LOOP_3_VEC_LOOP_C_6 = 9'd31,
    COMP_LOOP_3_VEC_LOOP_C_7 = 9'd32,
    COMP_LOOP_3_VEC_LOOP_C_8 = 9'd33,
    COMP_LOOP_C_5 = 9'd34,
    COMP_LOOP_4_VEC_LOOP_C_0 = 9'd35,
    COMP_LOOP_4_VEC_LOOP_C_1 = 9'd36,
    COMP_LOOP_4_VEC_LOOP_C_2 = 9'd37,
    COMP_LOOP_4_VEC_LOOP_C_3 = 9'd38,
    COMP_LOOP_4_VEC_LOOP_C_4 = 9'd39,
    COMP_LOOP_4_VEC_LOOP_C_5 = 9'd40,
    COMP_LOOP_4_VEC_LOOP_C_6 = 9'd41,
    COMP_LOOP_4_VEC_LOOP_C_7 = 9'd42,
    COMP_LOOP_4_VEC_LOOP_C_8 = 9'd43,
    COMP_LOOP_C_6 = 9'd44,
    COMP_LOOP_5_VEC_LOOP_C_0 = 9'd45,
    COMP_LOOP_5_VEC_LOOP_C_1 = 9'd46,
    COMP_LOOP_5_VEC_LOOP_C_2 = 9'd47,
    COMP_LOOP_5_VEC_LOOP_C_3 = 9'd48,
    COMP_LOOP_5_VEC_LOOP_C_4 = 9'd49,
    COMP_LOOP_5_VEC_LOOP_C_5 = 9'd50,
    COMP_LOOP_5_VEC_LOOP_C_6 = 9'd51,
    COMP_LOOP_5_VEC_LOOP_C_7 = 9'd52,
    COMP_LOOP_5_VEC_LOOP_C_8 = 9'd53,
    COMP_LOOP_C_7 = 9'd54,
    COMP_LOOP_6_VEC_LOOP_C_0 = 9'd55,
    COMP_LOOP_6_VEC_LOOP_C_1 = 9'd56,
    COMP_LOOP_6_VEC_LOOP_C_2 = 9'd57,
    COMP_LOOP_6_VEC_LOOP_C_3 = 9'd58,
    COMP_LOOP_6_VEC_LOOP_C_4 = 9'd59,
    COMP_LOOP_6_VEC_LOOP_C_5 = 9'd60,
    COMP_LOOP_6_VEC_LOOP_C_6 = 9'd61,
    COMP_LOOP_6_VEC_LOOP_C_7 = 9'd62,
    COMP_LOOP_6_VEC_LOOP_C_8 = 9'd63,
    COMP_LOOP_C_8 = 9'd64,
    COMP_LOOP_7_VEC_LOOP_C_0 = 9'd65,
    COMP_LOOP_7_VEC_LOOP_C_1 = 9'd66,
    COMP_LOOP_7_VEC_LOOP_C_2 = 9'd67,
    COMP_LOOP_7_VEC_LOOP_C_3 = 9'd68,
    COMP_LOOP_7_VEC_LOOP_C_4 = 9'd69,
    COMP_LOOP_7_VEC_LOOP_C_5 = 9'd70,
    COMP_LOOP_7_VEC_LOOP_C_6 = 9'd71,
    COMP_LOOP_7_VEC_LOOP_C_7 = 9'd72,
    COMP_LOOP_7_VEC_LOOP_C_8 = 9'd73,
    COMP_LOOP_C_9 = 9'd74,
    COMP_LOOP_8_VEC_LOOP_C_0 = 9'd75,
    COMP_LOOP_8_VEC_LOOP_C_1 = 9'd76,
    COMP_LOOP_8_VEC_LOOP_C_2 = 9'd77,
    COMP_LOOP_8_VEC_LOOP_C_3 = 9'd78,
    COMP_LOOP_8_VEC_LOOP_C_4 = 9'd79,
    COMP_LOOP_8_VEC_LOOP_C_5 = 9'd80,
    COMP_LOOP_8_VEC_LOOP_C_6 = 9'd81,
    COMP_LOOP_8_VEC_LOOP_C_7 = 9'd82,
    COMP_LOOP_8_VEC_LOOP_C_8 = 9'd83,
    COMP_LOOP_C_10 = 9'd84,
    COMP_LOOP_9_VEC_LOOP_C_0 = 9'd85,
    COMP_LOOP_9_VEC_LOOP_C_1 = 9'd86,
    COMP_LOOP_9_VEC_LOOP_C_2 = 9'd87,
    COMP_LOOP_9_VEC_LOOP_C_3 = 9'd88,
    COMP_LOOP_9_VEC_LOOP_C_4 = 9'd89,
    COMP_LOOP_9_VEC_LOOP_C_5 = 9'd90,
    COMP_LOOP_9_VEC_LOOP_C_6 = 9'd91,
    COMP_LOOP_9_VEC_LOOP_C_7 = 9'd92,
    COMP_LOOP_9_VEC_LOOP_C_8 = 9'd93,
    COMP_LOOP_C_11 = 9'd94,
    COMP_LOOP_10_VEC_LOOP_C_0 = 9'd95,
    COMP_LOOP_10_VEC_LOOP_C_1 = 9'd96,
    COMP_LOOP_10_VEC_LOOP_C_2 = 9'd97,
    COMP_LOOP_10_VEC_LOOP_C_3 = 9'd98,
    COMP_LOOP_10_VEC_LOOP_C_4 = 9'd99,
    COMP_LOOP_10_VEC_LOOP_C_5 = 9'd100,
    COMP_LOOP_10_VEC_LOOP_C_6 = 9'd101,
    COMP_LOOP_10_VEC_LOOP_C_7 = 9'd102,
    COMP_LOOP_10_VEC_LOOP_C_8 = 9'd103,
    COMP_LOOP_C_12 = 9'd104,
    COMP_LOOP_11_VEC_LOOP_C_0 = 9'd105,
    COMP_LOOP_11_VEC_LOOP_C_1 = 9'd106,
    COMP_LOOP_11_VEC_LOOP_C_2 = 9'd107,
    COMP_LOOP_11_VEC_LOOP_C_3 = 9'd108,
    COMP_LOOP_11_VEC_LOOP_C_4 = 9'd109,
    COMP_LOOP_11_VEC_LOOP_C_5 = 9'd110,
    COMP_LOOP_11_VEC_LOOP_C_6 = 9'd111,
    COMP_LOOP_11_VEC_LOOP_C_7 = 9'd112,
    COMP_LOOP_11_VEC_LOOP_C_8 = 9'd113,
    COMP_LOOP_C_13 = 9'd114,
    COMP_LOOP_12_VEC_LOOP_C_0 = 9'd115,
    COMP_LOOP_12_VEC_LOOP_C_1 = 9'd116,
    COMP_LOOP_12_VEC_LOOP_C_2 = 9'd117,
    COMP_LOOP_12_VEC_LOOP_C_3 = 9'd118,
    COMP_LOOP_12_VEC_LOOP_C_4 = 9'd119,
    COMP_LOOP_12_VEC_LOOP_C_5 = 9'd120,
    COMP_LOOP_12_VEC_LOOP_C_6 = 9'd121,
    COMP_LOOP_12_VEC_LOOP_C_7 = 9'd122,
    COMP_LOOP_12_VEC_LOOP_C_8 = 9'd123,
    COMP_LOOP_C_14 = 9'd124,
    COMP_LOOP_13_VEC_LOOP_C_0 = 9'd125,
    COMP_LOOP_13_VEC_LOOP_C_1 = 9'd126,
    COMP_LOOP_13_VEC_LOOP_C_2 = 9'd127,
    COMP_LOOP_13_VEC_LOOP_C_3 = 9'd128,
    COMP_LOOP_13_VEC_LOOP_C_4 = 9'd129,
    COMP_LOOP_13_VEC_LOOP_C_5 = 9'd130,
    COMP_LOOP_13_VEC_LOOP_C_6 = 9'd131,
    COMP_LOOP_13_VEC_LOOP_C_7 = 9'd132,
    COMP_LOOP_13_VEC_LOOP_C_8 = 9'd133,
    COMP_LOOP_C_15 = 9'd134,
    COMP_LOOP_14_VEC_LOOP_C_0 = 9'd135,
    COMP_LOOP_14_VEC_LOOP_C_1 = 9'd136,
    COMP_LOOP_14_VEC_LOOP_C_2 = 9'd137,
    COMP_LOOP_14_VEC_LOOP_C_3 = 9'd138,
    COMP_LOOP_14_VEC_LOOP_C_4 = 9'd139,
    COMP_LOOP_14_VEC_LOOP_C_5 = 9'd140,
    COMP_LOOP_14_VEC_LOOP_C_6 = 9'd141,
    COMP_LOOP_14_VEC_LOOP_C_7 = 9'd142,
    COMP_LOOP_14_VEC_LOOP_C_8 = 9'd143,
    COMP_LOOP_C_16 = 9'd144,
    COMP_LOOP_15_VEC_LOOP_C_0 = 9'd145,
    COMP_LOOP_15_VEC_LOOP_C_1 = 9'd146,
    COMP_LOOP_15_VEC_LOOP_C_2 = 9'd147,
    COMP_LOOP_15_VEC_LOOP_C_3 = 9'd148,
    COMP_LOOP_15_VEC_LOOP_C_4 = 9'd149,
    COMP_LOOP_15_VEC_LOOP_C_5 = 9'd150,
    COMP_LOOP_15_VEC_LOOP_C_6 = 9'd151,
    COMP_LOOP_15_VEC_LOOP_C_7 = 9'd152,
    COMP_LOOP_15_VEC_LOOP_C_8 = 9'd153,
    COMP_LOOP_C_17 = 9'd154,
    COMP_LOOP_16_VEC_LOOP_C_0 = 9'd155,
    COMP_LOOP_16_VEC_LOOP_C_1 = 9'd156,
    COMP_LOOP_16_VEC_LOOP_C_2 = 9'd157,
    COMP_LOOP_16_VEC_LOOP_C_3 = 9'd158,
    COMP_LOOP_16_VEC_LOOP_C_4 = 9'd159,
    COMP_LOOP_16_VEC_LOOP_C_5 = 9'd160,
    COMP_LOOP_16_VEC_LOOP_C_6 = 9'd161,
    COMP_LOOP_16_VEC_LOOP_C_7 = 9'd162,
    COMP_LOOP_16_VEC_LOOP_C_8 = 9'd163,
    COMP_LOOP_C_18 = 9'd164,
    COMP_LOOP_17_VEC_LOOP_C_0 = 9'd165,
    COMP_LOOP_17_VEC_LOOP_C_1 = 9'd166,
    COMP_LOOP_17_VEC_LOOP_C_2 = 9'd167,
    COMP_LOOP_17_VEC_LOOP_C_3 = 9'd168,
    COMP_LOOP_17_VEC_LOOP_C_4 = 9'd169,
    COMP_LOOP_17_VEC_LOOP_C_5 = 9'd170,
    COMP_LOOP_17_VEC_LOOP_C_6 = 9'd171,
    COMP_LOOP_17_VEC_LOOP_C_7 = 9'd172,
    COMP_LOOP_17_VEC_LOOP_C_8 = 9'd173,
    COMP_LOOP_C_19 = 9'd174,
    COMP_LOOP_18_VEC_LOOP_C_0 = 9'd175,
    COMP_LOOP_18_VEC_LOOP_C_1 = 9'd176,
    COMP_LOOP_18_VEC_LOOP_C_2 = 9'd177,
    COMP_LOOP_18_VEC_LOOP_C_3 = 9'd178,
    COMP_LOOP_18_VEC_LOOP_C_4 = 9'd179,
    COMP_LOOP_18_VEC_LOOP_C_5 = 9'd180,
    COMP_LOOP_18_VEC_LOOP_C_6 = 9'd181,
    COMP_LOOP_18_VEC_LOOP_C_7 = 9'd182,
    COMP_LOOP_18_VEC_LOOP_C_8 = 9'd183,
    COMP_LOOP_C_20 = 9'd184,
    COMP_LOOP_19_VEC_LOOP_C_0 = 9'd185,
    COMP_LOOP_19_VEC_LOOP_C_1 = 9'd186,
    COMP_LOOP_19_VEC_LOOP_C_2 = 9'd187,
    COMP_LOOP_19_VEC_LOOP_C_3 = 9'd188,
    COMP_LOOP_19_VEC_LOOP_C_4 = 9'd189,
    COMP_LOOP_19_VEC_LOOP_C_5 = 9'd190,
    COMP_LOOP_19_VEC_LOOP_C_6 = 9'd191,
    COMP_LOOP_19_VEC_LOOP_C_7 = 9'd192,
    COMP_LOOP_19_VEC_LOOP_C_8 = 9'd193,
    COMP_LOOP_C_21 = 9'd194,
    COMP_LOOP_20_VEC_LOOP_C_0 = 9'd195,
    COMP_LOOP_20_VEC_LOOP_C_1 = 9'd196,
    COMP_LOOP_20_VEC_LOOP_C_2 = 9'd197,
    COMP_LOOP_20_VEC_LOOP_C_3 = 9'd198,
    COMP_LOOP_20_VEC_LOOP_C_4 = 9'd199,
    COMP_LOOP_20_VEC_LOOP_C_5 = 9'd200,
    COMP_LOOP_20_VEC_LOOP_C_6 = 9'd201,
    COMP_LOOP_20_VEC_LOOP_C_7 = 9'd202,
    COMP_LOOP_20_VEC_LOOP_C_8 = 9'd203,
    COMP_LOOP_C_22 = 9'd204,
    COMP_LOOP_21_VEC_LOOP_C_0 = 9'd205,
    COMP_LOOP_21_VEC_LOOP_C_1 = 9'd206,
    COMP_LOOP_21_VEC_LOOP_C_2 = 9'd207,
    COMP_LOOP_21_VEC_LOOP_C_3 = 9'd208,
    COMP_LOOP_21_VEC_LOOP_C_4 = 9'd209,
    COMP_LOOP_21_VEC_LOOP_C_5 = 9'd210,
    COMP_LOOP_21_VEC_LOOP_C_6 = 9'd211,
    COMP_LOOP_21_VEC_LOOP_C_7 = 9'd212,
    COMP_LOOP_21_VEC_LOOP_C_8 = 9'd213,
    COMP_LOOP_C_23 = 9'd214,
    COMP_LOOP_22_VEC_LOOP_C_0 = 9'd215,
    COMP_LOOP_22_VEC_LOOP_C_1 = 9'd216,
    COMP_LOOP_22_VEC_LOOP_C_2 = 9'd217,
    COMP_LOOP_22_VEC_LOOP_C_3 = 9'd218,
    COMP_LOOP_22_VEC_LOOP_C_4 = 9'd219,
    COMP_LOOP_22_VEC_LOOP_C_5 = 9'd220,
    COMP_LOOP_22_VEC_LOOP_C_6 = 9'd221,
    COMP_LOOP_22_VEC_LOOP_C_7 = 9'd222,
    COMP_LOOP_22_VEC_LOOP_C_8 = 9'd223,
    COMP_LOOP_C_24 = 9'd224,
    COMP_LOOP_23_VEC_LOOP_C_0 = 9'd225,
    COMP_LOOP_23_VEC_LOOP_C_1 = 9'd226,
    COMP_LOOP_23_VEC_LOOP_C_2 = 9'd227,
    COMP_LOOP_23_VEC_LOOP_C_3 = 9'd228,
    COMP_LOOP_23_VEC_LOOP_C_4 = 9'd229,
    COMP_LOOP_23_VEC_LOOP_C_5 = 9'd230,
    COMP_LOOP_23_VEC_LOOP_C_6 = 9'd231,
    COMP_LOOP_23_VEC_LOOP_C_7 = 9'd232,
    COMP_LOOP_23_VEC_LOOP_C_8 = 9'd233,
    COMP_LOOP_C_25 = 9'd234,
    COMP_LOOP_24_VEC_LOOP_C_0 = 9'd235,
    COMP_LOOP_24_VEC_LOOP_C_1 = 9'd236,
    COMP_LOOP_24_VEC_LOOP_C_2 = 9'd237,
    COMP_LOOP_24_VEC_LOOP_C_3 = 9'd238,
    COMP_LOOP_24_VEC_LOOP_C_4 = 9'd239,
    COMP_LOOP_24_VEC_LOOP_C_5 = 9'd240,
    COMP_LOOP_24_VEC_LOOP_C_6 = 9'd241,
    COMP_LOOP_24_VEC_LOOP_C_7 = 9'd242,
    COMP_LOOP_24_VEC_LOOP_C_8 = 9'd243,
    COMP_LOOP_C_26 = 9'd244,
    COMP_LOOP_25_VEC_LOOP_C_0 = 9'd245,
    COMP_LOOP_25_VEC_LOOP_C_1 = 9'd246,
    COMP_LOOP_25_VEC_LOOP_C_2 = 9'd247,
    COMP_LOOP_25_VEC_LOOP_C_3 = 9'd248,
    COMP_LOOP_25_VEC_LOOP_C_4 = 9'd249,
    COMP_LOOP_25_VEC_LOOP_C_5 = 9'd250,
    COMP_LOOP_25_VEC_LOOP_C_6 = 9'd251,
    COMP_LOOP_25_VEC_LOOP_C_7 = 9'd252,
    COMP_LOOP_25_VEC_LOOP_C_8 = 9'd253,
    COMP_LOOP_C_27 = 9'd254,
    COMP_LOOP_26_VEC_LOOP_C_0 = 9'd255,
    COMP_LOOP_26_VEC_LOOP_C_1 = 9'd256,
    COMP_LOOP_26_VEC_LOOP_C_2 = 9'd257,
    COMP_LOOP_26_VEC_LOOP_C_3 = 9'd258,
    COMP_LOOP_26_VEC_LOOP_C_4 = 9'd259,
    COMP_LOOP_26_VEC_LOOP_C_5 = 9'd260,
    COMP_LOOP_26_VEC_LOOP_C_6 = 9'd261,
    COMP_LOOP_26_VEC_LOOP_C_7 = 9'd262,
    COMP_LOOP_26_VEC_LOOP_C_8 = 9'd263,
    COMP_LOOP_C_28 = 9'd264,
    COMP_LOOP_27_VEC_LOOP_C_0 = 9'd265,
    COMP_LOOP_27_VEC_LOOP_C_1 = 9'd266,
    COMP_LOOP_27_VEC_LOOP_C_2 = 9'd267,
    COMP_LOOP_27_VEC_LOOP_C_3 = 9'd268,
    COMP_LOOP_27_VEC_LOOP_C_4 = 9'd269,
    COMP_LOOP_27_VEC_LOOP_C_5 = 9'd270,
    COMP_LOOP_27_VEC_LOOP_C_6 = 9'd271,
    COMP_LOOP_27_VEC_LOOP_C_7 = 9'd272,
    COMP_LOOP_27_VEC_LOOP_C_8 = 9'd273,
    COMP_LOOP_C_29 = 9'd274,
    COMP_LOOP_28_VEC_LOOP_C_0 = 9'd275,
    COMP_LOOP_28_VEC_LOOP_C_1 = 9'd276,
    COMP_LOOP_28_VEC_LOOP_C_2 = 9'd277,
    COMP_LOOP_28_VEC_LOOP_C_3 = 9'd278,
    COMP_LOOP_28_VEC_LOOP_C_4 = 9'd279,
    COMP_LOOP_28_VEC_LOOP_C_5 = 9'd280,
    COMP_LOOP_28_VEC_LOOP_C_6 = 9'd281,
    COMP_LOOP_28_VEC_LOOP_C_7 = 9'd282,
    COMP_LOOP_28_VEC_LOOP_C_8 = 9'd283,
    COMP_LOOP_C_30 = 9'd284,
    COMP_LOOP_29_VEC_LOOP_C_0 = 9'd285,
    COMP_LOOP_29_VEC_LOOP_C_1 = 9'd286,
    COMP_LOOP_29_VEC_LOOP_C_2 = 9'd287,
    COMP_LOOP_29_VEC_LOOP_C_3 = 9'd288,
    COMP_LOOP_29_VEC_LOOP_C_4 = 9'd289,
    COMP_LOOP_29_VEC_LOOP_C_5 = 9'd290,
    COMP_LOOP_29_VEC_LOOP_C_6 = 9'd291,
    COMP_LOOP_29_VEC_LOOP_C_7 = 9'd292,
    COMP_LOOP_29_VEC_LOOP_C_8 = 9'd293,
    COMP_LOOP_C_31 = 9'd294,
    COMP_LOOP_30_VEC_LOOP_C_0 = 9'd295,
    COMP_LOOP_30_VEC_LOOP_C_1 = 9'd296,
    COMP_LOOP_30_VEC_LOOP_C_2 = 9'd297,
    COMP_LOOP_30_VEC_LOOP_C_3 = 9'd298,
    COMP_LOOP_30_VEC_LOOP_C_4 = 9'd299,
    COMP_LOOP_30_VEC_LOOP_C_5 = 9'd300,
    COMP_LOOP_30_VEC_LOOP_C_6 = 9'd301,
    COMP_LOOP_30_VEC_LOOP_C_7 = 9'd302,
    COMP_LOOP_30_VEC_LOOP_C_8 = 9'd303,
    COMP_LOOP_C_32 = 9'd304,
    COMP_LOOP_31_VEC_LOOP_C_0 = 9'd305,
    COMP_LOOP_31_VEC_LOOP_C_1 = 9'd306,
    COMP_LOOP_31_VEC_LOOP_C_2 = 9'd307,
    COMP_LOOP_31_VEC_LOOP_C_3 = 9'd308,
    COMP_LOOP_31_VEC_LOOP_C_4 = 9'd309,
    COMP_LOOP_31_VEC_LOOP_C_5 = 9'd310,
    COMP_LOOP_31_VEC_LOOP_C_6 = 9'd311,
    COMP_LOOP_31_VEC_LOOP_C_7 = 9'd312,
    COMP_LOOP_31_VEC_LOOP_C_8 = 9'd313,
    COMP_LOOP_C_33 = 9'd314,
    COMP_LOOP_32_VEC_LOOP_C_0 = 9'd315,
    COMP_LOOP_32_VEC_LOOP_C_1 = 9'd316,
    COMP_LOOP_32_VEC_LOOP_C_2 = 9'd317,
    COMP_LOOP_32_VEC_LOOP_C_3 = 9'd318,
    COMP_LOOP_32_VEC_LOOP_C_4 = 9'd319,
    COMP_LOOP_32_VEC_LOOP_C_5 = 9'd320,
    COMP_LOOP_32_VEC_LOOP_C_6 = 9'd321,
    COMP_LOOP_32_VEC_LOOP_C_7 = 9'd322,
    COMP_LOOP_32_VEC_LOOP_C_8 = 9'd323,
    COMP_LOOP_C_34 = 9'd324,
    STAGE_LOOP_C_1 = 9'd325,
    main_C_1 = 9'd326,
    main_C_2 = 9'd327;

  reg [8:0] state_var;
  reg [8:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 9'b000000001;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 9'b000000010;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 9'b000000011;
        state_var_NS = COMP_LOOP_C_2;
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 9'b000000100;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
      end
      COMP_LOOP_1_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000000101;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_1;
      end
      COMP_LOOP_1_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000000110;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_2;
      end
      COMP_LOOP_1_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000000111;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_3;
      end
      COMP_LOOP_1_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000001000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_4;
      end
      COMP_LOOP_1_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000001001;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_5;
      end
      COMP_LOOP_1_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000001010;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_6;
      end
      COMP_LOOP_1_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000001011;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_7;
      end
      COMP_LOOP_1_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000001100;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_8;
      end
      COMP_LOOP_1_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000001101;
        if ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_3;
        end
        else begin
          state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b000001110;
        if ( COMP_LOOP_C_3_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_2_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000001111;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_1;
      end
      COMP_LOOP_2_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000010000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_2;
      end
      COMP_LOOP_2_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000010001;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_3;
      end
      COMP_LOOP_2_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000010010;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_4;
      end
      COMP_LOOP_2_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000010011;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_5;
      end
      COMP_LOOP_2_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000010100;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_6;
      end
      COMP_LOOP_2_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000010101;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_7;
      end
      COMP_LOOP_2_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000010110;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_8;
      end
      COMP_LOOP_2_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000010111;
        if ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b000011000;
        if ( COMP_LOOP_C_4_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_3_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000011001;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_1;
      end
      COMP_LOOP_3_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000011010;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_2;
      end
      COMP_LOOP_3_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000011011;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_3;
      end
      COMP_LOOP_3_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000011100;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_4;
      end
      COMP_LOOP_3_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000011101;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_5;
      end
      COMP_LOOP_3_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000011110;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_6;
      end
      COMP_LOOP_3_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000011111;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_7;
      end
      COMP_LOOP_3_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000100000;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_8;
      end
      COMP_LOOP_3_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000100001;
        if ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_5;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b000100010;
        if ( COMP_LOOP_C_5_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_4_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000100011;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_1;
      end
      COMP_LOOP_4_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000100100;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_2;
      end
      COMP_LOOP_4_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000100101;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_3;
      end
      COMP_LOOP_4_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000100110;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_4;
      end
      COMP_LOOP_4_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000100111;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_5;
      end
      COMP_LOOP_4_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000101000;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_6;
      end
      COMP_LOOP_4_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000101001;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_7;
      end
      COMP_LOOP_4_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000101010;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_8;
      end
      COMP_LOOP_4_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000101011;
        if ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b000101100;
        if ( COMP_LOOP_C_6_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_5_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000101101;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_1;
      end
      COMP_LOOP_5_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000101110;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_2;
      end
      COMP_LOOP_5_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000101111;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_3;
      end
      COMP_LOOP_5_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000110000;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_4;
      end
      COMP_LOOP_5_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000110001;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_5;
      end
      COMP_LOOP_5_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000110010;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_6;
      end
      COMP_LOOP_5_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_7;
      end
      COMP_LOOP_5_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_8;
      end
      COMP_LOOP_5_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000110101;
        if ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_7;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b000110110;
        if ( COMP_LOOP_C_7_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_6_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_1;
      end
      COMP_LOOP_6_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_2;
      end
      COMP_LOOP_6_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000111001;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_3;
      end
      COMP_LOOP_6_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000111010;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_4;
      end
      COMP_LOOP_6_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_5;
      end
      COMP_LOOP_6_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_6;
      end
      COMP_LOOP_6_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_7;
      end
      COMP_LOOP_6_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_8;
      end
      COMP_LOOP_6_VEC_LOOP_C_8 : begin
        fsm_output = 9'b000111111;
        if ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_8;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b001000000;
        if ( COMP_LOOP_C_8_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_7_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_1;
      end
      COMP_LOOP_7_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001000010;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_2;
      end
      COMP_LOOP_7_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001000011;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_3;
      end
      COMP_LOOP_7_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_4;
      end
      COMP_LOOP_7_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_5;
      end
      COMP_LOOP_7_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_6;
      end
      COMP_LOOP_7_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_7;
      end
      COMP_LOOP_7_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_8;
      end
      COMP_LOOP_7_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001001001;
        if ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b001001010;
        if ( COMP_LOOP_C_9_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_8_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001001011;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_1;
      end
      COMP_LOOP_8_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001001100;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_2;
      end
      COMP_LOOP_8_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_3;
      end
      COMP_LOOP_8_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_4;
      end
      COMP_LOOP_8_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_5;
      end
      COMP_LOOP_8_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_6;
      end
      COMP_LOOP_8_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_7;
      end
      COMP_LOOP_8_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_8;
      end
      COMP_LOOP_8_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001010011;
        if ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_10;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b001010100;
        if ( COMP_LOOP_C_10_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_9_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001010101;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_1;
      end
      COMP_LOOP_9_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_2;
      end
      COMP_LOOP_9_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_3;
      end
      COMP_LOOP_9_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_4;
      end
      COMP_LOOP_9_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_5;
      end
      COMP_LOOP_9_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_6;
      end
      COMP_LOOP_9_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_7;
      end
      COMP_LOOP_9_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_8;
      end
      COMP_LOOP_9_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001011101;
        if ( COMP_LOOP_9_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_11;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b001011110;
        if ( COMP_LOOP_C_11_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_10_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_1;
      end
      COMP_LOOP_10_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_2;
      end
      COMP_LOOP_10_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_3;
      end
      COMP_LOOP_10_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_4;
      end
      COMP_LOOP_10_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_5;
      end
      COMP_LOOP_10_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_6;
      end
      COMP_LOOP_10_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_7;
      end
      COMP_LOOP_10_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001100110;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_8;
      end
      COMP_LOOP_10_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001100111;
        if ( COMP_LOOP_10_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_12;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b001101000;
        if ( COMP_LOOP_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_11_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_1;
      end
      COMP_LOOP_11_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_2;
      end
      COMP_LOOP_11_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_3;
      end
      COMP_LOOP_11_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_4;
      end
      COMP_LOOP_11_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_5;
      end
      COMP_LOOP_11_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_6;
      end
      COMP_LOOP_11_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001101111;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_7;
      end
      COMP_LOOP_11_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001110000;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_8;
      end
      COMP_LOOP_11_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001110001;
        if ( COMP_LOOP_11_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_13;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b001110010;
        if ( COMP_LOOP_C_13_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_12_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_1;
      end
      COMP_LOOP_12_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_2;
      end
      COMP_LOOP_12_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_3;
      end
      COMP_LOOP_12_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_4;
      end
      COMP_LOOP_12_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_5;
      end
      COMP_LOOP_12_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001111000;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_6;
      end
      COMP_LOOP_12_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001111001;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_7;
      end
      COMP_LOOP_12_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_8;
      end
      COMP_LOOP_12_VEC_LOOP_C_8 : begin
        fsm_output = 9'b001111011;
        if ( COMP_LOOP_12_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_14;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b001111100;
        if ( COMP_LOOP_C_14_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_13_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_1;
      end
      COMP_LOOP_13_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_2;
      end
      COMP_LOOP_13_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_3;
      end
      COMP_LOOP_13_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_4;
      end
      COMP_LOOP_13_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010000001;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_5;
      end
      COMP_LOOP_13_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010000010;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_6;
      end
      COMP_LOOP_13_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_7;
      end
      COMP_LOOP_13_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_8;
      end
      COMP_LOOP_13_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010000101;
        if ( COMP_LOOP_13_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_15;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b010000110;
        if ( COMP_LOOP_C_15_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_14_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_1;
      end
      COMP_LOOP_14_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_2;
      end
      COMP_LOOP_14_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_3;
      end
      COMP_LOOP_14_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010001010;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_4;
      end
      COMP_LOOP_14_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010001011;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_5;
      end
      COMP_LOOP_14_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_6;
      end
      COMP_LOOP_14_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_7;
      end
      COMP_LOOP_14_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_8;
      end
      COMP_LOOP_14_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010001111;
        if ( COMP_LOOP_14_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_16;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b010010000;
        if ( COMP_LOOP_C_16_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_15_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_1;
      end
      COMP_LOOP_15_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_2;
      end
      COMP_LOOP_15_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010010011;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_3;
      end
      COMP_LOOP_15_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010010100;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_4;
      end
      COMP_LOOP_15_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_5;
      end
      COMP_LOOP_15_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_6;
      end
      COMP_LOOP_15_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_7;
      end
      COMP_LOOP_15_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_8;
      end
      COMP_LOOP_15_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010011001;
        if ( COMP_LOOP_15_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_17;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b010011010;
        if ( COMP_LOOP_C_17_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_16_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_1;
      end
      COMP_LOOP_16_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010011100;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_2;
      end
      COMP_LOOP_16_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010011101;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_3;
      end
      COMP_LOOP_16_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_4;
      end
      COMP_LOOP_16_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_5;
      end
      COMP_LOOP_16_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_6;
      end
      COMP_LOOP_16_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_7;
      end
      COMP_LOOP_16_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_8;
      end
      COMP_LOOP_16_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010100011;
        if ( COMP_LOOP_16_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_18;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b010100100;
        if ( COMP_LOOP_C_18_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_17_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_17_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010100101;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_1;
      end
      COMP_LOOP_17_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010100110;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_2;
      end
      COMP_LOOP_17_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_3;
      end
      COMP_LOOP_17_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_4;
      end
      COMP_LOOP_17_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_5;
      end
      COMP_LOOP_17_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_6;
      end
      COMP_LOOP_17_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_7;
      end
      COMP_LOOP_17_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_8;
      end
      COMP_LOOP_17_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010101101;
        if ( COMP_LOOP_17_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_19;
        end
        else begin
          state_var_NS = COMP_LOOP_17_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b010101110;
        if ( COMP_LOOP_C_19_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_18_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_18_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010101111;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_1;
      end
      COMP_LOOP_18_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_2;
      end
      COMP_LOOP_18_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_3;
      end
      COMP_LOOP_18_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_4;
      end
      COMP_LOOP_18_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_5;
      end
      COMP_LOOP_18_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_6;
      end
      COMP_LOOP_18_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_7;
      end
      COMP_LOOP_18_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_8;
      end
      COMP_LOOP_18_VEC_LOOP_C_8 : begin
        fsm_output = 9'b010110111;
        if ( COMP_LOOP_18_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_20;
        end
        else begin
          state_var_NS = COMP_LOOP_18_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b010111000;
        if ( COMP_LOOP_C_20_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_19_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_19_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_1;
      end
      COMP_LOOP_19_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_2;
      end
      COMP_LOOP_19_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_3;
      end
      COMP_LOOP_19_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_4;
      end
      COMP_LOOP_19_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_5;
      end
      COMP_LOOP_19_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_6;
      end
      COMP_LOOP_19_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_7;
      end
      COMP_LOOP_19_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011000000;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_8;
      end
      COMP_LOOP_19_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011000001;
        if ( COMP_LOOP_19_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_21;
        end
        else begin
          state_var_NS = COMP_LOOP_19_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b011000010;
        if ( COMP_LOOP_C_21_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_20_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_20_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_1;
      end
      COMP_LOOP_20_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_2;
      end
      COMP_LOOP_20_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_3;
      end
      COMP_LOOP_20_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_4;
      end
      COMP_LOOP_20_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_5;
      end
      COMP_LOOP_20_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_6;
      end
      COMP_LOOP_20_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011001001;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_7;
      end
      COMP_LOOP_20_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011001010;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_8;
      end
      COMP_LOOP_20_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011001011;
        if ( COMP_LOOP_20_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_22;
        end
        else begin
          state_var_NS = COMP_LOOP_20_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b011001100;
        if ( COMP_LOOP_C_22_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_21_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_21_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_1;
      end
      COMP_LOOP_21_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_2;
      end
      COMP_LOOP_21_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_3;
      end
      COMP_LOOP_21_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_4;
      end
      COMP_LOOP_21_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_5;
      end
      COMP_LOOP_21_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011010010;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_6;
      end
      COMP_LOOP_21_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011010011;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_7;
      end
      COMP_LOOP_21_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_8;
      end
      COMP_LOOP_21_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011010101;
        if ( COMP_LOOP_21_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_23;
        end
        else begin
          state_var_NS = COMP_LOOP_21_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b011010110;
        if ( COMP_LOOP_C_23_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_22_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_22_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_1;
      end
      COMP_LOOP_22_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_2;
      end
      COMP_LOOP_22_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_3;
      end
      COMP_LOOP_22_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_4;
      end
      COMP_LOOP_22_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011011011;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_5;
      end
      COMP_LOOP_22_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011011100;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_6;
      end
      COMP_LOOP_22_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_7;
      end
      COMP_LOOP_22_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_8;
      end
      COMP_LOOP_22_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011011111;
        if ( COMP_LOOP_22_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_24;
        end
        else begin
          state_var_NS = COMP_LOOP_22_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b011100000;
        if ( COMP_LOOP_C_24_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_23_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_23_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_1;
      end
      COMP_LOOP_23_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_2;
      end
      COMP_LOOP_23_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_3;
      end
      COMP_LOOP_23_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011100100;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_4;
      end
      COMP_LOOP_23_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011100101;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_5;
      end
      COMP_LOOP_23_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_6;
      end
      COMP_LOOP_23_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_7;
      end
      COMP_LOOP_23_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_8;
      end
      COMP_LOOP_23_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011101001;
        if ( COMP_LOOP_23_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_25;
        end
        else begin
          state_var_NS = COMP_LOOP_23_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b011101010;
        if ( COMP_LOOP_C_25_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_24_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_24_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_1;
      end
      COMP_LOOP_24_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_2;
      end
      COMP_LOOP_24_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011101101;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_3;
      end
      COMP_LOOP_24_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011101110;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_4;
      end
      COMP_LOOP_24_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_5;
      end
      COMP_LOOP_24_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_6;
      end
      COMP_LOOP_24_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_7;
      end
      COMP_LOOP_24_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_8;
      end
      COMP_LOOP_24_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011110011;
        if ( COMP_LOOP_24_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_26;
        end
        else begin
          state_var_NS = COMP_LOOP_24_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b011110100;
        if ( COMP_LOOP_C_26_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_25_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_25_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_1;
      end
      COMP_LOOP_25_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011110110;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_2;
      end
      COMP_LOOP_25_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011110111;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_3;
      end
      COMP_LOOP_25_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_4;
      end
      COMP_LOOP_25_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_5;
      end
      COMP_LOOP_25_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_6;
      end
      COMP_LOOP_25_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_7;
      end
      COMP_LOOP_25_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_8;
      end
      COMP_LOOP_25_VEC_LOOP_C_8 : begin
        fsm_output = 9'b011111101;
        if ( COMP_LOOP_25_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_27;
        end
        else begin
          state_var_NS = COMP_LOOP_25_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b011111110;
        if ( COMP_LOOP_C_27_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_26_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_26_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011111111;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_1;
      end
      COMP_LOOP_26_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100000000;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_2;
      end
      COMP_LOOP_26_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_3;
      end
      COMP_LOOP_26_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_4;
      end
      COMP_LOOP_26_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_5;
      end
      COMP_LOOP_26_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_6;
      end
      COMP_LOOP_26_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_7;
      end
      COMP_LOOP_26_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_8;
      end
      COMP_LOOP_26_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100000111;
        if ( COMP_LOOP_26_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_28;
        end
        else begin
          state_var_NS = COMP_LOOP_26_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b100001000;
        if ( COMP_LOOP_C_28_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_27_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_27_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100001001;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_1;
      end
      COMP_LOOP_27_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_2;
      end
      COMP_LOOP_27_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_3;
      end
      COMP_LOOP_27_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_4;
      end
      COMP_LOOP_27_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_5;
      end
      COMP_LOOP_27_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_6;
      end
      COMP_LOOP_27_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_7;
      end
      COMP_LOOP_27_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_8;
      end
      COMP_LOOP_27_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100010001;
        if ( COMP_LOOP_27_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_29;
        end
        else begin
          state_var_NS = COMP_LOOP_27_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b100010010;
        if ( COMP_LOOP_C_29_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_28_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_28_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_1;
      end
      COMP_LOOP_28_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_2;
      end
      COMP_LOOP_28_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_3;
      end
      COMP_LOOP_28_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_4;
      end
      COMP_LOOP_28_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_5;
      end
      COMP_LOOP_28_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_6;
      end
      COMP_LOOP_28_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_7;
      end
      COMP_LOOP_28_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100011010;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_8;
      end
      COMP_LOOP_28_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100011011;
        if ( COMP_LOOP_28_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_30;
        end
        else begin
          state_var_NS = COMP_LOOP_28_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b100011100;
        if ( COMP_LOOP_C_30_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_29_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_29_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_1;
      end
      COMP_LOOP_29_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_2;
      end
      COMP_LOOP_29_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_3;
      end
      COMP_LOOP_29_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_4;
      end
      COMP_LOOP_29_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_5;
      end
      COMP_LOOP_29_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_6;
      end
      COMP_LOOP_29_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100100011;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_7;
      end
      COMP_LOOP_29_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100100100;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_8;
      end
      COMP_LOOP_29_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100100101;
        if ( COMP_LOOP_29_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_31;
        end
        else begin
          state_var_NS = COMP_LOOP_29_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b100100110;
        if ( COMP_LOOP_C_31_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_30_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_30_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100100111;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_1;
      end
      COMP_LOOP_30_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100101000;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_2;
      end
      COMP_LOOP_30_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100101001;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_3;
      end
      COMP_LOOP_30_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100101010;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_4;
      end
      COMP_LOOP_30_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100101011;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_5;
      end
      COMP_LOOP_30_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100101100;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_6;
      end
      COMP_LOOP_30_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100101101;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_7;
      end
      COMP_LOOP_30_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100101110;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_8;
      end
      COMP_LOOP_30_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100101111;
        if ( COMP_LOOP_30_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_32;
        end
        else begin
          state_var_NS = COMP_LOOP_30_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b100110000;
        if ( COMP_LOOP_C_32_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_31_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_31_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100110001;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_1;
      end
      COMP_LOOP_31_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100110010;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_2;
      end
      COMP_LOOP_31_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100110011;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_3;
      end
      COMP_LOOP_31_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100110100;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_4;
      end
      COMP_LOOP_31_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100110101;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_5;
      end
      COMP_LOOP_31_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100110110;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_6;
      end
      COMP_LOOP_31_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100110111;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_7;
      end
      COMP_LOOP_31_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100111000;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_8;
      end
      COMP_LOOP_31_VEC_LOOP_C_8 : begin
        fsm_output = 9'b100111001;
        if ( COMP_LOOP_31_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_33;
        end
        else begin
          state_var_NS = COMP_LOOP_31_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b100111010;
        if ( COMP_LOOP_C_33_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_32_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_32_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100111011;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_1;
      end
      COMP_LOOP_32_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100111100;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_2;
      end
      COMP_LOOP_32_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100111101;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_3;
      end
      COMP_LOOP_32_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100111110;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_4;
      end
      COMP_LOOP_32_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100111111;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_5;
      end
      COMP_LOOP_32_VEC_LOOP_C_5 : begin
        fsm_output = 9'b101000000;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_6;
      end
      COMP_LOOP_32_VEC_LOOP_C_6 : begin
        fsm_output = 9'b101000001;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_7;
      end
      COMP_LOOP_32_VEC_LOOP_C_7 : begin
        fsm_output = 9'b101000010;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_8;
      end
      COMP_LOOP_32_VEC_LOOP_C_8 : begin
        fsm_output = 9'b101000011;
        if ( COMP_LOOP_32_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_34;
        end
        else begin
          state_var_NS = COMP_LOOP_32_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b101000100;
        if ( COMP_LOOP_C_34_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 9'b101000101;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b101000110;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 9'b101000111;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 9'b000000000;
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
  clk, rst, twiddle_h_rsci_qa_d, twiddle_h_rsci_qa_d_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt,
      twiddle_h_rsci_biwt_1, twiddle_h_rsci_bdwt_2
);
  input clk;
  input rst;
  input [63:0] twiddle_h_rsci_qa_d;
  output [63:0] twiddle_h_rsci_qa_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;
  input twiddle_h_rsci_biwt_1;
  input twiddle_h_rsci_bdwt_2;


  // Interconnect Declarations
  reg twiddle_h_rsci_bcwt;
  reg twiddle_h_rsci_bcwt_1;
  reg [31:0] twiddle_h_rsci_qa_d_bfwt_63_32;
  reg [31:0] twiddle_h_rsci_qa_d_bfwt_31_0;

  wire[31:0] COMP_LOOP_twiddle_help_mux_2_nl;
  wire[31:0] COMP_LOOP_twiddle_help_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_twiddle_help_mux_2_nl = MUX_v_32_2_2((twiddle_h_rsci_qa_d[63:32]),
      twiddle_h_rsci_qa_d_bfwt_63_32, twiddle_h_rsci_bcwt_1);
  assign COMP_LOOP_twiddle_help_mux_3_nl = MUX_v_32_2_2((twiddle_h_rsci_qa_d[31:0]),
      twiddle_h_rsci_qa_d_bfwt_31_0, twiddle_h_rsci_bcwt);
  assign twiddle_h_rsci_qa_d_mxwt = {COMP_LOOP_twiddle_help_mux_2_nl , COMP_LOOP_twiddle_help_mux_3_nl};
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsci_bcwt <= 1'b0;
      twiddle_h_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      twiddle_h_rsci_bcwt <= ~((~(twiddle_h_rsci_bcwt | twiddle_h_rsci_biwt)) | twiddle_h_rsci_bdwt);
      twiddle_h_rsci_bcwt_1 <= ~((~(twiddle_h_rsci_bcwt_1 | twiddle_h_rsci_biwt_1))
          | twiddle_h_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsci_biwt_1 ) begin
      twiddle_h_rsci_qa_d_bfwt_63_32 <= twiddle_h_rsci_qa_d[63:32];
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
  core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_oswt_1, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_biwt_1, twiddle_h_rsci_bdwt_2,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct, core_wten_pff, twiddle_h_rsci_oswt_1_pff,
      twiddle_h_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  input twiddle_h_rsci_oswt_1;
  input [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_biwt_1;
  output twiddle_h_rsci_bdwt_2;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_1_pff;
  input twiddle_h_rsci_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_8_nl;
  wire[0:0] COMP_LOOP_twiddle_help_and_9_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign twiddle_h_rsci_bdwt_2 = twiddle_h_rsci_oswt_1 & core_wen;
  assign twiddle_h_rsci_biwt_1 = (~ core_wten) & twiddle_h_rsci_oswt_1;
  assign COMP_LOOP_twiddle_help_and_8_nl = (~ core_wten_pff) & twiddle_h_rsci_oswt_1_pff;
  assign COMP_LOOP_twiddle_help_and_9_nl = (~ core_wten_pff) & twiddle_h_rsci_oswt_pff;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({COMP_LOOP_twiddle_help_and_8_nl , COMP_LOOP_twiddle_help_and_9_nl});
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_qa_d, twiddle_rsci_qa_d_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt,
      twiddle_rsci_biwt_1, twiddle_rsci_bdwt_2
);
  input clk;
  input rst;
  input [63:0] twiddle_rsci_qa_d;
  output [63:0] twiddle_rsci_qa_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;
  input twiddle_rsci_biwt_1;
  input twiddle_rsci_bdwt_2;


  // Interconnect Declarations
  reg twiddle_rsci_bcwt;
  reg twiddle_rsci_bcwt_1;
  reg [31:0] twiddle_rsci_qa_d_bfwt_63_32;
  reg [31:0] twiddle_rsci_qa_d_bfwt_31_0;

  wire[31:0] COMP_LOOP_twiddle_f_mux_2_nl;
  wire[31:0] COMP_LOOP_twiddle_f_mux_3_nl;

  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_twiddle_f_mux_2_nl = MUX_v_32_2_2((twiddle_rsci_qa_d[63:32]),
      twiddle_rsci_qa_d_bfwt_63_32, twiddle_rsci_bcwt_1);
  assign COMP_LOOP_twiddle_f_mux_3_nl = MUX_v_32_2_2((twiddle_rsci_qa_d[31:0]), twiddle_rsci_qa_d_bfwt_31_0,
      twiddle_rsci_bcwt);
  assign twiddle_rsci_qa_d_mxwt = {COMP_LOOP_twiddle_f_mux_2_nl , COMP_LOOP_twiddle_f_mux_3_nl};
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsci_bcwt <= 1'b0;
      twiddle_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      twiddle_rsci_bcwt <= ~((~(twiddle_rsci_bcwt | twiddle_rsci_biwt)) | twiddle_rsci_bdwt);
      twiddle_rsci_bcwt_1 <= ~((~(twiddle_rsci_bcwt_1 | twiddle_rsci_biwt_1)) | twiddle_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsci_biwt_1 ) begin
      twiddle_rsci_qa_d_bfwt_63_32 <= twiddle_rsci_qa_d[63:32];
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
  core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_oswt_1, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_biwt_1, twiddle_rsci_bdwt_2,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct, core_wten_pff, twiddle_rsci_oswt_1_pff,
      twiddle_rsci_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  input twiddle_rsci_oswt_1;
  input [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  output twiddle_rsci_biwt_1;
  output twiddle_rsci_bdwt_2;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsci_oswt_1_pff;
  input twiddle_rsci_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_8_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_9_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign twiddle_rsci_bdwt_2 = twiddle_rsci_oswt_1 & core_wen;
  assign twiddle_rsci_biwt_1 = (~ core_wten) & twiddle_rsci_oswt_1;
  assign COMP_LOOP_twiddle_f_and_8_nl = (~ core_wten_pff) & twiddle_rsci_oswt_1_pff;
  assign COMP_LOOP_twiddle_f_and_9_nl = (~ core_wten_pff) & twiddle_rsci_oswt_pff;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({COMP_LOOP_twiddle_f_and_8_nl , COMP_LOOP_twiddle_f_and_9_nl});
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
  clk, rst, twiddle_h_rsci_qa_d, twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_oswt_1, twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, core_wten_pff, twiddle_h_rsci_oswt_1_pff,
      twiddle_h_rsci_oswt_pff
);
  input clk;
  input rst;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  input twiddle_h_rsci_oswt_1;
  output [63:0] twiddle_h_rsci_qa_d_mxwt;
  input [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_1_pff;
  input twiddle_h_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_biwt_1;
  wire twiddle_h_rsci_bdwt_2;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_oswt_1(twiddle_h_rsci_oswt_1),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_biwt_1(twiddle_h_rsci_biwt_1),
      .twiddle_h_rsci_bdwt_2(twiddle_h_rsci_bdwt_2),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsci_oswt_1_pff(twiddle_h_rsci_oswt_1_pff),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_biwt_1(twiddle_h_rsci_biwt_1),
      .twiddle_h_rsci_bdwt_2(twiddle_h_rsci_bdwt_2)
    );
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_qa_d, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, twiddle_rsci_oswt, twiddle_rsci_oswt_1, twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, core_wten_pff, twiddle_rsci_oswt_1_pff,
      twiddle_rsci_oswt_pff
);
  input clk;
  input rst;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  input twiddle_rsci_oswt_1;
  output [63:0] twiddle_rsci_qa_d_mxwt;
  input [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsci_oswt_1_pff;
  input twiddle_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_biwt_1;
  wire twiddle_rsci_bdwt_2;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_oswt_1(twiddle_rsci_oswt_1),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_biwt_1(twiddle_rsci_biwt_1),
      .twiddle_rsci_bdwt_2(twiddle_rsci_bdwt_2),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsci_oswt_1_pff(twiddle_rsci_oswt_1_pff),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_biwt_1(twiddle_rsci_biwt_1),
      .twiddle_rsci_bdwt_2(twiddle_rsci_bdwt_2)
    );
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
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
  output [23:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [23:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;


  // Interconnect Declarations
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire [63:0] vec_rsci_qa_d_mxwt;
  wire [31:0] p_rsci_idat;
  wire [63:0] twiddle_rsci_qa_d_mxwt;
  wire [63:0] twiddle_h_rsci_qa_d_mxwt;
  wire complete_rsci_wen_comp;
  wire [31:0] COMP_LOOP_1_modulo_sub_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_add_cmp_return_rsc_z;
  wire [31:0] COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [8:0] fsm_output;
  wire or_tmp_25;
  wire and_tmp_2;
  wire nor_tmp_7;
  wire or_tmp_36;
  wire or_tmp_37;
  wire or_tmp_56;
  wire or_tmp_57;
  wire nor_tmp_15;
  wire or_dcpl_159;
  wire or_tmp_130;
  wire mux_tmp_278;
  wire mux_tmp_280;
  wire or_tmp_133;
  wire mux_tmp_281;
  wire mux_tmp_282;
  wire or_tmp_134;
  wire mux_tmp_285;
  wire mux_tmp_286;
  wire mux_tmp_287;
  wire mux_tmp_288;
  wire mux_tmp_290;
  wire mux_tmp_292;
  wire mux_tmp_297;
  wire mux_tmp_298;
  wire or_tmp_141;
  wire or_tmp_142;
  wire mux_tmp_312;
  wire or_tmp_145;
  wire mux_tmp_314;
  wire mux_tmp_316;
  wire mux_tmp_318;
  wire and_dcpl_11;
  wire and_dcpl_12;
  wire and_dcpl_13;
  wire and_dcpl_14;
  wire and_dcpl_15;
  wire and_dcpl_16;
  wire and_dcpl_17;
  wire and_dcpl_18;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_23;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire mux_tmp_343;
  wire or_tmp_157;
  wire or_tmp_160;
  wire mux_tmp_346;
  wire mux_tmp_347;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire mux_tmp_355;
  wire mux_tmp_356;
  wire mux_tmp_358;
  wire mux_tmp_360;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire mux_tmp_361;
  wire mux_tmp_362;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire xor_dcpl;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire and_dcpl_90;
  wire and_dcpl_91;
  wire and_dcpl_92;
  wire and_dcpl_93;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_97;
  wire and_dcpl_98;
  wire and_dcpl_99;
  wire and_dcpl_100;
  wire and_dcpl_102;
  wire or_tmp_169;
  wire or_tmp_170;
  wire and_dcpl_105;
  wire mux_tmp_366;
  wire mux_tmp_367;
  wire mux_tmp_386;
  wire mux_tmp_387;
  wire mux_tmp_393;
  wire mux_tmp_395;
  wire mux_tmp_404;
  wire mux_tmp_409;
  wire mux_tmp_416;
  wire or_tmp_206;
  wire or_tmp_214;
  wire or_tmp_221;
  wire mux_tmp_429;
  wire mux_tmp_438;
  wire mux_tmp_445;
  wire mux_tmp_450;
  wire or_tmp_231;
  wire or_tmp_232;
  wire mux_tmp_457;
  wire or_tmp_233;
  wire or_tmp_234;
  wire not_tmp_151;
  wire or_tmp_237;
  wire mux_tmp_463;
  wire mux_tmp_464;
  wire mux_tmp_482;
  wire or_tmp_250;
  wire mux_tmp_487;
  wire and_dcpl_125;
  wire and_dcpl_132;
  wire and_dcpl_133;
  wire and_dcpl_136;
  wire and_dcpl_144;
  wire mux_tmp_506;
  wire mux_tmp_510;
  wire and_dcpl_164;
  wire and_dcpl_166;
  wire and_dcpl_168;
  wire not_tmp_164;
  wire or_tmp_278;
  wire or_tmp_280;
  wire mux_tmp_518;
  wire mux_tmp_520;
  wire mux_tmp_521;
  wire mux_tmp_522;
  wire mux_tmp_523;
  wire mux_tmp_524;
  wire mux_tmp_525;
  wire mux_tmp_527;
  wire mux_tmp_528;
  wire mux_tmp_529;
  wire or_tmp_285;
  wire mux_tmp_537;
  wire or_tmp_289;
  wire and_dcpl_170;
  wire nor_tmp_52;
  wire mux_tmp_561;
  wire mux_tmp_564;
  wire mux_tmp_568;
  wire and_dcpl_176;
  wire and_dcpl_181;
  wire mux_tmp_574;
  wire or_tmp_312;
  wire mux_tmp_578;
  wire mux_tmp_579;
  wire mux_tmp_583;
  wire mux_tmp_584;
  wire nor_tmp_65;
  wire mux_tmp_604;
  wire and_dcpl_196;
  wire mux_tmp_628;
  wire mux_tmp_629;
  wire mux_tmp_630;
  wire mux_tmp_633;
  wire mux_tmp_634;
  wire mux_tmp_640;
  wire mux_tmp_642;
  wire mux_tmp_647;
  wire mux_tmp_652;
  wire mux_tmp_657;
  wire or_tmp_350;
  wire or_tmp_351;
  wire or_tmp_353;
  wire and_dcpl_201;
  wire or_tmp_379;
  wire mux_tmp_728;
  wire mux_tmp_730;
  wire mux_tmp_731;
  wire mux_tmp_733;
  wire mux_tmp_744;
  wire or_tmp_386;
  wire and_dcpl_205;
  wire mux_tmp_762;
  wire mux_tmp_764;
  wire and_dcpl_206;
  wire or_tmp_425;
  wire mux_tmp_817;
  wire mux_tmp_822;
  wire mux_tmp_823;
  wire nand_tmp_12;
  reg COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  reg [11:0] VEC_LOOP_acc_1_cse_10_sva;
  reg [12:0] STAGE_LOOP_lshift_psp_sva;
  reg [12:0] VEC_LOOP_j_10_12_0_sva_1;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_twiddle_rsci_oswt_1_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_2_cse;
  wire or_496_cse;
  wire and_248_cse;
  wire or_203_cse;
  wire or_555_cse;
  wire or_439_cse;
  wire or_414_cse;
  wire or_316_cse;
  wire nor_124_cse;
  wire mux_268_cse;
  wire or_471_cse;
  wire and_236_cse;
  wire or_556_cse;
  wire or_655_cse;
  wire mux_311_cse;
  wire mux_315_cse;
  wire mux_379_cse;
  wire mux_493_cse;
  wire mux_335_cse;
  wire mux_354_cse;
  wire mux_603_cse;
  wire mux_364_cse;
  wire mux_365_cse;
  wire mux_370_cse;
  wire mux_913_cse;
  wire mux_322_cse;
  wire mux_555_cse;
  wire mux_552_cse;
  wire mux_432_cse;
  wire mux_368_cse;
  wire nand_4_cse;
  wire nand_3_cse;
  wire or_352_cse;
  wire mux_430_cse;
  wire mux_424_cse;
  wire mux_371_cse;
  wire or_653_cse;
  wire mux_915_cse;
  wire mux_323_cse;
  wire mux_320_cse;
  wire mux_553_cse;
  wire mux_798_cse;
  wire mux_376_cse;
  wire mux_381_cse;
  wire mux_377_cse;
  wire mux_382_cse;
  wire mux_806_cse;
  wire mux_324_cse;
  wire mux_321_cse;
  wire mux_431_cse;
  wire mux_886_cse;
  wire [31:0] vec_rsci_da_d_reg;
  wire [1:0] vec_rsci_wea_d_reg;
  wire core_wten_iff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_14_rmff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [7:0] COMP_LOOP_twiddle_help_mux_1_rmff;
  wire [3:0] COMP_LOOP_twiddle_help_mux_rmff;
  wire [6:0] COMP_LOOP_twiddle_f_mux1h_87_rmff;
  wire [1:0] COMP_LOOP_and_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_57_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_110_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_126_rmff;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_128_rmff;
  wire and_123_rmff;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  reg [31:0] factor1_1_sva;
  reg [31:0] VEC_LOOP_mult_vec_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_17_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_17_sva;
  wire [11:0] VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  reg [11:0] VEC_LOOP_acc_10_cse_1_sva;
  wire [11:0] VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [11:0] VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [11:0] VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [11:0] VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [11:0] VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [11:0] VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [11:0] VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [11:0] VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [11:0] VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [11:0] VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [11:0] VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [11:0] VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [11:0] VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  reg [7:0] COMP_LOOP_17_twiddle_f_mul_psp_sva;
  wire [11:0] VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [11:0] VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [11:0] VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [11:0] VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [11:0] VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [11:0] VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [11:0] VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [11:0] VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [11:0] VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [11:0] VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [11:0] VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [11:0] VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [11:0] VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [11:0] VEC_LOOP_acc_10_cse_sva_mx0w31;
  wire [12:0] nl_VEC_LOOP_acc_10_cse_sva_mx0w31;
  reg [31:0] p_sva;
  wire mux_310_itm;
  wire mux_456_itm;
  wire mux_536_itm;
  wire mux_415_itm;
  wire [12:0] z_out;
  wire [9:0] z_out_1;
  wire and_dcpl_256;
  wire [11:0] z_out_2;
  wire [23:0] nl_z_out_2;
  wire and_dcpl_262;
  wire and_dcpl_264;
  wire and_dcpl_269;
  wire and_dcpl_271;
  wire and_dcpl_273;
  wire and_dcpl_278;
  wire [11:0] z_out_3;
  wire [23:0] nl_z_out_3;
  wire and_dcpl_291;
  wire and_dcpl_296;
  wire and_dcpl_302;
  wire [11:0] z_out_4;
  wire [23:0] nl_z_out_4;
  wire and_dcpl_305;
  wire and_dcpl_310;
  wire and_dcpl_315;
  wire and_dcpl_318;
  wire and_dcpl_322;
  wire and_dcpl_326;
  wire [11:0] z_out_6;
  wire [23:0] nl_z_out_6;
  wire and_dcpl_353;
  wire and_dcpl_358;
  wire and_dcpl_365;
  wire and_dcpl_370;
  wire and_dcpl_376;
  wire and_dcpl_384;
  wire and_dcpl_386;
  wire and_dcpl_389;
  wire and_dcpl_395;
  wire and_dcpl_398;
  wire [11:0] z_out_8;
  wire [23:0] nl_z_out_8;
  wire and_dcpl_412;
  wire and_dcpl_414;
  wire and_dcpl_418;
  wire and_dcpl_423;
  wire [11:0] z_out_9;
  wire [23:0] nl_z_out_9;
  wire and_dcpl_438;
  wire [3:0] z_out_10;
  wire [4:0] nl_z_out_10;
  wire and_dcpl_455;
  wire and_dcpl_460;
  wire and_dcpl_464;
  wire and_dcpl_469;
  wire and_dcpl_473;
  wire and_dcpl_476;
  wire and_dcpl_477;
  wire and_dcpl_481;
  wire and_dcpl_484;
  wire and_dcpl_486;
  wire and_dcpl_488;
  wire and_dcpl_489;
  wire and_dcpl_491;
  wire and_dcpl_493;
  wire and_dcpl_495;
  wire and_dcpl_496;
  wire and_dcpl_498;
  wire and_dcpl_500;
  wire and_dcpl_502;
  wire and_dcpl_503;
  wire and_dcpl_505;
  wire and_dcpl_507;
  wire and_dcpl_509;
  wire and_dcpl_511;
  wire [11:0] z_out_12;
  wire [12:0] nl_z_out_12;
  wire and_dcpl_517;
  wire and_dcpl_529;
  wire and_dcpl_534;
  wire and_dcpl_541;
  wire and_dcpl_549;
  wire and_dcpl_556;
  wire and_dcpl_565;
  wire and_dcpl_570;
  wire and_dcpl_575;
  wire and_dcpl_578;
  wire and_dcpl_583;
  wire [11:0] z_out_13;
  wire [12:0] nl_z_out_13;
  wire and_dcpl_588;
  wire and_dcpl_593;
  wire and_dcpl_595;
  wire and_dcpl_599;
  wire and_dcpl_602;
  wire and_dcpl_606;
  wire and_dcpl_609;
  wire and_dcpl_612;
  wire and_dcpl_616;
  wire and_dcpl_618;
  wire and_dcpl_623;
  wire [10:0] z_out_14;
  wire [11:0] nl_z_out_14;
  wire and_dcpl_626;
  wire and_dcpl_631;
  wire and_dcpl_636;
  wire and_dcpl_641;
  wire and_dcpl_649;
  wire and_dcpl_652;
  wire and_dcpl_656;
  wire and_dcpl_661;
  wire and_dcpl_663;
  wire and_dcpl_666;
  wire and_dcpl_668;
  wire and_dcpl_671;
  wire and_dcpl_674;
  wire and_dcpl_677;
  wire and_dcpl_678;
  wire and_dcpl_681;
  wire and_dcpl_682;
  wire and_dcpl_684;
  wire and_dcpl_686;
  wire and_dcpl_690;
  wire and_dcpl_693;
  wire and_dcpl_695;
  wire and_dcpl_697;
  wire and_dcpl_699;
  wire and_dcpl_701;
  wire and_dcpl_702;
  wire [12:0] z_out_16;
  wire and_dcpl_705;
  wire [31:0] z_out_18;
  wire and_dcpl_758;
  wire and_dcpl_763;
  wire and_dcpl_765;
  wire and_dcpl_767;
  wire and_dcpl_772;
  wire and_dcpl_776;
  wire and_dcpl_780;
  wire and_dcpl_782;
  wire and_dcpl_784;
  wire and_dcpl_787;
  wire and_dcpl_789;
  wire and_dcpl_791;
  wire and_dcpl_793;
  wire and_dcpl_795;
  wire [9:0] z_out_19;
  wire and_dcpl_803;
  wire and_dcpl_807;
  wire and_dcpl_812;
  wire and_dcpl_816;
  wire [8:0] z_out_20;
  wire [9:0] nl_z_out_20;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  reg [9:0] COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  reg [6:0] COMP_LOOP_k_12_5_sva_6_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [10:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
  wire [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c2;
  wire VEC_LOOP_or_5_ssc;
  wire COMP_LOOP_or_cse;
  wire COMP_LOOP_or_2_cse;
  wire COMP_LOOP_or_1_cse;
  wire COMP_LOOP_or_4_cse;
  wire COMP_LOOP_or_3_cse;
  wire COMP_LOOP_or_6_cse;
  wire COMP_LOOP_or_7_cse;
  wire COMP_LOOP_or_5_cse;
  wire VEC_LOOP_or_29_cse;
  wire VEC_LOOP_or_10_cse;
  wire VEC_LOOP_or_12_cse;
  wire VEC_LOOP_or_30_cse;
  wire VEC_LOOP_or_22_cse;
  wire nor_171_cse;
  wire VEC_LOOP_or_4_ssc;
  wire VEC_LOOP_or_37_ssc;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire and_524_cse;
  wire nor_175_cse;
  wire [8:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt;
  wire or_tmp_512;
  wire [10:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_rgt;
  wire or_tmp_519;
  wire mux_tmp_966;
  wire not_tmp_420;
  wire or_tmp_525;
  wire or_tmp_526;
  wire mux_tmp_983;
  wire nand_tmp_21;
  wire mux_tmp_984;
  wire or_tmp_539;
  wire mux_tmp_985;
  wire mux_tmp_987;
  wire mux_tmp_988;
  wire mux_tmp_989;
  wire and_tmp;
  wire mux_tmp_999;
  wire or_tmp_551;
  wire mux_tmp_1002;
  wire mux_tmp_1008;
  wire or_tmp_558;
  wire or_tmp_560;
  wire and_tmp_4;
  wire or_tmp_562;
  wire or_tmp_564;
  reg [3:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_10_7;
  reg [6:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0;
  reg VEC_LOOP_acc_11_psp_sva_10;
  reg VEC_LOOP_acc_11_psp_sva_9;
  reg [8:0] VEC_LOOP_acc_11_psp_sva_8_0;
  reg [4:0] COMP_LOOP_9_twiddle_f_lshift_ncse_sva_8_4;
  reg [3:0] COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0;
  wire mux_894_ssc;
  wire or_706_cse;
  wire and_918_cse;
  wire and_241_cse_1;
  wire and_916_cse;
  wire or_715_cse;
  wire and_261_cse;
  wire or_741_cse;
  wire and_919_cse;
  wire COMP_LOOP_twiddle_f_or_35_itm;
  wire COMP_LOOP_twiddle_f_nor_8_itm;
  wire COMP_LOOP_twiddle_f_or_36_itm;
  wire VEC_LOOP_or_42_itm;
  wire COMP_LOOP_nor_itm;
  wire VEC_LOOP_or_48_itm;
  wire VEC_LOOP_or_35_itm;
  wire VEC_LOOP_or_53_itm;
  wire VEC_LOOP_or_54_itm;
  wire VEC_LOOP_or_64_itm;
  wire [9:0] z_out_5_9_0;
  wire [19:0] nl_z_out_5_9_0;
  wire [10:0] z_out_7_10_0;
  wire [21:0] nl_z_out_7_10_0;
  wire [8:0] z_out_11_20_12;
  wire [2:0] z_out_15_12_10;
  wire z_out_17_12;

  wire[0:0] mux_309_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] or_301_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] mux_300_nl;
  wire[0:0] mux_299_nl;
  wire[0:0] mux_295_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] mux_325_nl;
  wire[0:0] nand_33_nl;
  wire[0:0] or_350_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] mux_454_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] mux_452_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] or_404_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] or_402_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] or_401_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] nor_120_nl;
  wire[0:0] mux_15_nl;
  wire[1:0] COMP_LOOP_mux1h_nl;
  wire[0:0] COMP_LOOP_twiddle_f_nor_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] mux_488_nl;
  wire[0:0] mux_484_nl;
  wire[0:0] mux_483_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_57_nl;
  wire[0:0] mux_499_nl;
  wire[0:0] nor_118_nl;
  wire[0:0] mux_498_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] and_260_nl;
  wire[0:0] and_161_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_110_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] mux_504_nl;
  wire[0:0] nor_113_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] mux_502_nl;
  wire[0:0] or_426_nl;
  wire[0:0] or_425_nl;
  wire[0:0] or_423_nl;
  wire[0:0] mux_501_nl;
  wire[0:0] nor_114_nl;
  wire[0:0] mux_500_nl;
  wire[0:0] nor_115_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] not_995_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_126_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] or_440_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] or_438_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] or_435_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] or_434_nl;
  wire[0:0] or_433_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] or_432_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] mux_565_nl;
  wire[0:0] and_251_nl;
  wire[0:0] COMP_LOOP_k_not_nl;
  wire[0:0] mux_956_nl;
  wire[0:0] mux_955_nl;
  wire[0:0] mux_954_nl;
  wire[0:0] mux_953_nl;
  wire[0:0] mux_952_nl;
  wire[0:0] mux_nl;
  wire[7:0] COMP_LOOP_17_twiddle_f_mul_nl;
  wire[15:0] nl_COMP_LOOP_17_twiddle_f_mul_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] mux_587_nl;
  wire[0:0] mux_586_nl;
  wire[0:0] mux_585_nl;
  wire[0:0] mux_580_nl;
  wire[0:0] or_482_nl;
  wire[0:0] and_194_nl;
  wire[0:0] mux_958_nl;
  wire[0:0] mux_957_nl;
  wire[0:0] or_707_nl;
  wire[0:0] mux_960_nl;
  wire[0:0] nor_222_nl;
  wire[0:0] mux_959_nl;
  wire[0:0] or_710_nl;
  wire[0:0] or_709_nl;
  wire[6:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_8_nl;
  wire[6:0] COMP_LOOP_1_twiddle_f_mul_nl;
  wire[13:0] nl_COMP_LOOP_1_twiddle_f_mul_nl;
  wire[0:0] mux_963_nl;
  wire[0:0] mux_962_nl;
  wire[0:0] mux_961_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] mux_965_nl;
  wire[0:0] mux_964_nl;
  wire[0:0] or_767_nl;
  wire[0:0] or_768_nl;
  wire[0:0] or_769_nl;
  wire[0:0] mux_608_nl;
  wire[0:0] mux_607_nl;
  wire[0:0] mux_606_nl;
  wire[0:0] and_239_nl;
  wire[0:0] mux_605_nl;
  wire[0:0] or_477_nl;
  wire[0:0] mux_666_nl;
  wire[0:0] mux_665_nl;
  wire[0:0] mux_664_nl;
  wire[0:0] mux_663_nl;
  wire[0:0] mux_662_nl;
  wire[0:0] or_515_nl;
  wire[0:0] or_514_nl;
  wire[0:0] mux_661_nl;
  wire[0:0] mux_660_nl;
  wire[0:0] mux_659_nl;
  wire[0:0] mux_658_nl;
  wire[0:0] mux_656_nl;
  wire[0:0] mux_655_nl;
  wire[0:0] mux_654_nl;
  wire[0:0] mux_653_nl;
  wire[0:0] mux_650_nl;
  wire[0:0] mux_649_nl;
  wire[0:0] mux_648_nl;
  wire[0:0] mux_645_nl;
  wire[0:0] mux_644_nl;
  wire[0:0] mux_643_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] or_510_nl;
  wire[31:0] VEC_LOOP_mux1h_12_nl;
  wire[0:0] and_203_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] mux_673_nl;
  wire[0:0] mux_672_nl;
  wire[0:0] or_523_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_671_nl;
  wire[0:0] or_128_nl;
  wire[0:0] mux_670_nl;
  wire[0:0] mux_669_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] or_519_nl;
  wire[0:0] mux_667_nl;
  wire[0:0] or_516_nl;
  wire[0:0] COMP_LOOP_twiddle_f_nand_nl;
  wire[0:0] mux_982_nl;
  wire[0:0] mux_981_nl;
  wire[0:0] mux_980_nl;
  wire[0:0] mux_979_nl;
  wire[0:0] mux_978_nl;
  wire[0:0] nand_49_nl;
  wire[0:0] mux_977_nl;
  wire[0:0] or_738_nl;
  wire[0:0] mux_976_nl;
  wire[0:0] or_737_nl;
  wire[0:0] or_766_nl;
  wire[0:0] or_735_nl;
  wire[0:0] mux_975_nl;
  wire[0:0] mux_974_nl;
  wire[0:0] or_734_nl;
  wire[0:0] or_732_nl;
  wire[0:0] or_730_nl;
  wire[0:0] or_728_nl;
  wire[0:0] mux_973_nl;
  wire[0:0] mux_972_nl;
  wire[0:0] mux_971_nl;
  wire[0:0] mux_970_nl;
  wire[0:0] mux_969_nl;
  wire[0:0] mux_968_nl;
  wire[0:0] or_725_nl;
  wire[0:0] nand_47_nl;
  wire[0:0] mux_967_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] and_913_nl;
  wire[0:0] VEC_LOOP_or_28_nl;
  wire[0:0] mux_755_nl;
  wire[0:0] mux_754_nl;
  wire[0:0] mux_753_nl;
  wire[0:0] mux_752_nl;
  wire[0:0] mux_751_nl;
  wire[0:0] mux_750_nl;
  wire[0:0] or_558_nl;
  wire[0:0] mux_749_nl;
  wire[0:0] mux_748_nl;
  wire[0:0] mux_747_nl;
  wire[0:0] mux_746_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] mux_745_nl;
  wire[0:0] mux_743_nl;
  wire[0:0] mux_742_nl;
  wire[0:0] mux_741_nl;
  wire[0:0] mux_740_nl;
  wire[0:0] mux_739_nl;
  wire[0:0] mux_738_nl;
  wire[0:0] mux_737_nl;
  wire[0:0] mux_736_nl;
  wire[0:0] mux_735_nl;
  wire[0:0] mux_734_nl;
  wire[0:0] mux_732_nl;
  wire[0:0] mux_729_nl;
  wire[0:0] mux_726_nl;
  wire[0:0] mux_797_nl;
  wire[0:0] and_211_nl;
  wire[0:0] mux_800_nl;
  wire[0:0] mux_796_nl;
  wire[0:0] mux_795_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_2_nl;
  wire[0:0] VEC_LOOP_not_nl;
  wire[0:0] mux_885_nl;
  wire[0:0] mux_884_nl;
  wire[0:0] mux_883_nl;
  wire[0:0] mux_882_nl;
  wire[0:0] mux_881_nl;
  wire[0:0] mux_888_nl;
  wire[0:0] mux_887_nl;
  wire[0:0] mux_597_nl;
  wire[0:0] or_634_nl;
  wire[0:0] or_632_nl;
  wire[0:0] mux_818_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] mux_917_nl;
  wire[0:0] or_660_nl;
  wire[0:0] mux_916_nl;
  wire[0:0] or_659_nl;
  wire[0:0] or_658_nl;
  wire[0:0] and_223_nl;
  wire[0:0] mux_996_nl;
  wire[0:0] mux_995_nl;
  wire[0:0] mux_994_nl;
  wire[0:0] mux_993_nl;
  wire[0:0] mux_992_nl;
  wire[0:0] or_747_nl;
  wire[0:0] or_746_nl;
  wire[0:0] or_744_nl;
  wire[0:0] mux_991_nl;
  wire[0:0] mux_990_nl;
  wire[0:0] or_743_nl;
  wire[0:0] mux_1007_nl;
  wire[0:0] mux_1006_nl;
  wire[0:0] mux_1005_nl;
  wire[0:0] mux_1004_nl;
  wire[0:0] mux_1003_nl;
  wire[0:0] or_758_nl;
  wire[0:0] or_755_nl;
  wire[0:0] or_754_nl;
  wire[0:0] mux_1001_nl;
  wire[0:0] mux_1000_nl;
  wire[0:0] or_753_nl;
  wire[0:0] VEC_LOOP_or_65_nl;
  wire[0:0] mux_895_nl;
  wire[0:0] mux_575_nl;
  wire[0:0] mux_594_nl;
  wire[0:0] mux_1017_nl;
  wire[0:0] mux_1016_nl;
  wire[0:0] mux_1015_nl;
  wire[0:0] mux_1014_nl;
  wire[0:0] mux_1013_nl;
  wire[0:0] or_764_nl;
  wire[0:0] mux_1012_nl;
  wire[0:0] or_762_nl;
  wire[0:0] mux_1011_nl;
  wire[0:0] mux_1010_nl;
  wire[0:0] mux_1009_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] or_297_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] or_300_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] or_323_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] mux_391_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] mux_413_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] mux_401_nl;
  wire[0:0] or_367_nl;
  wire[0:0] or_366_nl;
  wire[0:0] mux_449_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] or_398_nl;
  wire[0:0] or_397_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] mux_519_nl;
  wire[0:0] or_445_nl;
  wire[0:0] or_446_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] mux_543_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] mux_563_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] and_258_nl;
  wire[0:0] mux_567_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] mux_577_nl;
  wire[0:0] mux_582_nl;
  wire[0:0] mux_581_nl;
  wire[0:0] or_484_nl;
  wire[0:0] or_678_nl;
  wire[0:0] mux_130_nl;
  wire[0:0] mux_639_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] mux_641_nl;
  wire[0:0] mux_646_nl;
  wire[0:0] or_513_nl;
  wire[0:0] mux_651_nl;
  wire[0:0] mux_708_nl;
  wire[0:0] mux_707_nl;
  wire[0:0] or_536_nl;
  wire[0:0] mux_706_nl;
  wire[0:0] mux_705_nl;
  wire[0:0] and_225_nl;
  wire[0:0] mux_756_nl;
  wire[0:0] nor_98_nl;
  wire[0:0] nor_104_nl;
  wire[0:0] mux_761_nl;
  wire[0:0] mux_759_nl;
  wire[0:0] mux_772_nl;
  wire[0:0] mux_771_nl;
  wire[0:0] mux_770_nl;
  wire[0:0] mux_769_nl;
  wire[0:0] mux_767_nl;
  wire[0:0] mux_766_nl;
  wire[0:0] mux_765_nl;
  wire[0:0] mux_803_nl;
  wire[0:0] mux_801_nl;
  wire[0:0] or_596_nl;
  wire[0:0] mux_909_nl;
  wire[0:0] mux_833_nl;
  wire[0:0] mux_832_nl;
  wire[0:0] mux_831_nl;
  wire[0:0] mux_830_nl;
  wire[0:0] mux_829_nl;
  wire[0:0] mux_828_nl;
  wire[0:0] mux_827_nl;
  wire[0:0] mux_826_nl;
  wire[0:0] mux_825_nl;
  wire[0:0] or_605_nl;
  wire[0:0] mux_824_nl;
  wire[0:0] or_603_nl;
  wire[7:0] VEC_LOOP_mux1h_10_nl;
  wire[0:0] VEC_LOOP_mux1h_8_nl;
  wire[0:0] VEC_LOOP_mux1h_6_nl;
  wire[0:0] and_116_nl;
  wire[0:0] VEC_LOOP_mux1h_4_nl;
  wire[0:0] and_114_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] VEC_LOOP_mux1h_2_nl;
  wire[0:0] and_110_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] mux_369_nl;
  wire[6:0] VEC_LOOP_mux1h_nl;
  wire[0:0] and_26_nl;
  wire[0:0] VEC_LOOP_mux1h_1_nl;
  wire[0:0] VEC_LOOP_mux1h_3_nl;
  wire[0:0] and_111_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] or_343_nl;
  wire[0:0] VEC_LOOP_mux1h_5_nl;
  wire[0:0] and_115_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] or_686_nl;
  wire[0:0] VEC_LOOP_mux1h_7_nl;
  wire[0:0] and_117_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] or_356_nl;
  wire[0:0] VEC_LOOP_mux1h_9_nl;
  wire[0:0] and_118_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] or_722_nl;
  wire[0:0] or_739_nl;
  wire[0:0] mux_986_nl;
  wire[0:0] or_742_nl;
  wire[0:0] mux_998_nl;
  wire[0:0] or_750_nl;
  wire[0:0] mux_997_nl;
  wire[0:0] nand_51_nl;
  wire[0:0] or_749_nl;
  wire[0:0] or_757_nl;
  wire[0:0] nand_52_nl;
  wire[11:0] COMP_LOOP_twiddle_f_mux_10_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl;
  wire[5:0] COMP_LOOP_twiddle_f_mux_11_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl;
  wire[11:0] COMP_LOOP_twiddle_f_mux1h_292_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl;
  wire[1:0] COMP_LOOP_twiddle_f_mux_12_nl;
  wire[0:0] COMP_LOOP_twiddle_f_nor_13_nl;
  wire[6:0] COMP_LOOP_twiddle_f_mux1h_293_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl;
  wire[1:0] COMP_LOOP_twiddle_f_mux_13_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_45_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl;
  wire[3:0] COMP_LOOP_twiddle_f_mux1h_294_nl;
  wire[0:0] and_922_nl;
  wire[0:0] and_923_nl;
  wire[0:0] and_924_nl;
  wire[0:0] and_925_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_10_nl;
  wire[10:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_9_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_11_nl;
  wire[5:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_10_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_22_nl;
  wire[1:0] COMP_LOOP_twiddle_f_or_46_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_47_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_48_nl;
  wire[3:0] STAGE_LOOP_mux_4_nl;
  wire[21:0] acc_1_nl;
  wire[22:0] nl_acc_1_nl;
  wire[19:0] VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_or_66_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl;
  wire[7:0] VEC_LOOP_mux1h_42_nl;
  wire[0:0] VEC_LOOP_mux1h_43_nl;
  wire[0:0] VEC_LOOP_or_67_nl;
  wire[2:0] VEC_LOOP_VEC_LOOP_mux_12_nl;
  wire[6:0] VEC_LOOP_mux1h_44_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_18_nl;
  wire[0:0] VEC_LOOP_mux_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_19_nl;
  wire[0:0] VEC_LOOP_mux_12_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_20_nl;
  wire[0:0] VEC_LOOP_mux_13_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_21_nl;
  wire[0:0] VEC_LOOP_mux_14_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_22_nl;
  wire[0:0] VEC_LOOP_mux_15_nl;
  wire[4:0] VEC_LOOP_or_68_nl;
  wire[4:0] VEC_LOOP_mux1h_45_nl;
  wire[0:0] and_927_nl;
  wire[0:0] and_928_nl;
  wire[0:0] and_929_nl;
  wire[0:0] and_930_nl;
  wire[0:0] and_931_nl;
  wire[0:0] and_932_nl;
  wire[0:0] and_933_nl;
  wire[0:0] and_934_nl;
  wire[0:0] and_935_nl;
  wire[0:0] and_936_nl;
  wire[0:0] and_937_nl;
  wire[0:0] and_938_nl;
  wire[0:0] and_939_nl;
  wire[0:0] and_940_nl;
  wire[0:0] and_941_nl;
  wire[0:0] and_942_nl;
  wire[0:0] and_943_nl;
  wire[0:0] and_944_nl;
  wire[0:0] and_945_nl;
  wire[0:0] and_946_nl;
  wire[0:0] and_947_nl;
  wire[0:0] and_948_nl;
  wire[0:0] and_949_nl;
  wire[0:0] and_950_nl;
  wire[0:0] and_951_nl;
  wire[0:0] and_952_nl;
  wire[0:0] and_953_nl;
  wire[0:0] and_954_nl;
  wire[10:0] VEC_LOOP_VEC_LOOP_mux_13_nl;
  wire[6:0] VEC_LOOP_and_28_nl;
  wire[0:0] not_1233_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_23_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_24_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_25_nl;
  wire[13:0] acc_5_nl;
  wire[14:0] nl_acc_5_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_3_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_mux_3_nl;
  wire[9:0] COMP_LOOP_COMP_LOOP_mux_4_nl;
  wire[1:0] COMP_LOOP_COMP_LOOP_and_1_nl;
  wire[6:0] COMP_LOOP_COMP_LOOP_mux_5_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_4_nl;
  wire[0:0] COMP_LOOP_COMP_LOOP_or_5_nl;
  wire[13:0] acc_6_nl;
  wire[14:0] nl_acc_6_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_26_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_14_nl;
  wire[0:0] VEC_LOOP_or_69_nl;
  wire[6:0] VEC_LOOP_VEC_LOOP_mux_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_27_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_28_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_29_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_30_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_31_nl;
  wire[13:0] acc_7_nl;
  wire[14:0] nl_acc_7_nl;
  wire[4:0] COMP_LOOP_mux1h_7_nl;
  wire[0:0] and_955_nl;
  wire[0:0] and_956_nl;
  wire[0:0] and_957_nl;
  wire[0:0] and_958_nl;
  wire[0:0] and_959_nl;
  wire[0:0] and_960_nl;
  wire[0:0] and_961_nl;
  wire[0:0] and_962_nl;
  wire[32:0] acc_8_nl;
  wire[33:0] nl_acc_8_nl;
  wire[31:0] VEC_LOOP_mux_16_nl;
  wire[0:0] VEC_LOOP_or_70_nl;
  wire[31:0] VEC_LOOP_mux_17_nl;
  wire[10:0] acc_9_nl;
  wire[11:0] nl_acc_9_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_32_nl;
  wire[8:0] VEC_LOOP_mux1h_46_nl;
  wire[0:0] VEC_LOOP_or_71_nl;
  wire[0:0] VEC_LOOP_or_72_nl;
  wire[0:0] VEC_LOOP_or_73_nl;
  wire[0:0] VEC_LOOP_and_35_nl;
  wire[0:0] VEC_LOOP_and_36_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_16_nl;
  wire[0:0] VEC_LOOP_and_37_nl;
  wire[0:0] VEC_LOOP_mux1h_47_nl;
  wire[3:0] VEC_LOOP_mux1h_48_nl;
  wire[0:0] VEC_LOOP_or_74_nl;
  wire[0:0] VEC_LOOP_mux1h_49_nl;
  wire[0:0] VEC_LOOP_or_75_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_17_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_33_nl;
  wire[6:0] VEC_LOOP_mux1h_50_nl;
  wire[0:0] VEC_LOOP_or_76_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_34_nl;
  wire[0:0] VEC_LOOP_mux_18_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_35_nl;
  wire[8:0] VEC_LOOP_mux1h_51_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = z_out_18;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat = factor1_1_sva + COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_x_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_x_rsc_dat = VEC_LOOP_mult_vec_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat = MUX_v_32_2_2(COMP_LOOP_twiddle_f_1_sva,
      COMP_LOOP_twiddle_f_17_sva, and_dcpl_170);
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = MUX_v_32_2_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_17_sva, and_dcpl_170);
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire[0:0] mux_558_nl;
  wire[0:0] mux_557_nl;
  wire[0:0] mux_556_nl;
  wire [0:0] nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  assign mux_556_nl = MUX_s_1_2_2(mux_555_cse, mux_322_cse, fsm_output[5]);
  assign mux_557_nl = MUX_s_1_2_2(mux_323_cse, mux_556_nl, fsm_output[3]);
  assign mux_558_nl = MUX_s_1_2_2(mux_557_nl, mux_324_cse, fsm_output[1]);
  assign nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat = (~ mux_558_nl) & (fsm_output[0]);
  wire[0:0] and_297_nl;
  wire [3:0] nl_COMP_LOOP_17_twiddle_f_lshift_rg_s;
  assign and_297_nl = (fsm_output==9'b000000010);
  assign nl_COMP_LOOP_17_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva,
      z_out_10, and_297_nl);
  wire[0:0] and_310_nl;
  wire [3:0] nl_COMP_LOOP_1_twiddle_f_lshift_rg_s;
  assign and_310_nl = nor_171_cse & (fsm_output[5:4]==2'b00) & and_dcpl_35 & (fsm_output[1:0]==2'b10);
  assign nl_COMP_LOOP_1_twiddle_f_lshift_rg_s = MUX_v_4_2_2(COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0,
      z_out_10, and_310_nl);
  wire[31:0] VEC_LOOP_mux1h_11_nl;
  wire[0:0] and_119_nl;
  wire[0:0] nor_157_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] or_374_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] or_373_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] or_372_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] or_371_nl;
  wire[0:0] or_369_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] nor_153_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] mux_433_nl;
  wire [63:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core;
  assign and_119_nl = (~ mux_415_itm) & (fsm_output[0]);
  assign or_373_nl = (~ (fsm_output[2])) | (fsm_output[8]) | (fsm_output[4]);
  assign mux_420_nl = MUX_s_1_2_2(or_373_nl, mux_tmp_416, fsm_output[6]);
  assign or_374_nl = (fsm_output[5]) | mux_420_nl;
  assign mux_421_nl = MUX_s_1_2_2(or_tmp_206, or_374_nl, fsm_output[3]);
  assign or_371_nl = (~ (fsm_output[2])) | (fsm_output[8]) | (~ (fsm_output[4]));
  assign mux_417_nl = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[8]);
  assign or_369_nl = (fsm_output[2]) | mux_417_nl;
  assign mux_418_nl = MUX_s_1_2_2(or_371_nl, or_369_nl, fsm_output[6]);
  assign or_372_nl = (fsm_output[5]) | mux_418_nl;
  assign mux_419_nl = MUX_s_1_2_2(or_372_nl, or_tmp_206, fsm_output[3]);
  assign mux_422_nl = MUX_s_1_2_2(mux_421_nl, mux_419_nl, fsm_output[1]);
  assign nor_157_nl = ~(mux_422_nl | (fsm_output[7]) | (fsm_output[0]));
  assign mux_433_nl = MUX_s_1_2_2(mux_432_cse, mux_tmp_429, fsm_output[2]);
  assign mux_434_nl = MUX_s_1_2_2(mux_798_cse, mux_433_nl, fsm_output[3]);
  assign mux_435_nl = MUX_s_1_2_2(mux_434_nl, mux_431_cse, fsm_output[1]);
  assign nor_153_nl = ~(mux_435_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_11_nl = MUX1HOT_v_32_3_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_17_sva, VEC_LOOP_mult_vec_1_sva, {and_119_nl , nor_157_nl
      , nor_153_nl});
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core = {32'b00000000000000000000000000000000
      , VEC_LOOP_mux1h_11_nl};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct
      = {1'b0 , (~ mux_456_itm)};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_14_rmff , and_14_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (~ mux_456_itm)};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff = ~ mux_310_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro = ~ mux_415_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 = ~ mux_536_itm;
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_128_rmff , and_123_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_128_rmff , and_123_rmff};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0
      = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (z_out_15_12_10[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 = ~ (z_out_19[9]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 = ~ (z_out_15_12_10[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 = ~ (z_out_19[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 = ~ (z_out_15_12_10[2]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 = ~ (z_out_15_12_10[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 = ~ z_out_17_12;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 = ~ (z_out_19[9]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 = ~ (z_out_15_12_10[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 = ~ (z_out_16[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 = ~ (z_out_19[7]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 = ~ (z_out_11_20_12[0]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = z_out_14[4];
  ccs_in_v1 #(.rscid(32'sd14),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  modulo_sub  COMP_LOOP_1_modulo_sub_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nor_175_cse),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nor_175_cse),
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
  .width_z(32'sd11)) COMP_LOOP_3_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0),
      .z(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd12)) COMP_LOOP_2_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0),
      .z(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd13)) COMP_LOOP_17_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_17_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) COMP_LOOP_1_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_1_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out_1)
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
      .vec_rsci_oswt_1_pff(and_14_rmff)
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
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_oswt_1(reg_twiddle_rsci_oswt_1_cse),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsci_oswt_1_pff(and_128_rmff),
      .twiddle_rsci_oswt_pff(and_123_rmff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_oswt_1(reg_twiddle_rsci_oswt_1_cse),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsci_oswt_1_pff(and_128_rmff),
      .twiddle_h_rsci_oswt_pff(and_123_rmff)
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
      .COMP_LOOP_C_3_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0[0:0]),
      .COMP_LOOP_2_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_4_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0[0:0]),
      .COMP_LOOP_3_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_5_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0[0:0]),
      .COMP_LOOP_4_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_6_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0[0:0]),
      .COMP_LOOP_5_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_7_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_6_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_7_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_9_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0[0:0]),
      .COMP_LOOP_8_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_10_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0[0:0]),
      .COMP_LOOP_9_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_11_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0[0:0]),
      .COMP_LOOP_10_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_12_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0[0:0]),
      .COMP_LOOP_11_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_13_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0[0:0]),
      .COMP_LOOP_12_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_14_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0[0:0]),
      .COMP_LOOP_13_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_15_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0[0:0]),
      .COMP_LOOP_14_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_16_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0[0:0]),
      .COMP_LOOP_15_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_17_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0[0:0]),
      .COMP_LOOP_16_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_18_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0[0:0]),
      .COMP_LOOP_17_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_19_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0[0:0]),
      .COMP_LOOP_18_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_20_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0[0:0]),
      .COMP_LOOP_19_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_21_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0[0:0]),
      .COMP_LOOP_20_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_22_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0[0:0]),
      .COMP_LOOP_21_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_23_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0[0:0]),
      .COMP_LOOP_22_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_24_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0[0:0]),
      .COMP_LOOP_23_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_25_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0[0:0]),
      .COMP_LOOP_24_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_26_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0[0:0]),
      .COMP_LOOP_25_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_27_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0[0:0]),
      .COMP_LOOP_26_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_28_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0[0:0]),
      .COMP_LOOP_27_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_29_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0[0:0]),
      .COMP_LOOP_28_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_30_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0[0:0]),
      .COMP_LOOP_29_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_31_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0[0:0]),
      .COMP_LOOP_30_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_32_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0[0:0]),
      .COMP_LOOP_31_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_33_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0[0:0]),
      .COMP_LOOP_32_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_34_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign nand_nl = ~((fsm_output[5]) & (~ mux_tmp_280));
  assign mux_305_nl = MUX_s_1_2_2(mux_tmp_288, or_tmp_130, fsm_output[5]);
  assign mux_306_nl = MUX_s_1_2_2(nand_nl, mux_305_nl, fsm_output[6]);
  assign mux_303_nl = MUX_s_1_2_2(or_tmp_130, mux_tmp_288, fsm_output[5]);
  assign or_301_nl = (fsm_output[5]) | mux_tmp_287;
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, or_301_nl, fsm_output[6]);
  assign mux_307_nl = MUX_s_1_2_2(mux_306_nl, mux_304_nl, fsm_output[1]);
  assign mux_302_nl = MUX_s_1_2_2(mux_tmp_297, mux_tmp_285, fsm_output[1]);
  assign mux_308_nl = MUX_s_1_2_2(mux_307_nl, mux_302_nl, fsm_output[4]);
  assign mux_301_nl = MUX_s_1_2_2(mux_tmp_286, mux_tmp_298, fsm_output[4]);
  assign mux_309_nl = MUX_s_1_2_2(mux_308_nl, mux_301_nl, fsm_output[3]);
  assign mux_295_nl = MUX_s_1_2_2(mux_tmp_282, mux_tmp_292, fsm_output[1]);
  assign mux_299_nl = MUX_s_1_2_2(mux_tmp_298, mux_295_nl, fsm_output[4]);
  assign mux_293_nl = MUX_s_1_2_2(mux_tmp_292, mux_tmp_290, fsm_output[1]);
  assign mux_294_nl = MUX_s_1_2_2(mux_293_nl, mux_tmp_286, fsm_output[4]);
  assign mux_300_nl = MUX_s_1_2_2(mux_299_nl, mux_294_nl, fsm_output[3]);
  assign mux_310_itm = MUX_s_1_2_2(mux_309_nl, mux_300_nl, fsm_output[2]);
  assign mux_322_cse = MUX_s_1_2_2(mux_tmp_318, mux_tmp_312, fsm_output[2]);
  assign mux_323_cse = MUX_s_1_2_2(mux_322_cse, mux_tmp_316, fsm_output[5]);
  assign mux_319_nl = MUX_s_1_2_2(mux_tmp_314, mux_tmp_318, fsm_output[2]);
  assign mux_320_cse = MUX_s_1_2_2(mux_552_cse, mux_319_nl, fsm_output[5]);
  assign mux_324_cse = MUX_s_1_2_2(mux_553_cse, mux_323_cse, fsm_output[3]);
  assign mux_321_cse = MUX_s_1_2_2(mux_320_cse, mux_553_cse, fsm_output[3]);
  assign mux_325_nl = MUX_s_1_2_2(mux_324_cse, mux_321_cse, fsm_output[1]);
  assign and_14_rmff = (~ mux_325_nl) & (fsm_output[0]);
  assign mux_370_cse = MUX_s_1_2_2(or_439_cse, or_tmp_142, fsm_output[3]);
  assign nand_33_nl = ~((fsm_output[3]) & (fsm_output[7]) & (~ (fsm_output[8])) &
      (fsm_output[6]));
  assign mux_368_cse = MUX_s_1_2_2(nand_33_nl, mux_tmp_367, fsm_output[5]);
  assign mux_371_cse = MUX_s_1_2_2(mux_tmp_367, mux_370_cse, fsm_output[5]);
  assign or_350_nl = (~ (fsm_output[3])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_379_cse = MUX_s_1_2_2(or_tmp_160, or_350_nl, fsm_output[6]);
  assign nand_4_cse = ~((fsm_output[6]) & (~ mux_tmp_347));
  assign nand_3_cse = ~((fsm_output[6]) & (~ mux_tmp_343));
  assign or_352_cse = (fsm_output[6]) | mux_tmp_347;
  assign mux_376_cse = MUX_s_1_2_2(mux_tmp_346, or_tmp_157, fsm_output[4]);
  assign mux_381_cse = MUX_s_1_2_2(or_352_cse, mux_379_cse, fsm_output[4]);
  assign mux_377_cse = MUX_s_1_2_2(or_tmp_157, nand_3_cse, fsm_output[4]);
  assign mux_382_cse = MUX_s_1_2_2(nand_4_cse, mux_tmp_346, fsm_output[4]);
  assign mux_432_cse = MUX_s_1_2_2(or_tmp_221, mux_493_cse, fsm_output[4]);
  assign mux_428_nl = MUX_s_1_2_2(mux_tmp_355, or_414_cse, fsm_output[4]);
  assign mux_430_cse = MUX_s_1_2_2(mux_tmp_429, mux_428_nl, fsm_output[2]);
  assign mux_431_cse = MUX_s_1_2_2(mux_430_cse, mux_798_cse, fsm_output[3]);
  assign mux_452_nl = MUX_s_1_2_2(mux_379_cse, mux_tmp_346, fsm_output[4]);
  assign mux_453_nl = MUX_s_1_2_2(mux_tmp_438, mux_452_nl, fsm_output[5]);
  assign mux_454_nl = MUX_s_1_2_2(mux_453_nl, mux_tmp_445, fsm_output[2]);
  assign mux_455_nl = MUX_s_1_2_2(mux_454_nl, mux_tmp_450, fsm_output[1]);
  assign mux_441_nl = MUX_s_1_2_2(mux_376_cse, mux_tmp_438, fsm_output[5]);
  assign mux_446_nl = MUX_s_1_2_2(mux_tmp_445, mux_441_nl, fsm_output[2]);
  assign mux_451_nl = MUX_s_1_2_2(mux_tmp_450, mux_446_nl, fsm_output[1]);
  assign mux_456_itm = MUX_s_1_2_2(mux_455_nl, mux_451_nl, fsm_output[0]);
  assign mux_474_nl = MUX_s_1_2_2(mux_tmp_464, or_tmp_233, fsm_output[4]);
  assign mux_475_nl = MUX_s_1_2_2(mux_tmp_463, mux_474_nl, fsm_output[3]);
  assign or_404_nl = (fsm_output[6:5]!=2'b01) | not_tmp_151;
  assign mux_471_nl = MUX_s_1_2_2(or_404_nl, or_tmp_234, fsm_output[7]);
  assign mux_472_nl = MUX_s_1_2_2(mux_471_nl, mux_tmp_457, fsm_output[4]);
  assign or_402_nl = COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[8]);
  assign mux_469_nl = MUX_s_1_2_2(or_402_nl, or_tmp_232, fsm_output[7]);
  assign mux_470_nl = MUX_s_1_2_2(mux_469_nl, mux_tmp_464, fsm_output[4]);
  assign mux_473_nl = MUX_s_1_2_2(mux_472_nl, mux_470_nl, fsm_output[3]);
  assign mux_476_nl = MUX_s_1_2_2(mux_475_nl, mux_473_nl, fsm_output[2]);
  assign or_401_nl = (fsm_output[5]) | (fsm_output[6]) | (fsm_output[8]);
  assign mux_465_nl = MUX_s_1_2_2(or_401_nl, or_tmp_232, fsm_output[7]);
  assign mux_466_nl = MUX_s_1_2_2(mux_465_nl, mux_tmp_464, fsm_output[4]);
  assign mux_467_nl = MUX_s_1_2_2(mux_466_nl, mux_tmp_463, fsm_output[3]);
  assign mux_459_nl = MUX_s_1_2_2(or_tmp_234, or_tmp_232, fsm_output[7]);
  assign mux_461_nl = MUX_s_1_2_2(or_tmp_237, mux_459_nl, fsm_output[4]);
  assign mux_458_nl = MUX_s_1_2_2(or_tmp_233, mux_tmp_457, fsm_output[4]);
  assign mux_462_nl = MUX_s_1_2_2(mux_461_nl, mux_458_nl, fsm_output[3]);
  assign mux_468_nl = MUX_s_1_2_2(mux_467_nl, mux_462_nl, fsm_output[2]);
  assign mux_477_nl = MUX_s_1_2_2(mux_476_nl, mux_468_nl, fsm_output[1]);
  assign and_123_rmff = (~ mux_477_nl) & (fsm_output[0]);
  assign nor_120_nl = ~((fsm_output[4]) | (fsm_output[6]));
  assign mux_15_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign mux_479_nl = MUX_s_1_2_2(nor_120_nl, mux_15_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign and_128_rmff = mux_479_nl & and_dcpl_15 & (~ (fsm_output[5])) & (~ (fsm_output[3]))
      & (~ (fsm_output[2])) & and_916_cse;
  assign mux_493_cse = MUX_s_1_2_2(or_tmp_142, or_439_cse, fsm_output[5]);
  assign COMP_LOOP_or_cse = (and_dcpl_30 & and_dcpl_43) | (and_dcpl_38 & and_dcpl_21)
      | (and_dcpl_45 & and_dcpl_25) | (and_dcpl_81 & and_dcpl_13);
  assign COMP_LOOP_or_2_cse = (and_dcpl_38 & and_dcpl_47) | (and_dcpl_61 & and_dcpl_47)
      | (and_dcpl_75 & and_dcpl_43) | (and_dcpl_91 & and_dcpl_43);
  assign COMP_LOOP_or_1_cse = (and_dcpl_45 & and_dcpl_13) | and_dcpl_133 | (and_dcpl_66
      & and_dcpl_13) | (and_dcpl_93 & and_dcpl_21);
  assign COMP_LOOP_or_4_cse = and_dcpl_132 | (and_dcpl_78 & and_dcpl_47) | (and_dcpl_86
      & and_dcpl_40) | (and_dcpl_93 & and_dcpl_47);
  assign COMP_LOOP_or_3_cse = (and_dcpl_59 & and_dcpl_43) | (and_dcpl_68 & and_dcpl_28)
      | (and_dcpl_71 & and_dcpl_40) | (and_dcpl_96 & and_dcpl_13);
  assign COMP_LOOP_or_6_cse = (and_dcpl_66 & and_dcpl_25) | (and_dcpl_83 & and_dcpl_28);
  assign COMP_LOOP_or_7_cse = (and_dcpl_71 & and_dcpl_36) | (and_dcpl_86 & and_dcpl_36);
  assign COMP_LOOP_or_5_cse = (and_dcpl_49 & and_dcpl_28) | (and_dcpl_81 & and_dcpl_25);
  assign COMP_LOOP_mux1h_nl = MUX1HOT_v_2_11_2((z_out_2[3:2]), (z_out_4[4:3]), (z_out_5_9_0[2:1]),
      (z_out_7_10_0[3:2]), (z_out_3[1:0]), (z_out_6[4:3]), (z_out_9[4:3]), (z_out_3[4:3]),
      (z_out_8[4:3]), (z_out_8[3:2]), (z_out_3[3:2]), {and_dcpl_125 , COMP_LOOP_or_cse
      , COMP_LOOP_or_2_cse , COMP_LOOP_or_1_cse , COMP_LOOP_or_5_cse , COMP_LOOP_or_4_cse
      , COMP_LOOP_or_3_cse , and_dcpl_136 , COMP_LOOP_or_6_cse , COMP_LOOP_or_7_cse
      , and_dcpl_144});
  assign mux_494_nl = MUX_s_1_2_2(mux_tmp_361, mux_493_cse, fsm_output[2]);
  assign mux_495_nl = MUX_s_1_2_2(mux_494_nl, mux_tmp_482, fsm_output[4]);
  assign mux_491_nl = MUX_s_1_2_2(or_tmp_250, mux_tmp_358, fsm_output[2]);
  assign mux_492_nl = MUX_s_1_2_2(mux_tmp_487, mux_491_nl, fsm_output[4]);
  assign mux_496_nl = MUX_s_1_2_2(mux_495_nl, mux_492_nl, fsm_output[3]);
  assign mux_488_nl = MUX_s_1_2_2(or_414_cse, mux_tmp_355, fsm_output[2]);
  assign mux_489_nl = MUX_s_1_2_2(mux_488_nl, mux_tmp_487, fsm_output[4]);
  assign mux_483_nl = MUX_s_1_2_2(mux_tmp_361, or_tmp_250, fsm_output[2]);
  assign mux_484_nl = MUX_s_1_2_2(mux_483_nl, mux_tmp_482, fsm_output[4]);
  assign mux_490_nl = MUX_s_1_2_2(mux_489_nl, mux_484_nl, fsm_output[3]);
  assign mux_497_nl = MUX_s_1_2_2(mux_496_nl, mux_490_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_nor_nl = ~(mux_497_nl | (~ (fsm_output[0])));
  assign COMP_LOOP_and_rmff = MUX_v_2_2_2(2'b00, COMP_LOOP_mux1h_nl, COMP_LOOP_twiddle_f_nor_nl);
  assign COMP_LOOP_twiddle_f_mux1h_57_nl = MUX1HOT_s_1_10_2((z_out_2[1]), (z_out_4[2]),
      (z_out_5_9_0[0]), (z_out_7_10_0[1]), (z_out_6[2]), (z_out_9[2]), (z_out_3[2]),
      (z_out_8[2]), (z_out_8[1]), (z_out_3[1]), {and_dcpl_125 , COMP_LOOP_or_cse
      , COMP_LOOP_or_2_cse , COMP_LOOP_or_1_cse , COMP_LOOP_or_4_cse , COMP_LOOP_or_3_cse
      , and_dcpl_136 , COMP_LOOP_or_6_cse , COMP_LOOP_or_7_cse , and_dcpl_144});
  assign nor_118_nl = ~((fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[4]) |
      (~ (fsm_output[6])) | (fsm_output[7]));
  assign nor_119_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[6]) | (fsm_output[7]));
  assign and_260_nl = (fsm_output[3]) & (fsm_output[4]) & (fsm_output[6]) & (fsm_output[7]);
  assign mux_498_nl = MUX_s_1_2_2(nor_119_nl, and_260_nl, fsm_output[2]);
  assign mux_499_nl = MUX_s_1_2_2(nor_118_nl, mux_498_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux1h_57_rmff = COMP_LOOP_twiddle_f_mux1h_57_nl & (~(mux_499_nl
      & (~ (fsm_output[8])) & (~ (fsm_output[5])) & (fsm_output[0])));
  assign and_161_nl = and_dcpl_17 & and_dcpl_36;
  assign COMP_LOOP_twiddle_f_mux1h_87_rmff = MUX1HOT_v_7_12_2(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0,
      (z_out_2[10:4]), (z_out_4[11:5]), (z_out_5_9_0[9:3]), (z_out_7_10_0[10:4]),
      (z_out_3[8:2]), (z_out_6[11:5]), (z_out_9[11:5]), (z_out_3[11:5]), (z_out_8[11:5]),
      (z_out_8[10:4]), (z_out_3[10:4]), {and_161_nl , and_dcpl_125 , COMP_LOOP_or_cse
      , COMP_LOOP_or_2_cse , COMP_LOOP_or_1_cse , COMP_LOOP_or_5_cse , COMP_LOOP_or_4_cse
      , COMP_LOOP_or_3_cse , and_dcpl_136 , COMP_LOOP_or_6_cse , COMP_LOOP_or_7_cse
      , and_dcpl_144});
  assign COMP_LOOP_twiddle_f_mux1h_110_nl = MUX1HOT_s_1_9_2((z_out_2[0]), (z_out_4[1]),
      (z_out_7_10_0[0]), (z_out_6[1]), (z_out_9[1]), (z_out_3[1]), (z_out_8[1]),
      (z_out_8[0]), (z_out_3[0]), {and_dcpl_125 , COMP_LOOP_or_cse , COMP_LOOP_or_1_cse
      , COMP_LOOP_or_4_cse , COMP_LOOP_or_3_cse , and_dcpl_136 , COMP_LOOP_or_6_cse
      , COMP_LOOP_or_7_cse , and_dcpl_144});
  assign or_426_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[4]);
  assign or_425_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[4]));
  assign mux_502_nl = MUX_s_1_2_2(or_426_nl, or_425_nl, fsm_output[6]);
  assign or_423_nl = (fsm_output[7:4]!=4'b0100);
  assign mux_503_nl = MUX_s_1_2_2(mux_502_nl, or_423_nl, fsm_output[3]);
  assign nor_113_nl = ~((fsm_output[2]) | mux_503_nl);
  assign nor_114_nl = ~((fsm_output[7:3]!=5'b00000));
  assign nor_115_nl = ~((fsm_output[7:4]!=4'b1011));
  assign nor_116_nl = ~((fsm_output[7:4]!=4'b1101));
  assign mux_500_nl = MUX_s_1_2_2(nor_115_nl, nor_116_nl, fsm_output[3]);
  assign mux_501_nl = MUX_s_1_2_2(nor_114_nl, mux_500_nl, fsm_output[2]);
  assign mux_504_nl = MUX_s_1_2_2(nor_113_nl, mux_501_nl, fsm_output[1]);
  assign nor_117_nl = ~((fsm_output[7:1]!=7'b0000011));
  assign mux_505_nl = MUX_s_1_2_2(mux_504_nl, nor_117_nl, fsm_output[8]);
  assign COMP_LOOP_twiddle_f_mux1h_110_rmff = COMP_LOOP_twiddle_f_mux1h_110_nl &
      (~(mux_505_nl & (fsm_output[0])));
  assign not_995_nl = ~ and_dcpl_132;
  assign COMP_LOOP_twiddle_help_mux_rmff = MUX_v_4_2_2(4'b0000, (z_out_2[3:0]), not_995_nl);
  assign COMP_LOOP_twiddle_f_mux1h_126_nl = MUX1HOT_s_1_5_2((z_out_4[0]), (z_out_6[0]),
      (z_out_9[0]), (z_out_3[0]), (z_out_8[0]), {COMP_LOOP_or_cse , COMP_LOOP_or_4_cse
      , COMP_LOOP_or_3_cse , and_dcpl_136 , COMP_LOOP_or_6_cse});
  assign or_440_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[6]);
  assign mux_512_nl = MUX_s_1_2_2(or_tmp_142, or_439_cse, fsm_output[1]);
  assign mux_513_nl = MUX_s_1_2_2(or_440_nl, mux_512_nl, fsm_output[2]);
  assign or_438_nl = (fsm_output[2]) | mux_tmp_510;
  assign mux_514_nl = MUX_s_1_2_2(mux_513_nl, or_438_nl, fsm_output[5]);
  assign mux_511_nl = MUX_s_1_2_2(mux_tmp_506, mux_tmp_510, fsm_output[2]);
  assign nand_8_nl = ~((fsm_output[5]) & (~ mux_511_nl));
  assign mux_515_nl = MUX_s_1_2_2(mux_514_nl, nand_8_nl, fsm_output[4]);
  assign or_434_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[6]);
  assign mux_508_nl = MUX_s_1_2_2(mux_tmp_506, or_434_nl, fsm_output[2]);
  assign or_435_nl = (fsm_output[5]) | mux_508_nl;
  assign or_432_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[8]))
      | (fsm_output[6]);
  assign mux_507_nl = MUX_s_1_2_2(or_432_nl, mux_tmp_506, fsm_output[2]);
  assign or_433_nl = (fsm_output[5]) | mux_507_nl;
  assign mux_509_nl = MUX_s_1_2_2(or_435_nl, or_433_nl, fsm_output[4]);
  assign mux_516_nl = MUX_s_1_2_2(mux_515_nl, mux_509_nl, fsm_output[3]);
  assign COMP_LOOP_twiddle_f_mux1h_126_rmff = COMP_LOOP_twiddle_f_mux1h_126_nl &
      (~((~ mux_516_nl) & (fsm_output[0])));
  assign COMP_LOOP_twiddle_help_mux_1_rmff = MUX_v_8_2_2((z_out_2[11:4]), COMP_LOOP_17_twiddle_f_mul_psp_sva,
      and_dcpl_132);
  assign nor_175_cse = ~(mux_415_itm | (fsm_output[0]));
  assign mux_533_nl = MUX_s_1_2_2(mux_tmp_529, mux_tmp_521, fsm_output[2]);
  assign mux_534_nl = MUX_s_1_2_2(mux_533_nl, mux_tmp_527, fsm_output[5]);
  assign mux_535_nl = MUX_s_1_2_2(mux_tmp_528, mux_534_nl, fsm_output[3]);
  assign mux_530_nl = MUX_s_1_2_2(mux_tmp_525, mux_tmp_529, fsm_output[2]);
  assign mux_531_nl = MUX_s_1_2_2(mux_tmp_522, mux_530_nl, fsm_output[5]);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, mux_tmp_528, fsm_output[3]);
  assign mux_536_itm = MUX_s_1_2_2(mux_535_nl, mux_532_nl, fsm_output[1]);
  assign mux_555_cse = MUX_s_1_2_2(mux_311_cse, mux_315_cse, fsm_output[2]);
  assign mux_552_cse = MUX_s_1_2_2(mux_tmp_312, mux_311_cse, fsm_output[2]);
  assign mux_553_cse = MUX_s_1_2_2(mux_tmp_316, mux_552_cse, fsm_output[5]);
  assign and_261_cse = (fsm_output[2:1]==2'b11);
  assign or_706_cse = (fsm_output[5:2]!=4'b0000);
  assign and_919_cse = or_706_cse & (fsm_output[6]);
  assign and_248_cse = (fsm_output[4:3]==2'b11);
  assign or_203_cse = (fsm_output[5:4]!=2'b00);
  assign and_194_nl = and_dcpl_38 & and_dcpl_35 & (fsm_output[1:0]==2'b01) & (VEC_LOOP_j_10_12_0_sva_1[12]);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt = MUX_v_9_2_2(({5'b00000
      , z_out_10}), (z_out_1[8:0]), and_194_nl);
  assign and_918_cse = (fsm_output[6:5]==2'b11);
  assign and_916_cse = (fsm_output[1:0]==2'b11);
  assign and_241_cse_1 = (fsm_output[3:2]==2'b11);
  assign nl_COMP_LOOP_1_twiddle_f_mul_nl = (z_out_1[6:0]) * COMP_LOOP_k_12_5_sva_6_0;
  assign COMP_LOOP_1_twiddle_f_mul_nl = nl_COMP_LOOP_1_twiddle_f_mul_nl[6:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_8_nl = MUX_v_7_2_2(COMP_LOOP_1_twiddle_f_mul_nl,
      (z_out_19[6:0]), and_dcpl_18);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_rgt = MUX_v_11_2_2(({4'b0000
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_8_nl}), COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1,
      and_dcpl_125);
  assign or_715_cse = (fsm_output[7:5]!=3'b000);
  assign or_496_cse = (fsm_output[4:3]!=2'b00);
  assign mux_663_nl = MUX_s_1_2_2(mux_tmp_657, mux_tmp_629, fsm_output[4]);
  assign or_515_nl = (fsm_output[4]) | (fsm_output[1]);
  assign mux_662_nl = MUX_s_1_2_2(mux_tmp_628, mux_tmp_629, or_515_nl);
  assign mux_664_nl = MUX_s_1_2_2(mux_663_nl, mux_662_nl, fsm_output[2]);
  assign or_514_nl = (fsm_output[3]) | (fsm_output[5]);
  assign mux_665_nl = MUX_s_1_2_2(mux_664_nl, mux_tmp_629, or_514_nl);
  assign mux_658_nl = MUX_s_1_2_2(mux_tmp_657, mux_tmp_634, fsm_output[4]);
  assign mux_656_nl = MUX_s_1_2_2(mux_tmp_647, mux_tmp_630, fsm_output[4]);
  assign mux_659_nl = MUX_s_1_2_2(mux_658_nl, mux_656_nl, fsm_output[2]);
  assign mux_654_nl = MUX_s_1_2_2(mux_tmp_652, mux_tmp_640, fsm_output[4]);
  assign mux_653_nl = MUX_s_1_2_2(mux_tmp_634, mux_tmp_652, fsm_output[4]);
  assign mux_655_nl = MUX_s_1_2_2(mux_654_nl, mux_653_nl, fsm_output[2]);
  assign mux_660_nl = MUX_s_1_2_2(mux_659_nl, mux_655_nl, fsm_output[5]);
  assign mux_648_nl = MUX_s_1_2_2(mux_tmp_640, mux_tmp_647, fsm_output[4]);
  assign mux_643_nl = MUX_s_1_2_2(mux_tmp_628, mux_tmp_629, COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm);
  assign mux_644_nl = MUX_s_1_2_2(mux_643_nl, mux_tmp_642, fsm_output[1]);
  assign mux_645_nl = MUX_s_1_2_2(mux_644_nl, mux_tmp_640, fsm_output[4]);
  assign mux_649_nl = MUX_s_1_2_2(mux_648_nl, mux_645_nl, fsm_output[2]);
  assign mux_635_nl = MUX_s_1_2_2(mux_tmp_630, mux_tmp_634, fsm_output[4]);
  assign or_510_nl = and_236_cse | (fsm_output[7]);
  assign mux_631_nl = MUX_s_1_2_2(nor_tmp_15, (fsm_output[8]), or_510_nl);
  assign mux_632_nl = MUX_s_1_2_2(mux_631_nl, mux_tmp_630, fsm_output[4]);
  assign mux_636_nl = MUX_s_1_2_2(mux_635_nl, mux_632_nl, fsm_output[2]);
  assign mux_650_nl = MUX_s_1_2_2(mux_649_nl, mux_636_nl, fsm_output[5]);
  assign mux_661_nl = MUX_s_1_2_2(mux_660_nl, mux_650_nl, fsm_output[3]);
  assign mux_666_nl = MUX_s_1_2_2(mux_665_nl, mux_661_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_help_and_cse = complete_rsci_wen_comp & mux_666_nl;
  assign nor_124_cse = ~((fsm_output[1:0]!=2'b00));
  assign or_555_cse = (fsm_output[8:7]!=2'b10);
  assign or_556_cse = (fsm_output[4:3]!=2'b01);
  assign mux_797_nl = MUX_s_1_2_2(or_tmp_214, mux_tmp_355, fsm_output[4]);
  assign mux_798_cse = MUX_s_1_2_2(mux_797_nl, mux_424_cse, fsm_output[2]);
  assign mux_883_nl = MUX_s_1_2_2(mux_370_cse, mux_365_cse, fsm_output[5]);
  assign mux_884_nl = MUX_s_1_2_2(mux_371_cse, mux_883_nl, fsm_output[1]);
  assign mux_885_nl = MUX_s_1_2_2(mux_806_cse, mux_884_nl, fsm_output[4]);
  assign mux_881_nl = MUX_s_1_2_2(mux_368_cse, mux_371_cse, fsm_output[1]);
  assign mux_882_nl = MUX_s_1_2_2(mux_881_nl, mux_806_cse, fsm_output[4]);
  assign mux_886_cse = MUX_s_1_2_2(mux_885_nl, mux_882_nl, fsm_output[2]);
  assign or_655_cse = (~ (fsm_output[8])) | (fsm_output[5]) | (fsm_output[7]);
  assign mux_913_cse = MUX_s_1_2_2(or_655_cse, or_tmp_425, fsm_output[6]);
  assign mux_818_nl = MUX_s_1_2_2(or_tmp_37, or_555_cse, fsm_output[5]);
  assign or_653_cse = (fsm_output[6]) | mux_818_nl;
  assign mux_915_cse = MUX_s_1_2_2(mux_tmp_817, mux_913_cse, fsm_output[4]);
  assign VEC_LOOP_or_29_cse = and_dcpl_31 | and_dcpl_50 | and_dcpl_60 | and_dcpl_69
      | and_dcpl_76 | and_dcpl_84 | and_dcpl_92 | and_dcpl_99;
  assign or_659_nl = (fsm_output[5]) | (~ (fsm_output[7]));
  assign or_658_nl = (~ (fsm_output[5])) | (fsm_output[7]);
  assign mux_916_nl = MUX_s_1_2_2(or_659_nl, or_658_nl, fsm_output[8]);
  assign or_660_nl = (fsm_output[6]) | mux_916_nl;
  assign mux_917_nl = MUX_s_1_2_2(or_660_nl, mux_tmp_817, fsm_output[4]);
  assign nor_92_nl = ~((fsm_output[3]) | and_916_cse | mux_917_nl);
  assign and_223_nl = (fsm_output[3]) & (~(nor_124_cse | mux_915_cse));
  assign mux_894_ssc = MUX_s_1_2_2(nor_92_nl, and_223_nl, fsm_output[2]);
  assign or_414_cse = (fsm_output[8:5]!=4'b0101);
  assign or_439_cse = (fsm_output[8:6]!=3'b100);
  assign nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_2_sva_mx0w1 = nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1[11:0];
  assign nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_3_sva_mx0w2 = nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2[11:0];
  assign nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_4_sva_mx0w3 = nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3[11:0];
  assign nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_5_sva_mx0w4 = nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4[11:0];
  assign nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_6_sva_mx0w5 = nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5[11:0];
  assign nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_7_sva_mx0w6 = nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6[11:0];
  assign nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_8_sva_mx0w7 = nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7[11:0];
  assign nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_10_sva_mx0w9 = nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9[11:0];
  assign nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_11_sva_mx0w10 = nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10[11:0];
  assign nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_12_sva_mx0w11 = nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11[11:0];
  assign nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_13_sva_mx0w12 = nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12[11:0];
  assign nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_14_sva_mx0w13 = nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13[11:0];
  assign nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_15_sva_mx0w14 = nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14[11:0];
  assign nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_16_sva_mx0w15 = nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15[11:0];
  assign nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_18_sva_mx0w17 = nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17[11:0];
  assign nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_19_sva_mx0w18 = nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18[11:0];
  assign nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_20_sva_mx0w19 = nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19[11:0];
  assign nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_21_sva_mx0w20 = nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20[11:0];
  assign nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_22_sva_mx0w21 = nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21[11:0];
  assign nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_23_sva_mx0w22 = nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22[11:0];
  assign nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_24_sva_mx0w23 = nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23[11:0];
  assign nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_26_sva_mx0w25 = nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25[11:0];
  assign nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_27_sva_mx0w26 = nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26[11:0];
  assign nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_28_sva_mx0w27 = nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27[11:0];
  assign nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_29_sva_mx0w28 = nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28[11:0];
  assign nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_30_sva_mx0w29 = nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29[11:0];
  assign nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_31_sva_mx0w30 = nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30[11:0];
  assign nl_VEC_LOOP_acc_10_cse_sva_mx0w31 = z_out_13 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_sva_mx0w31 = nl_VEC_LOOP_acc_10_cse_sva_mx0w31[11:0];
  assign or_tmp_25 = (fsm_output[7:6]!=2'b00);
  assign and_tmp_2 = (fsm_output[8]) & or_tmp_25;
  assign nor_tmp_7 = (fsm_output[8:7]==2'b11);
  assign or_tmp_36 = (fsm_output[8:7]!=2'b00);
  assign or_tmp_37 = (fsm_output[8:7]!=2'b01);
  assign or_tmp_56 = (fsm_output[8]) | (fsm_output[6]);
  assign or_tmp_57 = (fsm_output[8]) | (~ (fsm_output[6]));
  assign nor_tmp_15 = (fsm_output[8]) & (fsm_output[6]);
  assign mux_268_cse = MUX_s_1_2_2((~ (fsm_output[8])), (fsm_output[8]), fsm_output[7]);
  assign or_dcpl_159 = (fsm_output[8:6]!=3'b000);
  assign or_tmp_130 = (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_tmp_278 = MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output[0]);
  assign mux_tmp_280 = MUX_s_1_2_2(or_tmp_36, or_tmp_37, fsm_output[0]);
  assign or_tmp_133 = (~ (fsm_output[0])) | (fsm_output[8]) | (fsm_output[7]);
  assign mux_tmp_281 = MUX_s_1_2_2(or_tmp_133, mux_tmp_280, fsm_output[5]);
  assign mux_279_nl = MUX_s_1_2_2(mux_tmp_278, or_tmp_130, fsm_output[5]);
  assign mux_tmp_282 = MUX_s_1_2_2(mux_tmp_281, mux_279_nl, fsm_output[6]);
  assign or_tmp_134 = (~ (fsm_output[0])) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_284_nl = MUX_s_1_2_2(or_tmp_134, or_tmp_133, fsm_output[5]);
  assign mux_283_nl = MUX_s_1_2_2(mux_tmp_280, mux_tmp_278, fsm_output[5]);
  assign mux_tmp_285 = MUX_s_1_2_2(mux_284_nl, mux_283_nl, fsm_output[6]);
  assign mux_tmp_286 = MUX_s_1_2_2(mux_tmp_285, mux_tmp_282, fsm_output[1]);
  assign mux_tmp_287 = MUX_s_1_2_2(or_555_cse, or_tmp_37, fsm_output[0]);
  assign mux_tmp_288 = MUX_s_1_2_2(or_tmp_37, (fsm_output[7]), fsm_output[0]);
  assign mux_289_nl = MUX_s_1_2_2(mux_tmp_288, mux_tmp_287, fsm_output[5]);
  assign or_297_nl = (~ (fsm_output[5])) | (~ (fsm_output[0])) | (fsm_output[8])
      | (fsm_output[7]);
  assign mux_tmp_290 = MUX_s_1_2_2(mux_289_nl, or_297_nl, fsm_output[6]);
  assign mux_291_nl = MUX_s_1_2_2(mux_tmp_280, mux_tmp_288, fsm_output[5]);
  assign or_300_nl = (fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[8]) | (~
      (fsm_output[7]));
  assign mux_tmp_292 = MUX_s_1_2_2(mux_291_nl, or_300_nl, fsm_output[6]);
  assign mux_296_nl = MUX_s_1_2_2(mux_tmp_287, or_tmp_134, fsm_output[5]);
  assign mux_tmp_297 = MUX_s_1_2_2(mux_296_nl, mux_tmp_281, fsm_output[6]);
  assign mux_tmp_298 = MUX_s_1_2_2(mux_tmp_290, mux_tmp_297, fsm_output[1]);
  assign or_tmp_141 = (fsm_output[8:6]!=3'b011);
  assign or_tmp_142 = (fsm_output[8:6]!=3'b010);
  assign mux_tmp_312 = MUX_s_1_2_2(or_tmp_141, or_439_cse, fsm_output[4]);
  assign mux_311_cse = MUX_s_1_2_2(or_tmp_142, or_tmp_141, fsm_output[4]);
  assign or_tmp_145 = (fsm_output[8:6]!=3'b001);
  assign mux_tmp_314 = MUX_s_1_2_2(or_dcpl_159, or_tmp_145, fsm_output[4]);
  assign mux_315_cse = MUX_s_1_2_2(or_tmp_145, or_tmp_142, fsm_output[4]);
  assign mux_tmp_316 = MUX_s_1_2_2(mux_315_cse, mux_tmp_314, fsm_output[2]);
  assign mux_tmp_318 = MUX_s_1_2_2(or_439_cse, or_dcpl_159, fsm_output[4]);
  assign and_dcpl_11 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_12 = (fsm_output[3:2]==2'b01);
  assign and_dcpl_13 = and_dcpl_12 & and_dcpl_11;
  assign and_dcpl_14 = ~((fsm_output[5:4]!=2'b00));
  assign and_dcpl_15 = ~((fsm_output[8:7]!=2'b00));
  assign and_dcpl_16 = and_dcpl_15 & (~ (fsm_output[6]));
  assign and_dcpl_17 = and_dcpl_16 & and_dcpl_14;
  assign and_dcpl_18 = and_dcpl_17 & and_dcpl_13;
  assign and_dcpl_20 = (fsm_output[3:2]==2'b10);
  assign and_dcpl_21 = and_dcpl_20 & and_916_cse;
  assign or_316_cse = (fsm_output[8:6]!=3'b101);
  assign mux_335_cse = MUX_s_1_2_2(or_316_cse, or_tmp_145, fsm_output[4]);
  assign mux_336_nl = MUX_s_1_2_2(mux_335_cse, mux_tmp_318, fsm_output[2]);
  assign mux_337_nl = MUX_s_1_2_2(mux_336_nl, mux_555_cse, fsm_output[5]);
  assign mux_338_nl = MUX_s_1_2_2(mux_337_nl, mux_320_cse, fsm_output[3]);
  assign mux_342_nl = MUX_s_1_2_2(mux_321_cse, mux_338_nl, fsm_output[1]);
  assign and_dcpl_23 = ~(mux_342_nl | (fsm_output[0]));
  assign and_dcpl_25 = and_241_cse_1 & and_916_cse;
  assign and_dcpl_26 = and_dcpl_17 & and_dcpl_25;
  assign mux_tmp_343 = MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output[3]);
  assign or_tmp_157 = (fsm_output[6]) | mux_tmp_343;
  assign or_tmp_160 = (fsm_output[3]) | (fsm_output[8]) | (fsm_output[7]);
  assign or_323_nl = (~ (fsm_output[3])) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_tmp_346 = MUX_s_1_2_2(or_323_nl, or_tmp_160, fsm_output[6]);
  assign mux_tmp_347 = MUX_s_1_2_2(or_555_cse, or_tmp_37, fsm_output[3]);
  assign mux_351_nl = MUX_s_1_2_2(nand_4_cse, or_tmp_157, fsm_output[5]);
  assign mux_350_nl = MUX_s_1_2_2(mux_tmp_346, nand_3_cse, fsm_output[5]);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, mux_350_nl, fsm_output[4]);
  assign mux_348_nl = MUX_s_1_2_2(or_352_cse, mux_tmp_346, fsm_output[5]);
  assign mux_345_nl = MUX_s_1_2_2(mux_379_cse, or_tmp_157, fsm_output[5]);
  assign mux_349_nl = MUX_s_1_2_2(mux_348_nl, mux_345_nl, fsm_output[4]);
  assign mux_353_nl = MUX_s_1_2_2(mux_352_nl, mux_349_nl, fsm_output[2]);
  assign and_dcpl_27 = (~ mux_353_nl) & and_dcpl_11;
  assign and_dcpl_28 = and_dcpl_20 & and_dcpl_11;
  assign and_dcpl_29 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_30 = and_dcpl_16 & and_dcpl_29;
  assign and_dcpl_31 = and_dcpl_30 & and_dcpl_28;
  assign mux_tmp_355 = MUX_s_1_2_2(or_439_cse, or_tmp_145, fsm_output[5]);
  assign mux_354_cse = MUX_s_1_2_2(or_dcpl_159, or_tmp_142, fsm_output[5]);
  assign mux_tmp_356 = MUX_s_1_2_2(mux_tmp_355, mux_354_cse, fsm_output[4]);
  assign mux_tmp_358 = MUX_s_1_2_2(or_tmp_145, or_tmp_141, fsm_output[5]);
  assign mux_359_nl = MUX_s_1_2_2(mux_tmp_358, mux_493_cse, fsm_output[4]);
  assign mux_tmp_360 = MUX_s_1_2_2(mux_359_nl, mux_tmp_356, fsm_output[3]);
  assign and_dcpl_34 = (~ mux_tmp_360) & (fsm_output[2:0]==3'b111);
  assign and_dcpl_35 = ~((fsm_output[3:2]!=2'b00));
  assign and_dcpl_36 = and_dcpl_35 & and_916_cse;
  assign and_dcpl_37 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_38 = and_dcpl_16 & and_dcpl_37;
  assign and_dcpl_39 = and_dcpl_38 & and_dcpl_36;
  assign and_dcpl_40 = and_241_cse_1 & and_dcpl_11;
  assign and_dcpl_41 = and_dcpl_38 & and_dcpl_40;
  assign mux_tmp_361 = MUX_s_1_2_2(or_tmp_141, or_dcpl_159, fsm_output[5]);
  assign mux_tmp_362 = MUX_s_1_2_2(mux_493_cse, mux_tmp_361, fsm_output[4]);
  assign and_dcpl_42 = (~ mux_tmp_362) & and_dcpl_36;
  assign and_dcpl_43 = and_dcpl_12 & and_916_cse;
  assign and_dcpl_44 = (fsm_output[5:4]==2'b11);
  assign and_dcpl_45 = and_dcpl_16 & and_dcpl_44;
  assign and_dcpl_46 = and_dcpl_45 & and_dcpl_43;
  assign and_dcpl_47 = and_dcpl_35 & and_dcpl_11;
  assign and_dcpl_48 = and_dcpl_15 & (fsm_output[6]);
  assign and_dcpl_49 = and_dcpl_48 & and_dcpl_14;
  assign and_dcpl_50 = and_dcpl_49 & and_dcpl_47;
  assign and_dcpl_51 = and_dcpl_49 & and_dcpl_21;
  assign and_dcpl_52 = and_dcpl_48 & and_dcpl_29;
  assign and_dcpl_53 = and_dcpl_52 & and_dcpl_13;
  assign and_dcpl_57 = xor_dcpl & (~ (fsm_output[8])) & (fsm_output[6]) & (fsm_output[4])
      & and_dcpl_21;
  assign and_dcpl_58 = and_dcpl_52 & and_dcpl_25;
  assign and_dcpl_59 = and_dcpl_48 & and_dcpl_37;
  assign and_dcpl_60 = and_dcpl_59 & and_dcpl_28;
  assign and_dcpl_61 = and_dcpl_48 & and_dcpl_44;
  assign and_dcpl_62 = and_dcpl_61 & and_dcpl_36;
  assign and_dcpl_63 = and_dcpl_61 & and_dcpl_40;
  assign and_dcpl_64 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_65 = and_dcpl_64 & (~ (fsm_output[6]));
  assign and_dcpl_66 = and_dcpl_65 & and_dcpl_14;
  assign and_dcpl_67 = and_dcpl_66 & and_dcpl_43;
  assign and_dcpl_68 = and_dcpl_65 & and_dcpl_29;
  assign and_dcpl_69 = and_dcpl_68 & and_dcpl_47;
  assign and_dcpl_70 = and_dcpl_68 & and_dcpl_21;
  assign and_dcpl_71 = and_dcpl_65 & and_dcpl_37;
  assign and_dcpl_72 = and_dcpl_71 & and_dcpl_13;
  assign and_dcpl_73 = and_dcpl_71 & and_dcpl_21;
  assign and_dcpl_74 = and_dcpl_71 & and_dcpl_25;
  assign and_dcpl_75 = and_dcpl_65 & and_dcpl_44;
  assign and_dcpl_76 = and_dcpl_75 & and_dcpl_28;
  assign and_dcpl_77 = and_dcpl_64 & (fsm_output[6]);
  assign and_dcpl_78 = and_dcpl_77 & and_dcpl_14;
  assign and_dcpl_79 = and_dcpl_78 & and_dcpl_36;
  assign and_dcpl_80 = and_dcpl_78 & and_dcpl_40;
  assign and_dcpl_81 = and_dcpl_77 & and_dcpl_29;
  assign and_dcpl_82 = and_dcpl_81 & and_dcpl_43;
  assign and_dcpl_83 = and_dcpl_77 & and_dcpl_37;
  assign and_dcpl_84 = and_dcpl_83 & and_dcpl_47;
  assign and_dcpl_85 = and_dcpl_83 & and_dcpl_21;
  assign and_dcpl_86 = and_dcpl_77 & and_dcpl_44;
  assign and_dcpl_87 = and_dcpl_86 & and_dcpl_13;
  assign and_dcpl_88 = and_dcpl_86 & and_dcpl_25;
  assign and_dcpl_89 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_90 = and_dcpl_89 & (~ (fsm_output[6]));
  assign and_dcpl_91 = and_dcpl_90 & and_dcpl_14;
  assign and_dcpl_92 = and_dcpl_91 & and_dcpl_28;
  assign and_dcpl_93 = and_dcpl_90 & and_dcpl_29;
  assign and_dcpl_94 = and_dcpl_93 & and_dcpl_36;
  assign and_dcpl_95 = and_dcpl_93 & and_dcpl_40;
  assign and_dcpl_96 = and_dcpl_90 & and_dcpl_37;
  assign and_dcpl_97 = and_dcpl_96 & and_dcpl_43;
  assign and_dcpl_98 = and_dcpl_90 & and_dcpl_44;
  assign and_dcpl_99 = and_dcpl_98 & and_dcpl_47;
  assign and_dcpl_100 = and_dcpl_98 & and_dcpl_21;
  assign and_dcpl_102 = ~((fsm_output[6:5]!=2'b00));
  assign or_tmp_169 = (fsm_output[3:2]!=2'b10);
  assign or_tmp_170 = (fsm_output[3:2]!=2'b01);
  assign mux_363_nl = MUX_s_1_2_2(or_tmp_170, or_tmp_169, fsm_output[1]);
  assign and_dcpl_105 = (~ mux_363_nl) & and_dcpl_15 & and_dcpl_102 & (~ (fsm_output[4]))
      & (fsm_output[0]);
  assign mux_364_cse = MUX_s_1_2_2(or_tmp_141, or_tmp_145, fsm_output[3]);
  assign mux_365_cse = MUX_s_1_2_2(or_tmp_145, or_439_cse, fsm_output[3]);
  assign mux_tmp_366 = MUX_s_1_2_2(mux_365_cse, mux_364_cse, fsm_output[5]);
  assign mux_tmp_367 = MUX_s_1_2_2(or_tmp_142, or_dcpl_159, fsm_output[3]);
  assign mux_tmp_386 = MUX_s_1_2_2(mux_tmp_361, mux_tmp_355, fsm_output[4]);
  assign mux_tmp_387 = MUX_s_1_2_2(or_414_cse, mux_tmp_358, fsm_output[4]);
  assign mux_390_nl = MUX_s_1_2_2(or_316_cse, or_tmp_142, fsm_output[5]);
  assign mux_391_nl = MUX_s_1_2_2(mux_390_nl, mux_tmp_358, fsm_output[4]);
  assign mux_392_nl = MUX_s_1_2_2(mux_391_nl, mux_tmp_386, fsm_output[3]);
  assign mux_389_nl = MUX_s_1_2_2(mux_tmp_356, mux_tmp_362, fsm_output[3]);
  assign mux_tmp_393 = MUX_s_1_2_2(mux_392_nl, mux_389_nl, fsm_output[2]);
  assign mux_tmp_395 = MUX_s_1_2_2(mux_tmp_362, mux_tmp_387, fsm_output[3]);
  assign mux_tmp_404 = MUX_s_1_2_2(mux_tmp_318, mux_311_cse, fsm_output[3]);
  assign mux_408_nl = MUX_s_1_2_2(mux_311_cse, mux_tmp_314, fsm_output[3]);
  assign mux_406_nl = MUX_s_1_2_2(mux_315_cse, mux_tmp_318, fsm_output[3]);
  assign mux_tmp_409 = MUX_s_1_2_2(mux_408_nl, mux_406_nl, fsm_output[2]);
  assign mux_412_nl = MUX_s_1_2_2(mux_335_cse, mux_tmp_312, fsm_output[3]);
  assign mux_413_nl = MUX_s_1_2_2(mux_412_nl, mux_tmp_404, fsm_output[2]);
  assign mux_414_nl = MUX_s_1_2_2(mux_413_nl, mux_tmp_409, fsm_output[5]);
  assign mux_401_nl = MUX_s_1_2_2(mux_tmp_312, mux_315_cse, fsm_output[3]);
  assign mux_405_nl = MUX_s_1_2_2(mux_tmp_404, mux_401_nl, fsm_output[2]);
  assign mux_410_nl = MUX_s_1_2_2(mux_tmp_409, mux_405_nl, fsm_output[5]);
  assign mux_415_itm = MUX_s_1_2_2(mux_414_nl, mux_410_nl, fsm_output[1]);
  assign or_367_nl = (fsm_output[8]) | (fsm_output[4]);
  assign or_366_nl = (fsm_output[8]) | (~ (fsm_output[4]));
  assign mux_tmp_416 = MUX_s_1_2_2(or_367_nl, or_366_nl, fsm_output[2]);
  assign or_tmp_206 = (fsm_output[6:5]!=2'b01) | mux_tmp_416;
  assign or_tmp_214 = (fsm_output[8:5]!=4'b0110);
  assign mux_424_cse = MUX_s_1_2_2(mux_493_cse, or_tmp_214, fsm_output[4]);
  assign or_tmp_221 = ~((fsm_output[8:5]==4'b0111));
  assign mux_tmp_429 = MUX_s_1_2_2(or_414_cse, or_tmp_221, fsm_output[4]);
  assign mux_tmp_438 = MUX_s_1_2_2(nand_3_cse, or_352_cse, fsm_output[4]);
  assign mux_tmp_445 = MUX_s_1_2_2(mux_377_cse, mux_381_cse, fsm_output[5]);
  assign mux_449_nl = MUX_s_1_2_2(mux_382_cse, mux_377_cse, fsm_output[5]);
  assign mux_447_nl = MUX_s_1_2_2(mux_381_cse, mux_376_cse, fsm_output[5]);
  assign mux_tmp_450 = MUX_s_1_2_2(mux_449_nl, mux_447_nl, fsm_output[2]);
  assign or_tmp_231 = (fsm_output[6:5]!=2'b10) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (fsm_output[8]);
  assign or_tmp_232 = (fsm_output[6:5]!=2'b01) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (fsm_output[8]);
  assign mux_tmp_457 = MUX_s_1_2_2(or_tmp_232, or_tmp_231, fsm_output[7]);
  assign or_tmp_233 = (fsm_output[7:5]!=3'b100) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (fsm_output[8]);
  assign or_tmp_234 = (fsm_output[6:5]!=2'b00) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (fsm_output[8]);
  assign not_tmp_151 = ~((VEC_LOOP_j_10_12_0_sva_1[12]) & (fsm_output[8]));
  assign or_398_nl = (fsm_output[6]) | not_tmp_151;
  assign or_397_nl = (~ (fsm_output[6])) | (~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (fsm_output[8]);
  assign mux_460_nl = MUX_s_1_2_2(or_398_nl, or_397_nl, fsm_output[5]);
  assign or_tmp_237 = (fsm_output[7]) | mux_460_nl;
  assign mux_tmp_463 = MUX_s_1_2_2(mux_tmp_457, or_tmp_237, fsm_output[4]);
  assign nand_25_nl = ~((fsm_output[6:5]==2'b11) & (VEC_LOOP_j_10_12_0_sva_1[12])
      & (~ (fsm_output[8])));
  assign mux_tmp_464 = MUX_s_1_2_2(or_tmp_231, nand_25_nl, fsm_output[7]);
  assign mux_tmp_482 = MUX_s_1_2_2(mux_tmp_355, mux_tmp_361, fsm_output[2]);
  assign or_tmp_250 = (fsm_output[8:5]!=4'b0100);
  assign mux_tmp_487 = MUX_s_1_2_2(mux_tmp_358, mux_354_cse, fsm_output[2]);
  assign and_dcpl_125 = and_dcpl_17 & and_dcpl_40;
  assign and_dcpl_132 = and_dcpl_52 & and_dcpl_36;
  assign and_dcpl_133 = and_dcpl_52 & and_dcpl_40;
  assign and_dcpl_136 = and_dcpl_61 & and_dcpl_21;
  assign and_dcpl_144 = and_dcpl_78 & and_dcpl_21;
  assign mux_tmp_506 = MUX_s_1_2_2(or_tmp_145, or_tmp_141, fsm_output[1]);
  assign mux_tmp_510 = MUX_s_1_2_2(or_dcpl_159, or_tmp_142, fsm_output[1]);
  assign and_dcpl_164 = and_dcpl_89 & (fsm_output[6]) & and_dcpl_14;
  assign and_dcpl_166 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_168 = and_dcpl_164 & and_dcpl_12 & and_dcpl_166;
  assign not_tmp_164 = ~((fsm_output[0]) & (fsm_output[6]));
  assign mux_517_nl = MUX_s_1_2_2(not_tmp_164, (fsm_output[6]), fsm_output[8]);
  assign or_tmp_278 = (fsm_output[7]) | mux_517_nl;
  assign or_tmp_280 = (fsm_output[8]) | (~ (fsm_output[0])) | (fsm_output[6]);
  assign mux_tmp_518 = MUX_s_1_2_2(or_tmp_280, or_tmp_57, fsm_output[7]);
  assign mux_tmp_520 = MUX_s_1_2_2(or_tmp_56, or_tmp_280, fsm_output[7]);
  assign mux_tmp_521 = MUX_s_1_2_2(or_tmp_278, mux_tmp_520, fsm_output[4]);
  assign mux_519_nl = MUX_s_1_2_2(mux_tmp_518, or_tmp_278, fsm_output[4]);
  assign mux_tmp_522 = MUX_s_1_2_2(mux_tmp_521, mux_519_nl, fsm_output[2]);
  assign or_445_nl = (~ (fsm_output[8])) | (~ (fsm_output[0])) | (fsm_output[6]);
  assign mux_tmp_523 = MUX_s_1_2_2(or_445_nl, or_tmp_56, fsm_output[7]);
  assign or_446_nl = (fsm_output[8]) | not_tmp_164;
  assign mux_tmp_524 = MUX_s_1_2_2(or_tmp_57, or_446_nl, fsm_output[7]);
  assign mux_tmp_525 = MUX_s_1_2_2(mux_tmp_524, mux_tmp_523, fsm_output[4]);
  assign mux_526_nl = MUX_s_1_2_2(mux_tmp_523, mux_tmp_518, fsm_output[4]);
  assign mux_tmp_527 = MUX_s_1_2_2(mux_526_nl, mux_tmp_525, fsm_output[2]);
  assign mux_tmp_528 = MUX_s_1_2_2(mux_tmp_527, mux_tmp_522, fsm_output[5]);
  assign mux_tmp_529 = MUX_s_1_2_2(mux_tmp_520, mux_tmp_524, fsm_output[4]);
  assign or_tmp_285 = (fsm_output[8:5]!=4'b1000);
  assign mux_tmp_537 = MUX_s_1_2_2(or_tmp_214, or_tmp_285, fsm_output[4]);
  assign or_tmp_289 = (fsm_output[8:5]!=4'b1001);
  assign mux_541_nl = MUX_s_1_2_2(or_tmp_221, or_tmp_289, fsm_output[4]);
  assign mux_540_nl = MUX_s_1_2_2(or_tmp_285, or_414_cse, fsm_output[4]);
  assign mux_542_nl = MUX_s_1_2_2(mux_541_nl, mux_540_nl, fsm_output[3]);
  assign mux_539_nl = MUX_s_1_2_2(mux_tmp_429, mux_tmp_537, fsm_output[3]);
  assign mux_543_nl = MUX_s_1_2_2(mux_542_nl, mux_539_nl, fsm_output[2]);
  assign and_dcpl_170 = (~ mux_543_nl) & and_916_cse;
  assign nor_tmp_52 = (and_919_cse | (fsm_output[7])) & (fsm_output[8]);
  assign mux_tmp_561 = MUX_s_1_2_2(mux_268_cse, nor_tmp_7, fsm_output[6]);
  assign or_471_cse = (fsm_output[5:3]!=3'b000);
  assign mux_562_nl = MUX_s_1_2_2(mux_tmp_561, and_tmp_2, or_471_cse);
  assign and_258_nl = ((or_471_cse & (fsm_output[6])) | (fsm_output[7])) & (fsm_output[8]);
  assign mux_563_nl = MUX_s_1_2_2(mux_562_nl, and_258_nl, fsm_output[2]);
  assign mux_tmp_564 = MUX_s_1_2_2(mux_563_nl, nor_tmp_52, fsm_output[1]);
  assign mux_566_nl = MUX_s_1_2_2(mux_tmp_561, and_tmp_2, or_706_cse);
  assign mux_567_nl = MUX_s_1_2_2(mux_566_nl, nor_tmp_52, fsm_output[1]);
  assign mux_tmp_568 = MUX_s_1_2_2(mux_tmp_564, mux_567_nl, fsm_output[0]);
  assign and_dcpl_176 = and_dcpl_12 & nor_124_cse;
  assign and_dcpl_181 = ~((fsm_output[7:6]!=2'b00));
  assign mux_tmp_574 = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[2]);
  assign or_tmp_312 = (or_203_cse & (fsm_output[6])) | (fsm_output[7]);
  assign mux_577_nl = MUX_s_1_2_2((fsm_output[7]), (fsm_output[6]), fsm_output[5]);
  assign mux_tmp_578 = MUX_s_1_2_2(mux_577_nl, or_tmp_25, fsm_output[4]);
  assign mux_tmp_579 = MUX_s_1_2_2(mux_tmp_578, or_tmp_312, fsm_output[3]);
  assign or_484_nl = (fsm_output[7:6]!=2'b01);
  assign mux_581_nl = MUX_s_1_2_2(or_484_nl, or_tmp_25, fsm_output[5]);
  assign or_678_nl = and_918_cse | (fsm_output[7]);
  assign mux_582_nl = MUX_s_1_2_2(mux_581_nl, or_678_nl, fsm_output[4]);
  assign mux_tmp_583 = MUX_s_1_2_2(mux_582_nl, mux_tmp_578, fsm_output[3]);
  assign mux_tmp_584 = MUX_s_1_2_2(mux_tmp_583, or_tmp_312, fsm_output[2]);
  assign nor_tmp_65 = or_715_cse & (fsm_output[8]);
  assign mux_603_cse = MUX_s_1_2_2((~ (fsm_output[8])), (fsm_output[8]), or_tmp_25);
  assign mux_tmp_604 = MUX_s_1_2_2(mux_603_cse, and_tmp_2, fsm_output[5]);
  assign and_dcpl_196 = and_dcpl_17 & and_241_cse_1 & (~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm)
      & and_dcpl_11;
  assign mux_130_nl = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[8]);
  assign mux_tmp_628 = MUX_s_1_2_2(mux_130_nl, (fsm_output[8]), fsm_output[7]);
  assign mux_tmp_629 = MUX_s_1_2_2(nor_tmp_15, (fsm_output[8]), fsm_output[7]);
  assign and_236_cse = (fsm_output[1]) & (VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_tmp_630 = MUX_s_1_2_2(mux_tmp_629, mux_tmp_628, and_236_cse);
  assign mux_tmp_633 = MUX_s_1_2_2((fsm_output[6]), (fsm_output[8]), fsm_output[7]);
  assign mux_tmp_634 = MUX_s_1_2_2(mux_tmp_629, mux_tmp_633, and_236_cse);
  assign mux_639_nl = MUX_s_1_2_2(mux_tmp_629, mux_tmp_633, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_637_nl = MUX_s_1_2_2(nor_tmp_15, or_tmp_56, fsm_output[7]);
  assign mux_638_nl = MUX_s_1_2_2(mux_tmp_629, mux_637_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_tmp_640 = MUX_s_1_2_2(mux_639_nl, mux_638_nl, fsm_output[1]);
  assign mux_641_nl = MUX_s_1_2_2(nor_tmp_15, or_tmp_57, fsm_output[7]);
  assign mux_tmp_642 = MUX_s_1_2_2(mux_tmp_629, mux_641_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign or_513_nl = (VEC_LOOP_j_10_12_0_sva_1[12]) | (fsm_output[7]);
  assign mux_646_nl = MUX_s_1_2_2(nor_tmp_15, (fsm_output[8]), or_513_nl);
  assign mux_tmp_647 = MUX_s_1_2_2(mux_tmp_642, mux_646_nl, fsm_output[1]);
  assign mux_651_nl = MUX_s_1_2_2(mux_tmp_629, mux_tmp_628, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_tmp_652 = MUX_s_1_2_2(mux_651_nl, mux_tmp_642, fsm_output[1]);
  assign mux_tmp_657 = MUX_s_1_2_2((~ or_tmp_56), (fsm_output[8]), fsm_output[7]);
  assign or_tmp_350 = (~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[5]);
  assign or_tmp_351 = (fsm_output[3]) | (~ (fsm_output[6])) | (fsm_output[5]);
  assign or_tmp_353 = (fsm_output[6:5]!=2'b01);
  assign or_536_nl = (fsm_output[8:4]!=5'b01110);
  assign mux_707_nl = MUX_s_1_2_2(mux_tmp_537, or_536_nl, fsm_output[3]);
  assign mux_705_nl = MUX_s_1_2_2(or_tmp_289, or_tmp_214, fsm_output[4]);
  assign mux_706_nl = MUX_s_1_2_2(mux_705_nl, mux_tmp_429, fsm_output[3]);
  assign mux_708_nl = MUX_s_1_2_2(mux_707_nl, mux_706_nl, fsm_output[2]);
  assign and_dcpl_201 = (~ mux_708_nl) & and_dcpl_11 & (VEC_LOOP_j_10_12_0_sva_1[12]);
  assign or_tmp_379 = and_dcpl_181 | (fsm_output[8]);
  assign mux_tmp_728 = MUX_s_1_2_2(mux_268_cse, or_tmp_37, fsm_output[6]);
  assign mux_tmp_730 = MUX_s_1_2_2(nor_tmp_7, or_tmp_37, fsm_output[6]);
  assign mux_tmp_731 = MUX_s_1_2_2(mux_tmp_730, mux_tmp_728, fsm_output[4]);
  assign mux_tmp_733 = MUX_s_1_2_2(mux_tmp_730, mux_tmp_728, or_556_cse);
  assign and_225_nl = (fsm_output[4:2]==3'b111);
  assign mux_tmp_744 = MUX_s_1_2_2(mux_603_cse, or_tmp_379, and_225_nl);
  assign or_tmp_386 = (fsm_output[6]) | mux_268_cse;
  assign nor_98_nl = ~((fsm_output[2]) | (~ (fsm_output[4])));
  assign nor_104_nl = ~((~ (fsm_output[2])) | (fsm_output[4]));
  assign mux_756_nl = MUX_s_1_2_2(nor_98_nl, nor_104_nl, fsm_output[1]);
  assign and_dcpl_205 = mux_756_nl & and_dcpl_15 & and_dcpl_102 & (~ (fsm_output[3]))
      & (~ (fsm_output[0]));
  assign mux_761_nl = MUX_s_1_2_2(mux_tmp_355, mux_493_cse, fsm_output[3]);
  assign mux_759_nl = MUX_s_1_2_2(mux_tmp_358, mux_tmp_355, fsm_output[3]);
  assign mux_tmp_762 = MUX_s_1_2_2(mux_761_nl, mux_759_nl, fsm_output[1]);
  assign mux_tmp_764 = MUX_s_1_2_2(or_414_cse, mux_tmp_361, fsm_output[3]);
  assign mux_769_nl = MUX_s_1_2_2(mux_493_cse, mux_354_cse, fsm_output[3]);
  assign mux_770_nl = MUX_s_1_2_2(mux_tmp_764, mux_769_nl, fsm_output[1]);
  assign mux_771_nl = MUX_s_1_2_2(mux_tmp_762, mux_770_nl, fsm_output[4]);
  assign mux_765_nl = MUX_s_1_2_2(mux_tmp_361, mux_tmp_358, fsm_output[3]);
  assign mux_766_nl = MUX_s_1_2_2(mux_765_nl, mux_tmp_764, fsm_output[1]);
  assign mux_767_nl = MUX_s_1_2_2(mux_766_nl, mux_tmp_762, fsm_output[4]);
  assign mux_772_nl = MUX_s_1_2_2(mux_771_nl, mux_767_nl, fsm_output[2]);
  assign and_dcpl_206 = ~(mux_772_nl | (fsm_output[0]));
  assign mux_801_nl = MUX_s_1_2_2(or_dcpl_159, or_tmp_141, fsm_output[3]);
  assign mux_803_nl = MUX_s_1_2_2(mux_364_cse, mux_801_nl, fsm_output[5]);
  assign mux_806_cse = MUX_s_1_2_2(mux_tmp_366, mux_803_nl, fsm_output[1]);
  assign or_tmp_425 = (~ (fsm_output[5])) | (fsm_output[8]) | (fsm_output[7]);
  assign or_596_nl = (fsm_output[5]) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_tmp_817 = MUX_s_1_2_2(or_tmp_425, or_596_nl, fsm_output[6]);
  assign mux_909_nl = MUX_s_1_2_2(or_653_cse, mux_tmp_817, fsm_output[4]);
  assign mux_tmp_822 = MUX_s_1_2_2(mux_915_cse, mux_909_nl, fsm_output[2]);
  assign mux_tmp_823 = MUX_s_1_2_2(or_tmp_36, or_tmp_37, fsm_output[5]);
  assign nand_tmp_12 = ~((fsm_output[6]) & (~ mux_tmp_823));
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_164 & and_dcpl_13;
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c0 = ~(mux_886_cse | (fsm_output[0]));
  assign mux_830_nl = MUX_s_1_2_2(nand_tmp_12, or_653_cse, fsm_output[4]);
  assign mux_829_nl = MUX_s_1_2_2(or_414_cse, nand_tmp_12, fsm_output[4]);
  assign mux_831_nl = MUX_s_1_2_2(mux_830_nl, mux_829_nl, fsm_output[2]);
  assign mux_832_nl = MUX_s_1_2_2(mux_tmp_822, mux_831_nl, fsm_output[3]);
  assign or_605_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_825_nl = MUX_s_1_2_2(or_605_nl, or_655_cse, fsm_output[6]);
  assign mux_826_nl = MUX_s_1_2_2(mux_825_nl, nand_tmp_12, fsm_output[4]);
  assign or_603_nl = (fsm_output[6]) | mux_tmp_823;
  assign mux_824_nl = MUX_s_1_2_2(mux_913_cse, or_603_nl, fsm_output[4]);
  assign mux_827_nl = MUX_s_1_2_2(mux_826_nl, mux_824_nl, fsm_output[2]);
  assign mux_828_nl = MUX_s_1_2_2(mux_827_nl, mux_tmp_822, fsm_output[3]);
  assign mux_833_nl = MUX_s_1_2_2(mux_832_nl, mux_828_nl, fsm_output[1]);
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c2 = (~ mux_833_nl) & (fsm_output[0]);
  assign xor_dcpl = ~((fsm_output[7]) ^ (fsm_output[5]));
  assign VEC_LOOP_or_10_cse = and_dcpl_18 | and_dcpl_39 | and_dcpl_46 | and_dcpl_51
      | and_dcpl_58 | and_dcpl_62 | and_dcpl_67 | and_dcpl_70 | and_dcpl_74 | and_dcpl_79
      | and_dcpl_82 | and_dcpl_85 | and_dcpl_88 | and_dcpl_94 | and_dcpl_97 | and_dcpl_100;
  assign VEC_LOOP_or_12_cse = and_dcpl_41 | and_dcpl_63 | and_dcpl_80 | and_dcpl_95;
  assign VEC_LOOP_or_30_cse = and_dcpl_53 | and_dcpl_87;
  assign VEC_LOOP_or_22_cse = and_dcpl_26 | and_dcpl_53 | and_dcpl_72 | and_dcpl_87;
  assign VEC_LOOP_mux1h_10_nl = MUX1HOT_v_8_6_2((z_out_12[11:4]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[11:4]),
      (z_out_14[10:3]), (z_out_19[9:2]), (z_out_19[8:1]), (z_out_19[7:0]), {VEC_LOOP_or_10_cse
      , and_dcpl_26 , VEC_LOOP_or_29_cse , VEC_LOOP_or_12_cse , VEC_LOOP_or_30_cse
      , and_dcpl_72});
  assign VEC_LOOP_mux1h_8_nl = MUX1HOT_s_1_6_2((z_out_12[3]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[3]),
      (z_out_14[2]), (z_out_19[1]), (z_out_19[0]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      {VEC_LOOP_or_10_cse , and_dcpl_26 , VEC_LOOP_or_29_cse , VEC_LOOP_or_12_cse
      , VEC_LOOP_or_30_cse , and_dcpl_72});
  assign and_116_nl = (~ mux_tmp_387) & and_dcpl_13;
  assign VEC_LOOP_mux1h_6_nl = MUX1HOT_s_1_5_2((z_out_12[2]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[2]),
      (z_out_14[1]), (z_out_19[0]), (VEC_LOOP_acc_1_cse_10_sva[2]), {VEC_LOOP_or_10_cse
      , and_dcpl_26 , VEC_LOOP_or_29_cse , VEC_LOOP_or_12_cse , and_116_nl});
  assign mux_388_nl = MUX_s_1_2_2(mux_tmp_387, mux_tmp_386, fsm_output[3]);
  assign and_114_nl = (~ mux_388_nl) & (fsm_output[2:0]==3'b101);
  assign VEC_LOOP_mux1h_4_nl = MUX1HOT_s_1_4_2((z_out_12[1]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[1]),
      (z_out_14[0]), (VEC_LOOP_acc_1_cse_10_sva[1]), {VEC_LOOP_or_10_cse , and_dcpl_26
      , VEC_LOOP_or_29_cse , and_114_nl});
  assign mux_372_nl = MUX_s_1_2_2(mux_tmp_366, mux_371_cse, fsm_output[4]);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_cse, mux_tmp_366, fsm_output[4]);
  assign mux_373_nl = MUX_s_1_2_2(mux_372_nl, mux_369_nl, fsm_output[2]);
  assign and_110_nl = (~ mux_373_nl) & and_dcpl_11;
  assign VEC_LOOP_mux1h_2_nl = MUX1HOT_s_1_3_2((z_out_12[0]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[0]),
      (VEC_LOOP_acc_1_cse_10_sva[0]), {VEC_LOOP_or_10_cse , and_dcpl_26 , and_110_nl});
  assign and_26_nl = and_dcpl_17 & and_dcpl_21;
  assign VEC_LOOP_mux1h_nl = MUX1HOT_v_7_36_2((z_out_19[6:0]), COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0,
      (VEC_LOOP_acc_10_cse_1_sva[11:5]), (z_out_12[11:5]), (VEC_LOOP_acc_1_cse_10_sva[11:5]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[11:5]), ({VEC_LOOP_acc_11_psp_sva_10 , VEC_LOOP_acc_11_psp_sva_9
      , (VEC_LOOP_acc_11_psp_sva_8_0[8:4])}), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[11:5]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[11:5]), ({VEC_LOOP_acc_11_psp_sva_9 , (VEC_LOOP_acc_11_psp_sva_8_0[8:3])}),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[11:5]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[11:5]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[11:5]), (VEC_LOOP_acc_11_psp_sva_8_0[8:2]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[11:5]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[11:5]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[11:5]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[11:5]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[11:5]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[11:5]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[11:5]), (COMP_LOOP_17_twiddle_f_mul_psp_sva[7:1]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[11:5]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[11:5]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[11:5]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[11:5]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[11:5]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[11:5]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[11:5]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[11:5]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[11:5]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[11:5]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[11:5]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[11:5]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[11:5]), (VEC_LOOP_acc_10_cse_sva_mx0w31[11:5]),
      {and_dcpl_18 , and_26_nl , and_dcpl_23 , VEC_LOOP_or_22_cse , and_dcpl_27 ,
      and_dcpl_31 , and_dcpl_34 , and_dcpl_39 , and_dcpl_41 , and_dcpl_42 , and_dcpl_46
      , and_dcpl_50 , and_dcpl_51 , and_dcpl_57 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62
      , and_dcpl_63 , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_73 , and_dcpl_74
      , and_dcpl_76 , and_dcpl_79 , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 , and_dcpl_85
      , and_dcpl_88 , and_dcpl_92 , and_dcpl_94 , and_dcpl_95 , and_dcpl_97 , and_dcpl_99
      , and_dcpl_100});
  assign VEC_LOOP_mux1h_1_nl = MUX1HOT_s_1_35_2((COMP_LOOP_twiddle_f_17_sva[4]),
      (VEC_LOOP_acc_10_cse_1_sva[4]), (z_out_12[4]), (VEC_LOOP_acc_1_cse_10_sva[4]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[4]), (VEC_LOOP_acc_11_psp_sva_8_0[3]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[4]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[4]), (VEC_LOOP_acc_11_psp_sva_8_0[2]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[4]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[4]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[4]),
      (VEC_LOOP_acc_11_psp_sva_8_0[1]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[4]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[4]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[4]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[4]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[4]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[4]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[4]), (COMP_LOOP_17_twiddle_f_mul_psp_sva[0]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[4]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[4]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[4]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[4]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[4]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[4]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[4]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[4]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[4]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[4]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[4]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[4]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[4]), (VEC_LOOP_acc_10_cse_sva_mx0w31[4]),
      {and_dcpl_105 , and_dcpl_23 , VEC_LOOP_or_22_cse , and_dcpl_27 , and_dcpl_31
      , and_dcpl_34 , and_dcpl_39 , and_dcpl_41 , and_dcpl_42 , and_dcpl_46 , and_dcpl_50
      , and_dcpl_51 , and_dcpl_57 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62 , and_dcpl_63
      , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_73 , and_dcpl_74 , and_dcpl_76
      , and_dcpl_79 , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 , and_dcpl_85 , and_dcpl_88
      , and_dcpl_92 , and_dcpl_94 , and_dcpl_95 , and_dcpl_97 , and_dcpl_99 , and_dcpl_100});
  assign mux_383_nl = MUX_s_1_2_2(mux_382_cse, mux_381_cse, fsm_output[2]);
  assign mux_378_nl = MUX_s_1_2_2(mux_377_cse, mux_376_cse, fsm_output[2]);
  assign mux_384_nl = MUX_s_1_2_2(mux_383_nl, mux_378_nl, fsm_output[5]);
  assign or_343_nl = (fsm_output[8:2]!=7'b0101010);
  assign mux_385_nl = MUX_s_1_2_2(mux_384_nl, or_343_nl, fsm_output[1]);
  assign and_111_nl = (~ mux_385_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_3_nl = MUX1HOT_s_1_34_2((COMP_LOOP_twiddle_f_17_sva[3]),
      (VEC_LOOP_acc_10_cse_1_sva[3]), (z_out_12[3]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[3]), (VEC_LOOP_acc_11_psp_sva_8_0[2]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[3]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[3]), (VEC_LOOP_acc_11_psp_sva_8_0[1]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[3]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[3]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[3]),
      (VEC_LOOP_acc_11_psp_sva_8_0[0]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[3]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[3]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[3]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[3]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[3]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[3]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[3]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[3]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[3]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[3]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[3]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[3]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[3]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[3]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[3]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[3]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[3]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[3]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[3]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[3]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[3]), {and_dcpl_105 , and_dcpl_23 , VEC_LOOP_or_22_cse
      , and_111_nl , and_dcpl_31 , and_dcpl_34 , and_dcpl_39 , and_dcpl_41 , and_dcpl_42
      , and_dcpl_46 , and_dcpl_50 , and_dcpl_51 , and_dcpl_57 , and_dcpl_58 , and_dcpl_60
      , and_dcpl_62 , and_dcpl_63 , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_74
      , and_dcpl_76 , and_dcpl_79 , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 , and_dcpl_85
      , and_dcpl_88 , and_dcpl_92 , and_dcpl_94 , and_dcpl_95 , and_dcpl_97 , and_dcpl_99
      , and_dcpl_100});
  assign or_686_nl = (fsm_output[3:2]!=2'b10) | mux_tmp_387;
  assign mux_394_nl = MUX_s_1_2_2(mux_tmp_393, or_686_nl, fsm_output[1]);
  assign and_115_nl = (~ mux_394_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_5_nl = MUX1HOT_s_1_33_2((COMP_LOOP_twiddle_f_17_sva[2]),
      (VEC_LOOP_acc_10_cse_1_sva[2]), (z_out_12[2]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[2]), (VEC_LOOP_acc_11_psp_sva_8_0[1]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[2]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[2]), (VEC_LOOP_acc_11_psp_sva_8_0[0]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[2]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[2]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[2]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[2]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[2]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[2]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[2]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[2]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[2]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[2]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[2]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[2]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[2]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[2]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[2]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[2]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[2]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[2]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[2]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[2]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[2]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[2]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[2]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[2]), {and_dcpl_105 , and_dcpl_23 , VEC_LOOP_or_22_cse
      , and_115_nl , and_dcpl_31 , and_dcpl_34 , and_dcpl_39 , and_dcpl_41 , and_dcpl_42
      , and_dcpl_46 , and_dcpl_50 , and_dcpl_51 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62
      , and_dcpl_63 , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_74 , and_dcpl_76
      , and_dcpl_79 , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 , and_dcpl_85 , and_dcpl_88
      , and_dcpl_92 , and_dcpl_94 , and_dcpl_95 , and_dcpl_97 , and_dcpl_99 , and_dcpl_100});
  assign or_356_nl = (fsm_output[2]) | mux_tmp_395;
  assign mux_396_nl = MUX_s_1_2_2(mux_tmp_393, or_356_nl, fsm_output[1]);
  assign and_117_nl = (~ mux_396_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_7_nl = MUX1HOT_s_1_32_2((COMP_LOOP_twiddle_f_17_sva[1]),
      (VEC_LOOP_acc_10_cse_1_sva[1]), (z_out_12[1]), (VEC_LOOP_acc_1_cse_10_sva[1]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[1]), (VEC_LOOP_acc_11_psp_sva_8_0[0]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[1]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[1]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[1]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[1]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[1]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[1]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[1]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[1]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[1]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[1]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[1]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[1]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[1]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[1]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[1]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[1]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[1]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[1]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[1]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[1]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[1]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[1]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[1]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[1]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[1]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[1]), {and_dcpl_105 , and_dcpl_23 , VEC_LOOP_or_22_cse
      , and_117_nl , and_dcpl_31 , and_dcpl_34 , and_dcpl_39 , and_dcpl_41 , and_dcpl_46
      , and_dcpl_50 , and_dcpl_51 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62 , and_dcpl_63
      , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_74 , and_dcpl_76 , and_dcpl_79
      , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 , and_dcpl_85 , and_dcpl_88 , and_dcpl_92
      , and_dcpl_94 , and_dcpl_95 , and_dcpl_97 , and_dcpl_99 , and_dcpl_100});
  assign mux_397_nl = MUX_s_1_2_2(mux_tmp_395, mux_tmp_360, fsm_output[2]);
  assign mux_398_nl = MUX_s_1_2_2(mux_tmp_393, mux_397_nl, fsm_output[1]);
  assign and_118_nl = (~ mux_398_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_9_nl = MUX1HOT_s_1_31_2((COMP_LOOP_twiddle_f_17_sva[0]),
      (VEC_LOOP_acc_10_cse_1_sva[0]), (z_out_12[0]), (VEC_LOOP_acc_1_cse_10_sva[0]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[0]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[0]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[0]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[0]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[0]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[0]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[0]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[0]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[0]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[0]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[0]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[0]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[0]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[0]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[0]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[0]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[0]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[0]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[0]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[0]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[0]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[0]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[0]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[0]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[0]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[0]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[0]), {and_dcpl_105 , and_dcpl_23 , VEC_LOOP_or_22_cse
      , and_118_nl , and_dcpl_31 , and_dcpl_39 , and_dcpl_41 , and_dcpl_46 , and_dcpl_50
      , and_dcpl_51 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62 , and_dcpl_63 , and_dcpl_67
      , and_dcpl_69 , and_dcpl_70 , and_dcpl_74 , and_dcpl_76 , and_dcpl_79 , and_dcpl_80
      , and_dcpl_82 , and_dcpl_84 , and_dcpl_85 , and_dcpl_88 , and_dcpl_92 , and_dcpl_94
      , and_dcpl_95 , and_dcpl_97 , and_dcpl_99 , and_dcpl_100});
  assign vec_rsci_adra_d = {VEC_LOOP_mux1h_10_nl , VEC_LOOP_mux1h_8_nl , VEC_LOOP_mux1h_6_nl
      , VEC_LOOP_mux1h_4_nl , VEC_LOOP_mux1h_2_nl , VEC_LOOP_mux1h_nl , VEC_LOOP_mux1h_1_nl
      , VEC_LOOP_mux1h_3_nl , VEC_LOOP_mux1h_5_nl , VEC_LOOP_mux1h_7_nl , VEC_LOOP_mux1h_9_nl};
  assign vec_rsci_wea_d = vec_rsci_wea_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign twiddle_rsci_adra_d = {COMP_LOOP_twiddle_help_mux_1_rmff , COMP_LOOP_twiddle_help_mux_rmff
      , COMP_LOOP_twiddle_f_mux1h_87_rmff , COMP_LOOP_and_rmff , COMP_LOOP_twiddle_f_mux1h_57_rmff
      , COMP_LOOP_twiddle_f_mux1h_110_rmff , COMP_LOOP_twiddle_f_mux1h_126_rmff};
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_adra_d = {COMP_LOOP_twiddle_help_mux_1_rmff , COMP_LOOP_twiddle_help_mux_rmff
      , COMP_LOOP_twiddle_f_mux1h_87_rmff , COMP_LOOP_and_rmff , COMP_LOOP_twiddle_f_mux1h_57_rmff
      , COMP_LOOP_twiddle_f_mux1h_110_rmff , COMP_LOOP_twiddle_f_mux1h_126_rmff};
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_da_d = vec_rsci_da_d_reg;
  assign nor_171_cse = ~((fsm_output[8:6]!=3'b000));
  assign and_dcpl_256 = nor_171_cse & and_dcpl_14 & (fsm_output[3:0]==4'b1101);
  assign and_dcpl_262 = (fsm_output[8:6]==3'b001);
  assign and_dcpl_264 = and_dcpl_262 & and_dcpl_14 & and_dcpl_20 & (fsm_output[1:0]==2'b01);
  assign and_dcpl_269 = and_dcpl_262 & (fsm_output[5:4]==2'b11) & and_dcpl_21;
  assign and_dcpl_271 = (fsm_output[8:6]==3'b011);
  assign and_dcpl_273 = and_dcpl_271 & and_dcpl_14 & and_dcpl_21;
  assign and_dcpl_278 = and_dcpl_271 & (fsm_output[5:2]==4'b0111) & and_916_cse;
  assign and_dcpl_291 = nor_171_cse & (fsm_output[5:2]==4'b1010) & and_916_cse;
  assign and_dcpl_296 = nor_171_cse & (fsm_output[5:2]==4'b1111) & and_916_cse;
  assign and_dcpl_302 = (fsm_output[8:6]==3'b011) & and_dcpl_29 & and_dcpl_12 & (fsm_output[1:0]==2'b01);
  assign and_dcpl_305 = ~((fsm_output[3:0]!=4'b0001));
  assign and_dcpl_310 = and_dcpl_181 & (~ (fsm_output[8])) & (fsm_output[5]) & (~
      (fsm_output[4])) & and_dcpl_305;
  assign and_dcpl_315 = (fsm_output[8:6]==3'b001) & and_dcpl_44 & and_dcpl_305;
  assign and_dcpl_318 = (fsm_output[3:0]==4'b0111);
  assign and_dcpl_322 = (fsm_output[8:6]==3'b010) & and_dcpl_44 & and_dcpl_318;
  assign and_dcpl_326 = and_dcpl_181 & (fsm_output[8]) & (~ (fsm_output[5])) & (~
      (fsm_output[4])) & and_dcpl_318;
  assign and_dcpl_353 = (fsm_output[3:2]==2'b01) & and_dcpl_11;
  assign and_dcpl_358 = and_dcpl_181 & (~ (fsm_output[8])) & (fsm_output[5]) & (fsm_output[4])
      & and_dcpl_353;
  assign and_dcpl_365 = (fsm_output[8:6]==3'b001) & and_dcpl_29 & (fsm_output[3:2]==2'b11)
      & and_dcpl_11;
  assign and_dcpl_370 = (fsm_output[8:4]==5'b01000) & and_dcpl_353;
  assign and_dcpl_376 = and_dcpl_181 & (fsm_output[8]) & and_dcpl_29 & (fsm_output[3:0]==4'b1011);
  assign and_dcpl_384 = and_dcpl_65 & (fsm_output[5:2]==4'b0011) & and_916_cse;
  assign and_dcpl_386 = (fsm_output[3:2]==2'b00) & and_916_cse;
  assign and_dcpl_389 = and_dcpl_65 & and_dcpl_37 & and_dcpl_386;
  assign and_dcpl_395 = and_dcpl_77 & and_dcpl_37 & (fsm_output[3:0]==4'b1001);
  assign and_dcpl_398 = and_dcpl_77 & (fsm_output[5:4]==2'b11) & and_dcpl_386;
  assign and_dcpl_412 = (fsm_output[8:6]==3'b010);
  assign and_dcpl_414 = and_dcpl_412 & (fsm_output[5:2]==4'b0110) & and_dcpl_11;
  assign and_dcpl_418 = and_dcpl_412 & and_dcpl_37 & (fsm_output[3:2]==2'b11) & and_dcpl_11;
  assign and_dcpl_423 = (fsm_output[8:6]==3'b100) & and_dcpl_37 & and_dcpl_12 & and_dcpl_11;
  assign and_dcpl_438 = ~((fsm_output!=9'b000000010));
  assign and_524_cse = (fsm_output[8:6]==3'b101) & and_dcpl_14 & and_dcpl_12 & (fsm_output[1:0]==2'b00);
  assign and_dcpl_455 = and_dcpl_12 & (fsm_output[1:0]==2'b01);
  assign and_dcpl_460 = and_dcpl_17 & and_dcpl_455;
  assign and_dcpl_464 = and_dcpl_52 & and_dcpl_455;
  assign and_dcpl_469 = and_dcpl_71 & and_dcpl_455;
  assign and_dcpl_473 = and_dcpl_86 & and_dcpl_455;
  assign and_dcpl_476 = (fsm_output[3:2]==2'b11) & and_916_cse;
  assign and_dcpl_477 = and_dcpl_17 & and_dcpl_476;
  assign and_dcpl_481 = and_dcpl_16 & and_dcpl_37 & and_dcpl_386;
  assign and_dcpl_484 = and_dcpl_16 & and_dcpl_44 & and_dcpl_43;
  assign and_dcpl_486 = (fsm_output[3:2]==2'b10) & and_916_cse;
  assign and_dcpl_488 = and_dcpl_48 & and_dcpl_14 & and_dcpl_486;
  assign and_dcpl_489 = and_dcpl_52 & and_dcpl_476;
  assign and_dcpl_491 = and_dcpl_48 & and_dcpl_44 & and_dcpl_386;
  assign and_dcpl_493 = and_dcpl_65 & and_dcpl_14 & and_dcpl_43;
  assign and_dcpl_495 = and_dcpl_65 & and_dcpl_29 & and_dcpl_486;
  assign and_dcpl_496 = and_dcpl_71 & and_dcpl_476;
  assign and_dcpl_498 = and_dcpl_77 & and_dcpl_14 & and_dcpl_386;
  assign and_dcpl_500 = and_dcpl_77 & and_dcpl_29 & and_dcpl_43;
  assign and_dcpl_502 = and_dcpl_77 & and_dcpl_37 & and_dcpl_486;
  assign and_dcpl_503 = and_dcpl_86 & and_dcpl_476;
  assign and_dcpl_505 = (fsm_output[8:6]==3'b100);
  assign and_dcpl_507 = and_dcpl_505 & and_dcpl_29 & and_dcpl_386;
  assign and_dcpl_509 = and_dcpl_505 & and_dcpl_37 & and_dcpl_43;
  assign and_dcpl_511 = and_dcpl_505 & and_dcpl_44 & and_dcpl_486;
  assign and_dcpl_517 = and_dcpl_181 & (~ (fsm_output[8]));
  assign and_dcpl_529 = and_dcpl_517 & and_dcpl_37;
  assign and_dcpl_534 = (fsm_output[3:2]==2'b01) & and_916_cse;
  assign and_dcpl_541 = and_dcpl_262 & and_dcpl_14;
  assign and_dcpl_549 = and_dcpl_262 & and_dcpl_44;
  assign and_dcpl_556 = and_dcpl_412 & and_dcpl_29;
  assign and_dcpl_565 = and_dcpl_271 & and_dcpl_14;
  assign and_dcpl_570 = and_dcpl_271 & and_dcpl_37;
  assign and_dcpl_575 = and_dcpl_181 & (fsm_output[8]);
  assign and_dcpl_578 = and_dcpl_575 & and_dcpl_29;
  assign and_dcpl_583 = and_dcpl_575 & and_dcpl_44;
  assign and_dcpl_588 = (fsm_output[3:2]==2'b10) & and_dcpl_11;
  assign and_dcpl_593 = and_dcpl_15 & (~ (fsm_output[6])) & and_dcpl_29 & and_dcpl_588;
  assign and_dcpl_595 = (fsm_output[3:2]==2'b00) & and_dcpl_11;
  assign and_dcpl_599 = and_dcpl_48 & and_dcpl_14 & and_dcpl_595;
  assign and_dcpl_602 = and_dcpl_48 & and_dcpl_37 & and_dcpl_588;
  assign and_dcpl_606 = and_dcpl_65 & and_dcpl_29 & and_dcpl_595;
  assign and_dcpl_609 = and_dcpl_65 & and_dcpl_44 & and_dcpl_588;
  assign and_dcpl_612 = and_dcpl_64 & (fsm_output[6]) & and_dcpl_37 & and_dcpl_595;
  assign and_dcpl_616 = and_dcpl_90 & and_dcpl_14 & and_dcpl_588;
  assign and_dcpl_618 = and_dcpl_90 & and_dcpl_44 & and_dcpl_595;
  assign and_dcpl_623 = and_dcpl_89 & (fsm_output[6]) & and_dcpl_14 & (fsm_output[3:2]==2'b01)
      & and_dcpl_11;
  assign and_dcpl_626 = ~((fsm_output[3:0]!=4'b0010));
  assign and_dcpl_631 = and_dcpl_181 & (fsm_output[8]) & (~ (fsm_output[5])) & (fsm_output[4])
      & and_dcpl_626;
  assign and_dcpl_636 = (fsm_output[8:4]==5'b01100) & and_dcpl_626;
  assign and_dcpl_641 = (fsm_output[8:4]==5'b00111) & and_dcpl_626;
  assign and_dcpl_649 = (fsm_output[8:6]==3'b010) & and_dcpl_37 & (fsm_output[3:0]==4'b0100);
  assign and_dcpl_652 = and_dcpl_181 & (~ (fsm_output[8])) & and_dcpl_37 & and_dcpl_626;
  assign and_dcpl_656 = (fsm_output[3:2]==2'b00) & nor_124_cse;
  assign and_dcpl_661 = and_dcpl_505 & and_dcpl_44 & and_dcpl_656;
  assign and_dcpl_663 = and_241_cse_1 & nor_124_cse;
  assign and_dcpl_666 = and_dcpl_505 & and_dcpl_29 & and_dcpl_663;
  assign and_dcpl_668 = (fsm_output[3:2]==2'b10) & nor_124_cse;
  assign and_dcpl_671 = and_dcpl_505 & and_dcpl_14 & and_dcpl_668;
  assign and_dcpl_674 = and_dcpl_12 & and_dcpl_166;
  assign and_dcpl_677 = and_dcpl_505 & and_dcpl_37 & and_dcpl_674;
  assign and_dcpl_678 = and_241_cse_1 & and_dcpl_166;
  assign and_dcpl_681 = and_dcpl_271 & and_dcpl_44;
  assign and_dcpl_682 = and_dcpl_681 & and_dcpl_678;
  assign and_dcpl_684 = and_dcpl_681 & and_dcpl_176;
  assign and_dcpl_686 = and_dcpl_271 & and_dcpl_37 & and_dcpl_656;
  assign and_dcpl_690 = and_dcpl_48 & and_dcpl_37 & and_dcpl_668;
  assign and_dcpl_693 = and_dcpl_16 & and_dcpl_29 & and_dcpl_668;
  assign and_dcpl_695 = and_dcpl_48 & and_dcpl_14 & and_dcpl_656;
  assign and_dcpl_697 = and_dcpl_16 & and_dcpl_37 & and_dcpl_663;
  assign and_dcpl_699 = and_dcpl_52 & and_dcpl_176;
  assign and_dcpl_701 = and_dcpl_16 & and_dcpl_44 & and_dcpl_674;
  assign and_dcpl_702 = and_dcpl_52 & and_dcpl_678;
  assign and_dcpl_705 = (fsm_output[3:2]==2'b01) & and_dcpl_166;
  assign and_dcpl_758 = and_dcpl_517 & and_dcpl_14 & and_dcpl_353;
  assign and_dcpl_763 = and_dcpl_412 & and_dcpl_37 & and_dcpl_353;
  assign and_dcpl_765 = (fsm_output[3:2]==2'b11) & and_dcpl_11;
  assign and_dcpl_767 = and_dcpl_517 & and_dcpl_37 & and_dcpl_765;
  assign and_dcpl_772 = and_dcpl_262 & and_dcpl_44 & and_dcpl_765;
  assign and_dcpl_776 = and_dcpl_271 & and_dcpl_14 & and_dcpl_765;
  assign and_dcpl_780 = and_dcpl_575 & and_dcpl_29 & and_dcpl_765;
  assign and_dcpl_782 = and_dcpl_262 & and_dcpl_29 & and_dcpl_353;
  assign and_dcpl_784 = and_dcpl_271 & and_dcpl_44 & and_dcpl_353;
  assign and_dcpl_787 = (fsm_output[3:0]==4'b1010);
  assign and_dcpl_789 = and_dcpl_271 & and_dcpl_37 & and_dcpl_787;
  assign and_dcpl_791 = and_dcpl_412 & and_dcpl_29 & and_dcpl_787;
  assign and_dcpl_793 = and_dcpl_575 & and_dcpl_44 & and_dcpl_787;
  assign and_dcpl_795 = and_dcpl_262 & and_dcpl_14 & and_dcpl_787;
  assign and_dcpl_803 = and_dcpl_15 & (~ (fsm_output[6])) & and_dcpl_14 & and_dcpl_455;
  assign and_dcpl_807 = and_dcpl_15 & (fsm_output[6:4]==3'b101) & and_dcpl_455;
  assign and_dcpl_812 = and_dcpl_64 & (fsm_output[6:4]==3'b010) & and_dcpl_455;
  assign and_dcpl_816 = and_dcpl_64 & (fsm_output[6:4]==3'b111) & and_dcpl_455;
  assign VEC_LOOP_or_5_ssc = and_dcpl_464 | and_dcpl_469 | and_dcpl_473;
  assign VEC_LOOP_or_4_ssc = and_dcpl_477 | and_dcpl_481 | and_dcpl_484 | and_dcpl_488
      | and_dcpl_489 | and_dcpl_491 | and_dcpl_493 | and_dcpl_495 | and_dcpl_496
      | and_dcpl_498 | and_dcpl_500 | and_dcpl_502 | and_dcpl_503 | and_dcpl_507
      | and_dcpl_509 | and_dcpl_511;
  assign VEC_LOOP_or_37_ssc = and_dcpl_758 | and_dcpl_793;
  assign or_tmp_512 = (fsm_output[7:4]!=4'b0000);
  assign or_tmp_519 = (~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[0]));
  assign or_722_nl = (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[0]));
  assign mux_tmp_966 = MUX_s_1_2_2(or_722_nl, or_tmp_519, fsm_output[2]);
  assign not_tmp_420 = ~((fsm_output[4]) & (fsm_output[1]) & (fsm_output[0]));
  assign or_tmp_525 = (fsm_output[1:0]!=2'b01);
  assign or_tmp_526 = (fsm_output[4]) | (~ and_916_cse);
  assign or_739_nl = (fsm_output[2:1]!=2'b00);
  assign mux_tmp_983 = MUX_s_1_2_2((fsm_output[2]), or_739_nl, fsm_output[0]);
  assign nand_tmp_21 = ~((fsm_output[4]) & (~ mux_tmp_983));
  assign mux_tmp_984 = MUX_s_1_2_2(and_261_cse, (fsm_output[2]), fsm_output[0]);
  assign or_tmp_539 = (fsm_output[2:0]!=3'b001);
  assign mux_tmp_985 = MUX_s_1_2_2((~ or_tmp_539), mux_tmp_984, fsm_output[4]);
  assign or_741_cse = (fsm_output[4:0]!=5'b11001);
  assign mux_986_nl = MUX_s_1_2_2((~ mux_tmp_985), nand_tmp_21, fsm_output[3]);
  assign mux_tmp_987 = MUX_s_1_2_2(or_741_cse, mux_986_nl, fsm_output[6]);
  assign or_742_nl = (fsm_output[4]) | (~ mux_tmp_984);
  assign mux_tmp_988 = MUX_s_1_2_2(nand_tmp_21, or_742_nl, fsm_output[3]);
  assign mux_tmp_989 = MUX_s_1_2_2(mux_tmp_983, or_tmp_539, fsm_output[4]);
  assign and_tmp = (fsm_output[3]) & mux_tmp_985;
  assign or_750_nl = (fsm_output[3:0]!=4'b0001);
  assign nand_51_nl = ~((fsm_output[3]) & (~((fsm_output[1:0]==2'b11))));
  assign or_749_nl = (fsm_output[3]) | nor_124_cse;
  assign mux_997_nl = MUX_s_1_2_2(nand_51_nl, or_749_nl, fsm_output[2]);
  assign mux_998_nl = MUX_s_1_2_2(or_750_nl, mux_997_nl, fsm_output[4]);
  assign mux_tmp_999 = MUX_s_1_2_2(or_741_cse, mux_998_nl, fsm_output[6]);
  assign or_tmp_551 = (fsm_output[4:0]!=5'b01101);
  assign or_757_nl = (fsm_output[3:0]!=4'b1001);
  assign nand_52_nl = ~((fsm_output[3:0]==4'b1101));
  assign mux_tmp_1002 = MUX_s_1_2_2(or_757_nl, nand_52_nl, fsm_output[4]);
  assign mux_tmp_1008 = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[4]);
  assign or_tmp_558 = (fsm_output[3]) | (~ mux_tmp_1008);
  assign or_tmp_560 = (fsm_output[4:2]!=3'b011);
  assign and_tmp_4 = (fsm_output[3]) & mux_tmp_1008;
  assign or_tmp_562 = (fsm_output[4:2]!=3'b100);
  assign or_tmp_564 = (fsm_output[4:2]!=3'b110);
  assign COMP_LOOP_twiddle_f_or_35_itm = and_dcpl_264 | and_dcpl_278;
  assign COMP_LOOP_twiddle_f_nor_8_itm = ~(and_dcpl_389 | and_dcpl_398);
  assign COMP_LOOP_twiddle_f_or_36_itm = and_dcpl_389 | and_dcpl_398;
  assign VEC_LOOP_or_42_itm = and_dcpl_464 | and_dcpl_473;
  assign COMP_LOOP_nor_itm = ~(and_dcpl_631 | and_dcpl_636 | and_dcpl_641 | and_dcpl_652);
  assign VEC_LOOP_or_48_itm = and_dcpl_661 | and_dcpl_666 | and_dcpl_671 | and_dcpl_677
      | and_dcpl_682 | and_dcpl_684 | and_dcpl_686 | and_dcpl_690 | and_dcpl_693
      | and_dcpl_695 | and_dcpl_697 | and_dcpl_699 | and_dcpl_701 | and_dcpl_702;
  assign VEC_LOOP_or_35_itm = and_dcpl_767 | and_dcpl_772 | and_dcpl_776 | and_dcpl_780;
  assign VEC_LOOP_or_53_itm = and_dcpl_782 | and_dcpl_784 | and_dcpl_789 | and_dcpl_795;
  assign VEC_LOOP_or_54_itm = and_dcpl_763 | and_dcpl_791;
  assign VEC_LOOP_or_64_itm = and_dcpl_807 | and_dcpl_816;
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      VEC_LOOP_mult_vec_1_sva <= MUX1HOT_v_32_3_2((vec_rsci_qa_d_mxwt[63:32]), (vec_rsci_qa_d_mxwt[31:0]),
          COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, {and_dcpl_205 , and_dcpl_206 ,
          and_211_nl});
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_twiddle_rsci_oswt_1_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_2_cse <= 1'b0;
    end
    else if ( complete_rsci_wen_comp ) begin
      reg_run_rsci_oswt_cse <= ~(or_dcpl_159 | or_203_cse | (fsm_output[3:0]!=4'b0000));
      reg_vec_rsci_oswt_cse <= ~ mux_310_itm;
      reg_vec_rsci_oswt_1_cse <= and_14_rmff;
      reg_twiddle_rsci_oswt_cse <= and_123_rmff;
      reg_twiddle_rsci_oswt_1_cse <= and_128_rmff;
      reg_complete_rsci_oswt_cse <= and_dcpl_164 & and_dcpl_12 & (fsm_output[1:0]==2'b01)
          & (z_out_14[4]);
      reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_168;
      reg_ensig_cgo_cse <= ~ mux_415_itm;
      reg_ensig_cgo_2_cse <= ~ mux_536_itm;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_17 & and_dcpl_35 & nor_124_cse) | STAGE_LOOP_i_3_0_sva_mx0c1)
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, z_out_10, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_565_nl ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_tmp_568 ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( mux_956_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_12_5_sva_6_0 <= MUX_v_7_2_2(7'b0000000, (z_out_20[6:0]), COMP_LOOP_k_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_588_nl | (fsm_output[8])) ) begin
      COMP_LOOP_17_twiddle_f_mul_psp_sva <= MUX_v_8_2_2(COMP_LOOP_17_twiddle_f_mul_nl,
          (z_out_19[7:0]), and_dcpl_72);
    end
  end
  always @(posedge clk) begin
    if ( (mux_958_nl | (fsm_output[8])) & complete_rsci_wen_comp ) begin
      COMP_LOOP_9_twiddle_f_lshift_ncse_sva_8_4 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt[8:4];
    end
  end
  always @(posedge clk) begin
    if ( (mux_960_nl | (fsm_output[8])) & complete_rsci_wen_comp ) begin
      COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt[3:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_963_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva_10_7 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_rgt[10:7];
    end
  end
  always @(posedge clk) begin
    if ( (~(mux_965_nl | (fsm_output[7]))) & (~((fsm_output[6:4]!=3'b000))) & (~
        (fsm_output[8])) & complete_rsci_wen_comp ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_2_rgt[6:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_608_nl ) begin
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_cse ) begin
      COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt[31:0]),
          (twiddle_h_rsci_qa_d_mxwt[63:32]), and_dcpl_196);
      COMP_LOOP_twiddle_f_1_sva <= MUX_v_32_2_2((twiddle_rsci_qa_d_mxwt[31:0]), (twiddle_rsci_qa_d_mxwt[63:32]),
          and_dcpl_196);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_982_nl) & complete_rsci_wen_comp ) begin
      COMP_LOOP_twiddle_f_17_sva <= MUX_v_32_2_2(32'b00000000000000000000000000000000,
          VEC_LOOP_mux1h_12_nl, COMP_LOOP_twiddle_f_nand_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (and_dcpl_18 | and_dcpl_168) ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= MUX_s_1_2_2((z_out_11_20_12[8]),
          run_rsci_ivld_mxwt, and_dcpl_168);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_18 | and_dcpl_26 | and_dcpl_31 | and_dcpl_39
        | and_dcpl_41 | and_dcpl_46 | and_dcpl_50 | and_dcpl_51 | and_dcpl_53 | and_dcpl_58
        | and_dcpl_60 | and_dcpl_62 | and_dcpl_63 | and_dcpl_67 | and_dcpl_69 | and_dcpl_70
        | and_dcpl_72 | and_dcpl_74 | and_dcpl_76 | and_dcpl_79 | and_dcpl_80 | and_dcpl_82
        | and_dcpl_84 | and_dcpl_85 | and_dcpl_87 | and_dcpl_88 | and_dcpl_92 | and_dcpl_94
        | and_dcpl_95 | and_dcpl_97 | and_dcpl_99 | and_dcpl_100) ) begin
      VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_12_29_2(z_out_12, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
          VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
          VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
          VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10, VEC_LOOP_acc_10_cse_12_sva_mx0w11,
          VEC_LOOP_acc_10_cse_13_sva_mx0w12, VEC_LOOP_acc_10_cse_14_sva_mx0w13, VEC_LOOP_acc_10_cse_15_sva_mx0w14,
          VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17, VEC_LOOP_acc_10_cse_19_sva_mx0w18,
          VEC_LOOP_acc_10_cse_20_sva_mx0w19, VEC_LOOP_acc_10_cse_21_sva_mx0w20, VEC_LOOP_acc_10_cse_22_sva_mx0w21,
          VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_24_sva_mx0w23, VEC_LOOP_acc_10_cse_26_sva_mx0w25,
          VEC_LOOP_acc_10_cse_27_sva_mx0w26, VEC_LOOP_acc_10_cse_28_sva_mx0w27, VEC_LOOP_acc_10_cse_29_sva_mx0w28,
          VEC_LOOP_acc_10_cse_30_sva_mx0w29, VEC_LOOP_acc_10_cse_31_sva_mx0w30, VEC_LOOP_acc_10_cse_sva_mx0w31,
          {VEC_LOOP_or_28_nl , and_dcpl_26 , and_dcpl_31 , and_dcpl_39 , and_dcpl_41
          , and_dcpl_46 , and_dcpl_50 , and_dcpl_51 , and_dcpl_58 , and_dcpl_60 ,
          and_dcpl_62 , and_dcpl_63 , and_dcpl_67 , and_dcpl_69 , and_dcpl_70 , and_dcpl_74
          , and_dcpl_76 , and_dcpl_79 , and_dcpl_80 , and_dcpl_82 , and_dcpl_84 ,
          and_dcpl_85 , and_dcpl_88 , and_dcpl_92 , and_dcpl_94 , and_dcpl_95 , and_dcpl_97
          , and_dcpl_99 , and_dcpl_100});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_755_nl ) begin
      COMP_LOOP_twiddle_help_17_sva <= MUX1HOT_v_32_3_2(z_out_18, (twiddle_h_rsci_qa_d_mxwt[63:32]),
          (twiddle_h_rsci_qa_d_mxwt[31:0]), {and_dcpl_18 , and_dcpl_133 , and_dcpl_201});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_205 | and_dcpl_206) ) begin
      factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[31:0]), (vec_rsci_qa_d_mxwt[63:32]),
          and_dcpl_206);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (VEC_LOOP_acc_1_cse_10_sva_mx0c0 | and_dcpl_26
        | VEC_LOOP_acc_1_cse_10_sva_mx0c2 | and_dcpl_39 | and_dcpl_46 | and_dcpl_51
        | and_dcpl_58 | and_dcpl_62 | and_dcpl_67 | and_dcpl_70 | and_dcpl_74 | and_dcpl_79
        | and_dcpl_82 | and_dcpl_85 | and_dcpl_88 | and_dcpl_94 | and_dcpl_97 | and_dcpl_100)
        ) begin
      VEC_LOOP_acc_1_cse_10_sva <= MUX_v_12_2_2(12'b000000000000, VEC_LOOP_VEC_LOOP_mux_2_nl,
          VEC_LOOP_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_12_0_sva_1 <= 13'b0000000000000;
    end
    else if ( complete_rsci_wen_comp & (~(mux_886_cse | (~ (fsm_output[0])))) ) begin
      VEC_LOOP_j_10_12_0_sva_1 <= z_out_16;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_888_nl ) begin
      COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_996_nl) & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_10 <= z_out_14[10];
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1007_nl) & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_9 <= MUX_s_1_2_2((z_out_14[9]), (z_out_19[9]), mux_894_ssc);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1017_nl) & (fsm_output[1:0]==2'b01) & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_8_0 <= MUX_v_9_2_2((z_out_14[8:0]), (z_out_19[8:0]),
          VEC_LOOP_or_65_nl);
    end
  end
  assign mux_795_nl = MUX_s_1_2_2(mux_424_cse, mux_432_cse, fsm_output[2]);
  assign mux_796_nl = MUX_s_1_2_2(mux_795_nl, mux_430_cse, fsm_output[3]);
  assign mux_800_nl = MUX_s_1_2_2(mux_431_cse, mux_796_nl, fsm_output[1]);
  assign and_211_nl = (~ mux_800_nl) & (fsm_output[0]);
  assign and_251_nl = (((and_261_cse | (fsm_output[5:3]!=3'b000)) & (fsm_output[6]))
      | (fsm_output[7])) & (fsm_output[8]);
  assign mux_565_nl = MUX_s_1_2_2(mux_tmp_564, and_251_nl, fsm_output[0]);
  assign COMP_LOOP_k_not_nl = ~ mux_tmp_568;
  assign mux_953_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[8]);
  assign mux_954_nl = MUX_s_1_2_2(mux_953_nl, nor_tmp_7, fsm_output[6]);
  assign mux_952_nl = MUX_s_1_2_2(nor_tmp_7, (fsm_output[8]), fsm_output[6]);
  assign mux_955_nl = MUX_s_1_2_2(mux_954_nl, mux_952_nl, or_706_cse);
  assign mux_nl = MUX_s_1_2_2(nor_tmp_7, (fsm_output[8]), and_919_cse);
  assign mux_956_nl = MUX_s_1_2_2(mux_955_nl, mux_nl, fsm_output[1]);
  assign nl_COMP_LOOP_17_twiddle_f_mul_nl = (z_out[7:0]) * ({COMP_LOOP_k_12_5_sva_6_0
      , 1'b1});
  assign COMP_LOOP_17_twiddle_f_mul_nl = nl_COMP_LOOP_17_twiddle_f_mul_nl[7:0];
  assign mux_586_nl = MUX_s_1_2_2(mux_tmp_583, mux_tmp_579, fsm_output[2]);
  assign mux_587_nl = MUX_s_1_2_2(mux_tmp_584, mux_586_nl, fsm_output[1]);
  assign or_482_nl = ((and_248_cse | (fsm_output[5])) & (fsm_output[6])) | (fsm_output[7]);
  assign mux_580_nl = MUX_s_1_2_2(or_482_nl, mux_tmp_579, fsm_output[2]);
  assign mux_585_nl = MUX_s_1_2_2(mux_tmp_584, mux_580_nl, fsm_output[1]);
  assign mux_588_nl = MUX_s_1_2_2(mux_587_nl, mux_585_nl, fsm_output[0]);
  assign or_707_nl = (fsm_output[4]) | (fsm_output[2]) | (fsm_output[6]) | (fsm_output[3])
      | (fsm_output[1]);
  assign mux_957_nl = MUX_s_1_2_2((fsm_output[6]), or_707_nl, fsm_output[5]);
  assign mux_958_nl = MUX_s_1_2_2((~ mux_957_nl), and_918_cse, fsm_output[7]);
  assign or_710_nl = and_916_cse | (fsm_output[4:2]!=3'b000);
  assign or_709_nl = (~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (fsm_output[4:0]!=5'b00001);
  assign mux_959_nl = MUX_s_1_2_2(or_710_nl, or_709_nl, fsm_output[5]);
  assign nor_222_nl = ~((fsm_output[6]) | mux_959_nl);
  assign mux_960_nl = MUX_s_1_2_2(nor_222_nl, and_918_cse, fsm_output[7]);
  assign mux_962_nl = MUX_s_1_2_2((~ or_tmp_512), or_715_cse, fsm_output[8]);
  assign nor_221_nl = ~((fsm_output[4]) | (fsm_output[1]) | (fsm_output[5]) | (fsm_output[6])
      | (fsm_output[7]));
  assign mux_961_nl = MUX_s_1_2_2(nor_221_nl, or_tmp_512, fsm_output[8]);
  assign mux_963_nl = MUX_s_1_2_2(mux_962_nl, mux_961_nl, and_241_cse_1);
  assign or_767_nl = (fsm_output[2:1]!=2'b01);
  assign or_768_nl = (fsm_output[2:1]!=2'b10);
  assign mux_964_nl = MUX_s_1_2_2(or_767_nl, or_768_nl, fsm_output[0]);
  assign or_769_nl = (fsm_output[2:0]!=3'b101);
  assign mux_965_nl = MUX_s_1_2_2(mux_964_nl, or_769_nl, fsm_output[3]);
  assign mux_606_nl = MUX_s_1_2_2(mux_tmp_604, nor_tmp_65, or_496_cse);
  assign and_239_nl = ((or_496_cse & (fsm_output[5])) | (fsm_output[7:6]!=2'b00))
      & (fsm_output[8]);
  assign mux_607_nl = MUX_s_1_2_2(mux_606_nl, and_239_nl, fsm_output[2]);
  assign or_477_nl = (fsm_output[4:2]!=3'b000);
  assign mux_605_nl = MUX_s_1_2_2(mux_tmp_604, nor_tmp_65, or_477_nl);
  assign mux_608_nl = MUX_s_1_2_2(mux_607_nl, mux_605_nl, fsm_output[1]);
  assign or_523_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (~ (fsm_output[5]));
  assign mux_672_nl = MUX_s_1_2_2(or_523_nl, or_tmp_351, fsm_output[4]);
  assign or_128_nl = (fsm_output[6:5]!=2'b00);
  assign mux_671_nl = MUX_s_1_2_2(or_128_nl, or_tmp_353, fsm_output[3]);
  assign nand_11_nl = ~((fsm_output[4]) & (~ mux_671_nl));
  assign mux_673_nl = MUX_s_1_2_2(mux_672_nl, nand_11_nl, fsm_output[2]);
  assign or_519_nl = (fsm_output[6:5]!=2'b10);
  assign mux_668_nl = MUX_s_1_2_2(or_tmp_353, or_519_nl, fsm_output[3]);
  assign mux_669_nl = MUX_s_1_2_2(or_tmp_350, mux_668_nl, fsm_output[4]);
  assign mux_667_nl = MUX_s_1_2_2(or_tmp_351, or_tmp_350, fsm_output[4]);
  assign mux_670_nl = MUX_s_1_2_2(mux_669_nl, mux_667_nl, fsm_output[2]);
  assign mux_674_nl = MUX_s_1_2_2(mux_673_nl, mux_670_nl, fsm_output[1]);
  assign or_516_nl = (fsm_output[6:1]!=6'b100000);
  assign mux_675_nl = MUX_s_1_2_2(mux_674_nl, or_516_nl, fsm_output[8]);
  assign and_203_nl = (~ mux_675_nl) & (~ (fsm_output[7])) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_12_nl = MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_help_17_sva, (twiddle_rsci_qa_d_mxwt[63:32]), (twiddle_rsci_qa_d_mxwt[31:0]),
      {and_203_nl , and_dcpl_125 , and_dcpl_133 , and_dcpl_201});
  assign COMP_LOOP_twiddle_f_nand_nl = ~(and_dcpl_17 & and_dcpl_176);
  assign or_738_nl = (fsm_output[1:0]!=2'b00);
  assign mux_977_nl = MUX_s_1_2_2(or_738_nl, or_tmp_525, fsm_output[4]);
  assign nand_49_nl = ~((fsm_output[2]) & (~ mux_977_nl));
  assign mux_976_nl = MUX_s_1_2_2(or_tmp_519, or_tmp_526, fsm_output[2]);
  assign mux_978_nl = MUX_s_1_2_2(nand_49_nl, mux_976_nl, fsm_output[6]);
  assign or_737_nl = (fsm_output[6]) | (fsm_output[2]) | not_tmp_420;
  assign mux_979_nl = MUX_s_1_2_2(mux_978_nl, or_737_nl, fsm_output[5]);
  assign or_766_nl = (fsm_output[6:5]!=2'b10) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | mux_tmp_966;
  assign mux_980_nl = MUX_s_1_2_2(mux_979_nl, or_766_nl, fsm_output[7]);
  assign or_734_nl = (~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (fsm_output[2]) | (~ (fsm_output[4]))
      | (fsm_output[1]) | (~ (fsm_output[0]));
  assign or_732_nl = (fsm_output[2]) | (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[0]));
  assign mux_974_nl = MUX_s_1_2_2(or_734_nl, or_732_nl, fsm_output[6]);
  assign or_730_nl = (fsm_output[6]) | (~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[0]));
  assign mux_975_nl = MUX_s_1_2_2(mux_974_nl, or_730_nl, fsm_output[5]);
  assign or_735_nl = (fsm_output[7]) | mux_975_nl;
  assign mux_981_nl = MUX_s_1_2_2(mux_980_nl, or_735_nl, fsm_output[8]);
  assign mux_969_nl = MUX_s_1_2_2(or_tmp_525, (~ and_916_cse), fsm_output[4]);
  assign mux_970_nl = MUX_s_1_2_2(or_tmp_526, mux_969_nl, fsm_output[2]);
  assign mux_968_nl = MUX_s_1_2_2(not_tmp_420, or_tmp_519, fsm_output[2]);
  assign mux_971_nl = MUX_s_1_2_2(mux_970_nl, mux_968_nl, fsm_output[6]);
  assign or_725_nl = (fsm_output[6]) | mux_tmp_966;
  assign mux_972_nl = MUX_s_1_2_2(mux_971_nl, or_725_nl, fsm_output[5]);
  assign nor_218_nl = ~((~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (~ (fsm_output[2]))
      | (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[0])));
  assign and_913_nl = (VEC_LOOP_j_10_12_0_sva_1[12]) & (~ mux_tmp_966);
  assign mux_967_nl = MUX_s_1_2_2(nor_218_nl, and_913_nl, fsm_output[6]);
  assign nand_47_nl = ~((fsm_output[5]) & mux_967_nl);
  assign mux_973_nl = MUX_s_1_2_2(mux_972_nl, nand_47_nl, fsm_output[7]);
  assign or_728_nl = (fsm_output[8]) | mux_973_nl;
  assign mux_982_nl = MUX_s_1_2_2(mux_981_nl, or_728_nl, fsm_output[3]);
  assign VEC_LOOP_or_28_nl = and_dcpl_18 | and_dcpl_53 | and_dcpl_72 | and_dcpl_87;
  assign mux_753_nl = MUX_s_1_2_2(mux_tmp_733, mux_tmp_744, fsm_output[5]);
  assign or_558_nl = (fsm_output[4:2]!=3'b010);
  assign mux_750_nl = MUX_s_1_2_2(mux_tmp_730, mux_tmp_728, or_558_nl);
  assign mux_747_nl = MUX_s_1_2_2(or_tmp_386, or_tmp_37, fsm_output[4]);
  assign mux_748_nl = MUX_s_1_2_2(mux_747_nl, mux_tmp_731, fsm_output[3]);
  assign nor_86_nl = ~((fsm_output[4:3]!=2'b10));
  assign mux_746_nl = MUX_s_1_2_2(mux_tmp_728, or_tmp_386, nor_86_nl);
  assign mux_749_nl = MUX_s_1_2_2(mux_748_nl, mux_746_nl, fsm_output[2]);
  assign mux_751_nl = MUX_s_1_2_2(mux_750_nl, mux_749_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_741_nl = MUX_s_1_2_2(mux_268_cse, or_tmp_36, fsm_output[6]);
  assign mux_742_nl = MUX_s_1_2_2(mux_741_nl, mux_603_cse, or_556_cse);
  assign mux_739_nl = MUX_s_1_2_2(or_tmp_379, mux_603_cse, fsm_output[4]);
  assign mux_737_nl = MUX_s_1_2_2(or_555_cse, (fsm_output[8]), fsm_output[6]);
  assign mux_736_nl = MUX_s_1_2_2(or_tmp_37, or_tmp_36, fsm_output[6]);
  assign mux_738_nl = MUX_s_1_2_2(mux_737_nl, mux_736_nl, fsm_output[4]);
  assign mux_740_nl = MUX_s_1_2_2(mux_739_nl, mux_738_nl, fsm_output[3]);
  assign mux_743_nl = MUX_s_1_2_2(mux_742_nl, mux_740_nl, fsm_output[2]);
  assign mux_745_nl = MUX_s_1_2_2(mux_tmp_744, mux_743_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_752_nl = MUX_s_1_2_2(mux_751_nl, mux_745_nl, fsm_output[5]);
  assign mux_754_nl = MUX_s_1_2_2(mux_753_nl, mux_752_nl, fsm_output[0]);
  assign mux_729_nl = MUX_s_1_2_2(mux_tmp_728, mux_603_cse, fsm_output[4]);
  assign mux_732_nl = MUX_s_1_2_2(mux_tmp_731, mux_729_nl, fsm_output[3]);
  assign mux_734_nl = MUX_s_1_2_2(mux_tmp_733, mux_732_nl, fsm_output[2]);
  assign mux_726_nl = MUX_s_1_2_2(mux_603_cse, or_tmp_379, and_248_cse);
  assign mux_735_nl = MUX_s_1_2_2(mux_734_nl, mux_726_nl, fsm_output[5]);
  assign mux_755_nl = MUX_s_1_2_2(mux_754_nl, mux_735_nl, fsm_output[1]);
  assign VEC_LOOP_VEC_LOOP_mux_2_nl = MUX_v_12_2_2(z_out_12, (VEC_LOOP_j_10_12_0_sva_1[11:0]),
      VEC_LOOP_acc_1_cse_10_sva_mx0c2);
  assign VEC_LOOP_not_nl = ~ VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  assign mux_597_nl = MUX_s_1_2_2((~ (fsm_output[8])), (fsm_output[8]), or_715_cse);
  assign or_634_nl = (~((fsm_output[7:5]!=3'b000))) | (fsm_output[8]);
  assign mux_887_nl = MUX_s_1_2_2(mux_597_nl, or_634_nl, fsm_output[4]);
  assign or_632_nl = (~((fsm_output[7:4]!=4'b0000))) | (fsm_output[8]);
  assign mux_888_nl = MUX_s_1_2_2(mux_887_nl, or_632_nl, fsm_output[3]);
  assign mux_993_nl = MUX_s_1_2_2(mux_tmp_988, (~ and_tmp), fsm_output[6]);
  assign mux_994_nl = MUX_s_1_2_2(mux_tmp_987, mux_993_nl, fsm_output[5]);
  assign or_747_nl = (fsm_output[6]) | (~ and_tmp);
  assign or_746_nl = (fsm_output[6]) | (fsm_output[3]) | mux_tmp_989;
  assign mux_992_nl = MUX_s_1_2_2(or_747_nl, or_746_nl, fsm_output[5]);
  assign mux_995_nl = MUX_s_1_2_2(mux_994_nl, mux_992_nl, fsm_output[8]);
  assign or_743_nl = (fsm_output[3]) | mux_tmp_989;
  assign mux_990_nl = MUX_s_1_2_2(or_743_nl, mux_tmp_988, fsm_output[6]);
  assign mux_991_nl = MUX_s_1_2_2(mux_990_nl, mux_tmp_987, fsm_output[5]);
  assign or_744_nl = (fsm_output[8]) | mux_991_nl;
  assign mux_996_nl = MUX_s_1_2_2(mux_995_nl, or_744_nl, fsm_output[7]);
  assign mux_1004_nl = MUX_s_1_2_2(or_tmp_551, mux_tmp_1002, fsm_output[6]);
  assign mux_1005_nl = MUX_s_1_2_2(mux_tmp_999, mux_1004_nl, fsm_output[5]);
  assign or_758_nl = (fsm_output[6]) | mux_tmp_1002;
  assign or_755_nl = (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[2]) | (fsm_output[3])
      | (~ (fsm_output[0])) | (fsm_output[1]);
  assign mux_1003_nl = MUX_s_1_2_2(or_758_nl, or_755_nl, fsm_output[5]);
  assign mux_1006_nl = MUX_s_1_2_2(mux_1005_nl, mux_1003_nl, fsm_output[8]);
  assign or_753_nl = (fsm_output[4:0]!=5'b10001);
  assign mux_1000_nl = MUX_s_1_2_2(or_753_nl, or_tmp_551, fsm_output[6]);
  assign mux_1001_nl = MUX_s_1_2_2(mux_1000_nl, mux_tmp_999, fsm_output[5]);
  assign or_754_nl = (fsm_output[8]) | mux_1001_nl;
  assign mux_1007_nl = MUX_s_1_2_2(mux_1006_nl, or_754_nl, fsm_output[7]);
  assign mux_575_nl = MUX_s_1_2_2(or_tmp_169, mux_tmp_574, fsm_output[1]);
  assign mux_594_nl = MUX_s_1_2_2(mux_tmp_574, or_tmp_170, fsm_output[1]);
  assign mux_895_nl = MUX_s_1_2_2(mux_575_nl, mux_594_nl, fsm_output[0]);
  assign VEC_LOOP_or_65_nl = mux_894_ssc | ((~ mux_895_nl) & xor_dcpl & (~ (fsm_output[8]))
      & (fsm_output[6]) & (fsm_output[4]));
  assign mux_1014_nl = MUX_s_1_2_2(or_tmp_564, or_tmp_560, fsm_output[5]);
  assign mux_1013_nl = MUX_s_1_2_2(or_tmp_562, or_tmp_564, fsm_output[5]);
  assign mux_1015_nl = MUX_s_1_2_2(mux_1014_nl, mux_1013_nl, fsm_output[7]);
  assign mux_1012_nl = MUX_s_1_2_2((~ and_tmp_4), or_tmp_562, fsm_output[5]);
  assign or_764_nl = (fsm_output[7]) | mux_1012_nl;
  assign mux_1016_nl = MUX_s_1_2_2(mux_1015_nl, or_764_nl, fsm_output[8]);
  assign mux_1010_nl = MUX_s_1_2_2(or_tmp_558, (~ and_tmp_4), fsm_output[5]);
  assign mux_1009_nl = MUX_s_1_2_2(or_tmp_560, or_tmp_558, fsm_output[5]);
  assign mux_1011_nl = MUX_s_1_2_2(mux_1010_nl, mux_1009_nl, fsm_output[7]);
  assign or_762_nl = (fsm_output[8]) | mux_1011_nl;
  assign mux_1017_nl = MUX_s_1_2_2(mux_1016_nl, or_762_nl, fsm_output[6]);
  assign COMP_LOOP_twiddle_f_mux_10_nl = MUX_v_12_2_2(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1,
      ({1'b0 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1}), and_dcpl_256);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl = (COMP_LOOP_k_12_5_sva_6_0[6])
      & (~ and_dcpl_256);
  assign COMP_LOOP_twiddle_f_mux_11_nl = MUX_v_6_2_2((COMP_LOOP_k_12_5_sva_6_0[5:0]),
      (COMP_LOOP_k_12_5_sva_6_0[6:1]), and_dcpl_256);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl = (COMP_LOOP_k_12_5_sva_6_0[0])
      & and_dcpl_256;
  assign nl_z_out_2 = COMP_LOOP_twiddle_f_mux_10_nl * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl
      , COMP_LOOP_twiddle_f_mux_11_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl
      , 4'b0001});
  assign z_out_2 = nl_z_out_2[11:0];
  assign COMP_LOOP_twiddle_f_mux1h_292_nl = MUX1HOT_v_12_3_2(({3'b000 , COMP_LOOP_9_twiddle_f_lshift_ncse_sva_8_4
      , COMP_LOOP_9_twiddle_f_lshift_ncse_sva_3_0}), COMP_LOOP_2_twiddle_f_lshift_ncse_sva,
      ({1'b0 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_10_7 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0}),
      {COMP_LOOP_twiddle_f_or_35_itm , and_dcpl_269 , and_dcpl_273});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl = (COMP_LOOP_k_12_5_sva_6_0[6])
      & (~(and_dcpl_264 | and_dcpl_273 | and_dcpl_278));
  assign COMP_LOOP_twiddle_f_mux_12_nl = MUX_v_2_2_2((COMP_LOOP_k_12_5_sva_6_0[5:4]),
      (COMP_LOOP_k_12_5_sva_6_0[6:5]), and_dcpl_273);
  assign COMP_LOOP_twiddle_f_nor_13_nl = ~(and_dcpl_264 | and_dcpl_278);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl = MUX_v_2_2_2(2'b00, COMP_LOOP_twiddle_f_mux_12_nl,
      COMP_LOOP_twiddle_f_nor_13_nl);
  assign COMP_LOOP_twiddle_f_mux1h_293_nl = MUX1HOT_v_7_3_2(COMP_LOOP_k_12_5_sva_6_0,
      ({(COMP_LOOP_k_12_5_sva_6_0[3:0]) , 3'b011}), ({(COMP_LOOP_k_12_5_sva_6_0[4:0])
      , 2'b10}), {COMP_LOOP_twiddle_f_or_35_itm , and_dcpl_269 , and_dcpl_273});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl = (~(and_dcpl_264 | and_dcpl_269))
      | and_dcpl_273 | and_dcpl_278;
  assign nl_z_out_3 = COMP_LOOP_twiddle_f_mux1h_292_nl * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl , COMP_LOOP_twiddle_f_mux1h_293_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl , 1'b1});
  assign z_out_3 = nl_z_out_3[11:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl = (~((nor_171_cse & and_dcpl_29
      & and_dcpl_12 & and_916_cse) | and_dcpl_291 | and_dcpl_296)) | and_dcpl_302;
  assign COMP_LOOP_twiddle_f_mux_13_nl = MUX_v_2_2_2(2'b01, 2'b10, and_dcpl_291);
  assign COMP_LOOP_twiddle_f_or_45_nl = and_dcpl_296 | and_dcpl_302;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl = MUX_v_2_2_2(COMP_LOOP_twiddle_f_mux_13_nl,
      2'b11, COMP_LOOP_twiddle_f_or_45_nl);
  assign nl_z_out_4 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_12_5_sva_6_0
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl , 1'b0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl
      , 1'b1});
  assign z_out_4 = nl_z_out_4[11:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl = (~(and_dcpl_310 | and_dcpl_315))
      | and_dcpl_322 | and_dcpl_326;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl = (~(and_dcpl_310 | and_dcpl_322))
      | and_dcpl_315 | and_dcpl_326;
  assign nl_z_out_5_9_0 = COMP_LOOP_5_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_12_5_sva_6_0
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl
      , 1'b1});
  assign z_out_5_9_0 = nl_z_out_5_9_0[9:0];
  assign and_922_nl = (fsm_output[8:6]==3'b001) & and_dcpl_29 & and_dcpl_35 & (fsm_output[1:0]==2'b11);
  assign and_923_nl = and_dcpl_271 & (fsm_output[5:4]==2'b00) & and_dcpl_47;
  assign and_924_nl = and_dcpl_271 & (fsm_output[5:2]==4'b1111) & and_dcpl_11;
  assign and_925_nl = (fsm_output[8:6]==3'b100) & and_dcpl_29 & and_dcpl_47;
  assign COMP_LOOP_twiddle_f_mux1h_294_nl = MUX1HOT_v_4_4_2(4'b0100, 4'b1010, 4'b1101,
      4'b1110, {and_922_nl , and_923_nl , and_924_nl , and_925_nl});
  assign nl_z_out_6 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_12_5_sva_6_0
      , COMP_LOOP_twiddle_f_mux1h_294_nl , 1'b1});
  assign z_out_6 = nl_z_out_6[11:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl = (~(and_dcpl_358 | and_dcpl_365
      | and_dcpl_370)) | and_dcpl_376;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl = (~ and_dcpl_358) | and_dcpl_365
      | and_dcpl_370 | and_dcpl_376;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl = (~ and_dcpl_365) | and_dcpl_358
      | and_dcpl_370 | and_dcpl_376;
  assign nl_z_out_7_10_0 = ({COMP_LOOP_3_twiddle_f_lshift_ncse_sva_10_7 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0})
      * ({COMP_LOOP_k_12_5_sva_6_0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_17_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_18_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_19_nl
      , 1'b1});
  assign z_out_7_10_0 = nl_z_out_7_10_0[10:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_10_nl = (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11])
      & COMP_LOOP_twiddle_f_nor_8_itm;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_9_nl = MUX_v_11_2_2((COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10:0]),
      ({COMP_LOOP_3_twiddle_f_lshift_ncse_sva_10_7 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_6_0}),
      COMP_LOOP_twiddle_f_or_36_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_11_nl = (COMP_LOOP_k_12_5_sva_6_0[6])
      & COMP_LOOP_twiddle_f_nor_8_itm;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_10_nl = MUX_v_6_2_2((COMP_LOOP_k_12_5_sva_6_0[5:0]),
      (COMP_LOOP_k_12_5_sva_6_0[6:1]), COMP_LOOP_twiddle_f_or_36_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl = ((COMP_LOOP_k_12_5_sva_6_0[0])
      & (~ and_dcpl_384)) | and_dcpl_395;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl = (~(and_dcpl_389 | and_dcpl_395))
      | and_dcpl_384 | and_dcpl_398;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_22_nl = (~(and_dcpl_389 | and_dcpl_395
      | and_dcpl_398)) | and_dcpl_384;
  assign nl_z_out_8 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_10_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_9_nl})
      * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_11_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_10_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_20_nl , 1'b1 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_21_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_22_nl , 1'b1});
  assign z_out_8 = nl_z_out_8[11:0];
  assign COMP_LOOP_twiddle_f_or_47_nl = and_dcpl_414 | and_dcpl_418;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl = MUX_v_2_2_2(2'b01, 2'b10,
      COMP_LOOP_twiddle_f_or_47_nl);
  assign COMP_LOOP_twiddle_f_or_46_nl = MUX_v_2_2_2(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl,
      2'b11, and_dcpl_423);
  assign COMP_LOOP_twiddle_f_or_48_nl = (~ and_dcpl_414) | ((fsm_output[8:6]==3'b001)
      & and_dcpl_37 & and_dcpl_12 & (fsm_output[1:0]==2'b11)) | and_dcpl_418 | and_dcpl_423;
  assign nl_z_out_9 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_12_5_sva_6_0
      , COMP_LOOP_twiddle_f_or_46_nl , and_dcpl_423 , COMP_LOOP_twiddle_f_or_48_nl
      , 1'b1});
  assign z_out_9 = nl_z_out_9[11:0];
  assign STAGE_LOOP_mux_4_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_dcpl_438);
  assign nl_z_out_10 = STAGE_LOOP_mux_4_nl + conv_s2u_3_4({and_dcpl_438 , 2'b01});
  assign z_out_10 = nl_z_out_10[3:0];
  assign VEC_LOOP_mux_10_nl = MUX_v_20_2_2((z_out_18[31:12]), ({7'b0000000 , (z_out_20[7:0])
      , 5'b00000}), and_524_cse);
  assign VEC_LOOP_or_66_nl = (~(nor_171_cse & and_dcpl_14 & and_dcpl_12 & (fsm_output[1:0]==2'b01)))
      | and_524_cse;
  assign VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl = ~(MUX_v_12_2_2(12'b000000000000,
      (STAGE_LOOP_lshift_psp_sva[12:1]), and_524_cse));
  assign nl_acc_1_nl = conv_u2u_21_22({VEC_LOOP_mux_10_nl , VEC_LOOP_or_66_nl}) +
      conv_s2u_14_22({1'b1 , VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[21:0];
  assign z_out_11_20_12 = readslicef_22_9_13(acc_1_nl);
  assign VEC_LOOP_mux1h_42_nl = MUX1HOT_v_8_4_2(({(z_out_20[6:0]) , (STAGE_LOOP_lshift_psp_sva[5])}),
      (z_out_20[8:1]), (z_out_20[7:0]), (VEC_LOOP_acc_1_cse_10_sva[11:4]), {and_dcpl_460
      , VEC_LOOP_or_42_itm , and_dcpl_469 , VEC_LOOP_or_4_ssc});
  assign VEC_LOOP_or_67_nl = and_dcpl_460 | and_dcpl_469;
  assign VEC_LOOP_mux1h_43_nl = MUX1HOT_s_1_3_2((STAGE_LOOP_lshift_psp_sva[4]), (z_out_20[0]),
      (VEC_LOOP_acc_1_cse_10_sva[3]), {VEC_LOOP_or_67_nl , VEC_LOOP_or_42_itm , VEC_LOOP_or_4_ssc});
  assign VEC_LOOP_VEC_LOOP_mux_12_nl = MUX_v_3_2_2((STAGE_LOOP_lshift_psp_sva[3:1]),
      (VEC_LOOP_acc_1_cse_10_sva[2:0]), VEC_LOOP_or_4_ssc);
  assign VEC_LOOP_mux1h_44_nl = MUX1HOT_v_7_3_2((COMP_LOOP_twiddle_f_17_sva[11:5]),
      (VEC_LOOP_acc_1_cse_10_sva[11:5]), COMP_LOOP_k_12_5_sva_6_0, {and_dcpl_460
      , VEC_LOOP_or_5_ssc , VEC_LOOP_or_4_ssc});
  assign VEC_LOOP_mux_11_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_17_sva[4]), (VEC_LOOP_acc_1_cse_10_sva[4]),
      VEC_LOOP_or_5_ssc);
  assign VEC_LOOP_VEC_LOOP_or_18_nl = (VEC_LOOP_mux_11_nl & (~(and_dcpl_477 | and_dcpl_481
      | and_dcpl_484 | and_dcpl_488 | and_dcpl_489 | and_dcpl_491 | and_dcpl_493
      | and_dcpl_495))) | and_dcpl_496 | and_dcpl_498 | and_dcpl_500 | and_dcpl_502
      | and_dcpl_503 | and_dcpl_507 | and_dcpl_509 | and_dcpl_511;
  assign VEC_LOOP_mux_12_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_17_sva[3]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      VEC_LOOP_or_5_ssc);
  assign VEC_LOOP_VEC_LOOP_or_19_nl = (VEC_LOOP_mux_12_nl & (~(and_dcpl_477 | and_dcpl_481
      | and_dcpl_484 | and_dcpl_488 | and_dcpl_496 | and_dcpl_498 | and_dcpl_500
      | and_dcpl_502))) | and_dcpl_489 | and_dcpl_491 | and_dcpl_493 | and_dcpl_495
      | and_dcpl_503 | and_dcpl_507 | and_dcpl_509 | and_dcpl_511;
  assign VEC_LOOP_mux_13_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_17_sva[2]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      VEC_LOOP_or_5_ssc);
  assign VEC_LOOP_VEC_LOOP_or_20_nl = (VEC_LOOP_mux_13_nl & (~(and_dcpl_477 | and_dcpl_481
      | and_dcpl_489 | and_dcpl_491 | and_dcpl_496 | and_dcpl_498 | and_dcpl_503
      | and_dcpl_507))) | and_dcpl_484 | and_dcpl_488 | and_dcpl_493 | and_dcpl_495
      | and_dcpl_500 | and_dcpl_502 | and_dcpl_509 | and_dcpl_511;
  assign VEC_LOOP_mux_14_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_17_sva[1]), (VEC_LOOP_acc_1_cse_10_sva[1]),
      VEC_LOOP_or_5_ssc);
  assign VEC_LOOP_VEC_LOOP_or_21_nl = (VEC_LOOP_mux_14_nl & (~(and_dcpl_477 | and_dcpl_484
      | and_dcpl_489 | and_dcpl_493 | and_dcpl_496 | and_dcpl_500 | and_dcpl_503
      | and_dcpl_509))) | and_dcpl_481 | and_dcpl_488 | and_dcpl_491 | and_dcpl_495
      | and_dcpl_498 | and_dcpl_502 | and_dcpl_507 | and_dcpl_511;
  assign VEC_LOOP_mux_15_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_17_sva[0]), (VEC_LOOP_acc_1_cse_10_sva[0]),
      VEC_LOOP_or_5_ssc);
  assign VEC_LOOP_VEC_LOOP_or_22_nl = VEC_LOOP_mux_15_nl | and_dcpl_477 | and_dcpl_481
      | and_dcpl_484 | and_dcpl_488 | and_dcpl_489 | and_dcpl_491 | and_dcpl_493
      | and_dcpl_495 | and_dcpl_496 | and_dcpl_498 | and_dcpl_500 | and_dcpl_502
      | and_dcpl_503 | and_dcpl_507 | and_dcpl_509 | and_dcpl_511;
  assign nl_z_out_12 = ({VEC_LOOP_mux1h_42_nl , VEC_LOOP_mux1h_43_nl , VEC_LOOP_VEC_LOOP_mux_12_nl})
      + ({VEC_LOOP_mux1h_44_nl , VEC_LOOP_VEC_LOOP_or_18_nl , VEC_LOOP_VEC_LOOP_or_19_nl
      , VEC_LOOP_VEC_LOOP_or_20_nl , VEC_LOOP_VEC_LOOP_or_21_nl , VEC_LOOP_VEC_LOOP_or_22_nl});
  assign z_out_12 = nl_z_out_12[11:0];
  assign and_927_nl = and_dcpl_517 & and_dcpl_14 & and_dcpl_25;
  assign and_928_nl = and_dcpl_517 & and_dcpl_29 & and_dcpl_28;
  assign and_929_nl = and_dcpl_529 & and_dcpl_36;
  assign and_930_nl = and_dcpl_529 & and_dcpl_40;
  assign and_931_nl = and_dcpl_517 & and_dcpl_44 & and_dcpl_534;
  assign and_932_nl = and_dcpl_541 & and_dcpl_47;
  assign and_933_nl = and_dcpl_541 & and_dcpl_21;
  assign and_934_nl = and_dcpl_262 & and_dcpl_29 & and_dcpl_25;
  assign and_935_nl = and_dcpl_262 & and_dcpl_37 & and_dcpl_28;
  assign and_936_nl = and_dcpl_549 & and_dcpl_36;
  assign and_937_nl = and_dcpl_549 & and_dcpl_40;
  assign and_938_nl = and_dcpl_412 & and_dcpl_14 & and_dcpl_534;
  assign and_939_nl = and_dcpl_556 & and_dcpl_47;
  assign and_940_nl = and_dcpl_556 & and_dcpl_21;
  assign and_941_nl = and_dcpl_412 & and_dcpl_37 & and_dcpl_25;
  assign and_942_nl = and_dcpl_412 & and_dcpl_44 & and_dcpl_28;
  assign and_943_nl = and_dcpl_565 & and_dcpl_36;
  assign and_944_nl = and_dcpl_565 & and_dcpl_40;
  assign and_945_nl = and_dcpl_271 & and_dcpl_29 & and_dcpl_534;
  assign and_946_nl = and_dcpl_570 & and_dcpl_47;
  assign and_947_nl = and_dcpl_570 & and_dcpl_21;
  assign and_948_nl = and_dcpl_271 & and_dcpl_44 & and_dcpl_25;
  assign and_949_nl = and_dcpl_575 & and_dcpl_14 & and_dcpl_28;
  assign and_950_nl = and_dcpl_578 & and_dcpl_36;
  assign and_951_nl = and_dcpl_578 & and_dcpl_40;
  assign and_952_nl = and_dcpl_575 & and_dcpl_37 & and_dcpl_534;
  assign and_953_nl = and_dcpl_583 & and_dcpl_47;
  assign VEC_LOOP_mux1h_45_nl = MUX1HOT_v_5_27_2(5'b00001, 5'b00010, 5'b00011, 5'b00100,
      5'b00101, 5'b00110, 5'b00111, 5'b01001, 5'b01010, 5'b01011, 5'b01100, 5'b01101,
      5'b01110, 5'b01111, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110,
      5'b10111, 5'b11001, 5'b11010, 5'b11011, 5'b11100, 5'b11101, 5'b11110, {and_927_nl
      , and_928_nl , and_929_nl , and_930_nl , and_931_nl , and_932_nl , and_933_nl
      , and_934_nl , and_935_nl , and_936_nl , and_937_nl , and_938_nl , and_939_nl
      , and_940_nl , and_941_nl , and_942_nl , and_943_nl , and_944_nl , and_945_nl
      , and_946_nl , and_947_nl , and_948_nl , and_949_nl , and_950_nl , and_951_nl
      , and_952_nl , and_953_nl});
  assign and_954_nl = and_dcpl_583 & and_dcpl_21;
  assign VEC_LOOP_or_68_nl = MUX_v_5_2_2(VEC_LOOP_mux1h_45_nl, 5'b11111, and_954_nl);
  assign nl_z_out_13 = ({COMP_LOOP_k_12_5_sva_6_0 , VEC_LOOP_or_68_nl}) + (STAGE_LOOP_lshift_psp_sva[12:1]);
  assign z_out_13 = nl_z_out_13[11:0];
  assign VEC_LOOP_VEC_LOOP_mux_13_nl = MUX_v_11_2_2((VEC_LOOP_acc_1_cse_10_sva[11:1]),
      ({7'b0000001 , (~ z_out_10)}), and_dcpl_623);
  assign not_1233_nl = ~ and_dcpl_623;
  assign VEC_LOOP_and_28_nl = MUX_v_7_2_2(7'b0000000, COMP_LOOP_k_12_5_sva_6_0, not_1233_nl);
  assign VEC_LOOP_VEC_LOOP_or_23_nl = (~(and_dcpl_593 | and_dcpl_599 | and_dcpl_602
      | and_dcpl_606)) | and_dcpl_609 | and_dcpl_612 | and_dcpl_616 | and_dcpl_618
      | and_dcpl_623;
  assign VEC_LOOP_VEC_LOOP_or_24_nl = (~(and_dcpl_593 | and_dcpl_599 | and_dcpl_609
      | and_dcpl_612)) | and_dcpl_602 | and_dcpl_606 | and_dcpl_616 | and_dcpl_618
      | and_dcpl_623;
  assign VEC_LOOP_VEC_LOOP_or_25_nl = (~(and_dcpl_593 | and_dcpl_602 | and_dcpl_609
      | and_dcpl_616 | and_dcpl_623)) | and_dcpl_599 | and_dcpl_606 | and_dcpl_612
      | and_dcpl_618;
  assign nl_z_out_14 = VEC_LOOP_VEC_LOOP_mux_13_nl + ({VEC_LOOP_and_28_nl , VEC_LOOP_VEC_LOOP_or_23_nl
      , VEC_LOOP_VEC_LOOP_or_24_nl , VEC_LOOP_VEC_LOOP_or_25_nl , 1'b1});
  assign z_out_14 = nl_z_out_14[10:0];
  assign COMP_LOOP_COMP_LOOP_or_3_nl = COMP_LOOP_nor_itm | and_dcpl_649;
  assign COMP_LOOP_COMP_LOOP_mux_3_nl = MUX_v_2_2_2(2'b01, (~ (STAGE_LOOP_lshift_psp_sva[12:11])),
      and_dcpl_649);
  assign COMP_LOOP_COMP_LOOP_mux_4_nl = MUX_v_10_2_2((~ (STAGE_LOOP_lshift_psp_sva[12:3])),
      (~ (STAGE_LOOP_lshift_psp_sva[10:1])), and_dcpl_649);
  assign COMP_LOOP_COMP_LOOP_and_1_nl = MUX_v_2_2_2(2'b00, (COMP_LOOP_k_12_5_sva_6_0[6:5]),
      COMP_LOOP_nor_itm);
  assign COMP_LOOP_COMP_LOOP_mux_5_nl = MUX_v_7_2_2(COMP_LOOP_k_12_5_sva_6_0, ({(COMP_LOOP_k_12_5_sva_6_0[4:0])
      , 2'b10}), and_dcpl_649);
  assign COMP_LOOP_COMP_LOOP_or_4_nl = (~(and_dcpl_641 | and_dcpl_649 | and_dcpl_652))
      | and_dcpl_631 | and_dcpl_636;
  assign COMP_LOOP_COMP_LOOP_or_5_nl = (~(and_dcpl_636 | and_dcpl_649 | and_dcpl_652))
      | and_dcpl_631 | and_dcpl_641;
  assign nl_acc_5_nl = ({COMP_LOOP_COMP_LOOP_or_3_nl , COMP_LOOP_COMP_LOOP_mux_3_nl
      , COMP_LOOP_COMP_LOOP_mux_4_nl , 1'b1}) + conv_u2u_13_14({COMP_LOOP_COMP_LOOP_and_1_nl
      , COMP_LOOP_COMP_LOOP_mux_5_nl , COMP_LOOP_COMP_LOOP_or_4_nl , COMP_LOOP_COMP_LOOP_or_5_nl
      , 2'b01});
  assign acc_5_nl = nl_acc_5_nl[13:0];
  assign z_out_15_12_10 = readslicef_14_3_11(acc_5_nl);
  assign VEC_LOOP_VEC_LOOP_or_26_nl = (STAGE_LOOP_lshift_psp_sva[12]) | and_dcpl_661
      | and_dcpl_666 | and_dcpl_671 | and_dcpl_677 | and_dcpl_682 | and_dcpl_684
      | and_dcpl_686 | and_dcpl_690 | and_dcpl_693 | and_dcpl_695 | and_dcpl_697
      | and_dcpl_699 | and_dcpl_701 | and_dcpl_702;
  assign VEC_LOOP_VEC_LOOP_mux_14_nl = MUX_v_12_2_2((STAGE_LOOP_lshift_psp_sva[11:0]),
      (~ (STAGE_LOOP_lshift_psp_sva[12:1])), VEC_LOOP_or_48_itm);
  assign VEC_LOOP_or_69_nl = (~((~ mux_886_cse) & (fsm_output[0]))) | and_dcpl_661
      | and_dcpl_666 | and_dcpl_671 | and_dcpl_677 | and_dcpl_682 | and_dcpl_684
      | and_dcpl_686 | and_dcpl_690 | and_dcpl_693 | and_dcpl_695 | and_dcpl_697
      | and_dcpl_699 | and_dcpl_701 | and_dcpl_702;
  assign VEC_LOOP_VEC_LOOP_mux_15_nl = MUX_v_7_2_2((VEC_LOOP_acc_1_cse_10_sva[11:5]),
      COMP_LOOP_k_12_5_sva_6_0, VEC_LOOP_or_48_itm);
  assign VEC_LOOP_VEC_LOOP_or_27_nl = ((VEC_LOOP_acc_1_cse_10_sva[4]) & (~(and_dcpl_690
      | and_dcpl_693 | and_dcpl_695 | and_dcpl_697 | and_dcpl_699 | and_dcpl_701
      | and_dcpl_702))) | and_dcpl_661 | and_dcpl_666 | and_dcpl_671 | and_dcpl_677
      | and_dcpl_682 | and_dcpl_684 | and_dcpl_686;
  assign VEC_LOOP_VEC_LOOP_or_28_nl = ((VEC_LOOP_acc_1_cse_10_sva[3]) & (~(and_dcpl_686
      | and_dcpl_693 | and_dcpl_695 | and_dcpl_697 | and_dcpl_701))) | and_dcpl_661
      | and_dcpl_666 | and_dcpl_671 | and_dcpl_677 | and_dcpl_682 | and_dcpl_684
      | and_dcpl_690 | and_dcpl_699 | and_dcpl_702;
  assign VEC_LOOP_VEC_LOOP_or_29_nl = ((VEC_LOOP_acc_1_cse_10_sva[2]) & (~(and_dcpl_671
      | and_dcpl_682 | and_dcpl_684 | and_dcpl_690 | and_dcpl_693 | and_dcpl_699
      | and_dcpl_702))) | and_dcpl_661 | and_dcpl_666 | and_dcpl_677 | and_dcpl_686
      | and_dcpl_695 | and_dcpl_697 | and_dcpl_701;
  assign VEC_LOOP_VEC_LOOP_or_30_nl = ((VEC_LOOP_acc_1_cse_10_sva[1]) & (~(and_dcpl_666
      | and_dcpl_677 | and_dcpl_682 | and_dcpl_684 | and_dcpl_697 | and_dcpl_699
      | and_dcpl_701 | and_dcpl_702))) | and_dcpl_661 | and_dcpl_671 | and_dcpl_686
      | and_dcpl_690 | and_dcpl_693 | and_dcpl_695;
  assign VEC_LOOP_VEC_LOOP_or_31_nl = ((VEC_LOOP_acc_1_cse_10_sva[0]) & (~(and_dcpl_661
      | and_dcpl_666 | and_dcpl_671 | and_dcpl_684 | and_dcpl_686 | and_dcpl_690
      | and_dcpl_693 | and_dcpl_695 | and_dcpl_697 | and_dcpl_699))) | and_dcpl_677
      | and_dcpl_682 | and_dcpl_701 | and_dcpl_702;
  assign nl_acc_6_nl = ({VEC_LOOP_VEC_LOOP_or_26_nl , VEC_LOOP_VEC_LOOP_mux_14_nl
      , VEC_LOOP_or_69_nl}) + conv_u2u_13_14({VEC_LOOP_VEC_LOOP_mux_15_nl , VEC_LOOP_VEC_LOOP_or_27_nl
      , VEC_LOOP_VEC_LOOP_or_28_nl , VEC_LOOP_VEC_LOOP_or_29_nl , VEC_LOOP_VEC_LOOP_or_30_nl
      , VEC_LOOP_VEC_LOOP_or_31_nl , 1'b1});
  assign acc_6_nl = nl_acc_6_nl[13:0];
  assign z_out_16 = readslicef_14_13_1(acc_6_nl);
  assign and_955_nl = and_dcpl_271 & and_dcpl_29 & and_dcpl_705;
  assign and_956_nl = and_dcpl_271 & and_dcpl_14 & and_dcpl_663;
  assign and_957_nl = and_dcpl_412 & and_dcpl_44 & (fsm_output[3:2]==2'b10) & nor_124_cse;
  assign and_958_nl = and_dcpl_412 & (fsm_output[5:4]==2'b10) & and_dcpl_678;
  assign and_959_nl = (fsm_output[8:6]==3'b001) & and_dcpl_44 & and_dcpl_663;
  assign and_960_nl = and_dcpl_412 & and_dcpl_29 & (fsm_output[3:2]==2'b00) & nor_124_cse;
  assign and_961_nl = and_dcpl_412 & and_dcpl_14 & and_dcpl_705;
  assign and_962_nl = (fsm_output[8:6]==3'b000) & and_dcpl_14 & and_dcpl_678;
  assign COMP_LOOP_mux1h_7_nl = MUX1HOT_v_5_8_2(5'b10101, 5'b10100, 5'b10010, 5'b10001,
      5'b01100, 5'b01110, 5'b01101, 5'b00001, {and_955_nl , and_956_nl , and_957_nl
      , and_958_nl , and_959_nl , and_960_nl , and_961_nl , and_962_nl});
  assign nl_acc_7_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[12:1])) , 1'b1}) +
      conv_u2u_13_14({COMP_LOOP_k_12_5_sva_6_0 , COMP_LOOP_mux1h_7_nl , 1'b1});
  assign acc_7_nl = nl_acc_7_nl[13:0];
  assign z_out_17_12 = readslicef_14_1_13(acc_7_nl);
  assign VEC_LOOP_mux_16_nl = MUX_v_32_2_2(COMP_LOOP_twiddle_f_17_sva, factor1_1_sva,
      nor_175_cse);
  assign VEC_LOOP_or_70_nl = (~(nor_171_cse & and_dcpl_14 & (fsm_output[3:0]==4'b0101)))
      | nor_175_cse;
  assign VEC_LOOP_mux_17_nl = MUX_v_32_2_2(({19'b0000000000000000000 , STAGE_LOOP_lshift_psp_sva}),
      (~ COMP_LOOP_1_mult_cmp_return_rsc_z), nor_175_cse);
  assign nl_acc_8_nl = ({VEC_LOOP_mux_16_nl , VEC_LOOP_or_70_nl}) + ({VEC_LOOP_mux_17_nl
      , 1'b1});
  assign acc_8_nl = nl_acc_8_nl[32:0];
  assign z_out_18 = readslicef_33_32_1(acc_8_nl);
  assign VEC_LOOP_VEC_LOOP_or_32_nl = ((VEC_LOOP_acc_1_cse_10_sva[11]) & (~(and_dcpl_758
      | and_dcpl_763 | and_dcpl_782 | and_dcpl_784 | and_dcpl_791 | and_dcpl_793)))
      | and_dcpl_789 | and_dcpl_795;
  assign VEC_LOOP_or_71_nl = and_dcpl_782 | and_dcpl_784;
  assign VEC_LOOP_or_72_nl = and_dcpl_789 | and_dcpl_795;
  assign VEC_LOOP_mux1h_46_nl = MUX1HOT_v_9_7_2(({2'b00 , (COMP_LOOP_twiddle_f_17_sva[11:5])}),
      ({1'b0 , (VEC_LOOP_acc_1_cse_10_sva[11:4])}), (VEC_LOOP_acc_1_cse_10_sva[10:2]),
      (VEC_LOOP_acc_1_cse_10_sva[11:3]), (~ (STAGE_LOOP_lshift_psp_sva[12:4])), ({1'b1
      , (~ (STAGE_LOOP_lshift_psp_sva[12:5]))}), ({2'b01 , (~ (STAGE_LOOP_lshift_psp_sva[12:6]))}),
      {and_dcpl_758 , and_dcpl_763 , VEC_LOOP_or_35_itm , VEC_LOOP_or_71_nl , VEC_LOOP_or_72_nl
      , and_dcpl_791 , and_dcpl_793});
  assign VEC_LOOP_or_73_nl = (~(and_dcpl_758 | and_dcpl_763 | and_dcpl_767 | and_dcpl_772
      | and_dcpl_776 | and_dcpl_780 | and_dcpl_782 | and_dcpl_784)) | and_dcpl_789
      | and_dcpl_791 | and_dcpl_793 | and_dcpl_795;
  assign VEC_LOOP_and_35_nl = (COMP_LOOP_k_12_5_sva_6_0[6]) & (~(and_dcpl_758 | and_dcpl_763
      | and_dcpl_782 | and_dcpl_784 | and_dcpl_789 | and_dcpl_791 | and_dcpl_793
      | and_dcpl_795));
  assign VEC_LOOP_VEC_LOOP_mux_16_nl = MUX_s_1_2_2((COMP_LOOP_k_12_5_sva_6_0[5]),
      (COMP_LOOP_k_12_5_sva_6_0[6]), VEC_LOOP_or_53_itm);
  assign VEC_LOOP_and_36_nl = VEC_LOOP_VEC_LOOP_mux_16_nl & (~(and_dcpl_758 | and_dcpl_763
      | and_dcpl_791 | and_dcpl_793));
  assign VEC_LOOP_mux1h_47_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_12_5_sva_6_0[6]), (COMP_LOOP_k_12_5_sva_6_0[4]),
      (COMP_LOOP_k_12_5_sva_6_0[5]), {VEC_LOOP_or_54_itm , VEC_LOOP_or_35_itm , VEC_LOOP_or_53_itm});
  assign VEC_LOOP_and_37_nl = VEC_LOOP_mux1h_47_nl & (~(and_dcpl_758 | and_dcpl_793));
  assign VEC_LOOP_mux1h_48_nl = MUX1HOT_v_4_4_2((COMP_LOOP_k_12_5_sva_6_0[6:3]),
      (COMP_LOOP_k_12_5_sva_6_0[5:2]), (COMP_LOOP_k_12_5_sva_6_0[3:0]), (COMP_LOOP_k_12_5_sva_6_0[4:1]),
      {VEC_LOOP_or_37_ssc , VEC_LOOP_or_54_itm , VEC_LOOP_or_35_itm , VEC_LOOP_or_53_itm});
  assign VEC_LOOP_mux1h_49_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_12_5_sva_6_0[2]), (COMP_LOOP_k_12_5_sva_6_0[1]),
      (COMP_LOOP_k_12_5_sva_6_0[0]), {VEC_LOOP_or_37_ssc , VEC_LOOP_or_54_itm , VEC_LOOP_or_53_itm});
  assign VEC_LOOP_or_74_nl = (VEC_LOOP_mux1h_49_nl & (~(and_dcpl_767 | and_dcpl_772)))
      | and_dcpl_776 | and_dcpl_780;
  assign VEC_LOOP_VEC_LOOP_mux_17_nl = MUX_s_1_2_2((COMP_LOOP_k_12_5_sva_6_0[1]),
      (COMP_LOOP_k_12_5_sva_6_0[0]), VEC_LOOP_or_54_itm);
  assign VEC_LOOP_or_75_nl = (VEC_LOOP_VEC_LOOP_mux_17_nl & (~(and_dcpl_767 | and_dcpl_776
      | and_dcpl_782 | and_dcpl_795))) | and_dcpl_772 | and_dcpl_780 | and_dcpl_784
      | and_dcpl_789;
  assign VEC_LOOP_VEC_LOOP_or_33_nl = ((COMP_LOOP_k_12_5_sva_6_0[0]) & (~(and_dcpl_789
      | and_dcpl_795 | and_dcpl_791))) | and_dcpl_763 | and_dcpl_767 | and_dcpl_772
      | and_dcpl_776 | and_dcpl_780 | and_dcpl_782 | and_dcpl_784;
  assign nl_acc_9_nl = ({VEC_LOOP_VEC_LOOP_or_32_nl , VEC_LOOP_mux1h_46_nl , VEC_LOOP_or_73_nl})
      + ({VEC_LOOP_and_35_nl , VEC_LOOP_and_36_nl , VEC_LOOP_and_37_nl , VEC_LOOP_mux1h_48_nl
      , VEC_LOOP_or_74_nl , VEC_LOOP_or_75_nl , VEC_LOOP_VEC_LOOP_or_33_nl , 1'b1});
  assign acc_9_nl = nl_acc_9_nl[10:0];
  assign z_out_19 = readslicef_11_10_1(acc_9_nl);
  assign VEC_LOOP_or_76_nl = and_dcpl_803 | and_524_cse;
  assign VEC_LOOP_mux1h_50_nl = MUX1HOT_v_7_3_2(({2'b00 , (COMP_LOOP_k_12_5_sva_6_0[6:2])}),
      COMP_LOOP_k_12_5_sva_6_0, ({1'b0 , (COMP_LOOP_k_12_5_sva_6_0[6:1])}), {VEC_LOOP_or_76_nl
      , VEC_LOOP_or_64_itm , and_dcpl_812});
  assign VEC_LOOP_mux_18_nl = MUX_s_1_2_2((COMP_LOOP_k_12_5_sva_6_0[1]), (COMP_LOOP_k_12_5_sva_6_0[0]),
      and_dcpl_812);
  assign VEC_LOOP_VEC_LOOP_or_34_nl = (VEC_LOOP_mux_18_nl & (~ and_dcpl_807)) | and_dcpl_816;
  assign VEC_LOOP_VEC_LOOP_or_35_nl = (COMP_LOOP_k_12_5_sva_6_0[0]) | and_dcpl_807
      | and_dcpl_816 | and_dcpl_812;
  assign VEC_LOOP_mux1h_51_nl = MUX1HOT_v_9_4_2(({2'b00 , (STAGE_LOOP_lshift_psp_sva[12:6])}),
      (STAGE_LOOP_lshift_psp_sva[12:4]), ({1'b0 , (STAGE_LOOP_lshift_psp_sva[12:5])}),
      9'b000000001, {and_dcpl_803 , VEC_LOOP_or_64_itm , and_dcpl_812 , and_524_cse});
  assign nl_z_out_20 = ({VEC_LOOP_mux1h_50_nl , VEC_LOOP_VEC_LOOP_or_34_nl , VEC_LOOP_VEC_LOOP_or_35_nl})
      + VEC_LOOP_mux1h_51_nl;
  assign z_out_20 = nl_z_out_20[8:0];

  function automatic [0:0] MUX1HOT_s_1_10_2;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [9:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    MUX1HOT_s_1_10_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_31_2;
    input [0:0] input_30;
    input [0:0] input_29;
    input [0:0] input_28;
    input [0:0] input_27;
    input [0:0] input_26;
    input [0:0] input_25;
    input [0:0] input_24;
    input [0:0] input_23;
    input [0:0] input_22;
    input [0:0] input_21;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [30:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    result = result | ( input_21 & {1{sel[21]}});
    result = result | ( input_22 & {1{sel[22]}});
    result = result | ( input_23 & {1{sel[23]}});
    result = result | ( input_24 & {1{sel[24]}});
    result = result | ( input_25 & {1{sel[25]}});
    result = result | ( input_26 & {1{sel[26]}});
    result = result | ( input_27 & {1{sel[27]}});
    result = result | ( input_28 & {1{sel[28]}});
    result = result | ( input_29 & {1{sel[29]}});
    result = result | ( input_30 & {1{sel[30]}});
    MUX1HOT_s_1_31_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_32_2;
    input [0:0] input_31;
    input [0:0] input_30;
    input [0:0] input_29;
    input [0:0] input_28;
    input [0:0] input_27;
    input [0:0] input_26;
    input [0:0] input_25;
    input [0:0] input_24;
    input [0:0] input_23;
    input [0:0] input_22;
    input [0:0] input_21;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [31:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    result = result | ( input_21 & {1{sel[21]}});
    result = result | ( input_22 & {1{sel[22]}});
    result = result | ( input_23 & {1{sel[23]}});
    result = result | ( input_24 & {1{sel[24]}});
    result = result | ( input_25 & {1{sel[25]}});
    result = result | ( input_26 & {1{sel[26]}});
    result = result | ( input_27 & {1{sel[27]}});
    result = result | ( input_28 & {1{sel[28]}});
    result = result | ( input_29 & {1{sel[29]}});
    result = result | ( input_30 & {1{sel[30]}});
    result = result | ( input_31 & {1{sel[31]}});
    MUX1HOT_s_1_32_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_33_2;
    input [0:0] input_32;
    input [0:0] input_31;
    input [0:0] input_30;
    input [0:0] input_29;
    input [0:0] input_28;
    input [0:0] input_27;
    input [0:0] input_26;
    input [0:0] input_25;
    input [0:0] input_24;
    input [0:0] input_23;
    input [0:0] input_22;
    input [0:0] input_21;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [32:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    result = result | ( input_21 & {1{sel[21]}});
    result = result | ( input_22 & {1{sel[22]}});
    result = result | ( input_23 & {1{sel[23]}});
    result = result | ( input_24 & {1{sel[24]}});
    result = result | ( input_25 & {1{sel[25]}});
    result = result | ( input_26 & {1{sel[26]}});
    result = result | ( input_27 & {1{sel[27]}});
    result = result | ( input_28 & {1{sel[28]}});
    result = result | ( input_29 & {1{sel[29]}});
    result = result | ( input_30 & {1{sel[30]}});
    result = result | ( input_31 & {1{sel[31]}});
    result = result | ( input_32 & {1{sel[32]}});
    MUX1HOT_s_1_33_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_34_2;
    input [0:0] input_33;
    input [0:0] input_32;
    input [0:0] input_31;
    input [0:0] input_30;
    input [0:0] input_29;
    input [0:0] input_28;
    input [0:0] input_27;
    input [0:0] input_26;
    input [0:0] input_25;
    input [0:0] input_24;
    input [0:0] input_23;
    input [0:0] input_22;
    input [0:0] input_21;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [33:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    result = result | ( input_21 & {1{sel[21]}});
    result = result | ( input_22 & {1{sel[22]}});
    result = result | ( input_23 & {1{sel[23]}});
    result = result | ( input_24 & {1{sel[24]}});
    result = result | ( input_25 & {1{sel[25]}});
    result = result | ( input_26 & {1{sel[26]}});
    result = result | ( input_27 & {1{sel[27]}});
    result = result | ( input_28 & {1{sel[28]}});
    result = result | ( input_29 & {1{sel[29]}});
    result = result | ( input_30 & {1{sel[30]}});
    result = result | ( input_31 & {1{sel[31]}});
    result = result | ( input_32 & {1{sel[32]}});
    result = result | ( input_33 & {1{sel[33]}});
    MUX1HOT_s_1_34_2 = result;
  end
  endfunction


  function automatic [0:0] MUX1HOT_s_1_35_2;
    input [0:0] input_34;
    input [0:0] input_33;
    input [0:0] input_32;
    input [0:0] input_31;
    input [0:0] input_30;
    input [0:0] input_29;
    input [0:0] input_28;
    input [0:0] input_27;
    input [0:0] input_26;
    input [0:0] input_25;
    input [0:0] input_24;
    input [0:0] input_23;
    input [0:0] input_22;
    input [0:0] input_21;
    input [0:0] input_20;
    input [0:0] input_19;
    input [0:0] input_18;
    input [0:0] input_17;
    input [0:0] input_16;
    input [0:0] input_15;
    input [0:0] input_14;
    input [0:0] input_13;
    input [0:0] input_12;
    input [0:0] input_11;
    input [0:0] input_10;
    input [0:0] input_9;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [34:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    result = result | ( input_9 & {1{sel[9]}});
    result = result | ( input_10 & {1{sel[10]}});
    result = result | ( input_11 & {1{sel[11]}});
    result = result | ( input_12 & {1{sel[12]}});
    result = result | ( input_13 & {1{sel[13]}});
    result = result | ( input_14 & {1{sel[14]}});
    result = result | ( input_15 & {1{sel[15]}});
    result = result | ( input_16 & {1{sel[16]}});
    result = result | ( input_17 & {1{sel[17]}});
    result = result | ( input_18 & {1{sel[18]}});
    result = result | ( input_19 & {1{sel[19]}});
    result = result | ( input_20 & {1{sel[20]}});
    result = result | ( input_21 & {1{sel[21]}});
    result = result | ( input_22 & {1{sel[22]}});
    result = result | ( input_23 & {1{sel[23]}});
    result = result | ( input_24 & {1{sel[24]}});
    result = result | ( input_25 & {1{sel[25]}});
    result = result | ( input_26 & {1{sel[26]}});
    result = result | ( input_27 & {1{sel[27]}});
    result = result | ( input_28 & {1{sel[28]}});
    result = result | ( input_29 & {1{sel[29]}});
    result = result | ( input_30 & {1{sel[30]}});
    result = result | ( input_31 & {1{sel[31]}});
    result = result | ( input_32 & {1{sel[32]}});
    result = result | ( input_33 & {1{sel[33]}});
    result = result | ( input_34 & {1{sel[34]}});
    MUX1HOT_s_1_35_2 = result;
  end
  endfunction


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


  function automatic [0:0] MUX1HOT_s_1_9_2;
    input [0:0] input_8;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [8:0] sel;
    reg [0:0] result;
  begin
    result = input_0 & {1{sel[0]}};
    result = result | ( input_1 & {1{sel[1]}});
    result = result | ( input_2 & {1{sel[2]}});
    result = result | ( input_3 & {1{sel[3]}});
    result = result | ( input_4 & {1{sel[4]}});
    result = result | ( input_5 & {1{sel[5]}});
    result = result | ( input_6 & {1{sel[6]}});
    result = result | ( input_7 & {1{sel[7]}});
    result = result | ( input_8 & {1{sel[8]}});
    MUX1HOT_s_1_9_2 = result;
  end
  endfunction


  function automatic [11:0] MUX1HOT_v_12_29_2;
    input [11:0] input_28;
    input [11:0] input_27;
    input [11:0] input_26;
    input [11:0] input_25;
    input [11:0] input_24;
    input [11:0] input_23;
    input [11:0] input_22;
    input [11:0] input_21;
    input [11:0] input_20;
    input [11:0] input_19;
    input [11:0] input_18;
    input [11:0] input_17;
    input [11:0] input_16;
    input [11:0] input_15;
    input [11:0] input_14;
    input [11:0] input_13;
    input [11:0] input_12;
    input [11:0] input_11;
    input [11:0] input_10;
    input [11:0] input_9;
    input [11:0] input_8;
    input [11:0] input_7;
    input [11:0] input_6;
    input [11:0] input_5;
    input [11:0] input_4;
    input [11:0] input_3;
    input [11:0] input_2;
    input [11:0] input_1;
    input [11:0] input_0;
    input [28:0] sel;
    reg [11:0] result;
  begin
    result = input_0 & {12{sel[0]}};
    result = result | ( input_1 & {12{sel[1]}});
    result = result | ( input_2 & {12{sel[2]}});
    result = result | ( input_3 & {12{sel[3]}});
    result = result | ( input_4 & {12{sel[4]}});
    result = result | ( input_5 & {12{sel[5]}});
    result = result | ( input_6 & {12{sel[6]}});
    result = result | ( input_7 & {12{sel[7]}});
    result = result | ( input_8 & {12{sel[8]}});
    result = result | ( input_9 & {12{sel[9]}});
    result = result | ( input_10 & {12{sel[10]}});
    result = result | ( input_11 & {12{sel[11]}});
    result = result | ( input_12 & {12{sel[12]}});
    result = result | ( input_13 & {12{sel[13]}});
    result = result | ( input_14 & {12{sel[14]}});
    result = result | ( input_15 & {12{sel[15]}});
    result = result | ( input_16 & {12{sel[16]}});
    result = result | ( input_17 & {12{sel[17]}});
    result = result | ( input_18 & {12{sel[18]}});
    result = result | ( input_19 & {12{sel[19]}});
    result = result | ( input_20 & {12{sel[20]}});
    result = result | ( input_21 & {12{sel[21]}});
    result = result | ( input_22 & {12{sel[22]}});
    result = result | ( input_23 & {12{sel[23]}});
    result = result | ( input_24 & {12{sel[24]}});
    result = result | ( input_25 & {12{sel[25]}});
    result = result | ( input_26 & {12{sel[26]}});
    result = result | ( input_27 & {12{sel[27]}});
    result = result | ( input_28 & {12{sel[28]}});
    MUX1HOT_v_12_29_2 = result;
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


  function automatic [1:0] MUX1HOT_v_2_11_2;
    input [1:0] input_10;
    input [1:0] input_9;
    input [1:0] input_8;
    input [1:0] input_7;
    input [1:0] input_6;
    input [1:0] input_5;
    input [1:0] input_4;
    input [1:0] input_3;
    input [1:0] input_2;
    input [1:0] input_1;
    input [1:0] input_0;
    input [10:0] sel;
    reg [1:0] result;
  begin
    result = input_0 & {2{sel[0]}};
    result = result | ( input_1 & {2{sel[1]}});
    result = result | ( input_2 & {2{sel[2]}});
    result = result | ( input_3 & {2{sel[3]}});
    result = result | ( input_4 & {2{sel[4]}});
    result = result | ( input_5 & {2{sel[5]}});
    result = result | ( input_6 & {2{sel[6]}});
    result = result | ( input_7 & {2{sel[7]}});
    result = result | ( input_8 & {2{sel[8]}});
    result = result | ( input_9 & {2{sel[9]}});
    result = result | ( input_10 & {2{sel[10]}});
    MUX1HOT_v_2_11_2 = result;
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


  function automatic [31:0] MUX1HOT_v_32_4_2;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [3:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | ( input_1 & {32{sel[1]}});
    result = result | ( input_2 & {32{sel[2]}});
    result = result | ( input_3 & {32{sel[3]}});
    MUX1HOT_v_32_4_2 = result;
  end
  endfunction


  function automatic [3:0] MUX1HOT_v_4_4_2;
    input [3:0] input_3;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [3:0] sel;
    reg [3:0] result;
  begin
    result = input_0 & {4{sel[0]}};
    result = result | ( input_1 & {4{sel[1]}});
    result = result | ( input_2 & {4{sel[2]}});
    result = result | ( input_3 & {4{sel[3]}});
    MUX1HOT_v_4_4_2 = result;
  end
  endfunction


  function automatic [4:0] MUX1HOT_v_5_27_2;
    input [4:0] input_26;
    input [4:0] input_25;
    input [4:0] input_24;
    input [4:0] input_23;
    input [4:0] input_22;
    input [4:0] input_21;
    input [4:0] input_20;
    input [4:0] input_19;
    input [4:0] input_18;
    input [4:0] input_17;
    input [4:0] input_16;
    input [4:0] input_15;
    input [4:0] input_14;
    input [4:0] input_13;
    input [4:0] input_12;
    input [4:0] input_11;
    input [4:0] input_10;
    input [4:0] input_9;
    input [4:0] input_8;
    input [4:0] input_7;
    input [4:0] input_6;
    input [4:0] input_5;
    input [4:0] input_4;
    input [4:0] input_3;
    input [4:0] input_2;
    input [4:0] input_1;
    input [4:0] input_0;
    input [26:0] sel;
    reg [4:0] result;
  begin
    result = input_0 & {5{sel[0]}};
    result = result | ( input_1 & {5{sel[1]}});
    result = result | ( input_2 & {5{sel[2]}});
    result = result | ( input_3 & {5{sel[3]}});
    result = result | ( input_4 & {5{sel[4]}});
    result = result | ( input_5 & {5{sel[5]}});
    result = result | ( input_6 & {5{sel[6]}});
    result = result | ( input_7 & {5{sel[7]}});
    result = result | ( input_8 & {5{sel[8]}});
    result = result | ( input_9 & {5{sel[9]}});
    result = result | ( input_10 & {5{sel[10]}});
    result = result | ( input_11 & {5{sel[11]}});
    result = result | ( input_12 & {5{sel[12]}});
    result = result | ( input_13 & {5{sel[13]}});
    result = result | ( input_14 & {5{sel[14]}});
    result = result | ( input_15 & {5{sel[15]}});
    result = result | ( input_16 & {5{sel[16]}});
    result = result | ( input_17 & {5{sel[17]}});
    result = result | ( input_18 & {5{sel[18]}});
    result = result | ( input_19 & {5{sel[19]}});
    result = result | ( input_20 & {5{sel[20]}});
    result = result | ( input_21 & {5{sel[21]}});
    result = result | ( input_22 & {5{sel[22]}});
    result = result | ( input_23 & {5{sel[23]}});
    result = result | ( input_24 & {5{sel[24]}});
    result = result | ( input_25 & {5{sel[25]}});
    result = result | ( input_26 & {5{sel[26]}});
    MUX1HOT_v_5_27_2 = result;
  end
  endfunction


  function automatic [4:0] MUX1HOT_v_5_8_2;
    input [4:0] input_7;
    input [4:0] input_6;
    input [4:0] input_5;
    input [4:0] input_4;
    input [4:0] input_3;
    input [4:0] input_2;
    input [4:0] input_1;
    input [4:0] input_0;
    input [7:0] sel;
    reg [4:0] result;
  begin
    result = input_0 & {5{sel[0]}};
    result = result | ( input_1 & {5{sel[1]}});
    result = result | ( input_2 & {5{sel[2]}});
    result = result | ( input_3 & {5{sel[3]}});
    result = result | ( input_4 & {5{sel[4]}});
    result = result | ( input_5 & {5{sel[5]}});
    result = result | ( input_6 & {5{sel[6]}});
    result = result | ( input_7 & {5{sel[7]}});
    MUX1HOT_v_5_8_2 = result;
  end
  endfunction


  function automatic [6:0] MUX1HOT_v_7_12_2;
    input [6:0] input_11;
    input [6:0] input_10;
    input [6:0] input_9;
    input [6:0] input_8;
    input [6:0] input_7;
    input [6:0] input_6;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [11:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    result = result | ( input_3 & {7{sel[3]}});
    result = result | ( input_4 & {7{sel[4]}});
    result = result | ( input_5 & {7{sel[5]}});
    result = result | ( input_6 & {7{sel[6]}});
    result = result | ( input_7 & {7{sel[7]}});
    result = result | ( input_8 & {7{sel[8]}});
    result = result | ( input_9 & {7{sel[9]}});
    result = result | ( input_10 & {7{sel[10]}});
    result = result | ( input_11 & {7{sel[11]}});
    MUX1HOT_v_7_12_2 = result;
  end
  endfunction


  function automatic [6:0] MUX1HOT_v_7_36_2;
    input [6:0] input_35;
    input [6:0] input_34;
    input [6:0] input_33;
    input [6:0] input_32;
    input [6:0] input_31;
    input [6:0] input_30;
    input [6:0] input_29;
    input [6:0] input_28;
    input [6:0] input_27;
    input [6:0] input_26;
    input [6:0] input_25;
    input [6:0] input_24;
    input [6:0] input_23;
    input [6:0] input_22;
    input [6:0] input_21;
    input [6:0] input_20;
    input [6:0] input_19;
    input [6:0] input_18;
    input [6:0] input_17;
    input [6:0] input_16;
    input [6:0] input_15;
    input [6:0] input_14;
    input [6:0] input_13;
    input [6:0] input_12;
    input [6:0] input_11;
    input [6:0] input_10;
    input [6:0] input_9;
    input [6:0] input_8;
    input [6:0] input_7;
    input [6:0] input_6;
    input [6:0] input_5;
    input [6:0] input_4;
    input [6:0] input_3;
    input [6:0] input_2;
    input [6:0] input_1;
    input [6:0] input_0;
    input [35:0] sel;
    reg [6:0] result;
  begin
    result = input_0 & {7{sel[0]}};
    result = result | ( input_1 & {7{sel[1]}});
    result = result | ( input_2 & {7{sel[2]}});
    result = result | ( input_3 & {7{sel[3]}});
    result = result | ( input_4 & {7{sel[4]}});
    result = result | ( input_5 & {7{sel[5]}});
    result = result | ( input_6 & {7{sel[6]}});
    result = result | ( input_7 & {7{sel[7]}});
    result = result | ( input_8 & {7{sel[8]}});
    result = result | ( input_9 & {7{sel[9]}});
    result = result | ( input_10 & {7{sel[10]}});
    result = result | ( input_11 & {7{sel[11]}});
    result = result | ( input_12 & {7{sel[12]}});
    result = result | ( input_13 & {7{sel[13]}});
    result = result | ( input_14 & {7{sel[14]}});
    result = result | ( input_15 & {7{sel[15]}});
    result = result | ( input_16 & {7{sel[16]}});
    result = result | ( input_17 & {7{sel[17]}});
    result = result | ( input_18 & {7{sel[18]}});
    result = result | ( input_19 & {7{sel[19]}});
    result = result | ( input_20 & {7{sel[20]}});
    result = result | ( input_21 & {7{sel[21]}});
    result = result | ( input_22 & {7{sel[22]}});
    result = result | ( input_23 & {7{sel[23]}});
    result = result | ( input_24 & {7{sel[24]}});
    result = result | ( input_25 & {7{sel[25]}});
    result = result | ( input_26 & {7{sel[26]}});
    result = result | ( input_27 & {7{sel[27]}});
    result = result | ( input_28 & {7{sel[28]}});
    result = result | ( input_29 & {7{sel[29]}});
    result = result | ( input_30 & {7{sel[30]}});
    result = result | ( input_31 & {7{sel[31]}});
    result = result | ( input_32 & {7{sel[32]}});
    result = result | ( input_33 & {7{sel[33]}});
    result = result | ( input_34 & {7{sel[34]}});
    result = result | ( input_35 & {7{sel[35]}});
    MUX1HOT_v_7_36_2 = result;
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


  function automatic [7:0] MUX1HOT_v_8_4_2;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [3:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | ( input_1 & {8{sel[1]}});
    result = result | ( input_2 & {8{sel[2]}});
    result = result | ( input_3 & {8{sel[3]}});
    MUX1HOT_v_8_4_2 = result;
  end
  endfunction


  function automatic [7:0] MUX1HOT_v_8_6_2;
    input [7:0] input_5;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [5:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | ( input_1 & {8{sel[1]}});
    result = result | ( input_2 & {8{sel[2]}});
    result = result | ( input_3 & {8{sel[3]}});
    result = result | ( input_4 & {8{sel[4]}});
    result = result | ( input_5 & {8{sel[5]}});
    MUX1HOT_v_8_6_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_7_2;
    input [8:0] input_6;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [6:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    result = result | ( input_5 & {9{sel[5]}});
    result = result | ( input_6 & {9{sel[6]}});
    MUX1HOT_v_9_7_2 = result;
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


  function automatic [4:0] MUX_v_5_2_2;
    input [4:0] input_0;
    input [4:0] input_1;
    input [0:0] sel;
    reg [4:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_5_2_2 = result;
  end
  endfunction


  function automatic [5:0] MUX_v_6_2_2;
    input [5:0] input_0;
    input [5:0] input_1;
    input [0:0] sel;
    reg [5:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_6_2_2 = result;
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


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
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


  function automatic [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
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


  function automatic [0:0] readslicef_14_1_13;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 13;
    readslicef_14_1_13 = tmp[0:0];
  end
  endfunction


  function automatic [2:0] readslicef_14_3_11;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_14_3_11 = tmp[2:0];
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
  wire [23:0] twiddle_rsci_adra_d;
  wire [63:0] twiddle_rsci_qa_d;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [23:0] twiddle_h_rsci_adra_d;
  wire [63:0] twiddle_h_rsci_qa_d;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_vec_rsci_da_d;
  assign nl_vec_rsci_da_d = {32'b00000000000000000000000000000000 , vec_rsci_da_d};
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
      .adra_d(twiddle_rsci_adra_d),
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
      .adra_d(twiddle_h_rsci_adra_d),
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



