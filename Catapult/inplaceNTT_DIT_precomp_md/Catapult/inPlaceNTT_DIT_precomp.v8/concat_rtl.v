
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
//  Generated date: Thu Sep 16 11:52:42 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [9:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [9:0] adra;
  input [19:0] adra_d;
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
  assign adrb = (adra_d[19:10]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[9:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [9:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [9:0] adra;
  input [19:0] adra_d;
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
  assign adrb = (adra_d[19:10]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[9:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, clka, clka_en, da_d, qa_d, wea_d,
      rwA_rw_ram_ir_internal_RMASK_B_d, rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [9:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [9:0] adra;
  input [19:0] adra_d;
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
  assign adrb = (adra_d[19:10]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[9:0]);
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
  output [19:0] vec_rsci_adra_d;
  output [31:0] vec_rsci_da_d;
  input [63:0] vec_rsci_qa_d;
  output [1:0] vec_rsci_wea_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  output [19:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [19:0] twiddle_h_rsci_adra_d;
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
  wire or_tmp_1;
  wire or_tmp_2;
  wire mux_tmp;
  wire or_tmp_38;
  wire or_tmp_39;
  wire nor_tmp_3;
  wire mux_tmp_82;
  wire nor_tmp_11;
  wire not_tmp_69;
  wire nor_tmp_29;
  wire or_dcpl_168;
  wire or_tmp_145;
  wire mux_tmp_336;
  wire mux_tmp_338;
  wire or_tmp_148;
  wire mux_tmp_339;
  wire mux_tmp_340;
  wire or_tmp_149;
  wire mux_tmp_343;
  wire mux_tmp_344;
  wire mux_tmp_345;
  wire mux_tmp_346;
  wire mux_tmp_348;
  wire mux_tmp_350;
  wire mux_tmp_355;
  wire mux_tmp_356;
  wire or_tmp_156;
  wire or_tmp_157;
  wire or_tmp_158;
  wire or_tmp_160;
  wire or_tmp_161;
  wire mux_tmp_374;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire and_dcpl_29;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire mux_tmp_401;
  wire or_tmp_172;
  wire or_tmp_175;
  wire mux_tmp_404;
  wire mux_tmp_405;
  wire and_dcpl_39;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire or_tmp_184;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire mux_tmp_418;
  wire mux_tmp_419;
  wire and_dcpl_55;
  wire and_dcpl_56;
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
  wire xor_dcpl;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_72;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire and_dcpl_79;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire and_dcpl_82;
  wire and_dcpl_84;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire and_dcpl_88;
  wire and_dcpl_89;
  wire and_dcpl_90;
  wire and_dcpl_91;
  wire and_dcpl_93;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_97;
  wire and_dcpl_98;
  wire and_dcpl_99;
  wire and_dcpl_100;
  wire and_dcpl_101;
  wire and_dcpl_103;
  wire and_dcpl_104;
  wire and_dcpl_105;
  wire and_dcpl_106;
  wire and_dcpl_107;
  wire and_dcpl_108;
  wire and_dcpl_109;
  wire and_dcpl_110;
  wire and_dcpl_111;
  wire and_dcpl_112;
  wire and_dcpl_113;
  wire and_dcpl_114;
  wire and_dcpl_115;
  wire and_dcpl_116;
  wire and_dcpl_117;
  wire and_dcpl_118;
  wire and_dcpl_119;
  wire and_dcpl_120;
  wire and_dcpl_121;
  wire and_dcpl_122;
  wire and_dcpl_123;
  wire and_dcpl_124;
  wire or_tmp_186;
  wire and_dcpl_128;
  wire mux_tmp_424;
  wire mux_tmp_425;
  wire mux_tmp_446;
  wire mux_tmp_451;
  wire mux_tmp_454;
  wire mux_tmp_467;
  wire mux_tmp_504;
  wire mux_tmp_509;
  wire mux_tmp_516;
  wire mux_tmp_517;
  wire mux_tmp_526;
  wire and_dcpl_144;
  wire and_dcpl_145;
  wire mux_tmp_536;
  wire mux_tmp_543;
  wire mux_tmp_548;
  wire or_tmp_271;
  wire or_tmp_272;
  wire mux_tmp_555;
  wire or_tmp_273;
  wire or_tmp_274;
  wire not_tmp_207;
  wire or_tmp_277;
  wire mux_tmp_561;
  wire mux_tmp_562;
  wire and_dcpl_148;
  wire and_dcpl_153;
  wire and_dcpl_154;
  wire and_dcpl_159;
  wire and_dcpl_164;
  wire and_dcpl_167;
  wire mux_tmp_581;
  wire or_tmp_291;
  wire mux_tmp_586;
  wire and_dcpl_192;
  wire or_tmp_295;
  wire or_tmp_297;
  wire mux_tmp_602;
  wire mux_tmp_603;
  wire and_dcpl_201;
  wire not_tmp_218;
  wire or_tmp_306;
  wire or_tmp_307;
  wire or_tmp_308;
  wire mux_tmp_612;
  wire mux_tmp_614;
  wire mux_tmp_615;
  wire mux_tmp_616;
  wire mux_tmp_617;
  wire mux_tmp_618;
  wire mux_tmp_619;
  wire mux_tmp_621;
  wire mux_tmp_622;
  wire mux_tmp_623;
  wire mux_tmp_640;
  wire and_dcpl_203;
  wire or_tmp_330;
  wire mux_tmp_646;
  wire nand_tmp_10;
  wire and_dcpl_204;
  wire and_dcpl_205;
  wire not_tmp_230;
  wire mux_tmp_673;
  wire mux_tmp_677;
  wire or_tmp_355;
  wire or_tmp_356;
  wire mux_tmp_678;
  wire mux_tmp_680;
  wire mux_tmp_686;
  wire and_dcpl_216;
  wire mux_tmp_695;
  wire mux_tmp_696;
  wire mux_tmp_706;
  wire or_tmp_375;
  wire or_tmp_378;
  wire mux_tmp_722;
  wire mux_tmp_723;
  wire nand_tmp_11;
  wire and_dcpl_227;
  wire and_dcpl_231;
  wire mux_tmp_830;
  wire mux_tmp_831;
  wire mux_tmp_834;
  wire mux_tmp_836;
  wire mux_tmp_848;
  wire mux_tmp_852;
  wire mux_tmp_853;
  wire mux_tmp_856;
  wire mux_tmp_858;
  wire not_tmp_267;
  wire or_tmp_481;
  wire or_tmp_486;
  wire or_tmp_487;
  wire and_dcpl_240;
  wire nand_tmp_19;
  wire mux_tmp_964;
  wire mux_tmp_965;
  wire mux_tmp_966;
  wire mux_tmp_978;
  wire mux_tmp_980;
  wire and_dcpl_248;
  wire or_tmp_527;
  wire or_tmp_529;
  wire or_tmp_530;
  wire mux_tmp_1006;
  wire mux_tmp_1011;
  reg COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  reg [9:0] VEC_LOOP_acc_1_cse_10_sva;
  reg [10:0] STAGE_LOOP_lshift_psp_sva;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  wire or_390_cse;
  wire or_395_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_twiddle_rsci_oswt_1_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_2_cse;
  wire and_283_cse;
  wire and_291_cse;
  wire or_725_cse;
  wire or_736_cse;
  wire or_384_cse;
  wire or_591_cse;
  wire or_3_cse;
  wire nor_95_cse;
  wire or_321_cse;
  wire and_285_cse;
  wire or_739_cse;
  wire nor_132_cse;
  wire or_449_cse;
  wire or_470_cse;
  wire or_750_cse;
  wire or_538_cse;
  wire or_613_cse;
  wire or_610_cse;
  wire or_685_cse;
  wire and_300_cse;
  wire and_322_cse;
  wire mux_475_cse;
  wire mux_472_cse;
  wire mux_452_cse;
  wire mux_1021_cse;
  wire mux_473_cse;
  wire mux_469_cse;
  wire mux_369_cse;
  wire mux_437_cse;
  wire mux_529_cse;
  wire mux_457_cse;
  wire mux_600_cse;
  wire mux_601_cse;
  wire or_748_cse;
  wire mux_422_cse;
  wire mux_423_cse;
  wire mux_428_cse;
  wire mux_380_cse;
  wire mux_1023_cse;
  wire mux_474_cse;
  wire mux_470_cse;
  wire mux_666_cse;
  wire mux_663_cse;
  wire nand_6_cse;
  wire nand_5_cse;
  wire or_377_cse;
  wire mux_806_cse;
  wire mux_456_cse;
  wire mux_429_cse;
  wire mux_426_cse;
  wire mux_478_cse;
  wire mux_468_cse;
  wire mux_381_cse;
  wire mux_378_cse;
  wire mux_485_cse;
  wire mux_664_cse;
  wire mux_434_cse;
  wire mux_439_cse;
  wire mux_435_cse;
  wire mux_440_cse;
  wire mux_382_cse;
  wire mux_379_cse;
  wire [31:0] vec_rsci_da_d_reg;
  wire [1:0] vec_rsci_wea_d_reg;
  wire core_wten_iff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_25_rmff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [9:0] VEC_LOOP_mux_rmff;
  wire [4:0] COMP_LOOP_twiddle_f_mux1h_138_rmff;
  wire COMP_LOOP_twiddle_f_and_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_28_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_55_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_108_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_153_rmff;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_157_rmff;
  wire and_152_rmff;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_207_rmff;
  reg [31:0] factor1_1_sva;
  reg [31:0] VEC_LOOP_mult_vec_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_11_sva;
  reg [31:0] COMP_LOOP_twiddle_f_9_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_11_sva;
  reg [31:0] COMP_LOOP_twiddle_help_9_sva;
  wire [9:0] VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  wire [4:0] VEC_LOOP_acc_psp_sva_mx0w0;
  wire [5:0] nl_VEC_LOOP_acc_psp_sva_mx0w0;
  reg [9:0] VEC_LOOP_acc_10_cse_1_sva;
  wire [9:0] VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [9:0] VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [9:0] VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [9:0] VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [9:0] VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [9:0] VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [9:0] VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [9:0] VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [9:0] VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [9:0] VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [9:0] VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [9:0] VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [9:0] VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  reg [5:0] COMP_LOOP_17_twiddle_f_lshift_itm;
  wire [9:0] VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [9:0] VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [9:0] VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [9:0] VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [9:0] VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [9:0] VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [9:0] VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [9:0] VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [9:0] VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [9:0] VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [9:0] VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [9:0] VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [9:0] VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [9:0] VEC_LOOP_acc_10_cse_sva_mx0w31;
  wire [10:0] nl_VEC_LOOP_acc_10_cse_sva_mx0w31;
  reg [31:0] p_sva;
  wire mux_368_itm;
  wire mux_554_itm;
  wire mux_630_itm;
  wire [5:0] COMP_LOOP_17_twiddle_f_lshift_itm_1;
  wire [4:0] COMP_LOOP_1_twiddle_f_lshift_itm;
  wire mux_515_itm;
  wire mux_716_itm;
  wire and_dcpl_254;
  wire and_dcpl_261;
  wire and_dcpl_263;
  wire and_dcpl_266;
  wire and_dcpl_269;
  wire and_dcpl_274;
  wire [9:0] z_out;
  wire [19:0] nl_z_out;
  wire and_dcpl_285;
  wire [9:0] z_out_1;
  wire [19:0] nl_z_out_1;
  wire and_dcpl_288;
  wire and_dcpl_290;
  wire and_dcpl_293;
  wire and_dcpl_297;
  wire and_dcpl_302;
  wire and_dcpl_307;
  wire and_dcpl_317;
  wire and_dcpl_319;
  wire [9:0] z_out_3;
  wire [19:0] nl_z_out_3;
  wire and_dcpl_334;
  wire and_dcpl_339;
  wire and_dcpl_342;
  wire and_dcpl_343;
  wire and_dcpl_345;
  wire and_dcpl_348;
  wire and_dcpl_352;
  wire and_dcpl_358;
  wire and_dcpl_362;
  wire and_dcpl_365;
  wire and_dcpl_371;
  wire and_dcpl_374;
  wire and_dcpl_377;
  wire and_dcpl_382;
  wire and_dcpl_387;
  wire and_dcpl_390;
  wire and_dcpl_392;
  wire and_dcpl_394;
  wire and_dcpl_399;
  wire [9:0] z_out_6;
  wire [19:0] nl_z_out_6;
  wire and_dcpl_402;
  wire and_dcpl_413;
  wire and_dcpl_414;
  wire and_dcpl_416;
  wire and_dcpl_422;
  wire [9:0] z_out_7;
  wire [19:0] nl_z_out_7;
  wire [10:0] z_out_8;
  wire [9:0] z_out_9;
  wire mux_tmp_1031;
  wire nand_tmp_23;
  wire mux_tmp_1033;
  wire mux_tmp_1035;
  wire or_tmp_560;
  wire or_tmp_561;
  wire mux_tmp_1038;
  wire and_dcpl_451;
  wire and_dcpl_452;
  wire and_dcpl_457;
  wire and_dcpl_459;
  wire and_dcpl_462;
  wire and_dcpl_464;
  wire and_dcpl_466;
  wire and_dcpl_469;
  wire and_dcpl_471;
  wire and_dcpl_474;
  wire and_dcpl_476;
  wire and_dcpl_478;
  wire and_dcpl_479;
  wire and_dcpl_481;
  wire and_dcpl_485;
  wire and_dcpl_486;
  wire and_dcpl_487;
  wire and_dcpl_489;
  wire and_dcpl_490;
  wire and_dcpl_492;
  wire and_dcpl_494;
  wire and_dcpl_496;
  wire and_dcpl_498;
  wire and_dcpl_500;
  wire and_dcpl_502;
  wire [10:0] z_out_10;
  wire and_dcpl_508;
  wire and_dcpl_518;
  wire and_dcpl_555;
  wire mux_tmp_1045;
  wire or_tmp_565;
  wire or_tmp_567;
  wire mux_tmp_1047;
  wire or_tmp_570;
  wire mux_tmp_1049;
  wire or_tmp_573;
  wire mux_tmp_1053;
  wire and_dcpl_564;
  wire [31:0] z_out_13;
  wire and_dcpl_567;
  wire and_dcpl_571;
  wire and_dcpl_572;
  wire and_dcpl_575;
  wire and_dcpl_580;
  wire and_dcpl_582;
  wire and_dcpl_583;
  wire and_dcpl_584;
  wire and_dcpl_585;
  wire and_dcpl_588;
  wire and_dcpl_589;
  wire and_dcpl_590;
  wire and_dcpl_592;
  wire and_dcpl_593;
  wire and_dcpl_595;
  wire and_dcpl_596;
  wire and_dcpl_597;
  wire and_dcpl_598;
  wire and_dcpl_600;
  wire and_dcpl_601;
  wire and_dcpl_602;
  wire and_dcpl_603;
  wire and_dcpl_605;
  wire and_dcpl_606;
  wire and_dcpl_608;
  wire and_dcpl_609;
  wire and_dcpl_610;
  wire and_dcpl_612;
  wire and_dcpl_613;
  wire and_dcpl_614;
  wire and_dcpl_615;
  wire and_dcpl_616;
  wire and_dcpl_618;
  wire and_dcpl_619;
  wire and_dcpl_620;
  wire and_dcpl_621;
  wire and_dcpl_623;
  wire and_dcpl_624;
  wire and_dcpl_625;
  wire and_dcpl_627;
  wire and_dcpl_628;
  wire and_dcpl_630;
  wire and_dcpl_631;
  wire and_dcpl_633;
  wire and_dcpl_634;
  wire and_dcpl_635;
  wire and_dcpl_636;
  wire and_dcpl_637;
  wire and_dcpl_638;
  wire and_dcpl_639;
  wire and_dcpl_640;
  wire and_dcpl_641;
  wire and_dcpl_646;
  wire and_dcpl_648;
  wire and_dcpl_649;
  wire and_dcpl_650;
  wire and_dcpl_651;
  wire and_dcpl_652;
  wire and_dcpl_653;
  wire and_dcpl_654;
  wire and_dcpl_655;
  wire and_dcpl_656;
  wire and_dcpl_657;
  wire [9:0] z_out_14;
  wire and_dcpl_660;
  wire [6:0] z_out_15;
  wire [7:0] nl_z_out_15;
  wire and_dcpl_698;
  wire and_dcpl_741;
  wire and_dcpl_746;
  wire [9:0] z_out_16;
  wire [10:0] nl_z_out_16;
  wire [9:0] z_out_17;
  wire [10:0] nl_z_out_17;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [9:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  reg [8:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  reg [6:0] COMP_LOOP_9_twiddle_f_lshift_ncse_sva;
  reg [4:0] COMP_LOOP_k_10_5_sva_4_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [3:0] COMP_LOOP_1_twiddle_f_acc_cse_sva_1;
  wire [4:0] nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_1;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c1;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c3;
  wire [9:0] COMP_LOOP_twiddle_f_mul_cse_14_sva_1;
  wire [19:0] nl_COMP_LOOP_twiddle_f_mul_cse_14_sva_1;
  wire COMP_LOOP_twiddle_f_or_2_rgt;
  wire VEC_LOOP_or_5_ssc;
  wire COMP_LOOP_twiddle_f_or_20_cse;
  wire COMP_LOOP_twiddle_f_or_8_cse;
  wire COMP_LOOP_twiddle_f_or_14_cse;
  wire COMP_LOOP_twiddle_f_or_31_cse;
  wire COMP_LOOP_twiddle_f_or_24_cse;
  wire COMP_LOOP_twiddle_f_or_39_cse;
  wire COMP_LOOP_twiddle_f_or_32_cse;
  wire COMP_LOOP_twiddle_f_or_38_cse;
  wire VEC_LOOP_or_9_cse;
  wire VEC_LOOP_or_26_cse;
  wire VEC_LOOP_or_29_cse;
  wire VEC_LOOP_or_14_cse;
  wire nor_98_cse;
  wire and_275_cse;
  wire nor_183_cse;
  wire nand_47_cse;
  wire and_293_cse;
  wire and_739_cse;
  wire and_744_cse;
  wire and_749_cse;
  wire [7:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt;
  wire mux_tmp_1074;
  wire mux_tmp_1093;
  wire [10:0] VEC_LOOP_j_VEC_LOOP_j_mux_rgt;
  wire mux_tmp_1108;
  wire or_tmp_612;
  wire not_tmp_481;
  reg [5:0] reg_VEC_LOOP_j_10_10_0_tmp;
  wire or_tmp_648;
  wire or_tmp_649;
  wire or_tmp_653;
  wire mux_tmp_1153;
  wire or_tmp_664;
  reg [4:0] VEC_LOOP_j_10_10_0_sva_1_4_0;
  reg VEC_LOOP_acc_11_psp_sva_8;
  reg [3:0] COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4;
  reg [3:0] COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0;
  reg reg_VEC_LOOP_acc_11_psp_1_reg;
  reg [6:0] reg_VEC_LOOP_acc_11_psp_2_reg;
  wire mux_827_ssc;
  wire or_787_cse;
  wire or_584_cse_1;
  wire or_583_cse_1;
  wire mux_1024_cse;
  wire or_834_cse;
  wire or_869_cse;
  wire or_870_cse;
  wire or_788_cse;
  wire or_728_cse;
  wire mux_1081_cse;
  wire mux_1125_cse;
  wire mux_1145_cse;
  wire mux_1141_cse;
  wire mux_1143_cse;
  wire mux_1095_cse;
  wire mux_484_cse;
  wire mux_975_cse;
  wire mux_981_cse;
  wire mux_985_cse;
  wire mux_1025_cse;
  wire COMP_LOOP_twiddle_help_and_itm;
  wire COMP_LOOP_twiddle_f_or_52_itm;
  wire COMP_LOOP_twiddle_f_nor_5_itm;
  wire COMP_LOOP_twiddle_f_or_itm;
  wire VEC_LOOP_or_46_itm;
  wire VEC_LOOP_nor_7_itm;
  wire VEC_LOOP_or_33_itm;
  wire VEC_LOOP_or_36_itm;
  wire VEC_LOOP_or_48_itm;
  wire VEC_LOOP_or_56_itm;
  wire VEC_LOOP_or_60_itm;
  wire VEC_LOOP_or_61_itm;
  wire VEC_LOOP_or_78_itm;
  wire STAGE_LOOP_acc_itm_4_1;
  wire [7:0] z_out_2_7_0;
  wire [15:0] nl_z_out_2_7_0;
  wire [8:0] z_out_4_8_0;
  wire [17:0] nl_z_out_4_8_0;
  wire [8:0] z_out_5_8_0;
  wire [17:0] nl_z_out_5_8_0;
  wire z_out_11_10;
  wire [12:0] z_out_12_22_10;

  wire[0:0] mux_367_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] or_324_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] or_375_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_553_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] mux_549_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] mux_575_nl;
  wire[0:0] mux_574_nl;
  wire[0:0] mux_573_nl;
  wire[0:0] mux_572_nl;
  wire[0:0] mux_571_nl;
  wire[0:0] mux_570_nl;
  wire[0:0] mux_569_nl;
  wire[0:0] or_452_nl;
  wire[0:0] mux_568_nl;
  wire[0:0] mux_567_nl;
  wire[0:0] or_450_nl;
  wire[0:0] mux_566_nl;
  wire[0:0] mux_565_nl;
  wire[0:0] mux_564_nl;
  wire[0:0] mux_563_nl;
  wire[0:0] mux_560_nl;
  wire[0:0] mux_559_nl;
  wire[0:0] mux_557_nl;
  wire[0:0] mux_556_nl;
  wire[0:0] mux_576_nl;
  wire[0:0] nor_101_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_28_nl;
  wire[0:0] mux_577_nl;
  wire[0:0] nor_100_nl;
  wire[0:0] and_296_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_55_nl;
  wire[0:0] mux_578_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_85_nl;
  wire[0:0] mux_596_nl;
  wire[0:0] mux_595_nl;
  wire[0:0] mux_594_nl;
  wire[0:0] mux_593_nl;
  wire[0:0] mux_591_nl;
  wire[0:0] mux_590_nl;
  wire[0:0] mux_589_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] mux_587_nl;
  wire[0:0] mux_583_nl;
  wire[0:0] mux_582_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_108_nl;
  wire[0:0] mux_599_nl;
  wire[0:0] mux_598_nl;
  wire[0:0] mux_597_nl;
  wire[0:0] or_465_nl;
  wire[0:0] and_199_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_153_nl;
  wire[0:0] mux_610_nl;
  wire[0:0] or_476_nl;
  wire[0:0] mux_609_nl;
  wire[0:0] mux_608_nl;
  wire[0:0] mux_607_nl;
  wire[0:0] mux_606_nl;
  wire[0:0] or_475_nl;
  wire[0:0] mux_605_nl;
  wire[0:0] mux_604_nl;
  wire[0:0] or_473_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] mux_628_nl;
  wire[0:0] mux_627_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] mux_671_nl;
  wire[0:0] and_217_nl;
  wire[0:0] COMP_LOOP_k_not_nl;
  wire[0:0] mux_1061_nl;
  wire[0:0] nor_221_nl;
  wire[0:0] mux_1060_nl;
  wire[0:0] or_785_nl;
  wire[0:0] mux_684_nl;
  wire[0:0] mux_683_nl;
  wire[0:0] mux_682_nl;
  wire[0:0] mux_681_nl;
  wire[0:0] and_220_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] and_316_nl;
  wire[0:0] or_533_nl;
  wire[0:0] mux_700_nl;
  wire[0:0] mux_699_nl;
  wire[0:0] mux_698_nl;
  wire[0:0] and_284_nl;
  wire[0:0] mux_697_nl;
  wire[0:0] and_286_nl;
  wire[9:0] COMP_LOOP_twiddle_f_mux1h_161_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_1_nl;
  wire[0:0] VEC_LOOP_not_nl;
  wire[0:0] mux_1063_nl;
  wire[0:0] mux_1062_nl;
  wire[0:0] nor_220_nl;
  wire[0:0] mux_1067_nl;
  wire[0:0] mux_1066_nl;
  wire[0:0] mux_1065_nl;
  wire[0:0] nor_218_nl;
  wire[0:0] nor_219_nl;
  wire[0:0] mux_1064_nl;
  wire[0:0] or_792_nl;
  wire[4:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl;
  wire[4:0] COMP_LOOP_1_twiddle_f_mul_nl;
  wire[9:0] nl_COMP_LOOP_1_twiddle_f_mul_nl;
  wire[0:0] and_238_nl;
  wire[0:0] mux_1087_nl;
  wire[0:0] mux_1086_nl;
  wire[0:0] or_805_nl;
  wire[0:0] mux_1085_nl;
  wire[0:0] mux_1084_nl;
  wire[0:0] mux_1083_nl;
  wire[0:0] mux_1082_nl;
  wire[0:0] mux_1080_nl;
  wire[0:0] or_803_nl;
  wire[0:0] mux_1079_nl;
  wire[0:0] mux_1078_nl;
  wire[0:0] mux_1077_nl;
  wire[0:0] mux_1076_nl;
  wire[0:0] mux_1104_nl;
  wire[0:0] mux_1103_nl;
  wire[0:0] or_813_nl;
  wire[0:0] mux_1102_nl;
  wire[0:0] mux_1101_nl;
  wire[0:0] mux_1100_nl;
  wire[0:0] nand_62_nl;
  wire[0:0] mux_1099_nl;
  wire[0:0] mux_1098_nl;
  wire[0:0] mux_804_nl;
  wire[0:0] mux_803_nl;
  wire[0:0] or_729_nl;
  wire[0:0] or_730_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] and_281_nl;
  wire[0:0] mux_1123_nl;
  wire[0:0] mux_1122_nl;
  wire[0:0] mux_1121_nl;
  wire[0:0] mux_1120_nl;
  wire[0:0] mux_1119_nl;
  wire[0:0] mux_1118_nl;
  wire[0:0] mux_1117_nl;
  wire[0:0] mux_1116_nl;
  wire[0:0] mux_1115_nl;
  wire[0:0] or_827_nl;
  wire[0:0] mux_1112_nl;
  wire[0:0] mux_1111_nl;
  wire[0:0] nand_67_nl;
  wire[0:0] mux_1110_nl;
  wire[0:0] or_823_nl;
  wire[0:0] mux_1109_nl;
  wire[0:0] nand_68_nl;
  wire[0:0] or_878_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_63_nl;
  wire[0:0] mux_1136_nl;
  wire[0:0] mux_1135_nl;
  wire[0:0] mux_1134_nl;
  wire[0:0] nand_65_nl;
  wire[0:0] mux_1133_nl;
  wire[0:0] nor_213_nl;
  wire[0:0] nor_214_nl;
  wire[0:0] or_843_nl;
  wire[0:0] mux_1131_nl;
  wire[0:0] mux_1130_nl;
  wire[0:0] or_842_nl;
  wire[0:0] mux_1129_nl;
  wire[0:0] or_840_nl;
  wire[0:0] or_839_nl;
  wire[0:0] mux_1128_nl;
  wire[0:0] or_837_nl;
  wire[0:0] or_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_64_nl;
  wire[0:0] mux_828_nl;
  wire[0:0] mux_690_nl;
  wire[0:0] mux_780_nl;
  wire[0:0] mux_1148_nl;
  wire[0:0] mux_1147_nl;
  wire[0:0] mux_1146_nl;
  wire[0:0] or_857_nl;
  wire[0:0] or_856_nl;
  wire[0:0] mux_1142_nl;
  wire[0:0] mux_1138_nl;
  wire[0:0] nand_66_nl;
  wire[0:0] mux_873_nl;
  wire[0:0] mux_872_nl;
  wire[0:0] mux_871_nl;
  wire[0:0] mux_870_nl;
  wire[0:0] mux_869_nl;
  wire[0:0] mux_868_nl;
  wire[0:0] mux_867_nl;
  wire[0:0] mux_866_nl;
  wire[0:0] mux_865_nl;
  wire[0:0] mux_864_nl;
  wire[0:0] mux_863_nl;
  wire[0:0] mux_862_nl;
  wire[0:0] mux_861_nl;
  wire[0:0] mux_860_nl;
  wire[0:0] mux_859_nl;
  wire[0:0] mux_857_nl;
  wire[0:0] or_611_nl;
  wire[0:0] mux_855_nl;
  wire[0:0] mux_854_nl;
  wire[0:0] mux_850_nl;
  wire[0:0] mux_849_nl;
  wire[0:0] mux_846_nl;
  wire[0:0] mux_844_nl;
  wire[0:0] mux_843_nl;
  wire[0:0] or_609_nl;
  wire[0:0] mux_842_nl;
  wire[0:0] mux_841_nl;
  wire[0:0] mux_840_nl;
  wire[0:0] mux_839_nl;
  wire[0:0] mux_838_nl;
  wire[0:0] mux_837_nl;
  wire[0:0] mux_835_nl;
  wire[0:0] mux_833_nl;
  wire[0:0] mux_832_nl;
  wire[0:0] mux_829_nl;
  wire[0:0] and_243_nl;
  wire[31:0] VEC_LOOP_mux1h_15_nl;
  wire[0:0] and_248_nl;
  wire[0:0] mux_889_nl;
  wire[0:0] or_630_nl;
  wire[0:0] COMP_LOOP_twiddle_f_nand_nl;
  wire[0:0] mux_1165_nl;
  wire[0:0] mux_1164_nl;
  wire[0:0] mux_1163_nl;
  wire[0:0] mux_1162_nl;
  wire[0:0] mux_1161_nl;
  wire[0:0] mux_1160_nl;
  wire[0:0] or_877_nl;
  wire[0:0] mux_1159_nl;
  wire[0:0] or_876_nl;
  wire[0:0] mux_1158_nl;
  wire[0:0] or_873_nl;
  wire[0:0] mux_1157_nl;
  wire[0:0] or_872_nl;
  wire[0:0] mux_1156_nl;
  wire[0:0] mux_1155_nl;
  wire[0:0] or_871_nl;
  wire[0:0] mux_1154_nl;
  wire[0:0] mux_1152_nl;
  wire[0:0] mux_1151_nl;
  wire[0:0] or_865_nl;
  wire[0:0] mux_1150_nl;
  wire[0:0] mux_1149_nl;
  wire[0:0] or_862_nl;
  wire[0:0] VEC_LOOP_or_20_nl;
  wire[0:0] and_251_nl;
  wire[0:0] mux_962_nl;
  wire[0:0] mux_961_nl;
  wire[0:0] mux_960_nl;
  wire[0:0] mux_957_nl;
  wire[0:0] mux_956_nl;
  wire[0:0] mux_955_nl;
  wire[0:0] mux_954_nl;
  wire[0:0] mux_971_nl;
  wire[0:0] mux_970_nl;
  wire[0:0] mux_969_nl;
  wire[0:0] mux_968_nl;
  wire[0:0] mux_967_nl;
  wire[0:0] and_272_nl;
  wire[0:0] mux_972_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] mux_1020_nl;
  wire[0:0] mux_1019_nl;
  wire[0:0] or_735_nl;
  wire[0:0] mux_1018_nl;
  wire[0:0] or_722_nl;
  wire[0:0] or_721_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_1017_nl;
  wire[0:0] mux_1016_nl;
  wire[0:0] mux_1015_nl;
  wire[0:0] mux_1014_nl;
  wire[0:0] nand_23_nl;
  wire[0:0] mux_1013_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] mux_1012_nl;
  wire[0:0] mux_1010_nl;
  wire[0:0] mux_1009_nl;
  wire[0:0] mux_1008_nl;
  wire[0:0] or_717_nl;
  wire[0:0] or_716_nl;
  wire[0:0] mux_1007_nl;
  wire[0:0] or_714_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_1005_nl;
  wire[0:0] mux_1004_nl;
  wire[0:0] and_259_nl;
  wire[0:0] and_269_nl;
  wire[0:0] mux_1029_nl;
  wire[0:0] or_759_nl;
  wire[0:0] mux_1028_nl;
  wire[0:0] mux_1027_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] or_320_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] or_323_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] mux_400_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] or_346_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] mux_409_nl;
  wire[0:0] mux_408_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] or_5_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] or_355_nl;
  wire[0:0] mux_421_nl;
  wire[0:0] mux_508_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] or_420_nl;
  wire[0:0] or_419_nl;
  wire[0:0] nand_46_nl;
  wire[0:0] mux_547_nl;
  wire[0:0] mux_545_nl;
  wire[0:0] mux_558_nl;
  wire[0:0] or_446_nl;
  wire[0:0] or_445_nl;
  wire[0:0] nand_35_nl;
  wire[0:0] or_472_nl;
  wire[0:0] or_471_nl;
  wire[0:0] mux_611_nl;
  wire[0:0] mux_613_nl;
  wire[0:0] or_481_nl;
  wire[0:0] or_482_nl;
  wire[0:0] mux_620_nl;
  wire[0:0] mux_639_nl;
  wire[0:0] or_496_nl;
  wire[0:0] or_494_nl;
  wire[0:0] mux_644_nl;
  wire[0:0] mux_643_nl;
  wire[0:0] mux_642_nl;
  wire[0:0] or_498_nl;
  wire[0:0] mux_641_nl;
  wire[0:0] or_497_nl;
  wire[0:0] mux_638_nl;
  wire[0:0] mux_637_nl;
  wire[0:0] mux_636_nl;
  wire[0:0] or_493_nl;
  wire[0:0] mux_635_nl;
  wire[0:0] or_488_nl;
  wire[0:0] mux_633_nl;
  wire[0:0] mux_632_nl;
  wire[0:0] or_487_nl;
  wire[0:0] or_483_nl;
  wire[0:0] nand_48_nl;
  wire[0:0] mux_645_nl;
  wire[0:0] or_500_nl;
  wire[0:0] mux_648_nl;
  wire[0:0] nor_99_nl;
  wire[0:0] mux_654_nl;
  wire[0:0] mux_653_nl;
  wire[0:0] mux_652_nl;
  wire[0:0] mux_651_nl;
  wire[0:0] or_511_nl;
  wire[0:0] mux_650_nl;
  wire[0:0] mux_649_nl;
  wire[0:0] or_508_nl;
  wire[0:0] mux_647_nl;
  wire[0:0] mux_672_nl;
  wire[0:0] mux_676_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] or_762_nl;
  wire[0:0] mux_679_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] and_288_nl;
  wire[0:0] and_289_nl;
  wire[0:0] mux_703_nl;
  wire[0:0] mux_701_nl;
  wire[0:0] mux_715_nl;
  wire[0:0] mux_714_nl;
  wire[0:0] mux_713_nl;
  wire[0:0] mux_712_nl;
  wire[0:0] mux_711_nl;
  wire[0:0] mux_718_nl;
  wire[0:0] mux_719_nl;
  wire[0:0] mux_847_nl;
  wire[0:0] mux_851_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] mux_887_nl;
  wire[0:0] and_276_nl;
  wire[0:0] mux_886_nl;
  wire[0:0] or_627_nl;
  wire[0:0] mux_885_nl;
  wire[0:0] mux_880_nl;
  wire[0:0] and_277_nl;
  wire[0:0] mux_879_nl;
  wire[0:0] nor_91_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] and_278_nl;
  wire[0:0] mux_878_nl;
  wire[0:0] mux_877_nl;
  wire[0:0] mux_875_nl;
  wire[0:0] mux_929_nl;
  wire[0:0] mux_928_nl;
  wire[0:0] mux_927_nl;
  wire[0:0] mux_926_nl;
  wire[0:0] mux_925_nl;
  wire[0:0] or_665_nl;
  wire[0:0] mux_924_nl;
  wire[0:0] mux_923_nl;
  wire[0:0] or_661_nl;
  wire[0:0] mux_922_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] mux_921_nl;
  wire[0:0] or_660_nl;
  wire[0:0] mux_920_nl;
  wire[0:0] mux_919_nl;
  wire[0:0] or_658_nl;
  wire[0:0] nand_38_nl;
  wire[0:0] or_655_nl;
  wire[0:0] mux_918_nl;
  wire[0:0] or_654_nl;
  wire[0:0] or_653_nl;
  wire[0:0] mux_963_nl;
  wire[0:0] or_686_nl;
  wire[0:0] mux_988_nl;
  wire[0:0] mux_987_nl;
  wire[0:0] mux_986_nl;
  wire[0:0] mux_983_nl;
  wire[0:0] mux_982_nl;
  wire[0:0] or_713_nl;
  wire[0:0] nand_44_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] mux_733_nl;
  wire[0:0] mux_732_nl;
  wire[0:0] mux_731_nl;
  wire[0:0] mux_730_nl;
  wire[0:0] mux_729_nl;
  wire[0:0] mux_728_nl;
  wire[0:0] mux_727_nl;
  wire[0:0] mux_726_nl;
  wire[0:0] mux_725_nl;
  wire[0:0] or_559_nl;
  wire[0:0] mux_724_nl;
  wire[0:0] or_557_nl;
  wire[5:0] VEC_LOOP_mux1h_10_nl;
  wire[0:0] VEC_LOOP_mux1h_8_nl;
  wire[0:0] VEC_LOOP_mux1h_6_nl;
  wire[0:0] and_140_nl;
  wire[0:0] VEC_LOOP_mux1h_4_nl;
  wire[0:0] and_137_nl;
  wire[0:0] mux_448_nl;
  wire[0:0] mux_447_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] nor_103_nl;
  wire[0:0] VEC_LOOP_mux1h_2_nl;
  wire[0:0] and_133_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] mux_427_nl;
  wire[4:0] VEC_LOOP_mux1h_nl;
  wire[0:0] and_39_nl;
  wire[0:0] VEC_LOOP_mux1h_1_nl;
  wire[0:0] VEC_LOOP_mux1h_3_nl;
  wire[0:0] and_134_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] or_368_nl;
  wire[0:0] VEC_LOOP_mux1h_5_nl;
  wire[0:0] and_138_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] mux_462_nl;
  wire[0:0] mux_461_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] or_385_nl;
  wire[0:0] mux_450_nl;
  wire[0:0] VEC_LOOP_mux1h_7_nl;
  wire[0:0] and_141_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] or_398_nl;
  wire[0:0] VEC_LOOP_mux1h_9_nl;
  wire[0:0] and_142_nl;
  wire[0:0] mux_498_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] or_767_nl;
  wire[0:0] mux_1033_nl;
  wire[0:0] mux_1031_nl;
  wire[0:0] mux_1035_nl;
  wire[0:0] or_768_nl;
  wire[0:0] mux_1045_nl;
  wire[0:0] or_775_nl;
  wire[0:0] mux_1047_nl;
  wire[0:0] or_638_nl;
  wire[0:0] or_637_nl;
  wire[0:0] or_780_nl;
  wire[0:0] mux_1051_nl;
  wire[0:0] mux_1058_nl;
  wire[0:0] mux_1057_nl;
  wire[0:0] mux_1056_nl;
  wire[0:0] mux_1055_nl;
  wire[0:0] or_784_nl;
  wire[0:0] mux_1054_nl;
  wire[0:0] mux_1053_nl;
  wire[0:0] mux_1050_nl;
  wire[0:0] mux_1049_nl;
  wire[0:0] mux_1070_nl;
  wire[0:0] or_868_nl;
  wire[0:0] or_867_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl;
  wire[1:0] COMP_LOOP_twiddle_f_mux_7_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_65_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl;
  wire[3:0] COMP_LOOP_twiddle_f_mux_8_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl;
  wire[3:0] COMP_LOOP_twiddle_f_mux1h_347_nl;
  wire[0:0] and_860_nl;
  wire[0:0] and_861_nl;
  wire[0:0] and_862_nl;
  wire[0:0] and_863_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl;
  wire[8:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl;
  wire[4:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl;
  wire[2:0] COMP_LOOP_twiddle_f_mux1h_348_nl;
  wire[0:0] and_864_nl;
  wire[2:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl;
  wire[6:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl;
  wire[2:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl;
  wire[2:0] COMP_LOOP_twiddle_f_mux1h_349_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_66_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl;
  wire[1:0] COMP_LOOP_twiddle_f_or_67_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_68_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_69_nl;
  wire[11:0] acc_nl;
  wire[12:0] nl_acc_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_10_nl;
  wire[9:0] VEC_LOOP_VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_or_80_nl;
  wire[0:0] mux_1166_nl;
  wire[0:0] mux_1167_nl;
  wire[0:0] mux_1168_nl;
  wire[0:0] mux_1169_nl;
  wire[0:0] mux_1170_nl;
  wire[0:0] mux_1171_nl;
  wire[0:0] mux_1172_nl;
  wire[4:0] VEC_LOOP_VEC_LOOP_mux_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_11_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_12_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_13_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_14_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_15_nl;
  wire[11:0] acc_1_nl;
  wire[12:0] nl_acc_1_nl;
  wire[4:0] COMP_LOOP_mux1h_4_nl;
  wire[0:0] and_866_nl;
  wire[0:0] and_867_nl;
  wire[0:0] and_868_nl;
  wire[0:0] and_869_nl;
  wire[0:0] and_870_nl;
  wire[0:0] and_871_nl;
  wire[0:0] and_872_nl;
  wire[0:0] and_873_nl;
  wire[23:0] acc_2_nl;
  wire[24:0] nl_acc_2_nl;
  wire[21:0] VEC_LOOP_mux_7_nl;
  wire[0:0] VEC_LOOP_or_81_nl;
  wire[9:0] VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire[31:0] VEC_LOOP_mux_8_nl;
  wire[0:0] VEC_LOOP_or_82_nl;
  wire[31:0] VEC_LOOP_mux_9_nl;
  wire[10:0] acc_4_nl;
  wire[11:0] nl_acc_4_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_1_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_16_nl;
  wire[0:0] VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_or_83_nl;
  wire[0:0] VEC_LOOP_mux1h_42_nl;
  wire[6:0] VEC_LOOP_mux1h_43_nl;
  wire[0:0] VEC_LOOP_or_84_nl;
  wire[0:0] VEC_LOOP_or_85_nl;
  wire[0:0] VEC_LOOP_or_86_nl;
  wire[0:0] VEC_LOOP_and_30_nl;
  wire[0:0] VEC_LOOP_and_31_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_12_nl;
  wire[0:0] VEC_LOOP_and_32_nl;
  wire[0:0] VEC_LOOP_mux1h_44_nl;
  wire[0:0] VEC_LOOP_and_33_nl;
  wire[0:0] VEC_LOOP_mux1h_45_nl;
  wire[0:0] VEC_LOOP_and_34_nl;
  wire[0:0] VEC_LOOP_mux1h_46_nl;
  wire[0:0] VEC_LOOP_or_87_nl;
  wire[0:0] VEC_LOOP_mux1h_47_nl;
  wire[0:0] VEC_LOOP_or_88_nl;
  wire[0:0] VEC_LOOP_mux1h_48_nl;
  wire[0:0] VEC_LOOP_or_89_nl;
  wire[0:0] VEC_LOOP_mux1h_49_nl;
  wire[0:0] VEC_LOOP_or_90_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_13_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_17_nl;
  wire[4:0] VEC_LOOP_VEC_LOOP_mux_14_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_18_nl;
  wire[6:0] VEC_LOOP_VEC_LOOP_mux_15_nl;
  wire[4:0] VEC_LOOP_or_91_nl;
  wire[4:0] VEC_LOOP_mux1h_50_nl;
  wire[0:0] and_874_nl;
  wire[0:0] and_875_nl;
  wire[0:0] and_876_nl;
  wire[0:0] and_877_nl;
  wire[0:0] and_878_nl;
  wire[0:0] and_879_nl;
  wire[0:0] and_880_nl;
  wire[0:0] and_881_nl;
  wire[0:0] and_882_nl;
  wire[0:0] and_883_nl;
  wire[0:0] and_884_nl;
  wire[0:0] and_885_nl;
  wire[5:0] VEC_LOOP_mux1h_51_nl;
  wire[4:0] VEC_LOOP_acc_62_nl;
  wire[5:0] nl_VEC_LOOP_acc_62_nl;
  wire[0:0] and_886_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_16_nl;
  wire[9:0] VEC_LOOP_mux_11_nl;
  wire[0:0] VEC_LOOP_or_92_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = z_out_13;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat = factor1_1_sva + COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_x_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_x_rsc_dat = VEC_LOOP_mult_vec_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat = MUX1HOT_v_32_3_2(COMP_LOOP_twiddle_f_1_sva,
      COMP_LOOP_twiddle_f_11_sva, COMP_LOOP_twiddle_f_9_sva, {and_dcpl_203 , and_dcpl_204
      , and_dcpl_205});
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = MUX1HOT_v_32_3_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_11_sva, COMP_LOOP_twiddle_help_9_sva, {and_dcpl_203
      , and_dcpl_204 , and_dcpl_205});
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire[0:0] mux_669_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] mux_667_nl;
  wire [0:0] nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  assign mux_667_nl = MUX_s_1_2_2(mux_666_cse, mux_380_cse, fsm_output[5]);
  assign mux_668_nl = MUX_s_1_2_2(mux_381_cse, mux_667_nl, fsm_output[3]);
  assign mux_669_nl = MUX_s_1_2_2(mux_668_nl, mux_382_cse, fsm_output[1]);
  assign nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat = (~ mux_669_nl) & (fsm_output[0]);
  wire[0:0] and_507_nl;
  wire [3:0] nl_COMP_LOOP_9_twiddle_f_lshift_rg_s;
  assign and_507_nl = (fsm_output==9'b000000010);
  assign nl_COMP_LOOP_9_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva,
      COMP_LOOP_1_twiddle_f_acc_cse_sva_1, and_507_nl);
  wire[0:0] and_519_nl;
  wire [3:0] nl_COMP_LOOP_2_twiddle_f_lshift_rg_s;
  assign and_519_nl = nor_98_cse & nor_183_cse & and_dcpl_53 & (fsm_output[1:0]==2'b10);
  assign nl_COMP_LOOP_2_twiddle_f_lshift_rg_s = MUX_v_4_2_2(COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0,
      COMP_LOOP_1_twiddle_f_acc_cse_sva_1, and_519_nl);
  wire[31:0] VEC_LOOP_mux1h_11_nl;
  wire[0:0] and_143_nl;
  wire[0:0] and_147_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] or_421_nl;
  wire[0:0] nor_155_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] and_151_nl;
  wire [63:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core;
  assign and_143_nl = (~ mux_515_itm) & (fsm_output[0]);
  assign or_421_nl = (fsm_output[8]) | (~((fsm_output[3:2]==2'b11) & mux_tmp_517));
  assign mux_518_nl = MUX_s_1_2_2(or_421_nl, mux_tmp_516, fsm_output[1]);
  assign and_147_nl = (~ mux_518_nl) & nor_132_cse & (~ (fsm_output[0]));
  assign mux_530_nl = MUX_s_1_2_2(mux_529_cse, mux_452_cse, fsm_output[4]);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, mux_tmp_526, fsm_output[2]);
  assign mux_532_nl = MUX_s_1_2_2(mux_456_cse, mux_531_nl, fsm_output[3]);
  assign mux_525_nl = MUX_s_1_2_2(mux_tmp_454, or_384_cse, fsm_output[4]);
  assign mux_527_nl = MUX_s_1_2_2(mux_tmp_526, mux_525_nl, fsm_output[2]);
  assign mux_528_nl = MUX_s_1_2_2(mux_527_nl, mux_456_cse, fsm_output[3]);
  assign mux_533_nl = MUX_s_1_2_2(mux_532_nl, mux_528_nl, fsm_output[1]);
  assign nor_155_nl = ~(mux_533_nl | (fsm_output[0]));
  assign and_151_nl = and_dcpl_65 & and_dcpl_145;
  assign VEC_LOOP_mux1h_11_nl = MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_11_sva, COMP_LOOP_twiddle_f_9_sva, COMP_LOOP_twiddle_f_1_sva,
      {and_143_nl , and_147_nl , nor_155_nl , and_151_nl});
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core = {32'b00000000000000000000000000000000
      , VEC_LOOP_mux1h_11_nl};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct
      = {1'b0 , (~ mux_554_itm)};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_25_rmff , and_25_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (~ mux_554_itm)};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff = ~ mux_368_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro = ~ mux_515_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 = ~ mux_630_itm;
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_157_rmff , and_152_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_157_rmff , and_152_rmff};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0
      = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (z_out_14[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 = ~ (z_out_14[7]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 = ~ (z_out_14[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 = ~ (z_out_14[6]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 = ~ (z_out_14[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 = ~ z_out_11_10;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 = ~ (z_out_14[7]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 = ~ (z_out_14[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 = ~ (z_out_10[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 = ~ (z_out_14[5]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_8_tr0
      = reg_VEC_LOOP_j_10_10_0_tmp[5];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 = ~ (z_out_12_22_10[0]);
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
      .ccs_ccore_start_rsc_dat(and_207_rmff),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(and_207_rmff),
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
  .width_z(32'sd6)) COMP_LOOP_17_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva_1),
      .z(COMP_LOOP_17_twiddle_f_lshift_itm_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd5)) COMP_LOOP_1_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva_1),
      .z(COMP_LOOP_1_twiddle_f_lshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd11)) COMP_LOOP_9_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_9_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out_8)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd10)) COMP_LOOP_2_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_2_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out_9)
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
      .vec_rsci_oswt_1_pff(and_25_rmff)
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
      .twiddle_rsci_oswt_1_pff(and_157_rmff),
      .twiddle_rsci_oswt_pff(and_152_rmff)
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
      .twiddle_h_rsci_oswt_1_pff(and_157_rmff),
      .twiddle_h_rsci_oswt_pff(and_152_rmff)
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
  assign nand_2_nl = ~((fsm_output[5]) & (~ mux_tmp_338));
  assign mux_363_nl = MUX_s_1_2_2(mux_tmp_346, or_tmp_145, fsm_output[5]);
  assign mux_364_nl = MUX_s_1_2_2(nand_2_nl, mux_363_nl, fsm_output[6]);
  assign mux_361_nl = MUX_s_1_2_2(or_tmp_145, mux_tmp_346, fsm_output[5]);
  assign or_324_nl = (fsm_output[5]) | mux_tmp_345;
  assign mux_362_nl = MUX_s_1_2_2(mux_361_nl, or_324_nl, fsm_output[6]);
  assign mux_365_nl = MUX_s_1_2_2(mux_364_nl, mux_362_nl, fsm_output[1]);
  assign mux_360_nl = MUX_s_1_2_2(mux_tmp_355, mux_tmp_343, fsm_output[1]);
  assign mux_366_nl = MUX_s_1_2_2(mux_365_nl, mux_360_nl, fsm_output[4]);
  assign mux_359_nl = MUX_s_1_2_2(mux_tmp_344, mux_tmp_356, fsm_output[4]);
  assign mux_367_nl = MUX_s_1_2_2(mux_366_nl, mux_359_nl, fsm_output[3]);
  assign mux_353_nl = MUX_s_1_2_2(mux_tmp_340, mux_tmp_350, fsm_output[1]);
  assign mux_357_nl = MUX_s_1_2_2(mux_tmp_356, mux_353_nl, fsm_output[4]);
  assign mux_351_nl = MUX_s_1_2_2(mux_tmp_350, mux_tmp_348, fsm_output[1]);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, mux_tmp_344, fsm_output[4]);
  assign mux_358_nl = MUX_s_1_2_2(mux_357_nl, mux_352_nl, fsm_output[3]);
  assign mux_368_itm = MUX_s_1_2_2(mux_367_nl, mux_358_nl, fsm_output[2]);
  assign mux_380_cse = MUX_s_1_2_2(mux_1081_cse, mux_473_cse, fsm_output[2]);
  assign mux_381_cse = MUX_s_1_2_2(mux_380_cse, mux_tmp_374, fsm_output[5]);
  assign mux_377_nl = MUX_s_1_2_2(mux_472_cse, mux_1081_cse, fsm_output[2]);
  assign mux_378_cse = MUX_s_1_2_2(mux_663_cse, mux_377_nl, fsm_output[5]);
  assign mux_382_cse = MUX_s_1_2_2(mux_664_cse, mux_381_cse, fsm_output[3]);
  assign mux_379_cse = MUX_s_1_2_2(mux_378_cse, mux_664_cse, fsm_output[3]);
  assign mux_383_nl = MUX_s_1_2_2(mux_382_cse, mux_379_cse, fsm_output[1]);
  assign and_25_rmff = (~ mux_383_nl) & (fsm_output[0]);
  assign mux_428_cse = MUX_s_1_2_2(or_tmp_158, or_tmp_157, fsm_output[3]);
  assign mux_429_cse = MUX_s_1_2_2(mux_tmp_425, mux_428_cse, fsm_output[5]);
  assign nand_47_cse = ~((fsm_output[3]) & (fsm_output[7]) & (~ (fsm_output[8]))
      & (fsm_output[6]));
  assign mux_426_cse = MUX_s_1_2_2(nand_47_cse, mux_tmp_425, fsm_output[5]);
  assign or_375_nl = (~ (fsm_output[3])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_437_cse = MUX_s_1_2_2(or_tmp_175, or_375_nl, fsm_output[6]);
  assign nand_6_cse = ~((fsm_output[6]) & (~ mux_tmp_405));
  assign nand_5_cse = ~((fsm_output[6]) & (~ mux_tmp_401));
  assign or_377_cse = (fsm_output[6]) | mux_tmp_405;
  assign mux_434_cse = MUX_s_1_2_2(mux_tmp_404, or_tmp_172, fsm_output[4]);
  assign mux_439_cse = MUX_s_1_2_2(or_377_cse, mux_437_cse, fsm_output[4]);
  assign mux_435_cse = MUX_s_1_2_2(or_tmp_172, nand_5_cse, fsm_output[4]);
  assign mux_440_cse = MUX_s_1_2_2(nand_6_cse, mux_tmp_404, fsm_output[4]);
  assign or_390_cse = (fsm_output[8:6]!=3'b101);
  assign or_384_cse = (fsm_output[8:5]!=4'b0101);
  assign mux_452_cse = MUX_s_1_2_2(or_tmp_157, or_tmp_158, fsm_output[5]);
  assign mux_457_cse = MUX_s_1_2_2(or_tmp_161, or_tmp_157, fsm_output[5]);
  assign mux_455_nl = MUX_s_1_2_2(mux_tmp_451, mux_tmp_454, fsm_output[4]);
  assign mux_453_nl = MUX_s_1_2_2(mux_452_cse, mux_tmp_451, fsm_output[4]);
  assign mux_456_cse = MUX_s_1_2_2(mux_455_nl, mux_453_nl, fsm_output[2]);
  assign or_395_cse = (~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[8])
      | (fsm_output[7]);
  assign mux_475_cse = MUX_s_1_2_2(or_390_cse, or_tmp_160, fsm_output[4]);
  assign mux_472_cse = MUX_s_1_2_2(or_tmp_161, or_tmp_160, fsm_output[4]);
  assign mux_473_cse = MUX_s_1_2_2(or_tmp_156, or_tmp_158, fsm_output[4]);
  assign mux_469_cse = MUX_s_1_2_2(or_tmp_160, or_tmp_157, fsm_output[4]);
  assign mux_474_cse = MUX_s_1_2_2(mux_473_cse, mux_472_cse, fsm_output[5]);
  assign mux_470_cse = MUX_s_1_2_2(mux_1081_cse, mux_469_cse, fsm_output[5]);
  assign mux_476_nl = MUX_s_1_2_2(mux_475_cse, mux_369_cse, fsm_output[5]);
  assign mux_477_nl = MUX_s_1_2_2(mux_476_nl, mux_474_cse, fsm_output[3]);
  assign mux_471_nl = MUX_s_1_2_2(mux_470_cse, mux_tmp_467, fsm_output[3]);
  assign mux_478_cse = MUX_s_1_2_2(mux_477_nl, mux_471_nl, fsm_output[2]);
  assign mux_465_nl = MUX_s_1_2_2(or_395_cse, mux_369_cse, fsm_output[5]);
  assign mux_468_cse = MUX_s_1_2_2(mux_tmp_467, mux_465_nl, fsm_output[3]);
  assign mux_484_cse = MUX_s_1_2_2(mux_469_cse, mux_473_cse, fsm_output[5]);
  assign mux_485_cse = MUX_s_1_2_2(mux_484_cse, mux_470_cse, fsm_output[3]);
  assign mux_529_cse = MUX_s_1_2_2(or_tmp_160, or_tmp_156, fsm_output[5]);
  assign mux_550_nl = MUX_s_1_2_2(mux_437_cse, mux_tmp_404, fsm_output[4]);
  assign mux_551_nl = MUX_s_1_2_2(mux_tmp_536, mux_550_nl, fsm_output[5]);
  assign mux_552_nl = MUX_s_1_2_2(mux_551_nl, mux_tmp_543, fsm_output[2]);
  assign mux_553_nl = MUX_s_1_2_2(mux_552_nl, mux_tmp_548, fsm_output[1]);
  assign mux_539_nl = MUX_s_1_2_2(mux_434_cse, mux_tmp_536, fsm_output[5]);
  assign mux_544_nl = MUX_s_1_2_2(mux_tmp_543, mux_539_nl, fsm_output[2]);
  assign mux_549_nl = MUX_s_1_2_2(mux_tmp_548, mux_544_nl, fsm_output[1]);
  assign mux_554_itm = MUX_s_1_2_2(mux_553_nl, mux_549_nl, fsm_output[0]);
  assign mux_572_nl = MUX_s_1_2_2(mux_tmp_562, or_tmp_273, fsm_output[4]);
  assign mux_573_nl = MUX_s_1_2_2(mux_tmp_561, mux_572_nl, fsm_output[3]);
  assign or_452_nl = (fsm_output[6:5]!=2'b01) | not_tmp_207;
  assign mux_569_nl = MUX_s_1_2_2(or_452_nl, or_tmp_274, fsm_output[7]);
  assign mux_570_nl = MUX_s_1_2_2(mux_569_nl, mux_tmp_555, fsm_output[4]);
  assign or_450_nl = COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm | (fsm_output[5])
      | (fsm_output[6]) | (fsm_output[8]);
  assign mux_567_nl = MUX_s_1_2_2(or_450_nl, or_tmp_272, fsm_output[7]);
  assign mux_568_nl = MUX_s_1_2_2(mux_567_nl, mux_tmp_562, fsm_output[4]);
  assign mux_571_nl = MUX_s_1_2_2(mux_570_nl, mux_568_nl, fsm_output[3]);
  assign mux_574_nl = MUX_s_1_2_2(mux_573_nl, mux_571_nl, fsm_output[2]);
  assign mux_563_nl = MUX_s_1_2_2(or_449_cse, or_tmp_272, fsm_output[7]);
  assign mux_564_nl = MUX_s_1_2_2(mux_563_nl, mux_tmp_562, fsm_output[4]);
  assign mux_565_nl = MUX_s_1_2_2(mux_564_nl, mux_tmp_561, fsm_output[3]);
  assign mux_557_nl = MUX_s_1_2_2(or_tmp_274, or_tmp_272, fsm_output[7]);
  assign mux_559_nl = MUX_s_1_2_2(or_tmp_277, mux_557_nl, fsm_output[4]);
  assign mux_556_nl = MUX_s_1_2_2(or_tmp_273, mux_tmp_555, fsm_output[4]);
  assign mux_560_nl = MUX_s_1_2_2(mux_559_nl, mux_556_nl, fsm_output[3]);
  assign mux_566_nl = MUX_s_1_2_2(mux_565_nl, mux_560_nl, fsm_output[2]);
  assign mux_575_nl = MUX_s_1_2_2(mux_574_nl, mux_566_nl, fsm_output[1]);
  assign and_152_rmff = (~ mux_575_nl) & (fsm_output[0]);
  assign nor_101_nl = ~(COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm | (fsm_output[3:2]!=2'b11));
  assign mux_576_nl = MUX_s_1_2_2(nor_101_nl, and_dcpl_53, fsm_output[1]);
  assign and_157_rmff = mux_576_nl & (~ (fsm_output[7])) & and_dcpl_148 & (~ (fsm_output[5]))
      & and_dcpl_124;
  assign COMP_LOOP_twiddle_f_or_20_cse = and_dcpl_154 | (and_dcpl_59 & and_dcpl_47
      & and_dcpl_37) | (and_dcpl_82 & and_dcpl_47 & and_dcpl_37) | (and_dcpl_28 &
      and_dcpl_119);
  assign COMP_LOOP_twiddle_f_or_8_cse = (and_dcpl_48 & and_dcpl_40) | (and_dcpl_56
      & and_dcpl_24) | (and_dcpl_100 & and_dcpl_24);
  assign COMP_LOOP_twiddle_f_or_14_cse = (and_dcpl_51 & and_dcpl_32) | (and_dcpl_65
      & and_dcpl_32) | (and_dcpl_77 & and_dcpl_32) | (and_dcpl_42 & and_dcpl_113);
  assign COMP_LOOP_twiddle_f_or_31_cse = and_dcpl_159 | (and_dcpl_95 & and_dcpl_40)
      | (and_dcpl_108 & and_dcpl_24) | (and_dcpl_114 & and_dcpl_111);
  assign COMP_LOOP_twiddle_f_or_24_cse = (and_dcpl_71 & and_dcpl_24) | (and_dcpl_85
      & and_dcpl_40) | (and_dcpl_89 & and_dcpl_24) | (and_dcpl_48 & and_dcpl_117);
  assign COMP_LOOP_twiddle_f_or_39_cse = (and_dcpl_80 & and_dcpl_24) | (and_dcpl_104
      & and_dcpl_40);
  assign COMP_LOOP_twiddle_f_or_32_cse = (and_dcpl_87 & and_dcpl_32) | (and_dcpl_97
      & and_dcpl_32) | (and_dcpl_106 & and_dcpl_32);
  assign COMP_LOOP_twiddle_f_or_38_cse = (and_dcpl_122 & and_dcpl_37) | (and_dcpl_99
      & and_dcpl_33 & and_dcpl_37);
  assign COMP_LOOP_twiddle_f_mux1h_28_nl = MUX1HOT_s_1_10_2((reg_VEC_LOOP_acc_11_psp_2_reg[2]),
      (z_out_2_7_0[1]), (z_out[3]), (z_out_4_8_0[2]), (z_out_6[0]), (z_out_3[3]),
      (z_out_7[3]), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[3]), (z_out_6[3]), (z_out_5_8_0[2]),
      {and_dcpl_153 , COMP_LOOP_twiddle_f_or_20_cse , COMP_LOOP_twiddle_f_or_8_cse
      , COMP_LOOP_twiddle_f_or_14_cse , COMP_LOOP_twiddle_f_or_38_cse , COMP_LOOP_twiddle_f_or_31_cse
      , COMP_LOOP_twiddle_f_or_24_cse , and_dcpl_164 , COMP_LOOP_twiddle_f_or_39_cse
      , COMP_LOOP_twiddle_f_or_32_cse});
  assign nor_100_nl = ~((fsm_output[3]) | (fsm_output[7]));
  assign and_296_nl = (fsm_output[3]) & (fsm_output[7]);
  assign mux_577_nl = MUX_s_1_2_2(nor_100_nl, and_296_nl, fsm_output[2]);
  assign COMP_LOOP_twiddle_f_mux1h_28_rmff = COMP_LOOP_twiddle_f_mux1h_28_nl & (~(mux_577_nl
      & and_dcpl_148 & and_dcpl_167 & and_291_cse));
  assign COMP_LOOP_twiddle_f_mux1h_55_nl = MUX1HOT_s_1_9_2((reg_VEC_LOOP_acc_11_psp_2_reg[1]),
      (z_out_2_7_0[0]), (z_out[2]), (z_out_4_8_0[1]), (z_out_3[2]), (z_out_7[2]),
      (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[2]), (z_out_6[2]), (z_out_5_8_0[1]),
      {and_dcpl_153 , COMP_LOOP_twiddle_f_or_20_cse , COMP_LOOP_twiddle_f_or_8_cse
      , COMP_LOOP_twiddle_f_or_14_cse , COMP_LOOP_twiddle_f_or_31_cse , COMP_LOOP_twiddle_f_or_24_cse
      , and_dcpl_164 , COMP_LOOP_twiddle_f_or_39_cse , COMP_LOOP_twiddle_f_or_32_cse});
  assign nand_9_nl = ~((fsm_output[3]) & (~ mux_tmp_419));
  assign mux_578_nl = MUX_s_1_2_2(or_dcpl_168, nand_9_nl, fsm_output[2]);
  assign COMP_LOOP_twiddle_f_mux1h_55_rmff = COMP_LOOP_twiddle_f_mux1h_55_nl & (~((~
      mux_578_nl) & (~ (fsm_output[8])) & (fsm_output[1]) & (fsm_output[0])));
  assign COMP_LOOP_twiddle_f_mux1h_85_nl = MUX1HOT_s_1_11_2((reg_VEC_LOOP_acc_11_psp_2_reg[3]),
      (z_out_2_7_0[2]), (z_out[4]), (z_out_4_8_0[3]), (z_out_6[1]), (z_out_3[4]),
      (z_out_7[4]), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[4]), (z_out_6[4]), (z_out_5_8_0[0]),
      (z_out_5_8_0[3]), {and_dcpl_153 , COMP_LOOP_twiddle_f_or_20_cse , COMP_LOOP_twiddle_f_or_8_cse
      , COMP_LOOP_twiddle_f_or_14_cse , COMP_LOOP_twiddle_f_or_38_cse , COMP_LOOP_twiddle_f_or_31_cse
      , COMP_LOOP_twiddle_f_or_24_cse , and_dcpl_164 , COMP_LOOP_twiddle_f_or_39_cse
      , and_dcpl_192 , COMP_LOOP_twiddle_f_or_32_cse});
  assign mux_593_nl = MUX_s_1_2_2(mux_tmp_451, mux_452_cse, fsm_output[2]);
  assign mux_594_nl = MUX_s_1_2_2(mux_593_nl, mux_tmp_581, fsm_output[4]);
  assign mux_590_nl = MUX_s_1_2_2(or_tmp_291, mux_529_cse, fsm_output[2]);
  assign mux_591_nl = MUX_s_1_2_2(mux_tmp_586, mux_590_nl, fsm_output[4]);
  assign mux_595_nl = MUX_s_1_2_2(mux_594_nl, mux_591_nl, fsm_output[3]);
  assign mux_587_nl = MUX_s_1_2_2(or_384_cse, mux_tmp_454, fsm_output[2]);
  assign mux_588_nl = MUX_s_1_2_2(mux_587_nl, mux_tmp_586, fsm_output[4]);
  assign mux_582_nl = MUX_s_1_2_2(mux_tmp_451, or_tmp_291, fsm_output[2]);
  assign mux_583_nl = MUX_s_1_2_2(mux_582_nl, mux_tmp_581, fsm_output[4]);
  assign mux_589_nl = MUX_s_1_2_2(mux_588_nl, mux_583_nl, fsm_output[3]);
  assign mux_596_nl = MUX_s_1_2_2(mux_595_nl, mux_589_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_and_rmff = COMP_LOOP_twiddle_f_mux1h_85_nl & (~(mux_596_nl
      | (~ (fsm_output[0]))));
  assign COMP_LOOP_twiddle_f_mux1h_108_nl = MUX1HOT_s_1_8_2((reg_VEC_LOOP_acc_11_psp_2_reg[0]),
      (z_out[1]), (z_out_4_8_0[0]), (z_out_3[1]), (z_out_7[1]), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[1]),
      (z_out_6[1]), (z_out_5_8_0[0]), {and_dcpl_153 , COMP_LOOP_twiddle_f_or_8_cse
      , COMP_LOOP_twiddle_f_or_14_cse , COMP_LOOP_twiddle_f_or_31_cse , COMP_LOOP_twiddle_f_or_24_cse
      , and_dcpl_164 , COMP_LOOP_twiddle_f_or_39_cse , COMP_LOOP_twiddle_f_or_32_cse});
  assign mux_597_nl = MUX_s_1_2_2(mux_806_cse, mux_tmp_419, fsm_output[3]);
  assign mux_598_nl = MUX_s_1_2_2(or_dcpl_168, mux_597_nl, fsm_output[2]);
  assign or_465_nl = (fsm_output[7:2]!=6'b000001);
  assign mux_599_nl = MUX_s_1_2_2(mux_598_nl, or_465_nl, fsm_output[8]);
  assign COMP_LOOP_twiddle_f_mux1h_108_rmff = COMP_LOOP_twiddle_f_mux1h_108_nl &
      (~((~ mux_599_nl) & and_291_cse));
  assign and_199_nl = and_dcpl_28 & and_dcpl_32;
  assign COMP_LOOP_twiddle_f_mux1h_138_rmff = MUX1HOT_v_5_12_2(VEC_LOOP_j_10_10_0_sva_1_4_0,
      ({VEC_LOOP_acc_11_psp_sva_8 , reg_VEC_LOOP_acc_11_psp_1_reg , (reg_VEC_LOOP_acc_11_psp_2_reg[6:4])}),
      (z_out_2_7_0[7:3]), (z_out[9:5]), (z_out_4_8_0[8:4]), (z_out_6[6:2]), (z_out_3[9:5]),
      (z_out_7[9:5]), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[9:5]), (z_out_6[9:5]),
      (z_out_5_8_0[5:1]), (z_out_5_8_0[8:4]), {and_199_nl , and_dcpl_153 , COMP_LOOP_twiddle_f_or_20_cse
      , COMP_LOOP_twiddle_f_or_8_cse , COMP_LOOP_twiddle_f_or_14_cse , COMP_LOOP_twiddle_f_or_38_cse
      , COMP_LOOP_twiddle_f_or_31_cse , COMP_LOOP_twiddle_f_or_24_cse , and_dcpl_164
      , COMP_LOOP_twiddle_f_or_39_cse , and_dcpl_192 , COMP_LOOP_twiddle_f_or_32_cse});
  assign COMP_LOOP_twiddle_f_mux1h_153_nl = MUX1HOT_s_1_5_2((z_out[0]), (z_out_3[0]),
      (z_out_7[0]), (COMP_LOOP_twiddle_f_mul_cse_14_sva_1[0]), (z_out_6[0]), {COMP_LOOP_twiddle_f_or_8_cse
      , COMP_LOOP_twiddle_f_or_31_cse , COMP_LOOP_twiddle_f_or_24_cse , and_dcpl_164
      , COMP_LOOP_twiddle_f_or_39_cse});
  assign or_476_nl = (fsm_output[8:2]!=7'b0000011);
  assign mux_606_nl = MUX_s_1_2_2(or_tmp_295, mux_tmp_603, fsm_output[3]);
  assign or_475_nl = (fsm_output[3]) | (~ (fsm_output[6])) | (fsm_output[8]) | (~
      (fsm_output[5]));
  assign mux_607_nl = MUX_s_1_2_2(mux_606_nl, or_475_nl, fsm_output[7]);
  assign mux_608_nl = MUX_s_1_2_2(mux_tmp_602, mux_607_nl, fsm_output[4]);
  assign or_473_nl = (fsm_output[3]) | mux_tmp_603;
  assign mux_604_nl = MUX_s_1_2_2(or_473_nl, or_470_cse, fsm_output[7]);
  assign mux_605_nl = MUX_s_1_2_2(mux_604_nl, mux_tmp_602, fsm_output[4]);
  assign mux_609_nl = MUX_s_1_2_2(mux_608_nl, mux_605_nl, fsm_output[2]);
  assign mux_610_nl = MUX_s_1_2_2(or_476_nl, mux_609_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux1h_153_rmff = COMP_LOOP_twiddle_f_mux1h_153_nl &
      (~((~ mux_610_nl) & (fsm_output[0])));
  assign VEC_LOOP_mux_rmff = MUX_v_10_2_2(VEC_LOOP_acc_1_cse_10_sva, z_out, and_dcpl_153);
  assign and_207_rmff = ~(mux_515_itm | (fsm_output[0]));
  assign mux_627_nl = MUX_s_1_2_2(mux_tmp_623, mux_tmp_615, fsm_output[2]);
  assign mux_628_nl = MUX_s_1_2_2(mux_627_nl, mux_tmp_621, fsm_output[5]);
  assign mux_629_nl = MUX_s_1_2_2(mux_tmp_622, mux_628_nl, fsm_output[3]);
  assign mux_624_nl = MUX_s_1_2_2(mux_tmp_619, mux_tmp_623, fsm_output[2]);
  assign mux_625_nl = MUX_s_1_2_2(mux_tmp_616, mux_624_nl, fsm_output[5]);
  assign mux_626_nl = MUX_s_1_2_2(mux_625_nl, mux_tmp_622, fsm_output[3]);
  assign mux_630_itm = MUX_s_1_2_2(mux_629_nl, mux_626_nl, fsm_output[1]);
  assign mux_666_cse = MUX_s_1_2_2(mux_369_cse, mux_469_cse, fsm_output[2]);
  assign mux_663_cse = MUX_s_1_2_2(mux_473_cse, mux_369_cse, fsm_output[2]);
  assign mux_664_cse = MUX_s_1_2_2(mux_tmp_374, mux_663_cse, fsm_output[5]);
  assign and_300_cse = (fsm_output[2:1]==2'b11);
  assign and_291_cse = (fsm_output[1:0]==2'b11);
  assign and_285_cse = (fsm_output[3]) & (fsm_output[5]);
  assign or_739_cse = (fsm_output[3:2]!=2'b01);
  assign and_283_cse = (fsm_output[3:2]==2'b11);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt = MUX_v_8_2_2(({4'b0000
      , COMP_LOOP_1_twiddle_f_acc_cse_sva_1}), (z_out_9[7:0]), and_dcpl_227);
  assign or_787_cse = (fsm_output[5]) | (fsm_output[7]);
  assign or_788_cse = (fsm_output[3]) | (fsm_output[4]) | (fsm_output[6]);
  assign or_583_cse_1 = (fsm_output[7:6]!=2'b00);
  assign or_584_cse_1 = (fsm_output[8]) | (fsm_output[6]);
  assign nl_COMP_LOOP_1_twiddle_f_mul_nl = COMP_LOOP_1_twiddle_f_lshift_itm * COMP_LOOP_k_10_5_sva_4_0;
  assign COMP_LOOP_1_twiddle_f_mul_nl = nl_COMP_LOOP_1_twiddle_f_mul_nl[4:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl = MUX_v_5_2_2(COMP_LOOP_1_twiddle_f_mul_nl,
      VEC_LOOP_acc_psp_sva_mx0w0, and_dcpl_29);
  assign and_238_nl = (~ mux_716_itm) & (fsm_output[0]);
  assign VEC_LOOP_j_VEC_LOOP_j_mux_rgt = MUX_v_11_2_2(({6'b000000 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_11_nl}),
      z_out_10, and_238_nl);
  assign mux_1081_cse = MUX_s_1_2_2(or_tmp_158, or_tmp_161, fsm_output[4]);
  assign mux_1095_cse = MUX_s_1_2_2(mux_tmp_454, mux_452_cse, fsm_output[3]);
  assign nor_132_cse = ~((fsm_output[5]) | (fsm_output[7]));
  assign and_322_cse = (fsm_output[4:3]==2'b11);
  assign or_725_cse = (~ (fsm_output[8])) | (fsm_output[5]) | (fsm_output[7]);
  assign or_591_cse = (~ (fsm_output[4])) | (fsm_output[6]) | (fsm_output[7]);
  assign nor_95_cse = ~((fsm_output[1:0]!=2'b00));
  assign mux_1021_cse = MUX_s_1_2_2(or_725_cse, or_tmp_375, fsm_output[6]);
  assign mux_1023_cse = MUX_s_1_2_2(mux_1125_cse, mux_1021_cse, fsm_output[4]);
  assign mux_806_cse = MUX_s_1_2_2(or_591_cse, mux_tmp, fsm_output[5]);
  assign COMP_LOOP_twiddle_f_or_2_rgt = and_dcpl_43 | and_dcpl_61 | and_dcpl_74 |
      and_dcpl_84 | and_dcpl_93 | and_dcpl_103 | and_dcpl_112 | and_dcpl_121;
  assign or_728_cse = (~ (fsm_output[5])) | (fsm_output[7]);
  assign or_729_nl = (fsm_output[5]) | (~ (fsm_output[7]));
  assign mux_1024_cse = MUX_s_1_2_2(or_729_nl, or_728_cse, fsm_output[8]);
  assign or_730_nl = (fsm_output[6]) | mux_1024_cse;
  assign mux_1025_cse = MUX_s_1_2_2(or_730_nl, mux_1125_cse, fsm_output[4]);
  assign nor_79_nl = ~((fsm_output[3]) | and_291_cse | mux_1025_cse);
  assign and_281_nl = (fsm_output[3]) & (~(nor_95_cse | mux_1023_cse));
  assign mux_827_ssc = MUX_s_1_2_2(nor_79_nl, and_281_nl, fsm_output[2]);
  assign or_834_cse = (fsm_output[8]) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_1125_cse = MUX_s_1_2_2(or_tmp_375, or_834_cse, fsm_output[6]);
  assign mux_1145_cse = MUX_s_1_2_2(mux_469_cse, mux_1081_cse, fsm_output[3]);
  assign mux_1141_cse = MUX_s_1_2_2(mux_473_cse, mux_469_cse, fsm_output[3]);
  assign mux_1143_cse = MUX_s_1_2_2(or_395_cse, mux_473_cse, fsm_output[3]);
  assign mux_869_nl = MUX_s_1_2_2(mux_tmp_848, mux_tmp_858, fsm_output[2]);
  assign mux_868_nl = MUX_s_1_2_2(mux_tmp_830, mux_tmp_831, or_613_cse);
  assign mux_870_nl = MUX_s_1_2_2(mux_869_nl, mux_868_nl, fsm_output[3]);
  assign mux_871_nl = MUX_s_1_2_2(mux_870_nl, mux_tmp_831, fsm_output[5]);
  assign mux_867_nl = MUX_s_1_2_2(mux_tmp_853, mux_tmp_831, fsm_output[5]);
  assign mux_872_nl = MUX_s_1_2_2(mux_871_nl, mux_867_nl, fsm_output[1]);
  assign mux_861_nl = MUX_s_1_2_2(mux_tmp_82, nor_tmp_3, COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm);
  assign mux_862_nl = MUX_s_1_2_2(mux_861_nl, or_tmp_39, fsm_output[6]);
  assign mux_863_nl = MUX_s_1_2_2(mux_862_nl, mux_tmp_831, or_613_cse);
  assign mux_864_nl = MUX_s_1_2_2(mux_tmp_852, mux_863_nl, fsm_output[3]);
  assign mux_857_nl = MUX_s_1_2_2(mux_tmp_831, mux_tmp_856, fsm_output[4]);
  assign mux_859_nl = MUX_s_1_2_2(mux_tmp_858, mux_857_nl, fsm_output[2]);
  assign or_611_nl = (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[3]);
  assign mux_860_nl = MUX_s_1_2_2(mux_859_nl, mux_tmp_831, or_611_nl);
  assign mux_865_nl = MUX_s_1_2_2(mux_864_nl, mux_860_nl, fsm_output[5]);
  assign mux_846_nl = MUX_s_1_2_2(mux_tmp_82, (fsm_output[8]), or_610_cse);
  assign mux_849_nl = MUX_s_1_2_2(mux_tmp_848, mux_846_nl, fsm_output[2]);
  assign or_609_nl = (fsm_output[6]) | nor_tmp_3;
  assign mux_843_nl = MUX_s_1_2_2(or_609_nl, (fsm_output[8]), fsm_output[4]);
  assign mux_841_nl = MUX_s_1_2_2((fsm_output[7]), or_tmp_39, fsm_output[6]);
  assign mux_842_nl = MUX_s_1_2_2(mux_841_nl, mux_tmp_836, fsm_output[4]);
  assign mux_844_nl = MUX_s_1_2_2(mux_843_nl, mux_842_nl, fsm_output[2]);
  assign mux_850_nl = MUX_s_1_2_2(mux_849_nl, mux_844_nl, fsm_output[3]);
  assign mux_854_nl = MUX_s_1_2_2(mux_tmp_853, mux_850_nl, reg_VEC_LOOP_j_10_10_0_tmp[5]);
  assign mux_837_nl = MUX_s_1_2_2(mux_tmp_834, mux_tmp_836, fsm_output[4]);
  assign mux_835_nl = MUX_s_1_2_2(mux_tmp_830, mux_tmp_834, fsm_output[4]);
  assign mux_838_nl = MUX_s_1_2_2(mux_837_nl, mux_835_nl, fsm_output[2]);
  assign mux_832_nl = MUX_s_1_2_2(mux_tmp_831, mux_tmp_830, fsm_output[4]);
  assign mux_829_nl = MUX_s_1_2_2(nor_tmp_3, (fsm_output[8]), or_610_cse);
  assign mux_833_nl = MUX_s_1_2_2(mux_832_nl, mux_829_nl, fsm_output[2]);
  assign mux_839_nl = MUX_s_1_2_2(mux_838_nl, mux_833_nl, fsm_output[3]);
  assign mux_840_nl = MUX_s_1_2_2(mux_tmp_831, mux_839_nl, reg_VEC_LOOP_j_10_10_0_tmp[5]);
  assign mux_855_nl = MUX_s_1_2_2(mux_854_nl, mux_840_nl, fsm_output[5]);
  assign mux_866_nl = MUX_s_1_2_2(mux_865_nl, mux_855_nl, fsm_output[1]);
  assign mux_873_nl = MUX_s_1_2_2(mux_872_nl, mux_866_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_help_and_itm = complete_rsci_wen_comp & mux_873_nl;
  assign or_869_cse = (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_870_cse = (fsm_output[8]) | (fsm_output[3]);
  assign or_736_cse = (fsm_output[4:3]!=2'b00);
  assign or_685_cse = (fsm_output[4]) | (fsm_output[7]) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign nl_VEC_LOOP_acc_psp_sva_mx0w0 = (COMP_LOOP_twiddle_f_11_sva[9:5]) + COMP_LOOP_k_10_5_sva_4_0;
  assign VEC_LOOP_acc_psp_sva_mx0w0 = nl_VEC_LOOP_acc_psp_sva_mx0w0[4:0];
  assign or_470_cse = (~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[8]) | (fsm_output[5]);
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_1 = (~ STAGE_LOOP_i_3_0_sva) + 4'b1011;
  assign COMP_LOOP_1_twiddle_f_acc_cse_sva_1 = nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_1[3:0];
  assign nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_2_sva_mx0w1 = nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1[9:0];
  assign nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_3_sva_mx0w2 = nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2[9:0];
  assign nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_4_sva_mx0w3 = nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3[9:0];
  assign nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_5_sva_mx0w4 = nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4[9:0];
  assign nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_6_sva_mx0w5 = nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5[9:0];
  assign nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_7_sva_mx0w6 = nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6[9:0];
  assign nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_8_sva_mx0w7 = nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7[9:0];
  assign nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_10_sva_mx0w9 = nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9[9:0];
  assign nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_11_sva_mx0w10 = nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10[9:0];
  assign nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_12_sva_mx0w11 = nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11[9:0];
  assign nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_13_sva_mx0w12 = nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12[9:0];
  assign nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_14_sva_mx0w13 = nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13[9:0];
  assign nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_15_sva_mx0w14 = nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14[9:0];
  assign nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_16_sva_mx0w15 = nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15[9:0];
  assign nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_18_sva_mx0w17 = nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17[9:0];
  assign nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_19_sva_mx0w18 = nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18[9:0];
  assign nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_20_sva_mx0w19 = nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19[9:0];
  assign nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_21_sva_mx0w20 = nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20[9:0];
  assign nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_22_sva_mx0w21 = nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21[9:0];
  assign nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_23_sva_mx0w22 = nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22[9:0];
  assign nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_24_sva_mx0w23 = nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23[9:0];
  assign nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_26_sva_mx0w25 = nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25[9:0];
  assign nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_27_sva_mx0w26 = nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26[9:0];
  assign nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_28_sva_mx0w27 = nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27[9:0];
  assign nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_29_sva_mx0w28 = nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28[9:0];
  assign nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_30_sva_mx0w29 = nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29[9:0];
  assign nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_31_sva_mx0w30 = nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30[9:0];
  assign nl_VEC_LOOP_acc_10_cse_sva_mx0w31 = z_out_16 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_sva_mx0w31 = nl_VEC_LOOP_acc_10_cse_sva_mx0w31[9:0];
  assign nl_COMP_LOOP_twiddle_f_mul_cse_14_sva_1 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva
      * ({COMP_LOOP_k_10_5_sva_4_0 , 5'b01101});
  assign COMP_LOOP_twiddle_f_mul_cse_14_sva_1 = nl_COMP_LOOP_twiddle_f_mul_cse_14_sva_1[9:0];
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01011;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign or_tmp_1 = (fsm_output[7:4]!=4'b0000);
  assign or_tmp_2 = (fsm_output[7:6]!=2'b10);
  assign or_3_cse = (fsm_output[7:6]!=2'b01);
  assign mux_tmp = MUX_s_1_2_2(or_3_cse, or_tmp_2, fsm_output[4]);
  assign or_tmp_38 = (fsm_output[8:7]!=2'b00);
  assign or_tmp_39 = (fsm_output[8:7]!=2'b01);
  assign nor_tmp_3 = (fsm_output[8:7]==2'b11);
  assign mux_tmp_82 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[8]);
  assign nor_tmp_11 = (fsm_output[7:6]==2'b11);
  assign not_tmp_69 = ~((fsm_output[7:6]!=2'b00));
  assign or_750_cse = (((fsm_output[5:2]!=4'b0000)) & (fsm_output[6])) | (fsm_output[7]);
  assign nor_tmp_29 = or_750_cse & (fsm_output[8]);
  assign or_748_cse = (((fsm_output[5:3]!=3'b000)) & (fsm_output[6])) | (fsm_output[7]);
  assign or_dcpl_168 = or_583_cse_1 | (fsm_output[5:3]!=3'b000);
  assign or_tmp_145 = (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_tmp_336 = MUX_s_1_2_2(or_tmp_39, or_tmp_38, fsm_output[0]);
  assign mux_tmp_338 = MUX_s_1_2_2(or_tmp_38, or_tmp_39, fsm_output[0]);
  assign or_tmp_148 = (~ (fsm_output[0])) | (fsm_output[8]) | (fsm_output[7]);
  assign mux_tmp_339 = MUX_s_1_2_2(or_tmp_148, mux_tmp_338, fsm_output[5]);
  assign mux_337_nl = MUX_s_1_2_2(mux_tmp_336, or_tmp_145, fsm_output[5]);
  assign mux_tmp_340 = MUX_s_1_2_2(mux_tmp_339, mux_337_nl, fsm_output[6]);
  assign or_tmp_149 = (~ (fsm_output[0])) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_342_nl = MUX_s_1_2_2(or_tmp_149, or_tmp_148, fsm_output[5]);
  assign mux_341_nl = MUX_s_1_2_2(mux_tmp_338, mux_tmp_336, fsm_output[5]);
  assign mux_tmp_343 = MUX_s_1_2_2(mux_342_nl, mux_341_nl, fsm_output[6]);
  assign mux_tmp_344 = MUX_s_1_2_2(mux_tmp_343, mux_tmp_340, fsm_output[1]);
  assign or_321_cse = (fsm_output[8:7]!=2'b10);
  assign mux_tmp_345 = MUX_s_1_2_2(or_321_cse, or_tmp_39, fsm_output[0]);
  assign mux_tmp_346 = MUX_s_1_2_2(or_tmp_39, (fsm_output[7]), fsm_output[0]);
  assign mux_347_nl = MUX_s_1_2_2(mux_tmp_346, mux_tmp_345, fsm_output[5]);
  assign or_320_nl = (~ (fsm_output[5])) | (~ (fsm_output[0])) | (fsm_output[8])
      | (fsm_output[7]);
  assign mux_tmp_348 = MUX_s_1_2_2(mux_347_nl, or_320_nl, fsm_output[6]);
  assign mux_349_nl = MUX_s_1_2_2(mux_tmp_338, mux_tmp_346, fsm_output[5]);
  assign or_323_nl = (fsm_output[5]) | (~ (fsm_output[0])) | (fsm_output[8]) | (~
      (fsm_output[7]));
  assign mux_tmp_350 = MUX_s_1_2_2(mux_349_nl, or_323_nl, fsm_output[6]);
  assign mux_354_nl = MUX_s_1_2_2(mux_tmp_345, or_tmp_149, fsm_output[5]);
  assign mux_tmp_355 = MUX_s_1_2_2(mux_354_nl, mux_tmp_339, fsm_output[6]);
  assign mux_tmp_356 = MUX_s_1_2_2(mux_tmp_348, mux_tmp_355, fsm_output[1]);
  assign or_tmp_156 = (fsm_output[8:6]!=3'b011);
  assign or_tmp_157 = (fsm_output[8:6]!=3'b010);
  assign or_tmp_158 = (fsm_output[8:6]!=3'b100);
  assign mux_369_cse = MUX_s_1_2_2(or_tmp_157, or_tmp_156, fsm_output[4]);
  assign or_tmp_160 = (fsm_output[8:6]!=3'b001);
  assign or_tmp_161 = (fsm_output[8:6]!=3'b000);
  assign mux_tmp_374 = MUX_s_1_2_2(mux_469_cse, mux_472_cse, fsm_output[2]);
  assign and_dcpl_22 = (fsm_output[1:0]==2'b01);
  assign and_dcpl_23 = (fsm_output[2]) & (~ (fsm_output[8]));
  assign and_dcpl_24 = and_dcpl_23 & and_dcpl_22;
  assign and_dcpl_25 = ~((fsm_output[5]) | (fsm_output[3]));
  assign and_dcpl_27 = not_tmp_69 & (~ (fsm_output[4]));
  assign and_dcpl_28 = and_dcpl_27 & and_dcpl_25;
  assign and_dcpl_29 = and_dcpl_28 & and_dcpl_24;
  assign and_dcpl_31 = ~((fsm_output[2]) | (fsm_output[8]));
  assign and_dcpl_32 = and_dcpl_31 & and_291_cse;
  assign and_dcpl_33 = (~ (fsm_output[5])) & (fsm_output[3]);
  assign and_dcpl_34 = and_dcpl_27 & and_dcpl_33;
  assign mux_394_nl = MUX_s_1_2_2(mux_475_cse, mux_1081_cse, fsm_output[2]);
  assign mux_395_nl = MUX_s_1_2_2(mux_394_nl, mux_666_cse, fsm_output[5]);
  assign mux_396_nl = MUX_s_1_2_2(mux_395_nl, mux_378_cse, fsm_output[3]);
  assign mux_400_nl = MUX_s_1_2_2(mux_379_cse, mux_396_nl, fsm_output[1]);
  assign and_dcpl_36 = ~(mux_400_nl | (fsm_output[0]));
  assign and_dcpl_37 = and_dcpl_23 & and_291_cse;
  assign and_dcpl_38 = and_dcpl_34 & and_dcpl_37;
  assign mux_tmp_401 = MUX_s_1_2_2(or_tmp_39, or_tmp_38, fsm_output[3]);
  assign or_tmp_172 = (fsm_output[6]) | mux_tmp_401;
  assign or_tmp_175 = (fsm_output[3]) | (fsm_output[8]) | (fsm_output[7]);
  assign or_346_nl = (~ (fsm_output[3])) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_tmp_404 = MUX_s_1_2_2(or_346_nl, or_tmp_175, fsm_output[6]);
  assign mux_tmp_405 = MUX_s_1_2_2(or_321_cse, or_tmp_39, fsm_output[3]);
  assign mux_409_nl = MUX_s_1_2_2(nand_6_cse, or_tmp_172, fsm_output[5]);
  assign mux_408_nl = MUX_s_1_2_2(mux_tmp_404, nand_5_cse, fsm_output[5]);
  assign mux_410_nl = MUX_s_1_2_2(mux_409_nl, mux_408_nl, fsm_output[4]);
  assign mux_406_nl = MUX_s_1_2_2(or_377_cse, mux_tmp_404, fsm_output[5]);
  assign mux_403_nl = MUX_s_1_2_2(mux_437_cse, or_tmp_172, fsm_output[5]);
  assign mux_407_nl = MUX_s_1_2_2(mux_406_nl, mux_403_nl, fsm_output[4]);
  assign mux_411_nl = MUX_s_1_2_2(mux_410_nl, mux_407_nl, fsm_output[2]);
  assign and_dcpl_39 = (~ mux_411_nl) & and_dcpl_22;
  assign and_dcpl_40 = and_dcpl_31 & and_dcpl_22;
  assign and_dcpl_41 = not_tmp_69 & (fsm_output[4]);
  assign and_dcpl_42 = and_dcpl_41 & and_dcpl_33;
  assign and_dcpl_43 = and_dcpl_42 & and_dcpl_40;
  assign or_tmp_184 = (fsm_output[4]) | (~ nor_tmp_11);
  assign mux_415_nl = MUX_s_1_2_2(mux_tmp, or_tmp_184, fsm_output[5]);
  assign mux_416_nl = MUX_s_1_2_2(mux_415_nl, mux_806_cse, fsm_output[3]);
  assign or_5_nl = (fsm_output[7:4]!=4'b0011);
  assign mux_412_nl = MUX_s_1_2_2(or_5_nl, or_tmp_1, fsm_output[3]);
  assign mux_417_nl = MUX_s_1_2_2(mux_416_nl, mux_412_nl, fsm_output[8]);
  assign and_dcpl_46 = (~ mux_417_nl) & (fsm_output[2:0]==3'b111);
  assign and_dcpl_47 = (fsm_output[5]) & (~ (fsm_output[3]));
  assign and_dcpl_48 = and_dcpl_27 & and_dcpl_47;
  assign and_dcpl_49 = and_dcpl_48 & and_dcpl_32;
  assign and_dcpl_51 = and_dcpl_27 & and_285_cse;
  assign and_dcpl_52 = and_dcpl_51 & and_dcpl_24;
  assign and_dcpl_53 = ~((fsm_output[3:2]!=2'b00));
  assign mux_tmp_418 = MUX_s_1_2_2((~ or_tmp_2), nor_tmp_11, fsm_output[4]);
  assign mux_tmp_419 = MUX_s_1_2_2((~ mux_tmp_418), or_591_cse, fsm_output[5]);
  assign or_355_nl = (fsm_output[7:4]!=4'b0010);
  assign mux_420_nl = MUX_s_1_2_2(mux_tmp_419, or_355_nl, fsm_output[8]);
  assign and_dcpl_55 = (~ mux_420_nl) & and_dcpl_53 & and_291_cse;
  assign and_dcpl_56 = and_dcpl_41 & and_dcpl_47;
  assign and_dcpl_57 = and_dcpl_56 & and_dcpl_37;
  assign and_dcpl_58 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_59 = and_dcpl_58 & (~ (fsm_output[4]));
  assign and_dcpl_60 = and_dcpl_59 & and_dcpl_25;
  assign and_dcpl_61 = and_dcpl_60 & and_dcpl_40;
  assign and_dcpl_62 = and_dcpl_59 & and_dcpl_33;
  assign and_dcpl_63 = and_dcpl_62 & and_dcpl_32;
  assign and_dcpl_64 = and_dcpl_58 & (fsm_output[4]);
  assign and_dcpl_65 = and_dcpl_64 & and_dcpl_25;
  assign and_dcpl_66 = and_dcpl_65 & and_dcpl_24;
  assign and_dcpl_70 = xor_dcpl & (fsm_output[6]) & (fsm_output[4]) & (fsm_output[3])
      & and_dcpl_32;
  assign and_dcpl_71 = and_dcpl_64 & and_dcpl_33;
  assign and_dcpl_72 = and_dcpl_71 & and_dcpl_37;
  assign and_dcpl_74 = and_dcpl_59 & and_285_cse & and_dcpl_40;
  assign and_dcpl_75 = and_dcpl_64 & and_dcpl_47;
  assign and_dcpl_76 = and_dcpl_75 & and_dcpl_32;
  assign and_dcpl_77 = and_dcpl_64 & and_285_cse;
  assign and_dcpl_78 = and_dcpl_77 & and_dcpl_24;
  assign and_dcpl_79 = ~(or_tmp_2 | (fsm_output[4]));
  assign and_dcpl_80 = and_dcpl_79 & and_dcpl_25;
  assign and_dcpl_81 = and_dcpl_80 & and_dcpl_37;
  assign and_dcpl_82 = (~ or_tmp_2) & (fsm_output[4]);
  assign and_dcpl_84 = and_dcpl_82 & and_dcpl_25 & and_dcpl_40;
  assign and_dcpl_85 = and_dcpl_82 & and_dcpl_33;
  assign and_dcpl_86 = and_dcpl_85 & and_dcpl_32;
  assign and_dcpl_87 = and_dcpl_79 & and_dcpl_47;
  assign and_dcpl_88 = and_dcpl_87 & and_dcpl_24;
  assign and_dcpl_89 = and_dcpl_79 & and_285_cse;
  assign and_dcpl_90 = and_dcpl_89 & and_dcpl_32;
  assign and_dcpl_91 = and_dcpl_89 & and_dcpl_37;
  assign and_dcpl_93 = and_dcpl_82 & and_285_cse & and_dcpl_40;
  assign and_dcpl_94 = nor_tmp_11 & (~ (fsm_output[4]));
  assign and_dcpl_95 = and_dcpl_94 & and_dcpl_25;
  assign and_dcpl_96 = and_dcpl_95 & and_dcpl_32;
  assign and_dcpl_97 = and_dcpl_94 & and_dcpl_33;
  assign and_dcpl_98 = and_dcpl_97 & and_dcpl_24;
  assign and_dcpl_99 = nor_tmp_11 & (fsm_output[4]);
  assign and_dcpl_100 = and_dcpl_99 & and_dcpl_25;
  assign and_dcpl_101 = and_dcpl_100 & and_dcpl_37;
  assign and_dcpl_103 = and_dcpl_94 & and_dcpl_47 & and_dcpl_40;
  assign and_dcpl_104 = and_dcpl_94 & and_285_cse;
  assign and_dcpl_105 = and_dcpl_104 & and_dcpl_32;
  assign and_dcpl_106 = and_dcpl_99 & and_dcpl_47;
  assign and_dcpl_107 = and_dcpl_106 & and_dcpl_24;
  assign and_dcpl_108 = and_dcpl_99 & and_285_cse;
  assign and_dcpl_109 = and_dcpl_108 & and_dcpl_37;
  assign and_dcpl_110 = (~ (fsm_output[2])) & (fsm_output[8]);
  assign and_dcpl_111 = and_dcpl_110 & and_dcpl_22;
  assign and_dcpl_112 = and_dcpl_34 & and_dcpl_111;
  assign and_dcpl_113 = and_dcpl_110 & and_291_cse;
  assign and_dcpl_114 = and_dcpl_41 & and_dcpl_25;
  assign and_dcpl_115 = and_dcpl_114 & and_dcpl_113;
  assign and_dcpl_116 = (fsm_output[2]) & (fsm_output[8]);
  assign and_dcpl_117 = and_dcpl_116 & and_dcpl_22;
  assign and_dcpl_118 = and_dcpl_42 & and_dcpl_117;
  assign and_dcpl_119 = and_dcpl_116 & and_291_cse;
  assign and_dcpl_120 = and_dcpl_48 & and_dcpl_119;
  assign and_dcpl_121 = and_dcpl_56 & and_dcpl_111;
  assign and_dcpl_122 = and_dcpl_41 & and_285_cse;
  assign and_dcpl_123 = and_dcpl_122 & and_dcpl_113;
  assign and_dcpl_124 = (~ (fsm_output[8])) & (fsm_output[0]);
  assign or_tmp_186 = (fsm_output[3:2]!=2'b10);
  assign mux_421_nl = MUX_s_1_2_2(or_739_cse, or_tmp_186, fsm_output[1]);
  assign and_dcpl_128 = (~ mux_421_nl) & not_tmp_69 & (fsm_output[5:4]==2'b00) &
      and_dcpl_124;
  assign mux_422_cse = MUX_s_1_2_2(or_tmp_156, or_tmp_160, fsm_output[3]);
  assign mux_423_cse = MUX_s_1_2_2(or_tmp_160, or_tmp_158, fsm_output[3]);
  assign mux_tmp_424 = MUX_s_1_2_2(mux_423_cse, mux_422_cse, fsm_output[5]);
  assign mux_tmp_425 = MUX_s_1_2_2(or_tmp_157, or_tmp_161, fsm_output[3]);
  assign mux_tmp_446 = MUX_s_1_2_2(and_dcpl_64, mux_tmp_418, fsm_output[5]);
  assign mux_tmp_451 = MUX_s_1_2_2(or_tmp_156, or_tmp_161, fsm_output[5]);
  assign mux_tmp_454 = MUX_s_1_2_2(or_tmp_158, or_tmp_160, fsm_output[5]);
  assign mux_tmp_467 = MUX_s_1_2_2(mux_369_cse, mux_1081_cse, fsm_output[5]);
  assign mux_tmp_504 = MUX_s_1_2_2(mux_1081_cse, mux_369_cse, fsm_output[3]);
  assign mux_508_nl = MUX_s_1_2_2(mux_369_cse, mux_472_cse, fsm_output[3]);
  assign mux_tmp_509 = MUX_s_1_2_2(mux_508_nl, mux_1145_cse, fsm_output[2]);
  assign mux_512_nl = MUX_s_1_2_2(mux_475_cse, mux_473_cse, fsm_output[3]);
  assign mux_513_nl = MUX_s_1_2_2(mux_512_nl, mux_tmp_504, fsm_output[2]);
  assign mux_514_nl = MUX_s_1_2_2(mux_513_nl, mux_tmp_509, fsm_output[5]);
  assign mux_505_nl = MUX_s_1_2_2(mux_tmp_504, mux_1141_cse, fsm_output[2]);
  assign mux_510_nl = MUX_s_1_2_2(mux_tmp_509, mux_505_nl, fsm_output[5]);
  assign mux_515_itm = MUX_s_1_2_2(mux_514_nl, mux_510_nl, fsm_output[1]);
  assign or_420_nl = (~ (fsm_output[2])) | (fsm_output[3]) | (~ (fsm_output[4]))
      | (fsm_output[6]);
  assign or_419_nl = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]) | (~ (fsm_output[6]));
  assign mux_tmp_516 = MUX_s_1_2_2(or_420_nl, or_419_nl, fsm_output[8]);
  assign mux_tmp_517 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[4]);
  assign nand_46_nl = ~((fsm_output[8:5]==4'b0111));
  assign mux_tmp_526 = MUX_s_1_2_2(or_384_cse, nand_46_nl, fsm_output[4]);
  assign and_dcpl_144 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_145 = and_dcpl_31 & and_dcpl_144;
  assign mux_tmp_536 = MUX_s_1_2_2(nand_5_cse, or_377_cse, fsm_output[4]);
  assign mux_tmp_543 = MUX_s_1_2_2(mux_435_cse, mux_439_cse, fsm_output[5]);
  assign mux_547_nl = MUX_s_1_2_2(mux_440_cse, mux_435_cse, fsm_output[5]);
  assign mux_545_nl = MUX_s_1_2_2(mux_439_cse, mux_434_cse, fsm_output[5]);
  assign mux_tmp_548 = MUX_s_1_2_2(mux_547_nl, mux_545_nl, fsm_output[2]);
  assign or_tmp_271 = (fsm_output[6:5]!=2'b10) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign or_tmp_272 = (fsm_output[6:5]!=2'b01) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign mux_tmp_555 = MUX_s_1_2_2(or_tmp_272, or_tmp_271, fsm_output[7]);
  assign or_tmp_273 = (fsm_output[7:5]!=3'b100) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign or_tmp_274 = (fsm_output[6:5]!=2'b00) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign not_tmp_207 = ~((reg_VEC_LOOP_j_10_10_0_tmp[5]) & (fsm_output[8]));
  assign or_446_nl = (fsm_output[6]) | not_tmp_207;
  assign or_445_nl = (~ (fsm_output[6])) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) |
      (fsm_output[8]);
  assign mux_558_nl = MUX_s_1_2_2(or_446_nl, or_445_nl, fsm_output[5]);
  assign or_tmp_277 = (fsm_output[7]) | mux_558_nl;
  assign mux_tmp_561 = MUX_s_1_2_2(mux_tmp_555, or_tmp_277, fsm_output[4]);
  assign nand_35_nl = ~((fsm_output[6:5]==2'b11) & (reg_VEC_LOOP_j_10_10_0_tmp[5])
      & (~ (fsm_output[8])));
  assign mux_tmp_562 = MUX_s_1_2_2(or_tmp_271, nand_35_nl, fsm_output[7]);
  assign or_449_cse = (fsm_output[5]) | (fsm_output[6]) | (fsm_output[8]);
  assign and_dcpl_148 = ~((fsm_output[6]) | (fsm_output[4]));
  assign and_dcpl_153 = and_dcpl_34 & and_dcpl_24;
  assign and_dcpl_154 = and_dcpl_114 & and_dcpl_37;
  assign and_dcpl_159 = and_dcpl_62 & and_dcpl_40;
  assign and_dcpl_164 = and_dcpl_75 & and_dcpl_40;
  assign and_dcpl_167 = ~((fsm_output[5]) | (fsm_output[8]));
  assign mux_tmp_581 = MUX_s_1_2_2(mux_tmp_454, mux_tmp_451, fsm_output[2]);
  assign or_tmp_291 = (fsm_output[8:5]!=4'b0100);
  assign mux_tmp_586 = MUX_s_1_2_2(mux_529_cse, mux_457_cse, fsm_output[2]);
  assign and_dcpl_192 = and_dcpl_79 & and_dcpl_33 & and_dcpl_37;
  assign or_tmp_295 = (~ (fsm_output[6])) | (fsm_output[8]) | (fsm_output[5]);
  assign or_tmp_297 = (fsm_output[6]) | (fsm_output[8]) | (~ (fsm_output[5]));
  assign mux_600_cse = MUX_s_1_2_2(or_tmp_297, or_tmp_295, fsm_output[3]);
  assign mux_601_cse = MUX_s_1_2_2(or_449_cse, or_tmp_297, fsm_output[3]);
  assign mux_tmp_602 = MUX_s_1_2_2(mux_601_cse, mux_600_cse, fsm_output[7]);
  assign or_472_nl = (~ (fsm_output[8])) | (fsm_output[5]);
  assign or_471_nl = (fsm_output[8]) | (~ (fsm_output[5]));
  assign mux_tmp_603 = MUX_s_1_2_2(or_472_nl, or_471_nl, fsm_output[6]);
  assign and_dcpl_201 = and_dcpl_60 & and_dcpl_116 & and_dcpl_144;
  assign not_tmp_218 = ~((fsm_output[0]) & (fsm_output[6]));
  assign mux_611_nl = MUX_s_1_2_2(not_tmp_218, (fsm_output[6]), fsm_output[8]);
  assign or_tmp_306 = (fsm_output[7]) | mux_611_nl;
  assign or_tmp_307 = (fsm_output[8]) | (~ (fsm_output[6]));
  assign or_tmp_308 = (fsm_output[8]) | (~ (fsm_output[0])) | (fsm_output[6]);
  assign mux_tmp_612 = MUX_s_1_2_2(or_tmp_308, or_tmp_307, fsm_output[7]);
  assign mux_tmp_614 = MUX_s_1_2_2(or_584_cse_1, or_tmp_308, fsm_output[7]);
  assign mux_tmp_615 = MUX_s_1_2_2(or_tmp_306, mux_tmp_614, fsm_output[4]);
  assign mux_613_nl = MUX_s_1_2_2(mux_tmp_612, or_tmp_306, fsm_output[4]);
  assign mux_tmp_616 = MUX_s_1_2_2(mux_tmp_615, mux_613_nl, fsm_output[2]);
  assign or_481_nl = (~ (fsm_output[8])) | (~ (fsm_output[0])) | (fsm_output[6]);
  assign mux_tmp_617 = MUX_s_1_2_2(or_481_nl, or_584_cse_1, fsm_output[7]);
  assign or_482_nl = (fsm_output[8]) | not_tmp_218;
  assign mux_tmp_618 = MUX_s_1_2_2(or_tmp_307, or_482_nl, fsm_output[7]);
  assign mux_tmp_619 = MUX_s_1_2_2(mux_tmp_618, mux_tmp_617, fsm_output[4]);
  assign mux_620_nl = MUX_s_1_2_2(mux_tmp_617, mux_tmp_612, fsm_output[4]);
  assign mux_tmp_621 = MUX_s_1_2_2(mux_620_nl, mux_tmp_619, fsm_output[2]);
  assign mux_tmp_622 = MUX_s_1_2_2(mux_tmp_621, mux_tmp_616, fsm_output[5]);
  assign mux_tmp_623 = MUX_s_1_2_2(mux_tmp_614, mux_tmp_618, fsm_output[4]);
  assign or_496_nl = (~ (fsm_output[8])) | (fsm_output[6]);
  assign mux_639_nl = MUX_s_1_2_2(or_496_nl, or_tmp_307, fsm_output[5]);
  assign or_494_nl = (~ (fsm_output[5])) | (~ (fsm_output[8])) | (fsm_output[6]);
  assign mux_tmp_640 = MUX_s_1_2_2(mux_639_nl, or_494_nl, fsm_output[3]);
  assign or_498_nl = (fsm_output[2]) | mux_tmp_640;
  assign or_497_nl = (fsm_output[3]) | (fsm_output[5]) | (fsm_output[8]) | (fsm_output[6]);
  assign mux_641_nl = MUX_s_1_2_2(or_497_nl, mux_tmp_640, fsm_output[2]);
  assign mux_642_nl = MUX_s_1_2_2(or_498_nl, mux_641_nl, fsm_output[4]);
  assign or_493_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_636_nl = MUX_s_1_2_2(or_tmp_295, or_493_nl, fsm_output[3]);
  assign mux_637_nl = MUX_s_1_2_2(or_470_cse, mux_636_nl, fsm_output[2]);
  assign mux_635_nl = MUX_s_1_2_2(mux_600_cse, or_470_cse, fsm_output[2]);
  assign mux_638_nl = MUX_s_1_2_2(mux_637_nl, mux_635_nl, fsm_output[4]);
  assign mux_643_nl = MUX_s_1_2_2(mux_642_nl, mux_638_nl, fsm_output[7]);
  assign or_487_nl = (fsm_output[3]) | (fsm_output[5]) | (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_632_nl = MUX_s_1_2_2(or_487_nl, mux_601_cse, fsm_output[2]);
  assign or_483_nl = (fsm_output[2]) | (~ (fsm_output[3])) | (fsm_output[5]) | (fsm_output[8])
      | (fsm_output[6]);
  assign mux_633_nl = MUX_s_1_2_2(mux_632_nl, or_483_nl, fsm_output[4]);
  assign or_488_nl = (fsm_output[7]) | mux_633_nl;
  assign mux_644_nl = MUX_s_1_2_2(mux_643_nl, or_488_nl, fsm_output[1]);
  assign and_dcpl_203 = (~ mux_644_nl) & (fsm_output[0]);
  assign or_tmp_330 = (~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[8]))
      | (fsm_output[6]);
  assign nand_48_nl = ~((fsm_output[5]) & (fsm_output[1]) & (fsm_output[7]) & (~
      (fsm_output[8])) & (fsm_output[6]));
  assign or_500_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (fsm_output[8]) | (~
      (fsm_output[6]));
  assign mux_645_nl = MUX_s_1_2_2(or_tmp_330, or_500_nl, fsm_output[5]);
  assign mux_tmp_646 = MUX_s_1_2_2(nand_48_nl, mux_645_nl, fsm_output[3]);
  assign nor_98_cse = ~((fsm_output[8:6]!=3'b000));
  assign nor_99_nl = ~((fsm_output[8:6]!=3'b010));
  assign mux_648_nl = MUX_s_1_2_2(nor_98_cse, nor_99_nl, fsm_output[1]);
  assign nand_tmp_10 = ~((fsm_output[5]) & mux_648_nl);
  assign or_511_nl = (~ (fsm_output[1])) | (~ (fsm_output[7])) | (fsm_output[8])
      | (fsm_output[6]);
  assign mux_651_nl = MUX_s_1_2_2(or_511_nl, or_tmp_330, fsm_output[5]);
  assign mux_652_nl = MUX_s_1_2_2(mux_651_nl, nand_tmp_10, fsm_output[3]);
  assign mux_653_nl = MUX_s_1_2_2(mux_tmp_646, mux_652_nl, fsm_output[4]);
  assign mux_647_nl = MUX_s_1_2_2(or_tmp_160, or_tmp_156, fsm_output[1]);
  assign or_508_nl = (fsm_output[5]) | mux_647_nl;
  assign mux_649_nl = MUX_s_1_2_2(nand_tmp_10, or_508_nl, fsm_output[3]);
  assign mux_650_nl = MUX_s_1_2_2(mux_649_nl, mux_tmp_646, fsm_output[4]);
  assign mux_654_nl = MUX_s_1_2_2(mux_653_nl, mux_650_nl, fsm_output[2]);
  assign and_dcpl_204 = (~ mux_654_nl) & (fsm_output[0]);
  assign and_dcpl_205 = and_dcpl_65 & and_dcpl_37;
  assign not_tmp_230 = ~((fsm_output[7:2]!=6'b000000));
  assign mux_672_nl = MUX_s_1_2_2(not_tmp_230, or_748_cse, fsm_output[8]);
  assign mux_tmp_673 = MUX_s_1_2_2(mux_672_nl, nor_tmp_29, fsm_output[1]);
  assign mux_675_nl = MUX_s_1_2_2(not_tmp_230, or_750_cse, fsm_output[8]);
  assign mux_676_nl = MUX_s_1_2_2(mux_675_nl, nor_tmp_29, fsm_output[1]);
  assign mux_tmp_677 = MUX_s_1_2_2(mux_tmp_673, mux_676_nl, fsm_output[0]);
  assign or_tmp_355 = (fsm_output[7:5]!=3'b000);
  assign and_293_cse = (fsm_output[5:4]==2'b11);
  assign or_tmp_356 = and_293_cse | (fsm_output[7:6]!=2'b00);
  assign or_762_nl = (fsm_output[3:2]!=2'b00);
  assign mux_tmp_678 = MUX_s_1_2_2(or_tmp_356, or_tmp_355, or_762_nl);
  assign mux_679_nl = MUX_s_1_2_2(or_tmp_356, or_tmp_355, fsm_output[3]);
  assign mux_tmp_680 = MUX_s_1_2_2(not_tmp_230, mux_679_nl, fsm_output[8]);
  assign mux_tmp_686 = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[2]);
  assign and_dcpl_216 = and_dcpl_28 & and_dcpl_145;
  assign or_538_cse = (fsm_output[6:4]!=3'b000);
  assign mux_694_nl = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), or_538_cse);
  assign and_288_nl = ((fsm_output[4]) | (fsm_output[6])) & (fsm_output[7]);
  assign mux_tmp_695 = MUX_s_1_2_2(mux_694_nl, and_288_nl, fsm_output[3]);
  assign and_289_nl = or_538_cse & (fsm_output[7]);
  assign mux_tmp_696 = MUX_s_1_2_2(mux_tmp_695, and_289_nl, fsm_output[2]);
  assign mux_701_nl = MUX_s_1_2_2(or_tmp_161, or_tmp_156, fsm_output[3]);
  assign mux_703_nl = MUX_s_1_2_2(mux_422_cse, mux_701_nl, fsm_output[5]);
  assign mux_tmp_706 = MUX_s_1_2_2(mux_tmp_424, mux_703_nl, fsm_output[1]);
  assign mux_713_nl = MUX_s_1_2_2(mux_428_cse, mux_423_cse, fsm_output[5]);
  assign mux_714_nl = MUX_s_1_2_2(mux_429_cse, mux_713_nl, fsm_output[1]);
  assign mux_715_nl = MUX_s_1_2_2(mux_tmp_706, mux_714_nl, fsm_output[4]);
  assign mux_711_nl = MUX_s_1_2_2(mux_426_cse, mux_429_cse, fsm_output[1]);
  assign mux_712_nl = MUX_s_1_2_2(mux_711_nl, mux_tmp_706, fsm_output[4]);
  assign mux_716_itm = MUX_s_1_2_2(mux_715_nl, mux_712_nl, fsm_output[2]);
  assign or_tmp_375 = (~ (fsm_output[5])) | (fsm_output[8]) | (fsm_output[7]);
  assign mux_718_nl = MUX_s_1_2_2(or_tmp_39, or_321_cse, fsm_output[5]);
  assign or_tmp_378 = (fsm_output[6]) | mux_718_nl;
  assign mux_719_nl = MUX_s_1_2_2(or_tmp_378, mux_1125_cse, fsm_output[4]);
  assign mux_tmp_722 = MUX_s_1_2_2(mux_1023_cse, mux_719_nl, fsm_output[2]);
  assign mux_tmp_723 = MUX_s_1_2_2(or_tmp_38, or_tmp_39, fsm_output[5]);
  assign nand_tmp_11 = ~((fsm_output[6]) & (~ mux_tmp_723));
  assign and_dcpl_227 = and_dcpl_34 & and_dcpl_23 & (~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm)
      & and_dcpl_22;
  assign and_dcpl_231 = (fsm_output[6]) & (fsm_output[4]);
  assign mux_tmp_830 = MUX_s_1_2_2(nor_tmp_3, or_tmp_39, fsm_output[6]);
  assign mux_tmp_831 = MUX_s_1_2_2(nor_tmp_3, (fsm_output[8]), fsm_output[6]);
  assign mux_tmp_834 = MUX_s_1_2_2((fsm_output[7]), (fsm_output[8]), fsm_output[6]);
  assign mux_tmp_836 = MUX_s_1_2_2(nor_tmp_3, or_tmp_38, fsm_output[6]);
  assign mux_847_nl = MUX_s_1_2_2(mux_tmp_82, nor_tmp_3, fsm_output[6]);
  assign mux_tmp_848 = MUX_s_1_2_2(mux_847_nl, mux_tmp_830, fsm_output[4]);
  assign mux_tmp_852 = MUX_s_1_2_2(mux_tmp_848, mux_tmp_831, fsm_output[2]);
  assign mux_851_nl = MUX_s_1_2_2(mux_tmp_830, mux_tmp_831, fsm_output[4]);
  assign mux_tmp_853 = MUX_s_1_2_2(mux_tmp_852, mux_851_nl, fsm_output[3]);
  assign mux_tmp_856 = MUX_s_1_2_2(mux_tmp_82, (fsm_output[8]), fsm_output[6]);
  assign mux_tmp_858 = MUX_s_1_2_2(mux_tmp_856, mux_tmp_831, fsm_output[4]);
  assign or_613_cse = (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_610_cse = (~ (fsm_output[4])) | (fsm_output[6]);
  assign nor_90_nl = ~((fsm_output[8:1]!=8'b00000010));
  assign or_627_nl = (fsm_output[2]) | (fsm_output[3]) | (~ (fsm_output[4])) | (fsm_output[7])
      | (fsm_output[8]) | (~ (fsm_output[6]));
  assign mux_885_nl = MUX_s_1_2_2(mux_1143_cse, mux_tmp_504, fsm_output[2]);
  assign mux_886_nl = MUX_s_1_2_2(or_627_nl, mux_885_nl, reg_VEC_LOOP_j_10_10_0_tmp[5]);
  assign and_276_nl = (fsm_output[1]) & (~ mux_886_nl);
  assign nor_91_nl = ~((fsm_output[3]) | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[8])
      | (fsm_output[6]));
  assign nor_92_nl = ~((fsm_output[3]) | (~ (fsm_output[4])) | (fsm_output[7]) |
      (fsm_output[8]) | (fsm_output[6]));
  assign mux_879_nl = MUX_s_1_2_2(nor_91_nl, nor_92_nl, fsm_output[2]);
  assign and_277_nl = (reg_VEC_LOOP_j_10_10_0_tmp[5]) & mux_879_nl;
  assign mux_877_nl = MUX_s_1_2_2(mux_369_cse, or_395_cse, fsm_output[3]);
  assign mux_875_nl = MUX_s_1_2_2(mux_469_cse, or_685_cse, fsm_output[3]);
  assign mux_878_nl = MUX_s_1_2_2(mux_877_nl, mux_875_nl, fsm_output[2]);
  assign and_278_nl = (reg_VEC_LOOP_j_10_10_0_tmp[5]) & (~ mux_878_nl);
  assign mux_880_nl = MUX_s_1_2_2(and_277_nl, and_278_nl, fsm_output[1]);
  assign mux_887_nl = MUX_s_1_2_2(and_276_nl, mux_880_nl, fsm_output[5]);
  assign not_tmp_267 = MUX_s_1_2_2(nor_90_nl, mux_887_nl, fsm_output[0]);
  assign and_275_cse = (fsm_output[4]) & (fsm_output[2]);
  assign or_tmp_481 = (fsm_output[4]) | (~ (fsm_output[7])) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign or_tmp_486 = ~((fsm_output[4]) & (fsm_output[7]) & (reg_VEC_LOOP_j_10_10_0_tmp[5])
      & (~ (fsm_output[8])));
  assign or_tmp_487 = (fsm_output[3]) | (fsm_output[4]) | (~ (fsm_output[7])) | (~
      (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[8]);
  assign or_665_nl = (~ (fsm_output[4])) | (fsm_output[7]) | not_tmp_207;
  assign mux_925_nl = MUX_s_1_2_2(or_665_nl, or_tmp_486, fsm_output[3]);
  assign mux_926_nl = MUX_s_1_2_2(mux_925_nl, or_tmp_487, fsm_output[2]);
  assign or_661_nl = (~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[8]);
  assign mux_923_nl = MUX_s_1_2_2(or_tmp_486, or_661_nl, fsm_output[3]);
  assign mux_924_nl = MUX_s_1_2_2(or_tmp_487, mux_923_nl, fsm_output[2]);
  assign mux_927_nl = MUX_s_1_2_2(mux_926_nl, mux_924_nl, fsm_output[6]);
  assign or_660_nl = (fsm_output[4]) | (fsm_output[7]) | not_tmp_207;
  assign mux_921_nl = MUX_s_1_2_2(or_660_nl, or_tmp_481, fsm_output[3]);
  assign nand_18_nl = ~((fsm_output[2]) & (~ mux_921_nl));
  assign or_658_nl = (~ (fsm_output[4])) | (fsm_output[7]) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5]))
      | (fsm_output[8]);
  assign mux_919_nl = MUX_s_1_2_2(or_658_nl, or_tmp_481, fsm_output[3]);
  assign nand_38_nl = ~((fsm_output[3]) & (fsm_output[4]) & (fsm_output[7]) & (reg_VEC_LOOP_j_10_10_0_tmp[5])
      & (~ (fsm_output[8])));
  assign mux_920_nl = MUX_s_1_2_2(mux_919_nl, nand_38_nl, fsm_output[2]);
  assign mux_922_nl = MUX_s_1_2_2(nand_18_nl, mux_920_nl, fsm_output[6]);
  assign mux_928_nl = MUX_s_1_2_2(mux_927_nl, mux_922_nl, fsm_output[5]);
  assign or_654_nl = (~ (fsm_output[3])) | (fsm_output[4]) | (fsm_output[7]) | (~
      (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[8]);
  assign or_653_nl = (~ (fsm_output[3])) | (~ (fsm_output[4])) | (fsm_output[7])
      | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[8]);
  assign mux_918_nl = MUX_s_1_2_2(or_654_nl, or_653_nl, fsm_output[2]);
  assign or_655_nl = (fsm_output[6:5]!=2'b01) | mux_918_nl;
  assign mux_929_nl = MUX_s_1_2_2(mux_928_nl, or_655_nl, fsm_output[1]);
  assign and_dcpl_240 = (~ mux_929_nl) & (fsm_output[0]);
  assign nand_tmp_19 = ~((fsm_output[5]) & (~ mux_369_cse));
  assign mux_tmp_964 = MUX_s_1_2_2(and_dcpl_231, or_610_cse, fsm_output[3]);
  assign or_686_nl = (fsm_output[4]) | (~ (fsm_output[6]));
  assign mux_963_nl = MUX_s_1_2_2((~ mux_tmp_517), or_686_nl, fsm_output[3]);
  assign mux_tmp_965 = MUX_s_1_2_2((~ mux_tmp_964), mux_963_nl, fsm_output[2]);
  assign mux_tmp_966 = MUX_s_1_2_2(and_dcpl_231, mux_tmp_517, fsm_output[3]);
  assign mux_975_cse = MUX_s_1_2_2(mux_529_cse, mux_tmp_454, fsm_output[3]);
  assign mux_tmp_978 = MUX_s_1_2_2(mux_1095_cse, mux_975_cse, fsm_output[1]);
  assign mux_tmp_980 = MUX_s_1_2_2(or_384_cse, mux_tmp_451, fsm_output[3]);
  assign mux_981_cse = MUX_s_1_2_2(mux_tmp_451, mux_529_cse, fsm_output[3]);
  assign mux_985_cse = MUX_s_1_2_2(mux_452_cse, mux_457_cse, fsm_output[3]);
  assign mux_986_nl = MUX_s_1_2_2(mux_tmp_980, mux_985_cse, fsm_output[1]);
  assign mux_987_nl = MUX_s_1_2_2(mux_tmp_978, mux_986_nl, fsm_output[4]);
  assign mux_982_nl = MUX_s_1_2_2(mux_981_cse, mux_tmp_980, fsm_output[1]);
  assign mux_983_nl = MUX_s_1_2_2(mux_982_nl, mux_tmp_978, fsm_output[4]);
  assign mux_988_nl = MUX_s_1_2_2(mux_987_nl, mux_983_nl, fsm_output[2]);
  assign and_dcpl_248 = ~(mux_988_nl | (fsm_output[0]));
  assign or_tmp_527 = (fsm_output[2:1]!=2'b00);
  assign or_tmp_529 = (fsm_output[4]) | (fsm_output[1]) | (~ (fsm_output[2]));
  assign or_tmp_530 = (fsm_output[4:1]!=4'b1000);
  assign or_713_nl = (fsm_output[2:1]!=2'b10);
  assign mux_tmp_1006 = MUX_s_1_2_2(or_tmp_527, or_713_nl, fsm_output[4]);
  assign nand_44_nl = ~((fsm_output[4]) & (fsm_output[2]));
  assign nand_21_nl = ~((fsm_output[4]) & (~ and_300_cse));
  assign mux_tmp_1011 = MUX_s_1_2_2(nand_44_nl, nand_21_nl, fsm_output[3]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_60 & and_dcpl_117;
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c1 = ~(mux_716_itm | (fsm_output[0]));
  assign mux_730_nl = MUX_s_1_2_2(nand_tmp_11, or_tmp_378, fsm_output[4]);
  assign mux_729_nl = MUX_s_1_2_2(or_384_cse, nand_tmp_11, fsm_output[4]);
  assign mux_731_nl = MUX_s_1_2_2(mux_730_nl, mux_729_nl, fsm_output[2]);
  assign mux_732_nl = MUX_s_1_2_2(mux_tmp_722, mux_731_nl, fsm_output[3]);
  assign or_559_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_725_nl = MUX_s_1_2_2(or_559_nl, or_725_cse, fsm_output[6]);
  assign mux_726_nl = MUX_s_1_2_2(mux_725_nl, nand_tmp_11, fsm_output[4]);
  assign or_557_nl = (fsm_output[6]) | mux_tmp_723;
  assign mux_724_nl = MUX_s_1_2_2(mux_1021_cse, or_557_nl, fsm_output[4]);
  assign mux_727_nl = MUX_s_1_2_2(mux_726_nl, mux_724_nl, fsm_output[2]);
  assign mux_728_nl = MUX_s_1_2_2(mux_727_nl, mux_tmp_722, fsm_output[3]);
  assign mux_733_nl = MUX_s_1_2_2(mux_732_nl, mux_728_nl, fsm_output[1]);
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c3 = (~ mux_733_nl) & (fsm_output[0]);
  assign xor_dcpl = ~((fsm_output[7]) ^ (fsm_output[5]));
  assign VEC_LOOP_or_9_cse = and_dcpl_49 | and_dcpl_57 | and_dcpl_63 | and_dcpl_72
      | and_dcpl_76 | and_dcpl_81 | and_dcpl_86 | and_dcpl_91 | and_dcpl_96 | and_dcpl_101
      | and_dcpl_105 | and_dcpl_109 | and_dcpl_115 | and_dcpl_120 | and_dcpl_123;
  assign VEC_LOOP_or_26_cse = and_dcpl_52 | and_dcpl_78 | and_dcpl_98 | and_dcpl_118;
  assign VEC_LOOP_or_29_cse = and_dcpl_66 | and_dcpl_107;
  assign VEC_LOOP_or_14_cse = and_dcpl_66 | and_dcpl_88 | and_dcpl_107;
  assign VEC_LOOP_mux1h_10_nl = MUX1HOT_v_6_7_2((z_out_17[9:4]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[9:4]),
      (z_out_14[8:3]), (z_out_14[9:4]), (z_out_14[7:2]), (z_out_14[6:1]), (z_out_14[5:0]),
      {and_dcpl_29 , and_dcpl_38 , COMP_LOOP_twiddle_f_or_2_rgt , VEC_LOOP_or_9_cse
      , VEC_LOOP_or_26_cse , VEC_LOOP_or_29_cse , and_dcpl_88});
  assign VEC_LOOP_mux1h_8_nl = MUX1HOT_s_1_7_2((z_out_17[3]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[3]),
      (z_out_14[2]), (z_out_14[3]), (z_out_14[1]), (z_out_14[0]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      {and_dcpl_29 , and_dcpl_38 , COMP_LOOP_twiddle_f_or_2_rgt , VEC_LOOP_or_9_cse
      , VEC_LOOP_or_26_cse , VEC_LOOP_or_29_cse , and_dcpl_88});
  assign and_140_nl = mux_tmp_446 & (~ (fsm_output[3])) & and_dcpl_24;
  assign VEC_LOOP_mux1h_6_nl = MUX1HOT_s_1_6_2((z_out_17[2]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[2]),
      (z_out_14[1]), (z_out_14[2]), (z_out_14[0]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      {and_dcpl_29 , and_dcpl_38 , COMP_LOOP_twiddle_f_or_2_rgt , VEC_LOOP_or_9_cse
      , VEC_LOOP_or_26_cse , and_140_nl});
  assign mux_444_nl = MUX_s_1_2_2(or_583_cse_1, or_3_cse, fsm_output[4]);
  assign mux_445_nl = MUX_s_1_2_2(or_tmp_184, mux_444_nl, fsm_output[5]);
  assign mux_447_nl = MUX_s_1_2_2(mux_tmp_446, (~ mux_445_nl), fsm_output[3]);
  assign nor_103_nl = ~((fsm_output[7:3]!=5'b00011));
  assign mux_448_nl = MUX_s_1_2_2(mux_447_nl, nor_103_nl, fsm_output[8]);
  assign and_137_nl = mux_448_nl & (fsm_output[2:0]==3'b101);
  assign VEC_LOOP_mux1h_4_nl = MUX1HOT_s_1_5_2((z_out_17[1]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[1]),
      (z_out_14[0]), (z_out_14[1]), (VEC_LOOP_acc_1_cse_10_sva[1]), {and_dcpl_29
      , and_dcpl_38 , COMP_LOOP_twiddle_f_or_2_rgt , VEC_LOOP_or_9_cse , and_137_nl});
  assign mux_430_nl = MUX_s_1_2_2(mux_tmp_424, mux_429_cse, fsm_output[4]);
  assign mux_427_nl = MUX_s_1_2_2(mux_426_cse, mux_tmp_424, fsm_output[4]);
  assign mux_431_nl = MUX_s_1_2_2(mux_430_nl, mux_427_nl, fsm_output[2]);
  assign and_133_nl = (~ mux_431_nl) & and_dcpl_22;
  assign VEC_LOOP_mux1h_2_nl = MUX1HOT_s_1_4_2((z_out_17[0]), (VEC_LOOP_acc_10_cse_2_sva_mx0w1[0]),
      (VEC_LOOP_acc_1_cse_10_sva[0]), (z_out_14[0]), {and_dcpl_29 , and_dcpl_38 ,
      and_133_nl , VEC_LOOP_or_9_cse});
  assign and_39_nl = and_dcpl_34 & and_dcpl_32;
  assign VEC_LOOP_mux1h_nl = MUX1HOT_v_5_37_2(VEC_LOOP_acc_psp_sva_mx0w0, VEC_LOOP_j_10_10_0_sva_1_4_0,
      (VEC_LOOP_acc_10_cse_1_sva[9:5]), (z_out_14[9:5]), (VEC_LOOP_acc_1_cse_10_sva[9:5]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[9:5]), ({VEC_LOOP_acc_11_psp_sva_8 , reg_VEC_LOOP_acc_11_psp_1_reg
      , (reg_VEC_LOOP_acc_11_psp_2_reg[6:4])}), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[9:5]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[9:5]), ({reg_VEC_LOOP_acc_11_psp_1_reg , (reg_VEC_LOOP_acc_11_psp_2_reg[6:3])}),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[9:5]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[9:5]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[9:5]), (z_out_17[9:5]), (reg_VEC_LOOP_acc_11_psp_2_reg[6:2]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[9:5]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[9:5]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[9:5]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[9:5]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[9:5]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[9:5]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[9:5]), (COMP_LOOP_17_twiddle_f_lshift_itm[5:1]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[9:5]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[9:5]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[9:5]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[9:5]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[9:5]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[9:5]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[9:5]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[9:5]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[9:5]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[9:5]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[9:5]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[9:5]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[9:5]), (VEC_LOOP_acc_10_cse_sva_mx0w31[9:5]),
      {and_dcpl_29 , and_39_nl , and_dcpl_36 , and_dcpl_38 , and_dcpl_39 , and_dcpl_43
      , and_dcpl_46 , and_dcpl_49 , and_dcpl_52 , and_dcpl_55 , and_dcpl_57 , and_dcpl_61
      , and_dcpl_63 , VEC_LOOP_or_14_cse , and_dcpl_70 , and_dcpl_72 , and_dcpl_74
      , and_dcpl_76 , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86 , and_dcpl_90
      , and_dcpl_91 , and_dcpl_93 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103
      , and_dcpl_105 , and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118
      , and_dcpl_120 , and_dcpl_121 , and_dcpl_123});
  assign VEC_LOOP_mux1h_1_nl = MUX1HOT_s_1_36_2((COMP_LOOP_twiddle_f_11_sva[4]),
      (VEC_LOOP_acc_10_cse_1_sva[4]), (z_out_14[4]), (VEC_LOOP_acc_1_cse_10_sva[4]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[4]), (reg_VEC_LOOP_acc_11_psp_2_reg[3]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[4]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[4]), (reg_VEC_LOOP_acc_11_psp_2_reg[2]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[4]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[4]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[4]),
      (z_out_17[4]), (reg_VEC_LOOP_acc_11_psp_2_reg[1]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[4]),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10[4]), (VEC_LOOP_acc_10_cse_12_sva_mx0w11[4]),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12[4]), (VEC_LOOP_acc_10_cse_14_sva_mx0w13[4]),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14[4]), (VEC_LOOP_acc_10_cse_16_sva_mx0w15[4]),
      (COMP_LOOP_17_twiddle_f_lshift_itm[0]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[4]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[4]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[4]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[4]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[4]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[4]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[4]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[4]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[4]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[4]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[4]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[4]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[4]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[4]), {and_dcpl_128 , and_dcpl_36 , and_dcpl_38
      , and_dcpl_39 , and_dcpl_43 , and_dcpl_46 , and_dcpl_49 , and_dcpl_52 , and_dcpl_55
      , and_dcpl_57 , and_dcpl_61 , and_dcpl_63 , VEC_LOOP_or_14_cse , and_dcpl_70
      , and_dcpl_72 , and_dcpl_74 , and_dcpl_76 , and_dcpl_78 , and_dcpl_81 , and_dcpl_84
      , and_dcpl_86 , and_dcpl_90 , and_dcpl_91 , and_dcpl_93 , and_dcpl_96 , and_dcpl_98
      , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 , and_dcpl_109 , and_dcpl_112
      , and_dcpl_115 , and_dcpl_118 , and_dcpl_120 , and_dcpl_121 , and_dcpl_123});
  assign mux_441_nl = MUX_s_1_2_2(mux_440_cse, mux_439_cse, fsm_output[2]);
  assign mux_436_nl = MUX_s_1_2_2(mux_435_cse, mux_434_cse, fsm_output[2]);
  assign mux_442_nl = MUX_s_1_2_2(mux_441_nl, mux_436_nl, fsm_output[5]);
  assign or_368_nl = (fsm_output[8:2]!=7'b0101010);
  assign mux_443_nl = MUX_s_1_2_2(mux_442_nl, or_368_nl, fsm_output[1]);
  assign and_134_nl = (~ mux_443_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_3_nl = MUX1HOT_s_1_35_2((COMP_LOOP_twiddle_f_11_sva[3]),
      (VEC_LOOP_acc_10_cse_1_sva[3]), (z_out_14[3]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[3]), (reg_VEC_LOOP_acc_11_psp_2_reg[2]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[3]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[3]), (reg_VEC_LOOP_acc_11_psp_2_reg[1]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[3]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[3]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[3]),
      (z_out_17[3]), (reg_VEC_LOOP_acc_11_psp_2_reg[0]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[3]),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10[3]), (VEC_LOOP_acc_10_cse_12_sva_mx0w11[3]),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12[3]), (VEC_LOOP_acc_10_cse_14_sva_mx0w13[3]),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14[3]), (VEC_LOOP_acc_10_cse_16_sva_mx0w15[3]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[3]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[3]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[3]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[3]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[3]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[3]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[3]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[3]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[3]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[3]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[3]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[3]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[3]), (VEC_LOOP_acc_10_cse_sva_mx0w31[3]),
      {and_dcpl_128 , and_dcpl_36 , and_dcpl_38 , and_134_nl , and_dcpl_43 , and_dcpl_46
      , and_dcpl_49 , and_dcpl_52 , and_dcpl_55 , and_dcpl_57 , and_dcpl_61 , and_dcpl_63
      , VEC_LOOP_or_14_cse , and_dcpl_70 , and_dcpl_72 , and_dcpl_74 , and_dcpl_76
      , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86 , and_dcpl_91 , and_dcpl_93
      , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 ,
      and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118 , and_dcpl_120 ,
      and_dcpl_121 , and_dcpl_123});
  assign mux_459_nl = MUX_s_1_2_2(or_390_cse, or_tmp_157, fsm_output[5]);
  assign mux_460_nl = MUX_s_1_2_2(mux_459_nl, mux_529_cse, fsm_output[4]);
  assign mux_458_nl = MUX_s_1_2_2(mux_tmp_454, mux_457_cse, fsm_output[4]);
  assign mux_461_nl = MUX_s_1_2_2(mux_460_nl, mux_458_nl, fsm_output[2]);
  assign mux_462_nl = MUX_s_1_2_2(mux_461_nl, mux_456_cse, fsm_output[3]);
  assign mux_450_nl = MUX_s_1_2_2(or_384_cse, mux_529_cse, fsm_output[4]);
  assign or_385_nl = (fsm_output[3:2]!=2'b10) | mux_450_nl;
  assign mux_463_nl = MUX_s_1_2_2(mux_462_nl, or_385_nl, fsm_output[1]);
  assign and_138_nl = (~ mux_463_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_5_nl = MUX1HOT_s_1_34_2((COMP_LOOP_twiddle_f_11_sva[2]),
      (VEC_LOOP_acc_10_cse_1_sva[2]), (z_out_14[2]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[2]), (reg_VEC_LOOP_acc_11_psp_2_reg[1]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[2]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[2]), (reg_VEC_LOOP_acc_11_psp_2_reg[0]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[2]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[2]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[2]),
      (z_out_17[2]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[2]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[2]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[2]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[2]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[2]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[2]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[2]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[2]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[2]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[2]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[2]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[2]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[2]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[2]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[2]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[2]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[2]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[2]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[2]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[2]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[2]), {and_dcpl_128 , and_dcpl_36 , and_dcpl_38
      , and_138_nl , and_dcpl_43 , and_dcpl_46 , and_dcpl_49 , and_dcpl_52 , and_dcpl_55
      , and_dcpl_57 , and_dcpl_61 , and_dcpl_63 , VEC_LOOP_or_14_cse , and_dcpl_72
      , and_dcpl_74 , and_dcpl_76 , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86
      , and_dcpl_91 , and_dcpl_93 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103
      , and_dcpl_105 , and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118
      , and_dcpl_120 , and_dcpl_121 , and_dcpl_123});
  assign or_398_nl = (fsm_output[2]) | mux_468_cse;
  assign mux_479_nl = MUX_s_1_2_2(mux_478_cse, or_398_nl, fsm_output[1]);
  assign and_141_nl = (~ mux_479_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_7_nl = MUX1HOT_s_1_33_2((COMP_LOOP_twiddle_f_11_sva[1]),
      (VEC_LOOP_acc_10_cse_1_sva[1]), (z_out_14[1]), (VEC_LOOP_acc_1_cse_10_sva[1]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[1]), (reg_VEC_LOOP_acc_11_psp_2_reg[0]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[1]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[1]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[1]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[1]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[1]),
      (z_out_17[1]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[1]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[1]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[1]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[1]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[1]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[1]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[1]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[1]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[1]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[1]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[1]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[1]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[1]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[1]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[1]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[1]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[1]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[1]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[1]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[1]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[1]), {and_dcpl_128 , and_dcpl_36 , and_dcpl_38
      , and_141_nl , and_dcpl_43 , and_dcpl_46 , and_dcpl_49 , and_dcpl_52 , and_dcpl_57
      , and_dcpl_61 , and_dcpl_63 , VEC_LOOP_or_14_cse , and_dcpl_72 , and_dcpl_74
      , and_dcpl_76 , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86 , and_dcpl_91
      , and_dcpl_93 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105
      , and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118 , and_dcpl_120
      , and_dcpl_121 , and_dcpl_123});
  assign mux_490_nl = MUX_s_1_2_2(mux_468_cse, mux_485_cse, fsm_output[2]);
  assign mux_498_nl = MUX_s_1_2_2(mux_478_cse, mux_490_nl, fsm_output[1]);
  assign and_142_nl = (~ mux_498_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_9_nl = MUX1HOT_s_1_32_2((COMP_LOOP_twiddle_f_11_sva[0]),
      (VEC_LOOP_acc_10_cse_1_sva[0]), (z_out_14[0]), (VEC_LOOP_acc_1_cse_10_sva[0]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[0]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[0]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[0]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[0]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[0]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[0]),
      (z_out_17[0]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[0]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[0]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[0]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[0]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[0]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[0]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[0]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[0]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[0]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[0]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[0]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[0]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[0]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[0]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[0]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[0]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[0]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[0]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[0]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[0]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[0]), {and_dcpl_128 , and_dcpl_36 , and_dcpl_38
      , and_142_nl , and_dcpl_43 , and_dcpl_49 , and_dcpl_52 , and_dcpl_57 , and_dcpl_61
      , and_dcpl_63 , VEC_LOOP_or_14_cse , and_dcpl_72 , and_dcpl_74 , and_dcpl_76
      , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86 , and_dcpl_91 , and_dcpl_93
      , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 ,
      and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118 , and_dcpl_120 ,
      and_dcpl_121 , and_dcpl_123});
  assign vec_rsci_adra_d = {VEC_LOOP_mux1h_10_nl , VEC_LOOP_mux1h_8_nl , VEC_LOOP_mux1h_6_nl
      , VEC_LOOP_mux1h_4_nl , VEC_LOOP_mux1h_2_nl , VEC_LOOP_mux1h_nl , VEC_LOOP_mux1h_1_nl
      , VEC_LOOP_mux1h_3_nl , VEC_LOOP_mux1h_5_nl , VEC_LOOP_mux1h_7_nl , VEC_LOOP_mux1h_9_nl};
  assign vec_rsci_wea_d = vec_rsci_wea_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign twiddle_rsci_adra_d = {VEC_LOOP_mux_rmff , COMP_LOOP_twiddle_f_mux1h_138_rmff
      , COMP_LOOP_twiddle_f_and_rmff , COMP_LOOP_twiddle_f_mux1h_28_rmff , COMP_LOOP_twiddle_f_mux1h_55_rmff
      , COMP_LOOP_twiddle_f_mux1h_108_rmff , COMP_LOOP_twiddle_f_mux1h_153_rmff};
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_adra_d = {VEC_LOOP_mux_rmff , COMP_LOOP_twiddle_f_mux1h_138_rmff
      , COMP_LOOP_twiddle_f_and_rmff , COMP_LOOP_twiddle_f_mux1h_28_rmff , COMP_LOOP_twiddle_f_mux1h_55_rmff
      , COMP_LOOP_twiddle_f_mux1h_108_rmff , COMP_LOOP_twiddle_f_mux1h_153_rmff};
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_da_d = vec_rsci_da_d_reg;
  assign and_dcpl_254 = ~((fsm_output[5]) | (fsm_output[1]));
  assign and_dcpl_261 = (~ (fsm_output[3])) & (fsm_output[0]);
  assign and_dcpl_263 = (fsm_output[5]) & (~ (fsm_output[1])) & and_dcpl_261;
  assign and_dcpl_266 = nor_98_cse & (~ (fsm_output[4])) & (~ (fsm_output[2])) &
      and_dcpl_263;
  assign and_dcpl_269 = nor_98_cse & and_275_cse & and_dcpl_263;
  assign and_dcpl_274 = (fsm_output[8:6]==3'b011) & and_275_cse & and_dcpl_254 &
      and_dcpl_261;
  assign nor_183_cse = ~((fsm_output[5:4]!=2'b00));
  assign and_dcpl_285 = nor_98_cse & nor_183_cse & and_dcpl_53 & (fsm_output[1:0]==2'b11);
  assign and_dcpl_288 = (fsm_output[3:0]==4'b0111);
  assign and_dcpl_290 = ~((fsm_output[8:7]!=2'b00));
  assign and_dcpl_293 = and_dcpl_290 & (fsm_output[6:4]==3'b001) & and_dcpl_288;
  assign and_dcpl_297 = and_dcpl_290 & (fsm_output[6:4]==3'b110) & and_dcpl_288;
  assign and_dcpl_302 = (fsm_output[8:4]==5'b01011) & and_dcpl_288;
  assign and_dcpl_307 = (fsm_output[8:4]==5'b10000) & and_dcpl_288;
  assign and_dcpl_317 = (fsm_output[3:2]==2'b00) & and_dcpl_22;
  assign and_dcpl_319 = (fsm_output[8:6]==3'b011);
  assign and_dcpl_334 = (fsm_output[3:2]==2'b10) & and_291_cse;
  assign and_dcpl_339 = and_dcpl_290 & (fsm_output[6:4]==3'b010) & and_dcpl_334;
  assign and_dcpl_342 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_343 = and_dcpl_290 & (fsm_output[6]);
  assign and_dcpl_345 = and_dcpl_343 & and_dcpl_342 & (fsm_output[3:2]==2'b00) &
      and_291_cse;
  assign and_dcpl_348 = and_dcpl_343 & (fsm_output[5:4]==2'b11) & and_dcpl_334;
  assign and_dcpl_352 = (fsm_output[8:6]==3'b100) & and_dcpl_342 & and_dcpl_334;
  assign and_dcpl_358 = (fsm_output[8:6]==3'b010);
  assign and_dcpl_362 = (fsm_output[3:2]==2'b00) & and_291_cse;
  assign and_dcpl_365 = and_dcpl_358 & (fsm_output[5:4]==2'b10) & and_dcpl_362;
  assign and_dcpl_371 = and_dcpl_319 & nor_183_cse & (fsm_output[3:2]==2'b10) & and_291_cse;
  assign and_dcpl_374 = and_dcpl_319 & (fsm_output[5:4]==2'b11) & and_dcpl_362;
  assign and_dcpl_377 = (fsm_output[3:0]==4'b1111);
  assign and_dcpl_382 = (fsm_output[8:4]==5'b00011) & and_dcpl_377;
  assign and_dcpl_387 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_390 = and_dcpl_387 & (fsm_output[6:2]==5'b00001) & and_dcpl_22;
  assign and_dcpl_392 = and_dcpl_387 & (fsm_output[6]);
  assign and_dcpl_394 = and_dcpl_392 & (fsm_output[5:4]==2'b01) & and_dcpl_377;
  assign and_dcpl_399 = and_dcpl_392 & (fsm_output[5:2]==4'b1010) & and_dcpl_22;
  assign and_dcpl_402 = (fsm_output[3:2]==2'b11) & and_dcpl_22;
  assign and_dcpl_413 = and_dcpl_358 & and_dcpl_342 & (fsm_output[3:2]==2'b10) &
      and_dcpl_22;
  assign and_dcpl_414 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_416 = and_dcpl_358 & and_dcpl_414 & and_dcpl_402;
  assign and_dcpl_422 = (fsm_output[8:6]==3'b100) & and_dcpl_414 & (fsm_output[3:2]==2'b01)
      & and_dcpl_22;
  assign mux_tmp_1031 = MUX_s_1_2_2(or_869_cse, or_870_cse, fsm_output[7]);
  assign nand_tmp_23 = ~((fsm_output[6]) & (~ mux_tmp_1031));
  assign or_767_nl = (fsm_output[7]) | (~((fsm_output[8]) & (fsm_output[3])));
  assign mux_tmp_1033 = MUX_s_1_2_2(or_767_nl, or_tmp_175, fsm_output[6]);
  assign mux_1033_nl = MUX_s_1_2_2(mux_tmp_1033, nand_tmp_23, fsm_output[1]);
  assign mux_1031_nl = MUX_s_1_2_2(nand_tmp_23, mux_437_cse, fsm_output[1]);
  assign mux_tmp_1035 = MUX_s_1_2_2(mux_1033_nl, mux_1031_nl, fsm_output[5]);
  assign or_768_nl = (~ (fsm_output[8])) | (fsm_output[3]);
  assign mux_1035_nl = MUX_s_1_2_2(or_768_nl, or_869_cse, fsm_output[7]);
  assign or_tmp_560 = (fsm_output[6]) | mux_1035_nl;
  assign or_tmp_561 = (fsm_output[6]) | mux_tmp_1031;
  assign mux_tmp_1038 = MUX_s_1_2_2(or_tmp_561, or_tmp_560, fsm_output[1]);
  assign and_dcpl_451 = (fsm_output[3:2]==2'b01);
  assign and_dcpl_452 = and_dcpl_451 & nor_95_cse;
  assign and_dcpl_457 = and_dcpl_290 & (fsm_output[6]) & and_dcpl_342 & and_dcpl_452;
  assign and_dcpl_459 = and_dcpl_451 & and_dcpl_144;
  assign and_dcpl_462 = (fsm_output[8:6]==3'b100);
  assign and_dcpl_464 = and_dcpl_462 & and_dcpl_414 & and_dcpl_459;
  assign and_dcpl_466 = (fsm_output[3:2]==2'b00) & nor_95_cse;
  assign and_dcpl_469 = and_dcpl_462 & and_293_cse & and_dcpl_466;
  assign and_dcpl_471 = (fsm_output[3:2]==2'b10) & nor_95_cse;
  assign and_dcpl_474 = and_dcpl_462 & (fsm_output[5:4]==2'b00) & and_dcpl_471;
  assign and_dcpl_476 = and_283_cse & nor_95_cse;
  assign and_dcpl_478 = and_dcpl_462 & and_dcpl_342 & and_dcpl_476;
  assign and_dcpl_479 = and_dcpl_290 & (~ (fsm_output[6]));
  assign and_dcpl_481 = and_dcpl_479 & and_dcpl_342 & and_dcpl_471;
  assign and_dcpl_485 = and_dcpl_392 & and_293_cse;
  assign and_dcpl_486 = and_dcpl_485 & and_283_cse & and_dcpl_144;
  assign and_dcpl_487 = and_dcpl_485 & and_dcpl_452;
  assign and_dcpl_489 = and_dcpl_392 & and_dcpl_414 & and_dcpl_466;
  assign and_dcpl_490 = and_dcpl_387 & (~ (fsm_output[6]));
  assign and_dcpl_492 = and_dcpl_490 & and_dcpl_342 & and_dcpl_466;
  assign and_dcpl_494 = and_dcpl_392 & and_dcpl_342 & and_dcpl_459;
  assign and_dcpl_496 = and_dcpl_490 & and_293_cse & and_dcpl_471;
  assign and_dcpl_498 = and_dcpl_490 & and_dcpl_414 & and_dcpl_452;
  assign and_dcpl_500 = and_dcpl_479 & and_293_cse & and_dcpl_459;
  assign and_dcpl_502 = and_dcpl_479 & and_dcpl_414 & and_dcpl_476;
  assign and_dcpl_508 = (fsm_output[8:6]==3'b001);
  assign and_dcpl_518 = and_283_cse & and_dcpl_144;
  assign and_dcpl_555 = (fsm_output[8:6]==3'b101) & nor_183_cse & and_dcpl_451 &
      (fsm_output[1:0]==2'b00);
  assign mux_tmp_1045 = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[6]);
  assign or_tmp_565 = (fsm_output[8:7]!=2'b01) | mux_tmp_1045;
  assign or_tmp_567 = (fsm_output[8]) | (~((fsm_output[2]) & (fsm_output[6])));
  assign or_775_nl = (fsm_output[8]) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_1045_nl = MUX_s_1_2_2(or_tmp_567, or_775_nl, fsm_output[7]);
  assign mux_tmp_1047 = MUX_s_1_2_2(mux_1045_nl, or_tmp_565, fsm_output[4]);
  assign or_638_nl = (fsm_output[2]) | (fsm_output[6]);
  assign or_637_nl = (~ (fsm_output[2])) | (fsm_output[6]);
  assign mux_1047_nl = MUX_s_1_2_2(or_638_nl, or_637_nl, fsm_output[8]);
  assign or_tmp_570 = (fsm_output[7]) | mux_1047_nl;
  assign or_780_nl = (~ (fsm_output[8])) | (fsm_output[6]) | (fsm_output[2]);
  assign mux_tmp_1049 = MUX_s_1_2_2(or_780_nl, or_tmp_567, fsm_output[7]);
  assign or_tmp_573 = (fsm_output[8:7]!=2'b00) | mux_tmp_1045;
  assign mux_1051_nl = MUX_s_1_2_2(or_tmp_570, or_tmp_573, fsm_output[4]);
  assign mux_tmp_1053 = MUX_s_1_2_2(mux_tmp_1047, mux_1051_nl, fsm_output[3]);
  assign or_784_nl = (fsm_output[8:7]!=2'b10) | mux_tmp_1045;
  assign mux_1055_nl = MUX_s_1_2_2(or_784_nl, or_tmp_573, fsm_output[4]);
  assign mux_1054_nl = MUX_s_1_2_2(or_tmp_565, mux_tmp_1049, fsm_output[4]);
  assign mux_1056_nl = MUX_s_1_2_2(mux_1055_nl, mux_1054_nl, fsm_output[3]);
  assign mux_1057_nl = MUX_s_1_2_2(mux_1056_nl, mux_tmp_1053, fsm_output[1]);
  assign mux_1049_nl = MUX_s_1_2_2(mux_tmp_1049, or_tmp_570, fsm_output[4]);
  assign mux_1050_nl = MUX_s_1_2_2(mux_1049_nl, mux_tmp_1047, fsm_output[3]);
  assign mux_1053_nl = MUX_s_1_2_2(mux_tmp_1053, mux_1050_nl, fsm_output[1]);
  assign mux_1058_nl = MUX_s_1_2_2(mux_1057_nl, mux_1053_nl, fsm_output[5]);
  assign and_dcpl_564 = ~(mux_1058_nl | (fsm_output[0]));
  assign and_dcpl_567 = and_dcpl_451 & and_dcpl_22;
  assign and_dcpl_571 = and_dcpl_490 & and_dcpl_414;
  assign and_dcpl_572 = and_dcpl_571 & and_dcpl_567;
  assign and_dcpl_575 = and_283_cse & and_291_cse;
  assign and_dcpl_580 = and_dcpl_479 & nor_183_cse & and_dcpl_575;
  assign and_dcpl_582 = and_dcpl_53 & and_291_cse;
  assign and_dcpl_583 = and_dcpl_479 & and_dcpl_414;
  assign and_dcpl_584 = and_dcpl_583 & and_dcpl_582;
  assign and_dcpl_585 = and_dcpl_451 & and_291_cse;
  assign and_dcpl_588 = and_dcpl_479 & and_293_cse & and_dcpl_585;
  assign and_dcpl_589 = (fsm_output[3:2]==2'b10);
  assign and_dcpl_590 = and_dcpl_589 & and_291_cse;
  assign and_dcpl_592 = and_dcpl_343 & nor_183_cse;
  assign and_dcpl_593 = and_dcpl_592 & and_dcpl_590;
  assign and_dcpl_595 = and_dcpl_343 & and_dcpl_342;
  assign and_dcpl_596 = and_dcpl_595 & and_dcpl_575;
  assign and_dcpl_597 = and_dcpl_343 & and_293_cse;
  assign and_dcpl_598 = and_dcpl_597 & and_dcpl_582;
  assign and_dcpl_600 = and_dcpl_490 & nor_183_cse & and_dcpl_585;
  assign and_dcpl_601 = and_dcpl_490 & and_dcpl_342;
  assign and_dcpl_602 = and_dcpl_601 & and_dcpl_590;
  assign and_dcpl_603 = and_dcpl_571 & and_dcpl_575;
  assign and_dcpl_605 = and_dcpl_392 & nor_183_cse;
  assign and_dcpl_606 = and_dcpl_605 & and_dcpl_582;
  assign and_dcpl_608 = and_dcpl_392 & and_dcpl_342 & and_dcpl_585;
  assign and_dcpl_609 = and_dcpl_392 & and_dcpl_414;
  assign and_dcpl_610 = and_dcpl_609 & and_dcpl_590;
  assign and_dcpl_612 = and_dcpl_485 & and_dcpl_575;
  assign and_dcpl_613 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_614 = and_dcpl_613 & (~ (fsm_output[6]));
  assign and_dcpl_615 = and_dcpl_614 & and_dcpl_342;
  assign and_dcpl_616 = and_dcpl_615 & and_dcpl_582;
  assign and_dcpl_618 = and_dcpl_614 & and_dcpl_414 & and_dcpl_585;
  assign and_dcpl_619 = and_dcpl_614 & and_293_cse;
  assign and_dcpl_620 = and_dcpl_619 & and_dcpl_590;
  assign and_dcpl_621 = and_dcpl_589 & and_dcpl_22;
  assign and_dcpl_623 = and_dcpl_479 & and_dcpl_342 & and_dcpl_621;
  assign and_dcpl_624 = and_dcpl_53 & and_dcpl_22;
  assign and_dcpl_625 = and_dcpl_592 & and_dcpl_624;
  assign and_dcpl_627 = and_dcpl_343 & and_dcpl_414 & and_dcpl_621;
  assign and_dcpl_628 = and_dcpl_601 & and_dcpl_624;
  assign and_dcpl_630 = and_dcpl_490 & and_293_cse & and_dcpl_621;
  assign and_dcpl_631 = and_dcpl_609 & and_dcpl_624;
  assign and_dcpl_633 = and_dcpl_614 & nor_183_cse & and_dcpl_621;
  assign and_dcpl_634 = and_dcpl_619 & and_dcpl_624;
  assign and_dcpl_635 = and_283_cse & and_dcpl_22;
  assign and_dcpl_636 = and_dcpl_583 & and_dcpl_635;
  assign and_dcpl_637 = and_dcpl_597 & and_dcpl_635;
  assign and_dcpl_638 = and_dcpl_605 & and_dcpl_635;
  assign and_dcpl_639 = and_dcpl_615 & and_dcpl_635;
  assign and_dcpl_640 = and_dcpl_595 & and_dcpl_567;
  assign and_dcpl_641 = and_dcpl_485 & and_dcpl_567;
  assign and_dcpl_646 = and_dcpl_613 & (fsm_output[6]) & nor_183_cse & and_dcpl_451
      & (fsm_output[1:0]==2'b00);
  assign and_dcpl_648 = and_dcpl_53 & and_dcpl_144;
  assign and_dcpl_649 = and_dcpl_615 & and_dcpl_648;
  assign and_dcpl_650 = and_dcpl_589 & and_dcpl_144;
  assign and_dcpl_651 = and_dcpl_619 & and_dcpl_650;
  assign and_dcpl_652 = and_dcpl_592 & and_dcpl_650;
  assign and_dcpl_653 = and_dcpl_609 & and_dcpl_650;
  assign and_dcpl_654 = and_dcpl_601 & and_dcpl_650;
  assign and_dcpl_655 = and_dcpl_583 & and_dcpl_648;
  assign and_dcpl_656 = and_dcpl_597 & and_dcpl_648;
  assign and_dcpl_657 = and_dcpl_605 & and_dcpl_648;
  assign and_dcpl_660 = (fsm_output[3:0]==4'b0101);
  assign and_739_cse = (fsm_output[8:4]==5'b00101) & and_dcpl_660;
  assign and_744_cse = (fsm_output[8:4]==5'b01010) & and_dcpl_660;
  assign and_749_cse = (fsm_output[8:4]==5'b01111) & and_dcpl_660;
  assign and_dcpl_698 = (fsm_output[3:2]==2'b01) & and_291_cse;
  assign and_dcpl_741 = and_dcpl_462 & and_dcpl_342;
  assign and_dcpl_746 = and_dcpl_462 & and_293_cse;
  assign VEC_LOOP_or_5_ssc = and_dcpl_580 | and_dcpl_584 | and_dcpl_588 | and_dcpl_593
      | and_dcpl_596 | and_dcpl_598 | and_dcpl_600 | and_dcpl_602 | and_dcpl_603
      | and_dcpl_606 | and_dcpl_608 | and_dcpl_610 | and_dcpl_612 | and_dcpl_616
      | and_dcpl_618 | and_dcpl_620;
  assign mux_1070_nl = MUX_s_1_2_2(mux_472_cse, mux_369_cse, fsm_output[5]);
  assign mux_tmp_1074 = MUX_s_1_2_2(mux_484_cse, mux_1070_nl, fsm_output[2]);
  assign mux_tmp_1093 = MUX_s_1_2_2(mux_975_cse, mux_981_cse, fsm_output[1]);
  assign mux_tmp_1108 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[7]);
  assign or_tmp_612 = (fsm_output[8]) | (~ mux_tmp_1108);
  assign not_tmp_481 = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), fsm_output[7]);
  assign or_tmp_648 = (~ (fsm_output[7])) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) |
      (fsm_output[1]) | (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_tmp_649 = (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[1]) | (~
      (fsm_output[0])) | (fsm_output[8]) | (fsm_output[3]);
  assign or_tmp_653 = (fsm_output[7]) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (~
      (fsm_output[1])) | (~ (fsm_output[0])) | (fsm_output[8]) | (~ (fsm_output[3]));
  assign or_868_nl = (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[1]) | (~ (fsm_output[0]))
      | (~ (fsm_output[8])) | (fsm_output[3]);
  assign or_867_nl = (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[1]) | (~ (fsm_output[0]))
      | (fsm_output[8]) | (~ (fsm_output[3]));
  assign mux_tmp_1153 = MUX_s_1_2_2(or_868_nl, or_867_nl, fsm_output[7]);
  assign or_tmp_664 = (fsm_output[7]) | (~ (fsm_output[1])) | (~ (fsm_output[0]))
      | (fsm_output[8]) | (~ (fsm_output[3]));
  assign COMP_LOOP_twiddle_f_or_52_itm = and_dcpl_365 | and_dcpl_371 | and_dcpl_374;
  assign COMP_LOOP_twiddle_f_nor_5_itm = ~(and_dcpl_382 | and_dcpl_394);
  assign COMP_LOOP_twiddle_f_or_itm = and_dcpl_390 | and_dcpl_399;
  assign VEC_LOOP_or_46_itm = and_dcpl_457 | and_dcpl_464 | and_dcpl_469 | and_dcpl_474
      | and_dcpl_478 | and_dcpl_481 | and_dcpl_486 | and_dcpl_487 | and_dcpl_489
      | and_dcpl_492 | and_dcpl_494 | and_dcpl_496 | and_dcpl_498 | and_dcpl_500
      | and_dcpl_502;
  assign VEC_LOOP_nor_7_itm = ~(and_dcpl_572 | and_dcpl_623 | and_dcpl_625 | and_dcpl_627
      | and_dcpl_628 | and_dcpl_630 | and_dcpl_631 | and_dcpl_633 | and_dcpl_634
      | and_dcpl_636 | and_dcpl_637 | and_dcpl_638 | and_dcpl_639 | and_dcpl_640
      | and_dcpl_641 | and_dcpl_646 | and_dcpl_649 | and_dcpl_651 | and_dcpl_652
      | and_dcpl_653 | and_dcpl_654 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657);
  assign VEC_LOOP_or_33_itm = and_dcpl_623 | and_dcpl_625 | and_dcpl_627 | and_dcpl_628
      | and_dcpl_630 | and_dcpl_631 | and_dcpl_633 | and_dcpl_634;
  assign VEC_LOOP_or_36_itm = and_dcpl_636 | and_dcpl_637 | and_dcpl_638 | and_dcpl_639;
  assign VEC_LOOP_or_48_itm = and_dcpl_649 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657;
  assign VEC_LOOP_or_56_itm = and_dcpl_636 | and_dcpl_637 | and_dcpl_638 | and_dcpl_639
      | and_dcpl_649 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657;
  assign VEC_LOOP_or_60_itm = and_dcpl_640 | and_dcpl_641 | and_dcpl_652 | and_dcpl_653;
  assign VEC_LOOP_or_61_itm = and_dcpl_572 | and_dcpl_654;
  assign VEC_LOOP_or_78_itm = and_739_cse | and_749_cse;
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      VEC_LOOP_mult_vec_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[63:32]), (vec_rsci_qa_d_mxwt[31:0]),
          and_dcpl_248);
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
      reg_run_rsci_oswt_cse <= ~(or_dcpl_168 | (fsm_output[2]) | (fsm_output[8])
          | (fsm_output[1]) | (fsm_output[0]));
      reg_vec_rsci_oswt_cse <= ~ mux_368_itm;
      reg_vec_rsci_oswt_1_cse <= and_25_rmff;
      reg_twiddle_rsci_oswt_cse <= and_152_rmff;
      reg_twiddle_rsci_oswt_1_cse <= and_157_rmff;
      reg_complete_rsci_oswt_cse <= and_dcpl_60 & and_dcpl_116 & (fsm_output[1:0]==2'b01)
          & STAGE_LOOP_acc_itm_4_1;
      reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_201;
      reg_ensig_cgo_cse <= ~ mux_515_itm;
      reg_ensig_cgo_2_cse <= ~ mux_630_itm;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_28 & and_dcpl_31 & nor_95_cse) | STAGE_LOOP_i_3_0_sva_mx0c1)
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_674_nl ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_tmp_677 ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out_8;
    end
  end
  always @(posedge clk) begin
    if ( mux_1061_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_10_5_sva_4_0 <= MUX_v_5_2_2(5'b00000, (z_out_14[4:0]), COMP_LOOP_k_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_684_nl ) begin
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= z_out_9;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_693_nl | (fsm_output[8])) ) begin
      COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_8[6:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_700_nl | (fsm_output[8])) ) begin
      COMP_LOOP_17_twiddle_f_lshift_itm <= MUX_v_6_2_2(COMP_LOOP_17_twiddle_f_lshift_itm_1,
          (z_out_14[5:0]), and_dcpl_88);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_216 | VEC_LOOP_acc_1_cse_10_sva_mx0c1
        | and_dcpl_38 | VEC_LOOP_acc_1_cse_10_sva_mx0c3 | and_dcpl_49 | and_dcpl_57
        | and_dcpl_63 | and_dcpl_72 | and_dcpl_76 | and_dcpl_81 | and_dcpl_86 | and_dcpl_91
        | and_dcpl_96 | and_dcpl_101 | and_dcpl_105 | and_dcpl_109 | and_dcpl_115
        | and_dcpl_120 | and_dcpl_123) ) begin
      VEC_LOOP_acc_1_cse_10_sva <= MUX_v_10_2_2(10'b0000000000, COMP_LOOP_twiddle_f_mux1h_161_nl,
          VEC_LOOP_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( mux_1063_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt[7:4];
    end
  end
  always @(posedge clk) begin
    if ( mux_1067_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0 <= COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_1_rgt[3:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_VEC_LOOP_j_10_10_0_tmp <= 6'b000000;
    end
    else if ( (~ mux_1087_nl) & complete_rsci_wen_comp ) begin
      reg_VEC_LOOP_j_10_10_0_tmp <= VEC_LOOP_j_VEC_LOOP_j_mux_rgt[10:5];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_10_0_sva_1_4_0 <= 5'b00000;
    end
    else if ( (~ mux_1104_nl) & complete_rsci_wen_comp ) begin
      VEC_LOOP_j_10_10_0_sva_1_4_0 <= VEC_LOOP_j_VEC_LOOP_j_mux_rgt[4:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_804_nl ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= z_out_9[8:0];
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1123_nl) & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_8 <= MUX_s_1_2_2((z_out_1[8]), (z_out_14[8]), COMP_LOOP_twiddle_f_or_2_rgt);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1136_nl) & complete_rsci_wen_comp ) begin
      reg_VEC_LOOP_acc_11_psp_1_reg <= MUX_s_1_2_2((z_out_1[7]), (z_out_14[7]), COMP_LOOP_twiddle_f_or_63_nl);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1148_nl) & (fsm_output[0]) & complete_rsci_wen_comp ) begin
      reg_VEC_LOOP_acc_11_psp_2_reg <= MUX_v_7_2_2((z_out_1[6:0]), (z_out_14[6:0]),
          COMP_LOOP_twiddle_f_or_64_nl);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_itm ) begin
      COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt[63:32]),
          (twiddle_h_rsci_qa_d_mxwt[31:0]), not_tmp_267);
      COMP_LOOP_twiddle_f_1_sva <= MUX1HOT_v_32_3_2((twiddle_rsci_qa_d_mxwt[63:32]),
          COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, (twiddle_rsci_qa_d_mxwt[31:0]),
          {and_dcpl_227 , and_243_nl , not_tmp_267});
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_1165_nl) & complete_rsci_wen_comp ) begin
      COMP_LOOP_twiddle_f_11_sva <= MUX_v_32_2_2(32'b00000000000000000000000000000000,
          VEC_LOOP_mux1h_15_nl, COMP_LOOP_twiddle_f_nand_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (and_dcpl_29 | and_dcpl_201) ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm <= MUX_s_1_2_2((z_out_12_22_10[12]),
          run_rsci_ivld_mxwt, and_dcpl_201);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_29 | and_dcpl_38 | and_dcpl_43 | and_dcpl_49
        | and_dcpl_52 | and_dcpl_57 | and_dcpl_61 | and_dcpl_63 | and_dcpl_66 | and_dcpl_72
        | and_dcpl_74 | and_dcpl_76 | and_dcpl_78 | and_dcpl_81 | and_dcpl_84 | and_dcpl_86
        | and_dcpl_88 | and_dcpl_91 | and_dcpl_93 | and_dcpl_96 | and_dcpl_98 | and_dcpl_101
        | and_dcpl_103 | and_dcpl_105 | and_dcpl_107 | and_dcpl_109 | and_dcpl_112
        | and_dcpl_115 | and_dcpl_118 | and_dcpl_120 | and_dcpl_121 | and_dcpl_123)
        ) begin
      VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_10_29_2(z_out_17, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
          VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
          VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
          VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10, VEC_LOOP_acc_10_cse_12_sva_mx0w11,
          VEC_LOOP_acc_10_cse_13_sva_mx0w12, VEC_LOOP_acc_10_cse_14_sva_mx0w13, VEC_LOOP_acc_10_cse_15_sva_mx0w14,
          VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17, VEC_LOOP_acc_10_cse_19_sva_mx0w18,
          VEC_LOOP_acc_10_cse_20_sva_mx0w19, VEC_LOOP_acc_10_cse_21_sva_mx0w20, VEC_LOOP_acc_10_cse_22_sva_mx0w21,
          VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_24_sva_mx0w23, VEC_LOOP_acc_10_cse_26_sva_mx0w25,
          VEC_LOOP_acc_10_cse_27_sva_mx0w26, VEC_LOOP_acc_10_cse_28_sva_mx0w27, VEC_LOOP_acc_10_cse_29_sva_mx0w28,
          VEC_LOOP_acc_10_cse_30_sva_mx0w29, VEC_LOOP_acc_10_cse_31_sva_mx0w30, VEC_LOOP_acc_10_cse_sva_mx0w31,
          {VEC_LOOP_or_20_nl , and_dcpl_38 , and_dcpl_43 , and_dcpl_49 , and_dcpl_52
          , and_dcpl_57 , and_dcpl_61 , and_dcpl_63 , and_dcpl_72 , and_dcpl_74 ,
          and_dcpl_76 , and_dcpl_78 , and_dcpl_81 , and_dcpl_84 , and_dcpl_86 , and_dcpl_91
          , and_dcpl_93 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103
          , and_dcpl_105 , and_dcpl_109 , and_dcpl_112 , and_dcpl_115 , and_dcpl_118
          , and_dcpl_120 , and_dcpl_121 , and_dcpl_123});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~((~ mux_971_nl) & nor_132_cse & (~ (fsm_output[8]))))
        ) begin
      COMP_LOOP_twiddle_f_9_sva <= MUX1HOT_v_32_3_2(z_out_13, COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
          (twiddle_rsci_qa_d_mxwt[31:0]), {and_dcpl_29 , and_251_nl , and_dcpl_159});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((mux_972_nl & not_tmp_69 & and_dcpl_25 & (~ (fsm_output[8]))
        & (~ (fsm_output[0]))) | and_dcpl_248) ) begin
      factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[31:0]), (vec_rsci_qa_d_mxwt[63:32]),
          and_dcpl_248);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~ mux_1020_nl) ) begin
      COMP_LOOP_twiddle_help_11_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt[63:32]),
          (twiddle_h_rsci_qa_d_mxwt[31:0]), and_dcpl_240);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(mux_1029_nl & and_dcpl_58 & and_dcpl_167)) )
        begin
      COMP_LOOP_twiddle_help_9_sva <= twiddle_h_rsci_qa_d_mxwt[31:0];
    end
  end
  assign and_217_nl = (fsm_output[8]) & or_748_cse;
  assign mux_671_nl = MUX_s_1_2_2(and_217_nl, nor_tmp_29, fsm_output[1]);
  assign mux_674_nl = MUX_s_1_2_2(mux_tmp_673, mux_671_nl, fsm_output[0]);
  assign COMP_LOOP_k_not_nl = ~ mux_tmp_677;
  assign nor_221_nl = ~((fsm_output[7:1]!=7'b0000000));
  assign or_785_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[7])
      | (fsm_output[4]);
  assign mux_1060_nl = MUX_s_1_2_2((fsm_output[7]), or_785_nl, fsm_output[6]);
  assign mux_1061_nl = MUX_s_1_2_2(nor_221_nl, mux_1060_nl, fsm_output[8]);
  assign mux_682_nl = MUX_s_1_2_2(not_tmp_230, mux_tmp_678, fsm_output[8]);
  assign mux_683_nl = MUX_s_1_2_2(mux_tmp_680, mux_682_nl, fsm_output[1]);
  assign and_220_nl = (fsm_output[8]) & mux_tmp_678;
  assign mux_681_nl = MUX_s_1_2_2(mux_tmp_680, and_220_nl, fsm_output[1]);
  assign mux_684_nl = MUX_s_1_2_2(mux_683_nl, mux_681_nl, fsm_output[0]);
  assign mux_692_nl = MUX_s_1_2_2(and_dcpl_27, nor_tmp_11, fsm_output[5]);
  assign and_316_nl = (fsm_output[7:5]==3'b111);
  assign or_533_nl = and_291_cse | (fsm_output[3:2]!=2'b00);
  assign mux_693_nl = MUX_s_1_2_2(mux_692_nl, and_316_nl, or_533_nl);
  assign and_284_nl = (and_285_cse | (fsm_output[4]) | (fsm_output[6])) & (fsm_output[7]);
  assign mux_698_nl = MUX_s_1_2_2(mux_tmp_695, and_284_nl, fsm_output[2]);
  assign mux_699_nl = MUX_s_1_2_2(mux_tmp_696, mux_698_nl, fsm_output[1]);
  assign and_286_nl = ((or_739_cse & (fsm_output[5])) | (fsm_output[4]) | (fsm_output[6]))
      & (fsm_output[7]);
  assign mux_697_nl = MUX_s_1_2_2(mux_tmp_696, and_286_nl, fsm_output[1]);
  assign mux_700_nl = MUX_s_1_2_2(mux_699_nl, mux_697_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_f_or_1_nl = and_dcpl_38 | and_dcpl_49 | and_dcpl_57 |
      and_dcpl_63 | and_dcpl_72 | and_dcpl_76 | and_dcpl_81 | and_dcpl_86 | and_dcpl_91
      | and_dcpl_96 | and_dcpl_101 | and_dcpl_105 | and_dcpl_109 | and_dcpl_115 |
      and_dcpl_120 | and_dcpl_123;
  assign COMP_LOOP_twiddle_f_mux1h_161_nl = MUX1HOT_v_10_3_2(z_out_1, z_out_14, ({(reg_VEC_LOOP_j_10_10_0_tmp[4:0])
      , VEC_LOOP_j_10_10_0_sva_1_4_0}), {and_dcpl_216 , COMP_LOOP_twiddle_f_or_1_nl
      , VEC_LOOP_acc_1_cse_10_sva_mx0c3});
  assign VEC_LOOP_not_nl = ~ VEC_LOOP_acc_1_cse_10_sva_mx0c1;
  assign nor_220_nl = ~(((fsm_output[3:1]==3'b111)) | (fsm_output[4]) | (fsm_output[6]));
  assign mux_1062_nl = MUX_s_1_2_2(nor_220_nl, or_788_cse, fsm_output[8]);
  assign mux_1063_nl = MUX_s_1_2_2(mux_1062_nl, (fsm_output[8]), or_787_cse);
  assign nor_218_nl = ~((fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[6]));
  assign or_792_nl = COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_22_itm | (~ (fsm_output[3]))
      | (fsm_output[4]) | (fsm_output[6]);
  assign mux_1064_nl = MUX_s_1_2_2(or_788_cse, or_792_nl, fsm_output[2]);
  assign nor_219_nl = ~((fsm_output[1]) | mux_1064_nl);
  assign mux_1065_nl = MUX_s_1_2_2(nor_218_nl, nor_219_nl, fsm_output[0]);
  assign mux_1066_nl = MUX_s_1_2_2(mux_1065_nl, or_788_cse, fsm_output[8]);
  assign mux_1067_nl = MUX_s_1_2_2(mux_1066_nl, (fsm_output[8]), or_787_cse);
  assign or_805_nl = (~ (fsm_output[1])) | (fsm_output[5]) | (fsm_output[4]) | (fsm_output[7])
      | (fsm_output[8]) | (fsm_output[6]);
  assign mux_1082_nl = MUX_s_1_2_2(or_584_cse_1, or_tmp_156, fsm_output[4]);
  assign mux_1083_nl = MUX_s_1_2_2(mux_1082_nl, mux_1081_cse, fsm_output[5]);
  assign mux_1084_nl = MUX_s_1_2_2(mux_474_cse, mux_1083_nl, fsm_output[2]);
  assign mux_1085_nl = MUX_s_1_2_2(mux_tmp_1074, mux_1084_nl, fsm_output[1]);
  assign mux_1086_nl = MUX_s_1_2_2(or_805_nl, mux_1085_nl, fsm_output[0]);
  assign or_803_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[4]) | (fsm_output[7])
      | (fsm_output[8]) | (fsm_output[6]);
  assign mux_1076_nl = MUX_s_1_2_2(or_583_cse_1, or_tmp_161, fsm_output[4]);
  assign mux_1077_nl = MUX_s_1_2_2(mux_1076_nl, mux_469_cse, fsm_output[5]);
  assign mux_1078_nl = MUX_s_1_2_2(mux_1077_nl, mux_474_cse, fsm_output[2]);
  assign mux_1079_nl = MUX_s_1_2_2(mux_1078_nl, mux_tmp_1074, fsm_output[1]);
  assign mux_1080_nl = MUX_s_1_2_2(or_803_nl, mux_1079_nl, fsm_output[0]);
  assign mux_1087_nl = MUX_s_1_2_2(mux_1086_nl, mux_1080_nl, fsm_output[3]);
  assign or_813_nl = (fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[3]) | (fsm_output[5])
      | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[6]);
  assign mux_1100_nl = MUX_s_1_2_2(mux_457_cse, mux_tmp_451, fsm_output[3]);
  assign mux_1101_nl = MUX_s_1_2_2(mux_1100_nl, mux_985_cse, fsm_output[1]);
  assign mux_1102_nl = MUX_s_1_2_2(mux_tmp_1093, mux_1101_nl, fsm_output[2]);
  assign mux_1103_nl = MUX_s_1_2_2(or_813_nl, mux_1102_nl, fsm_output[0]);
  assign mux_1098_nl = MUX_s_1_2_2(mux_985_cse, mux_1095_cse, fsm_output[1]);
  assign mux_1099_nl = MUX_s_1_2_2(mux_1098_nl, mux_tmp_1093, fsm_output[2]);
  assign nand_62_nl = ~((fsm_output[0]) & (~ mux_1099_nl));
  assign mux_1104_nl = MUX_s_1_2_2(mux_1103_nl, nand_62_nl, fsm_output[4]);
  assign mux_803_nl = MUX_s_1_2_2(or_tmp_355, or_tmp_1, and_283_cse);
  assign mux_804_nl = MUX_s_1_2_2(not_tmp_230, mux_803_nl, fsm_output[8]);
  assign mux_1118_nl = MUX_s_1_2_2(mux_1024_cse, or_tmp_612, fsm_output[6]);
  assign mux_1116_nl = MUX_s_1_2_2(mux_tmp_1108, or_728_cse, fsm_output[8]);
  assign mux_1117_nl = MUX_s_1_2_2(mux_1116_nl, or_834_cse, fsm_output[6]);
  assign mux_1119_nl = MUX_s_1_2_2(mux_1118_nl, mux_1117_nl, fsm_output[4]);
  assign mux_1120_nl = MUX_s_1_2_2(mux_1025_cse, mux_1119_nl, fsm_output[0]);
  assign or_827_nl = (fsm_output[8:4]!=5'b00000);
  assign mux_1115_nl = MUX_s_1_2_2(mux_1025_cse, or_827_nl, fsm_output[0]);
  assign mux_1121_nl = MUX_s_1_2_2(mux_1120_nl, mux_1115_nl, fsm_output[1]);
  assign nand_67_nl = ~((fsm_output[4]) & (fsm_output[6]) & (~ (fsm_output[8])) &
      mux_tmp_1108);
  assign mux_1110_nl = MUX_s_1_2_2(mux_1021_cse, or_tmp_612, fsm_output[4]);
  assign mux_1111_nl = MUX_s_1_2_2(nand_67_nl, mux_1110_nl, fsm_output[0]);
  assign or_823_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[8]) | (~ mux_tmp_1108);
  assign mux_1112_nl = MUX_s_1_2_2(mux_1111_nl, or_823_nl, fsm_output[1]);
  assign mux_1122_nl = MUX_s_1_2_2(mux_1121_nl, mux_1112_nl, fsm_output[3]);
  assign nand_68_nl = ~(((fsm_output[1:0]!=2'b00)) & (fsm_output[4]) & (fsm_output[6])
      & (~ (fsm_output[8])) & mux_tmp_1108);
  assign or_878_nl = nor_95_cse | mux_1023_cse;
  assign mux_1109_nl = MUX_s_1_2_2(nand_68_nl, or_878_nl, fsm_output[3]);
  assign mux_1123_nl = MUX_s_1_2_2(mux_1122_nl, mux_1109_nl, fsm_output[2]);
  assign COMP_LOOP_twiddle_f_or_63_nl = COMP_LOOP_twiddle_f_or_2_rgt | mux_827_ssc;
  assign nor_213_nl = ~((~ (fsm_output[6])) | (fsm_output[8]) | not_tmp_481);
  assign nor_214_nl = ~((fsm_output[6]) | mux_1024_cse);
  assign mux_1133_nl = MUX_s_1_2_2(nor_213_nl, nor_214_nl, fsm_output[4]);
  assign nand_65_nl = ~((fsm_output[0]) & mux_1133_nl);
  assign or_843_nl = (~ (fsm_output[0])) | (fsm_output[4]) | (fsm_output[6]) | (fsm_output[8])
      | (fsm_output[7]) | (fsm_output[5]);
  assign mux_1134_nl = MUX_s_1_2_2(nand_65_nl, or_843_nl, fsm_output[1]);
  assign or_842_nl = (~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[8])
      | not_tmp_481;
  assign or_840_nl = (fsm_output[8]) | not_tmp_481;
  assign mux_1129_nl = MUX_s_1_2_2(mux_1021_cse, or_840_nl, fsm_output[4]);
  assign mux_1130_nl = MUX_s_1_2_2(or_842_nl, mux_1129_nl, fsm_output[0]);
  assign or_839_nl = (fsm_output[0]) | (~ (fsm_output[4])) | (~ (fsm_output[6]))
      | (fsm_output[8]) | not_tmp_481;
  assign mux_1131_nl = MUX_s_1_2_2(mux_1130_nl, or_839_nl, fsm_output[1]);
  assign mux_1135_nl = MUX_s_1_2_2(mux_1134_nl, mux_1131_nl, fsm_output[3]);
  assign or_837_nl = nor_95_cse | (~ (fsm_output[4])) | (~ (fsm_output[6])) | (fsm_output[8])
      | not_tmp_481;
  assign or_nl = (fsm_output[1:0]!=2'b01) | mux_1023_cse;
  assign mux_1128_nl = MUX_s_1_2_2(or_837_nl, or_nl, fsm_output[3]);
  assign mux_1136_nl = MUX_s_1_2_2(mux_1135_nl, mux_1128_nl, fsm_output[2]);
  assign mux_690_nl = MUX_s_1_2_2(or_tmp_186, mux_tmp_686, fsm_output[1]);
  assign mux_780_nl = MUX_s_1_2_2(mux_tmp_686, or_739_cse, fsm_output[1]);
  assign mux_828_nl = MUX_s_1_2_2(mux_690_nl, mux_780_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_f_or_64_nl = COMP_LOOP_twiddle_f_or_2_rgt | mux_827_ssc
      | ((~ mux_828_nl) & xor_dcpl & and_dcpl_231 & (~ (fsm_output[8])));
  assign mux_1146_nl = MUX_s_1_2_2(mux_1145_cse, mux_1143_cse, fsm_output[2]);
  assign or_857_nl = (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[7])
      | (fsm_output[6]) | (fsm_output[8]);
  assign mux_1147_nl = MUX_s_1_2_2(mux_1146_nl, or_857_nl, fsm_output[1]);
  assign nand_66_nl = ~((fsm_output[4]) & (fsm_output[7]) & (fsm_output[6]) & (~
      (fsm_output[8])));
  assign mux_1138_nl = MUX_s_1_2_2(nand_66_nl, mux_472_cse, fsm_output[3]);
  assign mux_1142_nl = MUX_s_1_2_2(mux_1141_cse, mux_1138_nl, fsm_output[2]);
  assign or_856_nl = (fsm_output[1]) | mux_1142_nl;
  assign mux_1148_nl = MUX_s_1_2_2(mux_1147_nl, or_856_nl, fsm_output[5]);
  assign and_243_nl = and_dcpl_65 & and_dcpl_40;
  assign or_630_nl = (fsm_output[8]) | (fsm_output[2]) | (~((fsm_output[3]) & mux_tmp_517));
  assign mux_889_nl = MUX_s_1_2_2(mux_tmp_516, or_630_nl, fsm_output[1]);
  assign and_248_nl = (~ mux_889_nl) & nor_132_cse & (fsm_output[0]);
  assign VEC_LOOP_mux1h_15_nl = MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_9_sva, (twiddle_rsci_qa_d_mxwt[63:32]), (twiddle_rsci_qa_d_mxwt[31:0]),
      {and_248_nl , and_dcpl_153 , and_dcpl_154 , and_dcpl_240});
  assign COMP_LOOP_twiddle_f_nand_nl = ~(and_dcpl_28 & and_dcpl_23 & nor_95_cse);
  assign mux_1162_nl = MUX_s_1_2_2(or_tmp_664, or_tmp_653, fsm_output[5]);
  assign or_877_nl = (fsm_output[1]) | (~ (fsm_output[0])) | (~ (fsm_output[8]))
      | (fsm_output[3]);
  assign mux_1160_nl = MUX_s_1_2_2(or_877_nl, or_tmp_649, fsm_output[7]);
  assign mux_1161_nl = MUX_s_1_2_2(mux_1160_nl, or_tmp_648, fsm_output[5]);
  assign mux_1163_nl = MUX_s_1_2_2(mux_1162_nl, mux_1161_nl, fsm_output[6]);
  assign or_876_nl = (fsm_output[5]) | mux_tmp_1153;
  assign or_873_nl = (fsm_output[7]) | (~ (reg_VEC_LOOP_j_10_10_0_tmp[5])) | (fsm_output[1])
      | (~ (fsm_output[0])) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_1158_nl = MUX_s_1_2_2(or_tmp_664, or_873_nl, fsm_output[5]);
  assign mux_1159_nl = MUX_s_1_2_2(or_876_nl, mux_1158_nl, fsm_output[6]);
  assign mux_1164_nl = MUX_s_1_2_2(mux_1163_nl, mux_1159_nl, fsm_output[4]);
  assign mux_1154_nl = MUX_s_1_2_2(or_870_cse, or_869_cse, fsm_output[0]);
  assign or_871_nl = (fsm_output[1]) | mux_1154_nl;
  assign mux_1155_nl = MUX_s_1_2_2(or_871_nl, or_tmp_649, fsm_output[7]);
  assign mux_1156_nl = MUX_s_1_2_2(mux_1155_nl, mux_tmp_1153, fsm_output[5]);
  assign or_872_nl = (fsm_output[6]) | mux_1156_nl;
  assign or_865_nl = (fsm_output[7]) | (~ (fsm_output[0])) | (fsm_output[8]) | (fsm_output[3]);
  assign mux_1151_nl = MUX_s_1_2_2(or_865_nl, or_tmp_653, fsm_output[5]);
  assign or_862_nl = (fsm_output[1]) | (~ (fsm_output[0])) | (fsm_output[8]) | (~
      (fsm_output[3]));
  assign mux_1149_nl = MUX_s_1_2_2(or_862_nl, or_tmp_649, fsm_output[7]);
  assign mux_1150_nl = MUX_s_1_2_2(mux_1149_nl, or_tmp_648, fsm_output[5]);
  assign mux_1152_nl = MUX_s_1_2_2(mux_1151_nl, mux_1150_nl, fsm_output[6]);
  assign mux_1157_nl = MUX_s_1_2_2(or_872_nl, mux_1152_nl, fsm_output[4]);
  assign mux_1165_nl = MUX_s_1_2_2(mux_1164_nl, mux_1157_nl, fsm_output[2]);
  assign VEC_LOOP_or_20_nl = and_dcpl_29 | and_dcpl_66 | and_dcpl_88 | and_dcpl_107;
  assign mux_960_nl = MUX_s_1_2_2(nand_tmp_19, mux_474_cse, fsm_output[3]);
  assign mux_956_nl = MUX_s_1_2_2(or_685_cse, mux_469_cse, fsm_output[5]);
  assign mux_957_nl = MUX_s_1_2_2(mux_956_nl, mux_tmp_467, fsm_output[3]);
  assign mux_961_nl = MUX_s_1_2_2(mux_960_nl, mux_957_nl, fsm_output[2]);
  assign mux_954_nl = MUX_s_1_2_2(mux_tmp_467, nand_tmp_19, fsm_output[3]);
  assign mux_955_nl = MUX_s_1_2_2(mux_954_nl, mux_485_cse, fsm_output[2]);
  assign mux_962_nl = MUX_s_1_2_2(mux_961_nl, mux_955_nl, fsm_output[1]);
  assign and_251_nl = (~ mux_962_nl) & (fsm_output[0]);
  assign mux_969_nl = MUX_s_1_2_2(mux_tmp_966, mux_tmp_964, fsm_output[2]);
  assign mux_970_nl = MUX_s_1_2_2((~ mux_969_nl), mux_tmp_965, fsm_output[1]);
  assign and_272_nl = or_736_cse & (fsm_output[6]);
  assign mux_967_nl = MUX_s_1_2_2(mux_tmp_966, and_272_nl, fsm_output[2]);
  assign mux_968_nl = MUX_s_1_2_2((~ mux_967_nl), mux_tmp_965, fsm_output[1]);
  assign mux_971_nl = MUX_s_1_2_2(mux_970_nl, mux_968_nl, fsm_output[0]);
  assign nor_83_nl = ~((fsm_output[2]) | (~ (fsm_output[4])));
  assign nor_84_nl = ~((~ (fsm_output[2])) | (fsm_output[4]));
  assign mux_972_nl = MUX_s_1_2_2(nor_83_nl, nor_84_nl, fsm_output[1]);
  assign or_722_nl = (fsm_output[5]) | and_322_cse;
  assign or_721_nl = (fsm_output[5]) | mux_tmp_1011;
  assign mux_1018_nl = MUX_s_1_2_2(or_722_nl, or_721_nl, fsm_output[6]);
  assign or_735_nl = (fsm_output[7]) | mux_1018_nl;
  assign nor_80_nl = ~((fsm_output[7:6]!=2'b00) | ((fsm_output[5:3]==3'b111) & or_tmp_527));
  assign mux_1019_nl = MUX_s_1_2_2(or_735_nl, nor_80_nl, fsm_output[8]);
  assign nor_81_nl = ~((fsm_output[2:1]!=2'b01));
  assign mux_1013_nl = MUX_s_1_2_2(nor_81_nl, and_300_cse, fsm_output[4]);
  assign nand_23_nl = ~((fsm_output[3]) & mux_1013_nl);
  assign mux_1014_nl = MUX_s_1_2_2(and_322_cse, nand_23_nl, fsm_output[5]);
  assign mux_1012_nl = MUX_s_1_2_2(mux_tmp_1011, or_tmp_530, fsm_output[5]);
  assign mux_1015_nl = MUX_s_1_2_2(mux_1014_nl, mux_1012_nl, fsm_output[6]);
  assign or_717_nl = (~ (fsm_output[4])) | (fsm_output[1]) | (fsm_output[2]);
  assign mux_1008_nl = MUX_s_1_2_2(or_tmp_529, or_717_nl, fsm_output[3]);
  assign or_716_nl = (fsm_output[4:1]!=4'b0110);
  assign mux_1009_nl = MUX_s_1_2_2(mux_1008_nl, or_716_nl, fsm_output[5]);
  assign or_714_nl = (fsm_output[3]) | mux_tmp_1006;
  assign nand_20_nl = ~((fsm_output[3]) & (~ mux_tmp_1006));
  assign mux_1007_nl = MUX_s_1_2_2(or_714_nl, nand_20_nl, fsm_output[5]);
  assign mux_1010_nl = MUX_s_1_2_2(mux_1009_nl, mux_1007_nl, fsm_output[6]);
  assign mux_1016_nl = MUX_s_1_2_2(mux_1015_nl, mux_1010_nl, fsm_output[7]);
  assign and_259_nl = (fsm_output[4]) & or_tmp_527;
  assign mux_1004_nl = MUX_s_1_2_2((~ or_tmp_529), and_259_nl, fsm_output[3]);
  assign mux_1005_nl = MUX_s_1_2_2((~ or_tmp_530), mux_1004_nl, fsm_output[5]);
  assign nor_82_nl = ~((fsm_output[7:6]!=2'b00) | mux_1005_nl);
  assign mux_1017_nl = MUX_s_1_2_2(mux_1016_nl, nor_82_nl, fsm_output[8]);
  assign and_269_nl = (reg_VEC_LOOP_j_10_10_0_tmp[5]) & (fsm_output[0]);
  assign mux_1020_nl = MUX_s_1_2_2(mux_1019_nl, mux_1017_nl, and_269_nl);
  assign or_759_nl = and_283_cse | (fsm_output[4]);
  assign mux_1027_nl = MUX_s_1_2_2((fsm_output[4]), (~ (fsm_output[4])), fsm_output[3]);
  assign mux_1028_nl = MUX_s_1_2_2(or_736_cse, mux_1027_nl, fsm_output[2]);
  assign mux_1029_nl = MUX_s_1_2_2(or_759_nl, mux_1028_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl = (~((nor_98_cse & (~ (fsm_output[4]))
      & (fsm_output[2]) & and_dcpl_254 & (fsm_output[3]) & (fsm_output[0])) | and_dcpl_266
      | and_dcpl_269)) | and_dcpl_274;
  assign COMP_LOOP_twiddle_f_mux_7_nl = MUX_v_2_2_2(2'b01, 2'b10, and_dcpl_266);
  assign COMP_LOOP_twiddle_f_or_65_nl = and_dcpl_269 | and_dcpl_274;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl = MUX_v_2_2_2(COMP_LOOP_twiddle_f_mux_7_nl,
      2'b11, COMP_LOOP_twiddle_f_or_65_nl);
  assign nl_z_out = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_10_5_sva_4_0
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_9_nl , 1'b0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_10_nl
      , 1'b1});
  assign z_out = nl_z_out[9:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl = (z_out_9[9]) & (~ and_dcpl_285);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl = (COMP_LOOP_k_10_5_sva_4_0[4])
      & (~ and_dcpl_285);
  assign COMP_LOOP_twiddle_f_mux_8_nl = MUX_v_4_2_2((COMP_LOOP_k_10_5_sva_4_0[3:0]),
      (COMP_LOOP_k_10_5_sva_4_0[4:1]), and_dcpl_285);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl = (COMP_LOOP_k_10_5_sva_4_0[0])
      & and_dcpl_285;
  assign nl_z_out_1 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_5_nl , (z_out_9[8:0])})
      * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_6_nl , COMP_LOOP_twiddle_f_mux_8_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_7_nl , 4'b0001});
  assign z_out_1 = nl_z_out_1[9:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl = (~(and_dcpl_293 | and_dcpl_297))
      | and_dcpl_302 | and_dcpl_307;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl = (~(and_dcpl_293 | and_dcpl_302))
      | and_dcpl_297 | and_dcpl_307;
  assign nl_z_out_2_7_0 = ({COMP_LOOP_5_twiddle_f_lshift_ncse_sva_7_4 , COMP_LOOP_5_twiddle_f_lshift_ncse_sva_3_0})
      * ({COMP_LOOP_k_10_5_sva_4_0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_11_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_12_nl , 1'b1});
  assign z_out_2_7_0 = nl_z_out_2_7_0[7:0];
  assign and_860_nl = (fsm_output[8:6]==3'b001) & nor_183_cse & (fsm_output[3:2]==2'b10)
      & and_dcpl_22;
  assign and_861_nl = and_dcpl_319 & nor_183_cse & and_dcpl_317;
  assign and_862_nl = and_dcpl_319 & (fsm_output[5:2]==4'b1111) & and_dcpl_22;
  assign and_863_nl = (fsm_output[8:4]==5'b10001) & and_dcpl_317;
  assign COMP_LOOP_twiddle_f_mux1h_347_nl = MUX1HOT_v_4_4_2(4'b0100, 4'b1010, 4'b1101,
      4'b1110, {and_860_nl , and_861_nl , and_862_nl , and_863_nl});
  assign nl_z_out_3 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_10_5_sva_4_0
      , COMP_LOOP_twiddle_f_mux1h_347_nl , 1'b1});
  assign z_out_3 = nl_z_out_3[9:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl = (~(and_dcpl_339 | and_dcpl_345
      | and_dcpl_348)) | and_dcpl_352;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl = (~ and_dcpl_339) | and_dcpl_345
      | and_dcpl_348 | and_dcpl_352;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl = (~ and_dcpl_345) | and_dcpl_339
      | and_dcpl_348 | and_dcpl_352;
  assign nl_z_out_4_8_0 = COMP_LOOP_3_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_10_5_sva_4_0
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_13_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_14_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_15_nl , 1'b1});
  assign z_out_4_8_0 = nl_z_out_4_8_0[8:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl = MUX_v_9_2_2(({3'b000
      , COMP_LOOP_17_twiddle_f_lshift_itm}), COMP_LOOP_3_twiddle_f_lshift_ncse_sva,
      COMP_LOOP_twiddle_f_or_52_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl = MUX_v_5_2_2(({3'b000
      , (COMP_LOOP_k_10_5_sva_4_0[4:3])}), COMP_LOOP_k_10_5_sva_4_0, COMP_LOOP_twiddle_f_or_52_itm);
  assign and_864_nl = and_dcpl_358 & nor_183_cse & (fsm_output[3:2]==2'b11) & and_291_cse;
  assign COMP_LOOP_twiddle_f_mux1h_348_nl = MUX1HOT_v_3_4_2((COMP_LOOP_k_10_5_sva_4_0[2:0]),
      3'b100, 3'b101, 3'b110, {and_864_nl , and_dcpl_365 , and_dcpl_371 , and_dcpl_374});
  assign nl_z_out_5_8_0 = COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_12_nl * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_13_nl
      , COMP_LOOP_twiddle_f_mux1h_348_nl , 1'b1});
  assign z_out_5_8_0 = nl_z_out_5_8_0[8:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl = MUX_v_3_2_2(3'b000, (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[9:7]),
      COMP_LOOP_twiddle_f_nor_5_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl = MUX_v_7_2_2(COMP_LOOP_9_twiddle_f_lshift_ncse_sva,
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[6:0]), COMP_LOOP_twiddle_f_or_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl = MUX_v_3_2_2(3'b000, (COMP_LOOP_k_10_5_sva_4_0[4:2]),
      COMP_LOOP_twiddle_f_nor_5_itm);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl = MUX_v_2_2_2((COMP_LOOP_k_10_5_sva_4_0[4:3]),
      (COMP_LOOP_k_10_5_sva_4_0[1:0]), COMP_LOOP_twiddle_f_or_itm);
  assign COMP_LOOP_twiddle_f_or_66_nl = and_dcpl_382 | and_dcpl_394;
  assign COMP_LOOP_twiddle_f_mux1h_349_nl = MUX1HOT_v_3_3_2((COMP_LOOP_k_10_5_sva_4_0[2:0]),
      3'b011, 3'b110, {COMP_LOOP_twiddle_f_or_66_nl , and_dcpl_390 , and_dcpl_399});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl = (~(and_dcpl_382 | and_dcpl_399))
      | and_dcpl_390 | and_dcpl_394;
  assign nl_z_out_6 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_8_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_14_nl})
      * ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_9_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_15_nl
      , COMP_LOOP_twiddle_f_mux1h_349_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_16_nl
      , 1'b1});
  assign z_out_6 = nl_z_out_6[9:0];
  assign COMP_LOOP_twiddle_f_or_68_nl = and_dcpl_413 | and_dcpl_416;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl = MUX_v_2_2_2(2'b01, 2'b10,
      COMP_LOOP_twiddle_f_or_68_nl);
  assign COMP_LOOP_twiddle_f_or_67_nl = MUX_v_2_2_2(COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_16_nl,
      2'b11, and_dcpl_422);
  assign COMP_LOOP_twiddle_f_or_69_nl = (~ and_dcpl_413) | ((fsm_output[8:6]==3'b001)
      & and_dcpl_342 & and_dcpl_402) | and_dcpl_416 | and_dcpl_422;
  assign nl_z_out_7 = COMP_LOOP_2_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_10_5_sva_4_0
      , COMP_LOOP_twiddle_f_or_67_nl , and_dcpl_422 , COMP_LOOP_twiddle_f_or_69_nl
      , 1'b1});
  assign z_out_7 = nl_z_out_7[9:0];
  assign VEC_LOOP_VEC_LOOP_or_10_nl = (STAGE_LOOP_lshift_psp_sva[10]) | and_dcpl_457
      | and_dcpl_464 | and_dcpl_469 | and_dcpl_474 | and_dcpl_478 | and_dcpl_481
      | and_dcpl_486 | and_dcpl_487 | and_dcpl_489 | and_dcpl_492 | and_dcpl_494
      | and_dcpl_496 | and_dcpl_498 | and_dcpl_500 | and_dcpl_502;
  assign VEC_LOOP_VEC_LOOP_mux_10_nl = MUX_v_10_2_2((STAGE_LOOP_lshift_psp_sva[9:0]),
      (~ (STAGE_LOOP_lshift_psp_sva[10:1])), VEC_LOOP_or_46_itm);
  assign mux_1169_nl = MUX_s_1_2_2(nand_47_cse, or_tmp_561, fsm_output[1]);
  assign mux_1168_nl = MUX_s_1_2_2(mux_1169_nl, mux_tmp_1038, fsm_output[5]);
  assign mux_1167_nl = MUX_s_1_2_2(mux_tmp_1035, mux_1168_nl, fsm_output[2]);
  assign mux_1172_nl = MUX_s_1_2_2(or_tmp_560, mux_tmp_1033, fsm_output[1]);
  assign mux_1171_nl = MUX_s_1_2_2(mux_tmp_1038, mux_1172_nl, fsm_output[5]);
  assign mux_1170_nl = MUX_s_1_2_2(mux_1171_nl, mux_tmp_1035, fsm_output[2]);
  assign mux_1166_nl = MUX_s_1_2_2(mux_1167_nl, mux_1170_nl, fsm_output[4]);
  assign VEC_LOOP_or_80_nl = (~((~ mux_1166_nl) & (fsm_output[0]))) | and_dcpl_457
      | and_dcpl_464 | and_dcpl_469 | and_dcpl_474 | and_dcpl_478 | and_dcpl_481
      | and_dcpl_486 | and_dcpl_487 | and_dcpl_489 | and_dcpl_492 | and_dcpl_494
      | and_dcpl_496 | and_dcpl_498 | and_dcpl_500 | and_dcpl_502;
  assign VEC_LOOP_VEC_LOOP_mux_11_nl = MUX_v_5_2_2((VEC_LOOP_acc_1_cse_10_sva[9:5]),
      COMP_LOOP_k_10_5_sva_4_0, VEC_LOOP_or_46_itm);
  assign VEC_LOOP_VEC_LOOP_or_11_nl = ((VEC_LOOP_acc_1_cse_10_sva[4]) & (~(and_dcpl_457
      | and_dcpl_481 | and_dcpl_492 | and_dcpl_500 | and_dcpl_502))) | and_dcpl_464
      | and_dcpl_469 | and_dcpl_474 | and_dcpl_478 | and_dcpl_486 | and_dcpl_487
      | and_dcpl_489 | and_dcpl_494 | and_dcpl_496 | and_dcpl_498;
  assign VEC_LOOP_VEC_LOOP_or_12_nl = ((VEC_LOOP_acc_1_cse_10_sva[3]) & (~(and_dcpl_481
      | and_dcpl_489 | and_dcpl_494 | and_dcpl_496 | and_dcpl_498 | and_dcpl_500
      | and_dcpl_502))) | and_dcpl_457 | and_dcpl_464 | and_dcpl_469 | and_dcpl_474
      | and_dcpl_478 | and_dcpl_486 | and_dcpl_487 | and_dcpl_492;
  assign VEC_LOOP_VEC_LOOP_or_13_nl = ((VEC_LOOP_acc_1_cse_10_sva[2]) & (~(and_dcpl_457
      | and_dcpl_474 | and_dcpl_481 | and_dcpl_486 | and_dcpl_487 | and_dcpl_496
      | and_dcpl_498))) | and_dcpl_464 | and_dcpl_469 | and_dcpl_478 | and_dcpl_489
      | and_dcpl_492 | and_dcpl_494 | and_dcpl_500 | and_dcpl_502;
  assign VEC_LOOP_VEC_LOOP_or_14_nl = ((VEC_LOOP_acc_1_cse_10_sva[1]) & (~(and_dcpl_457
      | and_dcpl_464 | and_dcpl_478 | and_dcpl_486 | and_dcpl_487 | and_dcpl_494
      | and_dcpl_498 | and_dcpl_500 | and_dcpl_502))) | and_dcpl_469 | and_dcpl_474
      | and_dcpl_481 | and_dcpl_489 | and_dcpl_492 | and_dcpl_496;
  assign VEC_LOOP_VEC_LOOP_or_15_nl = ((VEC_LOOP_acc_1_cse_10_sva[0]) & (~(and_dcpl_457
      | and_dcpl_469 | and_dcpl_474 | and_dcpl_478 | and_dcpl_481 | and_dcpl_487
      | and_dcpl_489 | and_dcpl_492 | and_dcpl_496 | and_dcpl_498 | and_dcpl_502)))
      | and_dcpl_464 | and_dcpl_486 | and_dcpl_494 | and_dcpl_500;
  assign nl_acc_nl = ({VEC_LOOP_VEC_LOOP_or_10_nl , VEC_LOOP_VEC_LOOP_mux_10_nl ,
      VEC_LOOP_or_80_nl}) + conv_u2u_11_12({VEC_LOOP_VEC_LOOP_mux_11_nl , VEC_LOOP_VEC_LOOP_or_11_nl
      , VEC_LOOP_VEC_LOOP_or_12_nl , VEC_LOOP_VEC_LOOP_or_13_nl , VEC_LOOP_VEC_LOOP_or_14_nl
      , VEC_LOOP_VEC_LOOP_or_15_nl , 1'b1});
  assign acc_nl = nl_acc_nl[11:0];
  assign z_out_10 = readslicef_12_11_1(acc_nl);
  assign and_866_nl = and_dcpl_508 & and_dcpl_414 & (fsm_output[3:2]==2'b10) & nor_95_cse;
  assign and_867_nl = and_dcpl_508 & nor_183_cse & (fsm_output[3:2]==2'b00) & nor_95_cse;
  assign and_868_nl = and_dcpl_508 & (fsm_output[5:4]==2'b01) & and_dcpl_518;
  assign and_869_nl = (fsm_output[8:6]==3'b011) & nor_183_cse & and_dcpl_476;
  assign and_870_nl = and_dcpl_358 & and_dcpl_414 & and_dcpl_518;
  assign and_871_nl = and_dcpl_358 & nor_183_cse & (fsm_output[3:2]==2'b01) & and_dcpl_144;
  assign and_872_nl = and_dcpl_508 & (fsm_output[5:4]==2'b11) & and_dcpl_476;
  assign and_873_nl = (fsm_output[8:6]==3'b000) & nor_183_cse & and_dcpl_518;
  assign COMP_LOOP_mux1h_4_nl = MUX1HOT_v_5_8_2(5'b01010, 5'b00110, 5'b01001, 5'b10100,
      5'b10001, 5'b01101, 5'b01100, 5'b00001, {and_866_nl , and_867_nl , and_868_nl
      , and_869_nl , and_870_nl , and_871_nl , and_872_nl , and_873_nl});
  assign nl_acc_1_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:1])) , 1'b1}) +
      conv_u2u_11_12({COMP_LOOP_k_10_5_sva_4_0 , COMP_LOOP_mux1h_4_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[11:0];
  assign z_out_11_10 = readslicef_12_1_11(acc_1_nl);
  assign VEC_LOOP_mux_7_nl = MUX_v_22_2_2((z_out_13[31:10]), ({11'b00000000000 ,
      (z_out_14[5:0]) , 5'b00000}), and_dcpl_555);
  assign VEC_LOOP_or_81_nl = (~(nor_98_cse & nor_183_cse & and_dcpl_451 & (fsm_output[1:0]==2'b01)))
      | and_dcpl_555;
  assign VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl = ~(MUX_v_10_2_2(10'b0000000000, (STAGE_LOOP_lshift_psp_sva[10:1]),
      and_dcpl_555));
  assign nl_acc_2_nl = conv_u2u_23_24({VEC_LOOP_mux_7_nl , VEC_LOOP_or_81_nl}) +
      conv_s2u_12_24({1'b1 , VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl , 1'b1});
  assign acc_2_nl = nl_acc_2_nl[23:0];
  assign z_out_12_22_10 = readslicef_24_13_11(acc_2_nl);
  assign VEC_LOOP_mux_8_nl = MUX_v_32_2_2(COMP_LOOP_twiddle_f_11_sva, factor1_1_sva,
      and_dcpl_564);
  assign VEC_LOOP_or_82_nl = (~(nor_98_cse & nor_183_cse & (fsm_output[3:0]==4'b0101)))
      | and_dcpl_564;
  assign VEC_LOOP_mux_9_nl = MUX_v_32_2_2(({21'b000000000000000000000 , STAGE_LOOP_lshift_psp_sva}),
      (~ COMP_LOOP_1_mult_cmp_return_rsc_z), and_dcpl_564);
  assign nl_acc_3_nl = ({VEC_LOOP_mux_8_nl , VEC_LOOP_or_82_nl}) + ({VEC_LOOP_mux_9_nl
      , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign z_out_13 = readslicef_33_32_1(acc_3_nl);
  assign VEC_LOOP_VEC_LOOP_and_1_nl = (VEC_LOOP_acc_1_cse_10_sva[9]) & VEC_LOOP_nor_7_itm;
  assign VEC_LOOP_mux_10_nl = MUX_s_1_2_2((VEC_LOOP_acc_1_cse_10_sva[8]), (VEC_LOOP_acc_1_cse_10_sva[9]),
      VEC_LOOP_or_33_itm);
  assign VEC_LOOP_VEC_LOOP_or_16_nl = (VEC_LOOP_mux_10_nl & (~(and_dcpl_572 | and_dcpl_636
      | and_dcpl_637 | and_dcpl_638 | and_dcpl_639 | and_dcpl_640 | and_dcpl_641
      | and_dcpl_646 | and_dcpl_651 | and_dcpl_652 | and_dcpl_653 | and_dcpl_654)))
      | and_dcpl_649 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657;
  assign VEC_LOOP_mux1h_42_nl = MUX1HOT_s_1_4_2((VEC_LOOP_acc_1_cse_10_sva[7]), (VEC_LOOP_acc_1_cse_10_sva[8]),
      (VEC_LOOP_acc_1_cse_10_sva[9]), (~ (STAGE_LOOP_lshift_psp_sva[10])), {VEC_LOOP_or_5_ssc
      , VEC_LOOP_or_33_itm , VEC_LOOP_or_36_itm , VEC_LOOP_or_48_itm});
  assign VEC_LOOP_or_83_nl = (VEC_LOOP_mux1h_42_nl & (~(and_dcpl_572 | and_dcpl_640
      | and_dcpl_641 | and_dcpl_646 | and_dcpl_651 | and_dcpl_654))) | and_dcpl_652
      | and_dcpl_653;
  assign VEC_LOOP_or_84_nl = and_dcpl_640 | and_dcpl_641;
  assign VEC_LOOP_or_85_nl = and_dcpl_652 | and_dcpl_653;
  assign VEC_LOOP_mux1h_43_nl = MUX1HOT_v_7_10_2(({1'b0 , (VEC_LOOP_acc_1_cse_10_sva[9:4])}),
      (VEC_LOOP_acc_1_cse_10_sva[6:0]), (VEC_LOOP_acc_1_cse_10_sva[7:1]), (VEC_LOOP_acc_1_cse_10_sva[8:2]),
      (VEC_LOOP_acc_1_cse_10_sva[9:3]), ({2'b00 , COMP_LOOP_k_10_5_sva_4_0}), (~
      (STAGE_LOOP_lshift_psp_sva[9:3])), ({2'b01 , (~ (STAGE_LOOP_lshift_psp_sva[10:6]))}),
      (~ (STAGE_LOOP_lshift_psp_sva[10:4])), ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[10:5]))}),
      {and_dcpl_572 , VEC_LOOP_or_5_ssc , VEC_LOOP_or_33_itm , VEC_LOOP_or_36_itm
      , VEC_LOOP_or_84_nl , and_dcpl_646 , VEC_LOOP_or_48_itm , and_dcpl_651 , VEC_LOOP_or_85_nl
      , and_dcpl_654});
  assign VEC_LOOP_or_86_nl = (~(and_dcpl_572 | and_dcpl_580 | and_dcpl_584 | and_dcpl_588
      | and_dcpl_593 | and_dcpl_596 | and_dcpl_598 | and_dcpl_600 | and_dcpl_602
      | and_dcpl_603 | and_dcpl_606 | and_dcpl_608 | and_dcpl_610 | and_dcpl_612
      | and_dcpl_616 | and_dcpl_618 | and_dcpl_620 | and_dcpl_623 | and_dcpl_625
      | and_dcpl_627 | and_dcpl_628 | and_dcpl_630 | and_dcpl_631 | and_dcpl_633
      | and_dcpl_634 | and_dcpl_636 | and_dcpl_637 | and_dcpl_638 | and_dcpl_639
      | and_dcpl_640 | and_dcpl_641 | and_dcpl_646)) | and_dcpl_649 | and_dcpl_651
      | and_dcpl_652 | and_dcpl_653 | and_dcpl_654 | and_dcpl_655 | and_dcpl_656
      | and_dcpl_657;
  assign VEC_LOOP_and_30_nl = (COMP_LOOP_k_10_5_sva_4_0[4]) & VEC_LOOP_nor_7_itm;
  assign VEC_LOOP_VEC_LOOP_mux_12_nl = MUX_s_1_2_2((COMP_LOOP_k_10_5_sva_4_0[3]),
      (COMP_LOOP_k_10_5_sva_4_0[4]), VEC_LOOP_or_33_itm);
  assign VEC_LOOP_and_31_nl = VEC_LOOP_VEC_LOOP_mux_12_nl & (~(and_dcpl_572 | and_dcpl_636
      | and_dcpl_637 | and_dcpl_638 | and_dcpl_639 | and_dcpl_640 | and_dcpl_641
      | and_dcpl_646 | and_dcpl_649 | and_dcpl_651 | and_dcpl_652 | and_dcpl_653
      | and_dcpl_654 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657));
  assign VEC_LOOP_mux1h_44_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_10_5_sva_4_0[2]), (COMP_LOOP_k_10_5_sva_4_0[3]),
      (COMP_LOOP_k_10_5_sva_4_0[4]), {VEC_LOOP_or_5_ssc , VEC_LOOP_or_33_itm , VEC_LOOP_or_56_itm});
  assign VEC_LOOP_and_32_nl = VEC_LOOP_mux1h_44_nl & (~(and_dcpl_572 | and_dcpl_640
      | and_dcpl_641 | and_dcpl_646 | and_dcpl_651 | and_dcpl_652 | and_dcpl_653
      | and_dcpl_654));
  assign VEC_LOOP_mux1h_45_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_10_5_sva_4_0[1]), (COMP_LOOP_k_10_5_sva_4_0[2]),
      (COMP_LOOP_k_10_5_sva_4_0[3]), (COMP_LOOP_k_10_5_sva_4_0[4]), {VEC_LOOP_or_5_ssc
      , VEC_LOOP_or_33_itm , VEC_LOOP_or_56_itm , VEC_LOOP_or_60_itm});
  assign VEC_LOOP_and_33_nl = VEC_LOOP_mux1h_45_nl & (~(and_dcpl_572 | and_dcpl_646
      | and_dcpl_651 | and_dcpl_654));
  assign VEC_LOOP_mux1h_46_nl = MUX1HOT_s_1_5_2((COMP_LOOP_k_10_5_sva_4_0[4]), (COMP_LOOP_k_10_5_sva_4_0[0]),
      (COMP_LOOP_k_10_5_sva_4_0[1]), (COMP_LOOP_k_10_5_sva_4_0[2]), (COMP_LOOP_k_10_5_sva_4_0[3]),
      {VEC_LOOP_or_61_itm , VEC_LOOP_or_5_ssc , VEC_LOOP_or_33_itm , VEC_LOOP_or_56_itm
      , VEC_LOOP_or_60_itm});
  assign VEC_LOOP_and_34_nl = VEC_LOOP_mux1h_46_nl & (~(and_dcpl_646 | and_dcpl_651));
  assign VEC_LOOP_mux1h_47_nl = MUX1HOT_s_1_5_2((COMP_LOOP_k_10_5_sva_4_0[3]), (COMP_LOOP_k_10_5_sva_4_0[0]),
      (COMP_LOOP_k_10_5_sva_4_0[1]), (COMP_LOOP_k_10_5_sva_4_0[2]), (COMP_LOOP_k_10_5_sva_4_0[4]),
      {VEC_LOOP_or_61_itm , VEC_LOOP_or_33_itm , VEC_LOOP_or_56_itm , VEC_LOOP_or_60_itm
      , and_dcpl_651});
  assign VEC_LOOP_or_87_nl = (VEC_LOOP_mux1h_47_nl & (~(and_dcpl_580 | and_dcpl_584
      | and_dcpl_588 | and_dcpl_593 | and_dcpl_596 | and_dcpl_598 | and_dcpl_600
      | and_dcpl_602 | and_dcpl_646))) | and_dcpl_603 | and_dcpl_606 | and_dcpl_608
      | and_dcpl_610 | and_dcpl_612 | and_dcpl_616 | and_dcpl_618 | and_dcpl_620;
  assign VEC_LOOP_mux1h_48_nl = MUX1HOT_s_1_4_2((COMP_LOOP_k_10_5_sva_4_0[2]), (COMP_LOOP_k_10_5_sva_4_0[0]),
      (COMP_LOOP_k_10_5_sva_4_0[1]), (COMP_LOOP_k_10_5_sva_4_0[3]), {VEC_LOOP_or_61_itm
      , VEC_LOOP_or_56_itm , VEC_LOOP_or_60_itm , and_dcpl_651});
  assign VEC_LOOP_or_88_nl = (VEC_LOOP_mux1h_48_nl & (~(and_dcpl_580 | and_dcpl_584
      | and_dcpl_588 | and_dcpl_593 | and_dcpl_603 | and_dcpl_606 | and_dcpl_608
      | and_dcpl_610 | and_dcpl_623 | and_dcpl_625 | and_dcpl_627 | and_dcpl_628
      | and_dcpl_646))) | and_dcpl_596 | and_dcpl_598 | and_dcpl_600 | and_dcpl_602
      | and_dcpl_612 | and_dcpl_616 | and_dcpl_618 | and_dcpl_620 | and_dcpl_630
      | and_dcpl_631 | and_dcpl_633 | and_dcpl_634;
  assign VEC_LOOP_mux1h_49_nl = MUX1HOT_s_1_3_2((COMP_LOOP_k_10_5_sva_4_0[1]), (COMP_LOOP_k_10_5_sva_4_0[0]),
      (COMP_LOOP_k_10_5_sva_4_0[2]), {VEC_LOOP_or_61_itm , VEC_LOOP_or_60_itm , and_dcpl_651});
  assign VEC_LOOP_or_89_nl = (VEC_LOOP_mux1h_49_nl & (~(and_dcpl_580 | and_dcpl_584
      | and_dcpl_596 | and_dcpl_598 | and_dcpl_603 | and_dcpl_606 | and_dcpl_612
      | and_dcpl_616 | and_dcpl_623 | and_dcpl_625 | and_dcpl_630 | and_dcpl_631
      | and_dcpl_636 | and_dcpl_637 | and_dcpl_646 | and_dcpl_655 | and_dcpl_656)))
      | and_dcpl_588 | and_dcpl_593 | and_dcpl_600 | and_dcpl_602 | and_dcpl_608
      | and_dcpl_610 | and_dcpl_618 | and_dcpl_620 | and_dcpl_627 | and_dcpl_628
      | and_dcpl_633 | and_dcpl_634 | and_dcpl_638 | and_dcpl_639 | and_dcpl_649
      | and_dcpl_657;
  assign VEC_LOOP_VEC_LOOP_mux_13_nl = MUX_s_1_2_2((COMP_LOOP_k_10_5_sva_4_0[0]),
      (COMP_LOOP_k_10_5_sva_4_0[1]), and_dcpl_651);
  assign VEC_LOOP_or_90_nl = (VEC_LOOP_VEC_LOOP_mux_13_nl & (~(and_dcpl_580 | and_dcpl_588
      | and_dcpl_596 | and_dcpl_600 | and_dcpl_603 | and_dcpl_608 | and_dcpl_612
      | and_dcpl_618 | and_dcpl_623 | and_dcpl_627 | and_dcpl_630 | and_dcpl_633
      | and_dcpl_636 | and_dcpl_638 | and_dcpl_640 | and_dcpl_646 | and_dcpl_652
      | and_dcpl_655 | and_dcpl_657))) | and_dcpl_584 | and_dcpl_593 | and_dcpl_598
      | and_dcpl_602 | and_dcpl_606 | and_dcpl_610 | and_dcpl_616 | and_dcpl_620
      | and_dcpl_625 | and_dcpl_628 | and_dcpl_631 | and_dcpl_634 | and_dcpl_637
      | and_dcpl_639 | and_dcpl_641 | and_dcpl_649 | and_dcpl_653 | and_dcpl_656;
  assign VEC_LOOP_VEC_LOOP_or_17_nl = ((COMP_LOOP_k_10_5_sva_4_0[0]) & (~(and_dcpl_649
      | and_dcpl_652 | and_dcpl_653 | and_dcpl_655 | and_dcpl_656 | and_dcpl_657
      | and_dcpl_654))) | and_dcpl_572 | and_dcpl_580 | and_dcpl_584 | and_dcpl_588
      | and_dcpl_593 | and_dcpl_596 | and_dcpl_598 | and_dcpl_600 | and_dcpl_602
      | and_dcpl_603 | and_dcpl_606 | and_dcpl_608 | and_dcpl_610 | and_dcpl_612
      | and_dcpl_616 | and_dcpl_618 | and_dcpl_620 | and_dcpl_623 | and_dcpl_625
      | and_dcpl_627 | and_dcpl_628 | and_dcpl_630 | and_dcpl_631 | and_dcpl_633
      | and_dcpl_634 | and_dcpl_636 | and_dcpl_637 | and_dcpl_638 | and_dcpl_639
      | and_dcpl_640 | and_dcpl_641 | and_dcpl_646;
  assign nl_acc_4_nl = ({VEC_LOOP_VEC_LOOP_and_1_nl , VEC_LOOP_VEC_LOOP_or_16_nl
      , VEC_LOOP_or_83_nl , VEC_LOOP_mux1h_43_nl , VEC_LOOP_or_86_nl}) + ({VEC_LOOP_and_30_nl
      , VEC_LOOP_and_31_nl , VEC_LOOP_and_32_nl , VEC_LOOP_and_33_nl , VEC_LOOP_and_34_nl
      , VEC_LOOP_or_87_nl , VEC_LOOP_or_88_nl , VEC_LOOP_or_89_nl , VEC_LOOP_or_90_nl
      , VEC_LOOP_VEC_LOOP_or_17_nl , 1'b1});
  assign acc_4_nl = nl_acc_4_nl[10:0];
  assign z_out_14 = readslicef_11_10_1(acc_4_nl);
  assign VEC_LOOP_VEC_LOOP_mux_14_nl = MUX_v_5_2_2(COMP_LOOP_k_10_5_sva_4_0, ({1'b0
      , (COMP_LOOP_k_10_5_sva_4_0[4:1])}), and_744_cse);
  assign VEC_LOOP_VEC_LOOP_or_18_nl = ((COMP_LOOP_k_10_5_sva_4_0[0]) & (~ and_739_cse))
      | and_749_cse;
  assign VEC_LOOP_VEC_LOOP_mux_15_nl = MUX_v_7_2_2((STAGE_LOOP_lshift_psp_sva[10:4]),
      ({1'b0 , (STAGE_LOOP_lshift_psp_sva[10:5])}), and_744_cse);
  assign nl_z_out_15 = ({VEC_LOOP_VEC_LOOP_mux_14_nl , VEC_LOOP_VEC_LOOP_or_18_nl
      , 1'b1}) + VEC_LOOP_VEC_LOOP_mux_15_nl;
  assign z_out_15 = nl_z_out_15[6:0];
  assign and_874_nl = and_dcpl_479 & and_293_cse & and_dcpl_698;
  assign and_875_nl = and_dcpl_343 & and_dcpl_342 & and_dcpl_575;
  assign and_876_nl = and_dcpl_490 & nor_183_cse & and_dcpl_698;
  assign and_877_nl = and_dcpl_490 & and_dcpl_414 & and_dcpl_575;
  assign and_878_nl = and_dcpl_392 & and_dcpl_342 & and_dcpl_698;
  assign and_879_nl = and_dcpl_392 & and_293_cse & and_dcpl_575;
  assign and_880_nl = and_dcpl_462 & nor_183_cse & and_dcpl_621;
  assign and_881_nl = and_dcpl_741 & and_dcpl_582;
  assign and_882_nl = and_dcpl_741 & and_dcpl_635;
  assign and_883_nl = and_dcpl_462 & and_dcpl_414 & and_dcpl_698;
  assign and_884_nl = and_dcpl_746 & and_dcpl_624;
  assign VEC_LOOP_mux1h_50_nl = MUX1HOT_v_5_27_2(5'b00001, 5'b00010, 5'b00011, 5'b00100,
      5'b00101, 5'b00110, 5'b00111, 5'b01001, 5'b01010, 5'b01011, 5'b01100, 5'b01101,
      5'b01110, 5'b01111, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110,
      5'b10111, 5'b11001, 5'b11010, 5'b11011, 5'b11100, 5'b11101, 5'b11110, {and_dcpl_580
      , and_dcpl_623 , and_dcpl_584 , and_dcpl_636 , and_874_nl , and_dcpl_625 ,
      and_dcpl_593 , and_875_nl , and_dcpl_627 , and_dcpl_598 , and_dcpl_637 , and_876_nl
      , and_dcpl_628 , and_dcpl_602 , and_877_nl , and_dcpl_630 , and_dcpl_606 ,
      and_dcpl_638 , and_878_nl , and_dcpl_631 , and_dcpl_610 , and_879_nl , and_880_nl
      , and_881_nl , and_882_nl , and_883_nl , and_884_nl});
  assign and_885_nl = and_dcpl_746 & and_dcpl_590;
  assign VEC_LOOP_or_91_nl = MUX_v_5_2_2(VEC_LOOP_mux1h_50_nl, 5'b11111, and_885_nl);
  assign nl_z_out_16 = ({COMP_LOOP_k_10_5_sva_4_0 , VEC_LOOP_or_91_nl}) + (STAGE_LOOP_lshift_psp_sva[10:1]);
  assign z_out_16 = nl_z_out_16[9:0];
  assign nl_VEC_LOOP_acc_62_nl = COMP_LOOP_k_10_5_sva_4_0 + (STAGE_LOOP_lshift_psp_sva[10:6]);
  assign VEC_LOOP_acc_62_nl = nl_VEC_LOOP_acc_62_nl[4:0];
  assign and_886_nl = nor_98_cse & nor_183_cse & and_dcpl_660;
  assign VEC_LOOP_mux1h_51_nl = MUX1HOT_v_6_3_2(({VEC_LOOP_acc_62_nl , (STAGE_LOOP_lshift_psp_sva[5])}),
      (z_out_15[6:1]), (z_out_15[5:0]), {and_886_nl , VEC_LOOP_or_78_itm , and_744_cse});
  assign VEC_LOOP_VEC_LOOP_mux_16_nl = MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva[4]),
      (z_out_15[0]), VEC_LOOP_or_78_itm);
  assign VEC_LOOP_or_92_nl = and_739_cse | and_744_cse | and_749_cse;
  assign VEC_LOOP_mux_11_nl = MUX_v_10_2_2((COMP_LOOP_twiddle_f_11_sva[9:0]), VEC_LOOP_acc_1_cse_10_sva,
      VEC_LOOP_or_92_nl);
  assign nl_z_out_17 = ({VEC_LOOP_mux1h_51_nl , VEC_LOOP_VEC_LOOP_mux_16_nl , (STAGE_LOOP_lshift_psp_sva[3:1])})
      + VEC_LOOP_mux_11_nl;
  assign z_out_17 = nl_z_out_17[9:0];

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


  function automatic [0:0] MUX1HOT_s_1_11_2;
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
    input [10:0] sel;
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
    MUX1HOT_s_1_11_2 = result;
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


  function automatic [0:0] MUX1HOT_s_1_36_2;
    input [0:0] input_35;
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
    input [35:0] sel;
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
    result = result | ( input_35 & {1{sel[35]}});
    MUX1HOT_s_1_36_2 = result;
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


  function automatic [0:0] MUX1HOT_s_1_8_2;
    input [0:0] input_7;
    input [0:0] input_6;
    input [0:0] input_5;
    input [0:0] input_4;
    input [0:0] input_3;
    input [0:0] input_2;
    input [0:0] input_1;
    input [0:0] input_0;
    input [7:0] sel;
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
    MUX1HOT_s_1_8_2 = result;
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


  function automatic [9:0] MUX1HOT_v_10_29_2;
    input [9:0] input_28;
    input [9:0] input_27;
    input [9:0] input_26;
    input [9:0] input_25;
    input [9:0] input_24;
    input [9:0] input_23;
    input [9:0] input_22;
    input [9:0] input_21;
    input [9:0] input_20;
    input [9:0] input_19;
    input [9:0] input_18;
    input [9:0] input_17;
    input [9:0] input_16;
    input [9:0] input_15;
    input [9:0] input_14;
    input [9:0] input_13;
    input [9:0] input_12;
    input [9:0] input_11;
    input [9:0] input_10;
    input [9:0] input_9;
    input [9:0] input_8;
    input [9:0] input_7;
    input [9:0] input_6;
    input [9:0] input_5;
    input [9:0] input_4;
    input [9:0] input_3;
    input [9:0] input_2;
    input [9:0] input_1;
    input [9:0] input_0;
    input [28:0] sel;
    reg [9:0] result;
  begin
    result = input_0 & {10{sel[0]}};
    result = result | ( input_1 & {10{sel[1]}});
    result = result | ( input_2 & {10{sel[2]}});
    result = result | ( input_3 & {10{sel[3]}});
    result = result | ( input_4 & {10{sel[4]}});
    result = result | ( input_5 & {10{sel[5]}});
    result = result | ( input_6 & {10{sel[6]}});
    result = result | ( input_7 & {10{sel[7]}});
    result = result | ( input_8 & {10{sel[8]}});
    result = result | ( input_9 & {10{sel[9]}});
    result = result | ( input_10 & {10{sel[10]}});
    result = result | ( input_11 & {10{sel[11]}});
    result = result | ( input_12 & {10{sel[12]}});
    result = result | ( input_13 & {10{sel[13]}});
    result = result | ( input_14 & {10{sel[14]}});
    result = result | ( input_15 & {10{sel[15]}});
    result = result | ( input_16 & {10{sel[16]}});
    result = result | ( input_17 & {10{sel[17]}});
    result = result | ( input_18 & {10{sel[18]}});
    result = result | ( input_19 & {10{sel[19]}});
    result = result | ( input_20 & {10{sel[20]}});
    result = result | ( input_21 & {10{sel[21]}});
    result = result | ( input_22 & {10{sel[22]}});
    result = result | ( input_23 & {10{sel[23]}});
    result = result | ( input_24 & {10{sel[24]}});
    result = result | ( input_25 & {10{sel[25]}});
    result = result | ( input_26 & {10{sel[26]}});
    result = result | ( input_27 & {10{sel[27]}});
    result = result | ( input_28 & {10{sel[28]}});
    MUX1HOT_v_10_29_2 = result;
  end
  endfunction


  function automatic [9:0] MUX1HOT_v_10_3_2;
    input [9:0] input_2;
    input [9:0] input_1;
    input [9:0] input_0;
    input [2:0] sel;
    reg [9:0] result;
  begin
    result = input_0 & {10{sel[0]}};
    result = result | ( input_1 & {10{sel[1]}});
    result = result | ( input_2 & {10{sel[2]}});
    MUX1HOT_v_10_3_2 = result;
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


  function automatic [2:0] MUX1HOT_v_3_3_2;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [2:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    MUX1HOT_v_3_3_2 = result;
  end
  endfunction


  function automatic [2:0] MUX1HOT_v_3_4_2;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [3:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    MUX1HOT_v_3_4_2 = result;
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


  function automatic [4:0] MUX1HOT_v_5_12_2;
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
    input [11:0] sel;
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
    MUX1HOT_v_5_12_2 = result;
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


  function automatic [4:0] MUX1HOT_v_5_37_2;
    input [4:0] input_36;
    input [4:0] input_35;
    input [4:0] input_34;
    input [4:0] input_33;
    input [4:0] input_32;
    input [4:0] input_31;
    input [4:0] input_30;
    input [4:0] input_29;
    input [4:0] input_28;
    input [4:0] input_27;
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
    input [36:0] sel;
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
    result = result | ( input_27 & {5{sel[27]}});
    result = result | ( input_28 & {5{sel[28]}});
    result = result | ( input_29 & {5{sel[29]}});
    result = result | ( input_30 & {5{sel[30]}});
    result = result | ( input_31 & {5{sel[31]}});
    result = result | ( input_32 & {5{sel[32]}});
    result = result | ( input_33 & {5{sel[33]}});
    result = result | ( input_34 & {5{sel[34]}});
    result = result | ( input_35 & {5{sel[35]}});
    result = result | ( input_36 & {5{sel[36]}});
    MUX1HOT_v_5_37_2 = result;
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


  function automatic [5:0] MUX1HOT_v_6_3_2;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [2:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    MUX1HOT_v_6_3_2 = result;
  end
  endfunction


  function automatic [5:0] MUX1HOT_v_6_7_2;
    input [5:0] input_6;
    input [5:0] input_5;
    input [5:0] input_4;
    input [5:0] input_3;
    input [5:0] input_2;
    input [5:0] input_1;
    input [5:0] input_0;
    input [6:0] sel;
    reg [5:0] result;
  begin
    result = input_0 & {6{sel[0]}};
    result = result | ( input_1 & {6{sel[1]}});
    result = result | ( input_2 & {6{sel[2]}});
    result = result | ( input_3 & {6{sel[3]}});
    result = result | ( input_4 & {6{sel[4]}});
    result = result | ( input_5 & {6{sel[5]}});
    result = result | ( input_6 & {6{sel[6]}});
    MUX1HOT_v_6_7_2 = result;
  end
  endfunction


  function automatic [6:0] MUX1HOT_v_7_10_2;
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
    input [9:0] sel;
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
    MUX1HOT_v_7_10_2 = result;
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


  function automatic [21:0] MUX_v_22_2_2;
    input [21:0] input_0;
    input [21:0] input_1;
    input [0:0] sel;
    reg [21:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_22_2_2 = result;
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


  function automatic [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
  end
  endfunction


  function automatic [0:0] readslicef_12_1_11;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_12_1_11 = tmp[0:0];
  end
  endfunction


  function automatic [12:0] readslicef_24_13_11;
    input [23:0] vector;
    reg [23:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_24_13_11 = tmp[12:0];
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


  function automatic [23:0] conv_s2u_12_24 ;
    input [11:0]  vector ;
  begin
    conv_s2u_12_24 = {{12{vector[11]}}, vector};
  end
  endfunction


  function automatic [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction


  function automatic [23:0] conv_u2u_23_24 ;
    input [22:0]  vector ;
  begin
    conv_u2u_23_24 = {1'b0, vector};
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
  output [9:0] vec_rsc_adra;
  output [31:0] vec_rsc_da;
  output vec_rsc_wea;
  input [31:0] vec_rsc_qa;
  output [9:0] vec_rsc_adrb;
  output [31:0] vec_rsc_db;
  output vec_rsc_web;
  input [31:0] vec_rsc_qb;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [9:0] twiddle_rsc_adra;
  output [31:0] twiddle_rsc_da;
  output twiddle_rsc_wea;
  input [31:0] twiddle_rsc_qa;
  output [9:0] twiddle_rsc_adrb;
  output [31:0] twiddle_rsc_db;
  output twiddle_rsc_web;
  input [31:0] twiddle_rsc_qb;
  output twiddle_rsc_triosy_lz;
  output [9:0] twiddle_h_rsc_adra;
  output [31:0] twiddle_h_rsc_da;
  output twiddle_h_rsc_wea;
  input [31:0] twiddle_h_rsc_qa;
  output [9:0] twiddle_h_rsc_adrb;
  output [31:0] twiddle_h_rsc_db;
  output twiddle_h_rsc_web;
  input [31:0] twiddle_h_rsc_qb;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire [19:0] vec_rsci_adra_d;
  wire [31:0] vec_rsci_da_d;
  wire [63:0] vec_rsci_qa_d;
  wire [1:0] vec_rsci_wea_d;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d;
  wire [19:0] twiddle_rsci_adra_d;
  wire [63:0] twiddle_rsci_qa_d;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [19:0] twiddle_h_rsci_adra_d;
  wire [63:0] twiddle_h_rsci_qa_d;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_vec_rsci_da_d;
  assign nl_vec_rsci_da_d = {32'b00000000000000000000000000000000 , vec_rsci_da_d};
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_13_10_32_1024_1024_32_1_gen
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
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_16_10_32_1024_1024_32_1_gen
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
  inPlaceNTT_DIT_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_DUAL_rwport_17_10_32_1024_1024_32_1_gen
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



