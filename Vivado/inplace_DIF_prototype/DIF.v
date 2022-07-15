
//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_in_v2.v 
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

module ccs_sync_in_v2 (lzin, vzin, ldin, vdin);
  parameter integer rscid = 1;

  output lzin;
  input  vzin;
  input  ldin;
  output vdin;

  wire   vdin;
  wire   lzin;

  assign vdin = vzin;
  assign lzin = ldin;
endmodule

//------> /opt/mentorgraphics/Catapult_10.5c/Mgc_home/pkgs/siflibs/ccs_sync_out_v2.v 
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

module ccs_sync_out_v2 (ldout, vdout, lzout, vzout);
  parameter integer rscid = 1;

  input  ldout;
  output vdout;
  output lzout;
  input  vzout;

  wire   lzout;
  wire   vdout;

  assign lzout = ldout;
  assign vdout = vzout;
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

//------> ../td_ccore_solutions/mult_c1d26a252101abba83fd0054ed32169c70bc_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Thu Jul 14 18:07:05 2022
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mult_core_wait_dp
// ------------------------------------------------------------------


module mult_core_wait_dp (
  ccs_ccore_clk, ccs_ccore_en, t_mul_cmp_z, z_mul_cmp_z, z_mul_cmp_1_z, t_mul_cmp_z_oreg,
      z_mul_cmp_z_oreg, z_mul_cmp_1_z_oreg
);
  input ccs_ccore_clk;
  input ccs_ccore_en;
  input [63:0] t_mul_cmp_z;
  input [31:0] z_mul_cmp_z;
  input [31:0] z_mul_cmp_1_z;
  output [31:0] t_mul_cmp_z_oreg;
  output [31:0] z_mul_cmp_z_oreg;
  reg [31:0] z_mul_cmp_z_oreg;
  output [31:0] z_mul_cmp_1_z_oreg;
  reg [31:0] z_mul_cmp_1_z_oreg;


  // Interconnect Declarations
  reg [31:0] t_mul_cmp_z_oreg_pconst_63_32;


  // Interconnect Declarations for Component Instantiations 
  assign t_mul_cmp_z_oreg = t_mul_cmp_z_oreg_pconst_63_32;
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      t_mul_cmp_z_oreg_pconst_63_32 <= t_mul_cmp_z[63:32];
      z_mul_cmp_z_oreg <= z_mul_cmp_z;
      z_mul_cmp_1_z_oreg <= z_mul_cmp_1_z;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    mult_core
// ------------------------------------------------------------------


module mult_core (
  x_rsc_dat, y_rsc_dat, y_rsc_dat_1, p_rsc_dat, return_rsc_z, ccs_ccore_start_rsc_dat,
      ccs_ccore_clk, ccs_ccore_srst, ccs_ccore_en, t_mul_cmp_a, t_mul_cmp_b, t_mul_cmp_z,
      z_mul_cmp_b, z_mul_cmp_z, z_mul_cmp_1_a, z_mul_cmp_1_b, z_mul_cmp_1_z
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
  output [31:0] t_mul_cmp_a;
  output [31:0] t_mul_cmp_b;
  reg [31:0] t_mul_cmp_b;
  input [63:0] t_mul_cmp_z;
  output [31:0] z_mul_cmp_b;
  reg [31:0] z_mul_cmp_b;
  input [31:0] z_mul_cmp_z;
  output [31:0] z_mul_cmp_1_a;
  reg [31:0] z_mul_cmp_1_a;
  output [31:0] z_mul_cmp_1_b;
  reg [31:0] z_mul_cmp_1_b;
  input [31:0] z_mul_cmp_1_z;


  // Interconnect Declarations
  wire [31:0] x_rsci_idat;
  wire [31:0] y_rsci_idat;
  wire [31:0] y_rsci_idat_1;
  wire [31:0] p_rsci_idat;
  reg [31:0] return_rsci_d;
  wire ccs_ccore_start_rsci_idat;
  wire [31:0] t_mul_cmp_z_oreg;
  wire [31:0] z_mul_cmp_z_oreg;
  wire [31:0] z_mul_cmp_1_z_oreg;
  reg main_stage_0_2;
  reg asn_itm_1;
  reg main_stage_0_3;
  reg asn_itm_2;
  wire [31:0] res_sva_1;
  wire [32:0] nl_res_sva_1;
  reg [31:0] p_buf_sva_4;
  reg [31:0] reg_t_mul_cmp_a_cse;
  reg main_stage_0_4;
  reg [31:0] p_buf_sva_1;
  reg [31:0] p_buf_sva_2;
  reg [31:0] z_asn_itm_1;
  reg [31:0] z_asn_itm_2;
  reg asn_itm_3;
  wire p_and_cse;

  wire[31:0] if_acc_nl;
  wire[32:0] nl_if_acc_nl;
  wire[32:0] acc_nl;
  wire[33:0] nl_acc_nl;

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
  mult_core_wait_dp mult_core_wait_dp_inst (
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_en(ccs_ccore_en),
      .t_mul_cmp_z(t_mul_cmp_z),
      .z_mul_cmp_z(z_mul_cmp_z),
      .z_mul_cmp_1_z(z_mul_cmp_1_z),
      .t_mul_cmp_z_oreg(t_mul_cmp_z_oreg),
      .z_mul_cmp_z_oreg(z_mul_cmp_z_oreg),
      .z_mul_cmp_1_z_oreg(z_mul_cmp_1_z_oreg)
    );
  assign p_and_cse = ccs_ccore_en & main_stage_0_4 & asn_itm_3;
  assign t_mul_cmp_a = reg_t_mul_cmp_a_cse;
  assign nl_res_sva_1 = z_asn_itm_2 - z_mul_cmp_1_z_oreg;
  assign res_sva_1 = nl_res_sva_1[31:0];
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en ) begin
      return_rsci_d <= MUX_v_32_2_2(if_acc_nl, res_sva_1, readslicef_33_1_32(acc_nl));
      z_mul_cmp_1_b <= p_buf_sva_2;
      z_mul_cmp_1_a <= t_mul_cmp_z_oreg;
      t_mul_cmp_b <= y_rsci_idat_1;
      reg_t_mul_cmp_a_cse <= x_rsci_idat;
      z_mul_cmp_b <= y_rsci_idat;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_srst ) begin
      asn_itm_2 <= 1'b0;
      main_stage_0_3 <= 1'b0;
      asn_itm_1 <= 1'b0;
      asn_itm_3 <= 1'b0;
      main_stage_0_2 <= 1'b0;
      main_stage_0_4 <= 1'b0;
    end
    else if ( ccs_ccore_en ) begin
      asn_itm_2 <= asn_itm_1;
      main_stage_0_3 <= main_stage_0_2;
      asn_itm_1 <= ccs_ccore_start_rsci_idat;
      asn_itm_3 <= asn_itm_2;
      main_stage_0_2 <= 1'b1;
      main_stage_0_4 <= main_stage_0_3;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( p_and_cse ) begin
      p_buf_sva_4 <= z_mul_cmp_1_b;
      z_asn_itm_2 <= z_asn_itm_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & main_stage_0_2 & asn_itm_1 ) begin
      p_buf_sva_2 <= p_buf_sva_1;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & main_stage_0_3 & asn_itm_2 ) begin
      z_asn_itm_1 <= z_mul_cmp_z_oreg;
    end
  end
  always @(posedge ccs_ccore_clk) begin
    if ( ccs_ccore_en & ccs_ccore_start_rsci_idat ) begin
      p_buf_sva_1 <= p_rsci_idat;
    end
  end
  assign nl_if_acc_nl = res_sva_1 - p_buf_sva_4;
  assign if_acc_nl = nl_if_acc_nl[31:0];
  assign nl_acc_nl = ({1'b1 , res_sva_1}) + conv_u2u_32_33(~ p_buf_sva_4) + 33'b000000000000000000000000000000001;
  assign acc_nl = nl_acc_nl[32:0];

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


  // Interconnect Declarations
  wire [31:0] t_mul_cmp_a;
  wire [31:0] t_mul_cmp_b;
  wire [31:0] z_mul_cmp_b;
  wire [31:0] z_mul_cmp_1_a;
  wire [31:0] z_mul_cmp_1_b;


  // Interconnect Declarations for Component Instantiations 
  wire [63:0] nl_mult_core_inst_t_mul_cmp_z;
  assign nl_mult_core_inst_t_mul_cmp_z = conv_u2u_64_64(t_mul_cmp_a * t_mul_cmp_b);
  wire [31:0] nl_mult_core_inst_z_mul_cmp_z;
  assign nl_mult_core_inst_z_mul_cmp_z = conv_u2u_64_32(t_mul_cmp_a * z_mul_cmp_b);
  wire [31:0] nl_mult_core_inst_z_mul_cmp_1_z;
  assign nl_mult_core_inst_z_mul_cmp_1_z = conv_u2u_64_32(z_mul_cmp_1_a * z_mul_cmp_1_b);
  mult_core mult_core_inst (
      .x_rsc_dat(x_rsc_dat),
      .y_rsc_dat(y_rsc_dat),
      .y_rsc_dat_1(y_rsc_dat_1),
      .p_rsc_dat(p_rsc_dat),
      .return_rsc_z(return_rsc_z),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_clk(ccs_ccore_clk),
      .ccs_ccore_srst(ccs_ccore_srst),
      .ccs_ccore_en(ccs_ccore_en),
      .t_mul_cmp_a(t_mul_cmp_a),
      .t_mul_cmp_b(t_mul_cmp_b),
      .t_mul_cmp_z(nl_mult_core_inst_t_mul_cmp_z[63:0]),
      .z_mul_cmp_b(z_mul_cmp_b),
      .z_mul_cmp_z(nl_mult_core_inst_z_mul_cmp_z[31:0]),
      .z_mul_cmp_1_a(z_mul_cmp_1_a),
      .z_mul_cmp_1_b(z_mul_cmp_1_b),
      .z_mul_cmp_1_z(nl_mult_core_inst_z_mul_cmp_1_z[31:0])
    );

  function automatic [31:0] conv_u2u_64_32 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_32 = vector[31:0];
  end
  endfunction


  function automatic [63:0] conv_u2u_64_64 ;
    input [63:0]  vector ;
  begin
    conv_u2u_64_64 = vector;
  end
  endfunction

endmodule




//------> ../td_ccore_solutions/modulo_sub_2c91fac5b66ecf39a243695c246094aa634d_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Thu Jul 14 18:07:06 2022
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




//------> ../td_ccore_solutions/modulo_add_664c7b4cdaf366aaa7e11c0dced4de7b60c4_0/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.5c/896140 Production Release
//  HLS Date:       Sun Sep  6 22:45:38 PDT 2020
// 
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Thu Jul 14 18:07:07 2022
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
//  Generated by:   ls5382@newnano.poly.edu
//  Generated date: Thu Jul 14 18:13:48 2022
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_37_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_37_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_36_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_36_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_35_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_35_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_34_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_34_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_33_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_33_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_32_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_32_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_31_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_31_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_30_8_32_256_256_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_30_8_32_256_256_32_1_gen
    (
  qb, web, db, adrb, qa, wea, da, adra, adra_d, da_d, qa_d, wea_d, rwA_rw_ram_ir_internal_RMASK_B_d,
      rwA_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] qb;
  output web;
  output [31:0] db;
  output [7:0] adrb;
  input [31:0] qa;
  output wea;
  output [31:0] da;
  output [7:0] adra;
  input [15:0] adra_d;
  input [63:0] da_d;
  output [63:0] qa_d;
  input [1:0] wea_d;
  input [1:0] rwA_rw_ram_ir_internal_RMASK_B_d;
  input [1:0] rwA_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign qa_d[63:32] = qb;
  assign web = (rwA_rw_ram_ir_internal_WMASK_B_d[1]);
  assign db = (da_d[63:32]);
  assign adrb = (adra_d[15:8]);
  assign qa_d[31:0] = qa;
  assign wea = (rwA_rw_ram_ir_internal_WMASK_B_d[0]);
  assign da = (da_d[31:0]);
  assign adra = (adra_d[7:0]);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_29_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_29_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_28_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_28_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_27_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_27_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_26_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_26_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_25_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_25_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_24_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_24_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_23_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_23_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_22_7_32_128_128_32_1_gen
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_22_7_32_128_128_32_1_gen
    (
  q, we, d, adr, adr_d, d_d, q_d, we_d, rw_rw_ram_ir_internal_RMASK_B_d, rw_rw_ram_ir_internal_WMASK_B_d
);
  input [31:0] q;
  output we;
  output [31:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [31:0] d_d;
  output [31:0] q_d;
  input we_d;
  input rw_rw_ram_ir_internal_RMASK_B_d;
  input rw_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign we = (rw_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_core_fsm (
  clk, rst, complete_rsci_wen_comp, fsm_output, main_C_0_tr0, VEC_LOOP_C_9_tr0, COMP_LOOP_C_2_tr0,
      STAGE_LOOP_C_1_tr0
);
  input clk;
  input rst;
  input complete_rsci_wen_comp;
  output [17:0] fsm_output;
  reg [17:0] fsm_output;
  input main_C_0_tr0;
  input VEC_LOOP_C_9_tr0;
  input COMP_LOOP_C_2_tr0;
  input STAGE_LOOP_C_1_tr0;


  // FSM State Type Declaration for inPlaceNTT_DIF_precomp_core_core_fsm_1
  parameter
    main_C_0 = 5'd0,
    STAGE_LOOP_C_0 = 5'd1,
    COMP_LOOP_C_0 = 5'd2,
    COMP_LOOP_C_1 = 5'd3,
    VEC_LOOP_C_0 = 5'd4,
    VEC_LOOP_C_1 = 5'd5,
    VEC_LOOP_C_2 = 5'd6,
    VEC_LOOP_C_3 = 5'd7,
    VEC_LOOP_C_4 = 5'd8,
    VEC_LOOP_C_5 = 5'd9,
    VEC_LOOP_C_6 = 5'd10,
    VEC_LOOP_C_7 = 5'd11,
    VEC_LOOP_C_8 = 5'd12,
    VEC_LOOP_C_9 = 5'd13,
    COMP_LOOP_C_2 = 5'd14,
    STAGE_LOOP_C_1 = 5'd15,
    main_C_1 = 5'd16,
    main_C_2 = 5'd17;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : inPlaceNTT_DIF_precomp_core_core_fsm_1
    case (state_var)
      STAGE_LOOP_C_0 : begin
        fsm_output = 18'b000000000000000010;
        state_var_NS = COMP_LOOP_C_0;
      end
      COMP_LOOP_C_0 : begin
        fsm_output = 18'b000000000000000100;
        state_var_NS = COMP_LOOP_C_1;
      end
      COMP_LOOP_C_1 : begin
        fsm_output = 18'b000000000000001000;
        state_var_NS = VEC_LOOP_C_0;
      end
      VEC_LOOP_C_0 : begin
        fsm_output = 18'b000000000000010000;
        state_var_NS = VEC_LOOP_C_1;
      end
      VEC_LOOP_C_1 : begin
        fsm_output = 18'b000000000000100000;
        state_var_NS = VEC_LOOP_C_2;
      end
      VEC_LOOP_C_2 : begin
        fsm_output = 18'b000000000001000000;
        state_var_NS = VEC_LOOP_C_3;
      end
      VEC_LOOP_C_3 : begin
        fsm_output = 18'b000000000010000000;
        state_var_NS = VEC_LOOP_C_4;
      end
      VEC_LOOP_C_4 : begin
        fsm_output = 18'b000000000100000000;
        state_var_NS = VEC_LOOP_C_5;
      end
      VEC_LOOP_C_5 : begin
        fsm_output = 18'b000000001000000000;
        state_var_NS = VEC_LOOP_C_6;
      end
      VEC_LOOP_C_6 : begin
        fsm_output = 18'b000000010000000000;
        state_var_NS = VEC_LOOP_C_7;
      end
      VEC_LOOP_C_7 : begin
        fsm_output = 18'b000000100000000000;
        state_var_NS = VEC_LOOP_C_8;
      end
      VEC_LOOP_C_8 : begin
        fsm_output = 18'b000001000000000000;
        state_var_NS = VEC_LOOP_C_9;
      end
      VEC_LOOP_C_9 : begin
        fsm_output = 18'b000010000000000000;
        if ( VEC_LOOP_C_9_tr0 ) begin
          state_var_NS = COMP_LOOP_C_2;
        end
        else begin
          state_var_NS = VEC_LOOP_C_0;
        end
      end
      COMP_LOOP_C_2 : begin
        fsm_output = 18'b000100000000000000;
        if ( COMP_LOOP_C_2_tr0 ) begin
          state_var_NS = STAGE_LOOP_C_1;
        end
        else begin
          state_var_NS = COMP_LOOP_C_0;
        end
      end
      STAGE_LOOP_C_1 : begin
        fsm_output = 18'b001000000000000000;
        if ( STAGE_LOOP_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = STAGE_LOOP_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 18'b010000000000000000;
        state_var_NS = main_C_2;
      end
      main_C_2 : begin
        fsm_output = 18'b100000000000000000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 18'b000000000000000001;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_0_obj_iswt0, twiddle_h_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_0_obj_iswt0;
  output twiddle_h_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_0_obj_ld_core_sct = twiddle_h_rsc_triosy_0_0_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_1_obj_iswt0, twiddle_h_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_1_obj_iswt0;
  output twiddle_h_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_1_obj_ld_core_sct = twiddle_h_rsc_triosy_0_1_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_2_obj_iswt0, twiddle_h_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_2_obj_iswt0;
  output twiddle_h_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_2_obj_ld_core_sct = twiddle_h_rsc_triosy_0_2_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl
    (
  core_wten, twiddle_h_rsc_triosy_0_3_obj_iswt0, twiddle_h_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input twiddle_h_rsc_triosy_0_3_obj_iswt0;
  output twiddle_h_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_triosy_0_3_obj_ld_core_sct = twiddle_h_rsc_triosy_0_3_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_0_obj_iswt0, twiddle_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_0_obj_iswt0;
  output twiddle_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_0_obj_ld_core_sct = twiddle_rsc_triosy_0_0_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_1_obj_iswt0, twiddle_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_1_obj_iswt0;
  output twiddle_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_1_obj_ld_core_sct = twiddle_rsc_triosy_0_1_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_2_obj_iswt0, twiddle_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_2_obj_iswt0;
  output twiddle_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_2_obj_ld_core_sct = twiddle_rsc_triosy_0_2_obj_iswt0
      & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl
    (
  core_wten, twiddle_rsc_triosy_0_3_obj_iswt0, twiddle_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input twiddle_rsc_triosy_0_3_obj_iswt0;
  output twiddle_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_triosy_0_3_obj_ld_core_sct = twiddle_rsc_triosy_0_3_obj_iswt0
      & (~ core_wten);
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_vec_rsc_triosy_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_vec_rsc_triosy_0_0_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_0_obj_iswt0, vec_rsc_triosy_0_0_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_0_obj_iswt0;
  output vec_rsc_triosy_0_0_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_0_obj_ld_core_sct = vec_rsc_triosy_0_0_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_vec_rsc_triosy_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_vec_rsc_triosy_0_1_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_1_obj_iswt0, vec_rsc_triosy_0_1_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_1_obj_iswt0;
  output vec_rsc_triosy_0_1_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_1_obj_ld_core_sct = vec_rsc_triosy_0_1_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj_vec_rsc_triosy_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj_vec_rsc_triosy_0_2_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_2_obj_iswt0, vec_rsc_triosy_0_2_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_2_obj_iswt0;
  output vec_rsc_triosy_0_2_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_2_obj_ld_core_sct = vec_rsc_triosy_0_2_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj_vec_rsc_triosy_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj_vec_rsc_triosy_0_3_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_3_obj_iswt0, vec_rsc_triosy_0_3_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_3_obj_iswt0;
  output vec_rsc_triosy_0_3_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_3_obj_ld_core_sct = vec_rsc_triosy_0_3_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj_vec_rsc_triosy_0_4_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj_vec_rsc_triosy_0_4_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_4_obj_iswt0, vec_rsc_triosy_0_4_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_4_obj_iswt0;
  output vec_rsc_triosy_0_4_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_4_obj_ld_core_sct = vec_rsc_triosy_0_4_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj_vec_rsc_triosy_0_5_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj_vec_rsc_triosy_0_5_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_5_obj_iswt0, vec_rsc_triosy_0_5_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_5_obj_iswt0;
  output vec_rsc_triosy_0_5_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_5_obj_ld_core_sct = vec_rsc_triosy_0_5_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj_vec_rsc_triosy_0_6_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj_vec_rsc_triosy_0_6_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_6_obj_iswt0, vec_rsc_triosy_0_6_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_6_obj_iswt0;
  output vec_rsc_triosy_0_6_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_6_obj_ld_core_sct = vec_rsc_triosy_0_6_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj_vec_rsc_triosy_0_7_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj_vec_rsc_triosy_0_7_wait_ctrl
    (
  core_wten, vec_rsc_triosy_0_7_obj_iswt0, vec_rsc_triosy_0_7_obj_ld_core_sct
);
  input core_wten;
  input vec_rsc_triosy_0_7_obj_iswt0;
  output vec_rsc_triosy_0_7_obj_ld_core_sct;



  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_triosy_0_7_obj_ld_core_sct = vec_rsc_triosy_0_7_obj_iswt0 & (~ core_wten);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp
    (
  clk, rst, twiddle_h_rsc_0_3_i_adra_d, twiddle_h_rsc_0_3_i_qa_d, twiddle_h_rsc_0_3_i_adra_d_core,
      twiddle_h_rsc_0_3_i_qa_d_mxwt, twiddle_h_rsc_0_3_i_biwt, twiddle_h_rsc_0_3_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_3_i_adra_d;
  input [63:0] twiddle_h_rsc_0_3_i_qa_d;
  input [15:0] twiddle_h_rsc_0_3_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_3_i_qa_d_mxwt;
  input twiddle_h_rsc_0_3_i_biwt;
  input twiddle_h_rsc_0_3_i_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsc_0_3_i_bcwt;
  reg [31:0] twiddle_h_rsc_0_3_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_3_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_h_rsc_0_3_i_qa_d[31:0]),
      twiddle_h_rsc_0_3_i_qa_d_bfwt_31_0, twiddle_h_rsc_0_3_i_bcwt);
  assign twiddle_h_rsc_0_3_i_adra_d = twiddle_h_rsc_0_3_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_3_i_bcwt <= ~((~(twiddle_h_rsc_0_3_i_bcwt | twiddle_h_rsc_0_3_i_biwt))
          | twiddle_h_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_3_i_biwt ) begin
      twiddle_h_rsc_0_3_i_qa_d_bfwt_31_0 <= twiddle_h_rsc_0_3_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl
    (
  core_wen, core_wten, twiddle_h_rsc_0_3_i_oswt, twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsc_0_3_i_biwt, twiddle_h_rsc_0_3_i_bdwt, twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_h_rsc_0_3_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_3_i_oswt;
  input [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsc_0_3_i_biwt;
  output twiddle_h_rsc_0_3_i_bdwt;
  output [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsc_0_3_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_31_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_3_i_bdwt = twiddle_h_rsc_0_3_i_oswt & core_wen;
  assign twiddle_h_rsc_0_3_i_biwt = (~ core_wten) & twiddle_h_rsc_0_3_i_oswt;
  assign COMP_LOOP_twiddle_help_and_31_nl = (twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_h_rsc_0_3_i_oswt_pff;
  assign twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 ,
      COMP_LOOP_twiddle_help_and_31_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp
    (
  clk, rst, twiddle_h_rsc_0_2_i_adra_d, twiddle_h_rsc_0_2_i_qa_d, twiddle_h_rsc_0_2_i_adra_d_core,
      twiddle_h_rsc_0_2_i_qa_d_mxwt, twiddle_h_rsc_0_2_i_biwt, twiddle_h_rsc_0_2_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_2_i_adra_d;
  input [63:0] twiddle_h_rsc_0_2_i_qa_d;
  input [15:0] twiddle_h_rsc_0_2_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_2_i_qa_d_mxwt;
  input twiddle_h_rsc_0_2_i_biwt;
  input twiddle_h_rsc_0_2_i_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsc_0_2_i_bcwt;
  reg [31:0] twiddle_h_rsc_0_2_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_2_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_h_rsc_0_2_i_qa_d[31:0]),
      twiddle_h_rsc_0_2_i_qa_d_bfwt_31_0, twiddle_h_rsc_0_2_i_bcwt);
  assign twiddle_h_rsc_0_2_i_adra_d = twiddle_h_rsc_0_2_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_2_i_bcwt <= ~((~(twiddle_h_rsc_0_2_i_bcwt | twiddle_h_rsc_0_2_i_biwt))
          | twiddle_h_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_2_i_biwt ) begin
      twiddle_h_rsc_0_2_i_qa_d_bfwt_31_0 <= twiddle_h_rsc_0_2_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl
    (
  core_wen, core_wten, twiddle_h_rsc_0_2_i_oswt, twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsc_0_2_i_biwt, twiddle_h_rsc_0_2_i_bdwt, twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_h_rsc_0_2_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_2_i_oswt;
  input [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsc_0_2_i_biwt;
  output twiddle_h_rsc_0_2_i_bdwt;
  output [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsc_0_2_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_23_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_2_i_bdwt = twiddle_h_rsc_0_2_i_oswt & core_wen;
  assign twiddle_h_rsc_0_2_i_biwt = (~ core_wten) & twiddle_h_rsc_0_2_i_oswt;
  assign COMP_LOOP_twiddle_help_and_23_nl = (twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_h_rsc_0_2_i_oswt_pff;
  assign twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 ,
      COMP_LOOP_twiddle_help_and_23_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp
    (
  clk, rst, twiddle_h_rsc_0_1_i_adra_d, twiddle_h_rsc_0_1_i_qa_d, twiddle_h_rsc_0_1_i_adra_d_core,
      twiddle_h_rsc_0_1_i_qa_d_mxwt, twiddle_h_rsc_0_1_i_biwt, twiddle_h_rsc_0_1_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_1_i_adra_d;
  input [63:0] twiddle_h_rsc_0_1_i_qa_d;
  input [15:0] twiddle_h_rsc_0_1_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_1_i_qa_d_mxwt;
  input twiddle_h_rsc_0_1_i_biwt;
  input twiddle_h_rsc_0_1_i_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsc_0_1_i_bcwt;
  reg [31:0] twiddle_h_rsc_0_1_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_1_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_h_rsc_0_1_i_qa_d[31:0]),
      twiddle_h_rsc_0_1_i_qa_d_bfwt_31_0, twiddle_h_rsc_0_1_i_bcwt);
  assign twiddle_h_rsc_0_1_i_adra_d = twiddle_h_rsc_0_1_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_1_i_bcwt <= ~((~(twiddle_h_rsc_0_1_i_bcwt | twiddle_h_rsc_0_1_i_biwt))
          | twiddle_h_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_1_i_biwt ) begin
      twiddle_h_rsc_0_1_i_qa_d_bfwt_31_0 <= twiddle_h_rsc_0_1_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl
    (
  core_wen, core_wten, twiddle_h_rsc_0_1_i_oswt, twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsc_0_1_i_biwt, twiddle_h_rsc_0_1_i_bdwt, twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_h_rsc_0_1_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_1_i_oswt;
  input [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsc_0_1_i_biwt;
  output twiddle_h_rsc_0_1_i_bdwt;
  output [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsc_0_1_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_15_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_1_i_bdwt = twiddle_h_rsc_0_1_i_oswt & core_wen;
  assign twiddle_h_rsc_0_1_i_biwt = (~ core_wten) & twiddle_h_rsc_0_1_i_oswt;
  assign COMP_LOOP_twiddle_help_and_15_nl = (twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_h_rsc_0_1_i_oswt_pff;
  assign twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 ,
      COMP_LOOP_twiddle_help_and_15_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp
    (
  clk, rst, twiddle_h_rsc_0_0_i_adra_d, twiddle_h_rsc_0_0_i_qa_d, twiddle_h_rsc_0_0_i_adra_d_core,
      twiddle_h_rsc_0_0_i_qa_d_mxwt, twiddle_h_rsc_0_0_i_biwt, twiddle_h_rsc_0_0_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_0_i_adra_d;
  input [63:0] twiddle_h_rsc_0_0_i_qa_d;
  input [15:0] twiddle_h_rsc_0_0_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_0_i_qa_d_mxwt;
  input twiddle_h_rsc_0_0_i_biwt;
  input twiddle_h_rsc_0_0_i_bdwt;


  // Interconnect Declarations
  reg twiddle_h_rsc_0_0_i_bcwt;
  reg [31:0] twiddle_h_rsc_0_0_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_0_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_h_rsc_0_0_i_qa_d[31:0]),
      twiddle_h_rsc_0_0_i_qa_d_bfwt_31_0, twiddle_h_rsc_0_0_i_bcwt);
  assign twiddle_h_rsc_0_0_i_adra_d = twiddle_h_rsc_0_0_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_h_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_h_rsc_0_0_i_bcwt <= ~((~(twiddle_h_rsc_0_0_i_bcwt | twiddle_h_rsc_0_0_i_biwt))
          | twiddle_h_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_h_rsc_0_0_i_biwt ) begin
      twiddle_h_rsc_0_0_i_qa_d_bfwt_31_0 <= twiddle_h_rsc_0_0_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl
    (
  core_wen, core_wten, twiddle_h_rsc_0_0_i_oswt, twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_h_rsc_0_0_i_biwt, twiddle_h_rsc_0_0_i_bdwt, twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_h_rsc_0_0_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_0_i_oswt;
  input [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_h_rsc_0_0_i_biwt;
  output twiddle_h_rsc_0_0_i_bdwt;
  output [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_h_rsc_0_0_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_help_and_7_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_h_rsc_0_0_i_bdwt = twiddle_h_rsc_0_0_i_oswt & core_wen;
  assign twiddle_h_rsc_0_0_i_biwt = (~ core_wten) & twiddle_h_rsc_0_0_i_oswt;
  assign COMP_LOOP_twiddle_help_and_7_nl = (twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_h_rsc_0_0_i_oswt_pff;
  assign twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 ,
      COMP_LOOP_twiddle_help_and_7_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp (
  clk, rst, twiddle_rsc_0_3_i_adra_d, twiddle_rsc_0_3_i_qa_d, twiddle_rsc_0_3_i_adra_d_core,
      twiddle_rsc_0_3_i_qa_d_mxwt, twiddle_rsc_0_3_i_biwt, twiddle_rsc_0_3_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_3_i_adra_d;
  input [63:0] twiddle_rsc_0_3_i_qa_d;
  input [15:0] twiddle_rsc_0_3_i_adra_d_core;
  output [31:0] twiddle_rsc_0_3_i_qa_d_mxwt;
  input twiddle_rsc_0_3_i_biwt;
  input twiddle_rsc_0_3_i_bdwt;


  // Interconnect Declarations
  reg twiddle_rsc_0_3_i_bcwt;
  reg [31:0] twiddle_rsc_0_3_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_3_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_rsc_0_3_i_qa_d[31:0]),
      twiddle_rsc_0_3_i_qa_d_bfwt_31_0, twiddle_rsc_0_3_i_bcwt);
  assign twiddle_rsc_0_3_i_adra_d = twiddle_rsc_0_3_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_3_i_bcwt <= ~((~(twiddle_rsc_0_3_i_bcwt | twiddle_rsc_0_3_i_biwt))
          | twiddle_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_3_i_biwt ) begin
      twiddle_rsc_0_3_i_qa_d_bfwt_31_0 <= twiddle_rsc_0_3_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl
    (
  core_wen, core_wten, twiddle_rsc_0_3_i_oswt, twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsc_0_3_i_biwt, twiddle_rsc_0_3_i_bdwt, twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_rsc_0_3_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_3_i_oswt;
  input [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsc_0_3_i_biwt;
  output twiddle_rsc_0_3_i_bdwt;
  output [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsc_0_3_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_31_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_3_i_bdwt = twiddle_rsc_0_3_i_oswt & core_wen;
  assign twiddle_rsc_0_3_i_biwt = (~ core_wten) & twiddle_rsc_0_3_i_oswt;
  assign COMP_LOOP_twiddle_f_and_31_nl = (twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_rsc_0_3_i_oswt_pff;
  assign twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_f_and_31_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp (
  clk, rst, twiddle_rsc_0_2_i_adra_d, twiddle_rsc_0_2_i_qa_d, twiddle_rsc_0_2_i_adra_d_core,
      twiddle_rsc_0_2_i_qa_d_mxwt, twiddle_rsc_0_2_i_biwt, twiddle_rsc_0_2_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_2_i_adra_d;
  input [63:0] twiddle_rsc_0_2_i_qa_d;
  input [15:0] twiddle_rsc_0_2_i_adra_d_core;
  output [31:0] twiddle_rsc_0_2_i_qa_d_mxwt;
  input twiddle_rsc_0_2_i_biwt;
  input twiddle_rsc_0_2_i_bdwt;


  // Interconnect Declarations
  reg twiddle_rsc_0_2_i_bcwt;
  reg [31:0] twiddle_rsc_0_2_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_2_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_rsc_0_2_i_qa_d[31:0]),
      twiddle_rsc_0_2_i_qa_d_bfwt_31_0, twiddle_rsc_0_2_i_bcwt);
  assign twiddle_rsc_0_2_i_adra_d = twiddle_rsc_0_2_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_2_i_bcwt <= ~((~(twiddle_rsc_0_2_i_bcwt | twiddle_rsc_0_2_i_biwt))
          | twiddle_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_2_i_biwt ) begin
      twiddle_rsc_0_2_i_qa_d_bfwt_31_0 <= twiddle_rsc_0_2_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl
    (
  core_wen, core_wten, twiddle_rsc_0_2_i_oswt, twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsc_0_2_i_biwt, twiddle_rsc_0_2_i_bdwt, twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_rsc_0_2_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_2_i_oswt;
  input [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsc_0_2_i_biwt;
  output twiddle_rsc_0_2_i_bdwt;
  output [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsc_0_2_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_23_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_2_i_bdwt = twiddle_rsc_0_2_i_oswt & core_wen;
  assign twiddle_rsc_0_2_i_biwt = (~ core_wten) & twiddle_rsc_0_2_i_oswt;
  assign COMP_LOOP_twiddle_f_and_23_nl = (twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_rsc_0_2_i_oswt_pff;
  assign twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_f_and_23_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp (
  clk, rst, twiddle_rsc_0_1_i_adra_d, twiddle_rsc_0_1_i_qa_d, twiddle_rsc_0_1_i_adra_d_core,
      twiddle_rsc_0_1_i_qa_d_mxwt, twiddle_rsc_0_1_i_biwt, twiddle_rsc_0_1_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_1_i_adra_d;
  input [63:0] twiddle_rsc_0_1_i_qa_d;
  input [15:0] twiddle_rsc_0_1_i_adra_d_core;
  output [31:0] twiddle_rsc_0_1_i_qa_d_mxwt;
  input twiddle_rsc_0_1_i_biwt;
  input twiddle_rsc_0_1_i_bdwt;


  // Interconnect Declarations
  reg twiddle_rsc_0_1_i_bcwt;
  reg [31:0] twiddle_rsc_0_1_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_1_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_rsc_0_1_i_qa_d[31:0]),
      twiddle_rsc_0_1_i_qa_d_bfwt_31_0, twiddle_rsc_0_1_i_bcwt);
  assign twiddle_rsc_0_1_i_adra_d = twiddle_rsc_0_1_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_1_i_bcwt <= ~((~(twiddle_rsc_0_1_i_bcwt | twiddle_rsc_0_1_i_biwt))
          | twiddle_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_1_i_biwt ) begin
      twiddle_rsc_0_1_i_qa_d_bfwt_31_0 <= twiddle_rsc_0_1_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl
    (
  core_wen, core_wten, twiddle_rsc_0_1_i_oswt, twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsc_0_1_i_biwt, twiddle_rsc_0_1_i_bdwt, twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_rsc_0_1_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_1_i_oswt;
  input [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsc_0_1_i_biwt;
  output twiddle_rsc_0_1_i_bdwt;
  output [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsc_0_1_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_15_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_1_i_bdwt = twiddle_rsc_0_1_i_oswt & core_wen;
  assign twiddle_rsc_0_1_i_biwt = (~ core_wten) & twiddle_rsc_0_1_i_oswt;
  assign COMP_LOOP_twiddle_f_and_15_nl = (twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_rsc_0_1_i_oswt_pff;
  assign twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_f_and_15_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp (
  clk, rst, twiddle_rsc_0_0_i_adra_d, twiddle_rsc_0_0_i_qa_d, twiddle_rsc_0_0_i_adra_d_core,
      twiddle_rsc_0_0_i_qa_d_mxwt, twiddle_rsc_0_0_i_biwt, twiddle_rsc_0_0_i_bdwt
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_0_i_adra_d;
  input [63:0] twiddle_rsc_0_0_i_qa_d;
  input [15:0] twiddle_rsc_0_0_i_adra_d_core;
  output [31:0] twiddle_rsc_0_0_i_qa_d_mxwt;
  input twiddle_rsc_0_0_i_biwt;
  input twiddle_rsc_0_0_i_bdwt;


  // Interconnect Declarations
  reg twiddle_rsc_0_0_i_bcwt;
  reg [31:0] twiddle_rsc_0_0_i_qa_d_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_0_i_qa_d_mxwt = MUX_v_32_2_2((twiddle_rsc_0_0_i_qa_d[31:0]),
      twiddle_rsc_0_0_i_qa_d_bfwt_31_0, twiddle_rsc_0_0_i_bcwt);
  assign twiddle_rsc_0_0_i_adra_d = twiddle_rsc_0_0_i_adra_d_core[7:0];
  always @(posedge clk) begin
    if ( rst ) begin
      twiddle_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      twiddle_rsc_0_0_i_bcwt <= ~((~(twiddle_rsc_0_0_i_bcwt | twiddle_rsc_0_0_i_biwt))
          | twiddle_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( twiddle_rsc_0_0_i_biwt ) begin
      twiddle_rsc_0_0_i_qa_d_bfwt_31_0 <= twiddle_rsc_0_0_i_qa_d[31:0];
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl
    (
  core_wen, core_wten, twiddle_rsc_0_0_i_oswt, twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      twiddle_rsc_0_0_i_biwt, twiddle_rsc_0_0_i_bdwt, twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct,
      core_wten_pff, twiddle_rsc_0_0_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_0_i_oswt;
  input [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output twiddle_rsc_0_0_i_biwt;
  output twiddle_rsc_0_0_i_bdwt;
  output [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  input core_wten_pff;
  input twiddle_rsc_0_0_i_oswt_pff;


  wire[0:0] COMP_LOOP_twiddle_f_and_7_nl;

  // Interconnect Declarations for Component Instantiations 
  assign twiddle_rsc_0_0_i_bdwt = twiddle_rsc_0_0_i_oswt & core_wen;
  assign twiddle_rsc_0_0_i_biwt = (~ core_wten) & twiddle_rsc_0_0_i_oswt;
  assign COMP_LOOP_twiddle_f_and_7_nl = (twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])
      & (~ core_wten_pff) & twiddle_rsc_0_0_i_oswt_pff;
  assign twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct = {1'b0 , COMP_LOOP_twiddle_f_and_7_nl};
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_dp (
  clk, rst, vec_rsc_0_7_i_q_d, vec_rsc_0_7_i_q_d_mxwt, vec_rsc_0_7_i_biwt, vec_rsc_0_7_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_7_i_q_d;
  output [31:0] vec_rsc_0_7_i_q_d_mxwt;
  input vec_rsc_0_7_i_biwt;
  input vec_rsc_0_7_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_7_i_bcwt;
  reg [31:0] vec_rsc_0_7_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_7_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_7_i_q_d, vec_rsc_0_7_i_q_d_bfwt,
      vec_rsc_0_7_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_7_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_7_i_bcwt <= ~((~(vec_rsc_0_7_i_bcwt | vec_rsc_0_7_i_biwt)) | vec_rsc_0_7_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_7_i_biwt ) begin
      vec_rsc_0_7_i_q_d_bfwt <= vec_rsc_0_7_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_7_i_oswt, vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_7_i_biwt, vec_rsc_0_7_i_bdwt, vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_7_i_we_d_core_sct_pff, vec_rsc_0_7_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_7_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_7_i_oswt;
  input vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_7_i_biwt;
  output vec_rsc_0_7_i_bdwt;
  output vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_7_i_we_d_core_sct_pff;
  input vec_rsc_0_7_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_7_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_7_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_7_i_bdwt = vec_rsc_0_7_i_oswt & core_wen;
  assign vec_rsc_0_7_i_biwt = (~ core_wten) & vec_rsc_0_7_i_oswt;
  assign vec_rsc_0_7_i_we_d_core_sct_pff = vec_rsc_0_7_i_we_d_core_psct_pff & vec_rsc_0_7_i_dswt_pff;
  assign vec_rsc_0_7_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_7_i_oswt_pff;
  assign vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_7_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_dp (
  clk, rst, vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_q_d_mxwt, vec_rsc_0_6_i_biwt, vec_rsc_0_6_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_6_i_q_d;
  output [31:0] vec_rsc_0_6_i_q_d_mxwt;
  input vec_rsc_0_6_i_biwt;
  input vec_rsc_0_6_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_6_i_bcwt;
  reg [31:0] vec_rsc_0_6_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_6_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_q_d_bfwt,
      vec_rsc_0_6_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_6_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_6_i_bcwt <= ~((~(vec_rsc_0_6_i_bcwt | vec_rsc_0_6_i_biwt)) | vec_rsc_0_6_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_6_i_biwt ) begin
      vec_rsc_0_6_i_q_d_bfwt <= vec_rsc_0_6_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_6_i_oswt, vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_6_i_biwt, vec_rsc_0_6_i_bdwt, vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_6_i_we_d_core_sct_pff, vec_rsc_0_6_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_6_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_6_i_oswt;
  input vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_6_i_biwt;
  output vec_rsc_0_6_i_bdwt;
  output vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_6_i_we_d_core_sct_pff;
  input vec_rsc_0_6_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_6_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_6_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_6_i_bdwt = vec_rsc_0_6_i_oswt & core_wen;
  assign vec_rsc_0_6_i_biwt = (~ core_wten) & vec_rsc_0_6_i_oswt;
  assign vec_rsc_0_6_i_we_d_core_sct_pff = vec_rsc_0_6_i_we_d_core_psct_pff & vec_rsc_0_6_i_dswt_pff;
  assign vec_rsc_0_6_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_6_i_oswt_pff;
  assign vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_6_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_dp (
  clk, rst, vec_rsc_0_5_i_q_d, vec_rsc_0_5_i_q_d_mxwt, vec_rsc_0_5_i_biwt, vec_rsc_0_5_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_5_i_q_d;
  output [31:0] vec_rsc_0_5_i_q_d_mxwt;
  input vec_rsc_0_5_i_biwt;
  input vec_rsc_0_5_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_5_i_bcwt;
  reg [31:0] vec_rsc_0_5_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_5_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_5_i_q_d, vec_rsc_0_5_i_q_d_bfwt,
      vec_rsc_0_5_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_5_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_5_i_bcwt <= ~((~(vec_rsc_0_5_i_bcwt | vec_rsc_0_5_i_biwt)) | vec_rsc_0_5_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_5_i_biwt ) begin
      vec_rsc_0_5_i_q_d_bfwt <= vec_rsc_0_5_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_5_i_oswt, vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_5_i_biwt, vec_rsc_0_5_i_bdwt, vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_5_i_we_d_core_sct_pff, vec_rsc_0_5_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_5_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_5_i_oswt;
  input vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_5_i_biwt;
  output vec_rsc_0_5_i_bdwt;
  output vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_5_i_we_d_core_sct_pff;
  input vec_rsc_0_5_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_5_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_5_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_5_i_bdwt = vec_rsc_0_5_i_oswt & core_wen;
  assign vec_rsc_0_5_i_biwt = (~ core_wten) & vec_rsc_0_5_i_oswt;
  assign vec_rsc_0_5_i_we_d_core_sct_pff = vec_rsc_0_5_i_we_d_core_psct_pff & vec_rsc_0_5_i_dswt_pff;
  assign vec_rsc_0_5_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_5_i_oswt_pff;
  assign vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_5_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_dp (
  clk, rst, vec_rsc_0_4_i_q_d, vec_rsc_0_4_i_q_d_mxwt, vec_rsc_0_4_i_biwt, vec_rsc_0_4_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_4_i_q_d;
  output [31:0] vec_rsc_0_4_i_q_d_mxwt;
  input vec_rsc_0_4_i_biwt;
  input vec_rsc_0_4_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_4_i_bcwt;
  reg [31:0] vec_rsc_0_4_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_4_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_4_i_q_d, vec_rsc_0_4_i_q_d_bfwt,
      vec_rsc_0_4_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_4_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_4_i_bcwt <= ~((~(vec_rsc_0_4_i_bcwt | vec_rsc_0_4_i_biwt)) | vec_rsc_0_4_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_4_i_biwt ) begin
      vec_rsc_0_4_i_q_d_bfwt <= vec_rsc_0_4_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_4_i_oswt, vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_4_i_biwt, vec_rsc_0_4_i_bdwt, vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_4_i_we_d_core_sct_pff, vec_rsc_0_4_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_4_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_4_i_oswt;
  input vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_4_i_biwt;
  output vec_rsc_0_4_i_bdwt;
  output vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_4_i_we_d_core_sct_pff;
  input vec_rsc_0_4_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_4_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_4_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_4_i_bdwt = vec_rsc_0_4_i_oswt & core_wen;
  assign vec_rsc_0_4_i_biwt = (~ core_wten) & vec_rsc_0_4_i_oswt;
  assign vec_rsc_0_4_i_we_d_core_sct_pff = vec_rsc_0_4_i_we_d_core_psct_pff & vec_rsc_0_4_i_dswt_pff;
  assign vec_rsc_0_4_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_4_i_oswt_pff;
  assign vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_4_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_dp (
  clk, rst, vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_q_d_mxwt, vec_rsc_0_3_i_biwt, vec_rsc_0_3_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_3_i_q_d;
  output [31:0] vec_rsc_0_3_i_q_d_mxwt;
  input vec_rsc_0_3_i_biwt;
  input vec_rsc_0_3_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_3_i_bcwt;
  reg [31:0] vec_rsc_0_3_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_3_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_q_d_bfwt,
      vec_rsc_0_3_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_3_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_3_i_bcwt <= ~((~(vec_rsc_0_3_i_bcwt | vec_rsc_0_3_i_biwt)) | vec_rsc_0_3_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_3_i_biwt ) begin
      vec_rsc_0_3_i_q_d_bfwt <= vec_rsc_0_3_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_3_i_oswt, vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_3_i_biwt, vec_rsc_0_3_i_bdwt, vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_3_i_we_d_core_sct_pff, vec_rsc_0_3_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_3_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_3_i_oswt;
  input vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_3_i_biwt;
  output vec_rsc_0_3_i_bdwt;
  output vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_3_i_we_d_core_sct_pff;
  input vec_rsc_0_3_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_3_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_3_i_bdwt = vec_rsc_0_3_i_oswt & core_wen;
  assign vec_rsc_0_3_i_biwt = (~ core_wten) & vec_rsc_0_3_i_oswt;
  assign vec_rsc_0_3_i_we_d_core_sct_pff = vec_rsc_0_3_i_we_d_core_psct_pff & vec_rsc_0_3_i_dswt_pff;
  assign vec_rsc_0_3_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_3_i_oswt_pff;
  assign vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_3_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_dp (
  clk, rst, vec_rsc_0_2_i_q_d, vec_rsc_0_2_i_q_d_mxwt, vec_rsc_0_2_i_biwt, vec_rsc_0_2_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_2_i_q_d;
  output [31:0] vec_rsc_0_2_i_q_d_mxwt;
  input vec_rsc_0_2_i_biwt;
  input vec_rsc_0_2_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_2_i_bcwt;
  reg [31:0] vec_rsc_0_2_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_2_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_2_i_q_d, vec_rsc_0_2_i_q_d_bfwt,
      vec_rsc_0_2_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_2_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_2_i_bcwt <= ~((~(vec_rsc_0_2_i_bcwt | vec_rsc_0_2_i_biwt)) | vec_rsc_0_2_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_2_i_biwt ) begin
      vec_rsc_0_2_i_q_d_bfwt <= vec_rsc_0_2_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_2_i_oswt, vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_2_i_biwt, vec_rsc_0_2_i_bdwt, vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_2_i_we_d_core_sct_pff, vec_rsc_0_2_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_2_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_2_i_oswt;
  input vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_2_i_biwt;
  output vec_rsc_0_2_i_bdwt;
  output vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_2_i_we_d_core_sct_pff;
  input vec_rsc_0_2_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_2_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_2_i_bdwt = vec_rsc_0_2_i_oswt & core_wen;
  assign vec_rsc_0_2_i_biwt = (~ core_wten) & vec_rsc_0_2_i_oswt;
  assign vec_rsc_0_2_i_we_d_core_sct_pff = vec_rsc_0_2_i_we_d_core_psct_pff & vec_rsc_0_2_i_dswt_pff;
  assign vec_rsc_0_2_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_2_i_oswt_pff;
  assign vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_2_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp (
  clk, rst, vec_rsc_0_1_i_q_d, vec_rsc_0_1_i_q_d_mxwt, vec_rsc_0_1_i_biwt, vec_rsc_0_1_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_1_i_q_d;
  output [31:0] vec_rsc_0_1_i_q_d_mxwt;
  input vec_rsc_0_1_i_biwt;
  input vec_rsc_0_1_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_1_i_bcwt;
  reg [31:0] vec_rsc_0_1_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_1_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_1_i_q_d, vec_rsc_0_1_i_q_d_bfwt,
      vec_rsc_0_1_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_1_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_1_i_bcwt <= ~((~(vec_rsc_0_1_i_bcwt | vec_rsc_0_1_i_biwt)) | vec_rsc_0_1_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_1_i_biwt ) begin
      vec_rsc_0_1_i_q_d_bfwt <= vec_rsc_0_1_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_1_i_oswt, vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_1_i_biwt, vec_rsc_0_1_i_bdwt, vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_1_i_we_d_core_sct_pff, vec_rsc_0_1_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_1_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_1_i_oswt;
  input vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_1_i_biwt;
  output vec_rsc_0_1_i_bdwt;
  output vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_1_i_we_d_core_sct_pff;
  input vec_rsc_0_1_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_1_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_1_i_bdwt = vec_rsc_0_1_i_oswt & core_wen;
  assign vec_rsc_0_1_i_biwt = (~ core_wten) & vec_rsc_0_1_i_oswt;
  assign vec_rsc_0_1_i_we_d_core_sct_pff = vec_rsc_0_1_i_we_d_core_psct_pff & vec_rsc_0_1_i_dswt_pff;
  assign vec_rsc_0_1_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_1_i_oswt_pff;
  assign vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_1_i_dswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_wait_dp (
  ensig_cgo_iro, ensig_cgo_iro_1, core_wen, ensig_cgo, mult_cmp_ccs_ccore_en, ensig_cgo_1,
      modulo_sub_cmp_ccs_ccore_en
);
  input ensig_cgo_iro;
  input ensig_cgo_iro_1;
  input core_wen;
  input ensig_cgo;
  output mult_cmp_ccs_ccore_en;
  input ensig_cgo_1;
  output modulo_sub_cmp_ccs_ccore_en;



  // Interconnect Declarations for Component Instantiations 
  assign mult_cmp_ccs_ccore_en = core_wen & (ensig_cgo | ensig_cgo_iro);
  assign modulo_sub_cmp_ccs_ccore_en = core_wen & (ensig_cgo_1 | ensig_cgo_iro_1);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp (
  clk, rst, vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_q_d_mxwt, vec_rsc_0_0_i_biwt, vec_rsc_0_0_i_bdwt
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_0_i_q_d;
  output [31:0] vec_rsc_0_0_i_q_d_mxwt;
  input vec_rsc_0_0_i_biwt;
  input vec_rsc_0_0_i_bdwt;


  // Interconnect Declarations
  reg vec_rsc_0_0_i_bcwt;
  reg [31:0] vec_rsc_0_0_i_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_0_i_q_d_mxwt = MUX_v_32_2_2(vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_q_d_bfwt,
      vec_rsc_0_0_i_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      vec_rsc_0_0_i_bcwt <= 1'b0;
    end
    else begin
      vec_rsc_0_0_i_bcwt <= ~((~(vec_rsc_0_0_i_bcwt | vec_rsc_0_0_i_biwt)) | vec_rsc_0_0_i_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( vec_rsc_0_0_i_biwt ) begin
      vec_rsc_0_0_i_q_d_bfwt <= vec_rsc_0_0_i_q_d;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl (
  core_wen, core_wten, vec_rsc_0_0_i_oswt, vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_0_i_biwt, vec_rsc_0_0_i_bdwt, vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct,
      vec_rsc_0_0_i_we_d_core_sct_pff, vec_rsc_0_0_i_we_d_core_psct_pff, core_wten_pff,
      vec_rsc_0_0_i_oswt_pff
);
  input core_wen;
  input core_wten;
  input vec_rsc_0_0_i_oswt;
  input vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_0_i_biwt;
  output vec_rsc_0_0_i_bdwt;
  output vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  output vec_rsc_0_0_i_we_d_core_sct_pff;
  input vec_rsc_0_0_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_0_i_dswt_pff;


  // Interconnect Declarations for Component Instantiations 
  assign vec_rsc_0_0_i_bdwt = vec_rsc_0_0_i_oswt & core_wen;
  assign vec_rsc_0_0_i_biwt = (~ core_wten) & vec_rsc_0_0_i_oswt;
  assign vec_rsc_0_0_i_we_d_core_sct_pff = vec_rsc_0_0_i_we_d_core_psct_pff & vec_rsc_0_0_i_dswt_pff;
  assign vec_rsc_0_0_i_dswt_pff = (~ core_wten_pff) & vec_rsc_0_0_i_oswt_pff;
  assign vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct = vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      & vec_rsc_0_0_i_dswt_pff;
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
      complete_rsci_ldout_core_sct, complete_rsci_vdout
);
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_biwt;
  output complete_rsci_bdwt;
  input complete_rsci_bcwt;
  output complete_rsci_ldout_core_sct;
  input complete_rsci_vdout;


  // Interconnect Declarations
  wire complete_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign complete_rsci_bdwt = complete_rsci_oswt & core_wen;
  assign complete_rsci_biwt = complete_rsci_ogwt & complete_rsci_vdout;
  assign complete_rsci_ogwt = complete_rsci_oswt & (~ complete_rsci_bcwt);
  assign complete_rsci_ldout_core_sct = complete_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci_run_wait_dp (
  clk, rst, run_rsci_vdin_mxwt, run_rsci_biwt, run_rsci_bdwt, run_rsci_vdin
);
  input clk;
  input rst;
  output run_rsci_vdin_mxwt;
  input run_rsci_biwt;
  input run_rsci_bdwt;
  input run_rsci_vdin;


  // Interconnect Declarations
  reg run_rsci_bcwt;
  reg run_rsci_vdin_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign run_rsci_vdin_mxwt = MUX_s_1_2_2(run_rsci_vdin, run_rsci_vdin_bfwt, run_rsci_bcwt);
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
      run_rsci_vdin_bfwt <= run_rsci_vdin;
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj (
  twiddle_h_rsc_triosy_0_0_lz, core_wten, twiddle_h_rsc_triosy_0_0_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_0_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_0_obj (
      .ld(twiddle_h_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_0_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj_twiddle_h_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_0_obj_iswt0(twiddle_h_rsc_triosy_0_0_obj_iswt0),
      .twiddle_h_rsc_triosy_0_0_obj_ld_core_sct(twiddle_h_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj (
  twiddle_h_rsc_triosy_0_1_lz, core_wten, twiddle_h_rsc_triosy_0_1_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_1_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_1_obj (
      .ld(twiddle_h_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_1_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj_twiddle_h_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_1_obj_iswt0(twiddle_h_rsc_triosy_0_1_obj_iswt0),
      .twiddle_h_rsc_triosy_0_1_obj_ld_core_sct(twiddle_h_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj (
  twiddle_h_rsc_triosy_0_2_lz, core_wten, twiddle_h_rsc_triosy_0_2_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_2_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_2_obj (
      .ld(twiddle_h_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_2_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj_twiddle_h_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_2_obj_iswt0(twiddle_h_rsc_triosy_0_2_obj_iswt0),
      .twiddle_h_rsc_triosy_0_2_obj_ld_core_sct(twiddle_h_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj (
  twiddle_h_rsc_triosy_0_3_lz, core_wten, twiddle_h_rsc_triosy_0_3_obj_iswt0
);
  output twiddle_h_rsc_triosy_0_3_lz;
  input core_wten;
  input twiddle_h_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_h_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_h_rsc_triosy_0_3_obj (
      .ld(twiddle_h_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(twiddle_h_rsc_triosy_0_3_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj_twiddle_h_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_3_obj_iswt0(twiddle_h_rsc_triosy_0_3_obj_iswt0),
      .twiddle_h_rsc_triosy_0_3_obj_ld_core_sct(twiddle_h_rsc_triosy_0_3_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj (
  twiddle_rsc_triosy_0_0_lz, core_wten, twiddle_rsc_triosy_0_0_obj_iswt0
);
  output twiddle_rsc_triosy_0_0_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_0_obj (
      .ld(twiddle_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_0_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj_twiddle_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_0_obj_iswt0(twiddle_rsc_triosy_0_0_obj_iswt0),
      .twiddle_rsc_triosy_0_0_obj_ld_core_sct(twiddle_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj (
  twiddle_rsc_triosy_0_1_lz, core_wten, twiddle_rsc_triosy_0_1_obj_iswt0
);
  output twiddle_rsc_triosy_0_1_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_1_obj (
      .ld(twiddle_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_1_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj_twiddle_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_1_obj_iswt0(twiddle_rsc_triosy_0_1_obj_iswt0),
      .twiddle_rsc_triosy_0_1_obj_ld_core_sct(twiddle_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj (
  twiddle_rsc_triosy_0_2_lz, core_wten, twiddle_rsc_triosy_0_2_obj_iswt0
);
  output twiddle_rsc_triosy_0_2_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_2_obj (
      .ld(twiddle_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_2_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj_twiddle_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_2_obj_iswt0(twiddle_rsc_triosy_0_2_obj_iswt0),
      .twiddle_rsc_triosy_0_2_obj_ld_core_sct(twiddle_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj (
  twiddle_rsc_triosy_0_3_lz, core_wten, twiddle_rsc_triosy_0_3_obj_iswt0
);
  output twiddle_rsc_triosy_0_3_lz;
  input core_wten;
  input twiddle_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire twiddle_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) twiddle_rsc_triosy_0_3_obj (
      .ld(twiddle_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(twiddle_rsc_triosy_0_3_lz)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl
      inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj_twiddle_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_3_obj_iswt0(twiddle_rsc_triosy_0_3_obj_iswt0),
      .twiddle_rsc_triosy_0_3_obj_ld_core_sct(twiddle_rsc_triosy_0_3_obj_ld_core_sct)
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj (
  vec_rsc_triosy_0_0_lz, core_wten, vec_rsc_triosy_0_0_obj_iswt0
);
  output vec_rsc_triosy_0_0_lz;
  input core_wten;
  input vec_rsc_triosy_0_0_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_0_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_0_obj (
      .ld(vec_rsc_triosy_0_0_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_0_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_vec_rsc_triosy_0_0_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_vec_rsc_triosy_0_0_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_0_obj_iswt0(vec_rsc_triosy_0_0_obj_iswt0),
      .vec_rsc_triosy_0_0_obj_ld_core_sct(vec_rsc_triosy_0_0_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj (
  vec_rsc_triosy_0_1_lz, core_wten, vec_rsc_triosy_0_1_obj_iswt0
);
  output vec_rsc_triosy_0_1_lz;
  input core_wten;
  input vec_rsc_triosy_0_1_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_1_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_1_obj (
      .ld(vec_rsc_triosy_0_1_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_1_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_vec_rsc_triosy_0_1_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_vec_rsc_triosy_0_1_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_1_obj_iswt0(vec_rsc_triosy_0_1_obj_iswt0),
      .vec_rsc_triosy_0_1_obj_ld_core_sct(vec_rsc_triosy_0_1_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj (
  vec_rsc_triosy_0_2_lz, core_wten, vec_rsc_triosy_0_2_obj_iswt0
);
  output vec_rsc_triosy_0_2_lz;
  input core_wten;
  input vec_rsc_triosy_0_2_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_2_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_2_obj (
      .ld(vec_rsc_triosy_0_2_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_2_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj_vec_rsc_triosy_0_2_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj_vec_rsc_triosy_0_2_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_2_obj_iswt0(vec_rsc_triosy_0_2_obj_iswt0),
      .vec_rsc_triosy_0_2_obj_ld_core_sct(vec_rsc_triosy_0_2_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj (
  vec_rsc_triosy_0_3_lz, core_wten, vec_rsc_triosy_0_3_obj_iswt0
);
  output vec_rsc_triosy_0_3_lz;
  input core_wten;
  input vec_rsc_triosy_0_3_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_3_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_3_obj (
      .ld(vec_rsc_triosy_0_3_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_3_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj_vec_rsc_triosy_0_3_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj_vec_rsc_triosy_0_3_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_3_obj_iswt0(vec_rsc_triosy_0_3_obj_iswt0),
      .vec_rsc_triosy_0_3_obj_ld_core_sct(vec_rsc_triosy_0_3_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj (
  vec_rsc_triosy_0_4_lz, core_wten, vec_rsc_triosy_0_4_obj_iswt0
);
  output vec_rsc_triosy_0_4_lz;
  input core_wten;
  input vec_rsc_triosy_0_4_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_4_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_4_obj (
      .ld(vec_rsc_triosy_0_4_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_4_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj_vec_rsc_triosy_0_4_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj_vec_rsc_triosy_0_4_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_4_obj_iswt0(vec_rsc_triosy_0_4_obj_iswt0),
      .vec_rsc_triosy_0_4_obj_ld_core_sct(vec_rsc_triosy_0_4_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj (
  vec_rsc_triosy_0_5_lz, core_wten, vec_rsc_triosy_0_5_obj_iswt0
);
  output vec_rsc_triosy_0_5_lz;
  input core_wten;
  input vec_rsc_triosy_0_5_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_5_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_5_obj (
      .ld(vec_rsc_triosy_0_5_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_5_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj_vec_rsc_triosy_0_5_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj_vec_rsc_triosy_0_5_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_5_obj_iswt0(vec_rsc_triosy_0_5_obj_iswt0),
      .vec_rsc_triosy_0_5_obj_ld_core_sct(vec_rsc_triosy_0_5_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj (
  vec_rsc_triosy_0_6_lz, core_wten, vec_rsc_triosy_0_6_obj_iswt0
);
  output vec_rsc_triosy_0_6_lz;
  input core_wten;
  input vec_rsc_triosy_0_6_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_6_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_6_obj (
      .ld(vec_rsc_triosy_0_6_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_6_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj_vec_rsc_triosy_0_6_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj_vec_rsc_triosy_0_6_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_6_obj_iswt0(vec_rsc_triosy_0_6_obj_iswt0),
      .vec_rsc_triosy_0_6_obj_ld_core_sct(vec_rsc_triosy_0_6_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj (
  vec_rsc_triosy_0_7_lz, core_wten, vec_rsc_triosy_0_7_obj_iswt0
);
  output vec_rsc_triosy_0_7_lz;
  input core_wten;
  input vec_rsc_triosy_0_7_obj_iswt0;


  // Interconnect Declarations
  wire vec_rsc_triosy_0_7_obj_ld_core_sct;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) vec_rsc_triosy_0_7_obj (
      .ld(vec_rsc_triosy_0_7_obj_ld_core_sct),
      .lz(vec_rsc_triosy_0_7_lz)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj_vec_rsc_triosy_0_7_wait_ctrl
      inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj_vec_rsc_triosy_0_7_wait_ctrl_inst
      (
      .core_wten(core_wten),
      .vec_rsc_triosy_0_7_obj_iswt0(vec_rsc_triosy_0_7_obj_iswt0),
      .vec_rsc_triosy_0_7_obj_ld_core_sct(vec_rsc_triosy_0_7_obj_ld_core_sct)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1 (
  clk, rst, twiddle_h_rsc_0_3_i_adra_d, twiddle_h_rsc_0_3_i_qa_d, twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsc_0_3_i_oswt, twiddle_h_rsc_0_3_i_adra_d_core,
      twiddle_h_rsc_0_3_i_qa_d_mxwt, twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_h_rsc_0_3_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_3_i_adra_d;
  input [63:0] twiddle_h_rsc_0_3_i_qa_d;
  output [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_3_i_oswt;
  input [15:0] twiddle_h_rsc_0_3_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_3_i_qa_d_mxwt;
  input [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_3_i_biwt;
  wire twiddle_h_rsc_0_3_i_bdwt;
  wire [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_h_rsc_0_3_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_h_rsc_0_3_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_adra_d_core
      = {8'b00000000 , (twiddle_h_rsc_0_3_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_3_i_oswt(twiddle_h_rsc_0_3_i_oswt),
      .twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_ctrl_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsc_0_3_i_biwt(twiddle_h_rsc_0_3_i_biwt),
      .twiddle_h_rsc_0_3_i_bdwt(twiddle_h_rsc_0_3_i_bdwt),
      .twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsc_0_3_i_oswt_pff(twiddle_h_rsc_0_3_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_3_i_adra_d(twiddle_h_rsc_0_3_i_adra_d_reg),
      .twiddle_h_rsc_0_3_i_qa_d(twiddle_h_rsc_0_3_i_qa_d),
      .twiddle_h_rsc_0_3_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_twiddle_h_rsc_0_3_wait_dp_inst_twiddle_h_rsc_0_3_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_3_i_qa_d_mxwt(twiddle_h_rsc_0_3_i_qa_d_mxwt_pconst),
      .twiddle_h_rsc_0_3_i_biwt(twiddle_h_rsc_0_3_i_biwt),
      .twiddle_h_rsc_0_3_i_bdwt(twiddle_h_rsc_0_3_i_bdwt)
    );
  assign twiddle_h_rsc_0_3_i_qa_d_mxwt = twiddle_h_rsc_0_3_i_qa_d_mxwt_pconst;
  assign twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_h_rsc_0_3_i_adra_d = twiddle_h_rsc_0_3_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1 (
  clk, rst, twiddle_h_rsc_0_2_i_adra_d, twiddle_h_rsc_0_2_i_qa_d, twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsc_0_2_i_oswt, twiddle_h_rsc_0_2_i_adra_d_core,
      twiddle_h_rsc_0_2_i_qa_d_mxwt, twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_h_rsc_0_2_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_2_i_adra_d;
  input [63:0] twiddle_h_rsc_0_2_i_qa_d;
  output [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_2_i_oswt;
  input [15:0] twiddle_h_rsc_0_2_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_2_i_qa_d_mxwt;
  input [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_2_i_biwt;
  wire twiddle_h_rsc_0_2_i_bdwt;
  wire [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_h_rsc_0_2_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_h_rsc_0_2_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_adra_d_core
      = {8'b00000000 , (twiddle_h_rsc_0_2_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_2_i_oswt(twiddle_h_rsc_0_2_i_oswt),
      .twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_ctrl_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsc_0_2_i_biwt(twiddle_h_rsc_0_2_i_biwt),
      .twiddle_h_rsc_0_2_i_bdwt(twiddle_h_rsc_0_2_i_bdwt),
      .twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsc_0_2_i_oswt_pff(twiddle_h_rsc_0_2_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_2_i_adra_d(twiddle_h_rsc_0_2_i_adra_d_reg),
      .twiddle_h_rsc_0_2_i_qa_d(twiddle_h_rsc_0_2_i_qa_d),
      .twiddle_h_rsc_0_2_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_twiddle_h_rsc_0_2_wait_dp_inst_twiddle_h_rsc_0_2_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_2_i_qa_d_mxwt(twiddle_h_rsc_0_2_i_qa_d_mxwt_pconst),
      .twiddle_h_rsc_0_2_i_biwt(twiddle_h_rsc_0_2_i_biwt),
      .twiddle_h_rsc_0_2_i_bdwt(twiddle_h_rsc_0_2_i_bdwt)
    );
  assign twiddle_h_rsc_0_2_i_qa_d_mxwt = twiddle_h_rsc_0_2_i_qa_d_mxwt_pconst;
  assign twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_h_rsc_0_2_i_adra_d = twiddle_h_rsc_0_2_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1 (
  clk, rst, twiddle_h_rsc_0_1_i_adra_d, twiddle_h_rsc_0_1_i_qa_d, twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsc_0_1_i_oswt, twiddle_h_rsc_0_1_i_adra_d_core,
      twiddle_h_rsc_0_1_i_qa_d_mxwt, twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_h_rsc_0_1_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_1_i_adra_d;
  input [63:0] twiddle_h_rsc_0_1_i_qa_d;
  output [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_1_i_oswt;
  input [15:0] twiddle_h_rsc_0_1_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_1_i_qa_d_mxwt;
  input [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_1_i_biwt;
  wire twiddle_h_rsc_0_1_i_bdwt;
  wire [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_h_rsc_0_1_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_h_rsc_0_1_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_adra_d_core
      = {8'b00000000 , (twiddle_h_rsc_0_1_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_1_i_oswt(twiddle_h_rsc_0_1_i_oswt),
      .twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_ctrl_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsc_0_1_i_biwt(twiddle_h_rsc_0_1_i_biwt),
      .twiddle_h_rsc_0_1_i_bdwt(twiddle_h_rsc_0_1_i_bdwt),
      .twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsc_0_1_i_oswt_pff(twiddle_h_rsc_0_1_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_1_i_adra_d(twiddle_h_rsc_0_1_i_adra_d_reg),
      .twiddle_h_rsc_0_1_i_qa_d(twiddle_h_rsc_0_1_i_qa_d),
      .twiddle_h_rsc_0_1_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_twiddle_h_rsc_0_1_wait_dp_inst_twiddle_h_rsc_0_1_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_1_i_qa_d_mxwt(twiddle_h_rsc_0_1_i_qa_d_mxwt_pconst),
      .twiddle_h_rsc_0_1_i_biwt(twiddle_h_rsc_0_1_i_biwt),
      .twiddle_h_rsc_0_1_i_bdwt(twiddle_h_rsc_0_1_i_bdwt)
    );
  assign twiddle_h_rsc_0_1_i_qa_d_mxwt = twiddle_h_rsc_0_1_i_qa_d_mxwt_pconst;
  assign twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_h_rsc_0_1_i_adra_d = twiddle_h_rsc_0_1_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1 (
  clk, rst, twiddle_h_rsc_0_0_i_adra_d, twiddle_h_rsc_0_0_i_qa_d, twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_h_rsc_0_0_i_oswt, twiddle_h_rsc_0_0_i_adra_d_core,
      twiddle_h_rsc_0_0_i_qa_d_mxwt, twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_h_rsc_0_0_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_h_rsc_0_0_i_adra_d;
  input [63:0] twiddle_h_rsc_0_0_i_qa_d;
  output [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_h_rsc_0_0_i_oswt;
  input [15:0] twiddle_h_rsc_0_0_i_adra_d_core;
  output [31:0] twiddle_h_rsc_0_0_i_qa_d_mxwt;
  input [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_h_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_h_rsc_0_0_i_biwt;
  wire twiddle_h_rsc_0_0_i_bdwt;
  wire [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_h_rsc_0_0_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_h_rsc_0_0_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_adra_d_core
      = {8'b00000000 , (twiddle_h_rsc_0_0_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_0_i_oswt(twiddle_h_rsc_0_0_i_oswt),
      .twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_ctrl_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_h_rsc_0_0_i_biwt(twiddle_h_rsc_0_0_i_biwt),
      .twiddle_h_rsc_0_0_i_bdwt(twiddle_h_rsc_0_0_i_bdwt),
      .twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_h_rsc_0_0_i_oswt_pff(twiddle_h_rsc_0_0_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_0_i_adra_d(twiddle_h_rsc_0_0_i_adra_d_reg),
      .twiddle_h_rsc_0_0_i_qa_d(twiddle_h_rsc_0_0_i_qa_d),
      .twiddle_h_rsc_0_0_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_twiddle_h_rsc_0_0_wait_dp_inst_twiddle_h_rsc_0_0_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_0_i_qa_d_mxwt(twiddle_h_rsc_0_0_i_qa_d_mxwt_pconst),
      .twiddle_h_rsc_0_0_i_biwt(twiddle_h_rsc_0_0_i_biwt),
      .twiddle_h_rsc_0_0_i_bdwt(twiddle_h_rsc_0_0_i_bdwt)
    );
  assign twiddle_h_rsc_0_0_i_qa_d_mxwt = twiddle_h_rsc_0_0_i_qa_d_mxwt_pconst;
  assign twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_h_rsc_0_0_i_adra_d = twiddle_h_rsc_0_0_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1 (
  clk, rst, twiddle_rsc_0_3_i_adra_d, twiddle_rsc_0_3_i_qa_d, twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsc_0_3_i_oswt, twiddle_rsc_0_3_i_adra_d_core,
      twiddle_rsc_0_3_i_qa_d_mxwt, twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_rsc_0_3_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_3_i_adra_d;
  input [63:0] twiddle_rsc_0_3_i_qa_d;
  output [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_3_i_oswt;
  input [15:0] twiddle_rsc_0_3_i_adra_d_core;
  output [31:0] twiddle_rsc_0_3_i_qa_d_mxwt;
  input [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsc_0_3_i_biwt;
  wire twiddle_rsc_0_3_i_bdwt;
  wire [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_rsc_0_3_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_rsc_0_3_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_adra_d_core
      = {8'b00000000 , (twiddle_rsc_0_3_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsc_0_3_i_oswt(twiddle_rsc_0_3_i_oswt),
      .twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_ctrl_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsc_0_3_i_biwt(twiddle_rsc_0_3_i_biwt),
      .twiddle_rsc_0_3_i_bdwt(twiddle_rsc_0_3_i_bdwt),
      .twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsc_0_3_i_oswt_pff(twiddle_rsc_0_3_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_3_i_adra_d(twiddle_rsc_0_3_i_adra_d_reg),
      .twiddle_rsc_0_3_i_qa_d(twiddle_rsc_0_3_i_qa_d),
      .twiddle_rsc_0_3_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_twiddle_rsc_0_3_wait_dp_inst_twiddle_rsc_0_3_i_adra_d_core[15:0]),
      .twiddle_rsc_0_3_i_qa_d_mxwt(twiddle_rsc_0_3_i_qa_d_mxwt_pconst),
      .twiddle_rsc_0_3_i_biwt(twiddle_rsc_0_3_i_biwt),
      .twiddle_rsc_0_3_i_bdwt(twiddle_rsc_0_3_i_bdwt)
    );
  assign twiddle_rsc_0_3_i_qa_d_mxwt = twiddle_rsc_0_3_i_qa_d_mxwt_pconst;
  assign twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_rsc_0_3_i_adra_d = twiddle_rsc_0_3_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1 (
  clk, rst, twiddle_rsc_0_2_i_adra_d, twiddle_rsc_0_2_i_qa_d, twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsc_0_2_i_oswt, twiddle_rsc_0_2_i_adra_d_core,
      twiddle_rsc_0_2_i_qa_d_mxwt, twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_rsc_0_2_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_2_i_adra_d;
  input [63:0] twiddle_rsc_0_2_i_qa_d;
  output [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_2_i_oswt;
  input [15:0] twiddle_rsc_0_2_i_adra_d_core;
  output [31:0] twiddle_rsc_0_2_i_qa_d_mxwt;
  input [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsc_0_2_i_biwt;
  wire twiddle_rsc_0_2_i_bdwt;
  wire [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_rsc_0_2_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_rsc_0_2_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_adra_d_core
      = {8'b00000000 , (twiddle_rsc_0_2_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsc_0_2_i_oswt(twiddle_rsc_0_2_i_oswt),
      .twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_ctrl_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsc_0_2_i_biwt(twiddle_rsc_0_2_i_biwt),
      .twiddle_rsc_0_2_i_bdwt(twiddle_rsc_0_2_i_bdwt),
      .twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsc_0_2_i_oswt_pff(twiddle_rsc_0_2_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_2_i_adra_d(twiddle_rsc_0_2_i_adra_d_reg),
      .twiddle_rsc_0_2_i_qa_d(twiddle_rsc_0_2_i_qa_d),
      .twiddle_rsc_0_2_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_twiddle_rsc_0_2_wait_dp_inst_twiddle_rsc_0_2_i_adra_d_core[15:0]),
      .twiddle_rsc_0_2_i_qa_d_mxwt(twiddle_rsc_0_2_i_qa_d_mxwt_pconst),
      .twiddle_rsc_0_2_i_biwt(twiddle_rsc_0_2_i_biwt),
      .twiddle_rsc_0_2_i_bdwt(twiddle_rsc_0_2_i_bdwt)
    );
  assign twiddle_rsc_0_2_i_qa_d_mxwt = twiddle_rsc_0_2_i_qa_d_mxwt_pconst;
  assign twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_rsc_0_2_i_adra_d = twiddle_rsc_0_2_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1 (
  clk, rst, twiddle_rsc_0_1_i_adra_d, twiddle_rsc_0_1_i_qa_d, twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsc_0_1_i_oswt, twiddle_rsc_0_1_i_adra_d_core,
      twiddle_rsc_0_1_i_qa_d_mxwt, twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_rsc_0_1_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_1_i_adra_d;
  input [63:0] twiddle_rsc_0_1_i_qa_d;
  output [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_1_i_oswt;
  input [15:0] twiddle_rsc_0_1_i_adra_d_core;
  output [31:0] twiddle_rsc_0_1_i_qa_d_mxwt;
  input [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsc_0_1_i_biwt;
  wire twiddle_rsc_0_1_i_bdwt;
  wire [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_rsc_0_1_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_rsc_0_1_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_adra_d_core
      = {8'b00000000 , (twiddle_rsc_0_1_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsc_0_1_i_oswt(twiddle_rsc_0_1_i_oswt),
      .twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_ctrl_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsc_0_1_i_biwt(twiddle_rsc_0_1_i_biwt),
      .twiddle_rsc_0_1_i_bdwt(twiddle_rsc_0_1_i_bdwt),
      .twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsc_0_1_i_oswt_pff(twiddle_rsc_0_1_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_1_i_adra_d(twiddle_rsc_0_1_i_adra_d_reg),
      .twiddle_rsc_0_1_i_qa_d(twiddle_rsc_0_1_i_qa_d),
      .twiddle_rsc_0_1_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_twiddle_rsc_0_1_wait_dp_inst_twiddle_rsc_0_1_i_adra_d_core[15:0]),
      .twiddle_rsc_0_1_i_qa_d_mxwt(twiddle_rsc_0_1_i_qa_d_mxwt_pconst),
      .twiddle_rsc_0_1_i_biwt(twiddle_rsc_0_1_i_biwt),
      .twiddle_rsc_0_1_i_bdwt(twiddle_rsc_0_1_i_bdwt)
    );
  assign twiddle_rsc_0_1_i_qa_d_mxwt = twiddle_rsc_0_1_i_qa_d_mxwt_pconst;
  assign twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_rsc_0_1_i_adra_d = twiddle_rsc_0_1_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1 (
  clk, rst, twiddle_rsc_0_0_i_adra_d, twiddle_rsc_0_0_i_qa_d, twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      core_wen, core_wten, twiddle_rsc_0_0_i_oswt, twiddle_rsc_0_0_i_adra_d_core,
      twiddle_rsc_0_0_i_qa_d_mxwt, twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct,
      core_wten_pff, twiddle_rsc_0_0_i_oswt_pff
);
  input clk;
  input rst;
  output [7:0] twiddle_rsc_0_0_i_adra_d;
  input [63:0] twiddle_rsc_0_0_i_qa_d;
  output [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input twiddle_rsc_0_0_i_oswt;
  input [15:0] twiddle_rsc_0_0_i_adra_d_core;
  output [31:0] twiddle_rsc_0_0_i_qa_d_mxwt;
  input [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  input core_wten_pff;
  input twiddle_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire twiddle_rsc_0_0_i_biwt;
  wire twiddle_rsc_0_0_i_bdwt;
  wire [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire [31:0] twiddle_rsc_0_0_i_qa_d_mxwt_pconst;
  wire [7:0] twiddle_rsc_0_0_i_adra_d_reg;


  // Interconnect Declarations for Component Instantiations 
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , (twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[0])};
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_adra_d_core
      = {8'b00000000 , (twiddle_rsc_0_0_i_adra_d_core[7:0])};
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .twiddle_rsc_0_0_i_oswt(twiddle_rsc_0_0_i_oswt),
      .twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_ctrl_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .twiddle_rsc_0_0_i_biwt(twiddle_rsc_0_0_i_biwt),
      .twiddle_rsc_0_0_i_bdwt(twiddle_rsc_0_0_i_bdwt),
      .twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct(twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .core_wten_pff(core_wten_pff),
      .twiddle_rsc_0_0_i_oswt_pff(twiddle_rsc_0_0_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_0_i_adra_d(twiddle_rsc_0_0_i_adra_d_reg),
      .twiddle_rsc_0_0_i_qa_d(twiddle_rsc_0_0_i_qa_d),
      .twiddle_rsc_0_0_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_twiddle_rsc_0_0_wait_dp_inst_twiddle_rsc_0_0_i_adra_d_core[15:0]),
      .twiddle_rsc_0_0_i_qa_d_mxwt(twiddle_rsc_0_0_i_qa_d_mxwt_pconst),
      .twiddle_rsc_0_0_i_biwt(twiddle_rsc_0_0_i_biwt),
      .twiddle_rsc_0_0_i_bdwt(twiddle_rsc_0_0_i_bdwt)
    );
  assign twiddle_rsc_0_0_i_qa_d_mxwt = twiddle_rsc_0_0_i_qa_d_mxwt_pconst;
  assign twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_sct;
  assign twiddle_rsc_0_0_i_adra_d = twiddle_rsc_0_0_i_adra_d_reg;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1 (
  clk, rst, vec_rsc_0_7_i_q_d, vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_7_i_oswt, vec_rsc_0_7_i_q_d_mxwt, vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_7_i_we_d_pff, vec_rsc_0_7_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_7_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_7_i_q_d;
  output vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_7_i_oswt;
  output [31:0] vec_rsc_0_7_i_q_d_mxwt;
  input vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_7_i_we_d_pff;
  input vec_rsc_0_7_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_7_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_7_i_biwt;
  wire vec_rsc_0_7_i_bdwt;
  wire vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_7_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_7_i_oswt(vec_rsc_0_7_i_oswt),
      .vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_7_i_biwt(vec_rsc_0_7_i_biwt),
      .vec_rsc_0_7_i_bdwt(vec_rsc_0_7_i_bdwt),
      .vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_7_i_we_d_core_sct_pff(vec_rsc_0_7_i_we_d_core_sct_iff),
      .vec_rsc_0_7_i_we_d_core_psct_pff(vec_rsc_0_7_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_7_i_oswt_pff(vec_rsc_0_7_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_vec_rsc_0_7_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_7_i_q_d(vec_rsc_0_7_i_q_d),
      .vec_rsc_0_7_i_q_d_mxwt(vec_rsc_0_7_i_q_d_mxwt),
      .vec_rsc_0_7_i_biwt(vec_rsc_0_7_i_biwt),
      .vec_rsc_0_7_i_bdwt(vec_rsc_0_7_i_bdwt)
    );
  assign vec_rsc_0_7_i_we_d_pff = vec_rsc_0_7_i_we_d_core_sct_iff;
  assign vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1 (
  clk, rst, vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_6_i_oswt, vec_rsc_0_6_i_q_d_mxwt, vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_6_i_we_d_pff, vec_rsc_0_6_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_6_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_6_i_q_d;
  output vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_6_i_oswt;
  output [31:0] vec_rsc_0_6_i_q_d_mxwt;
  input vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_6_i_we_d_pff;
  input vec_rsc_0_6_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_6_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_6_i_biwt;
  wire vec_rsc_0_6_i_bdwt;
  wire vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_6_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_6_i_oswt(vec_rsc_0_6_i_oswt),
      .vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_6_i_biwt(vec_rsc_0_6_i_biwt),
      .vec_rsc_0_6_i_bdwt(vec_rsc_0_6_i_bdwt),
      .vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_6_i_we_d_core_sct_pff(vec_rsc_0_6_i_we_d_core_sct_iff),
      .vec_rsc_0_6_i_we_d_core_psct_pff(vec_rsc_0_6_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_6_i_oswt_pff(vec_rsc_0_6_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_vec_rsc_0_6_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .vec_rsc_0_6_i_q_d_mxwt(vec_rsc_0_6_i_q_d_mxwt),
      .vec_rsc_0_6_i_biwt(vec_rsc_0_6_i_biwt),
      .vec_rsc_0_6_i_bdwt(vec_rsc_0_6_i_bdwt)
    );
  assign vec_rsc_0_6_i_we_d_pff = vec_rsc_0_6_i_we_d_core_sct_iff;
  assign vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1 (
  clk, rst, vec_rsc_0_5_i_q_d, vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_5_i_oswt, vec_rsc_0_5_i_q_d_mxwt, vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_5_i_we_d_pff, vec_rsc_0_5_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_5_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_5_i_q_d;
  output vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_5_i_oswt;
  output [31:0] vec_rsc_0_5_i_q_d_mxwt;
  input vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_5_i_we_d_pff;
  input vec_rsc_0_5_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_5_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_5_i_biwt;
  wire vec_rsc_0_5_i_bdwt;
  wire vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_5_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_5_i_oswt(vec_rsc_0_5_i_oswt),
      .vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_5_i_biwt(vec_rsc_0_5_i_biwt),
      .vec_rsc_0_5_i_bdwt(vec_rsc_0_5_i_bdwt),
      .vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_5_i_we_d_core_sct_pff(vec_rsc_0_5_i_we_d_core_sct_iff),
      .vec_rsc_0_5_i_we_d_core_psct_pff(vec_rsc_0_5_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_5_i_oswt_pff(vec_rsc_0_5_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_vec_rsc_0_5_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_5_i_q_d(vec_rsc_0_5_i_q_d),
      .vec_rsc_0_5_i_q_d_mxwt(vec_rsc_0_5_i_q_d_mxwt),
      .vec_rsc_0_5_i_biwt(vec_rsc_0_5_i_biwt),
      .vec_rsc_0_5_i_bdwt(vec_rsc_0_5_i_bdwt)
    );
  assign vec_rsc_0_5_i_we_d_pff = vec_rsc_0_5_i_we_d_core_sct_iff;
  assign vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1 (
  clk, rst, vec_rsc_0_4_i_q_d, vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_4_i_oswt, vec_rsc_0_4_i_q_d_mxwt, vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_4_i_we_d_pff, vec_rsc_0_4_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_4_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_4_i_q_d;
  output vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_4_i_oswt;
  output [31:0] vec_rsc_0_4_i_q_d_mxwt;
  input vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_4_i_we_d_pff;
  input vec_rsc_0_4_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_4_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_4_i_biwt;
  wire vec_rsc_0_4_i_bdwt;
  wire vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_4_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_4_i_oswt(vec_rsc_0_4_i_oswt),
      .vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_4_i_biwt(vec_rsc_0_4_i_biwt),
      .vec_rsc_0_4_i_bdwt(vec_rsc_0_4_i_bdwt),
      .vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_4_i_we_d_core_sct_pff(vec_rsc_0_4_i_we_d_core_sct_iff),
      .vec_rsc_0_4_i_we_d_core_psct_pff(vec_rsc_0_4_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_4_i_oswt_pff(vec_rsc_0_4_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_vec_rsc_0_4_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_4_i_q_d_mxwt(vec_rsc_0_4_i_q_d_mxwt),
      .vec_rsc_0_4_i_biwt(vec_rsc_0_4_i_biwt),
      .vec_rsc_0_4_i_bdwt(vec_rsc_0_4_i_bdwt)
    );
  assign vec_rsc_0_4_i_we_d_pff = vec_rsc_0_4_i_we_d_core_sct_iff;
  assign vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1 (
  clk, rst, vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_3_i_oswt, vec_rsc_0_3_i_q_d_mxwt, vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_3_i_we_d_pff, vec_rsc_0_3_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_3_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_3_i_q_d;
  output vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_3_i_oswt;
  output [31:0] vec_rsc_0_3_i_q_d_mxwt;
  input vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_3_i_we_d_pff;
  input vec_rsc_0_3_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_3_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_3_i_biwt;
  wire vec_rsc_0_3_i_bdwt;
  wire vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_3_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_3_i_oswt(vec_rsc_0_3_i_oswt),
      .vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_3_i_biwt(vec_rsc_0_3_i_biwt),
      .vec_rsc_0_3_i_bdwt(vec_rsc_0_3_i_bdwt),
      .vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_3_i_we_d_core_sct_pff(vec_rsc_0_3_i_we_d_core_sct_iff),
      .vec_rsc_0_3_i_we_d_core_psct_pff(vec_rsc_0_3_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_3_i_oswt_pff(vec_rsc_0_3_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_vec_rsc_0_3_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_3_i_q_d(vec_rsc_0_3_i_q_d),
      .vec_rsc_0_3_i_q_d_mxwt(vec_rsc_0_3_i_q_d_mxwt),
      .vec_rsc_0_3_i_biwt(vec_rsc_0_3_i_biwt),
      .vec_rsc_0_3_i_bdwt(vec_rsc_0_3_i_bdwt)
    );
  assign vec_rsc_0_3_i_we_d_pff = vec_rsc_0_3_i_we_d_core_sct_iff;
  assign vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1 (
  clk, rst, vec_rsc_0_2_i_q_d, vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_2_i_oswt, vec_rsc_0_2_i_q_d_mxwt, vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_2_i_we_d_pff, vec_rsc_0_2_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_2_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_2_i_q_d;
  output vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_2_i_oswt;
  output [31:0] vec_rsc_0_2_i_q_d_mxwt;
  input vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_2_i_we_d_pff;
  input vec_rsc_0_2_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_2_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_2_i_biwt;
  wire vec_rsc_0_2_i_bdwt;
  wire vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_2_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_2_i_oswt(vec_rsc_0_2_i_oswt),
      .vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_2_i_biwt(vec_rsc_0_2_i_biwt),
      .vec_rsc_0_2_i_bdwt(vec_rsc_0_2_i_bdwt),
      .vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_2_i_we_d_core_sct_pff(vec_rsc_0_2_i_we_d_core_sct_iff),
      .vec_rsc_0_2_i_we_d_core_psct_pff(vec_rsc_0_2_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_2_i_oswt_pff(vec_rsc_0_2_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_vec_rsc_0_2_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_2_i_q_d_mxwt(vec_rsc_0_2_i_q_d_mxwt),
      .vec_rsc_0_2_i_biwt(vec_rsc_0_2_i_biwt),
      .vec_rsc_0_2_i_bdwt(vec_rsc_0_2_i_bdwt)
    );
  assign vec_rsc_0_2_i_we_d_pff = vec_rsc_0_2_i_we_d_core_sct_iff;
  assign vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1 (
  clk, rst, vec_rsc_0_1_i_q_d, vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_1_i_oswt, vec_rsc_0_1_i_q_d_mxwt, vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_1_i_we_d_pff, vec_rsc_0_1_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_1_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_1_i_q_d;
  output vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_1_i_oswt;
  output [31:0] vec_rsc_0_1_i_q_d_mxwt;
  input vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_1_i_we_d_pff;
  input vec_rsc_0_1_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_1_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_1_i_biwt;
  wire vec_rsc_0_1_i_bdwt;
  wire vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_1_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_1_i_oswt(vec_rsc_0_1_i_oswt),
      .vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_1_i_biwt(vec_rsc_0_1_i_biwt),
      .vec_rsc_0_1_i_bdwt(vec_rsc_0_1_i_bdwt),
      .vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_1_i_we_d_core_sct_pff(vec_rsc_0_1_i_we_d_core_sct_iff),
      .vec_rsc_0_1_i_we_d_core_psct_pff(vec_rsc_0_1_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_1_i_oswt_pff(vec_rsc_0_1_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_vec_rsc_0_1_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .vec_rsc_0_1_i_q_d_mxwt(vec_rsc_0_1_i_q_d_mxwt),
      .vec_rsc_0_1_i_biwt(vec_rsc_0_1_i_biwt),
      .vec_rsc_0_1_i_bdwt(vec_rsc_0_1_i_bdwt)
    );
  assign vec_rsc_0_1_i_we_d_pff = vec_rsc_0_1_i_we_d_core_sct_iff;
  assign vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1 (
  clk, rst, vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d, core_wen,
      core_wten, vec_rsc_0_0_i_oswt, vec_rsc_0_0_i_q_d_mxwt, vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct,
      vec_rsc_0_0_i_we_d_pff, vec_rsc_0_0_i_we_d_core_psct_pff, core_wten_pff, vec_rsc_0_0_i_oswt_pff
);
  input clk;
  input rst;
  input [31:0] vec_rsc_0_0_i_q_d;
  output vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input core_wen;
  input core_wten;
  input vec_rsc_0_0_i_oswt;
  output [31:0] vec_rsc_0_0_i_q_d_mxwt;
  input vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  output vec_rsc_0_0_i_we_d_pff;
  input vec_rsc_0_0_i_we_d_core_psct_pff;
  input core_wten_pff;
  input vec_rsc_0_0_i_oswt_pff;


  // Interconnect Declarations
  wire vec_rsc_0_0_i_biwt;
  wire vec_rsc_0_0_i_bdwt;
  wire vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
  wire vec_rsc_0_0_i_we_d_core_sct_iff;


  // Interconnect Declarations for Component Instantiations 
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .core_wten(core_wten),
      .vec_rsc_0_0_i_oswt(vec_rsc_0_0_i_oswt),
      .vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct),
      .vec_rsc_0_0_i_biwt(vec_rsc_0_0_i_biwt),
      .vec_rsc_0_0_i_bdwt(vec_rsc_0_0_i_bdwt),
      .vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct(vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct),
      .vec_rsc_0_0_i_we_d_core_sct_pff(vec_rsc_0_0_i_we_d_core_sct_iff),
      .vec_rsc_0_0_i_we_d_core_psct_pff(vec_rsc_0_0_i_we_d_core_psct_pff),
      .core_wten_pff(core_wten_pff),
      .vec_rsc_0_0_i_oswt_pff(vec_rsc_0_0_i_oswt_pff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_vec_rsc_0_0_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_0_i_q_d_mxwt(vec_rsc_0_0_i_q_d_mxwt),
      .vec_rsc_0_0_i_biwt(vec_rsc_0_0_i_biwt),
      .vec_rsc_0_0_i_bdwt(vec_rsc_0_0_i_bdwt)
    );
  assign vec_rsc_0_0_i_we_d_pff = vec_rsc_0_0_i_we_d_core_sct_iff;
  assign vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_sct;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core_complete_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_complete_rsci (
  clk, rst, complete_rsc_lzout, complete_rsc_vzout, core_wen, complete_rsci_oswt,
      complete_rsci_wen_comp
);
  input clk;
  input rst;
  output complete_rsc_lzout;
  input complete_rsc_vzout;
  input core_wen;
  input complete_rsci_oswt;
  output complete_rsci_wen_comp;


  // Interconnect Declarations
  wire complete_rsci_biwt;
  wire complete_rsci_bdwt;
  wire complete_rsci_bcwt;
  wire complete_rsci_ldout_core_sct;
  wire complete_rsci_vdout;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_out_v2 #(.rscid(32'sd18)) complete_rsci (
      .ldout(complete_rsci_ldout_core_sct),
      .vdout(complete_rsci_vdout),
      .vzout(complete_rsc_vzout),
      .lzout(complete_rsc_lzout)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl inPlaceNTT_DIF_precomp_core_complete_rsci_complete_wait_ctrl_inst
      (
      .core_wen(core_wen),
      .complete_rsci_oswt(complete_rsci_oswt),
      .complete_rsci_biwt(complete_rsci_biwt),
      .complete_rsci_bdwt(complete_rsci_bdwt),
      .complete_rsci_bcwt(complete_rsci_bcwt),
      .complete_rsci_ldout_core_sct(complete_rsci_ldout_core_sct),
      .complete_rsci_vdout(complete_rsci_vdout)
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
//  Design Unit:    inPlaceNTT_DIF_precomp_core_run_rsci
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core_run_rsci (
  clk, rst, run_rsc_lzin, run_rsc_vzin, core_wen, run_rsci_oswt, core_wten, run_rsci_vdin_mxwt
);
  input clk;
  input rst;
  output run_rsc_lzin;
  input run_rsc_vzin;
  input core_wen;
  input run_rsci_oswt;
  input core_wten;
  output run_rsci_vdin_mxwt;


  // Interconnect Declarations
  wire run_rsci_biwt;
  wire run_rsci_bdwt;
  wire run_rsci_vdin;


  // Interconnect Declarations for Component Instantiations 
  ccs_sync_in_v2 #(.rscid(32'sd12)) run_rsci (
      .vzin(run_rsc_vzin),
      .lzin(run_rsc_lzin),
      .ldin(run_rsci_biwt),
      .vdin(run_rsci_vdin)
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
      .run_rsci_vdin_mxwt(run_rsci_vdin_mxwt),
      .run_rsci_biwt(run_rsci_biwt),
      .run_rsci_bdwt(run_rsci_bdwt),
      .run_rsci_vdin(run_rsci_vdin)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp_core
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp_core (
  clk, rst, run_rsc_lzin, run_rsc_vzin, vec_rsc_triosy_0_0_lz, vec_rsc_triosy_0_1_lz,
      vec_rsc_triosy_0_2_lz, vec_rsc_triosy_0_3_lz, vec_rsc_triosy_0_4_lz, vec_rsc_triosy_0_5_lz,
      vec_rsc_triosy_0_6_lz, vec_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_triosy_lz,
      twiddle_rsc_triosy_0_0_lz, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_triosy_0_3_lz, twiddle_h_rsc_triosy_0_0_lz, twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_triosy_0_2_lz, twiddle_h_rsc_triosy_0_3_lz, complete_rsc_lzout,
      complete_rsc_vzout, vec_rsc_0_0_i_q_d, vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_1_i_q_d, vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_2_i_q_d,
      vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_3_i_q_d, vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_4_i_q_d, vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_5_i_q_d,
      vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d, vec_rsc_0_6_i_q_d, vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_7_i_q_d, vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d, twiddle_rsc_0_0_i_adra_d,
      twiddle_rsc_0_0_i_qa_d, twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_1_i_adra_d, twiddle_rsc_0_1_i_qa_d, twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_2_i_adra_d, twiddle_rsc_0_2_i_qa_d, twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_rsc_0_3_i_adra_d, twiddle_rsc_0_3_i_qa_d, twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsc_0_0_i_adra_d, twiddle_h_rsc_0_0_i_qa_d, twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsc_0_1_i_adra_d, twiddle_h_rsc_0_1_i_qa_d, twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsc_0_2_i_adra_d, twiddle_h_rsc_0_2_i_qa_d, twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      twiddle_h_rsc_0_3_i_adra_d, twiddle_h_rsc_0_3_i_qa_d, twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d,
      vec_rsc_0_0_i_adr_d_pff, vec_rsc_0_0_i_d_d_pff, vec_rsc_0_0_i_we_d_pff, vec_rsc_0_1_i_we_d_pff,
      vec_rsc_0_2_i_we_d_pff, vec_rsc_0_3_i_we_d_pff, vec_rsc_0_4_i_we_d_pff, vec_rsc_0_5_i_we_d_pff,
      vec_rsc_0_6_i_we_d_pff, vec_rsc_0_7_i_we_d_pff
);
  input clk;
  input rst;
  output run_rsc_lzin;
  input run_rsc_vzin;
  output vec_rsc_triosy_0_0_lz;
  output vec_rsc_triosy_0_1_lz;
  output vec_rsc_triosy_0_2_lz;
  output vec_rsc_triosy_0_3_lz;
  output vec_rsc_triosy_0_4_lz;
  output vec_rsc_triosy_0_5_lz;
  output vec_rsc_triosy_0_6_lz;
  output vec_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  output r_rsc_triosy_lz;
  output twiddle_rsc_triosy_0_0_lz;
  output twiddle_rsc_triosy_0_1_lz;
  output twiddle_rsc_triosy_0_2_lz;
  output twiddle_rsc_triosy_0_3_lz;
  output twiddle_h_rsc_triosy_0_0_lz;
  output twiddle_h_rsc_triosy_0_1_lz;
  output twiddle_h_rsc_triosy_0_2_lz;
  output twiddle_h_rsc_triosy_0_3_lz;
  output complete_rsc_lzout;
  input complete_rsc_vzout;
  input [31:0] vec_rsc_0_0_i_q_d;
  output vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_1_i_q_d;
  output vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_2_i_q_d;
  output vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_3_i_q_d;
  output vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_4_i_q_d;
  output vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_5_i_q_d;
  output vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_6_i_q_d;
  output vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d;
  input [31:0] vec_rsc_0_7_i_q_d;
  output vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_rsc_0_0_i_adra_d;
  input [63:0] twiddle_rsc_0_0_i_qa_d;
  output [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_rsc_0_1_i_adra_d;
  input [63:0] twiddle_rsc_0_1_i_qa_d;
  output [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_rsc_0_2_i_adra_d;
  input [63:0] twiddle_rsc_0_2_i_qa_d;
  output [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_rsc_0_3_i_adra_d;
  input [63:0] twiddle_rsc_0_3_i_qa_d;
  output [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_h_rsc_0_0_i_adra_d;
  input [63:0] twiddle_h_rsc_0_0_i_qa_d;
  output [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_h_rsc_0_1_i_adra_d;
  input [63:0] twiddle_h_rsc_0_1_i_qa_d;
  output [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_h_rsc_0_2_i_adra_d;
  input [63:0] twiddle_h_rsc_0_2_i_qa_d;
  output [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [7:0] twiddle_h_rsc_0_3_i_adra_d;
  input [63:0] twiddle_h_rsc_0_3_i_qa_d;
  output [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  output [6:0] vec_rsc_0_0_i_adr_d_pff;
  output [31:0] vec_rsc_0_0_i_d_d_pff;
  output vec_rsc_0_0_i_we_d_pff;
  output vec_rsc_0_1_i_we_d_pff;
  output vec_rsc_0_2_i_we_d_pff;
  output vec_rsc_0_3_i_we_d_pff;
  output vec_rsc_0_4_i_we_d_pff;
  output vec_rsc_0_5_i_we_d_pff;
  output vec_rsc_0_6_i_we_d_pff;
  output vec_rsc_0_7_i_we_d_pff;


  // Interconnect Declarations
  wire core_wten;
  wire run_rsci_vdin_mxwt;
  wire [31:0] p_rsci_idat;
  wire complete_rsci_wen_comp;
  wire [31:0] vec_rsc_0_0_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_1_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_2_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_3_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_4_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_5_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_6_i_q_d_mxwt;
  wire [31:0] vec_rsc_0_7_i_q_d_mxwt;
  wire [31:0] twiddle_rsc_0_0_i_qa_d_mxwt;
  wire [31:0] twiddle_rsc_0_1_i_qa_d_mxwt;
  wire [31:0] twiddle_rsc_0_2_i_qa_d_mxwt;
  wire [31:0] twiddle_rsc_0_3_i_qa_d_mxwt;
  wire [31:0] twiddle_h_rsc_0_0_i_qa_d_mxwt;
  wire [31:0] twiddle_h_rsc_0_1_i_qa_d_mxwt;
  wire [31:0] twiddle_h_rsc_0_2_i_qa_d_mxwt;
  wire [31:0] twiddle_h_rsc_0_3_i_qa_d_mxwt;
  wire [31:0] mult_cmp_return_rsc_z;
  wire mult_cmp_ccs_ccore_en;
  wire [31:0] modulo_sub_cmp_return_rsc_z;
  wire modulo_sub_cmp_ccs_ccore_en;
  wire [31:0] modulo_add_cmp_return_rsc_z;
  wire [17:0] fsm_output;
  wire [9:0] VEC_LOOP_acc_10_tmp;
  wire [11:0] nl_VEC_LOOP_acc_10_tmp;
  wire [9:0] COMP_LOOP_twiddle_f_mul_tmp;
  wire [19:0] nl_COMP_LOOP_twiddle_f_mul_tmp;
  wire and_dcpl_2;
  wire and_dcpl_8;
  wire or_dcpl_8;
  wire and_dcpl_11;
  wire and_dcpl_14;
  wire and_dcpl_16;
  wire and_dcpl_18;
  wire and_dcpl_19;
  wire and_dcpl_20;
  wire and_dcpl_22;
  wire and_dcpl_24;
  wire and_dcpl_25;
  wire and_dcpl_27;
  wire and_dcpl_29;
  wire and_dcpl_30;
  wire and_dcpl_33;
  wire and_dcpl_36;
  wire and_dcpl_37;
  wire and_dcpl_40;
  wire and_dcpl_49;
  wire and_dcpl_50;
  wire or_tmp_64;
  wire and_80_cse;
  wire and_81_cse;
  wire and_98_cse;
  wire and_99_cse;
  wire and_108_cse;
  wire and_109_cse;
  wire and_118_cse;
  wire and_119_cse;
  wire and_128_cse;
  wire and_129_cse;
  wire and_138_cse;
  wire and_139_cse;
  wire and_148_cse;
  wire and_149_cse;
  wire and_158_cse;
  wire and_159_cse;
  reg VEC_LOOP_slc_VEC_LOOP_acc_2_itm;
  reg [9:0] COMP_LOOP_twiddle_f_mul_cse_sva;
  reg VEC_LOOP_VEC_LOOP_and_11_itm;
  reg [9:0] VEC_LOOP_acc_10_cse_sva;
  reg [11:0] COMP_LOOP_k_12_0_sva_11_0;
  wire [9:0] VEC_LOOP_acc_1_cse_sva_mx0w2;
  wire [10:0] nl_VEC_LOOP_acc_1_cse_sva_mx0w2;
  reg [9:0] reg_VEC_LOOP_j_12_0_ftd;
  reg reg_run_rsci_oswt_cse;
  reg reg_complete_rsci_oswt_cse;
  reg reg_vec_rsc_0_0_i_oswt_cse;
  reg reg_vec_rsc_0_1_i_oswt_cse;
  reg reg_vec_rsc_0_2_i_oswt_cse;
  reg reg_vec_rsc_0_3_i_oswt_cse;
  reg reg_vec_rsc_0_4_i_oswt_cse;
  reg reg_vec_rsc_0_5_i_oswt_cse;
  reg reg_vec_rsc_0_6_i_oswt_cse;
  reg reg_vec_rsc_0_7_i_oswt_cse;
  reg reg_twiddle_rsc_0_0_i_oswt_cse;
  reg reg_twiddle_rsc_0_1_i_oswt_cse;
  reg reg_twiddle_rsc_0_2_i_oswt_cse;
  reg reg_twiddle_rsc_0_3_i_oswt_cse;
  reg reg_vec_rsc_triosy_0_7_obj_iswt0_cse;
  reg reg_ensig_cgo_cse;
  reg reg_ensig_cgo_1_cse;
  wire VEC_LOOP_and_cse;
  wire VEC_LOOP_nor_cse;
  wire VEC_LOOP_nor_5_cse;
  wire COMP_LOOP_twiddle_help_and_cse;
  wire COMP_LOOP_twiddle_help_and_1_cse;
  wire COMP_LOOP_twiddle_help_and_2_cse;
  wire COMP_LOOP_twiddle_help_and_3_cse;
  wire VEC_LOOP_VEC_LOOP_and_cse;
  wire vec_rsc_0_0_i_we_d_iff;
  wire core_wten_iff;
  wire or_20_rmff;
  wire vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_1_i_we_d_iff;
  wire or_27_rmff;
  wire vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_2_i_we_d_iff;
  wire or_30_rmff;
  wire vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_3_i_we_d_iff;
  wire or_33_rmff;
  wire vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_4_i_we_d_iff;
  wire or_36_rmff;
  wire vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_5_i_we_d_iff;
  wire or_39_rmff;
  wire vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_6_i_we_d_iff;
  wire or_42_rmff;
  wire vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire vec_rsc_0_7_i_we_d_iff;
  wire or_45_rmff;
  wire vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [7:0] twiddle_rsc_0_0_i_adra_d_reg;
  wire [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_167_rmff;
  wire [7:0] twiddle_rsc_0_1_i_adra_d_reg;
  wire [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_171_rmff;
  wire [7:0] twiddle_rsc_0_2_i_adra_d_reg;
  wire [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_175_rmff;
  wire [7:0] twiddle_rsc_0_3_i_adra_d_reg;
  wire [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire and_179_rmff;
  wire [7:0] twiddle_h_rsc_0_0_i_adra_d_reg;
  wire [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [7:0] twiddle_h_rsc_0_1_i_adra_d_reg;
  wire [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [7:0] twiddle_h_rsc_0_2_i_adra_d_reg;
  wire [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire [7:0] twiddle_h_rsc_0_3_i_adra_d_reg;
  wire [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  wire or_61_rmff;
  wire or_63_rmff;
  reg [31:0] tmp_2_lpi_3_dfm;
  reg [31:0] tmp_3_lpi_3_dfm;
  reg [31:0] tmp_1_lpi_4_dfm;
  reg [31:0] p_sva;
  wire [12:0] z_out;
  wire [12:0] z_out_1;
  wire [3:0] z_out_2;
  wire [4:0] nl_z_out_2;
  wire [31:0] z_out_3;
  reg [3:0] STAGE_LOOP_i_3_0_sva;
  reg [12:0] STAGE_LOOP_lshift_psp_sva;
  reg VEC_LOOP_VEC_LOOP_nor_itm;
  reg VEC_LOOP_VEC_LOOP_and_2_itm;
  reg VEC_LOOP_VEC_LOOP_and_4_itm;
  reg VEC_LOOP_VEC_LOOP_and_5_itm;
  reg VEC_LOOP_VEC_LOOP_and_6_itm;
  reg VEC_LOOP_VEC_LOOP_nor_1_itm;
  reg VEC_LOOP_VEC_LOOP_and_9_itm;
  reg VEC_LOOP_VEC_LOOP_and_12_itm;
  reg VEC_LOOP_VEC_LOOP_and_13_itm;
  wire COMP_LOOP_twiddle_f_equal_tmp_4;
  wire [12:0] COMP_LOOP_k_12_0_sva_2;
  wire [13:0] nl_COMP_LOOP_k_12_0_sva_2;
  wire COMP_LOOP_twiddle_help_and_4_cse;
  wire STAGE_LOOP_acc_itm_4_1;

  wire[0:0] COMP_LOOP_k_not_1_nl;
  wire[9:0] COMP_LOOP_twiddle_f_mux1h_1_nl;
  wire[0:0] COMP_LOOP_twiddle_f_not_3_nl;
  wire[2:0] VEC_LOOP_acc_nl;
  wire[3:0] nl_VEC_LOOP_acc_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_11_nl;
  wire[4:0] STAGE_LOOP_acc_nl;
  wire[5:0] nl_STAGE_LOOP_acc_nl;
  wire[13:0] acc_nl;
  wire[14:0] nl_acc_nl;
  wire[12:0] VEC_LOOP_mux_60_nl;
  wire[0:0] VEC_LOOP_or_3_nl;
  wire[12:0] VEC_LOOP_mux_61_nl;
  wire[3:0] STAGE_LOOP_mux_4_nl;
  wire[0:0] VEC_LOOP_mux_62_nl;
  wire[0:0] VEC_LOOP_mux_63_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_14_nl;
  wire[0:0] VEC_LOOP_mux_64_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_15_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_16_nl;
  wire[0:0] VEC_LOOP_mux_65_nl;
  wire[0:0] VEC_LOOP_mux_66_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_17_nl;
  wire[0:0] VEC_LOOP_VEC_LOOP_and_18_nl;
  wire[0:0] VEC_LOOP_mux_67_nl;
  wire[0:0] VEC_LOOP_mux_68_nl;
  wire[0:0] VEC_LOOP_mux_69_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_mult_cmp_p_rsc_dat;
  assign nl_mult_cmp_p_rsc_dat = p_sva;
  wire [0:0] nl_mult_cmp_ccs_ccore_start_rsc_dat;
  assign nl_mult_cmp_ccs_ccore_start_rsc_dat = fsm_output[7];
  wire [31:0] nl_modulo_sub_cmp_base_rsc_dat;
  assign nl_modulo_sub_cmp_base_rsc_dat = z_out_3 - tmp_1_lpi_4_dfm;
  wire [31:0] nl_modulo_sub_cmp_m_rsc_dat;
  assign nl_modulo_sub_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat;
  assign nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat = fsm_output[6];
  wire [31:0] nl_modulo_add_cmp_base_rsc_dat;
  assign nl_modulo_add_cmp_base_rsc_dat = z_out_3 + tmp_1_lpi_4_dfm;
  wire [31:0] nl_modulo_add_cmp_m_rsc_dat;
  assign nl_modulo_add_cmp_m_rsc_dat = p_sva;
  wire [0:0] nl_modulo_add_cmp_ccs_ccore_start_rsc_dat;
  assign nl_modulo_add_cmp_ccs_ccore_start_rsc_dat = fsm_output[6];
  wire [3:0] nl_COMP_LOOP_twiddle_f_lshift_rg_s;
  assign nl_COMP_LOOP_twiddle_f_lshift_rg_s = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, z_out_2,
      fsm_output[2]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_8 & (fsm_output[5])) | and_81_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_we_d_core_psct_pff
      = (and_dcpl_8 & (fsm_output[7])) | and_80_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (VEC_LOOP_VEC_LOOP_and_cse & (fsm_output[5])) | and_99_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_we_d_core_psct_pff
      = (VEC_LOOP_VEC_LOOP_and_cse & (fsm_output[7])) | and_98_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_19 & (fsm_output[5])) | and_109_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_we_d_core_psct_pff
      = (and_dcpl_19 & (fsm_output[7])) | and_108_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_24 & (fsm_output[5])) | and_119_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_we_d_core_psct_pff
      = (and_dcpl_24 & (fsm_output[7])) | and_118_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_30 & (fsm_output[5])) | and_129_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_we_d_core_psct_pff
      = (and_dcpl_30 & (fsm_output[7])) | and_128_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_33 & (fsm_output[5])) | and_139_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_we_d_core_psct_pff
      = (and_dcpl_33 & (fsm_output[7])) | and_138_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_37 & (fsm_output[5])) | and_149_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_we_d_core_psct_pff
      = (and_dcpl_37 & (fsm_output[7])) | and_148_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct
      = (and_dcpl_40 & (fsm_output[5])) | and_159_cse;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_we_d_core_psct_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_we_d_core_psct_pff
      = (and_dcpl_40 & (fsm_output[7])) | and_158_cse;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_167_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_oswt_pff
      = and_167_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_171_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_oswt_pff
      = and_171_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_175_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_oswt_pff
      = and_175_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_179_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_oswt_pff
      = and_179_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_167_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_oswt_pff
      = and_167_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_171_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_oswt_pff
      = and_171_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_175_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_oswt_pff
      = and_175_rmff;
  wire [15:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_adra_d_core;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_adra_d_core
      = {8'b00000000 , (COMP_LOOP_twiddle_f_mul_tmp[9:2])};
  wire [1:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct
      = {1'b0 , and_179_rmff};
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_oswt_pff;
  assign nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_oswt_pff
      = and_179_rmff;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_main_C_0_tr0 = ~ VEC_LOOP_VEC_LOOP_and_11_itm;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_9_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_9_tr0 = ~ VEC_LOOP_slc_VEC_LOOP_acc_2_itm;
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0 = ~ (z_out_1[12]);
  wire [0:0] nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0;
  assign nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0 = ~ STAGE_LOOP_acc_itm_4_1;
  ccs_in_v1 #(.rscid(32'sd14),
  .width(32'sd32)) p_rsci (
      .dat(p_rsc_dat),
      .idat(p_rsci_idat)
    );
  mult  mult_cmp (
      .x_rsc_dat(modulo_sub_cmp_return_rsc_z),
      .y_rsc_dat(tmp_2_lpi_3_dfm),
      .y_rsc_dat_1(tmp_3_lpi_3_dfm),
      .p_rsc_dat(nl_mult_cmp_p_rsc_dat[31:0]),
      .return_rsc_z(mult_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_mult_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(mult_cmp_ccs_ccore_en)
    );
  modulo_sub  modulo_sub_cmp (
      .base_rsc_dat(nl_modulo_sub_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_modulo_sub_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(modulo_sub_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_modulo_sub_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  modulo_add  modulo_add_cmp (
      .base_rsc_dat(nl_modulo_add_cmp_base_rsc_dat[31:0]),
      .m_rsc_dat(nl_modulo_add_cmp_m_rsc_dat[31:0]),
      .return_rsc_z(modulo_add_cmp_return_rsc_z),
      .ccs_ccore_start_rsc_dat(nl_modulo_add_cmp_ccs_ccore_start_rsc_dat[0:0]),
      .ccs_ccore_clk(clk),
      .ccs_ccore_srst(rst),
      .ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  mgc_shift_l_v5 #(.width_a(32'sd1),
  .signd_a(32'sd0),
  .width_s(32'sd4),
  .width_z(32'sd13)) COMP_LOOP_twiddle_f_lshift_rg (
      .a(1'b1),
      .s(nl_COMP_LOOP_twiddle_f_lshift_rg_s[3:0]),
      .z(z_out)
    );
  inPlaceNTT_DIF_precomp_core_run_rsci inPlaceNTT_DIF_precomp_core_run_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .run_rsc_lzin(run_rsc_lzin),
      .run_rsc_vzin(run_rsc_vzin),
      .core_wen(complete_rsci_wen_comp),
      .run_rsci_oswt(reg_run_rsci_oswt_cse),
      .core_wten(core_wten),
      .run_rsci_vdin_mxwt(run_rsci_vdin_mxwt)
    );
  inPlaceNTT_DIF_precomp_core_complete_rsci inPlaceNTT_DIF_precomp_core_complete_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .complete_rsc_lzout(complete_rsc_lzout),
      .complete_rsc_vzout(complete_rsc_vzout),
      .core_wen(complete_rsci_wen_comp),
      .complete_rsci_oswt(reg_complete_rsci_oswt_cse),
      .complete_rsci_wen_comp(complete_rsci_wen_comp)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_0_i_oswt(reg_vec_rsc_0_0_i_oswt_cse),
      .vec_rsc_0_0_i_q_d_mxwt(vec_rsc_0_0_i_q_d_mxwt),
      .vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_0_i_we_d_pff(vec_rsc_0_0_i_we_d_iff),
      .vec_rsc_0_0_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_0_i_1_inst_vec_rsc_0_0_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_0_i_oswt_pff(or_20_rmff)
    );
  inPlaceNTT_DIF_precomp_core_wait_dp inPlaceNTT_DIF_precomp_core_wait_dp_inst (
      .ensig_cgo_iro(or_61_rmff),
      .ensig_cgo_iro_1(or_63_rmff),
      .core_wen(complete_rsci_wen_comp),
      .ensig_cgo(reg_ensig_cgo_cse),
      .mult_cmp_ccs_ccore_en(mult_cmp_ccs_ccore_en),
      .ensig_cgo_1(reg_ensig_cgo_1_cse),
      .modulo_sub_cmp_ccs_ccore_en(modulo_sub_cmp_ccs_ccore_en)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_1_i_oswt(reg_vec_rsc_0_1_i_oswt_cse),
      .vec_rsc_0_1_i_q_d_mxwt(vec_rsc_0_1_i_q_d_mxwt),
      .vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_1_i_we_d_pff(vec_rsc_0_1_i_we_d_iff),
      .vec_rsc_0_1_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_1_i_1_inst_vec_rsc_0_1_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_1_i_oswt_pff(or_27_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_2_i_oswt(reg_vec_rsc_0_2_i_oswt_cse),
      .vec_rsc_0_2_i_q_d_mxwt(vec_rsc_0_2_i_q_d_mxwt),
      .vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_2_i_we_d_pff(vec_rsc_0_2_i_we_d_iff),
      .vec_rsc_0_2_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_2_i_1_inst_vec_rsc_0_2_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_2_i_oswt_pff(or_30_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_3_i_q_d(vec_rsc_0_3_i_q_d),
      .vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_3_i_oswt(reg_vec_rsc_0_3_i_oswt_cse),
      .vec_rsc_0_3_i_q_d_mxwt(vec_rsc_0_3_i_q_d_mxwt),
      .vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_3_i_we_d_pff(vec_rsc_0_3_i_we_d_iff),
      .vec_rsc_0_3_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_3_i_1_inst_vec_rsc_0_3_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_3_i_oswt_pff(or_33_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_4_i_oswt(reg_vec_rsc_0_4_i_oswt_cse),
      .vec_rsc_0_4_i_q_d_mxwt(vec_rsc_0_4_i_q_d_mxwt),
      .vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_4_i_we_d_pff(vec_rsc_0_4_i_we_d_iff),
      .vec_rsc_0_4_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_4_i_1_inst_vec_rsc_0_4_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_4_i_oswt_pff(or_36_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_5_i_q_d(vec_rsc_0_5_i_q_d),
      .vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_5_i_oswt(reg_vec_rsc_0_5_i_oswt_cse),
      .vec_rsc_0_5_i_q_d_mxwt(vec_rsc_0_5_i_q_d_mxwt),
      .vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_5_i_we_d_pff(vec_rsc_0_5_i_we_d_iff),
      .vec_rsc_0_5_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_5_i_1_inst_vec_rsc_0_5_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_5_i_oswt_pff(or_39_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_6_i_oswt(reg_vec_rsc_0_6_i_oswt_cse),
      .vec_rsc_0_6_i_q_d_mxwt(vec_rsc_0_6_i_q_d_mxwt),
      .vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_6_i_we_d_pff(vec_rsc_0_6_i_we_d_iff),
      .vec_rsc_0_6_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_6_i_1_inst_vec_rsc_0_6_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_6_i_oswt_pff(or_42_rmff)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1 inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .vec_rsc_0_7_i_q_d(vec_rsc_0_7_i_q_d),
      .vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .vec_rsc_0_7_i_oswt(reg_vec_rsc_0_7_i_oswt_cse),
      .vec_rsc_0_7_i_q_d_mxwt(vec_rsc_0_7_i_q_d_mxwt),
      .vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_core_psct[0:0]),
      .vec_rsc_0_7_i_we_d_pff(vec_rsc_0_7_i_we_d_iff),
      .vec_rsc_0_7_i_we_d_core_psct_pff(nl_inPlaceNTT_DIF_precomp_core_vec_rsc_0_7_i_1_inst_vec_rsc_0_7_i_we_d_core_psct_pff[0:0]),
      .core_wten_pff(core_wten_iff),
      .vec_rsc_0_7_i_oswt_pff(or_45_rmff)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1 inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_0_i_adra_d(twiddle_rsc_0_0_i_adra_d_reg),
      .twiddle_rsc_0_0_i_qa_d(twiddle_rsc_0_0_i_qa_d),
      .twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsc_0_0_i_oswt(reg_twiddle_rsc_0_0_i_oswt_cse),
      .twiddle_rsc_0_0_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_adra_d_core[15:0]),
      .twiddle_rsc_0_0_i_qa_d_mxwt(twiddle_rsc_0_0_i_qa_d_mxwt),
      .twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsc_0_0_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_0_i_1_inst_twiddle_rsc_0_0_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1 inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_1_i_adra_d(twiddle_rsc_0_1_i_adra_d_reg),
      .twiddle_rsc_0_1_i_qa_d(twiddle_rsc_0_1_i_qa_d),
      .twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsc_0_1_i_oswt(reg_twiddle_rsc_0_1_i_oswt_cse),
      .twiddle_rsc_0_1_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_adra_d_core[15:0]),
      .twiddle_rsc_0_1_i_qa_d_mxwt(twiddle_rsc_0_1_i_qa_d_mxwt),
      .twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsc_0_1_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_1_i_1_inst_twiddle_rsc_0_1_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1 inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_2_i_adra_d(twiddle_rsc_0_2_i_adra_d_reg),
      .twiddle_rsc_0_2_i_qa_d(twiddle_rsc_0_2_i_qa_d),
      .twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsc_0_2_i_oswt(reg_twiddle_rsc_0_2_i_oswt_cse),
      .twiddle_rsc_0_2_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_adra_d_core[15:0]),
      .twiddle_rsc_0_2_i_qa_d_mxwt(twiddle_rsc_0_2_i_qa_d_mxwt),
      .twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsc_0_2_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_2_i_1_inst_twiddle_rsc_0_2_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1 inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_rsc_0_3_i_adra_d(twiddle_rsc_0_3_i_adra_d_reg),
      .twiddle_rsc_0_3_i_qa_d(twiddle_rsc_0_3_i_qa_d),
      .twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_rsc_0_3_i_oswt(reg_twiddle_rsc_0_3_i_oswt_cse),
      .twiddle_rsc_0_3_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_adra_d_core[15:0]),
      .twiddle_rsc_0_3_i_qa_d_mxwt(twiddle_rsc_0_3_i_qa_d_mxwt),
      .twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_rsc_0_3_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_rsc_0_3_i_1_inst_twiddle_rsc_0_3_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_0_i_adra_d(twiddle_h_rsc_0_0_i_adra_d_reg),
      .twiddle_h_rsc_0_0_i_qa_d(twiddle_h_rsc_0_0_i_qa_d),
      .twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_0_i_oswt(reg_twiddle_rsc_0_0_i_oswt_cse),
      .twiddle_h_rsc_0_0_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_0_i_qa_d_mxwt(twiddle_h_rsc_0_0_i_qa_d_mxwt),
      .twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsc_0_0_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_0_i_1_inst_twiddle_h_rsc_0_0_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_1_i_adra_d(twiddle_h_rsc_0_1_i_adra_d_reg),
      .twiddle_h_rsc_0_1_i_qa_d(twiddle_h_rsc_0_1_i_qa_d),
      .twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_1_i_oswt(reg_twiddle_rsc_0_1_i_oswt_cse),
      .twiddle_h_rsc_0_1_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_1_i_qa_d_mxwt(twiddle_h_rsc_0_1_i_qa_d_mxwt),
      .twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsc_0_1_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_1_i_1_inst_twiddle_h_rsc_0_1_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_2_i_adra_d(twiddle_h_rsc_0_2_i_adra_d_reg),
      .twiddle_h_rsc_0_2_i_qa_d(twiddle_h_rsc_0_2_i_qa_d),
      .twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_2_i_oswt(reg_twiddle_rsc_0_2_i_oswt_cse),
      .twiddle_h_rsc_0_2_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_2_i_qa_d_mxwt(twiddle_h_rsc_0_2_i_qa_d_mxwt),
      .twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsc_0_2_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_2_i_1_inst_twiddle_h_rsc_0_2_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1 inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst
      (
      .clk(clk),
      .rst(rst),
      .twiddle_h_rsc_0_3_i_adra_d(twiddle_h_rsc_0_3_i_adra_d_reg),
      .twiddle_h_rsc_0_3_i_qa_d(twiddle_h_rsc_0_3_i_qa_d),
      .twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg),
      .core_wen(complete_rsci_wen_comp),
      .core_wten(core_wten),
      .twiddle_h_rsc_0_3_i_oswt(reg_twiddle_rsc_0_3_i_oswt_cse),
      .twiddle_h_rsc_0_3_i_adra_d_core(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_adra_d_core[15:0]),
      .twiddle_h_rsc_0_3_i_qa_d_mxwt(twiddle_h_rsc_0_3_i_qa_d_mxwt),
      .twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_core_psct[1:0]),
      .core_wten_pff(core_wten_iff),
      .twiddle_h_rsc_0_3_i_oswt_pff(nl_inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_0_3_i_1_inst_twiddle_h_rsc_0_3_i_oswt_pff[0:0])
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_7_obj_inst
      (
      .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_7_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_6_obj_inst
      (
      .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_6_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_5_obj_inst
      (
      .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_5_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_4_obj_inst
      (
      .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_4_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_3_obj_inst
      (
      .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_3_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_2_obj_inst
      (
      .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_2_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_1_obj_inst
      (
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_1_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj inPlaceNTT_DIF_precomp_core_vec_rsc_triosy_0_0_obj_inst
      (
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .vec_rsc_triosy_0_0_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_p_rsc_triosy_obj_inst
      (
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .core_wten(core_wten),
      .p_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj inPlaceNTT_DIF_precomp_core_r_rsc_triosy_obj_inst
      (
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .core_wten(core_wten),
      .r_rsc_triosy_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_3_obj_inst
      (
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_3_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_2_obj_inst
      (
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_2_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_1_obj_inst
      (
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_1_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj inPlaceNTT_DIF_precomp_core_twiddle_rsc_triosy_0_0_obj_inst
      (
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .twiddle_rsc_triosy_0_0_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_3_obj_inst
      (
      .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_3_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_2_obj_inst
      (
      .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_2_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_1_obj_inst
      (
      .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_1_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
    );
  inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj inPlaceNTT_DIF_precomp_core_twiddle_h_rsc_triosy_0_0_obj_inst
      (
      .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
      .core_wten(core_wten),
      .twiddle_h_rsc_triosy_0_0_obj_iswt0(reg_vec_rsc_triosy_0_7_obj_iswt0_cse)
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
      .VEC_LOOP_C_9_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_VEC_LOOP_C_9_tr0[0:0]),
      .COMP_LOOP_C_2_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_COMP_LOOP_C_2_tr0[0:0]),
      .STAGE_LOOP_C_1_tr0(nl_inPlaceNTT_DIF_precomp_core_core_fsm_inst_STAGE_LOOP_C_1_tr0[0:0])
    );
  assign or_20_rmff = (and_dcpl_8 & or_dcpl_8) | and_80_cse | and_81_cse;
  assign or_27_rmff = (VEC_LOOP_VEC_LOOP_and_cse & or_dcpl_8) | and_98_cse | and_99_cse;
  assign or_30_rmff = (and_dcpl_19 & or_dcpl_8) | and_108_cse | and_109_cse;
  assign or_33_rmff = (and_dcpl_24 & or_dcpl_8) | and_118_cse | and_119_cse;
  assign or_36_rmff = (and_dcpl_30 & or_dcpl_8) | and_128_cse | and_129_cse;
  assign or_39_rmff = (and_dcpl_33 & or_dcpl_8) | and_138_cse | and_139_cse;
  assign or_42_rmff = (and_dcpl_37 & or_dcpl_8) | and_148_cse | and_149_cse;
  assign or_45_rmff = (and_dcpl_40 & or_dcpl_8) | and_158_cse | and_159_cse;
  assign and_167_rmff = (COMP_LOOP_twiddle_f_mul_tmp[1:0]==2'b00) & (fsm_output[2]);
  assign and_171_rmff = (COMP_LOOP_twiddle_f_mul_tmp[1:0]==2'b01) & (fsm_output[2]);
  assign and_175_rmff = (COMP_LOOP_twiddle_f_mul_tmp[1:0]==2'b10) & (fsm_output[2]);
  assign and_179_rmff = (COMP_LOOP_twiddle_f_mul_tmp[1:0]==2'b11) & (fsm_output[2]);
  assign or_61_rmff = (fsm_output[11:7]!=5'b00000);
  assign or_63_rmff = (fsm_output[7:6]!=2'b00);
  assign COMP_LOOP_twiddle_help_and_cse = COMP_LOOP_twiddle_f_equal_tmp_4 & (~ or_tmp_64);
  assign COMP_LOOP_twiddle_help_and_1_cse = (COMP_LOOP_twiddle_f_mul_cse_sva[1:0]==2'b01)
      & (~ or_tmp_64);
  assign COMP_LOOP_twiddle_help_and_2_cse = (COMP_LOOP_twiddle_f_mul_cse_sva[1:0]==2'b10)
      & (~ or_tmp_64);
  assign COMP_LOOP_twiddle_help_and_3_cse = (COMP_LOOP_twiddle_f_mul_cse_sva[1:0]==2'b11)
      & (~ or_tmp_64);
  assign COMP_LOOP_twiddle_help_and_4_cse = complete_rsci_wen_comp & (COMP_LOOP_twiddle_help_and_cse
      | COMP_LOOP_twiddle_help_and_1_cse | COMP_LOOP_twiddle_help_and_2_cse | COMP_LOOP_twiddle_help_and_3_cse);
  assign VEC_LOOP_and_cse = complete_rsci_wen_comp & (fsm_output[4]);
  assign VEC_LOOP_nor_5_cse = ~((VEC_LOOP_acc_10_cse_sva[1:0]!=2'b00));
  assign nl_COMP_LOOP_twiddle_f_mul_tmp = (z_out[9:0]) * (COMP_LOOP_k_12_0_sva_11_0[9:0]);
  assign COMP_LOOP_twiddle_f_mul_tmp = nl_COMP_LOOP_twiddle_f_mul_tmp[9:0];
  assign nl_VEC_LOOP_acc_1_cse_sva_mx0w2 = COMP_LOOP_twiddle_f_mul_cse_sva + (COMP_LOOP_k_12_0_sva_11_0[9:0]);
  assign VEC_LOOP_acc_1_cse_sva_mx0w2 = nl_VEC_LOOP_acc_1_cse_sva_mx0w2[9:0];
  assign COMP_LOOP_twiddle_f_equal_tmp_4 = ~((COMP_LOOP_twiddle_f_mul_cse_sva[1:0]!=2'b00));
  assign nl_VEC_LOOP_acc_10_tmp = COMP_LOOP_twiddle_f_mul_cse_sva + (COMP_LOOP_k_12_0_sva_11_0[9:0])
      + (STAGE_LOOP_lshift_psp_sva[10:1]);
  assign VEC_LOOP_acc_10_tmp = nl_VEC_LOOP_acc_10_tmp[9:0];
  assign VEC_LOOP_nor_cse = ~((COMP_LOOP_twiddle_f_mul_cse_sva[2:1]!=2'b00));
  assign VEC_LOOP_VEC_LOOP_and_cse = (COMP_LOOP_twiddle_f_mul_cse_sva[0]) & VEC_LOOP_nor_cse;
  assign nl_COMP_LOOP_k_12_0_sva_2 = conv_u2u_12_13(COMP_LOOP_k_12_0_sva_11_0) +
      13'b0000000000001;
  assign COMP_LOOP_k_12_0_sva_2 = nl_COMP_LOOP_k_12_0_sva_2[12:0];
  assign and_dcpl_2 = ~((fsm_output[17:16]!=2'b00));
  assign and_dcpl_8 = VEC_LOOP_nor_cse & (~ (COMP_LOOP_twiddle_f_mul_cse_sva[0]));
  assign or_dcpl_8 = (fsm_output[5]) | (fsm_output[7]);
  assign and_dcpl_11 = ~((VEC_LOOP_acc_10_tmp[1:0]!=2'b00));
  assign and_dcpl_14 = (VEC_LOOP_acc_10_cse_sva[1:0]==2'b01);
  assign and_dcpl_16 = (VEC_LOOP_acc_10_tmp[1:0]==2'b01);
  assign and_dcpl_18 = (COMP_LOOP_twiddle_f_mul_cse_sva[2:1]==2'b01);
  assign and_dcpl_19 = and_dcpl_18 & (~ (COMP_LOOP_twiddle_f_mul_cse_sva[0]));
  assign and_dcpl_20 = (VEC_LOOP_acc_10_cse_sva[1:0]==2'b10);
  assign and_dcpl_22 = (VEC_LOOP_acc_10_tmp[1:0]==2'b10);
  assign and_dcpl_24 = and_dcpl_18 & (COMP_LOOP_twiddle_f_mul_cse_sva[0]);
  assign and_dcpl_25 = (VEC_LOOP_acc_10_cse_sva[1:0]==2'b11);
  assign and_dcpl_27 = (VEC_LOOP_acc_10_tmp[1:0]==2'b11);
  assign and_dcpl_29 = (COMP_LOOP_twiddle_f_mul_cse_sva[2:1]==2'b10);
  assign and_dcpl_30 = and_dcpl_29 & (~ (COMP_LOOP_twiddle_f_mul_cse_sva[0]));
  assign and_dcpl_33 = and_dcpl_29 & (COMP_LOOP_twiddle_f_mul_cse_sva[0]);
  assign and_dcpl_36 = (COMP_LOOP_twiddle_f_mul_cse_sva[2:1]==2'b11);
  assign and_dcpl_37 = and_dcpl_36 & (~ (COMP_LOOP_twiddle_f_mul_cse_sva[0]));
  assign and_dcpl_40 = and_dcpl_36 & (COMP_LOOP_twiddle_f_mul_cse_sva[0]);
  assign and_dcpl_49 = and_dcpl_2 & (~ (fsm_output[0]));
  assign and_dcpl_50 = ~((fsm_output[1]) | (fsm_output[15]));
  assign and_80_cse = VEC_LOOP_nor_5_cse & (~ (VEC_LOOP_acc_10_cse_sva[2])) & (fsm_output[12]);
  assign and_81_cse = and_dcpl_11 & (~ (VEC_LOOP_acc_10_tmp[2])) & (fsm_output[4]);
  assign and_98_cse = and_dcpl_14 & (~ (VEC_LOOP_acc_10_cse_sva[2])) & (fsm_output[12]);
  assign and_99_cse = and_dcpl_16 & (~ (VEC_LOOP_acc_10_tmp[2])) & (fsm_output[4]);
  assign and_108_cse = and_dcpl_20 & (~ (VEC_LOOP_acc_10_cse_sva[2])) & (fsm_output[12]);
  assign and_109_cse = and_dcpl_22 & (~ (VEC_LOOP_acc_10_tmp[2])) & (fsm_output[4]);
  assign and_118_cse = and_dcpl_25 & (~ (VEC_LOOP_acc_10_cse_sva[2])) & (fsm_output[12]);
  assign and_119_cse = and_dcpl_27 & (~ (VEC_LOOP_acc_10_tmp[2])) & (fsm_output[4]);
  assign and_128_cse = VEC_LOOP_nor_5_cse & (VEC_LOOP_acc_10_cse_sva[2]) & (fsm_output[12]);
  assign and_129_cse = and_dcpl_11 & (VEC_LOOP_acc_10_tmp[2]) & (fsm_output[4]);
  assign and_138_cse = and_dcpl_14 & (VEC_LOOP_acc_10_cse_sva[2]) & (fsm_output[12]);
  assign and_139_cse = and_dcpl_16 & (VEC_LOOP_acc_10_tmp[2]) & (fsm_output[4]);
  assign and_148_cse = and_dcpl_20 & (VEC_LOOP_acc_10_cse_sva[2]) & (fsm_output[12]);
  assign and_149_cse = and_dcpl_22 & (VEC_LOOP_acc_10_tmp[2]) & (fsm_output[4]);
  assign and_158_cse = and_dcpl_25 & (VEC_LOOP_acc_10_cse_sva[2]) & (fsm_output[12]);
  assign and_159_cse = and_dcpl_27 & (VEC_LOOP_acc_10_tmp[2]) & (fsm_output[4]);
  assign or_tmp_64 = and_dcpl_2 & (~ (fsm_output[0])) & (~ (fsm_output[2])) & (~
      (fsm_output[3])) & (~ (fsm_output[14])) & and_dcpl_50;
  assign nl_STAGE_LOOP_acc_nl = ({1'b1 , (~ z_out_2)}) + 5'b00001;
  assign STAGE_LOOP_acc_nl = nl_STAGE_LOOP_acc_nl[4:0];
  assign STAGE_LOOP_acc_itm_4_1 = readslicef_5_1_4(STAGE_LOOP_acc_nl);
  assign vec_rsc_0_0_i_adr_d_pff = MUX1HOT_v_7_3_2((VEC_LOOP_acc_10_tmp[9:3]), (COMP_LOOP_twiddle_f_mul_cse_sva[9:3]),
      (VEC_LOOP_acc_10_cse_sva[9:3]), {(fsm_output[4]) , or_dcpl_8 , (fsm_output[12])});
  assign vec_rsc_0_0_i_d_d_pff = MUX_v_32_2_2(modulo_add_cmp_return_rsc_z, mult_cmp_return_rsc_z,
      fsm_output[12]);
  assign vec_rsc_0_0_i_we_d_pff = vec_rsc_0_0_i_we_d_iff;
  assign vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_1_i_we_d_pff = vec_rsc_0_1_i_we_d_iff;
  assign vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_2_i_we_d_pff = vec_rsc_0_2_i_we_d_iff;
  assign vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_3_i_we_d_pff = vec_rsc_0_3_i_we_d_iff;
  assign vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_4_i_we_d_pff = vec_rsc_0_4_i_we_d_iff;
  assign vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_5_i_we_d_pff = vec_rsc_0_5_i_we_d_iff;
  assign vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_6_i_we_d_pff = vec_rsc_0_6_i_we_d_iff;
  assign vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign vec_rsc_0_7_i_we_d_pff = vec_rsc_0_7_i_we_d_iff;
  assign vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d = vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d = twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d_reg;
  assign twiddle_rsc_0_0_i_adra_d = twiddle_rsc_0_0_i_adra_d_reg;
  assign twiddle_rsc_0_1_i_adra_d = twiddle_rsc_0_1_i_adra_d_reg;
  assign twiddle_rsc_0_2_i_adra_d = twiddle_rsc_0_2_i_adra_d_reg;
  assign twiddle_rsc_0_3_i_adra_d = twiddle_rsc_0_3_i_adra_d_reg;
  assign twiddle_h_rsc_0_0_i_adra_d = twiddle_h_rsc_0_0_i_adra_d_reg;
  assign twiddle_h_rsc_0_1_i_adra_d = twiddle_h_rsc_0_1_i_adra_d_reg;
  assign twiddle_h_rsc_0_2_i_adra_d = twiddle_h_rsc_0_2_i_adra_d_reg;
  assign twiddle_h_rsc_0_3_i_adra_d = twiddle_h_rsc_0_3_i_adra_d_reg;
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp ) begin
      tmp_1_lpi_4_dfm <= z_out_3;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_run_rsci_oswt_cse <= 1'b0;
      reg_complete_rsci_oswt_cse <= 1'b0;
      reg_vec_rsc_0_0_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_1_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_2_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_3_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_4_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_5_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_6_i_oswt_cse <= 1'b0;
      reg_vec_rsc_0_7_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_0_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_1_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_2_i_oswt_cse <= 1'b0;
      reg_twiddle_rsc_0_3_i_oswt_cse <= 1'b0;
      reg_vec_rsc_triosy_0_7_obj_iswt0_cse <= 1'b0;
      reg_ensig_cgo_cse <= 1'b0;
      reg_ensig_cgo_1_cse <= 1'b0;
      VEC_LOOP_VEC_LOOP_nor_1_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_9_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_12_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_13_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp ) begin
      reg_run_rsci_oswt_cse <= fsm_output[0];
      reg_complete_rsci_oswt_cse <= (~ STAGE_LOOP_acc_itm_4_1) & (fsm_output[15]);
      reg_vec_rsc_0_0_i_oswt_cse <= or_20_rmff;
      reg_vec_rsc_0_1_i_oswt_cse <= or_27_rmff;
      reg_vec_rsc_0_2_i_oswt_cse <= or_30_rmff;
      reg_vec_rsc_0_3_i_oswt_cse <= or_33_rmff;
      reg_vec_rsc_0_4_i_oswt_cse <= or_36_rmff;
      reg_vec_rsc_0_5_i_oswt_cse <= or_39_rmff;
      reg_vec_rsc_0_6_i_oswt_cse <= or_42_rmff;
      reg_vec_rsc_0_7_i_oswt_cse <= or_45_rmff;
      reg_twiddle_rsc_0_0_i_oswt_cse <= and_167_rmff;
      reg_twiddle_rsc_0_1_i_oswt_cse <= and_171_rmff;
      reg_twiddle_rsc_0_2_i_oswt_cse <= and_175_rmff;
      reg_twiddle_rsc_0_3_i_oswt_cse <= and_179_rmff;
      reg_vec_rsc_triosy_0_7_obj_iswt0_cse <= fsm_output[16];
      reg_ensig_cgo_cse <= or_61_rmff;
      reg_ensig_cgo_1_cse <= or_63_rmff;
      VEC_LOOP_VEC_LOOP_nor_1_itm <= ~((VEC_LOOP_acc_10_tmp[2:0]!=3'b000));
      VEC_LOOP_VEC_LOOP_and_9_itm <= (VEC_LOOP_acc_10_tmp[2:0]==3'b011);
      VEC_LOOP_VEC_LOOP_and_12_itm <= (VEC_LOOP_acc_10_tmp[2:0]==3'b110);
      VEC_LOOP_VEC_LOOP_and_13_itm <= (VEC_LOOP_acc_10_tmp[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((fsm_output[15]) | (fsm_output[0])) ) begin
      STAGE_LOOP_i_3_0_sva <= MUX_v_4_2_2(4'b1100, z_out_2, fsm_output[15]);
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~ and_dcpl_49) ) begin
      p_sva <= p_rsci_idat;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & (~(and_dcpl_49 & and_dcpl_50)) ) begin
      STAGE_LOOP_lshift_psp_sva <= z_out;
    end
  end
  always @(posedge clk) begin
    if ( complete_rsci_wen_comp & ((fsm_output[1]) | (fsm_output[14])) ) begin
      COMP_LOOP_k_12_0_sva_11_0 <= MUX_v_12_2_2(12'b000000000000, (COMP_LOOP_k_12_0_sva_2[11:0]),
          COMP_LOOP_k_not_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      COMP_LOOP_twiddle_f_mul_cse_sva <= 10'b0000000000;
    end
    else if ( complete_rsci_wen_comp & ((fsm_output[13]) | (fsm_output[2]) | (fsm_output[3])
        | (fsm_output[4])) ) begin
      COMP_LOOP_twiddle_f_mul_cse_sva <= MUX_v_10_2_2(10'b0000000000, COMP_LOOP_twiddle_f_mux1h_1_nl,
          COMP_LOOP_twiddle_f_not_3_nl);
    end
  end
  always @(posedge clk) begin
    if ( COMP_LOOP_twiddle_help_and_4_cse ) begin
      tmp_3_lpi_3_dfm <= MUX1HOT_v_32_4_2(twiddle_h_rsc_0_0_i_qa_d_mxwt, twiddle_h_rsc_0_1_i_qa_d_mxwt,
          twiddle_h_rsc_0_2_i_qa_d_mxwt, twiddle_h_rsc_0_3_i_qa_d_mxwt, {COMP_LOOP_twiddle_help_and_cse
          , COMP_LOOP_twiddle_help_and_1_cse , COMP_LOOP_twiddle_help_and_2_cse ,
          COMP_LOOP_twiddle_help_and_3_cse});
      tmp_2_lpi_3_dfm <= MUX1HOT_v_32_4_2(twiddle_rsc_0_0_i_qa_d_mxwt, twiddle_rsc_0_1_i_qa_d_mxwt,
          twiddle_rsc_0_2_i_qa_d_mxwt, twiddle_rsc_0_3_i_qa_d_mxwt, {COMP_LOOP_twiddle_help_and_cse
          , COMP_LOOP_twiddle_help_and_1_cse , COMP_LOOP_twiddle_help_and_2_cse ,
          COMP_LOOP_twiddle_help_and_3_cse});
    end
  end
  always @(posedge clk) begin
    if ( VEC_LOOP_and_cse ) begin
      VEC_LOOP_slc_VEC_LOOP_acc_2_itm <= readslicef_3_1_2(VEC_LOOP_acc_nl);
      reg_VEC_LOOP_j_12_0_ftd <= z_out_1[9:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_acc_10_cse_sva <= 10'b0000000000;
      VEC_LOOP_VEC_LOOP_nor_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_2_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_4_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_5_itm <= 1'b0;
      VEC_LOOP_VEC_LOOP_and_6_itm <= 1'b0;
    end
    else if ( VEC_LOOP_and_cse ) begin
      VEC_LOOP_acc_10_cse_sva <= VEC_LOOP_acc_10_tmp;
      VEC_LOOP_VEC_LOOP_nor_itm <= ~((VEC_LOOP_acc_1_cse_sva_mx0w2[2:0]!=3'b000));
      VEC_LOOP_VEC_LOOP_and_2_itm <= (VEC_LOOP_acc_1_cse_sva_mx0w2[2:0]==3'b011);
      VEC_LOOP_VEC_LOOP_and_4_itm <= (VEC_LOOP_acc_1_cse_sva_mx0w2[2:0]==3'b101);
      VEC_LOOP_VEC_LOOP_and_5_itm <= (VEC_LOOP_acc_1_cse_sva_mx0w2[2:0]==3'b110);
      VEC_LOOP_VEC_LOOP_and_6_itm <= (VEC_LOOP_acc_1_cse_sva_mx0w2[2:0]==3'b111);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      VEC_LOOP_VEC_LOOP_and_11_itm <= 1'b0;
    end
    else if ( complete_rsci_wen_comp & ((fsm_output[16]) | (fsm_output[4])) ) begin
      VEC_LOOP_VEC_LOOP_and_11_itm <= MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_11_nl, run_rsci_vdin_mxwt,
          fsm_output[16]);
    end
  end
  assign COMP_LOOP_k_not_1_nl = ~ (fsm_output[1]);
  assign COMP_LOOP_twiddle_f_mux1h_1_nl = MUX1HOT_v_10_3_2(COMP_LOOP_twiddle_f_mul_tmp,
      VEC_LOOP_acc_1_cse_sva_mx0w2, reg_VEC_LOOP_j_12_0_ftd, {(fsm_output[2]) , (fsm_output[4])
      , (fsm_output[13])});
  assign COMP_LOOP_twiddle_f_not_3_nl = ~ (fsm_output[3]);
  assign nl_VEC_LOOP_acc_nl = (z_out_1[12:10]) + 3'b111;
  assign VEC_LOOP_acc_nl = nl_VEC_LOOP_acc_nl[2:0];
  assign VEC_LOOP_VEC_LOOP_and_11_nl = (VEC_LOOP_acc_10_tmp[2:0]==3'b101);
  assign VEC_LOOP_mux_60_nl = MUX_v_13_2_2(({3'b000 , COMP_LOOP_twiddle_f_mul_cse_sva}),
      COMP_LOOP_k_12_0_sva_2, fsm_output[14]);
  assign VEC_LOOP_or_3_nl = (~ (fsm_output[4])) | (fsm_output[14]);
  assign VEC_LOOP_mux_61_nl = MUX_v_13_2_2(STAGE_LOOP_lshift_psp_sva, ({1'b1 , (~
      (STAGE_LOOP_lshift_psp_sva[12:1]))}), fsm_output[14]);
  assign nl_acc_nl = ({VEC_LOOP_mux_60_nl , VEC_LOOP_or_3_nl}) + ({VEC_LOOP_mux_61_nl
      , 1'b1});
  assign acc_nl = nl_acc_nl[13:0];
  assign z_out_1 = readslicef_14_13_1(acc_nl);
  assign STAGE_LOOP_mux_4_nl = MUX_v_4_2_2(STAGE_LOOP_i_3_0_sva, (~ STAGE_LOOP_i_3_0_sva),
      fsm_output[2]);
  assign nl_z_out_2 = STAGE_LOOP_mux_4_nl + conv_s2u_3_4({1'b1 , (~ (fsm_output[2]))
      , 1'b1});
  assign z_out_2 = nl_z_out_2[3:0];
  assign VEC_LOOP_mux_62_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_nor_1_itm, VEC_LOOP_VEC_LOOP_nor_itm,
      fsm_output[6]);
  assign VEC_LOOP_VEC_LOOP_and_14_nl = (VEC_LOOP_acc_10_cse_sva[2:0]==3'b001);
  assign VEC_LOOP_mux_63_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_14_nl, VEC_LOOP_VEC_LOOP_and_cse,
      fsm_output[6]);
  assign VEC_LOOP_VEC_LOOP_and_15_nl = (VEC_LOOP_acc_10_cse_sva[2:0]==3'b010);
  assign VEC_LOOP_VEC_LOOP_and_16_nl = (COMP_LOOP_twiddle_f_mul_cse_sva[2:0]==3'b010);
  assign VEC_LOOP_mux_64_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_15_nl, VEC_LOOP_VEC_LOOP_and_16_nl,
      fsm_output[6]);
  assign VEC_LOOP_mux_65_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_9_itm, VEC_LOOP_VEC_LOOP_and_2_itm,
      fsm_output[6]);
  assign VEC_LOOP_VEC_LOOP_and_17_nl = (VEC_LOOP_acc_10_cse_sva[2]) & VEC_LOOP_nor_5_cse;
  assign VEC_LOOP_VEC_LOOP_and_18_nl = (COMP_LOOP_twiddle_f_mul_cse_sva[2]) & COMP_LOOP_twiddle_f_equal_tmp_4;
  assign VEC_LOOP_mux_66_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_17_nl, VEC_LOOP_VEC_LOOP_and_18_nl,
      fsm_output[6]);
  assign VEC_LOOP_mux_67_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_11_itm, VEC_LOOP_VEC_LOOP_and_4_itm,
      fsm_output[6]);
  assign VEC_LOOP_mux_68_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_12_itm, VEC_LOOP_VEC_LOOP_and_5_itm,
      fsm_output[6]);
  assign VEC_LOOP_mux_69_nl = MUX_s_1_2_2(VEC_LOOP_VEC_LOOP_and_13_itm, VEC_LOOP_VEC_LOOP_and_6_itm,
      fsm_output[6]);
  assign z_out_3 = MUX1HOT_v_32_8_2(vec_rsc_0_0_i_q_d_mxwt, vec_rsc_0_1_i_q_d_mxwt,
      vec_rsc_0_2_i_q_d_mxwt, vec_rsc_0_3_i_q_d_mxwt, vec_rsc_0_4_i_q_d_mxwt, vec_rsc_0_5_i_q_d_mxwt,
      vec_rsc_0_6_i_q_d_mxwt, vec_rsc_0_7_i_q_d_mxwt, {VEC_LOOP_mux_62_nl , VEC_LOOP_mux_63_nl
      , VEC_LOOP_mux_64_nl , VEC_LOOP_mux_65_nl , VEC_LOOP_mux_66_nl , VEC_LOOP_mux_67_nl
      , VEC_LOOP_mux_68_nl , VEC_LOOP_mux_69_nl});

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


  function automatic [31:0] MUX1HOT_v_32_8_2;
    input [31:0] input_7;
    input [31:0] input_6;
    input [31:0] input_5;
    input [31:0] input_4;
    input [31:0] input_3;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [7:0] sel;
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
    MUX1HOT_v_32_8_2 = result;
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


  function automatic [12:0] readslicef_14_13_1;
    input [13:0] vector;
    reg [13:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_14_13_1 = tmp[12:0];
  end
  endfunction


  function automatic [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
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


  function automatic [12:0] conv_u2u_12_13 ;
    input [11:0]  vector ;
  begin
    conv_u2u_12_13 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    inPlaceNTT_DIF_precomp
// ------------------------------------------------------------------


module inPlaceNTT_DIF_precomp (
  clk, rst, run_rsc_lzin, run_rsc_vzin, vec_rsc_0_0_adr, vec_rsc_0_0_d, vec_rsc_0_0_we,
      vec_rsc_0_0_q, vec_rsc_triosy_0_0_lz, vec_rsc_0_1_adr, vec_rsc_0_1_d, vec_rsc_0_1_we,
      vec_rsc_0_1_q, vec_rsc_triosy_0_1_lz, vec_rsc_0_2_adr, vec_rsc_0_2_d, vec_rsc_0_2_we,
      vec_rsc_0_2_q, vec_rsc_triosy_0_2_lz, vec_rsc_0_3_adr, vec_rsc_0_3_d, vec_rsc_0_3_we,
      vec_rsc_0_3_q, vec_rsc_triosy_0_3_lz, vec_rsc_0_4_adr, vec_rsc_0_4_d, vec_rsc_0_4_we,
      vec_rsc_0_4_q, vec_rsc_triosy_0_4_lz, vec_rsc_0_5_adr, vec_rsc_0_5_d, vec_rsc_0_5_we,
      vec_rsc_0_5_q, vec_rsc_triosy_0_5_lz, vec_rsc_0_6_adr, vec_rsc_0_6_d, vec_rsc_0_6_we,
      vec_rsc_0_6_q, vec_rsc_triosy_0_6_lz, vec_rsc_0_7_adr, vec_rsc_0_7_d, vec_rsc_0_7_we,
      vec_rsc_0_7_q, vec_rsc_triosy_0_7_lz, p_rsc_dat, p_rsc_triosy_lz, r_rsc_dat,
      r_rsc_triosy_lz, twiddle_rsc_0_0_adra, twiddle_rsc_0_0_da, twiddle_rsc_0_0_wea,
      twiddle_rsc_0_0_qa, twiddle_rsc_0_0_adrb, twiddle_rsc_0_0_db, twiddle_rsc_0_0_web,
      twiddle_rsc_0_0_qb, twiddle_rsc_triosy_0_0_lz, twiddle_rsc_0_1_adra, twiddle_rsc_0_1_da,
      twiddle_rsc_0_1_wea, twiddle_rsc_0_1_qa, twiddle_rsc_0_1_adrb, twiddle_rsc_0_1_db,
      twiddle_rsc_0_1_web, twiddle_rsc_0_1_qb, twiddle_rsc_triosy_0_1_lz, twiddle_rsc_0_2_adra,
      twiddle_rsc_0_2_da, twiddle_rsc_0_2_wea, twiddle_rsc_0_2_qa, twiddle_rsc_0_2_adrb,
      twiddle_rsc_0_2_db, twiddle_rsc_0_2_web, twiddle_rsc_0_2_qb, twiddle_rsc_triosy_0_2_lz,
      twiddle_rsc_0_3_adra, twiddle_rsc_0_3_da, twiddle_rsc_0_3_wea, twiddle_rsc_0_3_qa,
      twiddle_rsc_0_3_adrb, twiddle_rsc_0_3_db, twiddle_rsc_0_3_web, twiddle_rsc_0_3_qb,
      twiddle_rsc_triosy_0_3_lz, twiddle_h_rsc_0_0_adra, twiddle_h_rsc_0_0_da, twiddle_h_rsc_0_0_wea,
      twiddle_h_rsc_0_0_qa, twiddle_h_rsc_0_0_adrb, twiddle_h_rsc_0_0_db, twiddle_h_rsc_0_0_web,
      twiddle_h_rsc_0_0_qb, twiddle_h_rsc_triosy_0_0_lz, twiddle_h_rsc_0_1_adra,
      twiddle_h_rsc_0_1_da, twiddle_h_rsc_0_1_wea, twiddle_h_rsc_0_1_qa, twiddle_h_rsc_0_1_adrb,
      twiddle_h_rsc_0_1_db, twiddle_h_rsc_0_1_web, twiddle_h_rsc_0_1_qb, twiddle_h_rsc_triosy_0_1_lz,
      twiddle_h_rsc_0_2_adra, twiddle_h_rsc_0_2_da, twiddle_h_rsc_0_2_wea, twiddle_h_rsc_0_2_qa,
      twiddle_h_rsc_0_2_adrb, twiddle_h_rsc_0_2_db, twiddle_h_rsc_0_2_web, twiddle_h_rsc_0_2_qb,
      twiddle_h_rsc_triosy_0_2_lz, twiddle_h_rsc_0_3_adra, twiddle_h_rsc_0_3_da,
      twiddle_h_rsc_0_3_wea, twiddle_h_rsc_0_3_qa, twiddle_h_rsc_0_3_adrb, twiddle_h_rsc_0_3_db,
      twiddle_h_rsc_0_3_web, twiddle_h_rsc_0_3_qb, twiddle_h_rsc_triosy_0_3_lz, complete_rsc_lzout,
      complete_rsc_vzout
);
  input clk;
  input rst;
  output run_rsc_lzin;
  input run_rsc_vzin;
  output [6:0] vec_rsc_0_0_adr;
  output [31:0] vec_rsc_0_0_d;
  output vec_rsc_0_0_we;
  input [31:0] vec_rsc_0_0_q;
  output vec_rsc_triosy_0_0_lz;
  output [6:0] vec_rsc_0_1_adr;
  output [31:0] vec_rsc_0_1_d;
  output vec_rsc_0_1_we;
  input [31:0] vec_rsc_0_1_q;
  output vec_rsc_triosy_0_1_lz;
  output [6:0] vec_rsc_0_2_adr;
  output [31:0] vec_rsc_0_2_d;
  output vec_rsc_0_2_we;
  input [31:0] vec_rsc_0_2_q;
  output vec_rsc_triosy_0_2_lz;
  output [6:0] vec_rsc_0_3_adr;
  output [31:0] vec_rsc_0_3_d;
  output vec_rsc_0_3_we;
  input [31:0] vec_rsc_0_3_q;
  output vec_rsc_triosy_0_3_lz;
  output [6:0] vec_rsc_0_4_adr;
  output [31:0] vec_rsc_0_4_d;
  output vec_rsc_0_4_we;
  input [31:0] vec_rsc_0_4_q;
  output vec_rsc_triosy_0_4_lz;
  output [6:0] vec_rsc_0_5_adr;
  output [31:0] vec_rsc_0_5_d;
  output vec_rsc_0_5_we;
  input [31:0] vec_rsc_0_5_q;
  output vec_rsc_triosy_0_5_lz;
  output [6:0] vec_rsc_0_6_adr;
  output [31:0] vec_rsc_0_6_d;
  output vec_rsc_0_6_we;
  input [31:0] vec_rsc_0_6_q;
  output vec_rsc_triosy_0_6_lz;
  output [6:0] vec_rsc_0_7_adr;
  output [31:0] vec_rsc_0_7_d;
  output vec_rsc_0_7_we;
  input [31:0] vec_rsc_0_7_q;
  output vec_rsc_triosy_0_7_lz;
  input [31:0] p_rsc_dat;
  output p_rsc_triosy_lz;
  input [31:0] r_rsc_dat;
  output r_rsc_triosy_lz;
  output [7:0] twiddle_rsc_0_0_adra;
  output [31:0] twiddle_rsc_0_0_da;
  output twiddle_rsc_0_0_wea;
  input [31:0] twiddle_rsc_0_0_qa;
  output [7:0] twiddle_rsc_0_0_adrb;
  output [31:0] twiddle_rsc_0_0_db;
  output twiddle_rsc_0_0_web;
  input [31:0] twiddle_rsc_0_0_qb;
  output twiddle_rsc_triosy_0_0_lz;
  output [7:0] twiddle_rsc_0_1_adra;
  output [31:0] twiddle_rsc_0_1_da;
  output twiddle_rsc_0_1_wea;
  input [31:0] twiddle_rsc_0_1_qa;
  output [7:0] twiddle_rsc_0_1_adrb;
  output [31:0] twiddle_rsc_0_1_db;
  output twiddle_rsc_0_1_web;
  input [31:0] twiddle_rsc_0_1_qb;
  output twiddle_rsc_triosy_0_1_lz;
  output [7:0] twiddle_rsc_0_2_adra;
  output [31:0] twiddle_rsc_0_2_da;
  output twiddle_rsc_0_2_wea;
  input [31:0] twiddle_rsc_0_2_qa;
  output [7:0] twiddle_rsc_0_2_adrb;
  output [31:0] twiddle_rsc_0_2_db;
  output twiddle_rsc_0_2_web;
  input [31:0] twiddle_rsc_0_2_qb;
  output twiddle_rsc_triosy_0_2_lz;
  output [7:0] twiddle_rsc_0_3_adra;
  output [31:0] twiddle_rsc_0_3_da;
  output twiddle_rsc_0_3_wea;
  input [31:0] twiddle_rsc_0_3_qa;
  output [7:0] twiddle_rsc_0_3_adrb;
  output [31:0] twiddle_rsc_0_3_db;
  output twiddle_rsc_0_3_web;
  input [31:0] twiddle_rsc_0_3_qb;
  output twiddle_rsc_triosy_0_3_lz;
  output [7:0] twiddle_h_rsc_0_0_adra;
  output [31:0] twiddle_h_rsc_0_0_da;
  output twiddle_h_rsc_0_0_wea;
  input [31:0] twiddle_h_rsc_0_0_qa;
  output [7:0] twiddle_h_rsc_0_0_adrb;
  output [31:0] twiddle_h_rsc_0_0_db;
  output twiddle_h_rsc_0_0_web;
  input [31:0] twiddle_h_rsc_0_0_qb;
  output twiddle_h_rsc_triosy_0_0_lz;
  output [7:0] twiddle_h_rsc_0_1_adra;
  output [31:0] twiddle_h_rsc_0_1_da;
  output twiddle_h_rsc_0_1_wea;
  input [31:0] twiddle_h_rsc_0_1_qa;
  output [7:0] twiddle_h_rsc_0_1_adrb;
  output [31:0] twiddle_h_rsc_0_1_db;
  output twiddle_h_rsc_0_1_web;
  input [31:0] twiddle_h_rsc_0_1_qb;
  output twiddle_h_rsc_triosy_0_1_lz;
  output [7:0] twiddle_h_rsc_0_2_adra;
  output [31:0] twiddle_h_rsc_0_2_da;
  output twiddle_h_rsc_0_2_wea;
  input [31:0] twiddle_h_rsc_0_2_qa;
  output [7:0] twiddle_h_rsc_0_2_adrb;
  output [31:0] twiddle_h_rsc_0_2_db;
  output twiddle_h_rsc_0_2_web;
  input [31:0] twiddle_h_rsc_0_2_qb;
  output twiddle_h_rsc_triosy_0_2_lz;
  output [7:0] twiddle_h_rsc_0_3_adra;
  output [31:0] twiddle_h_rsc_0_3_da;
  output twiddle_h_rsc_0_3_wea;
  input [31:0] twiddle_h_rsc_0_3_qa;
  output [7:0] twiddle_h_rsc_0_3_adrb;
  output [31:0] twiddle_h_rsc_0_3_db;
  output twiddle_h_rsc_0_3_web;
  input [31:0] twiddle_h_rsc_0_3_qb;
  output twiddle_h_rsc_triosy_0_3_lz;
  output complete_rsc_lzout;
  input complete_rsc_vzout;


  // Interconnect Declarations
  wire [31:0] vec_rsc_0_0_i_q_d;
  wire vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_1_i_q_d;
  wire vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_2_i_q_d;
  wire vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_3_i_q_d;
  wire vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_4_i_q_d;
  wire vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_5_i_q_d;
  wire vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_6_i_q_d;
  wire vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [31:0] vec_rsc_0_7_i_q_d;
  wire vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_rsc_0_0_i_adra_d;
  wire [63:0] twiddle_rsc_0_0_i_qa_d;
  wire [1:0] twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_rsc_0_1_i_adra_d;
  wire [63:0] twiddle_rsc_0_1_i_qa_d;
  wire [1:0] twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_rsc_0_2_i_adra_d;
  wire [63:0] twiddle_rsc_0_2_i_qa_d;
  wire [1:0] twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_rsc_0_3_i_adra_d;
  wire [63:0] twiddle_rsc_0_3_i_qa_d;
  wire [1:0] twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_h_rsc_0_0_i_adra_d;
  wire [63:0] twiddle_h_rsc_0_0_i_qa_d;
  wire [1:0] twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_h_rsc_0_1_i_adra_d;
  wire [63:0] twiddle_h_rsc_0_1_i_qa_d;
  wire [1:0] twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_h_rsc_0_2_i_adra_d;
  wire [63:0] twiddle_h_rsc_0_2_i_qa_d;
  wire [1:0] twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] twiddle_h_rsc_0_3_i_adra_d;
  wire [63:0] twiddle_h_rsc_0_3_i_qa_d;
  wire [1:0] twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d;
  wire [6:0] vec_rsc_0_0_i_adr_d_iff;
  wire [31:0] vec_rsc_0_0_i_d_d_iff;
  wire vec_rsc_0_0_i_we_d_iff;
  wire vec_rsc_0_1_i_we_d_iff;
  wire vec_rsc_0_2_i_we_d_iff;
  wire vec_rsc_0_3_i_we_d_iff;
  wire vec_rsc_0_4_i_we_d_iff;
  wire vec_rsc_0_5_i_we_d_iff;
  wire vec_rsc_0_6_i_we_d_iff;
  wire vec_rsc_0_7_i_we_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [15:0] nl_twiddle_rsc_0_0_i_adra_d;
  assign nl_twiddle_rsc_0_0_i_adra_d = {8'b00000000 , twiddle_rsc_0_0_i_adra_d};
  wire [15:0] nl_twiddle_rsc_0_1_i_adra_d;
  assign nl_twiddle_rsc_0_1_i_adra_d = {8'b00000000 , twiddle_rsc_0_1_i_adra_d};
  wire [15:0] nl_twiddle_rsc_0_2_i_adra_d;
  assign nl_twiddle_rsc_0_2_i_adra_d = {8'b00000000 , twiddle_rsc_0_2_i_adra_d};
  wire [15:0] nl_twiddle_rsc_0_3_i_adra_d;
  assign nl_twiddle_rsc_0_3_i_adra_d = {8'b00000000 , twiddle_rsc_0_3_i_adra_d};
  wire [15:0] nl_twiddle_h_rsc_0_0_i_adra_d;
  assign nl_twiddle_h_rsc_0_0_i_adra_d = {8'b00000000 , twiddle_h_rsc_0_0_i_adra_d};
  wire [15:0] nl_twiddle_h_rsc_0_1_i_adra_d;
  assign nl_twiddle_h_rsc_0_1_i_adra_d = {8'b00000000 , twiddle_h_rsc_0_1_i_adra_d};
  wire [15:0] nl_twiddle_h_rsc_0_2_i_adra_d;
  assign nl_twiddle_h_rsc_0_2_i_adra_d = {8'b00000000 , twiddle_h_rsc_0_2_i_adra_d};
  wire [15:0] nl_twiddle_h_rsc_0_3_i_adra_d;
  assign nl_twiddle_h_rsc_0_3_i_adra_d = {8'b00000000 , twiddle_h_rsc_0_3_i_adra_d};
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_22_7_32_128_128_32_1_gen
      vec_rsc_0_0_i (
      .q(vec_rsc_0_0_q),
      .we(vec_rsc_0_0_we),
      .d(vec_rsc_0_0_d),
      .adr(vec_rsc_0_0_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_0_i_q_d),
      .we_d(vec_rsc_0_0_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_0_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_23_7_32_128_128_32_1_gen
      vec_rsc_0_1_i (
      .q(vec_rsc_0_1_q),
      .we(vec_rsc_0_1_we),
      .d(vec_rsc_0_1_d),
      .adr(vec_rsc_0_1_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_1_i_q_d),
      .we_d(vec_rsc_0_1_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_1_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_24_7_32_128_128_32_1_gen
      vec_rsc_0_2_i (
      .q(vec_rsc_0_2_q),
      .we(vec_rsc_0_2_we),
      .d(vec_rsc_0_2_d),
      .adr(vec_rsc_0_2_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_2_i_q_d),
      .we_d(vec_rsc_0_2_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_2_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_25_7_32_128_128_32_1_gen
      vec_rsc_0_3_i (
      .q(vec_rsc_0_3_q),
      .we(vec_rsc_0_3_we),
      .d(vec_rsc_0_3_d),
      .adr(vec_rsc_0_3_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_3_i_q_d),
      .we_d(vec_rsc_0_3_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_3_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_26_7_32_128_128_32_1_gen
      vec_rsc_0_4_i (
      .q(vec_rsc_0_4_q),
      .we(vec_rsc_0_4_we),
      .d(vec_rsc_0_4_d),
      .adr(vec_rsc_0_4_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_4_i_q_d),
      .we_d(vec_rsc_0_4_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_4_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_27_7_32_128_128_32_1_gen
      vec_rsc_0_5_i (
      .q(vec_rsc_0_5_q),
      .we(vec_rsc_0_5_we),
      .d(vec_rsc_0_5_d),
      .adr(vec_rsc_0_5_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_5_i_q_d),
      .we_d(vec_rsc_0_5_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_5_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_28_7_32_128_128_32_1_gen
      vec_rsc_0_6_i (
      .q(vec_rsc_0_6_q),
      .we(vec_rsc_0_6_we),
      .d(vec_rsc_0_6_d),
      .adr(vec_rsc_0_6_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_6_i_q_d),
      .we_d(vec_rsc_0_6_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_6_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_29_7_32_128_128_32_1_gen
      vec_rsc_0_7_i (
      .q(vec_rsc_0_7_q),
      .we(vec_rsc_0_7_we),
      .d(vec_rsc_0_7_d),
      .adr(vec_rsc_0_7_adr),
      .adr_d(vec_rsc_0_0_i_adr_d_iff),
      .d_d(vec_rsc_0_0_i_d_d_iff),
      .q_d(vec_rsc_0_7_i_q_d),
      .we_d(vec_rsc_0_7_i_we_d_iff),
      .rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .rw_rw_ram_ir_internal_WMASK_B_d(vec_rsc_0_7_i_we_d_iff)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_30_8_32_256_256_32_1_gen
      twiddle_rsc_0_0_i (
      .qb(twiddle_rsc_0_0_qb),
      .web(twiddle_rsc_0_0_web),
      .db(twiddle_rsc_0_0_db),
      .adrb(twiddle_rsc_0_0_adrb),
      .qa(twiddle_rsc_0_0_qa),
      .wea(twiddle_rsc_0_0_wea),
      .da(twiddle_rsc_0_0_da),
      .adra(twiddle_rsc_0_0_adra),
      .adra_d(nl_twiddle_rsc_0_0_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsc_0_0_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_31_8_32_256_256_32_1_gen
      twiddle_rsc_0_1_i (
      .qb(twiddle_rsc_0_1_qb),
      .web(twiddle_rsc_0_1_web),
      .db(twiddle_rsc_0_1_db),
      .adrb(twiddle_rsc_0_1_adrb),
      .qa(twiddle_rsc_0_1_qa),
      .wea(twiddle_rsc_0_1_wea),
      .da(twiddle_rsc_0_1_da),
      .adra(twiddle_rsc_0_1_adra),
      .adra_d(nl_twiddle_rsc_0_1_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsc_0_1_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_32_8_32_256_256_32_1_gen
      twiddle_rsc_0_2_i (
      .qb(twiddle_rsc_0_2_qb),
      .web(twiddle_rsc_0_2_web),
      .db(twiddle_rsc_0_2_db),
      .adrb(twiddle_rsc_0_2_adrb),
      .qa(twiddle_rsc_0_2_qa),
      .wea(twiddle_rsc_0_2_wea),
      .da(twiddle_rsc_0_2_da),
      .adra(twiddle_rsc_0_2_adra),
      .adra_d(nl_twiddle_rsc_0_2_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsc_0_2_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_33_8_32_256_256_32_1_gen
      twiddle_rsc_0_3_i (
      .qb(twiddle_rsc_0_3_qb),
      .web(twiddle_rsc_0_3_web),
      .db(twiddle_rsc_0_3_db),
      .adrb(twiddle_rsc_0_3_adrb),
      .qa(twiddle_rsc_0_3_qa),
      .wea(twiddle_rsc_0_3_wea),
      .da(twiddle_rsc_0_3_da),
      .adra(twiddle_rsc_0_3_adra),
      .adra_d(nl_twiddle_rsc_0_3_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_rsc_0_3_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_34_8_32_256_256_32_1_gen
      twiddle_h_rsc_0_0_i (
      .qb(twiddle_h_rsc_0_0_qb),
      .web(twiddle_h_rsc_0_0_web),
      .db(twiddle_h_rsc_0_0_db),
      .adrb(twiddle_h_rsc_0_0_adrb),
      .qa(twiddle_h_rsc_0_0_qa),
      .wea(twiddle_h_rsc_0_0_wea),
      .da(twiddle_h_rsc_0_0_da),
      .adra(twiddle_h_rsc_0_0_adra),
      .adra_d(nl_twiddle_h_rsc_0_0_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsc_0_0_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_35_8_32_256_256_32_1_gen
      twiddle_h_rsc_0_1_i (
      .qb(twiddle_h_rsc_0_1_qb),
      .web(twiddle_h_rsc_0_1_web),
      .db(twiddle_h_rsc_0_1_db),
      .adrb(twiddle_h_rsc_0_1_adrb),
      .qa(twiddle_h_rsc_0_1_qa),
      .wea(twiddle_h_rsc_0_1_wea),
      .da(twiddle_h_rsc_0_1_da),
      .adra(twiddle_h_rsc_0_1_adra),
      .adra_d(nl_twiddle_h_rsc_0_1_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsc_0_1_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_36_8_32_256_256_32_1_gen
      twiddle_h_rsc_0_2_i (
      .qb(twiddle_h_rsc_0_2_qb),
      .web(twiddle_h_rsc_0_2_web),
      .db(twiddle_h_rsc_0_2_db),
      .adrb(twiddle_h_rsc_0_2_adrb),
      .qa(twiddle_h_rsc_0_2_qa),
      .wea(twiddle_h_rsc_0_2_wea),
      .da(twiddle_h_rsc_0_2_da),
      .adra(twiddle_h_rsc_0_2_adra),
      .adra_d(nl_twiddle_h_rsc_0_2_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsc_0_2_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_Xilinx_RAMS_BLOCK_DPRAM_RBW_rwport_37_8_32_256_256_32_1_gen
      twiddle_h_rsc_0_3_i (
      .qb(twiddle_h_rsc_0_3_qb),
      .web(twiddle_h_rsc_0_3_web),
      .db(twiddle_h_rsc_0_3_db),
      .adrb(twiddle_h_rsc_0_3_adrb),
      .qa(twiddle_h_rsc_0_3_qa),
      .wea(twiddle_h_rsc_0_3_wea),
      .da(twiddle_h_rsc_0_3_da),
      .adra(twiddle_h_rsc_0_3_adra),
      .adra_d(nl_twiddle_h_rsc_0_3_i_adra_d[15:0]),
      .da_d(64'b0000000000000000000000000000000000000000000000000000000000000000),
      .qa_d(twiddle_h_rsc_0_3_i_qa_d),
      .wea_d(2'b00),
      .rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .rwA_rw_ram_ir_internal_WMASK_B_d(2'b00)
    );
  inPlaceNTT_DIF_precomp_core inPlaceNTT_DIF_precomp_core_inst (
      .clk(clk),
      .rst(rst),
      .run_rsc_lzin(run_rsc_lzin),
      .run_rsc_vzin(run_rsc_vzin),
      .vec_rsc_triosy_0_0_lz(vec_rsc_triosy_0_0_lz),
      .vec_rsc_triosy_0_1_lz(vec_rsc_triosy_0_1_lz),
      .vec_rsc_triosy_0_2_lz(vec_rsc_triosy_0_2_lz),
      .vec_rsc_triosy_0_3_lz(vec_rsc_triosy_0_3_lz),
      .vec_rsc_triosy_0_4_lz(vec_rsc_triosy_0_4_lz),
      .vec_rsc_triosy_0_5_lz(vec_rsc_triosy_0_5_lz),
      .vec_rsc_triosy_0_6_lz(vec_rsc_triosy_0_6_lz),
      .vec_rsc_triosy_0_7_lz(vec_rsc_triosy_0_7_lz),
      .p_rsc_dat(p_rsc_dat),
      .p_rsc_triosy_lz(p_rsc_triosy_lz),
      .r_rsc_triosy_lz(r_rsc_triosy_lz),
      .twiddle_rsc_triosy_0_0_lz(twiddle_rsc_triosy_0_0_lz),
      .twiddle_rsc_triosy_0_1_lz(twiddle_rsc_triosy_0_1_lz),
      .twiddle_rsc_triosy_0_2_lz(twiddle_rsc_triosy_0_2_lz),
      .twiddle_rsc_triosy_0_3_lz(twiddle_rsc_triosy_0_3_lz),
      .twiddle_h_rsc_triosy_0_0_lz(twiddle_h_rsc_triosy_0_0_lz),
      .twiddle_h_rsc_triosy_0_1_lz(twiddle_h_rsc_triosy_0_1_lz),
      .twiddle_h_rsc_triosy_0_2_lz(twiddle_h_rsc_triosy_0_2_lz),
      .twiddle_h_rsc_triosy_0_3_lz(twiddle_h_rsc_triosy_0_3_lz),
      .complete_rsc_lzout(complete_rsc_lzout),
      .complete_rsc_vzout(complete_rsc_vzout),
      .vec_rsc_0_0_i_q_d(vec_rsc_0_0_i_q_d),
      .vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_0_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_1_i_q_d(vec_rsc_0_1_i_q_d),
      .vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_1_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_2_i_q_d(vec_rsc_0_2_i_q_d),
      .vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_2_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_3_i_q_d(vec_rsc_0_3_i_q_d),
      .vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_3_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_4_i_q_d(vec_rsc_0_4_i_q_d),
      .vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_4_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_5_i_q_d(vec_rsc_0_5_i_q_d),
      .vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_5_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_6_i_q_d(vec_rsc_0_6_i_q_d),
      .vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_6_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_7_i_q_d(vec_rsc_0_7_i_q_d),
      .vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d(vec_rsc_0_7_i_rw_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_0_i_adra_d(twiddle_rsc_0_0_i_adra_d),
      .twiddle_rsc_0_0_i_qa_d(twiddle_rsc_0_0_i_qa_d),
      .twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_1_i_adra_d(twiddle_rsc_0_1_i_adra_d),
      .twiddle_rsc_0_1_i_qa_d(twiddle_rsc_0_1_i_qa_d),
      .twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_2_i_adra_d(twiddle_rsc_0_2_i_adra_d),
      .twiddle_rsc_0_2_i_qa_d(twiddle_rsc_0_2_i_qa_d),
      .twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_rsc_0_3_i_adra_d(twiddle_rsc_0_3_i_adra_d),
      .twiddle_rsc_0_3_i_qa_d(twiddle_rsc_0_3_i_qa_d),
      .twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsc_0_0_i_adra_d(twiddle_h_rsc_0_0_i_adra_d),
      .twiddle_h_rsc_0_0_i_qa_d(twiddle_h_rsc_0_0_i_qa_d),
      .twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_0_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsc_0_1_i_adra_d(twiddle_h_rsc_0_1_i_adra_d),
      .twiddle_h_rsc_0_1_i_qa_d(twiddle_h_rsc_0_1_i_qa_d),
      .twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_1_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsc_0_2_i_adra_d(twiddle_h_rsc_0_2_i_adra_d),
      .twiddle_h_rsc_0_2_i_qa_d(twiddle_h_rsc_0_2_i_qa_d),
      .twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_2_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .twiddle_h_rsc_0_3_i_adra_d(twiddle_h_rsc_0_3_i_adra_d),
      .twiddle_h_rsc_0_3_i_qa_d(twiddle_h_rsc_0_3_i_qa_d),
      .twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d(twiddle_h_rsc_0_3_i_rwA_rw_ram_ir_internal_RMASK_B_d),
      .vec_rsc_0_0_i_adr_d_pff(vec_rsc_0_0_i_adr_d_iff),
      .vec_rsc_0_0_i_d_d_pff(vec_rsc_0_0_i_d_d_iff),
      .vec_rsc_0_0_i_we_d_pff(vec_rsc_0_0_i_we_d_iff),
      .vec_rsc_0_1_i_we_d_pff(vec_rsc_0_1_i_we_d_iff),
      .vec_rsc_0_2_i_we_d_pff(vec_rsc_0_2_i_we_d_iff),
      .vec_rsc_0_3_i_we_d_pff(vec_rsc_0_3_i_we_d_iff),
      .vec_rsc_0_4_i_we_d_pff(vec_rsc_0_4_i_we_d_iff),
      .vec_rsc_0_5_i_we_d_pff(vec_rsc_0_5_i_we_d_iff),
      .vec_rsc_0_6_i_we_d_pff(vec_rsc_0_6_i_we_d_iff),
      .vec_rsc_0_7_i_we_d_pff(vec_rsc_0_7_i_we_d_iff)
    );
endmodule



