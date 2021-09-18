
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
//  Generated date: Thu Sep 16 12:53:56 2021
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
      COMP_LOOP_C_8_tr0, COMP_LOOP_8_VEC_LOOP_C_8_tr0, COMP_LOOP_C_9_tr0, COMP_LOOP_9_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_10_tr0, COMP_LOOP_10_VEC_LOOP_C_8_tr0, COMP_LOOP_C_11_tr0, COMP_LOOP_11_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_12_tr0, COMP_LOOP_12_VEC_LOOP_C_8_tr0, COMP_LOOP_C_13_tr0, COMP_LOOP_13_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_14_tr0, COMP_LOOP_14_VEC_LOOP_C_8_tr0, COMP_LOOP_C_15_tr0, COMP_LOOP_15_VEC_LOOP_C_8_tr0,
      COMP_LOOP_C_16_tr0, COMP_LOOP_16_VEC_LOOP_C_8_tr0, COMP_LOOP_C_17_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
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
  input COMP_LOOP_9_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_10_tr0;
  input COMP_LOOP_10_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_11_tr0;
  input COMP_LOOP_11_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_12_tr0;
  input COMP_LOOP_12_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_13_tr0;
  input COMP_LOOP_13_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_14_tr0;
  input COMP_LOOP_14_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_15_tr0;
  input COMP_LOOP_15_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_16_tr0;
  input COMP_LOOP_16_VEC_LOOP_C_8_tr0;
  input COMP_LOOP_C_17_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIT_precomp_core_core_fsm_1
  parameter
    main_C_0 = 8'd0,
    STAGE_LOOP_C_0 = 8'd1,
    COMP_LOOP_C_0 = 8'd2,
    COMP_LOOP_C_1 = 8'd3,
    COMP_LOOP_1_VEC_LOOP_C_0 = 8'd4,
    COMP_LOOP_1_VEC_LOOP_C_1 = 8'd5,
    COMP_LOOP_1_VEC_LOOP_C_2 = 8'd6,
    COMP_LOOP_1_VEC_LOOP_C_3 = 8'd7,
    COMP_LOOP_1_VEC_LOOP_C_4 = 8'd8,
    COMP_LOOP_1_VEC_LOOP_C_5 = 8'd9,
    COMP_LOOP_1_VEC_LOOP_C_6 = 8'd10,
    COMP_LOOP_1_VEC_LOOP_C_7 = 8'd11,
    COMP_LOOP_1_VEC_LOOP_C_8 = 8'd12,
    COMP_LOOP_C_2 = 8'd13,
    COMP_LOOP_2_VEC_LOOP_C_0 = 8'd14,
    COMP_LOOP_2_VEC_LOOP_C_1 = 8'd15,
    COMP_LOOP_2_VEC_LOOP_C_2 = 8'd16,
    COMP_LOOP_2_VEC_LOOP_C_3 = 8'd17,
    COMP_LOOP_2_VEC_LOOP_C_4 = 8'd18,
    COMP_LOOP_2_VEC_LOOP_C_5 = 8'd19,
    COMP_LOOP_2_VEC_LOOP_C_6 = 8'd20,
    COMP_LOOP_2_VEC_LOOP_C_7 = 8'd21,
    COMP_LOOP_2_VEC_LOOP_C_8 = 8'd22,
    COMP_LOOP_C_3 = 8'd23,
    COMP_LOOP_3_VEC_LOOP_C_0 = 8'd24,
    COMP_LOOP_3_VEC_LOOP_C_1 = 8'd25,
    COMP_LOOP_3_VEC_LOOP_C_2 = 8'd26,
    COMP_LOOP_3_VEC_LOOP_C_3 = 8'd27,
    COMP_LOOP_3_VEC_LOOP_C_4 = 8'd28,
    COMP_LOOP_3_VEC_LOOP_C_5 = 8'd29,
    COMP_LOOP_3_VEC_LOOP_C_6 = 8'd30,
    COMP_LOOP_3_VEC_LOOP_C_7 = 8'd31,
    COMP_LOOP_3_VEC_LOOP_C_8 = 8'd32,
    COMP_LOOP_C_4 = 8'd33,
    COMP_LOOP_4_VEC_LOOP_C_0 = 8'd34,
    COMP_LOOP_4_VEC_LOOP_C_1 = 8'd35,
    COMP_LOOP_4_VEC_LOOP_C_2 = 8'd36,
    COMP_LOOP_4_VEC_LOOP_C_3 = 8'd37,
    COMP_LOOP_4_VEC_LOOP_C_4 = 8'd38,
    COMP_LOOP_4_VEC_LOOP_C_5 = 8'd39,
    COMP_LOOP_4_VEC_LOOP_C_6 = 8'd40,
    COMP_LOOP_4_VEC_LOOP_C_7 = 8'd41,
    COMP_LOOP_4_VEC_LOOP_C_8 = 8'd42,
    COMP_LOOP_C_5 = 8'd43,
    COMP_LOOP_5_VEC_LOOP_C_0 = 8'd44,
    COMP_LOOP_5_VEC_LOOP_C_1 = 8'd45,
    COMP_LOOP_5_VEC_LOOP_C_2 = 8'd46,
    COMP_LOOP_5_VEC_LOOP_C_3 = 8'd47,
    COMP_LOOP_5_VEC_LOOP_C_4 = 8'd48,
    COMP_LOOP_5_VEC_LOOP_C_5 = 8'd49,
    COMP_LOOP_5_VEC_LOOP_C_6 = 8'd50,
    COMP_LOOP_5_VEC_LOOP_C_7 = 8'd51,
    COMP_LOOP_5_VEC_LOOP_C_8 = 8'd52,
    COMP_LOOP_C_6 = 8'd53,
    COMP_LOOP_6_VEC_LOOP_C_0 = 8'd54,
    COMP_LOOP_6_VEC_LOOP_C_1 = 8'd55,
    COMP_LOOP_6_VEC_LOOP_C_2 = 8'd56,
    COMP_LOOP_6_VEC_LOOP_C_3 = 8'd57,
    COMP_LOOP_6_VEC_LOOP_C_4 = 8'd58,
    COMP_LOOP_6_VEC_LOOP_C_5 = 8'd59,
    COMP_LOOP_6_VEC_LOOP_C_6 = 8'd60,
    COMP_LOOP_6_VEC_LOOP_C_7 = 8'd61,
    COMP_LOOP_6_VEC_LOOP_C_8 = 8'd62,
    COMP_LOOP_C_7 = 8'd63,
    COMP_LOOP_7_VEC_LOOP_C_0 = 8'd64,
    COMP_LOOP_7_VEC_LOOP_C_1 = 8'd65,
    COMP_LOOP_7_VEC_LOOP_C_2 = 8'd66,
    COMP_LOOP_7_VEC_LOOP_C_3 = 8'd67,
    COMP_LOOP_7_VEC_LOOP_C_4 = 8'd68,
    COMP_LOOP_7_VEC_LOOP_C_5 = 8'd69,
    COMP_LOOP_7_VEC_LOOP_C_6 = 8'd70,
    COMP_LOOP_7_VEC_LOOP_C_7 = 8'd71,
    COMP_LOOP_7_VEC_LOOP_C_8 = 8'd72,
    COMP_LOOP_C_8 = 8'd73,
    COMP_LOOP_8_VEC_LOOP_C_0 = 8'd74,
    COMP_LOOP_8_VEC_LOOP_C_1 = 8'd75,
    COMP_LOOP_8_VEC_LOOP_C_2 = 8'd76,
    COMP_LOOP_8_VEC_LOOP_C_3 = 8'd77,
    COMP_LOOP_8_VEC_LOOP_C_4 = 8'd78,
    COMP_LOOP_8_VEC_LOOP_C_5 = 8'd79,
    COMP_LOOP_8_VEC_LOOP_C_6 = 8'd80,
    COMP_LOOP_8_VEC_LOOP_C_7 = 8'd81,
    COMP_LOOP_8_VEC_LOOP_C_8 = 8'd82,
    COMP_LOOP_C_9 = 8'd83,
    COMP_LOOP_9_VEC_LOOP_C_0 = 8'd84,
    COMP_LOOP_9_VEC_LOOP_C_1 = 8'd85,
    COMP_LOOP_9_VEC_LOOP_C_2 = 8'd86,
    COMP_LOOP_9_VEC_LOOP_C_3 = 8'd87,
    COMP_LOOP_9_VEC_LOOP_C_4 = 8'd88,
    COMP_LOOP_9_VEC_LOOP_C_5 = 8'd89,
    COMP_LOOP_9_VEC_LOOP_C_6 = 8'd90,
    COMP_LOOP_9_VEC_LOOP_C_7 = 8'd91,
    COMP_LOOP_9_VEC_LOOP_C_8 = 8'd92,
    COMP_LOOP_C_10 = 8'd93,
    COMP_LOOP_10_VEC_LOOP_C_0 = 8'd94,
    COMP_LOOP_10_VEC_LOOP_C_1 = 8'd95,
    COMP_LOOP_10_VEC_LOOP_C_2 = 8'd96,
    COMP_LOOP_10_VEC_LOOP_C_3 = 8'd97,
    COMP_LOOP_10_VEC_LOOP_C_4 = 8'd98,
    COMP_LOOP_10_VEC_LOOP_C_5 = 8'd99,
    COMP_LOOP_10_VEC_LOOP_C_6 = 8'd100,
    COMP_LOOP_10_VEC_LOOP_C_7 = 8'd101,
    COMP_LOOP_10_VEC_LOOP_C_8 = 8'd102,
    COMP_LOOP_C_11 = 8'd103,
    COMP_LOOP_11_VEC_LOOP_C_0 = 8'd104,
    COMP_LOOP_11_VEC_LOOP_C_1 = 8'd105,
    COMP_LOOP_11_VEC_LOOP_C_2 = 8'd106,
    COMP_LOOP_11_VEC_LOOP_C_3 = 8'd107,
    COMP_LOOP_11_VEC_LOOP_C_4 = 8'd108,
    COMP_LOOP_11_VEC_LOOP_C_5 = 8'd109,
    COMP_LOOP_11_VEC_LOOP_C_6 = 8'd110,
    COMP_LOOP_11_VEC_LOOP_C_7 = 8'd111,
    COMP_LOOP_11_VEC_LOOP_C_8 = 8'd112,
    COMP_LOOP_C_12 = 8'd113,
    COMP_LOOP_12_VEC_LOOP_C_0 = 8'd114,
    COMP_LOOP_12_VEC_LOOP_C_1 = 8'd115,
    COMP_LOOP_12_VEC_LOOP_C_2 = 8'd116,
    COMP_LOOP_12_VEC_LOOP_C_3 = 8'd117,
    COMP_LOOP_12_VEC_LOOP_C_4 = 8'd118,
    COMP_LOOP_12_VEC_LOOP_C_5 = 8'd119,
    COMP_LOOP_12_VEC_LOOP_C_6 = 8'd120,
    COMP_LOOP_12_VEC_LOOP_C_7 = 8'd121,
    COMP_LOOP_12_VEC_LOOP_C_8 = 8'd122,
    COMP_LOOP_C_13 = 8'd123,
    COMP_LOOP_13_VEC_LOOP_C_0 = 8'd124,
    COMP_LOOP_13_VEC_LOOP_C_1 = 8'd125,
    COMP_LOOP_13_VEC_LOOP_C_2 = 8'd126,
    COMP_LOOP_13_VEC_LOOP_C_3 = 8'd127,
    COMP_LOOP_13_VEC_LOOP_C_4 = 8'd128,
    COMP_LOOP_13_VEC_LOOP_C_5 = 8'd129,
    COMP_LOOP_13_VEC_LOOP_C_6 = 8'd130,
    COMP_LOOP_13_VEC_LOOP_C_7 = 8'd131,
    COMP_LOOP_13_VEC_LOOP_C_8 = 8'd132,
    COMP_LOOP_C_14 = 8'd133,
    COMP_LOOP_14_VEC_LOOP_C_0 = 8'd134,
    COMP_LOOP_14_VEC_LOOP_C_1 = 8'd135,
    COMP_LOOP_14_VEC_LOOP_C_2 = 8'd136,
    COMP_LOOP_14_VEC_LOOP_C_3 = 8'd137,
    COMP_LOOP_14_VEC_LOOP_C_4 = 8'd138,
    COMP_LOOP_14_VEC_LOOP_C_5 = 8'd139,
    COMP_LOOP_14_VEC_LOOP_C_6 = 8'd140,
    COMP_LOOP_14_VEC_LOOP_C_7 = 8'd141,
    COMP_LOOP_14_VEC_LOOP_C_8 = 8'd142,
    COMP_LOOP_C_15 = 8'd143,
    COMP_LOOP_15_VEC_LOOP_C_0 = 8'd144,
    COMP_LOOP_15_VEC_LOOP_C_1 = 8'd145,
    COMP_LOOP_15_VEC_LOOP_C_2 = 8'd146,
    COMP_LOOP_15_VEC_LOOP_C_3 = 8'd147,
    COMP_LOOP_15_VEC_LOOP_C_4 = 8'd148,
    COMP_LOOP_15_VEC_LOOP_C_5 = 8'd149,
    COMP_LOOP_15_VEC_LOOP_C_6 = 8'd150,
    COMP_LOOP_15_VEC_LOOP_C_7 = 8'd151,
    COMP_LOOP_15_VEC_LOOP_C_8 = 8'd152,
    COMP_LOOP_C_16 = 8'd153,
    COMP_LOOP_16_VEC_LOOP_C_0 = 8'd154,
    COMP_LOOP_16_VEC_LOOP_C_1 = 8'd155,
    COMP_LOOP_16_VEC_LOOP_C_2 = 8'd156,
    COMP_LOOP_16_VEC_LOOP_C_3 = 8'd157,
    COMP_LOOP_16_VEC_LOOP_C_4 = 8'd158,
    COMP_LOOP_16_VEC_LOOP_C_5 = 8'd159,
    COMP_LOOP_16_VEC_LOOP_C_6 = 8'd160,
    COMP_LOOP_16_VEC_LOOP_C_7 = 8'd161,
    COMP_LOOP_16_VEC_LOOP_C_8 = 8'd162,
    COMP_LOOP_C_17 = 8'd163,
    STAGE_LOOP_C_1 = 8'd164,
    main_C_1 = 8'd165,
    main_C_2 = 8'd166;

  reg [7:0] state_var;
  reg [7:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIT_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 8'b00000001;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 8'b00000010;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 8'b00000011;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
      end
      COMP_LOOP_1_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00000100;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_1;
      end
      COMP_LOOP_1_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00000101;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_2;
      end
      COMP_LOOP_1_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00000110;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_3;
      end
      COMP_LOOP_1_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00000111;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_4;
      end
      COMP_LOOP_1_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00001000;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_5;
      end
      COMP_LOOP_1_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00001001;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_6;
      end
      COMP_LOOP_1_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00001010;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_7;
      end
      COMP_LOOP_1_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00001011;
        state_var_NS = COMP_LOOP_1_VEC_LOOP_C_8;
      end
      COMP_LOOP_1_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00001100;
        if ( COMP_LOOP_1_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 8'b00001101;
        if ( COMP_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_2_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00001110;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_1;
      end
      COMP_LOOP_2_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00001111;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_2;
      end
      COMP_LOOP_2_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00010000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_3;
      end
      COMP_LOOP_2_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00010001;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_4;
      end
      COMP_LOOP_2_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00010010;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_5;
      end
      COMP_LOOP_2_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00010011;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_6;
      end
      COMP_LOOP_2_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00010100;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_7;
      end
      COMP_LOOP_2_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00010101;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_8;
      end
      COMP_LOOP_2_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00010110;
        if ( COMP_LOOP_2_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_3;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 8'b00010111;
        if ( COMP_LOOP_C_3_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_3_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00011000;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_1;
      end
      COMP_LOOP_3_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00011001;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_2;
      end
      COMP_LOOP_3_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00011010;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_3;
      end
      COMP_LOOP_3_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00011011;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_4;
      end
      COMP_LOOP_3_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00011100;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_5;
      end
      COMP_LOOP_3_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00011101;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_6;
      end
      COMP_LOOP_3_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00011110;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_7;
      end
      COMP_LOOP_3_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00011111;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_8;
      end
      COMP_LOOP_3_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00100000;
        if ( COMP_LOOP_3_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 8'b00100001;
        if ( COMP_LOOP_C_4_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_4_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00100010;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_1;
      end
      COMP_LOOP_4_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00100011;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_2;
      end
      COMP_LOOP_4_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00100100;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_3;
      end
      COMP_LOOP_4_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00100101;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_4;
      end
      COMP_LOOP_4_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00100110;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_5;
      end
      COMP_LOOP_4_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00100111;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_6;
      end
      COMP_LOOP_4_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00101000;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_7;
      end
      COMP_LOOP_4_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00101001;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_8;
      end
      COMP_LOOP_4_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00101010;
        if ( COMP_LOOP_4_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_5;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 8'b00101011;
        if ( COMP_LOOP_C_5_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_5_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00101100;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_1;
      end
      COMP_LOOP_5_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00101101;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_2;
      end
      COMP_LOOP_5_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00101110;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_3;
      end
      COMP_LOOP_5_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00101111;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_4;
      end
      COMP_LOOP_5_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00110000;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_5;
      end
      COMP_LOOP_5_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00110001;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_6;
      end
      COMP_LOOP_5_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00110010;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_7;
      end
      COMP_LOOP_5_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00110011;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_8;
      end
      COMP_LOOP_5_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00110100;
        if ( COMP_LOOP_5_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 8'b00110101;
        if ( COMP_LOOP_C_6_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_6_VEC_LOOP_C_0 : begin
        fsm_output = 8'b00110110;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_1;
      end
      COMP_LOOP_6_VEC_LOOP_C_1 : begin
        fsm_output = 8'b00110111;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_2;
      end
      COMP_LOOP_6_VEC_LOOP_C_2 : begin
        fsm_output = 8'b00111000;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_3;
      end
      COMP_LOOP_6_VEC_LOOP_C_3 : begin
        fsm_output = 8'b00111001;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_4;
      end
      COMP_LOOP_6_VEC_LOOP_C_4 : begin
        fsm_output = 8'b00111010;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_5;
      end
      COMP_LOOP_6_VEC_LOOP_C_5 : begin
        fsm_output = 8'b00111011;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_6;
      end
      COMP_LOOP_6_VEC_LOOP_C_6 : begin
        fsm_output = 8'b00111100;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_7;
      end
      COMP_LOOP_6_VEC_LOOP_C_7 : begin
        fsm_output = 8'b00111101;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_8;
      end
      COMP_LOOP_6_VEC_LOOP_C_8 : begin
        fsm_output = 8'b00111110;
        if ( COMP_LOOP_6_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_7;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 8'b00111111;
        if ( COMP_LOOP_C_7_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_7_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01000000;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_1;
      end
      COMP_LOOP_7_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01000001;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_2;
      end
      COMP_LOOP_7_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01000010;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_3;
      end
      COMP_LOOP_7_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01000011;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_4;
      end
      COMP_LOOP_7_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01000100;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_5;
      end
      COMP_LOOP_7_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01000101;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_6;
      end
      COMP_LOOP_7_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01000110;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_7;
      end
      COMP_LOOP_7_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01000111;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_8;
      end
      COMP_LOOP_7_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01001000;
        if ( COMP_LOOP_7_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_8;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 8'b01001001;
        if ( COMP_LOOP_C_8_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_8_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01001010;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_1;
      end
      COMP_LOOP_8_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01001011;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_2;
      end
      COMP_LOOP_8_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01001100;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_3;
      end
      COMP_LOOP_8_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01001101;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_4;
      end
      COMP_LOOP_8_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01001110;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_5;
      end
      COMP_LOOP_8_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01001111;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_6;
      end
      COMP_LOOP_8_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01010000;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_7;
      end
      COMP_LOOP_8_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01010001;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_8;
      end
      COMP_LOOP_8_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01010010;
        if ( COMP_LOOP_8_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 8'b01010011;
        if ( COMP_LOOP_C_9_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_9_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01010100;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_1;
      end
      COMP_LOOP_9_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01010101;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_2;
      end
      COMP_LOOP_9_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01010110;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_3;
      end
      COMP_LOOP_9_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01010111;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_4;
      end
      COMP_LOOP_9_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01011000;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_5;
      end
      COMP_LOOP_9_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01011001;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_6;
      end
      COMP_LOOP_9_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01011010;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_7;
      end
      COMP_LOOP_9_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01011011;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_8;
      end
      COMP_LOOP_9_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01011100;
        if ( COMP_LOOP_9_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_10;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 8'b01011101;
        if ( COMP_LOOP_C_10_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_10_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01011110;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_1;
      end
      COMP_LOOP_10_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01011111;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_2;
      end
      COMP_LOOP_10_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01100000;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_3;
      end
      COMP_LOOP_10_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01100001;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_4;
      end
      COMP_LOOP_10_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01100010;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_5;
      end
      COMP_LOOP_10_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01100011;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_6;
      end
      COMP_LOOP_10_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01100100;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_7;
      end
      COMP_LOOP_10_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01100101;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_8;
      end
      COMP_LOOP_10_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01100110;
        if ( COMP_LOOP_10_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_11;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 8'b01100111;
        if ( COMP_LOOP_C_11_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_11_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01101000;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_1;
      end
      COMP_LOOP_11_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01101001;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_2;
      end
      COMP_LOOP_11_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01101010;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_3;
      end
      COMP_LOOP_11_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01101011;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_4;
      end
      COMP_LOOP_11_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01101100;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_5;
      end
      COMP_LOOP_11_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01101101;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_6;
      end
      COMP_LOOP_11_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01101110;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_7;
      end
      COMP_LOOP_11_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01101111;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_8;
      end
      COMP_LOOP_11_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01110000;
        if ( COMP_LOOP_11_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_12;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 8'b01110001;
        if ( COMP_LOOP_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_12_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01110010;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_1;
      end
      COMP_LOOP_12_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01110011;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_2;
      end
      COMP_LOOP_12_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01110100;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_3;
      end
      COMP_LOOP_12_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01110101;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_4;
      end
      COMP_LOOP_12_VEC_LOOP_C_4 : begin
        fsm_output = 8'b01110110;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_5;
      end
      COMP_LOOP_12_VEC_LOOP_C_5 : begin
        fsm_output = 8'b01110111;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_6;
      end
      COMP_LOOP_12_VEC_LOOP_C_6 : begin
        fsm_output = 8'b01111000;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_7;
      end
      COMP_LOOP_12_VEC_LOOP_C_7 : begin
        fsm_output = 8'b01111001;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_8;
      end
      COMP_LOOP_12_VEC_LOOP_C_8 : begin
        fsm_output = 8'b01111010;
        if ( COMP_LOOP_12_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_13;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 8'b01111011;
        if ( COMP_LOOP_C_13_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_13_VEC_LOOP_C_0 : begin
        fsm_output = 8'b01111100;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_1;
      end
      COMP_LOOP_13_VEC_LOOP_C_1 : begin
        fsm_output = 8'b01111101;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_2;
      end
      COMP_LOOP_13_VEC_LOOP_C_2 : begin
        fsm_output = 8'b01111110;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_3;
      end
      COMP_LOOP_13_VEC_LOOP_C_3 : begin
        fsm_output = 8'b01111111;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_4;
      end
      COMP_LOOP_13_VEC_LOOP_C_4 : begin
        fsm_output = 8'b10000000;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_5;
      end
      COMP_LOOP_13_VEC_LOOP_C_5 : begin
        fsm_output = 8'b10000001;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_6;
      end
      COMP_LOOP_13_VEC_LOOP_C_6 : begin
        fsm_output = 8'b10000010;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_7;
      end
      COMP_LOOP_13_VEC_LOOP_C_7 : begin
        fsm_output = 8'b10000011;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_8;
      end
      COMP_LOOP_13_VEC_LOOP_C_8 : begin
        fsm_output = 8'b10000100;
        if ( COMP_LOOP_13_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_14;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 8'b10000101;
        if ( COMP_LOOP_C_14_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_14_VEC_LOOP_C_0 : begin
        fsm_output = 8'b10000110;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_1;
      end
      COMP_LOOP_14_VEC_LOOP_C_1 : begin
        fsm_output = 8'b10000111;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_2;
      end
      COMP_LOOP_14_VEC_LOOP_C_2 : begin
        fsm_output = 8'b10001000;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_3;
      end
      COMP_LOOP_14_VEC_LOOP_C_3 : begin
        fsm_output = 8'b10001001;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_4;
      end
      COMP_LOOP_14_VEC_LOOP_C_4 : begin
        fsm_output = 8'b10001010;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_5;
      end
      COMP_LOOP_14_VEC_LOOP_C_5 : begin
        fsm_output = 8'b10001011;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_6;
      end
      COMP_LOOP_14_VEC_LOOP_C_6 : begin
        fsm_output = 8'b10001100;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_7;
      end
      COMP_LOOP_14_VEC_LOOP_C_7 : begin
        fsm_output = 8'b10001101;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_8;
      end
      COMP_LOOP_14_VEC_LOOP_C_8 : begin
        fsm_output = 8'b10001110;
        if ( COMP_LOOP_14_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_15;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 8'b10001111;
        if ( COMP_LOOP_C_15_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_15_VEC_LOOP_C_0 : begin
        fsm_output = 8'b10010000;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_1;
      end
      COMP_LOOP_15_VEC_LOOP_C_1 : begin
        fsm_output = 8'b10010001;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_2;
      end
      COMP_LOOP_15_VEC_LOOP_C_2 : begin
        fsm_output = 8'b10010010;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_3;
      end
      COMP_LOOP_15_VEC_LOOP_C_3 : begin
        fsm_output = 8'b10010011;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_4;
      end
      COMP_LOOP_15_VEC_LOOP_C_4 : begin
        fsm_output = 8'b10010100;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_5;
      end
      COMP_LOOP_15_VEC_LOOP_C_5 : begin
        fsm_output = 8'b10010101;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_6;
      end
      COMP_LOOP_15_VEC_LOOP_C_6 : begin
        fsm_output = 8'b10010110;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_7;
      end
      COMP_LOOP_15_VEC_LOOP_C_7 : begin
        fsm_output = 8'b10010111;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_8;
      end
      COMP_LOOP_15_VEC_LOOP_C_8 : begin
        fsm_output = 8'b10011000;
        if ( COMP_LOOP_15_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_16;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 8'b10011001;
        if ( COMP_LOOP_C_16_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_16_VEC_LOOP_C_0 : begin
        fsm_output = 8'b10011010;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_1;
      end
      COMP_LOOP_16_VEC_LOOP_C_1 : begin
        fsm_output = 8'b10011011;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_2;
      end
      COMP_LOOP_16_VEC_LOOP_C_2 : begin
        fsm_output = 8'b10011100;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_3;
      end
      COMP_LOOP_16_VEC_LOOP_C_3 : begin
        fsm_output = 8'b10011101;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_4;
      end
      COMP_LOOP_16_VEC_LOOP_C_4 : begin
        fsm_output = 8'b10011110;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_5;
      end
      COMP_LOOP_16_VEC_LOOP_C_5 : begin
        fsm_output = 8'b10011111;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_6;
      end
      COMP_LOOP_16_VEC_LOOP_C_6 : begin
        fsm_output = 8'b10100000;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_7;
      end
      COMP_LOOP_16_VEC_LOOP_C_7 : begin
        fsm_output = 8'b10100001;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_8;
      end
      COMP_LOOP_16_VEC_LOOP_C_8 : begin
        fsm_output = 8'b10100010;
        if ( COMP_LOOP_16_VEC_LOOP_C_8_tr0 ) begin
          state_var_NS = COMP_LOOP_C_17;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 8'b10100011;
        if ( COMP_LOOP_C_17_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 8'b10100100;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 8'b10100101;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 8'b10100110;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 8'b00000000;
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
  clk, rst, twiddle_h_rsci_adra_d, twiddle_h_rsci_qa_d, twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt, twiddle_h_rsci_biwt_1, twiddle_h_rsci_bdwt_2,
      twiddle_h_rsci_adra_d_core_pff, twiddle_h_rsci_adra_d_core_sct_pff
);
  input clk;
  input rst;
  output [23:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [63:0] twiddle_h_rsci_qa_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;
  input twiddle_h_rsci_biwt_1;
  input twiddle_h_rsci_bdwt_2;
  input [23:0] twiddle_h_rsci_adra_d_core_pff;
  input [1:0] twiddle_h_rsci_adra_d_core_sct_pff;


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
  assign twiddle_h_rsci_adra_d = {(twiddle_h_rsci_adra_d_core_pff[23:14]) , (~ (twiddle_h_rsci_adra_d_core_sct_pff[1]))
      , (~ (twiddle_h_rsci_adra_d_core_sct_pff[1])) , (twiddle_h_rsci_adra_d_core_pff[11:0])};
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
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct, twiddle_h_rsci_adra_d_core_sct_pff,
      twiddle_h_rsci_adra_d_core_psct_pff, core_wten_pff, twiddle_h_rsci_oswt_1_pff,
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
  output [1:0] twiddle_h_rsci_adra_d_core_sct_pff;
  input [1:0] twiddle_h_rsci_adra_d_core_psct_pff;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_1_pff;
  input twiddle_h_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_dswt_1_pff;
  wire twiddle_h_rsci_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign twiddle_h_rsci_bdwt_2 = twiddle_h_rsci_oswt_1 & core_wen;
  assign twiddle_h_rsci_biwt_1 = (~ core_wten) & twiddle_h_rsci_oswt_1;
  assign twiddle_h_rsci_adra_d_core_sct_pff = twiddle_h_rsci_adra_d_core_psct_pff
      & ({twiddle_h_rsci_dswt_1_pff , twiddle_h_rsci_dswt_pff});
  assign twiddle_h_rsci_dswt_1_pff = (~ core_wten_pff) & twiddle_h_rsci_oswt_1_pff;
  assign twiddle_h_rsci_dswt_pff = (~ core_wten_pff) & twiddle_h_rsci_oswt_pff;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({twiddle_h_rsci_dswt_1_pff , twiddle_h_rsci_dswt_pff});
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_adra_d, twiddle_rsci_qa_d, twiddle_rsci_qa_d_mxwt, twiddle_rsci_biwt,
      twiddle_rsci_bdwt, twiddle_rsci_biwt_1, twiddle_rsci_bdwt_2, twiddle_rsci_adra_d_core_pff,
      twiddle_rsci_adra_d_core_sct_pff
);
  input clk;
  input rst;
  output [23:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [63:0] twiddle_rsci_qa_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;
  input twiddle_rsci_biwt_1;
  input twiddle_rsci_bdwt_2;
  input [23:0] twiddle_rsci_adra_d_core_pff;
  input [1:0] twiddle_rsci_adra_d_core_sct_pff;


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
  assign twiddle_rsci_adra_d = {(twiddle_rsci_adra_d_core_pff[23:14]) , (~ (twiddle_rsci_adra_d_core_sct_pff[1]))
      , (~ (twiddle_rsci_adra_d_core_sct_pff[1])) , (twiddle_rsci_adra_d_core_pff[11:0])};
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
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct, twiddle_rsci_adra_d_core_sct_pff,
      twiddle_rsci_adra_d_core_psct_pff, core_wten_pff, twiddle_rsci_oswt_1_pff,
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
  output [1:0] twiddle_rsci_adra_d_core_sct_pff;
  input [1:0] twiddle_rsci_adra_d_core_psct_pff;
  input core_wten_pff;
  input twiddle_rsci_oswt_1_pff;
  input twiddle_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsci_dswt_1_pff;
  wire twiddle_rsci_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign twiddle_rsci_bdwt_2 = twiddle_rsci_oswt_1 & core_wen;
  assign twiddle_rsci_biwt_1 = (~ core_wten) & twiddle_rsci_oswt_1;
  assign twiddle_rsci_adra_d_core_sct_pff = twiddle_rsci_adra_d_core_psct_pff & ({twiddle_rsci_dswt_1_pff
      , twiddle_rsci_dswt_pff});
  assign twiddle_rsci_dswt_1_pff = (~ core_wten_pff) & twiddle_rsci_oswt_1_pff;
  assign twiddle_rsci_dswt_pff = (~ core_wten_pff) & twiddle_rsci_oswt_pff;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      & ({twiddle_rsci_dswt_1_pff , twiddle_rsci_dswt_pff});
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
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_oswt_1, twiddle_h_rsci_qa_d_mxwt,
      twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, twiddle_h_rsci_adra_d_core_pff,
      twiddle_h_rsci_adra_d_core_psct_pff, core_wten_pff, twiddle_h_rsci_oswt_1_pff,
      twiddle_h_rsci_oswt_pff
);
  input clk;
  input rst;
  output [23:0] twiddle_h_rsci_adra_d;
  input [63:0] twiddle_h_rsci_qa_d;
  output [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  input twiddle_h_rsci_oswt_1;
  output [63:0] twiddle_h_rsci_qa_d_mxwt;
  input [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [23:0] twiddle_h_rsci_adra_d_core_pff;
  input [1:0] twiddle_h_rsci_adra_d_core_psct_pff;
  input core_wten_pff;
  input twiddle_h_rsci_oswt_1_pff;
  input twiddle_h_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_biwt_1;
  wire twiddle_h_rsci_bdwt_2;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [23:0] twiddle_h_rsci_adra_d_reg;
  wire [1:0] twiddle_h_rsci_adra_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff
      = {(twiddle_h_rsci_adra_d_core_pff[23:14]) , 2'b00 , (twiddle_h_rsci_adra_d_core_pff[11:0])};
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
      .twiddle_h_rsci_adra_d_core_sct_pff(twiddle_h_rsci_adra_d_core_sct_iff),
      .twiddle_h_rsci_adra_d_core_psct_pff(twiddle_h_rsci_adra_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsci_oswt_1_pff(twiddle_h_rsci_oswt_1_pff),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_adra_d(twiddle_h_rsci_adra_d_reg),
      .twiddle_h_rsci_qa_d(twiddle_h_rsci_qa_d),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_biwt_1(twiddle_h_rsci_biwt_1),
      .twiddle_h_rsci_bdwt_2(twiddle_h_rsci_bdwt_2),
      .twiddle_h_rsci_adra_d_core_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst_twiddle_h_rsci_adra_d_core_pff[23:0]),
      .twiddle_h_rsci_adra_d_core_sct_pff(twiddle_h_rsci_adra_d_core_sct_iff)
    );
  assign twiddle_h_rsci_adra_d = twiddle_h_rsci_adra_d_reg;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIT_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIT_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_adra_d, twiddle_rsci_qa_d, twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_oswt_1, twiddle_rsci_qa_d_mxwt,
      twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct, twiddle_rsci_adra_d_core_pff,
      twiddle_rsci_adra_d_core_psct_pff, core_wten_pff, twiddle_rsci_oswt_1_pff,
      twiddle_rsci_oswt_pff
);
  input clk;
  input rst;
  output [23:0] twiddle_rsci_adra_d;
  input [63:0] twiddle_rsci_qa_d;
  output [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  input twiddle_rsci_oswt_1;
  output [63:0] twiddle_rsci_qa_d_mxwt;
  input [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input [23:0] twiddle_rsci_adra_d_core_pff;
  input [1:0] twiddle_rsci_adra_d_core_psct_pff;
  input core_wten_pff;
  input twiddle_rsci_oswt_1_pff;
  input twiddle_rsci_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_biwt_1;
  wire twiddle_rsci_bdwt_2;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [23:0] twiddle_rsci_adra_d_reg;
  wire [1:0] twiddle_rsci_adra_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff
      = {(twiddle_rsci_adra_d_core_pff[23:14]) , 2'b00 , (twiddle_rsci_adra_d_core_pff[11:0])};
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
      .twiddle_rsci_adra_d_core_sct_pff(twiddle_rsci_adra_d_core_sct_iff),
      .twiddle_rsci_adra_d_core_psct_pff(twiddle_rsci_adra_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsci_oswt_1_pff(twiddle_rsci_oswt_1_pff),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff)
    );
  inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_adra_d(twiddle_rsci_adra_d_reg),
      .twiddle_rsci_qa_d(twiddle_rsci_qa_d),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_biwt_1(twiddle_rsci_biwt_1),
      .twiddle_rsci_bdwt_2(twiddle_rsci_bdwt_2),
      .twiddle_rsci_adra_d_core_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst_twiddle_rsci_adra_d_core_pff[23:0]),
      .twiddle_rsci_adra_d_core_sct_pff(twiddle_rsci_adra_d_core_sct_iff)
    );
  assign twiddle_rsci_adra_d = twiddle_rsci_adra_d_reg;
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
  wire [7:0] fsm_output;
  wire or_tmp_7;
  wire nor_tmp_25;
  wire or_dcpl_81;
  wire or_tmp_95;
  wire mux_tmp_128;
  wire mux_tmp_129;
  wire or_tmp_97;
  wire mux_tmp_130;
  wire or_tmp_98;
  wire mux_tmp_148;
  wire mux_tmp_149;
  wire mux_tmp_150;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_26;
  wire and_dcpl_27;
  wire and_dcpl_28;
  wire mux_tmp_157;
  wire or_tmp_115;
  wire or_tmp_118;
  wire mux_tmp_160;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire nor_tmp_31;
  wire mux_tmp_169;
  wire or_tmp_125;
  wire mux_tmp_171;
  wire mux_tmp_172;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire and_dcpl_35;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire mux_tmp_175;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_44;
  wire and_dcpl_48;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_54;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_57;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_65;
  wire and_dcpl_66;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_69;
  wire and_dcpl_70;
  wire and_dcpl_71;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_81;
  wire or_tmp_138;
  wire or_tmp_149;
  wire or_tmp_151;
  wire or_tmp_153;
  wire or_tmp_169;
  wire not_tmp_100;
  wire or_tmp_170;
  wire mux_tmp_212;
  wire and_dcpl_89;
  wire not_tmp_102;
  wire and_dcpl_92;
  wire nor_tmp_34;
  wire or_tmp_185;
  wire mux_tmp_222;
  wire mux_tmp_224;
  wire and_dcpl_99;
  wire mux_tmp_232;
  wire mux_tmp_235;
  wire and_dcpl_102;
  wire and_dcpl_103;
  wire and_dcpl_105;
  wire and_dcpl_106;
  wire and_dcpl_114;
  wire and_dcpl_116;
  wire or_tmp_203;
  wire mux_tmp_242;
  wire and_dcpl_134;
  wire mux_tmp_264;
  wire mux_tmp_265;
  wire or_tmp_231;
  wire mux_tmp_273;
  wire mux_tmp_276;
  wire mux_tmp_277;
  wire and_dcpl_136;
  wire or_tmp_243;
  wire mux_tmp_288;
  wire or_tmp_255;
  wire mux_tmp_299;
  wire mux_tmp_305;
  wire mux_tmp_306;
  wire mux_tmp_308;
  wire mux_tmp_309;
  wire or_tmp_261;
  wire mux_tmp_317;
  wire mux_tmp_318;
  wire nor_tmp_42;
  wire mux_tmp_321;
  wire mux_tmp_325;
  wire mux_tmp_328;
  wire mux_tmp_337;
  wire mux_tmp_354;
  wire mux_tmp_359;
  wire and_dcpl_145;
  wire or_tmp_282;
  wire or_tmp_283;
  wire or_tmp_294;
  wire mux_tmp_386;
  wire mux_tmp_387;
  wire mux_tmp_391;
  wire and_dcpl_152;
  wire mux_tmp_413;
  wire and_dcpl_153;
  wire or_tmp_315;
  wire mux_tmp_422;
  wire mux_tmp_429;
  wire or_tmp_322;
  wire mux_tmp_430;
  wire or_tmp_352;
  wire mux_tmp_466;
  wire mux_tmp_467;
  wire not_tmp_195;
  wire mux_tmp_475;
  reg COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  reg [11:0] VEC_LOOP_acc_1_cse_10_sva;
  reg [12:0] STAGE_LOOP_lshift_psp_sva;
  reg [12:0] VEC_LOOP_j_10_12_0_sva_1;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  wire or_229_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_twiddle_rsci_oswt_1_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_2_cse;
  wire or_169_cse;
  wire or_166_cse;
  wire or_164_cse;
  wire or_222_cse;
  wire or_223_cse;
  wire or_476_cse;
  wire or_249_cse;
  wire or_54_cse;
  wire mux_119_cse;
  wire or_435_cse;
  wire or_243_cse;
  wire or_319_cse;
  wire or_463_cse;
  wire or_136_cse;
  wire or_473_cse;
  wire or_308_cse;
  wire or_309_cse;
  wire nor_70_cse;
  wire or_256_cse;
  wire or_254_cse;
  wire or_224_cse;
  wire mux_142_cse;
  wire mux_485_cse;
  wire mux_484_cse;
  wire mux_158_cse;
  wire or_322_cse;
  wire or_485_cse;
  wire or_482_cse;
  wire mux_152_cse;
  wire mux_162_cse;
  wire nand_3_cse;
  wire or_195_cse;
  wire or_204_cse;
  wire mux_259_cse;
  wire mux_163_cse;
  wire mux_257_cse;
  wire nor_118_cse;
  wire mux_260_cse;
  wire [31:0] vec_rsci_da_d_reg;
  wire [1:0] vec_rsci_wea_d_reg;
  wire core_wten_iff;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [1:0] vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  wire [23:0] twiddle_rsci_adra_d_reg;
  wire [7:0] COMP_LOOP_twiddle_f_mux1h_44_rmff;
  wire COMP_LOOP_twiddle_f_and_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_29_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_57_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_66_rmff;
  wire and_101_rmff;
  wire nor_114_rmff;
  wire [1:0] twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [23:0] twiddle_h_rsci_adra_d_reg;
  wire [1:0] twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_138_rmff;
  reg [31:0] factor1_1_sva;
  reg [31:0] VEC_LOOP_mult_vec_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_f_9_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_9_sva;
  reg [7:0] VEC_LOOP_acc_psp_sva;
  reg [11:0] VEC_LOOP_acc_10_cse_1_sva;
  reg [8:0] COMP_LOOP_9_twiddle_f_mul_psp_sva;
  reg [31:0] p_sva;
  wire mux_147_itm;
  wire mux_261_itm;
  wire mux_285_itm;
  wire [12:0] STAGE_LOOP_lshift_itm;
  wire [8:0] COMP_LOOP_9_twiddle_f_lshift_itm;
  wire mux_219_itm;
  wire [9:0] z_out;
  wire and_dcpl_169;
  wire and_dcpl_171;
  wire and_dcpl_172;
  wire and_dcpl_173;
  wire and_dcpl_174;
  wire and_dcpl_175;
  wire and_dcpl_176;
  wire and_dcpl_177;
  wire and_dcpl_181;
  wire and_dcpl_184;
  wire and_dcpl_186;
  wire and_dcpl_187;
  wire and_dcpl_188;
  wire and_dcpl_189;
  wire and_dcpl_192;
  wire and_dcpl_196;
  wire and_dcpl_198;
  wire and_dcpl_199;
  wire and_dcpl_200;
  wire [11:0] z_out_1;
  wire [23:0] nl_z_out_1;
  wire and_dcpl_202;
  wire and_dcpl_203;
  wire and_dcpl_204;
  wire and_dcpl_205;
  wire and_dcpl_207;
  wire and_dcpl_210;
  wire and_dcpl_213;
  wire and_dcpl_215;
  wire and_dcpl_216;
  wire and_dcpl_217;
  wire and_dcpl_220;
  wire and_dcpl_224;
  wire and_dcpl_228;
  wire and_dcpl_229;
  wire and_dcpl_230;
  wire [11:0] z_out_2;
  wire [23:0] nl_z_out_2;
  wire or_tmp_379;
  wire mux_tmp_497;
  wire not_tmp_233;
  wire and_dcpl_232;
  wire and_dcpl_234;
  wire and_dcpl_237;
  wire and_dcpl_238;
  wire and_dcpl_241;
  wire and_dcpl_242;
  wire and_dcpl_243;
  wire and_dcpl_247;
  wire and_dcpl_249;
  wire and_dcpl_251;
  wire and_dcpl_252;
  wire and_dcpl_254;
  wire and_dcpl_257;
  wire and_dcpl_259;
  wire and_dcpl_262;
  wire and_dcpl_264;
  wire and_dcpl_266;
  wire and_dcpl_268;
  wire [12:0] z_out_3;
  wire and_dcpl_282;
  wire and_dcpl_295;
  wire [11:0] z_out_5;
  wire [12:0] nl_z_out_5;
  wire and_dcpl_298;
  wire and_dcpl_305;
  wire and_dcpl_306;
  wire and_dcpl_310;
  wire and_dcpl_311;
  wire and_dcpl_312;
  wire and_dcpl_314;
  wire and_dcpl_316;
  wire and_dcpl_321;
  wire and_dcpl_323;
  wire and_dcpl_325;
  wire and_dcpl_331;
  wire and_dcpl_334;
  wire and_dcpl_337;
  wire [11:0] z_out_6;
  wire [12:0] nl_z_out_6;
  wire [11:0] z_out_10;
  wire [12:0] nl_z_out_10;
  wire [11:0] z_out_11;
  wire [12:0] nl_z_out_11;
  wire or_tmp_386;
  wire mux_tmp_507;
  wire mux_tmp_508;
  wire mux_tmp_509;
  wire and_dcpl_462;
  wire [31:0] z_out_15;
  wire and_dcpl_465;
  wire and_dcpl_469;
  wire and_dcpl_473;
  wire and_dcpl_478;
  wire and_dcpl_481;
  wire and_dcpl_483;
  wire and_dcpl_486;
  wire and_dcpl_488;
  wire [9:0] z_out_16;
  wire [8:0] z_out_17;
  wire [9:0] nl_z_out_17;
  wire and_dcpl_505;
  wire and_dcpl_509;
  wire and_dcpl_515;
  wire and_dcpl_518;
  wire and_dcpl_521;
  wire and_dcpl_523;
  wire and_dcpl_526;
  wire and_dcpl_528;
  wire [10:0] z_out_18;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_twiddle_f_acc_cse_sva;
  reg [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  reg [10:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  reg [9:0] COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  reg [7:0] COMP_LOOP_k_12_4_sva_7_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [3:0] STAGE_LOOP_i_3_0_sva_2;
  wire [4:0] nl_STAGE_LOOP_i_3_0_sva_2;
  wire [3:0] COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
  wire [4:0] nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
  wire [11:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  wire VEC_LOOP_acc_1_cse_10_sva_mx0c2;
  wire [10:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
  wire COMP_LOOP_twiddle_f_or_6_cse;
  wire COMP_LOOP_twiddle_f_or_11_cse;
  wire COMP_LOOP_twiddle_f_or_15_cse;
  wire VEC_LOOP_or_9_cse;
  wire VEC_LOOP_or_10_cse;
  wire VEC_LOOP_or_11_cse;
  wire VEC_LOOP_or_50_cse;
  wire VEC_LOOP_or_51_cse;
  wire VEC_LOOP_or_52_cse;
  wire VEC_LOOP_or_53_cse;
  wire VEC_LOOP_or_54_cse;
  wire VEC_LOOP_or_55_cse;
  wire and_172_cse;
  wire and_193_cse;
  wire mux_tmp;
  wire not_tmp;
  wire nor_tmp_55;
  wire or_tmp_403;
  wire [10:0] VEC_LOOP_VEC_LOOP_mux_2_rgt;
  reg VEC_LOOP_acc_11_psp_sva_10;
  reg [9:0] VEC_LOOP_acc_11_psp_sva_9_0;
  wire nor_62_cse;
  wire nor_55_cse_1;
  wire or_526_cse;
  wire or_512_cse;
  wire nor_182_cse;
  wire nor_178_cse;
  wire and_169_cse;
  wire COMP_LOOP_twiddle_help_and_itm;
  wire COMP_LOOP_twiddle_f_or_18_itm;
  wire COMP_LOOP_twiddle_f_nor_5_itm;
  wire COMP_LOOP_twiddle_f_or_20_itm;
  wire COMP_LOOP_twiddle_f_or_1_itm;
  wire VEC_LOOP_or_62_itm;
  wire and_354_itm;
  wire and_371_itm;
  wire and_380_itm;
  wire and_388_itm;
  wire VEC_LOOP_or_59_itm;
  wire VEC_LOOP_or_68_itm;
  wire VEC_LOOP_or_71_itm;
  wire VEC_LOOP_nor_10_itm;
  wire STAGE_LOOP_acc_itm_4_1;
  wire [8:0] z_out_4_20_12;
  wire [11:0] acc_4_cse_12_1;
  wire [12:0] nl_acc_4_cse_12_1;
  wire VEC_LOOP_or_83_cse;

  wire[0:0] mux_146_nl;
  wire[0:0] mux_145_nl;
  wire[0:0] mux_144_nl;
  wire[0:0] mux_143_nl;
  wire[0:0] or_186_nl;
  wire[0:0] or_185_nl;
  wire[0:0] mux_141_nl;
  wire[0:0] mux_140_nl;
  wire[0:0] mux_139_nl;
  wire[0:0] mux_138_nl;
  wire[0:0] mux_137_nl;
  wire[0:0] mux_136_nl;
  wire[0:0] mux_135_nl;
  wire[0:0] mux_134_nl;
  wire[0:0] mux_133_nl;
  wire[0:0] mux_132_nl;
  wire[0:0] mux_131_nl;
  wire[0:0] or_177_nl;
  wire[0:0] nand_2_nl;
  wire[0:0] mux_151_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] or_191_nl;
  wire[0:0] mux_154_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] mux_156_nl;
  wire[0:0] mux_155_nl;
  wire[0:0] mux_153_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] or_275_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] nor_72_nl;
  wire[0:0] mux_228_nl;
  wire[0:0] or_272_nl;
  wire[0:0] mux_227_nl;
  wire[0:0] mux_226_nl;
  wire[0:0] mux_225_nl;
  wire[0:0] nand_31_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_14_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] nor_69_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] or_280_nl;
  wire[0:0] or_278_nl;
  wire[0:0] or_277_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_29_nl;
  wire[7:0] COMP_LOOP_1_twiddle_f_mul_nl;
  wire[15:0] nl_COMP_LOOP_1_twiddle_f_mul_nl;
  wire[0:0] and_123_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_57_nl;
  wire[0:0] mux_241_nl;
  wire[0:0] or_288_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] or_286_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl;
  wire[0:0] mux_246_nl;
  wire[0:0] mux_245_nl;
  wire[0:0] nand_30_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] nor_65_nl;
  wire[0:0] nor_66_nl;
  wire[0:0] or_489_nl;
  wire[0:0] mux_243_nl;
  wire[0:0] or_481_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] or_490_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] nand_9_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] or_312_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] or_311_nl;
  wire[0:0] mux_267_nl;
  wire[0:0] or_310_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] mux_283_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] mux_281_nl;
  wire[0:0] or_323_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] mux_279_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] nand_22_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] COMP_LOOP_k_not_nl;
  wire[0:0] mux_519_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] mux_517_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] mux_304_nl;
  wire[0:0] mux_303_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] or_492_nl;
  wire[0:0] or_493_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] mux_312_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] mux_310_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_353_nl;
  wire[0:0] mux_352_nl;
  wire[0:0] mux_351_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] mux_343_nl;
  wire[0:0] or_353_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] mux_340_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] or_487_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_336_nl;
  wire[0:0] mux_335_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] mux_329_nl;
  wire[0:0] or_350_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] mux_324_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] mux_319_nl;
  wire[0:0] mux_364_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] nand_10_nl;
  wire[0:0] mux_362_nl;
  wire[0:0] or_368_nl;
  wire[0:0] mux_361_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] or_363_nl;
  wire[0:0] or_362_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] or_361_nl;
  wire[0:0] mux_357_nl;
  wire[0:0] or_360_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] or_359_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] or_355_nl;
  wire[31:0] VEC_LOOP_mux1h_10_nl;
  wire[0:0] nor_141_nl;
  wire[0:0] COMP_LOOP_twiddle_f_not_1_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] mux_379_nl;
  wire[0:0] or_380_nl;
  wire[0:0] mux_378_nl;
  wire[0:0] mux_377_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] or_378_nl;
  wire[0:0] mux_375_nl;
  wire[0:0] or_376_nl;
  wire[0:0] mux_374_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] and_171_nl;
  wire[0:0] or_371_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] mux_524_nl;
  wire[0:0] mux_523_nl;
  wire[0:0] nor_181_nl;
  wire[0:0] mux_522_nl;
  wire[0:0] mux_521_nl;
  wire[0:0] mux_520_nl;
  wire[0:0] or_516_nl;
  wire[0:0] VEC_LOOP_or_48_nl;
  wire[0:0] VEC_LOOP_or_49_nl;
  wire[0:0] mux_411_nl;
  wire[0:0] mux_410_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] mux_392_nl;
  wire[0:0] mux_388_nl;
  wire[0:0] mux_385_nl;
  wire[0:0] and_160_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] mux_423_nl;
  wire[0:0] mux_421_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_3_nl;
  wire[0:0] VEC_LOOP_not_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] mux_472_nl;
  wire[0:0] mux_471_nl;
  wire[0:0] mux_470_nl;
  wire[0:0] or_453_nl;
  wire[0:0] mux_469_nl;
  wire[0:0] or_452_nl;
  wire[0:0] mux_468_nl;
  wire[0:0] or_451_nl;
  wire[0:0] mux_479_nl;
  wire[0:0] mux_478_nl;
  wire[0:0] mux_477_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_474_nl;
  wire[0:0] nor_57_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_481_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] and_164_nl;
  wire[0:0] nor_56_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] or_527_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] nor_180_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] or_523_nl;
  wire[0:0] or_522_nl;
  wire[0:0] mux_537_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] mux_535_nl;
  wire[0:0] nor_174_nl;
  wire[0:0] mux_534_nl;
  wire[0:0] nor_176_nl;
  wire[0:0] mux_533_nl;
  wire[0:0] nor_177_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] or_190_nl;
  wire[0:0] or_438_nl;
  wire[0:0] mux_159_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] mux_174_nl;
  wire[0:0] mux_173_nl;
  wire[0:0] mux_170_nl;
  wire[0:0] or_207_nl;
  wire[0:0] mux_168_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] or_213_nl;
  wire[0:0] mux_176_nl;
  wire[0:0] or_211_nl;
  wire[0:0] mux_177_nl;
  wire[0:0] nand_32_nl;
  wire[0:0] or_88_nl;
  wire[0:0] mux_178_nl;
  wire[0:0] or_494_nl;
  wire[0:0] or_495_nl;
  wire[0:0] mux_189_nl;
  wire[0:0] mux_218_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] mux_216_nl;
  wire[0:0] or_260_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] or_259_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] mux_213_nl;
  wire[0:0] or_257_nl;
  wire[0:0] mux_211_nl;
  wire[0:0] mux_210_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] and_179_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] nor_73_nl;
  wire[0:0] nand_6_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] or_267_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] and_102_nl;
  wire[0:0] mux_263_nl;
  wire[0:0] or_307_nl;
  wire[0:0] or_305_nl;
  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] or_314_nl;
  wire[0:0] or_325_nl;
  wire[0:0] mux_298_nl;
  wire[0:0] or_366_nl;
  wire[0:0] nand_29_nl;
  wire[0:0] or_403_nl;
  wire[0:0] mux_420_nl;
  wire[0:0] mux_419_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] or_469_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_3_nl;
  wire[0:0] or_7_nl;
  wire[0:0] or_24_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] mux_435_nl;
  wire[0:0] mux_434_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] mux_431_nl;
  wire[0:0] nand_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] mux_443_nl;
  wire[0:0] or_429_nl;
  wire[8:0] VEC_LOOP_mux1h_8_nl;
  wire[0:0] VEC_LOOP_mux1h_6_nl;
  wire[0:0] VEC_LOOP_mux1h_4_nl;
  wire[0:0] and_84_nl;
  wire[0:0] VEC_LOOP_mux1h_2_nl;
  wire[0:0] and_82_nl;
  wire[0:0] mux_180_nl;
  wire[0:0] mux_179_nl;
  wire[7:0] VEC_LOOP_mux1h_nl;
  wire[0:0] and_29_nl;
  wire[0:0] VEC_LOOP_mux1h_1_nl;
  wire[0:0] VEC_LOOP_mux1h_3_nl;
  wire[0:0] nor_117_nl;
  wire[0:0] mux_188_nl;
  wire[0:0] mux_187_nl;
  wire[0:0] mux_186_nl;
  wire[0:0] or_227_nl;
  wire[0:0] mux_185_nl;
  wire[0:0] mux_184_nl;
  wire[0:0] mux_183_nl;
  wire[0:0] mux_182_nl;
  wire[0:0] mux_181_nl;
  wire[0:0] or_219_nl;
  wire[0:0] VEC_LOOP_mux1h_5_nl;
  wire[0:0] nor_116_nl;
  wire[0:0] mux_197_nl;
  wire[0:0] mux_196_nl;
  wire[0:0] mux_195_nl;
  wire[0:0] mux_194_nl;
  wire[0:0] or_239_nl;
  wire[0:0] mux_193_nl;
  wire[0:0] or_238_nl;
  wire[0:0] mux_192_nl;
  wire[0:0] mux_191_nl;
  wire[0:0] or_233_nl;
  wire[0:0] mux_190_nl;
  wire[0:0] VEC_LOOP_mux1h_7_nl;
  wire[0:0] nor_115_nl;
  wire[0:0] mux_209_nl;
  wire[0:0] mux_208_nl;
  wire[0:0] mux_207_nl;
  wire[0:0] mux_206_nl;
  wire[0:0] or_251_nl;
  wire[0:0] nand_5_nl;
  wire[0:0] mux_205_nl;
  wire[0:0] mux_204_nl;
  wire[0:0] mux_203_nl;
  wire[0:0] mux_202_nl;
  wire[0:0] mux_200_nl;
  wire[0:0] or_245_nl;
  wire[0:0] mux_199_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] mux_515_nl;
  wire[0:0] or_498_nl;
  wire[0:0] or_497_nl;
  wire[0:0] mux_506_nl;
  wire[0:0] mux_505_nl;
  wire[0:0] or_nl;
  wire[0:0] nand_36_nl;
  wire[0:0] or_502_nl;
  wire[0:0] or_505_nl;
  wire[0:0] or_507_nl;
  wire[0:0] or_506_nl;
  wire[0:0] mux_514_nl;
  wire[0:0] mux_513_nl;
  wire[0:0] mux_512_nl;
  wire[0:0] nand_34_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] or_508_nl;
  wire[0:0] or_513_nl;
  wire[11:0] COMP_LOOP_twiddle_f_mux1h_166_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_30_nl;
  wire[1:0] COMP_LOOP_twiddle_f_and_16_nl;
  wire[1:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl;
  wire[0:0] COMP_LOOP_twiddle_f_nor_9_nl;
  wire[5:0] COMP_LOOP_twiddle_f_mux1h_167_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_31_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_32_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl;
  wire[10:0] COMP_LOOP_twiddle_f_mux1h_168_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_19_nl;
  wire[6:0] COMP_LOOP_twiddle_f_mux1h_169_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_33_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl;
  wire[13:0] acc_nl;
  wire[14:0] nl_acc_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_12_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_mux_9_nl;
  wire[0:0] VEC_LOOP_or_75_nl;
  wire[0:0] mux_538_nl;
  wire[0:0] mux_539_nl;
  wire[0:0] or_534_nl;
  wire[0:0] mux_540_nl;
  wire[0:0] nand_41_nl;
  wire[0:0] mux_541_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] or_535_nl;
  wire[0:0] mux_543_nl;
  wire[0:0] and_593_nl;
  wire[7:0] VEC_LOOP_VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_13_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_14_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_16_nl;
  wire[21:0] acc_1_nl;
  wire[22:0] nl_acc_1_nl;
  wire[19:0] VEC_LOOP_mux_17_nl;
  wire[0:0] VEC_LOOP_or_76_nl;
  wire[11:0] VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl;
  wire[11:0] VEC_LOOP_mux_18_nl;
  wire[11:0] VEC_LOOP_mux_19_nl;
  wire[3:0] VEC_LOOP_or_77_nl;
  wire[3:0] VEC_LOOP_mux1h_33_nl;
  wire[0:0] and_594_nl;
  wire[0:0] and_595_nl;
  wire[0:0] and_596_nl;
  wire[0:0] and_597_nl;
  wire[0:0] and_598_nl;
  wire[0:0] and_599_nl;
  wire[0:0] and_600_nl;
  wire[0:0] and_601_nl;
  wire[0:0] and_602_nl;
  wire[0:0] and_603_nl;
  wire[2:0] VEC_LOOP_or_78_nl;
  wire[2:0] VEC_LOOP_nor_18_nl;
  wire[2:0] VEC_LOOP_mux1h_34_nl;
  wire[0:0] and_604_nl;
  wire[0:0] and_605_nl;
  wire[0:0] and_606_nl;
  wire[0:0] and_607_nl;
  wire[11:0] VEC_LOOP_mux_20_nl;
  wire[8:0] VEC_LOOP_acc_36_nl;
  wire[9:0] nl_VEC_LOOP_acc_36_nl;
  wire[0:0] and_608_nl;
  wire[32:0] acc_12_nl;
  wire[33:0] nl_acc_12_nl;
  wire[31:0] VEC_LOOP_mux_21_nl;
  wire[0:0] VEC_LOOP_or_79_nl;
  wire[31:0] VEC_LOOP_mux_22_nl;
  wire[10:0] acc_13_nl;
  wire[11:0] nl_acc_13_nl;
  wire[9:0] VEC_LOOP_mux1h_35_nl;
  wire[0:0] VEC_LOOP_or_80_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_1_nl;
  wire[0:0] VEC_LOOP_and_20_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_11_nl;
  wire[5:0] VEC_LOOP_mux1h_36_nl;
  wire[0:0] VEC_LOOP_or_81_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_17_nl;
  wire[0:0] VEC_LOOP_mux_23_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_18_nl;
  wire[7:0] VEC_LOOP_mux_24_nl;
  wire[11:0] acc_15_nl;
  wire[12:0] nl_acc_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_19_nl;
  wire[9:0] VEC_LOOP_VEC_LOOP_mux_12_nl;
  wire[0:0] VEC_LOOP_or_82_nl;
  wire[0:0] VEC_LOOP_and_23_nl;
  wire[6:0] VEC_LOOP_VEC_LOOP_mux_13_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_20_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_21_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_22_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = z_out_15;
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
      COMP_LOOP_twiddle_f_9_sva, and_dcpl_136);
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = MUX_v_32_2_2(COMP_LOOP_twiddle_help_1_sva,
      COMP_LOOP_twiddle_help_9_sva, and_dcpl_136);
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire[0:0] mux_294_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] or_332_nl;
  wire[0:0] or_331_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_330_nl;
  wire[0:0] mux_289_nl;
  wire[0:0] or_329_nl;
  wire [0:0] nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  assign or_332_nl = (~ (fsm_output[6])) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_331_nl = (fsm_output[6]) | (~ mux_tmp_148);
  assign mux_291_nl = MUX_s_1_2_2(or_332_nl, or_331_nl, fsm_output[7]);
  assign mux_292_nl = MUX_s_1_2_2(mux_291_nl, or_tmp_243, fsm_output[5]);
  assign mux_293_nl = MUX_s_1_2_2(mux_tmp_288, mux_292_nl, fsm_output[3]);
  assign or_329_nl = (fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[4]));
  assign mux_289_nl = MUX_s_1_2_2((~ mux_tmp_149), or_329_nl, fsm_output[7]);
  assign or_330_nl = (fsm_output[5]) | mux_289_nl;
  assign mux_290_nl = MUX_s_1_2_2(or_330_nl, mux_tmp_288, fsm_output[3]);
  assign mux_294_nl = MUX_s_1_2_2(mux_293_nl, mux_290_nl, fsm_output[1]);
  assign nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat = ~(mux_294_nl | (fsm_output[0]));
  wire[0:0] and_220_nl;
  wire [3:0] nl_COMP_LOOP_1_twiddle_f_lshift_rg_s;
  assign and_220_nl = (fsm_output==8'b00100000);
  assign nl_COMP_LOOP_1_twiddle_f_lshift_rg_s = MUX_v_4_2_2(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0,
      COMP_LOOP_1_twiddle_f_acc_cse_sva, and_220_nl);
  wire[31:0] VEC_LOOP_mux1h_9_nl;
  wire[0:0] nor_132_nl;
  wire[0:0] and_88_nl;
  wire[0:0] and_90_nl;
  wire[0:0] and_93_nl;
  wire [63:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core;
  assign nor_132_nl = ~(mux_260_cse | (fsm_output[0]));
  assign and_88_nl = (~ mux_219_itm) & (fsm_output[0]);
  assign and_90_nl = not_tmp_102 & and_dcpl_89;
  assign and_93_nl = and_dcpl_59 & and_dcpl_92;
  assign VEC_LOOP_mux1h_9_nl = MUX1HOT_v_32_4_2(COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      COMP_LOOP_twiddle_f_9_sva, VEC_LOOP_mult_vec_1_sva, COMP_LOOP_twiddle_f_1_sva,
      {nor_132_nl , and_88_nl , and_90_nl , and_93_nl});
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_da_d_core = {32'b00000000000000000000000000000000
      , VEC_LOOP_mux1h_9_nl};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_wea_d_core_psct
      = {1'b0 , (~ mux_260_cse)};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {nor_118_cse , nor_118_cse};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_core_psct
      = {1'b0 , (~ mux_260_cse)};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_pff = ~ mux_147_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro = ~ mux_261_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2;
  assign nl_inPlaceNTT_DIT_precomp_core_wait_dp_inst_ensig_cgo_iro_2 = ~ mux_285_itm;
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_101_rmff , nor_114_rmff};
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff
      = {(z_out_1[9:0]) , 2'b00 , COMP_LOOP_twiddle_f_mux1h_44_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_29_rmff , COMP_LOOP_twiddle_f_mux1h_57_rmff , COMP_LOOP_twiddle_f_mux1h_66_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff
      = {and_101_rmff , nor_114_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {and_101_rmff , nor_114_rmff};
  wire [23:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff
      = {(z_out_1[9:0]) , 2'b00 , COMP_LOOP_twiddle_f_mux1h_44_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_29_rmff , COMP_LOOP_twiddle_f_mux1h_57_rmff , COMP_LOOP_twiddle_f_mux1h_66_rmff};
  wire [1:0] nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff;
  assign nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff
      = {and_101_rmff , nor_114_rmff};
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_8_tr0
      = ~ COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_18[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire[12:0] COMP_LOOP_6_acc_nl;
  wire[13:0] nl_COMP_LOOP_6_acc_nl;
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0;
  assign nl_COMP_LOOP_6_acc_nl = ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[12:1]))})
      + conv_u2s_12_13({COMP_LOOP_k_12_4_sva_7_0 , 4'b0101}) + 13'b0000000000001;
  assign COMP_LOOP_6_acc_nl = nl_COMP_LOOP_6_acc_nl[12:0];
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 = ~ (readslicef_13_1_12(COMP_LOOP_6_acc_nl));
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 = ~ (z_out_16[9]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 = ~ (z_out_18[10]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 = ~ (z_out_3[12]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 = ~ (z_out_16[8]);
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0
      = VEC_LOOP_j_10_12_0_sva_1[12];
  wire [0:0] nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0;
  assign nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 = ~ (z_out_4_20_12[0]);
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
      .ccs_ccore_start_rsc_dat(and_138_rmff),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(and_138_rmff),
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
  .width_z(32'sd13)) STAGE_LOOP_lshift_rg (
      .a(1'b1),
      .s(STAGE_LOOP_i_3_0_sva),
      .z(STAGE_LOOP_lshift_itm)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd9)) COMP_LOOP_9_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0),
      .z(COMP_LOOP_9_twiddle_f_lshift_itm)
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
  .width_z(32'sd10)) COMP_LOOP_1_twiddle_f_lshift_rg (
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
      .vec_rsci_oswt_1_pff(nor_118_cse)
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
      .twiddle_rsci_oswt_1(reg_twiddle_rsci_oswt_1_cse),
      .twiddle_rsci_qa_d_mxwt(twiddle_rsci_qa_d_mxwt),
      .twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsci_adra_d_core_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_pff[23:0]),
      .twiddle_rsci_adra_d_core_psct_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_rsci_1_inst_twiddle_rsci_adra_d_core_psct_pff[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsci_oswt_1_pff(and_101_rmff),
      .twiddle_rsci_oswt_pff(nor_114_rmff)
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
      .twiddle_h_rsci_oswt_1(reg_twiddle_rsci_oswt_1_cse),
      .twiddle_h_rsci_qa_d_mxwt(twiddle_h_rsci_qa_d_mxwt),
      .twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsci_adra_d_core_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_pff[23:0]),
      .twiddle_h_rsci_adra_d_core_psct_pff(nl_inPlaceNTT_DIT_precomp_core_twiddle_h_rsci_1_inst_twiddle_h_rsci_adra_d_core_psct_pff[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsci_oswt_1_pff(and_101_rmff),
      .twiddle_h_rsci_oswt_pff(nor_114_rmff)
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
      .COMP_LOOP_9_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_10_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0[0:0]),
      .COMP_LOOP_10_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_11_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0[0:0]),
      .COMP_LOOP_11_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_12_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0[0:0]),
      .COMP_LOOP_12_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_13_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0[0:0]),
      .COMP_LOOP_13_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_14_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0[0:0]),
      .COMP_LOOP_14_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_15_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0[0:0]),
      .COMP_LOOP_15_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_16_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0[0:0]),
      .COMP_LOOP_16_VEC_LOOP_C_8_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_C_17_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIT_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign mux_142_cse = MUX_s_1_2_2(or_243_cse, or_54_cse, fsm_output[2]);
  assign or_186_nl = (fsm_output[0]) | (~ (fsm_output[6])) | (fsm_output[7]);
  assign mux_143_nl = MUX_s_1_2_2(or_186_nl, or_tmp_97, fsm_output[2]);
  assign mux_144_nl = MUX_s_1_2_2(mux_143_nl, mux_tmp_129, fsm_output[4]);
  assign or_185_nl = (fsm_output[4]) | mux_142_cse;
  assign mux_145_nl = MUX_s_1_2_2(mux_144_nl, or_185_nl, fsm_output[5]);
  assign mux_140_nl = MUX_s_1_2_2(or_435_cse, or_tmp_98, fsm_output[4]);
  assign mux_138_nl = MUX_s_1_2_2(or_54_cse, or_tmp_95, fsm_output[2]);
  assign mux_139_nl = MUX_s_1_2_2(mux_tmp_130, mux_138_nl, fsm_output[4]);
  assign mux_141_nl = MUX_s_1_2_2(mux_140_nl, mux_139_nl, fsm_output[5]);
  assign mux_146_nl = MUX_s_1_2_2(mux_145_nl, mux_141_nl, fsm_output[3]);
  assign mux_134_nl = MUX_s_1_2_2(or_243_cse, mux_tmp_128, fsm_output[2]);
  assign mux_135_nl = MUX_s_1_2_2(mux_134_nl, or_435_cse, fsm_output[4]);
  assign mux_133_nl = MUX_s_1_2_2(or_tmp_98, mux_tmp_130, fsm_output[4]);
  assign mux_136_nl = MUX_s_1_2_2(mux_135_nl, mux_133_nl, fsm_output[5]);
  assign mux_131_nl = MUX_s_1_2_2(mux_tmp_130, mux_tmp_129, fsm_output[4]);
  assign or_177_nl = (fsm_output[4]) | (~ (fsm_output[2])) | (~ (fsm_output[6]))
      | (fsm_output[7]);
  assign mux_132_nl = MUX_s_1_2_2(mux_131_nl, or_177_nl, fsm_output[5]);
  assign mux_137_nl = MUX_s_1_2_2(mux_136_nl, mux_132_nl, fsm_output[3]);
  assign mux_147_itm = MUX_s_1_2_2(mux_146_nl, mux_137_nl, fsm_output[1]);
  assign nor_84_nl = ~((fsm_output[2]) | (~ (fsm_output[4])));
  assign mux_151_nl = MUX_s_1_2_2(mux_tmp_148, nor_84_nl, fsm_output[6]);
  assign nand_2_nl = ~((fsm_output[5]) & mux_151_nl);
  assign or_191_nl = (fsm_output[5]) | (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign mux_152_cse = MUX_s_1_2_2(nand_2_nl, or_191_nl, fsm_output[7]);
  assign nor_83_nl = ~((fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[4])));
  assign mux_154_nl = MUX_s_1_2_2(nor_83_nl, mux_tmp_149, fsm_output[5]);
  assign or_195_cse = (fsm_output[7]) | (~ mux_154_nl);
  assign mux_155_nl = MUX_s_1_2_2(mux_tmp_150, or_195_cse, fsm_output[3]);
  assign mux_153_nl = MUX_s_1_2_2(mux_152_cse, mux_tmp_150, fsm_output[3]);
  assign mux_156_nl = MUX_s_1_2_2(mux_155_nl, mux_153_nl, fsm_output[1]);
  assign nor_118_cse = ~(mux_156_nl | (fsm_output[0]));
  assign or_222_cse = (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[4]);
  assign or_223_cse = (fsm_output[7]) | (~ (fsm_output[4]));
  assign or_224_cse = (fsm_output[7]) | (fsm_output[4]);
  assign or_229_cse = (fsm_output[7:4]!=4'b0101);
  assign or_249_cse = (fsm_output[7:6]!=2'b00);
  assign or_243_cse = (fsm_output[7:6]!=2'b10);
  assign nor_72_nl = ~((~ (fsm_output[2])) | COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm
      | (fsm_output[4]));
  assign mux_229_nl = MUX_s_1_2_2(nor_72_nl, mux_tmp_222, fsm_output[6]);
  assign or_275_nl = (fsm_output[7]) | (fsm_output[5]) | (~ mux_229_nl);
  assign mux_230_nl = MUX_s_1_2_2(mux_tmp_224, or_275_nl, fsm_output[3]);
  assign mux_225_nl = MUX_s_1_2_2((fsm_output[4]), (~ nor_tmp_34), fsm_output[2]);
  assign mux_226_nl = MUX_s_1_2_2(mux_225_nl, or_tmp_185, fsm_output[6]);
  assign nand_31_nl = ~((fsm_output[6]) & (fsm_output[2]) & (~ (fsm_output[4])) &
      (VEC_LOOP_j_10_12_0_sva_1[12]));
  assign mux_227_nl = MUX_s_1_2_2(mux_226_nl, nand_31_nl, fsm_output[5]);
  assign or_272_nl = (fsm_output[7]) | mux_227_nl;
  assign mux_228_nl = MUX_s_1_2_2(or_272_nl, mux_tmp_224, fsm_output[3]);
  assign mux_231_nl = MUX_s_1_2_2(mux_230_nl, mux_228_nl, fsm_output[1]);
  assign nor_114_rmff = ~(mux_231_nl | (fsm_output[0]));
  assign and_101_rmff = and_dcpl_99 & (fsm_output[3]) & (~ (fsm_output[2])) & (~
      (fsm_output[7])) & (fsm_output[1]) & (~ (fsm_output[0])) & (VEC_LOOP_j_10_12_0_sva_1[12]);
  assign COMP_LOOP_twiddle_f_or_6_cse = and_dcpl_102 | (and_dcpl_41 & and_dcpl_34)
      | and_dcpl_106 | (and_dcpl_55 & and_dcpl_34) | (and_dcpl_66 & and_dcpl_26);
  assign COMP_LOOP_twiddle_f_or_11_cse = ((~ or_tmp_125) & and_dcpl_35 & and_dcpl_31)
      | (and_dcpl_59 & and_dcpl_19) | (and_dcpl_22 & and_dcpl_116);
  assign COMP_LOOP_twiddle_f_or_15_cse = (and_dcpl_57 & and_dcpl_26) | (nor_tmp_31
      & nor_182_cse & and_dcpl_31) | (and_dcpl_28 & and_dcpl_69);
  assign COMP_LOOP_twiddle_f_mux1h_14_nl = MUX1HOT_s_1_6_2((z_out_1[3]), (z_out_1[2]),
      (COMP_LOOP_9_twiddle_f_mul_psp_sva[0]), (z_out_2[2]), (z_out_2[3]), (z_out_1[1]),
      {COMP_LOOP_twiddle_f_or_6_cse , and_dcpl_103 , and_dcpl_105 , COMP_LOOP_twiddle_f_or_11_cse
      , COMP_LOOP_twiddle_f_or_15_cse , and_dcpl_114});
  assign nor_69_nl = ~((fsm_output[5:4]!=2'b10) | (~ mux_tmp_232));
  assign mux_237_nl = MUX_s_1_2_2(nor_69_nl, mux_tmp_235, fsm_output[6]);
  assign or_280_nl = (~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[3]));
  assign or_278_nl = (fsm_output[4]) | (~ (fsm_output[1])) | (fsm_output[3]);
  assign mux_233_nl = MUX_s_1_2_2(or_280_nl, or_278_nl, fsm_output[5]);
  assign mux_236_nl = MUX_s_1_2_2((~ mux_tmp_235), mux_233_nl, fsm_output[6]);
  assign mux_238_nl = MUX_s_1_2_2((~ mux_237_nl), mux_236_nl, fsm_output[2]);
  assign or_277_nl = (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[5]) | (fsm_output[4])
      | (~ mux_tmp_232);
  assign mux_239_nl = MUX_s_1_2_2(mux_238_nl, or_277_nl, fsm_output[7]);
  assign COMP_LOOP_twiddle_f_and_rmff = COMP_LOOP_twiddle_f_mux1h_14_nl & (~(mux_239_nl
      | (fsm_output[0])));
  assign COMP_LOOP_twiddle_f_mux1h_29_nl = MUX1HOT_s_1_5_2((z_out_1[2]), (z_out_1[1]),
      (z_out_2[1]), (z_out_2[2]), (z_out_1[0]), {COMP_LOOP_twiddle_f_or_6_cse , and_dcpl_103
      , COMP_LOOP_twiddle_f_or_11_cse , COMP_LOOP_twiddle_f_or_15_cse , and_dcpl_114});
  assign COMP_LOOP_twiddle_f_mux1h_29_rmff = COMP_LOOP_twiddle_f_mux1h_29_nl & (~((~
      (fsm_output[6])) & (~ (fsm_output[4])) & (~((fsm_output[5]) ^ (fsm_output[3])))
      & and_dcpl_26));
  assign nl_COMP_LOOP_1_twiddle_f_mul_nl = (z_out[7:0]) * COMP_LOOP_k_12_4_sva_7_0;
  assign COMP_LOOP_1_twiddle_f_mul_nl = nl_COMP_LOOP_1_twiddle_f_mul_nl[7:0];
  assign and_123_nl = and_dcpl_22 & and_dcpl_26;
  assign COMP_LOOP_twiddle_f_mux1h_44_rmff = MUX1HOT_v_8_7_2(COMP_LOOP_1_twiddle_f_mul_nl,
      (z_out_1[11:4]), (z_out_1[10:3]), (COMP_LOOP_9_twiddle_f_mul_psp_sva[8:1]),
      (z_out_2[10:3]), (z_out_2[11:4]), (z_out_1[9:2]), {and_123_nl , COMP_LOOP_twiddle_f_or_6_cse
      , and_dcpl_103 , and_dcpl_105 , COMP_LOOP_twiddle_f_or_11_cse , COMP_LOOP_twiddle_f_or_15_cse
      , and_dcpl_114});
  assign COMP_LOOP_twiddle_f_mux1h_57_nl = MUX1HOT_s_1_4_2((z_out_1[1]), (z_out_1[0]),
      (z_out_2[0]), (z_out_2[1]), {COMP_LOOP_twiddle_f_or_6_cse , and_dcpl_103 ,
      COMP_LOOP_twiddle_f_or_11_cse , COMP_LOOP_twiddle_f_or_15_cse});
  assign or_288_nl = (fsm_output[6:3]!=4'b1110);
  assign or_286_nl = (fsm_output[6:4]!=3'b010);
  assign mux_240_nl = MUX_s_1_2_2(or_tmp_203, or_286_nl, fsm_output[3]);
  assign mux_241_nl = MUX_s_1_2_2(or_288_nl, mux_240_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux1h_57_rmff = COMP_LOOP_twiddle_f_mux1h_57_nl & (~((~
      mux_241_nl) & and_dcpl_25 & (~ (fsm_output[0]))));
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl = MUX_s_1_2_2((z_out_1[0]),
      (z_out_2[0]), COMP_LOOP_twiddle_f_or_15_cse);
  assign nor_65_nl = ~((fsm_output[3]) | (~ (fsm_output[5])));
  assign nor_66_nl = ~((~ (fsm_output[3])) | (fsm_output[5]));
  assign mux_244_nl = MUX_s_1_2_2(nor_65_nl, nor_66_nl, fsm_output[2]);
  assign nand_30_nl = ~((fsm_output[6]) & (fsm_output[4]) & mux_244_nl);
  assign or_481_nl = (fsm_output[2]) | (~ mux_tmp_242);
  assign nand_25_nl = ~((fsm_output[2]) & mux_tmp_242);
  assign mux_243_nl = MUX_s_1_2_2(or_481_nl, nand_25_nl, fsm_output[4]);
  assign or_489_nl = (fsm_output[6]) | mux_243_nl;
  assign mux_245_nl = MUX_s_1_2_2(nand_30_nl, or_489_nl, fsm_output[1]);
  assign or_490_nl = (fsm_output[6:1]!=6'b000010);
  assign mux_246_nl = MUX_s_1_2_2(mux_245_nl, or_490_nl, fsm_output[7]);
  assign COMP_LOOP_twiddle_f_mux1h_66_rmff = COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_nl
      & (mux_246_nl | (fsm_output[0]));
  assign mux_257_cse = MUX_s_1_2_2(mux_tmp_160, nand_3_cse, fsm_output[4]);
  assign nand_9_nl = ~((fsm_output[5]) & (~ mux_142_cse));
  assign mux_258_nl = MUX_s_1_2_2(nand_9_nl, or_tmp_115, fsm_output[4]);
  assign mux_259_cse = MUX_s_1_2_2(mux_258_nl, mux_257_cse, fsm_output[3]);
  assign mux_260_cse = MUX_s_1_2_2(mux_259_cse, mux_163_cse, fsm_output[1]);
  assign mux_252_nl = MUX_s_1_2_2(nand_3_cse, mux_158_cse, fsm_output[4]);
  assign mux_253_nl = MUX_s_1_2_2(mux_252_nl, mux_162_cse, fsm_output[3]);
  assign mux_256_nl = MUX_s_1_2_2(mux_163_cse, mux_253_nl, fsm_output[1]);
  assign mux_261_itm = MUX_s_1_2_2(mux_260_cse, mux_256_nl, fsm_output[0]);
  assign or_311_nl = (fsm_output[5]) | (~ mux_tmp_148);
  assign mux_268_nl = MUX_s_1_2_2(or_311_nl, mux_tmp_265, fsm_output[6]);
  assign or_312_nl = (fsm_output[7]) | mux_268_nl;
  assign mux_269_nl = MUX_s_1_2_2(mux_tmp_264, or_312_nl, fsm_output[3]);
  assign nand_24_nl = ~((fsm_output[5]) & mux_tmp_148);
  assign mux_266_nl = MUX_s_1_2_2(mux_tmp_265, nand_24_nl, fsm_output[6]);
  assign or_310_nl = (fsm_output[7]) | mux_266_nl;
  assign mux_267_nl = MUX_s_1_2_2(or_310_nl, mux_tmp_264, fsm_output[3]);
  assign mux_270_nl = MUX_s_1_2_2(mux_269_nl, mux_267_nl, fsm_output[1]);
  assign and_138_rmff = (~ mux_270_nl) & (fsm_output[0]);
  assign or_322_cse = (fsm_output[6:5]!=2'b00) | (~ mux_tmp_148);
  assign or_323_nl = (fsm_output[0]) | (~ mux_tmp_148);
  assign mux_281_nl = MUX_s_1_2_2(or_323_nl, or_309_cse, fsm_output[5]);
  assign mux_282_nl = MUX_s_1_2_2(mux_281_nl, mux_tmp_277, fsm_output[6]);
  assign mux_283_nl = MUX_s_1_2_2(mux_282_nl, or_322_cse, fsm_output[7]);
  assign mux_284_nl = MUX_s_1_2_2(mux_tmp_276, mux_283_nl, fsm_output[3]);
  assign nand_22_nl = ~((~((fsm_output[5]) & (fsm_output[0]))) & mux_tmp_148);
  assign mux_278_nl = MUX_s_1_2_2(mux_tmp_277, nand_22_nl, fsm_output[6]);
  assign mux_279_nl = MUX_s_1_2_2(mux_278_nl, or_319_cse, fsm_output[7]);
  assign mux_280_nl = MUX_s_1_2_2(mux_279_nl, mux_tmp_276, fsm_output[3]);
  assign mux_285_itm = MUX_s_1_2_2(mux_284_nl, mux_280_nl, fsm_output[1]);
  assign or_169_cse = (fsm_output[4:3]!=2'b00);
  assign or_166_cse = (fsm_output[1:0]!=2'b00);
  assign or_164_cse = (fsm_output[4:2]!=3'b000);
  assign or_482_cse = (or_169_cse & (fsm_output[5])) | (fsm_output[6]);
  assign or_512_cse = (fsm_output[6:5]!=2'b00);
  assign nor_62_cse = ~((fsm_output[4:2]!=3'b000));
  assign mux_349_nl = MUX_s_1_2_2((~ or_476_cse), (fsm_output[7]), fsm_output[6]);
  assign mux_350_nl = MUX_s_1_2_2(mux_349_nl, mux_tmp_321, fsm_output[3]);
  assign mux_347_nl = MUX_s_1_2_2(mux_tmp_321, mux_tmp_328, fsm_output[3]);
  assign mux_344_nl = MUX_s_1_2_2((fsm_output[7]), or_tmp_7, fsm_output[6]);
  assign mux_345_nl = MUX_s_1_2_2(mux_tmp_337, mux_344_nl, fsm_output[3]);
  assign or_353_nl = (fsm_output[6]) | nor_tmp_42;
  assign mux_343_nl = MUX_s_1_2_2(mux_tmp_321, or_353_nl, fsm_output[3]);
  assign mux_346_nl = MUX_s_1_2_2(mux_345_nl, mux_343_nl, fsm_output[1]);
  assign mux_348_nl = MUX_s_1_2_2(mux_347_nl, mux_346_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_351_nl = MUX_s_1_2_2(mux_350_nl, mux_348_nl, fsm_output[4]);
  assign or_487_nl = (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_339_nl = MUX_s_1_2_2(nor_tmp_42, (fsm_output[7]), or_487_nl);
  assign mux_338_nl = MUX_s_1_2_2(mux_tmp_337, (fsm_output[7]), fsm_output[3]);
  assign mux_340_nl = MUX_s_1_2_2(mux_339_nl, mux_338_nl, fsm_output[1]);
  assign mux_341_nl = MUX_s_1_2_2(mux_tmp_321, mux_340_nl, VEC_LOOP_j_10_12_0_sva_1[12]);
  assign mux_336_nl = MUX_s_1_2_2(mux_tmp_328, mux_tmp_321, and_172_cse);
  assign mux_342_nl = MUX_s_1_2_2(mux_341_nl, mux_336_nl, fsm_output[4]);
  assign mux_352_nl = MUX_s_1_2_2(mux_351_nl, mux_342_nl, fsm_output[2]);
  assign mux_332_nl = MUX_s_1_2_2(mux_119_cse, mux_tmp_328, fsm_output[3]);
  assign mux_330_nl = MUX_s_1_2_2(mux_tmp_325, mux_tmp_317, fsm_output[3]);
  assign mux_333_nl = MUX_s_1_2_2(mux_332_nl, mux_330_nl, fsm_output[1]);
  assign or_350_nl = (fsm_output[1]) | (fsm_output[3]);
  assign mux_329_nl = MUX_s_1_2_2(mux_tmp_321, mux_tmp_328, or_350_nl);
  assign mux_334_nl = MUX_s_1_2_2(mux_333_nl, mux_329_nl, fsm_output[4]);
  assign mux_326_nl = MUX_s_1_2_2(mux_tmp_321, mux_tmp_325, nor_70_cse);
  assign mux_322_nl = MUX_s_1_2_2((fsm_output[5]), or_tmp_7, fsm_output[6]);
  assign mux_323_nl = MUX_s_1_2_2(mux_322_nl, mux_tmp_321, fsm_output[3]);
  assign mux_319_nl = MUX_s_1_2_2(mux_tmp_318, or_tmp_7, fsm_output[6]);
  assign mux_320_nl = MUX_s_1_2_2(mux_319_nl, mux_tmp_317, fsm_output[3]);
  assign mux_324_nl = MUX_s_1_2_2(mux_323_nl, mux_320_nl, fsm_output[1]);
  assign mux_327_nl = MUX_s_1_2_2(mux_326_nl, mux_324_nl, fsm_output[4]);
  assign mux_335_nl = MUX_s_1_2_2(mux_334_nl, mux_327_nl, fsm_output[2]);
  assign mux_353_nl = MUX_s_1_2_2(mux_352_nl, mux_335_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_help_and_itm = complete_rsci_wen_comp & mux_353_nl;
  assign nor_182_cse = ~((fsm_output[4:3]!=2'b00));
  assign or_476_cse = (fsm_output[7]) | (fsm_output[5]);
  assign VEC_LOOP_or_50_cse = and_dcpl_37 | and_dcpl_74;
  assign VEC_LOOP_or_51_cse = and_dcpl_42 | and_dcpl_76;
  assign VEC_LOOP_or_52_cse = and_dcpl_44 | and_dcpl_58;
  assign VEC_LOOP_or_53_cse = and_dcpl_51 | and_dcpl_70;
  assign VEC_LOOP_or_54_cse = and_dcpl_54 | and_dcpl_63;
  assign VEC_LOOP_or_55_cse = and_dcpl_56 | and_dcpl_65;
  assign or_435_cse = (~ (fsm_output[2])) | (~ (fsm_output[7])) | (fsm_output[6]);
  assign or_136_cse = (fsm_output[4]) | (~ (fsm_output[7]));
  assign nor_55_cse_1 = ~((fsm_output[1:0]!=2'b00));
  assign or_463_cse = (fsm_output[6]) | (fsm_output[4]) | (~ (fsm_output[7]));
  assign or_473_cse = (fsm_output[7:5]!=3'b100);
  assign mux_485_cse = MUX_s_1_2_2(or_tmp_138, or_222_cse, fsm_output[5]);
  assign mux_484_cse = MUX_s_1_2_2(or_463_cse, or_tmp_138, fsm_output[5]);
  assign and_164_nl = (fsm_output[3]) & mux_tmp_171;
  assign mux_480_nl = MUX_s_1_2_2(and_dcpl_50, and_164_nl, fsm_output[2]);
  assign mux_481_nl = MUX_s_1_2_2(mux_480_nl, (~ or_tmp_255), fsm_output[7]);
  assign nor_56_nl = ~((fsm_output[7]) | (~((fsm_output[3:2]==2'b11) & mux_tmp_171)));
  assign mux_482_nl = MUX_s_1_2_2(mux_481_nl, nor_56_nl, fsm_output[1]);
  assign VEC_LOOP_VEC_LOOP_mux_2_rgt = MUX_v_11_2_2(z_out_18, ({1'b0 , z_out_16}),
      mux_482_nl);
  assign or_526_cse = (fsm_output[3:0]!=4'b0000);
  assign nor_178_cse = ~((fsm_output[6:2]!=5'b00100));
  assign or_319_cse = (fsm_output[6]) | (fsm_output[5]) | (fsm_output[2]) | (~ (fsm_output[4]));
  assign nl_STAGE_LOOP_i_3_0_sva_2 = STAGE_LOOP_i_3_0_sva + 4'b0001;
  assign STAGE_LOOP_i_3_0_sva_2 = nl_STAGE_LOOP_i_3_0_sva_2[3:0];
  assign nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 = (~ STAGE_LOOP_i_3_0_sva) +
      4'b1101;
  assign COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0 = nl_COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0[3:0];
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ STAGE_LOOP_i_3_0_sva_2)}) + 5'b01101;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign or_tmp_7 = (fsm_output[7]) | (~ (fsm_output[5]));
  assign or_54_cse = (fsm_output[7:6]!=2'b01);
  assign or_485_cse = (or_164_cse & (fsm_output[5])) | (fsm_output[6]);
  assign nor_tmp_25 = or_485_cse & (fsm_output[7]);
  assign mux_119_cse = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[6]);
  assign or_dcpl_81 = or_512_cse | or_169_cse;
  assign or_tmp_95 = ((fsm_output[0]) & (fsm_output[6])) | (fsm_output[7]);
  assign mux_tmp_128 = MUX_s_1_2_2(mux_119_cse, or_54_cse, fsm_output[0]);
  assign mux_tmp_129 = MUX_s_1_2_2(mux_tmp_128, or_tmp_95, fsm_output[2]);
  assign or_tmp_97 = (fsm_output[0]) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_tmp_130 = MUX_s_1_2_2(or_tmp_95, or_tmp_97, fsm_output[2]);
  assign or_tmp_98 = (fsm_output[2]) | (fsm_output[0]) | (fsm_output[6]) | (fsm_output[7]);
  assign mux_tmp_148 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[2]);
  assign nor_85_nl = ~((~ (fsm_output[2])) | (fsm_output[4]));
  assign mux_tmp_149 = MUX_s_1_2_2(nor_85_nl, mux_tmp_148, fsm_output[6]);
  assign or_190_nl = (fsm_output[5]) | (~ mux_tmp_149);
  assign mux_tmp_150 = MUX_s_1_2_2(or_190_nl, or_319_cse, fsm_output[7]);
  assign and_dcpl_18 = (fsm_output[2]) & (~ (fsm_output[7]));
  assign and_dcpl_19 = and_dcpl_18 & nor_55_cse_1;
  assign and_dcpl_21 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_22 = and_dcpl_21 & nor_182_cse;
  assign and_dcpl_23 = and_dcpl_22 & and_dcpl_19;
  assign and_dcpl_24 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_25 = ~((fsm_output[2]) | (fsm_output[7]));
  assign and_dcpl_26 = and_dcpl_25 & and_dcpl_24;
  assign and_dcpl_27 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_28 = and_dcpl_21 & and_dcpl_27;
  assign mux_tmp_157 = MUX_s_1_2_2(or_54_cse, or_249_cse, fsm_output[2]);
  assign or_tmp_115 = (fsm_output[5]) | mux_tmp_157;
  assign or_tmp_118 = (fsm_output[2]) | (fsm_output[7]) | (fsm_output[6]);
  assign mux_tmp_160 = MUX_s_1_2_2(or_435_cse, or_tmp_118, fsm_output[5]);
  assign or_438_nl = (~ (fsm_output[2])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_158_cse = MUX_s_1_2_2(or_tmp_118, or_438_nl, fsm_output[5]);
  assign or_204_cse = (fsm_output[5]) | mux_142_cse;
  assign mux_162_cse = MUX_s_1_2_2(or_204_cse, mux_tmp_160, fsm_output[4]);
  assign nand_3_cse = ~((fsm_output[5]) & (~ mux_tmp_157));
  assign mux_159_nl = MUX_s_1_2_2(mux_158_cse, or_tmp_115, fsm_output[4]);
  assign mux_163_cse = MUX_s_1_2_2(mux_162_cse, mux_159_nl, fsm_output[3]);
  assign and_dcpl_30 = (~ mux_260_cse) & (fsm_output[0]);
  assign and_dcpl_31 = and_dcpl_18 & and_dcpl_24;
  assign and_dcpl_32 = and_dcpl_28 & and_dcpl_31;
  assign nor_tmp_31 = (fsm_output[6:5]==2'b11);
  assign mux_tmp_169 = MUX_s_1_2_2((~ nor_tmp_31), or_512_cse, fsm_output[4]);
  assign or_tmp_125 = (fsm_output[6:5]!=2'b01);
  assign mux_tmp_171 = MUX_s_1_2_2((~ or_tmp_125), nor_tmp_31, fsm_output[4]);
  assign nor_82_nl = ~((fsm_output[6:4]!=3'b101));
  assign mux_tmp_172 = MUX_s_1_2_2(nor_82_nl, mux_tmp_171, fsm_output[3]);
  assign or_207_nl = (fsm_output[6:4]!=3'b011);
  assign mux_170_nl = MUX_s_1_2_2(mux_tmp_169, or_207_nl, fsm_output[3]);
  assign mux_173_nl = MUX_s_1_2_2(mux_tmp_172, (~ mux_170_nl), fsm_output[2]);
  assign nor_80_nl = ~((fsm_output[6:3]!=4'b0100));
  assign nor_81_nl = ~((fsm_output[6:3]!=4'b0001));
  assign mux_168_nl = MUX_s_1_2_2(nor_80_nl, nor_81_nl, fsm_output[2]);
  assign mux_174_nl = MUX_s_1_2_2(mux_173_nl, mux_168_nl, fsm_output[7]);
  assign and_dcpl_33 = mux_174_nl & nor_55_cse_1;
  assign and_dcpl_34 = and_dcpl_25 & nor_55_cse_1;
  assign and_dcpl_35 = (fsm_output[4:3]==2'b11);
  assign and_dcpl_36 = and_dcpl_21 & and_dcpl_35;
  assign and_dcpl_37 = and_dcpl_36 & and_dcpl_34;
  assign or_213_nl = (fsm_output[6:4]!=3'b100);
  assign mux_tmp_175 = MUX_s_1_2_2(or_213_nl, mux_tmp_169, fsm_output[3]);
  assign or_211_nl = (fsm_output[6:3]!=4'b0010);
  assign mux_176_nl = MUX_s_1_2_2(mux_tmp_175, or_211_nl, fsm_output[7]);
  assign and_dcpl_40 = (~ mux_176_nl) & (fsm_output[2:0]==3'b110);
  assign and_dcpl_41 = (~ or_tmp_125) & nor_182_cse;
  assign and_dcpl_42 = and_dcpl_41 & and_dcpl_26;
  assign and_dcpl_43 = (~ or_tmp_125) & and_dcpl_27;
  assign and_dcpl_44 = and_dcpl_43 & and_dcpl_19;
  assign nand_32_nl = ~((fsm_output[5:4]==2'b11));
  assign or_88_nl = (fsm_output[5:4]!=2'b00);
  assign mux_177_nl = MUX_s_1_2_2(nand_32_nl, or_88_nl, fsm_output[7]);
  assign and_dcpl_48 = ~(mux_177_nl | (fsm_output[6]) | (fsm_output[3]) | (fsm_output[2])
      | (~ and_dcpl_24));
  assign and_dcpl_49 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_50 = (~ or_tmp_125) & and_dcpl_49;
  assign and_dcpl_51 = and_dcpl_50 & and_dcpl_31;
  assign and_dcpl_52 = (fsm_output[6:5]==2'b10);
  assign and_dcpl_54 = and_dcpl_52 & nor_182_cse & and_dcpl_34;
  assign and_dcpl_55 = and_dcpl_52 & and_dcpl_27;
  assign and_dcpl_56 = and_dcpl_55 & and_dcpl_26;
  assign and_dcpl_57 = and_dcpl_52 & and_dcpl_49;
  assign and_dcpl_58 = and_dcpl_57 & and_dcpl_19;
  assign and_dcpl_59 = and_dcpl_52 & and_dcpl_35;
  assign and_dcpl_60 = and_dcpl_59 & and_dcpl_26;
  assign and_dcpl_61 = and_dcpl_59 & and_dcpl_31;
  assign and_dcpl_63 = nor_tmp_31 & and_dcpl_27 & and_dcpl_34;
  assign and_dcpl_64 = nor_tmp_31 & and_dcpl_49;
  assign and_dcpl_65 = and_dcpl_64 & and_dcpl_26;
  assign and_dcpl_66 = nor_tmp_31 & and_dcpl_35;
  assign and_dcpl_67 = and_dcpl_66 & and_dcpl_19;
  assign and_dcpl_68 = (fsm_output[2]) & (fsm_output[7]);
  assign and_dcpl_69 = and_dcpl_68 & and_dcpl_24;
  assign and_dcpl_70 = and_dcpl_22 & and_dcpl_69;
  assign and_dcpl_71 = (~ (fsm_output[2])) & (fsm_output[7]);
  assign and_dcpl_73 = and_dcpl_21 & and_dcpl_49;
  assign and_dcpl_74 = and_dcpl_73 & and_dcpl_71 & nor_55_cse_1;
  assign and_dcpl_76 = and_dcpl_36 & and_dcpl_71 & and_dcpl_24;
  assign and_dcpl_77 = ~((fsm_output[7]) | (fsm_output[0]));
  assign or_494_nl = (fsm_output[3:2]!=2'b01);
  assign or_495_nl = (fsm_output[3:2]!=2'b10);
  assign mux_178_nl = MUX_s_1_2_2(or_494_nl, or_495_nl, fsm_output[1]);
  assign and_dcpl_81 = ~(mux_178_nl | (fsm_output[6:4]!=3'b000) | (~ and_dcpl_77));
  assign or_tmp_138 = (fsm_output[6]) | (fsm_output[7]) | (~ (fsm_output[4]));
  assign mux_189_nl = MUX_s_1_2_2(or_136_cse, or_223_cse, fsm_output[5]);
  assign or_tmp_149 = (fsm_output[6]) | mux_189_nl;
  assign or_tmp_151 = (~ (fsm_output[5])) | (fsm_output[7]) | (fsm_output[4]);
  assign or_tmp_153 = (fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[4]));
  assign or_tmp_169 = (~ (fsm_output[2])) | (fsm_output[7]) | (fsm_output[5]) | (fsm_output[6]);
  assign not_tmp_100 = ~((fsm_output[6:5]==2'b11));
  assign or_tmp_170 = (fsm_output[7]) | not_tmp_100;
  assign or_256_cse = (fsm_output[7:5]!=3'b001);
  assign mux_tmp_212 = MUX_s_1_2_2(or_256_cse, or_473_cse, fsm_output[2]);
  assign or_254_cse = (fsm_output[7:5]!=3'b000);
  assign or_260_nl = (fsm_output[7:5]!=3'b101);
  assign mux_216_nl = MUX_s_1_2_2(or_260_nl, or_tmp_170, fsm_output[2]);
  assign mux_217_nl = MUX_s_1_2_2(mux_216_nl, or_tmp_169, fsm_output[4]);
  assign or_259_nl = (fsm_output[2]) | (fsm_output[7]) | not_tmp_100;
  assign mux_215_nl = MUX_s_1_2_2(mux_tmp_212, or_259_nl, fsm_output[4]);
  assign mux_218_nl = MUX_s_1_2_2(mux_217_nl, mux_215_nl, fsm_output[3]);
  assign or_257_nl = (fsm_output[2]) | (~ (fsm_output[7])) | (fsm_output[5]) | (fsm_output[6]);
  assign mux_213_nl = MUX_s_1_2_2(or_257_nl, mux_tmp_212, fsm_output[4]);
  assign mux_210_nl = MUX_s_1_2_2(or_254_cse, or_tmp_170, fsm_output[2]);
  assign mux_211_nl = MUX_s_1_2_2(mux_210_nl, or_tmp_169, fsm_output[4]);
  assign mux_214_nl = MUX_s_1_2_2(mux_213_nl, mux_211_nl, fsm_output[3]);
  assign mux_219_itm = MUX_s_1_2_2(mux_218_nl, mux_214_nl, fsm_output[1]);
  assign and_dcpl_89 = (~ (fsm_output[7])) & (fsm_output[0]);
  assign nor_74_nl = ~((fsm_output[6:3]!=4'b1010));
  assign and_179_nl = (fsm_output[6:3]==4'b0111);
  assign mux_220_nl = MUX_s_1_2_2(nor_74_nl, and_179_nl, fsm_output[2]);
  assign nor_75_nl = ~((fsm_output[6:2]!=5'b10001));
  assign not_tmp_102 = MUX_s_1_2_2(mux_220_nl, nor_75_nl, fsm_output[1]);
  assign and_dcpl_92 = and_dcpl_25 & (fsm_output[1:0]==2'b11);
  assign nor_tmp_34 = (fsm_output[4]) & (VEC_LOOP_j_10_12_0_sva_1[12]);
  assign or_tmp_185 = (fsm_output[2]) | (~ nor_tmp_34);
  assign nor_73_nl = ~((fsm_output[4]) | (~ (VEC_LOOP_j_10_12_0_sva_1[12])));
  assign mux_tmp_222 = MUX_s_1_2_2(nor_73_nl, nor_tmp_34, fsm_output[2]);
  assign mux_223_nl = MUX_s_1_2_2(mux_tmp_222, (~ or_tmp_185), fsm_output[6]);
  assign nand_6_nl = ~((fsm_output[5]) & mux_223_nl);
  assign or_267_nl = (fsm_output[5]) | (fsm_output[6]) | (~ (fsm_output[2])) | (fsm_output[4])
      | (~ (VEC_LOOP_j_10_12_0_sva_1[12]));
  assign mux_tmp_224 = MUX_s_1_2_2(nand_6_nl, or_267_nl, fsm_output[7]);
  assign and_dcpl_99 = ~(or_tmp_125 | (fsm_output[4]));
  assign mux_tmp_232 = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[1]);
  assign nor_70_cse = ~((fsm_output[1]) | (~ (fsm_output[3])));
  assign nor_71_nl = ~((~ (fsm_output[1])) | (fsm_output[3]));
  assign mux_234_nl = MUX_s_1_2_2(nor_70_cse, nor_71_nl, fsm_output[4]);
  assign and_102_nl = (fsm_output[4]) & mux_tmp_232;
  assign mux_tmp_235 = MUX_s_1_2_2(mux_234_nl, and_102_nl, fsm_output[5]);
  assign and_dcpl_102 = and_dcpl_28 & and_dcpl_19;
  assign and_dcpl_103 = and_dcpl_73 & and_dcpl_31;
  assign and_dcpl_105 = and_dcpl_43 & and_dcpl_26;
  assign and_dcpl_106 = and_dcpl_50 & and_dcpl_19;
  assign and_dcpl_114 = and_dcpl_64 & and_dcpl_34;
  assign and_dcpl_116 = and_dcpl_68 & nor_55_cse_1;
  assign or_tmp_203 = (fsm_output[6:4]!=3'b000);
  assign mux_tmp_242 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[3]);
  assign and_dcpl_134 = and_dcpl_41 & and_dcpl_68 & (fsm_output[1:0]==2'b01);
  assign or_307_nl = (~ (fsm_output[5])) | (fsm_output[2]) | (~ (fsm_output[4]));
  assign or_305_nl = (fsm_output[5]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign mux_263_nl = MUX_s_1_2_2(or_307_nl, or_305_nl, fsm_output[6]);
  assign mux_tmp_264 = MUX_s_1_2_2(mux_263_nl, or_322_cse, fsm_output[7]);
  assign or_308_cse = (~ (fsm_output[2])) | (fsm_output[4]);
  assign or_309_cse = (fsm_output[2]) | (~ (fsm_output[4]));
  assign mux_tmp_265 = MUX_s_1_2_2(or_309_cse, or_308_cse, fsm_output[5]);
  assign or_tmp_231 = (fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[4]);
  assign mux_tmp_273 = MUX_s_1_2_2(mux_tmp_148, or_308_cse, fsm_output[0]);
  assign mux_274_nl = MUX_s_1_2_2(or_309_cse, mux_tmp_273, fsm_output[5]);
  assign mux_272_nl = MUX_s_1_2_2(or_tmp_231, (~ mux_tmp_148), fsm_output[5]);
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, mux_272_nl, fsm_output[6]);
  assign or_314_nl = (fsm_output[6]) | (fsm_output[5]) | (fsm_output[0]) | (~ mux_tmp_148);
  assign mux_tmp_276 = MUX_s_1_2_2(mux_275_nl, or_314_nl, fsm_output[7]);
  assign mux_tmp_277 = MUX_s_1_2_2(mux_tmp_273, or_tmp_231, fsm_output[5]);
  assign and_dcpl_136 = and_dcpl_57 & and_dcpl_31;
  assign or_tmp_243 = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[2]) | (~ (fsm_output[4]));
  assign or_325_nl = (fsm_output[7]) | (~ mux_tmp_149);
  assign mux_tmp_288 = MUX_s_1_2_2(or_tmp_243, or_325_nl, fsm_output[5]);
  assign or_tmp_255 = (fsm_output[6:2]!=5'b00000);
  assign mux_298_nl = MUX_s_1_2_2((~ or_tmp_255), or_485_cse, fsm_output[7]);
  assign mux_tmp_299 = MUX_s_1_2_2(mux_298_nl, nor_tmp_25, fsm_output[1]);
  assign mux_tmp_305 = MUX_s_1_2_2((fsm_output[6]), (fsm_output[5]), fsm_output[4]);
  assign mux_tmp_306 = MUX_s_1_2_2(mux_tmp_305, or_512_cse, fsm_output[3]);
  assign mux_tmp_308 = MUX_s_1_2_2(or_tmp_125, or_512_cse, fsm_output[4]);
  assign mux_tmp_309 = MUX_s_1_2_2(mux_tmp_308, mux_tmp_305, fsm_output[3]);
  assign and_193_cse = (fsm_output[5:4]==2'b11);
  assign or_tmp_261 = and_193_cse | (fsm_output[6]);
  assign mux_tmp_317 = MUX_s_1_2_2((fsm_output[5]), (fsm_output[7]), fsm_output[6]);
  assign mux_tmp_318 = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), fsm_output[7]);
  assign nor_tmp_42 = (fsm_output[7]) & (fsm_output[5]);
  assign mux_tmp_321 = MUX_s_1_2_2(nor_tmp_42, (fsm_output[7]), fsm_output[6]);
  assign mux_tmp_325 = MUX_s_1_2_2(mux_tmp_318, (fsm_output[7]), fsm_output[6]);
  assign mux_tmp_328 = MUX_s_1_2_2(nor_tmp_42, or_tmp_7, fsm_output[6]);
  assign mux_tmp_337 = MUX_s_1_2_2(nor_tmp_42, or_476_cse, fsm_output[6]);
  assign and_172_cse = (fsm_output[1]) & (fsm_output[3]);
  assign mux_tmp_354 = MUX_s_1_2_2(or_256_cse, or_254_cse, fsm_output[1]);
  assign or_366_nl = (fsm_output[6]) | (~ (VEC_LOOP_j_10_12_0_sva_1[12])) | (~ (fsm_output[7]))
      | (fsm_output[5]);
  assign nand_29_nl = ~((fsm_output[6]) & (VEC_LOOP_j_10_12_0_sva_1[12]) & (~ (fsm_output[7]))
      & (fsm_output[5]));
  assign mux_tmp_359 = MUX_s_1_2_2(or_366_nl, nand_29_nl, fsm_output[1]);
  assign and_dcpl_145 = and_dcpl_43 & and_dcpl_92;
  assign or_tmp_282 = (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[4]);
  assign or_tmp_283 = (fsm_output[3]) | (fsm_output[7]) | (fsm_output[4]);
  assign or_tmp_294 = (fsm_output[6:5]!=2'b10);
  assign mux_tmp_386 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[5]);
  assign mux_tmp_387 = MUX_s_1_2_2((fsm_output[5]), mux_tmp_386, fsm_output[4]);
  assign mux_tmp_391 = MUX_s_1_2_2(or_tmp_294, mux_tmp_387, fsm_output[3]);
  assign and_dcpl_152 = and_dcpl_21 & (~((fsm_output[1]) ^ (fsm_output[3]))) & (~
      (fsm_output[4])) & (fsm_output[2]) & and_dcpl_89;
  assign or_403_nl = (fsm_output[5]) | (~((fsm_output[6]) & mux_tmp_148));
  assign mux_tmp_413 = MUX_s_1_2_2(or_403_nl, or_319_cse, fsm_output[7]);
  assign mux_419_nl = MUX_s_1_2_2(mux_tmp_413, or_195_cse, fsm_output[3]);
  assign mux_416_nl = MUX_s_1_2_2(mux_152_cse, mux_tmp_413, fsm_output[3]);
  assign mux_420_nl = MUX_s_1_2_2(mux_419_nl, mux_416_nl, fsm_output[1]);
  assign and_dcpl_153 = (~ mux_420_nl) & (fsm_output[0]);
  assign and_169_cse = (fsm_output[3:2]==2'b11);
  assign or_tmp_315 = and_169_cse | (fsm_output[6:4]!=3'b000);
  assign mux_tmp_422 = MUX_s_1_2_2((~ or_tmp_315), or_tmp_203, fsm_output[7]);
  assign or_469_nl = (fsm_output[7:5]!=3'b011);
  assign mux_427_nl = MUX_s_1_2_2(or_469_nl, or_256_cse, fsm_output[2]);
  assign mux_tmp_429 = MUX_s_1_2_2(mux_tmp_212, mux_427_nl, fsm_output[4]);
  assign or_tmp_322 = (fsm_output[7:5]!=3'b010);
  assign mux_tmp_430 = MUX_s_1_2_2(or_tmp_322, or_254_cse, fsm_output[2]);
  assign or_tmp_352 = (~ (fsm_output[1])) | (fsm_output[3]) | (fsm_output[7]) | (~
      (fsm_output[5]));
  assign mux_3_nl = MUX_s_1_2_2(or_476_cse, or_tmp_7, fsm_output[3]);
  assign or_7_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[5]);
  assign mux_465_nl = MUX_s_1_2_2(mux_3_nl, or_7_nl, fsm_output[1]);
  assign mux_tmp_466 = MUX_s_1_2_2(or_tmp_352, mux_465_nl, fsm_output[6]);
  assign or_24_nl = (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_tmp_467 = MUX_s_1_2_2(or_24_nl, or_476_cse, fsm_output[3]);
  assign not_tmp_195 = ~(and_dcpl_35 | (fsm_output[6:5]!=2'b00));
  assign mux_tmp_475 = MUX_s_1_2_2(not_tmp_195, or_tmp_255, fsm_output[7]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_41 & and_dcpl_116;
  assign mux_433_nl = MUX_s_1_2_2(or_473_cse, or_tmp_322, fsm_output[2]);
  assign mux_434_nl = MUX_s_1_2_2(mux_tmp_430, mux_433_nl, fsm_output[4]);
  assign mux_435_nl = MUX_s_1_2_2(mux_tmp_429, mux_434_nl, fsm_output[3]);
  assign nand_nl = ~((fsm_output[2]) & (fsm_output[6]) & (~ (fsm_output[7])) & (fsm_output[5]));
  assign mux_431_nl = MUX_s_1_2_2(nand_nl, mux_tmp_430, fsm_output[4]);
  assign mux_432_nl = MUX_s_1_2_2(mux_431_nl, mux_tmp_429, fsm_output[3]);
  assign mux_436_nl = MUX_s_1_2_2(mux_435_nl, mux_432_nl, fsm_output[1]);
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c0 = (~ mux_436_nl) & (fsm_output[0]);
  assign or_429_nl = (fsm_output[5]) | (fsm_output[2]) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_443_nl = MUX_s_1_2_2(or_429_nl, or_204_cse, fsm_output[4]);
  assign mux_444_nl = MUX_s_1_2_2(mux_257_cse, mux_443_nl, fsm_output[3]);
  assign mux_445_nl = MUX_s_1_2_2(mux_444_nl, mux_259_cse, fsm_output[1]);
  assign VEC_LOOP_acc_1_cse_10_sva_mx0c2 = ~(mux_445_nl | (fsm_output[0]));
  assign VEC_LOOP_or_9_cse = and_dcpl_37 | and_dcpl_54 | and_dcpl_63 | and_dcpl_74;
  assign VEC_LOOP_or_10_cse = and_dcpl_42 | and_dcpl_51 | and_dcpl_56 | and_dcpl_61
      | and_dcpl_65 | and_dcpl_70 | and_dcpl_76;
  assign VEC_LOOP_or_11_cse = and_dcpl_44 | and_dcpl_67;
  assign VEC_LOOP_or_83_cse = VEC_LOOP_or_50_cse | and_dcpl_61 | VEC_LOOP_or_51_cse
      | VEC_LOOP_or_55_cse | VEC_LOOP_or_54_cse | VEC_LOOP_or_53_cse;
  assign VEC_LOOP_mux1h_8_nl = MUX1HOT_v_9_6_2((z_out_5[11:3]), (acc_4_cse_12_1[11:3]),
      (z_out_18[10:2]), (z_out_10[11:3]), (z_out_16[9:1]), (z_out_16[8:0]), {and_dcpl_23
      , and_dcpl_32 , VEC_LOOP_or_9_cse , VEC_LOOP_or_10_cse , VEC_LOOP_or_11_cse
      , and_dcpl_58});
  assign VEC_LOOP_mux1h_6_nl = MUX1HOT_s_1_6_2((z_out_5[2]), (acc_4_cse_12_1[2]),
      (z_out_18[1]), (z_out_10[2]), (z_out_16[0]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      {and_dcpl_23 , and_dcpl_32 , VEC_LOOP_or_9_cse , VEC_LOOP_or_10_cse , VEC_LOOP_or_11_cse
      , and_dcpl_58});
  assign and_84_nl = mux_tmp_172 & and_dcpl_19;
  assign VEC_LOOP_mux1h_4_nl = MUX1HOT_s_1_5_2((z_out_5[1]), (acc_4_cse_12_1[1]),
      (z_out_18[0]), (z_out_10[1]), (VEC_LOOP_acc_1_cse_10_sva[1]), {and_dcpl_23
      , and_dcpl_32 , VEC_LOOP_or_9_cse , VEC_LOOP_or_10_cse , and_84_nl});
  assign mux_179_nl = MUX_s_1_2_2((~ mux_tmp_175), mux_tmp_172, fsm_output[2]);
  assign mux_180_nl = MUX_s_1_2_2(mux_179_nl, nor_178_cse, fsm_output[7]);
  assign and_82_nl = mux_180_nl & nor_55_cse_1;
  assign VEC_LOOP_mux1h_2_nl = MUX1HOT_s_1_4_2((z_out_5[0]), (acc_4_cse_12_1[0]),
      (VEC_LOOP_acc_1_cse_10_sva[0]), (z_out_10[0]), {and_dcpl_23 , and_dcpl_32 ,
      and_82_nl , VEC_LOOP_or_10_cse});
  assign and_29_nl = and_dcpl_28 & and_dcpl_26;
  assign VEC_LOOP_mux1h_nl = MUX1HOT_v_8_11_2((z_out_16[7:0]), VEC_LOOP_acc_psp_sva,
      (VEC_LOOP_acc_10_cse_1_sva[11:4]), (z_out_10[11:4]), (VEC_LOOP_acc_1_cse_10_sva[11:4]),
      (acc_4_cse_12_1[11:4]), ({VEC_LOOP_acc_11_psp_sva_10 , (VEC_LOOP_acc_11_psp_sva_9_0[9:3])}),
      (z_out_11[11:4]), (VEC_LOOP_acc_11_psp_sva_9_0[9:2]), (COMP_LOOP_9_twiddle_f_mul_psp_sva[8:1]),
      (z_out_5[11:4]), {and_dcpl_23 , and_29_nl , and_dcpl_30 , and_dcpl_32 , and_dcpl_33
      , VEC_LOOP_or_83_cse , and_dcpl_40 , VEC_LOOP_or_52_cse , and_dcpl_48 , and_dcpl_60
      , and_dcpl_67});
  assign VEC_LOOP_mux1h_1_nl = MUX1HOT_s_1_10_2((COMP_LOOP_twiddle_f_9_sva[3]), (VEC_LOOP_acc_10_cse_1_sva[3]),
      (z_out_10[3]), (VEC_LOOP_acc_1_cse_10_sva[3]), (acc_4_cse_12_1[3]), (VEC_LOOP_acc_11_psp_sva_9_0[2]),
      (z_out_11[3]), (VEC_LOOP_acc_11_psp_sva_9_0[1]), (COMP_LOOP_9_twiddle_f_mul_psp_sva[0]),
      (z_out_5[3]), {and_dcpl_81 , and_dcpl_30 , and_dcpl_32 , and_dcpl_33 , VEC_LOOP_or_83_cse
      , and_dcpl_40 , VEC_LOOP_or_52_cse , and_dcpl_48 , and_dcpl_60 , and_dcpl_67});
  assign or_227_nl = (fsm_output[3]) | (~ (fsm_output[6])) | (fsm_output[7]) | (~
      (fsm_output[4]));
  assign mux_185_nl = MUX_s_1_2_2(or_tmp_138, or_463_cse, fsm_output[3]);
  assign mux_186_nl = MUX_s_1_2_2(or_227_nl, mux_185_nl, fsm_output[2]);
  assign mux_182_nl = MUX_s_1_2_2(or_224_cse, or_223_cse, fsm_output[6]);
  assign mux_183_nl = MUX_s_1_2_2(or_463_cse, mux_182_nl, fsm_output[3]);
  assign mux_181_nl = MUX_s_1_2_2(or_222_cse, or_tmp_138, fsm_output[3]);
  assign mux_184_nl = MUX_s_1_2_2(mux_183_nl, mux_181_nl, fsm_output[2]);
  assign mux_187_nl = MUX_s_1_2_2(mux_186_nl, mux_184_nl, fsm_output[5]);
  assign or_219_nl = (fsm_output[7:2]!=6'b010110);
  assign mux_188_nl = MUX_s_1_2_2(mux_187_nl, or_219_nl, fsm_output[1]);
  assign nor_117_nl = ~(mux_188_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_3_nl = MUX1HOT_s_1_9_2((COMP_LOOP_twiddle_f_9_sva[2]), (VEC_LOOP_acc_10_cse_1_sva[2]),
      (z_out_10[2]), (VEC_LOOP_acc_1_cse_10_sva[2]), (acc_4_cse_12_1[2]), (VEC_LOOP_acc_11_psp_sva_9_0[1]),
      (z_out_11[2]), (VEC_LOOP_acc_11_psp_sva_9_0[0]), (z_out_5[2]), {and_dcpl_81
      , and_dcpl_30 , and_dcpl_32 , nor_117_nl , VEC_LOOP_or_83_cse , and_dcpl_40
      , VEC_LOOP_or_52_cse , and_dcpl_48 , and_dcpl_67});
  assign or_239_nl = (~ (fsm_output[5])) | (~ (fsm_output[7])) | (fsm_output[4]);
  assign mux_194_nl = MUX_s_1_2_2(or_239_nl, or_tmp_153, fsm_output[6]);
  assign or_238_nl = (~ (fsm_output[5])) | (fsm_output[7]) | (~ (fsm_output[4]));
  assign mux_193_nl = MUX_s_1_2_2(or_tmp_151, or_238_nl, fsm_output[6]);
  assign mux_195_nl = MUX_s_1_2_2(mux_194_nl, mux_193_nl, fsm_output[3]);
  assign mux_191_nl = MUX_s_1_2_2(or_tmp_153, or_tmp_151, fsm_output[6]);
  assign mux_192_nl = MUX_s_1_2_2(mux_191_nl, or_tmp_149, fsm_output[3]);
  assign mux_196_nl = MUX_s_1_2_2(mux_195_nl, mux_192_nl, fsm_output[2]);
  assign mux_190_nl = MUX_s_1_2_2(or_tmp_149, or_229_cse, fsm_output[3]);
  assign or_233_nl = (fsm_output[2]) | mux_190_nl;
  assign mux_197_nl = MUX_s_1_2_2(mux_196_nl, or_233_nl, fsm_output[1]);
  assign nor_116_nl = ~(mux_197_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_5_nl = MUX1HOT_s_1_8_2((COMP_LOOP_twiddle_f_9_sva[1]), (VEC_LOOP_acc_10_cse_1_sva[1]),
      (z_out_10[1]), (VEC_LOOP_acc_1_cse_10_sva[1]), (acc_4_cse_12_1[1]), (VEC_LOOP_acc_11_psp_sva_9_0[0]),
      (z_out_11[1]), (z_out_5[1]), {and_dcpl_81 , and_dcpl_30 , and_dcpl_32 , nor_116_nl
      , VEC_LOOP_or_83_cse , and_dcpl_40 , VEC_LOOP_or_52_cse , and_dcpl_67});
  assign or_251_nl = (~ (fsm_output[4])) | (fsm_output[7]) | (~ (fsm_output[6]));
  assign mux_206_nl = MUX_s_1_2_2(or_251_nl, or_463_cse, fsm_output[5]);
  assign mux_205_nl = MUX_s_1_2_2(or_249_cse, or_54_cse, fsm_output[4]);
  assign nand_5_nl = ~((fsm_output[5]) & (~ mux_205_nl));
  assign mux_207_nl = MUX_s_1_2_2(mux_206_nl, nand_5_nl, fsm_output[3]);
  assign mux_204_nl = MUX_s_1_2_2(mux_485_cse, mux_484_cse, fsm_output[3]);
  assign mux_208_nl = MUX_s_1_2_2(mux_207_nl, mux_204_nl, fsm_output[2]);
  assign mux_202_nl = MUX_s_1_2_2(mux_484_cse, or_229_cse, fsm_output[3]);
  assign mux_199_nl = MUX_s_1_2_2(or_54_cse, or_243_cse, fsm_output[4]);
  assign or_245_nl = (fsm_output[5]) | mux_199_nl;
  assign mux_200_nl = MUX_s_1_2_2(or_245_nl, mux_485_cse, fsm_output[3]);
  assign mux_203_nl = MUX_s_1_2_2(mux_202_nl, mux_200_nl, fsm_output[2]);
  assign mux_209_nl = MUX_s_1_2_2(mux_208_nl, mux_203_nl, fsm_output[1]);
  assign nor_115_nl = ~(mux_209_nl | (fsm_output[0]));
  assign VEC_LOOP_mux1h_7_nl = MUX1HOT_s_1_7_2((COMP_LOOP_twiddle_f_9_sva[0]), (VEC_LOOP_acc_10_cse_1_sva[0]),
      (z_out_10[0]), (VEC_LOOP_acc_1_cse_10_sva[0]), (acc_4_cse_12_1[0]), (z_out_11[0]),
      (z_out_5[0]), {and_dcpl_81 , and_dcpl_30 , and_dcpl_32 , nor_115_nl , VEC_LOOP_or_83_cse
      , VEC_LOOP_or_52_cse , and_dcpl_67});
  assign vec_rsci_adra_d = {VEC_LOOP_mux1h_8_nl , VEC_LOOP_mux1h_6_nl , VEC_LOOP_mux1h_4_nl
      , VEC_LOOP_mux1h_2_nl , VEC_LOOP_mux1h_nl , VEC_LOOP_mux1h_1_nl , VEC_LOOP_mux1h_3_nl
      , VEC_LOOP_mux1h_5_nl , VEC_LOOP_mux1h_7_nl};
  assign vec_rsci_wea_d = vec_rsci_wea_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d = vec_rsci_rwA_rw_ram_ir_internal_WMASK_B_d_reg;
  assign twiddle_rsci_adra_d = twiddle_rsci_adra_d_reg;
  assign twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_adra_d = twiddle_h_rsci_adra_d_reg;
  assign twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsci_da_d = vec_rsci_da_d_reg;
  assign and_dcpl_169 = ~((fsm_output[2]) | (fsm_output[0]));
  assign and_dcpl_171 = (fsm_output[3]) & (fsm_output[1]) & and_dcpl_169;
  assign and_dcpl_172 = ~((fsm_output[7]) | (fsm_output[4]));
  assign and_dcpl_173 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_174 = and_dcpl_173 & and_dcpl_172;
  assign and_dcpl_175 = and_dcpl_174 & and_dcpl_171;
  assign and_dcpl_176 = (fsm_output[2]) & (~ (fsm_output[0]));
  assign and_dcpl_177 = (fsm_output[3]) & (~ (fsm_output[1]));
  assign and_dcpl_181 = and_dcpl_21 & and_dcpl_172 & and_dcpl_177 & and_dcpl_176;
  assign and_dcpl_184 = (~ (fsm_output[7])) & (fsm_output[4]);
  assign and_dcpl_186 = and_dcpl_21 & and_dcpl_184 & (~ (fsm_output[3])) & (fsm_output[1])
      & and_dcpl_176;
  assign and_dcpl_187 = ~((fsm_output[3]) | (fsm_output[1]));
  assign and_dcpl_188 = and_dcpl_187 & and_dcpl_169;
  assign and_dcpl_189 = and_dcpl_174 & and_dcpl_188;
  assign and_dcpl_192 = and_dcpl_173 & and_dcpl_184 & and_dcpl_187 & and_dcpl_176;
  assign and_dcpl_196 = (fsm_output[6:5]==2'b10) & and_dcpl_172 & and_dcpl_177 &
      and_dcpl_169;
  assign and_dcpl_198 = (fsm_output[6:5]==2'b11) & and_dcpl_184;
  assign and_dcpl_199 = and_dcpl_198 & and_dcpl_188;
  assign and_dcpl_200 = and_dcpl_198 & and_dcpl_171;
  assign and_dcpl_202 = (~ (fsm_output[3])) & (fsm_output[1]);
  assign and_dcpl_203 = and_dcpl_202 & (~ (fsm_output[2])) & (~ (fsm_output[0]));
  assign and_dcpl_204 = ~((fsm_output[5:4]!=2'b00));
  assign and_dcpl_205 = ~((fsm_output[7:6]!=2'b00));
  assign and_dcpl_207 = and_dcpl_205 & and_dcpl_204 & and_dcpl_203;
  assign and_dcpl_210 = (fsm_output[3]) & (fsm_output[1]) & and_dcpl_176;
  assign and_dcpl_213 = and_dcpl_205 & (fsm_output[5:4]==2'b11) & and_dcpl_210;
  assign and_dcpl_215 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_216 = and_dcpl_215 & (fsm_output[5:4]==2'b01);
  assign and_dcpl_217 = and_dcpl_216 & and_dcpl_203;
  assign and_dcpl_220 = and_dcpl_216 & (fsm_output[3]) & (~ (fsm_output[1])) & and_dcpl_176;
  assign and_dcpl_224 = and_dcpl_215 & (fsm_output[5:4]==2'b10) & and_dcpl_202 &
      and_dcpl_176;
  assign and_dcpl_228 = (fsm_output[7:6]==2'b10) & and_dcpl_204;
  assign and_dcpl_229 = and_dcpl_228 & (~ (fsm_output[3])) & (~ (fsm_output[1]))
      & and_dcpl_176;
  assign and_dcpl_230 = and_dcpl_228 & and_dcpl_210;
  assign or_tmp_379 = (fsm_output[1]) | (fsm_output[7]) | (~ (fsm_output[3]));
  assign or_498_nl = (fsm_output[7]) | (fsm_output[3]);
  assign or_497_nl = (fsm_output[7]) | (~ (fsm_output[3]));
  assign mux_515_nl = MUX_s_1_2_2(or_498_nl, or_497_nl, fsm_output[1]);
  assign mux_496_nl = MUX_s_1_2_2(mux_515_nl, or_tmp_379, fsm_output[5]);
  assign mux_tmp_497 = MUX_s_1_2_2(or_tmp_352, mux_496_nl, fsm_output[6]);
  assign not_tmp_233 = MUX_s_1_2_2((fsm_output[3]), (~ (fsm_output[3])), fsm_output[7]);
  assign and_dcpl_232 = (fsm_output[2]) & (fsm_output[0]);
  assign and_dcpl_234 = and_172_cse & and_dcpl_232;
  assign and_dcpl_237 = and_dcpl_21 & (fsm_output[7]) & (~ (fsm_output[4]));
  assign and_dcpl_238 = and_dcpl_237 & and_dcpl_234;
  assign and_dcpl_241 = and_dcpl_237 & (~ (fsm_output[3])) & (~ (fsm_output[1]))
      & and_dcpl_232;
  assign and_dcpl_242 = (~ (fsm_output[2])) & (fsm_output[0]);
  assign and_dcpl_243 = and_172_cse & and_dcpl_242;
  assign and_dcpl_247 = nor_tmp_31 & and_dcpl_184 & and_dcpl_243;
  assign and_dcpl_249 = (fsm_output[3]) & (~ (fsm_output[1])) & and_dcpl_232;
  assign and_dcpl_251 = (fsm_output[6:5]==2'b10) & and_dcpl_184;
  assign and_dcpl_252 = and_dcpl_251 & and_dcpl_249;
  assign and_dcpl_254 = and_dcpl_202 & and_dcpl_232;
  assign and_dcpl_257 = nor_tmp_31 & and_dcpl_172 & and_dcpl_254;
  assign and_dcpl_259 = and_dcpl_251 & and_dcpl_202 & and_dcpl_242;
  assign and_dcpl_262 = and_dcpl_173 & and_dcpl_184 & and_dcpl_234;
  assign and_dcpl_264 = and_dcpl_21 & and_dcpl_184 & and_dcpl_254;
  assign and_dcpl_266 = and_dcpl_173 & and_dcpl_172 & and_dcpl_243;
  assign and_dcpl_268 = and_dcpl_21 & and_dcpl_172 & and_dcpl_249;
  assign and_dcpl_282 = (fsm_output==8'b10100011);
  assign and_dcpl_295 = (fsm_output==8'b01111100);
  assign and_dcpl_298 = and_172_cse & and_dcpl_176;
  assign and_dcpl_305 = and_dcpl_177 & and_dcpl_169;
  assign and_dcpl_306 = (fsm_output[5:4]==2'b01);
  assign and_dcpl_310 = and_dcpl_202 & and_dcpl_169;
  assign and_dcpl_311 = (fsm_output[5:4]==2'b10);
  assign and_dcpl_312 = and_dcpl_205 & and_dcpl_311;
  assign and_dcpl_314 = and_dcpl_177 & and_dcpl_176;
  assign and_dcpl_316 = and_dcpl_202 & and_dcpl_176;
  assign and_dcpl_321 = (~ (fsm_output[3])) & (~ (fsm_output[1])) & and_dcpl_169;
  assign and_dcpl_323 = and_dcpl_215 & and_dcpl_204;
  assign and_dcpl_325 = and_172_cse & and_dcpl_169;
  assign and_dcpl_331 = and_dcpl_215 & and_193_cse;
  assign and_dcpl_334 = (fsm_output[7:6]==2'b10);
  assign and_dcpl_337 = and_dcpl_334 & and_dcpl_306;
  assign or_tmp_386 = (~ (fsm_output[4])) | (fsm_output[2]) | (fsm_output[7]);
  assign or_nl = (fsm_output[2]) | (~ (fsm_output[7]));
  assign nand_36_nl = ~((fsm_output[2]) & (fsm_output[7]));
  assign mux_505_nl = MUX_s_1_2_2(or_nl, nand_36_nl, fsm_output[4]);
  assign mux_506_nl = MUX_s_1_2_2(mux_505_nl, or_tmp_386, fsm_output[5]);
  assign or_502_nl = (fsm_output[5]) | (fsm_output[4]) | (~ (fsm_output[2])) | (fsm_output[7]);
  assign mux_tmp_507 = MUX_s_1_2_2(mux_506_nl, or_502_nl, fsm_output[6]);
  assign or_505_nl = (fsm_output[4]) | (~ (fsm_output[2])) | (fsm_output[7]);
  assign mux_tmp_508 = MUX_s_1_2_2(or_tmp_386, or_505_nl, fsm_output[5]);
  assign or_507_nl = (fsm_output[2]) | (fsm_output[7]);
  assign or_506_nl = (~ (fsm_output[2])) | (fsm_output[7]);
  assign mux_tmp_509 = MUX_s_1_2_2(or_507_nl, or_506_nl, fsm_output[4]);
  assign nand_34_nl = ~((fsm_output[5]) & (~ mux_tmp_509));
  assign mux_512_nl = MUX_s_1_2_2(mux_tmp_508, nand_34_nl, fsm_output[6]);
  assign mux_513_nl = MUX_s_1_2_2(mux_tmp_507, mux_512_nl, fsm_output[1]);
  assign or_508_nl = (fsm_output[5]) | mux_tmp_509;
  assign mux_510_nl = MUX_s_1_2_2(or_508_nl, mux_tmp_508, fsm_output[6]);
  assign mux_511_nl = MUX_s_1_2_2(mux_510_nl, mux_tmp_507, fsm_output[1]);
  assign mux_514_nl = MUX_s_1_2_2(mux_513_nl, mux_511_nl, fsm_output[3]);
  assign and_dcpl_462 = (~ mux_514_nl) & (fsm_output[0]);
  assign and_dcpl_465 = (~ (fsm_output[3])) & (~ (fsm_output[1])) & and_dcpl_176;
  assign and_dcpl_469 = and_dcpl_205 & and_dcpl_204 & and_dcpl_465;
  assign and_dcpl_473 = and_dcpl_215 & and_dcpl_306 & and_dcpl_465;
  assign and_dcpl_478 = and_dcpl_205 & (fsm_output[5:4]==2'b10) & and_dcpl_314;
  assign and_dcpl_481 = and_dcpl_215 & (fsm_output[5:4]==2'b11) & and_dcpl_314;
  assign and_dcpl_483 = and_dcpl_177 & (~ (fsm_output[2])) & (fsm_output[0]);
  assign and_dcpl_486 = (fsm_output[7:6]==2'b10) & and_dcpl_306 & and_dcpl_483;
  assign and_dcpl_488 = and_dcpl_215 & and_dcpl_204 & and_dcpl_483;
  assign and_dcpl_505 = (fsm_output[3]) & (~ (fsm_output[1])) & and_dcpl_169;
  assign and_dcpl_509 = and_dcpl_205 & and_dcpl_306 & and_dcpl_505;
  assign and_dcpl_515 = and_dcpl_215 & (fsm_output[5:4]==2'b00) & and_dcpl_188;
  assign and_dcpl_518 = and_dcpl_215 & and_dcpl_311 & and_dcpl_505;
  assign and_dcpl_521 = (fsm_output[7:6]==2'b10) & and_dcpl_306 & and_dcpl_188;
  assign and_dcpl_523 = and_dcpl_187 & (~ (fsm_output[2])) & (fsm_output[0]);
  assign and_dcpl_526 = and_dcpl_215 & (fsm_output[5:4]==2'b11) & and_dcpl_523;
  assign and_dcpl_528 = and_dcpl_205 & and_dcpl_311 & and_dcpl_523;
  assign or_513_nl = (fsm_output[6]) | (fsm_output[2]) | (fsm_output[3]) | (fsm_output[4]);
  assign mux_tmp = MUX_s_1_2_2((fsm_output[6]), or_513_nl, fsm_output[5]);
  assign not_tmp = ~((fsm_output[6:1]!=6'b000000));
  assign nor_tmp_55 = (fsm_output[5]) & (fsm_output[3]) & (fsm_output[2]);
  assign or_tmp_403 = (fsm_output[3:0]!=4'b1000);
  assign COMP_LOOP_twiddle_f_or_18_itm = and_dcpl_175 | and_dcpl_199;
  assign COMP_LOOP_twiddle_f_nor_5_itm = ~(and_dcpl_207 | and_dcpl_213 | and_dcpl_220
      | and_dcpl_229);
  assign COMP_LOOP_twiddle_f_or_20_itm = and_dcpl_213 | and_dcpl_220 | and_dcpl_229;
  assign COMP_LOOP_twiddle_f_or_1_itm = and_dcpl_217 | and_dcpl_224 | and_dcpl_230;
  assign VEC_LOOP_or_62_itm = and_dcpl_238 | and_dcpl_241 | and_dcpl_247 | and_dcpl_252
      | and_dcpl_257 | and_dcpl_259 | and_dcpl_262 | and_dcpl_264 | and_dcpl_266
      | and_dcpl_268;
  assign and_354_itm = and_dcpl_205 & and_dcpl_204 & and_dcpl_298;
  assign and_371_itm = and_dcpl_205 & and_193_cse & and_dcpl_316;
  assign and_380_itm = and_dcpl_215 & and_dcpl_306 & and_dcpl_298;
  assign and_388_itm = and_dcpl_334 & and_dcpl_204 & and_dcpl_316;
  assign VEC_LOOP_or_59_itm = and_dcpl_478 | and_dcpl_481;
  assign VEC_LOOP_or_68_itm = and_dcpl_473 | and_dcpl_488;
  assign VEC_LOOP_or_71_itm = and_dcpl_526 | and_dcpl_528;
  assign VEC_LOOP_nor_10_itm = ~(and_dcpl_526 | and_dcpl_528);
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      VEC_LOOP_mult_vec_1_sva <= MUX1HOT_v_32_3_2((vec_rsci_qa_d_mxwt[63:32]), (vec_rsci_qa_d_mxwt[31:0]),
          COMP_LOOP_1_modulo_sub_cmp_return_rsc_z, {and_dcpl_152 , and_dcpl_153 ,
          and_160_nl});
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
      reg_run_rsci_oswt_cse <= ~(or_dcpl_81 | (fsm_output[2]) | (fsm_output[7]) |
          or_166_cse);
      reg_vec_rsci_oswt_cse <= ~ mux_147_itm;
      reg_vec_rsci_oswt_1_cse <= nor_118_cse;
      reg_twiddle_rsci_oswt_cse <= nor_114_rmff;
      reg_twiddle_rsci_oswt_1_cse <= and_101_rmff;
      reg_complete_rsci_oswt_cse <= and_dcpl_99 & (~ (fsm_output[3])) & (fsm_output[2])
          & (fsm_output[7]) & (~ (fsm_output[1])) & (~ (fsm_output[0])) & STAGE_LOOP_acc_itm_4_1;
      reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_134;
      reg_ensig_cgo_cse <= ~ mux_261_itm;
      reg_ensig_cgo_2_cse <= ~ mux_285_itm;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_22 & and_dcpl_34) | STAGE_LOOP_i_3_0_sva_mx0c1)
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b0001, STAGE_LOOP_i_3_0_sva_2, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_297_nl ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_tmp_299 ) begin
      STAGE_LOOP_lshift_psp_sva <= STAGE_LOOP_lshift_itm;
    end
  end
  always @(posedge clk) begin
    if ( mux_519_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_12_4_sva_7_0 <= MUX_v_8_2_2(8'b00000000, (z_out_17[7:0]), COMP_LOOP_k_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_304_nl | (fsm_output[7:6]!=2'b00)) ) begin
      COMP_LOOP_1_twiddle_f_acc_cse_sva <= COMP_LOOP_1_twiddle_f_acc_cse_sva_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_316_nl | (fsm_output[7])) ) begin
      COMP_LOOP_9_twiddle_f_mul_psp_sva <= MUX_v_9_2_2((z_out_2[8:0]), (z_out_16[8:0]),
          and_dcpl_58);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_itm ) begin
      COMP_LOOP_twiddle_help_1_sva <= MUX_v_32_2_2((twiddle_h_rsci_qa_d_mxwt[31:0]),
          (twiddle_h_rsci_qa_d_mxwt[63:32]), and_dcpl_145);
      COMP_LOOP_twiddle_f_1_sva <= MUX1HOT_v_32_3_2((twiddle_rsci_qa_d_mxwt[31:0]),
          (twiddle_rsci_qa_d_mxwt[63:32]), COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
          {(~ mux_364_nl) , and_dcpl_145 , and_dcpl_60});
    end
  end
  always @(posedge clk) begin
    if ( (mux_525_nl | (fsm_output[7])) & complete_rsci_wen_comp ) begin
      COMP_LOOP_twiddle_f_9_sva <= MUX_v_32_2_2(32'b00000000000000000000000000000000,
          VEC_LOOP_mux1h_10_nl, COMP_LOOP_twiddle_f_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (and_dcpl_23 | and_dcpl_134) ) begin
      COMP_LOOP_1_VEC_LOOP_slc_VEC_LOOP_acc_20_itm <= MUX_s_1_2_2((z_out_4_20_12[8]),
          run_rsci_ivld_mxwt, and_dcpl_134);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_23 | and_dcpl_32 | and_dcpl_37 | and_dcpl_42
        | and_dcpl_44 | and_dcpl_51 | and_dcpl_54 | and_dcpl_56 | and_dcpl_58 | and_dcpl_61
        | and_dcpl_63 | and_dcpl_65 | and_dcpl_67 | and_dcpl_70 | and_dcpl_74 | and_dcpl_76)
        ) begin
      VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_12_3_2(z_out_5, acc_4_cse_12_1, z_out_11,
          {VEC_LOOP_or_48_nl , VEC_LOOP_or_49_nl , VEC_LOOP_or_52_cse});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(or_dcpl_81 | (~ (fsm_output[2])) | (fsm_output[7])
        | or_166_cse)) ) begin
      VEC_LOOP_acc_psp_sva <= z_out_16[7:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_411_nl | (fsm_output[7])) ) begin
      COMP_LOOP_twiddle_help_9_sva <= MUX_v_32_2_2(z_out_15, (twiddle_h_rsci_qa_d_mxwt[31:0]),
          and_dcpl_106);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_152 | and_dcpl_153) ) begin
      factor1_1_sva <= MUX_v_32_2_2((vec_rsci_qa_d_mxwt[31:0]), (vec_rsci_qa_d_mxwt[63:32]),
          and_dcpl_153);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_426_nl ) begin
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (VEC_LOOP_acc_1_cse_10_sva_mx0c0 | and_dcpl_32
        | VEC_LOOP_acc_1_cse_10_sva_mx0c2 | and_dcpl_42 | and_dcpl_51 | and_dcpl_56
        | and_dcpl_61 | and_dcpl_65 | and_dcpl_70 | and_dcpl_76) ) begin
      VEC_LOOP_acc_1_cse_10_sva <= MUX_v_12_2_2(12'b000000000000, VEC_LOOP_VEC_LOOP_mux_3_nl,
          VEC_LOOP_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_10_12_0_sva_1 <= 13'b0000000000000;
    end
    else if ( complete_rsci_wen_comp & (~(mux_473_nl | (fsm_output[0]))) ) begin
      VEC_LOOP_j_10_12_0_sva_1 <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_479_nl ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_532_nl & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_10 <= VEC_LOOP_VEC_LOOP_mux_2_rgt[10];
    end
  end
  always @(posedge clk) begin
    if ( mux_537_nl & nor_55_cse_1 & complete_rsci_wen_comp ) begin
      VEC_LOOP_acc_11_psp_sva_9_0 <= VEC_LOOP_VEC_LOOP_mux_2_rgt[9:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(mux_492_nl & (~ (fsm_output[7])))) ) begin
      COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out;
    end
  end
  assign and_160_nl = not_tmp_102 & and_dcpl_77;
  assign mux_296_nl = MUX_s_1_2_2((~ or_tmp_255), or_482_cse, fsm_output[7]);
  assign mux_297_nl = MUX_s_1_2_2(mux_296_nl, nor_tmp_25, or_166_cse);
  assign COMP_LOOP_k_not_nl = ~ mux_tmp_299;
  assign mux_518_nl = MUX_s_1_2_2(not_tmp, mux_tmp, fsm_output[7]);
  assign mux_516_nl = MUX_s_1_2_2(mux_tmp, or_512_cse, fsm_output[1]);
  assign mux_517_nl = MUX_s_1_2_2(not_tmp, mux_516_nl, fsm_output[7]);
  assign mux_519_nl = MUX_s_1_2_2(mux_518_nl, mux_517_nl, fsm_output[0]);
  assign mux_302_nl = MUX_s_1_2_2((~ (fsm_output[5])), (fsm_output[5]), or_164_cse);
  assign or_492_nl = nor_62_cse | (fsm_output[5]);
  assign mux_303_nl = MUX_s_1_2_2(mux_302_nl, or_492_nl, fsm_output[1]);
  assign or_493_nl = (~((fsm_output[4:1]!=4'b0000))) | (fsm_output[5]);
  assign mux_304_nl = MUX_s_1_2_2(mux_303_nl, or_493_nl, fsm_output[0]);
  assign mux_314_nl = MUX_s_1_2_2(mux_tmp_309, or_482_cse, fsm_output[2]);
  assign mux_312_nl = MUX_s_1_2_2(mux_tmp_308, or_tmp_261, fsm_output[3]);
  assign mux_313_nl = MUX_s_1_2_2(mux_312_nl, mux_tmp_306, fsm_output[2]);
  assign mux_315_nl = MUX_s_1_2_2(mux_314_nl, mux_313_nl, fsm_output[1]);
  assign mux_310_nl = MUX_s_1_2_2(mux_tmp_309, mux_tmp_306, fsm_output[2]);
  assign mux_307_nl = MUX_s_1_2_2(or_482_cse, mux_tmp_306, fsm_output[2]);
  assign mux_311_nl = MUX_s_1_2_2(mux_310_nl, mux_307_nl, fsm_output[1]);
  assign mux_316_nl = MUX_s_1_2_2(mux_315_nl, mux_311_nl, fsm_output[0]);
  assign or_368_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_362_nl = MUX_s_1_2_2(or_368_nl, mux_tmp_359, fsm_output[3]);
  assign nand_10_nl = ~((fsm_output[4]) & (~ mux_362_nl));
  assign or_363_nl = (~ (fsm_output[1])) | (fsm_output[6]) | (~ (VEC_LOOP_j_10_12_0_sva_1[12]))
      | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_360_nl = MUX_s_1_2_2(mux_tmp_359, or_363_nl, fsm_output[3]);
  assign or_362_nl = (~ (fsm_output[3])) | (fsm_output[1]) | (~ (fsm_output[6]))
      | (fsm_output[7]) | (fsm_output[5]);
  assign mux_361_nl = MUX_s_1_2_2(mux_360_nl, or_362_nl, fsm_output[4]);
  assign mux_363_nl = MUX_s_1_2_2(nand_10_nl, mux_361_nl, fsm_output[2]);
  assign or_360_nl = (fsm_output[1]) | (~ (fsm_output[6])) | (fsm_output[7]) | (fsm_output[5]);
  assign mux_357_nl = MUX_s_1_2_2(mux_tmp_354, or_360_nl, fsm_output[3]);
  assign or_361_nl = (fsm_output[4]) | mux_357_nl;
  assign or_359_nl = (~ (fsm_output[3])) | (fsm_output[1]) | (fsm_output[6]) | (fsm_output[7])
      | (fsm_output[5]);
  assign or_355_nl = (~ (fsm_output[1])) | (fsm_output[6]) | (fsm_output[7]) | (~
      (fsm_output[5]));
  assign mux_355_nl = MUX_s_1_2_2(mux_tmp_354, or_355_nl, fsm_output[3]);
  assign mux_356_nl = MUX_s_1_2_2(or_359_nl, mux_355_nl, fsm_output[4]);
  assign mux_358_nl = MUX_s_1_2_2(or_361_nl, mux_356_nl, fsm_output[2]);
  assign mux_364_nl = MUX_s_1_2_2(mux_363_nl, mux_358_nl, fsm_output[0]);
  assign nor_141_nl = ~(mux_219_itm | (fsm_output[0]));
  assign VEC_LOOP_mux1h_10_nl = MUX1HOT_v_32_3_2(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z,
      COMP_LOOP_twiddle_help_9_sva, (twiddle_rsci_qa_d_mxwt[31:0]), {nor_141_nl ,
      and_dcpl_102 , and_dcpl_106});
  assign mux_379_nl = MUX_s_1_2_2(or_136_cse, or_224_cse, fsm_output[3]);
  assign mux_380_nl = MUX_s_1_2_2(or_tmp_282, mux_379_nl, fsm_output[1]);
  assign or_380_nl = (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[7]) | (fsm_output[4]);
  assign mux_381_nl = MUX_s_1_2_2(mux_380_nl, or_380_nl, fsm_output[0]);
  assign mux_376_nl = MUX_s_1_2_2(or_136_cse, (fsm_output[7]), fsm_output[3]);
  assign mux_377_nl = MUX_s_1_2_2(mux_376_nl, or_223_cse, fsm_output[1]);
  assign or_378_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[4]));
  assign mux_378_nl = MUX_s_1_2_2(mux_377_nl, or_378_nl, fsm_output[0]);
  assign mux_382_nl = MUX_s_1_2_2(mux_381_nl, mux_378_nl, fsm_output[5]);
  assign or_376_nl = (fsm_output[0]) | (fsm_output[1]) | (~ (fsm_output[3])) | (fsm_output[7])
      | (~ (fsm_output[4]));
  assign mux_375_nl = MUX_s_1_2_2((fsm_output[7]), or_376_nl, fsm_output[5]);
  assign mux_383_nl = MUX_s_1_2_2(mux_382_nl, mux_375_nl, fsm_output[6]);
  assign mux_370_nl = MUX_s_1_2_2((fsm_output[7]), (fsm_output[4]), fsm_output[3]);
  assign mux_368_nl = MUX_s_1_2_2((fsm_output[4]), (~ (fsm_output[4])), fsm_output[7]);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, or_223_cse, fsm_output[3]);
  assign mux_371_nl = MUX_s_1_2_2(mux_370_nl, mux_369_nl, fsm_output[1]);
  assign mux_372_nl = MUX_s_1_2_2(mux_371_nl, or_tmp_283, fsm_output[0]);
  assign mux_373_nl = MUX_s_1_2_2(mux_372_nl, or_223_cse, fsm_output[5]);
  assign and_171_nl = or_166_cse & (fsm_output[3]);
  assign mux_366_nl = MUX_s_1_2_2((fsm_output[7]), or_224_cse, and_171_nl);
  assign mux_365_nl = MUX_s_1_2_2(or_tmp_283, or_tmp_282, fsm_output[1]);
  assign or_371_nl = (fsm_output[0]) | mux_365_nl;
  assign mux_367_nl = MUX_s_1_2_2(mux_366_nl, or_371_nl, fsm_output[5]);
  assign mux_374_nl = MUX_s_1_2_2(mux_373_nl, mux_367_nl, fsm_output[6]);
  assign mux_384_nl = MUX_s_1_2_2(mux_383_nl, mux_374_nl, fsm_output[2]);
  assign COMP_LOOP_twiddle_f_not_1_nl = ~ mux_384_nl;
  assign nor_181_nl = ~((fsm_output[1]) | (fsm_output[4]) | (~ (fsm_output[3])));
  assign mux_523_nl = MUX_s_1_2_2(nor_181_nl, and_dcpl_35, fsm_output[5]);
  assign mux_524_nl = MUX_s_1_2_2((~ mux_523_nl), (fsm_output[5]), fsm_output[6]);
  assign mux_520_nl = MUX_s_1_2_2(and_dcpl_35, (fsm_output[4]), or_166_cse);
  assign mux_521_nl = MUX_s_1_2_2(nor_182_cse, mux_520_nl, fsm_output[5]);
  assign or_516_nl = (fsm_output[5]) | (or_166_cse & (fsm_output[4:3]==2'b11));
  assign mux_522_nl = MUX_s_1_2_2((~ mux_521_nl), or_516_nl, fsm_output[6]);
  assign mux_525_nl = MUX_s_1_2_2(mux_524_nl, mux_522_nl, fsm_output[2]);
  assign VEC_LOOP_or_48_nl = and_dcpl_23 | and_dcpl_67;
  assign VEC_LOOP_or_49_nl = and_dcpl_32 | and_dcpl_61 | VEC_LOOP_or_50_cse | VEC_LOOP_or_51_cse
      | VEC_LOOP_or_55_cse | VEC_LOOP_or_54_cse | VEC_LOOP_or_53_cse;
  assign mux_389_nl = MUX_s_1_2_2(or_tmp_294, mux_tmp_386, and_dcpl_35);
  assign mux_410_nl = MUX_s_1_2_2(mux_tmp_391, mux_389_nl, fsm_output[2]);
  assign mux_385_nl = MUX_s_1_2_2(or_tmp_294, or_tmp_125, fsm_output[4]);
  assign mux_388_nl = MUX_s_1_2_2(mux_tmp_387, mux_385_nl, fsm_output[3]);
  assign mux_392_nl = MUX_s_1_2_2(mux_tmp_391, mux_388_nl, fsm_output[2]);
  assign mux_411_nl = MUX_s_1_2_2(mux_410_nl, mux_392_nl, or_166_cse);
  assign mux_424_nl = MUX_s_1_2_2((~ or_tmp_203), or_tmp_203, fsm_output[7]);
  assign mux_425_nl = MUX_s_1_2_2(mux_424_nl, mux_tmp_422, fsm_output[1]);
  assign mux_421_nl = MUX_s_1_2_2((~ or_tmp_315), or_tmp_315, fsm_output[7]);
  assign mux_423_nl = MUX_s_1_2_2(mux_tmp_422, mux_421_nl, fsm_output[1]);
  assign mux_426_nl = MUX_s_1_2_2(mux_425_nl, mux_423_nl, fsm_output[0]);
  assign VEC_LOOP_VEC_LOOP_mux_3_nl = MUX_v_12_2_2(z_out_10, (VEC_LOOP_j_10_12_0_sva_1[11:0]),
      VEC_LOOP_acc_1_cse_10_sva_mx0c2);
  assign VEC_LOOP_not_nl = ~ VEC_LOOP_acc_1_cse_10_sva_mx0c0;
  assign or_453_nl = (~ (fsm_output[3])) | (~ (fsm_output[7])) | (fsm_output[5]);
  assign mux_470_nl = MUX_s_1_2_2(mux_tmp_467, or_453_nl, fsm_output[1]);
  assign mux_471_nl = MUX_s_1_2_2(mux_470_nl, or_tmp_352, fsm_output[6]);
  assign mux_472_nl = MUX_s_1_2_2(mux_tmp_466, mux_471_nl, fsm_output[4]);
  assign or_451_nl = (~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[5]));
  assign mux_468_nl = MUX_s_1_2_2(or_451_nl, mux_tmp_467, fsm_output[1]);
  assign or_452_nl = (fsm_output[6]) | mux_468_nl;
  assign mux_469_nl = MUX_s_1_2_2(or_452_nl, mux_tmp_466, fsm_output[4]);
  assign mux_473_nl = MUX_s_1_2_2(mux_472_nl, mux_469_nl, fsm_output[2]);
  assign mux_477_nl = MUX_s_1_2_2(not_tmp_195, or_dcpl_81, fsm_output[7]);
  assign mux_478_nl = MUX_s_1_2_2(mux_477_nl, mux_tmp_475, fsm_output[1]);
  assign nor_57_nl = ~((((fsm_output[3:2]!=2'b00)) & (fsm_output[4])) | (fsm_output[6:5]!=2'b00));
  assign mux_474_nl = MUX_s_1_2_2(nor_57_nl, or_tmp_255, fsm_output[7]);
  assign mux_476_nl = MUX_s_1_2_2(mux_tmp_475, mux_474_nl, fsm_output[1]);
  assign mux_479_nl = MUX_s_1_2_2(mux_478_nl, mux_476_nl, fsm_output[0]);
  assign or_527_nl = (fsm_output[3:1]!=3'b000);
  assign mux_529_nl = MUX_s_1_2_2(or_tmp_403, or_527_nl, fsm_output[5]);
  assign mux_530_nl = MUX_s_1_2_2(nor_tmp_55, (~ mux_529_nl), fsm_output[4]);
  assign mux_527_nl = MUX_s_1_2_2(or_526_cse, or_tmp_403, fsm_output[5]);
  assign mux_528_nl = MUX_s_1_2_2((~ mux_527_nl), nor_tmp_55, fsm_output[4]);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, mux_528_nl, fsm_output[6]);
  assign or_523_nl = (fsm_output[5]) | (fsm_output[3]) | (fsm_output[1]) | (fsm_output[2]);
  assign or_522_nl = (fsm_output[5]) | (fsm_output[0]) | (fsm_output[3]) | (fsm_output[1])
      | (fsm_output[2]);
  assign mux_526_nl = MUX_s_1_2_2(or_523_nl, or_522_nl, fsm_output[4]);
  assign nor_180_nl = ~((fsm_output[6]) | mux_526_nl);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, nor_180_nl, fsm_output[7]);
  assign nor_174_nl = ~((fsm_output[4:2]!=3'b110));
  assign mux_535_nl = MUX_s_1_2_2(nor_174_nl, nor_62_cse, fsm_output[6]);
  assign nor_176_nl = ~((fsm_output[4]) | (~ and_169_cse));
  assign nor_177_nl = ~((fsm_output[3:2]!=2'b10));
  assign mux_533_nl = MUX_s_1_2_2(nor_177_nl, and_169_cse, fsm_output[4]);
  assign mux_534_nl = MUX_s_1_2_2(nor_176_nl, mux_533_nl, fsm_output[6]);
  assign mux_536_nl = MUX_s_1_2_2(mux_535_nl, mux_534_nl, fsm_output[5]);
  assign mux_537_nl = MUX_s_1_2_2(mux_536_nl, nor_178_cse, fsm_output[7]);
  assign mux_491_nl = MUX_s_1_2_2(and_dcpl_21, mux_tmp_386, fsm_output[4]);
  assign mux_492_nl = MUX_s_1_2_2(or_tmp_261, (~ mux_491_nl), or_526_cse);
  assign COMP_LOOP_twiddle_f_or_30_nl = and_dcpl_189 | and_dcpl_192 | and_dcpl_196
      | and_dcpl_200;
  assign COMP_LOOP_twiddle_f_mux1h_166_nl = MUX1HOT_v_12_4_2(({2'b00 , COMP_LOOP_5_twiddle_f_lshift_ncse_sva}),
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1, ({1'b0 , COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1}),
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva, {COMP_LOOP_twiddle_f_or_18_itm , and_dcpl_181
      , and_dcpl_186 , COMP_LOOP_twiddle_f_or_30_nl});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl = MUX_v_2_2_2((COMP_LOOP_k_12_4_sva_7_0[7:6]),
      ({1'b0 , (COMP_LOOP_k_12_4_sva_7_0[7])}), and_dcpl_186);
  assign COMP_LOOP_twiddle_f_nor_9_nl = ~(and_dcpl_175 | and_dcpl_199);
  assign COMP_LOOP_twiddle_f_and_16_nl = MUX_v_2_2_2(2'b00, COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl,
      COMP_LOOP_twiddle_f_nor_9_nl);
  assign COMP_LOOP_twiddle_f_or_31_nl = and_dcpl_181 | and_dcpl_189 | and_dcpl_192
      | and_dcpl_196 | and_dcpl_200;
  assign COMP_LOOP_twiddle_f_mux1h_167_nl = MUX1HOT_v_6_3_2((COMP_LOOP_k_12_4_sva_7_0[7:2]),
      (COMP_LOOP_k_12_4_sva_7_0[5:0]), (COMP_LOOP_k_12_4_sva_7_0[6:1]), {COMP_LOOP_twiddle_f_or_18_itm
      , COMP_LOOP_twiddle_f_or_31_nl , and_dcpl_186});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl = MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0[1]),
      (COMP_LOOP_k_12_4_sva_7_0[0]), and_dcpl_186);
  assign COMP_LOOP_twiddle_f_or_32_nl = (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl
      & (~(and_dcpl_181 | and_dcpl_189 | and_dcpl_192 | and_dcpl_196))) | and_dcpl_200;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl = ((COMP_LOOP_k_12_4_sva_7_0[0])
      & (~(and_dcpl_181 | and_dcpl_186 | and_dcpl_189))) | and_dcpl_192 | and_dcpl_196
      | and_dcpl_200;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl = (~(and_dcpl_175 | and_dcpl_181
      | and_dcpl_186 | and_dcpl_192 | and_dcpl_200)) | and_dcpl_189 | and_dcpl_196
      | and_dcpl_199;
  assign nl_z_out_1 = COMP_LOOP_twiddle_f_mux1h_166_nl * ({COMP_LOOP_twiddle_f_and_16_nl
      , COMP_LOOP_twiddle_f_mux1h_167_nl , COMP_LOOP_twiddle_f_or_32_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_4_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_5_nl , 1'b1});
  assign z_out_1 = nl_z_out_1[11:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl = (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11])
      & COMP_LOOP_twiddle_f_nor_5_itm;
  assign COMP_LOOP_twiddle_f_mux1h_168_nl = MUX1HOT_v_11_3_2(({2'b00 , COMP_LOOP_9_twiddle_f_lshift_itm}),
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva, (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[10:0]),
      {and_dcpl_207 , COMP_LOOP_twiddle_f_or_20_itm , COMP_LOOP_twiddle_f_or_1_itm});
  assign COMP_LOOP_twiddle_f_and_19_nl = (COMP_LOOP_k_12_4_sva_7_0[7]) & COMP_LOOP_twiddle_f_nor_5_itm;
  assign COMP_LOOP_twiddle_f_mux1h_169_nl = MUX1HOT_v_7_3_2(({2'b00 , (COMP_LOOP_k_12_4_sva_7_0[7:3])}),
      (COMP_LOOP_k_12_4_sva_7_0[7:1]), (COMP_LOOP_k_12_4_sva_7_0[6:0]), {and_dcpl_207
      , COMP_LOOP_twiddle_f_or_20_itm , COMP_LOOP_twiddle_f_or_1_itm});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl = MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0[2]),
      (COMP_LOOP_k_12_4_sva_7_0[0]), COMP_LOOP_twiddle_f_or_20_itm);
  assign COMP_LOOP_twiddle_f_or_33_nl = COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_7_nl
      | and_dcpl_217 | and_dcpl_224 | and_dcpl_230;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl = ((COMP_LOOP_k_12_4_sva_7_0[1])
      & (~(and_dcpl_213 | and_dcpl_217 | and_dcpl_224))) | and_dcpl_220 | and_dcpl_229
      | and_dcpl_230;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl = ((COMP_LOOP_k_12_4_sva_7_0[0])
      & (~(and_dcpl_217 | and_dcpl_220))) | and_dcpl_213 | and_dcpl_224 | and_dcpl_229
      | and_dcpl_230;
  assign nl_z_out_2 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_1_nl , COMP_LOOP_twiddle_f_mux1h_168_nl})
      * ({COMP_LOOP_twiddle_f_and_19_nl , COMP_LOOP_twiddle_f_mux1h_169_nl , COMP_LOOP_twiddle_f_or_33_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_6_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_7_nl
      , 1'b1});
  assign z_out_2 = nl_z_out_2[11:0];
  assign VEC_LOOP_VEC_LOOP_or_12_nl = (STAGE_LOOP_lshift_psp_sva[12]) | and_dcpl_238
      | and_dcpl_241 | and_dcpl_247 | and_dcpl_252 | and_dcpl_257 | and_dcpl_259
      | and_dcpl_262 | and_dcpl_264 | and_dcpl_266 | and_dcpl_268;
  assign VEC_LOOP_VEC_LOOP_mux_9_nl = MUX_v_12_2_2((STAGE_LOOP_lshift_psp_sva[11:0]),
      (~ (STAGE_LOOP_lshift_psp_sva[12:1])), VEC_LOOP_or_62_itm);
  assign nand_41_nl = ~((fsm_output[1]) & not_tmp_233);
  assign mux_540_nl = MUX_s_1_2_2(nand_41_nl, or_tmp_379, fsm_output[5]);
  assign or_534_nl = (fsm_output[6]) | mux_540_nl;
  assign mux_539_nl = MUX_s_1_2_2(mux_tmp_497, or_534_nl, fsm_output[2]);
  assign and_593_nl = (fsm_output[7]) & (fsm_output[3]);
  assign mux_543_nl = MUX_s_1_2_2(not_tmp_233, and_593_nl, fsm_output[1]);
  assign or_535_nl = (fsm_output[5]) | (~ mux_543_nl);
  assign mux_542_nl = MUX_s_1_2_2(or_535_nl, or_tmp_352, fsm_output[6]);
  assign mux_541_nl = MUX_s_1_2_2(mux_542_nl, mux_tmp_497, fsm_output[2]);
  assign mux_538_nl = MUX_s_1_2_2(mux_539_nl, mux_541_nl, fsm_output[4]);
  assign VEC_LOOP_or_75_nl = mux_538_nl | (fsm_output[0]) | and_dcpl_238 | and_dcpl_241
      | and_dcpl_247 | and_dcpl_252 | and_dcpl_257 | and_dcpl_259 | and_dcpl_262
      | and_dcpl_264 | and_dcpl_266 | and_dcpl_268;
  assign VEC_LOOP_VEC_LOOP_mux_10_nl = MUX_v_8_2_2((VEC_LOOP_acc_1_cse_10_sva[11:4]),
      COMP_LOOP_k_12_4_sva_7_0, VEC_LOOP_or_62_itm);
  assign VEC_LOOP_VEC_LOOP_or_13_nl = ((VEC_LOOP_acc_1_cse_10_sva[3]) & (~(and_dcpl_262
      | and_dcpl_264 | and_dcpl_266 | and_dcpl_268))) | and_dcpl_238 | and_dcpl_241
      | and_dcpl_247 | and_dcpl_252 | and_dcpl_257 | and_dcpl_259;
  assign VEC_LOOP_VEC_LOOP_or_14_nl = ((VEC_LOOP_acc_1_cse_10_sva[2]) & (~(and_dcpl_252
      | and_dcpl_257 | and_dcpl_259 | and_dcpl_264 | and_dcpl_268))) | and_dcpl_238
      | and_dcpl_241 | and_dcpl_247 | and_dcpl_262 | and_dcpl_266;
  assign VEC_LOOP_VEC_LOOP_or_15_nl = ((VEC_LOOP_acc_1_cse_10_sva[1]) & (~(and_dcpl_241
      | and_dcpl_247 | and_dcpl_252 | and_dcpl_259 | and_dcpl_266 | and_dcpl_268)))
      | and_dcpl_238 | and_dcpl_257 | and_dcpl_262 | and_dcpl_264;
  assign VEC_LOOP_VEC_LOOP_or_16_nl = ((VEC_LOOP_acc_1_cse_10_sva[0]) & (~(and_dcpl_238
      | and_dcpl_247 | and_dcpl_257 | and_dcpl_259 | and_dcpl_262 | and_dcpl_264
      | and_dcpl_266))) | and_dcpl_241 | and_dcpl_252 | and_dcpl_268;
  assign nl_acc_nl = ({VEC_LOOP_VEC_LOOP_or_12_nl , VEC_LOOP_VEC_LOOP_mux_9_nl ,
      VEC_LOOP_or_75_nl}) + conv_u2u_13_14({VEC_LOOP_VEC_LOOP_mux_10_nl , VEC_LOOP_VEC_LOOP_or_13_nl
      , VEC_LOOP_VEC_LOOP_or_14_nl , VEC_LOOP_VEC_LOOP_or_15_nl , VEC_LOOP_VEC_LOOP_or_16_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[13:0];
  assign z_out_3 = readslicef_14_13_1(acc_nl);
  assign VEC_LOOP_mux_17_nl = MUX_v_20_2_2((z_out_15[31:12]), ({7'b0000000 , z_out_17
      , 4'b0000}), and_dcpl_282);
  assign VEC_LOOP_or_76_nl = (~(and_dcpl_205 & and_dcpl_204 & and_dcpl_187 & (fsm_output[2])
      & (~ (fsm_output[0])))) | and_dcpl_282;
  assign VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl = ~(MUX_v_12_2_2(12'b000000000000,
      (STAGE_LOOP_lshift_psp_sva[12:1]), and_dcpl_282));
  assign nl_acc_1_nl = conv_u2u_21_22({VEC_LOOP_mux_17_nl , VEC_LOOP_or_76_nl}) +
      conv_s2u_14_22({1'b1 , VEC_LOOP_VEC_LOOP_VEC_LOOP_nand_1_nl , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[21:0];
  assign z_out_4_20_12 = readslicef_22_9_13(acc_1_nl);
  assign VEC_LOOP_mux_18_nl = MUX_v_12_2_2(({(z_out_17[7:0]) , (STAGE_LOOP_lshift_psp_sva[4:1])}),
      z_out_6, and_dcpl_295);
  assign VEC_LOOP_mux_19_nl = MUX_v_12_2_2((COMP_LOOP_twiddle_f_9_sva[11:0]), VEC_LOOP_acc_1_cse_10_sva,
      and_dcpl_295);
  assign nl_z_out_5 = VEC_LOOP_mux_18_nl + VEC_LOOP_mux_19_nl;
  assign z_out_5 = nl_z_out_5[11:0];
  assign and_594_nl = and_dcpl_205 & and_dcpl_306 & and_dcpl_305;
  assign and_595_nl = and_dcpl_312 & and_dcpl_310;
  assign and_596_nl = and_dcpl_312 & and_dcpl_314;
  assign and_597_nl = and_dcpl_323 & and_dcpl_321;
  assign and_598_nl = and_dcpl_323 & and_dcpl_325;
  assign and_599_nl = and_dcpl_215 & and_dcpl_311 & and_dcpl_305;
  assign and_600_nl = and_dcpl_331 & and_dcpl_310;
  assign and_601_nl = and_dcpl_331 & and_dcpl_314;
  assign and_602_nl = and_dcpl_337 & and_dcpl_321;
  assign VEC_LOOP_mux1h_33_nl = MUX1HOT_v_4_13_2(4'b0001, 4'b0010, 4'b0011, 4'b0100,
      4'b0101, 4'b0110, 4'b0111, 4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110,
      {and_354_itm , and_594_nl , and_595_nl , and_596_nl , and_371_itm , and_597_nl
      , and_598_nl , and_380_itm , and_599_nl , and_600_nl , and_601_nl , and_388_itm
      , and_602_nl});
  assign and_603_nl = and_dcpl_337 & and_dcpl_325;
  assign VEC_LOOP_or_77_nl = MUX_v_4_2_2(VEC_LOOP_mux1h_33_nl, 4'b1111, and_603_nl);
  assign nl_z_out_6 = ({COMP_LOOP_k_12_4_sva_7_0 , VEC_LOOP_or_77_nl}) + (STAGE_LOOP_lshift_psp_sva[12:1]);
  assign z_out_6 = nl_z_out_6[11:0];
  assign nl_acc_4_cse_12_1 = z_out_6 + VEC_LOOP_acc_1_cse_10_sva;
  assign acc_4_cse_12_1 = nl_acc_4_cse_12_1[11:0];
  assign and_604_nl = and_dcpl_205 & (fsm_output[5:4]==2'b10) & and_dcpl_310;
  assign and_605_nl = and_dcpl_215 & and_dcpl_204 & and_dcpl_325;
  assign and_606_nl = and_dcpl_215 & and_193_cse & and_dcpl_310;
  assign VEC_LOOP_mux1h_34_nl = MUX1HOT_v_3_6_2(3'b110, 3'b101, 3'b100, 3'b011, 3'b010,
      3'b001, {and_604_nl , and_371_itm , and_605_nl , and_380_itm , and_606_nl ,
      and_388_itm});
  assign VEC_LOOP_nor_18_nl = ~(MUX_v_3_2_2(VEC_LOOP_mux1h_34_nl, 3'b111, and_354_itm));
  assign and_607_nl = and_dcpl_334 & and_dcpl_306 & and_dcpl_325;
  assign VEC_LOOP_or_78_nl = MUX_v_3_2_2(VEC_LOOP_nor_18_nl, 3'b111, and_607_nl);
  assign nl_z_out_10 = VEC_LOOP_acc_1_cse_10_sva + ({COMP_LOOP_k_12_4_sva_7_0 , VEC_LOOP_or_78_nl
      , 1'b1});
  assign z_out_10 = nl_z_out_10[11:0];
  assign nl_VEC_LOOP_acc_36_nl = ({COMP_LOOP_k_12_4_sva_7_0 , 1'b1}) + (STAGE_LOOP_lshift_psp_sva[12:4]);
  assign VEC_LOOP_acc_36_nl = nl_VEC_LOOP_acc_36_nl[8:0];
  assign and_608_nl = (fsm_output[7:4]==4'b0101) & and_dcpl_187 & (fsm_output[2])
      & (~ (fsm_output[0]));
  assign VEC_LOOP_mux_20_nl = MUX_v_12_2_2(z_out_6, ({VEC_LOOP_acc_36_nl , (STAGE_LOOP_lshift_psp_sva[3:1])}),
      and_608_nl);
  assign nl_z_out_11 = VEC_LOOP_mux_20_nl + VEC_LOOP_acc_1_cse_10_sva;
  assign z_out_11 = nl_z_out_11[11:0];
  assign VEC_LOOP_mux_21_nl = MUX_v_32_2_2(COMP_LOOP_twiddle_f_9_sva, factor1_1_sva,
      and_dcpl_462);
  assign VEC_LOOP_or_79_nl = (~(and_dcpl_21 & and_dcpl_172 & and_dcpl_187 & (fsm_output[2])
      & (~ (fsm_output[0])))) | and_dcpl_462;
  assign VEC_LOOP_mux_22_nl = MUX_v_32_2_2(({19'b0000000000000000000 , STAGE_LOOP_lshift_psp_sva}),
      (~ COMP_LOOP_1_mult_cmp_return_rsc_z), and_dcpl_462);
  assign nl_acc_12_nl = ({VEC_LOOP_mux_21_nl , VEC_LOOP_or_79_nl}) + ({VEC_LOOP_mux_22_nl
      , 1'b1});
  assign acc_12_nl = nl_acc_12_nl[32:0];
  assign z_out_15 = readslicef_33_32_1(acc_12_nl);
  assign VEC_LOOP_mux1h_35_nl = MUX1HOT_v_10_5_2(({2'b00 , (COMP_LOOP_twiddle_f_9_sva[11:4])}),
      ({1'b0 , (VEC_LOOP_acc_1_cse_10_sva[11:3])}), (VEC_LOOP_acc_1_cse_10_sva[11:2]),
      ({2'b01 , (~ (STAGE_LOOP_lshift_psp_sva[12:5]))}), ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[12:4]))}),
      {and_dcpl_469 , and_dcpl_473 , VEC_LOOP_or_59_itm , and_dcpl_486 , and_dcpl_488});
  assign VEC_LOOP_or_80_nl = (~(and_dcpl_469 | and_dcpl_473 | and_dcpl_478 | and_dcpl_481))
      | and_dcpl_486 | and_dcpl_488;
  assign VEC_LOOP_VEC_LOOP_and_1_nl = (COMP_LOOP_k_12_4_sva_7_0[7]) & (~(and_dcpl_469
      | and_dcpl_473 | and_dcpl_486 | and_dcpl_488));
  assign VEC_LOOP_VEC_LOOP_mux_11_nl = MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0[7]),
      (COMP_LOOP_k_12_4_sva_7_0[6]), VEC_LOOP_or_59_itm);
  assign VEC_LOOP_and_20_nl = VEC_LOOP_VEC_LOOP_mux_11_nl & (~(and_dcpl_469 | and_dcpl_486));
  assign VEC_LOOP_or_81_nl = and_dcpl_469 | and_dcpl_486;
  assign VEC_LOOP_mux1h_36_nl = MUX1HOT_v_6_3_2((COMP_LOOP_k_12_4_sva_7_0[7:2]),
      (COMP_LOOP_k_12_4_sva_7_0[6:1]), (COMP_LOOP_k_12_4_sva_7_0[5:0]), {VEC_LOOP_or_81_nl
      , VEC_LOOP_or_68_itm , VEC_LOOP_or_59_itm});
  assign VEC_LOOP_mux_23_nl = MUX_s_1_2_2((COMP_LOOP_k_12_4_sva_7_0[1]), (COMP_LOOP_k_12_4_sva_7_0[0]),
      VEC_LOOP_or_68_itm);
  assign VEC_LOOP_VEC_LOOP_or_17_nl = (VEC_LOOP_mux_23_nl & (~ and_dcpl_478)) | and_dcpl_481;
  assign VEC_LOOP_VEC_LOOP_or_18_nl = ((COMP_LOOP_k_12_4_sva_7_0[0]) & (~ and_dcpl_488))
      | and_dcpl_473 | and_dcpl_478 | and_dcpl_481;
  assign nl_acc_13_nl = ({VEC_LOOP_mux1h_35_nl , VEC_LOOP_or_80_nl}) + ({VEC_LOOP_VEC_LOOP_and_1_nl
      , VEC_LOOP_and_20_nl , VEC_LOOP_mux1h_36_nl , VEC_LOOP_VEC_LOOP_or_17_nl ,
      VEC_LOOP_VEC_LOOP_or_18_nl , 1'b1});
  assign acc_13_nl = nl_acc_13_nl[10:0];
  assign z_out_16 = readslicef_11_10_1(acc_13_nl);
  assign VEC_LOOP_mux_24_nl = MUX_v_8_2_2((STAGE_LOOP_lshift_psp_sva[12:5]), 8'b00000001,
      and_dcpl_282);
  assign nl_z_out_17 = conv_u2u_8_9(COMP_LOOP_k_12_4_sva_7_0) + conv_u2u_8_9(VEC_LOOP_mux_24_nl);
  assign z_out_17 = nl_z_out_17[8:0];
  assign VEC_LOOP_VEC_LOOP_or_19_nl = (VEC_LOOP_acc_1_cse_10_sva[11]) | and_dcpl_526
      | and_dcpl_528;
  assign VEC_LOOP_VEC_LOOP_mux_12_nl = MUX_v_10_2_2((VEC_LOOP_acc_1_cse_10_sva[10:1]),
      (~ (STAGE_LOOP_lshift_psp_sva[12:3])), VEC_LOOP_or_71_itm);
  assign VEC_LOOP_or_82_nl = (~(and_dcpl_509 | and_dcpl_515 | and_dcpl_518 | and_dcpl_521))
      | and_dcpl_526 | and_dcpl_528;
  assign VEC_LOOP_and_23_nl = (COMP_LOOP_k_12_4_sva_7_0[7]) & VEC_LOOP_nor_10_itm;
  assign VEC_LOOP_VEC_LOOP_mux_13_nl = MUX_v_7_2_2((COMP_LOOP_k_12_4_sva_7_0[6:0]),
      (COMP_LOOP_k_12_4_sva_7_0[7:1]), VEC_LOOP_or_71_itm);
  assign VEC_LOOP_VEC_LOOP_or_20_nl = ((COMP_LOOP_k_12_4_sva_7_0[0]) & (~(and_dcpl_509
      | and_dcpl_515))) | and_dcpl_518 | and_dcpl_521;
  assign VEC_LOOP_VEC_LOOP_or_21_nl = (~(and_dcpl_509 | and_dcpl_518 | and_dcpl_528))
      | and_dcpl_515 | and_dcpl_521 | and_dcpl_526;
  assign VEC_LOOP_VEC_LOOP_or_22_nl = VEC_LOOP_nor_10_itm | and_dcpl_509 | and_dcpl_515
      | and_dcpl_518 | and_dcpl_521;
  assign nl_acc_15_nl = ({VEC_LOOP_VEC_LOOP_or_19_nl , VEC_LOOP_VEC_LOOP_mux_12_nl
      , VEC_LOOP_or_82_nl}) + ({VEC_LOOP_and_23_nl , VEC_LOOP_VEC_LOOP_mux_13_nl
      , VEC_LOOP_VEC_LOOP_or_20_nl , VEC_LOOP_VEC_LOOP_or_21_nl , VEC_LOOP_VEC_LOOP_or_22_nl
      , 1'b1});
  assign acc_15_nl = nl_acc_15_nl[11:0];
  assign z_out_18 = readslicef_12_11_1(acc_15_nl);

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


  function automatic [9:0] MUX1HOT_v_10_5_2;
    input [9:0] input_4;
    input [9:0] input_3;
    input [9:0] input_2;
    input [9:0] input_1;
    input [9:0] input_0;
    input [4:0] sel;
    reg [9:0] result;
  begin
    result = input_0 & {10{sel[0]}};
    result = result | ( input_1 & {10{sel[1]}});
    result = result | ( input_2 & {10{sel[2]}});
    result = result | ( input_3 & {10{sel[3]}});
    result = result | ( input_4 & {10{sel[4]}});
    MUX1HOT_v_10_5_2 = result;
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


  function automatic [11:0] MUX1HOT_v_12_4_2;
    input [11:0] input_3;
    input [11:0] input_2;
    input [11:0] input_1;
    input [11:0] input_0;
    input [3:0] sel;
    reg [11:0] result;
  begin
    result = input_0 & {12{sel[0]}};
    result = result | ( input_1 & {12{sel[1]}});
    result = result | ( input_2 & {12{sel[2]}});
    result = result | ( input_3 & {12{sel[3]}});
    MUX1HOT_v_12_4_2 = result;
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


  function automatic [2:0] MUX1HOT_v_3_6_2;
    input [2:0] input_5;
    input [2:0] input_4;
    input [2:0] input_3;
    input [2:0] input_2;
    input [2:0] input_1;
    input [2:0] input_0;
    input [5:0] sel;
    reg [2:0] result;
  begin
    result = input_0 & {3{sel[0]}};
    result = result | ( input_1 & {3{sel[1]}});
    result = result | ( input_2 & {3{sel[2]}});
    result = result | ( input_3 & {3{sel[3]}});
    result = result | ( input_4 & {3{sel[4]}});
    result = result | ( input_5 & {3{sel[5]}});
    MUX1HOT_v_3_6_2 = result;
  end
  endfunction


  function automatic [3:0] MUX1HOT_v_4_13_2;
    input [3:0] input_12;
    input [3:0] input_11;
    input [3:0] input_10;
    input [3:0] input_9;
    input [3:0] input_8;
    input [3:0] input_7;
    input [3:0] input_6;
    input [3:0] input_5;
    input [3:0] input_4;
    input [3:0] input_3;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [12:0] sel;
    reg [3:0] result;
  begin
    result = input_0 & {4{sel[0]}};
    result = result | ( input_1 & {4{sel[1]}});
    result = result | ( input_2 & {4{sel[2]}});
    result = result | ( input_3 & {4{sel[3]}});
    result = result | ( input_4 & {4{sel[4]}});
    result = result | ( input_5 & {4{sel[5]}});
    result = result | ( input_6 & {4{sel[6]}});
    result = result | ( input_7 & {4{sel[7]}});
    result = result | ( input_8 & {4{sel[8]}});
    result = result | ( input_9 & {4{sel[9]}});
    result = result | ( input_10 & {4{sel[10]}});
    result = result | ( input_11 & {4{sel[11]}});
    result = result | ( input_12 & {4{sel[12]}});
    MUX1HOT_v_4_13_2 = result;
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


  function automatic [7:0] MUX1HOT_v_8_11_2;
    input [7:0] input_10;
    input [7:0] input_9;
    input [7:0] input_8;
    input [7:0] input_7;
    input [7:0] input_6;
    input [7:0] input_5;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [10:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | ( input_1 & {8{sel[1]}});
    result = result | ( input_2 & {8{sel[2]}});
    result = result | ( input_3 & {8{sel[3]}});
    result = result | ( input_4 & {8{sel[4]}});
    result = result | ( input_5 & {8{sel[5]}});
    result = result | ( input_6 & {8{sel[6]}});
    result = result | ( input_7 & {8{sel[7]}});
    result = result | ( input_8 & {8{sel[8]}});
    result = result | ( input_9 & {8{sel[9]}});
    result = result | ( input_10 & {8{sel[10]}});
    MUX1HOT_v_8_11_2 = result;
  end
  endfunction


  function automatic [7:0] MUX1HOT_v_8_7_2;
    input [7:0] input_6;
    input [7:0] input_5;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [6:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | ( input_1 & {8{sel[1]}});
    result = result | ( input_2 & {8{sel[2]}});
    result = result | ( input_3 & {8{sel[3]}});
    result = result | ( input_4 & {8{sel[4]}});
    result = result | ( input_5 & {8{sel[5]}});
    result = result | ( input_6 & {8{sel[6]}});
    MUX1HOT_v_8_7_2 = result;
  end
  endfunction


  function automatic [8:0] MUX1HOT_v_9_6_2;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [5:0] sel;
    reg [8:0] result;
  begin
    result = input_0 & {9{sel[0]}};
    result = result | ( input_1 & {9{sel[1]}});
    result = result | ( input_2 & {9{sel[2]}});
    result = result | ( input_3 & {9{sel[3]}});
    result = result | ( input_4 & {9{sel[4]}});
    result = result | ( input_5 & {9{sel[5]}});
    MUX1HOT_v_9_6_2 = result;
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


  function automatic [0:0] readslicef_13_1_12;
    input [12:0] vector;
    reg [12:0] tmp;
  begin
    tmp = vector >> 12;
    readslicef_13_1_12 = tmp[0:0];
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


  function automatic [21:0] conv_s2u_14_22 ;
    input [13:0]  vector ;
  begin
    conv_s2u_14_22 = {{8{vector[13]}}, vector};
  end
  endfunction


  function automatic [12:0] conv_u2s_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2s_12_13 =  {1'b0, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
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



