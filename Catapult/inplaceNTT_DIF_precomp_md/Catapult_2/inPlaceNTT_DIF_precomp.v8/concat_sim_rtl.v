
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

//------> ../td_ccore_solutions/mult_a1e233277d0d5c0cfe721a9995382bef70e4_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 21:49:27 2021
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
  ccs_in_v1 #(.rscid(32'sd7),
  .width(32'sd32)) x_rsci (
      .dat(x_rsc_dat),
      .idat(x_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd8),
  .width(32'sd32)) y_rsci (
      .dat(y_rsc_dat),
      .idat(y_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd9),
  .width(32'sd32)) y_rsci_1 (
      .dat(y_rsc_dat_1),
      .idat(y_rsci_idat_1)
    );
  ccs_in_v1 #(.rscid(32'sd10),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd11),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  ccs_in_v1 #(.rscid(32'sd19),
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




//------> ../td_ccore_solutions/modulo_sub_221cc38820a0941d4772a0cf032267436375_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 21:49:28 2021
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
  ccs_in_v1 #(.rscid(32'sd4),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd5),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd6),
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




//------> ../td_ccore_solutions/modulo_add_8b3f96d27942dd35d77cd1e313d6ead560ec_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   yl7897@newnano.poly.edu
//  Generated date: Mon Sep 13 21:49:29 2021
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
  wire[33:0] acc_nl;
  wire[34:0] nl_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd1),
  .width(32'sd32)) base_rsci (
      .dat(base_rsc_dat),
      .idat(base_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  mgc_out_dreg_v2 #(.rscid(32'sd3),
  .width(32'sd32)) return_rsci (
      .d(return_rsci_d),
      .z(return_rsc_z)
    );
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(base_rsci_idat, qif_acc_nl, readslicef_34_1_33(acc_nl));
    end
  end
  assign nl_qif_acc_nl = base_rsci_idat - m_rsci_idat;
  assign qif_acc_nl = nl_qif_acc_nl[31:0];
  assign nl_acc_nl = conv_u2u_32_34(m_rsci_idat) - conv_s2u_32_34(base_rsci_idat);
  assign acc_nl = nl_acc_nl[33:0];

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


  function automatic [0:0] readslicef_34_1_33;
    input [33:0] vector;
    reg [33:0] tmp;
  begin
    tmp = vector >> 33;
    readslicef_34_1_33 = tmp[0:0];
  end
  endfunction


  function automatic [33:0] conv_s2u_32_34 ;
    input [31:0]  vector ;
  begin
    conv_s2u_32_34 = {{2{vector[31]}}, vector};
  end
  endfunction


  function automatic [33:0] conv_u2u_32_34 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_34 = {{2{1'b0}}, vector};
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
//  Generated date: Thu Sep 16 00:08:02 2021
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
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
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
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
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
    (
  q, radr, we, d, wadr, clkr, clkr_en, d_d, q_d, radr_d, wadr_d, we_d, writeA_w_ram_ir_internal_WMASK_B_d,
      readA_r_ram_ir_internal_RMASK_B_d
);
  input [31:0] q;
  output [13:0] radr;
  output we;
  output [31:0] d;
  output [13:0] wadr;
  input clkr;
  input clkr_en;
  input [31:0] d_d;
  output [31:0] q_d;
  input [13:0] radr_d;
  input [13:0] wadr_d;
  input we_d;
  input writeA_w_ram_ir_internal_WMASK_B_d;
  input readA_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign radr = (radr_d);
  assign we = (writeA_w_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign wadr = (wadr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_core_fsm (
  clk, rst, complete_rsci_wen_comp, fsm_output, main_C_0_tr0, COMP_LOOP_1_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_3_tr0, COMP_LOOP_2_VEC_LOOP_C_7_tr0, COMP_LOOP_C_4_tr0, COMP_LOOP_3_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_5_tr0, COMP_LOOP_4_VEC_LOOP_C_7_tr0, COMP_LOOP_C_6_tr0, COMP_LOOP_5_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_7_tr0, COMP_LOOP_6_VEC_LOOP_C_7_tr0, COMP_LOOP_C_8_tr0, COMP_LOOP_7_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_9_tr0, COMP_LOOP_8_VEC_LOOP_C_7_tr0, COMP_LOOP_C_10_tr0, COMP_LOOP_9_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_11_tr0, COMP_LOOP_10_VEC_LOOP_C_7_tr0, COMP_LOOP_C_12_tr0, COMP_LOOP_11_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_13_tr0, COMP_LOOP_12_VEC_LOOP_C_7_tr0, COMP_LOOP_C_14_tr0, COMP_LOOP_13_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_15_tr0, COMP_LOOP_14_VEC_LOOP_C_7_tr0, COMP_LOOP_C_16_tr0, COMP_LOOP_15_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_17_tr0, COMP_LOOP_16_VEC_LOOP_C_7_tr0, COMP_LOOP_C_18_tr0, COMP_LOOP_17_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_19_tr0, COMP_LOOP_18_VEC_LOOP_C_7_tr0, COMP_LOOP_C_20_tr0, COMP_LOOP_19_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_21_tr0, COMP_LOOP_20_VEC_LOOP_C_7_tr0, COMP_LOOP_C_22_tr0, COMP_LOOP_21_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_23_tr0, COMP_LOOP_22_VEC_LOOP_C_7_tr0, COMP_LOOP_C_24_tr0, COMP_LOOP_23_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_25_tr0, COMP_LOOP_24_VEC_LOOP_C_7_tr0, COMP_LOOP_C_26_tr0, COMP_LOOP_25_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_27_tr0, COMP_LOOP_26_VEC_LOOP_C_7_tr0, COMP_LOOP_C_28_tr0, COMP_LOOP_27_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_29_tr0, COMP_LOOP_28_VEC_LOOP_C_7_tr0, COMP_LOOP_C_30_tr0, COMP_LOOP_29_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_31_tr0, COMP_LOOP_30_VEC_LOOP_C_7_tr0, COMP_LOOP_C_32_tr0, COMP_LOOP_31_VEC_LOOP_C_7_tr0,
      COMP_LOOP_C_33_tr0, COMP_LOOP_32_VEC_LOOP_C_7_tr0, COMP_LOOP_C_34_tr0, STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input main_C_0_tr0;
  input COMP_LOOP_1_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_3_tr0;
  input COMP_LOOP_2_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_4_tr0;
  input COMP_LOOP_3_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_5_tr0;
  input COMP_LOOP_4_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_6_tr0;
  input COMP_LOOP_5_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_7_tr0;
  input COMP_LOOP_6_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_8_tr0;
  input COMP_LOOP_7_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_9_tr0;
  input COMP_LOOP_8_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_10_tr0;
  input COMP_LOOP_9_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_11_tr0;
  input COMP_LOOP_10_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_12_tr0;
  input COMP_LOOP_11_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_13_tr0;
  input COMP_LOOP_12_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_14_tr0;
  input COMP_LOOP_13_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_15_tr0;
  input COMP_LOOP_14_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_16_tr0;
  input COMP_LOOP_15_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_17_tr0;
  input COMP_LOOP_16_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_18_tr0;
  input COMP_LOOP_17_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_19_tr0;
  input COMP_LOOP_18_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_20_tr0;
  input COMP_LOOP_19_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_21_tr0;
  input COMP_LOOP_20_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_22_tr0;
  input COMP_LOOP_21_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_23_tr0;
  input COMP_LOOP_22_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_24_tr0;
  input COMP_LOOP_23_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_25_tr0;
  input COMP_LOOP_24_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_26_tr0;
  input COMP_LOOP_25_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_27_tr0;
  input COMP_LOOP_26_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_28_tr0;
  input COMP_LOOP_27_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_29_tr0;
  input COMP_LOOP_28_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_30_tr0;
  input COMP_LOOP_29_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_31_tr0;
  input COMP_LOOP_30_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_32_tr0;
  input COMP_LOOP_31_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_33_tr0;
  input COMP_LOOP_32_VEC_LOOP_C_7_tr0;
  input COMP_LOOP_C_34_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_precomp_core_core_fsm_1
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
    COMP_LOOP_C_3 = 9'd13,
    COMP_LOOP_2_VEC_LOOP_C_0 = 9'd14,
    COMP_LOOP_2_VEC_LOOP_C_1 = 9'd15,
    COMP_LOOP_2_VEC_LOOP_C_2 = 9'd16,
    COMP_LOOP_2_VEC_LOOP_C_3 = 9'd17,
    COMP_LOOP_2_VEC_LOOP_C_4 = 9'd18,
    COMP_LOOP_2_VEC_LOOP_C_5 = 9'd19,
    COMP_LOOP_2_VEC_LOOP_C_6 = 9'd20,
    COMP_LOOP_2_VEC_LOOP_C_7 = 9'd21,
    COMP_LOOP_C_4 = 9'd22,
    COMP_LOOP_3_VEC_LOOP_C_0 = 9'd23,
    COMP_LOOP_3_VEC_LOOP_C_1 = 9'd24,
    COMP_LOOP_3_VEC_LOOP_C_2 = 9'd25,
    COMP_LOOP_3_VEC_LOOP_C_3 = 9'd26,
    COMP_LOOP_3_VEC_LOOP_C_4 = 9'd27,
    COMP_LOOP_3_VEC_LOOP_C_5 = 9'd28,
    COMP_LOOP_3_VEC_LOOP_C_6 = 9'd29,
    COMP_LOOP_3_VEC_LOOP_C_7 = 9'd30,
    COMP_LOOP_C_5 = 9'd31,
    COMP_LOOP_4_VEC_LOOP_C_0 = 9'd32,
    COMP_LOOP_4_VEC_LOOP_C_1 = 9'd33,
    COMP_LOOP_4_VEC_LOOP_C_2 = 9'd34,
    COMP_LOOP_4_VEC_LOOP_C_3 = 9'd35,
    COMP_LOOP_4_VEC_LOOP_C_4 = 9'd36,
    COMP_LOOP_4_VEC_LOOP_C_5 = 9'd37,
    COMP_LOOP_4_VEC_LOOP_C_6 = 9'd38,
    COMP_LOOP_4_VEC_LOOP_C_7 = 9'd39,
    COMP_LOOP_C_6 = 9'd40,
    COMP_LOOP_5_VEC_LOOP_C_0 = 9'd41,
    COMP_LOOP_5_VEC_LOOP_C_1 = 9'd42,
    COMP_LOOP_5_VEC_LOOP_C_2 = 9'd43,
    COMP_LOOP_5_VEC_LOOP_C_3 = 9'd44,
    COMP_LOOP_5_VEC_LOOP_C_4 = 9'd45,
    COMP_LOOP_5_VEC_LOOP_C_5 = 9'd46,
    COMP_LOOP_5_VEC_LOOP_C_6 = 9'd47,
    COMP_LOOP_5_VEC_LOOP_C_7 = 9'd48,
    COMP_LOOP_C_7 = 9'd49,
    COMP_LOOP_6_VEC_LOOP_C_0 = 9'd50,
    COMP_LOOP_6_VEC_LOOP_C_1 = 9'd51,
    COMP_LOOP_6_VEC_LOOP_C_2 = 9'd52,
    COMP_LOOP_6_VEC_LOOP_C_3 = 9'd53,
    COMP_LOOP_6_VEC_LOOP_C_4 = 9'd54,
    COMP_LOOP_6_VEC_LOOP_C_5 = 9'd55,
    COMP_LOOP_6_VEC_LOOP_C_6 = 9'd56,
    COMP_LOOP_6_VEC_LOOP_C_7 = 9'd57,
    COMP_LOOP_C_8 = 9'd58,
    COMP_LOOP_7_VEC_LOOP_C_0 = 9'd59,
    COMP_LOOP_7_VEC_LOOP_C_1 = 9'd60,
    COMP_LOOP_7_VEC_LOOP_C_2 = 9'd61,
    COMP_LOOP_7_VEC_LOOP_C_3 = 9'd62,
    COMP_LOOP_7_VEC_LOOP_C_4 = 9'd63,
    COMP_LOOP_7_VEC_LOOP_C_5 = 9'd64,
    COMP_LOOP_7_VEC_LOOP_C_6 = 9'd65,
    COMP_LOOP_7_VEC_LOOP_C_7 = 9'd66,
    COMP_LOOP_C_9 = 9'd67,
    COMP_LOOP_8_VEC_LOOP_C_0 = 9'd68,
    COMP_LOOP_8_VEC_LOOP_C_1 = 9'd69,
    COMP_LOOP_8_VEC_LOOP_C_2 = 9'd70,
    COMP_LOOP_8_VEC_LOOP_C_3 = 9'd71,
    COMP_LOOP_8_VEC_LOOP_C_4 = 9'd72,
    COMP_LOOP_8_VEC_LOOP_C_5 = 9'd73,
    COMP_LOOP_8_VEC_LOOP_C_6 = 9'd74,
    COMP_LOOP_8_VEC_LOOP_C_7 = 9'd75,
    COMP_LOOP_C_10 = 9'd76,
    COMP_LOOP_9_VEC_LOOP_C_0 = 9'd77,
    COMP_LOOP_9_VEC_LOOP_C_1 = 9'd78,
    COMP_LOOP_9_VEC_LOOP_C_2 = 9'd79,
    COMP_LOOP_9_VEC_LOOP_C_3 = 9'd80,
    COMP_LOOP_9_VEC_LOOP_C_4 = 9'd81,
    COMP_LOOP_9_VEC_LOOP_C_5 = 9'd82,
    COMP_LOOP_9_VEC_LOOP_C_6 = 9'd83,
    COMP_LOOP_9_VEC_LOOP_C_7 = 9'd84,
    COMP_LOOP_C_11 = 9'd85,
    COMP_LOOP_10_VEC_LOOP_C_0 = 9'd86,
    COMP_LOOP_10_VEC_LOOP_C_1 = 9'd87,
    COMP_LOOP_10_VEC_LOOP_C_2 = 9'd88,
    COMP_LOOP_10_VEC_LOOP_C_3 = 9'd89,
    COMP_LOOP_10_VEC_LOOP_C_4 = 9'd90,
    COMP_LOOP_10_VEC_LOOP_C_5 = 9'd91,
    COMP_LOOP_10_VEC_LOOP_C_6 = 9'd92,
    COMP_LOOP_10_VEC_LOOP_C_7 = 9'd93,
    COMP_LOOP_C_12 = 9'd94,
    COMP_LOOP_11_VEC_LOOP_C_0 = 9'd95,
    COMP_LOOP_11_VEC_LOOP_C_1 = 9'd96,
    COMP_LOOP_11_VEC_LOOP_C_2 = 9'd97,
    COMP_LOOP_11_VEC_LOOP_C_3 = 9'd98,
    COMP_LOOP_11_VEC_LOOP_C_4 = 9'd99,
    COMP_LOOP_11_VEC_LOOP_C_5 = 9'd100,
    COMP_LOOP_11_VEC_LOOP_C_6 = 9'd101,
    COMP_LOOP_11_VEC_LOOP_C_7 = 9'd102,
    COMP_LOOP_C_13 = 9'd103,
    COMP_LOOP_12_VEC_LOOP_C_0 = 9'd104,
    COMP_LOOP_12_VEC_LOOP_C_1 = 9'd105,
    COMP_LOOP_12_VEC_LOOP_C_2 = 9'd106,
    COMP_LOOP_12_VEC_LOOP_C_3 = 9'd107,
    COMP_LOOP_12_VEC_LOOP_C_4 = 9'd108,
    COMP_LOOP_12_VEC_LOOP_C_5 = 9'd109,
    COMP_LOOP_12_VEC_LOOP_C_6 = 9'd110,
    COMP_LOOP_12_VEC_LOOP_C_7 = 9'd111,
    COMP_LOOP_C_14 = 9'd112,
    COMP_LOOP_13_VEC_LOOP_C_0 = 9'd113,
    COMP_LOOP_13_VEC_LOOP_C_1 = 9'd114,
    COMP_LOOP_13_VEC_LOOP_C_2 = 9'd115,
    COMP_LOOP_13_VEC_LOOP_C_3 = 9'd116,
    COMP_LOOP_13_VEC_LOOP_C_4 = 9'd117,
    COMP_LOOP_13_VEC_LOOP_C_5 = 9'd118,
    COMP_LOOP_13_VEC_LOOP_C_6 = 9'd119,
    COMP_LOOP_13_VEC_LOOP_C_7 = 9'd120,
    COMP_LOOP_C_15 = 9'd121,
    COMP_LOOP_14_VEC_LOOP_C_0 = 9'd122,
    COMP_LOOP_14_VEC_LOOP_C_1 = 9'd123,
    COMP_LOOP_14_VEC_LOOP_C_2 = 9'd124,
    COMP_LOOP_14_VEC_LOOP_C_3 = 9'd125,
    COMP_LOOP_14_VEC_LOOP_C_4 = 9'd126,
    COMP_LOOP_14_VEC_LOOP_C_5 = 9'd127,
    COMP_LOOP_14_VEC_LOOP_C_6 = 9'd128,
    COMP_LOOP_14_VEC_LOOP_C_7 = 9'd129,
    COMP_LOOP_C_16 = 9'd130,
    COMP_LOOP_15_VEC_LOOP_C_0 = 9'd131,
    COMP_LOOP_15_VEC_LOOP_C_1 = 9'd132,
    COMP_LOOP_15_VEC_LOOP_C_2 = 9'd133,
    COMP_LOOP_15_VEC_LOOP_C_3 = 9'd134,
    COMP_LOOP_15_VEC_LOOP_C_4 = 9'd135,
    COMP_LOOP_15_VEC_LOOP_C_5 = 9'd136,
    COMP_LOOP_15_VEC_LOOP_C_6 = 9'd137,
    COMP_LOOP_15_VEC_LOOP_C_7 = 9'd138,
    COMP_LOOP_C_17 = 9'd139,
    COMP_LOOP_16_VEC_LOOP_C_0 = 9'd140,
    COMP_LOOP_16_VEC_LOOP_C_1 = 9'd141,
    COMP_LOOP_16_VEC_LOOP_C_2 = 9'd142,
    COMP_LOOP_16_VEC_LOOP_C_3 = 9'd143,
    COMP_LOOP_16_VEC_LOOP_C_4 = 9'd144,
    COMP_LOOP_16_VEC_LOOP_C_5 = 9'd145,
    COMP_LOOP_16_VEC_LOOP_C_6 = 9'd146,
    COMP_LOOP_16_VEC_LOOP_C_7 = 9'd147,
    COMP_LOOP_C_18 = 9'd148,
    COMP_LOOP_17_VEC_LOOP_C_0 = 9'd149,
    COMP_LOOP_17_VEC_LOOP_C_1 = 9'd150,
    COMP_LOOP_17_VEC_LOOP_C_2 = 9'd151,
    COMP_LOOP_17_VEC_LOOP_C_3 = 9'd152,
    COMP_LOOP_17_VEC_LOOP_C_4 = 9'd153,
    COMP_LOOP_17_VEC_LOOP_C_5 = 9'd154,
    COMP_LOOP_17_VEC_LOOP_C_6 = 9'd155,
    COMP_LOOP_17_VEC_LOOP_C_7 = 9'd156,
    COMP_LOOP_C_19 = 9'd157,
    COMP_LOOP_18_VEC_LOOP_C_0 = 9'd158,
    COMP_LOOP_18_VEC_LOOP_C_1 = 9'd159,
    COMP_LOOP_18_VEC_LOOP_C_2 = 9'd160,
    COMP_LOOP_18_VEC_LOOP_C_3 = 9'd161,
    COMP_LOOP_18_VEC_LOOP_C_4 = 9'd162,
    COMP_LOOP_18_VEC_LOOP_C_5 = 9'd163,
    COMP_LOOP_18_VEC_LOOP_C_6 = 9'd164,
    COMP_LOOP_18_VEC_LOOP_C_7 = 9'd165,
    COMP_LOOP_C_20 = 9'd166,
    COMP_LOOP_19_VEC_LOOP_C_0 = 9'd167,
    COMP_LOOP_19_VEC_LOOP_C_1 = 9'd168,
    COMP_LOOP_19_VEC_LOOP_C_2 = 9'd169,
    COMP_LOOP_19_VEC_LOOP_C_3 = 9'd170,
    COMP_LOOP_19_VEC_LOOP_C_4 = 9'd171,
    COMP_LOOP_19_VEC_LOOP_C_5 = 9'd172,
    COMP_LOOP_19_VEC_LOOP_C_6 = 9'd173,
    COMP_LOOP_19_VEC_LOOP_C_7 = 9'd174,
    COMP_LOOP_C_21 = 9'd175,
    COMP_LOOP_20_VEC_LOOP_C_0 = 9'd176,
    COMP_LOOP_20_VEC_LOOP_C_1 = 9'd177,
    COMP_LOOP_20_VEC_LOOP_C_2 = 9'd178,
    COMP_LOOP_20_VEC_LOOP_C_3 = 9'd179,
    COMP_LOOP_20_VEC_LOOP_C_4 = 9'd180,
    COMP_LOOP_20_VEC_LOOP_C_5 = 9'd181,
    COMP_LOOP_20_VEC_LOOP_C_6 = 9'd182,
    COMP_LOOP_20_VEC_LOOP_C_7 = 9'd183,
    COMP_LOOP_C_22 = 9'd184,
    COMP_LOOP_21_VEC_LOOP_C_0 = 9'd185,
    COMP_LOOP_21_VEC_LOOP_C_1 = 9'd186,
    COMP_LOOP_21_VEC_LOOP_C_2 = 9'd187,
    COMP_LOOP_21_VEC_LOOP_C_3 = 9'd188,
    COMP_LOOP_21_VEC_LOOP_C_4 = 9'd189,
    COMP_LOOP_21_VEC_LOOP_C_5 = 9'd190,
    COMP_LOOP_21_VEC_LOOP_C_6 = 9'd191,
    COMP_LOOP_21_VEC_LOOP_C_7 = 9'd192,
    COMP_LOOP_C_23 = 9'd193,
    COMP_LOOP_22_VEC_LOOP_C_0 = 9'd194,
    COMP_LOOP_22_VEC_LOOP_C_1 = 9'd195,
    COMP_LOOP_22_VEC_LOOP_C_2 = 9'd196,
    COMP_LOOP_22_VEC_LOOP_C_3 = 9'd197,
    COMP_LOOP_22_VEC_LOOP_C_4 = 9'd198,
    COMP_LOOP_22_VEC_LOOP_C_5 = 9'd199,
    COMP_LOOP_22_VEC_LOOP_C_6 = 9'd200,
    COMP_LOOP_22_VEC_LOOP_C_7 = 9'd201,
    COMP_LOOP_C_24 = 9'd202,
    COMP_LOOP_23_VEC_LOOP_C_0 = 9'd203,
    COMP_LOOP_23_VEC_LOOP_C_1 = 9'd204,
    COMP_LOOP_23_VEC_LOOP_C_2 = 9'd205,
    COMP_LOOP_23_VEC_LOOP_C_3 = 9'd206,
    COMP_LOOP_23_VEC_LOOP_C_4 = 9'd207,
    COMP_LOOP_23_VEC_LOOP_C_5 = 9'd208,
    COMP_LOOP_23_VEC_LOOP_C_6 = 9'd209,
    COMP_LOOP_23_VEC_LOOP_C_7 = 9'd210,
    COMP_LOOP_C_25 = 9'd211,
    COMP_LOOP_24_VEC_LOOP_C_0 = 9'd212,
    COMP_LOOP_24_VEC_LOOP_C_1 = 9'd213,
    COMP_LOOP_24_VEC_LOOP_C_2 = 9'd214,
    COMP_LOOP_24_VEC_LOOP_C_3 = 9'd215,
    COMP_LOOP_24_VEC_LOOP_C_4 = 9'd216,
    COMP_LOOP_24_VEC_LOOP_C_5 = 9'd217,
    COMP_LOOP_24_VEC_LOOP_C_6 = 9'd218,
    COMP_LOOP_24_VEC_LOOP_C_7 = 9'd219,
    COMP_LOOP_C_26 = 9'd220,
    COMP_LOOP_25_VEC_LOOP_C_0 = 9'd221,
    COMP_LOOP_25_VEC_LOOP_C_1 = 9'd222,
    COMP_LOOP_25_VEC_LOOP_C_2 = 9'd223,
    COMP_LOOP_25_VEC_LOOP_C_3 = 9'd224,
    COMP_LOOP_25_VEC_LOOP_C_4 = 9'd225,
    COMP_LOOP_25_VEC_LOOP_C_5 = 9'd226,
    COMP_LOOP_25_VEC_LOOP_C_6 = 9'd227,
    COMP_LOOP_25_VEC_LOOP_C_7 = 9'd228,
    COMP_LOOP_C_27 = 9'd229,
    COMP_LOOP_26_VEC_LOOP_C_0 = 9'd230,
    COMP_LOOP_26_VEC_LOOP_C_1 = 9'd231,
    COMP_LOOP_26_VEC_LOOP_C_2 = 9'd232,
    COMP_LOOP_26_VEC_LOOP_C_3 = 9'd233,
    COMP_LOOP_26_VEC_LOOP_C_4 = 9'd234,
    COMP_LOOP_26_VEC_LOOP_C_5 = 9'd235,
    COMP_LOOP_26_VEC_LOOP_C_6 = 9'd236,
    COMP_LOOP_26_VEC_LOOP_C_7 = 9'd237,
    COMP_LOOP_C_28 = 9'd238,
    COMP_LOOP_27_VEC_LOOP_C_0 = 9'd239,
    COMP_LOOP_27_VEC_LOOP_C_1 = 9'd240,
    COMP_LOOP_27_VEC_LOOP_C_2 = 9'd241,
    COMP_LOOP_27_VEC_LOOP_C_3 = 9'd242,
    COMP_LOOP_27_VEC_LOOP_C_4 = 9'd243,
    COMP_LOOP_27_VEC_LOOP_C_5 = 9'd244,
    COMP_LOOP_27_VEC_LOOP_C_6 = 9'd245,
    COMP_LOOP_27_VEC_LOOP_C_7 = 9'd246,
    COMP_LOOP_C_29 = 9'd247,
    COMP_LOOP_28_VEC_LOOP_C_0 = 9'd248,
    COMP_LOOP_28_VEC_LOOP_C_1 = 9'd249,
    COMP_LOOP_28_VEC_LOOP_C_2 = 9'd250,
    COMP_LOOP_28_VEC_LOOP_C_3 = 9'd251,
    COMP_LOOP_28_VEC_LOOP_C_4 = 9'd252,
    COMP_LOOP_28_VEC_LOOP_C_5 = 9'd253,
    COMP_LOOP_28_VEC_LOOP_C_6 = 9'd254,
    COMP_LOOP_28_VEC_LOOP_C_7 = 9'd255,
    COMP_LOOP_C_30 = 9'd256,
    COMP_LOOP_29_VEC_LOOP_C_0 = 9'd257,
    COMP_LOOP_29_VEC_LOOP_C_1 = 9'd258,
    COMP_LOOP_29_VEC_LOOP_C_2 = 9'd259,
    COMP_LOOP_29_VEC_LOOP_C_3 = 9'd260,
    COMP_LOOP_29_VEC_LOOP_C_4 = 9'd261,
    COMP_LOOP_29_VEC_LOOP_C_5 = 9'd262,
    COMP_LOOP_29_VEC_LOOP_C_6 = 9'd263,
    COMP_LOOP_29_VEC_LOOP_C_7 = 9'd264,
    COMP_LOOP_C_31 = 9'd265,
    COMP_LOOP_30_VEC_LOOP_C_0 = 9'd266,
    COMP_LOOP_30_VEC_LOOP_C_1 = 9'd267,
    COMP_LOOP_30_VEC_LOOP_C_2 = 9'd268,
    COMP_LOOP_30_VEC_LOOP_C_3 = 9'd269,
    COMP_LOOP_30_VEC_LOOP_C_4 = 9'd270,
    COMP_LOOP_30_VEC_LOOP_C_5 = 9'd271,
    COMP_LOOP_30_VEC_LOOP_C_6 = 9'd272,
    COMP_LOOP_30_VEC_LOOP_C_7 = 9'd273,
    COMP_LOOP_C_32 = 9'd274,
    COMP_LOOP_31_VEC_LOOP_C_0 = 9'd275,
    COMP_LOOP_31_VEC_LOOP_C_1 = 9'd276,
    COMP_LOOP_31_VEC_LOOP_C_2 = 9'd277,
    COMP_LOOP_31_VEC_LOOP_C_3 = 9'd278,
    COMP_LOOP_31_VEC_LOOP_C_4 = 9'd279,
    COMP_LOOP_31_VEC_LOOP_C_5 = 9'd280,
    COMP_LOOP_31_VEC_LOOP_C_6 = 9'd281,
    COMP_LOOP_31_VEC_LOOP_C_7 = 9'd282,
    COMP_LOOP_C_33 = 9'd283,
    COMP_LOOP_32_VEC_LOOP_C_0 = 9'd284,
    COMP_LOOP_32_VEC_LOOP_C_1 = 9'd285,
    COMP_LOOP_32_VEC_LOOP_C_2 = 9'd286,
    COMP_LOOP_32_VEC_LOOP_C_3 = 9'd287,
    COMP_LOOP_32_VEC_LOOP_C_4 = 9'd288,
    COMP_LOOP_32_VEC_LOOP_C_5 = 9'd289,
    COMP_LOOP_32_VEC_LOOP_C_6 = 9'd290,
    COMP_LOOP_32_VEC_LOOP_C_7 = 9'd291,
    COMP_LOOP_C_34 = 9'd292,
    STAGE_LOOP_C_1 = 9'd293,
    main_C_1 = 9'd294,
    main_C_2 = 9'd295;

  reg [8:0] state_var;
  reg [8:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_precomp_core_core_fsm_1
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
        if ( COMP_LOOP_1_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_3;
        end
        else begin
          state_var_NS = COMP_LOOP_1_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_3 : begin
        fsm_output = 9'b000001101;
        if ( COMP_LOOP_C_3_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_2_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000001110;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_1;
      end
      COMP_LOOP_2_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000001111;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_2;
      end
      COMP_LOOP_2_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000010000;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_3;
      end
      COMP_LOOP_2_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000010001;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_4;
      end
      COMP_LOOP_2_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000010010;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_5;
      end
      COMP_LOOP_2_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000010011;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_6;
      end
      COMP_LOOP_2_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000010100;
        state_var_NS = COMP_LOOP_2_VEC_LOOP_C_7;
      end
      COMP_LOOP_2_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000010101;
        if ( COMP_LOOP_2_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_4;
        end
        else begin
          state_var_NS = COMP_LOOP_2_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_4 : begin
        fsm_output = 9'b000010110;
        if ( COMP_LOOP_C_4_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_3_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000010111;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_1;
      end
      COMP_LOOP_3_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000011000;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_2;
      end
      COMP_LOOP_3_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000011001;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_3;
      end
      COMP_LOOP_3_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000011010;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_4;
      end
      COMP_LOOP_3_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000011011;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_5;
      end
      COMP_LOOP_3_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000011100;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_6;
      end
      COMP_LOOP_3_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000011101;
        state_var_NS = COMP_LOOP_3_VEC_LOOP_C_7;
      end
      COMP_LOOP_3_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000011110;
        if ( COMP_LOOP_3_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_5;
        end
        else begin
          state_var_NS = COMP_LOOP_3_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_5 : begin
        fsm_output = 9'b000011111;
        if ( COMP_LOOP_C_5_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_4_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000100000;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_1;
      end
      COMP_LOOP_4_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000100001;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_2;
      end
      COMP_LOOP_4_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000100010;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_3;
      end
      COMP_LOOP_4_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000100011;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_4;
      end
      COMP_LOOP_4_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000100100;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_5;
      end
      COMP_LOOP_4_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000100101;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_6;
      end
      COMP_LOOP_4_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000100110;
        state_var_NS = COMP_LOOP_4_VEC_LOOP_C_7;
      end
      COMP_LOOP_4_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000100111;
        if ( COMP_LOOP_4_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_6;
        end
        else begin
          state_var_NS = COMP_LOOP_4_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_6 : begin
        fsm_output = 9'b000101000;
        if ( COMP_LOOP_C_6_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_5_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000101001;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_1;
      end
      COMP_LOOP_5_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000101010;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_2;
      end
      COMP_LOOP_5_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000101011;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_3;
      end
      COMP_LOOP_5_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000101100;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_4;
      end
      COMP_LOOP_5_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000101101;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_5;
      end
      COMP_LOOP_5_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000101110;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_6;
      end
      COMP_LOOP_5_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000101111;
        state_var_NS = COMP_LOOP_5_VEC_LOOP_C_7;
      end
      COMP_LOOP_5_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000110000;
        if ( COMP_LOOP_5_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_7;
        end
        else begin
          state_var_NS = COMP_LOOP_5_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_7 : begin
        fsm_output = 9'b000110001;
        if ( COMP_LOOP_C_7_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_6_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000110010;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_1;
      end
      COMP_LOOP_6_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000110011;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_2;
      end
      COMP_LOOP_6_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000110100;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_3;
      end
      COMP_LOOP_6_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000110101;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_4;
      end
      COMP_LOOP_6_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000110110;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_5;
      end
      COMP_LOOP_6_VEC_LOOP_C_5 : begin
        fsm_output = 9'b000110111;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_6;
      end
      COMP_LOOP_6_VEC_LOOP_C_6 : begin
        fsm_output = 9'b000111000;
        state_var_NS = COMP_LOOP_6_VEC_LOOP_C_7;
      end
      COMP_LOOP_6_VEC_LOOP_C_7 : begin
        fsm_output = 9'b000111001;
        if ( COMP_LOOP_6_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_8;
        end
        else begin
          state_var_NS = COMP_LOOP_6_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_8 : begin
        fsm_output = 9'b000111010;
        if ( COMP_LOOP_C_8_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_7_VEC_LOOP_C_0 : begin
        fsm_output = 9'b000111011;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_1;
      end
      COMP_LOOP_7_VEC_LOOP_C_1 : begin
        fsm_output = 9'b000111100;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_2;
      end
      COMP_LOOP_7_VEC_LOOP_C_2 : begin
        fsm_output = 9'b000111101;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_3;
      end
      COMP_LOOP_7_VEC_LOOP_C_3 : begin
        fsm_output = 9'b000111110;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_4;
      end
      COMP_LOOP_7_VEC_LOOP_C_4 : begin
        fsm_output = 9'b000111111;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_5;
      end
      COMP_LOOP_7_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001000000;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_6;
      end
      COMP_LOOP_7_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001000001;
        state_var_NS = COMP_LOOP_7_VEC_LOOP_C_7;
      end
      COMP_LOOP_7_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001000010;
        if ( COMP_LOOP_7_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_9;
        end
        else begin
          state_var_NS = COMP_LOOP_7_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_9 : begin
        fsm_output = 9'b001000011;
        if ( COMP_LOOP_C_9_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_8_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001000100;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_1;
      end
      COMP_LOOP_8_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001000101;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_2;
      end
      COMP_LOOP_8_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001000110;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_3;
      end
      COMP_LOOP_8_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001000111;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_4;
      end
      COMP_LOOP_8_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001001000;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_5;
      end
      COMP_LOOP_8_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001001001;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_6;
      end
      COMP_LOOP_8_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001001010;
        state_var_NS = COMP_LOOP_8_VEC_LOOP_C_7;
      end
      COMP_LOOP_8_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001001011;
        if ( COMP_LOOP_8_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_10;
        end
        else begin
          state_var_NS = COMP_LOOP_8_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_10 : begin
        fsm_output = 9'b001001100;
        if ( COMP_LOOP_C_10_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_9_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001001101;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_1;
      end
      COMP_LOOP_9_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001001110;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_2;
      end
      COMP_LOOP_9_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001001111;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_3;
      end
      COMP_LOOP_9_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001010000;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_4;
      end
      COMP_LOOP_9_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001010001;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_5;
      end
      COMP_LOOP_9_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001010010;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_6;
      end
      COMP_LOOP_9_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001010011;
        state_var_NS = COMP_LOOP_9_VEC_LOOP_C_7;
      end
      COMP_LOOP_9_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001010100;
        if ( COMP_LOOP_9_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_11;
        end
        else begin
          state_var_NS = COMP_LOOP_9_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_11 : begin
        fsm_output = 9'b001010101;
        if ( COMP_LOOP_C_11_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_10_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001010110;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_1;
      end
      COMP_LOOP_10_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001010111;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_2;
      end
      COMP_LOOP_10_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001011000;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_3;
      end
      COMP_LOOP_10_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001011001;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_4;
      end
      COMP_LOOP_10_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001011010;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_5;
      end
      COMP_LOOP_10_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001011011;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_6;
      end
      COMP_LOOP_10_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001011100;
        state_var_NS = COMP_LOOP_10_VEC_LOOP_C_7;
      end
      COMP_LOOP_10_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001011101;
        if ( COMP_LOOP_10_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_12;
        end
        else begin
          state_var_NS = COMP_LOOP_10_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_12 : begin
        fsm_output = 9'b001011110;
        if ( COMP_LOOP_C_12_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_11_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001011111;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_1;
      end
      COMP_LOOP_11_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001100000;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_2;
      end
      COMP_LOOP_11_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001100001;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_3;
      end
      COMP_LOOP_11_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001100010;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_4;
      end
      COMP_LOOP_11_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001100011;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_5;
      end
      COMP_LOOP_11_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001100100;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_6;
      end
      COMP_LOOP_11_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001100101;
        state_var_NS = COMP_LOOP_11_VEC_LOOP_C_7;
      end
      COMP_LOOP_11_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001100110;
        if ( COMP_LOOP_11_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_13;
        end
        else begin
          state_var_NS = COMP_LOOP_11_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_13 : begin
        fsm_output = 9'b001100111;
        if ( COMP_LOOP_C_13_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_12_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001101000;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_1;
      end
      COMP_LOOP_12_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001101001;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_2;
      end
      COMP_LOOP_12_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001101010;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_3;
      end
      COMP_LOOP_12_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001101011;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_4;
      end
      COMP_LOOP_12_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001101100;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_5;
      end
      COMP_LOOP_12_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001101101;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_6;
      end
      COMP_LOOP_12_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001101110;
        state_var_NS = COMP_LOOP_12_VEC_LOOP_C_7;
      end
      COMP_LOOP_12_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001101111;
        if ( COMP_LOOP_12_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_14;
        end
        else begin
          state_var_NS = COMP_LOOP_12_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_14 : begin
        fsm_output = 9'b001110000;
        if ( COMP_LOOP_C_14_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_13_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001110001;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_1;
      end
      COMP_LOOP_13_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001110010;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_2;
      end
      COMP_LOOP_13_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001110011;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_3;
      end
      COMP_LOOP_13_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001110100;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_4;
      end
      COMP_LOOP_13_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001110101;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_5;
      end
      COMP_LOOP_13_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001110110;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_6;
      end
      COMP_LOOP_13_VEC_LOOP_C_6 : begin
        fsm_output = 9'b001110111;
        state_var_NS = COMP_LOOP_13_VEC_LOOP_C_7;
      end
      COMP_LOOP_13_VEC_LOOP_C_7 : begin
        fsm_output = 9'b001111000;
        if ( COMP_LOOP_13_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_15;
        end
        else begin
          state_var_NS = COMP_LOOP_13_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_15 : begin
        fsm_output = 9'b001111001;
        if ( COMP_LOOP_C_15_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_14_VEC_LOOP_C_0 : begin
        fsm_output = 9'b001111010;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_1;
      end
      COMP_LOOP_14_VEC_LOOP_C_1 : begin
        fsm_output = 9'b001111011;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_2;
      end
      COMP_LOOP_14_VEC_LOOP_C_2 : begin
        fsm_output = 9'b001111100;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_3;
      end
      COMP_LOOP_14_VEC_LOOP_C_3 : begin
        fsm_output = 9'b001111101;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_4;
      end
      COMP_LOOP_14_VEC_LOOP_C_4 : begin
        fsm_output = 9'b001111110;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_5;
      end
      COMP_LOOP_14_VEC_LOOP_C_5 : begin
        fsm_output = 9'b001111111;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_6;
      end
      COMP_LOOP_14_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010000000;
        state_var_NS = COMP_LOOP_14_VEC_LOOP_C_7;
      end
      COMP_LOOP_14_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010000001;
        if ( COMP_LOOP_14_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_16;
        end
        else begin
          state_var_NS = COMP_LOOP_14_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_16 : begin
        fsm_output = 9'b010000010;
        if ( COMP_LOOP_C_16_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_15_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010000011;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_1;
      end
      COMP_LOOP_15_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010000100;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_2;
      end
      COMP_LOOP_15_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010000101;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_3;
      end
      COMP_LOOP_15_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010000110;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_4;
      end
      COMP_LOOP_15_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010000111;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_5;
      end
      COMP_LOOP_15_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010001000;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_6;
      end
      COMP_LOOP_15_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010001001;
        state_var_NS = COMP_LOOP_15_VEC_LOOP_C_7;
      end
      COMP_LOOP_15_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010001010;
        if ( COMP_LOOP_15_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_17;
        end
        else begin
          state_var_NS = COMP_LOOP_15_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_17 : begin
        fsm_output = 9'b010001011;
        if ( COMP_LOOP_C_17_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_16_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010001100;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_1;
      end
      COMP_LOOP_16_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010001101;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_2;
      end
      COMP_LOOP_16_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010001110;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_3;
      end
      COMP_LOOP_16_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010001111;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_4;
      end
      COMP_LOOP_16_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010010000;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_5;
      end
      COMP_LOOP_16_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010010001;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_6;
      end
      COMP_LOOP_16_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010010010;
        state_var_NS = COMP_LOOP_16_VEC_LOOP_C_7;
      end
      COMP_LOOP_16_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010010011;
        if ( COMP_LOOP_16_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_18;
        end
        else begin
          state_var_NS = COMP_LOOP_16_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_18 : begin
        fsm_output = 9'b010010100;
        if ( COMP_LOOP_C_18_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_17_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_17_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010010101;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_1;
      end
      COMP_LOOP_17_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010010110;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_2;
      end
      COMP_LOOP_17_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010010111;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_3;
      end
      COMP_LOOP_17_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010011000;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_4;
      end
      COMP_LOOP_17_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010011001;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_5;
      end
      COMP_LOOP_17_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010011010;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_6;
      end
      COMP_LOOP_17_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010011011;
        state_var_NS = COMP_LOOP_17_VEC_LOOP_C_7;
      end
      COMP_LOOP_17_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010011100;
        if ( COMP_LOOP_17_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_19;
        end
        else begin
          state_var_NS = COMP_LOOP_17_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_19 : begin
        fsm_output = 9'b010011101;
        if ( COMP_LOOP_C_19_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_18_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_18_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010011110;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_1;
      end
      COMP_LOOP_18_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010011111;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_2;
      end
      COMP_LOOP_18_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010100000;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_3;
      end
      COMP_LOOP_18_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010100001;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_4;
      end
      COMP_LOOP_18_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010100010;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_5;
      end
      COMP_LOOP_18_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010100011;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_6;
      end
      COMP_LOOP_18_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010100100;
        state_var_NS = COMP_LOOP_18_VEC_LOOP_C_7;
      end
      COMP_LOOP_18_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010100101;
        if ( COMP_LOOP_18_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_20;
        end
        else begin
          state_var_NS = COMP_LOOP_18_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_20 : begin
        fsm_output = 9'b010100110;
        if ( COMP_LOOP_C_20_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_19_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_19_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010100111;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_1;
      end
      COMP_LOOP_19_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010101000;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_2;
      end
      COMP_LOOP_19_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010101001;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_3;
      end
      COMP_LOOP_19_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010101010;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_4;
      end
      COMP_LOOP_19_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010101011;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_5;
      end
      COMP_LOOP_19_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010101100;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_6;
      end
      COMP_LOOP_19_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010101101;
        state_var_NS = COMP_LOOP_19_VEC_LOOP_C_7;
      end
      COMP_LOOP_19_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010101110;
        if ( COMP_LOOP_19_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_21;
        end
        else begin
          state_var_NS = COMP_LOOP_19_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_21 : begin
        fsm_output = 9'b010101111;
        if ( COMP_LOOP_C_21_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_20_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_20_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010110000;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_1;
      end
      COMP_LOOP_20_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010110001;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_2;
      end
      COMP_LOOP_20_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010110010;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_3;
      end
      COMP_LOOP_20_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010110011;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_4;
      end
      COMP_LOOP_20_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010110100;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_5;
      end
      COMP_LOOP_20_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010110101;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_6;
      end
      COMP_LOOP_20_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010110110;
        state_var_NS = COMP_LOOP_20_VEC_LOOP_C_7;
      end
      COMP_LOOP_20_VEC_LOOP_C_7 : begin
        fsm_output = 9'b010110111;
        if ( COMP_LOOP_20_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_22;
        end
        else begin
          state_var_NS = COMP_LOOP_20_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_22 : begin
        fsm_output = 9'b010111000;
        if ( COMP_LOOP_C_22_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_21_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_21_VEC_LOOP_C_0 : begin
        fsm_output = 9'b010111001;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_1;
      end
      COMP_LOOP_21_VEC_LOOP_C_1 : begin
        fsm_output = 9'b010111010;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_2;
      end
      COMP_LOOP_21_VEC_LOOP_C_2 : begin
        fsm_output = 9'b010111011;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_3;
      end
      COMP_LOOP_21_VEC_LOOP_C_3 : begin
        fsm_output = 9'b010111100;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_4;
      end
      COMP_LOOP_21_VEC_LOOP_C_4 : begin
        fsm_output = 9'b010111101;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_5;
      end
      COMP_LOOP_21_VEC_LOOP_C_5 : begin
        fsm_output = 9'b010111110;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_6;
      end
      COMP_LOOP_21_VEC_LOOP_C_6 : begin
        fsm_output = 9'b010111111;
        state_var_NS = COMP_LOOP_21_VEC_LOOP_C_7;
      end
      COMP_LOOP_21_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011000000;
        if ( COMP_LOOP_21_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_23;
        end
        else begin
          state_var_NS = COMP_LOOP_21_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_23 : begin
        fsm_output = 9'b011000001;
        if ( COMP_LOOP_C_23_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_22_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_22_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011000010;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_1;
      end
      COMP_LOOP_22_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011000011;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_2;
      end
      COMP_LOOP_22_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011000100;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_3;
      end
      COMP_LOOP_22_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011000101;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_4;
      end
      COMP_LOOP_22_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011000110;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_5;
      end
      COMP_LOOP_22_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011000111;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_6;
      end
      COMP_LOOP_22_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011001000;
        state_var_NS = COMP_LOOP_22_VEC_LOOP_C_7;
      end
      COMP_LOOP_22_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011001001;
        if ( COMP_LOOP_22_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_24;
        end
        else begin
          state_var_NS = COMP_LOOP_22_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_24 : begin
        fsm_output = 9'b011001010;
        if ( COMP_LOOP_C_24_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_23_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_23_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011001011;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_1;
      end
      COMP_LOOP_23_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011001100;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_2;
      end
      COMP_LOOP_23_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011001101;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_3;
      end
      COMP_LOOP_23_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011001110;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_4;
      end
      COMP_LOOP_23_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011001111;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_5;
      end
      COMP_LOOP_23_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011010000;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_6;
      end
      COMP_LOOP_23_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011010001;
        state_var_NS = COMP_LOOP_23_VEC_LOOP_C_7;
      end
      COMP_LOOP_23_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011010010;
        if ( COMP_LOOP_23_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_25;
        end
        else begin
          state_var_NS = COMP_LOOP_23_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_25 : begin
        fsm_output = 9'b011010011;
        if ( COMP_LOOP_C_25_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_24_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_24_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011010100;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_1;
      end
      COMP_LOOP_24_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011010101;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_2;
      end
      COMP_LOOP_24_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011010110;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_3;
      end
      COMP_LOOP_24_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011010111;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_4;
      end
      COMP_LOOP_24_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011011000;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_5;
      end
      COMP_LOOP_24_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011011001;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_6;
      end
      COMP_LOOP_24_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011011010;
        state_var_NS = COMP_LOOP_24_VEC_LOOP_C_7;
      end
      COMP_LOOP_24_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011011011;
        if ( COMP_LOOP_24_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_26;
        end
        else begin
          state_var_NS = COMP_LOOP_24_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_26 : begin
        fsm_output = 9'b011011100;
        if ( COMP_LOOP_C_26_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_25_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_25_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011011101;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_1;
      end
      COMP_LOOP_25_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011011110;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_2;
      end
      COMP_LOOP_25_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011011111;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_3;
      end
      COMP_LOOP_25_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011100000;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_4;
      end
      COMP_LOOP_25_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011100001;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_5;
      end
      COMP_LOOP_25_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011100010;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_6;
      end
      COMP_LOOP_25_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011100011;
        state_var_NS = COMP_LOOP_25_VEC_LOOP_C_7;
      end
      COMP_LOOP_25_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011100100;
        if ( COMP_LOOP_25_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_27;
        end
        else begin
          state_var_NS = COMP_LOOP_25_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_27 : begin
        fsm_output = 9'b011100101;
        if ( COMP_LOOP_C_27_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_26_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_26_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011100110;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_1;
      end
      COMP_LOOP_26_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011100111;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_2;
      end
      COMP_LOOP_26_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011101000;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_3;
      end
      COMP_LOOP_26_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011101001;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_4;
      end
      COMP_LOOP_26_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011101010;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_5;
      end
      COMP_LOOP_26_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011101011;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_6;
      end
      COMP_LOOP_26_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011101100;
        state_var_NS = COMP_LOOP_26_VEC_LOOP_C_7;
      end
      COMP_LOOP_26_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011101101;
        if ( COMP_LOOP_26_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_28;
        end
        else begin
          state_var_NS = COMP_LOOP_26_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_28 : begin
        fsm_output = 9'b011101110;
        if ( COMP_LOOP_C_28_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_27_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_27_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011101111;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_1;
      end
      COMP_LOOP_27_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011110000;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_2;
      end
      COMP_LOOP_27_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011110001;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_3;
      end
      COMP_LOOP_27_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011110010;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_4;
      end
      COMP_LOOP_27_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011110011;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_5;
      end
      COMP_LOOP_27_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011110100;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_6;
      end
      COMP_LOOP_27_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011110101;
        state_var_NS = COMP_LOOP_27_VEC_LOOP_C_7;
      end
      COMP_LOOP_27_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011110110;
        if ( COMP_LOOP_27_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_29;
        end
        else begin
          state_var_NS = COMP_LOOP_27_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_29 : begin
        fsm_output = 9'b011110111;
        if ( COMP_LOOP_C_29_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_28_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_28_VEC_LOOP_C_0 : begin
        fsm_output = 9'b011111000;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_1;
      end
      COMP_LOOP_28_VEC_LOOP_C_1 : begin
        fsm_output = 9'b011111001;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_2;
      end
      COMP_LOOP_28_VEC_LOOP_C_2 : begin
        fsm_output = 9'b011111010;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_3;
      end
      COMP_LOOP_28_VEC_LOOP_C_3 : begin
        fsm_output = 9'b011111011;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_4;
      end
      COMP_LOOP_28_VEC_LOOP_C_4 : begin
        fsm_output = 9'b011111100;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_5;
      end
      COMP_LOOP_28_VEC_LOOP_C_5 : begin
        fsm_output = 9'b011111101;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_6;
      end
      COMP_LOOP_28_VEC_LOOP_C_6 : begin
        fsm_output = 9'b011111110;
        state_var_NS = COMP_LOOP_28_VEC_LOOP_C_7;
      end
      COMP_LOOP_28_VEC_LOOP_C_7 : begin
        fsm_output = 9'b011111111;
        if ( COMP_LOOP_28_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_30;
        end
        else begin
          state_var_NS = COMP_LOOP_28_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_30 : begin
        fsm_output = 9'b100000000;
        if ( COMP_LOOP_C_30_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_29_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_29_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100000001;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_1;
      end
      COMP_LOOP_29_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100000010;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_2;
      end
      COMP_LOOP_29_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100000011;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_3;
      end
      COMP_LOOP_29_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100000100;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_4;
      end
      COMP_LOOP_29_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100000101;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_5;
      end
      COMP_LOOP_29_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100000110;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_6;
      end
      COMP_LOOP_29_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100000111;
        state_var_NS = COMP_LOOP_29_VEC_LOOP_C_7;
      end
      COMP_LOOP_29_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100001000;
        if ( COMP_LOOP_29_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_31;
        end
        else begin
          state_var_NS = COMP_LOOP_29_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_31 : begin
        fsm_output = 9'b100001001;
        if ( COMP_LOOP_C_31_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_30_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_30_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100001010;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_1;
      end
      COMP_LOOP_30_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100001011;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_2;
      end
      COMP_LOOP_30_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100001100;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_3;
      end
      COMP_LOOP_30_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100001101;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_4;
      end
      COMP_LOOP_30_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100001110;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_5;
      end
      COMP_LOOP_30_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100001111;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_6;
      end
      COMP_LOOP_30_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100010000;
        state_var_NS = COMP_LOOP_30_VEC_LOOP_C_7;
      end
      COMP_LOOP_30_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100010001;
        if ( COMP_LOOP_30_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_32;
        end
        else begin
          state_var_NS = COMP_LOOP_30_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_32 : begin
        fsm_output = 9'b100010010;
        if ( COMP_LOOP_C_32_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_31_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_31_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100010011;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_1;
      end
      COMP_LOOP_31_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100010100;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_2;
      end
      COMP_LOOP_31_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100010101;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_3;
      end
      COMP_LOOP_31_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100010110;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_4;
      end
      COMP_LOOP_31_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100010111;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_5;
      end
      COMP_LOOP_31_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100011000;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_6;
      end
      COMP_LOOP_31_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100011001;
        state_var_NS = COMP_LOOP_31_VEC_LOOP_C_7;
      end
      COMP_LOOP_31_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100011010;
        if ( COMP_LOOP_31_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_33;
        end
        else begin
          state_var_NS = COMP_LOOP_31_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_33 : begin
        fsm_output = 9'b100011011;
        if ( COMP_LOOP_C_33_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_32_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_32_VEC_LOOP_C_0 : begin
        fsm_output = 9'b100011100;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_1;
      end
      COMP_LOOP_32_VEC_LOOP_C_1 : begin
        fsm_output = 9'b100011101;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_2;
      end
      COMP_LOOP_32_VEC_LOOP_C_2 : begin
        fsm_output = 9'b100011110;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_3;
      end
      COMP_LOOP_32_VEC_LOOP_C_3 : begin
        fsm_output = 9'b100011111;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_4;
      end
      COMP_LOOP_32_VEC_LOOP_C_4 : begin
        fsm_output = 9'b100100000;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_5;
      end
      COMP_LOOP_32_VEC_LOOP_C_5 : begin
        fsm_output = 9'b100100001;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_6;
      end
      COMP_LOOP_32_VEC_LOOP_C_6 : begin
        fsm_output = 9'b100100010;
        state_var_NS = COMP_LOOP_32_VEC_LOOP_C_7;
      end
      COMP_LOOP_32_VEC_LOOP_C_7 : begin
        fsm_output = 9'b100100011;
        if ( COMP_LOOP_32_VEC_LOOP_C_7_tr0 ) begin
          state_var_NS = COMP_LOOP_C_34;
        end
        else begin
          state_var_NS = COMP_LOOP_32_VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_34 : begin
        fsm_output = 9'b100100100;
        if ( COMP_LOOP_C_34_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 9'b100100101;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 9'b100100110;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 9'b100100111;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_staller
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_staller (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl (
  core_wten, r_rsc_triosy_obj_iswt0, r_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input r_rsc_triosy_obj_iswt0;
  output r_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign r_rsc_triosy_obj_ld_core_sct = r_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl (
  core_wten, p_rsc_triosy_obj_iswt0, p_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input p_rsc_triosy_obj_iswt0;
  output p_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign p_rsc_triosy_obj_ld_core_sct = p_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl (
  core_wten, vec_rsc_triosy_obj_iswt0, vec_rsc_triosy_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_obj_iswt0;
  output vec_rsc_triosy_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_obj_ld_core_sct = vec_rsc_triosy_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp (
  clk, rst, twiddle_h_rsci_q_d, twiddle_h_rsci_q_d_mxwt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_q_d;
  output [31:0] twiddle_h_rsci_q_d_mxwt;
  input twiddle_h_rsci_biwt;
  input twiddle_h_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsci_bcwt;
  reg [31:0] twiddle_h_rsci_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_q_d_mxwt = MUX_v_32_2_2(twiddle_h_rsci_q_d, twiddle_h_rsci_q_d_bfwt,
      twiddle_h_rsci_bcwt);
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
      twiddle_h_rsci_q_d_bfwt <= twiddle_h_rsci_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_biwt, twiddle_h_rsci_bdwt,
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct, twiddle_h_rsci_oswt_pff,
      core_wten_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output twiddle_h_rsci_biwt;
  output twiddle_h_rsci_bdwt;
  output twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_h_rsci_oswt_pff;
  input core_wten_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsci_bdwt = twiddle_h_rsci_oswt & core_wen;
  assign twiddle_h_rsci_biwt = (~ core_wten) & twiddle_h_rsci_oswt;
  assign twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_h_rsci_oswt_pff
      & (~ core_wten_pff);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp (
  clk, rst, twiddle_rsci_q_d, twiddle_rsci_q_d_mxwt, twiddle_rsci_biwt, twiddle_rsci_bdwt
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_q_d;
  output [31:0] twiddle_rsci_q_d_mxwt;
  input twiddle_rsci_biwt;
  input twiddle_rsci_bdwt;


  // Interconnect Declarations
  reg twiddle_rsci_bcwt;
  reg [31:0] twiddle_rsci_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_q_d_mxwt = MUX_v_32_2_2(twiddle_rsci_q_d, twiddle_rsci_q_d_bfwt,
      twiddle_rsci_bcwt);
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
      twiddle_rsci_q_d_bfwt <= twiddle_rsci_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl (
  core_wen, core_wten, twiddle_rsci_oswt, twiddle_rsci_biwt, twiddle_rsci_bdwt, twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct,
      twiddle_rsci_oswt_pff, core_wten_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output twiddle_rsci_biwt;
  output twiddle_rsci_bdwt;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
  input twiddle_rsci_oswt_pff;
  input core_wten_pff;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsci_bdwt = twiddle_rsci_oswt & core_wen;
  assign twiddle_rsci_biwt = (~ core_wten) & twiddle_rsci_oswt;
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct = twiddle_rsci_oswt_pff
      & (~ core_wten_pff);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp (
  clk, rst, vec_rsci_q_d, vec_rsci_q_d_mxwt, vec_rsci_biwt_1, vec_rsci_bdwt_2
);
  input clk;
  input rst;
  input [31:0] vec_rsci_q_d;
  output [31:0] vec_rsci_q_d_mxwt;
  input vec_rsci_biwt_1;
  input vec_rsci_bdwt_2;


  // Interconnect Declarations
  reg vec_rsci_bcwt_1;
  reg [31:0] vec_rsci_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_q_d_mxwt = MUX_v_32_2_2(vec_rsci_q_d, vec_rsci_q_d_bfwt, vec_rsci_bcwt_1);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsci_bcwt_1 <= 1'b0;
    end
    else begin
      vec_rsci_bcwt_1 <= ~((~(vec_rsci_bcwt_1 | vec_rsci_biwt_1)) | vec_rsci_bdwt_2);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsci_biwt_1 ) begin
      vec_rsci_q_d_bfwt <= vec_rsci_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl (
  core_wen, core_wten, vec_rsci_oswt_1, vec_rsci_biwt_1, vec_rsci_bdwt_2, vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsci_we_d_core_sct_pff, vec_rsci_iswt0_pff, core_wten_pff, vec_rsci_oswt_1_pff
);
  input core_wen;
  input core_wten;
  input vec_rsci_oswt_1;
  output vec_rsci_biwt_1;
  output vec_rsci_bdwt_2;
  output vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsci_we_d_core_sct_pff;
  input vec_rsci_iswt0_pff;
  input core_wten_pff;
  input vec_rsci_oswt_1_pff;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsci_bdwt_2 = vec_rsci_oswt_1 & core_wen;
  assign vec_rsci_biwt_1 = (~ core_wten) & vec_rsci_oswt_1;
  assign vec_rsci_we_d_core_sct_pff = vec_rsci_iswt0_pff & (~ core_wten_pff);
  assign vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct = vec_rsci_oswt_1_pff
      & (~ core_wten_pff);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_wait_dp (
  ensig_cgo_iro, ensig_cgo_iro_1, core_wen, ensig_cgo, COMP_LOOP_1_mult_cmp_ccs_ccore_en,
      ensig_cgo_1, COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo_iro_1;
  input core_wen;
  input ensig_cgo;
  output COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  input ensig_cgo_1;
  output COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign COMP_LOOP_1_mult_cmp_ccs_ccore_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en = core_wen & (ensig_cgo_1 | ensig_cgo_iro_1);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl (
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_twiddle_h_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(twiddle_h_rsc_triosy_obj_iswt0),
      .twiddle_h_rsc_triosy_obj_ld_core_sct(twiddle_h_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_twiddle_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(twiddle_rsc_triosy_obj_iswt0),
      .twiddle_rsc_triosy_obj_ld_core_sct(twiddle_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_r_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(r_rsc_triosy_obj_iswt0),
      .r_rsc_triosy_obj_ld_core_sct(r_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_p_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(p_rsc_triosy_obj_iswt0),
      .p_rsc_triosy_obj_ld_core_sct(p_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj (
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
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_vec_rsc_triosy_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(vec_rsc_triosy_obj_iswt0),
      .vec_rsc_triosy_obj_ld_core_sct(vec_rsc_triosy_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci (
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
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt),
      .complete_rsci_ivld_core_sct(complete_rsci_ivld_core_sct),
      .complete_rsci_irdy(complete_rsci_irdy)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_dp_inst
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 (
  clk, rst, twiddle_h_rsci_q_d, twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsci_oswt, twiddle_h_rsci_q_d_mxwt, twiddle_h_rsci_oswt_pff,
      core_wten_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_h_rsci_q_d;
  output twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsci_oswt;
  output [31:0] twiddle_h_rsci_q_d_mxwt;
  input twiddle_h_rsci_oswt_pff;
  input core_wten_pff;


  // Interconnect Declarations
  wire twiddle_h_rsci_biwt;
  wire twiddle_h_rsci_bdwt;
  wire twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(twiddle_h_rsci_oswt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt),
      .twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_h_rsci_oswt_pff(twiddle_h_rsci_oswt_pff),
      .core_wten_pff(core_wten_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_twiddle_h_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_q_d(twiddle_h_rsci_q_d),
      .twiddle_h_rsci_q_d_mxwt(twiddle_h_rsci_q_d_mxwt),
      .twiddle_h_rsci_biwt(twiddle_h_rsci_biwt),
      .twiddle_h_rsci_bdwt(twiddle_h_rsci_bdwt)
    );
  assign twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 (
  clk, rst, twiddle_rsci_q_d, twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, twiddle_rsci_oswt, twiddle_rsci_q_d_mxwt, twiddle_rsci_oswt_pff,
      core_wten_pff
);
  input clk;
  input rst;
  input [31:0] twiddle_rsci_q_d;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsci_oswt;
  output [31:0] twiddle_rsci_q_d_mxwt;
  input twiddle_rsci_oswt_pff;
  input core_wten_pff;


  // Interconnect Declarations
  wire twiddle_rsci_biwt;
  wire twiddle_rsci_bdwt;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(twiddle_rsci_oswt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt),
      .twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct),
      .twiddle_rsci_oswt_pff(twiddle_rsci_oswt_pff),
      .core_wten_pff(core_wten_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_twiddle_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .twiddle_rsci_q_d_mxwt(twiddle_rsci_q_d_mxwt),
      .twiddle_rsci_biwt(twiddle_rsci_biwt),
      .twiddle_rsci_bdwt(twiddle_rsci_bdwt)
    );
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsci_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsci_1 (
  clk, rst, vec_rsci_q_d, vec_rsci_readA_r_ram_ir_internal_RMASK_B_d, core_wen, core_wten,
      vec_rsci_oswt_1, vec_rsci_q_d_mxwt, vec_rsci_we_d_pff, vec_rsci_iswt0_pff,
      core_wten_pff, vec_rsci_oswt_1_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsci_q_d;
  output vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsci_oswt_1;
  output [31:0] vec_rsci_q_d_mxwt;
  output vec_rsci_we_d_pff;
  input vec_rsci_iswt0_pff;
  input core_wten_pff;
  input vec_rsci_oswt_1_pff;


  // Interconnect Declarations
  wire vec_rsci_biwt_1;
  wire vec_rsci_bdwt_2;
  wire vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsci_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsci_oswt_1(vec_rsci_oswt_1),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2),
      .vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsci_we_d_core_sct_pff(vec_rsci_we_d_core_sct_iff),
      .vec_rsci_iswt0_pff(vec_rsci_iswt0_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsci_oswt_1_pff(vec_rsci_oswt_1_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsci_1_vec_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_q_d(vec_rsci_q_d),
      .vec_rsci_q_d_mxwt(vec_rsci_q_d_mxwt),
      .vec_rsci_biwt_1(vec_rsci_biwt_1),
      .vec_rsci_bdwt_2(vec_rsci_bdwt_2)
    );
  assign vec_rsci_we_d_pff = vec_rsci_we_d_core_sct_iff;
  assign vec_rsci_readA_r_ram_ir_internal_RMASK_B_d = vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci (
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
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .run_rsci_oswt(run_rsci_oswt),
      .core_wten(core_wten),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp_inst
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz,
      r_rsc_triosy_lz, twiddle_rsc_triosy_lz, twiddle_h_rsc_triosy_lz, complete_rsc_rdy,
      complete_rsc_vld, vec_rsci_d_d, vec_rsci_q_d, vec_rsci_radr_d, vec_rsci_wadr_d,
      vec_rsci_readA_r_ram_ir_internal_RMASK_B_d, twiddle_rsci_q_d, twiddle_rsci_radr_d,
      twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d, twiddle_h_rsci_q_d, twiddle_h_rsci_radr_d,
      twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d, vec_rsci_we_d_pff
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
  output [31:0] vec_rsci_d_d;
  input [31:0] vec_rsci_q_d;
  output [13:0] vec_rsci_radr_d;
  output [13:0] vec_rsci_wadr_d;
  output vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input [31:0] twiddle_rsci_q_d;
  output [13:0] twiddle_rsci_radr_d;
  output twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  input [31:0] twiddle_h_rsci_q_d;
  output [13:0] twiddle_h_rsci_radr_d;
  output twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  output vec_rsci_we_d_pff;


  // Interconnect Declarations
  wire core_wten;
  wire run_rsci_ivld_mxwt;
  wire [31:0] vec_rsci_q_d_mxwt;
  wire [31:0] p_rsci_idat;
  wire [31:0] twiddle_rsci_q_d_mxwt;
  wire [31:0] twiddle_h_rsci_q_d_mxwt;
  wire complete_rsci_wen_comp;
  wire [31:0] COMP_LOOP_1_mult_cmp_return_rsc_z;
  wire COMP_LOOP_1_mult_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_sub_cmp_return_rsc_z;
  wire COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] COMP_LOOP_1_modulo_add_cmp_return_rsc_z;
  wire [8:0] fsm_output;
  wire nor_tmp;
  wire or_tmp_17;
  wire and_dcpl;
  wire nor_tmp_15;
  wire mux_tmp_136;
  wire not_tmp_138;
  wire or_dcpl_153;
  wire or_tmp_116;
  wire or_tmp_119;
  wire mux_tmp_216;
  wire or_tmp_120;
  wire mux_tmp_218;
  wire mux_tmp_219;
  wire or_tmp_122;
  wire mux_tmp_221;
  wire nand_tmp_7;
  wire mux_tmp_222;
  wire mux_tmp_224;
  wire or_tmp_124;
  wire mux_tmp_225;
  wire mux_tmp_226;
  wire mux_tmp_228;
  wire or_tmp_126;
  wire mux_tmp_235;
  wire mux_tmp_243;
  wire mux_tmp_246;
  wire and_tmp_16;
  wire or_tmp_140;
  wire nand_tmp_9;
  wire or_tmp_151;
  wire or_tmp_155;
  wire mux_tmp_261;
  wire mux_tmp_262;
  wire mux_tmp_263;
  wire mux_tmp_265;
  wire mux_tmp_267;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire and_dcpl_21;
  wire and_dcpl_22;
  wire and_dcpl_23;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire mux_tmp_279;
  wire or_tmp_174;
  wire mux_tmp_281;
  wire mux_tmp_283;
  wire and_dcpl_26;
  wire and_dcpl_28;
  wire and_dcpl_30;
  wire and_dcpl_31;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire or_tmp_179;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_38;
  wire and_dcpl_40;
  wire and_dcpl_41;
  wire and_dcpl_42;
  wire and_dcpl_43;
  wire and_dcpl_45;
  wire and_dcpl_46;
  wire and_dcpl_47;
  wire not_tmp_192;
  wire and_dcpl_48;
  wire and_dcpl_50;
  wire and_dcpl_51;
  wire and_dcpl_52;
  wire and_dcpl_53;
  wire and_dcpl_54;
  wire and_dcpl_55;
  wire and_dcpl_56;
  wire and_dcpl_58;
  wire and_dcpl_59;
  wire and_dcpl_60;
  wire and_dcpl_61;
  wire and_dcpl_62;
  wire and_dcpl_63;
  wire and_dcpl_64;
  wire and_dcpl_66;
  wire and_dcpl_67;
  wire and_dcpl_68;
  wire and_dcpl_70;
  wire and_dcpl_72;
  wire and_dcpl_73;
  wire and_dcpl_74;
  wire and_dcpl_75;
  wire and_dcpl_76;
  wire and_dcpl_77;
  wire and_dcpl_78;
  wire and_dcpl_80;
  wire and_dcpl_81;
  wire and_dcpl_82;
  wire and_dcpl_83;
  wire and_dcpl_85;
  wire and_dcpl_86;
  wire and_dcpl_87;
  wire and_dcpl_89;
  wire and_dcpl_90;
  wire and_dcpl_92;
  wire and_dcpl_94;
  wire and_dcpl_95;
  wire and_dcpl_96;
  wire and_dcpl_98;
  wire and_dcpl_99;
  wire and_dcpl_100;
  wire and_dcpl_101;
  wire and_dcpl_103;
  wire and_dcpl_104;
  wire and_dcpl_105;
  wire and_dcpl_106;
  wire and_dcpl_107;
  wire and_dcpl_109;
  wire and_dcpl_111;
  wire and_dcpl_112;
  wire and_dcpl_113;
  wire and_dcpl_115;
  wire mux_tmp_299;
  wire or_tmp_197;
  wire xor_dcpl;
  wire and_dcpl_116;
  wire and_dcpl_118;
  wire and_dcpl_119;
  wire and_dcpl_122;
  wire or_tmp_202;
  wire mux_tmp_312;
  wire nand_tmp_17;
  wire mux_tmp_319;
  wire mux_tmp_325;
  wire and_dcpl_123;
  wire mux_tmp_335;
  wire or_tmp_237;
  wire or_tmp_239;
  wire mux_tmp_340;
  wire mux_tmp_343;
  wire or_tmp_248;
  wire or_tmp_258;
  wire mux_tmp_361;
  wire or_tmp_260;
  wire mux_tmp_362;
  wire or_tmp_262;
  wire or_tmp_264;
  wire and_dcpl_126;
  wire and_dcpl_127;
  wire mux_tmp_377;
  wire and_dcpl_132;
  wire mux_tmp_385;
  wire mux_tmp_388;
  wire nand_tmp_23;
  wire mux_tmp_392;
  wire or_tmp_295;
  wire and_tmp_18;
  wire mux_tmp_400;
  wire mux_tmp_401;
  wire and_dcpl_133;
  wire mux_tmp_411;
  wire or_tmp_321;
  wire or_tmp_324;
  wire mux_tmp_419;
  wire mux_tmp_420;
  wire and_tmp_20;
  wire mux_tmp_421;
  wire mux_tmp_423;
  wire mux_tmp_434;
  wire mux_tmp_435;
  wire or_tmp_342;
  wire and_dcpl_136;
  wire mux_tmp_443;
  wire and_dcpl_138;
  wire and_dcpl_140;
  wire xor_dcpl_1;
  wire and_dcpl_144;
  wire and_dcpl_151;
  wire or_tmp_357;
  wire mux_tmp_448;
  wire mux_tmp_449;
  wire mux_tmp_450;
  wire or_tmp_363;
  wire mux_tmp_452;
  wire and_dcpl_159;
  wire or_tmp_371;
  wire mux_tmp_462;
  wire nand_tmp_26;
  wire and_dcpl_166;
  wire mux_tmp_468;
  wire mux_tmp_469;
  wire or_tmp_378;
  wire mux_tmp_470;
  wire mux_tmp_471;
  wire or_tmp_380;
  wire mux_tmp_472;
  wire or_tmp_381;
  wire mux_tmp_474;
  wire mux_tmp_478;
  wire nor_tmp_30;
  wire mux_tmp_479;
  wire mux_tmp_481;
  wire mux_tmp_485;
  wire mux_tmp_488;
  wire mux_tmp_502;
  wire mux_tmp_504;
  wire or_tmp_401;
  wire mux_tmp_515;
  wire or_tmp_409;
  wire mux_tmp_537;
  wire mux_tmp_538;
  wire mux_tmp_555;
  wire not_tmp_313;
  wire mux_tmp_587;
  wire mux_tmp_593;
  wire mux_tmp_594;
  wire mux_tmp_609;
  wire mux_tmp_611;
  wire or_tmp_489;
  wire or_tmp_493;
  wire mux_tmp_623;
  wire mux_tmp_664;
  reg [13:0] VEC_LOOP_acc_1_cse_10_sva;
  reg [14:0] STAGE_LOOP_lshift_psp_sva;
  reg [14:0] VEC_LOOP_j_14_0_1_sva_1;
  reg run_ac_sync_tmp_dobj_sva;
  reg reg_run_rsci_oswt_cse;
  reg reg_vec_rsci_oswt_1_cse;
  wire or_354_cse;
  wire or_380_cse;
  reg reg_twiddle_rsci_oswt_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_triosy_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  wire or_474_cse;
  reg reg_ensig_cgo_1_cse;
  wire or_720_cse;
  wire or_406_cse;
  wire or_317_cse;
  wire or_434_cse;
  wire or_408_cse;
  wire or_365_cse;
  wire nor_91_cse;
  wire or_260_cse;
  wire or_730_cse;
  wire nor_32_cse;
  wire or_529_cse;
  wire and_295_cse;
  wire or_277_cse;
  wire or_289_cse;
  wire or_299_cse;
  wire or_364_cse;
  wire or_341_cse;
  wire or_342_cse;
  wire mux_289_cse;
  wire or_471_cse;
  wire or_410_cse;
  wire mux_303_cse;
  wire mux_329_cse;
  wire mux_413_cse;
  wire mux_18_cse;
  wire and_33_cse;
  wire or_473_cse;
  wire nand_46_cse;
  wire mux_328_cse;
  wire mux_304_cse;
  wire mux_379_cse;
  wire mux_508_cse;
  wire mux_539_cse;
  wire mux_245_cse;
  wire mux_375_cse;
  wire mux_249_cse;
  wire or_544_cse;
  wire nand_10_cse;
  wire or_578_cse;
  wire mux_543_cse;
  wire vec_rsci_we_d_iff;
  wire core_wten_iff;
  wire vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  wire [8:0] COMP_LOOP_twiddle_f_mux1h_26_rmff;
  wire COMP_LOOP_twiddle_f_and_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_10_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_5_rmff;
  wire COMP_LOOP_twiddle_f_mux1h_13_rmff;
  wire COMP_LOOP_twiddle_f_mux_rmff;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  wire mux_431_rmff;
  wire twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  wire mux_498_rmff;
  reg [31:0] COMP_LOOP_twiddle_f_1_sva;
  reg [31:0] COMP_LOOP_twiddle_help_1_sva;
  reg [31:0] factor2_1_sva;
  wire [13:0] VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1;
  wire [13:0] VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2;
  wire [13:0] VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3;
  wire [13:0] VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4;
  wire [13:0] VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5;
  wire [13:0] VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6;
  wire [13:0] VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7;
  wire [13:0] VEC_LOOP_acc_10_cse_9_sva_mx0w8;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_9_sva_mx0w8;
  wire [13:0] VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9;
  wire [13:0] VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10;
  wire [13:0] VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11;
  wire [13:0] VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12;
  wire [13:0] VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13;
  wire [13:0] VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14;
  wire [13:0] VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15;
  reg [9:0] COMP_LOOP_17_twiddle_f_mul_psp_sva;
  wire [13:0] VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17;
  wire [13:0] VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18;
  wire [13:0] VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19;
  wire [13:0] VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20;
  wire [13:0] VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21;
  wire [13:0] VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22;
  wire [13:0] VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23;
  wire [13:0] VEC_LOOP_acc_10_cse_25_sva_mx0w24;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_25_sva_mx0w24;
  wire [13:0] VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25;
  wire [13:0] VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26;
  wire [13:0] VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27;
  wire [13:0] VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28;
  wire [13:0] VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29;
  wire [13:0] VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30;
  wire [13:0] VEC_LOOP_acc_10_cse_sva_mx0w31;
  wire [14:0] nl_VEC_LOOP_acc_10_cse_sva_mx0w31;
  reg [13:0] VEC_LOOP_acc_10_cse_1_sva;
  reg [31:0] p_sva;
  wire mux_276_itm;
  wire mux_533_itm;
  wire mux_548_itm;
  wire mux_257_itm;
  wire mux_295_itm;
  wire mux_617_itm;
  wire [14:0] z_out;
  wire [11:0] z_out_1;
  wire and_dcpl_293;
  wire and_dcpl_294;
  wire and_dcpl_295;
  wire and_dcpl_300;
  wire and_dcpl_301;
  wire and_dcpl_302;
  wire and_dcpl_304;
  wire and_dcpl_305;
  wire and_dcpl_308;
  wire and_dcpl_309;
  wire and_dcpl_310;
  wire and_dcpl_314;
  wire and_dcpl_315;
  wire and_dcpl_319;
  wire and_dcpl_320;
  wire and_dcpl_321;
  wire and_dcpl_323;
  wire and_dcpl_324;
  wire and_dcpl_326;
  wire and_dcpl_329;
  wire and_dcpl_332;
  wire and_dcpl_334;
  wire and_dcpl_337;
  wire and_dcpl_339;
  wire and_dcpl_341;
  wire and_dcpl_343;
  wire and_dcpl_345;
  wire and_dcpl_348;
  wire and_dcpl_350;
  wire and_dcpl_353;
  wire and_dcpl_355;
  wire and_dcpl_357;
  wire and_dcpl_359;
  wire and_dcpl_361;
  wire and_dcpl_365;
  wire and_dcpl_367;
  wire and_dcpl_369;
  wire and_dcpl_371;
  wire and_dcpl_373;
  wire [13:0] z_out_2;
  wire [27:0] nl_z_out_2;
  wire and_dcpl_394;
  wire and_dcpl_401;
  wire and_dcpl_406;
  wire and_dcpl_412;
  wire and_dcpl_444;
  wire [13:0] z_out_5;
  wire [14:0] nl_z_out_5;
  wire [13:0] z_out_6;
  wire [14:0] nl_z_out_6;
  wire and_dcpl_962;
  wire and_dcpl_964;
  wire and_dcpl_969;
  wire and_dcpl_975;
  wire [10:0] z_out_26;
  wire and_dcpl_981;
  wire and_dcpl_982;
  wire and_dcpl_983;
  wire and_dcpl_988;
  wire and_dcpl_990;
  wire and_dcpl_993;
  wire and_dcpl_994;
  wire and_dcpl_998;
  wire and_dcpl_999;
  wire and_dcpl_1001;
  wire and_dcpl_1002;
  wire and_dcpl_1007;
  wire and_dcpl_1009;
  wire and_dcpl_1010;
  wire and_dcpl_1013;
  wire and_dcpl_1014;
  wire and_dcpl_1016;
  wire and_dcpl_1018;
  wire and_dcpl_1021;
  wire and_dcpl_1023;
  wire and_dcpl_1025;
  wire and_dcpl_1026;
  wire and_dcpl_1027;
  wire and_dcpl_1028;
  wire and_dcpl_1029;
  wire and_dcpl_1030;
  wire and_dcpl_1031;
  wire [12:0] z_out_27;
  wire [3:0] z_out_28;
  wire [4:0] nl_z_out_28;
  wire mux_tmp_699;
  wire mux_tmp_700;
  wire or_tmp_551;
  wire mux_tmp_703;
  wire mux_tmp_704;
  wire and_dcpl_1053;
  wire and_dcpl_1058;
  wire and_dcpl_1062;
  wire and_dcpl_1069;
  wire and_dcpl_1073;
  wire and_dcpl_1077;
  wire and_dcpl_1081;
  wire and_dcpl_1083;
  wire and_dcpl_1085;
  wire and_dcpl_1087;
  wire and_dcpl_1089;
  wire and_dcpl_1093;
  wire and_dcpl_1096;
  wire and_dcpl_1099;
  wire and_dcpl_1101;
  wire and_dcpl_1103;
  wire [14:0] z_out_29;
  wire and_dcpl_1106;
  wire and_dcpl_1111;
  wire and_dcpl_1116;
  wire and_dcpl_1119;
  wire and_dcpl_1122;
  wire and_dcpl_1126;
  wire and_dcpl_1131;
  wire and_dcpl_1133;
  wire and_dcpl_1137;
  wire and_dcpl_1141;
  wire and_dcpl_1143;
  wire and_dcpl_1148;
  wire and_dcpl_1150;
  wire [14:0] z_out_30;
  wire and_dcpl_1158;
  wire and_dcpl_1163;
  wire and_dcpl_1168;
  wire [9:0] z_out_31;
  wire [10:0] nl_z_out_31;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [3:0] COMP_LOOP_1_twiddle_f_acc_cse_sva;
  reg [13:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva;
  reg [12:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva;
  reg [11:0] COMP_LOOP_5_twiddle_f_lshift_ncse_sva;
  reg [10:0] COMP_LOOP_9_twiddle_f_lshift_ncse_sva;
  reg [13:0] COMP_LOOP_twiddle_f_mul_cse_10_sva;
  reg [8:0] COMP_LOOP_k_14_5_sva_8_0;
  wire STAGE_LOOP_i_3_0_sva_mx0c1;
  wire [13:0] COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
  wire [12:0] COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
  wire COMP_LOOP_twiddle_f_or_1_ssc;
  wire VEC_LOOP_or_13_cse;
  wire nor_144_cse;
  wire and_618_ssc;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire and_335_cse;
  wire mux_tmp_717;
  wire mux_tmp_719;
  wire or_tmp_567;
  wire or_tmp_575;
  wire mux_tmp_728;
  wire or_tmp_578;
  wire or_tmp_579;
  wire [12:0] COMP_LOOP_twiddle_f_mux1h_40_rgt;
  wire or_tmp_595;
  wire or_tmp_605;
  wire mux_tmp_752;
  wire mux_tmp_754;
  wire [11:0] COMP_LOOP_twiddle_f_mux1h_65_rgt;
  reg [3:0] COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9;
  reg [8:0] COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0;
  reg COMP_LOOP_13_twiddle_f_mul_psp_sva_11;
  reg [10:0] COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0;
  wire nor_201_cse;
  wire or_799_cse;
  wire nor_207_cse;
  wire nand_63_cse;
  wire or_785_cse;
  wire or_713_cse;
  wire COMP_LOOP_twiddle_f_nor_itm;
  wire COMP_LOOP_twiddle_f_or_11_itm;
  wire COMP_LOOP_twiddle_f_nor_1_itm;
  wire COMP_LOOP_twiddle_f_or_13_itm;
  wire COMP_LOOP_twiddle_f_or_18_itm;
  wire VEC_LOOP_or_48_itm;
  wire VEC_LOOP_or_49_itm;
  wire VEC_LOOP_or_59_itm;
  wire VEC_LOOP_or_61_itm;
  wire VEC_LOOP_or_64_itm;
  wire VEC_LOOP_or_70_itm;
  wire VEC_LOOP_or_72_itm;
  wire VEC_LOOP_or_53_itm;
  wire STAGE_LOOP_acc_itm_4_1;

  wire[0:0] mux_275_nl;
  wire[0:0] mux_274_nl;
  wire[0:0] mux_273_nl;
  wire[0:0] mux_272_nl;
  wire[0:0] mux_271_nl;
  wire[0:0] mux_270_nl;
  wire[0:0] mux_269_nl;
  wire[0:0] mux_268_nl;
  wire[0:0] mux_266_nl;
  wire[0:0] mux_260_nl;
  wire[0:0] or_309_nl;
  wire[0:0] mux_259_nl;
  wire[0:0] mux_258_nl;
  wire[0:0] or_308_nl;
  wire[0:0] or_306_nl;
  wire[0:0] or_303_nl;
  wire[0:0] nor_81_nl;
  wire[0:0] or_379_nl;
  wire[0:0] mux_430_nl;
  wire[0:0] mux_429_nl;
  wire[0:0] nor_70_nl;
  wire[0:0] mux_428_nl;
  wire[0:0] mux_427_nl;
  wire[0:0] mux_426_nl;
  wire[0:0] and_300_nl;
  wire[0:0] mux_425_nl;
  wire[0:0] nor_71_nl;
  wire[0:0] mux_424_nl;
  wire[0:0] or_487_nl;
  wire[0:0] nor_72_nl;
  wire[0:0] mux_418_nl;
  wire[0:0] mux_417_nl;
  wire[0:0] or_478_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_5_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_10_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_19_nl;
  wire[0:0] mux_460_nl;
  wire[0:0] mux_459_nl;
  wire[0:0] mux_458_nl;
  wire[0:0] mux_457_nl;
  wire[0:0] mux_456_nl;
  wire[0:0] or_523_nl;
  wire[0:0] mux_455_nl;
  wire[0:0] or_522_nl;
  wire[0:0] mux_454_nl;
  wire[0:0] mux_453_nl;
  wire[0:0] or_521_nl;
  wire[0:0] mux_467_nl;
  wire[0:0] mux_466_nl;
  wire[0:0] or_531_nl;
  wire[0:0] mux_465_nl;
  wire[0:0] mux_464_nl;
  wire[0:0] or_530_nl;
  wire[0:0] mux_463_nl;
  wire[0:0] or_528_nl;
  wire[0:0] and_184_nl;
  wire[0:0] mux_497_nl;
  wire[0:0] mux_496_nl;
  wire[0:0] mux_495_nl;
  wire[0:0] mux_494_nl;
  wire[0:0] nand_27_nl;
  wire[0:0] mux_493_nl;
  wire[0:0] mux_492_nl;
  wire[0:0] mux_491_nl;
  wire[0:0] mux_490_nl;
  wire[0:0] mux_489_nl;
  wire[0:0] mux_487_nl;
  wire[0:0] nor_66_nl;
  wire[0:0] mux_486_nl;
  wire[0:0] nor_67_nl;
  wire[0:0] nor_68_nl;
  wire[0:0] mux_484_nl;
  wire[0:0] mux_483_nl;
  wire[0:0] mux_482_nl;
  wire[0:0] mux_480_nl;
  wire[0:0] mux_476_nl;
  wire[0:0] mux_475_nl;
  wire[0:0] mux_473_nl;
  wire[0:0] nor_65_nl;
  wire[0:0] mux_532_nl;
  wire[0:0] mux_531_nl;
  wire[0:0] mux_530_nl;
  wire[0:0] mux_529_nl;
  wire[0:0] mux_528_nl;
  wire[0:0] mux_527_nl;
  wire[0:0] mux_526_nl;
  wire[0:0] mux_525_nl;
  wire[0:0] mux_524_nl;
  wire[0:0] mux_523_nl;
  wire[0:0] mux_522_nl;
  wire[0:0] mux_518_nl;
  wire[0:0] mux_516_nl;
  wire[0:0] or_581_nl;
  wire[0:0] mux_542_nl;
  wire[0:0] mux_547_nl;
  wire[0:0] mux_546_nl;
  wire[0:0] or_724_nl;
  wire[0:0] mux_544_nl;
  wire[0:0] mux_552_nl;
  wire[0:0] mux_551_nl;
  wire[0:0] nor_63_nl;
  wire[0:0] mux_550_nl;
  wire[0:0] or_589_nl;
  wire[0:0] COMP_LOOP_k_not_nl;
  wire[0:0] mux_716_nl;
  wire[0:0] mux_715_nl;
  wire[0:0] mux_nl;
  wire[0:0] nor_nl;
  wire[0:0] and_nl;
  wire[0:0] and_1246_nl;
  wire[0:0] or_747_nl;
  wire[0:0] mux_559_nl;
  wire[0:0] or_722_nl;
  wire[0:0] nand_43_nl;
  wire[9:0] COMP_LOOP_17_twiddle_f_mul_nl;
  wire[19:0] nl_COMP_LOOP_17_twiddle_f_mul_nl;
  wire[0:0] mux_561_nl;
  wire[0:0] nor_121_nl;
  wire[0:0] or_731_nl;
  wire[0:0] mux_560_nl;
  wire[0:0] nor_61_nl;
  wire[8:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl;
  wire[8:0] COMP_LOOP_1_twiddle_f_mul_nl;
  wire[17:0] nl_COMP_LOOP_1_twiddle_f_mul_nl;
  wire[0:0] and_233_nl;
  wire[0:0] mux_562_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_6_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_7_nl;
  wire[0:0] mux_727_nl;
  wire[0:0] mux_726_nl;
  wire[0:0] or_763_nl;
  wire[0:0] mux_725_nl;
  wire[0:0] or_762_nl;
  wire[0:0] mux_724_nl;
  wire[0:0] or_nl;
  wire[0:0] mux_723_nl;
  wire[0:0] mux_722_nl;
  wire[0:0] mux_721_nl;
  wire[0:0] or_758_nl;
  wire[0:0] mux_720_nl;
  wire[0:0] or_754_nl;
  wire[0:0] or_752_nl;
  wire[0:0] mux_718_nl;
  wire[0:0] or_802_nl;
  wire[0:0] nand_72_nl;
  wire[0:0] mux_739_nl;
  wire[0:0] mux_738_nl;
  wire[0:0] or_774_nl;
  wire[0:0] mux_737_nl;
  wire[0:0] or_773_nl;
  wire[0:0] mux_736_nl;
  wire[0:0] or_772_nl;
  wire[0:0] or_771_nl;
  wire[0:0] mux_735_nl;
  wire[0:0] mux_734_nl;
  wire[0:0] mux_733_nl;
  wire[0:0] nand_67_nl;
  wire[0:0] mux_732_nl;
  wire[0:0] and_1244_nl;
  wire[0:0] nor_206_nl;
  wire[0:0] or_769_nl;
  wire[0:0] mux_731_nl;
  wire[0:0] mux_730_nl;
  wire[0:0] mux_729_nl;
  wire[0:0] or_766_nl;
  wire[0:0] nand_66_nl;
  wire[0:0] mux_584_nl;
  wire[0:0] mux_583_nl;
  wire[0:0] nor_56_nl;
  wire[0:0] or_617_nl;
  wire[0:0] mux_582_nl;
  wire[0:0] or_616_nl;
  wire[0:0] mux_603_nl;
  wire[0:0] mux_602_nl;
  wire[0:0] mux_601_nl;
  wire[0:0] mux_600_nl;
  wire[0:0] mux_599_nl;
  wire[0:0] nand_57_nl;
  wire[0:0] mux_598_nl;
  wire[0:0] mux_597_nl;
  wire[0:0] mux_596_nl;
  wire[0:0] nand_58_nl;
  wire[0:0] mux_595_nl;
  wire[0:0] nand_59_nl;
  wire[0:0] mux_592_nl;
  wire[0:0] or_634_nl;
  wire[0:0] mux_591_nl;
  wire[0:0] or_633_nl;
  wire[0:0] mux_590_nl;
  wire[0:0] or_632_nl;
  wire[0:0] mux_589_nl;
  wire[0:0] or_631_nl;
  wire[0:0] mux_588_nl;
  wire[0:0] or_629_nl;
  wire[0:0] nor_53_nl;
  wire[0:0] mux_586_nl;
  wire[0:0] or_624_nl;
  wire[0:0] mux_585_nl;
  wire[0:0] nor_54_nl;
  wire[0:0] and_294_nl;
  wire[0:0] or_620_nl;
  wire[13:0] VEC_LOOP_mux_13_nl;
  wire[13:0] VEC_LOOP_acc_nl;
  wire[14:0] nl_VEC_LOOP_acc_nl;
  wire[3:0] VEC_LOOP_or_74_nl;
  wire[3:0] VEC_LOOP_nor_19_nl;
  wire[3:0] VEC_LOOP_mux1h_48_nl;
  wire[0:0] and_1248_nl;
  wire[0:0] and_1249_nl;
  wire[0:0] and_1250_nl;
  wire[0:0] and_1251_nl;
  wire[0:0] and_1252_nl;
  wire[0:0] and_1253_nl;
  wire[0:0] and_1254_nl;
  wire[0:0] and_1255_nl;
  wire[0:0] and_1256_nl;
  wire[0:0] and_1257_nl;
  wire[0:0] and_1258_nl;
  wire[0:0] and_1259_nl;
  wire[0:0] and_1260_nl;
  wire[0:0] and_1261_nl;
  wire[0:0] and_1262_nl;
  wire[0:0] and_1263_nl;
  wire[0:0] VEC_LOOP_or_nl;
  wire[0:0] mux_631_nl;
  wire[0:0] mux_630_nl;
  wire[0:0] mux_629_nl;
  wire[0:0] mux_628_nl;
  wire[0:0] mux_627_nl;
  wire[0:0] or_665_nl;
  wire[0:0] mux_626_nl;
  wire[0:0] or_663_nl;
  wire[0:0] mux_625_nl;
  wire[0:0] mux_624_nl;
  wire[0:0] or_662_nl;
  wire[0:0] mux_675_nl;
  wire[0:0] mux_674_nl;
  wire[0:0] mux_670_nl;
  wire[0:0] mux_669_nl;
  wire[0:0] mux_668_nl;
  wire[0:0] mux_667_nl;
  wire[0:0] mux_678_nl;
  wire[0:0] nor_119_nl;
  wire[0:0] mux_677_nl;
  wire[0:0] and_290_nl;
  wire[0:0] and_320_nl;
  wire[0:0] mux_676_nl;
  wire[0:0] or_608_nl;
  wire[0:0] mux_681_nl;
  wire[0:0] nor_51_nl;
  wire[0:0] mux_680_nl;
  wire[0:0] and_278_nl;
  wire[0:0] mux_679_nl;
  wire[0:0] or_43_nl;
  wire[10:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl;
  wire[10:0] mul_1_nl;
  wire[21:0] nl_mul_1_nl;
  wire[0:0] and_1247_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_3_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_4_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_5_nl;
  wire[0:0] and_283_nl;
  wire[0:0] mux_694_nl;
  wire[0:0] mux_693_nl;
  wire[0:0] nor_209_nl;
  wire[0:0] nor_210_nl;
  wire[0:0] mux_692_nl;
  wire[0:0] mux_691_nl;
  wire[0:0] mux_751_nl;
  wire[0:0] mux_750_nl;
  wire[0:0] mux_749_nl;
  wire[0:0] and_1243_nl;
  wire[0:0] mux_748_nl;
  wire[0:0] or_789_nl;
  wire[0:0] mux_747_nl;
  wire[0:0] mux_746_nl;
  wire[0:0] nor_200_nl;
  wire[0:0] mux_745_nl;
  wire[0:0] mux_744_nl;
  wire[0:0] or_784_nl;
  wire[0:0] mux_743_nl;
  wire[0:0] mux_742_nl;
  wire[0:0] nor_202_nl;
  wire[0:0] nor_203_nl;
  wire[0:0] mux_741_nl;
  wire[0:0] mux_740_nl;
  wire[0:0] and_1239_nl;
  wire[0:0] nor_204_nl;
  wire[0:0] nor_205_nl;
  wire[0:0] mux_760_nl;
  wire[0:0] and_1242_nl;
  wire[0:0] mux_759_nl;
  wire[0:0] mux_758_nl;
  wire[0:0] mux_757_nl;
  wire[0:0] or_801_nl;
  wire[0:0] or_798_nl;
  wire[0:0] mux_756_nl;
  wire[0:0] or_797_nl;
  wire[0:0] mux_755_nl;
  wire[0:0] nor_199_nl;
  wire[0:0] mux_753_nl;
  wire[0:0] or_794_nl;
  wire[0:0] or_791_nl;
  wire[0:0] mux_215_nl;
  wire[0:0] mux_214_nl;
  wire[0:0] or_273_nl;
  wire[0:0] mux_217_nl;
  wire[0:0] or_279_nl;
  wire[0:0] mux_223_nl;
  wire[0:0] mux_220_nl;
  wire[0:0] or_297_nl;
  wire[0:0] or_293_nl;
  wire[0:0] mux_256_nl;
  wire[0:0] mux_255_nl;
  wire[0:0] mux_254_nl;
  wire[0:0] mux_253_nl;
  wire[0:0] mux_252_nl;
  wire[0:0] mux_251_nl;
  wire[0:0] mux_250_nl;
  wire[0:0] mux_248_nl;
  wire[0:0] or_294_nl;
  wire[0:0] mux_244_nl;
  wire[0:0] or_291_nl;
  wire[0:0] or_287_nl;
  wire[0:0] mux_242_nl;
  wire[0:0] or_285_nl;
  wire[0:0] nor_92_nl;
  wire[0:0] mux_264_nl;
  wire[0:0] or_315_nl;
  wire[0:0] or_314_nl;
  wire[0:0] or_326_nl;
  wire[0:0] or_324_nl;
  wire[0:0] or_332_nl;
  wire[0:0] mux_294_nl;
  wire[0:0] mux_293_nl;
  wire[0:0] mux_292_nl;
  wire[0:0] or_339_nl;
  wire[0:0] mux_291_nl;
  wire[0:0] or_338_nl;
  wire[0:0] mux_290_nl;
  wire[0:0] or_337_nl;
  wire[0:0] or_336_nl;
  wire[0:0] mux_297_nl;
  wire[0:0] and_302_nl;
  wire[0:0] mux_296_nl;
  wire[0:0] nor_87_nl;
  wire[0:0] nor_88_nl;
  wire[0:0] nor_89_nl;
  wire[0:0] nor_90_nl;
  wire[0:0] mux_311_nl;
  wire[0:0] or_362_nl;
  wire[0:0] or_361_nl;
  wire[0:0] or_372_nl;
  wire[0:0] mux_339_nl;
  wire[0:0] mux_338_nl;
  wire[0:0] mux_337_nl;
  wire[0:0] or_390_nl;
  wire[0:0] or_415_nl;
  wire[0:0] or_432_nl;
  wire[0:0] mux_376_nl;
  wire[0:0] nand_20_nl;
  wire[0:0] or_427_nl;
  wire[0:0] mux_384_nl;
  wire[0:0] nor_76_nl;
  wire[0:0] nor_77_nl;
  wire[0:0] or_442_nl;
  wire[0:0] or_449_nl;
  wire[0:0] or_457_nl;
  wire[0:0] nand_24_nl;
  wire[0:0] or_455_nl;
  wire[0:0] or_466_nl;
  wire[0:0] or_8_nl;
  wire[0:0] nor_74_nl;
  wire[0:0] mux_422_nl;
  wire[0:0] mux_433_nl;
  wire[0:0] or_495_nl;
  wire[0:0] mux_432_nl;
  wire[0:0] or_197_nl;
  wire[0:0] or_201_nl;
  wire[0:0] or_490_nl;
  wire[0:0] or_202_nl;
  wire[0:0] or_199_nl;
  wire[0:0] mux_441_nl;
  wire[0:0] mux_440_nl;
  wire[0:0] or_502_nl;
  wire[0:0] mux_439_nl;
  wire[0:0] or_501_nl;
  wire[0:0] mux_437_nl;
  wire[0:0] or_499_nl;
  wire[0:0] mux_436_nl;
  wire[0:0] nand_25_nl;
  wire[0:0] or_507_nl;
  wire[0:0] mux_442_nl;
  wire[0:0] or_504_nl;
  wire[0:0] mux_446_nl;
  wire[0:0] mux_445_nl;
  wire[0:0] or_509_nl;
  wire[0:0] mux_444_nl;
  wire[0:0] or_508_nl;
  wire[0:0] or_503_nl;
  wire[0:0] or_511_nl;
  wire[0:0] or_516_nl;
  wire[0:0] or_514_nl;
  wire[0:0] or_517_nl;
  wire[0:0] mux_451_nl;
  wire[0:0] or_525_nl;
  wire[0:0] or_38_nl;
  wire[0:0] or_41_nl;
  wire[0:0] mux_503_nl;
  wire[0:0] or_543_nl;
  wire[0:0] or_575_nl;
  wire[0:0] mux_536_nl;
  wire[0:0] or_725_nl;
  wire[0:0] mux_554_nl;
  wire[0:0] nor_62_nl;
  wire[0:0] mux_553_nl;
  wire[0:0] or_598_nl;
  wire[0:0] or_627_nl;
  wire[0:0] or_626_nl;
  wire[0:0] or_635_nl;
  wire[0:0] nor_55_nl;
  wire[0:0] mux_608_nl;
  wire[0:0] mux_607_nl;
  wire[0:0] or_645_nl;
  wire[0:0] or_641_nl;
  wire[0:0] mux_616_nl;
  wire[0:0] or_653_nl;
  wire[0:0] mux_615_nl;
  wire[0:0] mux_614_nl;
  wire[0:0] mux_613_nl;
  wire[0:0] or_651_nl;
  wire[0:0] mux_612_nl;
  wire[0:0] nand_40_nl;
  wire[0:0] mux_619_nl;
  wire[0:0] or_718_nl;
  wire[0:0] mux_622_nl;
  wire[0:0] mux_663_nl;
  wire[0:0] mux_662_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[8:0] VEC_LOOP_mux1h_5_nl;
  wire[0:0] and_142_nl;
  wire[0:0] and_143_nl;
  wire[0:0] mux_360_nl;
  wire[0:0] mux_359_nl;
  wire[0:0] mux_358_nl;
  wire[0:0] mux_356_nl;
  wire[0:0] or_409_nl;
  wire[0:0] mux_355_nl;
  wire[0:0] mux_354_nl;
  wire[0:0] VEC_LOOP_mux1h_3_nl;
  wire[0:0] mux_334_nl;
  wire[0:0] nor_79_nl;
  wire[0:0] mux_333_nl;
  wire[0:0] mux_332_nl;
  wire[0:0] and_301_nl;
  wire[0:0] mux_331_nl;
  wire[0:0] nor_80_nl;
  wire[0:0] mux_330_nl;
  wire[0:0] nor_82_nl;
  wire[0:0] nor_83_nl;
  wire[0:0] mux_327_nl;
  wire[0:0] nor_84_nl;
  wire[0:0] mux_326_nl;
  wire[0:0] nor_85_nl;
  wire[0:0] nor_86_nl;
  wire[0:0] VEC_LOOP_mux1h_1_nl;
  wire[0:0] mux_309_nl;
  wire[0:0] or_728_nl;
  wire[0:0] mux_308_nl;
  wire[0:0] mux_307_nl;
  wire[0:0] mux_306_nl;
  wire[0:0] or_357_nl;
  wire[0:0] or_356_nl;
  wire[0:0] mux_305_nl;
  wire[0:0] nand_15_nl;
  wire[0:0] mux_302_nl;
  wire[0:0] mux_301_nl;
  wire[0:0] nand_14_nl;
  wire[0:0] or_349_nl;
  wire[0:0] VEC_LOOP_mux1h_nl;
  wire[0:0] mux_288_nl;
  wire[0:0] or_729_nl;
  wire[0:0] mux_287_nl;
  wire[0:0] mux_286_nl;
  wire[0:0] nand_11_nl;
  wire[0:0] mux_285_nl;
  wire[0:0] mux_284_nl;
  wire[0:0] or_333_nl;
  wire[0:0] mux_282_nl;
  wire[0:0] or_331_nl;
  wire[0:0] mux_280_nl;
  wire[0:0] or_327_nl;
  wire[0:0] mux_278_nl;
  wire[0:0] or_322_nl;
  wire[0:0] or_320_nl;
  wire[0:0] VEC_LOOP_mux1h_2_nl;
  wire[0:0] mux_323_nl;
  wire[0:0] nand_18_nl;
  wire[0:0] mux_322_nl;
  wire[0:0] mux_321_nl;
  wire[0:0] mux_320_nl;
  wire[0:0] mux_318_nl;
  wire[0:0] or_370_nl;
  wire[0:0] mux_316_nl;
  wire[0:0] mux_315_nl;
  wire[0:0] mux_314_nl;
  wire[0:0] or_367_nl;
  wire[0:0] mux_313_nl;
  wire[0:0] VEC_LOOP_mux1h_4_nl;
  wire[0:0] mux_350_nl;
  wire[0:0] mux_349_nl;
  wire[0:0] or_401_nl;
  wire[0:0] mux_348_nl;
  wire[0:0] mux_347_nl;
  wire[0:0] mux_346_nl;
  wire[0:0] or_400_nl;
  wire[0:0] mux_345_nl;
  wire[0:0] or_398_nl;
  wire[0:0] mux_344_nl;
  wire[0:0] mux_342_nl;
  wire[0:0] mux_341_nl;
  wire[0:0] or_397_nl;
  wire[8:0] COMP_LOOP_twiddle_f_mux1h_nl;
  wire[0:0] and_153_nl;
  wire[0:0] and_155_nl;
  wire[0:0] mux_416_nl;
  wire[0:0] mux_415_nl;
  wire[0:0] mux_414_nl;
  wire[0:0] mux_412_nl;
  wire[0:0] or_465_nl;
  wire[0:0] VEC_LOOP_mux1h_9_nl;
  wire[0:0] mux_407_nl;
  wire[0:0] or_463_nl;
  wire[0:0] mux_406_nl;
  wire[0:0] mux_405_nl;
  wire[0:0] or_462_nl;
  wire[0:0] mux_404_nl;
  wire[0:0] or_461_nl;
  wire[0:0] mux_403_nl;
  wire[0:0] or_460_nl;
  wire[0:0] mux_402_nl;
  wire[0:0] nor_75_nl;
  wire[0:0] VEC_LOOP_mux1h_7_nl;
  wire[0:0] mux_383_nl;
  wire[0:0] mux_382_nl;
  wire[0:0] or_732_nl;
  wire[0:0] mux_381_nl;
  wire[0:0] or_437_nl;
  wire[0:0] mux_380_nl;
  wire[0:0] or_436_nl;
  wire[0:0] nand_21_nl;
  wire[0:0] VEC_LOOP_mux1h_6_nl;
  wire[0:0] mux_373_nl;
  wire[0:0] or_426_nl;
  wire[0:0] mux_372_nl;
  wire[0:0] mux_371_nl;
  wire[0:0] or_425_nl;
  wire[0:0] mux_370_nl;
  wire[0:0] mux_369_nl;
  wire[0:0] mux_368_nl;
  wire[0:0] or_422_nl;
  wire[0:0] mux_367_nl;
  wire[0:0] mux_366_nl;
  wire[0:0] mux_365_nl;
  wire[0:0] mux_363_nl;
  wire[0:0] VEC_LOOP_mux1h_8_nl;
  wire[0:0] mux_398_nl;
  wire[0:0] or_454_nl;
  wire[0:0] mux_397_nl;
  wire[0:0] mux_396_nl;
  wire[0:0] or_453_nl;
  wire[0:0] mux_395_nl;
  wire[0:0] mux_394_nl;
  wire[0:0] mux_393_nl;
  wire[0:0] mux_390_nl;
  wire[0:0] mux_389_nl;
  wire[0:0] or_447_nl;
  wire[0:0] mux_387_nl;
  wire[0:0] mux_386_nl;
  wire[0:0] or_443_nl;
  wire[0:0] VEC_LOOP_mux_4_nl;
  wire[0:0] or_735_nl;
  wire[0:0] mux_701_nl;
  wire[0:0] mux_700_nl;
  wire[0:0] nor_208_nl;
  wire[0:0] or_765_nl;
  wire[0:0] or_792_nl;
  wire[0:0] or_796_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux_11_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_18_nl;
  wire[0:0] COMP_LOOP_twiddle_f_mux1h_126_nl;
  wire[11:0] COMP_LOOP_twiddle_f_mux1h_127_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_19_nl;
  wire[0:0] COMP_LOOP_twiddle_f_and_20_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl;
  wire[6:0] COMP_LOOP_twiddle_f_mux1h_128_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_25_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_26_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl;
  wire[0:0] COMP_LOOP_twiddle_f_or_27_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl;
  wire[0:0] COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl;
  wire[4:0] VEC_LOOP_or_75_nl;
  wire[4:0] VEC_LOOP_mux1h_49_nl;
  wire[0:0] and_1264_nl;
  wire[0:0] and_1265_nl;
  wire[0:0] and_1266_nl;
  wire[0:0] and_1267_nl;
  wire[0:0] and_1268_nl;
  wire[0:0] and_1269_nl;
  wire[0:0] and_1270_nl;
  wire[0:0] and_1271_nl;
  wire[0:0] and_1272_nl;
  wire[0:0] and_1273_nl;
  wire[0:0] and_1274_nl;
  wire[0:0] and_1275_nl;
  wire[0:0] and_1276_nl;
  wire[0:0] and_1277_nl;
  wire[0:0] and_1278_nl;
  wire[0:0] and_1279_nl;
  wire[0:0] and_1280_nl;
  wire[0:0] and_1281_nl;
  wire[0:0] and_1282_nl;
  wire[0:0] and_1283_nl;
  wire[0:0] and_1284_nl;
  wire[0:0] and_1285_nl;
  wire[0:0] and_1286_nl;
  wire[0:0] and_1287_nl;
  wire[0:0] and_1288_nl;
  wire[0:0] and_1289_nl;
  wire[0:0] and_1290_nl;
  wire[0:0] and_1291_nl;
  wire[0:0] and_1292_nl;
  wire[0:0] and_1293_nl;
  wire[8:0] VEC_LOOP_mux_16_nl;
  wire[0:0] VEC_LOOP_mux_17_nl;
  wire[11:0] acc_22_nl;
  wire[12:0] nl_acc_22_nl;
  wire[10:0] VEC_LOOP_VEC_LOOP_mux_7_nl;
  wire[0:0] VEC_LOOP_or_76_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_8_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_14_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_15_nl;
  wire[13:0] acc_23_nl;
  wire[14:0] nl_acc_23_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_16_nl;
  wire[0:0] VEC_LOOP_or_77_nl;
  wire[0:0] VEC_LOOP_mux1h_50_nl;
  wire[10:0] VEC_LOOP_mux1h_51_nl;
  wire[0:0] VEC_LOOP_or_78_nl;
  wire[0:0] VEC_LOOP_and_17_nl;
  wire[0:0] VEC_LOOP_and_18_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_9_nl;
  wire[6:0] VEC_LOOP_mux1h_52_nl;
  wire[0:0] VEC_LOOP_or_79_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_mux_10_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_17_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_18_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_19_nl;
  wire[3:0] STAGE_LOOP_mux_3_nl;
  wire[0:0] and_1294_nl;
  wire[15:0] acc_25_nl;
  wire[16:0] nl_acc_25_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_20_nl;
  wire[13:0] VEC_LOOP_VEC_LOOP_mux_11_nl;
  wire[0:0] VEC_LOOP_or_80_nl;
  wire[0:0] mux_761_nl;
  wire[0:0] mux_762_nl;
  wire[0:0] mux_763_nl;
  wire[0:0] mux_764_nl;
  wire[0:0] mux_765_nl;
  wire[0:0] mux_766_nl;
  wire[0:0] or_803_nl;
  wire[0:0] mux_767_nl;
  wire[0:0] mux_768_nl;
  wire[0:0] or_804_nl;
  wire[0:0] mux_769_nl;
  wire[0:0] mux_770_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_12_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_21_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_22_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_23_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_24_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_25_nl;
  wire[15:0] acc_26_nl;
  wire[16:0] nl_acc_26_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_26_nl;
  wire[13:0] VEC_LOOP_mux1h_53_nl;
  wire[0:0] VEC_LOOP_or_81_nl;
  wire[8:0] VEC_LOOP_mux1h_54_nl;
  wire[3:0] VEC_LOOP_and_26_nl;
  wire[3:0] VEC_LOOP_mux1h_55_nl;
  wire[0:0] VEC_LOOP_or_82_nl;
  wire[0:0] not_1368_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_or_27_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_2_nl;
  wire[8:0] VEC_LOOP_VEC_LOOP_mux_13_nl;
  wire[9:0] VEC_LOOP_mux1h_56_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat = COMP_LOOP_twiddle_f_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1;
  assign nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1 = COMP_LOOP_twiddle_help_1_sva;
  wire [31:0] nl_COMP_LOOP_1_mult_cmp_p_rsc_dat;
  assign nl_COMP_LOOP_1_mult_cmp_p_rsc_dat = p_sva;
  wire[0:0] mux_512_nl;
  wire[0:0] mux_511_nl;
  wire[0:0] or_555_nl;
  wire[0:0] mux_510_nl;
  wire[0:0] mux_509_nl;
  wire[0:0] mux_507_nl;
  wire[0:0] or_553_nl;
  wire[0:0] mux_506_nl;
  wire [0:0] nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat;
  assign mux_509_nl = MUX_s_1_2_2((~ mux_508_cse), mux_245_cse, fsm_output[7]);
  assign mux_510_nl = MUX_s_1_2_2(mux_509_nl, or_471_cse, fsm_output[6]);
  assign or_555_nl = (fsm_output[8]) | mux_510_nl;
  assign mux_511_nl = MUX_s_1_2_2(mux_tmp_504, or_555_nl, fsm_output[3]);
  assign mux_506_nl = MUX_s_1_2_2(mux_tmp_502, mux_413_cse, fsm_output[6]);
  assign or_553_nl = (fsm_output[8]) | mux_506_nl;
  assign mux_507_nl = MUX_s_1_2_2(or_553_nl, mux_tmp_504, fsm_output[3]);
  assign mux_512_nl = MUX_s_1_2_2(mux_511_nl, mux_507_nl, fsm_output[0]);
  assign nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat = ~ mux_512_nl;
  wire[32:0] acc_3_nl;
  wire[33:0] nl_acc_3_nl;
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat;
  assign nl_acc_3_nl = ({vec_rsci_q_d_mxwt , 1'b1}) + ({(~ factor2_1_sva) , 1'b1});
  assign acc_3_nl = nl_acc_3_nl[32:0];
  assign nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat = readslicef_33_32_1(acc_3_nl);
  wire [31:0] nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat = ~ mux_548_itm;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat = vec_rsci_q_d_mxwt + factor2_1_sva;
  wire [31:0] nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat;
  assign nl_COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat = ~ mux_548_itm;
  wire[0:0] and_332_nl;
  wire [3:0] nl_COMP_LOOP_17_twiddle_f_lshift_rg_s;
  assign and_332_nl = (fsm_output==9'b000000010);
  assign nl_COMP_LOOP_17_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva,
      z_out_28, and_332_nl);
  wire[0:0] COMP_LOOP_twiddle_f_or_nl;
  wire [3:0] nl_COMP_LOOP_1_twiddle_f_lshift_rg_s;
  assign COMP_LOOP_twiddle_f_or_nl = ((fsm_output[4:0]==5'b10101) & and_335_cse)
      | ((fsm_output[4:0]==5'b11110) & and_335_cse);
  assign nl_COMP_LOOP_1_twiddle_f_lshift_rg_s = MUX_v_4_2_2(z_out_28, COMP_LOOP_1_twiddle_f_acc_cse_sva,
      COMP_LOOP_twiddle_f_or_nl);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1;
  assign nl_inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1 = ~ mux_533_itm;
  wire[0:0] mux_241_nl;
  wire[0:0] mux_240_nl;
  wire[0:0] mux_239_nl;
  wire[0:0] mux_238_nl;
  wire[0:0] mux_237_nl;
  wire[0:0] mux_236_nl;
  wire[0:0] mux_234_nl;
  wire[0:0] mux_233_nl;
  wire[0:0] mux_232_nl;
  wire[0:0] mux_231_nl;
  wire[0:0] nand_8_nl;
  wire[0:0] mux_230_nl;
  wire[0:0] mux_229_nl;
  wire[0:0] mux_227_nl;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff;
  assign mux_237_nl = MUX_s_1_2_2(mux_tmp_225, mux_tmp_218, fsm_output[2]);
  assign mux_238_nl = MUX_s_1_2_2(mux_tmp_235, mux_237_nl, fsm_output[3]);
  assign mux_236_nl = MUX_s_1_2_2(mux_tmp_222, mux_tmp_235, fsm_output[3]);
  assign mux_239_nl = MUX_s_1_2_2(mux_238_nl, mux_236_nl, fsm_output[0]);
  assign mux_240_nl = MUX_s_1_2_2(mux_tmp_224, mux_239_nl, fsm_output[4]);
  assign nand_8_nl = ~((fsm_output[5]) & (~ mux_tmp_228));
  assign mux_231_nl = MUX_s_1_2_2(nand_8_nl, mux_tmp_225, fsm_output[2]);
  assign mux_232_nl = MUX_s_1_2_2(mux_231_nl, mux_tmp_219, fsm_output[3]);
  assign mux_229_nl = MUX_s_1_2_2(nand_tmp_7, or_tmp_126, fsm_output[2]);
  assign mux_227_nl = MUX_s_1_2_2(mux_tmp_226, mux_tmp_225, fsm_output[2]);
  assign mux_230_nl = MUX_s_1_2_2(mux_229_nl, mux_227_nl, fsm_output[3]);
  assign mux_233_nl = MUX_s_1_2_2(mux_232_nl, mux_230_nl, fsm_output[0]);
  assign mux_234_nl = MUX_s_1_2_2(mux_233_nl, mux_tmp_224, fsm_output[4]);
  assign mux_241_nl = MUX_s_1_2_2(mux_240_nl, mux_234_nl, fsm_output[1]);
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff = ~ mux_241_nl;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff = ~ mux_276_itm;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ run_ac_sync_tmp_dobj_sva;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0 = ~ (z_out_27[12]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0 = ~ (z_out_27[11]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0 = ~ (z_out_27[12]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0 = ~ (z_out_26[10]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0 = ~ (z_out_30[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0 = ~ (z_out_27[12]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0 = ~ (z_out_27[11]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0 = ~ (z_out_27[12]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0 = ~ (z_out_29[14]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0 = ~ (z_out_30[9]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0
      = VEC_LOOP_j_14_0_1_sva_1[14];
  wire[14:0] COMP_LOOP_1_acc_nl;
  wire[15:0] nl_COMP_LOOP_1_acc_nl;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0;
  assign nl_COMP_LOOP_1_acc_nl = ({z_out_31 , 5'b00000}) + ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[14:1]))})
      + 15'b000000000000001;
  assign COMP_LOOP_1_acc_nl = nl_COMP_LOOP_1_acc_nl[14:0];
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0 = ~ (readslicef_15_1_14(COMP_LOOP_1_acc_nl));
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd14),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mult  COMP_LOOP_1_mult_cmp (
      .x_rsc_dat(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z),
      .y_rsc_dat(nl_COMP_LOOP_1_mult_cmp_y_rsc_dat[31:0]),
      .y_rsc_dat_1(nl_COMP_LOOP_1_mult_cmp_y_rsc_dat_1[31:0]),
      .p_rsc_dat(nl_COMP_LOOP_1_mult_cmp_p_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_mult_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_mult_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en)
    );
  modulo_sub  COMP_LOOP_1_modulo_sub_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  COMP_LOOP_1_modulo_add_cmp (
      .base_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(COMP_LOOP_1_modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_COMP_LOOP_1_modulo_add_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd14)) COMP_LOOP_2_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva),
      .z(COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd13)) COMP_LOOP_3_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(COMP_LOOP_1_twiddle_f_acc_cse_sva),
      .z(COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd15)) COMP_LOOP_17_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_17_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd12)) COMP_LOOP_1_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_1_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out_1)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci inPlaceNTT_DIF_precomp_core_run_rsci_inst
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
  inPlaceNTT_DIF_precomp_core_wait_dp inPlaceNTT_DIF_precomp_core_wait_dp_inst (
      .ensig_cgo_iro(mux_498_rmff),
      .ensig_cgo_iro_1(nl_inPlaceNTT_DIF_precomp_core_wait_dp_inst_ensig_cgo_iro_1[0:0]),
      .core_wen(complete_rsci_wen_comp),
      .ensig_cgo(reg_ensig_cgo_cse),
      .COMP_LOOP_1_mult_cmp_ccs_ccore_en(COMP_LOOP_1_mult_cmp_ccs_ccore_en),
      .ensig_cgo_1(reg_ensig_cgo_1_cse),
      .COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en(COMP_LOOP_1_modulo_sub_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsci_1 inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsci_q_d(vec_rsci_q_d),
      .vec_rsci_readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsci_oswt_1(reg_vec_rsci_oswt_1_cse),
      .vec_rsci_q_d_mxwt(vec_rsci_q_d_mxwt),
      .vec_rsci_we_d_pff(vec_rsci_we_d_iff),
      .vec_rsci_iswt0_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_iswt0_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsci_oswt_1_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsci_1_inst_vec_rsci_oswt_1_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_rsci_q_d_mxwt(twiddle_rsci_q_d_mxwt),
      .twiddle_rsci_oswt_pff(mux_431_rmff),
      .core_wten_pff(core_wten_iff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsci_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsci_q_d(twiddle_h_rsci_q_d),
      .twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsci_oswt(reg_twiddle_rsci_oswt_cse),
      .twiddle_h_rsci_q_d_mxwt(twiddle_h_rsci_q_d_mxwt),
      .twiddle_h_rsci_oswt_pff(mux_431_rmff),
      .core_wten_pff(core_wten_iff)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci inPlaceNTT_DIF_precomp_core_complete_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsc_rdy(complete_rsc_rdy),
      .complete_rsc_vld(complete_rsc_vld),
      .core_wen(complete_rsci_wen_comp),
      .complete_rsci_oswt(reg_complete_rsci_oswt_cse),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_obj_inst
      (
      .vec_rsc_triosy_lz(vec_rsc_triosy_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_obj_inst
      (
      .twiddle_rsc_triosy_lz(twiddle_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_obj_inst
      (
      .twiddle_h_rsc_triosy_lz(twiddle_h_rsc_triosy_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_staller inPlaceNTT_DIF_precomp_core_staller_inst (
      .clk(clk),
      .rst(rst),
      .core_wten(core_wten),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .core_wten_pff(core_wten_iff)
    );
  inPlaceNTT_DIF_precomp_core_core_fsm inPlaceNTT_DIF_precomp_core_core_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsci_wen_comp(complete_rsci_wen_comp),
      .fsm_output(fsm_output),
      .main_C_0_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0[0:0]),
      .COMP_LOOP_1_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_1_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_3_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_3_tr0[0:0]),
      .COMP_LOOP_2_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_2_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_4_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_4_tr0[0:0]),
      .COMP_LOOP_3_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_3_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_5_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_5_tr0[0:0]),
      .COMP_LOOP_4_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_4_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_6_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_6_tr0[0:0]),
      .COMP_LOOP_5_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_5_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_6_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_6_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_8_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_8_tr0[0:0]),
      .COMP_LOOP_7_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_7_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_9_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_9_tr0[0:0]),
      .COMP_LOOP_8_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_8_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_10_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_10_tr0[0:0]),
      .COMP_LOOP_9_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_9_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_11_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_11_tr0[0:0]),
      .COMP_LOOP_10_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_10_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_12_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_12_tr0[0:0]),
      .COMP_LOOP_11_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_11_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_13_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_13_tr0[0:0]),
      .COMP_LOOP_12_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_12_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_14_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_14_tr0[0:0]),
      .COMP_LOOP_13_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_13_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_15_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_15_tr0[0:0]),
      .COMP_LOOP_14_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_14_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_16_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_16_tr0[0:0]),
      .COMP_LOOP_15_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_15_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_17_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_17_tr0[0:0]),
      .COMP_LOOP_16_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_16_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_18_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_18_tr0[0:0]),
      .COMP_LOOP_17_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_17_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_19_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_19_tr0[0:0]),
      .COMP_LOOP_18_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_18_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_20_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_20_tr0[0:0]),
      .COMP_LOOP_19_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_19_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_21_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_21_tr0[0:0]),
      .COMP_LOOP_20_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_20_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_22_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_22_tr0[0:0]),
      .COMP_LOOP_21_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_21_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_23_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_23_tr0[0:0]),
      .COMP_LOOP_22_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_22_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_24_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_24_tr0[0:0]),
      .COMP_LOOP_23_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_23_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_25_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_25_tr0[0:0]),
      .COMP_LOOP_24_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_24_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_26_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_26_tr0[0:0]),
      .COMP_LOOP_25_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_25_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_27_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_27_tr0[0:0]),
      .COMP_LOOP_26_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_26_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_28_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_28_tr0[0:0]),
      .COMP_LOOP_27_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_27_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_29_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_29_tr0[0:0]),
      .COMP_LOOP_28_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_28_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_30_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_30_tr0[0:0]),
      .COMP_LOOP_29_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_29_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_31_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_31_tr0[0:0]),
      .COMP_LOOP_30_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_30_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_32_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_32_tr0[0:0]),
      .COMP_LOOP_31_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_31_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_33_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_33_tr0[0:0]),
      .COMP_LOOP_32_VEC_LOOP_C_7_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_32_VEC_LOOP_C_7_tr0[0:0]),
      .COMP_LOOP_C_34_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_34_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign mux_273_nl = MUX_s_1_2_2(mux_tmp_267, mux_tmp_265, fsm_output[5]);
  assign mux_271_nl = MUX_s_1_2_2(or_406_cse, mux_tmp_262, or_317_cse);
  assign mux_272_nl = MUX_s_1_2_2(or_tmp_155, mux_271_nl, fsm_output[5]);
  assign mux_274_nl = MUX_s_1_2_2(mux_273_nl, mux_272_nl, fsm_output[6]);
  assign mux_268_nl = MUX_s_1_2_2(mux_tmp_262, (~ mux_tmp_263), or_317_cse);
  assign mux_269_nl = MUX_s_1_2_2(mux_268_nl, mux_tmp_267, fsm_output[5]);
  assign mux_266_nl = MUX_s_1_2_2(mux_tmp_265, or_tmp_155, fsm_output[5]);
  assign mux_270_nl = MUX_s_1_2_2(mux_269_nl, mux_266_nl, fsm_output[6]);
  assign mux_275_nl = MUX_s_1_2_2(mux_274_nl, mux_270_nl, fsm_output[2]);
  assign or_308_nl = (fsm_output[4]) | (fsm_output[7]);
  assign mux_258_nl = MUX_s_1_2_2(or_308_nl, or_tmp_151, fsm_output[1]);
  assign or_306_nl = (~ (fsm_output[1])) | (fsm_output[4]) | (fsm_output[7]);
  assign mux_259_nl = MUX_s_1_2_2(mux_258_nl, or_306_nl, or_317_cse);
  assign or_309_nl = (fsm_output[6:5]!=2'b00) | mux_259_nl;
  assign or_303_nl = (fsm_output[6:5]!=2'b00) | nor_91_cse | (fsm_output[1]) | (~
      (fsm_output[4])) | (fsm_output[7]);
  assign mux_260_nl = MUX_s_1_2_2(or_309_nl, or_303_nl, fsm_output[2]);
  assign mux_276_itm = MUX_s_1_2_2(mux_275_nl, mux_260_nl, fsm_output[8]);
  assign or_354_cse = (fsm_output[8:7]!=2'b10);
  assign mux_303_cse = MUX_s_1_2_2(or_277_cse, or_354_cse, fsm_output[4]);
  assign mux_304_cse = MUX_s_1_2_2(mux_303_cse, mux_tmp_299, fsm_output[1]);
  assign or_365_cse = (~ (fsm_output[4])) | (fsm_output[8]) | (fsm_output[7]);
  assign or_364_cse = (fsm_output[4]) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign or_380_cse = (fsm_output[8]) | (~ (fsm_output[7])) | (~ (fsm_output[1]))
      | (fsm_output[4]);
  assign nor_81_nl = ~((~ (fsm_output[1])) | (fsm_output[4]));
  assign mux_329_cse = MUX_s_1_2_2(nor_81_nl, mux_tmp_246, fsm_output[7]);
  assign or_379_nl = (fsm_output[8]) | mux_tmp_325;
  assign mux_328_cse = MUX_s_1_2_2(or_380_cse, or_379_nl, fsm_output[2]);
  assign or_406_cse = (fsm_output[7]) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign or_408_cse = (~ (fsm_output[8])) | (fsm_output[7]) | (~ (fsm_output[1]))
      | (fsm_output[4]);
  assign or_410_cse = (~ (fsm_output[2])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (~ (fsm_output[1])) | (fsm_output[4]);
  assign or_434_cse = (fsm_output[4]) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign mux_379_cse = MUX_s_1_2_2(or_434_cse, mux_303_cse, fsm_output[1]);
  assign or_474_cse = (~ (fsm_output[2])) | (fsm_output[5]) | (~ (fsm_output[1]))
      | (fsm_output[4]);
  assign or_471_cse = (~ (fsm_output[7])) | (~ (fsm_output[2])) | (fsm_output[5])
      | (~ (fsm_output[1])) | (fsm_output[4]);
  assign or_473_cse = (~ (fsm_output[2])) | (fsm_output[5]) | (~ mux_tmp_246);
  assign mux_413_cse = MUX_s_1_2_2(or_474_cse, or_473_cse, fsm_output[7]);
  assign nor_70_nl = ~((fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[4]) |
      (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[0])) | (fsm_output[3]));
  assign mux_426_nl = MUX_s_1_2_2(or_tmp_324, mux_tmp_421, fsm_output[4]);
  assign mux_427_nl = MUX_s_1_2_2(mux_426_nl, or_tmp_321, fsm_output[1]);
  assign mux_428_nl = MUX_s_1_2_2(mux_tmp_423, (~ mux_427_nl), fsm_output[2]);
  assign mux_429_nl = MUX_s_1_2_2(nor_70_nl, mux_428_nl, VEC_LOOP_j_14_0_1_sva_1[14]);
  assign or_487_nl = (fsm_output[0]) | (~ (fsm_output[3]));
  assign mux_424_nl = MUX_s_1_2_2((~ mux_tmp_419), or_487_nl, fsm_output[6]);
  assign nor_71_nl = ~((fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[7]) |
      mux_424_nl);
  assign mux_425_nl = MUX_s_1_2_2(nor_71_nl, mux_tmp_423, fsm_output[2]);
  assign and_300_nl = (VEC_LOOP_j_14_0_1_sva_1[14]) & mux_425_nl;
  assign mux_430_nl = MUX_s_1_2_2(mux_429_nl, and_300_nl, fsm_output[5]);
  assign or_478_nl = (fsm_output[7]) | (fsm_output[6]) | (~ (fsm_output[0])) | (fsm_output[3]);
  assign mux_417_nl = MUX_s_1_2_2(or_tmp_324, or_478_nl, fsm_output[4]);
  assign mux_418_nl = MUX_s_1_2_2(mux_417_nl, or_tmp_321, fsm_output[1]);
  assign nor_72_nl = ~((fsm_output[5]) | (~ (VEC_LOOP_j_14_0_1_sva_1[14])) | (fsm_output[2])
      | mux_418_nl);
  assign mux_431_rmff = MUX_s_1_2_2(mux_430_nl, nor_72_nl, fsm_output[8]);
  assign COMP_LOOP_twiddle_f_mux1h_5_nl = MUX1HOT_s_1_3_2((COMP_LOOP_twiddle_f_mul_cse_10_sva[2]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[1]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]),
      {and_dcpl_136 , and_dcpl_138 , and_dcpl_144});
  assign COMP_LOOP_twiddle_f_mux1h_5_rmff = COMP_LOOP_twiddle_f_mux1h_5_nl & (~(xor_dcpl_1
      & (~ (fsm_output[2])) & and_dcpl_118 & and_dcpl_140));
  assign COMP_LOOP_twiddle_f_mux1h_10_nl = MUX1HOT_s_1_4_2((COMP_LOOP_twiddle_f_mul_cse_10_sva[3]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[2]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]), {and_dcpl_136 , and_dcpl_138
      , and_dcpl_144 , and_dcpl_151});
  assign COMP_LOOP_twiddle_f_mux1h_10_rmff = COMP_LOOP_twiddle_f_mux1h_10_nl & (~((~
      (fsm_output[2])) & (~ (fsm_output[3])) & (~ (fsm_output[6])) & and_dcpl_118
      & and_dcpl_140));
  assign COMP_LOOP_twiddle_f_mux_nl = MUX_s_1_2_2((COMP_LOOP_twiddle_f_mul_cse_10_sva[1]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[0]), and_dcpl_138);
  assign COMP_LOOP_twiddle_f_mux1h_13_rmff = COMP_LOOP_twiddle_f_mux_nl & (~(xor_dcpl_1
      & (~((fsm_output[2]) ^ (fsm_output[5]))) & (~ (fsm_output[8])) & and_dcpl_140));
  assign COMP_LOOP_twiddle_f_mux1h_19_nl = MUX1HOT_s_1_5_2((COMP_LOOP_twiddle_f_mul_cse_10_sva[4]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[3]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[2]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]), (COMP_LOOP_17_twiddle_f_mul_psp_sva[0]),
      {and_dcpl_136 , and_dcpl_138 , and_dcpl_144 , and_dcpl_151 , and_dcpl_159});
  assign or_523_nl = (fsm_output[5]) | (~((fsm_output[8]) & mux_tmp_246));
  assign mux_456_nl = MUX_s_1_2_2(or_523_nl, or_tmp_357, fsm_output[2]);
  assign mux_457_nl = MUX_s_1_2_2(mux_456_nl, mux_tmp_450, fsm_output[7]);
  assign mux_458_nl = MUX_s_1_2_2(mux_457_nl, or_tmp_363, fsm_output[6]);
  assign mux_459_nl = MUX_s_1_2_2(mux_tmp_452, mux_458_nl, fsm_output[3]);
  assign or_521_nl = (fsm_output[5]) | (~ (fsm_output[8])) | (fsm_output[1]) | (~
      (fsm_output[4]));
  assign mux_453_nl = MUX_s_1_2_2(or_521_nl, mux_tmp_449, fsm_output[2]);
  assign mux_454_nl = MUX_s_1_2_2(mux_453_nl, mux_tmp_448, fsm_output[7]);
  assign or_522_nl = (fsm_output[6]) | mux_454_nl;
  assign mux_455_nl = MUX_s_1_2_2(or_522_nl, mux_tmp_452, fsm_output[3]);
  assign mux_460_nl = MUX_s_1_2_2(mux_459_nl, mux_455_nl, fsm_output[0]);
  assign COMP_LOOP_twiddle_f_and_rmff = COMP_LOOP_twiddle_f_mux1h_19_nl & (~ mux_460_nl);
  assign or_530_nl = (~ (fsm_output[8])) | (fsm_output[3]) | (fsm_output[6]);
  assign mux_464_nl = MUX_s_1_2_2(or_530_nl, or_529_cse, fsm_output[5]);
  assign mux_465_nl = MUX_s_1_2_2(mux_464_nl, or_tmp_371, fsm_output[2]);
  assign or_531_nl = (fsm_output[7]) | mux_465_nl;
  assign mux_466_nl = MUX_s_1_2_2(nand_tmp_26, or_531_nl, fsm_output[4]);
  assign or_528_nl = (fsm_output[7]) | mux_tmp_462;
  assign mux_463_nl = MUX_s_1_2_2(or_528_nl, nand_tmp_26, fsm_output[4]);
  assign mux_467_nl = MUX_s_1_2_2(mux_466_nl, mux_463_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux_rmff = (COMP_LOOP_twiddle_f_mul_cse_10_sva[0]) &
      (~((~ mux_467_nl) & (fsm_output[0])));
  assign and_184_nl = and_dcpl_75 & and_dcpl_20;
  assign COMP_LOOP_twiddle_f_mux1h_26_rmff = MUX1HOT_v_9_6_2(COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (COMP_LOOP_twiddle_f_mul_cse_10_sva[13:5]), ({COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9
      , (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[8:4])}), ({COMP_LOOP_13_twiddle_f_mul_psp_sva_11
      , (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:3])}), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:2]),
      (COMP_LOOP_17_twiddle_f_mul_psp_sva[9:1]), {and_184_nl , and_dcpl_136 , and_dcpl_138
      , and_dcpl_144 , and_dcpl_151 , and_dcpl_159});
  assign nand_27_nl = ~((fsm_output[4]) & (~ or_tmp_378));
  assign mux_494_nl = MUX_s_1_2_2(nand_27_nl, mux_tmp_472, fsm_output[3]);
  assign mux_492_nl = MUX_s_1_2_2(or_tmp_17, or_tmp_378, fsm_output[4]);
  assign mux_493_nl = MUX_s_1_2_2(mux_tmp_481, mux_492_nl, fsm_output[3]);
  assign mux_495_nl = MUX_s_1_2_2(mux_494_nl, mux_493_nl, fsm_output[6]);
  assign mux_490_nl = MUX_s_1_2_2(mux_tmp_488, mux_tmp_485, fsm_output[3]);
  assign mux_489_nl = MUX_s_1_2_2((~ mux_tmp_474), mux_tmp_488, fsm_output[3]);
  assign mux_491_nl = MUX_s_1_2_2(mux_490_nl, mux_489_nl, fsm_output[6]);
  assign mux_496_nl = MUX_s_1_2_2((~ mux_495_nl), mux_491_nl, fsm_output[5]);
  assign mux_486_nl = MUX_s_1_2_2(mux_tmp_485, mux_tmp_479, fsm_output[3]);
  assign nor_66_nl = ~((fsm_output[6]) | (~ mux_486_nl));
  assign nor_67_nl = ~((fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]) | (fsm_output[1])
      | (fsm_output[2]));
  assign mux_487_nl = MUX_s_1_2_2(nor_66_nl, nor_67_nl, fsm_output[5]);
  assign mux_497_nl = MUX_s_1_2_2(mux_496_nl, mux_487_nl, fsm_output[8]);
  assign mux_482_nl = MUX_s_1_2_2(mux_18_cse, mux_tmp_481, fsm_output[3]);
  assign mux_480_nl = MUX_s_1_2_2((~ mux_tmp_479), mux_18_cse, fsm_output[3]);
  assign mux_483_nl = MUX_s_1_2_2(mux_482_nl, mux_480_nl, fsm_output[6]);
  assign mux_475_nl = MUX_s_1_2_2(mux_tmp_470, mux_tmp_474, fsm_output[3]);
  assign mux_473_nl = MUX_s_1_2_2(mux_tmp_472, mux_tmp_470, fsm_output[3]);
  assign mux_476_nl = MUX_s_1_2_2(mux_475_nl, mux_473_nl, fsm_output[6]);
  assign mux_484_nl = MUX_s_1_2_2(mux_483_nl, mux_476_nl, fsm_output[5]);
  assign nor_68_nl = ~((fsm_output[8]) | mux_484_nl);
  assign mux_498_rmff = MUX_s_1_2_2(mux_497_nl, nor_68_nl, fsm_output[7]);
  assign nor_65_nl = ~((fsm_output[5]) | (~ mux_tmp_246));
  assign mux_508_cse = MUX_s_1_2_2(nor_65_nl, and_33_cse, fsm_output[2]);
  assign mux_529_nl = MUX_s_1_2_2(or_tmp_409, mux_539_cse, fsm_output[3]);
  assign mux_527_nl = MUX_s_1_2_2(or_365_cse, or_434_cse, fsm_output[1]);
  assign mux_528_nl = MUX_s_1_2_2(mux_527_nl, or_tmp_409, fsm_output[3]);
  assign mux_530_nl = MUX_s_1_2_2(mux_529_nl, mux_528_nl, fsm_output[0]);
  assign mux_531_nl = MUX_s_1_2_2(mux_530_nl, mux_tmp_515, fsm_output[5]);
  assign mux_525_nl = MUX_s_1_2_2(mux_539_cse, mux_375_cse, or_317_cse);
  assign mux_526_nl = MUX_s_1_2_2(or_tmp_401, mux_525_nl, fsm_output[5]);
  assign mux_532_nl = MUX_s_1_2_2(mux_531_nl, mux_526_nl, fsm_output[6]);
  assign mux_522_nl = MUX_s_1_2_2(mux_304_cse, mux_379_cse, or_317_cse);
  assign mux_518_nl = MUX_s_1_2_2(or_tmp_409, mux_539_cse, nor_32_cse);
  assign mux_523_nl = MUX_s_1_2_2(mux_522_nl, mux_518_nl, fsm_output[5]);
  assign mux_516_nl = MUX_s_1_2_2(mux_tmp_515, or_tmp_401, fsm_output[5]);
  assign mux_524_nl = MUX_s_1_2_2(mux_523_nl, mux_516_nl, fsm_output[6]);
  assign mux_533_itm = MUX_s_1_2_2(mux_532_nl, mux_524_nl, fsm_output[2]);
  assign mux_539_cse = MUX_s_1_2_2(mux_tmp_299, or_365_cse, fsm_output[1]);
  assign or_578_cse = (~ (fsm_output[5])) | (fsm_output[2]) | mux_539_cse;
  assign mux_542_nl = MUX_s_1_2_2(or_408_cse, mux_304_cse, fsm_output[2]);
  assign or_581_nl = (fsm_output[5]) | mux_542_nl;
  assign mux_543_cse = MUX_s_1_2_2(or_581_nl, or_578_cse, fsm_output[6]);
  assign or_724_nl = (fsm_output[5]) | (~ (fsm_output[2])) | mux_379_cse;
  assign mux_546_nl = MUX_s_1_2_2(or_724_nl, mux_tmp_537, fsm_output[6]);
  assign mux_547_nl = MUX_s_1_2_2(mux_tmp_538, mux_546_nl, fsm_output[3]);
  assign mux_544_nl = MUX_s_1_2_2(mux_543_cse, mux_tmp_538, fsm_output[3]);
  assign mux_548_itm = MUX_s_1_2_2(mux_547_nl, mux_544_nl, fsm_output[0]);
  assign or_260_cse = (fsm_output[4:3]!=2'b00);
  assign nl_COMP_LOOP_1_twiddle_f_mul_nl = (z_out_1[8:0]) * COMP_LOOP_k_14_5_sva_8_0;
  assign COMP_LOOP_1_twiddle_f_mul_nl = nl_COMP_LOOP_1_twiddle_f_mul_nl[8:0];
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl = MUX_v_9_2_2(COMP_LOOP_1_twiddle_f_mul_nl,
      (z_out_30[8:0]), and_dcpl_25);
  assign mux_562_nl = MUX_s_1_2_2((fsm_output[1]), (fsm_output[2]), fsm_output[0]);
  assign and_233_nl = mux_562_nl & and_dcpl_21 & and_dcpl_20;
  assign COMP_LOOP_twiddle_f_or_6_nl = (and_dcpl_77 & and_dcpl_20) | (and_dcpl_86
      & and_dcpl_38) | (and_dcpl_95 & and_dcpl_55) | (and_dcpl_104 & and_dcpl_66)
      | and_dcpl_159 | (and_dcpl_33 & and_dcpl_83) | (and_dcpl_52 & and_dcpl_90)
      | (and_dcpl_63 & and_dcpl_99);
  assign COMP_LOOP_twiddle_f_or_7_nl = and_dcpl_34 | and_dcpl_53 | and_dcpl_64 |
      and_dcpl_76 | and_dcpl_85 | and_dcpl_94 | and_dcpl_103 | and_dcpl_113;
  assign COMP_LOOP_twiddle_f_mux1h_40_rgt = MUX1HOT_v_13_3_2(({4'b0000 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_4_nl}),
      (z_out_2[12:0]), z_out_27, {and_233_nl , COMP_LOOP_twiddle_f_or_6_nl , COMP_LOOP_twiddle_f_or_7_nl});
  assign nor_207_cse = ~((fsm_output[1:0]!=2'b00));
  assign or_720_cse = (fsm_output[1:0]!=2'b00);
  assign and_295_cse = (fsm_output[4:3]==2'b11);
  assign COMP_LOOP_twiddle_help_and_cse = complete_rsci_wen_comp & (~ mux_617_itm);
  assign VEC_LOOP_or_13_cse = and_dcpl_25 | and_dcpl_80;
  assign or_713_cse = (fsm_output[2:0]!=3'b100);
  assign and_1247_nl = (fsm_output[4:0]==5'b01001) & and_dcpl_118 & (fsm_output[7:6]==2'b11);
  assign nl_mul_1_nl = COMP_LOOP_9_twiddle_f_lshift_ncse_sva * ({COMP_LOOP_k_14_5_sva_8_0
      , and_1247_nl , 1'b1});
  assign mul_1_nl = nl_mul_1_nl[10:0];
  assign COMP_LOOP_twiddle_f_or_3_nl = and_dcpl_60 | and_dcpl_98;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl = MUX_v_11_2_2(mul_1_nl,
      z_out_26, COMP_LOOP_twiddle_f_or_3_nl);
  assign COMP_LOOP_twiddle_f_or_4_nl = (and_dcpl_81 & and_dcpl_20) | (and_dcpl_100
      & and_dcpl_66) | (and_dcpl_24 & and_dcpl_83) | (and_dcpl_59 & and_dcpl_99);
  assign COMP_LOOP_twiddle_f_or_5_nl = and_dcpl_45 | and_dcpl_70 | and_dcpl_89 |
      and_dcpl_109;
  assign nor_209_nl = ~((fsm_output[4]) | nor_201_cse);
  assign nor_210_nl = ~((fsm_output[4]) | and_dcpl_56);
  assign mux_693_nl = MUX_s_1_2_2(nor_209_nl, nor_210_nl, fsm_output[3]);
  assign mux_691_nl = MUX_s_1_2_2(or_dcpl_153, or_713_cse, fsm_output[4]);
  assign mux_692_nl = MUX_s_1_2_2((fsm_output[4]), mux_691_nl, fsm_output[3]);
  assign mux_694_nl = MUX_s_1_2_2(mux_693_nl, mux_692_nl, fsm_output[7]);
  assign and_283_nl = mux_694_nl & and_dcpl_54 & (~ (fsm_output[8]));
  assign COMP_LOOP_twiddle_f_mux1h_65_rgt = MUX1HOT_v_12_3_2((z_out_2[11:0]), (z_out_27[11:0]),
      ({1'b0 , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_3_nl}), {COMP_LOOP_twiddle_f_or_4_nl
      , COMP_LOOP_twiddle_f_or_5_nl , and_283_nl});
  assign nor_201_cse = ~((fsm_output[2:1]!=2'b00));
  assign or_785_cse = (fsm_output[2:0]!=3'b000);
  assign or_799_cse = (fsm_output[2]) | (~ (fsm_output[6])) | (~ (fsm_output[5]))
      | (fsm_output[8]);
  assign or_317_cse = (~ (fsm_output[0])) | (fsm_output[3]);
  assign nor_91_cse = ~((~ (fsm_output[0])) | (fsm_output[3]));
  assign or_529_cse = (fsm_output[8]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign nor_32_cse = ~((fsm_output[0]) | (~ (fsm_output[3])));
  assign nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_2_sva_mx0w1 = nl_VEC_LOOP_acc_10_cse_2_sva_mx0w1[13:0];
  assign nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_3_sva_mx0w2 = nl_VEC_LOOP_acc_10_cse_3_sva_mx0w2[13:0];
  assign nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_4_sva_mx0w3 = nl_VEC_LOOP_acc_10_cse_4_sva_mx0w3[13:0];
  assign nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_5_sva_mx0w4 = nl_VEC_LOOP_acc_10_cse_5_sva_mx0w4[13:0];
  assign nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_6_sva_mx0w5 = nl_VEC_LOOP_acc_10_cse_6_sva_mx0w5[13:0];
  assign nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_7_sva_mx0w6 = nl_VEC_LOOP_acc_10_cse_7_sva_mx0w6[13:0];
  assign nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_8_sva_mx0w7 = nl_VEC_LOOP_acc_10_cse_8_sva_mx0w7[13:0];
  assign nl_VEC_LOOP_acc_10_cse_9_sva_mx0w8 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_9_sva_mx0w8 = nl_VEC_LOOP_acc_10_cse_9_sva_mx0w8[13:0];
  assign nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_10_sva_mx0w9 = nl_VEC_LOOP_acc_10_cse_10_sva_mx0w9[13:0];
  assign nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_11_sva_mx0w10 = nl_VEC_LOOP_acc_10_cse_11_sva_mx0w10[13:0];
  assign nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_12_sva_mx0w11 = nl_VEC_LOOP_acc_10_cse_12_sva_mx0w11[13:0];
  assign nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_13_sva_mx0w12 = nl_VEC_LOOP_acc_10_cse_13_sva_mx0w12[13:0];
  assign nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_14_sva_mx0w13 = nl_VEC_LOOP_acc_10_cse_14_sva_mx0w13[13:0];
  assign nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_15_sva_mx0w14 = nl_VEC_LOOP_acc_10_cse_15_sva_mx0w14[13:0];
  assign nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_16_sva_mx0w15 = nl_VEC_LOOP_acc_10_cse_16_sva_mx0w15[13:0];
  assign nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_18_sva_mx0w17 = nl_VEC_LOOP_acc_10_cse_18_sva_mx0w17[13:0];
  assign nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_19_sva_mx0w18 = nl_VEC_LOOP_acc_10_cse_19_sva_mx0w18[13:0];
  assign nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_20_sva_mx0w19 = nl_VEC_LOOP_acc_10_cse_20_sva_mx0w19[13:0];
  assign nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_21_sva_mx0w20 = nl_VEC_LOOP_acc_10_cse_21_sva_mx0w20[13:0];
  assign nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_22_sva_mx0w21 = nl_VEC_LOOP_acc_10_cse_22_sva_mx0w21[13:0];
  assign nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_23_sva_mx0w22 = nl_VEC_LOOP_acc_10_cse_23_sva_mx0w22[13:0];
  assign nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_24_sva_mx0w23 = nl_VEC_LOOP_acc_10_cse_24_sva_mx0w23[13:0];
  assign nl_VEC_LOOP_acc_10_cse_25_sva_mx0w24 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_25_sva_mx0w24 = nl_VEC_LOOP_acc_10_cse_25_sva_mx0w24[13:0];
  assign nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_26_sva_mx0w25 = nl_VEC_LOOP_acc_10_cse_26_sva_mx0w25[13:0];
  assign nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_27_sva_mx0w26 = nl_VEC_LOOP_acc_10_cse_27_sva_mx0w26[13:0];
  assign nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_28_sva_mx0w27 = nl_VEC_LOOP_acc_10_cse_28_sva_mx0w27[13:0];
  assign nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_29_sva_mx0w28 = nl_VEC_LOOP_acc_10_cse_29_sva_mx0w28[13:0];
  assign nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_30_sva_mx0w29 = nl_VEC_LOOP_acc_10_cse_30_sva_mx0w29[13:0];
  assign nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_31_sva_mx0w30 = nl_VEC_LOOP_acc_10_cse_31_sva_mx0w30[13:0];
  assign nl_VEC_LOOP_acc_10_cse_sva_mx0w31 = z_out_5 + VEC_LOOP_acc_1_cse_10_sva;
  assign VEC_LOOP_acc_10_cse_sva_mx0w31 = nl_VEC_LOOP_acc_10_cse_sva_mx0w31[13:0];
  assign nor_tmp = (fsm_output[2:1]==2'b11);
  assign or_tmp_17 = (fsm_output[2:1]!=2'b00);
  assign mux_18_cse = MUX_s_1_2_2((~ nor_tmp), or_tmp_17, fsm_output[4]);
  assign or_730_cse = (~ (fsm_output[4])) | (fsm_output[1]);
  assign and_dcpl = ~((fsm_output[8:7]!=2'b00));
  assign nor_tmp_15 = (fsm_output[6:5]==2'b11);
  assign mux_tmp_136 = MUX_s_1_2_2((~ (fsm_output[6])), (fsm_output[6]), fsm_output[3]);
  assign not_tmp_138 = MUX_s_1_2_2((fsm_output[6]), (~ (fsm_output[6])), fsm_output[3]);
  assign or_dcpl_153 = or_tmp_17 | (fsm_output[0]);
  assign or_tmp_116 = (fsm_output[8:6]!=3'b010);
  assign or_tmp_119 = (fsm_output[8:6]!=3'b011);
  assign mux_215_nl = MUX_s_1_2_2(or_tmp_116, or_tmp_119, fsm_output[5]);
  assign or_273_nl = (fsm_output[8:6]!=3'b100);
  assign mux_214_nl = MUX_s_1_2_2(or_273_nl, or_tmp_116, fsm_output[5]);
  assign mux_tmp_216 = MUX_s_1_2_2(mux_215_nl, mux_214_nl, fsm_output[2]);
  assign or_tmp_120 = (fsm_output[8:6]!=3'b001);
  assign mux_tmp_218 = MUX_s_1_2_2(or_tmp_120, or_tmp_116, fsm_output[5]);
  assign mux_217_nl = MUX_s_1_2_2(or_tmp_119, or_tmp_120, fsm_output[5]);
  assign mux_tmp_219 = MUX_s_1_2_2(mux_tmp_218, mux_217_nl, fsm_output[2]);
  assign or_tmp_122 = (fsm_output[8:7]!=2'b00);
  assign or_277_cse = (fsm_output[8:7]!=2'b01);
  assign mux_tmp_221 = MUX_s_1_2_2(or_tmp_122, or_277_cse, fsm_output[6]);
  assign nand_tmp_7 = ~((fsm_output[5]) & (~ mux_tmp_221));
  assign or_279_nl = (fsm_output[5]) | mux_tmp_221;
  assign mux_tmp_222 = MUX_s_1_2_2(or_279_nl, nand_tmp_7, fsm_output[2]);
  assign mux_223_nl = MUX_s_1_2_2(mux_tmp_216, mux_tmp_222, fsm_output[3]);
  assign mux_220_nl = MUX_s_1_2_2(mux_tmp_219, mux_tmp_216, fsm_output[3]);
  assign mux_tmp_224 = MUX_s_1_2_2(mux_223_nl, mux_220_nl, fsm_output[0]);
  assign or_tmp_124 = (fsm_output[8:6]!=3'b000);
  assign mux_tmp_225 = MUX_s_1_2_2(or_tmp_116, or_tmp_124, fsm_output[5]);
  assign mux_tmp_226 = MUX_s_1_2_2(or_tmp_124, or_tmp_120, fsm_output[5]);
  assign mux_tmp_228 = MUX_s_1_2_2(or_354_cse, or_tmp_122, fsm_output[6]);
  assign or_tmp_126 = (fsm_output[5]) | mux_tmp_228;
  assign mux_tmp_235 = MUX_s_1_2_2(or_tmp_126, mux_tmp_226, fsm_output[2]);
  assign or_289_cse = (~ (fsm_output[1])) | (fsm_output[4]);
  assign mux_tmp_243 = MUX_s_1_2_2(or_730_cse, or_289_cse, fsm_output[5]);
  assign mux_tmp_246 = MUX_s_1_2_2((~ (fsm_output[4])), (fsm_output[4]), fsm_output[1]);
  assign and_33_cse = (fsm_output[5]) & mux_tmp_246;
  assign and_tmp_16 = (fsm_output[3]) & mux_508_cse;
  assign or_tmp_140 = (fsm_output[3]) | (~ mux_508_cse);
  assign or_297_nl = (fsm_output[5]) | (~ (fsm_output[1])) | (fsm_output[4]);
  assign mux_249_cse = MUX_s_1_2_2(or_297_nl, mux_tmp_243, fsm_output[2]);
  assign nand_tmp_9 = ~((fsm_output[3]) & (~ mux_249_cse));
  assign or_299_cse = (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[1]) | (~
      (fsm_output[4]));
  assign or_293_nl = (~ (fsm_output[5])) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign mux_245_cse = MUX_s_1_2_2(mux_tmp_243, or_293_nl, fsm_output[2]);
  assign nand_10_cse = ~((fsm_output[2]) & (~ mux_tmp_243));
  assign mux_253_nl = MUX_s_1_2_2(nand_10_cse, or_299_cse, fsm_output[3]);
  assign mux_254_nl = MUX_s_1_2_2(mux_253_nl, nand_tmp_9, fsm_output[6]);
  assign mux_252_nl = MUX_s_1_2_2(or_tmp_140, (~ and_tmp_16), fsm_output[6]);
  assign mux_255_nl = MUX_s_1_2_2(mux_254_nl, mux_252_nl, fsm_output[7]);
  assign mux_250_nl = MUX_s_1_2_2(nand_tmp_9, or_tmp_140, fsm_output[6]);
  assign or_294_nl = (fsm_output[3]) | mux_245_cse;
  assign mux_248_nl = MUX_s_1_2_2((~ and_tmp_16), or_294_nl, fsm_output[6]);
  assign mux_251_nl = MUX_s_1_2_2(mux_250_nl, mux_248_nl, fsm_output[7]);
  assign mux_256_nl = MUX_s_1_2_2(mux_255_nl, mux_251_nl, fsm_output[0]);
  assign or_291_nl = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[3]) | (fsm_output[2])
      | mux_tmp_243;
  assign or_285_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign mux_242_nl = MUX_s_1_2_2(or_474_cse, or_285_nl, fsm_output[3]);
  assign or_287_nl = (fsm_output[7:6]!=2'b00) | mux_242_nl;
  assign mux_244_nl = MUX_s_1_2_2(or_291_nl, or_287_nl, fsm_output[0]);
  assign mux_257_itm = MUX_s_1_2_2(mux_256_nl, mux_244_nl, fsm_output[8]);
  assign or_tmp_151 = (~ (fsm_output[4])) | (fsm_output[7]);
  assign or_tmp_155 = nor_32_cse | (~ (fsm_output[1])) | (fsm_output[4]) | (~ (fsm_output[7]));
  assign mux_tmp_261 = MUX_s_1_2_2((~ (fsm_output[7])), (fsm_output[7]), fsm_output[4]);
  assign mux_tmp_262 = MUX_s_1_2_2((~ mux_tmp_261), or_tmp_151, fsm_output[1]);
  assign nor_92_nl = ~((fsm_output[4]) | (~ (fsm_output[7])));
  assign mux_tmp_263 = MUX_s_1_2_2(nor_92_nl, mux_tmp_261, fsm_output[1]);
  assign mux_264_nl = MUX_s_1_2_2(mux_tmp_262, (~ mux_tmp_263), fsm_output[3]);
  assign mux_tmp_265 = MUX_s_1_2_2(mux_264_nl, mux_tmp_262, fsm_output[0]);
  assign or_315_nl = (~ (fsm_output[3])) | (fsm_output[1]) | (~ (fsm_output[4]))
      | (fsm_output[7]);
  assign or_314_nl = (fsm_output[3]) | (~ (fsm_output[1])) | (fsm_output[4]) | (~
      (fsm_output[7]));
  assign mux_tmp_267 = MUX_s_1_2_2(or_315_nl, or_314_nl, fsm_output[0]);
  assign and_dcpl_19 = ~((fsm_output[6:5]!=2'b00));
  assign and_dcpl_20 = and_dcpl_19 & and_dcpl;
  assign and_dcpl_21 = ~((fsm_output[4:3]!=2'b00));
  assign and_dcpl_22 = (fsm_output[2:1]==2'b10);
  assign and_dcpl_23 = and_dcpl_22 & (fsm_output[0]);
  assign and_dcpl_24 = and_dcpl_23 & and_dcpl_21;
  assign and_dcpl_25 = and_dcpl_24 & and_dcpl_20;
  assign or_326_nl = (fsm_output[8:7]!=2'b00) | not_tmp_138;
  assign or_324_nl = (fsm_output[8:7]!=2'b01) | not_tmp_138;
  assign mux_tmp_279 = MUX_s_1_2_2(or_326_nl, or_324_nl, fsm_output[4]);
  assign or_tmp_174 = (fsm_output[8]) | (fsm_output[3]) | (~ (fsm_output[6]));
  assign mux_tmp_281 = MUX_s_1_2_2(or_tmp_174, or_529_cse, fsm_output[7]);
  assign or_332_nl = (~ (fsm_output[8])) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_tmp_283 = MUX_s_1_2_2(or_332_nl, or_tmp_174, fsm_output[7]);
  assign and_dcpl_26 = (fsm_output[4:3]==2'b01);
  assign and_dcpl_28 = nor_tmp & (~ (fsm_output[0]));
  assign and_dcpl_30 = and_dcpl_28 & and_dcpl_26 & and_dcpl_20;
  assign and_dcpl_31 = (fsm_output[4:3]==2'b10);
  assign and_dcpl_32 = nor_tmp & (fsm_output[0]);
  assign and_dcpl_33 = and_dcpl_32 & and_dcpl_31;
  assign and_dcpl_34 = and_dcpl_33 & and_dcpl_20;
  assign or_tmp_179 = (~ (fsm_output[6])) | (fsm_output[3]) | (fsm_output[8]) | (fsm_output[2])
      | (~ (fsm_output[5]));
  assign or_341_cse = (fsm_output[8]) | (fsm_output[2]) | (~ (fsm_output[5]));
  assign or_342_cse = (fsm_output[8]) | (~ (fsm_output[2])) | (fsm_output[5]);
  assign mux_289_cse = MUX_s_1_2_2((fsm_output[5]), (~ (fsm_output[5])), fsm_output[2]);
  assign mux_292_nl = MUX_s_1_2_2(or_342_cse, or_341_cse, fsm_output[3]);
  assign or_339_nl = (~ (fsm_output[3])) | (fsm_output[8]) | (~ (fsm_output[2]))
      | (fsm_output[5]);
  assign mux_293_nl = MUX_s_1_2_2(mux_292_nl, or_339_nl, fsm_output[6]);
  assign mux_294_nl = MUX_s_1_2_2(or_tmp_179, mux_293_nl, fsm_output[7]);
  assign or_337_nl = (~ (fsm_output[8])) | (~ (fsm_output[2])) | (fsm_output[5]);
  assign or_336_nl = (fsm_output[8]) | mux_289_cse;
  assign mux_290_nl = MUX_s_1_2_2(or_337_nl, or_336_nl, fsm_output[3]);
  assign or_338_nl = (fsm_output[6]) | mux_290_nl;
  assign mux_291_nl = MUX_s_1_2_2(or_338_nl, or_tmp_179, fsm_output[7]);
  assign mux_295_itm = MUX_s_1_2_2(mux_294_nl, mux_291_nl, fsm_output[4]);
  assign and_dcpl_36 = ~(mux_295_itm | (fsm_output[1:0]!=2'b00));
  assign and_dcpl_37 = (fsm_output[6:5]==2'b01);
  assign and_dcpl_38 = and_dcpl_37 & and_dcpl;
  assign and_dcpl_40 = nor_201_cse & (~ (fsm_output[0]));
  assign and_dcpl_41 = and_dcpl_40 & and_dcpl_21;
  assign and_dcpl_42 = and_dcpl_41 & and_dcpl_38;
  assign and_dcpl_43 = nor_201_cse & (fsm_output[0]);
  assign and_dcpl_45 = and_dcpl_43 & and_dcpl_26 & and_dcpl_38;
  assign and_dcpl_46 = (fsm_output[2:1]==2'b01);
  assign and_dcpl_47 = and_dcpl_46 & (~ (fsm_output[0]));
  assign nor_87_nl = ~((fsm_output[4:3]!=2'b01));
  assign nor_88_nl = ~((fsm_output[4:3]!=2'b10));
  assign mux_296_nl = MUX_s_1_2_2(nor_87_nl, nor_88_nl, fsm_output[6]);
  assign and_302_nl = (fsm_output[5]) & mux_296_nl;
  assign nor_89_nl = ~((fsm_output[6:3]!=4'b0000));
  assign mux_297_nl = MUX_s_1_2_2(and_302_nl, nor_89_nl, fsm_output[8]);
  assign nor_90_nl = ~((fsm_output[8]) | (~ (fsm_output[5])) | (fsm_output[6]) |
      (~ and_295_cse));
  assign not_tmp_192 = MUX_s_1_2_2(mux_297_nl, nor_90_nl, fsm_output[7]);
  assign and_dcpl_48 = not_tmp_192 & and_dcpl_47;
  assign and_dcpl_50 = and_dcpl_47 & and_dcpl_31 & and_dcpl_38;
  assign and_dcpl_51 = and_dcpl_46 & (fsm_output[0]);
  assign and_dcpl_52 = and_dcpl_51 & and_295_cse;
  assign and_dcpl_53 = and_dcpl_52 & and_dcpl_38;
  assign and_dcpl_54 = (fsm_output[6:5]==2'b10);
  assign and_dcpl_55 = and_dcpl_54 & and_dcpl;
  assign and_dcpl_56 = and_dcpl_22 & (~ (fsm_output[0]));
  assign and_dcpl_58 = and_dcpl_56 & and_dcpl_21 & and_dcpl_55;
  assign and_dcpl_59 = and_dcpl_23 & and_dcpl_26;
  assign and_dcpl_60 = and_dcpl_59 & and_dcpl_55;
  assign and_dcpl_61 = and_dcpl_28 & and_dcpl_31;
  assign and_dcpl_62 = and_dcpl_61 & and_dcpl_55;
  assign and_dcpl_63 = and_dcpl_32 & and_295_cse;
  assign and_dcpl_64 = and_dcpl_63 & and_dcpl_55;
  assign and_dcpl_66 = nor_tmp_15 & and_dcpl;
  assign and_dcpl_67 = and_dcpl_40 & and_dcpl_26;
  assign and_dcpl_68 = and_dcpl_67 & and_dcpl_66;
  assign and_dcpl_70 = and_dcpl_43 & and_dcpl_31 & and_dcpl_66;
  assign and_dcpl_72 = and_dcpl_47 & and_295_cse & and_dcpl_66;
  assign and_dcpl_73 = (fsm_output[8:7]==2'b01);
  assign and_dcpl_74 = and_dcpl_19 & and_dcpl_73;
  assign and_dcpl_75 = and_dcpl_51 & and_dcpl_21;
  assign and_dcpl_76 = and_dcpl_75 & and_dcpl_74;
  assign and_dcpl_77 = and_dcpl_56 & and_dcpl_26;
  assign and_dcpl_78 = and_dcpl_77 & and_dcpl_74;
  assign and_dcpl_80 = and_dcpl_23 & and_dcpl_31 & and_dcpl_74;
  assign and_dcpl_81 = and_dcpl_28 & and_295_cse;
  assign and_dcpl_82 = and_dcpl_81 & and_dcpl_74;
  assign and_dcpl_83 = and_dcpl_37 & and_dcpl_73;
  assign and_dcpl_85 = and_dcpl_32 & and_dcpl_21 & and_dcpl_83;
  assign and_dcpl_86 = and_dcpl_40 & and_dcpl_31;
  assign and_dcpl_87 = and_dcpl_86 & and_dcpl_83;
  assign and_dcpl_89 = and_dcpl_43 & and_295_cse & and_dcpl_83;
  assign and_dcpl_90 = and_dcpl_54 & and_dcpl_73;
  assign and_dcpl_92 = and_dcpl_47 & and_dcpl_21 & and_dcpl_90;
  assign and_dcpl_94 = and_dcpl_51 & and_dcpl_26 & and_dcpl_90;
  assign and_dcpl_95 = and_dcpl_56 & and_dcpl_31;
  assign and_dcpl_96 = and_dcpl_95 & and_dcpl_90;
  assign and_dcpl_98 = and_dcpl_23 & and_295_cse & and_dcpl_90;
  assign and_dcpl_99 = nor_tmp_15 & and_dcpl_73;
  assign and_dcpl_100 = and_dcpl_28 & and_dcpl_21;
  assign and_dcpl_101 = and_dcpl_100 & and_dcpl_99;
  assign and_dcpl_103 = and_dcpl_32 & and_dcpl_26 & and_dcpl_99;
  assign and_dcpl_104 = and_dcpl_40 & and_295_cse;
  assign and_dcpl_105 = and_dcpl_104 & and_dcpl_99;
  assign and_dcpl_106 = (fsm_output[8:7]==2'b10);
  assign and_dcpl_107 = and_dcpl_19 & and_dcpl_106;
  assign and_dcpl_109 = and_dcpl_43 & and_dcpl_21 & and_dcpl_107;
  assign and_dcpl_111 = and_dcpl_47 & and_dcpl_26 & and_dcpl_107;
  assign and_dcpl_112 = and_dcpl_51 & and_dcpl_31;
  assign and_dcpl_113 = and_dcpl_112 & and_dcpl_107;
  assign and_dcpl_115 = and_dcpl_56 & and_295_cse & and_dcpl_107;
  assign mux_tmp_299 = MUX_s_1_2_2(or_tmp_122, or_277_cse, fsm_output[4]);
  assign or_tmp_197 = (fsm_output[3]) | mux_539_cse;
  assign and_dcpl_116 = (fsm_output[1:0]==2'b10);
  assign and_dcpl_118 = ~((fsm_output[5]) | (fsm_output[8]));
  assign and_dcpl_119 = (fsm_output[3:2]==2'b11);
  assign and_dcpl_122 = and_dcpl_119 & (fsm_output[6]) & and_dcpl_118 & and_dcpl_116
      & xor_dcpl;
  assign or_tmp_202 = (fsm_output[2]) | (~ (fsm_output[5])) | (~ (fsm_output[4]))
      | (fsm_output[8]) | (fsm_output[7]);
  assign or_362_nl = (fsm_output[5]) | (fsm_output[4]) | (~ (fsm_output[8])) | (fsm_output[7]);
  assign or_361_nl = (fsm_output[5]) | mux_tmp_299;
  assign mux_311_nl = MUX_s_1_2_2(or_362_nl, or_361_nl, fsm_output[2]);
  assign mux_tmp_312 = MUX_s_1_2_2(mux_311_nl, or_tmp_202, fsm_output[6]);
  assign nand_tmp_17 = (fsm_output[2]) | (~ (fsm_output[5])) | mux_tmp_299;
  assign or_372_nl = (~ (fsm_output[2])) | (fsm_output[5]) | mux_tmp_299;
  assign mux_tmp_319 = MUX_s_1_2_2(nand_tmp_17, or_372_nl, fsm_output[6]);
  assign mux_tmp_325 = MUX_s_1_2_2((~ mux_tmp_246), or_730_cse, fsm_output[7]);
  assign and_dcpl_123 = and_dcpl_61 & and_dcpl_74;
  assign mux_tmp_335 = MUX_s_1_2_2(or_289_cse, or_730_cse, fsm_output[2]);
  assign or_tmp_237 = (fsm_output[5]) | (~((fsm_output[2]) & mux_tmp_246));
  assign or_tmp_239 = (~ (fsm_output[5])) | (fsm_output[2]) | (~ mux_tmp_246);
  assign mux_338_nl = MUX_s_1_2_2(or_474_cse, or_tmp_239, fsm_output[6]);
  assign mux_337_nl = MUX_s_1_2_2(or_tmp_237, or_299_cse, fsm_output[6]);
  assign mux_339_nl = MUX_s_1_2_2(mux_338_nl, mux_337_nl, fsm_output[7]);
  assign or_390_nl = (fsm_output[7:5]!=3'b000) | mux_tmp_335;
  assign mux_tmp_340 = MUX_s_1_2_2(mux_339_nl, or_390_nl, fsm_output[8]);
  assign mux_tmp_343 = MUX_s_1_2_2(or_tmp_239, or_tmp_237, fsm_output[6]);
  assign or_tmp_248 = (~ (fsm_output[5])) | (fsm_output[2]) | (fsm_output[8]) | mux_tmp_325;
  assign or_tmp_258 = (fsm_output[5]) | (fsm_output[8]) | (fsm_output[3]) | (~ (fsm_output[6]));
  assign or_415_nl = (fsm_output[5]) | (~ (fsm_output[8])) | (~ (fsm_output[3]))
      | (fsm_output[6]);
  assign mux_tmp_361 = MUX_s_1_2_2(or_415_nl, or_tmp_258, fsm_output[7]);
  assign or_tmp_260 = (fsm_output[5]) | (fsm_output[8]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_tmp_362 = MUX_s_1_2_2(or_tmp_258, or_tmp_260, fsm_output[7]);
  assign or_tmp_262 = (fsm_output[7]) | (~ (fsm_output[5])) | (fsm_output[8]) | not_tmp_138;
  assign or_tmp_264 = (~ (fsm_output[7])) | (~ (fsm_output[5])) | (fsm_output[8])
      | not_tmp_138;
  assign and_dcpl_126 = (~ mux_295_itm) & and_dcpl_116;
  assign and_dcpl_127 = not_tmp_192 & and_dcpl_56;
  assign mux_375_cse = MUX_s_1_2_2(or_364_cse, mux_tmp_299, fsm_output[1]);
  assign or_432_nl = (fsm_output[2]) | (~ (fsm_output[0])) | (fsm_output[1]) | (~
      (fsm_output[4])) | (fsm_output[8]) | (fsm_output[7]);
  assign nand_20_nl = ~((fsm_output[0]) & (~ mux_375_cse));
  assign or_427_nl = (~ (fsm_output[0])) | (fsm_output[1]) | (~ (fsm_output[4]))
      | (fsm_output[8]) | (fsm_output[7]);
  assign mux_376_nl = MUX_s_1_2_2(nand_20_nl, or_427_nl, fsm_output[2]);
  assign mux_tmp_377 = MUX_s_1_2_2(or_432_nl, mux_376_nl, fsm_output[5]);
  assign nor_76_nl = ~((fsm_output[5:4]!=2'b01));
  assign nor_77_nl = ~((fsm_output[5:4]!=2'b10));
  assign mux_384_nl = MUX_s_1_2_2(nor_76_nl, nor_77_nl, fsm_output[7]);
  assign and_dcpl_132 = mux_384_nl & nor_201_cse & (~ (fsm_output[0])) & (~ (fsm_output[3]))
      & (fsm_output[6]) & (~ (fsm_output[8]));
  assign or_442_nl = (fsm_output[6]) | (~ (fsm_output[8])) | (~ (fsm_output[2]))
      | (fsm_output[5]);
  assign mux_tmp_385 = MUX_s_1_2_2(or_442_nl, or_799_cse, fsm_output[7]);
  assign mux_tmp_388 = MUX_s_1_2_2(or_341_cse, or_342_cse, fsm_output[6]);
  assign nand_tmp_23 = ~((fsm_output[7]) & (~ mux_tmp_388));
  assign or_449_nl = (fsm_output[8:6]!=3'b001) | mux_289_cse;
  assign mux_tmp_392 = MUX_s_1_2_2(mux_tmp_385, or_449_nl, fsm_output[4]);
  assign or_tmp_295 = (fsm_output[8:6]!=3'b000) | mux_289_cse;
  assign and_tmp_18 = (fsm_output[5]) & mux_tmp_136;
  assign or_457_nl = (fsm_output[5]) | (fsm_output[3]) | (~ (fsm_output[6]));
  assign mux_tmp_400 = MUX_s_1_2_2((~ and_tmp_18), or_457_nl, fsm_output[2]);
  assign nand_24_nl = ~((fsm_output[7]) & (~ mux_tmp_400));
  assign or_455_nl = (fsm_output[7]) | (~ (fsm_output[2])) | (fsm_output[5]) | (~
      (fsm_output[3])) | (fsm_output[6]);
  assign mux_tmp_401 = MUX_s_1_2_2(nand_24_nl, or_455_nl, fsm_output[8]);
  assign and_dcpl_133 = and_dcpl_104 & and_dcpl_74;
  assign nand_46_cse = ~((fsm_output[5]) & mux_tmp_246);
  assign or_466_nl = (fsm_output[2]) | nand_46_cse;
  assign mux_tmp_411 = MUX_s_1_2_2(mux_245_cse, or_466_nl, fsm_output[7]);
  assign or_tmp_321 = (~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[6]) | (fsm_output[0])
      | (~ (fsm_output[3]));
  assign or_tmp_324 = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[0]) | (~ (fsm_output[3]));
  assign mux_tmp_419 = MUX_s_1_2_2((~ (fsm_output[3])), (fsm_output[3]), fsm_output[0]);
  assign mux_tmp_420 = MUX_s_1_2_2(nor_91_cse, mux_tmp_419, fsm_output[6]);
  assign and_tmp_20 = (fsm_output[7]) & mux_tmp_420;
  assign or_8_nl = (fsm_output[6]) | (fsm_output[0]) | (~ (fsm_output[3]));
  assign mux_tmp_421 = MUX_s_1_2_2((~ mux_tmp_420), or_8_nl, fsm_output[7]);
  assign nor_74_nl = ~((fsm_output[4]) | (~ and_tmp_20));
  assign mux_422_nl = MUX_s_1_2_2((~ mux_tmp_421), and_tmp_20, fsm_output[4]);
  assign mux_tmp_423 = MUX_s_1_2_2(nor_74_nl, mux_422_nl, fsm_output[1]);
  assign or_495_nl = (fsm_output[5]) | (~ (fsm_output[7])) | (fsm_output[3]) | (~
      (fsm_output[6]));
  assign or_197_nl = (fsm_output[7]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign or_201_nl = (~ (fsm_output[7])) | (fsm_output[3]) | (~ (fsm_output[6]));
  assign mux_432_nl = MUX_s_1_2_2(or_197_nl, or_201_nl, fsm_output[5]);
  assign mux_433_nl = MUX_s_1_2_2(or_495_nl, mux_432_nl, fsm_output[2]);
  assign or_490_nl = (fsm_output[2]) | (fsm_output[5]) | (fsm_output[7]) | (~ (fsm_output[3]))
      | (fsm_output[6]);
  assign mux_tmp_434 = MUX_s_1_2_2(mux_433_nl, or_490_nl, fsm_output[8]);
  assign or_202_nl = (fsm_output[3]) | (~ (fsm_output[6]));
  assign or_199_nl = (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_tmp_435 = MUX_s_1_2_2(or_202_nl, or_199_nl, fsm_output[7]);
  assign or_tmp_342 = (fsm_output[5]) | mux_tmp_435;
  assign or_501_nl = (~ (fsm_output[5])) | (fsm_output[7]) | not_tmp_138;
  assign mux_439_nl = MUX_s_1_2_2(or_501_nl, or_tmp_342, fsm_output[2]);
  assign or_502_nl = (fsm_output[8]) | mux_439_nl;
  assign mux_440_nl = MUX_s_1_2_2(mux_tmp_434, or_502_nl, fsm_output[4]);
  assign nand_25_nl = ~((fsm_output[5]) & (~ mux_tmp_435));
  assign mux_436_nl = MUX_s_1_2_2(or_tmp_342, nand_25_nl, fsm_output[2]);
  assign or_499_nl = (fsm_output[8]) | mux_436_nl;
  assign mux_437_nl = MUX_s_1_2_2(or_499_nl, mux_tmp_434, fsm_output[4]);
  assign mux_441_nl = MUX_s_1_2_2(mux_440_nl, mux_437_nl, fsm_output[1]);
  assign and_dcpl_136 = ~(mux_441_nl | (fsm_output[0]));
  assign or_507_nl = (fsm_output[5]) | (fsm_output[4]) | (~ (fsm_output[7]));
  assign or_504_nl = (fsm_output[4]) | (~ (fsm_output[7]));
  assign mux_442_nl = MUX_s_1_2_2(or_tmp_151, or_504_nl, fsm_output[5]);
  assign mux_tmp_443 = MUX_s_1_2_2(or_507_nl, mux_442_nl, fsm_output[2]);
  assign or_509_nl = (fsm_output[6]) | mux_tmp_443;
  assign or_508_nl = (fsm_output[2]) | (~ (fsm_output[5])) | (~ (fsm_output[4]))
      | (fsm_output[7]);
  assign mux_444_nl = MUX_s_1_2_2(or_508_nl, mux_tmp_443, fsm_output[6]);
  assign mux_445_nl = MUX_s_1_2_2(or_509_nl, mux_444_nl, fsm_output[3]);
  assign or_503_nl = (fsm_output[7:2]!=6'b000100);
  assign mux_446_nl = MUX_s_1_2_2(mux_445_nl, or_503_nl, fsm_output[8]);
  assign and_dcpl_138 = (~ mux_446_nl) & (fsm_output[1:0]==2'b01);
  assign and_dcpl_140 = (fsm_output[1:0]==2'b11) & xor_dcpl;
  assign and_dcpl_144 = xor_dcpl_1 & (fsm_output[2]) & (fsm_output[5]) & (~ (fsm_output[8]))
      & and_dcpl_140;
  assign and_dcpl_151 = (~ (fsm_output[2])) & (fsm_output[3]) & (fsm_output[6]) &
      and_dcpl_118 & and_dcpl_140;
  assign or_tmp_357 = (fsm_output[5]) | (fsm_output[8]) | (~ mux_tmp_246);
  assign or_511_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (~ mux_tmp_246);
  assign mux_tmp_448 = MUX_s_1_2_2(or_tmp_357, or_511_nl, fsm_output[2]);
  assign or_516_nl = (fsm_output[8]) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign or_514_nl = (fsm_output[8]) | (~ (fsm_output[1])) | (fsm_output[4]);
  assign mux_tmp_449 = MUX_s_1_2_2(or_516_nl, or_514_nl, fsm_output[5]);
  assign or_517_nl = (fsm_output[5]) | (fsm_output[8]) | (~ (fsm_output[1])) | (fsm_output[4]);
  assign mux_tmp_450 = MUX_s_1_2_2(or_517_nl, mux_tmp_449, fsm_output[2]);
  assign or_tmp_363 = (fsm_output[7]) | (fsm_output[2]) | (~ (fsm_output[5])) | (fsm_output[8])
      | (fsm_output[1]) | (~ (fsm_output[4]));
  assign mux_451_nl = MUX_s_1_2_2(mux_tmp_450, mux_tmp_448, fsm_output[7]);
  assign mux_tmp_452 = MUX_s_1_2_2(or_tmp_363, mux_451_nl, fsm_output[6]);
  assign and_dcpl_159 = and_dcpl_112 & and_dcpl_74;
  assign or_tmp_371 = (fsm_output[5]) | (fsm_output[8]) | not_tmp_138;
  assign or_525_nl = (~ (fsm_output[5])) | (fsm_output[8]) | not_tmp_138;
  assign mux_tmp_462 = MUX_s_1_2_2(or_tmp_371, or_525_nl, fsm_output[2]);
  assign nand_tmp_26 = ~((fsm_output[7]) & (~ mux_tmp_462));
  assign and_dcpl_166 = and_dcpl_37 & and_dcpl_106;
  assign mux_tmp_468 = MUX_s_1_2_2((~ (fsm_output[2])), (fsm_output[2]), fsm_output[1]);
  assign or_38_nl = (fsm_output[2:1]!=2'b10);
  assign mux_tmp_469 = MUX_s_1_2_2(or_38_nl, mux_tmp_468, fsm_output[0]);
  assign or_tmp_378 = nor_207_cse | (fsm_output[2]);
  assign mux_tmp_470 = MUX_s_1_2_2(or_tmp_378, mux_tmp_469, fsm_output[4]);
  assign or_41_nl = (fsm_output[2:1]!=2'b01);
  assign mux_tmp_471 = MUX_s_1_2_2(mux_tmp_468, or_41_nl, fsm_output[0]);
  assign or_tmp_380 = ((fsm_output[1:0]==2'b11)) | (fsm_output[2]);
  assign mux_tmp_472 = MUX_s_1_2_2(or_tmp_380, mux_tmp_471, fsm_output[4]);
  assign nand_63_cse = ~((fsm_output[1:0]==2'b11));
  assign or_tmp_381 = ~(nand_63_cse & (fsm_output[2]));
  assign mux_tmp_474 = MUX_s_1_2_2(mux_tmp_471, or_tmp_381, fsm_output[4]);
  assign mux_tmp_478 = MUX_s_1_2_2(nor_201_cse, nor_tmp, fsm_output[0]);
  assign nor_tmp_30 = or_720_cse & (fsm_output[2]);
  assign mux_tmp_479 = MUX_s_1_2_2(nor_tmp_30, mux_tmp_478, fsm_output[4]);
  assign mux_tmp_481 = MUX_s_1_2_2((~ mux_tmp_478), or_tmp_380, fsm_output[4]);
  assign mux_tmp_485 = MUX_s_1_2_2((~ or_tmp_381), nor_tmp, fsm_output[4]);
  assign mux_tmp_488 = MUX_s_1_2_2((~ mux_tmp_469), nor_tmp_30, fsm_output[4]);
  assign or_544_cse = (fsm_output[2]) | (~ and_33_cse);
  assign mux_tmp_502 = MUX_s_1_2_2(mux_245_cse, or_544_cse, fsm_output[7]);
  assign mux_503_nl = MUX_s_1_2_2(or_471_cse, mux_tmp_502, fsm_output[6]);
  assign or_543_nl = (fsm_output[6]) | (fsm_output[7]) | (~ (fsm_output[2])) | (fsm_output[5])
      | (~ mux_tmp_246);
  assign mux_tmp_504 = MUX_s_1_2_2(mux_503_nl, or_543_nl, fsm_output[8]);
  assign or_tmp_401 = nor_91_cse | (fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[8])
      | (fsm_output[7]);
  assign mux_tmp_515 = MUX_s_1_2_2(mux_375_cse, or_380_cse, nor_32_cse);
  assign or_tmp_409 = (fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[8]) | (fsm_output[7]);
  assign or_575_nl = (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[4])) | (fsm_output[8])
      | (fsm_output[7]);
  assign mux_536_nl = MUX_s_1_2_2(mux_375_cse, or_tmp_409, fsm_output[2]);
  assign mux_tmp_537 = MUX_s_1_2_2(or_575_nl, mux_536_nl, fsm_output[5]);
  assign or_725_nl = (fsm_output[5]) | (~ (fsm_output[2])) | mux_375_cse;
  assign mux_tmp_538 = MUX_s_1_2_2(mux_tmp_537, or_725_nl, fsm_output[6]);
  assign nor_62_nl = ~((fsm_output[6:1]!=6'b000000));
  assign or_598_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]) | nor_tmp_30;
  assign mux_553_nl = MUX_s_1_2_2((fsm_output[6]), or_598_nl, fsm_output[5]);
  assign mux_554_nl = MUX_s_1_2_2(nor_62_nl, mux_553_nl, fsm_output[8]);
  assign mux_tmp_555 = MUX_s_1_2_2(mux_554_nl, (fsm_output[8]), fsm_output[7]);
  assign not_tmp_313 = ~((VEC_LOOP_j_14_0_1_sva_1[14]) & (fsm_output[3]));
  assign or_627_nl = (fsm_output[1:0]!=2'b00) | (~ (VEC_LOOP_j_14_0_1_sva_1[14]))
      | (fsm_output[3]);
  assign or_626_nl = (fsm_output[1:0]!=2'b10) | (~ (VEC_LOOP_j_14_0_1_sva_1[14]))
      | (fsm_output[3]);
  assign mux_tmp_587 = MUX_s_1_2_2(or_627_nl, or_626_nl, fsm_output[4]);
  assign or_635_nl = (~((fsm_output[4]) | (~ (fsm_output[1])) | (~ (fsm_output[0]))))
      | (fsm_output[3]);
  assign mux_tmp_593 = MUX_s_1_2_2((~ (fsm_output[3])), or_635_nl, fsm_output[6]);
  assign nor_55_nl = ~((fsm_output[0]) | (fsm_output[3]));
  assign mux_tmp_594 = MUX_s_1_2_2(nor_55_nl, (fsm_output[3]), or_730_cse);
  assign mux_607_nl = MUX_s_1_2_2(or_473_cse, or_299_cse, fsm_output[6]);
  assign or_645_nl = (fsm_output[6]) | mux_249_cse;
  assign mux_608_nl = MUX_s_1_2_2(mux_607_nl, or_645_nl, fsm_output[7]);
  assign or_641_nl = (fsm_output[7]) | (fsm_output[6]) | (fsm_output[2]) | (fsm_output[5])
      | (~ mux_tmp_246);
  assign mux_tmp_609 = MUX_s_1_2_2(mux_608_nl, or_641_nl, fsm_output[8]);
  assign mux_tmp_611 = MUX_s_1_2_2(or_299_cse, mux_249_cse, fsm_output[6]);
  assign mux_614_nl = MUX_s_1_2_2(or_544_cse, or_473_cse, fsm_output[6]);
  assign mux_615_nl = MUX_s_1_2_2(mux_614_nl, mux_tmp_611, fsm_output[7]);
  assign or_653_nl = (fsm_output[8]) | mux_615_nl;
  assign mux_616_nl = MUX_s_1_2_2(mux_tmp_609, or_653_nl, fsm_output[3]);
  assign nand_40_nl = ~((fsm_output[6]) & mux_508_cse);
  assign mux_612_nl = MUX_s_1_2_2(mux_tmp_611, nand_40_nl, fsm_output[7]);
  assign or_651_nl = (fsm_output[8]) | mux_612_nl;
  assign mux_613_nl = MUX_s_1_2_2(or_651_nl, mux_tmp_609, fsm_output[3]);
  assign mux_617_itm = MUX_s_1_2_2(mux_616_nl, mux_613_nl, fsm_output[0]);
  assign or_718_nl = (fsm_output[5]) | (~ mux_tmp_246);
  assign mux_619_nl = MUX_s_1_2_2(or_718_nl, nand_46_cse, fsm_output[2]);
  assign or_tmp_489 = (fsm_output[8]) | mux_619_nl;
  assign or_tmp_493 = (fsm_output[8]) | mux_249_cse;
  assign mux_622_nl = MUX_s_1_2_2(or_tmp_493, or_tmp_489, fsm_output[7]);
  assign mux_tmp_623 = MUX_s_1_2_2(or_tmp_363, mux_622_nl, fsm_output[6]);
  assign mux_662_nl = MUX_s_1_2_2(or_380_cse, mux_539_cse, fsm_output[2]);
  assign mux_663_nl = MUX_s_1_2_2(mux_662_nl, or_410_cse, fsm_output[5]);
  assign mux_tmp_664 = MUX_s_1_2_2(or_578_cse, mux_663_nl, fsm_output[6]);
  assign STAGE_LOOP_i_3_0_sva_mx0c1 = and_dcpl_24 & and_dcpl_166;
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ z_out_28)}) + 5'b00001;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign xor_dcpl = ~((fsm_output[4]) ^ (fsm_output[7]));
  assign xor_dcpl_1 = ~((fsm_output[3]) ^ (fsm_output[6]));
  assign vec_rsci_d_d = MUX_v_32_2_2(COMP_LOOP_1_mult_cmp_return_rsc_z, COMP_LOOP_1_modulo_add_cmp_return_rsc_z,
      mux_257_itm);
  assign and_142_nl = and_dcpl_100 & and_dcpl_20;
  assign mux_358_nl = MUX_s_1_2_2(mux_328_cse, or_410_cse, fsm_output[5]);
  assign mux_359_nl = MUX_s_1_2_2(or_tmp_248, mux_358_nl, fsm_output[6]);
  assign mux_354_nl = MUX_s_1_2_2((~ mux_329_cse), or_406_cse, fsm_output[8]);
  assign mux_355_nl = MUX_s_1_2_2(or_408_cse, mux_354_nl, fsm_output[2]);
  assign or_409_nl = (fsm_output[5]) | mux_355_nl;
  assign mux_356_nl = MUX_s_1_2_2(or_409_nl, or_tmp_248, fsm_output[6]);
  assign mux_360_nl = MUX_s_1_2_2(mux_359_nl, mux_356_nl, fsm_output[3]);
  assign and_143_nl = (~ mux_360_nl) & (fsm_output[0]);
  assign VEC_LOOP_mux1h_5_nl = MUX1HOT_v_9_37_2((z_out_6[13:5]), COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[13:5]), (VEC_LOOP_acc_1_cse_10_sva[13:5]),
      (VEC_LOOP_acc_10_cse_3_sva_mx0w2[13:5]), ({COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9
      , (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[8:4])}), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[13:5]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[13:5]), ({COMP_LOOP_13_twiddle_f_mul_psp_sva_11
      , (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:3])}), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[13:5]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[13:5]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[13:5]),
      (VEC_LOOP_acc_10_cse_9_sva_mx0w8[13:5]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:2]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[13:5]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[13:5]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[13:5]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[13:5]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[13:5]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[13:5]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[13:5]), (COMP_LOOP_17_twiddle_f_mul_psp_sva[9:1]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[13:5]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[13:5]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[13:5]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[13:5]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[13:5]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[13:5]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[13:5]), (VEC_LOOP_acc_10_cse_25_sva_mx0w24[13:5]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[13:5]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[13:5]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[13:5]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[13:5]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[13:5]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[13:5]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[13:5]), {VEC_LOOP_or_13_cse , and_142_nl ,
      and_dcpl_30 , and_143_nl , and_dcpl_34 , and_dcpl_36 , and_dcpl_42 , and_dcpl_45
      , and_dcpl_48 , and_dcpl_50 , and_dcpl_53 , and_dcpl_58 , and_dcpl_60 , and_dcpl_122
      , and_dcpl_62 , and_dcpl_64 , and_dcpl_68 , and_dcpl_70 , and_dcpl_72 , and_dcpl_76
      , and_dcpl_78 , and_dcpl_123 , and_dcpl_82 , and_dcpl_85 , and_dcpl_87 , and_dcpl_89
      , and_dcpl_92 , and_dcpl_94 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103
      , and_dcpl_105 , and_dcpl_109 , and_dcpl_111 , and_dcpl_113 , and_dcpl_115});
  assign nor_79_nl = ~((fsm_output[8:1]!=8'b00000011));
  assign nor_80_nl = ~((~ (fsm_output[8])) | (fsm_output[7]) | (~ (fsm_output[1]))
      | (fsm_output[4]));
  assign nor_82_nl = ~((fsm_output[7]) | (fsm_output[1]) | (~ (fsm_output[4])));
  assign mux_330_nl = MUX_s_1_2_2(mux_329_cse, nor_82_nl, fsm_output[8]);
  assign mux_331_nl = MUX_s_1_2_2(nor_80_nl, mux_330_nl, fsm_output[2]);
  assign and_301_nl = (fsm_output[3]) & mux_331_nl;
  assign nor_83_nl = ~((fsm_output[3]) | mux_328_cse);
  assign mux_332_nl = MUX_s_1_2_2(and_301_nl, nor_83_nl, fsm_output[6]);
  assign nor_84_nl = ~((fsm_output[3]) | (fsm_output[2]) | (fsm_output[8]) | mux_tmp_325);
  assign nor_85_nl = ~((~ (fsm_output[2])) | (fsm_output[8]) | (~ (fsm_output[7]))
      | (~ (fsm_output[1])) | (fsm_output[4]));
  assign nor_86_nl = ~((fsm_output[2]) | (fsm_output[8]) | mux_tmp_325);
  assign mux_326_nl = MUX_s_1_2_2(nor_85_nl, nor_86_nl, fsm_output[3]);
  assign mux_327_nl = MUX_s_1_2_2(nor_84_nl, mux_326_nl, fsm_output[6]);
  assign mux_333_nl = MUX_s_1_2_2(mux_332_nl, mux_327_nl, fsm_output[5]);
  assign mux_334_nl = MUX_s_1_2_2(nor_79_nl, mux_333_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_3_nl = MUX1HOT_s_1_36_2((z_out_6[4]), (VEC_LOOP_acc_1_cse_10_sva[4]),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[4]), (VEC_LOOP_acc_10_cse_3_sva_mx0w2[4]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[3]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[4]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[4]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[2]),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[4]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[4]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[4]), (VEC_LOOP_acc_10_cse_9_sva_mx0w8[4]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[4]),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10[4]), (VEC_LOOP_acc_10_cse_12_sva_mx0w11[4]),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12[4]), (VEC_LOOP_acc_10_cse_14_sva_mx0w13[4]),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14[4]), (VEC_LOOP_acc_10_cse_16_sva_mx0w15[4]),
      (COMP_LOOP_17_twiddle_f_mul_psp_sva[0]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[4]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[4]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[4]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[4]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[4]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[4]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[4]),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24[4]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[4]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[4]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[4]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[4]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[4]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[4]), (VEC_LOOP_acc_10_cse_sva_mx0w31[4]),
      {VEC_LOOP_or_13_cse , mux_334_nl , and_dcpl_30 , and_dcpl_34 , and_dcpl_36
      , and_dcpl_42 , and_dcpl_45 , and_dcpl_48 , and_dcpl_50 , and_dcpl_53 , and_dcpl_58
      , and_dcpl_60 , and_dcpl_122 , and_dcpl_62 , and_dcpl_64 , and_dcpl_68 , and_dcpl_70
      , and_dcpl_72 , and_dcpl_76 , and_dcpl_78 , and_dcpl_123 , and_dcpl_82 , and_dcpl_85
      , and_dcpl_87 , and_dcpl_89 , and_dcpl_92 , and_dcpl_94 , and_dcpl_96 , and_dcpl_98
      , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 , and_dcpl_109 , and_dcpl_111
      , and_dcpl_113 , and_dcpl_115});
  assign or_728_nl = (fsm_output[5]) | (~ (fsm_output[2])) | (fsm_output[6]) | (fsm_output[3])
      | (~ (fsm_output[1])) | mux_tmp_299;
  assign or_357_nl = (~ (fsm_output[3])) | (~ (fsm_output[1])) | (fsm_output[4])
      | (~ (fsm_output[8])) | (fsm_output[7]);
  assign or_356_nl = (fsm_output[3]) | (~ (fsm_output[1])) | (fsm_output[4]) | (fsm_output[8])
      | (~ (fsm_output[7]));
  assign mux_306_nl = MUX_s_1_2_2(or_357_nl, or_356_nl, fsm_output[6]);
  assign nand_15_nl = ~((fsm_output[3]) & (~ mux_304_cse));
  assign mux_305_nl = MUX_s_1_2_2(nand_15_nl, or_tmp_197, fsm_output[6]);
  assign mux_307_nl = MUX_s_1_2_2(mux_306_nl, mux_305_nl, fsm_output[2]);
  assign nand_14_nl = ~((fsm_output[3]) & (~ mux_539_cse));
  assign mux_301_nl = MUX_s_1_2_2(or_tmp_197, nand_14_nl, fsm_output[6]);
  assign or_349_nl = (~ (fsm_output[6])) | (fsm_output[3]) | (~ (fsm_output[1]))
      | (fsm_output[4]) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_302_nl = MUX_s_1_2_2(mux_301_nl, or_349_nl, fsm_output[2]);
  assign mux_308_nl = MUX_s_1_2_2(mux_307_nl, mux_302_nl, fsm_output[5]);
  assign mux_309_nl = MUX_s_1_2_2(or_728_nl, mux_308_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_1_nl = MUX1HOT_s_1_35_2((z_out_6[3]), (VEC_LOOP_acc_1_cse_10_sva[3]),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[3]), (VEC_LOOP_acc_10_cse_3_sva_mx0w2[3]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[2]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[3]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[3]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[3]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[3]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[3]), (VEC_LOOP_acc_10_cse_9_sva_mx0w8[3]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[3]),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10[3]), (VEC_LOOP_acc_10_cse_12_sva_mx0w11[3]),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12[3]), (VEC_LOOP_acc_10_cse_14_sva_mx0w13[3]),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14[3]), (VEC_LOOP_acc_10_cse_16_sva_mx0w15[3]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[3]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[3]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[3]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[3]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[3]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[3]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[3]), (VEC_LOOP_acc_10_cse_25_sva_mx0w24[3]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[3]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[3]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[3]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[3]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[3]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[3]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[3]), {VEC_LOOP_or_13_cse , (~ mux_309_nl) ,
      and_dcpl_30 , and_dcpl_34 , and_dcpl_36 , and_dcpl_42 , and_dcpl_45 , and_dcpl_48
      , and_dcpl_50 , and_dcpl_53 , and_dcpl_58 , and_dcpl_60 , and_dcpl_122 , and_dcpl_62
      , and_dcpl_64 , and_dcpl_68 , and_dcpl_70 , and_dcpl_72 , and_dcpl_76 , and_dcpl_78
      , and_dcpl_82 , and_dcpl_85 , and_dcpl_87 , and_dcpl_89 , and_dcpl_92 , and_dcpl_94
      , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 ,
      and_dcpl_109 , and_dcpl_111 , and_dcpl_113 , and_dcpl_115});
  assign or_729_nl = (fsm_output[5]) | (~ (fsm_output[1])) | (~ (fsm_output[2]))
      | mux_tmp_279;
  assign mux_285_nl = MUX_s_1_2_2(mux_tmp_281, mux_tmp_283, fsm_output[4]);
  assign nand_11_nl = ~((fsm_output[2]) & (~ mux_285_nl));
  assign or_333_nl = (fsm_output[4]) | mux_tmp_283;
  assign or_331_nl = (fsm_output[7]) | (fsm_output[8]) | (~ (fsm_output[3])) | (fsm_output[6]);
  assign mux_282_nl = MUX_s_1_2_2(or_331_nl, mux_tmp_281, fsm_output[4]);
  assign mux_284_nl = MUX_s_1_2_2(or_333_nl, mux_282_nl, fsm_output[2]);
  assign mux_286_nl = MUX_s_1_2_2(nand_11_nl, mux_284_nl, fsm_output[1]);
  assign or_327_nl = (fsm_output[2]) | mux_tmp_279;
  assign or_322_nl = (~ (fsm_output[4])) | (fsm_output[7]) | (fsm_output[8]) | not_tmp_138;
  assign or_320_nl = (fsm_output[4]) | (~ (fsm_output[7])) | (fsm_output[8]) | (fsm_output[3])
      | (~ (fsm_output[6]));
  assign mux_278_nl = MUX_s_1_2_2(or_322_nl, or_320_nl, fsm_output[2]);
  assign mux_280_nl = MUX_s_1_2_2(or_327_nl, mux_278_nl, fsm_output[1]);
  assign mux_287_nl = MUX_s_1_2_2(mux_286_nl, mux_280_nl, fsm_output[5]);
  assign mux_288_nl = MUX_s_1_2_2(or_729_nl, mux_287_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_nl = MUX1HOT_s_1_34_2((z_out_6[2]), (VEC_LOOP_acc_1_cse_10_sva[2]),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[2]), (VEC_LOOP_acc_10_cse_3_sva_mx0w2[2]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[1]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[2]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[2]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[2]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[2]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[2]), (VEC_LOOP_acc_10_cse_9_sva_mx0w8[2]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[2]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[2]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[2]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[2]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[2]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[2]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[2]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[2]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[2]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[2]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[2]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[2]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[2]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[2]),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24[2]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[2]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[2]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[2]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[2]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[2]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[2]), (VEC_LOOP_acc_10_cse_sva_mx0w31[2]),
      {VEC_LOOP_or_13_cse , (~ mux_288_nl) , and_dcpl_30 , and_dcpl_34 , and_dcpl_36
      , and_dcpl_42 , and_dcpl_45 , and_dcpl_48 , and_dcpl_50 , and_dcpl_53 , and_dcpl_58
      , and_dcpl_60 , and_dcpl_62 , and_dcpl_64 , and_dcpl_68 , and_dcpl_70 , and_dcpl_72
      , and_dcpl_76 , and_dcpl_78 , and_dcpl_82 , and_dcpl_85 , and_dcpl_87 , and_dcpl_89
      , and_dcpl_92 , and_dcpl_94 , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103
      , and_dcpl_105 , and_dcpl_109 , and_dcpl_111 , and_dcpl_113 , and_dcpl_115});
  assign mux_322_nl = MUX_s_1_2_2(mux_tmp_312, mux_tmp_319, fsm_output[3]);
  assign nand_18_nl = ~((fsm_output[1]) & (~ mux_322_nl));
  assign or_370_nl = (~ (fsm_output[2])) | (fsm_output[5]) | mux_303_cse;
  assign mux_318_nl = MUX_s_1_2_2(or_370_nl, nand_tmp_17, fsm_output[6]);
  assign mux_320_nl = MUX_s_1_2_2(mux_tmp_319, mux_318_nl, fsm_output[3]);
  assign or_367_nl = (fsm_output[5]) | (fsm_output[4]) | (fsm_output[8]) | (~ (fsm_output[7]));
  assign mux_313_nl = MUX_s_1_2_2(or_365_cse, or_364_cse, fsm_output[5]);
  assign mux_314_nl = MUX_s_1_2_2(or_367_nl, mux_313_nl, fsm_output[2]);
  assign mux_315_nl = MUX_s_1_2_2(or_tmp_202, mux_314_nl, fsm_output[6]);
  assign mux_316_nl = MUX_s_1_2_2(mux_315_nl, mux_tmp_312, fsm_output[3]);
  assign mux_321_nl = MUX_s_1_2_2(mux_320_nl, mux_316_nl, fsm_output[1]);
  assign mux_323_nl = MUX_s_1_2_2(nand_18_nl, mux_321_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_2_nl = MUX1HOT_s_1_33_2((z_out_6[1]), (VEC_LOOP_acc_1_cse_10_sva[1]),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[1]), (VEC_LOOP_acc_10_cse_3_sva_mx0w2[1]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[0]), (VEC_LOOP_acc_10_cse_4_sva_mx0w3[1]),
      (VEC_LOOP_acc_10_cse_5_sva_mx0w4[1]), (VEC_LOOP_acc_10_cse_6_sva_mx0w5[1]),
      (VEC_LOOP_acc_10_cse_7_sva_mx0w6[1]), (VEC_LOOP_acc_10_cse_8_sva_mx0w7[1]),
      (VEC_LOOP_acc_10_cse_9_sva_mx0w8[1]), (VEC_LOOP_acc_10_cse_10_sva_mx0w9[1]),
      (VEC_LOOP_acc_10_cse_11_sva_mx0w10[1]), (VEC_LOOP_acc_10_cse_12_sva_mx0w11[1]),
      (VEC_LOOP_acc_10_cse_13_sva_mx0w12[1]), (VEC_LOOP_acc_10_cse_14_sva_mx0w13[1]),
      (VEC_LOOP_acc_10_cse_15_sva_mx0w14[1]), (VEC_LOOP_acc_10_cse_16_sva_mx0w15[1]),
      (VEC_LOOP_acc_10_cse_18_sva_mx0w17[1]), (VEC_LOOP_acc_10_cse_19_sva_mx0w18[1]),
      (VEC_LOOP_acc_10_cse_20_sva_mx0w19[1]), (VEC_LOOP_acc_10_cse_21_sva_mx0w20[1]),
      (VEC_LOOP_acc_10_cse_22_sva_mx0w21[1]), (VEC_LOOP_acc_10_cse_23_sva_mx0w22[1]),
      (VEC_LOOP_acc_10_cse_24_sva_mx0w23[1]), (VEC_LOOP_acc_10_cse_25_sva_mx0w24[1]),
      (VEC_LOOP_acc_10_cse_26_sva_mx0w25[1]), (VEC_LOOP_acc_10_cse_27_sva_mx0w26[1]),
      (VEC_LOOP_acc_10_cse_28_sva_mx0w27[1]), (VEC_LOOP_acc_10_cse_29_sva_mx0w28[1]),
      (VEC_LOOP_acc_10_cse_30_sva_mx0w29[1]), (VEC_LOOP_acc_10_cse_31_sva_mx0w30[1]),
      (VEC_LOOP_acc_10_cse_sva_mx0w31[1]), {VEC_LOOP_or_13_cse , (~ mux_323_nl) ,
      and_dcpl_30 , and_dcpl_34 , and_dcpl_36 , and_dcpl_42 , and_dcpl_45 , and_dcpl_50
      , and_dcpl_53 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62 , and_dcpl_64 , and_dcpl_68
      , and_dcpl_70 , and_dcpl_72 , and_dcpl_76 , and_dcpl_78 , and_dcpl_82 , and_dcpl_85
      , and_dcpl_87 , and_dcpl_89 , and_dcpl_92 , and_dcpl_94 , and_dcpl_96 , and_dcpl_98
      , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 , and_dcpl_109 , and_dcpl_111
      , and_dcpl_113 , and_dcpl_115});
  assign or_400_nl = (fsm_output[2]) | (fsm_output[1]) | (~ (fsm_output[4]));
  assign mux_346_nl = MUX_s_1_2_2(or_400_nl, mux_tmp_335, fsm_output[5]);
  assign mux_347_nl = MUX_s_1_2_2(mux_346_nl, or_474_cse, fsm_output[6]);
  assign mux_348_nl = MUX_s_1_2_2(mux_347_nl, mux_tmp_343, fsm_output[7]);
  assign or_401_nl = (fsm_output[8]) | mux_348_nl;
  assign mux_349_nl = MUX_s_1_2_2(mux_tmp_340, or_401_nl, fsm_output[3]);
  assign or_397_nl = (~ (fsm_output[2])) | (~ (fsm_output[1])) | (fsm_output[4]);
  assign mux_341_nl = MUX_s_1_2_2(mux_tmp_335, or_397_nl, fsm_output[5]);
  assign mux_342_nl = MUX_s_1_2_2(or_299_cse, mux_341_nl, fsm_output[6]);
  assign mux_344_nl = MUX_s_1_2_2(mux_tmp_343, mux_342_nl, fsm_output[7]);
  assign or_398_nl = (fsm_output[8]) | mux_344_nl;
  assign mux_345_nl = MUX_s_1_2_2(or_398_nl, mux_tmp_340, fsm_output[3]);
  assign mux_350_nl = MUX_s_1_2_2(mux_349_nl, mux_345_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_4_nl = MUX1HOT_s_1_32_2((z_out_6[0]), (VEC_LOOP_acc_1_cse_10_sva[0]),
      (VEC_LOOP_acc_10_cse_2_sva_mx0w1[0]), (VEC_LOOP_acc_10_cse_3_sva_mx0w2[0]),
      (VEC_LOOP_acc_10_cse_4_sva_mx0w3[0]), (VEC_LOOP_acc_10_cse_5_sva_mx0w4[0]),
      (VEC_LOOP_acc_10_cse_6_sva_mx0w5[0]), (VEC_LOOP_acc_10_cse_7_sva_mx0w6[0]),
      (VEC_LOOP_acc_10_cse_8_sva_mx0w7[0]), (VEC_LOOP_acc_10_cse_9_sva_mx0w8[0]),
      (VEC_LOOP_acc_10_cse_10_sva_mx0w9[0]), (VEC_LOOP_acc_10_cse_11_sva_mx0w10[0]),
      (VEC_LOOP_acc_10_cse_12_sva_mx0w11[0]), (VEC_LOOP_acc_10_cse_13_sva_mx0w12[0]),
      (VEC_LOOP_acc_10_cse_14_sva_mx0w13[0]), (VEC_LOOP_acc_10_cse_15_sva_mx0w14[0]),
      (VEC_LOOP_acc_10_cse_16_sva_mx0w15[0]), (VEC_LOOP_acc_10_cse_18_sva_mx0w17[0]),
      (VEC_LOOP_acc_10_cse_19_sva_mx0w18[0]), (VEC_LOOP_acc_10_cse_20_sva_mx0w19[0]),
      (VEC_LOOP_acc_10_cse_21_sva_mx0w20[0]), (VEC_LOOP_acc_10_cse_22_sva_mx0w21[0]),
      (VEC_LOOP_acc_10_cse_23_sva_mx0w22[0]), (VEC_LOOP_acc_10_cse_24_sva_mx0w23[0]),
      (VEC_LOOP_acc_10_cse_25_sva_mx0w24[0]), (VEC_LOOP_acc_10_cse_26_sva_mx0w25[0]),
      (VEC_LOOP_acc_10_cse_27_sva_mx0w26[0]), (VEC_LOOP_acc_10_cse_28_sva_mx0w27[0]),
      (VEC_LOOP_acc_10_cse_29_sva_mx0w28[0]), (VEC_LOOP_acc_10_cse_30_sva_mx0w29[0]),
      (VEC_LOOP_acc_10_cse_31_sva_mx0w30[0]), (VEC_LOOP_acc_10_cse_sva_mx0w31[0]),
      {VEC_LOOP_or_13_cse , (~ mux_350_nl) , and_dcpl_30 , and_dcpl_34 , and_dcpl_42
      , and_dcpl_45 , and_dcpl_50 , and_dcpl_53 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62
      , and_dcpl_64 , and_dcpl_68 , and_dcpl_70 , and_dcpl_72 , and_dcpl_76 , and_dcpl_78
      , and_dcpl_82 , and_dcpl_85 , and_dcpl_87 , and_dcpl_89 , and_dcpl_92 , and_dcpl_94
      , and_dcpl_96 , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 ,
      and_dcpl_109 , and_dcpl_111 , and_dcpl_113 , and_dcpl_115});
  assign vec_rsci_radr_d = {VEC_LOOP_mux1h_5_nl , VEC_LOOP_mux1h_3_nl , VEC_LOOP_mux1h_1_nl
      , VEC_LOOP_mux1h_nl , VEC_LOOP_mux1h_2_nl , VEC_LOOP_mux1h_4_nl};
  assign and_153_nl = and_dcpl_67 & and_dcpl_20;
  assign mux_414_nl = MUX_s_1_2_2(mux_tmp_411, mux_413_cse, fsm_output[6]);
  assign mux_412_nl = MUX_s_1_2_2(or_471_cse, mux_tmp_411, fsm_output[6]);
  assign mux_415_nl = MUX_s_1_2_2(mux_414_nl, mux_412_nl, fsm_output[3]);
  assign or_465_nl = (~ (fsm_output[3])) | (fsm_output[6]) | (fsm_output[7]) | (~
      (fsm_output[2])) | (fsm_output[5]) | (~ mux_tmp_246);
  assign mux_416_nl = MUX_s_1_2_2(mux_415_nl, or_465_nl, fsm_output[8]);
  assign and_155_nl = (~ mux_416_nl) & (fsm_output[0]);
  assign COMP_LOOP_twiddle_f_mux1h_nl = MUX1HOT_v_9_7_2(COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0,
      (VEC_LOOP_acc_10_cse_1_sva[13:5]), (VEC_LOOP_acc_1_cse_10_sva[13:5]), ({COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9
      , (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[8:4])}), ({COMP_LOOP_13_twiddle_f_mul_psp_sva_11
      , (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:3])}), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[10:2]),
      (COMP_LOOP_17_twiddle_f_mul_psp_sva[9:1]), {and_153_nl , (~ mux_257_itm) ,
      and_155_nl , and_dcpl_126 , and_dcpl_127 , and_dcpl_132 , and_dcpl_133});
  assign or_463_nl = (fsm_output[8:1]!=8'b00000100);
  assign or_461_nl = (~ (fsm_output[2])) | (fsm_output[5]) | (~ (fsm_output[3]))
      | (fsm_output[6]);
  assign mux_404_nl = MUX_s_1_2_2(mux_tmp_400, or_461_nl, fsm_output[7]);
  assign or_462_nl = (fsm_output[8]) | mux_404_nl;
  assign mux_405_nl = MUX_s_1_2_2(mux_tmp_401, or_462_nl, fsm_output[1]);
  assign nor_75_nl = ~((fsm_output[5]) | (~ mux_tmp_136));
  assign mux_402_nl = MUX_s_1_2_2(nor_75_nl, and_tmp_18, fsm_output[2]);
  assign or_460_nl = (fsm_output[8:7]!=2'b00) | (~ mux_402_nl);
  assign mux_403_nl = MUX_s_1_2_2(or_460_nl, mux_tmp_401, fsm_output[1]);
  assign mux_406_nl = MUX_s_1_2_2(mux_405_nl, mux_403_nl, fsm_output[4]);
  assign mux_407_nl = MUX_s_1_2_2(or_463_nl, mux_406_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_9_nl = MUX1HOT_s_1_6_2((VEC_LOOP_acc_1_cse_10_sva[4]), (VEC_LOOP_acc_10_cse_1_sva[4]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[3]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[2]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]), (COMP_LOOP_17_twiddle_f_mul_psp_sva[0]),
      {(~ mux_407_nl) , (~ mux_257_itm) , and_dcpl_126 , and_dcpl_127 , and_dcpl_132
      , and_dcpl_133});
  assign or_732_nl = (fsm_output[5]) | (~ (fsm_output[2])) | (~ (fsm_output[0]))
      | mux_375_cse;
  assign mux_382_nl = MUX_s_1_2_2(mux_tmp_377, or_732_nl, fsm_output[6]);
  assign or_436_nl = (fsm_output[1:0]!=2'b00) | mux_tmp_299;
  assign nand_21_nl = ~((fsm_output[0]) & (~ mux_379_cse));
  assign mux_380_nl = MUX_s_1_2_2(or_436_nl, nand_21_nl, fsm_output[2]);
  assign or_437_nl = (fsm_output[5]) | mux_380_nl;
  assign mux_381_nl = MUX_s_1_2_2(or_437_nl, mux_tmp_377, fsm_output[6]);
  assign mux_383_nl = MUX_s_1_2_2(mux_382_nl, mux_381_nl, fsm_output[3]);
  assign VEC_LOOP_mux1h_7_nl = MUX1HOT_s_1_5_2((VEC_LOOP_acc_1_cse_10_sva[3]), (VEC_LOOP_acc_10_cse_1_sva[3]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[2]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[1]),
      (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]), {(~ mux_383_nl) , (~ mux_257_itm)
      , and_dcpl_126 , and_dcpl_127 , and_dcpl_132});
  assign or_425_nl = (~ (fsm_output[5])) | (fsm_output[8]) | (fsm_output[3]) | (~
      (fsm_output[6]));
  assign mux_371_nl = MUX_s_1_2_2(or_tmp_260, or_425_nl, fsm_output[7]);
  assign mux_372_nl = MUX_s_1_2_2(mux_371_nl, mux_tmp_362, fsm_output[4]);
  assign or_426_nl = (fsm_output[2:1]!=2'b00) | mux_372_nl;
  assign or_422_nl = (fsm_output[7]) | (fsm_output[5]) | (fsm_output[8]) | not_tmp_138;
  assign mux_368_nl = MUX_s_1_2_2(or_tmp_264, or_422_nl, fsm_output[4]);
  assign mux_367_nl = MUX_s_1_2_2(or_tmp_262, or_tmp_264, fsm_output[4]);
  assign mux_369_nl = MUX_s_1_2_2(mux_368_nl, mux_367_nl, fsm_output[1]);
  assign mux_365_nl = MUX_s_1_2_2(mux_tmp_361, or_tmp_262, fsm_output[4]);
  assign mux_363_nl = MUX_s_1_2_2(mux_tmp_362, mux_tmp_361, fsm_output[4]);
  assign mux_366_nl = MUX_s_1_2_2(mux_365_nl, mux_363_nl, fsm_output[1]);
  assign mux_370_nl = MUX_s_1_2_2(mux_369_nl, mux_366_nl, fsm_output[2]);
  assign mux_373_nl = MUX_s_1_2_2(or_426_nl, mux_370_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_6_nl = MUX1HOT_s_1_4_2((VEC_LOOP_acc_1_cse_10_sva[2]), (VEC_LOOP_acc_10_cse_1_sva[2]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[1]), (COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0[0]),
      {(~ mux_373_nl) , (~ mux_257_itm) , and_dcpl_126 , and_dcpl_127});
  assign or_453_nl = (fsm_output[8:6]!=3'b010) | mux_289_cse;
  assign mux_396_nl = MUX_s_1_2_2(or_tmp_295, or_453_nl, fsm_output[4]);
  assign mux_397_nl = MUX_s_1_2_2(mux_tmp_392, mux_396_nl, fsm_output[3]);
  assign or_454_nl = (fsm_output[1]) | mux_397_nl;
  assign mux_393_nl = MUX_s_1_2_2(nand_tmp_23, or_tmp_295, fsm_output[4]);
  assign mux_394_nl = MUX_s_1_2_2(mux_393_nl, mux_tmp_392, fsm_output[3]);
  assign or_447_nl = (fsm_output[7]) | mux_tmp_388;
  assign mux_389_nl = MUX_s_1_2_2(or_447_nl, nand_tmp_23, fsm_output[4]);
  assign or_443_nl = (fsm_output[6]) | (fsm_output[8]) | (~ (fsm_output[2])) | (fsm_output[5]);
  assign mux_386_nl = MUX_s_1_2_2(or_799_cse, or_443_nl, fsm_output[7]);
  assign mux_387_nl = MUX_s_1_2_2(mux_386_nl, mux_tmp_385, fsm_output[4]);
  assign mux_390_nl = MUX_s_1_2_2(mux_389_nl, mux_387_nl, fsm_output[3]);
  assign mux_395_nl = MUX_s_1_2_2(mux_394_nl, mux_390_nl, fsm_output[1]);
  assign mux_398_nl = MUX_s_1_2_2(or_454_nl, mux_395_nl, fsm_output[0]);
  assign VEC_LOOP_mux1h_8_nl = MUX1HOT_s_1_3_2((VEC_LOOP_acc_1_cse_10_sva[1]), (VEC_LOOP_acc_10_cse_1_sva[1]),
      (COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0[0]), {(~ mux_398_nl) , (~ mux_257_itm)
      , and_dcpl_126});
  assign VEC_LOOP_mux_4_nl = MUX_s_1_2_2((VEC_LOOP_acc_10_cse_1_sva[0]), (VEC_LOOP_acc_1_cse_10_sva[0]),
      mux_257_itm);
  assign vec_rsci_wadr_d = {COMP_LOOP_twiddle_f_mux1h_nl , VEC_LOOP_mux1h_9_nl ,
      VEC_LOOP_mux1h_7_nl , VEC_LOOP_mux1h_6_nl , VEC_LOOP_mux1h_8_nl , VEC_LOOP_mux_4_nl};
  assign vec_rsci_we_d_pff = vec_rsci_we_d_iff;
  assign vec_rsci_readA_r_ram_ir_internal_RMASK_B_d = vec_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsci_radr_d = {COMP_LOOP_twiddle_f_mux1h_26_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_10_rmff , COMP_LOOP_twiddle_f_mux1h_5_rmff , COMP_LOOP_twiddle_f_mux1h_13_rmff
      , COMP_LOOP_twiddle_f_mux_rmff};
  assign twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d = twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsci_radr_d = {COMP_LOOP_twiddle_f_mux1h_26_rmff , COMP_LOOP_twiddle_f_and_rmff
      , COMP_LOOP_twiddle_f_mux1h_10_rmff , COMP_LOOP_twiddle_f_mux1h_5_rmff , COMP_LOOP_twiddle_f_mux1h_13_rmff
      , COMP_LOOP_twiddle_f_mux_rmff};
  assign twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d = twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d_reg;
  assign nor_144_cse = ~((fsm_output[7:6]!=2'b00));
  assign and_335_cse = and_dcpl_118 & nor_144_cse;
  assign and_dcpl_293 = and_dcpl_56 & and_dcpl_26 & and_335_cse;
  assign and_dcpl_294 = (~ (fsm_output[8])) & (fsm_output[5]);
  assign and_dcpl_295 = and_dcpl_294 & nor_144_cse;
  assign and_dcpl_300 = and_dcpl_40 & and_dcpl_31 & and_dcpl_295;
  assign and_dcpl_301 = (fsm_output[7:6]==2'b01);
  assign and_dcpl_302 = and_dcpl_118 & and_dcpl_301;
  assign and_dcpl_304 = and_dcpl_56 & and_dcpl_31 & and_dcpl_302;
  assign and_dcpl_305 = and_dcpl_294 & and_dcpl_301;
  assign and_dcpl_308 = and_dcpl_40 & and_295_cse & and_dcpl_305;
  assign and_dcpl_309 = (fsm_output[7:6]==2'b10);
  assign and_dcpl_310 = and_dcpl_118 & and_dcpl_309;
  assign and_dcpl_314 = and_dcpl_51 & and_dcpl_31 & and_dcpl_310;
  assign and_dcpl_315 = and_dcpl_294 & and_dcpl_309;
  assign and_dcpl_319 = and_dcpl_32 & and_dcpl_31 & and_dcpl_315;
  assign and_dcpl_320 = (fsm_output[7:6]==2'b11);
  assign and_dcpl_321 = and_dcpl_118 & and_dcpl_320;
  assign and_dcpl_323 = and_dcpl_51 & and_295_cse & and_dcpl_321;
  assign and_dcpl_324 = and_dcpl_294 & and_dcpl_320;
  assign and_dcpl_326 = and_dcpl_32 & and_295_cse & and_dcpl_324;
  assign and_dcpl_329 = and_dcpl_51 & and_dcpl_21 & and_335_cse;
  assign and_dcpl_332 = and_dcpl_23 & and_dcpl_31 & and_335_cse;
  assign and_dcpl_334 = and_dcpl_32 & and_dcpl_21 & and_dcpl_295;
  assign and_dcpl_337 = and_dcpl_43 & and_295_cse & and_dcpl_295;
  assign and_dcpl_339 = and_dcpl_51 & and_dcpl_26 & and_dcpl_302;
  assign and_dcpl_341 = and_dcpl_23 & and_295_cse & and_dcpl_302;
  assign and_dcpl_343 = and_dcpl_32 & and_dcpl_26 & and_dcpl_305;
  assign and_dcpl_345 = and_dcpl_43 & and_dcpl_21 & and_dcpl_310;
  assign and_dcpl_348 = and_dcpl_47 & and_dcpl_26 & and_dcpl_310;
  assign and_dcpl_350 = and_dcpl_56 & and_295_cse & and_dcpl_310;
  assign and_dcpl_353 = and_dcpl_28 & and_dcpl_26 & and_dcpl_315;
  assign and_dcpl_355 = and_dcpl_40 & and_dcpl_21 & and_dcpl_321;
  assign and_dcpl_357 = and_dcpl_47 & and_dcpl_31 & and_dcpl_321;
  assign and_dcpl_359 = and_dcpl_56 & and_dcpl_21 & and_dcpl_324;
  assign and_dcpl_361 = and_dcpl_28 & and_dcpl_31 & and_dcpl_324;
  assign and_dcpl_365 = and_dcpl_40 & and_dcpl_26 & (fsm_output[8]) & (~ (fsm_output[5]))
      & nor_144_cse;
  assign and_dcpl_367 = and_dcpl_28 & and_295_cse & and_335_cse;
  assign and_dcpl_369 = and_dcpl_28 & and_dcpl_21 & and_dcpl_305;
  assign and_dcpl_371 = and_dcpl_23 & and_dcpl_21 & and_dcpl_315;
  assign and_dcpl_373 = and_dcpl_23 & and_dcpl_26 & and_dcpl_324;
  assign and_dcpl_394 = (fsm_output[2:0]==3'b110);
  assign and_dcpl_401 = ~((fsm_output[2:0]!=3'b000));
  assign and_dcpl_406 = (fsm_output[2:0]==3'b010);
  assign and_dcpl_412 = (fsm_output[2:0]==3'b100);
  assign and_dcpl_444 = (fsm_output[8]) & (~ (fsm_output[5])) & nor_144_cse;
  assign and_dcpl_962 = (fsm_output[2:0]==3'b101);
  assign and_dcpl_964 = and_dcpl_962 & and_dcpl_26 & and_dcpl_118 & (fsm_output[7:6]==2'b01);
  assign and_dcpl_969 = and_dcpl_962 & (fsm_output[4:3]==2'b11) & and_dcpl_118 &
      (fsm_output[7:6]==2'b11);
  assign and_dcpl_975 = (fsm_output[2:0]==3'b011) & and_dcpl_26 & and_dcpl_118 &
      (fsm_output[7:6]==2'b10);
  assign and_dcpl_981 = (fsm_output[2:0]==3'b111);
  assign and_dcpl_982 = and_dcpl_981 & and_dcpl_31;
  assign and_dcpl_983 = and_dcpl_982 & and_335_cse;
  assign and_dcpl_988 = (fsm_output[2:0]==3'b011);
  assign and_dcpl_990 = and_dcpl_988 & and_295_cse & and_dcpl_295;
  assign and_dcpl_993 = and_dcpl_981 & and_295_cse;
  assign and_dcpl_994 = and_dcpl_993 & and_dcpl_302;
  assign and_dcpl_998 = and_dcpl_988 & and_dcpl_21;
  assign and_dcpl_999 = and_dcpl_998 & and_dcpl_118 & and_dcpl_309;
  assign and_dcpl_1001 = and_dcpl_981 & and_dcpl_21;
  assign and_dcpl_1002 = and_dcpl_1001 & and_dcpl_315;
  assign and_dcpl_1007 = and_dcpl_988 & and_dcpl_26 & and_dcpl_321;
  assign and_dcpl_1009 = and_dcpl_981 & and_dcpl_26;
  assign and_dcpl_1010 = and_dcpl_1009 & and_dcpl_324;
  assign and_dcpl_1013 = and_dcpl_988 & and_dcpl_31;
  assign and_dcpl_1014 = and_dcpl_1013 & and_dcpl_444;
  assign and_dcpl_1016 = (fsm_output[2:0]==3'b001);
  assign and_dcpl_1018 = and_dcpl_1016 & and_dcpl_26 & and_dcpl_295;
  assign and_dcpl_1021 = and_dcpl_1016 & and_dcpl_31 & and_dcpl_305;
  assign and_dcpl_1023 = and_dcpl_1016 & and_295_cse & and_dcpl_315;
  assign and_dcpl_1025 = and_dcpl_1016 & and_dcpl_21 & and_dcpl_444;
  assign and_dcpl_1026 = and_dcpl_1009 & and_dcpl_315;
  assign and_dcpl_1027 = and_dcpl_982 & and_dcpl_324;
  assign and_dcpl_1028 = and_dcpl_1013 & and_dcpl_321;
  assign and_dcpl_1029 = and_dcpl_1001 & and_dcpl_305;
  assign and_dcpl_1030 = and_dcpl_998 & and_dcpl_302;
  assign and_dcpl_1031 = and_dcpl_993 & and_335_cse;
  assign mux_tmp_699 = MUX_s_1_2_2(or_277_cse, or_tmp_122, fsm_output[1]);
  assign or_735_nl = (fsm_output[1]) | (fsm_output[7]) | (fsm_output[8]);
  assign mux_tmp_700 = MUX_s_1_2_2(or_735_nl, mux_tmp_699, fsm_output[4]);
  assign or_tmp_551 = (~ (fsm_output[5])) | (fsm_output[2]) | mux_tmp_700;
  assign mux_700_nl = MUX_s_1_2_2(or_380_cse, mux_tmp_700, fsm_output[2]);
  assign mux_701_nl = MUX_s_1_2_2(mux_700_nl, or_410_cse, fsm_output[5]);
  assign mux_tmp_703 = MUX_s_1_2_2(or_tmp_551, mux_701_nl, fsm_output[6]);
  assign mux_tmp_704 = MUX_s_1_2_2(or_354_cse, or_277_cse, fsm_output[1]);
  assign and_dcpl_1053 = and_dcpl_406 & and_dcpl_31 & and_dcpl_444;
  assign and_dcpl_1058 = and_dcpl_43 & and_dcpl_26 & and_dcpl_444;
  assign and_dcpl_1062 = and_dcpl_40 & and_dcpl_21 & and_dcpl_444;
  assign and_dcpl_1069 = and_dcpl_394 & and_dcpl_26 & and_dcpl_324;
  assign and_dcpl_1073 = and_dcpl_406 & and_dcpl_26 & and_dcpl_321;
  assign and_dcpl_1077 = and_dcpl_23 & and_dcpl_21 & and_dcpl_324;
  assign and_dcpl_1081 = and_dcpl_22 & (~ (fsm_output[0])) & and_295_cse & and_dcpl_321;
  assign and_dcpl_1083 = and_dcpl_294 & (fsm_output[7:6]==2'b10);
  assign and_dcpl_1085 = and_dcpl_394 & and_dcpl_21 & and_dcpl_1083;
  assign and_dcpl_1087 = and_dcpl_43 & and_dcpl_21 & and_dcpl_321;
  assign and_dcpl_1089 = and_dcpl_40 & and_295_cse & and_dcpl_1083;
  assign and_dcpl_1093 = and_dcpl_394 & and_295_cse & and_dcpl_302;
  assign and_dcpl_1096 = and_dcpl_40 & and_dcpl_31 & and_dcpl_305;
  assign and_dcpl_1099 = and_dcpl_43 & and_dcpl_31 & and_dcpl_294 & nor_144_cse;
  assign and_dcpl_1101 = and_dcpl_43 & and_295_cse & and_dcpl_305;
  assign and_dcpl_1103 = and_dcpl_23 & and_dcpl_31 & and_dcpl_302;
  assign and_dcpl_1106 = and_dcpl_118 & (fsm_output[7:6]==2'b10);
  assign and_dcpl_1111 = and_dcpl_23 & and_dcpl_31 & and_dcpl_1106;
  assign and_dcpl_1116 = and_dcpl_23 & and_dcpl_21 & and_335_cse;
  assign and_dcpl_1119 = and_dcpl_23 & and_295_cse & and_dcpl_1106;
  assign and_dcpl_1122 = and_dcpl_56 & and_dcpl_31 & and_dcpl_1106;
  assign and_dcpl_1126 = (fsm_output[2:0]==3'b110) & and_dcpl_31 & and_335_cse;
  assign and_dcpl_1131 = and_dcpl_56 & and_dcpl_26 & and_dcpl_118 & (fsm_output[7:6]==2'b01);
  assign and_dcpl_1133 = (~ (fsm_output[8])) & (fsm_output[5]) & nor_144_cse;
  assign and_dcpl_1137 = (fsm_output[2:0]==3'b000) & and_dcpl_26 & and_dcpl_1133;
  assign and_dcpl_1141 = and_dcpl_47 & and_295_cse & and_dcpl_1133;
  assign and_dcpl_1143 = and_dcpl_47 & and_dcpl_21 & and_dcpl_1106;
  assign and_dcpl_1148 = and_dcpl_46 & (fsm_output[0]) & and_295_cse & (fsm_output[8])
      & (~ (fsm_output[5])) & nor_144_cse;
  assign and_dcpl_1150 = and_dcpl_23 & and_dcpl_26 & and_335_cse;
  assign and_dcpl_1158 = and_dcpl_23 & and_dcpl_21 & and_dcpl_118 & nor_144_cse;
  assign and_dcpl_1163 = and_dcpl_23 & (fsm_output[4:3]==2'b10) & and_dcpl_118 &
      (fsm_output[7:6]==2'b10);
  assign and_dcpl_1168 = and_dcpl_22 & (~ (fsm_output[0])) & and_dcpl_21 & (fsm_output[8])
      & (fsm_output[5]) & nor_144_cse;
  assign COMP_LOOP_twiddle_f_or_1_ssc = and_dcpl_332 | and_dcpl_334 | and_dcpl_337
      | and_dcpl_339 | and_dcpl_341 | and_dcpl_343 | and_dcpl_345 | and_dcpl_348
      | and_dcpl_350 | and_dcpl_353 | and_dcpl_355 | and_dcpl_357 | and_dcpl_359
      | and_dcpl_361 | and_dcpl_365;
  assign and_618_ssc = (fsm_output[4:0]==5'b10101) & and_dcpl_118 & (fsm_output[7:6]==2'b10);
  assign nor_208_nl = ~((fsm_output[2]) | nand_63_cse);
  assign mux_tmp_717 = MUX_s_1_2_2(nor_208_nl, and_dcpl_981, fsm_output[5]);
  assign mux_tmp_719 = MUX_s_1_2_2((~ and_dcpl_981), or_785_cse, fsm_output[5]);
  assign or_tmp_567 = (fsm_output[5]) | (~ (fsm_output[2])) | (fsm_output[0]) | (fsm_output[1]);
  assign or_tmp_575 = ~((fsm_output[0]) & (fsm_output[2]) & (fsm_output[1]) & (~
      (fsm_output[8])));
  assign or_765_nl = (~ (fsm_output[0])) | (fsm_output[2]) | (~ (fsm_output[1]))
      | (fsm_output[8]);
  assign mux_tmp_728 = MUX_s_1_2_2(or_765_nl, or_tmp_575, fsm_output[5]);
  assign or_tmp_578 = (fsm_output[0]) | (fsm_output[2]) | (fsm_output[1]) | (fsm_output[8]);
  assign or_tmp_579 = (fsm_output[5]) | (fsm_output[0]) | (~ (fsm_output[2])) | (fsm_output[1])
      | (fsm_output[8]);
  assign or_tmp_595 = (~ (fsm_output[7])) | (fsm_output[1]) | (~((fsm_output[2])
      & (fsm_output[0])));
  assign or_tmp_605 = (~ (fsm_output[6])) | (fsm_output[5]) | (fsm_output[8]);
  assign or_792_nl = (~ (fsm_output[6])) | (~ (fsm_output[5])) | (fsm_output[8]);
  assign mux_tmp_752 = MUX_s_1_2_2(or_tmp_605, or_792_nl, fsm_output[2]);
  assign or_796_nl = (fsm_output[6]) | (~ (fsm_output[5])) | (fsm_output[8]);
  assign mux_tmp_754 = MUX_s_1_2_2(or_796_nl, or_tmp_605, fsm_output[2]);
  assign COMP_LOOP_twiddle_f_nor_itm = ~(and_dcpl_293 | and_dcpl_300 | and_dcpl_304
      | and_dcpl_308 | and_dcpl_314 | and_dcpl_319 | and_dcpl_323 | and_dcpl_326
      | and_dcpl_367 | and_dcpl_369 | and_dcpl_371 | and_dcpl_373);
  assign COMP_LOOP_twiddle_f_or_11_itm = and_dcpl_300 | and_dcpl_304 | and_dcpl_308
      | and_dcpl_314 | and_dcpl_319 | and_dcpl_323 | and_dcpl_326;
  assign COMP_LOOP_twiddle_f_nor_1_itm = ~(and_dcpl_367 | and_dcpl_369 | and_dcpl_371
      | and_dcpl_373);
  assign COMP_LOOP_twiddle_f_or_13_itm = and_dcpl_367 | and_dcpl_369 | and_dcpl_371
      | and_dcpl_373;
  assign COMP_LOOP_twiddle_f_or_18_itm = and_dcpl_329 | and_dcpl_332 | and_dcpl_334
      | and_dcpl_337 | and_dcpl_339 | and_dcpl_341 | and_dcpl_343 | and_dcpl_345
      | and_dcpl_348 | and_dcpl_350 | and_dcpl_353 | and_dcpl_355 | and_dcpl_357
      | and_dcpl_359 | and_dcpl_361 | and_dcpl_365;
  assign VEC_LOOP_or_48_itm = and_dcpl_983 | and_dcpl_990 | and_dcpl_994 | and_dcpl_999
      | and_dcpl_1002 | and_dcpl_1007 | and_dcpl_1010 | and_dcpl_1014;
  assign VEC_LOOP_or_49_itm = and_dcpl_1018 | and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025;
  assign VEC_LOOP_or_59_itm = and_dcpl_1026 | and_dcpl_1027 | and_dcpl_1029 | and_dcpl_1031;
  assign VEC_LOOP_or_61_itm = and_dcpl_1028 | and_dcpl_1030;
  assign VEC_LOOP_or_64_itm = and_dcpl_1018 | and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025
      | and_dcpl_1026 | and_dcpl_1027 | and_dcpl_1029 | and_dcpl_1031;
  assign VEC_LOOP_or_70_itm = and_dcpl_1053 | and_dcpl_1058 | and_dcpl_1062 | and_dcpl_1069
      | and_dcpl_1073 | and_dcpl_1077 | and_dcpl_1081 | and_dcpl_1085 | and_dcpl_1087
      | and_dcpl_1089 | and_dcpl_1093 | and_dcpl_1096 | and_dcpl_1099 | and_dcpl_1101
      | and_dcpl_1103;
  assign VEC_LOOP_or_72_itm = and_dcpl_1119 | and_dcpl_1122 | and_dcpl_1126 | and_dcpl_1131
      | and_dcpl_1137 | and_dcpl_1141 | and_dcpl_1143 | and_dcpl_1150;
  assign VEC_LOOP_or_53_itm = and_dcpl_1116 | and_dcpl_1148;
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      factor2_1_sva <= vec_rsci_q_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_vec_rsci_oswt_1_cse <= 1'b0;
      reg_twiddle_rsci_oswt_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_1_cse <= 1'b0;
    end
    else if ( complete_rsci_wen_comp ) begin
      reg_run_rsci_oswt_cse <= ~(or_dcpl_153 | or_260_cse | (fsm_output[8:5]!=4'b0000));
      reg_vec_rsci_oswt_1_cse <= ~ mux_276_itm;
      reg_twiddle_rsci_oswt_cse <= mux_431_rmff;
      reg_complete_rsci_oswt_cse <= and_dcpl_24 & and_dcpl_37 & (fsm_output[8:7]==2'b10)
          & (~ STAGE_LOOP_acc_itm_4_1);
      reg_vec_rsc_triosy_obj_iswt0_cse <= and_dcpl_100 & and_dcpl_166;
      reg_ensig_cgo_cse <= mux_498_rmff;
      reg_ensig_cgo_1_cse <= ~ mux_533_itm;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((and_dcpl_41 & and_dcpl_20) | STAGE_LOOP_i_3_0_sva_mx0c1)
        ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1110, z_out_28, STAGE_LOOP_i_3_0_sva_mx0c1);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_552_nl ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      run_ac_sync_tmp_dobj_sva <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & (~((~ nor_tmp) | (fsm_output[0]) | or_260_cse
        | (fsm_output[8:5]!=4'b1001))) ) begin
      run_ac_sync_tmp_dobj_sva <= run_rsci_ivld_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_tmp_555 ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( mux_716_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_k_14_5_sva_8_0 <= MUX_v_9_2_2(9'b000000000, (z_out_31[8:0]), COMP_LOOP_k_not_nl);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(mux_559_nl & and_dcpl_20)) ) begin
      COMP_LOOP_1_twiddle_f_acc_cse_sva <= z_out_28;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_561_nl | (fsm_output[8])) ) begin
      COMP_LOOP_17_twiddle_f_mul_psp_sva <= MUX_v_10_2_2(COMP_LOOP_17_twiddle_f_mul_nl,
          (z_out_30[9:0]), and_dcpl_80);
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_727_nl) & complete_rsci_wen_comp ) begin
      COMP_LOOP_11_twiddle_f_mul_psp_sva_12_9 <= COMP_LOOP_twiddle_f_mux1h_40_rgt[12:9];
    end
  end
  always @(posedge clk) begin
    if ( (~ mux_739_nl) & complete_rsci_wen_comp ) begin
      COMP_LOOP_11_twiddle_f_mul_psp_sva_8_0 <= COMP_LOOP_twiddle_f_mux1h_40_rgt[8:0];
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & mux_584_nl ) begin
      COMP_LOOP_2_twiddle_f_lshift_ncse_sva <= COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~ mux_603_nl) ) begin
      COMP_LOOP_twiddle_f_mul_cse_10_sva <= z_out_2;
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_cse ) begin
      COMP_LOOP_twiddle_help_1_sva <= twiddle_h_rsci_q_d_mxwt;
      COMP_LOOP_twiddle_f_1_sva <= twiddle_rsci_q_d_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((~ mux_631_nl) | (~ mux_617_itm) | and_dcpl_30
        | and_dcpl_42 | and_dcpl_50 | and_dcpl_58 | and_dcpl_62 | and_dcpl_68 | and_dcpl_72
        | and_dcpl_78 | and_dcpl_82 | and_dcpl_87 | and_dcpl_92 | and_dcpl_96 | and_dcpl_101
        | and_dcpl_105 | and_dcpl_111 | and_dcpl_115) ) begin
      VEC_LOOP_acc_1_cse_10_sva <= MUX_v_14_2_2(14'b00000000000000, VEC_LOOP_mux_13_nl,
          mux_617_itm);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_j_14_0_1_sva_1 <= 15'b000000000000000;
    end
    else if ( complete_rsci_wen_comp & (~ mux_675_nl) ) begin
      VEC_LOOP_j_14_0_1_sva_1 <= z_out_29;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (and_dcpl_25 | and_dcpl_30 | and_dcpl_34 | and_dcpl_42
        | and_dcpl_45 | and_dcpl_50 | and_dcpl_53 | and_dcpl_58 | and_dcpl_60 | and_dcpl_62
        | and_dcpl_64 | and_dcpl_68 | and_dcpl_70 | and_dcpl_72 | and_dcpl_76 | and_dcpl_78
        | and_dcpl_80 | and_dcpl_82 | and_dcpl_85 | and_dcpl_87 | and_dcpl_89 | and_dcpl_92
        | and_dcpl_94 | and_dcpl_96 | and_dcpl_98 | and_dcpl_101 | and_dcpl_103 |
        and_dcpl_105 | and_dcpl_109 | and_dcpl_111 | and_dcpl_113 | and_dcpl_115)
        ) begin
      VEC_LOOP_acc_10_cse_1_sva <= MUX1HOT_v_14_31_2(z_out_6, VEC_LOOP_acc_10_cse_2_sva_mx0w1,
          VEC_LOOP_acc_10_cse_3_sva_mx0w2, VEC_LOOP_acc_10_cse_4_sva_mx0w3, VEC_LOOP_acc_10_cse_5_sva_mx0w4,
          VEC_LOOP_acc_10_cse_6_sva_mx0w5, VEC_LOOP_acc_10_cse_7_sva_mx0w6, VEC_LOOP_acc_10_cse_8_sva_mx0w7,
          VEC_LOOP_acc_10_cse_9_sva_mx0w8, VEC_LOOP_acc_10_cse_10_sva_mx0w9, VEC_LOOP_acc_10_cse_11_sva_mx0w10,
          VEC_LOOP_acc_10_cse_12_sva_mx0w11, VEC_LOOP_acc_10_cse_13_sva_mx0w12, VEC_LOOP_acc_10_cse_14_sva_mx0w13,
          VEC_LOOP_acc_10_cse_15_sva_mx0w14, VEC_LOOP_acc_10_cse_16_sva_mx0w15, VEC_LOOP_acc_10_cse_18_sva_mx0w17,
          VEC_LOOP_acc_10_cse_19_sva_mx0w18, VEC_LOOP_acc_10_cse_20_sva_mx0w19, VEC_LOOP_acc_10_cse_21_sva_mx0w20,
          VEC_LOOP_acc_10_cse_22_sva_mx0w21, VEC_LOOP_acc_10_cse_23_sva_mx0w22, VEC_LOOP_acc_10_cse_24_sva_mx0w23,
          VEC_LOOP_acc_10_cse_25_sva_mx0w24, VEC_LOOP_acc_10_cse_26_sva_mx0w25, VEC_LOOP_acc_10_cse_27_sva_mx0w26,
          VEC_LOOP_acc_10_cse_28_sva_mx0w27, VEC_LOOP_acc_10_cse_29_sva_mx0w28, VEC_LOOP_acc_10_cse_30_sva_mx0w29,
          VEC_LOOP_acc_10_cse_31_sva_mx0w30, VEC_LOOP_acc_10_cse_sva_mx0w31, {VEC_LOOP_or_13_cse
          , and_dcpl_30 , and_dcpl_34 , and_dcpl_42 , and_dcpl_45 , and_dcpl_50 ,
          and_dcpl_53 , and_dcpl_58 , and_dcpl_60 , and_dcpl_62 , and_dcpl_64 , and_dcpl_68
          , and_dcpl_70 , and_dcpl_72 , and_dcpl_76 , and_dcpl_78 , and_dcpl_82 ,
          and_dcpl_85 , and_dcpl_87 , and_dcpl_89 , and_dcpl_92 , and_dcpl_94 , and_dcpl_96
          , and_dcpl_98 , and_dcpl_101 , and_dcpl_103 , and_dcpl_105 , and_dcpl_109
          , and_dcpl_111 , and_dcpl_113 , and_dcpl_115});
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((~((or_720_cse & and_dcpl_119) | (fsm_output[7:4]!=4'b0000)))
        | (fsm_output[8])) ) begin
      COMP_LOOP_3_twiddle_f_lshift_ncse_sva <= COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_678_nl | (fsm_output[8])) ) begin
      COMP_LOOP_5_twiddle_f_lshift_ncse_sva <= z_out_1;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (mux_681_nl | (fsm_output[8])) ) begin
      COMP_LOOP_9_twiddle_f_lshift_ncse_sva <= z_out_1[10:0];
    end
  end
  always @(posedge clk) begin
    if ( mux_751_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_13_twiddle_f_mul_psp_sva_11 <= COMP_LOOP_twiddle_f_mux1h_65_rgt[11];
    end
  end
  always @(posedge clk) begin
    if ( mux_760_nl & complete_rsci_wen_comp ) begin
      COMP_LOOP_13_twiddle_f_mul_psp_sva_10_0 <= COMP_LOOP_twiddle_f_mux1h_65_rgt[10:0];
    end
  end
  assign nor_63_nl = ~((fsm_output[6:0]!=7'b0000000));
  assign or_589_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[4]) | nor_tmp;
  assign mux_550_nl = MUX_s_1_2_2((fsm_output[6]), or_589_nl, fsm_output[5]);
  assign mux_551_nl = MUX_s_1_2_2(nor_63_nl, mux_550_nl, fsm_output[8]);
  assign mux_552_nl = MUX_s_1_2_2(mux_551_nl, (fsm_output[8]), fsm_output[7]);
  assign COMP_LOOP_k_not_nl = ~ mux_tmp_555;
  assign nor_nl = ~((fsm_output[5]) | (fsm_output[4]) | (fsm_output[3]) | (fsm_output[1]));
  assign and_nl = (fsm_output[5]) & or_260_cse;
  assign mux_nl = MUX_s_1_2_2(nor_nl, and_nl, fsm_output[8]);
  assign and_1246_nl = (fsm_output[8]) & (fsm_output[5]);
  assign mux_715_nl = MUX_s_1_2_2(mux_nl, and_1246_nl, fsm_output[2]);
  assign or_747_nl = (fsm_output[7:6]!=2'b00);
  assign mux_716_nl = MUX_s_1_2_2(mux_715_nl, (fsm_output[8]), or_747_nl);
  assign or_722_nl = (fsm_output[4]) | or_tmp_380;
  assign nand_43_nl = ~((fsm_output[4]) & (fsm_output[0]) & (fsm_output[1]) & (fsm_output[2]));
  assign mux_559_nl = MUX_s_1_2_2(or_722_nl, nand_43_nl, fsm_output[3]);
  assign nl_COMP_LOOP_17_twiddle_f_mul_nl = (z_out[9:0]) * ({COMP_LOOP_k_14_5_sva_8_0
      , 1'b1});
  assign COMP_LOOP_17_twiddle_f_mul_nl = nl_COMP_LOOP_17_twiddle_f_mul_nl[9:0];
  assign nor_121_nl = ~((fsm_output[6:3]!=4'b0000) | or_tmp_380);
  assign nor_61_nl = ~((~ (fsm_output[4])) | (fsm_output[1]) | (~ (fsm_output[2])));
  assign mux_560_nl = MUX_s_1_2_2(nor_61_nl, (fsm_output[4]), fsm_output[3]);
  assign or_731_nl = (fsm_output[6:5]!=2'b00) | mux_560_nl;
  assign mux_561_nl = MUX_s_1_2_2(nor_121_nl, or_731_nl, fsm_output[7]);
  assign or_nl = (fsm_output[1:0]!=2'b10);
  assign mux_724_nl = MUX_s_1_2_2(or_nl, nor_207_cse, fsm_output[2]);
  assign or_762_nl = (fsm_output[5]) | mux_724_nl;
  assign mux_725_nl = MUX_s_1_2_2(or_762_nl, or_tmp_567, fsm_output[3]);
  assign or_763_nl = (fsm_output[8]) | (fsm_output[6]) | mux_725_nl;
  assign or_758_nl = (~ (fsm_output[5])) | (fsm_output[2]) | nand_63_cse;
  assign mux_721_nl = MUX_s_1_2_2(mux_tmp_719, or_758_nl, fsm_output[3]);
  assign mux_720_nl = MUX_s_1_2_2(or_tmp_567, mux_tmp_719, fsm_output[3]);
  assign mux_722_nl = MUX_s_1_2_2(mux_721_nl, mux_720_nl, fsm_output[6]);
  assign or_754_nl = (fsm_output[6]) | (fsm_output[3]) | (fsm_output[5]) | (fsm_output[2])
      | nand_63_cse;
  assign mux_723_nl = MUX_s_1_2_2(mux_722_nl, or_754_nl, fsm_output[8]);
  assign mux_726_nl = MUX_s_1_2_2(or_763_nl, mux_723_nl, fsm_output[4]);
  assign or_802_nl = (fsm_output[3]) | (~ mux_tmp_717);
  assign nand_72_nl = ~((fsm_output[3]) & mux_tmp_717);
  assign mux_718_nl = MUX_s_1_2_2(or_802_nl, nand_72_nl, fsm_output[6]);
  assign or_752_nl = (fsm_output[8]) | mux_718_nl;
  assign mux_727_nl = MUX_s_1_2_2(mux_726_nl, or_752_nl, fsm_output[7]);
  assign or_772_nl = (fsm_output[2]) | (~ (fsm_output[1])) | (fsm_output[8]);
  assign or_771_nl = (~ (fsm_output[2])) | (fsm_output[1]) | (fsm_output[8]);
  assign mux_736_nl = MUX_s_1_2_2(or_772_nl, or_771_nl, fsm_output[0]);
  assign or_773_nl = (fsm_output[5]) | mux_736_nl;
  assign mux_737_nl = MUX_s_1_2_2(or_773_nl, or_tmp_579, fsm_output[3]);
  assign or_774_nl = (fsm_output[6]) | mux_737_nl;
  assign and_1244_nl = (fsm_output[1]) & (fsm_output[8]);
  assign nor_206_nl = ~((~ (fsm_output[1])) | (fsm_output[8]));
  assign mux_732_nl = MUX_s_1_2_2(and_1244_nl, nor_206_nl, fsm_output[2]);
  assign nand_67_nl = ~((fsm_output[0]) & mux_732_nl);
  assign mux_733_nl = MUX_s_1_2_2(nand_67_nl, or_tmp_578, fsm_output[5]);
  assign or_769_nl = (~ (fsm_output[5])) | (~ (fsm_output[0])) | (fsm_output[2])
      | (~ (fsm_output[1])) | (fsm_output[8]);
  assign mux_734_nl = MUX_s_1_2_2(mux_733_nl, or_769_nl, fsm_output[3]);
  assign mux_730_nl = MUX_s_1_2_2(or_tmp_575, or_tmp_578, fsm_output[5]);
  assign mux_731_nl = MUX_s_1_2_2(or_tmp_579, mux_730_nl, fsm_output[3]);
  assign mux_735_nl = MUX_s_1_2_2(mux_734_nl, mux_731_nl, fsm_output[6]);
  assign mux_738_nl = MUX_s_1_2_2(or_774_nl, mux_735_nl, fsm_output[4]);
  assign or_766_nl = (fsm_output[3]) | mux_tmp_728;
  assign nand_66_nl = ~((fsm_output[3]) & (~ mux_tmp_728));
  assign mux_729_nl = MUX_s_1_2_2(or_766_nl, nand_66_nl, fsm_output[6]);
  assign mux_739_nl = MUX_s_1_2_2(mux_738_nl, mux_729_nl, fsm_output[7]);
  assign nor_56_nl = ~((fsm_output[6:2]!=5'b00000));
  assign or_616_nl = (fsm_output[4]) | (fsm_output[0]) | (fsm_output[1]) | (fsm_output[2]);
  assign mux_582_nl = MUX_s_1_2_2((fsm_output[4]), or_616_nl, fsm_output[3]);
  assign or_617_nl = (fsm_output[6:5]!=2'b00) | mux_582_nl;
  assign mux_583_nl = MUX_s_1_2_2(nor_56_nl, or_617_nl, fsm_output[8]);
  assign mux_584_nl = MUX_s_1_2_2(mux_583_nl, (fsm_output[8]), fsm_output[7]);
  assign nand_57_nl = ~(((~ (fsm_output[4])) | (fsm_output[1]) | (fsm_output[0]))
      & (fsm_output[3]));
  assign mux_599_nl = MUX_s_1_2_2(mux_tmp_594, nand_57_nl, fsm_output[6]);
  assign mux_600_nl = MUX_s_1_2_2((~ mux_tmp_593), mux_599_nl, fsm_output[5]);
  assign nand_58_nl = ~(or_720_cse & (fsm_output[3]));
  assign nand_59_nl = ~((fsm_output[0]) & (fsm_output[3]));
  assign mux_595_nl = MUX_s_1_2_2((fsm_output[3]), nand_59_nl, fsm_output[1]);
  assign mux_596_nl = MUX_s_1_2_2(nand_58_nl, mux_595_nl, fsm_output[4]);
  assign mux_597_nl = MUX_s_1_2_2(mux_596_nl, mux_tmp_594, fsm_output[6]);
  assign mux_598_nl = MUX_s_1_2_2(mux_597_nl, (~ mux_tmp_593), fsm_output[5]);
  assign mux_601_nl = MUX_s_1_2_2(mux_600_nl, mux_598_nl, fsm_output[2]);
  assign or_632_nl = (fsm_output[0]) | not_tmp_313;
  assign mux_590_nl = MUX_s_1_2_2((fsm_output[3]), or_632_nl, fsm_output[1]);
  assign or_633_nl = (fsm_output[4]) | mux_590_nl;
  assign mux_591_nl = MUX_s_1_2_2(or_633_nl, mux_tmp_587, fsm_output[6]);
  assign or_634_nl = (fsm_output[5]) | mux_591_nl;
  assign or_631_nl = (fsm_output[6]) | (~ (fsm_output[4])) | (fsm_output[1]) | (fsm_output[0])
      | not_tmp_313;
  assign or_629_nl = (fsm_output[4]) | (~ (fsm_output[1])) | (fsm_output[0]) | not_tmp_313;
  assign mux_588_nl = MUX_s_1_2_2(or_629_nl, mux_tmp_587, fsm_output[6]);
  assign mux_589_nl = MUX_s_1_2_2(or_631_nl, mux_588_nl, fsm_output[5]);
  assign mux_592_nl = MUX_s_1_2_2(or_634_nl, mux_589_nl, fsm_output[2]);
  assign mux_602_nl = MUX_s_1_2_2(mux_601_nl, mux_592_nl, fsm_output[7]);
  assign nor_54_nl = ~((fsm_output[1:0]!=2'b00) | not_tmp_313);
  assign and_294_nl = (fsm_output[1]) & (fsm_output[0]) & (fsm_output[3]);
  assign mux_585_nl = MUX_s_1_2_2(nor_54_nl, and_294_nl, fsm_output[4]);
  assign or_624_nl = (fsm_output[6:5]!=2'b00) | mux_585_nl;
  assign or_620_nl = (fsm_output[6:5]!=2'b00) | and_295_cse;
  assign mux_586_nl = MUX_s_1_2_2(or_624_nl, or_620_nl, fsm_output[2]);
  assign nor_53_nl = ~((fsm_output[7]) | mux_586_nl);
  assign mux_603_nl = MUX_s_1_2_2(mux_602_nl, nor_53_nl, fsm_output[8]);
  assign and_1248_nl = and_dcpl_401 & and_dcpl_21 & and_dcpl_295;
  assign and_1249_nl = and_dcpl_406 & and_dcpl_31 & and_dcpl_295;
  assign and_1250_nl = and_dcpl_412 & and_dcpl_21 & and_dcpl_302;
  assign and_1251_nl = and_dcpl_394 & and_dcpl_31 & and_dcpl_302;
  assign and_1252_nl = and_dcpl_401 & and_dcpl_26 & and_dcpl_305;
  assign and_1253_nl = and_dcpl_406 & and_295_cse & and_dcpl_305;
  assign and_1254_nl = and_dcpl_412 & and_dcpl_26 & and_dcpl_310;
  assign and_1255_nl = and_dcpl_394 & and_295_cse & and_dcpl_310;
  assign and_1256_nl = and_dcpl_401 & and_dcpl_31 & and_dcpl_294 & and_dcpl_309;
  assign and_1257_nl = and_dcpl_406 & and_dcpl_21 & and_dcpl_321;
  assign and_1258_nl = and_dcpl_412 & and_dcpl_31 & and_dcpl_321;
  assign and_1259_nl = and_dcpl_394 & and_dcpl_21 & and_dcpl_324;
  assign and_1260_nl = and_dcpl_401 & and_295_cse & and_dcpl_324;
  assign and_1261_nl = and_dcpl_406 & and_dcpl_26 & and_dcpl_444;
  assign VEC_LOOP_mux1h_48_nl = MUX1HOT_v_4_14_2(4'b1110, 4'b1101, 4'b1100, 4'b1011,
      4'b1010, 4'b1001, 4'b1000, 4'b0111, 4'b0110, 4'b0101, 4'b0100, 4'b0011, 4'b0010,
      4'b0001, {and_1248_nl , and_1249_nl , and_1250_nl , and_1251_nl , and_1252_nl
      , and_1253_nl , and_1254_nl , and_1255_nl , and_1256_nl , and_1257_nl , and_1258_nl
      , and_1259_nl , and_1260_nl , and_1261_nl});
  assign and_1262_nl = and_dcpl_394 & and_dcpl_26 & and_dcpl_118 & nor_144_cse;
  assign VEC_LOOP_nor_19_nl = ~(MUX_v_4_2_2(VEC_LOOP_mux1h_48_nl, 4'b1111, and_1262_nl));
  assign and_1263_nl = and_dcpl_412 & and_295_cse & and_dcpl_444;
  assign VEC_LOOP_or_74_nl = MUX_v_4_2_2(VEC_LOOP_nor_19_nl, 4'b1111, and_1263_nl);
  assign nl_VEC_LOOP_acc_nl = VEC_LOOP_acc_1_cse_10_sva + ({COMP_LOOP_k_14_5_sva_8_0
      , VEC_LOOP_or_74_nl , 1'b1});
  assign VEC_LOOP_acc_nl = nl_VEC_LOOP_acc_nl[13:0];
  assign VEC_LOOP_or_nl = and_dcpl_30 | and_dcpl_42 | and_dcpl_50 | and_dcpl_58 |
      and_dcpl_62 | and_dcpl_68 | and_dcpl_72 | and_dcpl_78 | and_dcpl_82 | and_dcpl_87
      | and_dcpl_92 | and_dcpl_96 | and_dcpl_101 | and_dcpl_105 | and_dcpl_111 |
      and_dcpl_115;
  assign VEC_LOOP_mux_13_nl = MUX_v_14_2_2((VEC_LOOP_j_14_0_1_sva_1[13:0]), VEC_LOOP_acc_nl,
      VEC_LOOP_or_nl);
  assign or_665_nl = (fsm_output[2]) | (fsm_output[5]) | (~ mux_tmp_246);
  assign mux_627_nl = MUX_s_1_2_2(or_473_cse, or_665_nl, fsm_output[8]);
  assign mux_628_nl = MUX_s_1_2_2(mux_627_nl, or_tmp_493, fsm_output[7]);
  assign mux_629_nl = MUX_s_1_2_2(mux_628_nl, or_tmp_363, fsm_output[6]);
  assign mux_630_nl = MUX_s_1_2_2(mux_tmp_623, mux_629_nl, fsm_output[3]);
  assign or_662_nl = (fsm_output[2]) | mux_tmp_243;
  assign mux_624_nl = MUX_s_1_2_2(nand_10_cse, or_662_nl, fsm_output[8]);
  assign mux_625_nl = MUX_s_1_2_2(mux_624_nl, or_tmp_489, fsm_output[7]);
  assign or_663_nl = (fsm_output[6]) | mux_625_nl;
  assign mux_626_nl = MUX_s_1_2_2(or_663_nl, mux_tmp_623, fsm_output[3]);
  assign mux_631_nl = MUX_s_1_2_2(mux_630_nl, mux_626_nl, fsm_output[0]);
  assign mux_674_nl = MUX_s_1_2_2(mux_tmp_664, mux_543_cse, fsm_output[3]);
  assign mux_667_nl = MUX_s_1_2_2(mux_379_cse, mux_539_cse, fsm_output[2]);
  assign mux_668_nl = MUX_s_1_2_2(mux_667_nl, or_410_cse, fsm_output[5]);
  assign mux_669_nl = MUX_s_1_2_2(mux_668_nl, or_tmp_363, fsm_output[6]);
  assign mux_670_nl = MUX_s_1_2_2(mux_669_nl, mux_tmp_664, fsm_output[3]);
  assign mux_675_nl = MUX_s_1_2_2(mux_674_nl, mux_670_nl, fsm_output[0]);
  assign and_290_nl = (fsm_output[4]) & (fsm_output[1]) & (fsm_output[2]);
  assign mux_677_nl = MUX_s_1_2_2(and_290_nl, (fsm_output[4]), fsm_output[3]);
  assign nor_119_nl = ~((fsm_output[6:5]!=2'b00) | mux_677_nl);
  assign or_608_nl = (fsm_output[4]) | nor_tmp;
  assign mux_676_nl = MUX_s_1_2_2((fsm_output[4]), or_608_nl, fsm_output[3]);
  assign and_320_nl = (fsm_output[6:5]==2'b11) & mux_676_nl;
  assign mux_678_nl = MUX_s_1_2_2(nor_119_nl, and_320_nl, fsm_output[7]);
  assign nor_51_nl = ~((fsm_output[6:5]!=2'b00) | and_dcpl_63);
  assign or_43_nl = (fsm_output[4]) | (fsm_output[1]) | (fsm_output[2]);
  assign mux_679_nl = MUX_s_1_2_2((fsm_output[4]), or_43_nl, fsm_output[3]);
  assign and_278_nl = (fsm_output[6]) & mux_679_nl;
  assign mux_680_nl = MUX_s_1_2_2(and_278_nl, (fsm_output[6]), fsm_output[5]);
  assign mux_681_nl = MUX_s_1_2_2(nor_51_nl, mux_680_nl, fsm_output[7]);
  assign or_789_nl = (fsm_output[7]) | (fsm_output[1]) | (fsm_output[2]) | (~ (fsm_output[0]));
  assign mux_748_nl = MUX_s_1_2_2(or_tmp_595, or_789_nl, fsm_output[3]);
  assign and_1243_nl = (fsm_output[5]) & (~ mux_748_nl);
  assign nor_200_nl = ~((fsm_output[7]) | nor_201_cse);
  assign mux_745_nl = MUX_s_1_2_2(or_713_cse, or_785_cse, fsm_output[7]);
  assign mux_746_nl = MUX_s_1_2_2(nor_200_nl, mux_745_nl, fsm_output[3]);
  assign or_784_nl = (fsm_output[7]) | (~ (fsm_output[1])) | (~ (fsm_output[2]))
      | (fsm_output[0]);
  assign mux_744_nl = MUX_s_1_2_2(or_784_nl, or_tmp_595, fsm_output[3]);
  assign mux_747_nl = MUX_s_1_2_2(mux_746_nl, (~ mux_744_nl), fsm_output[5]);
  assign mux_749_nl = MUX_s_1_2_2(and_1243_nl, mux_747_nl, fsm_output[6]);
  assign nor_202_nl = ~((~ (fsm_output[3])) | (fsm_output[7]) | (~ (fsm_output[1]))
      | (~ (fsm_output[2])) | (fsm_output[0]));
  assign nor_203_nl = ~((~ (fsm_output[3])) | (~ (fsm_output[7])) | (fsm_output[1])
      | (fsm_output[2]) | (~ (fsm_output[0])));
  assign mux_742_nl = MUX_s_1_2_2(nor_202_nl, nor_203_nl, fsm_output[5]);
  assign and_1239_nl = (fsm_output[7]) & or_713_cse;
  assign mux_740_nl = MUX_s_1_2_2((fsm_output[7]), and_1239_nl, fsm_output[3]);
  assign nor_204_nl = ~((fsm_output[3]) | (fsm_output[7]) | (fsm_output[1]) | (fsm_output[2])
      | (~ (fsm_output[0])));
  assign mux_741_nl = MUX_s_1_2_2(mux_740_nl, nor_204_nl, fsm_output[5]);
  assign mux_743_nl = MUX_s_1_2_2(mux_742_nl, mux_741_nl, fsm_output[6]);
  assign mux_750_nl = MUX_s_1_2_2(mux_749_nl, mux_743_nl, fsm_output[4]);
  assign nor_205_nl = ~((fsm_output[7:0]!=8'b00000001));
  assign mux_751_nl = MUX_s_1_2_2(mux_750_nl, nor_205_nl, fsm_output[8]);
  assign or_801_nl = (fsm_output[2]) | (fsm_output[6]) | (fsm_output[5]) | (~ (fsm_output[8]));
  assign mux_757_nl = MUX_s_1_2_2(or_801_nl, or_799_cse, fsm_output[4]);
  assign or_798_nl = (fsm_output[4]) | mux_tmp_754;
  assign mux_758_nl = MUX_s_1_2_2(mux_757_nl, or_798_nl, fsm_output[3]);
  assign or_797_nl = (fsm_output[4]) | (~ (fsm_output[2])) | (fsm_output[6]) | (~
      (fsm_output[5])) | (fsm_output[8]);
  assign mux_755_nl = MUX_s_1_2_2(mux_tmp_752, mux_tmp_754, fsm_output[4]);
  assign mux_756_nl = MUX_s_1_2_2(or_797_nl, mux_755_nl, fsm_output[3]);
  assign mux_759_nl = MUX_s_1_2_2(mux_758_nl, mux_756_nl, fsm_output[7]);
  assign and_1242_nl = (fsm_output[0]) & (~ mux_759_nl);
  assign or_794_nl = (fsm_output[4]) | mux_tmp_752;
  assign or_791_nl = (~ (fsm_output[4])) | (~ (fsm_output[2])) | (fsm_output[6])
      | (fsm_output[5]) | (fsm_output[8]);
  assign mux_753_nl = MUX_s_1_2_2(or_794_nl, or_791_nl, fsm_output[3]);
  assign nor_199_nl = ~((fsm_output[0]) | (fsm_output[7]) | mux_753_nl);
  assign mux_760_nl = MUX_s_1_2_2(and_1242_nl, nor_199_nl, fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux_11_nl = MUX_s_1_2_2((COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[13]),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[13]), COMP_LOOP_twiddle_f_or_1_ssc);
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl = COMP_LOOP_twiddle_f_mux_11_nl
      & COMP_LOOP_twiddle_f_nor_itm;
  assign COMP_LOOP_twiddle_f_mux1h_126_nl = MUX1HOT_s_1_4_2((COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1[12]),
      (COMP_LOOP_3_twiddle_f_lshift_ncse_sva[12]), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[12]),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[12]), {and_dcpl_293 , COMP_LOOP_twiddle_f_or_11_itm
      , and_dcpl_329 , COMP_LOOP_twiddle_f_or_1_ssc});
  assign COMP_LOOP_twiddle_f_and_18_nl = COMP_LOOP_twiddle_f_mux1h_126_nl & COMP_LOOP_twiddle_f_nor_1_itm;
  assign COMP_LOOP_twiddle_f_mux1h_127_nl = MUX1HOT_v_12_5_2((COMP_LOOP_3_twiddle_f_lshift_ncse_sva_1[11:0]),
      (COMP_LOOP_3_twiddle_f_lshift_ncse_sva[11:0]), (COMP_LOOP_2_twiddle_f_lshift_ncse_sva_1[11:0]),
      (COMP_LOOP_2_twiddle_f_lshift_ncse_sva[11:0]), COMP_LOOP_5_twiddle_f_lshift_ncse_sva,
      {and_dcpl_293 , COMP_LOOP_twiddle_f_or_11_itm , and_dcpl_329 , COMP_LOOP_twiddle_f_or_1_ssc
      , COMP_LOOP_twiddle_f_or_13_itm});
  assign COMP_LOOP_twiddle_f_and_19_nl = (COMP_LOOP_k_14_5_sva_8_0[8]) & COMP_LOOP_twiddle_f_nor_itm;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl = MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0[8]),
      (COMP_LOOP_k_14_5_sva_8_0[7]), COMP_LOOP_twiddle_f_or_18_itm);
  assign COMP_LOOP_twiddle_f_and_20_nl = COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_5_nl
      & COMP_LOOP_twiddle_f_nor_1_itm;
  assign COMP_LOOP_twiddle_f_or_25_nl = and_dcpl_293 | and_dcpl_300 | and_dcpl_304
      | and_dcpl_308 | and_dcpl_314 | and_dcpl_319 | and_dcpl_323 | and_dcpl_326;
  assign COMP_LOOP_twiddle_f_mux1h_128_nl = MUX1HOT_v_7_3_2((COMP_LOOP_k_14_5_sva_8_0[7:1]),
      (COMP_LOOP_k_14_5_sva_8_0[6:0]), (COMP_LOOP_k_14_5_sva_8_0[8:2]), {COMP_LOOP_twiddle_f_or_25_nl
      , COMP_LOOP_twiddle_f_or_18_itm , COMP_LOOP_twiddle_f_or_13_itm});
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl = MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0[0]),
      (COMP_LOOP_k_14_5_sva_8_0[1]), COMP_LOOP_twiddle_f_or_13_itm);
  assign COMP_LOOP_twiddle_f_or_26_nl = (COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_mux_6_nl
      & (~(and_dcpl_329 | and_dcpl_332 | and_dcpl_334 | and_dcpl_337 | and_dcpl_339
      | and_dcpl_341 | and_dcpl_343 | and_dcpl_345))) | and_dcpl_348 | and_dcpl_350
      | and_dcpl_353 | and_dcpl_355 | and_dcpl_357 | and_dcpl_359 | and_dcpl_361
      | and_dcpl_365;
  assign COMP_LOOP_twiddle_f_or_27_nl = ((COMP_LOOP_k_14_5_sva_8_0[0]) & (~(and_dcpl_293
      | and_dcpl_300 | and_dcpl_304 | and_dcpl_308 | and_dcpl_329 | and_dcpl_332
      | and_dcpl_334 | and_dcpl_337 | and_dcpl_348 | and_dcpl_350 | and_dcpl_353
      | and_dcpl_355))) | and_dcpl_314 | and_dcpl_319 | and_dcpl_323 | and_dcpl_326
      | and_dcpl_339 | and_dcpl_341 | and_dcpl_343 | and_dcpl_345 | and_dcpl_357
      | and_dcpl_359 | and_dcpl_361 | and_dcpl_365;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl = (~(and_dcpl_293 | and_dcpl_300
      | and_dcpl_314 | and_dcpl_319 | and_dcpl_329 | and_dcpl_332 | and_dcpl_339
      | and_dcpl_341 | and_dcpl_348 | and_dcpl_350 | and_dcpl_357 | and_dcpl_359
      | and_dcpl_367 | and_dcpl_369)) | and_dcpl_304 | and_dcpl_308 | and_dcpl_323
      | and_dcpl_326 | and_dcpl_334 | and_dcpl_337 | and_dcpl_343 | and_dcpl_345
      | and_dcpl_353 | and_dcpl_355 | and_dcpl_361 | and_dcpl_365 | and_dcpl_371
      | and_dcpl_373;
  assign COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl = (~(and_dcpl_293 | and_dcpl_304
      | and_dcpl_314 | and_dcpl_323 | and_dcpl_329 | and_dcpl_334 | and_dcpl_339
      | and_dcpl_343 | and_dcpl_348 | and_dcpl_353 | and_dcpl_357 | and_dcpl_361
      | and_dcpl_367 | and_dcpl_371)) | and_dcpl_300 | and_dcpl_308 | and_dcpl_319
      | and_dcpl_326 | and_dcpl_332 | and_dcpl_337 | and_dcpl_341 | and_dcpl_345
      | and_dcpl_350 | and_dcpl_355 | and_dcpl_359 | and_dcpl_365 | and_dcpl_369
      | and_dcpl_373;
  assign nl_z_out_2 = ({COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_and_3_nl , COMP_LOOP_twiddle_f_and_18_nl
      , COMP_LOOP_twiddle_f_mux1h_127_nl}) * ({COMP_LOOP_twiddle_f_and_19_nl , COMP_LOOP_twiddle_f_and_20_nl
      , COMP_LOOP_twiddle_f_mux1h_128_nl , COMP_LOOP_twiddle_f_or_26_nl , COMP_LOOP_twiddle_f_or_27_nl
      , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_2_nl , COMP_LOOP_twiddle_f_COMP_LOOP_twiddle_f_or_3_nl
      , 1'b1});
  assign z_out_2 = nl_z_out_2[13:0];
  assign and_1264_nl = and_dcpl_28 & and_dcpl_26 & and_335_cse;
  assign and_1265_nl = and_dcpl_32 & and_dcpl_31 & and_335_cse;
  assign and_1266_nl = and_dcpl_40 & and_dcpl_21 & and_dcpl_295;
  assign and_1267_nl = and_dcpl_43 & and_dcpl_26 & and_dcpl_295;
  assign and_1268_nl = and_dcpl_47 & and_dcpl_31 & and_dcpl_295;
  assign and_1269_nl = and_dcpl_51 & and_295_cse & and_dcpl_295;
  assign and_1270_nl = and_dcpl_56 & and_dcpl_21 & and_dcpl_302;
  assign and_1271_nl = and_dcpl_23 & and_dcpl_26 & and_dcpl_302;
  assign and_1272_nl = and_dcpl_28 & and_dcpl_31 & and_dcpl_302;
  assign and_1273_nl = and_dcpl_32 & and_295_cse & and_dcpl_302;
  assign and_1274_nl = and_dcpl_40 & and_dcpl_26 & and_dcpl_305;
  assign and_1275_nl = and_dcpl_43 & and_dcpl_31 & and_dcpl_305;
  assign and_1276_nl = and_dcpl_47 & and_295_cse & and_dcpl_305;
  assign and_1277_nl = and_dcpl_51 & and_dcpl_21 & and_dcpl_310;
  assign and_1278_nl = and_dcpl_56 & and_dcpl_26 & and_dcpl_310;
  assign and_1279_nl = and_dcpl_28 & and_295_cse & and_dcpl_310;
  assign and_1280_nl = and_dcpl_32 & and_dcpl_21 & and_dcpl_315;
  assign and_1281_nl = and_dcpl_40 & and_dcpl_31 & and_dcpl_315;
  assign and_1282_nl = and_dcpl_43 & and_295_cse & and_dcpl_315;
  assign and_1283_nl = and_dcpl_47 & and_dcpl_21 & and_dcpl_321;
  assign and_1284_nl = and_dcpl_51 & and_dcpl_26 & and_dcpl_321;
  assign and_1285_nl = and_dcpl_56 & and_dcpl_31 & and_dcpl_321;
  assign and_1286_nl = and_dcpl_23 & and_295_cse & and_dcpl_321;
  assign and_1287_nl = and_dcpl_28 & and_dcpl_21 & and_dcpl_324;
  assign and_1288_nl = and_dcpl_32 & and_dcpl_26 & and_dcpl_324;
  assign and_1289_nl = and_dcpl_40 & and_295_cse & and_dcpl_324;
  assign and_1290_nl = and_dcpl_43 & and_dcpl_21 & and_dcpl_444;
  assign and_1291_nl = and_dcpl_47 & and_dcpl_26 & and_dcpl_444;
  assign and_1292_nl = and_dcpl_51 & and_dcpl_31 & and_dcpl_444;
  assign VEC_LOOP_mux1h_49_nl = MUX1HOT_v_5_29_2(5'b00001, 5'b00010, 5'b00011, 5'b00100,
      5'b00101, 5'b00110, 5'b00111, 5'b01000, 5'b01001, 5'b01010, 5'b01011, 5'b01100,
      5'b01101, 5'b01110, 5'b01111, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101,
      5'b10110, 5'b10111, 5'b11000, 5'b11001, 5'b11010, 5'b11011, 5'b11100, 5'b11101,
      5'b11110, {and_1264_nl , and_1265_nl , and_1266_nl , and_1267_nl , and_1268_nl
      , and_1269_nl , and_1270_nl , and_1271_nl , and_1272_nl , and_1273_nl , and_1274_nl
      , and_1275_nl , and_1276_nl , and_1277_nl , and_1278_nl , and_1279_nl , and_1280_nl
      , and_1281_nl , and_1282_nl , and_1283_nl , and_1284_nl , and_1285_nl , and_1286_nl
      , and_1287_nl , and_1288_nl , and_1289_nl , and_1290_nl , and_1291_nl , and_1292_nl});
  assign and_1293_nl = and_dcpl_56 & and_295_cse & and_dcpl_444;
  assign VEC_LOOP_or_75_nl = MUX_v_5_2_2(VEC_LOOP_mux1h_49_nl, 5'b11111, and_1293_nl);
  assign nl_z_out_5 = ({COMP_LOOP_k_14_5_sva_8_0 , VEC_LOOP_or_75_nl}) + (STAGE_LOOP_lshift_psp_sva[14:1]);
  assign z_out_5 = nl_z_out_5[13:0];
  assign VEC_LOOP_mux_16_nl = MUX_v_9_2_2((z_out_31[8:0]), (z_out_31[9:1]), and_618_ssc);
  assign VEC_LOOP_mux_17_nl = MUX_s_1_2_2((STAGE_LOOP_lshift_psp_sva[5]), (z_out_31[0]),
      and_618_ssc);
  assign nl_z_out_6 = ({VEC_LOOP_mux_16_nl , VEC_LOOP_mux_17_nl , (STAGE_LOOP_lshift_psp_sva[4:1])})
      + VEC_LOOP_acc_1_cse_10_sva;
  assign z_out_6 = nl_z_out_6[13:0];
  assign VEC_LOOP_VEC_LOOP_mux_7_nl = MUX_v_11_2_2((VEC_LOOP_acc_1_cse_10_sva[13:3]),
      ({1'b1 , (~ (STAGE_LOOP_lshift_psp_sva[14:5]))}), and_dcpl_975);
  assign VEC_LOOP_or_76_nl = (~(and_dcpl_964 | and_dcpl_969)) | and_dcpl_975;
  assign VEC_LOOP_VEC_LOOP_mux_8_nl = MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ({1'b0
      , (COMP_LOOP_k_14_5_sva_8_0[8:1])}), and_dcpl_975);
  assign VEC_LOOP_VEC_LOOP_or_14_nl = ((COMP_LOOP_k_14_5_sva_8_0[0]) & (~ and_dcpl_964))
      | and_dcpl_969;
  assign VEC_LOOP_VEC_LOOP_or_15_nl = (~ and_dcpl_975) | and_dcpl_964 | and_dcpl_969;
  assign nl_acc_22_nl = ({VEC_LOOP_VEC_LOOP_mux_7_nl , VEC_LOOP_or_76_nl}) + ({VEC_LOOP_VEC_LOOP_mux_8_nl
      , VEC_LOOP_VEC_LOOP_or_14_nl , VEC_LOOP_VEC_LOOP_or_15_nl , 1'b1});
  assign acc_22_nl = nl_acc_22_nl[11:0];
  assign z_out_26 = readslicef_12_11_1(acc_22_nl);
  assign VEC_LOOP_VEC_LOOP_or_16_nl = ((VEC_LOOP_acc_1_cse_10_sva[13]) & (~(and_dcpl_1018
      | and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025 | and_dcpl_1028 | and_dcpl_1030)))
      | and_dcpl_1026 | and_dcpl_1027 | and_dcpl_1029 | and_dcpl_1031;
  assign VEC_LOOP_mux1h_50_nl = MUX1HOT_s_1_3_2((VEC_LOOP_acc_1_cse_10_sva[12]),
      (VEC_LOOP_acc_1_cse_10_sva[13]), (~ (STAGE_LOOP_lshift_psp_sva[14])), {VEC_LOOP_or_48_itm
      , VEC_LOOP_or_49_itm , VEC_LOOP_or_59_itm});
  assign VEC_LOOP_or_77_nl = VEC_LOOP_mux1h_50_nl | and_dcpl_1028 | and_dcpl_1030;
  assign VEC_LOOP_mux1h_51_nl = MUX1HOT_v_11_4_2((VEC_LOOP_acc_1_cse_10_sva[11:1]),
      (VEC_LOOP_acc_1_cse_10_sva[12:2]), (~ (STAGE_LOOP_lshift_psp_sva[13:3])), (~
      (STAGE_LOOP_lshift_psp_sva[14:4])), {VEC_LOOP_or_48_itm , VEC_LOOP_or_49_itm
      , VEC_LOOP_or_59_itm , VEC_LOOP_or_61_itm});
  assign VEC_LOOP_or_78_nl = (~(and_dcpl_983 | and_dcpl_990 | and_dcpl_994 | and_dcpl_999
      | and_dcpl_1002 | and_dcpl_1007 | and_dcpl_1010 | and_dcpl_1014 | and_dcpl_1018
      | and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025)) | and_dcpl_1026 | and_dcpl_1027
      | and_dcpl_1028 | and_dcpl_1029 | and_dcpl_1030 | and_dcpl_1031;
  assign VEC_LOOP_and_17_nl = (COMP_LOOP_k_14_5_sva_8_0[8]) & (~(and_dcpl_1018 |
      and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025 | and_dcpl_1026 | and_dcpl_1027
      | and_dcpl_1028 | and_dcpl_1029 | and_dcpl_1030 | and_dcpl_1031));
  assign VEC_LOOP_VEC_LOOP_mux_9_nl = MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0[7]),
      (COMP_LOOP_k_14_5_sva_8_0[8]), VEC_LOOP_or_64_itm);
  assign VEC_LOOP_and_18_nl = VEC_LOOP_VEC_LOOP_mux_9_nl & (~(and_dcpl_1028 | and_dcpl_1030));
  assign VEC_LOOP_mux1h_52_nl = MUX1HOT_v_7_3_2((COMP_LOOP_k_14_5_sva_8_0[6:0]),
      (COMP_LOOP_k_14_5_sva_8_0[7:1]), (COMP_LOOP_k_14_5_sva_8_0[8:2]), {VEC_LOOP_or_48_itm
      , VEC_LOOP_or_64_itm , VEC_LOOP_or_61_itm});
  assign VEC_LOOP_VEC_LOOP_mux_10_nl = MUX_s_1_2_2((COMP_LOOP_k_14_5_sva_8_0[0]),
      (COMP_LOOP_k_14_5_sva_8_0[1]), VEC_LOOP_or_61_itm);
  assign VEC_LOOP_or_79_nl = (VEC_LOOP_VEC_LOOP_mux_10_nl & (~(and_dcpl_983 | and_dcpl_990
      | and_dcpl_994 | and_dcpl_999))) | and_dcpl_1002 | and_dcpl_1007 | and_dcpl_1010
      | and_dcpl_1014;
  assign VEC_LOOP_VEC_LOOP_or_17_nl = ((COMP_LOOP_k_14_5_sva_8_0[0]) & (~(and_dcpl_983
      | and_dcpl_990 | and_dcpl_1002 | and_dcpl_1007 | and_dcpl_1018 | and_dcpl_1021
      | and_dcpl_1029 | and_dcpl_1031))) | and_dcpl_994 | and_dcpl_999 | and_dcpl_1010
      | and_dcpl_1014 | and_dcpl_1023 | and_dcpl_1025 | and_dcpl_1026 | and_dcpl_1027;
  assign VEC_LOOP_VEC_LOOP_or_18_nl = (~(and_dcpl_983 | and_dcpl_994 | and_dcpl_1002
      | and_dcpl_1010 | and_dcpl_1018 | and_dcpl_1023 | and_dcpl_1026 | and_dcpl_1030
      | and_dcpl_1031)) | and_dcpl_990 | and_dcpl_999 | and_dcpl_1007 | and_dcpl_1014
      | and_dcpl_1021 | and_dcpl_1025 | and_dcpl_1027 | and_dcpl_1028 | and_dcpl_1029;
  assign VEC_LOOP_VEC_LOOP_or_19_nl = (~(and_dcpl_1026 | and_dcpl_1027 | and_dcpl_1028
      | and_dcpl_1029 | and_dcpl_1030 | and_dcpl_1031)) | and_dcpl_983 | and_dcpl_990
      | and_dcpl_994 | and_dcpl_999 | and_dcpl_1002 | and_dcpl_1007 | and_dcpl_1010
      | and_dcpl_1014 | and_dcpl_1018 | and_dcpl_1021 | and_dcpl_1023 | and_dcpl_1025;
  assign nl_acc_23_nl = ({VEC_LOOP_VEC_LOOP_or_16_nl , VEC_LOOP_or_77_nl , VEC_LOOP_mux1h_51_nl
      , VEC_LOOP_or_78_nl}) + ({VEC_LOOP_and_17_nl , VEC_LOOP_and_18_nl , VEC_LOOP_mux1h_52_nl
      , VEC_LOOP_or_79_nl , VEC_LOOP_VEC_LOOP_or_17_nl , VEC_LOOP_VEC_LOOP_or_18_nl
      , VEC_LOOP_VEC_LOOP_or_19_nl , 1'b1});
  assign acc_23_nl = nl_acc_23_nl[13:0];
  assign z_out_27 = readslicef_14_13_1(acc_23_nl);
  assign and_1294_nl = (fsm_output[2:0]==3'b010) & and_dcpl_21 & and_dcpl_118 & nor_144_cse;
  assign STAGE_LOOP_mux_3_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      and_1294_nl);
  assign nl_z_out_28 = STAGE_LOOP_mux_3_nl + 4'b1111;
  assign z_out_28 = nl_z_out_28[3:0];
  assign VEC_LOOP_VEC_LOOP_or_20_nl = (STAGE_LOOP_lshift_psp_sva[14]) | and_dcpl_1053
      | and_dcpl_1058 | and_dcpl_1062 | and_dcpl_1069 | and_dcpl_1073 | and_dcpl_1077
      | and_dcpl_1081 | and_dcpl_1085 | and_dcpl_1087 | and_dcpl_1089 | and_dcpl_1093
      | and_dcpl_1096 | and_dcpl_1099 | and_dcpl_1101 | and_dcpl_1103;
  assign VEC_LOOP_VEC_LOOP_mux_11_nl = MUX_v_14_2_2((STAGE_LOOP_lshift_psp_sva[13:0]),
      (~ (STAGE_LOOP_lshift_psp_sva[14:1])), VEC_LOOP_or_70_itm);
  assign or_803_nl = (~ (fsm_output[1])) | (fsm_output[7]) | (~ (fsm_output[8]));
  assign mux_766_nl = MUX_s_1_2_2(mux_tmp_704, or_803_nl, fsm_output[4]);
  assign mux_765_nl = MUX_s_1_2_2(mux_766_nl, mux_tmp_700, fsm_output[2]);
  assign mux_764_nl = MUX_s_1_2_2(mux_765_nl, or_410_cse, fsm_output[5]);
  assign mux_763_nl = MUX_s_1_2_2(mux_764_nl, or_tmp_363, fsm_output[6]);
  assign mux_762_nl = MUX_s_1_2_2(mux_tmp_703, mux_763_nl, fsm_output[0]);
  assign mux_770_nl = MUX_s_1_2_2(mux_tmp_699, mux_tmp_704, fsm_output[4]);
  assign mux_769_nl = MUX_s_1_2_2(or_408_cse, mux_770_nl, fsm_output[2]);
  assign or_804_nl = (fsm_output[5]) | mux_769_nl;
  assign mux_768_nl = MUX_s_1_2_2(or_804_nl, or_tmp_551, fsm_output[6]);
  assign mux_767_nl = MUX_s_1_2_2(mux_768_nl, mux_tmp_703, fsm_output[0]);
  assign mux_761_nl = MUX_s_1_2_2(mux_762_nl, mux_767_nl, fsm_output[3]);
  assign VEC_LOOP_or_80_nl = mux_761_nl | and_dcpl_1053 | and_dcpl_1058 | and_dcpl_1062
      | and_dcpl_1069 | and_dcpl_1073 | and_dcpl_1077 | and_dcpl_1081 | and_dcpl_1085
      | and_dcpl_1087 | and_dcpl_1089 | and_dcpl_1093 | and_dcpl_1096 | and_dcpl_1099
      | and_dcpl_1101 | and_dcpl_1103;
  assign VEC_LOOP_VEC_LOOP_mux_12_nl = MUX_v_9_2_2((VEC_LOOP_acc_1_cse_10_sva[13:5]),
      COMP_LOOP_k_14_5_sva_8_0, VEC_LOOP_or_70_itm);
  assign VEC_LOOP_VEC_LOOP_or_21_nl = ((VEC_LOOP_acc_1_cse_10_sva[4]) & (~(and_dcpl_1093
      | and_dcpl_1096 | and_dcpl_1099 | and_dcpl_1101 | and_dcpl_1103))) | and_dcpl_1053
      | and_dcpl_1058 | and_dcpl_1062 | and_dcpl_1069 | and_dcpl_1073 | and_dcpl_1077
      | and_dcpl_1081 | and_dcpl_1085 | and_dcpl_1087 | and_dcpl_1089;
  assign VEC_LOOP_VEC_LOOP_or_22_nl = ((VEC_LOOP_acc_1_cse_10_sva[3]) & (~(and_dcpl_1073
      | and_dcpl_1085 | and_dcpl_1087 | and_dcpl_1089 | and_dcpl_1099))) | and_dcpl_1053
      | and_dcpl_1058 | and_dcpl_1062 | and_dcpl_1069 | and_dcpl_1077 | and_dcpl_1081
      | and_dcpl_1093 | and_dcpl_1096 | and_dcpl_1101 | and_dcpl_1103;
  assign VEC_LOOP_VEC_LOOP_or_23_nl = ((VEC_LOOP_acc_1_cse_10_sva[2]) & (~(and_dcpl_1069
      | and_dcpl_1077 | and_dcpl_1081 | and_dcpl_1085 | and_dcpl_1093 | and_dcpl_1103)))
      | and_dcpl_1053 | and_dcpl_1058 | and_dcpl_1062 | and_dcpl_1073 | and_dcpl_1087
      | and_dcpl_1089 | and_dcpl_1096 | and_dcpl_1099 | and_dcpl_1101;
  assign VEC_LOOP_VEC_LOOP_or_24_nl = ((VEC_LOOP_acc_1_cse_10_sva[1]) & (~(and_dcpl_1058
      | and_dcpl_1062 | and_dcpl_1077 | and_dcpl_1081 | and_dcpl_1087 | and_dcpl_1089
      | and_dcpl_1096 | and_dcpl_1099 | and_dcpl_1101 | and_dcpl_1103))) | and_dcpl_1053
      | and_dcpl_1069 | and_dcpl_1073 | and_dcpl_1085 | and_dcpl_1093;
  assign VEC_LOOP_VEC_LOOP_or_25_nl = ((VEC_LOOP_acc_1_cse_10_sva[0]) & (~(and_dcpl_1053
      | and_dcpl_1062 | and_dcpl_1069 | and_dcpl_1073 | and_dcpl_1081 | and_dcpl_1085
      | and_dcpl_1089 | and_dcpl_1093 | and_dcpl_1096))) | and_dcpl_1058 | and_dcpl_1077
      | and_dcpl_1087 | and_dcpl_1099 | and_dcpl_1101 | and_dcpl_1103;
  assign nl_acc_25_nl = ({VEC_LOOP_VEC_LOOP_or_20_nl , VEC_LOOP_VEC_LOOP_mux_11_nl
      , VEC_LOOP_or_80_nl}) + conv_u2u_15_16({VEC_LOOP_VEC_LOOP_mux_12_nl , VEC_LOOP_VEC_LOOP_or_21_nl
      , VEC_LOOP_VEC_LOOP_or_22_nl , VEC_LOOP_VEC_LOOP_or_23_nl , VEC_LOOP_VEC_LOOP_or_24_nl
      , VEC_LOOP_VEC_LOOP_or_25_nl , 1'b1});
  assign acc_25_nl = nl_acc_25_nl[15:0];
  assign z_out_29 = readslicef_16_15_1(acc_25_nl);
  assign VEC_LOOP_VEC_LOOP_or_26_nl = (~(and_dcpl_1111 | and_dcpl_1116 | and_dcpl_1148))
      | and_dcpl_1119 | and_dcpl_1122 | and_dcpl_1126 | and_dcpl_1131 | and_dcpl_1137
      | and_dcpl_1141 | and_dcpl_1143 | and_dcpl_1150;
  assign VEC_LOOP_mux1h_53_nl = MUX1HOT_v_14_4_2(({4'b0000 , (VEC_LOOP_acc_1_cse_10_sva[13:4])}),
      ({5'b00000 , (VEC_LOOP_acc_1_cse_10_sva[13:5])}), (~ (STAGE_LOOP_lshift_psp_sva[14:1])),
      ({5'b00001 , (~ (STAGE_LOOP_lshift_psp_sva[14:6]))}), {and_dcpl_1111 , and_dcpl_1116
      , VEC_LOOP_or_72_itm , and_dcpl_1148});
  assign VEC_LOOP_or_81_nl = (~(and_dcpl_1111 | and_dcpl_1116)) | and_dcpl_1119 |
      and_dcpl_1122 | and_dcpl_1126 | and_dcpl_1131 | and_dcpl_1137 | and_dcpl_1141
      | and_dcpl_1143 | and_dcpl_1148 | and_dcpl_1150;
  assign VEC_LOOP_mux1h_54_nl = MUX1HOT_v_9_3_2(({4'b0000 , (COMP_LOOP_k_14_5_sva_8_0[8:4])}),
      ({5'b00000 , (COMP_LOOP_k_14_5_sva_8_0[8:5])}), COMP_LOOP_k_14_5_sva_8_0, {and_dcpl_1111
      , VEC_LOOP_or_53_itm , VEC_LOOP_or_72_itm});
  assign VEC_LOOP_or_82_nl = and_dcpl_1119 | and_dcpl_1122;
  assign VEC_LOOP_mux1h_55_nl = MUX1HOT_v_4_8_2((COMP_LOOP_k_14_5_sva_8_0[3:0]),
      (COMP_LOOP_k_14_5_sva_8_0[4:1]), 4'b1000, 4'b0001, 4'b0100, 4'b0010, 4'b0011,
      4'b0111, {and_dcpl_1111 , VEC_LOOP_or_53_itm , VEC_LOOP_or_82_nl , and_dcpl_1126
      , and_dcpl_1131 , and_dcpl_1137 , and_dcpl_1141 , and_dcpl_1143});
  assign not_1368_nl = ~ and_dcpl_1150;
  assign VEC_LOOP_and_26_nl = MUX_v_4_2_2(4'b0000, VEC_LOOP_mux1h_55_nl, not_1368_nl);
  assign VEC_LOOP_VEC_LOOP_or_27_nl = ((COMP_LOOP_k_14_5_sva_8_0[0]) & (~(and_dcpl_1122
      | and_dcpl_1126 | and_dcpl_1131 | and_dcpl_1137 | and_dcpl_1141 | and_dcpl_1143)))
      | and_dcpl_1111 | and_dcpl_1119 | and_dcpl_1150;
  assign nl_acc_26_nl = ({VEC_LOOP_VEC_LOOP_or_26_nl , VEC_LOOP_mux1h_53_nl , VEC_LOOP_or_81_nl})
      + conv_u2u_15_16({VEC_LOOP_mux1h_54_nl , VEC_LOOP_and_26_nl , VEC_LOOP_VEC_LOOP_or_27_nl
      , 1'b1});
  assign acc_26_nl = nl_acc_26_nl[15:0];
  assign z_out_30 = readslicef_16_15_1(acc_26_nl);
  assign VEC_LOOP_VEC_LOOP_and_2_nl = (COMP_LOOP_k_14_5_sva_8_0[8]) & (~(and_dcpl_1158
      | and_dcpl_1168));
  assign VEC_LOOP_VEC_LOOP_mux_13_nl = MUX_v_9_2_2(COMP_LOOP_k_14_5_sva_8_0, ({(COMP_LOOP_k_14_5_sva_8_0[7:0])
      , 1'b1}), and_dcpl_1163);
  assign VEC_LOOP_mux1h_56_nl = MUX1HOT_v_10_3_2(({1'b0 , (STAGE_LOOP_lshift_psp_sva[14:6])}),
      (STAGE_LOOP_lshift_psp_sva[14:5]), 10'b0000000001, {and_dcpl_1158 , and_dcpl_1163
      , and_dcpl_1168});
  assign nl_z_out_31 = ({VEC_LOOP_VEC_LOOP_and_2_nl , VEC_LOOP_VEC_LOOP_mux_13_nl})
      + VEC_LOOP_mux1h_56_nl;
  assign z_out_31 = nl_z_out_31[9:0];

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


  function automatic [10:0] MUX1HOT_v_11_4_2;
    input [10:0] input_3;
    input [10:0] input_2;
    input [10:0] input_1;
    input [10:0] input_0;
    input [3:0] sel;
    reg [10:0] result;
  begin
    result = input_0 & {11{sel[0]}};
    result = result | ( input_1 & {11{sel[1]}});
    result = result | ( input_2 & {11{sel[2]}});
    result = result | ( input_3 & {11{sel[3]}});
    MUX1HOT_v_11_4_2 = result;
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


  function automatic [11:0] MUX1HOT_v_12_5_2;
    input [11:0] input_4;
    input [11:0] input_3;
    input [11:0] input_2;
    input [11:0] input_1;
    input [11:0] input_0;
    input [4:0] sel;
    reg [11:0] result;
  begin
    result = input_0 & {12{sel[0]}};
    result = result | ( input_1 & {12{sel[1]}});
    result = result | ( input_2 & {12{sel[2]}});
    result = result | ( input_3 & {12{sel[3]}});
    result = result | ( input_4 & {12{sel[4]}});
    MUX1HOT_v_12_5_2 = result;
  end
  endfunction


  function automatic [12:0] MUX1HOT_v_13_3_2;
    input [12:0] input_2;
    input [12:0] input_1;
    input [12:0] input_0;
    input [2:0] sel;
    reg [12:0] result;
  begin
    result = input_0 & {13{sel[0]}};
    result = result | ( input_1 & {13{sel[1]}});
    result = result | ( input_2 & {13{sel[2]}});
    MUX1HOT_v_13_3_2 = result;
  end
  endfunction


  function automatic [13:0] MUX1HOT_v_14_31_2;
    input [13:0] input_30;
    input [13:0] input_29;
    input [13:0] input_28;
    input [13:0] input_27;
    input [13:0] input_26;
    input [13:0] input_25;
    input [13:0] input_24;
    input [13:0] input_23;
    input [13:0] input_22;
    input [13:0] input_21;
    input [13:0] input_20;
    input [13:0] input_19;
    input [13:0] input_18;
    input [13:0] input_17;
    input [13:0] input_16;
    input [13:0] input_15;
    input [13:0] input_14;
    input [13:0] input_13;
    input [13:0] input_12;
    input [13:0] input_11;
    input [13:0] input_10;
    input [13:0] input_9;
    input [13:0] input_8;
    input [13:0] input_7;
    input [13:0] input_6;
    input [13:0] input_5;
    input [13:0] input_4;
    input [13:0] input_3;
    input [13:0] input_2;
    input [13:0] input_1;
    input [13:0] input_0;
    input [30:0] sel;
    reg [13:0] result;
  begin
    result = input_0 & {14{sel[0]}};
    result = result | ( input_1 & {14{sel[1]}});
    result = result | ( input_2 & {14{sel[2]}});
    result = result | ( input_3 & {14{sel[3]}});
    result = result | ( input_4 & {14{sel[4]}});
    result = result | ( input_5 & {14{sel[5]}});
    result = result | ( input_6 & {14{sel[6]}});
    result = result | ( input_7 & {14{sel[7]}});
    result = result | ( input_8 & {14{sel[8]}});
    result = result | ( input_9 & {14{sel[9]}});
    result = result | ( input_10 & {14{sel[10]}});
    result = result | ( input_11 & {14{sel[11]}});
    result = result | ( input_12 & {14{sel[12]}});
    result = result | ( input_13 & {14{sel[13]}});
    result = result | ( input_14 & {14{sel[14]}});
    result = result | ( input_15 & {14{sel[15]}});
    result = result | ( input_16 & {14{sel[16]}});
    result = result | ( input_17 & {14{sel[17]}});
    result = result | ( input_18 & {14{sel[18]}});
    result = result | ( input_19 & {14{sel[19]}});
    result = result | ( input_20 & {14{sel[20]}});
    result = result | ( input_21 & {14{sel[21]}});
    result = result | ( input_22 & {14{sel[22]}});
    result = result | ( input_23 & {14{sel[23]}});
    result = result | ( input_24 & {14{sel[24]}});
    result = result | ( input_25 & {14{sel[25]}});
    result = result | ( input_26 & {14{sel[26]}});
    result = result | ( input_27 & {14{sel[27]}});
    result = result | ( input_28 & {14{sel[28]}});
    result = result | ( input_29 & {14{sel[29]}});
    result = result | ( input_30 & {14{sel[30]}});
    MUX1HOT_v_14_31_2 = result;
  end
  endfunction


  function automatic [13:0] MUX1HOT_v_14_4_2;
    input [13:0] input_3;
    input [13:0] input_2;
    input [13:0] input_1;
    input [13:0] input_0;
    input [3:0] sel;
    reg [13:0] result;
  begin
    result = input_0 & {14{sel[0]}};
    result = result | ( input_1 & {14{sel[1]}});
    result = result | ( input_2 & {14{sel[2]}});
    result = result | ( input_3 & {14{sel[3]}});
    MUX1HOT_v_14_4_2 = result;
  end
  endfunction


  function automatic [3:0] MUX1HOT_v_4_14_2;
    input [3:0] input_13;
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
    input [13:0] sel;
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
    result = result | ( input_13 & {4{sel[13]}});
    MUX1HOT_v_4_14_2 = result;
  end
  endfunction


  function automatic [3:0] MUX1HOT_v_4_8_2;
    input [3:0] input_7;
    input [3:0] input_6;
    input [3:0] input_5;
    input [3:0] input_4;
    input [3:0] input_3;
    input [3:0] input_2;
    input [3:0] input_1;
    input [3:0] input_0;
    input [7:0] sel;
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
    MUX1HOT_v_4_8_2 = result;
  end
  endfunction


  function automatic [4:0] MUX1HOT_v_5_29_2;
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
    input [28:0] sel;
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
    MUX1HOT_v_5_29_2 = result;
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


  function automatic [8:0] MUX1HOT_v_9_37_2;
    input [8:0] input_36;
    input [8:0] input_35;
    input [8:0] input_34;
    input [8:0] input_33;
    input [8:0] input_32;
    input [8:0] input_31;
    input [8:0] input_30;
    input [8:0] input_29;
    input [8:0] input_28;
    input [8:0] input_27;
    input [8:0] input_26;
    input [8:0] input_25;
    input [8:0] input_24;
    input [8:0] input_23;
    input [8:0] input_22;
    input [8:0] input_21;
    input [8:0] input_20;
    input [8:0] input_19;
    input [8:0] input_18;
    input [8:0] input_17;
    input [8:0] input_16;
    input [8:0] input_15;
    input [8:0] input_14;
    input [8:0] input_13;
    input [8:0] input_12;
    input [8:0] input_11;
    input [8:0] input_10;
    input [8:0] input_9;
    input [8:0] input_8;
    input [8:0] input_7;
    input [8:0] input_6;
    input [8:0] input_5;
    input [8:0] input_4;
    input [8:0] input_3;
    input [8:0] input_2;
    input [8:0] input_1;
    input [8:0] input_0;
    input [36:0] sel;
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
    result = result | ( input_8 & {9{sel[8]}});
    result = result | ( input_9 & {9{sel[9]}});
    result = result | ( input_10 & {9{sel[10]}});
    result = result | ( input_11 & {9{sel[11]}});
    result = result | ( input_12 & {9{sel[12]}});
    result = result | ( input_13 & {9{sel[13]}});
    result = result | ( input_14 & {9{sel[14]}});
    result = result | ( input_15 & {9{sel[15]}});
    result = result | ( input_16 & {9{sel[16]}});
    result = result | ( input_17 & {9{sel[17]}});
    result = result | ( input_18 & {9{sel[18]}});
    result = result | ( input_19 & {9{sel[19]}});
    result = result | ( input_20 & {9{sel[20]}});
    result = result | ( input_21 & {9{sel[21]}});
    result = result | ( input_22 & {9{sel[22]}});
    result = result | ( input_23 & {9{sel[23]}});
    result = result | ( input_24 & {9{sel[24]}});
    result = result | ( input_25 & {9{sel[25]}});
    result = result | ( input_26 & {9{sel[26]}});
    result = result | ( input_27 & {9{sel[27]}});
    result = result | ( input_28 & {9{sel[28]}});
    result = result | ( input_29 & {9{sel[29]}});
    result = result | ( input_30 & {9{sel[30]}});
    result = result | ( input_31 & {9{sel[31]}});
    result = result | ( input_32 & {9{sel[32]}});
    result = result | ( input_33 & {9{sel[33]}});
    result = result | ( input_34 & {9{sel[34]}});
    result = result | ( input_35 & {9{sel[35]}});
    result = result | ( input_36 & {9{sel[36]}});
    MUX1HOT_v_9_37_2 = result;
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


  function automatic [13:0] MUX_v_14_2_2;
    input [13:0] input_0;
    input [13:0] input_1;
    input [0:0] sel;
    reg [13:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_14_2_2 = result;
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


  function automatic [12:0] readslicef_14_13_1;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_14_13_1 = tmp[12:0];
  end
  endfunction


  function automatic [0:0] readslicef_15_1_14;
    input [14:0] vector;
    reg [14:0] tmp;
  begin
    tmp = vector >> 14;
    readslicef_15_1_14 = tmp[0:0];
  end
  endfunction


  function automatic [14:0] readslicef_16_15_1;
    input [15:0] vector;
    reg [15:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_16_15_1 = tmp[14:0];
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


  function automatic [15:0] conv_u2u_15_16 ;
    input [14:0]  vector ;
  begin
    conv_u2u_15_16 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp (
  clk, rst, run_rsc_rdy, run_rsc_vld, vec_rsc_wadr, vec_rsc_d, vec_rsc_we, vec_rsc_radr,
      vec_rsc_q, vec_rsc_triosy_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat, r_rsc_triosy_lz,
      twiddle_rsc_radr, twiddle_rsc_q, twiddle_rsc_triosy_lz, twiddle_h_rsc_radr,
      twiddle_h_rsc_q, twiddle_h_rsc_triosy_lz, complete_rsc_rdy, complete_rsc_vld
);
  input clk;
  input rst;
  output run_rsc_rdy;
  input run_rsc_vld;
  output [13:0] vec_rsc_wadr;
  output [31:0] vec_rsc_d;
  output vec_rsc_we;
  output [13:0] vec_rsc_radr;
  input [31:0] vec_rsc_q;
  output vec_rsc_triosy_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [13:0] twiddle_rsc_radr;
  input [31:0] twiddle_rsc_q;
  output twiddle_rsc_triosy_lz;
  output [13:0] twiddle_h_rsc_radr;
  input [31:0] twiddle_h_rsc_q;
  output twiddle_h_rsc_triosy_lz;
  input complete_rsc_rdy;
  output complete_rsc_vld;


  // Interconnect Declarations
  wire [31:0] vec_rsci_d_d;
  wire [31:0] vec_rsci_q_d;
  wire [13:0] vec_rsci_radr_d;
  wire [13:0] vec_rsci_wadr_d;
  wire vec_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [31:0] twiddle_rsci_q_d;
  wire [13:0] twiddle_rsci_radr_d;
  wire twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire [31:0] twiddle_h_rsci_q_d;
  wire [13:0] twiddle_h_rsci_radr_d;
  wire twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d;
  wire vec_rsci_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rwport_13_14_32_16384_16384_32_1_gen
      vec_rsci (
      .q(vec_rsc_q),
      .radr(vec_rsc_radr),
      .we(vec_rsc_we),
      .d(vec_rsc_d),
      .wadr(vec_rsc_wadr),
      .clkr(clk),
      .clkr_en(1'b1),
      .d_d(vec_rsci_d_d),
      .q_d(vec_rsci_q_d),
      .radr_d(vec_rsci_radr_d),
      .wadr_d(vec_rsci_wadr_d),
      .we_d(vec_rsci_we_d_iff),
      .writeA_w_ram_ir_internal_WMASK_B_d(vec_rsci_we_d_iff),
      .readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_16_14_32_16384_16384_32_1_gen
      twiddle_rsci (
      .q(twiddle_rsc_q),
      .radr(twiddle_rsc_radr),
      .q_d(twiddle_rsci_q_d),
      .radr_d(twiddle_rsci_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_1R1W_RBW_DUAL_rport_17_14_32_16384_16384_32_1_gen
      twiddle_h_rsci (
      .q(twiddle_h_rsc_q),
      .radr(twiddle_h_rsc_radr),
      .q_d(twiddle_h_rsci_q_d),
      .radr_d(twiddle_h_rsci_radr_d),
      .readA_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d)
    );
  inPlaceNTT_DIF_precomp_core inPlaceNTT_DIF_precomp_core_inst (
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
      .vec_rsci_d_d(vec_rsci_d_d),
      .vec_rsci_q_d(vec_rsci_q_d),
      .vec_rsci_radr_d(vec_rsci_radr_d),
      .vec_rsci_wadr_d(vec_rsci_wadr_d),
      .vec_rsci_readA_r_ram_ir_internal_RMASK_B_d(vec_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_rsci_q_d(twiddle_rsci_q_d),
      .twiddle_rsci_radr_d(twiddle_rsci_radr_d),
      .twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d(twiddle_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsci_q_d(twiddle_h_rsci_q_d),
      .twiddle_h_rsci_radr_d(twiddle_h_rsci_radr_d),
      .twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d(twiddle_h_rsci_readA_r_ram_ir_internal_RMASK_B_d),
      .vec_rsci_we_d_pff(vec_rsci_we_d_iff)
    );
endmodule



